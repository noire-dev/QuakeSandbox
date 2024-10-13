export CG_AdjustFrom640
code
proc CG_AdjustFrom640 16 0
file "../../../code/cgame/cg_drawtools.c"
line 33
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
;23:// cg_drawtools.c -- helper functions called by cg_draw, cg_scoreboard, cg_info, etc
;24:#include "cg_local.h"
;25:
;26:/*
;27:================
;28:CG_AdjustFrom640
;29:
;30:Adjusted for resolution and screen aspect ratio
;31:================
;32:*/
;33:void CG_AdjustFrom640( float *x, float *y, float *w, float *h ) {
line 44
;34:#if 0
;35:	// adjust for wide screens
;36:	if ( cgs.glconfig.vidWidth * 480 > cgs.glconfig.vidHeight * 640 ) {
;37:		*x += 0.5 * ( cgs.glconfig.vidWidth - ( cgs.glconfig.vidHeight * 640 / 480 ) );
;38:	}
;39:#endif
;40:
;41:
;42:	// scale for screen sizes
;43:	//*x *= cgs.screenXScale;
;44:	*x = *x * cgs.screenXScale + cgs.screenXBias;	// leilei - widescreen adjust
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 cgs+339016
INDIRF4
MULF4
ADDRGP4 cgs+339024
INDIRF4
ADDF4
ASGNF4
line 45
;45:	*y *= cgs.screenYScale;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cgs+339020
INDIRF4
MULF4
ASGNF4
line 46
;46:	*w *= cgs.screenXScale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 cgs+339016
INDIRF4
MULF4
ASGNF4
line 47
;47:	*h *= cgs.screenYScale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 cgs+339020
INDIRF4
MULF4
ASGNF4
line 48
;48:}
LABELV $81
endproc CG_AdjustFrom640 16 0
export CG_FillRect
proc CG_FillRect 4 36
line 57
;49:
;50:/*
;51:================
;52:CG_FillRect
;53:
;54:Coordinates are 640*480 virtual values
;55:=================
;56:*/
;57:void CG_FillRect( float x, float y, float width, float height, const float *color ) {
line 58
;58:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 60
;59:
;60:	CG_AdjustFrom640( &x, &y, &width, &height );
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
line 61
;61:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader );
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
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+956380+20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 63
;62:
;63:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 64
;64:}
LABELV $87
endproc CG_FillRect 4 36
export CG_FillRect2
proc CG_FillRect2 4 36
line 66
;65:
;66:void CG_FillRect2( float x, float y, float width, float height, const float *color ) {
line 67
;67:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 69
;68:
;69:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader );
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
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+956380+20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 71
;70:
;71:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 72
;72:}
LABELV $90
endproc CG_FillRect2 4 36
export CG_DrawRoundedRect
proc CG_DrawRoundedRect 60 36
line 82
;73:
;74:/*
;75:================
;76:CG_DrawRoundedRect
;77:
;78:Coordinates are 640*480 virtual values
;79:=================
;80:*/
;81:
;82:void CG_DrawRoundedRect(float x, float y, float width, float height, float radius, const float *color) {
line 84
;83:    
;84:	CG_AdjustFrom640( &x, &y, &width, &height );
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
line 86
;85:	
;86:	if(radius*2 > height){ radius=height*0.5; }
CNSTF4 1073741824
ADDRFP4 16
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
LEF4 $94
ADDRFP4 16
CNSTF4 1056964608
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
LABELV $94
line 87
;87:	if(radius*2 > width){ radius=width*0.5; }
CNSTF4 1073741824
ADDRFP4 16
INDIRF4
MULF4
ADDRFP4 8
INDIRF4
LEF4 $96
ADDRFP4 16
CNSTF4 1056964608
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
LABELV $96
line 90
;88:	
;89:	// ????????? ?????
;90:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 91
;91:    trap_R_DrawStretchPic(x, y, radius, radius, 1, 0, 0, 1, cgs.media.corner); // ????? ??????? ????
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRFP4 16
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 cgs+956380+24
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 92
;92:    trap_R_DrawStretchPic(x + width - radius, y, radius, radius, 0, 0, 1, 1, cgs.media.corner); // ?????? ??????? ????
ADDRLP4 12
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 cgs+956380+24
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 93
;93:    trap_R_DrawStretchPic(x, y + height - radius, radius, radius, 1, 1, 0, 0, cgs.media.corner); // ????? ?????? ????
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 24
INDIRF4
SUBF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 cgs+956380+24
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 94
;94:    trap_R_DrawStretchPic(x + width - radius, y + height - radius, radius, radius, 0, 1, 1, 0, cgs.media.corner); // ?????? ?????? ????
ADDRLP4 36
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 36
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 36
INDIRF4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
CNSTF4 1065353216
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRGP4 cgs+956380+24
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 97
;95:
;96:    // ????????? ??????? ??????
;97:    CG_FillRect2(x, y + radius, radius, height - (radius * 2), color); // ????? ???????
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 48
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRLP4 48
INDIRF4
ADDF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
CNSTF4 1073741824
ADDRLP4 48
INDIRF4
MULF4
SUBF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 CG_FillRect2
CALLV
pop
line 98
;98:    CG_FillRect2(x + width - radius, y + radius, radius, height - (radius * 2), color); // ?????? ???????
ADDRLP4 52
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 52
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 52
INDIRF4
ADDF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
CNSTF4 1073741824
ADDRLP4 52
INDIRF4
MULF4
SUBF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 CG_FillRect2
CALLV
pop
line 99
;99:    CG_FillRect2(x + radius, y, width - (radius * 2), height, color); // ??????? ???????
ADDRLP4 56
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 56
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1073741824
ADDRLP4 56
INDIRF4
MULF4
SUBF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 CG_FillRect2
CALLV
pop
line 100
;100:}
LABELV $93
endproc CG_DrawRoundedRect 60 36
export CG_DrawSides
proc CG_DrawSides 12 36
line 109
;101:
;102:/*
;103:================
;104:CG_DrawSides
;105:
;106:Coords are virtual 640x480
;107:================
;108:*/
;109:void CG_DrawSides(float x, float y, float w, float h, float size) {
line 110
;110:	CG_AdjustFrom640( &x, &y, &w, &h );
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
line 111
;111:	size *= cgs.screenXScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+339016
INDIRF4
MULF4
ASGNF4
line 112
;112:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+956380+20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 113
;113:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cgs+956380+20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 114
;114:}
LABELV $106
endproc CG_DrawSides 12 36
export CG_DrawTopBottom
proc CG_DrawTopBottom 12 36
line 116
;115:
;116:void CG_DrawTopBottom(float x, float y, float w, float h, float size) {
line 117
;117:	CG_AdjustFrom640( &x, &y, &w, &h );
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
line 118
;118:	size *= cgs.screenYScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+339020
INDIRF4
MULF4
ASGNF4
line 119
;119:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+956380+20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 120
;120:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cgs+956380+20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 121
;121:}
LABELV $112
endproc CG_DrawTopBottom 12 36
export CG_DrawRect
proc CG_DrawRect 4 20
line 129
;122:/*
;123:================
;124:CG_DrawRect
;125:
;126:Coordinates are 640*480 virtual values
;127:=================
;128:*/
;129:void CG_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 130
;130:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 132
;131:
;132:	CG_DrawTopBottom(x, y, width, height, size);
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
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawTopBottom
CALLV
pop
line 133
;133:	CG_DrawSides(x, y + size, width, height - size * 2, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
SUBF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 CG_DrawSides
CALLV
pop
line 135
;134:
;135:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 136
;136:}
LABELV $118
endproc CG_DrawRect 4 20
export CG_DrawPic
proc CG_DrawPic 8 36
line 147
;137:
;138:
;139:
;140:/*
;141:================
;142:CG_DrawPic
;143:
;144:Coordinates are 640*480 virtual values
;145:=================
;146:*/
;147:void CG_DrawPic( float x, float y, float width, float height, qhandle_t hShader ) {
line 148
;148:	CG_AdjustFrom640( &x, &y, &width, &height );
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
line 149
;149:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
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
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 150
;150:}
LABELV $119
endproc CG_DrawPic 8 36
export CG_DrawChar
proc CG_DrawChar 48 36
line 161
;151:
;152:
;153:
;154:/*
;155:===============
;156:CG_DrawChar
;157:
;158:Coordinates and size in 640*480 virtual screen size
;159:===============
;160:*/
;161:void CG_DrawChar( int x, int y, int width, int height, int ch ) {
line 167
;162:	int row, col;
;163:	float frow, fcol;
;164:	float size;
;165:	float	ax, ay, aw, ah;
;166:
;167:	ch &= 255;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 169
;168:
;169:	if ( ch == ' ' ) {
ADDRFP4 16
INDIRI4
CNSTI4 32
NEI4 $121
line 170
;170:		return;
ADDRGP4 $120
JUMPV
LABELV $121
line 173
;171:	}
;172:
;173:	ax = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ASGNF4
line 174
;174:	ay = y;
ADDRLP4 16
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
line 175
;175:	aw = width;
ADDRLP4 20
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
line 176
;176:	ah = height;
ADDRLP4 24
ADDRFP4 12
INDIRI4
CVIF4 4
ASGNF4
line 177
;177:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 179
;178:
;179:	row = ch>>4;
ADDRLP4 28
ADDRFP4 16
INDIRI4
CNSTI4 4
RSHI4
ASGNI4
line 180
;180:	col = ch&15;
ADDRLP4 32
ADDRFP4 16
INDIRI4
CNSTI4 15
BANDI4
ASGNI4
line 182
;181:
;182:	frow = row*0.0625;
ADDRLP4 0
CNSTF4 1031798784
ADDRLP4 28
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 183
;183:	fcol = col*0.0625;
ADDRLP4 4
CNSTF4 1031798784
ADDRLP4 32
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 184
;184:	size = 0.0625;
ADDRLP4 8
CNSTF4 1031798784
ASGNF4
line 186
;185:
;186:	trap_R_DrawStretchPic( ax, ay, aw, ah,
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+956380
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 190
;187:					   fcol, frow, 
;188:					   fcol + size, frow + size, 
;189:					   cgs.media.charsetShader );
;190:}
LABELV $120
endproc CG_DrawChar 48 36
export CG_DrawCharRus
proc CG_DrawCharRus 48 36
line 191
;191:void CG_DrawCharRus( int x, int y, int width, int height, int ch ) {
line 197
;192:	int row, col;
;193:	float frow, fcol;
;194:	float size;
;195:	float	ax, ay, aw, ah;
;196:
;197:	ch &= 255;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 199
;198:
;199:	if ( ch == ' ' ) {
ADDRFP4 16
INDIRI4
CNSTI4 32
NEI4 $125
line 200
;200:		return;
ADDRGP4 $124
JUMPV
LABELV $125
line 203
;201:	}
;202:
;203:	ax = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ASGNF4
line 204
;204:	ay = y;
ADDRLP4 16
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
line 205
;205:	aw = width;
ADDRLP4 20
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
line 206
;206:	ah = height;
ADDRLP4 24
ADDRFP4 12
INDIRI4
CVIF4 4
ASGNF4
line 207
;207:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 209
;208:
;209:	row = ch>>4;
ADDRLP4 28
ADDRFP4 16
INDIRI4
CNSTI4 4
RSHI4
ASGNI4
line 210
;210:	col = ch&15;
ADDRLP4 32
ADDRFP4 16
INDIRI4
CNSTI4 15
BANDI4
ASGNI4
line 212
;211:
;212:	frow = row*0.0625;
ADDRLP4 0
CNSTF4 1031798784
ADDRLP4 28
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 213
;213:	fcol = col*0.0625;
ADDRLP4 4
CNSTF4 1031798784
ADDRLP4 32
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 214
;214:	size = 0.0625;
ADDRLP4 8
CNSTF4 1031798784
ASGNF4
line 216
;215:
;216:	trap_R_DrawStretchPic( ax, ay, aw, ah,
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+956380+4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 220
;217:					   fcol, frow, 
;218:					   fcol + size, frow + size, 
;219:					   cgs.media.charsetShaderRus );
;220:}
LABELV $124
endproc CG_DrawCharRus 48 36
export CG_DrawStringExt
proc CG_DrawStringExt 52 20
line 234
;221:
;222:
;223:/*
;224:==================
;225:CG_DrawStringExt
;226:
;227:Draws a multi-colored string with a drop shadow, optionally forcing
;228:to a fixed color.
;229:
;230:Coordinates are at 640 by 480 virtual resolution
;231:==================
;232:*/
;233:void CG_DrawStringExt( int x, int y, const char *string, const float *setColor,
;234:		qboolean forceColor, qboolean shadow, int charWidth, int charHeight, int maxChars ) {
line 240
;235:	vec4_t		color;
;236:	const char	*s;
;237:	int		xx;
;238:	int		cnt;
;239:        char	        ch;
;240:        int prev_unicode = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 242
;241:
;242:	if (maxChars <= 0)
ADDRFP4 32
INDIRI4
CNSTI4 0
GTI4 $130
line 243
;243:		maxChars = 32767; // do them all!
ADDRFP4 32
CNSTI4 32767
ASGNI4
LABELV $130
line 246
;244:
;245:	// draw the drop shadow
;246:	if (shadow) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $132
line 247
;247:		color[0] = color[1] = color[2] = 0;
ADDRLP4 36
CNSTF4 0
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
line 248
;248:		color[3] = setColor[3];
ADDRLP4 16+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 249
;249:		trap_R_SetColor( color );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 250
;250:		s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 251
;251:		xx = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
line 252
;252:		cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $137
line 253
;253:		while ( *s && cnt < maxChars) {
line 254
;254:			if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $140
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $140
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $140
ADDRLP4 44
INDIRI4
CNSTI4 48
LTI4 $140
ADDRLP4 44
INDIRI4
CNSTI4 57
GTI4 $140
line 255
;255:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 256
;256:				continue;
ADDRGP4 $138
JUMPV
LABELV $140
line 259
;257:			}
;258:                        ////////////////////////////////////
;259:                        ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 262
;260:                        // unicode russian stuff support
;261:                        //Com_Printf("UI_letter: is %d\n", *s);
;262:                        if (ch < 0) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $142
line 263
;263:                           if ((ch == -48) || (ch == -47)) {
ADDRLP4 48
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 -48
EQI4 $146
ADDRLP4 48
INDIRI4
CNSTI4 -47
NEI4 $144
LABELV $146
line 264
;264:                              prev_unicode = ch;
ADDRLP4 32
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
line 265
;265:                              s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 266
;266:                              cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 267
;267:                              continue;
ADDRGP4 $138
JUMPV
LABELV $144
line 269
;268:                           }
;269:                           if (ch >= -112) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -112
LTI4 $147
line 270
;270:                              if ((ch == -111) && (prev_unicode == -47)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -111
NEI4 $149
ADDRLP4 32
INDIRI4
CNSTI4 -47
NEI4 $149
line 271
;271:                                 ch = ch - 13;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 13
SUBI4
CVII1 4
ASGNI1
line 272
;272:                              } else {
ADDRGP4 $148
JUMPV
LABELV $149
line 273
;273:                                 ch = ch + 48;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 48
ADDI4
CVII1 4
ASGNI1
line 274
;274:                              }
line 275
;275:                           } else {
ADDRGP4 $148
JUMPV
LABELV $147
line 276
;276:                              if ((ch == -127) && (prev_unicode == -48)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -127
NEI4 $151
ADDRLP4 32
INDIRI4
CNSTI4 -48
NEI4 $151
line 278
;277:                                 // ch = ch +
;278:                              } else {
ADDRGP4 $152
JUMPV
LABELV $151
line 279
;279:                                 ch = ch + 112; // +64 offset of damn unicode
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 112
ADDI4
CVII1 4
ASGNI1
line 280
;280:                              }
LABELV $152
line 281
;281:                           }
LABELV $148
line 282
;282:                        }
LABELV $142
line 284
;283:                        //////////////////////////////////////////
;284:			CG_DrawChar( xx + 2, y + 2, charWidth, charHeight, ch );
ADDRLP4 48
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 285
;285:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 286
;286:			xx += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 287
;287:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 288
;288:		}
LABELV $138
line 253
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $153
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $137
LABELV $153
line 289
;289:	}
LABELV $132
line 292
;290:
;291:	// draw the colored text
;292:	s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 293
;293:	xx = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
line 294
;294:	cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 295
;295:	trap_R_SetColor( setColor );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $155
JUMPV
LABELV $154
line 296
;296:	while ( *s && cnt < maxChars) {
line 297
;297:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $157
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $157
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
EQI4 $157
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $157
ADDRLP4 40
INDIRI4
CNSTI4 57
GTI4 $157
line 298
;298:			if ( !forceColor ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $159
line 299
;299:				memcpy( color, g_color_table[ColorIndex(*(s+1))], sizeof( color ) );
ADDRLP4 16
ARGP4
ADDRLP4 0
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
line 300
;300:				color[3] = setColor[3];
ADDRLP4 16+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 301
;301:				trap_R_SetColor( color );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 302
;302:			}
LABELV $159
line 303
;303:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 304
;304:			continue;
ADDRGP4 $155
JUMPV
LABELV $157
line 307
;305:		}
;306:                        ////////////////////////////////////
;307:                        ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 310
;308:                        // unicode russian stuff support
;309:                        //Com_Printf("UI_letter: is %d\n", *s);
;310:                        if (ch < 0) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $163
line 311
;311:                           if ((ch == -48) || (ch == -47)) {
ADDRLP4 44
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 -48
EQI4 $167
ADDRLP4 44
INDIRI4
CNSTI4 -47
NEI4 $165
LABELV $167
line 312
;312:                              prev_unicode = ch;
ADDRLP4 32
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
line 313
;313:                              s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 314
;314:                              cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 315
;315:                              continue;
ADDRGP4 $155
JUMPV
LABELV $165
line 317
;316:                           }
;317:                           if (ch >= -112) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -112
LTI4 $168
line 318
;318:                              if ((ch == -111) && (prev_unicode == -47)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -111
NEI4 $170
ADDRLP4 32
INDIRI4
CNSTI4 -47
NEI4 $170
line 319
;319:                                 ch = ch - 13;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 13
SUBI4
CVII1 4
ASGNI1
line 320
;320:                              } else {
ADDRGP4 $169
JUMPV
LABELV $170
line 321
;321:                                 ch = ch + 48;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 48
ADDI4
CVII1 4
ASGNI1
line 322
;322:                              }
line 323
;323:                           } else {
ADDRGP4 $169
JUMPV
LABELV $168
line 324
;324:                              if ((ch == -127) && (prev_unicode == -48)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -127
NEI4 $172
ADDRLP4 32
INDIRI4
CNSTI4 -48
NEI4 $172
line 326
;325:                                 // ch = ch +
;326:                              } else {
ADDRGP4 $173
JUMPV
LABELV $172
line 327
;327:                                 ch = ch + 112; // +64 offset of damn unicode
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 112
ADDI4
CVII1 4
ASGNI1
line 328
;328:                              }
LABELV $173
line 329
;329:                           }
LABELV $169
line 330
;330:                        }
LABELV $163
line 332
;331:                        //////////////////////////////////////////
;332:		CG_DrawChar( xx, y, charWidth, charHeight, ch );
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 333
;333:		xx += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 334
;334:		cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 335
;335:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 336
;336:	}
LABELV $155
line 296
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $174
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $154
LABELV $174
line 337
;337:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 338
;338:}
LABELV $129
endproc CG_DrawStringExt 52 20
export CG_DrawStringExtRus
proc CG_DrawStringExtRus 52 20
line 340
;339:void CG_DrawStringExtRus( int x, int y, const char *string, const float *setColor,
;340:		qboolean forceColor, qboolean shadow, int charWidth, int charHeight, int maxChars ) {
line 346
;341:	vec4_t		color;
;342:	const char	*s;
;343:	int		xx;
;344:	int		cnt;
;345:        char	        ch;
;346:        int prev_unicode = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 348
;347:
;348:	if (maxChars <= 0)
ADDRFP4 32
INDIRI4
CNSTI4 0
GTI4 $176
line 349
;349:		maxChars = 32767; // do them all!
ADDRFP4 32
CNSTI4 32767
ASGNI4
LABELV $176
line 352
;350:
;351:	// draw the drop shadow
;352:	if (shadow) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $178
line 353
;353:		color[0] = color[1] = color[2] = 0;
ADDRLP4 36
CNSTF4 0
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
line 354
;354:		color[3] = setColor[3];
ADDRLP4 16+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 355
;355:		trap_R_SetColor( color );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 356
;356:		s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 357
;357:		xx = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
line 358
;358:		cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $184
JUMPV
LABELV $183
line 359
;359:		while ( *s && cnt < maxChars) {
line 360
;360:			if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $186
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $186
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $186
ADDRLP4 44
INDIRI4
CNSTI4 48
LTI4 $186
ADDRLP4 44
INDIRI4
CNSTI4 57
GTI4 $186
line 361
;361:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 362
;362:				continue;
ADDRGP4 $184
JUMPV
LABELV $186
line 365
;363:			}
;364:                        ////////////////////////////////////
;365:                        ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 368
;366:                        // unicode russian stuff support
;367:                        //Com_Printf("UI_letter: is %d\n", *s);
;368:                        if (ch < 0) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $188
line 369
;369:                           if ((ch == -48) || (ch == -47)) {
ADDRLP4 48
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 -48
EQI4 $192
ADDRLP4 48
INDIRI4
CNSTI4 -47
NEI4 $190
LABELV $192
line 370
;370:                              prev_unicode = ch;
ADDRLP4 32
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
line 371
;371:                              s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 372
;372:                              cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 373
;373:                              continue;
ADDRGP4 $184
JUMPV
LABELV $190
line 375
;374:                           }
;375:                           if (ch >= -112) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -112
LTI4 $193
line 376
;376:                              if ((ch == -111) && (prev_unicode == -47)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -111
NEI4 $195
ADDRLP4 32
INDIRI4
CNSTI4 -47
NEI4 $195
line 377
;377:                                 ch = ch - 13;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 13
SUBI4
CVII1 4
ASGNI1
line 378
;378:                              } else {
ADDRGP4 $194
JUMPV
LABELV $195
line 379
;379:                                 ch = ch + 48;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 48
ADDI4
CVII1 4
ASGNI1
line 380
;380:                              }
line 381
;381:                           } else {
ADDRGP4 $194
JUMPV
LABELV $193
line 382
;382:                              if ((ch == -127) && (prev_unicode == -48)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -127
NEI4 $197
ADDRLP4 32
INDIRI4
CNSTI4 -48
NEI4 $197
line 384
;383:                                 // ch = ch +
;384:                              } else {
ADDRGP4 $198
JUMPV
LABELV $197
line 385
;385:                                 ch = ch + 112; // +64 offset of damn unicode
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 112
ADDI4
CVII1 4
ASGNI1
line 386
;386:                              }
LABELV $198
line 387
;387:                           }
LABELV $194
line 388
;388:                        }
LABELV $188
line 390
;389:                        //////////////////////////////////////////
;390:			CG_DrawCharRus( xx + 2, y + 2, charWidth, charHeight, ch );
ADDRLP4 48
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawCharRus
CALLV
pop
line 391
;391:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 392
;392:			xx += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 393
;393:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 394
;394:		}
LABELV $184
line 359
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $199
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $183
LABELV $199
line 395
;395:	}
LABELV $178
line 398
;396:
;397:	// draw the colored text
;398:	s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 399
;399:	xx = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
line 400
;400:	cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 401
;401:	trap_R_SetColor( setColor );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $201
JUMPV
LABELV $200
line 402
;402:	while ( *s && cnt < maxChars) {
line 403
;403:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $203
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $203
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
EQI4 $203
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $203
ADDRLP4 40
INDIRI4
CNSTI4 57
GTI4 $203
line 404
;404:			if ( !forceColor ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $205
line 405
;405:				memcpy( color, g_color_table[ColorIndex(*(s+1))], sizeof( color ) );
ADDRLP4 16
ARGP4
ADDRLP4 0
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
line 406
;406:				color[3] = setColor[3];
ADDRLP4 16+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 407
;407:				trap_R_SetColor( color );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 408
;408:			}
LABELV $205
line 409
;409:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 410
;410:			continue;
ADDRGP4 $201
JUMPV
LABELV $203
line 413
;411:		}
;412:                        ////////////////////////////////////
;413:                        ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 416
;414:                        // unicode russian stuff support
;415:                        //Com_Printf("UI_letter: is %d\n", *s);
;416:                        if (ch < 0) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $209
line 417
;417:                           if ((ch == -48) || (ch == -47)) {
ADDRLP4 44
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 -48
EQI4 $213
ADDRLP4 44
INDIRI4
CNSTI4 -47
NEI4 $211
LABELV $213
line 418
;418:                              prev_unicode = ch;
ADDRLP4 32
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
line 419
;419:                              s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 420
;420:                              cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 421
;421:                              continue;
ADDRGP4 $201
JUMPV
LABELV $211
line 423
;422:                           }
;423:                           if (ch >= -112) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -112
LTI4 $214
line 424
;424:                              if ((ch == -111) && (prev_unicode == -47)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -111
NEI4 $216
ADDRLP4 32
INDIRI4
CNSTI4 -47
NEI4 $216
line 425
;425:                                 ch = ch - 13;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 13
SUBI4
CVII1 4
ASGNI1
line 426
;426:                              } else {
ADDRGP4 $215
JUMPV
LABELV $216
line 427
;427:                                 ch = ch + 48;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 48
ADDI4
CVII1 4
ASGNI1
line 428
;428:                              }
line 429
;429:                           } else {
ADDRGP4 $215
JUMPV
LABELV $214
line 430
;430:                              if ((ch == -127) && (prev_unicode == -48)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -127
NEI4 $218
ADDRLP4 32
INDIRI4
CNSTI4 -48
NEI4 $218
line 432
;431:                                 // ch = ch +
;432:                              } else {
ADDRGP4 $219
JUMPV
LABELV $218
line 433
;433:                                 ch = ch + 112; // +64 offset of damn unicode
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 112
ADDI4
CVII1 4
ASGNI1
line 434
;434:                              }
LABELV $219
line 435
;435:                           }
LABELV $215
line 436
;436:                        }
LABELV $209
line 438
;437:                        //////////////////////////////////////////
;438:		CG_DrawCharRus( xx, y, charWidth, charHeight, ch );
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawCharRus
CALLV
pop
line 439
;439:		xx += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 440
;440:		cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 441
;441:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 442
;442:	}
LABELV $201
line 402
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $220
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $200
LABELV $220
line 443
;443:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 444
;444:}
LABELV $175
endproc CG_DrawStringExtRus 52 20
export CG_DrawBigString
proc CG_DrawBigString 24 36
line 447
;445:
;446:
;447:void CG_DrawBigString( int x, int y, const char *s, float alpha ) {
line 450
;448:	float	color[4];
;449:
;450:	color[0] = color[1] = color[2] = 1.0;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 451
;451:	color[3] = alpha;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 452
;452:	CG_DrawStringExt( x, y, s, color, qfalse, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ARGI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 453
;453:}
LABELV $221
endproc CG_DrawBigString 24 36
export CG_DrawGiantString
proc CG_DrawGiantString 24 36
line 455
;454:
;455:void CG_DrawGiantString( int x, int y, const char *s, float alpha ) {
line 458
;456:	float	color[4];
;457:
;458:	color[0] = color[1] = color[2] = 1.0;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 459
;459:	color[3] = alpha;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 460
;460:	CG_DrawStringExt( x, y, s, color, qfalse, qtrue, GIANTCHAR_WIDTH, GIANTCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cl_giantcharwidth+12
INDIRI4
ARGI4
ADDRGP4 cl_giantcharheight+12
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 461
;461:}
LABELV $227
endproc CG_DrawGiantString 24 36
export CG_DrawBigStringColor
proc CG_DrawBigStringColor 4 36
line 463
;462:
;463:void CG_DrawBigStringColor( int x, int y, const char *s, vec4_t color ) {
line 464
;464:	CG_DrawStringExt( x, y, s, color, qtrue, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ARGI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 465
;465:}
LABELV $233
endproc CG_DrawBigStringColor 4 36
export CG_DrawSmallString
proc CG_DrawSmallString 24 36
line 467
;466:
;467:void CG_DrawSmallString( int x, int y, const char *s, float alpha ) {
line 470
;468:	float	color[4];
;469:
;470:	color[0] = color[1] = color[2] = 1.0;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 471
;471:	color[3] = alpha;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 472
;472:	CG_DrawStringExt( x, y, s, color, qfalse, qfalse, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 473
;473:}
LABELV $236
endproc CG_DrawSmallString 24 36
export CG_DrawSmallStringColor
proc CG_DrawSmallStringColor 4 36
line 475
;474:
;475:void CG_DrawSmallStringColor( int x, int y, const char *s, vec4_t color ) {
line 476
;476:	CG_DrawStringExt( x, y, s, color, qtrue, qfalse, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 477
;477:}
LABELV $242
endproc CG_DrawSmallStringColor 4 36
export CG_DrawStrlen
proc CG_DrawStrlen 20 0
line 486
;478:
;479:/*
;480:=================
;481:CG_DrawStrlen
;482:
;483:Returns character count, skiping color escape codes
;484:=================
;485:*/
;486:int CG_DrawStrlen( const char *str ) {
line 487
;487:	const char *s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 488
;488:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $246
line 490
;489:
;490:	while ( *s ) {
line 491
;491:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $249
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $249
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $249
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $249
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $249
line 492
;492:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 493
;493:		} else {
ADDRGP4 $250
JUMPV
LABELV $249
line 494
;494:                        if ((*s == -48) || (*s == -47)) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 -48
EQI4 $253
ADDRLP4 16
INDIRI4
CNSTI4 -47
NEI4 $251
LABELV $253
line 495
;495:                           s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 496
;496:                        } else {
ADDRGP4 $252
JUMPV
LABELV $251
line 497
;497:                           count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 498
;498:			   s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 499
;499:                        }
LABELV $252
line 500
;500:		}
LABELV $250
line 501
;501:	}
LABELV $247
line 490
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $246
line 503
;502:
;503:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $245
endproc CG_DrawStrlen 20 0
proc CG_TileClearBox 16 36
line 514
;504:}
;505:
;506:/*
;507:=============
;508:CG_TileClearBox
;509:
;510:This repeats a 64*64 tile graphic to fill the screen around a sized down
;511:refresh window.
;512:=============
;513:*/
;514:static void CG_TileClearBox( int x, int y, int w, int h, qhandle_t hShader ) {
line 517
;515:	float	s1, t1, s2, t2;
;516:
;517:	s1 = x/64.0;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 518
;518:	t1 = y/64.0;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 519
;519:	s2 = (x+w)/64.0;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 520
;520:	t2 = (y+h)/64.0;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 521
;521:	trap_R_DrawStretchPic( x, y, w, h, s1, t1, s2, t2, hShader );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 522
;522:}
LABELV $254
endproc CG_TileClearBox 16 36
export CG_TileClear
proc CG_TileClear 48 20
line 533
;523:
;524:
;525:
;526:/*
;527:==============
;528:CG_TileClear
;529:
;530:Clear around a sized down screen
;531:==============
;532:*/
;533:void CG_TileClear( void ) {
line 537
;534:	int		top, bottom, left, right;
;535:	int		w, h;
;536:
;537:	w = cgs.glconfig.vidWidth;
ADDRLP4 8
ADDRGP4 cgs+327684+11304
INDIRI4
ASGNI4
line 538
;538:	h = cgs.glconfig.vidHeight;
ADDRLP4 20
ADDRGP4 cgs+327684+11308
INDIRI4
ASGNI4
line 540
;539:
;540:	if ( cg.refdef.x == 0 && cg.refdef.y == 0 && 
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 cg+1870616
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $260
ADDRGP4 cg+1870616+4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $260
ADDRGP4 cg+1870616+8
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $260
ADDRGP4 cg+1870616+12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $260
line 541
;541:		cg.refdef.width == w && cg.refdef.height == h ) {
line 542
;542:		return;		// full screen rendering
ADDRGP4 $255
JUMPV
LABELV $260
line 545
;543:	}
;544:
;545:	top = cg.refdef.y;
ADDRLP4 0
ADDRGP4 cg+1870616+4
INDIRI4
ASGNI4
line 546
;546:	bottom = top + cg.refdef.height-1;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1870616+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 547
;547:	left = cg.refdef.x;
ADDRLP4 12
ADDRGP4 cg+1870616
INDIRI4
ASGNI4
line 548
;548:	right = left + cg.refdef.width-1;
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRGP4 cg+1870616+8
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 551
;549:
;550:	// clear above view screen
;551:	CG_TileClearBox( 0, 0, w, top, cgs.media.backTileShader );
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1264
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 554
;552:
;553:	// clear below view screen
;554:	CG_TileClearBox( 0, bottom, w, h - bottom, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRGP4 cgs+956380+1264
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 557
;555:
;556:	// clear left of view screen
;557:	CG_TileClearBox( 0, top, left, bottom - top + 1, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+956380+1264
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 560
;558:
;559:	// clear right of view screen
;560:	CG_TileClearBox( right, top, w - right, bottom - top + 1, cgs.media.backTileShader );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+956380+1264
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 561
;561:}
LABELV $255
endproc CG_TileClear 48 20
bss
align 4
LABELV $285
skip 16
export CG_FadeColor
code
proc CG_FadeColor 8 0
line 570
;562:
;563:
;564:
;565:/*
;566:================
;567:CG_FadeColor
;568:================
;569:*/
;570:float *CG_FadeColor( int startMsec, int totalMsec ) {
line 574
;571:	static vec4_t		color;
;572:	int			t;
;573:
;574:	if ( startMsec == 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $286
line 575
;575:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $284
JUMPV
LABELV $286
line 578
;576:	}
;577:
;578:	t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+1868892
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 580
;579:
;580:	if ( t >= totalMsec ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $289
line 581
;581:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $284
JUMPV
LABELV $289
line 585
;582:	}
;583:
;584:	// fade out
;585:	if ( totalMsec - t < FADE_TIME ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 500
GEI4 $291
line 586
;586:		color[3] = ( totalMsec - t ) * 1.0/FADE_TIME;
ADDRGP4 $285+12
CNSTF4 1065353216
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1140457472
DIVF4
ASGNF4
line 587
;587:	} else {
ADDRGP4 $292
JUMPV
LABELV $291
line 588
;588:		color[3] = 1.0;
ADDRGP4 $285+12
CNSTF4 1065353216
ASGNF4
line 589
;589:	}
LABELV $292
line 590
;590:	color[0] = color[1] = color[2] = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $285+8
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $285+4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $285
ADDRLP4 4
INDIRF4
ASGNF4
line 592
;591:
;592:	return color;
ADDRGP4 $285
RETP4
LABELV $284
endproc CG_FadeColor 8 0
data
align 4
LABELV $298
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
align 4
LABELV $299
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $300
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $301
byte 4 1060320051
byte 4 1060320051
byte 4 1060320051
byte 4 1065353216
export CG_TeamColor
code
proc CG_TeamColor 4 0
line 601
;593:}
;594:
;595:
;596:/*
;597:================
;598:CG_TeamColor
;599:================
;600:*/
;601:float *CG_TeamColor( int team ) {
line 607
;602:	static vec4_t	red = {1, 0.2f, 0.2f, 1};
;603:	static vec4_t	blue = {0.2f, 0.2f, 1, 1};
;604:	static vec4_t	other = {1, 1, 1, 1};
;605:	static vec4_t	spectator = {0.7f, 0.7f, 0.7f, 1};
;606:
;607:	switch ( team ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $304
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $305
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $306
ADDRGP4 $302
JUMPV
LABELV $304
line 609
;608:	case TEAM_RED:
;609:		return red;
ADDRGP4 $298
RETP4
ADDRGP4 $297
JUMPV
LABELV $305
line 611
;610:	case TEAM_BLUE:
;611:		return blue;
ADDRGP4 $299
RETP4
ADDRGP4 $297
JUMPV
LABELV $306
line 613
;612:	case TEAM_SPECTATOR:
;613:		return spectator;
ADDRGP4 $301
RETP4
ADDRGP4 $297
JUMPV
LABELV $302
line 615
;614:	default:
;615:		return other;
ADDRGP4 $300
RETP4
LABELV $297
endproc CG_TeamColor 4 0
export CG_GetColorForHealth
proc CG_GetColorForHealth 16 0
line 626
;616:	}
;617:}
;618:
;619:
;620:
;621:/*
;622:=================
;623:CG_GetColorForHealth
;624:=================
;625:*/
;626:void CG_GetColorForHealth( int health, int armor, vec4_t hcolor ) {
line 632
;627:	int		count;
;628:	int		max;
;629:
;630:	// calculate the total points of damage that can
;631:	// be sustained at the current health / armor level
;632:	if ( health <= 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $308
line 633
;633:		VectorClear( hcolor );	// black
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 634
;634:		hcolor[3] = 1;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 635
;635:		return;
ADDRGP4 $307
JUMPV
LABELV $308
line 637
;636:	}
;637:	count = armor;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 638
;638:	max = health * ARMOR_PROTECTION / ( 1.0 - ARMOR_PROTECTION );
ADDRLP4 4
CNSTF4 1059648963
ADDRFP4 0
INDIRI4
CVIF4 4
MULF4
CNSTF4 1051595899
DIVF4
CVFI4 4
ASGNI4
line 639
;639:	if ( max < count ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $310
line 640
;640:		count = max;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 641
;641:	}
LABELV $310
line 642
;642:	health += count;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 645
;643:
;644:	// set the color based on health
;645:	hcolor[0] = 1.0;
ADDRFP4 8
INDIRP4
CNSTF4 1065353216
ASGNF4
line 646
;646:	hcolor[3] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 647
;647:	if ( health >= 100 ) {
ADDRFP4 0
INDIRI4
CNSTI4 100
LTI4 $312
line 648
;648:		hcolor[2] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 649
;649:	} else if ( health < 66 ) {
ADDRGP4 $313
JUMPV
LABELV $312
ADDRFP4 0
INDIRI4
CNSTI4 66
GEI4 $314
line 650
;650:		hcolor[2] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 651
;651:	} else {
ADDRGP4 $315
JUMPV
LABELV $314
line 652
;652:		hcolor[2] = ( health - 66 ) / 33.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 66
SUBI4
CVIF4 4
CNSTF4 1107558400
DIVF4
ASGNF4
line 653
;653:	}
LABELV $315
LABELV $313
line 655
;654:
;655:	if ( health > 60 ) {
ADDRFP4 0
INDIRI4
CNSTI4 60
LEI4 $316
line 656
;656:		hcolor[1] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 657
;657:	} else if ( health < 30 ) {
ADDRGP4 $317
JUMPV
LABELV $316
ADDRFP4 0
INDIRI4
CNSTI4 30
GEI4 $318
line 658
;658:		hcolor[1] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 659
;659:	} else {
ADDRGP4 $319
JUMPV
LABELV $318
line 660
;660:		hcolor[1] = ( health - 30 ) / 30.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
CNSTF4 1106247680
DIVF4
ASGNF4
line 661
;661:	}
LABELV $319
LABELV $317
line 662
;662:}
LABELV $307
endproc CG_GetColorForHealth 16 0
export CG_ColorForHealth
proc CG_ColorForHealth 0 12
line 669
;663:
;664:/*
;665:=================
;666:CG_ColorForHealth
;667:=================
;668:*/
;669:void CG_ColorForHealth( vec4_t hcolor ) {
line 671
;670:
;671:	CG_GetColorForHealth( cg.snap->ps.stats[STAT_HEALTH], 
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 673
;672:		cg.snap->ps.stats[STAT_ARMOR], hcolor );
;673:}
LABELV $320
endproc CG_ColorForHealth 0 12
data
align 4
LABELV propMap
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 8
byte 4 11
byte 4 122
byte 4 7
byte 4 154
byte 4 181
byte 4 14
byte 4 55
byte 4 122
byte 4 17
byte 4 79
byte 4 122
byte 4 18
byte 4 101
byte 4 122
byte 4 23
byte 4 153
byte 4 122
byte 4 18
byte 4 9
byte 4 93
byte 4 7
byte 4 207
byte 4 122
byte 4 8
byte 4 230
byte 4 122
byte 4 9
byte 4 177
byte 4 122
byte 4 18
byte 4 30
byte 4 152
byte 4 18
byte 4 85
byte 4 181
byte 4 7
byte 4 34
byte 4 93
byte 4 11
byte 4 110
byte 4 181
byte 4 6
byte 4 130
byte 4 152
byte 4 14
byte 4 22
byte 4 64
byte 4 17
byte 4 41
byte 4 64
byte 4 12
byte 4 58
byte 4 64
byte 4 17
byte 4 78
byte 4 64
byte 4 18
byte 4 98
byte 4 64
byte 4 19
byte 4 120
byte 4 64
byte 4 18
byte 4 141
byte 4 64
byte 4 18
byte 4 204
byte 4 64
byte 4 16
byte 4 162
byte 4 64
byte 4 17
byte 4 182
byte 4 64
byte 4 18
byte 4 59
byte 4 181
byte 4 7
byte 4 35
byte 4 181
byte 4 7
byte 4 203
byte 4 152
byte 4 14
byte 4 56
byte 4 93
byte 4 14
byte 4 228
byte 4 152
byte 4 14
byte 4 177
byte 4 181
byte 4 18
byte 4 28
byte 4 122
byte 4 22
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 60
byte 4 152
byte 4 7
byte 4 106
byte 4 151
byte 4 13
byte 4 83
byte 4 152
byte 4 7
byte 4 128
byte 4 122
byte 4 17
byte 4 4
byte 4 152
byte 4 21
byte 4 134
byte 4 181
byte 4 5
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 153
byte 4 152
byte 4 13
byte 4 11
byte 4 181
byte 4 5
byte 4 180
byte 4 152
byte 4 13
byte 4 79
byte 4 93
byte 4 17
byte 4 0
byte 4 0
byte 4 -1
align 4
LABELV propMapB
byte 4 11
byte 4 12
byte 4 33
byte 4 49
byte 4 12
byte 4 31
byte 4 85
byte 4 12
byte 4 31
byte 4 120
byte 4 12
byte 4 30
byte 4 156
byte 4 12
byte 4 21
byte 4 183
byte 4 12
byte 4 21
byte 4 207
byte 4 12
byte 4 32
byte 4 13
byte 4 55
byte 4 30
byte 4 49
byte 4 55
byte 4 13
byte 4 66
byte 4 55
byte 4 29
byte 4 101
byte 4 55
byte 4 31
byte 4 135
byte 4 55
byte 4 21
byte 4 158
byte 4 55
byte 4 40
byte 4 204
byte 4 55
byte 4 32
byte 4 12
byte 4 97
byte 4 31
byte 4 48
byte 4 97
byte 4 31
byte 4 82
byte 4 97
byte 4 30
byte 4 118
byte 4 97
byte 4 30
byte 4 153
byte 4 97
byte 4 30
byte 4 185
byte 4 97
byte 4 25
byte 4 213
byte 4 97
byte 4 30
byte 4 11
byte 4 139
byte 4 32
byte 4 42
byte 4 139
byte 4 51
byte 4 93
byte 4 139
byte 4 32
byte 4 126
byte 4 139
byte 4 31
byte 4 158
byte 4 139
byte 4 25
code
proc UI_DrawBannerString2 52 36
line 837
;674:
;675:
;676:
;677:
;678:// bk001205 - code below duplicated in q3_ui/ui-atoms.c
;679:// bk001205 - FIXME: does this belong in ui_shared.c?
;680:/*
;681:=================
;682:UI_DrawProportionalString2
;683:=================
;684:*/
;685:static int	propMap[128][3] = {
;686:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;687:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;688:
;689:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;690:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;691:
;692:{0, 0, PROP_SPACE_WIDTH},		// SPACE
;693:{11, 122, 7},	// !
;694:{154, 181, 14},	// "
;695:{55, 122, 17},	// #
;696:{79, 122, 18},	// $
;697:{101, 122, 23},	// %
;698:{153, 122, 18},	// &
;699:{9, 93, 7},		// '
;700:{207, 122, 8},	// (
;701:{230, 122, 9},	// )
;702:{177, 122, 18},	// *
;703:{30, 152, 18},	// +
;704:{85, 181, 7},	// ,
;705:{34, 93, 11},	// -
;706:{110, 181, 6},	// .
;707:{130, 152, 14},	// /
;708:
;709:{22, 64, 17},	// 0
;710:{41, 64, 12},	// 1
;711:{58, 64, 17},	// 2
;712:{78, 64, 18},	// 3
;713:{98, 64, 19},	// 4
;714:{120, 64, 18},	// 5
;715:{141, 64, 18},	// 6
;716:{204, 64, 16},	// 7
;717:{162, 64, 17},	// 8
;718:{182, 64, 18},	// 9
;719:{59, 181, 7},	// :
;720:{35,181, 7},	// ;
;721:{203, 152, 14},	// <
;722:{56, 93, 14},	// =
;723:{228, 152, 14},	// >
;724:{177, 181, 18},	// ?
;725:
;726:{28, 122, 22},	// @
;727:{5, 4, 18},		// A
;728:{27, 4, 18},	// B
;729:{48, 4, 18},	// C
;730:{69, 4, 17},	// D
;731:{90, 4, 13},	// E
;732:{106, 4, 13},	// F
;733:{121, 4, 18},	// G
;734:{143, 4, 17},	// H
;735:{164, 4, 8},	// I
;736:{175, 4, 16},	// J
;737:{195, 4, 18},	// K
;738:{216, 4, 12},	// L
;739:{230, 4, 23},	// M
;740:{6, 34, 18},	// N
;741:{27, 34, 18},	// O
;742:
;743:{48, 34, 18},	// P
;744:{68, 34, 18},	// Q
;745:{90, 34, 17},	// R
;746:{110, 34, 18},	// S
;747:{130, 34, 14},	// T
;748:{146, 34, 18},	// U
;749:{166, 34, 19},	// V
;750:{185, 34, 29},	// W
;751:{215, 34, 18},	// X
;752:{234, 34, 18},	// Y
;753:{5, 64, 14},	// Z
;754:{60, 152, 7},	// [
;755:{106, 151, 13},	// '\'
;756:{83, 152, 7},	// ]
;757:{128, 122, 17},	// ^
;758:{4, 152, 21},	// _
;759:
;760:{134, 181, 5},	// '
;761:{5, 4, 18},		// A
;762:{27, 4, 18},	// B
;763:{48, 4, 18},	// C
;764:{69, 4, 17},	// D
;765:{90, 4, 13},	// E
;766:{106, 4, 13},	// F
;767:{121, 4, 18},	// G
;768:{143, 4, 17},	// H
;769:{164, 4, 8},	// I
;770:{175, 4, 16},	// J
;771:{195, 4, 18},	// K
;772:{216, 4, 12},	// L
;773:{230, 4, 23},	// M
;774:{6, 34, 18},	// N
;775:{27, 34, 18},	// O
;776:
;777:{48, 34, 18},	// P
;778:{68, 34, 18},	// Q
;779:{90, 34, 17},	// R
;780:{110, 34, 18},	// S
;781:{130, 34, 14},	// T
;782:{146, 34, 18},	// U
;783:{166, 34, 19},	// V
;784:{185, 34, 29},	// W
;785:{215, 34, 18},	// X
;786:{234, 34, 18},	// Y
;787:{5, 64, 14},	// Z
;788:{153, 152, 13},	// {
;789:{11, 181, 5},	// |
;790:{180, 152, 13},	// }
;791:{79, 93, 17},	// ~
;792:{0, 0, -1}		// DEL
;793:};
;794:
;795:static int propMapB[26][3] = {
;796:{11, 12, 33},
;797:{49, 12, 31},
;798:{85, 12, 31},
;799:{120, 12, 30},
;800:{156, 12, 21},
;801:{183, 12, 21},
;802:{207, 12, 32},
;803:
;804:{13, 55, 30},
;805:{49, 55, 13},
;806:{66, 55, 29},
;807:{101, 55, 31},
;808:{135, 55, 21},
;809:{158, 55, 40},
;810:{204, 55, 32},
;811:
;812:{12, 97, 31},
;813:{48, 97, 31},
;814:{82, 97, 30},
;815:{118, 97, 30},
;816:{153, 97, 30},
;817:{185, 97, 25},
;818:{213, 97, 30},
;819:
;820:{11, 139, 32},
;821:{42, 139, 51},
;822:{93, 139, 32},
;823:{126, 139, 31},
;824:{158, 139, 25},
;825:};
;826:
;827:#define PROPB_GAP_WIDTH		4
;828:#define PROPB_SPACE_WIDTH	12
;829:#define PROPB_HEIGHT		36
;830:
;831:/*
;832:=================
;833:UI_DrawBannerString
;834:=================
;835:*/
;836:static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
;837:{
line 850
;838:	const char* s;
;839:	unsigned char	ch; // bk001204 : array subscript
;840:	float	ax;
;841:	float	ay;
;842:	float	aw;
;843:	float	ah;
;844:	float	frow;
;845:	float	fcol;
;846:	float	fwidth;
;847:	float	fheight;
;848:
;849:	// draw the colored text
;850:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 852
;851:	
;852:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+339016
INDIRF4
MULF4
ADDRGP4 cgs+339024
INDIRF4
ADDF4
ASGNF4
line 853
;853:	ay = y * cgs.screenYScale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+339020
INDIRF4
MULF4
ASGNF4
line 855
;854:
;855:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $328
JUMPV
LABELV $327
line 857
;856:	while ( *s )
;857:	{
line 858
;858:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 859
;859:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $330
line 860
;860:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH)* cgs.screenXScale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1098907648
ADDRGP4 cgs+339016
INDIRF4
MULF4
ADDF4
ASGNF4
line 861
;861:		}
ADDRGP4 $331
JUMPV
LABELV $330
line 862
;862:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 40
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $333
ADDRLP4 40
INDIRI4
CNSTI4 90
GTI4 $333
line 863
;863:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 65
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 864
;864:			fcol = (float)propMapB[ch][0] / 256.0f;
ADDRLP4 20
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 865
;865:			frow = (float)propMapB[ch][1] / 256.0f;
ADDRLP4 16
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 866
;866:			fwidth = (float)propMapB[ch][2] / 256.0f;
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 867
;867:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1041235968
ASGNF4
line 868
;868:			aw = (float)propMapB[ch][2] * cgs.screenXScale;
ADDRLP4 12
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 cgs+339016
INDIRF4
MULF4
ASGNF4
line 869
;869:			ah = (float)PROPB_HEIGHT * cgs.screenXScale;
ADDRLP4 24
CNSTF4 1108344832
ADDRGP4 cgs+339016
INDIRF4
MULF4
ASGNF4
line 870
;870:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, cgs.media.charsetPropB );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+956380+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 871
;871:			ax += (aw + (float)PROPB_GAP_WIDTH * cgs.screenXScale);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1082130432
ADDRGP4 cgs+339016
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 872
;872:		}
LABELV $333
LABELV $331
line 873
;873:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 874
;874:	}
LABELV $328
line 856
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $327
line 876
;875:
;876:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 877
;877:}
LABELV $323
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 44 16
line 879
;878:
;879:void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
line 886
;880:	const char *	s;
;881:	int				ch;
;882:	int				width;
;883:	vec4_t			drawcolor;
;884:
;885:	// find the width of the drawn text
;886:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 887
;887:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $345
JUMPV
LABELV $344
line 888
;888:	while ( *s ) {
line 889
;889:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 890
;890:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $347
line 891
;891:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 892
;892:		}
ADDRGP4 $348
JUMPV
LABELV $347
line 893
;893:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $349
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $349
line 894
;894:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 propMapB-780+8
ADDP4
INDIRI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 895
;895:		}
LABELV $349
LABELV $348
line 896
;896:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 897
;897:	}
LABELV $345
line 888
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $344
line 898
;898:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 900
;899:
;900:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $354
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $356
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $357
ADDRGP4 $354
JUMPV
LABELV $356
line 902
;901:		case UI_CENTER:
;902:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 903
;903:			break;
ADDRGP4 $354
JUMPV
LABELV $357
line 906
;904:
;905:		case UI_RIGHT:
;906:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 907
;907:			break;
line 911
;908:
;909:		case UI_LEFT:
;910:		default:
;911:			break;
LABELV $354
line 914
;912:	}
;913:
;914:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $359
line 915
;915:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 916
;916:		drawcolor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 917
;917:		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 918
;918:	}
LABELV $359
line 920
;919:
;920:	UI_DrawBannerString2( x, y, str, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 921
;921:}
LABELV $343
endproc UI_DrawBannerString 44 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 20 4
line 924
;922:
;923:
;924:int UI_ProportionalStringWidth( const char* str ) {
line 930
;925:	const char *	s;
;926:	int				ch;
;927:	int				charWidth;
;928:	int				width;
;929:
;930:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 931
;931:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $366
JUMPV
LABELV $365
line 932
;932:	while ( *s ) {
line 933
;933:		ch = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 934
;934:		charWidth = propMap[ch][2];
ADDRLP4 4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 935
;935:		if ( charWidth != -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $369
line 936
;936:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 937
;937:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRGP4 cl_propgapwidth+12
INDIRI4
ADDI4
ASGNI4
line 938
;938:		}
LABELV $369
line 939
;939:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 940
;940:	}
LABELV $366
line 932
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $365
line 942
;941:
;942:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRGP4 cl_propgapwidth+12
INDIRI4
SUBI4
ASGNI4
line 943
;943:	if(ifstrlenru(str)){
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 ifstrlenru
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $373
line 944
;944:		return width * 0.5;	
CNSTF4 1056964608
ADDRLP4 12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
RETI4
ADDRGP4 $364
JUMPV
LABELV $373
line 945
;945:	} else {
line 946
;946:		return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $364
endproc UI_ProportionalStringWidth 20 4
proc UI_DrawProportionalString2 48 36
line 951
;947:	}
;948:}
;949:
;950:static void UI_DrawProportionalString2( int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
;951:{
line 964
;952:	const char* s;
;953:	unsigned char	ch; // bk001204 - unsigned
;954:	float	ax;
;955:	float	ay;
;956:	float	aw;
;957:	float	ah;
;958:	float	frow;
;959:	float	fcol;
;960:	float	fwidth;
;961:	float	fheight;
;962:
;963:	// draw the colored text
;964:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 966
;965:	
;966:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+339016
INDIRF4
MULF4
ADDRGP4 cgs+339024
INDIRF4
ADDF4
ASGNF4
line 967
;967:	ay = y * cgs.screenXScale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+339016
INDIRF4
MULF4
ASGNF4
line 969
;968:
;969:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $380
JUMPV
LABELV $379
line 971
;970:	while ( *s )
;971:	{
line 972
;972:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 973
;973:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $382
line 974
;974:			aw = (float)PROP_SPACE_WIDTH * cgs.screenXScale * sizeScale;
ADDRLP4 8
CNSTF4 1090519040
ADDRGP4 cgs+339016
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 975
;975:		} else if ( propMap[ch][2] != -1 ) {
ADDRGP4 $383
JUMPV
LABELV $382
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $385
line 976
;976:			fcol = (float)propMap[ch][0] / 256.0f;
ADDRLP4 20
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 977
;977:			frow = (float)propMap[ch][1] / 256.0f;
ADDRLP4 16
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 978
;978:			fwidth = (float)propMap[ch][2] / 256.0f;
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 979
;979:			fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 980
;980:			aw = (float)propMap[ch][2] * cgs.screenXScale * sizeScale;
ADDRLP4 8
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 cgs+339016
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 981
;981:			ah = (float)PROP_HEIGHT * cgs.screenXScale * sizeScale;
ADDRLP4 24
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
ADDRGP4 cgs+339016
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 982
;982:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, charset );
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 983
;983:		} else {
ADDRGP4 $386
JUMPV
LABELV $385
line 984
;984:			aw = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 985
;985:		}
LABELV $386
LABELV $383
line 987
;986:
;987:		ax += (aw + (float)PROP_GAP_WIDTH * cgs.screenXScale * sizeScale);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 cl_propgapwidth+12
INDIRI4
CVIF4 4
ADDRGP4 cgs+339016
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 988
;988:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 989
;989:	}
LABELV $380
line 970
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $379
line 991
;990:
;991:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 992
;992:}
LABELV $375
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 999
;993:
;994:/*
;995:=================
;996:UI_ProportionalSizeScale
;997:=================
;998:*/
;999:float UI_ProportionalSizeScale( int style ) {
line 1000
;1000:	if(  style & UI_SMALLFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $398
line 1001
;1001:		return 0.75;
CNSTF4 1061158912
RETF4
ADDRGP4 $397
JUMPV
LABELV $398
line 1004
;1002:	}
;1003:
;1004:	return 1;
CNSTF4 1065353216
RETF4
LABELV $397
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 1013
;1005:}
;1006:
;1007:
;1008:/*
;1009:=================
;1010:UI_DrawProportionalString
;1011:=================
;1012:*/
;1013:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color ) {
line 1018
;1014:	vec4_t	drawcolor;
;1015:	int		width;
;1016:	float	sizeScale;
;1017:
;1018:	sizeScale = UI_ProportionalSizeScale( style );
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 24
INDIRF4
ASGNF4
line 1020
;1019:
;1020:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $402
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $404
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $405
ADDRGP4 $402
JUMPV
LABELV $404
line 1022
;1021:		case UI_CENTER:
;1022:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1023
;1023:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1024
;1024:			break;
ADDRGP4 $402
JUMPV
LABELV $405
line 1027
;1025:
;1026:		case UI_RIGHT:
;1027:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1028
;1028:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1029
;1029:			break;
line 1033
;1030:
;1031:		case UI_LEFT:
;1032:		default:
;1033:			break;
LABELV $402
line 1036
;1034:	}
;1035:
;1036:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $407
line 1037
;1037:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ASGNF4
line 1038
;1038:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1039
;1039:		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, cgs.media.charsetProp );
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+956380+8
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1040
;1040:	}
LABELV $407
line 1042
;1041:
;1042:	if ( style & UI_INVERSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $414
line 1043
;1043:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1044
;1044:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 1045
;1045:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1046
;1046:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1047
;1047:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, cgs.media.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+956380+8
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1048
;1048:		return;
ADDRGP4 $400
JUMPV
LABELV $414
line 1051
;1049:	}
;1050:
;1051:	if ( style & UI_PULSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $421
line 1052
;1052:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1053
;1053:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 1054
;1054:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1055
;1055:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1056
;1056:		UI_DrawProportionalString2( x, y, str, color, sizeScale, cgs.media.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+956380+8
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1058
;1057:
;1058:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 1059
;1059:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1060
;1060:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 1061
;1061:		drawcolor[3] = 0.5 + 0.5 * sin( cg.time / PULSE_DIVISOR );
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
CNSTF4 1056964608
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1062
;1062:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, cgs.media.charsetPropGlow );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+956380+12
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1063
;1063:		return;
ADDRGP4 $400
JUMPV
LABELV $421
line 1066
;1064:	}
;1065:
;1066:	UI_DrawProportionalString2( x, y, str, color, sizeScale, cgs.media.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cgs+956380+8
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1067
;1067:}
LABELV $400
endproc UI_DrawProportionalString 44 24
data
export teamcolormodels
align 4
LABELV teamcolormodels
byte 4 1056964608
byte 4 1056964608
byte 4 1056964608
byte 4 1056964608
byte 4 1033476506
byte 4 0
byte 4 1056964608
byte 4 1028443341
byte 4 1056964608
skip 12
export CG_InsideBox
code
proc CG_InsideBox 20 0
line 1087
;1068:
;1069:
;1070:/*float teamcolormodels[TEAM_NUM_TEAMS][3] = {
;1071:	{ 0.5f, 0.5f, 0.5f },	// free
;1072:	{ 0.5f, 0.075f, 0 },	// red
;1073:	{ 0, 0.075f, 0.5f },	// blue
;1074:	{ 0.075f, 0.5f, 0 },	// green
;1075:	{ 0.5f, 0.5f, 0.05f },	// gold
;1076:	{ 0.075f, 0.5f, 0.5f },	// cyan
;1077:	{ 0.5f, 0.05f, 0.5f },	// magenta
;1078:	{ 0.5f, 0.5f, 0.5f }	// spectator
;1079:};*/
;1080:
;1081:float teamcolormodels[TEAM_NUM_TEAMS][3] = {
;1082:	{ 0.5f, 0.5f, 0.5f },	// free
;1083:	{ 0.5f, 0.075f, 0 },	// red
;1084:	{ 0.5f, 0.05f, 0.5f },	// magenta
;1085:};
;1086:
;1087:qboolean CG_InsideBox( vec3_t mins, vec3_t maxs, vec3_t pos ){
line 1088
;1088:	if (pos[0] < mins[0] || pos[0] > maxs[0]) return qfalse;
ADDRLP4 0
ADDRFP4 8
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
INDIRF4
LTF4 $439
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
LEF4 $437
LABELV $439
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $437
line 1089
;1089:	if (pos[1] < mins[1] || pos[1] > maxs[1]) return qfalse;
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 8
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
LTF4 $442
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
LEF4 $440
LABELV $442
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $440
line 1090
;1090:	if (pos[2] < mins[2] || pos[2] > maxs[2]) return qfalse;
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 16
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
LTF4 $445
ADDRLP4 16
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
LEF4 $443
LABELV $445
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $443
line 1092
;1091:
;1092:	return qtrue;
CNSTI4 1
RETI4
LABELV $436
endproc CG_InsideBox 20 0
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
import CG_AddToGenericConsole
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModelCopy
import CG_Draw3DModel
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
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrintRus
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import CG_DrawFade
import CG_Fade
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawString
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
