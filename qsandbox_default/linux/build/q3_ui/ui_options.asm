code
proc Options_Event 8 0
file "../../../code/q3_ui/ui_options.c"
line 48
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2:/*
;3:=======================================================================
;4:
;5:SYSTEM CONFIGURATION MENU
;6:
;7:=======================================================================
;8:*/
;9:
;10:#include "ui_local.h"
;11:
;12:
;13:#define ART_FRAMEL			"menu/art/frame2_l"
;14:#define ART_FRAMER			"menu/art/frame1_r"
;15:#define ART_BACK0			"menu/art/back_0"
;16:#define ART_BACK1			"menu/art/back_1"
;17:
;18:#define ID_GRAPHICS			10
;19:#define ID_DISPLAY			11
;20:#define ID_SOUND			12
;21:#define ID_NETWORK			13
;22:#define ID_BACK				14
;23:
;24:#define VERTICAL_SPACING	34
;25:
;26:typedef struct {
;27:	menuframework_s	menu;
;28:
;29:	menutext_s		banner;
;30:	menubitmap_s	framel;
;31:	menubitmap_s	framer;
;32:
;33:	menutext_s		graphics;
;34:	menutext_s		display;
;35:	menutext_s		sound;
;36:	menutext_s		network;
;37:	menubitmap_s	back;
;38:} optionsmenu_t;
;39:
;40:static optionsmenu_t	s_options;
;41:
;42:
;43:/*
;44:=================
;45:Options_Event
;46:=================
;47:*/
;48:static void Options_Event( void* ptr, int event ) {
line 49
;49:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 50
;50:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 53
;51:	}
;52:
;53:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 14
GTI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $92-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $92
address $87
address $88
address $89
address $90
address $91
code
LABELV $87
line 55
;54:	case ID_GRAPHICS:
;55:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 56
;56:		break;
ADDRGP4 $85
JUMPV
LABELV $88
line 59
;57:
;58:	case ID_DISPLAY:
;59:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 60
;60:		break;
ADDRGP4 $85
JUMPV
LABELV $89
line 63
;61:
;62:	case ID_SOUND:
;63:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 64
;64:		break;
ADDRGP4 $85
JUMPV
LABELV $90
line 67
;65:
;66:	case ID_NETWORK:
;67:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 68
;68:		break;
ADDRGP4 $85
JUMPV
LABELV $91
line 71
;69:
;70:	case ID_BACK:
;71:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 72
;72:		break;
LABELV $84
LABELV $85
line 74
;73:	}
;74:}
LABELV $81
endproc Options_Event 8 0
export SystemConfig_Cache
proc SystemConfig_Cache 0 4
line 82
;75:
;76:
;77:/*
;78:===============
;79:SystemConfig_Cache
;80:===============
;81:*/
;82:void SystemConfig_Cache( void ) {
line 83
;83:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $95
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 84
;84:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $96
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 85
;85:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $97
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 86
;86:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $98
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 87
;87:}
LABELV $94
endproc SystemConfig_Cache 0 4
export Options_MenuInit
proc Options_MenuInit 3088 12
line 94
;88:
;89:/*
;90:===============
;91:Options_MenuInit
;92:===============
;93:*/
;94:void Options_MenuInit( void ) {
line 98
;95:	int				y;
;96:	uiClientState_t	cstate;
;97:
;98:	memset( &s_options, 0, sizeof(optionsmenu_t) );
ADDRGP4 s_options
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1944
ARGI4
ADDRGP4 memset
CALLP4
pop
line 100
;99:
;100:	SystemConfig_Cache();
ADDRGP4 SystemConfig_Cache
CALLV
pop
line 101
;101:	s_options.menu.wrapAround = qtrue;
ADDRGP4 s_options+1044
CNSTI4 1
ASGNI4
line 102
;102:	s_options.menu.native 	   = qfalse;
ADDRGP4 s_options+1056
CNSTI4 0
ASGNI4
line 104
;103:
;104:	trap_GetClientState( &cstate );
ADDRLP4 4
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 105
;105:	if ( cstate.connState >= CA_CONNECTED ) {
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $102
line 106
;106:		s_options.menu.fullscreen = qfalse;
ADDRGP4 s_options+1052
CNSTI4 0
ASGNI4
line 107
;107:	}
ADDRGP4 $103
JUMPV
LABELV $102
line 108
;108:	else {
line 109
;109:		s_options.menu.fullscreen = qtrue;
ADDRGP4 s_options+1052
CNSTI4 1
ASGNI4
line 110
;110:	}
LABELV $103
line 112
;111:
;112:	s_options.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 s_options+1076
CNSTI4 10
ASGNI4
line 113
;113:	s_options.banner.generic.flags	= QMF_CENTER_JUSTIFY;
ADDRGP4 s_options+1076+72
CNSTU4 8
ASGNU4
line 114
;114:	s_options.banner.generic.x		= 320;
ADDRGP4 s_options+1076+28
CNSTI4 320
ASGNI4
line 115
;115:	s_options.banner.generic.y		= 16;
ADDRGP4 s_options+1076+32
CNSTI4 16
ASGNI4
line 116
;116:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $113
line 117
;117:	s_options.banner.string		    = "SYSTEM SETUP";
ADDRGP4 s_options+1076+88
ADDRGP4 $118
ASGNP4
line 118
;118:	}
LABELV $113
line 119
;119:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $119
line 120
;120:	s_options.banner.string		    = "СИСТЕМНЫЕ НАСТРОЙКИ";
ADDRGP4 s_options+1076+88
ADDRGP4 $124
ASGNP4
line 121
;121:	}
LABELV $119
line 122
;122:	s_options.banner.color			= color_white;
ADDRGP4 s_options+1076+100
ADDRGP4 color_white
ASGNP4
line 123
;123:	s_options.banner.style			= UI_CENTER;
ADDRGP4 s_options+1076+92
CNSTI4 1
ASGNI4
line 125
;124:
;125:	s_options.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_options+1180
CNSTI4 6
ASGNI4
line 126
;126:	s_options.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_options+1180+4
ADDRGP4 $95
ASGNP4
line 127
;127:	s_options.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_options+1180+72
CNSTU4 16384
ASGNU4
line 128
;128:	s_options.framel.generic.x	   = 8;  
ADDRGP4 s_options+1180+28
CNSTI4 8
ASGNI4
line 129
;129:	s_options.framel.generic.y	   = 76;
ADDRGP4 s_options+1180+32
CNSTI4 76
ASGNI4
line 130
;130:	s_options.framel.width  	   = 256;
ADDRGP4 s_options+1180+104
CNSTI4 256
ASGNI4
line 131
;131:	s_options.framel.height  	   = 334;
ADDRGP4 s_options+1180+108
CNSTI4 334
ASGNI4
line 133
;132:
;133:	s_options.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_options+1296
CNSTI4 6
ASGNI4
line 134
;134:	s_options.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_options+1296+4
ADDRGP4 $96
ASGNP4
line 135
;135:	s_options.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_options+1296+72
CNSTU4 16384
ASGNU4
line 136
;136:	s_options.framer.generic.x	   = 376;
ADDRGP4 s_options+1296+28
CNSTI4 376
ASGNI4
line 137
;137:	s_options.framer.generic.y	   = 76;
ADDRGP4 s_options+1296+32
CNSTI4 76
ASGNI4
line 138
;138:	s_options.framer.width  	   = 256;
ADDRGP4 s_options+1296+104
CNSTI4 256
ASGNI4
line 139
;139:	s_options.framer.height  	   = 334;
ADDRGP4 s_options+1296+108
CNSTI4 334
ASGNI4
line 141
;140:
;141:	y = 168;
ADDRLP4 0
CNSTI4 168
ASGNI4
line 142
;142:	s_options.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_options+1412
CNSTI4 9
ASGNI4
line 143
;143:	s_options.graphics.generic.flags	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_options+1412+72
CNSTU4 264
ASGNU4
line 144
;144:	s_options.graphics.generic.callback	= Options_Event;
ADDRGP4 s_options+1412+76
ADDRGP4 Options_Event
ASGNP4
line 145
;145:	s_options.graphics.generic.id		= ID_GRAPHICS;
ADDRGP4 s_options+1412+24
CNSTI4 10
ASGNI4
line 146
;146:	s_options.graphics.generic.x		= 320;
ADDRGP4 s_options+1412+28
CNSTI4 320
ASGNI4
line 147
;147:	s_options.graphics.generic.y		= y;
ADDRGP4 s_options+1412+32
ADDRLP4 0
INDIRI4
ASGNI4
line 148
;148:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $166
line 149
;149:	s_options.graphics.string			= "GRAPHICS";
ADDRGP4 s_options+1412+88
ADDRGP4 $171
ASGNP4
line 150
;150:	}
LABELV $166
line 151
;151:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $172
line 152
;152:	s_options.graphics.string			= "ГРАФИКА";
ADDRGP4 s_options+1412+88
ADDRGP4 $177
ASGNP4
line 153
;153:	}
LABELV $172
line 154
;154:	s_options.graphics.color			= color_red;
ADDRGP4 s_options+1412+100
ADDRGP4 color_red
ASGNP4
line 155
;155:	s_options.graphics.style			= UI_CENTER;
ADDRGP4 s_options+1412+92
CNSTI4 1
ASGNI4
line 157
;156:
;157:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 158
;158:	s_options.display.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_options+1516
CNSTI4 9
ASGNI4
line 159
;159:	s_options.display.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_options+1516+72
CNSTU4 264
ASGNU4
line 160
;160:	s_options.display.generic.callback	= Options_Event;
ADDRGP4 s_options+1516+76
ADDRGP4 Options_Event
ASGNP4
line 161
;161:	s_options.display.generic.id		= ID_DISPLAY;
ADDRGP4 s_options+1516+24
CNSTI4 11
ASGNI4
line 162
;162:	s_options.display.generic.x			= 320;
ADDRGP4 s_options+1516+28
CNSTI4 320
ASGNI4
line 163
;163:	s_options.display.generic.y			= y;
ADDRGP4 s_options+1516+32
ADDRLP4 0
INDIRI4
ASGNI4
line 164
;164:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $193
line 165
;165:	s_options.display.string			= "DISPLAY";
ADDRGP4 s_options+1516+88
ADDRGP4 $198
ASGNP4
line 166
;166:	}
LABELV $193
line 167
;167:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $199
line 168
;168:	s_options.display.string			= "ЭКРАН";
ADDRGP4 s_options+1516+88
ADDRGP4 $204
ASGNP4
line 169
;169:	}
LABELV $199
line 170
;170:	s_options.display.color				= color_red;
ADDRGP4 s_options+1516+100
ADDRGP4 color_red
ASGNP4
line 171
;171:	s_options.display.style				= UI_CENTER;
ADDRGP4 s_options+1516+92
CNSTI4 1
ASGNI4
line 173
;172:
;173:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 174
;174:	s_options.sound.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_options+1620
CNSTI4 9
ASGNI4
line 175
;175:	s_options.sound.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_options+1620+72
CNSTU4 264
ASGNU4
line 176
;176:	s_options.sound.generic.callback	= Options_Event;
ADDRGP4 s_options+1620+76
ADDRGP4 Options_Event
ASGNP4
line 177
;177:	s_options.sound.generic.id			= ID_SOUND;
ADDRGP4 s_options+1620+24
CNSTI4 12
ASGNI4
line 178
;178:	s_options.sound.generic.x			= 320;
ADDRGP4 s_options+1620+28
CNSTI4 320
ASGNI4
line 179
;179:	s_options.sound.generic.y			= y;
ADDRGP4 s_options+1620+32
ADDRLP4 0
INDIRI4
ASGNI4
line 180
;180:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $220
line 181
;181:	s_options.sound.string				= "SOUND";
ADDRGP4 s_options+1620+88
ADDRGP4 $225
ASGNP4
line 182
;182:	}
LABELV $220
line 183
;183:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $226
line 184
;184:	s_options.sound.string				= "ЗВУК";
ADDRGP4 s_options+1620+88
ADDRGP4 $231
ASGNP4
line 185
;185:	}
LABELV $226
line 186
;186:	s_options.sound.color				= color_red;
ADDRGP4 s_options+1620+100
ADDRGP4 color_red
ASGNP4
line 187
;187:	s_options.sound.style				= UI_CENTER;
ADDRGP4 s_options+1620+92
CNSTI4 1
ASGNI4
line 189
;188:
;189:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 190
;190:	s_options.network.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_options+1724
CNSTI4 9
ASGNI4
line 191
;191:	s_options.network.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_options+1724+72
CNSTU4 264
ASGNU4
line 192
;192:	s_options.network.generic.callback	= Options_Event;
ADDRGP4 s_options+1724+76
ADDRGP4 Options_Event
ASGNP4
line 193
;193:	s_options.network.generic.id		= ID_NETWORK;
ADDRGP4 s_options+1724+24
CNSTI4 13
ASGNI4
line 194
;194:	s_options.network.generic.x			= 320;
ADDRGP4 s_options+1724+28
CNSTI4 320
ASGNI4
line 195
;195:	s_options.network.generic.y			= y;
ADDRGP4 s_options+1724+32
ADDRLP4 0
INDIRI4
ASGNI4
line 196
;196:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $247
line 197
;197:	s_options.network.string			= "NETWORK";
ADDRGP4 s_options+1724+88
ADDRGP4 $252
ASGNP4
line 198
;198:	}
LABELV $247
line 199
;199:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $253
line 200
;200:	s_options.network.string			= "СЕТЬ";
ADDRGP4 s_options+1724+88
ADDRGP4 $258
ASGNP4
line 201
;201:	}
LABELV $253
line 202
;202:	s_options.network.color				= color_red;
ADDRGP4 s_options+1724+100
ADDRGP4 color_red
ASGNP4
line 203
;203:	s_options.network.style				= UI_CENTER;
ADDRGP4 s_options+1724+92
CNSTI4 1
ASGNI4
line 205
;204:
;205:	s_options.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_options+1828
CNSTI4 6
ASGNI4
line 206
;206:	s_options.back.generic.name     = ART_BACK0;
ADDRGP4 s_options+1828+4
ADDRGP4 $97
ASGNP4
line 207
;207:	s_options.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_options+1828+72
CNSTU4 260
ASGNU4
line 208
;208:	s_options.back.generic.callback = Options_Event;
ADDRGP4 s_options+1828+76
ADDRGP4 Options_Event
ASGNP4
line 209
;209:	s_options.back.generic.id	    = ID_BACK;
ADDRGP4 s_options+1828+24
CNSTI4 14
ASGNI4
line 210
;210:	s_options.back.generic.x		= 0;
ADDRGP4 s_options+1828+28
CNSTI4 0
ASGNI4
line 211
;211:	s_options.back.generic.y		= 480-64;
ADDRGP4 s_options+1828+32
CNSTI4 416
ASGNI4
line 212
;212:	s_options.back.width  		    = 128;
ADDRGP4 s_options+1828+104
CNSTI4 128
ASGNI4
line 213
;213:	s_options.back.height  		    = 64;
ADDRGP4 s_options+1828+108
CNSTI4 64
ASGNI4
line 214
;214:	s_options.back.focuspic         = ART_BACK1;
ADDRGP4 s_options+1828+88
ADDRGP4 $98
ASGNP4
line 216
;215:
;216:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.banner );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 217
;217:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.framel );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 218
;218:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.framer );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 219
;219:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.graphics );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 220
;220:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.display );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+1516
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 221
;221:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.sound );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+1620
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 222
;222:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.network );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+1724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 223
;223:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.back );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+1828
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 224
;224:}
LABELV $99
endproc Options_MenuInit 3088 12
export UI_SystemConfigMenu
proc UI_SystemConfigMenu 0 4
line 232
;225:
;226:
;227:/*
;228:===============
;229:UI_SystemConfigMenu
;230:===============
;231:*/
;232:void UI_SystemConfigMenu( void ) {
line 233
;233:	Options_MenuInit();
ADDRGP4 Options_MenuInit
CALLV
pop
line 234
;234:	UI_PushMenu ( &s_options.menu );
ADDRGP4 s_options
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 235
;235:}
LABELV $290
endproc UI_SystemConfigMenu 0 4
bss
align 4
LABELV s_options
skip 1944
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
LABELV $258
byte 1 208
byte 1 161
byte 1 208
byte 1 149
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 0
align 1
LABELV $252
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $231
byte 1 208
byte 1 151
byte 1 208
byte 1 146
byte 1 208
byte 1 163
byte 1 208
byte 1 154
byte 1 0
align 1
LABELV $225
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $204
byte 1 208
byte 1 173
byte 1 208
byte 1 154
byte 1 208
byte 1 160
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 0
align 1
LABELV $198
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $177
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 144
byte 1 208
byte 1 164
byte 1 208
byte 1 152
byte 1 208
byte 1 154
byte 1 208
byte 1 144
byte 1 0
align 1
LABELV $171
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 72
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $124
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
LABELV $118
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $98
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
LABELV $97
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
LABELV $96
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
LABELV $95
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
