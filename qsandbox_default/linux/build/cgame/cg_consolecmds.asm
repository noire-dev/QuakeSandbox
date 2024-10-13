export CG_PrintClientNumbers
code
proc CG_PrintClientNumbers 4 8
file "../../../code/cgame/cg_consolecmds.c"
line 32
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
;23:// cg_consolecmds.c -- text commands typed in at the local console, or
;24:// executed by a key binding
;25:
;26:#include "cg_local.h"
;27:#include "../ui/ui_shared.h"
;28:#ifdef MISSIONPACK
;29:extern menuDef_t *menuScoreboard;
;30:#endif
;31:
;32:void CG_PrintClientNumbers( void ) {
line 35
;33:    int i;
;34:
;35:    CG_Printf( "slot score ping name\n" );
ADDRGP4 $91
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 36
;36:    CG_Printf( "---- ----- ---- ----\n" );
ADDRGP4 $92
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 38
;37:
;38:    for(i=0;i<cg.numScores;i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $93
line 39
;39:        CG_Printf("%-4d",cg.scores[i].client);
ADDRGP4 $98
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 41
;40:
;41:        CG_Printf(" %-5d",cg.scores[i].score);
ADDRGP4 $100
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 43
;42:
;43:        CG_Printf(" %-4d",cg.scores[i].ping);
ADDRGP4 $103
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052+8
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 45
;44:
;45:        CG_Printf(" %s\n",cgs.clientinfo[cg.scores[i].client].name);
ADDRGP4 $106
ARGP4
CNSTI4 1944
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948+4
ADDP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 46
;46:    }
LABELV $94
line 38
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $96
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1872036
INDIRI4
LTI4 $93
line 47
;47:}
LABELV $90
endproc CG_PrintClientNumbers 4 8
export CG_TargetCommand_f
proc CG_TargetCommand_f 20 12
line 49
;48:
;49:void CG_TargetCommand_f( void ) {
line 53
;50:	int		targetNum;
;51:	char	test[4];
;52:
;53:	targetNum = CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 54
;54:	if (!targetNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $111
line 55
;55:		return;
ADDRGP4 $110
JUMPV
LABELV $111
line 58
;56:	}
;57:
;58:	trap_Argv( 1, test, 4 );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 59
;59:	trap_SendConsoleCommand( va( "gc %i %i", targetNum, atoi( test ) ) );
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $113
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 60
;60:}
LABELV $110
endproc CG_TargetCommand_f 20 12
proc CG_SizeUp_f 4 8
line 71
;61:
;62:
;63:
;64:/*
;65:=================
;66:CG_SizeUp_f
;67:
;68:Keybinding command
;69:=================
;70:*/
;71:static void CG_SizeUp_f (void) {
line 72
;72:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer+10)));
ADDRGP4 $116
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 73
;73:}
LABELV $114
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
line 83
;74:
;75:
;76:/*
;77:=================
;78:CG_SizeDown_f
;79:
;80:Keybinding command
;81:=================
;82:*/
;83:static void CG_SizeDown_f (void) {
line 84
;84:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer-10)));
ADDRGP4 $116
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 85
;85:}
LABELV $118
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 20
line 95
;86:
;87:
;88:/*
;89:=============
;90:CG_Viewpos_f
;91:
;92:Debugging command to print the current position
;93:=============
;94:*/
;95:static void CG_Viewpos_f (void) {
line 96
;96:	CG_Printf ("(%i %i %i) : %i\n", (int)cg.refdef.vieworg[0],
ADDRGP4 $121
ARGP4
ADDRGP4 cg+1870616+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+1870616+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+1870616+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+1870984+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 99
;97:		(int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], 
;98:		(int)cg.refdefViewAngles[YAW]);
;99:}
LABELV $120
endproc CG_Viewpos_f 0 20
proc CG_ScoresDown_f 0 4
line 102
;100:
;101:
;102:static void CG_ScoresDown_f( void ) {
line 105
;103:
;104:#ifdef MISSIONPACK
;105:		CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 107
;106:#endif
;107:	if ( cg.scoresRequestTime + 2000 < cg.time ) {
ADDRGP4 cg+1872032
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+1868892
INDIRI4
GEI4 $133
line 110
;108:		// the scores are more than two seconds out of data,
;109:		// so request new ones
;110:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+1872032
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 111
;111:		trap_SendClientCommand( "score" );
ADDRGP4 $139
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 115
;112:
;113:		// leave the current scores up if they were already
;114:		// displayed, but if this is the first hit, clear them out
;115:		if ( !cg.showScores ) {
ADDRGP4 cg+1888436
INDIRI4
CNSTI4 0
NEI4 $134
line 116
;116:			cg.showScores = qtrue;
ADDRGP4 cg+1888436
CNSTI4 1
ASGNI4
line 117
;117:			cg.numScores = 0;
ADDRGP4 cg+1872036
CNSTI4 0
ASGNI4
line 118
;118:		}
line 119
;119:	} else {
ADDRGP4 $134
JUMPV
LABELV $133
line 122
;120:		// show the cached contents even if they just pressed if it
;121:		// is within two seconds
;122:		cg.showScores = qtrue;
ADDRGP4 cg+1888436
CNSTI4 1
ASGNI4
line 123
;123:	}
LABELV $134
line 124
;124:}
LABELV $132
endproc CG_ScoresDown_f 0 4
proc CG_ScoresUp_f 0 0
line 126
;125:
;126:static void CG_ScoresUp_f( void ) {
line 127
;127:	if ( cg.showScores ) {
ADDRGP4 cg+1888436
INDIRI4
CNSTI4 0
EQI4 $147
line 128
;128:		cg.showScores = qfalse;
ADDRGP4 cg+1888436
CNSTI4 0
ASGNI4
line 129
;129:		cg.scoreFadeTime = cg.time;
ADDRGP4 cg+1888444
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 130
;130:	}
LABELV $147
line 131
;131:}
LABELV $146
endproc CG_ScoresUp_f 0 0
proc CG_AccDown_f 0 4
line 133
;132:
;133:static void CG_AccDown_f( void ) {
line 135
;134:
;135:	if ( cg.accRequestTime + 2000 < cg.time ) {
ADDRGP4 cg+1888576
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+1868892
INDIRI4
GEI4 $154
line 137
;136:
;137:		cg.accRequestTime = cg.time;
ADDRGP4 cg+1888576
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 138
;138:		trap_SendClientCommand( "acc" );
ADDRGP4 $160
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 140
;139:
;140:		if ( !cg.showAcc ) {
ADDRGP4 cg+1888580
INDIRI4
CNSTI4 0
NEI4 $155
line 141
;141:			cg.showAcc = qtrue;
ADDRGP4 cg+1888580
CNSTI4 1
ASGNI4
line 142
;142:		}
line 144
;143:
;144:	} else {
ADDRGP4 $155
JUMPV
LABELV $154
line 145
;145:		cg.showAcc = qtrue;
ADDRGP4 cg+1888580
CNSTI4 1
ASGNI4
line 146
;146:	}
LABELV $155
line 147
;147:}
LABELV $153
endproc CG_AccDown_f 0 4
proc CG_AccUp_f 0 0
line 150
;148:
;149:
;150:static void CG_AccUp_f( void ) {
line 151
;151:        if ( cg.showAcc ) {
ADDRGP4 cg+1888580
INDIRI4
CNSTI4 0
EQI4 $167
line 152
;152:                cg.showAcc = qfalse;
ADDRGP4 cg+1888580
CNSTI4 0
ASGNI4
line 153
;153:                cg.accFadeTime = cg.time;
ADDRGP4 cg+1888588
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 154
;154:        }
LABELV $167
line 155
;155:}
LABELV $166
endproc CG_AccUp_f 0 0
proc CG_LoadHud_f 1028 12
line 162
;156:
;157:
;158:#ifdef MISSIONPACK
;159:extern menuDef_t *menuScoreboard;
;160:void Menu_Reset( void );			// FIXME: add to right include file
;161:
;162:static void CG_LoadHud_f( void) {
line 165
;163:  char buff[1024];
;164:	const char *hudSet;
;165:  memset(buff, 0, sizeof(buff));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 167
;166:
;167:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 168
;168:	Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 170
;169:	
;170:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
ADDRGP4 $174
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 171
;171:	hudSet = buff;
ADDRLP4 1024
ADDRLP4 0
ASGNP4
line 172
;172:	if (hudSet[0] == '\0') {
ADDRLP4 1024
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $175
line 173
;173:		hudSet = "ui/hud.txt";
ADDRLP4 1024
ADDRGP4 $177
ASGNP4
line 174
;174:	}
LABELV $175
line 176
;175:
;176:	CG_LoadMenus(hudSet);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 CG_LoadMenus
CALLV
pop
line 177
;177:  menuScoreboard = NULL;
ADDRGP4 menuScoreboard
CNSTP4 0
ASGNP4
line 178
;178:}
LABELV $173
endproc CG_LoadHud_f 1028 12
proc CG_scrollScoresDown_f 0 12
line 181
;179:
;180:
;181:static void CG_scrollScoresDown_f( void) {
line 182
;182:	if (menuScoreboard && cg.scoreBoardShowing) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $179
ADDRGP4 cg+1888440
INDIRI4
CNSTI4 0
EQI4 $179
line 183
;183:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 184
;184:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 185
;185:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 186
;186:	}
LABELV $179
line 187
;187:}
LABELV $178
endproc CG_scrollScoresDown_f 0 12
proc CG_scrollScoresUp_f 0 12
line 190
;188:
;189:
;190:static void CG_scrollScoresUp_f( void) {
line 191
;191:	if (menuScoreboard && cg.scoreBoardShowing) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $183
ADDRGP4 cg+1888440
INDIRI4
CNSTI4 0
EQI4 $183
line 192
;192:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qfalse);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 193
;193:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qfalse);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 194
;194:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qfalse);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
line 195
;195:	}
LABELV $183
line 196
;196:}
LABELV $182
endproc CG_scrollScoresUp_f 0 12
proc CG_TellTarget_f 264 20
line 200
;197:
;198:#endif
;199:
;200:static void CG_TellTarget_f( void ) {
line 205
;201:	int		clientNum;
;202:	char	command[128];
;203:	char	message[128];
;204:
;205:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 206
;206:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $187
line 207
;207:		return;
ADDRGP4 $186
JUMPV
LABELV $187
line 210
;208:	}
;209:
;210:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 211
;211:	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $189
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 212
;212:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 213
;213:}
LABELV $186
endproc CG_TellTarget_f 264 20
proc CG_Echoo_f 128 8
line 215
;214:
;215:static void CG_Echoo_f( void ) {
line 218
;216:	char	message[128];
;217:
;218:	trap_Args( message, 128 );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 219
;219:	CG_Printf( "| %s\n", message);
ADDRGP4 $191
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 220
;220:}
LABELV $190
endproc CG_Echoo_f 128 8
proc CG_TellAttacker_f 264 20
line 222
;221:
;222:static void CG_TellAttacker_f( void ) {
line 227
;223:	int		clientNum;
;224:	char	command[128];
;225:	char	message[128];
;226:
;227:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 228
;228:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $193
line 229
;229:		return;
ADDRGP4 $192
JUMPV
LABELV $193
line 232
;230:	}
;231:
;232:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 233
;233:	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $189
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 234
;234:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 235
;235:}
LABELV $192
endproc CG_TellAttacker_f 264 20
proc CG_VoiceTellTarget_f 264 20
line 237
;236:
;237:static void CG_VoiceTellTarget_f( void ) {
line 242
;238:	int		clientNum;
;239:	char	command[128];
;240:	char	message[128];
;241:
;242:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 243
;243:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $196
line 244
;244:		return;
ADDRGP4 $195
JUMPV
LABELV $196
line 247
;245:	}
;246:
;247:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 248
;248:	Com_sprintf( command, 128, "vtell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $198
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 249
;249:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 250
;250:}
LABELV $195
endproc CG_VoiceTellTarget_f 264 20
proc CG_VoiceTellAttacker_f 264 20
line 252
;251:
;252:static void CG_VoiceTellAttacker_f( void ) {
line 257
;253:	int		clientNum;
;254:	char	command[128];
;255:	char	message[128];
;256:
;257:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 258
;258:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $200
line 259
;259:		return;
ADDRGP4 $199
JUMPV
LABELV $200
line 262
;260:	}
;261:
;262:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 263
;263:	Com_sprintf( command, 128, "vtell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $198
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 264
;264:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 265
;265:}
LABELV $199
endproc CG_VoiceTellAttacker_f 264 20
proc CG_NextTeamMember_f 0 0
line 268
;266:
;267:#ifdef MISSIONPACK
;268:static void CG_NextTeamMember_f( void ) {
line 269
;269:  CG_SelectNextPlayer();
ADDRGP4 CG_SelectNextPlayer
CALLV
pop
line 270
;270:}
LABELV $202
endproc CG_NextTeamMember_f 0 0
proc CG_PrevTeamMember_f 0 0
line 272
;271:
;272:static void CG_PrevTeamMember_f( void ) {
line 273
;273:  CG_SelectPrevPlayer();
ADDRGP4 CG_SelectPrevPlayer
CALLV
pop
line 274
;274:}
LABELV $203
endproc CG_PrevTeamMember_f 0 0
proc CG_NextOrder_f 16 0
line 278
;275:
;276:// ASS U ME's enumeration order as far as task specific orders, OFFENSE is zero, CAMP is last
;277://
;278:static void CG_NextOrder_f( void ) {
line 279
;279:	clientInfo_t *ci = cgs.clientinfo + cg.snap->ps.clientNum;
ADDRLP4 0
CNSTI4 1944
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 280
;280:	if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $207
line 281
;281:		if (!ci->teamLeader && sortedTeamPlayers[cg_currentSelectedPlayer.integer] != cg.snap->ps.clientNum) {
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
NEI4 $209
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $209
line 282
;282:			return;
ADDRGP4 $204
JUMPV
LABELV $209
line 284
;283:		}
;284:	}
LABELV $207
line 285
;285:	if (cgs.currentOrder < TEAMTASK_CAMP) {
ADDRGP4 cgs+956320
INDIRI4
CNSTI4 7
GEI4 $213
line 286
;286:		cgs.currentOrder++;
ADDRLP4 4
ADDRGP4 cgs+956320
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 288
;287:
;288:		if (cgs.currentOrder == TEAMTASK_RETRIEVE) {
ADDRGP4 cgs+956320
INDIRI4
CNSTI4 5
NEI4 $217
line 289
;289:			if (!CG_OtherTeamHasFlag()) {
ADDRLP4 8
ADDRGP4 CG_OtherTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $220
line 290
;290:				cgs.currentOrder++;
ADDRLP4 12
ADDRGP4 cgs+956320
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 291
;291:			}
LABELV $220
line 292
;292:		}
LABELV $217
line 294
;293:
;294:		if (cgs.currentOrder == TEAMTASK_ESCORT) {
ADDRGP4 cgs+956320
INDIRI4
CNSTI4 6
NEI4 $214
line 295
;295:			if (!CG_YourTeamHasFlag()) {
ADDRLP4 8
ADDRGP4 CG_YourTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $214
line 296
;296:				cgs.currentOrder++;
ADDRLP4 12
ADDRGP4 cgs+956320
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 297
;297:			}
line 298
;298:		}
line 300
;299:
;300:	} else {
ADDRGP4 $214
JUMPV
LABELV $213
line 301
;301:		cgs.currentOrder = TEAMTASK_OFFENSE;
ADDRGP4 cgs+956320
CNSTI4 1
ASGNI4
line 302
;302:	}
LABELV $214
line 303
;303:	cgs.orderPending = qtrue;
ADDRGP4 cgs+956324
CNSTI4 1
ASGNI4
line 304
;304:	cgs.orderTime = cg.time + 3000;
ADDRGP4 cgs+956328
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 305
;305:}
LABELV $204
endproc CG_NextOrder_f 16 0
proc CG_ConfirmOrder_f 8 12
line 308
;306:
;307:
;308:static void CG_ConfirmOrder_f (void ) {
line 309
;309:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_YES));
ADDRGP4 $234
ARGP4
ADDRGP4 cgs+956344
INDIRI4
ARGI4
ADDRGP4 $236
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 310
;310:	trap_SendConsoleCommand("+button5; wait; -button5");
ADDRGP4 $237
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 311
;311:	if (cg.time < cgs.acceptOrderTime) {
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cgs+956336
INDIRI4
GEI4 $238
line 312
;312:		trap_SendClientCommand(va("teamtask %d\n", cgs.acceptTask));
ADDRGP4 $242
ARGP4
ADDRGP4 cgs+956340
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 313
;313:		cgs.acceptOrderTime = 0;
ADDRGP4 cgs+956336
CNSTI4 0
ASGNI4
line 314
;314:	}
LABELV $238
line 315
;315:}
LABELV $233
endproc CG_ConfirmOrder_f 8 12
proc CG_DenyOrder_f 4 12
line 317
;316:
;317:static void CG_DenyOrder_f (void ) {
line 318
;318:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_NO));
ADDRGP4 $234
ARGP4
ADDRGP4 cgs+956344
INDIRI4
ARGI4
ADDRGP4 $247
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 319
;319:	trap_SendConsoleCommand("+button6; wait; -button6");
ADDRGP4 $248
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 320
;320:	if (cg.time < cgs.acceptOrderTime) {
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cgs+956336
INDIRI4
GEI4 $249
line 321
;321:		cgs.acceptOrderTime = 0;
ADDRGP4 cgs+956336
CNSTI4 0
ASGNI4
line 322
;322:	}
LABELV $249
line 323
;323:}
LABELV $245
endproc CG_DenyOrder_f 4 12
proc CG_TaskOffense_f 4 8
line 325
;324:
;325:static void CG_TaskOffense_f (void ) {
line 326
;326:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION || cgs.gametype == GT_1FCTF) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $261
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $261
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $255
LABELV $261
line 327
;327:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONGETFLAG));
ADDRGP4 $262
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 328
;328:	} else {
ADDRGP4 $256
JUMPV
LABELV $255
line 329
;329:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONOFFENSE));
ADDRGP4 $262
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 330
;330:	}
LABELV $256
line 331
;331:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_OFFENSE));
ADDRGP4 $242
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 332
;332:}
LABELV $254
endproc CG_TaskOffense_f 4 8
proc CG_TaskDefense_f 8 8
line 334
;333:
;334:static void CG_TaskDefense_f (void ) {
line 335
;335:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONDEFENSE));
ADDRGP4 $262
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 336
;336:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_DEFENSE));
ADDRGP4 $242
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 337
;337:}
LABELV $265
endproc CG_TaskDefense_f 8 8
proc CG_TaskPatrol_f 8 8
line 339
;338:
;339:static void CG_TaskPatrol_f (void ) {
line 340
;340:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONPATROL));
ADDRGP4 $262
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 341
;341:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_PATROL));
ADDRGP4 $242
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 342
;342:}
LABELV $267
endproc CG_TaskPatrol_f 8 8
proc CG_TaskCamp_f 8 8
line 344
;343:
;344:static void CG_TaskCamp_f (void ) {
line 345
;345:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONCAMPING));
ADDRGP4 $262
ARGP4
ADDRGP4 $270
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 346
;346:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_CAMP));
ADDRGP4 $242
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 347
;347:}
LABELV $269
endproc CG_TaskCamp_f 8 8
proc CG_TaskFollow_f 8 8
line 349
;348:
;349:static void CG_TaskFollow_f (void ) {
line 350
;350:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOW));
ADDRGP4 $262
ARGP4
ADDRGP4 $272
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 351
;351:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_FOLLOW));
ADDRGP4 $242
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 352
;352:}
LABELV $271
endproc CG_TaskFollow_f 8 8
proc CG_TaskRetrieve_f 8 8
line 354
;353:
;354:static void CG_TaskRetrieve_f (void ) {
line 355
;355:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONRETURNFLAG));
ADDRGP4 $262
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 356
;356:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_RETRIEVE));
ADDRGP4 $242
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 357
;357:}
LABELV $273
endproc CG_TaskRetrieve_f 8 8
proc CG_TaskEscort_f 8 8
line 359
;358:
;359:static void CG_TaskEscort_f (void ) {
line 360
;360:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOWCARRIER));
ADDRGP4 $262
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 361
;361:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_ESCORT));
ADDRGP4 $242
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 362
;362:}
LABELV $275
endproc CG_TaskEscort_f 8 8
proc CG_TaskOwnFlag_f 4 8
line 364
;363:
;364:static void CG_TaskOwnFlag_f (void ) {
line 365
;365:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_IHAVEFLAG));
ADDRGP4 $262
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 366
;366:}
LABELV $277
endproc CG_TaskOwnFlag_f 4 8
proc CG_TauntKillInsult_f 0 4
line 368
;367:
;368:static void CG_TauntKillInsult_f (void ) {
line 369
;369:	trap_SendConsoleCommand("cmd vsay kill_insult\n");
ADDRGP4 $280
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 370
;370:}
LABELV $279
endproc CG_TauntKillInsult_f 0 4
proc CG_TauntPraise_f 0 4
line 372
;371:
;372:static void CG_TauntPraise_f (void ) {
line 373
;373:	trap_SendConsoleCommand("cmd vsay praise\n");
ADDRGP4 $282
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 374
;374:}
LABELV $281
endproc CG_TauntPraise_f 0 4
proc CG_TauntTaunt_f 0 4
line 376
;375:
;376:static void CG_TauntTaunt_f (void ) {
line 377
;377:	trap_SendConsoleCommand("cmd vtaunt\n");
ADDRGP4 $284
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 378
;378:}
LABELV $283
endproc CG_TauntTaunt_f 0 4
proc CG_TauntDeathInsult_f 0 4
line 380
;379:
;380:static void CG_TauntDeathInsult_f (void ) {
line 381
;381:	trap_SendConsoleCommand("cmd vsay death_insult\n");
ADDRGP4 $286
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 382
;382:}
LABELV $285
endproc CG_TauntDeathInsult_f 0 4
proc CG_TauntGauntlet_f 0 4
line 384
;383:
;384:static void CG_TauntGauntlet_f (void ) {
line 385
;385:	trap_SendConsoleCommand("cmd vsay kill_guantlet\n");
ADDRGP4 $288
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 386
;386:}
LABELV $287
endproc CG_TauntGauntlet_f 0 4
proc CG_TaskSuicide_f 136 16
line 388
;387:
;388:static void CG_TaskSuicide_f (void ) {
line 392
;389:	int		clientNum;
;390:	char	command[128];
;391:
;392:	clientNum = CG_CrosshairPlayer();
ADDRLP4 132
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 132
INDIRI4
ASGNI4
line 393
;393:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $290
line 394
;394:		return;
ADDRGP4 $289
JUMPV
LABELV $290
line 397
;395:	}
;396:
;397:	Com_sprintf( command, 128, "tell %i suicide", clientNum );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $292
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 398
;398:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 399
;399:}
LABELV $289
endproc CG_TaskSuicide_f 136 16
proc CG_SetUp_f 44 8
line 452
;400:
;401:
;402:
;403:/*
;404:==================
;405:CG_TeamMenu_f
;406:==================
;407:*/
;408:/*
;409:static void CG_TeamMenu_f( void ) {
;410:  if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
;411:    CG_EventHandling(CGAME_EVENT_NONE);
;412:    trap_Key_SetCatcher(0);
;413:  } else {
;414:    CG_EventHandling(CGAME_EVENT_TEAMMENU);
;415:    //trap_Key_SetCatcher(KEYCATCH_CGAME);
;416:  }
;417:}
;418:*/
;419:
;420:/*
;421:==================
;422:CG_EditHud_f
;423:==================
;424:*/
;425:/*
;426:static void CG_EditHud_f( void ) {
;427:  //cls.keyCatchers ^= KEYCATCH_CGAME;
;428:  //VM_Call (cgvm, CG_EVENT_HANDLING, (cls.keyCatchers & KEYCATCH_CGAME) ? CGAME_EVENT_EDITHUD : CGAME_EVENT_NONE);
;429:}
;430:*/
;431:
;432:#endif
;433:
;434:/*
;435:static void CG_Camera_f( void ) {
;436:	char name[1024];
;437:	trap_Argv( 1, name, sizeof(name));
;438:	if (trap_loadCamera(name)) {
;439:		cg.cameraMode = qtrue;
;440:		trap_startCamera(cg.time);
;441:	} else {
;442:		CG_Printf ("Unable to load camera %s\n",name);
;443:	}
;444:}
;445:*/
;446:
;447:/*
;448:===============
;449:CG_SetUp_f
;450:===============
;451:*/
;452:static void CG_SetUp_f( void ) {
line 457
;453:	const char		*cvar;
;454:	char		*cvarvalue;
;455:	int		number;
;456:
;457:	if ( !CG_Argv( 1 ) ) {
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $294
line 458
;458:		return;
ADDRGP4 $293
JUMPV
LABELV $294
line 460
;459:	}
;460:	if ( !atoi(CG_Argv( 2 )) ) {
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $296
line 461
;461:		number = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 462
;462:	}
LABELV $296
line 463
;463:	cvar = CG_Argv( 1 );
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 464
;464:	cvarvalue = va("%s.integer", CG_Argv( 1 ));
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRGP4 $298
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 466
;465:
;466:	trap_Cvar_Set(cvar, va("%i",(int)(atoi(cvarvalue)+number)));
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $116
ARGP4
ADDRLP4 36
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 467
;467:}
LABELV $293
endproc CG_SetUp_f 44 8
proc CG_SetDown_f 44 8
line 474
;468:
;469:/*
;470:===============
;471:CG_SetDown_f
;472:===============
;473:*/
;474:static void CG_SetDown_f( void ) {
line 479
;475:	const char		*cvar;
;476:	char		*cvarvalue;
;477:	int		number;
;478:
;479:	if ( !CG_Argv( 1 ) ) {
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $300
line 480
;480:		return;
ADDRGP4 $299
JUMPV
LABELV $300
line 482
;481:	}
;482:	if ( !atoi(CG_Argv( 2 )) ) {
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $302
line 483
;483:		number = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 484
;484:	}
LABELV $302
line 485
;485:	cvar = CG_Argv( 1 );
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 486
;486:	cvarvalue = va("%s.integer", CG_Argv( 1 ));
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRGP4 $298
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 488
;487:
;488:	trap_Cvar_Set(cvar, va("%i",(int)(atoi(cvarvalue)-number)));
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $116
ARGP4
ADDRLP4 36
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 489
;489:}
LABELV $299
endproc CG_SetDown_f 44 8
export CG_ReplaceTexture_f
proc CG_ReplaceTexture_f 2048 12
line 497
;490:
;491:/*
;492:============
;493:CG_ReplaceTexture_f
;494:Replace texture
;495:============
;496:*/
;497:void CG_ReplaceTexture_f( void ){
line 501
;498:	char   oldtexture[1024];
;499:	char   newtexture[1024];
;500:  
;501:  trap_Argv( 1, oldtexture, sizeof(oldtexture));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 502
;502:  trap_Argv( 2, newtexture, sizeof(newtexture));
CNSTI4 2
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 504
;503:
;504:  trap_R_RemapShader( oldtexture, newtexture, "0.005" );
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 $305
ARGP4
ADDRGP4 trap_R_RemapShader
CALLV
pop
line 505
;505:}
LABELV $304
endproc CG_ReplaceTexture_f 2048 12
data
align 4
LABELV commands
address $307
address CG_TestGun_f
address $308
address CG_TestModel_f
address $309
address CG_CloadMap_f
address $310
address CG_TestModelNextFrame_f
address $311
address CG_TestModelPrevFrame_f
address $312
address CG_TestModelNextSkin_f
address $313
address CG_TestModelPrevSkin_f
address $314
address CG_Viewpos_f
address $315
address CG_ScoresDown_f
address $316
address CG_ScoresUp_f
address $317
address CG_ZoomDown_f
address $318
address CG_ZoomUp_f
address $319
address CG_SizeUp_f
address $320
address CG_SizeDown_f
address $321
address CG_NextWeapon_f
address $322
address CG_PrevWeapon_f
address $323
address CG_Weapon_f
address $324
address CG_TellTarget_f
address $325
address CG_Echoo_f
address $326
address CG_ReplaceTexture_f
address $327
address CG_TellAttacker_f
address $328
address CG_VoiceTellTarget_f
address $329
address CG_VoiceTellAttacker_f
address $330
address CG_TargetCommand_f
address $331
address CG_LoadHud_f
address $332
address CG_NextTeamMember_f
address $333
address CG_PrevTeamMember_f
address $334
address CG_NextOrder_f
address $335
address CG_ConfirmOrder_f
address $336
address CG_DenyOrder_f
address $337
address CG_TaskOffense_f
address $338
address CG_TaskDefense_f
address $339
address CG_TaskPatrol_f
address $340
address CG_TaskCamp_f
address $341
address CG_TaskFollow_f
address $342
address CG_TaskRetrieve_f
address $343
address CG_TaskEscort_f
address $344
address CG_TaskSuicide_f
address $345
address CG_TaskOwnFlag_f
address $346
address CG_TauntKillInsult_f
address $347
address CG_TauntPraise_f
address $348
address CG_TauntTaunt_f
address $349
address CG_TauntDeathInsult_f
address $350
address CG_TauntGauntlet_f
address $351
address CG_scrollScoresDown_f
address $352
address CG_scrollScoresUp_f
address $353
address CG_LoadDeferredPlayers
address $354
address CG_AccDown_f
address $355
address CG_AccUp_f
address $356
address CG_PrintClientNumbers
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 16 8
line 578
;506:
;507:
;508:typedef struct {
;509:	char	*cmd;
;510:	void	(*function)(void);
;511:} consoleCommand_t;
;512:
;513:static consoleCommand_t	commands[] = {
;514:	{ "testgun", CG_TestGun_f },
;515:	{ "testmodel", CG_TestModel_f },
;516:	{ "cloadmap", CG_CloadMap_f },
;517:	{ "nextframe", CG_TestModelNextFrame_f },
;518:	{ "prevframe", CG_TestModelPrevFrame_f },
;519:	{ "nextskin", CG_TestModelNextSkin_f },
;520:	{ "prevskin", CG_TestModelPrevSkin_f },
;521:	{ "viewpos", CG_Viewpos_f },
;522:	{ "+scores", CG_ScoresDown_f },
;523:	{ "-scores", CG_ScoresUp_f },
;524:	{ "+zoom", CG_ZoomDown_f },
;525:	{ "-zoom", CG_ZoomUp_f },
;526:	{ "sizeup", CG_SizeUp_f },
;527:	{ "sizedown", CG_SizeDown_f },
;528:	{ "weapnext", CG_NextWeapon_f },
;529:	{ "weapprev", CG_PrevWeapon_f },
;530:	{ "weapon", CG_Weapon_f },
;531:	{ "tell_target", CG_TellTarget_f },
;532:	{ "echoo", CG_Echoo_f },
;533:	{ "changetexture", CG_ReplaceTexture_f },
;534:	{ "tell_attacker", CG_TellAttacker_f },
;535:	{ "vtell_target", CG_VoiceTellTarget_f },
;536:	{ "vtell_attacker", CG_VoiceTellAttacker_f },
;537:	{ "tcmd", CG_TargetCommand_f },
;538:#ifdef MISSIONPACK
;539:	{ "loadhud", CG_LoadHud_f },
;540:	{ "nextTeamMember", CG_NextTeamMember_f },
;541:	{ "prevTeamMember", CG_PrevTeamMember_f },
;542:	{ "nextOrder", CG_NextOrder_f },
;543:	{ "confirmOrder", CG_ConfirmOrder_f },
;544:	{ "denyOrder", CG_DenyOrder_f },
;545:	{ "taskOffense", CG_TaskOffense_f },
;546:	{ "taskDefense", CG_TaskDefense_f },
;547:	{ "taskPatrol", CG_TaskPatrol_f },
;548:	{ "taskCamp", CG_TaskCamp_f },
;549:	{ "taskFollow", CG_TaskFollow_f },
;550:	{ "taskRetrieve", CG_TaskRetrieve_f },
;551:	{ "taskEscort", CG_TaskEscort_f },
;552:	{ "taskSuicide", CG_TaskSuicide_f },
;553:	{ "taskOwnFlag", CG_TaskOwnFlag_f },
;554:	{ "tauntKillInsult", CG_TauntKillInsult_f },
;555:	{ "tauntPraise", CG_TauntPraise_f },
;556:	{ "tauntTaunt", CG_TauntTaunt_f },
;557:	{ "tauntDeathInsult", CG_TauntDeathInsult_f },
;558:	{ "tauntGauntlet", CG_TauntGauntlet_f },
;559:	{ "scoresDown", CG_scrollScoresDown_f },
;560:	{ "scoresUp", CG_scrollScoresUp_f },
;561:#endif
;562://	{ "camera", CG_Camera_f },
;563:	{ "loaddeferred", CG_LoadDeferredPlayers },
;564:        { "+acc", CG_AccDown_f },
;565:	{ "-acc", CG_AccUp_f },
;566:        { "clients", CG_PrintClientNumbers }
;567:};
;568:
;569:
;570:/*
;571:=================
;572:CG_ConsoleCommand
;573:
;574:The string has been tokenized and can be retrieved with
;575:Cmd_Argc() / Cmd_Argv()
;576:=================
;577:*/
;578:qboolean CG_ConsoleCommand( void ) {
line 582
;579:	const char	*cmd;
;580:	int		i;
;581:
;582:	cmd = CG_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 584
;583:
;584:	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $361
JUMPV
LABELV $358
line 585
;585:		if ( !Q_stricmp( cmd, commands[i].cmd ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $362
line 586
;586:			commands[i].function();
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
line 587
;587:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $357
JUMPV
LABELV $362
line 589
;588:		}
;589:	}
LABELV $359
line 584
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $361
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 50
LTU4 $358
line 591
;590:
;591:	return qfalse;
CNSTI4 0
RETI4
LABELV $357
endproc CG_ConsoleCommand 16 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 4 4
line 603
;592:}
;593:
;594:
;595:/*
;596:=================
;597:CG_InitConsoleCommands
;598:
;599:Let the client system know about all of our commands
;600:so it can perform tab completion
;601:=================
;602:*/
;603:void CG_InitConsoleCommands( void ) {
line 606
;604:	int		i;
;605:
;606:	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $369
JUMPV
LABELV $366
line 607
;607:		trap_AddCommand( commands[i].cmd );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 608
;608:	}
LABELV $367
line 606
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $369
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 50
LTU4 $366
line 614
;609:
;610:	//
;611:	// the game server will interpret these commands, which will be automatically
;612:	// forwarded to the server after they are not recognized locally
;613:	//
;614:	trap_AddCommand ("kill");
ADDRGP4 $370
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 615
;615:	trap_AddCommand ("say");
ADDRGP4 $371
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 616
;616:	trap_AddCommand ("say_team");
ADDRGP4 $372
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 617
;617:	trap_AddCommand ("tell");
ADDRGP4 $373
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 618
;618:	trap_AddCommand ("vsay");
ADDRGP4 $374
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 619
;619:	trap_AddCommand ("echoo");
ADDRGP4 $325
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 620
;620:	trap_AddCommand ("vsay_team");
ADDRGP4 $375
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 621
;621:	trap_AddCommand ("vtell");
ADDRGP4 $376
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 622
;622:	trap_AddCommand ("vtaunt");
ADDRGP4 $377
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 623
;623:	trap_AddCommand ("vosay");
ADDRGP4 $378
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 624
;624:	trap_AddCommand ("vosay_team");
ADDRGP4 $379
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 625
;625:	trap_AddCommand ("votell");
ADDRGP4 $380
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 626
;626:	trap_AddCommand ("give");
ADDRGP4 $381
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 627
;627:	trap_AddCommand ("god");
ADDRGP4 $382
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 628
;628:	trap_AddCommand ("notarget");
ADDRGP4 $383
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 629
;629:	trap_AddCommand ("noclip");
ADDRGP4 $384
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 630
;630:	trap_AddCommand ("team");
ADDRGP4 $385
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 631
;631:	trap_AddCommand ("follow");
ADDRGP4 $386
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 632
;632:	trap_AddCommand ("levelshot");
ADDRGP4 $387
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 633
;633:	trap_AddCommand ("addbot");
ADDRGP4 $388
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 634
;634:	trap_AddCommand ("setviewpos");
ADDRGP4 $389
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 635
;635:	trap_AddCommand ("callvote");
ADDRGP4 $390
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 636
;636:	trap_AddCommand ("getmappage");
ADDRGP4 $391
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 637
;637:	trap_AddCommand ("vote");
ADDRGP4 $392
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 638
;638:	trap_AddCommand ("callteamvote");
ADDRGP4 $393
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 639
;639:	trap_AddCommand ("teamvote");
ADDRGP4 $394
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 640
;640:	trap_AddCommand ("stats");
ADDRGP4 $395
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 641
;641:	trap_AddCommand ("teamtask");
ADDRGP4 $396
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 642
;642:	trap_AddCommand ("loaddefered");	// spelled wrong, but not changing for demo
ADDRGP4 $397
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 643
;643:	trap_AddCommand ("replacetexture");
ADDRGP4 $398
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 644
;644:	trap_AddCommand ("if");
ADDRGP4 $399
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 645
;645:	trap_AddCommand ("picktarget");
ADDRGP4 $400
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 646
;646:	trap_AddCommand ("usetarget");
ADDRGP4 $401
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 647
;647:	trap_AddCommand ("op");
ADDRGP4 $402
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 648
;648:	trap_AddCommand ("cvar");
ADDRGP4 $403
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 649
;649:	trap_AddCommand ("editline");
ADDRGP4 $404
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 650
;650:	trap_AddCommand ("clientcmd");
ADDRGP4 $405
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 651
;651:	trap_AddCommand ("syscmd");
ADDRGP4 $406
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 652
;652:	trap_AddCommand ("random");
ADDRGP4 $407
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 653
;653:	trap_AddCommand ("for");
ADDRGP4 $408
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 654
;654:	trap_AddCommand ("savemap");
ADDRGP4 $409
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 655
;655:	trap_AddCommand ("savemapall");
ADDRGP4 $410
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 656
;656:	trap_AddCommand ("loadmap");
ADDRGP4 $411
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 657
;657:	trap_AddCommand ("loadmapall");
ADDRGP4 $412
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 658
;658:	trap_AddCommand ("save_menu");
ADDRGP4 $413
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 659
;659:	trap_AddCommand ("load_menu");
ADDRGP4 $414
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 660
;660:}
LABELV $365
endproc CG_InitConsoleCommands 4 4
import menuScoreboard
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Free
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import wideAdjustX
import CG_NewParticleArea
import initparticles
import CG_LaunchFragment
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel_MiTech
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound_MiTech
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_System
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_Atmospheric_SetParticles
import CG_AddAtmosphericEffects
import teamcolormodels
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformationRus
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_TransitionEntity
import CG_ProcessSnapshots
import CG_SpurtBlood
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_LeiPuff
import CG_LeiSparks2
import CG_LeiSparks
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponBarNew2
import CG_DrawWeaponBarNew
import CG_DrawWeaponBar0
import CG_DrawWeaponSelect
import CG_AddRealWeapon
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_GravitygunTrail
import CG_PhysgunTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainVehicleEvent
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_ReloadPlayers
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_AddToGenericConsole
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModelCopy
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrintRus
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import CG_DrawFade
import CG_Fade
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_InsideBox
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawGiantString
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_DrawRoundedRect
import CG_FillRect2
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_CloadMap_f
import CG_FairCvars
import SnapVectorTowards
import CG_RegisterOverlay
import CG_IsTeamGame
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import CG_Cvar_ClampInt
import CG_PredictWeaponEffects
import cg_teamChatBeep
import cg_chatBeep
import cg_weaponOrder
import cg_weaponBarStyle
import cg_crosshairColorBlue
import cg_crosshairColorGreen
import cg_crosshairColorRed
import cg_ch13size
import cg_ch13
import cg_ch12size
import cg_ch12
import cg_ch11size
import cg_ch11
import cg_ch10size
import cg_ch10
import cg_ch9slze
import cg_ch9size
import cg_ch9
import cg_ch8size
import cg_ch8
import cg_ch7size
import cg_ch7
import cg_ch6size
import cg_ch6
import cg_ch5size
import cg_ch5
import cg_ch4size
import cg_ch4
import cg_ch3size
import cg_ch3
import cg_ch2size
import cg_ch2
import cg_ch1size
import cg_ch1
import cg_differentCrosshairs
import cg_crosshairPulse
import cg_atmosphericLevel
import cg_fragmsgsize
import cg_autovertex
import cg_vote_custom_commands
import cg_cyclegrapple
import cg_voteflags
import cg_voip_teamonly
import cg_hitsound
import cg_alwaysWeaponBar
import cl_timeNudge
import cg_optimizePrediction
import cg_projectileNudge
import sv_fps
import cg_cmdTimeNudge
import cg_delag
import cg_enableBreath
import cg_enableDust
import cg_obeliskRespawnDelay
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_music
import cg_trueLightning
import cg_oldPlasma
import cg_cameraEyes_Up
import cg_cameraEyes_Fwd
import cg_cameraEyes
import cg_cameramode
import cg_leiBrassNoise
import cg_leiGoreNoise
import cg_leiEnhancement
import cg_lodScale
import cg_letterBoxSize
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_float
import pmove_msec
import pmove_fixed
import cg_commonConsole
import cg_teamChatLines
import cg_chatLines
import cg_commonConsoleLines
import cg_consoleLines
import cg_teamChatSizeY
import cg_teamChatSizeX
import cg_chatSizeY
import cg_chatSizeX
import cg_consoleSizeY
import cg_consoleSizeX
import cg_fontShadow
import cg_fontScale
import cg_consoleTime
import cg_chatTime
import cg_newConsole
import cg_newFont
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_stats
import cg_teamChatScaleY
import cg_teamChatScaleX
import cg_chatY
import cg_teamChatY
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawSpeed
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_thirdPersonOffset
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_bigheadMode
import cg_disableLevelStartFade
import cg_paintballMode
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairScale
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_drawSyncMessage
import cg_drawsubtitles
import cg_centertime
import cg_gibtime
import cg_itemstyle
import cg_oldscoreboard
import team_legsskin
import legsskin
import ui_backcolors
import cl_screenoffset
import cg_cameraeyes
import cg_leiChibi
import cg_plightradius
import cg_plightblue
import cg_plightgreen
import cg_plightred
import cg_tolightblue
import cg_tolightgreen
import cg_tolightred
import cg_hetex
import cg_totex
import cg_ptex
import cg_helightblue
import cg_helightgreen
import cg_helightred
import con_notifytime
import cl_language
import cg_toolguninfo
import cg_postprocess
import cg_hide255
import sb_texturename
import sb_texture_view
import sb_classnum_view
import toolgun_modelst
import toolgun_toolmode4
import toolgun_toolmode3
import toolgun_toolmode2
import toolgun_toolmode1
import toolgun_tooltip4
import toolgun_tooltip3
import toolgun_tooltip2
import toolgun_tooltip1
import toolgun_tooltext
import toolgun_toolcmd4
import toolgun_toolcmd3
import toolgun_toolcmd2
import toolgun_toolcmd1
import toolgun_tool
import toolgun_mod19
import toolgun_mod18
import toolgun_mod17
import toolgun_mod16
import toolgun_mod15
import toolgun_mod14
import toolgun_mod13
import toolgun_mod12
import toolgun_mod11
import toolgun_mod10
import toolgun_mod9
import toolgun_mod8
import toolgun_mod7
import toolgun_mod6
import toolgun_mod5
import toolgun_mod4
import toolgun_mod3
import toolgun_mod2
import toolgun_mod1
import cg_weaponBarActiveWidth
import cg_weaponselecttime
import cg_itemscaletime
import cg_zoomtime
import cg_gibmodifier
import cg_gibvelocity
import cg_gibjump
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
import g_gametype
import mod_skyColorA
import mod_skyColorB
import mod_skyColorG
import mod_skyColorR
import mod_skyShader
import mod_fogColorA
import mod_fogColorB
import mod_fogColorG
import mod_fogColorR
import mod_fogInterval
import mod_fogDistance
import mod_fogShader
import mod_fogModel
import mod_zround
import mod_gravity
import mod_roundmode
import mod_overlay
import mod_slickmove
import mod_accelerate
import mod_invulinf
import mod_kamikazeinf
import mod_portalinf
import mod_teleporterinf
import mod_medkitinf
import mod_medkitlimit
import mod_teamblue_firespeed
import mod_teamred_firespeed
import mod_invulmove
import mod_ammolimit
import mod_noplayerclip
import mod_doublerfirespeed
import mod_guardfirespeed
import mod_scoutfirespeed
import mod_ammoregenfirespeed
import mod_hastefirespeed
import mod_amdelay
import mod_ftdelay
import mod_cgdelay
import mod_pldelay
import mod_ngdelay
import mod_bfgdelay
import mod_rgdelay
import mod_pgdelay
import mod_lgdelay
import mod_rldelay
import mod_gldelay
import mod_sgdelay
import mod_mgdelay
import mod_gdelay
import mod_jumpheight
import mod_sgspread
import mod_sgcount
import mod_lgrange
import mod_cgspread
import mod_mgspread
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $414
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $413
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $412
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 97
byte 1 112
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $411
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $410
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 109
byte 1 97
byte 1 112
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $409
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $408
byte 1 102
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $407
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $406
byte 1 115
byte 1 121
byte 1 115
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $405
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $404
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $403
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $402
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $401
byte 1 117
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $400
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $399
byte 1 105
byte 1 102
byte 1 0
align 1
LABELV $398
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $397
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
byte 1 0
align 1
LABELV $396
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $395
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $394
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $393
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $392
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $391
byte 1 103
byte 1 101
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $390
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $389
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $388
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $387
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $386
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $385
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $384
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $383
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $382
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $381
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $380
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $379
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $378
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $377
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $376
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $375
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $374
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $373
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $372
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $371
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $370
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $356
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $355
byte 1 45
byte 1 97
byte 1 99
byte 1 99
byte 1 0
align 1
LABELV $354
byte 1 43
byte 1 97
byte 1 99
byte 1 99
byte 1 0
align 1
LABELV $353
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $352
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 85
byte 1 112
byte 1 0
align 1
LABELV $351
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $350
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $349
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 73
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $348
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $347
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 80
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $346
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 73
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $345
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 79
byte 1 119
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $344
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 83
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $343
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 69
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $342
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 82
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $341
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $340
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 67
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $339
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 80
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $338
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $337
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 79
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $336
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $335
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 109
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $334
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $333
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $332
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $331
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 104
byte 1 117
byte 1 100
byte 1 0
align 1
LABELV $330
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $329
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $328
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $327
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $326
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $325
byte 1 101
byte 1 99
byte 1 104
byte 1 111
byte 1 111
byte 1 0
align 1
LABELV $324
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $323
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $322
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $321
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $320
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $319
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $318
byte 1 45
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $317
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $316
byte 1 45
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $315
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $314
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $313
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $312
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $311
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $310
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $309
byte 1 99
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $308
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $307
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $305
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $298
byte 1 37
byte 1 115
byte 1 46
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $292
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $288
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $286
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $284
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $282
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $280
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $278
byte 1 105
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $276
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $274
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $272
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $270
byte 1 111
byte 1 110
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $268
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $266
byte 1 111
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $264
byte 1 111
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $263
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $262
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $248
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 54
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 54
byte 1 0
align 1
LABELV $247
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $242
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $237
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 0
align 1
LABELV $236
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $234
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $198
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $191
byte 1 124
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $189
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $177
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $174
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $160
byte 1 97
byte 1 99
byte 1 99
byte 1 0
align 1
LABELV $139
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $121
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
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $116
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $115
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 103
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $106
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $103
byte 1 32
byte 1 37
byte 1 45
byte 1 52
byte 1 100
byte 1 0
align 1
LABELV $100
byte 1 32
byte 1 37
byte 1 45
byte 1 53
byte 1 100
byte 1 0
align 1
LABELV $98
byte 1 37
byte 1 45
byte 1 52
byte 1 100
byte 1 0
align 1
LABELV $92
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $91
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
