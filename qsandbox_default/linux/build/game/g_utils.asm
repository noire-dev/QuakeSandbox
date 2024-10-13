data
export remapCount
align 4
LABELV remapCount
byte 4 0
export AddRemap
code
proc AddRemap 8 8
file "../../../code/game/g_utils.c"
line 38
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
;23:// g_utils.c -- misc utility functions for game module
;24:
;25:#include "g_local.h"
;26:
;27:typedef struct {
;28:  char oldShader[MAX_QPATH];
;29:  char newShader[MAX_QPATH];
;30:  float timeOffset;
;31:} shaderRemap_t;
;32:
;33:#define MAX_SHADER_REMAPS 512
;34:
;35:int remapCount = 0;
;36:shaderRemap_t remappedShaders[MAX_SHADER_REMAPS];
;37:
;38:void AddRemap(const char *oldShader, const char *newShader, float timeOffset) {
line 41
;39:	int i;
;40:
;41:	for (i = 0; i < remapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $69
JUMPV
LABELV $66
line 42
;42:		if (Q_stricmp(oldShader, remappedShaders[i].oldShader) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $70
line 44
;43:			// found it, just update this one
;44:			strcpy(remappedShaders[i].newShader,newShader);
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 45
;45:			remappedShaders[i].timeOffset = timeOffset;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 46
;46:			return;
ADDRGP4 $65
JUMPV
LABELV $70
line 48
;47:		}
;48:	}
LABELV $67
line 41
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $69
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $66
line 49
;49:	if (remapCount < MAX_SHADER_REMAPS) {
ADDRGP4 remapCount
INDIRI4
CNSTI4 512
GEI4 $74
line 50
;50:		strcpy(remappedShaders[remapCount].newShader,newShader);
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 51
;51:		strcpy(remappedShaders[remapCount].oldShader,oldShader);
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 52
;52:		remappedShaders[remapCount].timeOffset = timeOffset;
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 53
;53:		remapCount++;
ADDRLP4 4
ADDRGP4 remapCount
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 54
;54:	}
LABELV $74
line 55
;55:}
LABELV $65
endproc AddRemap 8 8
bss
align 1
LABELV $79
skip 4096
export BuildShaderStateConfig
code
proc BuildShaderStateConfig 144 24
line 57
;56:
;57:const char *BuildShaderStateConfig(void) {
line 62
;58:	static char	buff[MAX_STRING_CHARS*4];
;59:	char out[(MAX_QPATH * 2) + 5];
;60:	int i;
;61:
;62:	memset(buff, 0, MAX_STRING_CHARS);
ADDRGP4 $79
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 63
;63:	for (i = 0; i < remapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $80
line 64
;64:		Com_sprintf(out, (MAX_QPATH * 2) + 5, "%s=%s:%5.2f@", remappedShaders[i].oldShader, remappedShaders[i].newShader, remappedShaders[i].timeOffset);
ADDRLP4 4
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 $84
ARGP4
ADDRLP4 140
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders+128
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 65
;65:		Q_strcat( buff, sizeof( buff ), out);
ADDRGP4 $79
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 66
;66:	}
LABELV $81
line 63
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $83
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $80
line 67
;67:	return buff;
ADDRGP4 $79
RETP4
LABELV $78
endproc BuildShaderStateConfig 144 24
export G_FindConfigstringIndex
proc G_FindConfigstringIndex 1036 12
line 84
;68:}
;69:
;70:/*
;71:=========================================================================
;72:
;73:model / sound configstring indexes
;74:
;75:=========================================================================
;76:*/
;77:
;78:/*
;79:================
;80:G_FindConfigstringIndex
;81:
;82:================
;83:*/
;84:int G_FindConfigstringIndex( char *name, int start, int max, qboolean create ) {
line 88
;85:	int		i;
;86:	char	s[MAX_STRING_CHARS];
;87:
;88:	if ( !name || !name[0] ) {
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $90
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $88
LABELV $90
line 89
;89:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $88
line 92
;90:	}
;91:
;92:	for ( i=1 ; i<max ; i++ ) {
ADDRLP4 1024
CNSTI4 1
ASGNI4
ADDRGP4 $94
JUMPV
LABELV $91
line 93
;93:		trap_GetConfigstring( start + i, s, sizeof( s ) );
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 94
;94:		if ( !s[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $95
line 95
;95:			break;
ADDRGP4 $93
JUMPV
LABELV $95
line 97
;96:		}
;97:		if ( !strcmp( s, name ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $97
line 98
;98:			return i;
ADDRLP4 1024
INDIRI4
RETI4
ADDRGP4 $87
JUMPV
LABELV $97
line 100
;99:		}
;100:	}
LABELV $92
line 92
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $94
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $91
LABELV $93
line 102
;101:
;102:	if ( !create ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $99
line 103
;103:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $99
line 106
;104:	}
;105:
;106:	if ( i == max ) {
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $101
line 107
;107:		G_Error( "G_FindConfigstringIndex: overflow" );
ADDRGP4 $103
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 108
;108:	}
LABELV $101
line 110
;109:
;110:	trap_SetConfigstring( start + i, name );
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 112
;111:
;112:	return i;
ADDRLP4 1024
INDIRI4
RETI4
LABELV $87
endproc G_FindConfigstringIndex 1036 12
export G_ModelIndex
proc G_ModelIndex 4 16
line 116
;113:}
;114:
;115:
;116:int G_ModelIndex( char *name ) {
line 117
;117:	return G_FindConfigstringIndex (name, CS_MODELS, MAX_MODELS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
CNSTI4 4096
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $104
endproc G_ModelIndex 4 16
export G_SoundIndex
proc G_SoundIndex 4 16
line 120
;118:}
;119:
;120:int G_SoundIndex( char *name ) {
line 121
;121:	return G_FindConfigstringIndex (name, CS_SOUNDS, MAX_SOUNDS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4128
ARGI4
CNSTI4 4096
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $105
endproc G_SoundIndex 4 16
export G_TeamCommand
proc G_TeamCommand 8 8
line 134
;122:}
;123:
;124://=====================================================================
;125:
;126:
;127:/*
;128:================
;129:G_TeamCommand
;130:
;131:Broadcasts a command to only a specific team
;132:================
;133:*/
;134:void G_TeamCommand( team_t team, char *cmd ) {
line 137
;135:	int		i;
;136:
;137:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $107
line 138
;138:		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $112
line 139
;139:			if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $114
line 140
;140:				trap_SendServerCommand( i, va("%s", cmd ));
ADDRGP4 $116
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 141
;141:			}
LABELV $114
line 142
;142:		}
LABELV $112
line 143
;143:	}
LABELV $108
line 137
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $110
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $107
line 144
;144:}
LABELV $106
endproc G_TeamCommand 8 8
export G_Find
proc G_Find 8 8
line 160
;145:
;146:
;147:/*
;148:=============
;149:G_Find
;150:
;151:Searches all active entities for the next one that holds
;152:the matching string at fieldofs (use the FOFS() macro) in the structure.
;153:
;154:Searches beginning at the entity after from, or the beginning if NULL
;155:NULL will be returned if the end of the list is reached.
;156:
;157:=============
;158:*/
;159:gentity_t *G_Find (gentity_t *from, int fieldofs, const char *match)
;160:{
line 163
;161:	char	*s;
;162:
;163:	if (!from)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $118
line 164
;164:		from = g_entities;
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $123
JUMPV
LABELV $118
line 166
;165:	else
;166:		from++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
line 168
;167:
;168:	for ( ; from < &g_entities[level.num_entities] ; from++)
ADDRGP4 $123
JUMPV
LABELV $120
line 169
;169:	{
line 170
;170:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $125
line 171
;171:			continue;
ADDRGP4 $121
JUMPV
LABELV $125
line 172
;172:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 173
;173:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
line 174
;174:			continue;
ADDRGP4 $121
JUMPV
LABELV $127
line 175
;175:		if (!Q_stricmp (s, match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $129
line 176
;176:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $117
JUMPV
LABELV $129
line 177
;177:	}
LABELV $121
line 168
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $123
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2492
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $120
line 179
;178:
;179:	return NULL;
CNSTP4 0
RETP4
LABELV $117
endproc G_Find 8 8
export G_ScrFind
proc G_ScrFind 44 8
line 184
;180:}
;181:
;182:
;183:gentity_t *G_ScrFind (gentity_t *from, int fieldofs, const char *match, const char *symbol )
;184:{
line 187
;185:	char	*s;
;186:
;187:	if (!from)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $132
line 188
;188:		from = g_entities;
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $133
JUMPV
LABELV $132
line 190
;189:	else
;190:		from++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $133
line 192
;191:
;192:if (!Q_stricmp (symbol, "=")){
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $134
line 193
;193:	for ( ; from < &g_entities[level.num_entities] ; from++)
ADDRGP4 $140
JUMPV
LABELV $137
line 194
;194:	{
line 195
;195:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $142
line 196
;196:			continue;
ADDRGP4 $138
JUMPV
LABELV $142
line 197
;197:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 198
;198:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $144
line 199
;199:			continue;
ADDRGP4 $138
JUMPV
LABELV $144
line 200
;200:		if (!Q_stricmp (s, match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $146
line 201
;201:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $131
JUMPV
LABELV $146
line 202
;202:	}
LABELV $138
line 193
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $140
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2492
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $137
line 203
;203:}
LABELV $134
line 205
;204:
;205:if (!Q_stricmp (symbol, "==")){
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $150
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $148
line 206
;206:	for ( ; from < &g_entities[level.num_entities] ; from++)
ADDRGP4 $154
JUMPV
LABELV $151
line 207
;207:	{
line 208
;208:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $156
line 209
;209:			continue;
ADDRGP4 $152
JUMPV
LABELV $156
line 210
;210:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 211
;211:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $158
line 212
;212:			continue;
ADDRGP4 $152
JUMPV
LABELV $158
line 213
;213:		if (atof(s) == atof(match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
NEF4 $160
line 214
;214:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $131
JUMPV
LABELV $160
line 215
;215:	}
LABELV $152
line 206
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $154
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2492
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $151
line 216
;216:}
LABELV $148
line 218
;217:
;218:if (!Q_stricmp (symbol, "!=")){
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $162
line 219
;219:	for ( ; from < &g_entities[level.num_entities] ; from++)
ADDRGP4 $168
JUMPV
LABELV $165
line 220
;220:	{
line 221
;221:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $170
line 222
;222:			continue;
ADDRGP4 $166
JUMPV
LABELV $170
line 223
;223:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 224
;224:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $172
line 225
;225:			continue;
ADDRGP4 $166
JUMPV
LABELV $172
line 226
;226:		if (Q_stricmp (s, match) != 0)
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $174
line 227
;227:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $131
JUMPV
LABELV $174
line 228
;228:	}
LABELV $166
line 219
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $168
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2492
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $165
line 229
;229:}
LABELV $162
line 231
;230:
;231:if (!Q_stricmp (symbol, "!==")){
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $178
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $176
line 232
;232:	for ( ; from < &g_entities[level.num_entities] ; from++)
ADDRGP4 $182
JUMPV
LABELV $179
line 233
;233:	{
line 234
;234:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $184
line 235
;235:			continue;
ADDRGP4 $180
JUMPV
LABELV $184
line 236
;236:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 237
;237:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $186
line 238
;238:			continue;
ADDRGP4 $180
JUMPV
LABELV $186
line 239
;239:		if (atof(s) != atof(match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
EQF4 $188
line 240
;240:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $131
JUMPV
LABELV $188
line 241
;241:	}
LABELV $180
line 232
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $182
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2492
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $179
line 242
;242:}
LABELV $176
line 244
;243:
;244:if (!Q_stricmp (symbol, "<")){
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $192
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $190
line 245
;245:	for ( ; from < &g_entities[level.num_entities] ; from++)
ADDRGP4 $196
JUMPV
LABELV $193
line 246
;246:	{
line 247
;247:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $198
line 248
;248:			continue;
ADDRGP4 $194
JUMPV
LABELV $198
line 249
;249:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 250
;250:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $200
line 251
;251:			continue;
ADDRGP4 $194
JUMPV
LABELV $200
line 252
;252:		if (atof(s) < atof(match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRLP4 28
INDIRF4
GEF4 $202
line 253
;253:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $131
JUMPV
LABELV $202
line 254
;254:	}
LABELV $194
line 245
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $196
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2492
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $193
line 255
;255:}
LABELV $190
line 257
;256:
;257:if (!Q_stricmp (symbol, ">")){
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $204
line 258
;258:	for ( ; from < &g_entities[level.num_entities] ; from++)
ADDRGP4 $210
JUMPV
LABELV $207
line 259
;259:	{
line 260
;260:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $212
line 261
;261:			continue;
ADDRGP4 $208
JUMPV
LABELV $212
line 262
;262:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 263
;263:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $214
line 264
;264:			continue;
ADDRGP4 $208
JUMPV
LABELV $214
line 265
;265:		if (atof(s) > atof(match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRF4
LEF4 $216
line 266
;266:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $131
JUMPV
LABELV $216
line 267
;267:	}
LABELV $208
line 258
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $210
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2492
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $207
line 268
;268:}
LABELV $204
line 270
;269:
;270:if (!Q_stricmp (symbol, "<=")){
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $220
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $218
line 271
;271:	for ( ; from < &g_entities[level.num_entities] ; from++)
ADDRGP4 $224
JUMPV
LABELV $221
line 272
;272:	{
line 273
;273:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $226
line 274
;274:			continue;
ADDRGP4 $222
JUMPV
LABELV $226
line 275
;275:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 276
;276:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $228
line 277
;277:			continue;
ADDRGP4 $222
JUMPV
LABELV $228
line 278
;278:		if (atof(s) <= atof(match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
GTF4 $230
line 279
;279:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $131
JUMPV
LABELV $230
line 280
;280:	}
LABELV $222
line 271
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $224
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2492
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $221
line 281
;281:}
LABELV $218
line 283
;282:
;283:if (!Q_stricmp (symbol, ">=")){
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $234
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $232
line 284
;284:	for ( ; from < &g_entities[level.num_entities] ; from++)
ADDRGP4 $238
JUMPV
LABELV $235
line 285
;285:	{
line 286
;286:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $240
line 287
;287:			continue;
ADDRGP4 $236
JUMPV
LABELV $240
line 288
;288:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 289
;289:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $242
line 290
;290:			continue;
ADDRGP4 $236
JUMPV
LABELV $242
line 291
;291:		if (atof(s) >= atof(match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
LTF4 $244
line 292
;292:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $131
JUMPV
LABELV $244
line 293
;293:	}
LABELV $236
line 284
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $238
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2492
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $235
line 294
;294:}
LABELV $232
line 296
;295:
;296:	return NULL;
CNSTP4 0
RETP4
LABELV $131
endproc G_ScrFind 44 8
export G_PickTarget
proc G_PickTarget 144 12
line 310
;297:}
;298:
;299:
;300:/*
;301:=============
;302:G_PickTarget
;303:
;304:Selects a random entity from among the targets
;305:=============
;306:*/
;307:#define MAXCHOICES	32
;308:
;309:gentity_t *G_PickTarget (char *targetname)
;310:{
line 311
;311:	gentity_t	*ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 312
;312:	int		num_choices = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 315
;313:	gentity_t	*choice[MAXCHOICES];
;314:
;315:	if (!targetname)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $251
line 316
;316:	{
line 317
;317:                G_Printf("G_PickTarget called with NULL targetname\n");
ADDRGP4 $249
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 318
;318:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $246
JUMPV
LABELV $250
line 322
;319:	}
;320:
;321:	while(1)
;322:	{
line 323
;323:		ent = G_Find (ent, FOFS(targetname), targetname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 136
INDIRP4
ASGNP4
line 324
;324:		if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $253
line 325
;325:			break;
ADDRGP4 $252
JUMPV
LABELV $253
line 326
;326:		choice[num_choices++] = ent;
ADDRLP4 140
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 327
;327:		if (num_choices == MAXCHOICES)
ADDRLP4 4
INDIRI4
CNSTI4 32
NEI4 $255
line 328
;328:			break;
ADDRGP4 $252
JUMPV
LABELV $255
line 329
;329:	}
LABELV $251
line 321
ADDRGP4 $250
JUMPV
LABELV $252
line 331
;330:
;331:	if (!num_choices)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $257
line 332
;332:	{
line 333
;333:                G_Printf("G_PickTarget: target %s not found\n", targetname);
ADDRGP4 $259
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 334
;334:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $246
JUMPV
LABELV $257
line 337
;335:	}
;336:
;337:	return choice[rand() % num_choices];
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $246
endproc G_PickTarget 144 12
export G_UseTargets
proc G_UseTargets 28 12
line 352
;338:}
;339:
;340:
;341:/*
;342:==============================
;343:G_UseTargets
;344:
;345:"activator" should be set to the entity that initiated the firing.
;346:
;347:Search for (string)targetname in all entities that
;348:match (string)self.target and call their .use function
;349:
;350:==============================
;351:*/
;352:void G_UseTargets( gentity_t *ent, gentity_t *activator ) {
line 356
;353:	gentity_t		*t;
;354:	int				moneyok;
;355:	
;356:	if ( !ent ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $261
line 357
;357:		return;
ADDRGP4 $260
JUMPV
LABELV $261
line 360
;358:	}
;359:
;360:	moneyok = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 361
;361:	if ( ent->price <= 0 ) {	
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $263
line 362
;362:	moneyok = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 363
;363:	}
LABELV $263
line 364
;364:	if ( ent->price == -1 ) {	
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $265
line 365
;365:	moneyok = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 366
;366:	}
LABELV $265
line 367
;367:	if ( ent->price > 0 ) {	
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
LEI4 $267
line 368
;368:	if(activator->client->pers.oldmoney >= ent->price){
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
LTI4 $269
line 369
;369:	activator->client->pers.oldmoney -= ent->price;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
SUBI4
ASGNI4
line 370
;370:	moneyok = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 371
;371:	}
LABELV $269
line 372
;372:	}
LABELV $267
line 374
;373:
;374:	if (ent->targetShaderName && ent->targetShaderNewName) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $271
ADDRLP4 8
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $271
line 375
;375:		float f = level.time * 0.001;
ADDRLP4 16
CNSTF4 981668463
ADDRGP4 level+32
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 376
;376:		if(moneyok == 1){
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $274
line 377
;377:		AddRemap(ent->targetShaderName, ent->targetShaderNewName, f);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 AddRemap
CALLV
pop
line 378
;378:		trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
ADDRLP4 24
ADDRGP4 BuildShaderStateConfig
CALLP4
ASGNP4
CNSTI4 24
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 379
;379:		}
LABELV $274
line 380
;380:	}
LABELV $271
line 383
;381:
;382:	// use ent->target
;383:	if ( ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $276
line 386
;384:
;385:		//find all entities with matching targetname
;386:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $279
JUMPV
LABELV $278
line 387
;387:		while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 388
;388:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $281
line 389
;389:				G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $283
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 390
;390:			} else {
ADDRGP4 $282
JUMPV
LABELV $281
line 391
;391:				if ( t->use ) {
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $284
line 392
;392:					if(moneyok == 1){
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $286
line 393
;393:					t->use (t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 394
;394:					}
LABELV $286
line 395
;395:				}
LABELV $284
line 396
;396:			}
LABELV $282
line 397
;397:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $288
line 398
;398:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 399
;399:				return;
ADDRGP4 $260
JUMPV
LABELV $288
line 401
;400:			}
;401:		}
LABELV $279
line 387
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $278
line 404
;402:
;403:		//find all entities with matching targetname2
;404:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $292
JUMPV
LABELV $291
line 405
;405:		while ( (t = G_Find (t, FOFS(targetname2), ent->target)) != NULL ) {
line 406
;406:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $294
line 407
;407:				G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $283
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 408
;408:			} else {
ADDRGP4 $295
JUMPV
LABELV $294
line 409
;409:				if ( t->use ) {
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $296
line 410
;410:					if(moneyok == 1){
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $298
line 411
;411:					t->use (t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 412
;412:					}
LABELV $298
line 413
;413:				}
LABELV $296
line 414
;414:			}
LABELV $295
line 415
;415:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $300
line 416
;416:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 417
;417:				return;
ADDRGP4 $260
JUMPV
LABELV $300
line 419
;418:			}
;419:		}
LABELV $292
line 405
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $291
line 420
;420:	}
LABELV $276
line 423
;421:
;422:	// use ent->target2
;423:	if ( ent->target2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $302
line 426
;424:		
;425:		//find all entities with matching targetname
;426:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $305
JUMPV
LABELV $304
line 427
;427:		while ( (t = G_Find (t, FOFS(targetname), ent->target2)) != NULL ) {
line 428
;428:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $307
line 429
;429:				G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $283
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 430
;430:			} else {
ADDRGP4 $308
JUMPV
LABELV $307
line 431
;431:				if ( t->use ) {
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $309
line 432
;432:					if(moneyok == 1){
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $311
line 433
;433:					t->use (t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 434
;434:					}
LABELV $311
line 435
;435:				}
LABELV $309
line 436
;436:			}
LABELV $308
line 437
;437:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $313
line 438
;438:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 439
;439:				return;
ADDRGP4 $260
JUMPV
LABELV $313
line 441
;440:			}
;441:		}
LABELV $305
line 427
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $304
line 444
;442:
;443:		//find all entities with matching targetname2
;444:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $316
JUMPV
LABELV $315
line 445
;445:		while ( (t = G_Find (t, FOFS(targetname2), ent->target2)) != NULL ) {
line 446
;446:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $318
line 447
;447:				G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $283
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 448
;448:			} else {
ADDRGP4 $319
JUMPV
LABELV $318
line 449
;449:				if ( t->use ) {
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $320
line 450
;450:					if(moneyok == 1){
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $322
line 451
;451:					t->use (t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 452
;452:					}
LABELV $322
line 453
;453:				}
LABELV $320
line 454
;454:                            }
LABELV $319
line 455
;455:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $324
line 456
;456:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 457
;457:				return;
ADDRGP4 $260
JUMPV
LABELV $324
line 459
;458:			}
;459:		}
LABELV $316
line 445
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $315
line 460
;460:	}
LABELV $302
line 463
;461:	
;462:	// use ent->damagetarget
;463:	if ( ent->damagetarget ) {
ADDRFP4 0
INDIRP4
CNSTI4 2104
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $326
line 466
;464:		
;465:		//find all entities with matching targetname
;466:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $329
JUMPV
LABELV $328
line 467
;467:		while ( (t = G_Find (t, FOFS(targetname), ent->damagetarget)) != NULL ) {
line 468
;468:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $331
line 469
;469:				G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $283
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 470
;470:			} else {
ADDRGP4 $332
JUMPV
LABELV $331
line 471
;471:				if ( t->use ) {
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $333
line 472
;472:					if(moneyok == 1){
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $335
line 473
;473:					t->use (t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 474
;474:					}
LABELV $335
line 475
;475:				}
LABELV $333
line 476
;476:			}
LABELV $332
line 477
;477:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $337
line 478
;478:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 479
;479:				return;
ADDRGP4 $260
JUMPV
LABELV $337
line 481
;480:			}
;481:		}
LABELV $329
line 467
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2104
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $328
line 484
;482:
;483:		//find all entities with matching targetname2
;484:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $340
JUMPV
LABELV $339
line 485
;485:		while ( (t = G_Find (t, FOFS(targetname2), ent->damagetarget)) != NULL ) {
line 486
;486:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $342
line 487
;487:				G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $283
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 488
;488:			} else {
ADDRGP4 $343
JUMPV
LABELV $342
line 489
;489:				if ( t->use ) {
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $344
line 490
;490:					if(moneyok == 1){
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $346
line 491
;491:					t->use (t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 492
;492:					}
LABELV $346
line 493
;493:				}
LABELV $344
line 494
;494:                            }
LABELV $343
line 495
;495:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $348
line 496
;496:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 497
;497:				return;
ADDRGP4 $260
JUMPV
LABELV $348
line 499
;498:			}
;499:		}
LABELV $340
line 485
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2104
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $339
line 500
;500:	}
LABELV $326
line 501
;501:}
LABELV $260
endproc G_UseTargets 28 12
export G_UseDeathTargets
proc G_UseDeathTargets 24 12
line 516
;502:
;503:/*
;504:==============================
;505:G_UseDeathTargets
;506:
;507:"activator" is the BOT client that died.
;508:
;509:Search for (string)targetname in all entities that
;510:match (string)self.deathtarget and call their .use function.
;511:Specifically used for target_botspawn entities that have their 
;512:deathtarget key set.
;513:
;514:==============================
;515:*/
;516:void G_UseDeathTargets( gentity_t *ent, gentity_t *activator ) {
line 519
;517:	gentity_t		*t;
;518:	
;519:	if ( !ent ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $351
line 520
;520:		return;
ADDRGP4 $350
JUMPV
LABELV $351
line 523
;521:	}
;522:
;523:	if (ent->targetShaderName && ent->targetShaderNewName) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $353
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $353
line 524
;524:		float f = level.time * 0.001;
ADDRLP4 12
CNSTF4 981668463
ADDRGP4 level+32
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 525
;525:		AddRemap(ent->targetShaderName, ent->targetShaderNewName, f);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 AddRemap
CALLV
pop
line 526
;526:		trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
ADDRLP4 20
ADDRGP4 BuildShaderStateConfig
CALLP4
ASGNP4
CNSTI4 24
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 527
;527:	}
LABELV $353
line 529
;528:
;529:	if ( !ent->deathTarget ) {
ADDRFP4 0
INDIRP4
CNSTI4 2172
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $356
line 530
;530:		return;
ADDRGP4 $350
JUMPV
LABELV $356
line 534
;531:	}
;532:
;533:	//search for entities with matching targetname
;534:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $359
JUMPV
LABELV $358
line 535
;535:	while ( (t = G_Find (t, FOFS(targetname), ent->deathTarget)) != NULL ) {
line 536
;536:		if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $361
line 537
;537:			G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $283
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 538
;538:		} else {
ADDRGP4 $362
JUMPV
LABELV $361
line 539
;539:			if ( t->use ) {
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $363
line 540
;540:				t->use (t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 541
;541:			}
LABELV $363
line 542
;542:		}
LABELV $362
line 543
;543:		if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $365
line 544
;544:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 545
;545:			return;
ADDRGP4 $350
JUMPV
LABELV $365
line 547
;546:		}
;547:	}
LABELV $359
line 535
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2172
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $358
line 550
;548:
;549:	//search for entities with matching targetname2
;550:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $368
JUMPV
LABELV $367
line 551
;551:	while ( (t = G_Find (t, FOFS(targetname2), ent->deathTarget)) != NULL ) {
line 552
;552:		if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $370
line 553
;553:			G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $283
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 554
;554:		} else {
ADDRGP4 $371
JUMPV
LABELV $370
line 555
;555:			if ( t->use ) {
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $372
line 556
;556:				t->use (t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 557
;557:			}
LABELV $372
line 558
;558:			}
LABELV $371
line 559
;559:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $374
line 560
;560:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 561
;561:				return;
ADDRGP4 $350
JUMPV
LABELV $374
line 563
;562:			}
;563:		}
LABELV $368
line 551
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2172
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $367
line 564
;564:}
LABELV $350
endproc G_UseDeathTargets 24 12
export G_DropLoot
proc G_DropLoot 16 12
line 580
;565:
;566:/*
;567:==============================
;568:G_DropLoot
;569:
;570:"activator" is the BOT client that died
;571:
;572:Search for (string)targetname in all entities that
;573:match (string)self.lootTarget and spawn it.
;574:Specifically used for target_botspawn entities that have their
;575:lootTarget key set.
;576:
;577:==============================
;578:*/
;579:
;580:void G_DropLoot(gentity_t* ent, gentity_t* activator) {
line 583
;581:	gentity_t* t;
;582:
;583:	if (!ent || !activator) {
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $379
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $377
LABELV $379
line 584
;584:		return;
ADDRGP4 $376
JUMPV
LABELV $377
line 587
;585:	}
;586:
;587:	if (!ent->lootTarget) {
ADDRFP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $380
line 588
;588:		return;
ADDRGP4 $376
JUMPV
LABELV $380
line 592
;589:	}
;590:
;591:	//search for entities with matching targetname
;592:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $383
JUMPV
LABELV $382
line 593
;593:	while ((t = G_Find(t, FOFS(targetname), ent->lootTarget)) != NULL) {
line 594
;594:		if (t->s.eType != ET_ITEM) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $385
line 595
;595:			G_Printf("WARNING: Target entity is not an item\n");
ADDRGP4 $387
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 596
;596:		} else {
ADDRGP4 $386
JUMPV
LABELV $385
line 597
;597:			if (t->count > 0) {
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 0
LEI4 $388
line 598
;598:			t->item->quantity = t->count;
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 599
;599:			}
LABELV $388
line 600
;600:			Drop_Item(activator, t->item, 0);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 601
;601:		}
LABELV $386
line 602
;602:		if (!ent->inuse) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $390
line 603
;603:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 604
;604:			return;
ADDRGP4 $376
JUMPV
LABELV $390
line 606
;605:		}
;606:	}
LABELV $383
line 593
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $382
line 609
;607:
;608:	//search for entities with matching targetname2
;609:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $393
JUMPV
LABELV $392
line 610
;610:	while ((t = G_Find(t, FOFS(targetname2), ent->lootTarget)) != NULL) {
line 611
;611:		if (t->s.eType != ET_ITEM) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $395
line 612
;612:			G_Printf("WARNING: Target entity is not an item\n");
ADDRGP4 $387
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 613
;613:		} else {
ADDRGP4 $396
JUMPV
LABELV $395
line 614
;614:			t->item->quantity = t->count;
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 615
;615:			Drop_Item(activator, t->item, 0);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 616
;616:		}
LABELV $396
line 617
;617:		if (!ent->inuse) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $397
line 618
;618:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 619
;619:			return;
ADDRGP4 $376
JUMPV
LABELV $397
line 621
;620:		}
;621:	}
LABELV $393
line 610
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2176
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $392
line 622
;622:}
LABELV $376
endproc G_DropLoot 16 12
export G_SetEntityLinked
proc G_SetEntityLinked 12 8
line 629
;623:
;624:/*
;625:==============================
;626:G_SetEntityLinked
;627:==============================
;628:*/
;629:void G_SetEntityLinked( gentity_t *t, int spawnflags ) {
line 630
;630:	if ( spawnflags & 4 ) {								
ADDRFP4 4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $400
line 632
;631:		//always_unlink spawnflag is set, so unlink entity from the world
;632:		if ( strcmp(t->classname, "func_bobbing") ) {
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $404
ARGP4
ADDRLP4 0
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $402
line 633
;633:			if ( t->r.linked ) { trap_UnlinkEntity( t ); }
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $401
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 634
;634:		} else {
ADDRGP4 $401
JUMPV
LABELV $402
line 635
;635:			if ( t->s.eType == ET_MOVER ) { t->s.eType = ET_INVISIBLE; }
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $401
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 636
;636:		}
line 638
;637:		
;638:	} else if ( spawnflags & 8 ) {						
ADDRGP4 $401
JUMPV
LABELV $400
ADDRFP4 4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $409
line 640
;639:		//always_link spawnflag is set, so link entity from the world
;640:		if ( strcmp(t->classname, "func_bobbing") ) {
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $404
ARGP4
ADDRLP4 0
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $411
line 641
;641:			if ( !t->r.linked ) { trap_LinkEntity( t ); }	
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
NEI4 $410
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 642
;642:		} else {
ADDRGP4 $410
JUMPV
LABELV $411
line 643
;643:			if ( t->s.eType == ET_INVISIBLE ) { t->s.eType = ET_MOVER; }
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 10
NEI4 $410
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 644
;644:		}
line 645
;645:	} else {											
ADDRGP4 $410
JUMPV
LABELV $409
line 647
;646:		//no spawnflag is set, so toggle
;647:		if ( strcmp(t->classname, "func_bobbing") ) {
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $404
ARGP4
ADDRLP4 0
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $417
line 648
;648:			if ( t->r.linked )
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $419
line 649
;649:				trap_UnlinkEntity( t );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
ADDRGP4 $418
JUMPV
LABELV $419
line 651
;650:			else
;651:				trap_LinkEntity( t );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 652
;652:		} else {
ADDRGP4 $418
JUMPV
LABELV $417
line 653
;653:			if ( t->s.eType == ET_MOVER )
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $421
line 654
;654:				t->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
ADDRGP4 $422
JUMPV
LABELV $421
line 656
;655:			else
;656:				t->s.eType = ET_MOVER;
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $422
line 657
;657:		}
LABELV $418
line 658
;658:	}
LABELV $410
LABELV $401
line 659
;659:}
LABELV $399
endproc G_SetEntityLinked 12 8
export G_ToggleTargetsLinked
proc G_ToggleTargetsLinked 20 12
line 670
;660:
;661:/*
;662:==============================
;663:G_ToggleTargetsLinked
;664:
;665:Search for targetname(2) in all entities that
;666:match ent.target(2) and link or unlink them from the world
;667:
;668:==============================
;669:*/
;670:void G_ToggleTargetsLinked( gentity_t *ent ) {
line 673
;671:	gentity_t		*t;
;672:	
;673:	if ( !ent ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $424
line 674
;674:		return;
ADDRGP4 $423
JUMPV
LABELV $424
line 677
;675:	}
;676:
;677:	if ( !ent->target && !ent->target2 ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $426
ADDRLP4 4
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $426
line 678
;678:		return;
ADDRGP4 $423
JUMPV
LABELV $426
line 681
;679:	}
;680:
;681:	if (ent->target) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $428
line 682
;682:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $431
JUMPV
LABELV $430
line 683
;683:		while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 684
;684:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $433
line 685
;685:				G_Printf( "WARNING: Entity %s at %s targets itself.\n", ent->classname, vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 686
;686:			} else {
ADDRGP4 $434
JUMPV
LABELV $433
line 687
;687:				G_SetEntityLinked( t, ent->spawnflags );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_SetEntityLinked
CALLV
pop
line 688
;688:			}
LABELV $434
line 689
;689:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $436
line 690
;690:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 691
;691:				return;
ADDRGP4 $423
JUMPV
LABELV $436
line 693
;692:			}
;693:		}
LABELV $431
line 683
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $430
line 695
;694:
;695:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $439
JUMPV
LABELV $438
line 696
;696:		while ( (t = G_Find (t, FOFS(targetname2), ent->target)) != NULL ) {
line 697
;697:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $441
line 698
;698:				G_Printf( "WARNING: Entity %s at %s targets itself.\n", ent->classname, vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 699
;699:			} else {
ADDRGP4 $442
JUMPV
LABELV $441
line 700
;700:				G_SetEntityLinked( t, ent->spawnflags );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_SetEntityLinked
CALLV
pop
line 701
;701:			}
LABELV $442
line 702
;702:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $443
line 703
;703:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 704
;704:				return;
ADDRGP4 $423
JUMPV
LABELV $443
line 706
;705:			}
;706:		}
LABELV $439
line 696
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $438
line 707
;707:	}
LABELV $428
line 709
;708:
;709:	if (ent->target2) {
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
line 710
;710:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $448
JUMPV
LABELV $447
line 711
;711:		while ( (t = G_Find (t, FOFS(targetname), ent->target2)) != NULL ) {
line 712
;712:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $450
line 713
;713:				G_Printf( "WARNING: Entity %s at %s targets itself.\n", ent->classname, vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 714
;714:			} else {
ADDRGP4 $451
JUMPV
LABELV $450
line 715
;715:				G_SetEntityLinked( t, ent->spawnflags );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_SetEntityLinked
CALLV
pop
line 716
;716:			}
LABELV $451
line 717
;717:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $452
line 718
;718:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 719
;719:				return;
ADDRGP4 $423
JUMPV
LABELV $452
line 721
;720:			}
;721:		}
LABELV $448
line 711
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $447
line 723
;722:
;723:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $455
JUMPV
LABELV $454
line 724
;724:		while ( (t = G_Find (t, FOFS(targetname2), ent->target2)) != NULL ) {
line 725
;725:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $457
line 726
;726:				G_Printf( "WARNING: Entity %s at %s targets itself.\n", ent->classname, vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 727
;727:			} else {
ADDRGP4 $458
JUMPV
LABELV $457
line 728
;728:				G_SetEntityLinked( t, ent->spawnflags );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_SetEntityLinked
CALLV
pop
line 729
;729:			}
LABELV $458
line 730
;730:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $459
line 731
;731:				G_Printf("entity was removed while using targets\n");
ADDRGP4 $290
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 732
;732:				return;
ADDRGP4 $423
JUMPV
LABELV $459
line 734
;733:			}
;734:		}
LABELV $455
line 724
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $454
line 735
;735:	}
LABELV $445
line 736
;736:}
LABELV $423
endproc G_ToggleTargetsLinked 20 12
export G_RemoveBotsForBotspawn
proc G_RemoveBotsForBotspawn 40 20
line 747
;737:
;738:/*
;739:==============================
;740:G_RemoveBotsForBotspawn
;741:
;742:Called by G_RemoveBotsForTarget. Removes all 
;743:bots that were spawned by the specified target_botspawn
;744:
;745:==============================
;746:*/
;747:void G_RemoveBotsForBotspawn( gentity_t *self, qboolean kill, qboolean gib ) {
line 751
;748:	gentity_t *ent;
;749:	int i;
;750:	
;751:	if ( strcmp(self->classname, "target_botspawn") )
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $464
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $462
line 752
;752:		return;
ADDRGP4 $461
JUMPV
LABELV $462
line 755
;753:
;754:	//iterate through clients
;755:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $465
line 756
;756:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 757
;757:		if ( ent->client && ent->botspawn == self )
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $469
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $469
line 758
;758:		{
line 760
;759:			vec3_t dir;
;760:			dir[0] = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 761
;761:			dir[1] = 0;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 762
;762:			dir[2] = 0;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 763
;763:			if ( gib ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $473
line 764
;764:				Cmd_Kill_f( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLI4
pop
line 765
;765:			}
ADDRGP4 $474
JUMPV
LABELV $473
line 766
;766:			else if ( kill ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $475
line 767
;767:				ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 768
;768:				player_die (ent, ent, ent, ent->client->ps.stats[STAT_HEALTH], MOD_FALLING);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 player_die
CALLV
pop
line 769
;769:			}
ADDRGP4 $476
JUMPV
LABELV $475
line 771
;770:			else 
;771:				DropClientSilently( ent->client->ps.clientNum );
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 DropClientSilently
CALLV
pop
LABELV $476
LABELV $474
line 772
;772:		}
LABELV $469
line 773
;773:	}
LABELV $466
line 755
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 256
LTI4 $465
line 774
;774:}
LABELV $461
endproc G_RemoveBotsForBotspawn 40 20
export G_RemoveBotsForTarget
proc G_RemoveBotsForTarget 12 12
line 789
;775:
;776:/*
;777:==============================
;778:G_RemoveBotsForTarget
;779:
;780:Search for targetname(2) in all target_botspawn entities that
;781:match ent.target(2) and remove bots spawned by that botspawn.
;782:
;783:ent: a target_botremove entity
;784:kill: when true, bot will receive damage equal to its health, effectively killing it.
;785:gib: when true, bot will receive 999 damage, effectively gibbing it. Will overrule 'kill'.
;786:==============================
;787:*/
;788:
;789:void G_RemoveBotsForTarget( gentity_t *ent, qboolean kill, qboolean gib ) {
line 792
;790:	gentity_t		*t;
;791:	
;792:	if ( !ent ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $478
line 793
;793:		return;
ADDRGP4 $477
JUMPV
LABELV $478
line 797
;794:	}
;795:
;796:	// ent->target
;797:	if ( ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $480
line 800
;798:
;799:		//find all entities with matching targetname
;800:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $483
JUMPV
LABELV $482
line 801
;801:		while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 802
;802:			if ( !strcmp(t->classname, "target_botspawn") ) {
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $464
ARGP4
ADDRLP4 4
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $485
line 803
;803:				G_RemoveBotsForBotspawn( t, kill, gib );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_RemoveBotsForBotspawn
CALLV
pop
line 804
;804:			}
LABELV $485
line 805
;805:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $487
line 806
;806:				G_Printf("entity was removed while finding targets\n");
ADDRGP4 $489
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 807
;807:				return;
ADDRGP4 $477
JUMPV
LABELV $487
line 809
;808:			}
;809:		}
LABELV $483
line 801
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $482
line 812
;810:
;811:		//find all entities with matching targetname2
;812:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $491
JUMPV
LABELV $490
line 813
;813:		while ( (t = G_Find (t, FOFS(targetname2), ent->target)) != NULL ) {
line 814
;814:			if ( !strcmp(t->classname, "target_botspawn") ) {
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $464
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $493
line 815
;815:				G_RemoveBotsForBotspawn( t, kill, gib );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_RemoveBotsForBotspawn
CALLV
pop
line 816
;816:			}
LABELV $493
line 817
;817:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $495
line 818
;818:				G_Printf("entity was removed while finding targets\n");
ADDRGP4 $489
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 819
;819:				return;
ADDRGP4 $477
JUMPV
LABELV $495
line 821
;820:			}
;821:		}
LABELV $491
line 813
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $490
line 822
;822:	}
LABELV $480
line 825
;823:
;824:	// use ent->target2
;825:	if ( ent->target2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $497
line 828
;826:		
;827:		//find all entities with matching targetname
;828:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $500
JUMPV
LABELV $499
line 829
;829:		while ( (t = G_Find (t, FOFS(targetname), ent->target2)) != NULL ) {
line 830
;830:			if ( !strcmp(t->classname, "target_botspawn") ) {
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $464
ARGP4
ADDRLP4 4
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $502
line 831
;831:				G_RemoveBotsForBotspawn( t, kill, gib );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_RemoveBotsForBotspawn
CALLV
pop
line 832
;832:			}
LABELV $502
line 833
;833:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $504
line 834
;834:				G_Printf("entity was removed while finding targets\n");
ADDRGP4 $489
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 835
;835:				return;
ADDRGP4 $477
JUMPV
LABELV $504
line 837
;836:			}
;837:		}
LABELV $500
line 829
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $499
line 840
;838:
;839:		//find all entities with matching targetname2
;840:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $507
JUMPV
LABELV $506
line 841
;841:		while ( (t = G_Find (t, FOFS(targetname2), ent->target2)) != NULL ) {
line 842
;842:			if ( !strcmp(t->classname, "target_botspawn") ) {
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $464
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $509
line 843
;843:				G_RemoveBotsForBotspawn( t, kill, gib );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_RemoveBotsForBotspawn
CALLV
pop
line 844
;844:			}
LABELV $509
line 845
;845:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $511
line 846
;846:				G_Printf("entity was removed while finding targets\n");
ADDRGP4 $489
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 847
;847:				return;
ADDRGP4 $477
JUMPV
LABELV $511
line 849
;848:			}
;849:		}
LABELV $507
line 841
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $506
line 850
;850:	}
LABELV $497
line 851
;851:}
LABELV $477
endproc G_RemoveBotsForTarget 12 12
export G_UseTriggerFragAndDeathEntities
proc G_UseTriggerFragAndDeathEntities 8 12
line 863
;852:
;853:/*
;854:==============================
;855:G_UseTriggerDeathEntities
;856:
;857:"died" should be set to the entity that died.
;858:"attacker" is the entity that is responsible for the death.
;859:
;860:Search for all trigger_death entities and fire them
;861:==============================
;862:*/
;863:void G_UseTriggerFragAndDeathEntities ( gentity_t *died, gentity_t *attacker ) {
line 867
;864:	gentity_t		*t;
;865:
;866:	//fire trigger_frag entities if the attacker was a human player
;867:	if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $514
line 868
;868:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $517
JUMPV
LABELV $516
line 869
;869:		while ( ( t = G_Find( t, FOFS(classname), "trigger_frag" ) ) != NULL ) {
line 870
;870:			if ( t->use )
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $520
line 871
;871:				t->use( t, died, attacker );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
LABELV $520
line 872
;872:		}
LABELV $517
line 869
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $519
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $516
line 873
;873:	}
LABELV $514
line 876
;874:
;875:	//fire trigger_death entities
;876:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $523
JUMPV
LABELV $522
line 877
;877:	while ( ( t = G_Find( t, FOFS(classname), "trigger_death" ) ) != NULL ) {
line 878
;878:		if ( t->use )
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $526
line 879
;879:			t->use( t, attacker, died );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
LABELV $526
line 880
;880:	}
LABELV $523
line 877
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $525
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $522
line 881
;881:}
LABELV $513
endproc G_UseTriggerFragAndDeathEntities 8 12
bss
align 4
LABELV $529
skip 4
align 4
LABELV $530
skip 96
export tv
code
proc tv 8 0
line 891
;882:
;883:/*
;884:=============
;885:TempVector
;886:
;887:This is just a convenience function
;888:for making temporary vectors for function calls
;889:=============
;890:*/
;891:float	*tv( float x, float y, float z ) {
line 898
;892:	static	int		index;
;893:	static	vec3_t	vecs[8];
;894:	float	*v;
;895:
;896:	// use an array so that multiple tempvectors won't collide
;897:	// for a while
;898:	v = vecs[index];
ADDRLP4 0
CNSTI4 12
ADDRGP4 $529
INDIRI4
MULI4
ADDRGP4 $530
ADDP4
ASGNP4
line 899
;899:	index = (index + 1)&7;
ADDRLP4 4
ADDRGP4 $529
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
line 901
;900:
;901:	v[0] = x;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRF4
ASGNF4
line 902
;902:	v[1] = y;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 903
;903:	v[2] = z;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 905
;904:
;905:	return v;
ADDRLP4 0
INDIRP4
RETP4
LABELV $528
endproc tv 8 0
bss
align 4
LABELV $532
skip 4
align 1
LABELV $533
skip 256
export vtos
code
proc vtos 12 24
line 917
;906:}
;907:
;908:
;909:/*
;910:=============
;911:VectorToString
;912:
;913:This is just a convenience function
;914:for printing vectors
;915:=============
;916:*/
;917:char	*vtos( const vec3_t v ) {
line 923
;918:	static	int		index;
;919:	static	char	str[8][32];
;920:	char	*s;
;921:
;922:	// use an array so that multiple vtos won't collide
;923:	s = str[index];
ADDRLP4 0
ADDRGP4 $532
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 $533
ADDP4
ASGNP4
line 924
;924:	index = (index + 1)&7;
ADDRLP4 4
ADDRGP4 $532
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
line 926
;925:
;926:	Com_sprintf (s, 32, "(%i %i %i)", (int)v[0], (int)v[1], (int)v[2]);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $534
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 928
;927:
;928:	return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $531
endproc vtos 12 24
data
align 4
LABELV $536
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV $537
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $538
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV $539
byte 4 0
byte 4 0
byte 4 3212836864
export G_SetMovedir
code
proc G_SetMovedir 16 16
line 942
;929:}
;930:
;931:
;932:/*
;933:===============
;934:G_SetMovedir
;935:
;936:The editor only specifies a single value for angles (yaw),
;937:but we have special constants to generate an up or down direction.
;938:Angles will be cleared, because it is being used to represent a direction
;939:instead of an orientation.
;940:===============
;941:*/
;942:void G_SetMovedir( vec3_t angles, vec3_t movedir ) {
line 948
;943:	static vec3_t VEC_UP		= {0, -1, 0};
;944:	static vec3_t MOVEDIR_UP	= {0, 0, 1};
;945:	static vec3_t VEC_DOWN		= {0, -2, 0};
;946:	static vec3_t MOVEDIR_DOWN	= {0, 0, -1};
;947:
;948:	if ( VectorCompare (angles, VEC_UP) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $536
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $540
line 949
;949:		VectorCopy (MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 $537
INDIRB
ASGNB 12
line 950
;950:	} else if ( VectorCompare (angles, VEC_DOWN) ) {
ADDRGP4 $541
JUMPV
LABELV $540
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $542
line 951
;951:		VectorCopy (MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 $539
INDIRB
ASGNB 12
line 952
;952:	} else {
ADDRGP4 $543
JUMPV
LABELV $542
line 953
;953:		AngleVectors (angles, movedir, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 954
;954:	}
LABELV $543
LABELV $541
line 955
;955:	VectorClear( angles );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 956
;956:}
LABELV $535
endproc G_SetMovedir 16 16
export G_InitGentity
proc G_InitGentity 4 0
line 958
;957:
;958:void G_InitGentity( gentity_t *e ) {
line 959
;959:	e->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 960
;960:	e->classname = "noclass";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $545
ASGNP4
line 961
;961:	e->s.number = e - g_entities;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ASGNI4
line 962
;962:	e->r.ownerNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 4095
ASGNI4
line 963
;963:}
LABELV $544
endproc G_InitGentity 4 0
export G_Spawn
proc G_Spawn 16 20
line 980
;964:
;965:/*
;966:=================
;967:G_Spawn
;968:
;969:Either finds a free entity, or allocates a new one.
;970:
;971:  The slots from 0 to MAX_CLIENTS-1 are always reserved for clients, and will
;972:never be used by anything else.
;973:
;974:Try to avoid reusing an entity that was recently freed, because it
;975:can cause the client to think the entity morphed into something else
;976:instead of being removed and recreated, which can cause interpolated
;977:angles and bad trails.
;978:=================
;979:*/
;980:gentity_t *G_Spawn( void ) {
line 984
;981:	int			i, force;
;982:	gentity_t	*e;
;983:
;984:	e = NULL;	// shut up warning
ADDRLP4 0
CNSTP4 0
ASGNP4
line 985
;985:	i = 0;		// shut up warning
ADDRLP4 4
CNSTI4 0
ASGNI4
line 986
;986:	for ( force = 0 ; force < 2 ; force++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $547
line 989
;987:		// if we go through all entities and can't find one to free,
;988:		// override the normal minimum times before use
;989:		e = &g_entities[MAX_CLIENTS];
ADDRLP4 0
ADDRGP4 g_entities+637952
ASGNP4
line 990
;990:		for ( i = MAX_CLIENTS ; i<level.num_entities ; i++, e++) {
ADDRLP4 4
CNSTI4 256
ASGNI4
ADDRGP4 $555
JUMPV
LABELV $552
line 991
;991:			if ( e->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $557
line 992
;992:				continue;
ADDRGP4 $553
JUMPV
LABELV $557
line 997
;993:			}
;994:
;995:			// the first couple seconds of server time can involve a lot of
;996:			// freeing and allocating, so relax the replacement policy
;997:			if ( !force && e->freetime > level.startTime + 2000 && level.time - e->freetime < 1000 ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $559
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 level+40
INDIRI4
CNSTI4 2000
ADDI4
LEI4 $559
ADDRGP4 level+32
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $559
line 998
;998:				continue;
ADDRGP4 $553
JUMPV
LABELV $559
line 1002
;999:			}
;1000:
;1001:			// reuse this slot
;1002:			G_InitGentity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1003
;1003:			return e;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $546
JUMPV
LABELV $553
line 990
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $555
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $552
line 1005
;1004:		}
;1005:		if ( i != g_maxEntities.integer-1 ) {
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxEntities+12
INDIRI4
CNSTI4 1
SUBI4
EQI4 $563
line 1006
;1006:			break;
ADDRGP4 $549
JUMPV
LABELV $563
line 1008
;1007:		}
;1008:	}
LABELV $548
line 986
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $547
LABELV $549
line 1009
;1009:	if ( i >= g_maxEntities.integer-1 ) {
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxEntities+12
INDIRI4
CNSTI4 1
SUBI4
LTI4 $566
line 1010
;1010:		G_Printf( "G_Spawn: no free entities. Check g_maxEntities cvar\n");
ADDRGP4 $569
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1011
;1011:		G_FreeEntity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1012
;1012:		return e;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $546
JUMPV
LABELV $566
line 1016
;1013:	}
;1014:
;1015:	// open up a new slot
;1016:	level.num_entities++;
ADDRLP4 12
ADDRGP4 level+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1019
;1017:
;1018:	// let the server system know that there are more entities
;1019:	trap_LocateGameData( level.gentities, level.num_entities, sizeof( gentity_t ),
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 2492
ARGI4
ADDRGP4 level
INDIRP4
ARGP4
CNSTI4 2324
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
line 1022
;1020:		&level.clients[0].ps, sizeof( level.clients[0] ) );
;1021:
;1022:	G_InitGentity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1023
;1023:	return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $546
endproc G_Spawn 16 20
export G_EntitiesFree
proc G_EntitiesFree 8 0
line 1031
;1024:}
;1025:
;1026:/*
;1027:=================
;1028:G_EntitiesFree
;1029:=================
;1030:*/
;1031:qboolean G_EntitiesFree( void ) {
line 1035
;1032:	int			i;
;1033:	gentity_t	*e;
;1034:
;1035:	e = &g_entities[MAX_CLIENTS];
ADDRLP4 4
ADDRGP4 g_entities+637952
ASGNP4
line 1036
;1036:	for ( i = MAX_CLIENTS; i < level.num_entities; i++, e++) {
ADDRLP4 0
CNSTI4 256
ASGNI4
ADDRGP4 $578
JUMPV
LABELV $575
line 1037
;1037:		if ( e->inuse ) {
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $580
line 1038
;1038:			continue;
ADDRGP4 $576
JUMPV
LABELV $580
line 1041
;1039:		}
;1040:		// slot available
;1041:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $573
JUMPV
LABELV $576
line 1036
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $578
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $575
line 1043
;1042:	}
;1043:	return qfalse;
CNSTI4 0
RETI4
LABELV $573
endproc G_EntitiesFree 8 0
export G_FreeEntity
proc G_FreeEntity 8 12
line 1054
;1044:}
;1045:
;1046:
;1047:/*
;1048:=================
;1049:G_FreeEntity
;1050:
;1051:Marks the entity as free
;1052:=================
;1053:*/
;1054:void G_FreeEntity( gentity_t *ed ) {
line 1055
;1055:	trap_UnlinkEntity (ed);		// unlink from world
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1057
;1056:
;1057:	if ( ed->neverFree ) {
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
CNSTI4 0
EQI4 $583
line 1058
;1058:		return;
ADDRGP4 $582
JUMPV
LABELV $583
line 1060
;1059:	}
;1060:	if ( ed->vehicle && ed->parent && ed->parent->client->vehiclenum == ed->s.number){
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
CNSTI4 0
EQI4 $585
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $585
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $585
line 1061
;1061:		ed->parent->client->vehiclenum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 1062
;1062:		ClientUserinfoChanged( ed->parent->s.clientNum );
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1063
;1063:		VectorSet( ed->parent->r.mins, -15, -15, -24 );
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3250585600
ASGNF4
line 1064
;1064:		VectorSet( ed->parent->r.maxs, 15, 15, 32 );
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1107296256
ASGNF4
line 1065
;1065:		ed->parent->client->ps.gravity = (g_gravity.value*g_gravityModifier.value);
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
ADDRGP4 g_gravityModifier+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1066
;1066:	}
LABELV $585
line 1068
;1067:
;1068:	memset (ed, 0, sizeof(*ed));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2492
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1069
;1069:	ed->classname = "freed";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $589
ASGNP4
line 1070
;1070:	ed->freetime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1071
;1071:	ed->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 1072
;1072:}
LABELV $582
endproc G_FreeEntity 8 12
export G_TempEntity
proc G_TempEntity 20 8
line 1083
;1073:
;1074:/*
;1075:=================
;1076:G_TempEntity
;1077:
;1078:Spawns an event entity that will be auto-removed
;1079:The origin will be snapped to save net bandwidth, so care
;1080:must be taken if the origin is right on a surface (snap towards start vector first)
;1081:=================
;1082:*/
;1083:gentity_t *G_TempEntity( vec3_t origin, int event ) {
line 1087
;1084:	gentity_t		*e;
;1085:	vec3_t		snapped;
;1086:
;1087:	e = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1088
;1088:	e->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 1090
;1089:
;1090:	e->classname = "tempEntity";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $592
ASGNP4
line 1091
;1091:	e->eventTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 592
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1092
;1092:	e->freeAfterEvent = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 1
ASGNI4
line 1094
;1093:
;1094:	VectorCopy( origin, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1095
;1095:	SnapVector( snapped );		// save network bandwidth
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1096
;1096:	G_SetOrigin( e, snapped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1099
;1097:
;1098:	// find cluster for PVS
;1099:	trap_LinkEntity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1101
;1100:
;1101:	return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $591
endproc G_TempEntity 20 8
export G_KillBox
proc G_KillBox 72 32
line 1122
;1102:}
;1103:
;1104:
;1105:
;1106:/*
;1107:==============================================================================
;1108:
;1109:Kill box
;1110:
;1111:==============================================================================
;1112:*/
;1113:
;1114:/*
;1115:=================
;1116:G_KillBox
;1117:
;1118:Kills all entities that would touch the proposed new positioning
;1119:of ent.  Ent should be unlinked before calling this!
;1120:=================
;1121:*/
;1122:void G_KillBox (gentity_t *ent) {
line 1127
;1123:	int			i, num;
;1124:	gentity_t	*hit;
;1125:	vec3_t		mins, maxs;
;1126:
;1127:	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 556
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 44
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1128
;1128:	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 556
ADDP4
ASGNP4
ADDRLP4 24
ADDRLP4 52
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 52
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24+8
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1129
;1129:	num = trap_EntitiesInBox( mins, maxs, MiTechEntityList, MAX_GENTITIES );
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 MiTechEntityList
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 60
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 60
INDIRI4
ASGNI4
line 1131
;1130:
;1131:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $606
JUMPV
LABELV $603
line 1132
;1132:		hit = &g_entities[MiTechEntityList[i]];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 MiTechEntityList
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1133
;1133:		if ( !hit->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $607
line 1134
;1134:			continue;
ADDRGP4 $604
JUMPV
LABELV $607
line 1138
;1135:		}
;1136:
;1137:		// nail it
;1138:		G_Damage ( hit, ent, ent, NULL, NULL,
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
CNSTP4 0
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 23
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1140
;1139:			100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
;1140:	}
LABELV $604
line 1131
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $606
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $603
line 1142
;1141:
;1142:}
LABELV $598
endproc G_KillBox 72 32
export G_AddPredictableEvent
proc G_AddPredictableEvent 0 12
line 1155
;1143:
;1144://==============================================================================
;1145:
;1146:/*
;1147:===============
;1148:G_AddPredictableEvent
;1149:
;1150:Use for non-pmove events that would also be predicted on the
;1151:client side: jumppads and item pickups
;1152:Adds an event+parm and twiddles the event counter
;1153:===============
;1154:*/
;1155:void G_AddPredictableEvent( gentity_t *ent, int event, int eventParm ) {
line 1156
;1156:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $610
line 1157
;1157:		return;
ADDRGP4 $609
JUMPV
LABELV $610
line 1159
;1158:	}
;1159:	BG_AddPredictableEventToPlayerstate( event, eventParm, &ent->client->ps );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 1160
;1160:}
LABELV $609
endproc G_AddPredictableEvent 0 12
export G_AddEvent
proc G_AddEvent 4 8
line 1170
;1161:
;1162:
;1163:/*
;1164:===============
;1165:G_AddEvent
;1166:
;1167:Adds an event+parm and twiddles the event counter
;1168:===============
;1169:*/
;1170:void G_AddEvent( gentity_t *ent, int event, int eventParm ) {
line 1173
;1171:	int		bits;
;1172:
;1173:	if ( !event ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $613
line 1174
;1174:                G_Printf( "G_AddEvent: zero event added for entity %i\n", ent->s.number );
ADDRGP4 $615
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 1175
;1175:		return;
ADDRGP4 $612
JUMPV
LABELV $613
line 1179
;1176:	}
;1177:
;1178:	// clients need to add the event in playerState_t instead of entityState_t
;1179:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $616
line 1180
;1180:		bits = ent->client->ps.externalEvent & EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 768
BANDI4
ASGNI4
line 1181
;1181:		bits = ( bits + EV_EVENT_BIT1 ) & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
CNSTI4 768
BANDI4
ASGNI4
line 1182
;1182:		ent->client->ps.externalEvent = event | bits;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 128
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 1183
;1183:		ent->client->ps.externalEventParm = eventParm;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1184
;1184:		ent->client->ps.externalEventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 136
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1185
;1185:	} else {
ADDRGP4 $617
JUMPV
LABELV $616
line 1186
;1186:		bits = ent->s.event & EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 768
BANDI4
ASGNI4
line 1187
;1187:		bits = ( bits + EV_EVENT_BIT1 ) & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
CNSTI4 768
BANDI4
ASGNI4
line 1188
;1188:		ent->s.event = event | bits;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 1189
;1189:		ent->s.eventParm = eventParm;
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1190
;1190:	}
LABELV $617
line 1191
;1191:	ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1192
;1192:}
LABELV $612
endproc G_AddEvent 4 8
export G_Sound
proc G_Sound 8 8
line 1200
;1193:
;1194:
;1195:/*
;1196:=============
;1197:G_Sound
;1198:=============
;1199:*/
;1200:void G_Sound( gentity_t *ent, int channel, int soundIndex ) {
line 1203
;1201:	gentity_t	*te;
;1202:
;1203:	te = G_TempEntity( ent->r.currentOrigin, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1204
;1204:	te->s.eventParm = soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1205
;1205:}
LABELV $620
endproc G_Sound 8 8
export G_GlobalSound
proc G_GlobalSound 16 8
line 1214
;1206:
;1207:/*
;1208:=============
;1209:G_GlobalSound
;1210:KK-OAX G_SoundIndex must first be called.
;1211:=============
;1212:*/
;1213:void G_GlobalSound( int soundIndex )
;1214:{
line 1218
;1215:    gentity_t  *te;
;1216:    //Let's avoid the S_FindName error if soundIndex is 0.
;1217:    //Sago: And let's check that the sound index is within the allowed range.
;1218:	if( ( soundIndex <= 0 ) ||  soundIndex >= MAX_SOUNDS ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $624
ADDRLP4 4
INDIRI4
CNSTI4 4096
LTI4 $622
LABELV $624
line 1223
;1219:	    //Display this message when debugging
;1220:	    #ifdef DEBUG
;1221:            G_Printf( "GlobalSound: Error, no soundIndex specified. Check your code!\n" );
;1222:	    #endif
;1223:	    return;
ADDRGP4 $621
JUMPV
LABELV $622
line 1226
;1224:	}
;1225:	//Spawn a Temporary Entity at the origin point for Intermission with the event EV_GLOBAL_SOUND
;1226:	te = G_TempEntity( level.intermission_origin, EV_GLOBAL_SOUND );
ADDRGP4 level+9928
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1228
;1227:	//Add the soundIndex to the parameters for the EV_GLOBAL_SOUND event we are calling
;1228:	te->s.eventParm = soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1230
;1229:	//Broadcast the sound event.
;1230:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1231
;1231:}
LABELV $621
endproc G_GlobalSound 16 8
export G_SetOrigin
proc G_SetOrigin 8 0
line 1243
;1232:
;1233://==============================================================================
;1234:
;1235:
;1236:/*
;1237:================
;1238:G_SetOrigin
;1239:
;1240:Sets the pos trajectory for a fixed position
;1241:================
;1242:*/
;1243:void G_SetOrigin( gentity_t *ent, vec3_t origin ) {
line 1244
;1244:	VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1245
;1245:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1246
;1246:	ent->s.pos.trTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1247
;1247:	ent->s.pos.trDuration = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 1248
;1248:	VectorClear( ent->s.pos.trDelta );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1250
;1249:
;1250:	VectorCopy( origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1251
;1251:}
LABELV $626
endproc G_SetOrigin 8 0
export G_SetTarget
proc G_SetTarget 0 0
line 1260
;1252:
;1253:/*
;1254:================
;1255:G_SetTarget
;1256:
;1257:Sets the target for a selected entity
;1258:================
;1259:*/
;1260:void G_SetTarget( gentity_t *ent, char *targ ) {
line 1261
;1261:	ent->target = targ;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1262
;1262:}
LABELV $627
endproc G_SetTarget 0 0
export G_SetTargetname
proc G_SetTargetname 0 0
line 1271
;1263:
;1264:/*
;1265:================
;1266:G_SetTargetName
;1267:
;1268:Sets the targetname for a selected entity
;1269:================
;1270:*/
;1271:void G_SetTargetname( gentity_t *ent, char *targname ) {
line 1272
;1272:	ent->targetname = targname;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1273
;1273:}
LABELV $628
endproc G_SetTargetname 0 0
export findradius
proc findradius 28 4
line 1280
;1274:
;1275:/*
;1276:================
;1277:findradius
;1278:================
;1279:*/
;1280:gentity_t *findradius (gentity_t *ent, vec3_t org, float rad) {
line 1285
;1281:
;1282:	vec3_t eorg;
;1283:	int j;
;1284:
;1285:	if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $630
line 1286
;1286:		ent = g_entities;
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $635
JUMPV
LABELV $630
line 1288
;1287:	else
;1288:		ent++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
line 1290
;1289:
;1290:	for (; ent < &g_entities[level.num_entities]; ent++)
ADDRGP4 $635
JUMPV
LABELV $632
line 1291
;1291:		{
line 1292
;1292:		if (!ent->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $637
line 1293
;1293:			continue;
ADDRGP4 $633
JUMPV
LABELV $637
line 1295
;1294:
;1295:		for (j=0; j<3; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $639
line 1296
;1296:			eorg[j] = org[j] - (ent->r.currentOrigin[j] +
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 528
ADDP4
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 488
ADDP4
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
SUBF4
ASGNF4
LABELV $640
line 1295
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $639
line 1298
;1297:			(ent->r.mins[j] + ent->r.maxs[j])*0.5);
;1298:		if (VectorLength(eorg) > rad)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $643
line 1299
;1299:			continue;
ADDRGP4 $633
JUMPV
LABELV $643
line 1300
;1300:		return ent;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $629
JUMPV
LABELV $633
line 1290
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $635
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2492
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $632
line 1302
;1301:	}
;1302:	return NULL;
CNSTP4 0
RETP4
LABELV $629
endproc findradius 28 4
lit
align 4
LABELV $646
byte 4 0
byte 4 0
byte 4 1065353216
export DebugLine
code
proc DebugLine 116 12
line 1313
;1303:}
;1304:
;1305:/*
;1306:================
;1307:DebugLine
;1308:
;1309:  debug polygons only work when running a local game
;1310:  with r_debugSurface set to 2
;1311:================
;1312:*/
;1313:int DebugLine(vec3_t start, vec3_t end, int color) {
line 1314
;1314:	vec3_t points[4], dir, cross, up = {0, 0, 1};
ADDRLP4 72
ADDRGP4 $646
INDIRB
ASGNB 12
line 1317
;1315:	float dot;
;1316:
;1317:	VectorCopy(start, points[0]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1318
;1318:	VectorCopy(start, points[1]);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1320
;1319:	//points[1][2] -= 2;
;1320:	VectorCopy(end, points[2]);
ADDRLP4 0+24
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1322
;1321:	//points[2][2] -= 2;
;1322:	VectorCopy(end, points[3]);
ADDRLP4 0+36
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1325
;1323:
;1324:
;1325:	VectorSubtract(end, start, dir);
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96
CNSTI4 4
ASGNI4
ADDRLP4 60+4
ADDRLP4 88
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
CNSTI4 8
ASGNI4
ADDRLP4 60+8
ADDRFP4 4
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1326
;1326:	VectorNormalize(dir);
ADDRLP4 60
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1327
;1327:	dot = DotProduct(dir, up);
ADDRLP4 84
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
MULF4
ADDF4
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1328
;1328:	if (dot > 0.99 || dot < -0.99) VectorSet(cross, 1, 0, 0);
ADDRLP4 84
INDIRF4
CNSTF4 1065185444
GTF4 $658
ADDRLP4 84
INDIRF4
CNSTF4 3212669092
GEF4 $656
LABELV $658
ADDRLP4 48
CNSTF4 1065353216
ASGNF4
ADDRLP4 48+4
CNSTF4 0
ASGNF4
ADDRLP4 48+8
CNSTF4 0
ASGNF4
ADDRGP4 $657
JUMPV
LABELV $656
line 1329
;1329:	else CrossProduct(dir, up, cross);
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
LABELV $657
line 1331
;1330:
;1331:	VectorNormalize(cross);
ADDRLP4 48
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1333
;1332:
;1333:	VectorMA(points[0], 2, cross, points[0]);
ADDRLP4 108
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1334
;1334:	VectorMA(points[1], -2, cross, points[1]);
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
CNSTF4 3221225472
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1335
;1335:	VectorMA(points[2], -2, cross, points[2]);
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 3221225472
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1336
;1336:	VectorMA(points[3], 2, cross, points[3]);
ADDRLP4 0+36
ADDRLP4 0+36
INDIRF4
CNSTF4 1073741824
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36+4
ADDRLP4 0+36+4
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36+8
ADDRLP4 0+36+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1338
;1337:
;1338:	return trap_DebugPolygonCreate(color, 4, points);
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 112
ADDRGP4 trap_DebugPolygonCreate
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
RETI4
LABELV $645
endproc DebugLine 116 12
export IsBot
proc IsBot 0 0
line 1346
;1339:}
;1340:
;1341:/*
;1342:==================
;1343:IsBot
;1344:==================
;1345:*/
;1346:qboolean IsBot( gentity_t *self ) {
line 1348
;1347:	//return qtrue if client is a bot
;1348:	return (self->r.svFlags & SVF_BOT);
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
RETI4
LABELV $703
endproc IsBot 0 0
export IsSingleBot
proc IsSingleBot 4 0
line 1356
;1349:}
;1350:
;1351:/*
;1352:==================
;1353:IsSingleBot
;1354:==================
;1355:*/
;1356:qboolean IsSingleBot( gentity_t *self, int num ) {
line 1358
;1357:	//return qtrue if client is a bot
;1358:	return (self->singlebot == num);
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $706
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $707
JUMPV
LABELV $706
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $707
ADDRLP4 0
INDIRI4
RETI4
LABELV $704
endproc IsSingleBot 4 0
export IsClientBot
proc IsClientBot 16 4
line 1361
;1359:}
;1360:
;1361:qboolean IsClientBot( gclient_t *client ) {
line 1365
;1362:	gentity_t *ent;
;1363:	int i;
;1364:
;1365:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $709
line 1366
;1366:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1367
;1367:		if ( ent->client->ps.clientNum == client->ps.clientNum )
ADDRLP4 8
CNSTI4 140
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
NEI4 $713
line 1368
;1368:			return IsBot( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 IsBot
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $708
JUMPV
LABELV $713
line 1369
;1369:	}
LABELV $710
line 1365
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $709
line 1371
;1370:
;1371:	return qfalse;
CNSTI4 0
RETI4
LABELV $708
endproc IsClientBot 16 4
export PickDebrisType
proc PickDebrisType 0 0
line 1380
;1372:}
;1373:
;1374:/*
;1375:==================
;1376:PickDebrisType
;1377:returns a type of debris based on the passed spawnflags value
;1378:==================
;1379:*/
;1380:int PickDebrisType( int spawnflags ) {
line 1382
;1381:
;1382:	if ( spawnflags & SF_DEBRIS_LIGHT )
ADDRFP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $716
line 1383
;1383:		return EV_EMIT_DEBRIS_LIGHT;
CNSTI4 84
RETI4
ADDRGP4 $715
JUMPV
LABELV $716
line 1385
;1384:	
;1385:	if ( spawnflags & SF_DEBRIS_DARK )
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $718
line 1386
;1386:		return EV_EMIT_DEBRIS_DARK;
CNSTI4 85
RETI4
ADDRGP4 $715
JUMPV
LABELV $718
line 1388
;1387:	
;1388:	if ( spawnflags & SF_DEBRIS_LIGHT_LARGE )
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $720
line 1389
;1389:		return EV_EMIT_DEBRIS_LIGHT_LARGE;
CNSTI4 86
RETI4
ADDRGP4 $715
JUMPV
LABELV $720
line 1391
;1390:
;1391:	if ( spawnflags & SF_DEBRIS_DARK_LARGE )
ADDRFP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $722
line 1392
;1392:		return EV_EMIT_DEBRIS_DARK_LARGE;
CNSTI4 87
RETI4
ADDRGP4 $715
JUMPV
LABELV $722
line 1394
;1393:	
;1394:	if ( spawnflags & SF_DEBRIS_WOOD )
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $724
line 1395
;1395:		return EV_EMIT_DEBRIS_WOOD;
CNSTI4 88
RETI4
ADDRGP4 $715
JUMPV
LABELV $724
line 1397
;1396:
;1397:	if ( spawnflags & SF_DEBRIS_FLESH )
ADDRFP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $726
line 1398
;1398:		return EV_EMIT_DEBRIS_FLESH;
CNSTI4 89
RETI4
ADDRGP4 $715
JUMPV
LABELV $726
line 1400
;1399:	
;1400:	if ( spawnflags & SF_DEBRIS_GLASS )
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $728
line 1401
;1401:		return EV_EMIT_DEBRIS_GLASS;
CNSTI4 90
RETI4
ADDRGP4 $715
JUMPV
LABELV $728
line 1403
;1402:		
;1403:	if ( spawnflags & SF_DEBRIS_STONE )
ADDRFP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $730
line 1404
;1404:		return EV_EMIT_DEBRIS_STONE;	
CNSTI4 91
RETI4
ADDRGP4 $715
JUMPV
LABELV $730
line 1407
;1405:
;1406:	//if no compatible spawnflags supplied, return EV_EMIT_DEBRIS_LIGHT
;1407:	return EV_EMIT_DEBRIS_LIGHT;
CNSTI4 84
RETI4
LABELV $715
endproc PickDebrisType 0 0
export G_IsTeamGame
proc G_IsTeamGame 0 0
line 1416
;1408:}
;1409:
;1410:/*
;1411:==================
;1412:G_IsTeamGame
;1413:returns true if we're currently in a team gametype
;1414:==================
;1415:*/
;1416:qboolean G_IsTeamGame() {
line 1417
;1417:	return qfalse;
CNSTI4 0
RETI4
LABELV $732
endproc G_IsTeamGame 0 0
export G_GetScoringMapName
proc G_GetScoringMapName 1056 8
line 1426
;1418:}
;1419:
;1420:/*
;1421:==================
;1422:G_GetScoringMapName
;1423:returns the bsp name of the map to which high scores should be written
;1424:==================
;1425:*/
;1426:char *G_GetScoringMapName() {
line 1431
;1427:	char info[1024];
;1428:	char *result;
;1429:	int i;
;1430:
;1431:	if ( strcmp( va("%s", level.scoreLevelName ), "" ) ) {
ADDRGP4 $116
ARGP4
ADDRGP4 level+10288
ARGP4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $737
ARGP4
ADDRLP4 1036
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $734
line 1432
;1432:		return level.scoreLevelName;
ADDRGP4 level+10288
RETP4
ADDRGP4 $733
JUMPV
LABELV $734
line 1435
;1433:	}
;1434:
;1435:	trap_GetServerinfo(info, sizeof(info));
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 1436
;1436:	result = Info_ValueForKey( info, "mapname" );
ADDRLP4 8
ARGP4
ADDRGP4 $739
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1040
INDIRP4
ASGNP4
line 1438
;1437:
;1438:	for (i = 0; i < strlen(result); i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $743
JUMPV
LABELV $740
line 1439
;1439:		result[i] = toupper(result[i]);
ADDRLP4 1044
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1048
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 1044
INDIRP4
ADDRLP4 1048
INDIRI4
CVII1 4
ASGNI1
LABELV $741
line 1438
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $743
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1052
INDIRI4
LTI4 $740
line 1441
;1440:
;1441:	return result;
ADDRLP4 4
INDIRP4
RETP4
LABELV $733
endproc G_GetScoringMapName 1056 8
export randomiseitem
proc randomiseitem 348 12
line 1452
;1442:}
;1443:
;1444:/*
;1445:****************
;1446:G_WLK_GetLeft
;1447:****************
;1448:*/
;1449:void G_WLK_GetLeft(const char *pszSource, char *pszDest,  int iLen);
;1450:
;1451:void randomiseitem(gentity_t *ent)
;1452:{
line 1458
;1453:	char szClassRoot[80];
;1454:	char szClassRoot2[80];
;1455:	char szClassRoot3[80];
;1456:	char szClassRoot4[80];
;1457:
;1458:	G_WLK_GetLeft(ent->classname, szClassRoot, 7);
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 G_WLK_GetLeft
CALLV
pop
line 1459
;1459:	G_WLK_GetLeft(ent->classname, szClassRoot2, 5);
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_WLK_GetLeft
CALLV
pop
line 1460
;1460:	G_WLK_GetLeft(ent->classname, szClassRoot3, 5);
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 160
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_WLK_GetLeft
CALLV
pop
line 1461
;1461:	G_WLK_GetLeft(ent->classname, szClassRoot4, 9);
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 240
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 G_WLK_GetLeft
CALLV
pop
line 1464
;1462:
;1463:
;1464:	if(!Q_stricmp(szClassRoot, "weapon_")||
ADDRLP4 0
ARGP4
ADDRGP4 $747
ARGP4
ADDRLP4 320
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $753
ADDRLP4 80
ARGP4
ADDRGP4 $748
ARGP4
ADDRLP4 324
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $753
ADDRLP4 160
ARGP4
ADDRGP4 $749
ARGP4
ADDRLP4 328
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $753
ADDRLP4 240
ARGP4
ADDRGP4 $750
ARGP4
ADDRLP4 332
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 332
INDIRI4
CNSTI4 0
NEI4 $744
LABELV $753
line 1467
;1465:		!Q_stricmp(szClassRoot2, "ammo_")||
;1466:		!Q_stricmp(szClassRoot3, "item_")||
;1467:		!Q_stricmp(szClassRoot4, "holdable_"));
line 1468
;1468:	else return;
LABELV $746
line 1470
;1469:
;1470:switch(rq3_random(1, 56)){
CNSTI4 1
ARGI4
CNSTI4 56
ARGI4
ADDRLP4 340
ADDRGP4 rq3_random
CALLI4
ASGNI4
ADDRLP4 336
ADDRLP4 340
INDIRI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 1
LTI4 $754
ADDRLP4 336
INDIRI4
CNSTI4 56
GTI4 $754
ADDRLP4 336
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $869-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $869
address $757
address $759
address $761
address $763
address $765
address $767
address $769
address $771
address $773
address $775
address $777
address $779
address $781
address $783
address $785
address $787
address $789
address $791
address $793
address $795
address $797
address $799
address $801
address $803
address $805
address $807
address $809
address $811
address $813
address $815
address $817
address $819
address $821
address $823
address $825
address $827
address $829
address $831
address $833
address $835
address $837
address $839
address $841
address $843
address $845
address $847
address $849
address $851
address $853
address $855
address $857
address $859
address $861
address $863
address $865
address $867
code
LABELV $757
line 1471
;1471:case 1: strcpy(ent->classname, "item_armor_shard"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $758
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $759
line 1472
;1472:case 2: strcpy(ent->classname, "item_armor_combat"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $760
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $761
line 1473
;1473:case 3: strcpy(ent->classname, "item_armor_body"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $762
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $763
line 1474
;1474:case 4: strcpy(ent->classname, "item_health_small"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $764
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $765
line 1475
;1475:case 5: strcpy(ent->classname, "item_health"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $766
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $767
line 1476
;1476:case 6: strcpy(ent->classname, "item_health_large"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $768
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $769
line 1477
;1477:case 7: strcpy(ent->classname, "item_health_mega"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $770
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $771
line 1478
;1478:case 8: strcpy(ent->classname, "weapon_gauntlet"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $772
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $773
line 1479
;1479:case 9: strcpy(ent->classname, "weapon_shotgun"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $774
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $775
line 1480
;1480:case 10: strcpy(ent->classname, "weapon_machinegun"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $776
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $777
line 1481
;1481:case 11: strcpy(ent->classname, "weapon_grenadelauncher"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $778
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $779
line 1482
;1482:case 12: strcpy(ent->classname, "weapon_rocketlauncher"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $780
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $781
line 1483
;1483:case 13: strcpy(ent->classname, "weapon_lightning"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $782
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $783
line 1484
;1484:case 14: strcpy(ent->classname, "weapon_railgun"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $784
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $785
line 1485
;1485:case 15: strcpy(ent->classname, "weapon_plasmagun"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $786
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $787
line 1486
;1486:case 16: strcpy(ent->classname, "weapon_bfg"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $788
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $789
line 1487
;1487:case 17: strcpy(ent->classname, "weapon_grapplinghook"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $790
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $791
line 1488
;1488:case 18: strcpy(ent->classname, "ammo_shells"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $792
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $793
line 1489
;1489:case 19: strcpy(ent->classname, "ammo_bullets"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $794
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $795
line 1490
;1490:case 20: strcpy(ent->classname, "ammo_grenades"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $796
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $797
line 1491
;1491:case 21: strcpy(ent->classname, "ammo_cells"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $798
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $799
line 1492
;1492:case 22: strcpy(ent->classname, "ammo_lightning"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $800
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $801
line 1493
;1493:case 23: strcpy(ent->classname, "ammo_rockets"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $802
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $803
line 1494
;1494:case 24: strcpy(ent->classname, "ammo_slugs"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $804
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $805
line 1495
;1495:case 25: strcpy(ent->classname, "ammo_bfg"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $806
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $807
line 1496
;1496:case 26: strcpy(ent->classname, "holdable_teleporter"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $808
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $809
line 1497
;1497:case 27: strcpy(ent->classname, "holdable_medkit"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $810
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $811
line 1498
;1498:case 28: strcpy(ent->classname, "item_quad"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $812
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $813
line 1499
;1499:case 29: strcpy(ent->classname, "item_enviro"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $814
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $815
line 1500
;1500:case 30: strcpy(ent->classname, "item_haste"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $816
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $817
line 1501
;1501:case 31: strcpy(ent->classname, "item_invis"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $818
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $819
line 1502
;1502:case 32: strcpy(ent->classname, "item_regen"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $820
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $821
line 1503
;1503:case 33: strcpy(ent->classname, "item_flight"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $822
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $823
line 1504
;1504:case 34: strcpy(ent->classname, "team_CTF_redflag"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $824
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $825
line 1505
;1505:case 35: strcpy(ent->classname, "team_CTF_blueflag"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $826
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $827
line 1506
;1506:case 36: strcpy(ent->classname, "holdable_kamikaze"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $828
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $829
line 1507
;1507:case 37: strcpy(ent->classname, "holdable_portal"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $830
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $831
line 1508
;1508:case 38: strcpy(ent->classname, "holdable_invulnerability"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $832
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $833
line 1509
;1509:case 39: strcpy(ent->classname, "ammo_nails"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $834
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $835
line 1510
;1510:case 40: strcpy(ent->classname, "ammo_mines"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $836
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $837
line 1511
;1511:case 41: strcpy(ent->classname, "ammo_belt"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $838
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $839
line 1512
;1512:case 42: strcpy(ent->classname, "item_scout"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $840
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $841
line 1513
;1513:case 43: strcpy(ent->classname, "item_guard"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $842
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $843
line 1514
;1514:case 44: strcpy(ent->classname, "item_doubler"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $844
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $845
line 1515
;1515:case 45: strcpy(ent->classname, "item_ammoregen"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $846
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $847
line 1516
;1516:case 46: strcpy(ent->classname, "team_CTF_neutralflag"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $848
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $849
line 1517
;1517:case 47: strcpy(ent->classname, "item_redcube"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $850
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $851
line 1518
;1518:case 48: strcpy(ent->classname, "item_bluecube"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $852
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $853
line 1519
;1519:case 49: strcpy(ent->classname, "weapon_nailgun"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $854
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $855
line 1520
;1520:case 50: strcpy(ent->classname, "weapon_prox_launcher"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $856
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $857
line 1521
;1521:case 51: strcpy(ent->classname, "weapon_chaingun"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $858
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $859
line 1522
;1522:case 52: strcpy(ent->classname, "weapon_flamethrower"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $860
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $861
line 1523
;1523:case 53: strcpy(ent->classname, "ammo_flame"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $862
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $863
line 1524
;1524:case 54: strcpy(ent->classname, "item_armor_vest"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $864
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $865
line 1525
;1525:case 55: strcpy(ent->classname, "item_armor_full"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $866
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $755
JUMPV
LABELV $867
line 1526
;1526:case 56: strcpy(ent->classname, "weapon_antimatter"); break;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $868
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $754
LABELV $755
line 1528
;1527:}
;1528:}
LABELV $744
endproc randomiseitem 348 12
export G_LinkCameras
proc G_LinkCameras 72 40
line 1538
;1529:
;1530:
;1531:/*
;1532:==================
;1533:G_LinkCameras
;1534:Links all cutscene cameras for a cutscene together (with the target_cutscene entity being the first entity in the chain)
;1535:Note that if a camera accidently targets two cameras, it links the first camera it finds.
;1536:==================
;1537:*/
;1538:void G_LinkCameras( gentity_t *ent ) {
line 1545
;1539:	gentity_t	*t;
;1540:	gentity_t	*parent;
;1541:	qboolean	viewTargetFound;
;1542:	gentity_t	*viewTarget;
;1543:	gentity_t	*tmp;
;1544:	vec3_t		dir;
;1545:	int			usePlayerOriginAndViewangles = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1548
;1546:	
;1547:	// if no entity was passed or the passed entity is not a target_cutscene and not an info_camera, do not link
;1548:	if ( !ent || (strcmp(ent->classname, "target_cutscene") && strcmp(ent->classname, "info_camera")) )
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $876
ADDRLP4 36
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $874
ARGP4
ADDRLP4 40
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $872
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $875
ARGP4
ADDRLP4 44
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $872
LABELV $876
line 1549
;1549:		return;
ADDRGP4 $871
JUMPV
LABELV $872
line 1551
;1550:
;1551:	if (!strcmp(ent->classname, "target_cutscene")) {
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $874
ARGP4
ADDRLP4 48
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $877
line 1552
;1552:		parent = ent;			//if entity is a target_cutscene, the nextTrain target should set the target_cutscene as its parent
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 1553
;1553:		if (ent->spawnflags & 2) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $878
line 1554
;1554:			usePlayerOriginAndViewangles = 1;	//only allow first camera in cutscene to start at player's origin/viewangles
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1555
;1555:		}
line 1556
;1556:	}
ADDRGP4 $878
JUMPV
LABELV $877
line 1558
;1557:	else
;1558:	{
line 1559
;1559:		parent = ent->parent;	//if entity is an info_camera, the nextTrain target should set the info_camera's parent as parent
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
ASGNP4
line 1563
;1560:
;1561:		
;1562:		//find the viewtarget for this camera (a target_position or info_notnull)
;1563:		viewTargetFound = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1567
;1564:
;1565:		//note: if 'target' refers to a target_position and an info_camera and G_PickTarget picks the info_camera, 
;1566:		//the code assumes that 'target' is not used for viewangle targeting
;1567:		if ( ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $881
line 1568
;1568:			tmp = G_PickTarget( ent->target );	
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 52
INDIRP4
ASGNP4
line 1569
;1569:			if ( strcmp( tmp->classname, "info_camera" ) ) {
ADDRLP4 16
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $875
ARGP4
ADDRLP4 56
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $883
line 1570
;1570:				viewTarget = tmp;
ADDRLP4 20
ADDRLP4 16
INDIRP4
ASGNP4
line 1571
;1571:				viewTargetFound = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1572
;1572:			}
LABELV $883
line 1573
;1573:		}
LABELV $881
line 1577
;1574:		
;1575:		//note: if 'target2' refers to a target_position and an info_camera and G_PickTarget picks the info_camera, 
;1576:		//the code assumes that 'target2' is not used for viewangle targeting
;1577:		if ( ent->target2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $885
line 1578
;1578:			tmp = G_PickTarget( ent->target2 );
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 52
INDIRP4
ASGNP4
line 1579
;1579:			if ( strcmp( tmp->classname, "info_camera" ) ) {
ADDRLP4 16
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $875
ARGP4
ADDRLP4 56
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $887
line 1580
;1580:				viewTarget = tmp;
ADDRLP4 20
ADDRLP4 16
INDIRP4
ASGNP4
line 1581
;1581:				viewTargetFound = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1582
;1582:			}
LABELV $887
line 1583
;1583:		}
LABELV $885
line 1585
;1584:
;1585:		if ( viewTargetFound ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $889
line 1586
;1586:			VectorSubtract( viewTarget->s.origin, ent->s.origin, dir );
ADDRLP4 52
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 92
ASGNI4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
CNSTI4 96
ASGNI4
ADDRLP4 24+4
ADDRLP4 52
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 100
ASGNI4
ADDRLP4 24+8
ADDRLP4 20
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1587
;1587:			vectoangles( dir, ent->s.angles );
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1588
;1588:		}
LABELV $889
line 1591
;1589:
;1590:		//camera debugging
;1591:		if ( g_debugCameras.integer ) {
ADDRGP4 g_debugCameras+12
INDIRI4
CNSTI4 0
EQI4 $893
line 1592
;1592:			G_Printf("----g_debugCameras----\n cutscene: %i\n origin (XYZ): %s\n angles (PYR): %s\n wait: %f\n pan: %i\n target: %s\n target2: %s\n targetname: %s\n targetname2: %s\n", 
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $896
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 2108
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1594
;1593:				parent->s.number, vtos(ent->s.origin), vtos(ent->s.angles), ent->wait, (ent->spawnflags & 1), ent->target, ent->target2, ent->targetname, ent->targetname2);
;1594:		}
LABELV $893
line 1595
;1595:	}
LABELV $878
line 1598
;1596:
;1597:	// ent->target
;1598:	if ( ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $897
line 1601
;1599:
;1600:		//find all entities with matching targetname
;1601:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $900
JUMPV
LABELV $899
line 1602
;1602:		while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 1603
;1603:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $902
line 1604
;1604:				G_Printf( "WARNING: Entity %s at %s targets itself.\n", ent->classname, vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1605
;1605:			} else if ( !strcmp(t->classname, "info_camera") ) {
ADDRGP4 $903
JUMPV
LABELV $902
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $875
ARGP4
ADDRLP4 52
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $904
line 1606
;1606:				ent->nextTrain = t;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1607
;1607:				t->parent = parent;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1608
;1608:				if (usePlayerOriginAndViewangles) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $906
line 1609
;1609:					t->armor = 1;	//abuse the "armor" property to tell this camera it needs to use the player's origin and viewangles
ADDRLP4 0
INDIRP4
CNSTI4 2196
ADDP4
CNSTI4 1
ASGNI4
line 1610
;1610:				}
LABELV $906
line 1611
;1611:				G_LinkCameras( t );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_LinkCameras
CALLV
pop
line 1612
;1612:				return;
ADDRGP4 $871
JUMPV
LABELV $904
LABELV $903
line 1614
;1613:			}
;1614:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $908
line 1615
;1615:				G_Printf("entity was removed while finding targets\n");
ADDRGP4 $489
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1616
;1616:				return;
ADDRGP4 $871
JUMPV
LABELV $908
line 1618
;1617:			}
;1618:		}
LABELV $900
line 1602
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $899
line 1621
;1619:
;1620:		//find all entities with matching targetname2
;1621:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $911
JUMPV
LABELV $910
line 1622
;1622:		while ( (t = G_Find (t, FOFS(targetname2), ent->target)) != NULL ) {
line 1623
;1623:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $913
line 1624
;1624:				G_Printf( "WARNING: Entity %s at %s targets itself.\n", ent->classname, vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1625
;1625:			} else if ( !strcmp(t->classname, "info_camera") ) {
ADDRGP4 $914
JUMPV
LABELV $913
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $875
ARGP4
ADDRLP4 56
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $915
line 1626
;1626:				ent->nextTrain = t;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1627
;1627:				t->parent = parent;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1628
;1628:				if (usePlayerOriginAndViewangles) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $917
line 1629
;1629:					t->armor = 1;	//abuse the "armor" property to tell this camera it needs to use the player's origin and viewangles
ADDRLP4 0
INDIRP4
CNSTI4 2196
ADDP4
CNSTI4 1
ASGNI4
line 1630
;1630:				}
LABELV $917
line 1631
;1631:				G_LinkCameras( t );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_LinkCameras
CALLV
pop
line 1632
;1632:				return;
ADDRGP4 $871
JUMPV
LABELV $915
LABELV $914
line 1634
;1633:			}
;1634:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $919
line 1635
;1635:				G_Printf("entity was removed while finding targets\n");
ADDRGP4 $489
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1636
;1636:				return;
ADDRGP4 $871
JUMPV
LABELV $919
line 1638
;1637:			}
;1638:		}
LABELV $911
line 1622
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $910
line 1639
;1639:	}
LABELV $897
line 1642
;1640:
;1641:	// ent->target2
;1642:	if ( ent->target2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $921
line 1645
;1643:		
;1644:		//find all entities with matching targetname
;1645:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $924
JUMPV
LABELV $923
line 1646
;1646:		while ( (t = G_Find (t, FOFS(targetname), ent->target2)) != NULL ) {
line 1647
;1647:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $926
line 1648
;1648:				G_Printf( "WARNING: Entity %s at %s targets itself.\n", ent->classname, vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1649
;1649:			} else if ( !strcmp(t->classname, "info_camera") ) {
ADDRGP4 $927
JUMPV
LABELV $926
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $875
ARGP4
ADDRLP4 52
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $928
line 1650
;1650:				ent->nextTrain = t;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1651
;1651:				t->parent = parent;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1652
;1652:				if (usePlayerOriginAndViewangles) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $930
line 1653
;1653:					t->armor = 1;	//abuse the "armor" property to tell this camera it needs to use the player's origin and viewangles
ADDRLP4 0
INDIRP4
CNSTI4 2196
ADDP4
CNSTI4 1
ASGNI4
line 1654
;1654:				}
LABELV $930
line 1655
;1655:				G_LinkCameras( t );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_LinkCameras
CALLV
pop
line 1656
;1656:				return;
ADDRGP4 $871
JUMPV
LABELV $928
LABELV $927
line 1658
;1657:			}
;1658:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $932
line 1659
;1659:				G_Printf("entity was removed while finding targets\n");
ADDRGP4 $489
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1660
;1660:				return;
ADDRGP4 $871
JUMPV
LABELV $932
line 1662
;1661:			}
;1662:		}
LABELV $924
line 1646
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $923
line 1665
;1663:
;1664:		//find all entities with matching targetname2
;1665:		t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $935
JUMPV
LABELV $934
line 1666
;1666:		while ( (t = G_Find (t, FOFS(targetname2), ent->target2)) != NULL ) {
line 1667
;1667:			if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $937
line 1668
;1668:				G_Printf( "WARNING: Entity %s at %s targets itself.\n", ent->classname, vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1669
;1669:			} else if ( !strcmp(t->classname, "info_camera") ) {
ADDRGP4 $938
JUMPV
LABELV $937
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $875
ARGP4
ADDRLP4 56
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $939
line 1670
;1670:				ent->nextTrain = t;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1671
;1671:				t->parent = parent;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1672
;1672:				if (usePlayerOriginAndViewangles) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $941
line 1673
;1673:					t->armor = 1;	//abuse the "armor" property to tell this camera it needs to use the player's origin and viewangles
ADDRLP4 0
INDIRP4
CNSTI4 2196
ADDP4
CNSTI4 1
ASGNI4
line 1674
;1674:				}
LABELV $941
line 1675
;1675:				G_LinkCameras( t );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_LinkCameras
CALLV
pop
line 1676
;1676:				return;
ADDRGP4 $871
JUMPV
LABELV $939
LABELV $938
line 1678
;1677:			}
;1678:			if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $943
line 1679
;1679:				G_Printf("entity was removed while targeting targets\n");
ADDRGP4 $945
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1680
;1680:				return;
ADDRGP4 $871
JUMPV
LABELV $943
line 1682
;1681:			}
;1682:		}
LABELV $935
line 1666
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $934
line 1683
;1683:	}
LABELV $921
line 1684
;1684:}
LABELV $871
endproc G_LinkCameras 72 40
export G_Fade
proc G_Fade 24 40
line 1693
;1685:
;1686:
;1687:/*
;1688:==================
;1689:G_Fade
;1690:Tells clients to initiate a fade effect
;1691:==================
;1692:*/
;1693:void G_Fade( float duration, vec4_t startColor, vec4_t endColor, int clientn ) {
line 1694
;1694:	trap_SendServerCommand( clientn, 
ADDRGP4 $947
ARGP4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1700
;1695:		va(
;1696:			"fade \"%f\" \"%f\" \"%f\" \"%f\" \"%f\" \"%f\" \"%f\" \"%f\" \"%f\"", 
;1697:			duration, startColor[0], startColor[1], startColor[2], startColor[3], endColor[0], endColor[1], endColor[2], endColor[3]
;1698:		)
;1699:	);
;1700:}
LABELV $946
endproc G_Fade 24 40
export G_FadeOut
proc G_FadeOut 4 8
line 1708
;1701:
;1702:/*
;1703:==================
;1704:G_FadeOut
;1705:Fades out to black
;1706:==================
;1707:*/
;1708:void G_FadeOut( float duration, int clientn ) {
line 1709
;1709:	trap_SendServerCommand( clientn, va("fade \"%f\" \"0\" \"0\" \"0\" \"0\" \"0\" \"0\" \"0\" \"1\"", duration) );
ADDRGP4 $949
ARGP4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1710
;1710:}
LABELV $948
endproc G_FadeOut 4 8
export G_FadeIn
proc G_FadeIn 4 8
line 1718
;1711:
;1712:/*
;1713:==================
;1714:G_FadeIn
;1715:Fades in from black
;1716:==================
;1717:*/
;1718:void G_FadeIn( float duration, int clientn ) {
line 1719
;1719:	trap_SendServerCommand( clientn, va("fade \"%f\" \"0\" \"0\" \"0\" \"1\" \"0\" \"0\" \"0\" \"0\"", duration) );
ADDRGP4 $951
ARGP4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1720
;1720:}
LABELV $950
endproc G_FadeIn 4 8
export G_CalculatePlayerScore
proc G_CalculatePlayerScore 16 16
line 1730
;1721:
;1722:
;1723:/*
;1724:==================
;1725:G_CalculatePlayerScore
;1726:Wrapper around COM_CalculatePlayerScore. This method calculates data that is required by COM_CalculatePlayerScore and returns
;1727:the result of the COM_CalculatePlayerScore function.
;1728:==================
;1729:*/
;1730:playerscore_t G_CalculatePlayerScore( gentity_t *ent ) {
line 1735
;1731:	float skill;
;1732:	int accuracy;
;1733:
;1734:	//determine accuracy
;1735:	if ( ent->client->accuracy_shots > 0 )
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
CNSTI4 0
LEI4 $954
line 1736
;1736:		accuracy = ((float)ent->client->accuracy_hits / (float)ent->client->accuracy_shots) * 100;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 1120403456
ADDRLP4 8
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
CVIF4 4
DIVF4
MULF4
CVFI4 4
ASGNI4
ADDRGP4 $955
JUMPV
LABELV $954
line 1738
;1737:	else
;1738:		accuracy = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $955
line 1741
;1739:
;1740:	// get skill
;1741:	skill = trap_Cvar_VariableValue( "g_spskill" );
ADDRGP4 $956
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1743
;1742:
;1743:	return COM_CalculatePlayerScore( ent->client->ps.persistant, accuracy, (int)skill);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 248
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRF4
CVFI4 4
CVIF4 4
ARGF4
ADDRGP4 COM_CalculatePlayerScore
CALLV
pop
LABELV $952
endproc G_CalculatePlayerScore 16 16
export G_ArenaScriptAutoInt
proc G_ArenaScriptAutoInt 8 4
line 1752
;1744:}
;1745:
;1746:/*
;1747:==================
;1748:G_ArenaScriptAutoInt
;1749:Return type int
;1750:==================
;1751:*/
;1752:int G_ArenaScriptAutoInt( char *name ) {  
line 1753
;1753:	if(trap_Cvar_VariableIntegerValue(name)){
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $958
line 1754
;1754:		return trap_Cvar_VariableIntegerValue(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $957
JUMPV
LABELV $958
line 1756
;1755:	}
;1756:		return atoi(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $957
endproc G_ArenaScriptAutoInt 8 4
export G_ArenaScriptAutoChar
proc G_ArenaScriptAutoChar 1032 12
line 1765
;1757:}
;1758:
;1759:/*
;1760:==================
;1761:G_ArenaScriptAutoChar
;1762:Return type char
;1763:==================
;1764:*/
;1765:char *G_ArenaScriptAutoChar( char *name ) {
line 1768
;1766:char finaltext[1024];
;1767:
;1768:trap_Cvar_VariableStringBuffer(name, finaltext, sizeof( finaltext ));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1769
;1769:	if(Q_stricmp (finaltext, "") != 0){
ADDRLP4 0
ARGP4
ADDRGP4 $737
ARGP4
ADDRLP4 1024
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $961
line 1770
;1770:		return va("%s", finaltext );
ADDRGP4 $116
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
RETP4
ADDRGP4 $960
JUMPV
LABELV $961
line 1772
;1771:	}
;1772:	return va("%s", name );
ADDRGP4 $116
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
RETP4
LABELV $960
endproc G_ArenaScriptAutoChar 1032 12
export G_ArenaScriptAutoFloat
proc G_ArenaScriptAutoFloat 8 4
line 1781
;1773:}
;1774:
;1775:/*
;1776:==================
;1777:G_ArenaScriptAutoFloat
;1778:Return type char
;1779:==================
;1780:*/
;1781:float G_ArenaScriptAutoFloat( char *name ) {
line 1783
;1782:
;1783:	if(trap_Cvar_VariableValue(name)){
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $964
line 1784
;1784:		return trap_Cvar_VariableValue(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
RETF4
ADDRGP4 $963
JUMPV
LABELV $964
line 1786
;1785:	}
;1786:	return atof(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
RETF4
LABELV $963
endproc G_ArenaScriptAutoFloat 8 4
export G_ArenaScriptRandom
proc G_ArenaScriptRandom 12 0
line 1796
;1787:}
;1788:
;1789:/*
;1790:==================
;1791:G_ArenaScriptRandom
;1792:Return random int
;1793:==================
;1794:*/
;1795:int G_ArenaScriptRandom(int min, int max)
;1796:{
line 1798
;1797:	int number;
;1798:	number = (rand() % (max - min + 1)) + (min);
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
CNSTI4 1
ADDI4
MODI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1799
;1799:	return number;
ADDRLP4 0
INDIRI4
RETI4
LABELV $966
endproc G_ArenaScriptRandom 12 0
bss
align 1
LABELV $968
skip 1024
export AU_Cvar_VariableString
code
proc AU_Cvar_VariableString 0 12
line 1802
;1800:}
;1801:
;1802:char *AU_Cvar_VariableString( const char *var_name ) {
line 1805
;1803:	static char	buffer[MAX_STRING_CHARS];
;1804:
;1805:	trap_Cvar_VariableStringBuffer( var_name, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $968
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1807
;1806:
;1807:	return buffer;
ADDRGP4 $968
RETP4
LABELV $967
endproc AU_Cvar_VariableString 0 12
export FindEntityForPhysgun
proc FindEntityForPhysgun 132 28
line 1816
;1808:}
;1809:
;1810:/*
;1811:==================
;1812:FindEntityForPhysgun
;1813:Added for QSandbox.
;1814:==================
;1815:*/
;1816:gentity_t *FindEntityForPhysgun( gentity_t *ent, int range ){
line 1822
;1817:	vec3_t		end, start, forward, up, right;
;1818:	trace_t		tr;
;1819:	gentity_t	*traceEnt;
;1820:	
;1821:	//Set Aiming Directions
;1822:	AngleVectors(ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1823
;1823:	CalcMuzzlePoint(ent, forward, right, up, start);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 56
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1824
;1824:	VectorMA (start, range, forward, end);
ADDRLP4 120
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 84
ADDRLP4 56
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 56+4
INDIRF4
ADDRLP4 72+4
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 56+8
INDIRF4
ADDRLP4 72+8
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1827
;1825:
;1826:	//Trace Position
;1827:	trap_Trace (&tr, start, NULL, NULL, end, ent->s.number, MASK_SELECT );
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 124
CNSTP4 0
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1174405121
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1829
;1828:	
;1829:	ent->grabDist = Distance(start, tr.endpos);
ADDRLP4 56
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 128
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2456
ADDP4
ADDRLP4 128
INDIRF4
ASGNF4
line 1831
;1830:	
;1831:	traceEnt = &g_entities[ tr.entityNum ];		//entity for return
ADDRLP4 68
CNSTI4 2492
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1833
;1832:	
;1833:	VectorSubtract(traceEnt->r.currentOrigin, tr.endpos, ent->grabOffset);
ADDRFP4 0
INDIRP4
CNSTI4 2460
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2464
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2468
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 1835
;1834:	
;1835:	if(traceEnt && tr.entityNum != ENTITYNUM_NONE && tr.entityNum != ENTITYNUM_WORLD){
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $983
ADDRLP4 0+52
INDIRI4
CNSTI4 4095
EQI4 $983
ADDRLP4 0+52
INDIRI4
CNSTI4 4094
EQI4 $983
line 1836
;1836:	return traceEnt;
ADDRLP4 68
INDIRP4
RETP4
ADDRGP4 $969
JUMPV
LABELV $983
line 1837
;1837:	} else {
line 1838
;1838:	return NULL;	
CNSTP4 0
RETP4
LABELV $969
endproc FindEntityForPhysgun 132 28
export FindEntityForGravitygun
proc FindEntityForGravitygun 128 28
line 1842
;1839:	}
;1840:}
;1841:
;1842:gentity_t *FindEntityForGravitygun( gentity_t *ent, int range ){
line 1848
;1843:	vec3_t		end, start, forward, up, right;
;1844:	trace_t		tr;
;1845:	gentity_t	*traceEnt;
;1846:	
;1847:	//Set Aiming Directions
;1848:	AngleVectors(ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1849
;1849:	CalcMuzzlePoint(ent, forward, right, up, start);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 60
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1850
;1850:	VectorMA (start, range, forward, end);
ADDRLP4 120
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 84
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1853
;1851:
;1852:	//Trace Position
;1853:	trap_Trace (&tr, start, NULL, NULL, end, ent->s.number, MASK_SELECT );
ADDRLP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 124
CNSTP4 0
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1174405121
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1855
;1854:	
;1855:	ent->grabDist = 128;
ADDRFP4 0
INDIRP4
CNSTI4 2456
ADDP4
CNSTF4 1124073472
ASGNF4
line 1857
;1856:	
;1857:	traceEnt = &g_entities[ tr.entityNum ];		//entity for return
ADDRLP4 56
CNSTI4 2492
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1859
;1858:	
;1859:	VectorSubtract(traceEnt->r.currentOrigin, tr.endpos, ent->grabOffset);
ADDRFP4 0
INDIRP4
CNSTI4 2460
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2464
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2468
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 1861
;1860:	
;1861:	if(traceEnt && tr.entityNum != ENTITYNUM_NONE && tr.entityNum != ENTITYNUM_WORLD){
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1000
ADDRLP4 0+52
INDIRI4
CNSTI4 4095
EQI4 $1000
ADDRLP4 0+52
INDIRI4
CNSTI4 4094
EQI4 $1000
line 1862
;1862:	return traceEnt;
ADDRLP4 56
INDIRP4
RETP4
ADDRGP4 $987
JUMPV
LABELV $1000
line 1863
;1863:	} else {
line 1864
;1864:	return NULL;	
CNSTP4 0
RETP4
LABELV $987
endproc FindEntityForGravitygun 128 28
export CrosshairPointPhys
proc CrosshairPointPhys 168 28
line 1874
;1865:	}
;1866:}
;1867:
;1868:/*
;1869:==================
;1870:CrosshairPointPhys
;1871:Added for QSandbox.
;1872:==================
;1873:*/
;1874:void CrosshairPointPhys(gentity_t *ent, int range, vec3_t outPoint) {
line 1880
;1875:    vec3_t end, start, forward, up, right;
;1876:    trace_t tr;
;1877:    vec3_t adjustedMins, adjustedMaxs;
;1878:    vec3_t adjustedOffset;
;1879:	
;1880:	VectorNegate ( ent->grabOffset, adjustedOffset );
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 152
INDIRP4
CNSTI4 2460
ADDP4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 152
INDIRP4
CNSTI4 2464
ADDP4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 2468
ADDP4
INDIRF4
NEGF4
ASGNF4
line 1882
;1881:	
;1882:	VectorSubtract(ent->grabbedEntity->r.mins, adjustedOffset, adjustedMins);
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 2448
ADDP4
ASGNP4
ADDRLP4 48
ADDRLP4 156
INDIRP4
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 156
INDIRP4
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+8
ADDRFP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1883
;1883:    VectorSubtract(ent->grabbedEntity->r.maxs, adjustedOffset, adjustedMaxs);
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 2448
ADDP4
ASGNP4
ADDRLP4 60
ADDRLP4 160
INDIRP4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 160
INDIRP4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60+8
ADDRFP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1885
;1884:
;1885:    AngleVectors(ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1886
;1886:    CalcMuzzlePoint(ent, forward, right, up, start);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1887
;1887:    VectorMA(start, range, forward, end);
ADDRLP4 164
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 36
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1889
;1888:
;1889:    trap_Trace(&tr, start, adjustedMins, adjustedMaxs, end, ent->s.number, MASK_OBJECTS);
ADDRLP4 96
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1891
;1890:
;1891:    VectorCopy(tr.endpos, outPoint);
ADDRFP4 8
INDIRP4
ADDRLP4 96+12
INDIRB
ASGNB 12
line 1892
;1892:}
LABELV $1004
endproc CrosshairPointPhys 168 28
export CrosshairPointGravity
proc CrosshairPointGravity 128 28
line 1894
;1893:
;1894:void CrosshairPointGravity(gentity_t *ent, int range, vec3_t outPoint) {
line 1898
;1895:    vec3_t end, start, forward, up, right;
;1896:    trace_t tr;
;1897:
;1898:    AngleVectors(ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1899
;1899:    CalcMuzzlePoint(ent, forward, right, up, start);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1900
;1900:    VectorMA(start, range, forward, end);
ADDRLP4 116
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1902
;1901:
;1902:    trap_Trace(&tr, start, ent->grabbedEntity->r.mins, ent->grabbedEntity->r.maxs, end, ent->s.number, MASK_OBJECTS);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 120
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 120
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1904
;1903:
;1904:    VectorCopy(tr.endpos, outPoint);
ADDRFP4 8
INDIRP4
ADDRLP4 60+12
INDIRB
ASGNB 12
line 1905
;1905:}
LABELV $1022
endproc CrosshairPointGravity 128 28
export G_DisablePropPhysics
proc G_DisablePropPhysics 8 0
line 1914
;1906:
;1907:/*
;1908:================
;1909:G_DisablePropPhysics
;1910:
;1911:Disables prop physics
;1912:================
;1913:*/
;1914:void G_DisablePropPhysics( gentity_t *ent, vec3_t origin ) {
line 1915
;1915:	VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1916
;1916:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1917
;1917:	ent->s.pos.trTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1918
;1918:	ent->s.pos.trDuration = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 1919
;1919:	VectorClear( ent->s.pos.trDelta );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1921
;1920:	
;1921:	VectorCopy( origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1922
;1922:}
LABELV $1030
endproc G_DisablePropPhysics 8 0
export G_EnablePropPhysics
proc G_EnablePropPhysics 4 0
line 1931
;1923:
;1924:/*
;1925:================
;1926:G_EnablePropPhysics
;1927:
;1928:Enables prop physics
;1929:================
;1930:*/
;1931:void G_EnablePropPhysics( gentity_t *ent ) {
line 1932
;1932:	if(ent->sb_phys != 2){	//if it's static object, not turn phys
ADDRFP4 0
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1032
line 1933
;1933:		return;	
ADDRGP4 $1031
JUMPV
LABELV $1032
line 1935
;1934:	}
;1935:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 1936
;1936:	if(ent->s.pos.trType != TR_GRAVITY_WATER){
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 7
EQI4 $1034
line 1937
;1937:	ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1938
;1938:	}
LABELV $1034
line 1939
;1939:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1940
;1940:	ent->s.pos.trDuration = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1941
;1941:}
LABELV $1031
endproc G_EnablePropPhysics 4 0
import rq3_random
import Cmd_Kill_f
import G_WLK_GetLeft
bss
export remappedShaders
align 4
LABELV remappedShaders
skip 67584
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
import G_ArenaScriptAutoNonPointChar
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
import trap_Cvar_VariableValue
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
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
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
import G_TouchSolids
import G_TouchTriggers
import VehiclePhys
import botsandbox_check
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
LABELV $956
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $951
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 49
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 0
align 1
LABELV $949
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 32
byte 1 34
byte 1 49
byte 1 34
byte 1 0
align 1
LABELV $947
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 0
align 1
LABELV $945
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $896
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 67
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 115
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 32
byte 1 99
byte 1 117
byte 1 116
byte 1 115
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 40
byte 1 88
byte 1 89
byte 1 90
byte 1 41
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 40
byte 1 80
byte 1 89
byte 1 82
byte 1 41
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 32
byte 1 112
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 50
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $875
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $874
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 99
byte 1 117
byte 1 116
byte 1 115
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $868
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $866
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $864
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $862
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $860
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $858
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $856
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 95
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $854
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $852
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 99
byte 1 117
byte 1 98
byte 1 101
byte 1 0
align 1
LABELV $850
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 99
byte 1 117
byte 1 98
byte 1 101
byte 1 0
align 1
LABELV $848
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $846
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $844
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $842
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $840
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $838
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 101
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $836
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $834
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $832
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $830
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $828
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $826
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $824
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $822
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $820
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $818
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $816
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $814
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $812
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $810
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $808
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $806
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $804
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 108
byte 1 117
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $802
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $800
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $798
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $796
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $794
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $792
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $790
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 104
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $788
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $786
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $784
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $782
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $780
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $778
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $776
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $774
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $772
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $770
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $768
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $766
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $764
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $762
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $760
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 98
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $758
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $750
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 0
align 1
LABELV $749
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 0
align 1
LABELV $748
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 0
align 1
LABELV $747
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 0
align 1
LABELV $739
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $737
byte 1 0
align 1
LABELV $615
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $592
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $589
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $569
byte 1 71
byte 1 95
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 46
byte 1 32
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 32
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $545
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $534
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $525
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $519
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $489
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $464
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $435
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $404
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 98
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $387
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $290
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $283
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $259
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
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
byte 1 10
byte 1 0
align 1
LABELV $249
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $234
byte 1 62
byte 1 61
byte 1 0
align 1
LABELV $220
byte 1 60
byte 1 61
byte 1 0
align 1
LABELV $206
byte 1 62
byte 1 0
align 1
LABELV $192
byte 1 60
byte 1 0
align 1
LABELV $178
byte 1 33
byte 1 61
byte 1 61
byte 1 0
align 1
LABELV $164
byte 1 33
byte 1 61
byte 1 0
align 1
LABELV $150
byte 1 61
byte 1 61
byte 1 0
align 1
LABELV $136
byte 1 61
byte 1 0
align 1
LABELV $116
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $103
byte 1 71
byte 1 95
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $84
byte 1 37
byte 1 115
byte 1 61
byte 1 37
byte 1 115
byte 1 58
byte 1 37
byte 1 53
byte 1 46
byte 1 50
byte 1 102
byte 1 64
byte 1 0
