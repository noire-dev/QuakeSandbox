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
    "=", "+", "-", "*", "/", "==", "!=", "<", ">", "<=", ">=", "+=", "-=", "/=", "*="
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
    char* result = NULL; // Инициализация указателя

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
            if (!result) return NULL; // Проверка на успешное выделение памяти
        
            strncpy(result, token, len);
            result[len] = '\0';

            *p = s; // Обновляем указатель
            return result; // Возвращаем найденный токен
        }

        // Обработка содержимого скобок
        if (*s == '(') {
            char* token = s; // Сохраняем начало токена
            s++; // Пропускаем открывающую скобку
        
            // Ищем конец содержимого скобок
            while (*s) {
                if (*s == ')') {
                    s++; // Пропускаем закрывающую скобку
                    break; // Закрывающая скобка найдена
                }
                s++;
            }
        
            // Завершаем токен, не изменяя строку
            len = s - token;
            result = (char*)Q_malloc(len + 1);
            if (!result) return NULL; // Проверка на успешное выделение памяти
        
            // Копируем содержимое между скобками
            strncpy(result, token, len);
            result[len] = '\0'; // Завершаем строку
        
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

        // Возвращаем токен как строку
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

    if (name == NULL) {
        Com_Printf("Noire.Script: variable name cannot be NULL.\n");
        return 0; // Имя переменной не может быть NULL
    }

    if (var_count < MAX_VARS) {
        strncpy(variables[var_count].name, name, MAX_VAR_NAME);
        variables[var_count].name[MAX_VAR_NAME - 1] = '\0'; // Завершаем строку
        variables[var_count].value = value;
        variables[var_count].type = type;
        var_count++;
        return 1; // Успешно добавлено
    }

    Com_Printf("Noire.Script: Maximum variable limit reached.\n");
    return 0; // Ошибка: превышено максимальное количество переменных
}

// Функция для добавления переменной
int set_variable(Variable *var, VarValue value, const char *operation) {
    if (var == NULL) {
        Com_Printf("Noire.Script: variable cannot be NULL.\n");
        return 0; // Переменная не может быть NULL
    }

    // Выполняем операцию
    if (strcmp(operation, "=") == 0) {
        var->value = value;
    } else if (strcmp(operation, "+=") == 0) {
        if (var->type == TYPE_INT) {
            var->value.i += value.i;
        } else if (var->type == TYPE_FLOAT) {
            var->value.f += value.f;
        }
    } else if (strcmp(operation, "-=") == 0) {
        if (var->type == TYPE_INT) {
            var->value.i -= value.i;
        } else if (var->type == TYPE_FLOAT) {
            var->value.f -= value.f;
        }
    } else if (strcmp(operation, "*=") == 0) {
        if (var->type == TYPE_INT) {
            var->value.i *= value.i;
        } else if (var->type == TYPE_FLOAT) {
            var->value.f *= value.f;
        }
    } else if (strcmp(operation, "/=") == 0) {
        if (var->type == TYPE_INT) {
            if (value.i == 0) {
                Com_Printf("Noire.Script: Divide by zero for variable '%s'.\n", var->name);
                return 0;
            }
            var->value.i /= value.i;
        } else if (var->type == TYPE_FLOAT) {
            if (value.f == 0.0f) {
                Com_Printf("Noire.Script: Divide by zero for variable '%s'.\n", var->name);
                return 0;
            }
            var->value.f /= value.f;
        }
    } else {
        Com_Printf("Noire.Script: Unknown operator '%s'.\n", operation);
        return 0;
    }

    return 1; // Успешно обновлено
}

// Функция для добавления переменной
int set_variable_int(Variable *var, int value, const char *operation) {
    if (var == NULL) {
        Com_Printf("Noire.Script: variable cannot be NULL.\n");
        return 0; // Переменная не может быть NULL
    }

    // Выполняем операцию
    if (strcmp(operation, "=") == 0) {
        var->value.i = value;
    } else if (strcmp(operation, "+=") == 0) {
            var->value.i += value;
    } else if (strcmp(operation, "-=") == 0) {
            var->value.i -= value;
    } else if (strcmp(operation, "*=") == 0) {
            var->value.i *= value;
    } else if (strcmp(operation, "/=") == 0) {
            if (value == 0) {
                Com_Printf("Noire.Script: Divide by zero for variable '%s'.\n", var->name);
                return 0;
            }
            var->value.i /= value;
    } else {
        Com_Printf("Noire.Script: Unknown operator '%s'.\n", operation);
        return 0;
    }

    return 1; // Успешно обновлено
}

// Функция для отображения переменных
void print_variables() {
    int i;

    for (i = 0; i < var_count; i++) {
        Com_Printf("Noire.Script Variable: %s, ", variables[i].name);
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

    if (name == NULL) {
        Com_Printf("Noire.Script: variable name cannot be NULL.\n");
        return NULL; // Имя переменной не может быть NULL
    }

    for (i = 0; i < var_count; i++) {
        if (strcmp(variables[i].name, name) == 0) {
            return &variables[i];
        }
    }
    return NULL; // Переменная не найдена
}

// Функция для проверки существования переменной по имени
int variable_exists(const char *name) {
    // Используем find_variable для поиска переменной
    if (find_variable(name) != NULL) {
        return 1; // Переменная найдена
    }
    return 0; // Переменная не найдена
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
                Com_Printf("Noire.Script Warning: variable '%s' not defined\n", varName);
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
                        Com_Printf("Noire.Script Error: divide by zero\n");
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

int NS_ifResult(int num1, NSOperator operator, int num2) {
    //Com_Printf("NS_ifResult: left = %i, operator = %i, right = %i\n", num1, operator, num2);
    switch (operator) {
        case EQUAL:
            return (num1 == num2) ? 1 : 0;
        case NOT_EQUAL:
            return (num1 != num2) ? 1 : 0;
        case LESS_THAN:
            return (num1 < num2) ? 1 : 0;
        case GREATER_THAN:
            return (num1 > num2) ? 1 : 0;
        case LESS_OR_EQUAL:
            return (num1 <= num2) ? 1 : 0;
        case GREATER_OR_EQUAL:
            return (num1 >= num2) ? 1 : 0;
        default:
            return 0; // Возвращаем 0, если оператор не распознан
    }
}

NSOperator NS_CharToOp(const char* operator) {
    if (strcmp(operator, "==") == 0) {
        return EQUAL;
    } else if (strcmp(operator, "!=") == 0) {
        return NOT_EQUAL;
    } else if (strcmp(operator, "<") == 0) {
        return LESS_THAN;
    } else if (strcmp(operator, ">") == 0) {
        return GREATER_THAN;
    } else if (strcmp(operator, "<=") == 0) {
        return LESS_OR_EQUAL;
    } else if (strcmp(operator, ">=") == 0) {
        return GREATER_OR_EQUAL;
    } else {
        // Возвращаем значение по умолчанию или обрабатываем ошибку
        Com_Printf("Noire.Script Error: Unsupported operator: %s\n", operator);
        return -1; // Предполагаем, что -1 не является допустимым значением
    }
}

// Функция для обработки текста с подстановкой значений переменных через $
char* NS_Text(const char *input) {
    // Создаем буфер для результирующей строки
    char *result = (char*)Q_malloc(MAX_VAR_CHAR_BUF);
    int resultIndex = 0; // Индекс для результирующей строки
    char placeholder[MAX_VAR_NAME + 2]; // $ + имя переменной
    char value[100]; // Буфер для значения
    Variable* var;
    int i;
    int k;

    if (!result) {
        Com_Printf("Noire.Script Error: Memory allocation failed\n");
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

void* NS_Exp(const char* expression, VarType type) {
    float result = NS_evaluateExpression(expression);

    if (type == TYPE_INT) {
        int* intResult = (int*)Q_malloc(sizeof(int));
        *intResult = (int)result;
        return intResult;
    } else if (type == TYPE_FLOAT) {
        float* floatResult = (float*)Q_malloc(sizeof(float));
        *floatResult = result;
        return floatResult;
    } else if (type == TYPE_CHAR) {
        char* stringResult = (char*)Q_malloc(MAX_VAR_CHAR_BUF * sizeof(char));
        if (stringResult) {
            Q_snprintf(stringResult, MAX_VAR_CHAR_BUF, "%.2f", result); // Форматируем float в строку
            return stringResult;
        } else {
            Com_Printf("Noire.Script Error: Memory allocation failed\n");
            return NULL;
        }
    } else {
        Com_Printf("Noire.Script Error: Unsupported type\n");
        return NULL;
    }
}

/*
###############
Функции
###############
*/

char* removeOuterBrackets(const char* str) {
    size_t len;
    
    if (str == NULL || *str == '\0') {
        return NULL; // Проверка на пустую строку
    }

    len = strlen(str); // Сначала получаем длину

    // Проверяем наличие скобок в начале и в конце
    if (len > 1 && str[0] == '(' && str[len - 1] == ')') {
        // Выделяем память для строки без скобок
        char* result = (char*)Q_malloc(len - 1); // -1 для удаления закрывающей скобки
        if (result) {
            strncpy(result, str + 1, len - 2); // Копируем с 1 по len-2
            result[len - 2] = '\0'; // Завершаем строку
            return result; // Возвращаем результат
        } else {
            Com_Printf("Memory allocation failed\n");
            return NULL; // Если выделение не удалось
        }
    }

    return NULL; 
}

// Функция для удаления кавычек
void removeQuotes(char* str) {
    char* src = str;
    char* dst = str;

    while (*src) {
        if (*src != '"' && *src != '\'') {
            *dst++ = *src; // Копируем символ, если он не кавычка
        }
        src++;
    }
    *dst = '\0'; // Завершаем строку
}

int splitArgs(const char* args, char* result[]) {
    const char* start = args;
    const char* end;
    int count = 0;
    int inQuotes = 0; // Флаг, чтобы отслеживать, находимся ли мы внутри кавычек
    int len;
    int i;

    // Инициализация указателей в result
    for (i = 0; i < MAX_ARGS; i++) {
        result[i] = NULL;
    }

    while (*start) {
        // Пропускаем пробелы
        while (*start == ' ') {
            start++;
        }

        if (*start == '\0') {
            break; // Выходим, если конец строки
        }

        // Проверяем, если встречаем кавычку, переключаем флаг
        if (*start == '"' || *start == '\'') {
            inQuotes = !inQuotes; // Меняем состояние флага
            start++; // Пропускаем кавычку
        }

        // Устанавливаем конец аргумента
        end = start;
        while (*end && (inQuotes || *end != ' ')) {
            end++;
        }

        // Вычисляем длину аргумента
        len = end - start;

        // Если длина больше 0, обрабатываем аргумент
        if (len > 0) {
            // Проверяем, если длина превышает разумный лимит
            if (len > MAX_ARG_LENGTH) { // Лимит на один аргумент
                // Освобождаем ранее выделенную память и выходим
                for (i = 0; i < count; i++) {
                    Q_free(result[i]);
                }
                return -1; // Ошибка: аргумент слишком длинный
            }

            // Выделяем память для нового аргумента
            result[count] = (char*)Q_malloc(len + 1);
            if (!result[count]) {
                // Освобождение ранее выделенной памяти в случае ошибки
                for (i = 0; i < count; i++) {
                    Q_free(result[i]);
                }
                return -1; // Ошибка выделения памяти
            }

            strncpy(result[count], start, len);
            result[count][len] = '\0'; // Завершаем строку

            // Проверяем и удаляем кавычки в начале и в конце
            if (result[count][0] == '"' || result[count][0] == '\'') {
                memmove(result[count], result[count] + 1, len); // Сдвигаем влево, удаляя первую кавычку
                result[count][len - 1] = '\0'; // Завершаем строку
            }

            // Проверяем, если последний символ кавычка
            if (len > 1 && (result[count][len - 2] == '"' || result[count][len - 2] == '\'')) {
                result[count][len - 2] = '\0'; // Удаляем последнюю кавычку
            }

            count++;
        }

        start = end; // Переходим к следующему аргумент

        // Проверяем на превышение максимального количества аргументов
        if (count >= MAX_ARGS) {
            break; // Если превышено, выходим из цикла
        }
    }

    return count; // Возвращаем количество аргументов
}

// Массив с названиями функций
const char *function_list[MAX_FUNCS] = {
    "print",
    "command",
    "getCvar_int",
    "getCvar_float",
    "getCvar_char"
};

void callfunc(Variable *var, const char *name, const char *operation, const char *args) {
    VarValue result;
    int called = 0; // 0 - not called, 1 - called without return, 2 - called and have return value
    int i;
    char* cleanedArgs = NULL;
    int argCount;
    char* arguments[MAX_ARGS]; // Массив для хранения указателей на аргументы

    // Копируем аргументы и удаляем скобки
    cleanedArgs = removeOuterBrackets(args); // Сразу удаляем скобки из аргументов
    argCount = splitArgs(cleanedArgs, arguments); // Разделяем аргументы

    // print
    if (strcmp(name, "print") == 0 && argCount >= 1) {
        Com_Printf("%s\n", NS_Text(arguments[0]));
        called = 1;
    }

    // command
    else if (strcmp(name, "command") == 0 && argCount >= 2) {
        int exec_mode = (!strcmp(arguments[0], "EXEC_NOW")) ? EXEC_NOW :
                        (!strcmp(arguments[0], "EXEC_INSERT")) ? EXEC_INSERT : EXEC_APPEND;

        #ifdef QAGAME
        trap_SendConsoleCommand(exec_mode, NS_Text(arguments[1])); // Используем второй аргумент как команду
        #endif
        #ifdef Q3_UI
        trap_Cmd_ExecuteText(exec_mode, NS_Text(arguments[1]));
        #endif
        called = 1;
    }

    // getCvar_int
    else if (strcmp(name, "getCvar_int") == 0 && argCount >= 1) {
        char cvarValue[MAX_NCVAR_NAME];
        trap_Cvar_VariableStringBuffer(NS_Text(arguments[0]), cvarValue, sizeof(cvarValue));
        result.i = atoi(cvarValue); // Преобразуем строку в int
        called = 2;
    }

    // getCvar_float
    else if (strcmp(name, "getCvar_float") == 0 && argCount >= 1) {
        char cvarValue[MAX_NCVAR_NAME];
        trap_Cvar_VariableStringBuffer(NS_Text(arguments[0]), cvarValue, sizeof(cvarValue));
        result.f = atof(cvarValue); // Преобразуем строку в float
        called = 2;
    }

    // getCvar_char
    else if (strcmp(name, "getCvar_char") == 0 && argCount >= 1) {
        char cvarValue[MAX_NCVAR_NAME];
        trap_Cvar_VariableStringBuffer(NS_Text(arguments[0]), cvarValue, sizeof(cvarValue));

        // Копируем строку в result
        strncpy(result.c, cvarValue, sizeof(result.c) - 1);
        result.c[sizeof(result.c) - 1] = '\0';

        called = 2;
    }

    // Устанавливаем переменную, если функция возвращает значение
    if (called == 2) {
        set_variable(var, result, operation);
    }

    // Обработка неизвестных функций или некорректного количества аргументов
    if (called == 0) {
        Com_Printf("Noire.Script: %s - Unknown function or incorrect number of arguments.\n", name);
    }

    // Освобождение памяти для аргументов
    for (i = 0; i < argCount; i++) {
        Q_free(arguments[i]);
    }

    // Освобождение памяти для cleanedArgs
    Q_free(cleanedArgs);

    return;
}

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

void Interpret(char* script) {
    char *pointer = script; // Указатель начала скрипта
    char *token;
    Variable* var;
    int i;

    while ((token = NS_Parse(&pointer)) != NULL) {
        if (token[0] == 0) {
            continue; // Пропускаем пустые токены
        }

        // Обработка токена
        #ifdef NS_DEBUG_TOKEN
        if (is_operator(token)) {
            Com_Printf("Noire.Script Operator token: %s\n", token);
        } else if (is_literal(token)) {
            Com_Printf("Noire.Script String literal token: %s\n", token);
        } else if (is_function(token)) {
            Com_Printf("Noire.Script Function token: %s\n", token);
        } else {
            Com_Printf("Noire.Script Operand token: %s\n", token);
        }
        #endif

        // Упрощённый блок обработки if
        if (strcmp(token, "if") == 0) {
            int firstValue = atoi(NS_Exp(NS_Parse(&pointer), TYPE_CHAR));
            NSOperator op = NS_CharToOp(NS_Parse(&pointer));
            int secondValue = atoi(NS_Exp(NS_Parse(&pointer), TYPE_CHAR));

            // Выполняем условие
            if (NS_ifResult(firstValue, op, secondValue)) {
                continue; // Условие истинно, продолжаем обрабатывать токены
            } else {
                // Пропускаем блок if, если условие ложно
                while ((token = NS_Parse(&pointer)) != NULL) {
                    if (strcmp(token, "}") == 0) {
                        break; // Выход из блока if
                    }
                }
                continue; // Переходим к следующему токену после блока if
            }
        }

        // Упрощённый блок обработки for
        if (strcmp(token, "for") == 0) {
            int iterations = atoi(NS_Exp(NS_Parse(&pointer), TYPE_CHAR));
            char originalBuffer[MAX_CYCLE_SIZE]; // Оригинальный буфер для хранения кода внутри for
            char operationBuffer[MAX_CYCLE_SIZE]; // Буфер для выполнения операций
            int originalBufferIndex = 0;
            int tokenLength = 0;
            int i = 0;

            // Сначала собираем код внутри блока for в оригинальный буфер
            while ((token = NS_Parse(&pointer)) != NULL) {
                if (strcmp(token, "}") == 0) {
                    break; // Выход из блока for
                }

                // Записываем токен в оригинальный буфер с пробелом между токенами
                tokenLength = strlen(token);
                if (originalBufferIndex + tokenLength + 1 < MAX_CYCLE_SIZE) { // +1 для пробела
                    if (originalBufferIndex > 0) {
                        originalBuffer[originalBufferIndex++] = ' '; // добавляем пробел между токенами
                    }
                    strcpy(originalBuffer + originalBufferIndex, token);
                    originalBufferIndex += tokenLength;
                } else {
                    // Буфер переполнен
                    Com_Printf("Noire.Script Warning: Buffer overflow while processing 'for' loop\n");
                    break;
                }
            }

            // Завершаем строку
            originalBuffer[originalBufferIndex] = '\0';

            // Выводим полученный оригинальный буфер в консоль
            Com_Printf("Noire.Script: Original buffer contents: %s\n", originalBuffer);

            // Запускаем интерпретацию кода из оригинального буфера нужное количество раз
            for (i = 0; i < iterations; i++) {
                // Копируем содержимое оригинального буфера в буфер для операций
                strcpy(operationBuffer, originalBuffer);

                // Выводим номер текущей итерации
                Com_Printf("Noire.Script: Iteration %d executed.\n", i + 1); // Выводим номер текущей итерации

                // Запускаем интерпретацию кода из буфера для операций
                Interpret(operationBuffer);
            }

            continue; // Переходим к следующему токену после блока for
        }

        // Проверяем, является ли токен объявлением переменной
        if (strcmp(token, "int") == 0 || strcmp(token, "float") == 0 || strcmp(token, "char") == 0) {
            // Получаем имя переменной
            char* varName = NS_Parse(&pointer);
            char*  resultName;
            char*   valueToken;
            VarValue resultValue;
            VarType  resultType;

            // Проверяем, существует ли переменная с таким именем
            if (variable_exists(varName)) {
                //Com_Printf("Noire.Script: Variable '%s' already exists.\n", varName);
                continue; // Переходим к следующему токену так как создавать ничего не нужно
            }

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
                valueToken = NS_Parse(&pointer);
                if (valueToken != NULL) {
                    // Устанавливаем значение переменной в зависимости от её типа
                    switch (resultType) {
                        case TYPE_INT: {
                            int* temp = (int*)NS_Exp(valueToken, TYPE_INT);
                            if (temp) {
                                resultValue.i = *temp;
                                Q_free(temp);
                            } else {
                                Com_Printf("Noire.Script Variable %s: Initial value error.", varName);
                            }
                            break;
                        }
                        case TYPE_FLOAT: {
                            float* temp = (float*)NS_Exp(valueToken, TYPE_FLOAT);
                            if (temp) {
                                resultValue.f = *temp; // Разыменование указателя для получения значения
                                Q_free(temp);
                            } else {
                                Com_Printf("Noire.Script Variable %s: Initial value error.", resultName);
                            }
                            break;
                        }
                        case TYPE_CHAR: { // Для char мы можем использовать строку
                            CopyAllocLen(resultValue.c, NS_Text(valueToken));
                            break;
                        }
                    }
                }
            }
            // Добавляем переменную в список
            add_variable(resultName, resultValue, resultType);

            // Освобождаем память для значения в зависимости от типа
            if (resultType == TYPE_CHAR) {
               Q_free(resultValue.c); // Освобождаем строку
            }
            // Освобождаем имя переменной только после успешного добавления
            Q_free(resultName);

            continue; // Переходим к следующему токену
        }

        // Проверка, является ли токен именем переменной
        var = find_variable(token);
        if (var != NULL) {
            VarValue    resultValue;
            char*       resultOperator;
            char*       valueToken;
            char*       resultArgs;
            qboolean    func = qfalse;

            // Проверяем следующий токен оператор
            token = NS_Parse(&pointer);
            if (is_operator(token)) {
                CopyAllocLen(resultOperator, token);    //сохраняем оператор
                // Получаем следующее значение
                valueToken = NS_Parse(&pointer);
                if (valueToken != NULL && !is_function(valueToken)) {
                    // Устанавливаем значение переменной в зависимости от её типа
                    switch (var->type) {
                        case TYPE_INT: {
                            int* temp = (int*)NS_Exp(valueToken, TYPE_INT);
                            if (temp) {
                                resultValue.i = *temp;
                                Q_free(temp);
                            } else {
                                Com_Printf("Noire.Script Variable %s: Calculate value error.", var->name);
                            }
                            break;
                        }
                        case TYPE_FLOAT: {
                            float* temp = (float*)NS_Exp(valueToken, TYPE_FLOAT);
                            if (temp) {
                                resultValue.f = *temp; // Разыменование указателя для получения значения
                                Q_free(temp);
                            } else {
                                Com_Printf("Noire.Script Variable %s: Calculate value error.", var->name);
                            }
                            break;
                        }
                        case TYPE_CHAR: { // Для char мы можем использовать строку
                            CopyAllocLen(resultValue.c, NS_Text(valueToken));
                            break;
                        }
                    }
                } else {
                    resultArgs = NS_Parse(&pointer);
                    callfunc(var, valueToken, resultOperator, resultArgs);  //valueToken это имя функции
                    func = qtrue;
                    Q_free(resultArgs);
                }
            }
            // Добавляем переменную в список
            if(!func){
            set_variable(var, resultValue, resultOperator);
            }

            // Освобождаем память для значения в зависимости от типа
            if (var->type == TYPE_CHAR) {
               Q_free(resultValue.c); // Освобождаем строку
            }
            // Освобождаем имя переменной только после успешного добавления
            Q_free(resultOperator);

            continue; // Переходим к следующему токену
        }

        if (is_function(token)) {
            char*     valueToken;

            CopyAllocLen(valueToken, token);    //сохраняем название функции

            // Проверяем следующий токен - аргументы
            token = NS_Parse(&pointer);

            callfunc(NULL, valueToken, NULL, token);  //valueToken это имя функции

            Q_free(valueToken);

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
    Interpret(buffer);
}
