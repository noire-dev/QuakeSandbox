/*
===========================================================================
// Project: Quake Sandbox - Noire.Script
// File: ns_local.h
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

#include "q_shared.h"
#ifdef QAGAME
#include "../game/bg_public.h"
#include "../game/g_public.h"
#endif

/*
###############
Глобальное
###############
*/

#define MAX_FILE_SIZE       1024*30       //Макс длина скрипта
#define MAX_TOKEN_LENGTH    1024          //Макс количество символов в токене
#define MAX_CYCLE_SIZE      1024*8        //Макс длина цикла
#define MAX_VARS            8192          //Макс переменных
#define MAX_VAR_NAME        32            //Макс имя переменной
#define MAX_NCVAR_NAME      64            //Макс имя консольной переменной
#define MAX_VAR_CHAR_BUF    1024          //Макс буфер char переменной
#define MAX_FUNCS           5             //Количество функций
#define MAX_ARGS            64            //Количество аргументов
#define MAX_ARG_LENGTH      64            //Количество аргументов
//#define NS_DEBUG_TOKEN                  //Дебаг токенов

typedef enum {
    EQUAL,            // == 
    NOT_EQUAL,       // != 
    LESS_THAN,       // <  
    GREATER_THAN,    // >  
    LESS_OR_EQUAL,   // <= 
    GREATER_OR_EQUAL  // >=
} NSOperator;


/*
###############
Переменные
###############
*/

// Определяем union для разных типов
typedef union {
    char c[MAX_VAR_CHAR_BUF];
    int i;
    float f;
} VarValue;

// Определяем для разных типов
typedef union {
    char c[MAX_VAR_CHAR_BUF];
    int i;
    float f;
} ArgValue;

// Перечисляем типы переменных
typedef enum {
    TYPE_CHAR,
    TYPE_INT,
    TYPE_FLOAT,
    TYPE_INVALID
} VarType;

// Структура для переменной с именем, типом и значением
typedef struct {
    char name[MAX_NAME_LENGTH];
    VarValue value;
    VarType type;
} Variable;

void print_variables();

/*
###############
Выполнение
###############
*/

void NS_OpenScript(const char* filename);
