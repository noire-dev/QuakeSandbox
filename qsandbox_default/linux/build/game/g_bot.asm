export trap_Cvar_VariableValue
code
proc trap_Cvar_VariableValue 132 12
file "../../../code/game/g_bot.c"
line 55
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Quake III Arena source code.
;6:
;7:Quake III Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Quake III Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Quake III Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22://
;23:// g_bot.c
;24:
;25:#include "g_local.h"
;26:
;27:
;28:static int		g_numBots;
;29:static char		*g_botInfos[MAX_BOTS];
;30:
;31:
;32:int				g_numArenas;
;33:static char		*g_arenaInfos[MAX_ARENAS];
;34:
;35:
;36:#define BOT_BEGIN_DELAY_BASE		2000
;37:#define BOT_BEGIN_DELAY_INCREMENT	1500
;38:
;39:#define BOT_SPAWN_QUEUE_DEPTH	16
;40:
;41:typedef struct {
;42:	int		clientNum;
;43:	int		spawnTime;
;44:} botSpawnQueue_t;
;45:
;46://static int			botBeginDelay = 0;  // bk001206 - unused, init
;47:static botSpawnQueue_t	botSpawnQueue[BOT_SPAWN_QUEUE_DEPTH];
;48:
;49:vmCvar_t bot_minplayers;
;50:
;51:extern gentity_t	*podium1;
;52:extern gentity_t	*podium2;
;53:extern gentity_t	*podium3;
;54:
;55:float trap_Cvar_VariableValue( const char *var_name ) {
line 58
;56:	char buf[128];
;57:
;58:	trap_Cvar_VariableStringBuffer(var_name, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 59
;59:	return atof(buf);
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
RETF4
LABELV $65
endproc trap_Cvar_VariableValue 132 12
export G_ParseInfos
proc G_ParseInfos 2104 12
line 69
;60:}
;61:
;62:
;63:
;64:/*
;65:===============
;66:G_ParseInfos
;67:===============
;68:*/
;69:int G_ParseInfos( char *buf, int max, char *infos[] ) {
line 75
;70:	char	*token;
;71:	int		count;
;72:	char	key[MAX_TOKEN_CHARS];
;73:	char	info[MAX_INFO_STRING];
;74:
;75:	count = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRGP4 $68
JUMPV
LABELV $67
line 77
;76:
;77:	while ( 1 ) {
line 78
;78:		token = COM_Parse( &buf );
ADDRFP4 0
ARGP4
ADDRLP4 2056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2056
INDIRP4
ASGNP4
line 79
;79:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $70
line 80
;80:			break;
ADDRGP4 $69
JUMPV
LABELV $70
line 82
;81:		}
;82:		if ( strcmp( token, "{" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $74
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $72
line 83
;83:			Com_Printf( "Missing { in info file\n" );
ADDRGP4 $75
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 84
;84:			break;
ADDRGP4 $69
JUMPV
LABELV $72
line 87
;85:		}
;86:
;87:		if ( count == max ) {
ADDRLP4 2052
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $76
line 88
;88:			Com_Printf( "Max infos exceeded\n" );
ADDRGP4 $78
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 89
;89:			break;
ADDRGP4 $69
JUMPV
LABELV $76
line 92
;90:		}
;91:
;92:		info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $80
JUMPV
LABELV $79
line 93
;93:		while ( 1 ) {
line 94
;94:			token = COM_ParseExt( &buf, qtrue );
ADDRFP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2064
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ASGNP4
line 95
;95:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $82
line 96
;96:				Com_Printf( "Unexpected end of info file\n" );
ADDRGP4 $84
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 97
;97:				break;
ADDRGP4 $81
JUMPV
LABELV $82
line 99
;98:			}
;99:			if ( !strcmp( token, "}" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $85
line 100
;100:				break;
ADDRGP4 $81
JUMPV
LABELV $85
line 102
;101:			}
;102:			Q_strncpyz( key, token, sizeof( key ) );
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
line 104
;103:
;104:			token = COM_ParseExt( &buf, qfalse );
ADDRFP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 2072
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2072
INDIRP4
ASGNP4
line 105
;105:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $88
line 106
;106:				strcpy( token, "<NULL>" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $90
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 107
;107:			}
LABELV $88
line 108
;108:			Info_SetValueForKey( info, key, token );
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
line 109
;109:		}
LABELV $80
line 93
ADDRGP4 $79
JUMPV
LABELV $81
line 110
;110:                if(!BG_CanAlloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1))
ADDRLP4 1028
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $93
ARGP4
ADDRLP4 2068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $94
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2072
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
ADDRLP4 2068
INDIRI4
ADDI4
ADDRLP4 2076
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CVIU4 4
ARGU4
ADDRLP4 2080
ADDRGP4 BG_CanAlloc
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $91
line 111
;111:                    break; //Not enough memory. Don't even try
ADDRGP4 $69
JUMPV
LABELV $91
line 114
;112:		//NOTE: extra space for arena number
;113:		//KK-OAX Changed to Tremulous's BG_Alloc
;114:		infos[count] = BG_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
ADDRLP4 1028
ARGP4
ADDRLP4 2084
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $93
ARGP4
ADDRLP4 2088
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $94
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRLP4 2096
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
ADDRLP4 2088
INDIRI4
ADDI4
ADDRLP4 2096
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CVIU4 4
ARGU4
ADDRLP4 2100
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 2100
INDIRP4
ASGNP4
line 115
;115:		if (infos[count]) {
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $95
line 116
;116:			strcpy(infos[count], info);
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 117
;117:			count++;
ADDRLP4 2052
ADDRLP4 2052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 118
;118:		}
LABELV $95
line 119
;119:	}
LABELV $68
line 77
ADDRGP4 $67
JUMPV
LABELV $69
line 120
;120:	return count;
ADDRLP4 2052
INDIRI4
RETI4
LABELV $66
endproc G_ParseInfos 2104 12
proc G_LoadArenasFromFile 8216 16
line 128
;121:}
;122:
;123:/*
;124:===============
;125:G_LoadArenasFromFile
;126:===============
;127:*/
;128:static void G_LoadArenasFromFile( char *filename ) {
line 133
;129:	int				len;
;130:	fileHandle_t	f;
;131:	char			buf[MAX_ARENAS_TEXT];
;132:
;133:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
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
line 134
;134:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $98
line 135
;135:		trap_Printf( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $100
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
ADDRGP4 trap_Printf
CALLV
pop
line 136
;136:		return;
ADDRGP4 $97
JUMPV
LABELV $98
line 138
;137:	}
;138:	if ( len >= MAX_ARENAS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $101
line 139
;139:		trap_Printf( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i\n", filename, len, MAX_ARENAS_TEXT ) );
ADDRGP4 $103
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
ADDRGP4 trap_Printf
CALLV
pop
line 140
;140:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 141
;141:		return;
ADDRGP4 $97
JUMPV
LABELV $101
line 144
;142:	}
;143:
;144:	trap_FS_Read( buf, len, f );
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
line 145
;145:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 146
;146:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 148
;147:
;148:	g_numArenas += G_ParseInfos( buf, MAX_ARENAS - g_numArenas, &g_arenaInfos[g_numArenas] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 g_numArenas
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
ADDRGP4 g_arenaInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 G_ParseInfos
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
line 149
;149:}
LABELV $97
endproc G_LoadArenasFromFile 8216 16
proc G_LoadArenas 1460 16
line 156
;150:
;151:/*
;152:===============
;153:G_LoadArenas
;154:===============
;155:*/
;156:static void G_LoadArenas( void ) {
line 165
;157:	int			numdirs;
;158:	vmCvar_t	arenasFile;
;159:	char		filename[128];
;160:	char		dirlist[1024];
;161:	char*		dirptr;
;162:	int			i, n;
;163:	int			dirlen;
;164:
;165:	g_numArenas = 0;
ADDRGP4 g_numArenas
CNSTI4 0
ASGNI4
line 167
;166:
;167:	trap_Cvar_Register( &arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 148
ARGP4
ADDRGP4 $105
ARGP4
ADDRGP4 $106
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 168
;168:	if( *arenasFile.string ) {
ADDRLP4 148+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $107
line 169
;169:		G_LoadArenasFromFile(arenasFile.string);
ADDRLP4 148+16
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 170
;170:	}
ADDRGP4 $108
JUMPV
LABELV $107
line 171
;171:	else {
line 172
;172:		G_LoadArenasFromFile("scripts/arenas.txt");
ADDRGP4 $111
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 173
;173:	}
LABELV $108
line 176
;174:
;175:	// get all arenas from .arena files
;176:	numdirs = trap_FS_GetFileList("scripts", ".arena", dirlist, 1024 );
ADDRGP4 $112
ARGP4
ADDRGP4 $113
ARGP4
ADDRLP4 420
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 1444
INDIRI4
ASGNI4
line 177
;177:	dirptr  = dirlist;
ADDRLP4 4
ADDRLP4 420
ASGNP4
line 178
;178:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 179
;179:		dirlen = strlen(dirptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1448
INDIRI4
ASGNI4
line 180
;180:		strcpy(filename, "scripts/");
ADDRLP4 8
ARGP4
ADDRGP4 $118
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 181
;181:		strcat(filename, dirptr);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 182
;182:		G_LoadArenasFromFile(filename);
ADDRLP4 8
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 183
;183:	}
LABELV $115
line 178
ADDRLP4 1448
CNSTI4 1
ASGNI4
ADDRLP4 136
ADDRLP4 136
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
LABELV $117
ADDRLP4 136
INDIRI4
ADDRLP4 144
INDIRI4
LTI4 $114
line 184
;184:	trap_Printf( va( "%i arenas parsed\n", g_numArenas ) );
ADDRGP4 $119
ARGP4
ADDRGP4 g_numArenas
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 186
;185:
;186:	for( n = 0; n < g_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $123
JUMPV
LABELV $120
line 187
;187:		Info_SetValueForKey( g_arenaInfos[n], "num", va( "%i", n ) );
ADDRGP4 $125
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1456
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $124
ARGP4
ADDRLP4 1456
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 188
;188:	}
LABELV $121
line 186
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $123
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $120
line 189
;189:}
LABELV $104
endproc G_LoadArenas 1460 16
export G_GetArenaInfoByMap
proc G_GetArenaInfoByMap 12 8
line 197
;190:
;191:
;192:/*
;193:===============
;194:G_GetArenaInfoByNumber
;195:===============
;196:*/
;197:const char *G_GetArenaInfoByMap( const char *map ) {
line 200
;198:	int			n;
;199:
;200:	for( n = 0; n < g_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $130
JUMPV
LABELV $127
line 201
;201:		if( Q_stricmp( Info_ValueForKey( g_arenaInfos[n], "map" ), map ) == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $133
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
NEI4 $131
line 202
;202:			return g_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $126
JUMPV
LABELV $131
line 204
;203:		}
;204:	}
LABELV $128
line 200
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $130
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $127
line 206
;205:
;206:	return NULL;
CNSTP4 0
RETP4
LABELV $126
endproc G_GetArenaInfoByMap 12 8
export G_AddRandomBot
proc G_AddRandomBot 84 20
line 214
;207:}
;208:
;209:/*
;210:===============
;211:G_AddRandomBot
;212:===============
;213:*/
;214:void G_AddRandomBot( int team ) {
line 220
;215:	int		i, n, num;
;216:	float	skill;
;217:	char	*value, netname[36], *teamstr;
;218:	gclient_t	*cl;
;219:
;220:        if (!trap_AAS_Initialized())
ADDRLP4 64
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $135
line 221
;221:            return; //If no AAS then don't even try
ADDRGP4 $134
JUMPV
LABELV $135
line 223
;222:
;223:	num = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 224
;224:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $137
line 225
;225:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 68
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 68
INDIRP4
ASGNP4
line 227
;226:		//
;227:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $142
line 228
;228:			cl = level.clients + i;
ADDRLP4 0
CNSTI4 2324
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 229
;229:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $147
line 230
;230:				continue;
ADDRGP4 $143
JUMPV
LABELV $147
line 232
;231:			}
;232:			if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 2492
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $149
line 233
;233:				continue;
ADDRGP4 $143
JUMPV
LABELV $149
line 235
;234:			}
;235:			if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 72
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $153
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $153
line 236
;236:				continue;
ADDRGP4 $143
JUMPV
LABELV $153
line 238
;237:			}
;238:			if ( !Q_stricmp( value, cl->pers.netname ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $155
line 239
;239:				break;
ADDRGP4 $144
JUMPV
LABELV $155
line 241
;240:			}
;241:		}
LABELV $143
line 227
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $145
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $142
LABELV $144
line 242
;242:		if (i >= g_maxclients.integer) {
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $157
line 243
;243:			num++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 244
;244:		}
LABELV $157
line 245
;245:	}
LABELV $138
line 224
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $140
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $137
line 246
;246:	num = random() * num;
ADDRLP4 68
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 68
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 247
;247:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $163
JUMPV
LABELV $160
line 248
;248:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 72
INDIRP4
ASGNP4
line 250
;249:		//
;250:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $167
JUMPV
LABELV $164
line 251
;251:			cl = level.clients + i;
ADDRLP4 0
CNSTI4 2324
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 252
;252:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $169
line 253
;253:				continue;
ADDRGP4 $165
JUMPV
LABELV $169
line 255
;254:			}
;255:			if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 2492
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $171
line 256
;256:				continue;
ADDRGP4 $165
JUMPV
LABELV $171
line 258
;257:			}
;258:			if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 76
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LTI4 $175
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $175
line 259
;259:				continue;
ADDRGP4 $165
JUMPV
LABELV $175
line 261
;260:			}
;261:			if ( !Q_stricmp( value, cl->pers.netname ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $177
line 262
;262:				break;
ADDRGP4 $166
JUMPV
LABELV $177
line 264
;263:			}
;264:		}
LABELV $165
line 250
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $167
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $164
LABELV $166
line 265
;265:		if (i >= g_maxclients.integer) {
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $179
line 266
;266:			num--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 267
;267:			if (num <= 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
GTI4 $182
line 268
;268:				skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $184
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 76
INDIRF4
ASGNF4
line 269
;269:				if (team == TEAM_RED) teamstr = "red";
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $185
ADDRLP4 60
ADDRGP4 $187
ASGNP4
ADDRGP4 $186
JUMPV
LABELV $185
line 270
;270:				else if (team == TEAM_BLUE) teamstr = "blue";
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $188
ADDRLP4 60
ADDRGP4 $190
ASGNP4
ADDRGP4 $189
JUMPV
LABELV $188
line 271
;271:				else teamstr = "";
ADDRLP4 60
ADDRGP4 $106
ASGNP4
LABELV $189
LABELV $186
line 272
;272:				strncpy(netname, value, sizeof(netname)-1);
ADDRLP4 20
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 35
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 273
;273:				netname[sizeof(netname)-1] = '\0';
ADDRLP4 20+35
CNSTI1 0
ASGNI1
line 274
;274:				Q_CleanStr(netname);
ADDRLP4 20
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 275
;275:				trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s %f %s %i\n", netname, skill, teamstr, 0) );
ADDRGP4 $192
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 276
;276:				return;
ADDRGP4 $134
JUMPV
LABELV $182
line 278
;277:			}
;278:		}
LABELV $179
line 279
;279:	}
LABELV $161
line 247
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $163
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $160
line 280
;280:}
LABELV $134
endproc G_AddRandomBot 84 20
export G_RemoveRandomBot
proc G_RemoveRandomBot 16 8
line 287
;281:
;282:/*
;283:===============
;284:G_RemoveRandomBot
;285:===============
;286:*/
;287:int G_RemoveRandomBot( int team ) {
line 291
;288:	int i;
;289:	gclient_t	*cl;
;290:
;291:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $194
line 292
;292:		cl = level.clients + i;
ADDRLP4 0
CNSTI4 2324
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 293
;293:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $199
line 294
;294:			continue;
ADDRGP4 $195
JUMPV
LABELV $199
line 296
;295:		}
;296:		if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 2492
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $201
line 297
;297:			continue;
ADDRGP4 $195
JUMPV
LABELV $201
line 299
;298:		}
;299:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $205
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $205
line 300
;300:			continue;
ADDRGP4 $195
JUMPV
LABELV $205
line 302
;301:		}
;302:		trap_SendConsoleCommand( EXEC_INSERT, va("clientkick %d\n", cl->ps.clientNum) );
ADDRGP4 $207
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 303
;303:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $193
JUMPV
LABELV $195
line 291
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $197
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $194
line 305
;304:	}
;305:	return qfalse;
CNSTI4 0
RETI4
LABELV $193
endproc G_RemoveRandomBot 16 8
export G_CountHumanPlayers
proc G_CountHumanPlayers 16 0
line 313
;306:}
;307:
;308:/*
;309:===============
;310:G_CountHumanPlayers
;311:===============
;312:*/
;313:int G_CountHumanPlayers( int team ) {
line 317
;314:	int i, num;
;315:	gclient_t	*cl;
;316:
;317:	num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 318
;318:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $212
JUMPV
LABELV $209
line 319
;319:		cl = level.clients + i;
ADDRLP4 0
CNSTI4 2324
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 320
;320:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $214
line 321
;321:			continue;
ADDRGP4 $210
JUMPV
LABELV $214
line 323
;322:		}
;323:		if ( g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT ) {
CNSTI4 2492
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $216
line 324
;324:			continue;
ADDRGP4 $210
JUMPV
LABELV $216
line 326
;325:		}
;326:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $220
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $220
line 327
;327:			continue;
ADDRGP4 $210
JUMPV
LABELV $220
line 329
;328:		}
;329:		num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 330
;330:	}
LABELV $210
line 318
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $212
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $209
line 331
;331:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $208
endproc G_CountHumanPlayers 16 0
export G_CountBotPlayers
proc G_CountBotPlayers 20 0
line 339
;332:}
;333:
;334:/*
;335:===============
;336:G_CountBotPlayers
;337:===============
;338:*/
;339:int G_CountBotPlayers( int team ) {
line 343
;340:	int i, n, num;
;341:	gclient_t	*cl;
;342:
;343:	num = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 344
;344:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $223
line 345
;345:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 2324
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 346
;346:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $228
line 347
;347:			continue;
ADDRGP4 $224
JUMPV
LABELV $228
line 349
;348:		}
;349:		if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 2492
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $230
line 350
;350:			continue;
ADDRGP4 $224
JUMPV
LABELV $230
line 352
;351:		}
;352:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $234
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $234
line 353
;353:			continue;
ADDRGP4 $224
JUMPV
LABELV $234
line 355
;354:		}
;355:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 356
;356:	}
LABELV $224
line 344
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $226
ADDRLP4 8
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $223
line 357
;357:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $236
line 358
;358:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $240
line 359
;359:			continue;
ADDRGP4 $237
JUMPV
LABELV $240
line 361
;360:		}
;361:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $243
line 362
;362:			continue;
ADDRGP4 $237
JUMPV
LABELV $243
line 364
;363:		}
;364:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 365
;365:	}
LABELV $237
line 357
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $236
line 366
;366:	return num;
ADDRLP4 12
INDIRI4
RETI4
LABELV $222
endproc G_CountBotPlayers 20 0
bss
align 4
LABELV $248
skip 4
export G_CheckMinimumPlayers
code
proc G_CheckMinimumPlayers 40 4
line 374
;367:}
;368:
;369:/*
;370:===============
;371:G_CheckMinimumPlayers
;372:===============
;373:*/
;374:void G_CheckMinimumPlayers( void ) {
line 379
;375:	int minplayers;
;376:	int humanplayers, botplayers;
;377:	static int checkminimumplayers_time;
;378:
;379:	if (level.intermissiontime) return;
ADDRGP4 level+9912
INDIRI4
CNSTI4 0
EQI4 $249
ADDRGP4 $247
JUMPV
LABELV $249
line 381
;380:	//only check once each 10 seconds
;381:	if (checkminimumplayers_time > level.time - 10000) {
ADDRGP4 $248
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $252
line 382
;382:		return;
ADDRGP4 $247
JUMPV
LABELV $252
line 384
;383:	}
;384:	checkminimumplayers_time = level.time;
ADDRGP4 $248
ADDRGP4 level+32
INDIRI4
ASGNI4
line 385
;385:	trap_Cvar_Update(&bot_minplayers);
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 386
;386:	minplayers = bot_minplayers.integer;
ADDRLP4 0
ADDRGP4 bot_minplayers+12
INDIRI4
ASGNI4
line 387
;387:	if (minplayers <= 0) return;
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $257
ADDRGP4 $247
JUMPV
LABELV $257
line 389
;388:
;389:        if (!trap_AAS_Initialized())
ADDRLP4 12
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $259
line 390
;390:        {
line 391
;391:            minplayers = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 392
;392:            checkminimumplayers_time = level.time+600*1000;
ADDRGP4 $248
ADDRGP4 level+32
INDIRI4
CNSTI4 600000
ADDI4
ASGNI4
line 393
;393:            return; //If no AAS then don't even try
ADDRGP4 $247
JUMPV
LABELV $259
line 396
;394:        }
;395:
;396:	if (g_gametype.integer >= GT_TEAM && g_ffa_gt!=1) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $262
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
EQI4 $262
line 397
;397:		if (minplayers >= g_maxclients.integer / 2) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 2
DIVI4
LTI4 $265
line 398
;398:			minplayers = (g_maxclients.integer / 2) -1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 1
SUBI4
ASGNI4
line 399
;399:		}
LABELV $265
line 401
;400:
;401:		humanplayers = G_CountHumanPlayers( TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 402
;402:		botplayers = G_CountBotPlayers(	TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 404
;403:		//
;404:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $269
line 405
;405:			G_AddRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 406
;406:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $270
JUMPV
LABELV $269
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $271
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $271
line 407
;407:			G_RemoveRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 408
;408:		}
LABELV $271
LABELV $270
line 410
;409:		//
;410:		humanplayers = G_CountHumanPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 411
;411:		botplayers = G_CountBotPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 32
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 413
;412:		//
;413:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $273
line 414
;414:			G_AddRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 415
;415:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $263
JUMPV
LABELV $273
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $263
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $263
line 416
;416:			G_RemoveRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 417
;417:		}
line 418
;418:	}
ADDRGP4 $263
JUMPV
LABELV $262
line 419
;419:	else if (g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $277
line 420
;420:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $280
line 421
;421:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 422
;422:		}
LABELV $280
line 423
;423:		humanplayers = G_CountHumanPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 424
;424:		botplayers = G_CountBotPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 20
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 426
;425:		//
;426:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $284
line 427
;427:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 428
;428:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $278
JUMPV
LABELV $284
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $278
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $278
line 430
;429:			// try to remove spectators first
;430:			if (!G_RemoveRandomBot( TEAM_SPECTATOR )) {
CNSTI4 3
ARGI4
ADDRLP4 28
ADDRGP4 G_RemoveRandomBot
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $278
line 432
;431:				// just remove the bot that is playing
;432:				G_RemoveRandomBot( -1 );
CNSTI4 -1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 433
;433:			}
line 434
;434:		}
line 435
;435:	}
ADDRGP4 $278
JUMPV
LABELV $277
line 436
;436:	else if (g_gametype.integer == GT_FFA || g_gametype.integer == GT_LMS || g_gametype.integer == GT_SANDBOX) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $296
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
EQI4 $296
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $290
LABELV $296
line 437
;437:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $297
line 438
;438:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 439
;439:		}
LABELV $297
line 440
;440:		humanplayers = G_CountHumanPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 441
;441:		botplayers = G_CountBotPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 443
;442:		//
;443:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $301
line 444
;444:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 445
;445:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $302
JUMPV
LABELV $301
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $303
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $303
line 446
;446:			G_RemoveRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 447
;447:		}
LABELV $303
LABELV $302
line 448
;448:	}
LABELV $290
LABELV $278
LABELV $263
line 449
;449:}
LABELV $247
endproc G_CheckMinimumPlayers 40 4
export G_CheckBotSpawn
proc G_CheckBotSpawn 1028 4
line 456
;450:
;451:/*
;452:===============
;453:G_CheckBotSpawn
;454:===============
;455:*/
;456:void G_CheckBotSpawn( void ) {
line 460
;457:	int		n;
;458:	char	userinfo[MAX_INFO_VALUE];
;459:
;460:	G_CheckMinimumPlayers();
ADDRGP4 G_CheckMinimumPlayers
CALLV
pop
line 462
;461:
;462:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $306
line 463
;463:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $310
line 464
;464:			continue;
ADDRGP4 $307
JUMPV
LABELV $310
line 466
;465:		}
;466:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $313
line 467
;467:			continue;
ADDRGP4 $307
JUMPV
LABELV $313
line 469
;468:		}
;469:		ClientBegin( botSpawnQueue[n].clientNum );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 470
;470:		botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 471
;471:	}
LABELV $307
line 462
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $306
line 472
;472:}
LABELV $305
endproc G_CheckBotSpawn 1028 4
proc AddBotToSpawnQueue 4 4
line 480
;473:
;474:
;475:/*
;476:===============
;477:AddBotToSpawnQueue
;478:===============
;479:*/
;480:static void AddBotToSpawnQueue( int clientNum, int delay ) {
line 483
;481:	int		n;
;482:
;483:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $319
line 484
;484:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $323
line 485
;485:			botSpawnQueue[n].spawnTime = level.time + delay;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 486
;486:			botSpawnQueue[n].clientNum = clientNum;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 487
;487:			return;
ADDRGP4 $318
JUMPV
LABELV $323
line 489
;488:		}
;489:	}
LABELV $320
line 483
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $319
line 490
;490:        G_Printf( S_COLOR_YELLOW "Unable to delay spawn\n" );
ADDRGP4 $328
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 491
;491:	ClientBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 492
;492:}
LABELV $318
endproc AddBotToSpawnQueue 4 4
export G_RemoveQueuedBotBegin
proc G_RemoveQueuedBotBegin 4 0
line 503
;493:
;494:
;495:/*
;496:===============
;497:G_RemoveQueuedBotBegin
;498:
;499:Called on client disconnect to make sure the delayed spawn
;500:doesn't happen on a freed index
;501:===============
;502:*/
;503:void G_RemoveQueuedBotBegin( int clientNum ) {
line 506
;504:	int		n;
;505:
;506:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $330
line 507
;507:		if( botSpawnQueue[n].clientNum == clientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $334
line 508
;508:			botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 509
;509:			return;
ADDRGP4 $329
JUMPV
LABELV $334
line 511
;510:		}
;511:	}
LABELV $331
line 506
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $330
line 512
;512:}
LABELV $329
endproc G_RemoveQueuedBotBegin 4 0
export G_BotConnect
proc G_BotConnect 2368 12
line 520
;513:
;514:
;515:/*
;516:===============
;517:G_BotConnect
;518:===============
;519:*/
;520:qboolean G_BotConnect( int clientNum, qboolean restart ) {
line 524
;521:	bot_settings_t	settings;
;522:	char			userinfo[MAX_INFO_STRING];
;523:
;524:	trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1316
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 526
;525:
;526:	Q_strncpyz( settings.characterfile, Info_ValueForKey( userinfo, "characterfile" ), sizeof(settings.characterfile) );
ADDRLP4 1316
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 2340
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 2340
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 527
;527:	settings.skill = atof( Info_ValueForKey( userinfo, "skill" ) );
ADDRLP4 1316
ARGP4
ADDRGP4 $340
ARGP4
ADDRLP4 2344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2344
INDIRP4
ARGP4
ADDRLP4 2348
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0+144
ADDRLP4 2348
INDIRF4
ASGNF4
line 528
;528:	Q_strncpyz( settings.team, Info_ValueForKey( userinfo, "team" ), sizeof(settings.team) );
ADDRLP4 1316
ARGP4
ADDRGP4 $342
ARGP4
ADDRLP4 2352
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0+148
ARGP4
ADDRLP4 2352
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 529
;529:	Q_strncpyz( settings.waypoint, Info_ValueForKey( userinfo, "waypoint" ), sizeof( settings.waypoint ) );
ADDRLP4 1316
ARGP4
ADDRGP4 $345
ARGP4
ADDRLP4 2356
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0+292
ARGP4
ADDRLP4 2356
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 531
;530:
;531:	if (!trap_AAS_Initialized() || !BotAISetupClient( clientNum, &settings, restart )) {
ADDRLP4 2360
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 2360
INDIRI4
CNSTI4 0
EQI4 $349
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 2364
ADDRGP4 BotAISetupClient
CALLI4
ASGNI4
ADDRLP4 2364
INDIRI4
CNSTI4 0
NEI4 $347
LABELV $349
line 534
;532:		//trap_DropClient( clientNum, "BotAISetupClient failed" );
;533:		//return qfalse;
;534:	}
LABELV $347
line 536
;535:
;536:	return qtrue;
CNSTI4 1
RETI4
LABELV $337
endproc G_BotConnect 2368 12
proc G_AddBot 1148 12
line 545
;537:}
;538:
;539:
;540:/*
;541:===============
;542:G_AddBot
;543:===============
;544:*/
;545:static void G_AddBot( const char *name, float skill, const char *team, int delay, char *altname, int parentEntityNum, char* waypoint, int customspbot, gentity_t *spawn ) {
line 557
;546:	int				clientNum;
;547:	char			*botinfo;
;548:	gentity_t		*bot;
;549:	char			*key;
;550:	char			*s;
;551:	char			*botname;
;552:	char			*model;
;553:	char			*headmodel;
;554:	char			userinfo[MAX_INFO_STRING];
;555:
;556:	// get the botinfo from bots.txt
;557:	botinfo = G_GetBotInfoByName( name );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 G_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1056
INDIRP4
ASGNP4
line 558
;558:	if ( !botinfo ) {
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $351
line 559
;559:                G_Printf( S_COLOR_RED "Error: Bot '%s' not defined\n", name );
ADDRGP4 $353
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 560
;560:		return;
ADDRGP4 $350
JUMPV
LABELV $351
line 564
;561:	}
;562:
;563:	// create the bot's userinfo
;564:	userinfo[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 566
;565:
;566:	botname = Info_ValueForKey( botinfo, "funname" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1060
INDIRP4
ASGNP4
line 567
;567:	if( !botname[0] ) {
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $355
line 568
;568:		botname = Info_ValueForKey( botinfo, "name" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1064
INDIRP4
ASGNP4
line 569
;569:	}
LABELV $355
line 572
;570:
;571:	// check for an alternative name
;572:	if (altname && altname[0]) {
ADDRLP4 1064
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $357
ADDRLP4 1064
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $357
line 573
;573:		botname = altname;
ADDRLP4 1048
ADDRFP4 16
INDIRP4
ASGNP4
line 574
;574:	}
LABELV $357
line 575
;575:	Info_SetValueForKey( userinfo, "name", botname );
ADDRLP4 0
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 576
;576:	Info_SetValueForKey( userinfo, "rate", "25000" );
ADDRLP4 0
ARGP4
ADDRGP4 $359
ARGP4
ADDRGP4 $360
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 577
;577:	Info_SetValueForKey( userinfo, "snaps", "20" );
ADDRLP4 0
ARGP4
ADDRGP4 $361
ARGP4
ADDRGP4 $362
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 578
;578:	Info_SetValueForKey( userinfo, "skill", va("%1.2f", skill) );
ADDRGP4 $363
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $340
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 580
;579:
;580:	if ( skill >= 1 && skill < 2 ) {
ADDRLP4 1072
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1072
INDIRF4
CNSTF4 1065353216
LTF4 $364
ADDRLP4 1072
INDIRF4
CNSTF4 1073741824
GEF4 $364
line 581
;581:		Info_SetValueForKey( userinfo, "handicap", "50" );
ADDRLP4 0
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 $367
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 582
;582:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 583
;583:	else if ( skill >= 2 && skill < 3 ) {
ADDRLP4 1076
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1076
INDIRF4
CNSTF4 1073741824
LTF4 $368
ADDRLP4 1076
INDIRF4
CNSTF4 1077936128
GEF4 $368
line 584
;584:		Info_SetValueForKey( userinfo, "handicap", "70" );
ADDRLP4 0
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 $370
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 585
;585:	}
ADDRGP4 $369
JUMPV
LABELV $368
line 586
;586:	else if ( skill >= 3 && skill < 4 ) {
ADDRLP4 1080
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1080
INDIRF4
CNSTF4 1077936128
LTF4 $371
ADDRLP4 1080
INDIRF4
CNSTF4 1082130432
GEF4 $371
line 587
;587:		Info_SetValueForKey( userinfo, "handicap", "90" );
ADDRLP4 0
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 $373
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 588
;588:	}
ADDRGP4 $372
JUMPV
LABELV $371
line 589
;589:	else if ( skill >= 4 && skill < 5 ) {
ADDRLP4 1084
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1084
INDIRF4
CNSTF4 1082130432
LTF4 $374
ADDRLP4 1084
INDIRF4
CNSTF4 1084227584
GEF4 $374
line 590
;590:		Info_SetValueForKey( userinfo, "handicap", "100" );
ADDRLP4 0
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 $376
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 591
;591:	}
ADDRGP4 $375
JUMPV
LABELV $374
line 592
;592:	else if ( skill >= 5 && skill < 999 ) {
ADDRLP4 1088
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1088
INDIRF4
CNSTF4 1084227584
LTF4 $377
ADDRLP4 1088
INDIRF4
CNSTF4 1148829696
GEF4 $377
line 593
;593:		Info_SetValueForKey( userinfo, "handicap", "100" );
ADDRLP4 0
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 $376
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 594
;594:	}
LABELV $377
LABELV $375
LABELV $372
LABELV $369
LABELV $365
line 596
;595:
;596:	key = "model";
ADDRLP4 1024
ADDRGP4 $379
ASGNP4
line 597
;597:	model = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1092
INDIRP4
ASGNP4
line 598
;598:	if ( !*model ) {
ADDRLP4 1040
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $380
line 599
;599:		model = "sarge/default";
ADDRLP4 1040
ADDRGP4 $382
ASGNP4
line 600
;600:	}
LABELV $380
line 601
;601:	Info_SetValueForKey( userinfo, key, model );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 602
;602:	key = "team_model";
ADDRLP4 1024
ADDRGP4 $383
ASGNP4
line 603
;603:	Info_SetValueForKey( userinfo, key, model );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 605
;604:
;605:	key = "headmodel";
ADDRLP4 1024
ADDRGP4 $384
ASGNP4
line 606
;606:	headmodel = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1096
INDIRP4
ASGNP4
line 607
;607:	if ( !*headmodel ) {
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $385
line 608
;608:		headmodel = model;
ADDRLP4 1044
ADDRLP4 1040
INDIRP4
ASGNP4
line 609
;609:	}
LABELV $385
line 610
;610:	Info_SetValueForKey( userinfo, key, headmodel );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 611
;611:	key = "team_headmodel";
ADDRLP4 1024
ADDRGP4 $387
ASGNP4
line 612
;612:	Info_SetValueForKey( userinfo, key, headmodel );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 614
;613:
;614:	key = "gender";
ADDRLP4 1024
ADDRGP4 $388
ASGNP4
line 615
;615:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1100
INDIRP4
ASGNP4
line 616
;616:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $389
line 617
;617:		s = "male";
ADDRLP4 1028
ADDRGP4 $391
ASGNP4
line 618
;618:	}
LABELV $389
line 619
;619:	Info_SetValueForKey( userinfo, "sex", s );
ADDRLP4 0
ARGP4
ADDRGP4 $392
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 621
;620:
;621:	key = "color1";
ADDRLP4 1024
ADDRGP4 $393
ASGNP4
line 622
;622:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1104
INDIRP4
ASGNP4
line 623
;623:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $394
line 624
;624:		s = "4";
ADDRLP4 1028
ADDRGP4 $396
ASGNP4
line 625
;625:	}
LABELV $394
line 626
;626:	Info_SetValueForKey( userinfo, key, s );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 628
;627:
;628:	key = "color2";
ADDRLP4 1024
ADDRGP4 $397
ASGNP4
line 629
;629:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1108
INDIRP4
ASGNP4
line 630
;630:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $398
line 631
;631:		s = "5";
ADDRLP4 1028
ADDRGP4 $400
ASGNP4
line 632
;632:	}
LABELV $398
line 633
;633:	Info_SetValueForKey( userinfo, key, s );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 635
;634:
;635:	s = Info_ValueForKey(botinfo, "aifile");
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $401
ARGP4
ADDRLP4 1112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1112
INDIRP4
ASGNP4
line 636
;636:	if (!*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $402
line 637
;637:		trap_Printf( S_COLOR_RED "Error: bot has no aifile specified\n" );
ADDRGP4 $404
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 638
;638:		return;
ADDRGP4 $350
JUMPV
LABELV $402
line 642
;639:	}
;640:
;641:	// have the server allocate a client slot
;642:	clientNum = trap_BotAllocateClient();
ADDRLP4 1116
ADDRGP4 trap_BotAllocateClient
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1116
INDIRI4
ASGNI4
line 643
;643:	if ( clientNum == -1 ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
NEI4 $405
line 644
;644:                G_Printf( S_COLOR_RED "Unable to add bot.  All player slots are in use.\n" );
ADDRGP4 $407
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 645
;645:                G_Printf( S_COLOR_RED "Start server with more 'open' slots (or check setting of sv_maxclients cvar).\n" );
ADDRGP4 $408
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 646
;646:                return;
ADDRGP4 $350
JUMPV
LABELV $405
line 650
;647:	}
;648:
;649:	// initialize the bot settings
;650:	if( !team || !*team ) {
ADDRLP4 1120
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $411
ADDRLP4 1120
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $409
LABELV $411
line 651
;651:		if( g_gametype.integer >= GT_TEAM && g_ffa_gt!=1) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $412
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
EQI4 $412
line 652
;652:			if( PickTeam(clientNum) == TEAM_RED) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 1
NEI4 $415
line 653
;653:				team = "red";
ADDRFP4 8
ADDRGP4 $187
ASGNP4
line 654
;654:			}
ADDRGP4 $413
JUMPV
LABELV $415
line 655
;655:			else {
line 656
;656:				team = "blue";
ADDRFP4 8
ADDRGP4 $190
ASGNP4
line 657
;657:			}
line 658
;658:		}
ADDRGP4 $413
JUMPV
LABELV $412
line 659
;659:		else {
line 660
;660:			team = "red";
ADDRFP4 8
ADDRGP4 $187
ASGNP4
line 661
;661:		}
LABELV $413
line 662
;662:	}
LABELV $409
line 663
;663:	Info_SetValueForKey( userinfo, "characterfile", Info_ValueForKey( botinfo, "aifile" ) );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $401
ARGP4
ADDRLP4 1124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $338
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 664
;664:	Info_SetValueForKey( userinfo, "skill", va( "%5.2f", skill ) );
ADDRGP4 $417
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $340
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 665
;665:	Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 0
ARGP4
ADDRGP4 $342
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 667
;666:
;667:	bot = &g_entities[ clientNum ];
ADDRLP4 1052
CNSTI4 2492
ADDRLP4 1036
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 668
;668:	bot->r.svFlags |= SVF_BOT;
ADDRLP4 1132
ADDRLP4 1052
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 1132
INDIRP4
ADDRLP4 1132
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 669
;669:	bot->inuse = qtrue;
ADDRLP4 1052
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 670
;670:	if(spawn){
ADDRFP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $418
line 671
;671:	spawn->parent = bot;
ADDRFP4 32
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 1052
INDIRP4
ASGNP4
line 672
;672:	spawn->think = botsandbox_check;
ADDRFP4 32
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 botsandbox_check
ASGNP4
line 673
;673:	spawn->nextthink = level.time + 1;
ADDRFP4 32
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 674
;674:	}
LABELV $418
line 677
;675:
;676:	// set the bot's spawning entity
;677:	Info_SetValueForKey( userinfo, "parentid", va( "%i", parentEntityNum ) );
ADDRGP4 $125
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 1136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $421
ARGP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 678
;678:	if(customspbot){
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $422
line 679
;679:	Info_SetValueForKey( userinfo, "singlebot", va( "%i", customspbot ) );
ADDRGP4 $125
ARGP4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 680
;680:	}
LABELV $422
line 681
;681:	if ( waypoint )
ADDRFP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $425
line 682
;682:		Info_SetValueForKey( userinfo, "waypoint", waypoint);
ADDRLP4 0
ARGP4
ADDRGP4 $345
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
LABELV $425
line 685
;683:
;684:	// register the userinfo
;685:	trap_SetUserinfo( clientNum, userinfo );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 688
;686:
;687:	// have it connect to the game as a normal client
;688:	if ( ClientConnect( clientNum, qtrue, qtrue ) ) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1140
CNSTI4 1
ASGNI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 1144
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 1144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $427
line 689
;689:		return;
ADDRGP4 $350
JUMPV
LABELV $427
line 692
;690:	}
;691:
;692:	if( delay == 0 ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $429
line 693
;693:		ClientBegin( clientNum );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 694
;694:		return;
ADDRGP4 $350
JUMPV
LABELV $429
line 697
;695:	}
;696:
;697:	AddBotToSpawnQueue( clientNum, delay );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 AddBotToSpawnQueue
CALLV
pop
line 698
;698:}
LABELV $350
endproc G_AddBot 1148 12
export Svcmd_AddBot_f
proc Svcmd_AddBot_f 5140 36
line 706
;699:
;700:
;701:/*
;702:===============
;703:Svcmd_AddBot_f
;704:===============
;705:*/
;706:void Svcmd_AddBot_f( void ) {
line 716
;707:	float			skill;
;708:	int				delay;
;709:	char			name[MAX_TOKEN_CHARS];
;710:	char			altname[MAX_TOKEN_CHARS];
;711:	char			string[MAX_TOKEN_CHARS];
;712:	char			team[MAX_TOKEN_CHARS];
;713:	char			waypoint[MAX_TOKEN_CHARS];
;714:
;715:	// are bots enabled?
;716:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $434
ARGP4
ADDRLP4 5128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 5128
INDIRI4
CNSTI4 0
NEI4 $432
line 717
;717:		return;
ADDRGP4 $431
JUMPV
LABELV $432
line 721
;718:	}
;719:
;720:	// name
;721:	trap_Argv( 1, name, sizeof( name ) );
CNSTI4 1
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 722
;722:	if ( !name[0] ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $435
line 723
;723:		trap_Printf( "Usage: Addbot <botname> [skill 1-5] [team] [msec delay] [altname]\n" );
ADDRGP4 $437
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 724
;724:		return;
ADDRGP4 $431
JUMPV
LABELV $435
line 728
;725:	}
;726:
;727:	// skill
;728:	trap_Argv( 2, string, sizeof( string ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 729
;729:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $438
line 730
;730:		skill = 4;
ADDRLP4 5120
CNSTF4 1082130432
ASGNF4
line 731
;731:	}
ADDRGP4 $439
JUMPV
LABELV $438
line 732
;732:	else {
line 733
;733:		skill = atof( string );
ADDRLP4 0
ARGP4
ADDRLP4 5132
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 5120
ADDRLP4 5132
INDIRF4
ASGNF4
line 734
;734:	}
LABELV $439
line 737
;735:
;736:	// team
;737:	trap_Argv( 3, team, sizeof( team ) );
CNSTI4 3
ARGI4
ADDRLP4 3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 740
;738:
;739:	// delay
;740:	trap_Argv( 4, string, sizeof( string ) );
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 741
;741:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $440
line 742
;742:		delay = 0;
ADDRLP4 5124
CNSTI4 0
ASGNI4
line 743
;743:	}
ADDRGP4 $441
JUMPV
LABELV $440
line 744
;744:	else {
line 745
;745:		delay = atoi( string );
ADDRLP4 0
ARGP4
ADDRLP4 5132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 5124
ADDRLP4 5132
INDIRI4
ASGNI4
line 746
;746:	}
LABELV $441
line 749
;747:
;748:	// alternative name
;749:	trap_Argv( 5, altname, sizeof( altname ) );
CNSTI4 5
ARGI4
ADDRLP4 2048
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 752
;750:
;751:	// waypoint
;752:	trap_Argv( 6, waypoint, sizeof(waypoint) );
CNSTI4 6
ARGI4
ADDRLP4 4096
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 754
;753:
;754:	G_AddBot( name, skill, team, delay, altname, 0, waypoint, 0, NULL );
ADDRLP4 1024
ARGP4
ADDRLP4 5120
INDIRF4
ARGF4
ADDRLP4 3072
ARGP4
ADDRLP4 5124
INDIRI4
ARGI4
ADDRLP4 2048
ARGP4
ADDRLP4 5132
CNSTI4 0
ASGNI4
ADDRLP4 5132
INDIRI4
ARGI4
ADDRLP4 4096
ARGP4
ADDRLP4 5132
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_AddBot
CALLV
pop
line 758
;755:
;756:	// if this was issued during gameplay and we are playing locally,
;757:	// go ahead and load the bot's media immediately
;758:	if ( level.time - level.startTime > 1000 &&
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $442
ADDRGP4 $446
ARGP4
ADDRLP4 5136
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 5136
INDIRI4
CNSTI4 0
EQI4 $442
line 759
;759:		trap_Cvar_VariableIntegerValue( "cl_running" ) ) {
line 760
;760:		trap_SendServerCommand( -1, "loaddefered\n" );	// FIXME: spelled wrong, but not changing for demo
CNSTI4 -1
ARGI4
ADDRGP4 $447
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 761
;761:	}
LABELV $442
line 762
;762:}
LABELV $431
endproc Svcmd_AddBot_f 5140 36
export Svcmd_BotList_f
proc Svcmd_BotList_f 4120 20
line 769
;763:
;764:/*
;765:===============
;766:Svcmd_BotList_f
;767:===============
;768:*/
;769:void Svcmd_BotList_f( void ) {
line 776
;770:	int i;
;771:	char name[MAX_TOKEN_CHARS];
;772:	char funname[MAX_TOKEN_CHARS];
;773:	char model[MAX_TOKEN_CHARS];
;774:	char aifile[MAX_TOKEN_CHARS];
;775:
;776:	trap_Printf("^1name             model            aifile              funname\n");
ADDRGP4 $449
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 777
;777:	for (i = 0; i < g_numBots; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $453
JUMPV
LABELV $450
line 778
;778:		strcpy(name, Info_ValueForKey( g_botInfos[i], "name" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 4100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4100
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 779
;779:		if ( !*name ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $454
line 780
;780:			strcpy(name, "UnnamedPlayer");
ADDRLP4 4
ARGP4
ADDRGP4 $456
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 781
;781:		}
LABELV $454
line 782
;782:		strcpy(funname, Info_ValueForKey( g_botInfos[i], "funname" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 4104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ARGP4
ADDRLP4 4104
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 783
;783:		if ( !*funname ) {
ADDRLP4 1028
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $457
line 784
;784:			strcpy(funname, "");
ADDRLP4 1028
ARGP4
ADDRGP4 $106
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 785
;785:		}
LABELV $457
line 786
;786:		strcpy(model, Info_ValueForKey( g_botInfos[i], "model" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $379
ARGP4
ADDRLP4 4108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2052
ARGP4
ADDRLP4 4108
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 787
;787:		if ( !*model ) {
ADDRLP4 2052
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $459
line 788
;788:			strcpy(model, "sarge/default");
ADDRLP4 2052
ARGP4
ADDRGP4 $382
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 789
;789:		}
LABELV $459
line 790
;790:		strcpy(aifile, Info_ValueForKey( g_botInfos[i], "aifile"));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $401
ARGP4
ADDRLP4 4112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3076
ARGP4
ADDRLP4 4112
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 791
;791:		if (!*aifile ) {
ADDRLP4 3076
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $461
line 792
;792:			strcpy(aifile, "bots/default_c.c");
ADDRLP4 3076
ARGP4
ADDRGP4 $463
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 793
;793:		}
LABELV $461
line 794
;794:		trap_Printf(va("%-16s %-16s %-20s %-20s\n", name, model, aifile, funname));
ADDRGP4 $464
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2052
ARGP4
ADDRLP4 3076
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 4116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4116
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 795
;795:	}
LABELV $451
line 777
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $453
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $450
line 796
;796:}
LABELV $448
endproc Svcmd_BotList_f 4120 20
proc G_SpawnBots 1056 16
line 804
;797:
;798:
;799:/*
;800:===============
;801:G_SpawnBots
;802:===============
;803:*/
;804:static void G_SpawnBots( char *botList, int baseDelay ) {
line 811
;805:	char		*bot;
;806:	char		*p;
;807:	float		skill;
;808:	int			delay;
;809:	char		bots[MAX_INFO_VALUE];
;810:
;811:	podium1 = NULL;
ADDRGP4 podium1
CNSTP4 0
ASGNP4
line 812
;812:	podium2 = NULL;
ADDRGP4 podium2
CNSTP4 0
ASGNP4
line 813
;813:	podium3 = NULL;
ADDRGP4 podium3
CNSTP4 0
ASGNP4
line 815
;814:
;815:	skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $184
ARGP4
ADDRLP4 1040
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 1040
INDIRF4
ASGNF4
line 816
;816:	if( skill < 1 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $466
line 817
;817:		trap_Cvar_Set( "g_spSkill", "1" );
ADDRGP4 $184
ARGP4
ADDRGP4 $468
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 818
;818:		skill = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 819
;819:	}
ADDRGP4 $467
JUMPV
LABELV $466
line 820
;820:	else if ( skill > 14 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1096810496
LEF4 $469
line 821
;821:		trap_Cvar_Set( "g_spSkill", "14" );
ADDRGP4 $184
ARGP4
ADDRGP4 $471
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 822
;822:		skill = 14;
ADDRLP4 12
CNSTF4 1096810496
ASGNF4
line 823
;823:	}
LABELV $469
LABELV $467
line 825
;824:
;825:	Q_strncpyz( bots, botList, sizeof(bots) );
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 826
;826:	p = &bots[0];
ADDRLP4 0
ADDRLP4 16
ASGNP4
line 827
;827:	delay = baseDelay;
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $473
JUMPV
line 828
;828:	while( *p ) {
LABELV $475
line 830
;829:		//skip spaces
;830:		while( *p && *p == ' ' ) {
line 831
;831:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 832
;832:		}
LABELV $476
line 830
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $478
ADDRLP4 1044
INDIRI4
CNSTI4 32
EQI4 $475
LABELV $478
line 833
;833:		if( !p ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $479
line 834
;834:			break;
ADDRGP4 $474
JUMPV
LABELV $479
line 838
;835:		}
;836:
;837:		// mark start of bot name
;838:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $482
JUMPV
LABELV $481
line 841
;839:
;840:		// skip until space of null
;841:		while( *p && *p != ' ' ) {
line 842
;842:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 843
;843:		}
LABELV $482
line 841
ADDRLP4 1048
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $484
ADDRLP4 1048
INDIRI4
CNSTI4 32
NEI4 $481
LABELV $484
line 844
;844:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $485
line 845
;845:			*p++ = 0;
ADDRLP4 1052
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1052
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI1 0
ASGNI1
line 846
;846:		}
LABELV $485
line 850
;847:
;848:		// we must add the bot this way, calling G_AddBot directly at this stage
;849:		// does "Bad Things"
;850:		trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s %f free %i\n", bot, skill, delay) );
ADDRGP4 $487
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 852
;851:
;852:		delay += BOT_BEGIN_DELAY_INCREMENT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 853
;853:	}
LABELV $473
line 828
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $476
LABELV $474
line 854
;854:}
LABELV $465
endproc G_SpawnBots 1056 16
proc G_LoadBotsFromFile 16408 16
line 862
;855:
;856:
;857:/*
;858:===============
;859:G_LoadBotsFromFile
;860:===============
;861:*/
;862:static void G_LoadBotsFromFile( char *filename ) {
line 867
;863:	int				len;
;864:	fileHandle_t	f;
;865:	char			buf[MAX_BOTS_TEXT];
;866:
;867:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
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
line 868
;868:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $489
line 869
;869:		trap_Printf( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $100
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
ADDRGP4 trap_Printf
CALLV
pop
line 870
;870:		return;
ADDRGP4 $488
JUMPV
LABELV $489
line 872
;871:	}
;872:	if ( len >= MAX_BOTS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 16384
LTI4 $491
line 873
;873:		trap_Printf( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i\n", filename, len, MAX_BOTS_TEXT ) );
ADDRGP4 $103
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
ADDRGP4 trap_Printf
CALLV
pop
line 874
;874:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 875
;875:		return;
ADDRGP4 $488
JUMPV
LABELV $491
line 878
;876:	}
;877:
;878:	trap_FS_Read( buf, len, f );
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
line 879
;879:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 880
;880:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 882
;881:
;882:	g_numBots += G_ParseInfos( buf, MAX_BOTS - g_numBots, &g_botInfos[g_numBots] );
ADDRLP4 8
ARGP4
ADDRLP4 16396
ADDRGP4 g_numBots
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
ADDRGP4 g_botInfos
ADDP4
ARGP4
ADDRLP4 16404
ADDRGP4 G_ParseInfos
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
line 883
;883:}
LABELV $488
endproc G_LoadBotsFromFile 16408 16
proc G_LoadBots 1456 16
line 890
;884:
;885:/*
;886:===============
;887:G_LoadBots
;888:===============
;889:*/
;890:static void G_LoadBots( void ) {
line 899
;891:	vmCvar_t	botsFile;
;892:	int			numdirs;
;893:	char		filename[128];
;894:	char		dirlist[1024];
;895:	char*		dirptr;
;896:	int			i;
;897:	int			dirlen;
;898:
;899:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $434
ARGP4
ADDRLP4 1440
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1440
INDIRI4
CNSTI4 0
NEI4 $494
line 900
;900:		return;
ADDRGP4 $493
JUMPV
LABELV $494
line 903
;901:	}
;902:
;903:	g_numBots = 0;
ADDRGP4 g_numBots
CNSTI4 0
ASGNI4
line 905
;904:
;905:	trap_Cvar_Register( &botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 144
ARGP4
ADDRGP4 $496
ARGP4
ADDRGP4 $106
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 906
;906:	if( *botsFile.string ) {
ADDRLP4 144+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $497
line 907
;907:		G_LoadBotsFromFile(botsFile.string);
ADDRLP4 144+16
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 908
;908:	}
ADDRGP4 $498
JUMPV
LABELV $497
line 909
;909:	else {
line 910
;910:		G_LoadBotsFromFile("scripts/bots.txt");
ADDRGP4 $501
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 911
;911:	}
LABELV $498
line 914
;912:
;913:	// get all bots from .bot files
;914:	numdirs = trap_FS_GetFileList("scripts", ".bot", dirlist, 1024 );
ADDRGP4 $112
ARGP4
ADDRGP4 $502
ARGP4
ADDRLP4 416
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1444
INDIRI4
ASGNI4
line 915
;915:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 416
ASGNP4
line 916
;916:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $506
JUMPV
LABELV $503
line 917
;917:		dirlen = strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 1448
INDIRI4
ASGNI4
line 918
;918:		strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $118
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 919
;919:		strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 920
;920:		G_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 921
;921:	}
LABELV $504
line 916
ADDRLP4 1448
CNSTI4 1
ASGNI4
ADDRLP4 132
ADDRLP4 132
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 136
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $506
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $503
line 922
;922:	trap_Printf( va( "%i bots parsed\n", g_numBots ) );
ADDRGP4 $507
ARGP4
ADDRGP4 g_numBots
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 923
;923:}
LABELV $493
endproc G_LoadBots 1456 16
export G_GetBotInfoByNumber
proc G_GetBotInfoByNumber 8 8
line 932
;924:
;925:
;926:
;927:/*
;928:===============
;929:G_GetBotInfoByNumber
;930:===============
;931:*/
;932:char *G_GetBotInfoByNumber( int num ) {
line 933
;933:	if( num < 0 || num >= g_numBots ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $511
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $509
LABELV $511
line 934
;934:		trap_Printf( va( S_COLOR_RED "Invalid bot number: %i\n", num ) );
ADDRGP4 $512
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
ADDRGP4 trap_Printf
CALLV
pop
line 935
;935:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $508
JUMPV
LABELV $509
line 937
;936:	}
;937:	return g_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
LABELV $508
endproc G_GetBotInfoByNumber 8 8
export G_GetBotInfoByName
proc G_GetBotInfoByName 16 8
line 946
;938:}
;939:
;940:
;941:/*
;942:===============
;943:G_GetBotInfoByName
;944:===============
;945:*/
;946:char *G_GetBotInfoByName( const char *name ) {
line 950
;947:	int		n;
;948:	char	*value;
;949:
;950:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $517
JUMPV
LABELV $514
line 951
;951:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 952
;952:		if ( !Q_stricmp( value, name ) ) {
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
NEI4 $518
line 953
;953:			return g_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $513
JUMPV
LABELV $518
line 955
;954:		}
;955:	}
LABELV $515
line 950
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $517
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $514
line 957
;956:
;957:	return NULL;
CNSTP4 0
RETP4
LABELV $513
endproc G_GetBotInfoByName 16 8
export G_InitBots
proc G_InitBots 1108 16
line 965
;958:}
;959:
;960:/*
;961:===============
;962:G_InitBots
;963:===============
;964:*/
;965:void G_InitBots( qboolean restart ) {
line 974
;966:	int			fragLimit;
;967:	int			timeLimit;
;968:	const char	*arenainfo;
;969:	char		*strValue;
;970:	int			basedelay;
;971:	char		map[MAX_QPATH];
;972:	char		serverinfo[MAX_INFO_STRING];
;973:
;974:	G_LoadBots();
ADDRGP4 G_LoadBots
CALLV
pop
line 975
;975:	G_LoadArenas();
ADDRGP4 G_LoadArenas
CALLV
pop
line 977
;976:
;977:	trap_Cvar_Register( &bot_minplayers, "bot_minplayers", "0", CVAR_SERVERINFO );
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 $521
ARGP4
ADDRGP4 $522
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 978
;978:}
LABELV $520
endproc G_InitBots 1108 16
export G_AddCustomBot
proc G_AddCustomBot 20 36
line 986
;979:
;980:/*
;981:====================
;982:G_AddSinglePlayerBot
;983:====================
;984:*/
;985:
;986:void G_AddCustomBot( char *name, int parentEntityNum, char* waypoint, float relSkill, int npcid, char* altname ) {
line 987
;987:	float skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $184
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 988
;988:	int noprint = trap_Cvar_VariableIntegerValue( "cl_noprint" );
ADDRGP4 $524
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 991
;989:
;990:	//apply relative skill level to bot's general skill level
;991:	skill += relSkill;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 992
;992:	if (skill < 1)
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $525
line 993
;993:		skill = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
LABELV $525
line 994
;994:	if (skill > 14)
ADDRLP4 0
INDIRF4
CNSTF4 1096810496
LEF4 $527
line 995
;995:		skill = 14;
ADDRLP4 0
CNSTF4 1096810496
ASGNF4
LABELV $527
line 997
;996:	
;997:	if(!npcid){
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $529
line 998
;998:	npcid = 1;
ADDRFP4 16
CNSTI4 1
ASGNI4
line 999
;999:	}
LABELV $529
line 1002
;1000:
;1001:	//set cl_noprint to 1 while adding bots in SP mode so that their loading message don't appear
;1002:	if ( !g_debugBotspawns.integer )
ADDRGP4 g_debugBotspawns+12
INDIRI4
CNSTI4 0
NEI4 $531
line 1003
;1003:		trap_Cvar_Set( "cl_noprint", "1" );
ADDRGP4 $524
ARGP4
ADDRGP4 $468
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $531
line 1005
;1004:
;1005:	if(!altname){
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $534
line 1006
;1006:	G_AddBot( name, skill, "free", 0, name, parentEntityNum, waypoint, npcid, NULL );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 $536
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_AddBot
CALLV
pop
line 1007
;1007:	} else {
ADDRGP4 $535
JUMPV
LABELV $534
line 1008
;1008:	G_AddBot( name, skill, "free", 0, altname, parentEntityNum, waypoint, npcid, NULL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 $536
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_AddBot
CALLV
pop
line 1009
;1009:	}
LABELV $535
line 1012
;1010:
;1011:	//restore cl_noprint to its former value
;1012:	trap_Cvar_Set( "cl_noprint", va("%i", noprint ) );
ADDRGP4 $125
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $524
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1013
;1013:}
LABELV $523
endproc G_AddCustomBot 20 36
import podium3
import podium2
import podium1
bss
export bot_minplayers
align 4
LABELV bot_minplayers
skip 272
align 4
LABELV botSpawnQueue
skip 128
align 4
LABELV g_arenaInfos
skip 4096
export g_numArenas
align 4
LABELV g_numArenas
skip 4
align 4
LABELV g_botInfos
skip 8192
align 4
LABELV g_numBots
skip 4
import G_admin_namelog_cleanup
import G_admin_cleanup
import G_admin_duration
import G_admin_buffer_end
import G_admin_buffer_begin
import G_admin_buffer_print
import G_admin_print
import G_admin_shuffle
import G_admin_warn
import G_admin_slap
import G_admin_orient
import G_admin_disorient
import G_admin_unlock
import G_admin_lock
import G_admin_namelog
import G_admin_nextmap
import G_admin_restart
import G_admin_rename
import G_admin_spec999
import G_admin_passvote
import G_admin_cancelvote
import G_admin_allready
import G_admin_admintest
import G_admin_help
import G_admin_showbans
import G_admin_mute
import G_admin_map
import G_admin_listplayers
import G_admin_listadmins
import G_admin_putteam
import G_admin_unban
import G_admin_ban
import G_admin_adjustban
import G_admin_kick
import G_admin_setlevel
import G_admin_time
import G_admin_parse_time
import G_admin_level
import G_admin_namelog_update
import G_admin_name_check
import G_admin_permission
import G_admin_readconfig
import G_admin_cmd_check
import G_admin_ban_check
import G_ConfigClientExcellent
import G_checkForMultiKill
import G_CheckForSpree
import G_RunStreakLogic
import G_ReadAltKillSettings
import AU_Cvar_VariableString
import G_ArenaScriptRandom
import G_ArenaScriptAutoFloat
import G_ArenaScriptAutoNonPointChar
import G_ArenaScriptAutoChar
import G_ArenaScriptAutoInt
import G_ArenaScriptFindFloat
import G_ArenaScriptFindChar
import G_ArenaScriptFindInt
import Svcmd_SaveSession_f
import Svcmd_For_f
import Svcmd_SystemCommand_f
import Svcmd_ClientCommand_f
import Svcmd_Editline_f
import Svcmd_Random_f
import Svcmd_Cvar_f
import Svcmd_Operation_f
import Svcmd_Condition_f
import Svcmd_MessageWrapper
import Svcmd_ListIP_f
import Svcmd_Chat_f
import Svcmd_DumpUser_f
import Svcmd_EjectClient_f
import Svcmd_BannerPrint_f
import Svcmd_ReplaceTexture_f
import Svcmd_CenterPrint_f
import Svcmd_TeamMessage_f
import Svcmd_Status_f
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_System
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_maxNameChanges
import g_minNameChangePeriod
import g_warningExpire
import g_maxWarnings
import g_publicAdminMessages
import g_specChat
import g_adminMaxBan
import g_adminTempBan
import g_adminNameProtect
import g_adminParseSay
import g_adminLog
import g_admin
import g_floodMinTime
import g_floodMaxDemerits
import g_spreeDiv
import g_altExcellent
import g_sprees
import g_lagLightning
import sv_fps
import g_truePing
import g_delagHitscan
import g_blueTeamClientNumbers
import g_redTeamClientNumbers
import g_humanplayers
import g_maxvotes
import g_voteMaxFraglimit
import g_voteMinFraglimit
import g_voteMaxTimelimit
import g_voteMinTimelimit
import g_voteGametypes
import g_voteBan
import g_voteNames
import g_mappools
import g_autonextmap
import g_catchup
import g_persistantpowerups
import g_awardpushing
import g_elimination_ctf_oneway
import g_lms_mode
import g_lms_lives
import g_ffa_gt
import g_regen
import g_vampireMaxHealth
import g_vampire
import g_instantgib
import g_rockets
import g_elimination_lockspectator
import g_eliminationred_holdable
import g_eliminationred_flight
import g_eliminationred_regen
import g_eliminationred_invis
import g_eliminationred_bsuit
import g_eliminationred_haste
import g_eliminationred_quad
import g_eliminationred_antimatter
import g_eliminationred_flame
import g_eliminationred_nail
import g_eliminationred_mine
import g_eliminationred_chain
import g_eliminationred_plasmagun
import g_eliminationred_lightning
import g_eliminationred_railgun
import g_eliminationred_rocket
import g_eliminationred_grenade
import g_eliminationred_shotgun
import g_eliminationred_machinegun
import g_eliminationred_gauntlet
import g_eliminationred_grapple
import g_eliminationred_bfg
import g_eliminationred_startArmor
import g_eliminationred_startHealth
import g_elimination_holdable
import g_elimination_items
import g_elimination_flight
import g_elimination_regen
import g_elimination_invis
import g_elimination_bsuit
import g_elimination_haste
import g_elimination_quad
import g_elimination_antimatter
import g_elimination_flame
import g_elimination_nail
import g_elimination_mine
import g_elimination_chain
import g_elimination_plasmagun
import g_elimination_lightning
import g_elimination_railgun
import g_elimination_rocket
import g_elimination_grenade
import g_elimination_shotgun
import g_elimination_machinegun
import g_elimination_gauntlet
import g_elimination_allgametypes
import g_elimination_activewarmup
import g_elimination_warmup
import g_elimination_roundtime
import g_elimination_grapple
import g_elimination_bfg
import g_elimination_startArmor
import g_elimination_startHealth
import g_elimination_selfdamage
import g_spawnprotect
import g_music
import g_proxMineTimeout
import g_enableBreath
import g_enableDust
import g_blueteam
import g_redteam
import g_singlePlayer
import g_rankings
import pmove_float
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_votecustom
import g_votemaps
import g_motdfile
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_allowSyncCutscene
import g_debugBotspawns
import g_debugVariables
import g_debugScore
import g_debugCameras
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_disableCutscenes
import g_inactivity
import g_respawntime
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_damageModifier
import g_gravityModifier
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_voteflags
import g_elimflags
import g_videoflags
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_poweruprespawn
import g_megahealthrespawn
import g_holdablerespawn
import g_ammorespawn
import g_healthrespawn
import g_armorrespawn
import g_ammolimit
import g_drowndamage
import g_speedfactor
import g_jumpheight
import g_respawnwait
import g_armorprotect
import g_medkitmodifier
import g_hastefirespeed
import g_autoflagreturn
import g_droppeditemtime
import g_slowhealthregen
import g_fasthealthregen
import g_invultime
import g_invulmove
import g_portalhealth
import g_portaltimeout
import g_flagrespawn
import g_noplayerclip
import g_falldamagebig
import g_falldamagesmall
import g_randomteleport
import g_maxweaponpickup
import g_slimedamage
import g_lavadamage
import g_waterdamage
import g_medkitlimit
import g_kamikazeinf
import g_portalinf
import g_teleporterinf
import g_medkitinf
import g_invulinf
import g_kamikazeinfinf
import g_kill
import g_mapcycleposition
import g_useMapcycle
import g_mapcycle
import info_zombie
import g_randomItems
import g_accelerate
import g_slickmove
import g_overlay
import g_lavatowater
import onandroid
import eliminationrespawn
import eliminationredrespawn
import g_spectatorspeed
import g_regenarmor
import tex_newname
import tex_name
import g_roundmode
import g_scoreboardlock
import g_connectmsg
import g_currentmap
import g_tests
import cl_language
import cl_selectedmod
import g_maxEntities
import g_npcdrop
import g_safe
import g_allowgravitygun
import g_allowphysgun
import g_allowtoolgun
import g_allownoclip
import g_allowitems
import g_allownpc
import g_allowsettings
import g_allowprops
import save8_epsession
import save8_session0_lvl
import save8_session0
import save7_epsession
import save7_session0_lvl
import save7_session0
import save6_epsession
import save6_session0_lvl
import save6_session0
import save5_epsession
import save5_session0_lvl
import save5_session0
import save4_epsession
import save4_session0_lvl
import save4_session0
import save3_epsession
import save3_session0_lvl
import save3_session0
import save2_epsession
import save2_session0_lvl
import save2_session0
import save1_epsession
import save1_session0_lvl
import save1_session0
import save_epsession
import save_session0_lvl
import save_session0
import save8_curmap
import save7_curmap
import save6_curmap
import save5_curmap
import save4_curmap
import save3_curmap
import save2_curmap
import save1_curmap
import save_curmap
import g_skyColorA
import g_skyColorB
import g_skyColorG
import g_skyColorR
import g_skyShader
import g_fogColorA
import g_fogColorB
import g_fogColorG
import g_fogColorR
import g_fogInterval
import g_fogDistance
import g_fogShader
import g_fogModel
import g_teamred_pickupitems
import g_teamred_respawnwait
import g_teamred_infammo
import g_teamred_damage
import g_teamred_firespeed
import g_teamred_gravityModifier
import g_teamred_speed
import g_teamblue_pickupitems
import g_teamblue_respawnwait
import g_teamblue_infammo
import g_teamblue_damage
import g_teamblue_firespeed
import g_teamblue_gravityModifier
import g_teamblue_speed
import g_amweaponcount
import g_ftweaponcount
import g_cgweaponcount
import g_plweaponcount
import g_ngweaponcount
import g_bfgweaponcount
import g_pgweaponcount
import g_rgweaponcount
import g_lgweaponcount
import g_rlweaponcount
import g_glweaponcount
import g_sgweaponcount
import g_mgweaponcount
import g_ftammocount
import g_cgammocount
import g_plammocount
import g_ngammocount
import g_bfgammocount
import g_pgammocount
import g_rgammocount
import g_lgammocount
import g_rlammocount
import g_glammocount
import g_sgammocount
import g_mgammocount
import g_ammoregenhealthmodifier
import g_ammoregengravitymodifier
import g_ammoregenspeedfactor
import g_ammoregendamagefactor
import g_ammoregen_infammo
import g_ammoregenfirespeed
import g_guard_infammo
import g_guardgravitymodifier
import g_guardspeedfactor
import g_guarddamagefactor
import g_guardfirespeed
import g_guardhealthmodifier
import g_doublerhealthmodifier
import g_doubler_infammo
import g_doublergravitymodifier
import g_doublerspeedfactor
import g_doublerdamagefactor
import g_doublerfirespeed
import g_scouthealthmodifier
import g_scout_infammo
import g_scoutgravitymodifier
import g_scoutdamagefactor
import g_scoutfirespeed
import g_scoutspeedfactor
import g_amguided
import g_amhoming
import g_ftguided
import g_fthoming
import g_ngguided
import g_nghoming
import g_bfgguided
import g_bfghoming
import g_pgguided
import g_pghoming
import g_rlguided
import g_rlhoming
import g_glguided
import g_glhoming
import g_amknockback
import g_ambouncemodifier
import g_aminf
import g_amvampire
import g_amgravity
import g_ambounce
import g_amtimeout
import g_amdamage
import g_amsdamage
import g_amspeed
import g_amsradius
import g_amdelay
import g_ftknockback
import g_ftbouncemodifier
import g_ftinf
import g_ftvampire
import g_ftgravity
import g_ftbounce
import g_fttimeout
import g_ftdamage
import g_ftsdamage
import g_ftspeed
import g_ftsradius
import g_ftdelay
import g_cgknockback
import g_cginf
import g_cgvampire
import g_cgspread
import g_cgdamage
import g_cgdelay
import g_plknockback
import g_plinf
import g_plvampire
import g_plgravity
import g_pldamage
import g_plsdamage
import g_plsradius
import g_pltimeout
import g_plspeed
import g_pldelay
import g_ngknockback
import g_ngbouncemodifier
import g_nginf
import g_ngvampire
import g_ngrandom
import g_nggravity
import g_ngbounce
import g_ngcount
import g_ngtimeout
import g_ngdamage
import g_ngspread
import g_ngspeed
import g_ngdelay
import g_bfgknockback
import g_bfgbouncemodifier
import g_bfginf
import g_bfgvampire
import g_bfggravity
import g_bfgbounce
import g_bfgdamage
import g_bfgsdamage
import g_bfgsradius
import g_bfgtimeout
import g_bfgspeed
import g_bfgdelay
import g_pgknockback
import g_pgbouncemodifier
import g_pginf
import g_pgvampire
import g_pggravity
import g_pgbounce
import g_pgtimeout
import g_pgdamage
import g_pgsdamage
import g_pgspeed
import g_pgsradius
import g_pgdelay
import g_rgknockback
import g_rginf
import g_rgvampire
import g_rgdamage
import g_rgdelay
import g_lgknockback
import g_lginf
import g_lgvampire
import g_lgsradius
import g_lgsdamage
import g_lgexplode
import g_lgrange
import g_lgdelay
import g_lgdamage
import g_rlknockback
import g_rlbouncemodifier
import g_rlinf
import g_rlvampire
import g_rlgravity
import g_rlbounce
import g_rldamage
import g_rlsdamage
import g_rlsradius
import g_rltimeout
import g_rlspeed
import g_rldelay
import g_glknockback
import g_glbouncemodifier
import g_glinf
import g_glvampire
import g_glgravity
import g_glbounce
import g_gldamage
import g_glsdamage
import g_glsradius
import g_gltimeout
import g_glspeed
import g_gldelay
import g_sgknockback
import g_sginf
import g_sgvampire
import g_sgcount
import g_sgsradius
import g_sgsdamage
import g_sgexplode
import g_sgspread
import g_sgdamage
import g_sgdelay
import g_mgknockback
import g_mginf
import g_mgvampire
import g_mgsradius
import g_mgsdamage
import g_mgexplode
import g_mgspread
import g_mgdamage
import g_mgdelay
import g_gknockback
import g_grange
import g_gdamage
import g_gdelay
import mod_ghtimeout
import g_ghtimeout
import g_ghspeed
import g_minigame
import g_physdamage
import g_physimpulse
import g_physimpact
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
import mod_gravity
import mod_zsround
import mod_zround
import mod_roundmode
import mod_overlay
import mod_slickmove
import mod_accelerate
import mod_teamred_damage
import mod_teamblue_damage
import mod_invulinf
import mod_kamikazeinf
import mod_portalinf
import mod_teleporterinf
import mod_medkitinf
import mod_medkitlimit
import mod_teamblue_firespeed
import mod_teamred_firespeed
import mod_invulmove
import mod_noplayerclip
import mod_flighttime
import mod_regentime
import mod_invistime
import mod_hastetime
import mod_bsuittime
import mod_quadtime
import mod_doublerfirespeed
import mod_guardfirespeed
import mod_poweruptime
import mod_scoutfirespeed
import mod_ammoregenfirespeed
import mod_hastefirespeed
import mod_vampire_max_health
import mod_amdelay
import mod_ftdelay
import mod_cgspread
import mod_cgdelay
import mod_pldelay
import mod_ngdelay
import mod_bfgdelay
import mod_rgdelay
import mod_pgdelay
import mod_lgrange
import mod_lgdelay
import mod_rldelay
import mod_gldelay
import mod_sgcount
import mod_sgspread
import mod_sgdelay
import mod_mgspread
import mod_mgdelay
import mod_gdelay
import mod_jumpheight
import mod_ammolimit
import cmapname
import CustomModRun
import Newmodcommands
import nailgun_think
import bfg_think
import grenade_think
import rocket_think
import plasma_think
import G_SendSwepWeapons
import G_SendWeaponProperties
import g_entities
import level
import Team_ForceGesture
import Team_DD_bonusAtPoints
import Team_RemoveDoubleDominationPoints
import Team_SpawnDoubleDominationPoints
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import Team_Dom_SpawnPoints
import SelectDoubleDominationSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import G_LoadMapfileAll_f
import G_LoadMapfile_f
import G_LoadMapfileAll
import G_LoadMapfile
import G_WriteMapfileAll_f
import G_WriteMapfile_f
import G_ClassnameAllowedAll
import G_ClassnameAllowed
import G_GetMapLockArena
import SkippedChar
import G_LoadMapcycle
import G_sendMapcycle
import G_drawMapcycle
import G_drawAllowedMaps
import G_mapIsVoteable
import G_GetMapfile
import G_GetNextMap
import G_GetNextMapCycle
import G_GotoNextMapCycle
import getCustomVote
import VoteParseCustomVotes
import allowedFraglimit
import allowedTimelimit
import allowedGametype
import allowedMap
import getMappage
import custom_vote_info
import ClientLeaving
import CountVotes
import CheckVote
import allowedVote
import PlayerStore_restore
import PlayerStore_store
import PlayerStoreInit
import BotInterbreedEndMatch
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_SaveClientSessionDataSave
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_TeamFromString
import ShuffleTeams
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_DefaultSwep
import G_CheckSwepAmmo
import G_CheckSwep
import G_RunClient
import ClientEndFrame
import ClientThink
import PrecacheBotAssets
import SetCustomWeapons
import SetSandboxWeapons
import SetUnlimitedWeapons
import SetupCustomBot
import LinkBotSpawnEntity
import DropClientSilently
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_NpcFactionProp
import G_LevelLoadComplete
import CheckTeamVote
import LogExit
import G_Error
import G_Printf
import SendYourTeamMessageToTeam
import SendDominationPointsStatusMessageToAllClients
import SendDDtimetakenMessageToAllClients
import SendEliminationMessageToAllClients
import SendScoreboardMessageToAllClients
import G_LogPrintf
import ExitLevel
import AddTournamentQueue
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import SendCustomVoteCommands
import DominationPointStatusMessage
import DominationPointNamesMessage
import RespawnTimeMessage
import EliminationMessage
import ObeliskHealthMessage
import AttackingTeamMessage
import YourTeamMessage
import DoubleDominationScoreTimeMessage
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import G_StartCarExplode
import G_StartKamikaze
import KamikazeShockWave
import KamikazeRadiusDamage
import CarExplodeDamage
import KamikazeDamage
import FireWeapon
import ClientForString
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpawnPointIsActive
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import ClientRespawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import LMSpoint
import EndEliminationRound
import DisableWeapons
import EnableWeapons
import RespawnDead
import RespawnAll
import TeamHealthCount
import TeamLivingCount
import TeamCount
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Laser_Think
import Laser_Gen
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import G_FindEntityForClientNum
import G_FindEntityForEntityNum
import G_ShowObjects
import G_HideObjects
import G_BounceProp
import G_RunProp
import G_ModProp
import DropPortalDestination
import DropPortalSource
import TeleportPlayer
import lock_touch
import trigger_teleporter_touch
import Break_Breakable
import Touch_DoorTrigger
import G_RunMover
import fire_antimatter
import fire_flame
import fire_prox
import fire_nail
import fire_nails
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_custom
import fire_blaster
import ProximityMine_RemoveAll
import G_RunMissile
import TossClientCubes
import TossClientPersistantPowerups
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_ExitVehicle
import G_CarDamage
import G_PropDamage
import G_Damage
import CanDamage
import target_finish_use
import target_finish_think
import BuildShaderStateConfig
import AddRemap
import G_SetTargetname
import G_SetTarget
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_GlobalSound
import G_Sound
import G_TempEntity
import G_Spawn
import findradius
import G_InitGentity
import CrosshairPointGravity
import CrosshairPointPhys
import FindEntityForGravitygun
import FindEntityForPhysgun
import VehiclePhys
import botsandbox_check
import G_CalculatePlayerScore
import G_FadeIn
import G_FadeOut
import G_Fade
import G_GetScoringMapName
import G_SetMovedir
import G_UseDeathTargets
import G_UseTargets
import G_PickTarget
import G_ScrFind
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import Throw_Item
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item2
import Touch_Item
import Set_Weapon
import Set_Ammo
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchBackpack
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItemCtf
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import writeFile_string
import writeFile_int
import readFile_string
import readFile_int
import SanitizeString
import G_ClientIsLagging
import G_ClientNumberFromString
import Cmd_AdminMessage_f
import G_FloodLimited
import G_ClientNumbersFromString
import G_SanitiseString
import G_MatchOnePlayer
import G_DecolorString
import G_SayConcatArgs
import G_SayArgv
import G_SayArgc
import NextCustomRound_f
import G_Say
import ConcatArgs
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector4
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import MiTechEntityList
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
LABELV $536
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $524
byte 1 99
byte 1 108
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $522
byte 1 48
byte 1 0
align 1
LABELV $521
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $512
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
LABELV $507
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
LABELV $502
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $501
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
LABELV $496
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
LABELV $487
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $471
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $468
byte 1 49
byte 1 0
align 1
LABELV $464
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $463
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 95
byte 1 99
byte 1 46
byte 1 99
byte 1 0
align 1
LABELV $456
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $449
byte 1 94
byte 1 49
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $447
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $446
byte 1 99
byte 1 108
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $437
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 65
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 60
byte 1 98
byte 1 111
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 32
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 45
byte 1 53
byte 1 93
byte 1 32
byte 1 91
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 93
byte 1 32
byte 1 91
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 93
byte 1 32
byte 1 91
byte 1 97
byte 1 108
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $434
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $424
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $421
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $417
byte 1 37
byte 1 53
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $408
byte 1 94
byte 1 49
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 39
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 39
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 40
byte 1 111
byte 1 114
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 41
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $407
byte 1 94
byte 1 49
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 46
byte 1 32
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $404
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $401
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $400
byte 1 53
byte 1 0
align 1
LABELV $397
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $396
byte 1 52
byte 1 0
align 1
LABELV $393
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $392
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $391
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $388
byte 1 103
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $387
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $384
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $383
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $382
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $379
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $376
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $373
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $370
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $367
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $366
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $363
byte 1 37
byte 1 49
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $362
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $361
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $360
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $359
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $354
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $353
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $345
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $342
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $340
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $338
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $328
byte 1 94
byte 1 51
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $207
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $192
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $190
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $187
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $184
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
LABELV $141
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $133
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $125
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $124
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $119
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
LABELV $118
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
LABELV $113
byte 1 46
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $112
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $111
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
LABELV $106
byte 1 0
align 1
LABELV $105
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
LABELV $103
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
byte 1 10
byte 1 0
align 1
LABELV $100
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
LABELV $94
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $93
byte 1 92
byte 1 110
byte 1 117
byte 1 109
byte 1 92
byte 1 0
align 1
LABELV $90
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $87
byte 1 125
byte 1 0
align 1
LABELV $84
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
LABELV $78
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
LABELV $75
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
LABELV $74
byte 1 123
byte 1 0
