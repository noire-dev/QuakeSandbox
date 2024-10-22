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

    // Skip spaces and comments
    while (*s) {
        // Skip whitespace
        while (*s && (*s == ' ' || *s == '\t')) {
            s++;
        }

        // Check for single-line comment
        if (s[0] == '/' && s[1] == '/') {
            while (*s && *s != '\n') { // Skip to the end of the line
                s++;
            }
            continue; // Go back to the while loop to check for more tokens
        }

        // Check for multi-line comment
        if (s[0] == '/' && s[1] == '*') {
            s += 2; // Move past '/*'
            while (*s) {
                if (s[0] == '*' && s[1] == '/') {
                    s += 2; // Move past '*/'
                    break; // End of comment block
                }
                s++;
            }
            continue; // Go back to the while loop to check for more tokens
        }

        if (*s == '\0') {
            // If we reached the end of the string, return NULL
            *p = s; // Update pointer
            return NULL;
        }

        token = s; // Start of the token

        // Find the end of the token
        while (*s && *s != '\n') {
            s++;
        }

        if (*s) {
            *s++ = '\0'; // Null-terminate the string
        }

        *p = s; // Update pointer
        return token; // Return the found token
    }

    // Return NULL if no tokens are found
    *p = s; // Update pointer
    return NULL;
}

void NS_ExecuteCommand(const char* command) {
    // Print for test
    if (Q_strncmp(command, "print ", 6) == 0) {
        // Offset to get the actual message
        const char* message = command + 6;
        Com_Printf("Noire.Script: %s\n", message);  // Print it to console
    } else {
        // Unknown command
        Com_Printf("Noire.Script: Unknown command '%s'\n", command);
    }
}

void NS_ExecuteScript(char* script) {
    char *pointer = script; // Pointer to the beginning of the script
    char *token;

    while ((token = NS_Parse(&pointer)) != NULL) {
        if (token[0] == 0) {
            continue; // Skip empty tokens
        }
        NS_ExecuteCommand(token); // Execute command
    }
}

void NS_OpenScript(const char* filename) {
    int len;
    fileHandle_t f;
    char buffer[MAX_FILE_SIZE];

    // Open script file with .ns extension
    len = trap_FS_FOpenFile(filename, &f, FS_READ);

    if (len <= 0) {
        // If file is NULL or cannot be opened
        Com_Printf("Noire.Script: Could not open script file %s\n", filename);
        return;
    }

    // Read the file into buffer
    trap_FS_Read(buffer, len, f);
    buffer[len] = '\0'; // Null-terminate the string

    // Close file
    trap_FS_FCloseFile(f);

    // Execute the script
    NS_ExecuteScript(buffer);
}
