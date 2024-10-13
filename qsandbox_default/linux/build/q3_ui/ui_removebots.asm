code
proc UI_RemoveBotsMenu_SetBotNames 1096 12
file "../../../code/q3_ui/ui_removebots.c"
line 84
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:REMOVE BOTS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:
;13:
;14:
;15:#include "ui_local.h"
;16:
;17:
;18:#define ART_BACKGROUND		"menu/art/addbotframe"
;19:#define ART_BACK0			"menu/art/back_0"
;20:#define ART_BACK1			"menu/art/back_1"
;21:#define ART_DELETE0			"menu/art/delete_0"
;22:#define ART_DELETE1			"menu/art/delete_1"
;23:#define ART_ARROWS			"menu/art/arrows_vert_0"
;24:#define ART_ARROWUP			"menu/art/arrows_vert_top"
;25:#define ART_ARROWDOWN		"menu/art/arrows_vert_bot"
;26:#define ART_SELECT			"menu/art/opponents_select"
;27:
;28:#define ART_KICK0			"menu/uie_art/kick_0"
;29:#define ART_KICK1			"menu/uie_art/kick_1"
;30:#define ART_VOTE0			"menu/uie_art/vote_0"
;31:#define ART_VOTE1			"menu/uie_art/vote_1"
;32:
;33:#define ID_UP				10
;34:#define ID_DOWN				11
;35:#define ID_DELETE			12
;36:#define ID_BACK				13
;37:#define ID_BOTNAME0			20
;38:#define ID_BOTNAME1			21
;39:#define ID_BOTNAME2			22
;40:#define ID_BOTNAME3			23
;41:#define ID_BOTNAME4			24
;42:#define ID_BOTNAME5			25
;43:#define ID_BOTNAME6			26
;44:
;45:
;46:typedef struct {
;47:	menuframework_s	menu;
;48:
;49:	menutext_s		banner;
;50:	menubitmap_s	background;
;51:
;52:	menubitmap_s	arrows;
;53:	menubitmap_s	up;
;54:	menubitmap_s	down;
;55:
;56:	menutext_s		bots[7];
;57:
;58:	menubitmap_s	icon;
;59:	menubitmap_s	icon_hilite;
;60:	menubitmap_s	deleteBot;
;61:	menubitmap_s	back;
;62:
;63:	int				numBots;
;64:	int				baseBotNum;
;65:	int				selectedBotNum;
;66:	char			botnames[7][32];
;67:	int				botClientNums[MAX_BOTS];
;68:	char			boticon[MAX_QPATH];
;69:	int 			skill;
;70:   float       f_skill;
;71:	int 			gametype;
;72:
;73:	int action;	// RBM_* type of menu
;74:} removeBotsMenuInfo_t;
;75:
;76:static removeBotsMenuInfo_t	removeBotsMenuInfo;
;77:
;78:
;79:/*
;80:=================
;81:UI_RemoveBotsMenu_SetBotNames
;82:=================
;83:*/
;84:static void UI_RemoveBotsMenu_SetBotNames( void ) {
line 89
;85:	int		n;
;86:	char	info[MAX_INFO_STRING];
;87:	char	namebuf[64];
;88:
;89:	for ( n = 0; (n < 7) && (removeBotsMenuInfo.baseBotNum + n < removeBotsMenuInfo.numBots); n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $82
line 90
;90:		trap_GetConfigString( CS_PLAYERS + removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.baseBotNum + n], info, MAX_INFO_STRING );
ADDRGP4 removeBotsMenuInfo+2840
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+3072
ADDP4
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 91
;91:		Q_strncpyz( namebuf, Info_ValueForKey( info, "n" ), 64 );
ADDRLP4 68
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 92
;92:		Q_CleanStr(namebuf);
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 93
;93:		Q_strncpyz( removeBotsMenuInfo.botnames[n], namebuf, sizeof(removeBotsMenuInfo.botnames[n]));
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 removeBotsMenuInfo+2848
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 94
;94:	}
LABELV $83
line 89
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $85
ADDRLP4 0
INDIRI4
CNSTI4 7
GEI4 $93
ADDRGP4 removeBotsMenuInfo+2840
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 removeBotsMenuInfo+2836
INDIRI4
LTI4 $82
LABELV $93
line 96
;95:
;96:}
LABELV $81
endproc UI_RemoveBotsMenu_SetBotNames 1096 12
proc RemoveBots_SetBotIcon 1060 12
line 107
;97:
;98:
;99:
;100:
;101:/*
;102:=================
;103:RemoveBots_SetBotIcon
;104:=================
;105:*/
;106:static void RemoveBots_SetBotIcon( void)
;107:{
line 112
;108:	char	info[MAX_INFO_STRING];
;109:	int		index;
;110:	int 	team;
;111:
;112:	index = CS_PLAYERS + removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.baseBotNum + removeBotsMenuInfo.selectedBotNum];
ADDRLP4 1028
ADDRGP4 removeBotsMenuInfo+2840
INDIRI4
ADDRGP4 removeBotsMenuInfo+2844
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+3072
ADDP4
INDIRI4
CNSTI4 8224
ADDI4
ASGNI4
line 113
;113:	trap_GetConfigString( index, info, MAX_INFO_STRING );
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 115
;114:
;115:	removeBotsMenuInfo.skill = atoi(Info_ValueForKey(info, "skill"));
ADDRLP4 0
ARGP4
ADDRGP4 $99
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 removeBotsMenuInfo+11328
ADDRLP4 1036
INDIRI4
ASGNI4
line 116
;116:   removeBotsMenuInfo.f_skill = atof(Info_ValueForKey(info, "skill"));
ADDRLP4 0
ARGP4
ADDRGP4 $99
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 removeBotsMenuInfo+11332
ADDRLP4 1044
INDIRF4
ASGNF4
line 117
;117:	UI_ServerPlayerIcon( Info_ValueForKey( info, "model" ), removeBotsMenuInfo.boticon, MAX_QPATH );
ADDRLP4 0
ARGP4
ADDRGP4 $101
ARGP4
ADDRLP4 1048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 removeBotsMenuInfo+11264
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 UI_ServerPlayerIcon
CALLV
pop
line 118
;118:	removeBotsMenuInfo.icon.shader = 0;
ADDRGP4 removeBotsMenuInfo+2372+96
CNSTI4 0
ASGNI4
line 120
;119:
;120:	if (removeBotsMenuInfo.gametype < GT_TEAM)
ADDRGP4 removeBotsMenuInfo+11336
INDIRI4
CNSTI4 4
GEI4 $105
line 121
;121:		return;
ADDRGP4 $94
JUMPV
LABELV $105
line 123
;122:
;123:	team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 0
ARGP4
ADDRGP4 $108
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1056
INDIRI4
ASGNI4
line 124
;124:	if (team == TEAM_RED)
ADDRLP4 1024
INDIRI4
CNSTI4 1
NEI4 $109
line 125
;125:		removeBotsMenuInfo.icon_hilite.focuscolor = color_red;
ADDRGP4 removeBotsMenuInfo+2488+112
ADDRGP4 color_red
ASGNP4
ADDRGP4 $110
JUMPV
LABELV $109
line 126
;126:	else if (team == TEAM_BLUE)
ADDRLP4 1024
INDIRI4
CNSTI4 2
NEI4 $113
line 127
;127:		removeBotsMenuInfo.icon_hilite.focuscolor = color_blue;
ADDRGP4 removeBotsMenuInfo+2488+112
ADDRGP4 color_blue
ASGNP4
ADDRGP4 $114
JUMPV
LABELV $113
line 129
;128:	else
;129:		removeBotsMenuInfo.icon_hilite.focuscolor = color_white;
ADDRGP4 removeBotsMenuInfo+2488+112
ADDRGP4 color_white
ASGNP4
LABELV $114
LABELV $110
line 130
;130:}
LABELV $94
endproc RemoveBots_SetBotIcon 1060 12
proc UI_RemoveBotsMenu_DeleteEvent 16 8
line 141
;131:
;132:
;133:
;134:
;135:/*
;136:=================
;137:UI_RemoveBotsMenu_DeleteEvent
;138:=================
;139:*/
;140:static void UI_RemoveBotsMenu_DeleteEvent( void* ptr, int event )
;141:{
line 142
;142:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $120
line 143
;143:		return;
ADDRGP4 $119
JUMPV
LABELV $120
line 146
;144:	}
;145:
;146:	switch (removeBotsMenuInfo.action) {
ADDRLP4 0
ADDRGP4 removeBotsMenuInfo+11340
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $125
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $130
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $135
ADDRGP4 $122
JUMPV
LABELV $125
line 148
;147:	case RBM_KICKBOT:
;148:		trap_Cmd_ExecuteText( EXEC_APPEND, va("clientkick %i\n", removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.baseBotNum + removeBotsMenuInfo.selectedBotNum]) );
ADDRGP4 $126
ARGP4
ADDRGP4 removeBotsMenuInfo+2840
INDIRI4
ADDRGP4 removeBotsMenuInfo+2844
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+3072
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 149
;149:		break;
ADDRGP4 $123
JUMPV
LABELV $130
line 152
;150:
;151:	case RBM_CALLVOTEKICK:
;152:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 153
;153:		trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote clientkick %i\n", removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.baseBotNum + removeBotsMenuInfo.selectedBotNum]) );
ADDRGP4 $131
ARGP4
ADDRGP4 removeBotsMenuInfo+2840
INDIRI4
ADDRGP4 removeBotsMenuInfo+2844
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+3072
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 154
;154:		break;
ADDRGP4 $123
JUMPV
LABELV $135
line 157
;155:
;156:	case RBM_CALLVOTELEADER:
;157:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 158
;158:		trap_Cmd_ExecuteText( EXEC_APPEND, va("callteamvote leader %i\n", removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.baseBotNum + removeBotsMenuInfo.selectedBotNum]) );
ADDRGP4 $136
ARGP4
ADDRGP4 removeBotsMenuInfo+2840
INDIRI4
ADDRGP4 removeBotsMenuInfo+2844
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+3072
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 159
;159:		break;
LABELV $122
LABELV $123
line 161
;160:	}
;161:}
LABELV $119
endproc UI_RemoveBotsMenu_DeleteEvent 16 8
proc UI_RemoveBotsMenu_BotEvent 0 0
line 169
;162:
;163:
;164:/*
;165:=================
;166:UI_RemoveBotsMenu_BotEvent
;167:=================
;168:*/
;169:static void UI_RemoveBotsMenu_BotEvent( void* ptr, int event ) {
line 170
;170:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $141
line 171
;171:		return;
ADDRGP4 $140
JUMPV
LABELV $141
line 174
;172:	}
;173:
;174:	removeBotsMenuInfo.bots[removeBotsMenuInfo.selectedBotNum].color = color_orange;
CNSTI4 104
ADDRGP4 removeBotsMenuInfo+2844
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644+100
ADDP4
ADDRGP4 color_orange
ASGNP4
line 175
;175:	removeBotsMenuInfo.selectedBotNum = ((menucommon_s*)ptr)->id - ID_BOTNAME0;
ADDRGP4 removeBotsMenuInfo+2844
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 20
SUBI4
ASGNI4
line 176
;176:	removeBotsMenuInfo.bots[removeBotsMenuInfo.selectedBotNum].color = color_white;
CNSTI4 104
ADDRGP4 removeBotsMenuInfo+2844
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644+100
ADDP4
ADDRGP4 color_white
ASGNP4
line 178
;177:
;178:	RemoveBots_SetBotIcon();
ADDRGP4 RemoveBots_SetBotIcon
CALLV
pop
line 179
;179:}
LABELV $140
endproc UI_RemoveBotsMenu_BotEvent 0 0
proc UI_RemoveBotsMenu_BackEvent 0 0
line 187
;180:
;181:
;182:/*
;183:=================
;184:UI_RemoveAddBotsMenu_BackEvent
;185:=================
;186:*/
;187:static void UI_RemoveBotsMenu_BackEvent( void* ptr, int event ) {
line 188
;188:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $151
line 189
;189:		return;
ADDRGP4 $150
JUMPV
LABELV $151
line 191
;190:	}
;191:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 192
;192:}
LABELV $150
endproc UI_RemoveBotsMenu_BackEvent 0 0
proc UI_RemoveBotsMenu_UpEvent 4 0
line 200
;193:
;194:
;195:/*
;196:=================
;197:UI_RemoveBotsMenu_UpEvent
;198:=================
;199:*/
;200:static void UI_RemoveBotsMenu_UpEvent( void* ptr, int event ) {
line 201
;201:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $154
line 202
;202:		return;
ADDRGP4 $153
JUMPV
LABELV $154
line 205
;203:	}
;204:
;205:	if( removeBotsMenuInfo.baseBotNum > 0 ) {
ADDRGP4 removeBotsMenuInfo+2840
INDIRI4
CNSTI4 0
LEI4 $156
line 206
;206:		removeBotsMenuInfo.baseBotNum--;
ADDRLP4 0
ADDRGP4 removeBotsMenuInfo+2840
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 207
;207:		UI_RemoveBotsMenu_SetBotNames();
ADDRGP4 UI_RemoveBotsMenu_SetBotNames
CALLV
pop
line 208
;208:		RemoveBots_SetBotIcon();
ADDRGP4 RemoveBots_SetBotIcon
CALLV
pop
line 209
;209:	}
LABELV $156
line 210
;210:}
LABELV $153
endproc UI_RemoveBotsMenu_UpEvent 4 0
proc UI_RemoveBotsMenu_DownEvent 4 0
line 218
;211:
;212:
;213:/*
;214:=================
;215:UI_RemoveBotsMenu_DownEvent
;216:=================
;217:*/
;218:static void UI_RemoveBotsMenu_DownEvent( void* ptr, int event ) {
line 219
;219:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $161
line 220
;220:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 223
;221:	}
;222:
;223:	if( removeBotsMenuInfo.baseBotNum + 7 < removeBotsMenuInfo.numBots ) {
ADDRGP4 removeBotsMenuInfo+2840
INDIRI4
CNSTI4 7
ADDI4
ADDRGP4 removeBotsMenuInfo+2836
INDIRI4
GEI4 $163
line 224
;224:		removeBotsMenuInfo.baseBotNum++;
ADDRLP4 0
ADDRGP4 removeBotsMenuInfo+2840
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 225
;225:		UI_RemoveBotsMenu_SetBotNames();
ADDRGP4 UI_RemoveBotsMenu_SetBotNames
CALLV
pop
line 226
;226:		RemoveBots_SetBotIcon();
ADDRGP4 RemoveBots_SetBotIcon
CALLV
pop
line 227
;227:	}
LABELV $163
line 228
;228:}
LABELV $160
endproc UI_RemoveBotsMenu_DownEvent 4 0
proc UI_RemoveBotsMenu_GetBots 1076 12
line 236
;229:
;230:
;231:/*
;232:=================
;233:UI_RemoveBotsMenu_GetBots
;234:=================
;235:*/
;236:static void UI_RemoveBotsMenu_GetBots( void ) {
line 244
;237:	int		numPlayers;
;238:	int		isBot;
;239:	int		playerTeam;
;240:	int		team;
;241:	int		n;
;242:	char	info[MAX_INFO_STRING];
;243:
;244:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 245
;245:	numPlayers = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $169
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
ADDRLP4 1036
ADDRLP4 1048
INDIRI4
ASGNI4
line 246
;246:	removeBotsMenuInfo.numBots = 0;
ADDRGP4 removeBotsMenuInfo+2836
CNSTI4 0
ASGNI4
line 248
;247:
;248:	playerTeam = UI_CurrentPlayerTeam();
ADDRLP4 1052
ADDRGP4 UI_CurrentPlayerTeam
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1052
INDIRI4
ASGNI4
line 250
;249:
;250:	for( n = 0; n < numPlayers; n++ ) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $171
line 251
;251:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
ADDRLP4 1024
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 253
;252:
;253:		if (info[0] == '\0')
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $175
line 254
;254:			continue;
ADDRGP4 $172
JUMPV
LABELV $175
line 256
;255:
;256:		isBot = atoi( Info_ValueForKey( info, "skill" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $99
ARGP4
ADDRLP4 1056
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1060
INDIRI4
ASGNI4
line 257
;257:		team = atoi( Info_ValueForKey( info, "t" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $108
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
ADDRLP4 1032
ADDRLP4 1068
INDIRI4
ASGNI4
line 258
;258:		if (removeBotsMenuInfo.action == RBM_KICKBOT ) {
ADDRGP4 removeBotsMenuInfo+11340
INDIRI4
CNSTI4 0
NEI4 $177
line 259
;259:			if (!isBot)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $178
line 260
;260:				continue;
ADDRGP4 $172
JUMPV
line 261
;261:		}
LABELV $177
line 262
;262:		else if (removeBotsMenuInfo.action == RBM_CALLVOTEKICK ) {
ADDRGP4 removeBotsMenuInfo+11340
INDIRI4
CNSTI4 1
NEI4 $182
line 263
;263:			if (isBot)
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $183
line 264
;264:				continue;
ADDRGP4 $172
JUMPV
line 265
;265:		}
LABELV $182
line 266
;266:		else if (removeBotsMenuInfo.action == RBM_CALLVOTELEADER) {
ADDRGP4 removeBotsMenuInfo+11340
INDIRI4
CNSTI4 2
NEI4 $187
line 269
;267://			if (isBot)
;268://				continue;
;269:			if (team != playerTeam)
ADDRLP4 1032
INDIRI4
ADDRLP4 1040
INDIRI4
EQI4 $190
line 270
;270:				continue;
ADDRGP4 $172
JUMPV
LABELV $190
line 271
;271:		}
LABELV $187
LABELV $183
LABELV $178
line 273
;272:
;273:		removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.numBots] = n;
ADDRGP4 removeBotsMenuInfo+2836
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+3072
ADDP4
ADDRLP4 1024
INDIRI4
ASGNI4
line 274
;274:		removeBotsMenuInfo.numBots++;
ADDRLP4 1072
ADDRGP4 removeBotsMenuInfo+2836
ASGNP4
ADDRLP4 1072
INDIRP4
ADDRLP4 1072
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 275
;275:	}
LABELV $172
line 250
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $174
ADDRLP4 1024
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $171
line 276
;276:}
LABELV $168
endproc UI_RemoveBotsMenu_GetBots 1076 12
export UI_RemoveBots_Cache
proc UI_RemoveBots_Cache 0 4
line 284
;277:
;278:
;279:/*
;280:=================
;281:UI_RemoveBots_Cache
;282:=================
;283:*/
;284:void UI_RemoveBots_Cache( void ) {
line 285
;285:	trap_R_RegisterShaderNoMip( ART_BACKGROUND );
ADDRGP4 $196
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 286
;286:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $197
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 287
;287:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $198
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 288
;288:	trap_R_RegisterShaderNoMip( ART_DELETE0 );
ADDRGP4 $199
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 289
;289:	trap_R_RegisterShaderNoMip( ART_DELETE1 );
ADDRGP4 $200
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 290
;290:}
LABELV $195
endproc UI_RemoveBots_Cache 0 4
proc RemoveBots_MenuDraw 52 20
line 301
;291:
;292:
;293:
;294:
;295:/*
;296:=================
;297:RemoveBots_MenuDraw
;298:=================
;299:*/
;300:static void RemoveBots_MenuDraw(void)
;301:{
line 307
;302:	qhandle_t hpic;
;303:	menubitmap_s* b;
;304:	int x, y, w, h;
;305:
;306:	// draw the controls
;307:	Menu_Draw(&removeBotsMenuInfo.menu);
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 309
;308:
;309:	if (removeBotsMenuInfo.boticon[0] && removeBotsMenuInfo.numBots > 0)
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 removeBotsMenuInfo+11264
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $202
ADDRGP4 removeBotsMenuInfo+2836
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $202
line 310
;310:	{
line 311
;311:		hpic = trap_R_RegisterShaderNoMip( va("menu/art/skill%i", removeBotsMenuInfo.skill));
ADDRGP4 $206
ARGP4
ADDRGP4 removeBotsMenuInfo+11328
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 32
INDIRI4
ASGNI4
line 312
;312:		if (!hpic)
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $208
line 313
;313:			return;
ADDRGP4 $201
JUMPV
LABELV $208
line 316
;314:
;315:		// put icon in bottom right corner of pic	
;316:		b = &removeBotsMenuInfo.icon;
ADDRLP4 0
ADDRGP4 removeBotsMenuInfo+2372
ASGNP4
line 317
;317:		w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 318
;318:		h = b->height;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 319
;319:		x = b->generic.x + w;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 320
;320:		y = b->generic.y + h;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 322
;321:
;322:		w /= 3;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 323
;323:		h /= 3;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 324
;324:		x -= w;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 325
;325:		y -= h;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ASGNI4
line 327
;326:
;327:		trap_R_SetColor(color_black);
ADDRGP4 color_black
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 328
;328:		UI_DrawHandlePic( x, y, w, h, hpic);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 329
;329:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 331
;330:
;331:		UI_DrawHandlePic( x - 2, y - 2, w, h, hpic);
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 334
;332:
;333:      // write bot skill as float
;334:      x = b->generic.x + b->width - 4 * SMALLCHAR_WIDTH;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
LSHI4
SUBI4
ASGNI4
line 335
;335:      y = b->generic.y + b->height + 2;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 336
;336:	   UI_DrawString(x, y, va("%4.2f", removeBotsMenuInfo.f_skill), UI_SMALLFONT, color_orange);
ADDRGP4 $212
ARGP4
ADDRGP4 removeBotsMenuInfo+11332
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 337
;337:	}
LABELV $202
line 338
;338:}
LABELV $201
endproc RemoveBots_MenuDraw 52 20
proc UI_RemoveBotsMenu_Init 1056 12
line 347
;339:
;340:
;341:
;342:/*
;343:=================
;344:UI_RemoveBotsMenu_Init
;345:=================
;346:*/
;347:static void UI_RemoveBotsMenu_Init( int action) {
line 353
;348:	int		n;
;349:	int		count;
;350:	int		y;
;351:	char	info[MAX_INFO_STRING];
;352:
;353:	trap_GetConfigString(CS_SERVERINFO, info, MAX_INFO_STRING);
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 355
;354:
;355:	memset( &removeBotsMenuInfo, 0 ,sizeof(removeBotsMenuInfo) );
ADDRGP4 removeBotsMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 11344
ARGI4
ADDRGP4 memset
CALLP4
pop
line 356
;356:	removeBotsMenuInfo.menu.fullscreen = qfalse;
ADDRGP4 removeBotsMenuInfo+1052
CNSTI4 0
ASGNI4
line 357
;357:	removeBotsMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 removeBotsMenuInfo+1044
CNSTI4 1
ASGNI4
line 358
;358:	removeBotsMenuInfo.menu.native 	   = qfalse;
ADDRGP4 removeBotsMenuInfo+1056
CNSTI4 0
ASGNI4
line 359
;359:	removeBotsMenuInfo.menu.draw = RemoveBots_MenuDraw;
ADDRGP4 removeBotsMenuInfo+1036
ADDRGP4 RemoveBots_MenuDraw
ASGNP4
line 361
;360:
;361:	removeBotsMenuInfo.gametype = atoi( Info_ValueForKey( info,"g_gametype" ) );
ADDRLP4 12
ARGP4
ADDRGP4 $220
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 removeBotsMenuInfo+11336
ADDRLP4 1040
INDIRI4
ASGNI4
line 362
;362:	removeBotsMenuInfo.action = action;
ADDRGP4 removeBotsMenuInfo+11340
ADDRFP4 0
INDIRI4
ASGNI4
line 364
;363:
;364:	UI_RemoveBots_Cache();
ADDRGP4 UI_RemoveBots_Cache
CALLV
pop
line 366
;365:
;366:	UI_RemoveBotsMenu_GetBots();
ADDRGP4 UI_RemoveBotsMenu_GetBots
CALLV
pop
line 367
;367:	UI_RemoveBotsMenu_SetBotNames();
ADDRGP4 UI_RemoveBotsMenu_SetBotNames
CALLV
pop
line 368
;368:	count = removeBotsMenuInfo.numBots < 7 ? removeBotsMenuInfo.numBots : 7;
ADDRGP4 removeBotsMenuInfo+2836
INDIRI4
CNSTI4 7
GEI4 $225
ADDRLP4 1044
ADDRGP4 removeBotsMenuInfo+2836
INDIRI4
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $225
ADDRLP4 1044
CNSTI4 7
ASGNI4
LABELV $226
ADDRLP4 4
ADDRLP4 1044
INDIRI4
ASGNI4
line 370
;369:
;370:	removeBotsMenuInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 removeBotsMenuInfo+1076
CNSTI4 10
ASGNI4
line 371
;371:	removeBotsMenuInfo.banner.generic.x			= 320;
ADDRGP4 removeBotsMenuInfo+1076+28
CNSTI4 320
ASGNI4
line 372
;372:	removeBotsMenuInfo.banner.generic.y			= 16;
ADDRGP4 removeBotsMenuInfo+1076+32
CNSTI4 16
ASGNI4
line 373
;373:	removeBotsMenuInfo.banner.color				= color_white;
ADDRGP4 removeBotsMenuInfo+1076+100
ADDRGP4 color_white
ASGNP4
line 374
;374:	removeBotsMenuInfo.banner.style				= UI_CENTER;
ADDRGP4 removeBotsMenuInfo+1076+92
CNSTI4 1
ASGNI4
line 376
;375:
;376:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $236
line 377
;377:	if (action == RBM_CALLVOTEKICK ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $239
line 378
;378:		removeBotsMenuInfo.banner.string			= "CALLVOTE KICK";
ADDRGP4 removeBotsMenuInfo+1076+88
ADDRGP4 $243
ASGNP4
line 379
;379:	}
ADDRGP4 $240
JUMPV
LABELV $239
line 380
;380:	else if (action == RBM_CALLVOTELEADER ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $244
line 381
;381:		removeBotsMenuInfo.banner.string			= "CALLVOTE TEAM LEADER";
ADDRGP4 removeBotsMenuInfo+1076+88
ADDRGP4 $248
ASGNP4
line 382
;382:	}
ADDRGP4 $245
JUMPV
LABELV $244
line 383
;383:	else {
line 384
;384:		removeBotsMenuInfo.banner.string			= "REMOVE BOTS";
ADDRGP4 removeBotsMenuInfo+1076+88
ADDRGP4 $251
ASGNP4
line 385
;385:	}
LABELV $245
LABELV $240
line 386
;386:}
LABELV $236
line 387
;387:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $252
line 388
;388:	if (action == RBM_CALLVOTEKICK ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $255
line 389
;389:		removeBotsMenuInfo.banner.string			= "ГОЛОСОВАНИЕ - КИКНУТЬ";
ADDRGP4 removeBotsMenuInfo+1076+88
ADDRGP4 $259
ASGNP4
line 390
;390:	}
ADDRGP4 $256
JUMPV
LABELV $255
line 391
;391:	else if (action == RBM_CALLVOTELEADER ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $260
line 392
;392:		removeBotsMenuInfo.banner.string			= "ГОЛОСОВАНИЕ - ЛИДЕР КОМАНДЫ";
ADDRGP4 removeBotsMenuInfo+1076+88
ADDRGP4 $264
ASGNP4
line 393
;393:	}
ADDRGP4 $261
JUMPV
LABELV $260
line 394
;394:	else {
line 395
;395:		removeBotsMenuInfo.banner.string			= "УДАЛЕНИЕ БОТОВ";
ADDRGP4 removeBotsMenuInfo+1076+88
ADDRGP4 $267
ASGNP4
line 396
;396:	}
LABELV $261
LABELV $256
line 397
;397:}
LABELV $252
line 399
;398:
;399:	removeBotsMenuInfo.background.generic.type	= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+1180
CNSTI4 6
ASGNI4
line 400
;400:	removeBotsMenuInfo.background.generic.name	= ART_BACKGROUND;
ADDRGP4 removeBotsMenuInfo+1180+4
ADDRGP4 $196
ASGNP4
line 401
;401:	removeBotsMenuInfo.background.generic.flags	= QMF_INACTIVE;
ADDRGP4 removeBotsMenuInfo+1180+72
CNSTU4 16384
ASGNU4
line 402
;402:	removeBotsMenuInfo.background.generic.x		= 320-233;
ADDRGP4 removeBotsMenuInfo+1180+28
CNSTI4 87
ASGNI4
line 403
;403:	removeBotsMenuInfo.background.generic.y		= 240-166;
ADDRGP4 removeBotsMenuInfo+1180+32
CNSTI4 74
ASGNI4
line 404
;404:	removeBotsMenuInfo.background.width			= 466;
ADDRGP4 removeBotsMenuInfo+1180+104
CNSTI4 466
ASGNI4
line 405
;405:	removeBotsMenuInfo.background.height		= 332;
ADDRGP4 removeBotsMenuInfo+1180+108
CNSTI4 332
ASGNI4
line 407
;406:
;407:	removeBotsMenuInfo.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+1296
CNSTI4 6
ASGNI4
line 408
;408:	removeBotsMenuInfo.arrows.generic.name		= ART_ARROWS;
ADDRGP4 removeBotsMenuInfo+1296+4
ADDRGP4 $284
ASGNP4
line 409
;409:	removeBotsMenuInfo.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 removeBotsMenuInfo+1296+72
CNSTU4 16384
ASGNU4
line 410
;410:	removeBotsMenuInfo.arrows.generic.x			= 200;
ADDRGP4 removeBotsMenuInfo+1296+28
CNSTI4 200
ASGNI4
line 411
;411:	removeBotsMenuInfo.arrows.generic.y			= 128;
ADDRGP4 removeBotsMenuInfo+1296+32
CNSTI4 128
ASGNI4
line 412
;412:	removeBotsMenuInfo.arrows.width				= 64;
ADDRGP4 removeBotsMenuInfo+1296+104
CNSTI4 64
ASGNI4
line 413
;413:	removeBotsMenuInfo.arrows.height			= 128;
ADDRGP4 removeBotsMenuInfo+1296+108
CNSTI4 128
ASGNI4
line 415
;414:
;415:	removeBotsMenuInfo.up.generic.type			= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+1412
CNSTI4 6
ASGNI4
line 416
;416:	removeBotsMenuInfo.up.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+1412+72
CNSTU4 260
ASGNU4
line 417
;417:	removeBotsMenuInfo.up.generic.x				= 200;
ADDRGP4 removeBotsMenuInfo+1412+28
CNSTI4 200
ASGNI4
line 418
;418:	removeBotsMenuInfo.up.generic.y				= 128;
ADDRGP4 removeBotsMenuInfo+1412+32
CNSTI4 128
ASGNI4
line 419
;419:	removeBotsMenuInfo.up.generic.id			= ID_UP;
ADDRGP4 removeBotsMenuInfo+1412+24
CNSTI4 10
ASGNI4
line 420
;420:	removeBotsMenuInfo.up.generic.callback		= UI_RemoveBotsMenu_UpEvent;
ADDRGP4 removeBotsMenuInfo+1412+76
ADDRGP4 UI_RemoveBotsMenu_UpEvent
ASGNP4
line 421
;421:	removeBotsMenuInfo.up.width					= 64;
ADDRGP4 removeBotsMenuInfo+1412+104
CNSTI4 64
ASGNI4
line 422
;422:	removeBotsMenuInfo.up.height				= 64;
ADDRGP4 removeBotsMenuInfo+1412+108
CNSTI4 64
ASGNI4
line 423
;423:	removeBotsMenuInfo.up.focuspic				= ART_ARROWUP;
ADDRGP4 removeBotsMenuInfo+1412+88
ADDRGP4 $312
ASGNP4
line 425
;424:
;425:	removeBotsMenuInfo.down.generic.type		= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+1528
CNSTI4 6
ASGNI4
line 426
;426:	removeBotsMenuInfo.down.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+1528+72
CNSTU4 260
ASGNU4
line 427
;427:	removeBotsMenuInfo.down.generic.x			= 200;
ADDRGP4 removeBotsMenuInfo+1528+28
CNSTI4 200
ASGNI4
line 428
;428:	removeBotsMenuInfo.down.generic.y			= 128+64;
ADDRGP4 removeBotsMenuInfo+1528+32
CNSTI4 192
ASGNI4
line 429
;429:	removeBotsMenuInfo.down.generic.id			= ID_DOWN;
ADDRGP4 removeBotsMenuInfo+1528+24
CNSTI4 11
ASGNI4
line 430
;430:	removeBotsMenuInfo.down.generic.callback	= UI_RemoveBotsMenu_DownEvent;
ADDRGP4 removeBotsMenuInfo+1528+76
ADDRGP4 UI_RemoveBotsMenu_DownEvent
ASGNP4
line 431
;431:	removeBotsMenuInfo.down.width				= 64;
ADDRGP4 removeBotsMenuInfo+1528+104
CNSTI4 64
ASGNI4
line 432
;432:	removeBotsMenuInfo.down.height				= 64;
ADDRGP4 removeBotsMenuInfo+1528+108
CNSTI4 64
ASGNI4
line 433
;433:	removeBotsMenuInfo.down.focuspic			= ART_ARROWDOWN;
ADDRGP4 removeBotsMenuInfo+1528+88
ADDRGP4 $330
ASGNP4
line 435
;434:
;435:	for( n = 0, y = 120; n < count; n++, y += 20 ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 120
ASGNI4
ADDRGP4 $334
JUMPV
LABELV $331
line 436
;436:		removeBotsMenuInfo.bots[n].generic.type		= MTYPE_PTEXT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644
ADDP4
CNSTI4 9
ASGNI4
line 437
;437:		removeBotsMenuInfo.bots[n].generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644+72
ADDP4
CNSTU4 260
ASGNU4
line 438
;438:		removeBotsMenuInfo.bots[n].generic.id		= ID_BOTNAME0 + n;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644+24
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 439
;439:		removeBotsMenuInfo.bots[n].generic.x		= 320 - 56;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644+28
ADDP4
CNSTI4 264
ASGNI4
line 440
;440:		removeBotsMenuInfo.bots[n].generic.y		= y;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644+32
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 441
;441:		removeBotsMenuInfo.bots[n].generic.callback	= UI_RemoveBotsMenu_BotEvent;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644+76
ADDP4
ADDRGP4 UI_RemoveBotsMenu_BotEvent
ASGNP4
line 442
;442:		removeBotsMenuInfo.bots[n].string			= removeBotsMenuInfo.botnames[n];
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644+88
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 removeBotsMenuInfo+2848
ADDP4
ASGNP4
line 443
;443:		removeBotsMenuInfo.bots[n].color			= color_orange;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644+100
ADDP4
ADDRGP4 color_orange
ASGNP4
line 444
;444:		removeBotsMenuInfo.bots[n].style			= UI_LEFT|UI_SMALLFONT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644+92
ADDP4
CNSTI4 16
ASGNI4
line 445
;445:	}
LABELV $332
line 435
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
LABELV $334
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $331
line 447
;446:
;447:	removeBotsMenuInfo.deleteBot.generic.type		= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+2604
CNSTI4 6
ASGNI4
line 448
;448:	removeBotsMenuInfo.deleteBot.generic.id		= ID_DELETE;
ADDRGP4 removeBotsMenuInfo+2604+24
CNSTI4 12
ASGNI4
line 449
;449:	removeBotsMenuInfo.deleteBot.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+2604+72
CNSTU4 260
ASGNU4
line 450
;450:	removeBotsMenuInfo.deleteBot.generic.callback	= UI_RemoveBotsMenu_DeleteEvent;
ADDRGP4 removeBotsMenuInfo+2604+76
ADDRGP4 UI_RemoveBotsMenu_DeleteEvent
ASGNP4
line 451
;451:	removeBotsMenuInfo.deleteBot.generic.x			= 320+128-128;
ADDRGP4 removeBotsMenuInfo+2604+28
CNSTI4 320
ASGNI4
line 452
;452:	removeBotsMenuInfo.deleteBot.generic.y			= 256+128-64;
ADDRGP4 removeBotsMenuInfo+2604+32
CNSTI4 320
ASGNI4
line 453
;453:	removeBotsMenuInfo.deleteBot.width  			= 128;
ADDRGP4 removeBotsMenuInfo+2604+104
CNSTI4 128
ASGNI4
line 454
;454:	removeBotsMenuInfo.deleteBot.height  			= 64;
ADDRGP4 removeBotsMenuInfo+2604+108
CNSTI4 64
ASGNI4
line 456
;455:
;456:	if (action == RBM_CALLVOTEKICK) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $368
line 457
;457:		removeBotsMenuInfo.deleteBot.generic.name		= ART_KICK0;
ADDRGP4 removeBotsMenuInfo+2604+4
ADDRGP4 $372
ASGNP4
line 458
;458:		removeBotsMenuInfo.deleteBot.focuspic			= ART_KICK1;
ADDRGP4 removeBotsMenuInfo+2604+88
ADDRGP4 $375
ASGNP4
line 459
;459:	}
ADDRGP4 $369
JUMPV
LABELV $368
line 460
;460:	else if (action == RBM_CALLVOTELEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $376
line 461
;461:		removeBotsMenuInfo.deleteBot.generic.name		= ART_VOTE0;
ADDRGP4 removeBotsMenuInfo+2604+4
ADDRGP4 $380
ASGNP4
line 462
;462:		removeBotsMenuInfo.deleteBot.focuspic			= ART_VOTE1;
ADDRGP4 removeBotsMenuInfo+2604+88
ADDRGP4 $383
ASGNP4
line 463
;463:	}
ADDRGP4 $377
JUMPV
LABELV $376
line 464
;464:	else {
line 465
;465:		removeBotsMenuInfo.deleteBot.generic.name		= ART_DELETE0;
ADDRGP4 removeBotsMenuInfo+2604+4
ADDRGP4 $199
ASGNP4
line 466
;466:		removeBotsMenuInfo.deleteBot.focuspic			= ART_DELETE1;
ADDRGP4 removeBotsMenuInfo+2604+88
ADDRGP4 $200
ASGNP4
line 467
;467:	}
LABELV $377
LABELV $369
line 469
;468:
;469:	removeBotsMenuInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+2720
CNSTI4 6
ASGNI4
line 470
;470:	removeBotsMenuInfo.back.generic.name		= ART_BACK0;
ADDRGP4 removeBotsMenuInfo+2720+4
ADDRGP4 $197
ASGNP4
line 471
;471:	removeBotsMenuInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+2720+72
CNSTU4 260
ASGNU4
line 472
;472:	removeBotsMenuInfo.back.generic.id			= ID_BACK;
ADDRGP4 removeBotsMenuInfo+2720+24
CNSTI4 13
ASGNI4
line 473
;473:	removeBotsMenuInfo.back.generic.callback	= UI_RemoveBotsMenu_BackEvent;
ADDRGP4 removeBotsMenuInfo+2720+76
ADDRGP4 UI_RemoveBotsMenu_BackEvent
ASGNP4
line 474
;474:	removeBotsMenuInfo.back.generic.x			= 320-128;
ADDRGP4 removeBotsMenuInfo+2720+28
CNSTI4 192
ASGNI4
line 475
;475:	removeBotsMenuInfo.back.generic.y			= 256+128-64;
ADDRGP4 removeBotsMenuInfo+2720+32
CNSTI4 320
ASGNI4
line 476
;476:	removeBotsMenuInfo.back.width				= 128;
ADDRGP4 removeBotsMenuInfo+2720+104
CNSTI4 128
ASGNI4
line 477
;477:	removeBotsMenuInfo.back.height				= 64;
ADDRGP4 removeBotsMenuInfo+2720+108
CNSTI4 64
ASGNI4
line 478
;478:	removeBotsMenuInfo.back.focuspic			= ART_BACK1;
ADDRGP4 removeBotsMenuInfo+2720+88
ADDRGP4 $198
ASGNP4
line 480
;479:
;480:	removeBotsMenuInfo.icon_hilite.generic.type		= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+2488
CNSTI4 6
ASGNI4
line 481
;481:	removeBotsMenuInfo.icon_hilite.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 removeBotsMenuInfo+2488+72
CNSTU4 16452
ASGNU4
line 482
;482:	removeBotsMenuInfo.icon_hilite.generic.x			= 190 - 64 - 15;	//320 + 128 - 15;
ADDRGP4 removeBotsMenuInfo+2488+28
CNSTI4 111
ASGNI4
line 483
;483:	removeBotsMenuInfo.icon_hilite.generic.y			= 240 - 32 - 16;
ADDRGP4 removeBotsMenuInfo+2488+32
CNSTI4 192
ASGNI4
line 484
;484:	removeBotsMenuInfo.icon_hilite.width				= 128;
ADDRGP4 removeBotsMenuInfo+2488+104
CNSTI4 128
ASGNI4
line 485
;485:	removeBotsMenuInfo.icon_hilite.height				= 128;
ADDRGP4 removeBotsMenuInfo+2488+108
CNSTI4 128
ASGNI4
line 486
;486:	removeBotsMenuInfo.icon_hilite.focuspic				= ART_SELECT;
ADDRGP4 removeBotsMenuInfo+2488+88
ADDRGP4 $420
ASGNP4
line 487
;487:	removeBotsMenuInfo.icon_hilite.focuscolor			= color_red;
ADDRGP4 removeBotsMenuInfo+2488+112
ADDRGP4 color_red
ASGNP4
line 489
;488:
;489:	removeBotsMenuInfo.icon.generic.type		= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+2372
CNSTI4 6
ASGNI4
line 490
;490:	removeBotsMenuInfo.icon.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 removeBotsMenuInfo+2372+72
CNSTU4 16388
ASGNU4
line 491
;491:	removeBotsMenuInfo.icon.generic.name		= removeBotsMenuInfo.boticon;
ADDRGP4 removeBotsMenuInfo+2372+4
ADDRGP4 removeBotsMenuInfo+11264
ASGNP4
line 492
;492:	removeBotsMenuInfo.icon.generic.x			= 190 - 64;	//320 + 128;
ADDRGP4 removeBotsMenuInfo+2372+28
CNSTI4 126
ASGNI4
line 493
;493:	removeBotsMenuInfo.icon.generic.y			= 240 - 32;
ADDRGP4 removeBotsMenuInfo+2372+32
CNSTI4 208
ASGNI4
line 494
;494:	removeBotsMenuInfo.icon.width				= 64;
ADDRGP4 removeBotsMenuInfo+2372+104
CNSTI4 64
ASGNI4
line 495
;495:	removeBotsMenuInfo.icon.height				= 64;
ADDRGP4 removeBotsMenuInfo+2372+108
CNSTI4 64
ASGNI4
line 497
;496:
;497:	if (removeBotsMenuInfo.numBots == 0)
ADDRGP4 removeBotsMenuInfo+2836
INDIRI4
CNSTI4 0
NEI4 $437
line 498
;498:	{
line 499
;499:		removeBotsMenuInfo.icon_hilite.generic.flags |= QMF_HIDDEN;
ADDRLP4 1048
ADDRGP4 removeBotsMenuInfo+2488+72
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRU4
CNSTU4 4096
BORU4
ASGNU4
line 500
;500:		removeBotsMenuInfo.icon.generic.flags |= QMF_HIDDEN;
ADDRLP4 1052
ADDRGP4 removeBotsMenuInfo+2372+72
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRU4
CNSTU4 4096
BORU4
ASGNU4
line 501
;501:	}
LABELV $437
line 503
;502:
;503:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.background );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 504
;504:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.banner );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 505
;505:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.arrows );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 506
;506:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.up );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 507
;507:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.down );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+1528
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 508
;508:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $452
JUMPV
LABELV $449
line 509
;509:		Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.bots[n] );
ADDRGP4 removeBotsMenuInfo
ARGP4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+1644
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 510
;510:	}
LABELV $450
line 508
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $452
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $449
line 511
;511:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.deleteBot );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+2604
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 512
;512:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.back );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+2720
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 513
;513:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.icon_hilite );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+2488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 514
;514:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.icon );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+2372
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 516
;515:
;516:	removeBotsMenuInfo.baseBotNum = 0;
ADDRGP4 removeBotsMenuInfo+2840
CNSTI4 0
ASGNI4
line 517
;517:	removeBotsMenuInfo.selectedBotNum = 0;
ADDRGP4 removeBotsMenuInfo+2844
CNSTI4 0
ASGNI4
line 518
;518:	removeBotsMenuInfo.bots[0].color = color_white;
ADDRGP4 removeBotsMenuInfo+1644+100
ADDRGP4 color_white
ASGNP4
line 520
;519:
;520:	RemoveBots_SetBotIcon();
ADDRGP4 RemoveBots_SetBotIcon
CALLV
pop
line 521
;521:}
LABELV $214
endproc UI_RemoveBotsMenu_Init 1056 12
export UI_RemoveBotsMenu
proc UI_RemoveBotsMenu 0 4
line 535
;522:
;523:
;524:/*
;525:=================
;526:UI_RemoveBotsMenu
;527:
;528:Supports kicking a bot, kicking a player, or voting
;529:for a leader
;530:
;531:All are so similar that they're not worth writing
;532:and maintaining separate modules
;533:=================
;534:*/
;535:void UI_RemoveBotsMenu( int type) {
line 536
;536:	UI_RemoveBotsMenu_Init( type );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 UI_RemoveBotsMenu_Init
CALLV
pop
line 537
;537:	UI_PushMenu( &removeBotsMenuInfo.menu );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 538
;538:}
LABELV $462
endproc UI_RemoveBotsMenu 0 4
bss
align 4
LABELV removeBotsMenuInfo
skip 11344
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
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotNumByName
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
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
LABELV $420
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $383
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $380
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $375
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $372
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $330
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $312
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $284
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $267
byte 1 208
byte 1 163
byte 1 208
byte 1 148
byte 1 208
byte 1 144
byte 1 208
byte 1 155
byte 1 208
byte 1 149
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 149
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 158
byte 1 208
byte 1 162
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 0
align 1
LABELV $264
byte 1 208
byte 1 147
byte 1 208
byte 1 158
byte 1 208
byte 1 155
byte 1 208
byte 1 158
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 149
byte 1 32
byte 1 45
byte 1 32
byte 1 208
byte 1 155
byte 1 208
byte 1 152
byte 1 208
byte 1 148
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 32
byte 1 208
byte 1 154
byte 1 208
byte 1 158
byte 1 208
byte 1 156
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 208
byte 1 148
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $259
byte 1 208
byte 1 147
byte 1 208
byte 1 158
byte 1 208
byte 1 155
byte 1 208
byte 1 158
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 149
byte 1 32
byte 1 45
byte 1 32
byte 1 208
byte 1 154
byte 1 208
byte 1 152
byte 1 208
byte 1 154
byte 1 208
byte 1 157
byte 1 208
byte 1 163
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 0
align 1
LABELV $251
byte 1 82
byte 1 69
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $248
byte 1 67
byte 1 65
byte 1 76
byte 1 76
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 32
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 76
byte 1 69
byte 1 65
byte 1 68
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $243
byte 1 67
byte 1 65
byte 1 76
byte 1 76
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 32
byte 1 75
byte 1 73
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $220
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
LABELV $212
byte 1 37
byte 1 52
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $206
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $200
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $199
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $198
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $197
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $196
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $169
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
LABELV $136
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
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $131
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
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
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $126
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
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $108
byte 1 116
byte 1 0
align 1
LABELV $101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $99
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $90
byte 1 110
byte 1 0
