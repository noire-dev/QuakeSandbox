/*
===========================================================================
// Project: Quake Sandbox - Noire.Script
// File: ns_main.c
// Description: Noire.Script (NS) is a lightweight scripting 
//              language designed for Quake Sandbox. It enables 
//              dynamic interaction with game logic, UI, and 
//              server-side functionality, offering flexibility 
//              in modding and gameplay customization.
// Features: - Support for game events and triggers
//           - Integration with game entities and UI
//           - Easy-to-write syntax for creating complex behaviors
//           - Modular structure for server and client-side scripts
===========================================================================
*/

#include "ns_local.h"

/*
###############
Парсинг
###############
*/

// Список операторов для парсера
const char* operators[] = {
    "=", "+", "-", "*", "/", "==", "!=", "<", ">", "<=", ">="
};
const int num_operators = sizeof(operators) / sizeof(operators[0]);

int is_operator(const char* token) {
    int i;

    for (i = 0; i < num_operators; i++) {
        if (strcmp(token, operators[i]) == 0) {
            return 1; // Это оператор
        }
    }
    return 0; // Не оператор
}

int is_literal(const char* token) {
    int i;

    if (token[0] == '"' || token[0] == '\'') {
        return 1; // Это литерал
    }
    return 0; // Не литерал
}

char* NS_Parse(char** p) {
    char* token;
    char* s = *p;
    size_t len;
    char* result;

    // Пропустим пробелы
    while (*s) {
        // Пропустим \t
        while (*s && (*s == ' ' || *s == '\t')) {
            s++;
        }

        // Проверяем одно-строчный комментарий
        if (s[0] == '/' && s[1] == '/') {
            while (*s && *s != '\n') { // Пропустим до конца строки
                s++;
            }
            continue; // Идем дальше собирать токены
        }

        // Проверяем много-строчный комментарий
        if (s[0] == '/' && s[1] == '*') {
            s += 2; // Пропускаем '/*'
            while (*s) {
                if (s[0] == '*' && s[1] == '/') {
                    s += 2; // Пропускаем '*/'
                    break; // Идем дальше собирать токены
                }
                s++;
            }
            continue; // Идем дальше собирать токены
        }
        // Проверяем на строковые литералы
        if (*s == '"' || *s == '\'') {
            char quote = *s; // Сохраняем тип кавычек
            char* token = s; // Сохраняем начало токена
            s++; // Пропускаем открывающую кавычку
    
            // Ищем конец строкового литерала
            while (*s) {
                if (*s == quote && *(s - 1) != '\\') {
                    s++; // Пропускаем закрывающую кавычку
                    break; // Закрывающая кавычка найдена
                }
                s++;
            }

            // Завершаем токен, не изменяя строку
            len = s - token;
            result = (char*)Q_malloc(len + 1);
            strncpy(result, token, len);
            result[len] = '\0';

            *p = s; // Обновляем указатель
            return result; // Возвращаем найденный токен
        }

        if (*s == '\0') {
            *p = s; // Обновим указатель
            return NULL; // Достигнут конец строки
        }

        token = s; // Старт токена

        // Ищем конец токена
        while (*s && *s != ' ' && *s != '\t' && *s != '\n' && *s != ';' && *s != ',' && *s != '(' && *s != ')') {
            s++;
        }

        if (*s) {
            *s++ = '\0'; // Завершаем токен
        }

        *p = s; // Обновим указатель

        return token; // Вернем найденный токен
    }

    *p = s; // Обновим указатель
    return NULL; // Не нашли ничего
}

/*
###############
Переменные
###############
*/

// Массив переменных
Variable variables[MAX_VARS];
int var_count = 0;

// Функция для добавления переменной
int add_variable(const char *name, VarValue value, VarType type) {
    int i;
    // Проверяем, существует ли уже переменная с таким именем
    for (i = 0; i < var_count; i++) {
        if (strcmp(variables[i].name, name) == 0) {
            Com_Printf("Noire.Script: variable '%s' redefinition.\n", name);
            return 0; // Переменная уже существует
        }
    }

    if (var_count < MAX_VARS) {
        strcpy(variables[var_count].name, name);
        variables[var_count].value = value;
        variables[var_count].type = type;
        var_count++;
        return 1; // Успешно добавлено
    }
    return 0; // Ошибка: превышено максимальное количество переменных
}

// Функция для добавления переменной
int set_variable(const char *name, VarValue value, VarType type, const char *operation) {
    int i;

    for (i = 0; i < var_count; i++) {
        if (strcmp(variables[i].name, name) == 0) {
            // Выполняем операцию
            if (strcmp(operation, "=") == 0) {
                variables[i].value = value;
            } else if (strcmp(operation, "+=") == 0) {
                if (type == TYPE_INT) {
                    variables[i].value.i += value.i;
                } else if (type == TYPE_FLOAT) {
                    variables[i].value.f += value.f;
                }
            } else if (strcmp(operation, "-=") == 0) {
                if (type == TYPE_INT) {
                    variables[i].value.i -= value.i;
                } else if (type == TYPE_FLOAT) {
                    variables[i].value.f -= value.f;
                }
            } else if (strcmp(operation, "*=") == 0) {
                if (type == TYPE_INT) {
                    variables[i].value.i *= value.i;
                } else if (type == TYPE_FLOAT) {
                    variables[i].value.f *= value.f;
                }
            } else if (strcmp(operation, "/=") == 0) {
                if (type == TYPE_INT) {
                    if (value.i == 0) {
                        Com_Printf("Noire.Script: Divide by zero for variable '%s'.\n", name);
                        return 0;
                    }
                    variables[i].value.i /= value.i;
                } else if (type == TYPE_FLOAT) {
                    if (value.f == 0.0f) {
                        Com_Printf("Noire.Script: Divide by zero for variable '%s'.\n", name);
                        return 0;
                    }
                    variables[i].value.f /= value.f;
                }
            } else {
                Com_Printf("Noire.Script: Unknown operator '%s'.\n", operation);
                return 0;
            }

            Com_Printf("Noire.Script: Variable '%s' updated with operator '%s'.\n", name, operation);
            return 1; // Успешно обновлено
        }
    }

    Com_Printf("Noire.Script: Variable '%s' not found.\n", name);
    return 0; // Переменная не найдена
}

// Функция для отображения переменных
void print_variables() {
    int i;

    for (i = 0; i < var_count; i++) {
        Com_Printf("Noire.Script: Variable: %s, ", variables[i].name);
        switch (variables[i].type) {
            case TYPE_CHAR:
                Com_Printf("type = char, value = %s\n", variables[i].value.c);
                break;
            case TYPE_INT:
                Com_Printf("type = int, value = %d\n", variables[i].value.i);
                break;
            case TYPE_FLOAT:
                Com_Printf("type = float, value = %.6f\n", variables[i].value.f);
                break;
            default:
                Com_Printf("type = INVALID\n");
                break;
        }
    }
}

// Функция для поиска переменной по имени
Variable* find_variable(const char *name) {
    int i;

    for (i = 0; i < var_count; i++) {
        if (strcmp(variables[i].name, name) == 0) {
            return &variables[i];
        }
    }
    return NULL; // Переменная не найдена
}

void removeQuotes(const char *name) {
    char temp[MAX_VAR_CHAR_BUF]; // Временный массив для хранения результата
    int j = 0; // Индекс для временного массива
    int i;
    Variable* var;

    var = find_variable(name);

    for (i = 0; var->value.c[i] != '\0'; i++) {
        // Пропускаем кавычки
        if (var->value.c[i] != '"' && var->value.c[i] != '\'') {
            temp[j++] = var->value.c[i];
        }
    }
    temp[j] = '\0'; // Завершаем строку нулевым символом
    strcpy(var->value.c, temp); // Копируем результат обратно в исходную строку
}

/*
###############
Выражения
###############
*/

float NS_evaluateExpression(const char* expr) {
    float result = 0;
    float currentNumber = 0;
    float decimalFactor = 1; // Для обработки десятичной части
    char operation = '+'; // Начинаем с операции сложения
    int i;
    Variable* var;

    for (i = 0; expr[i] != '\0'; ++i) {
        char currentChar = expr[i];

        if (isdigit(currentChar)) {
            currentNumber = currentNumber * 10 + (currentChar - '0'); // Обработка многозначных чисел
        } 
        else if (currentChar == '.') {
            // Обработка десятичной точки
            decimalFactor = 0.1f; // Начинаем с 0.1 для первой цифры после точки
            currentChar = expr[++i]; // Переходим к следующему символу после точки

            while (isdigit(currentChar)) {
                currentNumber += (currentChar - '0') * decimalFactor; // Добавляем цифру к текущему числу
                decimalFactor *= 0.1f; // Уменьшаем десятичный фактор
                currentChar = expr[++i]; // Переходим к следующему символу
            }

            --i; // Уменьшаем i, чтобы вернуться к текущему символу
        }

        // Обработка переменных
        else if (isalpha(currentChar)) {
            char varName[MAX_VAR_NAME]; // Предполагаем, что имя переменной не превышает 99 символов
            int j = 0;

            // Считываем имя переменной
            while (isalnum(currentChar) || currentChar == '_') {
                varName[j++] = currentChar;
                currentChar = expr[++i];
            }
            varName[j] = '\0'; // Завершаем строку

            // Находим переменную
            var = find_variable(varName);
            if (var != NULL) {
                // Используем значение переменной в зависимости от её типа
                if (var->type == TYPE_INT) { // int
                    currentNumber = (float)var->value.i;
                } else if (var->type == TYPE_FLOAT) { // float
                    currentNumber = var->value.f;
                }
            } else {
                Com_Printf("Noire.Script: Warning: variable '%s' not found\n", varName);
                currentNumber = 0; // Вернуть 0
            }

            // Сдвиг индекса, чтобы не обрабатывать текущий символ ещё раз
            --i; // Уменьшаем i, чтобы вернуться к текущему символу
        }

        // Если текущий символ - оператор или последний символ строки
        if (!isdigit(currentChar) && currentChar != ' ' || expr[i + 1] == '\0') {
            switch (operation) {
                case '+': result += currentNumber; break;
                case '-': result -= currentNumber; break;
                case '*': result *= currentNumber; break;
                case '/':
                    if (currentNumber != 0) {
                        result /= currentNumber; 
                    } else {
                        Com_Printf("Noire.Script: Error: divide by zero\n");
                        return 0.0;
                    }
                    break;
            }
            currentNumber = 0; // Сбрасываем текущее число
            decimalFactor = 1; // Сбрасываем фактор десятичной части
            operation = currentChar; // Устанавливаем текущую операцию
        }
    }
    return result;
}

// Функция для обработки текста с подстановкой значений переменных через $
char* NS_evaluateText(const char *input) {
    // Создаем буфер для результирующей строки
    char *result = (char*)Q_malloc(MAX_VAR_CHAR_BUF);
    int resultIndex = 0; // Индекс для результирующей строки
    char placeholder[MAX_VAR_NAME + 2]; // $ + имя переменной
    char value[100]; // Буфер для значения
    Variable* var;
    int i;
    int k;

    if (!result) {
        Com_Printf("Noire.Script: Error: Memory allocation failed\n");
        return NULL;
    }

    for (i = 0; input[i] != '\0'; i++) {
        if (input[i] == '$') {
            int j = 0;
            i++; // Пропускаем символ $

            // Считываем имя переменной
            while (isalnum(input[i]) || input[i] == '_') {
                placeholder[j++] = input[i++];
            }
            placeholder[j] = '\0'; // Завершаем строку имени переменной

            // Находим переменную
            var = find_variable(placeholder);
            if (var != NULL) {
                // Используем значение переменной в зависимости от её типа
                if (var->type == TYPE_CHAR) {
                    // Удаляем кавычки из значения
                    removeQuotes(var->value.c);
                    strcpy(value, var->value.c);
                } else if (var->type == TYPE_INT) {
                    Q_snprintf(value, sizeof(value), "%d", var->value.i);
                } else if (var->type == TYPE_FLOAT) {
                    Q_snprintf(value, sizeof(value), "%.6f", var->value.f);
                }

                // Копируем значение переменной в результирующую строку
                for (k = 0; value[k] != '\0'; k++) {
                    result[resultIndex++] = value[k];
                }
            } else {
                // Если переменная не найдена, просто добавляем '$' и имя
                result[resultIndex++] = '$';
                for (k = 0; placeholder[k] != '\0'; k++) {
                    result[resultIndex++] = placeholder[k];
                }
            }
            i--; // Уменьшаем i, чтобы не пропустить символ после переменной
        } else {
            result[resultIndex++] = input[i]; // Копируем обычные символы
        }
    }
    result[resultIndex] = '\0'; // Завершаем результирующую строку

    return result;
}



void* NS_calculate(const char* expression, VarType type) {
    float result = NS_evaluateExpression(expression);

    if (type == TYPE_INT) {
        int* intResult = (int*)Q_malloc(sizeof(int));
        *intResult = (int)result;
        return intResult;
    } else if (type == TYPE_FLOAT) {
        float* floatResult = (float*)Q_malloc(sizeof(float));
        *floatResult = result;
        return floatResult;
    } else {
        Com_Printf("Noire.Script: Error: Unsupported type\n");
        return NULL;
    }
}

/*
###############
Функции
###############
*/

// Массив с названиями функций
const char *function_list[MAX_FUNCS] = {
    "print",
    "variables_list",
    "command",
    "get_cvar"
};

// Функция для проверки, является ли строка названием функции
int is_function(const char *token) {
    int i;
    
    for (i = 0; i < MAX_FUNCS; i++) {
        if (strcmp(token, function_list[i]) == 0) {
            return 1;  // Нашли функцию
        }
    }
    return 0;  // Не является функцией
}

// Функция для проверки, является ли строка названием функции
int is_operand(const char *token) {

    if(is_literal(token)){
        return 0;  // Не является операндом   
    }
    if(is_operator(token)){
        return 0;  // Не является операндом   
    }
    if(is_function(token)){
        return 0;  // Не является операндом   
    }
    return 1;  // Это операнд
}

/*
###############
Выполнение
###############
*/

void NS_ExecuteScript(char* script) {
    char *pointer = script; // Указатель начала скрипта
    char *token;
    Variable* var;

    while ((token = NS_Parse(&pointer)) != NULL) {
        if (token[0] == 0) {
            continue; // Пропускаем пустые токены
        }

        // Обработка токена
        #ifdef NS_DEBUG_TOKEN
        if (is_operator(token)) {
            Com_Printf("Noire.Script: Operator token: %s\n", token);
        } else if (is_literal(token)) {
            Com_Printf("Noire.Script: String literal token: %s\n", token);
        } else if (is_function(token)) {
            Com_Printf("Noire.Script: Function token: %s\n", token);
        } else {
            Com_Printf("Noire.Script: Operand token: %s\n", token);
        }
        #endif

        // Проверяем, является ли токен объявлением переменной
        if (strcmp(token, "int") == 0 || strcmp(token, "float") == 0 || strcmp(token, "char") == 0) {
            // Получаем имя переменной
            char* varName = NS_Parse(&pointer);
            char*  resultName;
            VarValue resultValue;
            VarType  resultType;

            // Копируем имя переменной
            CopyAllocLen(resultName, varName);

            // Устанавливаем тип переменной
            if (strcmp(token, "int") == 0) {
                resultType = TYPE_INT;
            } else if (strcmp(token, "float") == 0) {
                resultType = TYPE_FLOAT;
            } else if (strcmp(token, "char") == 0) {
                resultType = TYPE_CHAR; // Используем строку для хранения char
            } else {
                resultType = TYPE_INVALID; // Используем строку для хранения char
            }

            // Проверяем следующий токен на знак присваивания
            token = NS_Parse(&pointer);
            if (token != NULL && strcmp(token, "=") == 0) {
                // Получаем следующее значение
                char* valueToken = NS_Parse(&pointer);
                if (valueToken != NULL) {
                    // Устанавливаем значение переменной в зависимости от её типа
                    switch (resultType) {
                        case TYPE_INT: {
                            int* temp = (int*)NS_calculate(valueToken, TYPE_INT);
                            if (temp) {
                                resultValue.i = *temp;
                                Q_free(temp);
                            } else {
                                Com_Printf("Noire.Script: Variable %s: Initial value error.", varName);
                            }
                            break;
                        }
                        case TYPE_FLOAT: {
                            float* temp = (float*)NS_calculate(valueToken, TYPE_FLOAT);
                            if (temp) {
                                resultValue.f = *temp; // Разыменование указателя для получения значения
                                Q_free(temp);
                            } else {
                                Com_Printf("Noire.Script: Variable %s: Initial value error.", resultName);
                            }
                            break;
                        }
                        case TYPE_CHAR: { // Для char мы можем использовать строку
                            removeQuotes(valueToken);       //TEST
                            CopyAllocLen(resultValue.c, NS_evaluateText(valueToken));
                            break;
                        }
                    }
                }
            }
            // Добавляем переменную в список
            add_variable(resultName, resultValue, resultType);

            continue; // Переходим к следующему токену
        }

        // Проверка, является ли токен именем переменной
        var = find_variable(token);
        if (var != NULL) {
            VarValue resultValue;
            char*     resultOperator;

            // Проверяем следующий токен на оператор
            token = NS_Parse(&pointer);
            if (is_operator(token)) {
                char* valueToken;

                CopyAllocLen(resultOperator, token);    //сохраняем оператор
                // Получаем следующее значение
                valueToken = NS_Parse(&pointer);
                if (valueToken != NULL) {
                    // Устанавливаем значение переменной в зависимости от её типа
                    switch (var->type) {
                        case TYPE_INT: {
                            int* temp = (int*)NS_calculate(valueToken, TYPE_INT);
                            if (temp) {
                                resultValue.i = *temp;
                                Q_free(temp);
                            } else {
                                Com_Printf("Noire.Script: Variable %s: Calculate value error.", var->name);
                            }
                            break;
                        }
                        case TYPE_FLOAT: {
                            float* temp = (float*)NS_calculate(valueToken, TYPE_FLOAT);
                            if (temp) {
                                resultValue.f = *temp; // Разыменование указателя для получения значения
                                Q_free(temp);
                            } else {
                                Com_Printf("Noire.Script: Variable %s: Calculate value error.", var->name);
                            }
                            break;
                        }
                        case TYPE_CHAR: { // Для char мы можем использовать строку
                            removeQuotes(valueToken);       //TEST
                            CopyAllocLen(resultValue.c, valueToken);
                            break;
                        }
                    }
                }
            }
            // Добавляем переменную в список
            set_variable(var->name, resultValue, var->type, resultOperator);

            continue; // Переходим к следующему токену
        }
    }
}

void NS_OpenScript(const char* filename) {
    int len;
    fileHandle_t f;
    char buffer[MAX_FILE_SIZE];

    // Открыть скрипт с .ns расширением
    len = trap_FS_FOpenFile(filename, &f, FS_READ);

    if (len <= 0) {
        // Если файл NULL его не открыть
        Com_Printf("Noire.Script: Could not open script file %s\n", filename);
        return;
    }

    // Читаем файл прям в буфер
    trap_FS_Read(buffer, len, f);
    buffer[len] = '\0'; // Терминальный ноль строки

    // Закроем файл
    trap_FS_FCloseFile(f);

    // Запустим скрипт
    NS_ExecuteScript(buffer);
}
