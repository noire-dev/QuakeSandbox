data
align 4
LABELV driverinfo_artlist
address $80
address $81
address $82
address $83
byte 4 0
code
proc DriverInfo_Event 4 0
file "../../../code/q3_ui/ui_video.c"
line 72
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Quake III Arena source code.
;6:
;7:Quake III Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Quake III Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Quake III Arena source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22://
;23:#include "ui_local.h"
;24:
;25:void GraphicsOptions_MenuInit( void );
;26:
;27:/*
;28:=======================================================================
;29:
;30:DRIVER INFORMATION MENU
;31:
;32:=======================================================================
;33:*/
;34:
;35:
;36:#define DRIVERINFO_FRAMEL	"menu/art/frame2_l"
;37:#define DRIVERINFO_FRAMER	"menu/art/frame1_r"
;38:#define DRIVERINFO_BACK0	"menu/art/back_0"
;39:#define DRIVERINFO_BACK1	"menu/art/back_1"
;40:
;41:static char* driverinfo_artlist[] = 
;42:{
;43:	DRIVERINFO_FRAMEL,
;44:	DRIVERINFO_FRAMER,
;45:	DRIVERINFO_BACK0,
;46:	DRIVERINFO_BACK1,
;47:	NULL,
;48:};
;49:
;50:#define ID_DRIVERINFOBACK	100
;51:
;52:typedef struct
;53:{
;54:	menuframework_s	menu;
;55:	menutext_s		banner;
;56:	menubitmap_s	back;
;57:	menubitmap_s	framel;
;58:	menubitmap_s	framer;
;59:	char			stringbuff[1024];
;60:	char*			strings[64];
;61:	int				numstrings;
;62:} driverinfo_t;
;63:
;64:static driverinfo_t	s_driverinfo;
;65:
;66:/*
;67:=================
;68:DriverInfo_Event
;69:=================
;70:*/
;71:static void DriverInfo_Event( void* ptr, int event )
;72:{
line 73
;73:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $86
line 74
;74:		return;
ADDRGP4 $85
JUMPV
LABELV $86
line 76
;75:
;76:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 100
EQI4 $91
ADDRGP4 $88
JUMPV
line 77
;77:	{
LABELV $91
line 79
;78:		case ID_DRIVERINFOBACK:
;79:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 80
;80:			break;
LABELV $88
LABELV $89
line 82
;81:	}
;82:}
LABELV $85
endproc DriverInfo_Event 4 0
proc DriverInfo_MenuDraw 12 20
line 90
;83:
;84:/*
;85:=================
;86:DriverInfo_MenuDraw
;87:=================
;88:*/
;89:static void DriverInfo_MenuDraw( void )
;90:{
line 94
;91:	int	i;
;92:	int	y;
;93:
;94:	Menu_Draw( &s_driverinfo.menu );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 96
;95:
;96:	UI_DrawString( 320, 80, "VENDOR", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 80
ARGI4
ADDRGP4 $93
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 97
;97:	UI_DrawString( 320, 152, "PIXELFORMAT", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 152
ARGI4
ADDRGP4 $94
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 98
;98:	UI_DrawString( 320, 192, "EXTENSIONS", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
ADDRGP4 $95
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 100
;99:
;100:	UI_DrawString( 320, 80+16, uis.glconfig.vendor_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 96
ARGI4
ADDRGP4 uis+60+1024
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 101
;101:	UI_DrawString( 320, 96+16, uis.glconfig.version_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 112
ARGI4
ADDRGP4 uis+60+2048
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 102
;102:	UI_DrawString( 320, 112+16, uis.glconfig.renderer_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 uis+60
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 103
;103:	UI_DrawString( 320, 152+16, va ("color(%d-bits) Z(%d-bits) stencil(%d-bits)", uis.glconfig.colorBits, uis.glconfig.depthBits, uis.glconfig.stencilBits), UI_CENTER|UI_SMALLFONT, text_color_normal );
ADDRGP4 $101
ARGP4
ADDRGP4 uis+60+11272
INDIRI4
ARGI4
ADDRGP4 uis+60+11276
INDIRI4
ARGI4
ADDRGP4 uis+60+11280
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 168
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 106
;104:
;105:	// double column
;106:	y = 192+16;
ADDRLP4 4
CNSTI4 208
ASGNI4
line 107
;107:	for (i=0; i<s_driverinfo.numstrings/2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $108
line 108
;108:		UI_DrawString( 320-4, y, s_driverinfo.strings[i*2], UI_RIGHT|UI_SMALLFONT, text_color_normal );
CNSTI4 316
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+2552
ADDP4
INDIRP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 109
;109:		UI_DrawString( 320+4, y, s_driverinfo.strings[i*2+1], UI_LEFT|UI_SMALLFONT, text_color_normal );
CNSTI4 324
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+2552+4
ADDP4
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 110
;110:		y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 111
;111:	}
LABELV $109
line 107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $111
ADDRLP4 0
INDIRI4
ADDRGP4 s_driverinfo+2808
INDIRI4
CNSTI4 2
DIVI4
LTI4 $108
line 113
;112:
;113:	if (s_driverinfo.numstrings & 1)
ADDRGP4 s_driverinfo+2808
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $117
line 114
;114:		UI_DrawString( 320, y, s_driverinfo.strings[s_driverinfo.numstrings-1], UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_driverinfo+2808
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+2552-4
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $117
line 115
;115:}
LABELV $92
endproc DriverInfo_MenuDraw 12 20
export DriverInfo_Cache
proc DriverInfo_Cache 4 4
line 123
;116:
;117:/*
;118:=================
;119:DriverInfo_Cache
;120:=================
;121:*/
;122:void DriverInfo_Cache( void )
;123:{
line 127
;124:	int	i;
;125:
;126:	// touch all our pics
;127:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $124
line 128
;128:	{
line 129
;129:		if (!driverinfo_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 driverinfo_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $128
line 130
;130:			break;
ADDRGP4 $126
JUMPV
LABELV $128
line 131
;131:		trap_R_RegisterShaderNoMip(driverinfo_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 driverinfo_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 132
;132:	}
LABELV $125
line 127
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $124
JUMPV
LABELV $126
line 133
;133:}
LABELV $123
endproc DriverInfo_Cache 4 4
proc UI_DriverInfo_Menu 32 12
line 141
;134:
;135:/*
;136:=================
;137:UI_DriverInfo_Menu
;138:=================
;139:*/
;140:static void UI_DriverInfo_Menu( void )
;141:{
line 147
;142:	char*	eptr;
;143:	int		i;
;144:	int		len;
;145:
;146:	// zero set all our globals
;147:	memset( &s_driverinfo, 0 ,sizeof(driverinfo_t) );
ADDRGP4 s_driverinfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2812
ARGI4
ADDRGP4 memset
CALLP4
pop
line 149
;148:
;149:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 151
;150:
;151:	s_driverinfo.menu.fullscreen = qtrue;
ADDRGP4 s_driverinfo+1052
CNSTI4 1
ASGNI4
line 152
;152:	s_driverinfo.menu.draw       = DriverInfo_MenuDraw;
ADDRGP4 s_driverinfo+1036
ADDRGP4 DriverInfo_MenuDraw
ASGNP4
line 154
;153:
;154:	s_driverinfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_driverinfo+1076
CNSTI4 10
ASGNI4
line 155
;155:	s_driverinfo.banner.generic.x	  = 320;
ADDRGP4 s_driverinfo+1076+28
CNSTI4 320
ASGNI4
line 156
;156:	s_driverinfo.banner.generic.y	  = 16;
ADDRGP4 s_driverinfo+1076+32
CNSTI4 16
ASGNI4
line 157
;157:	s_driverinfo.banner.color	      = color_white;
ADDRGP4 s_driverinfo+1076+100
ADDRGP4 color_white
ASGNP4
line 158
;158:	s_driverinfo.banner.style	      = UI_CENTER;
ADDRGP4 s_driverinfo+1076+92
CNSTI4 1
ASGNI4
line 160
;159:
;160:	s_driverinfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+1296
CNSTI4 6
ASGNI4
line 161
;161:	s_driverinfo.framel.generic.name  = DRIVERINFO_FRAMEL;
ADDRGP4 s_driverinfo+1296+4
ADDRGP4 $80
ASGNP4
line 162
;162:	s_driverinfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_driverinfo+1296+72
CNSTU4 16384
ASGNU4
line 163
;163:	s_driverinfo.framel.generic.x	  = 0;
ADDRGP4 s_driverinfo+1296+28
CNSTI4 0
ASGNI4
line 164
;164:	s_driverinfo.framel.generic.y	  = 78;
ADDRGP4 s_driverinfo+1296+32
CNSTI4 78
ASGNI4
line 165
;165:	s_driverinfo.framel.width  	      = 256;
ADDRGP4 s_driverinfo+1296+104
CNSTI4 256
ASGNI4
line 166
;166:	s_driverinfo.framel.height  	  = 329;
ADDRGP4 s_driverinfo+1296+108
CNSTI4 329
ASGNI4
line 168
;167:
;168:	s_driverinfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+1412
CNSTI4 6
ASGNI4
line 169
;169:	s_driverinfo.framer.generic.name  = DRIVERINFO_FRAMER;
ADDRGP4 s_driverinfo+1412+4
ADDRGP4 $81
ASGNP4
line 170
;170:	s_driverinfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_driverinfo+1412+72
CNSTU4 16384
ASGNU4
line 171
;171:	s_driverinfo.framer.generic.x	  = 376;
ADDRGP4 s_driverinfo+1412+28
CNSTI4 376
ASGNI4
line 172
;172:	s_driverinfo.framer.generic.y	  = 76;
ADDRGP4 s_driverinfo+1412+32
CNSTI4 76
ASGNI4
line 173
;173:	s_driverinfo.framer.width  	      = 256;
ADDRGP4 s_driverinfo+1412+104
CNSTI4 256
ASGNI4
line 174
;174:	s_driverinfo.framer.height  	  = 334;
ADDRGP4 s_driverinfo+1412+108
CNSTI4 334
ASGNI4
line 176
;175:
;176:	s_driverinfo.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+1180
CNSTI4 6
ASGNI4
line 177
;177:	s_driverinfo.back.generic.name     = DRIVERINFO_BACK0;
ADDRGP4 s_driverinfo+1180+4
ADDRGP4 $82
ASGNP4
line 178
;178:	s_driverinfo.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_driverinfo+1180+72
CNSTU4 260
ASGNU4
line 179
;179:	s_driverinfo.back.generic.callback = DriverInfo_Event;
ADDRGP4 s_driverinfo+1180+76
ADDRGP4 DriverInfo_Event
ASGNP4
line 180
;180:	s_driverinfo.back.generic.id	   = ID_DRIVERINFOBACK;
ADDRGP4 s_driverinfo+1180+24
CNSTI4 100
ASGNI4
line 181
;181:	s_driverinfo.back.generic.x		   = 0 - uis.wideoffset;
ADDRGP4 s_driverinfo+1180+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 182
;182:	s_driverinfo.back.generic.y		   = 480-64;
ADDRGP4 s_driverinfo+1180+32
CNSTI4 416
ASGNI4
line 183
;183:	s_driverinfo.back.width  		   = 128;
ADDRGP4 s_driverinfo+1180+104
CNSTI4 128
ASGNI4
line 184
;184:	s_driverinfo.back.height  		   = 64;
ADDRGP4 s_driverinfo+1180+108
CNSTI4 64
ASGNI4
line 185
;185:	s_driverinfo.back.focuspic         = DRIVERINFO_BACK1;
ADDRGP4 s_driverinfo+1180+88
ADDRGP4 $83
ASGNP4
line 191
;186:
;187:  // TTimo: overflow with particularly long GL extensions (such as the gf3)
;188:  // https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=399
;189:  // NOTE: could have pushed the size of stringbuff, but the list is already out of the screen
;190:  // (no matter what your resolution)
;191:  Q_strncpyz(s_driverinfo.stringbuff, uis.glconfig.extensions_string, 1024);
ADDRGP4 s_driverinfo+1528
ARGP4
ADDRGP4 uis+60+3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 194
;192:
;193:	// build null terminated extension strings
;194:	eptr = s_driverinfo.stringbuff;
ADDRLP4 0
ADDRGP4 s_driverinfo+1528
ASGNP4
ADDRGP4 $193
JUMPV
line 196
;195:	while ( s_driverinfo.numstrings<40 && *eptr )
;196:	{
LABELV $196
line 198
;197:		while ( *eptr == ' ' )
;198:			*eptr++ = '\0';
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $197
line 197
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $196
line 201
;199:
;200:		// track start of valid string
;201:		if (*eptr && *eptr != ' ')
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $204
ADDRLP4 16
INDIRI4
CNSTI4 32
EQI4 $204
line 202
;202:			s_driverinfo.strings[s_driverinfo.numstrings++] = eptr;
ADDRLP4 24
ADDRGP4 s_driverinfo+2808
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+2552
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $204
JUMPV
LABELV $203
line 205
;203:
;204:		while ( *eptr && *eptr != ' ' )
;205:			eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $204
line 204
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $206
ADDRLP4 28
INDIRI4
CNSTI4 32
NEI4 $203
LABELV $206
line 206
;206:	}
LABELV $193
line 195
ADDRGP4 s_driverinfo+2808
INDIRI4
CNSTI4 40
GEI4 $207
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $197
LABELV $207
line 209
;207:
;208:	// safety length strings for display
;209:	for (i=0; i<s_driverinfo.numstrings; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $211
JUMPV
LABELV $208
line 210
;210:		len = strlen(s_driverinfo.strings[i]);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+2552
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 211
;211:		if (len > 32) {
ADDRLP4 8
INDIRI4
CNSTI4 32
LEI4 $214
line 212
;212:			s_driverinfo.strings[i][len-1] = '>';
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+2552
ADDP4
INDIRP4
ADDP4
CNSTI1 62
ASGNI1
line 213
;213:			s_driverinfo.strings[i][len]   = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+2552
ADDP4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 214
;214:		}
LABELV $214
line 215
;215:	}
LABELV $209
line 209
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $211
ADDRLP4 4
INDIRI4
ADDRGP4 s_driverinfo+2808
INDIRI4
LTI4 $208
line 217
;216:
;217:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.banner );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 218
;218:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.framel );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 219
;219:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.framer );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 220
;220:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.back );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 222
;221:
;222:	UI_PushMenu( &s_driverinfo.menu );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 223
;223:}
LABELV $130
endproc UI_DriverInfo_Menu 32 12
data
align 4
LABELV s_ivo_templates
byte 4 6
byte 4 1
byte 4 3
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 2
byte 4 2
byte 4 1
byte 4 0
byte 4 0
byte 4 1
skip 4
byte 4 4
byte 4 1
byte 4 2
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 2
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 1
skip 4
byte 4 3
byte 4 1
byte 4 2
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
skip 4
byte 4 2
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
skip 4
byte 4 2
byte 4 1
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
skip 4
byte 4 3
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
skip 4
align 4
LABELV builtinResolutions
address $224
address $225
address $226
address $227
address $228
address $229
address $230
address $231
address $232
address $233
address $234
address $235
address $236
address $237
address $238
address $239
address $240
address $241
address $242
address $243
address $244
address $245
address $246
address $247
address $248
byte 4 0
align 4
LABELV knownRatios
address $249
address $250
address $251
address $252
address $253
address $254
address $255
address $256
address $257
address $258
address $259
address $260
address $261
address $262
byte 4 0
byte 4 0
align 4
LABELV resolutions
address builtinResolutions
code
proc GraphicsOptions_GetAspectRatios 48 16
line 391
;224:
;225:/*
;226:=======================================================================
;227:
;228:GRAPHICS OPTIONS MENU
;229:
;230:=======================================================================
;231:*/
;232:
;233:#define GRAPHICSOPTIONS_FRAMEL	"menu/art/frame2_l"
;234:#define GRAPHICSOPTIONS_FRAMER	"menu/art/frame1_r"
;235:#define GRAPHICSOPTIONS_BACK0	"menu/art/back_0"
;236:#define GRAPHICSOPTIONS_BACK1	"menu/art/back_1"
;237:#define GRAPHICSOPTIONS_ACCEPT0	"menu/art/accept_0"
;238:#define GRAPHICSOPTIONS_ACCEPT1	"menu/art/accept_1"
;239:
;240:#define ID_BACK2		101
;241:#define ID_FULLSCREEN	102
;242:#define ID_LIST			103
;243:#define ID_MODE			104
;244:#define ID_DRIVERINFO	105
;245:#define ID_GRAPHICS		106
;246:#define ID_DISPLAY		107
;247:#define ID_SOUND		108
;248:#define ID_NETWORK		109
;249:#define ID_RATIO                110
;250:
;251:typedef struct {
;252:	menuframework_s	menu;
;253:
;254:	menutext_s		banner;
;255:	menubitmap_s	framel;
;256:	menubitmap_s	framer;
;257:
;258:	menutext_s		graphics;
;259:	menutext_s		display;
;260:	menutext_s		sound;
;261:	menutext_s		network;
;262:
;263:	menulist_s		list;
;264:        menulist_s              ratio;
;265:	menulist_s		mode;
;266:	menulist_s		driver;
;267:	menuslider_s	tq;
;268:	menulist_s  	fs;
;269:	menulist_s  	lighting;
;270:        menulist_s  	flares;
;271:        menulist_s  	bloom;
;272:	menulist_s  	allow_extensions;
;273:	menulist_s  	texturebits;
;274:	menulist_s  	geometry;
;275:	menulist_s  	filter;
;276:        menulist_s  	aniso;
;277:        menulist_s  	aniso2;
;278:	menulist_s  	drawfps;
;279:	menutext_s		driverinfo;
;280:
;281:	menubitmap_s	apply;
;282:	menubitmap_s	back;
;283:} graphicsoptions_t;
;284:
;285:typedef struct
;286:{
;287:	int mode;
;288:	qboolean fullscreen;
;289:	int tq;
;290:	int lighting;
;291:	qboolean flares;
;292:	qboolean bloom;
;293:	qboolean drawfps;
;294:	int texturebits;
;295:	int geometry;
;296:	int filter;
;297:        int aniso;
;298:        int aniso2;
;299:	int driver;
;300:	qboolean extensions;
;301:} InitialVideoOptions_s;
;302:
;303:static InitialVideoOptions_s	s_ivo;
;304:static graphicsoptions_t		s_graphicsoptions;	
;305:
;306:static InitialVideoOptions_s s_ivo_templates[] =
;307:{
;308:	{
;309:		6, qtrue, 3, 0, qfalse,qfalse,qfalse, 2, 2, 1, 0, 0, qtrue
;310:	},
;311:	{
;312:		4, qtrue, 2, 0, qfalse,qfalse,qfalse, 2, 1, 1, 0, 0, qtrue	// JDC: this was tq 3
;313:	},
;314:	{
;315:		3, qtrue, 2, 0, qfalse,qfalse,qfalse, 0, 1, 0, 0, 0, qtrue
;316:	},
;317:	{
;318:		2, qtrue, 1, 0, qfalse,qfalse,qfalse, 0, 0, 0, 0, 0, qtrue
;319:	},
;320:	{
;321:		2, qtrue, 1, 1, qfalse,qfalse,qfalse, 0, 0, 0, 0, 0, qtrue
;322:	},
;323:	{
;324:		3, qtrue, 1, 0, qfalse,qfalse,qfalse, 0, 1, 0, 0, 0, qtrue
;325:	}
;326:};
;327:
;328:#define NUM_IVO_TEMPLATES ( sizeof( s_ivo_templates ) / sizeof( s_ivo_templates[0] ) )
;329:
;330:static const char *builtinResolutions[ ] =
;331:{
;332:"320x240",
;333:"400x300",
;334:"512x384",
;335:"640x480",
;336:"800x600",
;337:"960x720",
;338:"1024x768",
;339:"1152x864",
;340:"1280x1024",
;341:"1600x1200",
;342:"2048x1536",
;343:"856x480",
;344:"1280x960",
;345:"1280x720",
;346:"1280x800",
;347:"1366x768",
;348:"1440x900",
;349:"1600x900",
;350:"1680x1050",
;351:"1920x1080",
;352:"1920x1200",
;353:"2560x1080",
;354:"3440x1440",
;355:"3840x2160",
;356:"4096x2160",
;357: NULL
;358:};
;359:
;360:static const char *knownRatios[ ][2] =
;361:{
;362:        { "1.25:1", "5:4"   },
;363:        { "1.33:1", "4:3"   },
;364:        { "1.50:1", "3:2"   },
;365:        { "1.56:1", "14:9"  },
;366:        { "1.60:1", "16:10" },
;367:        { "1.67:1", "5:3"   },
;368:        { "1.78:1", "16:9"  },
;369:        { NULL    , NULL    }
;370:};
;371:
;372:#define MAX_RESOLUTIONS 32
;373:
;374:static const char* ratios[ MAX_RESOLUTIONS ];
;375:static char ratioBuf[ MAX_RESOLUTIONS ][ 8 ];
;376:static int ratioToRes[ MAX_RESOLUTIONS ];
;377:static int resToRatio[ MAX_RESOLUTIONS ];
;378:
;379:static char resbuf[ MAX_STRING_CHARS ];
;380:static const char* detectedResolutions[ MAX_RESOLUTIONS ];
;381:static char currentResolution[ 20 ];
;382:
;383:static const char** resolutions = builtinResolutions;
;384:
;385:/*
;386:=================
;387:GraphicsOptions_GetAspectRatios
;388:=================
;389:*/
;390:static void GraphicsOptions_GetAspectRatios( void )
;391:{
line 395
;392:    int i, r;
;393:
;394:    // build ratio list from resolutions
;395:    for( r = 0; resolutions[r]; r++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $267
JUMPV
LABELV $264
line 396
;396:    {
line 402
;397:        int w, h;
;398:        char *x;
;399:        char str[ sizeof(ratioBuf[0]) ];
;400:
;401:        // calculate resolution's aspect ratio
;402:        x = strchr( resolutions[r], 'x' )+1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resolutions
INDIRP4
ADDP4
INDIRP4
ARGP4
CNSTI4 120
ARGI4
ADDRLP4 28
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 405
;403:        
;404:        
;405:        Q_strncpyz( str, resolutions[r], x-resolutions[r] );
ADDRLP4 8
ARGP4
ADDRLP4 32
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resolutions
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 406
;406:        w = atoi( str );
ADDRLP4 8
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 36
INDIRI4
ASGNI4
line 407
;407:        h = atoi( x );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
ASGNI4
line 408
;408:        Com_sprintf( str, sizeof(str), "%.2f:1", (float)w / (float)h );
ADDRLP4 8
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 $268
ARGP4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRI4
CVIF4 4
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 411
;409:        
;410:        // rename common ratios ("1.33:1" -> "4:3")
;411:        for( i = 0; knownRatios[i][0]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $272
JUMPV
LABELV $269
line 412
;412:            if( Q_strequal( str, knownRatios[i][0] ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 knownRatios
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $273
line 413
;413:                Q_strncpyz( str, knownRatios[i][1], sizeof( str ) );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 knownRatios+4
ADDP4
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 414
;414:                break;
ADDRGP4 $271
JUMPV
LABELV $273
line 416
;415:            }
;416:        }
LABELV $270
line 411
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $272
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 knownRatios
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $269
LABELV $271
line 420
;417:
;418:        // add ratio to list if it is new
;419:        // establish res/ratio relationship
;420:        for( i = 0; ratioBuf[i][0]; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $279
JUMPV
LABELV $276
line 421
;421:        {
line 422
;422:            if( Q_strequal( str, ratioBuf[i] ) )
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ratioBuf
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $280
line 423
;423:                break;
ADDRGP4 $278
JUMPV
LABELV $280
line 424
;424:        }
LABELV $277
line 420
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $279
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ratioBuf
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $276
LABELV $278
line 425
;425:        if( !ratioBuf[i][0] )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ratioBuf
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $282
line 426
;426:        {
line 427
;427:            Q_strncpyz( ratioBuf[i], str, sizeof(ratioBuf[i]) );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ratioBuf
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 428
;428:            ratioToRes[i] = r;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ratioToRes
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 429
;429:        }
LABELV $282
line 430
;430:        ratios[r] = ratioBuf[r];
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ratios
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ratioBuf
ADDP4
ASGNP4
line 431
;431:        resToRatio[r] = i;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resToRatio
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 432
;432:    }
LABELV $265
line 395
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $267
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resolutions
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $264
line 433
;433:    ratios[r] = NULL;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ratios
ADDP4
CNSTP4 0
ASGNP4
line 434
;434:}
LABELV $263
endproc GraphicsOptions_GetAspectRatios 48 16
proc GraphicsOptions_GetInitialVideo 0 0
line 442
;435:
;436:/*
;437:=================
;438:GraphicsOptions_GetInitialVideo
;439:=================
;440:*/
;441:static void GraphicsOptions_GetInitialVideo( void )
;442:{
line 443
;443:	s_ivo.driver      = s_graphicsoptions.driver.curvalue;
ADDRGP4 s_ivo+48
ADDRGP4 s_graphicsoptions+2224+92
INDIRI4
ASGNI4
line 444
;444:	s_ivo.mode        = s_graphicsoptions.mode.curvalue;
ADDRGP4 s_ivo
ADDRGP4 s_graphicsoptions+2092+92
INDIRI4
ASGNI4
line 445
;445:	s_ivo.fullscreen  = s_graphicsoptions.fs.curvalue;
ADDRGP4 s_ivo+4
ADDRGP4 s_graphicsoptions+2460+92
INDIRI4
ASGNI4
line 446
;446:	s_ivo.extensions  = s_graphicsoptions.allow_extensions.curvalue;
ADDRGP4 s_ivo+52
ADDRGP4 s_graphicsoptions+2988+92
INDIRI4
ASGNI4
line 447
;447:	s_ivo.tq          = s_graphicsoptions.tq.curvalue;
ADDRGP4 s_ivo+8
ADDRGP4 s_graphicsoptions+2356+96
INDIRF4
CVFI4 4
ASGNI4
line 448
;448:	s_ivo.lighting    = s_graphicsoptions.lighting.curvalue;
ADDRGP4 s_ivo+12
ADDRGP4 s_graphicsoptions+2592+92
INDIRI4
ASGNI4
line 449
;449:	s_ivo.flares      = s_graphicsoptions.flares.curvalue;
ADDRGP4 s_ivo+16
ADDRGP4 s_graphicsoptions+2724+92
INDIRI4
ASGNI4
line 450
;450:	s_ivo.bloom      = s_graphicsoptions.bloom.curvalue;
ADDRGP4 s_ivo+20
ADDRGP4 s_graphicsoptions+2856+92
INDIRI4
ASGNI4
line 451
;451:	s_ivo.drawfps     = s_graphicsoptions.drawfps.curvalue;
ADDRGP4 s_ivo+24
ADDRGP4 s_graphicsoptions+3780+92
INDIRI4
ASGNI4
line 452
;452:	s_ivo.geometry    = s_graphicsoptions.geometry.curvalue;
ADDRGP4 s_ivo+32
ADDRGP4 s_graphicsoptions+3252+92
INDIRI4
ASGNI4
line 453
;453:	s_ivo.filter      = s_graphicsoptions.filter.curvalue;
ADDRGP4 s_ivo+36
ADDRGP4 s_graphicsoptions+3384+92
INDIRI4
ASGNI4
line 454
;454:        s_ivo.aniso      = s_graphicsoptions.aniso.curvalue;
ADDRGP4 s_ivo+40
ADDRGP4 s_graphicsoptions+3516+92
INDIRI4
ASGNI4
line 455
;455:        s_ivo.aniso2      = s_graphicsoptions.aniso2.curvalue;
ADDRGP4 s_ivo+44
ADDRGP4 s_graphicsoptions+3648+92
INDIRI4
ASGNI4
line 456
;456:	s_ivo.texturebits = s_graphicsoptions.texturebits.curvalue;
ADDRGP4 s_ivo+28
ADDRGP4 s_graphicsoptions+3120+92
INDIRI4
ASGNI4
line 457
;457:}
LABELV $284
endproc GraphicsOptions_GetInitialVideo 0 0
proc GraphicsOptions_CheckConfig 4 0
line 465
;458:
;459:/*
;460:=================
;461:GraphicsOptions_CheckConfig
;462:=================
;463:*/
;464:static void GraphicsOptions_CheckConfig( void )
;465:{
line 468
;466:	int i;
;467:
;468:	for ( i = 0; i < NUM_IVO_TEMPLATES-1; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $330
JUMPV
LABELV $327
line 469
;469:	{
line 470
;470:		if ( s_ivo_templates[i].driver != s_graphicsoptions.driver.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+48
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+2224+92
INDIRI4
EQI4 $331
line 471
;471:			continue;
ADDRGP4 $328
JUMPV
LABELV $331
line 472
;472:		if ( s_ivo_templates[i].mode != s_graphicsoptions.mode.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+2092+92
INDIRI4
EQI4 $336
line 473
;473:			continue;
ADDRGP4 $328
JUMPV
LABELV $336
line 474
;474:		if ( s_ivo_templates[i].fullscreen != s_graphicsoptions.fs.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+4
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+2460+92
INDIRI4
EQI4 $340
line 475
;475:			continue;
ADDRGP4 $328
JUMPV
LABELV $340
line 476
;476:		if ( s_ivo_templates[i].tq != s_graphicsoptions.tq.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 s_graphicsoptions+2356+96
INDIRF4
EQF4 $345
line 477
;477:			continue;
ADDRGP4 $328
JUMPV
LABELV $345
line 478
;478:		if ( s_ivo_templates[i].lighting != s_graphicsoptions.lighting.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+12
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+2592+92
INDIRI4
EQI4 $350
line 479
;479:			continue;
ADDRGP4 $328
JUMPV
LABELV $350
line 480
;480:                if ( s_ivo_templates[i].flares != s_graphicsoptions.flares.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+16
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+2724+92
INDIRI4
EQI4 $355
line 481
;481:			continue;
ADDRGP4 $328
JUMPV
LABELV $355
line 482
;482:                if ( s_ivo_templates[i].bloom != s_graphicsoptions.bloom.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+20
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+2856+92
INDIRI4
EQI4 $360
line 483
;483:			continue;
ADDRGP4 $328
JUMPV
LABELV $360
line 484
;484:		if ( s_ivo_templates[i].drawfps != s_graphicsoptions.drawfps.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+24
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+3780+92
INDIRI4
EQI4 $365
line 485
;485:			continue;
ADDRGP4 $328
JUMPV
LABELV $365
line 486
;486:		if ( s_ivo_templates[i].geometry != s_graphicsoptions.geometry.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+32
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+3252+92
INDIRI4
EQI4 $370
line 487
;487:			continue;
ADDRGP4 $328
JUMPV
LABELV $370
line 488
;488:		if ( s_ivo_templates[i].filter != s_graphicsoptions.filter.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+36
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+3384+92
INDIRI4
EQI4 $375
line 489
;489:			continue;
ADDRGP4 $328
JUMPV
LABELV $375
line 490
;490:                if ( s_ivo_templates[i].aniso != s_graphicsoptions.aniso.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+40
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+3516+92
INDIRI4
EQI4 $380
line 491
;491:			continue;
ADDRGP4 $328
JUMPV
LABELV $380
line 492
;492:                if ( s_ivo_templates[i].aniso2 != s_graphicsoptions.aniso2.curvalue )
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+44
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+3648+92
INDIRI4
EQI4 $385
line 493
;493:			continue;
ADDRGP4 $328
JUMPV
LABELV $385
line 496
;494://		if ( s_ivo_templates[i].texturebits != s_graphicsoptions.texturebits.curvalue )
;495://			continue;
;496:		s_graphicsoptions.list.curvalue = i;
ADDRGP4 s_graphicsoptions+1828+92
ADDRLP4 0
INDIRI4
ASGNI4
line 497
;497:		return;
ADDRGP4 $326
JUMPV
LABELV $328
line 468
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $330
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 5
LTU4 $327
line 501
;498:	}
;499:
;500:	// return 'Custom' ivo template
;501:	s_graphicsoptions.list.curvalue = NUM_IVO_TEMPLATES - 1;
ADDRGP4 s_graphicsoptions+1828+92
CNSTI4 5
ASGNI4
line 502
;502:}
LABELV $326
endproc GraphicsOptions_CheckConfig 4 0
proc GraphicsOptions_UpdateMenuItems 8 0
line 510
;503:
;504:/*
;505:=================
;506:GraphicsOptions_UpdateMenuItems
;507:=================
;508:*/
;509:static void GraphicsOptions_UpdateMenuItems( void )
;510:{		
line 511
;511:	if ( s_graphicsoptions.allow_extensions.curvalue == 0 )
ADDRGP4 s_graphicsoptions+2988+92
INDIRI4
CNSTI4 0
NEI4 $395
line 512
;512:	{
line 513
;513:		if ( s_graphicsoptions.texturebits.curvalue == 0 )
ADDRGP4 s_graphicsoptions+3120+92
INDIRI4
CNSTI4 0
NEI4 $399
line 514
;514:		{
line 515
;515:			s_graphicsoptions.texturebits.curvalue = 1;
ADDRGP4 s_graphicsoptions+3120+92
CNSTI4 1
ASGNI4
line 516
;516:		}
LABELV $399
line 517
;517:	}
LABELV $395
line 519
;518:
;519:	s_graphicsoptions.apply.generic.flags |= QMF_HIDDEN|QMF_INACTIVE;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 521
;520:
;521:	if ( s_ivo.mode != s_graphicsoptions.mode.curvalue )
ADDRGP4 s_ivo
INDIRI4
ADDRGP4 s_graphicsoptions+2092+92
INDIRI4
EQI4 $407
line 522
;522:	{
line 523
;523:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 524
;524:	}
LABELV $407
line 525
;525:	if ( s_ivo.fullscreen != s_graphicsoptions.fs.curvalue )
ADDRGP4 s_ivo+4
INDIRI4
ADDRGP4 s_graphicsoptions+2460+92
INDIRI4
EQI4 $413
line 526
;526:	{
line 527
;527:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 528
;528:	}
LABELV $413
line 529
;529:	if ( s_ivo.extensions != s_graphicsoptions.allow_extensions.curvalue )
ADDRGP4 s_ivo+52
INDIRI4
ADDRGP4 s_graphicsoptions+2988+92
INDIRI4
EQI4 $420
line 530
;530:	{
line 531
;531:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 532
;532:	}
LABELV $420
line 533
;533:	if ( s_ivo.tq != s_graphicsoptions.tq.curvalue )
ADDRGP4 s_ivo+8
INDIRI4
CVIF4 4
ADDRGP4 s_graphicsoptions+2356+96
INDIRF4
EQF4 $427
line 534
;534:	{
line 535
;535:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 536
;536:	}
LABELV $427
line 537
;537:	if ( s_ivo.lighting != s_graphicsoptions.lighting.curvalue )
ADDRGP4 s_ivo+12
INDIRI4
ADDRGP4 s_graphicsoptions+2592+92
INDIRI4
EQI4 $434
line 538
;538:	{
line 539
;539:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 540
;540:	}
LABELV $434
line 541
;541:        if ( s_ivo.flares != s_graphicsoptions.flares.curvalue )
ADDRGP4 s_ivo+16
INDIRI4
ADDRGP4 s_graphicsoptions+2724+92
INDIRI4
EQI4 $441
line 542
;542:	{
line 543
;543:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 544
;544:	}
LABELV $441
line 545
;545:        if ( s_ivo.bloom != s_graphicsoptions.bloom.curvalue )
ADDRGP4 s_ivo+20
INDIRI4
ADDRGP4 s_graphicsoptions+2856+92
INDIRI4
EQI4 $448
line 546
;546:	{
line 547
;547:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 548
;548:	}
LABELV $448
line 549
;549:	if ( s_ivo.drawfps != s_graphicsoptions.drawfps.curvalue )
ADDRGP4 s_ivo+24
INDIRI4
ADDRGP4 s_graphicsoptions+3780+92
INDIRI4
EQI4 $455
line 550
;550:	{
line 551
;551:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 552
;552:	}
LABELV $455
line 553
;553:	if ( s_ivo.driver != s_graphicsoptions.driver.curvalue )
ADDRGP4 s_ivo+48
INDIRI4
ADDRGP4 s_graphicsoptions+2224+92
INDIRI4
EQI4 $462
line 554
;554:	{
line 555
;555:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 556
;556:	}
LABELV $462
line 557
;557:	if ( s_ivo.texturebits != s_graphicsoptions.texturebits.curvalue )
ADDRGP4 s_ivo+28
INDIRI4
ADDRGP4 s_graphicsoptions+3120+92
INDIRI4
EQI4 $469
line 558
;558:	{
line 559
;559:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 560
;560:	}
LABELV $469
line 561
;561:	if ( s_ivo.geometry != s_graphicsoptions.geometry.curvalue )
ADDRGP4 s_ivo+32
INDIRI4
ADDRGP4 s_graphicsoptions+3252+92
INDIRI4
EQI4 $476
line 562
;562:	{
line 563
;563:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 564
;564:	}
LABELV $476
line 565
;565:	if ( s_ivo.filter != s_graphicsoptions.filter.curvalue )
ADDRGP4 s_ivo+36
INDIRI4
ADDRGP4 s_graphicsoptions+3384+92
INDIRI4
EQI4 $483
line 566
;566:	{
line 567
;567:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 568
;568:	}
LABELV $483
line 569
;569:        if ( s_ivo.aniso != s_graphicsoptions.aniso.curvalue )
ADDRGP4 s_ivo+40
INDIRI4
ADDRGP4 s_graphicsoptions+3516+92
INDIRI4
EQI4 $490
line 570
;570:	{
line 571
;571:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 572
;572:	}
LABELV $490
line 573
;573:        if ( s_ivo.aniso2 != s_graphicsoptions.aniso2.curvalue )
ADDRGP4 s_ivo+44
INDIRI4
ADDRGP4 s_graphicsoptions+3648+92
INDIRI4
EQI4 $497
line 574
;574:	{
line 575
;575:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+4016+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 576
;576:	}
LABELV $497
line 578
;577:
;578:	GraphicsOptions_CheckConfig();
ADDRGP4 GraphicsOptions_CheckConfig
CALLV
pop
line 579
;579:}	
LABELV $394
endproc GraphicsOptions_UpdateMenuItems 8 0
proc GraphicsOptions_ApplyChanges 4 8
line 587
;580:
;581:/*
;582:=================
;583:GraphicsOptions_ApplyChanges
;584:=================
;585:*/
;586:static void GraphicsOptions_ApplyChanges( void *unused, int notification )
;587:{
line 588
;588:	if (notification != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $505
line 589
;589:		return;
ADDRGP4 $504
JUMPV
LABELV $505
line 591
;590:
;591:	switch ( s_graphicsoptions.texturebits.curvalue  )
ADDRLP4 0
ADDRGP4 s_graphicsoptions+3120+92
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $511
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $513
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $514
ADDRGP4 $507
JUMPV
line 592
;592:	{
LABELV $511
line 594
;593:	case 0:
;594:		trap_Cvar_SetValue( "r_texturebits", 0 );
ADDRGP4 $512
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 595
;595:		break;
ADDRGP4 $508
JUMPV
LABELV $513
line 597
;596:	case 1:
;597:		trap_Cvar_SetValue( "r_texturebits", 16 );
ADDRGP4 $512
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 598
;598:		break;
ADDRGP4 $508
JUMPV
LABELV $514
line 600
;599:	case 2:
;600:		trap_Cvar_SetValue( "r_texturebits", 32 );
ADDRGP4 $512
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 601
;601:		break;
LABELV $507
LABELV $508
line 603
;602:	}
;603:	trap_Cvar_SetValue( "r_picmip", 3 - s_graphicsoptions.tq.curvalue );
ADDRGP4 $515
ARGP4
CNSTF4 1077936128
ADDRGP4 s_graphicsoptions+2356+96
INDIRF4
SUBF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 604
;604:	trap_Cvar_SetValue( "r_allowExtensions", s_graphicsoptions.allow_extensions.curvalue );
ADDRGP4 $518
ARGP4
ADDRGP4 s_graphicsoptions+2988+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 606
;605:
;606:	if(s_graphicsoptions.fs.curvalue == 0){
ADDRGP4 s_graphicsoptions+2460+92
INDIRI4
CNSTI4 0
NEI4 $521
line 607
;607:	trap_Cvar_SetValue( "r_fullscreen", 0 );
ADDRGP4 $525
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 608
;608:	trap_Cvar_SetValue( "r_mode", s_graphicsoptions.mode.curvalue );
ADDRGP4 $526
ARGP4
ADDRGP4 s_graphicsoptions+2092+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 609
;609:	} else {
ADDRGP4 $522
JUMPV
LABELV $521
line 610
;610:	trap_Cvar_SetValue( "r_fullscreen", 1 );
ADDRGP4 $525
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 611
;611:	trap_Cvar_SetValue( "r_mode", -2 );
ADDRGP4 $526
ARGP4
CNSTF4 3221225472
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 612
;612:	}
LABELV $522
line 614
;613:
;614:	if(s_graphicsoptions.lighting.curvalue == 0){
ADDRGP4 s_graphicsoptions+2592+92
INDIRI4
CNSTI4 0
NEI4 $529
line 615
;615:	trap_Cvar_SetValue( "cg_atmosphericLevel", 2 );
ADDRGP4 $533
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 616
;616:	}
LABELV $529
line 617
;617:	if(s_graphicsoptions.lighting.curvalue == 1){
ADDRGP4 s_graphicsoptions+2592+92
INDIRI4
CNSTI4 1
NEI4 $534
line 618
;618:	trap_Cvar_SetValue( "cg_atmosphericLevel", 1 );
ADDRGP4 $533
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 619
;619:	}
LABELV $534
line 620
;620:	if(s_graphicsoptions.lighting.curvalue == 2){
ADDRGP4 s_graphicsoptions+2592+92
INDIRI4
CNSTI4 2
NEI4 $538
line 621
;621:	trap_Cvar_SetValue( "cg_atmosphericLevel", 0 );
ADDRGP4 $533
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 622
;622:	}
LABELV $538
line 623
;623:	trap_Cvar_SetValue( "r_dlightMode", s_graphicsoptions.flares.curvalue+1 );
ADDRGP4 $542
ARGP4
ADDRGP4 s_graphicsoptions+2724+92
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 624
;624:	trap_Cvar_SetValue( "r_bloom", s_graphicsoptions.bloom.curvalue );
ADDRGP4 $545
ARGP4
ADDRGP4 s_graphicsoptions+2856+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 625
;625:	trap_Cvar_SetValue( "r_hdr", s_graphicsoptions.drawfps.curvalue );
ADDRGP4 $548
ARGP4
ADDRGP4 s_graphicsoptions+3780+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 628
;626:
;627:	//r_ext_texture_filter_anisotropic is special
;628:	if(s_graphicsoptions.aniso.curvalue) {
ADDRGP4 s_graphicsoptions+3516+92
INDIRI4
CNSTI4 0
EQI4 $551
line 629
;629:		trap_Cvar_SetValue( "r_ext_max_anisotropy", s_graphicsoptions.aniso.curvalue*2 );
ADDRGP4 $555
ARGP4
ADDRGP4 s_graphicsoptions+3516+92
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 630
;630:		trap_Cvar_SetValue( "r_ext_texture_filter_anisotropic", qtrue );
ADDRGP4 $558
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 631
;631:	}
ADDRGP4 $552
JUMPV
LABELV $551
line 632
;632:	else {
line 633
;633:		trap_Cvar_SetValue( "r_ext_texture_filter_anisotropic", qfalse );
ADDRGP4 $558
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 634
;634:	}
LABELV $552
line 637
;635:	
;636:	//r_ext_texture_filter_anisotropic is special
;637:	trap_Cvar_SetValue( "r_ext_multisample", s_graphicsoptions.aniso2.curvalue*2 );
ADDRGP4 $559
ARGP4
ADDRGP4 s_graphicsoptions+3648+92
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 639
;638:
;639:	if ( s_graphicsoptions.geometry.curvalue == 2 )
ADDRGP4 s_graphicsoptions+3252+92
INDIRI4
CNSTI4 2
NEI4 $562
line 640
;640:	{
line 641
;641:		trap_Cvar_SetValue( "r_bloom_intensity", 0.16 );
ADDRGP4 $566
ARGP4
CNSTF4 1042536202
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 642
;642:	}
ADDRGP4 $563
JUMPV
LABELV $562
line 643
;643:	else if ( s_graphicsoptions.geometry.curvalue == 1 )
ADDRGP4 s_graphicsoptions+3252+92
INDIRI4
CNSTI4 1
NEI4 $567
line 644
;644:	{
line 645
;645:		trap_Cvar_SetValue( "r_bloom_intensity", 0.12 );
ADDRGP4 $566
ARGP4
CNSTF4 1039516303
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 646
;646:	}
ADDRGP4 $568
JUMPV
LABELV $567
line 648
;647:	else
;648:	{
line 649
;649:		trap_Cvar_SetValue( "r_bloom_intensity", 0.06 );
ADDRGP4 $566
ARGP4
CNSTF4 1031127695
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 650
;650:	}
LABELV $568
LABELV $563
line 652
;651:
;652:	if ( s_graphicsoptions.filter.curvalue )
ADDRGP4 s_graphicsoptions+3384+92
INDIRI4
CNSTI4 0
EQI4 $571
line 653
;653:	{
line 654
;654:		trap_Cvar_Set( "r_textureMode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $575
ARGP4
ADDRGP4 $576
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 655
;655:	}
ADDRGP4 $572
JUMPV
LABELV $571
line 657
;656:	else
;657:	{
line 658
;658:		trap_Cvar_Set( "r_textureMode", "GL_NEAREST_MIPMAP_NEAREST" );
ADDRGP4 $575
ARGP4
ADDRGP4 $577
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 659
;659:	}
LABELV $572
line 661
;660:
;661:	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $578
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 662
;662:}
LABELV $504
endproc GraphicsOptions_ApplyChanges 4 8
proc GraphicsOptions_Event 12 0
line 669
;663:
;664:/*
;665:=================
;666:GraphicsOptions_Event
;667:=================
;668:*/
;669:static void GraphicsOptions_Event( void* ptr, int event ) {
line 672
;670:	InitialVideoOptions_s *ivo;
;671:
;672:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $580
line 673
;673:	 	return;
ADDRGP4 $579
JUMPV
LABELV $580
line 676
;674:	}
;675:
;676:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 101
LTI4 $582
ADDRLP4 4
INDIRI4
CNSTI4 110
GTI4 $582
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $632-404
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $632
address $627
address $582
address $595
address $590
address $626
address $583
address $629
address $630
address $631
address $585
code
LABELV $585
line 678
;677:        case ID_RATIO:
;678:            s_graphicsoptions.mode.curvalue = ratioToRes[ s_graphicsoptions.ratio.curvalue ];
ADDRGP4 s_graphicsoptions+2092+92
ADDRGP4 s_graphicsoptions+1960+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ratioToRes
ADDP4
INDIRI4
ASGNI4
LABELV $590
line 681
;679:            // fall through to apply mode constraints
;680:	case ID_MODE:
;681:        s_graphicsoptions.ratio.curvalue = resToRatio[ s_graphicsoptions.mode.curvalue ];
ADDRGP4 s_graphicsoptions+1960+92
ADDRGP4 s_graphicsoptions+2092+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resToRatio
ADDP4
INDIRI4
ASGNI4
line 682
;682:		break;
ADDRGP4 $583
JUMPV
LABELV $595
line 685
;683:
;684:	case ID_LIST:
;685:		ivo = &s_ivo_templates[s_graphicsoptions.list.curvalue];
ADDRLP4 0
CNSTI4 56
ADDRGP4 s_graphicsoptions+1828+92
INDIRI4
MULI4
ADDRGP4 s_ivo_templates
ADDP4
ASGNP4
line 687
;686:
;687:		s_graphicsoptions.mode.curvalue        = ivo->mode;
ADDRGP4 s_graphicsoptions+2092+92
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 688
;688:		s_graphicsoptions.ratio.curvalue       = resToRatio[ s_graphicsoptions.mode.curvalue ];
ADDRGP4 s_graphicsoptions+1960+92
ADDRGP4 s_graphicsoptions+2092+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 resToRatio
ADDP4
INDIRI4
ASGNI4
line 689
;689:		s_graphicsoptions.tq.curvalue          = ivo->tq;
ADDRGP4 s_graphicsoptions+2356+96
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 690
;690:		s_graphicsoptions.lighting.curvalue    = ivo->lighting;
ADDRGP4 s_graphicsoptions+2592+92
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 691
;691:		s_graphicsoptions.texturebits.curvalue = ivo->texturebits;
ADDRGP4 s_graphicsoptions+3120+92
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 692
;692:		s_graphicsoptions.geometry.curvalue    = ivo->geometry;
ADDRGP4 s_graphicsoptions+3252+92
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 693
;693:		s_graphicsoptions.filter.curvalue      = ivo->filter;
ADDRGP4 s_graphicsoptions+3384+92
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
line 694
;694:		s_graphicsoptions.aniso.curvalue       = ivo->aniso;
ADDRGP4 s_graphicsoptions+3516+92
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
line 695
;695:		s_graphicsoptions.aniso2.curvalue       = ivo->aniso2;
ADDRGP4 s_graphicsoptions+3648+92
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 696
;696:		s_graphicsoptions.fs.curvalue          = ivo->fullscreen;
ADDRGP4 s_graphicsoptions+2460+92
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 697
;697:		s_graphicsoptions.flares.curvalue      = ivo->flares;
ADDRGP4 s_graphicsoptions+2724+92
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 698
;698:		s_graphicsoptions.bloom.curvalue      = ivo->bloom;
ADDRGP4 s_graphicsoptions+2856+92
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 699
;699:		s_graphicsoptions.drawfps.curvalue      = ivo->drawfps;
ADDRGP4 s_graphicsoptions+3780+92
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 700
;700:		break;
ADDRGP4 $583
JUMPV
LABELV $626
line 703
;701:
;702:	case ID_DRIVERINFO:
;703:		UI_DriverInfo_Menu();
ADDRGP4 UI_DriverInfo_Menu
CALLV
pop
line 704
;704:		break;
ADDRGP4 $583
JUMPV
LABELV $627
line 707
;705:
;706:	case ID_BACK2:
;707:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 708
;708:		break;
ADDRGP4 $583
JUMPV
line 711
;709:
;710:	case ID_GRAPHICS:
;711:		break;
LABELV $629
line 714
;712:
;713:	case ID_DISPLAY:
;714:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 715
;715:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 716
;716:		break;
ADDRGP4 $583
JUMPV
LABELV $630
line 719
;717:
;718:	case ID_SOUND:
;719:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 720
;720:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 721
;721:		break;
ADDRGP4 $583
JUMPV
LABELV $631
line 724
;722:
;723:	case ID_NETWORK:
;724:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 725
;725:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 726
;726:		break;
LABELV $582
LABELV $583
line 728
;727:	}
;728:}
LABELV $579
endproc GraphicsOptions_Event 12 0
proc GraphicsOptions_TQEvent 0 0
line 736
;729:
;730:
;731:/*
;732:================
;733:GraphicsOptions_TQEvent
;734:================
;735:*/
;736:static void GraphicsOptions_TQEvent( void *ptr, int event ) {
line 737
;737:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $635
line 738
;738:	 	return;
ADDRGP4 $634
JUMPV
LABELV $635
line 740
;739:	}
;740:	s_graphicsoptions.tq.curvalue = (int)(s_graphicsoptions.tq.curvalue + 0.5);
ADDRGP4 s_graphicsoptions+2356+96
ADDRGP4 s_graphicsoptions+2356+96
INDIRF4
CNSTF4 1056964608
ADDF4
CVFI4 4
CVIF4 4
ASGNF4
line 741
;741:}
LABELV $634
endproc GraphicsOptions_TQEvent 0 0
export GraphicsOptions_MenuDraw
proc GraphicsOptions_MenuDraw 0 4
line 750
;742:
;743:
;744:/*
;745:================
;746:GraphicsOptions_MenuDraw
;747:================
;748:*/
;749:void GraphicsOptions_MenuDraw (void)
;750:{
line 752
;751://APSFIX - rework this
;752:	GraphicsOptions_UpdateMenuItems();
ADDRGP4 GraphicsOptions_UpdateMenuItems
CALLV
pop
line 754
;753:
;754:	Menu_Draw( &s_graphicsoptions.menu );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 755
;755:}
LABELV $641
endproc GraphicsOptions_MenuDraw 0 4
proc GraphicsOptions_SetMenuItems 80 8
line 763
;756:
;757:/*
;758:=================
;759:GraphicsOptions_SetMenuItems
;760:=================
;761:*/
;762:static void GraphicsOptions_SetMenuItems( void )
;763:{
line 764
;764:	s_graphicsoptions.mode.curvalue = trap_Cvar_VariableValue( "r_mode" );
ADDRGP4 $526
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+2092+92
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 766
;765:
;766:	if ( s_graphicsoptions.mode.curvalue < 0 )
ADDRGP4 s_graphicsoptions+2092+92
INDIRI4
CNSTI4 0
GEI4 $645
line 767
;767:	{
line 768
;768:		s_graphicsoptions.mode.curvalue = 3;
ADDRGP4 s_graphicsoptions+2092+92
CNSTI4 3
ASGNI4
line 769
;769:	}
LABELV $645
line 770
;770:	if(trap_Cvar_VariableValue("r_fullscreen") == 1){
ADDRGP4 $525
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
NEF4 $651
line 771
;771:		s_graphicsoptions.fs.curvalue = 1;
ADDRGP4 s_graphicsoptions+2460+92
CNSTI4 1
ASGNI4
line 772
;772:	} else {
ADDRGP4 $652
JUMPV
LABELV $651
line 773
;773:		s_graphicsoptions.fs.curvalue = 0;
ADDRGP4 s_graphicsoptions+2460+92
CNSTI4 0
ASGNI4
line 774
;774:	}
LABELV $652
line 775
;775:	s_graphicsoptions.allow_extensions.curvalue = trap_Cvar_VariableValue("r_allowExtensions");
ADDRGP4 $518
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+2988+92
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 776
;776:    s_graphicsoptions.flares.curvalue = trap_Cvar_VariableValue("r_dlightMode")-1;
ADDRGP4 $542
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+2724+92
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 777
;777:    s_graphicsoptions.bloom.curvalue = trap_Cvar_VariableValue("r_bloom");
ADDRGP4 $545
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+2856+92
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 778
;778:    s_graphicsoptions.drawfps.curvalue = trap_Cvar_VariableValue("r_hdr");
ADDRGP4 $548
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+3780+92
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 779
;779:    if(trap_Cvar_VariableValue("r_ext_texture_filter_anisotropic")) {
ADDRGP4 $558
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $665
line 780
;780:        s_graphicsoptions.aniso.curvalue = trap_Cvar_VariableValue("r_ext_max_anisotropy")/2;
ADDRGP4 $555
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+3516+92
ADDRLP4 28
INDIRF4
CNSTF4 1073741824
DIVF4
CVFI4 4
ASGNI4
line 781
;781:    }
LABELV $665
line 782
;782:    s_graphicsoptions.aniso2.curvalue = trap_Cvar_VariableValue("r_ext_multisample")/2;
ADDRGP4 $559
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+3648+92
ADDRLP4 28
INDIRF4
CNSTF4 1073741824
DIVF4
CVFI4 4
ASGNI4
line 783
;783:	s_graphicsoptions.tq.curvalue = 3-trap_Cvar_VariableValue( "r_picmip");
ADDRGP4 $515
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+2356+96
CNSTF4 1077936128
ADDRLP4 32
INDIRF4
SUBF4
ASGNF4
line 784
;784:	if ( s_graphicsoptions.tq.curvalue < 0 )
ADDRGP4 s_graphicsoptions+2356+96
INDIRF4
CNSTF4 0
GEF4 $673
line 785
;785:	{
line 786
;786:		s_graphicsoptions.tq.curvalue = 0;
ADDRGP4 s_graphicsoptions+2356+96
CNSTF4 0
ASGNF4
line 787
;787:	}
ADDRGP4 $674
JUMPV
LABELV $673
line 788
;788:	else if ( s_graphicsoptions.tq.curvalue > 3 )
ADDRGP4 s_graphicsoptions+2356+96
INDIRF4
CNSTF4 1077936128
LEF4 $679
line 789
;789:	{
line 790
;790:		s_graphicsoptions.tq.curvalue = 3;
ADDRGP4 s_graphicsoptions+2356+96
CNSTF4 1077936128
ASGNF4
line 791
;791:	}
LABELV $679
LABELV $674
line 793
;792:
;793:	if(trap_Cvar_VariableValue( "cg_atmosphericLevel" )  == 2){
ADDRGP4 $533
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 1073741824
NEF4 $685
line 794
;794:	s_graphicsoptions.lighting.curvalue = 0;
ADDRGP4 s_graphicsoptions+2592+92
CNSTI4 0
ASGNI4
line 795
;795:	}
LABELV $685
line 796
;796:	if(trap_Cvar_VariableValue( "cg_atmosphericLevel" )  == 1){
ADDRGP4 $533
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1065353216
NEF4 $689
line 797
;797:	s_graphicsoptions.lighting.curvalue = 1;
ADDRGP4 s_graphicsoptions+2592+92
CNSTI4 1
ASGNI4
line 798
;798:	}
LABELV $689
line 799
;799:	if(trap_Cvar_VariableValue( "cg_atmosphericLevel" )  == 0){
ADDRGP4 $533
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 0
NEF4 $693
line 800
;800:	s_graphicsoptions.lighting.curvalue = 2;
ADDRGP4 s_graphicsoptions+2592+92
CNSTI4 2
ASGNI4
line 801
;801:	}
LABELV $693
line 802
;802:	switch ( ( int ) trap_Cvar_VariableValue( "r_texturebits" ) )
ADDRGP4 $512
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 52
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 60
CNSTI4 16
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $703
ADDRLP4 48
INDIRI4
ADDRLP4 60
INDIRI4
GTI4 $710
LABELV $709
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $700
ADDRGP4 $697
JUMPV
LABELV $710
ADDRLP4 48
INDIRI4
CNSTI4 32
EQI4 $706
ADDRGP4 $697
JUMPV
line 803
;803:	{
LABELV $697
LABELV $700
line 806
;804:	default:
;805:	case 0:
;806:		s_graphicsoptions.texturebits.curvalue = 0;
ADDRGP4 s_graphicsoptions+3120+92
CNSTI4 0
ASGNI4
line 807
;807:		break;
ADDRGP4 $698
JUMPV
LABELV $703
line 809
;808:	case 16:
;809:		s_graphicsoptions.texturebits.curvalue = 1;
ADDRGP4 s_graphicsoptions+3120+92
CNSTI4 1
ASGNI4
line 810
;810:		break;
ADDRGP4 $698
JUMPV
LABELV $706
line 812
;811:	case 32:
;812:		s_graphicsoptions.texturebits.curvalue = 2;
ADDRGP4 s_graphicsoptions+3120+92
CNSTI4 2
ASGNI4
line 813
;813:		break;
LABELV $698
line 816
;814:	}
;815:
;816:	if ( Q_strequal( UI_Cvar_VariableString( "r_textureMode" ), "GL_NEAREST_MIPMAP_NEAREST" ) )
ADDRGP4 $575
ARGP4
ADDRLP4 64
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 $577
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $711
line 817
;817:	{
line 818
;818:		s_graphicsoptions.filter.curvalue = 0;
ADDRGP4 s_graphicsoptions+3384+92
CNSTI4 0
ASGNI4
line 819
;819:	}
ADDRGP4 $712
JUMPV
LABELV $711
line 821
;820:	else
;821:	{
line 822
;822:		s_graphicsoptions.filter.curvalue = 1;
ADDRGP4 s_graphicsoptions+3384+92
CNSTI4 1
ASGNI4
line 823
;823:	}
LABELV $712
line 825
;824:	
;825:	if ( trap_Cvar_VariableValue( "r_bloom_intensity" ) == 0.16 )
ADDRGP4 $566
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 72
INDIRF4
CNSTF4 1042536202
NEF4 $717
line 826
;826:	{
line 827
;827:		s_graphicsoptions.geometry.curvalue = 2;
ADDRGP4 s_graphicsoptions+3252+92
CNSTI4 2
ASGNI4
line 828
;828:	}
ADDRGP4 $718
JUMPV
LABELV $717
line 829
;829:	else if ( trap_Cvar_VariableValue( "r_bloom_intensity" ) == 0.12 )
ADDRGP4 $566
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 1039516303
NEF4 $721
line 830
;830:	{
line 831
;831:		s_graphicsoptions.geometry.curvalue = 1;
ADDRGP4 s_graphicsoptions+3252+92
CNSTI4 1
ASGNI4
line 832
;832:	}
ADDRGP4 $722
JUMPV
LABELV $721
line 834
;833:	else
;834:	{
line 835
;835:		s_graphicsoptions.geometry.curvalue = 0;
ADDRGP4 s_graphicsoptions+3252+92
CNSTI4 0
ASGNI4
line 836
;836:	}
LABELV $722
LABELV $718
line 837
;837:}
LABELV $642
endproc GraphicsOptions_SetMenuItems 80 8
data
align 4
LABELV $728
address $729
address $730
byte 4 0
align 4
LABELV $731
address $732
address $733
address $734
byte 4 0
align 4
LABELV $735
address $736
address $737
address $738
byte 4 0
align 4
LABELV $739
address $740
address $741
address $742
address $743
address $744
address $745
byte 4 0
align 4
LABELV $746
address $747
address $748
address $749
address $750
address $751
address $752
byte 4 0
align 4
LABELV $753
address $754
address $755
address $756
byte 4 0
align 4
LABELV $757
address $748
address $749
address $750
byte 4 0
align 4
LABELV $758
address $759
address $760
byte 4 0
align 4
LABELV $761
address $762
address $763
byte 4 0
align 4
LABELV $764
address $759
address $765
address $766
address $767
address $768
byte 4 0
align 4
LABELV $769
address $762
address $765
address $766
address $767
address $768
byte 4 0
align 4
LABELV $770
address $756
address $755
address $754
byte 4 0
align 4
LABELV $771
address $772
address $773
address $774
byte 4 0
align 4
LABELV $775
address $759
address $776
byte 4 0
align 4
LABELV $777
address $762
address $778
byte 4 0
export GraphicsOptions_MenuInit
code
proc GraphicsOptions_MenuInit 4 12
line 845
;838:
;839:/*
;840:================
;841:GraphicsOptions_MenuInit
;842:================
;843:*/
;844:void GraphicsOptions_MenuInit( void )
;845:{
line 967
;846:	static const char *s_driver_names[] =
;847:	{
;848:		"opengl",
;849:		"vulcan",
;850:		NULL
;851:	};
;852:
;853:	static const char *tq_names[] =
;854:	{
;855:		"Default",
;856:		"16 bit",
;857:		"32 bit",
;858:		NULL
;859:	};
;860:	static const char *tq_namesru[] =
;861:	{
;862:		"Стандарт",
;863:		"16 бит",
;864:		"32 бит",
;865:		NULL
;866:	};
;867:
;868:	static const char *s_graphics_options_names[] =
;869:	{
;870:		"Very High Quality",
;871:		"High Quality",
;872:		"Normal",
;873:		"Fast",
;874:		"Fastest",
;875:		"Custom",
;876:		NULL
;877:	};
;878:	static const char *s_graphics_options_namesru[] =
;879:	{
;880:		"Ультра",
;881:		"Высокие",
;882:		"Средние",
;883:		"Низкие",
;884:		"Минимальные",
;885:		"Свои",
;886:		NULL
;887:	};
;888:
;889:	static const char *lighting_names[] =
;890:	{
;891:		"High",
;892:		"Medium",
;893:		"Low",
;894:		NULL
;895:	};
;896:	static const char *lighting_namesru[] =
;897:	{
;898:		"Высокие",
;899:		"Средние",
;900:		"Низкие",
;901:		NULL
;902:	};
;903:
;904:
;905:	static const char *filter_names[] =
;906:	{
;907:		"Off",
;908:		"Trilinear",
;909:		NULL
;910:	};
;911:	static const char *filter_namesru[] =
;912:	{
;913:		"Откл",
;914:		"Трилинейная",
;915:		NULL
;916:	};
;917:        
;918:    static const char *aniso_names[] =
;919:	{
;920:		"Off",
;921:		"2x",
;922:        "4x",
;923:        "6x",
;924:        "8x",
;925:		NULL
;926:	};
;927:	static const char *aniso_namesru[] =
;928:	{
;929:		"Откл",
;930:		"2x",
;931:        "4x",
;932:        "6x",
;933:        "8x",
;934:		NULL
;935:	};
;936:        
;937:	static const char *quality_names[] =
;938:	{
;939:		"Low",
;940:		"Medium",
;941:		"High",
;942:		NULL
;943:	};
;944:	static const char *quality_namesru[] =
;945:	{
;946:		"Низкое",
;947:		"Среднее",
;948:		"Высокое",
;949:		NULL
;950:	};
;951:	static const char *enabled_names[] =
;952:	{
;953:		"Off",
;954:		"On",
;955:		NULL
;956:	};
;957:	static const char *enabled_namesru[] =
;958:	{
;959:		"Откл",
;960:		"Вкл",
;961:		NULL
;962:	};
;963:
;964:	int y;
;965:
;966:	// zero set all our globals
;967:	memset( &s_graphicsoptions, 0 ,sizeof(graphicsoptions_t) );
ADDRGP4 s_graphicsoptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4248
ARGI4
ADDRGP4 memset
CALLP4
pop
line 969
;968:
;969:	GraphicsOptions_GetAspectRatios();
ADDRGP4 GraphicsOptions_GetAspectRatios
CALLV
pop
line 971
;970:
;971:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 973
;972:
;973:	s_graphicsoptions.menu.wrapAround = qtrue;
ADDRGP4 s_graphicsoptions+1044
CNSTI4 1
ASGNI4
line 974
;974:	s_graphicsoptions.menu.native 	= qfalse;
ADDRGP4 s_graphicsoptions+1056
CNSTI4 0
ASGNI4
line 975
;975:	s_graphicsoptions.menu.fullscreen = qtrue;
ADDRGP4 s_graphicsoptions+1052
CNSTI4 1
ASGNI4
line 976
;976:	s_graphicsoptions.menu.draw       = GraphicsOptions_MenuDraw;
ADDRGP4 s_graphicsoptions+1036
ADDRGP4 GraphicsOptions_MenuDraw
ASGNP4
line 978
;977:
;978:	s_graphicsoptions.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_graphicsoptions+1076
CNSTI4 10
ASGNI4
line 979
;979:	s_graphicsoptions.banner.generic.x	   = 320;
ADDRGP4 s_graphicsoptions+1076+28
CNSTI4 320
ASGNI4
line 980
;980:	s_graphicsoptions.banner.generic.y	   = 16;
ADDRGP4 s_graphicsoptions+1076+32
CNSTI4 16
ASGNI4
line 981
;981:	s_graphicsoptions.banner.color         = color_white;
ADDRGP4 s_graphicsoptions+1076+100
ADDRGP4 color_white
ASGNP4
line 982
;982:	s_graphicsoptions.banner.style         = UI_CENTER;
ADDRGP4 s_graphicsoptions+1076+92
CNSTI4 1
ASGNI4
line 984
;983:
;984:	s_graphicsoptions.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+1180
CNSTI4 6
ASGNI4
line 985
;985:	s_graphicsoptions.framel.generic.name  = GRAPHICSOPTIONS_FRAMEL;
ADDRGP4 s_graphicsoptions+1180+4
ADDRGP4 $80
ASGNP4
line 986
;986:	s_graphicsoptions.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+1180+72
CNSTU4 16384
ASGNU4
line 987
;987:	s_graphicsoptions.framel.generic.x	   = 0;
ADDRGP4 s_graphicsoptions+1180+28
CNSTI4 0
ASGNI4
line 988
;988:	s_graphicsoptions.framel.generic.y	   = 78;
ADDRGP4 s_graphicsoptions+1180+32
CNSTI4 78
ASGNI4
line 989
;989:	s_graphicsoptions.framel.width  	   = 256;
ADDRGP4 s_graphicsoptions+1180+104
CNSTI4 256
ASGNI4
line 990
;990:	s_graphicsoptions.framel.height  	   = 329;
ADDRGP4 s_graphicsoptions+1180+108
CNSTI4 329
ASGNI4
line 992
;991:
;992:	s_graphicsoptions.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+1296
CNSTI4 6
ASGNI4
line 993
;993:	s_graphicsoptions.framer.generic.name  = GRAPHICSOPTIONS_FRAMER;
ADDRGP4 s_graphicsoptions+1296+4
ADDRGP4 $81
ASGNP4
line 994
;994:	s_graphicsoptions.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+1296+72
CNSTU4 16384
ASGNU4
line 995
;995:	s_graphicsoptions.framer.generic.x	   = 376;
ADDRGP4 s_graphicsoptions+1296+28
CNSTI4 376
ASGNI4
line 996
;996:	s_graphicsoptions.framer.generic.y	   = 76;
ADDRGP4 s_graphicsoptions+1296+32
CNSTI4 76
ASGNI4
line 997
;997:	s_graphicsoptions.framer.width  	   = 256;
ADDRGP4 s_graphicsoptions+1296+104
CNSTI4 256
ASGNI4
line 998
;998:	s_graphicsoptions.framer.height  	   = 334;
ADDRGP4 s_graphicsoptions+1296+108
CNSTI4 334
ASGNI4
line 1000
;999:
;1000:	s_graphicsoptions.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+1412
CNSTI4 9
ASGNI4
line 1001
;1001:	s_graphicsoptions.graphics.generic.flags	= QMF_RIGHT_JUSTIFY;
ADDRGP4 s_graphicsoptions+1412+72
CNSTU4 16
ASGNU4
line 1002
;1002:	s_graphicsoptions.graphics.generic.id		= ID_GRAPHICS;
ADDRGP4 s_graphicsoptions+1412+24
CNSTI4 106
ASGNI4
line 1003
;1003:	s_graphicsoptions.graphics.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+1412+76
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1004
;1004:	s_graphicsoptions.graphics.generic.x		= 140 - uis.wideoffset;
ADDRGP4 s_graphicsoptions+1412+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1005
;1005:	s_graphicsoptions.graphics.generic.y		= 240 - 2 * PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+1412+32
CNSTI4 240
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 1
LSHI4
SUBI4
ASGNI4
line 1006
;1006:	s_graphicsoptions.graphics.style			= UI_RIGHT;
ADDRGP4 s_graphicsoptions+1412+92
CNSTI4 2
ASGNI4
line 1007
;1007:	s_graphicsoptions.graphics.color			= color_red;
ADDRGP4 s_graphicsoptions+1412+100
ADDRGP4 color_red
ASGNP4
line 1009
;1008:
;1009:	s_graphicsoptions.display.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+1516
CNSTI4 9
ASGNI4
line 1010
;1010:	s_graphicsoptions.display.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+1516+72
CNSTU4 272
ASGNU4
line 1011
;1011:	s_graphicsoptions.display.generic.id		= ID_DISPLAY;
ADDRGP4 s_graphicsoptions+1516+24
CNSTI4 107
ASGNI4
line 1012
;1012:	s_graphicsoptions.display.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+1516+76
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1013
;1013:	s_graphicsoptions.display.generic.x			= 140 - uis.wideoffset;
ADDRGP4 s_graphicsoptions+1516+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1014
;1014:	s_graphicsoptions.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+1516+32
CNSTI4 240
ADDRGP4 cl_propheight+12
INDIRI4
SUBI4
ASGNI4
line 1015
;1015:	s_graphicsoptions.display.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+1516+92
CNSTI4 2
ASGNI4
line 1016
;1016:	s_graphicsoptions.display.color				= color_red;
ADDRGP4 s_graphicsoptions+1516+100
ADDRGP4 color_red
ASGNP4
line 1018
;1017:
;1018:	s_graphicsoptions.sound.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+1620
CNSTI4 9
ASGNI4
line 1019
;1019:	s_graphicsoptions.sound.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+1620+72
CNSTU4 272
ASGNU4
line 1020
;1020:	s_graphicsoptions.sound.generic.id			= ID_SOUND;
ADDRGP4 s_graphicsoptions+1620+24
CNSTI4 108
ASGNI4
line 1021
;1021:	s_graphicsoptions.sound.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+1620+76
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1022
;1022:	s_graphicsoptions.sound.generic.x			= 140 - uis.wideoffset;
ADDRGP4 s_graphicsoptions+1620+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1023
;1023:	s_graphicsoptions.sound.generic.y			= 240;
ADDRGP4 s_graphicsoptions+1620+32
CNSTI4 240
ASGNI4
line 1024
;1024:	s_graphicsoptions.sound.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+1620+92
CNSTI4 2
ASGNI4
line 1025
;1025:	s_graphicsoptions.sound.color				= color_red;
ADDRGP4 s_graphicsoptions+1620+100
ADDRGP4 color_red
ASGNP4
line 1027
;1026:
;1027:	s_graphicsoptions.network.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+1724
CNSTI4 9
ASGNI4
line 1028
;1028:	s_graphicsoptions.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+1724+72
CNSTU4 272
ASGNU4
line 1029
;1029:	s_graphicsoptions.network.generic.id		= ID_NETWORK;
ADDRGP4 s_graphicsoptions+1724+24
CNSTI4 109
ASGNI4
line 1030
;1030:	s_graphicsoptions.network.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+1724+76
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1031
;1031:	s_graphicsoptions.network.generic.x			= 140 - uis.wideoffset;
ADDRGP4 s_graphicsoptions+1724+28
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1032
;1032:	s_graphicsoptions.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+1724+32
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 240
ADDI4
ASGNI4
line 1033
;1033:	s_graphicsoptions.network.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+1724+92
CNSTI4 2
ASGNI4
line 1034
;1034:	s_graphicsoptions.network.color				= color_red;
ADDRGP4 s_graphicsoptions+1724+100
ADDRGP4 color_red
ASGNP4
line 1036
;1035:
;1036:	y = 240 - 7 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTI4 240
CNSTI4 7
ADDRGP4 cl_bigcharheight+12
INDIRI4
MULI4
CNSTI4 14
ADDI4
SUBI4
ASGNI4
line 1037
;1037:	s_graphicsoptions.list.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1828
CNSTI4 3
ASGNI4
line 1038
;1038:	s_graphicsoptions.list.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1828+72
CNSTU4 258
ASGNU4
line 1039
;1039:	s_graphicsoptions.list.generic.x        = 400;
ADDRGP4 s_graphicsoptions+1828+28
CNSTI4 400
ASGNI4
line 1040
;1040:	s_graphicsoptions.list.generic.y        = y;
ADDRGP4 s_graphicsoptions+1828+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1041
;1041:	s_graphicsoptions.list.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+1828+76
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1042
;1042:	s_graphicsoptions.list.generic.id       = ID_LIST;
ADDRGP4 s_graphicsoptions+1828+24
CNSTI4 103
ASGNI4
line 1043
;1043:	y += 2 * ( BIGCHAR_HEIGHT + 2 );
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 1045
;1044:
;1045:	s_graphicsoptions.driver.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+2224
CNSTI4 3
ASGNI4
line 1046
;1046:	s_graphicsoptions.driver.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+2224+72
CNSTU4 258
ASGNU4
line 1047
;1047:	s_graphicsoptions.driver.generic.x     = 400;
ADDRGP4 s_graphicsoptions+2224+28
CNSTI4 400
ASGNI4
line 1048
;1048:	s_graphicsoptions.driver.generic.y     = y;
ADDRGP4 s_graphicsoptions+2224+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1049
;1049:	s_graphicsoptions.driver.itemnames     = s_driver_names;
ADDRGP4 s_graphicsoptions+2224+104
ADDRGP4 $728
ASGNP4
line 1051
;1050:	//s_graphicsoptions.driver.curvalue      = (Q_strequal( UI_Cvar_VariableString( "cl_renderer" ), "opengl1" ));
;1051:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1054
;1052:
;1053:	// references/modifies "r_allowExtensions"
;1054:	s_graphicsoptions.allow_extensions.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+2988
CNSTI4 3
ASGNI4
line 1055
;1055:	s_graphicsoptions.allow_extensions.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+2988+72
CNSTU4 258
ASGNU4
line 1056
;1056:	s_graphicsoptions.allow_extensions.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+2988+28
CNSTI4 400
ASGNI4
line 1057
;1057:	s_graphicsoptions.allow_extensions.generic.y	    = y;
ADDRGP4 s_graphicsoptions+2988+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1058
;1058:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1060
;1059:
;1060:        s_graphicsoptions.ratio.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1960
CNSTI4 3
ASGNI4
line 1061
;1061:        s_graphicsoptions.ratio.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1960+72
CNSTU4 258
ASGNU4
line 1062
;1062:        s_graphicsoptions.ratio.generic.x        = 400;
ADDRGP4 s_graphicsoptions+1960+28
CNSTI4 400
ASGNI4
line 1063
;1063:        s_graphicsoptions.ratio.generic.y        = y;
ADDRGP4 s_graphicsoptions+1960+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1064
;1064:        s_graphicsoptions.ratio.itemnames        = ratios;
ADDRGP4 s_graphicsoptions+1960+104
ADDRGP4 ratios
ASGNP4
line 1065
;1065:        s_graphicsoptions.ratio.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+1960+76
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1066
;1066:        s_graphicsoptions.ratio.generic.id       = ID_RATIO;
ADDRGP4 s_graphicsoptions+1960+24
CNSTI4 110
ASGNI4
line 1067
;1067:        y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1071
;1068:
;1069:
;1070:	// references/modifies "r_mode"
;1071:	s_graphicsoptions.mode.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+2092
CNSTI4 3
ASGNI4
line 1072
;1072:	s_graphicsoptions.mode.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+2092+72
CNSTU4 258
ASGNU4
line 1073
;1073:	s_graphicsoptions.mode.generic.x        = 400;
ADDRGP4 s_graphicsoptions+2092+28
CNSTI4 400
ASGNI4
line 1074
;1074:	s_graphicsoptions.mode.generic.y        = y;
ADDRGP4 s_graphicsoptions+2092+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1075
;1075:	s_graphicsoptions.mode.itemnames        = resolutions;
ADDRGP4 s_graphicsoptions+2092+104
ADDRGP4 resolutions
INDIRP4
ASGNP4
line 1076
;1076:	s_graphicsoptions.mode.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+2092+76
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1077
;1077:	s_graphicsoptions.mode.generic.id       = ID_MODE;
ADDRGP4 s_graphicsoptions+2092+24
CNSTI4 104
ASGNI4
line 1078
;1078:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1081
;1079:
;1080:	// references/modifies "r_fullscreen"
;1081:	s_graphicsoptions.fs.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+2460
CNSTI4 3
ASGNI4
line 1082
;1082:	s_graphicsoptions.fs.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+2460+72
CNSTU4 258
ASGNU4
line 1083
;1083:	s_graphicsoptions.fs.generic.x	      = 400;
ADDRGP4 s_graphicsoptions+2460+28
CNSTI4 400
ASGNI4
line 1084
;1084:	s_graphicsoptions.fs.generic.y	      = y;
ADDRGP4 s_graphicsoptions+2460+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1085
;1085:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1088
;1086:
;1087:	// references/modifies "r_vertexLight"
;1088:	s_graphicsoptions.lighting.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+2592
CNSTI4 3
ASGNI4
line 1089
;1089:	s_graphicsoptions.lighting.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+2592+72
CNSTU4 258
ASGNU4
line 1090
;1090:	s_graphicsoptions.lighting.generic.x	 = 400;
ADDRGP4 s_graphicsoptions+2592+28
CNSTI4 400
ASGNI4
line 1091
;1091:	s_graphicsoptions.lighting.generic.y	 = y;
ADDRGP4 s_graphicsoptions+2592+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1092
;1092:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1095
;1093:        
;1094:        // references/modifies "r_flares"
;1095:	s_graphicsoptions.flares.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+2724
CNSTI4 3
ASGNI4
line 1096
;1096:	s_graphicsoptions.flares.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+2724+72
CNSTU4 258
ASGNU4
line 1097
;1097:	s_graphicsoptions.flares.generic.x	      = 400;
ADDRGP4 s_graphicsoptions+2724+28
CNSTI4 400
ASGNI4
line 1098
;1098:	s_graphicsoptions.flares.generic.y	      = y;
ADDRGP4 s_graphicsoptions+2724+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1099
;1099:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1102
;1100:        
;1101:        // references/modifies "r_postprocess"
;1102:	s_graphicsoptions.bloom.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+2856
CNSTI4 3
ASGNI4
line 1103
;1103:	s_graphicsoptions.bloom.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+2856+72
CNSTU4 258
ASGNU4
line 1104
;1104:	s_graphicsoptions.bloom.generic.x	      = 400;
ADDRGP4 s_graphicsoptions+2856+28
CNSTI4 400
ASGNI4
line 1105
;1105:	s_graphicsoptions.bloom.generic.y	      = y;
ADDRGP4 s_graphicsoptions+2856+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1106
;1106:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1108
;1107:
;1108:	s_graphicsoptions.drawfps.generic.type	  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+3780
CNSTI4 3
ASGNI4
line 1109
;1109:	s_graphicsoptions.drawfps.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+3780+72
CNSTU4 258
ASGNU4
line 1110
;1110:	s_graphicsoptions.drawfps.generic.x	      = 400;
ADDRGP4 s_graphicsoptions+3780+28
CNSTI4 400
ASGNI4
line 1111
;1111:	s_graphicsoptions.drawfps.generic.y	      = y;
ADDRGP4 s_graphicsoptions+3780+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1112
;1112:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1115
;1113:
;1114:	// references/modifies "r_lodBias" & "subdivisions"
;1115:	s_graphicsoptions.geometry.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+3252
CNSTI4 3
ASGNI4
line 1116
;1116:	s_graphicsoptions.geometry.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+3252+72
CNSTU4 258
ASGNU4
line 1117
;1117:	s_graphicsoptions.geometry.generic.x	 = 400;
ADDRGP4 s_graphicsoptions+3252+28
CNSTI4 400
ASGNI4
line 1118
;1118:	s_graphicsoptions.geometry.generic.y	 = y;
ADDRGP4 s_graphicsoptions+3252+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1119
;1119:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1122
;1120:
;1121:	// references/modifies "r_picmip"
;1122:	s_graphicsoptions.tq.generic.type	= MTYPE_SLIDER;
ADDRGP4 s_graphicsoptions+2356
CNSTI4 1
ASGNI4
line 1123
;1123:	s_graphicsoptions.tq.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+2356+72
CNSTU4 258
ASGNU4
line 1124
;1124:	s_graphicsoptions.tq.generic.x		= 400;
ADDRGP4 s_graphicsoptions+2356+28
CNSTI4 400
ASGNI4
line 1125
;1125:	s_graphicsoptions.tq.generic.y		= y;
ADDRGP4 s_graphicsoptions+2356+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1126
;1126:	s_graphicsoptions.tq.minvalue       = 0;
ADDRGP4 s_graphicsoptions+2356+88
CNSTF4 0
ASGNF4
line 1127
;1127:	s_graphicsoptions.tq.maxvalue       = 3;
ADDRGP4 s_graphicsoptions+2356+92
CNSTF4 1077936128
ASGNF4
line 1128
;1128:	s_graphicsoptions.tq.generic.callback = GraphicsOptions_TQEvent;
ADDRGP4 s_graphicsoptions+2356+76
ADDRGP4 GraphicsOptions_TQEvent
ASGNP4
line 1129
;1129:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1132
;1130:
;1131:	// references/modifies "r_textureBits"
;1132:	s_graphicsoptions.texturebits.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+3120
CNSTI4 3
ASGNI4
line 1133
;1133:	s_graphicsoptions.texturebits.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+3120+72
CNSTU4 258
ASGNU4
line 1134
;1134:	s_graphicsoptions.texturebits.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+3120+28
CNSTI4 400
ASGNI4
line 1135
;1135:	s_graphicsoptions.texturebits.generic.y	    = y;
ADDRGP4 s_graphicsoptions+3120+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1136
;1136:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1139
;1137:
;1138:	// references/modifies "r_textureMode"
;1139:	s_graphicsoptions.filter.generic.type   = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+3384
CNSTI4 3
ASGNI4
line 1140
;1140:	s_graphicsoptions.filter.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+3384+72
CNSTU4 258
ASGNU4
line 1141
;1141:	s_graphicsoptions.filter.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+3384+28
CNSTI4 400
ASGNI4
line 1142
;1142:	s_graphicsoptions.filter.generic.y	    = y;
ADDRGP4 s_graphicsoptions+3384+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1143
;1143:	y += 2+BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1145
;1144:        
;1145:    s_graphicsoptions.aniso.generic.type   = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+3516
CNSTI4 3
ASGNI4
line 1146
;1146:	s_graphicsoptions.aniso.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+3516+72
CNSTU4 258
ASGNU4
line 1147
;1147:	s_graphicsoptions.aniso.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+3516+28
CNSTI4 400
ASGNI4
line 1148
;1148:	s_graphicsoptions.aniso.generic.y	    = y;
ADDRGP4 s_graphicsoptions+3516+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1149
;1149:	y += 2*BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 1
LSHI4
ADDI4
ASGNI4
line 1151
;1150:	
;1151:    s_graphicsoptions.aniso2.generic.type   = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+3648
CNSTI4 3
ASGNI4
line 1152
;1152:	s_graphicsoptions.aniso2.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+3648+72
CNSTU4 258
ASGNU4
line 1153
;1153:	s_graphicsoptions.aniso2.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+3648+28
CNSTI4 400
ASGNI4
line 1154
;1154:	s_graphicsoptions.aniso2.generic.y	    = y;
ADDRGP4 s_graphicsoptions+3648+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1155
;1155:	y += 2*BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 1
LSHI4
ADDI4
ASGNI4
line 1157
;1156:
;1157:	s_graphicsoptions.driverinfo.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+3912
CNSTI4 9
ASGNI4
line 1158
;1158:	s_graphicsoptions.driverinfo.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+3912+72
CNSTU4 264
ASGNU4
line 1159
;1159:	s_graphicsoptions.driverinfo.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+3912+76
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1160
;1160:	s_graphicsoptions.driverinfo.generic.id       = ID_DRIVERINFO;
ADDRGP4 s_graphicsoptions+3912+24
CNSTI4 105
ASGNI4
line 1161
;1161:	s_graphicsoptions.driverinfo.generic.x        = 320;
ADDRGP4 s_graphicsoptions+3912+28
CNSTI4 320
ASGNI4
line 1162
;1162:	s_graphicsoptions.driverinfo.generic.y        = y;
ADDRGP4 s_graphicsoptions+3912+32
ADDRLP4 0
INDIRI4
ASGNI4
line 1163
;1163:	s_graphicsoptions.driverinfo.style            = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_graphicsoptions+3912+92
CNSTI4 17
ASGNI4
line 1164
;1164:	s_graphicsoptions.driverinfo.color            = color_red;
ADDRGP4 s_graphicsoptions+3912+100
ADDRGP4 color_red
ASGNP4
line 1165
;1165:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1167
;1166:
;1167:	s_graphicsoptions.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+4132
CNSTI4 6
ASGNI4
line 1168
;1168:	s_graphicsoptions.back.generic.name     = GRAPHICSOPTIONS_BACK0;
ADDRGP4 s_graphicsoptions+4132+4
ADDRGP4 $82
ASGNP4
line 1169
;1169:	s_graphicsoptions.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+4132+72
CNSTU4 260
ASGNU4
line 1170
;1170:	s_graphicsoptions.back.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+4132+76
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 1171
;1171:	s_graphicsoptions.back.generic.id	    = ID_BACK2;
ADDRGP4 s_graphicsoptions+4132+24
CNSTI4 101
ASGNI4
line 1172
;1172:	s_graphicsoptions.back.generic.x		= 0 - uis.wideoffset;
ADDRGP4 s_graphicsoptions+4132+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1173
;1173:	s_graphicsoptions.back.generic.y		= 480-64;
ADDRGP4 s_graphicsoptions+4132+32
CNSTI4 416
ASGNI4
line 1174
;1174:	s_graphicsoptions.back.width  		    = 128;
ADDRGP4 s_graphicsoptions+4132+104
CNSTI4 128
ASGNI4
line 1175
;1175:	s_graphicsoptions.back.height  		    = 64;
ADDRGP4 s_graphicsoptions+4132+108
CNSTI4 64
ASGNI4
line 1176
;1176:	s_graphicsoptions.back.focuspic         = GRAPHICSOPTIONS_BACK1;
ADDRGP4 s_graphicsoptions+4132+88
ADDRGP4 $83
ASGNP4
line 1178
;1177:
;1178:	s_graphicsoptions.apply.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+4016
CNSTI4 6
ASGNI4
line 1179
;1179:	s_graphicsoptions.apply.generic.name     = GRAPHICSOPTIONS_ACCEPT0;
ADDRGP4 s_graphicsoptions+4016+4
ADDRGP4 $1077
ASGNP4
line 1180
;1180:	s_graphicsoptions.apply.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_HIDDEN|QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+4016+72
CNSTU4 20752
ASGNU4
line 1181
;1181:	s_graphicsoptions.apply.generic.callback = GraphicsOptions_ApplyChanges;
ADDRGP4 s_graphicsoptions+4016+76
ADDRGP4 GraphicsOptions_ApplyChanges
ASGNP4
line 1182
;1182:	s_graphicsoptions.apply.generic.x        = 640 + uis.wideoffset;
ADDRGP4 s_graphicsoptions+4016+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 1183
;1183:	s_graphicsoptions.apply.generic.y        = 480-64;
ADDRGP4 s_graphicsoptions+4016+32
CNSTI4 416
ASGNI4
line 1184
;1184:	s_graphicsoptions.apply.width  		     = 128;
ADDRGP4 s_graphicsoptions+4016+104
CNSTI4 128
ASGNI4
line 1185
;1185:	s_graphicsoptions.apply.height  		 = 64;
ADDRGP4 s_graphicsoptions+4016+108
CNSTI4 64
ASGNI4
line 1186
;1186:	s_graphicsoptions.apply.focuspic         = GRAPHICSOPTIONS_ACCEPT1;
ADDRGP4 s_graphicsoptions+4016+88
ADDRGP4 $1093
ASGNP4
line 1188
;1187:	
;1188:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1094
line 1189
;1189:	s_driverinfo.banner.string		  = "DRIVER INFO";
ADDRGP4 s_driverinfo+1076+88
ADDRGP4 $1099
ASGNP4
line 1190
;1190:	s_graphicsoptions.banner.string  	   = "SYSTEM SETUP";
ADDRGP4 s_graphicsoptions+1076+88
ADDRGP4 $1102
ASGNP4
line 1191
;1191:	s_graphicsoptions.graphics.string			= "GRAPHICS";
ADDRGP4 s_graphicsoptions+1412+88
ADDRGP4 $1105
ASGNP4
line 1192
;1192:	s_graphicsoptions.display.string			= "DISPLAY";
ADDRGP4 s_graphicsoptions+1516+88
ADDRGP4 $1108
ASGNP4
line 1193
;1193:	s_graphicsoptions.sound.string				= "SOUND";
ADDRGP4 s_graphicsoptions+1620+88
ADDRGP4 $1111
ASGNP4
line 1194
;1194:	s_graphicsoptions.network.string			= "NETWORK";
ADDRGP4 s_graphicsoptions+1724+88
ADDRGP4 $1114
ASGNP4
line 1195
;1195:	s_graphicsoptions.list.generic.name     = "Graphics Settings:";
ADDRGP4 s_graphicsoptions+1828+4
ADDRGP4 $1117
ASGNP4
line 1196
;1196:	s_graphicsoptions.list.itemnames        = s_graphics_options_names;
ADDRGP4 s_graphicsoptions+1828+104
ADDRGP4 $739
ASGNP4
line 1197
;1197:	s_graphicsoptions.driver.generic.name  = "Graphics API:";
ADDRGP4 s_graphicsoptions+2224+4
ADDRGP4 $1122
ASGNP4
line 1198
;1198:	s_graphicsoptions.allow_extensions.generic.name	    = "GL Extensions:";
ADDRGP4 s_graphicsoptions+2988+4
ADDRGP4 $1125
ASGNP4
line 1199
;1199:	s_graphicsoptions.allow_extensions.itemnames        = enabled_names;
ADDRGP4 s_graphicsoptions+2988+104
ADDRGP4 $775
ASGNP4
line 1200
;1200:	s_graphicsoptions.ratio.generic.name     = "Aspect Ratio:";
ADDRGP4 s_graphicsoptions+1960+4
ADDRGP4 $1130
ASGNP4
line 1201
;1201:	s_graphicsoptions.mode.generic.name     = "Window resolution:";
ADDRGP4 s_graphicsoptions+2092+4
ADDRGP4 $1133
ASGNP4
line 1202
;1202:	s_graphicsoptions.fs.generic.name	  = "Fullscreen:";
ADDRGP4 s_graphicsoptions+2460+4
ADDRGP4 $1136
ASGNP4
line 1203
;1203:	s_graphicsoptions.fs.itemnames	      = enabled_names;
ADDRGP4 s_graphicsoptions+2460+104
ADDRGP4 $775
ASGNP4
line 1204
;1204:	s_graphicsoptions.lighting.generic.name	 = "Environment effects:";
ADDRGP4 s_graphicsoptions+2592+4
ADDRGP4 $1141
ASGNP4
line 1205
;1205:	s_graphicsoptions.lighting.itemnames     = lighting_names;
ADDRGP4 s_graphicsoptions+2592+104
ADDRGP4 $753
ASGNP4
line 1206
;1206:	s_graphicsoptions.flares.generic.name	  = "High quality lighting:";
ADDRGP4 s_graphicsoptions+2724+4
ADDRGP4 $1146
ASGNP4
line 1207
;1207:	s_graphicsoptions.flares.itemnames	      = enabled_names;
ADDRGP4 s_graphicsoptions+2724+104
ADDRGP4 $775
ASGNP4
line 1208
;1208:	s_graphicsoptions.bloom.generic.name	  = "Bloom:";
ADDRGP4 s_graphicsoptions+2856+4
ADDRGP4 $1151
ASGNP4
line 1209
;1209:	s_graphicsoptions.bloom.itemnames	      = enabled_names;
ADDRGP4 s_graphicsoptions+2856+104
ADDRGP4 $775
ASGNP4
line 1210
;1210:	s_graphicsoptions.drawfps.generic.name	  = "HDR:";
ADDRGP4 s_graphicsoptions+3780+4
ADDRGP4 $1156
ASGNP4
line 1211
;1211:	s_graphicsoptions.drawfps.itemnames	      = enabled_names;
ADDRGP4 s_graphicsoptions+3780+104
ADDRGP4 $775
ASGNP4
line 1212
;1212:	s_graphicsoptions.geometry.generic.name	 = "Bloom level:";
ADDRGP4 s_graphicsoptions+3252+4
ADDRGP4 $1161
ASGNP4
line 1213
;1213:	s_graphicsoptions.geometry.itemnames     = quality_names;
ADDRGP4 s_graphicsoptions+3252+104
ADDRGP4 $770
ASGNP4
line 1214
;1214:	s_graphicsoptions.tq.generic.name	= "Texture Detail:";
ADDRGP4 s_graphicsoptions+2356+4
ADDRGP4 $1166
ASGNP4
line 1215
;1215:	s_graphicsoptions.texturebits.generic.name	= "Texture Quality:";
ADDRGP4 s_graphicsoptions+3120+4
ADDRGP4 $1169
ASGNP4
line 1216
;1216:	s_graphicsoptions.texturebits.itemnames     = tq_names;
ADDRGP4 s_graphicsoptions+3120+104
ADDRGP4 $731
ASGNP4
line 1217
;1217:	s_graphicsoptions.filter.generic.name	= "Texture Filter:";
ADDRGP4 s_graphicsoptions+3384+4
ADDRGP4 $1174
ASGNP4
line 1218
;1218:	s_graphicsoptions.filter.itemnames      = filter_names;
ADDRGP4 s_graphicsoptions+3384+104
ADDRGP4 $758
ASGNP4
line 1219
;1219:	s_graphicsoptions.aniso.generic.name	= "Anisotropy:";
ADDRGP4 s_graphicsoptions+3516+4
ADDRGP4 $1179
ASGNP4
line 1220
;1220:	s_graphicsoptions.aniso.itemnames      = aniso_names;
ADDRGP4 s_graphicsoptions+3516+104
ADDRGP4 $764
ASGNP4
line 1221
;1221:	s_graphicsoptions.aniso2.generic.name	= "Anti-Aliasing:";
ADDRGP4 s_graphicsoptions+3648+4
ADDRGP4 $1184
ASGNP4
line 1222
;1222:	s_graphicsoptions.aniso2.itemnames      = aniso_names;
ADDRGP4 s_graphicsoptions+3648+104
ADDRGP4 $764
ASGNP4
line 1223
;1223:	s_graphicsoptions.driverinfo.string           = "Driver Info";	
ADDRGP4 s_graphicsoptions+3912+88
ADDRGP4 $1189
ASGNP4
line 1224
;1224:	}
LABELV $1094
line 1225
;1225:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1190
line 1226
;1226:	s_driverinfo.banner.string		  = "ИНФОРМАЦИЯ О ДРАЙВЕРЕ";
ADDRGP4 s_driverinfo+1076+88
ADDRGP4 $1195
ASGNP4
line 1227
;1227:	s_graphicsoptions.banner.string  	   = "СИСТЕМНЫЕ НАСТРОЙКИ";
ADDRGP4 s_graphicsoptions+1076+88
ADDRGP4 $1198
ASGNP4
line 1228
;1228:	s_graphicsoptions.graphics.string			= "ГРАФИКА";
ADDRGP4 s_graphicsoptions+1412+88
ADDRGP4 $1201
ASGNP4
line 1229
;1229:	s_graphicsoptions.display.string			= "ЭКРАН";
ADDRGP4 s_graphicsoptions+1516+88
ADDRGP4 $1204
ASGNP4
line 1230
;1230:	s_graphicsoptions.sound.string				= "ЗВУК";
ADDRGP4 s_graphicsoptions+1620+88
ADDRGP4 $1207
ASGNP4
line 1231
;1231:	s_graphicsoptions.network.string			= "СЕТЬ";
ADDRGP4 s_graphicsoptions+1724+88
ADDRGP4 $1210
ASGNP4
line 1232
;1232:	s_graphicsoptions.list.generic.name     = "Графические Настройки:";
ADDRGP4 s_graphicsoptions+1828+4
ADDRGP4 $1213
ASGNP4
line 1233
;1233:	s_graphicsoptions.list.itemnames        = s_graphics_options_namesru;
ADDRGP4 s_graphicsoptions+1828+104
ADDRGP4 $746
ASGNP4
line 1234
;1234:	s_graphicsoptions.driver.generic.name  = "Графический API:";
ADDRGP4 s_graphicsoptions+2224+4
ADDRGP4 $1218
ASGNP4
line 1235
;1235:	s_graphicsoptions.allow_extensions.generic.name	    = "GL Расширения:";
ADDRGP4 s_graphicsoptions+2988+4
ADDRGP4 $1221
ASGNP4
line 1236
;1236:	s_graphicsoptions.allow_extensions.itemnames        = enabled_namesru;
ADDRGP4 s_graphicsoptions+2988+104
ADDRGP4 $777
ASGNP4
line 1237
;1237:	s_graphicsoptions.ratio.generic.name     = "Соотношение Сторон:";
ADDRGP4 s_graphicsoptions+1960+4
ADDRGP4 $1226
ASGNP4
line 1238
;1238:	s_graphicsoptions.mode.generic.name     = "Разрешение окна:";
ADDRGP4 s_graphicsoptions+2092+4
ADDRGP4 $1229
ASGNP4
line 1239
;1239:	s_graphicsoptions.fs.generic.name	  = "Полный экран:";
ADDRGP4 s_graphicsoptions+2460+4
ADDRGP4 $1232
ASGNP4
line 1240
;1240:	s_graphicsoptions.fs.itemnames	      = enabled_namesru;
ADDRGP4 s_graphicsoptions+2460+104
ADDRGP4 $777
ASGNP4
line 1241
;1241:	s_graphicsoptions.lighting.generic.name	 = "Эффекты окружения:";
ADDRGP4 s_graphicsoptions+2592+4
ADDRGP4 $1237
ASGNP4
line 1242
;1242:	s_graphicsoptions.lighting.itemnames     = lighting_namesru;
ADDRGP4 s_graphicsoptions+2592+104
ADDRGP4 $757
ASGNP4
line 1243
;1243:	s_graphicsoptions.flares.generic.name	  = "Качественное освещение:";
ADDRGP4 s_graphicsoptions+2724+4
ADDRGP4 $1242
ASGNP4
line 1244
;1244:	s_graphicsoptions.flares.itemnames	      = enabled_namesru;
ADDRGP4 s_graphicsoptions+2724+104
ADDRGP4 $777
ASGNP4
line 1245
;1245:	s_graphicsoptions.bloom.generic.name	  = "Свечение:";
ADDRGP4 s_graphicsoptions+2856+4
ADDRGP4 $1247
ASGNP4
line 1246
;1246:	s_graphicsoptions.bloom.itemnames	      = enabled_namesru;
ADDRGP4 s_graphicsoptions+2856+104
ADDRGP4 $777
ASGNP4
line 1247
;1247:	s_graphicsoptions.drawfps.generic.name	  = "HDR:";
ADDRGP4 s_graphicsoptions+3780+4
ADDRGP4 $1156
ASGNP4
line 1248
;1248:	s_graphicsoptions.drawfps.itemnames	      = enabled_namesru;
ADDRGP4 s_graphicsoptions+3780+104
ADDRGP4 $777
ASGNP4
line 1249
;1249:	s_graphicsoptions.geometry.generic.name	 = "Сила свечения:";
ADDRGP4 s_graphicsoptions+3252+4
ADDRGP4 $1256
ASGNP4
line 1250
;1250:	s_graphicsoptions.geometry.itemnames     = quality_namesru;
ADDRGP4 s_graphicsoptions+3252+104
ADDRGP4 $771
ASGNP4
line 1251
;1251:	s_graphicsoptions.tq.generic.name	= "Детализация текстур:";
ADDRGP4 s_graphicsoptions+2356+4
ADDRGP4 $1261
ASGNP4
line 1252
;1252:	s_graphicsoptions.texturebits.generic.name	= "Качество текстур:";
ADDRGP4 s_graphicsoptions+3120+4
ADDRGP4 $1264
ASGNP4
line 1253
;1253:	s_graphicsoptions.texturebits.itemnames     = tq_namesru;
ADDRGP4 s_graphicsoptions+3120+104
ADDRGP4 $735
ASGNP4
line 1254
;1254:	s_graphicsoptions.filter.generic.name	= "Текстурный фильтр:";
ADDRGP4 s_graphicsoptions+3384+4
ADDRGP4 $1269
ASGNP4
line 1255
;1255:	s_graphicsoptions.filter.itemnames      = filter_namesru;
ADDRGP4 s_graphicsoptions+3384+104
ADDRGP4 $761
ASGNP4
line 1256
;1256:	s_graphicsoptions.aniso.generic.name	= "Анизотропная фильтрация:";
ADDRGP4 s_graphicsoptions+3516+4
ADDRGP4 $1274
ASGNP4
line 1257
;1257:	s_graphicsoptions.aniso.itemnames      = aniso_namesru;
ADDRGP4 s_graphicsoptions+3516+104
ADDRGP4 $769
ASGNP4
line 1258
;1258:	s_graphicsoptions.aniso2.generic.name	= "Сглаживание:";
ADDRGP4 s_graphicsoptions+3648+4
ADDRGP4 $1279
ASGNP4
line 1259
;1259:	s_graphicsoptions.aniso2.itemnames      = aniso_namesru;
ADDRGP4 s_graphicsoptions+3648+104
ADDRGP4 $769
ASGNP4
line 1260
;1260:	s_graphicsoptions.driverinfo.string           = "Информация о драйвере";	
ADDRGP4 s_graphicsoptions+3912+88
ADDRGP4 $1284
ASGNP4
line 1261
;1261:	}
LABELV $1190
line 1263
;1262:
;1263:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.banner );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1264
;1264:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.framel );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1265
;1265:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.framer );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1267
;1266:
;1267:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.graphics );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1268
;1268:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.display );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1516
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1269
;1269:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.sound );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1620
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1270
;1270:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.network );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1272
;1271:
;1272:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.list );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1828
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1274
;1273:	//Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.driver );
;1274:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.allow_extensions );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2988
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1275
;1275:    Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.ratio );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1960
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1276
;1276:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.mode );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2092
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1277
;1277:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.fs );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2460
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1278
;1278:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.lighting );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1279
;1279:    Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.flares );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2724
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1280
;1280:    Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.bloom );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2856
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1281
;1281:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.drawfps );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+3780
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1282
;1282:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.geometry );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+3252
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1283
;1283:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.tq );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2356
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1284
;1284:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.texturebits );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+3120
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1285
;1285:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.filter );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+3384
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1286
;1286:    Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.aniso );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+3516
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1287
;1287:    Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.aniso2 );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+3648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1288
;1288:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.driverinfo );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+3912
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1290
;1289:
;1290:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.back );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+4132
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1291
;1291:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.apply );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+4016
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1293
;1292:
;1293:	GraphicsOptions_SetMenuItems();
ADDRGP4 GraphicsOptions_SetMenuItems
CALLV
pop
line 1294
;1294:	GraphicsOptions_GetInitialVideo();
ADDRGP4 GraphicsOptions_GetInitialVideo
CALLV
pop
line 1297
;1295:
;1296:	//s_graphicsoptions.driver.generic.flags |= QMF_HIDDEN|QMF_INACTIVE;
;1297:}
LABELV $727
endproc GraphicsOptions_MenuInit 4 12
export GraphicsOptions_Cache
proc GraphicsOptions_Cache 0 4
line 1305
;1298:
;1299:
;1300:/*
;1301:=================
;1302:GraphicsOptions_Cache
;1303:=================
;1304:*/
;1305:void GraphicsOptions_Cache( void ) {
line 1306
;1306:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_FRAMEL );
ADDRGP4 $80
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1307
;1307:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_FRAMER );
ADDRGP4 $81
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1308
;1308:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_BACK0 );
ADDRGP4 $82
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1309
;1309:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_BACK1 );
ADDRGP4 $83
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1310
;1310:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_ACCEPT0 );
ADDRGP4 $1077
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1311
;1311:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_ACCEPT1 );
ADDRGP4 $1093
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1312
;1312:}
LABELV $1310
endproc GraphicsOptions_Cache 0 4
export UI_GraphicsOptionsMenu
proc UI_GraphicsOptionsMenu 0 8
line 1320
;1313:
;1314:
;1315:/*
;1316:=================
;1317:UI_GraphicsOptionsMenu
;1318:=================
;1319:*/
;1320:void UI_GraphicsOptionsMenu( void ) {
line 1321
;1321:	GraphicsOptions_MenuInit();
ADDRGP4 GraphicsOptions_MenuInit
CALLV
pop
line 1322
;1322:	UI_PushMenu( &s_graphicsoptions.menu );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1323
;1323:	Menu_SetCursorToItem( &s_graphicsoptions.menu, &s_graphicsoptions.graphics );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1412
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 1324
;1324:}
LABELV $1311
endproc UI_GraphicsOptionsMenu 0 8
bss
align 1
LABELV currentResolution
skip 20
align 4
LABELV detectedResolutions
skip 128
align 1
LABELV resbuf
skip 1024
align 4
LABELV resToRatio
skip 128
align 4
LABELV ratioToRes
skip 128
align 1
LABELV ratioBuf
skip 256
align 4
LABELV ratios
skip 128
align 4
LABELV s_graphicsoptions
skip 4248
align 4
LABELV s_ivo
skip 56
align 4
LABELV s_driverinfo
skip 2812
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
LABELV $1284
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
byte 1 180
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
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $1279
byte 1 208
byte 1 161
byte 1 208
byte 1 179
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 182
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
LABELV $1274
byte 1 208
byte 1 144
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 191
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 184
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
byte 1 209
byte 1 134
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 58
byte 1 0
align 1
LABELV $1269
byte 1 208
byte 1 162
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 209
byte 1 128
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 58
byte 1 0
align 1
LABELV $1264
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
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 209
byte 1 128
byte 1 58
byte 1 0
align 1
LABELV $1261
byte 1 208
byte 1 148
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 187
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
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 209
byte 1 128
byte 1 58
byte 1 0
align 1
LABELV $1256
byte 1 208
byte 1 161
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 135
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
LABELV $1247
byte 1 208
byte 1 161
byte 1 208
byte 1 178
byte 1 208
byte 1 181
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
LABELV $1242
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
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 189
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
LABELV $1237
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
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 209
byte 1 131
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
byte 1 58
byte 1 0
align 1
LABELV $1232
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
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
byte 1 58
byte 1 0
align 1
LABELV $1229
byte 1 208
byte 1 160
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 209
byte 1 136
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
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $1226
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 209
byte 1 136
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
byte 1 58
byte 1 0
align 1
LABELV $1221
byte 1 71
byte 1 76
byte 1 32
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
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 58
byte 1 0
align 1
LABELV $1218
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
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 32
byte 1 65
byte 1 80
byte 1 73
byte 1 58
byte 1 0
align 1
LABELV $1213
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
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
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
byte 1 58
byte 1 0
align 1
LABELV $1210
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
LABELV $1207
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
LABELV $1204
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
LABELV $1201
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
LABELV $1198
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
LABELV $1195
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
byte 1 148
byte 1 208
byte 1 160
byte 1 208
byte 1 144
byte 1 208
byte 1 153
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
LABELV $1189
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $1184
byte 1 65
byte 1 110
byte 1 116
byte 1 105
byte 1 45
byte 1 65
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $1179
byte 1 65
byte 1 110
byte 1 105
byte 1 115
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 112
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $1174
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1169
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
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
LABELV $1166
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $1161
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 109
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $1156
byte 1 72
byte 1 68
byte 1 82
byte 1 58
byte 1 0
align 1
LABELV $1151
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 109
byte 1 58
byte 1 0
align 1
LABELV $1146
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 32
byte 1 113
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $1141
byte 1 69
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 110
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 101
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1136
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
byte 1 58
byte 1 0
align 1
LABELV $1133
byte 1 87
byte 1 105
byte 1 110
byte 1 100
byte 1 111
byte 1 119
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 111
byte 1 108
byte 1 117
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $1130
byte 1 65
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 82
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $1125
byte 1 71
byte 1 76
byte 1 32
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1122
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 65
byte 1 80
byte 1 73
byte 1 58
byte 1 0
align 1
LABELV $1117
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 83
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1114
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $1111
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $1108
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $1105
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
LABELV $1102
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
LABELV $1099
byte 1 68
byte 1 82
byte 1 73
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
LABELV $1093
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
LABELV $1077
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
LABELV $778
byte 1 208
byte 1 146
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 0
align 1
LABELV $776
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $774
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
LABELV $773
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
LABELV $772
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
LABELV $768
byte 1 56
byte 1 120
byte 1 0
align 1
LABELV $767
byte 1 54
byte 1 120
byte 1 0
align 1
LABELV $766
byte 1 52
byte 1 120
byte 1 0
align 1
LABELV $765
byte 1 50
byte 1 120
byte 1 0
align 1
LABELV $763
byte 1 208
byte 1 162
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 185
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $762
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 0
align 1
LABELV $760
byte 1 84
byte 1 114
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $759
byte 1 79
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $756
byte 1 76
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $755
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $754
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $752
byte 1 208
byte 1 161
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $751
byte 1 208
byte 1 156
byte 1 208
byte 1 184
byte 1 208
byte 1 189
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
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $750
byte 1 208
byte 1 157
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $749
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
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $748
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
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $747
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
LABELV $745
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $744
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $743
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $742
byte 1 78
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $741
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
byte 1 0
align 1
LABELV $740
byte 1 86
byte 1 101
byte 1 114
byte 1 121
byte 1 32
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
byte 1 0
align 1
LABELV $738
byte 1 51
byte 1 50
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $737
byte 1 49
byte 1 54
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $736
byte 1 208
byte 1 161
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
byte 1 0
align 1
LABELV $734
byte 1 51
byte 1 50
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $733
byte 1 49
byte 1 54
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $732
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $730
byte 1 118
byte 1 117
byte 1 108
byte 1 99
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $729
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 103
byte 1 108
byte 1 0
align 1
LABELV $578
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
LABELV $577
byte 1 71
byte 1 76
byte 1 95
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 0
align 1
LABELV $576
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $575
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $566
byte 1 114
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $559
byte 1 114
byte 1 95
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 115
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $558
byte 1 114
byte 1 95
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 115
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 112
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $555
byte 1 114
byte 1 95
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 115
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 112
byte 1 121
byte 1 0
align 1
LABELV $548
byte 1 114
byte 1 95
byte 1 104
byte 1 100
byte 1 114
byte 1 0
align 1
LABELV $545
byte 1 114
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $542
byte 1 114
byte 1 95
byte 1 100
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $533
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 116
byte 1 109
byte 1 111
byte 1 115
byte 1 112
byte 1 104
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $526
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $525
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
byte 1 0
align 1
LABELV $518
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $515
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
LABELV $512
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $268
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $262
byte 1 49
byte 1 54
byte 1 58
byte 1 57
byte 1 0
align 1
LABELV $261
byte 1 49
byte 1 46
byte 1 55
byte 1 56
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $260
byte 1 53
byte 1 58
byte 1 51
byte 1 0
align 1
LABELV $259
byte 1 49
byte 1 46
byte 1 54
byte 1 55
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $258
byte 1 49
byte 1 54
byte 1 58
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $257
byte 1 49
byte 1 46
byte 1 54
byte 1 48
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $256
byte 1 49
byte 1 52
byte 1 58
byte 1 57
byte 1 0
align 1
LABELV $255
byte 1 49
byte 1 46
byte 1 53
byte 1 54
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $254
byte 1 51
byte 1 58
byte 1 50
byte 1 0
align 1
LABELV $253
byte 1 49
byte 1 46
byte 1 53
byte 1 48
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $252
byte 1 52
byte 1 58
byte 1 51
byte 1 0
align 1
LABELV $251
byte 1 49
byte 1 46
byte 1 51
byte 1 51
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $250
byte 1 53
byte 1 58
byte 1 52
byte 1 0
align 1
LABELV $249
byte 1 49
byte 1 46
byte 1 50
byte 1 53
byte 1 58
byte 1 49
byte 1 0
align 1
LABELV $248
byte 1 52
byte 1 48
byte 1 57
byte 1 54
byte 1 120
byte 1 50
byte 1 49
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $247
byte 1 51
byte 1 56
byte 1 52
byte 1 48
byte 1 120
byte 1 50
byte 1 49
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $246
byte 1 51
byte 1 52
byte 1 52
byte 1 48
byte 1 120
byte 1 49
byte 1 52
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $245
byte 1 50
byte 1 53
byte 1 54
byte 1 48
byte 1 120
byte 1 49
byte 1 48
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $244
byte 1 49
byte 1 57
byte 1 50
byte 1 48
byte 1 120
byte 1 49
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $243
byte 1 49
byte 1 57
byte 1 50
byte 1 48
byte 1 120
byte 1 49
byte 1 48
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $242
byte 1 49
byte 1 54
byte 1 56
byte 1 48
byte 1 120
byte 1 49
byte 1 48
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $241
byte 1 49
byte 1 54
byte 1 48
byte 1 48
byte 1 120
byte 1 57
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $240
byte 1 49
byte 1 52
byte 1 52
byte 1 48
byte 1 120
byte 1 57
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $239
byte 1 49
byte 1 51
byte 1 54
byte 1 54
byte 1 120
byte 1 55
byte 1 54
byte 1 56
byte 1 0
align 1
LABELV $238
byte 1 49
byte 1 50
byte 1 56
byte 1 48
byte 1 120
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $237
byte 1 49
byte 1 50
byte 1 56
byte 1 48
byte 1 120
byte 1 55
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $236
byte 1 49
byte 1 50
byte 1 56
byte 1 48
byte 1 120
byte 1 57
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $235
byte 1 56
byte 1 53
byte 1 54
byte 1 120
byte 1 52
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $234
byte 1 50
byte 1 48
byte 1 52
byte 1 56
byte 1 120
byte 1 49
byte 1 53
byte 1 51
byte 1 54
byte 1 0
align 1
LABELV $233
byte 1 49
byte 1 54
byte 1 48
byte 1 48
byte 1 120
byte 1 49
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $232
byte 1 49
byte 1 50
byte 1 56
byte 1 48
byte 1 120
byte 1 49
byte 1 48
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $231
byte 1 49
byte 1 49
byte 1 53
byte 1 50
byte 1 120
byte 1 56
byte 1 54
byte 1 52
byte 1 0
align 1
LABELV $230
byte 1 49
byte 1 48
byte 1 50
byte 1 52
byte 1 120
byte 1 55
byte 1 54
byte 1 56
byte 1 0
align 1
LABELV $229
byte 1 57
byte 1 54
byte 1 48
byte 1 120
byte 1 55
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $228
byte 1 56
byte 1 48
byte 1 48
byte 1 120
byte 1 54
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $227
byte 1 54
byte 1 52
byte 1 48
byte 1 120
byte 1 52
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $226
byte 1 53
byte 1 49
byte 1 50
byte 1 120
byte 1 51
byte 1 56
byte 1 52
byte 1 0
align 1
LABELV $225
byte 1 52
byte 1 48
byte 1 48
byte 1 120
byte 1 51
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $224
byte 1 51
byte 1 50
byte 1 48
byte 1 120
byte 1 50
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $101
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 90
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $95
byte 1 69
byte 1 88
byte 1 84
byte 1 69
byte 1 78
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $94
byte 1 80
byte 1 73
byte 1 88
byte 1 69
byte 1 76
byte 1 70
byte 1 79
byte 1 82
byte 1 77
byte 1 65
byte 1 84
byte 1 0
align 1
LABELV $93
byte 1 86
byte 1 69
byte 1 78
byte 1 68
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $83
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
LABELV $82
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
LABELV $81
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
LABELV $80
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
