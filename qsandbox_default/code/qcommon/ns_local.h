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

#ifdef QAGAME
#include "../game/g_local.h"
#endif
#ifdef Q3_UI
#include "../q3_ui/ui_local.h"
#endif

/*
###############
Глобальное
###############
*/

#define MAX_NSSCRIPT_SIZE   1024*30       //Макс длина скрипта
#define MAX_TOKEN_LENGTH    1024          //Макс количество символов в токене
#define MAX_SCRIPTS         512           //Макс количество потоков скриптов
#define MAX_CYCLE_SIZE      1024*8        //Макс длина цикла
#define MAX_VARS            8192          //Макс переменных
#define MAX_VAR_NAME        32            //Макс имя переменной
#define MAX_NCVAR_NAME      64            //Макс имя консольной переменной
#define MAX_VAR_CHAR_BUF    1024          //Макс буфер char переменной
#define MAX_FUNCS           4096          //Макс количество функций
#define MAX_ARGS            64            //Количество аргументов
#define MAX_ARG_LENGTH      256           //Длина аргументов
#define MAX_THREAD_NAME     32            //Макс длина названия потока

typedef struct {
    char threadName[MAX_THREAD_NAME];
    char code[MAX_NSSCRIPT_SIZE];
    int interval; // Интервал в миллисекундах
    int lastRunTime; // Время последнего запуска
} ScriptLoop;

/*
###############
Выражения
###############
*/

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

// Перечисляем типы переменных
typedef enum {
    TYPE_CHAR,
    TYPE_INT,
    TYPE_FLOAT,
    TYPE_INVALID
} VarType;

// Структура для переменной с именем, типом и значением
typedef struct {
    char name[MAX_VAR_NAME];
    VarValue value;
    VarType type;
} Variable;

void print_variables();

/*
###############
Функции
###############
*/

// Определяем для разных типов
typedef union {
    char c[MAX_VAR_CHAR_BUF];
    int i;
    float f;
} ArgValue;

/*
###############
Выполнение
###############
*/

void Interpret(char* script);

/*
###############
Потоки
###############
*/

extern ScriptLoop threadsLoops[MAX_SCRIPTS];
extern int threadsCount;
void print_threads();

/*
###############
Запуск
###############
*/

void NS_OpenScript(const char* filename, const char* threadName, int interval);

/*
###############
Noire.Script API
###############
*/

void NS_getCvar(VarValue *modify, VarType type, const char *cvarName);
void NS_setCvar(const char *cvarName, const char *cvarValue);

/*extern float NS_getPlayerPosById(int id, int dir);
extern void NS_setPlayerPosById(int id, int dir, float value);*/
