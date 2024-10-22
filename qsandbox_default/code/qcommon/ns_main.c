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

char* NS_Parse(char** p) {
    char* token;
    char* s = *p;

    // Пропустим пробелы
    while (*s) {
        // Пропустим \t
        while (*s && (*s == ' ' || *s == '\t')) {
            s++;
        }

        // Проверяем одно-строчный комент
        if (s[0] == '/' && s[1] == '/') {
            while (*s && *s != '\n') { // Пропустим /n
                s++;
            }
            continue; // Идем дальше собирать токены
        }

        // Проверяем много-строчный комент
        if (s[0] == '/' && s[1] == '*') {
            s += 2; // Двигаемся отсюда и скипаем абсолютно все '/*'
            while (*s) {
                if (s[0] == '*' && s[1] == '/') {
                    s += 2; // Пока не придем сюда '*/'
                    break; // Идем дальше собирать токены
                }
                s++;
            }
            continue; // Идем дальше собирать токены
        }

        if (*s == '\0') {
            // Мы достигли конца строки, вернем NULL
            *p = s; // Обновим указатель
            return NULL;
        }

        token = s; // Старт токена

        // Ищем конец токена
        while (*s && *s != '\n') {
            s++;
        }

        if (*s) {
            *s++ = '\0'; // Терминальный ноль строки
        }

        *p = s; // Обновим указатель
        return token; // Вернем найденый токен
    }

    // Вернем NULL если не нашли ничего
    *p = s; // Обновим указатель
    return NULL;
}

void NS_Init() {
    NS_AddFunction("print", "Com_Printf(\"Noire.Script: %s\\n\", args);");
}

void NS_AddFunction(const char* name, const char* body) {
    NS_Function* newFunction = (NS_Function*)malloc(sizeof(NS_Function));
    strncpy(newFunction->name, name, MAX_FUNCTION_NAME_LENGTH);
    newFunction->body = strdup(body);
    newFunction->next = functionList;
    functionList = newFunction;
}

void NS_ExecuteFunction(const char* functionName, const char* args) {
    NS_Function* current = functionList;

    while (current != NULL) {
        if (strcmp(current->name, functionName) == 0) {
            Com_Printf("Noire.Script: Executing function '%s' with args: %s\n", functionName, args);
            NS_ExecuteScript(current->body); // Выполняем тело функции
            return;
        }
        current = current->next;
    }

    Com_Printf("Noire.Script: Unknown function '%s'\n", functionName);
}

void NS_ExecuteCommand(const char* command) {
    char functionName[MAX_FUNCTION_NAME_LENGTH];
    char args[MAX_ARG_SIZE];
    
    sscanf(command, "%31s %[^\n]", functionName, args);     //здесь MAX_FUNCTION_NAME_LENGTH-1
    
    NS_ExecuteFunction(functionName, args);
}

void NS_ExecuteScript(char* script) {
    char *pointer = script; // Указатель начала скрипта
    char *token;

    while ((token = NS_Parse(&pointer)) != NULL) {
        if (token[0] == 0) {
            continue; // Пропускаем пустые токены
        }
        NS_ExecuteCommand(token); // Выполняем команду
    }
}

void NS_OpenScript(const char* filename) {
    int len;
    fileHandle_t f;
    char buffer[MAX_FILE_SIZE];

    NS_Init();      //Noire.Script инициализация

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
