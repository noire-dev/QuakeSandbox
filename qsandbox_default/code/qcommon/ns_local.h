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

#include "q_shared.h"
#ifdef QAGAME
#include "../game/bg_public.h"
#include "../game/g_public.h"
#endif

#define MAX_FILE_SIZE 1024*30

char* NS_Parse(char** p);
void NS_ExecuteCommand(const char* command);
void NS_ExecuteScript(char* script);
void NS_OpenScript(const char* filename);
