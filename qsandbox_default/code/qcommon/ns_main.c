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

        // Обработка токена
        #ifdef NS_DEBUG_TOKEN
        if (is_operator(token)) {
            Com_Printf("Operator token: %s\n", token);
        } else if (is_literal(token)) {
            Com_Printf("String literal token: %s\n", token);
        } else {
            Com_Printf("Operand token: %s\n", token);
        }
        #endif

        return token; // Вернем найденный токен
    }

    *p = s; // Обновим указатель
    return NULL; // Не нашли ничего
}

/*
###############
Выражения
###############
*/

float NS_evaluateExpression(const char* expr) {
    float result = 0;
    float currentNumber = 0;
    char operation = '+'; // Начинаем с операции сложения
    int i;

    for (i = 0; expr[i] != '\0'; ++i) {
        char currentChar = expr[i];

        if (isdigit(currentChar)) {
            currentNumber = currentNumber * 10 + (currentChar - '0'); // Обработка многозначных чисел
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
                        Com_Printf("Error: divide by zero\n");
                        return 0.0;
                    }
                    break;
            }
            currentNumber = 0; // Сбрасываем текущее число
            operation = currentChar; // Устанавливаем текущую операцию
        }
    }
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
    } else if (type == TYPE_CHAR) {
        char* charResult = (char*)Q_malloc(sizeof(char));
        *charResult = (char)result; // Приводим к char
        return charResult;
    } else {
        Com_Printf("Error: Unsupported type\n");
        return NULL;
    }
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
    if (var_count < MAX_VARS) {
        strcpy(variables[var_count].name, name);
        variables[var_count].value = value;
        variables[var_count].type = type;
        var_count++;
        return 1; // Успешно добавлено
    }
    return 0; // Ошибка: превышено максимальное количество переменных
}

// Функция для отображения переменных
void print_variables() {
    int i;

    for (i = 0; i < var_count; i++) {
        Com_Printf("Variable: %s, ", variables[i].name);
        switch (variables[i].type) {
            case TYPE_CHAR:
                Com_Printf("type = char, value = '%c'\n", variables[i].value.c);
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

/*
###############
Функции
###############
*/

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
                            resultValue.i = (int)NS_calculate(valueToken, TYPE_INT); // Преобразуем строку в int
                            break;
                        }
                        case TYPE_FLOAT: {
                            float* temp = (float*)NS_calculate(valueToken, TYPE_FLOAT);
                            if (temp) {
                                resultValue.f = *temp; // Разыменование указателя для получения значения
                                Q_free(temp);
                            } else {
                                Com_Printf("Variable %s: Initial value error.", resultName);
                            }
                            break;
                        }
                        case TYPE_CHAR: { // Для char мы можем использовать строку
                            CopyAllocLen(resultValue.c, (char*)NS_calculate(valueToken, TYPE_CHAR));
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
            // Если переменная найдена, выводим её значение
            switch (var->type) {
                case TYPE_INT:
                    Com_Printf("Variable %s: %i\n", var->name, var->value.i);
                    break;
                case TYPE_FLOAT:
                    Com_Printf("Variable %s: %f\n", var->name, var->value.f);
                    break;
                case TYPE_CHAR:
                    Com_Printf("Variable %s: %s\n", var->name, var->value.c);
                    break;
                case TYPE_INVALID:
                    Com_Printf("Variable %s: %s\n", var->name, "<TYPE_INVALID>");
                    break;
            }
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
