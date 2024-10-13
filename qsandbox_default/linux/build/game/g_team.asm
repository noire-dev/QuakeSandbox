export Team_InitGame
code
proc Team_InitGame 8 12
file "../../../code/game/g_team.c"
line 54
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Open Arena source code.
;6:Portions copied from Tremulous under GPL version 2 including any later version.
;7:
;8:Open Arena source code is free software; you can redistribute it
;9:and/or modify it under the terms of the GNU General Public License as
;10:published by the Free Software Foundation; either version 2 of the License,
;11:or (at your option) any later version.
;12:
;13:Open Arena source code is distributed in the hope that it will be
;14:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;15:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;16:GNU General Public License for more details.
;17:
;18:You should have received a copy of the GNU General Public License
;19:along with Open Arena source code; if not, write to the Free Software
;20:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;21:===========================================================================
;22:*/
;23://
;24:
;25:#include "g_local.h"
;26:
;27:
;28:typedef struct teamgame_s {
;29:	float			last_flag_capture;
;30:	int				last_capture_team;
;31:	flagStatus_t	redStatus;	// CTF
;32:	flagStatus_t	blueStatus;	// CTF
;33:	flagStatus_t	flagStatus;	// One Flag CTF
;34:	int				redTakenTime;
;35:	int				blueTakenTime;
;36:	int				redObeliskAttackedTime;
;37:	int				blueObeliskAttackedTime;
;38:} teamgame_t;
;39:
;40:teamgame_t teamgame;
;41:
;42:gentity_t	*neutralObelisk;
;43:
;44://Some pointers for Double Domination so we don't need GFind (I think it might crash at random times...)
;45:gentity_t	*ddA;
;46:gentity_t	*ddB;
;47://Pointers for Standard Domination
;48:gentity_t	*dom_points[MAX_DOMINATION_POINTS];
;49:
;50:void Team_SetFlagStatus( int team, flagStatus_t status );
;51:
;52:qboolean dominationPointsSpawned;
;53:
;54:void Team_InitGame( void ) {
line 55
;55:	memset(&teamgame, 0, sizeof teamgame);
ADDRGP4 teamgame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 36
ARGI4
ADDRGP4 memset
CALLP4
pop
line 57
;56:
;57:	switch( g_gametype.integer ) {
ADDRLP4 0
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $66
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $66
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $74-20
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $74
address $68
address $72
address $66
address $66
address $66
address $68
address $66
address $68
address $71
code
LABELV $68
line 61
;58:	case GT_CTF:
;59:	case GT_CTF_ELIMINATION:
;60:	case GT_DOUBLE_D:
;61:		teamgame.redStatus = -1; // Invalid to force update
ADDRGP4 teamgame+8
CNSTI4 -1
ASGNI4
line 62
;62:		Team_SetFlagStatus( TEAM_RED, FLAG_ATBASE );
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 63
;63:		 teamgame.blueStatus = -1; // Invalid to force update
ADDRGP4 teamgame+12
CNSTI4 -1
ASGNI4
line 64
;64:		Team_SetFlagStatus( TEAM_BLUE, FLAG_ATBASE );
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 65
;65:		ddA = NULL;
ADDRGP4 ddA
CNSTP4 0
ASGNP4
line 66
;66:		ddB = NULL;
ADDRGP4 ddB
CNSTP4 0
ASGNP4
line 67
;67:		break;
ADDRGP4 $66
JUMPV
LABELV $71
line 69
;68:	case GT_DOMINATION:
;69:		dominationPointsSpawned = qfalse;
ADDRGP4 dominationPointsSpawned
CNSTI4 0
ASGNI4
line 70
;70:                break;
ADDRGP4 $66
JUMPV
LABELV $72
line 72
;71:	case GT_1FCTF:
;72:		teamgame.flagStatus = -1; // Invalid to force update
ADDRGP4 teamgame+16
CNSTI4 -1
ASGNI4
line 73
;73:		Team_SetFlagStatus( TEAM_FREE, FLAG_ATBASE );
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 74
;74:		break;
line 76
;75:	default:
;76:		break;
LABELV $66
line 78
;77:	}
;78:}
LABELV $64
endproc Team_InitGame 8 12
export OtherTeam
proc OtherTeam 0 0
line 80
;79:
;80:int OtherTeam(int team) {
line 81
;81:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $77
line 82
;82:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $76
JUMPV
LABELV $77
line 83
;83:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $79
line 84
;84:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $76
JUMPV
LABELV $79
line 85
;85:	return team;
ADDRFP4 0
INDIRI4
RETI4
LABELV $76
endproc OtherTeam 0 0
export TeamName
proc TeamName 0 0
line 88
;86:}
;87:
;88:const char *TeamName(int team)  {
line 89
;89:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $82
line 90
;90:		return "RED";
ADDRGP4 $84
RETP4
ADDRGP4 $81
JUMPV
LABELV $82
line 91
;91:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $85
line 92
;92:		return "BLUE";
ADDRGP4 $87
RETP4
ADDRGP4 $81
JUMPV
LABELV $85
line 93
;93:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $88
line 94
;94:		return "SPECTATOR";
ADDRGP4 $90
RETP4
ADDRGP4 $81
JUMPV
LABELV $88
line 95
;95:	return "FREE";
ADDRGP4 $91
RETP4
LABELV $81
endproc TeamName 0 0
export OtherTeamName
proc OtherTeamName 0 0
line 98
;96:}
;97:
;98:const char *OtherTeamName(int team) {
line 99
;99:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $93
line 100
;100:		return "BLUE";
ADDRGP4 $87
RETP4
ADDRGP4 $92
JUMPV
LABELV $93
line 101
;101:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $95
line 102
;102:		return "RED";
ADDRGP4 $84
RETP4
ADDRGP4 $92
JUMPV
LABELV $95
line 103
;103:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $97
line 104
;104:		return "SPECTATOR";
ADDRGP4 $90
RETP4
ADDRGP4 $92
JUMPV
LABELV $97
line 105
;105:	return "FREE";
ADDRGP4 $91
RETP4
LABELV $92
endproc OtherTeamName 0 0
export TeamColorString
proc TeamColorString 0 0
line 108
;106:}
;107:
;108:const char *TeamColorString(int team) {
line 109
;109:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $100
line 110
;110:		return S_COLOR_RED;
ADDRGP4 $102
RETP4
ADDRGP4 $99
JUMPV
LABELV $100
line 111
;111:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $103
line 112
;112:		return S_COLOR_BLUE;
ADDRGP4 $105
RETP4
ADDRGP4 $99
JUMPV
LABELV $103
line 113
;113:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $106
line 114
;114:		return S_COLOR_YELLOW;
ADDRGP4 $108
RETP4
ADDRGP4 $99
JUMPV
LABELV $106
line 115
;115:	return S_COLOR_WHITE;
ADDRGP4 $109
RETP4
LABELV $99
endproc TeamColorString 0 0
export PrintMsg
proc PrintMsg 1048 16
line 119
;116:}
;117:
;118:// NULL for everyone
;119:void QDECL PrintMsg( gentity_t *ent, const char *fmt, ... ) {
line 124
;120:	char		msg[1024];
;121:	va_list		argptr;
;122:	char		*p;
;123:	
;124:	va_start (argptr,fmt);
ADDRLP4 1028
ADDRFP4 4+4
ASGNP4
line 125
;125:	if (Q_vsnprintf (msg, sizeof(msg), fmt, argptr) >= sizeof(msg)) {
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_vsnprintf
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CVIU4 4
CNSTU4 1024
LTU4 $112
line 126
;126:		G_Error ( "PrintMsg overrun" );
ADDRGP4 $114
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 127
;127:	}
LABELV $112
line 128
;128:	va_end (argptr);
ADDRLP4 1028
CNSTP4 0
ASGNP4
ADDRGP4 $116
JUMPV
LABELV $115
line 132
;129:
;130:	// double quotes are bad
;131:	while ((p = strchr(msg, '"')) != NULL)
;132:		*p = '\'';
ADDRLP4 0
INDIRP4
CNSTI1 39
ASGNI1
LABELV $116
line 131
ADDRLP4 4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $115
line 134
;133:
;134:	trap_SendServerCommand ( ( (ent == NULL) ? -1 : ent-g_entities ), va("print \"%s\"", msg ));
ADDRGP4 $119
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $120
ADDRLP4 1040
CNSTI4 -1
ASGNI4
ADDRGP4 $121
JUMPV
LABELV $120
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ASGNI4
LABELV $121
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 135
;135:}
LABELV $110
endproc PrintMsg 1048 16
export G_TeamFromString
proc G_TeamFromString 32 4
line 145
;136:
;137:/*
;138:================
;139:KK-OAX From Tremulous
;140:G_TeamFromString
;141:Return the team referenced by a string
;142:================
;143:*/
;144:team_t G_TeamFromString( char *str )
;145:{
line 146
;146:  switch( tolower( *str ) )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 12
CNSTI4 98
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $129
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
GTI4 $131
LABELV $130
ADDRLP4 0
INDIRI4
CNSTI4 48
LTI4 $123
ADDRLP4 0
INDIRI4
CNSTI4 51
GTI4 $123
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $132-192
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $132
address $126
address $127
address $128
address $129
code
LABELV $131
ADDRLP4 24
CNSTI4 102
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $127
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $123
LABELV $134
ADDRLP4 0
INDIRI4
CNSTI4 114
EQI4 $128
ADDRLP4 0
INDIRI4
CNSTI4 115
EQI4 $126
ADDRGP4 $123
JUMPV
line 147
;147:  {
LABELV $126
line 148
;148:    case '0': case 's': return TEAM_NONE;
CNSTI4 3
RETI4
ADDRGP4 $122
JUMPV
LABELV $127
line 149
;149:    case '1': case 'f': return TEAM_FREE;
CNSTI4 0
RETI4
ADDRGP4 $122
JUMPV
LABELV $128
line 150
;150:    case '2': case 'r': return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $122
JUMPV
LABELV $129
line 151
;151:    case '3': case 'b': return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $122
JUMPV
LABELV $123
line 152
;152:    default: return TEAM_NUM_TEAMS;
CNSTI4 4
RETI4
LABELV $122
endproc G_TeamFromString 32 4
export AddTeamScore
proc AddTeamScore 12 8
line 164
;153:  }
;154:}
;155:
;156:/*
;157:==============
;158:AddTeamScore
;159:
;160: used for gametype > GT_TEAM
;161: for gametype GT_TEAM the level.teamScores is updated in AddScore in g_combat.c
;162:==============
;163:*/
;164:void AddTeamScore(vec3_t origin, int team, int score) {
line 168
;165:	gentity_t	*te;
;166:
;167:
;168:	if ( g_gametype.integer != GT_DOMINATION ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 13
EQI4 $136
line 169
;169:		te = G_TempEntity(origin, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 170
;170:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 174
;171:
;172:	
;173:	
;174:		if ( team == TEAM_RED ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $139
line 175
;175:			if ( level.teamScores[ TEAM_RED ] + score == level.teamScores[ TEAM_BLUE ] ) {
ADDRGP4 level+44+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+8
INDIRI4
NEI4 $141
line 177
;176:				//teams are tied sound
;177:				te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 12
ASGNI4
line 178
;178:			}
ADDRGP4 $140
JUMPV
LABELV $141
line 179
;179:			else if ( level.teamScores[ TEAM_RED ] <= level.teamScores[ TEAM_BLUE ] &&
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
GTI4 $147
ADDRGP4 level+44+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+8
INDIRI4
LEI4 $147
line 180
;180:						level.teamScores[ TEAM_RED ] + score > level.teamScores[ TEAM_BLUE ]) {
line 182
;181:				// red took the lead sound
;182:				te->s.eventParm = GTS_REDTEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 10
ASGNI4
line 183
;183:			}
ADDRGP4 $140
JUMPV
LABELV $147
line 184
;184:			else {
line 186
;185:				// red scored sound
;186:				te->s.eventParm = GTS_REDTEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 8
ASGNI4
line 187
;187:			}
line 188
;188:		}
ADDRGP4 $140
JUMPV
LABELV $139
line 189
;189:		else {
line 190
;190:			if ( level.teamScores[ TEAM_BLUE ] + score == level.teamScores[ TEAM_RED ] ) {
ADDRGP4 level+44+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+4
INDIRI4
NEI4 $157
line 192
;191:				//teams are tied sound
;192:				te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 12
ASGNI4
line 193
;193:			}
ADDRGP4 $158
JUMPV
LABELV $157
line 194
;194:			else if ( level.teamScores[ TEAM_BLUE ] <= level.teamScores[ TEAM_RED ] &&
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 level+44+4
INDIRI4
GTI4 $163
ADDRGP4 level+44+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+4
INDIRI4
LEI4 $163
line 195
;195:						level.teamScores[ TEAM_BLUE ] + score > level.teamScores[ TEAM_RED ]) {
line 197
;196:				// blue took the lead sound
;197:				te->s.eventParm = GTS_BLUETEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 11
ASGNI4
line 198
;198:			}
ADDRGP4 $164
JUMPV
LABELV $163
line 199
;199:			else {
line 201
;200:				// blue scored sound
;201:				te->s.eventParm = GTS_BLUETEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 9
ASGNI4
line 202
;202:			}
LABELV $164
LABELV $158
line 203
;203:		}
LABELV $140
line 204
;204:	}
LABELV $136
line 205
;205:	level.teamScores[ team ] += score;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 206
;206:}
LABELV $135
endproc AddTeamScore 12 8
export OnSameTeam
proc OnSameTeam 16 0
line 213
;207:
;208:/*
;209:==============
;210:OnSameTeam
;211:==============
;212:*/
;213:qboolean OnSameTeam( gentity_t *ent1, gentity_t *ent2 ) {
line 214
;214:	if ( !ent1->client || !ent2->client ) {
ADDRLP4 0
CNSTI4 556
ASGNI4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $177
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $175
LABELV $177
line 215
;215:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $174
JUMPV
LABELV $175
line 218
;216:	}
;217:
;218:	if ( g_gametype.integer < GT_TEAM || g_ffa_gt==1) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $181
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
NEI4 $178
LABELV $181
line 219
;219:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $174
JUMPV
LABELV $178
line 222
;220:	}
;221:
;222:	if ( ent1->client->sess.sessionTeam == ent2->client->sess.sessionTeam ) {
ADDRLP4 8
CNSTI4 556
ASGNI4
ADDRLP4 12
CNSTI4 1032
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
NEI4 $182
line 223
;223:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $174
JUMPV
LABELV $182
line 226
;224:	}
;225:
;226:	return qfalse;
CNSTI4 0
RETI4
LABELV $174
endproc OnSameTeam 16 0
data
align 1
LABELV ctfFlagStatusRemap
byte 1 48
byte 1 49
byte 1 42
byte 1 42
byte 1 50
align 1
LABELV oneFlagStatusRemap
byte 1 48
byte 1 49
byte 1 50
byte 1 51
byte 1 52
export Team_SetFlagStatus
code
proc Team_SetFlagStatus 12 8
line 233
;227:}
;228:
;229:
;230:static char ctfFlagStatusRemap[] = { '0', '1', '*', '*', '2' };
;231:static char oneFlagStatusRemap[] = { '0', '1', '2', '3', '4' };
;232:
;233:void Team_SetFlagStatus( int team, flagStatus_t status ) {
line 234
;234:	qboolean modified = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 236
;235:
;236:	switch( team ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $197
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $187
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $192
ADDRGP4 $185
JUMPV
LABELV $187
line 238
;237:	case TEAM_RED:	// CTF
;238:		if( teamgame.redStatus != status ) {
ADDRGP4 teamgame+8
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $186
line 239
;239:			teamgame.redStatus = status;
ADDRGP4 teamgame+8
ADDRFP4 4
INDIRI4
ASGNI4
line 240
;240:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 241
;241:		}
line 242
;242:		break;
ADDRGP4 $186
JUMPV
LABELV $192
line 245
;243:
;244:	case TEAM_BLUE:	// CTF
;245:		if( teamgame.blueStatus != status ) {
ADDRGP4 teamgame+12
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $186
line 246
;246:			teamgame.blueStatus = status;
ADDRGP4 teamgame+12
ADDRFP4 4
INDIRI4
ASGNI4
line 247
;247:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 248
;248:		}
line 249
;249:		break;
ADDRGP4 $186
JUMPV
LABELV $197
line 252
;250:
;251:	case TEAM_FREE:	// One Flag CTF
;252:		if( teamgame.flagStatus != status ) {
ADDRGP4 teamgame+16
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $186
line 253
;253:			teamgame.flagStatus = status;
ADDRGP4 teamgame+16
ADDRFP4 4
INDIRI4
ASGNI4
line 254
;254:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 255
;255:		}
line 256
;256:		break;
LABELV $185
LABELV $186
line 260
;257:	}
;258:
;259:
;260:	if( modified ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $202
line 263
;261:		char st[4];
;262:
;263:		if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTF_ELIMINATION) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $208
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $204
LABELV $208
line 264
;264:			st[0] = ctfFlagStatusRemap[teamgame.redStatus];
ADDRLP4 8
ADDRGP4 teamgame+8
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 265
;265:			st[1] = ctfFlagStatusRemap[teamgame.blueStatus];
ADDRLP4 8+1
ADDRGP4 teamgame+12
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 266
;266:			st[2] = 0;
ADDRLP4 8+2
CNSTI1 0
ASGNI1
line 267
;267:		}
ADDRGP4 $205
JUMPV
LABELV $204
line 268
;268:		else if (g_gametype.integer == GT_DOUBLE_D) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 12
NEI4 $213
line 269
;269:			st[0] = oneFlagStatusRemap[teamgame.redStatus];
ADDRLP4 8
ADDRGP4 teamgame+8
INDIRI4
ADDRGP4 oneFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 270
;270:			st[1] = oneFlagStatusRemap[teamgame.blueStatus];
ADDRLP4 8+1
ADDRGP4 teamgame+12
INDIRI4
ADDRGP4 oneFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 271
;271:			st[2] = 0;
ADDRLP4 8+2
CNSTI1 0
ASGNI1
line 272
;272:		}
ADDRGP4 $214
JUMPV
LABELV $213
line 273
;273:		else {		// GT_1FCTF
line 274
;274:			st[0] = oneFlagStatusRemap[teamgame.flagStatus];
ADDRLP4 8
ADDRGP4 teamgame+16
INDIRI4
ADDRGP4 oneFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 275
;275:			st[1] = 0;
ADDRLP4 8+1
CNSTI1 0
ASGNI1
line 276
;276:		}
LABELV $214
LABELV $205
line 278
;277:
;278:		trap_SetConfigstring( CS_FLAGSTATUS, st );
CNSTI4 23
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 279
;279:	}
LABELV $202
line 280
;280:}
LABELV $184
endproc Team_SetFlagStatus 12 8
export Team_CheckDroppedItem
proc Team_CheckDroppedItem 0 8
line 282
;281:
;282:void Team_CheckDroppedItem( gentity_t *dropped ) {
line 283
;283:	if( dropped->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 7
NEI4 $223
line 284
;284:		Team_SetFlagStatus( TEAM_RED, FLAG_DROPPED );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 285
;285:	}
ADDRGP4 $224
JUMPV
LABELV $223
line 286
;286:	else if( dropped->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 8
NEI4 $225
line 287
;287:		Team_SetFlagStatus( TEAM_BLUE, FLAG_DROPPED );
CNSTI4 2
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 288
;288:	}
ADDRGP4 $226
JUMPV
LABELV $225
line 289
;289:	else if( dropped->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 9
NEI4 $227
line 290
;290:		Team_SetFlagStatus( TEAM_FREE, FLAG_DROPPED );
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 291
;291:	}
LABELV $227
LABELV $226
LABELV $224
line 292
;292:}
LABELV $222
endproc Team_CheckDroppedItem 0 8
export Team_ForceGesture
proc Team_ForceGesture 12 0
line 299
;293:
;294:/*
;295:================
;296:Team_ForceGesture
;297:================
;298:*/
;299:void Team_ForceGesture(int team) {
line 303
;300:	int i;
;301:	gentity_t *ent;
;302:
;303:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $230
line 304
;304:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 305
;305:		if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $234
line 306
;306:			continue;
ADDRGP4 $231
JUMPV
LABELV $234
line 307
;307:		if (!ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $236
line 308
;308:			continue;
ADDRGP4 $231
JUMPV
LABELV $236
line 309
;309:		if (ent->client->sess.sessionTeam != team)
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $238
line 310
;310:			continue;
ADDRGP4 $231
JUMPV
LABELV $238
line 311
;311:		ent->flags |= FL_FORCE_GESTURE;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 312
;312:	}
LABELV $231
line 303
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 256
LTI4 $230
line 313
;313:}
LABELV $229
endproc Team_ForceGesture 12 0
export Team_DD_bonusAtPoints
proc Team_DD_bonusAtPoints 100 12
line 322
;314:
;315:/*
;316:================
;317:Team_DD_bonusAtPoints
;318:Adds bonus point to a player if he is close to the point and on the team that scores 
;319:================
;320:*/
;321:
;322:void Team_DD_bonusAtPoints(int team) {
line 327
;323:	vec3_t v1, v2;
;324:	int i;
;325:	gentity_t *player;
;326:
;327:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $241
line 328
;328:		player = &g_entities[i];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 329
;329:		if (!player->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $245
line 330
;330:			continue;
ADDRGP4 $242
JUMPV
LABELV $245
line 331
;331:		if (!player->client)
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $247
line 332
;332:			continue;
ADDRGP4 $242
JUMPV
LABELV $247
line 334
;333:		
;334:		if( player->client->sess.sessionTeam != team )
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $249
line 335
;335:			return; //player was not on scoring team 
ADDRGP4 $240
JUMPV
LABELV $249
line 338
;336:
;337:		//See if the player is close to any of the points:
;338:		VectorSubtract(player->r.currentOrigin, ddA->r.currentOrigin, v1);
ADDRLP4 36
CNSTI4 528
ASGNI4
ADDRLP4 40
ADDRGP4 ddA
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 532
ASGNI4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 536
ASGNI4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRGP4 ddA
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 339
;339:		VectorSubtract(player->r.currentOrigin, ddB->r.currentOrigin, v2);
ADDRLP4 56
CNSTI4 528
ASGNI4
ADDRLP4 60
ADDRGP4 ddB
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
CNSTI4 532
ASGNI4
ADDRLP4 16+4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 536
ASGNI4
ADDRLP4 16+8
ADDRLP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRGP4 ddB
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 340
;340:		if (!( ( ( VectorLength(v1) < CTF_TARGET_PROTECT_RADIUS &&
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 72
INDIRF4
CNSTF4 1148846080
GEF4 $257
ADDRLP4 76
CNSTI4 528
ASGNI4
ADDRGP4 ddA
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $255
LABELV $257
ADDRLP4 16
ARGP4
ADDRLP4 84
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 84
INDIRF4
CNSTF4 1148846080
GEF4 $258
ADDRLP4 88
CNSTI4 528
ASGNI4
ADDRGP4 ddB
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $255
LABELV $258
line 344
;341:				trap_InPVS(ddA->r.currentOrigin, player->r.currentOrigin ) ) ||
;342:				( VectorLength(v2) < CTF_TARGET_PROTECT_RADIUS &&
;343:				trap_InPVS(ddB->r.currentOrigin, player->r.currentOrigin ) ) )))
;344:					return; //Wasn't close to any of the points
ADDRGP4 $240
JUMPV
LABELV $255
line 346
;345:	
;346:		AddScore(player, player->r.currentOrigin, DD_AT_POINT_AT_CAPTURE);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 347
;347:	}
LABELV $242
line 327
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 256
LTI4 $241
line 348
;348:}
LABELV $240
endproc Team_DD_bonusAtPoints 100 12
export Team_FragBonuses
proc Team_FragBonuses 284 40
line 360
;349:
;350:/*
;351:================
;352:Team_FragBonuses
;353:
;354:Calculate the bonuses for flag defense, flag carrier defense, etc.
;355:Note that bonuses are not cumulative.  You get one, they are in importance
;356:order.
;357:================
;358:*/
;359:void Team_FragBonuses(gentity_t *targ, gentity_t *inflictor, gentity_t *attacker)
;360:{
line 366
;361:	int i;
;362:	gentity_t *ent;
;363:	int flag_pw, enemy_flag_pw;
;364:	int otherteam;
;365:	int tokens;
;366:	gentity_t *flag, *carrier = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 372
;367:	char *c;
;368:	vec3_t v1, v2;
;369:	int team;
;370:
;371:	// no bonus for fragging yourself or team mates
;372:	if (!targ->client || !attacker->client || targ == attacker || OnSameTeam(targ, attacker))
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 556
ASGNI4
ADDRLP4 72
CNSTU4 0
ASGNU4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $264
ADDRLP4 76
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $264
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRP4
CVPU4 4
EQU4 $264
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $260
LABELV $264
line 373
;373:		return;
ADDRGP4 $259
JUMPV
LABELV $260
line 375
;374:
;375:	team = targ->client->sess.sessionTeam;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 376
;376:	otherteam = OtherTeam(targ->client->sess.sessionTeam);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 84
INDIRI4
ASGNI4
line 377
;377:	if (otherteam < 0)
ADDRLP4 16
INDIRI4
CNSTI4 0
GEI4 $265
line 378
;378:		return; // whoever died isn't on a team
ADDRGP4 $259
JUMPV
LABELV $265
line 381
;379:
;380:	// same team, if the flag at base, check to he has the enemy flag
;381:	if (team == TEAM_RED) {
ADDRLP4 48
INDIRI4
CNSTI4 1
NEI4 $267
line 382
;382:		flag_pw = PW_REDFLAG;
ADDRLP4 52
CNSTI4 7
ASGNI4
line 383
;383:		enemy_flag_pw = PW_BLUEFLAG;
ADDRLP4 60
CNSTI4 8
ASGNI4
line 384
;384:	} else {
ADDRGP4 $268
JUMPV
LABELV $267
line 385
;385:		flag_pw = PW_BLUEFLAG;
ADDRLP4 52
CNSTI4 8
ASGNI4
line 386
;386:		enemy_flag_pw = PW_REDFLAG;
ADDRLP4 60
CNSTI4 7
ASGNI4
line 387
;387:	}
LABELV $268
line 389
;388:
;389:	if (g_gametype.integer == GT_1FCTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $269
line 390
;390:		enemy_flag_pw = PW_NEUTRALFLAG;
ADDRLP4 60
CNSTI4 9
ASGNI4
line 391
;391:	} 
LABELV $269
line 394
;392:
;393:	// did the attacker frag the flag carrier?
;394:	tokens = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 395
;395:	if( g_gametype.integer == GT_HARVESTER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $272
line 396
;396:		tokens = targ->client->ps.generic1;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 397
;397:	}
LABELV $272
line 398
;398:	if (targ->client->ps.powerups[enemy_flag_pw]) {
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $275
line 399
;399:		attacker->client->pers.teamState.lastfraggedcarrier = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 400
;400:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 401
;401:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 88
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 584
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 402
;402:		PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's flag carrier!\n",
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $278
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 404
;403:			attacker->client->pers.netname, TeamName(team));
;404:                if(g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $279
line 405
;405:                    G_LogPrintf( "CTF: %i %i %i: %s fragged %s's flag carrier!\n", attacker->client->ps.clientNum, team, 3, attacker->client->pers.netname, TeamName(team) );
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $282
ARGP4
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 100
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 406
;406:                } else if(g_gametype.integer == GT_CTF_ELIMINATION) {
ADDRGP4 $280
JUMPV
LABELV $279
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $283
line 407
;407:                    G_LogPrintf( "CTF_ELIMINATION: %i %i %i %i: %s fragged %s's flag carrier!\n", level.roundNumber, attacker->client->ps.clientNum, team, 3, attacker->client->pers.netname, TeamName(team) );
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $286
ARGP4
ADDRGP4 level+10004
INDIRI4
ARGI4
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 100
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 408
;408:                } else if(g_gametype.integer == GT_1FCTF) {
ADDRGP4 $284
JUMPV
LABELV $283
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $288
line 409
;409:                    G_LogPrintf( "1fCTF: %i %i %i: %s fragged %s's flag carrier!\n", attacker->client->ps.clientNum, team, 3, attacker->client->pers.netname, TeamName(team) );
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $291
ARGP4
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 100
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 410
;410:                }
LABELV $288
LABELV $284
LABELV $280
line 415
;411:                
;412:
;413:		// the target had the flag, clear the hurt carrier
;414:		// field on the other team
;415:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $295
JUMPV
LABELV $292
line 416
;416:			ent = g_entities + i;
ADDRLP4 8
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 417
;417:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 8
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $297
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $297
line 418
;418:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 0
ASGNF4
LABELV $297
line 419
;419:		}
LABELV $293
line 415
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $295
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $292
line 420
;420:		return;
ADDRGP4 $259
JUMPV
LABELV $275
line 424
;421:	}
;422:
;423:	// did the attacker frag a head carrier? other->client->ps.generic1
;424:	if (tokens) {
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $299
line 425
;425:		attacker->client->pers.teamState.lastfraggedcarrier = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 426
;426:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS * tokens * tokens);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 20
ADDRLP4 56
INDIRI4
MULI4
ADDRLP4 56
INDIRI4
MULI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 427
;427:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 584
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 428
;428:		PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's skull carrier!\n",
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $302
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 431
;429:			attacker->client->pers.netname, TeamName(team));
;430:
;431:                G_LogPrintf("HARVESTER: %i %i %i %i %i: %s fragged %s (%s) who had %i skulls.\n",
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $303
ARGP4
ADDRLP4 104
CNSTI4 556
ASGNI4
ADDRLP4 108
ADDRFP4 8
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 112
CNSTI4 140
ASGNI4
ADDRLP4 108
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 124
CNSTI4 516
ASGNI4
ADDRLP4 108
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
ARGP4
ADDRLP4 116
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 437
;432:                        attacker->client->ps.clientNum, team, 1, targ->client->ps.clientNum, tokens,
;433:                        attacker->client->pers.netname, targ->client->pers.netname,TeamName(team),tokens);
;434:
;435:		// the target had the flag, clear the hurt carrier
;436:		// field on the other team
;437:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $304
line 438
;438:			ent = g_entities + i;
ADDRLP4 8
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 439
;439:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 8
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $309
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $309
line 440
;440:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 0
ASGNF4
LABELV $309
line 441
;441:		}
LABELV $305
line 437
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $307
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $304
line 442
;442:		return;
ADDRGP4 $259
JUMPV
LABELV $299
line 445
;443:	}
;444:
;445:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 88
CNSTI4 556
ASGNI4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CNSTI4 592
ADDP4
INDIRF4
ASGNF4
ADDRLP4 92
INDIRF4
CNSTF4 0
EQF4 $311
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $311
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $311
line 447
;446:		level.time - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT &&
;447:		!attacker->client->ps.powerups[flag_pw]) {
line 450
;448:		// attacker is on the same team as the flag carrier and
;449:		// fragged a guy who hurt our flag carrier
;450:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 452
;451:
;452:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 453
;453:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 0
ASGNF4
line 455
;454:
;455:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 456
;456:		team = attacker->client->sess.sessionTeam;
ADDRLP4 48
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 458
;457:		// add the sprite over the player's head
;458:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 459
;459:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 460
;460:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 462
;461:
;462:		return;
ADDRGP4 $259
JUMPV
LABELV $311
line 465
;463:	}
;464:
;465:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 592
ADDP4
INDIRF4
ASGNF4
ADDRLP4 96
INDIRF4
CNSTF4 0
EQF4 $315
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 96
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $315
line 466
;466:		level.time - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT) {
line 468
;467:		// attacker is on the same team as the skull carrier and
;468:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 470
;469:
;470:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 471
;471:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 0
ASGNF4
line 473
;472:
;473:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 474
;474:		team = attacker->client->sess.sessionTeam;
ADDRLP4 48
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 476
;475:		// add the sprite over the player's head
;476:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 477
;477:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 112
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 478
;478:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 480
;479:
;480:		return;
ADDRGP4 $259
JUMPV
LABELV $315
line 484
;481:	}
;482:
;483://We place the Double Domination bonus test here! This appears to be the best place to place them.
;484:	if ( g_gametype.integer == GT_DOUBLE_D ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 12
NEI4 $319
line 485
;485:		if(attacker->client->sess.sessionTeam == level.pointStatusA ) { //Attack must defend point A
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRGP4 level+10028
INDIRI4
NEI4 $322
line 487
;486:			//See how close attacker and target was to Point A:
;487:			VectorSubtract(targ->r.currentOrigin, ddA->r.currentOrigin, v1);
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 528
ASGNI4
ADDRLP4 108
ADDRGP4 ddA
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 100
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112
CNSTI4 532
ASGNI4
ADDRLP4 24+4
ADDRLP4 100
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 116
CNSTI4 536
ASGNI4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRGP4 ddA
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 488
;488:			VectorSubtract(attacker->r.currentOrigin, ddA->r.currentOrigin, v2);
ADDRLP4 120
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 124
CNSTI4 528
ASGNI4
ADDRLP4 128
ADDRGP4 ddA
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 120
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
ADDRLP4 128
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 132
CNSTI4 532
ASGNI4
ADDRLP4 36+4
ADDRLP4 120
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
ADDRLP4 128
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136
CNSTI4 536
ASGNI4
ADDRLP4 36+8
ADDRFP4 8
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDRGP4 ddA
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 490
;489:
;490:			if ( ( ( VectorLength(v1) < CTF_TARGET_PROTECT_RADIUS &&
ADDRLP4 24
ARGP4
ADDRLP4 140
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1148846080
GEF4 $332
ADDRLP4 144
CNSTI4 528
ASGNI4
ADDRGP4 ddA
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
ARGP4
ADDRLP4 148
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $331
LABELV $332
ADDRLP4 36
ARGP4
ADDRLP4 152
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 1148846080
GEF4 $329
ADDRLP4 156
CNSTI4 528
ASGNI4
ADDRGP4 ddA
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $329
LABELV $331
ADDRLP4 164
CNSTI4 556
ASGNI4
ADDRLP4 168
CNSTI4 1032
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRI4
EQI4 $329
line 494
;491:				trap_InPVS(ddA->r.currentOrigin, targ->r.currentOrigin ) ) ||
;492:				( VectorLength(v2) < CTF_TARGET_PROTECT_RADIUS &&
;493:				trap_InPVS(ddA->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;494:				attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 498
;495:				
;496:				//We defended point A
;497:				//Was we dominating and maybe close to score?
;498:				if(attacker->client->sess.sessionTeam == level.pointStatusB && level.time - level.timeTaken > (10-DD_CLOSE)*1000)
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRGP4 level+10032
INDIRI4
NEI4 $333
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+10036
INDIRI4
SUBI4
CNSTI4 7000
LEI4 $333
line 499
;499:					AddScore(attacker, targ->r.currentOrigin, DD_POINT_DEFENCE_CLOSE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 25
ARGI4
ADDRGP4 AddScore
CALLV
pop
ADDRGP4 $334
JUMPV
LABELV $333
line 501
;500:				else
;501:					AddScore(attacker, targ->r.currentOrigin, DD_POINT_DEFENCE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
LABELV $334
line 502
;502:				attacker->client->pers.teamState.basedefense++;
ADDRLP4 172
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 504
;503:
;504:				attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 176
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 506
;505:                // add the sprite over the player's head
;506:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 180
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 507
;507:				attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 184
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 508
;508:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 510
;509:
;510:				return; //Return so we don't recieve credits for point B also
ADDRGP4 $259
JUMPV
LABELV $329
line 516
;511:
;512:			} //We denfended point A
;513:
;514:
;515:
;516:		} //Defend point A
LABELV $322
line 518
;517:
;518:		if(attacker->client->sess.sessionTeam == level.pointStatusB ) { //Attack must defend point B
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRGP4 level+10032
INDIRI4
NEI4 $259
line 520
;519:			//See how close attacker and target was to Point B:
;520:			VectorSubtract(targ->r.currentOrigin, ddB->r.currentOrigin, v1);
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 528
ASGNI4
ADDRLP4 108
ADDRGP4 ddB
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 100
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112
CNSTI4 532
ASGNI4
ADDRLP4 24+4
ADDRLP4 100
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 116
CNSTI4 536
ASGNI4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRGP4 ddB
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 521
;521:			VectorSubtract(attacker->r.currentOrigin, ddB->r.currentOrigin, v2);
ADDRLP4 120
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 124
CNSTI4 528
ASGNI4
ADDRLP4 128
ADDRGP4 ddB
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 120
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
ADDRLP4 128
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 132
CNSTI4 532
ASGNI4
ADDRLP4 36+4
ADDRLP4 120
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
ADDRLP4 128
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136
CNSTI4 536
ASGNI4
ADDRLP4 36+8
ADDRFP4 8
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDRGP4 ddB
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 523
;522:
;523:			if ( ( ( VectorLength(v1) < CTF_TARGET_PROTECT_RADIUS &&
ADDRLP4 24
ARGP4
ADDRLP4 140
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1148846080
GEF4 $349
ADDRLP4 144
CNSTI4 528
ASGNI4
ADDRGP4 ddB
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
ARGP4
ADDRLP4 148
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $348
LABELV $349
ADDRLP4 36
ARGP4
ADDRLP4 152
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 1148846080
GEF4 $259
ADDRLP4 156
CNSTI4 528
ASGNI4
ADDRGP4 ddB
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $259
LABELV $348
ADDRLP4 164
CNSTI4 556
ASGNI4
ADDRLP4 168
CNSTI4 1032
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRI4
EQI4 $259
line 527
;524:				trap_InPVS(ddB->r.currentOrigin, targ->r.currentOrigin ) ) ||
;525:				( VectorLength(v2) < CTF_TARGET_PROTECT_RADIUS &&
;526:				trap_InPVS(ddB->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;527:				attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 531
;528:				
;529:				//We defended point B
;530:				//Was we dominating and maybe close to score?
;531:				if(attacker->client->sess.sessionTeam == level.pointStatusA && level.time - level.timeTaken > (10-DD_CLOSE)*1000)
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRGP4 level+10028
INDIRI4
NEI4 $350
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+10036
INDIRI4
SUBI4
CNSTI4 7000
LEI4 $350
line 532
;532:					AddScore(attacker, targ->r.currentOrigin, DD_POINT_DEFENCE_CLOSE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 25
ARGI4
ADDRGP4 AddScore
CALLV
pop
ADDRGP4 $351
JUMPV
LABELV $350
line 534
;533:				else
;534:					AddScore(attacker, targ->r.currentOrigin, DD_POINT_DEFENCE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
LABELV $351
line 535
;535:				attacker->client->pers.teamState.basedefense++;
ADDRLP4 172
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 537
;536:
;537:				attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 176
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 539
;538:				// add the sprite over the player's head
;539:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 180
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 540
;540:				attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 184
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 541
;541:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 543
;542:
;543:				return;
ADDRGP4 $259
JUMPV
line 549
;544:
;545:			} //We denfended point B
;546:
;547:
;548:
;549:		} //Defend point B
line 550
;550:	return; //In double Domination we shall not go on, or we would test for team bases that we don't use
LABELV $319
line 557
;551:	}
;552:
;553:	// flag and flag carrier area defense bonuses
;554:
;555:	// we have to find the flag and carrier entities
;556:
;557:	if( g_gametype.integer == GT_OBELISK ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
NEI4 $356
line 559
;558:		// find the team obelisk
;559:		switch (attacker->client->sess.sessionTeam) {
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1
EQI4 $362
ADDRLP4 100
INDIRI4
CNSTI4 2
EQI4 $364
ADDRGP4 $259
JUMPV
LABELV $362
line 561
;560:		case TEAM_RED:
;561:			c = "team_redobelisk";
ADDRLP4 20
ADDRGP4 $363
ASGNP4
line 562
;562:			break;
ADDRGP4 $357
JUMPV
LABELV $364
line 564
;563:		case TEAM_BLUE:
;564:			c = "team_blueobelisk";
ADDRLP4 20
ADDRGP4 $365
ASGNP4
line 565
;565:			break;		
line 567
;566:		default:
;567:			return;
line 570
;568:		}
;569:		
;570:	} else if (g_gametype.integer == GT_HARVESTER ) {
ADDRGP4 $357
JUMPV
LABELV $356
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $366
line 572
;571:		// find the center obelisk
;572:		c = "team_neutralobelisk";
ADDRLP4 20
ADDRGP4 $369
ASGNP4
line 573
;573:	} else {
ADDRGP4 $367
JUMPV
LABELV $366
line 575
;574:	// find the flag
;575:	switch (attacker->client->sess.sessionTeam) {
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1
EQI4 $373
ADDRLP4 100
INDIRI4
CNSTI4 2
EQI4 $375
ADDRGP4 $259
JUMPV
LABELV $373
line 577
;576:	case TEAM_RED:
;577:		c = "team_CTF_redflag";
ADDRLP4 20
ADDRGP4 $374
ASGNP4
line 578
;578:		break;
ADDRGP4 $371
JUMPV
LABELV $375
line 580
;579:	case TEAM_BLUE:
;580:		c = "team_CTF_blueflag";
ADDRLP4 20
ADDRGP4 $376
ASGNP4
line 581
;581:		break;		
line 583
;582:	default:
;583:		return;
LABELV $371
line 586
;584:	}
;585:	// find attacker's team's flag carrier
;586:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $380
JUMPV
LABELV $377
line 587
;587:		carrier = g_entities + i;
ADDRLP4 12
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 588
;588:		if (carrier->inuse && carrier->client->ps.powerups[flag_pw])
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $382
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $382
line 589
;589:			break;
ADDRGP4 $379
JUMPV
LABELV $382
line 590
;590:		carrier = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 591
;591:	}
LABELV $378
line 586
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $380
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $377
LABELV $379
line 592
;592:	}
LABELV $367
LABELV $357
line 593
;593:	flag = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $385
JUMPV
LABELV $384
line 594
;594:	while ((flag = G_Find (flag, FOFS(classname), c)) != NULL) {
line 595
;595:		if (!(flag->flags & FL_DROPPED_ITEM))
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $387
line 596
;596:			break;
ADDRGP4 $386
JUMPV
LABELV $387
line 597
;597:	}
LABELV $385
line 594
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 100
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $384
LABELV $386
line 599
;598:
;599:	if (!flag)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $389
line 600
;600:		return; // can't find attacker's flag
ADDRGP4 $259
JUMPV
LABELV $389
line 605
;601:
;602:	// ok we have the attackers flag and a pointer to the carrier
;603:
;604:	// check to see if we are defending the base's flag
;605:	VectorSubtract(targ->r.currentOrigin, flag->r.currentOrigin, v1);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTI4 528
ASGNI4
ADDRLP4 24
ADDRLP4 104
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 116
CNSTI4 532
ASGNI4
ADDRLP4 24+4
ADDRLP4 104
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120
CNSTI4 536
ASGNI4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 606
;606:	VectorSubtract(attacker->r.currentOrigin, flag->r.currentOrigin, v2);
ADDRLP4 124
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 128
CNSTI4 528
ASGNI4
ADDRLP4 36
ADDRLP4 124
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136
CNSTI4 532
ASGNI4
ADDRLP4 36+4
ADDRLP4 124
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140
CNSTI4 536
ASGNI4
ADDRLP4 36+8
ADDRFP4 8
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 608
;607:
;608:	if ( ( ( VectorLength(v1) < CTF_TARGET_PROTECT_RADIUS &&
ADDRLP4 24
ARGP4
ADDRLP4 144
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 144
INDIRF4
CNSTF4 1148846080
GEF4 $405
ADDRLP4 148
CNSTI4 528
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
ARGP4
ADDRLP4 152
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $404
LABELV $405
ADDRLP4 36
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 156
INDIRF4
CNSTF4 1148846080
GEF4 $395
ADDRLP4 160
CNSTI4 528
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
ARGP4
ADDRLP4 164
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $395
LABELV $404
ADDRLP4 168
CNSTI4 556
ASGNI4
ADDRLP4 172
CNSTI4 1032
ASGNI4
ADDRLP4 176
ADDRFP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 176
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
INDIRI4
EQI4 $395
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $395
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $408
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRGP4 g_elimination_ctf_oneway+12
INDIRI4
ADDRLP4 180
INDIRI4
EQI4 $408
ADDRLP4 184
CNSTI4 2
ASGNI4
ADDRGP4 level+10024
INDIRI4
ADDRGP4 level+10004
INDIRI4
ADDI4
ADDRLP4 184
INDIRI4
MODI4
ADDRLP4 180
INDIRI4
NEI4 $409
ADDRLP4 176
INDIRI4
ADDRLP4 184
INDIRI4
EQI4 $408
LABELV $409
ADDRLP4 188
CNSTI4 1
ASGNI4
ADDRGP4 level+10024
INDIRI4
ADDRGP4 level+10004
INDIRI4
ADDI4
CNSTI4 2
MODI4
ADDRLP4 188
INDIRI4
NEI4 $395
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 188
INDIRI4
NEI4 $395
LABELV $408
line 615
;609:		trap_InPVS(flag->r.currentOrigin, targ->r.currentOrigin ) ) ||
;610:		( VectorLength(v2) < CTF_TARGET_PROTECT_RADIUS &&
;611:		trap_InPVS(flag->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;612:		attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam && g_gametype.integer != GT_ELIMINATION &&
;613:		(g_gametype.integer != GT_CTF_ELIMINATION || !g_elimination_ctf_oneway.integer ||
;614:		((level.eliminationSides+level.roundNumber)%2 == 0 && attacker->client->sess.sessionTeam == TEAM_BLUE ) ||
;615:		((level.eliminationSides+level.roundNumber)%2 == 1 && attacker->client->sess.sessionTeam == TEAM_RED ) ) ) {
line 618
;616:
;617:		// we defended the base flag
;618:		AddScore(attacker, targ->r.currentOrigin, CTF_FLAG_DEFENSE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 619
;619:		attacker->client->pers.teamState.basedefense++;
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 621
;620:
;621:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 623
;622:		// add the sprite over the player's head
;623:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 200
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 200
INDIRP4
ADDRLP4 200
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 624
;624:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 204
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
ADDRLP4 204
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 625
;625:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 627
;626:
;627:		return;
ADDRGP4 $259
JUMPV
LABELV $395
line 630
;628:	}
;629:
;630:	if (carrier && carrier != attacker) {
ADDRLP4 192
ADDRLP4 12
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 192
INDIRU4
CNSTU4 0
EQU4 $411
ADDRLP4 192
INDIRU4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $411
line 631
;631:		VectorSubtract(targ->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
CNSTI4 528
ASGNI4
ADDRLP4 24
ADDRLP4 196
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 208
CNSTI4 532
ASGNI4
ADDRLP4 24+4
ADDRLP4 196
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 212
CNSTI4 536
ASGNI4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 632
;632:		VectorSubtract(attacker->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 216
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 220
CNSTI4 528
ASGNI4
ADDRLP4 24
ADDRLP4 216
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 228
CNSTI4 532
ASGNI4
ADDRLP4 24+4
ADDRLP4 216
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 232
CNSTI4 536
ASGNI4
ADDRLP4 24+8
ADDRFP4 8
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 634
;633:
;634:		if ( ( ( VectorLength(v1) < CTF_ATTACKER_PROTECT_RADIUS &&
ADDRLP4 24
ARGP4
ADDRLP4 236
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 236
INDIRF4
CNSTF4 1148846080
GEF4 $420
ADDRLP4 240
CNSTI4 528
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
ARGP4
ADDRLP4 244
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
NEI4 $419
LABELV $420
ADDRLP4 36
ARGP4
ADDRLP4 248
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 248
INDIRF4
CNSTF4 1148846080
GEF4 $417
ADDRLP4 252
CNSTI4 528
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
ARGP4
ADDRLP4 256
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
EQI4 $417
LABELV $419
ADDRLP4 260
CNSTI4 556
ASGNI4
ADDRLP4 264
CNSTI4 1032
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 260
INDIRI4
ADDP4
INDIRP4
ADDRLP4 264
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 260
INDIRI4
ADDP4
INDIRP4
ADDRLP4 264
INDIRI4
ADDP4
INDIRI4
EQI4 $417
line 638
;635:			trap_InPVS(carrier->r.currentOrigin, targ->r.currentOrigin ) ) ||
;636:			( VectorLength(v2) < CTF_ATTACKER_PROTECT_RADIUS &&
;637:				trap_InPVS(carrier->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;638:			attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 639
;639:			AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 640
;640:			attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 268
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 642
;641:
;642:			attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 272
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 272
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 644
;643:			// add the sprite over the player's head
;644:			attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 276
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
ADDRLP4 276
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 645
;645:			attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 280
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 280
INDIRP4
ADDRLP4 280
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 646
;646:			attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 648
;647:
;648:			return;
LABELV $417
line 650
;649:		}
;650:	}
LABELV $411
line 651
;651:}
LABELV $259
endproc Team_FragBonuses 284 40
export Team_CheckHurtCarrier
proc Team_CheckHurtCarrier 36 0
line 662
;652:
;653:/*
;654:================
;655:Team_CheckHurtCarrier
;656:
;657:Check to see if attacker hurt the flag carrier.  Needed when handing out bonuses for assistance to flag
;658:carrier defense.
;659:================
;660:*/
;661:void Team_CheckHurtCarrier(gentity_t *targ, gentity_t *attacker)
;662:{
line 665
;663:	int flag_pw;
;664:
;665:	if (!targ->client || !attacker->client)
ADDRLP4 4
CNSTI4 556
ASGNI4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $425
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $423
LABELV $425
line 666
;666:		return;
ADDRGP4 $422
JUMPV
LABELV $423
line 668
;667:
;668:	if (targ->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $426
line 669
;669:		flag_pw = PW_BLUEFLAG;
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRGP4 $427
JUMPV
LABELV $426
line 671
;670:	else
;671:		flag_pw = PW_REDFLAG;
ADDRLP4 0
CNSTI4 7
ASGNI4
LABELV $427
line 674
;672:
;673:	// flags
;674:	if (targ->client->ps.powerups[flag_pw] &&
ADDRLP4 12
CNSTI4 556
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $428
ADDRLP4 20
CNSTI4 1032
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $428
line 676
;675:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;676:		attacker->client->pers.teamState.lasthurtcarrier = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 592
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
LABELV $428
line 679
;677:
;678:	// skulls
;679:	if (targ->client->ps.generic1 &&
ADDRLP4 24
CNSTI4 556
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $431
ADDRLP4 32
CNSTI4 1032
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $431
line 681
;680:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;681:		attacker->client->pers.teamState.lasthurtcarrier = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 592
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
LABELV $431
line 682
;682:}
LABELV $422
endproc Team_CheckHurtCarrier 36 0
export Team_ResetFlag
proc Team_ResetFlag 20 12
line 685
;683:
;684:
;685:gentity_t *Team_ResetFlag( int team ) {
line 687
;686:	char *c;
;687:	gentity_t *ent, *rent = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 689
;688:
;689:	switch (team) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $439
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $437
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $438
ADDRGP4 $435
JUMPV
LABELV $437
line 691
;690:	case TEAM_RED:
;691:		c = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $374
ASGNP4
line 692
;692:		break;
ADDRGP4 $436
JUMPV
LABELV $438
line 694
;693:	case TEAM_BLUE:
;694:		c = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $376
ASGNP4
line 695
;695:		break;
ADDRGP4 $436
JUMPV
LABELV $439
line 697
;696:	case TEAM_FREE:
;697:		c = "team_CTF_neutralflag";
ADDRLP4 4
ADDRGP4 $440
ASGNP4
line 698
;698:		break;
ADDRGP4 $436
JUMPV
LABELV $435
line 700
;699:	default:
;700:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $434
JUMPV
LABELV $436
line 703
;701:	}
;702:
;703:	ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $442
JUMPV
LABELV $441
line 704
;704:	while ((ent = G_Find (ent, FOFS(classname), c)) != NULL) {
line 705
;705:		if (ent->flags & FL_DROPPED_ITEM)
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $444
line 706
;706:			G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
ADDRGP4 $445
JUMPV
LABELV $444
line 707
;707:		else {
line 708
;708:			rent = ent;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 709
;709:			RespawnItemCtf(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItemCtf
CALLV
pop
line 710
;710:		}
LABELV $445
line 711
;711:	}
LABELV $442
line 704
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $441
line 713
;712:
;713:	Team_SetFlagStatus( team, FLAG_ATBASE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 715
;714:
;715:	return rent;
ADDRLP4 8
INDIRP4
RETP4
LABELV $434
endproc Team_ResetFlag 20 12
export Team_Dom_SpawnPoints
proc Team_Dom_SpawnPoints 28 12
line 720
;716:}
;717:
;718://Functions for Domination
;719:
;720:void Team_Dom_SpawnPoints( void ) {
line 726
;721:	char *c;
;722:	gentity_t *flag;
;723:	int i;
;724:	gitem_t			*it;
;725:        
;726:        flag = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 728
;727:	
;728:	if(dominationPointsSpawned)
ADDRGP4 dominationPointsSpawned
INDIRI4
CNSTI4 0
EQI4 $447
line 729
;729:		return;
ADDRGP4 $446
JUMPV
LABELV $447
line 730
;730:	dominationPointsSpawned = qtrue;
ADDRGP4 dominationPointsSpawned
CNSTI4 1
ASGNI4
line 732
;731:
;732:	it = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 733
;733:	it = BG_FindItem ("Neutral domination point");
ADDRGP4 $449
ARGP4
ADDRLP4 16
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 734
;734:	if(it == NULL) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $450
line 735
;735:		PrintMsg( NULL, "No domination item\n");
CNSTP4 0
ARGP4
ADDRGP4 $452
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 736
;736:		return;
ADDRGP4 $446
JUMPV
LABELV $450
line 737
;737:	} else {
line 738
;738:		PrintMsg( NULL, "Domination item found\n");
CNSTP4 0
ARGP4
ADDRGP4 $453
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 739
;739:	}
line 740
;740:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 741
;741:	c = "domination_point";
ADDRLP4 12
ADDRGP4 $454
ASGNP4
ADDRGP4 $456
JUMPV
LABELV $455
line 745
;742:	
;743:	//return; Just to test, the lines below crashes game
;744:	
;745:	while ((flag = G_Find (flag, FOFS(classname), c)) != NULL) {
line 746
;746:		if(i>=MAX_DOMINATION_POINTS)
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $458
line 747
;747:			break;
ADDRGP4 $457
JUMPV
LABELV $458
line 749
;748:		//domination_points_names[i] = flag->message;
;749:                if(flag->message) {
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $460
line 750
;750:                    Q_strncpyz(level.domination_points_names[i],flag->message,MAX_DOMINATION_POINTS_NAMES-1);
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 751
;751:                    PrintMsg( NULL, "Domination point \'%s\' found\n",level.domination_points_names[i]);
CNSTP4 0
ARGP4
ADDRGP4 $463
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 752
;752:                } else {
ADDRGP4 $461
JUMPV
LABELV $460
line 753
;753:                    Q_strncpyz(level.domination_points_names[i],va("Point %i",i),MAX_DOMINATION_POINTS_NAMES-1);
ADDRGP4 $466
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 754
;754:                    PrintMsg( NULL, "Domination point \'%s\' found (autonamed)\n",level.domination_points_names[i]);
CNSTP4 0
ARGP4
ADDRGP4 $467
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 755
;755:                }
LABELV $461
line 756
;756:		dom_points[i] = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 757
;757:		VectorCopy( flag->r.currentOrigin, dom_points[i]->s.origin );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 758
;758:		dom_points[i]->classname = it->classname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 8
INDIRP4
INDIRP4
ASGNP4
line 759
;759:		G_SpawnItem(dom_points[i], it);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 760
;760:		FinishSpawningItem(dom_points[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 762
;761:		
;762:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 763
;763:	}
LABELV $456
line 745
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $455
LABELV $457
line 764
;764:	if(!i){
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $469
line 765
;765:		c = "info_player_deathmatch";
ADDRLP4 12
ADDRGP4 $471
ASGNP4
ADDRGP4 $473
JUMPV
LABELV $472
line 766
;766:		while ((flag = G_Find (flag, FOFS(classname), c)) != NULL) {
line 767
;767:		if(i>=MAX_DOMINATION_POINTS)
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $475
line 768
;768:			break;
ADDRGP4 $474
JUMPV
LABELV $475
line 770
;769:		//domination_points_names[i] = flag->message;
;770:                if(flag->message) {
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $477
line 771
;771:                    Q_strncpyz(level.domination_points_names[i],flag->message,MAX_DOMINATION_POINTS_NAMES-1);
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 772
;772:                    PrintMsg( NULL, "Domination point \'%s\' found\n",level.domination_points_names[i]);
CNSTP4 0
ARGP4
ADDRGP4 $463
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 773
;773:                } else {
ADDRGP4 $478
JUMPV
LABELV $477
line 774
;774:                    Q_strncpyz(level.domination_points_names[i],va("Point %i",i),MAX_DOMINATION_POINTS_NAMES-1);
ADDRGP4 $466
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 775
;775:                    PrintMsg( NULL, "Domination point \'%s\' found (autonamed)\n",level.domination_points_names[i]);
CNSTP4 0
ARGP4
ADDRGP4 $467
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 776
;776:                }
LABELV $478
line 777
;777:		dom_points[i] = G_Spawn();
ADDRLP4 24
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
ADDRLP4 24
INDIRP4
ASGNP4
line 778
;778:		VectorCopy( flag->r.currentOrigin, dom_points[i]->s.origin );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 779
;779:		dom_points[i]->classname = it->classname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 8
INDIRP4
INDIRP4
ASGNP4
line 780
;780:		G_SpawnItem(dom_points[i], it);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 781
;781:		FinishSpawningItem(dom_points[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 783
;782:		
;783:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 784
;784:	}	
LABELV $473
line 766
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $472
LABELV $474
line 785
;785:	}
LABELV $469
line 786
;786:	level.domination_points_count = i;
ADDRGP4 level+10076
ADDRLP4 0
INDIRI4
ASGNI4
line 787
;787:}
LABELV $446
endproc Team_Dom_SpawnPoints 28 12
export getDomPointNumber
proc getDomPointNumber 8 0
line 789
;788:
;789:int getDomPointNumber( gentity_t *point ) {
line 791
;790:	int i;
;791:	for(i=1;i<MAX_DOMINATION_POINTS && i<level.domination_points_count;i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $488
JUMPV
LABELV $485
line 792
;792:		if(dom_points[i] == NULL)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $490
line 793
;793:			return 0; //Not found, just return first, so we don't crash
CNSTI4 0
RETI4
ADDRGP4 $484
JUMPV
LABELV $490
line 794
;794:		if(dom_points[i] == point)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $492
line 795
;795:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $484
JUMPV
LABELV $492
line 796
;796:	}
LABELV $486
line 791
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $488
ADDRLP4 0
INDIRI4
CNSTI4 8
GEI4 $494
ADDRLP4 0
INDIRI4
ADDRGP4 level+10076
INDIRI4
LTI4 $485
LABELV $494
line 797
;797:	return 0;
CNSTI4 0
RETI4
LABELV $484
endproc getDomPointNumber 8 0
export Team_Dom_TakePoint
proc Team_Dom_TakePoint 44 28
line 800
;798:}
;799:
;800:void Team_Dom_TakePoint( gentity_t *point, int team, int clientnumber ) {
line 804
;801:	gitem_t			*it;
;802:	vec3_t			origin;
;803:	int i;
;804:	i = getDomPointNumber(point);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 getDomPointNumber
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 805
;805:	if(i<0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $496
line 806
;806:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $496
line 807
;807:	if(i>=MAX_DOMINATION_POINTS)
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $498
line 808
;808:		i = MAX_DOMINATION_POINTS - 1;
ADDRLP4 0
CNSTI4 7
ASGNI4
LABELV $498
line 810
;809:
;810:	it = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 811
;811:	VectorCopy( point->r.currentOrigin, origin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 813
;812:
;813:	if(team == TEAM_RED) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $500
line 814
;814:		it = BG_FindItem ("Red domination point");
ADDRGP4 $502
ARGP4
ADDRLP4 24
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 815
;815:		PrintMsg( NULL, "Red took \'%s\'\n",level.domination_points_names[i]);
CNSTP4 0
ARGP4
ADDRGP4 $503
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 816
;816:	} else
ADDRGP4 $501
JUMPV
LABELV $500
line 817
;817:	if(team == TEAM_BLUE) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $505
line 818
;818:		it = BG_FindItem ("Blue domination point");
ADDRGP4 $507
ARGP4
ADDRLP4 24
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 819
;819:		PrintMsg( NULL, "Blue took \'%s\'\n",level.domination_points_names[i]);
CNSTP4 0
ARGP4
ADDRGP4 $508
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 820
;820:	}
LABELV $505
LABELV $501
line 821
;821:	if (!it || it == NULL) {
ADDRLP4 24
ADDRLP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRU4
ADDRLP4 28
INDIRU4
EQU4 $512
ADDRLP4 24
INDIRU4
ADDRLP4 28
INDIRU4
NEU4 $510
LABELV $512
line 822
;822:		PrintMsg( NULL, "No item\n");
CNSTP4 0
ARGP4
ADDRGP4 $513
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 823
;823:		return;
ADDRGP4 $495
JUMPV
LABELV $510
line 826
;824:	}
;825:
;826:	G_FreeEntity(point);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 828
;827:
;828:	point = G_Spawn();
ADDRLP4 32
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRFP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 830
;829:
;830:	VectorCopy( origin, point->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 831
;831:	point->classname = it->classname;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 4
INDIRP4
INDIRP4
ASGNP4
line 832
;832:	dom_points[i] = point;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dom_points
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 833
;833:	G_SpawnItem(point, it);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 834
;834:	FinishSpawningItem( point );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 835
;835:	level.pointStatusDom[i] = team;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+10040
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 836
;836:        G_LogPrintf( "DOM: %i %i %i %i: %s takes point %s!\n",
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $515
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+10080
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 839
;837:                    clientnumber,i,0,team,
;838:                    TeamName(team),level.domination_points_names[i]);
;839:	SendDominationPointsStatusMessageToAllClients();
ADDRGP4 SendDominationPointsStatusMessageToAllClients
CALLV
pop
line 840
;840:}
LABELV $495
endproc Team_Dom_TakePoint 44 28
export Team_DD_RemovePointAgfx
proc Team_DD_RemovePointAgfx 0 4
line 844
;841:
;842://Functions for Double Domination
;843:
;844:void Team_DD_RemovePointAgfx( void ) {
line 845
;845:	if(ddA!=NULL) {
ADDRGP4 ddA
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $518
line 846
;846:		G_FreeEntity(ddA);
ADDRGP4 ddA
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 847
;847:		ddA = NULL;
ADDRGP4 ddA
CNSTP4 0
ASGNP4
line 848
;848:	}
LABELV $518
line 849
;849:}
LABELV $517
endproc Team_DD_RemovePointAgfx 0 4
export Team_DD_RemovePointBgfx
proc Team_DD_RemovePointBgfx 0 4
line 851
;850:
;851:void Team_DD_RemovePointBgfx( void ) {
line 852
;852:	if(ddB!=NULL) {
ADDRGP4 ddB
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $521
line 853
;853:		G_FreeEntity(ddB);
ADDRGP4 ddB
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 854
;854:		ddB = NULL;
ADDRGP4 ddB
CNSTP4 0
ASGNP4
line 855
;855:	}
LABELV $521
line 856
;856:}
LABELV $520
endproc Team_DD_RemovePointBgfx 0 4
export Team_DD_makeA2team
proc Team_DD_makeA2team 28 8
line 858
;857:
;858:void Team_DD_makeA2team( gentity_t *target, int team ) {
line 861
;859:	gitem_t			*it;
;860:	//gentity_t		*it_ent;
;861:	Team_DD_RemovePointAgfx();
ADDRGP4 Team_DD_RemovePointAgfx
CALLV
pop
line 862
;862:	it = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 863
;863:	if(team == TEAM_NONE)
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $524
line 864
;864:		return;
ADDRGP4 $523
JUMPV
LABELV $524
line 865
;865:	if(team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $526
line 866
;866:		it = BG_FindItem ("Point A (Red)");
ADDRGP4 $528
ARGP4
ADDRLP4 4
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
LABELV $526
line 867
;867:	if(team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $529
line 868
;868:		it = BG_FindItem ("Point A (Blue)");
ADDRGP4 $531
ARGP4
ADDRLP4 8
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $529
line 869
;869:	if(team == TEAM_FREE)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $532
line 870
;870:		it = BG_FindItem ("Point A (White)");
ADDRGP4 $534
ARGP4
ADDRLP4 12
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
LABELV $532
line 871
;871:	if (!it || it == NULL) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRU4
ADDRLP4 20
INDIRU4
EQU4 $537
ADDRLP4 16
INDIRU4
ADDRLP4 20
INDIRU4
NEU4 $535
LABELV $537
line 872
;872:		PrintMsg( NULL, "No item\n");
CNSTP4 0
ARGP4
ADDRGP4 $513
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 873
;873:		return;
ADDRGP4 $523
JUMPV
LABELV $535
line 875
;874:	}
;875:	ddA = G_Spawn();
ADDRLP4 24
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRGP4 ddA
ADDRLP4 24
INDIRP4
ASGNP4
line 877
;876:	
;877:	VectorCopy( target->r.currentOrigin, ddA->s.origin );
ADDRGP4 ddA
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 878
;878:	ddA->classname = it->classname;
ADDRGP4 ddA
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
line 879
;879:	G_SpawnItem(ddA, it);
ADDRGP4 ddA
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 880
;880:	FinishSpawningItem(ddA );
ADDRGP4 ddA
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 881
;881:}
LABELV $523
endproc Team_DD_makeA2team 28 8
export Team_DD_makeB2team
proc Team_DD_makeB2team 28 8
line 883
;882:
;883:void Team_DD_makeB2team( gentity_t *target, int team ) {
line 887
;884:	gitem_t			*it;
;885:	//gentity_t		*it_ent;
;886:	
;887:	Team_DD_RemovePointBgfx();
ADDRGP4 Team_DD_RemovePointBgfx
CALLV
pop
line 888
;888:        it = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 889
;889:	if(team == TEAM_NONE)
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $539
line 890
;890:		return;
ADDRGP4 $538
JUMPV
LABELV $539
line 891
;891:	if(team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $541
line 892
;892:		it = BG_FindItem ("Point B (Red)");
ADDRGP4 $543
ARGP4
ADDRLP4 4
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
LABELV $541
line 893
;893:	if(team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $544
line 894
;894:		it = BG_FindItem ("Point B (Blue)");
ADDRGP4 $546
ARGP4
ADDRLP4 8
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $544
line 895
;895:	if(team == TEAM_FREE)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $547
line 896
;896:		it = BG_FindItem ("Point B (White)");
ADDRGP4 $549
ARGP4
ADDRLP4 12
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
LABELV $547
line 897
;897:	if (!it || it == NULL) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRU4
ADDRLP4 20
INDIRU4
EQU4 $552
ADDRLP4 16
INDIRU4
ADDRLP4 20
INDIRU4
NEU4 $550
LABELV $552
line 898
;898:		PrintMsg( NULL, "No item\n");
CNSTP4 0
ARGP4
ADDRGP4 $513
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 899
;899:		return;
ADDRGP4 $538
JUMPV
LABELV $550
line 901
;900:	}
;901:	ddB = G_Spawn();
ADDRLP4 24
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRGP4 ddB
ADDRLP4 24
INDIRP4
ASGNP4
line 903
;902:	
;903:	VectorCopy( target->r.currentOrigin, ddB->s.origin );
ADDRGP4 ddB
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 904
;904:	ddB->classname = it->classname;
ADDRGP4 ddB
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
line 905
;905:	G_SpawnItem(ddB, it);
ADDRGP4 ddB
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 906
;906:	FinishSpawningItem(ddB );
ADDRGP4 ddB
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 907
;907:}
LABELV $538
endproc Team_DD_makeB2team 28 8
export Team_ResetFlags
proc Team_ResetFlags 0 4
line 909
;908:
;909:void Team_ResetFlags( void ) {
line 910
;910:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTF_ELIMINATION) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $558
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $554
LABELV $558
line 911
;911:		Team_ResetFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 912
;912:		Team_ResetFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 913
;913:	}
ADDRGP4 $555
JUMPV
LABELV $554
line 914
;914:	else if( g_gametype.integer == GT_1FCTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $559
line 915
;915:		Team_ResetFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 916
;916:	}
LABELV $559
LABELV $555
line 917
;917:}
LABELV $553
endproc Team_ResetFlags 0 4
export Team_ReturnFlagSound
proc Team_ReturnFlagSound 12 8
line 919
;918:
;919:void Team_ReturnFlagSound( gentity_t *ent, int team ) {
line 922
;920:	gentity_t	*te;
;921:
;922:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $563
line 923
;923:                G_Printf ("Warning:  NULL passed to Team_ReturnFlagSound\n");
ADDRGP4 $565
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 924
;924:		return;
ADDRGP4 $562
JUMPV
LABELV $563
line 928
;925:	}
;926:
;927:	//See if we are during CTF_ELIMINATION warmup
;928:	if((level.time<=level.roundStartTime && level.time>level.roundStartTime-1000*g_elimination_activewarmup.integer)&&g_gametype.integer == GT_CTF_ELIMINATION)
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+10000
INDIRI4
GTI4 $566
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+10000
INDIRI4
CNSTI4 1000
ADDRGP4 g_elimination_activewarmup+12
INDIRI4
MULI4
SUBI4
LEI4 $566
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $566
line 929
;929:		return;
ADDRGP4 $562
JUMPV
LABELV $566
line 931
;930:
;931:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 932
;932:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $574
line 933
;933:		te->s.eventParm = GTS_RED_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 2
ASGNI4
line 934
;934:	}
ADDRGP4 $575
JUMPV
LABELV $574
line 935
;935:	else {
line 936
;936:		te->s.eventParm = GTS_BLUE_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 3
ASGNI4
line 937
;937:	}
LABELV $575
line 938
;938:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 939
;939:}
LABELV $562
endproc Team_ReturnFlagSound 12 8
export Team_TakeFlagSound
proc Team_TakeFlagSound 16 8
line 941
;940:
;941:void Team_TakeFlagSound( gentity_t *ent, int team ) {
line 944
;942:	gentity_t	*te;
;943:
;944:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $577
line 945
;945:                G_Printf ("Warning:  NULL passed to Team_TakeFlagSound\n");
ADDRGP4 $579
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 946
;946:		return;
ADDRGP4 $576
JUMPV
LABELV $577
line 951
;947:	}
;948:
;949:	// only play sound when the flag was at the base
;950:	// or not picked up the last 10 seconds
;951:	switch(team) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $582
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $593
ADDRGP4 $580
JUMPV
LABELV $582
line 953
;952:		case TEAM_RED:
;953:			if( teamgame.blueStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+12
INDIRI4
CNSTI4 0
EQI4 $583
line 954
;954:				if (teamgame.blueTakenTime > level.time - 10000 && g_gametype.integer != GT_CTF_ELIMINATION)
ADDRGP4 teamgame+24
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $586
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $586
line 955
;955:					return;
ADDRGP4 $576
JUMPV
LABELV $586
line 956
;956:			}
LABELV $583
line 957
;957:			teamgame.blueTakenTime = level.time;
ADDRGP4 teamgame+24
ADDRGP4 level+32
INDIRI4
ASGNI4
line 958
;958:			break;
ADDRGP4 $581
JUMPV
LABELV $593
line 961
;959:
;960:		case TEAM_BLUE:	// CTF
;961:			if( teamgame.redStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+8
INDIRI4
CNSTI4 0
EQI4 $594
line 962
;962:				if (teamgame.redTakenTime > level.time - 10000 && g_gametype.integer != GT_CTF_ELIMINATION)
ADDRGP4 teamgame+20
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $597
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $597
line 963
;963:					return;
ADDRGP4 $576
JUMPV
LABELV $597
line 964
;964:			}
LABELV $594
line 965
;965:			teamgame.redTakenTime = level.time;
ADDRGP4 teamgame+20
ADDRGP4 level+32
INDIRI4
ASGNI4
line 966
;966:			break;
LABELV $580
LABELV $581
line 969
;967:	}
;968:
;969:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 970
;970:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $604
line 971
;971:		te->s.eventParm = GTS_RED_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 4
ASGNI4
line 972
;972:	}
ADDRGP4 $605
JUMPV
LABELV $604
line 973
;973:	else {
line 974
;974:		te->s.eventParm = GTS_BLUE_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 5
ASGNI4
line 975
;975:	}
LABELV $605
line 976
;976:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 977
;977:}
LABELV $576
endproc Team_TakeFlagSound 16 8
export Team_CaptureFlagSound
proc Team_CaptureFlagSound 12 8
line 979
;978:
;979:void Team_CaptureFlagSound( gentity_t *ent, int team ) {
line 982
;980:	gentity_t	*te;
;981:
;982:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $607
line 983
;983:                G_Printf ("Warning:  NULL passed to Team_CaptureFlagSound\n");
ADDRGP4 $609
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 984
;984:		return;
ADDRGP4 $606
JUMPV
LABELV $607
line 987
;985:	}
;986:
;987:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 988
;988:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $610
line 989
;989:		te->s.eventParm = GTS_BLUE_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 1
ASGNI4
line 990
;990:	}
ADDRGP4 $611
JUMPV
LABELV $610
line 991
;991:	else {
line 992
;992:		te->s.eventParm = GTS_RED_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 0
ASGNI4
line 993
;993:	}
LABELV $611
line 994
;994:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 995
;995:}
LABELV $606
endproc Team_CaptureFlagSound 12 8
export Team_ReturnFlag
proc Team_ReturnFlag 12 24
line 997
;996:
;997:void Team_ReturnFlag( int team ) {
line 998
;998:	Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 999
;999:	if( team == TEAM_FREE ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $613
line 1000
;1000:		PrintMsg(NULL, "The flag has returned!\n" );
CNSTP4 0
ARGP4
ADDRGP4 $615
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1001
;1001:                if(g_gametype.integer == GT_1FCTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $614
line 1002
;1002:                    G_LogPrintf( "1FCTF: %i %i %i: The flag was returned!\n", -1, -1, 2 );
ADDRGP4 $619
ARGP4
ADDRLP4 4
CNSTI4 -1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1003
;1003:                }
line 1004
;1004:	}
ADDRGP4 $614
JUMPV
LABELV $613
line 1005
;1005:	else {
line 1006
;1006:		PrintMsg(NULL, "The %s flag has returned!\n", TeamName(team));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $620
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1007
;1007:                if(g_gametype.integer == GT_CTF_ELIMINATION) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $621
line 1008
;1008:                    G_LogPrintf( "CTF: %i %i %i: The %s flag was returned!\n", -1, team, 2, TeamName(team) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $624
ARGP4
CNSTI4 -1
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1009
;1009:                } else
ADDRGP4 $622
JUMPV
LABELV $621
line 1010
;1010:                if(g_gametype.integer == GT_CTF_ELIMINATION) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $625
line 1011
;1011:                    G_LogPrintf( "CTF_ELIMINATION: %i %i %i %i: The %s flag was returned!\n", level.roundNumber, -1, team, 2, TeamName(team) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $628
ARGP4
ADDRGP4 level+10004
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1012
;1012:                }
LABELV $625
LABELV $622
line 1013
;1013:	}
LABELV $614
line 1014
;1014:}
LABELV $612
endproc Team_ReturnFlag 12 24
export Team_FreeEntity
proc Team_FreeEntity 0 4
line 1016
;1015:
;1016:void Team_FreeEntity( gentity_t *ent ) {
line 1017
;1017:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 7
NEI4 $631
line 1018
;1018:		Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 1019
;1019:	}
ADDRGP4 $632
JUMPV
LABELV $631
line 1020
;1020:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 8
NEI4 $633
line 1021
;1021:		Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 1022
;1022:	}
ADDRGP4 $634
JUMPV
LABELV $633
line 1023
;1023:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 9
NEI4 $635
line 1024
;1024:		Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 1025
;1025:	}
LABELV $635
LABELV $634
LABELV $632
line 1026
;1026:}
LABELV $630
endproc Team_FreeEntity 0 4
export Team_DroppedFlagThink
proc Team_DroppedFlagThink 8 8
line 1037
;1027:
;1028:/*
;1029:==============
;1030:Team_DroppedFlagThink
;1031:
;1032:Automatically set in Launch_Item if the item is one of the flags
;1033:
;1034:Flags are unique in that if they are dropped, the base flag must be respawned when they time out
;1035:==============
;1036:*/
;1037:void Team_DroppedFlagThink(gentity_t *ent) {
line 1038
;1038:	int		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1040
;1039:
;1040:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 7
NEI4 $638
line 1041
;1041:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1042
;1042:	}
ADDRGP4 $639
JUMPV
LABELV $638
line 1043
;1043:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 8
NEI4 $640
line 1044
;1044:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1045
;1045:	}
ADDRGP4 $641
JUMPV
LABELV $640
line 1046
;1046:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 9
NEI4 $642
line 1047
;1047:		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1048
;1048:	}
LABELV $642
LABELV $641
LABELV $639
line 1050
;1049:
;1050:	Team_ReturnFlagSound( Team_ResetFlag( team ), team );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 1052
;1051:	// Reset Flag will delete this entity
;1052:}
LABELV $637
endproc Team_DroppedFlagThink 8 8
export updateDDpoints
proc updateDDpoints 0 8
line 1058
;1053:
;1054:/*
;1055:Update DD points
;1056:*/
;1057:
;1058:void updateDDpoints(void) {
line 1060
;1059:	//teamgame.redStatus = -1; // Invalid to force update
;1060:	Team_SetFlagStatus( TEAM_RED, level.pointStatusA );
CNSTI4 1
ARGI4
ADDRGP4 level+10028
INDIRI4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 1062
;1061:	//teamgame.blueStatus = -1; // Invalid to force update
;1062:	Team_SetFlagStatus( TEAM_BLUE, level.pointStatusB );
CNSTI4 2
ARGI4
ADDRGP4 level+10032
INDIRI4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 1063
;1063:}
LABELV $644
endproc updateDDpoints 0 8
export Team_SpawnDoubleDominationPoints
proc Team_SpawnDoubleDominationPoints 12 12
line 1071
;1064:
;1065:/*
;1066:==============
;1067:Team_SpawnDoubleDominationPoints
;1068:==============
;1069:*/
;1070:
;1071:int Team_SpawnDoubleDominationPoints ( void ) {
line 1073
;1072:	gentity_t	*ent;
;1073:	level.pointStatusA = TEAM_FREE;
ADDRGP4 level+10028
CNSTI4 0
ASGNI4
line 1074
;1074:	level.pointStatusB = TEAM_FREE;
ADDRGP4 level+10032
CNSTI4 0
ASGNI4
line 1075
;1075:	updateDDpoints();
ADDRGP4 updateDDpoints
CALLV
pop
line 1076
;1076:	ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1077
;1077:	if ((ent = G_Find (ent, FOFS(classname), "team_CTF_redflag")) != NULL) {
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $374
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $650
line 1078
;1078:		Team_DD_makeA2team( ent, TEAM_FREE );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Team_DD_makeA2team
CALLV
pop
line 1079
;1079:	}
LABELV $650
line 1080
;1080:        ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1081
;1081:	if ((ent = G_Find (ent, FOFS(classname), "team_CTF_blueflag")) != NULL) {
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $376
ARGP4
ADDRLP4 8
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $652
line 1082
;1082:		Team_DD_makeB2team( ent, TEAM_FREE );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Team_DD_makeB2team
CALLV
pop
line 1083
;1083:	}
LABELV $652
line 1084
;1084:	return 1;
CNSTI4 1
RETI4
LABELV $647
endproc Team_SpawnDoubleDominationPoints 12 12
export Team_RemoveDoubleDominationPoints
proc Team_RemoveDoubleDominationPoints 0 8
line 1093
;1085:}
;1086:
;1087:/*
;1088:==============
;1089:Team_RemoveDoubleDominationPoints
;1090:==============
;1091:*/
;1092:
;1093:int Team_RemoveDoubleDominationPoints ( void ) {
line 1094
;1094:	level.pointStatusA = TEAM_NONE;
ADDRGP4 level+10028
CNSTI4 3
ASGNI4
line 1095
;1095:	level.pointStatusB = TEAM_NONE;
ADDRGP4 level+10032
CNSTI4 3
ASGNI4
line 1096
;1096:	updateDDpoints();
ADDRGP4 updateDDpoints
CALLV
pop
line 1097
;1097:	Team_DD_makeA2team( NULL, TEAM_NONE );
CNSTP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Team_DD_makeA2team
CALLV
pop
line 1098
;1098:	Team_DD_makeB2team( NULL, TEAM_NONE );
CNSTP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Team_DD_makeB2team
CALLV
pop
line 1099
;1099:	return 1;
CNSTI4 1
RETI4
LABELV $654
endproc Team_RemoveDoubleDominationPoints 0 8
export Team_TouchDoubleDominationPoint
proc Team_TouchDoubleDominationPoint 44 24
line 1109
;1100:}
;1101:
;1102:/*
;1103:==============
;1104:Team_TouchDoubleDominationPoint
;1105:==============
;1106:*/
;1107:
;1108://team is the either TEAM_RED(A) or TEAM_BLUE(B)
;1109:int Team_TouchDoubleDominationPoint( gentity_t *ent, gentity_t *other, int team ) {
line 1110
;1110:	gclient_t	*cl = other->client;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1112
;1111:	qboolean	otherDominating, isClose;
;1112:	int 		clientTeam = cl->sess.sessionTeam;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 1116
;1113:	int		otherTeam;
;1114:	int		score; //Used to add the scores together 
;1115:
;1116:	if(clientTeam == TEAM_RED)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $658
line 1117
;1117:		otherTeam = TEAM_BLUE;
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRGP4 $659
JUMPV
LABELV $658
line 1119
;1118:	else
;1119:		otherTeam = TEAM_RED;
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $659
line 1121
;1120:
;1121:	otherDominating = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1122
;1122:	isClose = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1124
;1123:
;1124:	if(level.pointStatusA == otherTeam && level.pointStatusB == otherTeam) {
ADDRGP4 level+10028
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $660
ADDRGP4 level+10032
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $660
line 1125
;1125:		otherDominating = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 1126
;1126:		if(level.time - level.timeTaken > (10-DD_CLOSE)*1000)
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+10036
INDIRI4
SUBI4
CNSTI4 7000
LEI4 $664
line 1127
;1127:			isClose = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $664
line 1128
;1128:	}	
LABELV $660
line 1131
;1129:	
;1130:
;1131:	if(team == TEAM_RED) //We have touched point A
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $668
line 1132
;1132:	{
line 1133
;1133:		if(TEAM_NONE == level.pointStatusA)
ADDRGP4 level+10028
INDIRI4
CNSTI4 3
NEI4 $670
line 1134
;1134:			return 0; //Haven't spawned yet
CNSTI4 0
RETI4
ADDRGP4 $657
JUMPV
LABELV $670
line 1135
;1135:		if(clientTeam == level.pointStatusA)
ADDRLP4 0
INDIRI4
ADDRGP4 level+10028
INDIRI4
NEI4 $673
line 1136
;1136:			return 0; //If we already have the flag
CNSTI4 0
RETI4
ADDRGP4 $657
JUMPV
LABELV $673
line 1138
;1137:		//if we didn't have the point, then we have now!
;1138:		level.pointStatusA = clientTeam;
ADDRGP4 level+10028
ADDRLP4 0
INDIRI4
ASGNI4
line 1139
;1139:		PrintMsg( NULL, "%s" S_COLOR_WHITE " (%s) took control of A!\n", cl->pers.netname, TeamName(clientTeam) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $677
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1140
;1140:		Team_DD_makeA2team( ent, clientTeam );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Team_DD_makeA2team
CALLV
pop
line 1141
;1141:                G_LogPrintf( "DD: %i %i %i: %s took point A for %s!\n", cl->ps.clientNum, clientTeam, 0, cl->pers.netname, TeamName(clientTeam) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $678
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1143
;1142:		//Give personal score
;1143:		score = DD_POINT_CAPTURE; //Base score for capture
ADDRLP4 12
CNSTI4 5
ASGNI4
line 1144
;1144:		if(otherDominating){
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $679
line 1145
;1145:			score += DD_POINT_CAPTURE_BREAK;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1146
;1146:			if(isClose)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $681
line 1147
;1147:				score += DD_POINT_CAPTURE_CLOSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
LABELV $681
line 1148
;1148:		}
LABELV $679
line 1149
;1149:		AddScore(other, ent->r.currentOrigin, score);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1151
;1150:		//Do we also have point B?
;1151:		if(clientTeam == level.pointStatusB)
ADDRLP4 0
INDIRI4
ADDRGP4 level+10032
INDIRI4
NEI4 $683
line 1152
;1152:		{
line 1154
;1153:			//We are dominating!
;1154:			level.timeTaken = level.time; //At this time
ADDRGP4 level+10036
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1155
;1155:			PrintMsg( NULL, "%s" S_COLOR_WHITE " is dominating!\n", TeamName(clientTeam) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $688
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1156
;1156:			SendDDtimetakenMessageToAllClients();
ADDRGP4 SendDDtimetakenMessageToAllClients
CALLV
pop
line 1157
;1157:		}
LABELV $683
line 1158
;1158:	}
LABELV $668
line 1160
;1159:
;1160:	if(team == TEAM_BLUE) //We have touched point B
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $689
line 1161
;1161:	{
line 1162
;1162:		if(TEAM_NONE == level.pointStatusB)
ADDRGP4 level+10032
INDIRI4
CNSTI4 3
NEI4 $691
line 1163
;1163:			return 0; //Haven't spawned yet
CNSTI4 0
RETI4
ADDRGP4 $657
JUMPV
LABELV $691
line 1164
;1164:		if(clientTeam == level.pointStatusB)
ADDRLP4 0
INDIRI4
ADDRGP4 level+10032
INDIRI4
NEI4 $694
line 1165
;1165:			return 0; //If we already have the flag
CNSTI4 0
RETI4
ADDRGP4 $657
JUMPV
LABELV $694
line 1167
;1166:		//if we didn't have the point, then we have now!
;1167:		level.pointStatusB = clientTeam;
ADDRGP4 level+10032
ADDRLP4 0
INDIRI4
ASGNI4
line 1168
;1168:		PrintMsg( NULL, "%s" S_COLOR_WHITE " (%s) took control of B!\n", cl->pers.netname, TeamName(clientTeam) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $698
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1169
;1169:		Team_DD_makeB2team( ent, clientTeam );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Team_DD_makeB2team
CALLV
pop
line 1170
;1170:                G_LogPrintf( "DD: %i %i %i: %s took point B for %s!\n", cl->ps.clientNum, clientTeam, 1, cl->pers.netname, TeamName(clientTeam) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $699
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1172
;1171:		//Give personal score
;1172:		score = DD_POINT_CAPTURE; //Base score for capture
ADDRLP4 12
CNSTI4 5
ASGNI4
line 1173
;1173:		if(otherDominating){
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $700
line 1174
;1174:			score += DD_POINT_CAPTURE_BREAK;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1175
;1175:			if(isClose)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $702
line 1176
;1176:				score += DD_POINT_CAPTURE_CLOSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
LABELV $702
line 1177
;1177:		}
LABELV $700
line 1178
;1178:		AddScore(other, ent->r.currentOrigin, score);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1180
;1179:		//Do we also have point A?
;1180:		if(clientTeam == level.pointStatusA)
ADDRLP4 0
INDIRI4
ADDRGP4 level+10028
INDIRI4
NEI4 $704
line 1181
;1181:		{
line 1183
;1182:			//We are dominating!
;1183:			level.timeTaken = level.time; //At this time
ADDRGP4 level+10036
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1184
;1184:			PrintMsg( NULL, "%s" S_COLOR_WHITE " is dominating!\n", TeamName(clientTeam) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $688
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1185
;1185:			SendDDtimetakenMessageToAllClients();
ADDRGP4 SendDDtimetakenMessageToAllClients
CALLV
pop
line 1186
;1186:		}
LABELV $704
line 1187
;1187:	}
LABELV $689
line 1189
;1188:
;1189:	updateDDpoints();
ADDRGP4 updateDDpoints
CALLV
pop
line 1191
;1190:
;1191:	return 0;
CNSTI4 0
RETI4
LABELV $657
endproc Team_TouchDoubleDominationPoint 44 24
export Team_TouchOurFlag
proc Team_TouchOurFlag 60 28
line 1199
;1192:}
;1193:
;1194:/*
;1195:==============
;1196:Team_TouchOurFlag
;1197:==============
;1198:*/
;1199:int Team_TouchOurFlag( gentity_t *ent, gentity_t *other, int team ) {
line 1202
;1200:	int			i;
;1201:	gentity_t	*player;
;1202:	gclient_t	*cl = other->client;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1205
;1203:	int			enemy_flag;
;1204:
;1205:	if( g_gametype.integer == GT_1FCTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $710
line 1206
;1206:		enemy_flag = PW_NEUTRALFLAG;
ADDRLP4 12
CNSTI4 9
ASGNI4
line 1207
;1207:	}
ADDRGP4 $711
JUMPV
LABELV $710
line 1208
;1208:	else {
line 1209
;1209:	if (cl->sess.sessionTeam == TEAM_RED) {
ADDRLP4 8
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $713
line 1210
;1210:		enemy_flag = PW_BLUEFLAG;
ADDRLP4 12
CNSTI4 8
ASGNI4
line 1211
;1211:	} else {
ADDRGP4 $714
JUMPV
LABELV $713
line 1212
;1212:		enemy_flag = PW_REDFLAG;
ADDRLP4 12
CNSTI4 7
ASGNI4
line 1213
;1213:	}
LABELV $714
line 1215
;1214:
;1215:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $715
line 1217
;1216:		// hey, its not home.  return it by teleporting it back
;1217:		PrintMsg( NULL, "%s" S_COLOR_WHITE " returned the %s flag!\n", 
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $717
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1219
;1218:			cl->pers.netname, TeamName(team));
;1219:		AddScore(other, ent->r.currentOrigin, CTF_RECOVERY_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1220
;1220:                if(g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $718
line 1221
;1221:                    G_LogPrintf( "CTF: %i %i %i: %s returned the %s flag!\n", cl->ps.clientNum, team, 2, cl->pers.netname, TeamName(team) );
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $721
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1222
;1222:                } else if(g_gametype.integer == GT_CTF_ELIMINATION) {
ADDRGP4 $719
JUMPV
LABELV $718
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $722
line 1223
;1223:                    G_LogPrintf( "CTF_ELIMINATION: %i %i %i %i: %s returned the %s flag!\n", level.roundNumber, cl->ps.clientNum, team, 2, cl->pers.netname, TeamName(team) );
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $725
ARGP4
ADDRGP4 level+10004
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1224
;1224:                }
LABELV $722
LABELV $719
line 1225
;1225:		other->client->pers.teamState.flagrecovery++;
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 580
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1226
;1226:		other->client->pers.teamState.lastreturnedflag = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 1228
;1227:		//ResetFlag will remove this entity!  We must return zero
;1228:		Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 1229
;1229:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $709
JUMPV
LABELV $715
line 1231
;1230:	}
;1231:	}
LABELV $711
line 1235
;1232:
;1233:	// the flag is at home base.  if the player has the enemy
;1234:	// flag, he's just won!
;1235:	if (!cl->ps.powerups[enemy_flag])
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $728
line 1236
;1236:		return 0; // We don't have the flag
CNSTI4 0
RETI4
ADDRGP4 $709
JUMPV
LABELV $728
line 1237
;1237:	if( g_gametype.integer == GT_1FCTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $730
line 1238
;1238:		PrintMsg( NULL, "%s" S_COLOR_WHITE " captured the flag!\n", cl->pers.netname );
CNSTP4 0
ARGP4
ADDRGP4 $733
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1239
;1239:                G_LogPrintf( "1FCTF: %i %i %i: %s captured the flag!\n", cl->ps.clientNum, -1, 1, cl->pers.netname );
ADDRGP4 $734
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1240
;1240:	}
ADDRGP4 $731
JUMPV
LABELV $730
line 1241
;1241:	else {
line 1242
;1242:            PrintMsg( NULL, "%s" S_COLOR_WHITE " captured the %s flag!\n", cl->pers.netname, TeamName(OtherTeam(team)));
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $735
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1243
;1243:            if(g_gametype.integer == GT_CTF)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $736
line 1244
;1244:                G_LogPrintf( "CTF: %i %i %i: %s captured the %s flag!\n", cl->ps.clientNum, OtherTeam(team), 1, cl->pers.netname, TeamName(OtherTeam(team)) );
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $739
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
LABELV $736
line 1245
;1245:            if(g_gametype.integer == GT_CTF_ELIMINATION)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $740
line 1246
;1246:                G_LogPrintf( "CTF_ELIMINATION: %i %i %i %i: %s captured the %s flag!\n", level.roundNumber, cl->ps.clientNum, OtherTeam(team), 1, cl->pers.netname, TeamName(OtherTeam(team)) );
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $743
ARGP4
ADDRGP4 level+10004
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
LABELV $740
line 1247
;1247:	}
LABELV $731
line 1249
;1248:
;1249:	cl->ps.powerups[enemy_flag] = 0;
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1251
;1250:
;1251:	teamgame.last_flag_capture = level.time;
ADDRGP4 teamgame
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 1252
;1252:	teamgame.last_capture_team = team;
ADDRGP4 teamgame+4
ADDRFP4 8
INDIRI4
ASGNI4
line 1255
;1253:
;1254:	// Increase the team's score
;1255:	AddTeamScore(ent->s.pos.trBase, other->client->sess.sessionTeam, 1);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 1256
;1256:	Team_ForceGesture(other->client->sess.sessionTeam);
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRGP4 Team_ForceGesture
CALLV
pop
line 1258
;1257:	//If CTF Elimination, stop the round:
;1258:	if(g_gametype.integer==GT_CTF_ELIMINATION) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $747
line 1259
;1259:		EndEliminationRound();
ADDRGP4 EndEliminationRound
CALLV
pop
line 1260
;1260:	}
LABELV $747
line 1262
;1261:
;1262:	other->client->pers.teamState.captures++;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 568
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1264
;1263:	// add the sprite over the player's head
;1264:	other->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 1265
;1265:	other->client->ps.eFlags |= EF_AWARD_CAP;
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 1266
;1266:	other->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1267
;1267:	other->client->ps.persistant[PERS_CAPTURES]++;
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1269
;1268:	// other gets another 10 frag bonus
;1269:	AddScore(other, ent->r.currentOrigin, CTF_CAPTURE_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1271
;1270:
;1271:	Team_CaptureFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_CaptureFlagSound
CALLV
pop
line 1274
;1272:
;1273:	// Ok, let's do the player loop, hand out the bonuses
;1274:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $754
JUMPV
LABELV $751
line 1275
;1275:		player = &g_entities[i];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1276
;1276:		if (!player->inuse || player == other)
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $758
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $756
LABELV $758
line 1277
;1277:			continue;
ADDRGP4 $752
JUMPV
LABELV $756
line 1279
;1278:
;1279:		if (player->client->sess.sessionTeam !=
ADDRLP4 36
CNSTI4 1032
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
EQI4 $759
line 1280
;1280:			cl->sess.sessionTeam) {
line 1281
;1281:			player->client->pers.teamState.lasthurtcarrier = -5;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 3231711232
ASGNF4
line 1282
;1282:		} else if (player->client->sess.sessionTeam ==
ADDRGP4 $760
JUMPV
LABELV $759
ADDRLP4 40
CNSTI4 1032
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
NEI4 $761
line 1283
;1283:			cl->sess.sessionTeam) {
line 1284
;1284:			if (player != other)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $763
line 1285
;1285:				AddScore(player, ent->r.currentOrigin, CTF_TEAM_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 25
ARGI4
ADDRGP4 AddScore
CALLV
pop
LABELV $763
line 1287
;1286:			// award extra points for capture assists
;1287:			if (player->client->pers.teamState.lastreturnedflag + 
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 596
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $765
line 1288
;1288:				CTF_RETURN_FLAG_ASSIST_TIMEOUT > level.time) {
line 1289
;1289:				AddScore (player, ent->r.currentOrigin, CTF_RETURN_FLAG_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1290
;1290:				other->client->pers.teamState.assists++;
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 588
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1292
;1291:
;1292:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1294
;1293:				// add the sprite over the player's head
;1294:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 1295
;1295:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 1296
;1296:				player->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1298
;1297:
;1298:			} 
LABELV $765
line 1299
;1299:			if (player->client->pers.teamState.lastfraggedcarrier + 
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $769
line 1300
;1300:				CTF_FRAG_CARRIER_ASSIST_TIMEOUT > level.time) {
line 1301
;1301:				AddScore(player, ent->r.currentOrigin, CTF_FRAG_CARRIER_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1302
;1302:				other->client->pers.teamState.assists++;
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 588
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1303
;1303:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1305
;1304:				// add the sprite over the player's head
;1305:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 1306
;1306:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 1307
;1307:				player->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1308
;1308:			}
LABELV $769
line 1309
;1309:		}
LABELV $761
LABELV $760
line 1310
;1310:	}
LABELV $752
line 1274
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $754
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $751
line 1311
;1311:	Team_ResetFlags();
ADDRGP4 Team_ResetFlags
CALLV
pop
line 1313
;1312:
;1313:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1315
;1314:
;1315:	return 0; // Do not respawn this automatically
CNSTI4 0
RETI4
LABELV $709
endproc Team_TouchOurFlag 60 28
export Team_TouchEnemyFlag
proc Team_TouchEnemyFlag 16 28
line 1318
;1316:}
;1317:
;1318:int Team_TouchEnemyFlag( gentity_t *ent, gentity_t *other, int team ) {
line 1319
;1319:	gclient_t *cl = other->client;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1321
;1320:
;1321:	if( g_gametype.integer == GT_1FCTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $774
line 1322
;1322:		PrintMsg (NULL, "%s" S_COLOR_WHITE " got the flag!\n", other->client->pers.netname );
CNSTP4 0
ARGP4
ADDRGP4 $777
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1324
;1323:
;1324:                G_LogPrintf( "1FCTF: %i %i %i: %s got the flag!\n", cl->ps.clientNum, team, 0, cl->pers.netname);
ADDRGP4 $778
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1326
;1325:                
;1326:		cl->ps.powerups[PW_NEUTRALFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 2147483647
ASGNI4
line 1328
;1327:
;1328:		if( team == TEAM_RED ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $779
line 1329
;1329:			Team_SetFlagStatus( TEAM_FREE, FLAG_TAKEN_RED );
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 1330
;1330:		}
ADDRGP4 $775
JUMPV
LABELV $779
line 1331
;1331:		else {
line 1332
;1332:			Team_SetFlagStatus( TEAM_FREE, FLAG_TAKEN_BLUE );
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 1333
;1333:		}
line 1334
;1334:	}
ADDRGP4 $775
JUMPV
LABELV $774
line 1335
;1335:	else{
line 1336
;1336:		PrintMsg (NULL, "%s" S_COLOR_WHITE " got the %s flag!\n",
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $781
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1339
;1337:			other->client->pers.netname, TeamName(team));
;1338:                
;1339:                if(g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $782
line 1340
;1340:                    G_LogPrintf( "CTF: %i %i %i: %s got the %s flag!\n", cl->ps.clientNum, team, 0, cl->pers.netname, TeamName(team));
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $785
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1341
;1341:                } else if(g_gametype.integer == GT_CTF_ELIMINATION) {
ADDRGP4 $783
JUMPV
LABELV $782
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $786
line 1342
;1342:                    G_LogPrintf( "CTF_ELIMINATION: %i %i %i %i: %s got the %s flag!\n", level.roundNumber, cl->ps.clientNum, team, 0, cl->pers.netname, TeamName(team));
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $789
ARGP4
ADDRGP4 level+10004
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1343
;1343:                }
LABELV $786
LABELV $783
line 1345
;1344:
;1345:		if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $791
line 1346
;1346:			cl->ps.powerups[PW_REDFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 2147483647
ASGNI4
ADDRGP4 $792
JUMPV
LABELV $791
line 1348
;1347:		else
;1348:			cl->ps.powerups[PW_BLUEFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 2147483647
ASGNI4
LABELV $792
line 1350
;1349:
;1350:		Team_SetFlagStatus( team, FLAG_TAKEN );
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 1351
;1351:	}
LABELV $775
line 1353
;1352:
;1353:	AddScore(other, ent->r.currentOrigin, CTF_FLAG_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1354
;1354:	cl->pers.teamState.flagsince = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 1355
;1355:	Team_TakeFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_TakeFlagSound
CALLV
pop
line 1357
;1356:
;1357:	return g_flagrespawn.integer; // Do not respawn this automatically, but do delete it if it was FL_DROPPED
ADDRGP4 g_flagrespawn+12
INDIRI4
RETI4
LABELV $773
endproc Team_TouchEnemyFlag 16 28
export Pickup_Team
proc Pickup_Team 24 28
line 1360
;1358:}
;1359:
;1360:int Pickup_Team( gentity_t *ent, gentity_t *other ) {
line 1362
;1361:	int team;
;1362:	gclient_t *cl = other->client;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1364
;1363:	
;1364:	if( g_gametype.integer == GT_OBELISK ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
NEI4 $796
line 1366
;1365:		// there are no team items that can be picked up in obelisk
;1366:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1367
;1367:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $795
JUMPV
LABELV $796
line 1370
;1368:	}
;1369:
;1370:	if( g_gametype.integer == GT_HARVESTER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $799
line 1372
;1371:		// the only team items that can be picked up in harvester are the cubes
;1372:		if( ent->spawnflags != cl->sess.sessionTeam ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
EQI4 $802
line 1373
;1373:			cl->ps.generic1 += 1; //Skull pickedup
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1374
;1374:                        G_LogPrintf("HARVESTER: %i %i %i %i %i: %s picked up a skull.\n",
ADDRGP4 $804
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1377
;1375:                            cl->ps.clientNum,cl->sess.sessionTeam,3,-1,1,
;1376:                            cl->pers.netname);
;1377:		} else {
ADDRGP4 $803
JUMPV
LABELV $802
line 1378
;1378:                    G_LogPrintf("HARVESTER: %i %i %i %i %i: %s destroyed a skull.\n,",
ADDRGP4 $805
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1381
;1379:                            cl->ps.clientNum,cl->sess.sessionTeam,2,-1,1,
;1380:                            cl->pers.netname);
;1381:                }
LABELV $803
line 1382
;1382:		G_FreeEntity( ent ); //Destory skull
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1383
;1383:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $795
JUMPV
LABELV $799
line 1385
;1384:	}
;1385:	if ( g_gametype.integer == GT_DOMINATION ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 13
NEI4 $806
line 1386
;1386:		Team_Dom_TakePoint(ent, cl->sess.sessionTeam,cl->ps.clientNum);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 Team_Dom_TakePoint
CALLV
pop
line 1387
;1387:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $795
JUMPV
LABELV $806
line 1390
;1388:	}
;1389:	// figure out what team this flag is
;1390:	if( strcmp(ent->classname, "team_CTF_redflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $809
line 1391
;1391:		team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1392
;1392:	}
ADDRGP4 $810
JUMPV
LABELV $809
line 1393
;1393:	else if( strcmp(ent->classname, "team_CTF_blueflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $811
line 1394
;1394:		team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 1395
;1395:	}
ADDRGP4 $812
JUMPV
LABELV $811
line 1396
;1396:	else if( strcmp(ent->classname, "team_CTF_neutralflag") == 0  ) {
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $440
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $813
line 1397
;1397:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1398
;1398:	}
ADDRGP4 $814
JUMPV
LABELV $813
line 1399
;1399:	else {
line 1400
;1400:		PrintMsg ( other, "Don't know what team the flag is on.\n");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $815
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1401
;1401:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $795
JUMPV
LABELV $814
LABELV $812
LABELV $810
line 1403
;1402:	}
;1403:	if( g_gametype.integer == GT_1FCTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $816
line 1404
;1404:		if( team == TEAM_FREE ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $819
line 1405
;1405:			return Team_TouchEnemyFlag( ent, other, cl->sess.sessionTeam );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_TouchEnemyFlag
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $795
JUMPV
LABELV $819
line 1407
;1406:		}
;1407:		if( team != cl->sess.sessionTeam) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
EQI4 $821
line 1408
;1408:			return Team_TouchOurFlag( ent, other, cl->sess.sessionTeam );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_TouchOurFlag
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $795
JUMPV
LABELV $821
line 1410
;1409:		}
;1410:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $795
JUMPV
LABELV $816
line 1412
;1411:	}
;1412:	if( g_gametype.integer == GT_DOUBLE_D) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 12
NEI4 $823
line 1413
;1413:		return Team_TouchDoubleDominationPoint( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_TouchDoubleDominationPoint
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $795
JUMPV
LABELV $823
line 1416
;1414:	}
;1415:	// GT_CTF
;1416:	if( team == cl->sess.sessionTeam) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
NEI4 $826
line 1417
;1417:		return Team_TouchOurFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_TouchOurFlag
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $795
JUMPV
LABELV $826
line 1419
;1418:	}
;1419:	return Team_TouchEnemyFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_TouchEnemyFlag
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
LABELV $795
endproc Pickup_Team 24 28
export Team_GetLocation
proc Team_GetLocation 48 8
line 1430
;1420:}
;1421:
;1422:/*
;1423:===========
;1424:Team_GetLocation
;1425:
;1426:Report a location for the player. Uses placed nearby target_location entities
;1427:============
;1428:*/
;1429:gentity_t *Team_GetLocation(gentity_t *ent)
;1430:{
line 1435
;1431:	gentity_t		*eloc, *best;
;1432:	float			bestlen, len;
;1433:	vec3_t			origin;
;1434:
;1435:	best = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 1436
;1436:	bestlen = 3*8192.0*8192.0;
ADDRLP4 20
CNSTF4 1296039936
ASGNF4
line 1438
;1437:
;1438:	VectorCopy( ent->r.currentOrigin, origin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 1440
;1439:
;1440:	for (eloc = level.locationHead; eloc; eloc = eloc->nextTrain) {
ADDRLP4 0
ADDRGP4 level+9956
INDIRP4
ASGNP4
ADDRGP4 $832
JUMPV
LABELV $829
line 1441
;1441:		len = ( origin[0] - eloc->r.currentOrigin[0] ) * ( origin[0] - eloc->r.currentOrigin[0] )
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1445
;1442:			+ ( origin[1] - eloc->r.currentOrigin[1] ) * ( origin[1] - eloc->r.currentOrigin[1] )
;1443:			+ ( origin[2] - eloc->r.currentOrigin[2] ) * ( origin[2] - eloc->r.currentOrigin[2] );
;1444:
;1445:		if ( len > bestlen ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
LEF4 $838
line 1446
;1446:			continue;
ADDRGP4 $830
JUMPV
LABELV $838
line 1449
;1447:		}
;1448:
;1449:		if ( !trap_InPVS( origin, eloc->r.currentOrigin ) ) {
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $840
line 1450
;1450:			continue;
ADDRGP4 $830
JUMPV
LABELV $840
line 1453
;1451:		}
;1452:
;1453:		bestlen = len;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 1454
;1454:		best = eloc;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 1455
;1455:	}
LABELV $830
line 1440
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ASGNP4
LABELV $832
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $829
line 1457
;1456:
;1457:	return best;
ADDRLP4 24
INDIRP4
RETP4
LABELV $828
endproc Team_GetLocation 48 8
export Team_GetLocationMsg
proc Team_GetLocationMsg 12 24
line 1469
;1458:}
;1459:
;1460:
;1461:/*
;1462:===========
;1463:Team_GetLocation
;1464:
;1465:Report a location for the player. Uses placed nearby target_location entities
;1466:============
;1467:*/
;1468:qboolean Team_GetLocationMsg(gentity_t *ent, char *loc, int loclen)
;1469:{
line 1472
;1470:	gentity_t *best;
;1471:
;1472:	best = Team_GetLocation( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1474
;1473:	
;1474:	if (!best)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $843
line 1475
;1475:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $842
JUMPV
LABELV $843
line 1477
;1476:
;1477:	if (best->count) {
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 0
EQI4 $845
line 1478
;1478:		if (best->count < 0)
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 0
GEI4 $847
line 1479
;1479:			best->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 0
ASGNI4
LABELV $847
line 1480
;1480:		if (best->count > 7)
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 7
LEI4 $849
line 1481
;1481:			best->count = 7;
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 7
ASGNI4
LABELV $849
line 1482
;1482:		Com_sprintf(loc, loclen, "%c%c%s" S_COLOR_WHITE, Q_COLOR_ESCAPE, best->count + '0', best->message );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $851
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1483
;1483:	} else
ADDRGP4 $846
JUMPV
LABELV $845
line 1484
;1484:		Com_sprintf(loc, loclen, "%s", best->message);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $852
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $846
line 1486
;1485:
;1486:	return qtrue;
CNSTI4 1
RETI4
LABELV $842
endproc Team_GetLocationMsg 12 24
export SelectRandomTeamSpawnPoint
proc SelectRandomTeamSpawnPoint 152 12
line 1500
;1487:}
;1488:
;1489:
;1490:/*---------------------------------------------------------------------------*/
;1491:
;1492:/*
;1493:================
;1494:SelectRandomDeathmatchSpawnPoint
;1495:
;1496:go to a random point that doesn't telefrag
;1497:================
;1498:*/
;1499:#define	MAX_TEAM_SPAWN_POINTS	32
;1500:gentity_t *SelectRandomTeamSpawnPoint( int teamstate, team_t team ) {
line 1507
;1501:	gentity_t	*spot;
;1502:	int			count;
;1503:	int			selection;
;1504:	gentity_t	*spots[MAX_TEAM_SPAWN_POINTS];
;1505:	char		*classname;
;1506:
;1507:	if(g_gametype.integer == GT_ELIMINATION) { //change sides every round
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
NEI4 $854
line 1508
;1508:		if((level.roundNumber+level.eliminationSides)%2==1){
ADDRGP4 level+10004
INDIRI4
ADDRGP4 level+10024
INDIRI4
ADDI4
CNSTI4 2
MODI4
CNSTI4 1
NEI4 $857
line 1509
;1509:			if(team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $861
line 1510
;1510:				team = TEAM_BLUE;
ADDRFP4 4
CNSTI4 2
ASGNI4
ADDRGP4 $862
JUMPV
LABELV $861
line 1511
;1511:			else if(team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $863
line 1512
;1512:				team = TEAM_RED;
ADDRFP4 4
CNSTI4 1
ASGNI4
LABELV $863
LABELV $862
line 1513
;1513:		}
LABELV $857
line 1514
;1514:	}
LABELV $854
line 1516
;1515:
;1516:	if (teamstate == TEAM_BEGIN) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $865
line 1517
;1517:		if (team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $867
line 1518
;1518:			classname = "team_CTF_redplayer";
ADDRLP4 8
ADDRGP4 $869
ASGNP4
ADDRGP4 $866
JUMPV
LABELV $867
line 1519
;1519:		else if (team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $870
line 1520
;1520:			classname = "team_CTF_blueplayer";
ADDRLP4 8
ADDRGP4 $872
ASGNP4
ADDRGP4 $866
JUMPV
LABELV $870
line 1522
;1521:		else
;1522:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $853
JUMPV
line 1523
;1523:	} else {
LABELV $865
line 1524
;1524:		if (team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $873
line 1525
;1525:			classname = "team_CTF_redspawn";
ADDRLP4 8
ADDRGP4 $875
ASGNP4
ADDRGP4 $874
JUMPV
LABELV $873
line 1526
;1526:		else if (team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $876
line 1527
;1527:			classname = "team_CTF_bluespawn";
ADDRLP4 8
ADDRGP4 $878
ASGNP4
ADDRGP4 $877
JUMPV
LABELV $876
line 1529
;1528:		else
;1529:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $853
JUMPV
LABELV $877
LABELV $874
line 1530
;1530:	}
LABELV $866
line 1531
;1531:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1533
;1532:
;1533:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $880
JUMPV
LABELV $879
line 1535
;1534:
;1535:	while ((spot = G_Find (spot, FOFS(classname), classname)) != NULL) {
line 1536
;1536:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $882
line 1537
;1537:			continue;
ADDRGP4 $880
JUMPV
LABELV $882
line 1539
;1538:		}
;1539:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1540
;1540:		if (++count == MAX_TEAM_SPAWN_POINTS)
ADDRLP4 148
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 32
NEI4 $884
line 1541
;1541:			break;
ADDRGP4 $881
JUMPV
LABELV $884
line 1542
;1542:	}
LABELV $880
line 1535
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 144
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $879
LABELV $881
line 1544
;1543:
;1544:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $886
line 1545
;1545:		return G_Find( NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 564
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
RETP4
ADDRGP4 $853
JUMPV
LABELV $886
line 1548
;1546:	}
;1547:
;1548:	selection = rand() % count;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 148
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 1549
;1549:	return spots[ selection ];
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
RETP4
LABELV $853
endproc SelectRandomTeamSpawnPoint 152 12
export SelectRandomDDSpawnPoint
proc SelectRandomDDSpawnPoint 152 12
line 1560
;1550:}
;1551:
;1552:/*
;1553:================
;1554:SelectRandomDDSpawnPoint
;1555:
;1556:go to a random Double Domination Spawn Point
;1557:================
;1558:*/
;1559:#define	MAX_TEAM_SPAWN_POINTS	32
;1560:gentity_t *SelectRandomDDSpawnPoint( void ) {
line 1568
;1561:	gentity_t	*spot;
;1562:	int			count;
;1563:	int			selection;
;1564:	gentity_t	*spots[MAX_TEAM_SPAWN_POINTS];
;1565:	char		*classname;
;1566:
;1567:	
;1568:	classname = "info_player_dd";
ADDRLP4 8
ADDRGP4 $889
ASGNP4
line 1570
;1569:		
;1570:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1572
;1571:
;1572:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $891
JUMPV
LABELV $890
line 1574
;1573:
;1574:	while ((spot = G_Find (spot, FOFS(classname), classname)) != NULL) {
line 1575
;1575:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $893
line 1576
;1576:			continue;
ADDRGP4 $891
JUMPV
LABELV $893
line 1578
;1577:		}
;1578:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1579
;1579:		if (++count == MAX_TEAM_SPAWN_POINTS)
ADDRLP4 148
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 32
NEI4 $895
line 1580
;1580:			break;
ADDRGP4 $892
JUMPV
LABELV $895
line 1581
;1581:	}
LABELV $891
line 1574
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 144
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $890
LABELV $892
line 1583
;1582:
;1583:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $897
line 1584
;1584:		return G_Find( NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 564
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
RETP4
ADDRGP4 $888
JUMPV
LABELV $897
line 1587
;1585:	}
;1586:
;1587:	selection = rand() % count;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 148
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 1588
;1588:	return spots[ selection ];
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
RETP4
LABELV $888
endproc SelectRandomDDSpawnPoint 152 12
export SelectRandomTeamDDSpawnPoint
proc SelectRandomTeamDDSpawnPoint 152 12
line 1591
;1589:}
;1590:
;1591:gentity_t *SelectRandomTeamDDSpawnPoint( team_t team ) {
line 1598
;1592:	gentity_t	*spot;
;1593:	int			count;
;1594:	int			selection;
;1595:	gentity_t	*spots[MAX_TEAM_SPAWN_POINTS];
;1596:	char		*classname;
;1597:
;1598:	if(team == TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $900
line 1599
;1599:            classname = "info_player_dd_red";
ADDRLP4 8
ADDRGP4 $902
ASGNP4
ADDRGP4 $901
JUMPV
LABELV $900
line 1601
;1600:        else
;1601:            classname = "info_player_dd_blue";
ADDRLP4 8
ADDRGP4 $903
ASGNP4
LABELV $901
line 1603
;1602:		
;1603:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1605
;1604:
;1605:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $905
JUMPV
LABELV $904
line 1607
;1606:
;1607:	while ((spot = G_Find (spot, FOFS(classname), classname)) != NULL) {
line 1608
;1608:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $907
line 1609
;1609:			continue;
ADDRGP4 $905
JUMPV
LABELV $907
line 1611
;1610:		}
;1611:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1612
;1612:		if (++count == MAX_TEAM_SPAWN_POINTS)
ADDRLP4 148
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 32
NEI4 $909
line 1613
;1613:			break;
ADDRGP4 $906
JUMPV
LABELV $909
line 1614
;1614:	}
LABELV $905
line 1607
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 144
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $904
LABELV $906
line 1616
;1615:
;1616:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $911
line 1617
;1617:		return G_Find( NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 564
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
RETP4
ADDRGP4 $899
JUMPV
LABELV $911
line 1620
;1618:	}
;1619:
;1620:	selection = rand() % count;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 148
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 1621
;1621:	return spots[ selection ];
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
RETP4
LABELV $899
endproc SelectRandomTeamDDSpawnPoint 152 12
export SelectCTFSpawnPoint
proc SelectCTFSpawnPoint 12 12
line 1631
;1622:}
;1623:
;1624:
;1625:/*
;1626:===========
;1627:SelectCTFSpawnPoint
;1628:
;1629:============
;1630:*/
;1631:gentity_t *SelectCTFSpawnPoint ( team_t team, int teamstate, vec3_t origin, vec3_t angles ) {
line 1634
;1632:	gentity_t	*spot;
;1633:
;1634:	spot = SelectRandomTeamSpawnPoint ( teamstate, team );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SelectRandomTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1637
;1635:
;1636:
;1637:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $914
line 1638
;1638:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $913
JUMPV
LABELV $914
line 1641
;1639:	}
;1640:
;1641:	VectorCopy (spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1642
;1642:	origin[2] += 9;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 1643
;1643:	VectorCopy (spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 1645
;1644:
;1645:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $913
endproc SelectCTFSpawnPoint 12 12
export SelectDoubleDominationSpawnPoint
proc SelectDoubleDominationSpawnPoint 12 12
line 1654
;1646:}
;1647:
;1648:/*
;1649:===========
;1650:SelectDoubleDominationSpawnPoint
;1651:
;1652:============
;1653:*/
;1654:gentity_t *SelectDoubleDominationSpawnPoint ( team_t team, vec3_t origin, vec3_t angles ) {
line 1657
;1655:	gentity_t	*spot;
;1656:
;1657:        spot = SelectRandomTeamDDSpawnPoint( team );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SelectRandomTeamDDSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1659
;1658:        
;1659:        if(!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $917
line 1660
;1660:            spot = SelectRandomDDSpawnPoint ( );
ADDRLP4 8
ADDRGP4 SelectRandomDDSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1661
;1661:        }
LABELV $917
line 1663
;1662:        
;1663:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $919
line 1664
;1664:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $916
JUMPV
LABELV $919
line 1667
;1665:	}
;1666:
;1667:	VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1668
;1668:	origin[2] += 9;
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
CNSTF4 1091567616
ADDF4
ASGNF4
line 1669
;1669:	VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 1671
;1670:
;1671:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $916
endproc SelectDoubleDominationSpawnPoint 12 12
proc SortClients 0 0
line 1676
;1672:}
;1673:
;1674:/*---------------------------------------------------------------------------*/
;1675:
;1676:static int QDECL SortClients( const void *a, const void *b ) {
line 1677
;1677:	return *(int *)a - *(int *)b;
ADDRFP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
SUBI4
RETI4
LABELV $921
endproc SortClients 0 0
export TeamplayInfoMessage
proc TeamplayInfoMessage 9404 36
line 1690
;1678:}
;1679:
;1680:
;1681:/*
;1682:==================
;1683:TeamplayLocationsMessage
;1684:
;1685:Format:
;1686:	clientNum location health armor weapon powerups
;1687:
;1688:==================
;1689:*/
;1690:void TeamplayInfoMessage( gentity_t *ent ) {
line 1700
;1691:	char		entry[1024];
;1692:	char		string[8192];
;1693:	int			stringlength;
;1694:	int			i, j;
;1695:	gentity_t	*player;
;1696:	int			cnt;
;1697:	int			h, a, w;
;1698:	int			clients[TEAM_MAXOVERLAY];
;1699:
;1700:	if ( ! ent->client->pers.teamInfo )
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
NEI4 $923
line 1701
;1701:		return;
ADDRGP4 $922
JUMPV
LABELV $923
line 1706
;1702:
;1703:	// figure out what client should be on the display
;1704:	// we are limited to 8, but we want to use the top eight players
;1705:	// but in client order (so they don't keep changing position on the overlay)
;1706:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9376
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRGP4 $928
JUMPV
LABELV $925
line 1707
;1707:		player = g_entities + level.sortedClients[i];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1708
;1708:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $931
ADDRLP4 9384
CNSTI4 556
ASGNI4
ADDRLP4 9388
CNSTI4 1032
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
NEI4 $931
line 1709
;1709:			ent->client->sess.sessionTeam ) {
line 1710
;1710:			clients[cnt++] = level.sortedClients[i];
ADDRLP4 9392
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9392
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 9396
CNSTI4 2
ASGNI4
ADDRLP4 9392
INDIRI4
ADDRLP4 9396
INDIRI4
LSHI4
ADDRLP4 9248
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 9396
INDIRI4
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
line 1711
;1711:		}
LABELV $931
line 1712
;1712:	}
LABELV $926
line 1706
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $928
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $934
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $925
LABELV $934
line 1715
;1713:
;1714:	// We have the top eight players, sort them by clientNum
;1715:	qsort( clients, cnt, sizeof( clients[0] ), SortClients );
ADDRLP4 9248
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortClients
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1718
;1716:
;1717:	// send the latest information on all clients
;1718:	string[0] = 0;
ADDRLP4 1056
CNSTI1 0
ASGNI1
line 1719
;1719:	stringlength = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 1721
;1720:
;1721:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9380
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9380
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9380
INDIRI4
ASGNI4
ADDRGP4 $938
JUMPV
LABELV $935
line 1722
;1722:		player = g_entities + i;
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1723
;1723:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $940
ADDRLP4 9388
CNSTI4 556
ASGNI4
ADDRLP4 9392
CNSTI4 1032
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9392
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9392
INDIRI4
ADDP4
INDIRI4
NEI4 $940
line 1724
;1724:			ent->client->sess.sessionTeam ) {
line 1726
;1725:
;1726:			h = player->client->ps.stats[STAT_HEALTH];
ADDRLP4 1036
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1727
;1727:			a = player->client->ps.stats[STAT_ARMOR];
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1728
;1728:			w = player->client->ps.weapon;
ADDRLP4 1052
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 1729
;1729:			if(player->client->isEliminated)
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $942
line 1730
;1730:			{
line 1731
;1731:				h = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 1732
;1732:				a = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 1733
;1733:				w = 0;
ADDRLP4 1052
CNSTI4 0
ASGNI4
line 1734
;1734:			}			
LABELV $942
line 1735
;1735:			if (h < 0) h = 0;
ADDRLP4 1036
INDIRI4
CNSTI4 0
GEI4 $944
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $944
line 1736
;1736:			if (a < 0) a = 0;
ADDRLP4 1040
INDIRI4
CNSTI4 0
GEI4 $946
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $946
line 1738
;1737:
;1738:			Com_sprintf (entry, sizeof(entry),
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $948
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1743
;1739:				" %i %i %i %i %i %i", 
;1740://				level.sortedClients[i], player->client->pers.teamState.location, h, a, 
;1741:				i, player->client->pers.teamState.location, h, a, 
;1742:				w, player->s.powerups);
;1743:			j = strlen(entry);
ADDRLP4 12
ARGP4
ADDRLP4 9400
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 9400
INDIRI4
ASGNI4
line 1744
;1744:			if (stringlength + j > sizeof(string))
ADDRLP4 1044
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
CVIU4 4
CNSTU4 8192
LEU4 $949
line 1745
;1745:				break;
ADDRGP4 $937
JUMPV
LABELV $949
line 1746
;1746:			strcpy (string + stringlength, entry);
ADDRLP4 1044
INDIRI4
ADDRLP4 1056
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1747
;1747:			stringlength += j;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
ASGNI4
line 1748
;1748:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1749
;1749:		}
LABELV $940
line 1750
;1750:	}
LABELV $936
line 1721
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $938
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $951
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $935
LABELV $951
LABELV $937
line 1752
;1751:
;1752:	trap_SendServerCommand( ent-g_entities, va("tinfo %i %s", cnt, string) );
ADDRGP4 $952
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1056
ARGP4
ADDRLP4 9384
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
ADDRLP4 9384
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1753
;1753:}
LABELV $922
endproc TeamplayInfoMessage 9404 36
export CheckTeamStatus
proc CheckTeamStatus 24 4
line 1755
;1754:
;1755:void CheckTeamStatus(void) {
line 1759
;1756:	int i;
;1757:	gentity_t *loc, *ent;
;1758:
;1759:	if (level.time - level.lastTeamLocationTime > TEAM_LOCATION_UPDATE_TIME) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+60
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $954
line 1761
;1760:
;1761:		level.lastTeamLocationTime = level.time;
ADDRGP4 level+60
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1763
;1762:
;1763:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $963
JUMPV
LABELV $960
line 1764
;1764:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1766
;1765:
;1766:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $965
line 1767
;1767:				continue;
ADDRGP4 $961
JUMPV
LABELV $965
line 1770
;1768:			}
;1769:
;1770:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $967
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $969
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $967
LABELV $969
line 1771
;1771:				loc = Team_GetLocation( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1772
;1772:				if (loc)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $970
line 1773
;1773:					ent->client->pers.teamState.location = loc->health;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $971
JUMPV
LABELV $970
line 1775
;1774:				else
;1775:					ent->client->pers.teamState.location = 0;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 0
ASGNI4
LABELV $971
line 1776
;1776:			}
LABELV $967
line 1777
;1777:		}
LABELV $961
line 1763
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $963
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $960
line 1779
;1778:
;1779:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $975
JUMPV
LABELV $972
line 1780
;1780:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1782
;1781:
;1782:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $977
line 1783
;1783:				continue;
ADDRGP4 $973
JUMPV
LABELV $977
line 1786
;1784:			}
;1785:
;1786:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $979
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $981
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $979
LABELV $981
line 1787
;1787:				TeamplayInfoMessage( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 TeamplayInfoMessage
CALLV
pop
line 1788
;1788:			}
LABELV $979
line 1789
;1789:		}
LABELV $973
line 1779
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $975
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $972
line 1790
;1790:	}
LABELV $954
line 1791
;1791:}
LABELV $953
endproc CheckTeamStatus 24 4
export SP_team_CTF_redplayer
proc SP_team_CTF_redplayer 8 4
line 1798
;1792:
;1793:/*-----------------------------------------------------------------*/
;1794:
;1795:/*QUAKED team_CTF_redplayer (1 0 0) (-16 -16 -16) (16 16 32)
;1796:Only in CTF games.  Red players spawn here at game start.
;1797:*/
;1798:void SP_team_CTF_redplayer( gentity_t *ent ) {
line 1799
;1799:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
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
line 1800
;1800:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1801
;1801:	ent->classname = "team_CTF_redplayer";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $869
ASGNP4
line 1802
;1802:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1803
;1803:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1804
;1804:	VectorSet( ent->r.mins, -10, -10, -10);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3240099840
ASGNF4
line 1805
;1805:	VectorSet( ent->r.maxs, 10, 10, 10 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1092616192
ASGNF4
line 1806
;1806:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 1809
;1807:	//ent->s.modelindex = G_ModelIndex( "45.md3" );
;1808:	
;1809:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1810
;1810:}
LABELV $982
endproc SP_team_CTF_redplayer 8 4
export SP_team_CTF_blueplayer
proc SP_team_CTF_blueplayer 8 4
line 1816
;1811:
;1812:
;1813:/*QUAKED team_CTF_blueplayer (0 0 1) (-16 -16 -16) (16 16 32)
;1814:Only in CTF games.  Blue players spawn here at game start.
;1815:*/
;1816:void SP_team_CTF_blueplayer( gentity_t *ent ) {
line 1817
;1817:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
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
line 1818
;1818:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1819
;1819:	ent->classname = "team_CTF_blueplayer";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $872
ASGNP4
line 1820
;1820:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1821
;1821:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1822
;1822:	VectorSet( ent->r.mins, -10, -10, -10);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3240099840
ASGNF4
line 1823
;1823:	VectorSet( ent->r.maxs, 10, 10, 10 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1092616192
ASGNF4
line 1824
;1824:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 1827
;1825:	//ent->s.modelindex = G_ModelIndex( "45.md3" );
;1826:	
;1827:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1828
;1828:}
LABELV $983
endproc SP_team_CTF_blueplayer 8 4
export SP_team_CTF_redspawn
proc SP_team_CTF_redspawn 8 4
line 1835
;1829:
;1830:
;1831:/*QUAKED team_CTF_redspawn (1 0 0) (-16 -16 -24) (16 16 32)
;1832:potential spawning position for red team in CTF games.
;1833:Targets will be fired when someone spawns in on them.
;1834:*/
;1835:void SP_team_CTF_redspawn(gentity_t *ent) {
line 1836
;1836:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
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
line 1837
;1837:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1838
;1838:	ent->classname = "team_CTF_redspawn";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $875
ASGNP4
line 1839
;1839:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1840
;1840:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1841
;1841:	VectorSet( ent->r.mins, -10, -10, -10);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3240099840
ASGNF4
line 1842
;1842:	VectorSet( ent->r.maxs, 10, 10, 10 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1092616192
ASGNF4
line 1843
;1843:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 1846
;1844:	//ent->s.modelindex = G_ModelIndex( "45.md3" );
;1845:	
;1846:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1847
;1847:}
LABELV $984
endproc SP_team_CTF_redspawn 8 4
export SP_team_CTF_bluespawn
proc SP_team_CTF_bluespawn 8 4
line 1853
;1848:
;1849:/*QUAKED team_CTF_bluespawn (0 0 1) (-16 -16 -24) (16 16 32)
;1850:potential spawning position for blue team in CTF games.
;1851:Targets will be fired when someone spawns in on them.
;1852:*/
;1853:void SP_team_CTF_bluespawn(gentity_t *ent) {
line 1854
;1854:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
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
line 1855
;1855:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1856
;1856:	ent->classname = "team_CTF_bluespawn";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $878
ASGNP4
line 1857
;1857:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1858
;1858:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1859
;1859:	VectorSet( ent->r.mins, -10, -10, -10);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3240099840
ASGNF4
line 1860
;1860:	VectorSet( ent->r.maxs, 10, 10, 10 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1092616192
ASGNF4
line 1861
;1861:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 1864
;1862:	//ent->s.modelindex = G_ModelIndex( "45.md3" );
;1863:	
;1864:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1865
;1865:}
LABELV $985
endproc SP_team_CTF_bluespawn 8 4
proc ObeliskHealthChange 8 0
line 1873
;1866:
;1867:/*
;1868:================
;1869:Obelisks
;1870:================
;1871:*/
;1872:
;1873:static void ObeliskHealthChange( int team, int health ) {
line 1875
;1874:    int currentPercentage;
;1875:    int percentage = (health*100)/g_obeliskHealth.integer;
ADDRLP4 0
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 g_obeliskHealth+12
INDIRI4
DIVI4
ASGNI4
line 1876
;1876:    if(percentage < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $988
line 1877
;1877:        percentage = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $988
line 1878
;1878:    currentPercentage = level.healthRedObelisk;
ADDRLP4 4
ADDRGP4 level+10272
INDIRI4
ASGNI4
line 1879
;1879:    if(team != TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
EQI4 $991
line 1880
;1880:        currentPercentage = level.healthBlueObelisk;
ADDRLP4 4
ADDRGP4 level+10276
INDIRI4
ASGNI4
LABELV $991
line 1881
;1881:    if(percentage != currentPercentage) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $994
line 1882
;1882:        if(team == TEAM_RED) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $996
line 1883
;1883:            level.healthRedObelisk = percentage;
ADDRGP4 level+10272
ADDRLP4 0
INDIRI4
ASGNI4
line 1884
;1884:        } else {
ADDRGP4 $997
JUMPV
LABELV $996
line 1885
;1885:            level.healthBlueObelisk = percentage;
ADDRGP4 level+10276
ADDRLP4 0
INDIRI4
ASGNI4
line 1886
;1886:        }
LABELV $997
line 1887
;1887:        level.MustSendObeliskHealth = qtrue;
ADDRGP4 level+10280
CNSTI4 1
ASGNI4
line 1889
;1888:        //G_Printf("Obelisk health %i %i\n",team,percentage);
;1889:        ObeliskHealthMessage();
ADDRGP4 ObeliskHealthMessage
CALLV
pop
line 1890
;1890:    }
LABELV $994
line 1891
;1891:} 
LABELV $986
endproc ObeliskHealthChange 8 0
proc ObeliskRegen 12 12
line 1893
;1892:
;1893:static void ObeliskRegen( gentity_t *self ) {
line 1894
;1894:	self->nextthink = level.time + g_obeliskRegenPeriod.integer * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_obeliskRegenPeriod+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1895
;1895:        ObeliskHealthChange(self->spawnflags,self->health);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRGP4 ObeliskHealthChange
CALLV
pop
line 1896
;1896:	if( self->health >= g_obeliskHealth.integer ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRGP4 g_obeliskHealth+12
INDIRI4
LTI4 $1004
line 1897
;1897:		return;
ADDRGP4 $1001
JUMPV
LABELV $1004
line 1900
;1898:	}
;1899:
;1900:	G_AddEvent( self, EV_POWERUP_REGEN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1901
;1901:	self->health += g_obeliskRegenAmount.integer;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 g_obeliskRegenAmount+12
INDIRI4
ADDI4
ASGNI4
line 1902
;1902:	if ( self->health > g_obeliskHealth.integer ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRGP4 g_obeliskHealth+12
INDIRI4
LEI4 $1008
line 1903
;1903:		self->health = g_obeliskHealth.integer;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRGP4 g_obeliskHealth+12
INDIRI4
ASGNI4
line 1904
;1904:	}
LABELV $1008
line 1906
;1905:
;1906:	self->activator->s.modelindex2 = self->health * 0xff / g_obeliskHealth.integer;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_obeliskHealth+12
INDIRI4
DIVI4
ASGNI4
line 1907
;1907:	self->activator->s.frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 0
ASGNI4
line 1908
;1908:}
LABELV $1001
endproc ObeliskRegen 12 12
proc ObeliskRespawn 0 0
line 1911
;1909:
;1910:
;1911:static void ObeliskRespawn( gentity_t *self ) {
line 1912
;1912:	self->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 1913
;1913:	self->health = g_obeliskHealth.integer;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRGP4 g_obeliskHealth+12
INDIRI4
ASGNI4
line 1915
;1914:
;1915:	self->think = ObeliskRegen;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 ObeliskRegen
ASGNP4
line 1916
;1916:	self->nextthink = level.time + g_obeliskRegenPeriod.integer * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_obeliskRegenPeriod+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1918
;1917:
;1918:	self->activator->s.frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 0
ASGNI4
line 1919
;1919:}
LABELV $1013
endproc ObeliskRespawn 0 0
proc ObeliskDie 28 24
line 1922
;1920:
;1921:
;1922:static void ObeliskDie( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
line 1925
;1923:	int			otherTeam;
;1924:
;1925:	otherTeam = OtherTeam( self->spawnflags );
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1926
;1926:	AddTeamScore(self->s.pos.trBase, otherTeam, 1);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 1927
;1927:	Team_ForceGesture(otherTeam);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ForceGesture
CALLV
pop
line 1929
;1928:
;1929:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1931
;1930:
;1931:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 1932
;1932:	self->think = ObeliskRespawn;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 ObeliskRespawn
ASGNP4
line 1933
;1933:	self->nextthink = level.time + g_obeliskRespawnDelay.integer * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_obeliskRespawnDelay+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1935
;1934:
;1935:	self->activator->s.modelindex2 = 0xff;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 1936
;1936:	self->activator->s.frame = 2;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 2
ASGNI4
line 1938
;1937:
;1938:	G_AddEvent( self->activator, EV_OBELISKEXPLODE, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
ARGP4
CNSTI4 70
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1940
;1939:
;1940:	AddScore(attacker, self->r.currentOrigin, CTF_CAPTURE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1943
;1941:
;1942:	// add the sprite over the player's head
;1943:	attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 1944
;1944:	attacker->client->ps.eFlags |= EF_AWARD_CAP;
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 1945
;1945:	attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1946
;1946:	attacker->client->ps.persistant[PERS_CAPTURES]++;
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1947
;1947:    G_LogPrintf("OBELISK: %i %i %i %i: %s destroyed the enemy obelisk.\n",
ADDRGP4 $1021
ARGP4
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1950
;1948:    attacker->client->ps.clientNum,attacker->client->sess.sessionTeam,3,0,
;1949:    attacker->client->pers.netname);
;1950:    ObeliskHealthChange(self->spawnflags,self->health);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRGP4 ObeliskHealthChange
CALLV
pop
line 1951
;1951:	teamgame.redObeliskAttackedTime = 0;
ADDRGP4 teamgame+28
CNSTI4 0
ASGNI4
line 1952
;1952:	teamgame.blueObeliskAttackedTime = 0;
ADDRGP4 teamgame+32
CNSTI4 0
ASGNI4
line 1953
;1953:}
LABELV $1017
endproc ObeliskDie 28 24
proc ObeliskTouch 52 40
line 1956
;1954:
;1955:
;1956:static void ObeliskTouch( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 1959
;1957:	int			tokens,i;
;1958:
;1959:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1025
line 1960
;1960:		return;
ADDRGP4 $1024
JUMPV
LABELV $1025
line 1963
;1961:	}
;1962:
;1963:	if ( OtherTeam(other->client->sess.sessionTeam) != self->spawnflags ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
EQI4 $1027
line 1964
;1964:		return;
ADDRGP4 $1024
JUMPV
LABELV $1027
line 1967
;1965:	}
;1966:
;1967:	tokens = other->client->ps.generic1;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 1968
;1968:	if( tokens <= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $1029
line 1969
;1969:		return;
ADDRGP4 $1024
JUMPV
LABELV $1029
line 1972
;1970:	}
;1971:
;1972:	PrintMsg(NULL, "%s" S_COLOR_WHITE " brought in %i skull%s.\n",
CNSTP4 0
ARGP4
ADDRGP4 $1031
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LEI4 $1035
ADDRLP4 12
ADDRGP4 $1032
ASGNP4
ADDRGP4 $1036
JUMPV
LABELV $1035
ADDRLP4 12
ADDRGP4 $1033
ASGNP4
LABELV $1036
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 1975
;1973:					other->client->pers.netname, tokens, tokens>1 ? "s" : "" );
;1974:
;1975:        G_LogPrintf("HARVESTER: %i %i %i %i %i: %s brought in %i skull%s for %s\n",
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $1037
ARGP4
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LEI4 $1039
ADDRLP4 20
ADDRGP4 $1032
ASGNP4
ADDRGP4 $1040
JUMPV
LABELV $1039
ADDRLP4 20
ADDRGP4 $1033
ASGNP4
LABELV $1040
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1979
;1976:            other->client->ps.clientNum,other->client->sess.sessionTeam,0,-1,tokens,
;1977:            other->client->pers.netname,tokens, tokens>1 ? "s" : "", TeamName(other->client->sess.sessionTeam));
;1978:
;1979:	AddTeamScore(self->s.pos.trBase, other->client->sess.sessionTeam, tokens);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 1980
;1980:	Team_ForceGesture(other->client->sess.sessionTeam);
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRGP4 Team_ForceGesture
CALLV
pop
line 1982
;1981:
;1982:	AddScore(other, self->r.currentOrigin, CTF_CAPTURE_BONUS*tokens);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1985
;1983:
;1984:	// add the sprite over the player's head
;1985:	other->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 1986
;1986:	other->client->ps.eFlags |= EF_AWARD_CAP;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 1987
;1987:	other->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1988
;1988:	other->client->ps.persistant[PERS_CAPTURES] += tokens;
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1989
;1989:	other->client->ps.generic1 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 440
ADDP4
CNSTI4 0
ASGNI4
line 1990
;1990:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1992
;1991:
;1992:	Team_CaptureFlagSound( self, self->spawnflags );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRGP4 Team_CaptureFlagSound
CALLV
pop
line 1993
;1993:}
LABELV $1024
endproc ObeliskTouch 52 40
proc ObeliskPain 16 28
line 1995
;1994:
;1995:static void ObeliskPain( gentity_t *self, gentity_t *attacker, int damage ) {
line 1996
;1996:	int actualDamage = damage / 10;
ADDRLP4 0
ADDRFP4 8
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 1997
;1997:	if (actualDamage <= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $1043
line 1998
;1998:		actualDamage = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1999
;1999:	}
LABELV $1043
line 2000
;2000:	self->activator->s.modelindex2 = self->health * 0xff / g_obeliskHealth.integer;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
MULI4
ADDRGP4 g_obeliskHealth+12
INDIRI4
DIVI4
ASGNI4
line 2001
;2001:	if (!self->activator->s.frame) {
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1046
line 2002
;2002:		G_AddEvent(self, EV_OBELISKPAIN, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 71
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2003
;2003:	}
LABELV $1046
line 2004
;2004:	self->activator->s.frame = 1;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 1
ASGNI4
line 2005
;2005:	AddScore(attacker, self->r.currentOrigin, actualDamage);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2006
;2006:        G_LogPrintf("OBELISK: %i %i %i %i: %s dealt %i damage to the enemy obelisk.\n",
ADDRGP4 $1048
ARGP4
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2009
;2007:                 attacker->client->ps.clientNum,attacker->client->sess.sessionTeam,1,actualDamage,
;2008:                 attacker->client->pers.netname,actualDamage);
;2009:}
LABELV $1042
endproc ObeliskPain 16 28
export SpawnObelisk
proc SpawnObelisk 100 28
line 2011
;2010:
;2011:gentity_t *SpawnObelisk( vec3_t origin, int team, int spawnflags) {
line 2016
;2012:	trace_t		tr;
;2013:	vec3_t		dest;
;2014:	gentity_t	*ent;
;2015:
;2016:	ent = G_Spawn();
ADDRLP4 72
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
ASGNP4
line 2018
;2017:
;2018:	VectorCopy( origin, ent->s.origin );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 2019
;2019:	VectorCopy( origin, ent->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 2020
;2020:	VectorCopy( origin, ent->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 2022
;2021:
;2022:	VectorSet( ent->r.mins, -15, -15, 0 );
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 0
ASGNF4
line 2023
;2023:	VectorSet( ent->r.maxs, 15, 15, 87 );
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1118699520
ASGNF4
line 2025
;2024:
;2025:	ent->s.eType = ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2026
;2026:	ent->flags = FL_NO_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTI4 2048
ASGNI4
line 2028
;2027:
;2028:	if( g_gametype.integer == GT_OBELISK ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
NEI4 $1050
line 2029
;2029:		ent->r.contents = CONTENTS_SOLID;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 2030
;2030:		ent->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 2031
;2031:		ent->health = g_obeliskHealth.integer;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRGP4 g_obeliskHealth+12
INDIRI4
ASGNI4
line 2032
;2032:		ent->die = ObeliskDie;
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 ObeliskDie
ASGNP4
line 2033
;2033:		ent->pain = ObeliskPain;
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 ObeliskPain
ASGNP4
line 2034
;2034:		ent->think = ObeliskRegen;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 ObeliskRegen
ASGNP4
line 2035
;2035:		ent->nextthink = level.time + g_obeliskRegenPeriod.integer * 1000;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_obeliskRegenPeriod+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 2036
;2036:	}
LABELV $1050
line 2037
;2037:	if( g_gametype.integer == GT_HARVESTER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $1056
line 2038
;2038:		ent->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 2039
;2039:		ent->touch = ObeliskTouch;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 ObeliskTouch
ASGNP4
line 2040
;2040:	}
LABELV $1056
line 2042
;2041:
;2042:	if ( spawnflags & 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1059
line 2044
;2043:		// suspended
;2044:		G_SetOrigin( ent, ent->s.origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2045
;2045:	} else {
ADDRGP4 $1060
JUMPV
LABELV $1059
line 2048
;2046:		// mappers like to put them exactly on the floor, but being coplanar
;2047:		// will sometimes show up as starting in solid, so lif it up one pixel
;2048:		ent->s.origin[2] += 1;
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2051
;2049:
;2050:		// drop to floor
;2051:		VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 2052
;2052:		trap_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2053
;2053:		if ( tr.startsolid ) {
ADDRLP4 16+4
INDIRI4
CNSTI4 0
EQI4 $1063
line 2054
;2054:			ent->s.origin[2] -= 1;
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 2055
;2055:                        G_Printf( "SpawnObelisk: %s startsolid at %s\n", ent->classname, vtos(ent->s.origin) );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $1066
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2057
;2056:
;2057:			ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 4095
ASGNI4
line 2058
;2058:			G_SetOrigin( ent, ent->s.origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2059
;2059:		}
ADDRGP4 $1064
JUMPV
LABELV $1063
line 2060
;2060:		else {
line 2062
;2061:			// allow to ride movers
;2062:			ent->s.groundEntityNum = tr.entityNum;
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 16+52
INDIRI4
ASGNI4
line 2063
;2063:			G_SetOrigin( ent, tr.endpos );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2064
;2064:		}
LABELV $1064
line 2065
;2065:	}
LABELV $1060
line 2067
;2066:
;2067:	ent->spawnflags = team;
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 2069
;2068:
;2069:	trap_LinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2071
;2070:
;2071:	return ent;
ADDRLP4 0
INDIRP4
RETP4
LABELV $1049
endproc SpawnObelisk 100 28
export SP_team_redobelisk
proc SP_team_redobelisk 12 12
line 2076
;2072:}
;2073:
;2074:/*QUAKED team_redobelisk (1 0 0) (-16 -16 0) (16 16 8)
;2075:*/
;2076:void SP_team_redobelisk( gentity_t *ent ) {
line 2079
;2077:	gentity_t *obelisk;
;2078:
;2079:	if ( g_gametype.integer <= GT_TEAM || g_ffa_gt>0) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LEI4 $1073
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 0
LEI4 $1070
LABELV $1073
line 2080
;2080:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2081
;2081:		return;
ADDRGP4 $1069
JUMPV
LABELV $1070
line 2083
;2082:	}
;2083:	ent->s.eType = ET_TEAM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 2084
;2084:	if ( g_gametype.integer == GT_OBELISK ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
NEI4 $1074
line 2085
;2085:		obelisk = SpawnObelisk( ent->s.origin, TEAM_RED, ent->spawnflags );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 SpawnObelisk
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2086
;2086:		obelisk->activator = ent;
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2088
;2087:		// initial obelisk health value
;2088:		ent->s.modelindex2 = 0xff;
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 2089
;2089:		ent->s.frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 0
ASGNI4
line 2090
;2090:	}
LABELV $1074
line 2091
;2091:	if ( g_gametype.integer == GT_HARVESTER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $1077
line 2092
;2092:		obelisk = SpawnObelisk( ent->s.origin, TEAM_RED, ent->spawnflags );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 SpawnObelisk
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2093
;2093:		obelisk->activator = ent;
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2094
;2094:	}
LABELV $1077
line 2095
;2095:	ent->s.modelindex = TEAM_RED;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 1
ASGNI4
line 2096
;2096:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2097
;2097:}
LABELV $1069
endproc SP_team_redobelisk 12 12
export SP_team_blueobelisk
proc SP_team_blueobelisk 12 12
line 2101
;2098:
;2099:/*QUAKED team_blueobelisk (0 0 1) (-16 -16 0) (16 16 88)
;2100:*/
;2101:void SP_team_blueobelisk( gentity_t *ent ) {
line 2104
;2102:	gentity_t *obelisk;
;2103:
;2104:	if ( g_gametype.integer <= GT_TEAM || g_ffa_gt>0) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LEI4 $1084
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 0
LEI4 $1081
LABELV $1084
line 2105
;2105:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2106
;2106:		return;
ADDRGP4 $1080
JUMPV
LABELV $1081
line 2108
;2107:	}
;2108:	ent->s.eType = ET_TEAM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 2109
;2109:	if ( g_gametype.integer == GT_OBELISK ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
NEI4 $1085
line 2110
;2110:		obelisk = SpawnObelisk( ent->s.origin, TEAM_BLUE, ent->spawnflags );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 SpawnObelisk
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2111
;2111:		obelisk->activator = ent;
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2113
;2112:		// initial obelisk health value
;2113:		ent->s.modelindex2 = 0xff;
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 2114
;2114:		ent->s.frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 0
ASGNI4
line 2115
;2115:	}
LABELV $1085
line 2116
;2116:	if ( g_gametype.integer == GT_HARVESTER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $1088
line 2117
;2117:		obelisk = SpawnObelisk( ent->s.origin, TEAM_BLUE, ent->spawnflags );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 SpawnObelisk
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2118
;2118:		obelisk->activator = ent;
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2119
;2119:	}
LABELV $1088
line 2120
;2120:	ent->s.modelindex = TEAM_BLUE;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 2
ASGNI4
line 2121
;2121:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2122
;2122:}
LABELV $1080
endproc SP_team_blueobelisk 12 12
export SP_team_neutralobelisk
proc SP_team_neutralobelisk 8 12
line 2126
;2123:
;2124:/*QUAKED team_neutralobelisk (0 0 1) (-16 -16 0) (16 16 88)
;2125:*/
;2126:void SP_team_neutralobelisk( gentity_t *ent ) {
line 2127
;2127:	if ( g_gametype.integer != GT_1FCTF && g_gametype.integer != GT_HARVESTER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $1092
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $1092
line 2128
;2128:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2129
;2129:		return;
ADDRGP4 $1091
JUMPV
LABELV $1092
line 2131
;2130:	}
;2131:	ent->s.eType = ET_TEAM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 2132
;2132:	if ( g_gametype.integer == GT_HARVESTER) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $1096
line 2133
;2133:		neutralObelisk = SpawnObelisk( ent->s.origin, TEAM_FREE, ent->spawnflags);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SpawnObelisk
CALLP4
ASGNP4
ADDRGP4 neutralObelisk
ADDRLP4 4
INDIRP4
ASGNP4
line 2134
;2134:		neutralObelisk->spawnflags = TEAM_FREE;
ADDRGP4 neutralObelisk
INDIRP4
CNSTI4 568
ADDP4
CNSTI4 0
ASGNI4
line 2135
;2135:	}
LABELV $1096
line 2136
;2136:	ent->s.modelindex = TEAM_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 0
ASGNI4
line 2137
;2137:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2138
;2138:}
LABELV $1091
endproc SP_team_neutralobelisk 8 12
export CheckObeliskAttack
proc CheckObeliskAttack 12 8
line 2146
;2139:
;2140:
;2141:/*
;2142:================
;2143:CheckObeliskAttack
;2144:================
;2145:*/
;2146:qboolean CheckObeliskAttack( gentity_t *obelisk, gentity_t *attacker ) {
line 2150
;2147:	gentity_t	*te;
;2148:
;2149:	// if this really is an obelisk
;2150:	if( obelisk->die != ObeliskDie ) {
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 ObeliskDie
CVPU4 4
EQU4 $1100
line 2151
;2151:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1100
line 2155
;2152:	}
;2153:
;2154:	// if the attacker is a client
;2155:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1102
line 2156
;2156:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1102
line 2160
;2157:	}
;2158:
;2159:	// if the obelisk is on the same team as the attacker then don't hurt it
;2160:	if( obelisk->spawnflags == attacker->client->sess.sessionTeam ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
NEI4 $1104
line 2161
;2161:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1104
line 2167
;2162:	}
;2163:
;2164:	// obelisk may be hurt
;2165:
;2166:	// if not played any sounds recently
;2167:	if ((obelisk->spawnflags == TEAM_RED &&
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1113
ADDRGP4 teamgame+28
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 20000
SUBI4
LTI4 $1112
LABELV $1113
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1106
ADDRGP4 teamgame+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 20000
SUBI4
GEI4 $1106
LABELV $1112
line 2170
;2168:		teamgame.redObeliskAttackedTime < level.time - OVERLOAD_ATTACK_BASE_SOUND_TIME) ||
;2169:		(obelisk->spawnflags == TEAM_BLUE &&
;2170:		teamgame.blueObeliskAttackedTime < level.time - OVERLOAD_ATTACK_BASE_SOUND_TIME) ) {
line 2173
;2171:
;2172:		// tell which obelisk is under attack
;2173:		te = G_TempEntity( obelisk->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 2174
;2174:		if( obelisk->spawnflags == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1114
line 2175
;2175:			te->s.eventParm = GTS_REDOBELISK_ATTACKED;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 6
ASGNI4
line 2176
;2176:			teamgame.redObeliskAttackedTime = level.time;
ADDRGP4 teamgame+28
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2177
;2177:		}
ADDRGP4 $1115
JUMPV
LABELV $1114
line 2178
;2178:		else {
line 2179
;2179:			te->s.eventParm = GTS_BLUEOBELISK_ATTACKED;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 7
ASGNI4
line 2180
;2180:			teamgame.blueObeliskAttackedTime = level.time;
ADDRGP4 teamgame+32
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2181
;2181:		}
LABELV $1115
line 2182
;2182:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 2183
;2183:	}
LABELV $1106
line 2185
;2184:
;2185:	return qfalse;
CNSTI4 0
RETI4
LABELV $1099
endproc CheckObeliskAttack 12 8
export ShuffleTeams
proc ShuffleTeams 36 8
line 2202
;2186:}
;2187:
;2188:/*
;2189:================
;2190:ShuffleTeams
;2191: *Randomizes the teams based on a type of function and then restarts the map
;2192: *Currently there is only one type so type is ignored. You can add total randomizaion or waighted randomization later.
;2193: *
;2194: *The function will split the teams like this:
;2195: *1. Red team
;2196: *2. Blue team
;2197: *3. Blue team
;2198: *4. Red team
;2199: *5. Go to 1
;2200:================
;2201:*/
;2202:void ShuffleTeams(void) {
line 2204
;2203:    int i;
;2204:    int assignedClients=1, nextTeam=TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 8
CNSTI4 1
ASGNI4
line 2206
;2205:
;2206:    if ( g_gametype.integer < GT_TEAM || g_ffa_gt==1)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $1124
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
NEI4 $1121
LABELV $1124
line 2207
;2207:        return; //Can only shuffle team games!
ADDRGP4 $1120
JUMPV
LABELV $1121
line 2209
;2208:
;2209:    for( i=0;i < level.numConnectedClients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1128
JUMPV
LABELV $1125
line 2210
;2210:        if( g_entities[ &level.clients[level.sortedClients[i]] - level.clients].r.svFlags & SVF_BOT)
ADDRLP4 12
ADDRGP4 level
INDIRP4
ASGNP4
CNSTI4 2492
CNSTI4 2324
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
CVPU4 4
ADDRLP4 12
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1130
line 2211
;2211:            continue; //Don't sort bots... they are always equal
ADDRGP4 $1126
JUMPV
LABELV $1130
line 2213
;2212:        
;2213:        if(level.clients[level.sortedClients[i]].sess.sessionTeam==TEAM_RED || level.clients[level.sortedClients[i]].sess.sessionTeam==TEAM_BLUE ) {
ADDRLP4 16
CNSTI4 2324
ASGNI4
ADDRLP4 20
CNSTI4 2
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ASGNI4
ADDRLP4 28
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 1032
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1139
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $1135
LABELV $1139
line 2215
;2214:            //For every second client we chenge team. But we do it a little of to make it slightly more fair
;2215:            if(assignedClients>1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
LEI4 $1140
line 2216
;2216:                assignedClients=0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2217
;2217:                if(nextTeam == TEAM_RED)
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1142
line 2218
;2218:                    nextTeam = TEAM_BLUE;
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRGP4 $1143
JUMPV
LABELV $1142
line 2220
;2219:                else
;2220:                    nextTeam = TEAM_RED;
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $1143
line 2221
;2221:            }
LABELV $1140
line 2225
;2222:
;2223:            //Set the team
;2224:            //We do not run all the logic because we shall run map_restart in a moment.
;2225:            level.clients[level.sortedClients[i]].sess.sessionTeam = nextTeam;
CNSTI4 2324
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 2227
;2226:
;2227:            ClientUserinfoChanged( level.sortedClients[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2228
;2228:            ClientBegin( level.sortedClients[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 2230
;2229:
;2230:            assignedClients++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2231
;2231:        }
LABELV $1135
line 2232
;2232:    }
LABELV $1126
line 2209
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1128
ADDRLP4 0
INDIRI4
ADDRGP4 level+72
INDIRI4
LTI4 $1125
line 2235
;2233:
;2234:    //Restart!
;2235:    trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $1147
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2237
;2236:
;2237:}
LABELV $1120
endproc ShuffleTeams 36 8
bss
export dominationPointsSpawned
align 4
LABELV dominationPointsSpawned
skip 4
export dom_points
align 4
LABELV dom_points
skip 32
export ddB
align 4
LABELV ddB
skip 4
export ddA
align 4
LABELV ddA
skip 4
export neutralObelisk
align 4
LABELV neutralObelisk
skip 4
export teamgame
align 4
LABELV teamgame
skip 36
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
LABELV $1147
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
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $1066
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
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
LABELV $1048
byte 1 79
byte 1 66
byte 1 69
byte 1 76
byte 1 73
byte 1 83
byte 1 75
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1037
byte 1 72
byte 1 65
byte 1 82
byte 1 86
byte 1 69
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 114
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1033
byte 1 0
align 1
LABELV $1032
byte 1 115
byte 1 0
align 1
LABELV $1031
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 98
byte 1 114
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1021
byte 1 79
byte 1 66
byte 1 69
byte 1 76
byte 1 73
byte 1 83
byte 1 75
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $952
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $948
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $903
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
byte 1 100
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $902
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
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $889
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
byte 1 100
byte 1 0
align 1
LABELV $878
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
LABELV $875
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
LABELV $872
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $869
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $852
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $851
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $815
byte 1 68
byte 1 111
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $805
byte 1 72
byte 1 65
byte 1 82
byte 1 86
byte 1 69
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 10
byte 1 44
byte 1 0
align 1
LABELV $804
byte 1 72
byte 1 65
byte 1 82
byte 1 86
byte 1 69
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 117
byte 1 112
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $789
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 69
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 78
byte 1 65
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $785
byte 1 67
byte 1 84
byte 1 70
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $781
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $778
byte 1 49
byte 1 70
byte 1 67
byte 1 84
byte 1 70
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 103
byte 1 111
byte 1 116
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
byte 1 10
byte 1 0
align 1
LABELV $777
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 103
byte 1 111
byte 1 116
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
byte 1 10
byte 1 0
align 1
LABELV $743
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 69
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 78
byte 1 65
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $739
byte 1 67
byte 1 84
byte 1 70
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $735
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $734
byte 1 49
byte 1 70
byte 1 67
byte 1 84
byte 1 70
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
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
byte 1 10
byte 1 0
align 1
LABELV $733
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
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
byte 1 10
byte 1 0
align 1
LABELV $725
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 69
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 78
byte 1 65
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $721
byte 1 67
byte 1 84
byte 1 70
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $717
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $699
byte 1 68
byte 1 68
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 107
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $698
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 107
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 66
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $688
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $678
byte 1 68
byte 1 68
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 107
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $677
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 107
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 65
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $628
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 69
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 78
byte 1 65
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $624
byte 1 67
byte 1 84
byte 1 70
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $620
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $619
byte 1 49
byte 1 70
byte 1 67
byte 1 84
byte 1 70
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $615
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $609
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $579
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $565
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 82
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $549
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 32
byte 1 40
byte 1 87
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 41
byte 1 0
align 1
LABELV $546
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 32
byte 1 40
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 41
byte 1 0
align 1
LABELV $543
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 32
byte 1 40
byte 1 82
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $534
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 32
byte 1 40
byte 1 87
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 41
byte 1 0
align 1
LABELV $531
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 32
byte 1 40
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 41
byte 1 0
align 1
LABELV $528
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 32
byte 1 40
byte 1 82
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $515
byte 1 68
byte 1 79
byte 1 77
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 115
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $513
byte 1 78
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $508
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 107
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $507
byte 1 66
byte 1 108
byte 1 117
byte 1 101
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
LABELV $503
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 107
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $502
byte 1 82
byte 1 101
byte 1 100
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
LABELV $471
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
align 1
LABELV $467
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
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 40
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $466
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $463
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
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $454
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
LABELV $453
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
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $452
byte 1 78
byte 1 111
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
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $449
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
LABELV $440
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
LABELV $376
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
LABELV $374
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
LABELV $369
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
LABELV $365
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
LABELV $363
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
LABELV $303
byte 1 72
byte 1 65
byte 1 82
byte 1 86
byte 1 69
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 119
byte 1 104
byte 1 111
byte 1 32
byte 1 104
byte 1 97
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $302
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $291
byte 1 49
byte 1 102
byte 1 67
byte 1 84
byte 1 70
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $286
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 69
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 78
byte 1 65
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $282
byte 1 67
byte 1 84
byte 1 70
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $278
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $119
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
LABELV $114
byte 1 80
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 77
byte 1 115
byte 1 103
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 114
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $108
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $105
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $102
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $91
byte 1 70
byte 1 82
byte 1 69
byte 1 69
byte 1 0
align 1
LABELV $90
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
LABELV $87
byte 1 66
byte 1 76
byte 1 85
byte 1 69
byte 1 0
align 1
LABELV $84
byte 1 82
byte 1 69
byte 1 68
byte 1 0
