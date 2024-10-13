export BotAI_Print
code
proc BotAI_Print 2056 16
file "../../../code/game/ai_main.c"
line 97
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
;23:
;24:/*****************************************************************************
;25: * name:		ai_main.c
;26: *
;27: * desc:		Quake3 bot AI
;28: *
;29: * $Archive: /MissionPack/code/game/ai_main.c $
;30: *
;31: *****************************************************************************/
;32:
;33:
;34:#include "g_local.h"
;35:#include "../qcommon/q_shared.h"
;36:#include "../botlib/botlib.h"		//bot lib interface
;37:#include "../botlib/be_aas.h"
;38:#include "../botlib/be_ea.h"
;39:#include "../botlib/be_ai_char.h"
;40:#include "../botlib/be_ai_chat.h"
;41:#include "../botlib/be_ai_gen.h"
;42:#include "../botlib/be_ai_goal.h"
;43:#include "../botlib/be_ai_move.h"
;44:#include "../botlib/be_ai_weap.h"
;45://
;46:#include "ai_main.h"
;47:#include "ai_dmq3.h"
;48:#include "ai_chat.h"
;49:#include "ai_cmd.h"
;50:#include "ai_dmnet.h"
;51:#include "ai_vcmd.h"
;52:
;53://
;54:#include "chars.h"
;55:#include "inv.h"
;56:#include "syn.h"
;57:
;58:#ifndef MAX_PATH
;59:#define MAX_PATH		144
;60:#endif
;61:
;62:
;63://bot states
;64:bot_state_t	*botstates[MAX_CLIENTS];
;65://number of bots
;66:int numbots;
;67://floating point time
;68:float floattime;
;69://time to do a regular update
;70:float regularupdate_time;
;71://
;72:int bot_interbreed;
;73:int bot_interbreedmatchcount;
;74://
;75:vmCvar_t bot_thinktime;
;76:vmCvar_t bot_memorydump;
;77:vmCvar_t bot_saveroutingcache;
;78:vmCvar_t bot_pause;
;79:vmCvar_t bot_report;
;80:vmCvar_t bot_testsolid;
;81:vmCvar_t bot_testclusters;
;82:vmCvar_t bot_developer;
;83:vmCvar_t bot_interbreedchar;
;84:vmCvar_t bot_interbreedbots;
;85:vmCvar_t bot_interbreedcycle;
;86:vmCvar_t bot_interbreedwrite;
;87:
;88:
;89:void ExitLevel( void );
;90:
;91:
;92:/*
;93:==================
;94:BotAI_Print
;95:==================
;96:*/
;97:void QDECL BotAI_Print(int type, char *fmt, ...) {
line 101
;98:	char str[2048];
;99:	va_list ap;
;100:
;101:	va_start(ap, fmt);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 102
;102:	Q_vsnprintf(str, sizeof(str), fmt, ap);
ADDRLP4 4
ARGP4
CNSTI4 2048
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 103
;103:	va_end(ap);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 105
;104:
;105:	switch(type) {
ADDRLP4 2052
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 1
LTI4 $67
ADDRLP4 2052
INDIRI4
CNSTI4 5
GTI4 $67
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $80-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $80
address $69
address $71
address $73
address $75
address $77
code
LABELV $69
line 106
;106:		case PRT_MESSAGE: {
line 107
;107:			G_Printf("%s", str);
ADDRGP4 $70
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 108
;108:			break;
ADDRGP4 $68
JUMPV
LABELV $71
line 110
;109:		}
;110:		case PRT_WARNING: {
line 111
;111:			G_Printf( S_COLOR_YELLOW "Warning: %s", str );
ADDRGP4 $72
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 112
;112:			break;
ADDRGP4 $68
JUMPV
LABELV $73
line 114
;113:		}
;114:		case PRT_ERROR: {
line 115
;115:			G_Printf( S_COLOR_RED "Error: %s", str );
ADDRGP4 $74
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 116
;116:			break;
ADDRGP4 $68
JUMPV
LABELV $75
line 118
;117:		}
;118:		case PRT_FATAL: {
line 119
;119:			G_Printf( S_COLOR_RED "Fatal: %s", str );
ADDRGP4 $76
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 120
;120:			break;
ADDRGP4 $68
JUMPV
LABELV $77
line 122
;121:		}
;122:		case PRT_EXIT: {
line 123
;123:			G_Error( S_COLOR_RED "Exit: %s", str );
ADDRGP4 $78
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 124
;124:			break;
ADDRGP4 $68
JUMPV
LABELV $67
line 126
;125:		}
;126:		default: {
line 127
;127:			G_Printf( "unknown print type\n" );
ADDRGP4 $79
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 128
;128:			break;
LABELV $68
line 131
;129:		}
;130:	}
;131:}
LABELV $65
endproc BotAI_Print 2056 16
export NpcFactionProp
proc NpcFactionProp 52 0
line 134
;132:
;133:
;134:qboolean NpcFactionProp(bot_state_t* bs, int prop, gentity_t* ent){
line 135
;135:switch(prop) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $83
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $83
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $212-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $212
address $85
address $96
address $107
address $168
address $179
address $190
address $201
code
LABELV $85
line 136
;136:	case NP_CHAT:{
line 137
;137:		switch(bs->spbot) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 5
GTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $95
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $95
address $89
address $90
address $91
address $92
address $93
address $94
code
LABELV $89
line 138
;138:			case NPC_PLAYER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $90
line 139
;139:			case NPC_ENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $91
line 140
;140:			case NPC_CITIZEN: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $92
line 141
;141:			case NPC_GUARD: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $93
line 142
;142:			case NPC_PARTNER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $94
line 143
;143:			case NPC_PARTNERENEMY: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
line 145
;144:		}
;145:	break;}
LABELV $96
line 147
;146:	
;147:	case NP_CHATLISTEN:{
line 148
;148:		switch(bs->spbot) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 5
GTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $106
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $106
address $100
address $101
address $102
address $103
address $104
address $105
code
LABELV $100
line 149
;149:			case NPC_PLAYER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $101
line 150
;150:			case NPC_ENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $102
line 151
;151:			case NPC_CITIZEN: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $103
line 152
;152:			case NPC_GUARD: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $104
line 153
;153:			case NPC_PARTNER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $105
line 154
;154:			case NPC_PARTNERENEMY: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
line 156
;155:		}
;156:	break;}
LABELV $107
line 158
;157:		
;158:	case NP_ATTACK:{
line 159
;159:		switch(bs->spbot) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 5
GTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $166-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $166
address $111
address $122
address $133
address $144
address $155
code
LABELV $111
line 160
;160:			case NPC_ENEMY: 	switch(ent->singlebot) 
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $112
ADDRLP4 12
INDIRI4
CNSTI4 5
GTI4 $112
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $121
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $121
address $115
address $116
address $117
address $118
address $119
address $120
code
line 161
;161:			{
LABELV $115
line 162
;162:			case NPC_PLAYER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $116
line 163
;163:			case NPC_ENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $117
line 164
;164:			case NPC_CITIZEN: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $118
line 165
;165:			case NPC_GUARD: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $119
line 166
;166:			case NPC_PARTNER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $120
line 167
;167:			case NPC_PARTNERENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $112
LABELV $122
line 169
;168:			}
;169:			case NPC_CITIZEN: 	switch(ent->singlebot) 
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $123
ADDRLP4 20
INDIRI4
CNSTI4 5
GTI4 $123
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $132
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $132
address $126
address $127
address $128
address $129
address $130
address $131
code
line 170
;170:			{
LABELV $126
line 171
;171:			case NPC_PLAYER: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $127
line 172
;172:			case NPC_ENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $128
line 173
;173:			case NPC_CITIZEN: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $129
line 174
;174:			case NPC_GUARD: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $130
line 175
;175:			case NPC_PARTNER: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $131
line 176
;176:			case NPC_PARTNERENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $123
LABELV $133
line 178
;177:			}
;178:			case NPC_GUARD: 	switch(ent->singlebot) 
ADDRLP4 28
ADDRFP4 8
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $134
ADDRLP4 28
INDIRI4
CNSTI4 5
GTI4 $134
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $143
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $143
address $137
address $138
address $139
address $140
address $141
address $142
code
line 179
;179:			{
LABELV $137
line 180
;180:			case NPC_PLAYER: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $138
line 181
;181:			case NPC_ENEMY: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $139
line 182
;182:			case NPC_CITIZEN: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $140
line 183
;183:			case NPC_GUARD: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $141
line 184
;184:			case NPC_PARTNER: 	return qfalse;		
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $142
line 185
;185:			case NPC_PARTNERENEMY: 	return qtrue;			
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $134
LABELV $144
line 187
;186:			}
;187:			case NPC_PARTNER: 	switch(ent->singlebot) 
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $145
ADDRLP4 36
INDIRI4
CNSTI4 5
GTI4 $145
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $154
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $154
address $148
address $149
address $150
address $151
address $152
address $153
code
line 188
;188:			{
LABELV $148
line 189
;189:			case NPC_PLAYER: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $149
line 190
;190:			case NPC_ENEMY: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $150
line 191
;191:			case NPC_CITIZEN: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $151
line 192
;192:			case NPC_GUARD: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $152
line 193
;193:			case NPC_PARTNER: 	return qfalse;	
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $153
line 194
;194:			case NPC_PARTNERENEMY: 	return qtrue;			
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $145
LABELV $155
line 196
;195:			}
;196:			case NPC_PARTNERENEMY: 	switch(ent->singlebot) 
ADDRLP4 44
ADDRFP4 8
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $84
ADDRLP4 44
INDIRI4
CNSTI4 5
GTI4 $84
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $165
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $165
address $159
address $160
address $161
address $162
address $163
address $164
code
line 197
;197:			{
LABELV $159
line 198
;198:			case NPC_PLAYER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $160
line 199
;199:			case NPC_ENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $161
line 200
;200:			case NPC_CITIZEN: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $162
line 201
;201:			case NPC_GUARD: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $163
line 202
;202:			case NPC_PARTNER: 	return qtrue;	
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $164
line 203
;203:			case NPC_PARTNERENEMY: 	return qfalse;			
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
line 205
;204:			}
;205:		}	
line 206
;206:	break;}
LABELV $168
line 208
;207:		
;208:	case NP_CONTROL:{
line 209
;209:		switch(bs->spbot) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 5
GTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $178
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $178
address $172
address $173
address $174
address $175
address $176
address $177
code
LABELV $172
line 210
;210:			case NPC_PLAYER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $173
line 211
;211:			case NPC_ENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $174
line 212
;212:			case NPC_CITIZEN: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $175
line 213
;213:			case NPC_GUARD: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $176
line 214
;214:			case NPC_PARTNER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $177
line 215
;215:			case NPC_PARTNERENEMY: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
line 217
;216:		}	
;217:	break;}
LABELV $179
line 219
;218:
;219:	case NP_SCORE:{
line 220
;220:		switch(bs->spbot) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 5
GTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $189
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $189
address $183
address $184
address $185
address $186
address $187
address $188
code
LABELV $183
line 221
;221:			case NPC_PLAYER: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $184
line 222
;222:			case NPC_ENEMY: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $185
line 223
;223:			case NPC_CITIZEN: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $186
line 224
;224:			case NPC_GUARD: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $187
line 225
;225:			case NPC_PARTNER: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $188
line 226
;226:			case NPC_PARTNERENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
line 228
;227:		}
;228:	break;}
LABELV $190
line 230
;229:		
;230:	case NP_GOAL:{
line 231
;231:		switch(bs->spbot) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 5
GTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $200
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $200
address $194
address $195
address $196
address $197
address $198
address $199
code
LABELV $194
line 232
;232:			case NPC_PLAYER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $195
line 233
;233:			case NPC_ENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $196
line 234
;234:			case NPC_CITIZEN: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $197
line 235
;235:			case NPC_GUARD: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $198
line 236
;236:			case NPC_PARTNER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $199
line 237
;237:			case NPC_PARTNERENEMY: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
line 239
;238:		}	
;239:	break;}
LABELV $201
line 241
;240:	
;241:	case NP_JUMP:{
line 242
;242:		switch(bs->spbot) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 5
GTI4 $84
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $211
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $211
address $205
address $206
address $207
address $208
address $209
address $210
code
LABELV $205
line 243
;243:			case NPC_PLAYER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $206
line 244
;244:			case NPC_ENEMY: 	return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $207
line 245
;245:			case NPC_CITIZEN: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $208
line 246
;246:			case NPC_GUARD: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $209
line 247
;247:			case NPC_PARTNER: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $210
line 248
;248:			case NPC_PARTNERENEMY: 	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
line 250
;249:		}	
;250:	break;}
LABELV $83
LABELV $84
line 253
;251:	
;252:}
;253:return qfalse;
CNSTI4 0
RETI4
LABELV $82
endproc NpcFactionProp 52 0
export BotAI_Trace
proc BotAI_Trace 56 28
line 262
;254:}
;255:
;256:
;257:/*
;258:==================
;259:BotAI_Trace
;260:==================
;261:*/
;262:void BotAI_Trace(bsp_trace_t *bsptrace, vec3_t start, vec3_t mins, vec3_t maxs, vec3_t end, int passent, int contentmask) {
line 265
;263:	trace_t trace;
;264:
;265:	trap_Trace(&trace, start, mins, maxs, end, passent, contentmask);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 267
;266:	//copy the trace information
;267:	bsptrace->allsolid = trace.allsolid;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 268
;268:	bsptrace->startsolid = trace.startsolid;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0+4
INDIRI4
ASGNI4
line 269
;269:	bsptrace->fraction = trace.fraction;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0+8
INDIRF4
ASGNF4
line 270
;270:	VectorCopy(trace.endpos, bsptrace->endpos);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 271
;271:	bsptrace->plane.dist = trace.plane.dist;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0+24+12
INDIRF4
ASGNF4
line 272
;272:	VectorCopy(trace.plane.normal, bsptrace->plane.normal);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 273
;273:	bsptrace->plane.signbits = trace.plane.signbits;
ADDRFP4 0
INDIRP4
CNSTI4 41
ADDP4
ADDRLP4 0+24+17
INDIRU1
ASGNU1
line 274
;274:	bsptrace->plane.type = trace.plane.type;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+24+16
INDIRU1
ASGNU1
line 275
;275:	bsptrace->surface.value = trace.surfaceFlags;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0+44
INDIRI4
ASGNI4
line 276
;276:	bsptrace->ent = trace.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 277
;277:	bsptrace->exp_dist = 0;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 278
;278:	bsptrace->sidenum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 279
;279:	bsptrace->contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 0
ASGNI4
line 280
;280:}
LABELV $214
endproc BotAI_Trace 56 28
export BotAI_GetClientState
proc BotAI_GetClientState 4 12
line 287
;281:
;282:/*
;283:==================
;284:BotAI_GetClientState
;285:==================
;286:*/
;287:int BotAI_GetClientState( int clientNum, playerState_t *state ) {
line 290
;288:	gentity_t	*ent;
;289:
;290:	ent = &g_entities[clientNum];
ADDRLP4 0
CNSTI4 2492
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 291
;291:	if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $228
line 292
;292:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $227
JUMPV
LABELV $228
line 294
;293:	}
;294:	if ( !ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $230
line 295
;295:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $227
JUMPV
LABELV $230
line 298
;296:	}
;297:
;298:	memcpy( state, &ent->client->ps, sizeof(playerState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
CNSTI4 472
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 299
;299:	return qtrue;
CNSTI4 1
RETI4
LABELV $227
endproc BotAI_GetClientState 4 12
export BotAI_GetEntityState
proc BotAI_GetEntityState 8 12
line 307
;300:}
;301:
;302:/*
;303:==================
;304:BotAI_GetEntityState
;305:==================
;306:*/
;307:int BotAI_GetEntityState( int entityNum, entityState_t *state ) {
line 310
;308:	gentity_t	*ent;
;309:
;310:	ent = &g_entities[entityNum];
ADDRLP4 0
CNSTI4 2492
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 311
;311:	memset( state, 0, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 228
ARGI4
ADDRGP4 memset
CALLP4
pop
line 312
;312:	if (!ent->inuse) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $233
CNSTI4 0
RETI4
ADDRGP4 $232
JUMPV
LABELV $233
line 313
;313:	if (!ent->r.linked) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
NEI4 $235
CNSTI4 0
RETI4
ADDRGP4 $232
JUMPV
LABELV $235
line 314
;314:        if ( !(g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_LMS ||g_instantgib.integer || g_rockets.integer || g_elimination_allgametypes.integer || g_gametype.integer==GT_CTF_ELIMINATION)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $237
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
EQI4 $237
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 g_instantgib+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $237
ADDRGP4 g_rockets+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $237
ADDRGP4 g_elimination_allgametypes+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $237
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $237
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $237
line 315
;315:	&& (ent->r.svFlags & SVF_NOCLIENT) ) return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $232
JUMPV
LABELV $237
line 316
;316:	memcpy( state, &ent->s, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 228
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 317
;317:	return qtrue;
CNSTI4 1
RETI4
LABELV $232
endproc BotAI_GetEntityState 8 12
export BotAI_GetSnapshotEntity
proc BotAI_GetSnapshotEntity 8 12
line 325
;318:}
;319:
;320:/*
;321:==================
;322:BotAI_GetSnapshotEntity
;323:==================
;324:*/
;325:int BotAI_GetSnapshotEntity( int clientNum, int sequence, entityState_t *state ) {
line 328
;326:	int		entNum;
;327:
;328:	entNum = trap_BotGetSnapshotEntity( clientNum, sequence );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_BotGetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 329
;329:	if ( entNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $246
line 330
;330:		memset(state, 0, sizeof(entityState_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 228
ARGI4
ADDRGP4 memset
CALLP4
pop
line 331
;331:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $245
JUMPV
LABELV $246
line 334
;332:	}
;333:
;334:	BotAI_GetEntityState( entNum, state );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 336
;335:
;336:	return sequence + 1;
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $245
endproc BotAI_GetSnapshotEntity 8 12
export BotAI_BotInitialChat
proc BotAI_BotInitialChat 56 44
line 344
;337:}
;338:
;339:/*
;340:==================
;341:BotAI_BotInitialChat
;342:==================
;343:*/
;344:void QDECL BotAI_BotInitialChat( bot_state_t *bs, char *type, ... ) {
line 354
;345:	int		i, mcontext;
;346:	va_list	ap;
;347:	char	*p;
;348:	char	*vars[MAX_MATCHVARIABLES];
;349:	
;350://if(!NpcFactionProp(bs, NP_CHAT, 0)){
;351://        return; // spbot no chat
;352://}
;353:
;354:	memset(vars, 0, sizeof(vars));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 memset
CALLP4
pop
line 355
;355:	va_start(ap, type);
ADDRLP4 40
ADDRFP4 4+4
ASGNP4
line 356
;356:	p = va_arg(ap, char *);
ADDRLP4 48
ADDRLP4 40
INDIRP4
CNSTU4 4
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 48
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
ASGNP4
line 357
;357:	for (i = 0; i < MAX_MATCHVARIABLES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $250
line 358
;358:		if( !p ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $254
line 359
;359:			break;
ADDRGP4 $252
JUMPV
LABELV $254
line 361
;360:		}
;361:		vars[i] = p;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 362
;362:		p = va_arg(ap, char *);
ADDRLP4 52
ADDRLP4 40
INDIRP4
CNSTU4 4
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
ASGNP4
line 363
;363:	}
LABELV $251
line 357
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $250
LABELV $252
line 364
;364:	va_end(ap);
ADDRLP4 40
CNSTP4 0
ASGNP4
line 366
;365:
;366:	mcontext = BotSynonymContext(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotSynonymContext
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 52
INDIRI4
ASGNI4
line 368
;367:
;368:	trap_BotInitialChat( bs->cs, type, mcontext, vars[0], vars[1], vars[2], vars[3], vars[4], vars[5], vars[6], vars[7] );
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8+4
INDIRP4
ARGP4
ADDRLP4 8+8
INDIRP4
ARGP4
ADDRLP4 8+12
INDIRP4
ARGP4
ADDRLP4 8+16
INDIRP4
ARGP4
ADDRLP4 8+20
INDIRP4
ARGP4
ADDRLP4 8+24
INDIRP4
ARGP4
ADDRLP4 8+28
INDIRP4
ARGP4
ADDRGP4 trap_BotInitialChat
CALLV
pop
line 369
;369:}
LABELV $248
endproc BotAI_BotInitialChat 56 44
export BotTestAAS
proc BotTestAAS 64 16
line 377
;370:
;371:
;372:/*
;373:==================
;374:BotTestAAS
;375:==================
;376:*/
;377:void BotTestAAS(vec3_t origin) {
line 381
;378:	int areanum;
;379:	aas_areainfo_t info;
;380:
;381:	trap_Cvar_Update(&bot_testsolid);
ADDRGP4 bot_testsolid
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 382
;382:	trap_Cvar_Update(&bot_testclusters);
ADDRGP4 bot_testclusters
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 383
;383:	if (bot_testsolid.integer) {
ADDRGP4 bot_testsolid+12
INDIRI4
CNSTI4 0
EQI4 $264
line 384
;384:		if (!trap_AAS_Initialized()) return;
ADDRLP4 56
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $267
ADDRGP4 $263
JUMPV
LABELV $267
line 385
;385:		areanum = BotPointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 386
;386:		if (areanum) BotAI_Print(PRT_MESSAGE, "\remtpy area");
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $269
CNSTI4 1
ARGI4
ADDRGP4 $271
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
ADDRGP4 $265
JUMPV
LABELV $269
line 387
;387:		else BotAI_Print(PRT_MESSAGE, "\r^1SOLID area");
CNSTI4 1
ARGI4
ADDRGP4 $272
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 388
;388:	}
ADDRGP4 $265
JUMPV
LABELV $264
line 389
;389:	else if (bot_testclusters.integer) {
ADDRGP4 bot_testclusters+12
INDIRI4
CNSTI4 0
EQI4 $273
line 390
;390:		if (!trap_AAS_Initialized()) return;
ADDRLP4 56
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $276
ADDRGP4 $263
JUMPV
LABELV $276
line 391
;391:		areanum = BotPointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 392
;392:		if (!areanum)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $278
line 393
;393:			BotAI_Print(PRT_MESSAGE, "\r^1Solid!                              ");
CNSTI4 1
ARGI4
ADDRGP4 $280
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
ADDRGP4 $279
JUMPV
LABELV $278
line 394
;394:		else {
line 395
;395:			trap_AAS_AreaInfo(areanum, &info);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 396
;396:			BotAI_Print(PRT_MESSAGE, "\rarea %d, cluster %d       ", areanum, info.cluster);
CNSTI4 1
ARGI4
ADDRGP4 $281
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 397
;397:		}
LABELV $279
line 398
;398:	}
LABELV $273
LABELV $265
line 399
;399:}
LABELV $263
endproc BotTestAAS 64 16
export BotReportStatus
proc BotReportStatus 564 24
line 406
;400:
;401:/*
;402:==================
;403:BotReportStatus
;404:==================
;405:*/
;406:void BotReportStatus(bot_state_t *bs) {
line 411
;407:	char goalname[MAX_MESSAGE_SIZE];
;408:	char netname[MAX_MESSAGE_SIZE];
;409:	char *leader, flagstatus[32];
;410:	//
;411:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 412
;412:	if (Q_stricmp(netname, bs->teamleader) == 0) leader = "L";
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 548
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
NEI4 $284
ADDRLP4 288
ADDRGP4 $286
ASGNP4
ADDRGP4 $285
JUMPV
LABELV $284
line 413
;413:	else leader = " ";
ADDRLP4 288
ADDRGP4 $287
ASGNP4
LABELV $285
line 415
;414:
;415:	strcpy(flagstatus, "  ");
ADDRLP4 256
ARGP4
ADDRGP4 $288
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 416
;416:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 552
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 5
EQI4 $291
ADDRLP4 552
INDIRI4
CNSTI4 10
NEI4 $289
LABELV $291
line 417
;417:		if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 0
EQI4 $290
line 418
;418:			if (BotTeam(bs) == TEAM_RED) strcpy(flagstatus, S_COLOR_RED"F ");
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 560
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 560
INDIRI4
CNSTI4 1
NEI4 $294
ADDRLP4 256
ARGP4
ADDRGP4 $296
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $290
JUMPV
LABELV $294
line 419
;419:			else strcpy(flagstatus, S_COLOR_BLUE"F ");
ADDRLP4 256
ARGP4
ADDRGP4 $297
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 420
;420:		}
line 421
;421:	}
ADDRGP4 $290
JUMPV
LABELV $289
line 422
;422:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $298
line 423
;423:		if (Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 0
EQI4 $299
line 424
;424:			if (BotTeam(bs) == TEAM_RED) strcpy(flagstatus, S_COLOR_RED"F ");
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 560
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 560
INDIRI4
CNSTI4 1
NEI4 $302
ADDRLP4 256
ARGP4
ADDRGP4 $296
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $299
JUMPV
LABELV $302
line 425
;425:			else strcpy(flagstatus, S_COLOR_BLUE"F ");
ADDRLP4 256
ARGP4
ADDRGP4 $297
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 426
;426:		}
line 427
;427:	}
ADDRGP4 $299
JUMPV
LABELV $298
line 428
;428:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $304
line 429
;429:		if (BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 0
EQI4 $306
line 430
;430:			if (BotTeam(bs) == TEAM_RED) Com_sprintf(flagstatus, sizeof(flagstatus), S_COLOR_RED"%2d", bs->inventory[INVENTORY_REDCUBE]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 560
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 560
INDIRI4
CNSTI4 1
NEI4 $308
ADDRLP4 256
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $310
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $309
JUMPV
LABELV $308
line 431
;431:			else Com_sprintf(flagstatus, sizeof(flagstatus), S_COLOR_BLUE"%2d", bs->inventory[INVENTORY_BLUECUBE]);
ADDRLP4 256
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $311
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $309
line 432
;432:		}
LABELV $306
line 433
;433:	}
LABELV $304
LABELV $299
LABELV $290
line 435
;434:
;435:	switch(bs->ltgtype) {
ADDRLP4 556
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 1
LTI4 $312
ADDRLP4 556
INDIRI4
CNSTI4 17
GTI4 $312
ADDRLP4 556
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $344-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $344
address $315
address $317
address $319
address $329
address $331
address $333
address $325
address $325
address $327
address $321
address $323
address $337
address $335
address $312
address $312
address $339
address $341
code
LABELV $315
line 437
;436:		case LTG_TEAMHELP:
;437:		{
line 438
;438:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 439
;439:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: helping %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $316
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 440
;440:			break;
ADDRGP4 $313
JUMPV
LABELV $317
line 443
;441:		}
;442:		case LTG_TEAMACCOMPANY:
;443:		{
line 444
;444:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 445
;445:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: accompanying %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $318
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 446
;446:			break;
ADDRGP4 $313
JUMPV
LABELV $319
line 449
;447:		}
;448:		case LTG_DEFENDKEYAREA:
;449:		{
line 450
;450:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 451
;451:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: defending %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $320
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 452
;452:			break;
ADDRGP4 $313
JUMPV
LABELV $321
line 455
;453:		}
;454:		case LTG_GETITEM:
;455:		{
line 456
;456:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 457
;457:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: getting item %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $322
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 458
;458:			break;
ADDRGP4 $313
JUMPV
LABELV $323
line 461
;459:		}
;460:		case LTG_KILL:
;461:		{
line 462
;462:			ClientName(bs->teamgoal.entitynum, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 463
;463:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: killing %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $324
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 464
;464:			break;
ADDRGP4 $313
JUMPV
LABELV $325
line 468
;465:		}
;466:		case LTG_CAMP:
;467:		case LTG_CAMPORDER:
;468:		{
line 469
;469:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: camping\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $326
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 470
;470:			break;
ADDRGP4 $313
JUMPV
LABELV $327
line 473
;471:		}
;472:		case LTG_PATROL:
;473:		{
line 474
;474:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: patrolling\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $328
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 475
;475:			break;
ADDRGP4 $313
JUMPV
LABELV $329
line 478
;476:		}
;477:		case LTG_GETFLAG:
;478:		{
line 479
;479:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: capturing flag\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $330
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 480
;480:			break;
ADDRGP4 $313
JUMPV
LABELV $331
line 483
;481:		}
;482:		case LTG_RUSHBASE:
;483:		{
line 484
;484:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: rushing base\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $332
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 485
;485:			break;
ADDRGP4 $313
JUMPV
LABELV $333
line 488
;486:		}
;487:		case LTG_RETURNFLAG:
;488:		{
line 489
;489:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: returning flag\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $334
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 490
;490:			break;
ADDRGP4 $313
JUMPV
LABELV $335
line 493
;491:		}
;492:		case LTG_ATTACKENEMYBASE:
;493:		{
line 494
;494:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: attacking the enemy base\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $336
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 495
;495:			break;
ADDRGP4 $313
JUMPV
LABELV $337
line 498
;496:		}
;497:		case LTG_HARVEST:
;498:		{
line 499
;499:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: harvesting\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $338
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 500
;500:			break;
ADDRGP4 $313
JUMPV
LABELV $339
line 503
;501:		}
;502:		case LTG_POINTA:
;503:		{
line 504
;504:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: going for point A\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $340
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 505
;505:			break;
ADDRGP4 $313
JUMPV
LABELV $341
line 508
;506:		}
;507:		case LTG_POINTB:
;508:		{
line 509
;509:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: going for point B\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $342
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 510
;510:			break;
ADDRGP4 $313
JUMPV
LABELV $312
line 513
;511:		}
;512:		default:
;513:		{
line 514
;514:			BotAI_Print(PRT_MESSAGE, "%-20s%s%s: roaming\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $343
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 515
;515:			break;
LABELV $313
line 518
;516:		}
;517:	}
;518:}
LABELV $283
endproc BotReportStatus 564 24
export BotTeamplayReport
proc BotTeamplayReport 1056 12
line 525
;519:
;520:/*
;521:==================
;522:BotTeamplayReport
;523:==================
;524:*/
;525:void BotTeamplayReport(void) {
line 529
;526:	int i;
;527:	char buf[MAX_INFO_STRING];
;528:
;529:	BotAI_Print(PRT_MESSAGE, S_COLOR_RED"RED\n");
CNSTI4 1
ARGI4
ADDRGP4 $347
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 530
;530:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $348
line 532
;531:		//
;532:		if ( !botstates[i] || !botstates[i]->inuse ) continue;
ADDRLP4 1028
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $354
ADDRLP4 1028
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $352
LABELV $354
ADDRGP4 $349
JUMPV
LABELV $352
line 534
;533:		//
;534:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 536
;535:		//if no config string or no name
;536:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $358
ADDRLP4 4
ARGP4
ADDRGP4 $357
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $355
LABELV $358
ADDRGP4 $349
JUMPV
LABELV $355
line 538
;537:		//skip spectators
;538:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_RED) {
ADDRLP4 4
ARGP4
ADDRGP4 $361
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
ADDRLP4 1048
INDIRI4
CNSTI4 1
NEI4 $359
line 539
;539:			BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 540
;540:		}
LABELV $359
line 541
;541:	}
LABELV $349
line 530
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $351
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $362
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $348
LABELV $362
line 542
;542:	BotAI_Print(PRT_MESSAGE, S_COLOR_BLUE"BLUE\n");
CNSTI4 1
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 543
;543:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $367
JUMPV
LABELV $364
line 545
;544:		//
;545:		if ( !botstates[i] || !botstates[i]->inuse ) continue;
ADDRLP4 1032
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $370
ADDRLP4 1032
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $368
LABELV $370
ADDRGP4 $365
JUMPV
LABELV $368
line 547
;546:		//
;547:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 549
;548:		//if no config string or no name
;549:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $373
ADDRLP4 4
ARGP4
ADDRGP4 $357
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $371
LABELV $373
ADDRGP4 $365
JUMPV
LABELV $371
line 551
;550:		//skip spectators
;551:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_BLUE) {
ADDRLP4 4
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 1048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 2
NEI4 $374
line 552
;552:			BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 553
;553:		}
LABELV $374
line 554
;554:	}
LABELV $365
line 543
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $367
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $376
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $364
LABELV $376
line 555
;555:}
LABELV $346
endproc BotTeamplayReport 1056 12
export BotSetInfoConfigString
proc BotSetInfoConfigString 884 16
line 562
;556:
;557:/*
;558:==================
;559:BotSetInfoConfigString
;560:==================
;561:*/
;562:void BotSetInfoConfigString(bot_state_t *bs) {
line 569
;563:	char goalname[MAX_MESSAGE_SIZE];
;564:	char netname[MAX_MESSAGE_SIZE];
;565:	char action[MAX_MESSAGE_SIZE];
;566:	char *leader, carrying[32], *cs;
;567:	bot_goal_t goal;
;568:	//
;569:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 570
;570:	if (Q_stricmp(netname, bs->teamleader) == 0) leader = "L";
ADDRLP4 256
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 864
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 864
INDIRI4
CNSTI4 0
NEI4 $378
ADDRLP4 544
ADDRGP4 $286
ASGNP4
ADDRGP4 $379
JUMPV
LABELV $378
line 571
;571:	else leader = " ";
ADDRLP4 544
ADDRGP4 $287
ASGNP4
LABELV $379
line 573
;572:
;573:	strcpy(carrying, "  ");
ADDRLP4 512
ARGP4
ADDRGP4 $288
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 574
;574:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 868
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 868
INDIRI4
CNSTI4 5
EQI4 $382
ADDRLP4 868
INDIRI4
CNSTI4 10
NEI4 $380
LABELV $382
line 575
;575:		if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 872
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 872
INDIRI4
CNSTI4 0
EQI4 $381
line 576
;576:			strcpy(carrying, "F ");
ADDRLP4 512
ARGP4
ADDRGP4 $385
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 577
;577:		}
line 578
;578:	}
ADDRGP4 $381
JUMPV
LABELV $380
line 579
;579:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $386
line 580
;580:		if (Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 872
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 872
INDIRI4
CNSTI4 0
EQI4 $387
line 581
;581:			strcpy(carrying, "F ");
ADDRLP4 512
ARGP4
ADDRGP4 $385
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 582
;582:		}
line 583
;583:	}
ADDRGP4 $387
JUMPV
LABELV $386
line 584
;584:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $390
line 585
;585:		if (BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 872
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 872
INDIRI4
CNSTI4 0
EQI4 $392
line 586
;586:			if (BotTeam(bs) == TEAM_RED) Com_sprintf(carrying, sizeof(carrying), "%2d", bs->inventory[INVENTORY_REDCUBE]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 876
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 876
INDIRI4
CNSTI4 1
NEI4 $394
ADDRLP4 512
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $396
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $395
JUMPV
LABELV $394
line 587
;587:			else Com_sprintf(carrying, sizeof(carrying), "%2d", bs->inventory[INVENTORY_BLUECUBE]);
ADDRLP4 512
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $396
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $395
line 588
;588:		}
LABELV $392
line 589
;589:	}
LABELV $390
LABELV $387
LABELV $381
line 591
;590:
;591:	switch(bs->ltgtype) {
ADDRLP4 872
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 872
INDIRI4
CNSTI4 1
LTI4 $397
ADDRLP4 872
INDIRI4
CNSTI4 17
GTI4 $397
ADDRLP4 872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $430-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $430
address $400
address $402
address $404
address $414
address $416
address $418
address $410
address $410
address $412
address $406
address $408
address $422
address $420
address $397
address $397
address $424
address $426
code
LABELV $400
line 593
;592:		case LTG_TEAMHELP:
;593:		{
line 594
;594:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 595
;595:			Com_sprintf(action, sizeof(action), "helping %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $401
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 596
;596:			break;
ADDRGP4 $398
JUMPV
LABELV $402
line 599
;597:		}
;598:		case LTG_TEAMACCOMPANY:
;599:		{
line 600
;600:			EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 601
;601:			Com_sprintf(action, sizeof(action), "accompanying %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $403
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 602
;602:			break;
ADDRGP4 $398
JUMPV
LABELV $404
line 605
;603:		}
;604:		case LTG_DEFENDKEYAREA:
;605:		{
line 606
;606:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 607
;607:			Com_sprintf(action, sizeof(action), "defending %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $405
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 608
;608:			break;
ADDRGP4 $398
JUMPV
LABELV $406
line 611
;609:		}
;610:		case LTG_GETITEM:
;611:		{
line 612
;612:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 613
;613:			Com_sprintf(action, sizeof(action), "getting item %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $407
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 614
;614:			break;
ADDRGP4 $398
JUMPV
LABELV $408
line 617
;615:		}
;616:		case LTG_KILL:
;617:		{
line 618
;618:			ClientName(bs->teamgoal.entitynum, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 619
;619:			Com_sprintf(action, sizeof(action), "killing %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $409
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 620
;620:			break;
ADDRGP4 $398
JUMPV
LABELV $410
line 624
;621:		}
;622:		case LTG_CAMP:
;623:		case LTG_CAMPORDER:
;624:		{
line 625
;625:			Com_sprintf(action, sizeof(action), "camping");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $411
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 626
;626:			break;
ADDRGP4 $398
JUMPV
LABELV $412
line 629
;627:		}
;628:		case LTG_PATROL:
;629:		{
line 630
;630:			Com_sprintf(action, sizeof(action), "patrolling");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $413
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 631
;631:			break;
ADDRGP4 $398
JUMPV
LABELV $414
line 634
;632:		}
;633:		case LTG_GETFLAG:
;634:		{
line 635
;635:			Com_sprintf(action, sizeof(action), "capturing flag");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $415
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 636
;636:			break;
ADDRGP4 $398
JUMPV
LABELV $416
line 639
;637:		}
;638:		case LTG_RUSHBASE:
;639:		{
line 640
;640:			Com_sprintf(action, sizeof(action), "rushing base");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $417
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 641
;641:			break;
ADDRGP4 $398
JUMPV
LABELV $418
line 644
;642:		}
;643:		case LTG_RETURNFLAG:
;644:		{
line 645
;645:			Com_sprintf(action, sizeof(action), "returning flag");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $419
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 646
;646:			break;
ADDRGP4 $398
JUMPV
LABELV $420
line 649
;647:		}
;648:		case LTG_ATTACKENEMYBASE:
;649:		{
line 650
;650:			Com_sprintf(action, sizeof(action), "attacking the enemy base");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $421
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 651
;651:			break;
ADDRGP4 $398
JUMPV
LABELV $422
line 654
;652:		}
;653:		case LTG_HARVEST:
;654:		{
line 655
;655:			Com_sprintf(action, sizeof(action), "harvesting");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $423
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 656
;656:			break;
ADDRGP4 $398
JUMPV
LABELV $424
line 659
;657:		}
;658:		case LTG_POINTA:
;659:		{
line 660
;660:			Com_sprintf(action, sizeof(action), "going for point A");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $425
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 661
;661:			break;
ADDRGP4 $398
JUMPV
LABELV $426
line 664
;662:		}
;663:		case LTG_POINTB:
;664:		{
line 665
;665:			Com_sprintf(action, sizeof(action), "going for point B");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $427
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 666
;666:			break;
ADDRGP4 $398
JUMPV
LABELV $397
line 669
;667:		}
;668:		default:
;669:		{
line 670
;670:			trap_BotGetTopGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 808
ARGP4
ADDRGP4 trap_BotGetTopGoal
CALLI4
pop
line 671
;671:			trap_BotGoalName(goal.number, goalname, sizeof(goalname));
ADDRLP4 808+44
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 672
;672:			Com_sprintf(action, sizeof(action), "roaming %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $429
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 673
;673:			break;
LABELV $398
line 676
;674:		}
;675:	}
;676:  	cs = va("l\\%s\\c\\%s\\a\\%s",
ADDRGP4 $432
ARGP4
ADDRLP4 544
INDIRP4
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 880
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 548
ADDRLP4 880
INDIRP4
ASGNP4
line 680
;677:				leader,
;678:				carrying,
;679:				action);
;680:  	trap_SetConfigstring (CS_BOTINFO + bs->client, cs);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ARGI4
ADDRLP4 548
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 681
;681:}
LABELV $377
endproc BotSetInfoConfigString 884 16
export BotUpdateInfoConfigStrings
proc BotUpdateInfoConfigStrings 1044 12
line 688
;682:
;683:/*
;684:==============
;685:BotUpdateInfoConfigStrings
;686:==============
;687:*/
;688:void BotUpdateInfoConfigStrings(void) {
line 692
;689:	int i;
;690:	char buf[MAX_INFO_STRING];
;691:
;692:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $437
JUMPV
LABELV $434
line 694
;693:		//
;694:		if ( !botstates[i] || !botstates[i]->inuse )
ADDRLP4 1028
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $440
ADDRLP4 1028
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $438
LABELV $440
line 695
;695:			continue;
ADDRGP4 $435
JUMPV
LABELV $438
line 697
;696:		//
;697:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 699
;698:		//if no config string or no name
;699:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n")))
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $443
ADDRLP4 4
ARGP4
ADDRGP4 $357
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $441
LABELV $443
line 700
;700:			continue;
ADDRGP4 $435
JUMPV
LABELV $441
line 701
;701:		BotSetInfoConfigString(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotSetInfoConfigString
CALLV
pop
line 702
;702:	}
LABELV $435
line 692
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $437
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $444
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $434
LABELV $444
line 703
;703:}
LABELV $433
endproc BotUpdateInfoConfigStrings 1044 12
export BotInterbreedBots
proc BotInterbreedBots 1056 20
line 710
;704:
;705:/*
;706:==============
;707:BotInterbreedBots
;708:==============
;709:*/
;710:void BotInterbreedBots(void) {
line 716
;711:	float ranks[MAX_CLIENTS];
;712:	int parent1, parent2, child;
;713:	int i;
;714:
;715:	// get rankings for all the bots
;716:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $446
line 717
;717:		if ( botstates[i] && botstates[i]->inuse ) {
ADDRLP4 1040
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $450
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $450
line 718
;718:			ranks[i] = botstates[i]->num_kills * 2 - botstates[i]->num_deaths;
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1044
INDIRI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 1048
INDIRP4
CNSTI4 10136
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 1048
INDIRP4
CNSTI4 10132
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 719
;719:		}
ADDRGP4 $451
JUMPV
LABELV $450
line 720
;720:		else {
line 721
;721:			ranks[i] = -1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTF4 3212836864
ASGNF4
line 722
;722:		}
LABELV $451
line 723
;723:	}
LABELV $447
line 716
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $446
line 725
;724:
;725:	if (trap_GeneticParentsAndChildSelection(MAX_CLIENTS, ranks, &parent1, &parent2, &child)) {
CNSTI4 256
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ADDRGP4 trap_GeneticParentsAndChildSelection
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $452
line 726
;726:		trap_BotInterbreedGoalFuzzyLogic(botstates[parent1]->gs, botstates[parent2]->gs, botstates[child]->gs);
ADDRLP4 1044
CNSTI4 2
ASGNI4
ADDRLP4 1048
ADDRGP4 botstates
ASGNP4
ADDRLP4 1052
CNSTI4 10632
ASGNI4
ADDRLP4 1032
INDIRI4
ADDRLP4 1044
INDIRI4
LSHI4
ADDRLP4 1048
INDIRP4
ADDP4
INDIRP4
ADDRLP4 1052
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
INDIRI4
ADDRLP4 1044
INDIRI4
LSHI4
ADDRLP4 1048
INDIRP4
ADDP4
INDIRP4
ADDRLP4 1052
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
INDIRI4
ADDRLP4 1044
INDIRI4
LSHI4
ADDRLP4 1048
INDIRP4
ADDP4
INDIRP4
ADDRLP4 1052
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotInterbreedGoalFuzzyLogic
CALLV
pop
line 727
;727:		trap_BotMutateGoalFuzzyLogic(botstates[child]->gs, 1);
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_BotMutateGoalFuzzyLogic
CALLV
pop
line 728
;728:	}
LABELV $452
line 730
;729:	// reset the kills and deaths
;730:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $454
line 731
;731:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $458
ADDRLP4 1044
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $458
line 732
;732:			botstates[i]->num_kills = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 10136
ADDP4
CNSTI4 0
ASGNI4
line 733
;733:			botstates[i]->num_deaths = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 10132
ADDP4
CNSTI4 0
ASGNI4
line 734
;734:		}
LABELV $458
line 735
;735:	}
LABELV $455
line 730
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $454
line 736
;736:}
LABELV $445
endproc BotInterbreedBots 1056 20
export BotWriteInterbreeded
proc BotWriteInterbreeded 24 8
line 743
;737:
;738:/*
;739:==============
;740:BotWriteInterbreeded
;741:==============
;742:*/
;743:void BotWriteInterbreeded(char *filename) {
line 747
;744:	float rank, bestrank;
;745:	int i, bestbot;
;746:
;747:	bestrank = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 748
;748:	bestbot = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 750
;749:	// get the best bot
;750:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $461
line 751
;751:		if ( botstates[i] && botstates[i]->inuse ) {
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $465
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $465
line 752
;752:			rank = botstates[i]->num_kills * 2 - botstates[i]->num_deaths;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
CNSTI4 10136
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 10132
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 753
;753:		}
ADDRGP4 $466
JUMPV
LABELV $465
line 754
;754:		else {
line 755
;755:			rank = -1;
ADDRLP4 4
CNSTF4 3212836864
ASGNF4
line 756
;756:		}
LABELV $466
line 757
;757:		if (rank > bestrank) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $467
line 758
;758:			bestrank = rank;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ASGNF4
line 759
;759:			bestbot = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 760
;760:		}
LABELV $467
line 761
;761:	}
LABELV $462
line 750
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $461
line 762
;762:	if (bestbot >= 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $469
line 764
;763:		//write out the new goal fuzzy logic
;764:		trap_BotSaveGoalFuzzyLogic(botstates[bestbot]->gs, filename);
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_BotSaveGoalFuzzyLogic
CALLV
pop
line 765
;765:	}
LABELV $469
line 766
;766:}
LABELV $460
endproc BotWriteInterbreeded 24 8
export BotInterbreedEndMatch
proc BotInterbreedEndMatch 8 8
line 775
;767:
;768:/*
;769:==============
;770:BotInterbreedEndMatch
;771:
;772:add link back into ExitLevel?
;773:==============
;774:*/
;775:void BotInterbreedEndMatch(void) {
line 777
;776:
;777:	if (!bot_interbreed) return;
ADDRGP4 bot_interbreed
INDIRI4
CNSTI4 0
NEI4 $472
ADDRGP4 $471
JUMPV
LABELV $472
line 778
;778:	bot_interbreedmatchcount++;
ADDRLP4 0
ADDRGP4 bot_interbreedmatchcount
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 779
;779:	if (bot_interbreedmatchcount >= bot_interbreedcycle.integer) {
ADDRGP4 bot_interbreedmatchcount
INDIRI4
ADDRGP4 bot_interbreedcycle+12
INDIRI4
LTI4 $474
line 780
;780:		bot_interbreedmatchcount = 0;
ADDRGP4 bot_interbreedmatchcount
CNSTI4 0
ASGNI4
line 782
;781:		//
;782:		trap_Cvar_Update(&bot_interbreedwrite);
ADDRGP4 bot_interbreedwrite
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 783
;783:		if (strlen(bot_interbreedwrite.string)) {
ADDRGP4 bot_interbreedwrite+16
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $477
line 784
;784:			BotWriteInterbreeded(bot_interbreedwrite.string);
ADDRGP4 bot_interbreedwrite+16
ARGP4
ADDRGP4 BotWriteInterbreeded
CALLV
pop
line 785
;785:			trap_Cvar_Set("bot_interbreedwrite", "");
ADDRGP4 $481
ARGP4
ADDRGP4 $482
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 786
;786:		}
LABELV $477
line 787
;787:		BotInterbreedBots();
ADDRGP4 BotInterbreedBots
CALLV
pop
line 788
;788:	}
LABELV $474
line 789
;789:}
LABELV $471
endproc BotInterbreedEndMatch 8 8
export BotInterbreeding
proc BotInterbreeding 16 20
line 796
;790:
;791:/*
;792:==============
;793:BotInterbreeding
;794:==============
;795:*/
;796:void BotInterbreeding(void) {
line 799
;797:	int i;
;798:
;799:	trap_Cvar_Update(&bot_interbreedchar);
ADDRGP4 bot_interbreedchar
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 800
;800:	if (!strlen(bot_interbreedchar.string)) return;
ADDRGP4 bot_interbreedchar+16
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $484
ADDRGP4 $483
JUMPV
LABELV $484
line 802
;801:	//make sure we are in tournament mode
;802:	if (gametype != GT_TOURNAMENT) {
ADDRGP4 gametype
INDIRI4
CNSTI4 3
EQI4 $487
line 803
;803:		trap_Cvar_Set("g_gametype", va("%d", GT_TOURNAMENT));
ADDRGP4 $490
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $489
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 804
;804:		ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 805
;805:		return;
ADDRGP4 $483
JUMPV
LABELV $487
line 808
;806:	}
;807:	//shutdown all the bots
;808:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $491
line 809
;809:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $495
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $495
line 810
;810:			BotAIShutdownClient(botstates[i]->client, qfalse);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 811
;811:		}
LABELV $495
line 812
;812:	}
LABELV $492
line 808
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $491
line 814
;813:	//make sure all item weight configs are reloaded and Not shared
;814:	trap_BotLibVarSet("bot_reloadcharacters", "1");
ADDRGP4 $497
ARGP4
ADDRGP4 $498
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 816
;815:	//add a number of bots using the desired bot character
;816:	for (i = 0; i < bot_interbreedbots.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $502
JUMPV
LABELV $499
line 817
;817:		trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s 4 free %i %s%d\n",
ADDRGP4 $504
ARGP4
ADDRGP4 bot_interbreedchar+16
ARGP4
CNSTI4 50
ADDRLP4 0
INDIRI4
MULI4
ARGI4
ADDRGP4 bot_interbreedchar+16
ARGP4
ADDRLP4 0
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
line 819
;818:						bot_interbreedchar.string, i * 50, bot_interbreedchar.string, i) );
;819:	}
LABELV $500
line 816
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $502
ADDRLP4 0
INDIRI4
ADDRGP4 bot_interbreedbots+12
INDIRI4
LTI4 $499
line 821
;820:	//
;821:	trap_Cvar_Set("bot_interbreedchar", "");
ADDRGP4 $507
ARGP4
ADDRGP4 $482
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 822
;822:	bot_interbreed = qtrue;
ADDRGP4 bot_interbreed
CNSTI4 1
ASGNI4
line 823
;823:}
LABELV $483
endproc BotInterbreeding 16 20
export BotEntityInfo
proc BotEntityInfo 0 8
line 830
;824:
;825:/*
;826:==============
;827:BotEntityInfo
;828:==============
;829:*/
;830:void BotEntityInfo(int entnum, aas_entityinfo_t *info) {
line 831
;831:	trap_AAS_EntityInfo(entnum, info);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_AAS_EntityInfo
CALLV
pop
line 832
;832:}
LABELV $508
endproc BotEntityInfo 0 8
export NumBots
proc NumBots 0 0
line 839
;833:
;834:/*
;835:==============
;836:NumBots
;837:==============
;838:*/
;839:int NumBots(void) {
line 840
;840:	return numbots;
ADDRGP4 numbots
INDIRI4
RETI4
LABELV $509
endproc NumBots 0 0
export BotTeamLeader
proc BotTeamLeader 12 4
line 848
;841:}
;842:
;843:/*
;844:==============
;845:BotTeamLeader
;846:==============
;847:*/
;848:int BotTeamLeader(bot_state_t *bs) {
line 851
;849:	int leader;
;850:
;851:	leader = ClientFromName(bs->teamleader);
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 852
;852:	if (leader < 0) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $511
CNSTI4 0
RETI4
ADDRGP4 $510
JUMPV
LABELV $511
line 853
;853:	if (!botstates[leader] || !botstates[leader]->inuse) return qfalse;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $515
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $513
LABELV $515
CNSTI4 0
RETI4
ADDRGP4 $510
JUMPV
LABELV $513
line 854
;854:	return qtrue;
CNSTI4 1
RETI4
LABELV $510
endproc BotTeamLeader 12 4
export BotChangeViewAngle
proc BotChangeViewAngle 16 4
line 862
;855:}
;856:
;857:/*
;858:==============
;859:BotChangeViewAngle
;860:==============
;861:*/
;862:float BotChangeViewAngle(float angle, float ideal_angle, float speed) {
line 865
;863:	float move;
;864:
;865:	angle = AngleMod(angle);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 866
;866:	ideal_angle = AngleMod(ideal_angle);
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 867
;867:	if (angle == ideal_angle) return angle;
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
NEF4 $517
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $516
JUMPV
LABELV $517
line 868
;868:	move = ideal_angle - angle;
ADDRLP4 0
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
ASGNF4
line 869
;869:	if (ideal_angle > angle) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
LEF4 $519
line 870
;870:		if (move > 180.0) move -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $520
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 871
;871:	}
ADDRGP4 $520
JUMPV
LABELV $519
line 872
;872:	else {
line 873
;873:		if (move < -180.0) move += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $523
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $523
line 874
;874:	}
LABELV $520
line 875
;875:	if (move > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $525
line 876
;876:		if (move > speed) move = speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $526
ADDRLP4 0
ADDRFP4 8
INDIRF4
ASGNF4
line 877
;877:	}
ADDRGP4 $526
JUMPV
LABELV $525
line 878
;878:	else {
line 879
;879:		if (move < -speed) move = -speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $529
ADDRLP4 0
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $529
line 880
;880:	}
LABELV $526
line 881
;881:	return AngleMod(angle + move);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
RETF4
LABELV $516
endproc BotChangeViewAngle 16 4
export BotChangeViewAngles
proc BotChangeViewAngles 80 16
line 889
;882:}
;883:
;884:/*
;885:==============
;886:BotChangeViewAngles
;887:==============
;888:*/
;889:void BotChangeViewAngles(bot_state_t *bs, float thinktime) {
line 893
;890:	float diff, factor, maxchange, anglespeed, disired_speed;
;891:	int i;
;892:
;893:	if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $532
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $532
line 895
;894:	//
;895:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 0
LTI4 $534
line 896
;896:		factor = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_VIEW_FACTOR, 0.01f, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTF4 1008981770
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 28
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 28
INDIRF4
ASGNF4
line 897
;897:		maxchange = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_VIEW_MAXCHANGE, 1, 1800);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
CNSTF4 1065353216
ARGF4
CNSTF4 1155596288
ARGF4
ADDRLP4 32
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 898
;898:	}
ADDRGP4 $535
JUMPV
LABELV $534
line 899
;899:	else {
line 900
;900:		factor = 0.05f;
ADDRLP4 16
CNSTF4 1028443341
ASGNF4
line 901
;901:		maxchange = 360;
ADDRLP4 8
CNSTF4 1135869952
ASGNF4
line 902
;902:	}
LABELV $535
line 903
;903:	if (maxchange < 240) maxchange = 240;
ADDRLP4 8
INDIRF4
CNSTF4 1131413504
GEF4 $536
ADDRLP4 8
CNSTF4 1131413504
ASGNF4
LABELV $536
line 904
;904:	maxchange *= thinktime;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 905
;905:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $538
line 907
;906:		//
;907:		if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $542
line 909
;908:			//smooth slowdown view model
;909:			diff = abs(AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]));
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 10668
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 10680
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 40
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
CVIF4 4
ASGNF4
line 910
;910:			anglespeed = diff * factor;
ADDRLP4 4
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 911
;911:			if (anglespeed > maxchange) anglespeed = maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $545
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $545
line 912
;912:			bs->viewangles[i] = BotChangeViewAngle(bs->viewangles[i],
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 10668
ADDP4
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 10680
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 BotChangeViewAngle
CALLF4
ASGNF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRF4
ASGNF4
line 914
;913:											bs->ideal_viewangles[i], anglespeed);
;914:		}
ADDRGP4 $543
JUMPV
LABELV $542
line 915
;915:		else {
line 917
;916:			//over reaction view model
;917:			bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 918
;918:			bs->ideal_viewangles[i] = AngleMod(bs->ideal_viewangles[i]);
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRF4
ASGNF4
line 919
;919:			diff = AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]);
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 10668
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 10680
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 52
INDIRF4
ASGNF4
line 920
;920:			disired_speed = diff * factor;
ADDRLP4 20
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 921
;921:			bs->viewanglespeed[i] += (bs->viewanglespeed[i] - disired_speed);
ADDRLP4 56
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10692
ADDP4
ADDP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ADDF4
ASGNF4
line 922
;922:			if (bs->viewanglespeed[i] > 180) bs->viewanglespeed[i] = maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10692
ADDP4
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $547
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10692
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $547
line 923
;923:			if (bs->viewanglespeed[i] < -180) bs->viewanglespeed[i] = -maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10692
ADDP4
ADDP4
INDIRF4
CNSTF4 3274964992
GEF4 $549
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10692
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $549
line 924
;924:			anglespeed = bs->viewanglespeed[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10692
ADDP4
ADDP4
INDIRF4
ASGNF4
line 925
;925:			if (anglespeed > maxchange) anglespeed = maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $551
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $551
line 926
;926:			if (anglespeed < -maxchange) anglespeed = -maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
NEGF4
GEF4 $553
ADDRLP4 4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $553
line 927
;927:			bs->viewangles[i] += anglespeed;
ADDRLP4 64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 928
;928:			bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 68
INDIRP4
ADDRLP4 72
INDIRF4
ASGNF4
line 930
;929:			//demping
;930:			bs->viewanglespeed[i] *= 0.45 * (1 - factor);
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10692
ADDP4
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1055286886
CNSTF4 1065353216
ADDRLP4 16
INDIRF4
SUBF4
MULF4
MULF4
ASGNF4
line 931
;931:		}
LABELV $543
line 934
;932:		//BotAI_Print(PRT_MESSAGE, "ideal_angles %f %f\n", bs->ideal_viewangles[0], bs->ideal_viewangles[1], bs->ideal_viewangles[2]);`
;933:		//bs->viewangles[i] = bs->ideal_viewangles[i];
;934:	}
LABELV $539
line 905
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $538
line 936
;935:	//bs->viewangles[PITCH] = 0;
;936:	if (bs->viewangles[PITCH] > 180) bs->viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $555
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $555
line 938
;937:	//elementary action: view
;938:	trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 939
;939:}
LABELV $531
endproc BotChangeViewAngles 80 16
export BotInputToUserCommand
proc BotInputToUserCommand 152 16
line 946
;940:
;941:/*
;942:==============
;943:BotInputToUserCommand
;944:==============
;945:*/
;946:void BotInputToUserCommand(bot_input_t *bi, usercmd_t *ucmd, int delta_angles[3], int time, int pmflags) {
line 956
;947:	vec3_t angles, forward, right;
;948:	short temp;
;949:	int j;
;950:	float f, r, u, m;
;951:	int movevalue;
;952:	
;953:	
;954:
;955:	//clear the whole structure
;956:	memset(ucmd, 0, sizeof(usercmd_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 memset
CALLP4
pop
line 958
;957:	//the duration for the user command in milli seconds
;958:	ucmd->serverTime = time;
ADDRFP4 4
INDIRP4
ADDRFP4 12
INDIRI4
ASGNI4
line 960
;959:	//
;960:	if (bi->actionflags & ACTION_DELAYEDJUMP) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $558
line 961
;961:		bi->actionflags |= ACTION_JUMP;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 962
;962:		bi->actionflags &= ~ACTION_DELAYEDJUMP;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 963
;963:	}
LABELV $558
line 965
;964:	//set the buttons
;965:	if (bi->actionflags & ACTION_RESPAWN) ucmd->buttons = BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $560
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
LABELV $560
line 966
;966:	if (bi->actionflags & ACTION_ATTACK) ucmd->buttons |= BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $562
ADDRLP4 64
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
LABELV $562
line 967
;967:	if (bi->actionflags & ACTION_TALK) ucmd->buttons |= BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $564
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $564
line 968
;968:	if (bi->actionflags & ACTION_GESTURE) ucmd->buttons |= BUTTON_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $566
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $566
line 969
;969:	if (bi->actionflags & ACTION_USE) ucmd->buttons |= BUTTON_USE_HOLDABLE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $568
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $568
line 970
;970:	if (bi->actionflags & ACTION_WALK) ucmd->buttons |= BUTTON_WALKING;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $570
ADDRLP4 80
CNSTI4 16
ASGNI4
ADDRLP4 84
ADDRFP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
ADDRLP4 80
INDIRI4
BORI4
ASGNI4
LABELV $570
line 971
;971:	if (bi->actionflags & ACTION_AFFIRMATIVE) ucmd->buttons |= BUTTON_AFFIRMATIVE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $572
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
LABELV $572
line 972
;972:	if (bi->actionflags & ACTION_NEGATIVE) ucmd->buttons |= BUTTON_NEGATIVE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $574
ADDRLP4 92
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
LABELV $574
line 973
;973:	if (bi->actionflags & ACTION_GETFLAG) ucmd->buttons |= BUTTON_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $576
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
LABELV $576
line 974
;974:	if (bi->actionflags & ACTION_GUARDBASE) ucmd->buttons |= BUTTON_GUARDBASE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
EQI4 $578
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $578
line 975
;975:	if (bi->actionflags & ACTION_PATROL) ucmd->buttons |= BUTTON_PATROL;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $580
ADDRLP4 104
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $580
line 976
;976:	if (bi->actionflags & ACTION_FOLLOWME) ucmd->buttons |= BUTTON_FOLLOWME;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
CNSTI4 0
EQI4 $582
ADDRLP4 108
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
LABELV $582
line 978
;977:	//
;978:	ucmd->weapon = bi->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 981
;979:	//set the view angles
;980:	//NOTE: the ucmd->angles are the angles WITHOUT the delta angles
;981:	ucmd->angles[PITCH] = ANGLE2SHORT(bi->viewangles[PITCH]);
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 982
;982:	ucmd->angles[YAW] = ANGLE2SHORT(bi->viewangles[YAW]);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 983
;983:	ucmd->angles[ROLL] = ANGLE2SHORT(bi->viewangles[ROLL]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 985
;984:	//subtract the delta angles
;985:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $584
line 986
;986:		temp = ucmd->angles[j] - delta_angles[j];
ADDRLP4 112
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
ADDRLP4 112
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRI4
SUBI4
CVII2 4
ASGNI2
line 994
;987:		/*NOTE: disabled because temp should be mod first
;988:		if ( j == PITCH ) {
;989:			// don't let the player look up or down more than 90 degrees
;990:			if ( temp > 16000 ) temp = 16000;
;991:			else if ( temp < -16000 ) temp = -16000;
;992:		}
;993:		*/
;994:		ucmd->angles[j] = temp;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
ASGNI4
line 995
;995:	}
LABELV $585
line 985
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $584
line 997
;996:
;997:	if (pmflags & PMF_FORCE_WALK)
ADDRFP4 16
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $588
line 998
;998:		movevalue = 60;
ADDRLP4 60
CNSTI4 60
ASGNI4
ADDRGP4 $589
JUMPV
LABELV $588
line 1000
;999:	else
;1000:		movevalue = 127;
ADDRLP4 60
CNSTI4 127
ASGNI4
LABELV $589
line 1002
;1001:
;1002:	if (movevalue <= 60)
ADDRLP4 60
INDIRI4
CNSTI4 60
GTI4 $590
line 1003
;1003:		ucmd->buttons |= BUTTON_WALKING;
ADDRLP4 112
CNSTI4 16
ASGNI4
ADDRLP4 116
ADDRFP4 4
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
ADDRLP4 112
INDIRI4
BORI4
ASGNI4
LABELV $590
line 1008
;1004:
;1005:	//NOTE: movement is relative to the REAL view angles
;1006:	//get the horizontal forward and right vector
;1007:	//get the pitch in the range [-180, 180]
;1008:	if (bi->dir[2]) angles[PITCH] = bi->viewangles[PITCH];
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 0
EQF4 $592
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $593
JUMPV
LABELV $592
line 1009
;1009:	else angles[PITCH] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
LABELV $593
line 1010
;1010:	angles[YAW] = bi->viewangles[YAW];
ADDRLP4 24+4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1011
;1011:	angles[ROLL] = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 1012
;1012:	AngleVectors(angles, forward, right, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1014
;1013:	//bot input speed is in the range [0, 400]
;1014:	bi->speed = bi->speed * movevalue / 400;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRLP4 60
INDIRI4
CVIF4 4
MULF4
CNSTF4 1137180672
DIVF4
ASGNF4
line 1016
;1015:	//set the view independent movement
;1016:	f = DotProduct(forward, bi->dir);
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 12
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1017
;1017:	r = DotProduct(right, bi->dir);
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 36
INDIRF4
ADDRLP4 128
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 128
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 128
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1018
;1018:	u = abs(forward[2]) * bi->dir[2];
ADDRLP4 12+8
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 132
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 132
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 1019
;1019:	m = fabs(f);
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 136
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 136
INDIRF4
ASGNF4
line 1021
;1020:
;1021:	if (fabs(r) > m) {
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 140
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $601
line 1022
;1022:		m = fabs(r);
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 144
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 144
INDIRF4
ASGNF4
line 1023
;1023:	}
LABELV $601
line 1025
;1024:
;1025:	if (fabs(u) > m) {
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 144
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 144
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $603
line 1026
;1026:		m = fabs(u);
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 148
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 148
INDIRF4
ASGNF4
line 1027
;1027:	}
LABELV $603
line 1029
;1028:
;1029:	if (m > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $605
line 1030
;1030:		f *= bi->speed / m;
ADDRLP4 56
ADDRLP4 56
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
MULF4
ASGNF4
line 1031
;1031:		r *= bi->speed / m;
ADDRLP4 48
ADDRLP4 48
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
MULF4
ASGNF4
line 1032
;1032:		u *= bi->speed / m;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
MULF4
ASGNF4
line 1033
;1033:	}
LABELV $605
line 1035
;1034:
;1035:	ucmd->forwardmove = f;
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
ADDRLP4 56
INDIRF4
CVFI4 4
CVII1 4
ASGNI1
line 1036
;1036:	ucmd->rightmove = r;
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
ADDRLP4 48
INDIRF4
CVFI4 4
CVII1 4
ASGNI1
line 1037
;1037:	ucmd->upmove = u;
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
ADDRLP4 52
INDIRF4
CVFI4 4
CVII1 4
ASGNI1
line 1039
;1038:
;1039:	if (bi->actionflags & ACTION_MOVEFORWARD) ucmd->forwardmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $607
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
CNSTI1 127
ASGNI1
LABELV $607
line 1040
;1040:	if (bi->actionflags & ACTION_MOVEBACK) ucmd->forwardmove = -127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $609
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
CNSTI1 -127
ASGNI1
LABELV $609
line 1041
;1041:	if (bi->actionflags & ACTION_MOVELEFT) ucmd->rightmove = -127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $611
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
CNSTI1 -127
ASGNI1
LABELV $611
line 1042
;1042:	if (bi->actionflags & ACTION_MOVERIGHT) ucmd->rightmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $613
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
CNSTI1 127
ASGNI1
LABELV $613
line 1044
;1043:	//jump/moveup
;1044:	if (bi->actionflags & ACTION_JUMP) ucmd->upmove = 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $615
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
CNSTI1 127
ASGNI1
LABELV $615
line 1046
;1045:	//crouch/movedown
;1046:	if (bi->actionflags & ACTION_CROUCH) ucmd->upmove = -127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $617
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
CNSTI1 -127
ASGNI1
LABELV $617
line 1047
;1047:}
LABELV $557
endproc BotInputToUserCommand 152 16
export BotUpdateInput
proc BotUpdateInput 64 20
line 1054
;1048:
;1049:/*
;1050:==============
;1051:BotUpdateInput
;1052:==============
;1053:*/
;1054:void BotUpdateInput(bot_state_t *bs, int time, int elapsed_time) {
line 1059
;1055:	bot_input_t bi;
;1056:	int j;
;1057:
;1058:	//add the delta angles to the bot's current view angles
;1059:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $620
line 1060
;1060:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 10668
ADDP4
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ARGF4
ADDRLP4 56
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRF4
ASGNF4
line 1061
;1061:	}
LABELV $621
line 1059
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $620
line 1063
;1062:	//change the bot view angles
;1063:	BotChangeViewAngles(bs, (float) elapsed_time / 1000);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 BotChangeViewAngles
CALLV
pop
line 1065
;1064:	//retrieve the bot input
;1065:	trap_EA_GetInput(bs->client, (float) time / 1000, &bi);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 trap_EA_GetInput
CALLV
pop
line 1067
;1066:	//respawn hack
;1067:	if (bi.actionflags & ACTION_RESPAWN) {
ADDRLP4 4+32
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $624
line 1068
;1068:		if (bs->lastucmd.buttons & BUTTON_ATTACK) bi.actionflags &= ~(ACTION_RESPAWN|ACTION_ATTACK);
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $627
ADDRLP4 4+32
ADDRLP4 4+32
INDIRI4
CNSTI4 -10
BANDI4
ASGNI4
LABELV $627
line 1069
;1069:	}
LABELV $624
line 1071
;1070:	//convert the bot input to a usercmd
;1071:	BotInputToUserCommand(&bi, &bs->lastucmd, bs->cur_ps.delta_angles, time, bs->cur_ps.pm_flags);
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotInputToUserCommand
CALLV
pop
line 1073
;1072:	//subtract the delta angles
;1073:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $630
line 1074
;1074:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 10668
ADDP4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
SUBF4
ARGF4
ADDRLP4 60
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRF4
ASGNF4
line 1075
;1075:	}
LABELV $631
line 1073
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $630
line 1076
;1076:}
LABELV $619
endproc BotUpdateInput 64 20
export BotAIRegularUpdate
proc BotAIRegularUpdate 0 0
line 1083
;1077:
;1078:/*
;1079:==============
;1080:BotAIRegularUpdate
;1081:==============
;1082:*/
;1083:void BotAIRegularUpdate(void) {
line 1084
;1084:	if (regularupdate_time < FloatTime()) {
ADDRGP4 regularupdate_time
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $635
line 1085
;1085:		trap_BotUpdateEntityItems();
ADDRGP4 trap_BotUpdateEntityItems
CALLV
pop
line 1086
;1086:		regularupdate_time = FloatTime() + 0.3;
ADDRGP4 regularupdate_time
ADDRGP4 floattime
INDIRF4
CNSTF4 1050253722
ADDF4
ASGNF4
line 1087
;1087:	}
LABELV $635
line 1088
;1088:}
LABELV $634
endproc BotAIRegularUpdate 0 0
export RemoveColorEscapeSequences
proc RemoveColorEscapeSequences 24 0
line 1095
;1089:
;1090:/*
;1091:==============
;1092:RemoveColorEscapeSequences
;1093:==============
;1094:*/
;1095:void RemoveColorEscapeSequences( char *text ) {
line 1098
;1096:	int i, l;
;1097:
;1098:	l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1099
;1099:	for ( i = 0; text[i]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $641
JUMPV
LABELV $638
line 1100
;1100:		if (Q_IsColorString(&text[i])) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $642
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $642
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $642
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $642
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $642
line 1101
;1101:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1102
;1102:			continue;
ADDRGP4 $639
JUMPV
LABELV $642
line 1104
;1103:		}
;1104:		if (text[i] > 0x7E)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 126
LEI4 $644
line 1105
;1105:			continue;
ADDRGP4 $639
JUMPV
LABELV $644
line 1106
;1106:		text[l++] = text[i];
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 1107
;1107:	}
LABELV $639
line 1099
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $641
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $638
line 1108
;1108:	text[l] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1109
;1109:}
LABELV $637
endproc RemoveColorEscapeSequences 24 0
export BotAI
proc BotAI 1092 12
line 1116
;1110:
;1111:/*
;1112:==============
;1113:BotAI
;1114:==============
;1115:*/
;1116:int BotAI(int client, float thinktime) {
line 1121
;1117:	bot_state_t *bs;
;1118:	char buf[1024], *args;
;1119:	int j;
;1120:
;1121:	trap_EA_ResetInput(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_EA_ResetInput
CALLV
pop
line 1123
;1122:	//
;1123:	bs = botstates[client];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1124
;1124:	if (!bs || !bs->inuse) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $649
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $647
LABELV $649
line 1125
;1125:		BotAI_Print(PRT_FATAL, "BotAI: client %d is not setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $650
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 1126
;1126:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $646
JUMPV
LABELV $647
line 1130
;1127:	}
;1128:
;1129:	//retrieve the current client state
;1130:	BotAI_GetClientState( client, &bs->cur_ps );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
ADDRGP4 $652
JUMPV
LABELV $651
line 1133
;1131:
;1132:	//retrieve any waiting server commands
;1133:	while( trap_BotGetServerCommand(client, buf, sizeof(buf)) ) {
line 1135
;1134:		//have buf point to the command and args to the command arguments
;1135:		args = strchr( buf, ' ');
ADDRLP4 12
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1040
INDIRP4
ASGNP4
line 1136
;1136:		if (!args) continue;
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $654
ADDRGP4 $652
JUMPV
LABELV $654
line 1137
;1137:		*args++ = '\0';
ADDRLP4 1044
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 1044
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI1 0
ASGNI1
line 1140
;1138:
;1139:		//remove color espace sequences from the arguments
;1140:		RemoveColorEscapeSequences( args );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 RemoveColorEscapeSequences
CALLV
pop
line 1142
;1141:
;1142:		if (!Q_stricmp(buf, "cp "))
ADDRLP4 12
ARGP4
ADDRGP4 $658
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $656
line 1143
;1143:			{ /*CenterPrintf*/ }
ADDRGP4 $657
JUMPV
LABELV $656
line 1144
;1144:		else if (!Q_stricmp(buf, "cs"))
ADDRLP4 12
ARGP4
ADDRGP4 $661
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $659
line 1145
;1145:			{ /*ConfigStringModified*/ }
ADDRGP4 $660
JUMPV
LABELV $659
line 1146
;1146:		else if (!Q_stricmp(buf, "print")) {
ADDRLP4 12
ARGP4
ADDRGP4 $664
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $662
line 1148
;1147:			//remove first and last quote from the chat message
;1148:			memmove(args, args+1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1149
;1149:			args[strlen(args)-1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1150
;1150:			trap_BotQueueConsoleMessage(bs->cs, CMS_NORMAL, args);
ADDRLP4 4
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 1151
;1151:		}
ADDRGP4 $663
JUMPV
LABELV $662
line 1152
;1152:		else if (!Q_stricmp(buf, "chat")) {
ADDRLP4 12
ARGP4
ADDRGP4 $667
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $665
line 1154
;1153:			//remove first and last quote from the chat message
;1154:			memmove(args, args+1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1155
;1155:			args[strlen(args)-1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1156
;1156:			trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, args);
ADDRLP4 4
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 1157
;1157:		}
ADDRGP4 $666
JUMPV
LABELV $665
line 1158
;1158:		else if (!Q_stricmp(buf, "tchat")) {
ADDRLP4 12
ARGP4
ADDRGP4 $670
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $668
line 1160
;1159:			//remove first and last quote from the chat message
;1160:			memmove(args, args+1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1161
;1161:			args[strlen(args)-1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1162
;1162:			trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, args);
ADDRLP4 4
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 1163
;1163:		}
ADDRGP4 $669
JUMPV
LABELV $668
line 1165
;1164:#ifdef MISSIONPACK
;1165:		else if (!Q_stricmp(buf, "vchat")) {
ADDRLP4 12
ARGP4
ADDRGP4 $673
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $671
line 1166
;1166:			BotVoiceChatCommand(bs, SAY_ALL, args);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 BotVoiceChatCommand
CALLI4
pop
line 1167
;1167:		}
ADDRGP4 $672
JUMPV
LABELV $671
line 1168
;1168:		else if (!Q_stricmp(buf, "vtchat")) {
ADDRLP4 12
ARGP4
ADDRGP4 $676
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $674
line 1169
;1169:			BotVoiceChatCommand(bs, SAY_TEAM, args);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 BotVoiceChatCommand
CALLI4
pop
line 1170
;1170:		}
ADDRGP4 $675
JUMPV
LABELV $674
line 1171
;1171:		else if (!Q_stricmp(buf, "vtell")) {
ADDRLP4 12
ARGP4
ADDRGP4 $679
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $677
line 1172
;1172:			BotVoiceChatCommand(bs, SAY_TELL, args);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 BotVoiceChatCommand
CALLI4
pop
line 1173
;1173:		}
ADDRGP4 $678
JUMPV
LABELV $677
line 1175
;1174:#endif
;1175:		else if (!Q_stricmp(buf, "scores"))
ADDRLP4 12
ARGP4
ADDRGP4 $682
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $680
line 1176
;1176:			{ /*FIXME: parse scores?*/ }
ADDRGP4 $681
JUMPV
LABELV $680
line 1177
;1177:		else if (!Q_stricmp(buf, "clientLevelShot"))
ADDRLP4 12
ARGP4
ADDRGP4 $685
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $683
line 1178
;1178:			{ /*ignore*/ }
LABELV $683
LABELV $681
LABELV $678
LABELV $675
LABELV $672
LABELV $669
LABELV $666
LABELV $663
LABELV $660
LABELV $657
line 1179
;1179:	}
LABELV $652
line 1133
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1040
ADDRGP4 trap_BotGetServerCommand
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $651
line 1181
;1180:	//add the delta angles to the bot's current view angles
;1181:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $686
line 1182
;1182:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1044
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 10668
ADDP4
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 1044
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ARGF4
ADDRLP4 1056
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1052
INDIRP4
ADDRLP4 1056
INDIRF4
ASGNF4
line 1183
;1183:	}
LABELV $687
line 1181
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $686
line 1185
;1184:	//increase the local time of the bot
;1185:	bs->ltime += thinktime;
ADDRLP4 1044
ADDRLP4 4
INDIRP4
CNSTI4 10164
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
ASGNF4
line 1187
;1186:	//
;1187:	bs->thinktime = thinktime;
ADDRLP4 4
INDIRP4
CNSTI4 5936
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 1189
;1188:	//origin of the bot
;1189:	VectorCopy(bs->cur_ps.origin, bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 5940
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRB
ASGNB 12
line 1191
;1190:	//eye coordinates of the bot
;1191:	VectorCopy(bs->cur_ps.origin, bs->eye);
ADDRLP4 4
INDIRP4
CNSTI4 5968
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRB
ASGNB 12
line 1192
;1192:	bs->eye[2] += bs->cur_ps.viewheight;
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1194
;1193:	//get the area the bot is in
;1194:	bs->areanum = BotPointAreaNum(bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 1068
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 5980
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 1196
;1195:	//the real AI
;1196:	BotDeathmatchAI(bs, thinktime);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 BotDeathmatchAI
CALLV
pop
line 1198
;1197:	//set the weapon selection every AI frame
;1198:	trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1200
;1199:	//subtract the delta angles
;1200:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $690
line 1201
;1201:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 1076
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1084
ADDRLP4 1076
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 10668
ADDP4
ADDP4
ASGNP4
ADDRLP4 1084
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 1076
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
SUBF4
ARGF4
ADDRLP4 1088
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1084
INDIRP4
ADDRLP4 1088
INDIRF4
ASGNF4
line 1202
;1202:	}
LABELV $691
line 1200
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $690
line 1204
;1203:	//everything was ok
;1204:	return qtrue;
CNSTI4 1
RETI4
LABELV $646
endproc BotAI 1092 12
export BotScheduleBotThink
proc BotScheduleBotThink 12 0
line 1212
;1205:}
;1206:
;1207:/*
;1208:==================
;1209:BotScheduleBotThink
;1210:==================
;1211:*/
;1212:void BotScheduleBotThink(void) {
line 1215
;1213:	int i, botnum;
;1214:
;1215:	botnum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1217
;1216:
;1217:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $695
line 1218
;1218:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $701
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $699
LABELV $701
line 1219
;1219:			continue;
ADDRGP4 $696
JUMPV
LABELV $699
line 1222
;1220:		}
;1221:		//initialize the bot think residual time
;1222:		botstates[i]->botthink_residual = bot_thinktime.integer * botnum / numbots;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 bot_thinktime+12
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 numbots
INDIRI4
DIVI4
ASGNI4
line 1223
;1223:		botnum++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1224
;1224:	}
LABELV $696
line 1217
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $695
line 1225
;1225:}
LABELV $694
endproc BotScheduleBotThink 12 0
export BotWriteSessionData
proc BotWriteSessionData 20 72
line 1232
;1226:
;1227:/*
;1228:==============
;1229:BotWriteSessionData
;1230:==============
;1231:*/
;1232:void BotWriteSessionData(bot_state_t *bs) {
line 1236
;1233:	const char	*s;
;1234:	const char	*var;
;1235:
;1236:	s = va(
ADDRGP4 $704
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 10860
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 10868
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 10884
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 10912
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 10920
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 10924
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 10916
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 10872
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 10876
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 10880
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 10888
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 10892
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 10896
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 10900
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 10904
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 10908
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1260
;1237:			"%i %i %i %i %i %i %i %i"
;1238:			" %f %f %f"
;1239:			" %f %f %f"
;1240:			" %f %f %f",
;1241:		bs->lastgoal_decisionmaker,
;1242:		bs->lastgoal_ltgtype,
;1243:		bs->lastgoal_teammate,
;1244:		bs->lastgoal_teamgoal.areanum,
;1245:		bs->lastgoal_teamgoal.entitynum,
;1246:		bs->lastgoal_teamgoal.flags,
;1247:		bs->lastgoal_teamgoal.iteminfo,
;1248:		bs->lastgoal_teamgoal.number,
;1249:		bs->lastgoal_teamgoal.origin[0],
;1250:		bs->lastgoal_teamgoal.origin[1],
;1251:		bs->lastgoal_teamgoal.origin[2],
;1252:		bs->lastgoal_teamgoal.mins[0],
;1253:		bs->lastgoal_teamgoal.mins[1],
;1254:		bs->lastgoal_teamgoal.mins[2],
;1255:		bs->lastgoal_teamgoal.maxs[0],
;1256:		bs->lastgoal_teamgoal.maxs[1],
;1257:		bs->lastgoal_teamgoal.maxs[2]
;1258:		);
;1259:
;1260:	var = va( "botsession%i", bs->client );
ADDRGP4 $705
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1262
;1261:
;1262:	trap_Cvar_Set( var, s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1263
;1263:}
LABELV $703
endproc BotWriteSessionData 20 72
export BotReadSessionData
proc BotReadSessionData 1036 76
line 1270
;1264:
;1265:/*
;1266:==============
;1267:BotReadSessionData
;1268:==============
;1269:*/
;1270:void BotReadSessionData(bot_state_t *bs) {
line 1274
;1271:	char	s[MAX_STRING_CHARS];
;1272:	const char	*var;
;1273:
;1274:	var = va( "botsession%i", bs->client );
ADDRGP4 $705
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 1275
;1275:	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1277
;1276:
;1277:	sscanf(s,
ADDRLP4 0
ARGP4
ADDRGP4 $704
ARGP4
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 10860
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10864
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10868
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10884
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10912
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10920
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10924
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10916
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10872
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10876
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10880
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10888
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10892
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10896
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10900
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10904
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 10908
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 1300
;1278:			"%i %i %i %i %i %i %i %i"
;1279:			" %f %f %f"
;1280:			" %f %f %f"
;1281:			" %f %f %f",
;1282:		&bs->lastgoal_decisionmaker,
;1283:		&bs->lastgoal_ltgtype,
;1284:		&bs->lastgoal_teammate,
;1285:		&bs->lastgoal_teamgoal.areanum,
;1286:		&bs->lastgoal_teamgoal.entitynum,
;1287:		&bs->lastgoal_teamgoal.flags,
;1288:		&bs->lastgoal_teamgoal.iteminfo,
;1289:		&bs->lastgoal_teamgoal.number,
;1290:		&bs->lastgoal_teamgoal.origin[0],
;1291:		&bs->lastgoal_teamgoal.origin[1],
;1292:		&bs->lastgoal_teamgoal.origin[2],
;1293:		&bs->lastgoal_teamgoal.mins[0],
;1294:		&bs->lastgoal_teamgoal.mins[1],
;1295:		&bs->lastgoal_teamgoal.mins[2],
;1296:		&bs->lastgoal_teamgoal.maxs[0],
;1297:		&bs->lastgoal_teamgoal.maxs[1],
;1298:		&bs->lastgoal_teamgoal.maxs[2]
;1299:		);
;1300:}
LABELV $706
endproc BotReadSessionData 1036 76
export BotHasWaypoint
proc BotHasWaypoint 8 8
line 1304
;1301:
;1302:// does one of the bots patrolpoint match the given origin?
;1303:qboolean BotHasWaypoint(bot_state_t* bs, vec3_t wpOrigin)
;1304:{
line 1305
;1305:	bot_waypoint_t* wp = bs->patrolpoints;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
ASGNP4
line 1307
;1306:
;1307:	if( !wp )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $711
line 1308
;1308:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $710
line 1311
;1309:
;1310:	while( wp )
;1311:	{
line 1312
;1312:		if( VectorCompare(wpOrigin, wp->goal.origin) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $713
line 1313
;1313:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $707
JUMPV
LABELV $713
line 1314
;1314:		wp = wp->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
line 1315
;1315:	}
LABELV $711
line 1310
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $710
line 1317
;1316:
;1317:	return qfalse;
CNSTI4 0
RETI4
LABELV $707
endproc BotHasWaypoint 8 8
export BotInitPatrolPoints
proc BotInitPatrolPoints 48 16
line 1321
;1318:}
;1319:
;1320:void BotInitPatrolPoints(bot_state_t* bs, char* target)
;1321:{
line 1322
;1322:	gentity_t* wpEnt = G_Find (NULL, FOFS(targetname), target );
CNSTP4 0
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 4
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
line 1324
;1323:	
;1324:	if (!wpEnt)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $719
line 1325
;1325:		return;
ADDRGP4 $715
JUMPV
LABELV $718
line 1328
;1326:
;1327:	while( wpEnt )
;1328:	{
line 1331
;1329:		bot_waypoint_t *newWP;
;1330:		bot_waypoint_t *botWpTail;
;1331:		gentity_t* curWpEnt = wpEnt;
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
line 1334
;1332:		int wpArea;
;1333:
;1334:		wpEnt = G_Find (NULL, FOFS(targetname), curWpEnt->target );		
CNSTP4 0
ARGP4
CNSTI4 724
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 1337
;1335:
;1336:		// circular linked waypoints -> patrol loop
;1337:		if( BotHasWaypoint(bs, curWpEnt->s.origin) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 BotHasWaypoint
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $721
line 1338
;1338:		{
line 1339
;1339:			bs->patrolflags |= PATROL_LOOP;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 13188
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1340
;1340:			break;
ADDRGP4 $720
JUMPV
LABELV $721
line 1343
;1341:		}
;1342:
;1343:		wpArea = BotPointAreaNum( curWpEnt->s.origin );	
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 1344
;1344:		if( !wpArea )
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $723
line 1345
;1345:		{
line 1346
;1346:			G_Printf("no AAS area for waypoint at %s \n", vtos(curWpEnt->s.origin) );
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $725
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1347
;1347:			return;
ADDRGP4 $715
JUMPV
LABELV $723
line 1349
;1348:		}
;1349:		if( !trap_AAS_AreaReachability(wpArea) )
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $726
line 1350
;1350:		{
line 1351
;1351:			G_Printf("waypoint at %s is unreachable \n", vtos(curWpEnt->s.origin) );
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $728
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1352
;1352:			return;
ADDRGP4 $715
JUMPV
LABELV $726
line 1356
;1353:		}
;1354:
;1355:		// alloc waypoint
;1356:		newWP = BotCreateWayPoint("", curWpEnt->s.origin, curWpEnt->wait, wpArea);
ADDRGP4 $482
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BotCreateWayPoint
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 44
INDIRP4
ASGNP4
line 1357
;1357:		if( !newWP ) continue;
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $729
ADDRGP4 $719
JUMPV
LABELV $729
line 1360
;1358:		
;1359:		// add to bot's list
;1360:		if( bs->patrolpoints )
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $731
line 1361
;1361:		{
line 1362
;1362:			botWpTail = bs->patrolpoints;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $734
JUMPV
LABELV $733
line 1364
;1363:			while( botWpTail->next )
;1364:				botWpTail = botWpTail->next;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $734
line 1363
ADDRLP4 8
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $733
line 1366
;1365:
;1366:			botWpTail->next = newWP;
ADDRLP4 8
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 1367
;1367:			newWP->prev = botWpTail;
ADDRLP4 20
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 1368
;1368:		}
ADDRGP4 $732
JUMPV
LABELV $731
line 1370
;1369:		else
;1370:			bs->patrolpoints = newWP;
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
LABELV $732
line 1371
;1371:	}
LABELV $719
line 1327
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $718
LABELV $720
line 1373
;1372:
;1373:	if( bs->patrolpoints )
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $736
line 1374
;1374:	{
line 1375
;1375:		bs->curpatrolpoint = bs->patrolpoints;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 13184
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
ASGNP4
line 1376
;1376:		bs->ltgtype = LTG_PATROL;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 9
ASGNI4
line 1377
;1377:	}
LABELV $736
line 1379
;1378:	// more elegant: add newWP to the head of the list, then set curpatrolpoint to the tail
;1379:}
LABELV $715
endproc BotInitPatrolPoints 48 16
export BotAISetupClient
proc BotAISetupClient 1540 16
line 1386
;1380:
;1381:/*
;1382:==============
;1383:BotAISetupClient
;1384:==============
;1385:*/
;1386:int BotAISetupClient(int client, struct bot_settings_s *settings, qboolean restart) {
line 1392
;1387:	char filename[MAX_PATH], name[MAX_PATH], gender[MAX_PATH];
;1388:	bot_state_t *bs;
;1389:	int errnum;
;1390:	char userinfo[MAX_INFO_STRING];
;1391:    //KK-OAX Changed to Tremulous's BG_Alloc
;1392:	if (!botstates[client]) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $739
line 1393
;1393:            if(!BG_CanAlloc(sizeof(bot_state_t))) {
CNSTU4 13192
ARGU4
ADDRLP4 1464
ADDRGP4 BG_CanAlloc
CALLI4
ASGNI4
ADDRLP4 1464
INDIRI4
CNSTI4 0
NEI4 $741
line 1395
;1394:                //We cannot run BG_Alloc, fail nicely
;1395:                BotAI_Print(PRT_FATAL, "BotAISetupClient: Not enough heap memory\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $743
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 1396
;1396:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $738
JUMPV
LABELV $741
line 1398
;1397:            }
;1398:            botstates[client] = BG_Alloc(sizeof(bot_state_t));
CNSTU4 13192
ARGU4
ADDRLP4 1468
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
ADDRLP4 1468
INDIRP4
ASGNP4
line 1400
;1399:            //BG_Allow will succed or terminate
;1400:        }
LABELV $739
line 1401
;1401:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1403
;1402:
;1403:	if (bs && bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $744
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $744
line 1404
;1404:		BotAI_Print(PRT_FATAL, "BotAISetupClient: client %d already setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $746
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 1405
;1405:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $738
JUMPV
LABELV $744
line 1408
;1406:	}
;1407:
;1408:	if (!trap_AAS_Initialized()) {
ADDRLP4 1468
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 1468
INDIRI4
CNSTI4 0
NEI4 $747
line 1409
;1409:		BotAI_Print(PRT_FATAL, "AAS not initialized\n");
CNSTI4 4
ARGI4
ADDRGP4 $749
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1410
;1410:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $738
JUMPV
LABELV $747
line 1414
;1411:	}
;1412:
;1413:	//load the bot character
;1414:	bs->character = trap_BotLoadCharacter(settings->characterfile, settings->skill);
ADDRLP4 1472
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1472
INDIRP4
ARGP4
ADDRLP4 1472
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ARGF4
ADDRLP4 1476
ADDRGP4 trap_BotLoadCharacter
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 10624
ADDP4
ADDRLP4 1476
INDIRI4
ASGNI4
line 1415
;1415:	if (!bs->character) {
ADDRLP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $750
line 1416
;1416:		BotAI_Print(PRT_FATAL, "couldn't load skill %f from %s\n", settings->skill, settings->characterfile);
CNSTI4 4
ARGI4
ADDRGP4 $752
ARGP4
ADDRLP4 1480
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ARGF4
ADDRLP4 1480
INDIRP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1417
;1417:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $738
JUMPV
LABELV $750
line 1420
;1418:	}
;1419:	//copy the settings
;1420:	memcpy(&bs->settings, settings, sizeof(bot_settings_t));
ADDRLP4 0
INDIRP4
CNSTI4 4616
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1316
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1422
;1421:	//allocate a goal state
;1422:	bs->gs = trap_BotAllocGoalState(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1480
ADDRGP4 trap_BotAllocGoalState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 10632
ADDP4
ADDRLP4 1480
INDIRI4
ASGNI4
line 1424
;1423:	//load the item weights
;1424:	trap_Characteristic_String(bs->character, CHARACTERISTIC_ITEMWEIGHTS, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1425
;1425:	errnum = trap_BotLoadItemWeights(bs->gs, filename);
ADDRLP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1484
ADDRGP4 trap_BotLoadItemWeights
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 1484
INDIRI4
ASGNI4
line 1426
;1426:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $753
line 1427
;1427:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1428
;1428:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $738
JUMPV
LABELV $753
line 1431
;1429:	}
;1430:	//allocate a weapon state
;1431:	bs->ws = trap_BotAllocWeaponState();
ADDRLP4 1488
ADDRGP4 trap_BotAllocWeaponState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 10640
ADDP4
ADDRLP4 1488
INDIRI4
ASGNI4
line 1433
;1432:	//load the weapon weights
;1433:	trap_Characteristic_String(bs->character, CHARACTERISTIC_WEAPONWEIGHTS, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1434
;1434:	errnum = trap_BotLoadWeaponWeights(bs->ws, filename);
ADDRLP4 0
INDIRP4
CNSTI4 10640
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1492
ADDRGP4 trap_BotLoadWeaponWeights
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 1492
INDIRI4
ASGNI4
line 1435
;1435:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $755
line 1436
;1436:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1437
;1437:		trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 10640
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1438
;1438:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $738
JUMPV
LABELV $755
line 1441
;1439:	}
;1440:	//allocate a chat state
;1441:	bs->cs = trap_BotAllocChatState();
ADDRLP4 1496
ADDRGP4 trap_BotAllocChatState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 10636
ADDP4
ADDRLP4 1496
INDIRI4
ASGNI4
line 1443
;1442:	//load the chat file
;1443:	trap_Characteristic_String(bs->character, CHARACTERISTIC_CHAT_FILE, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 21
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1444
;1444:	trap_Characteristic_String(bs->character, CHARACTERISTIC_CHAT_NAME, name, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 22
ARGI4
ADDRLP4 1320
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1445
;1445:	errnum = trap_BotLoadChatFile(bs->cs, filename, name);
ADDRLP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1320
ARGP4
ADDRLP4 1500
ADDRGP4 trap_BotLoadChatFile
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 1500
INDIRI4
ASGNI4
line 1446
;1446:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $757
line 1447
;1447:		trap_BotFreeChatState(bs->cs);
ADDRLP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeChatState
CALLV
pop
line 1448
;1448:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1449
;1449:		trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 10640
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1450
;1450:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $738
JUMPV
LABELV $757
line 1453
;1451:	}
;1452:	//get the gender characteristic
;1453:	trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1455
;1454:	//set the chat gender
;1455:	if (*gender == 'f' || *gender == 'F') trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 1504
ADDRLP4 152
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1504
INDIRI4
CNSTI4 102
EQI4 $761
ADDRLP4 1504
INDIRI4
CNSTI4 70
NEI4 $759
LABELV $761
ADDRLP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $760
JUMPV
LABELV $759
line 1456
;1456:	else if (*gender == 'm' || *gender == 'M') trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 1508
ADDRLP4 152
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1508
INDIRI4
CNSTI4 109
EQI4 $764
ADDRLP4 1508
INDIRI4
CNSTI4 77
NEI4 $762
LABELV $764
ADDRLP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $763
JUMPV
LABELV $762
line 1457
;1457:	else trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
ADDRLP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
LABELV $763
LABELV $760
line 1459
;1458:
;1459:	bs->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 1460
;1460:	bs->client = client;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1461
;1461:	bs->entitynum = client;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1462
;1462:	bs->setupcount = 4;
ADDRLP4 0
INDIRP4
CNSTI4 10120
ADDP4
CNSTI4 4
ASGNI4
line 1463
;1463:	bs->entergame_time = FloatTime();
ADDRLP4 0
INDIRP4
CNSTI4 10168
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1464
;1464:	bs->ms = trap_BotAllocMoveState();
ADDRLP4 1512
ADDRGP4 trap_BotAllocMoveState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 10628
ADDP4
ADDRLP4 1512
INDIRI4
ASGNI4
line 1465
;1465:	bs->walker = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WALKER, 0, 1);
ADDRLP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 48
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1520
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 10160
ADDP4
ADDRLP4 1520
INDIRF4
ASGNF4
line 1467
;1466:	
;1467:	trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1469
;1468:	
;1469:	bs->spbot = atoi( Info_ValueForKey( userinfo, "singlebot" ) );
ADDRLP4 296
ARGP4
ADDRGP4 $765
ARGP4
ADDRLP4 1524
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1524
INDIRP4
ARGP4
ADDRLP4 1528
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 1528
INDIRI4
ASGNI4
line 1471
;1470:	
;1471:	numbots++;
ADDRLP4 1532
ADDRGP4 numbots
ASGNP4
ADDRLP4 1532
INDIRP4
ADDRLP4 1532
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1473
;1472:	
;1473:	if ( settings->waypoint ) {
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
CVPU4 4
CNSTU4 0
EQU4 $766
line 1474
;1474:		BotInitPatrolPoints(bs, settings->waypoint );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
ARGP4
ADDRGP4 BotInitPatrolPoints
CALLV
pop
line 1475
;1475:	}
LABELV $766
line 1477
;1476:
;1477:	if (trap_Cvar_VariableIntegerValue("bot_testichat")) {
ADDRGP4 $770
ARGP4
ADDRLP4 1536
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1536
INDIRI4
CNSTI4 0
EQI4 $768
line 1478
;1478:		trap_BotLibVarSet("bot_testichat", "1");
ADDRGP4 $770
ARGP4
ADDRGP4 $498
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1479
;1479:		BotChatTest(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotChatTest
CALLV
pop
line 1480
;1480:	}
LABELV $768
line 1482
;1481:	//NOTE: reschedule the bot thinking
;1482:	BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 1484
;1483:	//if interbreeding start with a mutation
;1484:	if (bot_interbreed) {
ADDRGP4 bot_interbreed
INDIRI4
CNSTI4 0
EQI4 $771
line 1485
;1485:		trap_BotMutateGoalFuzzyLogic(bs->gs, 1);
ADDRLP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_BotMutateGoalFuzzyLogic
CALLV
pop
line 1486
;1486:	}
LABELV $771
line 1488
;1487:	// if we kept the bot client
;1488:	if (restart) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $773
line 1489
;1489:		BotReadSessionData(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotReadSessionData
CALLV
pop
line 1490
;1490:	}
LABELV $773
line 1492
;1491:	//bot has been setup succesfully
;1492:	return qtrue;
CNSTI4 1
RETI4
LABELV $738
endproc BotAISetupClient 1540 16
export BotAIShutdownClient
proc BotAIShutdownClient 16 12
line 1500
;1493:}
;1494:
;1495:/*
;1496:==============
;1497:BotAIShutdownClient
;1498:==============
;1499:*/
;1500:int BotAIShutdownClient(int client, qboolean restart) {
line 1503
;1501:	bot_state_t *bs;
;1502:
;1503:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1504
;1504:	if (!bs || !bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $778
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $776
LABELV $778
line 1506
;1505:		//BotAI_Print(PRT_ERROR, "BotAIShutdownClient: client %d already shutdown\n", client);
;1506:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $775
JUMPV
LABELV $776
line 1509
;1507:	}
;1508:
;1509:	if (restart) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $779
line 1510
;1510:		BotWriteSessionData(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotWriteSessionData
CALLV
pop
line 1511
;1511:	}
LABELV $779
line 1513
;1512:
;1513:	if (BotChat_ExitGame(bs)) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotChat_ExitGame
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $781
line 1514
;1514:		trap_BotEnterChat(bs->cs, bs->client, CHAT_ALL);
ADDRLP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1515
;1515:	}
LABELV $781
line 1517
;1516:
;1517:	trap_BotFreeMoveState(bs->ms);
ADDRLP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeMoveState
CALLV
pop
line 1519
;1518:	//free the goal state`			
;1519:	trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1521
;1520:	//free the chat file
;1521:	trap_BotFreeChatState(bs->cs);
ADDRLP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeChatState
CALLV
pop
line 1523
;1522:	//free the weapon weights
;1523:	trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 10640
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1525
;1524:	//free the bot character
;1525:	trap_BotFreeCharacter(bs->character);
ADDRLP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeCharacter
CALLV
pop
line 1527
;1526:	//
;1527:	BotFreeWaypoints(bs->checkpoints);
ADDRLP4 0
INDIRP4
CNSTI4 13176
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1528
;1528:	BotFreeWaypoints(bs->patrolpoints);
ADDRLP4 0
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1530
;1529:	//clear activate goal stack
;1530:	BotClearActivateGoalStack(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1532
;1531:	//clear the bot state
;1532:	memset(bs, 0, sizeof(bot_state_t));
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 13192
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1534
;1533:	//set the inuse flag to qfalse
;1534:	bs->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1537
;1535:
;1536:	//there's one bot less
;1537:	numbots--;
ADDRLP4 12
ADDRGP4 numbots
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1539
;1538:	//everything went ok
;1539:	return qtrue;
CNSTI4 1
RETI4
LABELV $775
endproc BotAIShutdownClient 16 12
export BotResetState
proc BotResetState 1824 12
line 1550
;1540:}
;1541:
;1542:/*
;1543:==============
;1544:BotResetState
;1545:
;1546:called when a bot enters the intermission or observer mode and
;1547:when the level is changed
;1548:==============
;1549:*/
;1550:void BotResetState(bot_state_t *bs) {
line 1559
;1551:	int client, entitynum, inuse;
;1552:	int movestate, goalstate, chatstate, weaponstate;
;1553:	bot_settings_t settings;
;1554:	int character;
;1555:	playerState_t ps;							//current player state
;1556:	float entergame_time;
;1557:
;1558:	//save some things that should not be reset here
;1559:	memcpy(&settings, &bs->settings, sizeof(bot_settings_t));
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4616
ADDP4
ARGP4
CNSTI4 1316
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1560
;1560:	memcpy(&ps, &bs->cur_ps, sizeof(playerState_t));
ADDRLP4 1348
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 472
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1561
;1561:	inuse = bs->inuse;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1562
;1562:	client = bs->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1563
;1563:	entitynum = bs->entitynum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1564
;1564:	character = bs->character;
ADDRLP4 1344
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ASGNI4
line 1565
;1565:	movestate = bs->ms;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ASGNI4
line 1566
;1566:	goalstate = bs->gs;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ASGNI4
line 1567
;1567:	chatstate = bs->cs;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ASGNI4
line 1568
;1568:	weaponstate = bs->ws;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 10640
ADDP4
INDIRI4
ASGNI4
line 1569
;1569:	entergame_time = bs->entergame_time;
ADDRLP4 1820
ADDRFP4 0
INDIRP4
CNSTI4 10168
ADDP4
INDIRF4
ASGNF4
line 1571
;1570:	//free checkpoints and patrol points
;1571:	BotFreeWaypoints(bs->checkpoints);
ADDRFP4 0
INDIRP4
CNSTI4 13176
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1572
;1572:	BotFreeWaypoints(bs->patrolpoints);
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1574
;1573:	//reset the whole state
;1574:	memset(bs, 0, sizeof(bot_state_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 13192
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1576
;1575:	//copy back some state stuff that should not be reset
;1576:	bs->ms = movestate;
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1577
;1577:	bs->gs = goalstate;
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1578
;1578:	bs->cs = chatstate;
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1579
;1579:	bs->ws = weaponstate;
ADDRFP4 0
INDIRP4
CNSTI4 10640
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1580
;1580:	memcpy(&bs->cur_ps, &ps, sizeof(playerState_t));
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1348
ARGP4
CNSTI4 472
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1581
;1581:	memcpy(&bs->settings, &settings, sizeof(bot_settings_t));
ADDRFP4 0
INDIRP4
CNSTI4 4616
ADDP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1316
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1582
;1582:	bs->inuse = inuse;
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1583
;1583:	bs->client = client;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1584
;1584:	bs->entitynum = entitynum;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1585
;1585:	bs->character = character;
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
ADDRLP4 1344
INDIRI4
ASGNI4
line 1586
;1586:	bs->entergame_time = entergame_time;
ADDRFP4 0
INDIRP4
CNSTI4 10168
ADDP4
ADDRLP4 1820
INDIRF4
ASGNF4
line 1588
;1587:	//reset several states
;1588:	if (bs->ms) trap_BotResetMoveState(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $784
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetMoveState
CALLV
pop
LABELV $784
line 1589
;1589:	if (bs->gs) trap_BotResetGoalState(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $786
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetGoalState
CALLV
pop
LABELV $786
line 1590
;1590:	if (bs->ws) trap_BotResetWeaponState(bs->ws);
ADDRFP4 0
INDIRP4
CNSTI4 10640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $788
ADDRFP4 0
INDIRP4
CNSTI4 10640
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetWeaponState
CALLV
pop
LABELV $788
line 1591
;1591:	if (bs->gs) trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $790
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
LABELV $790
line 1592
;1592:	if (bs->ms) trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $792
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
LABELV $792
line 1593
;1593:}
LABELV $783
endproc BotResetState 1824 12
export BotAILoadMap
proc BotAILoadMap 280 16
line 1600
;1594:
;1595:/*
;1596:==============
;1597:BotAILoadMap
;1598:==============
;1599:*/
;1600:int BotAILoadMap( int restart ) {
line 1604
;1601:	int			i;
;1602:	vmCvar_t	mapname;
;1603:
;1604:	if (!restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $795
line 1605
;1605:		trap_Cvar_Register( &mapname, "mapname", "", CVAR_SERVERINFO | CVAR_ROM );
ADDRLP4 4
ARGP4
ADDRGP4 $797
ARGP4
ADDRGP4 $482
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1606
;1606:		trap_BotLibLoadMap( mapname.string );
ADDRLP4 4+16
ARGP4
ADDRGP4 trap_BotLibLoadMap
CALLI4
pop
line 1607
;1607:	}
LABELV $795
line 1609
;1608:
;1609:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $799
line 1610
;1610:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 276
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $803
ADDRLP4 276
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $803
line 1611
;1611:			BotResetState( botstates[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 1612
;1612:			botstates[i]->setupcount = 4;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 10120
ADDP4
CNSTI4 4
ASGNI4
line 1613
;1613:		}
LABELV $803
line 1614
;1614:	}
LABELV $800
line 1609
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $799
line 1616
;1615:
;1616:	BotSetupDeathmatchAI();
ADDRGP4 BotSetupDeathmatchAI
CALLV
pop
line 1618
;1617:
;1618:	return qtrue;
CNSTI4 1
RETI4
LABELV $794
endproc BotAILoadMap 280 16
bss
align 4
LABELV $806
skip 4
align 4
LABELV $807
skip 4
align 4
LABELV $808
skip 4
export BotAIStartFrame
code
proc BotAIStartFrame 152 12
line 1628
;1619:}
;1620:
;1621:void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace );
;1622:
;1623:/*
;1624:==================
;1625:BotAIStartFrame
;1626:==================
;1627:*/
;1628:int BotAIStartFrame(int time) {
line 1637
;1629:	int i;
;1630:	gentity_t	*ent;
;1631:	bot_entitystate_t state;
;1632:	int elapsed_time, thinktime;
;1633:	static int local_time;
;1634:	static int botlib_residual;
;1635:	static int lastbotthink_time;
;1636:
;1637:	G_CheckBotSpawn();
ADDRGP4 G_CheckBotSpawn
CALLV
pop
line 1639
;1638:
;1639:	trap_Cvar_Update(&bot_rocketjump);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1640
;1640:	trap_Cvar_Update(&bot_grapple);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1641
;1641:	trap_Cvar_Update(&bot_fastchat);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1642
;1642:	trap_Cvar_Update(&bot_nochat);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1643
;1643:	trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1644
;1644:	trap_Cvar_Update(&bot_thinktime);
ADDRGP4 bot_thinktime
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1645
;1645:	trap_Cvar_Update(&bot_memorydump);
ADDRGP4 bot_memorydump
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1646
;1646:	trap_Cvar_Update(&bot_saveroutingcache);
ADDRGP4 bot_saveroutingcache
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1647
;1647:	trap_Cvar_Update(&bot_pause);
ADDRGP4 bot_pause
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1648
;1648:	trap_Cvar_Update(&bot_report);
ADDRGP4 bot_report
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1650
;1649:
;1650:	if (bot_report.integer) {
ADDRGP4 bot_report+12
INDIRI4
CNSTI4 0
EQI4 $809
line 1653
;1651://		BotTeamplayReport();
;1652://		trap_Cvar_Set("bot_report", "0");
;1653:		BotUpdateInfoConfigStrings();
ADDRGP4 BotUpdateInfoConfigStrings
CALLV
pop
line 1654
;1654:	}
LABELV $809
line 1656
;1655:
;1656:	if (bot_pause.integer) {
ADDRGP4 bot_pause+12
INDIRI4
CNSTI4 0
EQI4 $812
line 1658
;1657:		// execute bot user commands every frame
;1658:		for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $815
line 1659
;1659:			if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 128
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $821
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $819
LABELV $821
line 1660
;1660:				continue;
ADDRGP4 $816
JUMPV
LABELV $819
line 1662
;1661:			}
;1662:			if( g_entities[i].client->pers.connected != CON_CONNECTED ) {
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+556
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $822
line 1663
;1663:				continue;
ADDRGP4 $816
JUMPV
LABELV $822
line 1665
;1664:			}
;1665:			botstates[i]->lastucmd.forwardmove = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 517
ADDP4
CNSTI1 0
ASGNI1
line 1666
;1666:			botstates[i]->lastucmd.rightmove = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 518
ADDP4
CNSTI1 0
ASGNI1
line 1667
;1667:			botstates[i]->lastucmd.upmove = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 519
ADDP4
CNSTI1 0
ASGNI1
line 1668
;1668:			botstates[i]->lastucmd.buttons = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 1669
;1669:			botstates[i]->lastucmd.serverTime = time;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1670
;1670:			trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 132
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 1671
;1671:		}
LABELV $816
line 1658
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $815
line 1672
;1672:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $805
JUMPV
LABELV $812
line 1675
;1673:	}
;1674:
;1675:	if (bot_memorydump.integer) {
ADDRGP4 bot_memorydump+12
INDIRI4
CNSTI4 0
EQI4 $825
line 1676
;1676:		trap_BotLibVarSet("memorydump", "1");
ADDRGP4 $828
ARGP4
ADDRGP4 $498
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1677
;1677:		trap_Cvar_Set("bot_memorydump", "0");
ADDRGP4 $829
ARGP4
ADDRGP4 $830
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1678
;1678:	}
LABELV $825
line 1679
;1679:	if (bot_saveroutingcache.integer) {
ADDRGP4 bot_saveroutingcache+12
INDIRI4
CNSTI4 0
EQI4 $831
line 1680
;1680:		trap_BotLibVarSet("saveroutingcache", "1");
ADDRGP4 $834
ARGP4
ADDRGP4 $498
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1681
;1681:		trap_Cvar_Set("bot_saveroutingcache", "0");
ADDRGP4 $835
ARGP4
ADDRGP4 $830
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1682
;1682:	}
LABELV $831
line 1684
;1683:	//check if bot interbreeding is activated
;1684:	BotInterbreeding();
ADDRGP4 BotInterbreeding
CALLV
pop
line 1686
;1685:	//cap the bot think time
;1686:	if (bot_thinktime.integer != 1) {
ADDRGP4 bot_thinktime+12
INDIRI4
CNSTI4 1
EQI4 $836
line 1687
;1687:		trap_Cvar_Set("bot_thinktime", "1");
ADDRGP4 $839
ARGP4
ADDRGP4 $498
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1688
;1688:	}
LABELV $836
line 1690
;1689:	//if the bot think time changed we should reschedule the bots
;1690:	if (bot_thinktime.integer != lastbotthink_time) {
ADDRGP4 bot_thinktime+12
INDIRI4
ADDRGP4 $808
INDIRI4
EQI4 $840
line 1691
;1691:		lastbotthink_time = bot_thinktime.integer;
ADDRGP4 $808
ADDRGP4 bot_thinktime+12
INDIRI4
ASGNI4
line 1692
;1692:		BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 1693
;1693:	}
LABELV $840
line 1695
;1694:
;1695:	elapsed_time = time - local_time;
ADDRLP4 120
ADDRFP4 0
INDIRI4
ADDRGP4 $806
INDIRI4
SUBI4
ASGNI4
line 1696
;1696:	local_time = time;
ADDRGP4 $806
ADDRFP4 0
INDIRI4
ASGNI4
line 1698
;1697:
;1698:	botlib_residual += elapsed_time;
ADDRLP4 128
ADDRGP4 $807
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ASGNI4
line 1700
;1699:
;1700:	if (elapsed_time > bot_thinktime.integer) thinktime = elapsed_time;
ADDRLP4 120
INDIRI4
ADDRGP4 bot_thinktime+12
INDIRI4
LEI4 $844
ADDRLP4 124
ADDRLP4 120
INDIRI4
ASGNI4
ADDRGP4 $845
JUMPV
LABELV $844
line 1701
;1701:	else thinktime = bot_thinktime.integer;
ADDRLP4 124
ADDRGP4 bot_thinktime+12
INDIRI4
ASGNI4
LABELV $845
line 1704
;1702:
;1703:	// update the bot library
;1704:	if ( botlib_residual >= thinktime ) {
ADDRGP4 $807
INDIRI4
ADDRLP4 124
INDIRI4
LTI4 $848
line 1705
;1705:		botlib_residual -= thinktime;
ADDRLP4 132
ADDRGP4 $807
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
ADDRLP4 124
INDIRI4
SUBI4
ASGNI4
line 1707
;1706:
;1707:		trap_BotLibStartFrame((float) time / 1000);
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 trap_BotLibStartFrame
CALLI4
pop
line 1709
;1708:
;1709:		if (!trap_AAS_Initialized()) return qfalse;
ADDRLP4 136
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $850
CNSTI4 0
RETI4
ADDRGP4 $805
JUMPV
LABELV $850
line 1712
;1710:
;1711:		//update entities in the botlib
;1712:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $852
line 1713
;1713:			ent = &g_entities[i];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1714
;1714:			if (!ent->inuse) {
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $856
line 1715
;1715:				trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1716
;1716:				continue;
ADDRGP4 $853
JUMPV
LABELV $856
line 1718
;1717:			}
;1718:			if (!ent->r.linked) {
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
NEI4 $858
line 1719
;1719:				trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1720
;1720:				continue;
ADDRGP4 $853
JUMPV
LABELV $858
line 1722
;1721:			}
;1722:                        if ( !(g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_LMS ||g_instantgib.integer || g_rockets.integer || g_elimination_allgametypes.integer || g_gametype.integer==GT_CTF_ELIMINATION)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $860
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
EQI4 $860
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 g_instantgib+12
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $860
ADDRGP4 g_rockets+12
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $860
ADDRGP4 g_elimination_allgametypes+12
INDIRI4
ADDRLP4 140
INDIRI4
NEI4 $860
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $860
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 140
INDIRI4
EQI4 $860
line 1723
;1723:                        && ent->r.svFlags & SVF_NOCLIENT) {
line 1724
;1724:				trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1725
;1725:				continue;
ADDRGP4 $853
JUMPV
LABELV $860
line 1728
;1726:			}
;1727:			// do not update missiles
;1728:			if (ent->s.eType == ET_MISSILE && ent->s.weapon != WP_GRAPPLING_HOOK) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $868
ADDRLP4 4
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 10
EQI4 $868
line 1729
;1729:				trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1730
;1730:				continue;
ADDRGP4 $853
JUMPV
LABELV $868
line 1733
;1731:			}
;1732:			// do not update event only entities
;1733:			if (ent->s.eType > ET_EVENTS) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
LEI4 $870
line 1734
;1734:				trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1735
;1735:				continue;
ADDRGP4 $853
JUMPV
LABELV $870
line 1739
;1736:			}
;1737:
;1738:			// never link prox mine triggers
;1739:			if (ent->r.contents == CONTENTS_TRIGGER) {
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 1073741824
NEI4 $872
line 1740
;1740:				if (ent->touch == ProximityMine_Trigger) {
ADDRLP4 4
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 ProximityMine_Trigger
CVPU4 4
NEU4 $874
line 1741
;1741:					trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1742
;1742:					continue;
ADDRGP4 $853
JUMPV
LABELV $874
line 1744
;1743:				}
;1744:			}
LABELV $872
line 1747
;1745:                        
;1746:			//
;1747:			memset(&state, 0, sizeof(bot_entitystate_t));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 112
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1749
;1748:			//
;1749:			VectorCopy(ent->r.currentOrigin, state.origin);
ADDRLP4 8+8
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 1750
;1750:			if (i < MAX_CLIENTS) {
ADDRLP4 0
INDIRI4
CNSTI4 256
GEI4 $877
line 1751
;1751:				VectorCopy(ent->s.apos.trBase, state.angles);
ADDRLP4 8+20
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 1752
;1752:			} else {
ADDRGP4 $878
JUMPV
LABELV $877
line 1753
;1753:				VectorCopy(ent->r.currentAngles, state.angles);
ADDRLP4 8+20
ADDRLP4 4
INDIRP4
CNSTI4 540
ADDP4
INDIRB
ASGNB 12
line 1754
;1754:			}
LABELV $878
line 1755
;1755:			VectorCopy(ent->s.origin2, state.old_origin);
ADDRLP4 8+32
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1756
;1756:			VectorCopy(ent->r.mins, state.mins);
ADDRLP4 8+44
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 1757
;1757:			VectorCopy(ent->r.maxs, state.maxs);
ADDRLP4 8+56
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1758
;1758:			state.type = ent->s.eType;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1759
;1759:			state.flags = ent->s.eFlags;
ADDRLP4 8+4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1760
;1760:			if (ent->r.bmodel) state.solid = SOLID_BSP;
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $885
ADDRLP4 8+72
CNSTI4 3
ASGNI4
ADDRGP4 $886
JUMPV
LABELV $885
line 1761
;1761:			else state.solid = SOLID_BBOX;
ADDRLP4 8+72
CNSTI4 2
ASGNI4
LABELV $886
line 1762
;1762:			state.groundent = ent->s.groundEntityNum;
ADDRLP4 8+68
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 1763
;1763:			state.modelindex = ent->s.modelindex;
ADDRLP4 8+76
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 1764
;1764:			state.modelindex2 = ent->s.modelindex2;
ADDRLP4 8+80
ADDRLP4 4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
line 1765
;1765:			state.frame = ent->s.frame;
ADDRLP4 8+84
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1766
;1766:			state.event = ent->s.event;
ADDRLP4 8+88
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 1767
;1767:			state.eventParm = ent->s.eventParm;
ADDRLP4 8+92
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 1768
;1768:			state.powerups = ent->s.powerups;
ADDRLP4 8+96
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1769
;1769:			state.legsAnim = ent->s.legsAnim;
ADDRLP4 8+104
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 1770
;1770:			state.torsoAnim = ent->s.torsoAnim;
ADDRLP4 8+108
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 1771
;1771:			state.weapon = ent->s.weapon;
ADDRLP4 8+100
ADDRLP4 4
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 1773
;1772:			//
;1773:			trap_BotLibUpdateEntity(i, &state);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1774
;1774:		}
LABELV $853
line 1712
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4096
LTI4 $852
line 1776
;1775:
;1776:		BotAIRegularUpdate();
ADDRGP4 BotAIRegularUpdate
CALLV
pop
line 1777
;1777:	}
LABELV $848
line 1779
;1778:
;1779:	floattime = trap_AAS_Time();
ADDRLP4 132
ADDRGP4 trap_AAS_Time
CALLF4
ASGNF4
ADDRGP4 floattime
ADDRLP4 132
INDIRF4
ASGNF4
line 1782
;1780:
;1781:	// execute scheduled bot AI
;1782:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $899
line 1783
;1783:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $905
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $903
LABELV $905
line 1784
;1784:			continue;
ADDRGP4 $900
JUMPV
LABELV $903
line 1787
;1785:		}
;1786:		//
;1787:		botstates[i]->botthink_residual += elapsed_time;
ADDRLP4 140
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ASGNI4
line 1789
;1788:		//
;1789:		if ( botstates[i]->botthink_residual >= thinktime ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
LTI4 $906
line 1790
;1790:			botstates[i]->botthink_residual -= thinktime;
ADDRLP4 144
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
ADDRLP4 124
INDIRI4
SUBI4
ASGNI4
line 1792
;1791:
;1792:			if (!trap_AAS_Initialized()) return qfalse;
ADDRLP4 148
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $908
CNSTI4 0
RETI4
ADDRGP4 $805
JUMPV
LABELV $908
line 1794
;1793:
;1794:			if (g_entities[i].client->pers.connected == CON_CONNECTED) {
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+556
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $910
line 1795
;1795:				BotAI(i, (float) thinktime / 1000);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 124
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 BotAI
CALLI4
pop
line 1796
;1796:			}
LABELV $910
line 1797
;1797:		}
LABELV $906
line 1798
;1798:	}
LABELV $900
line 1782
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $899
line 1802
;1799:
;1800:
;1801:	// execute bot user commands every frame
;1802:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $913
line 1803
;1803:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $919
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $917
LABELV $919
line 1804
;1804:			continue;
ADDRGP4 $914
JUMPV
LABELV $917
line 1806
;1805:		}
;1806:		if( g_entities[i].client->pers.connected != CON_CONNECTED ) {
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+556
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $920
line 1807
;1807:			continue;
ADDRGP4 $914
JUMPV
LABELV $920
line 1810
;1808:		}
;1809:
;1810:		BotUpdateInput(botstates[i], time, elapsed_time);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRGP4 BotUpdateInput
CALLV
pop
line 1811
;1811:		trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 140
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 496
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 1812
;1812:	}
LABELV $914
line 1802
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $913
line 1814
;1813:
;1814:	return qtrue;
CNSTI4 1
RETI4
LABELV $805
endproc BotAIStartFrame 152 12
export BotInitLibrary
proc BotInitLibrary 212 16
line 1822
;1815:}
;1816:
;1817:/*
;1818:==============
;1819:BotInitLibrary
;1820:==============
;1821:*/
;1822:int BotInitLibrary(void) {
line 1826
;1823:	char buf[144];
;1824:
;1825:	//set the maxclients and maxentities library variables before calling BotSetupLibrary
;1826:	trap_Cvar_VariableStringBuffer("sv_maxclients", buf, sizeof(buf));
ADDRGP4 $924
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1827
;1827:	if (!strlen(buf)) strcpy(buf, "8");
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $925
ADDRLP4 0
ARGP4
ADDRGP4 $927
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $925
line 1828
;1828:	trap_BotLibVarSet("maxclients", buf);
ADDRGP4 $928
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1829
;1829:	Com_sprintf(buf, sizeof(buf), "%d", MAX_GENTITIES);
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $490
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1830
;1830:	trap_BotLibVarSet("maxentities", buf);
ADDRGP4 $929
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1832
;1831:	//bsp checksum
;1832:	trap_Cvar_VariableStringBuffer("sv_mapChecksum", buf, sizeof(buf));
ADDRGP4 $930
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1833
;1833:	if (strlen(buf)) trap_BotLibVarSet("sv_mapChecksum", buf);
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $931
ADDRGP4 $930
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $931
line 1835
;1834:	//maximum number of aas links
;1835:	trap_Cvar_VariableStringBuffer("max_aaslinks", buf, sizeof(buf));
ADDRGP4 $933
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1836
;1836:	if (strlen(buf)) trap_BotLibVarSet("max_aaslinks", buf);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $934
ADDRGP4 $933
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $934
line 1838
;1837:	//maximum number of items in a level
;1838:	trap_Cvar_VariableStringBuffer("max_levelitems", buf, sizeof(buf));
ADDRGP4 $936
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1839
;1839:	if (strlen(buf)) trap_BotLibVarSet("max_levelitems", buf);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $937
ADDRGP4 $936
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $937
line 1841
;1840:	//game type
;1841:	trap_Cvar_VariableStringBuffer("g_gametype", buf, sizeof(buf));
ADDRGP4 $489
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1842
;1842:	if (!strlen(buf)) strcpy(buf, "0");
ADDRLP4 0
ARGP4
ADDRLP4 160
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $939
ADDRLP4 0
ARGP4
ADDRGP4 $830
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $939
line 1843
;1843:	trap_BotLibVarSet("g_gametype", buf);
ADDRGP4 $489
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1845
;1844:	//bot developer mode and log file
;1845:	trap_BotLibVarSet("bot_developer", bot_developer.string);
ADDRGP4 $941
ARGP4
ADDRGP4 bot_developer+16
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1846
;1846:	trap_Cvar_VariableStringBuffer("logfile", buf, sizeof(buf));
ADDRGP4 $943
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1847
;1847:	trap_BotLibVarSet("log", buf);
ADDRGP4 $944
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1849
;1848:	//no chatting
;1849:	trap_Cvar_VariableStringBuffer("bot_nochat", buf, sizeof(buf));
ADDRGP4 $945
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1850
;1850:	if (strlen(buf)) trap_BotLibVarSet("nochat", buf);
ADDRLP4 0
ARGP4
ADDRLP4 164
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $946
ADDRGP4 $948
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $946
line 1852
;1851:	//visualize jump pads
;1852:	trap_Cvar_VariableStringBuffer("bot_visualizejumppads", buf, sizeof(buf));
ADDRGP4 $949
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1853
;1853:	if (strlen(buf)) trap_BotLibVarSet("bot_visualizejumppads", buf);
ADDRLP4 0
ARGP4
ADDRLP4 168
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $950
ADDRGP4 $949
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $950
line 1855
;1854:	//forced clustering calculations
;1855:	trap_Cvar_VariableStringBuffer("bot_forceclustering", buf, sizeof(buf));
ADDRGP4 $952
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1856
;1856:	if (strlen(buf)) trap_BotLibVarSet("forceclustering", buf);
ADDRLP4 0
ARGP4
ADDRLP4 172
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $953
ADDRGP4 $955
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $953
line 1858
;1857:	//forced reachability calculations
;1858:	trap_Cvar_VariableStringBuffer("bot_forcereachability", buf, sizeof(buf));
ADDRGP4 $956
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1859
;1859:	if (strlen(buf)) trap_BotLibVarSet("forcereachability", buf);
ADDRLP4 0
ARGP4
ADDRLP4 176
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $957
ADDRGP4 $959
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $957
line 1861
;1860:	//force writing of AAS to file
;1861:	trap_Cvar_VariableStringBuffer("bot_forcewrite", buf, sizeof(buf));
ADDRGP4 $960
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1862
;1862:	if (strlen(buf)) trap_BotLibVarSet("forcewrite", buf);
ADDRLP4 0
ARGP4
ADDRLP4 180
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $961
ADDRGP4 $963
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $961
line 1864
;1863:	//no AAS optimization
;1864:	trap_Cvar_VariableStringBuffer("bot_aasoptimize", buf, sizeof(buf));
ADDRGP4 $964
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1865
;1865:	if (strlen(buf)) trap_BotLibVarSet("aasoptimize", buf);
ADDRLP4 0
ARGP4
ADDRLP4 184
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $965
ADDRGP4 $967
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $965
line 1867
;1866:	//
;1867:	trap_Cvar_VariableStringBuffer("bot_saveroutingcache", buf, sizeof(buf));
ADDRGP4 $835
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1868
;1868:	if (strlen(buf)) trap_BotLibVarSet("saveroutingcache", buf);
ADDRLP4 0
ARGP4
ADDRLP4 188
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $968
ADDRGP4 $834
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $968
line 1870
;1869:	//reload instead of cache bot character files
;1870:	trap_Cvar_VariableStringBuffer("bot_reloadcharacters", buf, sizeof(buf));
ADDRGP4 $497
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1871
;1871:	if (!strlen(buf)) strcpy(buf, "0");
ADDRLP4 0
ARGP4
ADDRLP4 192
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
NEI4 $970
ADDRLP4 0
ARGP4
ADDRGP4 $830
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $970
line 1872
;1872:	trap_BotLibVarSet("bot_reloadcharacters", buf);
ADDRGP4 $497
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1874
;1873:	//base directory
;1874:	trap_Cvar_VariableStringBuffer("fs_basepath", buf, sizeof(buf));
ADDRGP4 $972
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1875
;1875:	if (strlen(buf)) trap_BotLibVarSet("basedir", buf);
ADDRLP4 0
ARGP4
ADDRLP4 196
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $973
ADDRGP4 $975
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $973
line 1877
;1876:	//game directory
;1877:	trap_Cvar_VariableStringBuffer("fs_game", buf, sizeof(buf));
ADDRGP4 $976
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1878
;1878:	if (strlen(buf)) trap_BotLibVarSet("gamedir", buf);
ADDRLP4 0
ARGP4
ADDRLP4 200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $977
ADDRGP4 $979
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $977
line 1880
;1879:	//home directory
;1880:	trap_Cvar_VariableStringBuffer("fs_homepath", buf, sizeof(buf));
ADDRGP4 $980
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1881
;1881:	if (strlen(buf)) trap_BotLibVarSet("homedir", buf);
ADDRLP4 0
ARGP4
ADDRLP4 204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $981
ADDRGP4 $983
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $981
line 1884
;1882:	//
;1883:#ifdef MISSIONPACK
;1884:	trap_BotLibDefine("MISSIONPACK");
ADDRGP4 $984
ARGP4
ADDRGP4 trap_BotLibDefine
CALLI4
pop
line 1887
;1885:#endif
;1886:	//setup the bot library
;1887:	return trap_BotLibSetup();
ADDRLP4 208
ADDRGP4 trap_BotLibSetup
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
RETI4
LABELV $923
endproc BotInitLibrary 212 16
export BotAISetup
proc BotAISetup 8 16
line 1895
;1888:}
;1889:
;1890:/*
;1891:==============
;1892:BotAISetup
;1893:==============
;1894:*/
;1895:int BotAISetup( int restart ) {
line 1898
;1896:	int			errnum;
;1897:
;1898:	trap_Cvar_Register(&bot_thinktime, "bot_thinktime", "1", CVAR_CHEAT);
ADDRGP4 bot_thinktime
ARGP4
ADDRGP4 $839
ARGP4
ADDRGP4 $498
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1899
;1899:	trap_Cvar_Register(&bot_memorydump, "bot_memorydump", "0", CVAR_CHEAT);
ADDRGP4 bot_memorydump
ARGP4
ADDRGP4 $829
ARGP4
ADDRGP4 $830
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1900
;1900:	trap_Cvar_Register(&bot_saveroutingcache, "bot_saveroutingcache", "0", CVAR_CHEAT);
ADDRGP4 bot_saveroutingcache
ARGP4
ADDRGP4 $835
ARGP4
ADDRGP4 $830
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1901
;1901:	trap_Cvar_Register(&bot_pause, "bot_pause", "0", CVAR_CHEAT);
ADDRGP4 bot_pause
ARGP4
ADDRGP4 $986
ARGP4
ADDRGP4 $830
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1902
;1902:	trap_Cvar_Register(&bot_report, "bot_report", "0", CVAR_CHEAT);
ADDRGP4 bot_report
ARGP4
ADDRGP4 $987
ARGP4
ADDRGP4 $830
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1903
;1903:	trap_Cvar_Register(&bot_testsolid, "bot_testsolid", "0", CVAR_CHEAT);
ADDRGP4 bot_testsolid
ARGP4
ADDRGP4 $988
ARGP4
ADDRGP4 $830
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1904
;1904:	trap_Cvar_Register(&bot_testclusters, "bot_testclusters", "0", CVAR_CHEAT);
ADDRGP4 bot_testclusters
ARGP4
ADDRGP4 $989
ARGP4
ADDRGP4 $830
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1905
;1905:	trap_Cvar_Register(&bot_developer, "bot_developer", "0", CVAR_CHEAT);
ADDRGP4 bot_developer
ARGP4
ADDRGP4 $941
ARGP4
ADDRGP4 $830
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1906
;1906:	trap_Cvar_Register(&bot_interbreedchar, "bot_interbreedchar", "", 0);
ADDRGP4 bot_interbreedchar
ARGP4
ADDRGP4 $507
ARGP4
ADDRGP4 $482
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1907
;1907:	trap_Cvar_Register(&bot_interbreedbots, "bot_interbreedbots", "10", 0);
ADDRGP4 bot_interbreedbots
ARGP4
ADDRGP4 $990
ARGP4
ADDRGP4 $991
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1908
;1908:	trap_Cvar_Register(&bot_interbreedcycle, "bot_interbreedcycle", "20", 0);
ADDRGP4 bot_interbreedcycle
ARGP4
ADDRGP4 $992
ARGP4
ADDRGP4 $993
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1909
;1909:	trap_Cvar_Register(&bot_interbreedwrite, "bot_interbreedwrite", "", 0);
ADDRGP4 bot_interbreedwrite
ARGP4
ADDRGP4 $481
ARGP4
ADDRGP4 $482
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1912
;1910:
;1911:	//if the game is restarted for a tournament
;1912:	if (restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $994
line 1913
;1913:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $985
JUMPV
LABELV $994
line 1917
;1914:	}
;1915:
;1916:	//initialize the bot states
;1917:	memset( botstates, 0, sizeof(botstates) );
ADDRGP4 botstates
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1919
;1918:
;1919:	errnum = BotInitLibrary();
ADDRLP4 4
ADDRGP4 BotInitLibrary
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1920
;1920:	if (errnum != BLERR_NOERROR) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $996
CNSTI4 0
RETI4
ADDRGP4 $985
JUMPV
LABELV $996
line 1921
;1921:	return qtrue;
CNSTI4 1
RETI4
LABELV $985
endproc BotAISetup 8 16
export BotAIShutdown
proc BotAIShutdown 8 8
line 1929
;1922:}
;1923:
;1924:/*
;1925:==============
;1926:BotAIShutdown
;1927:==============
;1928:*/
;1929:int BotAIShutdown( int restart ) {
line 1934
;1930:
;1931:	int i;
;1932:
;1933:	//if the game is restarted for a tournament
;1934:	if ( restart ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $999
line 1936
;1935:		//shutdown all the bots in the botlib
;1936:		for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1001
line 1937
;1937:			if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1005
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1005
line 1938
;1938:				BotAIShutdownClient(botstates[i]->client, restart);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1939
;1939:			}
LABELV $1005
line 1940
;1940:		}
LABELV $1002
line 1936
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1001
line 1942
;1941:		//don't shutdown the bot library
;1942:	}
ADDRGP4 $1000
JUMPV
LABELV $999
line 1943
;1943:	else {
line 1944
;1944:		trap_BotLibShutdown();
ADDRGP4 trap_BotLibShutdown
CALLI4
pop
line 1945
;1945:	}
LABELV $1000
line 1946
;1946:	return qtrue;
CNSTI4 1
RETI4
LABELV $998
endproc BotAIShutdown 8 8
import ProximityMine_Trigger
bss
export bot_interbreedwrite
align 4
LABELV bot_interbreedwrite
skip 272
export bot_interbreedcycle
align 4
LABELV bot_interbreedcycle
skip 272
export bot_interbreedbots
align 4
LABELV bot_interbreedbots
skip 272
export bot_interbreedchar
align 4
LABELV bot_interbreedchar
skip 272
export bot_developer
align 4
LABELV bot_developer
skip 272
export bot_testclusters
align 4
LABELV bot_testclusters
skip 272
export bot_testsolid
align 4
LABELV bot_testsolid
skip 272
export bot_report
align 4
LABELV bot_report
skip 272
export bot_pause
align 4
LABELV bot_pause
skip 272
export bot_saveroutingcache
align 4
LABELV bot_saveroutingcache
skip 272
export bot_memorydump
align 4
LABELV bot_memorydump
skip 272
export bot_thinktime
align 4
LABELV bot_thinktime
skip 272
export bot_interbreedmatchcount
align 4
LABELV bot_interbreedmatchcount
skip 4
export bot_interbreed
align 4
LABELV bot_interbreed
skip 4
export regularupdate_time
align 4
LABELV regularupdate_time
skip 4
export numbots
align 4
LABELV numbots
skip 4
export botstates
align 4
LABELV botstates
skip 1024
import BotVoiceChat_Defend
import BotVoiceChatCommand
import BotDumpNodeSwitches
import BotResetNodeSwitches
import AINode_Battle_NBG
import AINode_Battle_Retreat
import AINode_Battle_Chase
import AINode_Battle_Fight
import AINode_Seek_LTG
import AINode_Seek_NBG
import AINode_Seek_ActivateEntity
import AINode_Stand
import AINode_Respawn
import AINode_Observer
import AINode_Intermission
import AIEnter_Battle_NBG
import AIEnter_Battle_Retreat
import AIEnter_Battle_Chase
import AIEnter_Battle_Fight
import AIEnter_Seek_Camp
import AIEnter_Seek_LTG
import AIEnter_Seek_NBG
import AIEnter_Seek_ActivateEntity
import AIEnter_Stand
import AIEnter_Respawn
import AIEnter_Observer
import AIEnter_Intermission
import BotPrintTeamGoal
import BotMatchMessage
import notleader
import BotChatTest
import BotValidChatPosition
import BotChatTime
import BotChat_Random
import BotChat_EnemySuicide
import BotChat_Kill
import BotChat_Death
import BotChat_HitNoKill
import BotChat_HitNoDeath
import BotChat_HitTalking
import BotChat_EndLevel
import BotChat_StartLevel
import BotChat_ExitGame
import BotChat_EnterGame
import neutralobelisk
import blueobelisk
import redobelisk
import ctf_neutralflag
import ctf_blueflag
import ctf_redflag
import bot_challenge
import bot_testrchat
import bot_nochat
import bot_fastchat
import bot_rocketjump
import bot_grapple
import maxclients
import gametype
import BotMapScripts
import BotPointAreaNum
import ClientOnSameTeamFromName
import ClientFromName
import stristr
import BotFindWayPoint
import BotCreateWayPoint
import BotAlternateRoute
import BotGetAlternateRouteGoal
import BotEnemyCubeCarrierVisible
import BotTeamCubeCarrierVisible
import BotHarvesterRetreatGoals
import BotHarvesterSeekGoals
import BotGoHarvest
import BotObeliskRetreatGoals
import BotObeliskSeekGoals
import Bot1FCTFRetreatGoals
import Bot1FCTFSeekGoals
import BotHarvesterCarryingCubes
import Bot1FCTFCarryingFlag
import BotCTFRetreatGoals
import BotCTFSeekGoals
import BotRememberLastOrderedTask
import BotCTFCarryingFlag
import BotOppositeTeam
import BotTeam
import BotClearActivateGoalStack
import BotPopFromActivateGoalStack
import BotEnableActivateGoalAreas
import BotAIPredictObstacles
import BotAIBlocked
import BotCheckAttack
import BotAimAtEnemy
import BotEntityVisible
import BotRoamGoal
import BotFindEnemy
import InFieldOfVision
import BotVisibleTeamMatesAndEnemies
import BotEnemyFlagCarrierVisible
import BotTeamFlagCarrierVisible
import BotTeamFlagCarrier
import TeamPlayIsOn
import BotSameTeam
import BotAttackMove
import BotWantsToCamp
import BotHasPersistantPowerupAndWeapon
import BotCanAndWantsToRocketJump
import BotWantsToHelp
import BotWantsToChase
import BotWantsToRetreat
import BotFeelingBad
import BotAggression
import BotTeamGoals
import BotSetLastOrderedTask
import BotSynonymContext
import ClientSkin
import EasyClientName
import ClientName
import BotSetTeamStatus
import BotSetUserInfo
import EntityHasKamikaze
import EntityIsShooting
import EntityIsInvisible
import EntityIsDead
import BotInLavaOrSlime
import BotIntermission
import BotIsObserver
import BotIsDead
import BotBattleUseItems
import BotUpdateBattleInventory
import BotUpdateInventory
import BotSetupForMovement
import BotChooseWeapon
import BotFreeWaypoints
import BotDeathmatchAI
import BotShutdownDeathmatchAI
import BotSetupDeathmatchAI
export floattime
align 4
LABELV floattime
skip 4
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
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
LABELV $993
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $992
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $991
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $990
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $989
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $988
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $987
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $986
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $984
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $983
byte 1 104
byte 1 111
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $980
byte 1 102
byte 1 115
byte 1 95
byte 1 104
byte 1 111
byte 1 109
byte 1 101
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $979
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $976
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $975
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $972
byte 1 102
byte 1 115
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $967
byte 1 97
byte 1 97
byte 1 115
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $964
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 97
byte 1 97
byte 1 115
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $963
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $960
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $959
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $956
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $955
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $952
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $949
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 118
byte 1 105
byte 1 115
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $948
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $945
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $944
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $943
byte 1 108
byte 1 111
byte 1 103
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $941
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $936
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $933
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 97
byte 1 97
byte 1 115
byte 1 108
byte 1 105
byte 1 110
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $930
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 115
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $929
byte 1 109
byte 1 97
byte 1 120
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $928
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
byte 1 0
align 1
LABELV $927
byte 1 56
byte 1 0
align 1
LABELV $924
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
byte 1 0
align 1
LABELV $839
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $835
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $834
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $830
byte 1 48
byte 1 0
align 1
LABELV $829
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $828
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $797
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $770
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $765
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
LABELV $752
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $749
byte 1 65
byte 1 65
byte 1 83
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $746
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 83
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $743
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 83
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 112
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $728
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $725
byte 1 110
byte 1 111
byte 1 32
byte 1 65
byte 1 65
byte 1 83
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $705
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $704
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $685
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $682
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $679
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $676
byte 1 118
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $673
byte 1 118
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $670
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $667
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $664
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $661
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $658
byte 1 99
byte 1 112
byte 1 32
byte 1 0
align 1
LABELV $650
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $507
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $504
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
byte 1 52
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $498
byte 1 49
byte 1 0
align 1
LABELV $497
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $490
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $489
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $482
byte 1 0
align 1
LABELV $481
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $432
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 97
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $429
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $427
byte 1 103
byte 1 111
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 0
align 1
LABELV $425
byte 1 103
byte 1 111
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 0
align 1
LABELV $423
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $421
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $419
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $417
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $415
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $413
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $411
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $409
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $407
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $405
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $403
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $401
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $396
byte 1 37
byte 1 50
byte 1 100
byte 1 0
align 1
LABELV $385
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $363
byte 1 94
byte 1 52
byte 1 66
byte 1 76
byte 1 85
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $361
byte 1 116
byte 1 0
align 1
LABELV $357
byte 1 110
byte 1 0
align 1
LABELV $347
byte 1 94
byte 1 49
byte 1 82
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $343
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $342
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 103
byte 1 111
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 10
byte 1 0
align 1
LABELV $340
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 103
byte 1 111
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 10
byte 1 0
align 1
LABELV $338
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $336
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $334
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $332
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $330
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $328
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $326
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $324
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $322
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $320
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $318
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $316
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $311
byte 1 94
byte 1 52
byte 1 37
byte 1 50
byte 1 100
byte 1 0
align 1
LABELV $310
byte 1 94
byte 1 49
byte 1 37
byte 1 50
byte 1 100
byte 1 0
align 1
LABELV $297
byte 1 94
byte 1 52
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $296
byte 1 94
byte 1 49
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $288
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $287
byte 1 32
byte 1 0
align 1
LABELV $286
byte 1 76
byte 1 0
align 1
LABELV $281
byte 1 13
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $280
byte 1 13
byte 1 94
byte 1 49
byte 1 83
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 33
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
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $272
byte 1 13
byte 1 94
byte 1 49
byte 1 83
byte 1 79
byte 1 76
byte 1 73
byte 1 68
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $271
byte 1 13
byte 1 101
byte 1 109
byte 1 116
byte 1 112
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $79
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $78
byte 1 94
byte 1 49
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $76
byte 1 94
byte 1 49
byte 1 70
byte 1 97
byte 1 116
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $74
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $72
byte 1 94
byte 1 51
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $70
byte 1 37
byte 1 115
byte 1 0
