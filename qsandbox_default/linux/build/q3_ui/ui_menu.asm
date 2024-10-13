data
export color_translucent
align 4
LABELV color_translucent
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1045220557
code
proc MainMenu_ExitAction 0 4
file "../../../code/q3_ui/ui_menu.c"
line 104
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:MAIN MENU
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
;18:#define MODLOADER				"menu/gamemode_default"
;19:
;20:
;21:
;22:#define ID_SINGLEPLAYER			10
;23:#define ID_MULTIPLAYER			11
;24:#define ID_SETUP				12
;25:#define ID_DEMOS				13
;26:#define ID_CINEMATICS			14
;27:#define ID_TEAMARENA			15
;28:#define ID_MODS					16
;29:#define ID_EXIT					17
;30:#define ID_SKIRMISH             18
;31:#define ID_PLAYERNAME			19
;32:#define ID_MODELTYPE			20
;33:#define ID_GAMEMODEP			21
;34:#define ID_MODDB				22
;35:#define ID_MODLOADER			23
;36:#define ID_BUTTON1				24
;37:#define ID_BUTTON2				25
;38:#define ID_BUTTON3				26
;39:#define ID_MODLIST					27
;40:
;41:#define MODDB				"menu/moddb"
;42:#define M_BUTTON1			"menu/button1"
;43:#define M_BUTTON2			"menu/button2"
;44:#define M_BUTTON3			"menu/button3"
;45:#define MAIN_MENU_VERTICAL_SPACING		34
;46:
;47:#define MAIN_MENU_CENTER 200
;48:
;49:
;50:vec4_t color_translucent	= {1.0f, 1.0f, 1.0f, 0.2f};
;51:
;52:
;53:
;54:typedef struct {
;55:	menuframework_s	menu;
;56:
;57:	menutext_s		gamemodep;
;58:    menubitmap_s	modloader;
;59:	menubitmap_s	moddb;
;60:	menubitmap_s	button1;
;61:	menubitmap_s	button2;
;62:	menubitmap_s	button3;
;63:	menutext_s		singleplayer;
;64:	menutext_s      skirmish;
;65:	menutext_s		multiplayer;
;66:	menutext_s		setup;
;67:	menutext_s		demos;
;68:	menutext_s		cinematics;
;69:	menutext_s		teamArena;
;70:	menutext_s		mods;
;71:	menutext_s		exit;
;72:	menutext_s		name;
;73:	menutext_s		modeltype;
;74:	menuobject_s	modlist;
;75:	
;76:	char			names[524288];
;77:	char*			configlist[524288];
;78:
;79:#ifndef NO_UIE_MINILOGO
;80:	menubitmap_s	logo;
;81:#endif
;82:
;83:	modelAnim_t 	model;
;84:	char 			playername[MAX_NAME_LENGTH];
;85:
;86:	qhandle_t		bannerModel;
;87:} mainmenu_t;
;88:
;89:
;90:static mainmenu_t s_main;
;91:
;92:typedef struct {
;93:	menuframework_s menu;	
;94:	char errorMessage[4096];
;95:} errorMessage_t;
;96:
;97:static errorMessage_t s_errorMessage;
;98:
;99:/*
;100:=================
;101:MainMenu_ExitAction
;102:=================
;103:*/
;104:static void MainMenu_ExitAction( qboolean result ) {
line 105
;105:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $83
line 106
;106:		return;
ADDRGP4 $82
JUMPV
LABELV $83
line 108
;107:	}
;108:	UI_PopMenu();
ADDRGP4 UI_PopMenu
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
LABELV $82
endproc MainMenu_ExitAction 0 4
proc MainMenu_ReloadAction 0 8
line 117
;111:
;112:/*
;113:=================
;114:MainMenu_ReloadAction
;115:=================
;116:*/
;117:static void MainMenu_ReloadAction( qboolean result ) {
line 118
;118:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $86
line 119
;119:		return;
ADDRGP4 $85
JUMPV
LABELV $86
line 121
;120:	}
;121:trap_Cmd_ExecuteText( EXEC_APPEND, "game_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $88
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 122
;122:}
LABELV $85
endproc MainMenu_ReloadAction 0 8
proc MainMenu_LoadScript 0 0
line 130
;123:
;124:/*
;125:=================
;126:MainMenu_LoadScript
;127:=================
;128:*/
;129:static qboolean MainMenu_LoadScript( const char* filename )
;130:{
line 131
;131:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 132
;132:	MainMenu_ReloadGame();
ADDRGP4 MainMenu_ReloadGame
CALLV
pop
line 133
;133:	return qtrue;
CNSTI4 1
RETI4
LABELV $89
endproc MainMenu_LoadScript 0 0
export MainMenu_ReloadGame
proc MainMenu_ReloadGame 0 12
line 137
;134:}
;135:
;136:void MainMenu_ReloadGame( void )
;137:{
line 138
;138:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $91
line 139
;139:	UI_ConfirmMenu( "RELOAD GAME?", 0, MainMenu_ReloadAction );
ADDRGP4 $94
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 MainMenu_ReloadAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 140
;140:	}
LABELV $91
line 141
;141:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $95
line 142
;142:	UI_ConfirmMenu( "ПЕРЕЗАГРУЗИТЬ ИГРУ?", 0, MainMenu_ReloadAction );
ADDRGP4 $98
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 MainMenu_ReloadAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 143
;143:	}
LABELV $95
line 144
;144:}
LABELV $90
endproc MainMenu_ReloadGame 0 12
proc Main_SetPlayerModelType 4 4
line 152
;145:
;146:/*
;147:=================
;148:Main_SetPlayerModelType
;149:=================
;150:*/
;151:static void Main_SetPlayerModelType( void )
;152:{
line 153
;153:	if (UIE_PlayerInfo_IsTeamModel())
ADDRLP4 0
ADDRGP4 UIE_PlayerInfo_IsTeamModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $100
line 154
;154:	{
line 155
;155:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $102
line 156
;156:		s_main.modeltype.string = "Team Model";
ADDRGP4 s_main+2800+88
ADDRGP4 $107
ASGNP4
line 157
;157:		}
LABELV $102
line 158
;158:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $101
line 159
;159:		s_main.modeltype.string = "Командная Модель";
ADDRGP4 s_main+2800+88
ADDRGP4 $113
ASGNP4
line 160
;160:		}
line 161
;161:	}
ADDRGP4 $101
JUMPV
LABELV $100
line 163
;162:	else
;163:	{
line 164
;164:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $114
line 165
;165:		s_main.modeltype.string = "DM Model";
ADDRGP4 s_main+2800+88
ADDRGP4 $119
ASGNP4
line 166
;166:		}
LABELV $114
line 167
;167:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $120
line 168
;168:		s_main.modeltype.string = "Обычная Модель";
ADDRGP4 s_main+2800+88
ADDRGP4 $125
ASGNP4
line 169
;169:		}
LABELV $120
line 170
;170:	}
LABELV $101
line 172
;171:
;172:	PText_Init(&s_main.modeltype);
ADDRGP4 s_main+2800
ARGP4
ADDRGP4 PText_Init
CALLV
pop
line 173
;173:}
LABELV $99
endproc Main_SetPlayerModelType 4 4
proc Main_ToggleModelType 8 8
line 183
;174:
;175:
;176:
;177:/*
;178:=================
;179:Main_ToggleModelType
;180:=================
;181:*/
;182:static void Main_ToggleModelType( void )
;183:{
line 186
;184:	qboolean type;
;185:
;186:	if (UIE_PlayerInfo_IsTeamModel()) {
ADDRLP4 4
ADDRGP4 UIE_PlayerInfo_IsTeamModel
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $128
line 187
;187:		type = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 188
;188:	}
ADDRGP4 $129
JUMPV
LABELV $128
line 189
;189:	else {
line 190
;190:		type = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 191
;191:	}
LABELV $129
line 193
;192:
;193:	UIE_PlayerInfo_DrawTeamModel(&s_main.model, type);
ADDRGP4 s_main+2624916
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UIE_PlayerInfo_DrawTeamModel
CALLV
pop
line 194
;194:	Main_SetPlayerModelType();
ADDRGP4 Main_SetPlayerModelType
CALLV
pop
line 195
;195:}
LABELV $127
endproc Main_ToggleModelType 8 8
export Main_MenuEvent
proc Main_MenuEvent 12 8
line 204
;196:
;197:
;198:
;199:/*
;200:=================
;201:Main_MenuEvent
;202:=================
;203:*/
;204:void Main_MenuEvent (void* ptr, int event) {
line 205
;205:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $132
line 206
;206:		return;
ADDRGP4 $131
JUMPV
LABELV $132
line 209
;207:	}
;208:
;209:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $134
ADDRLP4 0
INDIRI4
CNSTI4 27
GTI4 $134
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $176-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $176
address $137
address $143
address $147
address $148
address $135
address $151
address $150
address $161
address $142
address $155
address $156
address $157
address $159
address $158
address $162
address $167
address $168
address $170
code
LABELV $137
line 211
;210:	case ID_SINGLEPLAYER:
;211:        if(ui_singlemode.integer){
ADDRGP4 ui_singlemode+12
INDIRI4
CNSTI4 0
EQI4 $138
line 212
;212:            trap_Cmd_ExecuteText( EXEC_APPEND, "execscript new_game.as;" );
CNSTI4 2
ARGI4
ADDRGP4 $141
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 213
;213:        }
LABELV $138
line 214
;214:		UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 215
;215:		break;
ADDRGP4 $135
JUMPV
LABELV $142
line 218
;216:
;217:    case ID_SKIRMISH:
;218:        UI_StartServerMenu(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 219
;219:        break;
ADDRGP4 $135
JUMPV
LABELV $143
line 222
;220:
;221:	case ID_MULTIPLAYER:
;222:		if(!ui_singlemode.integer){
ADDRGP4 ui_singlemode+12
INDIRI4
CNSTI4 0
NEI4 $144
line 223
;223:		UI_ArenaServersMenu();
ADDRGP4 UI_ArenaServersMenu
CALLV
pop
line 224
;224:		} else {
ADDRGP4 $135
JUMPV
LABELV $144
line 225
;225:		UI_CinematicsMenu(1);	
CNSTI4 1
ARGI4
ADDRGP4 UI_CinematicsMenu
CALLV
pop
line 226
;226:		}
line 227
;227:		break;
ADDRGP4 $135
JUMPV
LABELV $147
line 230
;228:
;229:	case ID_SETUP:
;230:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 231
;231:		break;
ADDRGP4 $135
JUMPV
LABELV $148
line 234
;232:
;233:	case ID_DEMOS:
;234:		UI_DemosMenu();
ADDRGP4 UI_DemosMenu
CALLV
pop
line 235
;235:		break;
ADDRGP4 $135
JUMPV
line 239
;236:
;237:	case ID_CINEMATICS:
;238:		//UI_CinematicsMenu();
;239:		break;
LABELV $150
line 242
;240:
;241:	case ID_MODS:
;242:		UI_ModsMenu();
ADDRGP4 UI_ModsMenu
CALLV
pop
line 243
;243:		break;
ADDRGP4 $135
JUMPV
LABELV $151
line 246
;244:
;245:	case ID_TEAMARENA:
;246:		trap_Cvar_Set( "fs_game", "missionpack");
ADDRGP4 $152
ARGP4
ADDRGP4 $153
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 247
;247:		trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $154
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 248
;248:		break;
ADDRGP4 $135
JUMPV
LABELV $155
line 251
;249:
;250:	case ID_PLAYERNAME:
;251:		UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 252
;252:		break;	
ADDRGP4 $135
JUMPV
LABELV $156
line 255
;253:
;254:	case ID_MODELTYPE:
;255:		Main_ToggleModelType();
ADDRGP4 Main_ToggleModelType
CALLV
pop
line 256
;256:		break;
ADDRGP4 $135
JUMPV
LABELV $157
line 259
;257:		
;258:	case ID_GAMEMODEP:
;259:		UI_WorkshopMenu();
ADDRGP4 UI_WorkshopMenu
CALLV
pop
line 260
;260:		break;
ADDRGP4 $135
JUMPV
LABELV $158
line 263
;261:		
;262:	case ID_MODLOADER:
;263:		StartServer_ServerPage_Mods();
ADDRGP4 StartServer_ServerPage_Mods
CALLI4
pop
line 264
;264:		break;
ADDRGP4 $135
JUMPV
LABELV $159
line 267
;265:		
;266:	case ID_MODDB:
;267:		trap_System("start https://www.moddb.com/games/qs");
ADDRGP4 $160
ARGP4
ADDRGP4 trap_System
CALLI4
pop
line 268
;268:		break;
ADDRGP4 $135
JUMPV
LABELV $161
line 271
;269:
;270:	case ID_EXIT:
;271:		UI_CreditMenu(0);
CNSTI4 0
ARGI4
ADDRGP4 UI_CreditMenu
CALLV
pop
line 272
;272:		break;
ADDRGP4 $135
JUMPV
LABELV $162
line 274
;273:	case ID_BUTTON1:
;274:		trap_Cmd_ExecuteText( EXEC_APPEND, "toggle r_fullscreen;" );
CNSTI4 2
ARGI4
ADDRGP4 $163
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 275
;275:		trap_Cmd_ExecuteText( EXEC_APPEND, "set vid_xpos 0;" );
CNSTI4 2
ARGI4
ADDRGP4 $164
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 276
;276:		trap_Cmd_ExecuteText( EXEC_APPEND, "set vid_ypos 0;" );
CNSTI4 2
ARGI4
ADDRGP4 $165
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 277
;277:		trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $154
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 278
;278:		trap_Cmd_ExecuteText( EXEC_APPEND, "minimize;" );
CNSTI4 2
ARGI4
ADDRGP4 $166
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 279
;279:		break;
ADDRGP4 $135
JUMPV
LABELV $167
line 281
;280:	case ID_BUTTON2:
;281:		trap_Cmd_ExecuteText( EXEC_APPEND, "toggle r_fullscreen;" );
CNSTI4 2
ARGI4
ADDRGP4 $163
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 282
;282:		trap_Cmd_ExecuteText( EXEC_APPEND, "set vid_xpos 0;" );
CNSTI4 2
ARGI4
ADDRGP4 $164
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 283
;283:		trap_Cmd_ExecuteText( EXEC_APPEND, "set vid_ypos 0;" );
CNSTI4 2
ARGI4
ADDRGP4 $165
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 284
;284:		trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $154
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 285
;285:		break;
ADDRGP4 $135
JUMPV
LABELV $168
line 287
;286:	case ID_BUTTON3:
;287:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit;" );
CNSTI4 2
ARGI4
ADDRGP4 $169
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 288
;288:		break;
ADDRGP4 $135
JUMPV
LABELV $170
line 290
;289:	case ID_MODLIST:
;290:		trap_Cmd_ExecuteText( EXEC_INSERT, va("mgui %s\n", s_main.modlist.itemnames[s_main.modlist.curvalue]) );
ADDRGP4 $171
ARGP4
ADDRGP4 s_main+2904+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_main+2904+428
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 291
;291:		break;
LABELV $134
LABELV $135
line 293
;292:	}
;293:}
LABELV $131
endproc Main_MenuEvent 12 8
export MainMenu_Cache
proc MainMenu_Cache 0 4
line 301
;294:
;295:
;296:/*
;297:===============
;298:MainMenu_Cache
;299:===============
;300:*/
;301:void MainMenu_Cache( void ) {
line 302
;302:	trap_R_RegisterShaderNoMip( MODLOADER );
ADDRGP4 $179
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 303
;303:	trap_R_RegisterShaderNoMip( MODDB );
ADDRGP4 $180
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 304
;304:	trap_R_RegisterShaderNoMip( M_BUTTON1 );
ADDRGP4 $181
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 305
;305:	trap_R_RegisterShaderNoMip( M_BUTTON2 );
ADDRGP4 $182
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 306
;306:	trap_R_RegisterShaderNoMip( M_BUTTON3 );
ADDRGP4 $183
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 307
;307:}
LABELV $178
endproc MainMenu_Cache 0 4
export ErrorMessage_Key
proc ErrorMessage_Key 0 8
line 310
;308:
;309:sfxHandle_t ErrorMessage_Key(int key)
;310:{
line 311
;311:	trap_Cvar_Set( "com_errorMessage", "" );
ADDRGP4 $185
ARGP4
ADDRGP4 $186
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 312
;312:	UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 313
;313:	return (menu_null_sound);
ADDRGP4 menu_null_sound
INDIRI4
RETI4
LABELV $184
endproc ErrorMessage_Key 0 8
lit
align 4
LABELV $188
byte 4 1062836634
byte 4 1063675494
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $189
byte 4 0
byte 4 0
byte 4 0
byte 4 1053609165
code
proc Main_MenuDraw 72 28
line 323
;314:}
;315:
;316:/*
;317:===============
;318:Main_MenuDraw
;319:TTimo: this function is common to the main menu and errorMessage menu
;320:===============
;321:*/
;322:
;323:static void Main_MenuDraw( void ) {
line 324
;324:	vec4_t			color = {0.85, 0.9, 1.0, 1};
ADDRLP4 0
ADDRGP4 $188
INDIRB
ASGNB 16
line 326
;325:	char 			buffer[MAX_NAME_LENGTH];
;326:	vec4_t			modlistcolor = {0.00f, 0.00f, 0.00f, 0.40f};
ADDRLP4 48
ADDRGP4 $189
INDIRB
ASGNB 16
line 328
;327:
;328:	if (strlen(s_errorMessage.errorMessage))
ADDRGP4 s_errorMessage+1076
ARGP4
ADDRLP4 64
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $190
line 329
;329:	{
line 330
;330:		UI_DrawProportionalString_AutoWrapped( 320, 192, 600, 20, s_errorMessage.errorMessage, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
CNSTI4 600
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 s_errorMessage+1076
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString_AutoWrapped
CALLV
pop
line 331
;331:	}
ADDRGP4 $191
JUMPV
LABELV $190
line 333
;332:	else
;333:	{
line 336
;334:      // change the players name if different to control
;335:   
;336:	   trap_Cvar_VariableStringBuffer( "name", buffer, MAX_NAME_LENGTH);
ADDRGP4 $194
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 337
;337:	   Q_CleanStr(buffer);
ADDRLP4 16
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 338
;338:	   if (strcmp(s_main.playername, buffer)) {
ADDRGP4 s_main+2627180
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 68
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $195
line 339
;339:		   strcpy(s_main.playername, buffer);
ADDRGP4 s_main+2627180
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 340
;340:		   PText_Init(&s_main.name);
ADDRGP4 s_main+2696
ARGP4
ADDRGP4 PText_Init
CALLV
pop
line 341
;341:	   }
LABELV $195
line 344
;342:   
;343:	   // update type of model displayed
;344:	   if (uis.firstdraw)
ADDRGP4 uis+11496
INDIRI4
CNSTI4 0
EQI4 $200
line 345
;345:		   Main_SetPlayerModelType();
ADDRGP4 Main_SetPlayerModelType
CALLV
pop
LABELV $200
line 347
;346:	   
;347:	   UI_DrawRoundedRect(317+uis.wideoffset, 30, 1000000, 20*SMALLCHAR_HEIGHT*1.25, 10, modlistcolor);
ADDRGP4 uis+11476
INDIRI4
CNSTI4 317
ADDI4
CVIF4 4
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1232348160
ARGF4
CNSTF4 1067450368
CNSTI4 20
ADDRGP4 cl_smallcharheight+12
INDIRI4
MULI4
CVIF4 4
MULF4
ARGF4
CNSTF4 1092616192
ARGF4
ADDRLP4 48
ARGP4
ADDRGP4 UI_DrawRoundedRect
CALLV
pop
line 349
;348:	   // standard menu drawing
;349:	   Menu_Draw( &s_main.menu );
ADDRGP4 s_main
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 350
;350:   }
LABELV $191
line 351
;351:	UI_DrawString( 600+uis.wideoffset, 450, "Quake Sandbox v6.1", UI_RIGHT|UI_SMALLFONT, color );
ADDRGP4 uis+11476
INDIRI4
CNSTI4 600
ADDI4
ARGI4
CNSTI4 450
ARGI4
ADDRGP4 $206
ARGP4
CNSTI4 18
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 352
;352:	UI_DrawString( 600+uis.wideoffset, 465, "by Noire.dev", UI_RIGHT|UI_SMALLFONT, color );
ADDRGP4 uis+11476
INDIRI4
CNSTI4 600
ADDI4
ARGI4
CNSTI4 465
ARGI4
ADDRGP4 $208
ARGP4
CNSTI4 18
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 353
;353:}
LABELV $187
endproc Main_MenuDraw 72 28
proc Main_DrawPlayer 0 4
line 362
;354:
;355:
;356:/*
;357:=================
;358:Main_DrawPlayer
;359:=================
;360:*/
;361:static void Main_DrawPlayer( void *self )
;362:{
line 363
;363:	UIE_PlayerInfo_AnimateModel(&s_main.model);
ADDRGP4 s_main+2624916
ARGP4
ADDRGP4 UIE_PlayerInfo_AnimateModel
CALLV
pop
line 364
;364:}
LABELV $209
endproc Main_DrawPlayer 0 4
proc UI_TeamArenaExists 2084 16
line 374
;365:
;366:
;367:
;368:
;369:/*
;370:===============
;371:UI_TeamArenaExists
;372:===============
;373:*/
;374:static qboolean UI_TeamArenaExists( void ) {
line 382
;375:	int		numdirs;
;376:	char	dirlist[2048];
;377:	char	*dirptr;
;378:  char  *descptr;
;379:	int		i;
;380:	int		dirlen;
;381:
;382:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $212
ARGP4
ADDRGP4 $186
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2068
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2068
INDIRI4
ASGNI4
line 383
;383:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 384
;384:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $216
JUMPV
LABELV $213
line 385
;385:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 386
;386:    descptr = dirptr + dirlen;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 387
;387:		if (Q_stricmp(dirptr, "missionpack") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $217
line 388
;388:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $211
JUMPV
LABELV $217
line 390
;389:		}
;390:	dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRLP4 2080
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 391
;391:	}
LABELV $214
line 384
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $216
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $213
line 392
;392:	return qfalse;
CNSTI4 0
RETI4
LABELV $211
endproc UI_TeamArenaExists 2084 16
export UI_MainMenu
proc UI_MainMenu 48 16
line 405
;393:}
;394:
;395:
;396:/*
;397:===============
;398:UI_MainMenu
;399:
;400:The main menu only comes up when not in a game,
;401:so make sure that the attract loop server is down
;402:and that local cinematics are killed
;403:===============
;404:*/
;405:void UI_MainMenu( void ) {
line 407
;406:	int		y;
;407:	qboolean teamArena = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 416
;408:	int		style;
;409:	float	sizeScale;
;410:	int		i;
;411:	int		len;
;412:	char	*configname;
;413:
;414:	//trap_Cvar_Set( "sv_killserver", "1" );
;415:
;416:	memset( &s_main, 0 ,sizeof(mainmenu_t) );
ADDRGP4 s_main
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2627216
ARGI4
ADDRGP4 memset
CALLP4
pop
line 417
;417:	memset( &s_errorMessage, 0 ,sizeof(errorMessage_t) );
ADDRGP4 s_errorMessage
ARGP4
CNSTI4 0
ARGI4
CNSTI4 5172
ARGI4
ADDRGP4 memset
CALLP4
pop
line 420
;418:
;419:	// com_errorMessage would need that too
;420:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 422
;421:	
;422:	trap_Cvar_VariableStringBuffer( "com_errorMessage", s_errorMessage.errorMessage, sizeof(s_errorMessage.errorMessage) );
ADDRGP4 $185
ARGP4
ADDRGP4 s_errorMessage+1076
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 423
;423:	if (strlen(s_errorMessage.errorMessage))
ADDRGP4 s_errorMessage+1076
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $222
line 424
;424:	{	
line 425
;425:		s_errorMessage.menu.draw = Main_MenuDraw;
ADDRGP4 s_errorMessage+1036
ADDRGP4 Main_MenuDraw
ASGNP4
line 426
;426:		s_errorMessage.menu.key = ErrorMessage_Key;
ADDRGP4 s_errorMessage+1040
ADDRGP4 ErrorMessage_Key
ASGNP4
line 427
;427:		s_errorMessage.menu.fullscreen = qtrue;
ADDRGP4 s_errorMessage+1052
CNSTI4 1
ASGNI4
line 428
;428:		s_errorMessage.menu.wrapAround = qtrue;
ADDRGP4 s_errorMessage+1044
CNSTI4 1
ASGNI4
line 429
;429:		s_errorMessage.menu.showlogo = qtrue;		
ADDRGP4 s_errorMessage+1072
CNSTI4 1
ASGNI4
line 431
;430:
;431:		trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 432
;432:		uis.menusp = 0;
ADDRGP4 uis+20
CNSTI4 0
ASGNI4
line 433
;433:		UI_PushMenu ( &s_errorMessage.menu );
ADDRGP4 s_errorMessage
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 435
;434:		
;435:		return;
ADDRGP4 $219
JUMPV
LABELV $222
line 438
;436:	}
;437:
;438:	sizeScale = UI_ProportionalSizeScale( UI_SMALLFONT, 0 );
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 32
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 32
INDIRF4
ASGNF4
line 439
;439:	style = UI_CENTER | UI_DROPSHADOW;
ADDRLP4 16
CNSTI4 2049
ASGNI4
line 441
;440:
;441:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 443
;442:
;443:	s_main.menu.draw = Main_MenuDraw;
ADDRGP4 s_main+1036
ADDRGP4 Main_MenuDraw
ASGNP4
line 444
;444:	s_main.menu.fullscreen = qtrue;
ADDRGP4 s_main+1052
CNSTI4 1
ASGNI4
line 445
;445:	s_main.menu.wrapAround = qtrue;
ADDRGP4 s_main+1044
CNSTI4 1
ASGNI4
line 446
;446:	s_main.menu.showlogo = qtrue;
ADDRGP4 s_main+1072
CNSTI4 1
ASGNI4
line 447
;447:	s_main.menu.native = qfalse;
ADDRGP4 s_main+1056
CNSTI4 0
ASGNI4
line 449
;448:
;449:	s_main.modloader.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_main+1180
CNSTI4 6
ASGNI4
line 450
;450:	s_main.modloader.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+1180+72
CNSTU4 264
ASGNU4
line 451
;451:	s_main.modloader.generic.id			= ID_MODLOADER;
ADDRGP4 s_main+1180+24
CNSTI4 23
ASGNI4
line 452
;452:	s_main.modloader.generic.callback	= Main_MenuEvent;
ADDRGP4 s_main+1180+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 453
;453:	s_main.modloader.generic.x			= 440 + uis.wideoffset;
ADDRGP4 s_main+1180+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 440
ADDI4
ASGNI4
line 454
;454:	s_main.modloader.generic.y			= 365;
ADDRGP4 s_main+1180+32
CNSTI4 365
ASGNI4
line 455
;455:	s_main.modloader.width				= 256*0.90;
ADDRGP4 s_main+1180+104
CNSTI4 230
ASGNI4
line 456
;456:	s_main.modloader.height				= 38*0.80;
ADDRGP4 s_main+1180+108
CNSTI4 30
ASGNI4
line 458
;457:	
;458:	s_main.moddb.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_main+1296
CNSTI4 6
ASGNI4
line 459
;459:	s_main.moddb.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+1296+72
CNSTU4 264
ASGNU4
line 460
;460:	s_main.moddb.generic.id			= ID_MODDB;
ADDRGP4 s_main+1296+24
CNSTI4 22
ASGNI4
line 461
;461:	s_main.moddb.generic.callback	= Main_MenuEvent;
ADDRGP4 s_main+1296+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 462
;462:	s_main.moddb.generic.x			= 460 + uis.wideoffset;
ADDRGP4 s_main+1296+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 460
ADDI4
ASGNI4
line 463
;463:	s_main.moddb.generic.y			= 365 + 38*0.80 + 15;
ADDRGP4 s_main+1296+32
CNSTI4 410
ASGNI4
line 464
;464:	s_main.moddb.width				= 256*0.90;
ADDRGP4 s_main+1296+104
CNSTI4 230
ASGNI4
line 465
;465:	s_main.moddb.height				= 38*0.80;
ADDRGP4 s_main+1296+108
CNSTI4 30
ASGNI4
line 467
;466:	
;467:	s_main.button1.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_main+1412
CNSTI4 6
ASGNI4
line 468
;468:	s_main.button1.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+1412+72
CNSTU4 264
ASGNU4
line 469
;469:	s_main.button1.generic.id			= ID_BUTTON1;
ADDRGP4 s_main+1412+24
CNSTI4 24
ASGNI4
line 470
;470:	s_main.button1.generic.callback		= Main_MenuEvent;
ADDRGP4 s_main+1412+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 471
;471:	s_main.button1.generic.x			= 577 + uis.wideoffset;
ADDRGP4 s_main+1412+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 577
ADDI4
ASGNI4
line 472
;472:	s_main.button1.generic.y			= 5;
ADDRGP4 s_main+1412+32
CNSTI4 5
ASGNI4
line 473
;473:	s_main.button1.width				= 24;
ADDRGP4 s_main+1412+104
CNSTI4 24
ASGNI4
line 474
;474:	s_main.button1.height				= 12;
ADDRGP4 s_main+1412+108
CNSTI4 12
ASGNI4
line 476
;475:	
;476:	s_main.button2.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_main+1528
CNSTI4 6
ASGNI4
line 477
;477:	s_main.button2.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+1528+72
CNSTU4 264
ASGNU4
line 478
;478:	s_main.button2.generic.id			= ID_BUTTON2;
ADDRGP4 s_main+1528+24
CNSTI4 25
ASGNI4
line 479
;479:	s_main.button2.generic.callback		= Main_MenuEvent;
ADDRGP4 s_main+1528+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 480
;480:	s_main.button2.generic.x			= 601 + uis.wideoffset;
ADDRGP4 s_main+1528+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 601
ADDI4
ASGNI4
line 481
;481:	s_main.button2.generic.y			= 5;
ADDRGP4 s_main+1528+32
CNSTI4 5
ASGNI4
line 482
;482:	s_main.button2.width				= 24;
ADDRGP4 s_main+1528+104
CNSTI4 24
ASGNI4
line 483
;483:	s_main.button2.height				= 12;
ADDRGP4 s_main+1528+108
CNSTI4 12
ASGNI4
line 485
;484:	
;485:	s_main.button3.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_main+1644
CNSTI4 6
ASGNI4
line 486
;486:	s_main.button3.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+1644+72
CNSTU4 264
ASGNU4
line 487
;487:	s_main.button3.generic.id			= ID_BUTTON3;
ADDRGP4 s_main+1644+24
CNSTI4 26
ASGNI4
line 488
;488:	s_main.button3.generic.callback		= Main_MenuEvent;
ADDRGP4 s_main+1644+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 489
;489:	s_main.button3.generic.x			= 625 + uis.wideoffset;
ADDRGP4 s_main+1644+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 625
ADDI4
ASGNI4
line 490
;490:	s_main.button3.generic.y			= 5;
ADDRGP4 s_main+1644+32
CNSTI4 5
ASGNI4
line 491
;491:	s_main.button3.width				= 24;
ADDRGP4 s_main+1644+104
CNSTI4 24
ASGNI4
line 492
;492:	s_main.button3.height				= 12;
ADDRGP4 s_main+1644+108
CNSTI4 12
ASGNI4
line 494
;493:
;494:	y = 143;
ADDRLP4 12
CNSTI4 143
ASGNI4
line 495
;495:	s_main.singleplayer.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_main+1760
CNSTI4 9
ASGNI4
line 496
;496:	s_main.singleplayer.generic.flags		= QMF_LEFT_JUSTIFY|QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 s_main+1760+72
CNSTU4 132
ASGNU4
line 497
;497:	s_main.singleplayer.generic.id			= ID_SINGLEPLAYER;
ADDRGP4 s_main+1760+24
CNSTI4 10
ASGNI4
line 498
;498:	s_main.singleplayer.generic.callback	= Main_MenuEvent;
ADDRGP4 s_main+1760+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 499
;499:	s_main.singleplayer.generic.x			= 64 - uis.wideoffset;
ADDRGP4 s_main+1760+28
CNSTI4 64
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 500
;500:	s_main.singleplayer.generic.y			= y;
ADDRGP4 s_main+1760+32
ADDRLP4 12
INDIRI4
ASGNI4
line 501
;501:	s_main.singleplayer.color				= color_white;
ADDRGP4 s_main+1760+100
ADDRGP4 color_white
ASGNP4
line 502
;502:	s_main.singleplayer.style		    	= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_main+1760+92
CNSTI4 16
ASGNI4
line 504
;503:	
;504:	y += 18;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 505
;505:	s_main.multiplayer.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_main+1968
CNSTI4 9
ASGNI4
line 506
;506:	s_main.multiplayer.generic.flags		= QMF_LEFT_JUSTIFY|QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 s_main+1968+72
CNSTU4 132
ASGNU4
line 507
;507:	s_main.multiplayer.generic.id			= ID_MULTIPLAYER;
ADDRGP4 s_main+1968+24
CNSTI4 11
ASGNI4
line 508
;508:	s_main.multiplayer.generic.callback	= Main_MenuEvent;
ADDRGP4 s_main+1968+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 509
;509:	s_main.multiplayer.generic.x			= 64 - uis.wideoffset;
ADDRGP4 s_main+1968+28
CNSTI4 64
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 510
;510:	s_main.multiplayer.generic.y			= y;
ADDRGP4 s_main+1968+32
ADDRLP4 12
INDIRI4
ASGNI4
line 511
;511:	s_main.multiplayer.color				= color_white;
ADDRGP4 s_main+1968+100
ADDRGP4 color_white
ASGNP4
line 512
;512:	s_main.multiplayer.style		    	= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_main+1968+92
CNSTI4 16
ASGNI4
line 514
;513:	
;514:	y += 35;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 35
ADDI4
ASGNI4
line 515
;515:	s_main.gamemodep.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_main+1076
CNSTI4 9
ASGNI4
line 516
;516:	s_main.gamemodep.generic.flags		= QMF_LEFT_JUSTIFY|QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 s_main+1076+72
CNSTU4 132
ASGNU4
line 517
;517:	s_main.gamemodep.generic.id			= ID_GAMEMODEP;
ADDRGP4 s_main+1076+24
CNSTI4 21
ASGNI4
line 518
;518:	s_main.gamemodep.generic.callback	= Main_MenuEvent;
ADDRGP4 s_main+1076+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 519
;519:	s_main.gamemodep.generic.x			= 64 - uis.wideoffset;
ADDRGP4 s_main+1076+28
CNSTI4 64
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 520
;520:	s_main.gamemodep.generic.y			= y;
ADDRGP4 s_main+1076+32
ADDRLP4 12
INDIRI4
ASGNI4
line 521
;521:	s_main.gamemodep.color				= color_white;
ADDRGP4 s_main+1076+100
ADDRGP4 color_white
ASGNP4
line 522
;522:	s_main.gamemodep.style		    	= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_main+1076+92
CNSTI4 16
ASGNI4
line 524
;523:
;524:	y += 19;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 525
;525:	s_main.name.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+2696
CNSTI4 9
ASGNI4
line 526
;526:	s_main.name.generic.flags			= QMF_LEFT_JUSTIFY|QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 s_main+2696+72
CNSTU4 132
ASGNU4
line 527
;527:	s_main.name.generic.x				= 64 - uis.wideoffset;
ADDRGP4 s_main+2696+28
CNSTI4 64
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 528
;528:	s_main.name.generic.y				= y;
ADDRGP4 s_main+2696+32
ADDRLP4 12
INDIRI4
ASGNI4
line 529
;529:	s_main.name.generic.id				= ID_PLAYERNAME;
ADDRGP4 s_main+2696+24
CNSTI4 19
ASGNI4
line 530
;530:	s_main.name.generic.callback		= Main_MenuEvent;
ADDRGP4 s_main+2696+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 531
;531:	s_main.name.color					= color_white;
ADDRGP4 s_main+2696+100
ADDRGP4 color_white
ASGNP4
line 532
;532:	s_main.name.style					= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_main+2696+92
CNSTI4 16
ASGNI4
line 534
;533:	
;534:	y += 19;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 535
;535:	s_main.mods.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_main+2488
CNSTI4 9
ASGNI4
line 536
;536:	s_main.mods.generic.flags		= QMF_LEFT_JUSTIFY|QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 s_main+2488+72
CNSTU4 132
ASGNU4
line 537
;537:	s_main.mods.generic.id			= ID_MODS;
ADDRGP4 s_main+2488+24
CNSTI4 16
ASGNI4
line 538
;538:	s_main.mods.generic.callback	= Main_MenuEvent;
ADDRGP4 s_main+2488+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 539
;539:	s_main.mods.generic.x			= 64 - uis.wideoffset;
ADDRGP4 s_main+2488+28
CNSTI4 64
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 540
;540:	s_main.mods.generic.y			= y;
ADDRGP4 s_main+2488+32
ADDRLP4 12
INDIRI4
ASGNI4
line 541
;541:	s_main.mods.color				= color_white;
ADDRGP4 s_main+2488+100
ADDRGP4 color_white
ASGNP4
line 542
;542:	s_main.mods.style		    	= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_main+2488+92
CNSTI4 16
ASGNI4
line 544
;543:	
;544:	y += 19;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 19
ADDI4
ASGNI4
line 545
;545:	s_main.demos.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_main+2176
CNSTI4 9
ASGNI4
line 546
;546:	s_main.demos.generic.flags		= QMF_LEFT_JUSTIFY|QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 s_main+2176+72
CNSTU4 132
ASGNU4
line 547
;547:	s_main.demos.generic.id			= ID_DEMOS;
ADDRGP4 s_main+2176+24
CNSTI4 13
ASGNI4
line 548
;548:	s_main.demos.generic.callback	= Main_MenuEvent;
ADDRGP4 s_main+2176+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 549
;549:	s_main.demos.generic.x			= 64 - uis.wideoffset;
ADDRGP4 s_main+2176+28
CNSTI4 64
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 550
;550:	s_main.demos.generic.y			= y;
ADDRGP4 s_main+2176+32
ADDRLP4 12
INDIRI4
ASGNI4
line 551
;551:	s_main.demos.color				= color_white;
ADDRGP4 s_main+2176+100
ADDRGP4 color_white
ASGNP4
line 552
;552:	s_main.demos.style		    	= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_main+2176+92
CNSTI4 16
ASGNI4
line 554
;553:	
;554:	y += 36;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 36
ADDI4
ASGNI4
line 555
;555:	s_main.setup.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_main+2072
CNSTI4 9
ASGNI4
line 556
;556:	s_main.setup.generic.flags		= QMF_LEFT_JUSTIFY|QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 s_main+2072+72
CNSTU4 132
ASGNU4
line 557
;557:	s_main.setup.generic.id			= ID_SETUP;
ADDRGP4 s_main+2072+24
CNSTI4 12
ASGNI4
line 558
;558:	s_main.setup.generic.callback	= Main_MenuEvent;
ADDRGP4 s_main+2072+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 559
;559:	s_main.setup.generic.x			= 64 - uis.wideoffset;
ADDRGP4 s_main+2072+28
CNSTI4 64
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 560
;560:	s_main.setup.generic.y			= y;
ADDRGP4 s_main+2072+32
ADDRLP4 12
INDIRI4
ASGNI4
line 561
;561:	s_main.setup.color				= color_white;
ADDRGP4 s_main+2072+100
ADDRGP4 color_white
ASGNP4
line 562
;562:	s_main.setup.style		    	= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_main+2072+92
CNSTI4 16
ASGNI4
line 564
;563:	
;564:	y += 36;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 36
ADDI4
ASGNI4
line 565
;565:	s_main.exit.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_main+2592
CNSTI4 9
ASGNI4
line 566
;566:	s_main.exit.generic.flags		= QMF_LEFT_JUSTIFY|QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 s_main+2592+72
CNSTU4 132
ASGNU4
line 567
;567:	s_main.exit.generic.id			= ID_EXIT;
ADDRGP4 s_main+2592+24
CNSTI4 17
ASGNI4
line 568
;568:	s_main.exit.generic.callback	= Main_MenuEvent;
ADDRGP4 s_main+2592+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 569
;569:	s_main.exit.generic.x			= 64 - uis.wideoffset;
ADDRGP4 s_main+2592+28
CNSTI4 64
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 570
;570:	s_main.exit.generic.y			= y;
ADDRGP4 s_main+2592+32
ADDRLP4 12
INDIRI4
ASGNI4
line 571
;571:	s_main.exit.color				= color_white;
ADDRGP4 s_main+2592+100
ADDRGP4 color_white
ASGNP4
line 572
;572:	s_main.exit.style		    	= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_main+2592+92
CNSTI4 16
ASGNI4
line 574
;573:
;574:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 576
;575:
;576:	s_main.modeltype.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+2800
CNSTI4 9
ASGNI4
line 577
;577:	s_main.modeltype.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+2800+72
CNSTU4 264
ASGNU4
line 578
;578:	s_main.modeltype.generic.x				= 480;
ADDRGP4 s_main+2800+28
CNSTI4 480
ASGNI4
line 579
;579:	s_main.modeltype.generic.y				= PLAYERMODEL_TEXTHEIGHT + (PROP_HEIGHT*sizeScale);
ADDRGP4 s_main+2800+32
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
CNSTF4 1135378432
ADDF4
CVFI4 4
ASGNI4
line 580
;580:	s_main.modeltype.generic.id				= ID_MODELTYPE;
ADDRGP4 s_main+2800+24
CNSTI4 20
ASGNI4
line 581
;581:	s_main.modeltype.generic.callback		= Main_MenuEvent;
ADDRGP4 s_main+2800+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 582
;582:	s_main.modeltype.string					= "";
ADDRGP4 s_main+2800+88
ADDRGP4 $186
ASGNP4
line 583
;583:	s_main.modeltype.color					= text_color_normal;
ADDRGP4 s_main+2800+100
ADDRGP4 text_color_normal
ASGNP4
line 584
;584:	s_main.modeltype.style					= style|UI_SMALLFONT;
ADDRGP4 s_main+2800+92
ADDRLP4 16
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 586
;585:
;586:	s_main.model.bitmap.generic.type      = MTYPE_BITMAP;
ADDRGP4 s_main+2624916+1524
CNSTI4 6
ASGNI4
line 587
;587:	s_main.model.bitmap.generic.flags     = QMF_INACTIVE;
ADDRGP4 s_main+2624916+1524+72
CNSTU4 16384
ASGNU4
line 588
;588:	s_main.model.bitmap.generic.ownerdraw = Main_DrawPlayer;
ADDRGP4 s_main+2624916+1524+84
ADDRGP4 Main_DrawPlayer
ASGNP4
line 589
;589:	s_main.model.bitmap.generic.x	        = PLAYERMODEL_X;
ADDRGP4 s_main+2624916+1524+28
CNSTI4 360
ASGNI4
line 590
;590:	s_main.model.bitmap.generic.y	        = PLAYERMODEL_Y;
ADDRGP4 s_main+2624916+1524+32
CNSTI4 -65
ASGNI4
line 591
;591:	s_main.model.bitmap.width	            = PLAYERMODEL_WIDTH;
ADDRGP4 s_main+2624916+1524+104
CNSTI4 320
ASGNI4
line 592
;592:	s_main.model.bitmap.height            = PLAYERMODEL_HEIGHT;
ADDRGP4 s_main+2624916+1524+108
CNSTI4 560
ASGNI4
line 594
;593:	
;594:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $482
line 595
;595:    s_main.singleplayer.string			= "Start New Game";
ADDRGP4 s_main+1760+88
ADDRGP4 $487
ASGNP4
line 596
;596:	if(!ui_singlemode.integer){
ADDRGP4 ui_singlemode+12
INDIRI4
CNSTI4 0
NEI4 $488
line 597
;597:    s_main.multiplayer.string			= "Find Multiplayer Game";
ADDRGP4 s_main+1968+88
ADDRGP4 $493
ASGNP4
line 598
;598:	} else {
ADDRGP4 $489
JUMPV
LABELV $488
line 599
;599:	s_main.multiplayer.string			= "Load Singleplayer Game";
ADDRGP4 s_main+1968+88
ADDRGP4 $496
ASGNP4
line 600
;600:	}
LABELV $489
line 601
;601:    s_main.gamemodep.string			    = "Workshop";
ADDRGP4 s_main+1076+88
ADDRGP4 $499
ASGNP4
line 602
;602:	s_main.name.string					= "Profile";
ADDRGP4 s_main+2696+88
ADDRGP4 $502
ASGNP4
line 603
;603:    s_main.mods.string			   	 	= "Mods";
ADDRGP4 s_main+2488+88
ADDRGP4 $505
ASGNP4
line 604
;604:    s_main.demos.string			    	= "Demos";
ADDRGP4 s_main+2176+88
ADDRGP4 $508
ASGNP4
line 605
;605:    s_main.setup.string			    	= "Options";
ADDRGP4 s_main+2072+88
ADDRGP4 $511
ASGNP4
line 606
;606:    s_main.exit.string			    	= "Quit";
ADDRGP4 s_main+2592+88
ADDRGP4 $514
ASGNP4
line 607
;607:	}
LABELV $482
line 608
;608:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $515
line 609
;609:    s_main.singleplayer.string			= "Начать новую игру";
ADDRGP4 s_main+1760+88
ADDRGP4 $520
ASGNP4
line 610
;610:	if(!ui_singlemode.integer){
ADDRGP4 ui_singlemode+12
INDIRI4
CNSTI4 0
NEI4 $521
line 611
;611:    s_main.multiplayer.string			= "Найти сетевую игру";
ADDRGP4 s_main+1968+88
ADDRGP4 $526
ASGNP4
line 612
;612:	} else {
ADDRGP4 $522
JUMPV
LABELV $521
line 613
;613:	s_main.multiplayer.string			= "Загрузить сохр игру";
ADDRGP4 s_main+1968+88
ADDRGP4 $529
ASGNP4
line 614
;614:	}
LABELV $522
line 615
;615:    s_main.gamemodep.string			    = "Дополнения";
ADDRGP4 s_main+1076+88
ADDRGP4 $532
ASGNP4
line 616
;616:	s_main.name.string					= "Профиль";
ADDRGP4 s_main+2696+88
ADDRGP4 $535
ASGNP4
line 617
;617:    s_main.mods.string			    	= "Моды";
ADDRGP4 s_main+2488+88
ADDRGP4 $538
ASGNP4
line 618
;618:    s_main.demos.string			    	= "Повторы";
ADDRGP4 s_main+2176+88
ADDRGP4 $541
ASGNP4
line 619
;619:    s_main.setup.string			    	= "Настройки";
ADDRGP4 s_main+2072+88
ADDRGP4 $544
ASGNP4
line 620
;620:    s_main.exit.string			    	= "Выйти";
ADDRGP4 s_main+2592+88
ADDRGP4 $547
ASGNP4
line 621
;621:	}
LABELV $515
line 624
;622:
;623:#ifndef NO_UIE_MINILOGO
;624:	s_main.logo.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_main+2624800
CNSTI4 6
ASGNI4
line 625
;625:	s_main.logo.generic.flags		= QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 s_main+2624800+72
CNSTU4 16448
ASGNU4
line 626
;626:	s_main.logo.generic.x			= 54 - uis.wideoffset;
ADDRGP4 s_main+2624800+28
CNSTI4 54
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 627
;627:	s_main.logo.generic.y			= 37;
ADDRGP4 s_main+2624800+32
CNSTI4 37
ASGNI4
line 628
;628:	s_main.logo.width				= 200;
ADDRGP4 s_main+2624800+104
CNSTI4 200
ASGNI4
line 629
;629:	s_main.logo.height				= 100;
ADDRGP4 s_main+2624800+108
CNSTI4 100
ASGNI4
line 630
;630:	s_main.logo.focuspic 			= UIE_LOGO_NAME;
ADDRGP4 s_main+2624800+88
ADDRGP4 $562
ASGNP4
line 632
;631:
;632:	Menu_AddItem( &s_main.menu,	&s_main.logo);
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+2624800
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 635
;633:#endif
;634:
;635:	s_main.modloader.generic.name		= MODLOADER;
ADDRGP4 s_main+1180+4
ADDRGP4 $179
ASGNP4
line 636
;636:	s_main.modloader.focuspic			= MODLOADER;
ADDRGP4 s_main+1180+88
ADDRGP4 $179
ASGNP4
line 637
;637:	s_main.moddb.generic.name		= MODDB;
ADDRGP4 s_main+1296+4
ADDRGP4 $180
ASGNP4
line 638
;638:	s_main.moddb.focuspic			= MODDB;
ADDRGP4 s_main+1296+88
ADDRGP4 $180
ASGNP4
line 639
;639:	s_main.button1.generic.name		= M_BUTTON1;
ADDRGP4 s_main+1412+4
ADDRGP4 $181
ASGNP4
line 640
;640:	s_main.button1.focuspic			= M_BUTTON1;
ADDRGP4 s_main+1412+88
ADDRGP4 $181
ASGNP4
line 641
;641:	s_main.button2.generic.name		= M_BUTTON2;
ADDRGP4 s_main+1528+4
ADDRGP4 $182
ASGNP4
line 642
;642:	s_main.button2.focuspic			= M_BUTTON2;
ADDRGP4 s_main+1528+88
ADDRGP4 $182
ASGNP4
line 643
;643:	s_main.button3.generic.name		= M_BUTTON3;
ADDRGP4 s_main+1644+4
ADDRGP4 $183
ASGNP4
line 644
;644:	s_main.button3.focuspic			= M_BUTTON3;
ADDRGP4 s_main+1644+88
ADDRGP4 $183
ASGNP4
line 646
;645:
;646:	s_main.modlist.generic.type			= MTYPE_UIOBJECT;
ADDRGP4 s_main+2904
CNSTI4 11
ASGNI4
line 647
;647:	s_main.modlist.type					= 5;
ADDRGP4 s_main+2904+96
CNSTI4 5
ASGNI4
line 648
;648:	s_main.modlist.styles				= 1;
ADDRGP4 s_main+2904+120
CNSTI4 1
ASGNI4
line 649
;649:	s_main.modlist.fontsize				= 1.25;
ADDRGP4 s_main+2904+136
CNSTF4 1067450368
ASGNF4
line 650
;650:	s_main.modlist.string				= "mgui/icons";
ADDRGP4 s_main+2904+112
ADDRGP4 $593
ASGNP4
line 651
;651:	s_main.modlist.generic.flags		= QMF_PULSEIFFOCUS;
ADDRGP4 s_main+2904+72
CNSTU4 256
ASGNU4
line 652
;652:	s_main.modlist.generic.callback		= Main_MenuEvent;
ADDRGP4 s_main+2904+76
ADDRGP4 Main_MenuEvent
ASGNP4
line 653
;653:	s_main.modlist.generic.id			= ID_MODLIST;
ADDRGP4 s_main+2904+24
CNSTI4 27
ASGNI4
line 654
;654:	s_main.modlist.generic.x			= 319 + uis.wideoffset;
ADDRGP4 s_main+2904+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 319
ADDI4
ASGNI4
line 655
;655:	s_main.modlist.generic.y			= 30;
ADDRGP4 s_main+2904+32
CNSTI4 30
ASGNI4
line 656
;656:	s_main.modlist.width				= 32;
ADDRGP4 s_main+2904+104
CNSTI4 32
ASGNI4
line 657
;657:	s_main.modlist.height				= 20;
ADDRGP4 s_main+2904+108
CNSTI4 20
ASGNI4
line 658
;658:	s_main.modlist.numitems				= trap_FS_GetFileList( "mgui", "as", s_main.names, 524288 );
ADDRGP4 $611
ARGP4
ADDRGP4 $612
ARGP4
ADDRGP4 s_main+3360
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 36
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_main+2904+420
ADDRLP4 36
INDIRI4
ASGNI4
line 659
;659:	s_main.modlist.itemnames			= (const char **)s_main.configlist;
ADDRGP4 s_main+2904+428
ADDRGP4 s_main+527648
ASGNP4
line 660
;660:	s_main.modlist.columns				= 1;
ADDRGP4 s_main+2904+436
CNSTI4 1
ASGNI4
line 661
;661:	s_main.modlist.color				= color_white;
ADDRGP4 s_main+2904+124
ADDRGP4 color_white
ASGNP4
line 663
;662:	
;663:	if (!s_main.modlist.numitems) {
ADDRGP4 s_main+2904+420
INDIRI4
CNSTI4 0
NEI4 $621
line 664
;664:		strcpy(s_main.names,"No addons");
ADDRGP4 s_main+3360
ARGP4
ADDRGP4 $626
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 665
;665:		s_main.modlist.numitems = 1;
ADDRGP4 s_main+2904+420
CNSTI4 1
ASGNI4
line 666
;666:	}
ADDRGP4 $622
JUMPV
LABELV $621
line 667
;667:	else if (s_main.modlist.numitems > 65536)
ADDRGP4 s_main+2904+420
INDIRI4
CNSTI4 65536
LEI4 $629
line 668
;668:		s_main.modlist.numitems = 65536;
ADDRGP4 s_main+2904+420
CNSTI4 65536
ASGNI4
LABELV $629
LABELV $622
line 670
;669:
;670:	configname = s_main.names;
ADDRLP4 0
ADDRGP4 s_main+3360
ASGNP4
line 671
;671:	for ( i = 0; i < s_main.modlist.numitems; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $639
JUMPV
LABELV $636
line 672
;672:		s_main.modlist.itemnames[i] = configname;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_main+2904+428
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 675
;673:
;674:		// strip extension
;675:		len = strlen( configname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 676
;676:		if (!Q_stricmp(configname +  len - 3,".as"))
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -3
ADDP4
ARGP4
ADDRGP4 $646
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $644
line 677
;677:			configname[len-3] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 3
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $644
line 681
;678:
;679:		//Q_strupr(configname);
;680:
;681:		configname += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 682
;682:	}
LABELV $637
line 671
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $639
ADDRLP4 8
INDIRI4
ADDRGP4 s_main+2904+420
INDIRI4
LTI4 $636
line 684
;683:
;684:	Menu_AddItem( &s_main.menu,	&s_main.gamemodep );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 685
;685:	Menu_AddItem( &s_main.menu,	&s_main.modloader );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 686
;686:	Menu_AddItem( &s_main.menu,	&s_main.moddb );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 687
;687:	Menu_AddItem( &s_main.menu,	&s_main.button1 );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 688
;688:	Menu_AddItem( &s_main.menu,	&s_main.button2 );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+1528
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 689
;689:	Menu_AddItem( &s_main.menu,	&s_main.button3 );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+1644
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 690
;690:	Menu_AddItem( &s_main.menu,	&s_main.singleplayer );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+1760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 691
;691:	Menu_AddItem( &s_main.menu,	&s_main.multiplayer );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+1968
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 692
;692:	Menu_AddItem( &s_main.menu,	&s_main.setup );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+2072
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 693
;693:	Menu_AddItem( &s_main.menu,	&s_main.demos );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+2176
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 694
;694:	Menu_AddItem( &s_main.menu,	&s_main.mods );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+2488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 695
;695:	Menu_AddItem( &s_main.menu,	&s_main.exit );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+2592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 696
;696:	Menu_AddItem( &s_main.menu,	&s_main.name );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+2696
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 697
;697:	Menu_AddItem( &s_main.menu, &s_main.modlist );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+2904
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 704
;698:	//Menu_AddItem( &s_main.menu,	&s_main.modeltype );
;699:	//Menu_AddItem( &s_main.menu,	&s_main.model.bitmap);
;700:
;701:	// prepare the player model
;702:	//UIE_PlayerInfo_InitModel(&s_main.model);
;703:
;704:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 705
;705:	uis.menusp = 0;
ADDRGP4 uis+20
CNSTI4 0
ASGNI4
line 706
;706:	UI_PushMenu ( &s_main.menu );
ADDRGP4 s_main
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 707
;707:}
LABELV $219
endproc UI_MainMenu 48 16
import trap_System
import StartServer_ServerPage_Mods
bss
align 4
LABELV s_errorMessage
skip 5172
align 4
LABELV s_main
skip 2627216
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
LABELV $646
byte 1 46
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $626
byte 1 78
byte 1 111
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $612
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $611
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 0
align 1
LABELV $593
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $562
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 0
align 1
LABELV $547
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
byte 1 0
align 1
LABELV $544
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
LABELV $541
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $538
byte 1 208
byte 1 156
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $535
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 132
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $532
byte 1 208
byte 1 148
byte 1 208
byte 1 190
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $529
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 183
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $526
byte 1 208
byte 1 157
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $520
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
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $514
byte 1 81
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $511
byte 1 79
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $508
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $505
byte 1 77
byte 1 111
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $502
byte 1 80
byte 1 114
byte 1 111
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $499
byte 1 87
byte 1 111
byte 1 114
byte 1 107
byte 1 115
byte 1 104
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $496
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $493
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 77
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $487
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 78
byte 1 101
byte 1 119
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $212
byte 1 36
byte 1 109
byte 1 111
byte 1 100
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $208
byte 1 98
byte 1 121
byte 1 32
byte 1 78
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 46
byte 1 100
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $206
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 32
byte 1 118
byte 1 54
byte 1 46
byte 1 49
byte 1 0
align 1
LABELV $194
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $186
byte 1 0
align 1
LABELV $185
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $183
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $182
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 50
byte 1 0
align 1
LABELV $181
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 49
byte 1 0
align 1
LABELV $180
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 111
byte 1 100
byte 1 100
byte 1 98
byte 1 0
align 1
LABELV $179
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $171
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $169
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 59
byte 1 0
align 1
LABELV $166
byte 1 109
byte 1 105
byte 1 110
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 59
byte 1 0
align 1
LABELV $165
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 121
byte 1 112
byte 1 111
byte 1 115
byte 1 32
byte 1 48
byte 1 59
byte 1 0
align 1
LABELV $164
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 120
byte 1 112
byte 1 111
byte 1 115
byte 1 32
byte 1 48
byte 1 59
byte 1 0
align 1
LABELV $163
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 59
byte 1 0
align 1
LABELV $160
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 104
byte 1 116
byte 1 116
byte 1 112
byte 1 115
byte 1 58
byte 1 47
byte 1 47
byte 1 119
byte 1 119
byte 1 119
byte 1 46
byte 1 109
byte 1 111
byte 1 100
byte 1 100
byte 1 98
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 47
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 47
byte 1 113
byte 1 115
byte 1 0
align 1
LABELV $154
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 59
byte 1 0
align 1
LABELV $153
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $152
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 97
byte 1 115
byte 1 59
byte 1 0
align 1
LABELV $125
byte 1 208
byte 1 158
byte 1 208
byte 1 177
byte 1 209
byte 1 139
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
byte 1 0
align 1
LABELV $119
byte 1 68
byte 1 77
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $113
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
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
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
byte 1 0
align 1
LABELV $107
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $98
byte 1 208
byte 1 159
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 151
byte 1 208
byte 1 144
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 163
byte 1 208
byte 1 151
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
byte 1 63
byte 1 0
align 1
LABELV $94
byte 1 82
byte 1 69
byte 1 76
byte 1 79
byte 1 65
byte 1 68
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $88
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 59
byte 1 0
