export Com_Clamp
code
proc Com_Clamp 0 0
file "../../../code/qcommon/q_shared.c"
line 27
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
;23:// q_shared.c -- stateless support routines that are included in each code dll
;24:#include "q_shared.h"
;25:#include "bg_public.h"
;26:
;27:float Com_Clamp( float min, float max, float value ) {
line 28
;28:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $48
line 29
;29:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $47
JUMPV
LABELV $48
line 31
;30:	}
;31:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $50
line 32
;32:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $47
JUMPV
LABELV $50
line 34
;33:	}
;34:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $47
endproc Com_Clamp 0 0
export vectoyaw
proc vectoyaw 20 8
line 38
;35:}
;36:
;37:// STONELANCE
;38:float vectoyaw( const vec3_t vec ) {
line 41
;39:	float	yaw;
;40:	
;41:	if (vec[YAW] == 0 && vec[PITCH] == 0) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $53
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $53
line 42
;42:		yaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 43
;43:	} else {
ADDRGP4 $54
JUMPV
LABELV $53
line 44
;44:		if (vec[PITCH]) {
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $55
line 45
;45:			yaw = ( atan2( vec[YAW], vec[PITCH]) * M_180_PI );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1113927393
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 46
;46:		} else if (vec[YAW] > 0) {
ADDRGP4 $56
JUMPV
LABELV $55
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $57
line 47
;47:			yaw = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 48
;48:		} else {
ADDRGP4 $58
JUMPV
LABELV $57
line 49
;49:			yaw = 270;
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
line 50
;50:		}
LABELV $58
LABELV $56
line 51
;51:		if (yaw < 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $59
line 52
;52:			yaw += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 53
;53:		}
LABELV $59
line 54
;54:	}
LABELV $54
line 56
;55:
;56:	return yaw;
ADDRLP4 0
INDIRF4
RETF4
LABELV $52
endproc vectoyaw 20 8
export AngleDifference
proc AngleDifference 4 0
line 66
;57:}
;58:
;59:/*
;60:==============
;61:AngleDifference
;62:
;63:returns the difference between the two angles
;64:==============
;65:*/
;66:float AngleDifference(float ang1, float ang2) {
line 69
;67:	float diff;
;68:
;69:	diff = ang1 - ang2;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
line 70
;70:	if (ang1 > ang2) {
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $62
line 71
;71:		if (diff > 180.0) diff -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $63
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 72
;72:	}
ADDRGP4 $63
JUMPV
LABELV $62
line 73
;73:	else {
line 74
;74:		if (diff < -180.0) diff += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $66
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $66
line 75
;75:	}
LABELV $63
line 76
;76:	return diff;
ADDRLP4 0
INDIRF4
RETF4
LABELV $61
endproc AngleDifference 4 0
export COM_SkipPath
proc COM_SkipPath 4 0
line 85
;77:}
;78:
;79:/*
;80:============
;81:COM_SkipPath
;82:============
;83:*/
;84:char *COM_SkipPath (char *pathname)
;85:{
line 88
;86:	char	*last;
;87:	
;88:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $70
JUMPV
LABELV $69
line 90
;89:	while (*pathname)
;90:	{
line 91
;91:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $72
line 92
;92:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $72
line 93
;93:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 94
;94:	}
LABELV $70
line 89
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $69
line 95
;95:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $68
endproc COM_SkipPath 4 0
export COM_GetExtension
proc COM_GetExtension 16 4
line 103
;96:}
;97:
;98:/*
;99:============
;100:COM_GetExtension
;101:============
;102:*/
;103:const char *COM_GetExtension( const char *name ) {
line 106
;104:	int length, i;
;105:
;106:	length = strlen(name)-1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 107
;107:	i = length;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $76
JUMPV
LABELV $75
line 110
;108:
;109:	while (name[i] != '.')
;110:	{
line 111
;111:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 112
;112:		if (name[i] == '/' || i == 0)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $80
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $78
LABELV $80
line 113
;113:			return ""; // no extension
ADDRGP4 $81
RETP4
ADDRGP4 $74
JUMPV
LABELV $78
line 114
;114:	}
LABELV $76
line 109
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $75
line 116
;115:
;116:	return &name[i+1];
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
RETP4
LABELV $74
endproc COM_GetExtension 16 4
export COM_StripExtension
proc COM_StripExtension 12 12
line 125
;117:}
;118:
;119:
;120:/*
;121:============
;122:COM_StripExtension
;123:============
;124:*/
;125:void COM_StripExtension( const char *in, char *out, int destsize ) {
line 128
;126:	int             length;
;127:
;128:	Q_strncpyz(out, in, destsize);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 130
;129:
;130:	length = strlen(out)-1;
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $84
JUMPV
LABELV $83
line 132
;131:	while (length > 0 && out[length] != '.')
;132:	{
line 133
;133:		length--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 134
;134:		if (out[length] == '/')
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $86
line 135
;135:			return;		// no extension
ADDRGP4 $82
JUMPV
LABELV $86
line 136
;136:	}
LABELV $84
line 131
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $88
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $83
LABELV $88
line 137
;137:	if (length)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $89
line 138
;138:		out[length] = 0;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $89
line 139
;139:}
LABELV $82
endproc COM_StripExtension 12 12
export COM_StripExtensionOld
proc COM_StripExtensionOld 12 0
line 147
;140:
;141:
;142:/*
;143:============
;144:COM_StripExtension
;145:============
;146:*/
;147:void COM_StripExtensionOld( const char *in, char *out, int destsize ) {
ADDRGP4 $93
JUMPV
LABELV $92
line 148
;148:	while ( *in && *in != '.' ) {
line 149
;149:		*out++ = *in++;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI1
ASGNI1
line 150
;150:	}
LABELV $93
line 148
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $95
ADDRLP4 0
INDIRI4
CNSTI4 46
NEI4 $92
LABELV $95
line 151
;151:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 152
;152:}
LABELV $91
endproc COM_StripExtensionOld 12 0
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 160
;153:
;154:
;155:/*
;156:==================
;157:COM_DefaultExtension
;158:==================
;159:*/
;160:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 168
;161:	char	oldPath[MAX_QPATH];
;162:	char    *src;
;163:
;164://
;165:// if path doesn't have a .EXT, append extension
;166:// (extension should include the .)
;167://
;168:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $98
JUMPV
LABELV $97
line 170
;169:
;170:	while (*src != '/' && src != path) {
line 171
;171:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $100
line 172
;172:			return;                 // it has an extension
ADDRGP4 $96
JUMPV
LABELV $100
line 174
;173:		}
;174:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 175
;175:	}
LABELV $98
line 170
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $102
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $97
LABELV $102
line 177
;176:
;177:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 178
;178:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $103
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 179
;179:}
LABELV $96
endproc COM_DefaultExtension 76 20
export ShortSwap
proc ShortSwap 2 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 211
;180:
;181:/*
;182:============================================================================
;183:
;184:					BYTE ORDER FUNCTIONS
;185:
;186:============================================================================
;187:*/
;188:/*
;189:// can't just use function pointers, or dll linkage can
;190:// mess up when qcommon is included in multiple places
;191:static short	(*_BigShort) (short l);
;192:static short	(*_LittleShort) (short l);
;193:static int		(*_BigLong) (int l);
;194:static int		(*_LittleLong) (int l);
;195:static qint64	(*_BigLong64) (qint64 l);
;196:static qint64	(*_LittleLong64) (qint64 l);
;197:static float	(*_BigFloat) (const float *l);
;198:static float	(*_LittleFloat) (const float *l);
;199:
;200:short	BigShort(short l){return _BigShort(l);}
;201:short	LittleShort(short l) {return _LittleShort(l);}
;202:int		BigLong (int l) {return _BigLong(l);}
;203:int		LittleLong (int l) {return _LittleLong(l);}
;204:qint64 	BigLong64 (qint64 l) {return _BigLong64(l);}
;205:qint64 	LittleLong64 (qint64 l) {return _LittleLong64(l);}
;206:float	BigFloat (const float *l) {return _BigFloat(l);}
;207:float	LittleFloat (const float *l) {return _LittleFloat(l);}
;208:*/
;209:
;210:short   ShortSwap (short l)
;211:{
line 214
;212:	byte    b1,b2;
;213:
;214:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 215
;215:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 217
;216:
;217:	return (b1<<8) + b2;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
ADDI4
CVII2 4
CVII4 2
RETI4
LABELV $104
endproc ShortSwap 2 0
export ShortNoSwap
proc ShortNoSwap 0 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 221
;218:}
;219:
;220:short	ShortNoSwap (short l)
;221:{
line 222
;222:	return l;
ADDRFP4 0
INDIRI2
CVII4 2
RETI4
LABELV $105
endproc ShortNoSwap 0 0
export LongSwap
proc LongSwap 4 0
line 226
;223:}
;224:
;225:int    LongSwap (int l)
;226:{
line 229
;227:	byte    b1,b2,b3,b4;
;228:
;229:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 230
;230:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 231
;231:	b3 = (l>>16)&255;
ADDRLP4 2
ADDRFP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 232
;232:	b4 = (l>>24)&255;
ADDRLP4 3
ADDRFP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 234
;233:
;234:	return ((int)b1<<24) + ((int)b2<<16) + ((int)b3<<8) + b4;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 24
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 16
LSHI4
ADDI4
ADDRLP4 2
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDI4
ADDRLP4 3
INDIRU1
CVUI4 1
ADDI4
RETI4
LABELV $106
endproc LongSwap 4 0
export LongNoSwap
proc LongNoSwap 0 0
line 238
;235:}
;236:
;237:int	LongNoSwap (int l)
;238:{
line 239
;239:	return l;
ADDRFP4 0
INDIRI4
RETI4
LABELV $107
endproc LongNoSwap 0 0
export Long64Swap
proc Long64Swap 8 0
line 243
;240:}
;241:
;242:qint64 Long64Swap (qint64 ll)
;243:{
line 246
;244:	qint64	result;
;245:
;246:	result.b0 = ll.b7;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 7
ADDP4
INDIRU1
ASGNU1
line 247
;247:	result.b1 = ll.b6;
ADDRLP4 0+1
ADDRFP4 4
INDIRP4
CNSTI4 6
ADDP4
INDIRU1
ASGNU1
line 248
;248:	result.b2 = ll.b5;
ADDRLP4 0+2
ADDRFP4 4
INDIRP4
CNSTI4 5
ADDP4
INDIRU1
ASGNU1
line 249
;249:	result.b3 = ll.b4;
ADDRLP4 0+3
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRU1
ASGNU1
line 250
;250:	result.b4 = ll.b3;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
ASGNU1
line 251
;251:	result.b5 = ll.b2;
ADDRLP4 0+5
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
ASGNU1
line 252
;252:	result.b6 = ll.b1;
ADDRLP4 0+6
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
ASGNU1
line 253
;253:	result.b7 = ll.b0;
ADDRLP4 0+7
ADDRFP4 4
INDIRP4
INDIRU1
ASGNU1
line 255
;254:
;255:	return result;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 8
LABELV $108
endproc Long64Swap 8 0
export Long64NoSwap
proc Long64NoSwap 0 0
line 259
;256:}
;257:
;258:qint64 Long64NoSwap (qint64 ll)
;259:{
line 260
;260:	return ll;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
LABELV $117
endproc Long64NoSwap 0 0
export FloatSwap
proc FloatSwap 8 4
line 268
;261:}
;262:
;263:typedef union {
;264:    float	f;
;265:    unsigned int i;
;266:} _FloatByteUnion;
;267:
;268:float FloatSwap (const float *f) {
line 271
;269:	_FloatByteUnion out;
;270:
;271:	out.f = *f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 272
;272:	out.i = LongSwap(out.i);
ADDRLP4 0
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 4
ADDRGP4 LongSwap
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CVIU4 4
ASGNU4
line 274
;273:
;274:	return out.f;
ADDRLP4 0
INDIRF4
RETF4
LABELV $120
endproc FloatSwap 8 4
export FloatNoSwap
proc FloatNoSwap 0 0
line 278
;275:}
;276:
;277:float FloatNoSwap (const float *f)
;278:{
line 279
;279:	return *f;
ADDRFP4 0
INDIRP4
INDIRF4
RETF4
LABELV $121
endproc FloatNoSwap 0 0
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 332
;280:}
;281:
;282:/*
;283:================
;284:Swap_Init
;285:================
;286:*/
;287:/*
;288:void Swap_Init (void)
;289:{
;290:	byte	swaptest[2] = {1,0};
;291:
;292:// set the byte swapping variables in a portable manner	
;293:	if ( *(short *)swaptest == 1)
;294:	{
;295:		_BigShort = ShortSwap;
;296:		_LittleShort = ShortNoSwap;
;297:		_BigLong = LongSwap;
;298:		_LittleLong = LongNoSwap;
;299:		_BigLong64 = Long64Swap;
;300:		_LittleLong64 = Long64NoSwap;
;301:		_BigFloat = FloatSwap;
;302:		_LittleFloat = FloatNoSwap;
;303:	}
;304:	else
;305:	{
;306:		_BigShort = ShortNoSwap;
;307:		_LittleShort = ShortSwap;
;308:		_BigLong = LongNoSwap;
;309:		_LittleLong = LongSwap;
;310:		_BigLong64 = Long64NoSwap;
;311:		_LittleLong64 = Long64Swap;
;312:		_BigFloat = FloatNoSwap;
;313:		_LittleFloat = FloatSwap;
;314:	}
;315:
;316:}
;317:*/
;318:
;319:/*
;320:============================================================================
;321:
;322:PARSING
;323:
;324:============================================================================
;325:*/
;326:
;327:static	char	com_token[MAX_TOKEN_CHARS];
;328:static	char	com_parsename[MAX_TOKEN_CHARS];
;329:static	int		com_lines;
;330:
;331:void COM_BeginParseSession( const char *name )
;332:{
line 333
;333:	com_lines = 0;
ADDRGP4 com_lines
CNSTI4 0
ASGNI4
line 334
;334:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $123
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 335
;335:}
LABELV $122
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 338
;336:
;337:int COM_GetCurrentParseLine( void )
;338:{
line 339
;339:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $124
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 343
;340:}
;341:
;342:char *COM_Parse( char **data_p )
;343:{
line 344
;344:	return COM_ParseExt( data_p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $125
endproc COM_Parse 4 8
bss
align 1
LABELV $127
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 348
;345:}
;346:
;347:void COM_ParseError( char *format, ... )
;348:{
line 352
;349:	va_list argptr;
;350:	static char string[4096];
;351:
;352:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 353
;353:	Q_vsnprintf (string, sizeof(string), format, argptr);
ADDRGP4 $127
ARGP4
CNSTI4 4096
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 354
;354:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 356
;355:
;356:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $129
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $127
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 357
;357:}
LABELV $126
endproc COM_ParseError 4 16
bss
align 1
LABELV $131
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 360
;358:
;359:void COM_ParseWarning( char *format, ... )
;360:{
line 364
;361:	va_list argptr;
;362:	static char string[4096];
;363:
;364:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 365
;365:	Q_vsnprintf (string, sizeof(string), format, argptr);
ADDRGP4 $131
ARGP4
CNSTI4 4096
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 366
;366:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 368
;367:
;368:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $133
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $131
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 369
;369:}
LABELV $130
endproc COM_ParseWarning 4 16
proc SkipWhitespace 8 0
line 383
;370:
;371:/*
;372:==============
;373:COM_Parse
;374:
;375:Parse a token out of a string
;376:Will never return NULL, just empty strings
;377:
;378:If "allowLineBreaks" is qtrue then an empty
;379:string will be returned if the next token is
;380:a newline.
;381:==============
;382:*/
;383:static char *SkipWhitespace( char *data, qboolean *hasNewLines ) {
ADDRGP4 $136
JUMPV
LABELV $135
line 386
;384:	int c;
;385:
;386:	while( (c = *data) <= ' ') {
line 387
;387:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $138
line 388
;388:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $134
JUMPV
LABELV $138
line 390
;389:		}
;390:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $140
line 391
;391:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 392
;392:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 393
;393:		}
LABELV $140
line 394
;394:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 395
;395:	}
LABELV $136
line 386
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $135
line 397
;396:
;397:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $134
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 48 0
line 400
;398:}
;399:
;400:int COM_Compress( char *data_p ) {
line 403
;401:	char *in, *out;
;402:	int c;
;403:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 405
;404:
;405:	in = out = data_p;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 406
;406:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $143
ADDRGP4 $146
JUMPV
LABELV $145
line 407
;407:		while ((c = *in) != 0) {
line 409
;408:			// skip double slash comments
;409:			if ( c == '/' && in[1] == '/' ) {
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $148
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $148
ADDRGP4 $151
JUMPV
LABELV $150
line 410
;410:				while (*in && *in != '\n') {
line 411
;411:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 412
;412:				}
LABELV $151
line 410
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $153
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $150
LABELV $153
line 414
;413:			// skip /* */ comments
;414:			} else if ( c == '/' && in[1] == '*' ) {
ADDRGP4 $149
JUMPV
LABELV $148
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $154
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $154
ADDRGP4 $157
JUMPV
LABELV $156
line 416
;415:				while ( *in && ( *in != '*' || in[1] != '/' ) ) 
;416:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $157
line 415
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $159
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $156
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $156
LABELV $159
line 417
;417:				if ( *in ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $155
line 418
;418:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 420
;419:                        // record when we hit a newline
;420:                        } else if ( c == '\n' || c == '\r' ) {
ADDRGP4 $155
JUMPV
LABELV $154
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $164
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $162
LABELV $164
line 421
;421:                            newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 422
;422:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 424
;423:                        // record when we hit whitespace
;424:                        } else if ( c == ' ' || c == '\t') {
ADDRGP4 $163
JUMPV
LABELV $162
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $167
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $165
LABELV $167
line 425
;425:                            whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 426
;426:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 428
;427:                        // an actual token
;428:			} else {
ADDRGP4 $166
JUMPV
LABELV $165
line 430
;429:                            // if we have a pending newline, emit it (and it counts as whitespace)
;430:                            if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $168
line 431
;431:                                *out++ = '\n';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 10
ASGNI1
line 432
;432:                                newline = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 433
;433:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 434
;434:                            } if (whitespace) {
LABELV $168
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $170
line 435
;435:                                *out++ = ' ';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 32
ASGNI1
line 436
;436:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 437
;437:                            }
LABELV $170
line 440
;438:                            
;439:                            // copy quoted strings unmolested
;440:                            if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $172
line 441
;441:                                    *out++ = c;
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 442
;442:                                    in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $175
JUMPV
LABELV $174
line 443
;443:                                    while (1) {
line 444
;444:                                        c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 445
;445:                                        if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $176
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $176
line 446
;446:                                            *out++ = c;
ADDRLP4 44
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 447
;447:                                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 448
;448:                                        } else {
line 449
;449:                                            break;
LABELV $178
line 451
;450:                                        }
;451:                                    }
LABELV $175
line 443
ADDRGP4 $174
JUMPV
LABELV $176
line 452
;452:                                    if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $173
line 453
;453:                                        *out++ = c;
ADDRLP4 40
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 454
;454:                                        in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 455
;455:                                    }
line 456
;456:                            } else {
ADDRGP4 $173
JUMPV
LABELV $172
line 457
;457:                                *out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 458
;458:                                out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 459
;459:                                in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 460
;460:                            }
LABELV $173
line 461
;461:			}
LABELV $166
LABELV $163
LABELV $155
LABELV $149
line 462
;462:		}
LABELV $146
line 407
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $145
line 463
;463:            *out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 464
;464:            return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
ADDRGP4 $142
JUMPV
LABELV $143
line 466
;465:	}
;466:        return 0;
CNSTI4 0
RETI4
LABELV $142
endproc COM_Compress 48 0
export COM_ParseExt
proc COM_ParseExt 36 8
line 470
;467:}
;468:
;469:char *COM_ParseExt( char **data_p, qboolean allowLineBreaks )
;470:{
line 471
;471:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 472
;472:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 475
;473:	char *data;
;474:
;475:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 476
;476:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 477
;477:	com_token[0] = 0;
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 480
;478:
;479:	// make sure incoming data is valid
;480:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $185
line 481
;481:	{
line 482
;482:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 483
;483:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $181
JUMPV
LABELV $184
line 487
;484:	}
;485:
;486:	while ( 1 )
;487:	{
line 489
;488:		// skip whitespace
;489:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 490
;490:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $187
line 491
;491:		{
line 492
;492:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 493
;493:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $181
JUMPV
LABELV $187
line 495
;494:		}
;495:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $189
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $189
line 496
;496:		{
line 497
;497:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 498
;498:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $181
JUMPV
LABELV $189
line 501
;499:		}
;500:
;501:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 504
;502:
;503:		// skip double slash comments
;504:		if ( c == '/' && data[1] == '/' )
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $191
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $191
line 505
;505:		{
line 506
;506:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $194
JUMPV
LABELV $193
line 507
;507:			while (*data && *data != '\n') {
line 508
;508:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 509
;509:			}
LABELV $194
line 507
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $196
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $193
LABELV $196
line 510
;510:		}
ADDRGP4 $192
JUMPV
LABELV $191
line 512
;511:		// skip /* */ comments
;512:		else if ( c=='/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $186
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $186
line 513
;513:		{
line 514
;514:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $200
JUMPV
LABELV $199
line 516
;515:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;516:			{
line 517
;517:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 518
;518:			}
LABELV $200
line 515
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $202
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $199
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $199
LABELV $202
line 519
;519:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $198
line 520
;520:			{
line 521
;521:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 522
;522:			}
line 523
;523:		}
line 525
;524:		else
;525:		{
line 526
;526:			break;
LABELV $198
LABELV $192
line 528
;527:		}
;528:	}
LABELV $185
line 486
ADDRGP4 $184
JUMPV
LABELV $186
line 531
;529:
;530:	// handle quoted strings
;531:	if (c == '\"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $205
line 532
;532:	{
line 533
;533:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $208
JUMPV
LABELV $207
line 535
;534:		while (1)
;535:		{
line 536
;536:			c = *data++;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 537
;537:			if (c=='\"' || !c)
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $212
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $210
LABELV $212
line 538
;538:			{
line 539
;539:				com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 540
;540:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 541
;541:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $181
JUMPV
LABELV $210
line 543
;542:			}
;543:			if (len < MAX_TOKEN_CHARS - 1)
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $213
line 544
;544:			{
line 545
;545:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 546
;546:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 547
;547:			}
LABELV $213
line 548
;548:		}
LABELV $208
line 534
ADDRGP4 $207
JUMPV
line 549
;549:	}
LABELV $205
LABELV $215
line 553
;550:
;551:	// parse a regular word
;552:	do
;553:	{
line 554
;554:		if (len < MAX_TOKEN_CHARS - 1)
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $218
line 555
;555:		{
line 556
;556:			com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 557
;557:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 558
;558:		}
LABELV $218
line 559
;559:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 560
;560:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 561
;561:		if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $220
line 562
;562:			com_lines++;
ADDRLP4 16
ADDRGP4 com_lines
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $220
line 563
;563:	} while (c>32);
LABELV $216
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $215
line 565
;564:
;565:	com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 567
;566:
;567:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 568
;568:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $181
endproc COM_ParseExt 36 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 632
;569:}
;570:
;571:
;572:#if 0
;573:// no longer used
;574:/*
;575:===============
;576:COM_ParseInfos
;577:===============
;578:*/
;579:int COM_ParseInfos( char *buf, int max, char infos[][MAX_INFO_STRING] ) {
;580:	char	*token;
;581:	int		count;
;582:	char	key[MAX_TOKEN_CHARS];
;583:
;584:	count = 0;
;585:
;586:	while ( 1 ) {
;587:		token = COM_Parse( &buf );
;588:		if ( !token[0] ) {
;589:			break;
;590:		}
;591:		if ( strcmp( token, "{" ) ) {
;592:			Com_Printf( "Missing { in info file\n" );
;593:			break;
;594:		}
;595:
;596:		if ( count == max ) {
;597:			Com_Printf( "Max infos exceeded\n" );
;598:			break;
;599:		}
;600:
;601:		infos[count][0] = 0;
;602:		while ( 1 ) {
;603:			token = COM_ParseExt( &buf, qtrue );
;604:			if ( !token[0] ) {
;605:				Com_Printf( "Unexpected end of info file\n" );
;606:				break;
;607:			}
;608:			if ( !strcmp( token, "}" ) ) {
;609:				break;
;610:			}
;611:			Q_strncpyz( key, token, sizeof( key ) );
;612:
;613:			token = COM_ParseExt( &buf, qfalse );
;614:			if ( !token[0] ) {
;615:				strcpy( token, "<NULL>" );
;616:			}
;617:			Info_SetValueForKey( infos[count], key, token );
;618:		}
;619:		count++;
;620:	}
;621:
;622:	return count;
;623:}
;624:#endif
;625:
;626:
;627:/*
;628:==================
;629:COM_MatchToken
;630:==================
;631:*/
;632:void COM_MatchToken( char **buf_p, char *match ) {
line 635
;633:	char	*token;
;634:
;635:	token = COM_Parse( buf_p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 636
;636:	if ( strcmp( token, match ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $223
line 637
;637:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $225
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 638
;638:	}
LABELV $223
line 639
;639:}
LABELV $222
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 651
;640:
;641:
;642:/*
;643:=================
;644:SkipBracedSection
;645:
;646:The next token should be an open brace.
;647:Skips until a matching close brace is found.
;648:Internal brace depths are properly skipped.
;649:=================
;650:*/
;651:void SkipBracedSection (char **program) {
line 655
;652:	char			*token;
;653:	int				depth;
;654:
;655:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $227
line 656
;656:	do {
line 657
;657:		token = COM_ParseExt( program, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 658
;658:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $230
line 659
;659:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $232
line 660
;660:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 661
;661:			}
ADDRGP4 $233
JUMPV
LABELV $232
line 662
;662:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $234
line 663
;663:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 664
;664:			}
LABELV $234
LABELV $233
line 665
;665:		}
LABELV $230
line 666
;666:	} while( depth && *program );
LABELV $228
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $236
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $227
LABELV $236
line 667
;667:}
LABELV $226
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 16 0
line 674
;668:
;669:/*
;670:=================
;671:SkipRestOfLine
;672:=================
;673:*/
;674:void SkipRestOfLine ( char **data ) {
line 678
;675:	char	*p;
;676:	int		c;
;677:
;678:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRGP4 $239
JUMPV
LABELV $238
line 679
;679:	while ( (c = *p++) != 0 ) {
line 680
;680:		if ( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $241
line 681
;681:			com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 682
;682:			break;
ADDRGP4 $240
JUMPV
LABELV $241
line 684
;683:		}
;684:	}
LABELV $239
line 679
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $238
LABELV $240
line 686
;685:
;686:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 687
;687:}
LABELV $237
endproc SkipRestOfLine 16 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 690
;688:
;689:
;690:void Parse1DMatrix (char **buf_p, int x, float *m) {
line 694
;691:	char	*token;
;692:	int		i;
;693:
;694:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 696
;695:
;696:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $248
JUMPV
LABELV $245
line 697
;697:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 698
;698:		m[i] = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 699
;699:	}
LABELV $246
line 696
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $248
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $245
line 701
;700:
;701:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $249
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 702
;702:}
LABELV $243
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 704
;703:
;704:void Parse2DMatrix (char **buf_p, int y, int x, float *m) {
line 707
;705:	int		i;
;706:
;707:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 709
;708:
;709:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $254
JUMPV
LABELV $251
line 710
;710:		Parse1DMatrix (buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 711
;711:	}
LABELV $252
line 709
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $254
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $251
line 713
;712:
;713:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $249
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 714
;714:}
LABELV $250
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 716
;715:
;716:void Parse3DMatrix (char **buf_p, int z, int y, int x, float *m) {
line 719
;717:	int		i;
;718:
;719:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 721
;720:
;721:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $256
line 722
;722:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 723
;723:	}
LABELV $257
line 721
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $259
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $256
line 725
;724:
;725:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $249
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 726
;726:}
LABELV $255
endproc Parse3DMatrix 12 16
export Q_isprint
proc Q_isprint 4 0
line 738
;727:
;728:
;729:/*
;730:============================================================================
;731:
;732:					LIBRARY REPLACEMENT FUNCTIONS
;733:
;734:============================================================================
;735:*/
;736:
;737:int Q_isprint( int c )
;738:{
line 739
;739:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $261
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $261
line 740
;740:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $260
JUMPV
LABELV $261
line 741
;741:	return ( 0 );
CNSTI4 0
RETI4
LABELV $260
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 745
;742:}
;743:
;744:int Q_islower( int c )
;745:{
line 746
;746:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $264
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $264
line 747
;747:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $263
JUMPV
LABELV $264
line 748
;748:	return ( 0 );
CNSTI4 0
RETI4
LABELV $263
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 752
;749:}
;750:
;751:int Q_isupper( int c )
;752:{
line 753
;753:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $267
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $267
line 754
;754:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $266
JUMPV
LABELV $267
line 755
;755:	return ( 0 );
CNSTI4 0
RETI4
LABELV $266
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 759
;756:}
;757:
;758:int Q_isalpha( int c )
;759:{
line 760
;760:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $273
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $272
LABELV $273
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $270
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $270
LABELV $272
line 761
;761:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $269
JUMPV
LABELV $270
line 762
;762:	return ( 0 );
CNSTI4 0
RETI4
LABELV $269
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 766
;763:}
;764:
;765:char* Q_strrchr( const char* string, int c )
;766:{
line 767
;767:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 769
;768:	char *s;
;769:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 771
;770:
;771:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $276
JUMPV
LABELV $275
line 774
;772:
;773:	while (*s)
;774:	{
line 775
;775:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $278
line 776
;776:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $278
line 777
;777:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 778
;778:	}
LABELV $276
line 773
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $275
line 779
;779:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $280
line 780
;780:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $280
line 782
;781:
;782:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $274
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 792
;783:}
;784:
;785:/*
;786:=============
;787:Q_strncpyz
;788: 
;789:Safe strncpy that ensures a trailing zero
;790:=============
;791:*/
;792:void Q_strncpyz( char *dest, const char *src, int destsize ) {
line 793
;793:  if ( !dest ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $283
line 794
;794:    Com_Error( ERR_FATAL, "Q_strncpyz: NULL dest" );
CNSTI4 0
ARGI4
ADDRGP4 $285
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 795
;795:  }
LABELV $283
line 796
;796:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $286
line 797
;797:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $288
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 798
;798:	}
LABELV $286
line 799
;799:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $289
line 800
;800:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $291
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 801
;801:	}
LABELV $289
line 803
;802:
;803:	strncpy( dest, src, destsize-1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 804
;804:  dest[destsize-1] = 0;
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 805
;805:}
LABELV $282
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 32 0
line 807
;806:                 
;807:int Q_stricmpn (const char *s1, const char *s2, int n) {
line 810
;808:	int		c1, c2;
;809:
;810:        if ( s1 == NULL ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $293
line 811
;811:           if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $295
line 812
;812:             return 0;
CNSTI4 0
RETI4
ADDRGP4 $292
JUMPV
LABELV $295
line 814
;813:           else
;814:             return -1;
CNSTI4 -1
RETI4
ADDRGP4 $292
JUMPV
LABELV $293
line 816
;815:        }
;816:        else if ( s2==NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $297
line 817
;817:          return 1;
CNSTI4 1
RETI4
ADDRGP4 $292
JUMPV
LABELV $297
LABELV $299
line 821
;818:
;819:
;820:	
;821:	do {
line 822
;822:		c1 = *s1++;
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
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 823
;823:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 825
;824:
;825:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $302
line 826
;826:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $292
JUMPV
LABELV $302
line 829
;827:		}
;828:		
;829:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $304
line 830
;830:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $306
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $306
line 831
;831:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 832
;832:			}
LABELV $306
line 833
;833:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $308
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $308
line 834
;834:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 835
;835:			}
LABELV $308
line 836
;836:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $310
line 837
;837:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $313
ADDRLP4 28
CNSTI4 -1
ASGNI4
ADDRGP4 $314
JUMPV
LABELV $313
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $314
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $292
JUMPV
LABELV $310
line 839
;838:			}
;839:		}
LABELV $304
line 840
;840:	} while (c1);
LABELV $300
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $299
line 842
;841:	
;842:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $292
endproc Q_stricmpn 32 0
export Q_strncmp
proc Q_strncmp 24 0
line 845
;843:}
;844:
;845:int Q_strncmp (const char *s1, const char *s2, int n) {
LABELV $316
line 848
;846:	int		c1, c2;
;847:	
;848:	do {
line 849
;849:		c1 = *s1++;
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
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 850
;850:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 852
;851:
;852:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $319
line 853
;853:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $315
JUMPV
LABELV $319
line 856
;854:		}
;855:		
;856:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $321
line 857
;857:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $324
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $324
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $325
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $315
JUMPV
LABELV $321
line 859
;858:		}
;859:	} while (c1);
LABELV $317
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $316
line 861
;860:	
;861:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $315
endproc Q_strncmp 24 0
export Q_stricmp
proc Q_stricmp 12 12
line 864
;862:}
;863:
;864:int Q_stricmp (const char *s1, const char *s2) {
line 865
;865:	return (s1 && s2) ? Q_stricmpn (s1, s2, 99999) : -1;
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $328
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $328
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
ADDRLP4 8
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $328
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $329
ADDRLP4 0
INDIRI4
RETI4
LABELV $326
endproc Q_stricmp 12 12
export Q_strlwr
proc Q_strlwr 12 4
line 869
;866:}
;867:
;868:
;869:char *Q_strlwr( char *s1 ) {
line 872
;870:    char	*s;
;871:
;872:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $332
JUMPV
LABELV $331
line 873
;873:	while ( *s ) {
line 874
;874:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 875
;875:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 876
;876:	}
LABELV $332
line 873
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $331
line 877
;877:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $330
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 880
;878:}
;879:
;880:char *Q_strupr( char *s1 ) {
line 883
;881:    char	*s;
;882:
;883:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $336
JUMPV
LABELV $335
line 884
;884:	while ( *s ) {
line 885
;885:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 886
;886:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 887
;887:	}
LABELV $336
line 884
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $335
line 888
;888:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $334
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 893
;889:}
;890:
;891:
;892:// never goes past bounds or leaves without a terminating 0
;893:void Q_strcat( char *dest, int size, const char *src ) {
line 896
;894:	int		l1;
;895:
;896:	l1 = strlen( dest );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 897
;897:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $339
line 898
;898:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $341
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 899
;899:	}
LABELV $339
line 900
;900:	Q_strncpyz( dest + l1, src, size - l1 );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 901
;901:}
LABELV $338
endproc Q_strcat 12 12
export Q_stristr
proc Q_stristr 36 12
line 907
;902:
;903:/*
;904:* Find the first occurrence of find in s.
;905:*/
;906:const char *Q_stristr( const char *s, const char *find)
;907:{
line 911
;908:  char c, sc;
;909:  size_t len;
;910:
;911:  if ((c = *find++) != 0)
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
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
ADDRLP4 1
ADDRLP4 12
INDIRI1
ASGNI1
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $343
line 912
;912:  {
line 913
;913:    if (c >= 'a' && c <= 'z')
ADDRLP4 16
ADDRLP4 1
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 97
LTI4 $345
ADDRLP4 16
INDIRI4
CNSTI4 122
GTI4 $345
line 914
;914:    {
line 915
;915:      c -= ('a' - 'A');
ADDRLP4 1
ADDRLP4 1
INDIRI1
CVII4 1
CNSTI4 32
SUBI4
CVII1 4
ASGNI1
line 916
;916:    }
LABELV $345
line 917
;917:    len = strlen(find);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
LABELV $347
line 919
;918:    do
;919:    {
LABELV $350
line 921
;920:      do
;921:      {
line 922
;922:        if ((sc = *s++) == 0)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 0
ADDRLP4 28
INDIRI1
ASGNI1
ADDRLP4 28
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $353
line 923
;923:          return NULL;
CNSTP4 0
RETP4
ADDRGP4 $342
JUMPV
LABELV $353
line 924
;924:        if (sc >= 'a' && sc <= 'z')
ADDRLP4 32
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 97
LTI4 $355
ADDRLP4 32
INDIRI4
CNSTI4 122
GTI4 $355
line 925
;925:        {
line 926
;926:          sc -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
SUBI4
CVII1 4
ASGNI1
line 927
;927:        }
LABELV $355
line 928
;928:      } while (sc != c);
LABELV $351
ADDRLP4 0
INDIRI1
CVII4 1
ADDRLP4 1
INDIRI1
CVII4 1
NEI4 $350
line 929
;929:    } while (Q_stricmpn(s, find, len) != 0);
LABELV $348
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $347
line 930
;930:    s--;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 931
;931:  }
LABELV $343
line 932
;932:  return s;
ADDRFP4 0
INDIRP4
RETP4
LABELV $342
endproc Q_stristr 36 12
export Q_PrintStrlen
proc Q_PrintStrlen 16 0
line 936
;933:}
;934:
;935:
;936:int Q_PrintStrlen( const char *string ) {
line 940
;937:	int			len;
;938:	const char	*p;
;939:
;940:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $358
line 941
;941:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $357
JUMPV
LABELV $358
line 944
;942:	}
;943:
;944:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 945
;945:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $361
JUMPV
LABELV $360
line 946
;946:	while( *p ) {
line 947
;947:		if( Q_IsColorString( p ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $363
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $363
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
EQI4 $363
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $363
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $363
line 948
;948:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 949
;949:			continue;
ADDRGP4 $361
JUMPV
LABELV $363
line 951
;950:		}
;951:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 952
;952:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 953
;953:	}
LABELV $361
line 946
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $360
line 955
;954:
;955:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $357
endproc Q_PrintStrlen 16 0
export Q_CleanStr
proc Q_CleanStr 32 4
line 959
;956:}
;957:
;958:
;959:char *Q_CleanStr( char *string ) {
line 963
;960:	char*	d;
;961:	char*	s;
;962:	int		c;
;963:        qboolean hadColor = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 965
;964:
;965:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 966
;966:	d = string;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $367
JUMPV
LABELV $366
line 967
;967:	while ((c = *s) != 0 ) {
line 968
;968:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $369
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $369
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $369
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $369
ADDRLP4 20
INDIRI4
CNSTI4 57
GTI4 $369
line 969
;969:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 970
;970:                        hadColor = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 971
;971:		}
ADDRGP4 $370
JUMPV
LABELV $369
line 972
;972:		else if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $371
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $371
line 973
;973:			*d++ = c;
ADDRLP4 28
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 974
;974:		}
LABELV $371
LABELV $370
line 975
;975:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 976
;976:	}
LABELV $367
line 967
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $366
line 977
;977:	*d = '\0';
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 978
;978:        if(hadColor)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $373
line 979
;979:            return Q_CleanStr( string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_CleanStr
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
RETP4
ADDRGP4 $365
JUMPV
LABELV $373
line 981
;980:        else
;981:            return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $365
endproc Q_CleanStr 32 4
export Q_CountChar
proc Q_CountChar 4 0
ADDRFP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 985
;982:}
;983:
;984:int Q_CountChar(const char *string, char tocount)
;985:{
line 988
;986:	int count;
;987:	
;988:	for(count = 0; *string; string++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $379
JUMPV
LABELV $376
line 989
;989:	{
line 990
;990:		if(*string == tocount)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRFP4 4
INDIRI1
CVII4 1
NEI4 $380
line 991
;991:			count++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $380
line 992
;992:	}
LABELV $377
line 988
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $379
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $376
line 994
;993:	
;994:	return count;
ADDRLP4 0
INDIRI4
RETI4
LABELV $375
endproc Q_CountChar 4 0
export Com_sprintf
proc Com_sprintf 32012 16
line 997
;995:}
;996:
;997:void QDECL Com_sprintf( char *dest, int size, const char *fmt, ...) {
line 1002
;998:	int		len;
;999:	va_list		argptr;
;1000:	char	bigbuffer[32000];	// big, but small enough to fit in PPC stack
;1001:
;1002:	va_start (argptr,fmt);
ADDRLP4 32004
ADDRFP4 8+4
ASGNP4
line 1003
;1003:	len = Q_vsnprintf (bigbuffer, sizeof(bigbuffer), fmt,argptr);
ADDRLP4 0
ARGP4
CNSTI4 32000
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 32004
INDIRP4
ARGP4
ADDRLP4 32008
ADDRGP4 Q_vsnprintf
CALLI4
ASGNI4
ADDRLP4 32000
ADDRLP4 32008
INDIRI4
ASGNI4
line 1004
;1004:	va_end (argptr);
ADDRLP4 32004
CNSTP4 0
ASGNP4
line 1005
;1005:	if ( len >= sizeof( bigbuffer ) ) {
ADDRLP4 32000
INDIRI4
CVIU4 4
CNSTU4 32000
LTU4 $384
line 1006
;1006:		Com_Error( ERR_FATAL, "Com_sprintf: overflowed bigbuffer" );
CNSTI4 0
ARGI4
ADDRGP4 $386
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1007
;1007:	}
LABELV $384
line 1008
;1008:	if (len >= size) {
ADDRLP4 32000
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $387
line 1009
;1009:		Com_Printf ("Com_sprintf: overflow of %i in %i\n", len, size);
ADDRGP4 $389
ARGP4
ADDRLP4 32000
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1015
;1010:#ifdef	_DEBUG
;1011:		__asm {
;1012:			int 3;
;1013:		}
;1014:#endif
;1015:	}
LABELV $387
line 1016
;1016:	Q_strncpyz (dest, bigbuffer, size );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1017
;1017:}
LABELV $382
endproc Com_sprintf 32012 16
bss
align 1
LABELV $391
skip 64000
data
align 4
LABELV $392
byte 4 0
export va
code
proc va 12 16
line 1028
;1018:
;1019:
;1020:/*
;1021:============
;1022:va
;1023:
;1024:does a varargs printf into a temp buffer, so I don't need to have
;1025:varargs versions of all text functions.
;1026:============
;1027:*/
;1028:char	* QDECL va( char *format, ... ) {
line 1034
;1029:	va_list		argptr;
;1030:	static char string[2][32000]; // in case va is called by nested functions
;1031:	static int	index = 0;
;1032:	char		*buf;
;1033:
;1034:	buf = string[index & 1];
ADDRLP4 4
CNSTI4 32000
ADDRGP4 $392
INDIRI4
CNSTI4 1
BANDI4
MULI4
ADDRGP4 $391
ADDP4
ASGNP4
line 1035
;1035:	index++;
ADDRLP4 8
ADDRGP4 $392
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1037
;1036:
;1037:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 1038
;1038:	Q_vsnprintf (buf, sizeof(*string), format, argptr);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 32000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 1039
;1039:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1041
;1040:
;1041:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $390
endproc va 12 16
export Com_TruncateLongString
proc Com_TruncateLongString 8 12
line 1052
;1042:}
;1043:
;1044:/*
;1045:============
;1046:Com_TruncateLongString
;1047:
;1048:Assumes buffer is atleast TRUNCATE_LENGTH big
;1049:============
;1050:*/
;1051:void Com_TruncateLongString( char *buffer, const char *s )
;1052:{
line 1053
;1053:	int length = strlen( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1055
;1054:
;1055:	if( length <= TRUNCATE_LENGTH )
ADDRLP4 0
INDIRI4
CNSTI4 64
GTI4 $395
line 1056
;1056:		Q_strncpyz( buffer, s, TRUNCATE_LENGTH );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $396
JUMPV
LABELV $395
line 1058
;1057:	else
;1058:	{
line 1059
;1059:		Q_strncpyz( buffer, s, ( TRUNCATE_LENGTH / 2 ) - 3 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 29
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1060
;1060:		Q_strcat( buffer, TRUNCATE_LENGTH, " ... " );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $397
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1061
;1061:		Q_strcat( buffer, TRUNCATE_LENGTH, s + length - ( TRUNCATE_LENGTH / 2 ) + 3 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 -29
ADDP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1062
;1062:	}
LABELV $396
line 1063
;1063:}
LABELV $394
endproc Com_TruncateLongString 8 12
bss
align 1
LABELV $399
skip 16384
data
align 4
LABELV $400
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 8220 8
line 1082
;1064:
;1065:/*
;1066:=====================================================================
;1067:
;1068:  INFO STRINGS
;1069:
;1070:=====================================================================
;1071:*/
;1072:
;1073:/*
;1074:===============
;1075:Info_ValueForKey
;1076:
;1077:Searches the string for the given
;1078:key and returns the associated value, or an empty string.
;1079:FIXME: overflow check?
;1080:===============
;1081:*/
;1082:char *Info_ValueForKey( const char *s, const char *key ) {
line 1089
;1083:	char	pkey[BIG_INFO_KEY];
;1084:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;1085:											// work without stomping on each other
;1086:	static	int	valueindex = 0;
;1087:	char	*o;
;1088:	
;1089:	if ( !s || !key ) {
ADDRLP4 8196
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
EQU4 $403
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
NEU4 $401
LABELV $403
line 1090
;1090:		return "";
ADDRGP4 $81
RETP4
ADDRGP4 $398
JUMPV
LABELV $401
line 1093
;1091:	}
;1092:
;1093:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8200
INDIRI4
CNSTI4 8192
LTI4 $404
line 1094
;1094:		Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $406
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1095
;1095:	}
LABELV $404
line 1097
;1096:
;1097:	valueindex ^= 1;
ADDRLP4 8204
ADDRGP4 $400
ASGNP4
ADDRLP4 8204
INDIRP4
ADDRLP4 8204
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1098
;1098:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $410
line 1099
;1099:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $410
JUMPV
LABELV $409
line 1101
;1100:	while (1)
;1101:	{
line 1102
;1102:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $413
JUMPV
LABELV $412
line 1104
;1103:		while (*s != '\\')
;1104:		{
line 1105
;1105:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $415
line 1106
;1106:				return "";
ADDRGP4 $81
RETP4
ADDRGP4 $398
JUMPV
LABELV $415
line 1107
;1107:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1108
;1108:		}
LABELV $413
line 1103
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $412
line 1109
;1109:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1110
;1110:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1112
;1111:
;1112:		o = value[valueindex];
ADDRLP4 0
ADDRGP4 $400
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $399
ADDP4
ASGNP4
ADDRGP4 $418
JUMPV
LABELV $417
line 1115
;1113:
;1114:		while (*s != '\\' && *s)
;1115:		{
line 1116
;1116:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1117
;1117:		}
LABELV $418
line 1114
ADDRLP4 8208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 92
EQI4 $420
ADDRLP4 8208
INDIRI4
CNSTI4 0
NEI4 $417
LABELV $420
line 1118
;1118:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1120
;1119:
;1120:		if (!Q_stricmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $421
line 1121
;1121:			return value[valueindex];
ADDRGP4 $400
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $399
ADDP4
RETP4
ADDRGP4 $398
JUMPV
LABELV $421
line 1123
;1122:
;1123:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $423
line 1124
;1124:			break;
ADDRGP4 $411
JUMPV
LABELV $423
line 1125
;1125:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1126
;1126:	}
LABELV $410
line 1100
ADDRGP4 $409
JUMPV
LABELV $411
line 1128
;1127:
;1128:	return "";
ADDRGP4 $81
RETP4
LABELV $398
endproc Info_ValueForKey 8220 8
export Info_NextPair
proc Info_NextPair 20 0
line 1139
;1129:}
;1130:
;1131:
;1132:/*
;1133:===================
;1134:Info_NextPair
;1135:
;1136:Used to itterate through all the key/value pairs in an info string
;1137:===================
;1138:*/
;1139:void Info_NextPair( const char **head, char *key, char *value ) {
line 1143
;1140:	char	*o;
;1141:	const char	*s;
;1142:
;1143:	s = *head;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 1145
;1144:
;1145:	if ( *s == '\\' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $426
line 1146
;1146:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1147
;1147:	}
LABELV $426
line 1148
;1148:	key[0] = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1149
;1149:	value[0] = 0;
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1151
;1150:
;1151:	o = key;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $429
JUMPV
LABELV $428
line 1152
;1152:	while ( *s != '\\' ) {
line 1153
;1153:		if ( !*s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $431
line 1154
;1154:			*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1155
;1155:			*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1156
;1156:			return;
ADDRGP4 $425
JUMPV
LABELV $431
line 1158
;1157:		}
;1158:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1159
;1159:	}
LABELV $429
line 1152
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $428
line 1160
;1160:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1161
;1161:	s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1163
;1162:
;1163:	o = value;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $434
JUMPV
LABELV $433
line 1164
;1164:	while ( *s != '\\' && *s ) {
line 1165
;1165:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1166
;1166:	}
LABELV $434
line 1164
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $436
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $433
LABELV $436
line 1167
;1167:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1169
;1168:
;1169:	*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1170
;1170:}
LABELV $425
endproc Info_NextPair 20 0
export Info_RemoveKey
proc Info_RemoveKey 2076 12
line 1178
;1171:
;1172:
;1173:/*
;1174:===================
;1175:Info_RemoveKey
;1176:===================
;1177:*/
;1178:void Info_RemoveKey( char *s, const char *key ) {
line 1184
;1179:	char	*start;
;1180:	char	pkey[MAX_INFO_KEY];
;1181:	char	value[MAX_INFO_VALUE];
;1182:	char	*o;
;1183:
;1184:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 1024
LTI4 $438
line 1185
;1185:		Com_Error( ERR_DROP, "Info_RemoveKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $440
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1186
;1186:	}
LABELV $438
line 1188
;1187:
;1188:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 2060
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $444
line 1189
;1189:		return;
ADDRGP4 $437
JUMPV
LABELV $443
line 1193
;1190:	}
;1191:
;1192:	while (1)
;1193:	{
line 1194
;1194:		start = s;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
line 1195
;1195:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $446
line 1196
;1196:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $446
line 1197
;1197:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $449
JUMPV
LABELV $448
line 1199
;1198:		while (*s != '\\')
;1199:		{
line 1200
;1200:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $451
line 1201
;1201:				return;
ADDRGP4 $437
JUMPV
LABELV $451
line 1202
;1202:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1203
;1203:		}
LABELV $449
line 1198
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $448
line 1204
;1204:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1205
;1205:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1207
;1206:
;1207:		o = value;
ADDRLP4 0
ADDRLP4 1032
ASGNP4
ADDRGP4 $454
JUMPV
LABELV $453
line 1209
;1208:		while (*s != '\\' && *s)
;1209:		{
line 1210
;1210:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $456
line 1211
;1211:				return;
ADDRGP4 $437
JUMPV
LABELV $456
line 1212
;1212:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1213
;1213:		}
LABELV $454
line 1208
ADDRLP4 2064
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 92
EQI4 $458
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $453
LABELV $458
line 1214
;1214:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1216
;1215:
;1216:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $459
line 1217
;1217:		{
line 1218
;1218:			memmove(start, s, strlen(s) + 1); // remove this part
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1220
;1219:			
;1220:			return;
ADDRGP4 $437
JUMPV
LABELV $459
line 1223
;1221:		}
;1222:
;1223:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $461
line 1224
;1224:			return;
ADDRGP4 $437
JUMPV
LABELV $461
line 1225
;1225:	}
LABELV $444
line 1192
ADDRGP4 $443
JUMPV
line 1227
;1226:
;1227:}
LABELV $437
endproc Info_RemoveKey 2076 12
export Info_RemoveKey_Big
proc Info_RemoveKey_Big 16412 8
line 1234
;1228:
;1229:/*
;1230:===================
;1231:Info_RemoveKey_Big
;1232:===================
;1233:*/
;1234:void Info_RemoveKey_Big( char *s, const char *key ) {
line 1240
;1235:	char	*start;
;1236:	char	pkey[BIG_INFO_KEY];
;1237:	char	value[BIG_INFO_VALUE];
;1238:	char	*o;
;1239:
;1240:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16392
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16392
INDIRI4
CNSTI4 8192
LTI4 $464
line 1241
;1241:		Com_Error( ERR_DROP, "Info_RemoveKey_Big: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $466
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1242
;1242:	}
LABELV $464
line 1244
;1243:
;1244:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 16396
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16396
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $470
line 1245
;1245:		return;
ADDRGP4 $463
JUMPV
LABELV $469
line 1249
;1246:	}
;1247:
;1248:	while (1)
;1249:	{
line 1250
;1250:		start = s;
ADDRLP4 8196
ADDRFP4 0
INDIRP4
ASGNP4
line 1251
;1251:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $472
line 1252
;1252:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $472
line 1253
;1253:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $475
JUMPV
LABELV $474
line 1255
;1254:		while (*s != '\\')
;1255:		{
line 1256
;1256:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $477
line 1257
;1257:				return;
ADDRGP4 $463
JUMPV
LABELV $477
line 1258
;1258:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1259
;1259:		}
LABELV $475
line 1254
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $474
line 1260
;1260:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1261
;1261:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1263
;1262:
;1263:		o = value;
ADDRLP4 0
ADDRLP4 8200
ASGNP4
ADDRGP4 $480
JUMPV
LABELV $479
line 1265
;1264:		while (*s != '\\' && *s)
;1265:		{
line 1266
;1266:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $482
line 1267
;1267:				return;
ADDRGP4 $463
JUMPV
LABELV $482
line 1268
;1268:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1269
;1269:		}
LABELV $480
line 1264
ADDRLP4 16400
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16400
INDIRI4
CNSTI4 92
EQI4 $484
ADDRLP4 16400
INDIRI4
CNSTI4 0
NEI4 $479
LABELV $484
line 1270
;1270:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1272
;1271:
;1272:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16404
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16404
INDIRI4
CNSTI4 0
NEI4 $485
line 1273
;1273:		{
line 1274
;1274:			strcpy (start, s);	// remove this part
ADDRLP4 8196
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1275
;1275:			return;
ADDRGP4 $463
JUMPV
LABELV $485
line 1278
;1276:		}
;1277:
;1278:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $487
line 1279
;1279:			return;
ADDRGP4 $463
JUMPV
LABELV $487
line 1280
;1280:	}
LABELV $470
line 1248
ADDRGP4 $469
JUMPV
line 1282
;1281:
;1282:}
LABELV $463
endproc Info_RemoveKey_Big 16412 8
export Info_Validate
proc Info_Validate 8 8
line 1295
;1283:
;1284:
;1285:
;1286:
;1287:/*
;1288:==================
;1289:Info_Validate
;1290:
;1291:Some characters are illegal in info strings because they
;1292:can mess up the server's parsing
;1293:==================
;1294:*/
;1295:qboolean Info_Validate( const char *s ) {
line 1296
;1296:	if ( strchr( s, '\"' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 0
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $490
line 1297
;1297:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $489
JUMPV
LABELV $490
line 1299
;1298:	}
;1299:	if ( strchr( s, ';' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $492
line 1300
;1300:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $489
JUMPV
LABELV $492
line 1302
;1301:	}
;1302:	return qtrue;
CNSTI4 1
RETI4
LABELV $489
endproc Info_Validate 8 8
export Info_SetValueForKey
proc Info_SetValueForKey 1048 20
line 1312
;1303:}
;1304:
;1305:/*
;1306:==================
;1307:Info_SetValueForKey
;1308:
;1309:Changes or adds a key/value pair
;1310:==================
;1311:*/
;1312:void Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1314
;1313:	char	newi[MAX_INFO_STRING];
;1314:	const char* blacklist = "\\;\"";
ADDRLP4 0
ADDRGP4 $495
ASGNP4
line 1316
;1315:
;1316:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 1024
LTI4 $502
line 1317
;1317:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $498
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1318
;1318:	}
line 1320
;1319:
;1320:	for(; *blacklist; ++blacklist)
ADDRGP4 $502
JUMPV
LABELV $499
line 1321
;1321:	{
line 1322
;1322:		if (strchr (key, *blacklist) || strchr (value, *blacklist))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1032
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $505
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $503
LABELV $505
line 1323
;1323:		{
line 1324
;1324:			Com_Printf (S_COLOR_YELLOW "Can't use keys or values with a '%c': %s = %s\n", *blacklist, key, value);
ADDRGP4 $506
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1325
;1325:			return;
ADDRGP4 $494
JUMPV
LABELV $503
line 1327
;1326:		}
;1327:	}
LABELV $500
line 1320
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $502
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $499
line 1329
;1328:	
;1329:	Info_RemoveKey (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 1330
;1330:	if (!value || !strlen(value))
ADDRLP4 1032
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $509
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $507
LABELV $509
line 1331
;1331:		return;
ADDRGP4 $494
JUMPV
LABELV $507
line 1333
;1332:
;1333:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $510
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1335
;1334:
;1335:	if (strlen(newi) + strlen(s) >= MAX_INFO_STRING)
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
ADDRLP4 1044
INDIRI4
ADDI4
CNSTI4 1024
LTI4 $511
line 1336
;1336:	{
line 1337
;1337:		Com_Printf ("Info string length exceeded\n");
ADDRGP4 $513
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1338
;1338:		return;
ADDRGP4 $494
JUMPV
LABELV $511
line 1341
;1339:	}
;1340:
;1341:	strcat (newi, s);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1342
;1342:	strcpy (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1343
;1343:}
LABELV $494
endproc Info_SetValueForKey 1048 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8216 20
line 1352
;1344:
;1345:/*
;1346:==================
;1347:Info_SetValueForKey_Big
;1348:
;1349:Changes or adds a key/value pair
;1350:==================
;1351:*/
;1352:void Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1354
;1353:	char	newi[BIG_INFO_STRING];
;1354:	const char* blacklist = "\\;\"";
ADDRLP4 0
ADDRGP4 $495
ASGNP4
line 1356
;1355:
;1356:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8196
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8196
INDIRI4
CNSTI4 8192
LTI4 $520
line 1357
;1357:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $498
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1358
;1358:	}
line 1360
;1359:
;1360:	for(; *blacklist; ++blacklist)
ADDRGP4 $520
JUMPV
LABELV $517
line 1361
;1361:	{
line 1362
;1362:		if (strchr (key, *blacklist) || strchr (value, *blacklist))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8200
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $523
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8204
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $521
LABELV $523
line 1363
;1363:		{
line 1364
;1364:			Com_Printf (S_COLOR_YELLOW "Can't use keys or values with a '%c': %s = %s\n", *blacklist, key, value);
ADDRGP4 $506
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1365
;1365:			return;
ADDRGP4 $514
JUMPV
LABELV $521
line 1367
;1366:		}
;1367:	}
LABELV $518
line 1360
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $520
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $517
line 1369
;1368:
;1369:	Info_RemoveKey_Big (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey_Big
CALLV
pop
line 1370
;1370:	if (!value || !strlen(value))
ADDRLP4 8200
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $526
ADDRLP4 8200
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8204
INDIRI4
CNSTI4 0
NEI4 $524
LABELV $526
line 1371
;1371:		return;
ADDRGP4 $514
JUMPV
LABELV $524
line 1373
;1372:
;1373:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 4
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $510
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1375
;1374:
;1375:	if (strlen(newi) + strlen(s) >= BIG_INFO_STRING)
ADDRLP4 4
ARGP4
ADDRLP4 8208
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8212
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
CNSTI4 8192
LTI4 $527
line 1376
;1376:	{
line 1377
;1377:		Com_Printf ("BIG Info string length exceeded\n");
ADDRGP4 $529
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1378
;1378:		return;
ADDRGP4 $514
JUMPV
LABELV $527
line 1381
;1379:	}
;1380:
;1381:	strcat (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1382
;1382:}
LABELV $514
endproc Info_SetValueForKey_Big 8216 20
proc Com_CharIsOneOfCharset 8 4
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 1395
;1383:
;1384:
;1385:
;1386:
;1387://====================================================================
;1388:
;1389:/*
;1390:==================
;1391:Com_CharIsOneOfCharset
;1392:==================
;1393:*/
;1394:static qboolean Com_CharIsOneOfCharset( char c, char *set )
;1395:{
line 1398
;1396:	int i;
;1397:
;1398:	for( i = 0; i < strlen( set ); i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $534
JUMPV
LABELV $531
line 1399
;1399:	{
line 1400
;1400:		if( set[ i ] == c )
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRFP4 0
INDIRI1
CVII4 1
NEI4 $535
line 1401
;1401:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $530
JUMPV
LABELV $535
line 1402
;1402:	}
LABELV $532
line 1398
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $534
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $531
line 1404
;1403:
;1404:	return qfalse;
CNSTI4 0
RETI4
LABELV $530
endproc Com_CharIsOneOfCharset 8 4
export Com_SkipCharset
proc Com_SkipCharset 8 8
line 1413
;1405:}
;1406:
;1407:/*
;1408:==================
;1409:Com_SkipCharset
;1410:==================
;1411:*/
;1412:char *Com_SkipCharset( char *s, char *sep )
;1413:{
line 1414
;1414:	char	*p = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $539
JUMPV
LABELV $538
line 1417
;1415:
;1416:	while( p )
;1417:	{
line 1418
;1418:		if( Com_CharIsOneOfCharset( *p, sep ) )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Com_CharIsOneOfCharset
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $540
line 1419
;1419:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1421
;1420:		else
;1421:			break;
LABELV $542
line 1422
;1422:	}
LABELV $539
line 1416
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $538
LABELV $540
line 1424
;1423:
;1424:	return p;
ADDRLP4 0
INDIRP4
RETP4
LABELV $537
endproc Com_SkipCharset 8 8
export Com_SkipTokens
proc Com_SkipTokens 20 8
line 1433
;1425:}
;1426:
;1427:/*
;1428:==================
;1429:Com_SkipTokens
;1430:==================
;1431:*/
;1432:char *Com_SkipTokens( char *s, int numTokens, char *sep )
;1433:{
line 1434
;1434:	int		sepCount = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1435
;1435:	char	*p = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $545
JUMPV
LABELV $544
line 1438
;1436:
;1437:	while( sepCount < numTokens )
;1438:	{
line 1439
;1439:		if( Com_CharIsOneOfCharset( *p++, sep ) )
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Com_CharIsOneOfCharset
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $547
line 1440
;1440:		{
line 1441
;1441:			sepCount++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $550
JUMPV
LABELV $549
line 1443
;1442:			while( Com_CharIsOneOfCharset( *p, sep ) )
;1443:				p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $550
line 1442
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Com_CharIsOneOfCharset
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $549
line 1444
;1444:		}
ADDRGP4 $548
JUMPV
LABELV $547
line 1445
;1445:		else if( *p == '\0' )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $552
line 1446
;1446:			break;
ADDRGP4 $546
JUMPV
LABELV $552
LABELV $548
line 1447
;1447:	}
LABELV $545
line 1437
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $544
LABELV $546
line 1449
;1448:
;1449:	if( sepCount == numTokens )
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $554
line 1450
;1450:		return p;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $543
JUMPV
LABELV $554
line 1452
;1451:	else
;1452:		return s;
ADDRFP4 0
INDIRP4
RETP4
LABELV $543
endproc Com_SkipTokens 20 8
export COM_LoadLevelScores
proc COM_LoadLevelScores 1540 12
line 1464
;1453:}
;1454:
;1455://====================================================================
;1456:
;1457:/*
;1458:==================
;1459:COM_LoadLevelScores
;1460:Loads the current highscores for a level
;1461:==================
;1462:*/
;1463:
;1464:highscores_t COM_LoadLevelScores( char *levelname ) {
line 1473
;1465:	highscores_t	highScores;
;1466:	playerscore_t	scores;
;1467:	char			*filename;
;1468:	int				len;
;1469:	int				i;
;1470:	fileHandle_t	f;
;1471:	char			buf[MAX_INFO_STRING];
;1472:
;1473:	filename = va("games/%s-1.1.epgame", levelname);
ADDRGP4 $558
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1328
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1272
ADDRLP4 1328
INDIRP4
ASGNP4
line 1474
;1474:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRLP4 1272
INDIRP4
ARGP4
ADDRLP4 1276
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1332
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1268
ADDRLP4 1332
INDIRI4
ASGNI4
line 1475
;1475:	if ( len > 0 ) {
ADDRLP4 1268
INDIRI4
CNSTI4 0
LEI4 $559
line 1476
;1476:		trap_FS_Read( buf, len, f );
ADDRLP4 244
ARGP4
ADDRLP4 1268
INDIRI4
ARGI4
ADDRLP4 1276
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLI4
pop
line 1477
;1477:		trap_FS_FCloseFile( f );
ADDRLP4 1276
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLI4
pop
line 1479
;1478:
;1479:		for ( i = 0; i < SCOREBOARD_LENGTH; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $561
line 1480
;1480:			if ( strlen(Info_ValueForKey(buf, va("%i%s", i, SIK_TOTALSCORE))) > 0 ) {
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $568
ARGP4
ADDRLP4 1336
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1336
INDIRP4
ARGP4
ADDRLP4 1340
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1340
INDIRP4
ARGP4
ADDRLP4 1344
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1344
INDIRI4
CNSTI4 0
LEI4 $565
line 1481
;1481:				highScores.highscores[i].accuracy = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_ACCURACY)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $570
ARGP4
ADDRLP4 1352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRLP4 1356
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1356
INDIRP4
ARGP4
ADDRLP4 1360
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+4
ADDP4
ADDRLP4 1360
INDIRI4
ASGNI4
line 1482
;1482:				highScores.highscores[i].accuracyScore = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_ACCURACYSCORE)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $572
ARGP4
ADDRLP4 1368
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1368
INDIRP4
ARGP4
ADDRLP4 1372
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1372
INDIRP4
ARGP4
ADDRLP4 1376
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+8
ADDP4
ADDRLP4 1376
INDIRI4
ASGNI4
line 1483
;1483:				highScores.highscores[i].carnageScore = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_CARNAGESCORE)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $573
ARGP4
ADDRLP4 1384
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1384
INDIRP4
ARGP4
ADDRLP4 1388
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1388
INDIRP4
ARGP4
ADDRLP4 1392
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 1392
INDIRI4
ASGNI4
line 1484
;1484:				highScores.highscores[i].deaths = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_DEATHS)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $575
ARGP4
ADDRLP4 1400
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1400
INDIRP4
ARGP4
ADDRLP4 1404
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1404
INDIRP4
ARGP4
ADDRLP4 1408
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+12
ADDP4
ADDRLP4 1408
INDIRI4
ASGNI4
line 1485
;1485:				highScores.highscores[i].deathsScore = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_DEATHSSCORE)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $577
ARGP4
ADDRLP4 1416
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1416
INDIRP4
ARGP4
ADDRLP4 1420
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1420
INDIRP4
ARGP4
ADDRLP4 1424
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+16
ADDP4
ADDRLP4 1424
INDIRI4
ASGNI4
line 1486
;1486:				highScores.highscores[i].secretsCount = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_SECRETSCOUNT)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $579
ARGP4
ADDRLP4 1432
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1432
INDIRP4
ARGP4
ADDRLP4 1436
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1436
INDIRP4
ARGP4
ADDRLP4 1440
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+24
ADDP4
ADDRLP4 1440
INDIRI4
ASGNI4
line 1487
;1487:				highScores.highscores[i].secretsFound = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_SECRETSFOUND)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $581
ARGP4
ADDRLP4 1448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRLP4 1452
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRLP4 1456
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20
ADDP4
ADDRLP4 1456
INDIRI4
ASGNI4
line 1488
;1488:				highScores.highscores[i].secretsScore = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_SECRETSSCORE)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $583
ARGP4
ADDRLP4 1464
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1464
INDIRP4
ARGP4
ADDRLP4 1468
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1468
INDIRP4
ARGP4
ADDRLP4 1472
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+28
ADDP4
ADDRLP4 1472
INDIRI4
ASGNI4
line 1489
;1489:				highScores.highscores[i].skill = atof(Info_ValueForKey(buf, va("%i%s", i, SIK_SKILL)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $585
ARGP4
ADDRLP4 1480
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1480
INDIRP4
ARGP4
ADDRLP4 1484
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1484
INDIRP4
ARGP4
ADDRLP4 1488
ADDRGP4 atof
CALLF4
ASGNF4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+32
ADDP4
ADDRLP4 1488
INDIRF4
ASGNF4
line 1490
;1490:				highScores.highscores[i].skillModifier = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_SKILLMODIFIER)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $587
ARGP4
ADDRLP4 1496
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1496
INDIRP4
ARGP4
ADDRLP4 1500
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1500
INDIRP4
ARGP4
ADDRLP4 1504
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+36
ADDP4
ADDRLP4 1504
INDIRI4
CVIF4 4
ASGNF4
line 1491
;1491:				highScores.highscores[i].skillScore = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_SKILLSCORE)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $589
ARGP4
ADDRLP4 1512
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1512
INDIRP4
ARGP4
ADDRLP4 1516
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1516
INDIRP4
ARGP4
ADDRLP4 1520
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+40
ADDP4
ADDRLP4 1520
INDIRI4
ASGNI4
line 1492
;1492:				highScores.highscores[i].totalScore = atoi(Info_ValueForKey(buf, va("%i%s", i, SIK_TOTALSCORE)));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $568
ARGP4
ADDRLP4 1528
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1528
INDIRP4
ARGP4
ADDRLP4 1532
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1532
INDIRP4
ARGP4
ADDRLP4 1536
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+44
ADDP4
ADDRLP4 1536
INDIRI4
ASGNI4
line 1493
;1493:			} else {
ADDRGP4 $566
JUMPV
LABELV $565
line 1494
;1494:				highScores.highscores[i].accuracy = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+4
ADDP4
CNSTI4 0
ASGNI4
line 1495
;1495:				highScores.highscores[i].accuracyScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+8
ADDP4
CNSTI4 0
ASGNI4
line 1496
;1496:				highScores.highscores[i].carnageScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 1497
;1497:				highScores.highscores[i].deaths = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+12
ADDP4
CNSTI4 0
ASGNI4
line 1498
;1498:				highScores.highscores[i].deathsScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+16
ADDP4
CNSTI4 0
ASGNI4
line 1499
;1499:				highScores.highscores[i].secretsCount = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+24
ADDP4
CNSTI4 0
ASGNI4
line 1500
;1500:				highScores.highscores[i].secretsFound = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20
ADDP4
CNSTI4 0
ASGNI4
line 1501
;1501:				highScores.highscores[i].secretsScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+28
ADDP4
CNSTI4 0
ASGNI4
line 1502
;1502:				highScores.highscores[i].skill = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+32
ADDP4
CNSTF4 0
ASGNF4
line 1503
;1503:				highScores.highscores[i].skillModifier = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+36
ADDP4
CNSTF4 0
ASGNF4
line 1504
;1504:				highScores.highscores[i].skillScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+40
ADDP4
CNSTI4 0
ASGNI4
line 1505
;1505:				highScores.highscores[i].totalScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+44
ADDP4
CNSTI4 0
ASGNI4
line 1506
;1506:			}
LABELV $566
line 1507
;1507:		}
LABELV $562
line 1479
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $561
line 1508
;1508:	} else {
ADDRGP4 $560
JUMPV
LABELV $559
line 1510
;1509:		//Com_Printf("No highscore file found for %s\n", filename);
;1510:		for ( i = 0; i < SCOREBOARD_LENGTH; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $602
line 1511
;1511:			highScores.highscores[i].accuracy = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+4
ADDP4
CNSTI4 0
ASGNI4
line 1512
;1512:			highScores.highscores[i].accuracyScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+8
ADDP4
CNSTI4 0
ASGNI4
line 1513
;1513:			highScores.highscores[i].carnageScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 1514
;1514:			highScores.highscores[i].deaths = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+12
ADDP4
CNSTI4 0
ASGNI4
line 1515
;1515:			highScores.highscores[i].deathsScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+16
ADDP4
CNSTI4 0
ASGNI4
line 1516
;1516:			highScores.highscores[i].secretsCount = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+24
ADDP4
CNSTI4 0
ASGNI4
line 1517
;1517:			highScores.highscores[i].secretsFound = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20
ADDP4
CNSTI4 0
ASGNI4
line 1518
;1518:			highScores.highscores[i].secretsScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+28
ADDP4
CNSTI4 0
ASGNI4
line 1519
;1519:			highScores.highscores[i].skill = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+32
ADDP4
CNSTF4 0
ASGNF4
line 1520
;1520:			highScores.highscores[i].skillModifier = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+36
ADDP4
CNSTF4 0
ASGNF4
line 1521
;1521:			highScores.highscores[i].skillScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+40
ADDP4
CNSTI4 0
ASGNI4
line 1522
;1522:			highScores.highscores[i].totalScore = 0;
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+44
ADDP4
CNSTI4 0
ASGNI4
line 1523
;1523:		}
LABELV $603
line 1510
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $602
line 1524
;1524:	}
LABELV $560
line 1526
;1525:
;1526:	return highScores;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 240
LABELV $556
endproc COM_LoadLevelScores 1540 12
export COM_WriteLevelScores
proc COM_WriteLevelScores 1676 16
line 1536
;1527:}
;1528:
;1529:
;1530:/*
;1531:==================
;1532:COM_WriteLevelScores
;1533:Writes the new highscores file if the player's score sets a new record score
;1534:==================
;1535:*/
;1536:void COM_WriteLevelScores( char *levelname, playerscore_t scores ) {
line 1546
;1537:	highscores_t	highScores;
;1538:	highscores_t	newHighScores;
;1539:	char			filename[64];
;1540:	fileHandle_t	f;
;1541:	char			scoreInfo[MAX_INFO_STRING];
;1542:	int				i;
;1543:	int				newPos;
;1544:	
;1545:	//don't bother if the player scored 0 points
;1546:	if ( scores.totalScore == 0 )
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
NEI4 $618
line 1547
;1547:		return;
ADDRGP4 $617
JUMPV
LABELV $618
line 1549
;1548:
;1549:	Com_sprintf( filename, sizeof(filename), "games/%s-1.1.epgame", levelname );
ADDRLP4 1512
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $558
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1551
;1550:
;1551:	highScores = COM_LoadLevelScores( levelname );
ADDRLP4 1268
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 COM_LoadLevelScores
CALLV
pop
line 1553
;1552:
;1553:	newPos = -1;
ADDRLP4 1508
CNSTI4 -1
ASGNI4
line 1554
;1554:	for ( i = 0; i < SCOREBOARD_LENGTH; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $620
line 1555
;1555:		if ( newPos == -1 && scores.totalScore > highScores.highscores[i].totalScore ) {
ADDRLP4 1508
INDIRI4
CNSTI4 -1
NEI4 $624
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 1268+44
ADDP4
INDIRI4
LEI4 $624
line 1556
;1556:			newPos = i;
ADDRLP4 1508
ADDRLP4 0
INDIRI4
ASGNI4
line 1557
;1557:		}
LABELV $624
line 1558
;1558:	}
LABELV $621
line 1554
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $620
line 1560
;1559:
;1560:	if (newPos == -1)
ADDRLP4 1508
INDIRI4
CNSTI4 -1
NEI4 $627
line 1561
;1561:		return;			//player didn't get a top-5 score
ADDRGP4 $617
JUMPV
LABELV $627
line 1564
;1562:
;1563:	//add all scores better than player's score to new highscores struct
;1564:	for ( i = 0; i < newPos; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $632
JUMPV
LABELV $629
line 1565
;1565:		newHighScores.highscores[i] = highScores.highscores[i];
ADDRLP4 1580
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1580
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 1580
INDIRI4
ADDRLP4 1268
ADDP4
INDIRB
ASGNB 48
line 1566
;1566:	}
LABELV $630
line 1564
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $632
ADDRLP4 0
INDIRI4
ADDRLP4 1508
INDIRI4
LTI4 $629
line 1569
;1567:
;1568:	//add player's score to new highscores struct
;1569:	newHighScores.highscores[newPos].accuracy = scores.accuracy;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+4
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1570
;1570:	newHighScores.highscores[newPos].accuracyScore = scores.accuracyScore;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+8
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1571
;1571:	newHighScores.highscores[newPos].carnageScore = scores.carnageScore;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1572
;1572:	newHighScores.highscores[newPos].deaths = scores.deaths;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+12
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1573
;1573:	newHighScores.highscores[newPos].deathsScore = scores.deathsScore;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+16
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1574
;1574:	newHighScores.highscores[newPos].secretsCount = scores.secretsCount;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+24
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 1575
;1575:	newHighScores.highscores[newPos].secretsFound = scores.secretsFound;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+20
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 1576
;1576:	newHighScores.highscores[newPos].secretsScore = scores.secretsScore;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+28
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 1577
;1577:	newHighScores.highscores[newPos].skill = scores.skill;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+32
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 1578
;1578:	newHighScores.highscores[newPos].skillModifier = scores.skillModifier;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+36
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
line 1579
;1579:	newHighScores.highscores[newPos].skillScore = scores.skillScore;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+40
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
line 1580
;1580:	newHighScores.highscores[newPos].totalScore = scores.totalScore;
CNSTI4 48
ADDRLP4 1508
INDIRI4
MULI4
ADDRLP4 4+44
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1583
;1581:
;1582:	//add all scores worse than player's score to new highscores struct
;1583:	if ( newPos < SCOREBOARD_LENGTH - 1 ) {
ADDRLP4 1508
INDIRI4
CNSTI4 4
GEI4 $644
line 1584
;1584:		for ( i = newPos + 1; i < SCOREBOARD_LENGTH; i++ ) {
ADDRLP4 0
ADDRLP4 1508
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $649
JUMPV
LABELV $646
line 1585
;1585:			newHighScores.highscores[i].accuracy = highScores.highscores[i-1].accuracy;
ADDRLP4 1580
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1580
INDIRI4
ADDRLP4 4+4
ADDP4
ADDRLP4 1580
INDIRI4
ADDRLP4 1268-48+4
ADDP4
INDIRI4
ASGNI4
line 1586
;1586:			newHighScores.highscores[i].accuracyScore = highScores.highscores[i-1].accuracyScore;
ADDRLP4 1584
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1584
INDIRI4
ADDRLP4 4+8
ADDP4
ADDRLP4 1584
INDIRI4
ADDRLP4 1268-48+8
ADDP4
INDIRI4
ASGNI4
line 1587
;1587:			newHighScores.highscores[i].carnageScore = highScores.highscores[i-1].carnageScore;
ADDRLP4 1588
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1588
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 1588
INDIRI4
ADDRLP4 1268-48
ADDP4
INDIRI4
ASGNI4
line 1588
;1588:			newHighScores.highscores[i].deaths = highScores.highscores[i-1].deaths;
ADDRLP4 1592
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1592
INDIRI4
ADDRLP4 4+12
ADDP4
ADDRLP4 1592
INDIRI4
ADDRLP4 1268-48+12
ADDP4
INDIRI4
ASGNI4
line 1589
;1589:			newHighScores.highscores[i].deathsScore = highScores.highscores[i-1].deathsScore;
ADDRLP4 1596
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1596
INDIRI4
ADDRLP4 4+16
ADDP4
ADDRLP4 1596
INDIRI4
ADDRLP4 1268-48+16
ADDP4
INDIRI4
ASGNI4
line 1590
;1590:			newHighScores.highscores[i].secretsCount = highScores.highscores[i-1].secretsCount;
ADDRLP4 1600
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1600
INDIRI4
ADDRLP4 4+24
ADDP4
ADDRLP4 1600
INDIRI4
ADDRLP4 1268-48+24
ADDP4
INDIRI4
ASGNI4
line 1591
;1591:			newHighScores.highscores[i].secretsFound = highScores.highscores[i-1].secretsFound;
ADDRLP4 1604
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1604
INDIRI4
ADDRLP4 4+20
ADDP4
ADDRLP4 1604
INDIRI4
ADDRLP4 1268-48+20
ADDP4
INDIRI4
ASGNI4
line 1592
;1592:			newHighScores.highscores[i].secretsScore = highScores.highscores[i-1].secretsScore;
ADDRLP4 1608
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1608
INDIRI4
ADDRLP4 4+28
ADDP4
ADDRLP4 1608
INDIRI4
ADDRLP4 1268-48+28
ADDP4
INDIRI4
ASGNI4
line 1593
;1593:			newHighScores.highscores[i].skill = highScores.highscores[i-1].skill;
ADDRLP4 1612
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1612
INDIRI4
ADDRLP4 4+32
ADDP4
ADDRLP4 1612
INDIRI4
ADDRLP4 1268-48+32
ADDP4
INDIRF4
ASGNF4
line 1594
;1594:			newHighScores.highscores[i].skillModifier = highScores.highscores[i-1].skillModifier;
ADDRLP4 1616
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1616
INDIRI4
ADDRLP4 4+36
ADDP4
ADDRLP4 1616
INDIRI4
ADDRLP4 1268-48+36
ADDP4
INDIRF4
ASGNF4
line 1595
;1595:			newHighScores.highscores[i].skillScore = highScores.highscores[i-1].skillScore;
ADDRLP4 1620
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1620
INDIRI4
ADDRLP4 4+40
ADDP4
ADDRLP4 1620
INDIRI4
ADDRLP4 1268-48+40
ADDP4
INDIRI4
ASGNI4
line 1596
;1596:			newHighScores.highscores[i].totalScore = highScores.highscores[i-1].totalScore;
ADDRLP4 1624
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1624
INDIRI4
ADDRLP4 4+44
ADDP4
ADDRLP4 1624
INDIRI4
ADDRLP4 1268-48+44
ADDP4
INDIRI4
ASGNI4
line 1597
;1597:		}
LABELV $647
line 1584
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $649
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $646
line 1598
;1598:	}
LABELV $644
line 1604
;1599:
;1600:
;1601:	//write new highscore file
;1602:
;1603:	//For some reason part of the server info string is written to the high score file. To prevent this, we completely reset the scoreInfo string
;1604:	for ( i = 0; i < MAX_INFO_STRING; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $684
line 1605
;1605:		scoreInfo[i] = ' ';
ADDRLP4 0
INDIRI4
ADDRLP4 244
ADDP4
CNSTI1 32
ASGNI1
line 1606
;1606:	}
LABELV $685
line 1604
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $684
line 1609
;1607:	//TODO: Check if the above fix doesn't mess up anything for the actual server info string.
;1608:
;1609:	scoreInfo[0] = '\0';
ADDRLP4 244
CNSTI1 0
ASGNI1
line 1610
;1610:	for ( i = 0 ; i < SCOREBOARD_LENGTH; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $688
line 1611
;1611:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_CARNAGESCORE), va("%i", newHighScores.highscores[i].carnageScore));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $573
ARGP4
ADDRLP4 1580
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1584
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1580
INDIRP4
ARGP4
ADDRLP4 1584
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1612
;1612:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_ACCURACY), va("%i", newHighScores.highscores[i].accuracy));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $570
ARGP4
ADDRLP4 1588
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1592
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1588
INDIRP4
ARGP4
ADDRLP4 1592
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1613
;1613:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_ACCURACYSCORE), va("%i", newHighScores.highscores[i].accuracyScore));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $572
ARGP4
ADDRLP4 1596
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1600
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1596
INDIRP4
ARGP4
ADDRLP4 1600
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1614
;1614:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_DEATHS), va("%i", newHighScores.highscores[i].deaths));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $575
ARGP4
ADDRLP4 1604
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 1608
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1604
INDIRP4
ARGP4
ADDRLP4 1608
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1615
;1615:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_DEATHSSCORE), va("%i", newHighScores.highscores[i].deathsScore));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $577
ARGP4
ADDRLP4 1612
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+16
ADDP4
INDIRI4
ARGI4
ADDRLP4 1616
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1612
INDIRP4
ARGP4
ADDRLP4 1616
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1616
;1616:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_SECRETSFOUND), va("%i", newHighScores.highscores[i].secretsFound));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $581
ARGP4
ADDRLP4 1620
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+20
ADDP4
INDIRI4
ARGI4
ADDRLP4 1624
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1620
INDIRP4
ARGP4
ADDRLP4 1624
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1617
;1617:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_SECRETSCOUNT), va("%i", newHighScores.highscores[i].secretsCount));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $579
ARGP4
ADDRLP4 1628
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+24
ADDP4
INDIRI4
ARGI4
ADDRLP4 1632
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1628
INDIRP4
ARGP4
ADDRLP4 1632
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1618
;1618:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_SECRETSSCORE), va("%i", newHighScores.highscores[i].secretsScore));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $583
ARGP4
ADDRLP4 1636
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+28
ADDP4
INDIRI4
ARGI4
ADDRLP4 1640
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1636
INDIRP4
ARGP4
ADDRLP4 1640
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1619
;1619:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_SKILL), va("%1.0f", newHighScores.highscores[i].skill));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $585
ARGP4
ADDRLP4 1644
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $700
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+32
ADDP4
INDIRF4
ARGF4
ADDRLP4 1648
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1644
INDIRP4
ARGP4
ADDRLP4 1648
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1620
;1620:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_SKILLMODIFIER), va("%1.1f", newHighScores.highscores[i].skillModifier));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $587
ARGP4
ADDRLP4 1652
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $702
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+36
ADDP4
INDIRF4
ARGF4
ADDRLP4 1656
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1621
;1621:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_SKILLSCORE), va("%i", newHighScores.highscores[i].skillScore));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $589
ARGP4
ADDRLP4 1660
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+40
ADDP4
INDIRI4
ARGI4
ADDRLP4 1664
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1660
INDIRP4
ARGP4
ADDRLP4 1664
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1622
;1622:		Info_SetValueForKey(scoreInfo, va("%i%s", i, SIK_TOTALSCORE), va("%i", newHighScores.highscores[i].totalScore));
ADDRGP4 $567
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $568
ARGP4
ADDRLP4 1668
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $692
ARGP4
CNSTI4 48
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+44
ADDP4
INDIRI4
ARGI4
ADDRLP4 1672
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 244
ARGP4
ADDRLP4 1668
INDIRP4
ARGP4
ADDRLP4 1672
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1623
;1623:	}
LABELV $689
line 1610
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $688
line 1628
;1624:
;1625:	/*trap_FS_FOpenFile( filename, &f, FS_WRITE );
;1626:	trap_FS_Write( scoreInfo, sizeof(scoreInfo), f);
;1627:	trap_FS_FCloseFile( f );*/
;1628:}
LABELV $617
endproc COM_WriteLevelScores 1676 16
export COM_AccuracyToScore
proc COM_AccuracyToScore 0 0
line 1637
;1629:
;1630:
;1631:/*
;1632:==================
;1633:COM_AccuracyToScore
;1634:Calculates the score based on accuracy
;1635:==================
;1636:*/
;1637:int COM_AccuracyToScore(int accuracy, int score) {
line 1638
;1638:	return ((score * SCORE_ACCURACY) / 100) * accuracy;
CNSTF4 1056964608
ADDRFP4 4
INDIRI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
ADDRFP4 0
INDIRI4
CVIF4 4
MULF4
CVFI4 4
RETI4
LABELV $706
endproc COM_AccuracyToScore 0 0
export COM_CalculatePlayerScore
proc COM_CalculatePlayerScore 1088 12
line 1647
;1639:}
;1640:
;1641:/*
;1642:==================
;1643:COM_CalculateScore
;1644:Calculates the player's score
;1645:==================
;1646:*/
;1647:playerscore_t COM_CalculatePlayerScore(int persistant[MAX_PERSISTANT], int accuracy, float skill) {
line 1654
;1648:	char			var[MAX_TOKEN_CHARS];
;1649:	int				mutators;
;1650:	qboolean		debugScore;
;1651:	playerscore_t	scores;
;1652:
;1653:	//carnage score
;1654:	scores.carnageScore = persistant[PERS_SCORE];
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1657
;1655:
;1656:	//accuracy bonus
;1657:	scores.accuracy = accuracy;
ADDRLP4 0+4
ADDRFP4 8
INDIRI4
ASGNI4
line 1658
;1658:	scores.accuracyScore = COM_AccuracyToScore( accuracy, scores.carnageScore );
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 COM_AccuracyToScore
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 1080
INDIRI4
ASGNI4
line 1661
;1659:
;1660:	//skill bonus
;1661:	scores.skill = skill;
ADDRLP4 0+32
ADDRFP4 12
INDIRF4
ASGNF4
line 1662
;1662:	scores.skillModifier = (skill - 1) * SCORE_SKILL;
ADDRLP4 0+36
CNSTF4 1036831949
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
SUBF4
MULF4
ASGNF4
line 1663
;1663:	scores.skillScore = scores.carnageScore * scores.skillModifier;
ADDRLP4 0+40
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 0+36
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1666
;1664:
;1665:	//secrets
;1666:	scores.secretsFound = persistant[PERS_SECRETS] & 0x7F;
ADDRLP4 0+20
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 127
BANDI4
ASGNI4
line 1667
;1667:	scores.secretsCount = (persistant[PERS_SECRETS] >> 7) & 0x7F;
ADDRLP4 0+24
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 7
RSHI4
CNSTI4 127
BANDI4
ASGNI4
line 1668
;1668:	scores.secretsScore = (scores.secretsFound * SCORE_SECRET) * scores.carnageScore;
ADDRLP4 0+28
CNSTF4 1036831949
ADDRLP4 0+20
INDIRI4
CVIF4 4
MULF4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1671
;1669:
;1670:	//deaths
;1671:	scores.deaths = persistant[PERS_KILLED];
ADDRLP4 0+12
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1672
;1672:	scores.deathsScore = 0 - ((scores.deaths * SCORE_DEATH) * scores.carnageScore);
ADDRLP4 0+16
CNSTF4 0
CNSTF4 1036831949
ADDRLP4 0+12
INDIRI4
CVIF4 4
MULF4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 1675
;1673:
;1674:	//total score
;1675:	scores.totalScore = scores.carnageScore + scores.accuracyScore + scores.skillScore + scores.secretsScore + scores.deathsScore ;
ADDRLP4 0+44
ADDRLP4 0
INDIRI4
ADDRLP4 0+8
INDIRI4
ADDI4
ADDRLP4 0+40
INDIRI4
ADDI4
ADDRLP4 0+28
INDIRI4
ADDI4
ADDRLP4 0+16
INDIRI4
ADDI4
ASGNI4
line 1678
;1676:
;1677:	//debug scores
;1678:	trap_Cvar_VariableStringBuffer( "g_debugScore", var, sizeof( var ) );
ADDRGP4 $727
ARGP4
ADDRLP4 48
ARGP4
CNSTU4 1024
ARGU4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLI4
pop
line 1679
;1679:	debugScore = atoi(var);
ADDRLP4 48
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1072
ADDRLP4 1084
INDIRI4
ASGNI4
line 1681
;1680:
;1681:	if (debugScore) {
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $728
line 1682
;1682:		Com_Printf("---Score debug info---\n");
ADDRGP4 $730
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1683
;1683:		Com_Printf("Carnage  : %i\n", scores.carnageScore);
ADDRGP4 $731
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1684
;1684:		Com_Printf("Accuracy : %i (%i%%)\n", scores.accuracyScore, scores.accuracy);
ADDRGP4 $732
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1685
;1685:		Com_Printf("Skill    : %i (%1.0f%%)\n", scores.skillScore, scores.skillModifier * 100);
ADDRGP4 $735
ARGP4
ADDRLP4 0+40
INDIRI4
ARGI4
CNSTF4 1120403456
ADDRLP4 0+36
INDIRF4
MULF4
ARGF4
ADDRGP4 Com_Printf
CALLV
pop
line 1686
;1686:		Com_Printf("Secrets  : %i (%i)\n", scores.secretsScore, scores.secretsFound);
ADDRGP4 $738
ARGP4
ADDRLP4 0+28
INDIRI4
ARGI4
ADDRLP4 0+20
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1687
;1687:		Com_Printf("Deaths   : %i (%ix)\n", scores.deathsScore, scores.deaths);
ADDRGP4 $741
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0+12
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1688
;1688:		Com_Printf("Total    : %i\n", scores.totalScore);
ADDRGP4 $744
ARGP4
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1689
;1689:	}
LABELV $728
line 1691
;1690:
;1691:	return scores;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 48
LABELV $707
endproc COM_CalculatePlayerScore 1088 12
import trap_Cvar_VariableStringBuffer
import trap_FS_FCloseFile
import trap_FS_Read
import trap_FS_FOpenFile
bss
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
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
import Com_Printf
import Com_Error
import Info_RemoveKey_big
import Com_RandomBytes
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
LABELV $744
byte 1 84
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $741
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 120
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $738
byte 1 83
byte 1 101
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $735
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 40
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 37
byte 1 37
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $732
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 37
byte 1 37
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $731
byte 1 67
byte 1 97
byte 1 114
byte 1 110
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $730
byte 1 45
byte 1 45
byte 1 45
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $727
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $702
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 0
align 1
LABELV $700
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 0
align 1
LABELV $692
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $589
byte 1 107
byte 1 0
align 1
LABELV $587
byte 1 106
byte 1 0
align 1
LABELV $585
byte 1 105
byte 1 0
align 1
LABELV $583
byte 1 104
byte 1 0
align 1
LABELV $581
byte 1 102
byte 1 0
align 1
LABELV $579
byte 1 103
byte 1 0
align 1
LABELV $577
byte 1 101
byte 1 0
align 1
LABELV $575
byte 1 100
byte 1 0
align 1
LABELV $573
byte 1 97
byte 1 0
align 1
LABELV $572
byte 1 99
byte 1 0
align 1
LABELV $570
byte 1 98
byte 1 0
align 1
LABELV $568
byte 1 108
byte 1 0
align 1
LABELV $567
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $558
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 45
byte 1 49
byte 1 46
byte 1 49
byte 1 46
byte 1 101
byte 1 112
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $529
byte 1 66
byte 1 73
byte 1 71
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $513
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $510
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $506
byte 1 94
byte 1 51
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 39
byte 1 37
byte 1 99
byte 1 39
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $498
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $495
byte 1 92
byte 1 59
byte 1 34
byte 1 0
align 1
LABELV $466
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 95
byte 1 66
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $440
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $406
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $397
byte 1 32
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 0
align 1
LABELV $389
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $386
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 105
byte 1 103
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $341
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $291
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 60
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $288
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 115
byte 1 114
byte 1 99
byte 1 0
align 1
LABELV $285
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $249
byte 1 41
byte 1 0
align 1
LABELV $244
byte 1 40
byte 1 0
align 1
LABELV $225
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 33
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $133
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $129
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $123
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $103
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $81
byte 1 0
