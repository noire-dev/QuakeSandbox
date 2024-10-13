data
align 4
LABELV teamoverlay_names
address $81
address $82
address $83
address $84
byte 4 0
align 4
LABELV shadow_types
address $81
address $85
address $86
address $87
byte 4 0
align 4
LABELV teamoverlay_namesru
address $88
address $89
address $90
address $91
byte 4 0
align 4
LABELV shadow_typesru
address $88
address $92
address $93
address $94
byte 4 0
align 4
LABELV g_hud_controls
address s_preferences+1828
address s_preferences+1960
address s_preferences+2056
address s_preferences+2160
address s_preferences+2264
address s_preferences+2464
address s_preferences+2848
address s_preferences+3232
address s_preferences+4648
address s_preferences+5012
address s_preferences+3844
address s_preferences+3040
address s_preferences+3940
address s_preferences+4036
address s_preferences+4132
address s_preferences+6104
byte 4 0
align 4
LABELV g_render_controls
address s_preferences+4420
address s_preferences+2944
address s_preferences+3652
address s_preferences+5376
address s_preferences+5740
byte 4 0
align 4
LABELV g_object_controls
address s_preferences+2368
address s_preferences+2656
address s_preferences+2560
address s_preferences+2752
address s_preferences+3556
address s_preferences+3136
address s_preferences+3748
address s_preferences+6200
address s_preferences+6296
address s_preferences+6392
address s_preferences+6488
byte 4 0
align 4
LABELV g_prefmisc_controls
address s_preferences+4228
address s_preferences+4324
address s_preferences+3364
address s_preferences+3460
address s_preferences+4552
byte 4 0
align 4
LABELV g_control_list
address g_hud_controls
address g_render_controls
address g_object_controls
address g_prefmisc_controls
code
proc Preferences_SetMenuItems 240 12
file "../../../code/q3_ui/ui_preferences.c"
line 270
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:GAME OPTIONS MENU
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
;18:#define ART_FRAMEL				"menu/art/frame2_l"
;19:#define ART_FRAMER				"menu/art/frame1_r"
;20:#define ART_BACK0				"menu/art/back_0"
;21:#define ART_BACK1				"menu/art/back_1"
;22:
;23:#define PREFERENCES_X_POS		360
;24:#define PREFERENCES_X_LEFT		(160 + 5*SMALLCHAR_WIDTH)
;25:#define PREFERENCES_X_RIGHT		(480 + 5*SMALLCHAR_WIDTH)
;26:
;27:#define LINE_GAP		(BIGCHAR_HEIGHT + 2)
;28:
;29:
;30:#define CONTROL_X (SCREEN_WIDTH/2 + 40)
;31:#define SMALLCHAR_LINEHEIGHT (SMALLCHAR_HEIGHT + 2)
;32:
;33:
;34:#define ID_HUD					50
;35:#define ID_RENDER				51
;36:#define ID_OBJECTS				52
;37:#define ID_MISC					53
;38:
;39:#define ID_CROSSHAIR			127
;40:#define ID_SIMPLEITEMS			128
;41:#define ID_HIGHQUALITYSKY		129
;42:#define ID_EJECTINGBRASS		130
;43:#define ID_WALLMARKS			131
;44:#define ID_DYNAMICLIGHTS		132
;45:#define ID_IDENTIFYTARGET		133
;46:#define ID_SYNCEVERYFRAME		134
;47:#define ID_FORCEMODEL			135
;48:#define ID_DRAWTEAMOVERLAY		136
;49:#define ID_ALLOWDOWNLOAD			137
;50:#define ID_BACK					138
;51:#define ID_BOTMENU				139
;52:
;53:#define ID_GIBS				140
;54:#define ID_BLOOD			141
;55:#define ID_DEFERPLAYER		142
;56:#define ID_DRAWFPS			143
;57:#define ID_DRAWTIMER		144
;58:#define ID_LAGOMETER		145
;59:#define ID_PREDICTITEMS		146
;60:#define ID_SMOOTHCLIENTS	147
;61:#define ID_SHADOWS			148
;62:#define ID_TEAMCHATHEIGHT	149
;63:#define ID_TEAMCHATTIME		150
;64:#define ID_NEWESCAPEMENU	151
;65:#define ID_FOV				152
;66:#define ID_ZOOMFOV			153
;67:#define ID_AMMOWARNING		154
;68:#define ID_DRAWGUN			155
;69:
;70:#define ID_OLDRAIL			156
;71:#define ID_OLDPLASMA		157
;72:#define ID_OLDROCKET		158
;73:#define ID_TRUELIGHTNING	159
;74:#define ID_COLORRED             160
;75:#define ID_COLORGREEN           161
;76:#define ID_COLORBLUE            162
;77:#define ID_CROSSHAIRHEALTH      163
;78:#define ID_WEAPONBAR                    164
;79:
;80:#define	NUM_CROSSHAIRS			10
;81:
;82:
;83:typedef struct {
;84:	menuframework_s		menu;
;85:
;86:	menutext_s			banner;
;87:	menubitmap_s		framel;
;88:	menubitmap_s		framer;
;89:
;90:	menutext_s			hud;
;91:	menutext_s			render;
;92:	menutext_s			objects;
;93:    menutext_s			misc;
;94:
;95:	menulist_s			crosshair;
;96:        menuradiobutton_s	crosshairHealth;
;97:        //Crosshair colors:
;98:        menuslider_s            crosshairColorRed;
;99:        menuslider_s            crosshairColorGreen;
;100:        menuslider_s            crosshairColorBlue;
;101:	menuradiobutton_s	simpleitems;
;102:        menuradiobutton_s	alwaysweaponbar;
;103:	menuradiobutton_s	brass;
;104:	menuradiobutton_s	wallmarks;
;105:	menuradiobutton_s	dynamiclights;
;106:	menuradiobutton_s	identifytarget;
;107:	menuradiobutton_s	highqualitysky;
;108:	menuradiobutton_s	synceveryframe;
;109:	menuradiobutton_s	forcemodel;
;110:	menulist_s			drawteamoverlay;
;111:	menuradiobutton_s	allowdownload;
;112:	menuradiobutton_s	botmenu;
;113:
;114:	menuradiobutton_s	gibs;
;115:	menuradiobutton_s	blood;
;116:	menuradiobutton_s	deferplayer;
;117:	menuradiobutton_s	drawfps;
;118:	menuradiobutton_s	drawtimer;
;119:	menuradiobutton_s	drawlagometer;
;120:	menuradiobutton_s	drawgun;
;121:	menuradiobutton_s	predictitems;
;122:	menuradiobutton_s	smoothclient;
;123:	menulist_s			shadows;
;124:	menuradiobutton_s	newESCmenu;
;125:
;126:	menufield_s			teamchatheight;
;127:	menufield_s			teamchattime;
;128:	menufield_s			fov;
;129:	menufield_s			zoomfov;
;130:
;131:	menuradiobutton_s	drawAmmoWarning;
;132:
;133:	menuradiobutton_s	oldrail;
;134:	menuradiobutton_s	oldplasma;
;135:	menuradiobutton_s	oldrocket;
;136:	menuradiobutton_s	truelightning;
;137:
;138:
;139:	menubitmap_s		back;
;140:
;141:	qhandle_t			crosshairShader[NUM_CROSSHAIRS];
;142:	int section;
;143:	int max_control_text;
;144:} preferences_t;
;145:
;146:static preferences_t s_preferences;
;147:
;148:static const char *teamoverlay_names[] =
;149:{
;150:	"off",
;151:	"upper right",
;152:	"lower right",
;153:	"lower left",
;154:	0
;155:};
;156:
;157:
;158:
;159:
;160:static const char *shadow_types[] =
;161:{
;162:	"off",
;163:	"disc",
;164:	"stencil",
;165:	"simple stencil",
;166:	0
;167:};
;168:
;169:static const char *teamoverlay_namesru[] =
;170:{
;171:	"выкл",
;172:	"сверху справа",
;173:	"снизу справа",
;174:	"снизу влево",
;175:	0
;176:};
;177:
;178:
;179:
;180:
;181:static const char *shadow_typesru[] =
;182:{
;183:	"выкл",
;184:	"диск",
;185:	"тень",
;186:	"простая тень",
;187:	0
;188:};
;189:
;190:
;191:
;192:
;193:
;194:
;195:
;196:
;197:static menucommon_s* g_hud_controls[] = {
;198:	(menucommon_s*) &s_preferences.crosshair,
;199:	(menucommon_s*) &s_preferences.crosshairHealth,
;200:	(menucommon_s*) &s_preferences.crosshairColorRed,
;201:	(menucommon_s*) &s_preferences.crosshairColorGreen,
;202:	(menucommon_s*) &s_preferences.crosshairColorBlue,
;203:	(menucommon_s*) &s_preferences.alwaysweaponbar,
;204:	(menucommon_s*) &s_preferences.identifytarget,
;205:	(menucommon_s*) &s_preferences.drawteamoverlay,
;206:	(menucommon_s*) &s_preferences.teamchatheight,
;207:	(menucommon_s*) &s_preferences.teamchattime,
;208:	(menucommon_s*) &s_preferences.drawfps,
;209:	(menucommon_s*) &s_preferences.synceveryframe,
;210:	(menucommon_s*) &s_preferences.drawtimer,
;211:	(menucommon_s*) &s_preferences.drawlagometer,
;212:	(menucommon_s*) &s_preferences.drawgun,
;213:	(menucommon_s*) &s_preferences.drawAmmoWarning,
;214:	NULL
;215:};
;216:
;217:
;218:static menucommon_s* g_render_controls[] = {
;219:	(menucommon_s*) &s_preferences.shadows,
;220:	(menucommon_s*) &s_preferences.highqualitysky,
;221:	(menucommon_s*) &s_preferences.blood,
;222:	(menucommon_s*) &s_preferences.fov,
;223:	(menucommon_s*) &s_preferences.zoomfov,
;224:	NULL
;225:};
;226:
;227:static menucommon_s* g_object_controls[] = {
;228:	(menucommon_s*) &s_preferences.simpleitems,
;229:	(menucommon_s*) &s_preferences.wallmarks,
;230:	(menucommon_s*) &s_preferences.brass,
;231:	(menucommon_s*) &s_preferences.dynamiclights,
;232:	(menucommon_s*) &s_preferences.gibs,
;233:	(menucommon_s*) &s_preferences.forcemodel,
;234:	(menucommon_s*) &s_preferences.deferplayer,
;235:	(menucommon_s*) &s_preferences.oldrail,
;236:	(menucommon_s*) &s_preferences.oldplasma,
;237:	(menucommon_s*) &s_preferences.oldrocket,
;238:	(menucommon_s*) &s_preferences.truelightning,
;239:	NULL
;240:};
;241:
;242:static menucommon_s* g_prefmisc_controls[] = {
;243:	(menucommon_s*) &s_preferences.predictitems,
;244:	(menucommon_s*) &s_preferences.smoothclient,
;245:	(menucommon_s*) &s_preferences.allowdownload,
;246:	(menucommon_s*) &s_preferences.botmenu,
;247:	(menucommon_s*) &s_preferences.newESCmenu,
;248:	NULL
;249:};
;250:
;251:
;252:#define C_HUD		0
;253:#define C_RENDER	1
;254:#define C_OBJECTS	2
;255:#define C_MISC		3
;256:
;257:#define C_MAX 		4
;258:
;259:
;260:
;261:static menucommon_s** g_control_list[] = {
;262:	g_hud_controls,
;263:	g_render_controls,
;264:	g_object_controls,
;265:	g_prefmisc_controls
;266:};
;267:
;268:
;269:
;270:static void Preferences_SetMenuItems( void ) {
line 271
;271:	s_preferences.crosshair.curvalue		= (int)trap_Cvar_VariableValue( "cg_drawCrosshair" ) % NUM_CROSSHAIRS;
ADDRGP4 $135
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_preferences+1828+92
ADDRLP4 0
INDIRF4
CVFI4 4
CNSTI4 10
MODI4
ASGNI4
line 272
;272:    s_preferences.crosshairColorRed.curvalue        = trap_Cvar_VariableValue( "cg_crosshairColorRed")*255.0f;
ADDRGP4 $138
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_preferences+2056+96
CNSTF4 1132396544
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 273
;273:    s_preferences.crosshairColorGreen.curvalue      = trap_Cvar_VariableValue( "cg_crosshairColorGreen")*255.0f;
ADDRGP4 $141
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_preferences+2160+96
CNSTF4 1132396544
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 274
;274:    s_preferences.crosshairColorBlue.curvalue       = trap_Cvar_VariableValue( "cg_crosshairColorBlue")*255.0f;
ADDRGP4 $144
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_preferences+2264+96
CNSTF4 1132396544
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 275
;275:	s_preferences.simpleitems.curvalue		= trap_Cvar_VariableValue( "cg_simpleItems" ) != 0;
ADDRGP4 $147
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
CNSTF4 0
EQF4 $149
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $150
JUMPV
LABELV $149
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $150
ADDRGP4 s_preferences+2368+88
ADDRLP4 16
INDIRI4
ASGNI4
line 276
;276:    s_preferences.alwaysweaponbar.curvalue		= trap_Cvar_VariableValue( "cg_alwaysWeaponBar" ) != 0;
ADDRGP4 $153
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
EQF4 $155
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $156
JUMPV
LABELV $155
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $156
ADDRGP4 s_preferences+2464+88
ADDRLP4 24
INDIRI4
ASGNI4
line 277
;277:	s_preferences.brass.curvalue			= trap_Cvar_VariableValue( "cg_brassTime" ) != 0;
ADDRGP4 $159
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 0
EQF4 $161
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 $162
JUMPV
LABELV $161
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $162
ADDRGP4 s_preferences+2560+88
ADDRLP4 32
INDIRI4
ASGNI4
line 278
;278:	s_preferences.wallmarks.curvalue		= trap_Cvar_VariableValue( "cg_marks" ) != 0;
ADDRGP4 $165
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 0
EQF4 $167
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $167
ADDRLP4 40
CNSTI4 0
ASGNI4
LABELV $168
ADDRGP4 s_preferences+2656+88
ADDRLP4 40
INDIRI4
ASGNI4
line 279
;279:	s_preferences.identifytarget.curvalue	= trap_Cvar_VariableValue( "cg_drawCrosshairNames" ) != 0;
ADDRGP4 $171
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 0
EQF4 $173
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $173
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $174
ADDRGP4 s_preferences+2848+88
ADDRLP4 48
INDIRI4
ASGNI4
line 280
;280:	s_preferences.dynamiclights.curvalue	= trap_Cvar_VariableValue( "r_dynamiclight" ) != 0;
ADDRGP4 $177
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 60
INDIRF4
CNSTF4 0
EQF4 $179
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRGP4 $180
JUMPV
LABELV $179
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $180
ADDRGP4 s_preferences+2752+88
ADDRLP4 56
INDIRI4
ASGNI4
line 281
;281:	s_preferences.highqualitysky.curvalue	= trap_Cvar_VariableValue ( "r_fastsky" ) == 0;
ADDRGP4 $183
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 68
INDIRF4
CNSTF4 0
NEF4 $185
ADDRLP4 64
CNSTI4 1
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $185
ADDRLP4 64
CNSTI4 0
ASGNI4
LABELV $186
ADDRGP4 s_preferences+2944+88
ADDRLP4 64
INDIRI4
ASGNI4
line 282
;282:	s_preferences.synceveryframe.curvalue	= trap_Cvar_VariableValue( "r_swapInterval" ) != 0;
ADDRGP4 $189
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 0
EQF4 $191
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $192
JUMPV
LABELV $191
ADDRLP4 72
CNSTI4 0
ASGNI4
LABELV $192
ADDRGP4 s_preferences+3040+88
ADDRLP4 72
INDIRI4
ASGNI4
line 283
;283:	s_preferences.forcemodel.curvalue		= trap_Cvar_VariableValue( "cg_forcemodel" ) != 0;
ADDRGP4 $195
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 84
INDIRF4
CNSTF4 0
EQF4 $197
ADDRLP4 80
CNSTI4 1
ASGNI4
ADDRGP4 $198
JUMPV
LABELV $197
ADDRLP4 80
CNSTI4 0
ASGNI4
LABELV $198
ADDRGP4 s_preferences+3136+88
ADDRLP4 80
INDIRI4
ASGNI4
line 284
;284:	s_preferences.drawteamoverlay.curvalue	= Com_Clamp( 0, 3, trap_Cvar_VariableValue( "cg_drawTeamOverlay" ) );
ADDRGP4 $201
ARGP4
ADDRLP4 88
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_preferences+3232+92
ADDRLP4 92
INDIRF4
CVFI4 4
ASGNI4
line 285
;285:	s_preferences.allowdownload.curvalue	= trap_Cvar_VariableValue( "cl_allowDownload" ) != 0;
ADDRGP4 $204
ARGP4
ADDRLP4 100
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 0
EQF4 $206
ADDRLP4 96
CNSTI4 1
ASGNI4
ADDRGP4 $207
JUMPV
LABELV $206
ADDRLP4 96
CNSTI4 0
ASGNI4
LABELV $207
ADDRGP4 s_preferences+3364+88
ADDRLP4 96
INDIRI4
ASGNI4
line 286
;286:	s_preferences.botmenu.curvalue			= trap_Cvar_VariableValue( "uie_autoclosebotmenu" ) != 0;
ADDRGP4 $210
ARGP4
ADDRLP4 108
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 108
INDIRF4
CNSTF4 0
EQF4 $212
ADDRLP4 104
CNSTI4 1
ASGNI4
ADDRGP4 $213
JUMPV
LABELV $212
ADDRLP4 104
CNSTI4 0
ASGNI4
LABELV $213
ADDRGP4 s_preferences+3460+88
ADDRLP4 104
INDIRI4
ASGNI4
line 288
;287:
;288:	s_preferences.gibs.curvalue				= trap_Cvar_VariableValue( "cg_gibs" ) != 0;
ADDRGP4 $216
ARGP4
ADDRLP4 116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 116
INDIRF4
CNSTF4 0
EQF4 $218
ADDRLP4 112
CNSTI4 1
ASGNI4
ADDRGP4 $219
JUMPV
LABELV $218
ADDRLP4 112
CNSTI4 0
ASGNI4
LABELV $219
ADDRGP4 s_preferences+3556+88
ADDRLP4 112
INDIRI4
ASGNI4
line 289
;289:	s_preferences.blood.curvalue			= trap_Cvar_VariableValue( "com_blood" ) != 0;
ADDRGP4 $222
ARGP4
ADDRLP4 124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 124
INDIRF4
CNSTF4 0
EQF4 $224
ADDRLP4 120
CNSTI4 1
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $224
ADDRLP4 120
CNSTI4 0
ASGNI4
LABELV $225
ADDRGP4 s_preferences+3652+88
ADDRLP4 120
INDIRI4
ASGNI4
line 290
;290:	s_preferences.deferplayer.curvalue		= trap_Cvar_VariableValue( "cg_deferPlayers" ) != 0;
ADDRGP4 $228
ARGP4
ADDRLP4 132
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 132
INDIRF4
CNSTF4 0
EQF4 $230
ADDRLP4 128
CNSTI4 1
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $230
ADDRLP4 128
CNSTI4 0
ASGNI4
LABELV $231
ADDRGP4 s_preferences+3748+88
ADDRLP4 128
INDIRI4
ASGNI4
line 291
;291:	s_preferences.drawfps.curvalue			= trap_Cvar_VariableValue( "cg_drawFPS" ) != 0;
ADDRGP4 $234
ARGP4
ADDRLP4 140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 0
EQF4 $236
ADDRLP4 136
CNSTI4 1
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $236
ADDRLP4 136
CNSTI4 0
ASGNI4
LABELV $237
ADDRGP4 s_preferences+3844+88
ADDRLP4 136
INDIRI4
ASGNI4
line 292
;292:	s_preferences.drawtimer.curvalue		= trap_Cvar_VariableValue( "cg_drawTimer" ) != 0;
ADDRGP4 $240
ARGP4
ADDRLP4 148
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 148
INDIRF4
CNSTF4 0
EQF4 $242
ADDRLP4 144
CNSTI4 1
ASGNI4
ADDRGP4 $243
JUMPV
LABELV $242
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $243
ADDRGP4 s_preferences+3940+88
ADDRLP4 144
INDIRI4
ASGNI4
line 293
;293:	s_preferences.drawlagometer.curvalue	= trap_Cvar_VariableValue( "cg_lagometer" ) != 0;
ADDRGP4 $246
ARGP4
ADDRLP4 156
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 156
INDIRF4
CNSTF4 0
EQF4 $248
ADDRLP4 152
CNSTI4 1
ASGNI4
ADDRGP4 $249
JUMPV
LABELV $248
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $249
ADDRGP4 s_preferences+4036+88
ADDRLP4 152
INDIRI4
ASGNI4
line 294
;294:	s_preferences.drawgun.curvalue			= trap_Cvar_VariableValue( "cg_paintballMode" ) != 0;
ADDRGP4 $252
ARGP4
ADDRLP4 164
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 164
INDIRF4
CNSTF4 0
EQF4 $254
ADDRLP4 160
CNSTI4 1
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $254
ADDRLP4 160
CNSTI4 0
ASGNI4
LABELV $255
ADDRGP4 s_preferences+4132+88
ADDRLP4 160
INDIRI4
ASGNI4
line 295
;295:	s_preferences.predictitems.curvalue		= trap_Cvar_VariableValue( "cg_predictItems" ) != 0;
ADDRGP4 $258
ARGP4
ADDRLP4 172
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 172
INDIRF4
CNSTF4 0
EQF4 $260
ADDRLP4 168
CNSTI4 1
ASGNI4
ADDRGP4 $261
JUMPV
LABELV $260
ADDRLP4 168
CNSTI4 0
ASGNI4
LABELV $261
ADDRGP4 s_preferences+4228+88
ADDRLP4 168
INDIRI4
ASGNI4
line 296
;296:	s_preferences.smoothclient.curvalue		= trap_Cvar_VariableValue( "cg_smoothClients" ) != 0;
ADDRGP4 $264
ARGP4
ADDRLP4 180
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 180
INDIRF4
CNSTF4 0
EQF4 $266
ADDRLP4 176
CNSTI4 1
ASGNI4
ADDRGP4 $267
JUMPV
LABELV $266
ADDRLP4 176
CNSTI4 0
ASGNI4
LABELV $267
ADDRGP4 s_preferences+4324+88
ADDRLP4 176
INDIRI4
ASGNI4
line 297
;297:	s_preferences.shadows.curvalue			= Com_Clamp( 0, 3, trap_Cvar_VariableValue( "cg_shadows" ) );
ADDRGP4 $270
ARGP4
ADDRLP4 184
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRLP4 184
INDIRF4
ARGF4
ADDRLP4 188
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_preferences+4420+92
ADDRLP4 188
INDIRF4
CVFI4 4
ASGNI4
line 298
;298:	s_preferences.newESCmenu.curvalue		= trap_Cvar_VariableValue( "uie_ingame_dynamicmenu" ) != 0;
ADDRGP4 $273
ARGP4
ADDRLP4 196
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 196
INDIRF4
CNSTF4 0
EQF4 $275
ADDRLP4 192
CNSTI4 1
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $275
ADDRLP4 192
CNSTI4 0
ASGNI4
LABELV $276
ADDRGP4 s_preferences+4552+88
ADDRLP4 192
INDIRI4
ASGNI4
line 299
;299:	s_preferences.drawAmmoWarning.curvalue		= trap_Cvar_VariableValue( "cg_drawAmmoWarning" ) != 0;
ADDRGP4 $279
ARGP4
ADDRLP4 204
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 204
INDIRF4
CNSTF4 0
EQF4 $281
ADDRLP4 200
CNSTI4 1
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $281
ADDRLP4 200
CNSTI4 0
ASGNI4
LABELV $282
ADDRGP4 s_preferences+6104+88
ADDRLP4 200
INDIRI4
ASGNI4
line 301
;300:
;301:	s_preferences.oldrail.curvalue			= trap_Cvar_VariableValue( "cg_oldRail" ) != 0;
ADDRGP4 $285
ARGP4
ADDRLP4 212
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 212
INDIRF4
CNSTF4 0
EQF4 $287
ADDRLP4 208
CNSTI4 1
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $287
ADDRLP4 208
CNSTI4 0
ASGNI4
LABELV $288
ADDRGP4 s_preferences+6200+88
ADDRLP4 208
INDIRI4
ASGNI4
line 302
;302:	s_preferences.oldplasma.curvalue		= trap_Cvar_VariableValue( "cg_oldPlasma" ) != 0;
ADDRGP4 $291
ARGP4
ADDRLP4 220
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 220
INDIRF4
CNSTF4 0
EQF4 $293
ADDRLP4 216
CNSTI4 1
ASGNI4
ADDRGP4 $294
JUMPV
LABELV $293
ADDRLP4 216
CNSTI4 0
ASGNI4
LABELV $294
ADDRGP4 s_preferences+6296+88
ADDRLP4 216
INDIRI4
ASGNI4
line 303
;303:	s_preferences.oldrocket.curvalue		= trap_Cvar_VariableValue( "cg_oldRocket" ) != 0;
ADDRGP4 $297
ARGP4
ADDRLP4 228
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 228
INDIRF4
CNSTF4 0
EQF4 $299
ADDRLP4 224
CNSTI4 1
ASGNI4
ADDRGP4 $300
JUMPV
LABELV $299
ADDRLP4 224
CNSTI4 0
ASGNI4
LABELV $300
ADDRGP4 s_preferences+6392+88
ADDRLP4 224
INDIRI4
ASGNI4
line 304
;304:	s_preferences.truelightning.curvalue	= trap_Cvar_VariableValue( "cg_truelightning" ) != 0;
ADDRGP4 $303
ARGP4
ADDRLP4 236
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 236
INDIRF4
CNSTF4 0
EQF4 $305
ADDRLP4 232
CNSTI4 1
ASGNI4
ADDRGP4 $306
JUMPV
LABELV $305
ADDRLP4 232
CNSTI4 0
ASGNI4
LABELV $306
ADDRGP4 s_preferences+6488+88
ADDRLP4 232
INDIRI4
ASGNI4
line 307
;305:
;306:
;307:	trap_Cvar_VariableStringBuffer("cg_teamChatTime", s_preferences.teamchattime.field.buffer, 6);
ADDRGP4 $307
ARGP4
ADDRGP4 s_preferences+5012+88+12
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 308
;308:	trap_Cvar_VariableStringBuffer("com_maxfps", s_preferences.teamchatheight.field.buffer, 4);
ADDRGP4 $311
ARGP4
ADDRGP4 s_preferences+4648+88+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 309
;309:	trap_Cvar_VariableStringBuffer("cg_fov", s_preferences.fov.field.buffer, 4);
ADDRGP4 $315
ARGP4
ADDRGP4 s_preferences+5376+88+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 310
;310:	trap_Cvar_VariableStringBuffer("cg_zoomfov", s_preferences.zoomfov.field.buffer, 4);
ADDRGP4 $319
ARGP4
ADDRGP4 s_preferences+5740+88+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 311
;311:}
LABELV $132
endproc Preferences_SetMenuItems 240 12
proc Control_Update 100 0
line 321
;312:
;313:
;314:
;315:/*
;316:=================
;317:Control_Update
;318:=================
;319:*/
;320:static void Control_Update( void )
;321:{
line 328
;322:	int i, j;
;323:	menucommon_s** list;
;324:	menucommon_s*	control;
;325:	int	count, y;
;326:
;327:	// hide all controls
;328:	for (i = 0; i < C_MAX; i++)
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $324
line 329
;329:	{
line 330
;330:		list = g_control_list[i];
ADDRLP4 8
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_control_list
ADDP4
INDIRP4
ASGNP4
line 331
;331:		for ( j = 0; (control = list[j]); j++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $331
JUMPV
LABELV $328
line 332
;332:		{
line 333
;333:			control->flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 334
;334:		}
LABELV $329
line 331
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $331
ADDRLP4 24
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $328
line 335
;335:	}
LABELV $325
line 328
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 4
LTI4 $324
line 338
;336:
;337:	// count controls in current selection
;338:	list = g_control_list[s_preferences.section];
ADDRLP4 8
ADDRGP4 s_preferences+6740
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_control_list
ADDP4
INDIRP4
ASGNP4
line 339
;339:	for (count = 0; list[count]; count++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $336
JUMPV
LABELV $333
line 340
;340:		list[count]->flags &= ~ (QMF_HIDDEN|QMF_INACTIVE|QMF_GRAYED);
ADDRLP4 24
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTI4 -28673
CVIU4 4
BANDU4
ASGNU4
line 341
;341:	}
LABELV $334
line 339
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $336
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $333
line 344
;342:
;343:	// show current controls, centering vertically
;344:	y = (SCREEN_HEIGHT - (count * SMALLCHAR_LINEHEIGHT)) / 2;
ADDRLP4 24
CNSTI4 2
ASGNI4
ADDRLP4 12
CNSTI4 480
ADDRLP4 16
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
MULI4
SUBI4
ADDRLP4 24
INDIRI4
DIVI4
ASGNI4
line 345
;345:	for (j = 0; (control = list[j]); j++, y += (SMALLCHAR_LINEHEIGHT) )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $341
JUMPV
LABELV $338
line 346
;346:	{
line 347
;347:		control->x = CONTROL_X;
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTI4 360
ASGNI4
line 348
;348:		control->y = y;
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 349
;349:		control->left   = CONTROL_X - s_preferences.max_control_text * SMALLCHAR_WIDTH;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 360
ADDRGP4 s_preferences+6744
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ASGNI4
line 350
;350:		control->right  = CONTROL_X + 21*SMALLCHAR_WIDTH;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 21
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 360
ADDI4
ASGNI4
line 351
;351:		control->top    = y;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 352
;352:		control->bottom = y + SMALLCHAR_HEIGHT;
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 353
;353:	}
LABELV $339
line 345
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
LABELV $341
ADDRLP4 28
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $338
line 356
;354:
;355:	// set correct flags on tab controls
;356:	s_preferences.hud.generic.flags |= (QMF_PULSEIFFOCUS);
ADDRLP4 32
ADDRGP4 s_preferences+1412+72
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 357
;357:	s_preferences.render.generic.flags |= (QMF_PULSEIFFOCUS);
ADDRLP4 36
ADDRGP4 s_preferences+1516+72
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 358
;358:	s_preferences.objects.generic.flags |= (QMF_PULSEIFFOCUS);
ADDRLP4 40
ADDRGP4 s_preferences+1620+72
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 359
;359:	s_preferences.misc.generic.flags |= (QMF_PULSEIFFOCUS);
ADDRLP4 44
ADDRGP4 s_preferences+1724+72
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 361
;360:
;361:	s_preferences.hud.generic.flags &= ~ (QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 48
ADDRGP4 s_preferences+1412+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTI4 -8385
CVIU4 4
BANDU4
ASGNU4
line 362
;362:	s_preferences.render.generic.flags &= ~ (QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 52
ADDRGP4 s_preferences+1516+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTI4 -8385
CVIU4 4
BANDU4
ASGNU4
line 363
;363:	s_preferences.objects.generic.flags &= ~ (QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 56
ADDRGP4 s_preferences+1620+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTI4 -8385
CVIU4 4
BANDU4
ASGNU4
line 364
;364:	s_preferences.misc.generic.flags &= ~ (QMF_GRAYED|QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 60
ADDRGP4 s_preferences+1724+72
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTI4 -8385
CVIU4 4
BANDU4
ASGNU4
line 366
;365:
;366:	switch (s_preferences.section) {
ADDRLP4 64
ADDRGP4 s_preferences+6740
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
LTI4 $363
ADDRLP4 64
INDIRI4
CNSTI4 3
GTI4 $363
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $386
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $386
address $366
address $371
address $376
address $381
code
LABELV $366
line 368
;367:	case C_HUD:
;368:		s_preferences.hud.generic.flags &= ~(QMF_PULSEIFFOCUS);
ADDRLP4 68
ADDRGP4 s_preferences+1412+72
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTI4 -257
CVIU4 4
BANDU4
ASGNU4
line 369
;369:		s_preferences.hud.generic.flags |= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 72
ADDRGP4 s_preferences+1412+72
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRU4
CNSTU4 192
BORU4
ASGNU4
line 370
;370:		break;
ADDRGP4 $364
JUMPV
LABELV $371
line 373
;371:
;372:	case C_RENDER:
;373:		s_preferences.render.generic.flags &= ~(QMF_PULSEIFFOCUS);
ADDRLP4 76
ADDRGP4 s_preferences+1516+72
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTI4 -257
CVIU4 4
BANDU4
ASGNU4
line 374
;374:		s_preferences.render.generic.flags |= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 80
ADDRGP4 s_preferences+1516+72
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 192
BORU4
ASGNU4
line 375
;375:		break;
ADDRGP4 $364
JUMPV
LABELV $376
line 378
;376:
;377:	case C_OBJECTS:
;378:		s_preferences.objects.generic.flags &= ~(QMF_PULSEIFFOCUS);
ADDRLP4 84
ADDRGP4 s_preferences+1620+72
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRU4
CNSTI4 -257
CVIU4 4
BANDU4
ASGNU4
line 379
;379:		s_preferences.objects.generic.flags |= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 88
ADDRGP4 s_preferences+1620+72
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRU4
CNSTU4 192
BORU4
ASGNU4
line 380
;380:		break;
ADDRGP4 $364
JUMPV
LABELV $381
line 383
;381:
;382:	case C_MISC:
;383:		s_preferences.misc.generic.flags &= ~(QMF_PULSEIFFOCUS);
ADDRLP4 92
ADDRGP4 s_preferences+1724+72
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRU4
CNSTI4 -257
CVIU4 4
BANDU4
ASGNU4
line 384
;384:		s_preferences.misc.generic.flags |= (QMF_HIGHLIGHT|QMF_HIGHLIGHT_IF_FOCUS);
ADDRLP4 96
ADDRGP4 s_preferences+1724+72
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRU4
CNSTU4 192
BORU4
ASGNU4
line 385
;385:		break;
LABELV $363
LABELV $364
line 387
;386:	}
;387:}
LABELV $323
endproc Control_Update 100 0
proc Control_Init 28 4
line 397
;388:
;389:
;390:
;391:/*
;392:=================
;393:Control_Init
;394:=================
;395:*/
;396:static void Control_Init( void )
;397:{
line 403
;398:	int i, j, len, max;
;399:	menucommon_s **list;
;400:	menucommon_s *control;
;401:
;402:	// count longest string title and save it
;403:	max = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 404
;404:	for (i = 0; i < C_MAX; i++)
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $388
line 405
;405:	{
line 406
;406:		list = g_control_list[i];
ADDRLP4 12
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_control_list
ADDP4
INDIRP4
ASGNP4
line 407
;407:		for (j = 0; (control = list[j]); j++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $395
JUMPV
LABELV $392
line 408
;408:		{
line 409
;409:			if (control->name) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $396
line 410
;410:				len = strlenru(control->name) + 1;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strlenru
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 411
;411:				if (len > max)
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $398
line 412
;412:					max = len;
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $398
line 413
;413:			}
LABELV $396
line 414
;414:		}
LABELV $393
line 407
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $395
ADDRLP4 24
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $392
line 415
;415:	}
LABELV $389
line 404
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 4
LTI4 $388
line 417
;416:
;417:	s_preferences.max_control_text = max + 1;
ADDRGP4 s_preferences+6744
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 420
;418:
;419:	// prepare current tab
;420:	s_preferences.section = C_HUD;
ADDRGP4 s_preferences+6740
CNSTI4 0
ASGNI4
line 421
;421:	Control_Update();
ADDRGP4 Control_Update
CALLV
pop
line 422
;422:}
LABELV $387
endproc Control_Init 28 4
proc Preferences_InputEvent 24 12
line 426
;423:
;424:
;425:
;426:static void Preferences_InputEvent( void* ptr, int notification ) {
line 427
;427:	if( notification != QM_LOSTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $403
line 428
;428:		return;
ADDRGP4 $402
JUMPV
LABELV $403
line 431
;429:	}
;430:
;431:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 149
LTI4 $405
ADDRLP4 0
INDIRI4
CNSTI4 153
GTI4 $405
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $449-596
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $449
address $418
address $408
address $405
address $423
address $436
code
LABELV $408
line 433
;432:	case ID_TEAMCHATTIME:
;433:		if (atoi(s_preferences.teamchattime.field.buffer) <= 0) {
ADDRGP4 s_preferences+5012+88+12
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $406
line 434
;434:			Q_strncpyz(s_preferences.teamchattime.field.buffer, "5000", 5);
ADDRGP4 s_preferences+5012+88+12
ARGP4
ADDRGP4 $417
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 435
;435:		}
line 437
;436:		//trap_Cvar_Set( "cg_teamChatTime", s_preferences.teamchattime.field.buffer);
;437:		break;
ADDRGP4 $406
JUMPV
LABELV $418
line 440
;438:
;439:	case ID_TEAMCHATHEIGHT:
;440:		trap_Cmd_ExecuteText( EXEC_APPEND, va("seta com_maxfps %s\n", s_preferences.teamchatheight.field.buffer));
ADDRGP4 $419
ARGP4
ADDRGP4 s_preferences+4648+88+12
ARGP4
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
line 441
;441:		break;
ADDRGP4 $406
JUMPV
LABELV $423
line 444
;442:
;443:	case ID_FOV:
;444:		if (atoi(s_preferences.fov.field.buffer) <= 0) {
ADDRGP4 s_preferences+5376+88+12
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
GTI4 $424
line 445
;445:			Q_strncpyz(s_preferences.fov.field.buffer, "90", 3);
ADDRGP4 s_preferences+5376+88+12
ARGP4
ADDRGP4 $432
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 446
;446:		}
LABELV $424
line 447
;447:		trap_Cvar_Set( "cg_fov", s_preferences.fov.field.buffer);
ADDRGP4 $315
ARGP4
ADDRGP4 s_preferences+5376+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 448
;448:		break;
ADDRGP4 $406
JUMPV
LABELV $436
line 451
;449:
;450:	case ID_ZOOMFOV:
;451:		if (atoi(s_preferences.zoomfov.field.buffer) <= 0) {
ADDRGP4 s_preferences+5740+88+12
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
GTI4 $437
line 452
;452:			Q_strncpyz(s_preferences.zoomfov.field.buffer, "22", 3);
ADDRGP4 s_preferences+5740+88+12
ARGP4
ADDRGP4 $445
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 453
;453:		}
LABELV $437
line 454
;454:		trap_Cvar_Set( "cg_zoomfov", s_preferences.zoomfov.field.buffer);
ADDRGP4 $319
ARGP4
ADDRGP4 s_preferences+5740+88+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 455
;455:		break;
LABELV $405
LABELV $406
line 458
;456:	}
;457:
;458:}
LABELV $402
endproc Preferences_InputEvent 24 12
proc Preferences_Event 36 8
line 463
;459:
;460:
;461:
;462:
;463:static void Preferences_Event( void* ptr, int notification ) {
line 464
;464:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $452
line 465
;465:		return;
ADDRGP4 $451
JUMPV
LABELV $452
line 468
;466:	}
;467:
;468:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $454
ADDRLP4 0
INDIRI4
CNSTI4 53
GTI4 $588
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $589-200
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $589
address $457
address $466
address $468
address $470
code
LABELV $588
ADDRLP4 0
INDIRI4
CNSTI4 127
LTI4 $454
ADDRLP4 0
INDIRI4
CNSTI4 164
GTI4 $454
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $591-508
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $591
address $472
address $492
address $498
address $504
address $509
address $512
address $515
address $518
address $521
address $524
address $527
address $587
address $533
address $536
address $539
address $542
address $545
address $548
address $554
address $560
address $563
address $566
address $454
address $454
address $569
address $454
address $454
address $551
address $557
address $572
address $575
address $578
address $581
address $483
address $486
address $489
address $459
address $495
code
LABELV $457
line 470
;469:	case ID_HUD:
;470:		s_preferences.section = C_HUD;
ADDRGP4 s_preferences+6740
CNSTI4 0
ASGNI4
line 471
;471:		Control_Update();
ADDRGP4 Control_Update
CALLV
pop
line 472
;472:		break;
ADDRGP4 $455
JUMPV
LABELV $459
line 475
;473:
;474:    case ID_CROSSHAIRHEALTH:
;475:        s_preferences.crosshairColorRed.generic.flags       &= ~QMF_INACTIVE;
ADDRLP4 12
ADDRGP4 s_preferences+2056+72
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 476
;476:        s_preferences.crosshairColorGreen.generic.flags     &= ~QMF_INACTIVE;
ADDRLP4 16
ADDRGP4 s_preferences+2160+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 477
;477:        s_preferences.crosshairColorBlue.generic.flags      &= ~QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 s_preferences+2264+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 478
;478:		break;
ADDRGP4 $455
JUMPV
LABELV $466
line 481
;479:
;480:	case ID_RENDER:
;481:		s_preferences.section = C_RENDER;
ADDRGP4 s_preferences+6740
CNSTI4 1
ASGNI4
line 482
;482:		Control_Update();
ADDRGP4 Control_Update
CALLV
pop
line 483
;483:		break;
ADDRGP4 $455
JUMPV
LABELV $468
line 486
;484:
;485:	case ID_OBJECTS:
;486:		s_preferences.section = C_OBJECTS;
ADDRGP4 s_preferences+6740
CNSTI4 2
ASGNI4
line 487
;487:		Control_Update();
ADDRGP4 Control_Update
CALLV
pop
line 488
;488:		break;
ADDRGP4 $455
JUMPV
LABELV $470
line 491
;489:
;490:	case ID_MISC:
;491:		s_preferences.section = C_MISC;
ADDRGP4 s_preferences+6740
CNSTI4 3
ASGNI4
line 492
;492:		Control_Update();
ADDRGP4 Control_Update
CALLV
pop
line 493
;493:		break;
ADDRGP4 $455
JUMPV
LABELV $472
line 496
;494:
;495:	case ID_CROSSHAIR:
;496:		s_preferences.crosshair.curvalue++;
ADDRLP4 24
ADDRGP4 s_preferences+1828+92
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 497
;497:		if( s_preferences.crosshair.curvalue == NUM_CROSSHAIRS ) {
ADDRGP4 s_preferences+1828+92
INDIRI4
CNSTI4 10
NEI4 $475
line 498
;498:			s_preferences.crosshair.curvalue = 0;
ADDRGP4 s_preferences+1828+92
CNSTI4 0
ASGNI4
line 499
;499:		}
LABELV $475
line 500
;500:		trap_Cvar_SetValue( "cg_drawCrosshair", s_preferences.crosshair.curvalue );
ADDRGP4 $135
ARGP4
ADDRGP4 s_preferences+1828+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 501
;501:		break;
ADDRGP4 $455
JUMPV
LABELV $483
line 504
;502:
;503:        case ID_COLORRED:
;504:                trap_Cvar_SetValue( "cg_crosshairColorRed", ((float)s_preferences.crosshairColorRed.curvalue)/255.f );
ADDRGP4 $138
ARGP4
ADDRGP4 s_preferences+2056+96
INDIRF4
CNSTF4 1132396544
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 505
;505:                break;
ADDRGP4 $455
JUMPV
LABELV $486
line 508
;506:
;507:        case ID_COLORGREEN:
;508:                trap_Cvar_SetValue( "cg_crosshairColorGreen", ((float)s_preferences.crosshairColorGreen.curvalue)/255.f );
ADDRGP4 $141
ARGP4
ADDRGP4 s_preferences+2160+96
INDIRF4
CNSTF4 1132396544
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 509
;509:                break;
ADDRGP4 $455
JUMPV
LABELV $489
line 512
;510:
;511:        case ID_COLORBLUE:
;512:                trap_Cvar_SetValue( "cg_crosshairColorBlue", ((float)s_preferences.crosshairColorBlue.curvalue)/255.f );
ADDRGP4 $144
ARGP4
ADDRGP4 s_preferences+2264+96
INDIRF4
CNSTF4 1132396544
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 513
;513:                break;
ADDRGP4 $455
JUMPV
LABELV $492
line 516
;514:
;515:	case ID_SIMPLEITEMS:
;516:		trap_Cvar_SetValue( "cg_simpleItems", s_preferences.simpleitems.curvalue );
ADDRGP4 $147
ARGP4
ADDRGP4 s_preferences+2368+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 517
;517:		break;
ADDRGP4 $455
JUMPV
LABELV $495
line 520
;518:                
;519:        case ID_WEAPONBAR:
;520:		trap_Cvar_SetValue( "cg_alwaysWeaponBar", s_preferences.alwaysweaponbar.curvalue );
ADDRGP4 $153
ARGP4
ADDRGP4 s_preferences+2464+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 521
;521:		break;
ADDRGP4 $455
JUMPV
LABELV $498
line 524
;522:
;523:	case ID_HIGHQUALITYSKY:
;524:		trap_Cvar_SetValue( "r_fastsky", !s_preferences.highqualitysky.curvalue );
ADDRGP4 $183
ARGP4
ADDRGP4 s_preferences+2944+88
INDIRI4
CNSTI4 0
NEI4 $502
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $503
JUMPV
LABELV $502
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $503
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 525
;525:		break;
ADDRGP4 $455
JUMPV
LABELV $504
line 528
;526:
;527:	case ID_EJECTINGBRASS:
;528:		if ( s_preferences.brass.curvalue )
ADDRGP4 s_preferences+2560+88
INDIRI4
CNSTI4 0
EQI4 $505
line 529
;529:			trap_Cvar_Reset( "cg_brassTime" );
ADDRGP4 $159
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
ADDRGP4 $455
JUMPV
LABELV $505
line 531
;530:		else
;531:			trap_Cvar_SetValue( "cg_brassTime", 0 );
ADDRGP4 $159
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 532
;532:		break;
ADDRGP4 $455
JUMPV
LABELV $509
line 535
;533:
;534:	case ID_WALLMARKS:
;535:		trap_Cvar_SetValue( "cg_marks", s_preferences.wallmarks.curvalue );
ADDRGP4 $165
ARGP4
ADDRGP4 s_preferences+2656+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 536
;536:		break;
ADDRGP4 $455
JUMPV
LABELV $512
line 539
;537:
;538:	case ID_DYNAMICLIGHTS:
;539:		trap_Cvar_SetValue( "r_dynamiclight", s_preferences.dynamiclights.curvalue );
ADDRGP4 $177
ARGP4
ADDRGP4 s_preferences+2752+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 540
;540:		break;		
ADDRGP4 $455
JUMPV
LABELV $515
line 543
;541:
;542:	case ID_IDENTIFYTARGET:
;543:		trap_Cvar_SetValue( "cg_drawCrosshairNames", s_preferences.identifytarget.curvalue );
ADDRGP4 $171
ARGP4
ADDRGP4 s_preferences+2848+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 544
;544:		break;
ADDRGP4 $455
JUMPV
LABELV $518
line 547
;545:
;546:	case ID_SYNCEVERYFRAME:
;547:		trap_Cvar_SetValue( "r_swapInterval", s_preferences.synceveryframe.curvalue );
ADDRGP4 $189
ARGP4
ADDRGP4 s_preferences+3040+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 548
;548:		break;
ADDRGP4 $455
JUMPV
LABELV $521
line 551
;549:
;550:	case ID_FORCEMODEL:
;551:		trap_Cvar_SetValue( "cg_forcemodel", s_preferences.forcemodel.curvalue );
ADDRGP4 $195
ARGP4
ADDRGP4 s_preferences+3136+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 552
;552:		break;
ADDRGP4 $455
JUMPV
LABELV $524
line 555
;553:
;554:	case ID_DRAWTEAMOVERLAY:
;555:		trap_Cvar_SetValue( "cg_drawTeamOverlay", s_preferences.drawteamoverlay.curvalue );
ADDRGP4 $201
ARGP4
ADDRGP4 s_preferences+3232+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 556
;556:		break;
ADDRGP4 $455
JUMPV
LABELV $527
line 559
;557:
;558:	case ID_ALLOWDOWNLOAD:
;559:		trap_Cvar_SetValue( "cl_allowDownload", s_preferences.allowdownload.curvalue );
ADDRGP4 $204
ARGP4
ADDRGP4 s_preferences+3364+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 560
;560:		trap_Cvar_SetValue( "sv_allowDownload", s_preferences.allowdownload.curvalue );
ADDRGP4 $530
ARGP4
ADDRGP4 s_preferences+3364+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 561
;561:		break;
ADDRGP4 $455
JUMPV
LABELV $533
line 564
;562:
;563:	case ID_BOTMENU:
;564:		trap_Cvar_SetValue( "uie_autoclosebotmenu", s_preferences.botmenu.curvalue );
ADDRGP4 $210
ARGP4
ADDRGP4 s_preferences+3460+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 565
;565:		break;
ADDRGP4 $455
JUMPV
LABELV $536
line 568
;566:
;567:	case ID_GIBS:
;568:		trap_Cvar_SetValue( "cg_gibs", s_preferences.gibs.curvalue );
ADDRGP4 $216
ARGP4
ADDRGP4 s_preferences+3556+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 569
;569:		break;
ADDRGP4 $455
JUMPV
LABELV $539
line 572
;570:
;571:	case ID_BLOOD:
;572:		trap_Cvar_SetValue( "com_blood", s_preferences.blood.curvalue );
ADDRGP4 $222
ARGP4
ADDRGP4 s_preferences+3652+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 573
;573:		break;
ADDRGP4 $455
JUMPV
LABELV $542
line 576
;574:
;575:	case ID_DEFERPLAYER:
;576:		trap_Cvar_SetValue( "cg_deferPlayers", s_preferences.deferplayer.curvalue );
ADDRGP4 $228
ARGP4
ADDRGP4 s_preferences+3748+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 577
;577:		break;
ADDRGP4 $455
JUMPV
LABELV $545
line 580
;578:
;579:	case ID_DRAWFPS:
;580:		trap_Cvar_SetValue( "cg_drawFPS", s_preferences.drawfps.curvalue );
ADDRGP4 $234
ARGP4
ADDRGP4 s_preferences+3844+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 581
;581:		break;
ADDRGP4 $455
JUMPV
LABELV $548
line 584
;582:
;583:	case ID_DRAWTIMER:
;584:		trap_Cvar_SetValue( "cg_drawTimer", s_preferences.drawtimer.curvalue );
ADDRGP4 $240
ARGP4
ADDRGP4 s_preferences+3940+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 585
;585:		break;
ADDRGP4 $455
JUMPV
LABELV $551
line 588
;586:
;587:	case ID_AMMOWARNING:
;588:		trap_Cvar_SetValue( "cg_drawAmmoWarning", s_preferences.drawAmmoWarning.curvalue );
ADDRGP4 $279
ARGP4
ADDRGP4 s_preferences+6104+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 589
;589:		break;
ADDRGP4 $455
JUMPV
LABELV $554
line 592
;590:
;591:	case ID_LAGOMETER:
;592:		trap_Cvar_SetValue( "cg_lagometer", s_preferences.drawlagometer.curvalue );
ADDRGP4 $246
ARGP4
ADDRGP4 s_preferences+4036+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 593
;593:		break;
ADDRGP4 $455
JUMPV
LABELV $557
line 596
;594:
;595:	case ID_DRAWGUN:
;596:		trap_Cvar_SetValue( "cg_paintballMode", s_preferences.drawgun.curvalue );
ADDRGP4 $252
ARGP4
ADDRGP4 s_preferences+4132+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 597
;597:		break;
ADDRGP4 $455
JUMPV
LABELV $560
line 600
;598:
;599:	case ID_PREDICTITEMS:
;600:		trap_Cvar_SetValue( "cg_predictItems", s_preferences.predictitems.curvalue );
ADDRGP4 $258
ARGP4
ADDRGP4 s_preferences+4228+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 601
;601:		break;
ADDRGP4 $455
JUMPV
LABELV $563
line 604
;602:
;603:	case ID_SMOOTHCLIENTS:
;604:		trap_Cvar_SetValue( "cg_smoothClients", s_preferences.smoothclient.curvalue );
ADDRGP4 $264
ARGP4
ADDRGP4 s_preferences+4324+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 605
;605:		break;
ADDRGP4 $455
JUMPV
LABELV $566
line 608
;606:
;607:	case ID_SHADOWS:
;608:		trap_Cvar_SetValue( "cg_shadows", s_preferences.shadows.curvalue );
ADDRGP4 $270
ARGP4
ADDRGP4 s_preferences+4420+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 609
;609:		break;
ADDRGP4 $455
JUMPV
LABELV $569
line 612
;610:
;611:	case ID_NEWESCAPEMENU:
;612:		trap_Cvar_SetValue( "uie_ingame_dynamicmenu", s_preferences.newESCmenu.curvalue );
ADDRGP4 $273
ARGP4
ADDRGP4 s_preferences+4552+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 613
;613:		break;
ADDRGP4 $455
JUMPV
LABELV $572
line 616
;614:
;615:	case ID_OLDRAIL:
;616:		trap_Cvar_SetValue( "cg_oldRail", s_preferences.oldrail.curvalue );
ADDRGP4 $285
ARGP4
ADDRGP4 s_preferences+6200+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 617
;617:		break;
ADDRGP4 $455
JUMPV
LABELV $575
line 620
;618:
;619:	case ID_OLDPLASMA:
;620:		trap_Cvar_SetValue( "cg_oldPlasma", s_preferences.oldplasma.curvalue );
ADDRGP4 $291
ARGP4
ADDRGP4 s_preferences+6296+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 621
;621:		break;
ADDRGP4 $455
JUMPV
LABELV $578
line 624
;622:
;623:	case ID_OLDROCKET:
;624:		trap_Cvar_SetValue( "cg_oldRocket", s_preferences.oldrocket.curvalue );
ADDRGP4 $297
ARGP4
ADDRGP4 s_preferences+6392+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 625
;625:		break;
ADDRGP4 $455
JUMPV
LABELV $581
line 628
;626:
;627:	case ID_TRUELIGHTNING:
;628:		trap_Cvar_SetValue( "cg_truelightning", s_preferences.truelightning.curvalue ? 0.9 : 0.0);
ADDRGP4 $303
ARGP4
ADDRGP4 s_preferences+6488+88
INDIRI4
CNSTI4 0
EQI4 $585
ADDRLP4 32
CNSTF4 1063675494
ASGNF4
ADDRGP4 $586
JUMPV
LABELV $585
ADDRLP4 32
CNSTF4 0
ASGNF4
LABELV $586
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 629
;629:		break;
ADDRGP4 $455
JUMPV
LABELV $587
line 632
;630:
;631:	case ID_BACK:
;632:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 633
;633:		break;
LABELV $454
LABELV $455
line 635
;634:	}
;635:}
LABELV $451
endproc Preferences_Event 36 8
proc Crosshair_Draw 52 20
line 645
;636:
;637:
;638:
;639:
;640:/*
;641:=================
;642:Crosshair_Draw
;643:=================
;644:*/
;645:static void Crosshair_Draw( void *self ) {
line 653
;646:	menulist_s	*s;
;647:	float		*color;
;648:	int			x, y;
;649:	int			style;
;650:	qboolean	focus;
;651:        vec4_t          color4;
;652:
;653:	s = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 654
;654:	x = s->generic.x;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 655
;655:	y =	s->generic.y;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 657
;656:
;657:	style = UI_SMALLFONT;
ADDRLP4 36
CNSTI4 16
ASGNI4
line 658
;658:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $595
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRGP4 $596
JUMPV
LABELV $595
ADDRLP4 40
CNSTI4 0
ASGNI4
LABELV $596
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 660
;659:
;660:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $597
line 661
;661:		color = text_color_disabled;
ADDRLP4 28
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $598
JUMPV
LABELV $597
line 662
;662:	else if ( focus )
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $599
line 663
;663:	{
line 664
;664:		color = text_color_highlight;
ADDRLP4 28
ADDRGP4 text_color_highlight
ASGNP4
line 665
;665:		style |= UI_PULSE;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 666
;666:	}
ADDRGP4 $600
JUMPV
LABELV $599
line 667
;667:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $601
line 668
;668:	{
line 669
;669:		color = text_color_highlight;
ADDRLP4 28
ADDRGP4 text_color_highlight
ASGNP4
line 670
;670:		style |= UI_BLINK;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 671
;671:	}
ADDRGP4 $602
JUMPV
LABELV $601
line 673
;672:	else
;673:		color = text_color_normal;
ADDRLP4 28
ADDRGP4 text_color_normal
ASGNP4
LABELV $602
LABELV $600
LABELV $598
line 675
;674:
;675:	if ( focus )
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $603
line 676
;676:	{
line 679
;677:		// draw cursor
;678:		//UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
;679:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 680
;680:	}
LABELV $603
line 682
;681:
;682:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
ADDRLP4 20
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 683
;683:	if( !s->curvalue ) {
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 0
NEI4 $606
line 684
;684:		return;
ADDRGP4 $593
JUMPV
LABELV $606
line 686
;685:	}
;686:        color4[0]=((float)s_preferences.crosshairColorRed.curvalue)/255.f;
ADDRLP4 4
ADDRGP4 s_preferences+2056+96
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 687
;687:        color4[1]=((float)s_preferences.crosshairColorGreen.curvalue)/255.f;
ADDRLP4 4+4
ADDRGP4 s_preferences+2160+96
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 688
;688:        color4[2]=((float)s_preferences.crosshairColorBlue.curvalue)/255.f;
ADDRLP4 4+8
ADDRGP4 s_preferences+2264+96
INDIRF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 689
;689:        color4[3]=1.0f;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 690
;690:	trap_R_SetColor( color4 );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 691
;691:	UI_DrawHandlePic( x + SMALLCHAR_WIDTH, y - 4, 24, 24, s_preferences.crosshairShader[s->curvalue] );
ADDRLP4 20
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 48
CNSTF4 1103101952
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_preferences+6700
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 692
;692:}
LABELV $593
endproc Crosshair_Draw 52 20
proc Preferences_Statusbar 24 20
line 703
;693:
;694:
;695:
;696:
;697:/*
;698:=================
;699:Preferences_Statusbar
;700:=================
;701:*/
;702:static void Preferences_Statusbar(void* self)
;703:{
line 706
;704:	char* s;
;705:
;706:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $620
line 707
;707:	switch( ((menucommon_s*)self)->id ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 134
EQI4 $626
ADDRLP4 12
CNSTI4 136
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $636
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
GTI4 $647
LABELV $646
ADDRLP4 4
INDIRI4
CNSTI4 128
EQI4 $632
ADDRLP4 4
INDIRI4
CNSTI4 129
EQI4 $634
ADDRGP4 $623
JUMPV
LABELV $647
ADDRLP4 4
INDIRI4
CNSTI4 146
LTI4 $623
ADDRLP4 4
INDIRI4
CNSTI4 153
GTI4 $623
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $648-584
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $648
address $644
address $642
address $623
address $638
address $640
address $623
address $628
address $630
code
LABELV $626
line 709
;708:		case ID_SYNCEVERYFRAME:
;709:			s = "on = game waits for OpenGL calls to finish";
ADDRLP4 0
ADDRGP4 $627
ASGNP4
line 710
;710:			break;
ADDRGP4 $624
JUMPV
LABELV $628
line 712
;711:		case ID_FOV:
;712:			s = "Field of view angle (default = 90)";
ADDRLP4 0
ADDRGP4 $629
ASGNP4
line 713
;713:			break;
ADDRGP4 $624
JUMPV
LABELV $630
line 715
;714:		case ID_ZOOMFOV:
;715:			s = "Zoomed view angle";
ADDRLP4 0
ADDRGP4 $631
ASGNP4
line 716
;716:			break;
ADDRGP4 $624
JUMPV
LABELV $632
line 718
;717:		case ID_SIMPLEITEMS:
;718:			s = "Picture instead of 3D item";
ADDRLP4 0
ADDRGP4 $633
ASGNP4
line 719
;719:			break;
ADDRGP4 $624
JUMPV
LABELV $634
line 721
;720:		case ID_HIGHQUALITYSKY:
;721:			s = "off = no portal view of destination as well";
ADDRLP4 0
ADDRGP4 $635
ASGNP4
line 722
;722:			break;
ADDRGP4 $624
JUMPV
LABELV $636
line 724
;723:		case ID_DRAWTEAMOVERLAY:
;724:			s = "Team specific messages and info";
ADDRLP4 0
ADDRGP4 $637
ASGNP4
line 725
;725:			break;
ADDRGP4 $624
JUMPV
LABELV $638
line 727
;726:		case ID_TEAMCHATHEIGHT:
;727:			s = "FPS limit - it is recommended to set a supported value";
ADDRLP4 0
ADDRGP4 $639
ASGNP4
line 728
;728:			break;
ADDRGP4 $624
JUMPV
LABELV $640
line 730
;729:		case ID_TEAMCHATTIME:
;730:			s = "Max time in view (milli-seconds)";
ADDRLP4 0
ADDRGP4 $641
ASGNP4
line 731
;731:			break;
ADDRGP4 $624
JUMPV
LABELV $642
line 733
;732:		case ID_SMOOTHCLIENTS:
;733:			s = "Other players movement predicted";
ADDRLP4 0
ADDRGP4 $643
ASGNP4
line 734
;734:			break;
ADDRGP4 $624
JUMPV
LABELV $644
line 736
;735:		case ID_PREDICTITEMS:
;736:			s = "Item pickup predicted";
ADDRLP4 0
ADDRGP4 $645
ASGNP4
line 737
;737:			break;
LABELV $623
LABELV $624
line 739
;738:	}
;739:}
LABELV $620
line 740
;740:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $650
line 741
;741:	switch( ((menucommon_s*)self)->id ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 134
EQI4 $656
ADDRLP4 12
CNSTI4 136
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $666
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
GTI4 $677
LABELV $676
ADDRLP4 4
INDIRI4
CNSTI4 128
EQI4 $662
ADDRLP4 4
INDIRI4
CNSTI4 129
EQI4 $664
ADDRGP4 $653
JUMPV
LABELV $677
ADDRLP4 4
INDIRI4
CNSTI4 146
LTI4 $653
ADDRLP4 4
INDIRI4
CNSTI4 153
GTI4 $653
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $678-584
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $678
address $674
address $672
address $653
address $668
address $670
address $653
address $658
address $660
code
LABELV $656
line 743
;742:		case ID_SYNCEVERYFRAME:
;743:			s = "вкл = игра ожидает вызов завершения OpenGL";
ADDRLP4 0
ADDRGP4 $657
ASGNP4
line 744
;744:			break;
ADDRGP4 $654
JUMPV
LABELV $658
line 746
;745:		case ID_FOV:
;746:			s = "Поле зрения (стандарт = 90)";
ADDRLP4 0
ADDRGP4 $659
ASGNP4
line 747
;747:			break;
ADDRGP4 $654
JUMPV
LABELV $660
line 749
;748:		case ID_ZOOMFOV:
;749:			s = "Поле зрения в приближении";
ADDRLP4 0
ADDRGP4 $661
ASGNP4
line 750
;750:			break;
ADDRGP4 $654
JUMPV
LABELV $662
line 752
;751:		case ID_SIMPLEITEMS:
;752:			s = "Картинка вместо 3D предмета";
ADDRLP4 0
ADDRGP4 $663
ASGNP4
line 753
;753:			break;
ADDRGP4 $654
JUMPV
LABELV $664
line 755
;754:		case ID_HIGHQUALITYSKY:
;755:			s = "выкл = нету визуализированых порталов";
ADDRLP4 0
ADDRGP4 $665
ASGNP4
line 756
;756:			break;
ADDRGP4 $654
JUMPV
LABELV $666
line 758
;757:		case ID_DRAWTEAMOVERLAY:
;758:			s = "Информация о команде";
ADDRLP4 0
ADDRGP4 $667
ASGNP4
line 759
;759:			break;
ADDRGP4 $654
JUMPV
LABELV $668
line 761
;760:		case ID_TEAMCHATHEIGHT:
;761:			s = "Лимит FPS - рекомендуется ставить как у монитора";
ADDRLP4 0
ADDRGP4 $669
ASGNP4
line 762
;762:			break;
ADDRGP4 $654
JUMPV
LABELV $670
line 764
;763:		case ID_TEAMCHATTIME:
;764:			s = "Максимальное время отображения (миллисекунды)";
ADDRLP4 0
ADDRGP4 $671
ASGNP4
line 765
;765:			break;
ADDRGP4 $654
JUMPV
LABELV $672
line 767
;766:		case ID_SMOOTHCLIENTS:
;767:			s = "Игроки на стороне клиента";
ADDRLP4 0
ADDRGP4 $673
ASGNP4
line 768
;768:			break;
ADDRGP4 $654
JUMPV
LABELV $674
line 770
;769:		case ID_PREDICTITEMS:
;770:			s = "Предметы на стороне клиента";
ADDRLP4 0
ADDRGP4 $675
ASGNP4
line 771
;771:			break;
LABELV $653
LABELV $654
line 773
;772:	}
;773:}
LABELV $650
line 775
;774:
;775:	if (s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $680
line 776
;776:		UI_DrawString(320, 480 - 64, s, UI_CENTER|UI_SMALLFONT, color_white);
CNSTI4 320
ARGI4
CNSTI4 416
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $680
line 777
;777:}
LABELV $619
endproc Preferences_Statusbar 24 20
proc Preferences_MenuInit 12 12
line 783
;778:
;779:
;780:
;781:
;782:static void Preferences_MenuInit( void )
;783:{
line 784
;784:    UI_SetDefaultCvar("cg_crosshairColorRed","1");
ADDRGP4 $138
ARGP4
ADDRGP4 $683
ARGP4
ADDRGP4 UI_SetDefaultCvar
CALLV
pop
line 785
;785:    UI_SetDefaultCvar("cg_crosshairColorBlue","1");
ADDRGP4 $144
ARGP4
ADDRGP4 $683
ARGP4
ADDRGP4 UI_SetDefaultCvar
CALLV
pop
line 786
;786:    UI_SetDefaultCvar("cg_crosshairColorGreen","1");
ADDRGP4 $141
ARGP4
ADDRGP4 $683
ARGP4
ADDRGP4 UI_SetDefaultCvar
CALLV
pop
line 788
;787:
;788:	memset( &s_preferences, 0 ,sizeof(preferences_t) );
ADDRGP4 s_preferences
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6748
ARGI4
ADDRGP4 memset
CALLP4
pop
line 790
;789:
;790:	Preferences_Cache();
ADDRGP4 Preferences_Cache
CALLV
pop
line 792
;791:
;792:	s_preferences.menu.wrapAround = qtrue;
ADDRGP4 s_preferences+1044
CNSTI4 1
ASGNI4
line 793
;793:	s_preferences.menu.native 	   = qfalse;
ADDRGP4 s_preferences+1056
CNSTI4 0
ASGNI4
line 794
;794:	s_preferences.menu.fullscreen = qtrue;
ADDRGP4 s_preferences+1052
CNSTI4 1
ASGNI4
line 796
;795:
;796:	s_preferences.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_preferences+1076
CNSTI4 10
ASGNI4
line 797
;797:	s_preferences.banner.generic.x	   = 320;
ADDRGP4 s_preferences+1076+28
CNSTI4 320
ASGNI4
line 798
;798:	s_preferences.banner.generic.y	   = 16;
ADDRGP4 s_preferences+1076+32
CNSTI4 16
ASGNI4
line 799
;799:	s_preferences.banner.color         = color_white;
ADDRGP4 s_preferences+1076+100
ADDRGP4 color_white
ASGNP4
line 800
;800:	s_preferences.banner.style         = UI_CENTER;
ADDRGP4 s_preferences+1076+92
CNSTI4 1
ASGNI4
line 802
;801:
;802:	s_preferences.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_preferences+1180
CNSTI4 6
ASGNI4
line 803
;803:	s_preferences.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_preferences+1180+4
ADDRGP4 $699
ASGNP4
line 804
;804:	s_preferences.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_preferences+1180+72
CNSTU4 16384
ASGNU4
line 805
;805:	s_preferences.framel.generic.x	   = 0;
ADDRGP4 s_preferences+1180+28
CNSTI4 0
ASGNI4
line 806
;806:	s_preferences.framel.generic.y	   = 78;
ADDRGP4 s_preferences+1180+32
CNSTI4 78
ASGNI4
line 807
;807:	s_preferences.framel.width  	   = 256;
ADDRGP4 s_preferences+1180+104
CNSTI4 256
ASGNI4
line 808
;808:	s_preferences.framel.height  	   = 329;
ADDRGP4 s_preferences+1180+108
CNSTI4 329
ASGNI4
line 810
;809:
;810:	s_preferences.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_preferences+1296
CNSTI4 6
ASGNI4
line 811
;811:	s_preferences.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_preferences+1296+4
ADDRGP4 $713
ASGNP4
line 812
;812:	s_preferences.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_preferences+1296+72
CNSTU4 16384
ASGNU4
line 813
;813:	s_preferences.framer.generic.x	   = 376;
ADDRGP4 s_preferences+1296+28
CNSTI4 376
ASGNI4
line 814
;814:	s_preferences.framer.generic.y	   = 76;
ADDRGP4 s_preferences+1296+32
CNSTI4 76
ASGNI4
line 815
;815:	s_preferences.framer.width  	   = 256;
ADDRGP4 s_preferences+1296+104
CNSTI4 256
ASGNI4
line 816
;816:	s_preferences.framer.height  	   = 334;
ADDRGP4 s_preferences+1296+108
CNSTI4 334
ASGNI4
line 819
;817:
;818:
;819:	s_preferences.hud.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_preferences+1412
CNSTI4 9
ASGNI4
line 820
;820:	s_preferences.hud.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_preferences+1412+72
CNSTU4 272
ASGNU4
line 821
;821:	s_preferences.hud.generic.id	    = ID_HUD;
ADDRGP4 s_preferences+1412+24
CNSTI4 50
ASGNI4
line 822
;822:	s_preferences.hud.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+1412+76
ADDRGP4 Preferences_Event
ASGNP4
line 823
;823:	s_preferences.hud.generic.x	    = 152 - uis.wideoffset;
ADDRGP4 s_preferences+1412+28
CNSTI4 152
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 824
;824:	s_preferences.hud.generic.y	    = 240 - 2 * PROP_HEIGHT;
ADDRGP4 s_preferences+1412+32
CNSTI4 240
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 1
LSHI4
SUBI4
ASGNI4
line 825
;825:	s_preferences.hud.style			= UI_RIGHT;
ADDRGP4 s_preferences+1412+92
CNSTI4 2
ASGNI4
line 826
;826:	s_preferences.hud.color			= color_red;
ADDRGP4 s_preferences+1412+100
ADDRGP4 color_red
ASGNP4
line 828
;827:
;828:	s_preferences.render.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_preferences+1516
CNSTI4 9
ASGNI4
line 829
;829:	s_preferences.render.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_preferences+1516+72
CNSTU4 272
ASGNU4
line 830
;830:	s_preferences.render.generic.id	    = ID_RENDER;
ADDRGP4 s_preferences+1516+24
CNSTI4 51
ASGNI4
line 831
;831:	s_preferences.render.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+1516+76
ADDRGP4 Preferences_Event
ASGNP4
line 832
;832:	s_preferences.render.generic.x	    = 152 - uis.wideoffset;
ADDRGP4 s_preferences+1516+28
CNSTI4 152
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 833
;833:	s_preferences.render.generic.y	    = 240 - PROP_HEIGHT;
ADDRGP4 s_preferences+1516+32
CNSTI4 240
ADDRGP4 cl_propheight+12
INDIRI4
SUBI4
ASGNI4
line 834
;834:	s_preferences.render.style			= UI_RIGHT;
ADDRGP4 s_preferences+1516+92
CNSTI4 2
ASGNI4
line 835
;835:	s_preferences.render.color			= color_red;
ADDRGP4 s_preferences+1516+100
ADDRGP4 color_red
ASGNP4
line 837
;836:
;837:	s_preferences.objects.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_preferences+1620
CNSTI4 9
ASGNI4
line 838
;838:	s_preferences.objects.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_preferences+1620+72
CNSTU4 272
ASGNU4
line 839
;839:	s_preferences.objects.generic.id	    = ID_OBJECTS;
ADDRGP4 s_preferences+1620+24
CNSTI4 52
ASGNI4
line 840
;840:	s_preferences.objects.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+1620+76
ADDRGP4 Preferences_Event
ASGNP4
line 841
;841:	s_preferences.objects.generic.x	    = 152 - uis.wideoffset;
ADDRGP4 s_preferences+1620+28
CNSTI4 152
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 842
;842:	s_preferences.objects.generic.y	    = 240;
ADDRGP4 s_preferences+1620+32
CNSTI4 240
ASGNI4
line 843
;843:	s_preferences.objects.style			= UI_RIGHT;
ADDRGP4 s_preferences+1620+92
CNSTI4 2
ASGNI4
line 844
;844:	s_preferences.objects.color			= color_red;
ADDRGP4 s_preferences+1620+100
ADDRGP4 color_red
ASGNP4
line 846
;845:
;846:	s_preferences.misc.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_preferences+1724
CNSTI4 9
ASGNI4
line 847
;847:	s_preferences.misc.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_preferences+1724+72
CNSTU4 272
ASGNU4
line 848
;848:	s_preferences.misc.generic.id	    = ID_MISC;
ADDRGP4 s_preferences+1724+24
CNSTI4 53
ASGNI4
line 849
;849:	s_preferences.misc.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+1724+76
ADDRGP4 Preferences_Event
ASGNP4
line 850
;850:	s_preferences.misc.generic.x	    = 152 - uis.wideoffset;
ADDRGP4 s_preferences+1724+28
CNSTI4 152
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 851
;851:	s_preferences.misc.generic.y	    = 240 + PROP_HEIGHT;
ADDRGP4 s_preferences+1724+32
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 240
ADDI4
ASGNI4
line 852
;852:	s_preferences.misc.style			= UI_RIGHT;
ADDRGP4 s_preferences+1724+92
CNSTI4 2
ASGNI4
line 853
;853:	s_preferences.misc.color			= color_red;
ADDRGP4 s_preferences+1724+100
ADDRGP4 color_red
ASGNP4
line 855
;854:
;855:	s_preferences.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_preferences+6584
CNSTI4 6
ASGNI4
line 856
;856:	s_preferences.back.generic.name     = ART_BACK0;
ADDRGP4 s_preferences+6584+4
ADDRGP4 $794
ASGNP4
line 857
;857:	s_preferences.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_preferences+6584+72
CNSTU4 260
ASGNU4
line 858
;858:	s_preferences.back.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+6584+76
ADDRGP4 Preferences_Event
ASGNP4
line 859
;859:	s_preferences.back.generic.id	    = ID_BACK;
ADDRGP4 s_preferences+6584+24
CNSTI4 138
ASGNI4
line 860
;860:	s_preferences.back.generic.x		= 0 - uis.wideoffset;
ADDRGP4 s_preferences+6584+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 861
;861:	s_preferences.back.generic.y		= 480-64;
ADDRGP4 s_preferences+6584+32
CNSTI4 416
ASGNI4
line 862
;862:	s_preferences.back.width  		    = 128;
ADDRGP4 s_preferences+6584+104
CNSTI4 128
ASGNI4
line 863
;863:	s_preferences.back.height  		    = 64;
ADDRGP4 s_preferences+6584+108
CNSTI4 64
ASGNI4
line 864
;864:	s_preferences.back.focuspic         = ART_BACK1;
ADDRGP4 s_preferences+6584+88
ADDRGP4 $812
ASGNP4
line 869
;865:
;866:
;867:	// tabbed controls
;868:
;869:	s_preferences.crosshair.generic.type		= MTYPE_TEXT;
ADDRGP4 s_preferences+1828
CNSTI4 7
ASGNI4
line 870
;870:	s_preferences.crosshair.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_OWNERDRAW;
ADDRGP4 s_preferences+1828+72
CNSTU4 98562
ASGNU4
line 871
;871:	s_preferences.crosshair.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+1828+76
ADDRGP4 Preferences_Event
ASGNP4
line 872
;872:	s_preferences.crosshair.generic.ownerdraw	= Crosshair_Draw;
ADDRGP4 s_preferences+1828+84
ADDRGP4 Crosshair_Draw
ASGNP4
line 873
;873:	s_preferences.crosshair.generic.id			= ID_CROSSHAIR;
ADDRGP4 s_preferences+1828+24
CNSTI4 127
ASGNI4
line 875
;874:
;875:	s_preferences.crosshairHealth.generic.type        = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1960
CNSTI4 5
ASGNI4
line 876
;876:	s_preferences.crosshairHealth.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_OWNERDRAW;
ADDRGP4 s_preferences+1960+72
CNSTU4 98562
ASGNU4
line 877
;877:	s_preferences.crosshairHealth.generic.callback    = Preferences_Event;
ADDRGP4 s_preferences+1960+76
ADDRGP4 Preferences_Event
ASGNP4
line 878
;878:	s_preferences.crosshairHealth.generic.id          = ID_CROSSHAIRHEALTH;
ADDRGP4 s_preferences+1960+24
CNSTI4 163
ASGNI4
line 880
;879:
;880:     s_preferences.crosshairColorRed.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_preferences+2056
CNSTI4 1
ASGNI4
line 881
;881:	s_preferences.crosshairColorRed.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_OWNERDRAW;
ADDRGP4 s_preferences+2056+72
CNSTU4 98562
ASGNU4
line 882
;882:	s_preferences.crosshairColorRed.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+2056+76
ADDRGP4 Preferences_Event
ASGNP4
line 883
;883:	s_preferences.crosshairColorRed.generic.id		= ID_COLORRED;
ADDRGP4 s_preferences+2056+24
CNSTI4 160
ASGNI4
line 884
;884:	s_preferences.crosshairColorRed.minvalue			= 0.0f;
ADDRGP4 s_preferences+2056+88
CNSTF4 0
ASGNF4
line 885
;885:	s_preferences.crosshairColorRed.maxvalue			= 255.0f;
ADDRGP4 s_preferences+2056+92
CNSTF4 1132396544
ASGNF4
line 887
;886:
;887:    s_preferences.crosshairColorGreen.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_preferences+2160
CNSTI4 1
ASGNI4
line 888
;888:	s_preferences.crosshairColorGreen.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_OWNERDRAW;
ADDRGP4 s_preferences+2160+72
CNSTU4 98562
ASGNU4
line 889
;889:	s_preferences.crosshairColorGreen.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+2160+76
ADDRGP4 Preferences_Event
ASGNP4
line 890
;890:	s_preferences.crosshairColorGreen.generic.id		= ID_COLORGREEN;
ADDRGP4 s_preferences+2160+24
CNSTI4 161
ASGNI4
line 891
;891:	s_preferences.crosshairColorGreen.minvalue			= 0.0f;
ADDRGP4 s_preferences+2160+88
CNSTF4 0
ASGNF4
line 892
;892:	s_preferences.crosshairColorGreen.maxvalue			= 255.0f;
ADDRGP4 s_preferences+2160+92
CNSTF4 1132396544
ASGNF4
line 894
;893:
;894:    s_preferences.crosshairColorBlue.generic.type		= MTYPE_SLIDER;
ADDRGP4 s_preferences+2264
CNSTI4 1
ASGNI4
line 895
;895:	s_preferences.crosshairColorBlue.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_OWNERDRAW;
ADDRGP4 s_preferences+2264+72
CNSTU4 98562
ASGNU4
line 896
;896:	s_preferences.crosshairColorBlue.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+2264+76
ADDRGP4 Preferences_Event
ASGNP4
line 897
;897:	s_preferences.crosshairColorBlue.generic.id		= ID_COLORBLUE;
ADDRGP4 s_preferences+2264+24
CNSTI4 162
ASGNI4
line 898
;898:	s_preferences.crosshairColorBlue.minvalue			= 0.0f;
ADDRGP4 s_preferences+2264+88
CNSTF4 0
ASGNF4
line 899
;899:	s_preferences.crosshairColorBlue.maxvalue			= 255.0f;
ADDRGP4 s_preferences+2264+92
CNSTF4 1132396544
ASGNF4
line 902
;900:
;901:
;902:        if(s_preferences.crosshairHealth.curvalue) {
ADDRGP4 s_preferences+1960+88
INDIRI4
CNSTI4 0
EQI4 $862
line 903
;903:            s_preferences.crosshairColorRed.generic.flags       |= QMF_INACTIVE;
ADDRLP4 0
ADDRGP4 s_preferences+2056+72
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 904
;904:            s_preferences.crosshairColorGreen.generic.flags       |= QMF_INACTIVE;
ADDRLP4 4
ADDRGP4 s_preferences+2160+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 905
;905:            s_preferences.crosshairColorBlue.generic.flags       |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_preferences+2264+72
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 906
;906:        }
LABELV $862
line 909
;907:
;908:        //Elimination
;909:	s_preferences.alwaysweaponbar.generic.type        = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+2464
CNSTI4 5
ASGNI4
line 910
;910:	s_preferences.alwaysweaponbar.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_OWNERDRAW;
ADDRGP4 s_preferences+2464+72
CNSTU4 98562
ASGNU4
line 911
;911:	s_preferences.alwaysweaponbar.generic.callback    = Preferences_Event;
ADDRGP4 s_preferences+2464+76
ADDRGP4 Preferences_Event
ASGNP4
line 912
;912:	s_preferences.alwaysweaponbar.generic.id          = ID_WEAPONBAR;
ADDRGP4 s_preferences+2464+24
CNSTI4 164
ASGNI4
line 914
;913:
;914:	s_preferences.simpleitems.generic.type        = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+2368
CNSTI4 5
ASGNI4
line 915
;915:	s_preferences.simpleitems.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+2368+72
CNSTU4 258
ASGNU4
line 916
;916:	s_preferences.simpleitems.generic.callback    = Preferences_Event;
ADDRGP4 s_preferences+2368+76
ADDRGP4 Preferences_Event
ASGNP4
line 917
;917:	s_preferences.simpleitems.generic.statusbar= Preferences_Statusbar;
ADDRGP4 s_preferences+2368+80
ADDRGP4 Preferences_Statusbar
ASGNP4
line 918
;918:	s_preferences.simpleitems.generic.id          = ID_SIMPLEITEMS;
ADDRGP4 s_preferences+2368+24
CNSTI4 128
ASGNI4
line 920
;919:
;920:	s_preferences.wallmarks.generic.type          = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+2656
CNSTI4 5
ASGNI4
line 921
;921:	s_preferences.wallmarks.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+2656+72
CNSTU4 258
ASGNU4
line 922
;922:	s_preferences.wallmarks.generic.callback      = Preferences_Event;
ADDRGP4 s_preferences+2656+76
ADDRGP4 Preferences_Event
ASGNP4
line 923
;923:	s_preferences.wallmarks.generic.id            = ID_WALLMARKS;
ADDRGP4 s_preferences+2656+24
CNSTI4 131
ASGNI4
line 925
;924:
;925:	s_preferences.brass.generic.type              = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+2560
CNSTI4 5
ASGNI4
line 926
;926:	s_preferences.brass.generic.flags	          = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+2560+72
CNSTU4 258
ASGNU4
line 927
;927:	s_preferences.brass.generic.callback          = Preferences_Event;
ADDRGP4 s_preferences+2560+76
ADDRGP4 Preferences_Event
ASGNP4
line 928
;928:	s_preferences.brass.generic.id                = ID_EJECTINGBRASS;
ADDRGP4 s_preferences+2560+24
CNSTI4 130
ASGNI4
line 930
;929:
;930:	s_preferences.dynamiclights.generic.type      = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+2752
CNSTI4 5
ASGNI4
line 931
;931:	s_preferences.dynamiclights.generic.flags     = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+2752+72
CNSTU4 258
ASGNU4
line 932
;932:	s_preferences.dynamiclights.generic.callback  = Preferences_Event;
ADDRGP4 s_preferences+2752+76
ADDRGP4 Preferences_Event
ASGNP4
line 933
;933:	s_preferences.dynamiclights.generic.id        = ID_DYNAMICLIGHTS;
ADDRGP4 s_preferences+2752+24
CNSTI4 132
ASGNI4
line 935
;934:
;935:	s_preferences.highqualitysky.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+2944
CNSTI4 5
ASGNI4
line 936
;936:	s_preferences.highqualitysky.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+2944+72
CNSTU4 258
ASGNU4
line 937
;937:	s_preferences.highqualitysky.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+2944+76
ADDRGP4 Preferences_Event
ASGNP4
line 938
;938:	s_preferences.highqualitysky.generic.statusbar= Preferences_Statusbar;
ADDRGP4 s_preferences+2944+80
ADDRGP4 Preferences_Statusbar
ASGNP4
line 939
;939:	s_preferences.highqualitysky.generic.id       = ID_HIGHQUALITYSKY;
ADDRGP4 s_preferences+2944+24
CNSTI4 129
ASGNI4
line 941
;940:
;941:	s_preferences.shadows.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_preferences+4420
CNSTI4 3
ASGNI4
line 942
;942:	s_preferences.shadows.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+4420+72
CNSTU4 258
ASGNU4
line 943
;943:	s_preferences.shadows.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+4420+76
ADDRGP4 Preferences_Event
ASGNP4
line 944
;944:	s_preferences.shadows.generic.id       = ID_SHADOWS;
ADDRGP4 s_preferences+4420+24
CNSTI4 148
ASGNI4
line 946
;945:
;946:	s_preferences.gibs.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+3556
CNSTI4 5
ASGNI4
line 947
;947:	s_preferences.gibs.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+3556+72
CNSTU4 258
ASGNU4
line 948
;948:	s_preferences.gibs.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+3556+76
ADDRGP4 Preferences_Event
ASGNP4
line 949
;949:	s_preferences.gibs.generic.id       = ID_GIBS;
ADDRGP4 s_preferences+3556+24
CNSTI4 140
ASGNI4
line 951
;950:
;951:	s_preferences.blood.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+3652
CNSTI4 5
ASGNI4
line 952
;952:	s_preferences.blood.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+3652+72
CNSTU4 258
ASGNU4
line 953
;953:	s_preferences.blood.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+3652+76
ADDRGP4 Preferences_Event
ASGNP4
line 954
;954:	s_preferences.blood.generic.id       = ID_BLOOD;
ADDRGP4 s_preferences+3652+24
CNSTI4 141
ASGNI4
line 956
;955:
;956:	s_preferences.identifytarget.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+2848
CNSTI4 5
ASGNI4
line 957
;957:	s_preferences.identifytarget.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+2848+72
CNSTU4 258
ASGNU4
line 958
;958:	s_preferences.identifytarget.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+2848+76
ADDRGP4 Preferences_Event
ASGNP4
line 959
;959:	s_preferences.identifytarget.generic.id       = ID_IDENTIFYTARGET;
ADDRGP4 s_preferences+2848+24
CNSTI4 133
ASGNI4
line 961
;960:
;961:	s_preferences.drawfps.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+3844
CNSTI4 5
ASGNI4
line 962
;962:	s_preferences.drawfps.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+3844+72
CNSTU4 258
ASGNU4
line 963
;963:	s_preferences.drawfps.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+3844+76
ADDRGP4 Preferences_Event
ASGNP4
line 964
;964:	s_preferences.drawfps.generic.id       = ID_DRAWFPS;
ADDRGP4 s_preferences+3844+24
CNSTI4 143
ASGNI4
line 966
;965:
;966:	s_preferences.drawtimer.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+3940
CNSTI4 5
ASGNI4
line 967
;967:	s_preferences.drawtimer.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+3940+72
CNSTU4 258
ASGNU4
line 968
;968:	s_preferences.drawtimer.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+3940+76
ADDRGP4 Preferences_Event
ASGNP4
line 969
;969:	s_preferences.drawtimer.generic.id       = ID_DRAWTIMER;
ADDRGP4 s_preferences+3940+24
CNSTI4 144
ASGNI4
line 971
;970:
;971:	s_preferences.drawlagometer.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+4036
CNSTI4 5
ASGNI4
line 972
;972:	s_preferences.drawlagometer.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+4036+72
CNSTU4 258
ASGNU4
line 973
;973:	s_preferences.drawlagometer.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+4036+76
ADDRGP4 Preferences_Event
ASGNP4
line 974
;974:	s_preferences.drawlagometer.generic.id       = ID_LAGOMETER;
ADDRGP4 s_preferences+4036+24
CNSTI4 145
ASGNI4
line 976
;975:
;976:	s_preferences.drawAmmoWarning.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+6104
CNSTI4 5
ASGNI4
line 977
;977:	s_preferences.drawAmmoWarning.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+6104+72
CNSTU4 258
ASGNU4
line 978
;978:	s_preferences.drawAmmoWarning.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+6104+76
ADDRGP4 Preferences_Event
ASGNP4
line 979
;979:	s_preferences.drawAmmoWarning.generic.id       = ID_AMMOWARNING;
ADDRGP4 s_preferences+6104+24
CNSTI4 154
ASGNI4
line 981
;980:
;981:	s_preferences.drawgun.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+4132
CNSTI4 5
ASGNI4
line 982
;982:	s_preferences.drawgun.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+4132+72
CNSTU4 258
ASGNU4
line 983
;983:	s_preferences.drawgun.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+4132+76
ADDRGP4 Preferences_Event
ASGNP4
line 984
;984:	s_preferences.drawgun.generic.id       = ID_DRAWGUN;
ADDRGP4 s_preferences+4132+24
CNSTI4 155
ASGNI4
line 986
;985:
;986:	s_preferences.drawteamoverlay.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_preferences+3232
CNSTI4 3
ASGNI4
line 987
;987:	s_preferences.drawteamoverlay.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+3232+72
CNSTU4 258
ASGNU4
line 988
;988:	s_preferences.drawteamoverlay.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+3232+76
ADDRGP4 Preferences_Event
ASGNP4
line 989
;989:	s_preferences.drawteamoverlay.generic.statusbar= Preferences_Statusbar;
ADDRGP4 s_preferences+3232+80
ADDRGP4 Preferences_Statusbar
ASGNP4
line 990
;990:	s_preferences.drawteamoverlay.generic.id       = ID_DRAWTEAMOVERLAY;
ADDRGP4 s_preferences+3232+24
CNSTI4 136
ASGNI4
line 992
;991:
;992:	s_preferences.teamchatheight.generic.type       = MTYPE_FIELD;
ADDRGP4 s_preferences+4648
CNSTI4 4
ASGNI4
line 993
;993:	s_preferences.teamchatheight.generic.id		= ID_TEAMCHATHEIGHT;
ADDRGP4 s_preferences+4648+24
CNSTI4 149
ASGNI4
line 994
;994:	s_preferences.teamchatheight.generic.callback	= Preferences_InputEvent;
ADDRGP4 s_preferences+4648+76
ADDRGP4 Preferences_InputEvent
ASGNP4
line 995
;995:	s_preferences.teamchatheight.generic.statusbar= Preferences_Statusbar;
ADDRGP4 s_preferences+4648+80
ADDRGP4 Preferences_Statusbar
ASGNP4
line 996
;996:	s_preferences.teamchatheight.generic.flags      = QMF_SMALLFONT|QMF_PULSEIFFOCUS|QMF_NUMBERSONLY;
ADDRGP4 s_preferences+4648+72
CNSTU4 290
ASGNU4
line 997
;997:	s_preferences.teamchatheight.field.widthInChars = 3;
ADDRGP4 s_preferences+4648+88+8
CNSTI4 3
ASGNI4
line 998
;998:	s_preferences.teamchatheight.field.maxchars     = 3;
ADDRGP4 s_preferences+4648+88+268
CNSTI4 3
ASGNI4
line 1000
;999:
;1000:	s_preferences.teamchattime.generic.type       = MTYPE_FIELD;
ADDRGP4 s_preferences+5012
CNSTI4 4
ASGNI4
line 1001
;1001:	s_preferences.teamchattime.generic.id		= ID_TEAMCHATTIME;
ADDRGP4 s_preferences+5012+24
CNSTI4 150
ASGNI4
line 1002
;1002:	s_preferences.teamchattime.generic.callback	= Preferences_InputEvent;
ADDRGP4 s_preferences+5012+76
ADDRGP4 Preferences_InputEvent
ASGNP4
line 1003
;1003:	s_preferences.teamchattime.generic.statusbar= Preferences_Statusbar;
ADDRGP4 s_preferences+5012+80
ADDRGP4 Preferences_Statusbar
ASGNP4
line 1004
;1004:	s_preferences.teamchattime.generic.flags      = QMF_SMALLFONT|QMF_PULSEIFFOCUS|QMF_NUMBERSONLY;
ADDRGP4 s_preferences+5012+72
CNSTU4 290
ASGNU4
line 1005
;1005:	s_preferences.teamchattime.field.widthInChars = 5;
ADDRGP4 s_preferences+5012+88+8
CNSTI4 5
ASGNI4
line 1006
;1006:	s_preferences.teamchattime.field.maxchars     = 5;
ADDRGP4 s_preferences+5012+88+268
CNSTI4 5
ASGNI4
line 1008
;1007:
;1008:	s_preferences.fov.generic.type       = MTYPE_FIELD;
ADDRGP4 s_preferences+5376
CNSTI4 4
ASGNI4
line 1009
;1009:	s_preferences.fov.generic.id		= ID_FOV;
ADDRGP4 s_preferences+5376+24
CNSTI4 152
ASGNI4
line 1010
;1010:	s_preferences.fov.generic.callback	= Preferences_InputEvent;
ADDRGP4 s_preferences+5376+76
ADDRGP4 Preferences_InputEvent
ASGNP4
line 1011
;1011:	s_preferences.fov.generic.statusbar= Preferences_Statusbar;
ADDRGP4 s_preferences+5376+80
ADDRGP4 Preferences_Statusbar
ASGNP4
line 1012
;1012:	s_preferences.fov.generic.flags      = QMF_SMALLFONT|QMF_PULSEIFFOCUS|QMF_NUMBERSONLY;
ADDRGP4 s_preferences+5376+72
CNSTU4 290
ASGNU4
line 1013
;1013:	s_preferences.fov.field.widthInChars = 3;
ADDRGP4 s_preferences+5376+88+8
CNSTI4 3
ASGNI4
line 1014
;1014:	s_preferences.fov.field.maxchars     = 3;
ADDRGP4 s_preferences+5376+88+268
CNSTI4 3
ASGNI4
line 1016
;1015:
;1016:	s_preferences.zoomfov.generic.type       = MTYPE_FIELD;
ADDRGP4 s_preferences+5740
CNSTI4 4
ASGNI4
line 1017
;1017:	s_preferences.zoomfov.generic.id		= ID_ZOOMFOV;
ADDRGP4 s_preferences+5740+24
CNSTI4 153
ASGNI4
line 1018
;1018:	s_preferences.zoomfov.generic.callback	= Preferences_InputEvent;
ADDRGP4 s_preferences+5740+76
ADDRGP4 Preferences_InputEvent
ASGNP4
line 1019
;1019:	s_preferences.zoomfov.generic.statusbar= Preferences_Statusbar;
ADDRGP4 s_preferences+5740+80
ADDRGP4 Preferences_Statusbar
ASGNP4
line 1020
;1020:	s_preferences.zoomfov.generic.flags      = QMF_SMALLFONT|QMF_PULSEIFFOCUS|QMF_NUMBERSONLY;
ADDRGP4 s_preferences+5740+72
CNSTU4 290
ASGNU4
line 1021
;1021:	s_preferences.zoomfov.field.widthInChars = 3;
ADDRGP4 s_preferences+5740+88+8
CNSTI4 3
ASGNI4
line 1022
;1022:	s_preferences.zoomfov.field.maxchars     = 3;
ADDRGP4 s_preferences+5740+88+268
CNSTI4 3
ASGNI4
line 1024
;1023:
;1024:	s_preferences.predictitems.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+4228
CNSTI4 5
ASGNI4
line 1025
;1025:	s_preferences.predictitems.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+4228+72
CNSTU4 258
ASGNU4
line 1026
;1026:	s_preferences.predictitems.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+4228+76
ADDRGP4 Preferences_Event
ASGNP4
line 1027
;1027:	s_preferences.predictitems.generic.statusbar= Preferences_Statusbar;
ADDRGP4 s_preferences+4228+80
ADDRGP4 Preferences_Statusbar
ASGNP4
line 1028
;1028:	s_preferences.predictitems.generic.id       = ID_PREDICTITEMS;
ADDRGP4 s_preferences+4228+24
CNSTI4 146
ASGNI4
line 1030
;1029:
;1030:	s_preferences.smoothclient.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+4324
CNSTI4 5
ASGNI4
line 1031
;1031:	s_preferences.smoothclient.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+4324+72
CNSTU4 258
ASGNU4
line 1032
;1032:	s_preferences.smoothclient.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+4324+76
ADDRGP4 Preferences_Event
ASGNP4
line 1033
;1033:	s_preferences.smoothclient.generic.statusbar= Preferences_Statusbar;
ADDRGP4 s_preferences+4324+80
ADDRGP4 Preferences_Statusbar
ASGNP4
line 1034
;1034:	s_preferences.smoothclient.generic.id       = ID_SMOOTHCLIENTS;
ADDRGP4 s_preferences+4324+24
CNSTI4 147
ASGNI4
line 1036
;1035:
;1036:	s_preferences.forcemodel.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+3136
CNSTI4 5
ASGNI4
line 1037
;1037:	s_preferences.forcemodel.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+3136+72
CNSTU4 258
ASGNU4
line 1038
;1038:	s_preferences.forcemodel.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+3136+76
ADDRGP4 Preferences_Event
ASGNP4
line 1039
;1039:	s_preferences.forcemodel.generic.id       = ID_FORCEMODEL;
ADDRGP4 s_preferences+3136+24
CNSTI4 135
ASGNI4
line 1041
;1040:
;1041:	s_preferences.oldrail.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+6200
CNSTI4 5
ASGNI4
line 1042
;1042:	s_preferences.oldrail.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+6200+72
CNSTU4 258
ASGNU4
line 1043
;1043:	s_preferences.oldrail.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+6200+76
ADDRGP4 Preferences_Event
ASGNP4
line 1044
;1044:	s_preferences.oldrail.generic.id       = ID_OLDRAIL;
ADDRGP4 s_preferences+6200+24
CNSTI4 156
ASGNI4
line 1046
;1045:
;1046:	s_preferences.oldplasma.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+6296
CNSTI4 5
ASGNI4
line 1047
;1047:	s_preferences.oldplasma.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+6296+72
CNSTU4 258
ASGNU4
line 1048
;1048:	s_preferences.oldplasma.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+6296+76
ADDRGP4 Preferences_Event
ASGNP4
line 1049
;1049:	s_preferences.oldplasma.generic.id       = ID_OLDPLASMA;
ADDRGP4 s_preferences+6296+24
CNSTI4 157
ASGNI4
line 1051
;1050:
;1051:	s_preferences.oldrocket.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+6392
CNSTI4 5
ASGNI4
line 1052
;1052:	s_preferences.oldrocket.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+6392+72
CNSTU4 258
ASGNU4
line 1053
;1053:	s_preferences.oldrocket.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+6392+76
ADDRGP4 Preferences_Event
ASGNP4
line 1054
;1054:	s_preferences.oldrocket.generic.id       = ID_OLDROCKET;
ADDRGP4 s_preferences+6392+24
CNSTI4 158
ASGNI4
line 1056
;1055:
;1056:	s_preferences.truelightning.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+6488
CNSTI4 5
ASGNI4
line 1057
;1057:	s_preferences.truelightning.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+6488+72
CNSTU4 258
ASGNU4
line 1058
;1058:	s_preferences.truelightning.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+6488+76
ADDRGP4 Preferences_Event
ASGNP4
line 1059
;1059:	s_preferences.truelightning.generic.id       = ID_TRUELIGHTNING;
ADDRGP4 s_preferences+6488+24
CNSTI4 159
ASGNI4
line 1062
;1060:
;1061:
;1062:	s_preferences.deferplayer.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+3748
CNSTI4 5
ASGNI4
line 1063
;1063:	s_preferences.deferplayer.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+3748+72
CNSTU4 258
ASGNU4
line 1064
;1064:	s_preferences.deferplayer.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+3748+76
ADDRGP4 Preferences_Event
ASGNP4
line 1065
;1065:	s_preferences.deferplayer.generic.id       = ID_DEFERPLAYER;
ADDRGP4 s_preferences+3748+24
CNSTI4 142
ASGNI4
line 1067
;1066:
;1067:	s_preferences.synceveryframe.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+3040
CNSTI4 5
ASGNI4
line 1068
;1068:	s_preferences.synceveryframe.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+3040+72
CNSTU4 258
ASGNU4
line 1069
;1069:	s_preferences.synceveryframe.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+3040+76
ADDRGP4 Preferences_Event
ASGNP4
line 1070
;1070:	s_preferences.synceveryframe.generic.id       = ID_SYNCEVERYFRAME;
ADDRGP4 s_preferences+3040+24
CNSTI4 134
ASGNI4
line 1072
;1071:
;1072:	s_preferences.allowdownload.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+3364
CNSTI4 5
ASGNI4
line 1073
;1073:	s_preferences.allowdownload.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+3364+72
CNSTU4 258
ASGNU4
line 1074
;1074:	s_preferences.allowdownload.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+3364+76
ADDRGP4 Preferences_Event
ASGNP4
line 1075
;1075:	s_preferences.allowdownload.generic.id       = ID_ALLOWDOWNLOAD;
ADDRGP4 s_preferences+3364+24
CNSTI4 137
ASGNI4
line 1077
;1076:
;1077:	s_preferences.botmenu.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+3460
CNSTI4 5
ASGNI4
line 1078
;1078:	s_preferences.botmenu.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+3460+72
CNSTU4 258
ASGNU4
line 1079
;1079:	s_preferences.botmenu.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+3460+76
ADDRGP4 Preferences_Event
ASGNP4
line 1080
;1080:	s_preferences.botmenu.generic.id       = ID_BOTMENU;
ADDRGP4 s_preferences+3460+24
CNSTI4 139
ASGNI4
line 1082
;1081:
;1082:	s_preferences.newESCmenu.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+4552
CNSTI4 5
ASGNI4
line 1083
;1083:	s_preferences.newESCmenu.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+4552+72
CNSTU4 258
ASGNU4
line 1084
;1084:	s_preferences.newESCmenu.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+4552+76
ADDRGP4 Preferences_Event
ASGNP4
line 1085
;1085:	s_preferences.newESCmenu.generic.id       = ID_NEWESCAPEMENU;
ADDRGP4 s_preferences+4552+24
CNSTI4 151
ASGNI4
line 1087
;1086:	
;1087:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1138
line 1088
;1088:s_preferences.banner.string		   = "GAME OPTIONS";
ADDRGP4 s_preferences+1076+88
ADDRGP4 $1143
ASGNP4
line 1089
;1089:s_preferences.hud.string			= "HUD";
ADDRGP4 s_preferences+1412+88
ADDRGP4 $1146
ASGNP4
line 1090
;1090:s_preferences.render.string			= "RENDER";
ADDRGP4 s_preferences+1516+88
ADDRGP4 $1149
ASGNP4
line 1091
;1091:s_preferences.objects.string			= "OBJECTS";
ADDRGP4 s_preferences+1620+88
ADDRGP4 $1152
ASGNP4
line 1092
;1092:s_preferences.misc.string			= "MISC";
ADDRGP4 s_preferences+1724+88
ADDRGP4 $1155
ASGNP4
line 1093
;1093:s_preferences.crosshair.generic.name		= "Crosshair:";
ADDRGP4 s_preferences+1828+4
ADDRGP4 $1158
ASGNP4
line 1094
;1094:s_preferences.crosshairHealth.generic.name	      = "Crosshair shows health:";
ADDRGP4 s_preferences+1960+4
ADDRGP4 $1161
ASGNP4
line 1095
;1095:s_preferences.crosshairColorRed.generic.name		= "Crosshair red:";
ADDRGP4 s_preferences+2056+4
ADDRGP4 $1164
ASGNP4
line 1096
;1096:s_preferences.crosshairColorGreen.generic.name		= "Crosshair green:";
ADDRGP4 s_preferences+2160+4
ADDRGP4 $1167
ASGNP4
line 1097
;1097:s_preferences.crosshairColorBlue.generic.name		= "Crosshair blue:";
ADDRGP4 s_preferences+2264+4
ADDRGP4 $1170
ASGNP4
line 1098
;1098:s_preferences.alwaysweaponbar.generic.name	      = "Always show weapons:";
ADDRGP4 s_preferences+2464+4
ADDRGP4 $1173
ASGNP4
line 1099
;1099:s_preferences.simpleitems.generic.name	      = "Simple Items:";
ADDRGP4 s_preferences+2368+4
ADDRGP4 $1176
ASGNP4
line 1100
;1100:s_preferences.wallmarks.generic.name	      = "Marks on Walls:";
ADDRGP4 s_preferences+2656+4
ADDRGP4 $1179
ASGNP4
line 1101
;1101:s_preferences.brass.generic.name	          = "Ejecting Brass:";
ADDRGP4 s_preferences+2560+4
ADDRGP4 $1182
ASGNP4
line 1102
;1102:s_preferences.dynamiclights.generic.name	  = "Dynamic Lights:";
ADDRGP4 s_preferences+2752+4
ADDRGP4 $1185
ASGNP4
line 1103
;1103:s_preferences.highqualitysky.generic.name	  = "High Quality Sky:";
ADDRGP4 s_preferences+2944+4
ADDRGP4 $1188
ASGNP4
line 1104
;1104:s_preferences.shadows.generic.name	   = "Shadow type:";
ADDRGP4 s_preferences+4420+4
ADDRGP4 $1191
ASGNP4
line 1105
;1105:s_preferences.gibs.generic.name	   = "Body Gibs:";
ADDRGP4 s_preferences+3556+4
ADDRGP4 $1194
ASGNP4
line 1106
;1106:s_preferences.blood.generic.name	   = "Blood:";
ADDRGP4 s_preferences+3652+4
ADDRGP4 $1197
ASGNP4
line 1107
;1107:s_preferences.identifytarget.generic.name	  = "Identify Target:";
ADDRGP4 s_preferences+2848+4
ADDRGP4 $1200
ASGNP4
line 1108
;1108:s_preferences.drawfps.generic.name	   = "Draw FPS:";
ADDRGP4 s_preferences+3844+4
ADDRGP4 $1203
ASGNP4
line 1109
;1109:s_preferences.drawtimer.generic.name	   = "Draw Timer:";
ADDRGP4 s_preferences+3940+4
ADDRGP4 $1206
ASGNP4
line 1110
;1110:s_preferences.drawlagometer.generic.name	   = "Draw Lagometer:";
ADDRGP4 s_preferences+4036+4
ADDRGP4 $1209
ASGNP4
line 1111
;1111:s_preferences.drawAmmoWarning.generic.name	   = "Draw Ammo Warning:";
ADDRGP4 s_preferences+6104+4
ADDRGP4 $1212
ASGNP4
line 1112
;1112:s_preferences.drawgun.generic.name	   = "Secret setting =P:";
ADDRGP4 s_preferences+4132+4
ADDRGP4 $1215
ASGNP4
line 1113
;1113:s_preferences.drawteamoverlay.generic.name	   = "Draw Team Overlay:";
ADDRGP4 s_preferences+3232+4
ADDRGP4 $1218
ASGNP4
line 1114
;1114:s_preferences.teamchatheight.generic.name       = "FPS Limit:";
ADDRGP4 s_preferences+4648+4
ADDRGP4 $1221
ASGNP4
line 1115
;1115:s_preferences.teamchattime.generic.name       = "Team Chat Time:";
ADDRGP4 s_preferences+5012+4
ADDRGP4 $1224
ASGNP4
line 1116
;1116:s_preferences.fov.generic.name       = "FOV:";
ADDRGP4 s_preferences+5376+4
ADDRGP4 $1227
ASGNP4
line 1117
;1117:s_preferences.zoomfov.generic.name       = "Zoom FOV:";
ADDRGP4 s_preferences+5740+4
ADDRGP4 $1230
ASGNP4
line 1118
;1118:s_preferences.predictitems.generic.name	   = "Predict Items:";
ADDRGP4 s_preferences+4228+4
ADDRGP4 $1233
ASGNP4
line 1119
;1119:s_preferences.smoothclient.generic.name	   = "Smooth Clients:";
ADDRGP4 s_preferences+4324+4
ADDRGP4 $1236
ASGNP4
line 1120
;1120:s_preferences.forcemodel.generic.name	  = "Force Player Models:";
ADDRGP4 s_preferences+3136+4
ADDRGP4 $1239
ASGNP4
line 1121
;1121:s_preferences.oldrail.generic.name	  = "Old Railgun effect:";
ADDRGP4 s_preferences+6200+4
ADDRGP4 $1242
ASGNP4
line 1122
;1122:s_preferences.oldplasma.generic.name	  = "Old Plasma effect:";
ADDRGP4 s_preferences+6296+4
ADDRGP4 $1245
ASGNP4
line 1123
;1123:s_preferences.oldrocket.generic.name	  = "Old Rocket effect:";
ADDRGP4 s_preferences+6392+4
ADDRGP4 $1248
ASGNP4
line 1124
;1124:s_preferences.truelightning.generic.name	  = "True lightning:";
ADDRGP4 s_preferences+6488+4
ADDRGP4 $1251
ASGNP4
line 1125
;1125:s_preferences.deferplayer.generic.name	   = "Defer model loading:";
ADDRGP4 s_preferences+3748+4
ADDRGP4 $1254
ASGNP4
line 1126
;1126:s_preferences.synceveryframe.generic.name	  = "V-Sync:";
ADDRGP4 s_preferences+3040+4
ADDRGP4 $1257
ASGNP4
line 1127
;1127:s_preferences.allowdownload.generic.name	   = "Automatic Downloading:";
ADDRGP4 s_preferences+3364+4
ADDRGP4 $1260
ASGNP4
line 1128
;1128:s_preferences.botmenu.generic.name	  = "AutoClose Bot Menu:";
ADDRGP4 s_preferences+3460+4
ADDRGP4 $1263
ASGNP4
line 1129
;1129:s_preferences.newESCmenu.generic.name	   = "Dynamic Escape Menu:";
ADDRGP4 s_preferences+4552+4
ADDRGP4 $1266
ASGNP4
line 1130
;1130:	s_preferences.shadows.itemnames			= shadow_types;
ADDRGP4 s_preferences+4420+104
ADDRGP4 shadow_types
ASGNP4
line 1131
;1131:	s_preferences.drawteamoverlay.itemnames			= teamoverlay_names;
ADDRGP4 s_preferences+3232+104
ADDRGP4 teamoverlay_names
ASGNP4
line 1132
;1132:}
LABELV $1138
line 1133
;1133:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1271
line 1134
;1134:s_preferences.banner.string		   = "ИГРОВЫЕ ОПЦИИ";
ADDRGP4 s_preferences+1076+88
ADDRGP4 $1276
ASGNP4
line 1135
;1135:s_preferences.hud.string			= "HUD";
ADDRGP4 s_preferences+1412+88
ADDRGP4 $1146
ASGNP4
line 1136
;1136:s_preferences.render.string			= "РЕНДЕР";
ADDRGP4 s_preferences+1516+88
ADDRGP4 $1281
ASGNP4
line 1137
;1137:s_preferences.objects.string			= "ОБЪЕКТЫ";
ADDRGP4 s_preferences+1620+88
ADDRGP4 $1284
ASGNP4
line 1138
;1138:s_preferences.misc.string			= "ДРУГОЕ";
ADDRGP4 s_preferences+1724+88
ADDRGP4 $1287
ASGNP4
line 1139
;1139:s_preferences.crosshair.generic.name		= "Прицел:";
ADDRGP4 s_preferences+1828+4
ADDRGP4 $1290
ASGNP4
line 1140
;1140:s_preferences.crosshairHealth.generic.name	      = "Прицел показывает жизни:";
ADDRGP4 s_preferences+1960+4
ADDRGP4 $1293
ASGNP4
line 1141
;1141:s_preferences.crosshairColorRed.generic.name		= "Прицел красный:";
ADDRGP4 s_preferences+2056+4
ADDRGP4 $1296
ASGNP4
line 1142
;1142:s_preferences.crosshairColorGreen.generic.name		= "Прицел зеленый:";
ADDRGP4 s_preferences+2160+4
ADDRGP4 $1299
ASGNP4
line 1143
;1143:s_preferences.crosshairColorBlue.generic.name		= "Прицел синий:";
ADDRGP4 s_preferences+2264+4
ADDRGP4 $1302
ASGNP4
line 1144
;1144:s_preferences.alwaysweaponbar.generic.name	      = "Всегда показывать оружие:";
ADDRGP4 s_preferences+2464+4
ADDRGP4 $1305
ASGNP4
line 1145
;1145:s_preferences.simpleitems.generic.name	      = "Простые предметы:";
ADDRGP4 s_preferences+2368+4
ADDRGP4 $1308
ASGNP4
line 1146
;1146:s_preferences.wallmarks.generic.name	      = "Отметки на стенах:";
ADDRGP4 s_preferences+2656+4
ADDRGP4 $1311
ASGNP4
line 1147
;1147:s_preferences.brass.generic.name	          = "Гильзы от пуль:";
ADDRGP4 s_preferences+2560+4
ADDRGP4 $1314
ASGNP4
line 1148
;1148:s_preferences.dynamiclights.generic.name	  = "Динамическое освещение:";
ADDRGP4 s_preferences+2752+4
ADDRGP4 $1317
ASGNP4
line 1149
;1149:s_preferences.highqualitysky.generic.name	  = "Небо высокого качества:";
ADDRGP4 s_preferences+2944+4
ADDRGP4 $1320
ASGNP4
line 1150
;1150:s_preferences.shadows.generic.name	   = "Тип теней:";
ADDRGP4 s_preferences+4420+4
ADDRGP4 $1323
ASGNP4
line 1151
;1151:s_preferences.gibs.generic.name	   = "Куски тел:";
ADDRGP4 s_preferences+3556+4
ADDRGP4 $1326
ASGNP4
line 1152
;1152:s_preferences.blood.generic.name	   = "Кровь:";
ADDRGP4 s_preferences+3652+4
ADDRGP4 $1329
ASGNP4
line 1153
;1153:s_preferences.identifytarget.generic.name	  = "Определить цель:";
ADDRGP4 s_preferences+2848+4
ADDRGP4 $1332
ASGNP4
line 1154
;1154:s_preferences.drawfps.generic.name	   = "Отображение FPS:";
ADDRGP4 s_preferences+3844+4
ADDRGP4 $1335
ASGNP4
line 1155
;1155:s_preferences.drawtimer.generic.name	   = "Отображение Времени:";
ADDRGP4 s_preferences+3940+4
ADDRGP4 $1338
ASGNP4
line 1156
;1156:s_preferences.drawlagometer.generic.name	   = "Отображение Сети:";
ADDRGP4 s_preferences+4036+4
ADDRGP4 $1341
ASGNP4
line 1157
;1157:s_preferences.drawAmmoWarning.generic.name	   = "Отображение (мало патрон):";
ADDRGP4 s_preferences+6104+4
ADDRGP4 $1344
ASGNP4
line 1158
;1158:s_preferences.drawgun.generic.name	   = "Секретная настройка =P:";
ADDRGP4 s_preferences+4132+4
ADDRGP4 $1347
ASGNP4
line 1159
;1159:s_preferences.drawteamoverlay.generic.name	   = "Отображение командной панели:";
ADDRGP4 s_preferences+3232+4
ADDRGP4 $1350
ASGNP4
line 1160
;1160:s_preferences.teamchatheight.generic.name       = "Лимит FPS:";
ADDRGP4 s_preferences+4648+4
ADDRGP4 $1353
ASGNP4
line 1161
;1161:s_preferences.teamchattime.generic.name       = "Время командного чата:";
ADDRGP4 s_preferences+5012+4
ADDRGP4 $1356
ASGNP4
line 1162
;1162:s_preferences.fov.generic.name       = "Поле зрения:";
ADDRGP4 s_preferences+5376+4
ADDRGP4 $1359
ASGNP4
line 1163
;1163:s_preferences.zoomfov.generic.name       = "Увеличение:";
ADDRGP4 s_preferences+5740+4
ADDRGP4 $1362
ASGNP4
line 1164
;1164:s_preferences.predictitems.generic.name	   = "Предметы клиент:";
ADDRGP4 s_preferences+4228+4
ADDRGP4 $1365
ASGNP4
line 1165
;1165:s_preferences.smoothclient.generic.name	   = "Игроки клиент:";
ADDRGP4 s_preferences+4324+4
ADDRGP4 $1368
ASGNP4
line 1166
;1166:s_preferences.forcemodel.generic.name	  = "Одна модель игрока:";
ADDRGP4 s_preferences+3136+4
ADDRGP4 $1371
ASGNP4
line 1167
;1167:s_preferences.oldrail.generic.name	  = "Старый эффект Рейлгана:";
ADDRGP4 s_preferences+6200+4
ADDRGP4 $1374
ASGNP4
line 1168
;1168:s_preferences.oldplasma.generic.name	  = "Старый эффект Плазмы:";
ADDRGP4 s_preferences+6296+4
ADDRGP4 $1377
ASGNP4
line 1169
;1169:s_preferences.oldrocket.generic.name	  = "Старый эффект Ракет:";
ADDRGP4 s_preferences+6392+4
ADDRGP4 $1380
ASGNP4
line 1170
;1170:s_preferences.truelightning.generic.name	  = "Правильный эффект молнии:";
ADDRGP4 s_preferences+6488+4
ADDRGP4 $1383
ASGNP4
line 1171
;1171:s_preferences.deferplayer.generic.name	   = "Предзагрузка моделей игроков:";
ADDRGP4 s_preferences+3748+4
ADDRGP4 $1386
ASGNP4
line 1172
;1172:s_preferences.synceveryframe.generic.name	  = "Вертикальная синхронизация:";
ADDRGP4 s_preferences+3040+4
ADDRGP4 $1389
ASGNP4
line 1173
;1173:s_preferences.allowdownload.generic.name	   = "Автоматическое скачивание:";
ADDRGP4 s_preferences+3364+4
ADDRGP4 $1392
ASGNP4
line 1174
;1174:s_preferences.botmenu.generic.name	  = "Авто закрытие Бот Меню:";
ADDRGP4 s_preferences+3460+4
ADDRGP4 $1395
ASGNP4
line 1175
;1175:s_preferences.newESCmenu.generic.name	   = "Новый вид меню:";
ADDRGP4 s_preferences+4552+4
ADDRGP4 $1398
ASGNP4
line 1176
;1176:	s_preferences.shadows.itemnames			= shadow_typesru;
ADDRGP4 s_preferences+4420+104
ADDRGP4 shadow_typesru
ASGNP4
line 1177
;1177:	s_preferences.drawteamoverlay.itemnames			= teamoverlay_namesru;
ADDRGP4 s_preferences+3232+104
ADDRGP4 teamoverlay_namesru
ASGNP4
line 1178
;1178:}
LABELV $1271
line 1180
;1179:
;1180:	Menu_AddItem( &s_preferences.menu, &s_preferences.banner );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1181
;1181:	Menu_AddItem( &s_preferences.menu, &s_preferences.framel );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1182
;1182:	Menu_AddItem( &s_preferences.menu, &s_preferences.framer );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1184
;1183:
;1184:	Menu_AddItem( &s_preferences.menu, &s_preferences.hud);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1185
;1185:	Menu_AddItem( &s_preferences.menu, &s_preferences.render);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1516
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1186
;1186:	Menu_AddItem( &s_preferences.menu, &s_preferences.objects);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1620
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1187
;1187:	Menu_AddItem( &s_preferences.menu, &s_preferences.misc);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1189
;1188:
;1189:	Menu_AddItem( &s_preferences.menu, &s_preferences.crosshair );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1828
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1191
;1190:    //Menu_AddItem( &s_preferences.menu, &s_preferences.crosshairHealth );
;1191:    Menu_AddItem( &s_preferences.menu, &s_preferences.crosshairColorRed );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+2056
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1192
;1192:    Menu_AddItem( &s_preferences.menu, &s_preferences.crosshairColorGreen );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+2160
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1193
;1193:    Menu_AddItem( &s_preferences.menu, &s_preferences.crosshairColorBlue );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+2264
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1194
;1194:	Menu_AddItem( &s_preferences.menu, &s_preferences.simpleitems );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+2368
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1195
;1195:    Menu_AddItem( &s_preferences.menu, &s_preferences.alwaysweaponbar );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+2464
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1196
;1196:	Menu_AddItem( &s_preferences.menu, &s_preferences.wallmarks );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+2656
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1197
;1197:	Menu_AddItem( &s_preferences.menu, &s_preferences.brass );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+2560
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1198
;1198:	Menu_AddItem( &s_preferences.menu, &s_preferences.dynamiclights );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+2752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1199
;1199:	Menu_AddItem( &s_preferences.menu, &s_preferences.identifytarget );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+2848
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1200
;1200:	Menu_AddItem( &s_preferences.menu, &s_preferences.highqualitysky );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+2944
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1201
;1201:	Menu_AddItem( &s_preferences.menu, &s_preferences.synceveryframe );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+3040
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1203
;1202:	//Menu_AddItem( &s_preferences.menu, &s_preferences.forcemodel );
;1203:	Menu_AddItem( &s_preferences.menu, &s_preferences.drawteamoverlay );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+3232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1204
;1204:	Menu_AddItem( &s_preferences.menu, &s_preferences.allowdownload );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+3364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1205
;1205:	Menu_AddItem( &s_preferences.menu, &s_preferences.botmenu);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+3460
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1207
;1206:
;1207:	Menu_AddItem( &s_preferences.menu, &s_preferences.gibs);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+3556
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1208
;1208:	Menu_AddItem( &s_preferences.menu, &s_preferences.blood);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+3652
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1209
;1209:	Menu_AddItem( &s_preferences.menu, &s_preferences.deferplayer);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+3748
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1210
;1210:	Menu_AddItem( &s_preferences.menu, &s_preferences.drawfps);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+3844
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1211
;1211:	Menu_AddItem( &s_preferences.menu, &s_preferences.drawtimer);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+3940
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1212
;1212:	Menu_AddItem( &s_preferences.menu, &s_preferences.drawlagometer);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+4036
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1213
;1213:	Menu_AddItem( &s_preferences.menu, &s_preferences.predictitems);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+4228
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1214
;1214:	Menu_AddItem( &s_preferences.menu, &s_preferences.smoothclient);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+4324
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1215
;1215:	Menu_AddItem( &s_preferences.menu, &s_preferences.shadows);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+4420
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1216
;1216:	Menu_AddItem( &s_preferences.menu, &s_preferences.newESCmenu);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+4552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1218
;1217:	//Menu_AddItem( &s_preferences.menu, &s_preferences.drawAmmoWarning);
;1218:	Menu_AddItem( &s_preferences.menu, &s_preferences.drawgun);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+4132
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1220
;1219:	//Menu_AddItem( &s_preferences.menu, &s_preferences.teamchattime);
;1220:	Menu_AddItem( &s_preferences.menu, &s_preferences.teamchatheight);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+4648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1221
;1221:	Menu_AddItem( &s_preferences.menu, &s_preferences.fov);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+5376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1222
;1222:	Menu_AddItem( &s_preferences.menu, &s_preferences.zoomfov);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+5740
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1224
;1223:
;1224:	Menu_AddItem( &s_preferences.menu, &s_preferences.oldrail);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+6200
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1225
;1225:	Menu_AddItem( &s_preferences.menu, &s_preferences.oldplasma);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+6296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1226
;1226:	Menu_AddItem( &s_preferences.menu, &s_preferences.oldrocket);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+6392
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1227
;1227:	Menu_AddItem( &s_preferences.menu, &s_preferences.truelightning);
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+6488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1229
;1228:
;1229:	Menu_AddItem( &s_preferences.menu, &s_preferences.back );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+6584
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1231
;1230:
;1231:	Preferences_SetMenuItems();
ADDRGP4 Preferences_SetMenuItems
CALLV
pop
line 1232
;1232:	Control_Init();
ADDRGP4 Control_Init
CALLV
pop
line 1233
;1233:}
LABELV $682
endproc Preferences_MenuInit 12 12
export Preferences_Cache
proc Preferences_Cache 16 8
line 1241
;1234:
;1235:
;1236:/*
;1237:===============
;1238:Preferences_Cache
;1239:===============
;1240:*/
;1241:void Preferences_Cache( void ) {
line 1244
;1242:	int		n;
;1243:
;1244:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $699
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1245
;1245:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $713
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1246
;1246:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $794
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1247
;1247:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $812
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1248
;1248:	for( n = 0; n < NUM_CROSSHAIRS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1445
line 1249
;1249:		s_preferences.crosshairShader[n] = trap_R_RegisterShaderNoMip( va("gfx/2d/crosshair%c", 'a' + n ) );
ADDRGP4 $1450
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_preferences+6700
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1250
;1250:	}
LABELV $1446
line 1248
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $1445
line 1251
;1251:}
LABELV $1444
endproc Preferences_Cache 16 8
export UI_PreferencesMenu
proc UI_PreferencesMenu 0 4
line 1259
;1252:
;1253:
;1254:/*
;1255:===============
;1256:UI_PreferencesMenu
;1257:===============
;1258:*/
;1259:void UI_PreferencesMenu( void ) {
line 1260
;1260:	Preferences_MenuInit();
ADDRGP4 Preferences_MenuInit
CALLV
pop
line 1261
;1261:	UI_PushMenu( &s_preferences.menu );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1262
;1262:}
LABELV $1451
endproc UI_PreferencesMenu 0 4
bss
align 4
LABELV s_preferences
skip 6748
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
LABELV $1450
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $1398
byte 1 208
byte 1 157
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 142
byte 1 58
byte 1 0
align 1
LABELV $1395
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
byte 1 183
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
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 156
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 142
byte 1 58
byte 1 0
align 1
LABELV $1392
byte 1 208
byte 1 144
byte 1 208
byte 1 178
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 135
byte 1 208
byte 1 184
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
byte 1 58
byte 1 0
align 1
LABELV $1389
byte 1 208
byte 1 146
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 209
byte 1 133
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 209
byte 1 134
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 58
byte 1 0
align 1
LABELV $1386
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 183
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
byte 1 186
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 58
byte 1 0
align 1
LABELV $1383
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 209
byte 1 141
byte 1 209
byte 1 132
byte 1 209
byte 1 132
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $1380
byte 1 208
byte 1 161
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 209
byte 1 141
byte 1 209
byte 1 132
byte 1 209
byte 1 132
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 160
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $1377
byte 1 208
byte 1 161
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 209
byte 1 141
byte 1 209
byte 1 132
byte 1 209
byte 1 132
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 159
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 188
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $1374
byte 1 208
byte 1 161
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 209
byte 1 141
byte 1 209
byte 1 132
byte 1 209
byte 1 132
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 208
byte 1 185
byte 1 208
byte 1 187
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $1371
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 188
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
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $1368
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
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $1365
byte 1 208
byte 1 159
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
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $1362
byte 1 208
byte 1 163
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 184
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
LABELV $1359
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 183
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 58
byte 1 0
align 1
LABELV $1356
byte 1 208
byte 1 146
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 188
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
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 32
byte 1 209
byte 1 135
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $1353
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
byte 1 70
byte 1 80
byte 1 83
byte 1 58
byte 1 0
align 1
LABELV $1350
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 182
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
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $1347
byte 1 208
byte 1 161
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 189
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
byte 1 176
byte 1 32
byte 1 61
byte 1 80
byte 1 58
byte 1 0
align 1
LABELV $1344
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 182
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 40
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 41
byte 1 58
byte 1 0
align 1
LABELV $1341
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 182
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
byte 1 161
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $1338
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 182
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
byte 1 146
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
byte 1 58
byte 1 0
align 1
LABELV $1335
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 182
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 70
byte 1 80
byte 1 83
byte 1 58
byte 1 0
align 1
LABELV $1332
byte 1 208
byte 1 158
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 209
byte 1 134
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $1329
byte 1 208
byte 1 154
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $1326
byte 1 208
byte 1 154
byte 1 209
byte 1 131
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 58
byte 1 0
align 1
LABELV $1323
byte 1 208
byte 1 162
byte 1 208
byte 1 184
byte 1 208
byte 1 191
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 185
byte 1 58
byte 1 0
align 1
LABELV $1320
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $1317
byte 1 208
byte 1 148
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 137
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
LABELV $1314
byte 1 208
byte 1 147
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $1311
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 58
byte 1 0
align 1
LABELV $1308
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 139
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
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $1305
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 179
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 58
byte 1 0
align 1
LABELV $1302
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 58
byte 1 0
align 1
LABELV $1299
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 58
byte 1 0
align 1
LABELV $1296
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 58
byte 1 0
align 1
LABELV $1293
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $1290
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 58
byte 1 0
align 1
LABELV $1287
byte 1 208
byte 1 148
byte 1 208
byte 1 160
byte 1 208
byte 1 163
byte 1 208
byte 1 147
byte 1 208
byte 1 158
byte 1 208
byte 1 149
byte 1 0
align 1
LABELV $1284
byte 1 208
byte 1 158
byte 1 208
byte 1 145
byte 1 208
byte 1 170
byte 1 208
byte 1 149
byte 1 208
byte 1 154
byte 1 208
byte 1 162
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $1281
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 157
byte 1 208
byte 1 148
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 0
align 1
LABELV $1276
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 208
byte 1 171
byte 1 208
byte 1 149
byte 1 32
byte 1 208
byte 1 158
byte 1 208
byte 1 159
byte 1 208
byte 1 166
byte 1 208
byte 1 152
byte 1 208
byte 1 152
byte 1 0
align 1
LABELV $1266
byte 1 68
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 32
byte 1 69
byte 1 115
byte 1 99
byte 1 97
byte 1 112
byte 1 101
byte 1 32
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 0
align 1
LABELV $1263
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 0
align 1
LABELV $1260
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $1257
byte 1 86
byte 1 45
byte 1 83
byte 1 121
byte 1 110
byte 1 99
byte 1 58
byte 1 0
align 1
LABELV $1254
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $1251
byte 1 84
byte 1 114
byte 1 117
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $1248
byte 1 79
byte 1 108
byte 1 100
byte 1 32
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 101
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1245
byte 1 79
byte 1 108
byte 1 100
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 32
byte 1 101
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1242
byte 1 79
byte 1 108
byte 1 100
byte 1 32
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 101
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1239
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1236
byte 1 83
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 32
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1233
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 32
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1230
byte 1 90
byte 1 111
byte 1 111
byte 1 109
byte 1 32
byte 1 70
byte 1 79
byte 1 86
byte 1 58
byte 1 0
align 1
LABELV $1227
byte 1 70
byte 1 79
byte 1 86
byte 1 58
byte 1 0
align 1
LABELV $1224
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1221
byte 1 70
byte 1 80
byte 1 83
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1218
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $1215
byte 1 83
byte 1 101
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 61
byte 1 80
byte 1 58
byte 1 0
align 1
LABELV $1212
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $1209
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 76
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1206
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1203
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 70
byte 1 80
byte 1 83
byte 1 58
byte 1 0
align 1
LABELV $1200
byte 1 73
byte 1 100
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1197
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $1194
byte 1 66
byte 1 111
byte 1 100
byte 1 121
byte 1 32
byte 1 71
byte 1 105
byte 1 98
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1191
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1188
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 83
byte 1 107
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $1185
byte 1 68
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 32
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1182
byte 1 69
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 66
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1179
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 87
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1176
byte 1 83
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1173
byte 1 65
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1170
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1167
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $1164
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $1161
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 115
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 0
align 1
LABELV $1158
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1155
byte 1 77
byte 1 73
byte 1 83
byte 1 67
byte 1 0
align 1
LABELV $1152
byte 1 79
byte 1 66
byte 1 74
byte 1 69
byte 1 67
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $1149
byte 1 82
byte 1 69
byte 1 78
byte 1 68
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $1146
byte 1 72
byte 1 85
byte 1 68
byte 1 0
align 1
LABELV $1143
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 32
byte 1 79
byte 1 80
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $812
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
LABELV $794
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
LABELV $713
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
LABELV $699
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
LABELV $683
byte 1 49
byte 1 0
align 1
LABELV $675
byte 1 208
byte 1 159
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
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $673
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
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $671
byte 1 208
byte 1 156
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 209
byte 1 129
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 182
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 32
byte 1 40
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 131
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 209
byte 1 139
byte 1 41
byte 1 0
align 1
LABELV $669
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
byte 1 70
byte 1 80
byte 1 83
byte 1 32
byte 1 45
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 209
byte 1 131
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 129
byte 1 209
byte 1 130
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
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 32
byte 1 209
byte 1 131
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $667
byte 1 208
byte 1 152
byte 1 208
byte 1 189
byte 1 209
byte 1 132
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 134
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 190
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
byte 1 181
byte 1 0
align 1
LABELV $665
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 32
byte 1 61
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 209
byte 1 131
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 183
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
byte 1 209
byte 1 139
byte 1 209
byte 1 133
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 0
align 1
LABELV $663
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 32
byte 1 51
byte 1 68
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
byte 1 176
byte 1 0
align 1
LABELV $661
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 183
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 177
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 182
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $659
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 183
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 32
byte 1 40
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 32
byte 1 61
byte 1 32
byte 1 57
byte 1 48
byte 1 41
byte 1 0
align 1
LABELV $657
byte 1 208
byte 1 178
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 32
byte 1 61
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 190
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 209
byte 1 136
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 32
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 71
byte 1 76
byte 1 0
align 1
LABELV $645
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $643
byte 1 79
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $641
byte 1 77
byte 1 97
byte 1 120
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 45
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $639
byte 1 70
byte 1 80
byte 1 83
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 45
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $637
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $635
byte 1 111
byte 1 102
byte 1 102
byte 1 32
byte 1 61
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 119
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $633
byte 1 80
byte 1 105
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 51
byte 1 68
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $631
byte 1 90
byte 1 111
byte 1 111
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $629
byte 1 70
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 40
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 61
byte 1 32
byte 1 57
byte 1 48
byte 1 41
byte 1 0
align 1
LABELV $627
byte 1 111
byte 1 110
byte 1 32
byte 1 61
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 71
byte 1 76
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $530
byte 1 115
byte 1 118
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
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
LABELV $445
byte 1 50
byte 1 50
byte 1 0
align 1
LABELV $432
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $419
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 102
byte 1 112
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $417
byte 1 53
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $319
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $315
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $311
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $307
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
LABELV $303
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 117
byte 1 101
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
LABELV $297
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $291
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $285
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $279
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $273
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 100
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $270
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $264
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $258
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $252
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $246
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $240
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $234
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $228
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
LABELV $222
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $216
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 0
align 1
LABELV $210
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $204
byte 1 99
byte 1 108
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
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
LABELV $201
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $195
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $189
byte 1 114
byte 1 95
byte 1 115
byte 1 119
byte 1 97
byte 1 112
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 118
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $183
byte 1 114
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 115
byte 1 107
byte 1 121
byte 1 0
align 1
LABELV $177
byte 1 114
byte 1 95
byte 1 100
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $171
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $165
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $159
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
LABELV $153
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
LABELV $147
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $144
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
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $141
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
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 71
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $138
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
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 82
byte 1 101
byte 1 100
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
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $94
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $93
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $92
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 0
align 1
LABELV $91
byte 1 209
byte 1 129
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 209
byte 1 131
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 0
align 1
LABELV $90
byte 1 209
byte 1 129
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 209
byte 1 131
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $89
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 209
byte 1 133
byte 1 209
byte 1 131
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $88
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 0
align 1
LABELV $87
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $86
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $85
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $84
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $83
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $82
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $81
byte 1 111
byte 1 102
byte 1 102
byte 1 0
