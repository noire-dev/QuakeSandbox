code
proc Setup_ResetDefaults_Action 0 8
file "../../../code/q3_ui/ui_setup.c"
line 65
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:SETUP MENU
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
;18:#define SETUP_MENU_VERTICAL_SPACING		34
;19:
;20:#define ART_BACK0		"menu/art/back_0"
;21:#define ART_BACK1		"menu/art/back_1"
;22:#define ART_FRAMEL		"menu/art/frame2_l"
;23:#define ART_FRAMER		"menu/art/frame1_r"
;24:
;25:#define ID_CUSTOMIZEPLAYER		10
;26:#define ID_CUSTOMIZECONTROLS	11
;27:#define ID_SYSTEMCONFIG			12
;28:#define ID_GAME					13
;29:#define ID_ADVANCED				14
;30:#define ID_LANGUAGE				15
;31:#define ID_LOAD					16
;32:#define ID_SAVE					17
;33:#define ID_DEFAULTS				18
;34:#define ID_BACK					19
;35:#define ID_CUSTOMIZEMODEL		20
;36:
;37:
;38:typedef struct {
;39:	menuframework_s	menu;
;40:
;41:	menutext_s		banner;
;42:	menubitmap_s	framel;
;43:	menubitmap_s	framer;
;44:	menutext_s		setupplayer;
;45:	menutext_s		setupmodel;
;46:	menutext_s		setupcontrols;
;47:	menutext_s		setupsystem;
;48:	menutext_s		game;
;49:	menutext_s		advanced;
;50:	menutext_s		language;
;51:	menutext_s		load;
;52:	menutext_s		save;
;53:	menutext_s		defaults;
;54:	menubitmap_s	back;
;55:} setupMenuInfo_t;
;56:
;57:static setupMenuInfo_t	setupMenuInfo;
;58:
;59:
;60:/*
;61:=================
;62:Setup_ResetDefaults_Action
;63:=================
;64:*/
;65:static void Setup_ResetDefaults_Action( qboolean result ) {
line 66
;66:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $82
line 67
;67:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 69
;68:	}
;69:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec default.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $84
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 70
;70:	trap_Cmd_ExecuteText( EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $85
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 71
;71:	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $86
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 72
;72:}
LABELV $81
endproc Setup_ResetDefaults_Action 0 8
proc Setup_ResetDefaults_Draw 0 20
line 80
;73:
;74:
;75:/*
;76:=================
;77:Setup_ResetDefaults_Draw
;78:=================
;79:*/
;80:static void Setup_ResetDefaults_Draw( void ) {
line 81
;81:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $88
line 82
;82:	UI_DrawString( SCREEN_WIDTH/2, 300 + PROP_HEIGHT * 0, "WARNING: This will reset *ALL*", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 0
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 300
ADDI4
ARGI4
ADDRGP4 $92
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 83
;83:	UI_DrawString( SCREEN_WIDTH/2, 300 + PROP_HEIGHT * 1, "options to their default values.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 1
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 300
ADDI4
ARGI4
ADDRGP4 $94
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 84
;84:	}
LABELV $88
line 85
;85:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $95
line 86
;86:	UI_DrawString( SCREEN_WIDTH/2, 300 + PROP_HEIGHT * 0, "ВНИМАНИЕ: Вы действительно хотите сбросить", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 0
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 300
ADDI4
ARGI4
ADDRGP4 $99
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 87
;87:	UI_DrawString( SCREEN_WIDTH/2, 300 + PROP_HEIGHT * 1, "*ВСЕ* настройки до стандартных.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 1
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 300
ADDI4
ARGI4
ADDRGP4 $101
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 88
;88:	}
LABELV $95
line 89
;89:}
LABELV $87
endproc Setup_ResetDefaults_Draw 0 20
proc UI_SetupMenu_Event 8 12
line 97
;90:
;91:
;92:/*
;93:===============
;94:UI_SetupMenu_Event
;95:===============
;96:*/
;97:static void UI_SetupMenu_Event( void *ptr, int event ) {
line 98
;98:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $103
line 99
;99:		return;
ADDRGP4 $102
JUMPV
LABELV $103
line 102
;100:	}
;101:
;102:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $105
ADDRLP4 0
INDIRI4
CNSTI4 20
GTI4 $105
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $134-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $134
address $108
address $110
address $111
address $112
address $113
address $114
address $122
address $123
address $124
address $133
address $109
code
LABELV $108
line 104
;103:	case ID_CUSTOMIZEPLAYER:
;104:		UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 105
;105:		break;
ADDRGP4 $106
JUMPV
LABELV $109
line 108
;106:
;107:	case ID_CUSTOMIZEMODEL:
;108:		UI_PlayerModelMenu();
ADDRGP4 UI_PlayerModelMenu
CALLV
pop
line 109
;109:		break;
ADDRGP4 $106
JUMPV
LABELV $110
line 112
;110:
;111:	case ID_CUSTOMIZECONTROLS:
;112:		UI_ControlsMenu();
ADDRGP4 UI_ControlsMenu
CALLV
pop
line 113
;113:		break;
ADDRGP4 $106
JUMPV
LABELV $111
line 116
;114:
;115:	case ID_SYSTEMCONFIG:
;116:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 117
;117:		break;
ADDRGP4 $106
JUMPV
LABELV $112
line 120
;118:
;119:	case ID_GAME:
;120:		UI_PreferencesMenu();
ADDRGP4 UI_PreferencesMenu
CALLV
pop
line 121
;121:		break;
ADDRGP4 $106
JUMPV
LABELV $113
line 124
;122:		
;123:	case ID_ADVANCED:
;124:		UI_AdvancedMenu();
ADDRGP4 UI_AdvancedMenu
CALLV
pop
line 125
;125:		break;
ADDRGP4 $106
JUMPV
LABELV $114
line 128
;126:
;127:	case ID_LANGUAGE:
;128:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $115
line 129
;129:		trap_Cvar_SetValue("cl_language", 1);
ADDRGP4 $118
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 130
;130:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 131
;131:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 132
;132:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 133
;133:		return;
ADDRGP4 $102
JUMPV
LABELV $115
line 135
;134:		}
;135:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $106
line 136
;136:		trap_Cvar_SetValue("cl_language", 0);
ADDRGP4 $118
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 137
;137:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 138
;138:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 139
;139:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 140
;140:		return;
ADDRGP4 $102
JUMPV
line 142
;141:		}
;142:		break;
LABELV $122
line 145
;143:
;144:	case ID_LOAD:
;145:		UI_LoadConfigMenu();
ADDRGP4 UI_LoadConfigMenu
CALLV
pop
line 146
;146:		break;
ADDRGP4 $106
JUMPV
LABELV $123
line 149
;147:
;148:	case ID_SAVE:
;149:		UI_SaveConfigMenu();
ADDRGP4 UI_SaveConfigMenu
CALLV
pop
line 150
;150:		break;
ADDRGP4 $106
JUMPV
LABELV $124
line 153
;151:
;152:	case ID_DEFAULTS:
;153:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $125
line 154
;154:		UI_ConfirmMenu( "SET TO DEFAULTS?", Setup_ResetDefaults_Draw, Setup_ResetDefaults_Action );
ADDRGP4 $128
ARGP4
ADDRGP4 Setup_ResetDefaults_Draw
ARGP4
ADDRGP4 Setup_ResetDefaults_Action
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 155
;155:	}
LABELV $125
line 156
;156:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $106
line 157
;157:		UI_ConfirmMenu( "СБРОСИТЬ ДО СТАНДАРТНЫХ?", Setup_ResetDefaults_Draw, Setup_ResetDefaults_Action );
ADDRGP4 $132
ARGP4
ADDRGP4 Setup_ResetDefaults_Draw
ARGP4
ADDRGP4 Setup_ResetDefaults_Action
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 158
;158:	}
line 159
;159:		break;
ADDRGP4 $106
JUMPV
LABELV $133
line 162
;160:
;161:	case ID_BACK:
;162:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 163
;163:		break;
LABELV $105
LABELV $106
line 165
;164:	}
;165:}
LABELV $102
endproc UI_SetupMenu_Event 8 12
proc UI_SetupMenu_Init 12 12
line 173
;166:
;167:
;168:/*
;169:===============
;170:UI_SetupMenu_Init
;171:===============
;172:*/
;173:static void UI_SetupMenu_Init( void ) {
line 177
;174:	int				y;
;175:	int 			style;
;176:
;177:	UI_SetupMenu_Cache();
ADDRGP4 UI_SetupMenu_Cache
CALLV
pop
line 179
;178:
;179:	memset( &setupMenuInfo, 0, sizeof(setupMenuInfo) );
ADDRGP4 setupMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2568
ARGI4
ADDRGP4 memset
CALLP4
pop
line 180
;180:	setupMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 setupMenuInfo+1044
CNSTI4 1
ASGNI4
line 181
;181:	setupMenuInfo.menu.native 	   = qfalse;
ADDRGP4 setupMenuInfo+1056
CNSTI4 0
ASGNI4
line 182
;182:	setupMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 setupMenuInfo+1052
CNSTI4 1
ASGNI4
line 184
;183:
;184:	setupMenuInfo.banner.generic.type				= MTYPE_BTEXT;
ADDRGP4 setupMenuInfo+1076
CNSTI4 10
ASGNI4
line 185
;185:	setupMenuInfo.banner.generic.x					= 320;
ADDRGP4 setupMenuInfo+1076+28
CNSTI4 320
ASGNI4
line 186
;186:	setupMenuInfo.banner.generic.y					= 16;
ADDRGP4 setupMenuInfo+1076+32
CNSTI4 16
ASGNI4
line 187
;187:	setupMenuInfo.banner.color						= color_white;
ADDRGP4 setupMenuInfo+1076+100
ADDRGP4 color_white
ASGNP4
line 188
;188:	setupMenuInfo.banner.style						= UI_CENTER;
ADDRGP4 setupMenuInfo+1076+92
CNSTI4 1
ASGNI4
line 190
;189:
;190:	setupMenuInfo.framel.generic.type				= MTYPE_BITMAP;
ADDRGP4 setupMenuInfo+1180
CNSTI4 6
ASGNI4
line 191
;191:	setupMenuInfo.framel.generic.name				= ART_FRAMEL;
ADDRGP4 setupMenuInfo+1180+4
ADDRGP4 $152
ASGNP4
line 192
;192:	setupMenuInfo.framel.generic.flags				= QMF_INACTIVE;
ADDRGP4 setupMenuInfo+1180+72
CNSTU4 16384
ASGNU4
line 193
;193:	setupMenuInfo.framel.generic.x					= 0;  
ADDRGP4 setupMenuInfo+1180+28
CNSTI4 0
ASGNI4
line 194
;194:	setupMenuInfo.framel.generic.y					= 78;
ADDRGP4 setupMenuInfo+1180+32
CNSTI4 78
ASGNI4
line 195
;195:	setupMenuInfo.framel.width  					= 256;
ADDRGP4 setupMenuInfo+1180+104
CNSTI4 256
ASGNI4
line 196
;196:	setupMenuInfo.framel.height  					= 329;
ADDRGP4 setupMenuInfo+1180+108
CNSTI4 329
ASGNI4
line 198
;197:
;198:	setupMenuInfo.framer.generic.type				= MTYPE_BITMAP;
ADDRGP4 setupMenuInfo+1296
CNSTI4 6
ASGNI4
line 199
;199:	setupMenuInfo.framer.generic.name				= ART_FRAMER;
ADDRGP4 setupMenuInfo+1296+4
ADDRGP4 $166
ASGNP4
line 200
;200:	setupMenuInfo.framer.generic.flags				= QMF_INACTIVE;
ADDRGP4 setupMenuInfo+1296+72
CNSTU4 16384
ASGNU4
line 201
;201:	setupMenuInfo.framer.generic.x					= 376;
ADDRGP4 setupMenuInfo+1296+28
CNSTI4 376
ASGNI4
line 202
;202:	setupMenuInfo.framer.generic.y					= 76;
ADDRGP4 setupMenuInfo+1296+32
CNSTI4 76
ASGNI4
line 203
;203:	setupMenuInfo.framer.width  					= 256;
ADDRGP4 setupMenuInfo+1296+104
CNSTI4 256
ASGNI4
line 204
;204:	setupMenuInfo.framer.height  					= 334;
ADDRGP4 setupMenuInfo+1296+108
CNSTI4 334
ASGNI4
line 206
;205:
;206:	y = 128 - SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
CNSTI4 94
ASGNI4
line 207
;207:	setupMenuInfo.setupplayer.generic.type			= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+1412
CNSTI4 9
ASGNI4
line 208
;208:	setupMenuInfo.setupplayer.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+1412+72
CNSTU4 264
ASGNU4
line 209
;209:	setupMenuInfo.setupplayer.generic.x				= 320;
ADDRGP4 setupMenuInfo+1412+28
CNSTI4 320
ASGNI4
line 210
;210:	setupMenuInfo.setupplayer.generic.y				= y;
ADDRGP4 setupMenuInfo+1412+32
ADDRLP4 0
INDIRI4
ASGNI4
line 211
;211:	setupMenuInfo.setupplayer.generic.id			= ID_CUSTOMIZEPLAYER;
ADDRGP4 setupMenuInfo+1412+24
CNSTI4 10
ASGNI4
line 212
;212:	setupMenuInfo.setupplayer.generic.callback		= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+1412+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 213
;213:	setupMenuInfo.setupplayer.color					= color_red;
ADDRGP4 setupMenuInfo+1412+100
ADDRGP4 color_red
ASGNP4
line 214
;214:	setupMenuInfo.setupplayer.style					= UI_CENTER;
ADDRGP4 setupMenuInfo+1412+92
CNSTI4 1
ASGNI4
line 216
;215:
;216:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 217
;217:	setupMenuInfo.setupmodel.generic.type		= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+1516
CNSTI4 9
ASGNI4
line 218
;218:	setupMenuInfo.setupmodel.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+1516+72
CNSTU4 264
ASGNU4
line 219
;219:	setupMenuInfo.setupmodel.generic.x			= 320;
ADDRGP4 setupMenuInfo+1516+28
CNSTI4 320
ASGNI4
line 220
;220:	setupMenuInfo.setupmodel.generic.y			= y;
ADDRGP4 setupMenuInfo+1516+32
ADDRLP4 0
INDIRI4
ASGNI4
line 221
;221:	setupMenuInfo.setupmodel.generic.id			= ID_CUSTOMIZEMODEL;
ADDRGP4 setupMenuInfo+1516+24
CNSTI4 20
ASGNI4
line 222
;222:	setupMenuInfo.setupmodel.generic.callback	= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+1516+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 223
;223:	setupMenuInfo.setupmodel.color				= color_red;
ADDRGP4 setupMenuInfo+1516+100
ADDRGP4 color_red
ASGNP4
line 224
;224:	setupMenuInfo.setupmodel.style				= UI_CENTER;
ADDRGP4 setupMenuInfo+1516+92
CNSTI4 1
ASGNI4
line 226
;225:
;226:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 227
;227:	setupMenuInfo.setupcontrols.generic.type		= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+1620
CNSTI4 9
ASGNI4
line 228
;228:	setupMenuInfo.setupcontrols.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+1620+72
CNSTU4 264
ASGNU4
line 229
;229:	setupMenuInfo.setupcontrols.generic.x			= 320;
ADDRGP4 setupMenuInfo+1620+28
CNSTI4 320
ASGNI4
line 230
;230:	setupMenuInfo.setupcontrols.generic.y			= y;
ADDRGP4 setupMenuInfo+1620+32
ADDRLP4 0
INDIRI4
ASGNI4
line 231
;231:	setupMenuInfo.setupcontrols.generic.id			= ID_CUSTOMIZECONTROLS;
ADDRGP4 setupMenuInfo+1620+24
CNSTI4 11
ASGNI4
line 232
;232:	setupMenuInfo.setupcontrols.generic.callback	= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+1620+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 233
;233:	setupMenuInfo.setupcontrols.color				= color_red;
ADDRGP4 setupMenuInfo+1620+100
ADDRGP4 color_red
ASGNP4
line 234
;234:	setupMenuInfo.setupcontrols.style				= UI_CENTER;
ADDRGP4 setupMenuInfo+1620+92
CNSTI4 1
ASGNI4
line 236
;235:
;236:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 237
;237:	setupMenuInfo.setupsystem.generic.type			= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+1724
CNSTI4 9
ASGNI4
line 238
;238:	setupMenuInfo.setupsystem.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+1724+72
CNSTU4 264
ASGNU4
line 239
;239:	setupMenuInfo.setupsystem.generic.x				= 320;
ADDRGP4 setupMenuInfo+1724+28
CNSTI4 320
ASGNI4
line 240
;240:	setupMenuInfo.setupsystem.generic.y				= y;
ADDRGP4 setupMenuInfo+1724+32
ADDRLP4 0
INDIRI4
ASGNI4
line 241
;241:	setupMenuInfo.setupsystem.generic.id			= ID_SYSTEMCONFIG;
ADDRGP4 setupMenuInfo+1724+24
CNSTI4 12
ASGNI4
line 242
;242:	setupMenuInfo.setupsystem.generic.callback		= UI_SetupMenu_Event; 
ADDRGP4 setupMenuInfo+1724+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 243
;243:	setupMenuInfo.setupsystem.color					= color_red;
ADDRGP4 setupMenuInfo+1724+100
ADDRGP4 color_red
ASGNP4
line 244
;244:	setupMenuInfo.setupsystem.style					= UI_CENTER;
ADDRGP4 setupMenuInfo+1724+92
CNSTI4 1
ASGNI4
line 246
;245:
;246:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 247
;247:	setupMenuInfo.game.generic.type					= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+1828
CNSTI4 9
ASGNI4
line 248
;248:	setupMenuInfo.game.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+1828+72
CNSTU4 264
ASGNU4
line 249
;249:	setupMenuInfo.game.generic.x					= 320;
ADDRGP4 setupMenuInfo+1828+28
CNSTI4 320
ASGNI4
line 250
;250:	setupMenuInfo.game.generic.y					= y;
ADDRGP4 setupMenuInfo+1828+32
ADDRLP4 0
INDIRI4
ASGNI4
line 251
;251:	setupMenuInfo.game.generic.id					= ID_GAME;
ADDRGP4 setupMenuInfo+1828+24
CNSTI4 13
ASGNI4
line 252
;252:	setupMenuInfo.game.generic.callback				= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+1828+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 253
;253:	setupMenuInfo.game.color						= color_red;
ADDRGP4 setupMenuInfo+1828+100
ADDRGP4 color_red
ASGNP4
line 254
;254:	setupMenuInfo.game.style						= UI_CENTER;
ADDRGP4 setupMenuInfo+1828+92
CNSTI4 1
ASGNI4
line 256
;255:	
;256:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 257
;257:	setupMenuInfo.advanced.generic.type					= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+1932
CNSTI4 9
ASGNI4
line 258
;258:	setupMenuInfo.advanced.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+1932+72
CNSTU4 264
ASGNU4
line 259
;259:	setupMenuInfo.advanced.generic.x					= 320;
ADDRGP4 setupMenuInfo+1932+28
CNSTI4 320
ASGNI4
line 260
;260:	setupMenuInfo.advanced.generic.y					= y;
ADDRGP4 setupMenuInfo+1932+32
ADDRLP4 0
INDIRI4
ASGNI4
line 261
;261:	setupMenuInfo.advanced.generic.id					= ID_ADVANCED;
ADDRGP4 setupMenuInfo+1932+24
CNSTI4 14
ASGNI4
line 262
;262:	setupMenuInfo.advanced.generic.callback				= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+1932+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 263
;263:	setupMenuInfo.advanced.color						= color_red;
ADDRGP4 setupMenuInfo+1932+100
ADDRGP4 color_red
ASGNP4
line 264
;264:	setupMenuInfo.advanced.style						= UI_CENTER;
ADDRGP4 setupMenuInfo+1932+92
CNSTI4 1
ASGNI4
line 266
;265:
;266:	style = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRLP4 4
CNSTI4 264
ASGNI4
line 267
;267:	if( trap_Cvar_VariableValue( "cl_paused" ) ) {
ADDRGP4 $269
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
EQF4 $267
line 268
;268:		style |= QMF_GRAYED;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 269
;269:	}
LABELV $267
line 271
;270:
;271:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 272
;272:	setupMenuInfo.load.generic.type					= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+2140
CNSTI4 9
ASGNI4
line 273
;273:	setupMenuInfo.load.generic.flags				= style;
ADDRGP4 setupMenuInfo+2140+72
ADDRLP4 4
INDIRI4
CVIU4 4
ASGNU4
line 274
;274:	setupMenuInfo.load.generic.x					= 320;
ADDRGP4 setupMenuInfo+2140+28
CNSTI4 320
ASGNI4
line 275
;275:	setupMenuInfo.load.generic.y					= y;
ADDRGP4 setupMenuInfo+2140+32
ADDRLP4 0
INDIRI4
ASGNI4
line 276
;276:	setupMenuInfo.load.generic.id					= ID_LOAD;
ADDRGP4 setupMenuInfo+2140+24
CNSTI4 16
ASGNI4
line 277
;277:	setupMenuInfo.load.generic.callback				= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+2140+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 278
;278:	setupMenuInfo.load.color						= color_red;
ADDRGP4 setupMenuInfo+2140+100
ADDRGP4 color_red
ASGNP4
line 279
;279:	setupMenuInfo.load.style						= UI_CENTER;
ADDRGP4 setupMenuInfo+2140+92
CNSTI4 1
ASGNI4
line 281
;280:
;281:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 282
;282:	setupMenuInfo.save.generic.type					= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+2244
CNSTI4 9
ASGNI4
line 283
;283:	setupMenuInfo.save.generic.flags				= style;
ADDRGP4 setupMenuInfo+2244+72
ADDRLP4 4
INDIRI4
CVIU4 4
ASGNU4
line 284
;284:	setupMenuInfo.save.generic.x					= 320;
ADDRGP4 setupMenuInfo+2244+28
CNSTI4 320
ASGNI4
line 285
;285:	setupMenuInfo.save.generic.y					= y;
ADDRGP4 setupMenuInfo+2244+32
ADDRLP4 0
INDIRI4
ASGNI4
line 286
;286:	setupMenuInfo.save.generic.id					= ID_SAVE;
ADDRGP4 setupMenuInfo+2244+24
CNSTI4 17
ASGNI4
line 287
;287:	setupMenuInfo.save.generic.callback				= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+2244+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 288
;288:	setupMenuInfo.save.color						= color_red;
ADDRGP4 setupMenuInfo+2244+100
ADDRGP4 color_red
ASGNP4
line 289
;289:	setupMenuInfo.save.style						= UI_CENTER;
ADDRGP4 setupMenuInfo+2244+92
CNSTI4 1
ASGNI4
line 291
;290:
;291:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 292
;292:	setupMenuInfo.defaults.generic.type				= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+2348
CNSTI4 9
ASGNI4
line 293
;293:	setupMenuInfo.defaults.generic.flags			= style;
ADDRGP4 setupMenuInfo+2348+72
ADDRLP4 4
INDIRI4
CVIU4 4
ASGNU4
line 294
;294:	setupMenuInfo.defaults.generic.x				= 320;
ADDRGP4 setupMenuInfo+2348+28
CNSTI4 320
ASGNI4
line 295
;295:	setupMenuInfo.defaults.generic.y				= y;
ADDRGP4 setupMenuInfo+2348+32
ADDRLP4 0
INDIRI4
ASGNI4
line 296
;296:	setupMenuInfo.defaults.generic.id				= ID_DEFAULTS;
ADDRGP4 setupMenuInfo+2348+24
CNSTI4 18
ASGNI4
line 297
;297:	setupMenuInfo.defaults.generic.callback			= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+2348+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 298
;298:	setupMenuInfo.defaults.color					= color_red;
ADDRGP4 setupMenuInfo+2348+100
ADDRGP4 color_red
ASGNP4
line 299
;299:	setupMenuInfo.defaults.style					= UI_CENTER;
ADDRGP4 setupMenuInfo+2348+92
CNSTI4 1
ASGNI4
line 301
;300:	
;301:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 302
;302:	setupMenuInfo.language.generic.type					= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+2036
CNSTI4 9
ASGNI4
line 303
;303:	setupMenuInfo.language.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+2036+72
CNSTU4 264
ASGNU4
line 304
;304:	setupMenuInfo.language.generic.x					= 320;
ADDRGP4 setupMenuInfo+2036+28
CNSTI4 320
ASGNI4
line 305
;305:	setupMenuInfo.language.generic.y					= y;
ADDRGP4 setupMenuInfo+2036+32
ADDRLP4 0
INDIRI4
ASGNI4
line 306
;306:	setupMenuInfo.language.generic.id					= ID_LANGUAGE;
ADDRGP4 setupMenuInfo+2036+24
CNSTI4 15
ASGNI4
line 307
;307:	setupMenuInfo.language.generic.callback				= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+2036+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 308
;308:	setupMenuInfo.language.color						= color_red;
ADDRGP4 setupMenuInfo+2036+100
ADDRGP4 color_red
ASGNP4
line 309
;309:	setupMenuInfo.language.style						= UI_CENTER;
ADDRGP4 setupMenuInfo+2036+92
CNSTI4 1
ASGNI4
line 311
;310:
;311:	setupMenuInfo.back.generic.type					= MTYPE_BITMAP;
ADDRGP4 setupMenuInfo+2452
CNSTI4 6
ASGNI4
line 312
;312:	setupMenuInfo.back.generic.name					= ART_BACK0;
ADDRGP4 setupMenuInfo+2452+4
ADDRGP4 $333
ASGNP4
line 313
;313:	setupMenuInfo.back.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+2452+72
CNSTU4 260
ASGNU4
line 314
;314:	setupMenuInfo.back.generic.id					= ID_BACK;
ADDRGP4 setupMenuInfo+2452+24
CNSTI4 19
ASGNI4
line 315
;315:	setupMenuInfo.back.generic.callback				= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+2452+76
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 316
;316:	setupMenuInfo.back.generic.x					= 0 - uis.wideoffset;
ADDRGP4 setupMenuInfo+2452+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 317
;317:	setupMenuInfo.back.generic.y					= 480-64;
ADDRGP4 setupMenuInfo+2452+32
CNSTI4 416
ASGNI4
line 318
;318:	setupMenuInfo.back.width						= 128;
ADDRGP4 setupMenuInfo+2452+104
CNSTI4 128
ASGNI4
line 319
;319:	setupMenuInfo.back.height						= 64;
ADDRGP4 setupMenuInfo+2452+108
CNSTI4 64
ASGNI4
line 320
;320:	setupMenuInfo.back.focuspic						= ART_BACK1;
ADDRGP4 setupMenuInfo+2452+88
ADDRGP4 $351
ASGNP4
line 322
;321:	
;322:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $352
line 323
;323:	setupMenuInfo.banner.string						= "SETUP";
ADDRGP4 setupMenuInfo+1076+88
ADDRGP4 $357
ASGNP4
line 324
;324:	setupMenuInfo.setupplayer.string				= "PLAYER";
ADDRGP4 setupMenuInfo+1412+88
ADDRGP4 $360
ASGNP4
line 325
;325:	setupMenuInfo.setupmodel.string					= "MODEL";
ADDRGP4 setupMenuInfo+1516+88
ADDRGP4 $363
ASGNP4
line 326
;326:	setupMenuInfo.setupcontrols.string				= "CONTROLS";
ADDRGP4 setupMenuInfo+1620+88
ADDRGP4 $366
ASGNP4
line 327
;327:	setupMenuInfo.setupsystem.string				= "SYSTEM";
ADDRGP4 setupMenuInfo+1724+88
ADDRGP4 $369
ASGNP4
line 328
;328:	setupMenuInfo.game.string						= "GAME OPTIONS";
ADDRGP4 setupMenuInfo+1828+88
ADDRGP4 $372
ASGNP4
line 329
;329:	setupMenuInfo.advanced.string					= "ADVANCED";
ADDRGP4 setupMenuInfo+1932+88
ADDRGP4 $375
ASGNP4
line 330
;330:	setupMenuInfo.load.string						= "LOAD/EXEC CONFIG";
ADDRGP4 setupMenuInfo+2140+88
ADDRGP4 $378
ASGNP4
line 331
;331:	setupMenuInfo.save.string						= "SAVE CONFIG";
ADDRGP4 setupMenuInfo+2244+88
ADDRGP4 $381
ASGNP4
line 332
;332:	setupMenuInfo.defaults.string					= "DEFAULTS";
ADDRGP4 setupMenuInfo+2348+88
ADDRGP4 $384
ASGNP4
line 333
;333:	setupMenuInfo.language.string					= "РУССКИЙ";
ADDRGP4 setupMenuInfo+2036+88
ADDRGP4 $387
ASGNP4
line 334
;334:	}
LABELV $352
line 335
;335:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $388
line 336
;336:	setupMenuInfo.banner.string						= "НАСТРОЙКИ";
ADDRGP4 setupMenuInfo+1076+88
ADDRGP4 $393
ASGNP4
line 337
;337:	setupMenuInfo.setupplayer.string				= "ИГРОК";
ADDRGP4 setupMenuInfo+1412+88
ADDRGP4 $396
ASGNP4
line 338
;338:	setupMenuInfo.setupmodel.string					= "МОДЕЛЬ";
ADDRGP4 setupMenuInfo+1516+88
ADDRGP4 $399
ASGNP4
line 339
;339:	setupMenuInfo.setupcontrols.string				= "УПРАВЛЕНИЕ";
ADDRGP4 setupMenuInfo+1620+88
ADDRGP4 $402
ASGNP4
line 340
;340:	setupMenuInfo.setupsystem.string				= "СИСТЕМА";
ADDRGP4 setupMenuInfo+1724+88
ADDRGP4 $405
ASGNP4
line 341
;341:	setupMenuInfo.game.string						= "ИГРОВЫЕ ОПЦИИ";
ADDRGP4 setupMenuInfo+1828+88
ADDRGP4 $408
ASGNP4
line 342
;342:	setupMenuInfo.advanced.string					= "РАСШИРЕННЫЕ ОПЦИИ";
ADDRGP4 setupMenuInfo+1932+88
ADDRGP4 $411
ASGNP4
line 343
;343:	setupMenuInfo.load.string						= "ЗАГРУЗКА КОНФИГОВ";
ADDRGP4 setupMenuInfo+2140+88
ADDRGP4 $414
ASGNP4
line 344
;344:	setupMenuInfo.save.string						= "СОХРАНЕНИЕ КОНФИГОВ";
ADDRGP4 setupMenuInfo+2244+88
ADDRGP4 $417
ASGNP4
line 345
;345:	setupMenuInfo.defaults.string					= "СБРОС";
ADDRGP4 setupMenuInfo+2348+88
ADDRGP4 $420
ASGNP4
line 346
;346:	setupMenuInfo.language.string					= "ENGLISH";
ADDRGP4 setupMenuInfo+2036+88
ADDRGP4 $423
ASGNP4
line 347
;347:	}
LABELV $388
line 349
;348:
;349:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.banner );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 350
;350:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.framel );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 351
;351:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.framer );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 352
;352:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.setupplayer );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 353
;353:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.setupmodel );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+1516
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 354
;354:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.setupcontrols );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+1620
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 355
;355:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.setupsystem );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+1724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 356
;356:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.game );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+1828
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 357
;357:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.advanced );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+1932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 358
;358:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.language );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+2036
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 359
;359:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.defaults );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+2348
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 360
;360:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.load );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+2140
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 361
;361:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.save );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+2244
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 362
;362:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.back );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+2452
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 363
;363:}
LABELV $136
endproc UI_SetupMenu_Init 12 12
export UI_SetupMenu_Cache
proc UI_SetupMenu_Cache 0 4
line 371
;364:
;365:
;366:/*
;367:=================
;368:UI_SetupMenu_Cache
;369:=================
;370:*/
;371:void UI_SetupMenu_Cache( void ) {
line 372
;372:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $333
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 373
;373:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $351
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 374
;374:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $152
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 375
;375:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $166
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 376
;376:}
LABELV $438
endproc UI_SetupMenu_Cache 0 4
export UI_SetupMenu
proc UI_SetupMenu 0 4
line 384
;377:
;378:
;379:/*
;380:===============
;381:UI_SetupMenu
;382:===============
;383:*/
;384:void UI_SetupMenu( void ) {
line 385
;385:	UI_SetupMenu_Init();
ADDRGP4 UI_SetupMenu_Init
CALLV
pop
line 386
;386:	UI_PushMenu( &setupMenuInfo.menu );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 387
;387:}
LABELV $439
endproc UI_SetupMenu 0 4
bss
align 4
LABELV setupMenuInfo
skip 2568
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
LABELV $423
byte 1 69
byte 1 78
byte 1 71
byte 1 76
byte 1 73
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $420
byte 1 208
byte 1 161
byte 1 208
byte 1 145
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 161
byte 1 0
align 1
LABELV $417
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 165
byte 1 208
byte 1 160
byte 1 208
byte 1 144
byte 1 208
byte 1 157
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
byte 1 154
byte 1 208
byte 1 158
byte 1 208
byte 1 157
byte 1 208
byte 1 164
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 0
align 1
LABELV $414
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
byte 1 154
byte 1 208
byte 1 144
byte 1 32
byte 1 208
byte 1 154
byte 1 208
byte 1 158
byte 1 208
byte 1 157
byte 1 208
byte 1 164
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 0
align 1
LABELV $411
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
LABELV $408
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
LABELV $405
byte 1 208
byte 1 161
byte 1 208
byte 1 152
byte 1 208
byte 1 161
byte 1 208
byte 1 162
byte 1 208
byte 1 149
byte 1 208
byte 1 156
byte 1 208
byte 1 144
byte 1 0
align 1
LABELV $402
byte 1 208
byte 1 163
byte 1 208
byte 1 159
byte 1 208
byte 1 160
byte 1 208
byte 1 144
byte 1 208
byte 1 146
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
byte 1 0
align 1
LABELV $399
byte 1 208
byte 1 156
byte 1 208
byte 1 158
byte 1 208
byte 1 148
byte 1 208
byte 1 149
byte 1 208
byte 1 155
byte 1 208
byte 1 172
byte 1 0
align 1
LABELV $396
byte 1 208
byte 1 152
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 154
byte 1 0
align 1
LABELV $393
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
LABELV $387
byte 1 208
byte 1 160
byte 1 208
byte 1 163
byte 1 208
byte 1 161
byte 1 208
byte 1 161
byte 1 208
byte 1 154
byte 1 208
byte 1 152
byte 1 208
byte 1 153
byte 1 0
align 1
LABELV $384
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $381
byte 1 83
byte 1 65
byte 1 86
byte 1 69
byte 1 32
byte 1 67
byte 1 79
byte 1 78
byte 1 70
byte 1 73
byte 1 71
byte 1 0
align 1
LABELV $378
byte 1 76
byte 1 79
byte 1 65
byte 1 68
byte 1 47
byte 1 69
byte 1 88
byte 1 69
byte 1 67
byte 1 32
byte 1 67
byte 1 79
byte 1 78
byte 1 70
byte 1 73
byte 1 71
byte 1 0
align 1
LABELV $375
byte 1 65
byte 1 68
byte 1 86
byte 1 65
byte 1 78
byte 1 67
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $372
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
LABELV $369
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 0
align 1
LABELV $366
byte 1 67
byte 1 79
byte 1 78
byte 1 84
byte 1 82
byte 1 79
byte 1 76
byte 1 83
byte 1 0
align 1
LABELV $363
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $360
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $357
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $351
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
LABELV $333
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
LABELV $269
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $166
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
LABELV $152
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
LABELV $132
byte 1 208
byte 1 161
byte 1 208
byte 1 145
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 161
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 32
byte 1 208
byte 1 148
byte 1 208
byte 1 158
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 162
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 208
byte 1 148
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 162
byte 1 208
byte 1 157
byte 1 208
byte 1 171
byte 1 208
byte 1 165
byte 1 63
byte 1 0
align 1
LABELV $128
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 84
byte 1 79
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 83
byte 1 63
byte 1 0
align 1
LABELV $118
byte 1 99
byte 1 108
byte 1 95
byte 1 108
byte 1 97
byte 1 110
byte 1 103
byte 1 117
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $101
byte 1 42
byte 1 208
byte 1 146
byte 1 208
byte 1 161
byte 1 208
byte 1 149
byte 1 42
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
byte 1 184
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 190
byte 1 32
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
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 209
byte 1 133
byte 1 46
byte 1 0
align 1
LABELV $99
byte 1 208
byte 1 146
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 156
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 149
byte 1 58
byte 1 32
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 180
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
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 32
byte 1 209
byte 1 133
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $94
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $92
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
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 42
byte 1 65
byte 1 76
byte 1 76
byte 1 42
byte 1 0
align 1
LABELV $86
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
byte 1 10
byte 1 0
align 1
LABELV $85
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $84
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
