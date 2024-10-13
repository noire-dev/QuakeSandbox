code
proc UI_CDKeyMenu_Event 8 4
file "../../../code/q3_ui/ui_cdkey.c"
line 46
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:CD KEY MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define ART_FRAME		"menu/art/cut_frame"
;16:#define ART_ACCEPT0		"menu/art/accept_0"
;17:#define ART_ACCEPT1		"menu/art/accept_1"	
;18:#define ART_BACK0		"menu/art/back_0"
;19:#define ART_BACK1		"menu/art/back_1"	
;20:
;21:#define ID_CDKEY		10
;22:#define ID_ACCEPT		11
;23:#define ID_BACK			12
;24:
;25:
;26:typedef struct {
;27:	menuframework_s	menu;
;28:
;29:	menutext_s		banner;
;30:	menubitmap_s	frame;
;31:
;32:	menufield_s		cdkey;
;33:
;34:	menubitmap_s	accept;
;35:	menubitmap_s	back;
;36:} cdkeyMenuInfo_t;
;37:
;38:static cdkeyMenuInfo_t	cdkeyMenuInfo;
;39:
;40:
;41:/*
;42:===============
;43:UI_CDKeyMenu_Event
;44:===============
;45:*/
;46:static void UI_CDKeyMenu_Event( void *ptr, int event ) {
line 47
;47:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 48
;48:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 51
;49:	}
;50:
;51:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
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
line 53
;52:	case ID_ACCEPT:
;53:		if( cdkeyMenuInfo.cdkey.field.buffer[0] ) {
ADDRGP4 cdkeyMenuInfo+1296+88+12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $88
line 54
;54:			trap_SetCDKey( cdkeyMenuInfo.cdkey.field.buffer );
ADDRGP4 cdkeyMenuInfo+1296+88+12
ARGP4
ADDRGP4 trap_SetCDKey
CALLV
pop
line 55
;55:		}
LABELV $88
line 56
;56:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 57
;57:		break;
ADDRGP4 $85
JUMPV
LABELV $96
line 60
;58:
;59:	case ID_BACK:
;60:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 61
;61:		break;
LABELV $84
LABELV $85
line 63
;62:	}
;63:}
LABELV $81
endproc UI_CDKeyMenu_Event 8 4
proc UI_CDKeyMenu_PreValidateKey 24 4
line 71
;64:
;65:
;66:/*
;67:=================
;68:UI_CDKeyMenu_PreValidateKey
;69:=================
;70:*/
;71:static int UI_CDKeyMenu_PreValidateKey( const char *key ) {
line 74
;72:	char	ch;
;73:
;74:	if( strlen( key ) != 16 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
EQI4 $101
line 75
;75:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $97
JUMPV
LABELV $100
line 78
;76:	}
;77:
;78:	while( ( ch = *key++ ) ) {
line 79
;79:		switch( ch ) {
ADDRLP4 8
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
CNSTI4 50
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $101
ADDRLP4 8
INDIRI4
CNSTI4 51
EQI4 $101
ADDRLP4 8
INDIRI4
CNSTI4 55
EQI4 $101
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $103
LABELV $107
ADDRLP4 8
INDIRI4
CNSTI4 97
LTI4 $103
ADDRLP4 8
INDIRI4
CNSTI4 119
GTI4 $103
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $108-388
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $108
address $101
address $101
address $101
address $101
address $103
address $103
address $101
address $101
address $103
address $101
address $103
address $101
address $103
address $103
address $103
address $101
address $103
address $101
address $101
address $101
address $103
address $103
address $101
code
line 96
;80:		case '2':
;81:		case '3':
;82:		case '7':
;83:		case 'a':
;84:		case 'b':
;85:		case 'c':
;86:		case 'd':
;87:		case 'g':
;88:		case 'h':
;89:		case 'j':
;90:		case 'l':
;91:		case 'p':
;92:		case 'r':
;93:		case 's':
;94:		case 't':
;95:		case 'w':
;96:			continue;
LABELV $103
line 98
;97:		default:
;98:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $97
JUMPV
LABELV $101
line 78
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 0
ADDRLP4 12
INDIRI1
ASGNI1
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $100
line 102
;99:		}
;100:	}
;101:
;102:	return 0;
CNSTI4 0
RETI4
LABELV $97
endproc UI_CDKeyMenu_PreValidateKey 24 4
proc UI_CDKeyMenu_DrawKey 44 20
line 111
;103:}
;104:
;105:
;106:/*
;107:=================
;108:UI_CDKeyMenu_DrawKey
;109:=================
;110:*/
;111:static void UI_CDKeyMenu_DrawKey( void *self ) {
line 120
;112:	menufield_s		*f;
;113:	qboolean		focus;
;114:	int				style;
;115:	char			c;
;116:	float			*color;
;117:	int				x, y;
;118:	int				val;
;119:
;120:	f = (menufield_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 122
;121:
;122:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
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
NEI4 $112
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $112
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $113
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 124
;123:
;124:	style = UI_LEFT;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 125
;125:	if( focus ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $114
line 126
;126:		color = color_yellow;
ADDRLP4 24
ADDRGP4 color_yellow
ASGNP4
line 127
;127:	}
ADDRGP4 $115
JUMPV
LABELV $114
line 128
;128:	else {
line 129
;129:		color = color_orange;
ADDRLP4 24
ADDRGP4 color_orange
ASGNP4
line 130
;130:	}
LABELV $115
line 132
;131:
;132:	x = 320 - 8 * BIGCHAR_WIDTH;
ADDRLP4 8
CNSTI4 320
ADDRGP4 cl_bigcharwidth+12
INDIRI4
CNSTI4 3
LSHI4
SUBI4
ASGNI4
line 133
;133:	y = 240 - BIGCHAR_HEIGHT / 2;
ADDRLP4 12
CNSTI4 240
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 134
;134:	UI_FillRect( x, y, 16 * BIGCHAR_WIDTH, BIGCHAR_HEIGHT, listbar_color );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
CNSTI4 4
LSHI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 135
;135:	UI_DrawString( x, y, f->field.buffer, style, color );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 138
;136:
;137:	// draw cursor if we have focus
;138:	if( focus ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $120
line 139
;139:		if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 40
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $122
line 140
;140:			c = 11;
ADDRLP4 28
CNSTI1 11
ASGNI1
line 141
;141:		} else {
ADDRGP4 $123
JUMPV
LABELV $122
line 142
;142:			c = 10;
ADDRLP4 28
CNSTI1 10
ASGNI1
line 143
;143:		}
LABELV $123
line 145
;144:
;145:		style &= ~UI_PULSE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 146
;146:		style |= UI_BLINK;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 148
;147:
;148:		UI_DrawChar( x + f->field.cursor * BIGCHAR_WIDTH, y, c, style, color_white );
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 28
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 149
;149:	}
LABELV $120
line 151
;150:
;151:	val = UI_CDKeyMenu_PreValidateKey( f->field.buffer );
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 UI_CDKeyMenu_PreValidateKey
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
ASGNI4
line 152
;152:	if( val == 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
NEI4 $125
line 153
;153:		UI_DrawString( 320, 376, "Please enter your CD Key", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 376
ARGI4
ADDRGP4 $127
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 154
;154:	}
ADDRGP4 $126
JUMPV
LABELV $125
line 155
;155:	else if ( val == 0 ) {
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $128
line 156
;156:		UI_DrawString( 320, 376, "The CD Key appears to be valid, thank you", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
CNSTI4 376
ARGI4
ADDRGP4 $130
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 157
;157:	}
ADDRGP4 $129
JUMPV
LABELV $128
line 158
;158:	else {
line 159
;159:		UI_DrawString( 320, 376, "The CD Key is not valid", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 376
ARGI4
ADDRGP4 $131
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 160
;160:	}
LABELV $129
LABELV $126
line 161
;161:}
LABELV $110
endproc UI_CDKeyMenu_DrawKey 44 20
proc UI_CDKeyMenu_Init 4 12
line 169
;162:
;163:
;164:/*
;165:===============
;166:UI_CDKeyMenu_Init
;167:===============
;168:*/
;169:static void UI_CDKeyMenu_Init( void ) {
line 170
;170:	trap_Cvar_Set( "ui_cdkeychecked", "1" );
ADDRGP4 $133
ARGP4
ADDRGP4 $134
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 172
;171:
;172:	UI_CDKeyMenu_Cache();
ADDRGP4 UI_CDKeyMenu_Cache
CALLV
pop
line 174
;173:
;174:	memset( &cdkeyMenuInfo, 0, sizeof(cdkeyMenuInfo) );
ADDRGP4 cdkeyMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1892
ARGI4
ADDRGP4 memset
CALLP4
pop
line 175
;175:	cdkeyMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 cdkeyMenuInfo+1044
CNSTI4 1
ASGNI4
line 176
;176:	cdkeyMenuInfo.menu.native 	  = qfalse;
ADDRGP4 cdkeyMenuInfo+1056
CNSTI4 0
ASGNI4
line 177
;177:	cdkeyMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 cdkeyMenuInfo+1052
CNSTI4 1
ASGNI4
line 179
;178:
;179:	cdkeyMenuInfo.banner.generic.type				= MTYPE_BTEXT;
ADDRGP4 cdkeyMenuInfo+1076
CNSTI4 10
ASGNI4
line 180
;180:	cdkeyMenuInfo.banner.generic.x					= 320;
ADDRGP4 cdkeyMenuInfo+1076+28
CNSTI4 320
ASGNI4
line 181
;181:	cdkeyMenuInfo.banner.generic.y					= 16;
ADDRGP4 cdkeyMenuInfo+1076+32
CNSTI4 16
ASGNI4
line 182
;182:	cdkeyMenuInfo.banner.string						= "CD KEY";
ADDRGP4 cdkeyMenuInfo+1076+88
ADDRGP4 $145
ASGNP4
line 183
;183:	cdkeyMenuInfo.banner.color						= color_white;
ADDRGP4 cdkeyMenuInfo+1076+100
ADDRGP4 color_white
ASGNP4
line 184
;184:	cdkeyMenuInfo.banner.style						= UI_CENTER;
ADDRGP4 cdkeyMenuInfo+1076+92
CNSTI4 1
ASGNI4
line 186
;185:
;186:	cdkeyMenuInfo.frame.generic.type				= MTYPE_BITMAP;
ADDRGP4 cdkeyMenuInfo+1180
CNSTI4 6
ASGNI4
line 187
;187:	cdkeyMenuInfo.frame.generic.name				= ART_FRAME;
ADDRGP4 cdkeyMenuInfo+1180+4
ADDRGP4 $153
ASGNP4
line 188
;188:	cdkeyMenuInfo.frame.generic.flags				= QMF_INACTIVE;
ADDRGP4 cdkeyMenuInfo+1180+72
CNSTU4 16384
ASGNU4
line 189
;189:	cdkeyMenuInfo.frame.generic.x					= 142;
ADDRGP4 cdkeyMenuInfo+1180+28
CNSTI4 142
ASGNI4
line 190
;190:	cdkeyMenuInfo.frame.generic.y					= 118;
ADDRGP4 cdkeyMenuInfo+1180+32
CNSTI4 118
ASGNI4
line 191
;191:	cdkeyMenuInfo.frame.width  						= 359;
ADDRGP4 cdkeyMenuInfo+1180+104
CNSTI4 359
ASGNI4
line 192
;192:	cdkeyMenuInfo.frame.height  					= 256;
ADDRGP4 cdkeyMenuInfo+1180+108
CNSTI4 256
ASGNI4
line 194
;193:
;194:	cdkeyMenuInfo.cdkey.generic.type				= MTYPE_FIELD;
ADDRGP4 cdkeyMenuInfo+1296
CNSTI4 4
ASGNI4
line 195
;195:	cdkeyMenuInfo.cdkey.generic.name				= "CD Key:";
ADDRGP4 cdkeyMenuInfo+1296+4
ADDRGP4 $167
ASGNP4
line 196
;196:	cdkeyMenuInfo.cdkey.generic.flags				= QMF_LOWERCASE;
ADDRGP4 cdkeyMenuInfo+1296+72
CNSTU4 262144
ASGNU4
line 197
;197:	cdkeyMenuInfo.cdkey.generic.x					= 320 - BIGCHAR_WIDTH * 2.5;
ADDRGP4 cdkeyMenuInfo+1296+28
CNSTF4 1134559232
CNSTF4 1075838976
ADDRGP4 cl_bigcharwidth+12
INDIRI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 198
;198:	cdkeyMenuInfo.cdkey.generic.y					= 240 - BIGCHAR_HEIGHT / 2;
ADDRGP4 cdkeyMenuInfo+1296+32
CNSTI4 240
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 199
;199:	cdkeyMenuInfo.cdkey.field.widthInChars			= 16;
ADDRGP4 cdkeyMenuInfo+1296+88+8
CNSTI4 16
ASGNI4
line 200
;200:	cdkeyMenuInfo.cdkey.field.maxchars				= 16;
ADDRGP4 cdkeyMenuInfo+1296+88+268
CNSTI4 16
ASGNI4
line 201
;201:	cdkeyMenuInfo.cdkey.generic.ownerdraw			= UI_CDKeyMenu_DrawKey;
ADDRGP4 cdkeyMenuInfo+1296+84
ADDRGP4 UI_CDKeyMenu_DrawKey
ASGNP4
line 203
;202:
;203:	cdkeyMenuInfo.accept.generic.type				= MTYPE_BITMAP;
ADDRGP4 cdkeyMenuInfo+1660
CNSTI4 6
ASGNI4
line 204
;204:	cdkeyMenuInfo.accept.generic.name				= ART_ACCEPT0;
ADDRGP4 cdkeyMenuInfo+1660+4
ADDRGP4 $187
ASGNP4
line 205
;205:	cdkeyMenuInfo.accept.generic.flags				= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cdkeyMenuInfo+1660+72
CNSTU4 272
ASGNU4
line 206
;206:	cdkeyMenuInfo.accept.generic.id					= ID_ACCEPT;
ADDRGP4 cdkeyMenuInfo+1660+24
CNSTI4 11
ASGNI4
line 207
;207:	cdkeyMenuInfo.accept.generic.callback			= UI_CDKeyMenu_Event;
ADDRGP4 cdkeyMenuInfo+1660+76
ADDRGP4 UI_CDKeyMenu_Event
ASGNP4
line 208
;208:	cdkeyMenuInfo.accept.generic.x					= 640;
ADDRGP4 cdkeyMenuInfo+1660+28
CNSTI4 640
ASGNI4
line 209
;209:	cdkeyMenuInfo.accept.generic.y					= 480-64;
ADDRGP4 cdkeyMenuInfo+1660+32
CNSTI4 416
ASGNI4
line 210
;210:	cdkeyMenuInfo.accept.width						= 128;
ADDRGP4 cdkeyMenuInfo+1660+104
CNSTI4 128
ASGNI4
line 211
;211:	cdkeyMenuInfo.accept.height						= 64;
ADDRGP4 cdkeyMenuInfo+1660+108
CNSTI4 64
ASGNI4
line 212
;212:	cdkeyMenuInfo.accept.focuspic					= ART_ACCEPT1;
ADDRGP4 cdkeyMenuInfo+1660+88
ADDRGP4 $204
ASGNP4
line 214
;213:
;214:	cdkeyMenuInfo.back.generic.type					= MTYPE_BITMAP;
ADDRGP4 cdkeyMenuInfo+1776
CNSTI4 6
ASGNI4
line 215
;215:	cdkeyMenuInfo.back.generic.name					= ART_BACK0;
ADDRGP4 cdkeyMenuInfo+1776+4
ADDRGP4 $208
ASGNP4
line 216
;216:	cdkeyMenuInfo.back.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cdkeyMenuInfo+1776+72
CNSTU4 260
ASGNU4
line 217
;217:	cdkeyMenuInfo.back.generic.id					= ID_BACK;
ADDRGP4 cdkeyMenuInfo+1776+24
CNSTI4 12
ASGNI4
line 218
;218:	cdkeyMenuInfo.back.generic.callback				= UI_CDKeyMenu_Event;
ADDRGP4 cdkeyMenuInfo+1776+76
ADDRGP4 UI_CDKeyMenu_Event
ASGNP4
line 219
;219:	cdkeyMenuInfo.back.generic.x					= 0;
ADDRGP4 cdkeyMenuInfo+1776+28
CNSTI4 0
ASGNI4
line 220
;220:	cdkeyMenuInfo.back.generic.y					= 480-64;
ADDRGP4 cdkeyMenuInfo+1776+32
CNSTI4 416
ASGNI4
line 221
;221:	cdkeyMenuInfo.back.width						= 128;
ADDRGP4 cdkeyMenuInfo+1776+104
CNSTI4 128
ASGNI4
line 222
;222:	cdkeyMenuInfo.back.height						= 64;
ADDRGP4 cdkeyMenuInfo+1776+108
CNSTI4 64
ASGNI4
line 223
;223:	cdkeyMenuInfo.back.focuspic						= ART_BACK1;
ADDRGP4 cdkeyMenuInfo+1776+88
ADDRGP4 $225
ASGNP4
line 225
;224:
;225:	Menu_AddItem( &cdkeyMenuInfo.menu, &cdkeyMenuInfo.banner );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 cdkeyMenuInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 226
;226:	Menu_AddItem( &cdkeyMenuInfo.menu, &cdkeyMenuInfo.frame );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 cdkeyMenuInfo+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 227
;227:	Menu_AddItem( &cdkeyMenuInfo.menu, &cdkeyMenuInfo.cdkey );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 cdkeyMenuInfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 228
;228:	Menu_AddItem( &cdkeyMenuInfo.menu, &cdkeyMenuInfo.accept );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 cdkeyMenuInfo+1660
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 229
;229:	if( uis.menusp ) {
ADDRGP4 uis+20
INDIRI4
CNSTI4 0
EQI4 $230
line 230
;230:		Menu_AddItem( &cdkeyMenuInfo.menu, &cdkeyMenuInfo.back );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 cdkeyMenuInfo+1776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 231
;231:	}
LABELV $230
line 233
;232:
;233:	trap_GetCDKey( cdkeyMenuInfo.cdkey.field.buffer, cdkeyMenuInfo.cdkey.field.maxchars + 1 );
ADDRGP4 cdkeyMenuInfo+1296+88+12
ARGP4
ADDRGP4 cdkeyMenuInfo+1296+88+268
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 trap_GetCDKey
CALLV
pop
line 234
;234:	if( trap_VerifyCDKey( cdkeyMenuInfo.cdkey.field.buffer, NULL ) == qfalse ) {
ADDRGP4 cdkeyMenuInfo+1296+88+12
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
ADDRGP4 trap_VerifyCDKey
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $240
line 235
;235:		cdkeyMenuInfo.cdkey.field.buffer[0] = 0;
ADDRGP4 cdkeyMenuInfo+1296+88+12
CNSTI1 0
ASGNI1
line 236
;236:	}
LABELV $240
line 237
;237:}
LABELV $132
endproc UI_CDKeyMenu_Init 4 12
export UI_CDKeyMenu_Cache
proc UI_CDKeyMenu_Cache 0 4
line 245
;238:
;239:
;240:/*
;241:=================
;242:UI_CDKeyMenu_Cache
;243:=================
;244:*/
;245:void UI_CDKeyMenu_Cache( void ) {
line 246
;246:	trap_R_RegisterShaderNoMip( ART_ACCEPT0 );
ADDRGP4 $187
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 247
;247:	trap_R_RegisterShaderNoMip( ART_ACCEPT1 );
ADDRGP4 $204
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 248
;248:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $208
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 249
;249:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $225
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 250
;250:	trap_R_RegisterShaderNoMip( ART_FRAME );
ADDRGP4 $153
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 251
;251:}
LABELV $248
endproc UI_CDKeyMenu_Cache 0 4
export UI_CDKeyMenu
proc UI_CDKeyMenu 0 4
line 259
;252:
;253:
;254:/*
;255:===============
;256:UI_CDKeyMenu
;257:===============
;258:*/
;259:void UI_CDKeyMenu( void ) {
line 260
;260:	UI_CDKeyMenu_Init();
ADDRGP4 UI_CDKeyMenu_Init
CALLV
pop
line 261
;261:	UI_PushMenu( &cdkeyMenuInfo.menu );
ADDRGP4 cdkeyMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 262
;262:}
LABELV $249
endproc UI_CDKeyMenu 0 4
export UI_CDKeyMenu_f
proc UI_CDKeyMenu_f 0 0
line 270
;263:
;264:
;265:/*
;266:===============
;267:UI_CDKeyMenu_f
;268:===============
;269:*/
;270:void UI_CDKeyMenu_f( void ) {
line 271
;271:	UI_CDKeyMenu();
ADDRGP4 UI_CDKeyMenu
CALLV
pop
line 272
;272:}
LABELV $250
endproc UI_CDKeyMenu_f 0 0
bss
align 4
LABELV cdkeyMenuInfo
skip 1892
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
LABELV $225
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
LABELV $208
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
LABELV $204
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
LABELV $187
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
LABELV $167
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $153
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 117
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $145
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 0
align 1
LABELV $134
byte 1 49
byte 1 0
align 1
LABELV $133
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $131
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $130
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 114
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 44
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 0
align 1
LABELV $127
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 0
