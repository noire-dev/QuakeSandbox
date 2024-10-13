export G_SayArgc
code
proc G_SayArgc 16 4
file "../../../code/game/g_cmds_ext.c"
line 38
;1:/*
;2:===========================================================================
;3:Copyright (C) 2004-2006 Tony J. White
;4:
;5:This file is part of the Open Arena source code.
;6:
;7:Copied from Tremulous under GPL version 2 including any later version.
;8:
;9:Open Arena source code is free software; you can redistribute it
;10:and/or modify it under the terms of the GNU General Public License as
;11:published by the Free Software Foundation; either version 2 of the License,
;12:or (at your option) any later version.
;13:
;14:Open Arena source code is distributed in the hope that it will be
;15:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;16:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;17:GNU General Public License for more details.
;18:
;19:You should have received a copy of the GNU General Public License
;20:along with Open Arena source code; if not, write to the Free Software
;21:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;22:===========================================================================
;23:*/
;24:
;25:#include "g_local.h"
;26:
;27:/*
;28:=================
;29:G_SayArgc
;30:G_SayArgv
;31:G_SayConcatArgs
;32:
;33:trap_Argc, trap_Argv, and ConcatArgs consider say text as a single argument
;34:These functions assemble the text and re-parse it on word boundaries
;35:=================
;36:*/
;37:int G_SayArgc( void )
;38:{
line 39
;39:    int c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 42
;40:    char *s;
;41:
;42:    s = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $66
JUMPV
line 44
;43:    while( 1 )
;44:    {
LABELV $68
line 46
;45:        while( *s == ' ' )
;46:            s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $69
line 45
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $68
line 47
;47:        if( !*s )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $71
line 48
;48:            break;
ADDRGP4 $67
JUMPV
LABELV $71
line 49
;49:        c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $74
JUMPV
LABELV $73
line 51
;50:        while( *s && *s != ' ' )
;51:            s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $74
line 50
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $76
ADDRLP4 12
INDIRI4
CNSTI4 32
NEI4 $73
LABELV $76
line 52
;52:    }
LABELV $66
line 43
ADDRGP4 $69
JUMPV
LABELV $67
line 53
;53:    return c;
ADDRLP4 4
INDIRI4
RETI4
LABELV $64
endproc G_SayArgc 16 4
export G_SayArgv
proc G_SayArgv 20 4
line 57
;54:}
;55:
;56:qboolean G_SayArgv( int n, char *buffer, int bufferLength )
;57:{
line 60
;58:    char *s;
;59:
;60:    if( bufferLength < 1 )
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $78
line 61
;61:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $77
JUMPV
LABELV $78
line 62
;62:    if( n < 0 )
ADDRFP4 0
INDIRI4
CNSTI4 0
GEI4 $80
line 63
;63:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $77
JUMPV
LABELV $80
line 64
;64:    s = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $83
JUMPV
line 66
;65:    while( 1 )
;66:    {
LABELV $85
line 68
;67:        while( *s == ' ' )
;68:            s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $86
line 67
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $85
line 69
;69:        if( !*s || n == 0 )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $90
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $88
LABELV $90
line 70
;70:            break;
ADDRGP4 $84
JUMPV
LABELV $88
line 71
;71:        n--;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
line 73
;72:        while( *s && *s != ' ' )
;73:            s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $92
line 72
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $94
ADDRLP4 12
INDIRI4
CNSTI4 32
NEI4 $91
LABELV $94
line 74
;74:    }
LABELV $83
line 65
ADDRGP4 $86
JUMPV
LABELV $84
line 75
;75:    if( n > 0 )
ADDRFP4 0
INDIRI4
CNSTI4 0
LEI4 $98
line 76
;76:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $77
JUMPV
LABELV $97
line 79
;77:  //memccpy( buffer, s, ' ', bufferLength );
;78:    while( *s && *s != ' ' && bufferLength > 1 )
;79:    {
line 80
;80:        *buffer++ = *s++;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRFP4 4
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
line 81
;81:        bufferLength--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 82
;82:    }
LABELV $98
line 78
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $101
ADDRLP4 8
INDIRI4
CNSTI4 32
EQI4 $101
ADDRFP4 8
INDIRI4
CNSTI4 1
GTI4 $97
LABELV $101
line 83
;83:    *buffer = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 84
;84:    return qtrue;
CNSTI4 1
RETI4
LABELV $77
endproc G_SayArgv 20 4
export G_SayConcatArgs
proc G_SayConcatArgs 16 4
line 88
;85:}
;86:
;87:char *G_SayConcatArgs( int start )
;88:{
line 91
;89:    char *s;
;90:
;91:    s = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $104
JUMPV
line 93
;92:    while( 1 )
;93:    {
LABELV $106
line 95
;94:        while( *s == ' ' )
;95:            s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $107
line 94
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $106
line 96
;96:        if( !*s || start == 0 )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $111
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $109
LABELV $111
line 97
;97:            break;
ADDRGP4 $105
JUMPV
LABELV $109
line 98
;98:        start--;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $112
line 100
;99:        while( *s && *s != ' ' )
;100:            s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $113
line 99
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $115
ADDRLP4 12
INDIRI4
CNSTI4 32
NEI4 $112
LABELV $115
line 101
;101:    }
LABELV $104
line 92
ADDRGP4 $107
JUMPV
LABELV $105
line 102
;102:    return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $102
endproc G_SayConcatArgs 16 4
export G_DecolorString
proc G_DecolorString 20 0
line 106
;103:}
;104:
;105:void G_DecolorString( char *in, char *out, int len )
;106:{
line 107
;107:    len--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $118
JUMPV
LABELV $117
line 110
;108:
;109:    while( *in && len > 0 ) 
;110:    {
line 111
;111:        if( Q_IsColorString( in ) ) 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $120
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $120
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $120
ADDRLP4 4
INDIRI4
CNSTI4 48
LTI4 $120
ADDRLP4 4
INDIRI4
CNSTI4 57
GTI4 $120
line 112
;112:        {
line 113
;113:            in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 114
;114:            if( *in )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $118
line 115
;115:                in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 116
;116:            continue;
ADDRGP4 $118
JUMPV
LABELV $120
line 118
;117:        }
;118:        *out++ = *in++;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
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
line 119
;119:        len--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 120
;120:    }
LABELV $118
line 109
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 0
INDIRI4
EQI4 $124
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
GTI4 $117
LABELV $124
line 121
;121:    *out = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 122
;122:}
LABELV $116
endproc G_DecolorString 20 0
lit
align 1
LABELV $126
byte 1 0
skip 41
export G_MatchOnePlayer
code
proc G_MatchOnePlayer 60 20
line 134
;123:
;124:/*
;125:==================
;126:G_MatchOnePlayer
;127:
;128:This is a companion function to G_ClientNumbersFromString()
;129:
;130:err will be populated with an error message.
;131:==================
;132:*/
;133:void G_MatchOnePlayer( int *plist, int num, char *err, int len )
;134:{
line 137
;135:    gclient_t *cl;
;136:    int i;
;137:    char line[ MAX_NAME_LENGTH + 10 ] = {""};
ADDRLP4 0
ADDRGP4 $126
INDIRB
ASGNB 42
line 139
;138:
;139:    err[ 0 ] = '\0';
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 140
;140:    if( num == 0 )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $127
line 141
;141:    {
line 142
;142:        Q_strcat( err, len, "no connected player by that name or slot #" );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 $129
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 143
;143:    }
ADDRGP4 $128
JUMPV
LABELV $127
line 144
;144:    else if( num > 1 )
ADDRFP4 4
INDIRI4
CNSTI4 1
LEI4 $130
line 145
;145:    {
line 146
;146:        Q_strcat( err, len, "more than one player name matches. Be more specific or use the slot #:\n" );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 $132
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 147
;147:        for( i = 0; i < num; i++ )
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 $136
JUMPV
LABELV $133
line 148
;148:        {
line 149
;149:            cl = &level.clients[ plist[ i ] ];
ADDRLP4 48
CNSTI4 2324
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 150
;150:            if( cl->pers.connected == CON_DISCONNECTED )
ADDRLP4 48
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $137
line 151
;151:                continue;
ADDRGP4 $134
JUMPV
LABELV $137
line 152
;152:            Com_sprintf( line, sizeof( line ), "%2i - %s^7\n",
ADDRLP4 0
ARGP4
CNSTI4 42
ARGI4
ADDRGP4 $139
ARGP4
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 154
;153:            plist[ i ], cl->pers.netname );
;154:            if( strlen( err ) + strlen( line ) > len )
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 56
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
ADDI4
ADDRFP4 12
INDIRI4
LEI4 $140
line 155
;155:                break;
ADDRGP4 $135
JUMPV
LABELV $140
line 156
;156:            Q_strcat( err, len, line );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 157
;157:        }
LABELV $134
line 147
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $136
ADDRLP4 44
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $133
LABELV $135
line 158
;158:    }
LABELV $130
LABELV $128
line 159
;159:}
LABELV $125
endproc G_MatchOnePlayer 60 20
export G_SanitiseString
proc G_SanitiseString 32 4
line 169
;160:
;161:/*
;162:==================
;163:G_SanitiseString
;164:
;165:Remove case and control characters from a string
;166:==================
;167:*/
;168:void G_SanitiseString( char *in, char *out, int len )
;169:{
line 170
;170:    qboolean skip = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 171
;171:    int spaces = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 173
;172:
;173:    len--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $143
line 176
;174:
;175:    while( *in && len > 0 )
;176:    {
line 178
;177:        // strip leading white space
;178:        if( *in == ' ' )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $146
line 179
;179:        {
line 180
;180:            if( skip )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $148
line 181
;181:            {
line 182
;182:                in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 183
;183:                continue;
ADDRGP4 $144
JUMPV
LABELV $148
line 185
;184:            }
;185:                spaces++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 186
;186:        }
ADDRGP4 $147
JUMPV
LABELV $146
line 188
;187:        else
;188:        {
line 189
;189:            spaces = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 190
;190:            skip = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 191
;191:        }
LABELV $147
line 193
;192:
;193:        if( Q_IsColorString( in ) )
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $150
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $150
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $150
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $150
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $150
line 194
;194:        {
line 195
;195:            in += 2;    // skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 196
;196:            continue;
ADDRGP4 $144
JUMPV
LABELV $150
line 199
;197:        }
;198:
;199:        if( *in < 32 )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $152
line 200
;200:        {
line 201
;201:            in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 202
;202:            continue;
ADDRGP4 $144
JUMPV
LABELV $152
line 205
;203:        }
;204:
;205:        *out++ = tolower( *in++ );
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 28
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
CVII1 4
ASGNI1
line 206
;206:        len--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 207
;207:    }
LABELV $144
line 175
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $154
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
GTI4 $143
LABELV $154
line 208
;208:    out -= spaces;
ADDRFP4 4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
SUBP4
ASGNP4
line 209
;209:    *out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 210
;210:}
LABELV $142
endproc G_SanitiseString 32 4
lit
align 1
LABELV $156
byte 1 0
skip 31
align 1
LABELV $157
byte 1 0
skip 31
export G_ClientNumbersFromString
code
proc G_ClientNumbersFromString 92 12
line 224
;211:
;212:
;213:/*
;214:==================
;215:G_ClientNumbersFromString
;216:
;217:Sets plist to an array of integers that represent client numbers that have
;218:names that are a partial match for s.
;219:
;220:Returns number of matching clientids up to max.
;221:==================
;222:*/
;223:int G_ClientNumbersFromString( char *s, int *plist, int max )
;224:{
line 226
;225:  gclient_t *p;
;226:  int i, found = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 227
;227:  char n2[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 4
ADDRGP4 $156
INDIRB
ASGNB 32
line 228
;228:  char s2[ MAX_NAME_LENGTH ] = {""};
ADDRLP4 44
ADDRGP4 $157
INDIRB
ASGNB 32
line 230
;229:
;230:  if( max == 0 )
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $158
line 231
;231:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $155
JUMPV
LABELV $158
line 234
;232:
;233:  // if a number is provided, it is a clientnum
;234:  for( i = 0; s[ i ] && isdigit( s[ i ] ); i++ );
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $163
JUMPV
LABELV $160
LABELV $161
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $163
ADDRLP4 76
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $165
ADDRLP4 76
INDIRI4
CNSTI4 48
LTI4 $165
ADDRLP4 76
INDIRI4
CNSTI4 57
LEI4 $160
LABELV $165
line 235
;235:  if( !s[ i ] )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $166
line 236
;236:  {
line 237
;237:    i = atoi( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 80
INDIRI4
ASGNI4
line 238
;238:    if( i >= 0 && i < level.maxclients )
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $168
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
GEI4 $168
line 239
;239:    {
line 240
;240:      p = &level.clients[ i ];
ADDRLP4 36
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 241
;241:      if( p->pers.connected != CON_DISCONNECTED )
ADDRLP4 36
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $171
line 242
;242:      {
line 243
;243:        *plist = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 244
;244:        return 1;
CNSTI4 1
RETI4
ADDRGP4 $155
JUMPV
LABELV $171
line 246
;245:      }
;246:    }
LABELV $168
line 248
;247:    // we must assume that if only a number is provided, it is a clientNum
;248:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $155
JUMPV
LABELV $166
line 252
;249:  }
;250:
;251:  // now look for name matches
;252:  G_SanitiseString( s, s2, sizeof( s2 ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 253
;253:  if( strlen( s2 ) < 1 )
ADDRLP4 44
ARGP4
ADDRLP4 80
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 1
GEI4 $173
line 254
;254:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $155
JUMPV
LABELV $173
line 255
;255:  for( i = 0; i < level.maxclients && found < max; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $175
line 256
;256:  {
line 257
;257:    p = &level.clients[ i ];
ADDRLP4 36
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 258
;258:    if( p->pers.connected == CON_DISCONNECTED )
ADDRLP4 36
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $180
line 259
;259:    {
line 260
;260:      continue;
ADDRGP4 $176
JUMPV
LABELV $180
line 262
;261:    }
;262:    G_SanitiseString( p->pers.netname, n2, sizeof( n2 ) );
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 263
;263:    if( strstr( n2, s2 ) )
ADDRLP4 4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 84
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $182
line 264
;264:    {
line 265
;265:      *plist++ = i;
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 266
;266:      found++;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 267
;267:    }
LABELV $182
line 268
;268:  }
LABELV $176
line 255
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $178
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
GEI4 $184
ADDRLP4 40
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $175
LABELV $184
line 269
;269:  return found;
ADDRLP4 40
INDIRI4
RETI4
LABELV $155
endproc G_ClientNumbersFromString 92 12
export G_FloodLimited
proc G_FloodLimited 32 12
line 283
;270:}
;271:
;272:
;273:/*
;274:==================
;275:G_FloodLimited
;276:
;277:Determine whether a user is flood limited, and adjust their flood demerits
;278:Print them a warning message if they are over the limit
;279:Return is time in msec until the user can speak again
;280:==================
;281:*/
;282:int G_FloodLimited( gentity_t *ent )
;283:{
line 286
;284:  int deltatime, ms;
;285:
;286:  if( g_floodMinTime.integer <= 0 )
ADDRGP4 g_floodMinTime+12
INDIRI4
CNSTI4 0
GTI4 $186
line 287
;287:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $185
JUMPV
LABELV $186
line 290
;288:
;289:  // handles !ent
;290:  if( G_admin_permission( ent, ADMF_NOCENSORFLOOD ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 8
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $189
line 291
;291:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $185
JUMPV
LABELV $189
line 293
;292:
;293:  deltatime = level.time - ent->client->pers.floodTime;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1016
ADDP4
INDIRI4
SUBI4
ASGNI4
line 295
;294:
;295:  ent->client->pers.floodDemerits += g_floodMinTime.integer - deltatime;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRGP4 g_floodMinTime+12
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 296
;296:  if( ent->client->pers.floodDemerits < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 0
GEI4 $193
line 297
;297:    ent->client->pers.floodDemerits = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 0
ASGNI4
LABELV $193
line 298
;298:  ent->client->pers.floodTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1016
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 300
;299:
;300:  ms = ent->client->pers.floodDemerits - g_floodMaxDemerits.integer;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRGP4 g_floodMaxDemerits+12
INDIRI4
SUBI4
ASGNI4
line 301
;301:  if( ms <= 0 )
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $197
line 302
;302:    return 0;
CNSTI4 0
RETI4
ADDRGP4 $185
JUMPV
LABELV $197
line 303
;303:  trap_SendServerCommand( ent - g_entities, va( "print \"You are flooding: please wait %d second%s before trying again\n",
ADDRGP4 $199
ARGP4
ADDRLP4 24
CNSTI4 1000
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 999
ADDI4
ADDRLP4 24
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $203
ADDRLP4 16
ADDRGP4 $200
ASGNP4
ADDRGP4 $204
JUMPV
LABELV $203
ADDRLP4 16
ADDRGP4 $201
ASGNP4
LABELV $204
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 28
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
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 305
;304:                          ( ms + 999 ) / 1000, ( ms > 1000 ) ? "s" : "" ) );
;305:  return ms;
ADDRLP4 0
INDIRI4
RETI4
LABELV $185
endproc G_FloodLimited 32 12
export G_AdminMessage
proc G_AdminMessage 2068 20
line 450
;306:}
;307:
;308://KK-Private Messaging Not implemented. 
;309:/*
;310:void Cmd_PrivateMessage_f( gentity_t *ent )
;311:{
;312:  int pids[ MAX_CLIENTS ];
;313:  int ignoreids[ MAX_CLIENTS ];
;314:  char name[ MAX_NAME_LENGTH ];
;315:  char cmd[ 12 ];
;316:  char str[ MAX_STRING_CHARS ];
;317:  char *msg;
;318:  char color;
;319:  int pcount, matches, ignored = 0;
;320:  int i;
;321:  int skipargs = 0;
;322:  qboolean teamonly = qfalse;
;323:  gentity_t *tmpent;
;324:
;325:  if( !g_privateMessages.integer && ent )
;326:  {
;327:    ADMP( "Sorry, but private messages have been disabled\n" );
;328:    return;
;329:  }
;330:
;331:  G_SayArgv( 0, cmd, sizeof( cmd ) );
;332:  if( !Q_stricmp( cmd, "say" ) || !Q_stricmp( cmd, "say_team" ) )
;333:  {
;334:    skipargs = 1;
;335:    G_SayArgv( 1, cmd, sizeof( cmd ) );
;336:  }
;337:  if( G_SayArgc( ) < 3+skipargs )
;338:  {
;339:    ADMP( va( "usage: %s [name|slot#] [message]\n", cmd ) );
;340:    return;
;341:  }
;342:
;343:  if( !Q_stricmp( cmd, "mt" ) || !Q_stricmp( cmd, "/mt" ) )
;344:    teamonly = qtrue;
;345:
;346:  G_SayArgv( 1+skipargs, name, sizeof( name ) );
;347:  msg = G_SayConcatArgs( 2+skipargs );
;348:  pcount = G_ClientNumbersFromString( name, pids, MAX_CLIENTS );
;349:
;350:  if( ent )
;351:  {
;352:    int count = 0;
;353:
;354:    for( i = 0; i < pcount; i++ )
;355:    {
;356:      tmpent = &g_entities[ pids[ i ] ];
;357:
;358:      if( teamonly && !OnSameTeam( ent, tmpent ) )
;359:        continue;
;360:
;361:      if( BG_ClientListTest( &tmpent->client->pers.ignoreList,
;362:        ent-g_entities ) )
;363:      {
;364:        ignoreids[ ignored++ ] = pids[ i ];
;365:        continue;
;366:      }
;367:
;368:      pids[ count ] = pids[ i ];
;369:      count++;
;370:    }
;371:    matches = count;
;372:  }
;373:  else
;374:  {
;375:    matches = pcount;
;376:  }
;377:
;378:  color = teamonly ? COLOR_CYAN : COLOR_YELLOW;
;379:
;380:  Com_sprintf( str, sizeof( str ), "^%csent to %i player%s: ^7", color, matches,
;381:    ( matches == 1 ) ? "" : "s" );
;382:
;383:  for( i=0; i < matches; i++ )
;384:  {
;385:    tmpent = &g_entities[ pids[ i ] ];
;386:
;387:    if( i > 0 )
;388:      Q_strcat( str, sizeof( str ), "^7, " );
;389:    Q_strcat( str, sizeof( str ), tmpent->client->pers.netname );
;390:    trap_SendServerCommand( pids[ i ], va(
;391:      "chat \"%s^%c -> ^7%s^7: (%d recipient%s): ^%c%s^7\" %i",
;392:      ( ent ) ? ent->client->pers.netname : "console",
;393:      color,
;394:      name,
;395:      matches,
;396:      ( matches == 1 ) ? "" : "s",
;397:      color,
;398:      msg,
;399:      ent ? ent-g_entities : -1 ) );
;400:    if( ent )
;401:    {
;402:      trap_SendServerCommand( pids[ i ], va(
;403:        "print \">> to reply, say: /m %d [your message] <<\n\"",
;404:        ( ent - g_entities ) ) );
;405:    }
;406:    trap_SendServerCommand( pids[ i ], va(
;407:      "cp \"^%cprivate message from ^7%s^7\"", color,
;408:      ( ent ) ? ent->client->pers.netname : "console" ) );
;409:  }
;410:
;411:  if( !matches )
;412:    ADMP( va( "^3No player matching ^7\'%s^7\' ^3to send message to.\n",
;413:      name ) );
;414:  else
;415:  {
;416:    ADMP( va( "^%cPrivate message: ^7%s\n", color, msg ) );
;417:    ADMP( va( "%s\n", str ) );
;418:
;419:    G_LogPrintf( "%s: %s^7: %s^7: %s\n",
;420:      ( teamonly ) ? "tprivmsg" : "privmsg",
;421:      ( ent ) ? ent->client->pers.netname : "console",
;422:      name, msg );
;423:  }
;424:
;425:  if( ignored )
;426:  {
;427:    Com_sprintf( str, sizeof( str ), "^%cignored by %i player%s: ^7", color,
;428:      ignored, ( ignored == 1 ) ? "" : "s" );
;429:    for( i=0; i < ignored; i++ )
;430:    {
;431:      tmpent = &g_entities[ ignoreids[ i ] ];
;432:      if( i > 0 )
;433:        Q_strcat( str, sizeof( str ), "^7, " );
;434:      Q_strcat( str, sizeof( str ), tmpent->client->pers.netname );
;435:    }
;436:    ADMP( va( "%s\n", str ) );
;437:  }
;438:}
;439:*/
;440:
;441:/*
;442:=================
;443:G_AdminMessage
;444:
;445:Print to all active server admins, and to the logfile, and to the server console
;446:Prepend *prefix, or '[SERVER]' if no *prefix is given
;447:=================
;448:*/
;449:void QDECL G_AdminMessage( const char *prefix, const char *fmt, ... )
;450:{
line 457
;451:  va_list argptr;
;452:  char    string[ 1024 ];
;453:  char    outstring[ 1024 ];
;454:  int     i;
;455:
;456:  // Format the text
;457:  va_start( argptr, fmt );
ADDRLP4 1028
ADDRFP4 4+4
ASGNP4
line 458
;458:  Q_vsnprintf( string, sizeof( string ), fmt, argptr );
ADDRLP4 1032
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Q_vsnprintf
CALLI4
pop
line 459
;459:  va_end( argptr );
ADDRLP4 1028
CNSTP4 0
ASGNP4
line 463
;460:
;461:  // If there is no prefix, assume that this function was called directly
;462:  // and we should add one
;463:  if( !prefix || !prefix[ 0 ] )
ADDRLP4 2056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2056
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $209
ADDRLP4 2056
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $207
LABELV $209
line 464
;464:  {
line 465
;465:    prefix = "[SERVER]:";
ADDRFP4 0
ADDRGP4 $210
ASGNP4
line 466
;466:  }
LABELV $207
line 469
;467:
;468:  // Create the final string
;469:  Com_sprintf( outstring, sizeof( outstring ), "%s " S_COLOR_MAGENTA "%s",
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 473
;470:               prefix, string );
;471:
;472:  // Send to all appropriate clients
;473:  for( i = 0; i < level.maxclients; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $215
JUMPV
LABELV $212
line 474
;474:    if( G_admin_permission( &g_entities[ i ], ADMF_ADMINCHAT ) ) 
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 63
ARGI4
ADDRLP4 2060
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $217
line 475
;475:       trap_SendServerCommand( i, va( "chat \"%s\"", outstring ) ); 
ADDRGP4 $219
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $217
LABELV $213
line 473
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $215
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $212
line 478
;476:  
;477:  // Send to the logfile and server console
;478:  G_LogPrintf("adminmsg: %s\n", outstring );
ADDRGP4 $220
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 479
;479:}
LABELV $205
endproc G_AdminMessage 2068 20
export Cmd_AdminMessage_f
proc Cmd_AdminMessage_f 92 16
line 489
;480:
;481:/*
;482:=================
;483:Cmd_AdminMessage_f
;484:
;485:Send a message to all active admins
;486:=================
;487:*/
;488:void Cmd_AdminMessage_f( gentity_t *ent )
;489:{
line 493
;490:  char cmd[ sizeof( "say_team" ) ];
;491:  char prefix[ 50 ];
;492:  char *msg;
;493:  int skiparg = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 496
;494:
;495:  // Check permissions and add the appropriate user [prefix]
;496:  if( !ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $223
line 497
;497:  {
line 498
;498:    Com_sprintf( prefix, sizeof( prefix ), "[CONSOLE]:" );
ADDRLP4 16
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $225
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 499
;499:  }
ADDRGP4 $224
JUMPV
LABELV $223
line 500
;500:  else if( !G_admin_permission( ent, ADMF_ADMINCHAT ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 63
ARGI4
ADDRLP4 72
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $226
line 501
;501:  {
line 502
;502:    if( !g_publicAdminMessages.integer )
ADDRGP4 g_publicAdminMessages+12
INDIRI4
CNSTI4 0
NEI4 $228
line 503
;503:    {
line 504
;504:      ADMP( "Sorry, but use of /a by non-admins has been disabled.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $231
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 505
;505:      return;
ADDRGP4 $221
JUMPV
LABELV $228
line 508
;506:    }
;507:    else
;508:    {
line 509
;509:      Com_sprintf( prefix, sizeof( prefix ), "[PLAYER] %s" S_COLOR_WHITE ":",
ADDRLP4 16
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $232
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 511
;510:                   ent->client->pers.netname );
;511:      ADMP( "Your message has been sent to any available admins and to the server logs.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 512
;512:    }
line 513
;513:  }
ADDRGP4 $227
JUMPV
LABELV $226
line 515
;514:  else
;515:  {
line 516
;516:    Com_sprintf( prefix, sizeof( prefix ), "[ADMIN] %s" S_COLOR_WHITE ":",
ADDRLP4 16
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $234
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 518
;517:                 ent->client->pers.netname );
;518:  }
LABELV $227
LABELV $224
line 521
;519:
;520:  // Skip say/say_team if this was used from one of those
;521:  G_SayArgv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 522
;522:  if( !Q_stricmp( cmd, "say" ) || !Q_stricmp( cmd, "say_team" ) )
ADDRLP4 0
ARGP4
ADDRGP4 $237
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $238
ADDRLP4 0
ARGP4
ADDRGP4 $222
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $235
LABELV $238
line 523
;523:  {
line 524
;524:    skiparg = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 525
;525:    G_SayArgv( 1, cmd, sizeof( cmd ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 526
;526:  }
LABELV $235
line 527
;527:  if( G_SayArgc( ) < 2 + skiparg )
ADDRLP4 84
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
ADDI4
GEI4 $239
line 528
;528:  {
line 529
;529:    ADMP( va( "usage: %s [message]\n", cmd ) );
ADDRGP4 $241
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 530
;530:    return;
ADDRGP4 $221
JUMPV
LABELV $239
line 533
;531:  }
;532:
;533:  msg = G_SayConcatArgs( 1 + skiparg );
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 88
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 88
INDIRP4
ASGNP4
line 536
;534:
;535:  // Send it
;536:  G_AdminMessage( prefix, "%s", msg );
ADDRLP4 16
ARGP4
ADDRGP4 $242
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 G_AdminMessage
CALLV
pop
line 537
;537:}
LABELV $221
endproc Cmd_AdminMessage_f 92 16
export G_ClientNumberFromString
proc G_ClientNumberFromString 84 12
line 624
;538:
;539:
;540:/*
;541:==============
;542:Cmd_Ignore_f
;543:KK-OAX Removed Static to Keep in Mod Files
;544:Currently Unused until I figure out how to implement it with voice chats. 
;545:==============
;546:*/
;547:/*void Cmd_Ignore_f( gentity_t *ent )
;548:{
;549:  int pids[ MAX_CLIENTS ];
;550:  char name[ MAX_NAME_LENGTH ];
;551:  char cmd[ 9 ];
;552:  int matches = 0;
;553:  int i;
;554:  qboolean ignore = qfalse;
;555:
;556:  trap_Argv( 0, cmd, sizeof( cmd ) );
;557:  if( Q_stricmp( cmd, "ignore" ) == 0 )
;558:    ignore = qtrue;
;559:
;560:  if( trap_Argc() < 2 )
;561:  {
;562:    trap_SendServerCommand( ent-g_entities, va( "print \"[skipnotify]"
;563:      "usage: %s [clientNum | partial name match]\n\"", cmd ) );
;564:    return;
;565:  }
;566:
;567:  Q_strncpyz( name, ConcatArgs( 1 ), sizeof( name ) );
;568:  matches = G_ClientNumbersFromString( name, pids, MAX_CLIENTS );
;569:  if( matches < 1 )
;570:  {
;571:    trap_SendServerCommand( ent-g_entities, va( "print \"[skipnotify]"
;572:      "%s: no clients match the name '%s'\n\"", cmd, name ) );
;573:    return;
;574:  }
;575:
;576:  for( i = 0; i < matches; i++ )
;577:  {
;578:    if( ignore )
;579:    {
;580:      if( !BG_ClientListTest( &ent->client->pers.ignoreList, pids[ i ] ) )
;581:      {
;582:        BG_ClientListAdd( &ent->client->pers.ignoreList, pids[ i ] );
;583:        ClientUserinfoChanged( ent->client->ps.clientNum );
;584:        trap_SendServerCommand( ent-g_entities, va( "print \"[skipnotify]"
;585:          "ignore: added %s^7 to your ignore list\n\"",
;586:          level.clients[ pids[ i ] ].pers.netname ) );
;587:      }
;588:      else
;589:      {
;590:        trap_SendServerCommand( ent-g_entities, va( "print \"[skipnotify]"
;591:          "ignore: %s^7 is already on your ignore list\n\"",
;592:          level.clients[ pids[ i ] ].pers.netname ) );
;593:      }
;594:    }
;595:    else
;596:    {
;597:      if( BG_ClientListTest( &ent->client->pers.ignoreList, pids[ i ] ) )
;598:      {
;599:        BG_ClientListRemove( &ent->client->pers.ignoreList, pids[ i ] );
;600:        ClientUserinfoChanged( ent->client->ps.clientNum );
;601:        trap_SendServerCommand( ent-g_entities, va( "print \"[skipnotify]"
;602:          "unignore: removed %s^7 from your ignore list\n\"",
;603:          level.clients[ pids[ i ] ].pers.netname ) );
;604:      }
;605:      else
;606:      {
;607:        trap_SendServerCommand( ent-g_entities, va( "print \"[skipnotify]"
;608:          "unignore: %s^7 is not on your ignore list\n\"",
;609:          level.clients[ pids[ i ] ].pers.netname ) );
;610:      }
;611:    }
;612:  }
;613:}
;614:*/
;615:/*
;616:==================
;617:G_ClientNumberFromString
;618:
;619:Returns a player number for either a number or name string
;620:Returns -1 if invalid
;621:==================
;622:*/
;623:int G_ClientNumberFromString( char *s )
;624:{
line 631
;625:  gclient_t *cl;
;626:  int       i;
;627:  char      s2[ MAX_NAME_LENGTH ];
;628:  char      n2[ MAX_NAME_LENGTH ];
;629:
;630:  // numeric values are just slot numbers
;631:  for( i = 0; s[ i ] && isdigit( s[ i ] ); i++ );
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $244
LABELV $245
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $247
ADDRLP4 72
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $249
ADDRLP4 72
INDIRI4
CNSTI4 48
LTI4 $249
ADDRLP4 72
INDIRI4
CNSTI4 57
LEI4 $244
LABELV $249
line 632
;632:  if( !s[ i ] )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $250
line 633
;633:  {
line 634
;634:    i = atoi( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 76
INDIRI4
ASGNI4
line 636
;635:
;636:    if( i < 0 || i >= level.maxclients )
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $255
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $252
LABELV $255
line 637
;637:      return -1;
CNSTI4 -1
RETI4
ADDRGP4 $243
JUMPV
LABELV $252
line 639
;638:
;639:    cl = &level.clients[ i ];
ADDRLP4 4
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 641
;640:
;641:    if( cl->pers.connected == CON_DISCONNECTED )
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $256
line 642
;642:      return -1;
CNSTI4 -1
RETI4
ADDRGP4 $243
JUMPV
LABELV $256
line 644
;643:
;644:    return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $243
JUMPV
LABELV $250
line 648
;645:  }
;646:
;647:  // check for a name match
;648:  G_SanitiseString( s, s2, sizeof( s2 ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 650
;649:
;650:  for( i = 0, cl = level.clients; i < level.maxclients; i++, cl++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $261
JUMPV
LABELV $258
line 651
;651:  {
line 652
;652:    if( cl->pers.connected == CON_DISCONNECTED )
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $263
line 653
;653:      continue;
ADDRGP4 $259
JUMPV
LABELV $263
line 655
;654:
;655:    G_SanitiseString( cl->pers.netname, n2, sizeof( n2 ) );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 657
;656:
;657:    if( !strcmp( n2, s2 ) )
ADDRLP4 8
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 76
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $265
line 658
;658:      return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $243
JUMPV
LABELV $265
line 659
;659:  }
LABELV $259
line 650
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2324
ADDP4
ASGNP4
LABELV $261
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $258
line 661
;660:
;661:  return -1;
CNSTI4 -1
RETI4
LABELV $243
endproc G_ClientNumberFromString 84 12
export G_ClientIsLagging
proc G_ClientIsLagging 0 0
line 671
;662:}
;663:
;664://KK-OAX Used to !spec999'ers
;665:/*
;666:=============
;667:G_ClientIsLagging
;668:=============
;669:*/
;670:qboolean G_ClientIsLagging( gclient_t *client )
;671:{
line 672
;672:  if( client )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $268
line 673
;673:  {
line 674
;674:    if( client->ps.ping >= 999 )
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 999
LTI4 $270
line 675
;675:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $267
JUMPV
LABELV $270
line 677
;676:    else
;677:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $267
JUMPV
LABELV $268
line 680
;678:  }
;679:
;680:  return qfalse; //is a non-existant client lagging? woooo zen
CNSTI4 0
RETI4
LABELV $267
endproc G_ClientIsLagging 0 0
export SanitizeString
proc SanitizeString 16 4
line 690
;681:}
;682:
;683:/*
;684:==================
;685:SanitizeString
;686:
;687:Remove case and control characters
;688:==================
;689:*/
;690:void SanitizeString( char *in, char *out ) {
ADDRGP4 $274
JUMPV
LABELV $273
line 691
;691:	while ( *in ) {
line 692
;692:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $276
line 693
;693:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 694
;694:			continue;
ADDRGP4 $274
JUMPV
LABELV $276
line 696
;695:		}
;696:		if ( *in < 32 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $278
line 697
;697:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 698
;698:			continue;
ADDRGP4 $274
JUMPV
LABELV $278
line 700
;699:		}
;700:		*out++ = tolower( *in++ );
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
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
CVII1 4
ASGNI1
line 701
;701:	}
LABELV $274
line 691
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $273
line 703
;702:
;703:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 704
;704:}
LABELV $272
endproc SanitizeString 16 4
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
import G_GetMapLockArena
import SkippedChar
import G_LoadMapcycle
import G_sendMapcycle
import G_drawMapcycle
import G_drawAllowedMaps
import G_mapIsVoteable
import G_GetMapfile
import G_GetNextMap
import G_GetNextMapCycle
import G_GotoNextMapCycle
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
LABELV $242
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $241
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 91
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $237
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $234
byte 1 91
byte 1 65
byte 1 68
byte 1 77
byte 1 73
byte 1 78
byte 1 93
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 0
align 1
LABELV $233
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $232
byte 1 91
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 93
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 0
align 1
LABELV $231
byte 1 83
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 47
byte 1 97
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $225
byte 1 91
byte 1 67
byte 1 79
byte 1 78
byte 1 83
byte 1 79
byte 1 76
byte 1 69
byte 1 93
byte 1 58
byte 1 0
align 1
LABELV $222
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $220
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 109
byte 1 115
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $219
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $211
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 54
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $210
byte 1 91
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 93
byte 1 58
byte 1 0
align 1
LABELV $201
byte 1 0
align 1
LABELV $200
byte 1 115
byte 1 0
align 1
LABELV $199
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 112
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $139
byte 1 37
byte 1 50
byte 1 105
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $132
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 46
byte 1 32
byte 1 66
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 35
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $129
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 35
byte 1 0
