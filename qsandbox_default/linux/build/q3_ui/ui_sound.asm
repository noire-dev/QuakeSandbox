data
align 4
LABELV quality_items
address $80
address $81
address $82
address $83
byte 4 0
align 4
LABELV quality_itemsru
address $84
address $85
address $86
address $87
byte 4 0
align 4
LABELV sdriver_items
address $88
address $89
byte 4 0
code
proc UI_SoundOptionsMenu_Event 8 8
file "../../../code/q3_ui/ui_sound.c"
line 75
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:SOUND OPTIONS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:
;13:
;14:#include "ui_local.h"
;15:
;16:
;17:#define ART_FRAMEL			"menu/art/frame2_l"
;18:#define ART_FRAMER			"menu/art/frame1_r"
;19:#define ART_BACK0			"menu/art/back_0"
;20:#define ART_BACK1			"menu/art/back_1"
;21:
;22:#define ID_GRAPHICS			10
;23:#define ID_DISPLAY			11
;24:#define ID_SOUND			12
;25:#define ID_NETWORK			13
;26:#define ID_EFFECTSVOLUME	14
;27:#define ID_MUSICVOLUME		15
;28:#define ID_QUALITY			16
;29:#define ID_SDRIVER			17
;30:#define ID_BACK				18
;31:#define ID_ANIMSFX			19
;32:
;33:
;34:static const char *quality_items[] = {
;35:	"Low", "Medium", "High", "Ultra", 0
;36:};
;37:
;38:static const char *quality_itemsru[] = {
;39:	"Низкое", "Среднее", "Высокое", "Ультра", 0
;40:};
;41:
;42:static const char *sdriver_items[] = {
;43:	"DirectSound", "WASAPI", 0
;44:};
;45:
;46:typedef struct {
;47:	menuframework_s		menu;
;48:
;49:	menutext_s			banner;
;50:	menubitmap_s		framel;
;51:	menubitmap_s		framer;
;52:
;53:	menutext_s			graphics;
;54:	menutext_s			display;
;55:	menutext_s			sound;
;56:	menutext_s			network;
;57:
;58:	menuslider_s		sfxvolume;
;59:	menuslider_s		musicvolume;
;60:	menulist_s			quality;
;61:	menulist_s			sdriver;
;62:	menuradiobutton_s	animsfx;
;63:
;64:	menubitmap_s		back;
;65:} soundOptionsInfo_t;
;66:
;67:static soundOptionsInfo_t	soundOptionsInfo;
;68:
;69:
;70:/*
;71:=================
;72:UI_SoundOptionsMenu_Event
;73:=================
;74:*/
;75:static void UI_SoundOptionsMenu_Event( void* ptr, int event ) {
line 76
;76:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $92
line 77
;77:		return;
ADDRGP4 $91
JUMPV
LABELV $92
line 80
;78:	}
;79:
;80:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $94
ADDRLP4 0
INDIRI4
CNSTI4 19
GTI4 $94
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $145-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $145
address $97
address $98
address $95
address $100
address $101
address $105
address $109
address $128
address $144
address $140
code
LABELV $97
line 82
;81:	case ID_GRAPHICS:
;82:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 83
;83:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 84
;84:		break;
ADDRGP4 $95
JUMPV
LABELV $98
line 87
;85:
;86:	case ID_DISPLAY:
;87:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 88
;88:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 89
;89:		break;
ADDRGP4 $95
JUMPV
line 92
;90:
;91:	case ID_SOUND:
;92:		break;
LABELV $100
line 95
;93:
;94:	case ID_NETWORK:
;95:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 96
;96:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 97
;97:		break;
ADDRGP4 $95
JUMPV
LABELV $101
line 100
;98:
;99:	case ID_EFFECTSVOLUME:
;100:		trap_Cvar_SetValue( "s_volume", soundOptionsInfo.sfxvolume.curvalue / 10 );
ADDRGP4 $102
ARGP4
ADDRGP4 soundOptionsInfo+1828+96
INDIRF4
CNSTF4 1092616192
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 101
;101:		break;
ADDRGP4 $95
JUMPV
LABELV $105
line 104
;102:
;103:	case ID_MUSICVOLUME:
;104:		trap_Cvar_SetValue( "s_musicvolume", soundOptionsInfo.musicvolume.curvalue / 10 );
ADDRGP4 $106
ARGP4
ADDRGP4 soundOptionsInfo+1932+96
INDIRF4
CNSTF4 1092616192
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 105
;105:		break;
ADDRGP4 $95
JUMPV
LABELV $109
line 108
;106:
;107:	case ID_QUALITY:
;108:		if( soundOptionsInfo.quality.curvalue == 0 ) {
ADDRGP4 soundOptionsInfo+2036+92
INDIRI4
CNSTI4 0
NEI4 $110
line 109
;109:			trap_Cvar_SetValue( "s_khz", 11 );
ADDRGP4 $114
ARGP4
CNSTF4 1093664768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 110
;110:		}
LABELV $110
line 111
;111:		if( soundOptionsInfo.quality.curvalue == 1 ) {
ADDRGP4 soundOptionsInfo+2036+92
INDIRI4
CNSTI4 1
NEI4 $115
line 112
;112:			trap_Cvar_SetValue( "s_khz", 22 );
ADDRGP4 $114
ARGP4
CNSTF4 1102053376
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 113
;113:		}
LABELV $115
line 114
;114:		if( soundOptionsInfo.quality.curvalue == 2 ) {
ADDRGP4 soundOptionsInfo+2036+92
INDIRI4
CNSTI4 2
NEI4 $119
line 115
;115:			trap_Cvar_SetValue( "s_khz", 44 );
ADDRGP4 $114
ARGP4
CNSTF4 1110441984
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 116
;116:		}
LABELV $119
line 117
;117:		if( soundOptionsInfo.quality.curvalue == 3 ) {
ADDRGP4 soundOptionsInfo+2036+92
INDIRI4
CNSTI4 3
NEI4 $123
line 118
;118:			trap_Cvar_SetValue( "s_khz", 48 );
ADDRGP4 $114
ARGP4
CNSTF4 1111490560
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 119
;119:		}
LABELV $123
line 120
;120:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 121
;121:		trap_Cmd_ExecuteText( EXEC_APPEND, "snd_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $127
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 122
;122:		break;
ADDRGP4 $95
JUMPV
LABELV $128
line 125
;123:
;124:	case ID_SDRIVER:
;125:		if( soundOptionsInfo.sdriver.curvalue == 0 ) {
ADDRGP4 soundOptionsInfo+2168+92
INDIRI4
CNSTI4 0
NEI4 $129
line 126
;126:			trap_Cvar_Set( "s_driver", "dsound" );
ADDRGP4 $133
ARGP4
ADDRGP4 $134
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 127
;127:		}
LABELV $129
line 128
;128:		if( soundOptionsInfo.sdriver.curvalue == 1 ) {
ADDRGP4 soundOptionsInfo+2168+92
INDIRI4
CNSTI4 1
NEI4 $135
line 129
;129:			trap_Cvar_Set( "s_driver", "wasapi" );
ADDRGP4 $133
ARGP4
ADDRGP4 $139
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 130
;130:		}
LABELV $135
line 131
;131:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 132
;132:		trap_Cmd_ExecuteText( EXEC_APPEND, "snd_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $127
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 133
;133:		break;
ADDRGP4 $95
JUMPV
LABELV $140
line 137
;134:
;135:
;136:	case ID_ANIMSFX:
;137:		trap_Cvar_SetValue("uie_s_animsfx", soundOptionsInfo.animsfx.curvalue);
ADDRGP4 $141
ARGP4
ADDRGP4 soundOptionsInfo+2300+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 138
;138:		break;
ADDRGP4 $95
JUMPV
LABELV $144
line 140
;139:	case ID_BACK:
;140:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 141
;141:		break;
LABELV $94
LABELV $95
line 143
;142:	}
;143:}
LABELV $91
endproc UI_SoundOptionsMenu_Event 8 8
proc UI_SoundOptionsMenu_Init 104 12
line 151
;144:
;145:
;146:/*
;147:===============
;148:UI_SoundOptionsMenu_Init
;149:===============
;150:*/
;151:static void UI_SoundOptionsMenu_Init( void ) {
line 155
;152:	int				y;
;153:	char 			drivername[MAX_QPATH];
;154:
;155:	memset( &soundOptionsInfo, 0, sizeof(soundOptionsInfo) );
ADDRGP4 soundOptionsInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2512
ARGI4
ADDRGP4 memset
CALLP4
pop
line 157
;156:
;157:	UI_SoundOptionsMenu_Cache();
ADDRGP4 UI_SoundOptionsMenu_Cache
CALLV
pop
line 158
;158:	soundOptionsInfo.menu.wrapAround = qtrue;
ADDRGP4 soundOptionsInfo+1044
CNSTI4 1
ASGNI4
line 159
;159:	soundOptionsInfo.menu.native 	   = qfalse;
ADDRGP4 soundOptionsInfo+1056
CNSTI4 0
ASGNI4
line 160
;160:	soundOptionsInfo.menu.fullscreen = qtrue;
ADDRGP4 soundOptionsInfo+1052
CNSTI4 1
ASGNI4
line 162
;161:
;162:	soundOptionsInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 soundOptionsInfo+1076
CNSTI4 10
ASGNI4
line 163
;163:	soundOptionsInfo.banner.generic.flags		= QMF_CENTER_JUSTIFY;
ADDRGP4 soundOptionsInfo+1076+72
CNSTU4 8
ASGNU4
line 164
;164:	soundOptionsInfo.banner.generic.x			= 320;
ADDRGP4 soundOptionsInfo+1076+28
CNSTI4 320
ASGNI4
line 165
;165:	soundOptionsInfo.banner.generic.y			= 16;
ADDRGP4 soundOptionsInfo+1076+32
CNSTI4 16
ASGNI4
line 166
;166:	soundOptionsInfo.banner.color				= color_white;
ADDRGP4 soundOptionsInfo+1076+100
ADDRGP4 color_white
ASGNP4
line 167
;167:	soundOptionsInfo.banner.style				= UI_CENTER;
ADDRGP4 soundOptionsInfo+1076+92
CNSTI4 1
ASGNI4
line 169
;168:
;169:	soundOptionsInfo.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+1180
CNSTI4 6
ASGNI4
line 170
;170:	soundOptionsInfo.framel.generic.name		= ART_FRAMEL;
ADDRGP4 soundOptionsInfo+1180+4
ADDRGP4 $165
ASGNP4
line 171
;171:	soundOptionsInfo.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 soundOptionsInfo+1180+72
CNSTU4 16384
ASGNU4
line 172
;172:	soundOptionsInfo.framel.generic.x			= 0;  
ADDRGP4 soundOptionsInfo+1180+28
CNSTI4 0
ASGNI4
line 173
;173:	soundOptionsInfo.framel.generic.y			= 78;
ADDRGP4 soundOptionsInfo+1180+32
CNSTI4 78
ASGNI4
line 174
;174:	soundOptionsInfo.framel.width				= 256;
ADDRGP4 soundOptionsInfo+1180+104
CNSTI4 256
ASGNI4
line 175
;175:	soundOptionsInfo.framel.height				= 329;
ADDRGP4 soundOptionsInfo+1180+108
CNSTI4 329
ASGNI4
line 177
;176:
;177:	soundOptionsInfo.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+1296
CNSTI4 6
ASGNI4
line 178
;178:	soundOptionsInfo.framer.generic.name		= ART_FRAMER;
ADDRGP4 soundOptionsInfo+1296+4
ADDRGP4 $179
ASGNP4
line 179
;179:	soundOptionsInfo.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 soundOptionsInfo+1296+72
CNSTU4 16384
ASGNU4
line 180
;180:	soundOptionsInfo.framer.generic.x			= 376;
ADDRGP4 soundOptionsInfo+1296+28
CNSTI4 376
ASGNI4
line 181
;181:	soundOptionsInfo.framer.generic.y			= 76;
ADDRGP4 soundOptionsInfo+1296+32
CNSTI4 76
ASGNI4
line 182
;182:	soundOptionsInfo.framer.width				= 256;
ADDRGP4 soundOptionsInfo+1296+104
CNSTI4 256
ASGNI4
line 183
;183:	soundOptionsInfo.framer.height				= 334;
ADDRGP4 soundOptionsInfo+1296+108
CNSTI4 334
ASGNI4
line 185
;184:
;185:	soundOptionsInfo.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+1412
CNSTI4 9
ASGNI4
line 186
;186:	soundOptionsInfo.graphics.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+1412+72
CNSTU4 272
ASGNU4
line 187
;187:	soundOptionsInfo.graphics.generic.id		= ID_GRAPHICS;
ADDRGP4 soundOptionsInfo+1412+24
CNSTI4 10
ASGNI4
line 188
;188:	soundOptionsInfo.graphics.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1412+76
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 189
;189:	soundOptionsInfo.graphics.generic.x			= 140 - uis.wideoffset;
ADDRGP4 soundOptionsInfo+1412+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 190
;190:	soundOptionsInfo.graphics.generic.y			= 240 - 2 * PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+1412+32
CNSTI4 240
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 1
LSHI4
SUBI4
ASGNI4
line 191
;191:	soundOptionsInfo.graphics.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+1412+92
CNSTI4 2
ASGNI4
line 192
;192:	soundOptionsInfo.graphics.color				= color_red;
ADDRGP4 soundOptionsInfo+1412+100
ADDRGP4 color_red
ASGNP4
line 194
;193:
;194:	soundOptionsInfo.display.generic.type		= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+1516
CNSTI4 9
ASGNI4
line 195
;195:	soundOptionsInfo.display.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+1516+72
CNSTU4 272
ASGNU4
line 196
;196:	soundOptionsInfo.display.generic.id			= ID_DISPLAY;
ADDRGP4 soundOptionsInfo+1516+24
CNSTI4 11
ASGNI4
line 197
;197:	soundOptionsInfo.display.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1516+76
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 198
;198:	soundOptionsInfo.display.generic.x			= 140 - uis.wideoffset;
ADDRGP4 soundOptionsInfo+1516+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 199
;199:	soundOptionsInfo.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+1516+32
CNSTI4 240
ADDRGP4 cl_propheight+12
INDIRI4
SUBI4
ASGNI4
line 200
;200:	soundOptionsInfo.display.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+1516+92
CNSTI4 2
ASGNI4
line 201
;201:	soundOptionsInfo.display.color				= color_red;
ADDRGP4 soundOptionsInfo+1516+100
ADDRGP4 color_red
ASGNP4
line 203
;202:
;203:	soundOptionsInfo.sound.generic.type			= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+1620
CNSTI4 9
ASGNI4
line 204
;204:	soundOptionsInfo.sound.generic.flags		= QMF_RIGHT_JUSTIFY;
ADDRGP4 soundOptionsInfo+1620+72
CNSTU4 16
ASGNU4
line 205
;205:	soundOptionsInfo.sound.generic.id			= ID_SOUND;
ADDRGP4 soundOptionsInfo+1620+24
CNSTI4 12
ASGNI4
line 206
;206:	soundOptionsInfo.sound.generic.callback		= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1620+76
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 207
;207:	soundOptionsInfo.sound.generic.x			= 140 - uis.wideoffset;
ADDRGP4 soundOptionsInfo+1620+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 208
;208:	soundOptionsInfo.sound.generic.y			= 240;
ADDRGP4 soundOptionsInfo+1620+32
CNSTI4 240
ASGNI4
line 209
;209:	soundOptionsInfo.sound.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+1620+92
CNSTI4 2
ASGNI4
line 210
;210:	soundOptionsInfo.sound.color				= color_red;
ADDRGP4 soundOptionsInfo+1620+100
ADDRGP4 color_red
ASGNP4
line 212
;211:
;212:	soundOptionsInfo.network.generic.type		= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+1724
CNSTI4 9
ASGNI4
line 213
;213:	soundOptionsInfo.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+1724+72
CNSTU4 272
ASGNU4
line 214
;214:	soundOptionsInfo.network.generic.id			= ID_NETWORK;
ADDRGP4 soundOptionsInfo+1724+24
CNSTI4 13
ASGNI4
line 215
;215:	soundOptionsInfo.network.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1724+76
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 216
;216:	soundOptionsInfo.network.generic.x			= 140 - uis.wideoffset;
ADDRGP4 soundOptionsInfo+1724+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 217
;217:	soundOptionsInfo.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+1724+32
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 240
ADDI4
ASGNI4
line 218
;218:	soundOptionsInfo.network.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+1724+92
CNSTI4 2
ASGNI4
line 219
;219:	soundOptionsInfo.network.color				= color_red;
ADDRGP4 soundOptionsInfo+1724+100
ADDRGP4 color_red
ASGNP4
line 221
;220:
;221:	y = 240 - 2.0 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTF4 1131413504
CNSTF4 1073741824
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 222
;222:	soundOptionsInfo.sfxvolume.generic.type		= MTYPE_SLIDER;
ADDRGP4 soundOptionsInfo+1828
CNSTI4 1
ASGNI4
line 223
;223:	soundOptionsInfo.sfxvolume.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+1828+72
CNSTU4 258
ASGNU4
line 224
;224:	soundOptionsInfo.sfxvolume.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1828+76
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 225
;225:	soundOptionsInfo.sfxvolume.generic.id		= ID_EFFECTSVOLUME;
ADDRGP4 soundOptionsInfo+1828+24
CNSTI4 14
ASGNI4
line 226
;226:	soundOptionsInfo.sfxvolume.generic.x		= 400;
ADDRGP4 soundOptionsInfo+1828+28
CNSTI4 400
ASGNI4
line 227
;227:	soundOptionsInfo.sfxvolume.generic.y		= y;
ADDRGP4 soundOptionsInfo+1828+32
ADDRLP4 0
INDIRI4
ASGNI4
line 228
;228:	soundOptionsInfo.sfxvolume.minvalue			= 0;
ADDRGP4 soundOptionsInfo+1828+88
CNSTF4 0
ASGNF4
line 229
;229:	soundOptionsInfo.sfxvolume.maxvalue			= 10;
ADDRGP4 soundOptionsInfo+1828+92
CNSTF4 1092616192
ASGNF4
line 231
;230:
;231:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 232
;232:	soundOptionsInfo.musicvolume.generic.type		= MTYPE_SLIDER;
ADDRGP4 soundOptionsInfo+1932
CNSTI4 1
ASGNI4
line 233
;233:	soundOptionsInfo.musicvolume.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+1932+72
CNSTU4 258
ASGNU4
line 234
;234:	soundOptionsInfo.musicvolume.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1932+76
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 235
;235:	soundOptionsInfo.musicvolume.generic.id			= ID_MUSICVOLUME;
ADDRGP4 soundOptionsInfo+1932+24
CNSTI4 15
ASGNI4
line 236
;236:	soundOptionsInfo.musicvolume.generic.x			= 400;
ADDRGP4 soundOptionsInfo+1932+28
CNSTI4 400
ASGNI4
line 237
;237:	soundOptionsInfo.musicvolume.generic.y			= y;
ADDRGP4 soundOptionsInfo+1932+32
ADDRLP4 0
INDIRI4
ASGNI4
line 238
;238:	soundOptionsInfo.musicvolume.minvalue			= 0;
ADDRGP4 soundOptionsInfo+1932+88
CNSTF4 0
ASGNF4
line 239
;239:	soundOptionsInfo.musicvolume.maxvalue			= 10;
ADDRGP4 soundOptionsInfo+1932+92
CNSTF4 1092616192
ASGNF4
line 241
;240:
;241:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 242
;242:	soundOptionsInfo.quality.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 soundOptionsInfo+2036
CNSTI4 3
ASGNI4
line 243
;243:	soundOptionsInfo.quality.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+2036+72
CNSTU4 258
ASGNU4
line 244
;244:	soundOptionsInfo.quality.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+2036+76
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 245
;245:	soundOptionsInfo.quality.generic.id			= ID_QUALITY;
ADDRGP4 soundOptionsInfo+2036+24
CNSTI4 16
ASGNI4
line 246
;246:	soundOptionsInfo.quality.generic.x			= 400;
ADDRGP4 soundOptionsInfo+2036+28
CNSTI4 400
ASGNI4
line 247
;247:	soundOptionsInfo.quality.generic.y			= y;
ADDRGP4 soundOptionsInfo+2036+32
ADDRLP4 0
INDIRI4
ASGNI4
line 249
;248:
;249:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 250
;250:	soundOptionsInfo.sdriver.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 soundOptionsInfo+2168
CNSTI4 3
ASGNI4
line 251
;251:	soundOptionsInfo.sdriver.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+2168+72
CNSTU4 258
ASGNU4
line 252
;252:	soundOptionsInfo.sdriver.generic.callback		= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+2168+76
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 253
;253:	soundOptionsInfo.sdriver.generic.id				= ID_SDRIVER;
ADDRGP4 soundOptionsInfo+2168+24
CNSTI4 17
ASGNI4
line 254
;254:	soundOptionsInfo.sdriver.generic.x				= 400;
ADDRGP4 soundOptionsInfo+2168+28
CNSTI4 400
ASGNI4
line 255
;255:	soundOptionsInfo.sdriver.generic.y				= y;
ADDRGP4 soundOptionsInfo+2168+32
ADDRLP4 0
INDIRI4
ASGNI4
line 257
;256:
;257:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 258
;258:	soundOptionsInfo.animsfx.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 soundOptionsInfo+2300
CNSTI4 5
ASGNI4
line 259
;259:	soundOptionsInfo.animsfx.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+2300+72
CNSTU4 258
ASGNU4
line 260
;260:	soundOptionsInfo.animsfx.generic.callback		= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+2300+76
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 261
;261:	soundOptionsInfo.animsfx.generic.id				= ID_ANIMSFX;
ADDRGP4 soundOptionsInfo+2300+24
CNSTI4 19
ASGNI4
line 262
;262:	soundOptionsInfo.animsfx.generic.x				= 400;
ADDRGP4 soundOptionsInfo+2300+28
CNSTI4 400
ASGNI4
line 263
;263:	soundOptionsInfo.animsfx.generic.y				= y;
ADDRGP4 soundOptionsInfo+2300+32
ADDRLP4 0
INDIRI4
ASGNI4
line 265
;264:
;265:	soundOptionsInfo.back.generic.type			= MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+2396
CNSTI4 6
ASGNI4
line 266
;266:	soundOptionsInfo.back.generic.name			= ART_BACK0;
ADDRGP4 soundOptionsInfo+2396+4
ADDRGP4 $328
ASGNP4
line 267
;267:	soundOptionsInfo.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+2396+72
CNSTU4 260
ASGNU4
line 268
;268:	soundOptionsInfo.back.generic.callback		= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+2396+76
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 269
;269:	soundOptionsInfo.back.generic.id			= ID_BACK;
ADDRGP4 soundOptionsInfo+2396+24
CNSTI4 18
ASGNI4
line 270
;270:	soundOptionsInfo.back.generic.x				= 0 - uis.wideoffset;
ADDRGP4 soundOptionsInfo+2396+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 271
;271:	soundOptionsInfo.back.generic.y				= 480-64;
ADDRGP4 soundOptionsInfo+2396+32
CNSTI4 416
ASGNI4
line 272
;272:	soundOptionsInfo.back.width					= 128;
ADDRGP4 soundOptionsInfo+2396+104
CNSTI4 128
ASGNI4
line 273
;273:	soundOptionsInfo.back.height				= 64;
ADDRGP4 soundOptionsInfo+2396+108
CNSTI4 64
ASGNI4
line 274
;274:	soundOptionsInfo.back.focuspic				= ART_BACK1;
ADDRGP4 soundOptionsInfo+2396+88
ADDRGP4 $346
ASGNP4
line 276
;275:	
;276:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $347
line 277
;277:	soundOptionsInfo.banner.string				= "SYSTEM SETUP";
ADDRGP4 soundOptionsInfo+1076+88
ADDRGP4 $352
ASGNP4
line 278
;278:	soundOptionsInfo.graphics.string			= "GRAPHICS";
ADDRGP4 soundOptionsInfo+1412+88
ADDRGP4 $355
ASGNP4
line 279
;279:	soundOptionsInfo.display.string				= "DISPLAY";
ADDRGP4 soundOptionsInfo+1516+88
ADDRGP4 $358
ASGNP4
line 280
;280:	soundOptionsInfo.sound.string				= "SOUND";
ADDRGP4 soundOptionsInfo+1620+88
ADDRGP4 $361
ASGNP4
line 281
;281:	soundOptionsInfo.network.string				= "NETWORK";
ADDRGP4 soundOptionsInfo+1724+88
ADDRGP4 $364
ASGNP4
line 282
;282:	soundOptionsInfo.sfxvolume.generic.name		= "Effects Volume:";
ADDRGP4 soundOptionsInfo+1828+4
ADDRGP4 $367
ASGNP4
line 283
;283:	soundOptionsInfo.musicvolume.generic.name		= "Music Volume:";
ADDRGP4 soundOptionsInfo+1932+4
ADDRGP4 $370
ASGNP4
line 284
;284:	soundOptionsInfo.quality.generic.name		= "Sound Quality:";
ADDRGP4 soundOptionsInfo+2036+4
ADDRGP4 $373
ASGNP4
line 285
;285:	soundOptionsInfo.quality.itemnames			= quality_items;
ADDRGP4 soundOptionsInfo+2036+104
ADDRGP4 quality_items
ASGNP4
line 286
;286:	soundOptionsInfo.sdriver.generic.name		= "Sound Driver:";
ADDRGP4 soundOptionsInfo+2168+4
ADDRGP4 $378
ASGNP4
line 287
;287:	soundOptionsInfo.sdriver.itemnames			= sdriver_items;
ADDRGP4 soundOptionsInfo+2168+104
ADDRGP4 sdriver_items
ASGNP4
line 288
;288:	soundOptionsInfo.animsfx.generic.name			= "UI Animation sfx:";
ADDRGP4 soundOptionsInfo+2300+4
ADDRGP4 $383
ASGNP4
line 289
;289:	}
LABELV $347
line 291
;290:	
;291:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $384
line 292
;292:	soundOptionsInfo.banner.string				= "СИСТЕМНЫЕ НАСТРОЙКИ";
ADDRGP4 soundOptionsInfo+1076+88
ADDRGP4 $389
ASGNP4
line 293
;293:	soundOptionsInfo.graphics.string			= "ГРАФИКА";
ADDRGP4 soundOptionsInfo+1412+88
ADDRGP4 $392
ASGNP4
line 294
;294:	soundOptionsInfo.display.string				= "ЭКРАН";
ADDRGP4 soundOptionsInfo+1516+88
ADDRGP4 $395
ASGNP4
line 295
;295:	soundOptionsInfo.sound.string				= "ЗВУК";
ADDRGP4 soundOptionsInfo+1620+88
ADDRGP4 $398
ASGNP4
line 296
;296:	soundOptionsInfo.network.string				= "СЕТЬ";
ADDRGP4 soundOptionsInfo+1724+88
ADDRGP4 $401
ASGNP4
line 297
;297:	soundOptionsInfo.sfxvolume.generic.name		= "Громкость Эффектов:";
ADDRGP4 soundOptionsInfo+1828+4
ADDRGP4 $404
ASGNP4
line 298
;298:	soundOptionsInfo.musicvolume.generic.name		= "Громкость Музыки:";
ADDRGP4 soundOptionsInfo+1932+4
ADDRGP4 $407
ASGNP4
line 299
;299:	soundOptionsInfo.quality.generic.name		= "Качество Звука:";
ADDRGP4 soundOptionsInfo+2036+4
ADDRGP4 $410
ASGNP4
line 300
;300:	soundOptionsInfo.quality.itemnames			= quality_itemsru;
ADDRGP4 soundOptionsInfo+2036+104
ADDRGP4 quality_itemsru
ASGNP4
line 301
;301:	soundOptionsInfo.sdriver.generic.name		= "Драйвер звука:";
ADDRGP4 soundOptionsInfo+2168+4
ADDRGP4 $415
ASGNP4
line 302
;302:	soundOptionsInfo.sdriver.itemnames			= sdriver_items;
ADDRGP4 soundOptionsInfo+2168+104
ADDRGP4 sdriver_items
ASGNP4
line 303
;303:	soundOptionsInfo.animsfx.generic.name			= "UI Звуки Анимации:";
ADDRGP4 soundOptionsInfo+2300+4
ADDRGP4 $420
ASGNP4
line 304
;304:	}
LABELV $384
line 306
;305:
;306:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.banner );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 307
;307:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.framel );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 308
;308:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.framer );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 309
;309:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.graphics );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 310
;310:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.display );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1516
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 311
;311:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.sound );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1620
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 312
;312:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.network );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 313
;313:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.sfxvolume );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1828
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 314
;314:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.musicvolume );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 315
;315:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.quality );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+2036
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 316
;316:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.sdriver );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+2168
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 317
;317:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.animsfx );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+2300
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 318
;318:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.back );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+2396
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 320
;319:
;320:	soundOptionsInfo.sfxvolume.curvalue = trap_Cvar_VariableValue( "s_volume" ) * 10;
ADDRGP4 $102
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+1828+96
CNSTF4 1092616192
ADDRLP4 68
INDIRF4
MULF4
ASGNF4
line 321
;321:	soundOptionsInfo.musicvolume.curvalue = trap_Cvar_VariableValue( "s_musicvolume" ) * 10;
ADDRGP4 $106
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+1932+96
CNSTF4 1092616192
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
line 322
;322:	soundOptionsInfo.animsfx.curvalue = (int)trap_Cvar_VariableValue( "uie_s_animsfx" );
ADDRGP4 $141
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+2300+88
ADDRLP4 76
INDIRF4
CVFI4 4
ASGNI4
line 324
;323:	
;324:	if( trap_Cvar_VariableValue( "s_khz" ) == 11 ) {
ADDRGP4 $114
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 80
INDIRF4
CNSTF4 1093664768
NEF4 $440
line 325
;325:	soundOptionsInfo.quality.curvalue = 0;
ADDRGP4 soundOptionsInfo+2036+92
CNSTI4 0
ASGNI4
line 326
;326:	}
LABELV $440
line 327
;327:	if( trap_Cvar_VariableValue( "s_khz" ) == 22 ) {
ADDRGP4 $114
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 84
INDIRF4
CNSTF4 1102053376
NEF4 $444
line 328
;328:	soundOptionsInfo.quality.curvalue = 1;
ADDRGP4 soundOptionsInfo+2036+92
CNSTI4 1
ASGNI4
line 329
;329:	}
LABELV $444
line 330
;330:	if( trap_Cvar_VariableValue( "s_khz" ) == 44 ) {
ADDRGP4 $114
ARGP4
ADDRLP4 88
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 88
INDIRF4
CNSTF4 1110441984
NEF4 $448
line 331
;331:	soundOptionsInfo.quality.curvalue = 2;
ADDRGP4 soundOptionsInfo+2036+92
CNSTI4 2
ASGNI4
line 332
;332:	}
LABELV $448
line 333
;333:	if( trap_Cvar_VariableValue( "s_khz" ) == 48 ) {
ADDRGP4 $114
ARGP4
ADDRLP4 92
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 92
INDIRF4
CNSTF4 1111490560
NEF4 $452
line 334
;334:	soundOptionsInfo.quality.curvalue = 3;
ADDRGP4 soundOptionsInfo+2036+92
CNSTI4 3
ASGNI4
line 335
;335:	}
LABELV $452
line 337
;336:	
;337:	trap_Cvar_VariableStringBuffer( "s_driver", drivername, MAX_QPATH );
ADDRGP4 $133
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 339
;338:	
;339:	if( Q_stricmp (drivername, "dsound") == 0 ){
ADDRLP4 4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $456
line 340
;340:	soundOptionsInfo.sdriver.curvalue = 0;
ADDRGP4 soundOptionsInfo+2168+92
CNSTI4 0
ASGNI4
line 341
;341:	}
LABELV $456
line 342
;342:	if( Q_stricmp (drivername, "wasapi") == 0 ){
ADDRLP4 4
ARGP4
ADDRGP4 $139
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $460
line 343
;343:	soundOptionsInfo.sdriver.curvalue = 1;
ADDRGP4 soundOptionsInfo+2168+92
CNSTI4 1
ASGNI4
line 344
;344:	}
LABELV $460
line 345
;345:}
LABELV $147
endproc UI_SoundOptionsMenu_Init 104 12
export UI_SoundOptionsMenu_Cache
proc UI_SoundOptionsMenu_Cache 0 4
line 353
;346:
;347:
;348:/*
;349:===============
;350:UI_SoundOptionsMenu_Cache
;351:===============
;352:*/
;353:void UI_SoundOptionsMenu_Cache( void ) {
line 354
;354:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $165
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 355
;355:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $179
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 356
;356:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $328
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 357
;357:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $346
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 358
;358:}
LABELV $464
endproc UI_SoundOptionsMenu_Cache 0 4
export UI_SoundOptionsMenu
proc UI_SoundOptionsMenu 0 8
line 366
;359:
;360:
;361:/*
;362:===============
;363:UI_SoundOptionsMenu
;364:===============
;365:*/
;366:void UI_SoundOptionsMenu( void ) {
line 367
;367:	UI_SoundOptionsMenu_Init();
ADDRGP4 UI_SoundOptionsMenu_Init
CALLV
pop
line 368
;368:	UI_PushMenu( &soundOptionsInfo.menu );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 369
;369:	Menu_SetCursorToItem( &soundOptionsInfo.menu, &soundOptionsInfo.sound );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1620
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 370
;370:}
LABELV $465
endproc UI_SoundOptionsMenu 0 8
bss
align 4
LABELV soundOptionsInfo
skip 2512
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
LABELV $420
byte 1 85
byte 1 73
byte 1 32
byte 1 208
byte 1 151
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 144
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 134
byte 1 208
byte 1 184
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $415
byte 1 208
byte 1 148
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $410
byte 1 208
byte 1 154
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
byte 1 190
byte 1 32
byte 1 208
byte 1 151
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $407
byte 1 208
byte 1 147
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 188
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
byte 1 32
byte 1 208
byte 1 156
byte 1 209
byte 1 131
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $404
byte 1 208
byte 1 147
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 188
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
byte 1 32
byte 1 208
byte 1 173
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
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 58
byte 1 0
align 1
LABELV $401
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
LABELV $398
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
LABELV $395
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
LABELV $392
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
LABELV $389
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
LABELV $383
byte 1 85
byte 1 73
byte 1 32
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 102
byte 1 120
byte 1 58
byte 1 0
align 1
LABELV $378
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $373
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $370
byte 1 77
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 86
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $367
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 32
byte 1 86
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $364
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $361
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $358
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $355
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
LABELV $352
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
LABELV $346
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
LABELV $328
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
LABELV $179
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
byte 1 50
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $141
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 102
byte 1 120
byte 1 0
align 1
LABELV $139
byte 1 119
byte 1 97
byte 1 115
byte 1 97
byte 1 112
byte 1 105
byte 1 0
align 1
LABELV $134
byte 1 100
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $133
byte 1 115
byte 1 95
byte 1 100
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $127
byte 1 115
byte 1 110
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
LABELV $114
byte 1 115
byte 1 95
byte 1 107
byte 1 104
byte 1 122
byte 1 0
align 1
LABELV $106
byte 1 115
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 115
byte 1 95
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $89
byte 1 87
byte 1 65
byte 1 83
byte 1 65
byte 1 80
byte 1 73
byte 1 0
align 1
LABELV $88
byte 1 68
byte 1 105
byte 1 114
byte 1 101
byte 1 99
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $87
byte 1 208
byte 1 163
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $86
byte 1 208
byte 1 146
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
byte 1 181
byte 1 0
align 1
LABELV $85
byte 1 208
byte 1 161
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $84
byte 1 208
byte 1 157
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $83
byte 1 85
byte 1 108
byte 1 116
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $82
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $81
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $80
byte 1 76
byte 1 111
byte 1 119
byte 1 0
