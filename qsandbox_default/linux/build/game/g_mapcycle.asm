code
proc G_setTokens 8 0
file "../../../code/game/g_mapcycle.c"
line 61
;1:/*
;2:===========================================================================
;3:Copyright (C) 2010-2011 Manuel Wiese
;4:Copyright (C) 2018 borg
;5:
;6:This file is part of AfterShock source code.
;7:
;8:AfterShock source code is free software; you can redistribute it
;9:and/or modify it under the terms of the GNU General Public License as
;10:published by the Free Software Foundation; either version 2 of the License,
;11:or (at your option) any later version.
;12:
;13:AfterShock source code is distributed in the hope that it will be
;14:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;15:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;16:GNU General Public License for more details.
;17:
;18:You should have received a copy of the GNU General Public License
;19:along with AfterShock source code; if not, write to the Free Software
;20:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;21:===========================================================================
;22:*/
;23:
;24:#include "g_local.h"
;25:
;26:#define MAX_MAPCYCLECOUNT 128
;27:#define MAX_MAPCYCLELENGTH 4096
;28:#define MAX_MAPCYCLETOKENS 512
;29:
;30:typedef struct mapcycle_s {
;31:	char *maps[MAX_MAPCYCLECOUNT];
;32:	int minplayers[MAX_MAPCYCLECOUNT];
;33:	int maxplayers[MAX_MAPCYCLECOUNT];
;34:	int lockarena[MAX_MAPCYCLECOUNT];
;35:	int  mapcycleCount;
;36:	char *allowedMaps[MAX_MAPCYCLECOUNT];
;37:	int  allowedMapsCount;
;38:	qboolean allAllowed;
;39:	char mapfiles[MAX_MAPCYCLECOUNT][MAX_QPATH];
;40:	char allowedmapfiles[MAX_MAPCYCLECOUNT][MAX_QPATH];
;41:} mapcycle_t;
;42:
;43:mapcycle_t mapcycle;
;44:
;45:typedef enum {
;46:	TOT_LPAREN,
;47:	TOT_RPAREN,
;48:	TOT_WORD,
;49:	TOT_NUMBER,
;50:	TOT_NIL,
;51:	TOT_MAX
;52:} tokenType_t;
;53:
;54:#define TOKENVALUE_SIZE 64
;55:
;56:typedef struct {
;57:	char value[TOKENVALUE_SIZE];
;58:	int type;
;59:} token_t;
;60:
;61:static int G_setTokens ( char* in, char* out, int start ) {
line 62
;62:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $68
JUMPV
LABELV $67
line 63
;63:	while ( in[ start + i ] != ' ' ) {
line 64
;64:		if ( in[ start + i ] == '\0' ) {
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $70
line 65
;65:			out[i] = in[start+1];
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 66
;66:			return MAX_MAPCYCLELENGTH;
CNSTI4 4096
RETI4
ADDRGP4 $66
JUMPV
LABELV $70
line 68
;67:		}
;68:		out[i] = in[start+i];
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 69
;69:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 70
;70:	}
LABELV $68
line 63
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $67
line 71
;71:	out[i] = '\0';
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 72
;72:	return start+i+1;
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
RETI4
LABELV $66
endproc G_setTokens 8 0
proc G_setTokenType 36 0
line 81
;73:}
;74:
;75:/*
;76:=================
;77:G_setTokenType
;78:Reads the string and gives out the type of the token
;79:=================
;80:*/
;81:static int G_setTokenType ( char* value ) {
line 82
;82:	int count = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 83
;83:	qboolean lpar= qfalse,rpar= qfalse,number= qfalse, character = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $74
JUMPV
LABELV $73
line 85
;84:
;85:	while ( value[count] != '\0' ) {
line 86
;86:		if ( value[count] == '{' )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $76
line 87
;87:			lpar = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $77
JUMPV
LABELV $76
line 88
;88:		else if ( value[count] == '}' )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $78
line 89
;89:			rpar = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $79
JUMPV
LABELV $78
line 90
;90:		else if ( value[count] >= '0' && value[count] <= '9' )
ADDRLP4 20
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $80
ADDRLP4 20
INDIRI4
CNSTI4 57
GTI4 $80
line 91
;91:			number = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $81
JUMPV
LABELV $80
line 92
;92:		else if ( ( value[count] >= 'a' && value[count] <= 'z' ) || ( value[count] >= 'A' && value[count] <= 'Z' ) || (value[count] == '+' ) )
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 97
LTI4 $85
ADDRLP4 24
INDIRI4
CNSTI4 122
LEI4 $86
LABELV $85
ADDRLP4 28
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 65
LTI4 $87
ADDRLP4 28
INDIRI4
CNSTI4 90
LEI4 $86
LABELV $87
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 43
NEI4 $82
LABELV $86
line 93
;93:			character = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
LABELV $82
LABELV $81
LABELV $79
LABELV $77
line 94
;94:		count++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 95
;95:	}
LABELV $74
line 85
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $73
line 97
;96:
;97:	if ( lpar && ! ( rpar || number || character ) )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $88
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $88
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $88
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $88
line 98
;98:		return TOT_LPAREN;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $88
line 99
;99:	else if ( rpar && ! ( lpar || number || character ) )
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $90
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $90
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $90
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $90
line 100
;100:		return TOT_RPAREN;
CNSTI4 1
RETI4
ADDRGP4 $72
JUMPV
LABELV $90
line 101
;101:	else if ( number && ! ( lpar || rpar || character ) )
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $92
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $92
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $92
ADDRLP4 16
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $92
line 102
;102:		return TOT_NUMBER;
CNSTI4 3
RETI4
ADDRGP4 $72
JUMPV
LABELV $92
line 103
;103:	else if ( character && ! ( lpar || rpar ) )
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $94
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $94
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $94
line 104
;104:		return TOT_WORD;
CNSTI4 2
RETI4
ADDRGP4 $72
JUMPV
LABELV $94
line 106
;105:	else
;106:		return TOT_NIL;
CNSTI4 4
RETI4
LABELV $72
endproc G_setTokenType 36 0
proc G_FindNextToken 12 8
line 116
;107:}
;108:
;109:/*
;110:=================
;111:G_FindNextToken
;112:Gives out the position of a token,
;113:if the token is not found, -1 is returned
;114:=================
;115:*/
;116:static int G_FindNextToken ( char *find, token_t *in, int start ) {
line 120
;117:	int i;
;118:	int cmp;
;119:
;120:	for ( i = start; i < MAX_MAPCYCLETOKENS; i++ ) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRGP4 $100
JUMPV
LABELV $97
line 121
;121:		cmp= strcmp ( in[i].value, find );
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 122
;122:		if ( cmp == 0 )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $101
line 123
;123:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $96
JUMPV
LABELV $101
line 124
;124:	}
LABELV $98
line 120
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $100
ADDRLP4 0
INDIRI4
CNSTI4 512
LTI4 $97
line 125
;125:	return -1;
CNSTI4 -1
RETI4
LABELV $96
endproc G_FindNextToken 12 8
proc G_AbeforeB 24 12
line 136
;126:}
;127:
;128:/*
;129:=================
;130:G_AbeforeB
;131:is true if the first argument is
;132:found before the second argument
;133:=================
;134:*/
;135:
;136:static qboolean G_AbeforeB ( char *A, char *B, token_t *in, int start ) {
line 137
;137:	int a = G_FindNextToken ( A, in, start );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 G_FindNextToken
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 138
;138:	int b = G_FindNextToken ( B, in, start );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 G_FindNextToken
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 140
;139:
;140:	if ( b == -1 && a != -1 )
ADDRLP4 16
CNSTI4 -1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $104
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $104
line 141
;141:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $103
JUMPV
LABELV $104
line 142
;142:	if ( a == -1 && b != -1 )
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $106
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $106
line 143
;143:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $103
JUMPV
LABELV $106
line 144
;144:	if ( a < b )
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $108
line 145
;145:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $103
JUMPV
LABELV $108
line 147
;146:	else
;147:		return qfalse;
CNSTI4 0
RETI4
LABELV $103
endproc G_AbeforeB 24 12
export SkippedChar
proc SkippedChar 8 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 157
;148:}
;149:
;150:/*
;151:=================
;152:SkippedChar
;153:returns qtrue if the argument
;154:is a char we should skip
;155:=================
;156:*/
;157:qboolean SkippedChar ( char in ) {
line 158
;158:	return ( in == '\n' || in == '\r' || in == ';' || in == '\t' || in == ' ' );
ADDRLP4 4
ADDRFP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $117
ADDRLP4 4
INDIRI4
CNSTI4 13
EQI4 $117
ADDRLP4 4
INDIRI4
CNSTI4 59
EQI4 $117
ADDRLP4 4
INDIRI4
CNSTI4 9
EQI4 $117
ADDRLP4 4
INDIRI4
CNSTI4 32
NEI4 $112
LABELV $117
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $112
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $113
ADDRLP4 0
INDIRI4
RETI4
LABELV $110
endproc SkippedChar 8 0
proc G_MapAvailable 8 12
line 168
;159:}
;160:
;161:/*
;162:=================
;163:G_MapAvailable
;164:search for a map in the mapfolder,
;165:if the map is not found return qfalse
;166:=================
;167:*/
;168:static qboolean G_MapAvailable ( char* map ) {
line 169
;169:	if( !trap_FS_FOpenFile ( va ( "maps/%s.bsp",map ), NULL,FS_READ ) )
ADDRGP4 $121
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $119
line 170
;170:		return qfalse; //maps/MAPNAME.bsp does not exist
CNSTI4 0
RETI4
ADDRGP4 $118
JUMPV
LABELV $119
line 172
;171:	
;172:	return qtrue;
CNSTI4 1
RETI4
LABELV $118
endproc G_MapAvailable 8 12
proc G_findCharInString 4 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 175
;173:}
;174:
;175:static int G_findCharInString( char charin, char* string, int size ){
line 177
;176:	int i;
;177:	for( i = 0; i < size; i++ ){
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $123
line 178
;178:		if( charin == string[i] )
ADDRFP4 0
INDIRI1
CVII4 1
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
NEI4 $127
line 179
;179:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $122
JUMPV
LABELV $127
line 180
;180:	}
LABELV $124
line 177
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $126
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $123
line 181
;181:	return -1;
CNSTI4 -1
RETI4
LABELV $122
endproc G_findCharInString 4 0
proc G_setMapcycle 44 12
line 191
;182:}
;183:
;184:/*
;185:=================
;186:G_setMapcycle
;187:reads the tokens to set the
;188:mapcycle
;189:=================
;190:*/
;191:static void G_setMapcycle ( token_t *in, int min, int max ) {
line 193
;192:	int lastmappos;
;193:	qboolean lastMapAvailable = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 197
;194:	int i,j;
;195:	int lpar,rpar;
;196:
;197:	for ( i = min; i <= max; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $133
JUMPV
LABELV $130
line 198
;198:		if ( in[i].type == TOT_WORD ) {
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 2
NEI4 $134
line 199
;199:			lastmappos = i;
ADDRLP4 20
ADDRLP4 0
INDIRI4
ASGNI4
line 201
;200:			//find '(' ')' for mapfiles
;201:			lpar = G_findCharInString('(',in[i].value,sizeof(in[i].value) );
CNSTI4 40
ARGI4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 24
ADDRGP4 G_findCharInString
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 202
;202:			rpar = G_findCharInString(')',in[i].value,sizeof(in[i].value) );
CNSTI4 41
ARGI4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 28
ADDRGP4 G_findCharInString
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 203
;203:			if ( lpar != -1 && rpar != -1 ){
ADDRLP4 32
CNSTI4 -1
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $136
ADDRLP4 12
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $136
line 204
;204:				for( j= lpar+1; j < rpar; j++ ){
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $141
JUMPV
LABELV $138
line 205
;205:					mapcycle.mapfiles[mapcycle.mapcycleCount][j-lpar-1] = in[i].value[j]; 
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+2572
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ADDP4
INDIRI1
ASGNI1
line 206
;206:				}
LABELV $139
line 204
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $141
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $138
line 207
;207:				mapcycle.mapfiles[mapcycle.mapcycleCount][j-lpar-1] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+2572
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 208
;208:				in[i].value[lpar] = '\0';
ADDRLP4 8
INDIRI4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 209
;209:			} else {
ADDRGP4 $137
JUMPV
LABELV $136
line 210
;210:				mapcycle.mapfiles[mapcycle.mapcycleCount][0] = '\0';
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+2572
ADDP4
CNSTI1 0
ASGNI1
line 211
;211:			}
LABELV $137
line 213
;212:			
;213:			if ( G_MapAvailable ( in[i].value ) ) {
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 G_MapAvailable
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $148
line 214
;214:				mapcycle.maps[mapcycle.mapcycleCount] = in[i].value;
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
line 215
;215:				mapcycle.mapcycleCount++;
ADDRLP4 40
ADDRGP4 mapcycle+2048
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 216
;216:				lastMapAvailable = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 217
;217:			} else {
ADDRGP4 $135
JUMPV
LABELV $148
line 218
;218:				lastMapAvailable = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 219
;219:				G_Printf ( "Map %s not found\n", in[i].value );
ADDRGP4 $152
ARGP4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 220
;220:			}
line 221
;221:		} else if ( in[i].type == TOT_NUMBER && lastMapAvailable ) {
ADDRGP4 $135
JUMPV
LABELV $134
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 3
NEI4 $153
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $153
line 222
;222:			if ( ( i - lastmappos ) == 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CNSTI4 1
NEI4 $155
line 223
;223:				mapcycle.minplayers[mapcycle.mapcycleCount-1] = atoi ( in[i].value );
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+512-4
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 224
;224:			} else if ( ( i - lastmappos ) == 2 ) {
ADDRGP4 $156
JUMPV
LABELV $155
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CNSTI4 2
NEI4 $160
line 225
;225:				mapcycle.maxplayers[mapcycle.mapcycleCount-1] = atoi ( in[i].value );
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+1024-4
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 226
;226:			} else if ( ( i - lastmappos ) == 3 ) {
ADDRGP4 $161
JUMPV
LABELV $160
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CNSTI4 3
NEI4 $165
line 227
;227:				mapcycle.lockarena[mapcycle.mapcycleCount-1] = atoi ( in[i].value );
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+1536-4
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 228
;228:			} else {
ADDRGP4 $166
JUMPV
LABELV $165
line 229
;229:				G_Printf ( "Error: Number not assigned to map\n" );
ADDRGP4 $170
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 230
;230:			}
LABELV $166
LABELV $161
LABELV $156
line 231
;231:		}
LABELV $153
LABELV $135
line 232
;232:	}
LABELV $131
line 197
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $133
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $130
line 233
;233:}
LABELV $129
endproc G_setMapcycle 44 12
proc G_setAllowedMaps 36 12
line 242
;234:
;235:/*
;236:=================
;237:G_setAllowedMaps
;238:reads the tokens to set the votable
;239:maps
;240:=================
;241:*/
;242:static void G_setAllowedMaps ( token_t *in, int min, int max ) {
line 246
;243:	int i;
;244:	int lpar,rpar,j;
;245:	
;246:	for ( i = min; i <= max; i++ ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $172
line 247
;247:		if ( in[i].type == TOT_WORD ) {
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 2
NEI4 $176
line 249
;248:			//find '(' ')' for mapfiles
;249:			lpar = G_findCharInString('(',in[i].value,sizeof(in[i].value) );
CNSTI4 40
ARGI4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 16
ADDRGP4 G_findCharInString
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 250
;250:			rpar = G_findCharInString(')',in[i].value,sizeof(in[i].value) );
CNSTI4 41
ARGI4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 20
ADDRGP4 G_findCharInString
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 251
;251:			if ( lpar != -1 && rpar != -1 ){
ADDRLP4 24
CNSTI4 -1
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $178
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $178
line 252
;252:				for( j= lpar+1; j < rpar; j++ ){
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $180
line 253
;253:					mapcycle.allowedmapfiles[mapcycle.allowedMapsCount][j-lpar-1] = in[i].value[j]; 
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ADDRGP4 mapcycle+2564
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+10764
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ADDP4
INDIRI1
ASGNI1
line 254
;254:				}
LABELV $181
line 252
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $183
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $180
line 255
;255:				mapcycle.allowedmapfiles[mapcycle.allowedMapsCount][j-lpar-1] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ADDRGP4 mapcycle+2564
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+10764
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 256
;256:				in[i].value[lpar] = '\0';
ADDRLP4 8
INDIRI4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 257
;257:			} else {
ADDRGP4 $179
JUMPV
LABELV $178
line 258
;258:				mapcycle.allowedmapfiles[mapcycle.allowedMapsCount][0] = '\0';
ADDRGP4 mapcycle+2564
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+10764
ADDP4
CNSTI1 0
ASGNI1
line 259
;259:			}
LABELV $179
line 261
;260:			
;261:			if ( G_MapAvailable ( in[i].value ) ) {
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 G_MapAvailable
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $190
line 262
;262:				mapcycle.allowedMaps[mapcycle.allowedMapsCount] = in[i].value;
ADDRGP4 mapcycle+2564
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+2052
ADDP4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
line 263
;263:				mapcycle.allowedMapsCount++;
ADDRLP4 32
ADDRGP4 mapcycle+2564
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 264
;264:			} else {
ADDRGP4 $177
JUMPV
LABELV $190
line 265
;265:				G_Printf ( "Map %s not found\n", in[i].value );
ADDRGP4 $152
ARGP4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 266
;266:			}
line 267
;267:		} else {
ADDRGP4 $177
JUMPV
LABELV $176
line 268
;268:			G_Printf ( "No valid mapname %s\n", in[i].value );
ADDRGP4 $195
ARGP4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 269
;269:		}
LABELV $177
line 270
;270:	}
LABELV $173
line 246
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $175
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $172
line 271
;271:}
LABELV $171
endproc G_setAllowedMaps 36 12
proc G_getNextMapNumber 16 0
line 279
;272:/*
;273:=================
;274:G_getNextMapNumber
;275:returns the next possible
;276:mapnumber in the cycle
;277:=================
;278:*/
;279:static int G_getNextMapNumber ( int i ) {
line 283
;280:	int start,j;
;281:	int buffer;
;282:
;283:	if ( i == ( mapcycle.mapcycleCount-1 ) )
ADDRFP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 1
SUBI4
NEI4 $197
line 284
;284:		start = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $198
JUMPV
LABELV $197
line 286
;285:	else
;286:		start = i+1;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $198
line 288
;287:
;288:	for ( j = 0; j < mapcycle.mapcycleCount; j++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $203
JUMPV
LABELV $200
line 289
;289:		buffer = ( start+j ) %mapcycle.mapcycleCount;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRGP4 mapcycle+2048
INDIRI4
MODI4
ASGNI4
line 290
;290:		if ( level.numPlayingClients <= mapcycle.maxplayers[buffer] && level.numPlayingClients >= mapcycle.minplayers[buffer] ) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRGP4 level+80
INDIRI4
ADDRLP4 12
INDIRI4
ADDRGP4 mapcycle+1024
ADDP4
INDIRI4
GTI4 $206
ADDRGP4 level+80
INDIRI4
ADDRLP4 12
INDIRI4
ADDRGP4 mapcycle+512
ADDP4
INDIRI4
LTI4 $206
line 291
;291:			return buffer;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $196
JUMPV
LABELV $206
line 293
;292:		}
;293:	}
LABELV $201
line 288
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $203
ADDRLP4 4
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
LTI4 $200
line 294
;294:	return start;
ADDRLP4 8
INDIRI4
RETI4
LABELV $196
endproc G_getNextMapNumber 16 0
export G_mapChooser
proc G_mapChooser 1124 20
line 302
;295:}
;296:
;297:/*
;298:=================
;299:G_mapChooser
;300:=================
;301:*/
;302:void G_mapChooser( int num ) {
line 308
;303:    int i,j;
;304:    int from;
;305:    int stringlength;
;306:    char entry[64];
;307:    char string[MAX_TOKEN_CHARS];
;308:    from = rand() % mapcycle.mapcycleCount; 
ADDRLP4 1104
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 1104
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
MODI4
ASGNI4
line 310
;309:    
;310:    Com_sprintf (string, sizeof(string), "callmapvote %i ", num);
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $214
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 311
;311:    stringlength = strlen(string);
ADDRLP4 80
ARGP4
ADDRLP4 1108
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1108
INDIRI4
ASGNI4
line 312
;312:    for (i=0;i<num;i++) {
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $218
JUMPV
LABELV $215
line 314
;313:        //j = (from+i)%mapcycle.mapcycleCount;
;314:        j = G_getNextMapNumber(from);
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 G_getNextMapNumber
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1112
INDIRI4
ASGNI4
line 315
;315:        from = j;
ADDRLP4 72
ADDRLP4 0
INDIRI4
ASGNI4
line 317
;316:
;317:        Com_sprintf (entry, sizeof(entry), "%s %i ",
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $219
ARGP4
ADDRLP4 1116
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1116
INDIRI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
ARGP4
ADDRLP4 1116
INDIRI4
ADDRGP4 mapcycle+1536
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 319
;318:                mapcycle.maps[j],mapcycle.lockarena[j]);
;319:        j = strlen(entry);
ADDRLP4 4
ARGP4
ADDRLP4 1120
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1120
INDIRI4
ASGNI4
line 320
;320:        strcpy (string + stringlength, entry);
ADDRLP4 76
INDIRI4
ADDRLP4 80
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 321
;321:        stringlength += j;
ADDRLP4 76
ADDRLP4 76
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 322
;322:    }
LABELV $216
line 312
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $218
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $215
line 323
;323:    trap_SendConsoleCommand(EXEC_APPEND,string);
CNSTI4 2
ARGI4
ADDRLP4 80
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 324
;324:}
LABELV $212
endproc G_mapChooser 1124 20
export G_GetMapLockArena
proc G_GetMapLockArena 8 8
line 334
;325:
;326:/*
;327:=================
;328:G_GetMapLockArena
;329:finds the current mapnumber and
;330:returns the next possible
;331:map in the cycle
;332:=================
;333:*/
;334:int G_GetMapLockArena ( char *map ) {
line 337
;335:	int i;
;336:
;337:	if ( mapcycle.mapcycleCount == 0 )
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 0
NEI4 $222
line 338
;338:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $221
JUMPV
LABELV $222
line 340
;339:
;340:	for ( i = 0; i < mapcycle.mapcycleCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $228
JUMPV
LABELV $225
line 341
;341:		if ( strcmp ( map, mapcycle.maps[i] ) == 0 )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $230
line 342
;342:			break;
ADDRGP4 $227
JUMPV
LABELV $230
line 343
;343:	}
LABELV $226
line 340
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $228
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
LTI4 $225
LABELV $227
line 345
;344:
;345:	if ( i == mapcycle.mapcycleCount ) {
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
NEI4 $232
line 346
;346:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $221
JUMPV
LABELV $232
line 349
;347:	} 
;348:
;349:	return mapcycle.lockarena[ i ];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+1536
ADDP4
INDIRI4
RETI4
LABELV $221
endproc G_GetMapLockArena 8 8
export G_GotoNextMapCycle
proc G_GotoNextMapCycle 20 8
line 360
;350:}
;351:
;352:/*
;353:=================
;354:G_GotoNextMapCycle
;355:finds the next possible
;356:map in the cycle
;357:and goto it
;358:=================
;359:*/
;360:void G_GotoNextMapCycle ( void ) {
line 363
;361:    int i;
;362:
;363:    if (mapcycle.mapcycleCount < g_mapcycleposition.integer) {
ADDRGP4 mapcycle+2048
INDIRI4
ADDRGP4 g_mapcycleposition+12
INDIRI4
GEI4 $237
line 364
;364:        trap_Cvar_Set("g_mapcycleposition","0");
ADDRGP4 $241
ARGP4
ADDRGP4 $242
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 365
;365:    }
LABELV $237
line 366
;366:    i = G_getNextMapNumber (g_mapcycleposition.integer) ;
ADDRGP4 g_mapcycleposition+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 G_getNextMapNumber
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 367
;367:    if (mapcycle.mapcycleCount <= i) {
ADDRGP4 mapcycle+2048
INDIRI4
ADDRLP4 0
INDIRI4
GTI4 $244
line 368
;368:      trap_SendConsoleCommand( EXEC_APPEND, va("map_restart")) ;
ADDRGP4 $247
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
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 369
;369:      return;
ADDRGP4 $236
JUMPV
LABELV $244
line 373
;370:    }
;371:
;372:
;373:    trap_Cvar_Set("g_mapcycleposition",va("%i",i));
ADDRGP4 $248
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $241
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 374
;374:    trap_Cvar_Set("g_lockArena",va("%i", mapcycle.lockarena[ i ]));
ADDRGP4 $248
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+1536
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $249
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 376
;375:
;376:    trap_SendConsoleCommand( EXEC_APPEND, va("map %s", mapcycle.maps[i ])) ;
ADDRGP4 $251
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 377
;377:}
LABELV $236
endproc G_GotoNextMapCycle 20 8
export G_GetNextMapCycle
proc G_GetNextMapCycle 4 8
line 388
;378:
;379:
;380:/*
;381:=================
;382:G_GetNextMapCycle
;383:finds the current mapnumber and
;384:returns the next possible
;385:map in the cycle
;386:=================
;387:*/
;388:char *G_GetNextMapCycle ( char *map ) {
line 390
;389:
;390:	if ( mapcycle.mapcycleCount == 0 )
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 0
NEI4 $253
line 391
;391:		return map;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $252
JUMPV
LABELV $253
line 393
;392:
;393:  if (mapcycle.mapcycleCount < g_mapcycleposition.integer) {
ADDRGP4 mapcycle+2048
INDIRI4
ADDRGP4 g_mapcycleposition+12
INDIRI4
GEI4 $256
line 394
;394:      trap_Cvar_Set("g_mapcycleposition","0");
ADDRGP4 $241
ARGP4
ADDRGP4 $242
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 395
;395:  }
LABELV $256
line 397
;396:
;397:	return mapcycle.maps[G_getNextMapNumber (g_mapcycleposition.integer) ];
ADDRGP4 g_mapcycleposition+12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 G_getNextMapNumber
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
RETP4
LABELV $252
endproc G_GetNextMapCycle 4 8
export G_GetNextMap
proc G_GetNextMap 12 8
line 409
;398:}
;399:
;400:
;401:/*
;402:=================
;403:G_GetNextMap
;404:finds the current mapnumber and
;405:returns the next possible
;406:map in the cycle
;407:=================
;408:*/
;409:char *G_GetNextMap ( char *map ) {
line 412
;410:	int i;
;411:
;412:	if ( mapcycle.mapcycleCount == 0 )
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 0
NEI4 $262
line 413
;413:		return map;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $261
JUMPV
LABELV $262
line 415
;414:
;415:	for ( i = 0; i < mapcycle.mapcycleCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $268
JUMPV
LABELV $265
line 416
;416:		if ( strcmp ( map, mapcycle.maps[i] ) == 0 )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $270
line 417
;417:			break;
ADDRGP4 $267
JUMPV
LABELV $270
line 418
;418:	}
LABELV $266
line 415
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $268
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
LTI4 $265
LABELV $267
line 420
;419:
;420:	if ( i == mapcycle.mapcycleCount ) {
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
NEI4 $272
line 421
;421:		return mapcycle.maps[G_getNextMapNumber ( ( int ) ( random() *mapcycle.mapcycleCount ) ) ];
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRGP4 mapcycle+2048
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRLP4 8
ADDRGP4 G_getNextMapNumber
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
RETP4
ADDRGP4 $261
JUMPV
LABELV $272
line 424
;422:	} 
;423:
;424:	return mapcycle.maps[G_getNextMapNumber ( i ) ];
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 G_getNextMapNumber
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
RETP4
LABELV $261
endproc G_GetNextMap 12 8
export G_GetMapfile
proc G_GetMapfile 12 8
line 435
;425:}
;426:
;427:/*
;428:=================
;429:G_GetMapfile
;430:finds the current mapnumber and
;431:returns the next possible
;432:map in the cycle
;433:=================
;434:*/
;435:void G_GetMapfile ( char *map ) {
line 438
;436:	int i;
;437:
;438:	if ( mapcycle.mapcycleCount == 0 )
ADDRGP4 mapcycle+2048
INDIRI4
CNSTI4 0
NEI4 $277
line 439
;439:		return;
ADDRGP4 $276
JUMPV
LABELV $277
line 441
;440:
;441:	for ( i = 0; i < mapcycle.mapcycleCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $283
JUMPV
LABELV $280
line 442
;442:		if ( strcmp ( map, mapcycle.maps[i] ) == 0 )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $285
line 443
;443:			break;
ADDRGP4 $282
JUMPV
LABELV $285
line 444
;444:	}
LABELV $281
line 441
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $283
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
LTI4 $280
LABELV $282
line 446
;445:
;446:	if ( i == mapcycle.mapcycleCount ) {
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
NEI4 $287
line 447
;447:		for ( i = 0; i < mapcycle.allowedMapsCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $293
JUMPV
LABELV $290
line 448
;448:			if ( strcmp ( map, mapcycle.allowedMaps[i] ) == 0 ){
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+2052
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $295
line 449
;449:				if( strcmp(mapcycle.allowedmapfiles[i],"") )
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+10764
ADDP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $276
line 450
;450:					G_LoadMapfile(mapcycle.allowedmapfiles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+10764
ADDP4
ARGP4
ADDRGP4 G_LoadMapfile
CALLV
pop
line 451
;451:				return;
ADDRGP4 $276
JUMPV
LABELV $295
line 453
;452:			}
;453:		}
LABELV $291
line 447
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $293
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2564
INDIRI4
LTI4 $290
line 454
;454:	} else {
ADDRGP4 $276
JUMPV
LABELV $287
line 455
;455:		if( strcmp(mapcycle.mapfiles[i],"") )
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+2572
ADDP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 4
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $276
line 456
;456:			G_LoadMapfile(mapcycle.mapfiles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+2572
ADDP4
ARGP4
ADDRGP4 G_LoadMapfile
CALLV
pop
line 457
;457:	}
line 458
;458:	return;
LABELV $276
endproc G_GetMapfile 12 8
export G_mapIsVoteable
proc G_mapIsVoteable 12 8
line 470
;459:}
;460:
;461:/*
;462:=================
;463:G_mapIsVoteable
;464:looks up in the mapcycle and
;465:the allowed mapcycle
;466:and returns qtrue if the map
;467:in the argument is voteable
;468:=================
;469:*/
;470:qboolean G_mapIsVoteable ( char* map ) {
line 472
;471:	int i;
;472:	if ( mapcycle.allAllowed && G_MapAvailable ( map ) )
ADDRGP4 mapcycle+2568
INDIRI4
CNSTI4 0
EQI4 $308
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_MapAvailable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $308
line 473
;473:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $307
JUMPV
LABELV $308
line 475
;474:
;475:	for ( i = 0; i < mapcycle.mapcycleCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $314
JUMPV
LABELV $311
line 476
;476:		if ( strcmp ( map, mapcycle.maps[i] ) == 0 )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $316
line 477
;477:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $307
JUMPV
LABELV $316
line 478
;478:	}
LABELV $312
line 475
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $314
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
LTI4 $311
line 480
;479:
;480:	for ( i = 0; i < mapcycle.allowedMapsCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $321
JUMPV
LABELV $318
line 481
;481:		if ( strcmp ( map, mapcycle.allowedMaps[i] ) == 0 )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+2052
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $323
line 482
;482:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $307
JUMPV
LABELV $323
line 483
;483:	}
LABELV $319
line 480
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $321
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2564
INDIRI4
LTI4 $318
line 485
;484:
;485:	return qfalse;
CNSTI4 0
RETI4
LABELV $307
endproc G_mapIsVoteable 12 8
lit
align 1
LABELV $327
byte 1 0
skip 4000
export G_drawAllowedMaps
code
proc G_drawAllowedMaps 4024 8
line 494
;486:}
;487:/*
;488:=================
;489:G_drawAllowedMaps
;490:prints out a list of all
;491:voteable maps
;492:=================
;493:*/
;494:void G_drawAllowedMaps ( gentity_t *ent ) {
line 496
;495:	int i;
;496:	char buffer[4001] = {'\0'};
ADDRLP4 4
ADDRGP4 $327
INDIRB
ASGNB 4001
line 498
;497:
;498:	strcpy ( buffer,va ( "Allowed maps are: " ) );
ADDRGP4 $328
ARGP4
ADDRLP4 4008
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4008
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 500
;499:
;500:	for ( i = 0; i < mapcycle.mapcycleCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $332
JUMPV
LABELV $329
line 501
;501:		strcat ( buffer, va ( "^2%s ", mapcycle.maps[i] ) );
ADDRGP4 $334
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
ARGP4
ADDRLP4 4012
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4012
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 502
;502:	}
LABELV $330
line 500
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $332
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
LTI4 $329
line 503
;503:	for ( i = 0; i < mapcycle.allowedMapsCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $338
JUMPV
LABELV $335
line 504
;504:		strcat ( buffer, va ( "^1%s ", mapcycle.allowedMaps[i] ) );
ADDRGP4 $340
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+2052
ADDP4
INDIRP4
ARGP4
ADDRLP4 4012
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4012
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 505
;505:	}
LABELV $336
line 503
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $338
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2564
INDIRI4
LTI4 $335
line 507
;506:
;507:	strcat ( buffer, va ( "\n" ) );
ADDRGP4 $342
ARGP4
ADDRLP4 4012
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4012
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 509
;508:
;509:	for( i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $343
line 510
;510:		char tmp = buffer[(i+1)*1000];
ADDRLP4 4016
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+1000
ADDP4
INDIRI1
ASGNI1
line 511
;511:		buffer[(i+1)*1000] = '\0';
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+1000
ADDP4
CNSTI1 0
ASGNI1
line 512
;512:		trap_SendServerCommand(ent-g_entities, va ("print \"%s\"", &buffer[i*1000]));
ADDRGP4 $349
ARGP4
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 4020
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 4020
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 513
;513:		if(tmp == '\0') {
ADDRLP4 4016
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $350
line 514
;514:			break;
ADDRGP4 $345
JUMPV
LABELV $350
line 517
;515:		}
;516:
;517:		buffer[(i+1)*1000] = tmp;
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+1000
ADDP4
ADDRLP4 4016
INDIRI1
ASGNI1
line 518
;518:	}
LABELV $344
line 509
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $343
LABELV $345
line 519
;519:}
LABELV $326
endproc G_drawAllowedMaps 4024 8
lit
align 1
LABELV $354
byte 1 0
skip 8000
export G_drawMapcycle
code
proc G_drawMapcycle 8024 20
line 528
;520:
;521:/*
;522:=================
;523:G_drawMapcycle
;524:prints out a list of all
;525:information in the mapcycle
;526:=================
;527:*/
;528:void G_drawMapcycle ( gentity_t *ent ) {
line 530
;529:	int i;
;530:	char buffer[8001] = {'\0'};
ADDRLP4 4
ADDRGP4 $354
INDIRB
ASGNB 8001
line 532
;531:
;532:	for ( i = 0; i < mapcycle.mapcycleCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $355
line 533
;533:		strcat ( buffer, va ( "^3%i ^2%s ^3%i %i\n", i, mapcycle.maps[i], mapcycle.minplayers[i], mapcycle.maxplayers[i] ) );
ADDRGP4 $360
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8012
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8012
INDIRI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
ARGP4
ADDRLP4 8012
INDIRI4
ADDRGP4 mapcycle+512
ADDP4
INDIRI4
ARGI4
ADDRLP4 8012
INDIRI4
ADDRGP4 mapcycle+1024
ADDP4
INDIRI4
ARGI4
ADDRLP4 8016
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 8016
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 534
;534:	}
LABELV $356
line 532
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $358
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
LTI4 $355
line 535
;535:	strcat ( buffer, va ( "\n" ) );
ADDRGP4 $342
ARGP4
ADDRLP4 8008
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 8008
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 536
;536:	for ( i = 0; i < mapcycle.allowedMapsCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $366
JUMPV
LABELV $363
line 537
;537:		strcat ( buffer, va ( "^1%s ", mapcycle.allowedMaps[i] ) );
ADDRGP4 $340
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+2052
ADDP4
INDIRP4
ARGP4
ADDRLP4 8012
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 8012
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 538
;538:	}
LABELV $364
line 536
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $366
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2564
INDIRI4
LTI4 $363
line 540
;539:
;540:	strcat ( buffer, va ( "\n" ) );
ADDRGP4 $342
ARGP4
ADDRLP4 8012
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 8012
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 542
;541:
;542:	for( i = 0; i < 8; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $369
line 543
;543:		char tmp = buffer[(i+1)*1000];
ADDRLP4 8016
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+1000
ADDP4
INDIRI1
ASGNI1
line 544
;544:		buffer[(i+1)*1000] = '\0';
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+1000
ADDP4
CNSTI1 0
ASGNI1
line 545
;545:		trap_SendServerCommand(ent-g_entities, va ("print \"%s\"", &buffer[i*1000]));
ADDRGP4 $349
ARGP4
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 8020
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 8020
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 546
;546:		if(tmp == '\0') {
ADDRLP4 8016
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $375
line 547
;547:			break;
ADDRGP4 $371
JUMPV
LABELV $375
line 550
;548:		}
;549:
;550:		buffer[(i+1)*1000] = tmp;
CNSTI4 1000
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4+1000
ADDP4
ADDRLP4 8016
INDIRI1
ASGNI1
line 551
;551:	}
LABELV $370
line 542
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $369
LABELV $371
line 552
;552:}
LABELV $353
endproc G_drawMapcycle 8024 20
export G_sendMapcycle
proc G_sendMapcycle 4120 12
line 562
;553:
;554:/*
;555:=================
;556:G_sendMapcycle
;557:prints the current working mapcycle
;558:with original structure
;559:useful for rcon and serverowners
;560:=================
;561:*/
;562:void G_sendMapcycle( void ){
line 565
;563:	int i;
;564:	char buffer[MAX_MAPCYCLELENGTH];
;565:	strcat ( buffer,va ( "mapcycle {\n" ) );
ADDRGP4 $379
ARGP4
ADDRLP4 4100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4100
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 567
;566:	
;567:	if( !g_useMapcycle.integer ){
ADDRGP4 g_useMapcycle+12
INDIRI4
CNSTI4 0
NEI4 $380
line 568
;568:		G_Printf("no mapcycle set on this server\n");
ADDRGP4 $383
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 569
;569:		return;
ADDRGP4 $378
JUMPV
LABELV $380
line 572
;570:	}
;571:
;572:	for ( i = 0; i < mapcycle.mapcycleCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $387
JUMPV
LABELV $384
line 573
;573:		if( !strcmp("", mapcycle.mapfiles[i]) )
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+2572
ADDP4
ARGP4
ADDRLP4 4104
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4104
INDIRI4
CNSTI4 0
NEI4 $389
line 574
;574:			strcat ( buffer, va ( "    %s\n", mapcycle.maps[i] ) );
ADDRGP4 $392
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
ARGP4
ADDRLP4 4108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4108
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
ADDRGP4 $390
JUMPV
LABELV $389
line 576
;575:		else
;576:			strcat ( buffer, va ( "    %s(%s)\n", mapcycle.maps[i], mapcycle.mapfiles[i] ) );
ADDRGP4 $393
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+2572
ADDP4
ARGP4
ADDRLP4 4116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4116
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $390
line 577
;577:	}
LABELV $385
line 572
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $387
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2048
INDIRI4
LTI4 $384
line 579
;578:	
;579:	strcat( buffer, "}\n" );
ADDRLP4 4
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 581
;580:	
;581:	if( !mapcycle.allAllowed ){
ADDRGP4 mapcycle+2568
INDIRI4
CNSTI4 0
NEI4 $396
line 583
;582:	
;583:		strcat ( buffer, "\nallowed {\n");
ADDRLP4 4
ARGP4
ADDRGP4 $399
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 585
;584:	
;585:		for ( i = 0; i < mapcycle.allowedMapsCount; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $403
JUMPV
LABELV $400
line 586
;586:			if( !strcmp("", mapcycle.allowedmapfiles[i]) )
ADDRGP4 $301
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+10764
ADDP4
ARGP4
ADDRLP4 4104
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4104
INDIRI4
CNSTI4 0
NEI4 $405
line 587
;587:				strcat ( buffer, va ( "    %s\n", mapcycle.allowedMaps[i] ) );
ADDRGP4 $392
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+2052
ADDP4
INDIRP4
ARGP4
ADDRLP4 4108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4108
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
ADDRGP4 $406
JUMPV
LABELV $405
line 589
;588:			else
;589:				strcat ( buffer, va ( "    %s(%s)\n", mapcycle.allowedMaps[i], mapcycle.allowedmapfiles[i] ) );
ADDRGP4 $393
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+2052
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 mapcycle+10764
ADDP4
ARGP4
ADDRLP4 4116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4116
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $406
line 590
;590:		}
LABELV $401
line 585
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $403
ADDRLP4 0
INDIRI4
ADDRGP4 mapcycle+2564
INDIRI4
LTI4 $400
line 592
;591:
;592:		strcat ( buffer, va ( "}\n" ) );
ADDRGP4 $395
ARGP4
ADDRLP4 4104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4104
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 593
;593:	}
LABELV $396
line 595
;594:	
;595:	G_Printf("%s", buffer);
ADDRGP4 $411
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 597
;596:  
;597:}
LABELV $378
endproc G_sendMapcycle 4120 12
proc G_initMapcycle 4 0
line 606
;598:
;599:/*
;600:=================
;601:G_initMapcycle
;602:set the init values
;603:minplayers 0, maxplayers 64
;604:=================
;605:*/
;606:static void G_initMapcycle ( void ) {
line 608
;607:	int i;
;608:	mapcycle.mapcycleCount = 0;
ADDRGP4 mapcycle+2048
CNSTI4 0
ASGNI4
line 609
;609:	mapcycle.allowedMapsCount = 0;
ADDRGP4 mapcycle+2564
CNSTI4 0
ASGNI4
line 610
;610:	mapcycle.allAllowed = qtrue;
ADDRGP4 mapcycle+2568
CNSTI4 1
ASGNI4
line 611
;611:	for ( i = 0; i < MAX_MAPCYCLECOUNT; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $416
line 612
;612:		mapcycle.minplayers[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+512
ADDP4
CNSTI4 0
ASGNI4
line 613
;613:		mapcycle.maxplayers[i] = MAX_CLIENTS;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+1024
ADDP4
CNSTI4 256
ASGNI4
line 614
;614:		mapcycle.lockarena[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 mapcycle+1536
ADDP4
CNSTI4 0
ASGNI4
line 615
;615:	}
LABELV $417
line 611
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $416
line 616
;616:}
LABELV $412
endproc G_initMapcycle 4 0
export G_LoadMapcycle
proc G_LoadMapcycle 4168 16
line 627
;617:
;618:token_t tokens[MAX_MAPCYCLETOKENS];
;619:
;620:/*
;621:=================
;622:G_LoadMapcycle
;623:load the mapcycle-file
;624:and parse it
;625:=================
;626:*/
;627:void G_LoadMapcycle ( void ) {
line 631
;628:	int len;
;629:	fileHandle_t f;
;630:	char buffer[MAX_MAPCYCLELENGTH];
;631:	int i, charCount = 0;
ADDRLP4 4108
CNSTI4 0
ASGNI4
line 632
;632:	qboolean pgbreak = qfalse, lastSpace = qtrue;
ADDRLP4 4104
CNSTI4 0
ASGNI4
ADDRLP4 4112
CNSTI4 1
ASGNI4
line 633
;633:	int tokenNum = 0, maxTokenNum;
ADDRLP4 4100
CNSTI4 0
ASGNI4
line 635
;634:	int lpar, rpar;
;635:	qboolean allAllowed = qtrue;
ADDRLP4 4132
CNSTI4 1
ASGNI4
line 637
;636:
;637:	G_initMapcycle();
ADDRGP4 G_initMapcycle
CALLV
pop
line 639
;638:
;639:	len = trap_FS_FOpenFile ( g_mapcycle.string, &f, FS_READ );
ADDRGP4 g_mapcycle+16
ARGP4
ADDRLP4 4136
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4140
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4128
ADDRLP4 4140
INDIRI4
ASGNI4
line 641
;640:
;641:	if ( !f ) {
ADDRLP4 4136
INDIRI4
CNSTI4 0
NEI4 $425
line 642
;642:		G_Printf ( "Mapcycle %s not found, setting g_useMapcycle to 0\n", g_mapcycle.string );
ADDRGP4 $427
ARGP4
ADDRGP4 g_mapcycle+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 643
;643:		trap_Cvar_Set ( "g_useMapcycle", "0" );
ADDRGP4 $429
ARGP4
ADDRGP4 $242
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 644
;644:		return;
ADDRGP4 $423
JUMPV
LABELV $425
line 647
;645:	}
;646:
;647:	if ( len > MAX_MAPCYCLELENGTH ) {
ADDRLP4 4128
INDIRI4
CNSTI4 4096
LEI4 $430
line 648
;648:		G_Printf ( "Mapcycle file too large, %s contains %i chars, max allowed is %i\n", g_mapcycle.string, len, MAX_MAPCYCLELENGTH );
ADDRGP4 $432
ARGP4
ADDRGP4 g_mapcycle+16
ARGP4
ADDRLP4 4128
INDIRI4
ARGI4
CNSTI4 4096
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 649
;649:		return;
ADDRGP4 $423
JUMPV
LABELV $430
line 652
;650:	}
;651:
;652:	trap_FS_Read ( buffer, len, f );
ADDRLP4 4
ARGP4
ADDRLP4 4128
INDIRI4
ARGI4
ADDRLP4 4136
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 653
;653:	buffer[len] = 0;
ADDRLP4 4128
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 654
;654:	trap_FS_FCloseFile ( f );
ADDRLP4 4136
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 656
;655:
;656:	COM_Compress ( buffer );
ADDRLP4 4
ARGP4
ADDRGP4 COM_Compress
CALLI4
pop
line 658
;657:
;658:	for ( i = 0; i < MAX_MAPCYCLELENGTH; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $434
line 661
;659:
;660:		//Filter comments( start at # and end at break )
;661:		if ( buffer[i] == '#' ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 35
NEI4 $438
ADDRGP4 $441
JUMPV
LABELV $440
line 662
;662:			while ( i < MAX_MAPCYCLELENGTH && !pgbreak ) {
line 663
;663:				if ( buffer[i] == '\n' || buffer[i] == '\r' )
ADDRLP4 4144
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4144
INDIRI4
CNSTI4 10
EQI4 $445
ADDRLP4 4144
INDIRI4
CNSTI4 13
NEI4 $443
LABELV $445
line 664
;664:					pgbreak = qtrue;
ADDRLP4 4104
CNSTI4 1
ASGNI4
LABELV $443
line 665
;665:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 666
;666:			}
LABELV $441
line 662
ADDRLP4 0
INDIRI4
CNSTI4 4096
GEI4 $446
ADDRLP4 4104
INDIRI4
CNSTI4 0
EQI4 $440
LABELV $446
line 667
;667:			pgbreak = qfalse;
ADDRLP4 4104
CNSTI4 0
ASGNI4
line 668
;668:			lastSpace = qtrue;
ADDRLP4 4112
CNSTI4 1
ASGNI4
line 670
;669:			//continue;
;670:		}
LABELV $438
line 672
;671:
;672:		if ( SkippedChar ( buffer[i] ) ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4144
ADDRGP4 SkippedChar
CALLI4
ASGNI4
ADDRLP4 4144
INDIRI4
CNSTI4 0
EQI4 $447
line 673
;673:			if ( !lastSpace ) {
ADDRLP4 4112
INDIRI4
CNSTI4 0
NEI4 $435
line 674
;674:				buffer[charCount] = ' ';
ADDRLP4 4108
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 32
ASGNI1
line 675
;675:				charCount++;
ADDRLP4 4108
ADDRLP4 4108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 676
;676:				lastSpace = qtrue;
ADDRLP4 4112
CNSTI4 1
ASGNI4
line 677
;677:			}
line 678
;678:			continue;
ADDRGP4 $435
JUMPV
LABELV $447
line 681
;679:		}
;680:
;681:		lastSpace = qfalse;
ADDRLP4 4112
CNSTI4 0
ASGNI4
line 682
;682:		buffer[charCount] = buffer[i];
ADDRLP4 4108
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
ASGNI1
line 683
;683:		charCount++;
ADDRLP4 4108
ADDRLP4 4108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 684
;684:	}
LABELV $435
line 658
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4096
LTI4 $434
line 686
;685:
;686:	buffer[charCount] = '\0';
ADDRLP4 4108
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 688
;687:
;688:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $452
JUMPV
LABELV $451
line 689
;689:	while ( i < MAX_MAPCYCLELENGTH && tokenNum < MAX_MAPCYCLETOKENS ) {
line 690
;690:		i = G_setTokens ( buffer, tokens[tokenNum].value, i );
ADDRLP4 4
ARGP4
CNSTI4 68
ADDRLP4 4100
INDIRI4
MULI4
ADDRGP4 tokens
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4144
ADDRGP4 G_setTokens
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4144
INDIRI4
ASGNI4
line 691
;691:		tokens[tokenNum].type = G_setTokenType ( tokens[tokenNum].value );
ADDRLP4 4148
CNSTI4 68
ADDRLP4 4100
INDIRI4
MULI4
ASGNI4
ADDRLP4 4148
INDIRI4
ADDRGP4 tokens
ADDP4
ARGP4
ADDRLP4 4152
ADDRGP4 G_setTokenType
CALLI4
ASGNI4
ADDRLP4 4148
INDIRI4
ADDRGP4 tokens+64
ADDP4
ADDRLP4 4152
INDIRI4
ASGNI4
line 692
;692:		tokenNum++;
ADDRLP4 4100
ADDRLP4 4100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 693
;693:	}
LABELV $452
line 689
ADDRLP4 0
INDIRI4
CNSTI4 4096
GEI4 $455
ADDRLP4 4100
INDIRI4
CNSTI4 512
LTI4 $451
LABELV $455
line 694
;694:	maxTokenNum = tokenNum;
ADDRLP4 4116
ADDRLP4 4100
INDIRI4
ASGNI4
line 696
;695:
;696:	G_Printf ( "Mapcycle parser found %i tokens\n", maxTokenNum );
ADDRGP4 $456
ARGP4
ADDRLP4 4116
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 698
;697:
;698:	for ( tokenNum = 0; tokenNum < maxTokenNum; tokenNum++ ) {
ADDRLP4 4100
CNSTI4 0
ASGNI4
ADDRGP4 $460
JUMPV
LABELV $457
line 700
;699:
;700:		if ( strcmp ( tokens[tokenNum].value, "mapcycle" ) == 0 ) {
CNSTI4 68
ADDRLP4 4100
INDIRI4
MULI4
ADDRGP4 tokens
ADDP4
ARGP4
ADDRGP4 $463
ARGP4
ADDRLP4 4144
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4144
INDIRI4
CNSTI4 0
NEI4 $461
line 701
;701:			if ( strcmp ( tokens[tokenNum+1].value, "{" ) == 0 ) {
CNSTI4 68
ADDRLP4 4100
INDIRI4
MULI4
ADDRGP4 tokens+68
ADDP4
ARGP4
ADDRGP4 $467
ARGP4
ADDRLP4 4148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4148
INDIRI4
CNSTI4 0
NEI4 $462
line 702
;702:				lpar = tokenNum+1;
ADDRLP4 4124
ADDRLP4 4100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 703
;703:				if ( G_AbeforeB ( ( char* ) "{", ( char* ) "}", tokens, tokenNum+2 ) ) {
ADDRGP4 $467
ARGP4
ADDRGP4 $470
ARGP4
ADDRGP4 tokens
ARGP4
ADDRLP4 4100
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 4152
ADDRGP4 G_AbeforeB
CALLI4
ASGNI4
ADDRLP4 4152
INDIRI4
CNSTI4 0
EQI4 $468
line 704
;704:					G_Printf ( "error: \"}\" expected at %s\n", tokens[tokenNum].value );
ADDRGP4 $471
ARGP4
CNSTI4 68
ADDRLP4 4100
INDIRI4
MULI4
ADDRGP4 tokens
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 705
;705:					break;
ADDRGP4 $459
JUMPV
LABELV $468
line 707
;706:				}
;707:				rpar = G_FindNextToken ( ( char* ) "}", tokens, tokenNum+2 );
ADDRGP4 $470
ARGP4
ADDRGP4 tokens
ARGP4
ADDRLP4 4100
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 4156
ADDRGP4 G_FindNextToken
CALLI4
ASGNI4
ADDRLP4 4120
ADDRLP4 4156
INDIRI4
ASGNI4
line 708
;708:				if ( rpar != -1 ) {
ADDRLP4 4120
INDIRI4
CNSTI4 -1
EQI4 $462
line 709
;709:					G_setMapcycle ( tokens, lpar+1, rpar-1 );
ADDRGP4 tokens
ARGP4
ADDRLP4 4160
CNSTI4 1
ASGNI4
ADDRLP4 4124
INDIRI4
ADDRLP4 4160
INDIRI4
ADDI4
ARGI4
ADDRLP4 4120
INDIRI4
ADDRLP4 4160
INDIRI4
SUBI4
ARGI4
ADDRGP4 G_setMapcycle
CALLV
pop
line 710
;710:					tokenNum = rpar;
ADDRLP4 4100
ADDRLP4 4120
INDIRI4
ASGNI4
line 711
;711:				}
line 712
;712:			}
line 713
;713:		} else if ( strcmp ( tokens[tokenNum].value, "allowed" ) == 0 ) {
ADDRGP4 $462
JUMPV
LABELV $461
CNSTI4 68
ADDRLP4 4100
INDIRI4
MULI4
ADDRGP4 tokens
ADDP4
ARGP4
ADDRGP4 $476
ARGP4
ADDRLP4 4148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4148
INDIRI4
CNSTI4 0
NEI4 $474
line 714
;714:			allAllowed = qfalse;
ADDRLP4 4132
CNSTI4 0
ASGNI4
line 715
;715:			if ( strcmp ( tokens[tokenNum+1].value, "{" ) == 0 ) {
CNSTI4 68
ADDRLP4 4100
INDIRI4
MULI4
ADDRGP4 tokens+68
ADDP4
ARGP4
ADDRGP4 $467
ARGP4
ADDRLP4 4152
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4152
INDIRI4
CNSTI4 0
NEI4 $477
line 716
;716:				lpar = tokenNum+1;
ADDRLP4 4124
ADDRLP4 4100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 717
;717:				if ( G_AbeforeB ( ( char* ) "{", ( char* ) "}", tokens, tokenNum+2 ) ) {
ADDRGP4 $467
ARGP4
ADDRGP4 $470
ARGP4
ADDRGP4 tokens
ARGP4
ADDRLP4 4100
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 4156
ADDRGP4 G_AbeforeB
CALLI4
ASGNI4
ADDRLP4 4156
INDIRI4
CNSTI4 0
EQI4 $480
line 718
;718:					G_Printf ( "error: \"}\" expected at %s\n", tokens[tokenNum].value );
ADDRGP4 $471
ARGP4
CNSTI4 68
ADDRLP4 4100
INDIRI4
MULI4
ADDRGP4 tokens
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 719
;719:					break;
ADDRGP4 $459
JUMPV
LABELV $480
line 721
;720:				}
;721:				rpar = G_FindNextToken ( ( char* ) "}", tokens, tokenNum+2 );
ADDRGP4 $470
ARGP4
ADDRGP4 tokens
ARGP4
ADDRLP4 4100
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 4160
ADDRGP4 G_FindNextToken
CALLI4
ASGNI4
ADDRLP4 4120
ADDRLP4 4160
INDIRI4
ASGNI4
line 722
;722:				if ( rpar != -1 ) {
ADDRLP4 4120
INDIRI4
CNSTI4 -1
EQI4 $482
line 723
;723:					G_setAllowedMaps ( tokens, lpar+1, rpar-1 );
ADDRGP4 tokens
ARGP4
ADDRLP4 4164
CNSTI4 1
ASGNI4
ADDRLP4 4124
INDIRI4
ADDRLP4 4164
INDIRI4
ADDI4
ARGI4
ADDRLP4 4120
INDIRI4
ADDRLP4 4164
INDIRI4
SUBI4
ARGI4
ADDRGP4 G_setAllowedMaps
CALLV
pop
line 724
;724:					tokenNum = rpar;
ADDRLP4 4100
ADDRLP4 4120
INDIRI4
ASGNI4
line 725
;725:				}
LABELV $482
line 726
;726:			}
LABELV $477
line 727
;727:		}
LABELV $474
LABELV $462
line 728
;728:	}
LABELV $458
line 698
ADDRLP4 4100
ADDRLP4 4100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $460
ADDRLP4 4100
INDIRI4
ADDRLP4 4116
INDIRI4
LTI4 $457
LABELV $459
line 729
;729:  if (mapcycle.mapcycleCount < g_mapcycleposition.integer) {
ADDRGP4 mapcycle+2048
INDIRI4
ADDRGP4 g_mapcycleposition+12
INDIRI4
GEI4 $484
line 730
;730:      trap_Cvar_Set("g_mapcycleposition","0");
ADDRGP4 $241
ARGP4
ADDRGP4 $242
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 731
;731:  }
LABELV $484
line 733
;732:
;733:	mapcycle.allAllowed = allAllowed;
ADDRGP4 mapcycle+2568
ADDRLP4 4132
INDIRI4
ASGNI4
line 734
;734:}
LABELV $423
endproc G_LoadMapcycle 4168 16
bss
export tokens
align 4
LABELV tokens
skip 34816
export mapcycle
align 4
LABELV mapcycle
skip 18956
import G_admin_namelog_cleanup
import G_admin_cleanup
import G_admin_duration
import G_admin_buffer_end
import G_admin_buffer_begin
import G_admin_buffer_print
import G_admin_print
import G_admin_shuffle
import G_admin_warn
import G_admin_slap
import G_admin_orient
import G_admin_disorient
import G_admin_unlock
import G_admin_lock
import G_admin_namelog
import G_admin_nextmap
import G_admin_restart
import G_admin_rename
import G_admin_spec999
import G_admin_passvote
import G_admin_cancelvote
import G_admin_allready
import G_admin_admintest
import G_admin_help
import G_admin_showbans
import G_admin_mute
import G_admin_map
import G_admin_listplayers
import G_admin_listadmins
import G_admin_putteam
import G_admin_unban
import G_admin_ban
import G_admin_adjustban
import G_admin_kick
import G_admin_setlevel
import G_admin_time
import G_admin_parse_time
import G_admin_level
import G_admin_namelog_update
import G_admin_name_check
import G_admin_permission
import G_admin_readconfig
import G_admin_cmd_check
import G_admin_ban_check
import G_ConfigClientExcellent
import G_checkForMultiKill
import G_CheckForSpree
import G_RunStreakLogic
import G_ReadAltKillSettings
import AU_Cvar_VariableString
import G_ArenaScriptRandom
import G_ArenaScriptAutoFloat
import G_ArenaScriptAutoNonPointChar
import G_ArenaScriptAutoChar
import G_ArenaScriptAutoInt
import G_ArenaScriptFindFloat
import G_ArenaScriptFindChar
import G_ArenaScriptFindInt
import Svcmd_SaveSession_f
import Svcmd_For_f
import Svcmd_SystemCommand_f
import Svcmd_ClientCommand_f
import Svcmd_Editline_f
import Svcmd_Random_f
import Svcmd_Cvar_f
import Svcmd_Operation_f
import Svcmd_Condition_f
import Svcmd_MessageWrapper
import Svcmd_ListIP_f
import Svcmd_Chat_f
import Svcmd_DumpUser_f
import Svcmd_EjectClient_f
import Svcmd_BannerPrint_f
import Svcmd_ReplaceTexture_f
import Svcmd_CenterPrint_f
import Svcmd_TeamMessage_f
import Svcmd_Status_f
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_System
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_maxNameChanges
import g_minNameChangePeriod
import g_warningExpire
import g_maxWarnings
import g_publicAdminMessages
import g_specChat
import g_adminMaxBan
import g_adminTempBan
import g_adminNameProtect
import g_adminParseSay
import g_adminLog
import g_admin
import g_floodMinTime
import g_floodMaxDemerits
import g_spreeDiv
import g_altExcellent
import g_sprees
import g_lagLightning
import sv_fps
import g_truePing
import g_delagHitscan
import g_blueTeamClientNumbers
import g_redTeamClientNumbers
import g_humanplayers
import g_maxvotes
import g_voteMaxFraglimit
import g_voteMinFraglimit
import g_voteMaxTimelimit
import g_voteMinTimelimit
import g_voteGametypes
import g_voteBan
import g_voteNames
import g_mappools
import g_autonextmap
import g_catchup
import g_persistantpowerups
import g_awardpushing
import g_elimination_ctf_oneway
import g_lms_mode
import g_lms_lives
import g_ffa_gt
import g_regen
import g_vampireMaxHealth
import g_vampire
import g_instantgib
import g_rockets
import g_elimination_lockspectator
import g_eliminationred_holdable
import g_eliminationred_flight
import g_eliminationred_regen
import g_eliminationred_invis
import g_eliminationred_bsuit
import g_eliminationred_haste
import g_eliminationred_quad
import g_eliminationred_antimatter
import g_eliminationred_flame
import g_eliminationred_nail
import g_eliminationred_mine
import g_eliminationred_chain
import g_eliminationred_plasmagun
import g_eliminationred_lightning
import g_eliminationred_railgun
import g_eliminationred_rocket
import g_eliminationred_grenade
import g_eliminationred_shotgun
import g_eliminationred_machinegun
import g_eliminationred_gauntlet
import g_eliminationred_grapple
import g_eliminationred_bfg
import g_eliminationred_startArmor
import g_eliminationred_startHealth
import g_elimination_holdable
import g_elimination_items
import g_elimination_flight
import g_elimination_regen
import g_elimination_invis
import g_elimination_bsuit
import g_elimination_haste
import g_elimination_quad
import g_elimination_antimatter
import g_elimination_flame
import g_elimination_nail
import g_elimination_mine
import g_elimination_chain
import g_elimination_plasmagun
import g_elimination_lightning
import g_elimination_railgun
import g_elimination_rocket
import g_elimination_grenade
import g_elimination_shotgun
import g_elimination_machinegun
import g_elimination_gauntlet
import g_elimination_allgametypes
import g_elimination_activewarmup
import g_elimination_warmup
import g_elimination_roundtime
import g_elimination_grapple
import g_elimination_bfg
import g_elimination_startArmor
import g_elimination_startHealth
import g_elimination_selfdamage
import g_spawnprotect
import g_music
import g_proxMineTimeout
import g_enableBreath
import g_enableDust
import g_blueteam
import g_redteam
import g_singlePlayer
import g_rankings
import pmove_float
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_votecustom
import g_votemaps
import g_motdfile
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_allowSyncCutscene
import g_debugBotspawns
import g_debugVariables
import g_debugScore
import g_debugCameras
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_disableCutscenes
import g_inactivity
import g_respawntime
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_damageModifier
import g_gravityModifier
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_voteflags
import g_elimflags
import g_videoflags
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_poweruprespawn
import g_megahealthrespawn
import g_holdablerespawn
import g_ammorespawn
import g_healthrespawn
import g_armorrespawn
import g_ammolimit
import g_drowndamage
import g_speedfactor
import g_jumpheight
import g_respawnwait
import g_armorprotect
import g_medkitmodifier
import g_hastefirespeed
import g_autoflagreturn
import g_droppeditemtime
import g_slowhealthregen
import g_fasthealthregen
import g_invultime
import g_invulmove
import g_portalhealth
import g_portaltimeout
import g_flagrespawn
import g_noplayerclip
import g_falldamagebig
import g_falldamagesmall
import g_randomteleport
import g_maxweaponpickup
import g_slimedamage
import g_lavadamage
import g_waterdamage
import g_medkitlimit
import g_kamikazeinf
import g_portalinf
import g_teleporterinf
import g_medkitinf
import g_invulinf
import g_kamikazeinfinf
import g_kill
import g_mapcycleposition
import g_useMapcycle
import g_mapcycle
import info_zombie
import g_randomItems
import g_accelerate
import g_slickmove
import g_overlay
import g_lavatowater
import onandroid
import eliminationrespawn
import eliminationredrespawn
import g_spectatorspeed
import g_regenarmor
import tex_newname
import tex_name
import g_roundmode
import g_scoreboardlock
import g_connectmsg
import g_currentmap
import g_tests
import cl_language
import cl_selectedmod
import g_maxEntities
import g_npcdrop
import g_safe
import g_allowgravitygun
import g_allowphysgun
import g_allowtoolgun
import g_allownoclip
import g_allowitems
import g_allownpc
import g_allowsettings
import g_allowprops
import save8_epsession
import save8_session0_lvl
import save8_session0
import save7_epsession
import save7_session0_lvl
import save7_session0
import save6_epsession
import save6_session0_lvl
import save6_session0
import save5_epsession
import save5_session0_lvl
import save5_session0
import save4_epsession
import save4_session0_lvl
import save4_session0
import save3_epsession
import save3_session0_lvl
import save3_session0
import save2_epsession
import save2_session0_lvl
import save2_session0
import save1_epsession
import save1_session0_lvl
import save1_session0
import save_epsession
import save_session0_lvl
import save_session0
import save8_curmap
import save7_curmap
import save6_curmap
import save5_curmap
import save4_curmap
import save3_curmap
import save2_curmap
import save1_curmap
import save_curmap
import g_skyColorA
import g_skyColorB
import g_skyColorG
import g_skyColorR
import g_skyShader
import g_fogColorA
import g_fogColorB
import g_fogColorG
import g_fogColorR
import g_fogInterval
import g_fogDistance
import g_fogShader
import g_fogModel
import g_teamred_pickupitems
import g_teamred_respawnwait
import g_teamred_infammo
import g_teamred_damage
import g_teamred_firespeed
import g_teamred_gravityModifier
import g_teamred_speed
import g_teamblue_pickupitems
import g_teamblue_respawnwait
import g_teamblue_infammo
import g_teamblue_damage
import g_teamblue_firespeed
import g_teamblue_gravityModifier
import g_teamblue_speed
import g_amweaponcount
import g_ftweaponcount
import g_cgweaponcount
import g_plweaponcount
import g_ngweaponcount
import g_bfgweaponcount
import g_pgweaponcount
import g_rgweaponcount
import g_lgweaponcount
import g_rlweaponcount
import g_glweaponcount
import g_sgweaponcount
import g_mgweaponcount
import g_ftammocount
import g_cgammocount
import g_plammocount
import g_ngammocount
import g_bfgammocount
import g_pgammocount
import g_rgammocount
import g_lgammocount
import g_rlammocount
import g_glammocount
import g_sgammocount
import g_mgammocount
import g_ammoregenhealthmodifier
import g_ammoregengravitymodifier
import g_ammoregenspeedfactor
import g_ammoregendamagefactor
import g_ammoregen_infammo
import g_ammoregenfirespeed
import g_guard_infammo
import g_guardgravitymodifier
import g_guardspeedfactor
import g_guarddamagefactor
import g_guardfirespeed
import g_guardhealthmodifier
import g_doublerhealthmodifier
import g_doubler_infammo
import g_doublergravitymodifier
import g_doublerspeedfactor
import g_doublerdamagefactor
import g_doublerfirespeed
import g_scouthealthmodifier
import g_scout_infammo
import g_scoutgravitymodifier
import g_scoutdamagefactor
import g_scoutfirespeed
import g_scoutspeedfactor
import g_amguided
import g_amhoming
import g_ftguided
import g_fthoming
import g_ngguided
import g_nghoming
import g_bfgguided
import g_bfghoming
import g_pgguided
import g_pghoming
import g_rlguided
import g_rlhoming
import g_glguided
import g_glhoming
import g_amknockback
import g_ambouncemodifier
import g_aminf
import g_amvampire
import g_amgravity
import g_ambounce
import g_amtimeout
import g_amdamage
import g_amsdamage
import g_amspeed
import g_amsradius
import g_amdelay
import g_ftknockback
import g_ftbouncemodifier
import g_ftinf
import g_ftvampire
import g_ftgravity
import g_ftbounce
import g_fttimeout
import g_ftdamage
import g_ftsdamage
import g_ftspeed
import g_ftsradius
import g_ftdelay
import g_cgknockback
import g_cginf
import g_cgvampire
import g_cgspread
import g_cgdamage
import g_cgdelay
import g_plknockback
import g_plinf
import g_plvampire
import g_plgravity
import g_pldamage
import g_plsdamage
import g_plsradius
import g_pltimeout
import g_plspeed
import g_pldelay
import g_ngknockback
import g_ngbouncemodifier
import g_nginf
import g_ngvampire
import g_ngrandom
import g_nggravity
import g_ngbounce
import g_ngcount
import g_ngtimeout
import g_ngdamage
import g_ngspread
import g_ngspeed
import g_ngdelay
import g_bfgknockback
import g_bfgbouncemodifier
import g_bfginf
import g_bfgvampire
import g_bfggravity
import g_bfgbounce
import g_bfgdamage
import g_bfgsdamage
import g_bfgsradius
import g_bfgtimeout
import g_bfgspeed
import g_bfgdelay
import g_pgknockback
import g_pgbouncemodifier
import g_pginf
import g_pgvampire
import g_pggravity
import g_pgbounce
import g_pgtimeout
import g_pgdamage
import g_pgsdamage
import g_pgspeed
import g_pgsradius
import g_pgdelay
import g_rgknockback
import g_rginf
import g_rgvampire
import g_rgdamage
import g_rgdelay
import g_lgknockback
import g_lginf
import g_lgvampire
import g_lgsradius
import g_lgsdamage
import g_lgexplode
import g_lgrange
import g_lgdelay
import g_lgdamage
import g_rlknockback
import g_rlbouncemodifier
import g_rlinf
import g_rlvampire
import g_rlgravity
import g_rlbounce
import g_rldamage
import g_rlsdamage
import g_rlsradius
import g_rltimeout
import g_rlspeed
import g_rldelay
import g_glknockback
import g_glbouncemodifier
import g_glinf
import g_glvampire
import g_glgravity
import g_glbounce
import g_gldamage
import g_glsdamage
import g_glsradius
import g_gltimeout
import g_glspeed
import g_gldelay
import g_sgknockback
import g_sginf
import g_sgvampire
import g_sgcount
import g_sgsradius
import g_sgsdamage
import g_sgexplode
import g_sgspread
import g_sgdamage
import g_sgdelay
import g_mgknockback
import g_mginf
import g_mgvampire
import g_mgsradius
import g_mgsdamage
import g_mgexplode
import g_mgspread
import g_mgdamage
import g_mgdelay
import g_gknockback
import g_grange
import g_gdamage
import g_gdelay
import mod_ghtimeout
import g_ghtimeout
import g_ghspeed
import g_minigame
import g_physdamage
import g_physimpulse
import g_physimpact
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
import mod_gravity
import mod_zsround
import mod_zround
import mod_roundmode
import mod_overlay
import mod_slickmove
import mod_accelerate
import mod_teamred_damage
import mod_teamblue_damage
import mod_invulinf
import mod_kamikazeinf
import mod_portalinf
import mod_teleporterinf
import mod_medkitinf
import mod_medkitlimit
import mod_teamblue_firespeed
import mod_teamred_firespeed
import mod_invulmove
import mod_noplayerclip
import mod_flighttime
import mod_regentime
import mod_invistime
import mod_hastetime
import mod_bsuittime
import mod_quadtime
import mod_doublerfirespeed
import mod_guardfirespeed
import mod_poweruptime
import mod_scoutfirespeed
import mod_ammoregenfirespeed
import mod_hastefirespeed
import mod_vampire_max_health
import mod_amdelay
import mod_ftdelay
import mod_cgspread
import mod_cgdelay
import mod_pldelay
import mod_ngdelay
import mod_bfgdelay
import mod_rgdelay
import mod_pgdelay
import mod_lgrange
import mod_lgdelay
import mod_rldelay
import mod_gldelay
import mod_sgcount
import mod_sgspread
import mod_sgdelay
import mod_mgspread
import mod_mgdelay
import mod_gdelay
import mod_jumpheight
import mod_ammolimit
import cmapname
import CustomModRun
import Newmodcommands
import nailgun_think
import bfg_think
import grenade_think
import rocket_think
import plasma_think
import G_SendSwepWeapons
import G_SendWeaponProperties
import g_entities
import level
import Team_ForceGesture
import Team_DD_bonusAtPoints
import Team_RemoveDoubleDominationPoints
import Team_SpawnDoubleDominationPoints
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import Team_Dom_SpawnPoints
import SelectDoubleDominationSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import G_LoadMapfileAll_f
import G_LoadMapfile_f
import G_LoadMapfileAll
import G_LoadMapfile
import G_WriteMapfileAll_f
import G_WriteMapfile_f
import G_ClassnameAllowedAll
import G_ClassnameAllowed
import getCustomVote
import VoteParseCustomVotes
import allowedFraglimit
import allowedTimelimit
import allowedGametype
import allowedMap
import getMappage
import custom_vote_info
import ClientLeaving
import CountVotes
import CheckVote
import allowedVote
import PlayerStore_restore
import PlayerStore_store
import PlayerStoreInit
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_SaveClientSessionDataSave
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_TeamFromString
import ShuffleTeams
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_DefaultSwep
import G_CheckSwepAmmo
import G_CheckSwep
import G_RunClient
import ClientEndFrame
import ClientThink
import PrecacheBotAssets
import SetCustomWeapons
import SetSandboxWeapons
import SetUnlimitedWeapons
import SetupCustomBot
import LinkBotSpawnEntity
import DropClientSilently
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_NpcFactionProp
import G_LevelLoadComplete
import CheckTeamVote
import LogExit
import G_Error
import G_Printf
import SendYourTeamMessageToTeam
import SendDominationPointsStatusMessageToAllClients
import SendDDtimetakenMessageToAllClients
import SendEliminationMessageToAllClients
import SendScoreboardMessageToAllClients
import G_LogPrintf
import ExitLevel
import AddTournamentQueue
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import SendCustomVoteCommands
import DominationPointStatusMessage
import DominationPointNamesMessage
import RespawnTimeMessage
import EliminationMessage
import ObeliskHealthMessage
import AttackingTeamMessage
import YourTeamMessage
import DoubleDominationScoreTimeMessage
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import G_StartCarExplode
import G_StartKamikaze
import KamikazeShockWave
import KamikazeRadiusDamage
import CarExplodeDamage
import KamikazeDamage
import FireWeapon
import ClientForString
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpawnPointIsActive
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import ClientRespawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import LMSpoint
import EndEliminationRound
import DisableWeapons
import EnableWeapons
import RespawnDead
import RespawnAll
import TeamHealthCount
import TeamLivingCount
import TeamCount
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Laser_Think
import Laser_Gen
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import G_FindEntityForClientNum
import G_FindEntityForEntityNum
import G_ShowObjects
import G_HideObjects
import G_BounceProp
import G_RunProp
import G_ModProp
import DropPortalDestination
import DropPortalSource
import TeleportPlayer
import lock_touch
import trigger_teleporter_touch
import Break_Breakable
import Touch_DoorTrigger
import G_RunMover
import fire_antimatter
import fire_flame
import fire_prox
import fire_nail
import fire_nails
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_custom
import fire_blaster
import ProximityMine_RemoveAll
import G_RunMissile
import TossClientCubes
import TossClientPersistantPowerups
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_ExitVehicle
import G_CarDamage
import G_PropDamage
import G_Damage
import CanDamage
import target_finish_use
import target_finish_think
import BuildShaderStateConfig
import AddRemap
import G_SetTargetname
import G_SetTarget
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_GlobalSound
import G_Sound
import G_TempEntity
import G_Spawn
import findradius
import G_InitGentity
import CrosshairPointGravity
import CrosshairPointPhys
import FindEntityForGravitygun
import FindEntityForPhysgun
import VehiclePhys
import botsandbox_check
import G_CalculatePlayerScore
import G_FadeIn
import G_FadeOut
import G_Fade
import G_GetScoringMapName
import G_SetMovedir
import G_UseDeathTargets
import G_UseTargets
import G_PickTarget
import G_ScrFind
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import Throw_Item
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item2
import Touch_Item
import Set_Weapon
import Set_Ammo
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchBackpack
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItemCtf
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import writeFile_string
import writeFile_int
import readFile_string
import readFile_int
import SanitizeString
import G_ClientIsLagging
import G_ClientNumberFromString
import Cmd_AdminMessage_f
import G_FloodLimited
import G_ClientNumbersFromString
import G_SanitiseString
import G_MatchOnePlayer
import G_DecolorString
import G_SayConcatArgs
import G_SayArgv
import G_SayArgc
import NextCustomRound_f
import G_Say
import ConcatArgs
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector4
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import MiTechEntityList
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
LABELV $476
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $471
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 34
byte 1 125
byte 1 34
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $470
byte 1 125
byte 1 0
align 1
LABELV $467
byte 1 123
byte 1 0
align 1
LABELV $463
byte 1 109
byte 1 97
byte 1 112
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $456
byte 1 77
byte 1 97
byte 1 112
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $432
byte 1 77
byte 1 97
byte 1 112
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 97
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $429
byte 1 103
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $427
byte 1 77
byte 1 97
byte 1 112
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 44
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 103
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $411
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $399
byte 1 10
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 123
byte 1 10
byte 1 0
align 1
LABELV $395
byte 1 125
byte 1 10
byte 1 0
align 1
LABELV $393
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $392
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $383
byte 1 110
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $379
byte 1 109
byte 1 97
byte 1 112
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 32
byte 1 123
byte 1 10
byte 1 0
align 1
LABELV $360
byte 1 94
byte 1 51
byte 1 37
byte 1 105
byte 1 32
byte 1 94
byte 1 50
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $349
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $342
byte 1 10
byte 1 0
align 1
LABELV $340
byte 1 94
byte 1 49
byte 1 37
byte 1 115
byte 1 32
byte 1 0
align 1
LABELV $334
byte 1 94
byte 1 50
byte 1 37
byte 1 115
byte 1 32
byte 1 0
align 1
LABELV $328
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $301
byte 1 0
align 1
LABELV $251
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $249
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $248
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $247
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $242
byte 1 48
byte 1 0
align 1
LABELV $241
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $219
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $214
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 109
byte 1 97
byte 1 112
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $195
byte 1 78
byte 1 111
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $170
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 78
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $152
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $121
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
