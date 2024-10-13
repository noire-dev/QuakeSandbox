data
export menuScoreboard
align 4
LABELV menuScoreboard
byte 4 0
export CG_Text_Width
code
proc CG_Text_Width 44 4
file "../../../code/cgame/cg_draw.c"
line 47
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
;23:// cg_draw.c -- draw all of the graphical elements during
;24:// active (after loading) gameplay
;25:
;26:#include "cg_local.h"
;27:
;28:#ifdef MISSIONPACK
;29:#include "../ui/ui_shared.h"
;30:
;31:// used for scoreboard
;32:extern displayContextDef_t cgDC;
;33:menuDef_t *menuScoreboard = NULL;
;34:#else
;35:int drawTeamOverlayModificationCount = -1;
;36:#endif
;37:
;38:int sortedTeamPlayers[TEAM_MAXOVERLAY];
;39:int	numSortedTeamPlayers;
;40:
;41:char systemChat[256];
;42:char teamChat1[256];
;43:char teamChat2[256];
;44:
;45:#ifdef MISSIONPACK
;46:
;47:int CG_Text_Width(const char *text, float scale, int limit) {
line 54
;48:  int count,len;
;49:	float out;
;50:	glyphInfo_t *glyph;
;51:	float useScale;
;52:// FIXME: see ui_main.c, same problem
;53://	const unsigned char *s = text;
;54:	const char *s = text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 55
;55:	fontInfo_t *font = &cgDC.Assets.textFont;
ADDRLP4 12
ADDRGP4 cgDC+228+12
ASGNP4
line 56
;56:	if (scale <= cg_smallFont.value) {
ADDRFP4 4
INDIRF4
ADDRGP4 cg_smallFont+8
INDIRF4
GTF4 $93
line 57
;57:		font = &cgDC.Assets.smallFont;
ADDRLP4 12
ADDRGP4 cgDC+228+20560
ASGNP4
line 58
;58:	} else if (scale > cg_bigFont.value) {
ADDRGP4 $94
JUMPV
LABELV $93
ADDRFP4 4
INDIRF4
ADDRGP4 cg_bigFont+8
INDIRF4
LEF4 $98
line 59
;59:		font = &cgDC.Assets.bigFont;
ADDRLP4 12
ADDRGP4 cgDC+228+41108
ASGNP4
line 60
;60:	}
LABELV $98
LABELV $94
line 61
;61:	useScale = scale * font->glyphScale;
ADDRLP4 24
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 62
;62:  out = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 63
;63:  if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $103
line 64
;64:    len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 65
;65:		if (limit > 0 && len > limit) {
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $105
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $105
line 66
;66:			len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 67
;67:		}
LABELV $105
line 68
;68:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $107
line 69
;69:		while (s && *s && count < len) {
line 70
;70:			if ( Q_IsColorString(s) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $110
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $110
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $110
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $110
ADDRLP4 40
INDIRI4
CNSTI4 57
GTI4 $110
line 71
;71:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 72
;72:				continue;
ADDRGP4 $108
JUMPV
LABELV $110
line 73
;73:			} else {
line 74
;74:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 16
CNSTI4 80
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ASGNP4
line 75
;75:				out += glyph->xSkip;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 76
;76:				s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 77
;77:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 78
;78:			}
line 79
;79:    }
LABELV $108
line 69
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $113
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $113
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $107
LABELV $113
line 80
;80:  }
LABELV $103
line 81
;81:  return out * useScale;
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $90
endproc CG_Text_Width 44 4
export CG_Text_Height
proc CG_Text_Height 44 4
line 84
;82:}
;83:
;84:int CG_Text_Height(const char *text, float scale, int limit) {
line 91
;85:  int len, count;
;86:	float max;
;87:	glyphInfo_t *glyph;
;88:	float useScale;
;89:// TTimo: FIXME
;90://	const unsigned char *s = text;
;91:	const char *s = text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 92
;92:	fontInfo_t *font = &cgDC.Assets.textFont;
ADDRLP4 20
ADDRGP4 cgDC+228+12
ASGNP4
line 93
;93:	if (scale <= cg_smallFont.value) {
ADDRFP4 4
INDIRF4
ADDRGP4 cg_smallFont+8
INDIRF4
GTF4 $117
line 94
;94:		font = &cgDC.Assets.smallFont;
ADDRLP4 20
ADDRGP4 cgDC+228+20560
ASGNP4
line 95
;95:	} else if (scale > cg_bigFont.value) {
ADDRGP4 $118
JUMPV
LABELV $117
ADDRFP4 4
INDIRF4
ADDRGP4 cg_bigFont+8
INDIRF4
LEF4 $122
line 96
;96:		font = &cgDC.Assets.bigFont;
ADDRLP4 20
ADDRGP4 cgDC+228+41108
ASGNP4
line 97
;97:	}
LABELV $122
LABELV $118
line 98
;98:	useScale = scale * font->glyphScale;
ADDRLP4 24
ADDRFP4 4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 99
;99:  max = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 100
;100:  if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $127
line 101
;101:    len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 102
;102:		if (limit > 0 && len > limit) {
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $129
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $129
line 103
;103:			len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 104
;104:		}
LABELV $129
line 105
;105:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $131
line 106
;106:		while (s && *s && count < len) {
line 107
;107:			if ( Q_IsColorString(s) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $134
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $134
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $134
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $134
ADDRLP4 40
INDIRI4
CNSTI4 57
GTI4 $134
line 108
;108:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 109
;109:				continue;
ADDRGP4 $132
JUMPV
LABELV $134
line 110
;110:			} else {
line 111
;111:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 12
CNSTI4 80
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 20
INDIRP4
ADDP4
ASGNP4
line 112
;112:	      if (max < glyph->height) {
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
GEF4 $136
line 113
;113:		      max = glyph->height;
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
line 114
;114:			  }
LABELV $136
line 115
;115:				s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 116
;116:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 117
;117:			}
line 118
;118:    }
LABELV $132
line 106
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $139
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $139
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $131
LABELV $139
line 119
;119:  }
LABELV $127
line 120
;120:  return max * useScale;
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $114
endproc CG_Text_Height 44 4
export CG_Text_PaintChar
proc CG_Text_PaintChar 8 36
line 123
;121:}
;122:
;123:void CG_Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
line 125
;124:  float w, h;
;125:  w = width * scale;
ADDRLP4 0
ADDRFP4 8
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 126
;126:  h = height * scale;
ADDRLP4 4
ADDRFP4 12
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 127
;127:  CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 128
;128:  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 24
INDIRF4
ARGF4
ADDRFP4 28
INDIRF4
ARGF4
ADDRFP4 32
INDIRF4
ARGF4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 129
;129:}
LABELV $140
endproc CG_Text_PaintChar 8 36
export CG_Text_Paint
proc CG_Text_Paint 80 40
line 131
;130:
;131:void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) {
line 136
;132:  int len, count;
;133:	vec4_t newColor;
;134:	glyphInfo_t *glyph;
;135:	float useScale;
;136:	fontInfo_t *font = &cgDC.Assets.textFont;
ADDRLP4 28
ADDRGP4 cgDC+228+12
ASGNP4
line 137
;137:	if (scale <= cg_smallFont.value) {
ADDRFP4 8
INDIRF4
ADDRGP4 cg_smallFont+8
INDIRF4
GTF4 $144
line 138
;138:		font = &cgDC.Assets.smallFont;
ADDRLP4 28
ADDRGP4 cgDC+228+20560
ASGNP4
line 139
;139:	} else if (scale > cg_bigFont.value) {
ADDRGP4 $145
JUMPV
LABELV $144
ADDRFP4 8
INDIRF4
ADDRGP4 cg_bigFont+8
INDIRF4
LEF4 $149
line 140
;140:		font = &cgDC.Assets.bigFont;
ADDRLP4 28
ADDRGP4 cgDC+228+41108
ASGNP4
line 141
;141:	}
LABELV $149
LABELV $145
line 142
;142:	useScale = scale * font->glyphScale;
ADDRLP4 20
ADDRFP4 8
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 143
;143:  if (text) {
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $154
line 146
;144:// TTimo: FIXME
;145://		const unsigned char *s = text;
;146:		const char *s = text;
ADDRLP4 36
ADDRFP4 16
INDIRP4
ASGNP4
line 147
;147:		trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 148
;148:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 149
;149:    len = strlen(text);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 150
;150:		if (limit > 0 && len > limit) {
ADDRLP4 44
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LEI4 $156
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $156
line 151
;151:			len = limit;
ADDRLP4 32
ADDRFP4 24
INDIRI4
ASGNI4
line 152
;152:		}
LABELV $156
line 153
;153:		count = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $159
JUMPV
LABELV $158
line 154
;154:		while (s && *s && count < len) {
line 155
;155:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 0
CNSTI4 80
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ASGNP4
line 156
;156:			if ( Q_IsColorString( s ) ) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $161
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $161
ADDRLP4 52
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $161
ADDRLP4 52
INDIRI4
CNSTI4 48
LTI4 $161
ADDRLP4 52
INDIRI4
CNSTI4 57
GTI4 $161
line 157
;157:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 4
LSHI4
ADDRGP4 g_color_table-768
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 158
;158:				newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 159
;159:				trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 160
;160:				s += 2;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 161
;161:				continue;
ADDRGP4 $159
JUMPV
LABELV $161
line 162
;162:			} else {
line 163
;163:				float yadj = useScale * glyph->top;
ADDRLP4 56
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 164
;164:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
ADDRLP4 60
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 3
EQI4 $167
ADDRLP4 60
INDIRI4
CNSTI4 6
NEI4 $165
LABELV $167
line 165
;165:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $169
ADDRLP4 68
CNSTI4 1
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $169
ADDRLP4 68
CNSTI4 2
ASGNI4
LABELV $170
ADDRLP4 64
ADDRLP4 68
INDIRI4
ASGNI4
line 166
;166:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 167
;167:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 168
;168:					CG_Text_PaintChar(x + ofs, y - yadj + ofs,
ADDRLP4 72
ADDRLP4 64
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 56
INDIRF4
SUBF4
ADDRLP4 72
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 177
;169:														glyph->imageWidth,
;170:														glyph->imageHeight,
;171:														useScale,
;172:														glyph->s,
;173:														glyph->t,
;174:														glyph->s2,
;175:														glyph->t2,
;176:														glyph->glyph);
;177:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 178
;178:					trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 179
;179:				}
LABELV $165
line 180
;180:				CG_Text_PaintChar(x, y - yadj,
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 56
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 190
;181:													glyph->imageWidth,
;182:													glyph->imageHeight,
;183:													useScale,
;184:													glyph->s,
;185:													glyph->t,
;186:													glyph->s2,
;187:													glyph->t2,
;188:													glyph->glyph);
;189:				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight, cgDC.Assets.textFont.glyphs[text[i]].glyph);
;190:				x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
ADDRFP4 20
INDIRF4
ADDF4
ADDF4
ASGNF4
line 191
;191:				s++;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 192
;192:				count++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 193
;193:			}
line 194
;194:    }
LABELV $159
line 154
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $175
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $175
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $158
LABELV $175
line 195
;195:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 196
;196:  }
LABELV $154
line 197
;197:}
LABELV $141
endproc CG_Text_Paint 80 40
proc CG_DrawField 72 20
line 202
;198:
;199:
;200:#endif
;201:
;202:static void CG_DrawField (int x, int y, int width, int value, float size) {
line 207
;203:	char	num[16], *ptr;
;204:	int		l;
;205:	int		frame;
;206:
;207:	if ( width < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $177
line 208
;208:		return;
ADDRGP4 $176
JUMPV
LABELV $177
line 212
;209:	}
;210:
;211:	// draw number string
;212:	if ( width > 6 ) {
ADDRFP4 8
INDIRI4
CNSTI4 6
LEI4 $179
line 213
;213:		width = 6;
ADDRFP4 8
CNSTI4 6
ASGNI4
line 214
;214:	}
LABELV $179
line 216
;215:
;216:	switch ( width ) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LTI4 $181
ADDRLP4 28
INDIRI4
CNSTI4 5
GTI4 $181
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $218-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $218
address $183
address $190
address $197
address $204
address $211
code
LABELV $183
line 218
;217:	case 1:
;218:		value = value > 9 ? 9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9
LEI4 $185
ADDRLP4 32
CNSTI4 9
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $185
ADDRLP4 32
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $186
ADDRFP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 219
;219:		value = value < 0 ? 0 : value;
ADDRFP4 12
INDIRI4
CNSTI4 0
GEI4 $188
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 $189
JUMPV
LABELV $188
ADDRLP4 36
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $189
ADDRFP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 220
;220:		break;
ADDRGP4 $182
JUMPV
LABELV $190
line 222
;221:	case 2:
;222:		value = value > 99 ? 99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 99
LEI4 $192
ADDRLP4 40
CNSTI4 99
ASGNI4
ADDRGP4 $193
JUMPV
LABELV $192
ADDRLP4 40
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $193
ADDRFP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 223
;223:		value = value < -9 ? -9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -9
GEI4 $195
ADDRLP4 44
CNSTI4 -9
ASGNI4
ADDRGP4 $196
JUMPV
LABELV $195
ADDRLP4 44
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $196
ADDRFP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 224
;224:		break;
ADDRGP4 $182
JUMPV
LABELV $197
line 226
;225:	case 3:
;226:		value = value > 999 ? 999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 999
LEI4 $199
ADDRLP4 48
CNSTI4 999
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $199
ADDRLP4 48
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $200
ADDRFP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 227
;227:		value = value < -99 ? -99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -99
GEI4 $202
ADDRLP4 52
CNSTI4 -99
ASGNI4
ADDRGP4 $203
JUMPV
LABELV $202
ADDRLP4 52
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $203
ADDRFP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 228
;228:		break;
ADDRGP4 $182
JUMPV
LABELV $204
line 230
;229:	case 4:
;230:		value = value > 9999 ? 9999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9999
LEI4 $206
ADDRLP4 56
CNSTI4 9999
ASGNI4
ADDRGP4 $207
JUMPV
LABELV $206
ADDRLP4 56
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $207
ADDRFP4 12
ADDRLP4 56
INDIRI4
ASGNI4
line 231
;231:		value = value < -999 ? -999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -999
GEI4 $209
ADDRLP4 60
CNSTI4 -999
ASGNI4
ADDRGP4 $210
JUMPV
LABELV $209
ADDRLP4 60
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $210
ADDRFP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 232
;232:		break;
ADDRGP4 $182
JUMPV
LABELV $211
line 234
;233:	case 5:
;234:		value = value > 99999 ? 99999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 99999
LEI4 $213
ADDRLP4 64
CNSTI4 99999
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $213
ADDRLP4 64
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $214
ADDRFP4 12
ADDRLP4 64
INDIRI4
ASGNI4
line 235
;235:		value = value < -9999 ? -9999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -9999
GEI4 $216
ADDRLP4 68
CNSTI4 -9999
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $216
ADDRLP4 68
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $217
ADDRFP4 12
ADDRLP4 68
INDIRI4
ASGNI4
line 236
;236:		break;
LABELV $181
LABELV $182
line 239
;237:	}
;238:
;239:	Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $220
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 240
;240:	l = strlen(num);
ADDRLP4 12
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 241
;241:	if (l > width)
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $221
line 242
;242:		l = width;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $221
line 243
;243:	x += 2 + CHAR_WIDTH*(width - l)*size;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTI4 19
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
MULI4
CVIF4 4
ADDRFP4 16
INDIRF4
MULF4
CNSTF4 1073741824
ADDF4
ADDF4
CVFI4 4
ASGNI4
line 245
;244:
;245:	ptr = num;
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $224
JUMPV
LABELV $223
line 247
;246:	while (*ptr && l)
;247:	{
line 248
;248:		if (*ptr == '-')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $226
line 249
;249:			frame = STAT_MINUS;
ADDRLP4 8
CNSTI4 10
ASGNI4
ADDRGP4 $227
JUMPV
LABELV $226
line 251
;250:		else
;251:			frame = *ptr -'0';
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
LABELV $227
line 253
;252:
;253:		CG_DrawPic( x,y, CHAR_WIDTH*size, CHAR_HEIGHT*size, cgs.media.numberShaders[frame] );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRFP4 16
INDIRF4
ASGNF4
CNSTF4 1100480512
ADDRLP4 36
INDIRF4
MULF4
ARGF4
CNSTF4 1105199104
ADDRLP4 36
INDIRF4
MULF4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1392
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 254
;254:		x += CHAR_WIDTH*size;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1100480512
ADDRFP4 16
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 255
;255:		ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 256
;256:		l--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 257
;257:	}
LABELV $224
line 246
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
EQI4 $230
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $223
LABELV $230
line 258
;258:}
LABELV $176
endproc CG_DrawField 72 20
export CG_Draw3DModel
proc CG_Draw3DModel 548 16
line 266
;259:
;260:/*
;261:================
;262:CG_Draw3DModel
;263:
;264:================
;265:*/
;266:void CG_Draw3DModel( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
line 270
;267:	refdef_t		refdef;
;268:	refEntity_t		ent;
;269:
;270:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRLP4 544
CNSTI4 0
ASGNI4
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 544
INDIRI4
EQI4 $236
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 544
INDIRI4
NEI4 $232
LABELV $236
line 271
;271:		return;
ADDRGP4 $231
JUMPV
LABELV $232
line 274
;272:	}
;273:
;274:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 276
;275:
;276:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 278
;277:
;278:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 279
;279:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 280
;280:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 281
;281:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 282
;282:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 283
;283:	ent.shaderRGBA[0] = cg_helightred.integer;
ADDRLP4 368+116
ADDRGP4 cg_helightred+12
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 284
;284:	ent.shaderRGBA[1] = cg_helightgreen.integer;
ADDRLP4 368+116+1
ADDRGP4 cg_helightgreen+12
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 285
;285:	ent.shaderRGBA[2] = cg_helightblue.integer;
ADDRLP4 368+116+2
ADDRGP4 cg_helightblue+12
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 286
;286:	ent.shaderRGBA[3] = 255;
ADDRLP4 368+116+3
CNSTU1 255
ASGNU1
line 287
;287:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 289
;288:
;289:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 291
;290:
;291:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 293
;292:
;293:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 294
;294:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 296
;295:
;296:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 297
;297:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 298
;298:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 299
;299:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 301
;300:
;301:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 303
;302:
;303:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 304
;304:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 305
;305:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 306
;306:}
LABELV $231
endproc CG_Draw3DModel 548 16
export CG_Draw3DModelCopy
proc CG_Draw3DModelCopy 564 16
line 308
;307:
;308:void CG_Draw3DModelCopy( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
line 312
;309:	refdef_t		refdef;
;310:	refEntity_t		ent;
;311:
;312:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRLP4 544
CNSTI4 0
ASGNI4
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 544
INDIRI4
EQI4 $266
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 544
INDIRI4
NEI4 $262
LABELV $266
line 313
;313:		return;
ADDRGP4 $261
JUMPV
LABELV $262
line 316
;314:	}
;315:
;316:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 318
;317:
;318:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 176
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 320
;319:
;320:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 321
;321:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 322
;322:	VectorCopy( origin, ent.origin );
ADDRLP4 0+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 323
;323:	ent.hModel = model;
ADDRLP4 0+8
ADDRFP4 16
INDIRI4
ASGNI4
line 325
;324:	//ent.customSkin = skin;
;325:	ent.shaderRGBA[0] = 0;
ADDRLP4 0+116
CNSTU1 0
ASGNU1
line 326
;326:	ent.shaderRGBA[1] = 0;
ADDRLP4 0+116+1
CNSTU1 0
ASGNU1
line 327
;327:	ent.shaderRGBA[2] = 0;
ADDRLP4 0+116+2
CNSTU1 0
ASGNU1
line 328
;328:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 329
;329:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 331
;330:
;331:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 176+76
CNSTI4 1
ASGNI4
line 333
;332:
;333:	AxisClear( refdef.viewaxis );
ADDRLP4 176+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 335
;334:
;335:	refdef.fov_x = 90;
ADDRLP4 176+16
CNSTF4 1119092736
ASGNF4
line 336
;336:	refdef.fov_y = 90;
ADDRLP4 176+20
CNSTF4 1119092736
ASGNF4
line 338
;337:
;338:ent.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 339
;339:ent.customSkin = trap_R_RegisterSkin(va("%s/%s.skin", sb_texture_view.string, sb_texturename.string));
ADDRGP4 $283
ARGP4
ADDRGP4 sb_texture_view+16
ARGP4
ADDRGP4 sb_texturename+16
ARGP4
ADDRLP4 548
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 548
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRLP4 0+108
ADDRLP4 552
INDIRI4
ASGNI4
line 340
;340:if(sb_texturename.integer > 0){		
ADDRGP4 sb_texturename+12
INDIRI4
CNSTI4 0
LEI4 $286
line 341
;341:ent.customShader = trap_R_RegisterShader(va("%s/%s", sb_texture_view.string, sb_texturename.string));
ADDRGP4 $290
ARGP4
ADDRGP4 sb_texture_view+16
ARGP4
ADDRGP4 sb_texturename+16
ARGP4
ADDRLP4 556
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 556
INDIRP4
ARGP4
ADDRLP4 560
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0+112
ADDRLP4 560
INDIRI4
ASGNI4
line 342
;342:}					
LABELV $286
line 343
;343:if(sb_texturename.integer == 255){	
ADDRGP4 sb_texturename+12
INDIRI4
CNSTI4 255
NEI4 $293
line 344
;344:ent.customShader = cgs.media.ptexShader[1];
ADDRLP4 0+112
ADDRGP4 cgs+956380+1576+4
INDIRI4
ASGNI4
line 345
;345:}
LABELV $293
line 347
;346:
;347:	refdef.x = x;
ADDRLP4 176
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 348
;348:	refdef.y = y;
ADDRLP4 176+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 349
;349:	refdef.width = w;
ADDRLP4 176+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 350
;350:	refdef.height = h;
ADDRLP4 176+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 352
;351:
;352:	refdef.time = cg.time;
ADDRLP4 176+72
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 354
;353:
;354:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 355
;355:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 356
;356:	trap_R_RenderScene( &refdef );
ADDRLP4 176
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 357
;357:}
LABELV $261
endproc CG_Draw3DModelCopy 564 16
export CG_DrawHead
proc CG_DrawHead 56 32
line 366
;358:
;359:/*
;360:================
;361:CG_DrawHead
;362:
;363:Used for both the status bar and the scoreboard
;364:================
;365:*/
;366:void CG_DrawHead( float x, float y, float w, float h, int clientNum, vec3_t headAngles ) {
line 373
;367:	clipHandle_t	cm;
;368:	clientInfo_t	*ci;
;369:	float			len;
;370:	vec3_t			origin;
;371:	vec3_t			mins, maxs;
;372:
;373:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
CNSTI4 1944
ADDRFP4 16
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 375
;374:
;375:	if ( cg_draw3dIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $307
line 376
;376:		cm = ci->headModel;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ASGNI4
line 377
;377:		if ( !cm ) {
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $310
line 378
;378:			return;
ADDRGP4 $305
JUMPV
LABELV $310
line 382
;379:		}
;380:
;381:		// offset the origin y and z to center the head
;382:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 384
;383:
;384:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 4+8
CNSTF4 3204448256
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 385
;385:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 4+4
CNSTF4 1056964608
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 389
;386:
;387:		// calculate distance so the head nearly fills the box
;388:		// assume heads are taller than wide
;389:		len = 0.7 * ( maxs[2] - mins[2] );
ADDRLP4 44
CNSTF4 1060320051
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 390
;390:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 4
ADDRLP4 44
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 393
;391:
;392:		// allow per-model tweaking
;393:		VectorAdd( origin, ci->headOffset, origin );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
ADDF4
ASGNF4
line 395
;394:
;395:		CG_Draw3DModel( x, y, w, h, ci->headModel, ci->headSkin, origin, headAngles );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 396
;396:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $308
JUMPV
LABELV $307
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $324
line 397
;397:		CG_DrawPic( x, y, w, h, ci->modelIcon );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 398
;398:	}
LABELV $324
LABELV $308
line 401
;399:
;400:	// if they are deferred, draw a cross out
;401:	if ( ci->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
EQI4 $327
line 402
;402:		CG_DrawPic( x, y, w, h, cgs.media.deferShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 cgs+956380+204
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 403
;403:	}
LABELV $327
line 404
;404:}
LABELV $305
endproc CG_DrawHead 56 32
export CG_DrawFlagModel
proc CG_DrawFlagModel 72 32
line 413
;405:
;406:/*
;407:================
;408:CG_DrawFlagModel
;409:
;410:Used for both the status bar and the scoreboard
;411:================
;412:*/
;413:void CG_DrawFlagModel( float x, float y, float w, float h, int team, qboolean force2D ) {
line 420
;414:	qhandle_t		cm;
;415:	float			len;
;416:	vec3_t			origin, angles;
;417:	vec3_t			mins, maxs;
;418:	qhandle_t		handle;
;419:
;420:	if ( !force2D && cg_draw3dIcons.integer ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $332
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $332
line 422
;421:
;422:		VectorClear( angles );
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 64
INDIRF4
ASGNF4
line 424
;423:
;424:		cm = cgs.media.redFlagModel;
ADDRLP4 52
ADDRGP4 cgs+956380+44
INDIRI4
ASGNI4
line 427
;425:
;426:		// offset the origin y and z to center the flag
;427:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 429
;428:
;429:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 12+8
CNSTF4 3204448256
ADDRLP4 24+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 430
;430:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 12+4
CNSTF4 1056964608
ADDRLP4 24+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 434
;431:
;432:		// calculate distance so the flag nearly fills the box
;433:		// assume heads are taller than wide
;434:		len = 0.5 * ( maxs[2] - mins[2] );
ADDRLP4 56
CNSTF4 1056964608
ADDRLP4 36+8
INDIRF4
ADDRLP4 24+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 435
;435:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 12
ADDRLP4 56
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 437
;436:
;437:		angles[YAW] = 60 * sin( cg.time / 2000.0 );;
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1114636288
ADDRLP4 68
INDIRF4
MULF4
ASGNF4
line 439
;438:
;439:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $349
line 440
;440:			handle = cgs.media.redFlagModel;
ADDRLP4 48
ADDRGP4 cgs+956380+44
INDIRI4
ASGNI4
line 441
;441:			if(cgs.gametype == GT_DOUBLE_D){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 12
NEI4 $350
line 442
;442:				if(cgs.redflag == TEAM_BLUE)
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 2
NEI4 $356
line 443
;443:					handle = cgs.media.blueFlagModel;
ADDRLP4 48
ADDRGP4 cgs+956380+48
INDIRI4
ASGNI4
LABELV $356
line 444
;444:				if(cgs.redflag == TEAM_FREE)
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 0
NEI4 $361
line 445
;445:					handle = cgs.media.neutralFlagModel;
ADDRLP4 48
ADDRGP4 cgs+956380+52
INDIRI4
ASGNI4
LABELV $361
line 446
;446:				if(cgs.redflag == TEAM_NONE)
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 3
NEI4 $350
line 447
;447:					handle = cgs.media.neutralFlagModel;
ADDRLP4 48
ADDRGP4 cgs+956380+52
INDIRI4
ASGNI4
line 448
;448:			}
line 449
;449:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $350
JUMPV
LABELV $349
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $371
line 450
;450:			handle = cgs.media.blueFlagModel;
ADDRLP4 48
ADDRGP4 cgs+956380+48
INDIRI4
ASGNI4
line 451
;451:			if(cgs.gametype == GT_DOUBLE_D){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 12
NEI4 $372
line 452
;452:				if(cgs.redflag == TEAM_BLUE)
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 2
NEI4 $378
line 453
;453:					handle = cgs.media.blueFlagModel;
ADDRLP4 48
ADDRGP4 cgs+956380+48
INDIRI4
ASGNI4
LABELV $378
line 454
;454:				if(cgs.redflag == TEAM_FREE)
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 0
NEI4 $383
line 455
;455:					handle = cgs.media.neutralFlagModel;
ADDRLP4 48
ADDRGP4 cgs+956380+52
INDIRI4
ASGNI4
LABELV $383
line 456
;456:				if(cgs.redflag == TEAM_NONE)
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 3
NEI4 $372
line 457
;457:					handle = cgs.media.neutralFlagModel;
ADDRLP4 48
ADDRGP4 cgs+956380+52
INDIRI4
ASGNI4
line 458
;458:			}
line 459
;459:		} else if( team == TEAM_FREE ) {
ADDRGP4 $372
JUMPV
LABELV $371
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $331
line 460
;460:			handle = cgs.media.neutralFlagModel;
ADDRLP4 48
ADDRGP4 cgs+956380+52
INDIRI4
ASGNI4
line 461
;461:		} else {
line 462
;462:			return;
LABELV $394
LABELV $372
LABELV $350
line 464
;463:		}
;464:		CG_Draw3DModel( x, y, w, h, handle, 0, origin, angles );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 465
;465:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $333
JUMPV
LABELV $332
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $397
line 468
;466:		gitem_t *item;
;467:
;468:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $400
line 469
;469:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 470
;470:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $401
JUMPV
LABELV $400
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $402
line 471
;471:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 472
;472:		} else if( team == TEAM_FREE ) {
ADDRGP4 $403
JUMPV
LABELV $402
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $331
line 473
;473:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 68
INDIRP4
ASGNP4
line 474
;474:		} else {
line 475
;475:			return;
LABELV $405
LABELV $403
LABELV $401
line 477
;476:		}
;477:		if (item) {
ADDRLP4 64
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $406
line 478
;478:		  CG_DrawPic( x, y, w, h, cg_items[ ITEM_INDEX(item) ].icon );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 56
DIVI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 479
;479:		}
LABELV $406
line 480
;480:	}
LABELV $397
LABELV $333
line 481
;481:}
LABELV $331
endproc CG_DrawFlagModel 72 32
export CG_DrawEmptyModel
proc CG_DrawEmptyModel 72 32
line 483
;482:
;483:void CG_DrawEmptyModel( float x, float y, float w, float h, int team, qboolean force2D ) {
line 490
;484:	qhandle_t		cm;
;485:	float			len;
;486:	vec3_t			origin, angles;
;487:	vec3_t			mins, maxs;
;488:	qhandle_t		handle;
;489:
;490:	VectorClear( angles );
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 60
INDIRF4
ASGNF4
line 492
;491:
;492:	cm = cgs.media.redFlagModel;
ADDRLP4 48
ADDRGP4 cgs+956380+44
INDIRI4
ASGNI4
line 495
;493:
;494:	// offset the origin y and z to center the flag
;495:	trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 497
;496:
;497:	origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 12+8
CNSTF4 3204448256
ADDRLP4 24+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 498
;498:	origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 12+4
CNSTF4 1056964608
ADDRLP4 24+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 502
;499:
;500:	// calculate distance so the flag nearly fills the box
;501:	// assume heads are taller than wide
;502:	len = 0.5 * ( maxs[2] - mins[2] );
ADDRLP4 52
CNSTF4 1056964608
ADDRLP4 36+8
INDIRF4
ADDRLP4 24+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 503
;503:	origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 12
ADDRLP4 52
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 505
;504:
;505:	angles[YAW] = 60 * sin( cg.time / 2000.0 );;
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ARGF4
ADDRLP4 64
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1114636288
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
line 507
;506:
;507:	handle = trap_R_RegisterModel_MiTech( "models/weapons2/gauntlet/gauntlet.md3" );
ADDRGP4 $424
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRLP4 56
ADDRLP4 68
INDIRI4
ASGNI4
line 509
;508:	
;509:	CG_Draw3DModel( x, y, w, h, handle, 0, origin, angles );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 510
;510:}
LABELV $409
endproc CG_DrawEmptyModel 72 32
proc CG_DrawStatusBarFlag 12 24
line 518
;511:
;512:/*
;513:================
;514:CG_DrawStatusBarFlag
;515:
;516:================
;517:*/
;518:static void CG_DrawStatusBarFlag( int team, int show ) {
line 519
;519:	if(show >= 1){
ADDRFP4 4
INDIRI4
CNSTI4 1
LTI4 $426
line 520
;520:	CG_DrawFlagModel( 0 - cl_screenoffset.integer, 480 - ICON_SIZE - 35, ICON_SIZE, ICON_SIZE, team, qfalse );
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1137737728
ARGF4
ADDRLP4 4
CNSTF4 1105199104
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 521
;521:	} else {
ADDRGP4 $427
JUMPV
LABELV $426
line 522
;522:	CG_DrawEmptyModel( 0 - cl_screenoffset.integer, 480 - ICON_SIZE - 35, ICON_SIZE, ICON_SIZE, team, qfalse );
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1137737728
ARGF4
ADDRLP4 4
CNSTF4 1105199104
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawEmptyModel
CALLV
pop
line 523
;523:	CG_DrawEmptyModel( 640 + cl_screenoffset.integer - ICON_SIZE - 35, 480 - ICON_SIZE - 35, ICON_SIZE, ICON_SIZE, team, qfalse );
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 640
ADDI4
CNSTI4 28
SUBI4
CNSTI4 35
SUBI4
CVIF4 4
ARGF4
CNSTF4 1137737728
ARGF4
ADDRLP4 8
CNSTF4 1105199104
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawEmptyModel
CALLV
pop
line 524
;524:	}
LABELV $427
line 525
;525:}
LABELV $425
endproc CG_DrawStatusBarFlag 12 24
export CG_DrawTeamBackground
proc CG_DrawTeamBackground 16 4
line 534
;526:
;527:/*
;528:================
;529:CG_DrawTeamBackground
;530:
;531:================
;532:*/
;533:void CG_DrawTeamBackground( int x, int y, int w, int h, float alpha, int team )
;534:{
line 537
;535:	vec4_t		hcolor;
;536:
;537:	hcolor[3] = alpha;
ADDRLP4 0+12
ADDRFP4 16
INDIRF4
ASGNF4
line 538
;538:	if ( team == TEAM_RED ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
NEI4 $433
line 539
;539:		hcolor[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 540
;540:		hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 541
;541:		hcolor[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 542
;542:	} else if ( team == TEAM_BLUE ) {
ADDRGP4 $434
JUMPV
LABELV $433
ADDRFP4 20
INDIRI4
CNSTI4 2
NEI4 $431
line 543
;543:		hcolor[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 544
;544:		hcolor[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 545
;545:		hcolor[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 546
;546:	} else {
line 547
;547:		return;
LABELV $438
LABELV $434
line 549
;548:	}
;549:	trap_R_SetColor( hcolor );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 551
;550://	CG_DrawPic( 0 - cgs.glconfig.vidWidth, y, cgs.glconfig.vidWidth * 2, cgs.glconfig.vidHeight, cgs.media.teamStatusBar );
;551:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 552
;552:}
LABELV $431
endproc CG_DrawTeamBackground 16 4
proc CG_DrawToolgun 56 32
line 554
;553:
;554:static void CG_DrawToolgun() {
line 560
;555:	float y;
;556:	vec3_t		angles;
;557:	vec3_t		origin;
;558:	gitem_t	*it;
;559:	
;560:		if(toolgun_tool.integer == 0){
ADDRGP4 toolgun_tool+12
INDIRI4
CNSTI4 0
NEI4 $442
line 561
;561:		trap_R_RemapShader( "models/weapons/toolgun/screen", "models/weapons/toolgun/screen", "0.005" );
ADDRLP4 32
ADDRGP4 $445
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRGP4 trap_R_RemapShader
CALLV
pop
line 562
;562:		} else {
ADDRGP4 $443
JUMPV
LABELV $442
line 563
;563:		if(trap_R_RegisterShader(va("models/weapons/toolgun/tool%i", toolgun_tool.integer)) != 0){
ADDRGP4 $449
ARGP4
ADDRGP4 toolgun_tool+12
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $447
line 564
;564:		trap_R_RemapShader( "models/weapons/toolgun/screen", va("models/weapons/toolgun/tool%i", toolgun_tool.integer) , "0.005" );
ADDRGP4 $449
ARGP4
ADDRGP4 toolgun_tool+12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $445
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRGP4 trap_R_RemapShader
CALLV
pop
line 565
;565:		} else {
ADDRGP4 $448
JUMPV
LABELV $447
line 566
;566:		trap_R_RemapShader( "models/weapons/toolgun/screen", "models/weapons/toolgun/toolerror", "0.005" );
ADDRGP4 $445
ARGP4
ADDRGP4 $452
ARGP4
ADDRGP4 $446
ARGP4
ADDRGP4 trap_R_RemapShader
CALLV
pop
line 567
;567:		}
LABELV $448
line 568
;568:		}
LABELV $443
line 570
;569:		
;570:		CG_DrawPic( -1 - cl_screenoffset.integer, 0+cg_toolguninfo.integer, 300, 125, trap_R_RegisterShaderNoMip( "menu/art/blacktrans" ) );
ADDRGP4 $455
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
CNSTI4 -1
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 cg_toolguninfo+12
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1133903872
ARGF4
CNSTF4 1123680256
ARGF4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 572
;571:
;572:		CG_DrawGiantString( 0 - cl_screenoffset.integer, 2+cg_toolguninfo.integer, toolgun_tooltext.string, 1.0F);
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRGP4 cg_toolguninfo+12
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRGP4 toolgun_tooltext+16
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawGiantString
CALLV
pop
line 573
;573:		if(toolgun_mod19.integer == 0){
ADDRGP4 toolgun_mod19+12
INDIRI4
CNSTI4 0
NEI4 $459
line 574
;574:		CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, toolgun_toolmode1.string, 1.0F);
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRGP4 cg_toolguninfo+12
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 toolgun_toolmode1+16
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 575
;575:		} else
ADDRGP4 $460
JUMPV
LABELV $459
line 576
;576:		if(toolgun_mod19.integer == 1){
ADDRGP4 toolgun_mod19+12
INDIRI4
CNSTI4 1
NEI4 $465
line 577
;577:		CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, toolgun_toolmode2.string, 1.0F);
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRGP4 cg_toolguninfo+12
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 toolgun_toolmode2+16
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 578
;578:		} else
ADDRGP4 $466
JUMPV
LABELV $465
line 579
;579:		if(toolgun_mod19.integer == 2){
ADDRGP4 toolgun_mod19+12
INDIRI4
CNSTI4 2
NEI4 $471
line 580
;580:		CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, toolgun_toolmode3.string, 1.0F);
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRGP4 cg_toolguninfo+12
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 toolgun_toolmode3+16
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 581
;581:		} else
ADDRGP4 $472
JUMPV
LABELV $471
line 582
;582:		if(toolgun_mod19.integer == 3){
ADDRGP4 toolgun_mod19+12
INDIRI4
CNSTI4 3
NEI4 $477
line 583
;583:		CG_DrawBigString( 0 - cl_screenoffset.integer, 32+cg_toolguninfo.integer, toolgun_toolmode4.string, 1.0F);
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRGP4 cg_toolguninfo+12
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRGP4 toolgun_toolmode4+16
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 584
;584:		}
LABELV $477
LABELV $472
LABELV $466
LABELV $460
line 585
;585:		y = 50+cg_toolguninfo.integer;  CG_DrawBigString( 0 - cl_screenoffset.integer, y, toolgun_tooltip1.string, 1.0F);
ADDRLP4 4
ADDRGP4 cg_toolguninfo+12
INDIRI4
CNSTI4 50
ADDI4
CVIF4 4
ASGNF4
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 toolgun_tooltip1+16
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 586
;586:		y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, toolgun_tooltip2.string, 1.0F);
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 toolgun_tooltip2+16
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 587
;587:		y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, toolgun_tooltip3.string, 1.0F);
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 toolgun_tooltip3+16
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 588
;588:		y += 15; CG_DrawBigString( 0 - cl_screenoffset.integer, y, toolgun_tooltip4.string, 1.0F);
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 toolgun_tooltip4+16
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 590
;589:
;590:		origin[0] = 70;
ADDRLP4 8
CNSTF4 1116471296
ASGNF4
line 591
;591:		origin[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 592
;592:		origin[2] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 593
;593:		angles[YAW] = 90 + 20 * sin( cg.time / 1000.0 );
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 36
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 20+4
CNSTF4 1101004800
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 594
;594:		if(!BG_CheckClassname(sb_classnum_view.string)){
ADDRGP4 sb_classnum_view+16
ARGP4
ADDRLP4 40
ADDRGP4 BG_CheckClassname
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $496
line 595
;595:		CG_Draw3DModelCopy( 640 + cl_screenoffset.integer - TEXT_ICON_SPACE  - 160, 1 + 12, 160, 160,
ADDRGP4 toolgun_modelst+16
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 640
ADDI4
CNSTI4 2
SUBI4
CNSTI4 160
SUBI4
CVIF4 4
ARGF4
CNSTF4 1095761920
ARGF4
ADDRLP4 48
CNSTF4 1126170624
ASGNF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_Draw3DModelCopy
CALLV
pop
line 597
;596:					   trap_R_RegisterModel_MiTech( toolgun_modelst.string ), 0, origin, angles );
;597:		} else {
ADDRGP4 $497
JUMPV
LABELV $496
line 598
;598:		for ( it = bg_itemlist + 1 ; it->classname ; it++ ) {
ADDRLP4 0
ADDRGP4 bg_itemlist+56
ASGNP4
ADDRGP4 $504
JUMPV
LABELV $501
line 599
;599:		if ( !Q_stricmp( it->classname, sb_classnum_view.string ) )
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 sb_classnum_view+16
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $506
line 600
;600:				CG_Draw3DModelCopy( 640 + cl_screenoffset.integer - TEXT_ICON_SPACE  - 160, 1 + 12, 160, 160,
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 640
ADDI4
CNSTI4 2
SUBI4
CNSTI4 160
SUBI4
CVIF4 4
ARGF4
CNSTF4 1095761920
ARGF4
ADDRLP4 52
CNSTF4 1126170624
ASGNF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_Draw3DModelCopy
CALLV
pop
LABELV $506
line 602
;601:					   trap_R_RegisterModel_MiTech( it->world_model[0] ), 0, origin, angles );	
;602:		}
LABELV $502
line 598
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
LABELV $504
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $501
line 603
;603:	}	
LABELV $497
line 604
;604:}
LABELV $441
endproc CG_DrawToolgun 56 32
proc CG_DrawStatusElement 52 36
line 606
;605:
;606:static void CG_DrawStatusElement( float x, float y, int value, const char *text ) {
line 611
;607:	vec4_t         colornorm;
;608:	vec4_t         colorlow;
;609:	vec4_t         colorblk;
;610:	
;611:	colornorm[0]=cg_crosshairColorRed.value;
ADDRLP4 0
ADDRGP4 cg_crosshairColorRed+8
INDIRF4
ASGNF4
line 612
;612:	colornorm[1]=cg_crosshairColorGreen.value;
ADDRLP4 0+4
ADDRGP4 cg_crosshairColorGreen+8
INDIRF4
ASGNF4
line 613
;613:	colornorm[2]=cg_crosshairColorBlue.value;
ADDRLP4 0+8
ADDRGP4 cg_crosshairColorBlue+8
INDIRF4
ASGNF4
line 614
;614:	colornorm[3]=1.0f;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 616
;615:	
;616:	colorblk[0]=0.0f;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 617
;617:	colorblk[1]=0.0f;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 618
;618:	colorblk[2]=0.0f;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 619
;619:	colorblk[3]=0.20f;
ADDRLP4 16+12
CNSTF4 1045220557
ASGNF4
line 621
;620:	
;621:	CG_DrawRoundedRect(x, y, 110, 32, 6, colorblk);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
CNSTF4 1121714176
ARGF4
CNSTF4 1107296256
ARGF4
CNSTF4 1086324736
ARGF4
ADDRLP4 16
ARGP4
ADDRGP4 CG_DrawRoundedRect
CALLV
pop
line 622
;622:	CG_DrawStringExt( x+3, y+20, text, colornorm, qfalse, qfalse, 6, 7, 0 );
ADDRFP4 0
INDIRF4
CNSTF4 1077936128
ADDF4
CVFI4 4
ARGI4
ADDRFP4 4
INDIRF4
CNSTF4 1101004800
ADDF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 7
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 623
;623:	trap_R_SetColor( colornorm );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 624
;624:	CG_DrawField ( x+43, y+9, 4, value, 0.80);
ADDRFP4 0
INDIRF4
CNSTF4 1110179840
ADDF4
CVFI4 4
ARGI4
ADDRFP4 4
INDIRF4
CNSTF4 1091567616
ADDF4
CVFI4 4
ARGI4
CNSTI4 4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTF4 1061997773
ARGF4
ADDRGP4 CG_DrawField
CALLV
pop
line 625
;625:}
LABELV $510
endproc CG_DrawStatusElement 52 36
proc CG_DrawStatusBar 40 16
line 633
;626:
;627:/*
;628:================
;629:CG_DrawStatusBar
;630:
;631:================
;632:*/
;633:static void CG_DrawStatusBar( void ) {
line 641
;634:	centity_t	*cent;
;635:	playerState_t	*ps;
;636:	int			value;
;637:	clientInfo_t	*ci;
;638:	int				weaphack;
;639:	vec_t       *vel;
;640:
;641:	vel = cg.snap->ps.velocity;
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
line 643
;642:
;643:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 16
CNSTI4 928
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 644
;644:	ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 646
;645:	
;646:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 20
CNSTI4 1944
ADDRLP4 16
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 648
;647:	
;648:	if(ci->swepid >= 1){
ADDRLP4 20
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
LTI4 $525
line 649
;649:	weaphack = ci->swepid;
ADDRLP4 8
ADDRLP4 20
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 650
;650:	} else {
ADDRGP4 $526
JUMPV
LABELV $525
line 651
;651:	weaphack = cent->currentState.weapon;
ADDRLP4 8
ADDRLP4 16
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 652
;652:		}
LABELV $526
line 655
;653:
;654:	// draw any 3D icons first, so the changes back to 2D are minimized
;655:	if (weaphack) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $527
line 656
;656:		if(weaphack == WP_TOOLGUN){
ADDRLP4 8
INDIRI4
CNSTI4 16
NEI4 $529
line 657
;657:			CG_DrawToolgun();
ADDRGP4 CG_DrawToolgun
CALLV
pop
line 658
;658:		}
LABELV $529
line 659
;659:	}
LABELV $527
line 662
;660:
;661:
;662:	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
ADDRGP4 cg+1868928+312+28
INDIRI4
CNSTI4 0
EQI4 $531
line 663
;663:		CG_DrawStatusBarFlag( TEAM_RED, 1 );
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 664
;664:	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $532
JUMPV
LABELV $531
ADDRGP4 cg+1868928+312+32
INDIRI4
CNSTI4 0
EQI4 $536
line 665
;665:		CG_DrawStatusBarFlag( TEAM_BLUE, 1 );
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 666
;666:	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $537
JUMPV
LABELV $536
ADDRGP4 cg+1868928+312+36
INDIRI4
CNSTI4 0
EQI4 $541
line 667
;667:		CG_DrawStatusBarFlag( TEAM_FREE, 1 ); 
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 668
;668:	}
LABELV $541
LABELV $537
LABELV $532
line 673
;669:
;670:	//
;671:	// ammo
;672:	//
;673:	if(!ps->stats[STAT_VEHICLE]){
ADDRLP4 4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 0
NEI4 $546
line 674
;674:	if ( weaphack ) { //VEHICLE-SYSTEM: vehicle's speedmeter for all
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $547
line 675
;675:		if(ps->stats[STAT_SWEP] <= 15){
ADDRLP4 4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 15
GTI4 $550
line 676
;676:		value = ps->ammo[cent->currentState.weapon];
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ASGNI4
line 677
;677:		} else {
ADDRGP4 $551
JUMPV
LABELV $550
line 678
;678:		value = ps->stats[STAT_SWEPAMMO];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ASGNI4
line 679
;679:		if(value <= 0 && value != -1){
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $552
ADDRLP4 0
INDIRI4
CNSTI4 -1
EQI4 $552
line 680
;680:		cg.swep_listcl[ps->stats[STAT_SWEP]] = 2;
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 cg+1870444
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 681
;681:		} else {
ADDRGP4 $553
JUMPV
LABELV $552
line 682
;682:		cg.swep_listcl[ps->stats[STAT_SWEP]] = 1;	
ADDRLP4 4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1870444
ADDP4
CNSTI4 1
ASGNI4
line 683
;683:		}
LABELV $553
line 684
;684:		}
LABELV $551
line 685
;685:		if ( value > -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
LEI4 $547
line 686
;686:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $558
line 687
;687:		CG_DrawStatusElement(628+cl_screenoffset.integer-110, 440, value, "AMMO");
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 628
ADDI4
CNSTI4 110
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $562
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 688
;688:		}
LABELV $558
line 689
;689:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $547
line 690
;690:		CG_DrawStatusElement(628+cl_screenoffset.integer-110, 440, value, "ПАТРОНЫ");
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 628
ADDI4
CNSTI4 110
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $567
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 691
;691:		}
line 692
;692:		}
line 693
;693:	}
line 694
;694:	} else {
ADDRGP4 $547
JUMPV
LABELV $546
line 695
;695:		if ( weaphack ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $568
line 696
;696:			if(ps->stats[STAT_SWEP] <= 15){
ADDRLP4 4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 15
GTI4 $570
line 697
;697:			value = ps->ammo[cent->currentState.weapon];
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ASGNI4
line 698
;698:			} else {
ADDRGP4 $571
JUMPV
LABELV $570
line 699
;699:			value = ps->stats[STAT_SWEPAMMO];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ASGNI4
line 700
;700:			if(value <= 0 && value != -1){
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $572
ADDRLP4 0
INDIRI4
CNSTI4 -1
EQI4 $572
line 701
;701:			cg.swep_listcl[ps->stats[STAT_SWEP]] = 2;
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 cg+1870444
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 702
;702:			} else {
ADDRGP4 $573
JUMPV
LABELV $572
line 703
;703:			cg.swep_listcl[ps->stats[STAT_SWEP]] = 1;	
ADDRLP4 4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1870444
ADDP4
CNSTI4 1
ASGNI4
line 704
;704:			}
LABELV $573
line 705
;705:			}
LABELV $571
line 706
;706:			if ( value > -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
LEI4 $576
line 707
;707:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $578
line 708
;708:			CG_DrawStatusElement(628+cl_screenoffset.integer-230, 440, value, "AMMO");
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 628
ADDI4
CNSTI4 230
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $562
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 709
;709:			}
LABELV $578
line 710
;710:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $582
line 711
;711:			CG_DrawStatusElement(628+cl_screenoffset.integer-230, 440, value, "ПАТРОНЫ");
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 628
ADDI4
CNSTI4 230
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $567
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 712
;712:			}
LABELV $582
line 713
;713:			}
LABELV $576
line 714
;714:		}
LABELV $568
line 715
;715:		value = sqrt(vel[0] * vel[0] + vel[1] * vel[1]) * 0.20;
ADDRLP4 28
ADDRLP4 12
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 36
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1045220557
ADDRLP4 36
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 716
;716:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $586
line 717
;717:		CG_DrawStatusElement(628+cl_screenoffset.integer-110, 440, value, "KM/H");
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 628
ADDI4
CNSTI4 110
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $590
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 718
;718:		}
LABELV $586
line 719
;719:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $591
line 720
;720:		CG_DrawStatusElement(628+cl_screenoffset.integer-110, 440, value, "КМ/Ч");
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 628
ADDI4
CNSTI4 110
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $595
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 721
;721:		}
LABELV $591
line 722
;722:	}
LABELV $547
line 724
;723:	
;724:	CG_DrawStatusBarFlag( TEAM_FREE, 0 );		//android buttons fix
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 729
;725:
;726:	//
;727:	// health
;728:	//
;729:	if(!ps->stats[STAT_VEHICLE]){ //VEHICLE-SYSTEM: vehicle's hp instead player
ADDRLP4 4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 0
NEI4 $596
line 730
;730:	value = ps->stats[STAT_HEALTH];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 731
;731:	} else {
ADDRGP4 $597
JUMPV
LABELV $596
line 732
;732:	value = ps->stats[STAT_VEHICLEHP];	
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 733
;733:	}
LABELV $597
line 734
;734:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $598
line 735
;735:	CG_DrawStatusElement(12-cl_screenoffset.integer, 440, value, "HEALTH");
CNSTI4 12
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $602
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 736
;736:	}
LABELV $598
line 737
;737:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $603
line 738
;738:	CG_DrawStatusElement(12-cl_screenoffset.integer, 440, value, "ЖИЗНИ");
CNSTI4 12
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $607
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 739
;739:	}
LABELV $603
line 744
;740:		
;741:	//
;742:	// armor
;743:	//
;744:	value = ps->stats[STAT_ARMOR];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 745
;745:	if (value > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $608
line 746
;746:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $610
line 747
;747:		CG_DrawStatusElement(22-cl_screenoffset.integer+110, 440, value, "ARMOR");
CNSTI4 22
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CNSTI4 110
ADDI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $614
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 748
;748:		}
LABELV $610
line 749
;749:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $615
line 750
;750:		CG_DrawStatusElement(22-cl_screenoffset.integer+110, 440, value, "БРОНЯ");
CNSTI4 22
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CNSTI4 110
ADDI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $619
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 751
;751:		}
LABELV $615
line 752
;752:	}
LABELV $608
line 755
;753:
;754:        //Skulls!
;755:	if(cgs.gametype == GT_HARVESTER) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
NEI4 $620
line 756
;756:            value = ps->generic1;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 757
;757:            if (value > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $623
line 758
;758:				if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $625
line 759
;759:				CG_DrawStatusElement(32-cl_screenoffset.integer+220, 440, value, "SKULLS");
CNSTI4 32
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CNSTI4 220
ADDI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $629
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 760
;760:				}
LABELV $625
line 761
;761:				if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $630
line 762
;762:				CG_DrawStatusElement(32-cl_screenoffset.integer+220, 440, value, "ЧЕРЕПА");
CNSTI4 32
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CNSTI4 220
ADDI4
CVIF4 4
ARGF4
CNSTF4 1138491392
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $634
ARGP4
ADDRGP4 CG_DrawStatusElement
CALLV
pop
line 763
;763:				}
LABELV $630
line 764
;764:            }
LABELV $623
line 765
;765:        }
LABELV $620
line 766
;766:}
LABELV $520
endproc CG_DrawStatusBar 40 16
proc CG_DrawSpeedMeter 40 16
line 782
;767:
;768:/*
;769:===========================================================================================
;770:
;771:  UPPER RIGHT CORNER
;772:
;773:===========================================================================================
;774:*/
;775:
;776:/*
;777:================
;778:CG_DrawSpeedMeter
;779:
;780:================
;781:*/
;782:static float CG_DrawSpeedMeter( float y ) {
line 789
;783:	char        *s;
;784:	int         w;
;785:	vec_t       *vel;
;786:	int         speed;
;787:
;788:	/* speed meter can get in the way of the scoreboard */
;789:	if ( cg.scoreBoardShowing ) {
ADDRGP4 cg+1888440
INDIRI4
CNSTI4 0
EQI4 $636
line 790
;790:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $635
JUMPV
LABELV $636
line 793
;791:	}
;792:
;793:	vel = cg.snap->ps.velocity;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
line 795
;794:	/* ignore vertical component of velocity */
;795:	speed = sqrt(vel[0] * vel[0] + vel[1] * vel[1]);
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDRLP4 24
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 28
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 797
;796:
;797:	s = va( "%iu/s", speed );
ADDRGP4 $640
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 799
;798:
;799:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 36
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 801
;800:
;801:	if (cg_drawSpeed.integer == 1) {
ADDRGP4 cg_drawSpeed+12
INDIRI4
CNSTI4 1
NEI4 $642
line 803
;802:		/* top left-hand corner of screen */
;803:		CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 804
;804:		return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
ADDRGP4 $635
JUMPV
LABELV $642
line 805
;805:	} else {
line 807
;806:		/* center of screen */
;807:		CG_DrawBigString( 320 - w / 2, 300, s, 1.0F);
CNSTI4 320
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 808
;808:		return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $635
endproc CG_DrawSpeedMeter 40 16
proc CG_DrawSnapshot 16 16
line 817
;809:	}
;810:}
;811:
;812:/*
;813:==================
;814:CG_DrawSnapshot
;815:==================
;816:*/
;817:static float CG_DrawSnapshot( float y ) {
line 821
;818:	char		*s;
;819:	int			w;
;820:
;821:	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime,
ADDRGP4 $648
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+339028
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 823
;822:		cg.latestSnapshotNum, cgs.serverCommandSequence );
;823:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 825
;824:
;825:	CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 827
;826:
;827:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $647
endproc CG_DrawSnapshot 16 16
bss
align 4
LABELV $656
skip 16
align 4
LABELV $657
skip 4
align 4
LABELV $658
skip 4
code
proc CG_DrawFPS 44 16
line 836
;828:}
;829:
;830:/*
;831:==================
;832:CG_DrawFPS
;833:==================
;834:*/
;835:#define	FPS_FRAMES	4
;836:static float CG_DrawFPS( float y ) {
line 848
;837:	char		*s;
;838:	int			w;
;839:	static int	previousTimes[FPS_FRAMES];
;840:	static int	index;
;841:	int		i, total;
;842:	int		fps;
;843:	static	int	previous;
;844:	int		t, frameTime;
;845:
;846:	// don't use serverTime, because that will be drifting to
;847:	// correct for internet lag changes, timescales, timedemos, etc
;848:	t = trap_Milliseconds();
ADDRLP4 28
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 849
;849:	frameTime = t - previous;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 $658
INDIRI4
SUBI4
ASGNI4
line 850
;850:	previous = t;
ADDRGP4 $658
ADDRLP4 8
INDIRI4
ASGNI4
line 852
;851:
;852:	previousTimes[index % FPS_FRAMES] = frameTime;
ADDRGP4 $657
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $656
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 853
;853:	index++;
ADDRLP4 32
ADDRGP4 $657
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 854
;854:	if ( index > FPS_FRAMES ) {
ADDRGP4 $657
INDIRI4
CNSTI4 4
LEI4 $659
line 856
;855:		// average multiple frames together to smooth changes out a bit
;856:		total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 857
;857:		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $661
line 858
;858:			total += previousTimes[i];
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $656
ADDP4
INDIRI4
ADDI4
ASGNI4
line 859
;859:		}
LABELV $662
line 857
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $661
line 860
;860:		if ( !total ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $665
line 861
;861:			total = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 862
;862:		}
LABELV $665
line 863
;863:		fps = 1000 * FPS_FRAMES / total;
ADDRLP4 24
CNSTI4 4000
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 865
;864:
;865:		s = va( "%ifps", fps );
ADDRGP4 $667
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 866
;866:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 868
;867:
;868:		CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 20
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 869
;869:	}
LABELV $659
line 871
;870:
;871:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $655
endproc CG_DrawFPS 44 16
proc CG_DrawTimer 32 16
line 879
;872:}
;873:
;874:/*
;875:=================
;876:CG_DrawTimer
;877:=================
;878:*/
;879:static float CG_DrawTimer( float y ) {
line 885
;880:	char		*s;
;881:	int			w;
;882:	int			mins, seconds, tens;
;883:	int			msec;
;884:
;885:	msec = cg.time - cgs.levelStartTime;
ADDRLP4 20
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cgs+342388
INDIRI4
SUBI4
ASGNI4
line 887
;886:
;887:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 20
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 888
;888:	mins = seconds / 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 889
;889:	seconds -= mins * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDRLP4 8
INDIRI4
MULI4
SUBI4
ASGNI4
line 890
;890:	tens = seconds / 10;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 891
;891:	seconds -= tens * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRLP4 12
INDIRI4
MULI4
SUBI4
ASGNI4
line 893
;892:
;893:	s = va( "%i:%i%i", mins, tens, seconds );
ADDRGP4 $674
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 894
;894:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 28
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 896
;895:
;896:	CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 898
;897:
;898:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $671
endproc CG_DrawTimer 32 16
proc CG_DrawZombieRound 28 16
line 901
;899:}
;900:
;901:static float CG_DrawZombieRound( float y ) {
line 907
;902:	char		*s;
;903:	int			w;
;904:	int			mins, seconds, tens;
;905:	int			msec;
;906:
;907:	msec = cg.time - cgs.levelStartTime;
ADDRLP4 20
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cgs+342388
INDIRI4
SUBI4
ASGNI4
line 909
;908:
;909:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 20
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 910
;910:	mins = seconds / 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 911
;911:	seconds -= mins * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDRLP4 8
INDIRI4
MULI4
SUBI4
ASGNI4
line 912
;912:	tens = seconds / 10;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 913
;913:	seconds -= tens * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRLP4 16
INDIRI4
MULI4
SUBI4
ASGNI4
line 915
;914:
;915:if(mins == mod_zround + 1){
ADDRLP4 8
INDIRI4
ADDRGP4 mod_zround
INDIRI4
CNSTI4 1
ADDI4
NEI4 $681
line 916
;916:	mod_zround += 1;
ADDRLP4 24
ADDRGP4 mod_zround
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 917
;917:	trap_SendConsoleCommand("zombieroundend \n");
ADDRGP4 $683
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 918
;918:}
LABELV $681
line 919
;919:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $684
line 920
;920:	s = va( "Round:%i", mod_zround );
ADDRGP4 $687
ARGP4
ADDRGP4 mod_zround
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 921
;921:}
LABELV $684
line 922
;922:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $688
line 923
;923:	s = va( "Раунд:%i", mod_zround );
ADDRGP4 $691
ARGP4
ADDRGP4 mod_zround
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 924
;924:}
LABELV $688
line 925
;925:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 927
;926:
;927:	CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 12
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 929
;928:
;929:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $678
endproc CG_DrawZombieRound 28 16
proc CG_DrawCustomRound 28 16
line 932
;930:}
;931:
;932:static float CG_DrawCustomRound( float y ) {
line 938
;933:	char		*s;
;934:	int			w;
;935:	int			mins, seconds, tens;
;936:	int			msec;
;937:
;938:	msec = cg.time - cgs.levelStartTime;
ADDRLP4 20
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cgs+342388
INDIRI4
SUBI4
ASGNI4
line 940
;939:
;940:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 20
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 941
;941:	mins = seconds / 60;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 942
;942:	seconds -= mins * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDRLP4 12
INDIRI4
MULI4
SUBI4
ASGNI4
line 943
;943:	tens = seconds / 10;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 944
;944:	seconds -= tens * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRLP4 16
INDIRI4
MULI4
SUBI4
ASGNI4
line 946
;945:	
;946:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $698
line 947
;947:	s = va( "Round:%i", mod_zround );
ADDRGP4 $687
ARGP4
ADDRGP4 mod_zround
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 948
;948:}
LABELV $698
line 949
;949:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $701
line 950
;950:	s = va( "Раунд:%i", mod_zround );
ADDRGP4 $691
ARGP4
ADDRGP4 mod_zround
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 951
;951:}
LABELV $701
line 952
;952:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 954
;953:
;954:	CG_DrawBigString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 956
;955:
;956:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $695
endproc CG_DrawCustomRound 28 16
proc CG_DrawLMSmode 16 16
line 965
;957:}
;958:
;959:/*
;960:=================
;961:CG_DrawLMSmode
;962:=================
;963:*/
;964:
;965:static float CG_DrawLMSmode( float y ) {
line 969
;966:	char		*s;
;967:	int		w;
;968:
;969:	if(cgs.lms_mode == 0) {
ADDRGP4 cgs+342408
INDIRI4
CNSTI4 0
NEI4 $708
line 970
;970:		s = va("LMS: Point/round + OT");
ADDRGP4 $711
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 971
;971:	} else
ADDRGP4 $709
JUMPV
LABELV $708
line 972
;972:	if(cgs.lms_mode == 1) {
ADDRGP4 cgs+342408
INDIRI4
CNSTI4 1
NEI4 $712
line 973
;973:		s = va("LMS: Point/round - OT");
ADDRGP4 $715
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 974
;974:	} else
ADDRGP4 $713
JUMPV
LABELV $712
line 975
;975:	if(cgs.lms_mode == 2) {
ADDRGP4 cgs+342408
INDIRI4
CNSTI4 2
NEI4 $716
line 976
;976:		s = va("LMS: Point/kill + OT");
ADDRGP4 $719
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 977
;977:	} else
ADDRGP4 $717
JUMPV
LABELV $716
line 978
;978:	if(cgs.lms_mode == 3) {
ADDRGP4 cgs+342408
INDIRI4
CNSTI4 3
NEI4 $720
line 979
;979:		s = va("LMS: Point/kill - OT");
ADDRGP4 $723
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 980
;980:	} else
ADDRGP4 $721
JUMPV
LABELV $720
line 981
;981:		s = va("LMS: Unknown mode");
ADDRGP4 $724
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $721
LABELV $717
LABELV $713
LABELV $709
line 983
;982:
;983:	w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 984
;984:	CG_DrawSmallString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 986
;985:
;986:	return y + SMALLCHAR_HEIGHT+4;
ADDRFP4 0
INDIRF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $707
endproc CG_DrawLMSmode 16 16
proc CG_DrawCTFoneway 32 16
line 995
;987:}
;988:
;989:/*
;990:=================
;991:CG_DrawCTFoneway
;992:=================
;993:*/
;994:
;995:static float CG_DrawCTFoneway( float y ) {
line 1000
;996:	char		*s;
;997:	int		w;
;998:	vec4_t		color;
;999:
;1000:	if(cgs.gametype != GT_CTF_ELIMINATION)
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $729
line 1001
;1001:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $728
JUMPV
LABELV $729
line 1003
;1002:
;1003:	memcpy(color,g_color_table[ColorIndex(COLOR_WHITE)],sizeof(color));
ADDRLP4 0
ARGP4
ADDRGP4 g_color_table+112
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1005
;1004:
;1005:	if( (cgs.elimflags&EF_ONEWAY)==0) {
ADDRGP4 cgs+339052
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $733
line 1006
;1006:		return y; //nothing to draw
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $728
JUMPV
LABELV $733
line 1008
;1007:	} else
;1008:	if(cgs.attackingTeam == TEAM_BLUE) {
ADDRGP4 cgs+342404
INDIRI4
CNSTI4 2
NEI4 $736
line 1009
;1009:		memcpy(color,g_color_table[ColorIndex(COLOR_BLUE)],sizeof(color));
ADDRLP4 0
ARGP4
ADDRGP4 g_color_table+64
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1010
;1010:		s = va("Blue team on offence");
ADDRGP4 $740
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
line 1011
;1011:	} else
ADDRGP4 $737
JUMPV
LABELV $736
line 1012
;1012:	if(cgs.attackingTeam == TEAM_RED) {
ADDRGP4 cgs+342404
INDIRI4
CNSTI4 1
NEI4 $741
line 1013
;1013:		memcpy(color,g_color_table[ColorIndex(COLOR_RED)],sizeof(color));
ADDRLP4 0
ARGP4
ADDRGP4 g_color_table+16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1014
;1014:		s = va("Red team on offence");
ADDRGP4 $745
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
line 1015
;1015:	} else
ADDRGP4 $742
JUMPV
LABELV $741
line 1016
;1016:		s = va("Unknown team on offence");
ADDRGP4 $746
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
LABELV $742
LABELV $737
line 1018
;1017:
;1018:	w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 1019
;1019:	CG_DrawSmallStringColor( 635 + cl_screenoffset.integer - w, y + 2, s, color);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 20
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawSmallStringColor
CALLV
pop
line 1021
;1020:
;1021:	return y + SMALLCHAR_HEIGHT+4;
ADDRFP4 0
INDIRF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $728
endproc CG_DrawCTFoneway 32 16
proc CG_DrawDomStatus 44 16
line 1030
;1022:}
;1023:
;1024:/*
;1025:=================
;1026:CG_DrawDomStatus
;1027:=================
;1028:*/
;1029:
;1030:static float CG_DrawDomStatus( float y ) {
line 1035
;1031:	int 		i,w;
;1032:	char		*s;
;1033:	vec4_t		color;
;1034:
;1035:	for(i = 0;i < cgs.domination_points_count;i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $754
JUMPV
LABELV $751
line 1036
;1036:		switch(cgs.domination_points_status[i]) {
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+342584
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $760
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $762
ADDRGP4 $756
JUMPV
LABELV $760
line 1038
;1037:			case TEAM_RED:
;1038:				memcpy(color,g_color_table[ColorIndex(COLOR_RED)],sizeof(color));
ADDRLP4 12
ARGP4
ADDRGP4 g_color_table+16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1039
;1039:				break;
ADDRGP4 $757
JUMPV
LABELV $762
line 1041
;1040:			case TEAM_BLUE:
;1041:				memcpy(color,g_color_table[ColorIndex(COLOR_BLUE)],sizeof(color));
ADDRLP4 12
ARGP4
ADDRGP4 g_color_table+64
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1042
;1042:				break;
ADDRGP4 $757
JUMPV
LABELV $756
line 1044
;1043:			default:
;1044:				memcpy(color,g_color_table[ColorIndex(COLOR_WHITE)],sizeof(color));
ADDRLP4 12
ARGP4
ADDRGP4 g_color_table+112
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1045
;1045:				break;
LABELV $757
line 1048
;1046:		}
;1047:
;1048:		s = va("%s",cgs.domination_points_names[i]);
ADDRGP4 $765
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+342424
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
ASGNP4
line 1049
;1049:		w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 40
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 1050
;1050:		CG_DrawSmallStringColor( 635 + cl_screenoffset.integer - w, y + 2, s, color);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CG_DrawSmallStringColor
CALLV
pop
line 1051
;1051:		y += SMALLCHAR_HEIGHT+4;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 4
ADDI4
CVIF4 4
ADDF4
ASGNF4
line 1053
;1052:
;1053:	}
LABELV $752
line 1035
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $754
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+342420
INDIRI4
LTI4 $751
line 1055
;1054:
;1055:	return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $750
endproc CG_DrawDomStatus 44 16
proc CG_DrawEliminationTimer 80 36
line 1064
;1056:}
;1057:
;1058:
;1059:/*
;1060:=================
;1061:CG_DrawEliminationTimer
;1062:=================
;1063:*/
;1064:static float CG_DrawEliminationTimer( float y ) {
line 1075
;1065:	char		*s;
;1066:	int			w;
;1067:	int			mins, seconds, tens, sec;
;1068:	int			msec;
;1069:	vec4_t			color;
;1070:	const char	*st;
;1071:	float scale;
;1072:	int cw;
;1073:	int rst;
;1074:
;1075:	rst = cgs.roundStartTime;
ADDRLP4 24
ADDRGP4 cgs+342396
INDIRI4
ASGNI4
line 1077
;1076:
;1077:        if(cg.time>rst && !cgs.roundtime) {
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $772
ADDRGP4 cgs+342400
INDIRI4
CNSTI4 0
NEI4 $772
line 1078
;1078:            return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $770
JUMPV
LABELV $772
line 1082
;1079:        }
;1080:
;1081:	//default color is white
;1082:	memcpy(color,g_color_table[ColorIndex(COLOR_WHITE)],sizeof(color));
ADDRLP4 8
ARGP4
ADDRGP4 g_color_table+112
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1085
;1083:
;1084:	//msec = cg.time - cgs.levelStartTime;
;1085:	if(cg.time>rst) //We are started
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $777
line 1086
;1086:	{
line 1087
;1087:		msec = cgs.roundtime*1000 - (cg.time -rst);
ADDRLP4 4
CNSTI4 1000
ADDRGP4 cgs+342400
INDIRI4
MULI4
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
SUBI4
ASGNI4
line 1088
;1088:		if(msec<=30*1000-1) //<= 30 seconds
ADDRLP4 4
INDIRI4
CNSTI4 29999
GTI4 $782
line 1089
;1089:			memcpy(color,g_color_table[ColorIndex(COLOR_YELLOW)],sizeof(color));
ADDRLP4 8
ARGP4
ADDRGP4 g_color_table+48
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $782
line 1090
;1090:		if(msec<=10*1000-1) //<= 10 seconds
ADDRLP4 4
INDIRI4
CNSTI4 9999
GTI4 $785
line 1091
;1091:			memcpy(color,g_color_table[ColorIndex(COLOR_RED)],sizeof(color));
ADDRLP4 8
ARGP4
ADDRGP4 g_color_table+16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $785
line 1092
;1092:		msec += 1000; //120-1 instead of 119-0
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1093
;1093:	}
ADDRGP4 $778
JUMPV
LABELV $777
line 1095
;1094:	else
;1095:	{
line 1097
;1096:		//Warmup
;1097:		msec = -cg.time +rst;
ADDRLP4 4
ADDRGP4 cg+1868892
INDIRI4
NEGI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 1098
;1098:		memcpy(color,g_color_table[ColorIndex(COLOR_GREEN)],sizeof(color));
ADDRLP4 8
ARGP4
ADDRGP4 g_color_table+32
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1099
;1099:		sec = msec/1000;
ADDRLP4 44
ADDRLP4 4
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 1100
;1100:		msec += 1000; //5-1 instead of 4-0
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1104
;1101:/***
;1102:Lots of stuff
;1103:****/
;1104:	if(cg.warmup == 0)
ADDRGP4 cg+1952944
INDIRI4
CNSTI4 0
NEI4 $790
line 1105
;1105:	{
line 1106
;1106:		st = va( "Round in: %i", sec + 1 );
ADDRGP4 $793
ARGP4
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 60
INDIRP4
ASGNP4
line 1107
;1107:		if ( sec != cg.warmupCount ) {
ADDRLP4 44
INDIRI4
ADDRGP4 cg+1952948
INDIRI4
EQI4 $794
line 1108
;1108:			cg.warmupCount = sec;
ADDRGP4 cg+1952948
ADDRLP4 44
INDIRI4
ASGNI4
line 1109
;1109:			switch ( sec ) {
ADDRLP4 64
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $800
ADDRLP4 64
INDIRI4
CNSTI4 1
EQI4 $803
ADDRLP4 64
INDIRI4
CNSTI4 2
EQI4 $806
ADDRGP4 $799
JUMPV
LABELV $800
line 1111
;1110:			case 0:
;1111:				trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+956380+2424
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1112
;1112:				break;
ADDRGP4 $799
JUMPV
LABELV $803
line 1114
;1113:			case 1:
;1114:				trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+956380+2420
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1115
;1115:				break;
ADDRGP4 $799
JUMPV
LABELV $806
line 1117
;1116:			case 2:
;1117:				trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+956380+2416
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1118
;1118:				break;
line 1120
;1119:			default:
;1120:				break;
LABELV $799
line 1122
;1121:			}
;1122:		}
LABELV $794
line 1123
;1123:		scale = 0.45f;
ADDRLP4 56
CNSTF4 1055286886
ASGNF4
line 1124
;1124:		switch ( cg.warmupCount ) {
ADDRLP4 64
ADDRGP4 cg+1952948
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $812
ADDRLP4 64
INDIRI4
CNSTI4 1
EQI4 $813
ADDRLP4 64
INDIRI4
CNSTI4 2
EQI4 $814
ADDRGP4 $809
JUMPV
LABELV $812
line 1126
;1125:		case 0:
;1126:			cw = 28;
ADDRLP4 48
CNSTI4 28
ASGNI4
line 1127
;1127:			scale = 0.54f;
ADDRLP4 56
CNSTF4 1057635697
ASGNF4
line 1128
;1128:			break;
ADDRGP4 $810
JUMPV
LABELV $813
line 1130
;1129:		case 1:
;1130:			cw = 24;
ADDRLP4 48
CNSTI4 24
ASGNI4
line 1131
;1131:			scale = 0.51f;
ADDRLP4 56
CNSTF4 1057132380
ASGNF4
line 1132
;1132:			break;
ADDRGP4 $810
JUMPV
LABELV $814
line 1134
;1133:		case 2:
;1134:			cw = 20;
ADDRLP4 48
CNSTI4 20
ASGNI4
line 1135
;1135:			scale = 0.48f;
ADDRLP4 56
CNSTF4 1056293519
ASGNF4
line 1136
;1136:			break;
ADDRGP4 $810
JUMPV
LABELV $809
line 1138
;1137:		default:
;1138:			cw = 16;
ADDRLP4 48
CNSTI4 16
ASGNI4
line 1139
;1139:			scale = 0.45f;
ADDRLP4 56
CNSTF4 1055286886
ASGNF4
line 1140
;1140:			break;
LABELV $810
line 1148
;1141:		}
;1142:
;1143:	#ifndef MISSIONPACK
;1144:			//w = CG_Text_Width(s, scale, 0);
;1145:			//CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, st, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;1146:	#else
;1147:
;1148:                    w = CG_DrawStrlen( st );
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 68
INDIRI4
ASGNI4
line 1149
;1149:                    CG_DrawStringExt( 320 - w * cw/2, 70, st, colorWhite,
ADDRLP4 72
ADDRLP4 48
INDIRI4
ASGNI4
CNSTI4 320
ADDRLP4 32
INDIRI4
ADDRLP4 72
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 70
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
CNSTF4 1069547520
ADDRLP4 72
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 1152
;1150:				qfalse, qtrue, cw, (int)(cw * 1.5), 0 );
;1151:	#endif
;1152:	}
LABELV $790
line 1156
;1153:/*
;1154:Lots of stuff
;1155:*/
;1156:	}
LABELV $778
line 1158
;1157:
;1158:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 1159
;1159:	mins = seconds / 60;
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1160
;1160:	seconds -= mins * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDRLP4 36
INDIRI4
MULI4
SUBI4
ASGNI4
line 1161
;1161:	tens = seconds / 10;
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 1162
;1162:	seconds -= tens * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRLP4 40
INDIRI4
MULI4
SUBI4
ASGNI4
line 1164
;1163:
;1164:	if(msec>=0)
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $815
line 1165
;1165:		s = va( " %i:%i%i", mins, tens, seconds );
ADDRGP4 $817
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 60
INDIRP4
ASGNP4
ADDRGP4 $816
JUMPV
LABELV $815
line 1167
;1166:	else
;1167:		s = va( " Overtime");
ADDRGP4 $818
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 64
INDIRP4
ASGNP4
LABELV $816
line 1168
;1168:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 68
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 1170
;1169:
;1170:	CG_DrawBigStringColor( 635 + cl_screenoffset.integer - w, y + 2, s, color);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 32
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_DrawBigStringColor
CALLV
pop
line 1172
;1171:
;1172:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $770
endproc CG_DrawEliminationTimer 80 36
proc CG_DrawTeamOverlay 144 36
line 1182
;1173:}
;1174:
;1175:
;1176:/*
;1177:=================
;1178:CG_DrawTeamOverlay
;1179:=================
;1180:*/
;1181:
;1182:static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
line 1194
;1183:	int x, w, h, xx;
;1184:	int i, j, len;
;1185:	const char *p;
;1186:	vec4_t		hcolor;
;1187:	int pwidth, lwidth;
;1188:	int plyrs;
;1189:	char st[16];
;1190:	clientInfo_t *ci;
;1191:	gitem_t	*item;
;1192:	int ret_y, count;
;1193:
;1194:	if ( !cg_drawTeamOverlay.integer ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
NEI4 $823
line 1195
;1195:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $822
JUMPV
LABELV $823
line 1198
;1196:	}
;1197:
;1198:	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
ADDRLP4 92
CNSTI4 304
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $826
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $826
line 1200
;1199:	//	return y; // Not on any team
;1200:	}
LABELV $826
line 1202
;1201:
;1202:	plyrs = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 1205
;1203:
;1204:	// max player name width
;1205:	pwidth = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 1206
;1206:	count = (numSortedTeamPlayers > 18) ? 18 : numSortedTeamPlayers;
ADDRGP4 numSortedTeamPlayers
INDIRI4
CNSTI4 18
LEI4 $831
ADDRLP4 96
CNSTI4 18
ASGNI4
ADDRGP4 $832
JUMPV
LABELV $831
ADDRLP4 96
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
LABELV $832
ADDRLP4 48
ADDRLP4 96
INDIRI4
ASGNI4
line 1207
;1207:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $836
JUMPV
LABELV $833
line 1208
;1208:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 1944
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1209
;1209:		if ( ci->infoValid) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $838
line 1210
;1210:			plyrs++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1211
;1211:			len = CG_DrawStrlen(ci->name);
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 100
INDIRI4
ASGNI4
line 1212
;1212:			if (len > pwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $840
line 1213
;1213:				pwidth = len;
ADDRLP4 56
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $840
line 1214
;1214:		}
LABELV $838
line 1215
;1215:	}
LABELV $834
line 1207
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $836
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $833
line 1217
;1216:
;1217:	if (!plyrs)
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $842
line 1218
;1218:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $822
JUMPV
LABELV $842
line 1220
;1219:
;1220:	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
ADDRLP4 56
INDIRI4
CNSTI4 12
LEI4 $844
line 1221
;1221:		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;
ADDRLP4 56
CNSTI4 12
ASGNI4
LABELV $844
line 1224
;1222:
;1223:	// max location name width
;1224:	lwidth = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 1225
;1225:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $846
line 1226
;1226:		p = CG_ConfigString(CS_LOCATIONS + i);
ADDRLP4 8
INDIRI4
CNSTI4 8480
ADDI4
ARGI4
ADDRLP4 100
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 100
INDIRP4
ASGNP4
line 1227
;1227:		if (p && *p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $850
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $850
line 1228
;1228:			len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 108
INDIRI4
ASGNI4
line 1229
;1229:			if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $852
line 1230
;1230:				lwidth = len;
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $852
line 1231
;1231:		}
LABELV $850
line 1232
;1232:	}
LABELV $847
line 1225
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $846
line 1234
;1233:
;1234:	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
ADDRLP4 44
INDIRI4
CNSTI4 16
LEI4 $854
line 1235
;1235:		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;
ADDRLP4 44
CNSTI4 16
ASGNI4
LABELV $854
line 1237
;1236:
;1237:	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;
ADDRLP4 80
ADDRLP4 56
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
CNSTI4 4
ADDI4
CNSTI4 7
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
MULI4
ASGNI4
line 1239
;1238:
;1239:	if ( right )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $857
line 1240
;1240:		x = 640 - w + cl_screenoffset.integer;
ADDRLP4 52
CNSTI4 640
ADDRLP4 80
INDIRI4
SUBI4
ADDRGP4 cl_screenoffset+12
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $858
JUMPV
LABELV $857
line 1242
;1241:	else
;1242:		x = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
LABELV $858
line 1244
;1243:
;1244:	h = plyrs * TINYCHAR_HEIGHT;
ADDRLP4 84
ADDRLP4 76
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
DIVI4
MULI4
ASGNI4
line 1246
;1245:
;1246:	if ( upper ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $861
line 1247
;1247:		ret_y = y + h;
ADDRLP4 88
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 1248
;1248:	} else {
ADDRGP4 $862
JUMPV
LABELV $861
line 1249
;1249:		y -= h;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1250
;1250:		ret_y = y;
ADDRLP4 88
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 1251
;1251:	}
LABELV $862
line 1253
;1252:
;1253:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $863
line 1254
;1254:		hcolor[0] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 1255
;1255:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 1256
;1256:		hcolor[2] = 0.0f;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 1257
;1257:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 1258
;1258:	} else {
ADDRGP4 $864
JUMPV
LABELV $863
line 1259
;1259:		hcolor[0] = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 1260
;1260:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 1261
;1261:		hcolor[2] = 1.0f;
ADDRLP4 24+8
CNSTF4 1065353216
ASGNF4
line 1262
;1262:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 1263
;1263:	}
LABELV $864
line 1264
;1264:	trap_R_SetColor( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1265
;1265:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
ADDRLP4 52
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 84
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+956380+200
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1266
;1266:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1268
;1267:
;1268:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $877
JUMPV
LABELV $874
line 1269
;1269:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 1944
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1270
;1270:		if ( ci->infoValid) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $879
line 1272
;1271:
;1272:			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;
ADDRLP4 100
CNSTF4 1065353216
ASGNF4
ADDRLP4 24+12
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 100
INDIRF4
ASGNF4
line 1274
;1273:
;1274:			xx = x + TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1276
;1275:
;1276:			CG_DrawStringExt( xx, y,
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 108
CNSTI4 2
ASGNI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 108
INDIRI4
DIVI4
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 108
INDIRI4
DIVI4
ARGI4
CNSTI4 12
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 1280
;1277:				ci->name, hcolor, qfalse, qfalse,
;1278:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH);
;1279:
;1280:			if (lwidth) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $887
line 1281
;1281:				p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 8480
ADDI4
ARGI4
ADDRLP4 112
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 112
INDIRP4
ASGNP4
line 1282
;1282:				if (!p || !*p)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $891
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $889
LABELV $891
line 1283
;1283:					p = "unknown";
ADDRLP4 20
ADDRGP4 $892
ASGNP4
LABELV $889
line 1284
;1284:				len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 120
INDIRI4
ASGNI4
line 1285
;1285:				if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $893
line 1286
;1286:					len = lwidth;
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $893
line 1288
;1287:
;1288:				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
ADDRLP4 124
CNSTI4 2
ASGNI4
ADDRLP4 12
ADDRLP4 52
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 124
INDIRI4
DIVI4
CNSTI4 1
LSHI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 124
INDIRI4
DIVI4
ADDRLP4 56
INDIRI4
MULI4
ADDI4
ASGNI4
line 1289
;1289:				CG_DrawStringExt( xx, y,
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRLP4 132
CNSTI4 2
ASGNI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 132
INDIRI4
DIVI4
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 132
INDIRI4
DIVI4
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 1292
;1290:					p, hcolor, qfalse, qfalse, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
;1291:					TEAM_OVERLAY_MAXLOCATION_WIDTH);
;1292:			}
LABELV $887
line 1294
;1293:
;1294:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
ADDRLP4 4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 1296
;1295:
;1296:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
ADDRLP4 60
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $899
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1298
;1297:
;1298:			xx = x + TINYCHAR_WIDTH * 3 +
ADDRLP4 120
CNSTI4 2
ASGNI4
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 3
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 120
INDIRI4
DIVI4
MULI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 120
INDIRI4
DIVI4
ADDRLP4 56
INDIRI4
MULI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 120
INDIRI4
DIVI4
ADDRLP4 44
INDIRI4
MULI4
ADDI4
ASGNI4
line 1301
;1299:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;1300:
;1301:			CG_DrawStringExt( xx, y,
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRLP4 124
INDIRI4
ARGI4
ADDRLP4 124
INDIRI4
ARGI4
ADDRLP4 128
CNSTI4 2
ASGNI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 128
INDIRI4
DIVI4
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 128
INDIRI4
DIVI4
ARGI4
ADDRLP4 124
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 1306
;1302:				st, hcolor, qfalse, qfalse,
;1303:				TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0 );
;1304:
;1305:			// draw weapon icon
;1306:			xx += TINYCHAR_WIDTH * 3;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
MULI4
ADDI4
ASGNI4
line 1308
;1307:
;1308:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
CNSTI4 136
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $906
line 1309
;1309:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 132
CNSTI4 2
ASGNI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 132
INDIRI4
DIVI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 132
INDIRI4
DIVI4
CVIF4 4
ARGF4
CNSTI4 136
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1311
;1310:					cg_weapons[ci->curWeapon].weaponIcon );
;1311:			} else {
ADDRGP4 $907
JUMPV
LABELV $906
line 1312
;1312:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 132
CNSTI4 2
ASGNI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 132
INDIRI4
DIVI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 132
INDIRI4
DIVI4
CVIF4 4
ARGF4
ADDRGP4 cgs+956380+204
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1314
;1313:					cgs.media.deferShader );
;1314:			}
LABELV $907
line 1317
;1315:
;1316:			// Draw powerup icons
;1317:			if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $916
line 1318
;1318:				xx = x;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 1319
;1319:			} else {
ADDRGP4 $917
JUMPV
LABELV $916
line 1320
;1320:				xx = x + w - TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1321
;1321:			}
LABELV $917
line 1322
;1322:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $919
line 1323
;1323:				if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $923
line 1325
;1324:
;1325:					item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 132
INDIRP4
ASGNP4
line 1327
;1326:
;1327:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $925
line 1328
;1328:						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT,
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 140
CNSTI4 2
ASGNI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 140
INDIRI4
DIVI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 140
INDIRI4
DIVI4
CVIF4 4
ARGF4
ADDRLP4 136
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1330
;1329:						trap_R_RegisterShader( item->icon ) );
;1330:						if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $929
line 1331
;1331:							xx -= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1332
;1332:						} else {
ADDRGP4 $930
JUMPV
LABELV $929
line 1333
;1333:							xx += TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1334
;1334:						}
LABELV $930
line 1335
;1335:					}
LABELV $925
line 1336
;1336:				}
LABELV $923
line 1337
;1337:			}
LABELV $920
line 1322
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $919
line 1339
;1338:
;1339:			y += TINYCHAR_HEIGHT;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
ADDF4
ASGNF4
line 1340
;1340:		}
LABELV $879
line 1341
;1341:	}
LABELV $875
line 1268
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $877
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $874
line 1343
;1342:
;1343:	return ret_y;
ADDRLP4 88
INDIRI4
CVIF4 4
RETF4
LABELV $822
endproc CG_DrawTeamOverlay 144 36
proc CG_DrawFollowMessage 20 16
line 1346
;1344:}
;1345:
;1346:static float CG_DrawFollowMessage( float y ) {
line 1350
;1347:	char		*s;
;1348:	int			w;
;1349:
;1350:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) || ( ( cgs.elimflags & EF_NO_FREESPEC ) && (cgs.gametype == GT_ELIMINATION || cgs.gametype == GT_CTF_ELIMINATION ) ) ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $942
ADDRGP4 cgs+339052
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $935
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 9
EQI4 $942
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
NEI4 $935
LABELV $942
line 1351
;1351:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $934
JUMPV
LABELV $935
line 1354
;1352:	}
;1353:
;1354:	s = va("USE_ITEM to stop following");
ADDRGP4 $943
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1355
;1355:	w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 1356
;1356:	CG_DrawSmallString( 635 + cl_screenoffset.integer - w, y + 2, s, 1.0F);
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 635
ADDI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 1358
;1357:
;1358:	return y + SMALLCHAR_HEIGHT+4;
ADDRFP4 0
INDIRF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $934
endproc CG_DrawFollowMessage 20 16
proc CG_DrawUpperRight 24 12
line 1369
;1359:}
;1360:
;1361:
;1362:/*
;1363:=====================
;1364:CG_DrawUpperRight
;1365:
;1366:=====================
;1367:*/
;1368:static void CG_DrawUpperRight(stereoFrame_t stereoFrame)
;1369:{
line 1372
;1370:	float	y;
;1371:
;1372:	y = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1374
;1373:
;1374:	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1 && cg_drawTeamOverlay.integer == 1 ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $948
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 cgs+342392
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $948
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $948
line 1375
;1375:		y = CG_DrawTeamOverlay( y, qtrue, qtrue );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1376
;1376:	}
LABELV $948
line 1377
;1377:	if ( cgs.gametype == GT_LMS && cg.showScores ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 11
NEI4 $953
ADDRGP4 cg+1888436
INDIRI4
CNSTI4 0
EQI4 $953
line 1378
;1378:		y = CG_DrawLMSmode(y);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawLMSmode
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1379
;1379:	}
ADDRGP4 $954
JUMPV
LABELV $953
line 1381
;1380:	else
;1381:	if ( cgs.gametype == GT_CTF_ELIMINATION ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
NEI4 $957
line 1382
;1382:		y = CG_DrawCTFoneway(y);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawCTFoneway
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1383
;1383:	}
ADDRGP4 $958
JUMPV
LABELV $957
line 1385
;1384:	else
;1385:	if ( cgs.gametype == GT_DOMINATION ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 13
NEI4 $960
line 1386
;1386:		y = CG_DrawDomStatus(y);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawDomStatus
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1387
;1387:	}
LABELV $960
LABELV $958
LABELV $954
line 1389
;1388:
;1389:	if ( cg_drawSnapshot.integer ) {
ADDRGP4 cg_drawSnapshot+12
INDIRI4
CNSTI4 0
EQI4 $963
line 1390
;1390:		y = CG_DrawSnapshot( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawSnapshot
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1391
;1391:	}
LABELV $963
line 1392
;1392:	if (cg_drawFPS.integer && (stereoFrame == STEREO_CENTER || stereoFrame == STEREO_RIGHT)) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 cg_drawFPS+12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $966
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $969
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $966
LABELV $969
line 1393
;1393:		y = CG_DrawFPS( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 CG_DrawFPS
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1394
;1394:	}
LABELV $966
line 1395
;1395:	if (cgs.gametype==GT_ELIMINATION || cgs.gametype == GT_CTF_ELIMINATION || cgs.gametype==GT_LMS) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 9
EQI4 $976
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $976
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 11
NEI4 $970
LABELV $976
line 1396
;1396:		y = CG_DrawEliminationTimer( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 CG_DrawEliminationTimer
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1397
;1397:	}
LABELV $970
line 1399
;1398:
;1399:	y = CG_DrawFollowMessage( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 CG_DrawFollowMessage
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1400
;1400:if(mod_roundmode == 1){
ADDRGP4 mod_roundmode
INDIRI4
CNSTI4 1
NEI4 $977
line 1401
;1401:	y = CG_DrawCustomRound( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 CG_DrawCustomRound
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1402
;1402:}
LABELV $977
line 1404
;1403:
;1404:	if ( cg_drawTimer.integer) {
ADDRGP4 cg_drawTimer+12
INDIRI4
CNSTI4 0
EQI4 $979
line 1405
;1405:		y = CG_DrawTimer( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 CG_DrawTimer
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1406
;1406:	}
LABELV $979
line 1407
;1407:	if ( cg_drawSpeed.integer ) {
ADDRGP4 cg_drawSpeed+12
INDIRI4
CNSTI4 0
EQI4 $982
line 1408
;1408:		y = CG_DrawSpeedMeter( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 CG_DrawSpeedMeter
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1409
;1409:	}
LABELV $982
line 1411
;1410:
;1411:}
LABELV $947
endproc CG_DrawUpperRight 24 12
proc CG_DrawScores 92 20
line 1428
;1412:
;1413:/*
;1414:===========================================================================================
;1415:
;1416:  LOWER RIGHT CORNER
;1417:
;1418:===========================================================================================
;1419:*/
;1420:
;1421:/*
;1422:=================
;1423:CG_DrawScores
;1424:
;1425:Draw the small two score display
;1426:=================
;1427:*/
;1428:static float CG_DrawScores( float y ) {
line 1438
;1429:	const char	*s;
;1430:	int			s1, s2, score;
;1431:	int			x, w;
;1432:	int			v;
;1433:	vec4_t		color;
;1434:	float		y1;
;1435:	gitem_t		*item;
;1436:        int statusA,statusB;
;1437:
;1438:        statusA = cgs.redflag;
ADDRLP4 40
ADDRGP4 cgs+342624
INDIRI4
ASGNI4
line 1439
;1439:        statusB = cgs.blueflag;
ADDRLP4 48
ADDRGP4 cgs+342628
INDIRI4
ASGNI4
line 1441
;1440:
;1441:	s1 = cgs.scores1;
ADDRLP4 28
ADDRGP4 cgs+342616
INDIRI4
ASGNI4
line 1442
;1442:	s2 = cgs.scores2;
ADDRLP4 36
ADDRGP4 cgs+342620
INDIRI4
ASGNI4
line 1444
;1443:
;1444:	y -=  BIGCHAR_HEIGHT + 8;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
SUBF4
ASGNF4
line 1446
;1445:
;1446:	y1 = y;
ADDRLP4 32
ADDRFP4 0
INDIRF4
ASGNF4
line 1449
;1447:
;1448:	// draw from the right side to left
;1449:	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $991
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $991
line 1450
;1450:		x = 640 + cl_screenoffset.integer;
ADDRLP4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 1451
;1451:		color[0] = 0.0f;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1452
;1452:		color[1] = 0.0f;
ADDRLP4 4+4
CNSTF4 0
ASGNF4
line 1453
;1453:		color[2] = 1.0f;
ADDRLP4 4+8
CNSTF4 1065353216
ASGNF4
line 1454
;1454:		color[3] = 0.33f;
ADDRLP4 4+12
CNSTF4 1051260355
ASGNF4
line 1455
;1455:		s = va( "%2i", s2 );
ADDRGP4 $999
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 60
INDIRP4
ASGNP4
line 1456
;1456:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 64
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
CNSTI4 8
ADDI4
ASGNI4
line 1457
;1457:		x -= w;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1458
;1458:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1459
;1459:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1002
line 1460
;1460:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cgs+956380+456
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1461
;1461:		}
LABELV $1002
line 1462
;1462:		CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 0
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1464
;1463:
;1464:		if ( cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $1012
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
NEI4 $1008
LABELV $1012
line 1466
;1465:			// Display flag status
;1466:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 68
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 56
ADDRLP4 68
INDIRP4
ASGNP4
line 1468
;1467:
;1468:			if (item) {
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1013
line 1469
;1469:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 32
ADDRFP4 0
INDIRF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1470
;1470:				if( cgs.blueflag >= 0 && cgs.blueflag <= 2 ) {
ADDRGP4 cgs+342628
INDIRI4
CNSTI4 0
LTI4 $1016
ADDRGP4 cgs+342628
INDIRI4
CNSTI4 2
GTI4 $1016
line 1471
;1471:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.blueFlagShader[cgs.blueflag] );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cgs+342628
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1472
;1472:				}
LABELV $1016
line 1473
;1473:			}
LABELV $1013
line 1474
;1474:		}
LABELV $1008
line 1476
;1475:
;1476:                if ( cgs.gametype == GT_DOUBLE_D ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 12
NEI4 $1024
line 1479
;1477:			// Display Domination point status
;1478:
;1479:				y1 = y - 32;//BIGCHAR_HEIGHT - 8;
ADDRLP4 32
ADDRFP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 1480
;1480:				if( cgs.redflag >= 0 && cgs.redflag <= 3 ) {
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 0
LTI4 $1027
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 3
GTI4 $1027
line 1481
;1481:					CG_DrawPic( x, y1-4, w, 32, cgs.media.ddPointSkinB[cgs.blueflag] );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1107296256
ARGF4
ADDRGP4 cgs+342628
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+112
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1482
;1482:				}
LABELV $1027
line 1483
;1483:		}
LABELV $1024
line 1485
;1484:
;1485:		color[0] = 1.0f;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1486
;1486:		color[1] = 0.0f;
ADDRLP4 4+4
CNSTF4 0
ASGNF4
line 1487
;1487:		color[2] = 0.0f;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 1488
;1488:		color[3] = 0.33f;
ADDRLP4 4+12
CNSTF4 1051260355
ASGNF4
line 1489
;1489:		s = va( "%2i", s1 );
ADDRGP4 $999
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 68
INDIRP4
ASGNP4
line 1490
;1490:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 72
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
CNSTI4 8
ADDI4
ASGNI4
line 1491
;1491:		x -= w;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1492
;1492:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1493
;1493:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1039
line 1494
;1494:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cgs+956380+456
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1495
;1495:		}
LABELV $1039
line 1496
;1496:		CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 0
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1498
;1497:
;1498:		if ( cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $1049
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
NEI4 $1045
LABELV $1049
line 1500
;1499:			// Display flag status
;1500:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 76
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 56
ADDRLP4 76
INDIRP4
ASGNP4
line 1502
;1501:
;1502:			if (item) {
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1050
line 1503
;1503:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 32
ADDRFP4 0
INDIRF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1504
;1504:				if( cgs.redflag >= 0 && cgs.redflag <= 2 ) {
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 0
LTI4 $1053
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 2
GTI4 $1053
line 1505
;1505:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.redFlagShader[cgs.redflag] );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+56
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1506
;1506:				}
LABELV $1053
line 1507
;1507:			}
LABELV $1050
line 1508
;1508:		}
LABELV $1045
line 1510
;1509:
;1510:                if ( cgs.gametype == GT_DOUBLE_D ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 12
NEI4 $1061
line 1513
;1511:			// Display Domination point status
;1512:
;1513:				y1 = y - 32;//BIGCHAR_HEIGHT - 8;
ADDRLP4 32
ADDRFP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 1514
;1514:				if( cgs.redflag >= 0 && cgs.redflag <= 3 ) {
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 0
LTI4 $1064
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 3
GTI4 $1064
line 1515
;1515:					CG_DrawPic( x, y1-4, w, 32, cgs.media.ddPointSkinA[cgs.redflag] );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1107296256
ARGF4
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1516
;1516:				}
LABELV $1064
line 1521
;1517:
;1518:
;1519:
;1520:                        //Time till capture:
;1521:                        if( ( ( statusB == statusA ) && ( statusA == TEAM_RED ) ) ||
ADDRLP4 76
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $1074
ADDRLP4 76
INDIRI4
CNSTI4 1
EQI4 $1073
LABELV $1074
ADDRLP4 80
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $1071
ADDRLP4 80
INDIRI4
CNSTI4 2
NEI4 $1071
LABELV $1073
line 1522
;1522:                            ( ( statusB == statusA ) && ( statusA == TEAM_BLUE ) ) ) {
line 1523
;1523:                                s = va("%i",(cgs.timetaken+10*1000-cg.time)/1000+1);
ADDRGP4 $220
ARGP4
ADDRGP4 cgs+342416
INDIRI4
CNSTI4 10000
ADDI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 84
INDIRP4
ASGNP4
line 1524
;1524:                                w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 88
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 1525
;1525:                                CG_DrawBigString( x + 32+8-w/2, y-28, s, 1.0F);
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
CNSTI4 8
ADDI4
ADDRLP4 24
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1105199104
SUBF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1526
;1526:                        }
LABELV $1071
line 1527
;1527:		}
LABELV $1061
line 1529
;1528:
;1529:                if ( cgs.gametype == GT_OBELISK ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 7
NEI4 $1078
line 1530
;1530:                    s = va("^1%3i%% ^4%3i%%",cg.redObeliskHealth,cg.blueObeliskHealth);
ADDRGP4 $1081
ARGP4
ADDRGP4 cg+1987832
INDIRI4
ARGI4
ADDRGP4 cg+1987836
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 76
INDIRP4
ASGNP4
line 1531
;1531:                    CG_DrawSmallString( x, y-28, s, 1.0F);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CNSTF4 1105199104
SUBF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 1532
;1532:                }
LABELV $1078
line 1536
;1533:
;1534:
;1535:
;1536:		if ( cgs.gametype >= GT_CTF && cgs.ffa_gt==0) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
LTI4 $1084
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 0
NEI4 $1084
line 1537
;1537:			v = cgs.capturelimit;
ADDRLP4 52
ADDRGP4 cgs+339064
INDIRI4
ASGNI4
line 1538
;1538:		} else {
ADDRGP4 $1085
JUMPV
LABELV $1084
line 1539
;1539:			v = cgs.fraglimit;
ADDRLP4 52
ADDRGP4 cgs+339060
INDIRI4
ASGNI4
line 1540
;1540:		}
LABELV $1085
line 1541
;1541:		if ( v ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $992
line 1542
;1542:			s = va( "%2i", v );
ADDRGP4 $999
ARGP4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 76
INDIRP4
ASGNP4
line 1543
;1543:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 80
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
CNSTI4 8
ADDI4
ASGNI4
line 1544
;1544:			x -= w;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1545
;1545:			CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 0
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1546
;1546:		}
line 1548
;1547:
;1548:	} else {
ADDRGP4 $992
JUMPV
LABELV $991
line 1551
;1549:		qboolean	spectator;
;1550:
;1551:		x = 640 + cl_screenoffset.integer;
ADDRLP4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 1552
;1552:		score = cg.snap->ps.persistant[PERS_SCORE];
ADDRLP4 44
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
line 1553
;1553:		spectator = ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR );
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1097
ADDRLP4 64
CNSTI4 1
ASGNI4
ADDRGP4 $1098
JUMPV
LABELV $1097
ADDRLP4 64
CNSTI4 0
ASGNI4
LABELV $1098
ADDRLP4 60
ADDRLP4 64
INDIRI4
ASGNI4
line 1556
;1554:
;1555:		// always show your score in the second box if not in first place
;1556:		if ( s1 != score ) {
ADDRLP4 28
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $1099
line 1557
;1557:			s2 = score;
ADDRLP4 36
ADDRLP4 44
INDIRI4
ASGNI4
line 1558
;1558:		}
LABELV $1099
line 1559
;1559:		if(cgs.gametype != GT_SINGLE){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $1101
line 1560
;1560:		if ( s2 != SCORE_NOT_PRESENT ) {
ADDRLP4 36
INDIRI4
CNSTI4 -9999
EQI4 $1104
line 1561
;1561:			s = va( "%2i", s2 );
ADDRGP4 $999
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 68
INDIRP4
ASGNP4
line 1562
;1562:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 72
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
CNSTI4 8
ADDI4
ASGNI4
line 1563
;1563:			x -= w;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1564
;1564:			if ( !spectator && score == s2 && score != s1 ) {
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1107
ADDRLP4 76
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1107
ADDRLP4 76
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1107
line 1565
;1565:				color[0] = 1.0f;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1566
;1566:				color[1] = 0.0f;
ADDRLP4 4+4
CNSTF4 0
ASGNF4
line 1567
;1567:				color[2] = 0.0f;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 1568
;1568:				color[3] = 0.33f;
ADDRLP4 4+12
CNSTF4 1051260355
ASGNF4
line 1569
;1569:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1570
;1570:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cgs+956380+456
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1571
;1571:			} else {
ADDRGP4 $1108
JUMPV
LABELV $1107
line 1572
;1572:				color[0] = 0.5f;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1573
;1573:				color[1] = 0.5f;
ADDRLP4 4+4
CNSTF4 1056964608
ASGNF4
line 1574
;1574:				color[2] = 0.5f;
ADDRLP4 4+8
CNSTF4 1056964608
ASGNF4
line 1575
;1575:				color[3] = 0.33f;
ADDRLP4 4+12
CNSTF4 1051260355
ASGNF4
line 1576
;1576:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1577
;1577:			}
LABELV $1108
line 1578
;1578:			CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 0
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1579
;1579:		}
LABELV $1104
line 1580
;1580:		}
LABELV $1101
line 1583
;1581:
;1582:		// first place
;1583:		if ( s1 != SCORE_NOT_PRESENT ) {
ADDRLP4 28
INDIRI4
CNSTI4 -9999
EQI4 $1120
line 1584
;1584:			s = va( "%2i", s1 );
ADDRGP4 $999
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 68
INDIRP4
ASGNP4
line 1585
;1585:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 72
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
CNSTI4 8
ADDI4
ASGNI4
line 1586
;1586:			x -= w;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1587
;1587:			if ( !spectator && score == s1 ) {
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1123
ADDRLP4 44
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1123
line 1588
;1588:				color[0] = 0.0f;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1589
;1589:				color[1] = 0.0f;
ADDRLP4 4+4
CNSTF4 0
ASGNF4
line 1590
;1590:				color[2] = 1.0f;
ADDRLP4 4+8
CNSTF4 1065353216
ASGNF4
line 1591
;1591:				color[3] = 0.33f;
ADDRLP4 4+12
CNSTF4 1051260355
ASGNF4
line 1592
;1592:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1593
;1593:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRGP4 cgs+956380+456
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1594
;1594:			} else {
ADDRGP4 $1124
JUMPV
LABELV $1123
line 1595
;1595:				color[0] = 0.5f;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1596
;1596:				color[1] = 0.5f;
ADDRLP4 4+4
CNSTF4 1056964608
ASGNF4
line 1597
;1597:				color[2] = 0.5f;
ADDRLP4 4+8
CNSTF4 1056964608
ASGNF4
line 1598
;1598:				color[3] = 0.33f;
ADDRLP4 4+12
CNSTF4 1051260355
ASGNF4
line 1599
;1599:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1600
;1600:			}
LABELV $1124
line 1601
;1601:			CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 0
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1602
;1602:		}
LABELV $1120
line 1604
;1603:
;1604:		if ( cgs.fraglimit ) {
ADDRGP4 cgs+339060
INDIRI4
CNSTI4 0
EQI4 $1136
line 1605
;1605:			s = va( "%2i", cgs.fraglimit );
ADDRGP4 $999
ARGP4
ADDRGP4 cgs+339060
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 68
INDIRP4
ASGNP4
line 1606
;1606:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 72
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
CNSTI4 8
ADDI4
ASGNI4
line 1607
;1607:			x -= w;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1608
;1608:			CG_DrawBigString( x + 4, y, s, 1.0F);
ADDRLP4 0
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1609
;1609:		}
LABELV $1136
line 1611
;1610:
;1611:	}
LABELV $992
line 1613
;1612:
;1613:	return y1 - 8;
ADDRLP4 32
INDIRF4
CNSTF4 1090519040
SUBF4
RETF4
LABELV $985
endproc CG_DrawScores 92 20
bss
align 4
LABELV $1142
skip 16
code
proc CG_DrawPowerups 200 20
line 1621
;1614:}
;1615:
;1616:/*
;1617:================
;1618:CG_DrawPowerups
;1619:================
;1620:*/
;1621:static float CG_DrawPowerups( float y ) {
line 1634
;1622:	int		sorted[MAX_POWERUPS];
;1623:	int		sortedTime[MAX_POWERUPS];
;1624:	int		i, j, k;
;1625:	int		active;
;1626:	playerState_t	*ps;
;1627:	int		t;
;1628:	gitem_t	*item;
;1629:	int		x;
;1630:	float	size;
;1631:	float	f;
;1632:	static float colors[4];
;1633:	
;1634:	colors[0]=cg_crosshairColorRed.value;
ADDRGP4 $1142
ADDRGP4 cg_crosshairColorRed+8
INDIRF4
ASGNF4
line 1635
;1635:    colors[1]=cg_crosshairColorGreen.value;
ADDRGP4 $1142+4
ADDRGP4 cg_crosshairColorGreen+8
INDIRF4
ASGNF4
line 1636
;1636:    colors[2]=cg_crosshairColorBlue.value;
ADDRGP4 $1142+8
ADDRGP4 cg_crosshairColorBlue+8
INDIRF4
ASGNF4
line 1637
;1637:    colors[3]=1.0f;
ADDRGP4 $1142+12
CNSTF4 1065353216
ASGNF4
line 1639
;1638:
;1639:	ps = &cg.snap->ps;
ADDRLP4 152
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 1641
;1640:
;1641:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 152
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1150
line 1642
;1642:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $1141
JUMPV
LABELV $1150
line 1646
;1643:	}
;1644:
;1645:	// sort the list by time remaining
;1646:	active = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 1647
;1647:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $1152
line 1648
;1648:		if ( !ps->powerups[ i ] ) {
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 152
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1156
line 1649
;1649:			continue;
ADDRGP4 $1153
JUMPV
LABELV $1156
line 1651
;1650:		}
;1651:		t = ps->powerups[ i ] - cg.time;
ADDRLP4 140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 152
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
ASGNI4
line 1654
;1652:		// ZOID--don't draw if the power up has unlimited time (999 seconds)
;1653:		// This is true of the CTF flags
;1654:		if ( t < 0 || t > 99999000) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $1161
ADDRLP4 140
INDIRI4
CNSTI4 99999000
LEI4 $1159
LABELV $1161
line 1655
;1655:			continue;
ADDRGP4 $1153
JUMPV
LABELV $1159
line 1658
;1656:		}
;1657:
;1658:                item = BG_FindItemForPowerup( i );
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 172
INDIRP4
ASGNP4
line 1659
;1659:                if ( item && item->giType == IT_PERSISTANT_POWERUP)
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1162
ADDRLP4 148
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $1162
line 1660
;1660:                    continue; //Don't draw persistant powerups here!
ADDRGP4 $1153
JUMPV
LABELV $1162
line 1663
;1661:
;1662:		// insert into the list
;1663:		for ( j = 0 ; j < active ; j++ ) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1167
JUMPV
LABELV $1164
line 1664
;1664:			if ( sortedTime[j] >= t ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $1168
line 1665
;1665:				for ( k = active - 1 ; k >= j ; k-- ) {
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1173
JUMPV
LABELV $1170
line 1666
;1666:					sorted[k+1] = sorted[k];
ADDRLP4 180
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 180
INDIRI4
ADDRLP4 68+4
ADDP4
ADDRLP4 180
INDIRI4
ADDRLP4 68
ADDP4
INDIRI4
ASGNI4
line 1667
;1667:					sortedTime[k+1] = sortedTime[k];
ADDRLP4 184
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 184
INDIRI4
ADDRLP4 4+4
ADDP4
ADDRLP4 184
INDIRI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 1668
;1668:				}
LABELV $1171
line 1665
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1173
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $1170
line 1669
;1669:				break;
ADDRGP4 $1166
JUMPV
LABELV $1168
line 1671
;1670:			}
;1671:		}
LABELV $1165
line 1663
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1167
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $1164
LABELV $1166
line 1672
;1672:		sorted[j] = i;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 1673
;1673:		sortedTime[j] = t;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 1674
;1674:		active++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1675
;1675:	}
LABELV $1153
line 1647
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 16
LTI4 $1152
line 1678
;1676:
;1677:	// draw the icons and timers
;1678:	x = 640 - 100 + cl_screenoffset.integer - ICON_SIZE - CHAR_WIDTH * 2;
ADDRLP4 164
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 540
ADDI4
CNSTI4 28
SUBI4
CNSTI4 38
SUBI4
ASGNI4
line 1679
;1679:	for ( i = 0 ; i < active ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRGP4 $1180
JUMPV
LABELV $1177
line 1680
;1680:		item = BG_FindItemForPowerup( sorted[i] );
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 168
INDIRP4
ASGNP4
line 1682
;1681:
;1682:    if (item) {
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1181
line 1684
;1683:
;1684:		  y -= ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1105199104
SUBF4
ASGNF4
line 1686
;1685:
;1686:		  trap_R_SetColor( colors );
ADDRGP4 $1142
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1687
;1687:		  CG_DrawField( x + 16, y, 5, sortedTime[ i ] / 1000, 1 );
ADDRLP4 164
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawField
CALLV
pop
line 1689
;1688:
;1689:		  t = ps->powerups[ sorted[i] ];
ADDRLP4 172
CNSTI4 2
ASGNI4
ADDRLP4 140
ADDRLP4 144
INDIRI4
ADDRLP4 172
INDIRI4
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
LSHI4
ADDRLP4 152
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1690
;1690:		  if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 140
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $1183
line 1691
;1691:			  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1692
;1692:		  } else {
ADDRGP4 $1184
JUMPV
LABELV $1183
line 1695
;1693:			  vec4_t	modulate;
;1694:
;1695:			  f = (float)( t - cg.time ) / POWERUP_BLINK_TIME;
ADDRLP4 160
ADDRLP4 140
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 1696
;1696:			  f -= (int)f;
ADDRLP4 160
ADDRLP4 160
INDIRF4
ADDRLP4 160
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
ASGNF4
line 1697
;1697:			  modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
ADDRLP4 176+12
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176+8
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176
ADDRLP4 160
INDIRF4
ASGNF4
line 1698
;1698:			  trap_R_SetColor( modulate );
ADDRLP4 176
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1699
;1699:		  }
LABELV $1184
line 1701
;1700:
;1701:		  if ( cg.powerupActive == sorted[i] &&
ADDRGP4 cg+1952696
INDIRI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
NEI4 $1190
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1952700
INDIRI4
SUBI4
CNSTI4 2000
GEI4 $1190
line 1702
;1702:			  cg.time - cg.powerupTime < PULSE_TIME ) {
line 1703
;1703:			  f = 1.0 - ( ( (float)cg.time - cg.powerupTime ) / PULSE_TIME );
ADDRLP4 160
CNSTF4 1065353216
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
ADDRGP4 cg+1952700
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1157234688
DIVF4
SUBF4
ASGNF4
line 1704
;1704:			  size = ICON_SIZE * ( 1.0 + ( PULSE_SCALE - 1.0 ) * f );
ADDRLP4 156
CNSTF4 1105199104
CNSTF4 1041865114
ADDRLP4 160
INDIRF4
MULF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 1705
;1705:		  } else {
ADDRGP4 $1191
JUMPV
LABELV $1190
line 1706
;1706:			  size = ICON_SIZE;
ADDRLP4 156
CNSTF4 1105199104
ASGNF4
line 1707
;1707:		  }
LABELV $1191
line 1709
;1708:
;1709:		  CG_DrawPic( 640 + cl_screenoffset.integer - size, y + ICON_SIZE / 2 - size / 2,
ADDRLP4 148
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 640
ADDI4
CVIF4 4
ADDRLP4 156
INDIRF4
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
ADDF4
ADDRLP4 156
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 176
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1711
;1710:			  size, size, trap_R_RegisterShader( item->icon ) );
;1711:    }
LABELV $1181
line 1712
;1712:	}
LABELV $1178
line 1679
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1180
ADDRLP4 144
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $1177
line 1713
;1713:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1715
;1714:
;1715:	return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $1141
endproc CG_DrawPowerups 200 20
proc CG_DrawLowerRight 8 12
line 1724
;1716:}
;1717:
;1718:/*
;1719:=====================
;1720:CG_DrawLowerRight
;1721:
;1722:=====================
;1723:*/
;1724:static void CG_DrawLowerRight( void ) {
line 1727
;1725:	float	y;
;1726:
;1727:	y = 480 - ICON_SIZE*1.5;
ADDRLP4 0
CNSTF4 1138425856
ASGNF4
line 1729
;1728:
;1729:	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1 && cg_drawTeamOverlay.integer == 2 ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $1199
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $1199
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 2
NEI4 $1199
line 1730
;1730:		y = CG_DrawTeamOverlay( y, qtrue, qfalse );
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1731
;1731:	}
LABELV $1199
line 1733
;1732:
;1733:	if(cgs.gametype != GT_SANDBOX && cgs.gametype != GT_SINGLE){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 0
EQI4 $1204
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $1204
line 1734
;1734:	y = CG_DrawScores( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawScores
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1735
;1735:	}
LABELV $1204
line 1736
;1736:	y = CG_DrawPowerups( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawPowerups
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1737
;1737:}
LABELV $1198
endproc CG_DrawLowerRight 8 12
proc CG_DrawPickupItem 16 20
line 1744
;1738:
;1739:/*
;1740:===================
;1741:CG_DrawPickupItem
;1742:===================
;1743:*/
;1744:static int CG_DrawPickupItem( int y ) {
line 1748
;1745:	int		value;
;1746:	float	*fadeColor;
;1747:
;1748:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1209
line 1749
;1749:		return y;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $1208
JUMPV
LABELV $1209
line 1752
;1750:	}
;1751:
;1752:	y -=  ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 28
SUBI4
ASGNI4
line 1754
;1753:
;1754:	value = cg.itemPickup;
ADDRLP4 0
ADDRGP4 cg+1952952
INDIRI4
ASGNI4
line 1755
;1755:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1213
line 1756
;1756:		fadeColor = CG_FadeColor( cg.itemPickupTime, 3000 );
ADDRGP4 cg+1952956
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 8
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1757
;1757:		if ( fadeColor ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1216
line 1758
;1758:			CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1759
;1759:			trap_R_SetColor( fadeColor );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1760
;1760:			CG_DrawPic( 8 - cl_screenoffset.integer, y, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
CNSTI4 8
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1105199104
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1761
;1761:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1220
line 1762
;1762:			CG_DrawBigString( ICON_SIZE - cl_screenoffset.integer + 16, y + (ICON_SIZE/2 - BIGCHAR_HEIGHT/2), bg_itemlist[ value ].pickup_name, fadeColor[0] );
CNSTI4 28
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CNSTI4 16
ADDI4
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 14
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ADDI4
ARGI4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+28
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1763
;1763:			}
LABELV $1220
line 1764
;1764:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1226
line 1765
;1765:			CG_DrawBigString( ICON_SIZE - cl_screenoffset.integer + 16, y + (ICON_SIZE/2 - BIGCHAR_HEIGHT/2), bg_itemlist[ value ].pickup_nameru, fadeColor[0] );
CNSTI4 28
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CNSTI4 16
ADDI4
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 14
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ADDI4
ARGI4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+32
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 1766
;1766:			}
LABELV $1226
line 1767
;1767:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1768
;1768:		}
LABELV $1216
line 1769
;1769:	}
LABELV $1213
line 1771
;1770:
;1771:	return y;
ADDRFP4 0
INDIRI4
RETI4
LABELV $1208
endproc CG_DrawPickupItem 16 20
proc CG_DrawLowerLeft 12 12
line 1780
;1772:}
;1773:
;1774:/*
;1775:=====================
;1776:CG_DrawLowerLeft
;1777:
;1778:=====================
;1779:*/
;1780:static void CG_DrawLowerLeft( void ) {
line 1783
;1781:	float	y;
;1782:
;1783:	y = 50 + ICON_SIZE;
ADDRLP4 0
CNSTF4 1117519872
ASGNF4
line 1785
;1784:
;1785:	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1 && cg_drawTeamOverlay.integer == 3 ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $1233
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $1233
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 3
NEI4 $1233
line 1786
;1786:		y = CG_DrawTeamOverlay( y, qfalse, qfalse );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1787
;1787:	}
LABELV $1233
line 1790
;1788:
;1789:
;1790:	y = CG_DrawPickupItem( y );
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawPickupItem
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
line 1791
;1791:}
LABELV $1232
endproc CG_DrawLowerLeft 12 12
proc CG_DrawTeamInfo 52 36
line 1801
;1792:
;1793://===========================================================================================
;1794:
;1795:/*
;1796:=================
;1797:CG_DrawTeamInfo
;1798:=================
;1799:*/
;1800://#ifndef MISSIONPACK
;1801:static void CG_DrawTeamInfo( void ) {
line 1807
;1802:	int w, h;
;1803:	int i, len;
;1804:	vec4_t		hcolor;
;1805:	int		chatHeight;
;1806:
;1807:	if (cg_newConsole.integer) {
ADDRGP4 cg_newConsole+12
INDIRI4
CNSTI4 0
EQI4 $1239
line 1808
;1808:		return;
ADDRGP4 $1238
JUMPV
LABELV $1239
line 1814
;1809:	}
;1810:
;1811:#define CHATLOC_Y 420 // bottom end
;1812:#define CHATLOC_X 0 - cl_screenoffset.integer
;1813:
;1814:	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
ADDRGP4 cg_teamChatHeight+12
INDIRI4
CNSTI4 8
GEI4 $1242
line 1815
;1815:		chatHeight = cg_teamChatHeight.integer;
ADDRLP4 8
ADDRGP4 cg_teamChatHeight+12
INDIRI4
ASGNI4
ADDRGP4 $1243
JUMPV
LABELV $1242
line 1817
;1816:	else
;1817:		chatHeight = TEAMCHAT_HEIGHT;
ADDRLP4 8
CNSTI4 8
ASGNI4
LABELV $1243
line 1818
;1818:	if (chatHeight <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $1246
line 1819
;1819:		return; // disabled
ADDRGP4 $1238
JUMPV
LABELV $1246
line 1821
;1820:
;1821:	if (cgs.teamLastChatPos != cgs.teamChatPos) {
ADDRGP4 cgs+956288
INDIRI4
ADDRGP4 cgs+956284
INDIRI4
EQI4 $1248
line 1822
;1822:		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cgs+956288
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956252
ADDP4
INDIRI4
SUBI4
ADDRGP4 cg_teamChatTime+12
INDIRI4
LEI4 $1252
line 1823
;1823:			cgs.teamLastChatPos++;
ADDRLP4 36
ADDRGP4 cgs+956288
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1824
;1824:		}
LABELV $1252
line 1826
;1825:
;1826:		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;
ADDRLP4 32
ADDRGP4 cgs+956284
INDIRI4
ADDRGP4 cgs+956288
INDIRI4
SUBI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
DIVI4
MULI4
ASGNI4
line 1828
;1827:
;1828:		w = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1830
;1829:
;1830:		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
ADDRLP4 0
ADDRGP4 cgs+956288
INDIRI4
ASGNI4
ADDRGP4 $1265
JUMPV
LABELV $1262
line 1831
;1831:			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
CNSTI4 241
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+954324
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 1832
;1832:			if (len > w)
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $1269
line 1833
;1833:				w = len;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $1269
line 1834
;1834:		}
LABELV $1263
line 1830
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1265
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+956284
INDIRI4
LTI4 $1262
line 1835
;1835:		w *= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
MULI4
ASGNI4
line 1836
;1836:		w += TINYCHAR_WIDTH * 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 1
LSHI4
ADDI4
ASGNI4
line 1838
;1837:
;1838:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1273
line 1839
;1839:			hcolor[0] = 1.0f;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1840
;1840:			hcolor[1] = 0.0f;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1841
;1841:			hcolor[2] = 0.0f;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1842
;1842:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1843
;1843:		} else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 $1274
JUMPV
LABELV $1273
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1279
line 1844
;1844:			hcolor[0] = 0.0f;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1845
;1845:			hcolor[1] = 0.0f;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1846
;1846:			hcolor[2] = 1.0f;
ADDRLP4 16+8
CNSTF4 1065353216
ASGNF4
line 1847
;1847:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1848
;1848:		} else {
ADDRGP4 $1280
JUMPV
LABELV $1279
line 1849
;1849:			hcolor[0] = 0.0f;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1850
;1850:			hcolor[1] = 1.0f;
ADDRLP4 16+4
CNSTF4 1065353216
ASGNF4
line 1851
;1851:			hcolor[2] = 0.0f;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1852
;1852:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1853
;1853:		}
LABELV $1280
LABELV $1274
line 1855
;1854:
;1855:		hcolor[0] = hcolor[1] = hcolor[2] = 1.0f;
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
ADDRLP4 16+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ASGNF4
line 1856
;1856:		hcolor[3] = 1.0f;
ADDRLP4 16+12
CNSTF4 1065353216
ASGNF4
line 1858
;1857:
;1858:		for (i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i--) {
ADDRLP4 0
ADDRGP4 cgs+956284
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1294
JUMPV
LABELV $1291
line 1859
;1859:			CG_DrawStringExt( CHATLOC_X + TINYCHAR_WIDTH * cg_teamChatScaleX.value, 
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 40
INDIRI4
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 44
INDIRI4
DIVI4
CVIF4 4
ADDRGP4 cg_teamChatScaleX+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ARGI4
ADDRGP4 cg_teamChatY+12
INDIRI4
CVIF4 4
ADDRGP4 cgs+956284
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 44
INDIRI4
DIVI4
MULI4
CVIF4 4
ADDRGP4 cg_teamChatScaleY+8
INDIRF4
MULF4
SUBF4
CVFI4 4
ARGI4
CNSTI4 241
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
MULI4
ADDRGP4 cgs+954324
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 44
INDIRI4
DIVI4
CVIF4 4
ADDRGP4 cg_teamChatScaleX+8
INDIRF4
MULF4
CVFI4 4
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 44
INDIRI4
DIVI4
CVIF4 4
ADDRGP4 cg_teamChatScaleY+8
INDIRF4
MULF4
CVFI4 4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 1863
;1860:				cg_teamChatY.integer - (cgs.teamChatPos - i)*TINYCHAR_HEIGHT * cg_teamChatScaleY.value, 
;1861:				cgs.teamChatMsgs[i % chatHeight], hcolor, qfalse, qfalse,
;1862:				TINYCHAR_WIDTH * cg_teamChatScaleX.value, TINYCHAR_HEIGHT * cg_teamChatScaleY.value, 0 );
;1863:		}
LABELV $1292
line 1858
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1294
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+956288
INDIRI4
GEI4 $1291
line 1864
;1864:	}
LABELV $1248
line 1865
;1865:}
LABELV $1238
endproc CG_DrawTeamInfo 52 36
export CG_FontResAdjust
proc CG_FontResAdjust 4 0
line 1867
;1866:
;1867:float CG_FontResAdjust(void) {
line 1868
;1868:	float f = 1.0;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1869
;1869:	if (cgs.glconfig.vidHeight < 1024) {
ADDRGP4 cgs+327684+11308
INDIRI4
CNSTI4 1024
GEI4 $1310
line 1870
;1870:		f *= 1024.0/cgs.glconfig.vidHeight;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1149239296
ADDRGP4 cgs+327684+11308
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
line 1871
;1871:	}
LABELV $1310
line 1872
;1872:	return f;
ADDRLP4 0
INDIRF4
RETF4
LABELV $1309
endproc CG_FontResAdjust 4 0
export CG_ConsoleDistortionFactorX
proc CG_ConsoleDistortionFactorX 4 0
line 1875
;1873:}
;1874:
;1875:float CG_ConsoleDistortionFactorX(void) {
line 1876
;1876:	return ((cgs.screenXScale > cgs.screenYScale) ? (cgs.screenYScale / cgs.screenXScale) : 1.0);
ADDRGP4 cgs+339016
INDIRF4
ADDRGP4 cgs+339020
INDIRF4
LEF4 $1322
ADDRLP4 0
ADDRGP4 cgs+339020
INDIRF4
ADDRGP4 cgs+339016
INDIRF4
DIVF4
ASGNF4
ADDRGP4 $1323
JUMPV
LABELV $1322
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
LABELV $1323
ADDRLP4 0
INDIRF4
RETF4
LABELV $1316
endproc CG_ConsoleDistortionFactorX 4 0
export CG_ConsoleDistortionFactorY
proc CG_ConsoleDistortionFactorY 4 0
line 1879
;1877:}
;1878:
;1879:float CG_ConsoleDistortionFactorY(void) {
line 1880
;1880:	return ((cgs.screenYScale > cgs.screenXScale) ? (cgs.screenXScale / cgs.screenYScale) : 1.0);
ADDRGP4 cgs+339020
INDIRF4
ADDRGP4 cgs+339016
INDIRF4
LEF4 $1330
ADDRLP4 0
ADDRGP4 cgs+339016
INDIRF4
ADDRGP4 cgs+339020
INDIRF4
DIVF4
ASGNF4
ADDRGP4 $1331
JUMPV
LABELV $1330
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
LABELV $1331
ADDRLP4 0
INDIRF4
RETF4
LABELV $1324
endproc CG_ConsoleDistortionFactorY 4 0
export CG_ConsoleAdjustSizeX
proc CG_ConsoleAdjustSizeX 8 0
line 1883
;1881:}
;1882:
;1883:float CG_ConsoleAdjustSizeX(float sizeX) {
line 1884
;1884:	return CG_FontResAdjust() * sizeX * CG_ConsoleDistortionFactorX();
ADDRLP4 0
ADDRGP4 CG_FontResAdjust
CALLF4
ASGNF4
ADDRLP4 4
ADDRGP4 CG_ConsoleDistortionFactorX
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRF4
MULF4
ADDRLP4 4
INDIRF4
MULF4
RETF4
LABELV $1332
endproc CG_ConsoleAdjustSizeX 8 0
export CG_ConsoleAdjustSizeY
proc CG_ConsoleAdjustSizeY 8 0
line 1887
;1885:}
;1886:
;1887:float CG_ConsoleAdjustSizeY(float sizeY) {
line 1888
;1888:	return CG_FontResAdjust() * sizeY * CG_ConsoleDistortionFactorY();
ADDRLP4 0
ADDRGP4 CG_FontResAdjust
CALLF4
ASGNF4
ADDRLP4 4
ADDRGP4 CG_ConsoleDistortionFactorY
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRF4
MULF4
ADDRLP4 4
INDIRF4
MULF4
RETF4
LABELV $1333
endproc CG_ConsoleAdjustSizeY 8 0
export CG_GetChatHeight
proc CG_GetChatHeight 0 0
line 1891
;1889:}
;1890:
;1891:int CG_GetChatHeight(int maxlines) {
line 1892
;1892:	if (maxlines < CONSOLE_MAXHEIGHT)
ADDRFP4 0
INDIRI4
CNSTI4 16
GEI4 $1335
line 1893
;1893:		return maxlines;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $1334
JUMPV
LABELV $1335
line 1894
;1894:	return CONSOLE_MAXHEIGHT;
CNSTI4 16
RETI4
LABELV $1334
endproc CG_GetChatHeight 0 0
export CG_ConsoleChatPositionY
proc CG_ConsoleChatPositionY 4 4
line 1897
;1895:}
;1896:
;1897:int CG_ConsoleChatPositionY(float consoleSizeY, float chatSizeY) {
line 1898
;1898:	return CG_GetChatHeight(cg_consoleLines.integer) * consoleSizeY + chatSizeY/2;
ADDRGP4 cg_consoleLines+12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 CG_GetChatHeight
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
CVFI4 4
RETI4
LABELV $1337
endproc CG_ConsoleChatPositionY 4 4
export CG_ConsoleUpdateIdx
proc CG_ConsoleUpdateIdx 12 0
line 1902
;1899:}
;1900:
;1901:
;1902:void CG_ConsoleUpdateIdx(console_t *console, int chatHeight) {
line 1903
;1903:	if (console->insertIdx < console->displayIdx) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 3920
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 3924
ADDP4
INDIRI4
GEI4 $1340
line 1904
;1904:		console->displayIdx = console->insertIdx;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 3924
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 3920
ADDP4
INDIRI4
ASGNI4
line 1905
;1905:		}
LABELV $1340
line 1907
;1906:
;1907:	if (console->insertIdx - console->displayIdx > chatHeight) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 3920
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 3924
ADDP4
INDIRI4
SUBI4
ADDRFP4 4
INDIRI4
LEI4 $1342
line 1908
;1908:		console->displayIdx = console->insertIdx - chatHeight;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 3924
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 3920
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
SUBI4
ASGNI4
line 1909
;1909:	}
LABELV $1342
line 1910
;1910:}
LABELV $1339
endproc CG_ConsoleUpdateIdx 12 0
proc CG_DrawGenericConsole 44 36
line 1913
;1911:
;1912:
;1913:static void CG_DrawGenericConsole( console_t *console, int maxlines, int time, int x, int y, float sizeX, float sizeY ) {
line 1918
;1914:	int i, j;
;1915:	vec4_t	hcolor;
;1916:	int	chatHeight;
;1917:
;1918:	if (!cg_newConsole.integer) {
ADDRGP4 cg_newConsole+12
INDIRI4
CNSTI4 0
NEI4 $1345
line 1919
;1919:		return;
ADDRGP4 $1344
JUMPV
LABELV $1345
line 1922
;1920:	}
;1921:
;1922:	chatHeight = CG_GetChatHeight(maxlines);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_GetChatHeight
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 1924
;1923:
;1924:	if (chatHeight <= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
GTI4 $1348
line 1925
;1925:		return; // disabled
ADDRGP4 $1344
JUMPV
LABELV $1348
line 1927
;1926:
;1927:	CG_ConsoleUpdateIdx(console, chatHeight);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 CG_ConsoleUpdateIdx
CALLV
pop
line 1929
;1928:
;1929:	hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0f;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
ADDRLP4 8+12
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 1931
;1930:
;1931:	j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1932
;1932:	for (i = console->displayIdx; i < console->insertIdx ; ++i) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 3924
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1356
JUMPV
LABELV $1353
line 1933
;1933:		if (console->msgTimes[i % CONSOLE_MAXHEIGHT] + time < cg.time) {
ADDRLP4 0
INDIRI4
CNSTI4 16
MODI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 3856
ADDP4
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 cg+1868892
INDIRI4
GEI4 $1357
line 1934
;1934:			continue;
ADDRGP4 $1354
JUMPV
LABELV $1357
line 1936
;1935:		}
;1936:		CG_DrawStringExt( x + 1,
ADDRFP4 12
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRFP4 16
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 24
INDIRF4
MULF4
ADDF4
CVFI4 4
ARGI4
CNSTI4 241
ADDRLP4 0
INDIRI4
CNSTI4 16
MODI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 cg_fontShadow+12
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $1362
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $1363
JUMPV
LABELV $1362
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $1363
ADDRLP4 36
INDIRI4
ARGI4
ADDRFP4 20
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 24
INDIRF4
CVFI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 1941
;1937:				  y + j * sizeY,
;1938:				  console->msgs[i % CONSOLE_MAXHEIGHT],
;1939:				  hcolor, qfalse, cg_fontShadow.integer ? qtrue : qfalse,
;1940:				  sizeX,  sizeY, 0 );
;1941:		j++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1943
;1942:
;1943:	}
LABELV $1354
line 1932
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1356
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 3920
ADDP4
INDIRI4
LTI4 $1353
line 1944
;1944:}
LABELV $1344
endproc CG_DrawGenericConsole 44 36
export CG_AddToGenericConsole
proc CG_AddToGenericConsole 52 0
line 1946
;1945:
;1946:void CG_AddToGenericConsole( const char *str, console_t *console ) {
line 1951
;1947:	int len;
;1948:	char *p, *ls;
;1949:	int lastcolor;
;1950:
;1951:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1953
;1952:
;1953:	p = console->msgs[console->insertIdx % CONSOLE_MAXHEIGHT];
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
CNSTI4 241
ADDRLP4 16
INDIRP4
CNSTI4 3920
ADDP4
INDIRI4
CNSTI4 16
MODI4
MULI4
ADDRLP4 16
INDIRP4
ADDP4
ASGNP4
line 1954
;1954:	*p = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1956
;1955:
;1956:	lastcolor = '7';
ADDRLP4 12
CNSTI4 55
ASGNI4
line 1958
;1957:
;1958:	ls = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRGP4 $1366
JUMPV
LABELV $1365
line 1959
;1959:	while (*str) {
line 1960
;1960:		if (*str == '\n' || len > CONSOLE_WIDTH - 1) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
EQI4 $1370
ADDRLP4 4
INDIRI4
CNSTI4 79
LEI4 $1368
LABELV $1370
line 1961
;1961:			if (*str == '\n') {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $1371
line 1962
;1962:				str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1963
;1963:				if (*str == '\0') {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1372
line 1964
;1964:					continue;
ADDRGP4 $1366
JUMPV
line 1966
;1965:				}
;1966:			} else if (ls) {
LABELV $1371
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1375
line 1967
;1967:				str -= (p - ls);
ADDRFP4 0
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
SUBP4
ASGNP4
line 1968
;1968:				str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1969
;1969:				p -= (p - ls);
ADDRLP4 0
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
SUBP4
ASGNP4
line 1970
;1970:			}
LABELV $1375
LABELV $1372
line 1971
;1971:			*p = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1973
;1972:
;1973:			console->msgTimes[console->insertIdx % CONSOLE_MAXHEIGHT] = cg.time;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 3920
ADDP4
INDIRI4
CNSTI4 16
MODI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 3856
ADDP4
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1975
;1974:
;1975:			console->insertIdx++;
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 3920
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1976
;1976:			p = console->msgs[console->insertIdx % CONSOLE_MAXHEIGHT];
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
CNSTI4 241
ADDRLP4 28
INDIRP4
CNSTI4 3920
ADDP4
INDIRI4
CNSTI4 16
MODI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ASGNP4
line 1977
;1977:			*p = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1978
;1978:			*p++ = Q_COLOR_ESCAPE;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI1 94
ASGNI1
line 1979
;1979:			*p++ = lastcolor;
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 12
INDIRI4
CVII1 4
ASGNI1
line 1980
;1980:			len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1981
;1981:			ls = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 1982
;1982:		}
LABELV $1368
line 1984
;1983:
;1984:		if ( Q_IsColorString( str ) ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1378
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $1378
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1378
ADDRLP4 24
INDIRI4
CNSTI4 48
LTI4 $1378
ADDRLP4 24
INDIRI4
CNSTI4 57
GTI4 $1378
line 1985
;1985:			*p++ = *str++;
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI1
ASGNI1
line 1986
;1986:			lastcolor = *str;
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 1987
;1987:			*p++ = *str++;
ADDRLP4 40
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ASGNP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI1
ASGNI1
line 1988
;1988:			continue;
ADDRGP4 $1366
JUMPV
LABELV $1378
line 1990
;1989:		}
;1990:		if (*str == ' ') {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $1380
line 1991
;1991:			ls = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 1992
;1992:		}
LABELV $1380
line 1993
;1993:		*p++ = *str++;
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI1
ASGNI1
line 1994
;1994:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1995
;1995:	}
LABELV $1366
line 1959
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1365
line 1996
;1996:	*p = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1998
;1997:
;1998:	console->msgTimes[console->insertIdx % CONSOLE_MAXHEIGHT] = cg.time;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 3920
ADDP4
INDIRI4
CNSTI4 16
MODI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 3856
ADDP4
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1999
;1999:	console->insertIdx++;
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 3920
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2001
;2000:
;2001:}
LABELV $1364
endproc CG_AddToGenericConsole 52 0
proc CG_DrawHoldableItem 48 20
line 2008
;2002:
;2003:/*
;2004:===================
;2005:CG_DrawHoldableItem
;2006:===================
;2007:*/
;2008:static void CG_DrawHoldableItem( void ) { 
line 2016
;2009:	int		value;
;2010:	float	yoffset;
;2011:	float	xoffset;
;2012:	vec4_t	color;
;2013:	int		i;
;2014:
;2015:	//draw usable item
;2016:	value = GetHoldableListIndex(GetPlayerHoldable(cg.snap->ps.stats[STAT_HOLDABLE_ITEM]));
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 GetPlayerHoldable
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 GetHoldableListIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 2018
;2017:
;2018:	if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1385
line 2019
;2019:		CG_RegisterItemVisuals( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 2020
;2020:		CG_DrawPic( 640-ICON_SIZE+(cl_screenoffset.integer+1), 1, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 612
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 40
CNSTF4 1105199104
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2021
;2021:	}
LABELV $1385
line 2024
;2022:	
;2023:	//draw keys
;2024:	for ( i = 0; i < 4; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1389
line 2025
;2025:		color[i] = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $1390
line 2024
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $1389
line 2026
;2026:	trap_R_SetColor( color );		//must do this otherwise colors for key icons are distorted if health drops below 25 (see issue 132)
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2028
;2027:
;2028:	yoffset = ICON_SIZE;
ADDRLP4 24
CNSTF4 1105199104
ASGNF4
line 2029
;2029:	xoffset = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
line 2032
;2030:
;2031:	//red key
;2032:	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_RED) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1393
line 2033
;2033:		value = GetHoldableListIndex(HI_KEY_RED);
CNSTI4 7
ARGI4
ADDRLP4 40
ADDRGP4 GetHoldableListIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 2034
;2034:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1396
line 2035
;2035:			CG_RegisterItemVisuals( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 2036
;2036:			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRLP4 28
INDIRF4
CNSTF4 1142489088
ADDF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1122107392
ADDF4
ARGF4
ADDRLP4 44
CNSTF4 1105199104
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2037
;2037:			yoffset += ICON_SIZE;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1105199104
ADDF4
ASGNF4
line 2038
;2038:		}
LABELV $1396
line 2039
;2039:	}
LABELV $1393
line 2042
;2040:
;2041:	//green key
;2042:	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_GREEN) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1400
line 2043
;2043:		value = GetHoldableListIndex(HI_KEY_GREEN);
CNSTI4 8
ARGI4
ADDRLP4 40
ADDRGP4 GetHoldableListIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 2044
;2044:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1403
line 2045
;2045:			CG_RegisterItemVisuals( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 2046
;2046:			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRLP4 28
INDIRF4
CNSTF4 1142489088
ADDF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1122107392
ADDF4
ARGF4
ADDRLP4 44
CNSTF4 1105199104
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2047
;2047:			yoffset += ICON_SIZE;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1105199104
ADDF4
ASGNF4
line 2048
;2048:		}
LABELV $1403
line 2049
;2049:	}
LABELV $1400
line 2052
;2050:
;2051:	//blue key
;2052:	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_BLUE) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1407
line 2053
;2053:		value = GetHoldableListIndex(HI_KEY_BLUE);
CNSTI4 9
ARGI4
ADDRLP4 40
ADDRGP4 GetHoldableListIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 2054
;2054:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1410
line 2055
;2055:			CG_RegisterItemVisuals( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 2056
;2056:			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRLP4 28
INDIRF4
CNSTF4 1142489088
ADDF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1122107392
ADDF4
ARGF4
ADDRLP4 44
CNSTF4 1105199104
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2057
;2057:			yoffset += ICON_SIZE;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1105199104
ADDF4
ASGNF4
line 2058
;2058:		}
LABELV $1410
line 2059
;2059:	}
LABELV $1407
line 2062
;2060:	
;2061:	//yellow key
;2062:	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_YELLOW) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1414
line 2063
;2063:		value = GetHoldableListIndex(HI_KEY_YELLOW);
CNSTI4 10
ARGI4
ADDRLP4 40
ADDRGP4 GetHoldableListIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 2064
;2064:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1417
line 2065
;2065:			CG_RegisterItemVisuals( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 2066
;2066:			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRLP4 28
INDIRF4
CNSTF4 1142489088
ADDF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1122107392
ADDF4
ARGF4
ADDRLP4 44
CNSTF4 1105199104
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2067
;2067:			yoffset += ICON_SIZE;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1105199104
ADDF4
ASGNF4
line 2068
;2068:		}
LABELV $1417
line 2069
;2069:	}
LABELV $1414
line 2072
;2070:
;2071:	//master key
;2072:	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_MASTER) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1421
line 2073
;2073:		value = GetHoldableListIndex(HI_KEY_MASTER);
CNSTI4 11
ARGI4
ADDRLP4 40
ADDRGP4 GetHoldableListIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 2074
;2074:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1424
line 2075
;2075:			CG_RegisterItemVisuals( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 2076
;2076:			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRLP4 28
INDIRF4
CNSTF4 1142489088
ADDF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1122107392
ADDF4
ARGF4
ADDRLP4 44
CNSTF4 1105199104
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2077
;2077:			yoffset += ICON_SIZE;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1105199104
ADDF4
ASGNF4
line 2078
;2078:		}
LABELV $1424
line 2079
;2079:	}
LABELV $1421
line 2082
;2080:
;2081:	//gold key
;2082:	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_GOLD) ) {		
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1428
line 2083
;2083:		value = GetHoldableListIndex(HI_KEY_GOLD);
CNSTI4 12
ARGI4
ADDRLP4 40
ADDRGP4 GetHoldableListIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 2084
;2084:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1431
line 2085
;2085:			CG_RegisterItemVisuals( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 2086
;2086:			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRLP4 28
INDIRF4
CNSTF4 1142489088
ADDF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1122107392
ADDF4
ARGF4
ADDRLP4 44
CNSTF4 1105199104
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2087
;2087:			yoffset += ICON_SIZE;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1105199104
ADDF4
ASGNF4
line 2088
;2088:		}
LABELV $1431
line 2089
;2089:	}
LABELV $1428
line 2092
;2090:
;2091:	//silver key
;2092:	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_SILVER) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1435
line 2093
;2093:		value = GetHoldableListIndex(HI_KEY_SILVER);
CNSTI4 13
ARGI4
ADDRLP4 40
ADDRGP4 GetHoldableListIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 2094
;2094:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1438
line 2095
;2095:			CG_RegisterItemVisuals( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 2096
;2096:			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRLP4 28
INDIRF4
CNSTF4 1142489088
ADDF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1122107392
ADDF4
ARGF4
ADDRLP4 44
CNSTF4 1105199104
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2097
;2097:			yoffset += ICON_SIZE;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1105199104
ADDF4
ASGNF4
line 2098
;2098:		}
LABELV $1438
line 2099
;2099:	}
LABELV $1435
line 2102
;2100:
;2101:	//iron key
;2102:	if (cg.snap->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KEY_IRON) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1442
line 2103
;2103:		value = GetHoldableListIndex(HI_KEY_IRON);
CNSTI4 14
ARGI4
ADDRLP4 40
ADDRGP4 GetHoldableListIndex
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 2104
;2104:		if ( value ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1445
line 2105
;2105:			CG_RegisterItemVisuals( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 2106
;2106:			CG_DrawPic( 640-ICON_SIZE+xoffset+(cl_screenoffset.integer+1), ((SCREEN_HEIGHT-ICON_SIZE)/4)+yoffset, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRLP4 28
INDIRF4
CNSTF4 1142489088
ADDF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1122107392
ADDF4
ARGF4
ADDRLP4 44
CNSTF4 1105199104
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2107
;2107:			yoffset += ICON_SIZE;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1105199104
ADDF4
ASGNF4
line 2108
;2108:		}
LABELV $1445
line 2109
;2109:	}
LABELV $1442
line 2111
;2110:
;2111:}
LABELV $1383
endproc CG_DrawHoldableItem 48 20
proc CG_DrawObjectivesNotification 8 20
line 2113
;2112:
;2113:static void CG_DrawObjectivesNotification( void ) {
line 2114
;2114:	qboolean draw = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2116
;2115:	
;2116:	if ( !cg_draw2D.integer )
ADDRGP4 cg_draw2D+12
INDIRI4
CNSTI4 0
NEI4 $1450
line 2117
;2117:		return;
ADDRGP4 $1449
JUMPV
LABELV $1450
line 2119
;2118:
;2119:	if ( cg.objectivesTime == 0 || cg.time < cg.objectivesTime )
ADDRGP4 cg+1987484
INDIRI4
CNSTI4 0
EQI4 $1458
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1987484
INDIRI4
GEI4 $1453
LABELV $1458
line 2120
;2120:		return;
ADDRGP4 $1449
JUMPV
LABELV $1453
line 2123
;2121:
;2122:	//icon blinks
;2123:	if ( cg.time < cg.objectivesTime + 500 )
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1987484
INDIRI4
CNSTI4 500
ADDI4
GEI4 $1459
line 2124
;2124:		draw = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1460
JUMPV
LABELV $1459
line 2125
;2125:	else if ( cg.time > cg.objectivesTime + 1000 && cg.time < cg.objectivesTime + 1500 )
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1987484
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $1463
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1987484
INDIRI4
CNSTI4 1500
ADDI4
GEI4 $1463
line 2126
;2126:		draw = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1464
JUMPV
LABELV $1463
line 2127
;2127:	else if ( cg.time > cg.objectivesTime + 2000 && cg.time < cg.objectivesTime + 2500 )
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1987484
INDIRI4
CNSTI4 2000
ADDI4
LEI4 $1469
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1987484
INDIRI4
CNSTI4 2500
ADDI4
GEI4 $1469
line 2128
;2128:		draw = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1469
LABELV $1464
LABELV $1460
line 2130
;2129:
;2130:	if ( draw )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1475
line 2131
;2131:	{
line 2132
;2132:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2133
;2133:		CG_DrawPic( 8-cl_screenoffset.integer, 8, ICON_SIZE, ICON_SIZE, cgs.media.objectivesUpdated );
CNSTI4 8
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1090519040
ARGF4
ADDRLP4 4
CNSTF4 1105199104
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 cgs+956380+1768
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2134
;2134:	}
LABELV $1475
line 2135
;2135:}
LABELV $1449
endproc CG_DrawObjectivesNotification 8 20
proc CG_DrawPersistantPowerup 8 20
line 2141
;2136:/*
;2137:===================
;2138:CG_DrawPersistantPowerup
;2139:===================
;2140:*/
;2141:static void CG_DrawPersistantPowerup( void ) {
line 2144
;2142:	int		value;
;2143:
;2144:	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 2145
;2145:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1482
line 2146
;2146:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 2147
;2147:		CG_DrawPic( 0 - cl_screenoffset.integer, (0+SCREEN_HEIGHT / 2) - ICON_SIZE, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1129578496
ARGF4
ADDRLP4 4
CNSTF4 1105199104
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2148
;2148:	}
LABELV $1482
line 2149
;2149:}
LABELV $1480
endproc CG_DrawPersistantPowerup 8 20
export CG_AddLagometerFrameInfo
proc CG_AddLagometerFrameInfo 8 0
line 2179
;2150:
;2151:/*
;2152:===============================================================================
;2153:
;2154:LAGOMETER
;2155:
;2156:===============================================================================
;2157:*/
;2158:
;2159:#define	LAG_SAMPLES		128
;2160:
;2161:
;2162:typedef struct {
;2163:	int		frameSamples[LAG_SAMPLES];
;2164:	int		frameCount;
;2165:	int		snapshotFlags[LAG_SAMPLES];
;2166:	int		snapshotSamples[LAG_SAMPLES];
;2167:	int		snapshotCount;
;2168:} lagometer_t;
;2169:
;2170:lagometer_t		lagometer;
;2171:
;2172:/*
;2173:==============
;2174:CG_AddLagometerFrameInfo
;2175:
;2176:Adds the current interpolate / extrapolate bar for this frame
;2177:==============
;2178:*/
;2179:void CG_AddLagometerFrameInfo( void ) {
line 2182
;2180:	int			offset;
;2181:
;2182:	offset = cg.time - cg.latestSnapshotTime;
ADDRLP4 0
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+32
INDIRI4
SUBI4
ASGNI4
line 2183
;2183:	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2184
;2184:	lagometer.frameCount++;
ADDRLP4 4
ADDRGP4 lagometer+512
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2185
;2185:}
LABELV $1487
endproc CG_AddLagometerFrameInfo 8 0
export CG_AddLagometerSnapshotInfo
proc CG_AddLagometerSnapshotInfo 4 0
line 2197
;2186:
;2187:/*
;2188:==============
;2189:CG_AddLagometerSnapshotInfo
;2190:
;2191:Each time a snapshot is received, log its ping time and
;2192:the number of snapshots that were dropped before it.
;2193:
;2194:Pass NULL for a dropped packet.
;2195:==============
;2196:*/
;2197:void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
line 2199
;2198:	// dropped packet
;2199:	if ( !snap ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1493
line 2200
;2200:		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
CNSTI4 -1
ASGNI4
line 2201
;2201:		lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2202
;2202:		return;
ADDRGP4 $1492
JUMPV
LABELV $1493
line 2206
;2203:	}
;2204:
;2205:	// add this snapshot's info
;2206:	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2207
;2207:	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2208
;2208:	lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2209
;2209:}
LABELV $1492
endproc CG_AddLagometerSnapshotInfo 4 0
proc CG_DrawDisconnect 60 20
line 2218
;2210:
;2211:/*
;2212:==============
;2213:CG_DrawDisconnect
;2214:
;2215:Should we draw something differnet for long lag vs no packets?
;2216:==============
;2217:*/
;2218:static void CG_DrawDisconnect( void ) {
line 2226
;2219:	float		x, y;
;2220:	int			cmdNum;
;2221:	usercmd_t	cmd;
;2222:	const char		*s;
;2223:	int			w;  // bk010215 - FIXME char message[1024];
;2224:
;2225:	// draw the phone jack if we are completely past our buffers
;2226:	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
ADDRLP4 44
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 44
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 2227
;2227:	trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 2228
;2228:	if ( cmd.serverTime <= cg.snap->ps.commandTime
ADDRLP4 48
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $1508
ADDRLP4 48
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
LEI4 $1504
LABELV $1508
line 2229
;2229:		|| cmd.serverTime > cg.time ) {	// special check for map_restart // bk 0102165 - FIXME
line 2230
;2230:		return;
ADDRGP4 $1503
JUMPV
LABELV $1504
line 2234
;2231:	}
;2232:
;2233:	// blink the icon
;2234:	if ( ( cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1509
line 2235
;2235:		return;
ADDRGP4 $1503
JUMPV
LABELV $1509
line 2238
;2236:	}
;2237:
;2238:	x = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2239
;2239:	y = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
line 2241
;2240:
;2241:	CG_DrawPic( x-cl_screenoffset.integer, y, 16, 16, trap_R_RegisterShader("gfx/2d/net.tga" ) );
ADDRGP4 $1513
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 24
INDIRF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 56
CNSTF4 1098907648
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2242
;2242:}
LABELV $1503
endproc CG_DrawDisconnect 60 20
proc CG_DrawLagometer 68 36
line 2253
;2243:
;2244:
;2245:#define	MAX_LAGOMETER_PING	900
;2246:#define	MAX_LAGOMETER_RANGE	300
;2247:
;2248:/*
;2249:==============
;2250:CG_DrawLagometer
;2251:==============
;2252:*/
;2253:static void CG_DrawLagometer( void ) {
line 2260
;2254:	int		a, x, y, i;
;2255:	float	v;
;2256:	float	ax, ay, aw, ah, mid, range;
;2257:	int		color;
;2258:	float	vscale;
;2259:
;2260:	if ( !cg_lagometer.integer || cgs.localServer ) {
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRGP4 cg_lagometer+12
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $1519
ADDRGP4 cgs+339036
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $1515
LABELV $1519
line 2261
;2261:		CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 2262
;2262:		return;
ADDRGP4 $1514
JUMPV
LABELV $1515
line 2269
;2263:	}
;2264:
;2265:	//
;2266:	// draw the graph
;2267:	//
;2268:#ifdef MISSIONPACK
;2269:	x = 640 - 48;
ADDRLP4 44
CNSTI4 592
ASGNI4
line 2270
;2270:	y = 480 - 144;
ADDRLP4 48
CNSTI4 336
ASGNI4
line 2276
;2271:#else
;2272:	x = 640 - 48;
;2273:	y = 480 - 48;
;2274:#endif
;2275:
;2276:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2277
;2277:	CG_DrawPic( x + cl_screenoffset.integer, y, 48, 48, cgs.media.lagometerShader );
ADDRLP4 44
INDIRI4
ADDRGP4 cl_screenoffset+12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 48
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 56
CNSTF4 1111490560
ASGNF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRGP4 cgs+956380+1260
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 2279
;2278:
;2279:	ax = x + cl_screenoffset.integer;
ADDRLP4 24
ADDRLP4 44
INDIRI4
ADDRGP4 cl_screenoffset+12
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 2280
;2280:	ay = y;
ADDRLP4 36
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 2281
;2281:	aw = 48;
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
line 2282
;2282:	ah = 48;
ADDRLP4 32
CNSTF4 1111490560
ASGNF4
line 2283
;2283:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 2285
;2284:
;2285:	color = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 2286
;2286:	range = ah / 3;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 2287
;2287:	mid = ay + range;
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 2289
;2288:
;2289:	vscale = range / MAX_LAGOMETER_RANGE;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 1133903872
DIVF4
ASGNF4
line 2292
;2290:
;2291:	// draw the frame interpoalte / extrapolate graph
;2292:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1527
JUMPV
LABELV $1524
line 2293
;2293:		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 2294
;2294:		v = lagometer.frameSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2295
;2295:		v *= vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 2296
;2296:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1529
line 2297
;2297:			if ( color != 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $1531
line 2298
;2298:				color = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 2299
;2299:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2300
;2300:			}
LABELV $1531
line 2301
;2301:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $1534
line 2302
;2302:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 2303
;2303:			}
LABELV $1534
line 2304
;2304:			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 cgs+956380+20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2305
;2305:		} else if ( v < 0 ) {
ADDRGP4 $1530
JUMPV
LABELV $1529
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $1538
line 2306
;2306:			if ( color != 2 ) {
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $1540
line 2307
;2307:				color = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 2308
;2308:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
ADDRGP4 g_color_table+64
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2309
;2309:			}
LABELV $1540
line 2310
;2310:			v = -v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
line 2311
;2311:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $1543
line 2312
;2312:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 2313
;2313:			}
LABELV $1543
line 2314
;2314:			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 cgs+956380+20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2315
;2315:		}
LABELV $1538
LABELV $1530
line 2316
;2316:	}
LABELV $1525
line 2292
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1527
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $1524
line 2319
;2317:
;2318:	// draw the snapshot latency / drop graph
;2319:	range = ah / 2;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2320
;2320:	vscale = range / MAX_LAGOMETER_PING;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 1147207680
DIVF4
ASGNF4
line 2322
;2321:
;2322:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1550
JUMPV
LABELV $1547
line 2323
;2323:		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 2324
;2324:		v = lagometer.snapshotSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2325
;2325:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1553
line 2326
;2326:			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1555
line 2327
;2327:				if ( color != 5 ) {
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $1556
line 2328
;2328:					color = 5;	// YELLOW for rate delay
ADDRLP4 20
CNSTI4 5
ASGNI4
line 2329
;2329:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2330
;2330:				}
line 2331
;2331:			} else {
ADDRGP4 $1556
JUMPV
LABELV $1555
line 2332
;2332:				if ( color != 3 ) {
ADDRLP4 20
INDIRI4
CNSTI4 3
EQI4 $1561
line 2333
;2333:					color = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 2334
;2334:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
ADDRGP4 g_color_table+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2335
;2335:				}
LABELV $1561
line 2336
;2336:			}
LABELV $1556
line 2337
;2337:			v = v * vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 2338
;2338:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $1564
line 2339
;2339:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 2340
;2340:			}
LABELV $1564
line 2341
;2341:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 cgs+956380+20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2342
;2342:		} else if ( v < 0 ) {
ADDRGP4 $1554
JUMPV
LABELV $1553
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $1568
line 2343
;2343:			if ( color != 4 ) {
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $1570
line 2344
;2344:				color = 4;		// RED for dropped snapshots
ADDRLP4 20
CNSTI4 4
ASGNI4
line 2345
;2345:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
ADDRGP4 g_color_table+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2346
;2346:			}
LABELV $1570
line 2347
;2347:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 64
CNSTF4 0
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 cgs+956380+20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2348
;2348:		}
LABELV $1568
LABELV $1554
line 2349
;2349:	}
LABELV $1548
line 2322
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1550
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $1547
line 2351
;2350:
;2351:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2353
;2352:
;2353:	if ( cg_nopredict.integer || cg_synchronousClients.integer ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $1579
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1575
LABELV $1579
line 2354
;2354:		CG_DrawBigString( ax, ay, "snc", 1.0 );
ADDRLP4 24
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 $1580
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2355
;2355:	}
LABELV $1575
line 2357
;2356:
;2357:	CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 2358
;2358:}
LABELV $1514
endproc CG_DrawLagometer 68 36
export CG_CenterPrint
proc CG_CenterPrint 12 12
line 2379
;2359:
;2360:
;2361:
;2362:/*
;2363:===============================================================================
;2364:
;2365:CENTER PRINTING
;2366:
;2367:===============================================================================
;2368:*/
;2369:
;2370:
;2371:/*
;2372:==============
;2373:CG_CenterPrint
;2374:
;2375:Called for important messages that should stay in the center of the screen
;2376:for a few moments
;2377:==============
;2378:*/
;2379:void CG_CenterPrint( const char *str, int y, int charWidth ) {
line 2382
;2380:	char	*s;
;2381:
;2382:	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );
ADDRGP4 cg+1952152
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2383
;2383:	cg.centerPrintRuLine = 0;
ADDRGP4 cg+1952668
CNSTI4 0
ASGNI4
line 2384
;2384:	cg.centerPrintTimeC = CG_DrawStrlen( cg.centerPrint ) / 10;
ADDRGP4 cg+1952152
ARGP4
ADDRLP4 4
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRGP4 cg+1952672
ADDRLP4 4
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 2385
;2385:	cg.centerPrintTime = cg.time;
ADDRGP4 cg+1952140
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 2386
;2386:	cg.centerPrintY = y;
ADDRGP4 cg+1952148
ADDRFP4 4
INDIRI4
ASGNI4
line 2387
;2387:	cg.centerPrintCharWidth = charWidth;
ADDRGP4 cg+1952144
ADDRFP4 8
INDIRI4
ASGNI4
line 2390
;2388:
;2389:	// count the number of lines for centering
;2390:	cg.centerPrintLines = 1;
ADDRGP4 cg+1952664
CNSTI4 1
ASGNI4
line 2391
;2391:	s = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+1952152
ASGNP4
ADDRGP4 $1594
JUMPV
LABELV $1593
line 2392
;2392:	while( *s ) {
line 2393
;2393:		if (*s == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $1596
line 2394
;2394:			cg.centerPrintLines++;
ADDRLP4 8
ADDRGP4 cg+1952664
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1596
line 2395
;2395:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2396
;2396:	}
LABELV $1594
line 2392
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1593
line 2397
;2397:}
LABELV $1581
endproc CG_CenterPrint 12 12
export CG_CenterPrintRus
proc CG_CenterPrintRus 12 12
line 2399
;2398:
;2399:void CG_CenterPrintRus( const char *str, int y, int charWidth ) {
line 2402
;2400:	char	*s;
;2401:
;2402:	Q_strncpyz( cg.centerPrintRus, str, sizeof(cg.centerPrintRus) );
ADDRGP4 cg+1952408
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2403
;2403:	cg.centerPrintRuLine = 1;
ADDRGP4 cg+1952668
CNSTI4 1
ASGNI4
line 2404
;2404:	cg.centerPrintTimeC = CG_DrawStrlen( cg.centerPrintRus ) / 10;	
ADDRGP4 cg+1952408
ARGP4
ADDRLP4 4
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRGP4 cg+1952672
ADDRLP4 4
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 2405
;2405:	cg.centerPrintTime = cg.time;
ADDRGP4 cg+1952140
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 2406
;2406:	cg.centerPrintY = y;
ADDRGP4 cg+1952148
ADDRFP4 4
INDIRI4
ASGNI4
line 2407
;2407:	cg.centerPrintCharWidth = charWidth;
ADDRGP4 cg+1952144
ADDRFP4 8
INDIRI4
ASGNI4
line 2410
;2408:
;2409:	// count the number of lines for centering
;2410:	cg.centerPrintLines = 1;
ADDRGP4 cg+1952664
CNSTI4 1
ASGNI4
line 2411
;2411:	s = cg.centerPrintRus;
ADDRLP4 0
ADDRGP4 cg+1952408
ASGNP4
ADDRGP4 $1612
JUMPV
LABELV $1611
line 2412
;2412:	while( *s ) {
line 2413
;2413:		if (*s == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $1614
line 2414
;2414:			cg.centerPrintLines++;
ADDRLP4 8
ADDRGP4 cg+1952664
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1614
line 2415
;2415:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2416
;2416:	}
LABELV $1612
line 2412
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1611
line 2417
;2417:}
LABELV $1599
endproc CG_CenterPrintRus 12 12
proc CG_DrawCenterString 1056 36
line 2425
;2418:
;2419:
;2420:/*
;2421:===================
;2422:CG_DrawCenterString
;2423:===================
;2424:*/
;2425:static void CG_DrawCenterString( void ) {
line 2434
;2426:	char	*start;
;2427:	int		l;
;2428:	int		x, y, w;
;2429:#ifndef MISSIONPACK // bk010221 - unused else
;2430:  int h;
;2431:#endif
;2432:	float	*color;
;2433:
;2434:	if ( !cg.centerPrintTime ) {
ADDRGP4 cg+1952140
INDIRI4
CNSTI4 0
NEI4 $1618
line 2435
;2435:		return;
ADDRGP4 $1617
JUMPV
LABELV $1618
line 2438
;2436:	}
;2437:
;2438:	if(cg.centerPrintTimeC >= 1){
ADDRGP4 cg+1952672
INDIRI4
CNSTI4 1
LTI4 $1621
line 2439
;2439:	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg.centerPrintTimeC );
ADDRGP4 cg+1952140
INDIRI4
ARGI4
CNSTI4 1000
ADDRGP4 cg+1952672
INDIRI4
MULI4
ARGI4
ADDRLP4 24
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
ASGNP4
line 2440
;2440:	} else {
ADDRGP4 $1622
JUMPV
LABELV $1621
line 2441
;2441:	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );	
ADDRGP4 cg+1952140
INDIRI4
ARGI4
CNSTF4 1148846080
ADDRGP4 cg_centertime+8
INDIRF4
MULF4
CVFI4 4
ARGI4
ADDRLP4 24
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
ASGNP4
line 2442
;2442:	}
LABELV $1622
line 2443
;2443:	if ( !color ) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1628
line 2444
;2444:		return;
ADDRGP4 $1617
JUMPV
LABELV $1628
line 2447
;2445:	}
;2446:
;2447:	trap_R_SetColor( color );
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2449
;2448:
;2449:	start = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+1952152
ASGNP4
line 2451
;2450:
;2451:	if(cg.centerPrintRuLine == 1){
ADDRGP4 cg+1952668
INDIRI4
CNSTI4 1
NEI4 $1631
line 2452
;2452:	start = cg.centerPrintRus;	
ADDRLP4 0
ADDRGP4 cg+1952408
ASGNP4
line 2453
;2453:	}
LABELV $1631
line 2455
;2454:
;2455:	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;
ADDRLP4 8
ADDRGP4 cg+1952148
INDIRI4
ADDRGP4 cg+1952664
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
ADDRGP4 $1639
JUMPV
LABELV $1638
line 2457
;2456:
;2457:	while ( 1 ) {
line 2460
;2458:		char linebuffer[1024];
;2459:
;2460:		for ( l = 0; l < 1024; l++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1641
line 2461
;2461:			if ( !start[l] || start[l] == '\n' ) {
ADDRLP4 1048
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $1647
ADDRLP4 1048
INDIRI4
CNSTI4 10
NEI4 $1645
LABELV $1647
line 2462
;2462:				break;
ADDRGP4 $1643
JUMPV
LABELV $1645
line 2464
;2463:			}
;2464:			linebuffer[l] = start[l];
ADDRLP4 4
INDIRI4
ADDRLP4 24
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 2465
;2465:		}
LABELV $1642
line 2460
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $1641
LABELV $1643
line 2466
;2466:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 24
ADDP4
CNSTI1 0
ASGNI1
line 2475
;2467:
;2468:#ifndef MISSIONPACK
;2469:		w = CG_Text_Width(linebuffer, 0.5, 0);
;2470:		h = CG_Text_Height(linebuffer, 0.5, 0);
;2471:		x = (SCREEN_WIDTH - w) / 2;
;2472:		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2473:		y += h + 6;
;2474:#else
;2475:		w = cg.centerPrintCharWidth * CG_DrawStrlen( linebuffer );
ADDRLP4 24
ARGP4
ADDRLP4 1048
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRGP4 cg+1952144
INDIRI4
ADDRLP4 1048
INDIRI4
MULI4
ASGNI4
line 2477
;2476:
;2477:		x = ( SCREEN_WIDTH - w ) / 2;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 2479
;2478:
;2479:		if(cg.centerPrintRuLine == 0){
ADDRGP4 cg+1952668
INDIRI4
CNSTI4 0
NEI4 $1649
line 2480
;2480:		CG_DrawStringExt( x, y, linebuffer, color, qfalse, qtrue, cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cg+1952144
INDIRI4
ARGI4
CNSTF4 1069547520
ADDRGP4 cg+1952144
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 2481
;2481:		}
LABELV $1649
line 2482
;2482:		if(cg.centerPrintRuLine == 1){
ADDRGP4 cg+1952668
INDIRI4
CNSTI4 1
NEI4 $1654
line 2483
;2483:		CG_DrawStringExtRus( x, y, linebuffer, color, qfalse, qtrue, cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cg+1952144
INDIRI4
ARGI4
CNSTF4 1069547520
ADDRGP4 cg+1952144
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExtRus
CALLI4
pop
line 2484
;2484:		}
LABELV $1654
line 2486
;2485:
;2486:		y += cg.centerPrintCharWidth * 1.5;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1069547520
ADDRGP4 cg+1952144
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRGP4 $1661
JUMPV
LABELV $1660
line 2488
;2487:#endif
;2488:		while ( *start && ( *start != '\n' ) ) {
line 2489
;2489:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2490
;2490:		}
LABELV $1661
line 2488
ADDRLP4 1052
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $1663
ADDRLP4 1052
INDIRI4
CNSTI4 10
NEI4 $1660
LABELV $1663
line 2491
;2491:		if ( !*start ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1664
line 2492
;2492:			break;
ADDRGP4 $1640
JUMPV
LABELV $1664
line 2494
;2493:		}
;2494:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2495
;2495:	}
LABELV $1639
line 2457
ADDRGP4 $1638
JUMPV
LABELV $1640
line 2497
;2496:
;2497:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2498
;2498:}
LABELV $1617
endproc CG_DrawCenterString 1056 36
proc CG_DrawCenter1FctfString 36 36
line 2505
;2499:
;2500:/*
;2501:=====================
;2502:CG_DrawCenter1FctfString
;2503:=====================
;2504:*/
;2505:static void CG_DrawCenter1FctfString( void ) {
line 2511
;2506:    int		x, y, w;
;2507:    float       *color;
;2508:    char        *line;
;2509:    int status;
;2510:
;2511:    if(cgs.gametype != GT_1FCTF)
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
EQI4 $1667
line 2512
;2512:        return;
ADDRGP4 $1666
JUMPV
LABELV $1667
line 2514
;2513:
;2514:    status = cgs.flagStatus;
ADDRLP4 4
ADDRGP4 cgs+342632
INDIRI4
ASGNI4
line 2517
;2515:
;2516:    //Sago: TODO: Find the proper defines instead of hardcoded values.
;2517:    switch(status)
ADDRLP4 24
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 2
EQI4 $1673
ADDRLP4 24
INDIRI4
CNSTI4 3
EQI4 $1682
ADDRLP4 24
INDIRI4
CNSTI4 4
EQI4 $1691
ADDRGP4 $1666
JUMPV
line 2518
;2518:    {
LABELV $1673
line 2520
;2519:        case 2:
;2520:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1674
line 2521
;2521:            line = va("Red has the flag!");
ADDRGP4 $1677
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2522
;2522:		}
LABELV $1674
line 2523
;2523:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1678
line 2524
;2524:            line = va("Красные взяли флаг!");
ADDRGP4 $1681
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2525
;2525:		}
LABELV $1678
line 2526
;2526:            color = colorRed;
ADDRLP4 20
ADDRGP4 colorRed
ASGNP4
line 2527
;2527:            break;
ADDRGP4 $1672
JUMPV
LABELV $1682
line 2529
;2528:        case 3:
;2529:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1683
line 2530
;2530:            line = va("Blue has the flag!");
ADDRGP4 $1686
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2531
;2531:		}
LABELV $1683
line 2532
;2532:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1687
line 2533
;2533:            line = va("Синие взяли флаг!");
ADDRGP4 $1690
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2534
;2534:		}
LABELV $1687
line 2535
;2535:            color = colorBlue;
ADDRLP4 20
ADDRGP4 colorBlue
ASGNP4
line 2536
;2536:            break;
ADDRGP4 $1672
JUMPV
LABELV $1691
line 2538
;2537:        case 4:
;2538:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1692
line 2539
;2539:            line = va("Flag dropped!");
ADDRGP4 $1695
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2540
;2540:		}
LABELV $1692
line 2541
;2541:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1696
line 2542
;2542:			line = va("Флаг потерян!");
ADDRGP4 $1699
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2543
;2543:		}
LABELV $1696
line 2544
;2544:            color = colorWhite;
ADDRLP4 20
ADDRGP4 colorWhite
ASGNP4
line 2545
;2545:            break;
line 2547
;2546:        default:
;2547:            return;
LABELV $1672
line 2549
;2548:
;2549:    };
line 2550
;2550:    y = 100;
ADDRLP4 12
CNSTI4 100
ASGNI4
line 2553
;2551:
;2552:
;2553:    w = cg.centerPrintCharWidth * CG_DrawStrlen( line );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRGP4 cg+1952144
INDIRI4
ADDRLP4 28
INDIRI4
MULI4
ASGNI4
line 2555
;2554:
;2555:    x = ( SCREEN_WIDTH - w ) / 2;
ADDRLP4 8
CNSTI4 640
ADDRLP4 16
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 2557
;2556:
;2557:    CG_DrawStringExt( x, y, line, color, qfalse, qtrue,
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cg+1952144
INDIRI4
ARGI4
CNSTF4 1069547520
ADDRGP4 cg+1952144
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 2559
;2558:		cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
;2559:}
LABELV $1666
endproc CG_DrawCenter1FctfString 36 36
data
align 4
LABELV $1704
byte 4 -100
code
proc CG_DrawCenterDDString 48 36
line 2568
;2560:
;2561:
;2562:
;2563:/*
;2564:=====================
;2565:CG_DrawCenterDDString
;2566:=====================
;2567:*/
;2568:static void CG_DrawCenterDDString( void ) {
line 2577
;2569:    int		x, y, w;
;2570:    float       *color;
;2571:    char        *line;
;2572:    int 		statusA, statusB;
;2573:    int sec;
;2574:    static int lastDDSec = -100;
;2575:
;2576:
;2577:    if(cgs.gametype != GT_DOUBLE_D)
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 12
EQI4 $1705
line 2578
;2578:        return;
ADDRGP4 $1703
JUMPV
LABELV $1705
line 2580
;2579:
;2580:    	statusA = cgs.redflag;
ADDRLP4 0
ADDRGP4 cgs+342624
INDIRI4
ASGNI4
line 2581
;2581:	statusB = cgs.blueflag;
ADDRLP4 8
ADDRGP4 cgs+342628
INDIRI4
ASGNI4
line 2583
;2582:
;2583:    if( ( ( statusB == statusA ) && ( statusA == TEAM_RED ) ) ||
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1713
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1712
LABELV $1713
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1703
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $1703
LABELV $1712
line 2584
;2584:            ( ( statusB == statusA ) && ( statusA == TEAM_BLUE ) ) ) {
line 2585
;2585:      }
line 2587
;2586:    else
;2587:        return; //No team is dominating
LABELV $1711
line 2589
;2588:
;2589:    if(statusA == TEAM_BLUE) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $1714
line 2590
;2590:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1716
line 2591
;2591:        line = va("Blue scores in %i",(cgs.timetaken+10*1000-cg.time)/1000+1);
ADDRGP4 $1719
ARGP4
ADDRGP4 cgs+342416
INDIRI4
CNSTI4 10000
ADDI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
ASGNP4
line 2592
;2592:	}
LABELV $1716
line 2593
;2593:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1722
line 2594
;2594:        line = va("Синие победят через %i",(cgs.timetaken+10*1000-cg.time)/1000+1);
ADDRGP4 $1725
ARGP4
ADDRGP4 cgs+342416
INDIRI4
CNSTI4 10000
ADDI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
ASGNP4
line 2595
;2595:	}
LABELV $1722
line 2596
;2596:        color = colorBlue;
ADDRLP4 28
ADDRGP4 colorBlue
ASGNP4
line 2597
;2597:    } else if(statusA == TEAM_RED) {
ADDRGP4 $1715
JUMPV
LABELV $1714
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $1728
line 2598
;2598:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1730
line 2599
;2599:        line = va("Red scores in %i",(cgs.timetaken+10*1000-cg.time)/1000+1);
ADDRGP4 $1733
ARGP4
ADDRGP4 cgs+342416
INDIRI4
CNSTI4 10000
ADDI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
ASGNP4
line 2600
;2600:	}
LABELV $1730
line 2601
;2601:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1736
line 2602
;2602:        line = va("Красные победят через %i",(cgs.timetaken+10*1000-cg.time)/1000+1);
ADDRGP4 $1739
ARGP4
ADDRGP4 cgs+342416
INDIRI4
CNSTI4 10000
ADDI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
ASGNP4
line 2603
;2603:	}
LABELV $1736
line 2604
;2604:        color = colorRed;
ADDRLP4 28
ADDRGP4 colorRed
ASGNP4
line 2605
;2605:    } else {
ADDRGP4 $1729
JUMPV
LABELV $1728
line 2606
;2606:        lastDDSec = -100;
ADDRGP4 $1704
CNSTI4 -100
ASGNI4
line 2607
;2607:        return;
ADDRGP4 $1703
JUMPV
LABELV $1729
LABELV $1715
line 2610
;2608:    }
;2609:
;2610:    sec = (cgs.timetaken+10*1000-cg.time)/1000+1;
ADDRLP4 4
ADDRGP4 cgs+342416
INDIRI4
CNSTI4 10000
ADDI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 1
ADDI4
ASGNI4
line 2611
;2611:    if(sec!=lastDDSec) {
ADDRLP4 4
INDIRI4
ADDRGP4 $1704
INDIRI4
EQI4 $1744
line 2613
;2612:        //A new number is being displayed... play the sound!
;2613:        switch ( sec ) {
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $1748
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $1751
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $1754
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $1747
LABELV $1760
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $1757
ADDRGP4 $1747
JUMPV
LABELV $1748
line 2615
;2614:            case 1:
;2615:                trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+956380+2424
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2616
;2616:                break;
ADDRGP4 $1747
JUMPV
LABELV $1751
line 2618
;2617:            case 2:
;2618:                trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+956380+2420
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2619
;2619:                break;
ADDRGP4 $1747
JUMPV
LABELV $1754
line 2621
;2620:            case 3:
;2621:                trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+956380+2416
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2622
;2622:                break;
ADDRGP4 $1747
JUMPV
LABELV $1757
line 2624
;2623:            case 10:
;2624:                trap_S_StartLocalSound( cgs.media.doublerSound , CHAN_ANNOUNCER );
ADDRGP4 cgs+956380+2492
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2625
;2625:                break;
line 2627
;2626:            default:
;2627:                break;
LABELV $1747
line 2629
;2628:        }
;2629:    }
LABELV $1744
line 2630
;2630:    lastDDSec = sec;
ADDRGP4 $1704
ADDRLP4 4
INDIRI4
ASGNI4
line 2632
;2631:
;2632:    y = 100;
ADDRLP4 20
CNSTI4 100
ASGNI4
line 2635
;2633:
;2634:
;2635:    w = cg.centerPrintCharWidth * CG_DrawStrlen( line );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRGP4 cg+1952144
INDIRI4
ADDRLP4 40
INDIRI4
MULI4
ASGNI4
line 2637
;2636:
;2637:    x = ( SCREEN_WIDTH - w ) / 2;
ADDRLP4 16
CNSTI4 640
ADDRLP4 24
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 2639
;2638:
;2639:    CG_DrawStringExt( x, y, line, color, qfalse, qtrue,
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cg+1952144
INDIRI4
ARGI4
CNSTF4 1069547520
ADDRGP4 cg+1952144
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 2641
;2640:		cg.centerPrintCharWidth, (int)(cg.centerPrintCharWidth * 1.5), 0 );
;2641:}
LABELV $1703
endproc CG_DrawCenterDDString 48 36
proc CG_DrawCrosshair 108 36
line 2659
;2642:
;2643:
;2644:/*
;2645:================================================================================
;2646:
;2647:CROSSHAIR
;2648:
;2649:================================================================================
;2650:*/
;2651:
;2652:
;2653:/*
;2654:=================
;2655:CG_DrawCrosshair
;2656:=================
;2657:*/
;2658:static void CG_DrawCrosshair(void)
;2659:{
line 2664
;2660:	float		w, h;
;2661:	qhandle_t	hShader;
;2662:	float		f;
;2663:	float		x, y;
;2664:	int			ca = 0; //only to get rid of the warning(not useful)
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2668
;2665:	int 		currentWeapon;
;2666:	vec4_t         color;
;2667:
;2668:	currentWeapon = cg.predictedPlayerState.weapon;
ADDRLP4 44
ADDRGP4 cg+1868928+144
INDIRI4
ASGNI4
line 2670
;2669:
;2670:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $1767
line 2671
;2671:		return;
ADDRGP4 $1764
JUMPV
LABELV $1767
line 2674
;2672:	}
;2673:	
;2674:	if( cg.renderingThirdPerson ) {
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
EQI4 $1770
line 2675
;2675:		return;
ADDRGP4 $1764
JUMPV
LABELV $1770
line 2678
;2676:	}
;2677:
;2678:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1773
line 2679
;2679:		return;
ADDRGP4 $1764
JUMPV
LABELV $1773
line 2682
;2680:	}
;2681:
;2682:    color[0]=cg_crosshairColorRed.value;
ADDRLP4 4
ADDRGP4 cg_crosshairColorRed+8
INDIRF4
ASGNF4
line 2683
;2683:    color[1]=cg_crosshairColorGreen.value;
ADDRLP4 4+4
ADDRGP4 cg_crosshairColorGreen+8
INDIRF4
ASGNF4
line 2684
;2684:    color[2]=cg_crosshairColorBlue.value;
ADDRLP4 4+8
ADDRGP4 cg_crosshairColorBlue+8
INDIRF4
ASGNF4
line 2685
;2685:    color[3]=1.0f;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 2686
;2686:	trap_R_SetColor( color );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2688
;2687:
;2688:	if( cg_differentCrosshairs.integer == 1 ){
ADDRGP4 cg_differentCrosshairs+12
INDIRI4
CNSTI4 1
NEI4 $1782
line 2689
;2689:		switch( currentWeapon ){
ADDRLP4 48
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
LTI4 $1785
ADDRLP4 48
INDIRI4
CNSTI4 13
GTI4 $1785
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1828-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1828
address $1787
address $1790
address $1793
address $1796
address $1799
address $1802
address $1805
address $1808
address $1811
address $1814
address $1817
address $1820
address $1823
code
LABELV $1787
line 2691
;2690:			case 1:
;2691:				w = h = cg_ch1size.value;
ADDRLP4 52
ADDRGP4 cg_ch1size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 2692
;2692:				ca = cg_ch1.integer;
ADDRLP4 0
ADDRGP4 cg_ch1+12
INDIRI4
ASGNI4
line 2693
;2693:				break;
ADDRGP4 $1783
JUMPV
LABELV $1790
line 2695
;2694:			case 2:
;2695:				w = h = cg_ch2size.value;
ADDRLP4 56
ADDRGP4 cg_ch2size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 56
INDIRF4
ASGNF4
line 2696
;2696:				ca = cg_ch2.integer;
ADDRLP4 0
ADDRGP4 cg_ch2+12
INDIRI4
ASGNI4
line 2697
;2697:				break;
ADDRGP4 $1783
JUMPV
LABELV $1793
line 2699
;2698:			case 3:
;2699:				w = h = cg_ch3size.value;
ADDRLP4 60
ADDRGP4 cg_ch3size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 60
INDIRF4
ASGNF4
line 2700
;2700:				ca = cg_ch3.integer;
ADDRLP4 0
ADDRGP4 cg_ch3+12
INDIRI4
ASGNI4
line 2701
;2701:				break;
ADDRGP4 $1783
JUMPV
LABELV $1796
line 2703
;2702:			case 4:
;2703:				w = h = cg_ch4size.value;
ADDRLP4 64
ADDRGP4 cg_ch4size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 64
INDIRF4
ASGNF4
line 2704
;2704:				ca = cg_ch4.integer;
ADDRLP4 0
ADDRGP4 cg_ch4+12
INDIRI4
ASGNI4
line 2705
;2705:				break;
ADDRGP4 $1783
JUMPV
LABELV $1799
line 2707
;2706:			case 5:
;2707:				w = h = cg_ch5size.value;
ADDRLP4 68
ADDRGP4 cg_ch5size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 68
INDIRF4
ASGNF4
line 2708
;2708:				ca = cg_ch5.integer;
ADDRLP4 0
ADDRGP4 cg_ch5+12
INDIRI4
ASGNI4
line 2709
;2709:				break;
ADDRGP4 $1783
JUMPV
LABELV $1802
line 2711
;2710:			case 6:
;2711:				w = h = cg_ch6size.value;
ADDRLP4 72
ADDRGP4 cg_ch6size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 72
INDIRF4
ASGNF4
line 2712
;2712:				ca = cg_ch6.integer;
ADDRLP4 0
ADDRGP4 cg_ch6+12
INDIRI4
ASGNI4
line 2713
;2713:				break;
ADDRGP4 $1783
JUMPV
LABELV $1805
line 2715
;2714:			case 7:
;2715:				w = h = cg_ch7size.value;
ADDRLP4 76
ADDRGP4 cg_ch7size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 76
INDIRF4
ASGNF4
line 2716
;2716:				ca = cg_ch7.integer;
ADDRLP4 0
ADDRGP4 cg_ch7+12
INDIRI4
ASGNI4
line 2717
;2717:				break;
ADDRGP4 $1783
JUMPV
LABELV $1808
line 2719
;2718:			case 8:
;2719:				w = h = cg_ch8size.value;
ADDRLP4 80
ADDRGP4 cg_ch8size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 80
INDIRF4
ASGNF4
line 2720
;2720:				ca = cg_ch8.integer;
ADDRLP4 0
ADDRGP4 cg_ch8+12
INDIRI4
ASGNI4
line 2721
;2721:				break;
ADDRGP4 $1783
JUMPV
LABELV $1811
line 2723
;2722:			case 9:
;2723:				w = h = cg_ch9size.value;
ADDRLP4 84
ADDRGP4 cg_ch9size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 84
INDIRF4
ASGNF4
line 2724
;2724:				ca = cg_ch9.integer;
ADDRLP4 0
ADDRGP4 cg_ch9+12
INDIRI4
ASGNI4
line 2725
;2725:				break;
ADDRGP4 $1783
JUMPV
LABELV $1814
line 2727
;2726:			case 10:
;2727:				w = h = cg_ch10size.value;
ADDRLP4 88
ADDRGP4 cg_ch10size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 88
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 88
INDIRF4
ASGNF4
line 2728
;2728:				ca = cg_ch10.integer;
ADDRLP4 0
ADDRGP4 cg_ch10+12
INDIRI4
ASGNI4
line 2729
;2729:				break;
ADDRGP4 $1783
JUMPV
LABELV $1817
line 2731
;2730:			case 11:
;2731:				w = h = cg_ch11size.value;
ADDRLP4 92
ADDRGP4 cg_ch11size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 92
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 92
INDIRF4
ASGNF4
line 2732
;2732:				ca = cg_ch11.integer;
ADDRLP4 0
ADDRGP4 cg_ch11+12
INDIRI4
ASGNI4
line 2733
;2733:				break;
ADDRGP4 $1783
JUMPV
LABELV $1820
line 2735
;2734:			case 12:
;2735:				w = h = cg_ch12size.value;
ADDRLP4 96
ADDRGP4 cg_ch12size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 96
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 96
INDIRF4
ASGNF4
line 2736
;2736:				ca = cg_ch12.integer;
ADDRLP4 0
ADDRGP4 cg_ch12+12
INDIRI4
ASGNI4
line 2737
;2737:				break;
ADDRGP4 $1783
JUMPV
LABELV $1823
line 2739
;2738:			case 13:
;2739:				w = h = cg_ch13size.value;
ADDRLP4 100
ADDRGP4 cg_ch13size+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 100
INDIRF4
ASGNF4
line 2740
;2740:				ca = cg_ch13.integer;
ADDRLP4 0
ADDRGP4 cg_ch13+12
INDIRI4
ASGNI4
line 2741
;2741:				break;
ADDRGP4 $1783
JUMPV
LABELV $1785
line 2743
;2742:        default:
;2743:                w = h = cg_crosshairScale.value;
ADDRLP4 104
ADDRGP4 cg_crosshairScale+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 104
INDIRF4
ASGNF4
line 2744
;2744:                ca = cg_drawCrosshair.integer;
ADDRLP4 0
ADDRGP4 cg_drawCrosshair+12
INDIRI4
ASGNI4
line 2745
;2745:                break;
line 2747
;2746:		}
;2747:	}
ADDRGP4 $1783
JUMPV
LABELV $1782
line 2748
;2748:	else{
line 2749
;2749:		w = h = cg_crosshairScale.value;
ADDRLP4 48
ADDRGP4 cg_crosshairScale+8
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 2750
;2750:		ca = cg_drawCrosshair.integer;
ADDRLP4 0
ADDRGP4 cg_drawCrosshair+12
INDIRI4
ASGNI4
line 2751
;2751:	}
LABELV $1783
line 2753
;2752:
;2753:	if( cg_crosshairPulse.integer ){
ADDRGP4 cg_crosshairPulse+12
INDIRI4
CNSTI4 0
EQI4 $1832
line 2755
;2754:		// pulse the size of the crosshair when picking up items
;2755:		f = cg.time - cg.itemPickupBlendTime;
ADDRLP4 40
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1952960
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 2756
;2756:		if ( f > 0 && f < ITEM_BLOB_TIME ) {
ADDRLP4 48
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 48
INDIRF4
CNSTF4 0
LEF4 $1837
ADDRLP4 48
INDIRF4
CNSTF4 1128792064
GEF4 $1837
line 2757
;2757:			f /= ITEM_BLOB_TIME;
ADDRLP4 40
ADDRLP4 40
INDIRF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 2758
;2758:			w *= ( 1 + f );
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 40
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 2759
;2759:			h *= ( 1 + f );
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 40
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 2760
;2760:		}
LABELV $1837
line 2761
;2761:	}
LABELV $1832
line 2762
;2762:	if(cl_screenoffset.integer > 0){
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 0
LEI4 $1839
line 2763
;2763:	x = cg_crosshairX.integer - wideAdjustX; // leilei - widescreen adjust
ADDRLP4 32
ADDRGP4 cg_crosshairX+12
INDIRI4
ADDRGP4 wideAdjustX
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 2764
;2764:	} else {
ADDRGP4 $1840
JUMPV
LABELV $1839
line 2765
;2765:	x = cg_crosshairX.integer; // leilei - widescreen adjust
ADDRLP4 32
ADDRGP4 cg_crosshairX+12
INDIRI4
CVIF4 4
ASGNF4
line 2766
;2766:	}
LABELV $1840
line 2767
;2767:	y = cg_crosshairY.integer;
ADDRLP4 36
ADDRGP4 cg_crosshairY+12
INDIRI4
CVIF4 4
ASGNF4
line 2768
;2768:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 32
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 2770
;2769:
;2770:	if (ca < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1845
line 2771
;2771:		ca = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2772
;2772:	}
LABELV $1845
line 2773
;2773:	hShader = cgs.media.crosshairShader[ ca % NUM_CROSSHAIRS ];
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 99
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+468
ADDP4
INDIRI4
ASGNI4
line 2775
;2774:
;2775:        if(!hShader)
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1849
line 2776
;2776:            hShader = cgs.media.crosshairShader[ ca % 10 ];
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+468
ADDP4
INDIRI4
ASGNI4
LABELV $1849
line 2778
;2777:
;2778:	trap_R_DrawStretchPic( x + cg.refdef.x + 0.5 * (cg.refdef.width - w),
ADDRLP4 48
CNSTF4 1056964608
ASGNF4
ADDRLP4 52
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+1870616
INDIRI4
CVIF4 4
ADDF4
ADDRLP4 48
INDIRF4
ADDRGP4 cg+1870616+8
INDIRI4
CVIF4 4
ADDRLP4 52
INDIRF4
SUBF4
MULF4
ADDF4
ARGF4
ADDRLP4 56
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg+1870616+4
INDIRI4
CVIF4 4
ADDF4
ADDRLP4 48
INDIRF4
ADDRGP4 cg+1870616+12
INDIRI4
CVIF4 4
ADDRLP4 56
INDIRF4
SUBF4
MULF4
ADDF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 64
CNSTF4 1065353216
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2781
;2779:		y + cg.refdef.y + 0.5 * (cg.refdef.height - h),
;2780:		w, h, 0, 0, 1, 1, hShader );
;2781:}
LABELV $1764
endproc CG_DrawCrosshair 108 36
proc CG_DrawCrosshair3D 452 28
line 2788
;2782:
;2783:/*
;2784:=================
;2785:CG_DrawCrosshair3D
;2786:=================
;2787:*/
;2788:static void CG_DrawCrosshair3D(void) {
line 2798
;2789:	float w, h;
;2790:	qhandle_t hShader;
;2791:	int ca;
;2792:	trace_t trace;
;2793:	vec3_t endpos;
;2794:	float zProj, maxdist;
;2795:	char rendererinfos[128];
;2796:	refEntity_t ent;
;2797:
;2798:	if (!cg_drawCrosshair.integer) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $1861
line 2799
;2799:		return;
ADDRGP4 $1860
JUMPV
LABELV $1861
line 2802
;2800:	}
;2801:
;2802:	if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1864
line 2803
;2803:		return;
ADDRGP4 $1860
JUMPV
LABELV $1864
line 2806
;2804:	}
;2805:
;2806:	if (cg.predictedPlayerState.pm_type == PM_DEAD || cg.predictedPlayerState.pm_type == PM_INTERMISSION) {
ADDRGP4 cg+1868928+4
INDIRI4
CNSTI4 3
EQI4 $1873
ADDRGP4 cg+1868928+4
INDIRI4
CNSTI4 5
NEI4 $1867
LABELV $1873
line 2807
;2807:		return;
ADDRGP4 $1860
JUMPV
LABELV $1867
line 2810
;2808:	}
;2809:
;2810:	w = h = cg_crosshairScale.value;
ADDRLP4 396
ADDRGP4 cg_crosshairScale+8
INDIRF4
ASGNF4
ADDRLP4 392
ADDRLP4 396
INDIRF4
ASGNF4
ADDRLP4 388
ADDRLP4 396
INDIRF4
ASGNF4
line 2812
;2811:
;2812:	ca = cg_drawCrosshair.integer;
ADDRLP4 180
ADDRGP4 cg_drawCrosshair+12
INDIRI4
ASGNI4
line 2813
;2813:	if (ca < 0) {
ADDRLP4 180
INDIRI4
CNSTI4 0
GEI4 $1876
line 2814
;2814:		ca = 0;
ADDRLP4 180
CNSTI4 0
ASGNI4
line 2815
;2815:	}
LABELV $1876
line 2816
;2816:	hShader = cgs.media.crosshairSh3d[ ca % NUM_CROSSHAIRS ];
ADDRLP4 196
ADDRLP4 180
INDIRI4
CNSTI4 99
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+864
ADDP4
INDIRI4
ASGNI4
line 2818
;2817:
;2818:	if (!hShader)
ADDRLP4 196
INDIRI4
CNSTI4 0
NEI4 $1880
line 2819
;2819:		hShader = cgs.media.crosshairSh3d[ ca % 10 ];
ADDRLP4 196
ADDRLP4 180
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+864
ADDP4
INDIRI4
ASGNI4
LABELV $1880
line 2826
;2820:
;2821:	// Use a different method rendering the crosshair so players don't see two of them when
;2822:	// focusing their eyes at distant objects with high stereo separation
;2823:	// We are going to trace to the next shootable object and place the crosshair in front of it.
;2824:
;2825:	// first get all the important renderer information
;2826:	trap_Cvar_VariableStringBuffer("r_zProj", rendererinfos, sizeof (rendererinfos));
ADDRGP4 $1884
ARGP4
ADDRLP4 260
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2827
;2827:	zProj = atof(rendererinfos);
ADDRLP4 260
ARGP4
ADDRLP4 400
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 256
ADDRLP4 400
INDIRF4
ASGNF4
line 2829
;2828:
;2829:    maxdist = 65536;
ADDRLP4 176
CNSTF4 1199570944
ASGNF4
line 2831
;2830:
;2831:	memset(&ent, 0, sizeof (ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2832
;2832:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 2833
;2833:	ent.renderfx = RF_DEPTHHACK | RF_CROSSHAIR | RF_FIRST_PERSON;
ADDRLP4 0+4
CNSTI4 28
ASGNI4
line 2835
;2834:
;2835:    VectorCopy(cg.predictedPlayerState.origin, ent.origin );
ADDRLP4 0+68
ADDRGP4 cg+1868928+20
INDIRB
ASGNB 12
line 2836
;2836:    ent.origin[2] = ent.origin[2]+cg.predictedPlayerState.viewheight;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+1868928+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2837
;2837:    AnglesToAxis(cg.predictedPlayerState.viewangles, ent.axis);
ADDRGP4 cg+1868928+152
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2838
;2838:    VectorMA(ent.origin, maxdist, ent.axis[0], endpos);
ADDRLP4 184
ADDRLP4 0+68
INDIRF4
ADDRLP4 0+28
INDIRF4
ADDRLP4 176
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 184+4
ADDRLP4 0+68+4
INDIRF4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 176
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 184+8
ADDRLP4 0+68+8
INDIRF4
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 176
INDIRF4
MULF4
ADDF4
ASGNF4
line 2840
;2839:
;2840:	CG_Trace(&trace, ent.origin, NULL, NULL, endpos, 0, MASK_SHOT);
ADDRLP4 200
ARGP4
ADDRLP4 0+68
ARGP4
ADDRLP4 408
CNSTP4 0
ASGNP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRLP4 184
ARGP4
CNSTI4 0
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2842
;2841:
;2842:	VectorCopy(trace.endpos, ent.origin);
ADDRLP4 0+68
ADDRLP4 200+12
INDIRB
ASGNB 12
line 2845
;2843:
;2844:	// scale the crosshair so it appears the same size for all distances
;2845:	ent.radius = w / 800 * zProj * tan(cg.refdef.fov_x * M_PI / 360.0f) * trace.fraction * maxdist / zProj;
CNSTF4 1078530011
ADDRGP4 cg+1870616+16
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
ARGF4
ADDRLP4 412
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 0+132
ADDRLP4 388
INDIRF4
CNSTF4 1145569280
DIVF4
ADDRLP4 256
INDIRF4
MULF4
ADDRLP4 412
INDIRF4
MULF4
ADDRLP4 200+8
INDIRF4
MULF4
ADDRLP4 176
INDIRF4
MULF4
ADDRLP4 256
INDIRF4
DIVF4
ASGNF4
line 2846
;2846:	ent.customShader = hShader;
ADDRLP4 0+112
ADDRLP4 196
INDIRI4
ASGNI4
line 2847
;2847:    ent.shaderRGBA[0] = cg_crosshairColorRed.value * 255;
ADDRLP4 420
CNSTF4 1132396544
ADDRGP4 cg_crosshairColorRed+8
INDIRF4
MULF4
ASGNF4
ADDRLP4 424
CNSTF4 1325400064
ASGNF4
ADDRLP4 420
INDIRF4
ADDRLP4 424
INDIRF4
LTF4 $1921
ADDRLP4 416
ADDRLP4 420
INDIRF4
ADDRLP4 424
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1922
JUMPV
LABELV $1921
ADDRLP4 416
ADDRLP4 420
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1922
ADDRLP4 0+116
ADDRLP4 416
INDIRU4
CVUU1 4
ASGNU1
line 2848
;2848:	ent.shaderRGBA[1] = cg_crosshairColorGreen.value * 255;
ADDRLP4 432
CNSTF4 1132396544
ADDRGP4 cg_crosshairColorGreen+8
INDIRF4
MULF4
ASGNF4
ADDRLP4 436
CNSTF4 1325400064
ASGNF4
ADDRLP4 432
INDIRF4
ADDRLP4 436
INDIRF4
LTF4 $1927
ADDRLP4 428
ADDRLP4 432
INDIRF4
ADDRLP4 436
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1928
JUMPV
LABELV $1927
ADDRLP4 428
ADDRLP4 432
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1928
ADDRLP4 0+116+1
ADDRLP4 428
INDIRU4
CVUU1 4
ASGNU1
line 2849
;2849:	ent.shaderRGBA[2] = cg_crosshairColorBlue.value * 255;
ADDRLP4 444
CNSTF4 1132396544
ADDRGP4 cg_crosshairColorBlue+8
INDIRF4
MULF4
ASGNF4
ADDRLP4 448
CNSTF4 1325400064
ASGNF4
ADDRLP4 444
INDIRF4
ADDRLP4 448
INDIRF4
LTF4 $1933
ADDRLP4 440
ADDRLP4 444
INDIRF4
ADDRLP4 448
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1934
JUMPV
LABELV $1933
ADDRLP4 440
ADDRLP4 444
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1934
ADDRLP4 0+116+2
ADDRLP4 440
INDIRU4
CVUU1 4
ASGNU1
line 2850
;2850:    ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2851
;2851:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2852
;2852:}
LABELV $1860
endproc CG_DrawCrosshair3D 452 28
proc CG_ScanForCrosshairEntity 112 28
line 2861
;2853:
;2854:
;2855:
;2856:/*
;2857:=================
;2858:CG_ScanForCrosshairEntity
;2859:=================
;2860:*/
;2861:static void CG_ScanForCrosshairEntity( void ) {
line 2867
;2862:	trace_t		trace;
;2863:	vec3_t		start, end;
;2864:	int			content;
;2865:	char st[16];
;2866:
;2867:	VectorCopy( cg.refdef.vieworg, start );
ADDRLP4 56
ADDRGP4 cg+1870616+24
INDIRB
ASGNB 12
line 2868
;2868:	VectorMA( start, 131072, cg.refdef.viewaxis[0], end );
ADDRLP4 100
CNSTF4 1207959552
ASGNF4
ADDRLP4 68
ADDRLP4 56
INDIRF4
ADDRLP4 100
INDIRF4
ADDRGP4 cg+1870616+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 56+4
INDIRF4
ADDRLP4 100
INDIRF4
ADDRGP4 cg+1870616+36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 56+8
INDIRF4
CNSTF4 1207959552
ADDRGP4 cg+1870616+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2870
;2869:
;2870:	CG_Trace( &trace, start, vec3_origin, vec3_origin, end,
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 104
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2872
;2871:		cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY );
;2872:	if ( trace.entityNum >= MAX_CLIENTS ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 256
LTI4 $1953
line 2873
;2873:		return;
ADDRGP4 $1937
JUMPV
LABELV $1953
line 2877
;2874:	}
;2875:
;2876:	// if the player is in fog, don't show it
;2877:	content = CG_PointContents( trace.endpos, 0 );
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 108
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 108
INDIRI4
ASGNI4
line 2878
;2878:	if ( content & CONTENTS_FOG ) {
ADDRLP4 80
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1957
line 2879
;2879:		return;
ADDRGP4 $1937
JUMPV
LABELV $1957
line 2883
;2880:	}
;2881:
;2882:	// if the player is invisible, don't show it
;2883:	if ( cg_entities[ trace.entityNum ].currentState.powerups & ( 1 << PW_INVIS ) ) {
CNSTI4 928
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 cg_entities+200
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1959
line 2884
;2884:		return;
ADDRGP4 $1937
JUMPV
LABELV $1959
line 2888
;2885:	}
;2886:
;2887:	// update the fade timer
;2888:	cg.crosshairClientNum = trace.entityNum;
ADDRGP4 cg+1952684
ADDRLP4 0+52
INDIRI4
ASGNI4
line 2889
;2889:	cg.androidtarget = trace.entityNum;
ADDRGP4 cg+1952692
ADDRLP4 0+52
INDIRI4
ASGNI4
line 2890
;2890:	cg.crosshairClientTime = cg.time;
ADDRGP4 cg+1952688
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 2891
;2891:}
LABELV $1937
endproc CG_ScanForCrosshairEntity 112 28
proc CG_DrawCrosshairNames 24 16
line 2898
;2892:
;2893:/*
;2894:=====================
;2895:CG_DrawCrosshairNames
;2896:=====================
;2897:*/
;2898:static void CG_DrawCrosshairNames( void ) {
line 2904
;2899:	float		*color;
;2900:	char		*name;
;2901:	char		*gender;
;2902:	float		w;
;2903:
;2904:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $1970
line 2905
;2905:		return;
ADDRGP4 $1969
JUMPV
LABELV $1970
line 2907
;2906:	}
;2907:	if ( !cg_drawCrosshairNames.integer ) {
ADDRGP4 cg_drawCrosshairNames+12
INDIRI4
CNSTI4 0
NEI4 $1973
line 2908
;2908:		return;
ADDRGP4 $1969
JUMPV
LABELV $1973
line 2910
;2909:	}
;2910:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
EQI4 $1976
line 2912
;2911://		return;
;2912:	}
LABELV $1976
line 2915
;2913:
;2914:	// scan the known entities to see if the crosshair is sighted on one
;2915:	CG_ScanForCrosshairEntity();
ADDRGP4 CG_ScanForCrosshairEntity
CALLV
pop
line 2918
;2916:
;2917:	// draw the name of the player being looked at
;2918:	color = CG_FadeColor( cg.crosshairClientTime, 1000 );
ADDRGP4 cg+1952688
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 16
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 2919
;2919:	if ( !color ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1980
line 2920
;2920:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2921
;2921:		return;
ADDRGP4 $1969
JUMPV
LABELV $1980
line 2924
;2922:	}
;2923:
;2924:	name = cgs.clientinfo[ cg.crosshairClientNum ].name;
ADDRLP4 4
CNSTI4 1944
ADDRGP4 cg+1952684
INDIRI4
MULI4
ADDRGP4 cgs+440948+4
ADDP4
ASGNP4
line 2933
;2925:
;2926:
;2927:
;2928:#ifndef MISSIONPACK
;2929:	color[3] *= 0.5f;
;2930:	w = CG_Text_Width(name, 0.3f, 0);
;2931:	CG_Text_Paint( 320 - w / 2, 190, 0.3f, color, name, 0, 0, ITEM_TEXTSTYLE_SHADOWED);
;2932:#else
;2933:	w = CG_DrawStrlen( name ) * BIGCHAR_WIDTH;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
CVIF4 4
ASGNF4
line 2934
;2934:	CG_DrawBigString( 320 - w / 2, 170, name, color[3] * 0.5f );
CNSTF4 1134559232
ADDRLP4 8
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
CVFI4 4
ARGI4
CNSTI4 170
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1056964608
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2936
;2935:#endif
;2936:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2937
;2937:}
LABELV $1969
endproc CG_DrawCrosshairNames 24 16
proc CG_DrawSpectator 0 16
line 2947
;2938:
;2939:
;2940://==============================================================================
;2941:
;2942:/*
;2943:=================
;2944:CG_DrawSpectator
;2945:=================
;2946:*/
;2947:static void CG_DrawSpectator(void) {
line 2948
;2948:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1987
line 2949
;2949:	CG_DrawBigString(320 - 9 * 8, 440, "SPECTATOR", 1.0F);
CNSTI4 248
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $1990
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2950
;2950:	if ( cgs.gametype == GT_TOURNAMENT ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 3
NEI4 $1991
line 2951
;2951:		CG_DrawBigString(320 - 15 * 8, 460, "waiting to play", 1.0F);
CNSTI4 200
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $1994
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2952
;2952:	}
ADDRGP4 $1992
JUMPV
LABELV $1991
line 2953
;2953:	else if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $1995
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $1995
line 2954
;2954:		CG_DrawBigString(320 - 39 * 8, 460, "press ESC and use the JOIN menu to play", 1.0F);
CNSTI4 8
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $1999
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2955
;2955:	}
LABELV $1995
LABELV $1992
line 2956
;2956:}
LABELV $1987
line 2957
;2957:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2000
line 2958
;2958:	CG_DrawBigString(320 - 9 * 8, 440, "НАБЛЮДАТЕЛЬ", 1.0F);
CNSTI4 248
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $2003
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2959
;2959:	if ( cgs.gametype == GT_TOURNAMENT ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 3
NEI4 $2004
line 2960
;2960:		CG_DrawBigString(320 - 15 * 8, 460, "ожидание игры", 1.0F);
CNSTI4 200
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $2007
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2961
;2961:	}
ADDRGP4 $2005
JUMPV
LABELV $2004
line 2962
;2962:	else if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $2008
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $2008
line 2963
;2963:		CG_DrawBigString(320 - 39 * 8, 460, "нажмите ESC нажмите СТАРТ в меню для игры", 1.0F);
CNSTI4 8
ARGI4
CNSTI4 460
ARGI4
ADDRGP4 $2012
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 2964
;2964:	}
LABELV $2008
LABELV $2005
line 2965
;2965:}
LABELV $2000
line 2966
;2966:}
LABELV $1986
endproc CG_DrawSpectator 0 16
proc CG_DrawVote 12 20
line 2973
;2967:
;2968:/*
;2969:=================
;2970:CG_DrawVote
;2971:=================
;2972:*/
;2973:static void CG_DrawVote(void) {
line 2977
;2974:	char	*s;
;2975:	int		sec;
;2976:
;2977:	if ( !cgs.voteTime ) {
ADDRGP4 cgs+339268
INDIRI4
CNSTI4 0
NEI4 $2014
line 2978
;2978:		return;
ADDRGP4 $2013
JUMPV
LABELV $2014
line 2982
;2979:	}
;2980:
;2981:	// play a talk beep whenever it is modified
;2982:	if ( cgs.voteModified ) {
ADDRGP4 cgs+339280
INDIRI4
CNSTI4 0
EQI4 $2017
line 2983
;2983:		cgs.voteModified = qfalse;
ADDRGP4 cgs+339280
CNSTI4 0
ASGNI4
line 2984
;2984:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+956380+2152
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2985
;2985:	}
LABELV $2017
line 2987
;2986:
;2987:	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;
ADDRLP4 4
CNSTI4 30000
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cgs+339268
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2988
;2988:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2025
line 2989
;2989:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2990
;2990:	}
LABELV $2025
line 2991
;2991:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2027
line 2992
;2992:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
ADDRGP4 $2030
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+339284
ARGP4
ADDRGP4 cgs+339272
INDIRI4
ARGI4
ADDRGP4 cgs+339276
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2993
;2993:	CG_DrawSmallString( 0, 58, s, 1.0F );
CNSTI4 0
ARGI4
CNSTI4 58
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 2994
;2994:	s = "or press ESC then click Vote";
ADDRLP4 0
ADDRGP4 $2034
ASGNP4
line 2995
;2995:	CG_DrawSmallString( 0, 58 + SMALLCHAR_HEIGHT + 2, s, 1.0F );
CNSTI4 0
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 58
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 2996
;2996:	}
LABELV $2027
line 2997
;2997:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2036
line 2998
;2998:	s = va("ГОЛОСОВАНИЕ(%i):%s да:%i нет:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
ADDRGP4 $2039
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+339284
ARGP4
ADDRGP4 cgs+339272
INDIRI4
ARGI4
ADDRGP4 cgs+339276
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2999
;2999:	CG_DrawSmallString( 0, 58, s, 1.0F );
CNSTI4 0
ARGI4
CNSTI4 58
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 3000
;3000:	s = "или нажмите ESC потом нажмите Голосование";
ADDRLP4 0
ADDRGP4 $2043
ASGNP4
line 3001
;3001:	CG_DrawSmallString( 0, 58 + SMALLCHAR_HEIGHT + 2, s, 1.0F );
CNSTI4 0
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 58
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 3002
;3002:	}
LABELV $2036
line 3003
;3003:}
LABELV $2013
endproc CG_DrawVote 12 20
proc CG_DrawTeamVote 24 20
line 3010
;3004:
;3005:/*
;3006:=================
;3007:CG_DrawTeamVote
;3008:=================
;3009:*/
;3010:static void CG_DrawTeamVote(void) {
line 3014
;3011:	char	*s;
;3012:	int		sec, cs_offset;
;3013:
;3014:	if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2046
line 3015
;3015:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2047
JUMPV
LABELV $2046
line 3016
;3016:	else if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2045
line 3017
;3017:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 3019
;3018:	else
;3019:		return;
LABELV $2052
LABELV $2047
line 3021
;3020:
;3021:	if ( !cgs.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+340308
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2056
line 3022
;3022:		return;
ADDRGP4 $2045
JUMPV
LABELV $2056
line 3026
;3023:	}
;3024:
;3025:	// play a talk beep whenever it is modified
;3026:	if ( cgs.teamVoteModified[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+340332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2059
line 3027
;3027:		cgs.teamVoteModified[cs_offset] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+340332
ADDP4
CNSTI4 0
ASGNI4
line 3028
;3028:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+956380+2152
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3029
;3029:	}
LABELV $2059
line 3031
;3030:
;3031:	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
ADDRLP4 4
CNSTI4 30000
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+340308
ADDP4
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 3032
;3032:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2067
line 3033
;3033:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3034
;3034:	}
LABELV $2067
line 3035
;3035:	s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
ADDRGP4 $2069
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+340340
ADDP4
ARGP4
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+340316
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ADDRGP4 cgs+340324
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 3037
;3036:							cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;3037:	CG_DrawSmallString( 0, 90, s, 1.0F );
CNSTI4 0
ARGI4
CNSTI4 90
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 3038
;3038:}
LABELV $2045
endproc CG_DrawTeamVote 24 20
data
align 4
LABELV $2074
byte 4 1
code
proc CG_DrawScoreboard 36 16
line 3041
;3039:
;3040:
;3041:static qboolean CG_DrawScoreboard( void ) {
line 3048
;3042:#ifdef MISSIONPACK
;3043:	static qboolean firstTime = qtrue;
;3044:	float fade, *fadeColor;
;3045:	char        *s;
;3046:    int w;
;3047:
;3048:	if (menuScoreboard) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2075
line 3049
;3049:		menuScoreboard->window.flags &= ~WINDOW_FORCED;
ADDRLP4 16
ADDRGP4 menuScoreboard
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -1048577
BANDI4
ASGNI4
line 3050
;3050:	}
LABELV $2075
line 3051
;3051:	if (cg_paused.integer) {
ADDRGP4 cg_paused+12
INDIRI4
CNSTI4 0
EQI4 $2077
line 3052
;3052:		cg.deferredPlayerLoading = 0;
ADDRGP4 cg+16
CNSTI4 0
ASGNI4
line 3053
;3053:		firstTime = qtrue;
ADDRGP4 $2074
CNSTI4 1
ASGNI4
line 3054
;3054:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2073
JUMPV
LABELV $2077
line 3058
;3055:	}
;3056:
;3057:	// don't draw scoreboard during death while warmup up
;3058:	if ( cg.warmup && !cg.showScores ) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 cg+1952944
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2081
ADDRGP4 cg+1888436
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $2081
line 3059
;3059:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2073
JUMPV
LABELV $2081
line 3062
;3060:	}
;3061:
;3062:	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_DEAD || cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+1888436
INDIRI4
CNSTI4 0
NEI4 $2093
ADDRGP4 cg+1868928+4
INDIRI4
CNSTI4 3
EQI4 $2093
ADDRGP4 cg+1868928+4
INDIRI4
CNSTI4 5
NEI4 $2085
LABELV $2093
line 3063
;3063:		fade = 1.0;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 3064
;3064:		fadeColor = colorWhite;
ADDRLP4 0
ADDRGP4 colorWhite
ASGNP4
line 3065
;3065:	} else {
ADDRGP4 $2086
JUMPV
LABELV $2085
line 3066
;3066:		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME*0.25 );
ADDRGP4 cg+1888444
INDIRI4
ARGI4
CNSTI4 125
ARGI4
ADDRLP4 20
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 3067
;3067:		if ( !fadeColor ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2095
line 3069
;3068:			// next time scoreboard comes up, don't print killer
;3069:			cg.deferredPlayerLoading = 0;
ADDRGP4 cg+16
CNSTI4 0
ASGNI4
line 3070
;3070:			cg.killerName[0] = 0;
ADDRGP4 cg+1888592
CNSTI1 0
ASGNI1
line 3071
;3071:			firstTime = qtrue;
ADDRGP4 $2074
CNSTI4 1
ASGNI4
line 3072
;3072:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2073
JUMPV
LABELV $2095
line 3074
;3073:		}
;3074:		fade = *fadeColor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
line 3075
;3075:	}
LABELV $2086
line 3078
;3076:
;3077:
;3078:	if (menuScoreboard == NULL) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2099
line 3079
;3079:		if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $2101
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $2101
line 3080
;3080:			menuScoreboard = Menus_FindByName("teamscore_menu");
ADDRGP4 $2105
ARGP4
ADDRLP4 20
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRGP4 menuScoreboard
ADDRLP4 20
INDIRP4
ASGNP4
line 3081
;3081:		} else {
ADDRGP4 $2102
JUMPV
LABELV $2101
line 3082
;3082:			menuScoreboard = Menus_FindByName("score_menu");
ADDRGP4 $2106
ARGP4
ADDRLP4 20
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRGP4 menuScoreboard
ADDRLP4 20
INDIRP4
ASGNP4
line 3083
;3083:		}
LABELV $2102
line 3084
;3084:	}
LABELV $2099
line 3086
;3085:
;3086:	if (menuScoreboard) {
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2107
line 3087
;3087:		if (firstTime) {
ADDRGP4 $2074
INDIRI4
CNSTI4 0
EQI4 $2109
line 3088
;3088:			CG_SetScoreSelection(menuScoreboard);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
ADDRGP4 CG_SetScoreSelection
CALLV
pop
line 3089
;3089:			firstTime = qfalse;
ADDRGP4 $2074
CNSTI4 0
ASGNI4
line 3090
;3090:		}
LABELV $2109
line 3091
;3091:		Menu_Paint(menuScoreboard, qtrue);
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_Paint
CALLV
pop
line 3092
;3092:	}
LABELV $2107
line 3095
;3093:
;3094:	// load any models that have been deferred
;3095:	if ( ++cg.deferredPlayerLoading > 10 ) {
ADDRLP4 20
ADDRGP4 cg+16
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 10
LEI4 $2111
line 3096
;3096:		CG_LoadDeferredPlayers();
ADDRGP4 CG_LoadDeferredPlayers
CALLV
pop
line 3097
;3097:	}
LABELV $2111
line 3099
;3098:
;3099:        if(cg.respawnTime && cg.snap->ps.persistant[PERS_TEAM] != TEAM_SPECTATOR && (cgs.gametype < GT_ELIMINATION || cgs.gametype > GT_LMS) ) {
ADDRGP4 cg+1987476
INDIRI4
CNSTI4 0
EQI4 $2114
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2114
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 9
LTI4 $2120
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 11
LEI4 $2114
LABELV $2120
line 3100
;3100:            if(cg.respawnTime>cg.time) {
ADDRGP4 cg+1987476
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
LEI4 $2121
line 3101
;3101:                s = va("%2.0f",((double)cg.respawnTime-(double)cg.time)/1000.0);
ADDRGP4 $2125
ARGP4
ADDRGP4 cg+1987476
INDIRI4
CVIF4 4
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 3102
;3102:                w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 3103
;3103:                CG_DrawSmallStringColor(320-w/2,440, s, colorYellow);
CNSTI4 320
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 440
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 colorYellow
ARGP4
ADDRGP4 CG_DrawSmallStringColor
CALLV
pop
line 3104
;3104:            } else {
ADDRGP4 $2122
JUMPV
LABELV $2121
line 3105
;3105:                s = va("OK");
ADDRGP4 $2129
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 3106
;3106:                w = CG_DrawStrlen( s ) * SMALLCHAR_WIDTH;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 3107
;3107:                CG_DrawSmallStringColor(320-w/2,440, "OK", colorGreen);
CNSTI4 320
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $2129
ARGP4
ADDRGP4 colorGreen
ARGP4
ADDRGP4 CG_DrawSmallStringColor
CALLV
pop
line 3108
;3108:            }
LABELV $2122
line 3109
;3109:        }
LABELV $2114
line 3111
;3110:
;3111:	return qtrue;
CNSTI4 1
RETI4
LABELV $2073
endproc CG_DrawScoreboard 36 16
proc CG_DrawIntermission 4 0
line 3120
;3112:#endif
;3113:}
;3114:
;3115:/*
;3116:=================
;3117:CG_DrawIntermission
;3118:=================
;3119:*/
;3120:static void CG_DrawIntermission( void ) {
line 3121
;3121:	cg.scoreFadeTime = cg.time;
ADDRGP4 cg+1888444
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 3123
;3122:
;3123:if(cgs.gametype != GT_SINGLE){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $2134
line 3124
;3124:if(cg_oldscoreboard.integer == 0){
ADDRGP4 cg_oldscoreboard+12
INDIRI4
CNSTI4 0
NEI4 $2137
line 3125
;3125:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+1888440
ADDRLP4 0
INDIRI4
ASGNI4
line 3126
;3126:}
LABELV $2137
line 3127
;3127:if(cg_oldscoreboard.integer == 1){
ADDRGP4 cg_oldscoreboard+12
INDIRI4
CNSTI4 1
NEI4 $2135
line 3128
;3128:	cg.scoreBoardShowing = CG_DrawOldScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawOldScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+1888440
ADDRLP4 0
INDIRI4
ASGNI4
line 3129
;3129:}
line 3130
;3130:} else {
ADDRGP4 $2135
JUMPV
LABELV $2134
line 3131
;3131:	cg.scoreBoardShowing = CG_DrawScoreboardObj();
ADDRLP4 0
ADDRGP4 CG_DrawScoreboardObj
CALLI4
ASGNI4
ADDRGP4 cg+1888440
ADDRLP4 0
INDIRI4
ASGNI4
line 3132
;3132:}
LABELV $2135
line 3133
;3133:}
LABELV $2131
endproc CG_DrawIntermission 4 0
proc CG_DrawFollow 36 36
line 3140
;3134:
;3135:/*
;3136:=================
;3137:CG_DrawFollow
;3138:=================
;3139:*/
;3140:static qboolean CG_DrawFollow( void ) {
line 3145
;3141:	float		x;
;3142:	vec4_t		color;
;3143:	const char	*name;
;3144:
;3145:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $2147
line 3146
;3146:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2146
JUMPV
LABELV $2147
line 3148
;3147:	}
;3148:	color[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 3149
;3149:	color[1] = 1;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 3150
;3150:	color[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 3151
;3151:	color[3] = 1;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 3153
;3152:
;3153:	name = cgs.clientinfo[ cg.snap->ps.clientNum ].name;
ADDRLP4 16
CNSTI4 1944
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948+4
ADDP4
ASGNP4
line 3155
;3154:
;3155:	x = 0.5 * ( 640 - 10 * CG_DrawStrlen( name ) );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
CNSTF4 1056964608
CNSTI4 640
CNSTI4 10
ADDRLP4 24
INDIRI4
MULI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 3157
;3156:
;3157:	CG_DrawStringExt( x, 10, name, color, qtrue, qtrue, 10, 16, 0 );
ADDRLP4 20
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 28
CNSTI4 10
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 3159
;3158:
;3159:	return qtrue;
CNSTI4 1
RETI4
LABELV $2146
endproc CG_DrawFollow 36 36
bss
align 4
LABELV $2157
skip 4
align 4
LABELV $2158
skip 4
align 4
LABELV $2159
skip 4
code
proc CG_DrawProxWarning 76 16
line 3167
;3160:}
;3161:
;3162:/*
;3163:=================
;3164:CG_DrawProxWarning
;3165:=================
;3166:*/
;3167:static void CG_DrawProxWarning( void ) {
line 3174
;3168:	char s [64];
;3169:	int			w;
;3170:  static int proxTime;
;3171:  static int proxCounter;
;3172:  static int proxTick;
;3173:
;3174:	if( !(cg.snap->ps.eFlags & EF_TICKING ) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $2160
line 3175
;3175:    proxTime = 0;
ADDRGP4 $2157
CNSTI4 0
ASGNI4
line 3176
;3176:		return;
ADDRGP4 $2156
JUMPV
LABELV $2160
line 3179
;3177:	}
;3178:
;3179:  if (proxTime == 0) {
ADDRGP4 $2157
INDIRI4
CNSTI4 0
NEI4 $2163
line 3180
;3180:    proxTime = cg.time + 5000;
ADDRGP4 $2157
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 3181
;3181:    proxCounter = 5;
ADDRGP4 $2158
CNSTI4 5
ASGNI4
line 3182
;3182:    proxTick = 0;
ADDRGP4 $2159
CNSTI4 0
ASGNI4
line 3183
;3183:  }
LABELV $2163
line 3185
;3184:
;3185:  if (cg.time > proxTime) {
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 $2157
INDIRI4
LEI4 $2166
line 3186
;3186:    proxTick = proxCounter--;
ADDRLP4 72
ADDRGP4 $2158
ASGNP4
ADDRLP4 68
ADDRLP4 72
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 68
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $2159
ADDRLP4 68
INDIRI4
ASGNI4
line 3187
;3187:    proxTime = cg.time + 1000;
ADDRGP4 $2157
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3188
;3188:  }
LABELV $2166
line 3189
;3189:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2170
line 3190
;3190:  if (proxTick != 0) {
ADDRGP4 $2159
INDIRI4
CNSTI4 0
EQI4 $2173
line 3191
;3191:    Com_sprintf(s, sizeof(s), "INTERNAL COMBUSTION IN: %i", proxTick);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $2175
ARGP4
ADDRGP4 $2159
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3192
;3192:  } else {
ADDRGP4 $2174
JUMPV
LABELV $2173
line 3193
;3193:    Com_sprintf(s, sizeof(s), "YOU HAVE BEEN MINED");
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $2176
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3194
;3194:  }
LABELV $2174
line 3195
;3195:}
LABELV $2170
line 3196
;3196:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2177
line 3197
;3197:  if (proxTick != 0) {
ADDRGP4 $2159
INDIRI4
CNSTI4 0
EQI4 $2180
line 3198
;3198:    Com_sprintf(s, sizeof(s), "ВЗРЫВ ЧЕРЕЗ: %i", proxTick);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $2182
ARGP4
ADDRGP4 $2159
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3199
;3199:  } else {
ADDRGP4 $2181
JUMPV
LABELV $2180
line 3200
;3200:    Com_sprintf(s, sizeof(s), "ВЫ БЫЛИ ЗАМИНИРОВАНЫ");
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $2183
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3201
;3201:  }
LABELV $2181
line 3202
;3202:}
LABELV $2177
line 3204
;3203:
;3204:	w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 64
ADDRLP4 68
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 3205
;3205:	CG_DrawBigStringColor( 320 - w / 2, 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex(COLOR_RED)] );
CNSTI4 320
ADDRLP4 64
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 g_color_table+16
ARGP4
ADDRGP4 CG_DrawBigStringColor
CALLV
pop
line 3206
;3206:}
LABELV $2156
endproc CG_DrawProxWarning 76 16
proc CG_DrawWarmup 56 36
line 3214
;3207:
;3208:
;3209:/*
;3210:=================
;3211:CG_DrawWarmup
;3212:=================
;3213:*/
;3214:static void CG_DrawWarmup( void ) {
line 3223
;3215:	int			w;
;3216:	int			sec;
;3217:	int			i;
;3218:	float scale;
;3219:	clientInfo_t	*ci1, *ci2;
;3220:	int			cw;
;3221:	const char	*s;
;3222:
;3223:	sec = cg.warmup;
ADDRLP4 4
ADDRGP4 cg+1952944
INDIRI4
ASGNI4
line 3224
;3224:	if ( !sec ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2189
line 3225
;3225:		return;
ADDRGP4 $2187
JUMPV
LABELV $2189
line 3228
;3226:	}
;3227:
;3228:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2191
line 3229
;3229:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2193
line 3230
;3230:		s = "Waiting for players";
ADDRLP4 8
ADDRGP4 $2196
ASGNP4
line 3231
;3231:		}
LABELV $2193
line 3232
;3232:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2197
line 3233
;3233:		s = "Ожидание игроков";
ADDRLP4 8
ADDRGP4 $2200
ASGNP4
line 3234
;3234:		}
LABELV $2197
line 3235
;3235:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH;
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 3236
;3236:		CG_DrawBigString(320 - w / 2, 24, s, 1.0F);
CNSTI4 320
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 24
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawBigString
CALLV
pop
line 3237
;3237:		cg.warmupCount = 0;
ADDRGP4 cg+1952948
CNSTI4 0
ASGNI4
line 3238
;3238:		return;
ADDRGP4 $2187
JUMPV
LABELV $2191
line 3241
;3239:	}
;3240:
;3241:	if (cgs.gametype == GT_TOURNAMENT) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 3
NEI4 $2203
line 3243
;3242:		// find the two active players
;3243:		ci1 = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 3244
;3244:		ci2 = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 3245
;3245:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2209
JUMPV
LABELV $2206
line 3246
;3246:			if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_FREE ) {
ADDRLP4 32
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+440948
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $2211
ADDRLP4 32
INDIRI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $2211
line 3247
;3247:				if ( !ci1 ) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2216
line 3248
;3248:					ci1 = &cgs.clientinfo[i];
ADDRLP4 20
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 3249
;3249:				} else {
ADDRGP4 $2217
JUMPV
LABELV $2216
line 3250
;3250:					ci2 = &cgs.clientinfo[i];
ADDRLP4 24
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 3251
;3251:				}
LABELV $2217
line 3252
;3252:			}
LABELV $2211
line 3253
;3253:		}
LABELV $2207
line 3245
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2209
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $2206
line 3255
;3254:
;3255:		if ( ci1 && ci2 ) {
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $2204
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $2204
line 3256
;3256:			s = va( "%s vs %s", ci1->name, ci2->name );
ADDRGP4 $2222
ARGP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
ASGNP4
line 3261
;3257:#ifndef MISSIONPACK
;3258:			w = CG_Text_Width(s, 0.6f, 0);
;3259:			CG_Text_Paint(320 - w / 2, 60, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;3260:#else
;3261:			w = CG_DrawStrlen( s );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 44
INDIRI4
ASGNI4
line 3262
;3262:			if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 16
INDIRI4
CNSTI4 20
LEI4 $2223
line 3263
;3263:				cw = 640 / w;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
DIVI4
ASGNI4
line 3264
;3264:			} else {
ADDRGP4 $2224
JUMPV
LABELV $2223
line 3265
;3265:				cw = GIANT_WIDTH;
ADDRLP4 12
CNSTI4 32
ASGNI4
line 3266
;3266:			}
LABELV $2224
line 3267
;3267:			CG_DrawStringExt( 320 - w * cw/2, 20,s, colorWhite,
CNSTI4 320
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTF4 1069547520
ADDRLP4 12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 3270
;3268:					qfalse, qtrue, cw, (int)(cw * 1.5f), 0 );
;3269:#endif
;3270:		}
line 3271
;3271:	} else {
ADDRGP4 $2204
JUMPV
LABELV $2203
line 3272
;3272:		if ( cgs.gametype == GT_SANDBOX ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 0
NEI4 $2225
line 3273
;3273:			if(cl_language.integer == 0){s = "Sandbox";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2228
ADDRLP4 8
ADDRGP4 $2231
ASGNP4
LABELV $2228
line 3274
;3274:			if(cl_language.integer == 1){s = "Песочница";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2226
ADDRLP4 8
ADDRGP4 $2235
ASGNP4
line 3275
;3275:		} else if ( cgs.gametype == GT_FFA ) {
ADDRGP4 $2226
JUMPV
LABELV $2225
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 1
NEI4 $2236
line 3276
;3276:			if(cl_language.integer == 0){s = "Free For All";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2239
ADDRLP4 8
ADDRGP4 $2242
ASGNP4
LABELV $2239
line 3277
;3277:			if(cl_language.integer == 1){s = "Все Против Всех";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2237
ADDRLP4 8
ADDRGP4 $2246
ASGNP4
line 3278
;3278:		} else if ( cgs.gametype == GT_SINGLE ) {
ADDRGP4 $2237
JUMPV
LABELV $2236
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
NEI4 $2247
line 3279
;3279:			if(cl_language.integer == 0){s = "Single Player";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2250
ADDRLP4 8
ADDRGP4 $2253
ASGNP4
LABELV $2250
line 3280
;3280:			if(cl_language.integer == 1){s = "Одиночная Игра";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2248
ADDRLP4 8
ADDRGP4 $2257
ASGNP4
line 3281
;3281:		} else if ( cgs.gametype == GT_TEAM ) {
ADDRGP4 $2248
JUMPV
LABELV $2247
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
NEI4 $2258
line 3282
;3282:			if(cl_language.integer == 0){s = "Team Deathmatch";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2261
ADDRLP4 8
ADDRGP4 $2264
ASGNP4
LABELV $2261
line 3283
;3283:			if(cl_language.integer == 1){s = "Командный Бой";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2259
ADDRLP4 8
ADDRGP4 $2268
ASGNP4
line 3284
;3284:		} else if ( cgs.gametype == GT_CTF ) {
ADDRGP4 $2259
JUMPV
LABELV $2258
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
NEI4 $2269
line 3285
;3285:			if(cl_language.integer == 0){s = "Capture the Flag";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2272
ADDRLP4 8
ADDRGP4 $2275
ASGNP4
LABELV $2272
line 3286
;3286:			if(cl_language.integer == 1){s = "Захват флага";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2270
ADDRLP4 8
ADDRGP4 $2279
ASGNP4
line 3287
;3287:		} else if ( cgs.gametype == GT_ELIMINATION ) {
ADDRGP4 $2270
JUMPV
LABELV $2269
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 9
NEI4 $2280
line 3288
;3288:			if(cl_language.integer == 0){s = "Elimination";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2283
ADDRLP4 8
ADDRGP4 $2286
ASGNP4
LABELV $2283
line 3289
;3289:			if(cl_language.integer == 1){s = "Устранение";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2281
ADDRLP4 8
ADDRGP4 $2290
ASGNP4
line 3290
;3290:		} else if ( cgs.gametype == GT_CTF_ELIMINATION ) {
ADDRGP4 $2281
JUMPV
LABELV $2280
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
NEI4 $2291
line 3291
;3291:			if(cl_language.integer == 0){s = "CTF Elimination";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2294
ADDRLP4 8
ADDRGP4 $2297
ASGNP4
LABELV $2294
line 3292
;3292:			if(cl_language.integer == 1){s = "CTF Устранение";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2292
ADDRLP4 8
ADDRGP4 $2301
ASGNP4
line 3293
;3293:		} else if ( cgs.gametype == GT_LMS ) {
ADDRGP4 $2292
JUMPV
LABELV $2291
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 11
NEI4 $2302
line 3294
;3294:			if(cl_language.integer == 0){s = "Last Man Standing";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2305
ADDRLP4 8
ADDRGP4 $2308
ASGNP4
LABELV $2305
line 3295
;3295:			if(cl_language.integer == 1){s = "Последний оставшийся";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2303
ADDRLP4 8
ADDRGP4 $2312
ASGNP4
line 3296
;3296:		} else if ( cgs.gametype == GT_DOUBLE_D ) {
ADDRGP4 $2303
JUMPV
LABELV $2302
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 12
NEI4 $2313
line 3297
;3297:			if(cl_language.integer == 0){s = "Double Domination";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2316
ADDRLP4 8
ADDRGP4 $2319
ASGNP4
LABELV $2316
line 3298
;3298:			if(cl_language.integer == 1){s = "Двойное доминирование";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2314
ADDRLP4 8
ADDRGP4 $2323
ASGNP4
line 3299
;3299:		} else if ( cgs.gametype == GT_1FCTF ) {
ADDRGP4 $2314
JUMPV
LABELV $2313
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $2324
line 3300
;3300:			if(cl_language.integer == 0){s = "One Flag CTF";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2327
ADDRLP4 8
ADDRGP4 $2330
ASGNP4
LABELV $2327
line 3301
;3301:			if(cl_language.integer == 1){s = "Один Флаг";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2325
ADDRLP4 8
ADDRGP4 $2334
ASGNP4
line 3302
;3302:		} else if ( cgs.gametype == GT_OBELISK ) {
ADDRGP4 $2325
JUMPV
LABELV $2324
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 7
NEI4 $2335
line 3303
;3303:			if(cl_language.integer == 0){s = "Overload";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2338
ADDRLP4 8
ADDRGP4 $2341
ASGNP4
LABELV $2338
line 3304
;3304:			if(cl_language.integer == 1){s = "Атака Базы";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2336
ADDRLP4 8
ADDRGP4 $2345
ASGNP4
line 3305
;3305:		} else if ( cgs.gametype == GT_HARVESTER ) {
ADDRGP4 $2336
JUMPV
LABELV $2335
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
NEI4 $2346
line 3306
;3306:			if(cl_language.integer == 0){s = "Harvester";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2349
ADDRLP4 8
ADDRGP4 $2352
ASGNP4
LABELV $2349
line 3307
;3307:			if(cl_language.integer == 1){s = "Жнец";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2347
ADDRLP4 8
ADDRGP4 $2356
ASGNP4
line 3308
;3308:        } else if ( cgs.gametype == GT_DOMINATION ) {
ADDRGP4 $2347
JUMPV
LABELV $2346
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 13
NEI4 $2357
line 3309
;3309:			if(cl_language.integer == 0){s = "Domination";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2360
ADDRLP4 8
ADDRGP4 $2363
ASGNP4
LABELV $2360
line 3310
;3310:			if(cl_language.integer == 1){s = "Доминирование";}
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2358
ADDRLP4 8
ADDRGP4 $2367
ASGNP4
line 3311
;3311:		} else {
ADDRGP4 $2358
JUMPV
LABELV $2357
line 3312
;3312:			s = "";
ADDRLP4 8
ADDRGP4 $2368
ASGNP4
line 3313
;3313:		}
LABELV $2358
LABELV $2347
LABELV $2336
LABELV $2325
LABELV $2314
LABELV $2303
LABELV $2292
LABELV $2281
LABELV $2270
LABELV $2259
LABELV $2248
LABELV $2237
LABELV $2226
line 3318
;3314:#ifndef MISSIONPACK
;3315:		w = CG_Text_Width(s, 0.6f, 0);
;3316:		CG_Text_Paint(320 - w / 2, 90, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;3317:#else
;3318:		w = CG_DrawStrlen( s );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 3319
;3319:		if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 16
INDIRI4
CNSTI4 20
LEI4 $2369
line 3320
;3320:			cw = 640 / w;
ADDRLP4 12
CNSTI4 640
ADDRLP4 16
INDIRI4
DIVI4
ASGNI4
line 3321
;3321:		} else {
ADDRGP4 $2370
JUMPV
LABELV $2369
line 3322
;3322:			cw = GIANT_WIDTH;
ADDRLP4 12
CNSTI4 32
ASGNI4
line 3323
;3323:		}
LABELV $2370
line 3324
;3324:		CG_DrawStringExt( 320 - w * cw/2, 25,s, colorWhite,
CNSTI4 320
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 25
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTF4 1066192077
ADDRLP4 12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 3327
;3325:				qfalse, qtrue, cw, (int)(cw * 1.1f), 0 );
;3326:#endif
;3327:	}
LABELV $2204
line 3329
;3328:
;3329:	sec = ( sec - cg.time ) / 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 3330
;3330:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2372
line 3331
;3331:		cg.warmup = 0;
ADDRGP4 cg+1952944
CNSTI4 0
ASGNI4
line 3332
;3332:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3333
;3333:	}
LABELV $2372
line 3334
;3334:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2375
line 3335
;3335:	s = va( "Starts in: %i", sec + 1 );
ADDRGP4 $2378
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 3336
;3336:}
LABELV $2375
line 3337
;3337:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2379
line 3338
;3338:	s = va( "Старт через: %i", sec + 1 );
ADDRGP4 $2382
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 3339
;3339:}
LABELV $2379
line 3340
;3340:	if ( sec != cg.warmupCount ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+1952948
INDIRI4
EQI4 $2383
line 3341
;3341:		cg.warmupCount = sec;
ADDRGP4 cg+1952948
ADDRLP4 4
INDIRI4
ASGNI4
line 3342
;3342:		switch ( sec ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2389
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $2392
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $2395
ADDRGP4 $2388
JUMPV
LABELV $2389
line 3344
;3343:		case 0:
;3344:			trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+956380+2424
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3345
;3345:			break;
ADDRGP4 $2388
JUMPV
LABELV $2392
line 3347
;3346:		case 1:
;3347:			trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+956380+2420
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3348
;3348:			break;
ADDRGP4 $2388
JUMPV
LABELV $2395
line 3350
;3349:		case 2:
;3350:			trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+956380+2416
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3351
;3351:			break;
line 3353
;3352:		default:
;3353:			break;
LABELV $2388
line 3355
;3354:		}
;3355:	}
LABELV $2383
line 3356
;3356:	scale = 0.45f;
ADDRLP4 28
CNSTF4 1055286886
ASGNF4
line 3357
;3357:	switch ( cg.warmupCount ) {
ADDRLP4 32
ADDRGP4 cg+1952948
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2401
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $2402
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $2403
ADDRGP4 $2398
JUMPV
LABELV $2401
line 3359
;3358:	case 0:
;3359:		cw = 28;
ADDRLP4 12
CNSTI4 28
ASGNI4
line 3360
;3360:		scale = 0.54f;
ADDRLP4 28
CNSTF4 1057635697
ASGNF4
line 3361
;3361:		break;
ADDRGP4 $2399
JUMPV
LABELV $2402
line 3363
;3362:	case 1:
;3363:		cw = 24;
ADDRLP4 12
CNSTI4 24
ASGNI4
line 3364
;3364:		scale = 0.51f;
ADDRLP4 28
CNSTF4 1057132380
ASGNF4
line 3365
;3365:		break;
ADDRGP4 $2399
JUMPV
LABELV $2403
line 3367
;3366:	case 2:
;3367:		cw = 20;
ADDRLP4 12
CNSTI4 20
ASGNI4
line 3368
;3368:		scale = 0.48f;
ADDRLP4 28
CNSTF4 1056293519
ASGNF4
line 3369
;3369:		break;
ADDRGP4 $2399
JUMPV
LABELV $2398
line 3371
;3370:	default:
;3371:		cw = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 3372
;3372:		scale = 0.45f;
ADDRLP4 28
CNSTF4 1055286886
ASGNF4
line 3373
;3373:		break;
LABELV $2399
line 3380
;3374:	}
;3375:
;3376:#ifndef MISSIONPACK
;3377:		w = CG_Text_Width(s, scale, 0);
;3378:		CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;3379:#else
;3380:	w = CG_DrawStrlen( s );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRI4
ASGNI4
line 3381
;3381:	CG_DrawStringExt( 320 - w * cw/2, 70, s, colorWhite,
CNSTI4 320
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ARGI4
CNSTI4 70
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTF4 1069547520
ADDRLP4 12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 3384
;3382:			qfalse, qtrue, cw, (int)(cw * 1.5), 0 );
;3383:#endif
;3384:}
LABELV $2187
endproc CG_DrawWarmup 56 36
proc CG_DrawDeathMessage 4 16
line 3395
;3385:
;3386://==================================================================================
;3387:
;3388:/*
;3389:=================
;3390:CG_DrawLetterbox
;3391:
;3392:Draws letterbox bars at top and bottom of screen
;3393:=================
;3394:*/
;3395:static void CG_DrawDeathMessage( void ) {
line 3396
;3396:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $2405
line 3397
;3397:	CG_DrawSmallString((640 - (SMALLCHAR_WIDTH * strlen( "Press fire key to respawn" ))) / 2, 480 - (BIGCHAR_HEIGHT * 2), "Press fire key to respawn", 1.0);
ADDRGP4 $2409
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
CNSTI4 640
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
SUBI4
CNSTI4 2
DIVI4
ARGI4
CNSTI4 480
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 1
LSHI4
SUBI4
ARGI4
ADDRGP4 $2409
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 3398
;3398:	}
LABELV $2405
line 3399
;3399:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $2411
line 3400
;3400:	CG_DrawSmallString((640 - (SMALLCHAR_WIDTH * strlen( "Нажмите кнопку стрельбы для респавна" )*0.5)) / 2, 480 - (BIGCHAR_HEIGHT * 2), "Нажмите кнопку стрельбы для респавна", 1.0);
ADDRGP4 $2415
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
CNSTF4 1142947840
CNSTF4 1056964608
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CVIF4 4
MULF4
SUBF4
CNSTF4 1073741824
DIVF4
CVFI4 4
ARGI4
CNSTI4 480
ADDRGP4 cl_bigcharheight+12
INDIRI4
CNSTI4 1
LSHI4
SUBI4
ARGI4
ADDRGP4 $2415
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawSmallString
CALLV
pop
line 3401
;3401:	}
LABELV $2411
line 3402
;3402:}
LABELV $2404
endproc CG_DrawDeathMessage 4 16
proc CG_DrawLetterbox 24 20
line 3412
;3403:
;3404:/*
;3405:=================
;3406:CG_DrawLetterbox
;3407:
;3408:Draws letterbox bars at top and bottom of screen
;3409:cg_letterBoxSize determines the size of the black bars. Default is 80, 0 removes letterbox effect.
;3410:=================
;3411:*/
;3412:static void CG_DrawLetterbox( void ) {
line 3416
;3413:	float letterboxSize;
;3414:	vec4_t color;
;3415:
;3416:	if ( cg_letterBoxSize.value == 0 )		//draw no letterbox
ADDRGP4 cg_letterBoxSize+8
INDIRF4
CNSTF4 0
NEF4 $2418
line 3417
;3417:		return;
ADDRGP4 $2417
JUMPV
LABELV $2418
line 3420
;3418:
;3419:	// draw letterbox borders
;3420:	if ( cg.snap->ps.pm_type == PM_CUTSCENE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 7
NEI4 $2421
line 3421
;3421:		letterboxSize = cg_letterBoxSize.value;
ADDRLP4 16
ADDRGP4 cg_letterBoxSize+8
INDIRF4
ASGNF4
line 3422
;3422:		color[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 3423
;3423:		color[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 3424
;3424:		color[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 3425
;3425:		color[3] = 1;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 3426
;3426:		CG_FillRect(0-(cl_screenoffset.integer+2), 0, 640+(cl_screenoffset.integer*2)+4, letterboxSize, color);
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 2
ADDI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 640
ADDI4
CNSTI4 4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 3427
;3427:		CG_FillRect(0-(cl_screenoffset.integer+2), 480 - letterboxSize, 640+(cl_screenoffset.integer*2)+4, letterboxSize, color);
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 2
ADDI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
CNSTF4 1139802112
ADDRLP4 20
INDIRF4
SUBF4
ARGF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 640
ADDI4
CNSTI4 4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 3428
;3428:	}
LABELV $2421
line 3429
;3429:}
LABELV $2417
endproc CG_DrawLetterbox 24 20
export CG_FadeLevelStart
proc CG_FadeLevelStart 48 12
line 3438
;3430:
;3431:/*
;3432:=================
;3433:CG_FadeLevelStart
;3434:
;3435:Handles the fade at the start of a map
;3436:=================
;3437:*/
;3438:void CG_FadeLevelStart( void ) {
line 3445
;3439:	vec4_t colorStart;
;3440:	vec4_t colorEnd;
;3441:	int i;
;3442:	const char *s;
;3443:
;3444:	//calculate the fade
;3445:	if ( cg.levelFadeStatus == LFS_LEVELLOADED ) {
ADDRGP4 cg+1987508
INDIRI4
CNSTI4 0
NEI4 $2433
line 3446
;3446:		for (i = 0; i < 4; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2436
line 3447
;3447:			colorStart[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTF4 0
ASGNF4
line 3448
;3448:		}
LABELV $2437
line 3446
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2436
line 3450
;3449:
;3450:		s = CG_ConfigString( CS_MESSAGE );
CNSTI4 3
ARGI4
ADDRLP4 40
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 40
INDIRP4
ASGNP4
line 3452
;3451:
;3452:		if ( strlen(s) == 0 ) {			//there is no message so don't do a blackout
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $2440
line 3453
;3453:			cg.levelFadeStatus = LFS_FADEIN;
ADDRGP4 cg+1987508
CNSTI4 2
ASGNI4
line 3454
;3454:			Vector4Copy(colorStart, colorEnd);
ADDRLP4 20
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 4+4
INDIRF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 4+8
INDIRF4
ASGNF4
ADDRLP4 20+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 3455
;3455:			colorStart[3] = 1;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 3456
;3456:			CG_Fade( (FADEIN_TIME / 1000), colorStart, colorEnd );
CNSTF4 1056964608
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_Fade
CALLV
pop
line 3457
;3457:		} else {
ADDRGP4 $2434
JUMPV
LABELV $2440
line 3458
;3458:			cg.levelFadeStatus = LFS_BLACKOUT;
ADDRGP4 cg+1987508
CNSTI4 1
ASGNI4
line 3459
;3459:			colorStart[3] = 1;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 3460
;3460:			Vector4Copy(colorStart, colorEnd);
ADDRLP4 20
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 4+4
INDIRF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 4+8
INDIRF4
ASGNF4
ADDRLP4 20+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 3461
;3461:			CG_Fade( (BLACKOUT_TIME / 1000), colorStart, colorEnd );
CNSTF4 1036831949
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_Fade
CALLV
pop
line 3462
;3462:		}
line 3463
;3463:	} else if ( cg.levelFadeStatus == LFS_BLACKOUT && cg.fadeStartTime + cg.fadeDuration < cg.time ) {
ADDRGP4 $2434
JUMPV
LABELV $2433
ADDRGP4 cg+1987508
INDIRI4
CNSTI4 1
NEI4 $2458
ADDRGP4 cg+1987516
INDIRI4
CVIF4 4
ADDRGP4 cg+1987520
INDIRF4
ADDF4
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
GEF4 $2458
line 3464
;3464:		for (i = 0; i < 4; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2464
line 3465
;3465:			colorStart[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTF4 0
ASGNF4
line 3466
;3466:		}
LABELV $2465
line 3464
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2464
line 3468
;3467:
;3468:		cg.levelFadeStatus = LFS_FADEIN;
ADDRGP4 cg+1987508
CNSTI4 2
ASGNI4
line 3469
;3469:		Vector4Copy(colorStart, colorEnd);
ADDRLP4 20
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 4+4
INDIRF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 4+8
INDIRF4
ASGNF4
ADDRLP4 20+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 3470
;3470:		colorStart[3] = 1;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 3471
;3471:		CG_Fade( (FADEIN_TIME / 1000), colorStart, colorEnd );
CNSTF4 1056964608
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_Fade
CALLV
pop
line 3472
;3472:	}
LABELV $2458
LABELV $2434
line 3473
;3473:}
LABELV $2432
endproc CG_FadeLevelStart 48 12
export CG_MessageLevelStart
proc CG_MessageLevelStart 40 16
line 3482
;3474:
;3475:/*
;3476:=================
;3477:CG_MessageLevelStart
;3478:
;3479:Draws the level's message to the screen at the start of the level
;3480:=================
;3481:*/
;3482:void CG_MessageLevelStart( void ) {
line 3486
;3483:	const char *s;
;3484:	vec4_t color;
;3485:
;3486:	if ( cg.time < cg.levelStartTime + TITLE_TIME + TITLE_FADEIN_TIME + TITLE_FADEOUT_TIME) {
ADDRLP4 20
CNSTF4 1148846080
ASGNF4
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
ADDRGP4 cg+1987512
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ADDRLP4 20
INDIRF4
ADDF4
ADDRLP4 20
INDIRF4
ADDF4
GEF4 $2477
line 3489
;3487:		int len;
;3488:
;3489:		s = CG_ConfigString( CS_MESSAGE );
CNSTI4 3
ARGI4
ADDRLP4 28
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 3490
;3490:		len = strlen( s );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 32
INDIRI4
ASGNI4
line 3491
;3491:		if ( len == 0 )
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2481
line 3492
;3492:			return;
ADDRGP4 $2476
JUMPV
LABELV $2481
line 3494
;3493:
;3494:		color[0] = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 3495
;3495:		color[1] = 1;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 3496
;3496:		color[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 3497
;3497:		if ( cg.time < cg.levelStartTime + TITLE_FADEIN_TIME ){
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
ADDRGP4 cg+1987512
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDF4
GEF4 $2485
line 3498
;3498:			color[3] = (cg.time - cg.levelStartTime) / TITLE_FADEIN_TIME;
ADDRLP4 0+12
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1987512
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 3499
;3499:		}
ADDRGP4 $2486
JUMPV
LABELV $2485
line 3500
;3500:		else if ( cg.time < cg.levelStartTime + TITLE_TIME + TITLE_FADEIN_TIME )
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
ADDRGP4 cg+1987512
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
CNSTF4 1148846080
ADDF4
GEF4 $2492
line 3501
;3501:			color[3] = 1;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
ADDRGP4 $2493
JUMPV
LABELV $2492
line 3503
;3502:		else
;3503:			color[3] = (TITLE_FADEOUT_TIME - ((cg.time - cg.levelStartTime) - (TITLE_FADEIN_TIME + TITLE_TIME))) / TITLE_FADEOUT_TIME;
ADDRLP4 36
CNSTF4 1148846080
ASGNF4
ADDRLP4 0+12
ADDRLP4 36
INDIRF4
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1987512
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1159479296
SUBF4
SUBF4
ADDRLP4 36
INDIRF4
DIVF4
ASGNF4
LABELV $2493
LABELV $2486
line 3505
;3504:
;3505:		len *= BIGCHAR_WIDTH;
ADDRLP4 24
ADDRLP4 24
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
ASGNI4
line 3506
;3506:		CG_DrawBigStringColor( 640 - len - 32 + cl_screenoffset.integer, 360, s, color );
CNSTI4 640
ADDRLP4 24
INDIRI4
SUBI4
CNSTI4 32
SUBI4
ADDRGP4 cl_screenoffset+12
INDIRI4
ADDI4
ARGI4
CNSTI4 360
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawBigStringColor
CALLV
pop
line 3507
;3507:	}
LABELV $2477
line 3508
;3508:}
LABELV $2476
endproc CG_MessageLevelStart 40 16
export CG_Fade
proc CG_Fade 0 0
line 3517
;3509:
;3510:/*
;3511:=================
;3512:CG_Fade
;3513:
;3514:Initializes a fade
;3515:=================
;3516:*/
;3517:void CG_Fade( float duration, vec4_t startColor, vec4_t endColor ) {
line 3518
;3518:	cg.fadeStartTime = cg.time;
ADDRGP4 cg+1987516
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 3519
;3519:	if (duration < 0)
ADDRFP4 0
INDIRF4
CNSTF4 0
GEF4 $2505
line 3520
;3520:		cg.fadeDuration = 0;
ADDRGP4 cg+1987520
CNSTF4 0
ASGNF4
ADDRGP4 $2506
JUMPV
LABELV $2505
line 3522
;3521:	else
;3522:		cg.fadeDuration = duration * 1000;
ADDRGP4 cg+1987520
CNSTF4 1148846080
ADDRFP4 0
INDIRF4
MULF4
ASGNF4
LABELV $2506
line 3523
;3523:	Vector4Copy(startColor, cg.fadeStartColor);
ADDRGP4 cg+1987524
ADDRFP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRGP4 cg+1987524+4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRGP4 cg+1987524+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRGP4 cg+1987524+12
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 3524
;3524:	Vector4Copy(endColor, cg.fadeEndColor);
ADDRGP4 cg+1987540
ADDRFP4 8
INDIRP4
INDIRF4
ASGNF4
ADDRGP4 cg+1987540+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRGP4 cg+1987540+8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRGP4 cg+1987540+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 3525
;3525:}
LABELV $2502
endproc CG_Fade 0 0
export CG_DrawFade
proc CG_DrawFade 28 20
line 3534
;3526:
;3527:/*
;3528:=================
;3529:CG_DrawFade
;3530:
;3531:Draws fade in or fade out
;3532:=================
;3533:*/
;3534:void CG_DrawFade( void ) {
line 3541
;3535:	vec4_t	colorDiff;
;3536:	int		timePassed;
;3537:	float	progress;
;3538:	float	colorValue;
;3539:
;3540:	//if no start color was defined, do nothing
;3541:	if (!cg.fadeStartColor)
ADDRGP4 cg+1987524
CVPU4 4
CNSTU4 0
NEU4 $2524
line 3542
;3542:		return;
ADDRGP4 $2523
JUMPV
LABELV $2524
line 3544
;3543:
;3544:	if (cg.fadeStartTime + cg.fadeDuration < cg.time) {
ADDRGP4 cg+1987516
INDIRI4
CVIF4 4
ADDRGP4 cg+1987520
INDIRF4
ADDF4
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
GEF4 $2527
line 3547
;3545:		//time has progressed beyond the duration of the fade
;3546:
;3547:		if (cg.fadeEndColor[3] == 0)	//end of the fade is fully transparent, so don't bother calling CG_FillRect
ADDRGP4 cg+1987540+12
INDIRF4
CNSTF4 0
NEF4 $2532
line 3548
;3548:			return;
ADDRGP4 $2523
JUMPV
LABELV $2532
line 3551
;3549:
;3550:		//simply draw the end color now
;3551:		CG_FillRect(0 - (cl_screenoffset.integer+2), 0, 640 + (cl_screenoffset.integer*2)+4, 480, cg.fadeEndColor);
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 2
ADDI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 640
ADDI4
CNSTI4 4
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cg+1987540
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 3552
;3552:		return;
ADDRGP4 $2523
JUMPV
LABELV $2527
line 3556
;3553:	}
;3554:
;3555:	//calculate how far we are into the fade
;3556:	timePassed = cg.time - cg.fadeStartTime;
ADDRLP4 20
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1987516
INDIRI4
SUBI4
ASGNI4
line 3557
;3557:	if ( cg.fadeDuration == 0 )
ADDRGP4 cg+1987520
INDIRF4
CNSTF4 0
NEF4 $2541
line 3558
;3558:		progress = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRGP4 $2542
JUMPV
LABELV $2541
line 3560
;3559:	else
;3560:		progress = timePassed / cg.fadeDuration;
ADDRLP4 16
ADDRLP4 20
INDIRI4
CVIF4 4
ADDRGP4 cg+1987520
INDIRF4
DIVF4
ASGNF4
LABELV $2542
line 3563
;3561:
;3562:	//calculate the new colors
;3563:	Vector4Subtract(cg.fadeStartColor, cg.fadeEndColor, colorDiff);
ADDRLP4 0
ADDRGP4 cg+1987524
INDIRF4
ADDRGP4 cg+1987540
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 cg+1987524+4
INDIRF4
ADDRGP4 cg+1987540+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 cg+1987524+8
INDIRF4
ADDRGP4 cg+1987540+8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12
ADDRGP4 cg+1987524+12
INDIRF4
ADDRGP4 cg+1987540+12
INDIRF4
SUBF4
ASGNF4
line 3564
;3564:	Vector4Scale(colorDiff, progress, colorDiff);
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 Vector4Scale
CALLV
pop
line 3565
;3565:	Vector4Subtract(cg.fadeStartColor, colorDiff, colorDiff);
ADDRLP4 0
ADDRGP4 cg+1987524
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 cg+1987524+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 cg+1987524+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+12
ADDRGP4 cg+1987524+12
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
line 3568
;3566:
;3567:	//draw the fade color over the screen
;3568:	CG_FillRect(0 - (cl_screenoffset.integer+2), 0, 640 + (cl_screenoffset.integer*2)+4, 480, colorDiff);
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 2
ADDI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cl_screenoffset+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 640
ADDI4
CNSTI4 4
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 3569
;3569:}
LABELV $2523
endproc CG_DrawFade 28 20
export CG_DrawTimedMenus
proc CG_DrawTimedMenus 4 8
line 3578
;3570:
;3571://==================================================================================
;3572:#ifdef MISSIONPACK
;3573:/*
;3574:=================
;3575:CG_DrawTimedMenus
;3576:=================
;3577:*/
;3578:void CG_DrawTimedMenus( void ) {
line 3579
;3579:	if (cg.voiceTime) {
ADDRGP4 cg+1952708
INDIRI4
CNSTI4 0
EQI4 $2578
line 3580
;3580:		int t = cg.time - cg.voiceTime;
ADDRLP4 0
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1952708
INDIRI4
SUBI4
ASGNI4
line 3581
;3581:		if ( t > 2500 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2500
LEI4 $2583
line 3582
;3582:			Menus_CloseByName("voiceMenu");
ADDRGP4 $2585
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 3583
;3583:			trap_Cvar_Set("cl_conXOffset", "0");
ADDRGP4 $2586
ARGP4
ADDRGP4 $2587
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3584
;3584:			cg.voiceTime = 0;
ADDRGP4 cg+1952708
CNSTI4 0
ASGNI4
line 3585
;3585:		}
LABELV $2583
line 3586
;3586:	}
LABELV $2578
line 3587
;3587:}
LABELV $2577
endproc CG_DrawTimedMenus 4 8
proc CG_DrawOverlay 20 20
line 3595
;3588:#endif
;3589:
;3590:/*
;3591:=================
;3592:CG_DrawOverlay
;3593:=================
;3594:*/
;3595:static void CG_DrawOverlay( void ) {
line 3599
;3596:	const char *overlay;
;3597:
;3598:	// draw overlay set by target_effect
;3599:	overlay = CG_ConfigString( CS_OVERLAY );
CNSTI4 8610
ARGI4
ADDRLP4 4
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 3600
;3600:	if ( strlen(overlay) && cgs.media.effectOverlay )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $2590
ADDRGP4 cgs+956380+1776
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $2590
line 3601
;3601:		CG_DrawPic( 0 - (cl_screenoffset.integer+1), 0, SCREEN_WIDTH + (cl_screenoffset.integer*2)+2, SCREEN_HEIGHT, cgs.media.effectOverlay );
ADDRLP4 16
CNSTI4 1
ASGNI4
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cl_screenoffset+12
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
CNSTI4 640
ADDI4
CNSTI4 2
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+956380+1776
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $2590
line 3602
;3602:}
LABELV $2589
endproc CG_DrawOverlay 20 20
proc CG_DrawPostProcess 16 20
line 3609
;3603:
;3604:/*
;3605:=================
;3606:CG_DrawPostProcess
;3607:=================
;3608:*/
;3609:static void CG_DrawPostProcess( void ) {
line 3611
;3610:
;3611:	if ( strlen(cg_postprocess.string) ) {
ADDRGP4 cg_postprocess+16
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2599
line 3612
;3612:		cgs.media.postProcess = trap_R_RegisterShaderNoMip( cg_postprocess.string );
ADDRGP4 cg_postprocess+16
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1780
ADDRLP4 4
INDIRI4
ASGNI4
line 3613
;3613:	} else {
ADDRGP4 $2600
JUMPV
LABELV $2599
line 3614
;3614:		cgs.media.postProcess = 0;
ADDRGP4 cgs+956380+1780
CNSTI4 0
ASGNI4
line 3615
;3615:	}
LABELV $2600
line 3617
;3616:	// draw postprocess
;3617:	if ( strlen(cg_postprocess.string) && cgs.media.postProcess )
ADDRGP4 cg_postprocess+16
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2607
ADDRGP4 cgs+956380+1780
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2607
line 3618
;3618:		CG_DrawPic( 0 - (cl_screenoffset.integer+1), 0, SCREEN_WIDTH + (cl_screenoffset.integer*2)+2, SCREEN_HEIGHT, cgs.media.postProcess );
ADDRLP4 12
CNSTI4 1
ASGNI4
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cl_screenoffset+12
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
CNSTI4 640
ADDI4
CNSTI4 2
ADDI4
CVIF4 4
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 cgs+956380+1780
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $2607
line 3619
;3619:}
LABELV $2598
endproc CG_DrawPostProcess 16 20
proc CG_Draw2D 100 28
line 3628
;3620:
;3621:
;3622:/*
;3623:=================
;3624:CG_Draw2D
;3625:=================
;3626:*/
;3627:static void CG_Draw2D(stereoFrame_t stereoFrame)
;3628:{
line 3630
;3629:#ifdef MISSIONPACK
;3630:	if (cgs.orderPending && cg.time > cgs.orderTime) {
ADDRGP4 cgs+956324
INDIRI4
CNSTI4 0
EQI4 $2617
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cgs+956328
INDIRI4
LEI4 $2617
line 3631
;3631:		CG_CheckOrderPending();
ADDRGP4 CG_CheckOrderPending
CALLV
pop
line 3632
;3632:	}
LABELV $2617
line 3635
;3633:#endif
;3634:	// if we are taking a levelshot for the menu, don't draw anything
;3635:	if ( cg.levelShot ) {
ADDRGP4 cg+12
INDIRI4
CNSTI4 0
EQI4 $2622
line 3636
;3636:		return;
ADDRGP4 $2616
JUMPV
LABELV $2622
line 3639
;3637:	}
;3638:
;3639:	if ( cg.snap->ps.pm_type == PM_CUTSCENE )
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 7
NEI4 $2625
line 3640
;3640:		return;
ADDRGP4 $2616
JUMPV
LABELV $2625
line 3642
;3641:	
;3642:	if ( cg_draw2D.integer == 0 ) {
ADDRGP4 cg_draw2D+12
INDIRI4
CNSTI4 0
NEI4 $2628
line 3643
;3643:		return;
ADDRGP4 $2616
JUMPV
LABELV $2628
line 3647
;3644:	}
;3645:
;3646:
;3647:	if (cg_newConsole.integer) {
ADDRGP4 cg_newConsole+12
INDIRI4
CNSTI4 0
EQI4 $2631
line 3648
;3648:		float consoleSizeY = CG_ConsoleAdjustSizeY(cg_consoleSizeY.value);
ADDRGP4 cg_consoleSizeY+8
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 CG_ConsoleAdjustSizeY
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 48
INDIRF4
ASGNF4
line 3649
;3649:		float consoleSizeX = CG_ConsoleAdjustSizeX(cg_consoleSizeX.value);
ADDRGP4 cg_consoleSizeX+8
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 CG_ConsoleAdjustSizeX
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 52
INDIRF4
ASGNF4
line 3650
;3650:		float chatSizeY = CG_ConsoleAdjustSizeY(cg_chatSizeY.value);
ADDRGP4 cg_chatSizeY+8
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 CG_ConsoleAdjustSizeY
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 56
INDIRF4
ASGNF4
line 3651
;3651:		float chatSizeX = CG_ConsoleAdjustSizeX(cg_chatSizeX.value);
ADDRGP4 cg_chatSizeX+8
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 CG_ConsoleAdjustSizeX
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 60
INDIRF4
ASGNF4
line 3652
;3652:		float teamChatSizeY = CG_ConsoleAdjustSizeY(cg_teamChatSizeY.value);
ADDRGP4 cg_teamChatSizeY+8
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 CG_ConsoleAdjustSizeY
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 64
INDIRF4
ASGNF4
line 3653
;3653:		float teamChatSizeX = CG_ConsoleAdjustSizeX(cg_teamChatSizeX.value);
ADDRGP4 cg_teamChatSizeX+8
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 CG_ConsoleAdjustSizeX
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 68
INDIRF4
ASGNF4
line 3655
;3654:
;3655:		int consoleLines = CG_GetChatHeight(cg_consoleLines.integer);
ADDRGP4 cg_consoleLines+12
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 CG_GetChatHeight
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 72
INDIRI4
ASGNI4
line 3656
;3656:		int commonConsoleLines = CG_GetChatHeight(cg_commonConsoleLines.integer);
ADDRGP4 cg_commonConsoleLines+12
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 CG_GetChatHeight
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 76
INDIRI4
ASGNI4
line 3657
;3657:		int chatLines = CG_GetChatHeight(cg_chatLines.integer);
ADDRGP4 cg_chatLines+12
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 CG_GetChatHeight
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 80
INDIRI4
ASGNI4
line 3658
;3658:		int teamChatLines = CG_GetChatHeight(cg_teamChatLines.integer);
ADDRGP4 cg_teamChatLines+12
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 CG_GetChatHeight
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 84
INDIRI4
ASGNI4
line 3660
;3659:
;3660:		int lowestChatPos = CG_ConsoleChatPositionY(consoleSizeY, chatSizeY) + chatLines * chatSizeY;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 CG_ConsoleChatPositionY
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 88
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 3663
;3661:		float f;
;3662:
;3663:		if (lowestChatPos > RATSB_HEADER-2) {
ADDRLP4 32
INDIRI4
CNSTI4 88
LEI4 $2644
line 3664
;3664:			f = (RATSB_HEADER-2.0)/lowestChatPos;
ADDRLP4 0
CNSTF4 1118830592
ADDRLP4 32
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 3665
;3665:			consoleSizeX *= f;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3666
;3666:			consoleSizeY *= f;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3667
;3667:			chatSizeX *= f;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3668
;3668:			chatSizeY *= f;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3669
;3669:			teamChatSizeX *= f;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3670
;3670:			teamChatSizeY *= f;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3671
;3671:		}
LABELV $2644
line 3672
;3672:		f = cg_fontScale.value;
ADDRLP4 0
ADDRGP4 cg_fontScale+8
INDIRF4
ASGNF4
line 3673
;3673:		consoleSizeX *= f;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3674
;3674:		consoleSizeY *= f;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3675
;3675:		chatSizeX *= f;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3676
;3676:		chatSizeY *= f;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3677
;3677:		teamChatSizeX *= f;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3678
;3678:		teamChatSizeY *= f;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3680
;3679:
;3680:			if(cgs.gametype != GT_SINGLE){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $2647
line 3681
;3681:			CG_DrawGenericConsole(&cgs.console, consoleLines, cg_consoleTime.integer, 
ADDRGP4 cgs+942540
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 cg_consoleTime+12
INDIRI4
ARGI4
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRI4
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 92
INDIRI4
ARGI4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 CG_DrawGenericConsole
CALLV
pop
line 3686
;3682:					0 - cl_screenoffset.integer, 0, 
;3683:					consoleSizeX,
;3684:					consoleSizeY
;3685:					);
;3686:			}
LABELV $2647
line 3687
;3687:			if(cgs.gametype != GT_SINGLE){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $2653
line 3688
;3688:			CG_DrawGenericConsole(&cgs.chat, chatLines, cg_chatTime.integer, 
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 CG_ConsoleChatPositionY
CALLI4
ASGNI4
ADDRGP4 cgs+946468
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 cg_chatTime+12
INDIRI4
ARGI4
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 92
INDIRI4
ADDRGP4 cg_chatY+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_DrawGenericConsole
CALLV
pop
line 3694
;3689:					0 - cl_screenoffset.integer, 
;3690:					CG_ConsoleChatPositionY(consoleSizeY, chatSizeY) - cg_chatY.integer,
;3691:					chatSizeX,
;3692:					chatSizeY
;3693:					);
;3694:			}
LABELV $2653
line 3695
;3695:			if(cgs.gametype != GT_SINGLE){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $2660
line 3696
;3696:			CG_DrawGenericConsole(&cgs.teamChat, teamChatLines, cg_teamChatTime.integer, 
ADDRGP4 cgs+950396
ARGP4
ADDRLP4 92
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
ARGI4
ADDRGP4 cg_teamChatTime+12
INDIRI4
ARGI4
CNSTI4 0
ADDRGP4 cl_screenoffset+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 96
ADDRLP4 12
INDIRF4
ASGNF4
ADDRGP4 cg_teamChatY+12
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRI4
CVIF4 4
ADDRLP4 96
INDIRF4
MULF4
SUBF4
CVFI4 4
ARGI4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRGP4 CG_DrawGenericConsole
CALLV
pop
line 3702
;3697:					0 - cl_screenoffset.integer, 
;3698:					cg_teamChatY.integer - teamChatLines*teamChatSizeY,
;3699:					teamChatSizeX,
;3700:					teamChatSizeY
;3701:				       	);
;3702:			}
LABELV $2660
line 3703
;3703:	}
LABELV $2631
line 3705
;3704:
;3705:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2667
line 3706
;3706:		CG_DrawSpectator();
ADDRGP4 CG_DrawSpectator
CALLV
pop
line 3708
;3707:
;3708:		if(stereoFrame == STEREO_CENTER)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $2670
line 3709
;3709:			CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
LABELV $2670
line 3710
;3710:		if(cgs.gametype != GT_SINGLE){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $2668
line 3711
;3711:		CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 3712
;3712:		}
line 3713
;3713:	} else {
ADDRGP4 $2668
JUMPV
LABELV $2667
line 3715
;3714:		// don't draw any status if dead or the scoreboard is being explicitly shown
;3715:		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0 ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+1888436
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $2675
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $2675
line 3717
;3716:
;3717:			CG_DrawProxWarning();
ADDRGP4 CG_DrawProxWarning
CALLV
pop
line 3718
;3718:			if(stereoFrame == STEREO_CENTER)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $2679
line 3719
;3719:				CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
LABELV $2679
line 3720
;3720:			if(cgs.gametype != GT_SINGLE){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $2681
line 3721
;3721:			CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 3722
;3722:			}
LABELV $2681
line 3724
;3723:
;3724:			CG_DrawPersistantPowerup();
ADDRGP4 CG_DrawPersistantPowerup
CALLV
pop
line 3725
;3725:		}
LABELV $2675
line 3727
;3726:
;3727:		if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $2684
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $2684
line 3728
;3728:			CG_DrawTeamInfo();
ADDRGP4 CG_DrawTeamInfo
CALLV
pop
line 3729
;3729:		}
LABELV $2684
line 3730
;3730:	}
LABELV $2668
line 3732
;3731:
;3732:	CG_DrawVote();
ADDRGP4 CG_DrawVote
CALLV
pop
line 3733
;3733:	CG_DrawTeamVote();
ADDRGP4 CG_DrawTeamVote
CALLV
pop
line 3735
;3734:
;3735:	CG_DrawUpperRight(stereoFrame);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawUpperRight
CALLV
pop
line 3737
;3736:
;3737:	CG_DrawLowerRight();
ADDRGP4 CG_DrawLowerRight
CALLV
pop
line 3738
;3738:	CG_DrawLowerLeft();
ADDRGP4 CG_DrawLowerLeft
CALLV
pop
line 3740
;3739:
;3740:	if ( !CG_DrawFollow() ) {
ADDRLP4 0
ADDRGP4 CG_DrawFollow
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2688
line 3741
;3741:		CG_DrawWarmup();
ADDRGP4 CG_DrawWarmup
CALLV
pop
line 3742
;3742:	}
LABELV $2688
line 3744
;3743:
;3744:	if ( !cg.scoreBoardShowing) {
ADDRGP4 cg+1888440
INDIRI4
CNSTI4 0
NEI4 $2690
line 3745
;3745:                CG_DrawCenterDDString();
ADDRGP4 CG_DrawCenterDDString
CALLV
pop
line 3746
;3746:                CG_DrawCenter1FctfString();
ADDRGP4 CG_DrawCenter1FctfString
CALLV
pop
line 3747
;3747:	}
LABELV $2690
line 3748
;3748:}
LABELV $2616
endproc CG_Draw2D 100 28
proc CG_DrawTourneyScoreboard 0 0
line 3751
;3749:
;3750:
;3751:static void CG_DrawTourneyScoreboard( void ) {
line 3756
;3752:#ifdef MISSIONPACK
;3753:#else
;3754:	CG_DrawOldTourneyScoreboard();
;3755:#endif
;3756:}
LABELV $2693
endproc CG_DrawTourneyScoreboard 0 0
export CG_DrawActive
proc CG_DrawActive 12 8
line 3765
;3757:
;3758:/*
;3759:=====================
;3760:CG_DrawActive
;3761:
;3762:Perform all drawing needed to completely fill the screen
;3763:=====================
;3764:*/
;3765:void CG_DrawActive( stereoFrame_t stereoView ) {
line 3767
;3766:	// optionally draw the info screen instead
;3767:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2695
line 3768
;3768:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 3769
;3769:		return;
ADDRGP4 $2694
JUMPV
LABELV $2695
line 3773
;3770:	}
;3771:
;3772:	// optionally draw the tournement scoreboard instead
;3773:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2698
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $2698
line 3774
;3774:		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
line 3775
;3775:		CG_DrawTourneyScoreboard();
ADDRGP4 CG_DrawTourneyScoreboard
CALLV
pop
line 3776
;3776:		return;
ADDRGP4 $2694
JUMPV
LABELV $2698
line 3780
;3777:	}
;3778:
;3779:	// clear around the rendered view if sized down
;3780:	CG_TileClear();
ADDRGP4 CG_TileClear
CALLV
pop
line 3782
;3781:
;3782:	if(cg.renderingThirdPerson)
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
EQI4 $2702
line 3783
;3783:		CG_DrawCrosshair3D();
ADDRGP4 CG_DrawCrosshair3D
CALLV
pop
LABELV $2702
line 3786
;3784:
;3785:	// apply earthquake effect
;3786:	CG_Earthquake();
ADDRGP4 CG_Earthquake
CALLI4
pop
line 3788
;3787:	
;3788:	CG_ReloadPlayers();
ADDRGP4 CG_ReloadPlayers
CALLV
pop
line 3791
;3789:
;3790:	// draw 3D view
;3791:	trap_R_RenderScene( &cg.refdef );
ADDRGP4 cg+1870616
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 3793
;3792:	
;3793:	if ( Q_stricmp (cgs.mapname, "maps/uimap_1.bsp") == 0 ) {
ADDRGP4 cgs+339076
ARGP4
ADDRGP4 $2709
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2706
line 3794
;3794:	if ( trap_Key_GetCatcher() == KEYCATCH_UI || trap_Key_GetCatcher() & KEYCATCH_CONSOLE) {
ADDRLP4 4
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $2712
ADDRLP4 8
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2710
LABELV $2712
line 3796
;3795:
;3796:	} else {
ADDRGP4 $2711
JUMPV
LABELV $2710
line 3797
;3797:	trap_SendConsoleCommand("ui_menu");
ADDRGP4 $2713
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 3798
;3798:	}
LABELV $2711
line 3799
;3799:	}
LABELV $2706
line 3802
;3800:
;3801:	// draw overlay for target_effect
;3802:	CG_DrawOverlay();
ADDRGP4 CG_DrawOverlay
CALLV
pop
line 3804
;3803:	
;3804:	CG_DrawPostProcess();
ADDRGP4 CG_DrawPostProcess
CALLV
pop
line 3807
;3805:
;3806:	// draw status bar and other floating elements
;3807: 	CG_Draw2D(stereoView);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Draw2D
CALLV
pop
line 3808
;3808:	if ( cg.snap->ps.pm_type != PM_CUTSCENE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 7
EQI4 $2714
line 3809
;3809:	if ( cg.snap->ps.pm_type != PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
EQI4 $2717
line 3810
;3810:	if ( cg.snap->ps.pm_type != PM_DEAD ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2720
line 3811
;3811:	if ( cg.snap->ps.pm_type != PM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2723
line 3812
;3812:		CG_DrawLagometer();
ADDRGP4 CG_DrawLagometer
CALLV
pop
line 3813
;3813:		CG_DrawStatusBar();
ADDRGP4 CG_DrawStatusBar
CALLV
pop
line 3814
;3814:		if(!cg.snap->ps.stats[STAT_VEHICLE]){	//VEHICLE-SYSTEM: disable weapon menu for all
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2726
line 3815
;3815:        CG_DrawWeaponSelect();
ADDRGP4 CG_DrawWeaponSelect
CALLV
pop
line 3816
;3816:		} else {
ADDRGP4 $2727
JUMPV
LABELV $2726
line 3817
;3817:		if(BG_GetVehicleSettings(cg.snap->ps.stats[STAT_VEHICLE], VSET_WEAPON)){
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 4
ADDRGP4 BG_GetVehicleSettings
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
EQF4 $2729
line 3818
;3818:		CG_DrawWeaponSelect();	
ADDRGP4 CG_DrawWeaponSelect
CALLV
pop
line 3819
;3819:		}
LABELV $2729
line 3820
;3820:		}
LABELV $2727
line 3821
;3821:        CG_DrawHoldableItem();
ADDRGP4 CG_DrawHoldableItem
CALLV
pop
line 3822
;3822:	}
LABELV $2723
line 3823
;3823:	}
LABELV $2720
line 3824
;3824:	}
LABELV $2717
line 3825
;3825:	}
LABELV $2714
line 3827
;3826:
;3827:    CG_FadeLevelStart();
ADDRGP4 CG_FadeLevelStart
CALLV
pop
line 3830
;3828:
;3829:// draw fade-in/out
;3830:	CG_DrawFade();
ADDRGP4 CG_DrawFade
CALLV
pop
line 3833
;3831:	
;3832:// don't draw center string if scoreboard is up
;3833:if(cgs.gametype != GT_SINGLE){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $2732
line 3834
;3834:if(cg_oldscoreboard.integer == 0){
ADDRGP4 cg_oldscoreboard+12
INDIRI4
CNSTI4 0
NEI4 $2735
line 3835
;3835:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 4
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+1888440
ADDRLP4 4
INDIRI4
ASGNI4
line 3836
;3836:}
LABELV $2735
line 3837
;3837:if(cg_oldscoreboard.integer == 1){
ADDRGP4 cg_oldscoreboard+12
INDIRI4
CNSTI4 1
NEI4 $2733
line 3838
;3838:	cg.scoreBoardShowing = CG_DrawOldScoreboard();
ADDRLP4 4
ADDRGP4 CG_DrawOldScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+1888440
ADDRLP4 4
INDIRI4
ASGNI4
line 3839
;3839:}
line 3840
;3840:} else {
ADDRGP4 $2733
JUMPV
LABELV $2732
line 3841
;3841:	cg.scoreBoardShowing = CG_DrawScoreboardObj();
ADDRLP4 4
ADDRGP4 CG_DrawScoreboardObj
CALLI4
ASGNI4
ADDRGP4 cg+1888440
ADDRLP4 4
INDIRI4
ASGNI4
line 3842
;3842:}
LABELV $2733
line 3844
;3843:
;3844:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2744
line 3845
;3845:		CG_DrawIntermission();
ADDRGP4 CG_DrawIntermission
CALLV
pop
line 3846
;3846:		return;
ADDRGP4 $2694
JUMPV
LABELV $2744
line 3850
;3847:	}
;3848:
;3849:	// draw level message (do it here because we want it done on top of the fade)
;3850:	CG_MessageLevelStart();
ADDRGP4 CG_MessageLevelStart
CALLV
pop
line 3853
;3851:
;3852:	// draw letterbox bars for cutscenes
;3853:	CG_DrawLetterbox();
ADDRGP4 CG_DrawLetterbox
CALLV
pop
line 3855
;3854:	
;3855:	if ( !cg.scoreBoardShowing) {
ADDRGP4 cg+1888440
INDIRI4
CNSTI4 0
NEI4 $2747
line 3856
;3856:	CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 3857
;3857:	}
LABELV $2747
line 3860
;3858:
;3859:	// play objectives notification sound if necessary
;3860:	if ( cg.objectivesTime != 0 && cg.time >= cg.objectivesTime ) {
ADDRGP4 cg+1987484
INDIRI4
CNSTI4 0
EQI4 $2750
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1987484
INDIRI4
LTI4 $2750
line 3861
;3861:		if ( !cg.objectivesSoundPlayed ) {
ADDRGP4 cg+1987488
INDIRI4
CNSTI4 0
NEI4 $2755
line 3862
;3862:			cg.objectivesSoundPlayed = qtrue;
ADDRGP4 cg+1987488
CNSTI4 1
ASGNI4
line 3863
;3863:			trap_S_StartLocalSound( cgs.media.objectivesUpdatedSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+956380+1772
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 3864
;3864:		}
LABELV $2755
line 3865
;3865:	}
LABELV $2750
line 3868
;3866:
;3867:	// if player is dead, draw death message
;3868:	if ( cgs.gametype == GT_SINGLE ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
NEI4 $2761
line 3869
;3869:	if ( cg.snap->ps.pm_type == PM_DEAD ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2764
line 3870
;3870:		CG_DrawDeathMessage();
ADDRGP4 CG_DrawDeathMessage
CALLV
pop
line 3872
;3871:
;3872:		if ( !cg.deathmusicStarted )
ADDRGP4 cg+1987500
INDIRI4
CNSTI4 0
NEI4 $2767
line 3873
;3873:			CG_StartDeathMusic();
ADDRGP4 CG_StartDeathMusic
CALLI4
pop
LABELV $2767
line 3874
;3874:	}
LABELV $2764
line 3876
;3875:
;3876:	if ( cg.snap->ps.pm_type != PM_DEAD && cg.deathmusicStarted ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2770
ADDRGP4 cg+1987500
INDIRI4
CNSTI4 0
EQI4 $2770
line 3877
;3877:		CG_StopDeathMusic();
ADDRGP4 CG_StopDeathMusic
CALLI4
pop
line 3878
;3878:	}
LABELV $2770
line 3879
;3879:	}
LABELV $2761
line 3882
;3880:
;3881:	//draw objectives notification
;3882:	CG_DrawObjectivesNotification();
ADDRGP4 CG_DrawObjectivesNotification
CALLV
pop
line 3883
;3883:}
LABELV $2694
endproc CG_DrawActive 12 8
import CG_StopDeathMusic
import CG_StartDeathMusic
import CG_Earthquake
import CG_DrawScoreboardObj
import CG_DrawStringExtRus
import GetPlayerHoldable
import GetHoldableListIndex
import BG_CheckClassname
bss
export lagometer
align 4
LABELV lagometer
skip 1544
import cgDC
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Free
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import wideAdjustX
import CG_NewParticleArea
import initparticles
import CG_LaunchFragment
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel_MiTech
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound_MiTech
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_System
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_Atmospheric_SetParticles
import CG_AddAtmosphericEffects
import teamcolormodels
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformationRus
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_TransitionEntity
import CG_ProcessSnapshots
import CG_SpurtBlood
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_LeiPuff
import CG_LeiSparks2
import CG_LeiSparks
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponBarNew2
import CG_DrawWeaponBarNew
import CG_DrawWeaponBar0
import CG_DrawWeaponSelect
import CG_AddRealWeapon
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_GravitygunTrail
import CG_PhysgunTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainVehicleEvent
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_ReloadPlayers
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_OwnerDraw
export teamChat2
align 1
LABELV teamChat2
skip 256
export teamChat1
align 1
LABELV teamChat1
skip 256
export systemChat
align 1
LABELV systemChat
skip 256
import drawTeamOverlayModificationCount
export numSortedTeamPlayers
align 4
LABELV numSortedTeamPlayers
skip 4
export sortedTeamPlayers
align 4
LABELV sortedTeamPlayers
skip 128
import CG_InsideBox
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawGiantString
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_DrawRoundedRect
import CG_FillRect2
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_CloadMap_f
import CG_FairCvars
import SnapVectorTowards
import CG_RegisterOverlay
import CG_IsTeamGame
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import CG_Cvar_ClampInt
import CG_PredictWeaponEffects
import cg_teamChatBeep
import cg_chatBeep
import cg_weaponOrder
import cg_weaponBarStyle
import cg_crosshairColorBlue
import cg_crosshairColorGreen
import cg_crosshairColorRed
import cg_ch13size
import cg_ch13
import cg_ch12size
import cg_ch12
import cg_ch11size
import cg_ch11
import cg_ch10size
import cg_ch10
import cg_ch9slze
import cg_ch9size
import cg_ch9
import cg_ch8size
import cg_ch8
import cg_ch7size
import cg_ch7
import cg_ch6size
import cg_ch6
import cg_ch5size
import cg_ch5
import cg_ch4size
import cg_ch4
import cg_ch3size
import cg_ch3
import cg_ch2size
import cg_ch2
import cg_ch1size
import cg_ch1
import cg_differentCrosshairs
import cg_crosshairPulse
import cg_atmosphericLevel
import cg_fragmsgsize
import cg_autovertex
import cg_vote_custom_commands
import cg_cyclegrapple
import cg_voteflags
import cg_voip_teamonly
import cg_hitsound
import cg_alwaysWeaponBar
import cl_timeNudge
import cg_optimizePrediction
import cg_projectileNudge
import sv_fps
import cg_cmdTimeNudge
import cg_delag
import cg_enableBreath
import cg_enableDust
import cg_obeliskRespawnDelay
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_music
import cg_trueLightning
import cg_oldPlasma
import cg_cameraEyes_Up
import cg_cameraEyes_Fwd
import cg_cameraEyes
import cg_cameramode
import cg_leiBrassNoise
import cg_leiGoreNoise
import cg_leiEnhancement
import cg_lodScale
import cg_letterBoxSize
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_float
import pmove_msec
import pmove_fixed
import cg_commonConsole
import cg_teamChatLines
import cg_chatLines
import cg_commonConsoleLines
import cg_consoleLines
import cg_teamChatSizeY
import cg_teamChatSizeX
import cg_chatSizeY
import cg_chatSizeX
import cg_consoleSizeY
import cg_consoleSizeX
import cg_fontShadow
import cg_fontScale
import cg_consoleTime
import cg_chatTime
import cg_newConsole
import cg_newFont
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_stats
import cg_teamChatScaleY
import cg_teamChatScaleX
import cg_chatY
import cg_teamChatY
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawSpeed
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_thirdPersonOffset
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_bigheadMode
import cg_disableLevelStartFade
import cg_paintballMode
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairScale
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_drawSyncMessage
import cg_drawsubtitles
import cg_centertime
import cg_gibtime
import cg_itemstyle
import cg_oldscoreboard
import team_legsskin
import legsskin
import ui_backcolors
import cl_screenoffset
import cg_cameraeyes
import cg_leiChibi
import cg_plightradius
import cg_plightblue
import cg_plightgreen
import cg_plightred
import cg_tolightblue
import cg_tolightgreen
import cg_tolightred
import cg_hetex
import cg_totex
import cg_ptex
import cg_helightblue
import cg_helightgreen
import cg_helightred
import con_notifytime
import cl_language
import cg_toolguninfo
import cg_postprocess
import cg_hide255
import sb_texturename
import sb_texture_view
import sb_classnum_view
import toolgun_modelst
import toolgun_toolmode4
import toolgun_toolmode3
import toolgun_toolmode2
import toolgun_toolmode1
import toolgun_tooltip4
import toolgun_tooltip3
import toolgun_tooltip2
import toolgun_tooltip1
import toolgun_tooltext
import toolgun_toolcmd4
import toolgun_toolcmd3
import toolgun_toolcmd2
import toolgun_toolcmd1
import toolgun_tool
import toolgun_mod19
import toolgun_mod18
import toolgun_mod17
import toolgun_mod16
import toolgun_mod15
import toolgun_mod14
import toolgun_mod13
import toolgun_mod12
import toolgun_mod11
import toolgun_mod10
import toolgun_mod9
import toolgun_mod8
import toolgun_mod7
import toolgun_mod6
import toolgun_mod5
import toolgun_mod4
import toolgun_mod3
import toolgun_mod2
import toolgun_mod1
import cg_weaponBarActiveWidth
import cg_weaponselecttime
import cg_itemscaletime
import cg_zoomtime
import cg_gibmodifier
import cg_gibvelocity
import cg_gibjump
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
import g_gametype
import mod_skyColorA
import mod_skyColorB
import mod_skyColorG
import mod_skyColorR
import mod_skyShader
import mod_fogColorA
import mod_fogColorB
import mod_fogColorG
import mod_fogColorR
import mod_fogInterval
import mod_fogDistance
import mod_fogShader
import mod_fogModel
import mod_zround
import mod_gravity
import mod_roundmode
import mod_overlay
import mod_slickmove
import mod_accelerate
import mod_invulinf
import mod_kamikazeinf
import mod_portalinf
import mod_teleporterinf
import mod_medkitinf
import mod_medkitlimit
import mod_teamblue_firespeed
import mod_teamred_firespeed
import mod_invulmove
import mod_ammolimit
import mod_noplayerclip
import mod_doublerfirespeed
import mod_guardfirespeed
import mod_scoutfirespeed
import mod_ammoregenfirespeed
import mod_hastefirespeed
import mod_amdelay
import mod_ftdelay
import mod_cgdelay
import mod_pldelay
import mod_ngdelay
import mod_bfgdelay
import mod_rgdelay
import mod_pgdelay
import mod_lgdelay
import mod_rldelay
import mod_gldelay
import mod_sgdelay
import mod_mgdelay
import mod_gdelay
import mod_jumpheight
import mod_sgspread
import mod_sgcount
import mod_lgrange
import mod_cgspread
import mod_mgspread
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $2713
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $2709
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 117
byte 1 105
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 49
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $2587
byte 1 48
byte 1 0
align 1
LABELV $2586
byte 1 99
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 88
byte 1 79
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $2585
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $2415
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
byte 1 208
byte 1 186
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 191
byte 1 208
byte 1 186
byte 1 209
byte 1 131
byte 1 32
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 187
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $2409
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $2382
byte 1 208
byte 1 161
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 183
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2378
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2368
byte 1 0
align 1
LABELV $2367
byte 1 208
byte 1 148
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
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
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $2363
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
byte 1 0
align 1
LABELV $2356
byte 1 208
byte 1 150
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 209
byte 1 134
byte 1 0
align 1
LABELV $2352
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2345
byte 1 208
byte 1 144
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $2341
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $2334
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 32
byte 1 208
byte 1 164
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 0
align 1
LABELV $2330
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $2323
byte 1 208
byte 1 148
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
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
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $2319
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
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
byte 1 0
align 1
LABELV $2312
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $2308
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $2301
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 208
byte 1 163
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $2297
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2290
byte 1 208
byte 1 163
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $2286
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2279
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $2275
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $2268
byte 1 208
byte 1 154
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
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $2264
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $2257
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $2253
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2246
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 209
byte 1 133
byte 1 0
align 1
LABELV $2242
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $2235
byte 1 208
byte 1 159
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $2231
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $2222
byte 1 37
byte 1 115
byte 1 32
byte 1 118
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2200
byte 1 208
byte 1 158
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
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
byte 1 0
align 1
LABELV $2196
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2183
byte 1 208
byte 1 146
byte 1 208
byte 1 171
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 171
byte 1 208
byte 1 155
byte 1 208
byte 1 152
byte 1 32
byte 1 208
byte 1 151
byte 1 208
byte 1 144
byte 1 208
byte 1 156
byte 1 208
byte 1 152
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $2182
byte 1 208
byte 1 146
byte 1 208
byte 1 151
byte 1 208
byte 1 160
byte 1 208
byte 1 171
byte 1 208
byte 1 146
byte 1 32
byte 1 208
byte 1 167
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 151
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2176
byte 1 89
byte 1 79
byte 1 85
byte 1 32
byte 1 72
byte 1 65
byte 1 86
byte 1 69
byte 1 32
byte 1 66
byte 1 69
byte 1 69
byte 1 78
byte 1 32
byte 1 77
byte 1 73
byte 1 78
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $2175
byte 1 73
byte 1 78
byte 1 84
byte 1 69
byte 1 82
byte 1 78
byte 1 65
byte 1 76
byte 1 32
byte 1 67
byte 1 79
byte 1 77
byte 1 66
byte 1 85
byte 1 83
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 32
byte 1 73
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2129
byte 1 79
byte 1 75
byte 1 0
align 1
LABELV $2125
byte 1 37
byte 1 50
byte 1 46
byte 1 48
byte 1 102
byte 1 0
align 1
LABELV $2106
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $2105
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $2069
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2043
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 189
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
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 189
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
byte 1 208
byte 1 147
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 190
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
byte 1 0
align 1
LABELV $2039
byte 1 208
byte 1 147
byte 1 208
byte 1 158
byte 1 208
byte 1 155
byte 1 208
byte 1 158
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 149
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2034
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2030
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2012
byte 1 208
byte 1 189
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
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 208
byte 1 189
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
byte 1 208
byte 1 161
byte 1 208
byte 1 162
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 162
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 187
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $2007
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
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $2003
byte 1 208
byte 1 157
byte 1 208
byte 1 144
byte 1 208
byte 1 145
byte 1 208
byte 1 155
byte 1 208
byte 1 174
byte 1 208
byte 1 148
byte 1 208
byte 1 144
byte 1 208
byte 1 162
byte 1 208
byte 1 149
byte 1 208
byte 1 155
byte 1 208
byte 1 172
byte 1 0
align 1
LABELV $1999
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 74
byte 1 79
byte 1 73
byte 1 78
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1994
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1990
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $1884
byte 1 114
byte 1 95
byte 1 122
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $1739
byte 1 208
byte 1 154
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
byte 1 181
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 209
byte 1 143
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 183
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1733
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1725
byte 1 208
byte 1 161
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 209
byte 1 143
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 183
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1719
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1699
byte 1 208
byte 1 164
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 209
byte 1 143
byte 1 208
byte 1 189
byte 1 33
byte 1 0
align 1
LABELV $1695
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 33
byte 1 0
align 1
LABELV $1690
byte 1 208
byte 1 161
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 209
byte 1 143
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 33
byte 1 0
align 1
LABELV $1686
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 0
align 1
LABELV $1681
byte 1 208
byte 1 154
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
byte 1 181
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 209
byte 1 143
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 33
byte 1 0
align 1
LABELV $1677
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 0
align 1
LABELV $1580
byte 1 115
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $1513
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 101
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1081
byte 1 94
byte 1 49
byte 1 37
byte 1 51
byte 1 105
byte 1 37
byte 1 37
byte 1 32
byte 1 94
byte 1 52
byte 1 37
byte 1 51
byte 1 105
byte 1 37
byte 1 37
byte 1 0
align 1
LABELV $999
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $943
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $899
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 0
align 1
LABELV $892
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $818
byte 1 32
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $817
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $793
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $765
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $746
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $745
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $740
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $724
byte 1 76
byte 1 77
byte 1 83
byte 1 58
byte 1 32
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $723
byte 1 76
byte 1 77
byte 1 83
byte 1 58
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 47
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 45
byte 1 32
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $719
byte 1 76
byte 1 77
byte 1 83
byte 1 58
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 47
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 43
byte 1 32
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $715
byte 1 76
byte 1 77
byte 1 83
byte 1 58
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 45
byte 1 32
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $711
byte 1 76
byte 1 77
byte 1 83
byte 1 58
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 43
byte 1 32
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $691
byte 1 208
byte 1 160
byte 1 208
byte 1 176
byte 1 209
byte 1 131
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $687
byte 1 82
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $683
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $674
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $667
byte 1 37
byte 1 105
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $648
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $640
byte 1 37
byte 1 105
byte 1 117
byte 1 47
byte 1 115
byte 1 0
align 1
LABELV $634
byte 1 208
byte 1 167
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 159
byte 1 208
byte 1 144
byte 1 0
align 1
LABELV $629
byte 1 83
byte 1 75
byte 1 85
byte 1 76
byte 1 76
byte 1 83
byte 1 0
align 1
LABELV $619
byte 1 208
byte 1 145
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 157
byte 1 208
byte 1 175
byte 1 0
align 1
LABELV $614
byte 1 65
byte 1 82
byte 1 77
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $607
byte 1 208
byte 1 150
byte 1 208
byte 1 152
byte 1 208
byte 1 151
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 0
align 1
LABELV $602
byte 1 72
byte 1 69
byte 1 65
byte 1 76
byte 1 84
byte 1 72
byte 1 0
align 1
LABELV $595
byte 1 208
byte 1 154
byte 1 208
byte 1 156
byte 1 47
byte 1 208
byte 1 167
byte 1 0
align 1
LABELV $590
byte 1 75
byte 1 77
byte 1 47
byte 1 72
byte 1 0
align 1
LABELV $567
byte 1 208
byte 1 159
byte 1 208
byte 1 144
byte 1 208
byte 1 162
byte 1 208
byte 1 160
byte 1 208
byte 1 158
byte 1 208
byte 1 157
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $562
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 0
align 1
LABELV $455
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
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $452
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $449
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $446
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $445
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $424
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 47
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $290
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $283
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $220
byte 1 37
byte 1 105
byte 1 0
