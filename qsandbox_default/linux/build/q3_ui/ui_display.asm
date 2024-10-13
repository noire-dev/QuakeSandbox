code
proc UI_DisplayOptionsMenu_Event 8 8
file "../../../code/q3_ui/ui_display.c"
line 81
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:DISPLAY OPTIONS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:
;14:#define ART_FRAMEL			"menu/art/frame2_l"
;15:#define ART_FRAMER			"menu/art/frame1_r"
;16:#define ART_BACK0			"menu/art/back_0"
;17:#define ART_BACK1			"menu/art/back_1"
;18:
;19:#define ID_GRAPHICS			10
;20:#define ID_DISPLAY			11
;21:#define ID_SOUND			12
;22:#define ID_NETWORK			13
;23:#define ID_BRIGHTNESS		14
;24:#define ID_SCREENSIZE		15
;25:#define ID_BACK				16
;26:#define ID_CROSSSIZE		17
;27:#define ID_THIRDPERSON			18
;28:#define ID_OLDSCORE				19
;29:#define ID_THIRDPERSONRANGE		20
;30:#define ID_THIRDPERSONOFFSET	21
;31:#define ID_ICONS			22
;32:#define ID_STATUS			23
;33:#define ID_GUN				24
;34:#define ID_SPEED			25
;35:#define ID_FRIEND			26
;36:#define ID_ISTYLE			27
;37:#define ID_REALVIEW			28
;38:#define ID_REALVIEWF		29
;39:#define ID_REALVIEWU		30
;40:
;41:typedef struct {
;42:	menuframework_s	menu;
;43:
;44:	menutext_s		banner;
;45:	menubitmap_s	framel;
;46:	menubitmap_s	framer;
;47:
;48:	menutext_s		graphics;
;49:	menutext_s		display;
;50:	menutext_s		sound;
;51:	menutext_s		network;
;52:
;53:	menuslider_s	brightness;
;54:	menuslider_s	screensize;
;55:	menuslider_s	crosssize;
;56:    menuradiobutton_s  thirdperson;
;57:    menuradiobutton_s  oldscore;
;58:	menuslider_s	thirdpersonrange;
;59:	menuslider_s	thirdpersonoffset;
;60:	menuradiobutton_s  icons;
;61:	menuradiobutton_s  status;
;62:	menuslider_s  gun;
;63:	menuslider_s  istyle;
;64:	menuslider_s  rview;
;65:	menuslider_s  rviewf;
;66:	menuslider_s  rviewu;
;67:	menuradiobutton_s  speed;
;68:	menuradiobutton_s  friend;
;69:
;70:	menubitmap_s	back;
;71:} displayOptionsInfo_t;
;72:
;73:static displayOptionsInfo_t	displayOptionsInfo;
;74:
;75:
;76:/*
;77:=================
;78:UI_DisplayOptionsMenu_Event
;79:=================
;80:*/
;81:static void UI_DisplayOptionsMenu_Event( void* ptr, int event ) {
line 82
;82:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 83
;83:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 86
;84:	}
;85:
;86:	switch( ((menucommon_s*)ptr)->id ) {
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
CNSTI4 30
GTI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $196-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $196
address $87
address $85
address $89
address $90
address $91
address $95
address $195
address $99
address $103
address $107
address $111
address $115
address $119
address $123
address $127
address $179
address $183
address $187
address $149
address $171
address $175
code
LABELV $87
line 88
;87:	case ID_GRAPHICS:
;88:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 89
;89:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 90
;90:		break;
ADDRGP4 $85
JUMPV
line 93
;91:
;92:	case ID_DISPLAY:
;93:		break;
LABELV $89
line 96
;94:
;95:	case ID_SOUND:
;96:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 97
;97:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 98
;98:		break;
ADDRGP4 $85
JUMPV
LABELV $90
line 101
;99:
;100:	case ID_NETWORK:
;101:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 102
;102:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 103
;103:		break;
ADDRGP4 $85
JUMPV
LABELV $91
line 106
;104:
;105:	case ID_BRIGHTNESS:
;106:		trap_Cvar_SetValue( "r_gamma", displayOptionsInfo.brightness.curvalue / 10.0f );
ADDRGP4 $92
ARGP4
ADDRGP4 displayOptionsInfo+1828+96
INDIRF4
CNSTF4 1092616192
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 107
;107:		break;
ADDRGP4 $85
JUMPV
LABELV $95
line 110
;108:	
;109:	case ID_SCREENSIZE:
;110:		trap_Cvar_SetValue( "cg_viewsize", displayOptionsInfo.screensize.curvalue * 10 );
ADDRGP4 $96
ARGP4
CNSTF4 1092616192
ADDRGP4 displayOptionsInfo+1932+96
INDIRF4
MULF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 111
;111:		break;
ADDRGP4 $85
JUMPV
LABELV $99
line 114
;112:
;113:	case ID_CROSSSIZE:
;114:		trap_Cvar_SetValue( "cg_crosshairScale", displayOptionsInfo.crosssize.curvalue);
ADDRGP4 $100
ARGP4
ADDRGP4 displayOptionsInfo+2036+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 115
;115:		break;
ADDRGP4 $85
JUMPV
LABELV $103
line 118
;116:
;117:	case ID_THIRDPERSON:
;118:		trap_Cvar_SetValue( "cg_thirdperson", displayOptionsInfo.thirdperson.curvalue);
ADDRGP4 $104
ARGP4
ADDRGP4 displayOptionsInfo+2140+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 119
;119:		break;
ADDRGP4 $85
JUMPV
LABELV $107
line 122
;120:
;121:	case ID_OLDSCORE:
;122:		trap_Cvar_SetValue( "cg_oldscoreboard", displayOptionsInfo.oldscore.curvalue);
ADDRGP4 $108
ARGP4
ADDRGP4 displayOptionsInfo+2236+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 123
;123:		break;
ADDRGP4 $85
JUMPV
LABELV $111
line 126
;124:
;125:	case ID_THIRDPERSONRANGE:
;126:		trap_Cvar_SetValue( "cg_thirdpersonrange", displayOptionsInfo.thirdpersonrange.curvalue);
ADDRGP4 $112
ARGP4
ADDRGP4 displayOptionsInfo+2332+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 127
;127:		break;
ADDRGP4 $85
JUMPV
LABELV $115
line 130
;128:
;129:	case ID_THIRDPERSONOFFSET:
;130:		trap_Cvar_SetValue( "cg_thirdpersonoffset", displayOptionsInfo.thirdpersonoffset.curvalue);
ADDRGP4 $116
ARGP4
ADDRGP4 displayOptionsInfo+2436+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 131
;131:		break;
ADDRGP4 $85
JUMPV
LABELV $119
line 134
;132:
;133:	case ID_ICONS:
;134:		trap_Cvar_SetValue( "cg_draw3dIcons", displayOptionsInfo.icons.curvalue);
ADDRGP4 $120
ARGP4
ADDRGP4 displayOptionsInfo+2540+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 135
;135:		break;
ADDRGP4 $85
JUMPV
LABELV $123
line 138
;136:
;137:	case ID_STATUS:
;138:		trap_Cvar_SetValue( "cg_drawstatus", displayOptionsInfo.status.curvalue);
ADDRGP4 $124
ARGP4
ADDRGP4 displayOptionsInfo+2636+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 139
;139:		break;
ADDRGP4 $85
JUMPV
LABELV $127
line 142
;140:
;141:	case ID_GUN:
;142:		displayOptionsInfo.gun.curvalue = (int)(displayOptionsInfo.gun.curvalue + 0.5);
ADDRGP4 displayOptionsInfo+2732+96
ADDRGP4 displayOptionsInfo+2732+96
INDIRF4
CNSTF4 1056964608
ADDF4
CVFI4 4
CVIF4 4
ASGNF4
line 143
;143:		if(displayOptionsInfo.gun.curvalue == 0){
ADDRGP4 displayOptionsInfo+2732+96
INDIRF4
CNSTF4 0
NEF4 $132
line 144
;144:		trap_Cvar_SetValue( "cg_drawGun", 0);
ADDRGP4 $136
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 145
;145:		}
LABELV $132
line 146
;146:		if(displayOptionsInfo.gun.curvalue == 1){
ADDRGP4 displayOptionsInfo+2732+96
INDIRF4
CNSTF4 1065353216
NEF4 $137
line 147
;147:		trap_Cvar_SetValue( "cg_drawGun", 2);
ADDRGP4 $136
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 148
;148:		}
LABELV $137
line 149
;149:		if(displayOptionsInfo.gun.curvalue == 2){
ADDRGP4 displayOptionsInfo+2732+96
INDIRF4
CNSTF4 1073741824
NEF4 $141
line 150
;150:		trap_Cvar_SetValue( "cg_drawGun", 3);
ADDRGP4 $136
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 151
;151:		}
LABELV $141
line 152
;152:		if(displayOptionsInfo.gun.curvalue == 3){
ADDRGP4 displayOptionsInfo+2732+96
INDIRF4
CNSTF4 1077936128
NEF4 $85
line 153
;153:		trap_Cvar_SetValue( "cg_drawGun", 1);
ADDRGP4 $136
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 154
;154:		}
line 155
;155:		break;
ADDRGP4 $85
JUMPV
LABELV $149
line 158
;156:
;157:	case ID_REALVIEW:
;158:		displayOptionsInfo.rview.curvalue = (int)(displayOptionsInfo.rview.curvalue + 0.5);
ADDRGP4 displayOptionsInfo+2940+96
ADDRGP4 displayOptionsInfo+2940+96
INDIRF4
CNSTF4 1056964608
ADDF4
CVFI4 4
CVIF4 4
ASGNF4
line 159
;159:		if(displayOptionsInfo.rview.curvalue == 0){
ADDRGP4 displayOptionsInfo+2940+96
INDIRF4
CNSTF4 0
NEF4 $154
line 160
;160:		trap_Cvar_SetValue( "cg_cameraEyes", 0);
ADDRGP4 $158
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 161
;161:		}
LABELV $154
line 162
;162:		if(displayOptionsInfo.rview.curvalue == 1){
ADDRGP4 displayOptionsInfo+2940+96
INDIRF4
CNSTF4 1065353216
NEF4 $159
line 163
;163:		trap_Cvar_SetValue( "cg_cameraEyes", 1);
ADDRGP4 $158
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 164
;164:		}
LABELV $159
line 165
;165:		if(displayOptionsInfo.rview.curvalue == 2){
ADDRGP4 displayOptionsInfo+2940+96
INDIRF4
CNSTF4 1073741824
NEF4 $163
line 166
;166:		trap_Cvar_SetValue( "cg_cameraEyes", 2);
ADDRGP4 $158
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 167
;167:		}
LABELV $163
line 168
;168:		if(displayOptionsInfo.rview.curvalue == 3){
ADDRGP4 displayOptionsInfo+2940+96
INDIRF4
CNSTF4 1077936128
NEF4 $85
line 169
;169:		trap_Cvar_SetValue( "cg_cameraEyes", 3);
ADDRGP4 $158
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 170
;170:		}
line 171
;171:		break;
ADDRGP4 $85
JUMPV
LABELV $171
line 174
;172:
;173:	case ID_REALVIEWF:
;174:		trap_Cvar_SetValue( "cg_cameraEyes_Fwd", displayOptionsInfo.rviewf.curvalue);
ADDRGP4 $172
ARGP4
ADDRGP4 displayOptionsInfo+3044+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 175
;175:		break;
ADDRGP4 $85
JUMPV
LABELV $175
line 178
;176:
;177:	case ID_REALVIEWU:
;178:		trap_Cvar_SetValue( "cg_cameraEyes_Up", displayOptionsInfo.rviewu.curvalue);
ADDRGP4 $176
ARGP4
ADDRGP4 displayOptionsInfo+3148+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 179
;179:		break;
ADDRGP4 $85
JUMPV
LABELV $179
line 182
;180:
;181:	case ID_SPEED:
;182:		trap_Cvar_SetValue( "cg_drawspeed", displayOptionsInfo.speed.curvalue);
ADDRGP4 $180
ARGP4
ADDRGP4 displayOptionsInfo+3252+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 183
;183:		break;
ADDRGP4 $85
JUMPV
LABELV $183
line 186
;184:
;185:	case ID_FRIEND:
;186:		trap_Cvar_SetValue( "cg_drawfriend", displayOptionsInfo.friend.curvalue);
ADDRGP4 $184
ARGP4
ADDRGP4 displayOptionsInfo+3348+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 187
;187:		break;
ADDRGP4 $85
JUMPV
LABELV $187
line 190
;188:
;189:	case ID_ISTYLE:
;190:		displayOptionsInfo.istyle.curvalue = (int)(displayOptionsInfo.istyle.curvalue + 0.5);
ADDRGP4 displayOptionsInfo+2836+96
ADDRGP4 displayOptionsInfo+2836+96
INDIRF4
CNSTF4 1056964608
ADDF4
CVFI4 4
CVIF4 4
ASGNF4
line 191
;191:		trap_Cvar_SetValue( "cg_itemstyle", displayOptionsInfo.istyle.curvalue);
ADDRGP4 $192
ARGP4
ADDRGP4 displayOptionsInfo+2836+96
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 192
;192:		break;
ADDRGP4 $85
JUMPV
LABELV $195
line 195
;193:
;194:	case ID_BACK:
;195:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 196
;196:		break;
LABELV $84
LABELV $85
line 198
;197:	}
;198:}
LABELV $81
endproc UI_DisplayOptionsMenu_Event 8 8
proc UI_DisplayOptionsMenu_Init 80 12
line 206
;199:
;200:
;201:/*
;202:===============
;203:UI_DisplayOptionsMenu_Init
;204:===============
;205:*/
;206:static void UI_DisplayOptionsMenu_Init( void ) {
line 209
;207:	int		y;
;208:
;209:	memset( &displayOptionsInfo, 0, sizeof(displayOptionsInfo) );
ADDRGP4 displayOptionsInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3560
ARGI4
ADDRGP4 memset
CALLP4
pop
line 211
;210:
;211:	UI_DisplayOptionsMenu_Cache();
ADDRGP4 UI_DisplayOptionsMenu_Cache
CALLV
pop
line 212
;212:	displayOptionsInfo.menu.wrapAround = qtrue;
ADDRGP4 displayOptionsInfo+1044
CNSTI4 1
ASGNI4
line 213
;213:	displayOptionsInfo.menu.native 	   = qfalse;
ADDRGP4 displayOptionsInfo+1056
CNSTI4 0
ASGNI4
line 214
;214:	displayOptionsInfo.menu.fullscreen = qtrue;
ADDRGP4 displayOptionsInfo+1052
CNSTI4 1
ASGNI4
line 216
;215:
;216:	displayOptionsInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 displayOptionsInfo+1076
CNSTI4 10
ASGNI4
line 217
;217:	displayOptionsInfo.banner.generic.flags		= QMF_CENTER_JUSTIFY;
ADDRGP4 displayOptionsInfo+1076+72
CNSTU4 8
ASGNU4
line 218
;218:	displayOptionsInfo.banner.generic.x			= 320;
ADDRGP4 displayOptionsInfo+1076+28
CNSTI4 320
ASGNI4
line 219
;219:	displayOptionsInfo.banner.generic.y			= 16;
ADDRGP4 displayOptionsInfo+1076+32
CNSTI4 16
ASGNI4
line 220
;220:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $209
line 221
;221:	displayOptionsInfo.banner.string			= "SYSTEM SETUP";
ADDRGP4 displayOptionsInfo+1076+88
ADDRGP4 $214
ASGNP4
line 222
;222:	}
LABELV $209
line 223
;223:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $215
line 224
;224:	displayOptionsInfo.banner.string			= "СИСТЕМНЫЕ НАСТРОЙКИ";
ADDRGP4 displayOptionsInfo+1076+88
ADDRGP4 $220
ASGNP4
line 225
;225:	}
LABELV $215
line 226
;226:	displayOptionsInfo.banner.color				= color_white;
ADDRGP4 displayOptionsInfo+1076+100
ADDRGP4 color_white
ASGNP4
line 227
;227:	displayOptionsInfo.banner.style				= UI_CENTER;
ADDRGP4 displayOptionsInfo+1076+92
CNSTI4 1
ASGNI4
line 229
;228:
;229:	displayOptionsInfo.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 displayOptionsInfo+1180
CNSTI4 6
ASGNI4
line 230
;230:	displayOptionsInfo.framel.generic.name		= ART_FRAMEL;
ADDRGP4 displayOptionsInfo+1180+4
ADDRGP4 $228
ASGNP4
line 231
;231:	displayOptionsInfo.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 displayOptionsInfo+1180+72
CNSTU4 16384
ASGNU4
line 232
;232:	displayOptionsInfo.framel.generic.x			= 0;  
ADDRGP4 displayOptionsInfo+1180+28
CNSTI4 0
ASGNI4
line 233
;233:	displayOptionsInfo.framel.generic.y			= 78;
ADDRGP4 displayOptionsInfo+1180+32
CNSTI4 78
ASGNI4
line 234
;234:	displayOptionsInfo.framel.width				= 256;
ADDRGP4 displayOptionsInfo+1180+104
CNSTI4 256
ASGNI4
line 235
;235:	displayOptionsInfo.framel.height			= 329;
ADDRGP4 displayOptionsInfo+1180+108
CNSTI4 329
ASGNI4
line 237
;236:
;237:	displayOptionsInfo.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 displayOptionsInfo+1296
CNSTI4 6
ASGNI4
line 238
;238:	displayOptionsInfo.framer.generic.name		= ART_FRAMER;
ADDRGP4 displayOptionsInfo+1296+4
ADDRGP4 $242
ASGNP4
line 239
;239:	displayOptionsInfo.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 displayOptionsInfo+1296+72
CNSTU4 16384
ASGNU4
line 240
;240:	displayOptionsInfo.framer.generic.x			= 376;
ADDRGP4 displayOptionsInfo+1296+28
CNSTI4 376
ASGNI4
line 241
;241:	displayOptionsInfo.framer.generic.y			= 76;
ADDRGP4 displayOptionsInfo+1296+32
CNSTI4 76
ASGNI4
line 242
;242:	displayOptionsInfo.framer.width				= 256;
ADDRGP4 displayOptionsInfo+1296+104
CNSTI4 256
ASGNI4
line 243
;243:	displayOptionsInfo.framer.height			= 334;
ADDRGP4 displayOptionsInfo+1296+108
CNSTI4 334
ASGNI4
line 245
;244:
;245:	displayOptionsInfo.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+1412
CNSTI4 9
ASGNI4
line 246
;246:	displayOptionsInfo.graphics.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+1412+72
CNSTU4 272
ASGNU4
line 247
;247:	displayOptionsInfo.graphics.generic.id			= ID_GRAPHICS;
ADDRGP4 displayOptionsInfo+1412+24
CNSTI4 10
ASGNI4
line 248
;248:	displayOptionsInfo.graphics.generic.callback	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+1412+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 249
;249:	displayOptionsInfo.graphics.generic.x			= 140- uis.wideoffset;
ADDRGP4 displayOptionsInfo+1412+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 250
;250:	displayOptionsInfo.graphics.generic.y			= 240 - 2 * PROP_HEIGHT;
ADDRGP4 displayOptionsInfo+1412+32
CNSTI4 240
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 1
LSHI4
SUBI4
ASGNI4
line 251
;251:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $266
line 252
;252:	displayOptionsInfo.graphics.string				= "GRAPHICS";
ADDRGP4 displayOptionsInfo+1412+88
ADDRGP4 $271
ASGNP4
line 253
;253:	}
LABELV $266
line 254
;254:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $272
line 255
;255:	displayOptionsInfo.graphics.string				= "ГРАФИКА";
ADDRGP4 displayOptionsInfo+1412+88
ADDRGP4 $277
ASGNP4
line 256
;256:	}
LABELV $272
line 257
;257:	displayOptionsInfo.graphics.style				= UI_RIGHT;
ADDRGP4 displayOptionsInfo+1412+92
CNSTI4 2
ASGNI4
line 258
;258:	displayOptionsInfo.graphics.color				= color_red;
ADDRGP4 displayOptionsInfo+1412+100
ADDRGP4 color_red
ASGNP4
line 260
;259:
;260:	displayOptionsInfo.display.generic.type			= MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+1516
CNSTI4 9
ASGNI4
line 261
;261:	displayOptionsInfo.display.generic.flags		= QMF_RIGHT_JUSTIFY;
ADDRGP4 displayOptionsInfo+1516+72
CNSTU4 16
ASGNU4
line 262
;262:	displayOptionsInfo.display.generic.id			= ID_DISPLAY;
ADDRGP4 displayOptionsInfo+1516+24
CNSTI4 11
ASGNI4
line 263
;263:	displayOptionsInfo.display.generic.callback		= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+1516+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 264
;264:	displayOptionsInfo.display.generic.x			= 140- uis.wideoffset;
ADDRGP4 displayOptionsInfo+1516+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 265
;265:	displayOptionsInfo.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 displayOptionsInfo+1516+32
CNSTI4 240
ADDRGP4 cl_propheight+12
INDIRI4
SUBI4
ASGNI4
line 266
;266:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $295
line 267
;267:	displayOptionsInfo.display.string				= "DISPLAY";
ADDRGP4 displayOptionsInfo+1516+88
ADDRGP4 $300
ASGNP4
line 268
;268:	}
LABELV $295
line 269
;269:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $301
line 270
;270:	displayOptionsInfo.display.string				= "ЭКРАН";
ADDRGP4 displayOptionsInfo+1516+88
ADDRGP4 $306
ASGNP4
line 271
;271:	}
LABELV $301
line 272
;272:	displayOptionsInfo.display.style				= UI_RIGHT;
ADDRGP4 displayOptionsInfo+1516+92
CNSTI4 2
ASGNI4
line 273
;273:	displayOptionsInfo.display.color				= color_red;
ADDRGP4 displayOptionsInfo+1516+100
ADDRGP4 color_red
ASGNP4
line 275
;274:
;275:	displayOptionsInfo.sound.generic.type			= MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+1620
CNSTI4 9
ASGNI4
line 276
;276:	displayOptionsInfo.sound.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+1620+72
CNSTU4 272
ASGNU4
line 277
;277:	displayOptionsInfo.sound.generic.id				= ID_SOUND;
ADDRGP4 displayOptionsInfo+1620+24
CNSTI4 12
ASGNI4
line 278
;278:	displayOptionsInfo.sound.generic.callback		= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+1620+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 279
;279:	displayOptionsInfo.sound.generic.x				= 140- uis.wideoffset;
ADDRGP4 displayOptionsInfo+1620+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 280
;280:	displayOptionsInfo.sound.generic.y				= 240;
ADDRGP4 displayOptionsInfo+1620+32
CNSTI4 240
ASGNI4
line 281
;281:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $323
line 282
;282:	displayOptionsInfo.sound.string					= "SOUND";
ADDRGP4 displayOptionsInfo+1620+88
ADDRGP4 $328
ASGNP4
line 283
;283:	}
LABELV $323
line 284
;284:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $329
line 285
;285:	displayOptionsInfo.sound.string					= "ЗВУК";
ADDRGP4 displayOptionsInfo+1620+88
ADDRGP4 $334
ASGNP4
line 286
;286:	}
LABELV $329
line 287
;287:	displayOptionsInfo.sound.style					= UI_RIGHT;
ADDRGP4 displayOptionsInfo+1620+92
CNSTI4 2
ASGNI4
line 288
;288:	displayOptionsInfo.sound.color					= color_red;
ADDRGP4 displayOptionsInfo+1620+100
ADDRGP4 color_red
ASGNP4
line 290
;289:
;290:	displayOptionsInfo.network.generic.type			= MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+1724
CNSTI4 9
ASGNI4
line 291
;291:	displayOptionsInfo.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+1724+72
CNSTU4 272
ASGNU4
line 292
;292:	displayOptionsInfo.network.generic.id			= ID_NETWORK;
ADDRGP4 displayOptionsInfo+1724+24
CNSTI4 13
ASGNI4
line 293
;293:	displayOptionsInfo.network.generic.callback		= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+1724+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 294
;294:	displayOptionsInfo.network.generic.x			= 140- uis.wideoffset;
ADDRGP4 displayOptionsInfo+1724+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 295
;295:	displayOptionsInfo.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 displayOptionsInfo+1724+32
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 240
ADDI4
ASGNI4
line 296
;296:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $352
line 297
;297:	displayOptionsInfo.network.string				= "NETWORK";
ADDRGP4 displayOptionsInfo+1724+88
ADDRGP4 $357
ASGNP4
line 298
;298:	}
LABELV $352
line 299
;299:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $358
line 300
;300:	displayOptionsInfo.network.string				= "СЕТЬ";
ADDRGP4 displayOptionsInfo+1724+88
ADDRGP4 $363
ASGNP4
line 301
;301:	}
LABELV $358
line 302
;302:	displayOptionsInfo.network.style				= UI_RIGHT;
ADDRGP4 displayOptionsInfo+1724+92
CNSTI4 2
ASGNI4
line 303
;303:	displayOptionsInfo.network.color				= color_red;
ADDRGP4 displayOptionsInfo+1724+100
ADDRGP4 color_red
ASGNP4
line 305
;304:
;305:	y = 120 - 1 * (BIGCHAR_HEIGHT+2);
ADDRLP4 0
CNSTI4 120
CNSTI4 1
ADDRGP4 cl_bigcharheight+12
INDIRI4
MULI4
CNSTI4 2
ADDI4
SUBI4
ASGNI4
line 306
;306:	displayOptionsInfo.brightness.generic.type		= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+1828
CNSTI4 1
ASGNI4
line 307
;307:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $370
line 308
;308:	displayOptionsInfo.brightness.generic.name		= "Brightness:";
ADDRGP4 displayOptionsInfo+1828+4
ADDRGP4 $375
ASGNP4
line 309
;309:	}
LABELV $370
line 310
;310:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $376
line 311
;311:	displayOptionsInfo.brightness.generic.name		= "Яркость:";
ADDRGP4 displayOptionsInfo+1828+4
ADDRGP4 $381
ASGNP4
line 312
;312:	}
LABELV $376
line 313
;313:	displayOptionsInfo.brightness.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+1828+72
CNSTU4 258
ASGNU4
line 314
;314:	displayOptionsInfo.brightness.generic.callback	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+1828+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 315
;315:	displayOptionsInfo.brightness.generic.id		= ID_BRIGHTNESS;
ADDRGP4 displayOptionsInfo+1828+24
CNSTI4 14
ASGNI4
line 316
;316:	displayOptionsInfo.brightness.generic.x			= 400;
ADDRGP4 displayOptionsInfo+1828+28
CNSTI4 400
ASGNI4
line 317
;317:	displayOptionsInfo.brightness.generic.y			= y;
ADDRGP4 displayOptionsInfo+1828+32
ADDRLP4 0
INDIRI4
ASGNI4
line 318
;318:	displayOptionsInfo.brightness.minvalue			= 5;
ADDRGP4 displayOptionsInfo+1828+88
CNSTF4 1084227584
ASGNF4
line 319
;319:	displayOptionsInfo.brightness.maxvalue			= 20;
ADDRGP4 displayOptionsInfo+1828+92
CNSTF4 1101004800
ASGNF4
line 321
;320:
;321:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 322
;322:	displayOptionsInfo.screensize.generic.type		= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+1932
CNSTI4 1
ASGNI4
line 323
;323:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $398
line 324
;324:	displayOptionsInfo.screensize.generic.name		= "Screen Size:";
ADDRGP4 displayOptionsInfo+1932+4
ADDRGP4 $403
ASGNP4
line 325
;325:	}
LABELV $398
line 326
;326:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $404
line 327
;327:	displayOptionsInfo.screensize.generic.name		= "Размер экрана:";
ADDRGP4 displayOptionsInfo+1932+4
ADDRGP4 $409
ASGNP4
line 328
;328:	}
LABELV $404
line 329
;329:	displayOptionsInfo.screensize.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+1932+72
CNSTU4 258
ASGNU4
line 330
;330:	displayOptionsInfo.screensize.generic.callback	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+1932+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 331
;331:	displayOptionsInfo.screensize.generic.id		= ID_SCREENSIZE;
ADDRGP4 displayOptionsInfo+1932+24
CNSTI4 15
ASGNI4
line 332
;332:	displayOptionsInfo.screensize.generic.x			= 400;
ADDRGP4 displayOptionsInfo+1932+28
CNSTI4 400
ASGNI4
line 333
;333:	displayOptionsInfo.screensize.generic.y			= y;
ADDRGP4 displayOptionsInfo+1932+32
ADDRLP4 0
INDIRI4
ASGNI4
line 334
;334:	displayOptionsInfo.screensize.minvalue			= 3;
ADDRGP4 displayOptionsInfo+1932+88
CNSTF4 1077936128
ASGNF4
line 335
;335:    displayOptionsInfo.screensize.maxvalue			= 10;
ADDRGP4 displayOptionsInfo+1932+92
CNSTF4 1092616192
ASGNF4
line 337
;336:
;337:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 338
;338:	displayOptionsInfo.crosssize.generic.type			= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+2036
CNSTI4 1
ASGNI4
line 339
;339:	displayOptionsInfo.crosssize.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+2036+72
CNSTU4 258
ASGNU4
line 340
;340:	displayOptionsInfo.crosssize.generic.callback		= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+2036+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 341
;341:	displayOptionsInfo.crosssize.generic.id		= ID_CROSSSIZE;
ADDRGP4 displayOptionsInfo+2036+24
CNSTI4 17
ASGNI4
line 342
;342:	displayOptionsInfo.crosssize.generic.x			= 400;
ADDRGP4 displayOptionsInfo+2036+28
CNSTI4 400
ASGNI4
line 343
;343:	displayOptionsInfo.crosssize.generic.y			= y;
ADDRGP4 displayOptionsInfo+2036+32
ADDRLP4 0
INDIRI4
ASGNI4
line 344
;344:	displayOptionsInfo.crosssize.minvalue				= 1;
ADDRGP4 displayOptionsInfo+2036+88
CNSTF4 1065353216
ASGNF4
line 345
;345:    displayOptionsInfo.crosssize.maxvalue				= 40;
ADDRGP4 displayOptionsInfo+2036+92
CNSTF4 1109393408
ASGNF4
line 347
;346:
;347:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 348
;348:	displayOptionsInfo.oldscore.generic.type     	= MTYPE_RADIOBUTTON;
ADDRGP4 displayOptionsInfo+2236
CNSTI4 5
ASGNI4
line 349
;349:	displayOptionsInfo.oldscore.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+2236+72
CNSTU4 258
ASGNU4
line 350
;350:	displayOptionsInfo.oldscore.generic.callback 	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+2236+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 351
;351:	displayOptionsInfo.oldscore.generic.id       	= ID_OLDSCORE;
ADDRGP4 displayOptionsInfo+2236+24
CNSTI4 19
ASGNI4
line 352
;352:	displayOptionsInfo.oldscore.generic.x	       	= 400;
ADDRGP4 displayOptionsInfo+2236+28
CNSTI4 400
ASGNI4
line 353
;353:	displayOptionsInfo.oldscore.generic.y	        = y;
ADDRGP4 displayOptionsInfo+2236+32
ADDRLP4 0
INDIRI4
ASGNI4
line 355
;354:
;355:	y += BIGCHAR_HEIGHT+4;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 356
;356:	displayOptionsInfo.thirdperson.generic.type     	= MTYPE_RADIOBUTTON;
ADDRGP4 displayOptionsInfo+2140
CNSTI4 5
ASGNI4
line 357
;357:	displayOptionsInfo.thirdperson.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+2140+72
CNSTU4 258
ASGNU4
line 358
;358:	displayOptionsInfo.thirdperson.generic.callback 	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+2140+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 359
;359:	displayOptionsInfo.thirdperson.generic.id       	= ID_THIRDPERSON;
ADDRGP4 displayOptionsInfo+2140+24
CNSTI4 18
ASGNI4
line 360
;360:	displayOptionsInfo.thirdperson.generic.x	       	= 400;
ADDRGP4 displayOptionsInfo+2140+28
CNSTI4 400
ASGNI4
line 361
;361:	displayOptionsInfo.thirdperson.generic.y	        = y;
ADDRGP4 displayOptionsInfo+2140+32
ADDRLP4 0
INDIRI4
ASGNI4
line 363
;362:
;363:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 364
;364:	displayOptionsInfo.thirdpersonrange.generic.type			= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+2332
CNSTI4 1
ASGNI4
line 365
;365:	displayOptionsInfo.thirdpersonrange.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+2332+72
CNSTU4 258
ASGNU4
line 366
;366:	displayOptionsInfo.thirdpersonrange.generic.callback		= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+2332+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 367
;367:	displayOptionsInfo.thirdpersonrange.generic.id		= ID_THIRDPERSONRANGE;
ADDRGP4 displayOptionsInfo+2332+24
CNSTI4 20
ASGNI4
line 368
;368:	displayOptionsInfo.thirdpersonrange.generic.x			= 400;
ADDRGP4 displayOptionsInfo+2332+28
CNSTI4 400
ASGNI4
line 369
;369:	displayOptionsInfo.thirdpersonrange.generic.y			= y;
ADDRGP4 displayOptionsInfo+2332+32
ADDRLP4 0
INDIRI4
ASGNI4
line 370
;370:	displayOptionsInfo.thirdpersonrange.minvalue				= 10;
ADDRGP4 displayOptionsInfo+2332+88
CNSTF4 1092616192
ASGNF4
line 371
;371:    displayOptionsInfo.thirdpersonrange.maxvalue				= 250;
ADDRGP4 displayOptionsInfo+2332+92
CNSTF4 1132068864
ASGNF4
line 373
;372:
;373:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 374
;374:	displayOptionsInfo.thirdpersonoffset.generic.type			= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+2436
CNSTI4 1
ASGNI4
line 375
;375:	displayOptionsInfo.thirdpersonoffset.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+2436+72
CNSTU4 258
ASGNU4
line 376
;376:	displayOptionsInfo.thirdpersonoffset.generic.callback		= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+2436+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 377
;377:	displayOptionsInfo.thirdpersonoffset.generic.id		= ID_THIRDPERSONOFFSET;
ADDRGP4 displayOptionsInfo+2436+24
CNSTI4 21
ASGNI4
line 378
;378:	displayOptionsInfo.thirdpersonoffset.generic.x			= 400;
ADDRGP4 displayOptionsInfo+2436+28
CNSTI4 400
ASGNI4
line 379
;379:	displayOptionsInfo.thirdpersonoffset.generic.y			= y;
ADDRGP4 displayOptionsInfo+2436+32
ADDRLP4 0
INDIRI4
ASGNI4
line 380
;380:	displayOptionsInfo.thirdpersonoffset.minvalue				= -50;
ADDRGP4 displayOptionsInfo+2436+88
CNSTF4 3259498496
ASGNF4
line 381
;381:    displayOptionsInfo.thirdpersonoffset.maxvalue				= 50;
ADDRGP4 displayOptionsInfo+2436+92
CNSTF4 1112014848
ASGNF4
line 383
;382:
;383:	y += BIGCHAR_HEIGHT+4;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 384
;384:	displayOptionsInfo.icons.generic.type     	= MTYPE_RADIOBUTTON;
ADDRGP4 displayOptionsInfo+2540
CNSTI4 5
ASGNI4
line 385
;385:	displayOptionsInfo.icons.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+2540+72
CNSTU4 258
ASGNU4
line 386
;386:	displayOptionsInfo.icons.generic.callback 	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+2540+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 387
;387:	displayOptionsInfo.icons.generic.id       	= ID_ICONS;
ADDRGP4 displayOptionsInfo+2540+24
CNSTI4 22
ASGNI4
line 388
;388:	displayOptionsInfo.icons.generic.x	       	= 400;
ADDRGP4 displayOptionsInfo+2540+28
CNSTI4 400
ASGNI4
line 389
;389:	displayOptionsInfo.icons.generic.y	        = y;
ADDRGP4 displayOptionsInfo+2540+32
ADDRLP4 0
INDIRI4
ASGNI4
line 391
;390:
;391:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 392
;392:	displayOptionsInfo.status.generic.type     	= MTYPE_RADIOBUTTON;
ADDRGP4 displayOptionsInfo+2636
CNSTI4 5
ASGNI4
line 393
;393:	displayOptionsInfo.status.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+2636+72
CNSTU4 258
ASGNU4
line 394
;394:	displayOptionsInfo.status.generic.callback 	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+2636+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 395
;395:	displayOptionsInfo.status.generic.id       	= ID_STATUS;
ADDRGP4 displayOptionsInfo+2636+24
CNSTI4 23
ASGNI4
line 396
;396:	displayOptionsInfo.status.generic.x	       	= 400;
ADDRGP4 displayOptionsInfo+2636+28
CNSTI4 400
ASGNI4
line 397
;397:	displayOptionsInfo.status.generic.y	        = y;
ADDRGP4 displayOptionsInfo+2636+32
ADDRLP4 0
INDIRI4
ASGNI4
line 399
;398:
;399:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 400
;400:	displayOptionsInfo.gun.generic.type     	= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+2732
CNSTI4 1
ASGNI4
line 401
;401:	displayOptionsInfo.gun.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+2732+72
CNSTU4 258
ASGNU4
line 402
;402:	displayOptionsInfo.gun.generic.callback 	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+2732+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 403
;403:	displayOptionsInfo.gun.generic.id       	= ID_GUN;
ADDRGP4 displayOptionsInfo+2732+24
CNSTI4 24
ASGNI4
line 404
;404:	displayOptionsInfo.gun.generic.x	       	= 400;
ADDRGP4 displayOptionsInfo+2732+28
CNSTI4 400
ASGNI4
line 405
;405:	displayOptionsInfo.gun.generic.y	        = y;
ADDRGP4 displayOptionsInfo+2732+32
ADDRLP4 0
INDIRI4
ASGNI4
line 406
;406:	displayOptionsInfo.gun.minvalue				= 0;
ADDRGP4 displayOptionsInfo+2732+88
CNSTF4 0
ASGNF4
line 407
;407:    displayOptionsInfo.gun.maxvalue				= 3;
ADDRGP4 displayOptionsInfo+2732+92
CNSTF4 1077936128
ASGNF4
line 409
;408:
;409:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 410
;410:	displayOptionsInfo.rview.generic.type     	= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+2940
CNSTI4 1
ASGNI4
line 411
;411:	displayOptionsInfo.rview.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+2940+72
CNSTU4 258
ASGNU4
line 412
;412:	displayOptionsInfo.rview.generic.callback 	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+2940+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 413
;413:	displayOptionsInfo.rview.generic.id       	= ID_REALVIEW;
ADDRGP4 displayOptionsInfo+2940+24
CNSTI4 28
ASGNI4
line 414
;414:	displayOptionsInfo.rview.generic.x	       	= 400;
ADDRGP4 displayOptionsInfo+2940+28
CNSTI4 400
ASGNI4
line 415
;415:	displayOptionsInfo.rview.generic.y	        = y;
ADDRGP4 displayOptionsInfo+2940+32
ADDRLP4 0
INDIRI4
ASGNI4
line 416
;416:	displayOptionsInfo.rview.minvalue			= 0;
ADDRGP4 displayOptionsInfo+2940+88
CNSTF4 0
ASGNF4
line 417
;417:    displayOptionsInfo.rview.maxvalue			= 3;
ADDRGP4 displayOptionsInfo+2940+92
CNSTF4 1077936128
ASGNF4
line 419
;418:
;419:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 420
;420:	displayOptionsInfo.rviewf.generic.type     	= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+3044
CNSTI4 1
ASGNI4
line 421
;421:	displayOptionsInfo.rviewf.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+3044+72
CNSTU4 258
ASGNU4
line 422
;422:	displayOptionsInfo.rviewf.generic.callback 	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+3044+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 423
;423:	displayOptionsInfo.rviewf.generic.id       	= ID_REALVIEWF;
ADDRGP4 displayOptionsInfo+3044+24
CNSTI4 29
ASGNI4
line 424
;424:	displayOptionsInfo.rviewf.generic.x	       	= 400;
ADDRGP4 displayOptionsInfo+3044+28
CNSTI4 400
ASGNI4
line 425
;425:	displayOptionsInfo.rviewf.generic.y	        = y;
ADDRGP4 displayOptionsInfo+3044+32
ADDRLP4 0
INDIRI4
ASGNI4
line 426
;426:	displayOptionsInfo.rviewf.minvalue			= -10;
ADDRGP4 displayOptionsInfo+3044+88
CNSTF4 3240099840
ASGNF4
line 427
;427:    displayOptionsInfo.rviewf.maxvalue			= 15;
ADDRGP4 displayOptionsInfo+3044+92
CNSTF4 1097859072
ASGNF4
line 429
;428:
;429:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 430
;430:	displayOptionsInfo.rviewu.generic.type     	= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+3148
CNSTI4 1
ASGNI4
line 431
;431:	displayOptionsInfo.rviewu.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+3148+72
CNSTU4 258
ASGNU4
line 432
;432:	displayOptionsInfo.rviewu.generic.callback 	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+3148+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 433
;433:	displayOptionsInfo.rviewu.generic.id       	= ID_REALVIEWU;
ADDRGP4 displayOptionsInfo+3148+24
CNSTI4 30
ASGNI4
line 434
;434:	displayOptionsInfo.rviewu.generic.x	       	= 400;
ADDRGP4 displayOptionsInfo+3148+28
CNSTI4 400
ASGNI4
line 435
;435:	displayOptionsInfo.rviewu.generic.y	        = y;
ADDRGP4 displayOptionsInfo+3148+32
ADDRLP4 0
INDIRI4
ASGNI4
line 436
;436:	displayOptionsInfo.rviewu.minvalue			= -10;
ADDRGP4 displayOptionsInfo+3148+88
CNSTF4 3240099840
ASGNF4
line 437
;437:    displayOptionsInfo.rviewu.maxvalue			= 15;
ADDRGP4 displayOptionsInfo+3148+92
CNSTF4 1097859072
ASGNF4
line 439
;438:
;439:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 440
;440:	displayOptionsInfo.speed.generic.type     	= MTYPE_RADIOBUTTON;
ADDRGP4 displayOptionsInfo+3252
CNSTI4 5
ASGNI4
line 441
;441:	displayOptionsInfo.speed.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+3252+72
CNSTU4 258
ASGNU4
line 442
;442:	displayOptionsInfo.speed.generic.callback 	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+3252+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 443
;443:	displayOptionsInfo.speed.generic.id       	= ID_SPEED;
ADDRGP4 displayOptionsInfo+3252+24
CNSTI4 25
ASGNI4
line 444
;444:	displayOptionsInfo.speed.generic.x	       	= 400;
ADDRGP4 displayOptionsInfo+3252+28
CNSTI4 400
ASGNI4
line 445
;445:	displayOptionsInfo.speed.generic.y	        = y;
ADDRGP4 displayOptionsInfo+3252+32
ADDRLP4 0
INDIRI4
ASGNI4
line 447
;446:
;447:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 448
;448:	displayOptionsInfo.friend.generic.type     	= MTYPE_RADIOBUTTON;
ADDRGP4 displayOptionsInfo+3348
CNSTI4 5
ASGNI4
line 449
;449:	displayOptionsInfo.friend.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+3348+72
CNSTU4 258
ASGNU4
line 450
;450:	displayOptionsInfo.friend.generic.callback 	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+3348+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 451
;451:	displayOptionsInfo.friend.generic.id       	= ID_FRIEND;
ADDRGP4 displayOptionsInfo+3348+24
CNSTI4 26
ASGNI4
line 452
;452:	displayOptionsInfo.friend.generic.x	       	= 400;
ADDRGP4 displayOptionsInfo+3348+28
CNSTI4 400
ASGNI4
line 453
;453:	displayOptionsInfo.friend.generic.y	        = y;
ADDRGP4 displayOptionsInfo+3348+32
ADDRLP4 0
INDIRI4
ASGNI4
line 455
;454:
;455:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 456
;456:	displayOptionsInfo.istyle.generic.type			= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+2836
CNSTI4 1
ASGNI4
line 457
;457:	displayOptionsInfo.istyle.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+2836+72
CNSTU4 258
ASGNU4
line 458
;458:	displayOptionsInfo.istyle.generic.callback		= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+2836+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 459
;459:	displayOptionsInfo.istyle.generic.id		= ID_ISTYLE;
ADDRGP4 displayOptionsInfo+2836+24
CNSTI4 27
ASGNI4
line 460
;460:	displayOptionsInfo.istyle.generic.x			= 400;
ADDRGP4 displayOptionsInfo+2836+28
CNSTI4 400
ASGNI4
line 461
;461:	displayOptionsInfo.istyle.generic.y			= y;
ADDRGP4 displayOptionsInfo+2836+32
ADDRLP4 0
INDIRI4
ASGNI4
line 462
;462:	displayOptionsInfo.istyle.minvalue				= 1;
ADDRGP4 displayOptionsInfo+2836+88
CNSTF4 1065353216
ASGNF4
line 463
;463:    displayOptionsInfo.istyle.maxvalue				= 3;
ADDRGP4 displayOptionsInfo+2836+92
CNSTF4 1077936128
ASGNF4
line 465
;464:
;465:	displayOptionsInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 displayOptionsInfo+3444
CNSTI4 6
ASGNI4
line 466
;466:	displayOptionsInfo.back.generic.name		= ART_BACK0;
ADDRGP4 displayOptionsInfo+3444+4
ADDRGP4 $627
ASGNP4
line 467
;467:	displayOptionsInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+3444+72
CNSTU4 260
ASGNU4
line 468
;468:	displayOptionsInfo.back.generic.callback	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+3444+76
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 469
;469:	displayOptionsInfo.back.generic.id			= ID_BACK;
ADDRGP4 displayOptionsInfo+3444+24
CNSTI4 16
ASGNI4
line 470
;470:	displayOptionsInfo.back.generic.x			= 0 - uis.wideoffset;
ADDRGP4 displayOptionsInfo+3444+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 471
;471:	displayOptionsInfo.back.generic.y			= 480-64;
ADDRGP4 displayOptionsInfo+3444+32
CNSTI4 416
ASGNI4
line 472
;472:	displayOptionsInfo.back.width				= 128;
ADDRGP4 displayOptionsInfo+3444+104
CNSTI4 128
ASGNI4
line 473
;473:	displayOptionsInfo.back.height				= 64;
ADDRGP4 displayOptionsInfo+3444+108
CNSTI4 64
ASGNI4
line 474
;474:	displayOptionsInfo.back.focuspic			= ART_BACK1;
ADDRGP4 displayOptionsInfo+3444+88
ADDRGP4 $645
ASGNP4
line 477
;475:
;476://TEXT FOR TRANSLATES
;477:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $646
line 478
;478:displayOptionsInfo.banner.string			= "SYSTEM SETUP";
ADDRGP4 displayOptionsInfo+1076+88
ADDRGP4 $214
ASGNP4
line 479
;479:displayOptionsInfo.brightness.generic.name		= "Brightness:";
ADDRGP4 displayOptionsInfo+1828+4
ADDRGP4 $375
ASGNP4
line 480
;480:displayOptionsInfo.screensize.generic.name		= "Screen Size:";
ADDRGP4 displayOptionsInfo+1932+4
ADDRGP4 $403
ASGNP4
line 481
;481:displayOptionsInfo.crosssize.generic.name			= "Croshair size:";
ADDRGP4 displayOptionsInfo+2036+4
ADDRGP4 $657
ASGNP4
line 482
;482:displayOptionsInfo.oldscore.generic.name	   		= "Old Scoreboard:";
ADDRGP4 displayOptionsInfo+2236+4
ADDRGP4 $660
ASGNP4
line 483
;483:displayOptionsInfo.thirdperson.generic.name	   		= "Third person:";
ADDRGP4 displayOptionsInfo+2140+4
ADDRGP4 $663
ASGNP4
line 484
;484:displayOptionsInfo.thirdpersonrange.generic.name			= "Third person range:";
ADDRGP4 displayOptionsInfo+2332+4
ADDRGP4 $666
ASGNP4
line 485
;485:displayOptionsInfo.thirdpersonoffset.generic.name			= "Third person offset:";
ADDRGP4 displayOptionsInfo+2436+4
ADDRGP4 $669
ASGNP4
line 486
;486:displayOptionsInfo.icons.generic.name	   	= "Draw 3D Icons:";
ADDRGP4 displayOptionsInfo+2540+4
ADDRGP4 $672
ASGNP4
line 487
;487:displayOptionsInfo.status.generic.name	   	= "Draw Status:";
ADDRGP4 displayOptionsInfo+2636+4
ADDRGP4 $675
ASGNP4
line 488
;488:displayOptionsInfo.gun.generic.name	   		= "Draw Gun:";
ADDRGP4 displayOptionsInfo+2732+4
ADDRGP4 $678
ASGNP4
line 489
;489:displayOptionsInfo.rview.generic.name	   	= "Eyes view:";
ADDRGP4 displayOptionsInfo+2940+4
ADDRGP4 $681
ASGNP4
line 490
;490:displayOptionsInfo.rviewf.generic.name	   	= "Eyes view forward:";
ADDRGP4 displayOptionsInfo+3044+4
ADDRGP4 $684
ASGNP4
line 491
;491:displayOptionsInfo.rviewu.generic.name	   	= "Eyes view:";
ADDRGP4 displayOptionsInfo+3148+4
ADDRGP4 $681
ASGNP4
line 492
;492:displayOptionsInfo.speed.generic.name	   	= "Draw Speed:";
ADDRGP4 displayOptionsInfo+3252+4
ADDRGP4 $689
ASGNP4
line 493
;493:displayOptionsInfo.friend.generic.name	   	= "Draw Friend:";
ADDRGP4 displayOptionsInfo+3348+4
ADDRGP4 $692
ASGNP4
line 494
;494:displayOptionsInfo.istyle.generic.name	   	= "Item Style:";
ADDRGP4 displayOptionsInfo+2836+4
ADDRGP4 $695
ASGNP4
line 495
;495:}
LABELV $646
line 496
;496:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $696
line 497
;497:displayOptionsInfo.banner.string			= "СИСТЕМНЫЕ НАСТРОЙКИ";
ADDRGP4 displayOptionsInfo+1076+88
ADDRGP4 $220
ASGNP4
line 498
;498:displayOptionsInfo.brightness.generic.name		= "Яркость:";
ADDRGP4 displayOptionsInfo+1828+4
ADDRGP4 $381
ASGNP4
line 499
;499:displayOptionsInfo.screensize.generic.name		= "Размер экрана:";
ADDRGP4 displayOptionsInfo+1932+4
ADDRGP4 $409
ASGNP4
line 500
;500:displayOptionsInfo.crosssize.generic.name			= "Размер прицела:";
ADDRGP4 displayOptionsInfo+2036+4
ADDRGP4 $707
ASGNP4
line 501
;501:displayOptionsInfo.oldscore.generic.name	   		= "Старая панель игроков:";
ADDRGP4 displayOptionsInfo+2236+4
ADDRGP4 $710
ASGNP4
line 502
;502:displayOptionsInfo.thirdperson.generic.name	   		= "Вид от третьего лица:";
ADDRGP4 displayOptionsInfo+2140+4
ADDRGP4 $713
ASGNP4
line 503
;503:displayOptionsInfo.thirdpersonrange.generic.name			= "Вид от третье лица-растояние:";
ADDRGP4 displayOptionsInfo+2332+4
ADDRGP4 $716
ASGNP4
line 504
;504:displayOptionsInfo.thirdpersonoffset.generic.name			= "Вид от третье лица-смещение:";
ADDRGP4 displayOptionsInfo+2436+4
ADDRGP4 $719
ASGNP4
line 505
;505:displayOptionsInfo.icons.generic.name	   	= "Отобразить 3D Значки:";
ADDRGP4 displayOptionsInfo+2540+4
ADDRGP4 $722
ASGNP4
line 506
;506:displayOptionsInfo.status.generic.name	   	= "Отобразить статус:";
ADDRGP4 displayOptionsInfo+2636+4
ADDRGP4 $725
ASGNP4
line 507
;507:displayOptionsInfo.gun.generic.name	   		= "Отобразить оружие:";
ADDRGP4 displayOptionsInfo+2732+4
ADDRGP4 $728
ASGNP4
line 508
;508:displayOptionsInfo.rview.generic.name	   	= "Вид глазами:";
ADDRGP4 displayOptionsInfo+2940+4
ADDRGP4 $731
ASGNP4
line 509
;509:displayOptionsInfo.rviewf.generic.name	   	= "Вид глазами вперёд:";
ADDRGP4 displayOptionsInfo+3044+4
ADDRGP4 $734
ASGNP4
line 510
;510:displayOptionsInfo.rviewu.generic.name	   	= "Вид глазами вверх:";
ADDRGP4 displayOptionsInfo+3148+4
ADDRGP4 $737
ASGNP4
line 511
;511:displayOptionsInfo.speed.generic.name	   	= "Отобразить скорость:";
ADDRGP4 displayOptionsInfo+3252+4
ADDRGP4 $740
ASGNP4
line 512
;512:displayOptionsInfo.friend.generic.name	   	= "Отобразить друга:";
ADDRGP4 displayOptionsInfo+3348+4
ADDRGP4 $743
ASGNP4
line 513
;513:displayOptionsInfo.istyle.generic.name	   	= "Стиль предметов:";
ADDRGP4 displayOptionsInfo+2836+4
ADDRGP4 $746
ASGNP4
line 514
;514:}
LABELV $696
line 516
;515:
;516:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.banner );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 517
;517:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.framel );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 518
;518:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.framer );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 519
;519:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.graphics );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 520
;520:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.display );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1516
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 521
;521:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.sound );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1620
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 522
;522:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.network );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 523
;523:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.brightness );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1828
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 524
;524:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.screensize );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 525
;525:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.crosssize );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+2036
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 526
;526:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.oldscore );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+2236
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 527
;527:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.thirdperson );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+2140
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 528
;528:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.thirdpersonrange );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+2332
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 529
;529:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.thirdpersonoffset );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+2436
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 530
;530:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.icons );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+2540
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 531
;531:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.status );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+2636
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 532
;532:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.gun );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+2732
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 533
;533:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.rview );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+2940
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 534
;534:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.rviewf );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+3044
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 535
;535:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.rviewu );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+3148
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 536
;536:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.speed );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+3252
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 537
;537:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.friend );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+3348
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 538
;538:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.istyle );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+2836
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 539
;539:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.back );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+3444
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 541
;540:
;541:	displayOptionsInfo.brightness.curvalue  = trap_Cvar_VariableValue("r_gamma") * 10;
ADDRGP4 $92
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+1828+96
CNSTF4 1092616192
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 542
;542:	displayOptionsInfo.screensize.curvalue  = trap_Cvar_VariableValue( "cg_viewsize")/10;
ADDRGP4 $96
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+1932+96
ADDRLP4 8
INDIRF4
CNSTF4 1092616192
DIVF4
ASGNF4
line 543
;543:	displayOptionsInfo.crosssize.curvalue  = trap_Cvar_VariableValue( "cg_crosshairScale");
ADDRGP4 $100
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+2036+96
ADDRLP4 12
INDIRF4
ASGNF4
line 544
;544:	displayOptionsInfo.oldscore.curvalue  = trap_Cvar_VariableValue( "cg_oldscoreboard");
ADDRGP4 $108
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+2236+88
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 545
;545:	displayOptionsInfo.thirdperson.curvalue  = trap_Cvar_VariableValue( "cg_thirdperson");
ADDRGP4 $104
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+2140+88
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 546
;546:	displayOptionsInfo.icons.curvalue  = trap_Cvar_VariableValue( "cg_draw3dIcons");
ADDRGP4 $120
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+2540+88
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 547
;547:	displayOptionsInfo.status.curvalue  = trap_Cvar_VariableValue( "cg_drawStatus");
ADDRGP4 $785
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+2636+88
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 548
;548:	displayOptionsInfo.speed.curvalue  = trap_Cvar_VariableValue( "cg_drawSpeed");
ADDRGP4 $788
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+3252+88
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 549
;549:	displayOptionsInfo.friend.curvalue  = trap_Cvar_VariableValue( "cg_drawFriend");
ADDRGP4 $791
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+3348+88
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 550
;550:	displayOptionsInfo.thirdpersonrange.curvalue  = trap_Cvar_VariableValue( "cg_thirdpersonrange");
ADDRGP4 $112
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+2332+96
ADDRLP4 40
INDIRF4
ASGNF4
line 551
;551:	displayOptionsInfo.thirdpersonoffset.curvalue  = trap_Cvar_VariableValue( "cg_thirdpersonoffset");
ADDRGP4 $116
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+2436+96
ADDRLP4 44
INDIRF4
ASGNF4
line 552
;552:	displayOptionsInfo.istyle.curvalue  = trap_Cvar_VariableValue( "cg_itemstyle");
ADDRGP4 $192
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+2836+96
ADDRLP4 48
INDIRF4
ASGNF4
line 553
;553:	displayOptionsInfo.rview.curvalue  = trap_Cvar_VariableValue( "cg_cameraEyes");
ADDRGP4 $158
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+2940+96
ADDRLP4 52
INDIRF4
ASGNF4
line 554
;554:	displayOptionsInfo.rviewf.curvalue  = trap_Cvar_VariableValue( "cg_cameraEyes_Fwd");
ADDRGP4 $172
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+3044+96
ADDRLP4 56
INDIRF4
ASGNF4
line 555
;555:	displayOptionsInfo.rviewu.curvalue  = trap_Cvar_VariableValue( "cg_cameraEyes_Up");
ADDRGP4 $176
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+3148+96
ADDRLP4 60
INDIRF4
ASGNF4
line 557
;556:
;557:	if(trap_Cvar_VariableValue( "cg_drawGun") == 0){
ADDRGP4 $136
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
NEF4 $804
line 558
;558:	displayOptionsInfo.gun.curvalue = 0;
ADDRGP4 displayOptionsInfo+2732+96
CNSTF4 0
ASGNF4
line 559
;559:	}
LABELV $804
line 560
;560:	if(trap_Cvar_VariableValue( "cg_drawGun") == 1){
ADDRGP4 $136
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 68
INDIRF4
CNSTF4 1065353216
NEF4 $808
line 561
;561:	displayOptionsInfo.gun.curvalue = 3;
ADDRGP4 displayOptionsInfo+2732+96
CNSTF4 1077936128
ASGNF4
line 562
;562:	}
LABELV $808
line 563
;563:	if(trap_Cvar_VariableValue( "cg_drawGun") == 2){
ADDRGP4 $136
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 72
INDIRF4
CNSTF4 1073741824
NEF4 $812
line 564
;564:	displayOptionsInfo.gun.curvalue = 1;
ADDRGP4 displayOptionsInfo+2732+96
CNSTF4 1065353216
ASGNF4
line 565
;565:	}
LABELV $812
line 566
;566:	if(trap_Cvar_VariableValue( "cg_drawGun") == 3){
ADDRGP4 $136
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 1077936128
NEF4 $816
line 567
;567:	displayOptionsInfo.gun.curvalue = 2;
ADDRGP4 displayOptionsInfo+2732+96
CNSTF4 1073741824
ASGNF4
line 568
;568:	}
LABELV $816
line 569
;569:}
LABELV $198
endproc UI_DisplayOptionsMenu_Init 80 12
export UI_DisplayOptionsMenu_Cache
proc UI_DisplayOptionsMenu_Cache 0 4
line 577
;570:
;571:
;572:/*
;573:===============
;574:UI_DisplayOptionsMenu_Cache
;575:===============
;576:*/
;577:void UI_DisplayOptionsMenu_Cache( void ) {
line 578
;578:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $228
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 579
;579:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $242
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 580
;580:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $627
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 581
;581:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $645
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 582
;582:}
LABELV $820
endproc UI_DisplayOptionsMenu_Cache 0 4
export UI_DisplayOptionsMenu
proc UI_DisplayOptionsMenu 0 8
line 590
;583:
;584:
;585:/*
;586:===============
;587:UI_DisplayOptionsMenu
;588:===============
;589:*/
;590:void UI_DisplayOptionsMenu( void ) {
line 591
;591:	UI_DisplayOptionsMenu_Init();
ADDRGP4 UI_DisplayOptionsMenu_Init
CALLV
pop
line 592
;592:	UI_PushMenu( &displayOptionsInfo.menu );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 593
;593:	Menu_SetCursorToItem( &displayOptionsInfo.menu, &displayOptionsInfo.display );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1516
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 594
;594:}
LABELV $821
endproc UI_DisplayOptionsMenu 0 8
bss
align 4
LABELV displayOptionsInfo
skip 3560
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
LABELV $791
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $788
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $785
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $746
byte 1 208
byte 1 161
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 209
byte 1 140
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
byte 1 58
byte 1 0
align 1
LABELV $743
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
byte 1 183
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 180
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $740
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
byte 1 186
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $737
byte 1 208
byte 1 146
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 32
byte 1 208
byte 1 179
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 209
byte 1 133
byte 1 58
byte 1 0
align 1
LABELV $734
byte 1 208
byte 1 146
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 32
byte 1 208
byte 1 179
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 191
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 209
byte 1 145
byte 1 208
byte 1 180
byte 1 58
byte 1 0
align 1
LABELV $731
byte 1 208
byte 1 146
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 32
byte 1 208
byte 1 179
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $728
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
byte 1 183
byte 1 208
byte 1 184
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
LABELV $725
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
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 209
byte 1 129
byte 1 58
byte 1 0
align 1
LABELV $722
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
byte 1 183
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 51
byte 1 68
byte 1 32
byte 1 208
byte 1 151
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 135
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $719
byte 1 208
byte 1 146
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 176
byte 1 45
byte 1 209
byte 1 129
byte 1 208
byte 1 188
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
LABELV $716
byte 1 208
byte 1 146
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 176
byte 1 45
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 143
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 58
byte 1 0
align 1
LABELV $713
byte 1 208
byte 1 146
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 208
byte 1 181
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $710
byte 1 208
byte 1 161
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 143
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
byte 1 190
byte 1 208
byte 1 178
byte 1 58
byte 1 0
align 1
LABELV $707
byte 1 208
byte 1 160
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 32
byte 1 208
byte 1 191
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
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $695
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 83
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $692
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $689
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $684
byte 1 69
byte 1 121
byte 1 101
byte 1 115
byte 1 32
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $681
byte 1 69
byte 1 121
byte 1 101
byte 1 115
byte 1 32
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 58
byte 1 0
align 1
LABELV $678
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $675
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $672
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 51
byte 1 68
byte 1 32
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $669
byte 1 84
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $666
byte 1 84
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $663
byte 1 84
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $660
byte 1 79
byte 1 108
byte 1 100
byte 1 32
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $657
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $645
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
LABELV $627
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
LABELV $409
byte 1 208
byte 1 160
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 32
byte 1 209
byte 1 141
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $403
byte 1 83
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $381
byte 1 208
byte 1 175
byte 1 209
byte 1 128
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $375
byte 1 66
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $363
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
LABELV $357
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $334
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
LABELV $328
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $306
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
LABELV $300
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $277
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
LABELV $271
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
LABELV $242
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
LABELV $228
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
LABELV $220
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
LABELV $214
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
LABELV $192
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $184
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $180
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $176
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 69
byte 1 121
byte 1 101
byte 1 115
byte 1 95
byte 1 85
byte 1 112
byte 1 0
align 1
LABELV $172
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 69
byte 1 121
byte 1 101
byte 1 115
byte 1 95
byte 1 70
byte 1 119
byte 1 100
byte 1 0
align 1
LABELV $158
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 69
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $136
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $120
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 51
byte 1 100
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $116
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $112
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $108
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $100
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
byte 1 83
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $96
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
LABELV $92
byte 1 114
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 0
