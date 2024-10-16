data
align 4
LABELV rate_items
address $80
address $81
address $82
address $83
address $84
byte 4 0
code
proc UI_NetworkOptionsMenu_Event 8 8
file "../../../code/q3_ui/ui_network.c"
line 61
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:NETWORK OPTIONS MENU
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
;23:#define ID_RATE				14
;24:#define ID_BACK				15
;25:
;26:
;27:static const char *rate_items[] = {
;28:	"<= 28.8K",
;29:	"33.6K",
;30:	"56K",
;31:	"ISDN",
;32:	"LAN/Cable/xDSL",
;33:	0
;34:};
;35:
;36:typedef struct {
;37:	menuframework_s	menu;
;38:
;39:	menutext_s		banner;
;40:	menubitmap_s	framel;
;41:	menubitmap_s	framer;
;42:
;43:	menutext_s		graphics;
;44:	menutext_s		display;
;45:	menutext_s		sound;
;46:	menutext_s		network;
;47:
;48:	menulist_s		rate;
;49:
;50:	menubitmap_s	back;
;51:} networkOptionsInfo_t;
;52:
;53:static networkOptionsInfo_t	networkOptionsInfo;
;54:
;55:
;56:/*
;57:=================
;58:UI_NetworkOptionsMenu_Event
;59:=================
;60:*/
;61:static void UI_NetworkOptionsMenu_Event( void* ptr, int event ) {
line 62
;62:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $87
line 63
;63:		return;
ADDRGP4 $86
JUMPV
LABELV $87
line 66
;64:	}
;65:
;66:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $89
ADDRLP4 0
INDIRI4
CNSTI4 15
GTI4 $89
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $119-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $119
address $92
address $93
address $94
address $90
address $96
address $118
code
LABELV $92
line 68
;67:	case ID_GRAPHICS:
;68:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 69
;69:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 70
;70:		break;
ADDRGP4 $90
JUMPV
LABELV $93
line 73
;71:
;72:	case ID_DISPLAY:
;73:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 74
;74:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 75
;75:		break;
ADDRGP4 $90
JUMPV
LABELV $94
line 78
;76:
;77:	case ID_SOUND:
;78:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 79
;79:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 80
;80:		break;
ADDRGP4 $90
JUMPV
line 83
;81:
;82:	case ID_NETWORK:
;83:		break;
LABELV $96
line 86
;84:
;85:	case ID_RATE:
;86:		if( networkOptionsInfo.rate.curvalue == 0 ) {
ADDRGP4 networkOptionsInfo+1828+92
INDIRI4
CNSTI4 0
NEI4 $97
line 87
;87:			trap_Cvar_SetValue( "rate", 2500 );
ADDRGP4 $101
ARGP4
CNSTF4 1159479296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 88
;88:		}
ADDRGP4 $90
JUMPV
LABELV $97
line 89
;89:		else if( networkOptionsInfo.rate.curvalue == 1 ) {
ADDRGP4 networkOptionsInfo+1828+92
INDIRI4
CNSTI4 1
NEI4 $102
line 90
;90:			trap_Cvar_SetValue( "rate", 3000 );
ADDRGP4 $101
ARGP4
CNSTF4 1161527296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 91
;91:		}
ADDRGP4 $90
JUMPV
LABELV $102
line 92
;92:		else if( networkOptionsInfo.rate.curvalue == 2 ) {
ADDRGP4 networkOptionsInfo+1828+92
INDIRI4
CNSTI4 2
NEI4 $106
line 93
;93:			trap_Cvar_SetValue( "rate", 4000 );
ADDRGP4 $101
ARGP4
CNSTF4 1165623296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 94
;94:		}
ADDRGP4 $90
JUMPV
LABELV $106
line 95
;95:		else if( networkOptionsInfo.rate.curvalue == 3 ) {
ADDRGP4 networkOptionsInfo+1828+92
INDIRI4
CNSTI4 3
NEI4 $110
line 96
;96:			trap_Cvar_SetValue( "rate", 5000 );
ADDRGP4 $101
ARGP4
CNSTF4 1167867904
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 97
;97:		}
ADDRGP4 $90
JUMPV
LABELV $110
line 98
;98:		else if( networkOptionsInfo.rate.curvalue == 4 ) {
ADDRGP4 networkOptionsInfo+1828+92
INDIRI4
CNSTI4 4
NEI4 $90
line 99
;99:			trap_Cvar_SetValue( "rate", 25000 );
ADDRGP4 $101
ARGP4
CNSTF4 1187205120
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 100
;100:		}
line 101
;101:		break;
ADDRGP4 $90
JUMPV
LABELV $118
line 104
;102:
;103:	case ID_BACK:
;104:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 105
;105:		break;
LABELV $89
LABELV $90
line 107
;106:	}
;107:}
LABELV $86
endproc UI_NetworkOptionsMenu_Event 8 8
proc UI_NetworkOptionsMenu_Init 12 12
line 115
;108:
;109:
;110:/*
;111:===============
;112:UI_NetworkOptionsMenu_Init
;113:===============
;114:*/
;115:static void UI_NetworkOptionsMenu_Init( void ) {
line 119
;116:	int		y;
;117:	int		rate;
;118:
;119:	memset( &networkOptionsInfo, 0, sizeof(networkOptionsInfo) );
ADDRGP4 networkOptionsInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2076
ARGI4
ADDRGP4 memset
CALLP4
pop
line 121
;120:
;121:	UI_NetworkOptionsMenu_Cache();
ADDRGP4 UI_NetworkOptionsMenu_Cache
CALLV
pop
line 122
;122:	networkOptionsInfo.menu.wrapAround = qtrue;
ADDRGP4 networkOptionsInfo+1044
CNSTI4 1
ASGNI4
line 123
;123:	networkOptionsInfo.menu.native 	   = qfalse;
ADDRGP4 networkOptionsInfo+1056
CNSTI4 0
ASGNI4
line 124
;124:	networkOptionsInfo.menu.fullscreen = qtrue;
ADDRGP4 networkOptionsInfo+1052
CNSTI4 1
ASGNI4
line 126
;125:
;126:	networkOptionsInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 networkOptionsInfo+1076
CNSTI4 10
ASGNI4
line 127
;127:	networkOptionsInfo.banner.generic.flags		= QMF_CENTER_JUSTIFY;
ADDRGP4 networkOptionsInfo+1076+72
CNSTU4 8
ASGNU4
line 128
;128:	networkOptionsInfo.banner.generic.x			= 320;
ADDRGP4 networkOptionsInfo+1076+28
CNSTI4 320
ASGNI4
line 129
;129:	networkOptionsInfo.banner.generic.y			= 16;
ADDRGP4 networkOptionsInfo+1076+32
CNSTI4 16
ASGNI4
line 130
;130:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $132
line 131
;131:	networkOptionsInfo.banner.string			= "SYSTEM SETUP";
ADDRGP4 networkOptionsInfo+1076+88
ADDRGP4 $137
ASGNP4
line 132
;132:	}
LABELV $132
line 133
;133:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $138
line 134
;134:	networkOptionsInfo.banner.string			= "СИСТЕМНЫЕ НАСТРОЙКИ";
ADDRGP4 networkOptionsInfo+1076+88
ADDRGP4 $143
ASGNP4
line 135
;135:	}
LABELV $138
line 136
;136:	networkOptionsInfo.banner.color				= color_white;
ADDRGP4 networkOptionsInfo+1076+100
ADDRGP4 color_white
ASGNP4
line 137
;137:	networkOptionsInfo.banner.style				= UI_CENTER;
ADDRGP4 networkOptionsInfo+1076+92
CNSTI4 1
ASGNI4
line 139
;138:
;139:	networkOptionsInfo.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 networkOptionsInfo+1180
CNSTI4 6
ASGNI4
line 140
;140:	networkOptionsInfo.framel.generic.name		= ART_FRAMEL;
ADDRGP4 networkOptionsInfo+1180+4
ADDRGP4 $151
ASGNP4
line 141
;141:	networkOptionsInfo.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 networkOptionsInfo+1180+72
CNSTU4 16384
ASGNU4
line 142
;142:	networkOptionsInfo.framel.generic.x			= 0;  
ADDRGP4 networkOptionsInfo+1180+28
CNSTI4 0
ASGNI4
line 143
;143:	networkOptionsInfo.framel.generic.y			= 78;
ADDRGP4 networkOptionsInfo+1180+32
CNSTI4 78
ASGNI4
line 144
;144:	networkOptionsInfo.framel.width				= 256;
ADDRGP4 networkOptionsInfo+1180+104
CNSTI4 256
ASGNI4
line 145
;145:	networkOptionsInfo.framel.height			= 329;
ADDRGP4 networkOptionsInfo+1180+108
CNSTI4 329
ASGNI4
line 147
;146:
;147:	networkOptionsInfo.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 networkOptionsInfo+1296
CNSTI4 6
ASGNI4
line 148
;148:	networkOptionsInfo.framer.generic.name		= ART_FRAMER;
ADDRGP4 networkOptionsInfo+1296+4
ADDRGP4 $165
ASGNP4
line 149
;149:	networkOptionsInfo.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 networkOptionsInfo+1296+72
CNSTU4 16384
ASGNU4
line 150
;150:	networkOptionsInfo.framer.generic.x			= 376;
ADDRGP4 networkOptionsInfo+1296+28
CNSTI4 376
ASGNI4
line 151
;151:	networkOptionsInfo.framer.generic.y			= 76;
ADDRGP4 networkOptionsInfo+1296+32
CNSTI4 76
ASGNI4
line 152
;152:	networkOptionsInfo.framer.width				= 256;
ADDRGP4 networkOptionsInfo+1296+104
CNSTI4 256
ASGNI4
line 153
;153:	networkOptionsInfo.framer.height			= 334;
ADDRGP4 networkOptionsInfo+1296+108
CNSTI4 334
ASGNI4
line 155
;154:
;155:	networkOptionsInfo.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 networkOptionsInfo+1412
CNSTI4 9
ASGNI4
line 156
;156:	networkOptionsInfo.graphics.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 networkOptionsInfo+1412+72
CNSTU4 272
ASGNU4
line 157
;157:	networkOptionsInfo.graphics.generic.id			= ID_GRAPHICS;
ADDRGP4 networkOptionsInfo+1412+24
CNSTI4 10
ASGNI4
line 158
;158:	networkOptionsInfo.graphics.generic.callback	= UI_NetworkOptionsMenu_Event;
ADDRGP4 networkOptionsInfo+1412+76
ADDRGP4 UI_NetworkOptionsMenu_Event
ASGNP4
line 159
;159:	networkOptionsInfo.graphics.generic.x			= 140 - uis.wideoffset;
ADDRGP4 networkOptionsInfo+1412+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 160
;160:	networkOptionsInfo.graphics.generic.y			= 240 - 2 * PROP_HEIGHT;
ADDRGP4 networkOptionsInfo+1412+32
CNSTI4 240
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 1
LSHI4
SUBI4
ASGNI4
line 161
;161:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $189
line 162
;162:	networkOptionsInfo.graphics.string				= "GRAPHICS";
ADDRGP4 networkOptionsInfo+1412+88
ADDRGP4 $194
ASGNP4
line 163
;163:	}
LABELV $189
line 164
;164:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $195
line 165
;165:	networkOptionsInfo.graphics.string				= "ГРАФИКА";
ADDRGP4 networkOptionsInfo+1412+88
ADDRGP4 $200
ASGNP4
line 166
;166:	}
LABELV $195
line 167
;167:	networkOptionsInfo.graphics.style				= UI_RIGHT;
ADDRGP4 networkOptionsInfo+1412+92
CNSTI4 2
ASGNI4
line 168
;168:	networkOptionsInfo.graphics.color				= color_red;
ADDRGP4 networkOptionsInfo+1412+100
ADDRGP4 color_red
ASGNP4
line 170
;169:
;170:	networkOptionsInfo.display.generic.type			= MTYPE_PTEXT;
ADDRGP4 networkOptionsInfo+1516
CNSTI4 9
ASGNI4
line 171
;171:	networkOptionsInfo.display.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 networkOptionsInfo+1516+72
CNSTU4 272
ASGNU4
line 172
;172:	networkOptionsInfo.display.generic.id			= ID_DISPLAY;
ADDRGP4 networkOptionsInfo+1516+24
CNSTI4 11
ASGNI4
line 173
;173:	networkOptionsInfo.display.generic.callback		= UI_NetworkOptionsMenu_Event;
ADDRGP4 networkOptionsInfo+1516+76
ADDRGP4 UI_NetworkOptionsMenu_Event
ASGNP4
line 174
;174:	networkOptionsInfo.display.generic.x			= 140 - uis.wideoffset;
ADDRGP4 networkOptionsInfo+1516+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 175
;175:	networkOptionsInfo.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 networkOptionsInfo+1516+32
CNSTI4 240
ADDRGP4 cl_propheight+12
INDIRI4
SUBI4
ASGNI4
line 176
;176:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $218
line 177
;177:	networkOptionsInfo.display.string				= "DISPLAY";
ADDRGP4 networkOptionsInfo+1516+88
ADDRGP4 $223
ASGNP4
line 178
;178:	}
LABELV $218
line 179
;179:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $224
line 180
;180:	networkOptionsInfo.display.string				= "ЭКРАН";
ADDRGP4 networkOptionsInfo+1516+88
ADDRGP4 $229
ASGNP4
line 181
;181:	}
LABELV $224
line 182
;182:	networkOptionsInfo.display.style				= UI_RIGHT;
ADDRGP4 networkOptionsInfo+1516+92
CNSTI4 2
ASGNI4
line 183
;183:	networkOptionsInfo.display.color				= color_red;
ADDRGP4 networkOptionsInfo+1516+100
ADDRGP4 color_red
ASGNP4
line 185
;184:
;185:	networkOptionsInfo.sound.generic.type			= MTYPE_PTEXT;
ADDRGP4 networkOptionsInfo+1620
CNSTI4 9
ASGNI4
line 186
;186:	networkOptionsInfo.sound.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 networkOptionsInfo+1620+72
CNSTU4 272
ASGNU4
line 187
;187:	networkOptionsInfo.sound.generic.id				= ID_SOUND;
ADDRGP4 networkOptionsInfo+1620+24
CNSTI4 12
ASGNI4
line 188
;188:	networkOptionsInfo.sound.generic.callback		= UI_NetworkOptionsMenu_Event;
ADDRGP4 networkOptionsInfo+1620+76
ADDRGP4 UI_NetworkOptionsMenu_Event
ASGNP4
line 189
;189:	networkOptionsInfo.sound.generic.x				= 140 - uis.wideoffset;
ADDRGP4 networkOptionsInfo+1620+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 190
;190:	networkOptionsInfo.sound.generic.y				= 240;
ADDRGP4 networkOptionsInfo+1620+32
CNSTI4 240
ASGNI4
line 191
;191:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $246
line 192
;192:	networkOptionsInfo.sound.string					= "SOUND";
ADDRGP4 networkOptionsInfo+1620+88
ADDRGP4 $251
ASGNP4
line 193
;193:	}
LABELV $246
line 194
;194:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $252
line 195
;195:	networkOptionsInfo.sound.string					= "ЗВУК";
ADDRGP4 networkOptionsInfo+1620+88
ADDRGP4 $257
ASGNP4
line 196
;196:	}
LABELV $252
line 197
;197:	networkOptionsInfo.sound.style					= UI_RIGHT;
ADDRGP4 networkOptionsInfo+1620+92
CNSTI4 2
ASGNI4
line 198
;198:	networkOptionsInfo.sound.color					= color_red;
ADDRGP4 networkOptionsInfo+1620+100
ADDRGP4 color_red
ASGNP4
line 200
;199:
;200:	networkOptionsInfo.network.generic.type			= MTYPE_PTEXT;
ADDRGP4 networkOptionsInfo+1724
CNSTI4 9
ASGNI4
line 201
;201:	networkOptionsInfo.network.generic.flags		= QMF_RIGHT_JUSTIFY;
ADDRGP4 networkOptionsInfo+1724+72
CNSTU4 16
ASGNU4
line 202
;202:	networkOptionsInfo.network.generic.id			= ID_NETWORK;
ADDRGP4 networkOptionsInfo+1724+24
CNSTI4 13
ASGNI4
line 203
;203:	networkOptionsInfo.network.generic.callback		= UI_NetworkOptionsMenu_Event;
ADDRGP4 networkOptionsInfo+1724+76
ADDRGP4 UI_NetworkOptionsMenu_Event
ASGNP4
line 204
;204:	networkOptionsInfo.network.generic.x			= 140 - uis.wideoffset;
ADDRGP4 networkOptionsInfo+1724+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 205
;205:	networkOptionsInfo.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 networkOptionsInfo+1724+32
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 240
ADDI4
ASGNI4
line 206
;206:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $275
line 207
;207:	networkOptionsInfo.network.string				= "NETWORK";
ADDRGP4 networkOptionsInfo+1724+88
ADDRGP4 $280
ASGNP4
line 208
;208:	}
LABELV $275
line 209
;209:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $281
line 210
;210:	networkOptionsInfo.network.string				= "СЕТЬ";
ADDRGP4 networkOptionsInfo+1724+88
ADDRGP4 $286
ASGNP4
line 211
;211:	}
LABELV $281
line 212
;212:	networkOptionsInfo.network.style				= UI_RIGHT;
ADDRGP4 networkOptionsInfo+1724+92
CNSTI4 2
ASGNI4
line 213
;213:	networkOptionsInfo.network.color				= color_red;
ADDRGP4 networkOptionsInfo+1724+100
ADDRGP4 color_red
ASGNP4
line 215
;214:
;215:	y = 240 - 1 * (BIGCHAR_HEIGHT+2);
ADDRLP4 4
CNSTI4 240
CNSTI4 1
ADDRGP4 cl_bigcharheight+12
INDIRI4
MULI4
CNSTI4 2
ADDI4
SUBI4
ASGNI4
line 216
;216:	networkOptionsInfo.rate.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 networkOptionsInfo+1828
CNSTI4 3
ASGNI4
line 217
;217:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $293
line 218
;218:	networkOptionsInfo.rate.generic.name		= "Data Rate:";
ADDRGP4 networkOptionsInfo+1828+4
ADDRGP4 $298
ASGNP4
line 219
;219:	}
LABELV $293
line 220
;220:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $299
line 221
;221:	networkOptionsInfo.rate.generic.name		= "Скорость Сети:";
ADDRGP4 networkOptionsInfo+1828+4
ADDRGP4 $304
ASGNP4
line 222
;222:	}
LABELV $299
line 223
;223:	networkOptionsInfo.rate.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 networkOptionsInfo+1828+72
CNSTU4 258
ASGNU4
line 224
;224:	networkOptionsInfo.rate.generic.callback	= UI_NetworkOptionsMenu_Event;
ADDRGP4 networkOptionsInfo+1828+76
ADDRGP4 UI_NetworkOptionsMenu_Event
ASGNP4
line 225
;225:	networkOptionsInfo.rate.generic.id			= ID_RATE;
ADDRGP4 networkOptionsInfo+1828+24
CNSTI4 14
ASGNI4
line 226
;226:	networkOptionsInfo.rate.generic.x			= 400;
ADDRGP4 networkOptionsInfo+1828+28
CNSTI4 400
ASGNI4
line 227
;227:	networkOptionsInfo.rate.generic.y			= y;
ADDRGP4 networkOptionsInfo+1828+32
ADDRLP4 4
INDIRI4
ASGNI4
line 228
;228:	networkOptionsInfo.rate.itemnames			= rate_items;
ADDRGP4 networkOptionsInfo+1828+104
ADDRGP4 rate_items
ASGNP4
line 230
;229:
;230:	networkOptionsInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 networkOptionsInfo+1960
CNSTI4 6
ASGNI4
line 231
;231:	networkOptionsInfo.back.generic.name		= ART_BACK0;
ADDRGP4 networkOptionsInfo+1960+4
ADDRGP4 $320
ASGNP4
line 232
;232:	networkOptionsInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 networkOptionsInfo+1960+72
CNSTU4 260
ASGNU4
line 233
;233:	networkOptionsInfo.back.generic.callback	= UI_NetworkOptionsMenu_Event;
ADDRGP4 networkOptionsInfo+1960+76
ADDRGP4 UI_NetworkOptionsMenu_Event
ASGNP4
line 234
;234:	networkOptionsInfo.back.generic.id			= ID_BACK;
ADDRGP4 networkOptionsInfo+1960+24
CNSTI4 15
ASGNI4
line 235
;235:	networkOptionsInfo.back.generic.x			= 0 - uis.wideoffset;
ADDRGP4 networkOptionsInfo+1960+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 236
;236:	networkOptionsInfo.back.generic.y			= 480-64;
ADDRGP4 networkOptionsInfo+1960+32
CNSTI4 416
ASGNI4
line 237
;237:	networkOptionsInfo.back.width				= 128;
ADDRGP4 networkOptionsInfo+1960+104
CNSTI4 128
ASGNI4
line 238
;238:	networkOptionsInfo.back.height				= 64;
ADDRGP4 networkOptionsInfo+1960+108
CNSTI4 64
ASGNI4
line 239
;239:	networkOptionsInfo.back.focuspic			= ART_BACK1;
ADDRGP4 networkOptionsInfo+1960+88
ADDRGP4 $338
ASGNP4
line 241
;240:
;241:	Menu_AddItem( &networkOptionsInfo.menu, ( void * ) &networkOptionsInfo.banner );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 networkOptionsInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 242
;242:	Menu_AddItem( &networkOptionsInfo.menu, ( void * ) &networkOptionsInfo.framel );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 networkOptionsInfo+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 243
;243:	Menu_AddItem( &networkOptionsInfo.menu, ( void * ) &networkOptionsInfo.framer );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 networkOptionsInfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 244
;244:	Menu_AddItem( &networkOptionsInfo.menu, ( void * ) &networkOptionsInfo.graphics );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 networkOptionsInfo+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 245
;245:	Menu_AddItem( &networkOptionsInfo.menu, ( void * ) &networkOptionsInfo.display );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 networkOptionsInfo+1516
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 246
;246:	Menu_AddItem( &networkOptionsInfo.menu, ( void * ) &networkOptionsInfo.sound );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 networkOptionsInfo+1620
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 247
;247:	Menu_AddItem( &networkOptionsInfo.menu, ( void * ) &networkOptionsInfo.network );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 networkOptionsInfo+1724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 248
;248:	Menu_AddItem( &networkOptionsInfo.menu, ( void * ) &networkOptionsInfo.rate );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 networkOptionsInfo+1828
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 249
;249:	Menu_AddItem( &networkOptionsInfo.menu, ( void * ) &networkOptionsInfo.back );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 networkOptionsInfo+1960
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 251
;250:
;251:	rate = trap_Cvar_VariableValue( "rate" );
ADDRGP4 $101
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 252
;252:	if( rate <= 2500 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2500
GTI4 $348
line 253
;253:		networkOptionsInfo.rate.curvalue = 0;
ADDRGP4 networkOptionsInfo+1828+92
CNSTI4 0
ASGNI4
line 254
;254:	}
ADDRGP4 $349
JUMPV
LABELV $348
line 255
;255:	else if( rate <= 3000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 3000
GTI4 $352
line 256
;256:		networkOptionsInfo.rate.curvalue = 1;
ADDRGP4 networkOptionsInfo+1828+92
CNSTI4 1
ASGNI4
line 257
;257:	}
ADDRGP4 $353
JUMPV
LABELV $352
line 258
;258:	else if( rate <= 4000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4000
GTI4 $356
line 259
;259:		networkOptionsInfo.rate.curvalue = 2;
ADDRGP4 networkOptionsInfo+1828+92
CNSTI4 2
ASGNI4
line 260
;260:	}
ADDRGP4 $357
JUMPV
LABELV $356
line 261
;261:	else if( rate <= 5000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
GTI4 $360
line 262
;262:		networkOptionsInfo.rate.curvalue = 3;
ADDRGP4 networkOptionsInfo+1828+92
CNSTI4 3
ASGNI4
line 263
;263:	}
ADDRGP4 $361
JUMPV
LABELV $360
line 264
;264:	else {
line 265
;265:		networkOptionsInfo.rate.curvalue = 4;
ADDRGP4 networkOptionsInfo+1828+92
CNSTI4 4
ASGNI4
line 266
;266:	}
LABELV $361
LABELV $357
LABELV $353
LABELV $349
line 267
;267:}
LABELV $121
endproc UI_NetworkOptionsMenu_Init 12 12
export UI_NetworkOptionsMenu_Cache
proc UI_NetworkOptionsMenu_Cache 0 4
line 275
;268:
;269:
;270:/*
;271:===============
;272:UI_NetworkOptionsMenu_Cache
;273:===============
;274:*/
;275:void UI_NetworkOptionsMenu_Cache( void ) {
line 276
;276:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $151
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 277
;277:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $165
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 278
;278:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $320
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 279
;279:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $338
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 280
;280:}
LABELV $366
endproc UI_NetworkOptionsMenu_Cache 0 4
export UI_NetworkOptionsMenu
proc UI_NetworkOptionsMenu 0 8
line 288
;281:
;282:
;283:/*
;284:===============
;285:UI_NetworkOptionsMenu
;286:===============
;287:*/
;288:void UI_NetworkOptionsMenu( void ) {
line 289
;289:	UI_NetworkOptionsMenu_Init();
ADDRGP4 UI_NetworkOptionsMenu_Init
CALLV
pop
line 290
;290:	UI_PushMenu( &networkOptionsInfo.menu );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 291
;291:	Menu_SetCursorToItem( &networkOptionsInfo.menu, &networkOptionsInfo.network );
ADDRGP4 networkOptionsInfo
ARGP4
ADDRGP4 networkOptionsInfo+1724
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 292
;292:}
LABELV $367
endproc UI_NetworkOptionsMenu 0 8
bss
align 4
LABELV networkOptionsInfo
skip 2076
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
LABELV $338
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
LABELV $320
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
LABELV $304
byte 1 208
byte 1 161
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
LABELV $298
byte 1 68
byte 1 97
byte 1 116
byte 1 97
byte 1 32
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $286
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
LABELV $280
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $257
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
LABELV $251
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $229
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
LABELV $223
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $200
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
LABELV $194
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
LABELV $165
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
LABELV $151
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
LABELV $143
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
LABELV $137
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
LABELV $101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $84
byte 1 76
byte 1 65
byte 1 78
byte 1 47
byte 1 67
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 47
byte 1 120
byte 1 68
byte 1 83
byte 1 76
byte 1 0
align 1
LABELV $83
byte 1 73
byte 1 83
byte 1 68
byte 1 78
byte 1 0
align 1
LABELV $82
byte 1 53
byte 1 54
byte 1 75
byte 1 0
align 1
LABELV $81
byte 1 51
byte 1 51
byte 1 46
byte 1 54
byte 1 75
byte 1 0
align 1
LABELV $80
byte 1 60
byte 1 61
byte 1 32
byte 1 50
byte 1 56
byte 1 46
byte 1 56
byte 1 75
byte 1 0
