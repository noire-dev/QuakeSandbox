bss
align 1
LABELV $82
skip 64
export CG_PlaceString
code
proc CG_PlaceString 12 20
file "../../../code/cgame/cg_event.c"
line 40
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
;23:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;24:
;25:#include "cg_local.h"
;26:
;27:// for the voice chats
;28:#ifdef MISSIONPACK // bk001205
;29:#include "../../ui/menudef.h"
;30:#endif
;31://==========================================================================
;32:
;33:/*
;34:===================
;35:CG_PlaceString
;36:
;37:Also called by scoreboard drawing
;38:===================
;39:*/
;40:const char	*CG_PlaceString( int rank ) {
line 44
;41:	static char	str[64];
;42:	char	*s, *t;
;43:
;44:	if ( rank & RANK_TIED_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $83
line 45
;45:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 46
;46:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $85
line 47
;47:		t = "Tied for ";
ADDRLP4 4
ADDRGP4 $88
ASGNP4
line 48
;48:		}
LABELV $85
line 49
;49:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $84
line 50
;50:		t = "Делит ";
ADDRLP4 4
ADDRGP4 $92
ASGNP4
line 51
;51:		}
line 52
;52:	} else {
ADDRGP4 $84
JUMPV
LABELV $83
line 53
;53:		t = "";
ADDRLP4 4
ADDRGP4 $93
ASGNP4
line 54
;54:	}
LABELV $84
line 56
;55:
;56:	if ( rank == 1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $94
line 57
;57:		s = S_COLOR_GREEN "1st" S_COLOR_WHITE;		// draw in GREEN
ADDRLP4 0
ADDRGP4 $96
ASGNP4
line 58
;58:	} else if ( rank == 2 ) {
ADDRGP4 $95
JUMPV
LABELV $94
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $97
line 59
;59:		s = S_COLOR_RED "2nd" S_COLOR_WHITE;		// draw in red
ADDRLP4 0
ADDRGP4 $99
ASGNP4
line 60
;60:	} else if ( rank == 3 ) {
ADDRGP4 $98
JUMPV
LABELV $97
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $100
line 61
;61:		s = S_COLOR_YELLOW "3rd" S_COLOR_WHITE;		// draw in yellow
ADDRLP4 0
ADDRGP4 $102
ASGNP4
line 62
;62:	} else if ( rank == 11 ) {
ADDRGP4 $101
JUMPV
LABELV $100
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $103
line 63
;63:		s = "11th";
ADDRLP4 0
ADDRGP4 $105
ASGNP4
line 64
;64:	} else if ( rank == 12 ) {
ADDRGP4 $104
JUMPV
LABELV $103
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $106
line 65
;65:		s = "12th";
ADDRLP4 0
ADDRGP4 $108
ASGNP4
line 66
;66:	} else if ( rank == 13 ) {
ADDRGP4 $107
JUMPV
LABELV $106
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $109
line 67
;67:		s = "13th";
ADDRLP4 0
ADDRGP4 $111
ASGNP4
line 68
;68:	} else if ( rank % 10 == 1 ) {
ADDRGP4 $110
JUMPV
LABELV $109
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $112
line 69
;69:		s = va("%ist", rank);
ADDRGP4 $114
ARGP4
ADDRFP4 0
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
line 70
;70:	} else if ( rank % 10 == 2 ) {
ADDRGP4 $113
JUMPV
LABELV $112
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $115
line 71
;71:		s = va("%ind", rank);
ADDRGP4 $117
ARGP4
ADDRFP4 0
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
line 72
;72:	} else if ( rank % 10 == 3 ) {
ADDRGP4 $116
JUMPV
LABELV $115
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $118
line 73
;73:		s = va("%ird", rank);
ADDRGP4 $120
ARGP4
ADDRFP4 0
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
line 74
;74:	} else {
ADDRGP4 $119
JUMPV
LABELV $118
line 75
;75:		s = va("%ith", rank);
ADDRGP4 $121
ARGP4
ADDRFP4 0
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
line 76
;76:	}
LABELV $119
LABELV $116
LABELV $113
LABELV $110
LABELV $107
LABELV $104
LABELV $101
LABELV $98
LABELV $95
line 78
;77:
;78:	Com_sprintf( str, sizeof( str ), "%s%s", t, s );
ADDRGP4 $82
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $122
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 79
;79:	return str;
ADDRGP4 $82
RETP4
LABELV $81
endproc CG_PlaceString 12 20
proc CG_Obituary 132 44
line 87
;80:}
;81:
;82:/*
;83:=============
;84:CG_Obituary
;85:=============
;86:*/
;87:static void CG_Obituary( entityState_t *ent ) {
line 99
;88:	int			mod;
;89:	int			target, attacker;
;90:	char		*message;
;91:	char		*message2;
;92:	const char	*targetInfo;
;93:	const char	*attackerInfo;
;94:	char		targetName[32];
;95:	char		attackerName[32];
;96:	gender_t	gender;
;97:	clientInfo_t	*ci;
;98:
;99:	target = ent->otherEntityNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 100
;100:	attacker = ent->otherEntityNum2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ASGNI4
line 101
;101:	mod = ent->eventParm;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 103
;102:
;103:	if ( target < 0 || target >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $126
ADDRLP4 4
INDIRI4
CNSTI4 256
LTI4 $124
LABELV $126
line 104
;104:		CG_Error( "CG_Obituary: target out of range" );
ADDRGP4 $127
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 105
;105:	}
LABELV $124
line 106
;106:	ci = &cgs.clientinfo[target];
ADDRLP4 48
CNSTI4 1944
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 108
;107:
;108:	if ( attacker < 0 || attacker >= MAX_CLIENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $131
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $129
LABELV $131
line 109
;109:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 4094
ASGNI4
line 110
;110:		attackerInfo = NULL;
ADDRLP4 92
CNSTP4 0
ASGNP4
line 111
;111:	} else {
ADDRGP4 $130
JUMPV
LABELV $129
line 112
;112:		attackerInfo = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 108
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 92
ADDRLP4 108
INDIRP4
ASGNP4
line 113
;113:	}
LABELV $130
line 115
;114:
;115:	targetInfo = CG_ConfigString( CS_PLAYERS + target );
ADDRLP4 4
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 108
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 56
ADDRLP4 108
INDIRP4
ASGNP4
line 116
;116:	if ( !targetInfo ) {
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $132
line 117
;117:		return;
ADDRGP4 $123
JUMPV
LABELV $132
line 119
;118:	}
;119:	Q_strncpyz( targetName, Info_ValueForKey( targetInfo, "n" ), sizeof(targetName) - 2);
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 120
;120:	strcat( targetName, S_COLOR_WHITE );
ADDRLP4 8
ARGP4
ADDRGP4 $135
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 122
;121:
;122:	message2 = "";
ADDRLP4 96
ADDRGP4 $93
ASGNP4
line 125
;123:
;124:	// check for single client messages
;125:	gender = ci->gender;
ADDRLP4 44
ADDRLP4 48
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ASGNI4
line 126
;126:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $136
line 127
;127:        if(attacker != ENTITYNUM_WORLD)
ADDRLP4 0
INDIRI4
CNSTI4 4094
EQI4 $139
line 128
;128:            message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
ADDRGP4 $140
JUMPV
LABELV $139
line 130
;129:        else
;130:            switch( mod ) {
ADDRLP4 52
INDIRI4
CNSTI4 19
LTI4 $141
ADDRLP4 52
INDIRI4
CNSTI4 27
GTI4 $141
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $158-76
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $158
address $148
address $150
address $152
address $146
address $141
address $144
address $123
address $154
address $156
code
line 132
;131:            case MOD_SUICIDE:
;132:                    return;
line 133
;133:                    break;
LABELV $144
line 135
;134:            case MOD_FALLING:
;135:                    message = "cratered";
ADDRLP4 40
ADDRGP4 $145
ASGNP4
line 136
;136:                    break;
ADDRGP4 $142
JUMPV
LABELV $146
line 138
;137:            case MOD_CRUSH:
;138:                    message = "was squished";
ADDRLP4 40
ADDRGP4 $147
ASGNP4
line 139
;139:                    break;
ADDRGP4 $142
JUMPV
LABELV $148
line 141
;140:            case MOD_WATER:
;141:                    message = "sank like a rock";
ADDRLP4 40
ADDRGP4 $149
ASGNP4
line 142
;142:                    break;
ADDRGP4 $142
JUMPV
LABELV $150
line 144
;143:            case MOD_SLIME:
;144:                    message = "melted";
ADDRLP4 40
ADDRGP4 $151
ASGNP4
line 145
;145:                    break;
ADDRGP4 $142
JUMPV
LABELV $152
line 147
;146:            case MOD_LAVA:
;147:                    message = "does a back flip into the lava";
ADDRLP4 40
ADDRGP4 $153
ASGNP4
line 148
;148:                    break;
ADDRGP4 $142
JUMPV
LABELV $154
line 150
;149:            case MOD_TARGET_LASER:
;150:                    message = "saw the light";
ADDRLP4 40
ADDRGP4 $155
ASGNP4
line 151
;151:                    break;
ADDRGP4 $142
JUMPV
LABELV $156
line 153
;152:            case MOD_TRIGGER_HURT:
;153:                    message = "was in the wrong place";
ADDRLP4 40
ADDRGP4 $157
ASGNP4
line 154
;154:                    break;
ADDRGP4 $142
JUMPV
LABELV $141
line 156
;155:            default:
;156:                    message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 157
;157:                    break;
LABELV $142
LABELV $140
line 159
;158:            }
;159:}
LABELV $136
line 160
;160:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $160
line 161
;161:        if(attacker != ENTITYNUM_WORLD)
ADDRLP4 0
INDIRI4
CNSTI4 4094
EQI4 $163
line 162
;162:            message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
ADDRGP4 $164
JUMPV
LABELV $163
line 164
;163:        else
;164:            switch( mod ) {
ADDRLP4 52
INDIRI4
CNSTI4 19
LTI4 $165
ADDRLP4 52
INDIRI4
CNSTI4 27
GTI4 $165
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $203-76
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $203
address $178
address $183
address $188
address $173
address $165
address $168
address $123
address $193
address $198
code
line 166
;165:            case MOD_SUICIDE:
;166:				return;
line 167
;167:                    break;
LABELV $168
line 169
;168:            case MOD_FALLING:
;169:					if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $169
line 170
;170:					message = "разбилась";
ADDRLP4 40
ADDRGP4 $171
ASGNP4
ADDRGP4 $166
JUMPV
LABELV $169
line 172
;171:					else
;172:					message = "разбился";
ADDRLP4 40
ADDRGP4 $172
ASGNP4
line 173
;173:                    break;
ADDRGP4 $166
JUMPV
LABELV $173
line 175
;174:            case MOD_CRUSH:
;175:                    if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $174
line 176
;176:					message = "была раздавлена";
ADDRLP4 40
ADDRGP4 $176
ASGNP4
ADDRGP4 $166
JUMPV
LABELV $174
line 178
;177:					else
;178:					message = "был раздавлен";
ADDRLP4 40
ADDRGP4 $177
ASGNP4
line 179
;179:                    break;
ADDRGP4 $166
JUMPV
LABELV $178
line 181
;180:            case MOD_WATER:
;181:			        if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $179
line 182
;182:					message = "затонула как камень";
ADDRLP4 40
ADDRGP4 $181
ASGNP4
ADDRGP4 $166
JUMPV
LABELV $179
line 184
;183:					else
;184:					message = "затонул как камень";
ADDRLP4 40
ADDRGP4 $182
ASGNP4
line 185
;185:                    break;
ADDRGP4 $166
JUMPV
LABELV $183
line 187
;186:            case MOD_SLIME:
;187:			        if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $184
line 188
;188:					message = "растворилась";
ADDRLP4 40
ADDRGP4 $186
ASGNP4
ADDRGP4 $166
JUMPV
LABELV $184
line 190
;189:					else
;190:                    message = "растворился";
ADDRLP4 40
ADDRGP4 $187
ASGNP4
line 191
;191:                    break;
ADDRGP4 $166
JUMPV
LABELV $188
line 193
;192:            case MOD_LAVA:
;193:					if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $189
line 194
;194:					message = "сделала сальто назад в лаву";
ADDRLP4 40
ADDRGP4 $191
ASGNP4
ADDRGP4 $166
JUMPV
LABELV $189
line 196
;195:					else
;196:                    message = "сделал сальто назад в лаву";
ADDRLP4 40
ADDRGP4 $192
ASGNP4
line 197
;197:                    break;
ADDRGP4 $166
JUMPV
LABELV $193
line 199
;198:            case MOD_TARGET_LASER:
;199:					if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $194
line 200
;200:					message = "увидела свет";
ADDRLP4 40
ADDRGP4 $196
ASGNP4
ADDRGP4 $166
JUMPV
LABELV $194
line 202
;201:					else
;202:                    message = "увидел свет";
ADDRLP4 40
ADDRGP4 $197
ASGNP4
line 203
;203:                    break;
ADDRGP4 $166
JUMPV
LABELV $198
line 205
;204:            case MOD_TRIGGER_HURT:
;205:					if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $199
line 206
;206:					message = "оказалась не в том месте";
ADDRLP4 40
ADDRGP4 $201
ASGNP4
ADDRGP4 $166
JUMPV
LABELV $199
line 208
;207:					else
;208:                    message = "оказался не в том месте";
ADDRLP4 40
ADDRGP4 $202
ASGNP4
line 209
;209:                    break;
ADDRGP4 $166
JUMPV
LABELV $165
line 211
;210:            default:
;211:                    message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 212
;212:                    break;
LABELV $166
LABELV $164
line 214
;213:            }
;214:}
LABELV $160
line 215
;215:	gender = ci->gender;
ADDRLP4 44
ADDRLP4 48
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ASGNI4
line 216
;216:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $205
line 217
;217:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $208
line 218
;218:		switch (mod) {
ADDRLP4 52
INDIRI4
CNSTI4 13
EQI4 $253
ADDRLP4 52
INDIRI4
CNSTI4 15
EQI4 $263
ADDRLP4 120
CNSTI4 17
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $271
ADDRLP4 52
INDIRI4
ADDRLP4 120
INDIRI4
GTI4 $284
LABELV $283
ADDRLP4 52
INDIRI4
CNSTI4 5
EQI4 $229
ADDRLP4 52
INDIRI4
CNSTI4 7
EQI4 $237
ADDRLP4 52
INDIRI4
CNSTI4 9
EQI4 $245
ADDRGP4 $210
JUMPV
LABELV $284
ADDRLP4 52
INDIRI4
CNSTI4 30
LTI4 $210
ADDRLP4 52
INDIRI4
CNSTI4 36
GTI4 $210
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $285-120
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $285
address $255
address $212
address $210
address $210
address $214
address $219
address $224
code
LABELV $212
line 220
;219:		case MOD_KAMIKAZE:
;220:			message = "goes out with a bang";
ADDRLP4 40
ADDRGP4 $213
ASGNP4
line 221
;221:			break;
ADDRGP4 $211
JUMPV
LABELV $214
line 223
;222:		case MOD_CAR:
;223:		if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $215
line 224
;224:			message = "exploded in her car";
ADDRLP4 40
ADDRGP4 $217
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $215
line 226
;225:		else
;226:			message = "exploded in his car";
ADDRLP4 40
ADDRGP4 $218
ASGNP4
line 227
;227:			break;
ADDRGP4 $211
JUMPV
LABELV $219
line 229
;228:		case MOD_CAREXPLODE:
;229:		if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $220
line 230
;230:			message = "exploded by her car";
ADDRLP4 40
ADDRGP4 $222
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $220
line 232
;231:		else
;232:			message = "exploded by his car";
ADDRLP4 40
ADDRGP4 $223
ASGNP4
line 233
;233:			break;
ADDRGP4 $211
JUMPV
LABELV $224
line 235
;234:		case MOD_PROP:
;235:		if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $225
line 236
;236:			message = "was crushed by an object she threw herself";
ADDRLP4 40
ADDRGP4 $227
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $225
line 238
;237:		else
;238:			message = "was crushed by an object he threw himself";
ADDRLP4 40
ADDRGP4 $228
ASGNP4
line 239
;239:			break;
ADDRGP4 $211
JUMPV
LABELV $229
line 241
;240:		case MOD_GRENADE_SPLASH:
;241:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $230
line 242
;242:				message = "tripped on her own grenade";
ADDRLP4 40
ADDRGP4 $232
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $230
line 243
;243:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $233
line 244
;244:				message = "tripped on its own grenade";
ADDRLP4 40
ADDRGP4 $235
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $233
line 246
;245:			else
;246:				message = "tripped on his own grenade";
ADDRLP4 40
ADDRGP4 $236
ASGNP4
line 247
;247:			break;
ADDRGP4 $211
JUMPV
LABELV $237
line 249
;248:		case MOD_ROCKET_SPLASH:
;249:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $238
line 250
;250:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $240
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $238
line 251
;251:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $241
line 252
;252:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $243
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $241
line 254
;253:			else
;254:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $244
ASGNP4
line 255
;255:			break;
ADDRGP4 $211
JUMPV
LABELV $245
line 257
;256:		case MOD_PLASMA_SPLASH:
;257:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $246
line 258
;258:				message = "melted herself";
ADDRLP4 40
ADDRGP4 $248
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $246
line 259
;259:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $249
line 260
;260:				message = "melted itself";
ADDRLP4 40
ADDRGP4 $251
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $249
line 262
;261:			else
;262:				message = "melted himself";
ADDRLP4 40
ADDRGP4 $252
ASGNP4
line 263
;263:			break;
ADDRGP4 $211
JUMPV
LABELV $253
line 265
;264:		case MOD_BFG_SPLASH:
;265:			message = "should have used a smaller gun";
ADDRLP4 40
ADDRGP4 $254
ASGNP4
line 266
;266:			break;
ADDRGP4 $211
JUMPV
LABELV $255
line 268
;267:		case MOD_PROXIMITY_MINE:
;268:			if( gender == GENDER_FEMALE ) {
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $256
line 269
;269:				message = "found her prox mine";
ADDRLP4 40
ADDRGP4 $258
ASGNP4
line 270
;270:			} else if ( gender == GENDER_NEUTER ) {
ADDRGP4 $211
JUMPV
LABELV $256
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $259
line 271
;271:				message = "found its prox mine";
ADDRLP4 40
ADDRGP4 $261
ASGNP4
line 272
;272:			} else {
ADDRGP4 $211
JUMPV
LABELV $259
line 273
;273:				message = "found his prox mine";
ADDRLP4 40
ADDRGP4 $262
ASGNP4
line 274
;274:			}
line 275
;275:			break;
ADDRGP4 $211
JUMPV
LABELV $263
line 277
;276:		case MOD_FLAME_SPLASH:
;277:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $264
line 278
;278:				message = "burned herself up";
ADDRLP4 40
ADDRGP4 $266
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $264
line 279
;279:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $267
line 280
;280:				message = "burned itself up";
ADDRLP4 40
ADDRGP4 $269
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $267
line 282
;281:			else
;282:				message = "burned himself up";
ADDRLP4 40
ADDRGP4 $270
ASGNP4
line 283
;283:			break;
ADDRGP4 $211
JUMPV
LABELV $271
line 285
;284:		case MOD_ANTIMATTER_SPLASH:
;285:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $272
line 286
;286:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $240
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $272
line 287
;287:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $274
line 288
;288:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $243
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $274
line 290
;289:			else
;290:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $244
ASGNP4
line 291
;291:			break;
ADDRGP4 $211
JUMPV
LABELV $210
line 293
;292:		default:
;293:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $276
line 294
;294:				message = "killed herself";
ADDRLP4 40
ADDRGP4 $278
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $276
line 295
;295:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $279
line 296
;296:				message = "killed itself";
ADDRLP4 40
ADDRGP4 $281
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $279
line 298
;297:			else
;298:				message = "killed himself";
ADDRLP4 40
ADDRGP4 $282
ASGNP4
line 299
;299:			break;
LABELV $211
line 301
;300:		}
;301:	}
LABELV $208
line 302
;302:}
LABELV $205
line 303
;303:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $287
line 304
;304:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $290
line 305
;305:		switch (mod) {
ADDRLP4 52
INDIRI4
CNSTI4 13
EQI4 $332
ADDRLP4 52
INDIRI4
CNSTI4 15
EQI4 $344
ADDRLP4 120
CNSTI4 17
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $351
ADDRLP4 52
INDIRI4
ADDRLP4 120
INDIRI4
GTI4 $365
LABELV $364
ADDRLP4 52
INDIRI4
CNSTI4 5
EQI4 $311
ADDRLP4 52
INDIRI4
CNSTI4 7
EQI4 $318
ADDRLP4 52
INDIRI4
CNSTI4 9
EQI4 $325
ADDRGP4 $292
JUMPV
LABELV $365
ADDRLP4 52
INDIRI4
CNSTI4 30
LTI4 $292
ADDRLP4 52
INDIRI4
CNSTI4 36
GTI4 $292
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $366-120
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $366
address $337
address $294
address $292
address $292
address $296
address $301
address $306
code
LABELV $294
line 307
;306:		case MOD_KAMIKAZE:
;307:			message = "выходит с треском";
ADDRLP4 40
ADDRGP4 $295
ASGNP4
line 308
;308:			break;
ADDRGP4 $293
JUMPV
LABELV $296
line 310
;309:		case MOD_CAR:
;310:		if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $297
line 311
;311:			message = "взорвалась в своей машине";
ADDRLP4 40
ADDRGP4 $299
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $297
line 313
;312:		else
;313:			message = "взорвался в своей машине";
ADDRLP4 40
ADDRGP4 $300
ASGNP4
line 314
;314:			break;
ADDRGP4 $293
JUMPV
LABELV $301
line 316
;315:		case MOD_CAREXPLODE:
;316:		if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $302
line 317
;317:			message = "взорвала себя своей машиной";
ADDRLP4 40
ADDRGP4 $304
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $302
line 319
;318:		else
;319:			message = "взорвал себя своей машиной";
ADDRLP4 40
ADDRGP4 $305
ASGNP4
line 320
;320:			break;
ADDRGP4 $293
JUMPV
LABELV $306
line 322
;321:		case MOD_PROP:
;322:		if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $307
line 323
;323:			message = "была раздавлена предметом, который она бросила сама";
ADDRLP4 40
ADDRGP4 $309
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $307
line 325
;324:		else
;325:			message = "был раздавлен предметом, который он бросил сам";
ADDRLP4 40
ADDRGP4 $310
ASGNP4
line 326
;326:			break;
ADDRGP4 $293
JUMPV
LABELV $311
line 328
;327:		case MOD_GRENADE_SPLASH:
;328:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $312
line 329
;329:				message = "споткнулась о собственную гранату";
ADDRLP4 40
ADDRGP4 $314
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $312
line 330
;330:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $315
line 331
;331:				message = "споткнулся о собственную гранату";
ADDRLP4 40
ADDRGP4 $317
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $315
line 333
;332:			else
;333:				message = "споткнулся о собственную гранату";
ADDRLP4 40
ADDRGP4 $317
ASGNP4
line 334
;334:			break;
ADDRGP4 $293
JUMPV
LABELV $318
line 336
;335:		case MOD_ROCKET_SPLASH:
;336:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $319
line 337
;337:				message = "взорвала себя";
ADDRLP4 40
ADDRGP4 $321
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $319
line 338
;338:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $322
line 339
;339:				message = "взорвал себя";
ADDRLP4 40
ADDRGP4 $324
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $322
line 341
;340:			else
;341:				message = "взорвал себя";
ADDRLP4 40
ADDRGP4 $324
ASGNP4
line 342
;342:			break;
ADDRGP4 $293
JUMPV
LABELV $325
line 344
;343:		case MOD_PLASMA_SPLASH:
;344:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $326
line 345
;345:				message = "растаяла";
ADDRLP4 40
ADDRGP4 $328
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $326
line 346
;346:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $329
line 347
;347:				message = "растаял";
ADDRLP4 40
ADDRGP4 $331
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $329
line 349
;348:			else
;349:				message = "растаял";
ADDRLP4 40
ADDRGP4 $331
ASGNP4
line 350
;350:			break;
ADDRGP4 $293
JUMPV
LABELV $332
line 352
;351:		case MOD_BFG_SPLASH:
;352:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $333
line 353
;353:			message = "не справилась с мощной пушкой";
ADDRLP4 40
ADDRGP4 $335
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $333
line 355
;354:			else
;355:			message = "не справился с мощной пушкой";
ADDRLP4 40
ADDRGP4 $336
ASGNP4
line 356
;356:			break;
ADDRGP4 $293
JUMPV
LABELV $337
line 358
;357:		case MOD_PROXIMITY_MINE:
;358:			if( gender == GENDER_FEMALE ) {
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $338
line 359
;359:				message = "нашла свою бомбу";
ADDRLP4 40
ADDRGP4 $340
ASGNP4
line 360
;360:			} else if ( gender == GENDER_NEUTER ) {
ADDRGP4 $293
JUMPV
LABELV $338
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $341
line 361
;361:				message = "нашел свою бомбу";
ADDRLP4 40
ADDRGP4 $343
ASGNP4
line 362
;362:			} else {
ADDRGP4 $293
JUMPV
LABELV $341
line 363
;363:				message = "нашел свою бомбу";
ADDRLP4 40
ADDRGP4 $343
ASGNP4
line 364
;364:			}
line 365
;365:			break;
ADDRGP4 $293
JUMPV
LABELV $344
line 367
;366:		case MOD_FLAME_SPLASH:
;367:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $345
line 368
;368:				message = "сожгла себя";
ADDRLP4 40
ADDRGP4 $347
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $345
line 369
;369:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $348
line 370
;370:				message = "сжег себя";
ADDRLP4 40
ADDRGP4 $350
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $348
line 372
;371:			else
;372:				message = "сжег себя";
ADDRLP4 40
ADDRGP4 $350
ASGNP4
line 373
;373:			break;
ADDRGP4 $293
JUMPV
LABELV $351
line 375
;374:		case MOD_ANTIMATTER_SPLASH:
;375:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $352
line 376
;376:				message = "разорвала себя";
ADDRLP4 40
ADDRGP4 $354
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $352
line 377
;377:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $355
line 378
;378:				message = "разорвал себя";
ADDRLP4 40
ADDRGP4 $357
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $355
line 380
;379:			else
;380:				message = "разорвал себя";
ADDRLP4 40
ADDRGP4 $357
ASGNP4
line 381
;381:			break;
ADDRGP4 $293
JUMPV
LABELV $292
line 383
;382:		default:
;383:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $358
line 384
;384:				message = "убила себя";
ADDRLP4 40
ADDRGP4 $360
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $358
line 385
;385:			else if ( gender == GENDER_NEUTER )
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $361
line 386
;386:				message = "убил себя";
ADDRLP4 40
ADDRGP4 $363
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $361
line 388
;387:			else
;388:				message = "убил себя";
ADDRLP4 40
ADDRGP4 $363
ASGNP4
line 389
;389:			break;
LABELV $293
line 391
;390:		}
;391:	}
LABELV $290
line 392
;392:}
LABELV $287
line 395
;393:
;394:    //If a suicide happens while disconnecting then we might not have a targetName
;395:	if(mod == MOD_SUICIDE){
ADDRLP4 52
INDIRI4
CNSTI4 25
NEI4 $368
line 396
;396:		return;
ADDRGP4 $123
JUMPV
LABELV $368
line 398
;397:	}
;398:	if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $370
line 399
;399:		CG_Printf( "%s> %s%s%s %s.%s\n", 
ADDRGP4 $372
ARGP4
ADDRLP4 116
ADDRGP4 $373
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 $135
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 407
;400:				S_COLOR_YELLOW,
;401:				S_COLOR_WHITE,
;402:				targetName,
;403:				S_COLOR_YELLOW,
;404:			       	message,
;405:				S_COLOR_WHITE
;406:				);
;407:		return;
ADDRGP4 $123
JUMPV
LABELV $370
line 412
;408:	}
;409:        
;410:
;411:	// check for kill messages from the current clientNum
;412:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $374
line 415
;413:		char	*s;
;414:
;415:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $377
line 416
;416:		if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
GEI4 $380
line 417
;417:			s = va("You killed %s\n%s place with %i", targetName, 
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 120
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $383
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 116
ADDRLP4 124
INDIRP4
ASGNP4
line 420
;418:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;419:				cg.snap->ps.persistant[PERS_SCORE] );
;420:		} else {
ADDRGP4 $381
JUMPV
LABELV $380
line 421
;421:                    if(ent->generic1)
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $386
line 422
;422:                        s = va("You killed your ^2TEAMMATE^7 %s", targetName );
ADDRGP4 $388
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 116
ADDRLP4 120
INDIRP4
ASGNP4
ADDRGP4 $387
JUMPV
LABELV $386
line 424
;423:                    else
;424:			s = va("You killed %s", targetName );
ADDRGP4 $389
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 116
ADDRLP4 124
INDIRP4
ASGNP4
LABELV $387
line 425
;425:		}
LABELV $381
line 426
;426:}
LABELV $377
line 427
;427:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $390
line 428
;428:		if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
GEI4 $393
line 429
;429:			s = va("Вы убили %s\n %s место с %i фрагами", targetName, 
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 120
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $396
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 116
ADDRLP4 124
INDIRP4
ASGNP4
line 432
;430:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;431:				cg.snap->ps.persistant[PERS_SCORE] );
;432:		} else {
ADDRGP4 $394
JUMPV
LABELV $393
line 433
;433:                    if(ent->generic1)
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $399
line 434
;434:                        s = va("Вы убили своего ^2СОЮЗНИКА^7 %s", targetName );
ADDRGP4 $401
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 116
ADDRLP4 120
INDIRP4
ASGNP4
ADDRGP4 $400
JUMPV
LABELV $399
line 436
;435:                    else
;436:			s = va("Вы убили %s", targetName );
ADDRGP4 $402
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 116
ADDRLP4 124
INDIRP4
ASGNP4
LABELV $400
line 437
;437:		}
LABELV $394
line 438
;438:}
LABELV $390
line 446
;439:#ifndef MISSIONPACK
;440:	if(cgs.gametype != GT_SINGLE && cgs.gametype != GT_SANDBOX){
;441:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
;442:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, (int)(BIGCHAR_WIDTH * 0.6) );
;443:		} 
;444:	}
;445:#else
;446:	if(cgs.gametype != GT_SINGLE && cgs.gametype != GT_SANDBOX){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $403
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 0
EQI4 $403
line 447
;447:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, (int)(BIGCHAR_WIDTH * 0.6) );
ADDRLP4 116
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTF4 1058642330
ADDRGP4 cl_bigcharwidth+12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 448
;448:	}
LABELV $403
line 452
;449:#endif
;450:
;451:	// print the text message as well
;452:	}
LABELV $374
line 455
;453:
;454:	// check for double client messages
;455:	if ( !attackerInfo ) {
ADDRLP4 92
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $408
line 456
;456:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 4094
ASGNI4
line 457
;457:		strcpy( attackerName, "noname" );
ADDRLP4 60
ARGP4
ADDRGP4 $410
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 458
;458:	} else {
ADDRGP4 $409
JUMPV
LABELV $408
line 459
;459:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 60
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 460
;460:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 60
ARGP4
ADDRGP4 $135
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 462
;461:		// check for kill messages about the current clientNum
;462:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $411
line 463
;463:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+1888592
ARGP4
ADDRLP4 60
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 464
;464:		}
LABELV $411
line 465
;465:	}
LABELV $409
line 467
;466:
;467:gender = ci->gender;
ADDRLP4 44
ADDRLP4 48
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
ASGNI4
line 468
;468:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $416
line 469
;469:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 4094
EQI4 $419
line 471
;470:
;471:        if(ent->generic1) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $421
line 472
;472:            message = "was killed by ^2TEAMMATE^7";
ADDRLP4 40
ADDRGP4 $423
ASGNP4
line 473
;473:        }
ADDRGP4 $422
JUMPV
LABELV $421
line 475
;474:        else
;475:		switch (mod) {
ADDRLP4 52
INDIRI4
CNSTI4 1
LTI4 $424
ADDRLP4 52
INDIRI4
CNSTI4 36
GTI4 $424
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $490-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $490
address $432
address $428
address $430
address $434
address $437
address $440
address $442
address $444
address $447
address $448
address $450
address $452
address $452
address $424
address $424
address $424
address $424
address $424
address $424
address $480
address $478
address $486
address $475
address $482
address $424
address $424
address $484
address $455
address $457
address $460
address $463
address $466
address $426
address $468
address $470
address $473
code
LABELV $426
line 477
;476:		case MOD_GRAPPLE:
;477:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $427
ASGNP4
line 478
;478:			break;
ADDRGP4 $425
JUMPV
LABELV $428
line 480
;479:		case MOD_GAUNTLET:
;480:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $429
ASGNP4
line 481
;481:			break;
ADDRGP4 $425
JUMPV
LABELV $430
line 483
;482:		case MOD_MACHINEGUN:
;483:			message = "was machinegunned by";
ADDRLP4 40
ADDRGP4 $431
ASGNP4
line 484
;484:			break;
ADDRGP4 $425
JUMPV
LABELV $432
line 486
;485:		case MOD_SHOTGUN:
;486:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $433
ASGNP4
line 487
;487:			break;
ADDRGP4 $425
JUMPV
LABELV $434
line 489
;488:		case MOD_GRENADE:
;489:			message = "ate";
ADDRLP4 40
ADDRGP4 $435
ASGNP4
line 490
;490:			message2 = "'s grenade";
ADDRLP4 96
ADDRGP4 $436
ASGNP4
line 491
;491:			break;
ADDRGP4 $425
JUMPV
LABELV $437
line 493
;492:		case MOD_GRENADE_SPLASH:
;493:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $438
ASGNP4
line 494
;494:			message2 = "'s shrapnel";
ADDRLP4 96
ADDRGP4 $439
ASGNP4
line 495
;495:			break;
ADDRGP4 $425
JUMPV
LABELV $440
line 497
;496:		case MOD_ROCKET:
;497:			message = "ate";
ADDRLP4 40
ADDRGP4 $435
ASGNP4
line 498
;498:			message2 = "'s rocket";
ADDRLP4 96
ADDRGP4 $441
ASGNP4
line 499
;499:			break;
ADDRGP4 $425
JUMPV
LABELV $442
line 501
;500:		case MOD_ROCKET_SPLASH:
;501:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $443
ASGNP4
line 502
;502:			message2 = "'s rocket";
ADDRLP4 96
ADDRGP4 $441
ASGNP4
line 503
;503:			break;
ADDRGP4 $425
JUMPV
LABELV $444
line 505
;504:		case MOD_PLASMA:
;505:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $445
ASGNP4
line 506
;506:			message2 = "'s plasmagun";
ADDRLP4 96
ADDRGP4 $446
ASGNP4
line 507
;507:			break;
ADDRGP4 $425
JUMPV
LABELV $447
line 509
;508:		case MOD_PLASMA_SPLASH:
;509:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $445
ASGNP4
line 510
;510:			message2 = "'s plasmagun";
ADDRLP4 96
ADDRGP4 $446
ASGNP4
line 511
;511:			break;
ADDRGP4 $425
JUMPV
LABELV $448
line 513
;512:		case MOD_RAILGUN:
;513:			message = "was railed by";
ADDRLP4 40
ADDRGP4 $449
ASGNP4
line 514
;514:			break;
ADDRGP4 $425
JUMPV
LABELV $450
line 516
;515:		case MOD_LIGHTNING:
;516:			message = "was electrocuted by";
ADDRLP4 40
ADDRGP4 $451
ASGNP4
line 517
;517:			break;
ADDRGP4 $425
JUMPV
LABELV $452
line 520
;518:		case MOD_BFG:
;519:		case MOD_BFG_SPLASH:
;520:			message = "was blasted by";
ADDRLP4 40
ADDRGP4 $453
ASGNP4
line 521
;521:			message2 = "'s BFG";
ADDRLP4 96
ADDRGP4 $454
ASGNP4
line 522
;522:			break;
ADDRGP4 $425
JUMPV
LABELV $455
line 524
;523:		case MOD_NAIL:
;524:			message = "was nailed by";
ADDRLP4 40
ADDRGP4 $456
ASGNP4
line 525
;525:			break;
ADDRGP4 $425
JUMPV
LABELV $457
line 527
;526:		case MOD_CHAINGUN:
;527:			message = "got lead poisoning from";
ADDRLP4 40
ADDRGP4 $458
ASGNP4
line 528
;528:			message2 = "'s Chaingun";
ADDRLP4 96
ADDRGP4 $459
ASGNP4
line 529
;529:			break;
ADDRGP4 $425
JUMPV
LABELV $460
line 531
;530:		case MOD_PROXIMITY_MINE:
;531:			message = "was too close to";
ADDRLP4 40
ADDRGP4 $461
ASGNP4
line 532
;532:			message2 = "'s Prox Mine";
ADDRLP4 96
ADDRGP4 $462
ASGNP4
line 533
;533:			break;
ADDRGP4 $425
JUMPV
LABELV $463
line 535
;534:		case MOD_KAMIKAZE:
;535:			message = "falls to";
ADDRLP4 40
ADDRGP4 $464
ASGNP4
line 536
;536:			message2 = "'s Kamikaze blast";
ADDRLP4 96
ADDRGP4 $465
ASGNP4
line 537
;537:			break;
ADDRGP4 $425
JUMPV
LABELV $466
line 539
;538:		case MOD_JUICED:
;539:			message = "was juiced by";
ADDRLP4 40
ADDRGP4 $467
ASGNP4
line 540
;540:			break;
ADDRGP4 $425
JUMPV
LABELV $468
line 542
;541:		case MOD_CAR:
;542:			message = "could not withstand a collision with";
ADDRLP4 40
ADDRGP4 $469
ASGNP4
line 543
;543:			break;
ADDRGP4 $425
JUMPV
LABELV $470
line 545
;544:		case MOD_CAREXPLODE:
;545:			message = "exploded by";
ADDRLP4 40
ADDRGP4 $471
ASGNP4
line 546
;546:			message2 = "'s car";
ADDRLP4 96
ADDRGP4 $472
ASGNP4
line 547
;547:			break;
ADDRGP4 $425
JUMPV
LABELV $473
line 549
;548:		case MOD_PROP:
;549:			message = "was crushed by an object thrown by";
ADDRLP4 40
ADDRGP4 $474
ASGNP4
line 550
;550:			break;
ADDRGP4 $425
JUMPV
LABELV $475
line 552
;551:		case MOD_TELEFRAG:
;552:			message = "tried to invade";
ADDRLP4 40
ADDRGP4 $476
ASGNP4
line 553
;553:			message2 = "'s personal space";
ADDRLP4 96
ADDRGP4 $477
ASGNP4
line 554
;554:			break;
ADDRGP4 $425
JUMPV
LABELV $478
line 556
;555:                case MOD_LAVA:
;556:                        message = "was given a hot bath by";
ADDRLP4 40
ADDRGP4 $479
ASGNP4
line 557
;557:                        break;
ADDRGP4 $425
JUMPV
LABELV $480
line 559
;558:                case MOD_SLIME:
;559:                        message = "was given a acid bath by";
ADDRLP4 40
ADDRGP4 $481
ASGNP4
line 560
;560:                        break;
ADDRGP4 $425
JUMPV
LABELV $482
line 562
;561:                case MOD_FALLING:
;562:                        message = "was given a small push by";
ADDRLP4 40
ADDRGP4 $483
ASGNP4
line 563
;563:                        break;
ADDRGP4 $425
JUMPV
LABELV $484
line 565
;564:                case MOD_TRIGGER_HURT:
;565:                        message = "was helped on the way by";
ADDRLP4 40
ADDRGP4 $485
ASGNP4
line 566
;566:                        break;
ADDRGP4 $425
JUMPV
LABELV $486
line 568
;567:                case MOD_CRUSH:
;568:                        message = "was crushed in";
ADDRLP4 40
ADDRGP4 $487
ASGNP4
line 569
;569:                        message2 = "'s trap";
ADDRLP4 96
ADDRGP4 $488
ASGNP4
line 570
;570:                        break;
ADDRGP4 $425
JUMPV
LABELV $424
line 572
;571:		default:
;572:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $489
ASGNP4
line 573
;573:			break;
LABELV $425
LABELV $422
line 575
;574:		}
;575:	}
LABELV $419
line 576
;576:}
LABELV $416
line 577
;577:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $492
line 578
;578:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 4094
EQI4 $495
line 579
;579:	message2 = " ";
ADDRLP4 96
ADDRGP4 $497
ASGNP4
line 580
;580:                if(ent->generic1) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $498
line 581
;581:					if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $500
line 582
;582:					message = "была убита ^2СОЮЗНИКОМ^7";
ADDRLP4 40
ADDRGP4 $502
ASGNP4
ADDRGP4 $499
JUMPV
LABELV $500
line 584
;583:					else
;584:                    message = "был убит ^2СОЮЗНИКОМ^7";
ADDRLP4 40
ADDRGP4 $503
ASGNP4
line 585
;585:                }
ADDRGP4 $499
JUMPV
LABELV $498
line 587
;586:                else
;587:		switch (mod) {
ADDRLP4 52
INDIRI4
CNSTI4 1
LTI4 $504
ADDRLP4 52
INDIRI4
CNSTI4 36
GTI4 $504
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $647-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $647
address $521
address $511
address $516
address $526
address $531
address $536
address $541
address $546
address $552
address $557
address $562
address $567
address $567
address $504
address $504
address $504
address $504
address $504
address $504
address $623
address $618
address $638
address $613
address $628
address $504
address $504
address $633
address $573
address $578
address $583
address $588
address $593
address $506
address $598
address $603
address $608
code
LABELV $506
line 589
;588:		case MOD_GRAPPLE:
;589:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $507
line 590
;590:			message = "была поймана";
ADDRLP4 40
ADDRGP4 $509
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $507
line 592
;591:			else
;592:			message = "был пойман";
ADDRLP4 40
ADDRGP4 $510
ASGNP4
line 593
;593:			break;
ADDRGP4 $505
JUMPV
LABELV $511
line 595
;594:		case MOD_GAUNTLET:
;595:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $512
line 596
;596:			message = "была избита";
ADDRLP4 40
ADDRGP4 $514
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $512
line 598
;597:			else
;598:			message = "был избит";
ADDRLP4 40
ADDRGP4 $515
ASGNP4
line 599
;599:			break;
ADDRGP4 $505
JUMPV
LABELV $516
line 601
;600:		case MOD_MACHINEGUN:
;601:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $517
line 602
;602:			message = "была расстреляна";
ADDRLP4 40
ADDRGP4 $519
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $517
line 604
;603:			else
;604:			message = "был расстрелян";
ADDRLP4 40
ADDRGP4 $520
ASGNP4
line 605
;605:			break;
ADDRGP4 $505
JUMPV
LABELV $521
line 607
;606:		case MOD_SHOTGUN:
;607:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $522
line 608
;608:			message = "была застрелена";
ADDRLP4 40
ADDRGP4 $524
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $522
line 610
;609:			else
;610:			message = "был застрелен";
ADDRLP4 40
ADDRGP4 $525
ASGNP4
line 611
;611:			break;
ADDRGP4 $505
JUMPV
LABELV $526
line 613
;612:		case MOD_GRENADE:
;613:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $527
line 614
;614:			message = "съела гранату";
ADDRLP4 40
ADDRGP4 $529
ASGNP4
ADDRGP4 $528
JUMPV
LABELV $527
line 616
;615:			else
;616:			message = "съел гранату";
ADDRLP4 40
ADDRGP4 $530
ASGNP4
LABELV $528
line 617
;617:			message2 = " ";
ADDRLP4 96
ADDRGP4 $497
ASGNP4
line 618
;618:			break;
ADDRGP4 $505
JUMPV
LABELV $531
line 620
;619:		case MOD_GRENADE_SPLASH:
;620:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $532
line 621
;621:			message = "была взорвана гранатой";
ADDRLP4 40
ADDRGP4 $534
ASGNP4
ADDRGP4 $533
JUMPV
LABELV $532
line 623
;622:			else
;623:			message = "был взорван гранатой";
ADDRLP4 40
ADDRGP4 $535
ASGNP4
LABELV $533
line 624
;624:			message2 = " ";
ADDRLP4 96
ADDRGP4 $497
ASGNP4
line 625
;625:			break;
ADDRGP4 $505
JUMPV
LABELV $536
line 627
;626:		case MOD_ROCKET:
;627:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $537
line 628
;628:			message = "съела ракету";
ADDRLP4 40
ADDRGP4 $539
ASGNP4
ADDRGP4 $538
JUMPV
LABELV $537
line 630
;629:			else
;630:			message = "съел ракету";
ADDRLP4 40
ADDRGP4 $540
ASGNP4
LABELV $538
line 631
;631:			message2 = " ";
ADDRLP4 96
ADDRGP4 $497
ASGNP4
line 632
;632:			break;
ADDRGP4 $505
JUMPV
LABELV $541
line 634
;633:		case MOD_ROCKET_SPLASH:
;634:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $542
line 635
;635:			message = "почти увернулась от ракеты";
ADDRLP4 40
ADDRGP4 $544
ASGNP4
ADDRGP4 $543
JUMPV
LABELV $542
line 637
;636:			else
;637:			message = "почти увернулся от ракеты";
ADDRLP4 40
ADDRGP4 $545
ASGNP4
LABELV $543
line 638
;638:			message2 = " ";
ADDRLP4 96
ADDRGP4 $497
ASGNP4
line 639
;639:			break;
ADDRGP4 $505
JUMPV
LABELV $546
line 641
;640:		case MOD_PLASMA:
;641:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $547
line 642
;642:			message = "была переплавлена";
ADDRLP4 40
ADDRGP4 $549
ASGNP4
ADDRGP4 $548
JUMPV
LABELV $547
line 644
;643:			else
;644:			message = "был переплавлен";
ADDRLP4 40
ADDRGP4 $550
ASGNP4
LABELV $548
line 645
;645:			message2 = " с помощью плазмагана";
ADDRLP4 96
ADDRGP4 $551
ASGNP4
line 646
;646:			break;
ADDRGP4 $505
JUMPV
LABELV $552
line 648
;647:		case MOD_PLASMA_SPLASH:
;648:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $553
line 649
;649:			message = "была расплавлена";
ADDRLP4 40
ADDRGP4 $555
ASGNP4
ADDRGP4 $554
JUMPV
LABELV $553
line 651
;650:			else
;651:			message = "был расплавлен";
ADDRLP4 40
ADDRGP4 $556
ASGNP4
LABELV $554
line 652
;652:			message2 = " с помощью плазмагана";
ADDRLP4 96
ADDRGP4 $551
ASGNP4
line 653
;653:			break;
ADDRGP4 $505
JUMPV
LABELV $557
line 655
;654:		case MOD_RAILGUN:
;655:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $558
line 656
;656:			message = "была пробита";
ADDRLP4 40
ADDRGP4 $560
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $558
line 658
;657:			else
;658:			message = "был пробит";
ADDRLP4 40
ADDRGP4 $561
ASGNP4
line 659
;659:			break;
ADDRGP4 $505
JUMPV
LABELV $562
line 661
;660:		case MOD_LIGHTNING:
;661:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $563
line 662
;662:			message = "была убита электрическим током";
ADDRLP4 40
ADDRGP4 $565
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $563
line 664
;663:			else
;664:			message = "был убит электрическим током";
ADDRLP4 40
ADDRGP4 $566
ASGNP4
line 665
;665:			break;
ADDRGP4 $505
JUMPV
LABELV $567
line 668
;666:		case MOD_BFG:
;667:		case MOD_BFG_SPLASH:
;668:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $568
line 669
;669:			message = "была взорвана";
ADDRLP4 40
ADDRGP4 $570
ASGNP4
ADDRGP4 $569
JUMPV
LABELV $568
line 671
;670:			else
;671:			message = "был взорван";
ADDRLP4 40
ADDRGP4 $571
ASGNP4
LABELV $569
line 672
;672:			message2 = " с помощью БФГ";
ADDRLP4 96
ADDRGP4 $572
ASGNP4
line 673
;673:			break;
ADDRGP4 $505
JUMPV
LABELV $573
line 675
;674:		case MOD_NAIL:
;675:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $574
line 676
;676:			message = "была прибита";
ADDRLP4 40
ADDRGP4 $576
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $574
line 678
;677:			else
;678:			message = "был прибит";
ADDRLP4 40
ADDRGP4 $577
ASGNP4
line 679
;679:			break;
ADDRGP4 $505
JUMPV
LABELV $578
line 681
;680:		case MOD_CHAINGUN:
;681:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $579
line 682
;682:			message = "получила отравление свинцом от";
ADDRLP4 40
ADDRGP4 $581
ASGNP4
ADDRGP4 $580
JUMPV
LABELV $579
line 684
;683:			else
;684:			message = "получил отравление свинцом от";
ADDRLP4 40
ADDRGP4 $582
ASGNP4
LABELV $580
line 685
;685:			message2 = " ";
ADDRLP4 96
ADDRGP4 $497
ASGNP4
line 686
;686:			break;
ADDRGP4 $505
JUMPV
LABELV $583
line 688
;687:		case MOD_PROXIMITY_MINE:
;688:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $584
line 689
;689:			message = "была слишком близок к мине";
ADDRLP4 40
ADDRGP4 $586
ASGNP4
ADDRGP4 $585
JUMPV
LABELV $584
line 691
;690:			else
;691:			message = "был слишком близок к мине";
ADDRLP4 40
ADDRGP4 $587
ASGNP4
LABELV $585
line 692
;692:			message2 = " ";
ADDRLP4 96
ADDRGP4 $497
ASGNP4
line 693
;693:			break;
ADDRGP4 $505
JUMPV
LABELV $588
line 695
;694:		case MOD_KAMIKAZE:
;695:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $589
line 696
;696:			message = "упала от взрывной волны";
ADDRLP4 40
ADDRGP4 $591
ASGNP4
ADDRGP4 $590
JUMPV
LABELV $589
line 698
;697:			else
;698:			message = "упал от взрывной волны";
ADDRLP4 40
ADDRGP4 $592
ASGNP4
LABELV $590
line 699
;699:			message2 = " ";
ADDRLP4 96
ADDRGP4 $497
ASGNP4
line 700
;700:			break;
ADDRGP4 $505
JUMPV
LABELV $593
line 702
;701:		case MOD_JUICED:
;702:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $594
line 703
;703:			message = "была выжата благодаря";
ADDRLP4 40
ADDRGP4 $596
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $594
line 705
;704:			else
;705:			message = "был выжат благодаря";
ADDRLP4 40
ADDRGP4 $597
ASGNP4
line 706
;706:			break;
ADDRGP4 $505
JUMPV
LABELV $598
line 708
;707:		case MOD_CAR:
;708:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $599
line 709
;709:			message = "не выдержала столкновения с";
ADDRLP4 40
ADDRGP4 $601
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $599
line 711
;710:			else
;711:			message = "не выдержал столкновения с";
ADDRLP4 40
ADDRGP4 $602
ASGNP4
line 712
;712:			break;
ADDRGP4 $505
JUMPV
LABELV $603
line 714
;713:		case MOD_CAREXPLODE:
;714:		if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $604
line 715
;715:			message = "взорвана машиной";
ADDRLP4 40
ADDRGP4 $606
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $604
line 717
;716:		else
;717:			message = "взорван машиной";
ADDRLP4 40
ADDRGP4 $607
ASGNP4
line 718
;718:			break;
ADDRGP4 $505
JUMPV
LABELV $608
line 720
;719:		case MOD_PROP:
;720:		if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $609
line 721
;721:			message = "была раздавлена брошенным предметом от";
ADDRLP4 40
ADDRGP4 $611
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $609
line 723
;722:		else
;723:			message = "был раздавлен брошенным предметом от";
ADDRLP4 40
ADDRGP4 $612
ASGNP4
line 724
;724:			break;
ADDRGP4 $505
JUMPV
LABELV $613
line 726
;725:		case MOD_TELEFRAG:
;726:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $614
line 727
;727:			message = "пыталась вторгнуться в личное пространство";
ADDRLP4 40
ADDRGP4 $616
ASGNP4
ADDRGP4 $615
JUMPV
LABELV $614
line 729
;728:			else
;729:			message = "пытался вторгнуться в личное пространство";
ADDRLP4 40
ADDRGP4 $617
ASGNP4
LABELV $615
line 730
;730:			message2 = " ";
ADDRLP4 96
ADDRGP4 $497
ASGNP4
line 731
;731:			break;
ADDRGP4 $505
JUMPV
LABELV $618
line 733
;732:                case MOD_LAVA:
;733:						if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $619
line 734
;734:						message = "получила горячую ванну от";
ADDRLP4 40
ADDRGP4 $621
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $619
line 736
;735:						else
;736:                        message = "получил горячую ванну от";
ADDRLP4 40
ADDRGP4 $622
ASGNP4
line 737
;737:                        break;
ADDRGP4 $505
JUMPV
LABELV $623
line 739
;738:                case MOD_SLIME:
;739:						if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $624
line 740
;740:						message = "приняла кислотную ванну от";
ADDRLP4 40
ADDRGP4 $626
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $624
line 742
;741:						else
;742:                        message = "принял кислотную ванну от";
ADDRLP4 40
ADDRGP4 $627
ASGNP4
line 743
;743:                        break;
ADDRGP4 $505
JUMPV
LABELV $628
line 745
;744:                case MOD_FALLING:
;745:						if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $629
line 746
;746:						message = "получила небольшой толчок от";
ADDRLP4 40
ADDRGP4 $631
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $629
line 748
;747:						else
;748:                        message = "получил небольшой толчок от";
ADDRLP4 40
ADDRGP4 $632
ASGNP4
line 749
;749:                        break;
ADDRGP4 $505
JUMPV
LABELV $633
line 751
;750:                case MOD_TRIGGER_HURT:
;751:						if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $634
line 752
;752:						message = "получила помощь в полете от";
ADDRLP4 40
ADDRGP4 $636
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $634
line 754
;753:						else
;754:                        message = "получил помощь в полете от";
ADDRLP4 40
ADDRGP4 $637
ASGNP4
line 755
;755:                        break;
ADDRGP4 $505
JUMPV
LABELV $638
line 757
;756:                case MOD_CRUSH:
;757:						if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $639
line 758
;758:						message = "была раздавлена в ловушке";
ADDRLP4 40
ADDRGP4 $641
ASGNP4
ADDRGP4 $640
JUMPV
LABELV $639
line 760
;759:						else
;760:                        message = "был раздавлен в ловушке";
ADDRLP4 40
ADDRGP4 $642
ASGNP4
LABELV $640
line 761
;761:                        message2 = " ";
ADDRLP4 96
ADDRGP4 $497
ASGNP4
line 762
;762:                        break;
ADDRGP4 $505
JUMPV
LABELV $504
line 764
;763:		default:
;764:			if ( gender == GENDER_FEMALE )
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $643
line 765
;765:			message = "была убита";
ADDRLP4 40
ADDRGP4 $645
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $643
line 767
;766:			else
;767:			message = "был убит";
ADDRLP4 40
ADDRGP4 $646
ASGNP4
line 768
;768:			break;
LABELV $505
LABELV $499
line 770
;769:		}
;770:	}
LABELV $495
line 771
;771:}
LABELV $492
line 772
;772:		if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $649
line 773
;773:			CG_Printf( "%s> %s%s%s %s%s %s%s%s\n", 
ADDRGP4 $651
ARGP4
ADDRLP4 116
ADDRGP4 $373
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 $135
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 785
;774:				S_COLOR_YELLOW,
;775:			       	S_COLOR_WHITE,
;776:			       	targetName,
;777:			       	S_COLOR_YELLOW,
;778:			       	message,
;779:			       	S_COLOR_WHITE,
;780:				attackerName,
;781:			       	S_COLOR_YELLOW,
;782:			       	message2,
;783:			       	S_COLOR_WHITE
;784:				);
;785:			return;
ADDRGP4 $123
JUMPV
LABELV $649
line 788
;786:		}
;787:
;788:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $652
line 790
;789:	// we don't know what it was
;790:	CG_Printf( "%s> %s%s%s died.%s\n",S_COLOR_YELLOW,S_COLOR_WHITE,targetName,S_COLOR_YELLOW,S_COLOR_WHITE);
ADDRGP4 $655
ARGP4
ADDRLP4 116
ADDRGP4 $373
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 $135
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 791
;791:	}
LABELV $652
line 792
;792:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $656
line 794
;793:	// we don't know what it was
;794:	CG_Printf( "%s> %s%s%s умер.%s\n",S_COLOR_YELLOW,S_COLOR_WHITE,targetName,S_COLOR_YELLOW,S_COLOR_WHITE);
ADDRGP4 $659
ARGP4
ADDRLP4 116
ADDRGP4 $373
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 $135
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 795
;795:	}
LABELV $656
line 796
;796:}
LABELV $123
endproc CG_Obituary 132 44
proc CG_UseItem 32 16
line 805
;797:
;798://==========================================================================
;799:
;800:/*
;801:===============
;802:CG_UseItem
;803:===============
;804:*/
;805:static void CG_UseItem( centity_t *cent ) {
line 811
;806:	clientInfo_t *ci;
;807:	int			itemNum, clientNum;
;808:	gitem_t		*item;
;809:	entityState_t *es;
;810:
;811:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 813
;812:	
;813:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 24
SUBI4
ASGNI4
line 814
;814:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $663
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $661
LABELV $663
line 815
;815:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 816
;816:	}
LABELV $661
line 819
;817:
;818:	// print a message if the local player
;819:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $664
line 820
;820:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $667
line 821
;821:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $669
line 822
;822:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $672
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 823
;823:}
LABELV $669
line 824
;824:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $668
line 825
;825:			CG_CenterPrint( "Нет предмета", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $677
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 826
;826:}
line 827
;827:		} else {
ADDRGP4 $668
JUMPV
LABELV $667
line 828
;828:			item = BG_FindItemForHoldable( itemNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 829
;829:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $679
line 830
;830:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $682
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 831
;831:}
LABELV $679
line 832
;832:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $684
line 833
;833:			CG_CenterPrint( va("Использован %s", item->pickup_nameru), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $687
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 834
;834:}
LABELV $684
line 835
;835:		}
LABELV $668
line 836
;836:	}
LABELV $664
line 838
;837:
;838:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $689
ADDRLP4 0
INDIRI4
CNSTI4 5
GTI4 $689
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $707
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $707
address $691
address $690
address $695
address $690
address $690
address $704
code
LABELV $689
LABELV $691
line 841
;839:	default:
;840:	case HI_NONE:
;841:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+956380+1832
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 842
;842:		break;
ADDRGP4 $690
JUMPV
line 845
;843:
;844:	case HI_TELEPORTER:
;845:		break;
LABELV $695
line 848
;846:
;847:	case HI_MEDKIT:
;848:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 849
;849:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $696
ADDRLP4 28
INDIRI4
CNSTI4 256
GEI4 $696
line 850
;850:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 1944
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 851
;851:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 212
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 852
;852:		}
LABELV $696
line 853
;853:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+956380+2320
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 854
;854:		break;
ADDRGP4 $690
JUMPV
line 858
;855:
;856:
;857:	case HI_KAMIKAZE:
;858:		break;
line 861
;859:
;860:	case HI_PORTAL:
;861:		break;
LABELV $704
line 863
;862:	case HI_INVULNERABILITY:
;863:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+956380+2072
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 864
;864:		break;
LABELV $690
line 868
;865:
;866:	}
;867:
;868:}
LABELV $660
endproc CG_UseItem 32 16
proc CG_WeaponHigher 28 16
line 870
;869:
;870:static qboolean CG_WeaponHigher(int currentWeapon, int newWeapon) {
line 871
;871:    char *currentScore = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 872
;872:    char *newScore = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 874
;873:    char weapon[5];
;874:    Com_sprintf(weapon,5,"/%i/",currentWeapon);
ADDRLP4 8
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 $709
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 875
;875:    currentScore = strstr(cg_weaponOrder.string,weapon);
ADDRGP4 cg_weaponOrder+16
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 16
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 876
;876:    Com_sprintf(weapon,5,"/%i/",newWeapon);
ADDRLP4 8
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 $709
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 877
;877:    newScore = strstr(cg_weaponOrder.string,weapon);
ADDRGP4 cg_weaponOrder+16
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 878
;878:    if(!newScore || !currentScore)
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $714
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
NEU4 $712
LABELV $714
line 879
;879:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $708
JUMPV
LABELV $712
line 880
;880:    if(newScore>currentScore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
LEU4 $715
line 881
;881:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $708
JUMPV
LABELV $715
line 883
;882:    else
;883:        return qfalse;
CNSTI4 0
RETI4
LABELV $708
endproc CG_WeaponHigher 28 16
proc CG_ItemPickup 4 0
line 893
;884:}
;885:
;886:/*
;887:================
;888:CG_ItemPickup
;889:
;890:A new item was picked up this frame
;891:================
;892:*/
;893:static void CG_ItemPickup( int itemNum ) {
line 894
;894:	cg.itemPickup = itemNum;
ADDRGP4 cg+1952952
ADDRFP4 0
INDIRI4
ASGNI4
line 895
;895:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+1952956
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 896
;896:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+1952960
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 898
;897:	// see if it should be the grabbed weapon
;898:	if ( bg_itemlist[itemNum].giType == IT_AMMO ) {
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $723
line 899
;899:		if(cg.swep_listcl[bg_itemlist[itemNum].giTag] == 2){
ADDRLP4 0
CNSTI4 2
ASGNI4
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+44
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
ADDRGP4 cg+1870444
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $726
line 900
;900:			cg.swep_listcl[bg_itemlist[itemNum].giTag] = 1;
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1870444
ADDP4
CNSTI4 1
ASGNI4
line 901
;901:		}
LABELV $726
line 902
;902:	}
LABELV $723
line 903
;903:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 1
NEI4 $732
line 904
;904:		cg.swep_listcl[bg_itemlist[itemNum].giTag] = 1;
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1870444
ADDP4
CNSTI4 1
ASGNI4
line 905
;905:	}
LABELV $732
line 907
;906:
;907:}
LABELV $717
endproc CG_ItemPickup 4 0
proc CG_AddWeapon 108 0
line 916
;908:
;909:/*
;910:================
;911:CG_AddWeapon
;912:
;913:Adds custom weapon
;914:================
;915:*/
;916:static void CG_AddWeapon( int weaponNum, int delete ) {
line 923
;917:	weaponInfo_t	*weaponInfo;
;918:	gitem_t			*item, *ammo;
;919:	char			path[MAX_QPATH];
;920:	vec3_t			mins, maxs;
;921:	int				i;
;922:	
;923:	for ( item = bg_itemlist + 1 ; item->classname ; item++ ) {
ADDRLP4 0
ADDRGP4 bg_itemlist+56
ASGNP4
ADDRGP4 $741
JUMPV
LABELV $738
line 924
;924:		if ( item->giType == IT_WEAPON && item->giTag == weaponNum ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
NEI4 $743
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $743
line 925
;925:			cg.swep_listcl[bg_itemlist[weaponNum].giTag] = 1;
CNSTI4 56
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1870444
ADDP4
CNSTI4 1
ASGNI4
line 926
;926:			break;
ADDRGP4 $740
JUMPV
LABELV $743
line 928
;927:		}
;928:	}	
LABELV $739
line 923
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
LABELV $741
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $738
LABELV $740
line 929
;929:}
LABELV $737
endproc CG_AddWeapon 108 0
export CG_WaterLevel
proc CG_WaterLevel 48 8
line 938
;930:
;931:/*
;932:================
;933:CG_WaterLevel
;934:
;935:Returns waterlevel for entity origin
;936:================
;937:*/
;938:int CG_WaterLevel(centity_t *cent) {
line 943
;939:	vec3_t point;
;940:	int contents, sample1, sample2, anim, waterlevel;
;941:
;942:	// get waterlevel, accounting for ducking
;943:	waterlevel = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 944
;944:	VectorCopy(cent->lerpOrigin, point);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRB
ASGNB 12
line 945
;945:	point[2] += MINS_Z + 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3250061312
ADDF4
ASGNF4
line 946
;946:	anim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 948
;947:
;948:	if (anim == LEGS_WALKCR || anim == LEGS_IDLECR) {
ADDRLP4 16
INDIRI4
CNSTI4 13
EQI4 $751
ADDRLP4 16
INDIRI4
CNSTI4 23
NEI4 $749
LABELV $751
line 949
;949:		point[2] += CROUCH_VIEWHEIGHT;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 950
;950:	} else {
ADDRGP4 $750
JUMPV
LABELV $749
line 951
;951:		point[2] += DEFAULT_VIEWHEIGHT;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1104150528
ADDF4
ASGNF4
line 952
;952:	}
LABELV $750
line 954
;953:
;954:	contents = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 36
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 956
;955:
;956:	if (contents & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $754
line 957
;957:		sample2 = point[2] - MINS_Z;
ADDRLP4 24
ADDRLP4 0+8
INDIRF4
CNSTF4 3250585600
SUBF4
CVFI4 4
ASGNI4
line 958
;958:		sample1 = sample2 / 2;
ADDRLP4 28
ADDRLP4 24
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 959
;959:		waterlevel = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 960
;960:		point[2] = cent->lerpOrigin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 961
;961:		contents = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 40
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 963
;962:
;963:		if (contents & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $758
line 964
;964:			waterlevel = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 965
;965:			point[2] = cent->lerpOrigin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 24
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 966
;966:			contents = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 44
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 968
;967:
;968:			if (contents & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $761
line 969
;969:				waterlevel = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 970
;970:			}
LABELV $761
line 971
;971:		}
LABELV $758
line 972
;972:	}
LABELV $754
line 974
;973:
;974:	return waterlevel;
ADDRLP4 20
INDIRI4
RETI4
LABELV $747
endproc CG_WaterLevel 48 8
export CG_PainEvent
proc CG_PainEvent 16 16
line 984
;975:}
;976:
;977:/*
;978:================
;979:CG_PainEvent
;980:
;981:Also called by playerstate transition
;982:================
;983:*/
;984:void CG_PainEvent( centity_t *cent, int health ) {
line 988
;985:	char	*snd;
;986:
;987:	// don't do more than two pain sounds a second
;988:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $764
line 989
;989:		return;
ADDRGP4 $763
JUMPV
LABELV $764
line 992
;990:	}
;991:
;992:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $767
line 993
;993:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $769
ASGNP4
line 994
;994:	} else if ( health < 50 ) {
ADDRGP4 $768
JUMPV
LABELV $767
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $770
line 995
;995:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $772
ASGNP4
line 996
;996:	} else if ( health < 75 ) {
ADDRGP4 $771
JUMPV
LABELV $770
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $773
line 997
;997:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $775
ASGNP4
line 998
;998:	} else {
ADDRGP4 $774
JUMPV
LABELV $773
line 999
;999:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $776
ASGNP4
line 1000
;1000:	}
LABELV $774
LABELV $771
LABELV $768
line 1002
;1001:	// play a gurp sound instead of a normal pain sound
;1002:	if (CG_WaterLevel(cent) >= 1) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_WaterLevel
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $777
line 1003
;1003:		if (rand()&1) {
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $779
line 1004
;1004:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, "sound/player/gurp1.wav"));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $781
ARGP4
ADDRLP4 12
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1005
;1005:		} else {
ADDRGP4 $778
JUMPV
LABELV $779
line 1006
;1006:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, "sound/player/gurp2.wav"));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $782
ARGP4
ADDRLP4 12
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1007
;1007:		}
line 1008
;1008:	} else {
ADDRGP4 $778
JUMPV
LABELV $777
line 1009
;1009:		trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, snd));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1010
;1010:	}
LABELV $778
line 1012
;1011:	// save pain time for programitic twitch animation
;1012:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1013
;1013:	cent->pe.painDirection ^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1014
;1014:}
LABELV $763
endproc CG_PainEvent 16 16
export CG_PainVehicleEvent
proc CG_PainVehicleEvent 8 16
line 1016
;1015:
;1016:void CG_PainVehicleEvent( centity_t *cent, int health ) {
line 1019
;1017:	char	*snd;
;1018:
;1019:	trap_S_StartSound (NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, "sound/vehicle/damage50.ogg") );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $785
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1020
;1020:}
LABELV $784
endproc CG_PainVehicleEvent 8 16
lit
align 4
LABELV $984
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 232 48
line 1033
;1021:
;1022:
;1023:
;1024:/*
;1025:==============
;1026:CG_EntityEvent
;1027:
;1028:An entity has an event value
;1029:also called by CG_CheckPlayerstateEvents
;1030:==============
;1031:*/
;1032:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;1033:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 1044
;1034:	entityState_t	*es;
;1035:	int				event;
;1036:	vec3_t			dir;
;1037:	const char		*s;
;1038:	int				clientNum;
;1039:	clientInfo_t	*ci;
;1040:	byte			r, g, b;
;1041:	int				weaphack;
;1042:	int 			random_number;
;1043:
;1044:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1045
;1045:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 1047
;1046:
;1047:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $787
line 1048
;1048:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $790
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1049
;1049:	}
LABELV $787
line 1051
;1050:
;1051:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $791
line 1052
;1052:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $786
ADDRGP4 $796
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1053
;1053:		return;
ADDRGP4 $786
JUMPV
LABELV $791
line 1056
;1054:	}
;1055:
;1056:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1057
;1057:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $799
ADDRLP4 4
INDIRI4
CNSTI4 256
LTI4 $797
LABELV $799
line 1058
;1058:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1059
;1059:	}
LABELV $797
line 1060
;1060:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1944
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1062
;1061:	
;1062:	if(ci->swepid >= 1){
ADDRLP4 12
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
LTI4 $801
line 1063
;1063:	weaphack = ci->swepid;
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 1064
;1064:	} else {
ADDRGP4 $802
JUMPV
LABELV $801
line 1065
;1065:	weaphack = cent->currentState.weapon;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 1066
;1066:	}
LABELV $802
line 1068
;1067:
;1068:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $803
ADDRLP4 8
INDIRI4
CNSTI4 106
GTI4 $803
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1841-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1841
address $805
address $819
address $849
address $864
address $879
address $949
address $949
address $949
address $949
address $894
address $913
address $930
address $979
address $991
address $1073
address $1080
address $1087
address $1094
address $1100
address $1143
address $1157
address $1165
address $1172
address $1177
address $1182
address $1187
address $1192
address $1197
address $1202
address $1207
address $1212
address $1217
address $1222
address $1227
address $1232
address $1237
address $1242
address $1247
address $803
address $1279
address $1272
address $1252
address $1262
address $1287
address $1459
address $1468
address $1479
address $1433
address $1420
address $1358
address $1363
address $1368
address $1373
address $1446
address $803
address $1626
address $1634
address $1642
address $1642
address $1642
address $1651
address $1656
address $1669
address $1682
address $1695
address $1350
address $1298
address $1313
address $1320
address $1325
address $1330
address $1335
address $1340
address $1345
address $1709
address $1704
address $996
address $1037
address $1043
address $1049
address $1055
address $1061
address $1067
address $1714
address $1719
address $1724
address $1729
address $1734
address $1739
address $1744
address $1749
address $1754
address $1759
address $1811
address $1816
address $1821
address $1826
address $1831
address $1776
address $1786
address $1100
address $834
address $1005
address $1011
address $1017
address $1031
code
LABELV $805
line 1073
;1069:	//
;1070:	// movement generated events
;1071:	//
;1072:	case EV_FOOTSTEP:
;1073:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $806
ADDRGP4 $809
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $806
line 1074
;1074:		if (!cg.footstepSuppressed) {
ADDRGP4 cg+1987480
INDIRI4
CNSTI4 0
NEI4 $810
line 1075
;1075:			cg.footstepSuppressed = qtrue;
ADDRGP4 cg+1987480
CNSTI4 1
ASGNI4
line 1076
;1076:			return;
ADDRGP4 $786
JUMPV
LABELV $810
line 1079
;1077:		}
;1078:
;1079:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $804
line 1080
;1080:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+956380+1840
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1083
;1081:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;1082:			
;1083:		}
line 1084
;1084:		break;
ADDRGP4 $804
JUMPV
LABELV $819
line 1086
;1085:	case EV_FOOTSTEP_METAL:
;1086:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $820
ADDRGP4 $823
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $820
line 1087
;1087:		if (!cg.footstepSuppressed) {
ADDRGP4 cg+1987480
INDIRI4
CNSTI4 0
NEI4 $824
line 1088
;1088:			cg.footstepSuppressed = qtrue;
ADDRGP4 cg+1987480
CNSTI4 1
ASGNI4
line 1089
;1089:			return;
ADDRGP4 $786
JUMPV
LABELV $824
line 1092
;1090:		}
;1091:
;1092:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $804
line 1093
;1093:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1095
;1094:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;1095:		}
line 1096
;1096:		break;
ADDRGP4 $804
JUMPV
LABELV $834
line 1098
;1097:	case EV_FOOTSTEP_FLESH:
;1098:		DEBUGNAME("EV_FOOTSTEP_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $835
ADDRGP4 $838
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $835
line 1099
;1099:		if (!cg.footstepSuppressed) {
ADDRGP4 cg+1987480
INDIRI4
CNSTI4 0
NEI4 $839
line 1100
;1100:			cg.footstepSuppressed = qtrue;
ADDRGP4 cg+1987480
CNSTI4 1
ASGNI4
line 1101
;1101:			return;
ADDRGP4 $786
JUMPV
LABELV $839
line 1104
;1102:		}
;1103:
;1104:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $804
line 1105
;1105:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1107
;1106:				cgs.media.footsteps[ FOOTSTEP_FLESH ][rand()&3] );
;1107:		}
line 1108
;1108:		break;
ADDRGP4 $804
JUMPV
LABELV $849
line 1110
;1109:	case EV_FOOTSPLASH:
;1110:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $850
ADDRGP4 $853
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $850
line 1111
;1111:		if (!cg.footstepSuppressed) {
ADDRGP4 cg+1987480
INDIRI4
CNSTI4 0
NEI4 $854
line 1112
;1112:			cg.footstepSuppressed = qtrue;
ADDRGP4 cg+1987480
CNSTI4 1
ASGNI4
line 1113
;1113:			return;
ADDRGP4 $786
JUMPV
LABELV $854
line 1116
;1114:		}
;1115:
;1116:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $804
line 1117
;1117:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1119
;1118:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;1119:		}
line 1120
;1120:		break;
ADDRGP4 $804
JUMPV
LABELV $864
line 1122
;1121:	case EV_FOOTWADE:
;1122:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $865
ADDRGP4 $868
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $865
line 1123
;1123:		if (!cg.footstepSuppressed) {
ADDRGP4 cg+1987480
INDIRI4
CNSTI4 0
NEI4 $869
line 1124
;1124:			cg.footstepSuppressed = qtrue;
ADDRGP4 cg+1987480
CNSTI4 1
ASGNI4
line 1125
;1125:			return;
ADDRGP4 $786
JUMPV
LABELV $869
line 1128
;1126:		}
;1127:
;1128:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $804
line 1129
;1129:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1131
;1130:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;1131:		}
line 1132
;1132:		break;
ADDRGP4 $804
JUMPV
LABELV $879
line 1134
;1133:	case EV_SWIM:
;1134:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $880
ADDRGP4 $883
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $880
line 1135
;1135:		if (!cg.footstepSuppressed) {
ADDRGP4 cg+1987480
INDIRI4
CNSTI4 0
NEI4 $884
line 1136
;1136:			cg.footstepSuppressed = qtrue;
ADDRGP4 cg+1987480
CNSTI4 1
ASGNI4
line 1137
;1137:			return;
ADDRGP4 $786
JUMPV
LABELV $884
line 1140
;1138:		}
;1139:
;1140:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $804
line 1141
;1141:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+1840+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1143
;1142:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;1143:		}
line 1144
;1144:		break;
ADDRGP4 $804
JUMPV
LABELV $894
line 1148
;1145:
;1146:
;1147:	case EV_FALL_SHORT:
;1148:	if(!cg.predictedPlayerState.stats[STAT_VEHICLE]){
ADDRGP4 cg+1868928+184+48
INDIRI4
CNSTI4 0
NEI4 $804
line 1149
;1149:		DEBUGNAME("EV_FALL_SHORT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $900
ADDRGP4 $903
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $900
line 1150
;1150:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2156
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1151
;1151:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+1868928+140
INDIRI4
NEI4 $804
line 1153
;1152:			// smooth landing z changes
;1153:			cg.landChange = -8;
ADDRGP4 cg+1870432
CNSTF4 3238002688
ASGNF4
line 1154
;1154:			cg.landTime = cg.time;
ADDRGP4 cg+1870436
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1155
;1155:		}
line 1156
;1156:	}
line 1157
;1157:		break;
ADDRGP4 $804
JUMPV
LABELV $913
line 1159
;1158:	case EV_FALL_MEDIUM:
;1159:	if(!cg.predictedPlayerState.stats[STAT_VEHICLE]){
ADDRGP4 cg+1868928+184+48
INDIRI4
CNSTI4 0
NEI4 $804
line 1160
;1160:		DEBUGNAME("EV_FALL_MEDIUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $919
ADDRGP4 $922
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $919
line 1162
;1161:		// use normal pain sound
;1162:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $776
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1163
;1163:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+1868928+140
INDIRI4
NEI4 $804
line 1165
;1164:			// smooth landing z changes
;1165:			cg.landChange = -16;
ADDRGP4 cg+1870432
CNSTF4 3246391296
ASGNF4
line 1166
;1166:			cg.landTime = cg.time;
ADDRGP4 cg+1870436
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1167
;1167:		}
line 1168
;1168:	}
line 1169
;1169:		break;
ADDRGP4 $804
JUMPV
LABELV $930
line 1171
;1170:	case EV_FALL_FAR:
;1171:	if(!cg.predictedPlayerState.stats[STAT_VEHICLE]){
ADDRGP4 cg+1868928+184+48
INDIRI4
CNSTI4 0
NEI4 $804
line 1172
;1172:		DEBUGNAME("EV_FALL_FAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $936
ADDRGP4 $939
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $936
line 1173
;1173:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $940
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1174
;1174:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1175
;1175:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+1868928+140
INDIRI4
NEI4 $804
line 1177
;1176:			// smooth landing z changes
;1177:			cg.landChange = -24;
ADDRGP4 cg+1870432
CNSTF4 3250585600
ASGNF4
line 1178
;1178:			cg.landTime = cg.time;
ADDRGP4 cg+1870436
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1179
;1179:		}
line 1180
;1180:	}
line 1181
;1181:		break;
ADDRGP4 $804
JUMPV
LABELV $949
line 1187
;1182:
;1183:	case EV_STEP_4:
;1184:	case EV_STEP_8:
;1185:	case EV_STEP_12:
;1186:	case EV_STEP_16:		// smooth out step up transitions
;1187:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $950
ADDRGP4 $953
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $950
line 1188
;1188:	{
line 1193
;1189:		float	oldStep;
;1190:		int		delta;
;1191:		int		step;
;1192:
;1193:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+1868928+140
INDIRI4
EQI4 $954
line 1194
;1194:			break;
ADDRGP4 $804
JUMPV
LABELV $954
line 1197
;1195:		}
;1196:		// if we are interpolating, we don't need to smooth steps
;1197:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $966
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 64
INDIRI4
NEI4 $966
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $966
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $958
LABELV $966
line 1198
;1198:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 1199
;1199:			break;
ADDRGP4 $804
JUMPV
LABELV $958
line 1202
;1200:		}
;1201:		// check for stepping up before a previous step is completed
;1202:		delta = cg.time - cg.stepTime;
ADDRLP4 52
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1870420
INDIRI4
SUBI4
ASGNI4
line 1203
;1203:		if (delta < STEP_TIME) {
ADDRLP4 52
INDIRI4
CNSTI4 200
GEI4 $969
line 1204
;1204:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 56
ADDRGP4 cg+1870416
INDIRF4
CNSTI4 200
ADDRLP4 52
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 1205
;1205:		} else {
ADDRGP4 $970
JUMPV
LABELV $969
line 1206
;1206:			oldStep = 0;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 1207
;1207:		}
LABELV $970
line 1210
;1208:
;1209:		// add this amount
;1210:		step = 4 * (event - EV_STEP_4 + 1 );
ADDRLP4 60
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 24
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 1211
;1211:		cg.stepChange = oldStep + step;
ADDRGP4 cg+1870416
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1212
;1212:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+1870416
INDIRF4
CNSTF4 1107296256
LEF4 $973
line 1213
;1213:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+1870416
CNSTF4 1107296256
ASGNF4
line 1214
;1214:		}
LABELV $973
line 1215
;1215:		cg.stepTime = cg.time;
ADDRGP4 cg+1870420
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1216
;1216:		break;
ADDRGP4 $804
JUMPV
LABELV $979
line 1220
;1217:	}
;1218:
;1219:	case EV_JUMP_PAD:
;1220:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $980
ADDRGP4 $983
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $980
line 1222
;1221://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;1222:		{
line 1224
;1223:			localEntity_t	*smoke;
;1224:			vec3_t			up = {0, 0, 1};
ADDRLP4 52
ADDRGP4 $984
INDIRB
ASGNB 12
line 1227
;1225:
;1226:
;1227:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 52
ARGP4
CNSTF4 1107296256
ARGF4
ADDRLP4 68
CNSTF4 1065353216
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1148846080
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+956380+1272
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 72
INDIRP4
ASGNP4
line 1234
;1228:						  32, 
;1229:						  1, 1, 1, 0.33f,
;1230:						  1000, 
;1231:						  cg.time, 0,
;1232:						  LEF_PUFF_DONT_SCALE, 
;1233:						  cgs.media.smokePuffShader );
;1234:		}
line 1237
;1235:
;1236:		// boing sound at origin, jump sound on player
;1237:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+956380+2164
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1238
;1238:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $990
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1239
;1239:		break;
ADDRGP4 $804
JUMPV
LABELV $991
line 1242
;1240:
;1241:	case EV_JUMP:
;1242:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $992
ADDRGP4 $995
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $992
line 1243
;1243:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $990
ARGP4
ADDRLP4 56
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1244
;1244:		break;
ADDRGP4 $804
JUMPV
LABELV $996
line 1246
;1245:	case EV_TAUNT:
;1246:		if(cgs.gametype == GT_SINGLE){ break; }
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
NEI4 $997
ADDRGP4 $804
JUMPV
LABELV $997
line 1247
;1247:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1000
ADDRGP4 $1003
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1000
line 1248
;1248:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $1004
ARGP4
ADDRLP4 60
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1249
;1249:		break;
ADDRGP4 $804
JUMPV
LABELV $1005
line 1251
;1250:	case EV_HORN:
;1251:		DEBUGNAME("EV_HORN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1006
ADDRGP4 $1009
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1006
line 1252
;1252:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "sound/vehicle/horn.ogg") );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $1010
ARGP4
ADDRLP4 64
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1253
;1253:		break;
ADDRGP4 $804
JUMPV
LABELV $1011
line 1255
;1254:	case EV_CRASH25:
;1255:		DEBUGNAME("EV_CRASH25");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1012
ADDRGP4 $1015
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1012
line 1256
;1256:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "sound/vehicle/damage25.ogg") );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $1016
ARGP4
ADDRLP4 68
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1257
;1257:		break;
ADDRGP4 $804
JUMPV
LABELV $1017
line 1259
;1258:	case EV_OT1_IMPACT:
;1259:		DEBUGNAME("EV_OT1_IMPACT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1018
ADDRGP4 $1021
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1018
line 1260
;1260:		random_number = rand() % 3 + 1;
ADDRLP4 72
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 72
INDIRI4
CNSTI4 3
MODI4
CNSTI4 1
ADDI4
ASGNI4
line 1261
;1261:		if(random_number == 1){
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $1022
line 1262
;1262:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "sound/objects/basic/impact1") );}
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $1024
ARGP4
ADDRLP4 76
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $1022
line 1263
;1263:		if(random_number == 2){
ADDRLP4 32
INDIRI4
CNSTI4 2
NEI4 $1025
line 1264
;1264:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "sound/objects/basic/impact2") );}
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $1027
ARGP4
ADDRLP4 76
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
LABELV $1025
line 1265
;1265:		if(random_number == 3){
ADDRLP4 32
INDIRI4
CNSTI4 3
NEI4 $804
line 1266
;1266:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "sound/objects/basic/impact3") );}
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $1030
ARGP4
ADDRLP4 76
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1267
;1267:		break;
ADDRGP4 $804
JUMPV
LABELV $1031
line 1269
;1268:	case EV_GRAVITYSOUND:
;1269:		DEBUGNAME("EV_GRAVITYSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1032
ADDRGP4 $1035
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1032
line 1270
;1270:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "sound/gravitygun") );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $1036
ARGP4
ADDRLP4 76
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1271
;1271:		break;
ADDRGP4 $804
JUMPV
LABELV $1037
line 1274
;1272:#ifdef MISSIONPACK
;1273:	case EV_TAUNT_YES:
;1274:		DEBUGNAME("EV_TAUNT_YES");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1038
ADDRGP4 $1041
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1038
line 1275
;1275:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $1042
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1276
;1276:		break;
ADDRGP4 $804
JUMPV
LABELV $1043
line 1278
;1277:	case EV_TAUNT_NO:
;1278:		DEBUGNAME("EV_TAUNT_NO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1044
ADDRGP4 $1047
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1044
line 1279
;1279:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $1048
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1280
;1280:		break;
ADDRGP4 $804
JUMPV
LABELV $1049
line 1282
;1281:	case EV_TAUNT_FOLLOWME:
;1282:		DEBUGNAME("EV_TAUNT_FOLLOWME");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1050
ADDRGP4 $1053
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1050
line 1283
;1283:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $1054
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1284
;1284:		break;
ADDRGP4 $804
JUMPV
LABELV $1055
line 1286
;1285:	case EV_TAUNT_GETFLAG:
;1286:		DEBUGNAME("EV_TAUNT_GETFLAG");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1056
ADDRGP4 $1059
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1056
line 1287
;1287:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $1060
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1288
;1288:		break;
ADDRGP4 $804
JUMPV
LABELV $1061
line 1290
;1289:	case EV_TAUNT_GUARDBASE:
;1290:		DEBUGNAME("EV_TAUNT_GUARDBASE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1062
ADDRGP4 $1065
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1062
line 1291
;1291:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $1066
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1292
;1292:		break;
ADDRGP4 $804
JUMPV
LABELV $1067
line 1294
;1293:	case EV_TAUNT_PATROL:
;1294:		DEBUGNAME("EV_TAUNT_PATROL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1068
ADDRGP4 $1071
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1068
line 1295
;1295:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $1072
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 1296
;1296:		break;
ADDRGP4 $804
JUMPV
LABELV $1073
line 1299
;1297:#endif
;1298:	case EV_WATER_TOUCH:
;1299:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1074
ADDRGP4 $1077
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1074
line 1300
;1300:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2304
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1301
;1301:		break;
ADDRGP4 $804
JUMPV
LABELV $1080
line 1303
;1302:	case EV_WATER_LEAVE:
;1303:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1081
ADDRGP4 $1084
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1081
line 1304
;1304:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2308
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1305
;1305:		break;
ADDRGP4 $804
JUMPV
LABELV $1087
line 1307
;1306:	case EV_WATER_UNDER:
;1307:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1088
ADDRGP4 $1091
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1088
line 1308
;1308:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2312
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1309
;1309:		break;
ADDRGP4 $804
JUMPV
LABELV $1094
line 1311
;1310:	case EV_WATER_CLEAR:
;1311:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1095
ADDRGP4 $1098
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1095
line 1312
;1312:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $1099
ARGP4
ADDRLP4 80
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1313
;1313:		break;
ADDRGP4 $804
JUMPV
LABELV $1100
line 1317
;1314:
;1315:	case EV_SILENT_ITEM_PICKUP:
;1316:	case EV_ITEM_PICKUP:
;1317:		if (event == EV_ITEM_PICKUP) {
ADDRLP4 8
INDIRI4
CNSTI4 19
NEI4 $1101
line 1318
;1318:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1102
ADDRGP4 $1106
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1319
;1319:		} else {
ADDRGP4 $1102
JUMPV
LABELV $1101
line 1320
;1320:			DEBUGNAME("EV_SILENT_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1107
ADDRGP4 $1110
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1107
line 1321
;1321:		}
LABELV $1102
line 1322
;1322:		{
line 1326
;1323:			gitem_t	*item;
;1324:			int		index;
;1325:
;1326:			index = es->eventParm;		// player predicted
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 1328
;1327:
;1328:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 92
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1
LTI4 $1113
ADDRLP4 92
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $1111
LABELV $1113
line 1329
;1329:				break;
ADDRGP4 $804
JUMPV
LABELV $1111
line 1331
;1330:			}
;1331:			item = &bg_itemlist[ index ];
ADDRLP4 88
CNSTI4 56
ADDRLP4 84
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1335
;1332:
;1333:			// powerups and team items will have a separate global sound, this one
;1334:			// will be played at prediction time
;1335:			if ( event == EV_ITEM_PICKUP ) {
ADDRLP4 8
INDIRI4
CNSTI4 19
NEI4 $1114
line 1336
;1336:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
ADDRLP4 96
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 5
EQI4 $1118
ADDRLP4 96
INDIRI4
CNSTI4 8
NEI4 $1116
LABELV $1118
line 1337
;1337:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2524
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1338
;1338:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $1117
JUMPV
LABELV $1116
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $1121
line 1340
;1339:#ifdef MISSIONPACK
;1340:				switch (item->giTag ) {
ADDRLP4 100
ADDRLP4 88
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 10
LTI4 $1122
ADDRLP4 100
INDIRI4
CNSTI4 13
GTI4 $1122
ADDRLP4 100
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1138-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1138
address $1126
address $1129
address $1132
address $1135
code
LABELV $1126
line 1342
;1341:					case PW_SCOUT:
;1342:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2500
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1343
;1343:					break;
ADDRGP4 $1122
JUMPV
LABELV $1129
line 1345
;1344:					case PW_GUARD:
;1345:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2496
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1346
;1346:					break;
ADDRGP4 $1122
JUMPV
LABELV $1132
line 1348
;1347:					case PW_DOUBLER:
;1348:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2492
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1349
;1349:					break;
ADDRGP4 $1122
JUMPV
LABELV $1135
line 1351
;1350:					case PW_AMMOREGEN:
;1351:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2488
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1352
;1352:					break;
line 1355
;1353:				}
;1354:#endif
;1355:			} else {
ADDRGP4 $1122
JUMPV
LABELV $1121
line 1356
;1356:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound_MiTech( item->pickup_sound, qfalse ) );
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 100
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1357
;1357:			}
LABELV $1122
LABELV $1117
line 1358
;1358:			}
LABELV $1114
line 1361
;1359:
;1360:			// show icon and name on status bar
;1361:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $804
line 1362
;1362:				CG_ItemPickup( index );
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 1363
;1363:			}
line 1364
;1364:		}
line 1365
;1365:		break;
ADDRGP4 $804
JUMPV
LABELV $1143
line 1368
;1366:
;1367:	case EV_GLOBAL_ITEM_PICKUP:
;1368:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1144
ADDRGP4 $1147
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1144
line 1369
;1369:		{
line 1373
;1370:			gitem_t	*item;
;1371:			int		index;
;1372:
;1373:			index = es->eventParm;		// player predicted
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 1375
;1374:
;1375:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 92
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1
LTI4 $1150
ADDRLP4 92
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $1148
LABELV $1150
line 1376
;1376:				break;
ADDRGP4 $804
JUMPV
LABELV $1148
line 1378
;1377:			}
;1378:			item = &bg_itemlist[ index ];
ADDRLP4 88
CNSTI4 56
ADDRLP4 84
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1380
;1379:			// powerup pickups are global
;1380:			if( item->pickup_sound ) {
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1151
line 1381
;1381:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound_MiTech( item->pickup_sound, qfalse ) );
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 96
ADDRGP4 trap_S_RegisterSound_MiTech
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1382
;1382:			}
LABELV $1151
line 1385
;1383:
;1384:			// show icon and name on status bar
;1385:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $804
line 1386
;1386:				CG_ItemPickup( index );
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 1387
;1387:			}
line 1388
;1388:		}
line 1389
;1389:		break;
ADDRGP4 $804
JUMPV
LABELV $1157
line 1395
;1390:
;1391:	//
;1392:	// weapon events
;1393:	//
;1394:	case EV_NOAMMO:
;1395:		DEBUGNAME("EV_NOAMMO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1158
ADDRGP4 $1161
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1158
line 1397
;1396://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;1397:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $804
line 1398
;1398:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 1399
;1399:		}
line 1400
;1400:		break;
ADDRGP4 $804
JUMPV
LABELV $1165
line 1402
;1401:	case EV_CHANGE_WEAPON:
;1402:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1166
ADDRGP4 $1169
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1166
line 1403
;1403:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+1828
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1404
;1404:		break;
ADDRGP4 $804
JUMPV
LABELV $1172
line 1406
;1405:	case EV_FIRE_WEAPON:
;1406:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1173
ADDRGP4 $1176
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1173
line 1407
;1407:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 1408
;1408:		break;
ADDRGP4 $804
JUMPV
LABELV $1177
line 1411
;1409:
;1410:	case EV_USE_ITEM0:
;1411:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1178
ADDRGP4 $1181
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1178
line 1412
;1412:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1413
;1413:		break;
ADDRGP4 $804
JUMPV
LABELV $1182
line 1415
;1414:	case EV_USE_ITEM1:
;1415:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1183
ADDRGP4 $1186
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1183
line 1416
;1416:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1417
;1417:		break;
ADDRGP4 $804
JUMPV
LABELV $1187
line 1419
;1418:	case EV_USE_ITEM2:
;1419:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1188
ADDRGP4 $1191
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1188
line 1420
;1420:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1421
;1421:		break;
ADDRGP4 $804
JUMPV
LABELV $1192
line 1423
;1422:	case EV_USE_ITEM3:
;1423:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1193
ADDRGP4 $1196
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1193
line 1424
;1424:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1425
;1425:		break;
ADDRGP4 $804
JUMPV
LABELV $1197
line 1427
;1426:	case EV_USE_ITEM4:
;1427:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1198
ADDRGP4 $1201
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1198
line 1428
;1428:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1429
;1429:		break;
ADDRGP4 $804
JUMPV
LABELV $1202
line 1431
;1430:	case EV_USE_ITEM5:
;1431:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1203
ADDRGP4 $1206
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1203
line 1432
;1432:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1433
;1433:		break;
ADDRGP4 $804
JUMPV
LABELV $1207
line 1435
;1434:	case EV_USE_ITEM6:
;1435:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1208
ADDRGP4 $1211
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1208
line 1436
;1436:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1437
;1437:		break;
ADDRGP4 $804
JUMPV
LABELV $1212
line 1439
;1438:	case EV_USE_ITEM7:
;1439:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1213
ADDRGP4 $1216
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1213
line 1440
;1440:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1441
;1441:		break;
ADDRGP4 $804
JUMPV
LABELV $1217
line 1443
;1442:	case EV_USE_ITEM8:
;1443:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1218
ADDRGP4 $1221
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1218
line 1444
;1444:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1445
;1445:		break;
ADDRGP4 $804
JUMPV
LABELV $1222
line 1447
;1446:	case EV_USE_ITEM9:
;1447:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1223
ADDRGP4 $1226
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1223
line 1448
;1448:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1449
;1449:		break;
ADDRGP4 $804
JUMPV
LABELV $1227
line 1451
;1450:	case EV_USE_ITEM10:
;1451:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1228
ADDRGP4 $1231
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1228
line 1452
;1452:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1453
;1453:		break;
ADDRGP4 $804
JUMPV
LABELV $1232
line 1455
;1454:	case EV_USE_ITEM11:
;1455:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1233
ADDRGP4 $1236
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1233
line 1456
;1456:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1457
;1457:		break;
ADDRGP4 $804
JUMPV
LABELV $1237
line 1459
;1458:	case EV_USE_ITEM12:
;1459:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1238
ADDRGP4 $1241
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1238
line 1460
;1460:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1461
;1461:		break;
ADDRGP4 $804
JUMPV
LABELV $1242
line 1463
;1462:	case EV_USE_ITEM13:
;1463:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1243
ADDRGP4 $1246
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1243
line 1464
;1464:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1465
;1465:		break;
ADDRGP4 $804
JUMPV
LABELV $1247
line 1467
;1466:	case EV_USE_ITEM14:
;1467:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1248
ADDRGP4 $1251
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1248
line 1468
;1468:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 1469
;1469:		break;
ADDRGP4 $804
JUMPV
LABELV $1252
line 1477
;1470:
;1471:	//=================================================================
;1472:
;1473:	//
;1474:	// other events
;1475:	//
;1476:	case EV_PLAYER_TELEPORT_IN:
;1477:		if(cgs.gametype == GT_SINGLE){ break; }
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
NEI4 $1253
ADDRGP4 $804
JUMPV
LABELV $1253
line 1478
;1478:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1256
ADDRGP4 $1259
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1256
line 1479
;1479:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2136
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1480
;1480:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 1481
;1481:		break;
ADDRGP4 $804
JUMPV
LABELV $1262
line 1484
;1482:
;1483:	case EV_PLAYER_TELEPORT_OUT:
;1484:		if(cgs.gametype == GT_SINGLE){ break; }
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
NEI4 $1263
ADDRGP4 $804
JUMPV
LABELV $1263
line 1485
;1485:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1266
ADDRGP4 $1269
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1266
line 1486
;1486:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2140
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1487
;1487:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 1488
;1488:		break;
ADDRGP4 $804
JUMPV
LABELV $1272
line 1491
;1489:
;1490:	case EV_ITEM_POP:
;1491:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1273
ADDRGP4 $1276
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1273
line 1492
;1492:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2148
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1493
;1493:		break;
ADDRGP4 $804
JUMPV
LABELV $1279
line 1495
;1494:	case EV_ITEM_RESPAWN:
;1495:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1280
ADDRGP4 $1283
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1280
line 1496
;1496:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1497
;1497:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2148
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1498
;1498:		break;
ADDRGP4 $804
JUMPV
LABELV $1287
line 1501
;1499:
;1500:	case EV_GRENADE_BOUNCE:
;1501:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1288
ADDRGP4 $1291
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1288
line 1502
;1502:		if ( rand() & 1 ) {
ADDRLP4 84
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1292
line 1503
;1503:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2528
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1504
;1504:		} else {
ADDRGP4 $804
JUMPV
LABELV $1292
line 1505
;1505:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2532
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1506
;1506:		}
line 1507
;1507:		break;
ADDRGP4 $804
JUMPV
LABELV $1298
line 1511
;1508:
;1509:
;1510:	case EV_PROXIMITY_MINE_STICK:
;1511:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1299
ADDRGP4 $1302
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1299
line 1512
;1512:		if( es->eventParm & SURF_FLESH ) {
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1303
line 1513
;1513:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2536
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1514
;1514:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
ADDRGP4 $804
JUMPV
LABELV $1303
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1307
line 1515
;1515:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2540
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1516
;1516:		} else {
ADDRGP4 $804
JUMPV
LABELV $1307
line 1517
;1517:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2544
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1518
;1518:		}
line 1519
;1519:		break;
ADDRGP4 $804
JUMPV
LABELV $1313
line 1522
;1520:
;1521:	case EV_PROXIMITY_MINE_TRIGGER:
;1522:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1314
ADDRGP4 $1317
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1314
line 1523
;1523:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2548
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1524
;1524:		break;
ADDRGP4 $804
JUMPV
LABELV $1320
line 1526
;1525:	case EV_KAMIKAZE:
;1526:		DEBUGNAME("EV_KAMIKAZE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1321
ADDRGP4 $1324
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1321
line 1527
;1527:		CG_KamikazeEffect( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRGP4 CG_KamikazeEffect
CALLV
pop
line 1528
;1528:		break;
ADDRGP4 $804
JUMPV
LABELV $1325
line 1530
;1529:	case EV_OBELISKEXPLODE:
;1530:		DEBUGNAME("EV_OBELISKEXPLODE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1326
ADDRGP4 $1329
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1326
line 1531
;1531:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ObeliskExplode
CALLV
pop
line 1532
;1532:		break;
ADDRGP4 $804
JUMPV
LABELV $1330
line 1534
;1533:	case EV_OBELISKPAIN:
;1534:		DEBUGNAME("EV_OBELISKPAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1331
ADDRGP4 $1334
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1331
line 1535
;1535:		CG_ObeliskPain( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRGP4 CG_ObeliskPain
CALLV
pop
line 1536
;1536:		break;
ADDRGP4 $804
JUMPV
LABELV $1335
line 1538
;1537:	case EV_INVUL_IMPACT:
;1538:		DEBUGNAME("EV_INVUL_IMPACT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1336
ADDRGP4 $1339
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1336
line 1539
;1539:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 CG_InvulnerabilityImpact
CALLV
pop
line 1540
;1540:		break;
ADDRGP4 $804
JUMPV
LABELV $1340
line 1542
;1541:        case EV_JUICED:
;1542:		DEBUGNAME("EV_JUICED");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1341
ADDRGP4 $1344
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1341
line 1543
;1543:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRGP4 CG_InvulnerabilityJuiced
CALLV
pop
line 1544
;1544:		break;
ADDRGP4 $804
JUMPV
LABELV $1345
line 1546
;1545:	case EV_LIGHTNINGBOLT:
;1546:		DEBUGNAME("EV_LIGHTNINGBOLT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1346
ADDRGP4 $1349
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1346
line 1547
;1547:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CG_LightningBoltBeam
CALLV
pop
line 1548
;1548:		break;
ADDRGP4 $804
JUMPV
LABELV $1350
line 1550
;1549:	case EV_SCOREPLUM:
;1550:		if(cgs.gametype == GT_SINGLE){ break; }
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
NEI4 $1351
ADDRGP4 $804
JUMPV
LABELV $1351
line 1551
;1551:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1354
ADDRGP4 $1357
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1354
line 1552
;1552:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time, cent->currentState.weapon );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 1553
;1553:		break;
ADDRGP4 $804
JUMPV
LABELV $1358
line 1559
;1554:
;1555:	//
;1556:	// missile impacts
;1557:	//
;1558:	case EV_MISSILE_HIT:
;1559:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1359
ADDRGP4 $1362
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1359
line 1560
;1560:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1561
;1561:		CG_MissileHitPlayer( es->generic3, position, dir, es->otherEntityNum );
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 1562
;1562:		break;
ADDRGP4 $804
JUMPV
LABELV $1363
line 1565
;1563:
;1564:	case EV_MISSILE_MISS:
;1565:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1364
ADDRGP4 $1367
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1364
line 1566
;1566:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1567
;1567:		CG_MissileHitWall( es->generic3, 0, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1568
;1568:		break;
ADDRGP4 $804
JUMPV
LABELV $1368
line 1571
;1569:
;1570:	case EV_MISSILE_MISS_METAL:
;1571:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1369
ADDRGP4 $1372
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1369
line 1572
;1572:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1573
;1573:		CG_MissileHitWall( es->generic3, 0, position, dir, IMPACTSOUND_METAL );
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1574
;1574:		break;
ADDRGP4 $804
JUMPV
LABELV $1373
line 1577
;1575:
;1576:	case EV_RAILTRAIL:
;1577:		DEBUGNAME("EV_RAILTRAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1374
ADDRGP4 $1377
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1374
line 1578
;1578:		cent->currentState.generic3 = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 7
ASGNI4
line 1581
;1579://unlagged - attack prediction #2
;1580:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1581:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+1868928+140
INDIRI4
NEI4 $1378
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRGP4 cgs+958932
INDIRI4
ADDRLP4 108
INDIRI4
EQI4 $1378
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 108
INDIRI4
NEI4 $1385
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 108
INDIRI4
EQI4 $1378
LABELV $1385
line 1582
;1582:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 16) ) {
line 1585
;1583:			// do nothing, because it was already predicted
;1584:			//Com_Printf("Ignoring rail trail event\n");
;1585:		}
ADDRGP4 $804
JUMPV
LABELV $1378
line 1586
;1586:		else {
line 1587
;1587:                        if(es->clientNum == cg.snap->ps.clientNum && !cg.renderingThirdPerson)
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1386
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
NEI4 $1386
line 1588
;1588:                        {
line 1589
;1589:                           if(cg_drawGun.integer == 2)
ADDRGP4 cg_drawGun+12
INDIRI4
CNSTI4 2
NEI4 $1390
line 1590
;1590:				VectorMA(es->origin2, 8, cg.refdef.viewaxis[1], es->origin2);
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+1870616+36+12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 116
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+1870616+36+12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 120
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+1870616+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1391
JUMPV
LABELV $1390
line 1591
;1591:                           else if(cg_drawGun.integer == 3)
ADDRGP4 cg_drawGun+12
INDIRI4
CNSTI4 3
NEI4 $1404
line 1592
;1592:				VectorMA(es->origin2, 4, cg.refdef.viewaxis[1], es->origin2);
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 cg+1870616+36+12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 cg+1870616+36+12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 132
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 cg+1870616+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1404
LABELV $1391
line 1593
;1593:                        }
LABELV $1386
line 1597
;1594:
;1595:
;1596:			// draw a rail trail, because it wasn't predicted
;1597:			CG_RailTrail( ci, es->origin2, es->pos.trBase );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CG_RailTrail
CALLV
pop
line 1600
;1598:
;1599:			// if the end was on a nomark surface, don't make an explosion
;1600:			if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 255
EQI4 $804
line 1601
;1601:				ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1602
;1602:				CG_MissileHitWall( es->generic3, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 1603
;1603:			}
line 1605
;1604:			//Com_Printf("Non-predicted rail trail\n");
;1605:		}
line 1607
;1606://unlagged - attack prediction #2
;1607:		break;
ADDRGP4 $804
JUMPV
LABELV $1420
line 1610
;1608:
;1609:	case EV_BULLET_HIT_WALL:
;1610:		DEBUGNAME("EV_BULLET_HIT_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1421
ADDRGP4 $1424
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1421
line 1613
;1611://unlagged - attack prediction #2
;1612:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1613:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+1868928+140
INDIRI4
NEI4 $1425
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRGP4 cgs+958932
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $1425
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 112
INDIRI4
NEI4 $1432
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 112
INDIRI4
EQI4 $1425
LABELV $1432
line 1614
;1614:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1617
;1615:			// do nothing, because it was already predicted
;1616:			//Com_Printf("Ignoring bullet event\n");
;1617:		}
ADDRGP4 $804
JUMPV
LABELV $1425
line 1618
;1618:		else {
line 1620
;1619:			// do the bullet, because it wasn't predicted
;1620:			ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 1621
;1621:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4094
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 1623
;1622:			//Com_Printf("Non-predicted bullet\n");
;1623:		}
line 1625
;1624://unlagged - attack prediction #2
;1625:		break;
ADDRGP4 $804
JUMPV
LABELV $1433
line 1628
;1626:
;1627:	case EV_BULLET_HIT_FLESH:
;1628:		DEBUGNAME("EV_BULLET_HIT_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1434
ADDRGP4 $1437
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1434
line 1631
;1629://unlagged - attack prediction #2
;1630:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1631:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRGP4 cg+1868928+140
INDIRI4
NEI4 $1438
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRGP4 cgs+958932
INDIRI4
ADDRLP4 116
INDIRI4
EQI4 $1438
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 116
INDIRI4
NEI4 $1445
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 116
INDIRI4
EQI4 $1438
LABELV $1445
line 1632
;1632:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1635
;1633:			// do nothing, because it was already predicted
;1634:			//Com_Printf("Ignoring bullet event\n");
;1635:		}
ADDRGP4 $804
JUMPV
LABELV $1438
line 1636
;1636:		else {
line 1638
;1637:			// do the bullet, because it wasn't predicted
;1638:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 1640
;1639:			//Com_Printf("Non-predicted bullet\n");
;1640:		}
line 1642
;1641://unlagged - attack prediction #2
;1642:		break;
ADDRGP4 $804
JUMPV
LABELV $1446
line 1645
;1643:
;1644:	case EV_SHOTGUN:
;1645:		DEBUGNAME("EV_SHOTGUN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1447
ADDRGP4 $1450
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1447
line 1648
;1646://unlagged - attack prediction #2
;1647:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1648:		if ( es->otherEntityNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ADDRGP4 cg+1868928+140
INDIRI4
NEI4 $1451
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRGP4 cgs+958932
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $1451
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 120
INDIRI4
NEI4 $1458
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 120
INDIRI4
EQI4 $1451
LABELV $1458
line 1649
;1649:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 4) ) {
line 1652
;1650:			// do nothing, because it was already predicted
;1651:			//Com_Printf("Ignoring shotgun event\n");
;1652:		}
ADDRGP4 $804
JUMPV
LABELV $1451
line 1653
;1653:		else {
line 1655
;1654:			// do the shotgun pattern, because it wasn't predicted
;1655:			CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1657
;1656:			//Com_Printf("Non-predicted shotgun pattern\n");
;1657:		}
line 1659
;1658://unlagged - attack prediction #2
;1659:		break;
ADDRGP4 $804
JUMPV
LABELV $1459
line 1662
;1660:
;1661:	case EV_GENERAL_SOUND:
;1662:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1460
ADDRGP4 $1463
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1460
line 1663
;1663:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+359024
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1464
line 1664
;1664:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+359024
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1665
;1665:		} else {
ADDRGP4 $804
JUMPV
LABELV $1464
line 1666
;1666:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 4128
ADDI4
ARGI4
ADDRLP4 124
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 124
INDIRP4
ASGNP4
line 1667
;1667:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1668
;1668:		}
line 1669
;1669:		break;
ADDRGP4 $804
JUMPV
LABELV $1468
line 1672
;1670:
;1671:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1672:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1469
ADDRGP4 $1472
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1469
line 1673
;1673:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+359024
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1473
line 1674
;1674:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+359024
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1675
;1675:		} else {
ADDRGP4 $804
JUMPV
LABELV $1473
line 1676
;1676:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 4128
ADDI4
ARGI4
ADDRLP4 124
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 124
INDIRP4
ASGNP4
line 1677
;1677:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1678
;1678:		}
line 1679
;1679:		break;
ADDRGP4 $804
JUMPV
LABELV $1479
line 1682
;1680:
;1681:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1682:		{
line 1683
;1683:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1480
ADDRGP4 $1483
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1480
line 1684
;1684:			switch( es->eventParm ) {
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
LTI4 $804
ADDRLP4 124
INDIRI4
CNSTI4 13
GTI4 $804
ADDRLP4 124
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1625
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1625
address $1487
address $1497
address $1507
address $1519
address $1531
address $1561
address $1591
address $1599
address $1607
address $1610
address $1613
address $1616
address $1619
address $1622
code
LABELV $1487
line 1686
;1685:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1686:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1488
line 1687
;1687:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+956380+2352
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $804
JUMPV
LABELV $1488
line 1689
;1688:					else
;1689:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+956380+2356
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1690
;1690:					break;
ADDRGP4 $804
JUMPV
LABELV $1497
line 1692
;1691:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1692:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1498
line 1693
;1693:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+956380+2352
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $804
JUMPV
LABELV $1498
line 1695
;1694:					else
;1695:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+956380+2356
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1696
;1696:					break;
ADDRGP4 $804
JUMPV
LABELV $1507
line 1698
;1697:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1698:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1508
line 1699
;1699:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+956380+2360
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $1509
JUMPV
LABELV $1508
line 1701
;1700:					else
;1701:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+956380+2364
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $1509
line 1703
;1702:					//
;1703:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+956380+2380
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1704
;1704:					break;
ADDRGP4 $804
JUMPV
LABELV $1519
line 1706
;1705:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1706:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1520
line 1707
;1707:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+956380+2360
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $1521
JUMPV
LABELV $1520
line 1709
;1708:					else
;1709:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+956380+2364
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $1521
line 1711
;1710:					//
;1711:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+956380+2376
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1712
;1712:					break;
ADDRGP4 $804
JUMPV
LABELV $1531
line 1716
;1713:
;1714:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1715:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1716:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $1536
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
EQI4 $1532
LABELV $1536
line 1717
;1717:					}
ADDRGP4 $804
JUMPV
LABELV $1532
line 1718
;1718:					else {
line 1719
;1719:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1537
line 1721
;1720:
;1721:							if (cgs.gametype == GT_1FCTF) 
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $1542
line 1722
;1722:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
ADDRGP4 cgs+956380+2400
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $804
JUMPV
LABELV $1542
line 1725
;1723:							else
;1724:
;1725:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+956380+2388
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1726
;1726:						}
ADDRGP4 $804
JUMPV
LABELV $1537
line 1727
;1727:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $804
line 1729
;1728:
;1729:							if (cgs.gametype == GT_1FCTF)
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $1554
line 1730
;1730:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
ADDRGP4 cgs+956380+2392
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $804
JUMPV
LABELV $1554
line 1733
;1731:							else
;1732:
;1733: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+956380+2396
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1734
;1734:						}
line 1735
;1735:					}
line 1736
;1736:					break;
ADDRGP4 $804
JUMPV
LABELV $1561
line 1739
;1737:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1738:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1739:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRLP4 136
INDIRI4
NEI4 $1566
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 136
INDIRI4
EQI4 $1562
LABELV $1566
line 1740
;1740:					}
ADDRGP4 $804
JUMPV
LABELV $1562
line 1741
;1741:					else {
line 1742
;1742:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1567
line 1744
;1743:
;1744:							if (cgs.gametype == GT_1FCTF)
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $1572
line 1745
;1745:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
ADDRGP4 cgs+956380+2400
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $804
JUMPV
LABELV $1572
line 1748
;1746:							else
;1747:
;1748:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+956380+2388
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1749
;1749:						}
ADDRGP4 $804
JUMPV
LABELV $1567
line 1750
;1750:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $804
line 1752
;1751:
;1752:							if (cgs.gametype == GT_1FCTF)
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $1584
line 1753
;1753:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
ADDRGP4 cgs+956380+2392
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $804
JUMPV
LABELV $1584
line 1756
;1754:							else
;1755:
;1756:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+956380+2396
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1757
;1757:						}
line 1758
;1758:					}
line 1759
;1759:					break;
ADDRGP4 $804
JUMPV
LABELV $1591
line 1761
;1760:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1761:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $804
line 1762
;1762:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+956380+2408
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1763
;1763:					}
line 1764
;1764:					break;
ADDRGP4 $804
JUMPV
LABELV $1599
line 1766
;1765:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1766:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1944
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $804
line 1767
;1767:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+956380+2408
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1768
;1768:					}
line 1769
;1769:					break;
ADDRGP4 $804
JUMPV
LABELV $1607
line 1772
;1770:
;1771:				case GTS_REDTEAM_SCORED:
;1772:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+956380+2332
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1773
;1773:					break;
ADDRGP4 $804
JUMPV
LABELV $1610
line 1775
;1774:				case GTS_BLUETEAM_SCORED:
;1775:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+956380+2336
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1776
;1776:					break;
ADDRGP4 $804
JUMPV
LABELV $1613
line 1778
;1777:				case GTS_REDTEAM_TOOK_LEAD:
;1778:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+956380+2340
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1779
;1779:					break;
ADDRGP4 $804
JUMPV
LABELV $1616
line 1781
;1780:				case GTS_BLUETEAM_TOOK_LEAD:
;1781:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+956380+2344
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1782
;1782:					break;
ADDRGP4 $804
JUMPV
LABELV $1619
line 1784
;1783:				case GTS_TEAMS_ARE_TIED:
;1784:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+956380+2348
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1785
;1785:					break;
ADDRGP4 $804
JUMPV
LABELV $1622
line 1787
;1786:				case GTS_KAMIKAZE:
;1787:					trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
ADDRGP4 cgs+956380+2068
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1788
;1788:					break;
line 1790
;1789:				default:
;1790:					break;
line 1792
;1791:			}
;1792:			break;
ADDRGP4 $804
JUMPV
LABELV $1626
line 1798
;1793:		}
;1794:
;1795:	case EV_PAIN:
;1796:		// local player sounds are triggered in CG_CheckLocalSounds,
;1797:		// so ignore events on the player
;1798:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1627
ADDRGP4 $1630
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1627
line 1799
;1799:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $804
line 1800
;1800:			CG_PainEvent( cent, es->eventParm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 1801
;1801:		}
line 1802
;1802:		break;
ADDRGP4 $804
JUMPV
LABELV $1634
line 1807
;1803:		
;1804:	case EV_PAINVEHICLE:
;1805:		// local player sounds are triggered in CG_CheckLocalSounds,
;1806:		// so ignore events on the player
;1807:		DEBUGNAME("EV_PAINVEHICLE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1635
ADDRGP4 $1638
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1635
line 1808
;1808:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $804
line 1809
;1809:			CG_PainVehicleEvent( cent, es->eventParm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainVehicleEvent
CALLV
pop
line 1810
;1810:		}
line 1811
;1811:		break;
ADDRGP4 $804
JUMPV
LABELV $1642
line 1816
;1812:
;1813:	case EV_DEATH1:
;1814:	case EV_DEATH2:
;1815:	case EV_DEATH3:
;1816:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1643
ADDRGP4 $1646
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1643
line 1818
;1817:
;1818:		if (CG_WaterLevel(cent) >= 1) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 CG_WaterLevel
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 1
LTI4 $1647
line 1819
;1819:			trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*drown.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $1649
ARGP4
ADDRLP4 128
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 128
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1820
;1820:		} else {
ADDRGP4 $804
JUMPV
LABELV $1647
line 1821
;1821:			trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, va("*death%i.wav", event - EV_DEATH1 + 1)));
ADDRGP4 $1650
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 58
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 132
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1822
;1822:		}
line 1824
;1823:
;1824:		break;
ADDRGP4 $804
JUMPV
LABELV $1651
line 1828
;1825:
;1826:
;1827:	case EV_OBITUARY:
;1828:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1652
ADDRGP4 $1655
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1652
line 1829
;1829:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1830
;1830:		break;
ADDRGP4 $804
JUMPV
LABELV $1656
line 1836
;1831:
;1832:	//
;1833:	// powerup events
;1834:	//
;1835:	case EV_POWERUP_QUAD:
;1836:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1657
ADDRGP4 $1660
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1657
line 1837
;1837:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1661
line 1838
;1838:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+1952696
CNSTI4 1
ASGNI4
line 1839
;1839:			cg.powerupTime = cg.time;
ADDRGP4 cg+1952700
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1840
;1840:		}
LABELV $1661
line 1841
;1841:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+956380+1820
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1842
;1842:		break;
ADDRGP4 $804
JUMPV
LABELV $1669
line 1844
;1843:	case EV_POWERUP_BATTLESUIT:
;1844:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1670
ADDRGP4 $1673
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1670
line 1845
;1845:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1674
line 1846
;1846:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+1952696
CNSTI4 2
ASGNI4
line 1847
;1847:			cg.powerupTime = cg.time;
ADDRGP4 cg+1952700
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1848
;1848:		}
LABELV $1674
line 1849
;1849:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+956380+2520
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1850
;1850:		break;
ADDRGP4 $804
JUMPV
LABELV $1682
line 1852
;1851:	case EV_POWERUP_REGEN:
;1852:		DEBUGNAME("EV_POWERUP_REGEN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1683
ADDRGP4 $1686
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1683
line 1853
;1853:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1687
line 1854
;1854:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+1952696
CNSTI4 5
ASGNI4
line 1855
;1855:			cg.powerupTime = cg.time;
ADDRGP4 cg+1952700
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1856
;1856:		}
LABELV $1687
line 1857
;1857:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+956380+2516
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1858
;1858:		break;
ADDRGP4 $804
JUMPV
LABELV $1695
line 1861
;1859:
;1860:	case EV_GIB_PLAYER:
;1861:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1696
ADDRGP4 $1699
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1696
line 1865
;1862:		// don't play gib sound when using the kamikaze because it interferes
;1863:		// with the kamikaze sound, downside is that the gib sound will also
;1864:		// not be played when someone is gibbed while just carrying the kamikaze
;1865:		if ( !(es->eFlags & EF_KAMIKAZE) ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $1700
line 1866
;1866:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+956380+2120
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1867
;1867:		}
LABELV $1700
line 1868
;1868:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1869
;1869:		break;
ADDRGP4 $804
JUMPV
LABELV $1704
line 1872
;1870:
;1871:	case EV_STOPLOOPINGSOUND:
;1872:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1705
ADDRGP4 $1708
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1705
line 1873
;1873:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1874
;1874:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 0
ASGNI4
line 1875
;1875:		break;
ADDRGP4 $804
JUMPV
LABELV $1709
line 1878
;1876:
;1877:	case EV_DEBUG_LINE:
;1878:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1710
ADDRGP4 $1713
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1710
line 1879
;1879:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1880
;1880:		break;
ADDRGP4 $804
JUMPV
LABELV $1714
line 1883
;1881:
;1882:	case EV_EMIT_DEBRIS_LIGHT:
;1883:		DEBUGNAME("EV_EMIT_DEBRIS_LIGHT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1715
ADDRGP4 $1718
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1715
line 1884
;1884:		CG_ShowDebris( cent->lerpOrigin, es->eventParm, EV_EMIT_DEBRIS_LIGHT );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
CNSTI4 84
ARGI4
ADDRGP4 CG_ShowDebris
CALLI4
pop
line 1885
;1885:		break;
ADDRGP4 $804
JUMPV
LABELV $1719
line 1888
;1886:
;1887:	case EV_EMIT_DEBRIS_DARK:
;1888:		DEBUGNAME("EV_EMIT_DEBRIS_DARK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1720
ADDRGP4 $1723
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1720
line 1889
;1889:		CG_ShowDebris( cent->lerpOrigin, es->eventParm, EV_EMIT_DEBRIS_DARK );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
CNSTI4 85
ARGI4
ADDRGP4 CG_ShowDebris
CALLI4
pop
line 1890
;1890:		break;
ADDRGP4 $804
JUMPV
LABELV $1724
line 1893
;1891:
;1892:	case EV_EMIT_DEBRIS_LIGHT_LARGE:
;1893:		DEBUGNAME("EV_EMIT_DEBRIS_LIGHT_LARGE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1725
ADDRGP4 $1728
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1725
line 1894
;1894:		CG_ShowDebris( cent->lerpOrigin, es->eventParm, EV_EMIT_DEBRIS_LIGHT_LARGE );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
CNSTI4 86
ARGI4
ADDRGP4 CG_ShowDebris
CALLI4
pop
line 1895
;1895:		break;
ADDRGP4 $804
JUMPV
LABELV $1729
line 1898
;1896:
;1897:	case EV_EMIT_DEBRIS_DARK_LARGE:
;1898:		DEBUGNAME("EV_EMIT_DEBRIS_DARK_LARGE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1730
ADDRGP4 $1733
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1730
line 1899
;1899:		CG_ShowDebris( cent->lerpOrigin, es->eventParm, EV_EMIT_DEBRIS_DARK_LARGE );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
CNSTI4 87
ARGI4
ADDRGP4 CG_ShowDebris
CALLI4
pop
line 1900
;1900:		break;
ADDRGP4 $804
JUMPV
LABELV $1734
line 1903
;1901:
;1902:	case EV_EMIT_DEBRIS_WOOD:
;1903:		DEBUGNAME("EV_EMIT_DEBRIS_WOOD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1735
ADDRGP4 $1738
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1735
line 1904
;1904:		CG_ShowDebris( cent->lerpOrigin, es->eventParm, EV_EMIT_DEBRIS_WOOD );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
CNSTI4 88
ARGI4
ADDRGP4 CG_ShowDebris
CALLI4
pop
line 1905
;1905:		break;
ADDRGP4 $804
JUMPV
LABELV $1739
line 1908
;1906:
;1907:	case EV_EMIT_DEBRIS_FLESH:
;1908:		DEBUGNAME("EV_EMIT_DEBRIS_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1740
ADDRGP4 $1743
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1740
line 1909
;1909:		CG_ShowDebris( cent->lerpOrigin, es->eventParm, EV_EMIT_DEBRIS_FLESH );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
CNSTI4 89
ARGI4
ADDRGP4 CG_ShowDebris
CALLI4
pop
line 1910
;1910:		break;
ADDRGP4 $804
JUMPV
LABELV $1744
line 1913
;1911:
;1912:	case EV_EMIT_DEBRIS_GLASS:
;1913:		DEBUGNAME("EV_EMIT_DEBRIS_GLASS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1745
ADDRGP4 $1748
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1745
line 1914
;1914:		CG_ShowDebris( cent->lerpOrigin, es->eventParm, EV_EMIT_DEBRIS_GLASS );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
CNSTI4 90
ARGI4
ADDRGP4 CG_ShowDebris
CALLI4
pop
line 1915
;1915:		break;
ADDRGP4 $804
JUMPV
LABELV $1749
line 1918
;1916:		
;1917:	case EV_EMIT_DEBRIS_STONE:
;1918:		DEBUGNAME("EV_EMIT_DEBRIS_STONE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1750
ADDRGP4 $1753
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1750
line 1919
;1919:		CG_ShowDebris( cent->lerpOrigin, es->eventParm, EV_EMIT_DEBRIS_STONE );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
CNSTI4 91
ARGI4
ADDRGP4 CG_ShowDebris
CALLI4
pop
line 1920
;1920:		break;	
ADDRGP4 $804
JUMPV
LABELV $1754
line 1923
;1921:
;1922:	case EV_EARTHQUAKE:
;1923:		DEBUGNAME("EV_EARTHQUAKE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1755
ADDRGP4 $1758
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1755
line 1924
;1924:		CG_StartEarthquake((es->eventParm & 0x0F) + 1, ((1 + ((es->eventParm & 0xF0) >> 4)) * 2000) + 1000);
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 132
CNSTI4 2000
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 128
INDIRI4
CNSTI4 240
BANDI4
CNSTI4 4
RSHI4
MULI4
ADDRLP4 132
INDIRI4
ADDI4
CNSTI4 1000
ADDI4
ARGI4
ADDRGP4 CG_StartEarthquake
CALLI4
pop
line 1925
;1925:		break;
ADDRGP4 $804
JUMPV
LABELV $1759
line 1928
;1926:
;1927:	case EV_EXPLOSION:
;1928:		DEBUGNAME("EV_EXPLOSION");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1760
ADDRGP4 $1763
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1760
line 1931
;1929:		
;1930:		// show plume (if enabled)
;1931:		if ( cg_oldRocket.integer == 0 ) {
ADDRGP4 cg_oldRocket+12
INDIRI4
CNSTI4 0
NEI4 $1764
line 1932
;1932:			dir[0] = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1933
;1933:			dir[1] = 0;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1934
;1934:			dir[2] = 25;
ADDRLP4 16+8
CNSTF4 1103626240
ASGNF4
line 1935
;1935:			CG_ParticleExplosion( "explode1", cent->lerpOrigin, dir, 1400, 20, 30 );
ADDRGP4 $1769
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1400
ARGI4
CNSTI4 20
ARGI4
CNSTI4 30
ARGI4
ADDRGP4 CG_ParticleExplosion
CALLV
pop
line 1936
;1936:		}
LABELV $1764
line 1939
;1937:		
;1938:		// show explosion
;1939:		dir[0] = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1940
;1940:		dir[1] = 0;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1941
;1941:		dir[2] = 0;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1942
;1942:		CG_MakeExplosion( cent->lerpOrigin, dir, cgs.media.dishFlashModel, cgs.media.rocketExplosionShader, 1000, qtrue );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 cgs+956380+1648
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1668
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_MakeExplosion
CALLP4
pop
line 1943
;1943:		break;
ADDRGP4 $804
JUMPV
LABELV $1776
line 1946
;1944:	
;1945:	case EV_SMOKEPUFF:
;1946:		DEBUGNAME("EV_SMOKEPUFF");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1777
ADDRGP4 $1780
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1777
line 1949
;1947:
;1948:		//es->constantLight is used to specify color of the smoke puff
;1949:		r = es->constantLight & 255;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 1950
;1950:		g = (es->constantLight >> 8) & 255;
ADDRLP4 41
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 1951
;1951:		b = (es->constantLight >> 16) & 255;
ADDRLP4 42
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 1954
;1952:
;1953:		//es->generic1 is used to specify movement speed of the smokepuff
;1954:		VectorSet(dir, es->angles[0] * es->generic1, es->angles[1] * es->generic1, es->angles[2] * es->generic1);
ADDRLP4 140
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ADDRLP4 140
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
ADDRLP4 140
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1955
;1955:		CG_SmokePuff(cent->lerpOrigin, dir, es->otherEntityNum, r / 255, g / 255, b / 255, 0.33f, es->eventParm * 1000, cg.time, 0, 0, cgs.media.smokePuffShader);
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 152
CNSTI4 255
ASGNI4
ADDRLP4 40
INDIRU1
CVUI4 1
ADDRLP4 152
INDIRI4
DIVI4
CVIF4 4
ARGF4
ADDRLP4 41
INDIRU1
CVUI4 1
ADDRLP4 152
INDIRI4
DIVI4
CVIF4 4
ARGF4
ADDRLP4 42
INDIRU1
CVUI4 1
ADDRLP4 152
INDIRI4
DIVI4
CVIF4 4
ARGF4
CNSTF4 1051260355
ARGF4
CNSTI4 1000
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 156
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRLP4 156
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1272
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 1956
;1956:		break;
ADDRGP4 $804
JUMPV
LABELV $1786
line 1959
;1957:		
;1958:	case EV_WATERPUFF:
;1959:		DEBUGNAME("EV_WATERPUFF");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1787
ADDRGP4 $1790
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1787
line 1962
;1960:		
;1961:		//es->generic1 is used to specify movement speed of the smokepuff
;1962:		CG_SmokePuff(cent->lerpOrigin, dir, es->otherEntityNum, 1.0, 1.0, 1.0, 1.00f, es->eventParm * 2000, cg.time, 0, 0, cgs.media.lsplShader);
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 164
CNSTF4 1065353216
ASGNF4
ADDRLP4 164
INDIRF4
ARGF4
ADDRLP4 164
INDIRF4
ARGF4
ADDRLP4 164
INDIRF4
ARGF4
ADDRLP4 164
INDIRF4
ARGF4
CNSTI4 2000
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 168
INDIRI4
ARGI4
ADDRLP4 168
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1328
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 1963
;1963:		CG_SmokePuff(cent->lerpOrigin, dir, es->otherEntityNum*0.80, 1.0, 1.0, 1.0, 1.00f, es->eventParm * 1500, cg.time, 0, 0, cgs.media.lsplShader);
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1061997773
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 176
CNSTF4 1065353216
ASGNF4
ADDRLP4 176
INDIRF4
ARGF4
ADDRLP4 176
INDIRF4
ARGF4
ADDRLP4 176
INDIRF4
ARGF4
ADDRLP4 176
INDIRF4
ARGF4
CNSTI4 1500
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1328
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 1964
;1964:		CG_SmokePuff(cent->lerpOrigin, dir, es->otherEntityNum*0.60, 1.0, 1.0, 1.0, 1.00f, es->eventParm * 1000, cg.time, 0, 0, cgs.media.lsplShader);
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1058642330
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 188
CNSTF4 1065353216
ASGNF4
ADDRLP4 188
INDIRF4
ARGF4
ADDRLP4 188
INDIRF4
ARGF4
ADDRLP4 188
INDIRF4
ARGF4
ADDRLP4 188
INDIRF4
ARGF4
CNSTI4 1000
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 192
CNSTI4 0
ASGNI4
ADDRLP4 192
INDIRI4
ARGI4
ADDRLP4 192
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1328
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 1965
;1965:		CG_SmokePuff(cent->lerpOrigin, dir, es->otherEntityNum*0.40, 1.0, 1.0, 1.0, 1.00f, es->eventParm * 750, cg.time, 0, 0, cgs.media.lsplShader);
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1053609165
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 200
CNSTF4 1065353216
ASGNF4
ADDRLP4 200
INDIRF4
ARGF4
ADDRLP4 200
INDIRF4
ARGF4
ADDRLP4 200
INDIRF4
ARGF4
ADDRLP4 200
INDIRF4
ARGF4
CNSTI4 750
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1328
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 1966
;1966:		CG_SmokePuff(cent->lerpOrigin, dir, es->otherEntityNum*0.20, 1.0, 1.0, 1.0, 1.00f, es->eventParm * 500, cg.time, 0, 0, cgs.media.lsplShader);
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1045220557
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 212
CNSTF4 1065353216
ASGNF4
ADDRLP4 212
INDIRF4
ARGF4
ADDRLP4 212
INDIRF4
ARGF4
ADDRLP4 212
INDIRF4
ARGF4
ADDRLP4 212
INDIRF4
ARGF4
CNSTI4 500
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 216
CNSTI4 0
ASGNI4
ADDRLP4 216
INDIRI4
ARGI4
ADDRLP4 216
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1328
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 1967
;1967:		CG_SmokePuff(cent->lerpOrigin, dir, es->otherEntityNum*0.10, 1.0, 1.0, 1.0, 1.00f, es->eventParm * 250, cg.time, 0, 0, cgs.media.lsplShader);
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1036831949
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 224
CNSTF4 1065353216
ASGNF4
ADDRLP4 224
INDIRF4
ARGF4
ADDRLP4 224
INDIRF4
ARGF4
ADDRLP4 224
INDIRF4
ARGF4
ADDRLP4 224
INDIRF4
ARGF4
CNSTI4 250
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRLP4 228
INDIRI4
ARGI4
ADDRLP4 228
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1328
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 1968
;1968:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+956380+2304
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1969
;1969:		break;
ADDRGP4 $804
JUMPV
LABELV $1811
line 1972
;1970:
;1971:	case EV_PARTICLES_GRAVITY:
;1972:		DEBUGNAME("EV_PARTICLES_GRAVITY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1812
ADDRGP4 $1815
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1812
line 1973
;1973:		CG_ParticlesFromEntityState( cent->lerpOrigin, PT_GRAVITY, es );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ParticlesFromEntityState
CALLI4
pop
line 1974
;1974:		break;
ADDRGP4 $804
JUMPV
LABELV $1816
line 1977
;1975:
;1976:	case EV_PARTICLES_LINEAR:
;1977:		DEBUGNAME("EV_PARTICLES_LINEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1817
ADDRGP4 $1820
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1817
line 1978
;1978:		CG_ParticlesFromEntityState( cent->lerpOrigin, PT_LINEAR_BOTH, es );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ParticlesFromEntityState
CALLI4
pop
line 1979
;1979:		break;
ADDRGP4 $804
JUMPV
LABELV $1821
line 1982
;1980:
;1981:	case EV_PARTICLES_LINEAR_UP:
;1982:		DEBUGNAME("EV_PARTICLES_LINEAR_UP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1822
ADDRGP4 $1825
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1822
line 1983
;1983:		CG_ParticlesFromEntityState( cent->lerpOrigin, PT_LINEAR_UP, es );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ParticlesFromEntityState
CALLI4
pop
line 1984
;1984:		break;
ADDRGP4 $804
JUMPV
LABELV $1826
line 1987
;1985:
;1986:	case EV_PARTICLES_LINEAR_DOWN:
;1987:		DEBUGNAME("EV_PARTICLES_LINEAR_DOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1827
ADDRGP4 $1830
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1827
line 1988
;1988:		CG_ParticlesFromEntityState( cent->lerpOrigin, PT_LINEAR_DOWN, es );
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ParticlesFromEntityState
CALLI4
pop
line 1989
;1989:		break;
ADDRGP4 $804
JUMPV
LABELV $1831
line 1992
;1990:
;1991:	case EV_OVERLAY:
;1992:		DEBUGNAME("EV_OVERLAY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1832
ADDRGP4 $1835
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1832
line 1993
;1993:		CG_RegisterOverlay();
ADDRGP4 CG_RegisterOverlay
CALLV
pop
line 1994
;1994:		break;
ADDRGP4 $804
JUMPV
LABELV $803
line 1997
;1995:
;1996:	default:
;1997:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1836
ADDRGP4 $1839
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1836
line 1998
;1998:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1840
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1999
;1999:		break;
LABELV $804
line 2002
;2000:	}
;2001:
;2002:}
LABELV $786
endproc CG_EntityEvent 232 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 2011
;2003:
;2004:
;2005:/*
;2006:==============
;2007:CG_CheckEvents
;2008:
;2009:==============
;2010:*/
;2011:void CG_CheckEvents( centity_t *cent ) {
line 2013
;2012:	// check for event-only entities
;2013:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
LEI4 $1844
line 2014
;2014:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1846
line 2015
;2015:			return;	// already fired
ADDRGP4 $1843
JUMPV
LABELV $1846
line 2018
;2016:		}
;2017:		// if this is a player event set the entity number of the client entity number
;2018:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1848
line 2019
;2019:			cent->currentState.number = cent->currentState.otherEntityNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 2020
;2020:		}
LABELV $1848
line 2022
;2021:
;2022:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 2024
;2023:
;2024:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
SUBI4
ASGNI4
line 2025
;2025:	} else {
ADDRGP4 $1845
JUMPV
LABELV $1844
line 2027
;2026:		// check for events riding with another entity
;2027:		if ( cent->currentState.event == cent->previousEvent ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
NEI4 $1850
line 2028
;2028:			return;
ADDRGP4 $1843
JUMPV
LABELV $1850
line 2030
;2029:		}
;2030:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 2031
;2031:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1852
line 2032
;2032:			return;
ADDRGP4 $1843
JUMPV
LABELV $1852
line 2034
;2033:		}
;2034:	}
LABELV $1845
line 2037
;2035:
;2036:	// calculate the position at exactly the frame time
;2037:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2038
;2038:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 2040
;2039:
;2040:	CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 816
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 2041
;2041:}
LABELV $1843
endproc CG_CheckEvents 8 12
import CG_ParticlesFromEntityState
import CG_StartEarthquake
import CG_ShowDebris
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
LABELV $1840
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1839
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1835
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 76
byte 1 65
byte 1 89
byte 1 10
byte 1 0
align 1
LABELV $1830
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 84
byte 1 73
byte 1 67
byte 1 76
byte 1 69
byte 1 83
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 68
byte 1 79
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1825
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 84
byte 1 73
byte 1 67
byte 1 76
byte 1 69
byte 1 83
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $1820
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 84
byte 1 73
byte 1 67
byte 1 76
byte 1 69
byte 1 83
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $1815
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 84
byte 1 73
byte 1 67
byte 1 76
byte 1 69
byte 1 83
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 86
byte 1 73
byte 1 84
byte 1 89
byte 1 10
byte 1 0
align 1
LABELV $1790
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 80
byte 1 85
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $1780
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 77
byte 1 79
byte 1 75
byte 1 69
byte 1 80
byte 1 85
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $1769
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $1763
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 88
byte 1 80
byte 1 76
byte 1 79
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1758
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 65
byte 1 82
byte 1 84
byte 1 72
byte 1 81
byte 1 85
byte 1 65
byte 1 75
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1753
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 77
byte 1 73
byte 1 84
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 82
byte 1 73
byte 1 83
byte 1 95
byte 1 83
byte 1 84
byte 1 79
byte 1 78
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1748
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 77
byte 1 73
byte 1 84
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 82
byte 1 73
byte 1 83
byte 1 95
byte 1 71
byte 1 76
byte 1 65
byte 1 83
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $1743
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 77
byte 1 73
byte 1 84
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 82
byte 1 73
byte 1 83
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $1738
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 77
byte 1 73
byte 1 84
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 82
byte 1 73
byte 1 83
byte 1 95
byte 1 87
byte 1 79
byte 1 79
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $1733
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 77
byte 1 73
byte 1 84
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 82
byte 1 73
byte 1 83
byte 1 95
byte 1 68
byte 1 65
byte 1 82
byte 1 75
byte 1 95
byte 1 76
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1728
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 77
byte 1 73
byte 1 84
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 82
byte 1 73
byte 1 83
byte 1 95
byte 1 76
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 95
byte 1 76
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1723
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 77
byte 1 73
byte 1 84
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 82
byte 1 73
byte 1 83
byte 1 95
byte 1 68
byte 1 65
byte 1 82
byte 1 75
byte 1 10
byte 1 0
align 1
LABELV $1718
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 77
byte 1 73
byte 1 84
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 82
byte 1 73
byte 1 83
byte 1 95
byte 1 76
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $1713
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 85
byte 1 71
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1708
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 79
byte 1 80
byte 1 76
byte 1 79
byte 1 79
byte 1 80
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $1699
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 73
byte 1 66
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $1686
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 82
byte 1 69
byte 1 71
byte 1 69
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1673
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 66
byte 1 65
byte 1 84
byte 1 84
byte 1 76
byte 1 69
byte 1 83
byte 1 85
byte 1 73
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $1660
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 81
byte 1 85
byte 1 65
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $1655
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 73
byte 1 84
byte 1 85
byte 1 65
byte 1 82
byte 1 89
byte 1 10
byte 1 0
align 1
LABELV $1650
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1649
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
LABELV $1646
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 120
byte 1 10
byte 1 0
align 1
LABELV $1638
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 86
byte 1 69
byte 1 72
byte 1 73
byte 1 67
byte 1 76
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1630
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1483
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $1472
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $1463
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $1450
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1437
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $1424
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 87
byte 1 65
byte 1 76
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $1377
byte 1 69
byte 1 86
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 84
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $1372
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $1367
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $1362
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $1357
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 80
byte 1 76
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $1349
byte 1 69
byte 1 86
byte 1 95
byte 1 76
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 66
byte 1 79
byte 1 76
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $1344
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 73
byte 1 67
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $1339
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 78
byte 1 86
byte 1 85
byte 1 76
byte 1 95
byte 1 73
byte 1 77
byte 1 80
byte 1 65
byte 1 67
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $1334
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 69
byte 1 76
byte 1 73
byte 1 83
byte 1 75
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1329
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 69
byte 1 76
byte 1 73
byte 1 83
byte 1 75
byte 1 69
byte 1 88
byte 1 80
byte 1 76
byte 1 79
byte 1 68
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1324
byte 1 69
byte 1 86
byte 1 95
byte 1 75
byte 1 65
byte 1 77
byte 1 73
byte 1 75
byte 1 65
byte 1 90
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1317
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 82
byte 1 79
byte 1 88
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 89
byte 1 95
byte 1 77
byte 1 73
byte 1 78
byte 1 69
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $1302
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 82
byte 1 79
byte 1 88
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 89
byte 1 95
byte 1 77
byte 1 73
byte 1 78
byte 1 69
byte 1 95
byte 1 83
byte 1 84
byte 1 73
byte 1 67
byte 1 75
byte 1 10
byte 1 0
align 1
LABELV $1291
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 66
byte 1 79
byte 1 85
byte 1 78
byte 1 67
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1283
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 82
byte 1 69
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1276
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 79
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $1269
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 79
byte 1 85
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $1259
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1251
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $1246
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $1241
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $1236
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $1231
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $1226
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 57
byte 1 10
byte 1 0
align 1
LABELV $1221
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 56
byte 1 10
byte 1 0
align 1
LABELV $1216
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $1211
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 54
byte 1 10
byte 1 0
align 1
LABELV $1206
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 53
byte 1 10
byte 1 0
align 1
LABELV $1201
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $1196
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $1191
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $1186
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $1181
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $1176
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1169
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 78
byte 1 71
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1161
byte 1 69
byte 1 86
byte 1 95
byte 1 78
byte 1 79
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 10
byte 1 0
align 1
LABELV $1147
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $1110
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 78
byte 1 84
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $1106
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $1099
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
LABELV $1098
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 67
byte 1 76
byte 1 69
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $1091
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 85
byte 1 78
byte 1 68
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $1084
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1077
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $1072
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $1071
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 80
byte 1 65
byte 1 84
byte 1 82
byte 1 79
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $1066
byte 1 111
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1065
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 71
byte 1 85
byte 1 65
byte 1 82
byte 1 68
byte 1 66
byte 1 65
byte 1 83
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1060
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $1059
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 71
byte 1 69
byte 1 84
byte 1 70
byte 1 76
byte 1 65
byte 1 71
byte 1 10
byte 1 0
align 1
LABELV $1054
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1053
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 70
byte 1 79
byte 1 76
byte 1 76
byte 1 79
byte 1 87
byte 1 77
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $1048
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $1047
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 78
byte 1 79
byte 1 10
byte 1 0
align 1
LABELV $1042
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1041
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 89
byte 1 69
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $1036
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1035
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 86
byte 1 73
byte 1 84
byte 1 89
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $1030
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 51
byte 1 0
align 1
LABELV $1027
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 50
byte 1 0
align 1
LABELV $1024
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 97
byte 1 99
byte 1 116
byte 1 49
byte 1 0
align 1
LABELV $1021
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 84
byte 1 49
byte 1 95
byte 1 73
byte 1 77
byte 1 80
byte 1 65
byte 1 67
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $1016
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 118
byte 1 101
byte 1 104
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 50
byte 1 53
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $1015
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 82
byte 1 65
byte 1 83
byte 1 72
byte 1 50
byte 1 53
byte 1 10
byte 1 0
align 1
LABELV $1010
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 118
byte 1 101
byte 1 104
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 47
byte 1 104
byte 1 111
byte 1 114
byte 1 110
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $1009
byte 1 69
byte 1 86
byte 1 95
byte 1 72
byte 1 79
byte 1 82
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $1004
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
LABELV $1003
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $995
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $990
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
LABELV $983
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 95
byte 1 80
byte 1 65
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $953
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $940
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
LABELV $939
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 70
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $922
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 77
byte 1 69
byte 1 68
byte 1 73
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $903
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 82
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $883
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 87
byte 1 73
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $868
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 87
byte 1 65
byte 1 68
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $853
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $838
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $823
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $809
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $796
byte 1 90
byte 1 69
byte 1 82
byte 1 79
byte 1 69
byte 1 86
byte 1 69
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $790
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $785
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 118
byte 1 101
byte 1 104
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 53
byte 1 48
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $782
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
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $781
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
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $776
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
LABELV $775
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
LABELV $772
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
LABELV $769
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
LABELV $709
byte 1 47
byte 1 37
byte 1 105
byte 1 47
byte 1 0
align 1
LABELV $687
byte 1 208
byte 1 152
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $682
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $677
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $672
byte 1 78
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $659
byte 1 37
byte 1 115
byte 1 62
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 46
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $655
byte 1 37
byte 1 115
byte 1 62
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $651
byte 1 37
byte 1 115
byte 1 62
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $646
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $645
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $642
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 209
byte 1 136
byte 1 208
byte 1 186
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $641
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 209
byte 1 136
byte 1 208
byte 1 186
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $637
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 209
byte 1 137
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $636
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 209
byte 1 137
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $632
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 136
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 135
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $631
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 136
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 135
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $627
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 209
byte 1 143
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $626
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 209
byte 1 143
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $622
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 143
byte 1 209
byte 1 135
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $621
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 143
byte 1 209
byte 1 135
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $617
byte 1 208
byte 1 191
byte 1 209
byte 1 139
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 179
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 190
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
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 0
align 1
LABELV $616
byte 1 208
byte 1 191
byte 1 209
byte 1 139
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 179
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 190
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
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 0
align 1
LABELV $612
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 32
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 136
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $611
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 136
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $607
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $606
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $602
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 182
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 186
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 129
byte 1 0
align 1
LABELV $601
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 182
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 186
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 129
byte 1 0
align 1
LABELV $597
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 182
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $596
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 182
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $592
byte 1 209
byte 1 131
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 208
byte 1 178
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $591
byte 1 209
byte 1 131
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 208
byte 1 178
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $587
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 136
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $586
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 136
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $582
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 209
byte 1 134
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $581
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 209
byte 1 134
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $577
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $576
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $572
byte 1 32
byte 1 209
byte 1 129
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 209
byte 1 137
byte 1 209
byte 1 140
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 164
byte 1 208
byte 1 147
byte 1 0
align 1
LABELV $571
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $570
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $566
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 141
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 130
byte 1 209
byte 1 128
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
byte 1 188
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 0
align 1
LABELV $565
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 141
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 130
byte 1 209
byte 1 128
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
byte 1 188
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 0
align 1
LABELV $561
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $560
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $556
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $555
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $551
byte 1 32
byte 1 209
byte 1 129
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 209
byte 1 137
byte 1 209
byte 1 140
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $550
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 191
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $549
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 191
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $545
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $544
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $540
byte 1 209
byte 1 129
byte 1 209
byte 1 138
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $539
byte 1 209
byte 1 129
byte 1 209
byte 1 138
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $535
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 32
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $534
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $530
byte 1 209
byte 1 129
byte 1 209
byte 1 138
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $529
byte 1 209
byte 1 129
byte 1 209
byte 1 138
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $525
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 176
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
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $524
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 176
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
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $520
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
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
byte 1 143
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $519
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
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
byte 1 143
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $515
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $514
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $510
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $509
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $503
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 94
byte 1 50
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 174
byte 1 208
byte 1 151
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 154
byte 1 208
byte 1 158
byte 1 208
byte 1 156
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $502
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 32
byte 1 94
byte 1 50
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 174
byte 1 208
byte 1 151
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 154
byte 1 208
byte 1 158
byte 1 208
byte 1 156
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $497
byte 1 32
byte 1 0
align 1
LABELV $489
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $488
byte 1 39
byte 1 115
byte 1 32
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $487
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $485
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $483
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $481
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 97
byte 1 99
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $479
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $477
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $476
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $474
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $472
byte 1 39
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $471
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $469
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $467
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 106
byte 1 117
byte 1 105
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $465
byte 1 39
byte 1 115
byte 1 32
byte 1 75
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $464
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $462
byte 1 39
byte 1 115
byte 1 32
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $461
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $459
byte 1 39
byte 1 115
byte 1 32
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
LABELV $458
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 115
byte 1 111
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $456
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $454
byte 1 39
byte 1 115
byte 1 32
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $453
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $451
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $449
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $446
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $445
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $443
byte 1 97
byte 1 108
byte 1 109
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 100
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $441
byte 1 39
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $439
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $438
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 101
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $436
byte 1 39
byte 1 115
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $435
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $433
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $431
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $429
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 117
byte 1 109
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $427
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $423
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 94
byte 1 50
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 77
byte 1 65
byte 1 84
byte 1 69
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $410
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $402
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $401
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 32
byte 1 94
byte 1 50
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 174
byte 1 208
byte 1 151
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 154
byte 1 208
byte 1 144
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $396
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 32
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 32
byte 1 209
byte 1 129
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 209
byte 1 132
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $389
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $388
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 94
byte 1 50
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 77
byte 1 65
byte 1 84
byte 1 69
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $383
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $373
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $372
byte 1 37
byte 1 115
byte 1 62
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $363
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $360
byte 1 209
byte 1 131
byte 1 208
byte 1 177
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
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $357
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $354
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $350
byte 1 209
byte 1 129
byte 1 208
byte 1 182
byte 1 208
byte 1 181
byte 1 208
byte 1 179
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $347
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 182
byte 1 208
byte 1 179
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $343
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 136
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 177
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $340
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 136
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
byte 1 190
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 177
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $336
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 129
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 209
byte 1 137
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 131
byte 1 209
byte 1 136
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $335
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 140
byte 1 32
byte 1 209
byte 1 129
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 209
byte 1 137
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 131
byte 1 209
byte 1 136
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $331
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 208
byte 1 187
byte 1 0
align 1
LABELV $328
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $324
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $321
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $317
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 190
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 177
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
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $314
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 190
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 177
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
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $310
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 44
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 32
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 0
align 1
LABELV $309
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 44
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 129
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
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $305
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $304
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $300
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $299
byte 1 208
byte 1 178
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $295
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 209
byte 1 133
byte 1 208
byte 1 190
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 129
byte 1 32
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 0
align 1
LABELV $282
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $281
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $278
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $270
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $269
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $266
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $262
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $261
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $258
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $254
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $252
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $251
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $248
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $244
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $243
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $240
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $236
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $235
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $232
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $228
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $227
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 115
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $223
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $222
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $218
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $217
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $213
byte 1 103
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $202
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $201
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $197
byte 1 209
byte 1 131
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $196
byte 1 209
byte 1 131
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 181
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
byte 1 130
byte 1 0
align 1
LABELV $192
byte 1 209
byte 1 129
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 180
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $191
byte 1 209
byte 1 129
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 180
byte 1 32
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $187
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $186
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $182
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $181
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $177
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $176
byte 1 208
byte 1 177
byte 1 209
byte 1 139
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $172
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $171
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $157
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $155
byte 1 115
byte 1 97
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $153
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $151
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $149
byte 1 115
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 108
byte 1 105
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $147
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $135
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $134
byte 1 110
byte 1 0
align 1
LABELV $127
byte 1 67
byte 1 71
byte 1 95
byte 1 79
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $122
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 37
byte 1 105
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $120
byte 1 37
byte 1 105
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $117
byte 1 37
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $114
byte 1 37
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $111
byte 1 49
byte 1 51
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $108
byte 1 49
byte 1 50
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $105
byte 1 49
byte 1 49
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $102
byte 1 94
byte 1 51
byte 1 51
byte 1 114
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $99
byte 1 94
byte 1 49
byte 1 50
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $96
byte 1 94
byte 1 50
byte 1 49
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $93
byte 1 0
align 1
LABELV $92
byte 1 208
byte 1 148
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 0
align 1
LABELV $88
byte 1 84
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 0
