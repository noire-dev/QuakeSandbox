/*
===========================================================================
// Project: Quake Sandbox - Noire.Script
// File: ns_func.c
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

void NS_getCvar(VarValue *modify, VarType type, const char *cvarName)
{
    char cvarValue[MAX_VAR_CHAR_BUF];
    switch(type) {
        case TYPE_CHAR:
            trap_Cvar_VariableStringBuffer(cvarName, modify->c, sizeof(modify->c));
            break;
        case TYPE_INT:
            trap_Cvar_VariableStringBuffer(cvarName, cvarValue, sizeof(cvarValue));
            modify->i = atoi(cvarValue);
            break;
        case TYPE_FLOAT:
            trap_Cvar_VariableStringBuffer(cvarName, cvarValue, sizeof(cvarValue));
            modify->f = atof(cvarValue);
            break;
        default:
            return;
    }
}

void NS_setCvar(const char *cvarName, const char *cvarValue)
{
    trap_Cvar_Set(cvarName, cvarValue);
}

void NS_getVariable(VarValue *modify, VarType type, const char *varName)
{
    char cvarValue[MAX_VAR_CHAR_BUF];
    switch(type) {
        case TYPE_CHAR:
            strncpy(modify->c, get_variable_char(varName), sizeof(modify->c));
            break;
        case TYPE_INT:
            modify->i = get_variable_int(varName);
            break;
        case TYPE_FLOAT:
            modify->f = get_variable_float(varName);
            break;
        default:
            return;
    }
}

void NS_setVariable(VarValue *modify, VarType type, const char *varName)
{
    char cvarValue[MAX_VAR_CHAR_BUF];
    switch(type) {
        case TYPE_CHAR:
            strncpy(modify->c, get_variable_char(varName), sizeof(modify->c));
            break;
        case TYPE_INT:
            modify->i = get_variable_int(varName);
            break;
        case TYPE_FLOAT:
            modify->f = get_variable_float(varName);
            break;
        default:
            return;
    }
}

void NS_initMGui(const char *cvarName, const char *cvarValue)
{
    int i;
    i = MAX_OBJECTS;
}
