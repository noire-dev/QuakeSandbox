bss
align 4
LABELV $82
skip 3084
align 1
LABELV $83
skip 1024
export UI_CurrentPlayerTeam
code
proc UI_CurrentPlayerTeam 8 12
file "../../../code/q3_ui/ui_ingame.c"
line 73
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:INGAME MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:
;13:
;14:
;15:#include "ui_local.h"
;16:#include "ui_dynamicmenu.h"
;17:
;18:
;19:#define INGAME_FRAME		"menu/art/addbotframe"
;20:#define INGAME_SCROLL		"menu/uie_art/separator"
;21://#define INGAME_FRAME					"menu/art/cut_frame"
;22:#define INGAME_MENU_VERTICAL_SPACING	26
;23:
;24:#define MAX_INGAME_SCROLLS 		6
;25:#define SCROLL_HEIGHT			16
;26:
;27:#define ID_TEAM					10
;28:#define ID_ADDBOTS				11
;29:#define ID_REMOVEBOTS			12
;30:#define ID_SETUP				13
;31:#define ID_SERVERINFO			14
;32:#define ID_LEAVEARENA			15
;33:#define ID_RESTART				16
;34:#define ID_QUIT					17
;35:#define ID_RESUME				18
;36:#define ID_TEAMORDERS			19
;37:#define ID_NEXTMAP				20
;38:#define ID_ENABLEDITEMS			21
;39:
;40:
;41:typedef struct {
;42:	menuframework_s	menu;
;43:
;44:	menubitmap_s	frame;
;45:	menutext_s		team;
;46:	menutext_s		setup;
;47:	menutext_s		server;
;48:	menutext_s		leave;
;49:	menutext_s		restart;
;50:	menutext_s		addbots;
;51:	menutext_s		removebots;
;52:	menutext_s		teamorders;
;53:	menutext_s		quit;
;54:	menutext_s		resume;
;55:	menutext_s		nextmap;
;56:	menutext_s		enableditems;
;57:
;58:	int num_scrolls;
;59:	int scroll_y[MAX_INGAME_SCROLLS];
;60:} ingamemenu_t;
;61:
;62:static ingamemenu_t	s_ingame;
;63:
;64:
;65:
;66:
;67:/*
;68:=================
;69:UI_CurrentPlayerTeam
;70:=================
;71:*/
;72:int UI_CurrentPlayerTeam( void )
;73:{
line 77
;74:	static uiClientState_t	cs;
;75:	static char	info[MAX_INFO_STRING];
;76:
;77:	trap_GetClientState( &cs );
ADDRGP4 $82
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 78
;78:	trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRGP4 $82+8
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRGP4 $83
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 79
;79:	return atoi(Info_ValueForKey(info, "t"));
ADDRGP4 $83
ARGP4
ADDRGP4 $85
ARGP4
ADDRLP4 0
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $81
endproc UI_CurrentPlayerTeam 8 12
proc InGame_RestartAction 0 8
line 89
;80:}
;81:
;82:
;83:
;84:/*
;85:=================
;86:InGame_RestartAction
;87:=================
;88:*/
;89:static void InGame_RestartAction( qboolean result ) {
line 90
;90:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $87
line 91
;91:		return;
ADDRGP4 $86
JUMPV
LABELV $87
line 94
;92:	}
;93:
;94:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 95
;95:	trap_Cmd_ExecuteText( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $89
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 96
;96:}
LABELV $86
endproc InGame_RestartAction 0 8
proc InGame_QuitAction 0 4
line 104
;97:
;98:
;99:/*
;100:=================
;101:InGame_QuitAction
;102:=================
;103:*/
;104:static void InGame_QuitAction( qboolean result ) {
line 105
;105:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $91
line 106
;106:		return;
ADDRGP4 $90
JUMPV
LABELV $91
line 108
;107:	}
;108:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 109
;109:	UI_CreditMenu(0);
CNSTI4 0
ARGI4
ADDRGP4 UI_CreditMenu
CALLV
pop
line 110
;110:}
LABELV $90
endproc InGame_QuitAction 0 4
proc InGame_NextMap 1060 12
line 119
;111:
;112:
;113:/*
;114:=================
;115:InGame_NextMap
;116:=================
;117:*/
;118:static void InGame_NextMap( qboolean result )
;119:{
line 125
;120:	int gametype;
;121:	char	info[MAX_INFO_STRING];
;122:	int i;
;123:	int numPlayers;
;124:
;125:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $94
line 126
;126:		return;
ADDRGP4 $93
JUMPV
LABELV $94
line 128
;127:	}
;128:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 130
;129:
;130:	gametype = DynamicMenu_ServerGametype();
ADDRLP4 1036
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1036
INDIRI4
ASGNI4
line 131
;131:	if (gametype == GT_TOURNAMENT)
ADDRLP4 1032
INDIRI4
CNSTI4 3
NEI4 $96
line 132
;132:	{
line 133
;133:		trap_Cmd_ExecuteText( EXEC_INSERT, "set activeAction \"");
CNSTI4 1
ARGI4
ADDRGP4 $98
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 135
;134:
;135:		trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 136
;136:		numPlayers = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 4
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
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1044
INDIRI4
ASGNI4
line 139
;137:
;138:		// try and move all bots to spectator mode
;139:		for( i = 0; i < numPlayers; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $100
line 140
;140:			trap_GetConfigString( CS_PLAYERS + i, info, MAX_INFO_STRING );
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 142
;141:
;142:			if (!atoi( Info_ValueForKey( info, "skill" ) ))
ADDRLP4 4
ARGP4
ADDRGP4 $106
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
CNSTI4 0
NEI4 $104
line 143
;143:				continue;
ADDRGP4 $101
JUMPV
LABELV $104
line 145
;144:
;145:			trap_Cmd_ExecuteText( EXEC_INSERT, va("forceteam %i spectator;", i));
ADDRGP4 $107
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 146
;146:		}
LABELV $101
line 139
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $103
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
LTI4 $100
line 147
;147:		trap_Cmd_ExecuteText( EXEC_INSERT, "\"\n");
CNSTI4 1
ARGI4
ADDRGP4 $108
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 148
;148:	}
LABELV $96
line 149
;149:	trap_Cmd_ExecuteText( EXEC_APPEND, "vstr nextmap\n");
CNSTI4 2
ARGI4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 150
;150:}
LABELV $93
endproc InGame_NextMap 1060 12
proc InGame_EventHandler 4 12
line 162
;151:
;152:
;153:
;154:/*
;155:=================
;156:InGame_EventHandler
;157:
;158:May be used by dynamic menu system also
;159:=================
;160:*/
;161:static void InGame_EventHandler(int id)
;162:{
line 163
;163:	switch( id ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $111
ADDRLP4 0
INDIRI4
CNSTI4 21
GTI4 $111
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $150-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $150
address $113
address $136
address $137
address $114
address $135
address $115
address $117
address $126
address $139
address $138
address $140
address $149
code
LABELV $113
line 165
;164:	case ID_TEAM:
;165:		UI_TeamMainMenu();
ADDRGP4 UI_TeamMainMenu
CALLV
pop
line 166
;166:		break;
ADDRGP4 $112
JUMPV
LABELV $114
line 169
;167:
;168:	case ID_SETUP:
;169:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 170
;170:		break;
ADDRGP4 $112
JUMPV
LABELV $115
line 173
;171:
;172:	case ID_LEAVEARENA:
;173:		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $116
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 174
;174:		break;
ADDRGP4 $112
JUMPV
LABELV $117
line 177
;175:
;176:	case ID_RESTART:
;177:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $118
line 178
;178:		UI_ConfirmMenu( "RESTART ARENA?", 0, InGame_RestartAction );
ADDRGP4 $121
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_RestartAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 179
;179:		}
LABELV $118
line 180
;180:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $112
line 181
;181:		UI_ConfirmMenu( "РЕСТАРТ АРЕНЫ?", 0, InGame_RestartAction );
ADDRGP4 $125
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_RestartAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 182
;182:		}
line 183
;183:		break;
ADDRGP4 $112
JUMPV
LABELV $126
line 186
;184:
;185:	case ID_QUIT:
;186:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $127
line 187
;187:		UI_ConfirmMenu( "EXIT GAME?", 0, InGame_QuitAction );
ADDRGP4 $130
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_QuitAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 188
;188:		}
LABELV $127
line 189
;189:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $112
line 190
;190:		UI_ConfirmMenu( "ВЫЙТИ ИЗ ИГРЫ?", 0, InGame_QuitAction );
ADDRGP4 $134
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_QuitAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 191
;191:		}
line 192
;192:		break;
ADDRGP4 $112
JUMPV
LABELV $135
line 195
;193:
;194:	case ID_SERVERINFO:
;195:		UI_ServerInfoMenu();
ADDRGP4 UI_ServerInfoMenu
CALLV
pop
line 196
;196:		break;
ADDRGP4 $112
JUMPV
LABELV $136
line 199
;197:
;198:	case ID_ADDBOTS:
;199:		UI_AddBotsMenu();
ADDRGP4 UI_AddBotsMenu
CALLV
pop
line 200
;200:		break;
ADDRGP4 $112
JUMPV
LABELV $137
line 203
;201:
;202:	case ID_REMOVEBOTS:
;203:		UI_RemoveBotsMenu(RBM_KICKBOT);
CNSTI4 0
ARGI4
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 204
;204:		break;
ADDRGP4 $112
JUMPV
LABELV $138
line 207
;205:
;206:	case ID_TEAMORDERS:
;207:		UI_BotCommandMenu_f();
ADDRGP4 UI_BotCommandMenu_f
CALLV
pop
line 208
;208:		break;
ADDRGP4 $112
JUMPV
LABELV $139
line 211
;209:
;210:	case ID_RESUME:
;211:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 212
;212:		break;
ADDRGP4 $112
JUMPV
LABELV $140
line 215
;213:
;214:	case ID_NEXTMAP:
;215:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $141
line 216
;216:		UI_ConfirmMenu( "NEXT MAP?", 0, InGame_NextMap);
ADDRGP4 $144
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_NextMap
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 217
;217:		}
LABELV $141
line 218
;218:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $112
line 219
;219:		UI_ConfirmMenu( "СЛЕДУЮШАЯ КАРТА?", 0, InGame_NextMap);
ADDRGP4 $148
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_NextMap
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 220
;220:		}
line 221
;221:		break;
ADDRGP4 $112
JUMPV
LABELV $149
line 224
;222:
;223:	case ID_ENABLEDITEMS:
;224:		UIE_InGame_EnabledItems();
ADDRGP4 UIE_InGame_EnabledItems
CALLV
pop
line 225
;225:		break;
LABELV $111
LABELV $112
line 227
;226:	}
;227:}
LABELV $110
endproc InGame_EventHandler 4 12
proc InGame_Event 0 4
line 237
;228:
;229:
;230:
;231:
;232:/*
;233:=================
;234:InGame_Event
;235:=================
;236:*/
;237:static void InGame_Event( void *ptr, int notification ) {
line 238
;238:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $153
line 239
;239:		return;
ADDRGP4 $152
JUMPV
LABELV $153
line 242
;240:	}
;241:
;242:	InGame_EventHandler(((menucommon_s*)ptr)->id );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 InGame_EventHandler
CALLV
pop
line 243
;243:}
LABELV $152
endproc InGame_Event 0 4
proc InGame_MenuDraw 4 20
line 253
;244:
;245:
;246:
;247:/*
;248:=================
;249:InGame_MenuDraw
;250:=================
;251:*/
;252:static void InGame_MenuDraw(void)
;253:{
line 256
;254:	int i;
;255:
;256:	for (i = 0; i < s_ingame.num_scrolls; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $159
JUMPV
LABELV $156
line 257
;257:		UI_DrawNamedPic(320 - 64, s_ingame.scroll_y[i],  128, SCROLL_HEIGHT, INGAME_SCROLL);
CNSTF4 1132462080
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_ingame+2444
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1098907648
ARGF4
ADDRGP4 $162
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 258
;258:	}
LABELV $157
line 256
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $159
ADDRLP4 0
INDIRI4
ADDRGP4 s_ingame+2440
INDIRI4
LTI4 $156
line 261
;259:
;260:	// draw the controls
;261:	Menu_Draw(&s_ingame.menu);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 262
;262:}
LABELV $155
endproc InGame_MenuDraw 4 20
export InGame_MenuInit
proc InGame_MenuInit 68 12
line 271
;263:
;264:
;265:
;266:/*
;267:=================
;268:InGame_MenuInit
;269:=================
;270:*/
;271:void InGame_MenuInit( void ) {
line 275
;272:	int		y;
;273:	int gametype;
;274:
;275:	memset( &s_ingame, 0 ,sizeof(ingamemenu_t) );
ADDRGP4 s_ingame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2468
ARGI4
ADDRGP4 memset
CALLP4
pop
line 277
;276:
;277:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 279
;278:
;279:	gametype = DynamicMenu_ServerGametype();
ADDRLP4 8
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 280
;280:	s_ingame.menu.wrapAround = qtrue;
ADDRGP4 s_ingame+1044
CNSTI4 1
ASGNI4
line 281
;281:	s_ingame.menu.native = qfalse;
ADDRGP4 s_ingame+1056
CNSTI4 0
ASGNI4
line 282
;282:	s_ingame.menu.fullscreen = qfalse;
ADDRGP4 s_ingame+1052
CNSTI4 0
ASGNI4
line 283
;283:	s_ingame.menu.draw = InGame_MenuDraw;
ADDRGP4 s_ingame+1036
ADDRGP4 InGame_MenuDraw
ASGNP4
line 285
;284:
;285:	s_ingame.frame.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_ingame+1076
CNSTI4 6
ASGNI4
line 286
;286:	s_ingame.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_ingame+1076+72
CNSTU4 16384
ASGNU4
line 287
;287:	s_ingame.frame.generic.name			= INGAME_FRAME;
ADDRGP4 s_ingame+1076+4
ADDRGP4 $173
ASGNP4
line 288
;288:	s_ingame.frame.generic.x			= 320-233;
ADDRGP4 s_ingame+1076+28
CNSTI4 87
ASGNI4
line 289
;289:	s_ingame.frame.generic.y			= 232-196;
ADDRGP4 s_ingame+1076+32
CNSTI4 36
ASGNI4
line 290
;290:	s_ingame.frame.width				= 466;
ADDRGP4 s_ingame+1076+104
CNSTI4 466
ASGNI4
line 291
;291:	s_ingame.frame.height				= 396;
ADDRGP4 s_ingame+1076+108
CNSTI4 396
ASGNI4
line 294
;292:
;293:	//y = 96;
;294:	y = 50;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 295
;295:	s_ingame.team.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1192
CNSTI4 9
ASGNI4
line 296
;296:	s_ingame.team.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1192+72
CNSTU4 264
ASGNU4
line 297
;297:	s_ingame.team.generic.x				= 320;
ADDRGP4 s_ingame+1192+28
CNSTI4 320
ASGNI4
line 298
;298:	s_ingame.team.generic.y				= y;
ADDRGP4 s_ingame+1192+32
ADDRLP4 0
INDIRI4
ASGNI4
line 299
;299:	s_ingame.team.generic.id			= ID_TEAM;
ADDRGP4 s_ingame+1192+24
CNSTI4 10
ASGNI4
line 300
;300:	s_ingame.team.generic.callback		= InGame_Event;
ADDRGP4 s_ingame+1192+76
ADDRGP4 InGame_Event
ASGNP4
line 301
;301:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $193
line 302
;302:	s_ingame.team.string				= "START";
ADDRGP4 s_ingame+1192+88
ADDRGP4 $198
ASGNP4
line 303
;303:	}
LABELV $193
line 304
;304:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $199
line 305
;305:	s_ingame.team.string				= "СТАРТ";
ADDRGP4 s_ingame+1192+88
ADDRGP4 $204
ASGNP4
line 306
;306:	}
LABELV $199
line 307
;307:	s_ingame.team.color					= color_red;
ADDRGP4 s_ingame+1192+100
ADDRGP4 color_red
ASGNP4
line 308
;308:	s_ingame.team.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1192+92
CNSTI4 17
ASGNI4
line 310
;309:
;310:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 311
;311:	s_ingame.addbots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+1712
CNSTI4 9
ASGNI4
line 312
;312:	s_ingame.addbots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1712+72
CNSTU4 264
ASGNU4
line 313
;313:	s_ingame.addbots.generic.x			= 320;
ADDRGP4 s_ingame+1712+28
CNSTI4 320
ASGNI4
line 314
;314:	s_ingame.addbots.generic.y			= y;
ADDRGP4 s_ingame+1712+32
ADDRLP4 0
INDIRI4
ASGNI4
line 315
;315:	s_ingame.addbots.generic.id			= ID_ADDBOTS;
ADDRGP4 s_ingame+1712+24
CNSTI4 11
ASGNI4
line 316
;316:	s_ingame.addbots.generic.callback	= InGame_Event;
ADDRGP4 s_ingame+1712+76
ADDRGP4 InGame_Event
ASGNP4
line 317
;317:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $220
line 318
;318:	s_ingame.addbots.string				= "ADD BOTS";
ADDRGP4 s_ingame+1712+88
ADDRGP4 $225
ASGNP4
line 319
;319:	}
LABELV $220
line 320
;320:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $226
line 321
;321:	s_ingame.addbots.string				= "ДОБАВИТЬ БОТОВ";
ADDRGP4 s_ingame+1712+88
ADDRGP4 $231
ASGNP4
line 322
;322:	}
LABELV $226
line 323
;323:	s_ingame.addbots.color				= color_red;
ADDRGP4 s_ingame+1712+100
ADDRGP4 color_red
ASGNP4
line 324
;324:	s_ingame.addbots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1712+92
CNSTI4 17
ASGNI4
line 325
;325:	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) ) {
ADDRGP4 $238
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 0
EQF4 $240
ADDRGP4 $239
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $236
LABELV $240
line 326
;326:		s_ingame.addbots.generic.flags |= QMF_GRAYED;
ADDRLP4 20
ADDRGP4 s_ingame+1712+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 327
;327:	}
LABELV $236
line 329
;328:
;329:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 330
;330:	s_ingame.removebots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+1816
CNSTI4 9
ASGNI4
line 331
;331:	s_ingame.removebots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1816+72
CNSTU4 264
ASGNU4
line 332
;332:	s_ingame.removebots.generic.x			= 320;
ADDRGP4 s_ingame+1816+28
CNSTI4 320
ASGNI4
line 333
;333:	s_ingame.removebots.generic.y			= y;
ADDRGP4 s_ingame+1816+32
ADDRLP4 0
INDIRI4
ASGNI4
line 334
;334:	s_ingame.removebots.generic.id			= ID_REMOVEBOTS;
ADDRGP4 s_ingame+1816+24
CNSTI4 12
ASGNI4
line 335
;335:	s_ingame.removebots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+1816+76
ADDRGP4 InGame_Event
ASGNP4
line 336
;336:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $254
line 337
;337:	s_ingame.removebots.string				= "REMOVE BOTS";
ADDRGP4 s_ingame+1816+88
ADDRGP4 $259
ASGNP4
line 338
;338:	}
LABELV $254
line 339
;339:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $260
line 340
;340:	s_ingame.removebots.string				= "УДАЛИТЬ БОТОВ";
ADDRGP4 s_ingame+1816+88
ADDRGP4 $265
ASGNP4
line 341
;341:	}
LABELV $260
line 342
;342:	s_ingame.removebots.color				= color_red;
ADDRGP4 s_ingame+1816+100
ADDRGP4 color_red
ASGNP4
line 343
;343:	s_ingame.removebots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1816+92
CNSTI4 17
ASGNI4
line 344
;344:	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) ) {
ADDRGP4 $238
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
CNSTF4 0
EQF4 $272
ADDRGP4 $239
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
NEF4 $270
LABELV $272
line 345
;345:		s_ingame.removebots.generic.flags |= QMF_GRAYED;
ADDRLP4 28
ADDRGP4 s_ingame+1816+72
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 346
;346:	}
LABELV $270
line 348
;347:
;348:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 349
;349:	s_ingame.teamorders.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+1920
CNSTI4 9
ASGNI4
line 350
;350:	s_ingame.teamorders.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1920+72
CNSTU4 264
ASGNU4
line 351
;351:	s_ingame.teamorders.generic.x			= 320;
ADDRGP4 s_ingame+1920+28
CNSTI4 320
ASGNI4
line 352
;352:	s_ingame.teamorders.generic.y			= y;
ADDRGP4 s_ingame+1920+32
ADDRLP4 0
INDIRI4
ASGNI4
line 353
;353:	s_ingame.teamorders.generic.id			= ID_TEAMORDERS;
ADDRGP4 s_ingame+1920+24
CNSTI4 19
ASGNI4
line 354
;354:	s_ingame.teamorders.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+1920+76
ADDRGP4 InGame_Event
ASGNP4
line 355
;355:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $286
line 356
;356:	s_ingame.teamorders.string				= "TEAM ORDERS";
ADDRGP4 s_ingame+1920+88
ADDRGP4 $291
ASGNP4
line 357
;357:	}
LABELV $286
line 358
;358:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $292
line 359
;359:	s_ingame.teamorders.string				= "КОМАНДНЫЕ ПРИКАЗЫ";
ADDRGP4 s_ingame+1920+88
ADDRGP4 $297
ASGNP4
line 360
;360:	}
LABELV $292
line 361
;361:	s_ingame.teamorders.color				= color_red;
ADDRGP4 s_ingame+1920+100
ADDRGP4 color_red
ASGNP4
line 362
;362:	s_ingame.teamorders.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1920+92
CNSTI4 17
ASGNI4
line 363
;363:	if( !(gametype >= GT_TEAM) ) {
ADDRLP4 4
INDIRI4
CNSTI4 4
GEI4 $302
line 364
;364:		s_ingame.teamorders.generic.flags |= QMF_GRAYED;
ADDRLP4 28
ADDRGP4 s_ingame+1920+72
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 365
;365:	}
ADDRGP4 $303
JUMPV
LABELV $302
line 366
;366:	else if( UI_CurrentPlayerTeam() == TEAM_SPECTATOR ) {
ADDRLP4 28
ADDRGP4 UI_CurrentPlayerTeam
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 3
NEI4 $306
line 367
;367:		s_ingame.teamorders.generic.flags |= QMF_GRAYED;
ADDRLP4 32
ADDRGP4 s_ingame+1920+72
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 368
;368:	}
LABELV $306
LABELV $303
line 370
;369:	
;370:	if(gametype == GT_LMS) {
ADDRLP4 4
INDIRI4
CNSTI4 11
NEI4 $310
line 371
;371:	s_ingame.teamorders.generic.flags |= QMF_GRAYED;	
ADDRLP4 32
ADDRGP4 s_ingame+1920+72
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 372
;372:	}
LABELV $310
line 374
;373:
;374:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 375
;375:    s_ingame.scroll_y[ s_ingame.num_scrolls++ ] = y;
ADDRLP4 36
ADDRGP4 s_ingame+2440
ASGNP4
ADDRLP4 32
ADDRLP4 36
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_ingame+2444
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 377
;376:
;377:    y += SCROLL_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 378
;378:	s_ingame.setup.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1296
CNSTI4 9
ASGNI4
line 379
;379:	s_ingame.setup.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1296+72
CNSTU4 264
ASGNU4
line 380
;380:	s_ingame.setup.generic.x			= 320;
ADDRGP4 s_ingame+1296+28
CNSTI4 320
ASGNI4
line 381
;381:	s_ingame.setup.generic.y			= y;
ADDRGP4 s_ingame+1296+32
ADDRLP4 0
INDIRI4
ASGNI4
line 382
;382:	s_ingame.setup.generic.id			= ID_SETUP;
ADDRGP4 s_ingame+1296+24
CNSTI4 13
ASGNI4
line 383
;383:	s_ingame.setup.generic.callback		= InGame_Event;
ADDRGP4 s_ingame+1296+76
ADDRGP4 InGame_Event
ASGNP4
line 384
;384:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $327
line 385
;385:	s_ingame.setup.string				= "SETUP";
ADDRGP4 s_ingame+1296+88
ADDRGP4 $332
ASGNP4
line 386
;386:	}
LABELV $327
line 387
;387:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $333
line 388
;388:	s_ingame.setup.string				= "НАСТРОЙКИ";
ADDRGP4 s_ingame+1296+88
ADDRGP4 $338
ASGNP4
line 389
;389:	}
LABELV $333
line 390
;390:	s_ingame.setup.color				= color_red;
ADDRGP4 s_ingame+1296+100
ADDRGP4 color_red
ASGNP4
line 391
;391:	s_ingame.setup.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1296+92
CNSTI4 17
ASGNI4
line 393
;392:
;393:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 394
;394:	s_ingame.server.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+1400
CNSTI4 9
ASGNI4
line 395
;395:	s_ingame.server.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1400+72
CNSTU4 264
ASGNU4
line 396
;396:	s_ingame.server.generic.x			= 320;
ADDRGP4 s_ingame+1400+28
CNSTI4 320
ASGNI4
line 397
;397:	s_ingame.server.generic.y			= y;
ADDRGP4 s_ingame+1400+32
ADDRLP4 0
INDIRI4
ASGNI4
line 398
;398:	s_ingame.server.generic.id			= ID_SERVERINFO;
ADDRGP4 s_ingame+1400+24
CNSTI4 14
ASGNI4
line 399
;399:	s_ingame.server.generic.callback	= InGame_Event;
ADDRGP4 s_ingame+1400+76
ADDRGP4 InGame_Event
ASGNP4
line 400
;400:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $354
line 401
;401:	s_ingame.server.string				= "SERVER INFO";
ADDRGP4 s_ingame+1400+88
ADDRGP4 $359
ASGNP4
line 402
;402:	}
LABELV $354
line 403
;403:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $360
line 404
;404:	s_ingame.server.string				= "ИНФОРМАЦИЯ О СЕРВЕРЕ";
ADDRGP4 s_ingame+1400+88
ADDRGP4 $365
ASGNP4
line 405
;405:	}
LABELV $360
line 406
;406:	s_ingame.server.color				= color_red;
ADDRGP4 s_ingame+1400+100
ADDRGP4 color_red
ASGNP4
line 407
;407:	s_ingame.server.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1400+92
CNSTI4 17
ASGNI4
line 409
;408:
;409:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 410
;410:    s_ingame.scroll_y[ s_ingame.num_scrolls++ ] = y;
ADDRLP4 44
ADDRGP4 s_ingame+2440
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRP4
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_ingame+2444
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 412
;411:
;412:    y += SCROLL_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 413
;413:	s_ingame.enableditems.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+2336
CNSTI4 9
ASGNI4
line 414
;414:	s_ingame.enableditems.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+2336+72
CNSTU4 264
ASGNU4
line 415
;415:	s_ingame.enableditems.generic.x			= 320;
ADDRGP4 s_ingame+2336+28
CNSTI4 320
ASGNI4
line 416
;416:	s_ingame.enableditems.generic.y			= y;
ADDRGP4 s_ingame+2336+32
ADDRLP4 0
INDIRI4
ASGNI4
line 417
;417:	s_ingame.enableditems.generic.id			= ID_ENABLEDITEMS;
ADDRGP4 s_ingame+2336+24
CNSTI4 21
ASGNI4
line 418
;418:	s_ingame.enableditems.generic.callback		= InGame_Event;
ADDRGP4 s_ingame+2336+76
ADDRGP4 InGame_Event
ASGNP4
line 419
;419:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $383
line 420
;420:	s_ingame.enableditems.string				= "DISABLE ITEMS";
ADDRGP4 s_ingame+2336+88
ADDRGP4 $388
ASGNP4
line 421
;421:	}
LABELV $383
line 422
;422:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $389
line 423
;423:	s_ingame.enableditems.string				= "ОТКЛЮЧЕНИЕ ПРЕДМЕТОВ";
ADDRGP4 s_ingame+2336+88
ADDRGP4 $394
ASGNP4
line 424
;424:	}
LABELV $389
line 425
;425:	s_ingame.enableditems.color				= color_red;
ADDRGP4 s_ingame+2336+100
ADDRGP4 color_red
ASGNP4
line 426
;426:	s_ingame.enableditems.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+2336+92
CNSTI4 17
ASGNI4
line 427
;427:	if( !trap_Cvar_VariableValue( "sv_running" ) )
ADDRGP4 $238
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 48
INDIRF4
CNSTF4 0
NEF4 $399
line 428
;428:	{
line 429
;429:		s_ingame.enableditems.generic.flags |= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 s_ingame+2336+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 430
;430:	}
LABELV $399
line 432
;431:
;432:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 433
;433:	s_ingame.restart.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+1608
CNSTI4 9
ASGNI4
line 434
;434:	s_ingame.restart.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1608+72
CNSTU4 264
ASGNU4
line 435
;435:	s_ingame.restart.generic.x			= 320;
ADDRGP4 s_ingame+1608+28
CNSTI4 320
ASGNI4
line 436
;436:	s_ingame.restart.generic.y			= y;
ADDRGP4 s_ingame+1608+32
ADDRLP4 0
INDIRI4
ASGNI4
line 437
;437:	s_ingame.restart.generic.id			= ID_RESTART;
ADDRGP4 s_ingame+1608+24
CNSTI4 16
ASGNI4
line 438
;438:	s_ingame.restart.generic.callback	= InGame_Event;
ADDRGP4 s_ingame+1608+76
ADDRGP4 InGame_Event
ASGNP4
line 439
;439:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $414
line 440
;440:	s_ingame.restart.string				= "RESTART ARENA";
ADDRGP4 s_ingame+1608+88
ADDRGP4 $419
ASGNP4
line 441
;441:	}
LABELV $414
line 442
;442:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $420
line 443
;443:	s_ingame.restart.string				= "РЕСТАРТ АРЕНЫ";
ADDRGP4 s_ingame+1608+88
ADDRGP4 $425
ASGNP4
line 444
;444:	}
LABELV $420
line 445
;445:	s_ingame.restart.color				= color_red;
ADDRGP4 s_ingame+1608+100
ADDRGP4 color_red
ASGNP4
line 446
;446:	s_ingame.restart.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1608+92
CNSTI4 17
ASGNI4
line 447
;447:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $238
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 0
NEF4 $430
line 448
;448:		s_ingame.restart.generic.flags |= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 s_ingame+1608+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 449
;449:	}
LABELV $430
line 451
;450:
;451:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 452
;452:	s_ingame.nextmap.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+2232
CNSTI4 9
ASGNI4
line 453
;453:	s_ingame.nextmap.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+2232+72
CNSTU4 264
ASGNU4
line 454
;454:	s_ingame.nextmap.generic.x			= 320;
ADDRGP4 s_ingame+2232+28
CNSTI4 320
ASGNI4
line 455
;455:	s_ingame.nextmap.generic.y			= y;
ADDRGP4 s_ingame+2232+32
ADDRLP4 0
INDIRI4
ASGNI4
line 456
;456:	s_ingame.nextmap.generic.id			= ID_NEXTMAP;
ADDRGP4 s_ingame+2232+24
CNSTI4 20
ASGNI4
line 457
;457:	s_ingame.nextmap.generic.callback	= InGame_Event;
ADDRGP4 s_ingame+2232+76
ADDRGP4 InGame_Event
ASGNP4
line 458
;458:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $445
line 459
;459:	s_ingame.nextmap.string				= "NEXT MAP";
ADDRGP4 s_ingame+2232+88
ADDRGP4 $450
ASGNP4
line 460
;460:	}
LABELV $445
line 461
;461:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $451
line 462
;462:	s_ingame.nextmap.string				= "СЛЕДУЮШАЯ КАРТА";
ADDRGP4 s_ingame+2232+88
ADDRGP4 $456
ASGNP4
line 463
;463:	}
LABELV $451
line 464
;464:	s_ingame.nextmap.color				= color_red;
ADDRGP4 s_ingame+2232+100
ADDRGP4 color_red
ASGNP4
line 465
;465:	s_ingame.nextmap.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+2232+92
CNSTI4 17
ASGNI4
line 466
;466:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $238
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 0
NEF4 $461
line 467
;467:		s_ingame.nextmap.generic.flags |= QMF_GRAYED;
ADDRLP4 60
ADDRGP4 s_ingame+2232+72
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 468
;468:	}
LABELV $461
line 469
;469:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 470
;470:	s_ingame.resume.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+2128
CNSTI4 9
ASGNI4
line 471
;471:	s_ingame.resume.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+2128+72
CNSTU4 264
ASGNU4
line 472
;472:	s_ingame.resume.generic.x				= 320;
ADDRGP4 s_ingame+2128+28
CNSTI4 320
ASGNI4
line 473
;473:	s_ingame.resume.generic.y				= y;
ADDRGP4 s_ingame+2128+32
ADDRLP4 0
INDIRI4
ASGNI4
line 474
;474:	s_ingame.resume.generic.id				= ID_RESUME;
ADDRGP4 s_ingame+2128+24
CNSTI4 18
ASGNI4
line 475
;475:	s_ingame.resume.generic.callback		= InGame_Event;
ADDRGP4 s_ingame+2128+76
ADDRGP4 InGame_Event
ASGNP4
line 476
;476:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $476
line 477
;477:	s_ingame.resume.string					= "RESUME GAME";
ADDRGP4 s_ingame+2128+88
ADDRGP4 $481
ASGNP4
line 478
;478:	}
LABELV $476
line 479
;479:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $482
line 480
;480:	s_ingame.resume.string					= "ПРОДОЛЖИТЬ ИГРУ";
ADDRGP4 s_ingame+2128+88
ADDRGP4 $487
ASGNP4
line 481
;481:	}
LABELV $482
line 482
;482:	s_ingame.resume.color					= color_red;
ADDRGP4 s_ingame+2128+100
ADDRGP4 color_red
ASGNP4
line 483
;483:	s_ingame.resume.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+2128+92
CNSTI4 17
ASGNI4
line 485
;484:
;485:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 486
;486:    s_ingame.scroll_y[ s_ingame.num_scrolls++ ] = y;
ADDRLP4 64
ADDRGP4 s_ingame+2440
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_ingame+2444
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 488
;487:
;488:    y += SCROLL_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 489
;489:	s_ingame.leave.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1504
CNSTI4 9
ASGNI4
line 490
;490:	s_ingame.leave.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1504+72
CNSTU4 264
ASGNU4
line 491
;491:	s_ingame.leave.generic.x			= 320;
ADDRGP4 s_ingame+1504+28
CNSTI4 320
ASGNI4
line 492
;492:	s_ingame.leave.generic.y			= y;
ADDRGP4 s_ingame+1504+32
ADDRLP4 0
INDIRI4
ASGNI4
line 493
;493:	s_ingame.leave.generic.id			= ID_LEAVEARENA;
ADDRGP4 s_ingame+1504+24
CNSTI4 15
ASGNI4
line 494
;494:	s_ingame.leave.generic.callback		= InGame_Event;
ADDRGP4 s_ingame+1504+76
ADDRGP4 InGame_Event
ASGNP4
line 495
;495:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $505
line 496
;496:	s_ingame.leave.string				= "LEAVE ARENA";
ADDRGP4 s_ingame+1504+88
ADDRGP4 $510
ASGNP4
line 497
;497:	}
LABELV $505
line 498
;498:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $511
line 499
;499:	s_ingame.leave.string				= "ПОКИНУТЬ АРЕНУ";
ADDRGP4 s_ingame+1504+88
ADDRGP4 $516
ASGNP4
line 500
;500:	}
LABELV $511
line 501
;501:	s_ingame.leave.color				= color_red;
ADDRGP4 s_ingame+1504+100
ADDRGP4 color_red
ASGNP4
line 502
;502:	s_ingame.leave.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1504+92
CNSTI4 17
ASGNI4
line 504
;503:
;504:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 26
ADDI4
ASGNI4
line 505
;505:	s_ingame.quit.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+2024
CNSTI4 9
ASGNI4
line 506
;506:	s_ingame.quit.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+2024+72
CNSTU4 264
ASGNU4
line 507
;507:	s_ingame.quit.generic.x				= 320;
ADDRGP4 s_ingame+2024+28
CNSTI4 320
ASGNI4
line 508
;508:	s_ingame.quit.generic.y				= y;
ADDRGP4 s_ingame+2024+32
ADDRLP4 0
INDIRI4
ASGNI4
line 509
;509:	s_ingame.quit.generic.id			= ID_QUIT;
ADDRGP4 s_ingame+2024+24
CNSTI4 17
ASGNI4
line 510
;510:	s_ingame.quit.generic.callback		= InGame_Event;
ADDRGP4 s_ingame+2024+76
ADDRGP4 InGame_Event
ASGNP4
line 511
;511:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $532
line 512
;512:	s_ingame.quit.string				= "EXIT GAME";
ADDRGP4 s_ingame+2024+88
ADDRGP4 $537
ASGNP4
line 513
;513:	}
LABELV $532
line 514
;514:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $538
line 515
;515:	s_ingame.quit.string				= "ВЫЙТИ ИЗ ИГРЫ";
ADDRGP4 s_ingame+2024+88
ADDRGP4 $543
ASGNP4
line 516
;516:	}
LABELV $538
line 517
;517:	s_ingame.quit.color					= color_red;
ADDRGP4 s_ingame+2024+100
ADDRGP4 color_red
ASGNP4
line 518
;518:	s_ingame.quit.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+2024+92
CNSTI4 17
ASGNI4
line 520
;519:
;520:	Menu_AddItem( &s_ingame.menu, &s_ingame.frame );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 521
;521:	Menu_AddItem( &s_ingame.menu, &s_ingame.team );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1192
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 522
;522:	Menu_AddItem( &s_ingame.menu, &s_ingame.addbots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1712
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 523
;523:	Menu_AddItem( &s_ingame.menu, &s_ingame.removebots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1816
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 524
;524:	Menu_AddItem( &s_ingame.menu, &s_ingame.teamorders );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1920
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 525
;525:	Menu_AddItem( &s_ingame.menu, &s_ingame.setup );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 526
;526:	Menu_AddItem( &s_ingame.menu, &s_ingame.server );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1400
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 527
;527:	Menu_AddItem( &s_ingame.menu, &s_ingame.enableditems );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+2336
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 528
;528:	Menu_AddItem( &s_ingame.menu, &s_ingame.restart );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 529
;529:	Menu_AddItem( &s_ingame.menu, &s_ingame.nextmap );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+2232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 530
;530:	Menu_AddItem( &s_ingame.menu, &s_ingame.resume );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+2128
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 531
;531:	Menu_AddItem( &s_ingame.menu, &s_ingame.leave );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 532
;532:	Menu_AddItem( &s_ingame.menu, &s_ingame.quit );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+2024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 533
;533:}
LABELV $163
endproc InGame_MenuInit 68 12
export InGame_Cache
proc InGame_Cache 0 4
line 541
;534:
;535:
;536:/*
;537:=================
;538:InGame_Cache
;539:=================
;540:*/
;541:void InGame_Cache( void ) {
line 542
;542:	trap_R_RegisterShaderNoMip( INGAME_FRAME );
ADDRGP4 $173
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 543
;543:}
LABELV $561
endproc InGame_Cache 0 4
data
align 4
LABELV gametypeMenu_data
byte 4 0
address $563
byte 4 1
address $564
byte 4 2
address $565
byte 4 3
address $566
byte 4 4
address $567
byte 4 5
address $568
byte 4 6
address $569
byte 4 7
address $570
byte 4 8
address $571
byte 4 9
address $572
byte 4 10
address $573
byte 4 11
address $574
byte 4 12
address $575
byte 4 13
address $576
align 4
LABELV gametypeMenu_dataru
byte 4 0
address $577
byte 4 1
address $578
byte 4 2
address $579
byte 4 3
address $580
byte 4 4
address $581
byte 4 5
address $582
byte 4 6
address $583
byte 4 7
address $584
byte 4 8
address $585
byte 4 9
address $586
byte 4 10
address $587
byte 4 11
address $588
byte 4 12
address $589
byte 4 13
address $590
align 4
LABELV gametypeMenu_size
byte 4 14
align 4
LABELV jointeam_cmd
address $599
address $600
address $601
address $602
address $603
address $604
address $605
code
proc InGameDynamic_Close 0 0
line 710
;544:
;545:
;546:
;547:/*
;548:=======================================================================
;549:
;550:INGAME ESCAPE MENU, USING DYNAMIC MENU SYSTEM
;551:
;552:=======================================================================
;553:*/
;554:
;555:
;556:typedef struct {
;557:	int 	gametype;
;558:	char* 	menu;
;559:} gametypeMenu;
;560:
;561:
;562:
;563:static gametypeMenu gametypeMenu_data[] = {
;564:	{ GT_SANDBOX, "SandBox"},
;565:	{ GT_FFA, "DeathMatch"},
;566:	{ GT_SINGLE, "Single"},
;567:	{ GT_TOURNAMENT, "Tournament"},
;568:	{ GT_TEAM, "Team DM"},
;569:	{ GT_CTF, "CTF"},
;570:	{ GT_1FCTF, "One Flag"},
;571:	{ GT_OBELISK, "Overload"},
;572:	{ GT_HARVESTER, "Harvester"},
;573:	{ GT_ELIMINATION, "Elimination"},
;574:	{ GT_CTF_ELIMINATION, "CTF Elimination"},
;575:	{ GT_LMS, "Last Man Standing"},
;576:	{ GT_DOUBLE_D, "2 Domination"},
;577:	{ GT_DOMINATION, "Domination"},
;578:};
;579:static gametypeMenu gametypeMenu_dataru[] = {
;580:	{ GT_SANDBOX, "Песочница"},
;581:	{ GT_FFA, "Все против всех"},
;582:	{ GT_SINGLE, "Одиночная игра"},
;583:	{ GT_TOURNAMENT, "Турнир"},
;584:	{ GT_TEAM, "Командный бой"},
;585:	{ GT_CTF, "Захват флага"},
;586:	{ GT_1FCTF, "Один флаг"},
;587:	{ GT_OBELISK, "Атака базы"},
;588:	{ GT_HARVESTER, "Жнец"},
;589:	{ GT_ELIMINATION, "Устранение"},
;590:	{ GT_CTF_ELIMINATION, "CTF Устранение"},
;591:	{ GT_LMS, "Последний оставшийся"},
;592:	{ GT_DOUBLE_D, "2 доминирование"},
;593:	{ GT_DOMINATION, "Доминирование"},
;594:};
;595:
;596:
;597:static int gametypeMenu_size = sizeof(gametypeMenu_data)/sizeof(gametypeMenu_data[0]);
;598:
;599:
;600:
;601:// main dynamic in game menu
;602:enum {
;603:	IGM_CLOSE,
;604:	IGM_ACTIONS,
;605:	IGM_SAVE,
;606:	IGM_START,
;607:	IGM_BOTS,
;608:	IGM_TEAMORDERS,
;609:	IGM_SETUP,
;610:	IGM_MAP,
;611:	IGM_VOTE,
;612:	IGM_CALLVOTE,
;613:	IGM_EXIT
;614:};
;615:
;616:
;617:
;618:// callvote misc options
;619:enum {
;620:	CVM_NEXTMAP,
;621:	CVM_MAPRESTART
;622:};
;623:
;624:
;625:// callvote options
;626:enum {
;627:	IGCV_KICK,
;628:	IGCV_MAP,
;629:	IGCV_LEADER,
;630:	IGCV_GAMETYPE,
;631:	IGCV_MISC
;632:};
;633:
;634:
;635:// vote options
;636:enum {
;637:	IGV_YES,
;638:	IGV_NO,
;639:	IGV_TEAMYES,
;640:	IGV_TEAMNO
;641:};
;642:
;643:
;644:// setup options
;645:enum {
;646:	IGS_PLAYER,
;647:	IGS_MODEL,
;648:	IGS_CONTROLS,
;649:	IGS_OPTIONS,
;650:	IGS_GRAPHICS,
;651:	IGS_DISPLAY,
;652:	IGS_SOUND,
;653:	IGS_NETWORK,
;654:	IGS_ADVANCED
;655:};
;656:
;657:// actions options
;658:enum {
;659:	IGS_RECORD,
;660:	IGS_STOPRECORD,
;661:	IGS_KILL
;662:};
;663:
;664:// save options
;665:enum {
;666:	IGS_SAVE1,
;667:	IGS_SAVE2,
;668:	IGS_SAVE3,
;669:	IGS_SAVE4,
;670:	IGS_SAVE5,
;671:	IGS_SAVE6,
;672:	IGS_SAVE7,
;673:	IGS_SAVE8
;674:};
;675:
;676:
;677:// join team options
;678:enum {
;679:	DM_START_SPECTATOR,
;680:	DM_START_GAME,
;681:	DM_START_RED,
;682:	DM_START_BLUE,
;683:	DM_START_AUTO,
;684:	DM_START_FOLLOW1,
;685:	DM_START_FOLLOW2,
;686:
;687:	DM_START_MAX
;688:};
;689:
;690:static char* jointeam_cmd[DM_START_MAX] = {
;691:	"spectator",	// DM_START_SPECTATOR
;692:	"free",	// DM_START_GAME
;693:	"red",	// DM_START_RED
;694:	"blue",	// DM_START_BLUE
;695:	"auto",	// DM_START_AUTO
;696:	"follow1",	// DM_START_FOLLOW1
;697:	"follow2"	// DM_START_FOLLOW2
;698:};
;699:
;700:
;701:
;702:
;703:
;704:/*
;705:=================
;706:InGameDynamic_Close
;707:=================
;708:*/
;709:static void InGameDynamic_Close( void )
;710:{
line 712
;711://	UI_PopMenu();
;712:}
LABELV $606
endproc InGameDynamic_Close 0 0
proc IG_FragLimit_Event 12 8
line 724
;713:
;714:
;715:
;716:
;717:
;718:/*
;719:=================
;720:IG_FragLimit_Event
;721:=================
;722:*/
;723:static void IG_FragLimit_Event( int index )
;724:{
line 727
;725:	int id;
;726:
;727:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 728
;728:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 730
;729:
;730:	trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote fraglimit %i\n",id));
ADDRGP4 $608
ARGP4
ADDRLP4 0
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
line 731
;731:}
LABELV $607
endproc IG_FragLimit_Event 12 8
proc IG_TimeLimit_Event 12 8
line 740
;732:
;733:
;734:/*
;735:=================
;736:IG_TimeLimit_Event
;737:=================
;738:*/
;739:static void IG_TimeLimit_Event( int index )
;740:{
line 743
;741:	int id;
;742:
;743:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 744
;744:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 746
;745:
;746:	trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote timelimit %i\n",id));
ADDRGP4 $610
ARGP4
ADDRLP4 0
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
line 747
;747:}
LABELV $609
endproc IG_TimeLimit_Event 12 8
proc IG_DoWarmup_Event 12 8
line 757
;748:
;749:
;750:
;751:/*
;752:=================
;753:IG_DoWarmup_Event
;754:=================
;755:*/
;756:static void IG_DoWarmup_Event( int index )
;757:{
line 760
;758:	int id;
;759:
;760:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 761
;761:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 763
;762:
;763:	trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote g_doWarmup %i\n",id));
ADDRGP4 $612
ARGP4
ADDRLP4 0
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
line 764
;764:}
LABELV $611
endproc IG_DoWarmup_Event 12 8
proc IG_UseOldInGame_Event 16 8
line 774
;765:
;766:
;767:
;768:/*
;769:=================
;770:IG_UseOldInGame_Event
;771:=================
;772:*/
;773:static void IG_UseOldInGame_Event( int index )
;774:{
line 778
;775:	int id;
;776:	char* s;
;777:
;778:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 779
;779:	InGameDynamic_Close();
ADDRGP4 InGameDynamic_Close
CALLV
pop
line 781
;780:
;781:	switch (id) {
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $614
ADDRLP4 0
INDIRI4
CNSTI4 21
GTI4 $614
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $618-44
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $618
address $615
address $615
address $614
address $614
address $615
address $615
address $615
address $614
address $614
address $615
address $615
code
line 789
;782:	case ID_ADDBOTS:
;783:	case ID_REMOVEBOTS:
;784:	case ID_RESTART:
;785:	case ID_LEAVEARENA:
;786:	case ID_QUIT:
;787:	case ID_ENABLEDITEMS:
;788:	case ID_NEXTMAP:
;789:		break;
LABELV $614
line 791
;790:	default:
;791:		Com_Printf("IG_UseOldInGame_Event: unknown id (%i)", id);
ADDRGP4 $617
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 792
;792:		return;
ADDRGP4 $613
JUMPV
LABELV $615
line 795
;793:	}
;794:
;795:	InGame_EventHandler(id);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 InGame_EventHandler
CALLV
pop
line 796
;796:}
LABELV $613
endproc IG_UseOldInGame_Event 16 8
proc IG_Setup_Event 16 8
line 807
;797:
;798:
;799:
;800:
;801:/*
;802:=================
;803:IG_Setup_Event
;804:=================
;805:*/
;806:static void IG_Setup_Event( int index )
;807:{
line 811
;808:	int id;
;809:	char* s;
;810:
;811:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 812
;812:	InGameDynamic_Close();
ADDRGP4 InGameDynamic_Close
CALLV
pop
line 814
;813:
;814:	switch (id) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $621
ADDRLP4 12
INDIRI4
CNSTI4 8
GTI4 $621
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $633
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $633
address $623
address $624
address $625
address $626
address $627
address $628
address $629
address $630
address $631
code
LABELV $623
line 816
;815:	case IGS_PLAYER:
;816:		UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 817
;817:		break;
ADDRGP4 $622
JUMPV
LABELV $624
line 819
;818:	case IGS_MODEL:
;819:		UI_PlayerModelMenu();
ADDRGP4 UI_PlayerModelMenu
CALLV
pop
line 820
;820:		break;
ADDRGP4 $622
JUMPV
LABELV $625
line 822
;821:	case IGS_CONTROLS:
;822:		UI_ControlsMenu();
ADDRGP4 UI_ControlsMenu
CALLV
pop
line 823
;823:		break;
ADDRGP4 $622
JUMPV
LABELV $626
line 825
;824:	case IGS_OPTIONS:
;825:		UI_PreferencesMenu();
ADDRGP4 UI_PreferencesMenu
CALLV
pop
line 826
;826:		break;
ADDRGP4 $622
JUMPV
LABELV $627
line 828
;827:	case IGS_GRAPHICS:
;828:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 829
;829:		break;
ADDRGP4 $622
JUMPV
LABELV $628
line 831
;830:	case IGS_DISPLAY:
;831:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 832
;832:		break;
ADDRGP4 $622
JUMPV
LABELV $629
line 834
;833:	case IGS_SOUND:
;834:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 835
;835:		break;
ADDRGP4 $622
JUMPV
LABELV $630
line 837
;836:	case IGS_NETWORK:
;837:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 838
;838:		break;
ADDRGP4 $622
JUMPV
LABELV $631
line 840
;839:	case IGS_ADVANCED:
;840:		UI_AdvancedMenu();
ADDRGP4 UI_AdvancedMenu
CALLV
pop
line 841
;841:		break;
ADDRGP4 $622
JUMPV
LABELV $621
line 843
;842:	default:
;843:		Com_Printf("IG_Setup_Event: unknown id (%i)", id);
ADDRGP4 $632
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 844
;844:		return;
LABELV $622
line 846
;845:	}
;846:}
LABELV $620
endproc IG_Setup_Event 16 8
proc IG_Actions_Event 16 8
line 854
;847:
;848:/*
;849:=================
;850:IG_Actions_Event
;851:=================
;852:*/
;853:static void IG_Actions_Event( int index )
;854:{
line 858
;855:	int id;
;856:	char* s;
;857:
;858:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 859
;859:	InGameDynamic_Close();
ADDRGP4 InGameDynamic_Close
CALLV
pop
line 861
;860:
;861:	switch (id) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $637
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $639
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $641
ADDRGP4 $635
JUMPV
LABELV $637
line 863
;862:	case IGS_RECORD:
;863:		trap_Cmd_ExecuteText( EXEC_APPEND, "record \n");
CNSTI4 2
ARGI4
ADDRGP4 $638
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 864
;864:		break;
ADDRGP4 $636
JUMPV
LABELV $639
line 866
;865:	case IGS_STOPRECORD:
;866:		trap_Cmd_ExecuteText( EXEC_APPEND, "stoprecord \n");
CNSTI4 2
ARGI4
ADDRGP4 $640
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 867
;867:		break;
ADDRGP4 $636
JUMPV
LABELV $641
line 869
;868:	case IGS_KILL:
;869:		trap_Cmd_ExecuteText( EXEC_APPEND, "kill \n");
CNSTI4 2
ARGI4
ADDRGP4 $642
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 870
;870:		break;
ADDRGP4 $636
JUMPV
LABELV $635
line 872
;871:	default:
;872:		Com_Printf("IG_Actions_Event: unknown id (%i)", id);
ADDRGP4 $643
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 873
;873:		return;
LABELV $636
line 875
;874:	}
;875:}
LABELV $634
endproc IG_Actions_Event 16 8
proc IG_Save_Event 16 8
line 883
;876:
;877:/*
;878:=================
;879:IG_Save_Event
;880:=================
;881:*/
;882:static void IG_Save_Event( int index )
;883:{
line 887
;884:	int id;
;885:	char* s;
;886:
;887:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 888
;888:	InGameDynamic_Close();
ADDRGP4 InGameDynamic_Close
CALLV
pop
line 890
;889:
;890:	switch (id) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $645
ADDRLP4 12
INDIRI4
CNSTI4 7
GTI4 $645
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $664
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $664
address $647
address $649
address $651
address $653
address $655
address $657
address $659
address $661
code
LABELV $647
line 892
;891:	case IGS_SAVE1:
;892:		trap_Cmd_ExecuteText( EXEC_APPEND, "savegame 1 \n");
CNSTI4 2
ARGI4
ADDRGP4 $648
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 893
;893:		break;
ADDRGP4 $646
JUMPV
LABELV $649
line 895
;894:	case IGS_SAVE2:
;895:		trap_Cmd_ExecuteText( EXEC_APPEND, "savegame 2 \n");
CNSTI4 2
ARGI4
ADDRGP4 $650
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 896
;896:		break;
ADDRGP4 $646
JUMPV
LABELV $651
line 898
;897:	case IGS_SAVE3:
;898:		trap_Cmd_ExecuteText( EXEC_APPEND, "savegame 3 \n");
CNSTI4 2
ARGI4
ADDRGP4 $652
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 899
;899:		break;
ADDRGP4 $646
JUMPV
LABELV $653
line 901
;900:	case IGS_SAVE4:
;901:		trap_Cmd_ExecuteText( EXEC_APPEND, "savegame 4 \n");
CNSTI4 2
ARGI4
ADDRGP4 $654
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 902
;902:		break;
ADDRGP4 $646
JUMPV
LABELV $655
line 904
;903:	case IGS_SAVE5:
;904:		trap_Cmd_ExecuteText( EXEC_APPEND, "savegame 5 \n");
CNSTI4 2
ARGI4
ADDRGP4 $656
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 905
;905:		break;
ADDRGP4 $646
JUMPV
LABELV $657
line 907
;906:	case IGS_SAVE6:
;907:		trap_Cmd_ExecuteText( EXEC_APPEND, "savegame 6 \n");
CNSTI4 2
ARGI4
ADDRGP4 $658
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 908
;908:		break;
ADDRGP4 $646
JUMPV
LABELV $659
line 910
;909:	case IGS_SAVE7:
;910:		trap_Cmd_ExecuteText( EXEC_APPEND, "savegame 7 \n");
CNSTI4 2
ARGI4
ADDRGP4 $660
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 911
;911:		break;
ADDRGP4 $646
JUMPV
LABELV $661
line 913
;912:	case IGS_SAVE8:
;913:		trap_Cmd_ExecuteText( EXEC_APPEND, "savegame 8 \n");
CNSTI4 2
ARGI4
ADDRGP4 $662
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 914
;914:		break;
ADDRGP4 $646
JUMPV
LABELV $645
line 916
;915:	default:
;916:		Com_Printf("IG_Save_Event: unknown id (%i)", id);
ADDRGP4 $663
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 917
;917:		return;
LABELV $646
line 919
;918:	}
;919:}
LABELV $644
endproc IG_Save_Event 16 8
proc IG_CallVoteGameType_Event 16 8
line 930
;920:
;921:
;922:
;923:
;924:/*
;925:=================
;926:IG_CallVoteGameType_Event
;927:=================
;928:*/
;929:static void IG_CallVoteGameType_Event( int index )
;930:{
line 933
;931:	int id;
;932:
;933:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 934
;934:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 936
;935:
;936:	switch (id) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $666
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $666
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $670
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $670
address $667
address $667
address $667
address $667
address $667
address $667
address $667
address $667
address $667
address $667
address $667
address $667
address $667
address $667
code
line 951
;937:	case GT_SANDBOX:
;938:	case GT_FFA:
;939:	case GT_SINGLE:
;940:	case GT_TOURNAMENT:
;941:	case GT_TEAM:
;942:	case GT_CTF:
;943:	case GT_1FCTF:
;944:	case GT_OBELISK:
;945:	case GT_HARVESTER:
;946:	case GT_ELIMINATION:
;947:	case GT_CTF_ELIMINATION:
;948:	case GT_LMS:
;949:	case GT_DOUBLE_D:
;950:	case GT_DOMINATION:
;951:		break;
LABELV $666
line 954
;952:
;953:	default:
;954:		Com_Printf("IG_CallVoteGameType_Event: unknown game-id (%i)", id);
ADDRGP4 $669
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 955
;955:		return;
ADDRGP4 $665
JUMPV
LABELV $667
line 958
;956:	}
;957:
;958:	trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote g_gametype %i\n",id));
ADDRGP4 $671
ARGP4
ADDRLP4 0
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
line 959
;959:}
LABELV $665
endproc IG_CallVoteGameType_Event 16 8
proc IG_CallVoteMisc_Event 20 8
line 969
;960:
;961:
;962:
;963:/*
;964:=================
;965:IG_CallVoteMisc_Event
;966:=================
;967:*/
;968:static void IG_CallVoteMisc_Event( int index )
;969:{
line 973
;970:	int id;
;971:	char* s;
;972:
;973:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 974
;974:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 976
;975:
;976:	switch (id) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $675
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $677
ADDRGP4 $673
JUMPV
LABELV $675
line 978
;977:	case CVM_NEXTMAP:
;978:		s = "nextmap";
ADDRLP4 4
ADDRGP4 $676
ASGNP4
line 979
;979:		break;
ADDRGP4 $674
JUMPV
LABELV $677
line 981
;980:	case CVM_MAPRESTART:
;981:		s = "map_restart";
ADDRLP4 4
ADDRGP4 $678
ASGNP4
line 982
;982:		break;
ADDRGP4 $674
JUMPV
LABELV $673
line 984
;983:	default:
;984:		Com_Printf("IG_CallVote_Event: unknown id (%i)", id);
ADDRGP4 $679
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 985
;985:		return;
ADDRGP4 $672
JUMPV
LABELV $674
line 988
;986:	}
;987:
;988:	trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote %s\n",s));
ADDRGP4 $680
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 989
;989:}
LABELV $672
endproc IG_CallVoteMisc_Event 20 8
proc IG_CallVote_Event 16 8
line 1000
;990:
;991:
;992:
;993:
;994:/*
;995:=================
;996:IG_CallVote_Event
;997:=================
;998:*/
;999:static void IG_CallVote_Event( int index )
;1000:{
line 1004
;1001:	int id;
;1002:	char* s;
;1003:
;1004:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1005
;1005:	InGameDynamic_Close();
ADDRGP4 InGameDynamic_Close
CALLV
pop
line 1007
;1006:
;1007:	switch (id) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $684
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $685
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $686
ADDRGP4 $682
JUMPV
LABELV $684
line 1009
;1008:	case IGCV_KICK:
;1009:		UI_RemoveBotsMenu(RBM_CALLVOTEKICK);
CNSTI4 1
ARGI4
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 1010
;1010:		break;
ADDRGP4 $683
JUMPV
LABELV $685
line 1012
;1011:	case IGCV_MAP:
;1012:		UI_MapCallVote();
ADDRGP4 UI_MapCallVote
CALLV
pop
line 1013
;1013:		break;
ADDRGP4 $683
JUMPV
LABELV $686
line 1015
;1014:	case IGCV_LEADER:
;1015:		UI_RemoveBotsMenu(RBM_CALLVOTELEADER);
CNSTI4 2
ARGI4
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 1016
;1016:		break;
ADDRGP4 $683
JUMPV
LABELV $682
line 1018
;1017:	default:
;1018:		Com_Printf("IG_CallVote_Event: unknown id (%i)", id);
ADDRGP4 $679
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1019
;1019:		return;
LABELV $683
line 1021
;1020:	}
;1021:}
LABELV $681
endproc IG_CallVote_Event 16 8
proc IG_Vote_Event 16 8
line 1032
;1022:
;1023:
;1024:
;1025:
;1026:/*
;1027:=================
;1028:IG_Vote_Event
;1029:=================
;1030:*/
;1031:static void IG_Vote_Event( int index )
;1032:{
line 1036
;1033:	int id;
;1034:	char* s;
;1035:
;1036:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1037
;1037:	InGameDynamic_Close();
ADDRGP4 InGameDynamic_Close
CALLV
pop
line 1039
;1038:
;1039:	switch (id) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $688
ADDRLP4 12
INDIRI4
CNSTI4 3
GTI4 $688
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $698
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $698
address $690
address $692
address $694
address $696
code
LABELV $690
line 1041
;1040:	case IGV_YES:
;1041:		s = "vote yes\n";
ADDRLP4 4
ADDRGP4 $691
ASGNP4
line 1042
;1042:		break;
ADDRGP4 $689
JUMPV
LABELV $692
line 1044
;1043:	case IGV_NO:
;1044:		s = "vote no\n";
ADDRLP4 4
ADDRGP4 $693
ASGNP4
line 1045
;1045:		break;
ADDRGP4 $689
JUMPV
LABELV $694
line 1047
;1046:	case IGV_TEAMYES:
;1047:		s = "teamvote yes\n";
ADDRLP4 4
ADDRGP4 $695
ASGNP4
line 1048
;1048:		break;
ADDRGP4 $689
JUMPV
LABELV $696
line 1050
;1049:	case IGV_TEAMNO:
;1050:		s = "teamvote yes\n";
ADDRLP4 4
ADDRGP4 $695
ASGNP4
line 1051
;1051:		break;
ADDRGP4 $689
JUMPV
LABELV $688
line 1053
;1052:	default:
;1053:		Com_Printf("IG_Vote_Event: unknown id (%i)", id);
ADDRGP4 $697
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1054
;1054:		return;
ADDRGP4 $687
JUMPV
LABELV $689
line 1057
;1055:	}
;1056:
;1057:	trap_Cmd_ExecuteText( EXEC_APPEND, s);
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1058
;1058:}
LABELV $687
endproc IG_Vote_Event 16 8
proc IG_TeamOrders_Event 0 0
line 1068
;1059:
;1060:
;1061:
;1062:/*
;1063:=================
;1064:IG_TeamOrders_Event
;1065:=================
;1066:*/
;1067:static void IG_TeamOrders_Event( int index )
;1068:{
line 1069
;1069:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1070
;1070:	UI_BotCommandMenu_f();
ADDRGP4 UI_BotCommandMenu_f
CALLV
pop
line 1071
;1071:}
LABELV $699
endproc IG_TeamOrders_Event 0 0
proc IG_Start_Event 20 8
line 1080
;1072:
;1073:
;1074:/*
;1075:=================
;1076:IG_Start_Event
;1077:=================
;1078:*/
;1079:static void IG_Start_Event( int index )
;1080:{
line 1084
;1081:	int id;
;1082:	char* s;
;1083:
;1084:	id = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1085
;1085:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 1087
;1086:
;1087:	if (id < 0 || id >= DM_START_MAX) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $703
ADDRLP4 0
INDIRI4
CNSTI4 7
LTI4 $701
LABELV $703
line 1088
;1088:		Com_Printf("IG_Start_Event: unknown id (%i)", id);
ADDRGP4 $704
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1089
;1089:		return;
ADDRGP4 $700
JUMPV
LABELV $701
line 1092
;1090:	}
;1091:
;1092:	trap_Cmd_ExecuteText( EXEC_APPEND, va("team %s\n", jointeam_cmd[id]));
ADDRGP4 $705
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 jointeam_cmd
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1093
;1093:}
LABELV $700
endproc IG_Start_Event 20 8
proc IG_TimeLimit_SubMenu 4 16
line 1105
;1094:
;1095:
;1096:
;1097:
;1098:
;1099:/*
;1100:=================
;1101:IG_TimeLimit_SubMenu
;1102:=================
;1103:*/
;1104:static void IG_TimeLimit_SubMenu( void )
;1105:{
line 1108
;1106:	int depth;
;1107:
;1108:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1109
;1109:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $707
line 1110
;1110:	DynamicMenu_AddItem("Unlimited", 0, 0, IG_TimeLimit_Event);
ADDRGP4 $710
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1111
;1111:	DynamicMenu_AddItem("5", 5, 0, IG_TimeLimit_Event);
ADDRGP4 $711
ARGP4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1112
;1112:	DynamicMenu_AddItem("10", 10, 0, IG_TimeLimit_Event);
ADDRGP4 $712
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1113
;1113:	DynamicMenu_AddItem("15", 15, 0, IG_TimeLimit_Event);
ADDRGP4 $713
ARGP4
CNSTI4 15
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1114
;1114:	DynamicMenu_AddItem("20", 20, 0, IG_TimeLimit_Event);
ADDRGP4 $714
ARGP4
CNSTI4 20
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1115
;1115:	DynamicMenu_AddItem("25", 25, 0, IG_TimeLimit_Event);
ADDRGP4 $715
ARGP4
CNSTI4 25
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1116
;1116:	DynamicMenu_AddItem("30", 30, 0, IG_TimeLimit_Event);
ADDRGP4 $716
ARGP4
CNSTI4 30
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1117
;1117:	DynamicMenu_AddItem("45", 45, 0, IG_TimeLimit_Event);
ADDRGP4 $717
ARGP4
CNSTI4 45
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1118
;1118:	DynamicMenu_AddItem("60", 60, 0, IG_TimeLimit_Event);
ADDRGP4 $718
ARGP4
CNSTI4 60
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1119
;1119:	}
LABELV $707
line 1120
;1120:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $719
line 1121
;1121:	DynamicMenu_AddItem("Бесконечно", 0, 0, IG_TimeLimit_Event);
ADDRGP4 $722
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1122
;1122:	DynamicMenu_AddItem("5", 5, 0, IG_TimeLimit_Event);
ADDRGP4 $711
ARGP4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1123
;1123:	DynamicMenu_AddItem("10", 10, 0, IG_TimeLimit_Event);
ADDRGP4 $712
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1124
;1124:	DynamicMenu_AddItem("15", 15, 0, IG_TimeLimit_Event);
ADDRGP4 $713
ARGP4
CNSTI4 15
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1125
;1125:	DynamicMenu_AddItem("20", 20, 0, IG_TimeLimit_Event);
ADDRGP4 $714
ARGP4
CNSTI4 20
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1126
;1126:	DynamicMenu_AddItem("25", 25, 0, IG_TimeLimit_Event);
ADDRGP4 $715
ARGP4
CNSTI4 25
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1127
;1127:	DynamicMenu_AddItem("30", 30, 0, IG_TimeLimit_Event);
ADDRGP4 $716
ARGP4
CNSTI4 30
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1128
;1128:	DynamicMenu_AddItem("45", 45, 0, IG_TimeLimit_Event);
ADDRGP4 $717
ARGP4
CNSTI4 45
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1129
;1129:	DynamicMenu_AddItem("60", 60, 0, IG_TimeLimit_Event);
ADDRGP4 $718
ARGP4
CNSTI4 60
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TimeLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1130
;1130:	}
LABELV $719
line 1132
;1131:
;1132:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1133
;1133:}
LABELV $706
endproc IG_TimeLimit_SubMenu 4 16
proc IG_FragLimit_SubMenu 4 16
line 1143
;1134:
;1135:
;1136:
;1137:/*
;1138:=================
;1139:IG_FragLimit_SubMenu
;1140:=================
;1141:*/
;1142:static void IG_FragLimit_SubMenu( void )
;1143:{
line 1146
;1144:	int depth;
;1145:
;1146:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1147
;1147:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $724
line 1148
;1148:	DynamicMenu_AddItem("Unlimited", 0, 0, IG_FragLimit_Event);
ADDRGP4 $710
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1149
;1149:	DynamicMenu_AddItem("10", 10, 0, IG_FragLimit_Event);
ADDRGP4 $712
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1150
;1150:	DynamicMenu_AddItem("15", 15, 0, IG_FragLimit_Event);
ADDRGP4 $713
ARGP4
CNSTI4 15
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1151
;1151:	DynamicMenu_AddItem("20", 20, 0, IG_FragLimit_Event);
ADDRGP4 $714
ARGP4
CNSTI4 20
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1152
;1152:	DynamicMenu_AddItem("30", 30, 0, IG_FragLimit_Event);
ADDRGP4 $716
ARGP4
CNSTI4 30
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1153
;1153:	DynamicMenu_AddItem("40", 40, 0, IG_FragLimit_Event);
ADDRGP4 $727
ARGP4
CNSTI4 40
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1154
;1154:	DynamicMenu_AddItem("50", 50, 0, IG_FragLimit_Event);
ADDRGP4 $728
ARGP4
CNSTI4 50
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1155
;1155:	DynamicMenu_AddItem("75", 75, 0, IG_FragLimit_Event);
ADDRGP4 $729
ARGP4
CNSTI4 75
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1156
;1156:	DynamicMenu_AddItem("100", 100, 0, IG_FragLimit_Event);
ADDRGP4 $730
ARGP4
CNSTI4 100
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1157
;1157:	}
LABELV $724
line 1158
;1158:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $731
line 1159
;1159:	DynamicMenu_AddItem("Бесконечно", 0, 0, IG_FragLimit_Event);
ADDRGP4 $722
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1160
;1160:	DynamicMenu_AddItem("10", 10, 0, IG_FragLimit_Event);
ADDRGP4 $712
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1161
;1161:	DynamicMenu_AddItem("15", 15, 0, IG_FragLimit_Event);
ADDRGP4 $713
ARGP4
CNSTI4 15
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1162
;1162:	DynamicMenu_AddItem("20", 20, 0, IG_FragLimit_Event);
ADDRGP4 $714
ARGP4
CNSTI4 20
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1163
;1163:	DynamicMenu_AddItem("30", 30, 0, IG_FragLimit_Event);
ADDRGP4 $716
ARGP4
CNSTI4 30
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1164
;1164:	DynamicMenu_AddItem("40", 40, 0, IG_FragLimit_Event);
ADDRGP4 $727
ARGP4
CNSTI4 40
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1165
;1165:	DynamicMenu_AddItem("50", 50, 0, IG_FragLimit_Event);
ADDRGP4 $728
ARGP4
CNSTI4 50
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1166
;1166:	DynamicMenu_AddItem("75", 75, 0, IG_FragLimit_Event);
ADDRGP4 $729
ARGP4
CNSTI4 75
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1167
;1167:	DynamicMenu_AddItem("100", 100, 0, IG_FragLimit_Event);
ADDRGP4 $730
ARGP4
CNSTI4 100
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_FragLimit_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1168
;1168:	}
LABELV $731
line 1170
;1169:
;1170:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1171
;1171:}
LABELV $723
endproc IG_FragLimit_SubMenu 4 16
proc IG_DoWarmup_SubMenu 4 16
line 1180
;1172:
;1173:
;1174:/*
;1175:=================
;1176:IG_DoWarmup_SubMenu
;1177:=================
;1178:*/
;1179:static void IG_DoWarmup_SubMenu( void )
;1180:{
line 1183
;1181:	int depth;
;1182:
;1183:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1184
;1184:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $735
line 1185
;1185:	DynamicMenu_AddItem("Enable", 1, 0, IG_DoWarmup_Event);
ADDRGP4 $738
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_DoWarmup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1186
;1186:	DynamicMenu_AddItem("Disable", 0, 0, IG_DoWarmup_Event);
ADDRGP4 $739
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_DoWarmup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1187
;1187:	}
LABELV $735
line 1188
;1188:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $740
line 1189
;1189:	DynamicMenu_AddItem("Включить", 1, 0, IG_DoWarmup_Event);
ADDRGP4 $743
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_DoWarmup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1190
;1190:	DynamicMenu_AddItem("Отключить", 0, 0, IG_DoWarmup_Event);
ADDRGP4 $744
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_DoWarmup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1191
;1191:	}
LABELV $740
line 1193
;1192:
;1193:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1194
;1194:}
LABELV $734
endproc IG_DoWarmup_SubMenu 4 16
proc IG_Map_SubMenu 8 16
line 1204
;1195:
;1196:
;1197:
;1198:/*
;1199:=================
;1200:IG_Map_SubMenu
;1201:=================
;1202:*/
;1203:static void IG_Map_SubMenu( void )
;1204:{
line 1207
;1205:	int depth;
;1206:
;1207:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1208
;1208:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $746
line 1209
;1209:	DynamicMenu_AddItem("Restart map...", ID_RESTART, 0, IG_UseOldInGame_Event);
ADDRGP4 $749
ARGP4
CNSTI4 16
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1210
;1210:	DynamicMenu_AddItem("Disable items...", ID_ENABLEDITEMS, 0, IG_UseOldInGame_Event);
ADDRGP4 $750
ARGP4
CNSTI4 21
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1211
;1211:	DynamicMenu_AddItem("Next map...", ID_NEXTMAP, 0, IG_UseOldInGame_Event);
ADDRGP4 $751
ARGP4
CNSTI4 20
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1212
;1212:	}
LABELV $746
line 1213
;1213:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $752
line 1214
;1214:	DynamicMenu_AddItem("Рестарт карты...", ID_RESTART, 0, IG_UseOldInGame_Event);
ADDRGP4 $755
ARGP4
CNSTI4 16
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1215
;1215:	DynamicMenu_AddItem("Отключение предметов...", ID_ENABLEDITEMS, 0, IG_UseOldInGame_Event);
ADDRGP4 $756
ARGP4
CNSTI4 21
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1216
;1216:	DynamicMenu_AddItem("Следущая карта...", ID_NEXTMAP, 0, IG_UseOldInGame_Event);
ADDRGP4 $757
ARGP4
CNSTI4 20
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1217
;1217:	}
LABELV $752
line 1219
;1218:
;1219:	depth = DynamicMenu_Depth();
ADDRLP4 4
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1221
;1220:
;1221:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1222
;1222:}
LABELV $745
endproc IG_Map_SubMenu 8 16
proc IG_CallVoteMisc_SubMenu 4 16
line 1232
;1223:
;1224:
;1225:
;1226:/*
;1227:=================
;1228:IG_CallVoteMisc_SubMenu
;1229:=================
;1230:*/
;1231:static void IG_CallVoteMisc_SubMenu( void )
;1232:{
line 1233
;1233:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1235
;1234:	
;1235:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $759
line 1236
;1236:	DynamicMenu_AddItem("Next map", CVM_NEXTMAP, 0, IG_CallVoteMisc_Event);
ADDRGP4 $762
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVoteMisc_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1237
;1237:	DynamicMenu_AddItem("Map restart", CVM_MAPRESTART, 0, IG_CallVoteMisc_Event);
ADDRGP4 $763
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVoteMisc_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1238
;1238:	DynamicMenu_AddItem("Warmup", 0, IG_DoWarmup_SubMenu, 0);
ADDRGP4 $764
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 IG_DoWarmup_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1239
;1239:	DynamicMenu_AddItem("Timelimit", 0, IG_TimeLimit_SubMenu, 0);
ADDRGP4 $765
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 IG_TimeLimit_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1240
;1240:	}
LABELV $759
line 1241
;1241:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $766
line 1242
;1242:	DynamicMenu_AddItem("Следующая карта", CVM_NEXTMAP, 0, IG_CallVoteMisc_Event);
ADDRGP4 $769
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVoteMisc_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1243
;1243:	DynamicMenu_AddItem("Рестарт карты", CVM_MAPRESTART, 0, IG_CallVoteMisc_Event);
ADDRGP4 $770
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVoteMisc_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1244
;1244:	DynamicMenu_AddItem("Разминка", 0, IG_DoWarmup_SubMenu, 0);
ADDRGP4 $771
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 IG_DoWarmup_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1245
;1245:	DynamicMenu_AddItem("Лимит времени", 0, IG_TimeLimit_SubMenu, 0);
ADDRGP4 $772
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 IG_TimeLimit_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1246
;1246:	}
LABELV $766
line 1248
;1247:
;1248:	if (DynamicMenu_ServerGametype() == GT_CTF) {
ADDRLP4 0
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $773
line 1250
;1249:		// No CTF caplimit, callvote doesn't support it
;1250:	}
ADDRGP4 $774
JUMPV
LABELV $773
line 1251
;1251:	else {
line 1252
;1252:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $775
line 1253
;1253:		DynamicMenu_AddItem("FragLimit", 0, IG_FragLimit_SubMenu, 0);
ADDRGP4 $778
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 IG_FragLimit_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1254
;1254:		}
LABELV $775
line 1255
;1255:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $779
line 1256
;1256:		DynamicMenu_AddItem("Лимит фрагов", 0, IG_FragLimit_SubMenu, 0);
ADDRGP4 $782
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 IG_FragLimit_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1257
;1257:		}
LABELV $779
line 1258
;1258:	}
LABELV $774
line 1260
;1259:
;1260:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1261
;1261:}
LABELV $758
endproc IG_CallVoteMisc_SubMenu 4 16
proc IG_CallVoteGameType_SubMenu 32 20
line 1271
;1262:
;1263:
;1264:
;1265:/*
;1266:=================
;1267:IG_CallVoteMisc_SubMenu
;1268:=================
;1269:*/
;1270:static void IG_CallVoteGameType_SubMenu( void )
;1271:{
line 1277
;1272:	int gametype;
;1273:	int i;
;1274:	int depth;
;1275:	const char* icon;
;1276:
;1277:	gametype = DynamicMenu_ServerGametype();
ADDRLP4 16
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 1279
;1278:
;1279:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1281
;1280:
;1281:	depth = DynamicMenu_Depth();
ADDRLP4 20
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 1282
;1282:	for (i = 0; i < gametypeMenu_size; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $787
JUMPV
LABELV $784
line 1283
;1283:		icon = UIE_DefaultIconFromGameType(gametypeMenu_data[i].gametype);
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 gametypeMenu_data
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UIE_DefaultIconFromGameType
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 1285
;1284:
;1285:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $788
line 1286
;1286:		DynamicMenu_AddIconItem(gametypeMenu_data[i].menu, gametypeMenu_data[i].gametype,
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 gametypeMenu_data+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRI4
ADDRGP4 gametypeMenu_data
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVoteGameType_Event
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 1288
;1287:			icon, 0, IG_CallVoteGameType_Event);
;1288:}
LABELV $788
line 1289
;1289:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $792
line 1290
;1290:		DynamicMenu_AddIconItem(gametypeMenu_dataru[i].menu, gametypeMenu_data[i].gametype,
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 gametypeMenu_dataru+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRI4
ADDRGP4 gametypeMenu_data
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVoteGameType_Event
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 1292
;1291:			icon, 0, IG_CallVoteGameType_Event);
;1292:}
LABELV $792
line 1294
;1293:
;1294:		if (gametypeMenu_data[i].gametype == gametype)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 gametypeMenu_data
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $796
line 1295
;1295:			DynamicMenu_SetFlags(depth, gametype, QMF_GRAYED);
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRGP4 DynamicMenu_SetFlags
CALLV
pop
LABELV $796
line 1296
;1296:	}
LABELV $785
line 1282
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $787
ADDRLP4 0
INDIRI4
ADDRGP4 gametypeMenu_size
INDIRI4
LTI4 $784
line 1298
;1297:
;1298:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1299
;1299:}
LABELV $783
endproc IG_CallVoteGameType_SubMenu 32 20
proc IG_CallVote_SubMenu 20 16
line 1309
;1300:
;1301:
;1302:
;1303:/*
;1304:=================
;1305:IG_CallVote_SubMenu
;1306:=================
;1307:*/
;1308:static void IG_CallVote_SubMenu( void )
;1309:{
line 1313
;1310:	int team;
;1311:	int depth;
;1312:
;1313:	team = UI_CurrentPlayerTeam();
ADDRLP4 8
ADDRGP4 UI_CurrentPlayerTeam
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1315
;1314:
;1315:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1317
;1316:
;1317:	depth = DynamicMenu_Depth();
ADDRLP4 12
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 1318
;1318:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $799
line 1319
;1319:	DynamicMenu_AddItem("Kick...", IGCV_KICK, 0, IG_CallVote_Event);
ADDRGP4 $802
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1320
;1320:	DynamicMenu_AddItem("Map...", IGCV_MAP, 0, IG_CallVote_Event);
ADDRGP4 $803
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1321
;1321:	DynamicMenu_AddItem("Leader...", IGCV_LEADER, 0, IG_CallVote_Event);
ADDRGP4 $804
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1322
;1322:	DynamicMenu_AddItem("Gametype", IGCV_GAMETYPE, IG_CallVoteGameType_SubMenu, 0);
ADDRGP4 $805
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 IG_CallVoteGameType_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1323
;1323:	DynamicMenu_AddItem("Misc", 0, IG_CallVoteMisc_SubMenu, 0);
ADDRGP4 $806
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 IG_CallVoteMisc_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1324
;1324:	}
LABELV $799
line 1325
;1325:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $807
line 1326
;1326:	DynamicMenu_AddItem("Кик...", IGCV_KICK, 0, IG_CallVote_Event);
ADDRGP4 $810
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1327
;1327:	DynamicMenu_AddItem("Карта...", IGCV_MAP, 0, IG_CallVote_Event);
ADDRGP4 $811
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1328
;1328:	DynamicMenu_AddItem("Лидер...", IGCV_LEADER, 0, IG_CallVote_Event);
ADDRGP4 $812
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_CallVote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1329
;1329:	DynamicMenu_AddItem("Режим игры", IGCV_GAMETYPE, IG_CallVoteGameType_SubMenu, 0);
ADDRGP4 $813
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 IG_CallVoteGameType_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1330
;1330:	DynamicMenu_AddItem("Другое", 0, IG_CallVoteMisc_SubMenu, 0);
ADDRGP4 $814
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 IG_CallVoteMisc_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1331
;1331:	}
LABELV $807
line 1333
;1332:
;1333:	if (team == TEAM_SPECTATOR || team == TEAM_FREE) {
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $817
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $815
LABELV $817
line 1334
;1334:		DynamicMenu_SetFlags(depth, IGCV_LEADER, QMF_GRAYED);
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 8192
ARGI4
ADDRGP4 DynamicMenu_SetFlags
CALLV
pop
line 1335
;1335:	}
LABELV $815
line 1337
;1336:
;1337:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1338
;1338:}
LABELV $798
endproc IG_CallVote_SubMenu 20 16
proc IG_Vote_SubMenu 1032 16
line 1348
;1339:
;1340:
;1341:
;1342:/*
;1343:=================
;1344:IG_Vote_SubMenu
;1345:=================
;1346:*/
;1347:static void IG_Vote_SubMenu( void )
;1348:{
line 1351
;1349:	char buf[MAX_INFO_STRING];
;1350:
;1351:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1353
;1352:
;1353:	trap_GetConfigString(CS_VOTE_TIME, buf, MAX_INFO_STRING);
CNSTI4 8
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1354
;1354:	if (atoi(buf) != 0) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $819
line 1355
;1355:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $821
line 1356
;1356:		DynamicMenu_AddItem("Yes", IGV_YES, 0, IG_Vote_Event);
ADDRGP4 $824
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Vote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1357
;1357:		DynamicMenu_AddItem("No", IGV_NO, 0, IG_Vote_Event);
ADDRGP4 $825
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Vote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1358
;1358:		}
LABELV $821
line 1359
;1359:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $826
line 1360
;1360:		DynamicMenu_AddItem("Да", IGV_YES, 0, IG_Vote_Event);
ADDRGP4 $829
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Vote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1361
;1361:		DynamicMenu_AddItem("Нет", IGV_NO, 0, IG_Vote_Event);
ADDRGP4 $830
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Vote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1362
;1362:		}
LABELV $826
line 1363
;1363:	}
LABELV $819
line 1365
;1364:
;1365:	trap_GetConfigString(CS_TEAMVOTE_TIME, buf, MAX_INFO_STRING);
CNSTI4 12
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1366
;1366:	if (atoi(buf) != 0) {
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $831
line 1367
;1367:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $833
line 1368
;1368:		DynamicMenu_AddItem("Team Yes", IGV_TEAMYES, 0, IG_Vote_Event);
ADDRGP4 $836
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Vote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1369
;1369:		DynamicMenu_AddItem("Team No", IGV_TEAMNO, 0, IG_Vote_Event);
ADDRGP4 $837
ARGP4
CNSTI4 3
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Vote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1370
;1370:		}
LABELV $833
line 1371
;1371:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $838
line 1372
;1372:		DynamicMenu_AddItem("Команда Да", IGV_TEAMYES, 0, IG_Vote_Event);
ADDRGP4 $841
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Vote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1373
;1373:		DynamicMenu_AddItem("Команда Нет", IGV_TEAMNO, 0, IG_Vote_Event);
ADDRGP4 $842
ARGP4
CNSTI4 3
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Vote_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1374
;1374:		}
LABELV $838
line 1375
;1375:	}
LABELV $831
line 1378
;1376:
;1377:
;1378:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1379
;1379:}
LABELV $818
endproc IG_Vote_SubMenu 1032 16
proc IG_Setup_SubMenu 0 16
line 1389
;1380:
;1381:
;1382:
;1383:/*
;1384:=================
;1385:IG_Setup_SubMenu
;1386:=================
;1387:*/
;1388:static void IG_Setup_SubMenu( void )
;1389:{
line 1390
;1390:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1392
;1391:
;1392:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $844
line 1393
;1393:	DynamicMenu_AddItem("Player...", IGS_PLAYER, 0, IG_Setup_Event);
ADDRGP4 $847
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1394
;1394:	DynamicMenu_AddItem("Model...", IGS_MODEL, 0, IG_Setup_Event);
ADDRGP4 $848
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1395
;1395:	DynamicMenu_AddItem("Controls...", IGS_CONTROLS, 0, IG_Setup_Event);
ADDRGP4 $849
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1396
;1396:	DynamicMenu_AddItem("Preferences...", IGS_OPTIONS, 0, IG_Setup_Event);
ADDRGP4 $850
ARGP4
CNSTI4 3
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1397
;1397:	DynamicMenu_AddItem("Graphics...", IGS_GRAPHICS, 0, IG_Setup_Event);
ADDRGP4 $851
ARGP4
CNSTI4 4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1398
;1398:	DynamicMenu_AddItem("Display...", IGS_DISPLAY, 0, IG_Setup_Event);
ADDRGP4 $852
ARGP4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1399
;1399:	DynamicMenu_AddItem("Sound...", IGS_SOUND, 0, IG_Setup_Event);
ADDRGP4 $853
ARGP4
CNSTI4 6
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1400
;1400:	DynamicMenu_AddItem("Network...", IGS_NETWORK, 0, IG_Setup_Event);
ADDRGP4 $854
ARGP4
CNSTI4 7
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1401
;1401:	DynamicMenu_AddItem("Advanced...", IGS_ADVANCED, 0, IG_Setup_Event);
ADDRGP4 $855
ARGP4
CNSTI4 8
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1402
;1402:	}
LABELV $844
line 1403
;1403:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $856
line 1404
;1404:	DynamicMenu_AddItem("Игрок...", IGS_PLAYER, 0, IG_Setup_Event);
ADDRGP4 $859
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1405
;1405:	DynamicMenu_AddItem("Модель...", IGS_MODEL, 0, IG_Setup_Event);
ADDRGP4 $860
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1406
;1406:	DynamicMenu_AddItem("Управление...", IGS_CONTROLS, 0, IG_Setup_Event);
ADDRGP4 $861
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1407
;1407:	DynamicMenu_AddItem("Параметры...", IGS_OPTIONS, 0, IG_Setup_Event);
ADDRGP4 $862
ARGP4
CNSTI4 3
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1408
;1408:	DynamicMenu_AddItem("Графика...", IGS_GRAPHICS, 0, IG_Setup_Event);
ADDRGP4 $863
ARGP4
CNSTI4 4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1409
;1409:	DynamicMenu_AddItem("Экран...", IGS_DISPLAY, 0, IG_Setup_Event);
ADDRGP4 $864
ARGP4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1410
;1410:	DynamicMenu_AddItem("Звук...", IGS_SOUND, 0, IG_Setup_Event);
ADDRGP4 $865
ARGP4
CNSTI4 6
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1411
;1411:	DynamicMenu_AddItem("Сеть...", IGS_NETWORK, 0, IG_Setup_Event);
ADDRGP4 $866
ARGP4
CNSTI4 7
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1412
;1412:	DynamicMenu_AddItem("Расширеные...", IGS_ADVANCED, 0, IG_Setup_Event);
ADDRGP4 $867
ARGP4
CNSTI4 8
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Setup_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1413
;1413:	}
LABELV $856
line 1415
;1414:
;1415:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1416
;1416:}
LABELV $843
endproc IG_Setup_SubMenu 0 16
proc IG_Actions_SubMenu 0 16
line 1424
;1417:
;1418:/*
;1419:=================
;1420:IG_Actions_SubMenu
;1421:=================
;1422:*/
;1423:static void IG_Actions_SubMenu( void )
;1424:{
line 1425
;1425:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1427
;1426:
;1427:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $869
line 1428
;1428:	DynamicMenu_AddItem("Demo record", IGS_RECORD, 0, IG_Actions_Event);
ADDRGP4 $872
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Actions_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1429
;1429:	DynamicMenu_AddItem("Stop record", IGS_STOPRECORD, 0, IG_Actions_Event);
ADDRGP4 $873
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Actions_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1430
;1430:	DynamicMenu_AddItem("I am stuck", IGS_KILL, 0, IG_Actions_Event);
ADDRGP4 $874
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Actions_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1431
;1431:	}
LABELV $869
line 1432
;1432:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $875
line 1433
;1433:	DynamicMenu_AddItem("Начать запись", IGS_RECORD, 0, IG_Actions_Event);
ADDRGP4 $878
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Actions_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1434
;1434:	DynamicMenu_AddItem("Остановка записи", IGS_STOPRECORD, 0, IG_Actions_Event);
ADDRGP4 $879
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Actions_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1435
;1435:	DynamicMenu_AddItem("Я застрял", IGS_KILL, 0, IG_Actions_Event);
ADDRGP4 $880
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Actions_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1436
;1436:	}
LABELV $875
line 1438
;1437:
;1438:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1439
;1439:}
LABELV $868
endproc IG_Actions_SubMenu 0 16
proc IG_Save_SubMenu 0 16
line 1447
;1440:
;1441:/*
;1442:=================
;1443:IG_Save_SubMenu
;1444:=================
;1445:*/
;1446:static void IG_Save_SubMenu( void )
;1447:{
line 1448
;1448:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1450
;1449:
;1450:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $882
line 1451
;1451:	DynamicMenu_AddItem("Save: Slot 1", IGS_SAVE1, 0, IG_Save_Event);
ADDRGP4 $885
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1452
;1452:	DynamicMenu_AddItem("Save: Slot 2", IGS_SAVE2, 0, IG_Save_Event);
ADDRGP4 $886
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1453
;1453:	DynamicMenu_AddItem("Save: Slot 3", IGS_SAVE3, 0, IG_Save_Event);
ADDRGP4 $887
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1454
;1454:	DynamicMenu_AddItem("Save: Slot 4", IGS_SAVE4, 0, IG_Save_Event);
ADDRGP4 $888
ARGP4
CNSTI4 3
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1455
;1455:	DynamicMenu_AddItem("Save: Slot 5", IGS_SAVE5, 0, IG_Save_Event);
ADDRGP4 $889
ARGP4
CNSTI4 4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1456
;1456:	DynamicMenu_AddItem("Save: Slot 6", IGS_SAVE6, 0, IG_Save_Event);
ADDRGP4 $890
ARGP4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1457
;1457:	DynamicMenu_AddItem("Save: Slot 7", IGS_SAVE7, 0, IG_Save_Event);
ADDRGP4 $891
ARGP4
CNSTI4 6
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1458
;1458:	DynamicMenu_AddItem("Save: Slot 8", IGS_SAVE8, 0, IG_Save_Event);
ADDRGP4 $892
ARGP4
CNSTI4 7
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1459
;1459:	}
LABELV $882
line 1460
;1460:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $893
line 1461
;1461:	DynamicMenu_AddItem("Сохранить: Слот 1", IGS_SAVE1, 0, IG_Save_Event);
ADDRGP4 $896
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1462
;1462:	DynamicMenu_AddItem("Сохранить: Слот 2", IGS_SAVE2, 0, IG_Save_Event);
ADDRGP4 $897
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1463
;1463:	DynamicMenu_AddItem("Сохранить: Слот 3", IGS_SAVE3, 0, IG_Save_Event);
ADDRGP4 $898
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1464
;1464:	DynamicMenu_AddItem("Сохранить: Слот 4", IGS_SAVE4, 0, IG_Save_Event);
ADDRGP4 $899
ARGP4
CNSTI4 3
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1465
;1465:	DynamicMenu_AddItem("Сохранить: Слот 5", IGS_SAVE5, 0, IG_Save_Event);
ADDRGP4 $900
ARGP4
CNSTI4 4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1466
;1466:	DynamicMenu_AddItem("Сохранить: Слот 6", IGS_SAVE6, 0, IG_Save_Event);
ADDRGP4 $901
ARGP4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1467
;1467:	DynamicMenu_AddItem("Сохранить: Слот 7", IGS_SAVE7, 0, IG_Save_Event);
ADDRGP4 $902
ARGP4
CNSTI4 6
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1468
;1468:	DynamicMenu_AddItem("Сохранить: Слот 8", IGS_SAVE8, 0, IG_Save_Event);
ADDRGP4 $903
ARGP4
CNSTI4 7
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Save_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1469
;1469:	}
LABELV $893
line 1471
;1470:
;1471:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1472
;1472:}
LABELV $881
endproc IG_Save_SubMenu 0 16
proc IG_AddBot_SubMenu 0 16
line 1482
;1473:
;1474:
;1475:
;1476:/*
;1477:=================
;1478:IG_AddBot_SubMenu
;1479:=================
;1480:*/
;1481:static void IG_AddBot_SubMenu( void )
;1482:{
line 1483
;1483:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1485
;1484:
;1485:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $905
line 1486
;1486:	DynamicMenu_AddItem("Add bot...", ID_ADDBOTS, 0, IG_UseOldInGame_Event);
ADDRGP4 $908
ARGP4
CNSTI4 11
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1487
;1487:	DynamicMenu_AddItem("Remove bot...", ID_REMOVEBOTS, 0, IG_UseOldInGame_Event);
ADDRGP4 $909
ARGP4
CNSTI4 12
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1488
;1488:	}
LABELV $905
line 1489
;1489:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $910
line 1490
;1490:	DynamicMenu_AddItem("Добавить бота...", ID_ADDBOTS, 0, IG_UseOldInGame_Event);
ADDRGP4 $913
ARGP4
CNSTI4 11
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1491
;1491:	DynamicMenu_AddItem("Удалить бота...", ID_REMOVEBOTS, 0, IG_UseOldInGame_Event);
ADDRGP4 $914
ARGP4
CNSTI4 12
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1492
;1492:	}
LABELV $910
line 1494
;1493:
;1494:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1495
;1495:}
LABELV $904
endproc IG_AddBot_SubMenu 0 16
proc IG_Exit_SubMenu 0 16
line 1507
;1496:
;1497:
;1498:
;1499:
;1500:
;1501:/*
;1502:=================
;1503:IG_Exit_SubMenu
;1504:=================
;1505:*/
;1506:static void IG_Exit_SubMenu( void )
;1507:{
line 1508
;1508:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1510
;1509:
;1510:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $916
line 1511
;1511:	DynamicMenu_AddItem("Quit...", ID_QUIT, 0, IG_UseOldInGame_Event);
ADDRGP4 $919
ARGP4
CNSTI4 17
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1512
;1512:	DynamicMenu_AddItem("Main Menu", ID_LEAVEARENA, 0, IG_UseOldInGame_Event);
ADDRGP4 $920
ARGP4
CNSTI4 15
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1513
;1513:	}
LABELV $916
line 1515
;1514:
;1515:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $921
line 1516
;1516:	DynamicMenu_AddItem("Выход...", ID_QUIT, 0, IG_UseOldInGame_Event);
ADDRGP4 $924
ARGP4
CNSTI4 17
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1517
;1517:	DynamicMenu_AddItem("Главное Меню", ID_LEAVEARENA, 0, IG_UseOldInGame_Event);
ADDRGP4 $925
ARGP4
CNSTI4 15
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_UseOldInGame_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1518
;1518:	}
LABELV $921
line 1520
;1519:
;1520:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1521
;1521:}
LABELV $915
endproc IG_Exit_SubMenu 0 16
proc IG_Start_SubMenu 24 20
line 1532
;1522:
;1523:
;1524:
;1525:
;1526:/*
;1527:=================
;1528:IG_Start_SubMenu
;1529:=================
;1530:*/
;1531:static void IG_Start_SubMenu( void )
;1532:{
line 1536
;1533:	int depth;
;1534:	int gametype;
;1535:
;1536:	gametype = DynamicMenu_ServerGametype();
ADDRLP4 8
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1538
;1537:
;1538:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1539
;1539:	depth = DynamicMenu_Depth();
ADDRLP4 12
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 1541
;1540:
;1541:	if (gametype < GT_TEAM || gametype == GT_LMS) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $929
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $927
LABELV $929
line 1542
;1542:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $930
line 1543
;1543:		DynamicMenu_AddIconItem("Join Game", DM_START_GAME, "menu/medals/medal_gauntlet", 0, IG_Start_Event);
ADDRGP4 $933
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 $934
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 1544
;1544:		}
LABELV $930
line 1545
;1545:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $928
line 1546
;1546:		DynamicMenu_AddIconItem("Присоединиться к Игре", DM_START_GAME, "menu/medals/medal_gauntlet", 0, IG_Start_Event);
ADDRGP4 $938
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 $934
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 1547
;1547:		}
line 1548
;1548:	}
ADDRGP4 $928
JUMPV
LABELV $927
line 1549
;1549:	else {
line 1550
;1550:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $939
line 1551
;1551:		DynamicMenu_AddIconItem("Auto Join", DM_START_AUTO, "menu/medals/medal_capture", 0, IG_Start_Event);
ADDRGP4 $942
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $943
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 1552
;1552:		DynamicMenu_AddIconItem("Join Red", DM_START_RED, "uie_icons/iconf_red", 0, IG_Start_Event);
ADDRGP4 $944
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $945
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 1553
;1553:		DynamicMenu_AddIconItem("Join Blue", DM_START_BLUE, "uie_icons/iconf_blu", 0, IG_Start_Event);
ADDRGP4 $946
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 $947
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 1554
;1554:		}
LABELV $939
line 1555
;1555:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $948
line 1556
;1556:		DynamicMenu_AddIconItem("Авто Присоединение", DM_START_AUTO, "menu/medals/medal_capture", 0, IG_Start_Event);
ADDRGP4 $951
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $943
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 1557
;1557:		DynamicMenu_AddIconItem("Красная команда", DM_START_RED, "uie_icons/iconf_red", 0, IG_Start_Event);
ADDRGP4 $952
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $945
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 1558
;1558:		DynamicMenu_AddIconItem("Синяя команда", DM_START_BLUE, "uie_icons/iconf_blu", 0, IG_Start_Event);
ADDRGP4 $953
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 $947
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 1559
;1559:		}
LABELV $948
line 1560
;1560:	}
LABELV $928
line 1562
;1561:
;1562:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $954
line 1563
;1563:	DynamicMenu_AddItem("Spectate", DM_START_SPECTATOR, 0, IG_Start_Event);
ADDRGP4 $957
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1564
;1564:	DynamicMenu_AddItem("Follow #1", DM_START_FOLLOW1, 0, IG_Start_Event);
ADDRGP4 $958
ARGP4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1565
;1565:	DynamicMenu_AddItem("Follow #2", DM_START_FOLLOW2, 0, IG_Start_Event);
ADDRGP4 $959
ARGP4
CNSTI4 6
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1566
;1566:	}
LABELV $954
line 1567
;1567:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $960
line 1568
;1568:	DynamicMenu_AddItem("Наблюдать", DM_START_SPECTATOR, 0, IG_Start_Event);
ADDRGP4 $963
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1569
;1569:	DynamicMenu_AddItem("Следить #1", DM_START_FOLLOW1, 0, IG_Start_Event);
ADDRGP4 $964
ARGP4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1570
;1570:	DynamicMenu_AddItem("Следить #2", DM_START_FOLLOW2, 0, IG_Start_Event);
ADDRGP4 $965
ARGP4
CNSTI4 6
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Start_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1571
;1571:	}
LABELV $960
line 1573
;1572:
;1573:	if (UI_CurrentPlayerTeam() == TEAM_SPECTATOR) {
ADDRLP4 20
ADDRGP4 UI_CurrentPlayerTeam
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 3
NEI4 $966
line 1574
;1574:		DynamicMenu_SetFlags(depth, DM_START_SPECTATOR, QMF_GRAYED);
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 8192
ARGI4
ADDRGP4 DynamicMenu_SetFlags
CALLV
pop
line 1575
;1575:	}
LABELV $966
line 1577
;1576:
;1577:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1578
;1578:}
LABELV $926
endproc IG_Start_SubMenu 24 20
proc IG_Close_Event 0 0
line 1589
;1579:
;1580:
;1581:
;1582:
;1583:/*
;1584:=================
;1585:IG_Close_Event
;1586:=================
;1587:*/
;1588:static void IG_Close_Event( int index )
;1589:{
line 1590
;1590:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 1591
;1591:}
LABELV $968
endproc IG_Close_Event 0 0
proc InGameDynamic_InitPrimaryMenu 1076 16
line 1601
;1592:
;1593:
;1594:
;1595:/*
;1596:=================
;1597:InGameDynamic_InitPrimaryMenu
;1598:=================
;1599:*/
;1600:static void InGameDynamic_InitPrimaryMenu( void )
;1601:{
line 1609
;1602:	int depth;
;1603:	int gametype;
;1604:	int team;
;1605:	qboolean localserver;
;1606:	qboolean voting;
;1607:	char buf[MAX_INFO_STRING];
;1608:
;1609:	team = UI_CurrentPlayerTeam();
ADDRLP4 1044
ADDRGP4 UI_CurrentPlayerTeam
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1044
INDIRI4
ASGNI4
line 1610
;1610:	gametype = DynamicMenu_ServerGametype();
ADDRLP4 1048
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1048
INDIRI4
ASGNI4
line 1612
;1611:
;1612:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 1614
;1613:
;1614:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $970
line 1615
;1615:	DynamicMenu_AddItem("Close!", IGM_CLOSE, 0, IG_Close_Event);
ADDRGP4 $973
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1616
;1616:	if(!ui_singlemode.integer){
ADDRGP4 ui_singlemode+12
INDIRI4
CNSTI4 0
NEI4 $974
line 1617
;1617:	DynamicMenu_AddItem("Actions", IGM_ACTIONS, IG_Actions_SubMenu, 0);
ADDRGP4 $977
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 IG_Actions_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1618
;1618:	}
LABELV $974
line 1619
;1619:	if(ui_singlemode.integer){
ADDRGP4 ui_singlemode+12
INDIRI4
CNSTI4 0
EQI4 $978
line 1620
;1620:	DynamicMenu_AddItem("Save", IGM_SAVE, IG_Save_SubMenu, 0);	
ADDRGP4 $981
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 IG_Save_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1621
;1621:	}
LABELV $978
line 1622
;1622:	DynamicMenu_AddItem("Start", IGM_START, IG_Start_SubMenu, 0);
ADDRGP4 $982
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 IG_Start_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1623
;1623:	DynamicMenu_AddItem("Bots", IGM_BOTS, IG_AddBot_SubMenu, 0);
ADDRGP4 $983
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 IG_AddBot_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1624
;1624:	DynamicMenu_AddItem("Team Orders...", IGM_TEAMORDERS, 0, IG_TeamOrders_Event);
ADDRGP4 $984
ARGP4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TeamOrders_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1625
;1625:	DynamicMenu_AddItem("Setup", IGM_SETUP, IG_Setup_SubMenu, 0);
ADDRGP4 $985
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 IG_Setup_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1626
;1626:	DynamicMenu_AddItem("Map", IGM_MAP, IG_Map_SubMenu, 0);
ADDRGP4 $986
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 IG_Map_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1627
;1627:	DynamicMenu_AddItem("Vote", IGM_VOTE, IG_Vote_SubMenu, 0);
ADDRGP4 $987
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 IG_Vote_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1628
;1628:	DynamicMenu_AddItem("Call Vote", IGM_CALLVOTE, IG_CallVote_SubMenu, 0);
ADDRGP4 $988
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 IG_CallVote_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1629
;1629:	DynamicMenu_AddItem("Exit!", IGM_EXIT, IG_Exit_SubMenu, 0);
ADDRGP4 $989
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 IG_Exit_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1630
;1630:	}
LABELV $970
line 1631
;1631:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $990
line 1632
;1632:	DynamicMenu_AddItem("Закрыть!", IGM_CLOSE, 0, IG_Close_Event);
ADDRGP4 $993
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1633
;1633:	if(!ui_singlemode.integer){
ADDRGP4 ui_singlemode+12
INDIRI4
CNSTI4 0
NEI4 $994
line 1634
;1634:	DynamicMenu_AddItem("Действия", IGM_ACTIONS, IG_Actions_SubMenu, 0);
ADDRGP4 $997
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 IG_Actions_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1635
;1635:	}
LABELV $994
line 1636
;1636:	if(ui_singlemode.integer){
ADDRGP4 ui_singlemode+12
INDIRI4
CNSTI4 0
EQI4 $998
line 1637
;1637:	DynamicMenu_AddItem("Сохранить", IGM_SAVE, IG_Save_SubMenu, 0);
ADDRGP4 $1001
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 IG_Save_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1638
;1638:	}
LABELV $998
line 1639
;1639:	DynamicMenu_AddItem("Старт", IGM_START, IG_Start_SubMenu, 0);
ADDRGP4 $1002
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 IG_Start_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1640
;1640:	DynamicMenu_AddItem("Боты", IGM_BOTS, IG_AddBot_SubMenu, 0);
ADDRGP4 $1003
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 IG_AddBot_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1641
;1641:	DynamicMenu_AddItem("Командные Приказы...", IGM_TEAMORDERS, 0, IG_TeamOrders_Event);
ADDRGP4 $1004
ARGP4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 IG_TeamOrders_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1642
;1642:	DynamicMenu_AddItem("Настройки", IGM_SETUP, IG_Setup_SubMenu, 0);
ADDRGP4 $1005
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 IG_Setup_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1643
;1643:	DynamicMenu_AddItem("Карта", IGM_MAP, IG_Map_SubMenu, 0);
ADDRGP4 $1006
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 IG_Map_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1644
;1644:	DynamicMenu_AddItem("Голосование", IGM_VOTE, IG_Vote_SubMenu, 0);
ADDRGP4 $1007
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 IG_Vote_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1645
;1645:	DynamicMenu_AddItem("Создать Голосование", IGM_CALLVOTE, IG_CallVote_SubMenu, 0);
ADDRGP4 $1008
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 IG_CallVote_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1646
;1646:	DynamicMenu_AddItem("Выйти!", IGM_EXIT, IG_Exit_SubMenu, 0);
ADDRGP4 $1009
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 IG_Exit_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 1647
;1647:	}
LABELV $990
line 1649
;1648:
;1649:	depth = DynamicMenu_Depth();
ADDRLP4 1052
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1052
INDIRI4
ASGNI4
line 1650
;1650:	gametype = trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $1010
ARGP4
ADDRLP4 1056
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1056
INDIRF4
CVFI4 4
ASGNI4
line 1656
;1651:	//if (gametype < GT_TEAM || team == TEAM_SPECTATOR || gametype == GT_LMS) {
;1652:	//	DynamicMenu_SetFlags(depth, IGM_TEAMORDERS, QMF_GRAYED);
;1653:	//}
;1654:
;1655:	// disable map commands if non-local server
;1656:	localserver = trap_Cvar_VariableValue( "sv_running" );
ADDRGP4 $238
ARGP4
ADDRLP4 1060
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1028
ADDRLP4 1060
INDIRF4
CVFI4 4
ASGNI4
line 1657
;1657:	if( !localserver) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $1011
line 1658
;1658:		DynamicMenu_SetFlags(depth, IGM_MAP, QMF_GRAYED);
ADDRLP4 1024
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTI4 8192
ARGI4
ADDRGP4 DynamicMenu_SetFlags
CALLV
pop
line 1659
;1659:	}
LABELV $1011
line 1662
;1660:
;1661:	// singleplayer/spec protects voting menu (otherwise it could be used to cheat)
;1662:	if (team == TEAM_SPECTATOR) {
ADDRLP4 1040
INDIRI4
CNSTI4 3
NEI4 $1013
line 1663
;1663:		DynamicMenu_SetFlags(depth, IGM_CALLVOTE, QMF_GRAYED);
ADDRLP4 1024
INDIRI4
ARGI4
CNSTI4 9
ARGI4
CNSTI4 8192
ARGI4
ADDRGP4 DynamicMenu_SetFlags
CALLV
pop
line 1664
;1664:		DynamicMenu_SetFlags(depth, IGM_VOTE, QMF_GRAYED);
ADDRLP4 1024
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 8192
ARGI4
ADDRGP4 DynamicMenu_SetFlags
CALLV
pop
line 1665
;1665:	}
LABELV $1013
line 1668
;1666:
;1667:	// bot manipulation
;1668:	if (!localserver || !trap_Cvar_VariableValue( "bot_enable" )) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $1017
ADDRGP4 $239
ARGP4
ADDRLP4 1064
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1064
INDIRF4
CNSTF4 0
NEF4 $1015
LABELV $1017
line 1669
;1669:		DynamicMenu_SetFlags(depth, IGM_BOTS, QMF_GRAYED);
ADDRLP4 1024
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 8192
ARGI4
ADDRGP4 DynamicMenu_SetFlags
CALLV
pop
line 1670
;1670:	}
LABELV $1015
line 1673
;1671:
;1672:	// disable vote menu if no voting
;1673:	voting = qfalse;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 1674
;1674:	trap_GetConfigString(CS_VOTE_TIME, buf, MAX_INFO_STRING);
CNSTI4 8
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1675
;1675:	if (atoi(buf) != 0) {
ADDRLP4 0
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $1018
line 1676
;1676:		voting = qtrue;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1677
;1677:	}
LABELV $1018
line 1678
;1678:	trap_GetConfigString(CS_TEAMVOTE_TIME, buf, MAX_INFO_STRING);
CNSTI4 12
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1679
;1679:	if (atoi(buf) != 0) {
ADDRLP4 0
ARGP4
ADDRLP4 1072
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $1020
line 1680
;1680:		voting = qtrue;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1681
;1681:	}
LABELV $1020
line 1683
;1682:
;1683:	if (!voting) {
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1022
line 1684
;1684:		DynamicMenu_SetFlags(depth, IGM_VOTE, QMF_GRAYED);
ADDRLP4 1024
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 8192
ARGI4
ADDRGP4 DynamicMenu_SetFlags
CALLV
pop
line 1685
;1685:	}
LABELV $1022
line 1689
;1686:
;1687:	//DynamicMenu_AddBackground(INGAME_FRAME);
;1688:
;1689:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 1690
;1690:}
LABELV $969
endproc InGameDynamic_InitPrimaryMenu 1076 16
export UI_InGameDynamic
proc UI_InGameDynamic 0 8
line 1701
;1691:
;1692:
;1693:
;1694:
;1695:/*
;1696:=================
;1697:UI_InGameDynamic
;1698:=================
;1699:*/
;1700:void UI_InGameDynamic( void )
;1701:{
line 1702
;1702:	DynamicMenu_MenuInit(qfalse, qtrue);
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 DynamicMenu_MenuInit
CALLV
pop
line 1703
;1703:	InGameDynamic_InitPrimaryMenu();
ADDRGP4 InGameDynamic_InitPrimaryMenu
CALLV
pop
line 1704
;1704:}
LABELV $1024
endproc UI_InGameDynamic 0 8
export UI_InGameMenu
proc UI_InGameMenu 0 4
line 1715
;1705:
;1706:
;1707:
;1708:
;1709:/*
;1710:=================
;1711:UI_InGameMenu
;1712:=================
;1713:*/
;1714:void UI_InGameMenu( void )
;1715:{
line 1716
;1716:	if (uie_ingame_dynamicmenu.integer) {
ADDRGP4 uie_ingame_dynamicmenu+12
INDIRI4
CNSTI4 0
EQI4 $1026
line 1717
;1717:		UI_InGameDynamic();
ADDRGP4 UI_InGameDynamic
CALLV
pop
line 1718
;1718:	}
ADDRGP4 $1027
JUMPV
LABELV $1026
line 1719
;1719:	else {
line 1721
;1720:		// force as top level menu
;1721:		uis.menusp = 0;
ADDRGP4 uis+20
CNSTI4 0
ASGNI4
line 1724
;1722:
;1723:		// set menu cursor to a nice location
;1724:		uis.cursorx = 319;
ADDRGP4 uis+8
CNSTI4 319
ASGNI4
line 1725
;1725:		uis.cursory = 80;
ADDRGP4 uis+12
CNSTI4 80
ASGNI4
line 1727
;1726:
;1727:		InGame_MenuInit();
ADDRGP4 InGame_MenuInit
CALLV
pop
line 1728
;1728:		UI_PushMenu( &s_ingame.menu );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1729
;1729:	}
LABELV $1027
line 1730
;1730:}
LABELV $1025
endproc UI_InGameMenu 0 4
data
align 4
LABELV botcommandmenu_gametype
byte 4 0
align 4
LABELV commandString
address $1033
address $1034
address $1035
address $1036
byte 4 0
align 4
LABELV botCommandStrings
address $1038
address $1039
address $1040
address $1041
address $1042
address $1043
address $1044
address $1045
address $1046
address $1047
address $1048
address $1049
address $1050
address $1051
address $1052
address $1053
byte 4 0
export BotCommand_MenuClose
code
proc BotCommand_MenuClose 0 0
line 1820
;1731:
;1732:
;1733:
;1734:
;1735:
;1736:
;1737:/*
;1738:=======================================================================
;1739:
;1740:INGAME DYNAMIC BOT COMMAND MENU
;1741:
;1742:=======================================================================
;1743:*/
;1744:
;1745:
;1746:// stores current gametype for fast access by menus
;1747:static int botcommandmenu_gametype = 0;
;1748:
;1749:
;1750:
;1751:enum {
;1752:	COM_WHOLEADER,
;1753:	COM_IAMLEADER,
;1754:	COM_QUITLEADER,
;1755:	COM_MYTASK
;1756:} commandId;
;1757:
;1758:
;1759:static char* commandString[] = {
;1760:	"Who is the leader", // COM_WHOLEADER
;1761:	"I am the leader",	// COM_IAMLEADER
;1762:	"I quit being the leader",	// COM_QUITLEADER
;1763:	"What is my job",	// COM_MYTASK
;1764:	0
;1765:};
;1766:
;1767:
;1768:enum {
;1769:	BC_NULL,
;1770:	BC_FOLLOW,
;1771:	BC_HELP,
;1772:	BC_GET,
;1773:	BC_PATROL,
;1774:	BC_CAMP,
;1775:	BC_HUNT,
;1776:	BC_DISMISS,
;1777:	BC_REPORT,
;1778:	BC_POINT,
;1779:	BC_GETFLAG,
;1780:	BC_DEFENDBASE,
;1781:	BC_ATTACKBASE,
;1782:	BC_COLLECTSKULLS,
;1783:	BC_DOMINATEA,
;1784:	BC_DOMINATEB
;1785:} botCommandId;
;1786:
;1787:
;1788:static char* botCommandStrings[] = {
;1789:	"", // BC_NULL
;1790:	"%s follow %s", // BC_FOLLOW
;1791:	"%s help %s", // BC_HELP
;1792:	"%s grab the %s", // BC_GET
;1793:	"%s patrol from %s to %s", // BC_PATROL
;1794:	"%s camp %s", // BC_CAMP
;1795:	"%s kill %s", // BC_HUNT
;1796:	"%s dismissed", // BC_DISMISS
;1797:	"%s report", // BC_REPORT
;1798:	"%s lead the way", // BC_POINT
;1799:	"%s capture flag",	// BC_GETFLAG
;1800:	"%s defend the base",	// BC_DEFENDBASE
;1801:	"%s attack the enemy",	// BC_ATTACKBASE
;1802:	"%s collect skulls",	// BC_COLLECTSKULLS
;1803:	"%s dominate point A",	// BC_DOMINATEA
;1804:	"%s dominate point B",	// BC_DOMINATEB
;1805:	0
;1806:};
;1807:
;1808:
;1809:
;1810:
;1811:
;1812:
;1813:
;1814:/*
;1815:=================
;1816:BotCommand_MenuClose
;1817:=================
;1818:*/
;1819:void BotCommand_MenuClose( void )
;1820:{
line 1821
;1821:	if (uie_autoclosebotmenu.integer)
ADDRGP4 uie_autoclosebotmenu+12
INDIRI4
CNSTI4 0
EQI4 $1055
line 1822
;1822:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
LABELV $1055
line 1823
;1823:}
LABELV $1054
endproc BotCommand_MenuClose 0 0
proc DM_BotPlayerTarget_Event 52 12
line 1839
;1824:
;1825:
;1826:
;1827:
;1828:
;1829:/*
;1830:=================
;1831:DM_BotPlayerTarget_Event
;1832:
;1833:Issues a command to a bot that needs a target
;1834:Assumes index is the object, parent is the command,
;1835:and parent of parent is the bot
;1836:=================
;1837:*/
;1838:static void DM_BotPlayerTarget_Event( int index)
;1839:{
line 1844
;1840:	int depth;
;1841:	int bot, cmd;
;1842:	const char* s;
;1843:
;1844:	depth = DynamicMenu_DepthOfIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 DynamicMenu_DepthOfIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 1846
;1845:
;1846:	if (depth != DynamicMenu_Depth() || depth < 3)
ADDRLP4 20
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $1061
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $1059
LABELV $1061
line 1847
;1847:	{
line 1848
;1848:		Com_Printf("BotPlayerTarget_Event: index %i at wrong depth (%i)\n", index, depth);
ADDRGP4 $1062
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1849
;1849:		BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 1850
;1850:		return;
ADDRGP4 $1058
JUMPV
LABELV $1059
line 1854
;1851:	}
;1852:
;1853:	// validate command
;1854:	cmd = DynamicMenu_ActiveIdAtDepth(depth - 1);
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 24
ADDRGP4 DynamicMenu_ActiveIdAtDepth
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 1855
;1855:	switch (cmd) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $1064
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $1064
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $1064
ADDRGP4 $1063
JUMPV
line 1859
;1856:	case BC_FOLLOW:
;1857:	case BC_HELP:
;1858:	case BC_HUNT:
;1859:		break;
LABELV $1063
line 1861
;1860:	default:
;1861:		Com_Printf("BotPlayerTarget_Event: unknown command id %i\n", cmd);
ADDRGP4 $1066
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1862
;1862:		BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 1863
;1863:		return;
ADDRGP4 $1058
JUMPV
LABELV $1064
line 1864
;1864:	};
line 1867
;1865:
;1866:	// get the parent bot, insert it and item into command string
;1867:	bot = DynamicMenu_ActiveIndexAtDepth(depth - 2);
ADDRLP4 0
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 32
ADDRGP4 DynamicMenu_ActiveIndexAtDepth
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 1868
;1868:	s = va(botCommandStrings[cmd], DynamicMenu_StringAtIndex(bot),
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 DynamicMenu_StringAtIndex
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 DynamicMenu_StringAtIndex
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botCommandStrings
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 44
INDIRP4
ASGNP4
line 1872
;1869:		DynamicMenu_StringAtIndex(index));
;1870:
;1871:	// issue the command
;1872:	BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 1873
;1873:	trap_Cmd_ExecuteText( EXEC_APPEND, va("say_team \"%s\"\n", s));
ADDRGP4 $1067
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1874
;1874:}
LABELV $1058
endproc DM_BotPlayerTarget_Event 52 12
proc DM_BotItemItemTarget_Event 68 16
line 1890
;1875:
;1876:
;1877:
;1878:
;1879:
;1880:/*
;1881:=================
;1882:DM_BotItemItemTarget_Event
;1883:
;1884:Issues a command to a bot that needs two targets
;1885:Assumes index and parent are the objects, grandparent
;1886:is the command, and great-grandparent is the bot
;1887:=================
;1888:*/
;1889:static void DM_BotItemItemTarget_Event( int index)
;1890:{
line 1895
;1891:	int depth;
;1892:	int bot, cmd, item, item2;
;1893:	const char* s;
;1894:
;1895:	depth = DynamicMenu_DepthOfIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 DynamicMenu_DepthOfIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 1897
;1896:
;1897:	if (depth != DynamicMenu_Depth() || depth < 4)
ADDRLP4 28
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1071
ADDRLP4 0
INDIRI4
CNSTI4 4
GEI4 $1069
LABELV $1071
line 1898
;1898:	{
line 1899
;1899:		Com_Printf("BotItemItemTarget_Event: index %i at wrong depth (%i)\n", index, depth);
ADDRGP4 $1072
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1900
;1900:		BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 1901
;1901:		return;
ADDRGP4 $1068
JUMPV
LABELV $1069
line 1905
;1902:	}
;1903:
;1904:	// validate command
;1905:	cmd = DynamicMenu_ActiveIdAtDepth(depth - 2);
ADDRLP4 0
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 32
ADDRGP4 DynamicMenu_ActiveIdAtDepth
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 1906
;1906:	switch (cmd) {
ADDRLP4 4
INDIRI4
CNSTI4 4
EQI4 $1074
ADDRGP4 $1073
JUMPV
line 1908
;1907:	case BC_PATROL:
;1908:		break;
LABELV $1073
line 1910
;1909:	default:
;1910:		Com_Printf("BotItemItemTarget_Event: unknown command id %i\n", cmd);
ADDRGP4 $1076
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1911
;1911:		BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 1912
;1912:		return;
ADDRGP4 $1068
JUMPV
LABELV $1074
line 1913
;1913:	};
line 1916
;1914:
;1915:	// get the parent bot, insert it and item into command string
;1916:	bot = DynamicMenu_ActiveIndexAtDepth( depth - 3 );
ADDRLP4 0
INDIRI4
CNSTI4 3
SUBI4
ARGI4
ADDRLP4 36
ADDRGP4 DynamicMenu_ActiveIndexAtDepth
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 36
INDIRI4
ASGNI4
line 1917
;1917:	item = DynamicMenu_ActiveIdAtDepth(depth - 1);
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 40
ADDRGP4 DynamicMenu_ActiveIdAtDepth
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 1918
;1918:	item2 = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 44
INDIRI4
ASGNI4
line 1920
;1919:
;1920:	s = va(botCommandStrings[cmd], DynamicMenu_StringAtIndex(bot),
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 DynamicMenu_StringAtIndex
CALLP4
ASGNP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 DynamicMenu_ItemShortname
CALLP4
ASGNP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 DynamicMenu_ItemShortname
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botCommandStrings
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 60
INDIRP4
ASGNP4
line 1924
;1921:		DynamicMenu_ItemShortname(item), DynamicMenu_ItemShortname(item2));
;1922:
;1923:	// issue the command
;1924:	BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 1925
;1925:	trap_Cmd_ExecuteText( EXEC_APPEND, va("say_team \"%s\"\n", s));
ADDRGP4 $1067
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1926
;1926:}
LABELV $1068
endproc DM_BotItemItemTarget_Event 68 16
proc DM_BotItemTarget_Event 68 12
line 1941
;1927:
;1928:
;1929:
;1930:
;1931:/*
;1932:=================
;1933:DM_BotItemTarget_Event
;1934:
;1935:Issues a command to a bot that needs a target
;1936:Assumes index is the object, parent is the command,
;1937:and parent of parent is the bot
;1938:=================
;1939:*/
;1940:static void DM_BotItemTarget_Event( int index)
;1941:{
line 1947
;1942:	int depth;
;1943:	int bot, cmd, item;
;1944:	const char* s;
;1945:	const char* item_str;
;1946:
;1947:	depth = DynamicMenu_DepthOfIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 DynamicMenu_DepthOfIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 1949
;1948:
;1949:	if (depth != DynamicMenu_Depth() || depth < 3)
ADDRLP4 28
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1080
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $1078
LABELV $1080
line 1950
;1950:	{
line 1951
;1951:		Com_Printf("BotItemTarget_Event: index %i at wrong depth (%i)\n", index, depth);
ADDRGP4 $1081
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1952
;1952:		BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 1953
;1953:		return;
ADDRGP4 $1077
JUMPV
LABELV $1078
line 1957
;1954:	}
;1955:
;1956:	// validate command
;1957:	cmd = DynamicMenu_ActiveIdAtDepth(depth - 1);
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 32
ADDRGP4 DynamicMenu_ActiveIdAtDepth
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 1958
;1958:	switch (cmd) {
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $1083
ADDRLP4 4
INDIRI4
CNSTI4 5
EQI4 $1083
ADDRGP4 $1082
JUMPV
line 1961
;1959:	case BC_GET:
;1960:	case BC_CAMP:
;1961:		break;
LABELV $1082
line 1963
;1962:	default:
;1963:		Com_Printf("BotItemTarget_Event: unknown command id %i\n", cmd);
ADDRGP4 $1085
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1964
;1964:		BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 1965
;1965:		return;
ADDRGP4 $1077
JUMPV
LABELV $1083
line 1966
;1966:	};
line 1969
;1967:
;1968:	// get the parent bot, insert it and item into command string
;1969:	bot = DynamicMenu_ActiveIndexAtDepth(depth - 2);
ADDRLP4 0
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 40
ADDRGP4 DynamicMenu_ActiveIndexAtDepth
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 1970
;1970:	item = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 44
INDIRI4
ASGNI4
line 1971
;1971:	if (item < 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $1086
line 1972
;1972:		item_str = DynamicMenu_StringAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 DynamicMenu_StringAtIndex
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 48
INDIRP4
ASGNP4
ADDRGP4 $1087
JUMPV
LABELV $1086
line 1974
;1973:	else
;1974:		item_str = DynamicMenu_ItemShortname(item);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 DynamicMenu_ItemShortname
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 52
INDIRP4
ASGNP4
LABELV $1087
line 1976
;1975:
;1976:	s = va(botCommandStrings[cmd], DynamicMenu_StringAtIndex(bot), item_str);
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 DynamicMenu_StringAtIndex
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botCommandStrings
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 60
INDIRP4
ASGNP4
line 1979
;1977:
;1978:	// issue the command
;1979:	BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 1980
;1980:	trap_Cmd_ExecuteText( EXEC_APPEND, va("say_team \"%s\"\n", s));
ADDRGP4 $1067
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1981
;1981:}
LABELV $1077
endproc DM_BotItemTarget_Event 68 12
proc DM_BotCommand_Event 48 12
line 1993
;1982:
;1983:
;1984:
;1985:/*
;1986:=================
;1987:DM_BotCommand_Event
;1988:
;1989:Issues a command to a bot
;1990:=================
;1991:*/
;1992:static void DM_BotCommand_Event( int index )
;1993:{
line 1998
;1994:	int depth;
;1995:	int bot, cmd;
;1996:	const char* s;
;1997:
;1998:	depth = DynamicMenu_DepthOfIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 DynamicMenu_DepthOfIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 2000
;1999:
;2000:	if (depth != DynamicMenu_Depth() || depth < 2)
ADDRLP4 20
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $1091
ADDRLP4 0
INDIRI4
CNSTI4 2
GEI4 $1089
LABELV $1091
line 2001
;2001:	{
line 2002
;2002:		Com_Printf("BotCommand_Event: index %i at wrong depth (%i)\n", index, depth);
ADDRGP4 $1092
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2003
;2003:		BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 2004
;2004:		return;
ADDRGP4 $1088
JUMPV
LABELV $1089
line 2008
;2005:	}
;2006:
;2007:	// validate command
;2008:	cmd = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 2009
;2009:	switch (cmd) {
ADDRLP4 4
INDIRI4
CNSTI4 7
LTI4 $1093
ADDRLP4 4
INDIRI4
CNSTI4 15
GTI4 $1093
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1097-28
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1097
address $1094
address $1094
address $1094
address $1094
address $1094
address $1094
address $1094
address $1094
address $1094
code
line 2019
;2010:	case BC_DISMISS:
;2011:	case BC_REPORT:
;2012:	case BC_POINT:
;2013:	case BC_GETFLAG:
;2014:	case BC_DEFENDBASE:
;2015:	case BC_ATTACKBASE:
;2016:	case BC_COLLECTSKULLS:
;2017:	case BC_DOMINATEA:
;2018:	case BC_DOMINATEB:
;2019:		break;
LABELV $1093
line 2021
;2020:	default:
;2021:		Com_Printf("BotCommand_Event: unknown command (%i)\n", cmd);
ADDRGP4 $1096
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2022
;2022:		BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 2023
;2023:		return;
ADDRGP4 $1088
JUMPV
LABELV $1094
line 2024
;2024:	};
line 2027
;2025:
;2026:	// get the parent bot name, insert into command string
;2027:	bot = DynamicMenu_ActiveIndexAtDepth(depth - 1);
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 32
ADDRGP4 DynamicMenu_ActiveIndexAtDepth
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 2028
;2028:	s = va(botCommandStrings[cmd], DynamicMenu_StringAtIndex(bot));
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 DynamicMenu_StringAtIndex
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botCommandStrings
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
ASGNP4
line 2031
;2029:
;2030:	// issue the command
;2031:	BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 2032
;2032:	trap_Cmd_ExecuteText( EXEC_APPEND, va("say_team \"%s\"\n", s));
ADDRGP4 $1067
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 2033
;2033:}
LABELV $1088
endproc DM_BotCommand_Event 48 12
proc DM_Command_Event 32 12
line 2047
;2034:
;2035:
;2036:
;2037:
;2038:
;2039:/*
;2040:=================
;2041:DM_Command_Event
;2042:
;2043:Issues a command without target
;2044:=================
;2045:*/
;2046:static void DM_Command_Event( int index )
;2047:{
line 2052
;2048:	int depth;
;2049:	int cmd;
;2050:	const char* s;
;2051:
;2052:	depth = DynamicMenu_DepthOfIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 DynamicMenu_DepthOfIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 2054
;2053:
;2054:	if (depth != DynamicMenu_Depth())
ADDRLP4 16
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1100
line 2055
;2055:	{
line 2056
;2056:		Com_Printf("Command_Event: index %i at wrong depth (%i)\n", index, depth);
ADDRGP4 $1102
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2057
;2057:		BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 2058
;2058:		return;
ADDRGP4 $1099
JUMPV
LABELV $1100
line 2062
;2059:	}
;2060:
;2061:	// validate command
;2062:	cmd = DynamicMenu_IdAtIndex(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 DynamicMenu_IdAtIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 2063
;2063:	switch (cmd) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1103
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $1103
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1107
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1107
address $1104
address $1104
address $1104
address $1104
code
line 2068
;2064:	case COM_WHOLEADER:
;2065:	case COM_IAMLEADER:
;2066:	case COM_QUITLEADER:
;2067:	case COM_MYTASK:
;2068:		break;
LABELV $1103
line 2070
;2069:	default:
;2070:		Com_Printf("Command_Event: unknown command (%i)\n", cmd);
ADDRGP4 $1106
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2071
;2071:		BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 2072
;2072:		return;
ADDRGP4 $1099
JUMPV
LABELV $1104
line 2073
;2073:	};
line 2076
;2074:
;2075:	// issue the command
;2076:	BotCommand_MenuClose();
ADDRGP4 BotCommand_MenuClose
CALLV
pop
line 2077
;2077:	trap_Cmd_ExecuteText( EXEC_APPEND, va("say_team \"%s\"\n", commandString[cmd]));
ADDRGP4 $1067
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 commandString
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 2078
;2078:}
LABELV $1099
endproc DM_Command_Event 32 12
proc DM_Close_Event 0 0
line 2088
;2079:
;2080:
;2081:
;2082:/*
;2083:=================
;2084:DM_Close_Event
;2085:=================
;2086:*/
;2087:static void DM_Close_Event( int index )
;2088:{
line 2089
;2089:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 2090
;2090:}
LABELV $1108
endproc DM_Close_Event 0 0
proc DM_TeamList_SubMenu 12 16
line 2102
;2091:
;2092:
;2093:
;2094:
;2095:
;2096:/*
;2097:=================
;2098:DM_TeamList_SubMenu
;2099:=================
;2100:*/
;2101:static void DM_TeamList_SubMenu( void )
;2102:{
line 2103
;2103:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 2105
;2104:
;2105:	DynamicMenu_AddItem("me", 0, 0, DM_BotPlayerTarget_Event);
ADDRGP4 $1110
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotPlayerTarget_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2106
;2106:	if ( DynamicMenu_ServerGametype() == GT_FFA || DynamicMenu_ServerGametype() == GT_LMS || DynamicMenu_ServerGametype() == GT_SANDBOX ){
ADDRLP4 0
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1114
ADDRLP4 4
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $1114
ADDRLP4 8
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1111
LABELV $1114
line 2107
;2107:	DynamicMenu_AddListOfPlayers(PT_ALL, 0, DM_BotPlayerTarget_Event);
CNSTI4 64
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotPlayerTarget_Event
ARGP4
ADDRGP4 DynamicMenu_AddListOfPlayers
CALLV
pop
line 2108
;2108:	} else {
ADDRGP4 $1112
JUMPV
LABELV $1111
line 2109
;2109:	DynamicMenu_AddListOfPlayers(PT_FRIENDLY|PT_EXCLUDEGRANDPARENT, 0, DM_BotPlayerTarget_Event);	
CNSTI4 33
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotPlayerTarget_Event
ARGP4
ADDRGP4 DynamicMenu_AddListOfPlayers
CALLV
pop
line 2110
;2110:	}
LABELV $1112
line 2112
;2111:
;2112:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 2113
;2113:}
LABELV $1109
endproc DM_TeamList_SubMenu 12 16
proc DM_ItemPatrol2_SubMenu 20 12
line 2124
;2114:
;2115:
;2116:
;2117:
;2118:/*
;2119:=================
;2120:DM_ItemPatrol2_SubMenu
;2121:=================
;2122:*/
;2123:static void DM_ItemPatrol2_SubMenu( void )
;2124:{
line 2129
;2125:	int exclude;
;2126:	int index;
;2127:	int depth;
;2128:
;2129:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 2131
;2130:
;2131:	depth = DynamicMenu_Depth() - 1;
ADDRLP4 12
ADDRGP4 DynamicMenu_Depth
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2132
;2132:	exclude = DynamicMenu_ActiveIdAtDepth(depth);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 DynamicMenu_ActiveIdAtDepth
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 2135
;2133://	index = s_dynamic.active[depth - 1];	// previous menu level
;2134://	exclude = s_dynamic.data[index].id;
;2135:	DynamicMenu_AddListOfItems(exclude, 0, DM_BotItemItemTarget_Event);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotItemItemTarget_Event
ARGP4
ADDRGP4 DynamicMenu_AddListOfItems
CALLV
pop
line 2137
;2136:
;2137:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 2138
;2138:}
LABELV $1115
endproc DM_ItemPatrol2_SubMenu 20 12
proc DM_ItemPatrol_SubMenu 0 12
line 2150
;2139:
;2140:
;2141:
;2142:
;2143:
;2144:/*
;2145:=================
;2146:DM_ItemPatrol_SubMenu
;2147:=================
;2148:*/
;2149:static void DM_ItemPatrol_SubMenu( void )
;2150:{
line 2151
;2151:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 2152
;2152:	DynamicMenu_AddListOfItems(-1, DM_ItemPatrol2_SubMenu, 0);
CNSTI4 -1
ARGI4
ADDRGP4 DM_ItemPatrol2_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddListOfItems
CALLV
pop
line 2153
;2153:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 2154
;2154:}
LABELV $1116
endproc DM_ItemPatrol_SubMenu 0 12
proc DM_CampItemList_SubMenu 0 16
line 2166
;2155:
;2156:
;2157:
;2158:
;2159:
;2160:/*
;2161:=================
;2162:DM_CampItemList_SubMenu
;2163:=================
;2164:*/
;2165:static void DM_CampItemList_SubMenu( void )
;2166:{
line 2167
;2167:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 2168
;2168:	DynamicMenu_AddItem("here", -1, 0, DM_BotItemTarget_Event);
ADDRGP4 $1118
ARGP4
CNSTI4 -1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotItemTarget_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2169
;2169:	DynamicMenu_AddItem("there", -1, 0, DM_BotItemTarget_Event);
ADDRGP4 $1119
ARGP4
CNSTI4 -1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotItemTarget_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2170
;2170:	DynamicMenu_AddListOfItems(-1, 0, DM_BotItemTarget_Event);
CNSTI4 -1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotItemTarget_Event
ARGP4
ADDRGP4 DynamicMenu_AddListOfItems
CALLV
pop
line 2171
;2171:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 2172
;2172:}
LABELV $1117
endproc DM_CampItemList_SubMenu 0 16
export DM_ItemList_SubMenu
proc DM_ItemList_SubMenu 0 12
line 2186
;2173:
;2174:
;2175:
;2176:
;2177:
;2178:
;2179:
;2180:/*
;2181:=================
;2182:DM_ItemList_SubMenu
;2183:=================
;2184:*/
;2185:void DM_ItemList_SubMenu( void )
;2186:{
line 2187
;2187:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 2188
;2188:	DynamicMenu_AddListOfItems(-1, 0, DM_BotItemTarget_Event);
CNSTI4 -1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotItemTarget_Event
ARGP4
ADDRGP4 DynamicMenu_AddListOfItems
CALLV
pop
line 2189
;2189:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 2190
;2190:}
LABELV $1120
endproc DM_ItemList_SubMenu 0 12
proc DM_EnemyList_SubMenu 12 12
line 2202
;2191:
;2192:
;2193:
;2194:
;2195:
;2196:/*
;2197:=================
;2198:DM_EnemyList_SubMenu
;2199:=================
;2200:*/
;2201:static void DM_EnemyList_SubMenu( void )
;2202:{
line 2203
;2203:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 2204
;2204:	if ( DynamicMenu_ServerGametype() == GT_FFA || DynamicMenu_ServerGametype() == GT_LMS || DynamicMenu_ServerGametype() == GT_SANDBOX ){
ADDRLP4 0
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1125
ADDRLP4 4
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $1125
ADDRLP4 8
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1122
LABELV $1125
line 2205
;2205:	DynamicMenu_AddListOfPlayers(PT_ALL, 0, DM_BotPlayerTarget_Event);
CNSTI4 64
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotPlayerTarget_Event
ARGP4
ADDRGP4 DynamicMenu_AddListOfPlayers
CALLV
pop
line 2206
;2206:	} else {
ADDRGP4 $1123
JUMPV
LABELV $1122
line 2207
;2207:	DynamicMenu_AddListOfPlayers(PT_ENEMY, 0, DM_BotPlayerTarget_Event);	
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotPlayerTarget_Event
ARGP4
ADDRGP4 DynamicMenu_AddListOfPlayers
CALLV
pop
line 2208
;2208:	}
LABELV $1123
line 2209
;2209:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 2210
;2210:}
LABELV $1121
endproc DM_EnemyList_SubMenu 12 12
proc DM_CommandList_SubMenu 0 16
line 2220
;2211:
;2212:
;2213:
;2214:/*
;2215:=================
;2216:DM_CommandList_SubMenu
;2217:=================
;2218:*/
;2219:static void DM_CommandList_SubMenu( void )
;2220:{
line 2221
;2221:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 2223
;2222:
;2223:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1127
line 2224
;2224:	DynamicMenu_AddItem("Report", BC_REPORT, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1130
ARGP4
CNSTI4 8
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2225
;2225:	DynamicMenu_AddItem("Help", BC_HELP, DM_TeamList_SubMenu, 0);
ADDRGP4 $1131
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 DM_TeamList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2226
;2226:	}
LABELV $1127
line 2227
;2227:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1132
line 2228
;2228:	DynamicMenu_AddItem("Репорт", BC_REPORT, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1135
ARGP4
CNSTI4 8
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2229
;2229:	DynamicMenu_AddItem("Помощь", BC_HELP, DM_TeamList_SubMenu, 0);
ADDRGP4 $1136
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 DM_TeamList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2230
;2230:	}
LABELV $1132
line 2232
;2231:
;2232:	if (botcommandmenu_gametype == GT_CTF)
ADDRGP4 botcommandmenu_gametype
INDIRI4
CNSTI4 5
NEI4 $1137
line 2233
;2233:	{
line 2234
;2234:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1139
line 2235
;2235:		DynamicMenu_AddItem("Capture Flag", BC_GETFLAG, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1142
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2236
;2236:		DynamicMenu_AddItem("Defend Base", BC_DEFENDBASE, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1143
ARGP4
CNSTI4 11
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2237
;2237:		}
LABELV $1139
line 2238
;2238:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1144
line 2239
;2239:		DynamicMenu_AddItem("Захват Флага", BC_GETFLAG, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1147
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2240
;2240:		DynamicMenu_AddItem("Защита Базы", BC_DEFENDBASE, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1148
ARGP4
CNSTI4 11
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2241
;2241:		}
LABELV $1144
line 2242
;2242:	}
LABELV $1137
line 2243
;2243:	if (botcommandmenu_gametype == GT_CTF_ELIMINATION)
ADDRGP4 botcommandmenu_gametype
INDIRI4
CNSTI4 10
NEI4 $1149
line 2244
;2244:	{
line 2245
;2245:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1151
line 2246
;2246:		DynamicMenu_AddItem("Capture Flag", BC_GETFLAG, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1142
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2247
;2247:		DynamicMenu_AddItem("Defend Base", BC_DEFENDBASE, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1143
ARGP4
CNSTI4 11
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2248
;2248:		}
LABELV $1151
line 2249
;2249:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1154
line 2250
;2250:		DynamicMenu_AddItem("Захват Флага", BC_GETFLAG, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1147
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2251
;2251:		DynamicMenu_AddItem("Защита Базы", BC_DEFENDBASE, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1148
ARGP4
CNSTI4 11
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2252
;2252:		}
LABELV $1154
line 2253
;2253:	}
LABELV $1149
line 2254
;2254:	if (botcommandmenu_gametype == GT_1FCTF)
ADDRGP4 botcommandmenu_gametype
INDIRI4
CNSTI4 6
NEI4 $1157
line 2255
;2255:	{
line 2256
;2256:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1159
line 2257
;2257:		DynamicMenu_AddItem("Capture Flag", BC_GETFLAG, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1142
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2258
;2258:		DynamicMenu_AddItem("Defend Base", BC_DEFENDBASE, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1143
ARGP4
CNSTI4 11
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2259
;2259:		}
LABELV $1159
line 2260
;2260:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1162
line 2261
;2261:		DynamicMenu_AddItem("Захват Флага", BC_GETFLAG, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1147
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2262
;2262:		DynamicMenu_AddItem("Защита Базы", BC_DEFENDBASE, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1148
ARGP4
CNSTI4 11
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2263
;2263:		}
LABELV $1162
line 2264
;2264:	}
LABELV $1157
line 2266
;2265:	
;2266:	if (botcommandmenu_gametype == GT_OBELISK)
ADDRGP4 botcommandmenu_gametype
INDIRI4
CNSTI4 7
NEI4 $1165
line 2267
;2267:	{
line 2268
;2268:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1167
line 2269
;2269:		DynamicMenu_AddItem("Attack Enemy", BC_ATTACKBASE, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1170
ARGP4
CNSTI4 12
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2270
;2270:		DynamicMenu_AddItem("Defend Base", BC_DEFENDBASE, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1143
ARGP4
CNSTI4 11
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2271
;2271:		}
LABELV $1167
line 2272
;2272:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1171
line 2273
;2273:		DynamicMenu_AddItem("Атакуй Врага", BC_GETFLAG, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1174
ARGP4
CNSTI4 10
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2274
;2274:		DynamicMenu_AddItem("Защита Базы", BC_DEFENDBASE, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1148
ARGP4
CNSTI4 11
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2275
;2275:		}
LABELV $1171
line 2276
;2276:	}
LABELV $1165
line 2278
;2277:	
;2278:	if (botcommandmenu_gametype == GT_HARVESTER)
ADDRGP4 botcommandmenu_gametype
INDIRI4
CNSTI4 8
NEI4 $1175
line 2279
;2279:	{
line 2280
;2280:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1177
line 2281
;2281:		DynamicMenu_AddItem("Collect skulls", BC_COLLECTSKULLS, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1180
ARGP4
CNSTI4 13
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2282
;2282:		}
LABELV $1177
line 2283
;2283:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1181
line 2284
;2284:		DynamicMenu_AddItem("Собирай черепа", BC_COLLECTSKULLS, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1184
ARGP4
CNSTI4 13
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2285
;2285:		}
LABELV $1181
line 2286
;2286:	}
LABELV $1175
line 2288
;2287:	
;2288:	if (botcommandmenu_gametype == GT_DOUBLE_D)
ADDRGP4 botcommandmenu_gametype
INDIRI4
CNSTI4 12
NEI4 $1185
line 2289
;2289:	{
line 2290
;2290:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1187
line 2291
;2291:		DynamicMenu_AddItem("Take A point", BC_DOMINATEA, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1190
ARGP4
CNSTI4 14
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2292
;2292:		DynamicMenu_AddItem("Take B point", BC_DOMINATEB, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1191
ARGP4
CNSTI4 15
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2293
;2293:		}
LABELV $1187
line 2294
;2294:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1192
line 2295
;2295:		DynamicMenu_AddItem("Возьми A точку", BC_DOMINATEA, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1195
ARGP4
CNSTI4 14
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2296
;2296:		DynamicMenu_AddItem("Возьми B точку", BC_DOMINATEB, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1196
ARGP4
CNSTI4 15
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2297
;2297:		}
LABELV $1192
line 2298
;2298:	}
LABELV $1185
line 2300
;2299:
;2300:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1197
line 2301
;2301:	DynamicMenu_AddItem("Follow", BC_FOLLOW, DM_TeamList_SubMenu, 0);
ADDRGP4 $1200
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 DM_TeamList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2302
;2302:	DynamicMenu_AddItem("Get", BC_GET, DM_ItemList_SubMenu, 0);
ADDRGP4 $1201
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 DM_ItemList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2303
;2303:	DynamicMenu_AddItem("Patrol", BC_PATROL, DM_ItemPatrol_SubMenu, 0);
ADDRGP4 $1202
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 DM_ItemPatrol_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2304
;2304:	DynamicMenu_AddItem("Camp", BC_CAMP, DM_CampItemList_SubMenu, 0);
ADDRGP4 $1203
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 DM_CampItemList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2305
;2305:	DynamicMenu_AddItem("Hunt", BC_HUNT, DM_EnemyList_SubMenu, 0);
ADDRGP4 $1204
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 DM_EnemyList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2306
;2306:	DynamicMenu_AddItem("Point+", BC_POINT, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1205
ARGP4
CNSTI4 9
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2307
;2307:	DynamicMenu_AddItem("Dismiss", BC_DISMISS, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1206
ARGP4
CNSTI4 7
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2308
;2308:	}
LABELV $1197
line 2309
;2309:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1207
line 2310
;2310:	DynamicMenu_AddItem("Следуй", BC_FOLLOW, DM_TeamList_SubMenu, 0);
ADDRGP4 $1210
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 DM_TeamList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2311
;2311:	DynamicMenu_AddItem("Возьми", BC_GET, DM_ItemList_SubMenu, 0);
ADDRGP4 $1211
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 DM_ItemList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2312
;2312:	DynamicMenu_AddItem("Патрулируй", BC_PATROL, DM_ItemPatrol_SubMenu, 0);
ADDRGP4 $1212
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 DM_ItemPatrol_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2313
;2313:	DynamicMenu_AddItem("Сиди", BC_CAMP, DM_CampItemList_SubMenu, 0);
ADDRGP4 $1213
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 DM_CampItemList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2314
;2314:	DynamicMenu_AddItem("Охоться", BC_HUNT, DM_EnemyList_SubMenu, 0);
ADDRGP4 $1214
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 DM_EnemyList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2315
;2315:	DynamicMenu_AddItem("Точка+", BC_POINT, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1215
ARGP4
CNSTI4 9
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2316
;2316:	DynamicMenu_AddItem("Отбой", BC_DISMISS, (createHandler)0, DM_BotCommand_Event);
ADDRGP4 $1216
ARGP4
CNSTI4 7
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BotCommand_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2317
;2317:	}
LABELV $1207
line 2319
;2318:
;2319:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 2320
;2320:}
LABELV $1126
endproc DM_CommandList_SubMenu 0 16
proc BotCommand_InitPrimaryMenu 12 16
line 2330
;2321:
;2322:
;2323:
;2324:/*
;2325:=================
;2326:BotCommand_InitPrimaryMenu
;2327:=================
;2328:*/
;2329:static void BotCommand_InitPrimaryMenu( void )
;2330:{
line 2331
;2331:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 2333
;2332:
;2333:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1218
line 2334
;2334:	DynamicMenu_AddItem("Close!", 0, 0, DM_Close_Event);
ADDRGP4 $973
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2335
;2335:	DynamicMenu_AddItem("Everyone", 0, DM_CommandList_SubMenu, 0);
ADDRGP4 $1221
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 DM_CommandList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2336
;2336:	if ( DynamicMenu_ServerGametype() == GT_FFA || DynamicMenu_ServerGametype() == GT_LMS || DynamicMenu_ServerGametype() == GT_SANDBOX ){
ADDRLP4 0
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1225
ADDRLP4 4
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $1225
ADDRLP4 8
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1222
LABELV $1225
line 2337
;2337:	DynamicMenu_AddListOfPlayers(PT_ALL, DM_CommandList_SubMenu, 0);
CNSTI4 64
ARGI4
ADDRGP4 DM_CommandList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddListOfPlayers
CALLV
pop
line 2338
;2338:	} else {
ADDRGP4 $1223
JUMPV
LABELV $1222
line 2339
;2339:	DynamicMenu_AddListOfPlayers(PT_FRIENDLY|PT_BOTONLY, DM_CommandList_SubMenu, 0);		
CNSTI4 5
ARGI4
ADDRGP4 DM_CommandList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddListOfPlayers
CALLV
pop
line 2340
;2340:	}
LABELV $1223
line 2341
;2341:	DynamicMenu_AddItem("Leader?", COM_WHOLEADER, 0, DM_Command_Event);
ADDRGP4 $1226
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Command_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2342
;2342:	}
LABELV $1218
line 2344
;2343:	
;2344:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1227
line 2345
;2345:	DynamicMenu_AddItem("Закрыть!", 0, 0, DM_Close_Event);
ADDRGP4 $993
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2346
;2346:	DynamicMenu_AddItem("Everyone", 0, DM_CommandList_SubMenu, 0);
ADDRGP4 $1221
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 DM_CommandList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2347
;2347:	if ( DynamicMenu_ServerGametype() == GT_FFA || DynamicMenu_ServerGametype() == GT_LMS || DynamicMenu_ServerGametype() == GT_SANDBOX ){
ADDRLP4 0
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1233
ADDRLP4 4
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $1233
ADDRLP4 8
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1230
LABELV $1233
line 2348
;2348:	DynamicMenu_AddListOfPlayers(PT_ALL, DM_CommandList_SubMenu, 0);
CNSTI4 64
ARGI4
ADDRGP4 DM_CommandList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddListOfPlayers
CALLV
pop
line 2349
;2349:	} else {
ADDRGP4 $1231
JUMPV
LABELV $1230
line 2350
;2350:	DynamicMenu_AddListOfPlayers(PT_FRIENDLY|PT_BOTONLY, DM_CommandList_SubMenu, 0);		
CNSTI4 5
ARGI4
ADDRGP4 DM_CommandList_SubMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddListOfPlayers
CALLV
pop
line 2351
;2351:	}
LABELV $1231
line 2352
;2352:	DynamicMenu_AddItem("Лидер?", COM_WHOLEADER, 0, DM_Command_Event);
ADDRGP4 $1234
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Command_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2353
;2353:	}
LABELV $1227
line 2355
;2354:
;2355:	if (botcommandmenu_gametype == GT_CTF)
ADDRGP4 botcommandmenu_gametype
INDIRI4
CNSTI4 5
NEI4 $1235
line 2356
;2356:	{
line 2357
;2357:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1237
line 2358
;2358:		DynamicMenu_AddItem("My task?", COM_MYTASK, 0, DM_Command_Event);
ADDRGP4 $1240
ARGP4
CNSTI4 3
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Command_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2359
;2359:		}
LABELV $1237
line 2360
;2360:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1241
line 2361
;2361:		DynamicMenu_AddItem("Моя задача?", COM_MYTASK, 0, DM_Command_Event);
ADDRGP4 $1244
ARGP4
CNSTI4 3
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Command_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2362
;2362:		}
LABELV $1241
line 2363
;2363:	}
LABELV $1235
line 2365
;2364:
;2365:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1245
line 2366
;2366:	DynamicMenu_AddItem("Lead", COM_IAMLEADER, (createHandler)0, DM_Command_Event);
ADDRGP4 $1248
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Command_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2367
;2367:	DynamicMenu_AddItem("Resign", COM_QUITLEADER, (createHandler)0, DM_Command_Event);
ADDRGP4 $1249
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Command_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2368
;2368:	}
LABELV $1245
line 2369
;2369:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1250
line 2370
;2370:	DynamicMenu_AddItem("Я лидер", COM_IAMLEADER, (createHandler)0, DM_Command_Event);
ADDRGP4 $1253
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Command_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2371
;2371:	DynamicMenu_AddItem("Я не лидер", COM_QUITLEADER, (createHandler)0, DM_Command_Event);
ADDRGP4 $1254
ARGP4
CNSTI4 2
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Command_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 2372
;2372:	}
LABELV $1250
line 2374
;2373:
;2374:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 2375
;2375:}
LABELV $1217
endproc BotCommand_InitPrimaryMenu 12 16
export UI_BotCommand_Cache
proc UI_BotCommand_Cache 0 0
line 2389
;2376:
;2377:
;2378:
;2379:
;2380:
;2381:
;2382:
;2383:/*
;2384:=================
;2385:UI_BotCommand_Cache
;2386:=================
;2387:*/
;2388:void UI_BotCommand_Cache( void )
;2389:{
line 2390
;2390:}
LABELV $1255
endproc UI_BotCommand_Cache 0 0
export UI_BotCommandMenu
proc UI_BotCommandMenu 8 8
line 2401
;2391:
;2392:
;2393:
;2394:
;2395:/*
;2396:=================
;2397:UI_BotCommandMenu
;2398:=================
;2399:*/
;2400:void UI_BotCommandMenu( void )
;2401:{
line 2402
;2402:	if (UI_CurrentPlayerTeam() == TEAM_SPECTATOR)
ADDRLP4 0
ADDRGP4 UI_CurrentPlayerTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $1257
line 2403
;2403:		return;
ADDRGP4 $1256
JUMPV
LABELV $1257
line 2405
;2404:
;2405:	botcommandmenu_gametype = DynamicMenu_ServerGametype();
ADDRLP4 4
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRGP4 botcommandmenu_gametype
ADDRLP4 4
INDIRI4
ASGNI4
line 2409
;2406:	//if ( botcommandmenu_gametype< GT_TEAM || botcommandmenu_gametype == GT_LMS)
;2407:		//return;
;2408:
;2409:	DynamicMenu_MenuInit(qfalse, qtrue);
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 DynamicMenu_MenuInit
CALLV
pop
line 2410
;2410:	BotCommand_InitPrimaryMenu();
ADDRGP4 BotCommand_InitPrimaryMenu
CALLV
pop
line 2411
;2411:}
LABELV $1256
endproc UI_BotCommandMenu 8 8
export UI_BotCommandMenu_f
proc UI_BotCommandMenu_f 0 0
line 2421
;2412:
;2413:
;2414:
;2415:/*
;2416:=================
;2417:UI_BotCommandMenu_f
;2418:=================
;2419:*/
;2420:void UI_BotCommandMenu_f( void )
;2421:{
line 2422
;2422:	UI_BotCommandMenu();
ADDRGP4 UI_BotCommandMenu
CALLV
pop
line 2423
;2423:}
LABELV $1259
endproc UI_BotCommandMenu_f 0 0
bss
export botCommandId
align 4
LABELV botCommandId
skip 4
export commandId
align 4
LABELV commandId
skip 4
align 4
LABELV s_ingame
skip 2468
import DynamicMenu_AddListOfItems
import DynamicMenu_AddListOfPlayers
import DynamicMenu_ItemShortname
import DynamicMenu_ActiveIndexAtDepth
import DynamicMenu_ActiveIdAtDepth
import DynamicMenu_IdAtIndex
import DynamicMenu_DepthOfIndex
import DynamicMenu_StringAtIndex
import DynamicMenu_OnActiveList
import DynamicMenu_Depth
import DynamicMenu_ServerGametype
import DynamicMenu_SetFlags
import DynamicMenu_SetFocus
import DynamicMenu_ClearFocus
import DynamicMenu_MenuInit
import DynamicMenu_FinishSubMenuInit
import DynamicMenu_SubMenuInit
import DynamicMenu_AddBackground
import DynamicMenu_AddIconItem
import DynamicMenu_AddItem
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
import UI_DynamicMenuCache
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
LABELV $1254
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 0
align 1
LABELV $1253
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 0
align 1
LABELV $1249
byte 1 82
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 0
align 1
LABELV $1248
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1244
byte 1 208
byte 1 156
byte 1 208
byte 1 190
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 209
byte 1 135
byte 1 208
byte 1 176
byte 1 63
byte 1 0
align 1
LABELV $1240
byte 1 77
byte 1 121
byte 1 32
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 63
byte 1 0
align 1
LABELV $1234
byte 1 208
byte 1 155
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 63
byte 1 0
align 1
LABELV $1226
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 63
byte 1 0
align 1
LABELV $1221
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1216
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $1215
byte 1 208
byte 1 162
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 43
byte 1 0
align 1
LABELV $1214
byte 1 208
byte 1 158
byte 1 209
byte 1 133
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $1213
byte 1 208
byte 1 161
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $1212
byte 1 208
byte 1 159
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $1211
byte 1 208
byte 1 146
byte 1 208
byte 1 190
byte 1 208
byte 1 183
byte 1 209
byte 1 140
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $1210
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 209
byte 1 131
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $1206
byte 1 68
byte 1 105
byte 1 115
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $1205
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 43
byte 1 0
align 1
LABELV $1204
byte 1 72
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1203
byte 1 67
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $1202
byte 1 80
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $1201
byte 1 71
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1200
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1196
byte 1 208
byte 1 146
byte 1 208
byte 1 190
byte 1 208
byte 1 183
byte 1 209
byte 1 140
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 32
byte 1 66
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 186
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $1195
byte 1 208
byte 1 146
byte 1 208
byte 1 190
byte 1 208
byte 1 183
byte 1 209
byte 1 140
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 32
byte 1 65
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 186
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $1191
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 66
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1190
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 65
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1184
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 32
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $1180
byte 1 67
byte 1 111
byte 1 108
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $1174
byte 1 208
byte 1 144
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 209
byte 1 131
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 146
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $1170
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1148
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 137
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $1147
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 164
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $1143
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1142
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $1136
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 209
byte 1 137
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $1135
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $1131
byte 1 72
byte 1 101
byte 1 108
byte 1 112
byte 1 0
align 1
LABELV $1130
byte 1 82
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $1119
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1118
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1110
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1106
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1102
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1096
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1092
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1085
byte 1 66
byte 1 111
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1081
byte 1 66
byte 1 111
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1076
byte 1 66
byte 1 111
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1072
byte 1 66
byte 1 111
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1067
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1066
byte 1 66
byte 1 111
byte 1 116
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1062
byte 1 66
byte 1 111
byte 1 116
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1053
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
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
LABELV $1052
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
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
LABELV $1051
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $1050
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
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
byte 1 0
align 1
LABELV $1049
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1048
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $1047
byte 1 37
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1046
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $1045
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1044
byte 1 37
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1043
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1042
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1041
byte 1 37
byte 1 115
byte 1 32
byte 1 103
byte 1 114
byte 1 97
byte 1 98
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1040
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1039
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1038
byte 1 0
align 1
LABELV $1036
byte 1 87
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 109
byte 1 121
byte 1 32
byte 1 106
byte 1 111
byte 1 98
byte 1 0
align 1
LABELV $1035
byte 1 73
byte 1 32
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1034
byte 1 73
byte 1 32
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1033
byte 1 87
byte 1 104
byte 1 111
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1010
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
LABELV $1009
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 33
byte 1 0
align 1
LABELV $1008
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 147
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $1007
byte 1 208
byte 1 147
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $1006
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $1005
byte 1 208
byte 1 157
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $1004
byte 1 208
byte 1 154
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $1003
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $1002
byte 1 208
byte 1 161
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $1001
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $997
byte 1 208
byte 1 148
byte 1 208
byte 1 181
byte 1 208
byte 1 185
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $993
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 33
byte 1 0
align 1
LABELV $989
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 33
byte 1 0
align 1
LABELV $988
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $987
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $986
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $985
byte 1 83
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $984
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $983
byte 1 66
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $982
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $981
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $977
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $973
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $965
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 35
byte 1 50
byte 1 0
align 1
LABELV $964
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 35
byte 1 49
byte 1 0
align 1
LABELV $963
byte 1 208
byte 1 157
byte 1 208
byte 1 176
byte 1 208
byte 1 177
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $959
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 35
byte 1 50
byte 1 0
align 1
LABELV $958
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 35
byte 1 49
byte 1 0
align 1
LABELV $957
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $953
byte 1 208
byte 1 161
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 209
byte 1 143
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $952
byte 1 208
byte 1 154
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $951
byte 1 208
byte 1 144
byte 1 208
byte 1 178
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $947
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 0
align 1
LABELV $946
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $945
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $944
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $943
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $942
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 32
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $938
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $934
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
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
LABELV $933
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $925
byte 1 208
byte 1 147
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 156
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 142
byte 1 0
align 1
LABELV $924
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 209
byte 1 133
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $920
byte 1 77
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $919
byte 1 81
byte 1 117
byte 1 105
byte 1 116
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $914
byte 1 208
byte 1 163
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $913
byte 1 208
byte 1 148
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $909
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $908
byte 1 65
byte 1 100
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $903
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 56
byte 1 0
align 1
LABELV $902
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 55
byte 1 0
align 1
LABELV $901
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 54
byte 1 0
align 1
LABELV $900
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 53
byte 1 0
align 1
LABELV $899
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 52
byte 1 0
align 1
LABELV $898
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $897
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $896
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $892
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 83
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 56
byte 1 0
align 1
LABELV $891
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 83
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 55
byte 1 0
align 1
LABELV $890
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 83
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 54
byte 1 0
align 1
LABELV $889
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 83
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 53
byte 1 0
align 1
LABELV $888
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 83
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 52
byte 1 0
align 1
LABELV $887
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 83
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $886
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 83
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $885
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 83
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $880
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 209
byte 1 143
byte 1 208
byte 1 187
byte 1 0
align 1
LABELV $879
byte 1 208
byte 1 158
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 191
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $878
byte 1 208
byte 1 157
byte 1 208
byte 1 176
byte 1 209
byte 1 135
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 191
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $874
byte 1 73
byte 1 32
byte 1 97
byte 1 109
byte 1 32
byte 1 115
byte 1 116
byte 1 117
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $873
byte 1 83
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $872
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $867
byte 1 208
byte 1 160
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $866
byte 1 208
byte 1 161
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $865
byte 1 208
byte 1 151
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 208
byte 1 186
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $864
byte 1 208
byte 1 173
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $863
byte 1 208
byte 1 147
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 132
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $862
byte 1 208
byte 1 159
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $861
byte 1 208
byte 1 163
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $860
byte 1 208
byte 1 156
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $859
byte 1 208
byte 1 152
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $855
byte 1 65
byte 1 100
byte 1 118
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $854
byte 1 78
byte 1 101
byte 1 116
byte 1 119
byte 1 111
byte 1 114
byte 1 107
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $853
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $852
byte 1 68
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $851
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $850
byte 1 80
byte 1 114
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 115
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $849
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $848
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $847
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $842
byte 1 208
byte 1 154
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $841
byte 1 208
byte 1 154
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 148
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $837
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $836
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 89
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $830
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $829
byte 1 208
byte 1 148
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $825
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $824
byte 1 89
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $814
byte 1 208
byte 1 148
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $813
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $812
byte 1 208
byte 1 155
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $811
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $810
byte 1 208
byte 1 154
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $806
byte 1 77
byte 1 105
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $805
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $804
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $803
byte 1 77
byte 1 97
byte 1 112
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $802
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $782
byte 1 208
byte 1 155
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 0
align 1
LABELV $778
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $772
byte 1 208
byte 1 155
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $771
byte 1 208
byte 1 160
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $770
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $769
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 209
byte 1 137
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $765
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $764
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $763
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $762
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $757
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 209
byte 1 131
byte 1 209
byte 1 137
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $756
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $755
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $751
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $750
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $749
byte 1 82
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $744
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $743
byte 1 208
byte 1 146
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $739
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $738
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $730
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $729
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $728
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $727
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $722
byte 1 208
byte 1 145
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 0
align 1
LABELV $718
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $717
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $716
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $715
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $714
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $713
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $712
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $711
byte 1 53
byte 1 0
align 1
LABELV $710
byte 1 85
byte 1 110
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $705
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
LABELV $704
byte 1 73
byte 1 71
byte 1 95
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $697
byte 1 73
byte 1 71
byte 1 95
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $695
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $693
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $691
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $680
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $679
byte 1 73
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $678
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $676
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $671
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $669
byte 1 73
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 45
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $663
byte 1 73
byte 1 71
byte 1 95
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $662
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 56
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $660
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 55
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $658
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 54
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $656
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 53
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $654
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 52
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $652
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 51
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $650
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 50
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $648
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 49
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $643
byte 1 73
byte 1 71
byte 1 95
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $642
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $640
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $638
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $632
byte 1 73
byte 1 71
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $617
byte 1 73
byte 1 71
byte 1 95
byte 1 85
byte 1 115
byte 1 101
byte 1 79
byte 1 108
byte 1 100
byte 1 73
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $612
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $610
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $608
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $605
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $604
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $603
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $602
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $601
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $600
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $599
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $590
byte 1 208
byte 1 148
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $589
byte 1 50
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $588
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $587
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 208
byte 1 163
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $586
byte 1 208
byte 1 163
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $585
byte 1 208
byte 1 150
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 209
byte 1 134
byte 1 0
align 1
LABELV $584
byte 1 208
byte 1 144
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $583
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 0
align 1
LABELV $582
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $581
byte 1 208
byte 1 154
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $580
byte 1 208
byte 1 162
byte 1 209
byte 1 131
byte 1 209
byte 1 128
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 0
align 1
LABELV $579
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $578
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 209
byte 1 133
byte 1 0
align 1
LABELV $577
byte 1 208
byte 1 159
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $576
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $575
byte 1 50
byte 1 32
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $574
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $573
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $572
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $571
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $570
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $569
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $568
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $567
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $566
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $565
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $564
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $563
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 66
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $543
byte 1 208
byte 1 146
byte 1 208
byte 1 171
byte 1 208
byte 1 153
byte 1 208
byte 1 162
byte 1 208
byte 1 152
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 151
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $537
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $516
byte 1 208
byte 1 159
byte 1 208
byte 1 158
byte 1 208
byte 1 154
byte 1 208
byte 1 152
byte 1 208
byte 1 157
byte 1 208
byte 1 163
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 32
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 157
byte 1 208
byte 1 163
byte 1 0
align 1
LABELV $510
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 0
align 1
LABELV $487
byte 1 208
byte 1 159
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 148
byte 1 208
byte 1 158
byte 1 208
byte 1 155
byte 1 208
byte 1 150
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 163
byte 1 0
align 1
LABELV $481
byte 1 82
byte 1 69
byte 1 83
byte 1 85
byte 1 77
byte 1 69
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $456
byte 1 208
byte 1 161
byte 1 208
byte 1 155
byte 1 208
byte 1 149
byte 1 208
byte 1 148
byte 1 208
byte 1 163
byte 1 208
byte 1 174
byte 1 208
byte 1 168
byte 1 208
byte 1 144
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 154
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 162
byte 1 208
byte 1 144
byte 1 0
align 1
LABELV $450
byte 1 78
byte 1 69
byte 1 88
byte 1 84
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 0
align 1
LABELV $425
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 161
byte 1 208
byte 1 162
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 162
byte 1 32
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 157
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $419
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 0
align 1
LABELV $394
byte 1 208
byte 1 158
byte 1 208
byte 1 162
byte 1 208
byte 1 154
byte 1 208
byte 1 155
byte 1 208
byte 1 174
byte 1 208
byte 1 167
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
byte 1 159
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 148
byte 1 208
byte 1 156
byte 1 208
byte 1 149
byte 1 208
byte 1 162
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 0
align 1
LABELV $388
byte 1 68
byte 1 73
byte 1 83
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 83
byte 1 0
align 1
LABELV $365
byte 1 208
byte 1 152
byte 1 208
byte 1 157
byte 1 208
byte 1 164
byte 1 208
byte 1 158
byte 1 208
byte 1 160
byte 1 208
byte 1 156
byte 1 208
byte 1 144
byte 1 208
byte 1 166
byte 1 208
byte 1 152
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 158
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 208
byte 1 146
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 0
align 1
LABELV $359
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 73
byte 1 78
byte 1 70
byte 1 79
byte 1 0
align 1
LABELV $338
byte 1 208
byte 1 157
byte 1 208
byte 1 144
byte 1 208
byte 1 161
byte 1 208
byte 1 162
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 153
byte 1 208
byte 1 154
byte 1 208
byte 1 152
byte 1 0
align 1
LABELV $332
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $297
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
byte 1 157
byte 1 208
byte 1 171
byte 1 208
byte 1 149
byte 1 32
byte 1 208
byte 1 159
byte 1 208
byte 1 160
byte 1 208
byte 1 152
byte 1 208
byte 1 154
byte 1 208
byte 1 144
byte 1 208
byte 1 151
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $291
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $265
byte 1 208
byte 1 163
byte 1 208
byte 1 148
byte 1 208
byte 1 144
byte 1 208
byte 1 155
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
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
LABELV $259
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
LABELV $239
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
LABELV $238
byte 1 115
byte 1 118
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
LABELV $231
byte 1 208
byte 1 148
byte 1 208
byte 1 158
byte 1 208
byte 1 145
byte 1 208
byte 1 144
byte 1 208
byte 1 146
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
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
LABELV $225
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $204
byte 1 208
byte 1 161
byte 1 208
byte 1 162
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 162
byte 1 0
align 1
LABELV $198
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $173
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
LABELV $162
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
byte 1 115
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $148
byte 1 208
byte 1 161
byte 1 208
byte 1 155
byte 1 208
byte 1 149
byte 1 208
byte 1 148
byte 1 208
byte 1 163
byte 1 208
byte 1 174
byte 1 208
byte 1 168
byte 1 208
byte 1 144
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 154
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 162
byte 1 208
byte 1 144
byte 1 63
byte 1 0
align 1
LABELV $144
byte 1 78
byte 1 69
byte 1 88
byte 1 84
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 63
byte 1 0
align 1
LABELV $134
byte 1 208
byte 1 146
byte 1 208
byte 1 171
byte 1 208
byte 1 153
byte 1 208
byte 1 162
byte 1 208
byte 1 152
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 151
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 171
byte 1 63
byte 1 0
align 1
LABELV $130
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $125
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 161
byte 1 208
byte 1 162
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 162
byte 1 32
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 157
byte 1 208
byte 1 171
byte 1 63
byte 1 0
align 1
LABELV $121
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 63
byte 1 0
align 1
LABELV $116
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $109
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $108
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $107
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 59
byte 1 0
align 1
LABELV $106
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $99
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
LABELV $98
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 34
byte 1 0
align 1
LABELV $89
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $85
byte 1 116
byte 1 0
