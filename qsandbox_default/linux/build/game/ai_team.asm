export BotValidTeamLeader
code
proc BotValidTeamLeader 8 4
file "../../../code/game/ai_team.c"
line 72
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
;23:
;24:/*****************************************************************************
;25: * name:		ai_team.c
;26: *
;27: * desc:		Quake3 bot AI
;28: *
;29: * $Archive: /MissionPack/code/game/ai_team.c $
;30: *
;31: *****************************************************************************/
;32:
;33:#include "g_local.h"
;34:#include "../botlib/botlib.h"
;35:#include "../botlib/be_aas.h"
;36:#include "../botlib/be_ea.h"
;37:#include "../botlib/be_ai_char.h"
;38:#include "../botlib/be_ai_chat.h"
;39:#include "../botlib/be_ai_gen.h"
;40:#include "../botlib/be_ai_goal.h"
;41:#include "../botlib/be_ai_move.h"
;42:#include "../botlib/be_ai_weap.h"
;43://
;44:#include "ai_main.h"
;45:#include "ai_dmq3.h"
;46:#include "ai_chat.h"
;47:#include "ai_cmd.h"
;48:#include "ai_dmnet.h"
;49:#include "ai_team.h"
;50:#include "ai_vcmd.h"
;51:
;52:#include "match.h"
;53:
;54:// for the voice chats
;55:#include "../../ui/menudef.h"
;56:
;57://ctf task preferences for a client
;58:typedef struct bot_ctftaskpreference_s
;59:{
;60:	char		name[36];
;61:	int			preference;
;62:} bot_ctftaskpreference_t;
;63:
;64:bot_ctftaskpreference_t ctftaskpreferences[MAX_CLIENTS];
;65:
;66:
;67:/*
;68:==================
;69:BotValidTeamLeader
;70:==================
;71:*/
;72:int BotValidTeamLeader(bot_state_t *bs) {
line 73
;73:	if (!strlen(bs->teamleader)) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $66
CNSTI4 0
RETI4
ADDRGP4 $65
JUMPV
LABELV $66
line 74
;74:	if (ClientFromName(bs->teamleader) == -1) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $68
CNSTI4 0
RETI4
ADDRGP4 $65
JUMPV
LABELV $68
line 75
;75:	return qtrue;
CNSTI4 1
RETI4
LABELV $65
endproc BotValidTeamLeader 8 4
bss
align 4
LABELV $71
skip 4
export BotNumTeamMates
code
proc BotNumTeamMates 1060 12
line 83
;76:}
;77:
;78:/*
;79:==================
;80:BotNumTeamMates
;81:==================
;82:*/
;83:int BotNumTeamMates(bot_state_t *bs) {
line 88
;84:	int i, numplayers;
;85:	char buf[MAX_INFO_STRING];
;86:	static int maxclients;
;87:
;88:	if (!maxclients)
ADDRGP4 $71
INDIRI4
CNSTI4 0
NEI4 $72
line 89
;89:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $74
ARGP4
ADDRLP4 1032
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $71
ADDRLP4 1032
INDIRI4
ASGNI4
LABELV $72
line 91
;90:
;91:	numplayers = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 92
;92:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $78
JUMPV
LABELV $75
line 93
;93:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 95
;94:		//if no config string or no name
;95:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $82
ADDRLP4 4
ARGP4
ADDRGP4 $81
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $79
LABELV $82
ADDRGP4 $76
JUMPV
LABELV $79
line 97
;96:		//skip spectators
;97:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 4
ARGP4
ADDRGP4 $85
ARGP4
ADDRLP4 1048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 3
NEI4 $83
ADDRGP4 $76
JUMPV
LABELV $83
line 99
;98:		//
;99:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $86
line 100
;100:			numplayers++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 101
;101:		}
LABELV $86
line 102
;102:	}
LABELV $76
line 92
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $78
ADDRLP4 0
INDIRI4
ADDRGP4 $71
INDIRI4
GEI4 $88
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $75
LABELV $88
line 103
;103:	return numplayers;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $70
endproc BotNumTeamMates 1060 12
export BotClientTravelTimeToGoal
proc BotClientTravelTimeToGoal 484 16
line 111
;104:}
;105:
;106:/*
;107:==================
;108:BotClientTravelTimeToGoal
;109:==================
;110:*/
;111:int BotClientTravelTimeToGoal(int client, bot_goal_t *goal) {
line 115
;112:	playerState_t ps;
;113:	int areanum;
;114:
;115:	BotAI_GetClientState(client, &ps);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 116
;116:	areanum = BotPointAreaNum(ps.origin);
ADDRLP4 0+20
ARGP4
ADDRLP4 476
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 472
ADDRLP4 476
INDIRI4
ASGNI4
line 117
;117:	if (!areanum) return 1;
ADDRLP4 472
INDIRI4
CNSTI4 0
NEI4 $91
CNSTI4 1
RETI4
ADDRGP4 $89
JUMPV
LABELV $91
line 118
;118:	return trap_AAS_AreaTravelTimeToGoalArea(areanum, ps.origin, goal->areanum, TFL_DEFAULT);
ADDRLP4 472
INDIRI4
ARGI4
ADDRLP4 0+20
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 480
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 480
INDIRI4
RETI4
LABELV $89
endproc BotClientTravelTimeToGoal 484 16
bss
align 4
LABELV $95
skip 4
export BotSortTeamMatesByBaseTravelTime
code
proc BotSortTeamMatesByBaseTravelTime 2120 12
line 126
;119:}
;120:
;121:/*
;122:==================
;123:BotSortTeamMatesByBaseTravelTime
;124:==================
;125:*/
;126:int BotSortTeamMatesByBaseTravelTime(bot_state_t *bs, int *teammates, int maxteammates) {
line 132
;127:
;128:	int i, j, k, numteammates, traveltime;
;129:	char buf[MAX_INFO_STRING];
;130:	static int maxclients;
;131:	int traveltimes[MAX_CLIENTS];
;132:	bot_goal_t *goal = NULL;
ADDRLP4 2068
CNSTP4 0
ASGNP4
line 134
;133:
;134:	if (gametype == GT_CTF || gametype == GT_1FCTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 2072
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 5
EQI4 $99
ADDRLP4 2072
INDIRI4
CNSTI4 6
EQI4 $99
ADDRLP4 2072
INDIRI4
CNSTI4 10
NEI4 $96
LABELV $99
line 135
;135:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 1
NEI4 $100
line 136
;136:			goal = &ctf_redflag;
ADDRLP4 2068
ADDRGP4 ctf_redflag
ASGNP4
ADDRGP4 $97
JUMPV
LABELV $100
line 138
;137:		else
;138:			goal = &ctf_blueflag;
ADDRLP4 2068
ADDRGP4 ctf_blueflag
ASGNP4
line 139
;139:	}
ADDRGP4 $97
JUMPV
LABELV $96
line 140
;140:	else {
line 141
;141:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 1
NEI4 $102
line 142
;142:			goal = &redobelisk;
ADDRLP4 2068
ADDRGP4 redobelisk
ASGNP4
ADDRGP4 $103
JUMPV
LABELV $102
line 144
;143:		else
;144:			goal = &blueobelisk;
ADDRLP4 2068
ADDRGP4 blueobelisk
ASGNP4
LABELV $103
line 145
;145:	}
LABELV $97
line 146
;146:	if (!maxclients)
ADDRGP4 $95
INDIRI4
CNSTI4 0
NEI4 $104
line 147
;147:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $74
ARGP4
ADDRLP4 2076
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $95
ADDRLP4 2076
INDIRI4
ASGNI4
LABELV $104
line 149
;148:
;149:	numteammates = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 150
;150:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 1036
CNSTI4 0
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $106
line 151
;151:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 1036
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 1044
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 153
;152:		//if no config string or no name
;153:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 1044
ARGP4
ADDRLP4 2080
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
EQI4 $112
ADDRLP4 1044
ARGP4
ADDRGP4 $81
ARGP4
ADDRLP4 2084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRLP4 2088
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $110
LABELV $112
ADDRGP4 $107
JUMPV
LABELV $110
line 155
;154:		//skip spectators
;155:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 1044
ARGP4
ADDRGP4 $85
ARGP4
ADDRLP4 2092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRLP4 2096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 3
NEI4 $113
ADDRGP4 $107
JUMPV
LABELV $113
line 157
;156:		//
;157:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 2100
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
EQI4 $115
line 159
;158:			//
;159:			traveltime = BotClientTravelTimeToGoal(i, goal);
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 2068
INDIRP4
ARGP4
ADDRLP4 2104
ADDRGP4 BotClientTravelTimeToGoal
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 2104
INDIRI4
ASGNI4
line 161
;160:			//
;161:			for (j = 0; j < numteammates; j++) {
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRGP4 $120
JUMPV
LABELV $117
line 162
;162:				if (traveltime < traveltimes[j]) {
ADDRLP4 1040
INDIRI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
GEI4 $121
line 163
;163:					for (k = numteammates; k > j; k--) {
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $123
line 164
;164:						traveltimes[k] = traveltimes[k-1];
ADDRLP4 2108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2108
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 2108
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRI4
ASGNI4
line 165
;165:						teammates[k] = teammates[k-1];
ADDRLP4 2112
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2116
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 2112
INDIRI4
ADDRLP4 2116
INDIRP4
ADDP4
ADDRLP4 2112
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 2116
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 166
;166:					}
LABELV $124
line 163
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $126
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
GTI4 $123
line 167
;167:					break;
ADDRGP4 $119
JUMPV
LABELV $121
line 169
;168:				}
;169:			}
LABELV $118
line 161
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $120
ADDRLP4 1028
INDIRI4
ADDRLP4 1032
INDIRI4
LTI4 $117
LABELV $119
line 170
;170:			traveltimes[j] = traveltime;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
line 171
;171:			teammates[j] = i;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 172
;172:			numteammates++;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 173
;173:			if (numteammates >= maxteammates) break;
ADDRLP4 1032
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $128
ADDRGP4 $108
JUMPV
LABELV $128
line 174
;174:		}
LABELV $115
line 175
;175:	}
LABELV $107
line 150
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $109
ADDRLP4 1036
INDIRI4
ADDRGP4 $95
INDIRI4
GEI4 $130
ADDRLP4 1036
INDIRI4
CNSTI4 256
LTI4 $106
LABELV $130
LABELV $108
line 176
;176:	return numteammates;
ADDRLP4 1032
INDIRI4
RETI4
LABELV $94
endproc BotSortTeamMatesByBaseTravelTime 2120 12
bss
align 4
LABELV $132
skip 4
export BotSortTeamMatesByRelativeTravelTime2ddA
code
proc BotSortTeamMatesByRelativeTravelTime2ddA 2128 12
line 185
;177:}
;178:
;179:/*
;180:==================
;181:BotSortTeamMatesByReletiveTravelTime2ddA
;182:For Double Domination
;183:==================
;184:*/
;185:int BotSortTeamMatesByRelativeTravelTime2ddA(bot_state_t *bs, int *teammates, int maxteammates) {
line 192
;186:	int i, j, k, numteammates;
;187:	double traveltime, traveltime2b;
;188:	char buf[MAX_INFO_STRING];
;189:	static int maxclients;
;190:	double traveltimes[MAX_CLIENTS];
;191:	//int traveltimes2b[MAX_CLIENTS];
;192:	bot_goal_t *goalA = &ctf_redflag;
ADDRLP4 2072
ADDRGP4 ctf_redflag
ASGNP4
line 193
;193:	bot_goal_t *goalB = &ctf_blueflag;
ADDRLP4 2076
ADDRGP4 ctf_blueflag
ASGNP4
line 195
;194:
;195:	if (!maxclients)
ADDRGP4 $132
INDIRI4
CNSTI4 0
NEI4 $133
line 196
;196:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $74
ARGP4
ADDRLP4 2080
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $132
ADDRLP4 2080
INDIRI4
ASGNI4
LABELV $133
line 198
;197:
;198:	numteammates = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 200
;199:
;200:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 1040
CNSTI4 0
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $135
line 201
;201:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 1040
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 1044
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 203
;202:		//if no config string or no name
;203:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 1044
ARGP4
ADDRLP4 2084
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
EQI4 $141
ADDRLP4 1044
ARGP4
ADDRGP4 $81
ARGP4
ADDRLP4 2088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRLP4 2092
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $139
LABELV $141
ADDRGP4 $136
JUMPV
LABELV $139
line 205
;204:		//skip spectators
;205:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 1044
ARGP4
ADDRGP4 $85
ARGP4
ADDRLP4 2096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRLP4 2100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 3
NEI4 $142
ADDRGP4 $136
JUMPV
LABELV $142
line 206
;206:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 2104
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
EQI4 $144
line 207
;207:			traveltime = (double)BotClientTravelTimeToGoal(i, goalA);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2108
ADDRGP4 BotClientTravelTimeToGoal
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 2108
INDIRI4
CVIF4 4
ASGNF4
line 208
;208:			traveltime2b = (double)BotClientTravelTimeToGoal(i, goalB);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRLP4 2112
ADDRGP4 BotClientTravelTimeToGoal
CALLI4
ASGNI4
ADDRLP4 2068
ADDRLP4 2112
INDIRI4
CVIF4 4
ASGNF4
line 209
;209:			traveltime = traveltime/traveltime2b;
ADDRLP4 1036
ADDRLP4 1036
INDIRF4
ADDRLP4 2068
INDIRF4
DIVF4
ASGNF4
line 211
;210:
;211:			for (j = 0; j < numteammates; j++) {
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRGP4 $149
JUMPV
LABELV $146
line 212
;212:				if (traveltime < traveltimes[j]) {
ADDRLP4 1036
INDIRF4
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
GEF4 $150
line 213
;213:					for (k = numteammates; k > j; k--) {
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRGP4 $155
JUMPV
LABELV $152
line 214
;214:						traveltimes[k] = traveltimes[k-1];
ADDRLP4 2116
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2116
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 2116
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 215
;215:						teammates[k] = teammates[k-1];
ADDRLP4 2120
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 2120
INDIRI4
ADDRLP4 2124
INDIRP4
ADDP4
ADDRLP4 2120
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 2124
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 216
;216:					}
LABELV $153
line 213
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $155
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
GTI4 $152
line 217
;217:					break;
ADDRGP4 $148
JUMPV
LABELV $150
line 219
;218:				}
;219:			}
LABELV $147
line 211
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $149
ADDRLP4 1028
INDIRI4
ADDRLP4 1032
INDIRI4
LTI4 $146
LABELV $148
line 220
;220:			traveltimes[j] = traveltime;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 1036
INDIRF4
ASGNF4
line 221
;221:			teammates[j] = i;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
line 222
;222:			numteammates++;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 223
;223:			if (numteammates >= maxteammates) break;
ADDRLP4 1032
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $157
ADDRGP4 $137
JUMPV
LABELV $157
line 224
;224:		}
LABELV $144
line 225
;225:	}
LABELV $136
line 200
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $138
ADDRLP4 1040
INDIRI4
ADDRGP4 $132
INDIRI4
GEI4 $159
ADDRLP4 1040
INDIRI4
CNSTI4 256
LTI4 $135
LABELV $159
LABELV $137
line 227
;226:
;227:	return numteammates;
ADDRLP4 1032
INDIRI4
RETI4
LABELV $131
endproc BotSortTeamMatesByRelativeTravelTime2ddA 2128 12
export BotSetTeamMateTaskPreference
proc BotSetTeamMateTaskPreference 36 12
line 235
;228:}
;229:
;230:/*
;231:==================
;232:BotSetTeamMateTaskPreference
;233:==================
;234:*/
;235:void BotSetTeamMateTaskPreference(bot_state_t *bs, int teammate, int preference) {
line 238
;236:	char teammatename[MAX_NETNAME];
;237:
;238:	ctftaskpreferences[teammate].preference = preference;
CNSTI4 40
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 239
;239:	ClientName(teammate, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 240
;240:	strcpy(ctftaskpreferences[teammate].name, teammatename);
CNSTI4 40
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 ctftaskpreferences
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 241
;241:}
LABELV $160
endproc BotSetTeamMateTaskPreference 36 12
export BotGetTeamMateTaskPreference
proc BotGetTeamMateTaskPreference 40 12
line 248
;242:
;243:/*
;244:==================
;245:BotGetTeamMateTaskPreference
;246:==================
;247:*/
;248:int BotGetTeamMateTaskPreference(bot_state_t *bs, int teammate) {
line 251
;249:	char teammatename[MAX_NETNAME];
;250:
;251:	if (!ctftaskpreferences[teammate].preference) return 0;
CNSTI4 40
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $163
CNSTI4 0
RETI4
ADDRGP4 $162
JUMPV
LABELV $163
line 252
;252:	ClientName(teammate, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 253
;253:	if (Q_stricmp(teammatename, ctftaskpreferences[teammate].name)) return 0;
ADDRLP4 0
ARGP4
CNSTI4 40
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 ctftaskpreferences
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $166
CNSTI4 0
RETI4
ADDRGP4 $162
JUMPV
LABELV $166
line 254
;254:	return ctftaskpreferences[teammate].preference;
CNSTI4 40
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
INDIRI4
RETI4
LABELV $162
endproc BotGetTeamMateTaskPreference 40 12
export BotSortTeamMatesByTaskPreference
proc BotSortTeamMatesByTaskPreference 3108 12
line 262
;255:}
;256:
;257:/*
;258:==================
;259:BotSortTeamMatesByTaskPreference
;260:==================
;261:*/
;262:int BotSortTeamMatesByTaskPreference(bot_state_t *bs, int *teammates, int numteammates) {
line 268
;263:	int defenders[MAX_CLIENTS], numdefenders;
;264:	int attackers[MAX_CLIENTS], numattackers;
;265:	int roamers[MAX_CLIENTS], numroamers;
;266:	int i, preference;
;267:
;268:	numdefenders = numattackers = numroamers = 0;
ADDRLP4 3092
CNSTI4 0
ASGNI4
ADDRLP4 1040
ADDRLP4 3092
INDIRI4
ASGNI4
ADDRLP4 1036
ADDRLP4 3092
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 3092
INDIRI4
ASGNI4
line 269
;269:	for (i = 0; i < numteammates; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $173
JUMPV
LABELV $170
line 270
;270:		preference = BotGetTeamMateTaskPreference(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 3096
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 3096
INDIRI4
ASGNI4
line 271
;271:		if (preference & TEAMTP_DEFENDER) {
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $174
line 272
;272:			defenders[numdefenders++] = teammates[i];
ADDRLP4 3100
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 3100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3104
CNSTI4 2
ASGNI4
ADDRLP4 3100
INDIRI4
ADDRLP4 3104
INDIRI4
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 3104
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 273
;273:		}
ADDRGP4 $175
JUMPV
LABELV $174
line 274
;274:		else if (preference & TEAMTP_ATTACKER) {
ADDRLP4 4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $176
line 275
;275:			attackers[numattackers++] = teammates[i];
ADDRLP4 3100
ADDRLP4 1036
INDIRI4
ASGNI4
ADDRLP4 1036
ADDRLP4 3100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3104
CNSTI4 2
ASGNI4
ADDRLP4 3100
INDIRI4
ADDRLP4 3104
INDIRI4
LSHI4
ADDRLP4 1044
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 3104
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 276
;276:		}
ADDRGP4 $177
JUMPV
LABELV $176
line 277
;277:		else {
line 278
;278:			roamers[numroamers++] = teammates[i];
ADDRLP4 3100
ADDRLP4 1040
INDIRI4
ASGNI4
ADDRLP4 1040
ADDRLP4 3100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3104
CNSTI4 2
ASGNI4
ADDRLP4 3100
INDIRI4
ADDRLP4 3104
INDIRI4
LSHI4
ADDRLP4 2068
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 3104
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 279
;279:		}
LABELV $177
LABELV $175
line 280
;280:	}
LABELV $171
line 269
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $173
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $170
line 281
;281:	numteammates = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 283
;282:	//defenders at the front of the list
;283:	memcpy(&teammates[numteammates], defenders, numdefenders * sizeof(int));
ADDRLP4 3096
CNSTI4 2
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 3096
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
CVIU4 4
ADDRLP4 3096
INDIRI4
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 284
;284:	numteammates += numdefenders;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 286
;285:	//roamers in the middle
;286:	memcpy(&teammates[numteammates], roamers, numroamers * sizeof(int));
ADDRLP4 3100
CNSTI4 2
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 3100
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 2068
ARGP4
ADDRLP4 1040
INDIRI4
CVIU4 4
ADDRLP4 3100
INDIRI4
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 287
;287:	numteammates += numroamers;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 1040
INDIRI4
ADDI4
ASGNI4
line 289
;288:	//attacker in the back of the list
;289:	memcpy(&teammates[numteammates], attackers, numattackers * sizeof(int));
ADDRLP4 3104
CNSTI4 2
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 3104
INDIRI4
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 1044
ARGP4
ADDRLP4 1036
INDIRI4
CVIU4 4
ADDRLP4 3104
INDIRI4
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 290
;290:	numteammates += numattackers;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
line 292
;291:
;292:	return numteammates;
ADDRFP4 8
INDIRI4
RETI4
LABELV $169
endproc BotSortTeamMatesByTaskPreference 3108 12
export BotSayTeamOrderAlways
proc BotSayTeamOrderAlways 548 20
line 300
;293:}
;294:
;295:/*
;296:==================
;297:BotSayTeamOrders
;298:==================
;299:*/
;300:void BotSayTeamOrderAlways(bot_state_t *bs, int toclient) {
line 305
;301:	char teamchat[MAX_MESSAGE_SIZE];
;302:	char buf[MAX_MESSAGE_SIZE];
;303:	char name[MAX_NETNAME];
;304:
;305:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $179
ADDRGP4 $178
JUMPV
LABELV $179
line 308
;306:
;307:	//if the bot is talking to itself
;308:	if (bs->client == toclient) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $182
line 310
;309:		//don't show the message just put it in the console message queue
;310:		trap_BotGetChatMessage(bs->cs, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGetChatMessage
CALLV
pop
line 311
;311:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 312
;312:		Com_sprintf(teamchat, sizeof(teamchat), EC"(%s"EC")"EC": %s", name, buf);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $184
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 313
;313:		trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, teamchat);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 314
;314:	}
ADDRGP4 $183
JUMPV
LABELV $182
line 315
;315:	else {
line 316
;316:		trap_BotEnterChat(bs->cs, toclient, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 317
;317:	}
LABELV $183
line 318
;318:}
LABELV $178
endproc BotSayTeamOrderAlways 548 20
export BotSayTeamOrder
proc BotSayTeamOrder 260 12
line 325
;319:
;320:/*
;321:==================
;322:BotSayTeamOrders
;323:==================
;324:*/
;325:void BotSayTeamOrder(bot_state_t *bs, int toclient) {
line 329
;326:#ifdef MISSIONPACK
;327:	// voice chats only
;328:	char buf[MAX_MESSAGE_SIZE];
;329:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $186
line 330
;330:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 256
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $188
line 331
;331:        return; // spbot no chat
ADDRGP4 $185
JUMPV
LABELV $188
line 332
;332:}}
LABELV $186
line 333
;333:	trap_BotGetChatMessage(bs->cs, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGetChatMessage
CALLV
pop
line 337
;334:#else
;335:	BotSayTeamOrderAlways(bs, toclient);
;336:#endif
;337:}
LABELV $185
endproc BotSayTeamOrder 260 12
export BotVoiceChat
proc BotVoiceChat 8 12
line 344
;338:
;339:/*
;340:==================
;341:BotVoiceChat
;342:==================
;343:*/
;344:void BotVoiceChat(bot_state_t *bs, int toclient, char *voicechat) {
line 345
;345:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $191
line 346
;346:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $193
line 347
;347:        return; // spbot no chat
ADDRGP4 $190
JUMPV
LABELV $193
line 348
;348:}}
LABELV $191
line 350
;349:#ifdef MISSIONPACK
;350:	if (toclient == -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
NEI4 $195
line 352
;351:		// voice only say team
;352:		trap_EA_Command(bs->client, va("vsay_team %s", voicechat));
ADDRGP4 $197
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
ADDRGP4 $196
JUMPV
LABELV $195
line 355
;353:	else
;354:		// voice only tell single player
;355:		trap_EA_Command(bs->client, va("vtell %d %s", toclient, voicechat));
ADDRGP4 $198
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
LABELV $196
line 357
;356:#endif
;357:}
LABELV $190
endproc BotVoiceChat 8 12
export BotVoiceChatOnly
proc BotVoiceChatOnly 8 12
line 364
;358:
;359:/*
;360:==================
;361:BotVoiceChatOnly
;362:==================
;363:*/
;364:void BotVoiceChatOnly(bot_state_t *bs, int toclient, char *voicechat) {
line 365
;365:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $200
line 366
;366:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $202
line 367
;367:        return; // spbot no chat
ADDRGP4 $199
JUMPV
LABELV $202
line 368
;368:}}
LABELV $200
line 371
;369:
;370:#ifdef MISSIONPACK
;371:	if (toclient == -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
NEI4 $204
line 373
;372:		// voice only say team
;373:		trap_EA_Command(bs->client, va("vsay_team %s", voicechat));
ADDRGP4 $197
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
ADDRGP4 $205
JUMPV
LABELV $204
line 376
;374:	else
;375:		// voice only tell single player
;376:		trap_EA_Command(bs->client, va("vtell %d %s", toclient, voicechat));
ADDRGP4 $198
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
LABELV $205
line 378
;377:#endif
;378:}
LABELV $199
endproc BotVoiceChatOnly 8 12
export BotSayVoiceTeamOrder
proc BotSayVoiceTeamOrder 4 12
line 385
;379:
;380:/*
;381:==================
;382:BotSayVoiceTeamOrder
;383:==================
;384:*/
;385:void BotSayVoiceTeamOrder(bot_state_t *bs, int toclient, char *voicechat) {
line 386
;386:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $207
line 387
;387:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $209
line 388
;388:        return; // spbot no chat
ADDRGP4 $206
JUMPV
LABELV $209
line 389
;389:}}
LABELV $207
line 392
;390:
;391:#ifdef MISSIONPACK
;392:	BotVoiceChat(bs, toclient, voicechat);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 394
;393:#endif
;394:}
LABELV $206
endproc BotSayVoiceTeamOrder 4 12
export BotCTFOrders_BothFlagsNotAtBase
proc BotCTFOrders_BothFlagsNotAtBase 1136 20
line 401
;395:
;396:/*
;397:==================
;398:BotCTFOrders
;399:==================
;400:*/
;401:void BotCTFOrders_BothFlagsNotAtBase(bot_state_t *bs) {
line 406
;402:	int numteammates, defenders, attackers, i, other;
;403:	int teammates[MAX_CLIENTS];
;404:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;405:
;406:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $212
line 407
;407:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1116
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $214
line 408
;408:        return; // spbot no chat
ADDRGP4 $211
JUMPV
LABELV $214
line 409
;409:}}
LABELV $212
line 410
;410:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1116
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1116
INDIRI4
ASGNI4
line 411
;411:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 413
;412:	//different orders based on the number of team mates
;413:	switch(bs->numteammates) {
ADDRLP4 1120
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 1
EQI4 $217
ADDRLP4 1120
INDIRI4
CNSTI4 2
EQI4 $220
ADDRLP4 1120
INDIRI4
CNSTI4 3
EQI4 $229
ADDRGP4 $216
JUMPV
line 414
;414:		case 1: break;
LABELV $220
line 416
;415:		case 2:
;416:		{
line 418
;417:			//tell the one not carrying the flag to attack the enemy base
;418:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
EQI4 $221
ADDRLP4 1076
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $222
JUMPV
LABELV $221
line 419
;419:			else other = teammates[1];
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $222
line 420
;420:			ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 421
;421:			if (bot_nochat.integer<3) BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $224
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $224
line 422
;422:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 423
;423:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 424
;424:			break;
ADDRGP4 $217
JUMPV
LABELV $229
line 427
;425:		}
;426:		case 3:
;427:		{
line 429
;428:			//tell the one closest to the base not carrying the flag to accompany the flag carrier
;429:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
EQI4 $230
ADDRLP4 1076
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $230
line 430
;430:			else other = teammates[1];
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $231
line 431
;431:			ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 432
;432:			if ( bs->flagcarrier != -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $233
line 433
;433:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 434
;434:				if (bs->flagcarrier == bs->client) {
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ADDRLP4 1128
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $235
line 435
;435:					if (bot_nochat.integer<3)BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $237
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $237
line 436
;436:					if (bot_nochat.integer<3)BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $234
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $244
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 437
;437:				}
ADDRGP4 $234
JUMPV
LABELV $235
line 438
;438:				else {
line 439
;439:					if (bot_nochat.integer<3)BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $245
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1080
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $245
line 440
;440:					if (bot_nochat.integer<3)BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $234
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $252
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 441
;441:				}
line 442
;442:			}
ADDRGP4 $234
JUMPV
LABELV $233
line 443
;443:			else {
line 445
;444:				//
;445:				if (bot_nochat.integer<3)BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $253
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $253
line 446
;446:				if (bot_nochat.integer<3)BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $256
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
LABELV $256
line 447
;447:			}
LABELV $234
line 448
;448:			if (bot_nochat.integer<3)BotSayTeamOrder(bs, other);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $259
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
LABELV $259
line 450
;449:			//tell the one furthest from the the base not carrying the flag to get the enemy flag
;450:			if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
EQI4 $262
ADDRLP4 1076
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $263
JUMPV
LABELV $262
line 451
;451:			else other = teammates[1];
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $263
line 452
;452:			ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 453
;453:			if (bot_nochat.integer<3)BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $267
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $267
line 454
;454:			if (bot_nochat.integer<3)BotSayTeamOrder(bs, other);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $270
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
LABELV $270
line 455
;455:			if (bot_nochat.integer<3)BotSayVoiceTeamOrder(bs, other, VOICECHAT_RETURNFLAG);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $217
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $276
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 456
;456:			break;
ADDRGP4 $217
JUMPV
LABELV $216
line 459
;457:		}
;458:		default:
;459:		{
line 460
;460:			defenders = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 1068
CNSTF4 1053609165
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 461
;461:			if (defenders > 4) defenders = 4;
ADDRLP4 1068
INDIRI4
CNSTI4 4
LEI4 $277
ADDRLP4 1068
CNSTI4 4
ASGNI4
LABELV $277
line 462
;462:			attackers = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 1128
CNSTF4 1056964608
ASGNF4
ADDRLP4 1072
ADDRLP4 1128
INDIRF4
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
ADDRLP4 1128
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 463
;463:			if (attackers > 5) attackers = 5;
ADDRLP4 1072
INDIRI4
CNSTI4 5
LEI4 $279
ADDRLP4 1072
CNSTI4 5
ASGNI4
LABELV $279
line 464
;464:			if (bs->flagcarrier != -1) {
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $281
line 465
;465:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 466
;466:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $283
line 468
;467:					//
;468:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $287
line 469
;469:						continue;
ADDRGP4 $284
JUMPV
LABELV $287
line 472
;470:					}
;471:					//
;472:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 473
;473:					if (bs->flagcarrier == bs->client) {
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ADDRLP4 1132
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $289
line 474
;474:						if (bot_nochat.integer<3)BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $291
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $291
line 475
;475:						if (bot_nochat.integer<3)BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_FOLLOWME);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $290
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $244
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 476
;476:					}
ADDRGP4 $290
JUMPV
LABELV $289
line 477
;477:					else {
line 478
;478:						if (bot_nochat.integer<3)BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $297
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1080
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $297
line 479
;479:						if (bot_nochat.integer<3)BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_FOLLOWFLAGCARRIER);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $300
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $252
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
LABELV $300
line 480
;480:					}
LABELV $290
line 481
;481:					if (bot_nochat.integer<3)BotSayTeamOrder(bs, teammates[i]);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $303
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
LABELV $303
line 482
;482:				}
LABELV $284
line 466
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $286
ADDRLP4 0
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $283
line 483
;483:			}
ADDRGP4 $282
JUMPV
LABELV $281
line 484
;484:			else {
line 485
;485:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $309
JUMPV
LABELV $306
line 487
;486:					//
;487:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $310
line 488
;488:						continue;
ADDRGP4 $307
JUMPV
LABELV $310
line 491
;489:					}
;490:					//
;491:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 492
;492:					if (bot_nochat.integer<3)BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $312
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $312
line 493
;493:					if (bot_nochat.integer<3)BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_GETFLAG);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $315
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
LABELV $315
line 494
;494:					if (bot_nochat.integer<3)BotSayTeamOrder(bs, teammates[i]);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $318
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
LABELV $318
line 495
;495:				}
LABELV $307
line 485
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $309
ADDRLP4 0
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $306
line 496
;496:			}
LABELV $282
line 497
;497:			for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $324
JUMPV
LABELV $321
line 499
;498:				//
;499:				if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $325
line 500
;500:					continue;
ADDRGP4 $322
JUMPV
LABELV $325
line 503
;501:				}
;502:				//
;503:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 504
;504:				if (bot_nochat.integer<3)BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $329
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $329
line 505
;505:				if (bot_nochat.integer<3)BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $332
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
LABELV $332
line 506
;506:				if (bot_nochat.integer<3)BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_RETURNFLAG);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $336
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $276
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
LABELV $336
line 507
;507:			}
LABELV $322
line 497
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $324
ADDRLP4 0
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $321
line 509
;508:			//
;509:			break;
LABELV $217
line 512
;510:		}
;511:	}
;512:}
LABELV $211
endproc BotCTFOrders_BothFlagsNotAtBase 1136 20
export BotCTFOrders_FlagNotAtBase
proc BotCTFOrders_FlagNotAtBase 1092 16
line 519
;513:
;514:/*
;515:==================
;516:BotCTFOrders
;517:==================
;518:*/
;519:void BotCTFOrders_FlagNotAtBase(bot_state_t *bs) {
line 525
;520:	int numteammates, defenders, attackers, i;
;521:	int teammates[MAX_CLIENTS];
;522:	char name[MAX_NETNAME];
;523:	qboolean weAreAttacking;
;524:
;525:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $341
line 526
;526:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1080
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $343
line 527
;527:        return; // spbot no chat
ADDRGP4 $340
JUMPV
LABELV $343
line 528
;528:}}
LABELV $341
line 530
;529:
;530:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $345
ADDRGP4 $340
JUMPV
LABELV $345
line 532
;531:
;532:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1080
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1080
INDIRI4
ASGNI4
line 533
;533:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 535
;534:
;535:	weAreAttacking = qfalse;
ADDRLP4 1076
CNSTI4 0
ASGNI4
line 539
;536:
;537:	//In oneway ctf we must all move out of the base (only one strategi, maybe we can also send some to the enemy base  to meet the flag carier?)
;538:	//We must be defending
;539:	if(g_elimination_ctf_oneway.integer > 0) {
ADDRGP4 g_elimination_ctf_oneway+12
INDIRI4
CNSTI4 0
LEI4 $348
line 540
;540:		for (i = 0; i < numteammates; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $354
JUMPV
LABELV $351
line 542
;541:			//
;542:			ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 543
;543:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 544
;544:			BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 545
;545:			BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 546
;546:		}
LABELV $352
line 540
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $354
ADDRLP4 0
INDIRI4
ADDRLP4 1064
INDIRI4
LTI4 $351
line 547
;547:		return;
ADDRGP4 $340
JUMPV
LABELV $348
line 551
;548:	}
;549:
;550:	//passive strategy
;551:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 11080
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $355
line 553
;552:		//different orders based on the number of team mates
;553:		switch(bs->numteammates) {
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 1
EQI4 $356
ADDRLP4 1084
INDIRI4
CNSTI4 2
EQI4 $361
ADDRLP4 1084
INDIRI4
CNSTI4 3
EQI4 $367
ADDRGP4 $357
JUMPV
line 554
;554:			case 1: break;
LABELV $361
line 556
;555:			case 2:
;556:			{
line 558
;557:				// keep one near the base for when the flag is returned
;558:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 559
;559:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 560
;560:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 561
;561:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 563
;562:				//
;563:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 564
;564:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 565
;565:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 566
;566:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 567
;567:				break;
ADDRGP4 $356
JUMPV
LABELV $367
line 570
;568:			}
;569:			case 3:
;570:			{
line 572
;571:				//keep one near the base for when the flag is returned
;572:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 573
;573:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 574
;574:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 575
;575:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 577
;576:				//the other two get the flag
;577:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 578
;578:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 579
;579:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 580
;580:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 582
;581:				//
;582:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 583
;583:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 584
;584:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 585
;585:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 586
;586:				break;
ADDRGP4 $356
JUMPV
LABELV $357
line 589
;587:			}
;588:			default:
;589:			{
line 591
;590:				//keep some people near the base for when the flag is returned
;591:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 1068
CNSTF4 1050253722
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 592
;592:				if (defenders > 3) defenders = 3;
ADDRLP4 1068
INDIRI4
CNSTI4 3
LEI4 $374
ADDRLP4 1068
CNSTI4 3
ASGNI4
LABELV $374
line 593
;593:				attackers = (int) (float) numteammates * 0.6 + 0.5;
ADDRLP4 1072
CNSTF4 1058642330
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 594
;594:				if (attackers > 6) attackers = 6;
ADDRLP4 1072
INDIRI4
CNSTI4 6
LEI4 $376
ADDRLP4 1072
CNSTI4 6
ASGNI4
LABELV $376
line 595
;595:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $381
JUMPV
LABELV $378
line 597
;596:					//
;597:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 598
;598:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 599
;599:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 600
;600:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 601
;601:				}
LABELV $379
line 595
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $381
ADDRLP4 0
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $378
line 602
;602:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $385
JUMPV
LABELV $382
line 604
;603:					//
;604:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 605
;605:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 606
;606:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 607
;607:					BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 608
;608:				}
LABELV $383
line 602
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $385
ADDRLP4 0
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $382
line 610
;609:				//
;610:				break;
line 613
;611:			}
;612:		}
;613:	}
ADDRGP4 $356
JUMPV
LABELV $355
line 614
;614:	else {
line 616
;615:		//different orders based on the number of team mates
;616:		switch(bs->numteammates) {
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 1
EQI4 $389
ADDRLP4 1084
INDIRI4
CNSTI4 2
EQI4 $392
ADDRLP4 1084
INDIRI4
CNSTI4 3
EQI4 $396
ADDRGP4 $388
JUMPV
line 617
;617:			case 1: break;
LABELV $392
line 619
;618:			case 2:
;619:			{
line 621
;620:				//both will go for the enemy flag
;621:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 622
;622:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 623
;623:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 624
;624:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 626
;625:				//
;626:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 627
;627:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 628
;628:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 629
;629:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 630
;630:				break;
ADDRGP4 $389
JUMPV
LABELV $396
line 633
;631:			}
;632:			case 3:
;633:			{
line 635
;634:				//everyone go for the flag
;635:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 636
;636:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 637
;637:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 638
;638:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 640
;639:				//
;640:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 641
;641:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 642
;642:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 643
;643:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 645
;644:				//
;645:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 646
;646:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 647
;647:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 648
;648:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 649
;649:				break;
ADDRGP4 $389
JUMPV
LABELV $388
line 652
;650:			}
;651:			default:
;652:			{
line 654
;653:				//keep some people near the base for when the flag is returned
;654:				defenders = (int) (float) numteammates * 0.2 + 0.5;
ADDRLP4 1068
CNSTF4 1045220557
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 655
;655:				if (defenders > 2) defenders = 2;
ADDRLP4 1068
INDIRI4
CNSTI4 2
LEI4 $403
ADDRLP4 1068
CNSTI4 2
ASGNI4
LABELV $403
line 656
;656:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 1072
CNSTF4 1060320051
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 657
;657:				if (attackers > 7) attackers = 7;
ADDRLP4 1072
INDIRI4
CNSTI4 7
LEI4 $405
ADDRLP4 1072
CNSTI4 7
ASGNI4
LABELV $405
line 658
;658:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $410
JUMPV
LABELV $407
line 660
;659:					//
;660:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 661
;661:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 662
;662:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 663
;663:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 664
;664:				}
LABELV $408
line 658
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $410
ADDRLP4 0
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $407
line 665
;665:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $414
JUMPV
LABELV $411
line 667
;666:					//
;667:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 668
;668:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 669
;669:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 670
;670:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 671
;671:				}
LABELV $412
line 665
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $414
ADDRLP4 0
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $411
line 673
;672:				//
;673:				break;
LABELV $389
line 676
;674:			}
;675:		}
;676:	}
LABELV $356
line 677
;677:}
LABELV $340
endproc BotCTFOrders_FlagNotAtBase 1092 16
export BotCTFOrders_EnemyFlagNotAtBase
proc BotCTFOrders_EnemyFlagNotAtBase 1128 20
line 684
;678:
;679:/*
;680:==================
;681:BotCTFOrders
;682:==================
;683:*/
;684:void BotCTFOrders_EnemyFlagNotAtBase(bot_state_t *bs) {
line 689
;685:	int numteammates, defenders, attackers, i, other;
;686:	int teammates[MAX_CLIENTS];
;687:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;688:
;689:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $419
line 690
;690:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1116
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $421
line 691
;691:        return; // spbot no chat
ADDRGP4 $418
JUMPV
LABELV $421
line 692
;692:}}
LABELV $419
line 694
;693:
;694:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $423
ADDRGP4 $418
JUMPV
LABELV $423
line 696
;695:
;696:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1116
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1116
INDIRI4
ASGNI4
line 697
;697:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 699
;698:	//different orders based on the number of team mates
;699:	switch(numteammates) {
ADDRLP4 1028
INDIRI4
CNSTI4 1
EQI4 $427
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $429
ADDRLP4 1028
INDIRI4
CNSTI4 3
EQI4 $433
ADDRGP4 $426
JUMPV
line 700
;700:		case 1: break;
LABELV $429
line 702
;701:		case 2:
;702:		{
line 704
;703:			//tell the one not carrying the flag to defend the base
;704:			if (teammates[0] == bs->flagcarrier) other = teammates[1];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $430
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
ADDRGP4 $431
JUMPV
LABELV $430
line 705
;705:			else other = teammates[0];
ADDRLP4 1076
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $431
line 706
;706:			ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 707
;707:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 708
;708:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 709
;709:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 710
;710:			break;
ADDRGP4 $427
JUMPV
LABELV $433
line 713
;711:		}
;712:		case 3:
;713:		{
line 715
;714:			//tell the one closest to the base not carrying the flag to defend the base
;715:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
EQI4 $434
ADDRLP4 1076
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $435
JUMPV
LABELV $434
line 716
;716:			else other = teammates[1];
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $435
line 717
;717:			ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 718
;718:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 719
;719:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 720
;720:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 722
;721:			//tell the other also to defend the base
;722:			if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
EQI4 $437
ADDRLP4 1076
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $438
JUMPV
LABELV $437
line 723
;723:			else other = teammates[1];
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $438
line 724
;724:			ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 725
;725:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 726
;726:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 727
;727:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 728
;728:			break;
ADDRGP4 $427
JUMPV
LABELV $426
line 731
;729:		}
;730:		default:
;731:		{
line 733
;732:			//60% will defend the base
;733:			defenders = (int) (float) numteammates * 0.6 + 0.5;
ADDRLP4 1068
CNSTF4 1058642330
ADDRLP4 1028
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 734
;734:			if (defenders > 6) defenders = 6;
ADDRLP4 1068
INDIRI4
CNSTI4 6
LEI4 $442
ADDRLP4 1068
CNSTI4 6
ASGNI4
LABELV $442
line 736
;735:			//30% accompanies the flag carrier
;736:			attackers = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 1072
CNSTF4 1050253722
ADDRLP4 1028
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 737
;737:			if (attackers > 3) attackers = 3;
ADDRLP4 1072
INDIRI4
CNSTI4 3
LEI4 $444
ADDRLP4 1072
CNSTI4 3
ASGNI4
LABELV $444
line 738
;738:			for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $449
JUMPV
LABELV $446
line 740
;739:				//
;740:				if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $450
line 741
;741:					continue;
ADDRGP4 $447
JUMPV
LABELV $450
line 743
;742:				}
;743:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 744
;744:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 745
;745:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 746
;746:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 747
;747:			}
LABELV $447
line 738
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $449
ADDRLP4 0
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $446
line 749
;748:			// if we have a flag carrier
;749:			if ( bs->flagcarrier != -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $452
line 750
;750:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 751
;751:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $457
JUMPV
LABELV $454
line 753
;752:					//
;753:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $458
line 754
;754:						continue;
ADDRGP4 $455
JUMPV
LABELV $458
line 757
;755:					}
;756:					//
;757:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 758
;758:					if (bs->flagcarrier == bs->client) {
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ADDRLP4 1124
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $462
line 759
;759:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 760
;760:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $244
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 761
;761:					}
ADDRGP4 $463
JUMPV
LABELV $462
line 762
;762:					else {
line 763
;763:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1080
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 764
;764:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $252
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 765
;765:					}
LABELV $463
line 766
;766:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 767
;767:				}
LABELV $455
line 751
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $457
ADDRLP4 0
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $454
line 768
;768:			}
ADDRGP4 $427
JUMPV
LABELV $452
line 769
;769:			else {
line 770
;770:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $470
JUMPV
LABELV $467
line 772
;771:					//
;772:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $471
line 773
;773:						continue;
ADDRGP4 $468
JUMPV
LABELV $471
line 776
;774:					}
;775:					//
;776:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 777
;777:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 778
;778:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 779
;779:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 780
;780:				}
LABELV $468
line 770
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $470
ADDRLP4 0
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $467
line 781
;781:			}
line 783
;782:			//
;783:			break;
LABELV $427
line 786
;784:		}
;785:	}
;786:}
LABELV $418
endproc BotCTFOrders_EnemyFlagNotAtBase 1128 20
export BotDDorders_Standard
proc BotDDorders_Standard 1072 16
line 794
;787:
;788:/*
;789:==================
;790:BotDDorders
;791:==================
;792:*/
;793:
;794:void BotDDorders_Standard(bot_state_t *bs) {
line 799
;795:	int numteammates, i;
;796:	int teammates[MAX_CLIENTS];
;797:	char name[MAX_NETNAME];
;798:
;799:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $478
line 800
;800:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1068
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $480
line 801
;801:        return; // spbot no chat
ADDRGP4 $477
JUMPV
LABELV $480
line 802
;802:}}
LABELV $478
line 804
;803:
;804:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $482
ADDRGP4 $477
JUMPV
LABELV $482
line 807
;805:
;806:	//sort team mates by travel time to base
;807:	numteammates = BotSortTeamMatesByRelativeTravelTime2ddA(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1068
ADDRGP4 BotSortTeamMatesByRelativeTravelTime2ddA
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1068
INDIRI4
ASGNI4
line 809
;808:
;809:	switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $486
ADDRGP4 $485
JUMPV
line 810
;810:		case 1: break;
LABELV $485
line 826
;811:		/*case 2: 
;812:		{
;813:			//the one closest to point A will take that
;814:			ClientName(teammates[0], name, sizeof(name));
;815:			BotAI_BotInitialChat(bs, "cmd_takea", name, NULL);
;816:			BotSayTeamOrder(bs, teammates[0]);
;817:			//BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_TAKEA);
;818:			//the other goes for point B
;819:			ClientName(teammates[1], name, sizeof(name));
;820:			BotAI_BotInitialChat(bs, "cmd_takeb", name, NULL);
;821:			BotSayTeamOrder(bs, teammates[1]);
;822:			//BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_TAKEB);
;823:			break;
;824:		}*/
;825:		default:
;826:		{
line 827
;827:			for(i=0;i<numteammates/2;i++) { //Half take point A
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $491
JUMPV
LABELV $488
line 828
;828:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 829
;829:				BotAI_BotInitialChat(bs, "cmd_takea", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $492
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 830
;830:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 832
;831:				//BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_TAKEA);
;832:			}
LABELV $489
line 827
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $491
ADDRLP4 0
INDIRI4
ADDRLP4 1064
INDIRI4
CNSTI4 2
DIVI4
LTI4 $488
line 833
;833:			for(i=numteammates/2+1;i<numteammates;i++) { //Rest takes point B
ADDRLP4 0
ADDRLP4 1064
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $496
JUMPV
LABELV $493
line 834
;834:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 835
;835:				BotAI_BotInitialChat(bs, "cmd_takeb", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $497
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 836
;836:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 838
;837:				//BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_TAKEB);
;838:			}
LABELV $494
line 833
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $496
ADDRLP4 0
INDIRI4
ADDRLP4 1064
INDIRI4
LTI4 $493
line 839
;839:			break;
LABELV $486
line 842
;840:		}
;841:	}
;842:}
LABELV $477
endproc BotDDorders_Standard 1072 16
export BotCTFOrders_BothFlagsAtBase
proc BotCTFOrders_BothFlagsAtBase 1092 16
line 849
;843:
;844:/*
;845:==================
;846:BotCTFOrders
;847:==================
;848:*/
;849:void BotCTFOrders_BothFlagsAtBase(bot_state_t *bs) {
line 855
;850:	int numteammates, defenders, attackers, i;
;851:	int teammates[MAX_CLIENTS];
;852:	char name[MAX_NETNAME];
;853:	qboolean weAreAttacking;
;854:
;855:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $499
line 856
;856:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1080
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $501
line 857
;857:        return; // spbot no chat
ADDRGP4 $498
JUMPV
LABELV $501
line 858
;858:}}
LABELV $499
line 859
;859:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $503
ADDRGP4 $498
JUMPV
LABELV $503
line 862
;860:
;861:	//sort team mates by travel time to base
;862:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1080
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1080
INDIRI4
ASGNI4
line 864
;863:	//sort team mates by CTF preference
;864:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 866
;865:
;866:	weAreAttacking = qfalse;
ADDRLP4 1068
CNSTI4 0
ASGNI4
line 868
;867:
;868:	if(g_elimination_ctf_oneway.integer > 0) {
ADDRGP4 g_elimination_ctf_oneway+12
INDIRI4
CNSTI4 0
LEI4 $506
line 870
;869:		//See if we are attacking:
;870:		if( ( (level.eliminationSides+level.roundNumber)%2 == 0 ) && (BotTeam(bs) == TEAM_RED))
ADDRGP4 level+10024
INDIRI4
ADDRGP4 level+10004
INDIRI4
ADDI4
CNSTI4 2
MODI4
CNSTI4 0
NEI4 $509
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 1
NEI4 $509
line 871
;871:			weAreAttacking = qtrue;
ADDRLP4 1068
CNSTI4 1
ASGNI4
LABELV $509
line 873
;872:		
;873:		if(weAreAttacking) {
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $513
line 874
;874:			for (i = 0; i < numteammates; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $518
JUMPV
LABELV $515
line 876
;875:				//
;876:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 877
;877:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 878
;878:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 879
;879:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 880
;880:			}
LABELV $516
line 874
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $518
ADDRLP4 0
INDIRI4
ADDRLP4 1064
INDIRI4
LTI4 $515
line 881
;881:		} else {
ADDRGP4 $498
JUMPV
LABELV $513
line 882
;882:			for (i = 0; i < numteammates; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $522
JUMPV
LABELV $519
line 884
;883:				//
;884:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 885
;885:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 886
;886:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 887
;887:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 888
;888:			}
LABELV $520
line 882
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $522
ADDRLP4 0
INDIRI4
ADDRLP4 1064
INDIRI4
LTI4 $519
line 889
;889:		}
line 890
;890:		return; //Sago: Or the leader will make a counter order.
ADDRGP4 $498
JUMPV
LABELV $506
line 894
;891:	}
;892:
;893:	//passive strategy
;894:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 11080
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $523
line 896
;895:		//different orders based on the number of team mates
;896:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $524
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $528
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $532
ADDRGP4 $525
JUMPV
line 897
;897:			case 1: break;
LABELV $528
line 899
;898:			case 2:
;899:			{
line 901
;900:				//the one closest to the base will defend the base
;901:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 902
;902:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 903
;903:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 904
;904:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 906
;905:				//the other will get the flag
;906:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 907
;907:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 908
;908:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 909
;909:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 910
;910:				break;
ADDRGP4 $524
JUMPV
LABELV $532
line 913
;911:			}
;912:			case 3:
;913:			{
line 915
;914:				//the one closest to the base will defend the base
;915:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 916
;916:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 917
;917:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 918
;918:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 920
;919:				//the second one closest to the base will defend the base
;920:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 921
;921:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 922
;922:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 923
;923:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 925
;924:				//the other will get the flag
;925:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 926
;926:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 927
;927:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 928
;928:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 929
;929:				break;
ADDRGP4 $524
JUMPV
LABELV $525
line 932
;930:			}
;931:			default:
;932:			{
line 933
;933:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 1088
CNSTF4 1056964608
ASGNF4
ADDRLP4 1072
ADDRLP4 1088
INDIRF4
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
ADDRLP4 1088
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 934
;934:				if (defenders > 5) defenders = 5;
ADDRLP4 1072
INDIRI4
CNSTI4 5
LEI4 $539
ADDRLP4 1072
CNSTI4 5
ASGNI4
LABELV $539
line 935
;935:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 1076
CNSTF4 1053609165
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 936
;936:				if (attackers > 4) attackers = 4;
ADDRLP4 1076
INDIRI4
CNSTI4 4
LEI4 $541
ADDRLP4 1076
CNSTI4 4
ASGNI4
LABELV $541
line 937
;937:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $546
JUMPV
LABELV $543
line 939
;938:					//
;939:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 940
;940:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 941
;941:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 942
;942:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 943
;943:				}
LABELV $544
line 937
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $546
ADDRLP4 0
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $543
line 944
;944:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $550
JUMPV
LABELV $547
line 946
;945:					//
;946:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 947
;947:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 948
;948:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 949
;949:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 950
;950:				}
LABELV $548
line 944
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $550
ADDRLP4 0
INDIRI4
ADDRLP4 1076
INDIRI4
LTI4 $547
line 952
;951:				//
;952:				break;
line 955
;953:			}
;954:		}
;955:	}
ADDRGP4 $524
JUMPV
LABELV $523
line 956
;956:	else {
line 958
;957:		//different orders based on the number of team mates
;958:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $555
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $557
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $561
ADDRGP4 $554
JUMPV
line 959
;959:			case 1: break;
LABELV $557
line 961
;960:			case 2:
;961:			{
line 963
;962:				//the one closest to the base will defend the base
;963:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 964
;964:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 965
;965:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 966
;966:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 968
;967:				//the other will get the flag
;968:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 969
;969:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 970
;970:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 971
;971:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 972
;972:				break;
ADDRGP4 $555
JUMPV
LABELV $561
line 975
;973:			}
;974:			case 3:
;975:			{
line 977
;976:				//the one closest to the base will defend the base
;977:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 978
;978:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 979
;979:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 980
;980:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 982
;981:				//the others should go for the enemy flag
;982:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 983
;983:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 984
;984:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 985
;985:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 987
;986:				//
;987:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 988
;988:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 989
;989:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 990
;990:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 991
;991:				break;
ADDRGP4 $555
JUMPV
LABELV $554
line 994
;992:			}
;993:			default:
;994:			{
line 995
;995:				defenders = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 1072
CNSTF4 1053609165
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 996
;996:				if (defenders > 4) defenders = 4;
ADDRLP4 1072
INDIRI4
CNSTI4 4
LEI4 $568
ADDRLP4 1072
CNSTI4 4
ASGNI4
LABELV $568
line 997
;997:				attackers = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 1088
CNSTF4 1056964608
ASGNF4
ADDRLP4 1076
ADDRLP4 1088
INDIRF4
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
ADDRLP4 1088
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 998
;998:				if (attackers > 5) attackers = 5;
ADDRLP4 1076
INDIRI4
CNSTI4 5
LEI4 $570
ADDRLP4 1076
CNSTI4 5
ASGNI4
LABELV $570
line 999
;999:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $575
JUMPV
LABELV $572
line 1001
;1000:					//
;1001:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1002
;1002:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1003
;1003:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1004
;1004:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1005
;1005:				}
LABELV $573
line 999
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $575
ADDRLP4 0
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $572
line 1006
;1006:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $579
JUMPV
LABELV $576
line 1008
;1007:					//
;1008:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1009
;1009:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1010
;1010:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1011
;1011:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1012
;1012:				}
LABELV $577
line 1006
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $579
ADDRLP4 0
INDIRI4
ADDRLP4 1076
INDIRI4
LTI4 $576
line 1014
;1013:				//
;1014:				break;
LABELV $555
line 1017
;1015:			}
;1016:		}
;1017:	}
LABELV $524
line 1018
;1018:}
LABELV $498
endproc BotCTFOrders_BothFlagsAtBase 1092 16
export BotCTFOrders
proc BotCTFOrders 20 4
line 1025
;1019:
;1020:/*
;1021:==================
;1022:BotCTFOrders
;1023:==================
;1024:*/
;1025:void BotCTFOrders(bot_state_t *bs) {
line 1029
;1026:	int flagstatus;
;1027:
;1028:	//
;1029:	if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $584
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 11056
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 11060
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $585
JUMPV
LABELV $584
line 1030
;1030:	else flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 11060
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 11056
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $585
line 1032
;1031:	//
;1032:	switch(flagstatus) {
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $586
ADDRLP4 16
INDIRI4
CNSTI4 3
GTI4 $586
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $592
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $592
address $588
address $589
address $590
address $591
code
LABELV $588
line 1033
;1033:		case 0: BotCTFOrders_BothFlagsAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_BothFlagsAtBase
CALLV
pop
ADDRGP4 $587
JUMPV
LABELV $589
line 1034
;1034:		case 1: BotCTFOrders_EnemyFlagNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_EnemyFlagNotAtBase
CALLV
pop
ADDRGP4 $587
JUMPV
LABELV $590
line 1035
;1035:		case 2: BotCTFOrders_FlagNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_FlagNotAtBase
CALLV
pop
ADDRGP4 $587
JUMPV
LABELV $591
line 1036
;1036:		case 3: BotCTFOrders_BothFlagsNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_BothFlagsNotAtBase
CALLV
pop
LABELV $586
LABELV $587
line 1038
;1037:	}
;1038:}
LABELV $583
endproc BotCTFOrders 20 4
export BotDDorders
proc BotDDorders 0 4
line 1045
;1039:
;1040:/*
;1041:==================
;1042:BotDDorders
;1043:==================
;1044:*/
;1045:void BotDDorders(bot_state_t *bs) {
line 1046
;1046:	BotDDorders_Standard(bs);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDDorders_Standard
CALLV
pop
line 1047
;1047:}
LABELV $593
endproc BotDDorders 0 4
export BotCreateGroup
proc BotCreateGroup 80 20
line 1055
;1048:
;1049:
;1050:/*
;1051:==================
;1052:BotCreateGroup
;1053:==================
;1054:*/
;1055:void BotCreateGroup(bot_state_t *bs, int *teammates, int groupsize) {
line 1058
;1056:	char name[MAX_NETNAME], leadername[MAX_NETNAME];
;1057:	int i;
;1058:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $595
line 1059
;1059:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 76
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $597
line 1060
;1060:        return; // spbot no chat
ADDRGP4 $594
JUMPV
LABELV $597
line 1061
;1061:}}
LABELV $595
line 1062
;1062:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $599
ADDRGP4 $594
JUMPV
LABELV $599
line 1065
;1063:
;1064:	// the others in the group will follow the teammates[0]
;1065:	ClientName(teammates[0], leadername, sizeof(leadername));
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1066
;1066:	for (i = 1; i < groupsize; i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $605
JUMPV
LABELV $602
line 1067
;1067:	{
line 1068
;1068:		ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1069
;1069:		if (teammates[0] == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $606
line 1070
;1070:			BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1071
;1071:		}
ADDRGP4 $607
JUMPV
LABELV $606
line 1072
;1072:		else {
line 1073
;1073:			BotAI_BotInitialChat(bs, "cmd_accompany", name, leadername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1074
;1074:		}
LABELV $607
line 1075
;1075:		BotSayTeamOrderAlways(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrderAlways
CALLV
pop
line 1076
;1076:	}
LABELV $603
line 1066
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $605
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $602
line 1077
;1077:}
LABELV $594
endproc BotCreateGroup 80 20
bss
align 4
LABELV $609
skip 4
export BotTeamOrders
code
proc BotTeamOrders 2084 12
line 1086
;1078:
;1079:/*
;1080:==================
;1081:BotTeamOrders
;1082:
;1083:  FIXME: defend key areas?
;1084:==================
;1085:*/
;1086:void BotTeamOrders(bot_state_t *bs) {
line 1092
;1087:	int teammates[MAX_CLIENTS];
;1088:	int numteammates, i;
;1089:	char buf[MAX_INFO_STRING];
;1090:	static int maxclients;
;1091:
;1092:	if (!maxclients)
ADDRGP4 $609
INDIRI4
CNSTI4 0
NEI4 $610
line 1093
;1093:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $74
ARGP4
ADDRLP4 2056
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $609
ADDRLP4 2056
INDIRI4
ASGNI4
LABELV $610
line 1095
;1094:
;1095:	numteammates = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 1096
;1096:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $615
JUMPV
LABELV $612
line 1097
;1097:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1099
;1098:		//if no config string or no name
;1099:		if (!strlen(buf) || !strlen(Info_ValueForKey(buf, "n"))) continue;
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $618
ADDRLP4 4
ARGP4
ADDRGP4 $81
ARGP4
ADDRLP4 2064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRLP4 2068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $616
LABELV $618
ADDRGP4 $613
JUMPV
LABELV $616
line 1101
;1100:		//skip spectators
;1101:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 4
ARGP4
ADDRGP4 $85
ARGP4
ADDRLP4 2072
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 3
NEI4 $619
ADDRGP4 $613
JUMPV
LABELV $619
line 1103
;1102:		//
;1103:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2080
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
EQI4 $621
line 1104
;1104:			teammates[numteammates] = i;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1105
;1105:			numteammates++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1106
;1106:		}
LABELV $621
line 1107
;1107:	}
LABELV $613
line 1096
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $615
ADDRLP4 0
INDIRI4
ADDRGP4 $609
INDIRI4
GEI4 $623
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $612
LABELV $623
line 1109
;1108:	//
;1109:	switch(numteammates) {
ADDRLP4 1028
INDIRI4
CNSTI4 1
LTI4 $624
ADDRLP4 1028
INDIRI4
CNSTI4 5
GTI4 $624
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $639-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $639
address $625
address $625
address $628
address $629
address $631
code
line 1110
;1110:		case 1: break;
line 1112
;1111:		case 2:
;1112:		{
line 1114
;1113:			//nothing special
;1114:			break;
LABELV $628
line 1117
;1115:		}
;1116:		case 3:
;1117:		{
line 1119
;1118:			//have one follow another and one free roaming
;1119:			BotCreateGroup(bs, teammates, 2);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 1120
;1120:			break;
ADDRGP4 $625
JUMPV
LABELV $629
line 1123
;1121:		}
;1122:		case 4:
;1123:		{
line 1124
;1124:			BotCreateGroup(bs, teammates, 2);		//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 1125
;1125:			BotCreateGroup(bs, &teammates[2], 2);	//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032+8
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 1126
;1126:			break;
ADDRGP4 $625
JUMPV
LABELV $631
line 1129
;1127:		}
;1128:		case 5:
;1129:		{
line 1130
;1130:			BotCreateGroup(bs, teammates, 2);		//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 1131
;1131:			BotCreateGroup(bs, &teammates[2], 3);	//a group of 3
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032+8
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 1132
;1132:			break;
ADDRGP4 $625
JUMPV
LABELV $624
line 1135
;1133:		}
;1134:		default:
;1135:		{
line 1136
;1136:			if (numteammates <= 10) {
ADDRLP4 1028
INDIRI4
CNSTI4 10
GTI4 $625
line 1137
;1137:				for (i = 0; i < numteammates / 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $638
JUMPV
LABELV $635
line 1138
;1138:					BotCreateGroup(bs, &teammates[i*2], 2);	//groups of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2068
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 2068
INDIRI4
LSHI4
ADDRLP4 1032
ADDP4
ARGP4
ADDRLP4 2068
INDIRI4
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 1139
;1139:				}
LABELV $636
line 1137
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $638
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
DIVI4
LTI4 $635
line 1140
;1140:			}
line 1141
;1141:			break;
LABELV $625
line 1144
;1142:		}
;1143:	}
;1144:}
LABELV $608
endproc BotTeamOrders 2084 12
export Bot1FCTFOrders_FlagAtCenter
proc Bot1FCTFOrders_FlagAtCenter 1088 16
line 1153
;1145:
;1146:/*
;1147:==================
;1148:Bot1FCTFOrders_FlagAtCenter
;1149:
;1150:  X% defend the base, Y% get the flag
;1151:==================
;1152:*/
;1153:void Bot1FCTFOrders_FlagAtCenter(bot_state_t *bs) {
line 1158
;1154:	int numteammates, defenders, attackers, i;
;1155:	int teammates[MAX_CLIENTS];
;1156:	char name[MAX_NETNAME];
;1157:
;1158:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $642
line 1159
;1159:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1076
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $644
line 1160
;1160:        return; // spbot no chat
ADDRGP4 $641
JUMPV
LABELV $644
line 1161
;1161:}}
LABELV $642
line 1163
;1162:
;1163:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $646
ADDRGP4 $641
JUMPV
LABELV $646
line 1166
;1164:
;1165:	//sort team mates by travel time to base
;1166:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1076
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1076
INDIRI4
ASGNI4
line 1168
;1167:	//sort team mates by CTF preference
;1168:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 1170
;1169:	//passive strategy
;1170:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 11080
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $649
line 1172
;1171:		//different orders based on the number of team mates
;1172:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $650
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $654
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $658
ADDRGP4 $651
JUMPV
line 1173
;1173:			case 1: break;
LABELV $654
line 1175
;1174:			case 2:
;1175:			{
line 1177
;1176:				//the one closest to the base will defend the base
;1177:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1178
;1178:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1179
;1179:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1180
;1180:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1182
;1181:				//the other will get the flag
;1182:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1183
;1183:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1184
;1184:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1185
;1185:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1186
;1186:				break;
ADDRGP4 $650
JUMPV
LABELV $658
line 1189
;1187:			}
;1188:			case 3:
;1189:			{
line 1191
;1190:				//the one closest to the base will defend the base
;1191:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1192
;1192:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1193
;1193:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1194
;1194:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1196
;1195:				//the second one closest to the base will defend the base
;1196:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1197
;1197:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1198
;1198:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1199
;1199:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1201
;1200:				//the other will get the flag
;1201:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1202
;1202:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1203
;1203:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1204
;1204:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1205
;1205:				break;
ADDRGP4 $650
JUMPV
LABELV $651
line 1208
;1206:			}
;1207:			default:
;1208:			{
line 1210
;1209:				//50% defend the base
;1210:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 1084
CNSTF4 1056964608
ASGNF4
ADDRLP4 1068
ADDRLP4 1084
INDIRF4
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
ADDRLP4 1084
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 1211
;1211:				if (defenders > 5) defenders = 5;
ADDRLP4 1068
INDIRI4
CNSTI4 5
LEI4 $664
ADDRLP4 1068
CNSTI4 5
ASGNI4
LABELV $664
line 1213
;1212:				//40% get the flag
;1213:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 1072
CNSTF4 1053609165
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1214
;1214:				if (attackers > 4) attackers = 4;
ADDRLP4 1072
INDIRI4
CNSTI4 4
LEI4 $666
ADDRLP4 1072
CNSTI4 4
ASGNI4
LABELV $666
line 1215
;1215:				for (i = 0; i < defenders; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $671
JUMPV
LABELV $668
line 1217
;1216:					//
;1217:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1218
;1218:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1219
;1219:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1220
;1220:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1221
;1221:				}
LABELV $669
line 1215
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $671
ADDRLP4 1024
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $668
line 1222
;1222:				for (i = 0; i < attackers; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $675
JUMPV
LABELV $672
line 1224
;1223:					//
;1224:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1225
;1225:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1226
;1226:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1227
;1227:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1228
;1228:				}
LABELV $673
line 1222
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $675
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $672
line 1230
;1229:				//
;1230:				break;
line 1233
;1231:			}
;1232:		}
;1233:	}
ADDRGP4 $650
JUMPV
LABELV $649
line 1234
;1234:	else { //agressive
line 1236
;1235:		//different orders based on the number of team mates
;1236:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $680
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $682
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $686
ADDRGP4 $679
JUMPV
line 1237
;1237:			case 1: break;
LABELV $682
line 1239
;1238:			case 2:
;1239:			{
line 1241
;1240:				//the one closest to the base will defend the base
;1241:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1242
;1242:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1243
;1243:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1244
;1244:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1246
;1245:				//the other will get the flag
;1246:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1247
;1247:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1248
;1248:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1249
;1249:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1250
;1250:				break;
ADDRGP4 $680
JUMPV
LABELV $686
line 1253
;1251:			}
;1252:			case 3:
;1253:			{
line 1255
;1254:				//the one closest to the base will defend the base
;1255:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1256
;1256:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1257
;1257:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1258
;1258:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1260
;1259:				//the others should go for the enemy flag
;1260:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1261
;1261:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1262
;1262:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1263
;1263:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1265
;1264:				//
;1265:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1266
;1266:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1267
;1267:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1268
;1268:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1269
;1269:				break;
ADDRGP4 $680
JUMPV
LABELV $679
line 1272
;1270:			}
;1271:			default:
;1272:			{
line 1274
;1273:				//30% defend the base
;1274:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 1068
CNSTF4 1050253722
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1275
;1275:				if (defenders > 3) defenders = 3;
ADDRLP4 1068
INDIRI4
CNSTI4 3
LEI4 $693
ADDRLP4 1068
CNSTI4 3
ASGNI4
LABELV $693
line 1277
;1276:				//60% get the flag
;1277:				attackers = (int) (float) numteammates * 0.6 + 0.5;
ADDRLP4 1072
CNSTF4 1058642330
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1278
;1278:				if (attackers > 6) attackers = 6;
ADDRLP4 1072
INDIRI4
CNSTI4 6
LEI4 $695
ADDRLP4 1072
CNSTI4 6
ASGNI4
LABELV $695
line 1279
;1279:				for (i = 0; i < defenders; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $700
JUMPV
LABELV $697
line 1281
;1280:					//
;1281:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1282
;1282:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1283
;1283:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1284
;1284:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1285
;1285:				}
LABELV $698
line 1279
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $700
ADDRLP4 1024
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $697
line 1286
;1286:				for (i = 0; i < attackers; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $704
JUMPV
LABELV $701
line 1288
;1287:					//
;1288:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1289
;1289:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1290
;1290:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1291
;1291:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1292
;1292:				}
LABELV $702
line 1286
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $704
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $701
line 1294
;1293:				//
;1294:				break;
LABELV $680
line 1297
;1295:			}
;1296:		}
;1297:	}
LABELV $650
line 1298
;1298:}
LABELV $641
endproc Bot1FCTFOrders_FlagAtCenter 1088 16
export Bot1FCTFOrders_TeamHasFlag
proc Bot1FCTFOrders_TeamHasFlag 1128 20
line 1307
;1299:
;1300:/*
;1301:==================
;1302:Bot1FCTFOrders_TeamHasFlag
;1303:
;1304:  X% towards neutral flag, Y% go towards enemy base and accompany flag carrier if visible
;1305:==================
;1306:*/
;1307:void Bot1FCTFOrders_TeamHasFlag(bot_state_t *bs) {
line 1312
;1308:	int numteammates, defenders, attackers, i, other;
;1309:	int teammates[MAX_CLIENTS];
;1310:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;1311:
;1312:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $709
line 1313
;1313:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1116
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $711
line 1314
;1314:        return; // spbot no chat
ADDRGP4 $708
JUMPV
LABELV $711
line 1315
;1315:}}
LABELV $709
line 1317
;1316:
;1317:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $713
ADDRGP4 $708
JUMPV
LABELV $713
line 1320
;1318:
;1319:	//sort team mates by travel time to base
;1320:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1116
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1116
INDIRI4
ASGNI4
line 1322
;1321:	//sort team mates by CTF preference
;1322:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 1324
;1323:	//passive strategy
;1324:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 11080
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $716
line 1326
;1325:		//different orders based on the number of team mates
;1326:		switch(numteammates) {
ADDRLP4 1028
INDIRI4
CNSTI4 1
EQI4 $717
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $721
ADDRLP4 1028
INDIRI4
CNSTI4 3
EQI4 $727
ADDRGP4 $718
JUMPV
line 1327
;1327:			case 1: break;
LABELV $721
line 1329
;1328:			case 2:
;1329:			{
line 1331
;1330:				//tell the one not carrying the flag to attack the enemy base
;1331:				if (teammates[0] == bs->flagcarrier) other = teammates[1];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $722
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
ADDRGP4 $723
JUMPV
LABELV $722
line 1332
;1332:				else other = teammates[0];
ADDRLP4 1076
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $723
line 1333
;1333:				ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1334
;1334:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $725
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1335
;1335:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1336
;1336:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1337
;1337:				break;
ADDRGP4 $717
JUMPV
LABELV $727
line 1340
;1338:			}
;1339:			case 3:
;1340:			{
line 1342
;1341:				//tell the one closest to the base not carrying the flag to defend the base
;1342:				if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
EQI4 $728
ADDRLP4 1076
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $729
JUMPV
LABELV $728
line 1343
;1343:				else other = teammates[1];
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $729
line 1344
;1344:				ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1345
;1345:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1346
;1346:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1347
;1347:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1349
;1348:				//tell the one furthest from the base not carrying the flag to accompany the flag carrier
;1349:				if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
EQI4 $731
ADDRLP4 1076
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $732
JUMPV
LABELV $731
line 1350
;1350:				else other = teammates[1];
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $732
line 1351
;1351:				ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1352
;1352:				if ( bs->flagcarrier != -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $736
line 1353
;1353:					ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1354
;1354:					if (bs->flagcarrier == bs->client) {
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ADDRLP4 1124
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $738
line 1355
;1355:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1356
;1356:						BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $244
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1357
;1357:					}
ADDRGP4 $737
JUMPV
LABELV $738
line 1358
;1358:					else {
line 1359
;1359:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1080
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1360
;1360:						BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $252
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1361
;1361:					}
line 1362
;1362:				}
ADDRGP4 $737
JUMPV
LABELV $736
line 1363
;1363:				else {
line 1365
;1364:					//
;1365:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1366
;1366:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1367
;1367:				}
LABELV $737
line 1368
;1368:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1369
;1369:				break;
ADDRGP4 $717
JUMPV
LABELV $718
line 1372
;1370:			}
;1371:			default:
;1372:			{
line 1374
;1373:				//30% will defend the base
;1374:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 1068
CNSTF4 1050253722
ADDRLP4 1028
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1375
;1375:				if (defenders > 3) defenders = 3;
ADDRLP4 1068
INDIRI4
CNSTI4 3
LEI4 $740
ADDRLP4 1068
CNSTI4 3
ASGNI4
LABELV $740
line 1377
;1376:				//70% accompanies the flag carrier
;1377:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 1072
CNSTF4 1060320051
ADDRLP4 1028
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1378
;1378:				if (attackers > 7) attackers = 7;
ADDRLP4 1072
INDIRI4
CNSTI4 7
LEI4 $742
ADDRLP4 1072
CNSTI4 7
ASGNI4
LABELV $742
line 1379
;1379:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $747
JUMPV
LABELV $744
line 1381
;1380:					//
;1381:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $748
line 1382
;1382:						continue;
ADDRGP4 $745
JUMPV
LABELV $748
line 1384
;1383:					}
;1384:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1385
;1385:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1386
;1386:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1387
;1387:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1388
;1388:				}
LABELV $745
line 1379
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $747
ADDRLP4 0
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $744
line 1389
;1389:				if (bs->flagcarrier != -1) {
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $750
line 1390
;1390:					ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1391
;1391:					for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $755
JUMPV
LABELV $752
line 1393
;1392:						//
;1393:						if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $756
line 1394
;1394:							continue;
ADDRGP4 $753
JUMPV
LABELV $756
line 1397
;1395:						}
;1396:						//
;1397:						ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1398
;1398:						if (bs->flagcarrier == bs->client) {
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ADDRLP4 1124
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $760
line 1399
;1399:							BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1400
;1400:							BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $244
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1401
;1401:						}
ADDRGP4 $761
JUMPV
LABELV $760
line 1402
;1402:						else {
line 1403
;1403:							BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1080
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1404
;1404:							BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $252
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1405
;1405:						}
LABELV $761
line 1406
;1406:						BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1407
;1407:					}
LABELV $753
line 1391
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $755
ADDRLP4 0
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $752
line 1408
;1408:				}
ADDRGP4 $717
JUMPV
LABELV $750
line 1409
;1409:				else {
line 1410
;1410:					for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $768
JUMPV
LABELV $765
line 1412
;1411:						//
;1412:						if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $769
line 1413
;1413:							continue;
ADDRGP4 $766
JUMPV
LABELV $769
line 1416
;1414:						}
;1415:						//
;1416:						ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1417
;1417:						BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1418
;1418:						BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1419
;1419:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1420
;1420:					}
LABELV $766
line 1410
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $768
ADDRLP4 0
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $765
line 1421
;1421:				}
line 1423
;1422:				//
;1423:				break;
line 1426
;1424:			}
;1425:		}
;1426:	}
ADDRGP4 $717
JUMPV
LABELV $716
line 1427
;1427:	else { //agressive
line 1429
;1428:		//different orders based on the number of team mates
;1429:		switch(numteammates) {
ADDRLP4 1028
INDIRI4
CNSTI4 1
EQI4 $776
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $778
ADDRLP4 1028
INDIRI4
CNSTI4 3
EQI4 $782
ADDRGP4 $775
JUMPV
line 1430
;1430:			case 1: break;
LABELV $778
line 1432
;1431:			case 2:
;1432:			{
line 1434
;1433:				//tell the one not carrying the flag to defend the base
;1434:				if (teammates[0] == bs->flagcarrier) other = teammates[1];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $779
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
ADDRGP4 $780
JUMPV
LABELV $779
line 1435
;1435:				else other = teammates[0];
ADDRLP4 1076
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $780
line 1436
;1436:				ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1437
;1437:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1438
;1438:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1439
;1439:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1440
;1440:				break;
ADDRGP4 $776
JUMPV
LABELV $782
line 1443
;1441:			}
;1442:			case 3:
;1443:			{
line 1445
;1444:				//tell the one closest to the base not carrying the flag to defend the base
;1445:				if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
EQI4 $783
ADDRLP4 1076
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $784
JUMPV
LABELV $783
line 1446
;1446:				else other = teammates[1];
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $784
line 1447
;1447:				ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1448
;1448:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1449
;1449:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1450
;1450:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1452
;1451:				//tell the one furthest from the base not carrying the flag to accompany the flag carrier
;1452:				if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
EQI4 $786
ADDRLP4 1076
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $787
JUMPV
LABELV $786
line 1453
;1453:				else other = teammates[1];
ADDRLP4 1076
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $787
line 1454
;1454:				ClientName(other, name, sizeof(name));
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1455
;1455:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1456
;1456:				if (bs->flagcarrier == bs->client) {
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ADDRLP4 1124
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $791
line 1457
;1457:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1458
;1458:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $244
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1459
;1459:				}
ADDRGP4 $792
JUMPV
LABELV $791
line 1460
;1460:				else {
line 1461
;1461:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1080
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1462
;1462:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 $252
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1463
;1463:				}
LABELV $792
line 1464
;1464:				BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1465
;1465:				break;
ADDRGP4 $776
JUMPV
LABELV $775
line 1468
;1466:			}
;1467:			default:
;1468:			{
line 1470
;1469:				//20% will defend the base
;1470:				defenders = (int) (float) numteammates * 0.2 + 0.5;
ADDRLP4 1068
CNSTF4 1045220557
ADDRLP4 1028
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1471
;1471:				if (defenders > 2) defenders = 2;
ADDRLP4 1068
INDIRI4
CNSTI4 2
LEI4 $793
ADDRLP4 1068
CNSTI4 2
ASGNI4
LABELV $793
line 1473
;1472:				//80% accompanies the flag carrier
;1473:				attackers = (int) (float) numteammates * 0.8 + 0.5;
ADDRLP4 1072
CNSTF4 1061997773
ADDRLP4 1028
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1474
;1474:				if (attackers > 8) attackers = 8;
ADDRLP4 1072
INDIRI4
CNSTI4 8
LEI4 $795
ADDRLP4 1072
CNSTI4 8
ASGNI4
LABELV $795
line 1475
;1475:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $800
JUMPV
LABELV $797
line 1477
;1476:					//
;1477:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $801
line 1478
;1478:						continue;
ADDRGP4 $798
JUMPV
LABELV $801
line 1480
;1479:					}
;1480:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1481
;1481:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1482
;1482:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1483
;1483:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1484
;1484:				}
LABELV $798
line 1475
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $800
ADDRLP4 0
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $797
line 1485
;1485:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1486
;1486:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $806
JUMPV
LABELV $803
line 1488
;1487:					//
;1488:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
NEI4 $807
line 1489
;1489:						continue;
ADDRGP4 $804
JUMPV
LABELV $807
line 1492
;1490:					}
;1491:					//
;1492:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1493
;1493:					if (bs->flagcarrier == bs->client) {
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 11076
ADDP4
INDIRI4
ADDRLP4 1124
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $811
line 1494
;1494:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 1032
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1495
;1495:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $244
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1496
;1496:					}
ADDRGP4 $812
JUMPV
LABELV $811
line 1497
;1497:					else {
line 1498
;1498:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1080
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1499
;1499:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $252
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1500
;1500:					}
LABELV $812
line 1501
;1501:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1502
;1502:				}
LABELV $804
line 1486
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $806
ADDRLP4 0
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $803
line 1504
;1503:				//
;1504:				break;
LABELV $776
line 1507
;1505:			}
;1506:		}
;1507:	}
LABELV $717
line 1508
;1508:}
LABELV $708
endproc Bot1FCTFOrders_TeamHasFlag 1128 20
export Bot1FCTFOrders_EnemyHasFlag
proc Bot1FCTFOrders_EnemyHasFlag 1084 16
line 1517
;1509:
;1510:/*
;1511:==================
;1512:Bot1FCTFOrders_EnemyHasFlag
;1513:
;1514:  X% defend the base, Y% towards neutral flag
;1515:==================
;1516:*/
;1517:void Bot1FCTFOrders_EnemyHasFlag(bot_state_t *bs) {
line 1522
;1518:	int numteammates, defenders, attackers, i;
;1519:	int teammates[MAX_CLIENTS];
;1520:	char name[MAX_NETNAME];
;1521:
;1522:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $817
line 1523
;1523:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1076
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $819
line 1524
;1524:        return; // spbot no chat
ADDRGP4 $816
JUMPV
LABELV $819
line 1525
;1525:}}
LABELV $817
line 1527
;1526:
;1527:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $821
ADDRGP4 $816
JUMPV
LABELV $821
line 1530
;1528:
;1529:	//sort team mates by travel time to base
;1530:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1076
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1076
INDIRI4
ASGNI4
line 1532
;1531:	//sort team mates by CTF preference
;1532:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 1534
;1533:	//passive strategy
;1534:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 11080
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $824
line 1536
;1535:		//different orders based on the number of team mates
;1536:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $825
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $829
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $833
ADDRGP4 $826
JUMPV
line 1537
;1537:			case 1: break;
LABELV $829
line 1539
;1538:			case 2:
;1539:			{
line 1541
;1540:				//both defend the base
;1541:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1542
;1542:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1543
;1543:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1544
;1544:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1546
;1545:				//
;1546:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1547
;1547:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1548
;1548:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1549
;1549:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1550
;1550:				break;
ADDRGP4 $825
JUMPV
LABELV $833
line 1553
;1551:			}
;1552:			case 3:
;1553:			{
line 1555
;1554:				//the one closest to the base will defend the base
;1555:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1556
;1556:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1557
;1557:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1558
;1558:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1560
;1559:				//the second one closest to the base will defend the base
;1560:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1561
;1561:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1562
;1562:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1563
;1563:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1565
;1564:				//the other will also defend the base
;1565:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1566
;1566:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1567
;1567:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1568
;1568:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1569
;1569:				break;
ADDRGP4 $825
JUMPV
LABELV $826
line 1572
;1570:			}
;1571:			default:
;1572:			{
line 1574
;1573:				//80% will defend the base
;1574:				defenders = (int) (float) numteammates * 0.8 + 0.5;
ADDRLP4 1068
CNSTF4 1061997773
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1575
;1575:				if (defenders > 8) defenders = 8;
ADDRLP4 1068
INDIRI4
CNSTI4 8
LEI4 $840
ADDRLP4 1068
CNSTI4 8
ASGNI4
LABELV $840
line 1577
;1576:				//10% will try to return the flag
;1577:				attackers = (int) (float) numteammates * 0.1 + 0.5;
ADDRLP4 1072
CNSTF4 1036831949
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1578
;1578:				if (attackers > 1) attackers = 1;
ADDRLP4 1072
INDIRI4
CNSTI4 1
LEI4 $842
ADDRLP4 1072
CNSTI4 1
ASGNI4
LABELV $842
line 1579
;1579:				for (i = 0; i < defenders; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $847
JUMPV
LABELV $844
line 1581
;1580:					//
;1581:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1582
;1582:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1583
;1583:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1584
;1584:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1585
;1585:				}
LABELV $845
line 1579
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $847
ADDRLP4 1024
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $844
line 1586
;1586:				for (i = 0; i < attackers; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $851
JUMPV
LABELV $848
line 1588
;1587:					//
;1588:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1589
;1589:					BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $853
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1590
;1590:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1591
;1591:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1592
;1592:				}
LABELV $849
line 1586
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $851
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $848
line 1594
;1593:				//
;1594:				break;
line 1597
;1595:			}
;1596:		}
;1597:	}
ADDRGP4 $825
JUMPV
LABELV $824
line 1598
;1598:	else { //agressive
line 1600
;1599:		//different orders based on the number of team mates
;1600:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $857
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $859
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $863
ADDRGP4 $856
JUMPV
line 1601
;1601:			case 1: break;
LABELV $859
line 1603
;1602:			case 2:
;1603:			{
line 1605
;1604:				//the one closest to the base will defend the base
;1605:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1606
;1606:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1607
;1607:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1608
;1608:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1610
;1609:				//the other will get the flag
;1610:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1611
;1611:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1612
;1612:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1613
;1613:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1614
;1614:				break;
ADDRGP4 $857
JUMPV
LABELV $863
line 1617
;1615:			}
;1616:			case 3:
;1617:			{
line 1619
;1618:				//the one closest to the base will defend the base
;1619:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1620
;1620:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1621
;1621:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1622
;1622:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1624
;1623:				//the others should go for the enemy flag
;1624:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1625
;1625:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1626
;1626:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1627
;1627:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1629
;1628:				//
;1629:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1630
;1630:				BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $853
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1631
;1631:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1632
;1632:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1633
;1633:				break;
ADDRGP4 $857
JUMPV
LABELV $856
line 1636
;1634:			}
;1635:			default:
;1636:			{
line 1638
;1637:				//70% defend the base
;1638:				defenders = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 1068
CNSTF4 1060320051
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1639
;1639:				if (defenders > 7) defenders = 7;
ADDRLP4 1068
INDIRI4
CNSTI4 7
LEI4 $870
ADDRLP4 1068
CNSTI4 7
ASGNI4
LABELV $870
line 1641
;1640:				//20% try to return the flag
;1641:				attackers = (int) (float) numteammates * 0.2 + 0.5;
ADDRLP4 1072
CNSTF4 1045220557
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1642
;1642:				if (attackers > 2) attackers = 2;
ADDRLP4 1072
INDIRI4
CNSTI4 2
LEI4 $872
ADDRLP4 1072
CNSTI4 2
ASGNI4
LABELV $872
line 1643
;1643:				for (i = 0; i < defenders; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $877
JUMPV
LABELV $874
line 1645
;1644:					//
;1645:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1646
;1646:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1647
;1647:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1648
;1648:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1649
;1649:				}
LABELV $875
line 1643
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $877
ADDRLP4 1024
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $874
line 1650
;1650:				for (i = 0; i < attackers; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $881
JUMPV
LABELV $878
line 1652
;1651:					//
;1652:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1653
;1653:					BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $853
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1654
;1654:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1655
;1655:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1656
;1656:				}
LABELV $879
line 1650
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $881
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $878
line 1658
;1657:				//
;1658:				break;
LABELV $857
line 1661
;1659:			}
;1660:		}
;1661:	}
LABELV $825
line 1662
;1662:}
LABELV $816
endproc Bot1FCTFOrders_EnemyHasFlag 1084 16
export Bot1FCTFOrders_EnemyDroppedFlag
proc Bot1FCTFOrders_EnemyDroppedFlag 1088 16
line 1671
;1663:
;1664:/*
;1665:==================
;1666:Bot1FCTFOrders_EnemyDroppedFlag
;1667:
;1668:  X% defend the base, Y% get the flag
;1669:==================
;1670:*/
;1671:void Bot1FCTFOrders_EnemyDroppedFlag(bot_state_t *bs) {
line 1676
;1672:	int numteammates, defenders, attackers, i;
;1673:	int teammates[MAX_CLIENTS];
;1674:	char name[MAX_NETNAME];
;1675:
;1676:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $886
line 1677
;1677:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1076
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $888
line 1678
;1678:        return; // spbot no chat
ADDRGP4 $885
JUMPV
LABELV $888
line 1679
;1679:}}
LABELV $886
line 1681
;1680:
;1681:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $890
ADDRGP4 $885
JUMPV
LABELV $890
line 1684
;1682:
;1683:	//sort team mates by travel time to base
;1684:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1076
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1076
INDIRI4
ASGNI4
line 1686
;1685:	//sort team mates by CTF preference
;1686:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 1688
;1687:	//passive strategy
;1688:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 11080
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $893
line 1690
;1689:		//different orders based on the number of team mates
;1690:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $894
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $898
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $902
ADDRGP4 $895
JUMPV
line 1691
;1691:			case 1: break;
LABELV $898
line 1693
;1692:			case 2:
;1693:			{
line 1695
;1694:				//the one closest to the base will defend the base
;1695:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1696
;1696:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1697
;1697:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1698
;1698:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1700
;1699:				//the other will get the flag
;1700:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1701
;1701:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1702
;1702:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1703
;1703:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1704
;1704:				break;
ADDRGP4 $894
JUMPV
LABELV $902
line 1707
;1705:			}
;1706:			case 3:
;1707:			{
line 1709
;1708:				//the one closest to the base will defend the base
;1709:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1710
;1710:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1711
;1711:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1712
;1712:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1714
;1713:				//the second one closest to the base will defend the base
;1714:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1715
;1715:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1716
;1716:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1717
;1717:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1719
;1718:				//the other will get the flag
;1719:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1720
;1720:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1721
;1721:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1722
;1722:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1723
;1723:				break;
ADDRGP4 $894
JUMPV
LABELV $895
line 1726
;1724:			}
;1725:			default:
;1726:			{
line 1728
;1727:				//50% defend the base
;1728:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 1084
CNSTF4 1056964608
ASGNF4
ADDRLP4 1068
ADDRLP4 1084
INDIRF4
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
ADDRLP4 1084
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 1729
;1729:				if (defenders > 5) defenders = 5;
ADDRLP4 1068
INDIRI4
CNSTI4 5
LEI4 $909
ADDRLP4 1068
CNSTI4 5
ASGNI4
LABELV $909
line 1731
;1730:				//40% get the flag
;1731:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 1072
CNSTF4 1053609165
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1732
;1732:				if (attackers > 4) attackers = 4;
ADDRLP4 1072
INDIRI4
CNSTI4 4
LEI4 $911
ADDRLP4 1072
CNSTI4 4
ASGNI4
LABELV $911
line 1733
;1733:				for (i = 0; i < defenders; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $916
JUMPV
LABELV $913
line 1735
;1734:					//
;1735:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1736
;1736:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1737
;1737:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1738
;1738:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1739
;1739:				}
LABELV $914
line 1733
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $916
ADDRLP4 1024
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $913
line 1740
;1740:				for (i = 0; i < attackers; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $920
JUMPV
LABELV $917
line 1742
;1741:					//
;1742:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1743
;1743:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1744
;1744:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1745
;1745:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1746
;1746:				}
LABELV $918
line 1740
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $920
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $917
line 1748
;1747:				//
;1748:				break;
line 1751
;1749:			}
;1750:		}
;1751:	}
ADDRGP4 $894
JUMPV
LABELV $893
line 1752
;1752:	else { //agressive
line 1754
;1753:		//different orders based on the number of team mates
;1754:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $925
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $927
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $931
ADDRGP4 $924
JUMPV
line 1755
;1755:			case 1: break;
LABELV $927
line 1757
;1756:			case 2:
;1757:			{
line 1759
;1758:				//the one closest to the base will defend the base
;1759:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1760
;1760:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1761
;1761:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1762
;1762:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1764
;1763:				//the other will get the flag
;1764:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1765
;1765:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1766
;1766:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1767
;1767:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1768
;1768:				break;
ADDRGP4 $925
JUMPV
LABELV $931
line 1771
;1769:			}
;1770:			case 3:
;1771:			{
line 1773
;1772:				//the one closest to the base will defend the base
;1773:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1774
;1774:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1775
;1775:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1776
;1776:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1778
;1777:				//the others should go for the enemy flag
;1778:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1779
;1779:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1780
;1780:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1781
;1781:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1783
;1782:				//
;1783:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1784
;1784:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1785
;1785:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1786
;1786:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1787
;1787:				break;
ADDRGP4 $925
JUMPV
LABELV $924
line 1790
;1788:			}
;1789:			default:
;1790:			{
line 1792
;1791:				//30% defend the base
;1792:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 1068
CNSTF4 1050253722
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1793
;1793:				if (defenders > 3) defenders = 3;
ADDRLP4 1068
INDIRI4
CNSTI4 3
LEI4 $938
ADDRLP4 1068
CNSTI4 3
ASGNI4
LABELV $938
line 1795
;1794:				//60% get the flag
;1795:				attackers = (int) (float) numteammates * 0.6 + 0.5;
ADDRLP4 1072
CNSTF4 1058642330
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1796
;1796:				if (attackers > 6) attackers = 6;
ADDRLP4 1072
INDIRI4
CNSTI4 6
LEI4 $940
ADDRLP4 1072
CNSTI4 6
ASGNI4
LABELV $940
line 1797
;1797:				for (i = 0; i < defenders; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $945
JUMPV
LABELV $942
line 1799
;1798:					//
;1799:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1800
;1800:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1801
;1801:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1802
;1802:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1803
;1803:				}
LABELV $943
line 1797
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $945
ADDRLP4 1024
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $942
line 1804
;1804:				for (i = 0; i < attackers; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $949
JUMPV
LABELV $946
line 1806
;1805:					//
;1806:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1807
;1807:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1808
;1808:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1809
;1809:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1810
;1810:				}
LABELV $947
line 1804
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $949
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $946
line 1812
;1811:				//
;1812:				break;
LABELV $925
line 1815
;1813:			}
;1814:		}
;1815:	}
LABELV $894
line 1816
;1816:}
LABELV $885
endproc Bot1FCTFOrders_EnemyDroppedFlag 1088 16
export Bot1FCTFOrders
proc Bot1FCTFOrders 8 4
line 1823
;1817:
;1818:/*
;1819:==================
;1820:Bot1FCTFOrders
;1821:==================
;1822:*/
;1823:void Bot1FCTFOrders(bot_state_t *bs) {
line 1824
;1824:	switch(bs->neutralflagstatus) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 11064
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $954
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $954
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $961
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $961
address $957
address $958
address $959
address $960
code
LABELV $957
line 1825
;1825:		case 0: Bot1FCTFOrders_FlagAtCenter(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFOrders_FlagAtCenter
CALLV
pop
ADDRGP4 $955
JUMPV
LABELV $958
line 1826
;1826:		case 1: Bot1FCTFOrders_TeamHasFlag(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFOrders_TeamHasFlag
CALLV
pop
ADDRGP4 $955
JUMPV
LABELV $959
line 1827
;1827:		case 2: Bot1FCTFOrders_EnemyHasFlag(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFOrders_EnemyHasFlag
CALLV
pop
ADDRGP4 $955
JUMPV
LABELV $960
line 1828
;1828:		case 3: Bot1FCTFOrders_EnemyDroppedFlag(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFOrders_EnemyDroppedFlag
CALLV
pop
LABELV $954
LABELV $955
line 1830
;1829:	}
;1830:}
LABELV $953
endproc Bot1FCTFOrders 8 4
export BotObeliskOrders
proc BotObeliskOrders 1088 16
line 1839
;1831:
;1832:/*
;1833:==================
;1834:BotObeliskOrders
;1835:
;1836:  X% in defence Y% in offence
;1837:==================
;1838:*/
;1839:void BotObeliskOrders(bot_state_t *bs) {
line 1844
;1840:	int numteammates, defenders, attackers, i;
;1841:	int teammates[MAX_CLIENTS];
;1842:	char name[MAX_NETNAME];
;1843:
;1844:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $963
line 1845
;1845:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1076
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $965
line 1846
;1846:        return; // spbot no chat
ADDRGP4 $962
JUMPV
LABELV $965
line 1847
;1847:}}
LABELV $963
line 1849
;1848:
;1849:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $967
ADDRGP4 $962
JUMPV
LABELV $967
line 1852
;1850:
;1851:	//sort team mates by travel time to base
;1852:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1076
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1076
INDIRI4
ASGNI4
line 1854
;1853:	//sort team mates by CTF preference
;1854:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 1856
;1855:	//passive strategy
;1856:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 11080
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $970
line 1858
;1857:		//different orders based on the number of team mates
;1858:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $971
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $975
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $979
ADDRGP4 $972
JUMPV
line 1859
;1859:			case 1: break;
LABELV $975
line 1861
;1860:			case 2:
;1861:			{
line 1863
;1862:				//the one closest to the base will defend the base
;1863:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1864
;1864:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1865
;1865:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1866
;1866:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1868
;1867:				//the other will attack the enemy base
;1868:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1869
;1869:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $725
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1870
;1870:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1871
;1871:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1872
;1872:				break;
ADDRGP4 $971
JUMPV
LABELV $979
line 1875
;1873:			}
;1874:			case 3:
;1875:			{
line 1877
;1876:				//the one closest to the base will defend the base
;1877:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1878
;1878:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1879
;1879:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1880
;1880:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1882
;1881:				//the one second closest to the base also defends the base
;1882:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1883
;1883:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1884
;1884:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1885
;1885:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1887
;1886:				//the other one attacks the enemy base
;1887:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1888
;1888:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $725
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1889
;1889:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1890
;1890:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1891
;1891:				break;
ADDRGP4 $971
JUMPV
LABELV $972
line 1894
;1892:			}
;1893:			default:
;1894:			{
line 1896
;1895:				//50% defend the base
;1896:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 1084
CNSTF4 1056964608
ASGNF4
ADDRLP4 1068
ADDRLP4 1084
INDIRF4
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
ADDRLP4 1084
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 1897
;1897:				if (defenders > 5) defenders = 5;
ADDRLP4 1068
INDIRI4
CNSTI4 5
LEI4 $986
ADDRLP4 1068
CNSTI4 5
ASGNI4
LABELV $986
line 1899
;1898:				//40% attack the enemy base
;1899:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 1072
CNSTF4 1053609165
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1900
;1900:				if (attackers > 4) attackers = 4;
ADDRLP4 1072
INDIRI4
CNSTI4 4
LEI4 $988
ADDRLP4 1072
CNSTI4 4
ASGNI4
LABELV $988
line 1901
;1901:				for (i = 0; i < defenders; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $993
JUMPV
LABELV $990
line 1903
;1902:					//
;1903:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1904
;1904:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1905
;1905:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1906
;1906:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1907
;1907:				}
LABELV $991
line 1901
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $993
ADDRLP4 1024
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $990
line 1908
;1908:				for (i = 0; i < attackers; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $997
JUMPV
LABELV $994
line 1910
;1909:					//
;1910:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1911
;1911:					BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $725
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1912
;1912:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1913
;1913:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1914
;1914:				}
LABELV $995
line 1908
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $997
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $994
line 1916
;1915:				//
;1916:				break;
line 1919
;1917:			}
;1918:		}
;1919:	}
ADDRGP4 $971
JUMPV
LABELV $970
line 1920
;1920:	else {
line 1922
;1921:		//different orders based on the number of team mates
;1922:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $1002
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $1004
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $1008
ADDRGP4 $1001
JUMPV
line 1923
;1923:			case 1: break;
LABELV $1004
line 1925
;1924:			case 2:
;1925:			{
line 1927
;1926:				//the one closest to the base will defend the base
;1927:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1928
;1928:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1929
;1929:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1930
;1930:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1932
;1931:				//the other will attack the enemy base
;1932:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1933
;1933:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $725
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1934
;1934:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1935
;1935:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1936
;1936:				break;
ADDRGP4 $1002
JUMPV
LABELV $1008
line 1939
;1937:			}
;1938:			case 3:
;1939:			{
line 1941
;1940:				//the one closest to the base will defend the base
;1941:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1942
;1942:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1943
;1943:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1944
;1944:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1946
;1945:				//the others attack the enemy base
;1946:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1947
;1947:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $725
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1948
;1948:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1949
;1949:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1951
;1950:				//
;1951:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1952
;1952:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $725
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1953
;1953:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1954
;1954:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1955
;1955:				break;
ADDRGP4 $1002
JUMPV
LABELV $1001
line 1958
;1956:			}
;1957:			default:
;1958:			{
line 1960
;1959:				//30% defend the base
;1960:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 1068
CNSTF4 1050253722
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1961
;1961:				if (defenders > 3) defenders = 3;
ADDRLP4 1068
INDIRI4
CNSTI4 3
LEI4 $1015
ADDRLP4 1068
CNSTI4 3
ASGNI4
LABELV $1015
line 1963
;1962:				//70% attack the enemy base
;1963:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 1072
CNSTF4 1060320051
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1964
;1964:				if (attackers > 7) attackers = 7;
ADDRLP4 1072
INDIRI4
CNSTI4 7
LEI4 $1017
ADDRLP4 1072
CNSTI4 7
ASGNI4
LABELV $1017
line 1965
;1965:				for (i = 0; i < defenders; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $1022
JUMPV
LABELV $1019
line 1967
;1966:					//
;1967:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1968
;1968:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1969
;1969:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1970
;1970:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1971
;1971:				}
LABELV $1020
line 1965
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1022
ADDRLP4 1024
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $1019
line 1972
;1972:				for (i = 0; i < attackers; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $1026
JUMPV
LABELV $1023
line 1974
;1973:					//
;1974:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1975
;1975:					BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $725
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1976
;1976:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 1977
;1977:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 1978
;1978:				}
LABELV $1024
line 1972
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1026
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $1023
line 1980
;1979:				//
;1980:				break;
LABELV $1002
line 1983
;1981:			}
;1982:		}
;1983:	}
LABELV $971
line 1984
;1984:}
LABELV $962
endproc BotObeliskOrders 1088 16
export BotHarvesterOrders
proc BotHarvesterOrders 1088 16
line 1993
;1985:
;1986:/*
;1987:==================
;1988:BotHarvesterOrders
;1989:
;1990:  X% defend the base, Y% harvest
;1991:==================
;1992:*/
;1993:void BotHarvesterOrders(bot_state_t *bs) {
line 1998
;1994:	int numteammates, defenders, attackers, i;
;1995:	int teammates[MAX_CLIENTS];
;1996:	char name[MAX_NETNAME];
;1997:
;1998:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1031
line 1999
;1999:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1076
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1033
line 2000
;2000:        return; // spbot no chat
ADDRGP4 $1030
JUMPV
LABELV $1033
line 2001
;2001:}}
LABELV $1031
line 2003
;2002:
;2003:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $1035
ADDRGP4 $1030
JUMPV
LABELV $1035
line 2006
;2004:
;2005:	//sort team mates by travel time to base
;2006:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1076
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1076
INDIRI4
ASGNI4
line 2008
;2007:	//sort team mates by CTF preference
;2008:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 2010
;2009:	//passive strategy
;2010:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 11080
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1038
line 2012
;2011:		//different orders based on the number of team mates
;2012:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $1039
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $1043
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $1048
ADDRGP4 $1040
JUMPV
line 2013
;2013:			case 1: break;
LABELV $1043
line 2015
;2014:			case 2:
;2015:			{
line 2017
;2016:				//the one closest to the base will defend the base
;2017:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2018
;2018:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2019
;2019:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2020
;2020:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2022
;2021:				//the other will harvest
;2022:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2023
;2023:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1045
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2024
;2024:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2025
;2025:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2026
;2026:				break;
ADDRGP4 $1039
JUMPV
LABELV $1048
line 2029
;2027:			}
;2028:			case 3:
;2029:			{
line 2031
;2030:				//the one closest to the base will defend the base
;2031:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2032
;2032:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2033
;2033:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2034
;2034:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2036
;2035:				//the one second closest to the base also defends the base
;2036:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2037
;2037:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2038
;2038:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2039
;2039:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2041
;2040:				//the other one goes harvesting
;2041:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2042
;2042:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1045
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2043
;2043:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2044
;2044:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2045
;2045:				break;
ADDRGP4 $1039
JUMPV
LABELV $1040
line 2048
;2046:			}
;2047:			default:
;2048:			{
line 2050
;2049:				//50% defend the base
;2050:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 1084
CNSTF4 1056964608
ASGNF4
ADDRLP4 1068
ADDRLP4 1084
INDIRF4
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
ADDRLP4 1084
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 2051
;2051:				if (defenders > 5) defenders = 5;
ADDRLP4 1068
INDIRI4
CNSTI4 5
LEI4 $1055
ADDRLP4 1068
CNSTI4 5
ASGNI4
LABELV $1055
line 2053
;2052:				//40% goes harvesting
;2053:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 1072
CNSTF4 1053609165
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 2054
;2054:				if (attackers > 4) attackers = 4;
ADDRLP4 1072
INDIRI4
CNSTI4 4
LEI4 $1057
ADDRLP4 1072
CNSTI4 4
ASGNI4
LABELV $1057
line 2055
;2055:				for (i = 0; i < defenders; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $1062
JUMPV
LABELV $1059
line 2057
;2056:					//
;2057:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2058
;2058:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2059
;2059:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2060
;2060:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2061
;2061:				}
LABELV $1060
line 2055
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1062
ADDRLP4 1024
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $1059
line 2062
;2062:				for (i = 0; i < attackers; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $1066
JUMPV
LABELV $1063
line 2064
;2063:					//
;2064:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2065
;2065:					BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1045
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2066
;2066:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2067
;2067:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2068
;2068:				}
LABELV $1064
line 2062
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1066
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $1063
line 2070
;2069:				//
;2070:				break;
line 2073
;2071:			}
;2072:		}
;2073:	}
ADDRGP4 $1039
JUMPV
LABELV $1038
line 2074
;2074:	else {
line 2076
;2075:		//different orders based on the number of team mates
;2076:		switch(numteammates) {
ADDRLP4 1064
INDIRI4
CNSTI4 1
EQI4 $1071
ADDRLP4 1064
INDIRI4
CNSTI4 2
EQI4 $1073
ADDRLP4 1064
INDIRI4
CNSTI4 3
EQI4 $1077
ADDRGP4 $1070
JUMPV
line 2077
;2077:			case 1: break;
LABELV $1073
line 2079
;2078:			case 2:
;2079:			{
line 2081
;2080:				//the one closest to the base will defend the base
;2081:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2082
;2082:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2083
;2083:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2084
;2084:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2086
;2085:				//the other will harvest
;2086:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2087
;2087:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1045
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2088
;2088:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2089
;2089:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2090
;2090:				break;
ADDRGP4 $1071
JUMPV
LABELV $1077
line 2093
;2091:			}
;2092:			case 3:
;2093:			{
line 2095
;2094:				//the one closest to the base will defend the base
;2095:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2096
;2096:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2097
;2097:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2098
;2098:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2100
;2099:				//the others go harvesting
;2100:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2101
;2101:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1045
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2102
;2102:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2103
;2103:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2105
;2104:				//
;2105:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2106
;2106:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1045
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2107
;2107:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2108
;2108:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2109
;2109:				break;
ADDRGP4 $1071
JUMPV
LABELV $1070
line 2112
;2110:			}
;2111:			default:
;2112:			{
line 2114
;2113:				//30% defend the base
;2114:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 1068
CNSTF4 1050253722
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 2115
;2115:				if (defenders > 3) defenders = 3;
ADDRLP4 1068
INDIRI4
CNSTI4 3
LEI4 $1084
ADDRLP4 1068
CNSTI4 3
ASGNI4
LABELV $1084
line 2117
;2116:				//70% go harvesting
;2117:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 1072
CNSTF4 1060320051
ADDRLP4 1064
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 2118
;2118:				if (attackers > 7) attackers = 7;
ADDRLP4 1072
INDIRI4
CNSTI4 7
LEI4 $1086
ADDRLP4 1072
CNSTI4 7
ASGNI4
LABELV $1086
line 2119
;2119:				for (i = 0; i < defenders; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $1091
JUMPV
LABELV $1088
line 2121
;2120:					//
;2121:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2122
;2122:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2123
;2123:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2124
;2124:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2125
;2125:				}
LABELV $1089
line 2119
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1091
ADDRLP4 1024
INDIRI4
ADDRLP4 1068
INDIRI4
LTI4 $1088
line 2126
;2126:				for (i = 0; i < attackers; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $1095
JUMPV
LABELV $1092
line 2128
;2127:					//
;2128:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2129
;2129:					BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1045
ARGP4
ADDRLP4 1028
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2130
;2130:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 2131
;2131:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ADDRLP4 1024
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2132
;2132:				}
LABELV $1093
line 2126
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1095
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
LTI4 $1092
line 2134
;2133:				//
;2134:				break;
LABELV $1071
line 2137
;2135:			}
;2136:		}
;2137:	}
LABELV $1039
line 2138
;2138:}
LABELV $1030
endproc BotHarvesterOrders 1088 16
export FindHumanTeamLeader
proc FindHumanTeamLeader 12 12
line 2145
;2139:
;2140:/*
;2141:==================
;2142:FindHumanTeamLeader
;2143:==================
;2144:*/
;2145:int FindHumanTeamLeader(bot_state_t *bs) {
line 2148
;2146:	int i;
;2147:
;2148:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1100
line 2149
;2149:		if ( g_entities[i].inuse ) {
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1104
line 2151
;2150:			// if this player is not a bot
;2151:			if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1107
line 2153
;2152:				// if this player is ok with being the leader
;2153:				if (!notleader[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1111
line 2155
;2154:					// if this player is on the same team
;2155:					if ( BotSameTeam(bs, i) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1113
line 2156
;2156:						ClientName(i, bs->teamleader, sizeof(bs->teamleader));
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2158
;2157:						// if not yet ordered to do anything
;2158:						if ( !BotSetLastOrderedTask(bs) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1115
line 2160
;2159:							// go on defense by default
;2160:							if (bot_nochat.integer<3)BotVoiceChat_Defend(bs, i, SAY_TELL);
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 3
GEI4 $1117
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 BotVoiceChat_Defend
CALLV
pop
LABELV $1117
line 2161
;2161:						}
LABELV $1115
line 2162
;2162:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1099
JUMPV
LABELV $1113
line 2164
;2163:					}
;2164:				}
LABELV $1111
line 2165
;2165:			}
LABELV $1107
line 2166
;2166:		}
LABELV $1104
line 2167
;2167:	}
LABELV $1101
line 2148
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1100
line 2168
;2168:	return qfalse;
CNSTI4 0
RETI4
LABELV $1099
endproc FindHumanTeamLeader 12 12
export BotTeamAI
proc BotTeamAI 76 12
line 2178
;2169:}
;2170:
;2171:int lastRoundNumber; //used to give new orders every round
;2172:
;2173:/*
;2174:==================
;2175:BotTeamAI
;2176:==================
;2177:*/
;2178:void BotTeamAI(bot_state_t *bs) {
line 2182
;2179:	int numteammates;
;2180:	char netname[MAX_NETNAME];
;2181:
;2182:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1121
line 2183
;2183:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1123
line 2184
;2184:        return; // spbot no chat
ADDRGP4 $1120
JUMPV
LABELV $1123
line 2185
;2185:}}
LABELV $1121
line 2187
;2186:
;2187:        if (bot_nochat.integer>2) return;
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 2
LEI4 $1125
ADDRGP4 $1120
JUMPV
LABELV $1125
line 2190
;2188:
;2189:	//
;2190:	if ( !TeamPlayIsOn() )
ADDRLP4 40
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1128
line 2191
;2191:		return;
ADDRGP4 $1120
JUMPV
LABELV $1128
line 2193
;2192:	// make sure we've got a valid team leader
;2193:	if (!BotValidTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 BotValidTeamLeader
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1130
line 2195
;2194:		//
;2195:		if (!FindHumanTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 FindHumanTeamLeader
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $1132
line 2197
;2196:			//
;2197:			if (!bs->askteamleader_time && !bs->becometeamleader_time) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 52
INDIRP4
CNSTI4 11036
ADDP4
INDIRF4
ADDRLP4 56
INDIRF4
NEF4 $1134
ADDRLP4 52
INDIRP4
CNSTI4 11040
ADDP4
INDIRF4
ADDRLP4 56
INDIRF4
NEF4 $1134
line 2198
;2198:				if (bs->entergame_time + 10 > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10168
ADDP4
INDIRF4
CNSTF4 1092616192
ADDF4
ADDRGP4 floattime
INDIRF4
LEF4 $1136
line 2199
;2199:					bs->askteamleader_time = FloatTime() + 5 + random() * 10;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 11036
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CNSTF4 1092616192
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 2200
;2200:				}
ADDRGP4 $1137
JUMPV
LABELV $1136
line 2201
;2201:				else {
line 2202
;2202:					bs->becometeamleader_time = FloatTime() + 5 + random() * 10;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 11040
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CNSTF4 1092616192
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 2203
;2203:				}
LABELV $1137
line 2204
;2204:			}
LABELV $1134
line 2205
;2205:			if (bs->askteamleader_time && bs->askteamleader_time < FloatTime()) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 11036
ADDP4
INDIRF4
ASGNF4
ADDRLP4 60
INDIRF4
CNSTF4 0
EQF4 $1138
ADDRLP4 60
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1138
line 2207
;2206:				// if asked for a team leader and no response
;2207:				BotAI_BotInitialChat(bs, "whoisteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1140
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2208
;2208:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 2209
;2209:				bs->askteamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11036
ADDP4
CNSTF4 0
ASGNF4
line 2210
;2210:				bs->becometeamleader_time = FloatTime() + 8 + random() * 10;
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 11040
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
ADDF4
CNSTF4 1092616192
ADDRLP4 64
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 2211
;2211:			}
LABELV $1138
line 2212
;2212:			if (bs->becometeamleader_time && bs->becometeamleader_time < FloatTime()) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 11040
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $1120
ADDRLP4 64
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1120
line 2213
;2213:				BotAI_BotInitialChat(bs, "iamteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1143
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2214
;2214:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 2215
;2215:				BotSayVoiceTeamOrder(bs, -1, VOICECHAT_STARTLEADER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $1144
ARGP4
ADDRGP4 BotSayVoiceTeamOrder
CALLV
pop
line 2216
;2216:				ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2217
;2217:				strncpy(bs->teamleader, netname, sizeof(bs->teamleader));
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 2218
;2218:				bs->teamleader[sizeof(bs->teamleader)-1] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 11004
CNSTU4 31
ADDI4
ADDP4
CNSTI1 0
ASGNI1
line 2219
;2219:				bs->becometeamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11040
ADDP4
CNSTF4 0
ASGNF4
line 2220
;2220:			}
line 2221
;2221:			return;
ADDRGP4 $1120
JUMPV
LABELV $1132
line 2223
;2222:		}
;2223:	}
LABELV $1130
line 2224
;2224:	bs->askteamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11036
ADDP4
CNSTF4 0
ASGNF4
line 2225
;2225:	bs->becometeamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11040
ADDP4
CNSTF4 0
ASGNF4
line 2228
;2226:
;2227:	//return if this bot is NOT the team leader
;2228:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2229
;2229:	if (Q_stricmp(netname, bs->teamleader) != 0) return;
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $1145
ADDRGP4 $1120
JUMPV
LABELV $1145
line 2231
;2230:	//
;2231:	numteammates = BotNumTeamMates(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotNumTeamMates
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 52
INDIRI4
ASGNI4
line 2233
;2232:	//give orders
;2233:	switch(gametype) {
ADDRLP4 56
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
LTI4 $1147
ADDRLP4 56
INDIRI4
CNSTI4 12
GTI4 $1147
ADDRLP4 56
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1223
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1223
address $1149
address $1155
address $1161
address $1147
address $1167
address $1173
address $1200
address $1211
address $1217
address $1194
address $1173
address $1147
address $1187
code
LABELV $1149
line 2235
;2234:		case GT_SANDBOX:
;2235:		{
line 2236
;2236:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1152
ADDRLP4 60
INDIRP4
CNSTI4 11072
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1150
LABELV $1152
line 2237
;2237:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2238
;2238:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2239
;2239:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 0
ASGNI4
line 2240
;2240:			}
LABELV $1150
line 2242
;2241:			//if it's time to give orders
;2242:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $1148
ADDRLP4 64
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $1148
line 2243
;2243:				BotTeamOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamOrders
CALLV
pop
line 2245
;2244:				//give orders again after 120 seconds
;2245:				bs->teamgiveorders_time = FloatTime() + 120;
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 2246
;2246:			}
line 2247
;2247:			break;
ADDRGP4 $1148
JUMPV
LABELV $1155
line 2250
;2248:		}
;2249:		case GT_FFA:
;2250:		{
line 2251
;2251:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1158
ADDRLP4 60
INDIRP4
CNSTI4 11072
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1156
LABELV $1158
line 2252
;2252:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2253
;2253:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2254
;2254:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 0
ASGNI4
line 2255
;2255:			}
LABELV $1156
line 2257
;2256:			//if it's time to give orders
;2257:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $1148
ADDRLP4 64
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $1148
line 2258
;2258:				BotTeamOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamOrders
CALLV
pop
line 2260
;2259:				//give orders again after 120 seconds
;2260:				bs->teamgiveorders_time = FloatTime() + 120;
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 2261
;2261:			}
line 2262
;2262:			break;
ADDRGP4 $1148
JUMPV
LABELV $1161
line 2265
;2263:		}
;2264:		case GT_SINGLE:
;2265:		{
line 2266
;2266:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1164
ADDRLP4 60
INDIRP4
CNSTI4 11072
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1162
LABELV $1164
line 2267
;2267:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2268
;2268:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2269
;2269:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 0
ASGNI4
line 2270
;2270:			}
LABELV $1162
line 2272
;2271:			//if it's time to give orders
;2272:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $1148
ADDRLP4 64
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $1148
line 2273
;2273:				BotTeamOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamOrders
CALLV
pop
line 2275
;2274:				//give orders again after 120 seconds
;2275:				bs->teamgiveorders_time = FloatTime() + 120;
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 2276
;2276:			}
line 2277
;2277:			break;
ADDRGP4 $1148
JUMPV
LABELV $1167
line 2280
;2278:		}
;2279:		case GT_TEAM:
;2280:		{
line 2281
;2281:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1170
ADDRLP4 60
INDIRP4
CNSTI4 11072
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1168
LABELV $1170
line 2282
;2282:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2283
;2283:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2284
;2284:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 0
ASGNI4
line 2285
;2285:			}
LABELV $1168
line 2287
;2286:			//if it's time to give orders
;2287:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $1148
ADDRLP4 64
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $1148
line 2288
;2288:				BotTeamOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamOrders
CALLV
pop
line 2290
;2289:				//give orders again after 120 seconds
;2290:				bs->teamgiveorders_time = FloatTime() + 120;
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 2291
;2291:			}
line 2292
;2292:			break;
ADDRGP4 $1148
JUMPV
LABELV $1173
line 2296
;2293:		}
;2294:		case GT_CTF:
;2295:		case GT_CTF_ELIMINATION:
;2296:		{
line 2299
;2297:			//if the number of team mates changed or the flag status changed
;2298:			//or someone wants to know what to do
;2299:			if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders || lastRoundNumber != level.roundNumber) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1179
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 11068
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $1179
ADDRLP4 60
INDIRP4
CNSTI4 11072
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $1179
ADDRGP4 lastRoundNumber
INDIRI4
ADDRGP4 level+10004
INDIRI4
EQI4 $1174
LABELV $1179
line 2300
;2300:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2301
;2301:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2302
;2302:				bs->flagstatuschanged = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 0
ASGNI4
line 2303
;2303:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 0
ASGNI4
line 2304
;2304:				lastRoundNumber = level.roundNumber;
ADDRGP4 lastRoundNumber
ADDRGP4 level+10004
INDIRI4
ASGNI4
line 2305
;2305:			}
LABELV $1174
line 2307
;2306:			//if there were no flag captures the last 3 minutes
;2307:			if (bs->lastflagcapture_time < FloatTime() - 240) {
ADDRFP4 0
INDIRP4
CNSTI4 11048
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1131413504
SUBF4
GEF4 $1181
line 2308
;2308:				bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11048
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2310
;2309:				//randomly change the CTF strategy
;2310:				if (random() < 0.4) {
ADDRLP4 68
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1053609165
GEF4 $1183
line 2311
;2311:					bs->ctfstrategy ^= CTFS_AGRESSIVE;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 11080
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2312
;2312:					bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2313
;2313:				}
LABELV $1183
line 2314
;2314:			}
LABELV $1181
line 2316
;2315:			//if it's time to give orders
;2316:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 3) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
INDIRF4
ASGNF4
ADDRLP4 68
INDIRF4
CNSTF4 0
EQF4 $1148
ADDRLP4 68
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
GEF4 $1148
line 2317
;2317:				BotCTFOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders
CALLV
pop
line 2319
;2318:				//
;2319:				bs->teamgiveorders_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
CNSTF4 0
ASGNF4
line 2320
;2320:			}
line 2321
;2321:			break;
ADDRGP4 $1148
JUMPV
LABELV $1187
line 2324
;2322:		}
;2323:		case GT_DOUBLE_D:
;2324:		{
line 2327
;2325:			//if the number of team mates changed or the domination point status changed
;2326:			//or someone wants to know what to do
;2327:			if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1191
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 11068
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $1191
ADDRLP4 60
INDIRP4
CNSTI4 11072
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $1188
LABELV $1191
line 2328
;2328:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2329
;2329:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2330
;2330:				bs->flagstatuschanged = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 0
ASGNI4
line 2331
;2331:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 0
ASGNI4
line 2332
;2332:			}
LABELV $1188
line 2334
;2333:			//if it's time to give orders
;2334:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 3) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
INDIRF4
ASGNF4
ADDRLP4 68
INDIRF4
CNSTF4 0
EQF4 $1148
ADDRLP4 68
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
GEF4 $1148
line 2335
;2335:				BotDDorders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDDorders
CALLV
pop
line 2337
;2336:				//
;2337:				bs->teamgiveorders_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
CNSTF4 0
ASGNF4
line 2338
;2338:			}
line 2339
;2339:			break;
ADDRGP4 $1148
JUMPV
LABELV $1194
line 2342
;2340:		}
;2341:		case GT_ELIMINATION:
;2342:		{
line 2343
;2343:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1197
ADDRLP4 60
INDIRP4
CNSTI4 11072
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1195
LABELV $1197
line 2344
;2344:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2345
;2345:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2346
;2346:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 0
ASGNI4
line 2347
;2347:			}
LABELV $1195
line 2349
;2348:			//if it's time to give orders
;2349:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $1148
ADDRLP4 64
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $1148
line 2350
;2350:				BotTeamOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamOrders
CALLV
pop
line 2352
;2351:				//give orders again after 120 seconds
;2352:				bs->teamgiveorders_time = FloatTime() + 120;
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 2353
;2353:			}
line 2354
;2354:			break;
ADDRGP4 $1148
JUMPV
LABELV $1200
line 2357
;2355:		}
;2356:		case GT_1FCTF:
;2357:		{
line 2358
;2358:			if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1204
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 11068
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $1204
ADDRLP4 60
INDIRP4
CNSTI4 11072
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $1201
LABELV $1204
line 2359
;2359:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2360
;2360:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2361
;2361:				bs->flagstatuschanged = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 0
ASGNI4
line 2362
;2362:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 0
ASGNI4
line 2363
;2363:			}
LABELV $1201
line 2365
;2364:			//if there were no flag captures the last 4 minutes
;2365:			if (bs->lastflagcapture_time < FloatTime() - 240) {
ADDRFP4 0
INDIRP4
CNSTI4 11048
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1131413504
SUBF4
GEF4 $1205
line 2366
;2366:				bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11048
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2368
;2367:				//randomly change the CTF strategy
;2368:				if (random() < 0.4) {
ADDRLP4 68
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1053609165
GEF4 $1207
line 2369
;2369:					bs->ctfstrategy ^= CTFS_AGRESSIVE;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 11080
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2370
;2370:					bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2371
;2371:				}
LABELV $1207
line 2372
;2372:			}
LABELV $1205
line 2374
;2373:			//if it's time to give orders
;2374:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 2) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
INDIRF4
ASGNF4
ADDRLP4 68
INDIRF4
CNSTF4 0
EQF4 $1148
ADDRLP4 68
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1148
line 2375
;2375:				Bot1FCTFOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFOrders
CALLV
pop
line 2377
;2376:				//
;2377:				bs->teamgiveorders_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
CNSTF4 0
ASGNF4
line 2378
;2378:			}
line 2379
;2379:			break;
ADDRGP4 $1148
JUMPV
LABELV $1211
line 2382
;2380:		}
;2381:		case GT_OBELISK:
;2382:		{
line 2383
;2383:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1214
ADDRLP4 60
INDIRP4
CNSTI4 11072
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1212
LABELV $1214
line 2384
;2384:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2385
;2385:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2386
;2386:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 0
ASGNI4
line 2387
;2387:			}
LABELV $1212
line 2389
;2388:			//if it's time to give orders
;2389:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $1148
ADDRLP4 64
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $1148
line 2390
;2390:				BotObeliskOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotObeliskOrders
CALLV
pop
line 2392
;2391:				//give orders again after 30 seconds
;2392:				bs->teamgiveorders_time = FloatTime() + 30;
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 2393
;2393:			}
line 2394
;2394:			break;
ADDRGP4 $1148
JUMPV
LABELV $1217
line 2397
;2395:		}
;2396:		case GT_HARVESTER:
;2397:		{
line 2398
;2398:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 11052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1220
ADDRLP4 60
INDIRP4
CNSTI4 11072
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1218
LABELV $1220
line 2399
;2399:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2400
;2400:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 11052
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2401
;2401:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 0
ASGNI4
line 2402
;2402:			}
LABELV $1218
line 2404
;2403:			//if it's time to give orders
;2404:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $1148
ADDRLP4 64
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $1148
line 2405
;2405:				BotHarvesterOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotHarvesterOrders
CALLV
pop
line 2407
;2406:				//give orders again after 30 seconds
;2407:				bs->teamgiveorders_time = FloatTime() + 30;
ADDRFP4 0
INDIRP4
CNSTI4 11044
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 2408
;2408:			}
line 2409
;2409:			break;
LABELV $1147
LABELV $1148
line 2412
;2410:		}
;2411:	}
;2412:}
LABELV $1120
endproc BotTeamAI 76 12
import NpcFactionProp
bss
export lastRoundNumber
align 4
LABELV lastRoundNumber
skip 4
export ctftaskpreferences
align 4
LABELV ctftaskpreferences
skip 10240
import BotVoiceChat_Defend
import BotVoiceChatCommand
import BotDumpNodeSwitches
import BotResetNodeSwitches
import AINode_Battle_NBG
import AINode_Battle_Retreat
import AINode_Battle_Chase
import AINode_Battle_Fight
import AINode_Seek_LTG
import AINode_Seek_NBG
import AINode_Seek_ActivateEntity
import AINode_Stand
import AINode_Respawn
import AINode_Observer
import AINode_Intermission
import AIEnter_Battle_NBG
import AIEnter_Battle_Retreat
import AIEnter_Battle_Chase
import AIEnter_Battle_Fight
import AIEnter_Seek_Camp
import AIEnter_Seek_LTG
import AIEnter_Seek_NBG
import AIEnter_Seek_ActivateEntity
import AIEnter_Stand
import AIEnter_Respawn
import AIEnter_Observer
import AIEnter_Intermission
import BotPrintTeamGoal
import BotMatchMessage
import notleader
import BotChatTest
import BotValidChatPosition
import BotChatTime
import BotChat_Random
import BotChat_EnemySuicide
import BotChat_Kill
import BotChat_Death
import BotChat_HitNoKill
import BotChat_HitNoDeath
import BotChat_HitTalking
import BotChat_EndLevel
import BotChat_StartLevel
import BotChat_ExitGame
import BotChat_EnterGame
import neutralobelisk
import blueobelisk
import redobelisk
import ctf_neutralflag
import ctf_blueflag
import ctf_redflag
import bot_challenge
import bot_testrchat
import bot_nochat
import bot_fastchat
import bot_rocketjump
import bot_grapple
import maxclients
import gametype
import BotMapScripts
import BotPointAreaNum
import ClientOnSameTeamFromName
import ClientFromName
import stristr
import BotFindWayPoint
import BotCreateWayPoint
import BotAlternateRoute
import BotGetAlternateRouteGoal
import BotEnemyCubeCarrierVisible
import BotTeamCubeCarrierVisible
import BotHarvesterRetreatGoals
import BotHarvesterSeekGoals
import BotGoHarvest
import BotObeliskRetreatGoals
import BotObeliskSeekGoals
import Bot1FCTFRetreatGoals
import Bot1FCTFSeekGoals
import BotHarvesterCarryingCubes
import Bot1FCTFCarryingFlag
import BotCTFRetreatGoals
import BotCTFSeekGoals
import BotRememberLastOrderedTask
import BotCTFCarryingFlag
import BotOppositeTeam
import BotTeam
import BotClearActivateGoalStack
import BotPopFromActivateGoalStack
import BotEnableActivateGoalAreas
import BotAIPredictObstacles
import BotAIBlocked
import BotCheckAttack
import BotAimAtEnemy
import BotEntityVisible
import BotRoamGoal
import BotFindEnemy
import InFieldOfVision
import BotVisibleTeamMatesAndEnemies
import BotEnemyFlagCarrierVisible
import BotTeamFlagCarrierVisible
import BotTeamFlagCarrier
import TeamPlayIsOn
import BotSameTeam
import BotAttackMove
import BotWantsToCamp
import BotHasPersistantPowerupAndWeapon
import BotCanAndWantsToRocketJump
import BotWantsToHelp
import BotWantsToChase
import BotWantsToRetreat
import BotFeelingBad
import BotAggression
import BotTeamGoals
import BotSetLastOrderedTask
import BotSynonymContext
import ClientSkin
import EasyClientName
import ClientName
import BotSetTeamStatus
import BotSetUserInfo
import EntityHasKamikaze
import EntityIsShooting
import EntityIsInvisible
import EntityIsDead
import BotInLavaOrSlime
import BotIntermission
import BotIsObserver
import BotIsDead
import BotBattleUseItems
import BotUpdateBattleInventory
import BotUpdateInventory
import BotSetupForMovement
import BotChooseWeapon
import BotFreeWaypoints
import BotDeathmatchAI
import BotShutdownDeathmatchAI
import BotSetupDeathmatchAI
import BotTeamLeader
import BotAI_GetSnapshotEntity
import BotAI_GetEntityState
import BotAI_GetClientState
import BotAI_Trace
import BotAI_BotInitialChat
import BotAI_Print
import floattime
import BotEntityInfo
import NumBots
import BotResetState
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
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
LABELV $1144
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1143
byte 1 105
byte 1 97
byte 1 109
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1140
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1045
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $853
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $726
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $725
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $497
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 98
byte 1 0
align 1
LABELV $492
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $363
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $362
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $276
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $252
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $248
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 0
align 1
LABELV $244
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
LABELV $240
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $228
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $227
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $198
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $197
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $184
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $85
byte 1 116
byte 1 0
align 1
LABELV $81
byte 1 110
byte 1 0
align 1
LABELV $74
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
