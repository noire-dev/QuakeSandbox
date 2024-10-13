code
proc UI_Advanced_MenuEvent 16 12
file "../../../code/q3_ui/ui_advanced.c"
line 56
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://last update: 2023 Dec 11
;3:#include "ui_local.h"
;4:
;5:#define ART_BACK0			"menu/art/back_0"
;6:#define ART_BACK1			"menu/art/back_1"	
;7:#define ART_FIGHT0			"menu/art/accept_0"
;8:#define ART_FIGHT1			"menu/art/accept_1"
;9:#define ART_FRAMEL			"menu/art/frame2_l"
;10:#define ART_FRAMER			"menu/art/frame1_r"
;11:
;12:#define MAX_WSITEMS			256
;13:#define NAMEBUFSIZE			( MAX_WSITEMS * 48 )
;14:#define GAMEBUFSIZE			( MAX_WSITEMS * 16 )
;15:
;16:#define ID_BACK				10
;17:#define ID_GO				11
;18:#define ID_LIST				12
;19:#define ID_SEARCH			13
;20:#define ID_VALUE			14
;21:
;22:
;23:typedef struct {
;24:	menuframework_s	menu;
;25:
;26:	menutext_s		banner;
;27:	menubitmap_s	framel;
;28:	menubitmap_s	framer;
;29:
;30:	menulist_s		list;
;31:	menufield_s		filter;
;32:	menufield_s		value;
;33:
;34:	menubitmap_s	back;
;35:	menubitmap_s	go;
;36:
;37:	char			description[NAMEBUFSIZE];
;38:	char			fs_game[GAMEBUFSIZE];
;39:
;40:	char			*descriptionPtr;
;41:	char			*fs_gamePtr;
;42:
;43:	char			*descriptionList[MAX_WSITEMS];
;44:	char			*fs_gameList[MAX_WSITEMS];
;45:	char*			advanced_itemslist[524288];
;46:} advanced_t;
;47:
;48:static advanced_t	s_advanced;
;49:
;50:
;51:/*
;52:===============
;53:UI_Advanced_MenuEvent
;54:===============
;55:*/
;56:static void UI_Advanced_MenuEvent( void *ptr, int event ) {
line 58
;57:
;58:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 59
;59:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 62
;60:	}
;61:
;62:	switch ( ((menucommon_s*)ptr)->id ) {
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
EQI4 $107
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $87
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $96
ADDRGP4 $84
JUMPV
LABELV $87
line 64
;63:	case ID_GO:
;64:		trap_Cmd_ExecuteText( EXEC_APPEND, va("set %s \"%s\"\n", s_advanced.list.itemnames[s_advanced.list.curvalue], s_advanced.value.field.buffer) );
ADDRGP4 $88
ARGP4
ADDRGP4 s_advanced+1412+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_advanced+1412+104
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_advanced+1908+88+12
ARGP4
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
line 65
;65:		break;
ADDRGP4 $85
JUMPV
LABELV $96
line 69
;66:		
;67:	case ID_LIST:
;68:		//trap_Cmd_ExecuteText( EXEC_APPEND, va("unset %s\n", s_advanced.list.itemnames[s_advanced.list.curvalue]) );
;69:		Q_strncpyz( s_advanced.value.field.buffer, UI_Cvar_VariableString(s_advanced.list.itemnames[s_advanced.list.curvalue]), sizeof(s_advanced.value.field.buffer) );
ADDRGP4 s_advanced+1412+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_advanced+1412+104
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_advanced+1908+88+12
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 70
;70:		break;
ADDRGP4 $85
JUMPV
LABELV $107
line 73
;71:
;72:	case ID_BACK:
;73:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 74
;74:		UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLI4
pop
line 76
;75:		//trap_Cmd_ExecuteText( EXEC_APPEND, "game_restart");
;76:		break;
LABELV $84
LABELV $85
line 78
;77:	}
;78:}
LABELV $81
endproc UI_Advanced_MenuEvent 16 12
proc UI_Advanced_MenuEvent2 8 0
line 79
;79:static void UI_Advanced_MenuEvent2( void *ptr, int event ) {
line 81
;80:
;81:	if( event != QM_LOSTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $109
line 82
;82:		return;
ADDRGP4 $108
JUMPV
LABELV $109
line 85
;83:	}
;84:
;85:	switch ( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $112
ADDRLP4 0
INDIRI4
CNSTI4 14
EQI4 $112
ADDRGP4 $111
JUMPV
line 88
;86:	case ID_SEARCH:
;87:		//UI_Advanced_LoadItemsFromFile("advanced_items.cfg");
;88:		break;
line 91
;89:	case ID_VALUE:
;90:		//trap_Cmd_ExecuteText( EXEC_APPEND, va("set %s \"%s\"\n", s_advanced.list.itemnames[s_advanced.list.curvalue], s_advanced.value.field.buffer) );
;91:		break;
LABELV $111
LABELV $112
line 93
;92:	}
;93:}
LABELV $108
endproc UI_Advanced_MenuEvent2 8 0
data
export advanced_items
align 4
LABELV advanced_items
address $116
address $117
address $118
address $119
address $120
address $121
address $122
address $123
address $124
address $125
address $126
address $127
address $128
address $129
address $130
address $131
address $132
address $133
address $134
address $135
address $136
address $137
address $138
address $139
address $140
address $141
address $142
address $143
address $144
address $145
address $146
address $147
address $148
address $149
address $150
address $151
address $152
address $153
address $154
address $155
address $156
address $157
address $158
address $159
address $160
address $161
address $162
address $163
address $164
address $165
address $166
address $167
address $168
address $169
address $170
address $171
address $172
address $173
address $174
address $175
address $176
address $177
address $178
address $179
address $180
address $181
address $182
address $183
address $184
address $185
address $186
address $187
address $188
address $189
address $190
address $191
address $192
address $193
export advanced_i
align 4
LABELV advanced_i
byte 4 0
export advanced_j
align 4
LABELV advanced_j
byte 4 0
export UI_Advanced_ParseInfos
code
proc UI_Advanced_ParseInfos 12 8
line 185
;94:
;95:
;96:char* 			advanced_items[] = {
;97:"cg_leiChibi",
;98:"cl_propsmallsizescale",
;99:"cl_propheight",
;100:"cl_propgapwidth",
;101:"cl_smallcharwidth",
;102:"cl_smallcharheight",
;103:"cl_bigcharwidth",
;104:"cl_bigcharheight",
;105:"cl_giantcharwidth",
;106:"cl_giantcharheight",
;107:"cg_brassTime",
;108:"uie_olditemmenu",
;109:"cg_gibtime",
;110:"cg_gibvelocity",
;111:"cg_gibjump",
;112:"cg_gibmodifier",
;113:"cg_draw2D",
;114:"cg_drawIcons",
;115:"cg_drawAttacker",
;116:"cg_drawRewards",
;117:"cg_crosshairX",
;118:"cg_crosshairY",
;119:"cg_railTrailTime",
;120:"cg_gunX",
;121:"cg_gunY",
;122:"cg_gunZ",
;123:"cg_drawsubtitles",
;124:"cg_runpitch",
;125:"cg_runroll",
;126:"cg_bobup",
;127:"cg_bobpitch",
;128:"cg_bobroll",
;129:"cg_swingSpeed",
;130:"cg_deferPlayers",
;131:"cg_scorePlums",
;132:"cg_alwaysWeaponBar",
;133:"cg_chatTime",
;134:"cg_consoleTime",
;135:"cg_teamChatTime",
;136:"cg_toolguninfo",
;137:"cg_teamChatY",
;138:"cg_chatY",
;139:"cg_newConsole",
;140:"cg_consoleSizeX",
;141:"cg_consoleSizeY",
;142:"cg_chatSizeX",
;143:"cg_chatSizeY",
;144:"cg_teamChatSizeX",
;145:"cg_teamChatSizeY",
;146:"cg_consoleLines",
;147:"cg_commonConsoleLines",
;148:"cg_chatLines",
;149:"cg_teamChatLines",
;150:"cg_noProjectileTrail",
;151:"cg_leiEnhancement",
;152:"cg_leiGoreNoise",
;153:"cg_leiBrassNoise",
;154:"cg_crosshairPulse",
;155:"cg_letterBoxSize",
;156:"cg_chatBeep",
;157:"cg_teamChatBeep",
;158:"cg_zoomtime",
;159:"cg_itemscaletime",
;160:"cg_weaponselecttime",
;161:"r_picmip",
;162:"r_overBrightBits",
;163:"r_mapOverBrightBits",
;164:"r_defaultImage",
;165:"r_noborder",
;166:"r_mode",
;167:"r_modeFullscreen",
;168:"r_customPixelAspect",
;169:"r_customWidth",
;170:"r_customHeight",
;171:"cl_mapAutoDownload",
;172:"s_doppler",
;173:"com_yieldCPU",
;174:"handicap"
;175:};
;176:
;177:
;178:/*
;179:===============
;180:UI_Advanced_ParseInfos
;181:===============
;182:*/
;183:	int advanced_i = 0;
;184:	int advanced_j = 0;
;185:void UI_Advanced_ParseInfos( void ) {
line 186
;186:	for (advanced_i = 0; advanced_i < 78; advanced_i++) {
ADDRGP4 advanced_i
CNSTI4 0
ASGNI4
LABELV $195
line 187
;187:	if(Q_stricmp (s_advanced.filter.field.buffer, "")){
ADDRGP4 s_advanced+1544+88+12
ARGP4
ADDRGP4 $204
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $199
line 188
;188:	if ( !Q_stristr( advanced_items[advanced_i], s_advanced.filter.field.buffer ) ) {
ADDRGP4 advanced_i
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 advanced_items
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_advanced+1544+88+12
ARGP4
ADDRLP4 4
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $205
line 189
;189:		continue;
ADDRGP4 $196
JUMPV
LABELV $205
line 191
;190:	}
;191:	}
LABELV $199
line 192
;192:	s_advanced.list.itemnames[advanced_j] = advanced_items[advanced_i];
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRGP4 advanced_j
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 s_advanced+1412+104
INDIRP4
ADDP4
ADDRGP4 advanced_i
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 advanced_items
ADDP4
INDIRP4
ASGNP4
line 193
;193:	advanced_j += 1;
ADDRLP4 8
ADDRGP4 advanced_j
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 194
;194:	}
LABELV $196
line 186
ADDRLP4 0
ADDRGP4 advanced_i
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 advanced_i
INDIRI4
CNSTI4 78
LTI4 $195
line 195
;195:    s_advanced.list.numitems = advanced_j;
ADDRGP4 s_advanced+1412+96
ADDRGP4 advanced_j
INDIRI4
ASGNI4
line 196
;196:}
LABELV $194
endproc UI_Advanced_ParseInfos 12 8
export UI_Advanced_LoadItemsFromFile
proc UI_Advanced_LoadItemsFromFile 0 0
line 204
;197:
;198:
;199:/*
;200:===============
;201:UI_Advanced_LoadItemsFromFile
;202:===============
;203:*/
;204:void UI_Advanced_LoadItemsFromFile(char *filename) {
line 205
;205:advanced_i = 0;
ADDRGP4 advanced_i
CNSTI4 0
ASGNI4
line 206
;206:advanced_j = 0;
ADDRGP4 advanced_j
CNSTI4 0
ASGNI4
line 207
;207:s_advanced.list.curvalue = 0;
ADDRGP4 s_advanced+1412+92
CNSTI4 0
ASGNI4
line 208
;208:s_advanced.list.top      = 0;
ADDRGP4 s_advanced+1412+100
CNSTI4 0
ASGNI4
line 209
;209:UI_Advanced_ParseInfos();
ADDRGP4 UI_Advanced_ParseInfos
CALLV
pop
line 210
;210:}
LABELV $214
endproc UI_Advanced_LoadItemsFromFile 0 0
proc Advanced_MenuKey 8 8
line 218
;211:
;212:
;213:/*
;214:=================
;215:Advanced_MenuKey
;216:=================
;217:*/
;218:static sfxHandle_t Advanced_MenuKey( int key ) {
line 219
;219:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $222
ADDRLP4 0
INDIRI4
CNSTI4 27
NEI4 $220
LABELV $222
line 223
;220:		//UI_PopMenu();
;221:		//UI_LoadArenas();
;222:		//trap_Cmd_ExecuteText( EXEC_APPEND, "game_restart");
;223:	}
LABELV $220
line 224
;224:	if( key == K_F5 ) {
ADDRFP4 0
INDIRI4
CNSTI4 149
NEI4 $223
line 225
;225:	UI_Advanced_LoadItemsFromFile("advanced_items.cfg");	
ADDRGP4 $225
ARGP4
ADDRGP4 UI_Advanced_LoadItemsFromFile
CALLV
pop
line 226
;226:	}
LABELV $223
line 227
;227:	return Menu_DefaultKey( &s_advanced.menu, key );
ADDRGP4 s_advanced
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $219
endproc Advanced_MenuKey 8 8
lit
align 4
LABELV $227
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $228
byte 4 1062836634
byte 4 1063675494
byte 4 1065353216
byte 4 1065353216
code
proc UI_Advanced_Draw 52 20
line 231
;228:}
;229:
;230:
;231:static void UI_Advanced_Draw( void ) {
line 233
;232:	int i;
;233:	vec4_t color_mgui	    = {1.00f, 1.00f, 1.00f, 1.00f};
ADDRLP4 16
ADDRGP4 $227
INDIRB
ASGNB 16
line 235
;234:	float			x, y, w, h;
;235:	vec4_t			color1 = {0.85, 0.9, 1.0, 1};
ADDRLP4 0
ADDRGP4 $228
INDIRB
ASGNB 16
line 237
;236:
;237:	Menu_Draw( &s_advanced.menu );
ADDRGP4 s_advanced
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 240
;238:	
;239:	
;240:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $229
line 241
;241:	UI_DrawString( 320, 3, "Press F5 to search", UI_CENTER|UI_SMALLFONT, color1 );
CNSTI4 320
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 $232
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 242
;242:	}
LABELV $229
line 243
;243:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $233
line 244
;244:	UI_DrawString( 320, 3, "Нажмите F5 для поиска", UI_CENTER|UI_SMALLFONT, color1 );
CNSTI4 320
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 $236
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 245
;245:	}
LABELV $233
line 246
;246:}
LABELV $226
endproc UI_Advanced_Draw 52 20
proc UI_Advanced_MenuInit 0 12
line 254
;247:
;248:
;249:/*
;250:===============
;251:UI_Advanced_MenuInit
;252:===============
;253:*/
;254:static void UI_Advanced_MenuInit( void ) {
line 255
;255:	UI_AdvancedMenu_Cache();
ADDRGP4 UI_AdvancedMenu_Cache
CALLV
pop
line 257
;256:
;257:	memset( &s_advanced, 0 ,sizeof(advanced_t) );
ADDRGP4 s_advanced
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2118096
ARGI4
ADDRGP4 memset
CALLP4
pop
line 258
;258:	s_advanced.menu.wrapAround = qtrue;
ADDRGP4 s_advanced+1044
CNSTI4 1
ASGNI4
line 259
;259:	s_advanced.menu.native 	   = qfalse;
ADDRGP4 s_advanced+1056
CNSTI4 0
ASGNI4
line 260
;260:	s_advanced.menu.fullscreen = qtrue;
ADDRGP4 s_advanced+1052
CNSTI4 1
ASGNI4
line 261
;261:	s_advanced.menu.key        = Advanced_MenuKey;
ADDRGP4 s_advanced+1040
ADDRGP4 Advanced_MenuKey
ASGNP4
line 262
;262:	s_advanced.menu.draw 	   = UI_Advanced_Draw;
ADDRGP4 s_advanced+1036
ADDRGP4 UI_Advanced_Draw
ASGNP4
line 264
;263:
;264:	s_advanced.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 s_advanced+1076
CNSTI4 10
ASGNI4
line 265
;265:	s_advanced.banner.generic.x			= 320;
ADDRGP4 s_advanced+1076+28
CNSTI4 320
ASGNI4
line 266
;266:	s_advanced.banner.generic.y			= 16;
ADDRGP4 s_advanced+1076+32
CNSTI4 16
ASGNI4
line 267
;267:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $248
line 268
;268:	s_advanced.banner.string			= "ADVANCED SETTINGS";
ADDRGP4 s_advanced+1076+88
ADDRGP4 $253
ASGNP4
line 269
;269:	}
LABELV $248
line 270
;270:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $254
line 271
;271:	s_advanced.banner.string			= "РАСШИРЕННЫЕ НАСТРОЙКИ";
ADDRGP4 s_advanced+1076+88
ADDRGP4 $259
ASGNP4
line 272
;272:	}
LABELV $254
line 273
;273:	s_advanced.banner.color				= color_white;
ADDRGP4 s_advanced+1076+100
ADDRGP4 color_white
ASGNP4
line 274
;274:	s_advanced.banner.style				= UI_CENTER;
ADDRGP4 s_advanced+1076+92
CNSTI4 1
ASGNI4
line 276
;275:
;276:	s_advanced.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_advanced+1180
CNSTI4 6
ASGNI4
line 277
;277:	s_advanced.framel.generic.name		= ART_FRAMEL;
ADDRGP4 s_advanced+1180+4
ADDRGP4 $267
ASGNP4
line 278
;278:	s_advanced.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_advanced+1180+72
CNSTU4 16384
ASGNU4
line 279
;279:	s_advanced.framel.generic.x			= 0;  
ADDRGP4 s_advanced+1180+28
CNSTI4 0
ASGNI4
line 280
;280:	s_advanced.framel.generic.y			= 78;
ADDRGP4 s_advanced+1180+32
CNSTI4 78
ASGNI4
line 281
;281:	s_advanced.framel.width				= 256;
ADDRGP4 s_advanced+1180+104
CNSTI4 256
ASGNI4
line 282
;282:	s_advanced.framel.height			= 329;
ADDRGP4 s_advanced+1180+108
CNSTI4 329
ASGNI4
line 284
;283:
;284:	s_advanced.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_advanced+1296
CNSTI4 6
ASGNI4
line 285
;285:	s_advanced.framer.generic.name		= ART_FRAMER;
ADDRGP4 s_advanced+1296+4
ADDRGP4 $281
ASGNP4
line 286
;286:	s_advanced.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_advanced+1296+72
CNSTU4 16384
ASGNU4
line 287
;287:	s_advanced.framer.generic.x			= 376;
ADDRGP4 s_advanced+1296+28
CNSTI4 376
ASGNI4
line 288
;288:	s_advanced.framer.generic.y			= 76;
ADDRGP4 s_advanced+1296+32
CNSTI4 76
ASGNI4
line 289
;289:	s_advanced.framer.width				= 256;
ADDRGP4 s_advanced+1296+104
CNSTI4 256
ASGNI4
line 290
;290:	s_advanced.framer.height			= 334;
ADDRGP4 s_advanced+1296+108
CNSTI4 334
ASGNI4
line 292
;291:
;292:	s_advanced.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_advanced+2272
CNSTI4 6
ASGNI4
line 293
;293:	s_advanced.back.generic.name		= ART_BACK0;
ADDRGP4 s_advanced+2272+4
ADDRGP4 $295
ASGNP4
line 294
;294:	s_advanced.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_advanced+2272+72
CNSTU4 260
ASGNU4
line 295
;295:	s_advanced.back.generic.id			= ID_BACK;
ADDRGP4 s_advanced+2272+24
CNSTI4 10
ASGNI4
line 296
;296:	s_advanced.back.generic.callback	= UI_Advanced_MenuEvent;
ADDRGP4 s_advanced+2272+76
ADDRGP4 UI_Advanced_MenuEvent
ASGNP4
line 297
;297:	s_advanced.back.generic.x			= 0 - uis.wideoffset;
ADDRGP4 s_advanced+2272+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 298
;298:	s_advanced.back.generic.y			= 480-64;
ADDRGP4 s_advanced+2272+32
CNSTI4 416
ASGNI4
line 299
;299:	s_advanced.back.width				= 128;
ADDRGP4 s_advanced+2272+104
CNSTI4 128
ASGNI4
line 300
;300:	s_advanced.back.height				= 64;
ADDRGP4 s_advanced+2272+108
CNSTI4 64
ASGNI4
line 301
;301:	s_advanced.back.focuspic			= ART_BACK1;
ADDRGP4 s_advanced+2272+88
ADDRGP4 $313
ASGNP4
line 303
;302:
;303:	s_advanced.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_advanced+2388
CNSTI4 6
ASGNI4
line 304
;304:	s_advanced.go.generic.name			= ART_FIGHT0;
ADDRGP4 s_advanced+2388+4
ADDRGP4 $317
ASGNP4
line 305
;305:	s_advanced.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_advanced+2388+72
CNSTU4 272
ASGNU4
line 306
;306:	s_advanced.go.generic.id			= ID_GO;
ADDRGP4 s_advanced+2388+24
CNSTI4 11
ASGNI4
line 307
;307:	s_advanced.go.generic.callback		= UI_Advanced_MenuEvent;
ADDRGP4 s_advanced+2388+76
ADDRGP4 UI_Advanced_MenuEvent
ASGNP4
line 308
;308:	s_advanced.go.generic.x				= 640 + uis.wideoffset;
ADDRGP4 s_advanced+2388+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 309
;309:	s_advanced.go.generic.y				= 480-64;
ADDRGP4 s_advanced+2388+32
CNSTI4 416
ASGNI4
line 310
;310:	s_advanced.go.width					= 128;
ADDRGP4 s_advanced+2388+104
CNSTI4 128
ASGNI4
line 311
;311:	s_advanced.go.height				= 64;
ADDRGP4 s_advanced+2388+108
CNSTI4 64
ASGNI4
line 312
;312:	s_advanced.go.focuspic				= ART_FIGHT1;
ADDRGP4 s_advanced+2388+88
ADDRGP4 $335
ASGNP4
line 314
;313:	
;314:	s_advanced.filter.generic.type			= MTYPE_FIELD;
ADDRGP4 s_advanced+1544
CNSTI4 4
ASGNI4
line 315
;315:	s_advanced.filter.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT||QMF_CENTER_JUSTIFY;
ADDRGP4 s_advanced+1544+72
CNSTU4 1
ASGNU4
line 316
;316:	s_advanced.filter.generic.callback		= UI_Advanced_MenuEvent2;
ADDRGP4 s_advanced+1544+76
ADDRGP4 UI_Advanced_MenuEvent2
ASGNP4
line 317
;317:	s_advanced.filter.generic.id			= ID_SEARCH;
ADDRGP4 s_advanced+1544+24
CNSTI4 13
ASGNI4
line 318
;318:	s_advanced.filter.field.widthInChars	= 16;
ADDRGP4 s_advanced+1544+88+8
CNSTI4 16
ASGNI4
line 319
;319:	s_advanced.filter.field.maxchars		= 16;
ADDRGP4 s_advanced+1544+88+268
CNSTI4 16
ASGNI4
line 320
;320:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $349
line 321
;321:	s_advanced.filter.generic.name			= "Search:";
ADDRGP4 s_advanced+1544+4
ADDRGP4 $354
ASGNP4
line 322
;322:	}
LABELV $349
line 323
;323:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $355
line 324
;324:	s_advanced.filter.generic.name			= "Поиск:";
ADDRGP4 s_advanced+1544+4
ADDRGP4 $360
ASGNP4
line 325
;325:	}
LABELV $355
line 326
;326:	s_advanced.filter.generic.x				= 240;
ADDRGP4 s_advanced+1544+28
CNSTI4 240
ASGNI4
line 327
;327:	s_advanced.filter.generic.y				= 430;
ADDRGP4 s_advanced+1544+32
CNSTI4 430
ASGNI4
line 329
;328:	
;329:	s_advanced.value.generic.type			= MTYPE_FIELD;
ADDRGP4 s_advanced+1908
CNSTI4 4
ASGNI4
line 330
;330:	s_advanced.value.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT||QMF_CENTER_JUSTIFY;
ADDRGP4 s_advanced+1908+72
CNSTU4 1
ASGNU4
line 331
;331:	s_advanced.value.generic.callback		= UI_Advanced_MenuEvent2;
ADDRGP4 s_advanced+1908+76
ADDRGP4 UI_Advanced_MenuEvent2
ASGNP4
line 332
;332:	s_advanced.value.generic.id				= ID_VALUE;
ADDRGP4 s_advanced+1908+24
CNSTI4 14
ASGNI4
line 333
;333:	s_advanced.value.field.widthInChars		= 20;
ADDRGP4 s_advanced+1908+88+8
CNSTI4 20
ASGNI4
line 334
;334:	s_advanced.value.field.maxchars			= 128;
ADDRGP4 s_advanced+1908+88+268
CNSTI4 128
ASGNI4
line 335
;335:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $378
line 336
;336:	s_advanced.value.generic.name			= "Value:";
ADDRGP4 s_advanced+1908+4
ADDRGP4 $383
ASGNP4
line 337
;337:	}
LABELV $378
line 338
;338:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $384
line 339
;339:	s_advanced.value.generic.name			= "Значение:";
ADDRGP4 s_advanced+1908+4
ADDRGP4 $389
ASGNP4
line 340
;340:	}
LABELV $384
line 341
;341:	s_advanced.value.generic.x				= 240;
ADDRGP4 s_advanced+1908+28
CNSTI4 240
ASGNI4
line 342
;342:	s_advanced.value.generic.y				= 450;
ADDRGP4 s_advanced+1908+32
CNSTI4 450
ASGNI4
line 345
;343:
;344:	// scan for items
;345:	s_advanced.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_advanced+1412
CNSTI4 8
ASGNI4
line 346
;346:	s_advanced.list.generic.flags		= QMF_PULSEIFFOCUS|QMF_CENTER_JUSTIFY;
ADDRGP4 s_advanced+1412+72
CNSTU4 264
ASGNU4
line 347
;347:	s_advanced.list.generic.callback	= UI_Advanced_MenuEvent;
ADDRGP4 s_advanced+1412+76
ADDRGP4 UI_Advanced_MenuEvent
ASGNP4
line 348
;348:	s_advanced.list.generic.id			= ID_LIST;
ADDRGP4 s_advanced+1412+24
CNSTI4 12
ASGNI4
line 349
;349:	s_advanced.list.generic.x			= 320;
ADDRGP4 s_advanced+1412+28
CNSTI4 320
ASGNI4
line 350
;350:	s_advanced.list.generic.y			= 40;
ADDRGP4 s_advanced+1412+32
CNSTI4 40
ASGNI4
line 351
;351:	s_advanced.list.width				= 48;
ADDRGP4 s_advanced+1412+112
CNSTI4 48
ASGNI4
line 352
;352:	s_advanced.list.height				= 32;
ADDRGP4 s_advanced+1412+116
CNSTI4 32
ASGNI4
line 353
;353:	s_advanced.list.itemnames			= (const char **)s_advanced.advanced_itemslist;
ADDRGP4 s_advanced+1412+104
ADDRGP4 s_advanced+20944
ASGNP4
line 355
;354:
;355:	UI_Advanced_LoadItemsFromFile("advanced_items.cfg");
ADDRGP4 $225
ARGP4
ADDRGP4 UI_Advanced_LoadItemsFromFile
CALLV
pop
line 357
;356:
;357:	Menu_AddItem( &s_advanced.menu, &s_advanced.banner );
ADDRGP4 s_advanced
ARGP4
ADDRGP4 s_advanced+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 358
;358:	Menu_AddItem( &s_advanced.menu, &s_advanced.framel );
ADDRGP4 s_advanced
ARGP4
ADDRGP4 s_advanced+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 359
;359:	Menu_AddItem( &s_advanced.menu, &s_advanced.framer );
ADDRGP4 s_advanced
ARGP4
ADDRGP4 s_advanced+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 360
;360:	Menu_AddItem( &s_advanced.menu, &s_advanced.list );
ADDRGP4 s_advanced
ARGP4
ADDRGP4 s_advanced+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 361
;361:	Menu_AddItem( &s_advanced.menu, &s_advanced.back );
ADDRGP4 s_advanced
ARGP4
ADDRGP4 s_advanced+2272
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 362
;362:	Menu_AddItem( &s_advanced.menu, &s_advanced.go );
ADDRGP4 s_advanced
ARGP4
ADDRGP4 s_advanced+2388
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 363
;363:	Menu_AddItem( &s_advanced.menu, &s_advanced.filter );
ADDRGP4 s_advanced
ARGP4
ADDRGP4 s_advanced+1544
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 364
;364:	Menu_AddItem( &s_advanced.menu, &s_advanced.value );
ADDRGP4 s_advanced
ARGP4
ADDRGP4 s_advanced+1908
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 365
;365:}
LABELV $237
endproc UI_Advanced_MenuInit 0 12
export UI_AdvancedMenu_Cache
proc UI_AdvancedMenu_Cache 0 4
line 372
;366:
;367:/*
;368:=================
;369:UI_Advanced_Cache
;370:=================
;371:*/
;372:void UI_AdvancedMenu_Cache( void ) {
line 373
;373:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $295
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 374
;374:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $313
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 375
;375:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $317
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 376
;376:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $335
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 377
;377:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $267
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 378
;378:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $281
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 379
;379:}
LABELV $420
endproc UI_AdvancedMenu_Cache 0 4
export UI_AdvancedMenu
proc UI_AdvancedMenu 0 4
line 387
;380:
;381:
;382:/*
;383:===============
;384:UI_AdvancedMenu
;385:===============
;386:*/
;387:void UI_AdvancedMenu( void ) {
line 388
;388:	UI_Advanced_MenuInit();
ADDRGP4 UI_Advanced_MenuInit
CALLV
pop
line 389
;389:	UI_PushMenu( &s_advanced.menu );
ADDRGP4 s_advanced
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 390
;390:}
LABELV $421
endproc UI_AdvancedMenu 0 4
import UI_LoadArenas
bss
align 4
LABELV s_advanced
skip 2118096
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
LABELV $389
byte 1 208
byte 1 151
byte 1 208
byte 1 189
byte 1 208
byte 1 176
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
byte 1 58
byte 1 0
align 1
LABELV $383
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $360
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 58
byte 1 0
align 1
LABELV $354
byte 1 83
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 58
byte 1 0
align 1
LABELV $335
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $317
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $313
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
LABELV $295
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
LABELV $281
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $267
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $259
byte 1 208
byte 1 160
byte 1 208
byte 1 144
byte 1 208
byte 1 161
byte 1 208
byte 1 168
byte 1 208
byte 1 152
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 157
byte 1 208
byte 1 157
byte 1 208
byte 1 171
byte 1 208
byte 1 149
byte 1 32
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
LABELV $253
byte 1 65
byte 1 68
byte 1 86
byte 1 65
byte 1 78
byte 1 67
byte 1 69
byte 1 68
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 84
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 0
align 1
LABELV $236
byte 1 208
byte 1 157
byte 1 208
byte 1 176
byte 1 208
byte 1 182
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 70
byte 1 53
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 187
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $232
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 70
byte 1 53
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $225
byte 1 97
byte 1 100
byte 1 118
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 100
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $204
byte 1 0
align 1
LABELV $193
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
LABELV $192
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 121
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 67
byte 1 80
byte 1 85
byte 1 0
align 1
LABELV $191
byte 1 115
byte 1 95
byte 1 100
byte 1 111
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $190
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $189
byte 1 114
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $188
byte 1 114
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 87
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $187
byte 1 114
byte 1 95
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 80
byte 1 105
byte 1 120
byte 1 101
byte 1 108
byte 1 65
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $186
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $185
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $184
byte 1 114
byte 1 95
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $183
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 73
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $182
byte 1 114
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 66
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 66
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $181
byte 1 114
byte 1 95
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 66
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 66
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $180
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 109
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $179
byte 1 99
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $178
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $177
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $176
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 66
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $175
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 66
byte 1 101
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $174
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 111
byte 1 120
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $173
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 80
byte 1 117
byte 1 108
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $172
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 101
byte 1 105
byte 1 66
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 78
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $171
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 101
byte 1 105
byte 1 71
byte 1 111
byte 1 114
byte 1 101
byte 1 78
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $170
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 101
byte 1 105
byte 1 69
byte 1 110
byte 1 104
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $169
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $168
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $167
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $166
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 111
byte 1 110
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $165
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $164
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 89
byte 1 0
align 1
LABELV $163
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 88
byte 1 0
align 1
LABELV $162
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 89
byte 1 0
align 1
LABELV $161
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 88
byte 1 0
align 1
LABELV $160
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 89
byte 1 0
align 1
LABELV $159
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 88
byte 1 0
align 1
LABELV $158
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $157
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 89
byte 1 0
align 1
LABELV $156
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 89
byte 1 0
align 1
LABELV $155
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $154
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $153
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $152
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 66
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $150
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 108
byte 1 117
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $149
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $147
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $146
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $144
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $143
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $142
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 115
byte 1 117
byte 1 98
byte 1 116
byte 1 105
byte 1 116
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $141
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 90
byte 1 0
align 1
LABELV $140
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 89
byte 1 0
align 1
LABELV $139
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 88
byte 1 0
align 1
LABELV $138
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 89
byte 1 0
align 1
LABELV $136
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 88
byte 1 0
align 1
LABELV $135
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 82
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $134
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $133
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $132
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 50
byte 1 68
byte 1 0
align 1
LABELV $131
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $130
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $129
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $127
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $126
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $125
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 108
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $122
byte 1 99
byte 1 108
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $121
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $120
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 103
byte 1 97
byte 1 112
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $118
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $117
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $116
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 101
byte 1 105
byte 1 67
byte 1 104
byte 1 105
byte 1 98
byte 1 105
byte 1 0
align 1
LABELV $88
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
