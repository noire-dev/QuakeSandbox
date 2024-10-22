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

void NSF_Print(const char* format, ...) {
    va_list args;
    va_start(args, format);
    Com_Printf(format, args);
    va_end(args);
}
