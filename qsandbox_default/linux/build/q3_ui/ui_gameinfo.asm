export UI_Alloc
code
proc UI_Alloc 8 0
file "../../../code/q3_ui/ui_gameinfo.c"
line 45
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3://
;4:// gameinfo.c
;5://
;6:
;7:
;8:
;9:
;10:#include "ui_local.h"
;11:
;12:
;13://
;14:// arena and bot info
;15://
;16:
;17:#define DIRLIST_SIZE 	16384
;18:
;19:#define MAX_MAPNAME 32
;20:
;21:int				ui_numBots;
;22:static char		*ui_botInfos[MAX_BOTS];
;23:
;24:static int		ui_numArenas;
;25:static char		*ui_arenaInfos[MAX_ARENAS];
;26:
;27:static int		ui_numSinglePlayerArenas;
;28:static int		ui_numSpecialSinglePlayerArenas;
;29:
;30:static char		dirlist[DIRLIST_SIZE];
;31:static int		allocPoint, outOfMemory;
;32:
;33:
;34:
;35:
;36:#define POOLSIZE	4096 * 8192
;37:static char		memoryPool[POOLSIZE];
;38:
;39:
;40:/*
;41:===============
;42:UI_Alloc
;43:===============
;44:*/
;45:void *UI_Alloc( int size ) {
line 48
;46:	char	*p;
;47:
;48:	if ( allocPoint + size > POOLSIZE ) {
ADDRGP4 allocPoint
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
CNSTI4 33554432
LEI4 $81
line 49
;49:		outOfMemory = qtrue;
ADDRGP4 outOfMemory
CNSTI4 1
ASGNI4
line 50
;50:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $80
JUMPV
LABELV $81
line 53
;51:	}
;52:
;53:	p = &memoryPool[allocPoint];
ADDRLP4 0
ADDRGP4 allocPoint
INDIRI4
ADDRGP4 memoryPool
ADDP4
ASGNP4
line 55
;54:
;55:	allocPoint += ( size + 31 ) & ~31;
ADDRLP4 4
ADDRGP4 allocPoint
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 31
ADDI4
CNSTI4 -32
BANDI4
ADDI4
ASGNI4
line 57
;56:
;57:	return p;
ADDRLP4 0
INDIRP4
RETP4
LABELV $80
endproc UI_Alloc 8 0
export UI_Free
proc UI_Free 4 12
line 65
;58:}
;59:
;60:/*
;61:===============
;62:UI_Free
;63:===============
;64:*/
;65:void UI_Free(void *ptr) {
line 67
;66:	// Определение смещения указателя от начала пула памяти
;67:    int offset = (char*)ptr - memoryPool;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 memoryPool
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 70
;68:	
;69:    // Ничего не делать, если указатель равен NULL
;70:    if (ptr == NULL)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $84
line 71
;71:        return;
ADDRGP4 $83
JUMPV
LABELV $84
line 74
;72:
;73:    // Очистка области памяти путем установки ее байтов в 0
;74:    memset(ptr, 0, offset);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 77
;75:
;76:    // Сдвиг allocPoint, чтобы освободить эту область памяти для будущего использования
;77:    allocPoint = offset;
ADDRGP4 allocPoint
ADDRLP4 0
INDIRI4
ASGNI4
line 78
;78:}
LABELV $83
endproc UI_Free 4 12
export UI_InitMemory
proc UI_InitMemory 0 0
line 85
;79:
;80:/*
;81:===============
;82:UI_InitMemory
;83:===============
;84:*/
;85:void UI_InitMemory( void ) {
line 86
;86:	allocPoint = 0;
ADDRGP4 allocPoint
CNSTI4 0
ASGNI4
line 87
;87:	outOfMemory = qfalse;
ADDRGP4 outOfMemory
CNSTI4 0
ASGNI4
line 88
;88:}
LABELV $86
endproc UI_InitMemory 0 0
export UI_StoreInfo
proc UI_StoreInfo 20 8
line 99
;89:
;90:
;91:
;92:
;93:/*
;94:===============
;95:UI_StoreMapInfo
;96:===============
;97:*/
;98:qboolean UI_StoreInfo( char *info, char **infos )
;99:{
line 101
;100:	//NOTE: extra space for arena number
;101:	*infos = UI_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $88
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $89
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRP4
ASGNP4
line 102
;102:	if (*infos) {
ADDRFP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $90
line 103
;103:		strcpy(*infos, info);
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 104
;104:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $87
JUMPV
LABELV $90
line 107
;105:	}
;106:
;107:	return qfalse;
CNSTI4 0
RETI4
LABELV $87
endproc UI_StoreInfo 20 8
export UI_ParseInfos
proc UI_ParseInfos 2088 12
line 116
;108:}
;109:
;110:
;111:/*
;112:===============
;113:UI_ParseInfos
;114:===============
;115:*/
;116:int UI_ParseInfos( char *buf, int max, char *infos[] ) {
line 125
;117:	fileHandle_t file;
;118:	const char* filename;
;119:	int len;
;120:	char	*token;
;121:	int		count;
;122:	char	key[MAX_TOKEN_CHARS];
;123:	char	info[MAX_INFO_STRING];
;124:
;125:	count = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRGP4 $94
JUMPV
LABELV $93
line 127
;126:
;127:	while ( 1 ) {
line 128
;128:		token = COM_Parse( &buf );
ADDRFP4 0
ARGP4
ADDRLP4 2068
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2068
INDIRP4
ASGNP4
line 129
;129:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $96
line 130
;130:			break;
ADDRGP4 $95
JUMPV
LABELV $96
line 132
;131:		}
;132:		if ( strcmp( token, "{" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $100
ARGP4
ADDRLP4 2072
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
EQI4 $98
line 133
;133:			Com_Printf( "Missing { in info file\n" );
ADDRGP4 $101
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 134
;134:			break;
ADDRGP4 $95
JUMPV
LABELV $98
line 137
;135:		}
;136:
;137:		if ( count == max ) {
ADDRLP4 2052
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $102
line 138
;138:			Com_Printf( "Max infos exceeded\n" );
ADDRGP4 $104
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 139
;139:			break;
ADDRGP4 $95
JUMPV
LABELV $102
line 142
;140:		}
;141:
;142:		info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $106
JUMPV
LABELV $105
line 143
;143:		while ( 1 ) {
line 144
;144:			token = COM_ParseExt( &buf, qtrue );
ADDRFP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2076
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2076
INDIRP4
ASGNP4
line 145
;145:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $108
line 146
;146:				Com_Printf( "Unexpected end of info file\n" );
ADDRGP4 $110
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 147
;147:				break;
ADDRGP4 $107
JUMPV
LABELV $108
line 149
;148:			}
;149:			if ( !strcmp( token, "}" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $113
ARGP4
ADDRLP4 2080
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $111
line 150
;150:				break;
ADDRGP4 $107
JUMPV
LABELV $111
line 152
;151:			}
;152:			Q_strncpyz( key, token, sizeof( key ) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 154
;153:
;154:			token = COM_ParseExt( &buf, qfalse );
ADDRFP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 2084
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2084
INDIRP4
ASGNP4
line 155
;155:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $114
line 156
;156:				strcpy( token, "<NULL>" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 157
;157:			}
LABELV $114
line 158
;158:			Info_SetValueForKey( info, key, token );
ADDRLP4 1028
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 159
;159:		}
LABELV $106
line 143
ADDRGP4 $105
JUMPV
LABELV $107
line 163
;160:
;161:		// Hypo: check arena actually exists as a .bsp file
;162:		// since bots also use this code, we don't want to exclude them!
;163:		filename = Info_ValueForKey(info, "map");
ADDRLP4 1028
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 2076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2056
ADDRLP4 2076
INDIRP4
ASGNP4
line 164
;164:		if (filename[0])
ADDRLP4 2056
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $118
line 165
;165:		{
line 166
;166:			len = trap_FS_FOpenFile(va("maps/%s.bsp", filename), &file, FS_READ);
ADDRGP4 $120
ARGP4
ADDRLP4 2056
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRLP4 2060
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 2084
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 2064
ADDRLP4 2084
INDIRI4
ASGNI4
line 167
;167:			if (len <= 0)
ADDRLP4 2064
INDIRI4
CNSTI4 0
GTI4 $121
line 168
;168:			{
line 170
;169://				trap_Print(va("Map not found (ignored): %s, code=%i\n", filename, len));
;170:				continue;
ADDRGP4 $94
JUMPV
LABELV $121
line 173
;171:			}
;172:
;173:			trap_FS_FCloseFile(file);
ADDRLP4 2060
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 175
;174://			trap_Print(va("Map Found: %s\n", filename));
;175:		}
LABELV $118
line 177
;176:
;177:		if (UI_StoreInfo(info, &infos[count]))
ADDRLP4 1028
ARGP4
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ARGP4
ADDRLP4 2080
ADDRGP4 UI_StoreInfo
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
EQI4 $123
line 178
;178:			count++;
ADDRLP4 2052
ADDRLP4 2052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $123
line 179
;179:	}
LABELV $94
line 127
ADDRGP4 $93
JUMPV
LABELV $95
line 181
;180:
;181:	return count;
ADDRLP4 2052
INDIRI4
RETI4
LABELV $92
endproc UI_ParseInfos 2088 12
proc UI_LoadArenasFromFile 8216 16
line 189
;182:}
;183:
;184:/*
;185:===============
;186:UI_LoadArenasFromFile
;187:===============
;188:*/
;189:static void UI_LoadArenasFromFile( char *filename ) {
line 194
;190:	int				len;
;191:	fileHandle_t	f;
;192:	char			buf[MAX_ARENAS_TEXT];
;193:
;194:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 195
;195:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $126
line 196
;196:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $128
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 197
;197:		return;
ADDRGP4 $125
JUMPV
LABELV $126
line 199
;198:	}
;199:	if ( len >= MAX_ARENAS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $129
line 200
;200:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_ARENAS_TEXT ) );
ADDRGP4 $131
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 201
;201:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 202
;202:		return;
ADDRGP4 $125
JUMPV
LABELV $129
line 205
;203:	}
;204:
;205:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 206
;206:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 207
;207:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 209
;208:
;209:	ui_numArenas += UI_ParseInfos( buf, MAX_ARENAS - ui_numArenas, &ui_arenaInfos[ui_numArenas] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 ui_numArenas
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 UI_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 210
;210:}
LABELV $125
endproc UI_LoadArenasFromFile 8216 16
proc UI_LoadUnscriptedMaps 48 16
line 221
;211:
;212:
;213:
;214:
;215:/*
;216:===============
;217:UI_LoadUnscriptedMaps
;218:===============
;219:*/
;220:static void UI_LoadUnscriptedMaps( void )
;221:{
line 227
;222:	int i;
;223:	int dirlen;
;224:	int nummaps;
;225:	char* dirptr;
;226:
;227:	nummaps = trap_FS_GetFileList("maps", ".bsp", dirlist, DIRLIST_SIZE );
ADDRGP4 $133
ARGP4
ADDRGP4 $134
ARGP4
ADDRGP4 dirlist
ARGP4
CNSTI4 16384
ARGI4
ADDRLP4 16
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 228
;228:	dirptr = dirlist;
ADDRLP4 0
ADDRGP4 dirlist
ASGNP4
line 229
;229:	for (i = 0; i < nummaps;  i++, dirptr+= dirlen + 1) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $135
line 230
;230:		if (ui_numArenas == MAX_ARENAS)
ADDRGP4 ui_numArenas
INDIRI4
CNSTI4 1024
NEI4 $139
line 231
;231:			break;
ADDRGP4 $137
JUMPV
LABELV $139
line 233
;232:
;233:		dirlen = strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 235
;234:
;235:		COM_StripExtensionOld(dirptr, dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 COM_StripExtensionOld
CALLI4
pop
line 237
;236:
;237:		if (UI_GetArenaInfoByMap( dirptr ))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
line 238
;238:			continue;
ADDRGP4 $136
JUMPV
LABELV $141
line 240
;239:
;240:		if (UI_StoreInfo(va("\\map\\%s", dirptr), &ui_arenaInfos[ui_numArenas])) {
ADDRGP4 $145
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 ui_numArenas
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_StoreInfo
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $143
line 241
;241:			trap_Print(va("Found unscripted map: %s\n", dirptr));
ADDRGP4 $146
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 242
;242:			ui_numArenas++;
ADDRLP4 44
ADDRGP4 ui_numArenas
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 243
;243:		}
LABELV $143
line 244
;244:	}
LABELV $136
line 229
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $138
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $135
LABELV $137
line 245
;245:}
LABELV $132
endproc UI_LoadUnscriptedMaps 48 16
proc GameInfo_RemoveSingleFromArena 1052 12
line 259
;246:
;247:
;248:
;249:
;250:/*
;251:===============
;252:GameInfo_RemoveSingleFromArena
;253:
;254:The replacement value is always the same length or shorter, so
;255:we won't have problems with overruns in UI_Alloc()
;256:===============
;257:*/
;258:static void GameInfo_RemoveSingleFromArena( char* info )
;259:{
line 265
;260:	char newvalue[MAX_INFO_STRING];
;261:	char* value;
;262:	char* single;
;263:	char *p, *q;
;264:
;265:	value = Info_ValueForKey(info, "type");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 1040
INDIRP4
ASGNP4
line 266
;266:	if (!value[0])
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $149
line 267
;267:		return;
ADDRGP4 $147
JUMPV
LABELV $149
line 269
;268:
;269:	single = strstr(value, "single");
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $151
ARGP4
ADDRLP4 1044
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1044
INDIRP4
ASGNP4
line 270
;270:	if (!single)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $152
line 271
;271:		return;
ADDRGP4 $147
JUMPV
LABELV $152
line 273
;272:
;273:	p = newvalue;
ADDRLP4 4
ADDRLP4 16
ASGNP4
line 274
;274:	q = value;
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRGP4 $155
JUMPV
LABELV $154
line 275
;275:	while (qtrue) {
line 276
;276:		if (q == single) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
NEU4 $157
line 277
;277:			q += strlen("single");
ADDRGP4 $151
ARGP4
ADDRLP4 1048
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1048
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
ADDRGP4 $160
JUMPV
LABELV $159
line 279
;278:			while (*q == ' ')
;279:				q++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $160
line 278
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $159
line 280
;280:		}
LABELV $157
line 282
;281:
;282:		*p = *q;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 284
;283:
;284:		if (!*p)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $162
line 285
;285:			break;
ADDRGP4 $156
JUMPV
LABELV $162
line 286
;286:		p++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 287
;287:		q++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 288
;288:	};
LABELV $155
line 275
ADDRGP4 $154
JUMPV
LABELV $156
line 288
line 291
;289:
;290://	trap_Print(va("replacement value: %s\n", newvalue));
;291:	Info_SetValueForKey(info, "type", newvalue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 292
;292:}
LABELV $147
endproc GameInfo_RemoveSingleFromArena 1052 12
export UI_LoadArenas
proc UI_LoadArenas 524 16
line 302
;293:
;294:
;295:
;296:
;297:/*
;298:===============
;299:UI_LoadArenas
;300:===============
;301:*/
;302:void UI_LoadArenas( void ) {
line 319
;303:	int			numdirs;
;304:	vmCvar_t	arenasFile;
;305:	char		filename[128];
;306:	char*		dirptr;
;307:	int			i, j, n;
;308:	int			dirlen;
;309:	char		*type;
;310:	char		*tag;
;311:	int			singlePlayerNum, specialNum, otherNum;
;312://	char		tmpinfo[MAX_INFO_STRING];
;313:	char*		tmpinfo;
;314:	int			startArenaScript;
;315:	int			swap;
;316:	char 		bestMap[MAX_MAPNAME];
;317:	char*		thisMap;
;318:
;319:	ui_numArenas = 0;
ADDRGP4 ui_numArenas
CNSTI4 0
ASGNI4
line 321
;320:
;321:	trap_Cvar_Register( &arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 216
ARGP4
ADDRGP4 $165
ARGP4
ADDRGP4 $166
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 322
;322:	if( *arenasFile.string ) {
ADDRLP4 216+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $167
line 323
;323:		UI_LoadArenasFromFile(arenasFile.string);
ADDRLP4 216+16
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 324
;324:	}
ADDRGP4 $168
JUMPV
LABELV $167
line 325
;325:	else {
line 326
;326:		UI_LoadArenasFromFile("scripts/arenas.txt");
ADDRGP4 $171
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 327
;327:	}
LABELV $168
line 329
;328:
;329:	startArenaScript = ui_numArenas;
ADDRLP4 488
ADDRGP4 ui_numArenas
INDIRI4
ASGNI4
line 332
;330:
;331:	// get all arenas from .arena files
;332:	numdirs = trap_FS_GetFileList("scripts", ".arena", dirlist, DIRLIST_SIZE );
ADDRGP4 $172
ARGP4
ADDRGP4 $173
ARGP4
ADDRGP4 dirlist
ARGP4
CNSTI4 16384
ARGI4
ADDRLP4 492
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 196
ADDRLP4 492
INDIRI4
ASGNI4
line 333
;333:	dirptr  = dirlist;
ADDRLP4 56
ADDRGP4 dirlist
ASGNP4
line 334
;334:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRGP4 $177
JUMPV
LABELV $174
line 335
;335:		dirlen = strlen(dirptr);
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 496
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 188
ADDRLP4 496
INDIRI4
ASGNI4
line 336
;336:		strcpy(filename, "scripts/");
ADDRLP4 60
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 337
;337:		strcat(filename, dirptr);
ADDRLP4 60
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 338
;338:		UI_LoadArenasFromFile(filename);
ADDRLP4 60
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 339
;339:	}
LABELV $175
line 334
ADDRLP4 496
CNSTI4 1
ASGNI4
ADDRLP4 48
ADDRLP4 48
INDIRI4
ADDRLP4 496
INDIRI4
ADDI4
ASGNI4
ADDRLP4 56
ADDRLP4 188
INDIRI4
ADDRLP4 496
INDIRI4
ADDI4
ADDRLP4 56
INDIRP4
ADDP4
ASGNP4
LABELV $177
ADDRLP4 48
INDIRI4
ADDRLP4 196
INDIRI4
LTI4 $174
line 341
;340:
;341:	UI_LoadUnscriptedMaps();
ADDRGP4 UI_LoadUnscriptedMaps
CALLV
pop
line 343
;342:
;343:	trap_Print( va( "%i arenas parsed\n", ui_numArenas ) );
ADDRGP4 $179
ARGP4
ADDRGP4 ui_numArenas
INDIRI4
ARGI4
ADDRLP4 500
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 500
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 345
;344:
;345:	if (outOfMemory) trap_Print(S_COLOR_YELLOW"WARNING: not anough memory in pool to load all arenas\n");
ADDRGP4 outOfMemory
INDIRI4
CNSTI4 0
EQI4 $180
ADDRGP4 $182
ARGP4
ADDRGP4 trap_Print
CALLV
pop
LABELV $180
line 353
;346:
;347://	trap_Print(va("Sort: %i to %i\n", startArenaScript, ui_numArenas));
;348:
;349:	// sort the arenas we loaded from the .arena files, by mapname
;350:	// we leave the original Id levels (and those in an overriding
;351:	// arenas.txt) unchanged
;352:	// not the most efficient sorting method, but we're only going to do it once
;353:	for (i = startArenaScript - 1; i < ui_numArenas - 1; i++) {
ADDRLP4 48
ADDRLP4 488
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $183
line 354
;354:		swap = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 355
;355:		Q_strncpyz(bestMap, Info_ValueForKey(ui_arenaInfos[i],"map"), MAX_MAPNAME);
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 504
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 357
;356:
;357:		if (!bestMap[0])
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
line 358
;358:			continue;
ADDRGP4 $184
JUMPV
LABELV $187
line 360
;359:
;360:		for (j = i + 1; j < ui_numArenas; j++) {
ADDRLP4 0
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $192
JUMPV
LABELV $189
line 361
;361:			thisMap = Info_ValueForKey(ui_arenaInfos[j], "map");
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 508
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 508
INDIRP4
ASGNP4
line 363
;362:
;363:			if (!thisMap[0])
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $193
line 364
;364:				continue;
ADDRGP4 $190
JUMPV
LABELV $193
line 366
;365:
;366:			if (Q_stricmp(thisMap, bestMap) < 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 512
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 512
INDIRI4
CNSTI4 0
GEI4 $195
line 367
;367:				Q_strncpyz(bestMap, thisMap, MAX_MAPNAME);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 368
;368:				swap = j;
ADDRLP4 44
ADDRLP4 0
INDIRI4
ASGNI4
line 369
;369:			}
LABELV $195
line 370
;370:		}
LABELV $190
line 360
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $192
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $189
line 372
;371:
;372:		if (swap) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $197
line 374
;373://			trap_Print(va("swap: %s with %s\n", bestMap, Info_ValueForKey(ui_arenaInfos[i], "map")));
;374:			tmpinfo = ui_arenaInfos[i];
ADDRLP4 204
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ASGNP4
line 375
;375:			ui_arenaInfos[i] = ui_arenaInfos[swap];
ADDRLP4 508
CNSTI4 2
ASGNI4
ADDRLP4 512
ADDRGP4 ui_arenaInfos
ASGNP4
ADDRLP4 48
INDIRI4
ADDRLP4 508
INDIRI4
LSHI4
ADDRLP4 512
INDIRP4
ADDP4
ADDRLP4 44
INDIRI4
ADDRLP4 508
INDIRI4
LSHI4
ADDRLP4 512
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 376
;376:			ui_arenaInfos[swap] = tmpinfo;
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
ADDRLP4 204
INDIRP4
ASGNP4
line 377
;377:		}
LABELV $197
line 378
;378:	}
LABELV $184
line 353
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $186
ADDRLP4 48
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
CNSTI4 1
SUBI4
LTI4 $183
line 381
;379:
;380:	// set initial numbers
;381:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $202
JUMPV
LABELV $199
line 382
;382:		Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", n ) );
ADDRGP4 $204
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 504
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 504
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 383
;383:	}
LABELV $200
line 381
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $202
ADDRLP4 40
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $199
line 386
;384:
;385:	// go through and count single players levels
;386:	ui_numSinglePlayerArenas = 0;
ADDRGP4 ui_numSinglePlayerArenas
CNSTI4 0
ASGNI4
line 387
;387:	ui_numSpecialSinglePlayerArenas = 0;
ADDRGP4 ui_numSpecialSinglePlayerArenas
CNSTI4 0
ASGNI4
line 388
;388:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $205
line 390
;389:		// determine type
;390:		type = Info_ValueForKey( ui_arenaInfos[n], "type" );
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 504
INDIRP4
ASGNP4
line 393
;391:
;392:		// if no type specified, it will be treated as "ffa"
;393:		if( !*type ) {
ADDRLP4 52
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $209
line 394
;394:			continue;
ADDRGP4 $206
JUMPV
LABELV $209
line 397
;395:		}
;396:
;397:		if( strstr( type, "single" ) ) {
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $151
ARGP4
ADDRLP4 508
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 508
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $211
line 399
;398:			// check for special single player arenas (training, final)
;399:			tag = Info_ValueForKey( ui_arenaInfos[n], "special" );
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 512
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 192
ADDRLP4 512
INDIRP4
ASGNP4
line 400
;400:			if( *tag ) {
ADDRLP4 192
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $214
line 401
;401:				ui_numSpecialSinglePlayerArenas++;
ADDRLP4 516
ADDRGP4 ui_numSpecialSinglePlayerArenas
ASGNP4
ADDRLP4 516
INDIRP4
ADDRLP4 516
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 402
;402:				continue;
ADDRGP4 $206
JUMPV
LABELV $214
line 405
;403:			}
;404:
;405:			ui_numSinglePlayerArenas++;
ADDRLP4 516
ADDRGP4 ui_numSinglePlayerArenas
ASGNP4
ADDRLP4 516
INDIRP4
ADDRLP4 516
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 406
;406:		}
LABELV $211
line 407
;407:	}
LABELV $206
line 388
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $208
ADDRLP4 40
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $205
line 409
;408:
;409:	n = ui_numSinglePlayerArenas % ARENAS_PER_TIER;
ADDRLP4 40
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 410
;410:	if( n != 0 ) {
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $216
line 411
;411:		ui_numSinglePlayerArenas -= n;
ADDRLP4 504
ADDRGP4 ui_numSinglePlayerArenas
ASGNP4
ADDRLP4 504
INDIRP4
ADDRLP4 504
INDIRP4
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ASGNI4
line 412
;412:		trap_Print( va( "%i arenas ignored to make count divisible by %i\n", n, ARENAS_PER_TIER ) );
ADDRGP4 $218
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 508
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 508
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 413
;413:	}
LABELV $216
line 416
;414:
;415:	// go through once more and assign number to the levels
;416:	singlePlayerNum = 0;
ADDRLP4 208
CNSTI4 0
ASGNI4
line 417
;417:	specialNum = singlePlayerNum + ui_numSinglePlayerArenas;
ADDRLP4 212
ADDRLP4 208
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
ADDI4
ASGNI4
line 418
;418:	otherNum = specialNum + ui_numSpecialSinglePlayerArenas;
ADDRLP4 200
ADDRLP4 212
INDIRI4
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
ADDI4
ASGNI4
line 419
;419:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $222
JUMPV
LABELV $219
line 421
;420:		// determine type
;421:		type = Info_ValueForKey( ui_arenaInfos[n], "type" );
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
ADDRLP4 504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 504
INDIRP4
ASGNP4
line 424
;422:
;423:		// if no type specified, it will be treated as "ffa"
;424:		if( *type ) {
ADDRLP4 52
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $223
line 425
;425:			if( strstr( type, "single" ) ) {
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $151
ARGP4
ADDRLP4 508
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 508
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $225
line 427
;426:				// check for special single player arenas (training, final)
;427:				tag = Info_ValueForKey( ui_arenaInfos[n], "special" );
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 512
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 192
ADDRLP4 512
INDIRP4
ASGNP4
line 428
;428:				if( *tag ) {
ADDRLP4 192
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $227
line 429
;429:					Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", specialNum++ ) );
ADDRGP4 $204
ARGP4
ADDRLP4 516
ADDRLP4 212
INDIRI4
ASGNI4
ADDRLP4 212
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 516
INDIRI4
ARGI4
ADDRLP4 520
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 520
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 430
;430:					continue;
ADDRGP4 $220
JUMPV
LABELV $227
line 442
;431:				}
;432:
;433:				// if some arenas were ignored (above), then we bypass giving them
;434:				// a single player number, and give them an otherNum instead.
;435:				// Id maps will always grab the single player values first because
;436:				// they're in the legacy arenas.txt. Other multiples of ARENAS_PER_TIER
;437:				// will also get through, so we can still add in tier packs.
;438:				// Unfortunately, 1 map pk3's (like halven.pk3) with the "single" tag set
;439:				// might "push" off one of the tier maps... there's nothing we can
;440:				// do about this except provide an over-riding .arena script
;441:				// that removes the "single" tag
;442:				if (singlePlayerNum < ui_numSinglePlayerArenas) {
ADDRLP4 208
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
GEI4 $229
line 443
;443:					Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", singlePlayerNum++ ) );
ADDRGP4 $204
ARGP4
ADDRLP4 516
ADDRLP4 208
INDIRI4
ASGNI4
ADDRLP4 208
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 516
INDIRI4
ARGI4
ADDRLP4 520
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 520
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 444
;444:					continue;
ADDRGP4 $220
JUMPV
LABELV $229
line 446
;445:				}
;446:				else {
line 447
;447:					trap_Print(va("..single player map \"%s\" dropped\n", Info_ValueForKey(ui_arenaInfos[n], "map")));
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 516
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $231
ARGP4
ADDRLP4 516
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 520
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 448
;448:					GameInfo_RemoveSingleFromArena(ui_arenaInfos[n]);
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 GameInfo_RemoveSingleFromArena
CALLV
pop
line 449
;449:				}
line 450
;450:			}
LABELV $225
line 451
;451:		}	/* (*type) */
LABELV $223
line 453
;452:
;453:		Info_SetValueForKey( ui_arenaInfos[n], "num", va( "%i", otherNum++ ) );
ADDRGP4 $204
ARGP4
ADDRLP4 508
ADDRLP4 200
INDIRI4
ASGNI4
ADDRLP4 200
ADDRLP4 508
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 508
INDIRI4
ARGI4
ADDRLP4 512
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 512
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 455
;454:
;455:	}
LABELV $220
line 419
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $222
ADDRLP4 40
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $219
line 456
;456:}
LABELV $164
endproc UI_LoadArenas 524 16
export UI_GetArenaInfoByNumber
proc UI_GetArenaInfoByNumber 24 8
line 463
;457:
;458:/*
;459:===============
;460:UI_GetArenaInfoByNumber
;461:===============
;462:*/
;463:const char *UI_GetArenaInfoByNumber( int num ) {
line 467
;464:	int		n;
;465:	char	*value;
;466:
;467:	if( num < 0 || num >= ui_numArenas ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $235
ADDRLP4 8
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $233
LABELV $235
line 468
;468:		trap_Print( va( S_COLOR_RED "Invalid arena number: %i\n", num ) );
ADDRGP4 $236
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 469
;469:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $232
JUMPV
LABELV $233
line 472
;470:	}
;471:
;472:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $240
JUMPV
LABELV $237
line 473
;473:		value = Info_ValueForKey( ui_arenaInfos[n], "num" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 474
;474:		if( *value && atoi(value) == num ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $241
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $241
line 475
;475:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $232
JUMPV
LABELV $241
line 477
;476:		}
;477:	}
LABELV $238
line 472
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $240
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $237
line 479
;478:
;479:	return NULL;
CNSTP4 0
RETP4
LABELV $232
endproc UI_GetArenaInfoByNumber 24 8
export UI_GetArenaInfoByMap
proc UI_GetArenaInfoByMap 12 8
line 488
;480:}
;481:
;482:
;483:/*
;484:===============
;485:UI_GetArenaInfoByMap
;486:===============
;487:*/
;488:const char *UI_GetArenaInfoByMap( const char *map ) {
line 491
;489:	int			n;
;490:
;491:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $244
line 492
;492:		if( Q_stricmp( Info_ValueForKey( ui_arenaInfos[n], "map" ), map ) == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 4
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $248
line 493
;493:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $243
JUMPV
LABELV $248
line 495
;494:		}
;495:	}
LABELV $245
line 491
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $247
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $244
line 497
;496:
;497:	return NULL;
CNSTP4 0
RETP4
LABELV $243
endproc UI_GetArenaInfoByMap 12 8
export UI_GetSpecialArenaInfo
proc UI_GetSpecialArenaInfo 12 8
line 509
;498:}
;499:
;500:
;501:
;502:
;503:
;504:/*
;505:===============
;506:UI_GetSpecialArenaInfo
;507:===============
;508:*/
;509:const char *UI_GetSpecialArenaInfo( const char *tag ) {
line 512
;510:	int			n;
;511:
;512:	for( n = 0; n < ui_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $254
JUMPV
LABELV $251
line 513
;513:		if( Q_stricmp( Info_ValueForKey( ui_arenaInfos[n], "special" ), tag ) == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 4
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $255
line 514
;514:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $250
JUMPV
LABELV $255
line 516
;515:		}
;516:	}
LABELV $252
line 512
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $254
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $251
line 518
;517:
;518:	return NULL;
CNSTP4 0
RETP4
LABELV $250
endproc UI_GetSpecialArenaInfo 12 8
proc UI_LoadBotsFromFile 16408 16
line 529
;519:}
;520:
;521:
;522:
;523:
;524:/*
;525:===============
;526:UI_LoadBotsFromFile
;527:===============
;528:*/
;529:static void UI_LoadBotsFromFile( char *filename ) {
line 534
;530:	int				len;
;531:	fileHandle_t	f;
;532:	char			buf[MAX_BOTS_TEXT];
;533:
;534:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16392
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16392
INDIRI4
ASGNI4
line 535
;535:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $258
line 536
;536:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $128
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16396
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 537
;537:		return;
ADDRGP4 $257
JUMPV
LABELV $258
line 539
;538:	}
;539:	if ( len >= MAX_BOTS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 16384
LTI4 $260
line 540
;540:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_BOTS_TEXT ) );
ADDRGP4 $131
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 16384
ARGI4
ADDRLP4 16396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16396
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 541
;541:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 542
;542:		return;
ADDRGP4 $257
JUMPV
LABELV $260
line 545
;543:	}
;544:
;545:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 546
;546:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 547
;547:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 549
;548:
;549:	ui_numBots += UI_ParseInfos( buf, MAX_BOTS - ui_numBots, &ui_botInfos[ui_numBots] );
ADDRLP4 8
ARGP4
ADDRLP4 16396
ADDRGP4 ui_numBots
ASGNP4
ADDRLP4 16400
ADDRLP4 16396
INDIRP4
INDIRI4
ASGNI4
CNSTI4 2048
ADDRLP4 16400
INDIRI4
SUBI4
ARGI4
ADDRLP4 16400
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
ARGP4
ADDRLP4 16404
ADDRGP4 UI_ParseInfos
CALLI4
ASGNI4
ADDRLP4 16396
INDIRP4
ADDRLP4 16400
INDIRI4
ADDRLP4 16404
INDIRI4
ADDI4
ASGNI4
line 551
;550:
;551:	if (outOfMemory) trap_Print(S_COLOR_YELLOW"WARNING: not anough memory in pool to load all bots\n");
ADDRGP4 outOfMemory
INDIRI4
CNSTI4 0
EQI4 $262
ADDRGP4 $264
ARGP4
ADDRGP4 trap_Print
CALLV
pop
LABELV $262
line 552
;552:}
LABELV $257
endproc UI_LoadBotsFromFile 16408 16
export UI_LoadBots
proc UI_LoadBots 428 16
line 559
;553:
;554:/*
;555:===============
;556:UI_LoadBots
;557:===============
;558:*/
;559:void UI_LoadBots( void ) {
line 568
;560:	vmCvar_t	botsFile;
;561:	int			numdirs;
;562:	char		filename[128];
;563://	char		dirlist[1024];
;564:	char*		dirptr;
;565:	int			i;
;566:	int			dirlen;
;567:
;568:	ui_numBots = 0;
ADDRGP4 ui_numBots
CNSTI4 0
ASGNI4
line 570
;569:
;570:	trap_Cvar_Register( &botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 144
ARGP4
ADDRGP4 $266
ARGP4
ADDRGP4 $166
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 571
;571:	if( *botsFile.string ) {
ADDRLP4 144+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $267
line 572
;572:		UI_LoadBotsFromFile(botsFile.string);
ADDRLP4 144+16
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 573
;573:	}
ADDRGP4 $268
JUMPV
LABELV $267
line 574
;574:	else {
line 575
;575:		UI_LoadBotsFromFile("scripts/bots.txt");
ADDRGP4 $271
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 576
;576:	}
LABELV $268
line 579
;577:
;578:	// get all bots from .bot files
;579:	numdirs = trap_FS_GetFileList("scripts", ".bot", dirlist, DIRLIST_SIZE );
ADDRGP4 $172
ARGP4
ADDRGP4 $272
ARGP4
ADDRGP4 dirlist
ARGP4
CNSTI4 16384
ARGI4
ADDRLP4 416
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 416
INDIRI4
ASGNI4
line 580
;580:	dirptr  = dirlist;
ADDRLP4 0
ADDRGP4 dirlist
ASGNP4
line 581
;581:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $273
line 582
;582:		dirlen = strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 420
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 420
INDIRI4
ASGNI4
line 583
;583:		strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 584
;584:		strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 585
;585:		UI_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 586
;586:	}
LABELV $274
line 581
ADDRLP4 420
CNSTI4 1
ASGNI4
ADDRLP4 132
ADDRLP4 132
INDIRI4
ADDRLP4 420
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 136
INDIRI4
ADDRLP4 420
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $276
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $273
line 587
;587:	trap_Print( va( "%i bots parsed\n", ui_numBots ) );
ADDRGP4 $277
ARGP4
ADDRGP4 ui_numBots
INDIRI4
ARGI4
ADDRLP4 424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 424
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 588
;588:}
LABELV $265
endproc UI_LoadBots 428 16
export UI_GetBotInfoByNumber
proc UI_GetBotInfoByNumber 8 8
line 596
;589:
;590:
;591:/*
;592:===============
;593:UI_GetBotInfoByNumber
;594:===============
;595:*/
;596:char *UI_GetBotInfoByNumber( int num ) {
line 597
;597:	if( num < 0 || num >= ui_numBots ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $281
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $279
LABELV $281
line 598
;598:		trap_Print( va( S_COLOR_RED "Invalid bot number: %i\n", num ) );
ADDRGP4 $282
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 599
;599:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $278
JUMPV
LABELV $279
line 601
;600:	}
;601:	return ui_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
RETP4
LABELV $278
endproc UI_GetBotInfoByNumber 8 8
export UI_GetBotInfoByName
proc UI_GetBotInfoByName 16 8
line 610
;602:}
;603:
;604:
;605:/*
;606:===============
;607:UI_GetBotInfoByName
;608:===============
;609:*/
;610:char *UI_GetBotInfoByName( const char *name ) {
line 614
;611:	int		n;
;612:	char	*value;
;613:
;614:	for ( n = 0; n < ui_numBots ; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $287
JUMPV
LABELV $284
line 615
;615:		value = Info_ValueForKey( ui_botInfos[n], "name" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 616
;616:		if ( !Q_stricmp( value, name ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $289
line 617
;617:			return ui_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $283
JUMPV
LABELV $289
line 619
;618:		}
;619:	}
LABELV $285
line 614
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $287
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $284
line 621
;620:
;621:	return NULL;
CNSTP4 0
RETP4
LABELV $283
endproc UI_GetBotInfoByName 16 8
export UI_GetNumBots
proc UI_GetNumBots 0 0
line 631
;622:}
;623:
;624:
;625:
;626:/*
;627:===============
;628:UI_GetNumBots
;629:===============
;630:*/
;631:int UI_GetNumBots( void ) {
line 632
;632:	return ui_numBots;
ADDRGP4 ui_numBots
INDIRI4
RETI4
LABELV $291
endproc UI_GetNumBots 0 0
export UI_GetBotNumByName
proc UI_GetBotNumByName 16 8
line 643
;633:}
;634:
;635:
;636:
;637:
;638:/*
;639:===============
;640:UI_GetBotNumByName
;641:===============
;642:*/
;643:int UI_GetBotNumByName( const char *name ) {
line 647
;644:	int		n;
;645:	char	*value;
;646:
;647:	for ( n = 0; n < ui_numBots ; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $296
JUMPV
LABELV $293
line 648
;648:		value = Info_ValueForKey( ui_botInfos[n], "name" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 649
;649:		if ( !Q_stricmp( value, name ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $297
line 650
;650:			return n;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $292
JUMPV
LABELV $297
line 652
;651:		}
;652:	}
LABELV $294
line 647
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $296
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $293
line 654
;653:
;654:	return -1;
CNSTI4 -1
RETI4
LABELV $292
endproc UI_GetBotNumByName 16 8
export UI_GetBotNameByNumber
proc UI_GetBotNameByNumber 12 8
line 659
;655:}
;656:
;657:
;658:
;659:char *UI_GetBotNameByNumber( int num ) {
line 660
;660:	char *info = UI_GetBotInfoByNumber(num);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 661
;661:	if (info) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $300
line 662
;662:		return Info_ValueForKey( info, "name" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $299
JUMPV
LABELV $300
line 664
;663:	}
;664:	return "Sarge";
ADDRGP4 $302
RETP4
LABELV $299
endproc UI_GetBotNameByNumber 12 8
export UI_GetNumArenas
proc UI_GetNumArenas 0 0
line 674
;665:}
;666:
;667:
;668:
;669:/*
;670:===============
;671:UI_GetNumArenas
;672:===============
;673:*/
;674:int UI_GetNumArenas( void ) {
line 675
;675:	return ui_numArenas;
ADDRGP4 ui_numArenas
INDIRI4
RETI4
LABELV $303
endproc UI_GetNumArenas 0 0
export UI_GetBestScore
proc UI_GetBestScore 1084 16
line 695
;676:}
;677:
;678:
;679:
;680:
;681:
;682:
;683:
;684://
;685:// single player game info
;686://
;687:
;688:/*
;689:===============
;690:UI_GetBestScore
;691:
;692:Returns the player's best finish on a given level, 0 if the have not played the level
;693:===============
;694:*/
;695:void UI_GetBestScore( int level, int *score, int *skill ) {
line 703
;696:	int		n;
;697:	int		skillScore;
;698:	int		bestScore;
;699:	int		bestScoreSkill;
;700:	char	arenaKey[16];
;701:	char	scores[MAX_INFO_VALUE];
;702:
;703:	if( !score || !skill ) {
ADDRLP4 1056
CNSTU4 0
ASGNU4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 1056
INDIRU4
EQU4 $307
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRLP4 1056
INDIRU4
NEU4 $305
LABELV $307
line 704
;704:		return;
ADDRGP4 $304
JUMPV
LABELV $305
line 707
;705:	}
;706:
;707:	if( level < 0 || level > ui_numArenas ) {
ADDRLP4 1060
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
LTI4 $310
ADDRLP4 1060
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LEI4 $308
LABELV $310
line 708
;708:		return;
ADDRGP4 $304
JUMPV
LABELV $308
line 711
;709:	}
;710:
;711:	bestScore = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 712
;712:	bestScoreSkill = 0;
ADDRLP4 1052
CNSTI4 0
ASGNI4
line 714
;713:
;714:	for( n = 1; n <= 5; n++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $311
line 715
;715:		trap_Cvar_VariableStringBuffer( va( "g_spScores%i", n ), scores, MAX_INFO_VALUE );
ADDRGP4 $315
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 717
;716:
;717:		Com_sprintf( arenaKey, sizeof( arenaKey ), "l%i", level );
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $316
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 718
;718:		skillScore = atoi( Info_ValueForKey( scores, arenaKey ) );
ADDRLP4 28
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1068
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1072
INDIRI4
ASGNI4
line 720
;719:
;720:		if( skillScore < 1 || skillScore > 8 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $319
ADDRLP4 0
INDIRI4
CNSTI4 8
LEI4 $317
LABELV $319
line 721
;721:			continue;
ADDRGP4 $312
JUMPV
LABELV $317
line 724
;722:		}
;723:
;724:		if( !bestScore || skillScore <= bestScore ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $322
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $320
LABELV $322
line 725
;725:			bestScore = skillScore;
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
line 726
;726:			bestScoreSkill = n;
ADDRLP4 1052
ADDRLP4 4
INDIRI4
ASGNI4
line 727
;727:		}
LABELV $320
line 728
;728:	}
LABELV $312
line 714
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $311
line 730
;729:
;730:	*score = bestScore;
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ASGNI4
line 731
;731:	*skill = bestScoreSkill;
ADDRFP4 8
INDIRP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 732
;732:}
LABELV $304
endproc UI_GetBestScore 1084 16
export UI_SetBestScore
proc UI_SetBestScore 1084 16
line 742
;733:
;734:
;735:/*
;736:===============
;737:UI_SetBestScore
;738:
;739:Set the player's best finish for a level
;740:===============
;741:*/
;742:void UI_SetBestScore( int level, int score ) {
line 749
;743:	int		skill;
;744:	int		oldScore;
;745:	char	arenaKey[16];
;746:	char	scores[MAX_INFO_VALUE];
;747:
;748:	// validate score
;749:	if( score < 1 || score > 8 ) {
ADDRLP4 1048
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 1
LTI4 $326
ADDRLP4 1048
INDIRI4
CNSTI4 8
LEI4 $324
LABELV $326
line 750
;750:		return;
ADDRGP4 $323
JUMPV
LABELV $324
line 754
;751:	}
;752:
;753:	// validate skill
;754:	skill = (int)trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $327
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 1052
INDIRF4
CVFI4 4
ASGNI4
line 755
;755:	if( skill < 1 || skill > 5 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $330
ADDRLP4 0
INDIRI4
CNSTI4 5
LEI4 $328
LABELV $330
line 756
;756:		return;
ADDRGP4 $323
JUMPV
LABELV $328
line 760
;757:	}
;758:
;759:	// get scores
;760:	trap_Cvar_VariableStringBuffer( va( "g_spScores%i", skill ), scores, MAX_INFO_VALUE );
ADDRGP4 $315
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 763
;761:
;762:	// see if this is better
;763:	Com_sprintf( arenaKey, sizeof( arenaKey ), "l%i", level );
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $316
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 764
;764:	oldScore = atoi( Info_ValueForKey( scores, arenaKey ) );
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1068
INDIRI4
ASGNI4
line 765
;765:	if( oldScore && oldScore <= score ) {
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $331
ADDRLP4 1044
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $331
line 766
;766:		return;
ADDRGP4 $323
JUMPV
LABELV $331
line 770
;767:	}
;768:
;769:	// update scores
;770:	Info_SetValueForKey( scores, arenaKey, va( "%i", score ) );
ADDRGP4 $204
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 771
;771:	trap_Cvar_Set( va( "g_spScores%i", skill ), scores );
ADDRGP4 $315
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 772
;772:}
LABELV $323
endproc UI_SetBestScore 1084 16
export UI_LogAwardData
proc UI_LogAwardData 1056 16
line 780
;773:
;774:
;775:/*
;776:===============
;777:UI_LogAwardData
;778:===============
;779:*/
;780:void UI_LogAwardData( int award, int data ) {
line 785
;781:	char	key[16];
;782:	char	awardData[MAX_INFO_VALUE];
;783:	int		oldValue;
;784:
;785:	if( data == 0 ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $334
line 786
;786:		return;
ADDRGP4 $333
JUMPV
LABELV $334
line 789
;787:	}
;788:
;789:	if( award > AWARD_PERFECT ) {
ADDRFP4 0
INDIRI4
CNSTI4 5
LEI4 $336
line 790
;790:		trap_Print( va( S_COLOR_RED "Bad award %i in UI_LogAwardData\n", award ) );
ADDRGP4 $338
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 791
;791:		return;
ADDRGP4 $333
JUMPV
LABELV $336
line 794
;792:	}
;793:
;794:	trap_Cvar_VariableStringBuffer( "g_spAwards", awardData, sizeof(awardData) );
ADDRGP4 $339
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 796
;795:
;796:	Com_sprintf( key, sizeof(key), "a%i", award );
ADDRLP4 1024
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $340
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 797
;797:	oldValue = atoi( Info_ValueForKey( awardData, key ) );
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1048
INDIRI4
ASGNI4
line 799
;798:
;799:	Info_SetValueForKey( awardData, key, va( "%i", oldValue + data ) );
ADDRGP4 $204
ARGP4
ADDRLP4 1040
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 800
;800:	trap_Cvar_Set( "g_spAwards", awardData );
ADDRGP4 $339
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 801
;801:}
LABELV $333
endproc UI_LogAwardData 1056 16
export UI_GetAwardLevel
proc UI_GetAwardLevel 1048 16
line 809
;802:
;803:
;804:/*
;805:===============
;806:UI_GetAwardLevel
;807:===============
;808:*/
;809:int UI_GetAwardLevel( int award ) {
line 813
;810:	char	key[16];
;811:	char	awardData[MAX_INFO_VALUE];
;812:
;813:	trap_Cvar_VariableStringBuffer( "g_spAwards", awardData, sizeof(awardData) );
ADDRGP4 $339
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 815
;814:
;815:	Com_sprintf( key, sizeof(key), "a%i", award );
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $340
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 816
;816:	return atoi( Info_ValueForKey( awardData, key ) );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
RETI4
LABELV $341
endproc UI_GetAwardLevel 1048 16
export UI_TierCompleted
proc UI_TierCompleted 56 12
line 825
;817:}
;818:
;819:
;820:/*
;821:===============
;822:UI_TierCompleted
;823:===============
;824:*/
;825:int UI_TierCompleted( int levelWon ) {
line 833
;826:	int			level;
;827:	int			n;
;828:	int			tier;
;829:	int			score;
;830:	int			skill;
;831:	const char	*info;
;832:
;833:	tier = levelWon / ARENAS_PER_TIER;
ADDRLP4 16
ADDRFP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 834
;834:	level = tier * ARENAS_PER_TIER;
ADDRLP4 0
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 836
;835:
;836:	if( tier == UI_GetNumSPTiers() ) {
ADDRLP4 24
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $343
line 837
;837:		info = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $345
ARGP4
ADDRLP4 28
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
line 838
;838:		if( levelWon == atoi( Info_ValueForKey( info, "num" ) ) ) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $346
line 839
;839:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $342
JUMPV
LABELV $346
line 841
;840:		}
;841:		info = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $348
ARGP4
ADDRLP4 40
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 40
INDIRP4
ASGNP4
line 842
;842:		if( !info || levelWon == atoi( Info_ValueForKey( info, "num" ) ) ) {
ADDRLP4 44
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $351
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 48
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $349
LABELV $351
line 843
;843:			return tier + 1;
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
RETI4
ADDRGP4 $342
JUMPV
LABELV $349
line 845
;844:		}
;845:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $342
JUMPV
LABELV $343
line 848
;846:	}
;847:
;848:	for( n = 0; n < ARENAS_PER_TIER; n++, level++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $352
line 849
;849:		UI_GetBestScore( level, &score, &skill );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 850
;850:		if ( score != 1 ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $356
line 851
;851:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $342
JUMPV
LABELV $356
line 853
;852:		}
;853:	}
LABELV $353
line 848
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $352
line 854
;854:	return tier + 1;
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $342
endproc UI_TierCompleted 56 12
export UI_ShowTierVideo
proc UI_ShowTierVideo 1052 16
line 863
;855:}
;856:
;857:
;858:/*
;859:===============
;860:UI_ShowTierVideo
;861:===============
;862:*/
;863:qboolean UI_ShowTierVideo( int tier ) {
line 867
;864:	char	key[16];
;865:	char	videos[MAX_INFO_VALUE];
;866:
;867:	if( tier <= 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $359
line 868
;868:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $358
JUMPV
LABELV $359
line 871
;869:	}
;870:
;871:	trap_Cvar_VariableStringBuffer( "g_spVideos", videos, sizeof(videos) );
ADDRGP4 $361
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 873
;872:
;873:	Com_sprintf( key, sizeof(key), "tier%i", tier );
ADDRLP4 1024
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $362
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 874
;874:	if( atoi( Info_ValueForKey( videos, key ) ) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $363
line 875
;875:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $358
JUMPV
LABELV $363
line 878
;876:	}
;877:
;878:	Info_SetValueForKey( videos, key, va( "%i", 1 ) );
ADDRGP4 $204
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 879
;879:	trap_Cvar_Set( "g_spVideos", videos );
ADDRGP4 $361
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 881
;880:
;881:	return qtrue;
CNSTI4 1
RETI4
LABELV $358
endproc UI_ShowTierVideo 1052 16
export UI_CanShowTierVideo
proc UI_CanShowTierVideo 1048 16
line 890
;882:}
;883:
;884:
;885:/*
;886:===============
;887:UI_CanShowTierVideo
;888:===============
;889:*/
;890:qboolean UI_CanShowTierVideo( int tier ) {
line 894
;891:	char	key[16];
;892:	char	videos[MAX_INFO_VALUE];
;893:
;894:	if( !tier ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $366
line 895
;895:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $365
JUMPV
LABELV $366
line 898
;896:	}
;897:
;898:	if( uis.demoversion && tier != 8 ) {
ADDRGP4 uis+11492
INDIRI4
CNSTI4 0
EQI4 $368
ADDRFP4 0
INDIRI4
CNSTI4 8
EQI4 $368
line 899
;899:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $365
JUMPV
LABELV $368
line 902
;900:	}
;901:
;902:	trap_Cvar_VariableStringBuffer( "g_spVideos", videos, sizeof(videos) );
ADDRGP4 $361
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 904
;903:
;904:	Com_sprintf( key, sizeof(key), "tier%i", tier );
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $362
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 905
;905:	if( atoi( Info_ValueForKey( videos, key ) ) ) {
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $371
line 906
;906:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $365
JUMPV
LABELV $371
line 909
;907:	}
;908:
;909:	return qfalse;
CNSTI4 0
RETI4
LABELV $365
endproc UI_CanShowTierVideo 1048 16
export UI_GetCurrentGame
proc UI_GetCurrentGame 32 12
line 920
;910:}
;911:
;912:
;913:/*
;914:===============
;915:UI_GetCurrentGame
;916:
;917:Returns the next level the player has not won
;918:===============
;919:*/
;920:int UI_GetCurrentGame( void ) {
line 926
;921:	int		level;
;922:	int		rank;
;923:	int		skill;
;924:	const char *info;
;925:
;926:	info = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $345
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 927
;927:	if( info ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $374
line 928
;928:		level = atoi( Info_ValueForKey( info, "num" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 929
;929:		UI_GetBestScore( level, &rank, &skill );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 930
;930:		if ( !rank || rank > 1 ) {
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $378
ADDRLP4 28
INDIRI4
CNSTI4 1
LEI4 $376
LABELV $378
line 931
;931:			return level;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $373
JUMPV
LABELV $376
line 933
;932:		}
;933:	}
LABELV $374
line 935
;934:
;935:	for( level = 0; level < ui_numSinglePlayerArenas; level++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $382
JUMPV
LABELV $379
line 936
;936:		UI_GetBestScore( level, &rank, &skill );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 937
;937:		if ( !rank || rank > 1 ) {
ADDRLP4 20
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $385
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $383
LABELV $385
line 938
;938:			return level;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $373
JUMPV
LABELV $383
line 940
;939:		}
;940:	}
LABELV $380
line 935
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $382
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
LTI4 $379
line 942
;941:
;942:	info = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $348
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 943
;943:	if( !info ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $386
line 944
;944:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $373
JUMPV
LABELV $386
line 946
;945:	}
;946:	return atoi( Info_ValueForKey( info, "num" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
LABELV $373
endproc UI_GetCurrentGame 32 12
export UI_NewGame
proc UI_NewGame 0 8
line 957
;947:}
;948:
;949:
;950:/*
;951:===============
;952:UI_NewGame
;953:
;954:Clears the scores and sets the difficutly level
;955:===============
;956:*/
;957:void UI_NewGame( void ) {
line 958
;958:	trap_Cvar_Set( "g_spScores1", "" );
ADDRGP4 $389
ARGP4
ADDRGP4 $166
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 959
;959:	trap_Cvar_Set( "g_spScores2", "" );
ADDRGP4 $390
ARGP4
ADDRGP4 $166
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 960
;960:	trap_Cvar_Set( "g_spScores3", "" );
ADDRGP4 $391
ARGP4
ADDRGP4 $166
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 961
;961:	trap_Cvar_Set( "g_spScores4", "" );
ADDRGP4 $392
ARGP4
ADDRGP4 $166
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 962
;962:	trap_Cvar_Set( "g_spScores5", "" );
ADDRGP4 $393
ARGP4
ADDRGP4 $166
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 963
;963:	trap_Cvar_Set( "g_spAwards", "" );
ADDRGP4 $339
ARGP4
ADDRGP4 $166
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 964
;964:	trap_Cvar_Set( "g_spVideos", "" );
ADDRGP4 $361
ARGP4
ADDRGP4 $166
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 965
;965:}
LABELV $388
endproc UI_NewGame 0 8
export UI_GetNumSPArenas
proc UI_GetNumSPArenas 0 0
line 974
;966:
;967:
;968:
;969:/*
;970:===============
;971:UI_GetNumSPArenas
;972:===============
;973:*/
;974:int UI_GetNumSPArenas( void ) {
line 975
;975:	return ui_numSinglePlayerArenas;
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
RETI4
LABELV $394
endproc UI_GetNumSPArenas 0 0
export UI_GetNumSPTiers
proc UI_GetNumSPTiers 0 0
line 984
;976:}
;977:
;978:
;979:/*
;980:===============
;981:UI_GetNumSPTiers
;982:===============
;983:*/
;984:int UI_GetNumSPTiers( void ) {
line 985
;985:	return ui_numSinglePlayerArenas / ARENAS_PER_TIER;
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
DIVI4
RETI4
LABELV $395
endproc UI_GetNumSPTiers 0 0
export UI_SPUnlock_f
proc UI_SPUnlock_f 1048 16
line 995
;986:}
;987:
;988:
;989:
;990:/*
;991:===============
;992:UI_SPUnlock_f
;993:===============
;994:*/
;995:void UI_SPUnlock_f( void ) {
line 1002
;996:	char	arenaKey[16];
;997:	char	scores[MAX_INFO_VALUE];
;998:	int		level;
;999:	int		tier;
;1000:
;1001:	// get scores for skill 1
;1002:	trap_Cvar_VariableStringBuffer( "g_spScores1", scores, MAX_INFO_VALUE );
ADDRGP4 $389
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1005
;1003:
;1004:	// update scores
;1005:	for( level = 0; level < ui_numSinglePlayerArenas + ui_numSpecialSinglePlayerArenas; level++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $400
JUMPV
LABELV $397
line 1006
;1006:		Com_sprintf( arenaKey, sizeof( arenaKey ), "l%i", level );
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $316
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1007
;1007:		Info_SetValueForKey( scores, arenaKey, "1" );
ADDRLP4 24
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 $401
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1008
;1008:	}
LABELV $398
line 1005
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $400
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
ADDI4
LTI4 $397
line 1009
;1009:	trap_Cvar_Set( "g_spScores1", scores );
ADDRGP4 $389
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1012
;1010:
;1011:	// unlock cinematics
;1012:	for( tier = 1; tier <= 8; tier++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $402
line 1013
;1013:		UI_ShowTierVideo( tier );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ShowTierVideo
CALLI4
pop
line 1014
;1014:	}
LABELV $403
line 1012
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LEI4 $402
line 1016
;1015:
;1016:	trap_Print( "All levels unlocked at skill level 1\n" );
ADDRGP4 $406
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 1018
;1017:
;1018:	UI_SPLevelMenu_ReInit();
ADDRGP4 UI_SPLevelMenu_ReInit
CALLV
pop
line 1019
;1019:}
LABELV $396
endproc UI_SPUnlock_f 1048 16
export UI_SPUnlockMedals_f
proc UI_SPUnlockMedals_f 1044 16
line 1027
;1020:
;1021:
;1022:/*
;1023:===============
;1024:UI_SPUnlockMedals_f
;1025:===============
;1026:*/
;1027:void UI_SPUnlockMedals_f( void ) {
line 1032
;1028:	int		n;
;1029:	char	key[16];
;1030:	char	awardData[MAX_INFO_VALUE];
;1031:
;1032:	trap_Cvar_VariableStringBuffer( "g_spAwards", awardData, MAX_INFO_VALUE );
ADDRGP4 $339
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1034
;1033:
;1034:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $408
line 1035
;1035:		Com_sprintf( key, sizeof(key), "a%i", n );
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $340
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1036
;1036:		Info_SetValueForKey( awardData, key, "100" );
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 $412
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1037
;1037:	}
LABELV $409
line 1034
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $408
line 1039
;1038:
;1039:	trap_Cvar_Set( "g_spAwards", awardData );
ADDRGP4 $339
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1041
;1040:
;1041:	trap_Print( "All levels unlocked at 100\n" );
ADDRGP4 $413
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 1042
;1042:}
LABELV $407
endproc UI_SPUnlockMedals_f 1044 16
proc UIE_IsPunkbusterVersion 280 16
line 1050
;1043:
;1044:
;1045:/*
;1046:===============
;1047:UIE_IsPunkbusterVersion
;1048:===============
;1049:*/
;1050:static qboolean UIE_IsPunkbusterVersion( void ) {
line 1055
;1051:   vmCvar_t cvar;
;1052:   int cl;
;1053:
;1054:   // get the current setting (defaults to 0 if not found)
;1055:   cl = trap_Cvar_VariableValue("cl_punkbuster");
ADDRGP4 $415
ARGP4
ADDRLP4 276
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 272
ADDRLP4 276
INDIRF4
CVFI4 4
ASGNI4
line 1065
;1056:
;1057:   // must distinguish between a true value of 0 set by the punkbuster cvar,
;1058:   // and a default value of 0 because the cvar doesn't exist.
;1059:   // We do this by registering the cvar with a non-zero default value,
;1060:   // and seeing if this becomes the value after a reset. If it does then
;1061:   // the cvar hadn't been registered already, and punkbuster isn't on this
;1062:   // system.
;1063:   // This method relies on the fact that cl_punkbuster and associated
;1064:   // default value is set by the system executable before this VM starts
;1065:   trap_Cvar_Register(&cvar, "cl_punkbuster", "-1", 0);
ADDRLP4 0
ARGP4
ADDRGP4 $415
ARGP4
ADDRGP4 $416
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1066
;1066:   trap_Cvar_Reset("cl_punkbuster");
ADDRGP4 $415
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
line 1067
;1067:   trap_Cvar_Update(&cvar);
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1069
;1068:   // reset to original value
;1069:   trap_Cvar_SetValue("cl_punkbuster", cl);
ADDRGP4 $415
ARGP4
ADDRLP4 272
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1071
;1070:
;1071:   if (cvar.integer < 0) {
ADDRLP4 0+12
INDIRI4
CNSTI4 0
GEI4 $417
line 1072
;1072:      trap_Print("UIE: Punkbuster not detected\n");
ADDRGP4 $420
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 1073
;1073:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $414
JUMPV
LABELV $417
line 1076
;1074:   }
;1075:
;1076:   return qtrue;
CNSTI4 1
RETI4
LABELV $414
endproc UIE_IsPunkbusterVersion 280 16
export UI_InitGameinfo
proc UI_InitGameinfo 8 4
line 1086
;1077:}
;1078:
;1079:
;1080:
;1081:/*
;1082:===============
;1083:UI_InitGameinfo
;1084:===============
;1085:*/
;1086:void UI_InitGameinfo( void ) {
line 1088
;1087:
;1088:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 1089
;1089:	UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 1090
;1090:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 1093
;1091:
;1092:   // punkbuster check
;1093:   uis.punkbuster = UIE_IsPunkbusterVersion();
ADDRLP4 0
ADDRGP4 UIE_IsPunkbusterVersion
CALLI4
ASGNI4
ADDRGP4 uis+11504
ADDRLP4 0
INDIRI4
ASGNI4
line 1095
;1094:
;1095:	if( (trap_Cvar_VariableValue( "fs_restrict" )) || (ui_numSpecialSinglePlayerArenas == 0 && ui_numSinglePlayerArenas == 4) ) {
ADDRGP4 $425
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $426
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
CNSTI4 0
NEI4 $423
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
NEI4 $423
LABELV $426
line 1096
;1096:		uis.demoversion = qtrue;
ADDRGP4 uis+11492
CNSTI4 1
ASGNI4
line 1097
;1097:	}
ADDRGP4 $424
JUMPV
LABELV $423
line 1098
;1098:	else {
line 1099
;1099:		uis.demoversion = qfalse;
ADDRGP4 uis+11492
CNSTI4 0
ASGNI4
line 1100
;1100:	}
LABELV $424
line 1101
;1101:}
LABELV $421
endproc UI_InitGameinfo 8 4
import COM_StripExtensionOld
bss
align 1
LABELV memoryPool
skip 33554432
align 4
LABELV outOfMemory
skip 4
align 4
LABELV allocPoint
skip 4
align 1
LABELV dirlist
skip 16384
align 4
LABELV ui_numSpecialSinglePlayerArenas
skip 4
align 4
LABELV ui_numSinglePlayerArenas
skip 4
align 4
LABELV ui_arenaInfos
skip 4096
align 4
LABELV ui_numArenas
skip 4
align 4
LABELV ui_botInfos
skip 8192
export ui_numBots
align 4
LABELV ui_numBots
skip 4
import UI_MapCallVote
import UI_saveMapEdMenu
import UI_saveMapEdMenu_Cache
import UI_loadMapEdMenu
import UI_loadMapEd_Cache
import UI_SPKickDupe_f
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_SetDefaultCvar
import UI_UpdateCvars
import UI_RegisterCvars
import MainMenu_ReloadGame
import UI_MainMenu
import MainMenu_Cache
import color_translucent
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_ConfigMenu
import UI_SaveConfigMenu
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import LoadConfig_SetStatusText
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_RealTime
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import UIE_AwardIcons_DrawValues
import UIE_AwardIcons_PlaySound
import UIE_AwardIcons_InitControls
import UIE_AwardIcons_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawCharCustom
import UI_DrawChar
import UI_DrawStringCustom
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_DrawScaledProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawRoundedRect
import vycalc
import vxcalc
import vy
import vx
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UIE_PlayerInfo_InitRotateModel
import PlayerInfo_ModelSpinEvent
import UIE_PlayerInfo_IsTeamModel
import UIE_PlayerInfo_DrawTeamModel
import UIE_ModelSkin
import UIE_ModelName
import UIE_PlayerInfo_AnimateModel
import UIE_PlayerInfo_InitModel
import UIE_PlayerInfo_ChangeAnimation
import UIE_PlayerInfo_ChangeTimedAnimation
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UIE_DefaultIconFromGameType
import UIE_StartServer_RegisterDisableCvars
import UIE_InGame_EnabledItems
import UI_ServerPlayerIcon
import Clamp_Random
import UI_BotSelect_Cache
import UI_BotSelect
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_WorkshopMenu_Cache
import UI_WorkshopMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_SandboxMainMenu
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_BotCommandMenu_f
import UI_DynamicMenuCache
import UI_InGameMenu
import InGame_Cache
import UI_CurrentPlayerTeam
import UI_CreditMenu
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_DrawCustom
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import UI_AdvancedMenu_Cache
import UI_AdvancedMenu
import MGUI_Load
import UI_ArenaScriptAutoFloat
import UI_ArenaScriptAutoChar
import UI_ArenaScriptAutoInt
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import SpinControl_Init
import RadioButton_Init
import ScrollList_Init
import PText_Init
import text_color_highlighty
import text_color_highlight
import text_color_normal
import text_color_disabled
import pulse_color
import listbar_color
import list_color
import name_color
import s_sandboxmain_color1
import color_green
import color_dim
import color_realred
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import UIObject_Draw
import UIObject_Init
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import UI_IsValidCvar
import uie_olditemmenu
import uie_ingame_dynamicmenu
import uie_autoclosebotmenu
import uie_mapicons
import uie_animsfx
import ui_cdkeychecked
import ui_cdkey
import ui_server32
import ui_server31
import ui_server30
import ui_server29
import ui_server28
import ui_server27
import ui_server26
import ui_server25
import ui_server24
import ui_server23
import ui_server22
import ui_server21
import ui_server20
import ui_server19
import ui_server18
import ui_server17
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import ui_backcolors
import cl_screenoffset
import ui_loaded
import cl_language
import cl_selectedmod
import team_legsskin
import sensitivitymenu
import legsskin
import ui_singlemode
import ui_3dmap
import ui_scrollbtnsize
import sbt_wallpaper
import sbt_color3_3
import sbt_color3_2
import sbt_color3_1
import sbt_color3_0
import sbt_color2_3
import sbt_color2_2
import sbt_color2_1
import sbt_color2_0
import sbt_color1_3
import sbt_color1_2
import sbt_color1_1
import sbt_color1_0
import sbt_color0_3
import sbt_color0_2
import sbt_color0_1
import sbt_color0_0
import mgui_none
import mgui_api_active
import cl_sprun
import toolgun_disabledarg4
import toolgun_disabledarg3
import toolgun_disabledarg2
import toolgun_disabledarg1
import toolgun_toolset18
import toolgun_toolset17
import toolgun_toolset16
import toolgun_toolset15
import toolgun_toolset14
import toolgun_toolset13
import toolgun_toolset12
import toolgun_toolset11
import toolgun_toolset10
import toolgun_toolset9
import toolgun_toolset8
import toolgun_toolset7
import toolgun_toolset6
import toolgun_toolset5
import toolgun_toolset4
import toolgun_toolset3
import toolgun_toolset2
import toolgun_toolset1
import tool_modifypreset4
import tool_modifypreset3
import tool_modifypreset2
import tool_modifypreset
import tool_spawnpreset
import spawn_preset
import sb_tab
import sb_texturenum
import sb_classnum
import sb_modelnum
import sb_grid
import sb_texturename
import sb_texture
import sb_private
import test9
import test8
import test7
import test6
import test5
import test4
import test3
import test2
import test1
import cl_giantcharheight
import cl_giantcharwidth
import cl_bigcharheight
import cl_bigcharwidth
import cl_smallcharheight
import cl_smallcharwidth
import cl_propgapwidth
import cl_propspacewidth
import cl_propheight
import cl_propsmallsizescale
import BG_TeamName
import BG_GetVehicleSettings
import BG_VehicleCheckClass
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_DefragmentMemory
import BG_Free
import BG_InitMemory
import BG_Alloc
import BG_CanAlloc
import BG_CanItemBeGrabbed
import BG_FindItemForBackpack
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindSwepAmmo
import BG_FindSwep
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import COM_LoadLevelScores
import COM_CalculatePlayerScore
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import vectoyaw
import AngleDifference
import Com_TruncateLongString
import va
import Q_CountChar
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_stristr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_RandomBytes
import Com_SkipCharset
import Com_SkipTokens
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_GetExtension
import COM_SkipPath
import Com_Clamp
import Q_isnan
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoundsIntersectPoint
import BoundsIntersectSphere
import BoundsIntersect
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import Lerp
import VelocityToAxis
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import Q_snprintf
import Q_vsnprintf
import strtol
import _atoi
import atoi
import strtod
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strrchr
import strchr
import strcmp
import strcpy
import strcat
import ifstrlenru
import strlenru
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $425
byte 1 102
byte 1 115
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $420
byte 1 85
byte 1 73
byte 1 69
byte 1 58
byte 1 32
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $416
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $415
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $413
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $412
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $406
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $401
byte 1 49
byte 1 0
align 1
LABELV $393
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $392
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $391
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $390
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $389
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $362
byte 1 116
byte 1 105
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $361
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $348
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $345
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $340
byte 1 97
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $339
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $338
byte 1 94
byte 1 49
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 85
byte 1 73
byte 1 95
byte 1 76
byte 1 111
byte 1 103
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 68
byte 1 97
byte 1 116
byte 1 97
byte 1 10
byte 1 0
align 1
LABELV $327
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $316
byte 1 108
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $315
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $302
byte 1 83
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $288
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $282
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $277
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $272
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $271
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $266
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $264
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $236
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $231
byte 1 46
byte 1 46
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $218
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $204
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $203
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $182
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $179
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $173
byte 1 46
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $172
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $171
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $166
byte 1 0
align 1
LABELV $165
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $148
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $146
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 117
byte 1 110
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $145
byte 1 92
byte 1 109
byte 1 97
byte 1 112
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $134
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $133
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $131
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $128
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $120
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $117
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $116
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $113
byte 1 125
byte 1 0
align 1
LABELV $110
byte 1 85
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $104
byte 1 77
byte 1 97
byte 1 120
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $101
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $100
byte 1 123
byte 1 0
align 1
LABELV $89
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $88
byte 1 92
byte 1 110
byte 1 117
byte 1 109
byte 1 92
byte 1 0
