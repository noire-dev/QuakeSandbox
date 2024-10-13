export G_ClassnameAllowed
code
proc G_ClassnameAllowed 52 8
file "../../../code/game/g_mapfiles.c"
line 49
;1:/*
;2:===========================================================================
;3:Copyright (C) 2010-2011 Manuel Wiese
;4:
;5:This file is part of AfterShock source code.
;6:
;7:AfterShock source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:AfterShock source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with AfterShock source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22:
;23:#include "g_local.h"
;24:
;25:#define MAX_MAPFILE_LENGTH 2500000*6
;26:
;27:#define MAX_TOKENNUM 524288*6
;28:
;29:static char 		mapbuffer[ 2500000*6 ];
;30:
;31:typedef enum {
;32:	TOT_LPAREN,
;33:	TOT_RPAREN,
;34:	TOT_WORD,
;35:	TOT_NUMBER,
;36:	TOT_NIL,
;37:	TOT_MAX
;38:} tokenType_t;
;39:
;40:#define TOKENVALUE_SIZE 128
;41:
;42:typedef struct {
;43:	char value[TOKENVALUE_SIZE];
;44:	int type;
;45:} token_t;
;46:
;47:token_t tokens2[MAX_TOKENNUM];
;48:
;49:qboolean G_ClassnameAllowed( char *input ){
line 50
;50:		if ( !strcmp(input, "info_player_deathmatch" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $69
ARGP4
ADDRLP4 0
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $67
line 51
;51:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $67
line 53
;52:		}
;53:		if ( !strcmp(input, "domination_point" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 4
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $70
line 54
;54:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $70
line 56
;55:		}
;56:		if ( !strcmp(input, "team_CTF_redspawn" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $75
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $73
line 57
;57:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $73
line 59
;58:		}
;59:		if ( !strcmp(input, "team_CTF_bluespawn" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $78
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $76
line 60
;60:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $76
line 62
;61:		}
;62:		if ( !strcmp(input, "team_redobelisk" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $79
line 63
;63:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $79
line 65
;64:		}
;65:		if ( !strcmp(input, "team_blueobelisk" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $84
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $82
line 66
;66:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $82
line 68
;67:		}
;68:		if ( !strcmp(input, "team_neutralobelisk" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRLP4 24
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $85
line 69
;69:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $85
line 71
;70:		}
;71:		if ( !strcmp(input, "func_prop" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $90
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $88
line 72
;72:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $88
line 74
;73:		}
;74:		if ( !strcmp(input, "target_botspawn" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $93
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $91
line 75
;75:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $91
line 77
;76:		}
;77:		if ( !strcmp(input, "team_CTF_neutralflag" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $96
ARGP4
ADDRLP4 36
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $94
line 78
;78:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $94
line 80
;79:		}
;80:		if ( !strcmp(input, "team_CTF_blueflag" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $99
ARGP4
ADDRLP4 40
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $97
line 81
;81:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $97
line 83
;82:		}
;83:		if ( !strcmp(input, "team_CTF_redflag" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $102
ARGP4
ADDRLP4 44
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $100
line 84
;84:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $100
line 87
;85:		}
;86:		
;87:		if ( BG_CheckClassname(input) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BG_CheckClassname
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $103
line 88
;88:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $103
line 91
;89:		}
;90:
;91:	return qfalse;
CNSTI4 0
RETI4
LABELV $66
endproc G_ClassnameAllowed 52 8
export G_ClassnameAllowedAll
proc G_ClassnameAllowedAll 0 0
line 94
;92:}
;93:
;94:qboolean G_ClassnameAllowedAll( char *input ){
line 97
;95:
;96:
;97:	return qtrue;
CNSTI4 1
RETI4
LABELV $105
endproc G_ClassnameAllowedAll 0 0
export G_ClearEntities
proc G_ClearEntities 8 4
line 100
;98:}
;99:
;100:void G_ClearEntities( void ){
line 102
;101:	int i;
;102:	for( i = 0; i < MAX_GENTITIES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $107
line 105
;103:		/*if( !g_entities[i].inuse )
;104:			continue;*/
;105:		if( !G_ClassnameAllowed(g_entities[i].classname) )
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+564
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_ClassnameAllowed
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $111
line 106
;106:			continue;
ADDRGP4 $108
JUMPV
LABELV $111
line 107
;107:		g_entities[i].nextthink = 0;
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+760
ADDP4
CNSTI4 0
ASGNI4
line 108
;108:		G_FreeEntity(&g_entities[i]);
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 110
;109:		
;110:	}
LABELV $108
line 102
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4096
LTI4 $107
line 111
;111:}
LABELV $106
endproc G_ClearEntities 8 4
export G_ClearEntitiesAll
proc G_ClearEntitiesAll 8 4
line 113
;112:
;113:void G_ClearEntitiesAll( void ){
line 115
;114:	int i;
;115:	for( i = 0; i < MAX_GENTITIES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $116
line 118
;116:		/*if( !g_entities[i].inuse )
;117:			continue;*/
;118:		if( !G_ClassnameAllowedAll(g_entities[i].classname) )
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+564
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_ClassnameAllowedAll
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $120
line 119
;119:			continue;
ADDRGP4 $117
JUMPV
LABELV $120
line 120
;120:		g_entities[i].nextthink = 0;
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+760
ADDP4
CNSTI4 0
ASGNI4
line 121
;121:		G_FreeEntity(&g_entities[i]);
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 123
;122:		
;123:	}
LABELV $117
line 115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4096
LTI4 $116
line 124
;124:}
LABELV $115
endproc G_ClearEntitiesAll 8 4
export G_AddEntity
proc G_AddEntity 20 4
line 126
;125:
;126:void G_AddEntity( char* classname, vec3_t origin, int spawnflags, float wait, float random ){
line 128
;127:	gentity_t *ent;
;128:	ent = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 129
;129:	ent->classname = classname;
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 130
;130:	ent->spawnflags = spawnflags;
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 131
;131:	ent->random = random;
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
ADDRFP4 16
INDIRF4
ASGNF4
line 132
;132:	ent->wait = wait;
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
ADDRFP4 12
INDIRF4
ASGNF4
line 134
;133:	
;134:	VectorCopy( origin, ent->s.origin );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 135
;135:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 136
;136:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 139
;137:	
;138:	// if we didn't get a classname, don't bother spawning anything
;139:	if ( !G_CallSpawn( ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_CallSpawn
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $125
line 140
;140:		G_FreeEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 141
;141:	}
LABELV $125
line 142
;142:}
LABELV $124
endproc G_AddEntity 20 4
proc G_setTokens2 8 0
line 144
;143:
;144:static int G_setTokens2( char* in, char* out, int start ){
line 145
;145:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $129
JUMPV
LABELV $128
line 146
;146:	while ( in[ start + i ] != ' ' ){
line 147
;147:		if( in[ start + i ] == '\0' ){
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
NEI4 $131
line 148
;148:			out[i] = in[start+1];
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
line 149
;149:			return MAX_MAPFILE_LENGTH;
CNSTI4 15000000
RETI4
ADDRGP4 $127
JUMPV
LABELV $131
line 151
;150:		}
;151:		out[i] = in[start+i];
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
line 152
;152:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 153
;153:	}
LABELV $129
line 146
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
NEI4 $128
line 154
;154:	out[i] = '\0';
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 155
;155:	return start+i+1;
ADDRFP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
RETI4
LABELV $127
endproc G_setTokens2 8 0
proc G_setTokenType2 36 0
line 158
;156:}
;157:
;158:static int G_setTokenType2( char* value ){
line 159
;159:	int count = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 160
;160:	qboolean lpar= qfalse,rpar= qfalse,number= qfalse, character = qfalse;
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
ADDRGP4 $135
JUMPV
LABELV $134
line 162
;161:	
;162:	while( value[count] != '\0' ){
line 163
;163:		if( value[count] == '{' )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $137
line 164
;164:			lpar = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $137
line 165
;165:		else if( value[count] == '}' )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $139
line 166
;166:			rpar = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $139
line 167
;167:		else if( value[count] >= '0' && value[count] <= '9' )
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
LTI4 $141
ADDRLP4 20
INDIRI4
CNSTI4 57
GTI4 $141
line 168
;168:			number = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $142
JUMPV
LABELV $141
line 169
;169:		else if( ( value[count] >= 'a' && value[count] <= 'z' ) || ( value[count] >= 'A' && value[count] <= 'Z' ) )
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
LTI4 $146
ADDRLP4 24
INDIRI4
CNSTI4 122
LEI4 $145
LABELV $146
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
LTI4 $143
ADDRLP4 28
INDIRI4
CNSTI4 90
GTI4 $143
LABELV $145
line 170
;170:			character = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
LABELV $143
LABELV $142
LABELV $140
LABELV $138
line 171
;171:		count++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 172
;172:	}
LABELV $135
line 162
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $134
line 174
;173:	
;174:	if( lpar && !( rpar || number || character ) )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $147
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $147
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $147
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $147
line 175
;175:		return TOT_LPAREN;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $147
line 176
;176:	else if( rpar && !( lpar || number || character ) )
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $149
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $149
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $149
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $149
line 177
;177:		return TOT_RPAREN;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $149
line 178
;178:	else if( number && !( lpar || rpar || character ) )
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $151
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $151
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $151
ADDRLP4 16
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $151
line 179
;179:		return TOT_NUMBER;
CNSTI4 3
RETI4
ADDRGP4 $133
JUMPV
LABELV $151
line 180
;180:	else if( character && !( lpar || rpar ) )
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $153
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $153
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $153
line 181
;181:		return TOT_WORD;
CNSTI4 2
RETI4
ADDRGP4 $133
JUMPV
LABELV $153
line 183
;182:	else
;183:		return TOT_NIL;
CNSTI4 4
RETI4
LABELV $133
endproc G_setTokenType2 36 0
proc G_FindNextToken2 12 8
line 186
;184:}
;185:
;186:static int G_FindNextToken2( char *find, token_t *in, int start ){
line 190
;187:	int i;
;188:	int cmp;
;189:	
;190:	for( i = start; i < MAX_TOKENNUM; i++ ){
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRGP4 $159
JUMPV
LABELV $156
line 191
;191:		cmp= strcmp( in[i].value, find );
CNSTI4 132
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
line 192
;192:		if( cmp == 0 )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $160
line 193
;193:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $155
JUMPV
LABELV $160
line 194
;194:	}
LABELV $157
line 190
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $159
ADDRLP4 0
INDIRI4
CNSTI4 3145728
LTI4 $156
line 195
;195:	return -1;
CNSTI4 -1
RETI4
LABELV $155
endproc G_FindNextToken2 12 8
proc G_AbeforeB2 24 12
line 198
;196:}
;197:
;198:static qboolean G_AbeforeB2( char *A, char *B, token_t *in, int start ){
line 199
;199:	int a = G_FindNextToken2( A, in, start );
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
ADDRGP4 G_FindNextToken2
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 200
;200:	int b = G_FindNextToken2( B, in, start );
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
ADDRGP4 G_FindNextToken2
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 202
;201:	
;202:	if( b == -1 && a != -1 )
ADDRLP4 16
CNSTI4 -1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $163
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $163
line 203
;203:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $162
JUMPV
LABELV $163
line 204
;204:	if( a == -1 && b != -1 )
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $165
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $165
line 205
;205:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $162
JUMPV
LABELV $165
line 206
;206:	if( a < b )
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $167
line 207
;207:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $162
JUMPV
LABELV $167
line 209
;208:	else
;209:		return qfalse;
CNSTI4 0
RETI4
LABELV $162
endproc G_AbeforeB2 24 12
data
export fieldsCopy
align 4
LABELV fieldsCopy
address $171
byte 4 564
byte 4 2
skip 4
address $172
byte 4 92
byte 4 4
skip 4
address $173
byte 4 580
byte 4 2
skip 4
address $174
byte 4 584
byte 4 2
skip 4
address $175
byte 4 568
byte 4 0
skip 4
address $176
byte 4 744
byte 4 1
skip 4
address $177
byte 4 720
byte 4 2
skip 4
address $178
byte 4 724
byte 4 2
skip 4
address $179
byte 4 680
byte 4 2
skip 4
address $180
byte 4 684
byte 4 2
skip 4
address $181
byte 4 728
byte 4 2
skip 4
address $182
byte 4 1012
byte 4 1
skip 4
address $183
byte 4 1016
byte 4 1
skip 4
address $184
byte 4 944
byte 4 0
skip 4
address $185
byte 4 948
byte 4 0
skip 4
address $186
byte 4 812
byte 4 0
skip 4
address $187
byte 4 808
byte 4 0
skip 4
address $188
byte 4 0
byte 4 9
skip 4
address $189
byte 4 924
byte 4 0
skip 4
address $190
byte 4 2248
byte 4 0
skip 4
address $191
byte 4 2252
byte 4 0
skip 4
address $192
byte 4 2256
byte 4 0
skip 4
address $193
byte 4 2260
byte 4 0
skip 4
address $194
byte 4 2264
byte 4 0
skip 4
address $195
byte 4 2268
byte 4 0
skip 4
address $196
byte 4 2272
byte 4 0
skip 4
address $197
byte 4 2276
byte 4 0
skip 4
address $198
byte 4 2280
byte 4 0
skip 4
address $199
byte 4 2284
byte 4 0
skip 4
address $200
byte 4 2288
byte 4 0
skip 4
address $201
byte 4 128
byte 4 4
skip 4
address $202
byte 4 128
byte 4 5
skip 4
address $203
byte 4 732
byte 4 2
skip 4
address $204
byte 4 736
byte 4 2
skip 4
address $205
byte 4 1068
byte 4 2
skip 4
address $206
byte 4 1064
byte 4 2
skip 4
address $207
byte 4 1072
byte 4 2
skip 4
address $208
byte 4 2172
byte 4 2
skip 4
address $209
byte 4 2176
byte 4 2
skip 4
address $210
byte 4 2180
byte 4 1
skip 4
address $211
byte 4 2184
byte 4 2
skip 4
address $212
byte 4 2100
byte 4 2
skip 4
address $213
byte 4 2104
byte 4 2
skip 4
address $214
byte 4 2108
byte 4 2
skip 4
address $215
byte 4 2188
byte 4 2
skip 4
address $216
byte 4 2192
byte 4 2
skip 4
address $217
byte 4 2196
byte 4 0
skip 4
address $218
byte 4 2212
byte 4 2
skip 4
address $219
byte 4 876
byte 4 2
skip 4
address $220
byte 4 872
byte 4 2
skip 4
address $221
byte 4 880
byte 4 2
skip 4
address $222
byte 4 844
byte 4 0
skip 4
address $223
byte 4 848
byte 4 1
skip 4
address $224
byte 4 852
byte 4 1
skip 4
address $225
byte 4 856
byte 4 1
skip 4
address $226
byte 4 860
byte 4 1
skip 4
address $227
byte 4 864
byte 4 1
skip 4
address $228
byte 4 868
byte 4 1
skip 4
address $229
byte 4 608
byte 4 1
skip 4
address $230
byte 4 1052
byte 4 0
skip 4
address $231
byte 4 884
byte 4 0
skip 4
address $232
byte 4 888
byte 4 0
skip 4
address $233
byte 4 892
byte 4 0
skip 4
address $234
byte 4 824
byte 4 0
skip 4
address $235
byte 4 900
byte 4 0
skip 4
address $236
byte 4 904
byte 4 0
skip 4
address $237
byte 4 908
byte 4 0
skip 4
address $238
byte 4 912
byte 4 0
skip 4
address $239
byte 4 896
byte 4 0
skip 4
address $240
byte 4 916
byte 4 0
skip 4
address $241
byte 4 920
byte 4 0
skip 4
address $242
byte 4 1056
byte 4 0
skip 4
address $243
byte 4 1044
byte 4 1
skip 4
address $244
byte 4 1048
byte 4 0
skip 4
byte 4 0
skip 12
export G_ClearString
code
proc G_ClearString 8 4
line 316
;210:}
;211:
;212://
;213:// fields are needed for spawning from the entity string
;214://
;215:typedef enum {
;216:	F_INT, 
;217:	F_FLOAT,
;218:	F_LSTRING,			// string on disk, pointer in memory, TAG_LEVEL
;219:	F_GSTRING,			// string on disk, pointer in memory, TAG_GAME
;220:	F_VECTOR,
;221:	F_ANGLEHACK,
;222:	F_ENTITY,			// index on disk, pointer in memory
;223:	F_ITEM,				// index on disk, pointer in memory
;224:	F_CLIENT,			// index on disk, pointer in memory
;225:	F_IGNORE
;226:} fieldtypeCopy_t;
;227:
;228:typedef struct
;229:{
;230:	char	*name;
;231:	int		ofs;
;232:	fieldtypeCopy_t	type;
;233:	int		flags;
;234:} fieldCopy_t;
;235:
;236:fieldCopy_t fieldsCopy[] = {
;237:	{"classname", FOFS(classname), F_LSTRING},
;238:	{"origin", FOFS(s.origin), F_VECTOR},
;239:	{"model", FOFS(model), F_LSTRING},
;240:	{"model2", FOFS(model2), F_LSTRING},
;241:	{"spawnflags", FOFS(spawnflags), F_INT},
;242:	{"speed", FOFS(speed), F_FLOAT},
;243:	{"target", FOFS(target), F_LSTRING},
;244:	{"targetname", FOFS(targetname), F_LSTRING},
;245:	{"message", FOFS(message), F_LSTRING},
;246:	{"messageru", FOFS(messageru), F_LSTRING},
;247:	{"team", FOFS(team), F_LSTRING},
;248:	{"wait", FOFS(wait), F_FLOAT},
;249:	{"random", FOFS(random), F_FLOAT},
;250:	{"count", FOFS(count), F_INT},
;251:	{"playerangle", FOFS(playerangle), F_INT},
;252:	{"price", FOFS(price), F_INT},
;253:	{"health", FOFS(health), F_INT},
;254:	{"light", 0, F_IGNORE},
;255:	{"dmg", FOFS(damage), F_INT},
;256:	{"mtype", FOFS(mtype), F_INT},
;257:	{"mtimeout", FOFS(mtimeout), F_INT},
;258:	{"mhoming", FOFS(mhoming), F_INT},
;259:	{"mspeed", FOFS(mspeed), F_INT},
;260:	{"mbounce", FOFS(mbounce), F_INT},
;261:	{"mdamage", FOFS(mdamage), F_INT},
;262:	{"msdamage", FOFS(msdamage), F_INT},
;263:	{"msradius", FOFS(msradius), F_INT},
;264:	{"mgravity", FOFS(mgravity), F_INT},
;265:	{"mnoclip", FOFS(mnoclip), F_INT},
;266:	{"allowuse", FOFS(allowuse), F_INT},
;267:	{"angles", FOFS(s.angles), F_VECTOR},
;268:	{"angle", FOFS(s.angles), F_ANGLEHACK},
;269:	{"targetShaderName", FOFS(targetShaderName), F_LSTRING},
;270:	{"targetShaderNewName", FOFS(targetShaderNewName), F_LSTRING},
;271:	{"mapname", FOFS(mapname), F_LSTRING},
;272:	{"clientname", FOFS(clientname), F_LSTRING},
;273:	{"teleporterTarget", FOFS(teleporterTarget), F_LSTRING},
;274:	{"deathTarget", FOFS(deathTarget), F_LSTRING},
;275:	{"lootTarget", FOFS(lootTarget), F_LSTRING},
;276:	{"skill", FOFS(skill), F_FLOAT},
;277:	{"overlay", FOFS(overlay), F_LSTRING},
;278:	{"target2", FOFS(target2), F_LSTRING},
;279:	{"damagetarget", FOFS(damagetarget), F_LSTRING},
;280:	{"targetname2", FOFS(targetname2), F_LSTRING},
;281:	{"key", FOFS(key), F_LSTRING},
;282:	{"value", FOFS(value), F_LSTRING},
;283:	{"armor", FOFS(armor), F_INT},
;284:	{"music", FOFS(music), F_LSTRING},
;285:	{"sb_model", FOFS(sb_model), F_LSTRING},
;286:	{"sb_class", FOFS(sb_class), F_LSTRING},
;287:	{"sb_sound", FOFS(sb_sound), F_LSTRING},
;288:	{"sb_coltype", FOFS(sb_coltype), F_INT},
;289:	{"sb_colscale0", FOFS(sb_colscale0), F_FLOAT},
;290:	{"sb_colscale1", FOFS(sb_colscale1), F_FLOAT},
;291:	{"sb_colscale2", FOFS(sb_colscale2), F_FLOAT},
;292:	{"sb_rotate0", FOFS(sb_rotate0), F_FLOAT},
;293:	{"sb_rotate1", FOFS(sb_rotate1), F_FLOAT},
;294:	{"sb_rotate2", FOFS(sb_rotate2), F_FLOAT},
;295:	{"physicsBounce", FOFS(physicsBounce), F_FLOAT},
;296:	{"vehicle", FOFS(vehicle), F_INT},
;297:	{"sb_generic1", FOFS(sb_generic1), F_INT},
;298:	{"sb_phys", FOFS(sb_phys), F_INT},
;299:	{"sb_coll", FOFS(sb_coll), F_INT},
;300:	{"locked", FOFS(locked), F_INT},
;301:	{"sb_red", FOFS(sb_red), F_INT},
;302:	{"sb_green", FOFS(sb_green), F_INT},
;303:	{"sb_blue", FOFS(sb_blue), F_INT},
;304:	{"sb_radius", FOFS(sb_radius), F_INT},
;305:	{"sb_ettype", FOFS(sb_ettype), F_INT},
;306:	{"sb_takedamage", FOFS(sb_takedamage), F_INT},
;307:	{"sb_takedamage2", FOFS(sb_takedamage2), F_INT},
;308:	{"objectType", FOFS(objectType), F_INT},
;309:
;310:	{"distance", FOFS(distance), F_FLOAT},
;311:	{"type", FOFS(type), F_INT},
;312:	
;313:	{NULL}
;314:};
;315:
;316:char *G_ClearString( char *input ){
line 317
;317:	if( input[0] == '"' ){
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 34
NEI4 $246
line 318
;318:		input[0] = '\0';
ADDRFP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 319
;319:		input++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 320
;320:	}
LABELV $246
line 321
;321:	if( input[strlen(input)-1] == '"' ){
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 34
NEI4 $248
line 322
;322:		input[strlen(input)-1] = '\0';
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 323
;323:	}
LABELV $248
line 324
;324:	return input;
ADDRFP4 0
INDIRP4
RETP4
LABELV $245
endproc G_ClearString 8 4
proc G_LoadMapfileEntity 112 20
line 327
;325:}
;326:
;327:static void G_LoadMapfileEntity( token_t *in, int min, int max ){
line 336
;328:	int i;
;329:	char *buf;
;330:	vec3_t	vec;
;331:	
;332:	fieldCopy_t *field;
;333:	byte	*b;
;334:	
;335:	gentity_t *ent;
;336:	ent = G_Spawn();
ADDRLP4 32
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
ASGNP4
line 338
;337:	
;338:	b = (byte *)ent;
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 340
;339:	
;340:	for( i = min; i <= max ; i++ ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $254
JUMPV
LABELV $251
line 341
;341:		for( field = fieldsCopy; field->name; field++ ){
ADDRLP4 0
ADDRGP4 fieldsCopy
ASGNP4
ADDRGP4 $258
JUMPV
LABELV $255
line 342
;342:			if( !strcmp(va("\"%s\"",field->name), in[i].value ) ) {
ADDRGP4 $261
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $259
line 343
;343:				switch( field->type ) {
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $257
ADDRLP4 44
INDIRI4
CNSTI4 9
GTI4 $257
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $281
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $281
address $273
address $274
address $265
address $257
address $266
address $275
address $257
address $257
address $257
address $257
code
LABELV $265
line 345
;344:				  case F_LSTRING:
;345:					*(char **)(b+field->ofs) = G_NewString(G_ClearString(in[i+1].value));
ADDRLP4 52
CNSTI4 132
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 52
INDIRI4
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 G_ClearString
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 G_NewString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 60
INDIRP4
ASGNP4
line 346
;346:					break;
ADDRGP4 $257
JUMPV
LABELV $266
line 348
;347:				  case F_VECTOR:
;348:					buf = in[i+1].value;
ADDRLP4 64
CNSTI4 132
ASGNI4
ADDRLP4 20
ADDRLP4 64
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 64
INDIRI4
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
line 349
;349:					strcat(buf, " ");
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $267
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 350
;350:					strcat(buf, in[i+2].value);
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 264
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 351
;351:					strcat(buf, " ");
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $267
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 352
;352:					strcat(buf, in[i+3].value);
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 396
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 353
;353:					sscanf (G_ClearString(buf), "%f %f %f", &vec[0], &vec[1], &vec[2]);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 G_ClearString
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+4
ARGP4
ADDRLP4 8+8
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 354
;354:					((float *)(b+field->ofs))[0] = vec[0];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 355
;355:					((float *)(b+field->ofs))[1] = vec[1];
ADDRLP4 72
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 72
INDIRI4
ADDP4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 356
;356:					((float *)(b+field->ofs))[2] = vec[2];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 357
;357:					break;
ADDRGP4 $257
JUMPV
LABELV $273
line 359
;358:				  case F_INT:
;359:					*(int *)(b+field->ofs) = atoi(G_ClearString(in[i+1].value));
ADDRLP4 76
CNSTI4 132
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 76
INDIRI4
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 G_ClearString
CALLP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 84
INDIRI4
ASGNI4
line 360
;360:					break;
ADDRGP4 $257
JUMPV
LABELV $274
line 362
;361:				  case F_FLOAT:
;362:					*(float *)(b+field->ofs) = atof(G_ClearString(in[i+1].value));
ADDRLP4 88
CNSTI4 132
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 88
INDIRI4
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 G_ClearString
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 96
INDIRF4
ASGNF4
line 363
;363:					break;
ADDRGP4 $257
JUMPV
LABELV $275
line 365
;364:				  case F_ANGLEHACK:
;365:					buf = in[i+1].value;
ADDRLP4 100
CNSTI4 132
ASGNI4
ADDRLP4 20
ADDRLP4 100
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 100
INDIRI4
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
line 366
;366:					strcat(buf, in[i+2].value);
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 264
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 367
;367:					strcat(buf, in[i+3].value);
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 396
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 368
;368:					sscanf (G_ClearString(buf), "%f %f %f", &vec[0], &vec[1], &vec[2]);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 G_ClearString
CALLP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+4
ARGP4
ADDRLP4 8+8
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 369
;369:					((float *)(b+field->ofs))[0] = vec[0];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 370
;370:					((float *)(b+field->ofs))[1] = vec[1];
ADDRLP4 108
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 108
INDIRI4
ADDP4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 371
;371:					((float *)(b+field->ofs))[2] = vec[2];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 372
;372:					break;
line 375
;373:				  default:
;374:				  case F_IGNORE:
;375:					break;
line 377
;376:				}
;377:				break;
ADDRGP4 $257
JUMPV
LABELV $259
line 379
;378:			}
;379:		}
LABELV $256
line 341
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $258
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $255
LABELV $257
line 380
;380:	}
LABELV $252
line 340
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $254
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $251
line 382
;381:	
;382:	if ( !G_CallSpawn( ent ) ) {
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_CallSpawn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $282
line 383
;383:		G_FreeEntity( ent );
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 384
;384:	}
LABELV $282
line 385
;385:}
LABELV $250
endproc G_LoadMapfileEntity 112 20
export G_LoadMapfile
proc G_LoadMapfile 60 16
line 387
;386:
;387:void G_LoadMapfile( char *filename ){
line 388
;388:	qboolean lastSpace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 389
;389:	qboolean pgbreak = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 390
;390:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 391
;391:	int charCount = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 392
;392:	int tokenNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 398
;393:	int maxTokennum;
;394:	int lpar, rpar;
;395:	int len;
;396:	fileHandle_t	f;
;397:	
;398:	len = trap_FS_FOpenFile ( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 400
;399:	
;400:	if ( !f ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $285
line 401
;401:		G_Printf( "%s",va( S_COLOR_YELLOW "mapfile not found: %s\n", filename ) );	
ADDRGP4 $288
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $287
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 402
;402:		return;
ADDRGP4 $284
JUMPV
LABELV $285
line 405
;403:	}
;404:
;405:	if ( len >= 2500000*6 ) {
ADDRLP4 32
INDIRI4
CNSTI4 15000000
LTI4 $289
line 406
;406:		trap_Error( va( S_COLOR_RED "map file too large: %s is %i, max allowed is %i", filename, len, 2500000*6 ) );
ADDRGP4 $291
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 15000000
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 407
;407:		trap_FS_FCloseFile( f );
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 408
;408:		return;
ADDRGP4 $284
JUMPV
LABELV $289
line 410
;409:	}
;410:	ClearRegisteredItems();
ADDRGP4 ClearRegisteredItems
CALLV
pop
line 411
;411:	G_ClearEntities();
ADDRGP4 G_ClearEntities
CALLV
pop
line 413
;412:
;413:	trap_FS_Read( mapbuffer, len, f );
ADDRGP4 mapbuffer
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 414
;414:	mapbuffer[len] = 0;
ADDRLP4 32
INDIRI4
ADDRGP4 mapbuffer
ADDP4
CNSTI1 0
ASGNI1
line 415
;415:	trap_FS_FCloseFile( f );
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 417
;416:	
;417:	COM_Compress(mapbuffer);
ADDRGP4 mapbuffer
ARGP4
ADDRGP4 COM_Compress
CALLI4
pop
line 419
;418:	
;419:	for ( i = 0; i < MAX_MAPFILE_LENGTH; i++ ){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $292
line 422
;420:		
;421:		//Filter comments( start at # and end at break )
;422:		if( mapbuffer[i] == '#' ){
ADDRLP4 0
INDIRI4
ADDRGP4 mapbuffer
ADDP4
INDIRI1
CVII4 1
CNSTI4 35
NEI4 $296
ADDRGP4 $299
JUMPV
LABELV $298
line 423
;423:			while( i < MAX_MAPFILE_LENGTH && !pgbreak ){
line 424
;424:				if( mapbuffer[i] == '\n' || mapbuffer[i] == '\r' )
ADDRLP4 44
ADDRLP4 0
INDIRI4
ADDRGP4 mapbuffer
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 10
EQI4 $303
ADDRLP4 44
INDIRI4
CNSTI4 13
NEI4 $301
LABELV $303
line 425
;425:					pgbreak = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $301
line 426
;426:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 427
;427:			}
LABELV $299
line 423
ADDRLP4 0
INDIRI4
CNSTI4 15000000
GEI4 $304
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $298
LABELV $304
line 428
;428:			pgbreak = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 429
;429:			lastSpace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 431
;430:			//continue;
;431:		}
LABELV $296
line 433
;432:		
;433:		if( SkippedChar( mapbuffer[i] ) ){
ADDRLP4 0
INDIRI4
ADDRGP4 mapbuffer
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 44
ADDRGP4 SkippedChar
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $305
line 434
;434:			if( !lastSpace ){
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $293
line 435
;435:				mapbuffer[charCount] = ' ';
ADDRLP4 12
INDIRI4
ADDRGP4 mapbuffer
ADDP4
CNSTI1 32
ASGNI1
line 436
;436:				charCount++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 437
;437:				lastSpace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 438
;438:			}
line 439
;439:			continue;
ADDRGP4 $293
JUMPV
LABELV $305
line 442
;440:		}
;441:		
;442:		lastSpace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 443
;443:		mapbuffer[charCount] = mapbuffer[i];
ADDRLP4 48
ADDRGP4 mapbuffer
ASGNP4
ADDRLP4 12
INDIRI4
ADDRLP4 48
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 444
;444:		charCount++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 445
;445:	}
LABELV $293
line 419
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15000000
LTI4 $292
line 447
;446:	
;447:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $310
JUMPV
LABELV $309
line 448
;448:	while( i < MAX_MAPFILE_LENGTH && tokenNum < MAX_TOKENNUM){
line 449
;449:		i = G_setTokens2( mapbuffer, tokens2[tokenNum].value, i);
ADDRGP4 mapbuffer
ARGP4
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 tokens2
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 G_setTokens2
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ASGNI4
line 450
;450:		tokens2[tokenNum].type = G_setTokenType2( tokens2[tokenNum].value );
ADDRLP4 48
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 tokens2
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 G_setTokenType2
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 tokens2+128
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 451
;451:		tokenNum++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 452
;452:	}
LABELV $310
line 448
ADDRLP4 0
INDIRI4
CNSTI4 15000000
GEI4 $313
ADDRLP4 4
INDIRI4
CNSTI4 3145728
LTI4 $309
LABELV $313
line 453
;453:	maxTokennum = tokenNum;
ADDRLP4 24
ADDRLP4 4
INDIRI4
ASGNI4
line 455
;454:	
;455:	G_Printf("Mapfile parser found %i tokens\n", maxTokennum );
ADDRGP4 $314
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 457
;456:	
;457:	for( tokenNum = 0; tokenNum < maxTokennum; tokenNum++ ){
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $318
JUMPV
LABELV $315
line 458
;458:			if( strcmp( tokens2[tokenNum].value, "{" ) == 0 ){
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 tokens2
ADDP4
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 44
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $319
line 460
;459:				//CG_Printf("lpar found\n");
;460:				lpar = tokenNum;
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
line 461
;461:				if( G_AbeforeB2((char*)"{",(char*)"}", tokens2, tokenNum+2)){
ADDRGP4 $321
ARGP4
ADDRGP4 $324
ARGP4
ADDRGP4 tokens2
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 48
ADDRGP4 G_AbeforeB2
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $322
line 462
;462:					G_Printf("error: \"}\" expected at %s\n", tokens2[tokenNum].value);
ADDRGP4 $325
ARGP4
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 tokens2
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 463
;463:					break;
ADDRGP4 $317
JUMPV
LABELV $322
line 466
;464:				}
;465:				//CG_Printf("debug abeforeb\n");
;466:				rpar = G_FindNextToken2((char*)"}", tokens2, tokenNum+2 );
ADDRGP4 $324
ARGP4
ADDRGP4 tokens2
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 52
ADDRGP4 G_FindNextToken2
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 52
INDIRI4
ASGNI4
line 468
;467:				//CG_Printf("debug findnexttoken\n");
;468:				if( rpar != -1 ){
ADDRLP4 20
INDIRI4
CNSTI4 -1
EQI4 $326
line 469
;469:					G_LoadMapfileEntity(tokens2, lpar+1, rpar-1);
ADDRGP4 tokens2
ARGP4
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 56
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRLP4 56
INDIRI4
SUBI4
ARGI4
ADDRGP4 G_LoadMapfileEntity
CALLV
pop
line 471
;470:					//G_setHudElement(i, tokens, lpar+1, rpar-1);
;471:					tokenNum = rpar;
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 472
;472:				}	
LABELV $326
line 473
;473:			}	
LABELV $319
line 474
;474:	}
LABELV $316
line 457
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $318
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $315
LABELV $317
line 475
;475:	SaveRegisteredItems();
ADDRGP4 SaveRegisteredItems
CALLV
pop
line 477
;476:	
;477:}
LABELV $284
endproc G_LoadMapfile 60 16
export G_LoadMapfileAll
proc G_LoadMapfileAll 60 16
line 479
;478:
;479:void G_LoadMapfileAll( char *filename ){
line 480
;480:	qboolean lastSpace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 481
;481:	qboolean pgbreak = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 482
;482:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 483
;483:	int charCount = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 484
;484:	int tokenNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 490
;485:	int maxTokennum;
;486:	int lpar, rpar;
;487:	int len;
;488:	fileHandle_t	f;
;489:	
;490:	len = trap_FS_FOpenFile ( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 492
;491:	
;492:	if ( !f ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $329
line 493
;493:		G_Printf( "%s",va( S_COLOR_YELLOW "mapfile not found: %s\n", filename ) );	
ADDRGP4 $288
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $287
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 494
;494:		return;
ADDRGP4 $328
JUMPV
LABELV $329
line 497
;495:	}
;496:
;497:	if ( len >= 2500000*6 ) {
ADDRLP4 32
INDIRI4
CNSTI4 15000000
LTI4 $331
line 498
;498:		trap_Error( va( S_COLOR_RED "map file too large: %s is %i, max allowed is %i", filename, len, 2500000*6 ) );
ADDRGP4 $291
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 15000000
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 499
;499:		trap_FS_FCloseFile( f );
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 500
;500:		return;
ADDRGP4 $328
JUMPV
LABELV $331
line 502
;501:	}
;502:	ClearRegisteredItems();
ADDRGP4 ClearRegisteredItems
CALLV
pop
line 503
;503:	G_ClearEntitiesAll();
ADDRGP4 G_ClearEntitiesAll
CALLV
pop
line 505
;504:
;505:	trap_FS_Read( mapbuffer, len, f );
ADDRGP4 mapbuffer
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 506
;506:	mapbuffer[len] = 0;
ADDRLP4 32
INDIRI4
ADDRGP4 mapbuffer
ADDP4
CNSTI1 0
ASGNI1
line 507
;507:	trap_FS_FCloseFile( f );
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 509
;508:	
;509:	COM_Compress(mapbuffer);
ADDRGP4 mapbuffer
ARGP4
ADDRGP4 COM_Compress
CALLI4
pop
line 511
;510:	
;511:	for ( i = 0; i < MAX_MAPFILE_LENGTH; i++ ){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $333
line 514
;512:		
;513:		//Filter comments( start at # and end at break )
;514:		if( mapbuffer[i] == '#' ){
ADDRLP4 0
INDIRI4
ADDRGP4 mapbuffer
ADDP4
INDIRI1
CVII4 1
CNSTI4 35
NEI4 $337
ADDRGP4 $340
JUMPV
LABELV $339
line 515
;515:			while( i < MAX_MAPFILE_LENGTH && !pgbreak ){
line 516
;516:				if( mapbuffer[i] == '\n' || mapbuffer[i] == '\r' )
ADDRLP4 44
ADDRLP4 0
INDIRI4
ADDRGP4 mapbuffer
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 10
EQI4 $344
ADDRLP4 44
INDIRI4
CNSTI4 13
NEI4 $342
LABELV $344
line 517
;517:					pgbreak = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $342
line 518
;518:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 519
;519:			}
LABELV $340
line 515
ADDRLP4 0
INDIRI4
CNSTI4 15000000
GEI4 $345
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $339
LABELV $345
line 520
;520:			pgbreak = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 521
;521:			lastSpace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 523
;522:			//continue;
;523:		}
LABELV $337
line 525
;524:		
;525:		if( SkippedChar( mapbuffer[i] ) ){
ADDRLP4 0
INDIRI4
ADDRGP4 mapbuffer
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 44
ADDRGP4 SkippedChar
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $346
line 526
;526:			if( !lastSpace ){
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $334
line 527
;527:				mapbuffer[charCount] = ' ';
ADDRLP4 12
INDIRI4
ADDRGP4 mapbuffer
ADDP4
CNSTI1 32
ASGNI1
line 528
;528:				charCount++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 529
;529:				lastSpace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 530
;530:			}
line 531
;531:			continue;
ADDRGP4 $334
JUMPV
LABELV $346
line 534
;532:		}
;533:		
;534:		lastSpace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 535
;535:		mapbuffer[charCount] = mapbuffer[i];
ADDRLP4 48
ADDRGP4 mapbuffer
ASGNP4
ADDRLP4 12
INDIRI4
ADDRLP4 48
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 536
;536:		charCount++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 537
;537:	}
LABELV $334
line 511
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15000000
LTI4 $333
line 539
;538:	
;539:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $350
line 540
;540:	while( i < MAX_MAPFILE_LENGTH && tokenNum < MAX_TOKENNUM){
line 541
;541:		i = G_setTokens2( mapbuffer, tokens2[tokenNum].value, i);
ADDRGP4 mapbuffer
ARGP4
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 tokens2
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 G_setTokens2
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ASGNI4
line 542
;542:		tokens2[tokenNum].type = G_setTokenType2( tokens2[tokenNum].value );
ADDRLP4 48
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 tokens2
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 G_setTokenType2
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 tokens2+128
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 543
;543:		tokenNum++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 544
;544:	}
LABELV $351
line 540
ADDRLP4 0
INDIRI4
CNSTI4 15000000
GEI4 $354
ADDRLP4 4
INDIRI4
CNSTI4 3145728
LTI4 $350
LABELV $354
line 545
;545:	maxTokennum = tokenNum;
ADDRLP4 24
ADDRLP4 4
INDIRI4
ASGNI4
line 547
;546:	
;547:	G_Printf("Mapfile parser found %i tokens\n", maxTokennum );
ADDRGP4 $314
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 549
;548:	
;549:	for( tokenNum = 0; tokenNum < maxTokennum; tokenNum++ ){
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $355
line 550
;550:			if( strcmp( tokens2[tokenNum].value, "{" ) == 0 ){
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 tokens2
ADDP4
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 44
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $359
line 552
;551:				//CG_Printf("lpar found\n");
;552:				lpar = tokenNum;
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
line 553
;553:				if( G_AbeforeB2((char*)"{",(char*)"}", tokens2, tokenNum+2)){
ADDRGP4 $321
ARGP4
ADDRGP4 $324
ARGP4
ADDRGP4 tokens2
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 48
ADDRGP4 G_AbeforeB2
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $361
line 554
;554:					G_Printf("error: \"}\" expected at %s\n", tokens2[tokenNum].value);
ADDRGP4 $325
ARGP4
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 tokens2
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 555
;555:					break;
ADDRGP4 $357
JUMPV
LABELV $361
line 558
;556:				}
;557:				//CG_Printf("debug abeforeb\n");
;558:				rpar = G_FindNextToken2((char*)"}", tokens2, tokenNum+2 );
ADDRGP4 $324
ARGP4
ADDRGP4 tokens2
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 52
ADDRGP4 G_FindNextToken2
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 52
INDIRI4
ASGNI4
line 560
;559:				//CG_Printf("debug findnexttoken\n");
;560:				if( rpar != -1 ){
ADDRLP4 20
INDIRI4
CNSTI4 -1
EQI4 $363
line 561
;561:					G_LoadMapfileEntity(tokens2, lpar+1, rpar-1);
ADDRGP4 tokens2
ARGP4
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 56
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRLP4 56
INDIRI4
SUBI4
ARGI4
ADDRGP4 G_LoadMapfileEntity
CALLV
pop
line 563
;562:					//G_setHudElement(i, tokens, lpar+1, rpar-1);
;563:					tokenNum = rpar;
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 564
;564:				}	
LABELV $363
line 565
;565:			}	
LABELV $359
line 566
;566:	}
LABELV $356
line 549
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $358
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $355
LABELV $357
line 567
;567:	SaveRegisteredItems();
ADDRGP4 SaveRegisteredItems
CALLV
pop
line 569
;568:	
;569:}
LABELV $328
endproc G_LoadMapfileAll 60 16
export G_LoadMapfile_f
proc G_LoadMapfile_f 136 12
line 571
;570:
;571:void G_LoadMapfile_f( void ) {
line 576
;572:	char buf[MAX_QPATH];
;573:	char mapname[64];
;574:	int	i;
;575:	
;576:	for (i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $366
line 577
;577:		if ( g_entities[i].singlebot >= 1 ) {
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+1028
ADDP4
INDIRI4
CNSTI4 1
LTI4 $370
line 578
;578:			DropClientSilently( g_entities[i].client->ps.clientNum );
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 DropClientSilently
CALLV
pop
line 579
;579:		}
LABELV $370
line 580
;580:	}
LABELV $367
line 576
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $366
line 582
;581:	
;582:	if ( trap_Argc() < 2 ) {
ADDRLP4 132
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
GEI4 $374
line 583
;583:                G_Printf("Usage: loadmap <filename>\n");
ADDRGP4 $376
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 584
;584:		return;
ADDRGP4 $365
JUMPV
LABELV $374
line 587
;585:	}
;586:	
;587:	trap_Argv( 1, buf, sizeof( buf ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 589
;588:	
;589:	G_LoadMapfile(buf);
ADDRLP4 4
ARGP4
ADDRGP4 G_LoadMapfile
CALLV
pop
line 590
;590:	trap_Cvar_Set("mapfile",buf);
ADDRGP4 $377
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 591
;591:	trap_Cvar_VariableStringBuffer("mapname", mapname, sizeof(mapname));
ADDRGP4 $205
ARGP4
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 592
;592:	trap_Cvar_Set("lastmap",mapname);
ADDRGP4 $378
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 593
;593:}
LABELV $365
endproc G_LoadMapfile_f 136 12
export G_LoadMapfileAll_f
proc G_LoadMapfileAll_f 136 12
line 595
;594:
;595:void G_LoadMapfileAll_f( void ) {
line 600
;596:	char buf[MAX_QPATH];
;597:	char mapname[64];
;598:	int	i;
;599:	
;600:	for (i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $380
line 601
;601:		if ( g_entities[i].singlebot >= 1 ) {
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+1028
ADDP4
INDIRI4
CNSTI4 1
LTI4 $384
line 602
;602:			DropClientSilently( g_entities[i].client->ps.clientNum );
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 DropClientSilently
CALLV
pop
line 603
;603:		}
LABELV $384
line 604
;604:	}
LABELV $381
line 600
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $380
line 606
;605:	
;606:	if ( trap_Argc() < 2 ) {
ADDRLP4 132
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
GEI4 $388
line 607
;607:                G_Printf("Usage: loadmapall <filename>\n");
ADDRGP4 $390
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 608
;608:		return;
ADDRGP4 $379
JUMPV
LABELV $388
line 611
;609:	}
;610:	
;611:	trap_Argv( 1, buf, sizeof( buf ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 613
;612:	
;613:	G_LoadMapfileAll(buf);
ADDRLP4 4
ARGP4
ADDRGP4 G_LoadMapfileAll
CALLV
pop
line 614
;614:	trap_Cvar_Set("mapfile",buf);
ADDRGP4 $377
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 615
;615:	trap_Cvar_VariableStringBuffer("mapname", mapname, sizeof(mapname));
ADDRGP4 $205
ARGP4
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 616
;616:	trap_Cvar_Set("lastmap",mapname);
ADDRGP4 $378
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 617
;617:}
LABELV $379
endproc G_LoadMapfileAll_f 136 12
export G_WriteMapfile_f
proc G_WriteMapfile_f 160 20
line 619
;618:
;619:void G_WriteMapfile_f( void ) {
line 627
;620:	int i;
;621:	fileHandle_t f;
;622:	char *string;
;623:	char buf[MAX_QPATH];
;624:	fieldCopy_t *field;
;625:	byte	*b;
;626:	
;627:	if ( trap_Argc() < 2 ) {
ADDRLP4 84
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 2
GEI4 $392
line 628
;628:                G_Printf("Usage: savemap <filename>\n");
ADDRGP4 $394
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 629
;629:		return;
ADDRGP4 $391
JUMPV
LABELV $392
line 632
;630:	}
;631:	
;632:	trap_Argv( 1, buf, sizeof( buf ) );
CNSTI4 1
ARGI4
ADDRLP4 20
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 634
;633:	
;634:	trap_FS_FOpenFile(va("%s", buf ),&f,FS_WRITE);
ADDRGP4 $287
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 636
;635:	
;636:	for( i = 0; i < MAX_GENTITIES; i++ ){
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $395
line 638
;637:	  
;638:		if( !g_entities[i].inuse )
CNSTI4 2492
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities+560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $399
line 639
;639:			continue;
ADDRGP4 $396
JUMPV
LABELV $399
line 641
;640:		
;641:		if( !G_ClassnameAllowed(g_entities[i].classname) )
CNSTI4 2492
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities+564
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 G_ClassnameAllowed
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $402
line 642
;642:			continue;
ADDRGP4 $396
JUMPV
LABELV $402
line 643
;643:		b = (byte *) &g_entities[i];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 645
;644:		
;645:		string = va("{\n");
ADDRGP4 $405
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 96
INDIRP4
ASGNP4
line 646
;646:		trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 648
;647:		
;648:		for( field=fieldsCopy; field->name; field++ ){
ADDRLP4 0
ADDRGP4 fieldsCopy
ASGNP4
ADDRGP4 $409
JUMPV
LABELV $406
line 649
;649:			switch( field->type ) {
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
LTI4 $411
ADDRLP4 104
INDIRI4
CNSTI4 9
GTI4 $411
ADDRLP4 104
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $436
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $436
address $424
address $428
address $413
address $411
address $417
address $432
address $411
address $411
address $411
address $411
code
LABELV $413
line 651
;650:			case F_LSTRING:
;651:				if( *(char **)(b+field->ofs) ){
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $411
line 652
;652:					string = va("   \"%s\"   \"%s\"\n", field->name, *(char **)(b+field->ofs) );
ADDRGP4 $416
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 116
INDIRP4
ASGNP4
line 653
;653:					trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 654
;654:				}
line 655
;655:				break;
ADDRGP4 $411
JUMPV
LABELV $417
line 657
;656:			case F_VECTOR:
;657:				if( (((float *)(b+field->ofs))[0] && ((float *)(b+field->ofs))[1] && ((float *)(b+field->ofs))[2]) || !strcmp(field->name,"origin") ){
ADDRLP4 112
CNSTI4 4
ASGNI4
ADDRLP4 116
ADDRLP4 0
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 120
CNSTF4 0
ASGNF4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 120
INDIRF4
EQF4 $422
ADDRLP4 116
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
ADDRLP4 120
INDIRF4
EQF4 $422
ADDRLP4 116
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 120
INDIRF4
NEF4 $420
LABELV $422
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $172
ARGP4
ADDRLP4 124
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $411
LABELV $420
line 658
;658:					string = va("   \"%s\"   \"%f %f %f\"\n", field->name, ((float *)(b+field->ofs))[0], ((float *)(b+field->ofs))[1], ((float *)(b+field->ofs))[2] );
ADDRGP4 $423
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 132
CNSTI4 4
ASGNI4
ADDRLP4 136
ADDRLP4 0
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
INDIRF4
ARGF4
ADDRLP4 136
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 136
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 140
INDIRP4
ASGNP4
line 659
;659:					trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 660
;660:				}
line 661
;661:				break;
ADDRGP4 $411
JUMPV
LABELV $424
line 663
;662:			case F_INT:
;663:				if( *(int *)(b+field->ofs) ){
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $411
line 664
;664:					string = va("   \"%s\"   \"%i\"\n", field->name, *(int *)(b+field->ofs) );
ADDRGP4 $427
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 132
INDIRP4
ASGNP4
line 665
;665:					trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 666
;666:				}
line 667
;667:				break;
ADDRGP4 $411
JUMPV
LABELV $428
line 669
;668:			case F_FLOAT:
;669:				if( *(float *)(b+field->ofs) ){
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $411
line 670
;670:					string = va("   \"%s\"   \"%f\"\n", field->name, *(float *)(b+field->ofs) );
ADDRGP4 $431
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 132
INDIRP4
ASGNP4
line 671
;671:					trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 672
;672:				}
line 673
;673:				break;
ADDRGP4 $411
JUMPV
LABELV $432
line 675
;674:			case F_ANGLEHACK:
;675:				if( ((float *)(b+field->ofs))[0] && ((float *)(b+field->ofs))[1] && ((float *)(b+field->ofs))[2] ){
ADDRLP4 128
CNSTI4 4
ASGNI4
ADDRLP4 132
ADDRLP4 0
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 136
CNSTF4 0
ASGNF4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 136
INDIRF4
EQF4 $411
ADDRLP4 132
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 136
INDIRF4
EQF4 $411
ADDRLP4 132
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 136
INDIRF4
EQF4 $411
line 676
;676:					string = va("   \"%s\"   \"%f %f %f\"\n", field->name, ((float *)(b+field->ofs))[0], ((float *)(b+field->ofs))[1], ((float *)(b+field->ofs))[2] );
ADDRGP4 $423
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 144
CNSTI4 4
ASGNI4
ADDRLP4 148
ADDRLP4 0
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
INDIRF4
ARGF4
ADDRLP4 148
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 148
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 152
INDIRP4
ASGNP4
line 677
;677:					trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 678
;678:				}
line 679
;679:				break;
line 682
;680:			default:
;681:			case F_IGNORE:
;682:				break;
LABELV $411
line 684
;683:			}
;684:		}
LABELV $407
line 648
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $409
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $406
line 685
;685:		string = va("}\n\n");
ADDRGP4 $437
ARGP4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 104
INDIRP4
ASGNP4
line 686
;686:		trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 687
;687:	}
LABELV $396
line 636
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4096
LTI4 $395
line 688
;688:	trap_FS_FCloseFile(f);
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 689
;689:}
LABELV $391
endproc G_WriteMapfile_f 160 20
export G_WriteMapfileAll_f
proc G_WriteMapfileAll_f 160 20
line 691
;690:
;691:void G_WriteMapfileAll_f( void ) {
line 699
;692:	int i;
;693:	fileHandle_t f;
;694:	char *string;
;695:	char buf[MAX_QPATH];
;696:	fieldCopy_t *field;
;697:	byte	*b;
;698:	
;699:	if ( trap_Argc() < 2 ) {
ADDRLP4 84
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 2
GEI4 $439
line 700
;700:                G_Printf("Usage: savemapall <filename>\n");
ADDRGP4 $441
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 701
;701:		return;
ADDRGP4 $438
JUMPV
LABELV $439
line 704
;702:	}
;703:	
;704:	trap_Argv( 1, buf, sizeof( buf ) );
CNSTI4 1
ARGI4
ADDRLP4 20
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 706
;705:	
;706:	trap_FS_FOpenFile(va("%s", buf ),&f,FS_WRITE);
ADDRGP4 $287
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 708
;707:	
;708:	for( i = 0; i < MAX_GENTITIES; i++ ){
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $442
line 710
;709:	  
;710:		if( !g_entities[i].inuse )
CNSTI4 2492
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities+560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $446
line 711
;711:			continue;
ADDRGP4 $443
JUMPV
LABELV $446
line 713
;712:		
;713:		if( !G_ClassnameAllowedAll(g_entities[i].classname) )
CNSTI4 2492
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities+564
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 G_ClassnameAllowedAll
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $449
line 714
;714:			continue;
ADDRGP4 $443
JUMPV
LABELV $449
line 715
;715:		b = (byte *) &g_entities[i];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 717
;716:		
;717:		string = va("{\n");
ADDRGP4 $405
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 96
INDIRP4
ASGNP4
line 718
;718:		trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 720
;719:		
;720:		for( field=fieldsCopy; field->name; field++ ){
ADDRLP4 0
ADDRGP4 fieldsCopy
ASGNP4
ADDRGP4 $455
JUMPV
LABELV $452
line 721
;721:			switch( field->type ) {
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
LTI4 $457
ADDRLP4 104
INDIRI4
CNSTI4 9
GTI4 $457
ADDRLP4 104
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $478
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $478
address $468
address $471
address $459
address $457
address $462
address $474
address $457
address $457
address $457
address $457
code
LABELV $459
line 723
;722:			case F_LSTRING:
;723:				if( *(char **)(b+field->ofs) ){
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $457
line 724
;724:					string = va("   \"%s\"   \"%s\"\n", field->name, *(char **)(b+field->ofs) );
ADDRGP4 $416
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 116
INDIRP4
ASGNP4
line 725
;725:					trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 726
;726:				}
line 727
;727:				break;
ADDRGP4 $457
JUMPV
LABELV $462
line 729
;728:			case F_VECTOR:
;729:				if( (((float *)(b+field->ofs))[0] && ((float *)(b+field->ofs))[1] && ((float *)(b+field->ofs))[2]) || !strcmp(field->name,"origin") ){
ADDRLP4 112
CNSTI4 4
ASGNI4
ADDRLP4 116
ADDRLP4 0
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 120
CNSTF4 0
ASGNF4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 120
INDIRF4
EQF4 $467
ADDRLP4 116
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
ADDRLP4 120
INDIRF4
EQF4 $467
ADDRLP4 116
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 120
INDIRF4
NEF4 $465
LABELV $467
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $172
ARGP4
ADDRLP4 124
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $457
LABELV $465
line 730
;730:					string = va("   \"%s\"   \"%f %f %f\"\n", field->name, ((float *)(b+field->ofs))[0], ((float *)(b+field->ofs))[1], ((float *)(b+field->ofs))[2] );
ADDRGP4 $423
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 132
CNSTI4 4
ASGNI4
ADDRLP4 136
ADDRLP4 0
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
INDIRF4
ARGF4
ADDRLP4 136
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 136
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 140
INDIRP4
ASGNP4
line 731
;731:					trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 732
;732:				}
line 733
;733:				break;
ADDRGP4 $457
JUMPV
LABELV $468
line 735
;734:			case F_INT:
;735:				if( *(int *)(b+field->ofs) ){
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $457
line 736
;736:					string = va("   \"%s\"   \"%i\"\n", field->name, *(int *)(b+field->ofs) );
ADDRGP4 $427
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 132
INDIRP4
ASGNP4
line 737
;737:					trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 738
;738:				}
line 739
;739:				break;
ADDRGP4 $457
JUMPV
LABELV $471
line 741
;740:			case F_FLOAT:
;741:				if( *(float *)(b+field->ofs) ){
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $457
line 742
;742:					string = va("   \"%s\"   \"%f\"\n", field->name, *(float *)(b+field->ofs) );
ADDRGP4 $431
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 132
INDIRP4
ASGNP4
line 743
;743:					trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 744
;744:				}
line 745
;745:				break;
ADDRGP4 $457
JUMPV
LABELV $474
line 747
;746:			case F_ANGLEHACK:
;747:				if( ((float *)(b+field->ofs))[0] && ((float *)(b+field->ofs))[1] && ((float *)(b+field->ofs))[2] ){
ADDRLP4 128
CNSTI4 4
ASGNI4
ADDRLP4 132
ADDRLP4 0
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 136
CNSTF4 0
ASGNF4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 136
INDIRF4
EQF4 $457
ADDRLP4 132
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 136
INDIRF4
EQF4 $457
ADDRLP4 132
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 136
INDIRF4
EQF4 $457
line 748
;748:					string = va("   \"%s\"   \"%f %f %f\"\n", field->name, ((float *)(b+field->ofs))[0], ((float *)(b+field->ofs))[1], ((float *)(b+field->ofs))[2] );
ADDRGP4 $423
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 144
CNSTI4 4
ASGNI4
ADDRLP4 148
ADDRLP4 0
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
INDIRF4
ARGF4
ADDRLP4 148
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 148
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 152
INDIRP4
ASGNP4
line 749
;749:					trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 750
;750:				}
line 751
;751:				break;
line 754
;752:			default:
;753:			case F_IGNORE:
;754:				break;
LABELV $457
line 756
;755:			}
;756:		}
LABELV $453
line 720
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $455
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $452
line 757
;757:		string = va("}\n\n");
ADDRGP4 $437
ARGP4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 104
INDIRP4
ASGNP4
line 758
;758:		trap_FS_Write(string, strlen(string), f);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 759
;759:	}
LABELV $443
line 708
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4096
LTI4 $442
line 760
;760:	trap_FS_FCloseFile(f);
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 761
;761:}
LABELV $438
endproc G_WriteMapfileAll_f 160 20
import G_CallSpawn
import BG_CheckClassname
bss
export tokens2
align 4
LABELV tokens2
skip 415236096
align 1
LABELV mapbuffer
skip 15000000
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
LABELV $441
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 109
byte 1 97
byte 1 112
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 60
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $437
byte 1 125
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $431
byte 1 32
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $427
byte 1 32
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 105
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $423
byte 1 32
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $416
byte 1 32
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 32
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $405
byte 1 123
byte 1 10
byte 1 0
align 1
LABELV $394
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 60
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $390
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 97
byte 1 112
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 60
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $378
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $377
byte 1 109
byte 1 97
byte 1 112
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $376
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 60
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $325
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
LABELV $324
byte 1 125
byte 1 0
align 1
LABELV $321
byte 1 123
byte 1 0
align 1
LABELV $314
byte 1 77
byte 1 97
byte 1 112
byte 1 102
byte 1 105
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
LABELV $291
byte 1 94
byte 1 49
byte 1 109
byte 1 97
byte 1 112
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
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
byte 1 0
align 1
LABELV $288
byte 1 94
byte 1 51
byte 1 109
byte 1 97
byte 1 112
byte 1 102
byte 1 105
byte 1 108
byte 1 101
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $287
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $268
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $267
byte 1 32
byte 1 0
align 1
LABELV $261
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $244
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $243
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $242
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $241
byte 1 115
byte 1 98
byte 1 95
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $240
byte 1 115
byte 1 98
byte 1 95
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $239
byte 1 115
byte 1 98
byte 1 95
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $238
byte 1 115
byte 1 98
byte 1 95
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $237
byte 1 115
byte 1 98
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $236
byte 1 115
byte 1 98
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $235
byte 1 115
byte 1 98
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $234
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $233
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $232
byte 1 115
byte 1 98
byte 1 95
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $231
byte 1 115
byte 1 98
byte 1 95
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $230
byte 1 118
byte 1 101
byte 1 104
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $229
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 105
byte 1 99
byte 1 115
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $228
byte 1 115
byte 1 98
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $227
byte 1 115
byte 1 98
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $226
byte 1 115
byte 1 98
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 48
byte 1 0
align 1
LABELV $225
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $224
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $223
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 48
byte 1 0
align 1
LABELV $222
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $221
byte 1 115
byte 1 98
byte 1 95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $220
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $219
byte 1 115
byte 1 98
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $218
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $217
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $216
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $215
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $214
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $213
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $212
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 50
byte 1 0
align 1
LABELV $211
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $210
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $209
byte 1 108
byte 1 111
byte 1 111
byte 1 116
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $208
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $207
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $206
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $205
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $204
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 101
byte 1 119
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $203
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $202
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $201
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $200
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $199
byte 1 109
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $198
byte 1 109
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $197
byte 1 109
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $196
byte 1 109
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $195
byte 1 109
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $194
byte 1 109
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $193
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $192
byte 1 109
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $191
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $190
byte 1 109
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $189
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $188
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $187
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $186
byte 1 112
byte 1 114
byte 1 105
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $185
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $184
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $183
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $182
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $181
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $180
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 114
byte 1 117
byte 1 0
align 1
LABELV $179
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $178
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $177
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $176
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $175
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $174
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 50
byte 1 0
align 1
LABELV $173
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $172
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $171
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $99
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $96
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $93
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $90
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $87
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $84
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $81
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $78
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $75
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $72
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
byte 1 95
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $69
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
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
