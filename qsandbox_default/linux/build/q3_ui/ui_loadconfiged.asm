code
proc loadMapEd_MenuEvent 12 8
file "../../../code/q3_ui/ui_loadconfiged.c"
line 86
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
;23:/*
;24:=============================================================================
;25:
;26:LOAD CONFIG MENU
;27:
;28:=============================================================================
;29:*/
;30:
;31:#include "ui_local.h"
;32:
;33:
;34:#define ART_BACK0			"menu/art/back_0"
;35:#define ART_BACK1			"menu/art/back_1"
;36:#define ART_FIGHT0			"menu/art/load_0"
;37:#define ART_FIGHT1			"menu/art/load_1"
;38:#define ART_FRAMEL			"menu/art/frame2_l"
;39:#define ART_FRAMER			"menu/art/frame1_r"
;40:#define ART_ARROWS			"menu/art/arrows_horz_0"
;41:#define ART_ARROWLEFT		"menu/art/arrows_horz_left"
;42:#define ART_ARROWRIGHT		"menu/art/arrows_horz_right"
;43:#define ART_BACKGROUND		"menu/art/cut_frame"
;44:
;45:#define MAX_MAPFILES		4096
;46:#define MAPNAMEBUFSIZE			( MAX_MAPFILES * 16 )
;47:
;48:#define ID_BACK				10
;49:#define ID_GO				11
;50:#define ID_LIST				12
;51:#define ID_LEFT				13
;52:#define ID_RIGHT			14
;53:
;54:#define ARROWS_WIDTH		128
;55:#define ARROWS_HEIGHT		48
;56:
;57:
;58:typedef struct {
;59:	menuframework_s	menu;
;60:
;61:	menutext_s		banner;
;62:	menubitmap_s	framel;
;63:	menubitmap_s	framer;
;64:
;65:	menulist_s		list;
;66:
;67:	menubitmap_s	arrows;
;68:	menubitmap_s	left;
;69:	menubitmap_s	right;
;70:	menubitmap_s	back;
;71:	menubitmap_s	go;
;72:	menubitmap_s	background;
;73:
;74:	char			names[524288];
;75:	char*			configlist[65536];
;76:} s_loadMapEd_t;
;77:
;78:static s_loadMapEd_t	s_loadMapEd;
;79:
;80:
;81:/*
;82:===============
;83:loadMapEd_MenuEvent
;84:===============
;85:*/
;86:static void loadMapEd_MenuEvent( void *ptr, int event ) {
line 88
;87:
;88:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 89
;89:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 92
;90:	}
;91:
;92:	switch ( ((menucommon_s*)ptr)->id ) {
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
ADDRGP4 $98-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $98
address $93
address $87
address $84
address $94
address $96
code
LABELV $87
line 94
;93:	case ID_GO:
;94:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "loadmap maps/%s.add\n", s_loadMapEd.list.itemnames[s_loadMapEd.list.curvalue] ) );
ADDRGP4 $88
ARGP4
ADDRGP4 s_loadMapEd+1412+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_loadMapEd+1412+104
INDIRP4
ADDP4
INDIRP4
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
line 95
;95:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 96
;96:		break;
ADDRGP4 $85
JUMPV
LABELV $93
line 99
;97:
;98:	case ID_BACK:
;99:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 100
;100:		break;
ADDRGP4 $85
JUMPV
LABELV $94
line 103
;101:
;102:	case ID_LEFT:
;103:		ScrollList_Key( &s_loadMapEd.list, K_LEFTARROW );
ADDRGP4 s_loadMapEd+1412
ARGP4
CNSTI4 134
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 104
;104:		break;
ADDRGP4 $85
JUMPV
LABELV $96
line 107
;105:
;106:	case ID_RIGHT:
;107:		ScrollList_Key( &s_loadMapEd.list, K_RIGHTARROW );
ADDRGP4 s_loadMapEd+1412
ARGP4
CNSTI4 135
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 108
;108:		break;
LABELV $84
LABELV $85
line 110
;109:	}
;110:}
LABELV $81
endproc loadMapEd_MenuEvent 12 8
proc loadMapEd_MenuInit 24 16
line 118
;111:
;112:
;113:/*
;114:===============
;115:loadMapEd_MenuInit
;116:===============
;117:*/
;118:static void loadMapEd_MenuInit( void ) {
line 123
;119:	int		i;
;120:	int		len;
;121:	char	*configname;
;122:
;123:	UI_loadMapEd_Cache();
ADDRGP4 UI_loadMapEd_Cache
CALLV
pop
line 125
;124:
;125:	memset( &s_loadMapEd, 0 ,sizeof(s_loadMapEd_t) );
ADDRGP4 s_loadMapEd
ARGP4
CNSTI4 0
ARGI4
CNSTI4 788672
ARGI4
ADDRGP4 memset
CALLP4
pop
line 126
;126:	s_loadMapEd.menu.wrapAround = qtrue;
ADDRGP4 s_loadMapEd+1044
CNSTI4 1
ASGNI4
line 127
;127:	s_loadMapEd.menu.native 	= qfalse;
ADDRGP4 s_loadMapEd+1056
CNSTI4 0
ASGNI4
line 128
;128:	s_loadMapEd.menu.fullscreen = qfalse;
ADDRGP4 s_loadMapEd+1052
CNSTI4 0
ASGNI4
line 130
;129:
;130:	s_loadMapEd.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 s_loadMapEd+1076
CNSTI4 10
ASGNI4
line 131
;131:	s_loadMapEd.banner.generic.x		= 320;
ADDRGP4 s_loadMapEd+1076+28
CNSTI4 320
ASGNI4
line 132
;132:	s_loadMapEd.banner.generic.y		= 16;
ADDRGP4 s_loadMapEd+1076+32
CNSTI4 16
ASGNI4
line 133
;133:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $109
line 134
;134:	s_loadMapEd.banner.string			= "Load Map";
ADDRGP4 s_loadMapEd+1076+88
ADDRGP4 $114
ASGNP4
line 135
;135:	}
LABELV $109
line 136
;136:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $115
line 137
;137:	s_loadMapEd.banner.string			= "Загрузить Карту";
ADDRGP4 s_loadMapEd+1076+88
ADDRGP4 $120
ASGNP4
line 138
;138:	}
LABELV $115
line 139
;139:	s_loadMapEd.banner.color			= color_white;
ADDRGP4 s_loadMapEd+1076+100
ADDRGP4 color_white
ASGNP4
line 140
;140:	s_loadMapEd.banner.style			= UI_CENTER;
ADDRGP4 s_loadMapEd+1076+92
CNSTI4 1
ASGNI4
line 142
;141:	
;142:	s_loadMapEd.background.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_loadMapEd+2124
CNSTI4 6
ASGNI4
line 143
;143:	s_loadMapEd.background.generic.name		= ART_BACKGROUND;
ADDRGP4 s_loadMapEd+2124+4
ADDRGP4 $128
ASGNP4
line 144
;144:	s_loadMapEd.background.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_loadMapEd+2124+72
CNSTU4 16384
ASGNU4
line 145
;145:	s_loadMapEd.background.generic.x			= -10000000;
ADDRGP4 s_loadMapEd+2124+28
CNSTI4 -10000000
ASGNI4
line 146
;146:	s_loadMapEd.background.generic.y			= -1000;
ADDRGP4 s_loadMapEd+2124+32
CNSTI4 -1000
ASGNI4
line 147
;147:	s_loadMapEd.background.width				= 46600000;
ADDRGP4 s_loadMapEd+2124+104
CNSTI4 46600000
ASGNI4
line 148
;148:	s_loadMapEd.background.height			= 33200000;
ADDRGP4 s_loadMapEd+2124+108
CNSTI4 33200000
ASGNI4
line 150
;149:
;150:	s_loadMapEd.framel.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_loadMapEd+1180
CNSTI4 6
ASGNI4
line 151
;151:	s_loadMapEd.framel.generic.name	= ART_FRAMEL;
ADDRGP4 s_loadMapEd+1180+4
ADDRGP4 $142
ASGNP4
line 152
;152:	s_loadMapEd.framel.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_loadMapEd+1180+72
CNSTU4 16384
ASGNU4
line 153
;153:	s_loadMapEd.framel.generic.x		= 0;
ADDRGP4 s_loadMapEd+1180+28
CNSTI4 0
ASGNI4
line 154
;154:	s_loadMapEd.framel.generic.y		= 78;
ADDRGP4 s_loadMapEd+1180+32
CNSTI4 78
ASGNI4
line 155
;155:	s_loadMapEd.framel.width			= 256;
ADDRGP4 s_loadMapEd+1180+104
CNSTI4 256
ASGNI4
line 156
;156:	s_loadMapEd.framel.height			= 329;
ADDRGP4 s_loadMapEd+1180+108
CNSTI4 329
ASGNI4
line 158
;157:
;158:	s_loadMapEd.framer.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_loadMapEd+1296
CNSTI4 6
ASGNI4
line 159
;159:	s_loadMapEd.framer.generic.name	= ART_FRAMER;
ADDRGP4 s_loadMapEd+1296+4
ADDRGP4 $156
ASGNP4
line 160
;160:	s_loadMapEd.framer.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_loadMapEd+1296+72
CNSTU4 16384
ASGNU4
line 161
;161:	s_loadMapEd.framer.generic.x		= 376;
ADDRGP4 s_loadMapEd+1296+28
CNSTI4 376
ASGNI4
line 162
;162:	s_loadMapEd.framer.generic.y		= 76;
ADDRGP4 s_loadMapEd+1296+32
CNSTI4 76
ASGNI4
line 163
;163:	s_loadMapEd.framer.width			= 256;
ADDRGP4 s_loadMapEd+1296+104
CNSTI4 256
ASGNI4
line 164
;164:	s_loadMapEd.framer.height			= 334;
ADDRGP4 s_loadMapEd+1296+108
CNSTI4 334
ASGNI4
line 166
;165:
;166:	s_loadMapEd.arrows.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_loadMapEd+1544
CNSTI4 6
ASGNI4
line 167
;167:	s_loadMapEd.arrows.generic.name	= ART_ARROWS;
ADDRGP4 s_loadMapEd+1544+4
ADDRGP4 $170
ASGNP4
line 168
;168:	s_loadMapEd.arrows.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_loadMapEd+1544+72
CNSTU4 16384
ASGNU4
line 169
;169:	s_loadMapEd.arrows.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_loadMapEd+1544+28
CNSTI4 256
ASGNI4
line 170
;170:	s_loadMapEd.arrows.generic.y		= 400;
ADDRGP4 s_loadMapEd+1544+32
CNSTI4 400
ASGNI4
line 171
;171:	s_loadMapEd.arrows.width			= ARROWS_WIDTH;
ADDRGP4 s_loadMapEd+1544+104
CNSTI4 128
ASGNI4
line 172
;172:	s_loadMapEd.arrows.height			= ARROWS_HEIGHT;
ADDRGP4 s_loadMapEd+1544+108
CNSTI4 48
ASGNI4
line 174
;173:
;174:	s_loadMapEd.left.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_loadMapEd+1660
CNSTI4 6
ASGNI4
line 175
;175:	s_loadMapEd.left.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_loadMapEd+1660+72
CNSTU4 2308
ASGNU4
line 176
;176:	s_loadMapEd.left.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_loadMapEd+1660+28
CNSTI4 256
ASGNI4
line 177
;177:	s_loadMapEd.left.generic.y		= 400;
ADDRGP4 s_loadMapEd+1660+32
CNSTI4 400
ASGNI4
line 178
;178:	s_loadMapEd.left.generic.id		= ID_LEFT;
ADDRGP4 s_loadMapEd+1660+24
CNSTI4 13
ASGNI4
line 179
;179:	s_loadMapEd.left.generic.callback	= loadMapEd_MenuEvent;
ADDRGP4 s_loadMapEd+1660+76
ADDRGP4 loadMapEd_MenuEvent
ASGNP4
line 180
;180:	s_loadMapEd.left.width			= ARROWS_WIDTH/2;
ADDRGP4 s_loadMapEd+1660+104
CNSTI4 64
ASGNI4
line 181
;181:	s_loadMapEd.left.height			= ARROWS_HEIGHT;
ADDRGP4 s_loadMapEd+1660+108
CNSTI4 48
ASGNI4
line 182
;182:	s_loadMapEd.left.focuspic			= ART_ARROWLEFT;
ADDRGP4 s_loadMapEd+1660+88
ADDRGP4 $198
ASGNP4
line 184
;183:
;184:	s_loadMapEd.right.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_loadMapEd+1776
CNSTI4 6
ASGNI4
line 185
;185:	s_loadMapEd.right.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_loadMapEd+1776+72
CNSTU4 2308
ASGNU4
line 186
;186:	s_loadMapEd.right.generic.x		= 320;
ADDRGP4 s_loadMapEd+1776+28
CNSTI4 320
ASGNI4
line 187
;187:	s_loadMapEd.right.generic.y		= 400;
ADDRGP4 s_loadMapEd+1776+32
CNSTI4 400
ASGNI4
line 188
;188:	s_loadMapEd.right.generic.id		= ID_RIGHT;
ADDRGP4 s_loadMapEd+1776+24
CNSTI4 14
ASGNI4
line 189
;189:	s_loadMapEd.right.generic.callback = loadMapEd_MenuEvent;
ADDRGP4 s_loadMapEd+1776+76
ADDRGP4 loadMapEd_MenuEvent
ASGNP4
line 190
;190:	s_loadMapEd.right.width			= ARROWS_WIDTH/2;
ADDRGP4 s_loadMapEd+1776+104
CNSTI4 64
ASGNI4
line 191
;191:	s_loadMapEd.right.height			= ARROWS_HEIGHT;
ADDRGP4 s_loadMapEd+1776+108
CNSTI4 48
ASGNI4
line 192
;192:	s_loadMapEd.right.focuspic		= ART_ARROWRIGHT;
ADDRGP4 s_loadMapEd+1776+88
ADDRGP4 $216
ASGNP4
line 194
;193:
;194:	s_loadMapEd.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_loadMapEd+1892
CNSTI4 6
ASGNI4
line 195
;195:	s_loadMapEd.back.generic.name		= ART_BACK0;
ADDRGP4 s_loadMapEd+1892+4
ADDRGP4 $220
ASGNP4
line 196
;196:	s_loadMapEd.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_loadMapEd+1892+72
CNSTU4 260
ASGNU4
line 197
;197:	s_loadMapEd.back.generic.id		= ID_BACK;
ADDRGP4 s_loadMapEd+1892+24
CNSTI4 10
ASGNI4
line 198
;198:	s_loadMapEd.back.generic.callback	= loadMapEd_MenuEvent;
ADDRGP4 s_loadMapEd+1892+76
ADDRGP4 loadMapEd_MenuEvent
ASGNP4
line 199
;199:	s_loadMapEd.back.generic.x		= 0 - uis.wideoffset;
ADDRGP4 s_loadMapEd+1892+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 200
;200:	s_loadMapEd.back.generic.y		= 480-64;
ADDRGP4 s_loadMapEd+1892+32
CNSTI4 416
ASGNI4
line 201
;201:	s_loadMapEd.back.width			= 128;
ADDRGP4 s_loadMapEd+1892+104
CNSTI4 128
ASGNI4
line 202
;202:	s_loadMapEd.back.height			= 64;
ADDRGP4 s_loadMapEd+1892+108
CNSTI4 64
ASGNI4
line 203
;203:	s_loadMapEd.back.focuspic			= ART_BACK1;
ADDRGP4 s_loadMapEd+1892+88
ADDRGP4 $238
ASGNP4
line 205
;204:
;205:	s_loadMapEd.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_loadMapEd+2008
CNSTI4 6
ASGNI4
line 206
;206:	s_loadMapEd.go.generic.name		= ART_FIGHT0;
ADDRGP4 s_loadMapEd+2008+4
ADDRGP4 $242
ASGNP4
line 207
;207:	s_loadMapEd.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_loadMapEd+2008+72
CNSTU4 272
ASGNU4
line 208
;208:	s_loadMapEd.go.generic.id			= ID_GO;
ADDRGP4 s_loadMapEd+2008+24
CNSTI4 11
ASGNI4
line 209
;209:	s_loadMapEd.go.generic.callback	= loadMapEd_MenuEvent;
ADDRGP4 s_loadMapEd+2008+76
ADDRGP4 loadMapEd_MenuEvent
ASGNP4
line 210
;210:	s_loadMapEd.go.generic.x			= 640 + uis.wideoffset;
ADDRGP4 s_loadMapEd+2008+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 211
;211:	s_loadMapEd.go.generic.y			= 480-64;
ADDRGP4 s_loadMapEd+2008+32
CNSTI4 416
ASGNI4
line 212
;212:	s_loadMapEd.go.width				= 128;
ADDRGP4 s_loadMapEd+2008+104
CNSTI4 128
ASGNI4
line 213
;213:	s_loadMapEd.go.height				= 64;
ADDRGP4 s_loadMapEd+2008+108
CNSTI4 64
ASGNI4
line 214
;214:	s_loadMapEd.go.focuspic			= ART_FIGHT1;
ADDRGP4 s_loadMapEd+2008+88
ADDRGP4 $260
ASGNP4
line 217
;215:
;216:	// scan for configs
;217:	s_loadMapEd.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_loadMapEd+1412
CNSTI4 8
ASGNI4
line 218
;218:	s_loadMapEd.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_loadMapEd+1412+72
CNSTU4 256
ASGNU4
line 219
;219:	s_loadMapEd.list.generic.callback	= loadMapEd_MenuEvent;
ADDRGP4 s_loadMapEd+1412+76
ADDRGP4 loadMapEd_MenuEvent
ASGNP4
line 220
;220:	s_loadMapEd.list.generic.id		= ID_LIST;
ADDRGP4 s_loadMapEd+1412+24
CNSTI4 12
ASGNI4
line 221
;221:	s_loadMapEd.list.generic.x		= 118;
ADDRGP4 s_loadMapEd+1412+28
CNSTI4 118
ASGNI4
line 222
;222:	s_loadMapEd.list.generic.y		= 130;
ADDRGP4 s_loadMapEd+1412+32
CNSTI4 130
ASGNI4
line 223
;223:	s_loadMapEd.list.width			= 16;
ADDRGP4 s_loadMapEd+1412+112
CNSTI4 16
ASGNI4
line 224
;224:	s_loadMapEd.list.height			= 14;
ADDRGP4 s_loadMapEd+1412+116
CNSTI4 14
ASGNI4
line 225
;225:	s_loadMapEd.list.numitems			= trap_FS_GetFileList( "maps", "add", s_loadMapEd.names, 524288 );
ADDRGP4 $278
ARGP4
ADDRGP4 $279
ARGP4
ADDRGP4 s_loadMapEd+2240
ARGP4
CNSTI4 524288
ARGI4
ADDRLP4 12
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 s_loadMapEd+1412+96
ADDRLP4 12
INDIRI4
ASGNI4
line 226
;226:	s_loadMapEd.list.itemnames		= (const char **)s_loadMapEd.configlist;
ADDRGP4 s_loadMapEd+1412+104
ADDRGP4 s_loadMapEd+526528
ASGNP4
line 227
;227:	s_loadMapEd.list.columns			= 1;
ADDRGP4 s_loadMapEd+1412+120
CNSTI4 1
ASGNI4
line 229
;228:
;229:	if (!s_loadMapEd.list.numitems) {
ADDRGP4 s_loadMapEd+1412+96
INDIRI4
CNSTI4 0
NEI4 $286
line 230
;230:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $290
line 231
;231:		strcpy(s_loadMapEd.names,"No MapFiles Found.");
ADDRGP4 s_loadMapEd+2240
ARGP4
ADDRGP4 $294
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 232
;232:		}
LABELV $290
line 233
;233:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $295
line 234
;234:		strcpy(s_loadMapEd.names,"Файлы карт не найдены.");
ADDRGP4 s_loadMapEd+2240
ARGP4
ADDRGP4 $299
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 235
;235:		}
LABELV $295
line 236
;236:		s_loadMapEd.list.numitems = 1;
ADDRGP4 s_loadMapEd+1412+96
CNSTI4 1
ASGNI4
line 239
;237:
;238:		//degenerate case, not selectable
;239:		s_loadMapEd.go.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 s_loadMapEd+2008+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 240
;240:	}
ADDRGP4 $287
JUMPV
LABELV $286
line 241
;241:	else if (s_loadMapEd.list.numitems > MAX_MAPFILES)
ADDRGP4 s_loadMapEd+1412+96
INDIRI4
CNSTI4 4096
LEI4 $304
line 242
;242:		s_loadMapEd.list.numitems = MAX_MAPFILES;
ADDRGP4 s_loadMapEd+1412+96
CNSTI4 4096
ASGNI4
LABELV $304
LABELV $287
line 244
;243:
;244:	configname = s_loadMapEd.names;
ADDRLP4 0
ADDRGP4 s_loadMapEd+2240
ASGNP4
line 245
;245:	for ( i = 0; i < s_loadMapEd.list.numitems; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $314
JUMPV
LABELV $311
line 246
;246:		s_loadMapEd.list.itemnames[i] = configname;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_loadMapEd+1412+104
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 249
;247:
;248:		// strip extension
;249:		len = strlen( configname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 250
;250:		if (!Q_stricmp(configname +  len - 4,".add"))
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $319
line 251
;251:			configname[len-4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $319
line 253
;252:
;253:		Q_strupr(configname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 255
;254:
;255:		configname += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 256
;256:	}
LABELV $312
line 245
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $314
ADDRLP4 8
INDIRI4
ADDRGP4 s_loadMapEd+1412+96
INDIRI4
LTI4 $311
line 258
;257:
;258:	Menu_AddItem( &s_loadMapEd.menu, &s_loadMapEd.background );
ADDRGP4 s_loadMapEd
ARGP4
ADDRGP4 s_loadMapEd+2124
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 259
;259:	Menu_AddItem( &s_loadMapEd.menu, &s_loadMapEd.banner );
ADDRGP4 s_loadMapEd
ARGP4
ADDRGP4 s_loadMapEd+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 262
;260:	//Menu_AddItem( &s_loadMapEd.menu, &s_loadMapEd.framel );
;261:	//Menu_AddItem( &s_loadMapEd.menu, &s_loadMapEd.framer );
;262:	Menu_AddItem( &s_loadMapEd.menu, &s_loadMapEd.list );
ADDRGP4 s_loadMapEd
ARGP4
ADDRGP4 s_loadMapEd+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 266
;263:	//Menu_AddItem( &s_loadMapEd.menu, &s_loadMapEd.arrows );
;264:	//Menu_AddItem( &s_loadMapEd.menu, &s_loadMapEd.left );
;265:	//Menu_AddItem( &s_loadMapEd.menu, &s_loadMapEd.right );
;266:	Menu_AddItem( &s_loadMapEd.menu, &s_loadMapEd.back );
ADDRGP4 s_loadMapEd
ARGP4
ADDRGP4 s_loadMapEd+1892
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 267
;267:	Menu_AddItem( &s_loadMapEd.menu, &s_loadMapEd.go );
ADDRGP4 s_loadMapEd
ARGP4
ADDRGP4 s_loadMapEd+2008
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 268
;268:}
LABELV $100
endproc loadMapEd_MenuInit 24 16
export UI_loadMapEd_Cache
proc UI_loadMapEd_Cache 0 4
line 275
;269:
;270:/*
;271:=================
;272:UI_loadMapEd_Cache
;273:=================
;274:*/
;275:void UI_loadMapEd_Cache( void ) {
line 276
;276:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $220
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 277
;277:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $238
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 278
;278:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $242
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 279
;279:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $260
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 280
;280:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $142
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 281
;281:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $156
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 282
;282:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $170
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 283
;283:	trap_R_RegisterShaderNoMip( ART_ARROWLEFT );
ADDRGP4 $198
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 284
;284:	trap_R_RegisterShaderNoMip( ART_ARROWRIGHT );
ADDRGP4 $216
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 285
;285:}
LABELV $327
endproc UI_loadMapEd_Cache 0 4
export UI_loadMapEdMenu
proc UI_loadMapEdMenu 0 4
line 293
;286:
;287:
;288:/*
;289:===============
;290:UI_loadMapEdMenu
;291:===============
;292:*/
;293:void UI_loadMapEdMenu( void ) {
line 294
;294:	loadMapEd_MenuInit();
ADDRGP4 loadMapEd_MenuInit
CALLV
pop
line 295
;295:	UI_PushMenu( &s_loadMapEd.menu );
ADDRGP4 s_loadMapEd
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 296
;296:}
LABELV $328
endproc UI_loadMapEdMenu 0 4
proc selecttoolEd_MenuEvent 8 8
line 399
;297:
;298:
;299:
;300:
;301:
;302:
;303:
;304:
;305:
;306:
;307:
;308:
;309:
;310:
;311:
;312:
;313:
;314:
;315:
;316:/*
;317:===========================================================================
;318:Copyright (C) 1999-2005 Id Software, Inc.
;319:
;320:This file is part of Quake III Arena source code.
;321:
;322:Quake III Arena source code is free software; you can redistribute it
;323:and/or modify it under the terms of the GNU General Public License as
;324:published by the Free Software Foundation; either version 2 of the License,
;325:or (at your option) any later version.
;326:
;327:Quake III Arena source code is distributed in the hope that it will be
;328:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;329:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;330:GNU General Public License for more details.
;331:
;332:You should have received a copy of the GNU General Public License
;333:along with Quake III Arena source code; if not, write to the Free Software
;334:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;335:===========================================================================
;336:*/
;337://
;338:/*
;339:=============================================================================
;340:
;341:LOAD CONFIG MENU
;342:
;343:=============================================================================
;344:*/
;345:
;346:#include "ui_local.h"
;347:
;348:
;349:#define ART_BACK0			"menu/art/back_0"
;350:#define ART_BACK1			"menu/art/back_1"
;351:#define ART_FIGHT0			"menu/art/load_0"
;352:#define ART_FIGHT1			"menu/art/load_1"
;353:#define ART_FRAMEL			"menu/art/frame2_l"
;354:#define ART_FRAMER			"menu/art/frame1_r"
;355:#define ART_ARROWS			"menu/art/arrows_horz_0"
;356:#define ART_ARROWLEFT		"menu/art/arrows_horz_left"
;357:#define ART_ARROWRIGHT		"menu/art/arrows_horz_right"
;358:
;359:/*#define MAX_MAPFILES		512
;360:#define MAPNAMEBUFSIZE			( MAX_MAPFILES * 16 )*/
;361:
;362:#define ID_BACK				10
;363:#define ID_GO				11
;364:#define ID_LIST				12
;365:#define ID_LEFT				13
;366:#define ID_RIGHT			14
;367:
;368:#define ARROWS_WIDTH		128
;369:#define ARROWS_HEIGHT		48
;370:
;371:
;372:typedef struct {
;373:	menuframework_s	menu;
;374:
;375:	menutext_s		banner;
;376:	menubitmap_s	framel;
;377:	menubitmap_s	framer;
;378:
;379:	menulist_s		list;
;380:
;381:	menubitmap_s	arrows;
;382:	menubitmap_s	left;
;383:	menubitmap_s	right;
;384:	menubitmap_s	back;
;385:	menubitmap_s	go;
;386:
;387:	char			names[MAPNAMEBUFSIZE];
;388:	char*			configlist[MAX_MAPFILES];
;389:} s_selecttoolEd_t;
;390:
;391:static s_selecttoolEd_t	s_selecttoolEd;
;392:
;393:
;394:/*
;395:===============
;396:selecttoolEd_MenuEvent
;397:===============
;398:*/
;399:static void selecttoolEd_MenuEvent( void *ptr, int event ) {
line 401
;400:
;401:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $331
line 402
;402:		return;
ADDRGP4 $330
JUMPV
LABELV $331
line 405
;403:	}
;404:
;405:	switch ( ((menucommon_s*)ptr)->id ) {
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
LTI4 $333
ADDRLP4 0
INDIRI4
CNSTI4 14
GTI4 $333
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $345-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $345
address $340
address $336
address $333
address $341
address $343
code
LABELV $336
line 407
;406:	case ID_GO:
;407:		trap_Cvar_SetValue( "toolgun_tool", s_selecttoolEd.list.curvalue);
ADDRGP4 $337
ARGP4
ADDRGP4 s_selecttoolEd+1412+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 408
;408:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 409
;409:		break;
ADDRGP4 $334
JUMPV
LABELV $340
line 412
;410:
;411:	case ID_BACK:
;412:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 413
;413:		break;
ADDRGP4 $334
JUMPV
LABELV $341
line 416
;414:
;415:	case ID_LEFT:
;416:		ScrollList_Key( &s_selecttoolEd.list, K_LEFTARROW );
ADDRGP4 s_selecttoolEd+1412
ARGP4
CNSTI4 134
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 417
;417:		break;
ADDRGP4 $334
JUMPV
LABELV $343
line 420
;418:
;419:	case ID_RIGHT:
;420:		ScrollList_Key( &s_selecttoolEd.list, K_RIGHTARROW );
ADDRGP4 s_selecttoolEd+1412
ARGP4
CNSTI4 135
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 421
;421:		break;
LABELV $333
LABELV $334
line 423
;422:	}
;423:}
LABELV $330
endproc selecttoolEd_MenuEvent 8 8
export UI_selecttoolEd_Cache
proc UI_selecttoolEd_Cache 0 4
line 430
;424:
;425:/*
;426:=================
;427:UI_selecttoolEd_Cache
;428:=================
;429:*/
;430:void UI_selecttoolEd_Cache( void ) {
line 431
;431:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $220
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 432
;432:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $238
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 433
;433:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $242
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 434
;434:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $260
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 435
;435:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $142
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 436
;436:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $156
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 437
;437:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $170
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 438
;438:	trap_R_RegisterShaderNoMip( ART_ARROWLEFT );
ADDRGP4 $198
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 439
;439:	trap_R_RegisterShaderNoMip( ART_ARROWRIGHT );
ADDRGP4 $216
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 440
;440:}
LABELV $347
endproc UI_selecttoolEd_Cache 0 4
proc selecttoolEd_MenuInit 16 12
line 447
;441:
;442:/*
;443:===============
;444:selecttoolEd_MenuInit
;445:===============
;446:*/
;447:static void selecttoolEd_MenuInit( void ) {
line 452
;448:	int		i;
;449:	int		len;
;450:	char	*configname;
;451:
;452:	UI_selecttoolEd_Cache();
ADDRGP4 UI_selecttoolEd_Cache
CALLV
pop
line 454
;453:
;454:	memset( &s_selecttoolEd, 0 ,sizeof(s_selecttoolEd_t) );
ADDRGP4 s_selecttoolEd
ARGP4
CNSTI4 0
ARGI4
CNSTI4 84044
ARGI4
ADDRGP4 memset
CALLP4
pop
line 455
;455:	s_selecttoolEd.menu.wrapAround = qtrue;
ADDRGP4 s_selecttoolEd+1044
CNSTI4 1
ASGNI4
line 456
;456:	s_selecttoolEd.menu.native 	   = qfalse;
ADDRGP4 s_selecttoolEd+1056
CNSTI4 0
ASGNI4
line 457
;457:	s_selecttoolEd.menu.fullscreen = qtrue;
ADDRGP4 s_selecttoolEd+1052
CNSTI4 1
ASGNI4
line 459
;458:
;459:	s_selecttoolEd.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 s_selecttoolEd+1076
CNSTI4 10
ASGNI4
line 460
;460:	s_selecttoolEd.banner.generic.x		= 320;
ADDRGP4 s_selecttoolEd+1076+28
CNSTI4 320
ASGNI4
line 461
;461:	s_selecttoolEd.banner.generic.y		= 16;
ADDRGP4 s_selecttoolEd+1076+32
CNSTI4 16
ASGNI4
line 462
;462:	s_selecttoolEd.banner.string			= "Select tool";
ADDRGP4 s_selecttoolEd+1076+88
ADDRGP4 $359
ASGNP4
line 463
;463:	s_selecttoolEd.banner.color			= color_white;
ADDRGP4 s_selecttoolEd+1076+100
ADDRGP4 color_white
ASGNP4
line 464
;464:	s_selecttoolEd.banner.style			= UI_CENTER;
ADDRGP4 s_selecttoolEd+1076+92
CNSTI4 1
ASGNI4
line 466
;465:
;466:	s_selecttoolEd.framel.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_selecttoolEd+1180
CNSTI4 6
ASGNI4
line 467
;467:	s_selecttoolEd.framel.generic.name	= ART_FRAMEL;
ADDRGP4 s_selecttoolEd+1180+4
ADDRGP4 $142
ASGNP4
line 468
;468:	s_selecttoolEd.framel.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_selecttoolEd+1180+72
CNSTU4 16384
ASGNU4
line 469
;469:	s_selecttoolEd.framel.generic.x		= 0;
ADDRGP4 s_selecttoolEd+1180+28
CNSTI4 0
ASGNI4
line 470
;470:	s_selecttoolEd.framel.generic.y		= 78;
ADDRGP4 s_selecttoolEd+1180+32
CNSTI4 78
ASGNI4
line 471
;471:	s_selecttoolEd.framel.width			= 256;
ADDRGP4 s_selecttoolEd+1180+104
CNSTI4 256
ASGNI4
line 472
;472:	s_selecttoolEd.framel.height			= 329;
ADDRGP4 s_selecttoolEd+1180+108
CNSTI4 329
ASGNI4
line 474
;473:
;474:	s_selecttoolEd.framer.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_selecttoolEd+1296
CNSTI4 6
ASGNI4
line 475
;475:	s_selecttoolEd.framer.generic.name	= ART_FRAMER;
ADDRGP4 s_selecttoolEd+1296+4
ADDRGP4 $156
ASGNP4
line 476
;476:	s_selecttoolEd.framer.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_selecttoolEd+1296+72
CNSTU4 16384
ASGNU4
line 477
;477:	s_selecttoolEd.framer.generic.x		= 376;
ADDRGP4 s_selecttoolEd+1296+28
CNSTI4 376
ASGNI4
line 478
;478:	s_selecttoolEd.framer.generic.y		= 76;
ADDRGP4 s_selecttoolEd+1296+32
CNSTI4 76
ASGNI4
line 479
;479:	s_selecttoolEd.framer.width			= 256;
ADDRGP4 s_selecttoolEd+1296+104
CNSTI4 256
ASGNI4
line 480
;480:	s_selecttoolEd.framer.height			= 334;
ADDRGP4 s_selecttoolEd+1296+108
CNSTI4 334
ASGNI4
line 482
;481:
;482:	s_selecttoolEd.arrows.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_selecttoolEd+1544
CNSTI4 6
ASGNI4
line 483
;483:	s_selecttoolEd.arrows.generic.name	= ART_ARROWS;
ADDRGP4 s_selecttoolEd+1544+4
ADDRGP4 $170
ASGNP4
line 484
;484:	s_selecttoolEd.arrows.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_selecttoolEd+1544+72
CNSTU4 16384
ASGNU4
line 485
;485:	s_selecttoolEd.arrows.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_selecttoolEd+1544+28
CNSTI4 256
ASGNI4
line 486
;486:	s_selecttoolEd.arrows.generic.y		= 400;
ADDRGP4 s_selecttoolEd+1544+32
CNSTI4 400
ASGNI4
line 487
;487:	s_selecttoolEd.arrows.width			= ARROWS_WIDTH;
ADDRGP4 s_selecttoolEd+1544+104
CNSTI4 128
ASGNI4
line 488
;488:	s_selecttoolEd.arrows.height			= ARROWS_HEIGHT;
ADDRGP4 s_selecttoolEd+1544+108
CNSTI4 48
ASGNI4
line 490
;489:
;490:	s_selecttoolEd.left.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_selecttoolEd+1660
CNSTI4 6
ASGNI4
line 491
;491:	s_selecttoolEd.left.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_selecttoolEd+1660+72
CNSTU4 2308
ASGNU4
line 492
;492:	s_selecttoolEd.left.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_selecttoolEd+1660+28
CNSTI4 256
ASGNI4
line 493
;493:	s_selecttoolEd.left.generic.y		= 400;
ADDRGP4 s_selecttoolEd+1660+32
CNSTI4 400
ASGNI4
line 494
;494:	s_selecttoolEd.left.generic.id		= ID_LEFT;
ADDRGP4 s_selecttoolEd+1660+24
CNSTI4 13
ASGNI4
line 495
;495:	s_selecttoolEd.left.generic.callback	= selecttoolEd_MenuEvent;
ADDRGP4 s_selecttoolEd+1660+76
ADDRGP4 selecttoolEd_MenuEvent
ASGNP4
line 496
;496:	s_selecttoolEd.left.width			= ARROWS_WIDTH/2;
ADDRGP4 s_selecttoolEd+1660+104
CNSTI4 64
ASGNI4
line 497
;497:	s_selecttoolEd.left.height			= ARROWS_HEIGHT;
ADDRGP4 s_selecttoolEd+1660+108
CNSTI4 48
ASGNI4
line 498
;498:	s_selecttoolEd.left.focuspic			= ART_ARROWLEFT;
ADDRGP4 s_selecttoolEd+1660+88
ADDRGP4 $198
ASGNP4
line 500
;499:
;500:	s_selecttoolEd.right.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_selecttoolEd+1776
CNSTI4 6
ASGNI4
line 501
;501:	s_selecttoolEd.right.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_selecttoolEd+1776+72
CNSTU4 2308
ASGNU4
line 502
;502:	s_selecttoolEd.right.generic.x		= 320;
ADDRGP4 s_selecttoolEd+1776+28
CNSTI4 320
ASGNI4
line 503
;503:	s_selecttoolEd.right.generic.y		= 400;
ADDRGP4 s_selecttoolEd+1776+32
CNSTI4 400
ASGNI4
line 504
;504:	s_selecttoolEd.right.generic.id		= ID_RIGHT;
ADDRGP4 s_selecttoolEd+1776+24
CNSTI4 14
ASGNI4
line 505
;505:	s_selecttoolEd.right.generic.callback = selecttoolEd_MenuEvent;
ADDRGP4 s_selecttoolEd+1776+76
ADDRGP4 selecttoolEd_MenuEvent
ASGNP4
line 506
;506:	s_selecttoolEd.right.width			= ARROWS_WIDTH/2;
ADDRGP4 s_selecttoolEd+1776+104
CNSTI4 64
ASGNI4
line 507
;507:	s_selecttoolEd.right.height			= ARROWS_HEIGHT;
ADDRGP4 s_selecttoolEd+1776+108
CNSTI4 48
ASGNI4
line 508
;508:	s_selecttoolEd.right.focuspic		= ART_ARROWRIGHT;
ADDRGP4 s_selecttoolEd+1776+88
ADDRGP4 $216
ASGNP4
line 510
;509:
;510:	s_selecttoolEd.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_selecttoolEd+1892
CNSTI4 6
ASGNI4
line 511
;511:	s_selecttoolEd.back.generic.name		= ART_BACK0;
ADDRGP4 s_selecttoolEd+1892+4
ADDRGP4 $220
ASGNP4
line 512
;512:	s_selecttoolEd.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_selecttoolEd+1892+72
CNSTU4 260
ASGNU4
line 513
;513:	s_selecttoolEd.back.generic.id		= ID_BACK;
ADDRGP4 s_selecttoolEd+1892+24
CNSTI4 10
ASGNI4
line 514
;514:	s_selecttoolEd.back.generic.callback	= selecttoolEd_MenuEvent;
ADDRGP4 s_selecttoolEd+1892+76
ADDRGP4 selecttoolEd_MenuEvent
ASGNP4
line 515
;515:	s_selecttoolEd.back.generic.x		= 0 - uis.wideoffset;
ADDRGP4 s_selecttoolEd+1892+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 516
;516:	s_selecttoolEd.back.generic.y		= 480-64;
ADDRGP4 s_selecttoolEd+1892+32
CNSTI4 416
ASGNI4
line 517
;517:	s_selecttoolEd.back.width			= 128;
ADDRGP4 s_selecttoolEd+1892+104
CNSTI4 128
ASGNI4
line 518
;518:	s_selecttoolEd.back.height			= 64;
ADDRGP4 s_selecttoolEd+1892+108
CNSTI4 64
ASGNI4
line 519
;519:	s_selecttoolEd.back.focuspic			= ART_BACK1;
ADDRGP4 s_selecttoolEd+1892+88
ADDRGP4 $238
ASGNP4
line 521
;520:
;521:	s_selecttoolEd.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_selecttoolEd+2008
CNSTI4 6
ASGNI4
line 522
;522:	s_selecttoolEd.go.generic.name		= ART_FIGHT0;
ADDRGP4 s_selecttoolEd+2008+4
ADDRGP4 $242
ASGNP4
line 523
;523:	s_selecttoolEd.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_selecttoolEd+2008+72
CNSTU4 272
ASGNU4
line 524
;524:	s_selecttoolEd.go.generic.id			= ID_GO;
ADDRGP4 s_selecttoolEd+2008+24
CNSTI4 11
ASGNI4
line 525
;525:	s_selecttoolEd.go.generic.callback	= selecttoolEd_MenuEvent;
ADDRGP4 s_selecttoolEd+2008+76
ADDRGP4 selecttoolEd_MenuEvent
ASGNP4
line 526
;526:	s_selecttoolEd.go.generic.x			= 640 + uis.wideoffset;
ADDRGP4 s_selecttoolEd+2008+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 527
;527:	s_selecttoolEd.go.generic.y			= 480-64;
ADDRGP4 s_selecttoolEd+2008+32
CNSTI4 416
ASGNI4
line 528
;528:	s_selecttoolEd.go.width				= 128;
ADDRGP4 s_selecttoolEd+2008+104
CNSTI4 128
ASGNI4
line 529
;529:	s_selecttoolEd.go.height				= 64;
ADDRGP4 s_selecttoolEd+2008+108
CNSTI4 64
ASGNI4
line 530
;530:	s_selecttoolEd.go.focuspic			= ART_FIGHT1;
ADDRGP4 s_selecttoolEd+2008+88
ADDRGP4 $260
ASGNP4
line 533
;531:
;532:	// scan for configs
;533:	s_selecttoolEd.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_selecttoolEd+1412
CNSTI4 8
ASGNI4
line 534
;534:	s_selecttoolEd.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_selecttoolEd+1412+72
CNSTU4 256
ASGNU4
line 535
;535:	s_selecttoolEd.list.generic.callback	= selecttoolEd_MenuEvent;
ADDRGP4 s_selecttoolEd+1412+76
ADDRGP4 selecttoolEd_MenuEvent
ASGNP4
line 536
;536:	s_selecttoolEd.list.generic.id		= ID_LIST;
ADDRGP4 s_selecttoolEd+1412+24
CNSTI4 12
ASGNI4
line 537
;537:	s_selecttoolEd.list.generic.x		= 118;
ADDRGP4 s_selecttoolEd+1412+28
CNSTI4 118
ASGNI4
line 538
;538:	s_selecttoolEd.list.generic.y		= 50;
ADDRGP4 s_selecttoolEd+1412+32
CNSTI4 50
ASGNI4
line 539
;539:	s_selecttoolEd.list.width			= 36;
ADDRGP4 s_selecttoolEd+1412+112
CNSTI4 36
ASGNI4
line 540
;540:	s_selecttoolEd.list.height			= 28;
ADDRGP4 s_selecttoolEd+1412+116
CNSTI4 28
ASGNI4
line 541
;541:	s_selecttoolEd.list.numitems		= 143;
ADDRGP4 s_selecttoolEd+1412+96
CNSTI4 143
ASGNI4
line 542
;542:	s_selecttoolEd.list.itemnames		= (const char **)s_selecttoolEd.configlist;
ADDRGP4 s_selecttoolEd+1412+104
ADDRGP4 s_selecttoolEd+67660
ASGNP4
line 543
;543:	s_selecttoolEd.list.columns			= 1;
ADDRGP4 s_selecttoolEd+1412+120
CNSTI4 1
ASGNI4
line 545
;544:
;545:	if (!s_selecttoolEd.list.numitems) {
ADDRGP4 s_selecttoolEd+1412+96
INDIRI4
CNSTI4 0
NEI4 $499
line 546
;546:		strcpy(s_selecttoolEd.names,"No Tools Found.");
ADDRGP4 s_selecttoolEd+2124
ARGP4
ADDRGP4 $504
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 547
;547:		s_selecttoolEd.list.numitems = 1;
ADDRGP4 s_selecttoolEd+1412+96
CNSTI4 1
ASGNI4
line 550
;548:
;549:		//degenerate case, not selectable
;550:		s_selecttoolEd.go.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 12
ADDRGP4 s_selecttoolEd+2008+72
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 551
;551:	}
ADDRGP4 $500
JUMPV
LABELV $499
line 552
;552:	else if (s_selecttoolEd.list.numitems > MAX_MAPFILES)
ADDRGP4 s_selecttoolEd+1412+96
INDIRI4
CNSTI4 4096
LEI4 $509
line 553
;553:		s_selecttoolEd.list.numitems = MAX_MAPFILES;
ADDRGP4 s_selecttoolEd+1412+96
CNSTI4 4096
ASGNI4
LABELV $509
LABELV $500
line 555
;554:
;555:	configname = s_selecttoolEd.names;
ADDRLP4 0
ADDRGP4 s_selecttoolEd+2124
ASGNP4
line 556
;556:s_selecttoolEd.list.itemnames[0] = "Build Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
ADDRGP4 $518
ASGNP4
line 557
;557:s_selecttoolEd.list.itemnames[1] = "Delete Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 $521
ASGNP4
line 558
;558:s_selecttoolEd.list.itemnames[2] = "Gravity Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 $524
ASGNP4
line 559
;559:s_selecttoolEd.list.itemnames[3] = "Freeze Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 $527
ASGNP4
line 560
;560:s_selecttoolEd.list.itemnames[4] = "Linear Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 $530
ASGNP4
line 561
;561:s_selecttoolEd.list.itemnames[5] = "Wait Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 $533
ASGNP4
line 562
;562:s_selecttoolEd.list.itemnames[6] = "Model Tool (1 to 500+)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 24
ADDP4
ADDRGP4 $536
ASGNP4
line 563
;563:s_selecttoolEd.list.itemnames[7] = "Spawnflags Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 28
ADDP4
ADDRGP4 $539
ASGNP4
line 564
;564:s_selecttoolEd.list.itemnames[8] = "Speed Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 $542
ASGNP4
line 565
;565:s_selecttoolEd.list.itemnames[9] = "Count Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 $545
ASGNP4
line 566
;566:s_selecttoolEd.list.itemnames[10] = "Health Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 40
ADDP4
ADDRGP4 $548
ASGNP4
line 567
;567:s_selecttoolEd.list.itemnames[11] = "Damage Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 44
ADDP4
ADDRGP4 $551
ASGNP4
line 568
;568:s_selecttoolEd.list.itemnames[12] = "Target Tool (1 to 100)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 $554
ASGNP4
line 569
;569:s_selecttoolEd.list.itemnames[13] = "Targetname Tool (1 to 100)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 $557
ASGNP4
line 570
;570:s_selecttoolEd.list.itemnames[14] = "Door Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 56
ADDP4
ADDRGP4 $560
ASGNP4
line 571
;571:s_selecttoolEd.list.itemnames[15] = "Button Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 $563
ASGNP4
line 572
;572:s_selecttoolEd.list.itemnames[16] = "Pendulum Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 $566
ASGNP4
line 573
;573:s_selecttoolEd.list.itemnames[17] = "Bobbing Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 $569
ASGNP4
line 574
;574:s_selecttoolEd.list.itemnames[18] = "Rotating Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 72
ADDP4
ADDRGP4 $572
ASGNP4
line 575
;575:s_selecttoolEd.list.itemnames[19] = "Static Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 76
ADDP4
ADDRGP4 $575
ASGNP4
line 576
;576:s_selecttoolEd.list.itemnames[20] = "Plat Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 80
ADDP4
ADDRGP4 $578
ASGNP4
line 577
;577:s_selecttoolEd.list.itemnames[21] = "Height Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 $581
ASGNP4
line 578
;578:s_selecttoolEd.list.itemnames[22] = "Random Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 $584
ASGNP4
line 579
;579:s_selecttoolEd.list.itemnames[23] = "Set Speed Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 $587
ASGNP4
line 580
;580:s_selecttoolEd.list.itemnames[24] = "Bounce Reset Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 96
ADDP4
ADDRGP4 $590
ASGNP4
line 581
;581:s_selecttoolEd.list.itemnames[25] = "Half Bounce Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 100
ADDP4
ADDRGP4 $593
ASGNP4
line 582
;582:s_selecttoolEd.list.itemnames[26] = "Full Bounce Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 $596
ASGNP4
line 583
;583:s_selecttoolEd.list.itemnames[27] = "Rocket Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 108
ADDP4
ADDRGP4 $599
ASGNP4
line 584
;584:s_selecttoolEd.list.itemnames[28] = "Grenade Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 $602
ASGNP4
line 585
;585:s_selecttoolEd.list.itemnames[29] = "Plasma Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 116
ADDP4
ADDRGP4 $605
ASGNP4
line 586
;586:s_selecttoolEd.list.itemnames[30] = "Remove Powerups Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 120
ADDP4
ADDRGP4 $608
ASGNP4
line 587
;587:s_selecttoolEd.list.itemnames[31] = "Score Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 124
ADDP4
ADDRGP4 $611
ASGNP4
line 588
;588:s_selecttoolEd.list.itemnames[32] = "Sound Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 128
ADDP4
ADDRGP4 $614
ASGNP4
line 589
;589:s_selecttoolEd.list.itemnames[33] = "Music Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 132
ADDP4
ADDRGP4 $617
ASGNP4
line 590
;590:s_selecttoolEd.list.itemnames[34] = "Cmd Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 136
ADDP4
ADDRGP4 $620
ASGNP4
line 591
;591:s_selecttoolEd.list.itemnames[35] = "Model Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 140
ADDP4
ADDRGP4 $623
ASGNP4
line 592
;592:s_selecttoolEd.list.itemnames[36] = "Legs Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 144
ADDP4
ADDRGP4 $626
ASGNP4
line 593
;593:s_selecttoolEd.list.itemnames[37] = "Head Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 148
ADDP4
ADDRGP4 $629
ASGNP4
line 594
;594:s_selecttoolEd.list.itemnames[38] = "Teleporter Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 152
ADDP4
ADDRGP4 $632
ASGNP4
line 595
;595:s_selecttoolEd.list.itemnames[39] = "Kill Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 156
ADDP4
ADDRGP4 $635
ASGNP4
line 596
;596:s_selecttoolEd.list.itemnames[40] = "Push Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 160
ADDP4
ADDRGP4 $638
ASGNP4
line 597
;597:s_selecttoolEd.list.itemnames[41] = "Give Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 164
ADDP4
ADDRGP4 $641
ASGNP4
line 598
;598:s_selecttoolEd.list.itemnames[42] = "Print Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 168
ADDP4
ADDRGP4 $644
ASGNP4
line 599
;599:s_selecttoolEd.list.itemnames[43] = "Teleporter Dest Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 172
ADDP4
ADDRGP4 $647
ASGNP4
line 600
;600:s_selecttoolEd.list.itemnames[44] = "FFA Spawn Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 176
ADDP4
ADDRGP4 $650
ASGNP4
line 601
;601:s_selecttoolEd.list.itemnames[45] = "Red Spawn Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 180
ADDP4
ADDRGP4 $653
ASGNP4
line 602
;602:s_selecttoolEd.list.itemnames[46] = "Blue Spawn Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 184
ADDP4
ADDRGP4 $656
ASGNP4
line 603
;603:s_selecttoolEd.list.itemnames[47] = "Red Base Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 188
ADDP4
ADDRGP4 $659
ASGNP4
line 604
;604:s_selecttoolEd.list.itemnames[48] = "Blue Base Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 192
ADDP4
ADDRGP4 $662
ASGNP4
line 605
;605:s_selecttoolEd.list.itemnames[49] = "Neutral Base Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 196
ADDP4
ADDRGP4 $665
ASGNP4
line 606
;606:s_selecttoolEd.list.itemnames[50] = "Domination Point Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 $668
ASGNP4
line 607
;607:s_selecttoolEd.list.itemnames[51] = "Message Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 204
ADDP4
ADDRGP4 $671
ASGNP4
line 608
;608:s_selecttoolEd.list.itemnames[52] = "Create Collision Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 208
ADDP4
ADDRGP4 $674
ASGNP4
line 609
;609:s_selecttoolEd.list.itemnames[53] = "Delete Collision Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 212
ADDP4
ADDRGP4 $677
ASGNP4
line 610
;610:s_selecttoolEd.list.itemnames[54] = "Respawn Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 216
ADDP4
ADDRGP4 $680
ASGNP4
line 611
;611:s_selecttoolEd.list.itemnames[55] = "Move X Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 220
ADDP4
ADDRGP4 $683
ASGNP4
line 612
;612:s_selecttoolEd.list.itemnames[56] = "Move Y Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 224
ADDP4
ADDRGP4 $686
ASGNP4
line 613
;613:s_selecttoolEd.list.itemnames[57] = "Move Z Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 228
ADDP4
ADDRGP4 $689
ASGNP4
line 614
;614:s_selecttoolEd.list.itemnames[58] = "Replace Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 232
ADDP4
ADDRGP4 $692
ASGNP4
line 615
;615:s_selecttoolEd.list.itemnames[59] = "Get Classname Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 236
ADDP4
ADDRGP4 $695
ASGNP4
line 616
;616:s_selecttoolEd.list.itemnames[60] = "Get Target Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 240
ADDP4
ADDRGP4 $698
ASGNP4
line 617
;617:s_selecttoolEd.list.itemnames[61] = "Get Targetname Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 244
ADDP4
ADDRGP4 $701
ASGNP4
line 618
;618:s_selecttoolEd.list.itemnames[62] = "Position Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 248
ADDP4
ADDRGP4 $704
ASGNP4
line 619
;619:s_selecttoolEd.list.itemnames[63] = "T Multiple Tool (1 to 9)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 252
ADDP4
ADDRGP4 $707
ASGNP4
line 620
;620:s_selecttoolEd.list.itemnames[64] = "T Push Tool (1 to 9)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 256
ADDP4
ADDRGP4 $710
ASGNP4
line 621
;621:s_selecttoolEd.list.itemnames[65] = "T Teleport Tool (1 to 9)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 260
ADDP4
ADDRGP4 $713
ASGNP4
line 622
;622:s_selecttoolEd.list.itemnames[66] = "T Hurt Tool (1 to 9)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 264
ADDP4
ADDRGP4 $716
ASGNP4
line 623
;623:s_selecttoolEd.list.itemnames[67] = "Size Collision Tool(1 to 11)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 268
ADDP4
ADDRGP4 $719
ASGNP4
line 624
;624:s_selecttoolEd.list.itemnames[68] = "Targetname Tool Player (1 to 100)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 272
ADDP4
ADDRGP4 $722
ASGNP4
line 625
;625:s_selecttoolEd.list.itemnames[69] = "Noclip Tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 276
ADDP4
ADDRGP4 $725
ASGNP4
line 626
;626:s_selecttoolEd.list.itemnames[70] = "Material Tool (1 to 169)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 280
ADDP4
ADDRGP4 $728
ASGNP4
line 627
;627:s_selecttoolEd.list.itemnames[71] = "Armor Shard";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 284
ADDP4
ADDRGP4 $731
ASGNP4
line 628
;628:s_selecttoolEd.list.itemnames[72] = "Armor";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 288
ADDP4
ADDRGP4 $734
ASGNP4
line 629
;629:s_selecttoolEd.list.itemnames[73] = "Heavy Armor";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 292
ADDP4
ADDRGP4 $737
ASGNP4
line 630
;630:s_selecttoolEd.list.itemnames[74] = "5 Health";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 296
ADDP4
ADDRGP4 $740
ASGNP4
line 631
;631:s_selecttoolEd.list.itemnames[75] = "25 Health";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 300
ADDP4
ADDRGP4 $743
ASGNP4
line 632
;632:s_selecttoolEd.list.itemnames[76] = "50 Health";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 304
ADDP4
ADDRGP4 $746
ASGNP4
line 633
;633:s_selecttoolEd.list.itemnames[77] = "Mega Health";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 308
ADDP4
ADDRGP4 $749
ASGNP4
line 634
;634:s_selecttoolEd.list.itemnames[78] = "Shotgun";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 312
ADDP4
ADDRGP4 $752
ASGNP4
line 635
;635:s_selecttoolEd.list.itemnames[79] = "Machinegun";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 316
ADDP4
ADDRGP4 $755
ASGNP4
line 636
;636:s_selecttoolEd.list.itemnames[80] = "Grenade Launcher";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 320
ADDP4
ADDRGP4 $758
ASGNP4
line 637
;637:s_selecttoolEd.list.itemnames[81] = "Rocket Launcher";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 324
ADDP4
ADDRGP4 $761
ASGNP4
line 638
;638:s_selecttoolEd.list.itemnames[82] = "Lightning Gun";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 328
ADDP4
ADDRGP4 $764
ASGNP4
line 639
;639:s_selecttoolEd.list.itemnames[83] = "Railgun";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 332
ADDP4
ADDRGP4 $767
ASGNP4
line 640
;640:s_selecttoolEd.list.itemnames[84] = "Plasma Gun";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 336
ADDP4
ADDRGP4 $770
ASGNP4
line 641
;641:s_selecttoolEd.list.itemnames[85] = "BFG10K";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 340
ADDP4
ADDRGP4 $773
ASGNP4
line 642
;642:s_selecttoolEd.list.itemnames[86] = "Grappling Hook";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 344
ADDP4
ADDRGP4 $776
ASGNP4
line 643
;643:s_selecttoolEd.list.itemnames[87] = "Shells";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 348
ADDP4
ADDRGP4 $779
ASGNP4
line 644
;644:s_selecttoolEd.list.itemnames[88] = "Bullets";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 352
ADDP4
ADDRGP4 $782
ASGNP4
line 645
;645:s_selecttoolEd.list.itemnames[89] = "Grenades";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 356
ADDP4
ADDRGP4 $785
ASGNP4
line 646
;646:s_selecttoolEd.list.itemnames[90] = "Cells";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 360
ADDP4
ADDRGP4 $788
ASGNP4
line 647
;647:s_selecttoolEd.list.itemnames[91] = "Lightning";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 364
ADDP4
ADDRGP4 $791
ASGNP4
line 648
;648:s_selecttoolEd.list.itemnames[92] = "Rockets";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 368
ADDP4
ADDRGP4 $794
ASGNP4
line 649
;649:s_selecttoolEd.list.itemnames[93] = "Slugs";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 372
ADDP4
ADDRGP4 $797
ASGNP4
line 650
;650:s_selecttoolEd.list.itemnames[94] = "Bfg Ammo";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 376
ADDP4
ADDRGP4 $800
ASGNP4
line 651
;651:s_selecttoolEd.list.itemnames[95] = "Personal Teleporter";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 380
ADDP4
ADDRGP4 $803
ASGNP4
line 652
;652:s_selecttoolEd.list.itemnames[96] = "Medkit";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 384
ADDP4
ADDRGP4 $806
ASGNP4
line 653
;653:s_selecttoolEd.list.itemnames[97] = "Quad Damage";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 388
ADDP4
ADDRGP4 $809
ASGNP4
line 654
;654:s_selecttoolEd.list.itemnames[98] = "Battle Suit";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 392
ADDP4
ADDRGP4 $812
ASGNP4
line 655
;655:s_selecttoolEd.list.itemnames[99] = "Speed";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 396
ADDP4
ADDRGP4 $815
ASGNP4
line 656
;656:s_selecttoolEd.list.itemnames[100] = "Invisibility";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 400
ADDP4
ADDRGP4 $818
ASGNP4
line 657
;657:s_selecttoolEd.list.itemnames[101] = "Regeneration";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 404
ADDP4
ADDRGP4 $821
ASGNP4
line 658
;658:s_selecttoolEd.list.itemnames[102] = "Flight";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 408
ADDP4
ADDRGP4 $824
ASGNP4
line 659
;659:s_selecttoolEd.list.itemnames[103] = "Red Flag";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 412
ADDP4
ADDRGP4 $827
ASGNP4
line 660
;660:s_selecttoolEd.list.itemnames[104] = "Blue Flag";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $830
ASGNP4
line 661
;661:s_selecttoolEd.list.itemnames[105] = "Kamikaze";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 420
ADDP4
ADDRGP4 $833
ASGNP4
line 662
;662:s_selecttoolEd.list.itemnames[106] = "Portal";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 424
ADDP4
ADDRGP4 $836
ASGNP4
line 663
;663:s_selecttoolEd.list.itemnames[107] = "Invulnerability";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 428
ADDP4
ADDRGP4 $839
ASGNP4
line 664
;664:s_selecttoolEd.list.itemnames[108] = "Nails";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 432
ADDP4
ADDRGP4 $842
ASGNP4
line 665
;665:s_selecttoolEd.list.itemnames[109] = "Proximity Mines";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 $845
ASGNP4
line 666
;666:s_selecttoolEd.list.itemnames[110] = "Chaingun Belt";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 440
ADDP4
ADDRGP4 $848
ASGNP4
line 667
;667:s_selecttoolEd.list.itemnames[111] = "Scout";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 $851
ASGNP4
line 668
;668:s_selecttoolEd.list.itemnames[112] = "Guard";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 448
ADDP4
ADDRGP4 $854
ASGNP4
line 669
;669:s_selecttoolEd.list.itemnames[113] = "Doubler";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 452
ADDP4
ADDRGP4 $857
ASGNP4
line 670
;670:s_selecttoolEd.list.itemnames[114] = "Ammo Regen";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 $860
ASGNP4
line 671
;671:s_selecttoolEd.list.itemnames[115] = "Neutral Flag";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 460
ADDP4
ADDRGP4 $863
ASGNP4
line 672
;672:s_selecttoolEd.list.itemnames[116] = "Nailgun";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 464
ADDP4
ADDRGP4 $866
ASGNP4
line 673
;673:s_selecttoolEd.list.itemnames[117] = "Prox Launcher";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 468
ADDP4
ADDRGP4 $869
ASGNP4
line 674
;674:s_selecttoolEd.list.itemnames[118] = "Chaingun";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 $872
ASGNP4
line 675
;675:s_selecttoolEd.list.itemnames[119] = "Flamethrower";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 $875
ASGNP4
line 676
;676:s_selecttoolEd.list.itemnames[120] = "Flame";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 480
ADDP4
ADDRGP4 $878
ASGNP4
line 677
;677:s_selecttoolEd.list.itemnames[121] = "Dark Flare";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 484
ADDP4
ADDRGP4 $881
ASGNP4
line 678
;678:s_selecttoolEd.list.itemnames[122] = "Point A";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 488
ADDP4
ADDRGP4 $884
ASGNP4
line 679
;679:s_selecttoolEd.list.itemnames[123] = "Point B";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 492
ADDP4
ADDRGP4 $887
ASGNP4
line 680
;680:s_selecttoolEd.list.itemnames[124] = "Neutral domination point";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 496
ADDP4
ADDRGP4 $890
ASGNP4
line 681
;681:s_selecttoolEd.list.itemnames[125] = "Noise tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 500
ADDP4
ADDRGP4 $893
ASGNP4
line 682
;682:s_selecttoolEd.list.itemnames[126] = "Restore Model tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 504
ADDP4
ADDRGP4 $896
ASGNP4
line 683
;683:s_selecttoolEd.list.itemnames[127] = "Object permissions tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 508
ADDP4
ADDRGP4 $899
ASGNP4
line 684
;684:s_selecttoolEd.list.itemnames[128] = "Get object permissions";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 512
ADDP4
ADDRGP4 $902
ASGNP4
line 685
;685:s_selecttoolEd.list.itemnames[129] = "Prop locker tool";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 516
ADDP4
ADDRGP4 $905
ASGNP4
line 686
;686:s_selecttoolEd.list.itemnames[130] = "Set Point 1";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 520
ADDP4
ADDRGP4 $908
ASGNP4
line 687
;687:s_selecttoolEd.list.itemnames[131] = "Set Point 2";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $911
ASGNP4
line 688
;688:s_selecttoolEd.list.itemnames[132] = "Set Point 3";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 528
ADDP4
ADDRGP4 $914
ASGNP4
line 689
;689:s_selecttoolEd.list.itemnames[133] = "Teleport Point 1";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $917
ASGNP4
line 690
;690:s_selecttoolEd.list.itemnames[134] = "Teleport Point 2";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 536
ADDP4
ADDRGP4 $920
ASGNP4
line 691
;691:s_selecttoolEd.list.itemnames[135] = "Teleport Point 3";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 540
ADDP4
ADDRGP4 $923
ASGNP4
line 692
;692:s_selecttoolEd.list.itemnames[136] = "Teleport Me Point 1";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 544
ADDP4
ADDRGP4 $926
ASGNP4
line 693
;693:s_selecttoolEd.list.itemnames[137] = "Teleport Me Point 2";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 $929
ASGNP4
line 694
;694:s_selecttoolEd.list.itemnames[138] = "Teleport Me Point 3";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 $932
ASGNP4
line 695
;695:s_selecttoolEd.list.itemnames[139] = "Grab Item";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 $935
ASGNP4
line 696
;696:s_selecttoolEd.list.itemnames[140] = "Grab Items and weapons";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 $938
ASGNP4
line 697
;697:s_selecttoolEd.list.itemnames[141] = "Targetname Tool Me (1 to 20)";
ADDRGP4 s_selecttoolEd+1412+104
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $941
ASGNP4
line 699
;698:
;699:	Menu_AddItem( &s_selecttoolEd.menu, &s_selecttoolEd.banner );
ADDRGP4 s_selecttoolEd
ARGP4
ADDRGP4 s_selecttoolEd+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 700
;700:	Menu_AddItem( &s_selecttoolEd.menu, &s_selecttoolEd.framel );
ADDRGP4 s_selecttoolEd
ARGP4
ADDRGP4 s_selecttoolEd+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 701
;701:	Menu_AddItem( &s_selecttoolEd.menu, &s_selecttoolEd.framer );
ADDRGP4 s_selecttoolEd
ARGP4
ADDRGP4 s_selecttoolEd+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 702
;702:	Menu_AddItem( &s_selecttoolEd.menu, &s_selecttoolEd.list );
ADDRGP4 s_selecttoolEd
ARGP4
ADDRGP4 s_selecttoolEd+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 703
;703:	Menu_AddItem( &s_selecttoolEd.menu, &s_selecttoolEd.arrows );
ADDRGP4 s_selecttoolEd
ARGP4
ADDRGP4 s_selecttoolEd+1544
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 704
;704:	Menu_AddItem( &s_selecttoolEd.menu, &s_selecttoolEd.left );
ADDRGP4 s_selecttoolEd
ARGP4
ADDRGP4 s_selecttoolEd+1660
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 705
;705:	Menu_AddItem( &s_selecttoolEd.menu, &s_selecttoolEd.right );
ADDRGP4 s_selecttoolEd
ARGP4
ADDRGP4 s_selecttoolEd+1776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 706
;706:	Menu_AddItem( &s_selecttoolEd.menu, &s_selecttoolEd.back );
ADDRGP4 s_selecttoolEd
ARGP4
ADDRGP4 s_selecttoolEd+1892
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 707
;707:	Menu_AddItem( &s_selecttoolEd.menu, &s_selecttoolEd.go );
ADDRGP4 s_selecttoolEd
ARGP4
ADDRGP4 s_selecttoolEd+2008
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 708
;708:}
LABELV $348
endproc selecttoolEd_MenuInit 16 12
export UI_selecttoolEdMenu
proc UI_selecttoolEdMenu 0 4
line 716
;709:
;710:
;711:/*
;712:===============
;713:UI_selecttoolEdMenu
;714:===============
;715:*/
;716:void UI_selecttoolEdMenu( void ) {
line 717
;717:	selecttoolEd_MenuInit();
ADDRGP4 selecttoolEd_MenuInit
CALLV
pop
line 718
;718:	UI_PushMenu( &s_selecttoolEd.menu );
ADDRGP4 s_selecttoolEd
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 719
;719:}
LABELV $951
endproc UI_selecttoolEdMenu 0 4
bss
align 4
LABELV s_selecttoolEd
skip 84044
align 4
LABELV s_loadMapEd
skip 788672
import UI_MapCallVote
import UI_saveMapEdMenu
import UI_saveMapEdMenu_Cache
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
LABELV $941
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 50
byte 1 48
byte 1 41
byte 1 0
align 1
LABELV $938
byte 1 71
byte 1 114
byte 1 97
byte 1 98
byte 1 32
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $935
byte 1 71
byte 1 114
byte 1 97
byte 1 98
byte 1 32
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $932
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $929
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $926
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $923
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $920
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $917
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $914
byte 1 83
byte 1 101
byte 1 116
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $911
byte 1 83
byte 1 101
byte 1 116
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $908
byte 1 83
byte 1 101
byte 1 116
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $905
byte 1 80
byte 1 114
byte 1 111
byte 1 112
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $902
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $899
byte 1 79
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $896
byte 1 82
byte 1 101
byte 1 115
byte 1 116
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $893
byte 1 78
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $890
byte 1 78
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $887
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 0
align 1
LABELV $884
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 0
align 1
LABELV $881
byte 1 68
byte 1 97
byte 1 114
byte 1 107
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $878
byte 1 70
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $875
byte 1 70
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $872
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $869
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $866
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $863
byte 1 78
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $860
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $857
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $854
byte 1 71
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $851
byte 1 83
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $848
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 66
byte 1 101
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $845
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $842
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $839
byte 1 73
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $836
byte 1 80
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $833
byte 1 75
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $830
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $827
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $824
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $821
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $818
byte 1 73
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $815
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $812
byte 1 66
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $809
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $806
byte 1 77
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $803
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $800
byte 1 66
byte 1 102
byte 1 103
byte 1 32
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $797
byte 1 83
byte 1 108
byte 1 117
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $794
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $791
byte 1 76
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
LABELV $788
byte 1 67
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $785
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $782
byte 1 66
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $779
byte 1 83
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $776
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 72
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $773
byte 1 66
byte 1 70
byte 1 71
byte 1 49
byte 1 48
byte 1 75
byte 1 0
align 1
LABELV $770
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $767
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $764
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $761
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $758
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $755
byte 1 77
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $752
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $749
byte 1 77
byte 1 101
byte 1 103
byte 1 97
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $746
byte 1 53
byte 1 48
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $743
byte 1 50
byte 1 53
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $740
byte 1 53
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $737
byte 1 72
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $734
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $731
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $728
byte 1 77
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 97
byte 1 108
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 49
byte 1 54
byte 1 57
byte 1 41
byte 1 0
align 1
LABELV $725
byte 1 78
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $722
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 0
align 1
LABELV $719
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 67
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 49
byte 1 49
byte 1 41
byte 1 0
align 1
LABELV $716
byte 1 84
byte 1 32
byte 1 72
byte 1 117
byte 1 114
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 57
byte 1 41
byte 1 0
align 1
LABELV $713
byte 1 84
byte 1 32
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 57
byte 1 41
byte 1 0
align 1
LABELV $710
byte 1 84
byte 1 32
byte 1 80
byte 1 117
byte 1 115
byte 1 104
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 57
byte 1 41
byte 1 0
align 1
LABELV $707
byte 1 84
byte 1 32
byte 1 77
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 57
byte 1 41
byte 1 0
align 1
LABELV $704
byte 1 80
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $701
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $698
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $695
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $692
byte 1 82
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $689
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 90
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $686
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 89
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $683
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 88
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $680
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $677
byte 1 68
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 32
byte 1 67
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $674
byte 1 67
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 67
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $671
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $668
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $665
byte 1 78
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $662
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $659
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $656
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $653
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $650
byte 1 70
byte 1 70
byte 1 65
byte 1 32
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $647
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 68
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $644
byte 1 80
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $641
byte 1 71
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $638
byte 1 80
byte 1 117
byte 1 115
byte 1 104
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $635
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $632
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $629
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $626
byte 1 76
byte 1 101
byte 1 103
byte 1 115
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $623
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $620
byte 1 67
byte 1 109
byte 1 100
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $617
byte 1 77
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $614
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $611
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $608
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $605
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $602
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $599
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $596
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $593
byte 1 72
byte 1 97
byte 1 108
byte 1 102
byte 1 32
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $590
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $587
byte 1 83
byte 1 101
byte 1 116
byte 1 32
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $584
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $581
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $578
byte 1 80
byte 1 108
byte 1 97
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $575
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $572
byte 1 82
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $569
byte 1 66
byte 1 111
byte 1 98
byte 1 98
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $566
byte 1 80
byte 1 101
byte 1 110
byte 1 100
byte 1 117
byte 1 108
byte 1 117
byte 1 109
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $563
byte 1 66
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $560
byte 1 68
byte 1 111
byte 1 111
byte 1 114
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $557
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 0
align 1
LABELV $554
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 0
align 1
LABELV $551
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $548
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $545
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $542
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $539
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $536
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 32
byte 1 40
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 53
byte 1 48
byte 1 48
byte 1 43
byte 1 41
byte 1 0
align 1
LABELV $533
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $530
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $527
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 122
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $524
byte 1 71
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $521
byte 1 68
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $518
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $504
byte 1 78
byte 1 111
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $359
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $337
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $321
byte 1 46
byte 1 97
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $299
byte 1 208
byte 1 164
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 187
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 46
byte 1 0
align 1
LABELV $294
byte 1 78
byte 1 111
byte 1 32
byte 1 77
byte 1 97
byte 1 112
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $279
byte 1 97
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $278
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $260
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 49
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
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $238
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
LABELV $220
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
LABELV $216
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
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $198
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
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $170
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
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $156
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
LABELV $142
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
LABELV $128
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
LABELV $120
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
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $114
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $88
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 97
byte 1 100
byte 1 100
byte 1 10
byte 1 0
