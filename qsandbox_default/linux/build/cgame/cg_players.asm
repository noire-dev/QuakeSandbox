data
export cg_customSoundNames
align 4
LABELV cg_customSoundNames
address $81
address $82
address $83
address $84
address $85
address $86
address $87
address $88
address $89
address $90
address $91
address $92
address $93
skip 76
export CG_CustomSound
code
proc CG_CustomSound 16 8
file "../../../code/cgame/cg_players.c"
line 55
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
;23:// cg_players.c -- handle the media and animation for player entities
;24:#include "cg_local.h"
;25:
;26:char	*cg_customSoundNames[MAX_CUSTOM_SOUNDS] = {
;27:	"*death1.wav",
;28:	"*death2.wav",
;29:	"*death3.wav",
;30:	"*jump1.wav",
;31:	"*pain25_1.wav",
;32:	"*pain50_1.wav",
;33:	"*pain75_1.wav",
;34:	"*pain100_1.wav",
;35:	"*falling1.wav",
;36:	"*gasp.wav",
;37:	"*drown.wav",
;38:	"*fall1.wav",
;39:	"*taunt.wav"
;40:};
;41:
;42:// leilei - eyes hack
;43:
;44:vec3_t headpos;
;45:vec3_t headang;
;46:
;47:int enableQ;
;48:
;49:/*
;50:================
;51:CG_CustomSound
;52:
;53:================
;54:*/
;55:sfxHandle_t	CG_CustomSound( int clientNum, const char *soundName ) {
line 59
;56:	clientInfo_t *ci;
;57:	int			i;
;58:
;59:	if ( soundName[0] != '*' ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $95
line 60
;60:		return trap_S_RegisterSound_MiTech( soundName, qfalse );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $94
JUMPV
LABELV $95
line 63
;61:	}
;62:
;63:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $99
ADDRLP4 8
INDIRI4
CNSTI4 256
LTI4 $97
LABELV $99
line 64
;64:		clientNum = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 65
;65:	}
LABELV $97
line 66
;66:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 4
CNSTI4 1944
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 68
;67:
;68:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS && cg_customSoundNames[i] ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $101
line 69
;69:		if ( !strcmp( soundName, cg_customSoundNames[i] ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $105
line 70
;70:			return ci->sounds[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1796
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $94
JUMPV
LABELV $105
line 72
;71:		}
;72:	}
LABELV $102
line 68
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $104
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $107
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $101
LABELV $107
line 74
;73:
;74:	CG_Error( "Unknown custom sound: %s", soundName );
ADDRGP4 $108
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 75
;75:	return 0;
CNSTI4 0
RETI4
LABELV $94
endproc CG_CustomSound 16 8
proc CG_ParseAnimationFile 20084 12
line 96
;76:}
;77:
;78:
;79:
;80:/*
;81:=============================================================================
;82:
;83:CLIENT INFO
;84:
;85:=============================================================================
;86:*/
;87:
;88:/*
;89:======================
;90:CG_ParseAnimationFile
;91:
;92:Read a configuration file containing animation coutns and rates
;93:models/players/visor/animation.cfg, etc
;94:======================
;95:*/
;96:static qboolean	CG_ParseAnimationFile( const char *filename, clientInfo_t *ci ) {
line 107
;97:	char		*text_p, *prev;
;98:	int			len;
;99:	int			i;
;100:	char		*token;
;101:	float		fps;
;102:	int			skip;
;103:	char		text[20000];
;104:	fileHandle_t	f;
;105:	animation_t *animations;
;106:
;107:	animations = ci->animations;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 760
ADDP4
ASGNP4
line 110
;108:
;109:	// load the file
;110:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20032
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20036
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 20036
INDIRI4
ASGNI4
line 111
;111:	if ( len <= 0 ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
GTI4 $110
line 112
;112:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $109
JUMPV
LABELV $110
line 114
;113:	}
;114:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 28
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $112
line 115
;115:		CG_Printf( "File %s too long\n", filename );
ADDRGP4 $114
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 116
;116:		trap_FS_FCloseFile( f );
ADDRLP4 20032
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 117
;117:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $109
JUMPV
LABELV $112
line 119
;118:	}
;119:	trap_FS_Read( text, len, f );
ADDRLP4 32
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 20032
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 120
;120:	text[len] = 0;
ADDRLP4 28
INDIRI4
ADDRLP4 32
ADDP4
CNSTI1 0
ASGNI1
line 121
;121:	trap_FS_FCloseFile( f );
ADDRLP4 20032
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 124
;122:
;123:	// parse the text
;124:	text_p = text;
ADDRLP4 12
ADDRLP4 32
ASGNP4
line 125
;125:	skip = 0;	// quite the compiler warning
ADDRLP4 24
CNSTI4 0
ASGNI4
line 127
;126:
;127:	ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 128
;128:	VectorClear( ci->headOffset );
ADDRLP4 20040
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20044
CNSTF4 0
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 700
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 696
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 692
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
line 129
;129:	ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 0
ASGNI4
line 130
;130:	ci->fixedlegs = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 684
ADDP4
CNSTI4 0
ASGNI4
line 131
;131:	ci->fixedtorso = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $115
line 134
;132:
;133:	// read optional parameters
;134:	while ( 1 ) {
line 135
;135:		prev = text_p;	// so we can unget
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
line 136
;136:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 137
;137:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $118
line 138
;138:			break;
ADDRGP4 $117
JUMPV
LABELV $118
line 140
;139:		}
;140:		if ( !Q_stricmp( token, "footsteps" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $122
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
NEI4 $120
line 141
;141:			token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20056
INDIRP4
ASGNP4
line 142
;142:			if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $123
line 143
;143:				break;
ADDRGP4 $117
JUMPV
LABELV $123
line 145
;144:			}
;145:			if ( !Q_stricmp( token, "default" ) || !Q_stricmp( token, "normal" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $127
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
EQI4 $129
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $128
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $125
LABELV $129
line 146
;146:				ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 147
;147:			} else if ( !Q_stricmp( token, "boot" ) ) {
ADDRGP4 $116
JUMPV
LABELV $125
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $130
line 148
;148:				ci->footsteps = FOOTSTEP_BOOT;
ADDRFP4 4
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 1
ASGNI4
line 149
;149:			} else if ( !Q_stricmp( token, "flesh" ) ) {
ADDRGP4 $116
JUMPV
LABELV $130
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $133
line 150
;150:				ci->footsteps = FOOTSTEP_FLESH;
ADDRFP4 4
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 2
ASGNI4
line 151
;151:			} else if ( !Q_stricmp( token, "mech" ) ) {
ADDRGP4 $116
JUMPV
LABELV $133
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRLP4 20076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20076
INDIRI4
CNSTI4 0
NEI4 $136
line 152
;152:				ci->footsteps = FOOTSTEP_MECH;
ADDRFP4 4
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 3
ASGNI4
line 153
;153:			} else if ( !Q_stricmp( token, "energy" ) ) {
ADDRGP4 $116
JUMPV
LABELV $136
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 20080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20080
INDIRI4
CNSTI4 0
NEI4 $139
line 154
;154:				ci->footsteps = FOOTSTEP_ENERGY;
ADDRFP4 4
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 4
ASGNI4
line 155
;155:			} else {
ADDRGP4 $116
JUMPV
LABELV $139
line 156
;156:				CG_Printf( "Bad footsteps parm in %s: %s\n", filename, token );
ADDRGP4 $142
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 157
;157:			}
line 158
;158:			continue;
ADDRGP4 $116
JUMPV
LABELV $120
line 159
;159:		} else if ( !Q_stricmp( token, "headoffset" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $143
line 160
;160:			for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $146
line 161
;161:				token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 162
;162:				if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $150
line 163
;163:					break;
ADDRGP4 $116
JUMPV
LABELV $150
line 165
;164:				}
;165:				ci->headOffset[i] = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 692
ADDP4
ADDP4
ADDRLP4 20064
INDIRF4
ASGNF4
line 166
;166:			}
LABELV $147
line 160
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $146
line 167
;167:			continue;
ADDRGP4 $116
JUMPV
LABELV $143
line 168
;168:		} else if ( !Q_stricmp( token, "eyes" ) ) {	// leilei - EYES
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $152
line 169
;169:			for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $155
line 170
;170:				token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20064
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20064
INDIRP4
ASGNP4
line 171
;171:				if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $159
line 172
;172:					break;
ADDRGP4 $116
JUMPV
LABELV $159
line 174
;173:				}
;174:				ci->eyepos[i] = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20068
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1928
ADDP4
ADDP4
ADDRLP4 20068
INDIRF4
ASGNF4
line 175
;175:			}
LABELV $156
line 169
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $155
line 176
;176:			continue;
ADDRGP4 $116
JUMPV
LABELV $152
line 177
;177:		} else if ( !Q_stricmp( token, "sex" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $163
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $161
line 178
;178:			token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20068
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20068
INDIRP4
ASGNP4
line 179
;179:			if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $164
line 180
;180:				break;
ADDRGP4 $117
JUMPV
LABELV $164
line 182
;181:			}
;182:			if ( token[0] == 'f' || token[0] == 'F' ) {
ADDRLP4 20072
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 102
EQI4 $168
ADDRLP4 20072
INDIRI4
CNSTI4 70
NEI4 $166
LABELV $168
line 183
;183:				ci->gender = GENDER_FEMALE;
ADDRFP4 4
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 1
ASGNI4
line 184
;184:			} else if ( token[0] == 'n' || token[0] == 'N' ) {
ADDRGP4 $116
JUMPV
LABELV $166
ADDRLP4 20076
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20076
INDIRI4
CNSTI4 110
EQI4 $171
ADDRLP4 20076
INDIRI4
CNSTI4 78
NEI4 $169
LABELV $171
line 185
;185:				ci->gender = GENDER_NEUTER;
ADDRFP4 4
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 2
ASGNI4
line 186
;186:			} else {
ADDRGP4 $116
JUMPV
LABELV $169
line 187
;187:				ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 0
ASGNI4
line 188
;188:			}
line 189
;189:			continue;
ADDRGP4 $116
JUMPV
LABELV $161
line 190
;190:		} else if ( !Q_stricmp( token, "fixedlegs" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $174
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $172
line 191
;191:			ci->fixedlegs = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 684
ADDP4
CNSTI4 1
ASGNI4
line 192
;192:			continue;
ADDRGP4 $116
JUMPV
LABELV $172
line 193
;193:		} else if ( !Q_stricmp( token, "fixedtorso" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $175
line 194
;194:			ci->fixedtorso = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 195
;195:			continue;
ADDRGP4 $116
JUMPV
LABELV $175
line 199
;196:		}
;197:
;198:		// if it is a number, start parsing animations
;199:		if ( token[0] >= '0' && token[0] <= '9' ) {
ADDRLP4 20076
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20076
INDIRI4
CNSTI4 48
LTI4 $178
ADDRLP4 20076
INDIRI4
CNSTI4 57
GTI4 $178
line 200
;200:			text_p = prev;	// unget the token
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 201
;201:			break;
ADDRGP4 $117
JUMPV
LABELV $178
line 203
;202:		}
;203:		Com_Printf( "unknown token '%s' is %s\n", token, filename );
ADDRGP4 $180
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 204
;204:	}
LABELV $116
line 134
ADDRGP4 $115
JUMPV
LABELV $117
line 207
;205:
;206:	// read information for each frame
;207:	for ( i = 0 ; i < MAX_ANIMATIONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $181
line 209
;208:
;209:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 210
;210:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $185
line 211
;211:			if( i >= TORSO_GETFLAG && i <= TORSO_NEGATIVE ) {
ADDRLP4 4
INDIRI4
CNSTI4 25
LTI4 $183
ADDRLP4 4
INDIRI4
CNSTI4 30
GTI4 $183
line 212
;212:				animations[i].firstFrame = animations[TORSO_GESTURE].firstFrame;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 213
;213:				animations[i].frameLerp = animations[TORSO_GESTURE].frameLerp;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 214
;214:				animations[i].initialLerp = animations[TORSO_GESTURE].initialLerp;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 215
;215:				animations[i].loopFrames = animations[TORSO_GESTURE].loopFrames;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
line 216
;216:				animations[i].numFrames = animations[TORSO_GESTURE].numFrames;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 217
;217:				animations[i].reversed = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 218
;218:				animations[i].flipflop = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 219
;219:				continue;
ADDRGP4 $182
JUMPV
line 221
;220:			}
;221:			break;
LABELV $185
line 223
;222:		}
;223:		animations[i].firstFrame = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20052
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 20052
INDIRI4
ASGNI4
line 225
;224:		// leg only frames are adjusted to not count the upper body only frames
;225:		if ( i == LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $189
line 226
;226:			skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
ADDRLP4 24
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
SUBI4
ASGNI4
line 227
;227:		}
LABELV $189
line 228
;228:		if ( i >= LEGS_WALKCR && i<TORSO_GETFLAG) {
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $191
ADDRLP4 4
INDIRI4
CNSTI4 25
GEI4 $191
line 229
;229:			animations[i].firstFrame -= skip;
ADDRLP4 20060
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20060
INDIRP4
ADDRLP4 20060
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 230
;230:		}
LABELV $191
line 232
;231:
;232:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 233
;233:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $193
line 234
;234:			break;
ADDRGP4 $183
JUMPV
LABELV $193
line 236
;235:		}
;236:		animations[i].numFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20064
INDIRI4
ASGNI4
line 238
;237:
;238:		animations[i].reversed = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 239
;239:		animations[i].flipflop = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 241
;240:		// if numFrames is negative the animation is reversed
;241:		if (animations[i].numFrames < 0) {
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $195
line 242
;242:			animations[i].numFrames = -animations[i].numFrames;
ADDRLP4 20068
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 20068
INDIRP4
ADDRLP4 20068
INDIRP4
INDIRI4
NEGI4
ASGNI4
line 243
;243:			animations[i].reversed = qtrue;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 244
;244:		}
LABELV $195
line 246
;245:
;246:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20068
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20068
INDIRP4
ASGNP4
line 247
;247:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $197
line 248
;248:			break;
ADDRGP4 $183
JUMPV
LABELV $197
line 250
;249:		}
;250:		animations[i].loopFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20072
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20072
INDIRI4
ASGNI4
line 252
;251:
;252:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20076
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20076
INDIRP4
ASGNP4
line 253
;253:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $199
line 254
;254:			break;
ADDRGP4 $183
JUMPV
LABELV $199
line 256
;255:		}
;256:		fps = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20080
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20080
INDIRF4
ASGNF4
line 257
;257:		if ( fps == 0 ) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $201
line 258
;258:			fps = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 259
;259:		}
LABELV $201
line 260
;260:		animations[i].frameLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 261
;261:		animations[i].initialLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 262
;262:	}
LABELV $182
line 207
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $181
LABELV $183
line 264
;263:
;264:	if ( i != MAX_ANIMATIONS ) {
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $203
line 265
;265:		CG_Printf( "Error parsing animation file: %s\n", filename );
ADDRGP4 $205
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 266
;266:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $109
JUMPV
LABELV $203
line 270
;267:	}
;268:
;269:	// crouch backward animation
;270:	memcpy(&animations[LEGS_BACKCR], &animations[LEGS_WALKCR], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 896
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 271
;271:	animations[LEGS_BACKCR].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 1
ASGNI4
line 273
;272:	// walk backward animation
;273:	memcpy(&animations[LEGS_BACKWALK], &animations[LEGS_WALK], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 924
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 392
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 274
;274:	animations[LEGS_BACKWALK].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 1
ASGNI4
line 276
;275:	// flag moving fast
;276:	animations[FLAG_RUN].firstFrame = 0;
ADDRLP4 8
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 0
ASGNI4
line 277
;277:	animations[FLAG_RUN].numFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 16
ASGNI4
line 278
;278:	animations[FLAG_RUN].loopFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 960
ADDP4
CNSTI4 16
ASGNI4
line 279
;279:	animations[FLAG_RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 964
ADDP4
CNSTI4 66
ASGNI4
line 280
;280:	animations[FLAG_RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 66
ASGNI4
line 281
;281:	animations[FLAG_RUN].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 0
ASGNI4
line 283
;282:	// flag not moving or moving slowly
;283:	animations[FLAG_STAND].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 16
ASGNI4
line 284
;284:	animations[FLAG_STAND].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 5
ASGNI4
line 285
;285:	animations[FLAG_STAND].loopFrames = 0;
ADDRLP4 8
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 286
;286:	animations[FLAG_STAND].frameLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 50
ASGNI4
line 287
;287:	animations[FLAG_STAND].initialLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 50
ASGNI4
line 288
;288:	animations[FLAG_STAND].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 1000
ADDP4
CNSTI4 0
ASGNI4
line 290
;289:	// flag speeding up
;290:	animations[FLAG_STAND2RUN].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 16
ASGNI4
line 291
;291:	animations[FLAG_STAND2RUN].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 5
ASGNI4
line 292
;292:	animations[FLAG_STAND2RUN].loopFrames = 1;
ADDRLP4 8
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 1
ASGNI4
line 293
;293:	animations[FLAG_STAND2RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1020
ADDP4
CNSTI4 66
ASGNI4
line 294
;294:	animations[FLAG_STAND2RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1024
ADDP4
CNSTI4 66
ASGNI4
line 295
;295:	animations[FLAG_STAND2RUN].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 299
;296:	//
;297:	// new anims changes
;298:	//
;299:	animations[TORSO_GETFLAG].flipflop = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 300
;300:	animations[TORSO_GUARDBASE].flipflop = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 301
;301:	animations[TORSO_PATROL].flipflop = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 1
ASGNI4
line 302
;302:	animations[TORSO_AFFIRMATIVE].flipflop = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 836
ADDP4
CNSTI4 1
ASGNI4
line 303
;303:	animations[TORSO_NEGATIVE].flipflop = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 864
ADDP4
CNSTI4 1
ASGNI4
line 305
;304:	//
;305:	return qtrue;
CNSTI4 1
RETI4
LABELV $109
endproc CG_ParseAnimationFile 20084 12
proc CG_ParseEyesFile 20052 12
line 315
;306:}
;307:
;308:/*
;309:======================
;310:CG_ParseEyesFile
;311:
;312:Read eyes definitions.  Maybe this should be done engine-side for mod compatiblity? :S
;313:======================
;314:*/
;315:static qboolean	CG_ParseEyesFile( const char *filename, clientInfo_t *ci ) {
line 325
;316:	char		*text_p, *prev;
;317:	int			len;
;318:	int			i;
;319:	char		*token;
;320:	float		fps;
;321:	int			skip;
;322:	char		text[20000];
;323:	fileHandle_t	f;
;324:	// load the file
;325:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20020
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20032
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20032
INDIRI4
ASGNI4
line 326
;326:	if ( len <= 0 ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
GTI4 $207
line 327
;327:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $207
line 329
;328:	}
;329:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $209
line 330
;330:		CG_Printf( "File %s too long\n", filename );
ADDRGP4 $114
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 331
;331:		trap_FS_FCloseFile( f );
ADDRLP4 20020
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 332
;332:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $209
line 334
;333:	}
;334:	trap_FS_Read( text, len, f );
ADDRLP4 20
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20020
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 335
;335:	text[len] = 0;
ADDRLP4 16
INDIRI4
ADDRLP4 20
ADDP4
CNSTI1 0
ASGNI1
line 336
;336:	trap_FS_FCloseFile( f );
ADDRLP4 20020
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 339
;337:
;338:	// parse the text
;339:	text_p = text;
ADDRLP4 8
ADDRLP4 20
ASGNP4
line 340
;340:	skip = 0;	// quite the compiler warning
ADDRLP4 20024
CNSTI4 0
ASGNI4
ADDRGP4 $212
JUMPV
LABELV $211
line 344
;341:
;342:
;343:	// read optional parameters
;344:	while ( 1 ) {
line 345
;345:		prev = text_p;	// so we can unget
ADDRLP4 12
ADDRLP4 8
INDIRP4
ASGNP4
line 346
;346:		token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20036
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20036
INDIRP4
ASGNP4
line 347
;347:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $214
line 348
;348:			break;
ADDRGP4 $213
JUMPV
LABELV $214
line 352
;349:		}
;350:
;351:
;352:		if ( !Q_stricmp( token, "eyes" ) ) {	// leilei - EYES
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 20040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20040
INDIRI4
CNSTI4 0
NEI4 $213
line 353
;353:			for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $218
line 354
;354:				token = COM_Parse( &text_p );
ADDRLP4 8
ARGP4
ADDRLP4 20044
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20044
INDIRP4
ASGNP4
line 355
;355:				if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $222
line 356
;356:					break;
ADDRGP4 $212
JUMPV
LABELV $222
line 358
;357:				}
;358:				ci->eyepos[i] = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20048
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1928
ADDP4
ADDP4
ADDRLP4 20048
INDIRF4
ASGNF4
line 359
;359:			}
LABELV $219
line 353
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $218
line 360
;360:			continue;
line 362
;361:		}
;362:		break;
LABELV $212
line 344
ADDRGP4 $211
JUMPV
LABELV $213
line 365
;363:	}
;364:
;365:	return qtrue;
CNSTI4 1
RETI4
LABELV $206
endproc CG_ParseEyesFile 20052 12
proc CG_FileExists 8 12
line 374
;366:}
;367:
;368:
;369:/*
;370:==========================
;371:CG_FileExists
;372:==========================
;373:*/
;374:static qboolean	CG_FileExists(const char *filename) {
line 377
;375:	int len;
;376:
;377:	len = trap_FS_FOpenFile( filename, NULL, FS_READ );
ADDRFP4 0
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
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 378
;378:	if (len>0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $225
line 379
;379:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $224
JUMPV
LABELV $225
line 381
;380:	}
;381:	return qfalse;
CNSTI4 0
RETI4
LABELV $224
endproc CG_FileExists 8 12
proc CG_RegisterClientSkin 84 20
line 389
;382:}
;383:
;384:/*
;385:==========================
;386:CG_RegisterClientSkin
;387:==========================
;388:*/
;389:static qboolean	CG_RegisterClientSkin( clientInfo_t *ci, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName, const char *legsModelName, const char *legsSkinName ) {
line 392
;390:	char filename[MAX_QPATH];
;391:
;392:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower_%s.skin", modelName, legsSkinName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $228
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 393
;393:	ci->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 394
;394:	if (!ci->legsSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CNSTI4 0
NEI4 $229
line 395
;395:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower_%s", modelName, legsSkinName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $231
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 396
;396:		ci->legsShader = trap_R_RegisterShader( filename );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 397
;397:	}
LABELV $229
line 399
;398:
;399:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper_%s.skin", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $232
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
line 400
;400:	ci->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 401
;401:	if (!ci->torsoSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
NEI4 $233
line 402
;402:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper_%s", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $235
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
line 403
;403:		ci->torsoShader = trap_R_RegisterShader( filename );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 404
;404:	}
LABELV $233
line 406
;405:	
;406:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/head_%s.skin", headModelName, headSkinName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $236
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 407
;407:	ci->headSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 408
;408:	if (!ci->headSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $237
line 409
;409:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/head_%s", headModelName, headSkinName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $239
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 410
;410:		ci->torsoShader = trap_R_RegisterShader( filename );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 411
;411:	}
LABELV $237
line 414
;412:
;413:	// if one skin loaded
;414:	if ( !ci->legsSkin && !ci->torsoSkin && !ci->headSkin && !ci->legsShader && !ci->torsoShader && !ci->headShader ) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $240
ADDRLP4 76
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $240
ADDRLP4 76
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $240
ADDRLP4 76
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $240
ADDRLP4 76
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $240
ADDRLP4 76
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $240
line 415
;415:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $227
JUMPV
LABELV $240
line 417
;416:	}
;417:return qtrue;
CNSTI4 1
RETI4
LABELV $227
endproc CG_RegisterClientSkin 84 20
proc CG_RegisterClientModelname 292 28
line 425
;418:}
;419:
;420:/*
;421:==========================
;422:CG_RegisterClientModelname
;423:==========================
;424:*/
;425:static qboolean CG_RegisterClientModelname( clientInfo_t *ci, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName, const char *teamName, const char *legsModelName, const char *legsSkinName ) {
line 430
;426:	char	filename[MAX_QPATH*2];
;427:	const char		*headName;
;428:	char newTeamName[MAX_QPATH*2];
;429:
;430:	if ( headModelName[0] == '\0' ) {
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $243
line 431
;431:		headName = modelName;
ADDRLP4 128
ADDRFP4 4
INDIRP4
ASGNP4
line 432
;432:	}
ADDRGP4 $244
JUMPV
LABELV $243
line 433
;433:	else {
line 434
;434:		headName = headModelName;
ADDRLP4 128
ADDRFP4 12
INDIRP4
ASGNP4
line 435
;435:	}
LABELV $244
line 436
;436:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $245
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 437
;437:	ci->legsModel = trap_R_RegisterModel_MiTech( filename );
ADDRLP4 0
ARGP4
ADDRLP4 260
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 260
INDIRI4
ASGNI4
line 438
;438:	if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
NEI4 $246
line 439
;439:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $248
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 440
;440:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $242
JUMPV
LABELV $246
line 443
;441:	}
;442:
;443:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $249
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 444
;444:	ci->torsoModel = trap_R_RegisterModel_MiTech( filename );
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 445
;445:	if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 0
NEI4 $250
line 446
;446:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $248
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 447
;447:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $242
JUMPV
LABELV $250
line 450
;448:	}
;449:
;450:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", headName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $252
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 451
;451:	ci->headModel = trap_R_RegisterModel_MiTech( filename );
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterModel_MiTech
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 452
;452:	if ( !ci->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $253
line 453
;453:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $248
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 454
;454:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $242
JUMPV
LABELV $253
line 458
;455:	}
;456:
;457:	// if any skins failed to load, return failure
;458:	if ( !CG_RegisterClientSkin( ci, modelName, skinName, headName, headSkinName, legsModelName, legsSkinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $255
line 459
;459:		Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", newTeamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $257
ARGP4
ADDRLP4 132
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 460
;460:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $242
JUMPV
LABELV $255
line 465
;461:	}
;462:	
;463:
;464:	// load the animations
;465:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $258
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 466
;466:	if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $259
line 467
;467:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $261
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 468
;468:		if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $262
line 469
;469:			Com_Printf( "Failed to load animation file %s\n", filename );
ADDRGP4 $264
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 470
;470:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $242
JUMPV
LABELV $262
line 472
;471:		}
;472:	}
LABELV $259
line 475
;473:
;474:	// leilei - load eyes
;475:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/eyes.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $265
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 476
;476:	if ( !CG_ParseEyesFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 CG_ParseEyesFile
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $266
line 478
;477:		//	Com_Printf( "No eyes for %s\n", filename );
;478:	}
LABELV $266
line 480
;479:	
;480:	if(!ci->modelIcon){
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
NEI4 $268
line 481
;481:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/icon_%s.tga", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $270
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
line 482
;482:	if(CG_FileExists(filename)){
ADDRLP4 0
ARGP4
ADDRLP4 284
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $271
line 483
;483:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 288
INDIRI4
ASGNI4
line 484
;484:	}
LABELV $271
line 485
;485:	}
LABELV $268
line 486
;486:	if(!ci->modelIcon){
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
NEI4 $273
line 487
;487:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/icon_%s.png", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $275
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
line 488
;488:	if(CG_FileExists(filename)){
ADDRLP4 0
ARGP4
ADDRLP4 284
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $276
line 489
;489:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 288
INDIRI4
ASGNI4
line 490
;490:	}
LABELV $276
line 491
;491:	}
LABELV $273
line 492
;492:	if(!ci->modelIcon){
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
NEI4 $278
line 493
;493:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/icon_%s.jpg", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $280
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
line 494
;494:	if(CG_FileExists(filename)){
ADDRLP4 0
ARGP4
ADDRLP4 284
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $281
line 495
;495:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 288
INDIRI4
ASGNI4
line 496
;496:	}
LABELV $281
line 497
;497:	}
LABELV $278
line 498
;498:	if(!ci->modelIcon){
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
NEI4 $283
line 499
;499:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/icon_%s.bmp", modelName, skinName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $285
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
line 500
;500:	if(CG_FileExists(filename)){
ADDRLP4 0
ARGP4
ADDRLP4 284
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $286
line 501
;501:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 288
INDIRI4
ASGNI4
line 502
;502:	}
LABELV $286
line 503
;503:	}
LABELV $283
line 505
;504:
;505:	if ( !ci->modelIcon ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
NEI4 $288
line 506
;506:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $242
JUMPV
LABELV $288
line 509
;507:	}
;508:
;509:	return qtrue;
CNSTI4 1
RETI4
LABELV $242
endproc CG_RegisterClientModelname 292 28
proc CG_ReloadClientModelname 264 28
line 517
;510:}
;511:
;512:/*
;513:==========================
;514:CG_ReloadClientModelname
;515:==========================
;516:*/
;517:static qboolean CG_ReloadClientModelname( clientInfo_t *ci, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName, const char *teamName, const char *legsModelName, const char *legsSkinName ) {
line 522
;518:	char	filename[MAX_QPATH*2];
;519:	const char		*headName;
;520:	char newTeamName[MAX_QPATH*2];
;521:
;522:	if ( headModelName[0] == '\0' ) {
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $291
line 523
;523:		headName = modelName;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 524
;524:	}
ADDRGP4 $292
JUMPV
LABELV $291
line 525
;525:	else {
line 526
;526:		headName = headModelName;
ADDRLP4 0
ADDRFP4 12
INDIRP4
ASGNP4
line 527
;527:	}
LABELV $292
line 530
;528:
;529:	// if any skins failed to load, return failure
;530:	if ( !CG_RegisterClientSkin( ci, modelName, skinName, headName, headSkinName, legsModelName, legsSkinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $293
line 531
;531:		Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", newTeamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $257
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 532
;532:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $290
JUMPV
LABELV $293
line 535
;533:	}
;534:
;535:	if ( !ci->modelIcon ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
NEI4 $295
line 536
;536:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $290
JUMPV
LABELV $295
line 539
;537:	}
;538:
;539:	return qtrue;
CNSTI4 1
RETI4
LABELV $290
endproc CG_ReloadClientModelname 264 28
proc CG_ColorFromString 20 4
line 547
;540:}
;541:
;542:/*
;543:====================
;544:CG_ColorFromString
;545:====================
;546:*/
;547:static void CG_ColorFromString( const char *v, vec3_t color ) {
line 550
;548:	int val;
;549:
;550:	VectorClear( color );
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRF4
ASGNF4
line 552
;551:
;552:	val = atoi( v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 554
;553:
;554:	if ( val < 1 || val > 7 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $300
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $298
LABELV $300
line 555
;555:		VectorSet( color, 1, 1, 1 );
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 556
;556:		return;
ADDRGP4 $297
JUMPV
LABELV $298
line 559
;557:	}
;558:
;559:	if ( val & 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $301
line 560
;560:		color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 561
;561:	}
LABELV $301
line 562
;562:	if ( val & 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $303
line 563
;563:		color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 564
;564:	}
LABELV $303
line 565
;565:	if ( val & 4 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $305
line 566
;566:		color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
line 567
;567:	}
LABELV $305
line 568
;568:}
LABELV $297
endproc CG_ColorFromString 20 4
proc CG_LoadClientInfo 148 32
line 578
;569:
;570:/*
;571:===================
;572:CG_LoadClientInfo
;573:
;574:Load it now, taking the disk hits.
;575:This will usually be deferred to a safe time
;576:===================
;577:*/
;578:static void CG_LoadClientInfo( int clientNum, clientInfo_t *ci ) {
line 585
;579:	const char	*dir, *fallback;
;580:	int			i, modelloaded;
;581:	const char	*s;
;582:	char		teamname[MAX_QPATH];
;583://	char		redTeam[MAX_QPATH];
;584:
;585:	teamname[0] = 0;
ADDRLP4 20
CNSTI1 0
ASGNI1
line 587
;586:
;587:	modelloaded = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 588
;588:	if ( !CG_RegisterClientModelname( ci, ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname, ci->legsModelName, ci->legsSkinName ) ) {
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 228
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 292
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 356
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 420
ADDP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 484
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $308
line 591
;589:
;590:		// fall back to default team name
;591:		if( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $310
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $310
line 593
;592:			// keep skin name
;593:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $314
line 594
;594:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname) );
ADDRLP4 20
ARGP4
ADDRGP4 $316
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 595
;595:			} else {
ADDRGP4 $315
JUMPV
LABELV $314
line 596
;596:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname) );
ADDRLP4 20
ARGP4
ADDRGP4 $317
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 597
;597:			}
LABELV $315
line 598
;598:			if ( !CG_RegisterClientModelname( ci, DEFAULT_TEAM_MODEL, ci->skinName, DEFAULT_TEAM_HEAD, ci->skinName, teamname, "default", "default" ) ) {
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 100
ADDRGP4 $127
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $311
line 599
;599:			}
line 600
;600:		} else {
ADDRGP4 $311
JUMPV
LABELV $310
line 601
;601:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, "default", DEFAULT_MODEL, "default", teamname, "default", "default" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 $320
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 $127
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $322
line 602
;602:			}
LABELV $322
line 603
;603:		}
LABELV $311
line 604
;604:		modelloaded = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 605
;605:	}
LABELV $308
line 607
;606:
;607:	ci->newAnims = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 608
;608:	if ( ci->torsoModel ) {
ADDRFP4 4
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 0
EQI4 $324
line 611
;609:		orientation_t tag;
;610:		// if the torso model has the "tag_flag"
;611:		if ( trap_R_LerpTag( &tag, ci->torsoModel, 0, 0, 1, "tag_flag" ) ) {
ADDRLP4 92
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 140
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 $328
ARGP4
ADDRLP4 144
ADDRGP4 trap_R_LerpTag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $326
line 612
;612:			ci->newAnims = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 613
;613:		}
LABELV $326
line 614
;614:	}
LABELV $324
line 617
;615:
;616:	// sounds
;617:	dir = ci->modelName;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 228
ADDP4
ASGNP4
line 618
;618:	fallback = (cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) ? DEFAULT_TEAM_MODEL : DEFAULT_MODEL;
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $332
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $332
ADDRLP4 92
ADDRGP4 $320
ASGNP4
ADDRGP4 $333
JUMPV
LABELV $332
ADDRLP4 92
ADDRGP4 $320
ASGNP4
LABELV $333
ADDRLP4 16
ADDRLP4 92
INDIRP4
ASGNP4
line 620
;619:
;620:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $334
line 621
;621:		s = cg_customSoundNames[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 622
;622:		if ( !s ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $338
line 623
;623:			break;
ADDRGP4 $336
JUMPV
LABELV $338
line 625
;624:		}
;625:		ci->sounds[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1796
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 627
;626:		// if the model didn't load use the sounds of the default model
;627:		if (modelloaded) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $340
line 628
;628:			ci->sounds[i] = trap_S_RegisterSound_MiTech( va("sound/player/%s/%s", dir, s + 1), qfalse );
ADDRGP4 $342
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 100
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1796
ADDP4
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 629
;629:		}
LABELV $340
line 630
;630:		if ( !ci->sounds[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1796
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $343
line 631
;631:			ci->sounds[i] = trap_S_RegisterSound_MiTech( va("sound/player/%s/%s", fallback, s + 1), qfalse );
ADDRGP4 $342
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 100
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 1796
ADDP4
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 632
;632:		}
LABELV $343
line 633
;633:	}
LABELV $335
line 620
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $334
LABELV $336
line 635
;634:
;635:	ci->deferred = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 639
;636:
;637:	// reset any existing players and bodies, because they might be in bad
;638:	// frames for this new model
;639:	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $345
line 640
;640:		if ( cg_entities[i].currentState.clientNum == clientNum
ADDRLP4 96
CNSTI4 928
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 96
INDIRI4
ADDRGP4 cg_entities+180
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $349
ADDRLP4 96
INDIRI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $349
line 641
;641:			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
line 642
;642:			CG_ResetPlayerEntity( &cg_entities[i] );
CNSTI4 928
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 643
;643:		}
LABELV $349
line 644
;644:	}
LABELV $346
line 639
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4096
LTI4 $345
line 645
;645:}
LABELV $307
endproc CG_LoadClientInfo 148 32
proc CG_ReloadClientInfo 108 32
line 655
;646:
;647:/*
;648:===================
;649:CG_ReloadClientInfo
;650:
;651:Load it now, taking the disk hits.
;652:This will usually be deferred to a safe time
;653:===================
;654:*/
;655:static void CG_ReloadClientInfo( int clientNum, clientInfo_t *ci ) {
line 662
;656:	const char	*dir, *fallback;
;657:	int			i, modelloaded;
;658:	const char	*s;
;659:	char		teamname[MAX_QPATH];
;660://	char		redTeam[MAX_QPATH];
;661:
;662:	teamname[0] = 0;
ADDRLP4 0
CNSTI1 0
ASGNI1
line 664
;663:
;664:	modelloaded = qtrue;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 665
;665:	if ( !CG_ReloadClientModelname( ci, ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname, ci->legsModelName, ci->legsSkinName ) ) {
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 228
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 292
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 356
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 420
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 484
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 548
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 CG_ReloadClientModelname
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $354
line 668
;666:
;667:		// fall back to default team name
;668:		if( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $356
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $356
line 670
;669:			// keep skin name
;670:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $360
line 671
;671:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname) );
ADDRLP4 0
ARGP4
ADDRGP4 $316
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 672
;672:			} else {
ADDRGP4 $361
JUMPV
LABELV $360
line 673
;673:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname) );
ADDRLP4 0
ARGP4
ADDRGP4 $317
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 674
;674:			}
LABELV $361
line 675
;675:			if ( !CG_ReloadClientModelname( ci, DEFAULT_TEAM_MODEL, ci->skinName, DEFAULT_TEAM_HEAD, ci->skinName, teamname, "default", "default" ) ) {
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 $127
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_ReloadClientModelname
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $357
line 676
;676:			}
line 677
;677:		} else {
ADDRGP4 $357
JUMPV
LABELV $356
line 678
;678:			if ( !CG_ReloadClientModelname( ci, DEFAULT_MODEL, "default", DEFAULT_MODEL, "default", teamname, "default", "default" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 $320
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 $127
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 CG_ReloadClientModelname
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $364
line 679
;679:			}
LABELV $364
line 680
;680:		}
LABELV $357
line 681
;681:		modelloaded = qfalse;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 682
;682:	}
LABELV $354
line 683
;683:}
LABELV $353
endproc CG_ReloadClientInfo 108 32
proc CG_CopyClientInfoModel 68 12
line 690
;684:
;685:/*
;686:======================
;687:CG_CopyClientInfoModel
;688:======================
;689:*/
;690:static void CG_CopyClientInfoModel( clientInfo_t *from, clientInfo_t *to ) {
line 691
;691:	VectorCopy( from->headOffset, to->headOffset );
ADDRLP4 0
CNSTI4 692
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 692
;692:	VectorCopy( from->eyepos, to->eyepos );
ADDRLP4 4
CNSTI4 1928
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 693
;693:	to->footsteps = from->footsteps;
ADDRLP4 8
CNSTI4 704
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 694
;694:	to->gender = from->gender;
ADDRLP4 12
CNSTI4 708
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 696
;695:
;696:	to->legsModel = from->legsModel;
ADDRLP4 16
CNSTI4 712
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 697
;697:	to->legsSkin = from->legsSkin;
ADDRLP4 20
CNSTI4 716
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 698
;698:	to->legsShader = from->legsShader;
ADDRLP4 24
CNSTI4 720
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 699
;699:	to->torsoModel = from->torsoModel;
ADDRLP4 28
CNSTI4 724
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 700
;700:	to->torsoSkin = from->torsoSkin;
ADDRLP4 32
CNSTI4 728
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 701
;701:	to->torsoShader = from->torsoShader;
ADDRLP4 36
CNSTI4 732
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 702
;702:	to->headModel = from->headModel;
ADDRLP4 40
CNSTI4 736
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 703
;703:	to->headSkin = from->headSkin;
ADDRLP4 44
CNSTI4 740
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 704
;704:	to->headShader = from->headShader;
ADDRLP4 48
CNSTI4 744
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 705
;705:	to->modelIcon = from->modelIcon;
ADDRLP4 52
CNSTI4 756
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 707
;706:
;707:	to->newAnims = from->newAnims;
ADDRLP4 56
CNSTI4 680
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 709
;708:
;709:	memcpy( to->animations, from->animations, sizeof( to->animations ) );
ADDRLP4 60
CNSTI4 760
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
CNSTI4 1036
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 710
;710:	memcpy( to->sounds, from->sounds, sizeof( to->sounds ) );
ADDRLP4 64
CNSTI4 1796
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 711
;711:}
LABELV $366
endproc CG_CopyClientInfoModel 68 12
proc CG_ScanForExistingClientInfo 60 8
line 718
;712:
;713:/*
;714:======================
;715:CG_ScanForExistingClientInfo
;716:======================
;717:*/
;718:static qboolean CG_ScanForExistingClientInfo( clientInfo_t *ci ) {
line 722
;719:	int		i;
;720:	clientInfo_t	*match;
;721:
;722:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $371
JUMPV
LABELV $368
line 723
;723:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1944
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 724
;724:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $374
line 725
;725:			continue;
ADDRGP4 $369
JUMPV
LABELV $374
line 727
;726:		}
;727:		if ( match->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
EQI4 $376
line 728
;728:			continue;
ADDRGP4 $369
JUMPV
LABELV $376
line 730
;729:		}
;730:		if ( !Q_stricmp( ci->modelName, match->modelName )
ADDRLP4 8
CNSTI4 228
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $378
ADDRLP4 16
CNSTI4 292
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $378
ADDRLP4 24
CNSTI4 356
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $378
ADDRLP4 32
CNSTI4 420
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $378
ADDRLP4 40
CNSTI4 644
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $378
ADDRLP4 48
CNSTI4 612
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $378
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $383
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $383
ADDRLP4 56
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
NEI4 $378
LABELV $383
line 736
;731:			&& !Q_stricmp( ci->skinName, match->skinName )
;732:			&& !Q_stricmp( ci->headModelName, match->headModelName )
;733:			&& !Q_stricmp( ci->headSkinName, match->headSkinName )
;734:			&& !Q_stricmp( ci->blueTeam, match->blueTeam )
;735:			&& !Q_stricmp( ci->redTeam, match->redTeam )
;736:			&& (cgs.gametype < GT_TEAM || cgs.ffa_gt==1 || ci->team == match->team) ) {
line 739
;737:			// this clientinfo is identical, so use it's handles
;738:
;739:			ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 741
;740:
;741:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 743
;742:
;743:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $367
JUMPV
LABELV $378
line 745
;744:		}
;745:	}
LABELV $369
line 722
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $371
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $368
line 748
;746:
;747:	// nothing matches, so defer the load
;748:	return qfalse;
CNSTI4 0
RETI4
LABELV $367
endproc CG_ScanForExistingClientInfo 60 8
proc CG_SetDeferredClientInfo 36 8
line 759
;749:}
;750:
;751:/*
;752:======================
;753:CG_SetDeferredClientInfo
;754:
;755:We aren't going to load it now, so grab some other
;756:client's info to use until we have some spare time.
;757:======================
;758:*/
;759:static void CG_SetDeferredClientInfo( int clientNum, clientInfo_t *ci ) {
line 765
;760:	int		i;
;761:	clientInfo_t	*match;
;762:
;763:	// if someone else is already the same models and skins we
;764:	// can just load the client info
;765:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $388
JUMPV
LABELV $385
line 766
;766:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1944
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 767
;767:		if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $393
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $391
LABELV $393
line 768
;768:			continue;
ADDRGP4 $386
JUMPV
LABELV $391
line 770
;769:		}
;770:		if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRLP4 16
CNSTI4 292
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $399
ADDRLP4 24
CNSTI4 228
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $399
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $394
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $394
ADDRLP4 32
CNSTI4 68
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $394
LABELV $399
line 774
;771:			 Q_stricmp( ci->modelName, match->modelName ) ||
;772://			 Q_stricmp( ci->headModelName, match->headModelName ) ||
;773://			 Q_stricmp( ci->headSkinName, match->headSkinName ) ||
;774:			 (cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1 && ci->team != match->team) ) {
line 775
;775:			continue;
ADDRGP4 $386
JUMPV
LABELV $394
line 778
;776:		}
;777:		// just load the real info cause it uses the same models and skins
;778:		CG_LoadClientInfo( clientNum, ci );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 779
;779:		return;
ADDRGP4 $384
JUMPV
LABELV $386
line 765
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $388
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $385
line 783
;780:	}
;781:
;782:	// if we are in teamplay, only grab a model if the skin is correct
;783:	if ( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $400
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $400
line 784
;784:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $407
JUMPV
LABELV $404
line 785
;785:			match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1944
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 786
;786:			if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $412
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $410
LABELV $412
line 787
;787:				continue;
ADDRGP4 $405
JUMPV
LABELV $410
line 789
;788:			}
;789:			if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRLP4 16
CNSTI4 292
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $417
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $413
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $413
ADDRLP4 24
CNSTI4 68
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
EQI4 $413
LABELV $417
line 790
;790:				(cgs.gametype >= GT_TEAM && cgs.ffa_gt != 1 && ci->team != match->team) ) {
line 791
;791:				continue;
ADDRGP4 $405
JUMPV
LABELV $413
line 793
;792:			}
;793:			ci->deferred = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 794
;794:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 795
;795:			return;
ADDRGP4 $384
JUMPV
LABELV $405
line 784
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $407
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $404
line 801
;796:		}
;797:		// load the full model, because we don't ever want to show
;798:		// an improper team skin.  This will cause a hitch for the first
;799:		// player, when the second enters.  Combat shouldn't be going on
;800:		// yet, so it shouldn't matter
;801:		CG_LoadClientInfo( clientNum, ci );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 802
;802:		return;
ADDRGP4 $384
JUMPV
LABELV $400
line 806
;803:	}
;804:
;805:	// find the first valid clientinfo and grab its stuff
;806:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $421
JUMPV
LABELV $418
line 807
;807:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1944
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 808
;808:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $424
line 809
;809:			continue;
ADDRGP4 $419
JUMPV
LABELV $424
line 812
;810:		}
;811:
;812:		ci->deferred = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 813
;813:		CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 814
;814:		return;
ADDRGP4 $384
JUMPV
LABELV $419
line 806
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $421
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $418
line 818
;815:	}
;816:
;817:	// we should never get here...
;818:	CG_Printf( "CG_SetDeferredClientInfo: no valid clients!\n" );
ADDRGP4 $426
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 820
;819:
;820:	CG_LoadClientInfo( clientNum, ci );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 821
;821:}
LABELV $384
endproc CG_SetDeferredClientInfo 36 8
export CG_NewClientInfo
proc CG_NewClientInfo 2188 12
line 829
;822:
;823:
;824:/*
;825:======================
;826:CG_NewClientInfo
;827:======================
;828:*/
;829:void CG_NewClientInfo( int clientNum ) {
line 836
;830:	clientInfo_t *ci;
;831:	clientInfo_t newInfo;
;832:	const char	*configstring;
;833:	const char	*v;
;834:	char		*slash;
;835:
;836:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 1956
CNSTI4 1944
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 838
;837:
;838:	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
ADDRFP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 1960
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1948
ADDRLP4 1960
INDIRP4
ASGNP4
line 839
;839:	if ( !configstring[0] ) {
ADDRLP4 1948
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $429
line 840
;840:		memset( ci, 0, sizeof( *ci ) );
ADDRLP4 1956
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1944
ARGI4
ADDRGP4 memset
CALLP4
pop
line 841
;841:		return;		// player just left
ADDRGP4 $427
JUMPV
LABELV $429
line 846
;842:	}
;843:
;844:	// build into a temp buffer so the defer checks can use
;845:	// the old value
;846:	memset( &newInfo, 0, sizeof( newInfo ) );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1944
ARGI4
ADDRGP4 memset
CALLP4
pop
line 849
;847:
;848:	// isolate the player's name
;849:	v = Info_ValueForKey(configstring, "n");
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $431
ARGP4
ADDRLP4 1964
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1964
INDIRP4
ASGNP4
line 850
;850:	Q_strncpyz( newInfo.name, v, sizeof( newInfo.name ) );
ADDRLP4 4+4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 853
;851:
;852:	// colors
;853:	v = Info_ValueForKey( configstring, "c1" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $434
ARGP4
ADDRLP4 1968
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1968
INDIRP4
ASGNP4
line 854
;854:	CG_ColorFromString( v, newInfo.color1 );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+76
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 856
;855:
;856:	v = Info_ValueForKey( configstring, "c2" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 1972
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1972
INDIRP4
ASGNP4
line 857
;857:	CG_ColorFromString( v, newInfo.color2 );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+88
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 860
;858:
;859:	// flashlight and cpma skin mode
;860:	v = Info_ValueForKey( configstring, "hr" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 1976
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1976
INDIRP4
ASGNP4
line 861
;861:	newInfo.helred = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1980
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+100
ADDRLP4 1980
INDIRI4
ASGNI4
line 863
;862:
;863:	v = Info_ValueForKey( configstring, "hg" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $440
ARGP4
ADDRLP4 1984
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1984
INDIRP4
ASGNP4
line 864
;864:	newInfo.helgreen = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1988
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+104
ADDRLP4 1988
INDIRI4
ASGNI4
line 866
;865:
;866:	v = Info_ValueForKey( configstring, "hb" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 1992
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1992
INDIRP4
ASGNP4
line 867
;867:	newInfo.helblue = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1996
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+108
ADDRLP4 1996
INDIRI4
ASGNI4
line 869
;868:
;869:	v = Info_ValueForKey( configstring, "tr" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $444
ARGP4
ADDRLP4 2000
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2000
INDIRP4
ASGNP4
line 870
;870:	newInfo.tolred = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2004
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+112
ADDRLP4 2004
INDIRI4
ASGNI4
line 872
;871:
;872:	v = Info_ValueForKey( configstring, "tg" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 2008
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2008
INDIRP4
ASGNP4
line 873
;873:	newInfo.tolgreen = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2012
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+116
ADDRLP4 2012
INDIRI4
ASGNI4
line 875
;874:
;875:	v = Info_ValueForKey( configstring, "tb" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $448
ARGP4
ADDRLP4 2016
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2016
INDIRP4
ASGNP4
line 876
;876:	newInfo.tolblue = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2020
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+120
ADDRLP4 2020
INDIRI4
ASGNI4
line 878
;877:
;878:	v = Info_ValueForKey( configstring, "pr" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 2024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2024
INDIRP4
ASGNP4
line 879
;879:	newInfo.plred = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+124
ADDRLP4 2028
INDIRI4
ASGNI4
line 881
;880:
;881:	v = Info_ValueForKey( configstring, "pg" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $452
ARGP4
ADDRLP4 2032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2032
INDIRP4
ASGNP4
line 882
;882:	newInfo.plgreen = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+128
ADDRLP4 2036
INDIRI4
ASGNI4
line 884
;883:
;884:	v = Info_ValueForKey( configstring, "pb" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $454
ARGP4
ADDRLP4 2040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2040
INDIRP4
ASGNP4
line 885
;885:	newInfo.plblue = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+132
ADDRLP4 2044
INDIRI4
ASGNI4
line 887
;886:	
;887:	v = Info_ValueForKey( configstring, "pg_r" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $456
ARGP4
ADDRLP4 2048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2048
INDIRP4
ASGNP4
line 888
;888:	newInfo.pg_red = atof( v )*255;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2052
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4+136
CNSTF4 1132396544
ADDRLP4 2052
INDIRF4
MULF4
ASGNF4
line 890
;889:
;890:	v = Info_ValueForKey( configstring, "pg_g" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $458
ARGP4
ADDRLP4 2056
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2056
INDIRP4
ASGNP4
line 891
;891:	newInfo.pg_green = atof( v )*255;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4+140
CNSTF4 1132396544
ADDRLP4 2060
INDIRF4
MULF4
ASGNF4
line 893
;892:
;893:	v = Info_ValueForKey( configstring, "pg_b" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $460
ARGP4
ADDRLP4 2064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ASGNP4
line 894
;894:	newInfo.pg_blue = atof( v )*255;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2068
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4+144
CNSTF4 1132396544
ADDRLP4 2068
INDIRF4
MULF4
ASGNF4
line 896
;895:
;896:	v = Info_ValueForKey( configstring, "si" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $462
ARGP4
ADDRLP4 2072
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2072
INDIRP4
ASGNP4
line 897
;897:	newInfo.swepid = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+148
ADDRLP4 2076
INDIRI4
ASGNI4
line 899
;898:	
;899:	v = Info_ValueForKey( configstring, "vn" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $464
ARGP4
ADDRLP4 2080
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2080
INDIRP4
ASGNP4
line 900
;900:	newInfo.vehiclenum = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+152
ADDRLP4 2084
INDIRI4
ASGNI4
line 903
;901:
;902:	// bot skill
;903:	v = Info_ValueForKey( configstring, "skill" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $466
ARGP4
ADDRLP4 2088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2088
INDIRP4
ASGNP4
line 904
;904:	newInfo.botSkill = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2092
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+72
ADDRLP4 2092
INDIRI4
ASGNI4
line 907
;905:
;906:	// handicap
;907:	v = Info_ValueForKey( configstring, "hc" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $468
ARGP4
ADDRLP4 2096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2096
INDIRP4
ASGNP4
line 908
;908:	newInfo.handicap = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+188
ADDRLP4 2100
INDIRI4
ASGNI4
line 911
;909:
;910:	// wins
;911:	v = Info_ValueForKey( configstring, "w" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $470
ARGP4
ADDRLP4 2104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2104
INDIRP4
ASGNP4
line 912
;912:	newInfo.wins = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+192
ADDRLP4 2108
INDIRI4
ASGNI4
line 915
;913:
;914:	// losses
;915:	v = Info_ValueForKey( configstring, "l" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $472
ARGP4
ADDRLP4 2112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2112
INDIRP4
ASGNP4
line 916
;916:	newInfo.losses = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+196
ADDRLP4 2116
INDIRI4
ASGNI4
line 919
;917:
;918:	// team
;919:	v = Info_ValueForKey( configstring, "t" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $474
ARGP4
ADDRLP4 2120
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2120
INDIRP4
ASGNP4
line 920
;920:	newInfo.team = atoi( v );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+68
ADDRLP4 2124
INDIRI4
ASGNI4
line 923
;921:
;922:	// team task
;923:	v = Info_ValueForKey( configstring, "tt" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $476
ARGP4
ADDRLP4 2128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2128
INDIRP4
ASGNP4
line 924
;924:	newInfo.teamTask = atoi(v);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+200
ADDRLP4 2132
INDIRI4
ASGNI4
line 927
;925:
;926:	// team leader
;927:	v = Info_ValueForKey( configstring, "tl" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $478
ARGP4
ADDRLP4 2136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2136
INDIRP4
ASGNP4
line 928
;928:	newInfo.teamLeader = atoi(v);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+204
ADDRLP4 2140
INDIRI4
ASGNI4
line 930
;929:
;930:	v = Info_ValueForKey( configstring, "g_redteam" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $480
ARGP4
ADDRLP4 2144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2144
INDIRP4
ASGNP4
line 932
;931:	
;932:	Q_strncpyz( newInfo.legsModelName, v, sizeof( newInfo.legsModelName ) );
ADDRLP4 4+484
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 934
;933:
;934:	slash = strchr( newInfo.legsModelName, '/' );
ADDRLP4 4+484
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 2148
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1952
ADDRLP4 2148
INDIRP4
ASGNP4
line 935
;935:	if ( !slash ) {
ADDRLP4 1952
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $484
line 937
;936:		// modelName didn not include a skin name
;937:		Q_strncpyz( newInfo.legsSkinName, "default", sizeof( newInfo.legsSkinName ) );
ADDRLP4 4+548
ARGP4
ADDRGP4 $127
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 938
;938:	} else {
ADDRGP4 $485
JUMPV
LABELV $484
line 939
;939:		Q_strncpyz( newInfo.legsSkinName, slash + 1, sizeof( newInfo.legsSkinName ) );
ADDRLP4 4+548
ARGP4
ADDRLP4 1952
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 941
;940:		// truncate modelName
;941:		*slash = 0;
ADDRLP4 1952
INDIRP4
CNSTI1 0
ASGNI1
line 942
;942:	}
LABELV $485
line 945
;943:
;944:	// model
;945:	v = Info_ValueForKey( configstring, "model" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $490
ARGP4
ADDRLP4 2152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2152
INDIRP4
ASGNP4
line 947
;946:
;947:	Q_strncpyz( newInfo.modelName, v, sizeof( newInfo.modelName ) );
ADDRLP4 4+228
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 949
;948:
;949:	slash = strchr( newInfo.modelName, '/' );
ADDRLP4 4+228
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 2156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1952
ADDRLP4 2156
INDIRP4
ASGNP4
line 950
;950:	if ( !slash ) {
ADDRLP4 1952
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $494
line 952
;951:		// modelName didn not include a skin name
;952:		Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 4+292
ARGP4
ADDRGP4 $127
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 953
;953:	} else {
ADDRGP4 $495
JUMPV
LABELV $494
line 954
;954:		Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
ADDRLP4 4+292
ARGP4
ADDRLP4 1952
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 956
;955:		// truncate modelName
;956:		*slash = 0;
ADDRLP4 1952
INDIRP4
CNSTI1 0
ASGNI1
line 957
;957:	}
LABELV $495
line 960
;958:
;959:	// head model
;960:	v = Info_ValueForKey( configstring, "hmodel" );
ADDRLP4 1948
INDIRP4
ARGP4
ADDRGP4 $500
ARGP4
ADDRLP4 2160
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2160
INDIRP4
ASGNP4
line 962
;961:	
;962:	Q_strncpyz( newInfo.headModelName, v, sizeof( newInfo.headModelName ) );
ADDRLP4 4+356
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 964
;963:
;964:	slash = strchr( newInfo.headModelName, '/' );
ADDRLP4 4+356
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 2164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1952
ADDRLP4 2164
INDIRP4
ASGNP4
line 965
;965:	if ( !slash ) {
ADDRLP4 1952
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $504
line 967
;966:		// modelName didn not include a skin name
;967:		Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
ADDRLP4 4+420
ARGP4
ADDRGP4 $127
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 968
;968:	} else {
ADDRGP4 $505
JUMPV
LABELV $504
line 969
;969:		Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
ADDRLP4 4+420
ARGP4
ADDRLP4 1952
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 971
;970:		// truncate modelName
;971:		*slash = 0;
ADDRLP4 1952
INDIRP4
CNSTI1 0
ASGNI1
line 972
;972:	}
LABELV $505
line 976
;973:
;974:	// scan for an existing clientinfo that matches this modelname
;975:	// so we can avoid loading checks if possible
;976:	if ( !CG_ScanForExistingClientInfo( &newInfo ) ) {
ADDRLP4 4
ARGP4
ADDRLP4 2168
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 2168
INDIRI4
CNSTI4 0
NEI4 $510
line 979
;977:		qboolean	forceDefer;
;978:
;979:		forceDefer = trap_MemoryRemaining() < 4000000;
ADDRLP4 2180
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 2180
INDIRI4
CNSTI4 4000000
GEI4 $513
ADDRLP4 2176
CNSTI4 1
ASGNI4
ADDRGP4 $514
JUMPV
LABELV $513
ADDRLP4 2176
CNSTI4 0
ASGNI4
LABELV $514
ADDRLP4 2172
ADDRLP4 2176
INDIRI4
ASGNI4
line 982
;980:
;981:		// if we are defering loads, just have it pick the first valid
;982:		if ( forceDefer || (cg_deferPlayers.integer && !cg_buildScript.integer && !cg.loading ) ) {
ADDRLP4 2184
CNSTI4 0
ASGNI4
ADDRLP4 2172
INDIRI4
ADDRLP4 2184
INDIRI4
NEI4 $520
ADDRGP4 cg_deferPlayers+12
INDIRI4
ADDRLP4 2184
INDIRI4
EQI4 $515
ADDRGP4 cg_buildScript+12
INDIRI4
ADDRLP4 2184
INDIRI4
NEI4 $515
ADDRGP4 cg+20
INDIRI4
ADDRLP4 2184
INDIRI4
NEI4 $515
LABELV $520
line 984
;983:			// keep whatever they had if it won't violate team skins
;984:			CG_SetDeferredClientInfo( clientNum, &newInfo );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 CG_SetDeferredClientInfo
CALLV
pop
line 986
;985:			// if we are low on memory, leave them with this model
;986:			if ( forceDefer ) {
ADDRLP4 2172
INDIRI4
CNSTI4 0
EQI4 $516
line 987
;987:				CG_Printf( "Memory is low. Using deferred model.\n" );
ADDRGP4 $523
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 988
;988:				newInfo.deferred = qfalse;
ADDRLP4 4+676
CNSTI4 0
ASGNI4
line 989
;989:			}
line 990
;990:		} else {
ADDRGP4 $516
JUMPV
LABELV $515
line 991
;991:			CG_LoadClientInfo( clientNum, &newInfo );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 992
;992:		}
LABELV $516
line 993
;993:	}
LABELV $510
line 996
;994:
;995:	// replace whatever was there with the new one
;996:	newInfo.infoValid = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 997
;997:	*ci = newInfo;
ADDRLP4 1956
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 1944
line 998
;998:}
LABELV $427
endproc CG_NewClientInfo 2188 12
export CG_LoadDeferredPlayers
proc CG_LoadDeferredPlayers 20 8
line 1011
;999:
;1000:
;1001:
;1002:/*
;1003:======================
;1004:CG_LoadDeferredPlayers
;1005:
;1006:Called each frame when a player is dead
;1007:and the scoreboard is up
;1008:so deferred players can be loaded
;1009:======================
;1010:*/
;1011:void CG_LoadDeferredPlayers( void ) {
line 1016
;1012:	int		i;
;1013:	clientInfo_t	*ci;
;1014:
;1015:	// scan for a deferred player to load
;1016:	for ( i = 0, ci = cgs.clientinfo ; i < cgs.maxclients ; i++, ci++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+440948
ASGNP4
ADDRGP4 $529
JUMPV
LABELV $526
line 1017
;1017:		if ( ci->infoValid && ci->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $532
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $532
line 1019
;1018:			// if we are low on memory, leave it deferred
;1019:			if ( trap_MemoryRemaining() < 4000000 ) {
ADDRLP4 16
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 4000000
GEI4 $534
line 1020
;1020:				CG_Printf( "Memory is low. Using deferred model.\n" );
ADDRGP4 $523
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1021
;1021:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 1022
;1022:				continue;
ADDRGP4 $527
JUMPV
LABELV $534
line 1024
;1023:			}
;1024:			CG_LoadClientInfo( i, ci );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1026
;1025://			break;
;1026:		}
LABELV $532
line 1027
;1027:	}
LABELV $527
line 1016
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1944
ADDP4
ASGNP4
LABELV $529
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $526
line 1028
;1028:}
LABELV $525
endproc CG_LoadDeferredPlayers 20 8
export CG_ReloadPlayers
proc CG_ReloadPlayers 12 8
line 1030
;1029:
;1030:void CG_ReloadPlayers( void ) {
line 1035
;1031:	int		i;
;1032:	clientInfo_t	*ci;
;1033:
;1034:	// scan for a deferred player to load
;1035:	for ( i = 0, ci = cgs.clientinfo ; i < cgs.maxclients ; i++, ci++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+440948
ASGNP4
ADDRGP4 $540
JUMPV
LABELV $537
line 1036
;1036:		if ( ci->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $543
line 1038
;1037:			// if we are low on memory, leave it deferred
;1038:			if ( trap_MemoryRemaining() < 4000000 ) {
ADDRLP4 8
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 4000000
GEI4 $545
line 1039
;1039:				CG_Printf( "Memory is low. Using deferred model.\n" );
ADDRGP4 $523
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1040
;1040:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 1041
;1041:				continue;
ADDRGP4 $538
JUMPV
LABELV $545
line 1043
;1042:			}
;1043:			CG_ReloadClientInfo( i, ci );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ReloadClientInfo
CALLV
pop
line 1045
;1044://			break;
;1045:		}
LABELV $543
line 1046
;1046:	}
LABELV $538
line 1035
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1944
ADDP4
ASGNP4
LABELV $540
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $537
line 1047
;1047:}
LABELV $536
endproc CG_ReloadPlayers 12 8
proc CG_SetLerpFrameAnimation 12 8
line 1065
;1048:
;1049:/*
;1050:=============================================================================
;1051:
;1052:PLAYER ANIMATION
;1053:
;1054:=============================================================================
;1055:*/
;1056:
;1057:
;1058:/*
;1059:===============
;1060:CG_SetLerpFrameAnimation
;1061:
;1062:may include ANIM_TOGGLEBIT
;1063:===============
;1064:*/
;1065:static void CG_SetLerpFrameAnimation( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 1068
;1066:	animation_t	*anim;
;1067:
;1068:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1069
;1069:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1071
;1070:
;1071:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $550
ADDRLP4 4
INDIRI4
CNSTI4 37
LTI4 $548
LABELV $550
line 1072
;1072:		CG_Error( "Bad animation number: %i", newAnimation );
ADDRGP4 $551
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1073
;1073:	}
LABELV $548
line 1075
;1074:
;1075:	anim = &ci->animations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDP4
ASGNP4
line 1077
;1076:
;1077:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1078
;1078:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1080
;1079:
;1080:	if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $552
line 1081
;1081:		CG_Printf( "Anim: %i\n", newAnimation );
ADDRGP4 $555
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1082
;1082:	}
LABELV $552
line 1083
;1083:}
LABELV $547
endproc CG_SetLerpFrameAnimation 12 8
proc CG_RunLerpFrame 44 12
line 1093
;1084:
;1085:/*
;1086:===============
;1087:CG_RunLerpFrame
;1088:
;1089:Sets cg.snap, cg.oldFrame, and cg.backlerp
;1090:cg.time should be between oldFrameTime and frameTime after exit
;1091:===============
;1092:*/
;1093:static void CG_RunLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float speedScale ) {
line 1098
;1094:	int			f, numFrames;
;1095:	animation_t	*anim;
;1096:
;1097:	// debugging tool to get no animations
;1098:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $557
line 1099
;1099:		lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1100
;1100:		return;
ADDRGP4 $556
JUMPV
LABELV $557
line 1104
;1101:	}
;1102:
;1103:	// see if the animation sequence is switching
;1104:	if ( newAnimation != lf->animationNumber || !lf->animation ) {
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $562
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $560
LABELV $562
line 1105
;1105:		CG_SetLerpFrameAnimation( ci, lf, newAnimation );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1106
;1106:	}
LABELV $560
line 1110
;1107:
;1108:	// if we have passed the current frame, move it to
;1109:	// oldFrame and calculate a new frame
;1110:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $563
line 1111
;1111:		lf->oldFrame = lf->frame;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1112
;1112:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1115
;1113:
;1114:		// get the next frame based on the animation
;1115:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 1116
;1116:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $566
line 1117
;1117:			return;		// shouldn't happen
ADDRGP4 $556
JUMPV
LABELV $566
line 1119
;1118:		}
;1119:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $568
line 1120
;1120:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1121
;1121:		} else {
ADDRGP4 $569
JUMPV
LABELV $568
line 1122
;1122:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 12
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1123
;1123:		}
LABELV $569
line 1124
;1124:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 12
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1125
;1125:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1127
;1126:
;1127:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1128
;1128:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $571
line 1129
;1129:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1130
;1130:		}
LABELV $571
line 1131
;1131:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $573
line 1132
;1132:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1133
;1133:			if ( anim->loopFrames ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $575
line 1134
;1134:				f %= anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MODI4
ASGNI4
line 1135
;1135:				f += anim->numFrames - anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 1136
;1136:			} else {
ADDRGP4 $576
JUMPV
LABELV $575
line 1137
;1137:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1140
;1138:				// the animation is stuck at the end, so it
;1139:				// can immediately transition to another sequence
;1140:				lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1141
;1141:			}
LABELV $576
line 1142
;1142:		}
LABELV $573
line 1143
;1143:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $578
line 1144
;1144:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1145
;1145:		}
ADDRGP4 $579
JUMPV
LABELV $578
line 1146
;1146:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $580
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $580
line 1147
;1147:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
MODI4
SUBI4
ASGNI4
line 1148
;1148:		}
ADDRGP4 $581
JUMPV
LABELV $580
line 1149
;1149:		else {
line 1150
;1150:			lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1151
;1151:		}
LABELV $581
LABELV $579
line 1152
;1152:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $582
line 1153
;1153:			lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1154
;1154:			if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $586
line 1155
;1155:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $589
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1156
;1156:			}
LABELV $586
line 1157
;1157:		}
LABELV $582
line 1158
;1158:	}
LABELV $563
line 1160
;1159:
;1160:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 200
ADDI4
LEI4 $590
line 1161
;1161:		lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1162
;1162:	}
LABELV $590
line 1164
;1163:
;1164:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
LEI4 $594
line 1165
;1165:		lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1166
;1166:	}
LABELV $594
line 1168
;1167:	// calculate current lerp value
;1168:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $598
line 1169
;1169:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 1170
;1170:	} else {
ADDRGP4 $599
JUMPV
LABELV $598
line 1171
;1171:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 1172
;1172:	}
LABELV $599
line 1173
;1173:}
LABELV $556
endproc CG_RunLerpFrame 44 12
proc CG_ClearLerpFrame 16 12
line 1181
;1174:
;1175:
;1176:/*
;1177:===============
;1178:CG_ClearLerpFrame
;1179:===============
;1180:*/
;1181:static void CG_ClearLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int animationNumber ) {
line 1182
;1182:	lf->frameTime = lf->oldFrameTime = cg.time;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1183
;1183:	CG_SetLerpFrameAnimation( ci, lf, animationNumber );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1184
;1184:	lf->oldFrame = lf->frame = lf->animation->firstFrame;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1185
;1185:}
LABELV $601
endproc CG_ClearLerpFrame 16 12
proc CG_PlayerAnimation 20 16
line 1194
;1186:
;1187:
;1188:/*
;1189:===============
;1190:CG_PlayerAnimation
;1191:===============
;1192:*/
;1193:static void CG_PlayerAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;1194:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 1199
;1195:	clientInfo_t	*ci;
;1196:	int				clientNum;
;1197:	float			speedScale;
;1198:
;1199:	clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1201
;1200:
;1201:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $604
line 1202
;1202:		*legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1203
;1203:		return;
ADDRGP4 $603
JUMPV
LABELV $604
line 1206
;1204:	}
;1205:
;1206:	if ( cent->currentState.powerups & ( 1 << PW_HASTE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $607
line 1207
;1207:		speedScale = 1.5;
ADDRLP4 4
CNSTF4 1069547520
ASGNF4
line 1208
;1208:	} else {
ADDRGP4 $608
JUMPV
LABELV $607
line 1209
;1209:		speedScale = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1210
;1210:	}
LABELV $608
line 1212
;1211:
;1212:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
CNSTI4 1944
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1215
;1213:
;1214:	// do the shuffle turn frames locally
;1215:	if ( cent->pe.legs.yawing && ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
EQI4 $610
ADDRLP4 12
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $610
line 1216
;1216:		CG_RunLerpFrame( ci, &cent->pe.legs, LEGS_TURN, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
ARGP4
CNSTI4 24
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1217
;1217:	} else {
ADDRGP4 $611
JUMPV
LABELV $610
line 1218
;1218:		CG_RunLerpFrame( ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 492
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1219
;1219:	}
LABELV $611
line 1221
;1220:
;1221:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
ASGNI4
line 1222
;1222:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ASGNI4
line 1223
;1223:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
ASGNF4
line 1225
;1224:
;1225:	CG_RunLerpFrame( ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 540
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1227
;1226:
;1227:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ASGNI4
line 1228
;1228:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
line 1229
;1229:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ASGNF4
line 1230
;1230:}
LABELV $603
endproc CG_PlayerAnimation 20 16
proc CG_SwingAngles 28 8
line 1246
;1231:
;1232:/*
;1233:=============================================================================
;1234:
;1235:PLAYER ANGLES
;1236:
;1237:=============================================================================
;1238:*/
;1239:
;1240:/*
;1241:==================
;1242:CG_SwingAngles
;1243:==================
;1244:*/
;1245:static void CG_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;1246:					float speed, float *angle, qboolean *swinging ) {
line 1251
;1247:	float	swing;
;1248:	float	move;
;1249:	float	scale;
;1250:
;1251:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $613
line 1253
;1252:		// see if a swing should be started
;1253:		swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1254
;1254:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $617
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $615
LABELV $617
line 1255
;1255:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 1256
;1256:		}
LABELV $615
line 1257
;1257:	}
LABELV $613
line 1259
;1258:
;1259:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $618
line 1260
;1260:		return;
ADDRGP4 $612
JUMPV
LABELV $618
line 1265
;1261:	}
;1262:
;1263:	// modify the speed depending on the delta
;1264:	// so it doesn't seem so linear
;1265:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1266
;1266:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 1267
;1267:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $620
line 1268
;1268:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1269
;1269:	} else if ( scale < swingTolerance ) {
ADDRGP4 $621
JUMPV
LABELV $620
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $622
line 1270
;1270:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1271
;1271:	} else {
ADDRGP4 $623
JUMPV
LABELV $622
line 1272
;1272:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 1273
;1273:	}
LABELV $623
LABELV $621
line 1276
;1274:
;1275:	// swing towards the destination angle
;1276:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $624
line 1277
;1277:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+1868888
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1278
;1278:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $627
line 1279
;1279:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1280
;1280:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1281
;1281:		}
LABELV $627
line 1282
;1282:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1283
;1283:	} else if ( swing < 0 ) {
ADDRGP4 $625
JUMPV
LABELV $624
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $629
line 1284
;1284:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+1868888
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 1285
;1285:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $632
line 1286
;1286:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1287
;1287:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1288
;1288:		}
LABELV $632
line 1289
;1289:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1290
;1290:	}
LABELV $629
LABELV $625
line 1293
;1291:
;1292:	// clamp to no more than tolerance
;1293:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1294
;1294:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $634
line 1295
;1295:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1296
;1296:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $635
JUMPV
LABELV $634
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $636
line 1297
;1297:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1298
;1298:	}
LABELV $636
LABELV $635
line 1299
;1299:}
LABELV $612
endproc CG_SwingAngles 28 8
proc CG_AddPainTwitch 12 0
line 1306
;1300:
;1301:/*
;1302:=================
;1303:CG_AddPainTwitch
;1304:=================
;1305:*/
;1306:static void CG_AddPainTwitch( centity_t *cent, vec3_t torsoAngles ) {
line 1310
;1307:	int		t;
;1308:	float	f;
;1309:
;1310:	t = cg.time - cent->pe.painTime;
ADDRLP4 0
ADDRGP4 cg+1868892
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1311
;1311:	if ( t >= PAIN_TWITCH_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $640
line 1312
;1312:		return;
ADDRGP4 $638
JUMPV
LABELV $640
line 1315
;1313:	}
;1314:
;1315:	f = 1.0 - (float)t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 1317
;1316:
;1317:	if ( cent->pe.painDirection ) {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $642
line 1318
;1318:		torsoAngles[ROLL] += 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1319
;1319:	} else {
ADDRGP4 $643
JUMPV
LABELV $642
line 1320
;1320:		torsoAngles[ROLL] -= 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1321
;1321:	}
LABELV $643
line 1322
;1322:}
LABELV $638
endproc CG_AddPainTwitch 12 0
data
align 4
LABELV $645
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
code
proc CG_PlayerAngles 212 24
line 1344
;1323:
;1324:
;1325:/*
;1326:===============
;1327:CG_PlayerAngles
;1328:
;1329:Handles seperate torso motion
;1330:
;1331:  legs pivot based on direction of movement
;1332:
;1333:  head always looks exactly at cent->lerpAngles
;1334:
;1335:  if motion < 25 degrees, show in head only
;1336:  if < 40 degrees, also show in torso
;1337:===============
;1338:*/
;1339:#define L_ANIM ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT )
;1340:#define T_ANIM ( cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT )
;1341:
;1342:vec3_t		eyeat;
;1343:
;1344:static void CG_PlayerAngles( centity_t *cent, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
line 1356
;1345:	vec3_t		legsAngles, torsoAngles, headAngles;
;1346:	float		dest;
;1347:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;1348:	vec3_t		velocity;
;1349:	float		speed;
;1350:	int			dir, clientNum;
;1351:	clientInfo_t	*ci;
;1352:	int		camereyes;
;1353:
;1354:
;1355:
;1356:	{
line 1357
;1357:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRB
ASGNB 12
line 1358
;1358:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 72
INDIRF4
ASGNF4
line 1359
;1359:	}
line 1365
;1360:
;1361:
;1362:	//headAngles[YAW] = AngleMod( headAngles[YAW] );
;1363:
;1364:
;1365:	VectorClear( legsAngles );
ADDRLP4 72
CNSTF4 0
ASGNF4
ADDRLP4 24+8
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 72
INDIRF4
ASGNF4
line 1366
;1366:	VectorClear( torsoAngles );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 76
INDIRF4
ASGNF4
line 1369
;1367:
;1368:
;1369:	camereyes = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 1370
;1370:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $652
line 1371
;1371:		camereyes = 1; // it's me!
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1372
;1372:	}
LABELV $652
line 1375
;1373:
;1374:	// leilei -- new third person camera prep
;1375:	cent->newcamrunning = 0;
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 1376
;1376:	if (cg_cameramode.integer == 1)
ADDRGP4 cg_cameramode+12
INDIRI4
CNSTI4 1
NEI4 $655
line 1377
;1377:	{
line 1378
;1378:	if ((cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_ATTACK)
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 7
EQI4 $658
line 1379
;1379:	cent->newcamrunning = 1;
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $659
JUMPV
LABELV $658
line 1381
;1380:	else
;1381:	cent->newcamrunning = 0;
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
LABELV $659
line 1384
;1382:
;1383:
;1384:	}
LABELV $655
line 1390
;1385:
;1386:	// --------- yaw -------------
;1387:
;1388:	// allow yaw to drift a bit
;1389:	if( 
;1390:	   L_ANIM != LEGS_IDLE
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 22
EQI4 $663
ADDRLP4 80
INDIRI4
CNSTI4 23
NEI4 $664
LABELV $663
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 7
EQI4 $664
ADDRLP4 84
INDIRI4
CNSTI4 8
NEI4 $660
LABELV $664
line 1395
;1391:	&& L_ANIM != LEGS_IDLECR
;1392:
;1393:	|| T_ANIM == TORSO_ATTACK
;1394:	|| T_ANIM == TORSO_ATTACK2
;1395:	){
line 1396
;1396:		cent->pe.torso.yawing = qtrue;	// center
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 1397
;1397:		cent->pe.torso.pitching = qtrue;	// center
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 1
ASGNI4
line 1398
;1398:		cent->pe.legs.yawing = qtrue;	// center
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 1
ASGNI4
line 1399
;1399:	}
LABELV $660
line 1402
;1400:
;1401:	// etc
;1402:	if(cent->newcamrunning){
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
EQI4 $665
line 1404
;1403:	// lean towards the direction of travel
;1404:		VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1405
;1405:		speed = VectorNormalize( velocity );
ADDRLP4 40
ARGP4
ADDRLP4 88
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 88
INDIRF4
ASGNF4
line 1406
;1406:		if ( speed ) {
ADDRLP4 52
INDIRF4
CNSTF4 0
EQF4 $667
line 1411
;1407:			vec3_t	axis[3];
;1408:			vec3_t	veel;
;1409:			vec3_t fwad, rait;
;1410:			float	side, frt, rrt;
;1411:			AngleVectors(veel, velocity, fwad, rait);
ADDRLP4 92
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1412
;1412:			speed *= 0.05f;
ADDRLP4 52
CNSTF4 1028443341
ADDRLP4 52
INDIRF4
MULF4
ASGNF4
line 1413
;1413:		}
LABELV $667
line 1414
;1414:	}
LABELV $665
line 1417
;1415:
;1416:	// adjust legs for movement dir
;1417:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $669
line 1419
;1418:		// don't let dead bodies twitch
;1419:		dir = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 1420
;1420:	} else {
ADDRGP4 $670
JUMPV
LABELV $669
line 1421
;1421:		dir = cent->currentState.angles2[YAW];
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1422
;1422:		if ( dir < 0 || dir > 7 ) {
ADDRLP4 56
INDIRI4
CNSTI4 0
LTI4 $673
ADDRLP4 56
INDIRI4
CNSTI4 7
LEI4 $671
LABELV $673
line 1423
;1423:			CG_Error( "Bad player movement angle" );
ADDRGP4 $674
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1424
;1424:		}
LABELV $671
line 1425
;1425:	}
LABELV $670
line 1426
;1426:	legsAngles[YAW] = headAngles[YAW] + movementOffsets[ dir ];
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 56
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $645
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1427
;1427:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 56
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $645
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1430
;1428:
;1429:	// torso
;1430:	CG_SwingAngles( torsoAngles[YAW], 60000, 90, cg_swingSpeed.value, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing );
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1198153728
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 560
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 564
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1431
;1431:	CG_SwingAngles( legsAngles[YAW], 60000, 90, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing );
ADDRLP4 24+4
INDIRF4
ARGF4
CNSTF4 1198153728
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1433
;1432:
;1433:	torsoAngles[YAW] = cent->pe.torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ASGNF4
line 1434
;1434:	legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRLP4 24+4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRF4
ASGNF4
line 1440
;1435:
;1436:
;1437:	// --------- pitch -------------
;1438:
;1439:	// only show a fraction of the pitch angle in the torso
;1440:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $685
line 1441
;1441:		dest = (-360 + headAngles[PITCH]) * 0.75f;
ADDRLP4 68
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 1442
;1442:	} else {
ADDRGP4 $686
JUMPV
LABELV $685
line 1443
;1443:		dest = headAngles[PITCH] * 0.75f;
ADDRLP4 68
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 1444
;1444:	}
LABELV $686
line 1445
;1445:	CG_SwingAngles( dest, 15, 30, 0.1f, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching );
ADDRLP4 68
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 568
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 572
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1446
;1446:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ASGNF4
line 1449
;1447:
;1448:	//
;1449:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1450
;1450:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $687
ADDRLP4 36
INDIRI4
CNSTI4 256
GEI4 $687
line 1451
;1451:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 60
CNSTI4 1944
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1452
;1452:		if ( ci->fixedtorso ) {
ADDRLP4 60
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $690
line 1453
;1453:			torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1454
;1454:		}
LABELV $690
line 1456
;1455:
;1456:	if(cg.renderingThirdPerson){
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
EQI4 $692
line 1457
;1457:			torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1458
;1458:	}
LABELV $692
line 1460
;1459:
;1460:	if(cg.renderingEyesPerson == 3){
ADDRGP4 cg+1868920
INDIRI4
CNSTI4 3
NEI4 $695
line 1461
;1461:			torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1462
;1462:	}
LABELV $695
line 1463
;1463:	}
LABELV $687
line 1469
;1464:
;1465:	// --------- roll -------------
;1466:
;1467:
;1468:	// lean towards the direction of travel
;1469:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1470
;1470:	speed = VectorNormalize( velocity );
ADDRLP4 40
ARGP4
ADDRLP4 104
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 104
INDIRF4
ASGNF4
line 1471
;1471:	if ( speed ) {
ADDRLP4 52
INDIRF4
CNSTF4 0
EQF4 $698
line 1475
;1472:		vec3_t	axis[3];
;1473:		float	side;
;1474:
;1475:		speed *= 0.05f;
ADDRLP4 52
CNSTF4 1028443341
ADDRLP4 52
INDIRF4
MULF4
ASGNF4
line 1477
;1476:
;1477:		AnglesToAxis( legsAngles, axis );
ADDRLP4 24
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1478
;1478:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 144
ADDRLP4 52
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 108+12
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 108+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 108+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1479
;1479:		legsAngles[ROLL] -= side;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 144
INDIRF4
SUBF4
ASGNF4
line 1481
;1480:
;1481:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 144
ADDRLP4 52
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 108
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 108+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 108+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1482
;1482:		legsAngles[PITCH] += side;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 144
INDIRF4
ADDF4
ASGNF4
line 1483
;1483:	}
LABELV $698
line 1486
;1484:
;1485:	//
;1486:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1487
;1487:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $712
ADDRLP4 36
INDIRI4
CNSTI4 256
GEI4 $712
line 1488
;1488:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 60
CNSTI4 1944
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1489
;1489:		if ( ci->fixedlegs ) {
ADDRLP4 60
INDIRP4
CNSTI4 684
ADDP4
INDIRI4
CNSTI4 0
EQI4 $715
line 1490
;1490:			legsAngles[YAW] = torsoAngles[YAW];
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 1491
;1491:			legsAngles[PITCH] = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 1492
;1492:			legsAngles[ROLL] = 0.0f;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 1493
;1493:		}
LABELV $715
line 1494
;1494:	}
LABELV $712
line 1497
;1495:
;1496:	// pain twitch
;1497:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 1502
;1498:	// TODO: make eyes erode on pain twitch
;1499:
;1500:	// leilei - eyes hack
;1501:
;1502:	if (camereyes){
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $720
line 1503
;1503:	cent->eyesAngles[YAW] = headAngles[YAW];
ADDRFP4 0
INDIRP4
CNSTI4 860
ADDP4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 1504
;1504:	cent->eyesAngles[PITCH] = headAngles[PITCH];
ADDRFP4 0
INDIRP4
CNSTI4 856
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1505
;1505:	cent->eyesAngles[ROLL] = headAngles[ROLL];
ADDRFP4 0
INDIRP4
CNSTI4 864
ADDP4
ADDRLP4 12+8
INDIRF4
ASGNF4
line 1506
;1506:	}
LABELV $720
line 1509
;1507:
;1508:	// pull the angles back out of the hierarchial chain
;1509:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1510
;1510:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1511
;1511:	AnglesToAxis( legsAngles, legs );
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1512
;1512:	AnglesToAxis( torsoAngles, torso );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1514
;1513:
;1514:	if(!cg.renderingThirdPerson){
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
NEI4 $724
line 1515
;1515:	AnglesToAxis( headAngles, head );
ADDRLP4 12
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1516
;1516:	}
LABELV $724
line 1517
;1517:	if(cg.renderingThirdPerson || cg.snap->ps.stats[STAT_VEHICLE]){
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRGP4 cg+1868916
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $731
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $727
LABELV $731
line 1518
;1518:	AnglesToAxis( torsoAngles, head );
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1519
;1519:	}
LABELV $727
line 1522
;1520:
;1521:	// eyes crap
;1522:	{
line 1529
;1523:	vec3_t	eyelookat;
;1524:	vec3_t	eyelookfrom;
;1525:	vec3_t	forwaad;
;1526:	trace_t		traced;
;1527:
;1528:	// offset from the model we have.
;1529:	VectorClear(eyelookfrom);
ADDRLP4 208
CNSTF4 0
ASGNF4
ADDRLP4 116+8
ADDRLP4 208
INDIRF4
ASGNF4
ADDRLP4 116+4
ADDRLP4 208
INDIRF4
ASGNF4
ADDRLP4 116
ADDRLP4 208
INDIRF4
ASGNF4
line 1534
;1530://	eyelookfrom[0] += 3.0; // cg_modelEyes_Up.value;		// TODO: Read from eeys.cfg or some eye parameter from animation.cfg
;1531://	eyelookfrom[1] += 1.4; // cg_modelEyes_Right.value;
;1532://	eyelookfrom[2] += 3.3; //cg_modelEyes_Fwd.value;
;1533:
;1534:	VectorCopy(ci->eyepos, cent->pe.eyepos);
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 1928
ADDP4
INDIRB
ASGNB 12
line 1536
;1535:	//VectorCopy(eyelookfrom, cent->pe.eyepos);			// leilei - copy eye poistion
;1536:	}
line 1538
;1537:
;1538:}
LABELV $644
endproc CG_PlayerAngles 212 24
proc CG_HasteTrail 44 48
line 1548
;1539:
;1540:
;1541://==========================================================================
;1542:
;1543:/*
;1544:===============
;1545:CG_HasteTrail
;1546:===============
;1547:*/
;1548:static void CG_HasteTrail( centity_t *cent ) {
line 1553
;1549:	localEntity_t	*smoke;
;1550:	vec3_t			origin;
;1551:	int				anim;
;1552:
;1553:	if ( cent->trailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
LEI4 $735
line 1554
;1554:		return;
ADDRGP4 $734
JUMPV
LABELV $735
line 1556
;1555:	}
;1556:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1557
;1557:	if ( anim != LEGS_RUN && anim != LEGS_BACK ) {
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $738
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $738
line 1558
;1558:		return;
ADDRGP4 $734
JUMPV
LABELV $738
line 1561
;1559:	}
;1560:
;1561:	cent->trailTime += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1562
;1562:	if ( cent->trailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
GEI4 $740
line 1563
;1563:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1564
;1564:	}
LABELV $740
line 1566
;1565:
;1566:	VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 1567
;1567:	origin[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1569
;1568:
;1569:	smoke = CG_SmokePuff( origin, vec3_origin,
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1090519040
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
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1140457472
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1564
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 1579
;1570:				  8,
;1571:				  1, 1, 1, 1,
;1572:				  500,
;1573:				  cg.time,
;1574:				  0,
;1575:				  0,
;1576:				  cgs.media.hastePuffShader );
;1577:
;1578:	// use the optimized local entity add
;1579:	smoke->leType = LE_SCALE_FADE;
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1580
;1580:}
LABELV $734
endproc CG_HasteTrail 44 48
proc CG_BreathPuffs 64 48
line 1587
;1581:
;1582:/*
;1583:===============
;1584:CG_BreathPuffs
;1585:===============
;1586:*/
;1587:static void CG_BreathPuffs( centity_t *cent, refEntity_t *head) {
line 1592
;1588:	clientInfo_t *ci;
;1589:	vec3_t up, origin;
;1590:	int contents;
;1591:
;1592:	ci = &cgs.clientinfo[ cent->currentState.number ];
ADDRLP4 24
CNSTI4 1944
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1594
;1593:
;1594:	if (!cg_enableBreath.integer) {
ADDRGP4 cg_enableBreath+12
INDIRI4
CNSTI4 0
NEI4 $750
line 1595
;1595:		return;
ADDRGP4 $748
JUMPV
LABELV $750
line 1597
;1596:	}
;1597:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $753
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
NEI4 $753
line 1598
;1598:		return;
ADDRGP4 $748
JUMPV
LABELV $753
line 1600
;1599:	}
;1600:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $757
line 1601
;1601:		return;
ADDRGP4 $748
JUMPV
LABELV $757
line 1603
;1602:	}
;1603:	contents = CG_PointContents( head->origin, 0 );
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 32
INDIRI4
ASGNI4
line 1604
;1604:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 28
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $759
line 1605
;1605:		return;
ADDRGP4 $748
JUMPV
LABELV $759
line 1607
;1606:	}
;1607:	if ( ci->breathPuffTime > cg.time ) {
ADDRLP4 24
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
LEI4 $761
line 1608
;1608:		return;
ADDRGP4 $748
JUMPV
LABELV $761
line 1611
;1609:	}
;1610:
;1611:	VectorSet( up, 0, 0, 8 );
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1090519040
ASGNF4
line 1612
;1612:	VectorMA(head->origin, 8, head->axis[0], origin);
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
ADDRLP4 40
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 40
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 48
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
CNSTF4 1090519040
ADDRLP4 48
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1613
;1613:	VectorMA(origin, -4, head->axis[2], origin);
ADDRLP4 52
CNSTF4 3229614080
ASGNF4
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3229614080
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1614
;1614:	CG_SmokePuff( origin, up, 16, 1, 1, 1, 0.66f, 1500, cg.time, cg.time + 400, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTF4 1098907648
ARGF4
ADDRLP4 60
CNSTF4 1065353216
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
CNSTF4 1059648963
ARGF4
CNSTF4 1153138688
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 400
ADDI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+956380+1280
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 1615
;1615:	ci->breathPuffTime = cg.time + 2000;
ADDRLP4 24
INDIRP4
CNSTI4 224
ADDP4
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1616
;1616:}
LABELV $748
endproc CG_BreathPuffs 64 48
proc CG_DustTrail 120 48
line 1623
;1617:
;1618:/*
;1619:===============
;1620:CG_DustTrail
;1621:===============
;1622:*/
;1623:static void CG_DustTrail( centity_t *cent ) {
line 1629
;1624:	int				anim;
;1625:	localEntity_t	*dust;
;1626:	vec3_t end, vel;
;1627:	trace_t tr;
;1628:
;1629:	if (!cg_enableDust.integer)
ADDRGP4 cg_enableDust+12
INDIRI4
CNSTI4 0
NEI4 $778
line 1630
;1630:		return;
ADDRGP4 $777
JUMPV
LABELV $778
line 1632
;1631:
;1632:	if ( cent->dustTrailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
LEI4 $781
line 1633
;1633:		return;
ADDRGP4 $777
JUMPV
LABELV $781
line 1636
;1634:	}
;1635:
;1636:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1637
;1637:	if ( anim != LEGS_LANDB && anim != LEGS_LAND ) {
ADDRLP4 24
INDIRI4
CNSTI4 21
EQI4 $784
ADDRLP4 24
INDIRI4
CNSTI4 19
EQI4 $784
line 1638
;1638:		return;
ADDRGP4 $777
JUMPV
LABELV $784
line 1641
;1639:	}
;1640:
;1641:	cent->dustTrailTime += 40;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 40
ADDI4
ASGNI4
line 1642
;1642:	if ( cent->dustTrailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
GEI4 $786
line 1643
;1643:		cent->dustTrailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1644
;1644:	}
LABELV $786
line 1646
;1645:
;1646:	VectorCopy(cent->currentState.pos.trBase, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1647
;1647:	end[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1648
;1648:	CG_Trace( &tr, cent->currentState.pos.trBase, NULL, NULL, end, cent->currentState.number, MASK_PLAYERSOLID );
ADDRLP4 28
ARGP4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 100
CNSTP4 0
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 96
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 1650
;1649:
;1650:	if ( !(tr.surfaceFlags & SURF_DUST) )
ADDRLP4 28+44
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
NEI4 $791
line 1651
;1651:		return;
ADDRGP4 $777
JUMPV
LABELV $791
line 1653
;1652:
;1653:	VectorCopy( cent->currentState.pos.trBase, end );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1654
;1654:	end[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1656
;1655:
;1656:	VectorSet(vel, 0, 0, -30);
ADDRLP4 104
CNSTF4 0
ASGNF4
ADDRLP4 12
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 12+8
CNSTF4 3253731328
ASGNF4
line 1657
;1657:	dust = CG_SmokePuff( end, vel,
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTF4 1103101952
ARGF4
ADDRLP4 108
CNSTF4 1061997773
ASGNF4
ADDRLP4 108
INDIRF4
ARGF4
ADDRLP4 108
INDIRF4
ARGF4
CNSTF4 1060320051
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1140457472
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1736
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 116
INDIRP4
ASGNP4
line 1665
;1658:				  24,
;1659:				  .8f, .8f, 0.7f, 0.33f,
;1660:				  500,
;1661:				  cg.time,
;1662:				  0,
;1663:				  0,
;1664:				  cgs.media.dustPuffShader );
;1665:}
LABELV $777
endproc CG_DustTrail 120 48
proc CG_TrailItem 224 12
line 1672
;1666:
;1667:/*
;1668:===============
;1669:CG_TrailItem
;1670:===============
;1671:*/
;1672:static void CG_TrailItem( centity_t *cent, qhandle_t hModel ) {
line 1677
;1673:	refEntity_t		ent;
;1674:	vec3_t			angles;
;1675:	vec3_t			axis[3];
;1676:
;1677:	VectorCopy( cent->lerpAngles, angles );
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRB
ASGNB 12
line 1678
;1678:	angles[PITCH] = 0;
ADDRLP4 176
CNSTF4 0
ASGNF4
line 1679
;1679:	angles[ROLL] = 0;
ADDRLP4 176+8
CNSTF4 0
ASGNF4
line 1680
;1680:	AnglesToAxis( angles, axis );
ADDRLP4 176
ARGP4
ADDRLP4 188
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1682
;1681:
;1682:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1683
;1683:	VectorMA( cent->lerpOrigin, -16, axis[0], ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 188+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 188+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1684
;1684:	ent.origin[2] += 16;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1685
;1685:	angles[YAW] += 90;
ADDRLP4 176+4
ADDRLP4 176+4
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1686
;1686:	AnglesToAxis( angles, ent.axis );
ADDRLP4 176
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1688
;1687:
;1688:	ent.hModel = hModel;
ADDRLP4 0+8
ADDRFP4 4
INDIRI4
ASGNI4
line 1689
;1689:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1690
;1690:}
LABELV $800
endproc CG_TrailItem 224 12
proc CG_PlayerFlag 428 24
line 1698
;1691:
;1692:
;1693:/*
;1694:===============
;1695:CG_PlayerFlag
;1696:===============
;1697:*/
;1698:static void CG_PlayerFlag( centity_t *cent, qhandle_t hSkin, refEntity_t *torso ) {
line 1707
;1699:	clientInfo_t	*ci;
;1700:	refEntity_t	pole;
;1701:	refEntity_t	flag;
;1702:	vec3_t		angles, dir;
;1703:	int			legsAnim, flagAnim, updateangles;
;1704:	float		angle, d;
;1705:
;1706:	// show the flag pole model
;1707:	memset( &pole, 0, sizeof(pole) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1708
;1708:	pole.hModel = cgs.media.flagPoleModel;
ADDRLP4 0+8
ADDRGP4 cgs+956380+128
INDIRI4
ASGNI4
line 1709
;1709:	VectorCopy( torso->lightingOrigin, pole.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1710
;1710:	pole.shadowPlane = torso->shadowPlane;
ADDRLP4 0+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1711
;1711:	pole.renderfx = torso->renderfx;
ADDRLP4 0+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1712
;1712:	CG_PositionEntityOnTag( &pole, torso, torso->hModel, "tag_flag" );
ADDRLP4 0
ARGP4
ADDRLP4 400
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 400
INDIRP4
ARGP4
ADDRLP4 400
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $328
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 1713
;1713:	trap_R_AddRefEntityToScene( &pole );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1716
;1714:
;1715:	// show the flag model
;1716:	memset( &flag, 0, sizeof(flag) );
ADDRLP4 176
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1717
;1717:	flag.hModel = cgs.media.flagFlapModel;
ADDRLP4 176+8
ADDRGP4 cgs+956380+132
INDIRI4
ASGNI4
line 1718
;1718:	flag.customSkin = hSkin;
ADDRLP4 176+108
ADDRFP4 4
INDIRI4
ASGNI4
line 1719
;1719:	VectorCopy( torso->lightingOrigin, flag.lightingOrigin );
ADDRLP4 176+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1720
;1720:	flag.shadowPlane = torso->shadowPlane;
ADDRLP4 176+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1721
;1721:	flag.renderfx = torso->renderfx;
ADDRLP4 176+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1723
;1722:
;1723:	VectorClear(angles);
ADDRLP4 404
CNSTF4 0
ASGNF4
ADDRLP4 352+8
ADDRLP4 404
INDIRF4
ASGNF4
ADDRLP4 352+4
ADDRLP4 404
INDIRF4
ASGNF4
ADDRLP4 352
ADDRLP4 404
INDIRF4
ASGNF4
line 1725
;1724:
;1725:	updateangles = qfalse;
ADDRLP4 384
CNSTI4 0
ASGNI4
line 1726
;1726:	legsAnim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 376
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1727
;1727:	if( legsAnim == LEGS_IDLE || legsAnim == LEGS_IDLECR ) {
ADDRLP4 376
INDIRI4
CNSTI4 22
EQI4 $832
ADDRLP4 376
INDIRI4
CNSTI4 23
NEI4 $830
LABELV $832
line 1728
;1728:		flagAnim = FLAG_STAND;
ADDRLP4 392
CNSTI4 35
ASGNI4
line 1729
;1729:	} else if ( legsAnim == LEGS_WALK || legsAnim == LEGS_WALKCR ) {
ADDRGP4 $831
JUMPV
LABELV $830
ADDRLP4 376
INDIRI4
CNSTI4 14
EQI4 $835
ADDRLP4 376
INDIRI4
CNSTI4 13
NEI4 $833
LABELV $835
line 1730
;1730:		flagAnim = FLAG_STAND;
ADDRLP4 392
CNSTI4 35
ASGNI4
line 1731
;1731:		updateangles = qtrue;
ADDRLP4 384
CNSTI4 1
ASGNI4
line 1732
;1732:	} else {
ADDRGP4 $834
JUMPV
LABELV $833
line 1733
;1733:		flagAnim = FLAG_RUN;
ADDRLP4 392
CNSTI4 34
ASGNI4
line 1734
;1734:		updateangles = qtrue;
ADDRLP4 384
CNSTI4 1
ASGNI4
line 1735
;1735:	}
LABELV $834
LABELV $831
line 1737
;1736:
;1737:	if ( updateangles ) {
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $836
line 1739
;1738:
;1739:		VectorCopy( cent->currentState.pos.trDelta, dir );
ADDRLP4 364
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1741
;1740:		// add gravity
;1741:		dir[2] += 100;
ADDRLP4 364+8
ADDRLP4 364+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 1742
;1742:		VectorNormalize( dir );
ADDRLP4 364
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1743
;1743:		d = DotProduct(pole.axis[2], dir);
ADDRLP4 380
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 364+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 364+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1745
;1744:		// if there is anough movement orthogonal to the flag pole
;1745:		if (fabs(d) < 0.9) {
ADDRLP4 380
INDIRF4
ARGF4
ADDRLP4 416
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 416
INDIRF4
CNSTF4 1063675494
GEF4 $849
line 1747
;1746:			//
;1747:			d = DotProduct(pole.axis[0], dir);
ADDRLP4 380
ADDRLP4 0+28
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 364+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 364+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1748
;1748:			if (d > 1.0f) {
ADDRLP4 380
INDIRF4
CNSTF4 1065353216
LEF4 $858
line 1749
;1749:				d = 1.0f;
ADDRLP4 380
CNSTF4 1065353216
ASGNF4
line 1750
;1750:			}
ADDRGP4 $859
JUMPV
LABELV $858
line 1751
;1751:			else if (d < -1.0f) {
ADDRLP4 380
INDIRF4
CNSTF4 3212836864
GEF4 $860
line 1752
;1752:				d = -1.0f;
ADDRLP4 380
CNSTF4 3212836864
ASGNF4
line 1753
;1753:			}
LABELV $860
LABELV $859
line 1754
;1754:			angle = acos(d);
ADDRLP4 380
INDIRF4
ARGF4
ADDRLP4 420
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 396
ADDRLP4 420
INDIRF4
ASGNF4
line 1756
;1755:
;1756:			d = DotProduct(pole.axis[1], dir);
ADDRLP4 380
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 364+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 364+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1757
;1757:			if (d < 0) {
ADDRLP4 380
INDIRF4
CNSTF4 0
GEF4 $872
line 1758
;1758:				angles[YAW] = 360 - angle * 180 / M_PI;
ADDRLP4 352+4
CNSTF4 1135869952
CNSTF4 1127481344
ADDRLP4 396
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
SUBF4
ASGNF4
line 1759
;1759:			}
ADDRGP4 $873
JUMPV
LABELV $872
line 1760
;1760:			else {
line 1761
;1761:				angles[YAW] = angle * 180 / M_PI;
ADDRLP4 352+4
CNSTF4 1127481344
ADDRLP4 396
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1762
;1762:			}
LABELV $873
line 1763
;1763:			if (angles[YAW] < 0)
ADDRLP4 352+4
INDIRF4
CNSTF4 0
GEF4 $876
line 1764
;1764:				angles[YAW] += 360;
ADDRLP4 352+4
ADDRLP4 352+4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $876
line 1765
;1765:			if (angles[YAW] > 360)
ADDRLP4 352+4
INDIRF4
CNSTF4 1135869952
LEF4 $880
line 1766
;1766:				angles[YAW] -= 360;
ADDRLP4 352+4
ADDRLP4 352+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $880
line 1771
;1767:
;1768:			//vectoangles( cent->currentState.pos.trDelta, tmpangles );
;1769:			//angles[YAW] = tmpangles[YAW] + 45 - cent->pe.torso.yawAngle;
;1770:			// change the yaw angle
;1771:			CG_SwingAngles( angles[YAW], 25, 90, 0.15f, &cent->pe.flag.yawAngle, &cent->pe.flag.yawing );
ADDRLP4 352+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1041865114
ARGF4
ADDRLP4 424
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 424
INDIRP4
CNSTI4 608
ADDP4
ARGP4
ADDRLP4 424
INDIRP4
CNSTI4 612
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1772
;1772:		}
LABELV $849
line 1792
;1773:
;1774:		/*
;1775:		d = DotProduct(pole.axis[2], dir);
;1776:		angle = Q_acos(d);
;1777:
;1778:		d = DotProduct(pole.axis[1], dir);
;1779:		if (d < 0) {
;1780:			angle = 360 - angle * 180 / M_PI;
;1781:		}
;1782:		else {
;1783:			angle = angle * 180 / M_PI;
;1784:		}
;1785:		if (angle > 340 && angle < 20) {
;1786:			flagAnim = FLAG_RUNUP;
;1787:		}
;1788:		if (angle > 160 && angle < 200) {
;1789:			flagAnim = FLAG_RUNDOWN;
;1790:		}
;1791:		*/
;1792:	}
LABELV $836
line 1795
;1793:
;1794:	// set the yaw angle
;1795:	angles[YAW] = cent->pe.flag.yawAngle;
ADDRLP4 352+4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ASGNF4
line 1797
;1796:	// lerp the flag animation frames
;1797:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 388
CNSTI4 1944
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1798
;1798:	CG_RunLerpFrame( ci, &cent->pe.flag, flagAnim, 1 );
ADDRLP4 388
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
ARGP4
ADDRLP4 392
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1799
;1799:	flag.oldframe = cent->pe.flag.oldFrame;
ADDRLP4 176+96
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
ASGNI4
line 1800
;1800:	flag.frame = cent->pe.flag.frame;
ADDRLP4 176+80
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 1801
;1801:	flag.backlerp = cent->pe.flag.backlerp;
ADDRLP4 176+100
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRF4
ASGNF4
line 1803
;1802:
;1803:	AnglesToAxis( angles, flag.axis );
ADDRLP4 352
ARGP4
ADDRLP4 176+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1804
;1804:	CG_PositionRotatedEntityOnTag( &flag, &pole, pole.hModel, "tag_flag" );
ADDRLP4 176
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $328
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 1806
;1805:
;1806:	trap_R_AddRefEntityToScene( &flag );
ADDRLP4 176
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1807
;1807:}
LABELV $814
endproc CG_PlayerFlag 428 24
proc CG_PlayerTokens 232 12
line 1814
;1808:
;1809:/*
;1810:===============
;1811:CG_PlayerTokens
;1812:===============
;1813:*/
;1814:static void CG_PlayerTokens( centity_t *cent, int renderfx ) {
line 1820
;1815:	int			tokens, i, j;
;1816:	float		angle;
;1817:	refEntity_t	ent;
;1818:	vec3_t		dir, origin;
;1819:	skulltrail_t *trail;
;1820:	trail = &cg.skulltrails[cent->currentState.number];
ADDRLP4 4
CNSTI4 244
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg+1889676
ADDP4
ASGNP4
line 1821
;1821:	tokens = cent->currentState.generic1;
ADDRLP4 216
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 1822
;1822:	if ( !tokens ) {
ADDRLP4 216
INDIRI4
CNSTI4 0
NEI4 $894
line 1823
;1823:		trail->numpositions = 0;
ADDRLP4 4
INDIRP4
CNSTI4 240
ADDP4
CNSTI4 0
ASGNI4
line 1824
;1824:		return;
ADDRGP4 $892
JUMPV
LABELV $894
line 1827
;1825:	}
;1826:
;1827:	if ( tokens > MAX_SKULLTRAIL ) {
ADDRLP4 216
INDIRI4
CNSTI4 20
LEI4 $896
line 1828
;1828:		tokens = MAX_SKULLTRAIL;
ADDRLP4 216
CNSTI4 20
ASGNI4
line 1829
;1829:	}
LABELV $896
line 1832
;1830:
;1831:	// add skulls if there are more than last time
;1832:	for (i = 0; i < tokens - trail->numpositions; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $901
JUMPV
LABELV $898
line 1833
;1833:		for (j = trail->numpositions; j > 0; j--) {
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $905
JUMPV
LABELV $902
line 1834
;1834:			VectorCopy(trail->positions[j-1], trail->positions[j]);
ADDRLP4 220
CNSTI4 12
ASGNI4
ADDRLP4 224
ADDRLP4 220
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 224
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 224
INDIRI4
ADDRLP4 220
INDIRI4
SUBI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 1835
;1835:		}
LABELV $903
line 1833
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $905
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $902
line 1836
;1836:		VectorCopy(cent->lerpOrigin, trail->positions[0]);
ADDRLP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 1837
;1837:	}
LABELV $899
line 1832
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $901
ADDRLP4 8
INDIRI4
ADDRLP4 216
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
SUBI4
LTI4 $898
line 1838
;1838:	trail->numpositions = tokens;
ADDRLP4 4
INDIRP4
CNSTI4 240
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 1841
;1839:
;1840:	// move all the skulls along the trail
;1841:	VectorCopy(cent->lerpOrigin, origin);
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 1842
;1842:	for (i = 0; i < trail->numpositions; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $909
JUMPV
LABELV $906
line 1843
;1843:		VectorSubtract(trail->positions[i], origin, dir);
ADDRLP4 220
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 200
ADDRLP4 220
INDIRP4
INDIRF4
ADDRLP4 188
INDIRF4
SUBF4
ASGNF4
ADDRLP4 200+4
ADDRLP4 220
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 188+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 200+8
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 188+8
INDIRF4
SUBF4
ASGNF4
line 1844
;1844:		if (VectorNormalize(dir) > 30) {
ADDRLP4 200
ARGP4
ADDRLP4 224
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 224
INDIRF4
CNSTF4 1106247680
LEF4 $914
line 1845
;1845:			VectorMA(origin, 30, dir, trail->positions[i]);
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 188
INDIRF4
CNSTF4 1106247680
ADDRLP4 200
INDIRF4
MULF4
ADDF4
ASGNF4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 188+4
INDIRF4
CNSTF4 1106247680
ADDRLP4 200+4
INDIRF4
MULF4
ADDF4
ASGNF4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 188+8
INDIRF4
CNSTF4 1106247680
ADDRLP4 200+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1846
;1846:		}
LABELV $914
line 1847
;1847:		VectorCopy(trail->positions[i], origin);
ADDRLP4 188
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 1848
;1848:	}
LABELV $907
line 1842
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $909
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
LTI4 $906
line 1850
;1849:
;1850:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1851
;1851:	if( cgs.clientinfo[ cent->currentState.clientNum ].team == TEAM_BLUE ) {
CNSTI4 1944
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $920
line 1852
;1852:		ent.hModel = cgs.media.redCubeModel;
ADDRLP4 12+8
ADDRGP4 cgs+956380+28
INDIRI4
ASGNI4
line 1853
;1853:	} else {
ADDRGP4 $921
JUMPV
LABELV $920
line 1854
;1854:		ent.hModel = cgs.media.blueCubeModel;
ADDRLP4 12+8
ADDRGP4 cgs+956380+32
INDIRI4
ASGNI4
line 1855
;1855:	}
LABELV $921
line 1856
;1856:	ent.renderfx = renderfx;
ADDRLP4 12+4
ADDRFP4 4
INDIRI4
ASGNI4
line 1858
;1857:
;1858:	VectorCopy(cent->lerpOrigin, origin);
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 1859
;1859:	for (i = 0; i < trail->numpositions; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $934
JUMPV
LABELV $931
line 1860
;1860:		VectorSubtract(origin, trail->positions[i], ent.axis[0]);
ADDRLP4 12+28
ADDRLP4 188
INDIRF4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+28+4
ADDRLP4 188+4
INDIRF4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+28+8
ADDRLP4 188+8
INDIRF4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1861
;1861:		ent.axis[0][2] = 0;
ADDRLP4 12+28+8
CNSTF4 0
ASGNF4
line 1862
;1862:		VectorNormalize(ent.axis[0]);
ADDRLP4 12+28
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1863
;1863:		VectorSet(ent.axis[2], 0, 0, 1);
ADDRLP4 12+28+24
CNSTF4 0
ASGNF4
ADDRLP4 12+28+24+4
CNSTF4 0
ASGNF4
ADDRLP4 12+28+24+8
CNSTF4 1065353216
ASGNF4
line 1864
;1864:		CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
ADDRLP4 12+28
ARGP4
ADDRLP4 12+28+24
ARGP4
ADDRLP4 12+28+12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1866
;1865:
;1866:		VectorCopy(trail->positions[i], ent.origin);
ADDRLP4 12+68
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 1867
;1867:		angle = (((cg.time + 500 * MAX_SKULLTRAIL - 500 * i) / 16) & 255) * (M_PI * 2) / 255;
ADDRLP4 212
CNSTF4 1086918619
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 10000
ADDI4
CNSTI4 500
ADDRLP4 8
INDIRI4
MULI4
SUBI4
CNSTI4 16
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 1868
;1868:		ent.origin[2] += sin(angle) * 10;
ADDRLP4 212
INDIRF4
ARGF4
ADDRLP4 220
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 12+68+8
ADDRLP4 12+68+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 220
INDIRF4
MULF4
ADDF4
ASGNF4
line 1869
;1869:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1870
;1870:		VectorCopy(trail->positions[i], origin);
ADDRLP4 188
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 1871
;1871:	}
LABELV $932
line 1859
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $934
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
LTI4 $931
line 1872
;1872:}
LABELV $892
endproc CG_PlayerTokens 232 12
proc CG_PlayerPowerups 16 20
line 1880
;1873:
;1874:
;1875:/*
;1876:===============
;1877:CG_PlayerPowerups
;1878:===============
;1879:*/
;1880:static void CG_PlayerPowerups( centity_t *cent, refEntity_t *torso ) {
line 1884
;1881:	int		powerups;
;1882:	clientInfo_t	*ci;
;1883:
;1884:	powerups = cent->currentState.powerups;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1885
;1885:	if ( !powerups ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $963
line 1886
;1886:		return;
ADDRGP4 $962
JUMPV
LABELV $963
line 1891
;1887:	}
;1888:
;1889:
;1890:	// quad gives a dlight
;1891:	if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $965
line 1892
;1892:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 0.2f, 0.2f, 1 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1893
;1893:	}
LABELV $965
line 1896
;1894:
;1895:	// flight plays a looped sound
;1896:	if ( powerups & ( 1 << PW_FLIGHT ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $967
line 1897
;1897:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.flightSound );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 cgs+956380+2316
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 1898
;1898:	}
LABELV $967
line 1900
;1899:
;1900:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 4
CNSTI4 1944
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1902
;1901:	// redflag
;1902:	if ( powerups & ( 1 << PW_REDFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $972
line 1903
;1903:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $974
line 1904
;1904:			CG_PlayerFlag( cent, cgs.media.redFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+136
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 1905
;1905:		}
ADDRGP4 $975
JUMPV
LABELV $974
line 1906
;1906:		else {
line 1907
;1907:			CG_TrailItem( cent, cgs.media.redFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+44
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 1908
;1908:		}
LABELV $975
line 1909
;1909:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 1.0, 0.2f, 0.2f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1910
;1910:	}
LABELV $972
line 1913
;1911:
;1912:	// blueflag
;1913:	if ( powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $980
line 1914
;1914:		if (ci->newAnims){
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $982
line 1915
;1915:			CG_PlayerFlag( cent, cgs.media.blueFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+140
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 1916
;1916:		}
ADDRGP4 $983
JUMPV
LABELV $982
line 1917
;1917:		else {
line 1918
;1918:			CG_TrailItem( cent, cgs.media.blueFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+48
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 1919
;1919:		}
LABELV $983
line 1920
;1920:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 0.2f, 0.2f, 1.0 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1921
;1921:	}
LABELV $980
line 1924
;1922:
;1923:	// neutralflag
;1924:	if ( powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $988
line 1925
;1925:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $990
line 1926
;1926:			CG_PlayerFlag( cent, cgs.media.neutralFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+144
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 1927
;1927:		}
ADDRGP4 $991
JUMPV
LABELV $990
line 1928
;1928:		else {
line 1929
;1929:			CG_TrailItem( cent, cgs.media.neutralFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+52
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 1930
;1930:		}
LABELV $991
line 1931
;1931:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 1.0, 1.0, 1.0 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1932
;1932:	}
LABELV $988
line 1935
;1933:
;1934:	// haste leaves smoke trails
;1935:	if ( powerups & ( 1 << PW_HASTE ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $996
line 1936
;1936:		CG_HasteTrail( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HasteTrail
CALLV
pop
line 1937
;1937:	}
LABELV $996
line 1938
;1938:}
LABELV $962
endproc CG_PlayerPowerups 16 20
proc CG_PlayerFloatSprite 180 12
line 1948
;1939:
;1940:
;1941:/*
;1942:===============
;1943:CG_PlayerFloatSprite
;1944:
;1945:Float a sprite over the player's head
;1946:===============
;1947:*/
;1948:static void CG_PlayerFloatSprite( centity_t *cent, qhandle_t shader ) {
line 1952
;1949:	int				rf;
;1950:	refEntity_t		ent;
;1951:
;1952:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $999
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
NEI4 $999
line 1953
;1953:		rf = RF_THIRD_PERSON;		// only show in mirrors
ADDRLP4 176
CNSTI4 2
ASGNI4
line 1954
;1954:	} else {
ADDRGP4 $1000
JUMPV
LABELV $999
line 1955
;1955:		rf = 0;
ADDRLP4 176
CNSTI4 0
ASGNI4
line 1956
;1956:	}
LABELV $1000
line 1958
;1957:
;1958:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1959
;1959:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 1960
;1960:	ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 1961
;1961:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1962
;1962:	ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 4
INDIRI4
ASGNI4
line 1963
;1963:	ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 1964
;1964:	ent.renderfx = rf;
ADDRLP4 0+4
ADDRLP4 176
INDIRI4
ASGNI4
line 1965
;1965:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 1966
;1966:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 1967
;1967:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 1968
;1968:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 1969
;1969:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1970
;1970:}
LABELV $998
endproc CG_PlayerFloatSprite 180 12
proc CG_PlayerSprites 12 8
line 1981
;1971:
;1972:
;1973:
;1974:/*
;1975:===============
;1976:CG_PlayerSprites
;1977:
;1978:Float sprites over the player's head
;1979:===============
;1980:*/
;1981:static void CG_PlayerSprites( centity_t *cent ) {
line 1984
;1982:	int		team;
;1983:
;1984:	if ( cent->currentState.eFlags & EF_CONNECTION ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1017
line 1985
;1985:		CG_PlayerFloatSprite( cent, cgs.media.connectionShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+452
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1986
;1986:		return;
ADDRGP4 $1016
JUMPV
LABELV $1017
line 1989
;1987:	}
;1988:
;1989:	if ( cent->currentState.eFlags & EF_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1021
line 1990
;1990:		CG_PlayerFloatSprite( cent, cgs.media.balloonShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+448
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1991
;1991:		return;
ADDRGP4 $1016
JUMPV
LABELV $1021
line 1994
;1992:	}
;1993:
;1994:	if ( cent->currentState.eFlags & EF_AWARD_IMPRESSIVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1025
line 1995
;1995:		CG_PlayerFloatSprite( cent, cgs.media.medalImpressive );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+1796
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1996
;1996:		return;
ADDRGP4 $1016
JUMPV
LABELV $1025
line 1999
;1997:	}
;1998:
;1999:	if ( cent->currentState.eFlags & EF_AWARD_EXCELLENT ) {
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1029
line 2000
;2000:		CG_PlayerFloatSprite( cent, cgs.media.medalExcellent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+1800
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2001
;2001:		return;
ADDRGP4 $1016
JUMPV
LABELV $1029
line 2004
;2002:	}
;2003:
;2004:	if ( cent->currentState.eFlags & EF_AWARD_GAUNTLET ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1033
line 2005
;2005:		CG_PlayerFloatSprite( cent, cgs.media.medalGauntlet );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+1804
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2006
;2006:		return;
ADDRGP4 $1016
JUMPV
LABELV $1033
line 2009
;2007:	}
;2008:
;2009:	if ( cent->currentState.eFlags & EF_AWARD_DEFEND ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $1037
line 2010
;2010:		CG_PlayerFloatSprite( cent, cgs.media.medalDefend );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+1808
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2011
;2011:		return;
ADDRGP4 $1016
JUMPV
LABELV $1037
line 2014
;2012:	}
;2013:
;2014:	if ( cent->currentState.eFlags & EF_AWARD_ASSIST ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $1041
line 2015
;2015:		CG_PlayerFloatSprite( cent, cgs.media.medalAssist );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+1812
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2016
;2016:		return;
ADDRGP4 $1016
JUMPV
LABELV $1041
line 2019
;2017:	}
;2018:
;2019:	if ( cent->currentState.eFlags & EF_AWARD_CAP ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1045
line 2020
;2020:		CG_PlayerFloatSprite( cent, cgs.media.medalCapture );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+1816
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2021
;2021:		return;
ADDRGP4 $1016
JUMPV
LABELV $1045
line 2024
;2022:	}
;2023:
;2024:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
ADDRLP4 0
CNSTI4 1944
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
ASGNI4
line 2025
;2025:	if ( !(cent->currentState.eFlags & EF_DEAD) &&
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 0
NEI4 $1051
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1051
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $1051
ADDRGP4 cgs+342392
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1051
line 2027
;2026:		cg.snap->ps.persistant[PERS_TEAM] == team &&
;2027:		cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
line 2028
;2028:		if (cg_drawFriend.integer) {
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $1016
line 2029
;2029:			CG_PlayerFloatSprite( cent, cgs.media.friendShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+956380+444
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2030
;2030:		}
line 2031
;2031:		return;
LABELV $1051
line 2033
;2032:	}
;2033:}
LABELV $1016
endproc CG_PlayerSprites 12 8
lit
align 4
LABELV $1062
byte 4 3245342720
byte 4 3245342720
byte 4 0
align 4
LABELV $1063
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
code
proc CG_PlayerShadow 104 44
line 2045
;2034:
;2035:/*
;2036:===============
;2037:CG_PlayerShadow
;2038:
;2039:Returns the Z component of the surface being shadowed
;2040:
;2041:  should it return a full plane instead of a Z?
;2042:===============
;2043:*/
;2044:#define	SHADOW_DISTANCE		128
;2045:static qboolean CG_PlayerShadow( centity_t *cent, float *shadowPlane ) {
line 2046
;2046:	vec3_t		end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
ADDRLP4 72
ADDRGP4 $1062
INDIRB
ASGNB 12
ADDRLP4 84
ADDRGP4 $1063
INDIRB
ASGNB 12
line 2050
;2047:	trace_t		trace;
;2048:	float		alpha;
;2049:
;2050:	*shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 2052
;2051:
;2052:	if ( cg_shadows.integer == 0 ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1064
line 2053
;2053:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1061
JUMPV
LABELV $1064
line 2057
;2054:	}
;2055:
;2056:	// no shadows when invisible
;2057:	if ( cent->currentState.powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1067
line 2058
;2058:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1061
JUMPV
LABELV $1067
line 2062
;2059:	}
;2060:
;2061:	// send a trace down from the player to the ground
;2062:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2063
;2063:	end[2] -= SHADOW_DISTANCE;
ADDRLP4 60+8
ADDRLP4 60+8
INDIRF4
CNSTF4 1124073472
SUBF4
ASGNF4
line 2065
;2064:
;2065:	trap_CM_BoxTrace( &trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 0
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2068
;2066:
;2067:	// no shadow if too high
;2068:	if ( trace.fraction == 1.0 || trace.startsolid || trace.allsolid ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1075
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $1075
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $1070
LABELV $1075
line 2069
;2069:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1061
JUMPV
LABELV $1070
line 2072
;2070:	}
;2071:
;2072:	*shadowPlane = trace.endpos[2] + 1;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2074
;2073:
;2074:	if ( cg_shadows.integer != 1 ) {	// no mark for stencil or projection shadows
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $1078
line 2075
;2075:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1061
JUMPV
LABELV $1078
line 2079
;2076:	}
;2077:
;2078:	// fade the shadow out with height
;2079:	alpha = 1.0 - trace.fraction;
ADDRLP4 56
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2086
;2080:
;2081:	// bk0101022 - hack / FPE - bogus planes?
;2082:	//assert( DotProduct( trace.plane.normal, trace.plane.normal ) != 0.0f )
;2083:
;2084:	// add the mark as a temporary, so it goes directly to the renderer
;2085:	// without taking a spot in the cg_marks array
;2086:	CG_ImpactMark( cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal,
ADDRGP4 cgs+956380+1436
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTI4 0
ARGI4
CNSTF4 1103101952
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 2089
;2087:		cent->pe.legs.yawAngle, alpha,alpha,alpha,1, qfalse, 24, qtrue );
;2088:
;2089:	return qtrue;
CNSTI4 1
RETI4
LABELV $1061
endproc CG_PlayerShadow 104 44
proc CG_PlayerSplash 192 28
line 2100
;2090:}
;2091:
;2092:
;2093:/*
;2094:===============
;2095:CG_PlayerSplash
;2096:
;2097:Draw a mark at the water surface
;2098:===============
;2099:*/
;2100:static void CG_PlayerSplash( centity_t *cent ) {
line 2106
;2101:	vec3_t		start, end;
;2102:	trace_t		trace;
;2103:	int			contents;
;2104:	polyVert_t	verts[4];
;2105:
;2106:	if ( !cg_shadows.integer ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1087
line 2107
;2107:		return;
ADDRGP4 $1086
JUMPV
LABELV $1087
line 2110
;2108:	}
;2109:
;2110:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2111
;2111:	end[2] -= 24;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 2115
;2112:
;2113:	// if the feet aren't in liquid, don't make a mark
;2114:	// this won't handle moving water brushes, but they wouldn't draw right anyway...
;2115:	contents = CG_PointContents( end, 0 );
ADDRLP4 164
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 180
INDIRI4
ASGNI4
line 2116
;2116:	if ( !( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $1091
line 2117
;2117:		return;
ADDRGP4 $1086
JUMPV
LABELV $1091
line 2120
;2118:	}
;2119:
;2120:	VectorCopy( cent->lerpOrigin, start );
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2121
;2121:	start[2] += 32;
ADDRLP4 152+8
ADDRLP4 152+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2124
;2122:
;2123:	// if the head isn't out of liquid, don't make a mark
;2124:	contents = CG_PointContents( start, 0 );
ADDRLP4 152
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 184
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 184
INDIRI4
ASGNI4
line 2125
;2125:	if ( contents & ( CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 57
BANDI4
CNSTI4 0
EQI4 $1094
line 2126
;2126:		return;
ADDRGP4 $1086
JUMPV
LABELV $1094
line 2130
;2127:	}
;2128:
;2129:	// trace down to find the surface
;2130:	trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) );
ADDRLP4 96
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 164
ARGP4
ADDRLP4 188
CNSTP4 0
ASGNP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRLP4 188
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2132
;2131:
;2132:	if ( trace.fraction == 1.0 ) {
ADDRLP4 96+8
INDIRF4
CNSTF4 1065353216
NEF4 $1096
line 2133
;2133:		return;
ADDRGP4 $1086
JUMPV
LABELV $1096
line 2137
;2134:	}
;2135:
;2136:	// create a mark polygon
;2137:	VectorCopy( trace.endpos, verts[0].xyz );
ADDRLP4 0
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2138
;2138:	verts[0].xyz[0] -= 32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2139
;2139:	verts[0].xyz[1] -= 32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2140
;2140:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2141
;2141:	verts[0].st[1] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 2142
;2142:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 2143
;2143:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 2144
;2144:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 2145
;2145:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 2147
;2146:
;2147:	VectorCopy( trace.endpos, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2148
;2148:	verts[1].xyz[0] -= 32;
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2149
;2149:	verts[1].xyz[1] += 32;
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2150
;2150:	verts[1].st[0] = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 2151
;2151:	verts[1].st[1] = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 2152
;2152:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 2153
;2153:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 2154
;2154:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 2155
;2155:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 2157
;2156:
;2157:	VectorCopy( trace.endpos, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2158
;2158:	verts[2].xyz[0] += 32;
ADDRLP4 0+48
ADDRLP4 0+48
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2159
;2159:	verts[2].xyz[1] += 32;
ADDRLP4 0+48+4
ADDRLP4 0+48+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2160
;2160:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 2161
;2161:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 2162
;2162:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 2163
;2163:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 2164
;2164:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 2165
;2165:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 2167
;2166:
;2167:	VectorCopy( trace.endpos, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2168
;2168:	verts[3].xyz[0] += 32;
ADDRLP4 0+72
ADDRLP4 0+72
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2169
;2169:	verts[3].xyz[1] -= 32;
ADDRLP4 0+72+4
ADDRLP4 0+72+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2170
;2170:	verts[3].st[0] = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 2171
;2171:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 2172
;2172:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 2173
;2173:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 2174
;2174:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 2175
;2175:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 2177
;2176:
;2177:	trap_R_AddPolyToScene( cgs.media.wakeMarkShader, 4, verts );
ADDRGP4 cgs+956380+1496
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 2178
;2178:}
LABELV $1086
endproc CG_PlayerSplash 192 28
export CG_AddRefEntityWithPowerups
proc CG_AddRefEntityWithPowerups 8 4
line 2190
;2179:
;2180:
;2181:
;2182:/*
;2183:===============
;2184:CG_AddRefEntityWithPowerups
;2185:
;2186:Adds a piece with modifications or duplications for powerups
;2187:Also called by CG_Missile for quad rockets, but nobody can tell...
;2188:===============
;2189:*/
;2190:void CG_AddRefEntityWithPowerups( refEntity_t *ent, entityState_t *state, int team, qboolean isMissile ) {
line 2192
;2191:
;2192:	if ( state->powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1177
line 2193
;2193:            if( (cgs.dmflags & DF_INVIS) == 0) {
ADDRGP4 cgs+339044
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $1178
line 2194
;2194:		ent->customShader = cgs.media.invisShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+956380+1548
INDIRI4
ASGNI4
line 2195
;2195:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2196
;2196:            }
line 2197
;2197:	} else {
ADDRGP4 $1178
JUMPV
LABELV $1177
line 2207
;2198:		/*
;2199:		if ( state->eFlags & EF_KAMIKAZE ) {
;2200:			if (team == TEAM_BLUE)
;2201:				ent->customShader = cgs.media.blueKamikazeShader;
;2202:			else
;2203:				ent->customShader = cgs.media.redKamikazeShader;
;2204:			trap_R_AddRefEntityToScene( ent );
;2205:		}
;2206:		else {*/
;2207:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2209
;2208:		//}
;2209:                        if(!isMissile && (mod_overlay) && !(state->eFlags & EF_DEAD)  ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 12
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1184
ADDRGP4 mod_overlay
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1184
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 0
INDIRI4
NEI4 $1184
line 2210
;2210:                            switch(team) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $1188
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $1197
ADDRGP4 $1186
JUMPV
LABELV $1188
line 2212
;2211:                                case TEAM_RED:
;2212:									if(mod_overlay == 1){
ADDRGP4 mod_overlay
INDIRI4
CNSTI4 1
NEI4 $1189
line 2213
;2213:                                    ent->customShader = cgs.media.redOverlay;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+956380+1632
INDIRI4
ASGNI4
line 2214
;2214:                                    trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2215
;2215:									}
LABELV $1189
line 2216
;2216:									if(mod_overlay == 2){
ADDRGP4 mod_overlay
INDIRI4
CNSTI4 2
NEI4 $1187
line 2217
;2217:                                    ent->customShader = cgs.media.redOverlay;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+956380+1632
INDIRI4
ASGNI4
line 2218
;2218:                                    trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2219
;2219:									}
line 2220
;2220:                                    break;
ADDRGP4 $1187
JUMPV
LABELV $1197
line 2222
;2221:                                case TEAM_BLUE:
;2222:									if(mod_overlay == 1){
ADDRGP4 mod_overlay
INDIRI4
CNSTI4 1
NEI4 $1198
line 2223
;2223:                                    ent->customShader = cgs.media.blueOverlay;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+956380+1636
INDIRI4
ASGNI4
line 2224
;2224:                                    trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2225
;2225:									}
LABELV $1198
line 2226
;2226:									if(mod_overlay == 3){
ADDRGP4 mod_overlay
INDIRI4
CNSTI4 3
NEI4 $1187
line 2227
;2227:                                    ent->customShader = cgs.media.blueOverlay;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+956380+1636
INDIRI4
ASGNI4
line 2228
;2228:                                    trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2229
;2229:									}
line 2230
;2230:                                    break;
ADDRGP4 $1187
JUMPV
LABELV $1186
line 2232
;2231:                                default:
;2232:									if(mod_overlay){
ADDRGP4 mod_overlay
INDIRI4
CNSTI4 0
EQI4 $1206
line 2233
;2233:                                    ent->customShader = cgs.media.neutralOverlay;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+956380+1628
INDIRI4
ASGNI4
line 2234
;2234:                                    trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2235
;2235:									}
LABELV $1206
line 2236
;2236:                            }
LABELV $1187
line 2237
;2237:                        }
LABELV $1184
line 2239
;2238:
;2239:		if ( state->powerups & ( 1 << PW_QUAD ) )
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1210
line 2240
;2240:		{
line 2241
;2241:			if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1212
line 2242
;2242:				ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+956380+1540
INDIRI4
ASGNI4
ADDRGP4 $1213
JUMPV
LABELV $1212
line 2244
;2243:			else
;2244:				ent->customShader = cgs.media.quadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+956380+1536
INDIRI4
ASGNI4
LABELV $1213
line 2245
;2245:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2246
;2246:		}
LABELV $1210
line 2247
;2247:		if ( state->powerups & ( 1 << PW_REGEN ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1218
line 2248
;2248:			if ( ( ( cg.time / 100 ) % 10 ) == 1 ) {
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 100
DIVI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $1220
line 2249
;2249:				ent->customShader = cgs.media.regenShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+956380+1552
INDIRI4
ASGNI4
line 2250
;2250:				trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2251
;2251:			}
LABELV $1220
line 2252
;2252:		}
LABELV $1218
line 2253
;2253:		if ( state->powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1225
line 2254
;2254:			ent->customShader = cgs.media.battleSuitShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+956380+1556
INDIRI4
ASGNI4
line 2255
;2255:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2256
;2256:		}
LABELV $1225
line 2257
;2257:	}
LABELV $1178
line 2258
;2258:}
LABELV $1176
endproc CG_AddRefEntityWithPowerups 8 4
export CG_LightVerts
proc CG_LightVerts 88 16
line 2268
;2259:
;2260:
;2261:
;2262:/*
;2263:=================
;2264:CG_LightVerts
;2265:=================
;2266:*/
;2267:int CG_LightVerts( vec3_t normal, int numVerts, polyVert_t *verts )
;2268:{
line 2275
;2269:	int				i, j;
;2270:	float			incoming;
;2271:	vec3_t			ambientLight;
;2272:	vec3_t			lightDir;
;2273:	vec3_t			directedLight;
;2274:
;2275:	trap_R_LightForPoint( verts[0].xyz, ambientLight, directedLight, lightDir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 2277
;2276:
;2277:	for (i = 0; i < numVerts; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1233
JUMPV
LABELV $1230
line 2278
;2278:		incoming = DotProduct (normal, lightDir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2279
;2279:		if ( incoming <= 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $1236
line 2280
;2280:			verts[i].modulate[0] = ambientLight[0];
ADDRLP4 56
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 60
CNSTF4 1325400064
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
LTF4 $1239
ADDRLP4 52
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1240
JUMPV
LABELV $1239
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1240
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 52
INDIRU4
CVUU1 4
ASGNU1
line 2281
;2281:			verts[i].modulate[1] = ambientLight[1];
ADDRLP4 68
ADDRLP4 12+4
INDIRF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $1243
ADDRLP4 64
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1244
JUMPV
LABELV $1243
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1244
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 64
INDIRU4
CVUU1 4
ASGNU1
line 2282
;2282:			verts[i].modulate[2] = ambientLight[2];
ADDRLP4 80
ADDRLP4 12+8
INDIRF4
ASGNF4
ADDRLP4 84
CNSTF4 1325400064
ASGNF4
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
LTF4 $1247
ADDRLP4 76
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1248
JUMPV
LABELV $1247
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1248
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 76
INDIRU4
CVUU1 4
ASGNU1
line 2283
;2283:			verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2284
;2284:			continue;
ADDRGP4 $1231
JUMPV
LABELV $1236
line 2286
;2285:		}
;2286:		j = ( ambientLight[0] + incoming * directedLight[0] );
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2287
;2287:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1249
line 2288
;2288:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2289
;2289:		}
LABELV $1249
line 2290
;2290:		verts[i].modulate[0] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2292
;2291:
;2292:		j = ( ambientLight[1] + incoming * directedLight[1] );
ADDRLP4 0
ADDRLP4 12+4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2293
;2293:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1253
line 2294
;2294:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2295
;2295:		}
LABELV $1253
line 2296
;2296:		verts[i].modulate[1] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2298
;2297:
;2298:		j = ( ambientLight[2] + incoming * directedLight[2] );
ADDRLP4 0
ADDRLP4 12+8
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2299
;2299:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1257
line 2300
;2300:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2301
;2301:		}
LABELV $1257
line 2302
;2302:		verts[i].modulate[2] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2304
;2303:
;2304:		verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2305
;2305:	}
LABELV $1231
line 2277
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1233
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1230
line 2306
;2306:	return qtrue;
CNSTI4 1
RETI4
LABELV $1229
endproc CG_LightVerts 88 16
export CG_Player
proc CG_Player 1148 28
line 2316
;2307:}
;2308:
;2309:/*
;2310:===============
;2311:CG_Player
;2312:===============
;2313:*/
;2314://extern	vmCvar_t	cg_leiChibi;
;2315:
;2316:void CG_Player( centity_t *cent ) {
line 2331
;2317:	clientInfo_t	*ci;
;2318:	refEntity_t		legs;
;2319:	refEntity_t		torso;
;2320:	refEntity_t		head;
;2321:	int				clientNum;
;2322:	int				renderfx;
;2323:	qboolean		shadow;
;2324:	float			shadowPlane;
;2325:	refEntity_t		skull;
;2326:	refEntity_t		powerup;
;2327:	int				t;
;2328:	float			c;
;2329:	float			angle;
;2330:	vec3_t			dir, angles;
;2331:	int camereyes = 0;
ADDRLP4 944
CNSTI4 0
ASGNI4
line 2333
;2332:	// leilei - chibi hack
;2333:	float chibifactorbody = 0.0f;
ADDRLP4 708
CNSTF4 0
ASGNF4
line 2334
;2334:	float chibifactortorso = 0.0f;
ADDRLP4 712
CNSTF4 0
ASGNF4
line 2335
;2335:	float chibifactorhead = 0.0f;
ADDRLP4 716
CNSTF4 0
ASGNF4
line 2341
;2336:	byte			bcol[4];
;2337:	int texp;
;2338:	int texto;
;2339:	int texhe;
;2340:
;2341:		if (cg_leiChibi.integer > 0) {
ADDRGP4 cg_leiChibi+12
INDIRI4
CNSTI4 0
LEI4 $1260
line 2342
;2342:		if (cg_leiChibi.integer == 1) {
ADDRGP4 cg_leiChibi+12
INDIRI4
CNSTI4 1
NEI4 $1263
line 2344
;2343:			// chibi SD proportion
;2344:			chibifactortorso = 0.0f;
ADDRLP4 712
CNSTF4 0
ASGNF4
line 2345
;2345:			chibifactorbody = 0.62f;
ADDRLP4 708
CNSTF4 1058977874
ASGNF4
line 2346
;2346:			chibifactorhead = 2.7f;
ADDRLP4 716
CNSTF4 1076677837
ASGNF4
line 2347
;2347:		} else if (cg_leiChibi.integer == 2) {
ADDRGP4 $1261
JUMPV
LABELV $1263
ADDRGP4 cg_leiChibi+12
INDIRI4
CNSTI4 2
NEI4 $1266
line 2349
;2348:			// slightly younger proportion
;2349:			chibifactorbody = 0.92f;
ADDRLP4 708
CNSTF4 1064011039
ASGNF4
line 2350
;2350:			chibifactortorso = 0.82f;
ADDRLP4 712
CNSTF4 1062333317
ASGNF4
line 2351
;2351:			chibifactorhead = 1.30f;
ADDRLP4 716
CNSTF4 1067869798
ASGNF4
line 2352
;2352:		} else if (cg_leiChibi.integer == 3) {
ADDRGP4 $1261
JUMPV
LABELV $1266
ADDRGP4 cg_leiChibi+12
INDIRI4
CNSTI4 3
NEI4 $1269
line 2354
;2353:			// slightly more 'real' proportion
;2354:			chibifactorbody = 0.92f;
ADDRLP4 708
CNSTF4 1064011039
ASGNF4
line 2355
;2355:			chibifactortorso = 0.97f;
ADDRLP4 712
CNSTF4 1064849900
ASGNF4
line 2356
;2356:			chibifactorhead = 0.92f;
ADDRLP4 716
CNSTF4 1064011039
ASGNF4
line 2357
;2357:		} else if (cg_leiChibi.integer == 4) {
ADDRGP4 $1261
JUMPV
LABELV $1269
ADDRGP4 cg_leiChibi+12
INDIRI4
CNSTI4 4
NEI4 $1261
line 2359
;2358:			// big torso
;2359:			chibifactorbody = 0.85f;
ADDRLP4 708
CNSTF4 1062836634
ASGNF4
line 2360
;2360:			chibifactortorso = 1.3f;
ADDRLP4 712
CNSTF4 1067869798
ASGNF4
line 2361
;2361:			chibifactorhead = 0.91f;
ADDRLP4 716
CNSTF4 1063843267
ASGNF4
line 2362
;2362:		}
line 2363
;2363:	} else {
ADDRGP4 $1261
JUMPV
LABELV $1260
line 2364
;2364:		chibifactorbody = chibifactortorso = chibifactorhead = 0; // normal scale...
ADDRLP4 968
CNSTF4 0
ASGNF4
ADDRLP4 716
ADDRLP4 968
INDIRF4
ASGNF4
ADDRLP4 712
ADDRLP4 968
INDIRF4
ASGNF4
ADDRLP4 708
ADDRLP4 968
INDIRF4
ASGNF4
line 2365
;2365:	}
LABELV $1261
line 2370
;2366:
;2367:	// the client number is stored in clientNum.  It can't be derived
;2368:	// from the entity number, because a single client may have
;2369:	// multiple corpses on the level using the same clientinfo
;2370:	clientNum = cent->currentState.clientNum;
ADDRLP4 904
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 2371
;2371:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 904
INDIRI4
CNSTI4 0
LTI4 $1277
ADDRLP4 904
INDIRI4
CNSTI4 256
LTI4 $1275
LABELV $1277
line 2372
;2372:		CG_Error( "Bad clientNum on player entity");
ADDRGP4 $1278
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2373
;2373:	}
LABELV $1275
line 2374
;2374:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 352
CNSTI4 1944
ADDRLP4 904
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 2378
;2375:
;2376:	// it is possible to see corpses from disconnected players that may
;2377:	// not have valid clientinfo
;2378:	if ( !ci->infoValid ) {
ADDRLP4 352
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1280
line 2379
;2379:		return;
ADDRGP4 $1259
JUMPV
LABELV $1280
line 2383
;2380:	}
;2381:
;2382:	// get the player model information
;2383:	renderfx = 0;
ADDRLP4 896
CNSTI4 0
ASGNI4
line 2384
;2384:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1282
line 2385
;2385:		camereyes = 1;	// it's me!
ADDRLP4 944
CNSTI4 1
ASGNI4
line 2386
;2386:		if (!cg.renderingThirdPerson) {
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
NEI4 $1285
line 2387
;2387:			renderfx = RF_THIRD_PERSON;			// only draw in mirrors
ADDRLP4 896
CNSTI4 2
ASGNI4
line 2388
;2388:		} else {
ADDRGP4 $1286
JUMPV
LABELV $1285
line 2389
;2389:			if (cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
EQI4 $1288
line 2390
;2390:				return;
ADDRGP4 $1259
JUMPV
LABELV $1288
line 2392
;2391:			}
;2392:		}
LABELV $1286
line 2393
;2393:	}
LABELV $1282
line 2396
;2394:
;2395:
;2396:	memset( &legs, 0, sizeof(legs) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2397
;2397:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 176
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2398
;2398:	memset( &head, 0, sizeof(head) );
ADDRLP4 356
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2401
;2399:
;2400:	// get the rotation information
;2401:	CG_PlayerAngles( cent, legs.axis, torso.axis, head.axis );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 176+28
ARGP4
ADDRLP4 356+28
ARGP4
ADDRGP4 CG_PlayerAngles
CALLV
pop
line 2404
;2402:
;2403:	// get the animation state (after rotation, to allow feet shuffle)
;2404:	CG_PlayerAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRLP4 176+96
ARGP4
ADDRLP4 176+80
ARGP4
ADDRLP4 176+100
ARGP4
ADDRGP4 CG_PlayerAnimation
CALLV
pop
line 2408
;2405:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;2406:
;2407:	// add the talk baloon or disconnect icon
;2408:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1300
line 2410
;2409://	CG_PlayerSprites( cent );
;2410:	} else {
ADDRGP4 $1301
JUMPV
LABELV $1300
line 2411
;2411:	if(cgs.gametype != GT_SINGLE)
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $1303
line 2412
;2412:	CG_PlayerSprites( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
LABELV $1303
line 2413
;2413:	}
LABELV $1301
line 2416
;2414:
;2415:	// add the shadow
;2416:	shadow = CG_PlayerShadow( cent, &shadowPlane );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 900
ARGP4
ADDRLP4 972
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 948
ADDRLP4 972
INDIRI4
ASGNI4
line 2421
;2417:
;2418:	// add a water splash if partially in and out of water
;2419://	CG_PlayerSplash( cent );
;2420:
;2421:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $1306
ADDRLP4 948
INDIRI4
CNSTI4 0
EQI4 $1306
line 2422
;2422:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 896
ADDRLP4 896
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2423
;2423:	}
LABELV $1306
line 2424
;2424:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 896
ADDRLP4 896
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2425
;2425:	if( cgs.gametype == GT_HARVESTER ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
NEI4 $1309
line 2426
;2426:		CG_PlayerTokens( cent, renderfx );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 896
INDIRI4
ARGI4
ADDRGP4 CG_PlayerTokens
CALLV
pop
line 2427
;2427:	}
LABELV $1309
line 2447
;2428:
;2429:/*	if ( cent->currentState.eFlags & EF_DEAD ) {
;2430:		bcol[0] = teamcolormodels[ci->team][0]*0xff;
;2431:		bcol[1] = teamcolormodels[ci->team][1]*0xff;
;2432:		bcol[2] = teamcolormodels[ci->team][2]*0xff;
;2433:	} else {
;2434:		bcol[0] = teamcolormodels[ci->team][0]*0xff;
;2435:		bcol[1] = teamcolormodels[ci->team][1]*0xff;
;2436:		bcol[2] = teamcolormodels[ci->team][2]*0xff;
;2437:	}
;2438:	bcol[3] = 0xff;
;2439:
;2440:	Byte4Copy( bcol, legs.shaderRGBA );
;2441:	Byte4Copy( bcol, torso.shaderRGBA );
;2442:	Byte4Copy( bcol, head.shaderRGBA );*/
;2443:
;2444:	//
;2445:	// add the legs
;2446:	//
;2447:	legs.hModel = ci->legsModel;
ADDRLP4 0+8
ADDRLP4 352
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 2448
;2448:	legs.customSkin = ci->legsSkin;
ADDRLP4 0+108
ADDRLP4 352
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 2449
;2449:	if(!legs.customSkin){
ADDRLP4 0+108
INDIRI4
CNSTI4 0
NEI4 $1314
line 2450
;2450:	legs.customShader = ci->legsShader;	
ADDRLP4 0+112
ADDRLP4 352
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ASGNI4
line 2451
;2451:	}
LABELV $1314
line 2452
;2452:	legs.shaderRGBA[0] = ci->plred;
ADDRLP4 0+116
ADDRLP4 352
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2453
;2453:	legs.shaderRGBA[1] = ci->plgreen;
ADDRLP4 0+116+1
ADDRLP4 352
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2454
;2454:	legs.shaderRGBA[2] = ci->plblue;
ADDRLP4 0+116+2
ADDRLP4 352
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2455
;2455:	legs.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2456
;2456:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2458
;2457:
;2458:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2460
;2459:	
;2460:	if (chibifactorbody) {
ADDRLP4 708
INDIRF4
CNSTF4 0
EQF4 $1327
line 2461
;2461:		VectorScale(legs.axis[0], chibifactorbody, legs.axis[0]);
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 708
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 708
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 708
INDIRF4
MULF4
ASGNF4
line 2462
;2462:		VectorScale(legs.axis[1], chibifactorbody, legs.axis[1]);
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 708
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 708
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 708
INDIRF4
MULF4
ASGNF4
line 2463
;2463:		VectorScale(legs.axis[2], chibifactorbody, legs.axis[2]);
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 708
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 708
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 708
INDIRF4
MULF4
ASGNF4
line 2464
;2464:	}
LABELV $1327
line 2466
;2465:	
;2466:	if(ci->vehiclenum > 0){
ADDRLP4 352
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1371
line 2467
;2467:		VectorScale(legs.axis[0], 0, legs.axis[0]);
ADDRLP4 0+28
CNSTF4 0
ADDRLP4 0+28
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
CNSTF4 0
ADDRLP4 0+28+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
CNSTF4 0
ADDRLP4 0+28+8
INDIRF4
MULF4
ASGNF4
line 2468
;2468:		VectorScale(legs.axis[1], 0, legs.axis[1]);
ADDRLP4 0+28+12
CNSTF4 0
ADDRLP4 0+28+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
CNSTF4 0
ADDRLP4 0+28+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
CNSTF4 0
ADDRLP4 0+28+12+8
INDIRF4
MULF4
ASGNF4
line 2469
;2469:		VectorScale(legs.axis[2], 0, legs.axis[2]);
ADDRLP4 0+28+24
CNSTF4 0
ADDRLP4 0+28+24
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
CNSTF4 0
ADDRLP4 0+28+24+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
CNSTF4 0
ADDRLP4 0+28+24+8
INDIRF4
MULF4
ASGNF4
line 2470
;2470:	}
LABELV $1371
line 2473
;2471:
;2472:
;2473:	legs.shadowPlane = shadowPlane;
ADDRLP4 0+24
ADDRLP4 900
INDIRF4
ASGNF4
line 2474
;2474:	legs.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 896
INDIRI4
ASGNI4
line 2475
;2475:	VectorCopy (legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2477
;2476:
;2477:	if (cg.renderingEyesPerson){
ADDRGP4 cg+1868920
INDIRI4
CNSTI4 0
EQI4 $1419
line 2478
;2478:			legs.renderfx &= RF_FIRST_PERSON;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 4
BANDI4
ASGNI4
line 2479
;2479:	}
LABELV $1419
line 2482
;2480:
;2481:
;2482:	CG_AddRefEntityWithPowerups( &legs, &cent->currentState, ci->team, qfalse );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2485
;2483:
;2484:	// if the model failed, allow the default nullmodel to be displayed
;2485:	if (!legs.hModel) {
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $1423
line 2486
;2486:		return;
ADDRGP4 $1259
JUMPV
LABELV $1423
line 2492
;2487:	}
;2488:
;2489:	//
;2490:	// add the torso
;2491:	//
;2492:	torso.hModel = ci->torsoModel;
ADDRLP4 176+8
ADDRLP4 352
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ASGNI4
line 2493
;2493:	if (!torso.hModel) {
ADDRLP4 176+8
INDIRI4
CNSTI4 0
NEI4 $1427
line 2494
;2494:		return;
ADDRGP4 $1259
JUMPV
LABELV $1427
line 2497
;2495:	}
;2496:
;2497:	torso.customSkin = ci->torsoSkin;
ADDRLP4 176+108
ADDRLP4 352
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 2498
;2498:	if(!torso.customSkin){
ADDRLP4 176+108
INDIRI4
CNSTI4 0
NEI4 $1431
line 2499
;2499:	torso.customShader = ci->torsoShader;	
ADDRLP4 176+112
ADDRLP4 352
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 2500
;2500:	}
LABELV $1431
line 2501
;2501:	torso.shaderRGBA[0] = ci->tolred;
ADDRLP4 176+116
ADDRLP4 352
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2502
;2502:	torso.shaderRGBA[1] = ci->tolgreen;
ADDRLP4 176+116+1
ADDRLP4 352
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2503
;2503:	torso.shaderRGBA[2] = ci->tolblue;
ADDRLP4 176+116+2
ADDRLP4 352
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2504
;2504:	torso.shaderRGBA[3] = 255;
ADDRLP4 176+116+3
CNSTU1 255
ASGNU1
line 2506
;2505:
;2506:	VectorCopy( cent->lerpOrigin, torso.lightingOrigin );
ADDRLP4 176+12
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2508
;2507:
;2508:	CG_PositionRotatedEntityOnTag( &torso, &legs, ci->legsModel, "tag_torso");
ADDRLP4 176
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1443
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2510
;2509:
;2510:	torso.shadowPlane = shadowPlane;
ADDRLP4 176+24
ADDRLP4 900
INDIRF4
ASGNF4
line 2511
;2511:	torso.renderfx = renderfx;
ADDRLP4 176+4
ADDRLP4 896
INDIRI4
ASGNI4
line 2512
;2512:	if (cg.renderingEyesPerson){
ADDRGP4 cg+1868920
INDIRI4
CNSTI4 0
EQI4 $1446
line 2513
;2513:			torso.renderfx &= RF_FIRST_PERSON;
ADDRLP4 176+4
ADDRLP4 176+4
INDIRI4
CNSTI4 4
BANDI4
ASGNI4
line 2514
;2514:		}
LABELV $1446
line 2516
;2515:
;2516:	if (chibifactortorso) {
ADDRLP4 712
INDIRF4
CNSTF4 0
EQF4 $1450
line 2517
;2517:		VectorScale(torso.axis[0], chibifactortorso, torso.axis[0]);
ADDRLP4 176+28
ADDRLP4 176+28
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ASGNF4
ADDRLP4 176+28+4
ADDRLP4 176+28+4
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ASGNF4
ADDRLP4 176+28+8
ADDRLP4 176+28+8
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ASGNF4
line 2518
;2518:		VectorScale(torso.axis[1], chibifactortorso, torso.axis[1]);
ADDRLP4 176+28+12
ADDRLP4 176+28+12
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ASGNF4
ADDRLP4 176+28+12+4
ADDRLP4 176+28+12+4
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ASGNF4
ADDRLP4 176+28+12+8
ADDRLP4 176+28+12+8
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ASGNF4
line 2519
;2519:		VectorScale(torso.axis[2], chibifactortorso, torso.axis[2]);
ADDRLP4 176+28+24
ADDRLP4 176+28+24
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ASGNF4
ADDRLP4 176+28+24+4
ADDRLP4 176+28+24+4
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ASGNF4
ADDRLP4 176+28+24+8
ADDRLP4 176+28+24+8
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ASGNF4
line 2520
;2520:	}
LABELV $1450
line 2522
;2521:
;2522:	if ( ci->plradius ) {
ADDRLP4 352
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1494
line 2524
;2523:
;2524:	}
LABELV $1494
line 2526
;2525:	
;2526:	CG_AddRefEntityWithPowerups( &torso, &cent->currentState, ci->team, qfalse );
ADDRLP4 176
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2528
;2527:
;2528:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1496
line 2530
;2529://	CG_PlayerSprites( cent );
;2530:	} else {
ADDRGP4 $1497
JUMPV
LABELV $1496
line 2531
;2531:	if ( cent->currentState.eFlags & EF_KAMIKAZE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1499
line 2533
;2532:
;2533:		memset( &skull, 0, sizeof(skull) );
ADDRLP4 720
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2535
;2534:
;2535:		VectorCopy( cent->lerpOrigin, skull.lightingOrigin );
ADDRLP4 720+12
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2536
;2536:		skull.shadowPlane = shadowPlane;
ADDRLP4 720+24
ADDRLP4 900
INDIRF4
ASGNF4
line 2537
;2537:		skull.renderfx = renderfx;
ADDRLP4 720+4
ADDRLP4 896
INDIRI4
ASGNI4
line 2539
;2538:
;2539:		if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1504
line 2541
;2540:			// one skull bobbing above the dead body
;2541:			angle = ((cg.time / 7) & 255) * (M_PI * 2) / 255;
ADDRLP4 940
CNSTF4 1086918619
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 7
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 2542
;2542:			if (angle > M_PI * 2)
ADDRLP4 940
INDIRF4
CNSTF4 1086918619
LEF4 $1507
line 2543
;2543:				angle -= (float)M_PI * 2;
ADDRLP4 940
ADDRLP4 940
INDIRF4
CNSTF4 1086918619
SUBF4
ASGNF4
LABELV $1507
line 2544
;2544:			dir[0] = sin(angle) * 20;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 976
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 908
CNSTF4 1101004800
ADDRLP4 976
INDIRF4
MULF4
ASGNF4
line 2545
;2545:			dir[1] = cos(angle) * 20;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 980
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 908+4
CNSTF4 1101004800
ADDRLP4 980
INDIRF4
MULF4
ASGNF4
line 2546
;2546:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
ADDRLP4 940
CNSTF4 1086918619
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 4
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 2547
;2547:			dir[2] = 15 + sin(angle) * 8;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 984
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 908+8
CNSTF4 1090519040
ADDRLP4 984
INDIRF4
MULF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 2548
;2548:			VectorAdd(torso.origin, dir, skull.origin);
ADDRLP4 720+68
ADDRLP4 176+68
INDIRF4
ADDRLP4 908
INDIRF4
ADDF4
ASGNF4
ADDRLP4 720+68+4
ADDRLP4 176+68+4
INDIRF4
ADDRLP4 908+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 720+68+8
ADDRLP4 176+68+8
INDIRF4
ADDRLP4 908+8
INDIRF4
ADDF4
ASGNF4
line 2550
;2549:
;2550:			dir[2] = 0;
ADDRLP4 908+8
CNSTF4 0
ASGNF4
line 2551
;2551:			VectorCopy(dir, skull.axis[1]);
ADDRLP4 720+28+12
ADDRLP4 908
INDIRB
ASGNB 12
line 2552
;2552:			VectorNormalize(skull.axis[1]);
ADDRLP4 720+28+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2553
;2553:			VectorSet(skull.axis[2], 0, 0, 1);
ADDRLP4 720+28+24
CNSTF4 0
ASGNF4
ADDRLP4 720+28+24+4
CNSTF4 0
ASGNF4
ADDRLP4 720+28+24+8
CNSTF4 1065353216
ASGNF4
line 2554
;2554:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
ADDRLP4 720+28+12
ARGP4
ADDRLP4 720+28+24
ARGP4
ADDRLP4 720+28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2556
;2555:
;2556:			skull.hModel = cgs.media.kamikazeHeadModel;
ADDRLP4 720+8
ADDRGP4 cgs+956380+1700
INDIRI4
ASGNI4
line 2557
;2557:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 720
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2558
;2558:			skull.hModel = cgs.media.kamikazeHeadTrail;
ADDRLP4 720+8
ADDRGP4 cgs+956380+1704
INDIRI4
ASGNI4
line 2559
;2559:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 720
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2560
;2560:		}
ADDRGP4 $1505
JUMPV
LABELV $1504
line 2561
;2561:		else {
line 2563
;2562:			// three skulls spinning around the player
;2563:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
ADDRLP4 940
CNSTF4 1086918619
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 4
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 2564
;2564:			dir[0] = cos(angle) * 20;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 976
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 908
CNSTF4 1101004800
ADDRLP4 976
INDIRF4
MULF4
ASGNF4
line 2565
;2565:			dir[1] = sin(angle) * 20;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 980
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 908+4
CNSTF4 1101004800
ADDRLP4 980
INDIRF4
MULF4
ASGNF4
line 2566
;2566:			dir[2] = cos(angle) * 20;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 984
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 908+8
CNSTF4 1101004800
ADDRLP4 984
INDIRF4
MULF4
ASGNF4
line 2567
;2567:			VectorAdd(torso.origin, dir, skull.origin);
ADDRLP4 720+68
ADDRLP4 176+68
INDIRF4
ADDRLP4 908
INDIRF4
ADDF4
ASGNF4
ADDRLP4 720+68+4
ADDRLP4 176+68+4
INDIRF4
ADDRLP4 908+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 720+68+8
ADDRLP4 176+68+8
INDIRF4
ADDRLP4 908+8
INDIRF4
ADDF4
ASGNF4
line 2569
;2568:
;2569:			angles[0] = sin(angle) * 30;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 988
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 920
CNSTF4 1106247680
ADDRLP4 988
INDIRF4
MULF4
ASGNF4
line 2570
;2570:			angles[1] = (angle * 180 / M_PI) + 90;
ADDRLP4 920+4
CNSTF4 1127481344
ADDRLP4 940
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 2571
;2571:			if (angles[1] > 360)
ADDRLP4 920+4
INDIRF4
CNSTF4 1135869952
LEF4 $1564
line 2572
;2572:				angles[1] -= 360;
ADDRLP4 920+4
ADDRLP4 920+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $1564
line 2573
;2573:			angles[2] = 0;
ADDRLP4 920+8
CNSTF4 0
ASGNF4
line 2574
;2574:			AnglesToAxis( angles, skull.axis );
ADDRLP4 920
ARGP4
ADDRLP4 720+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2585
;2575:
;2576:			/*
;2577:			dir[2] = 0;
;2578:			VectorInverse(dir);
;2579:			VectorCopy(dir, skull.axis[1]);
;2580:			VectorNormalize(skull.axis[1]);
;2581:			VectorSet(skull.axis[2], 0, 0, 1);
;2582:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2583:			*/
;2584:
;2585:			skull.hModel = cgs.media.kamikazeHeadModel;
ADDRLP4 720+8
ADDRGP4 cgs+956380+1700
INDIRI4
ASGNI4
line 2586
;2586:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 720
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2588
;2587:			// flip the trail because this skull is spinning in the other direction
;2588:			VectorInverse(skull.axis[1]);
ADDRLP4 720+28+12
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 2589
;2589:			skull.hModel = cgs.media.kamikazeHeadTrail;
ADDRLP4 720+8
ADDRGP4 cgs+956380+1704
INDIRI4
ASGNI4
line 2590
;2590:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 720
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2592
;2591:
;2592:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255 + M_PI;
ADDRLP4 940
CNSTF4 1086918619
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 4
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
CNSTF4 1078530011
ADDF4
ASGNF4
line 2593
;2593:			if (angle > M_PI * 2)
ADDRLP4 940
INDIRF4
CNSTF4 1086918619
LEF4 $1579
line 2594
;2594:				angle -= (float)M_PI * 2;
ADDRLP4 940
ADDRLP4 940
INDIRF4
CNSTF4 1086918619
SUBF4
ASGNF4
LABELV $1579
line 2595
;2595:			dir[0] = sin(angle) * 20;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 992
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 908
CNSTF4 1101004800
ADDRLP4 992
INDIRF4
MULF4
ASGNF4
line 2596
;2596:			dir[1] = cos(angle) * 20;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 996
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 908+4
CNSTF4 1101004800
ADDRLP4 996
INDIRF4
MULF4
ASGNF4
line 2597
;2597:			dir[2] = cos(angle) * 20;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 1000
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 908+8
CNSTF4 1101004800
ADDRLP4 1000
INDIRF4
MULF4
ASGNF4
line 2598
;2598:			VectorAdd(torso.origin, dir, skull.origin);
ADDRLP4 720+68
ADDRLP4 176+68
INDIRF4
ADDRLP4 908
INDIRF4
ADDF4
ASGNF4
ADDRLP4 720+68+4
ADDRLP4 176+68+4
INDIRF4
ADDRLP4 908+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 720+68+8
ADDRLP4 176+68+8
INDIRF4
ADDRLP4 908+8
INDIRF4
ADDF4
ASGNF4
line 2600
;2599:
;2600:			angles[0] = cos(angle - 0.5 * M_PI) * 30;
ADDRLP4 940
INDIRF4
CNSTF4 1070141403
SUBF4
ARGF4
ADDRLP4 1004
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 920
CNSTF4 1106247680
ADDRLP4 1004
INDIRF4
MULF4
ASGNF4
line 2601
;2601:			angles[1] = 360 - (angle * 180 / M_PI);
ADDRLP4 920+4
CNSTF4 1135869952
CNSTF4 1127481344
ADDRLP4 940
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
SUBF4
ASGNF4
line 2602
;2602:			if (angles[1] > 360)
ADDRLP4 920+4
INDIRF4
CNSTF4 1135869952
LEF4 $1596
line 2603
;2603:				angles[1] -= 360;
ADDRLP4 920+4
ADDRLP4 920+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $1596
line 2604
;2604:			angles[2] = 0;
ADDRLP4 920+8
CNSTF4 0
ASGNF4
line 2605
;2605:			AnglesToAxis( angles, skull.axis );
ADDRLP4 920
ARGP4
ADDRLP4 720+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2615
;2606:
;2607:			/*
;2608:			dir[2] = 0;
;2609:			VectorCopy(dir, skull.axis[1]);
;2610:			VectorNormalize(skull.axis[1]);
;2611:			VectorSet(skull.axis[2], 0, 0, 1);
;2612:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2613:			*/
;2614:
;2615:			skull.hModel = cgs.media.kamikazeHeadModel;
ADDRLP4 720+8
ADDRGP4 cgs+956380+1700
INDIRI4
ASGNI4
line 2616
;2616:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 720
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2617
;2617:			skull.hModel = cgs.media.kamikazeHeadTrail;
ADDRLP4 720+8
ADDRGP4 cgs+956380+1704
INDIRI4
ASGNI4
line 2618
;2618:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 720
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2620
;2619:
;2620:			angle = ((cg.time / 3) & 255) * (M_PI * 2) / 255 + 0.5 * M_PI;
ADDRLP4 940
CNSTF4 1086918619
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 3
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
CNSTF4 1070141403
ADDF4
ASGNF4
line 2621
;2621:			if (angle > M_PI * 2)
ADDRLP4 940
INDIRF4
CNSTF4 1086918619
LEF4 $1609
line 2622
;2622:				angle -= (float)M_PI * 2;
ADDRLP4 940
ADDRLP4 940
INDIRF4
CNSTF4 1086918619
SUBF4
ASGNF4
LABELV $1609
line 2623
;2623:			dir[0] = sin(angle) * 20;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 1008
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 908
CNSTF4 1101004800
ADDRLP4 1008
INDIRF4
MULF4
ASGNF4
line 2624
;2624:			dir[1] = cos(angle) * 20;
ADDRLP4 940
INDIRF4
ARGF4
ADDRLP4 1012
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 908+4
CNSTF4 1101004800
ADDRLP4 1012
INDIRF4
MULF4
ASGNF4
line 2625
;2625:			dir[2] = 0;
ADDRLP4 908+8
CNSTF4 0
ASGNF4
line 2626
;2626:			VectorAdd(torso.origin, dir, skull.origin);
ADDRLP4 720+68
ADDRLP4 176+68
INDIRF4
ADDRLP4 908
INDIRF4
ADDF4
ASGNF4
ADDRLP4 720+68+4
ADDRLP4 176+68+4
INDIRF4
ADDRLP4 908+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 720+68+8
ADDRLP4 176+68+8
INDIRF4
ADDRLP4 908+8
INDIRF4
ADDF4
ASGNF4
line 2628
;2627:
;2628:			VectorCopy(dir, skull.axis[1]);
ADDRLP4 720+28+12
ADDRLP4 908
INDIRB
ASGNB 12
line 2629
;2629:			VectorNormalize(skull.axis[1]);
ADDRLP4 720+28+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2630
;2630:			VectorSet(skull.axis[2], 0, 0, 1);
ADDRLP4 720+28+24
CNSTF4 0
ASGNF4
ADDRLP4 720+28+24+4
CNSTF4 0
ASGNF4
ADDRLP4 720+28+24+8
CNSTF4 1065353216
ASGNF4
line 2631
;2631:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
ADDRLP4 720+28+12
ARGP4
ADDRLP4 720+28+24
ARGP4
ADDRLP4 720+28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2633
;2632:
;2633:			skull.hModel = cgs.media.kamikazeHeadModel;
ADDRLP4 720+8
ADDRGP4 cgs+956380+1700
INDIRI4
ASGNI4
line 2634
;2634:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 720
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2635
;2635:			skull.hModel = cgs.media.kamikazeHeadTrail;
ADDRLP4 720+8
ADDRGP4 cgs+956380+1704
INDIRI4
ASGNI4
line 2636
;2636:			trap_R_AddRefEntityToScene( &skull );
ADDRLP4 720
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2637
;2637:		}
LABELV $1505
line 2638
;2638:	}
LABELV $1499
line 2639
;2639:	}
LABELV $1497
line 2643
;2640:
;2641:
;2642:
;2643:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1648
line 2645
;2644://	CG_PlayerSprites( cent );
;2645:	} else {
ADDRGP4 $1649
JUMPV
LABELV $1648
line 2646
;2646:	if ( cent->currentState.powerups & ( 1 << PW_GUARD ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1651
line 2647
;2647:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 532
ARGP4
ADDRLP4 176
ARGP4
CNSTI4 176
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2648
;2648:		powerup.hModel = cgs.media.guardPowerupModel;
ADDRLP4 532+8
ADDRGP4 cgs+956380+1708
INDIRI4
ASGNI4
line 2649
;2649:		powerup.frame = 0;
ADDRLP4 532+80
CNSTI4 0
ASGNI4
line 2650
;2650:		powerup.oldframe = 0;
ADDRLP4 532+96
CNSTI4 0
ASGNI4
line 2651
;2651:		powerup.customSkin = 0;
ADDRLP4 532+108
CNSTI4 0
ASGNI4
line 2652
;2652:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 532
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2653
;2653:	}
LABELV $1651
line 2654
;2654:	if ( cent->currentState.powerups & ( 1 << PW_SCOUT ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1659
line 2655
;2655:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 532
ARGP4
ADDRLP4 176
ARGP4
CNSTI4 176
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2656
;2656:		powerup.hModel = cgs.media.scoutPowerupModel;
ADDRLP4 532+8
ADDRGP4 cgs+956380+1712
INDIRI4
ASGNI4
line 2657
;2657:		powerup.frame = 0;
ADDRLP4 532+80
CNSTI4 0
ASGNI4
line 2658
;2658:		powerup.oldframe = 0;
ADDRLP4 532+96
CNSTI4 0
ASGNI4
line 2659
;2659:		powerup.customSkin = 0;
ADDRLP4 532+108
CNSTI4 0
ASGNI4
line 2660
;2660:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 532
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2661
;2661:	}
LABELV $1659
line 2662
;2662:	if ( cent->currentState.powerups & ( 1 << PW_DOUBLER ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1667
line 2663
;2663:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 532
ARGP4
ADDRLP4 176
ARGP4
CNSTI4 176
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2664
;2664:		powerup.hModel = cgs.media.doublerPowerupModel;
ADDRLP4 532+8
ADDRGP4 cgs+956380+1716
INDIRI4
ASGNI4
line 2665
;2665:		powerup.frame = 0;
ADDRLP4 532+80
CNSTI4 0
ASGNI4
line 2666
;2666:		powerup.oldframe = 0;
ADDRLP4 532+96
CNSTI4 0
ASGNI4
line 2667
;2667:		powerup.customSkin = 0;
ADDRLP4 532+108
CNSTI4 0
ASGNI4
line 2668
;2668:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 532
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2669
;2669:	}
LABELV $1667
line 2670
;2670:	if ( cent->currentState.powerups & ( 1 << PW_AMMOREGEN ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1675
line 2671
;2671:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 532
ARGP4
ADDRLP4 176
ARGP4
CNSTI4 176
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2672
;2672:		powerup.hModel = cgs.media.ammoRegenPowerupModel;
ADDRLP4 532+8
ADDRGP4 cgs+956380+1720
INDIRI4
ASGNI4
line 2673
;2673:		powerup.frame = 0;
ADDRLP4 532+80
CNSTI4 0
ASGNI4
line 2674
;2674:		powerup.oldframe = 0;
ADDRLP4 532+96
CNSTI4 0
ASGNI4
line 2675
;2675:		powerup.customSkin = 0;
ADDRLP4 532+108
CNSTI4 0
ASGNI4
line 2676
;2676:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 532
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2677
;2677:	}
LABELV $1675
line 2678
;2678:	}
LABELV $1649
line 2682
;2679:
;2680:
;2681:
;2682:	if ( cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1683
line 2683
;2683:		if ( !ci->invulnerabilityStartTime ) {
ADDRLP4 352
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1685
line 2684
;2684:			ci->invulnerabilityStartTime = cg.time;
ADDRLP4 352
INDIRP4
CNSTI4 216
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 2685
;2685:		}
LABELV $1685
line 2686
;2686:		ci->invulnerabilityStopTime = cg.time;
ADDRLP4 352
INDIRP4
CNSTI4 220
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 2687
;2687:	}
ADDRGP4 $1684
JUMPV
LABELV $1683
line 2688
;2688:	else {
line 2689
;2689:		ci->invulnerabilityStartTime = 0;
ADDRLP4 352
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 0
ASGNI4
line 2690
;2690:	}
LABELV $1684
line 2691
;2691:	if ( (cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) ||
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $1692
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 352
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
SUBI4
CNSTI4 250
GEI4 $1689
LABELV $1692
line 2692
;2692:		cg.time - ci->invulnerabilityStopTime < 250 ) {
line 2694
;2693:
;2694:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 532
ARGP4
ADDRLP4 176
ARGP4
CNSTI4 176
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2695
;2695:		powerup.hModel = cgs.media.invulnerabilityPowerupModel;
ADDRLP4 532+8
ADDRGP4 cgs+956380+1744
INDIRI4
ASGNI4
line 2696
;2696:		powerup.customSkin = 0;
ADDRLP4 532+108
CNSTI4 0
ASGNI4
line 2698
;2697:		// always draw
;2698:		powerup.renderfx &= ~RF_THIRD_PERSON;
ADDRLP4 532+4
ADDRLP4 532+4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2699
;2699:		VectorCopy(cent->lerpOrigin, powerup.origin);
ADDRLP4 532+68
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2701
;2700:
;2701:		if ( cg.time - ci->invulnerabilityStartTime < 250 ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 352
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
SUBI4
CNSTI4 250
GEI4 $1699
line 2702
;2702:			c = (float) (cg.time - ci->invulnerabilityStartTime) / 250;
ADDRLP4 936
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 352
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1132068864
DIVF4
ASGNF4
line 2703
;2703:		}
ADDRGP4 $1700
JUMPV
LABELV $1699
line 2704
;2704:		else if (cg.time - ci->invulnerabilityStopTime < 250 ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 352
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
SUBI4
CNSTI4 250
GEI4 $1703
line 2705
;2705:			c = (float) (250 - (cg.time - ci->invulnerabilityStopTime)) / 250;
ADDRLP4 936
CNSTI4 250
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 352
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
SUBI4
SUBI4
CVIF4 4
CNSTF4 1132068864
DIVF4
ASGNF4
line 2706
;2706:		}
ADDRGP4 $1704
JUMPV
LABELV $1703
line 2707
;2707:		else {
line 2708
;2708:			c = 1;
ADDRLP4 936
CNSTF4 1065353216
ASGNF4
line 2709
;2709:		}
LABELV $1704
LABELV $1700
line 2710
;2710:		VectorSet( powerup.axis[0], c, 0, 0 );
ADDRLP4 532+28
ADDRLP4 936
INDIRF4
ASGNF4
ADDRLP4 532+28+4
CNSTF4 0
ASGNF4
ADDRLP4 532+28+8
CNSTF4 0
ASGNF4
line 2711
;2711:		VectorSet( powerup.axis[1], 0, c, 0 );
ADDRLP4 532+28+12
CNSTF4 0
ASGNF4
ADDRLP4 532+28+12+4
ADDRLP4 936
INDIRF4
ASGNF4
ADDRLP4 532+28+12+8
CNSTF4 0
ASGNF4
line 2712
;2712:		VectorSet( powerup.axis[2], 0, 0, c );
ADDRLP4 532+28+24
CNSTF4 0
ASGNF4
ADDRLP4 532+28+24+4
CNSTF4 0
ASGNF4
ADDRLP4 532+28+24+8
ADDRLP4 936
INDIRF4
ASGNF4
line 2713
;2713:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 532
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2714
;2714:	}
LABELV $1689
line 2716
;2715:
;2716:	t = cg.time - ci->medkitUsageTime;
ADDRLP4 932
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 352
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
SUBI4
ASGNI4
line 2717
;2717:	if ( ci->medkitUsageTime && t < 500 ) {
ADDRLP4 352
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1729
ADDRLP4 932
INDIRI4
CNSTI4 500
GEI4 $1729
line 2718
;2718:		memcpy(&powerup, &torso, sizeof(torso));
ADDRLP4 532
ARGP4
ADDRLP4 176
ARGP4
CNSTI4 176
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2719
;2719:		powerup.hModel = cgs.media.medkitUsageModel;
ADDRLP4 532+8
ADDRGP4 cgs+956380+1732
INDIRI4
ASGNI4
line 2720
;2720:		powerup.customSkin = 0;
ADDRLP4 532+108
CNSTI4 0
ASGNI4
line 2722
;2721:		// always draw
;2722:		powerup.renderfx &= ~RF_THIRD_PERSON;
ADDRLP4 532+4
ADDRLP4 532+4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2723
;2723:		VectorClear(angles);
ADDRLP4 976
CNSTF4 0
ASGNF4
ADDRLP4 920+8
ADDRLP4 976
INDIRF4
ASGNF4
ADDRLP4 920+4
ADDRLP4 976
INDIRF4
ASGNF4
ADDRLP4 920
ADDRLP4 976
INDIRF4
ASGNF4
line 2724
;2724:		AnglesToAxis(angles, powerup.axis);
ADDRLP4 920
ARGP4
ADDRLP4 532+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2725
;2725:		VectorCopy(cent->lerpOrigin, powerup.origin);
ADDRLP4 532+68
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2726
;2726:		powerup.origin[2] += -24 + (float) t * 80 / 500;
ADDRLP4 532+68+8
ADDRLP4 532+68+8
INDIRF4
CNSTF4 1117782016
ADDRLP4 932
INDIRI4
CVIF4 4
MULF4
CNSTF4 1140457472
DIVF4
CNSTF4 3250585600
ADDF4
ADDF4
ASGNF4
line 2727
;2727:		if ( t > 400 ) {
ADDRLP4 932
INDIRI4
CNSTI4 400
LEI4 $1742
line 2728
;2728:			c = (float) (t - 1000) * 0xff / 100;
ADDRLP4 936
CNSTF4 1132396544
ADDRLP4 932
INDIRI4
CNSTI4 1000
SUBI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 2729
;2729:			powerup.shaderRGBA[0] = 0xff - c;
ADDRLP4 984
CNSTF4 1132396544
ADDRLP4 936
INDIRF4
SUBF4
ASGNF4
ADDRLP4 988
CNSTF4 1325400064
ASGNF4
ADDRLP4 984
INDIRF4
ADDRLP4 988
INDIRF4
LTF4 $1746
ADDRLP4 980
ADDRLP4 984
INDIRF4
ADDRLP4 988
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1747
JUMPV
LABELV $1746
ADDRLP4 980
ADDRLP4 984
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1747
ADDRLP4 532+116
ADDRLP4 980
INDIRU4
CVUU1 4
ASGNU1
line 2730
;2730:			powerup.shaderRGBA[1] = 0xff - c;
ADDRLP4 996
CNSTF4 1132396544
ADDRLP4 936
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1000
CNSTF4 1325400064
ASGNF4
ADDRLP4 996
INDIRF4
ADDRLP4 1000
INDIRF4
LTF4 $1751
ADDRLP4 992
ADDRLP4 996
INDIRF4
ADDRLP4 1000
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1752
JUMPV
LABELV $1751
ADDRLP4 992
ADDRLP4 996
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1752
ADDRLP4 532+116+1
ADDRLP4 992
INDIRU4
CVUU1 4
ASGNU1
line 2731
;2731:			powerup.shaderRGBA[2] = 0xff - c;
ADDRLP4 1008
CNSTF4 1132396544
ADDRLP4 936
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1012
CNSTF4 1325400064
ASGNF4
ADDRLP4 1008
INDIRF4
ADDRLP4 1012
INDIRF4
LTF4 $1756
ADDRLP4 1004
ADDRLP4 1008
INDIRF4
ADDRLP4 1012
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1757
JUMPV
LABELV $1756
ADDRLP4 1004
ADDRLP4 1008
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1757
ADDRLP4 532+116+2
ADDRLP4 1004
INDIRU4
CVUU1 4
ASGNU1
line 2732
;2732:			powerup.shaderRGBA[3] = 0xff - c;
ADDRLP4 1020
CNSTF4 1132396544
ADDRLP4 936
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1024
CNSTF4 1325400064
ASGNF4
ADDRLP4 1020
INDIRF4
ADDRLP4 1024
INDIRF4
LTF4 $1761
ADDRLP4 1016
ADDRLP4 1020
INDIRF4
ADDRLP4 1024
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1762
JUMPV
LABELV $1761
ADDRLP4 1016
ADDRLP4 1020
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1762
ADDRLP4 532+116+3
ADDRLP4 1016
INDIRU4
CVUU1 4
ASGNU1
line 2733
;2733:		}
ADDRGP4 $1743
JUMPV
LABELV $1742
line 2734
;2734:		else {
line 2735
;2735:			powerup.shaderRGBA[0] = 0xff;
ADDRLP4 532+116
CNSTU1 255
ASGNU1
line 2736
;2736:			powerup.shaderRGBA[1] = 0xff;
ADDRLP4 532+116+1
CNSTU1 255
ASGNU1
line 2737
;2737:			powerup.shaderRGBA[2] = 0xff;
ADDRLP4 532+116+2
CNSTU1 255
ASGNU1
line 2738
;2738:			powerup.shaderRGBA[3] = 0xff;
ADDRLP4 532+116+3
CNSTU1 255
ASGNU1
line 2739
;2739:		}
LABELV $1743
line 2740
;2740:		trap_R_AddRefEntityToScene( &powerup );
ADDRLP4 532
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2741
;2741:	}
LABELV $1729
line 2746
;2742:
;2743:	//
;2744:	// add the head
;2745:	//
;2746:	head.hModel = ci->headModel;
ADDRLP4 356+8
ADDRLP4 352
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ASGNI4
line 2747
;2747:	if (!head.hModel) {
ADDRLP4 356+8
INDIRI4
CNSTI4 0
NEI4 $1771
line 2748
;2748:		return;
ADDRGP4 $1259
JUMPV
LABELV $1771
line 2750
;2749:	}
;2750:	head.customSkin = ci->headSkin;
ADDRLP4 356+108
ADDRLP4 352
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ASGNI4
line 2751
;2751:	if(!head.customSkin){
ADDRLP4 356+108
INDIRI4
CNSTI4 0
NEI4 $1775
line 2752
;2752:	head.customShader = ci->headShader;	
ADDRLP4 356+112
ADDRLP4 352
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
ASGNI4
line 2753
;2753:	}
LABELV $1775
line 2754
;2754:	head.shaderRGBA[0] = ci->helred;
ADDRLP4 356+116
ADDRLP4 352
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2755
;2755:	head.shaderRGBA[1] = ci->helgreen;
ADDRLP4 356+116+1
ADDRLP4 352
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2756
;2756:	head.shaderRGBA[2] = ci->helblue;
ADDRLP4 356+116+2
ADDRLP4 352
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2757
;2757:	head.shaderRGBA[3] = 255;
ADDRLP4 356+116+3
CNSTU1 255
ASGNU1
line 2759
;2758:
;2759:	VectorCopy( cent->lerpOrigin, head.lightingOrigin );
ADDRLP4 356+12
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2761
;2760:
;2761:	CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head");
ADDRLP4 356
ARGP4
ADDRLP4 176
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1787
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2766
;2762:
;2763:	//
;2764:	// add the eyes
;2765:	//
;2766:	if (camereyes){
ADDRLP4 944
INDIRI4
CNSTI4 0
EQI4 $1788
line 2767
;2767:	cent->eyesOrigin[0] = head.origin[0];
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 356+68
INDIRF4
ASGNF4
line 2768
;2768:	cent->eyesOrigin[1] = head.origin[1];
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
ADDRLP4 356+68+4
INDIRF4
ASGNF4
line 2769
;2769:	cent->eyesOrigin[2] = head.origin[2];
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 356+68+8
INDIRF4
ASGNF4
line 2770
;2770:	if (cg.renderingEyesPerson == 2){
ADDRGP4 cg+1868920
INDIRI4
CNSTI4 2
NEI4 $1795
line 2771
;2771:	vectoangles( head.axis[0], headang);
ADDRLP4 356+28
ARGP4
ADDRGP4 headang
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2772
;2772:	}
ADDRGP4 $1796
JUMPV
LABELV $1795
line 2774
;2773:	else
;2774:	{
line 2776
;2775:
;2776:	VectorCopy(cent->lerpAngles, headang);
ADDRGP4 headang
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRB
ASGNB 12
line 2777
;2777:	}
LABELV $1796
line 2782
;2778:
;2779:
;2780:
;2781:
;2782:	if (cg.renderingEyesPerson){
ADDRGP4 cg+1868920
INDIRI4
CNSTI4 0
EQI4 $1799
line 2783
;2783:	VectorCopy(head.origin, cent->eyesOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 356+68
INDIRB
ASGNB 12
line 2785
;2784:
;2785:	VectorSubtract(cent->eyesOrigin, cent->lerpOrigin, cent->eyesOrigin);
ADDRLP4 976
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 980
ADDRLP4 976
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 980
INDIRP4
ADDRLP4 980
INDIRP4
INDIRF4
ADDRLP4 976
INDIRP4
CNSTI4 816
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 988
ADDRLP4 984
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 988
INDIRP4
ADDRLP4 988
INDIRP4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 996
ADDRLP4 992
INDIRP4
CNSTI4 852
ADDP4
ASGNP4
ADDRLP4 996
INDIRP4
ADDRLP4 996
INDIRP4
INDIRF4
ADDRLP4 992
INDIRP4
CNSTI4 824
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2786
;2786:	VectorCopy(cent->eyesOrigin, headpos);
ADDRGP4 headpos
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRB
ASGNB 12
line 2787
;2787:	}
LABELV $1799
line 2788
;2788:	}
LABELV $1788
line 2790
;2789:
;2790:	VectorCopy(cent->pe.eyepos, head.eyepos[0]);				// Copy it to our refdef for the renderer
ADDRLP4 356+140
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRB
ASGNB 12
line 2793
;2791:
;2792:	// HMM
;2793:	{
line 2801
;2794:	vec3_t v, forwaad;
;2795:	vec3_t	angles;
;2796:	vec3_t	dir;
;2797:	float len;
;2798:	vec3_t orrg;
;2799:	vec3_t av[3];
;2800:	trace_t trace;
;2801:	VectorCopy(cent->lerpAngles, v);
ADDRLP4 976
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRB
ASGNB 12
line 2802
;2802:	AngleVectors( v, forwaad, NULL, NULL );
ADDRLP4 976
ARGP4
ADDRLP4 988
ARGP4
ADDRLP4 1132
CNSTP4 0
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2803
;2803:	VectorMA(cent->lerpOrigin, 1024, forwaad, v );
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
CNSTF4 1149239296
ASGNF4
ADDRLP4 976
ADDRLP4 1136
INDIRP4
CNSTI4 816
ADDP4
INDIRF4
ADDRLP4 1140
INDIRF4
ADDRLP4 988
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 976+4
ADDRLP4 1136
INDIRP4
CNSTI4 820
ADDP4
INDIRF4
ADDRLP4 1140
INDIRF4
ADDRLP4 988+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 976+8
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRF4
CNSTF4 1149239296
ADDRLP4 988+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2804
;2804:	VectorCopy(head.origin, orrg);
ADDRLP4 1056
ADDRLP4 356+68
INDIRB
ASGNB 12
line 2805
;2805:	CG_Trace (&trace, orrg, NULL, NULL, v, -1, CONTENTS_SOLID);
ADDRLP4 1000
ARGP4
ADDRLP4 1056
ARGP4
ADDRLP4 1144
CNSTP4 0
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 976
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2806
;2806:			if (trace.fraction < 1)
ADDRLP4 1000+8
INDIRF4
CNSTF4 1065353216
GEF4 $1809
line 2807
;2807:				VectorCopy(trace.endpos, v);				// look closer
ADDRLP4 976
ADDRLP4 1000+12
INDIRB
ASGNB 12
LABELV $1809
line 2808
;2808:	VectorCopy(v, head.eyelook);				// Copy it to our refdef for the renderer
ADDRLP4 356+164
ADDRLP4 976
INDIRB
ASGNB 12
line 2809
;2809:	}
line 2811
;2810:
;2811:	head.shadowPlane = shadowPlane;
ADDRLP4 356+24
ADDRLP4 900
INDIRF4
ASGNF4
line 2812
;2812:	head.renderfx = renderfx;
ADDRLP4 356+4
ADDRLP4 896
INDIRI4
ASGNI4
line 2814
;2813:
;2814:	if (chibifactorhead) {
ADDRLP4 716
INDIRF4
CNSTF4 0
EQF4 $1816
line 2815
;2815:		VectorScale(head.axis[0], chibifactorhead, head.axis[0]);
ADDRLP4 356+28
ADDRLP4 356+28
INDIRF4
ADDRLP4 716
INDIRF4
MULF4
ASGNF4
ADDRLP4 356+28+4
ADDRLP4 356+28+4
INDIRF4
ADDRLP4 716
INDIRF4
MULF4
ASGNF4
ADDRLP4 356+28+8
ADDRLP4 356+28+8
INDIRF4
ADDRLP4 716
INDIRF4
MULF4
ASGNF4
line 2816
;2816:		VectorScale(head.axis[1], chibifactorhead, head.axis[1]);
ADDRLP4 356+28+12
ADDRLP4 356+28+12
INDIRF4
ADDRLP4 716
INDIRF4
MULF4
ASGNF4
ADDRLP4 356+28+12+4
ADDRLP4 356+28+12+4
INDIRF4
ADDRLP4 716
INDIRF4
MULF4
ASGNF4
ADDRLP4 356+28+12+8
ADDRLP4 356+28+12+8
INDIRF4
ADDRLP4 716
INDIRF4
MULF4
ASGNF4
line 2817
;2817:		VectorScale(head.axis[2], chibifactorhead, head.axis[2]);
ADDRLP4 356+28+24
ADDRLP4 356+28+24
INDIRF4
ADDRLP4 716
INDIRF4
MULF4
ASGNF4
ADDRLP4 356+28+24+4
ADDRLP4 356+28+24+4
INDIRF4
ADDRLP4 716
INDIRF4
MULF4
ASGNF4
ADDRLP4 356+28+24+8
ADDRLP4 356+28+24+8
INDIRF4
ADDRLP4 716
INDIRF4
MULF4
ASGNF4
line 2818
;2818:	}
LABELV $1816
line 2820
;2819:
;2820:	CG_AddRefEntityWithPowerups( &head, &cent->currentState, ci->team, qfalse );
ADDRLP4 356
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2822
;2821:
;2822:	CG_BreathPuffs(cent, &head);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 356
ARGP4
ADDRGP4 CG_BreathPuffs
CALLV
pop
line 2824
;2823:
;2824:	CG_DustTrail(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_DustTrail
CALLV
pop
line 2829
;2825:
;2826:	//
;2827:	// add the gun / barrel / flash
;2828:	//
;2829:	if(cent->currentState.eFlags & EF_DEAD){
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1860
line 2830
;2830:	return;	
ADDRGP4 $1259
JUMPV
LABELV $1860
line 2832
;2831:	}
;2832:	CG_AddPlayerWeapon( &torso, NULL, cent, ci->team, ci );
ADDRLP4 176
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 352
INDIRP4
ARGP4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
line 2835
;2833:
;2834:	// add powerups floating behind the player
;2835:	CG_PlayerPowerups( cent, &torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ARGP4
ADDRGP4 CG_PlayerPowerups
CALLV
pop
line 2836
;2836:}
LABELV $1259
endproc CG_Player 1148 28
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 48 12
line 2848
;2837:
;2838:
;2839://=====================================================================
;2840:
;2841:/*
;2842:===============
;2843:CG_ResetPlayerEntity
;2844:
;2845:A player just came into view or teleported, so reset all animation info
;2846:===============
;2847:*/
;2848:void CG_ResetPlayerEntity( centity_t *cent ) {
line 2849
;2849:	cent->errorTime = -99999;		// guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -99999
ASGNI4
line 2850
;2850:	cent->extrapolated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 0
ASGNI4
line 2852
;2851:
;2852:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.legs, cent->currentState.legsAnim );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1944
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2853
;2853:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.torso, cent->currentState.torsoAnim );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1944
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 540
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2855
;2854:
;2855:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2856
;2856:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 828
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2858
;2857:
;2858:	VectorCopy( cent->lerpOrigin, cent->rawOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 2859
;2859:	VectorCopy( cent->lerpAngles, cent->rawAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 828
ADDP4
INDIRB
ASGNB 12
line 2861
;2860:
;2861:	memset( &cent->pe.legs, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2862
;2862:	cent->pe.legs.yawAngle = cent->rawAngles[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ASGNF4
line 2863
;2863:	cent->pe.legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 0
ASGNI4
line 2864
;2864:	cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTF4 0
ASGNF4
line 2865
;2865:	cent->pe.legs.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 0
ASGNI4
line 2867
;2866:
;2867:	memset( &cent->pe.torso, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2868
;2868:	cent->pe.torso.yawAngle = cent->rawAngles[YAW];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ASGNF4
line 2869
;2869:	cent->pe.torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 0
ASGNI4
line 2870
;2870:	cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 792
ADDP4
INDIRF4
ASGNF4
line 2871
;2871:	cent->pe.torso.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 0
ASGNI4
line 2873
;2872:
;2873:	memset( &cent->pe.head, 0, sizeof( cent->pe.head ) );
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2874
;2874:	cent->pe.head.yawAngle = cent->rawAngles[YAW];
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ASGNF4
line 2875
;2875:	cent->pe.head.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 0
ASGNI4
line 2876
;2876:	cent->pe.head.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 792
ADDP4
INDIRF4
ASGNF4
line 2877
;2877:	cent->pe.head.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 0
ASGNI4
line 2881
;2878:
;2879:
;2880:
;2881:	if ( cg_debugPosition.integer ) {
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $1867
line 2882
;2882:		CG_Printf("%i ResetPlayerEntity yaw=%i\n", cent->currentState.number, cent->pe.torso.yawAngle );
ADDRGP4 $1870
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 2883
;2883:	}
LABELV $1867
line 2884
;2884:}
LABELV $1862
endproc CG_ResetPlayerEntity 48 12
bss
export eyeat
align 4
LABELV eyeat
skip 12
export enableQ
align 4
LABELV enableQ
skip 4
export headang
align 4
LABELV headang
skip 12
export headpos
align 4
LABELV headpos
skip 12
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
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
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
LABELV $1870
byte 1 37
byte 1 105
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 61
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1787
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1443
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $1278
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $674
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $589
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 108
byte 1 102
byte 1 45
byte 1 62
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $555
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $551
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $523
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 32
byte 1 85
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $500
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $490
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $480
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $478
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $476
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $474
byte 1 116
byte 1 0
align 1
LABELV $472
byte 1 108
byte 1 0
align 1
LABELV $470
byte 1 119
byte 1 0
align 1
LABELV $468
byte 1 104
byte 1 99
byte 1 0
align 1
LABELV $466
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $464
byte 1 118
byte 1 110
byte 1 0
align 1
LABELV $462
byte 1 115
byte 1 105
byte 1 0
align 1
LABELV $460
byte 1 112
byte 1 103
byte 1 95
byte 1 98
byte 1 0
align 1
LABELV $458
byte 1 112
byte 1 103
byte 1 95
byte 1 103
byte 1 0
align 1
LABELV $456
byte 1 112
byte 1 103
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $454
byte 1 112
byte 1 98
byte 1 0
align 1
LABELV $452
byte 1 112
byte 1 103
byte 1 0
align 1
LABELV $450
byte 1 112
byte 1 114
byte 1 0
align 1
LABELV $448
byte 1 116
byte 1 98
byte 1 0
align 1
LABELV $446
byte 1 116
byte 1 103
byte 1 0
align 1
LABELV $444
byte 1 116
byte 1 114
byte 1 0
align 1
LABELV $442
byte 1 104
byte 1 98
byte 1 0
align 1
LABELV $440
byte 1 104
byte 1 103
byte 1 0
align 1
LABELV $438
byte 1 104
byte 1 114
byte 1 0
align 1
LABELV $436
byte 1 99
byte 1 50
byte 1 0
align 1
LABELV $434
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $431
byte 1 110
byte 1 0
align 1
LABELV $426
byte 1 67
byte 1 71
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $342
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $328
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $321
byte 1 42
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $320
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $317
byte 1 86
byte 1 105
byte 1 109
byte 1 32
byte 1 115
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $316
byte 1 69
byte 1 109
byte 1 97
byte 1 99
byte 1 115
byte 1 32
byte 1 115
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $285
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 98
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $280
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 106
byte 1 112
byte 1 103
byte 1 0
align 1
LABELV $275
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 112
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $270
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $265
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $264
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $261
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $258
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $257
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $252
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $249
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $248
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $245
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $239
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $236
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $235
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $232
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $231
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $228
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $205
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $180
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $177
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $174
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $163
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $154
byte 1 101
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $145
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $142
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $141
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 0
align 1
LABELV $138
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $135
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $132
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $128
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $127
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $122
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $114
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $108
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $93
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $92
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $91
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $90
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $89
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $88
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $87
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $86
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $85
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $84
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $83
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $82
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $81
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
