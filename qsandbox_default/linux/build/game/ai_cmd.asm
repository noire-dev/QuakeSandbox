export BotGetItemTeamGoal
code
proc BotGetItemTeamGoal 12 12
file "../../../code/game/ai_cmd.c"
line 167
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
;25: * name:		ai_cmd.c
;26: *
;27: * desc:		Quake3 bot AI
;28: *
;29: * $Archive: /MissionPack/code/game/ai_cmd.c $
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
;50://
;51:#include "chars.h"				//characteristics
;52:#include "inv.h"				//indexes into the inventory
;53:#include "syn.h"				//synonyms
;54:#include "match.h"				//string matching types and vars
;55:
;56:// for the voice chats
;57:#include "../../ui/menudef.h"
;58:
;59:int notleader[MAX_CLIENTS];
;60:
;61:#ifdef DEBUG
;62:/*
;63:==================
;64:BotPrintTeamGoal
;65:==================
;66:*/
;67:void BotPrintTeamGoal(bot_state_t *bs) {
;68:	char netname[MAX_NETNAME];
;69:	float t;
;70:
;71:	ClientName(bs->client, netname, sizeof(netname));
;72:	t = bs->teamgoal_time - FloatTime();
;73:	switch(bs->ltgtype) {
;74:		case LTG_TEAMHELP:
;75:		{
;76:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna help a team mate for %1.0f secs\n", netname, t);
;77:			break;
;78:		}
;79:		case LTG_TEAMACCOMPANY:
;80:		{
;81:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna accompany a team mate for %1.0f secs\n", netname, t);
;82:			break;
;83:		}
;84:		case LTG_GETFLAG:
;85:		{
;86:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna get the flag for %1.0f secs\n", netname, t);
;87:			break;
;88:		}
;89:		case LTG_RUSHBASE:
;90:		{
;91:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna rush to the base for %1.0f secs\n", netname, t);
;92:			break;
;93:		}
;94:		case LTG_RETURNFLAG:
;95:		{
;96:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna try to return the flag for %1.0f secs\n", netname, t);
;97:			break;
;98:		}
;99:		case LTG_ATTACKENEMYBASE:
;100:		{
;101:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna attack the enemy base for %1.0f secs\n", netname, t);
;102:			break;
;103:		}
;104:		case LTG_HARVEST:
;105:		{
;106:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna harvest for %1.0f secs\n", netname, t);
;107:			break;
;108:		}
;109:		case LTG_DEFENDKEYAREA:
;110:		{
;111:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna defend a key area for %1.0f secs\n", netname, t);
;112:			break;
;113:		}
;114:		case LTG_GETITEM:
;115:		{
;116:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna get an item for %1.0f secs\n", netname, t);
;117:			break;
;118:		}
;119:		case LTG_KILL:
;120:		{
;121:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna kill someone for %1.0f secs\n", netname, t);
;122:			break;
;123:		}
;124:		case LTG_CAMP:
;125:		case LTG_CAMPORDER:
;126:		{
;127:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna camp for %1.0f secs\n", netname, t);
;128:			break;
;129:		}
;130:		case LTG_PATROL:
;131:		{
;132:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna patrol for %1.0f secs\n", netname, t);
;133:			break;
;134:		}
;135:		case LTG_POINTA:
;136:		{
;137:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna take care of point A for %1.0f secs\n", netname, t);
;138:			break;
;139:		}
;140:		case LTG_POINTB:
;141:		{
;142:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna take care of point B for %1.0f secs\n", netname, t);
;143:			break;
;144:		}
;145:		default:
;146:		{
;147:			if (bs->ctfroam_time > FloatTime()) {
;148:				t = bs->ctfroam_time - FloatTime();
;149:				BotAI_Print(PRT_MESSAGE, "%s: I'm gonna roam for %1.0f secs\n", netname, t);
;150:			}
;151:			else {
;152:				BotAI_Print(PRT_MESSAGE, "%s: I've got a regular goal\n", netname);
;153:			}
;154:		}
;155:	}
;156:}
;157:#endif //DEBUG
;158:
;159:/*
;160:==================
;161:BotGetItemTeamGoal
;162:
;163:FIXME: add stuff like "upper rocket launcher"
;164:"the rl near the railgun", "lower grenade launcher" etc.
;165:==================
;166:*/
;167:int BotGetItemTeamGoal(char *goalname, bot_goal_t *goal) {
line 170
;168:	int i;
;169:
;170:	if (!strlen(goalname)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $66
CNSTI4 0
RETI4
ADDRGP4 $65
JUMPV
LABELV $66
line 171
;171:	i = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $68
line 172
;172:	do {
line 173
;173:		i = trap_BotGetLevelItemGoal(i, goalname, goal);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 174
;174:		if (i > 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $71
line 176
;175:			//do NOT defend dropped items
;176:			if (goal->flags & GFL_DROPPED)
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $73
line 177
;177:				continue;
ADDRGP4 $69
JUMPV
LABELV $73
line 178
;178:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $65
JUMPV
LABELV $71
line 180
;179:		}
;180:	} while(i > 0);
LABELV $69
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $68
line 181
;181:	return qfalse;
CNSTI4 0
RETI4
LABELV $65
endproc BotGetItemTeamGoal 12 12
export BotGetMessageTeamGoal
proc BotGetMessageTeamGoal 12 12
line 189
;182:}
;183:
;184:/*
;185:==================
;186:BotGetMessageTeamGoal
;187:==================
;188:*/
;189:int BotGetMessageTeamGoal(bot_state_t *bs, char *goalname, bot_goal_t *goal) {
line 192
;190:	bot_waypoint_t *cp;
;191:
;192:	if (BotGetItemTeamGoal(goalname, goal)) return qtrue;
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotGetItemTeamGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $76
CNSTI4 1
RETI4
ADDRGP4 $75
JUMPV
LABELV $76
line 194
;193:
;194:	cp = BotFindWayPoint(bs->checkpoints, goalname);
ADDRFP4 0
INDIRP4
CNSTI4 13176
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotFindWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 195
;195:	if (cp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $78
line 196
;196:		memcpy(goal, &cp->goal, sizeof(bot_goal_t));
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 197
;197:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $75
JUMPV
LABELV $78
line 199
;198:	}
;199:	return qfalse;
CNSTI4 0
RETI4
LABELV $75
endproc BotGetMessageTeamGoal 12 12
export BotGetTime
proc BotGetTime 600 16
line 207
;200:}
;201:
;202:/*
;203:==================
;204:BotGetTime
;205:==================
;206:*/
;207:float BotGetTime(bot_match_t *match) {
line 213
;208:	bot_match_t timematch;
;209:	char timestring[MAX_MESSAGE_SIZE];
;210:	float t;
;211:
;212:	//if the matched string has a time
;213:	if (match->subtype & ST_TIME) {
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $81
line 215
;214:		//get the time string
;215:		trap_BotMatchVariable(match, TIME, timestring, MAX_MESSAGE_SIZE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 217
;216:		//match it to find out if the time is in seconds or minutes
;217:		if (trap_BotFindMatch(timestring, &timematch, MTCONTEXT_TIME)) {
ADDRLP4 0
ARGP4
ADDRLP4 256
ARGP4
CNSTU4 8
ARGU4
ADDRLP4 588
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $83
line 218
;218:			if (timematch.type == MSG_FOREVER) {
ADDRLP4 256+256
INDIRI4
CNSTI4 107
NEI4 $85
line 219
;219:				t = 99999999.0f;
ADDRLP4 584
CNSTF4 1287568416
ASGNF4
line 220
;220:			}
ADDRGP4 $86
JUMPV
LABELV $85
line 221
;221:			else if (timematch.type == MSG_FORAWHILE) {
ADDRLP4 256+256
INDIRI4
CNSTI4 109
NEI4 $88
line 222
;222:				t = 10 * 60; // 10 minutes
ADDRLP4 584
CNSTF4 1142292480
ASGNF4
line 223
;223:			}
ADDRGP4 $89
JUMPV
LABELV $88
line 224
;224:			else if (timematch.type == MSG_FORALONGTIME) {
ADDRLP4 256+256
INDIRI4
CNSTI4 108
NEI4 $91
line 225
;225:				t = 30 * 60; // 30 minutes
ADDRLP4 584
CNSTF4 1155596288
ASGNF4
line 226
;226:			}
ADDRGP4 $92
JUMPV
LABELV $91
line 227
;227:			else {
line 228
;228:				trap_BotMatchVariable(&timematch, TIME, timestring, MAX_MESSAGE_SIZE);
ADDRLP4 256
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 229
;229:				if (timematch.type == MSG_MINUTES) t = atof(timestring) * 60;
ADDRLP4 256+256
INDIRI4
CNSTI4 105
NEI4 $94
ADDRLP4 0
ARGP4
ADDRLP4 592
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 584
CNSTF4 1114636288
ADDRLP4 592
INDIRF4
MULF4
ASGNF4
ADDRGP4 $95
JUMPV
LABELV $94
line 230
;230:				else if (timematch.type == MSG_SECONDS) t = atof(timestring);
ADDRLP4 256+256
INDIRI4
CNSTI4 106
NEI4 $97
ADDRLP4 0
ARGP4
ADDRLP4 596
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 584
ADDRLP4 596
INDIRF4
ASGNF4
ADDRGP4 $98
JUMPV
LABELV $97
line 231
;231:				else t = 0;
ADDRLP4 584
CNSTF4 0
ASGNF4
LABELV $98
LABELV $95
line 232
;232:			}
LABELV $92
LABELV $89
LABELV $86
line 234
;233:			//if there's a valid time
;234:			if (t > 0) return FloatTime() + t;
ADDRLP4 584
INDIRF4
CNSTF4 0
LEF4 $100
ADDRGP4 floattime
INDIRF4
ADDRLP4 584
INDIRF4
ADDF4
RETF4
ADDRGP4 $80
JUMPV
LABELV $100
line 235
;235:		}
LABELV $83
line 236
;236:	}
LABELV $81
line 237
;237:	return 0;
CNSTF4 0
RETF4
LABELV $80
endproc BotGetTime 600 16
bss
align 4
LABELV $103
skip 4
export FindClientByName
code
proc FindClientByName 1040 12
line 245
;238:}
;239:
;240:/*
;241:==================
;242:FindClientByName
;243:==================
;244:*/
;245:int FindClientByName(char *name) {
line 250
;246:	int i;
;247:	char buf[MAX_INFO_STRING];
;248:	static int maxclients;
;249:
;250:	if (!maxclients)
ADDRGP4 $103
INDIRI4
CNSTI4 0
NEI4 $104
line 251
;251:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $106
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $103
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $104
line 252
;252:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $107
line 253
;253:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 254
;254:		if (!Q_stricmp(buf, name)) return i;
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $111
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $102
JUMPV
LABELV $111
line 255
;255:	}
LABELV $108
line 252
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $110
ADDRLP4 0
INDIRI4
ADDRGP4 $103
INDIRI4
GEI4 $113
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $107
LABELV $113
line 256
;256:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 257
;257:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 258
;258:		if (stristr(buf, name)) return i;
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $102
JUMPV
LABELV $118
line 259
;259:	}
LABELV $115
line 256
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $117
ADDRLP4 0
INDIRI4
ADDRGP4 $103
INDIRI4
GEI4 $120
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $114
LABELV $120
line 260
;260:	return -1;
CNSTI4 -1
RETI4
LABELV $102
endproc FindClientByName 1040 12
bss
align 4
LABELV $122
skip 4
export FindEnemyByName
code
proc FindEnemyByName 1044 12
line 268
;261:}
;262:
;263:/*
;264:==================
;265:FindEnemyByName
;266:==================
;267:*/
;268:int FindEnemyByName(bot_state_t *bs, char *name) {
line 273
;269:	int i;
;270:	char buf[MAX_INFO_STRING];
;271:	static int maxclients;
;272:
;273:	if (!maxclients)
ADDRGP4 $122
INDIRI4
CNSTI4 0
NEI4 $123
line 274
;274:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $106
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $122
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $123
line 275
;275:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $128
JUMPV
LABELV $125
line 276
;276:		if(gametype != GT_SANDBOX || gametype != GT_SINGLE){if (BotSameTeam(bs, i)) continue;}
ADDRLP4 1032
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $131
ADDRLP4 1032
INDIRI4
CNSTI4 2
EQI4 $129
LABELV $131
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1036
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $132
ADDRGP4 $126
JUMPV
LABELV $132
LABELV $129
line 277
;277:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 278
;278:		if (!Q_stricmp(buf, name)) return i;
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $134
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $121
JUMPV
LABELV $134
line 279
;279:	}
LABELV $126
line 275
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $128
ADDRLP4 0
INDIRI4
ADDRGP4 $122
INDIRI4
GEI4 $136
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $125
LABELV $136
line 280
;280:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $137
line 281
;281:		if(gametype != GT_SANDBOX || gametype != GT_SINGLE){if (BotSameTeam(bs, i)) continue;}
ADDRLP4 1036
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $143
ADDRLP4 1036
INDIRI4
CNSTI4 2
EQI4 $141
LABELV $143
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $144
ADDRGP4 $138
JUMPV
LABELV $144
LABELV $141
line 282
;282:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 283
;283:		if (stristr(buf, name)) return i;
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $146
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $121
JUMPV
LABELV $146
line 284
;284:	}
LABELV $138
line 280
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $140
ADDRLP4 0
INDIRI4
ADDRGP4 $122
INDIRI4
GEI4 $148
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $137
LABELV $148
line 285
;285:	return -1;
CNSTI4 -1
RETI4
LABELV $121
endproc FindEnemyByName 1044 12
bss
align 4
LABELV $150
skip 4
export NumPlayersOnSameTeam
code
proc NumPlayersOnSameTeam 1044 12
line 293
;286:}
;287:
;288:/*
;289:==================
;290:NumPlayersOnSameTeam
;291:==================
;292:*/
;293:int NumPlayersOnSameTeam(bot_state_t *bs) {
line 298
;294:	int i, num;
;295:	char buf[MAX_INFO_STRING];
;296:	static int maxclients;
;297:
;298:	if (!maxclients)
ADDRGP4 $150
INDIRI4
CNSTI4 0
NEI4 $151
line 299
;299:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $106
ARGP4
ADDRLP4 1032
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $150
ADDRLP4 1032
INDIRI4
ASGNI4
LABELV $151
line 301
;300:
;301:	num = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 302
;302:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $156
JUMPV
LABELV $153
line 303
;303:		trap_GetConfigstring(CS_PLAYERS+i, buf, MAX_INFO_STRING);
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
line 304
;304:		if (strlen(buf)) {
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $157
line 305
;305:			if (BotSameTeam(bs, i+1)) num++;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1040
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $159
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $159
line 306
;306:		}
LABELV $157
line 307
;307:	}
LABELV $154
line 302
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $156
ADDRLP4 0
INDIRI4
ADDRGP4 $150
INDIRI4
GEI4 $161
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $153
LABELV $161
line 308
;308:	return num;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $149
endproc NumPlayersOnSameTeam 1044 12
export BotGetPatrolWaypoints
proc BotGetPatrolWaypoints 676 16
line 316
;309:}
;310:
;311:/*
;312:==================
;313:TeamPlayIsOn
;314:==================
;315:*/
;316:int BotGetPatrolWaypoints(bot_state_t *bs, bot_match_t *match) {
line 323
;317:	char keyarea[MAX_MESSAGE_SIZE];
;318:	int patrolflags;
;319:	bot_waypoint_t *wp, *newwp, *newpatrolpoints;
;320:	bot_match_t keyareamatch;
;321:	bot_goal_t goal;
;322:
;323:	newpatrolpoints = NULL;
ADDRLP4 592
CNSTP4 0
ASGNP4
line 324
;324:	patrolflags = 0;
ADDRLP4 652
CNSTI4 0
ASGNI4
line 326
;325:	//
;326:	trap_BotMatchVariable(match, KEYAREA, keyarea, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
ADDRGP4 $164
JUMPV
LABELV $163
line 328
;327:	//
;328:	while(1) {
line 329
;329:		if (!trap_BotFindMatch(keyarea, &keyareamatch, MTCONTEXT_PATROLKEYAREA)) {
ADDRLP4 8
ARGP4
ADDRLP4 264
ARGP4
CNSTU4 64
ARGU4
ADDRLP4 656
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
NEI4 $166
line 330
;330:                            trap_EA_SayTeam(bs->client, "what do you say?");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $168
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 331
;331:			BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 332
;332:			bs->patrolpoints = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
CNSTP4 0
ASGNP4
line 333
;333:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $162
JUMPV
LABELV $166
line 335
;334:		}
;335:		trap_BotMatchVariable(&keyareamatch, KEYAREA, keyarea, MAX_MESSAGE_SIZE);
ADDRLP4 264
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 336
;336:		if (!BotGetMessageTeamGoal(bs, keyarea, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 596
ARGP4
ADDRLP4 660
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
NEI4 $169
line 339
;337:			//BotAI_BotInitialChat(bs, "cannotfind", keyarea, NULL);
;338:			//trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;339:			BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 340
;340:			bs->patrolpoints = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
CNSTP4 0
ASGNP4
line 341
;341:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $162
JUMPV
LABELV $169
line 344
;342:		}
;343:		//create a new waypoint
;344:		newwp = BotCreateWayPoint(keyarea, goal.origin, 0, goal.areanum);
ADDRLP4 8
ARGP4
ADDRLP4 596
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 596+12
INDIRI4
ARGI4
ADDRLP4 664
ADDRGP4 BotCreateWayPoint
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 664
INDIRP4
ASGNP4
line 345
;345:		if (!newwp)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $172
line 346
;346:			break;
ADDRGP4 $165
JUMPV
LABELV $172
line 348
;347:		//add the waypoint to the patrol points
;348:		newwp->next = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
CNSTP4 0
ASGNP4
line 349
;349:		for (wp = newpatrolpoints; wp && wp->next; wp = wp->next);
ADDRLP4 0
ADDRLP4 592
INDIRP4
ASGNP4
ADDRGP4 $177
JUMPV
LABELV $174
LABELV $175
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $177
ADDRLP4 672
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 672
INDIRU4
EQU4 $178
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 672
INDIRU4
NEU4 $174
LABELV $178
line 350
;350:		if (!wp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $179
line 351
;351:			newpatrolpoints = newwp;
ADDRLP4 592
ADDRLP4 4
INDIRP4
ASGNP4
line 352
;352:			newwp->prev = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
CNSTP4 0
ASGNP4
line 353
;353:		}
ADDRGP4 $180
JUMPV
LABELV $179
line 354
;354:		else {
line 355
;355:			wp->next = newwp;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 356
;356:			newwp->prev = wp;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 357
;357:		}
LABELV $180
line 359
;358:		//
;359:		if (keyareamatch.subtype & ST_BACK) {
ADDRLP4 264+260
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $181
line 360
;360:			patrolflags = PATROL_LOOP;
ADDRLP4 652
CNSTI4 1
ASGNI4
line 361
;361:			break;
ADDRGP4 $165
JUMPV
LABELV $181
line 363
;362:		}
;363:		else if (keyareamatch.subtype & ST_REVERSE) {
ADDRLP4 264+260
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $184
line 364
;364:			patrolflags = PATROL_REVERSE;
ADDRLP4 652
CNSTI4 2
ASGNI4
line 365
;365:			break;
ADDRGP4 $165
JUMPV
LABELV $184
line 367
;366:		}
;367:		else if (keyareamatch.subtype & ST_MORE) {
ADDRLP4 264+260
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $165
line 368
;368:			trap_BotMatchVariable(&keyareamatch, MORE, keyarea, MAX_MESSAGE_SIZE);
ADDRLP4 264
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 369
;369:		}
line 370
;370:		else {
line 371
;371:			break;
LABELV $188
line 373
;372:		}
;373:	}
LABELV $164
line 328
ADDRGP4 $163
JUMPV
LABELV $165
line 375
;374:	//
;375:	if (!newpatrolpoints || !newpatrolpoints->next) {
ADDRLP4 660
CNSTU4 0
ASGNU4
ADDRLP4 592
INDIRP4
CVPU4 4
ADDRLP4 660
INDIRU4
EQU4 $192
ADDRLP4 592
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 660
INDIRU4
NEU4 $190
LABELV $192
line 376
;376:		trap_EA_SayTeam(bs->client, "I need more key points to patrol\n");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $193
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 377
;377:		BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 378
;378:		newpatrolpoints = NULL;
ADDRLP4 592
CNSTP4 0
ASGNP4
line 379
;379:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $162
JUMPV
LABELV $190
line 382
;380:	}
;381:	//
;382:	BotFreeWaypoints(bs->patrolpoints);
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 383
;383:	bs->patrolpoints = newpatrolpoints;
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
ADDRLP4 592
INDIRP4
ASGNP4
line 385
;384:	//
;385:	bs->curpatrolpoint = bs->patrolpoints;
ADDRLP4 664
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 664
INDIRP4
CNSTI4 13184
ADDP4
ADDRLP4 664
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
ASGNP4
line 386
;386:	bs->patrolflags = patrolflags;
ADDRFP4 0
INDIRP4
CNSTI4 13188
ADDP4
ADDRLP4 652
INDIRI4
ASGNI4
line 388
;387:	//
;388:	return qtrue;
CNSTI4 1
RETI4
LABELV $162
endproc BotGetPatrolWaypoints 676 16
export BotAddressedToBot
proc BotAddressedToBot 1572 16
line 396
;389:}
;390:
;391:/*
;392:==================
;393:BotAddressedToBot
;394:==================
;395:*/
;396:int BotAddressedToBot(bot_state_t *bs, bot_match_t *match) {
line 404
;397:	char addressedto[MAX_MESSAGE_SIZE];
;398:	char netname[MAX_MESSAGE_SIZE];
;399:	char name[MAX_MESSAGE_SIZE];
;400:	char botname[128];
;401:	int client;
;402:	bot_match_t addresseematch;
;403:
;404:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 840
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 405
;405:	client = ClientOnSameTeamFromName(bs, netname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 840
ARGP4
ADDRLP4 1228
ADDRGP4 ClientOnSameTeamFromName
CALLI4
ASGNI4
ADDRLP4 1096
ADDRLP4 1228
INDIRI4
ASGNI4
line 406
;406:	if (client < 0) return qfalse;
ADDRLP4 1096
INDIRI4
CNSTI4 0
GEI4 $195
CNSTI4 0
RETI4
ADDRGP4 $194
JUMPV
LABELV $195
line 408
;407:	//if the message is addressed to someone
;408:	if (match->subtype & ST_ADDRESSED) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $197
line 409
;409:		trap_BotMatchVariable(match, ADDRESSEE, addressedto, sizeof(addressedto));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 584
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 411
;410:		//the name of this bot
;411:		ClientName(bs->client, botname, 128);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1100
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRGP4 $200
JUMPV
LABELV $199
line 413
;412:		//
;413:		while(trap_BotFindMatch(addressedto, &addresseematch, MTCONTEXT_ADDRESSEE)) {
line 414
;414:			if (addresseematch.type == MSG_EVERYONE) {
ADDRLP4 0+256
INDIRI4
CNSTI4 101
NEI4 $202
line 415
;415:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $194
JUMPV
LABELV $202
line 417
;416:			}
;417:			else if (addresseematch.type == MSG_MULTIPLENAMES) {
ADDRLP4 0+256
INDIRI4
CNSTI4 102
NEI4 $205
line 418
;418:				trap_BotMatchVariable(&addresseematch, TEAMMATE, name, sizeof(name));
ADDRLP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 328
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 419
;419:				if (strlen(name)) {
ADDRLP4 328
ARGP4
ADDRLP4 1232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $208
line 420
;420:					if (!strcmp(botname, name)) return qtrue;
ADDRLP4 1100
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1236
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $210
CNSTI4 1
RETI4
ADDRGP4 $194
JUMPV
LABELV $210
line 421
;421:					if (!strcmp(bs->subteam, name)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11084
ADDP4
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1240
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $212
CNSTI4 1
RETI4
ADDRGP4 $194
JUMPV
LABELV $212
line 422
;422:				}
LABELV $208
line 423
;423:				trap_BotMatchVariable(&addresseematch, MORE, addressedto, MAX_MESSAGE_SIZE);
ADDRLP4 0
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 584
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 424
;424:			}
ADDRGP4 $206
JUMPV
LABELV $205
line 425
;425:			else {
line 426
;426:				trap_BotMatchVariable(&addresseematch, TEAMMATE, name, MAX_MESSAGE_SIZE);
ADDRLP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 328
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 427
;427:				if (strlen(name)) {
ADDRLP4 328
ARGP4
ADDRLP4 1232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $201
line 428
;428:					if (!strcmp(botname, name)) return qtrue;
ADDRLP4 1100
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1236
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $216
CNSTI4 1
RETI4
ADDRGP4 $194
JUMPV
LABELV $216
line 429
;429:					if (!strcmp(bs->subteam, name)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11084
ADDP4
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1240
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $201
CNSTI4 1
RETI4
ADDRGP4 $194
JUMPV
line 430
;430:				}
line 431
;431:				break;
LABELV $206
line 433
;432:			}
;433:		}
LABELV $200
line 413
ADDRLP4 584
ARGP4
ADDRLP4 0
ARGP4
CNSTU4 32
ARGU4
ADDRLP4 1232
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
NEI4 $199
LABELV $201
line 436
;434:		//Com_sprintf(buf, sizeof(buf), "not addressed to me but %s", addressedto);
;435:		//trap_EA_Say(bs->client, buf);
;436:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $194
JUMPV
LABELV $197
line 438
;437:	}
;438:	else {
line 441
;439:		bot_match_t tellmatch;
;440:
;441:		tellmatch.type = 0;
ADDRLP4 1232+256
CNSTI4 0
ASGNI4
line 443
;442:		//if this message wasn't directed solely to this bot
;443:		if (!trap_BotFindMatch(match->string, &tellmatch, MTCONTEXT_REPLYCHAT) ||
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1232
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 1560
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1560
INDIRI4
CNSTI4 0
EQI4 $224
ADDRLP4 1232+256
INDIRI4
CNSTI4 202
EQI4 $221
LABELV $224
line 444
;444:				tellmatch.type != MSG_CHATTELL) {
line 446
;445:			//make sure not everyone reacts to this message
;446:			if (random() > (float ) 1.0 / (NumPlayersOnSameTeam(bs)-1)) return qfalse;
ADDRLP4 1564
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1568
ADDRGP4 NumPlayersOnSameTeam
CALLI4
ASGNI4
ADDRLP4 1564
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1065353216
ADDRLP4 1568
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
DIVF4
LEF4 $225
CNSTI4 0
RETI4
ADDRGP4 $194
JUMPV
LABELV $225
line 447
;447:		}
LABELV $221
line 448
;448:	}
line 449
;449:	return qtrue;
CNSTI4 1
RETI4
LABELV $194
endproc BotAddressedToBot 1572 16
export BotGPSToPosition
proc BotGPSToPosition 20 12
line 457
;450:}
;451:
;452:/*
;453:==================
;454:BotGPSToPosition
;455:==================
;456:*/
;457:int BotGPSToPosition(char *buf, vec3_t position) {
line 458
;458:	int i, j = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 461
;459:	int num, sign;
;460:
;461:	for (i = 0; i < 3; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $228
line 462
;462:		num = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $233
JUMPV
LABELV $232
line 463
;463:		while(buf[j] == ' ') j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $233
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $232
line 464
;464:		if (buf[j] == '-') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $235
line 465
;465:			j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 466
;466:			sign = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 467
;467:		}
ADDRGP4 $238
JUMPV
LABELV $235
line 468
;468:		else {
line 469
;469:			sign = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 470
;470:		}
ADDRGP4 $238
JUMPV
LABELV $237
line 471
;471:		while (buf[j]) {
line 472
;472:			if (buf[j] >= '0' && buf[j] <= '9') {
ADDRLP4 16
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $240
ADDRLP4 16
INDIRI4
CNSTI4 57
GTI4 $240
line 473
;473:				num = num * 10 + buf[j] - '0';
ADDRLP4 4
CNSTI4 10
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDI4
CNSTI4 48
SUBI4
ASGNI4
line 474
;474:				j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 475
;475:			}
ADDRGP4 $241
JUMPV
LABELV $240
line 476
;476:			else {
line 477
;477:				j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 478
;478:				break;
ADDRGP4 $239
JUMPV
LABELV $241
line 480
;479:			}
;480:		}
LABELV $238
line 471
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $237
LABELV $239
line 481
;481:		BotAI_Print(PRT_MESSAGE, "%d\n", sign * num);
CNSTI4 1
ARGI4
ADDRGP4 $242
ARGP4
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 482
;482:		position[i] = (float) sign * num;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 483
;483:	}
LABELV $229
line 461
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $228
line 484
;484:	return qtrue;
CNSTI4 1
RETI4
LABELV $227
endproc BotGPSToPosition 20 12
export BotMatch_HelpAccompany
proc BotMatch_HelpAccompany 1272 16
line 492
;485:}
;486:
;487:/*
;488:==================
;489:BotMatch_HelpAccompany
;490:==================
;491:*/
;492:void BotMatch_HelpAccompany(bot_state_t *bs, bot_match_t *match) {
line 500
;493:	int client, other, areanum;
;494:	char teammate[MAX_MESSAGE_SIZE];
;495:	char netname[MAX_MESSAGE_SIZE];
;496:	char itemname[MAX_MESSAGE_SIZE];
;497:	bot_match_t teammatematch;
;498:	aas_entityinfo_t entinfo;
;499:
;500:	if (!TeamPlayIsOn()) return;
ADDRLP4 1248
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 0
NEI4 $244
ADDRGP4 $243
JUMPV
LABELV $244
line 502
;501:	//if not addressed to this bot
;502:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1252
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
NEI4 $246
ADDRGP4 $243
JUMPV
LABELV $246
line 504
;503:	//get the team mate name
;504:	trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 506
;505:	//get the client to help
;506:	if (trap_BotFindMatch(teammate, &teammatematch, MTCONTEXT_TEAMMATE) &&
ADDRLP4 260
ARGP4
ADDRLP4 656
ARGP4
CNSTU4 16
ARGU4
ADDRLP4 1256
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1256
INDIRI4
CNSTI4 0
EQI4 $248
ADDRLP4 656+256
INDIRI4
CNSTI4 100
NEI4 $248
line 508
;507:			//if someone asks for him or herself
;508:			teammatematch.type == MSG_ME) {
line 510
;509:		//get the netname
;510:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 511
;511:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 512
;512:		other = qfalse;
ADDRLP4 984
CNSTI4 0
ASGNI4
line 513
;513:	}
ADDRGP4 $249
JUMPV
LABELV $248
line 514
;514:	else {
line 516
;515:		//asked for someone else
;516:		client = FindClientByName(teammate);
ADDRLP4 260
ARGP4
ADDRLP4 1260
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 518
;517:		//if this is the bot self
;518:		if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $251
line 519
;519:			other = qfalse;
ADDRLP4 984
CNSTI4 0
ASGNI4
line 520
;520:		}
ADDRGP4 $252
JUMPV
LABELV $251
line 521
;521:		else if (!BotSameTeam(bs, client)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1264
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
NEI4 $253
line 523
;522:			//FIXME: say "I don't help the enemy"
;523:			return;
ADDRGP4 $243
JUMPV
LABELV $253
line 525
;524:		}
;525:		else {
line 526
;526:			other = qtrue;
ADDRLP4 984
CNSTI4 1
ASGNI4
line 527
;527:		}
LABELV $252
line 528
;528:	}
LABELV $249
line 530
;529:	//if the bot doesn't know who to help (FindClientByName returned -1)
;530:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $255
line 531
;531:		if (other) BotAI_BotInitialChat(bs, "whois", teammate, NULL);
ADDRLP4 984
INDIRI4
CNSTI4 0
EQI4 $257
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $258
JUMPV
LABELV $257
line 532
;532:		else BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $258
line 533
;533:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 534
;534:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 535
;535:		return;
ADDRGP4 $243
JUMPV
LABELV $255
line 538
;536:	}
;537:	//don't help or accompany yourself
;538:	if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $260
line 539
;539:		return;
ADDRGP4 $243
JUMPV
LABELV $260
line 542
;540:	}
;541:	//
;542:	bs->teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
CNSTI4 -1
ASGNI4
line 543
;543:	BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 516
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 545
;544:	//if info is valid (in PVS)
;545:	if (entinfo.valid) {
ADDRLP4 516
INDIRI4
CNSTI4 0
EQI4 $262
line 546
;546:		areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 516+24
ARGP4
ADDRLP4 1260
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 988
ADDRLP4 1260
INDIRI4
ASGNI4
line 547
;547:		if (areanum) {// && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 988
INDIRI4
CNSTI4 0
EQI4 $265
line 548
;548:			bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 549
;549:			bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10740
ADDP4
ADDRLP4 988
INDIRI4
ASGNI4
line 550
;550:			VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ADDRLP4 516+24
INDIRB
ASGNB 12
line 551
;551:			VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 10744
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10748
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10752
ADDP4
CNSTF4 3238002688
ASGNF4
line 552
;552:			VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 10756
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10760
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10764
ADDP4
CNSTF4 1090519040
ASGNF4
line 553
;553:		}
LABELV $265
line 554
;554:	}
LABELV $262
line 556
;555:	//if no teamgoal yet
;556:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
CNSTI4 0
GEI4 $268
line 558
;557:		//if near an item
;558:		if (match->subtype & ST_NEARITEM) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $270
line 560
;559:			//get the match variable
;560:			trap_BotMatchVariable(match, ITEM, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 992
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 562
;561:			//
;562:			if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 1260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
ARGP4
ADDRLP4 992
ARGP4
ADDRLP4 1260
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRLP4 1264
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
NEI4 $272
line 565
;563:				//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;564:				//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;565:				return;
ADDRGP4 $243
JUMPV
LABELV $272
line 567
;566:			}
;567:		}
LABELV $270
line 568
;568:	}
LABELV $268
line 570
;569:	//
;570:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
CNSTI4 0
GEI4 $274
line 571
;571:		if (other) BotAI_BotInitialChat(bs, "whereis", teammate, NULL);
ADDRLP4 984
INDIRI4
CNSTI4 0
EQI4 $276
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $277
JUMPV
LABELV $276
line 572
;572:		else BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $277
line 573
;573:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 574
;574:		trap_BotEnterChat(bs->cs, client, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 575
;575:		return;
ADDRGP4 $243
JUMPV
LABELV $274
line 578
;576:	}
;577:	//the team mate
;578:	bs->teammate = client;
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 580
;579:	//
;580:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 582
;581:	//
;582:	client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 584
;583:	//the team mate who ordered
;584:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 585
;585:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 586
;586:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 588
;587:	//last time the team mate was assumed visible
;588:	bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 590
;589:	//set the time to send a message to the team mates
;590:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 1264
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 1264
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 592
;591:	//get the team goal time
;592:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1268
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRLP4 1268
INDIRF4
ASGNF4
line 594
;593:	//set the ltg type
;594:	if (match->type == MSG_HELP) {
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 3
NEI4 $280
line 595
;595:		bs->ltgtype = LTG_TEAMHELP;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 1
ASGNI4
line 596
;596:		if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_HELP_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
CNSTF4 0
NEF4 $281
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 597
;597:	}
ADDRGP4 $281
JUMPV
LABELV $280
line 598
;598:	else {
line 599
;599:		bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 2
ASGNI4
line 600
;600:		if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
CNSTF4 0
NEF4 $284
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $284
line 601
;601:		bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 11116
ADDP4
CNSTF4 1121976320
ASGNF4
line 602
;602:		bs->arrive_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
CNSTF4 0
ASGNF4
line 604
;603:		//
;604:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 606
;605:		// remember last ordered task
;606:		BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 607
;607:	}
LABELV $281
line 611
;608:#ifdef DEBUG
;609:	BotPrintTeamGoal(bs);
;610:#endif //DEBUG
;611:}
LABELV $243
endproc BotMatch_HelpAccompany 1272 16
export BotMatch_DefendKeyArea
proc BotMatch_DefendKeyArea 544 16
line 618
;612:
;613:/*
;614:==================
;615:BotMatch_DefendKeyArea
;616:==================
;617:*/
;618:void BotMatch_DefendKeyArea(bot_state_t *bs, bot_match_t *match) {
line 623
;619:	char itemname[MAX_MESSAGE_SIZE];
;620:	char netname[MAX_MESSAGE_SIZE];
;621:	int client;
;622:
;623:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $287
ADDRGP4 $286
JUMPV
LABELV $287
line 625
;624:	//if not addressed to this bot
;625:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $289
ADDRGP4 $286
JUMPV
LABELV $289
line 627
;626:	//get the match variable
;627:	trap_BotMatchVariable(match, KEYAREA, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 629
;628:	//
;629:	if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 524
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRLP4 528
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
NEI4 $291
line 632
;630:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;631:		//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;632:		return;
ADDRGP4 $286
JUMPV
LABELV $291
line 635
;633:	}
;634:	//
;635:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 637
;636:	//
;637:	client = ClientFromName(netname);
ADDRLP4 256
ARGP4
ADDRLP4 532
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 532
INDIRI4
ASGNI4
line 639
;638:	//the team mate who ordered
;639:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 640
;640:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 641
;641:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 643
;642:	//set the time to send a message to the team mates
;643:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 536
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 536
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 645
;644:	//set the ltg type
;645:	bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 3
ASGNI4
line 647
;646:	//get the team goal time
;647:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 540
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRLP4 540
INDIRF4
ASGNF4
line 649
;648:	//set the team goal time
;649:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
CNSTF4 0
NEF4 $293
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $293
line 651
;650:	//away from defending
;651:	bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
CNSTF4 0
ASGNF4
line 653
;652:	//
;653:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 655
;654:	// remember last ordered task
;655:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 659
;656:#ifdef DEBUG
;657:	BotPrintTeamGoal(bs);
;658:#endif //DEBUG
;659:}
LABELV $286
endproc BotMatch_DefendKeyArea 544 16
export BotMatch_TakeA
proc BotMatch_TakeA 280 16
line 667
;660:
;661:/*
;662:==================
;663:BotMatch_TakeA
;664:For Double Domination
;665:==================
;666:*/
;667:void BotMatch_TakeA(bot_state_t *bs, bot_match_t *match) {
line 672
;668:// 	char itemname[MAX_MESSAGE_SIZE];
;669:	char netname[MAX_MESSAGE_SIZE];
;670:	int client;
;671:
;672:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $296
ADDRGP4 $295
JUMPV
LABELV $296
line 674
;673:	//if not addressed to this bot
;674:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $298
ADDRGP4 $295
JUMPV
LABELV $298
line 684
;675:	//get the match variable
;676:	/*trap_BotMatchVariable(match, KEYAREA, itemname, sizeof(itemname));
;677:	//
;678:	if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
;679:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;680:		//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;681:		return;
;682:	}*/
;683:	//
;684:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 686
;685:	//
;686:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 688
;687:	//the team mate who ordered
;688:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 689
;689:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 690
;690:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 692
;691:	//set the time to send a message to the team mates
;692:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 272
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 694
;693:	//set the ltg type
;694:	bs->ltgtype = LTG_POINTA;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 16
ASGNI4
line 696
;695:	//get the team goal time
;696:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRLP4 276
INDIRF4
ASGNF4
line 698
;697:	//set the team goal time
;698:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + DD_POINTA;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
CNSTF4 0
NEF4 $300
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $300
line 700
;699:	//away from defending
;700:	bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
CNSTF4 0
ASGNF4
line 702
;701:	//
;702:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 704
;703:	// remember last ordered task
;704:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 708
;705:#ifdef DEBUG
;706:	BotPrintTeamGoal(bs);
;707:#endif //DEBUG
;708:}
LABELV $295
endproc BotMatch_TakeA 280 16
export BotMatch_TakeB
proc BotMatch_TakeB 280 16
line 716
;709:
;710:/*
;711:==================
;712:BotMatch_TakeB
;713:For Double Domination
;714:==================
;715:*/
;716:void BotMatch_TakeB(bot_state_t *bs, bot_match_t *match) {
line 721
;717:// 	char itemname[MAX_MESSAGE_SIZE];
;718:	char netname[MAX_MESSAGE_SIZE];
;719:	int client;
;720:
;721:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $303
ADDRGP4 $302
JUMPV
LABELV $303
line 723
;722:	//if not addressed to this bot
;723:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $305
ADDRGP4 $302
JUMPV
LABELV $305
line 733
;724:	//get the match variable
;725:	/*trap_BotMatchVariable(match, KEYAREA, itemname, sizeof(itemname));
;726:	//
;727:	if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
;728:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;729:		//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;730:		//return;
;731:	}*/
;732:	//
;733:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 735
;734:	//
;735:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 737
;736:	//the team mate who ordered
;737:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 738
;738:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 739
;739:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 741
;740:	//set the time to send a message to the team mates
;741:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 272
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 743
;742:	//set the ltg type
;743:	bs->ltgtype = LTG_POINTB;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 17
ASGNI4
line 745
;744:	//get the team goal time
;745:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRLP4 276
INDIRF4
ASGNF4
line 747
;746:	//set the team goal time
;747:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + DD_POINTA;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
CNSTF4 0
NEF4 $307
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $307
line 749
;748:	//away from defending
;749:	bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
CNSTF4 0
ASGNF4
line 751
;750:	//
;751:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 753
;752:	// remember last ordered task
;753:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 757
;754:#ifdef DEBUG
;755:	BotPrintTeamGoal(bs);
;756:#endif //DEBUG
;757:}
LABELV $302
endproc BotMatch_TakeB 280 16
export BotMatch_GetItem
proc BotMatch_GetItem 540 16
line 764
;758:
;759:/*
;760:==================
;761:BotMatch_GetItem
;762:==================
;763:*/
;764:void BotMatch_GetItem(bot_state_t *bs, bot_match_t *match) {
line 769
;765:	char itemname[MAX_MESSAGE_SIZE];
;766:	char netname[MAX_MESSAGE_SIZE];
;767:	int client;
;768:
;769:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $310
ADDRGP4 $309
JUMPV
LABELV $310
line 771
;770:	//if not addressed to this bot
;771:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $312
ADDRGP4 $309
JUMPV
LABELV $312
line 773
;772:	//get the match variable
;773:	trap_BotMatchVariable(match, ITEM, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 775
;774:	//
;775:	if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 524
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRLP4 528
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
NEI4 $314
line 778
;776:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;777:		//trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;778:		return;
ADDRGP4 $309
JUMPV
LABELV $314
line 780
;779:	}
;780:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 781
;781:	client = ClientOnSameTeamFromName(bs, netname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 532
ADDRGP4 ClientOnSameTeamFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 532
INDIRI4
ASGNI4
line 783
;782:	//
;783:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 784
;784:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 785
;785:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 787
;786:	//set the time to send a message to the team mates
;787:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 536
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 536
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 789
;788:	//set the ltg type
;789:	bs->ltgtype = LTG_GETITEM;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 10
ASGNI4
line 791
;790:	//set the team goal time
;791:	bs->teamgoal_time = FloatTime() + TEAM_GETITEM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 793
;792:	//
;793:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 797
;794:#ifdef DEBUG
;795:	BotPrintTeamGoal(bs);
;796:#endif //DEBUG
;797:}
LABELV $309
endproc BotMatch_GetItem 540 16
export BotMatch_Camp
proc BotMatch_Camp 688 16
line 804
;798:
;799:/*
;800:==================
;801:BotMatch_Camp
;802:==================
;803:*/
;804:void BotMatch_Camp(bot_state_t *bs, bot_match_t *match) {
line 810
;805:	int client, areanum;
;806:	char netname[MAX_MESSAGE_SIZE];
;807:	char itemname[MAX_MESSAGE_SIZE];
;808:	aas_entityinfo_t entinfo;
;809:
;810:	if (!TeamPlayIsOn()) return;
ADDRLP4 660
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
NEI4 $317
ADDRGP4 $316
JUMPV
LABELV $317
line 812
;811:	//if not addressed to this bot
;812:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 664
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 0
NEI4 $319
ADDRGP4 $316
JUMPV
LABELV $319
line 814
;813:	//
;814:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 816
;815:	//asked for someone else
;816:	client = FindClientByName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 668
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 668
INDIRI4
ASGNI4
line 818
;817:	//if there's no valid client with this name
;818:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $321
line 819
;819:		BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 820
;820:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 821
;821:		return;
ADDRGP4 $316
JUMPV
LABELV $321
line 824
;822:	}
;823:	//get the match variable
;824:	trap_BotMatchVariable(match, KEYAREA, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 826
;825:	//in CTF it could be the base
;826:	if (match->subtype & ST_THERE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $323
line 828
;827:		//camp at the spot the bot is currently standing
;828:		bs->teamgoal.entitynum = bs->entitynum;
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 10768
ADDP4
ADDRLP4 672
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 829
;829:		bs->teamgoal.areanum = bs->areanum;
ADDRLP4 676
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 676
INDIRP4
CNSTI4 10740
ADDP4
ADDRLP4 676
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ASGNI4
line 830
;830:		VectorCopy(bs->origin, bs->teamgoal.origin);
ADDRLP4 680
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 680
INDIRP4
CNSTI4 10728
ADDP4
ADDRLP4 680
INDIRP4
CNSTI4 5940
ADDP4
INDIRB
ASGNB 12
line 831
;831:		VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 10744
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10748
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10752
ADDP4
CNSTF4 3238002688
ASGNF4
line 832
;832:		VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 10756
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10760
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10764
ADDP4
CNSTF4 1090519040
ASGNF4
line 833
;833:	}
ADDRGP4 $324
JUMPV
LABELV $323
line 834
;834:	else if (match->subtype & ST_HERE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $325
line 836
;835:		//if this is the bot self
;836:		if (client == bs->client) return;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $327
ADDRGP4 $316
JUMPV
LABELV $327
line 838
;837:		//
;838:		bs->teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
CNSTI4 -1
ASGNI4
line 839
;839:		BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 516
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 841
;840:		//if info is valid (in PVS)
;841:		if (entinfo.valid) {
ADDRLP4 516
INDIRI4
CNSTI4 0
EQI4 $329
line 842
;842:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 516+24
ARGP4
ADDRLP4 672
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 656
ADDRLP4 672
INDIRI4
ASGNI4
line 843
;843:			if (areanum) {// && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $332
line 846
;844:				//NOTE: just assume the bot knows where the person is
;845:				//if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, client)) {
;846:					bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 847
;847:					bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10740
ADDP4
ADDRLP4 656
INDIRI4
ASGNI4
line 848
;848:					VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ADDRLP4 516+24
INDIRB
ASGNB 12
line 849
;849:					VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 10744
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10748
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10752
ADDP4
CNSTF4 3238002688
ASGNF4
line 850
;850:					VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 10756
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10760
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10764
ADDP4
CNSTF4 1090519040
ASGNF4
line 852
;851:				//}
;852:			}
LABELV $332
line 853
;853:		}
LABELV $329
line 855
;854:		//if the other is not visible
;855:		if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
CNSTI4 0
GEI4 $326
line 856
;856:			BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 857
;857:			client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 672
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 858
;858:			trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 859
;859:			return;
ADDRGP4 $316
JUMPV
line 861
;860:		}
;861:	}
LABELV $325
line 862
;862:	else if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 672
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRLP4 676
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 676
INDIRI4
CNSTI4 0
NEI4 $337
line 866
;863:		//BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;864:		//client = ClientFromName(netname);
;865:		//trap_BotEnterChat(bs->cs, client, CHAT_TELL);
;866:		return;
ADDRGP4 $316
JUMPV
LABELV $337
LABELV $326
LABELV $324
line 869
;867:	}
;868:	//
;869:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 870
;870:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 871
;871:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 873
;872:	//set the time to send a message to the team mates
;873:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 680
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 680
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 875
;874:	//set the ltg type
;875:	bs->ltgtype = LTG_CAMPORDER;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 8
ASGNI4
line 877
;876:	//get the team goal time
;877:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 684
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRLP4 684
INDIRF4
ASGNF4
line 879
;878:	//set the team goal time
;879:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_CAMP_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
CNSTF4 0
NEF4 $339
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $339
line 881
;880:	//not arrived yet
;881:	bs->arrive_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
CNSTF4 0
ASGNF4
line 883
;882:	//
;883:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 885
;884:	// remember last ordered task
;885:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 889
;886:#ifdef DEBUG
;887:	BotPrintTeamGoal(bs);
;888:#endif //DEBUG
;889:}
LABELV $316
endproc BotMatch_Camp 688 16
export BotMatch_Patrol
proc BotMatch_Patrol 284 16
line 896
;890:
;891:/*
;892:==================
;893:BotMatch_Patrol
;894:==================
;895:*/
;896:void BotMatch_Patrol(bot_state_t *bs, bot_match_t *match) {
line 900
;897:	char netname[MAX_MESSAGE_SIZE];
;898:	int client;
;899:
;900:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $342
ADDRGP4 $341
JUMPV
LABELV $342
line 902
;901:	//if not addressed to this bot
;902:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $344
ADDRGP4 $341
JUMPV
LABELV $344
line 904
;903:	//get the patrol waypoints
;904:	if (!BotGetPatrolWaypoints(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotGetPatrolWaypoints
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $346
ADDRGP4 $341
JUMPV
LABELV $346
line 906
;905:	//
;906:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 908
;907:	//
;908:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 272
INDIRI4
ASGNI4
line 910
;909:	//
;910:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 911
;911:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 912
;912:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 914
;913:	//set the time to send a message to the team mates
;914:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 276
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 276
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 916
;915:	//set the ltg type
;916:	bs->ltgtype = LTG_PATROL;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 9
ASGNI4
line 918
;917:	//get the team goal time
;918:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRLP4 280
INDIRF4
ASGNF4
line 920
;919:	//set the team goal time if not set already
;920:	if (!bs->teamgoal_time) bs->teamgoal_time = FloatTime() + TEAM_PATROL_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
CNSTF4 0
NEF4 $348
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $348
line 922
;921:	//
;922:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 924
;923:	// remember last ordered task
;924:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 928
;925:#ifdef DEBUG
;926:	BotPrintTeamGoal(bs);
;927:#endif //DEBUG
;928:}
LABELV $341
endproc BotMatch_Patrol 284 16
export BotMatch_GetFlag
proc BotMatch_GetFlag 284 16
line 935
;929:
;930:/*
;931:==================
;932:BotMatch_GetFlag
;933:==================
;934:*/
;935:void BotMatch_GetFlag(bot_state_t *bs, bot_match_t *match) {
line 939
;936:	char netname[MAX_MESSAGE_SIZE];
;937:	int client;
;938:
;939:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 260
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 5
EQI4 $353
ADDRLP4 260
INDIRI4
CNSTI4 10
NEI4 $351
LABELV $353
line 940
;940:		if (!ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRLP4 264
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $358
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 264
INDIRI4
NEI4 $352
LABELV $358
line 941
;941:			return;
ADDRGP4 $350
JUMPV
line 942
;942:	}
LABELV $351
line 943
;943:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $350
line 944
;944:		if (!ctf_neutralflag.areanum || !ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRLP4 264
CNSTI4 0
ASGNI4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $367
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $367
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 264
INDIRI4
NEI4 $360
LABELV $367
line 945
;945:			return;
ADDRGP4 $350
JUMPV
line 946
;946:	}
line 947
;947:	else {
line 948
;948:		return;
LABELV $360
LABELV $352
line 951
;949:	}
;950:	//if not addressed to this bot
;951:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $368
ADDRGP4 $350
JUMPV
LABELV $368
line 953
;952:	//
;953:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 955
;954:	//
;955:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 957
;956:	//
;957:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 958
;958:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 959
;959:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 961
;960:	//set the time to send a message to the team mates
;961:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 272
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 963
;962:	//set the ltg type
;963:	bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 4
ASGNI4
line 965
;964:	//set the team goal time
;965:	bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 967
;966:	// get an alternate route in ctf
;967:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 276
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 5
EQI4 $372
ADDRLP4 276
INDIRI4
CNSTI4 10
NEI4 $370
LABELV $372
line 969
;968:		//get an alternative route goal towards the enemy base
;969:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 970
;970:	}
LABELV $370
line 972
;971:	//
;972:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 974
;973:	// remember last ordered task
;974:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 978
;975:#ifdef DEBUG
;976:	BotPrintTeamGoal(bs);
;977:#endif //DEBUG
;978:}
LABELV $350
endproc BotMatch_GetFlag 284 16
export BotMatch_AttackEnemyBase
proc BotMatch_AttackEnemyBase 280 16
line 985
;979:
;980:/*
;981:==================
;982:BotMatch_AttackEnemyBase
;983:==================
;984:*/
;985:void BotMatch_AttackEnemyBase(bot_state_t *bs, bot_match_t *match) {
line 989
;986:	char netname[MAX_MESSAGE_SIZE];
;987:	int client;
;988:
;989:	if (gametype == GT_CTF|| gametype == GT_CTF_ELIMINATION) {
ADDRLP4 260
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 5
EQI4 $376
ADDRLP4 260
INDIRI4
CNSTI4 10
NEI4 $374
LABELV $376
line 990
;990:		BotMatch_GetFlag(bs, match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotMatch_GetFlag
CALLV
pop
line 991
;991:	}
ADDRGP4 $375
JUMPV
LABELV $374
line 992
;992:	else if (gametype == GT_1FCTF || gametype == GT_OBELISK || gametype == GT_HARVESTER) {
ADDRLP4 264
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 6
EQI4 $380
ADDRLP4 264
INDIRI4
CNSTI4 7
EQI4 $380
ADDRLP4 264
INDIRI4
CNSTI4 8
NEI4 $373
LABELV $380
line 993
;993:		if (!redobelisk.areanum || !blueobelisk.areanum)
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $385
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 268
INDIRI4
NEI4 $378
LABELV $385
line 994
;994:			return;
ADDRGP4 $373
JUMPV
line 995
;995:	}
line 996
;996:	else {
line 997
;997:		return;
LABELV $378
LABELV $375
line 1000
;998:	}
;999:	//if not addressed to this bot
;1000:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $386
ADDRGP4 $373
JUMPV
LABELV $386
line 1002
;1001:	//
;1002:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1004
;1003:	//
;1004:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 272
INDIRI4
ASGNI4
line 1006
;1005:	//
;1006:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1007
;1007:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 1008
;1008:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1010
;1009:	//set the time to send a message to the team mates
;1010:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 276
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 276
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1012
;1011:	//set the ltg type
;1012:	bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 13
ASGNI4
line 1014
;1013:	//set the team goal time
;1014:	bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1015
;1015:	bs->attackaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10260
ADDP4
CNSTF4 0
ASGNF4
line 1017
;1016:	//
;1017:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1019
;1018:	// remember last ordered task
;1019:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 1023
;1020:#ifdef DEBUG
;1021:	BotPrintTeamGoal(bs);
;1022:#endif //DEBUG
;1023:}
LABELV $373
endproc BotMatch_AttackEnemyBase 280 16
export BotMatch_Harvest
proc BotMatch_Harvest 272 16
line 1030
;1024:
;1025:/*
;1026:==================
;1027:BotMatch_Harvest
;1028:==================
;1029:*/
;1030:void BotMatch_Harvest(bot_state_t *bs, bot_match_t *match) {
line 1034
;1031:	char netname[MAX_MESSAGE_SIZE];
;1032:	int client;
;1033:
;1034:	if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $388
line 1035
;1035:		if (!neutralobelisk.areanum || !redobelisk.areanum || !blueobelisk.areanum)
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 neutralobelisk+12
INDIRI4
ADDRLP4 260
INDIRI4
EQI4 $397
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 260
INDIRI4
EQI4 $397
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $390
LABELV $397
line 1036
;1036:			return;
ADDRGP4 $388
JUMPV
line 1037
;1037:	}
line 1038
;1038:	else {
line 1039
;1039:		return;
LABELV $390
line 1042
;1040:	}
;1041:	//if not addressed to this bot
;1042:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $398
ADDRGP4 $388
JUMPV
LABELV $398
line 1044
;1043:	//
;1044:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1046
;1045:	//
;1046:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 1048
;1047:	//
;1048:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1049
;1049:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 1050
;1050:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1052
;1051:	//set the time to send a message to the team mates
;1052:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 268
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 268
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1054
;1053:	//set the ltg type
;1054:	bs->ltgtype = LTG_HARVEST;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 12
ASGNI4
line 1056
;1055:	//set the team goal time
;1056:	bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1057
;1057:	bs->harvestaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10264
ADDP4
CNSTF4 0
ASGNF4
line 1059
;1058:	//
;1059:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1061
;1060:	// remember last ordered task
;1061:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 1065
;1062:#ifdef DEBUG
;1063:	BotPrintTeamGoal(bs);
;1064:#endif //DEBUG
;1065:}
LABELV $388
endproc BotMatch_Harvest 272 16
export BotMatch_RushBase
proc BotMatch_RushBase 280 16
line 1072
;1066:
;1067:/*
;1068:==================
;1069:BotMatch_RushBase
;1070:==================
;1071:*/
;1072:void BotMatch_RushBase(bot_state_t *bs, bot_match_t *match) {
line 1076
;1073:	char netname[MAX_MESSAGE_SIZE];
;1074:	int client;
;1075:
;1076:	if (gametype == GT_CTF|| gametype == GT_CTF_ELIMINATION) {
ADDRLP4 260
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 5
EQI4 $403
ADDRLP4 260
INDIRI4
CNSTI4 10
NEI4 $401
LABELV $403
line 1077
;1077:		if (!ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRLP4 264
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $408
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 264
INDIRI4
NEI4 $402
LABELV $408
line 1078
;1078:			return;
ADDRGP4 $400
JUMPV
line 1079
;1079:	}
LABELV $401
line 1080
;1080:	else if (gametype == GT_1FCTF || gametype == GT_HARVESTER) {
ADDRLP4 264
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 6
EQI4 $411
ADDRLP4 264
INDIRI4
CNSTI4 8
NEI4 $400
LABELV $411
line 1081
;1081:		if (!redobelisk.areanum || !blueobelisk.areanum)
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $416
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 268
INDIRI4
NEI4 $410
LABELV $416
line 1082
;1082:			return;
ADDRGP4 $400
JUMPV
line 1083
;1083:	}
line 1084
;1084:	else {
line 1085
;1085:		return;
LABELV $410
LABELV $402
line 1088
;1086:	}
;1087:	//if not addressed to this bot
;1088:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $417
ADDRGP4 $400
JUMPV
LABELV $417
line 1090
;1089:	//
;1090:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1092
;1091:	//
;1092:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 272
INDIRI4
ASGNI4
line 1094
;1093:	//
;1094:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1095
;1095:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 1096
;1096:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1098
;1097:	//set the time to send a message to the team mates
;1098:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 276
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 276
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1100
;1099:	//set the ltg type
;1100:	bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 5
ASGNI4
line 1102
;1101:	//set the team goal time
;1102:	bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1103
;1103:	bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
CNSTF4 0
ASGNF4
line 1105
;1104:	//
;1105:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1109
;1106:#ifdef DEBUG
;1107:	BotPrintTeamGoal(bs);
;1108:#endif //DEBUG
;1109:}
LABELV $400
endproc BotMatch_RushBase 280 16
export BotMatch_TaskPreference
proc BotMatch_TaskPreference 320 16
line 1116
;1110:
;1111:/*
;1112:==================
;1113:BotMatch_TaskPreference
;1114:==================
;1115:*/
;1116:void BotMatch_TaskPreference(bot_state_t *bs, bot_match_t *match) {
line 1121
;1117:	char netname[MAX_NETNAME];
;1118:	char teammatename[MAX_MESSAGE_SIZE];
;1119:	int teammate, preference;
;1120:
;1121:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1122
;1122:	if (Q_stricmp(netname, bs->teamleader) != 0) return;
ADDRLP4 260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 300
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $420
ADDRGP4 $419
JUMPV
LABELV $420
line 1124
;1123:
;1124:	trap_BotMatchVariable(match, NETNAME, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1125
;1125:	teammate = ClientFromName(teammatename);
ADDRLP4 4
ARGP4
ADDRLP4 304
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 304
INDIRI4
ASGNI4
line 1126
;1126:	if (teammate < 0) return;
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $422
ADDRGP4 $419
JUMPV
LABELV $422
line 1128
;1127:
;1128:	preference = BotGetTeamMateTaskPreference(bs, teammate);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 308
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 1129
;1129:	switch(match->subtype)
ADDRLP4 312
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $427
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $428
ADDRLP4 312
INDIRI4
CNSTI4 4
EQI4 $429
ADDRGP4 $424
JUMPV
line 1130
;1130:	{
LABELV $427
line 1132
;1131:		case ST_DEFENDER:
;1132:		{
line 1133
;1133:			preference &= ~TEAMTP_ATTACKER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1134
;1134:			preference |= TEAMTP_DEFENDER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1135
;1135:			break;
ADDRGP4 $425
JUMPV
LABELV $428
line 1138
;1136:		}
;1137:		case ST_ATTACKER:
;1138:		{
line 1139
;1139:			preference &= ~TEAMTP_DEFENDER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1140
;1140:			preference |= TEAMTP_ATTACKER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1141
;1141:			break;
ADDRGP4 $425
JUMPV
LABELV $429
line 1144
;1142:		}
;1143:		case ST_ROAMER:
;1144:		{
line 1145
;1145:			preference &= ~(TEAMTP_ATTACKER|TEAMTP_DEFENDER);
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -4
BANDI4
ASGNI4
line 1146
;1146:			break;
LABELV $424
LABELV $425
line 1149
;1147:		}
;1148:	}
;1149:	BotSetTeamMateTaskPreference(bs, teammate, preference);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSetTeamMateTaskPreference
CALLV
pop
line 1151
;1150:	//
;1151:	EasyClientName(teammate, teammatename, sizeof(teammatename));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1152
;1152:	BotAI_BotInitialChat(bs, "keepinmind", teammatename, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $430
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1153
;1153:	trap_BotEnterChat(bs->cs, teammate, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1154
;1154:	BotVoiceChatOnly(bs, teammate, VOICECHAT_YES);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $431
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 1155
;1155:	trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 1156
;1156:}
LABELV $419
endproc BotMatch_TaskPreference 320 16
export BotMatch_ReturnFlag
proc BotMatch_ReturnFlag 276 16
line 1163
;1157:
;1158:/*
;1159:==================
;1160:BotMatch_ReturnFlag
;1161:==================
;1162:*/
;1163:void BotMatch_ReturnFlag(bot_state_t *bs, bot_match_t *match) {
line 1168
;1164:	char netname[MAX_MESSAGE_SIZE];
;1165:	int client;
;1166:
;1167:	//if not in CTF mode
;1168:	if (gametype != GT_CTF && gametype != GT_CTF_ELIMINATION && gametype != GT_1FCTF)
ADDRLP4 260
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 5
EQI4 $433
ADDRLP4 260
INDIRI4
CNSTI4 10
EQI4 $433
ADDRLP4 260
INDIRI4
CNSTI4 6
EQI4 $433
line 1169
;1169:		return;
ADDRGP4 $432
JUMPV
LABELV $433
line 1171
;1170:	//if not addressed to this bot
;1171:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $435
line 1172
;1172:		return;
ADDRGP4 $432
JUMPV
LABELV $435
line 1174
;1173:	//
;1174:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1176
;1175:	//
;1176:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 1178
;1177:	//
;1178:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1179
;1179:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 1180
;1180:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1182
;1181:	//set the time to send a message to the team mates
;1182:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 272
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 272
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1184
;1183:	//set the ltg type
;1184:	bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 6
ASGNI4
line 1186
;1185:	//set the team goal time
;1186:	bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 1187
;1187:	bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
CNSTF4 0
ASGNF4
line 1189
;1188:	//
;1189:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1193
;1190:#ifdef DEBUG
;1191:	BotPrintTeamGoal(bs);
;1192:#endif //DEBUG
;1193:}
LABELV $432
endproc BotMatch_ReturnFlag 276 16
export BotMatch_JoinSubteam
proc BotMatch_JoinSubteam 528 16
line 1200
;1194:
;1195:/*
;1196:==================
;1197:BotMatch_JoinSubteam
;1198:==================
;1199:*/
;1200:void BotMatch_JoinSubteam(bot_state_t *bs, bot_match_t *match) {
line 1205
;1201:	char teammate[MAX_MESSAGE_SIZE];
;1202:	char netname[MAX_MESSAGE_SIZE];
;1203:	int client;
;1204:
;1205:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $438
ADDRGP4 $437
JUMPV
LABELV $438
line 1207
;1206:	//if not addressed to this bot
;1207:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $440
ADDRGP4 $437
JUMPV
LABELV $440
line 1209
;1208:	//get the sub team name
;1209:	trap_BotMatchVariable(match, TEAMNAME, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1211
;1210:	//set the sub team name
;1211:	strncpy(bs->subteam, teammate, 32);
ADDRFP4 0
INDIRP4
CNSTI4 11084
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1212
;1212:	bs->subteam[31] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 11115
ADDP4
CNSTI1 0
ASGNI1
line 1214
;1213:	//
;1214:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1215
;1215:	BotAI_BotInitialChat(bs, "joinedteam", teammate, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1216
;1216:	client = ClientFromName(netname);
ADDRLP4 256
ARGP4
ADDRLP4 524
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 524
INDIRI4
ASGNI4
line 1217
;1217:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1218
;1218:}
LABELV $437
endproc BotMatch_JoinSubteam 528 16
export BotMatch_LeaveSubteam
proc BotMatch_LeaveSubteam 280 16
line 1225
;1219:
;1220:/*
;1221:==================
;1222:BotMatch_LeaveSubteam
;1223:==================
;1224:*/
;1225:void BotMatch_LeaveSubteam(bot_state_t *bs, bot_match_t *match) {
line 1229
;1226:	char netname[MAX_MESSAGE_SIZE];
;1227:	int client;
;1228:
;1229:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $444
ADDRGP4 $443
JUMPV
LABELV $444
line 1231
;1230:	//if not addressed to this bot
;1231:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $446
ADDRGP4 $443
JUMPV
LABELV $446
line 1233
;1232:	//
;1233:	if (strlen(bs->subteam))
ADDRFP4 0
INDIRP4
CNSTI4 11084
ADDP4
ARGP4
ADDRLP4 268
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $448
line 1234
;1234:	{
line 1235
;1235:		BotAI_BotInitialChat(bs, "leftteam", bs->subteam, NULL);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRGP4 $450
ARGP4
ADDRLP4 272
INDIRP4
CNSTI4 11084
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1236
;1236:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1237
;1237:		client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 276
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 276
INDIRI4
ASGNI4
line 1238
;1238:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1239
;1239:	} //end if
LABELV $448
line 1240
;1240:	strcpy(bs->subteam, "");
ADDRFP4 0
INDIRP4
CNSTI4 11084
ADDP4
ARGP4
ADDRGP4 $451
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1241
;1241:}
LABELV $443
endproc BotMatch_LeaveSubteam 280 16
export BotMatch_WhichTeam
proc BotMatch_WhichTeam 16 16
line 1248
;1242:
;1243:/*
;1244:==================
;1245:BotMatch_LeaveSubteam
;1246:==================
;1247:*/
;1248:void BotMatch_WhichTeam(bot_state_t *bs, bot_match_t *match) {
line 1249
;1249:	if (!TeamPlayIsOn()) return;
ADDRLP4 0
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $453
ADDRGP4 $452
JUMPV
LABELV $453
line 1251
;1250:	//if not addressed to this bot
;1251:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $455
ADDRGP4 $452
JUMPV
LABELV $455
line 1254
;1252:
;1253:	//
;1254:	if (strlen(bs->subteam)) {
ADDRFP4 0
INDIRP4
CNSTI4 11084
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $457
line 1255
;1255:		BotAI_BotInitialChat(bs, "inteam", bs->subteam, NULL);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $459
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 11084
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1256
;1256:	}
ADDRGP4 $458
JUMPV
LABELV $457
line 1257
;1257:	else {
line 1258
;1258:		BotAI_BotInitialChat(bs, "noteam", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $460
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1259
;1259:	}
LABELV $458
line 1260
;1260:	trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1261
;1261:}
LABELV $452
endproc BotMatch_WhichTeam 16 16
export BotMatch_CheckPoint
proc BotMatch_CheckPoint 572 24
line 1268
;1262:
;1263:/*
;1264:==================
;1265:BotMatch_CheckPoint
;1266:==================
;1267:*/
;1268:void BotMatch_CheckPoint(bot_state_t *bs, bot_match_t *match) {
line 1275
;1269:	int areanum, client;
;1270:	char buf[MAX_MESSAGE_SIZE];
;1271:	char netname[MAX_MESSAGE_SIZE];
;1272:	vec3_t position;
;1273:	bot_waypoint_t *cp;
;1274:
;1275:	if (!TeamPlayIsOn()) return;
ADDRLP4 536
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 536
INDIRI4
CNSTI4 0
NEI4 $462
ADDRGP4 $461
JUMPV
LABELV $462
line 1277
;1276:	//
;1277:	trap_BotMatchVariable(match, POSITION, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1278
;1278:	VectorClear(position);
ADDRLP4 540
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 540
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 540
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 540
INDIRF4
ASGNF4
line 1280
;1279:	//
;1280:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 276
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1281
;1281:	client = ClientFromName(netname);
ADDRLP4 276
ARGP4
ADDRLP4 544
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 532
ADDRLP4 544
INDIRI4
ASGNI4
line 1283
;1282:	//BotGPSToPosition(buf, position);
;1283:	sscanf(buf, "%f %f %f", &position[0], &position[1], &position[2]);
ADDRLP4 16
ARGP4
ADDRGP4 $466
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4+4
ARGP4
ADDRLP4 4+8
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 1284
;1284:	position[2] += 0.5;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1285
;1285:	areanum = BotPointAreaNum(position);
ADDRLP4 4
ARGP4
ADDRLP4 548
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 272
ADDRLP4 548
INDIRI4
ASGNI4
line 1286
;1286:	if (!areanum) {
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $470
line 1287
;1287:		if (BotAddressedToBot(bs, match)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $461
line 1288
;1288:			BotAI_BotInitialChat(bs, "checkpoint_invalid", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $474
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1289
;1289:			trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 532
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1290
;1290:		}
line 1291
;1291:		return;
ADDRGP4 $461
JUMPV
LABELV $470
line 1294
;1292:	}
;1293:	//
;1294:	trap_BotMatchVariable(match, NAME, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1296
;1295:	//check if there already exists a checkpoint with this name
;1296:	cp = BotFindWayPoint(bs->checkpoints, buf);
ADDRFP4 0
INDIRP4
CNSTI4 13176
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 552
ADDRGP4 BotFindWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 552
INDIRP4
ASGNP4
line 1297
;1297:	if (cp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $475
line 1298
;1298:		if (cp->next) cp->next->prev = cp->prev;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $477
ADDRLP4 560
CNSTI4 104
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ADDRLP4 560
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 560
INDIRI4
ADDP4
INDIRP4
ASGNP4
LABELV $477
line 1299
;1299:		if (cp->prev) cp->prev->next = cp->next;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $479
ADDRLP4 568
CNSTI4 100
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ADDRLP4 568
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 568
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $480
JUMPV
LABELV $479
line 1300
;1300:		else bs->checkpoints = cp->next;
ADDRFP4 0
INDIRP4
CNSTI4 13176
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $480
line 1301
;1301:		cp->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1302
;1302:	}
LABELV $475
line 1304
;1303:	//create a new check point
;1304:	cp = BotCreateWayPoint(buf, position, 0, areanum);
ADDRLP4 16
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 556
ADDRGP4 BotCreateWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 556
INDIRP4
ASGNP4
line 1306
;1305:	//add the check point to the bot's known chech points
;1306:	cp->next = bs->checkpoints;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 13176
ADDP4
INDIRP4
ASGNP4
line 1307
;1307:	if (bs->checkpoints) bs->checkpoints->prev = cp;
ADDRFP4 0
INDIRP4
CNSTI4 13176
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $481
ADDRFP4 0
INDIRP4
CNSTI4 13176
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $481
line 1308
;1308:	bs->checkpoints = cp;
ADDRFP4 0
INDIRP4
CNSTI4 13176
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1310
;1309:	//
;1310:	if (BotAddressedToBot(bs, match)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 560
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 560
INDIRI4
CNSTI4 0
EQI4 $483
line 1311
;1311:		Com_sprintf(buf, sizeof(buf), "%1.0f %1.0f %1.0f", cp->goal.origin[0],
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $485
ARGP4
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
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 1315
;1312:													cp->goal.origin[1],
;1313:													cp->goal.origin[2]);
;1314:
;1315:		BotAI_BotInitialChat(bs, "checkpoint_confirm", cp->name, buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $486
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1316
;1316:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 532
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1317
;1317:	}
LABELV $483
line 1318
;1318:}
LABELV $461
endproc BotMatch_CheckPoint 572 24
export BotMatch_FormationSpace
proc BotMatch_FormationSpace 280 16
line 1325
;1319:
;1320:/*
;1321:==================
;1322:BotMatch_FormationSpace
;1323:==================
;1324:*/
;1325:void BotMatch_FormationSpace(bot_state_t *bs, bot_match_t *match) {
line 1329
;1326:	char buf[MAX_MESSAGE_SIZE];
;1327:	float space;
;1328:
;1329:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $488
ADDRGP4 $487
JUMPV
LABELV $488
line 1331
;1330:	//if not addressed to this bot
;1331:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $490
ADDRGP4 $487
JUMPV
LABELV $490
line 1333
;1332:	//
;1333:	trap_BotMatchVariable(match, NUMBER, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1335
;1334:	//if it's the distance in feet
;1335:	if (match->subtype & ST_FEET) space = 0.3048 * 32 * atof(buf);
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $492
ADDRLP4 4
ARGP4
ADDRLP4 268
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1092357823
ADDRLP4 268
INDIRF4
MULF4
ASGNF4
ADDRGP4 $493
JUMPV
LABELV $492
line 1337
;1336:	//else it's in meters
;1337:	else space = 32 * atof(buf);
ADDRLP4 4
ARGP4
ADDRLP4 272
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1107296256
ADDRLP4 272
INDIRF4
MULF4
ASGNF4
LABELV $493
line 1339
;1338:	//check if the formation intervening space is valid
;1339:	if (space < 48 || space > 500) space = 100;
ADDRLP4 0
INDIRF4
CNSTF4 1111490560
LTF4 $496
ADDRLP4 0
INDIRF4
CNSTF4 1140457472
LEF4 $494
LABELV $496
ADDRLP4 0
CNSTF4 1120403456
ASGNF4
LABELV $494
line 1340
;1340:	bs->formation_dist = space;
ADDRFP4 0
INDIRP4
CNSTI4 11116
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1341
;1341:}
LABELV $487
endproc BotMatch_FormationSpace 280 16
export BotMatch_Dismiss
proc BotMatch_Dismiss 272 16
line 1348
;1342:
;1343:/*
;1344:==================
;1345:BotMatch_Dismiss
;1346:==================
;1347:*/
;1348:void BotMatch_Dismiss(bot_state_t *bs, bot_match_t *match) {
line 1352
;1349:	char netname[MAX_MESSAGE_SIZE];
;1350:	int client;
;1351:
;1352:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $498
ADDRGP4 $497
JUMPV
LABELV $498
line 1354
;1353:	//if not addressed to this bot
;1354:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $500
ADDRGP4 $497
JUMPV
LABELV $500
line 1355
;1355:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1356
;1356:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 1358
;1357:	//
;1358:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1360
;1359:	//
;1360:	bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1361
;1361:	bs->lead_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10988
ADDP4
CNSTF4 0
ASGNF4
line 1362
;1362:	bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
CNSTI4 0
ASGNI4
line 1364
;1363:	//
;1364:	BotAI_BotInitialChat(bs, "dismissed", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $502
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1365
;1365:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1366
;1366:}
LABELV $497
endproc BotMatch_Dismiss 272 16
export BotMatch_Suicide
proc BotMatch_Suicide 272 16
line 1373
;1367:
;1368:/*
;1369:==================
;1370:BotMatch_Suicide
;1371:==================
;1372:*/
;1373:void BotMatch_Suicide(bot_state_t *bs, bot_match_t *match) {
line 1377
;1374:	char netname[MAX_MESSAGE_SIZE];
;1375:	int client;
;1376:
;1377:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $504
ADDRGP4 $503
JUMPV
LABELV $504
line 1379
;1378:	//if not addressed to this bot
;1379:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $506
ADDRGP4 $503
JUMPV
LABELV $506
line 1381
;1380:	//
;1381:	trap_EA_Command(bs->client, "kill");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $508
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 1383
;1382:	//
;1383:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1384
;1384:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 1386
;1385:	//
;1386:	BotVoiceChat(bs, client, VOICECHAT_TAUNT);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
ARGI4
ADDRGP4 $509
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1387
;1387:	trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 1388
;1388:}
LABELV $503
endproc BotMatch_Suicide 272 16
export BotMatch_StartTeamLeaderShip
proc BotMatch_StartTeamLeaderShip 268 16
line 1395
;1389:
;1390:/*
;1391:==================
;1392:BotMatch_StartTeamLeaderShip
;1393:==================
;1394:*/
;1395:void BotMatch_StartTeamLeaderShip(bot_state_t *bs, bot_match_t *match) {
line 1399
;1396:	int client;
;1397:	char teammate[MAX_MESSAGE_SIZE];
;1398:
;1399:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $511
ADDRGP4 $510
JUMPV
LABELV $511
line 1401
;1400:	//if chats for him or herself
;1401:	if (match->subtype & ST_I) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $513
line 1403
;1402:		//get the team mate that will be the team leader
;1403:		trap_BotMatchVariable(match, NETNAME, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1404
;1404:		strncpy(bs->teamleader, teammate, sizeof(bs->teamleader));
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
line 1405
;1405:		bs->teamleader[sizeof(bs->teamleader)-1] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 11004
CNSTU4 31
ADDI4
ADDP4
CNSTI1 0
ASGNI1
line 1406
;1406:	}
ADDRGP4 $514
JUMPV
LABELV $513
line 1408
;1407:	//chats for someone else
;1408:	else {
line 1410
;1409:		//get the team mate that will be the team leader
;1410:		trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1411
;1411:		client = FindClientByName(teammate);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 1412
;1412:		if (client >= 0) ClientName(client, bs->teamleader, sizeof(bs->teamleader));
ADDRLP4 256
INDIRI4
CNSTI4 0
LTI4 $515
ADDRLP4 256
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
LABELV $515
line 1413
;1413:	}
LABELV $514
line 1414
;1414:}
LABELV $510
endproc BotMatch_StartTeamLeaderShip 268 16
export BotMatch_StopTeamLeaderShip
proc BotMatch_StopTeamLeaderShip 528 16
line 1421
;1415:
;1416:/*
;1417:==================
;1418:BotMatch_StopTeamLeaderShip
;1419:==================
;1420:*/
;1421:void BotMatch_StopTeamLeaderShip(bot_state_t *bs, bot_match_t *match) {
line 1426
;1422:	int client;
;1423:	char teammate[MAX_MESSAGE_SIZE];
;1424:	char netname[MAX_MESSAGE_SIZE];
;1425:
;1426:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $518
ADDRGP4 $517
JUMPV
LABELV $518
line 1428
;1427:	//get the team mate that stops being the team leader
;1428:	trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1430
;1429:	//if chats for him or herself
;1430:	if (match->subtype & ST_I) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $520
line 1431
;1431:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1432
;1432:		client = FindClientByName(netname);
ADDRLP4 260
ARGP4
ADDRLP4 520
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
line 1433
;1433:	}
ADDRGP4 $521
JUMPV
LABELV $520
line 1435
;1434:	//chats for someone else
;1435:	else {
line 1436
;1436:		client = FindClientByName(teammate);
ADDRLP4 4
ARGP4
ADDRLP4 520
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
line 1437
;1437:	} //end else
LABELV $521
line 1438
;1438:	if (client >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $522
line 1439
;1439:		if (!Q_stricmp(bs->teamleader, ClientName(client, netname, sizeof(netname)))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 520
ADDRGP4 ClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 520
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
NEI4 $524
line 1440
;1440:			bs->teamleader[0] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
CNSTI1 0
ASGNI1
line 1441
;1441:			notleader[client] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
CNSTI4 1
ASGNI4
line 1442
;1442:		}
LABELV $524
line 1443
;1443:	}
LABELV $522
line 1444
;1444:}
LABELV $517
endproc BotMatch_StopTeamLeaderShip 528 16
export BotMatch_WhoIsTeamLeader
proc BotMatch_WhoIsTeamLeader 264 12
line 1451
;1445:
;1446:/*
;1447:==================
;1448:BotMatch_WhoIsTeamLeader
;1449:==================
;1450:*/
;1451:void BotMatch_WhoIsTeamLeader(bot_state_t *bs, bot_match_t *match) {
line 1454
;1452:	char netname[MAX_MESSAGE_SIZE];
;1453:
;1454:	if (!TeamPlayIsOn()) return;
ADDRLP4 256
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $527
ADDRGP4 $526
JUMPV
LABELV $527
line 1456
;1455:
;1456:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1458
;1457:	//if this bot IS the team leader
;1458:	if (!Q_stricmp(netname, bs->teamleader)) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $529
line 1459
;1459:		trap_EA_SayTeam(bs->client, "I'm the team leader\n");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $531
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 1460
;1460:	}
LABELV $529
line 1461
;1461:}
LABELV $526
endproc BotMatch_WhoIsTeamLeader 264 12
export BotMatch_WhatAreYouDoing
proc BotMatch_WhatAreYouDoing 532 16
line 1468
;1462:
;1463:/*
;1464:==================
;1465:BotMatch_WhatAreYouDoing
;1466:==================
;1467:*/
;1468:void BotMatch_WhatAreYouDoing(bot_state_t *bs, bot_match_t *match) {
line 1474
;1469:	char netname[MAX_MESSAGE_SIZE];
;1470:	char goalname[MAX_MESSAGE_SIZE];
;1471:	int client;
;1472:
;1473:	//if not addressed to this bot
;1474:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 516
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $533
ADDRGP4 $532
JUMPV
LABELV $533
line 1476
;1475:	//
;1476:	switch(bs->ltgtype) {
ADDRLP4 520
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 1
LTI4 $535
ADDRLP4 520
INDIRI4
CNSTI4 17
GTI4 $535
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $567-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $567
address $538
address $540
address $542
address $552
address $554
address $556
address $548
address $548
address $550
address $544
address $546
address $560
address $558
address $535
address $535
address $562
address $564
code
LABELV $538
line 1478
;1477:		case LTG_TEAMHELP:
;1478:		{
line 1479
;1479:			EasyClientName(bs->teammate, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1480
;1480:			BotAI_BotInitialChat(bs, "helping", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $539
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1481
;1481:			break;
ADDRGP4 $536
JUMPV
LABELV $540
line 1484
;1482:		}
;1483:		case LTG_TEAMACCOMPANY:
;1484:		{
line 1485
;1485:			EasyClientName(bs->teammate, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1486
;1486:			BotAI_BotInitialChat(bs, "accompanying", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $541
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1487
;1487:			break;
ADDRGP4 $536
JUMPV
LABELV $542
line 1490
;1488:		}
;1489:		case LTG_DEFENDKEYAREA:
;1490:		{
line 1491
;1491:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1492
;1492:			BotAI_BotInitialChat(bs, "defending", goalname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $543
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1493
;1493:			break;
ADDRGP4 $536
JUMPV
LABELV $544
line 1496
;1494:		}
;1495:		case LTG_GETITEM:
;1496:		{
line 1497
;1497:			trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1498
;1498:			BotAI_BotInitialChat(bs, "gettingitem", goalname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $545
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1499
;1499:			break;
ADDRGP4 $536
JUMPV
LABELV $546
line 1502
;1500:		}
;1501:		case LTG_KILL:
;1502:		{
line 1503
;1503:			ClientName(bs->teamgoal.entitynum, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1504
;1504:			BotAI_BotInitialChat(bs, "killing", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $547
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1505
;1505:			break;
ADDRGP4 $536
JUMPV
LABELV $548
line 1509
;1506:		}
;1507:		case LTG_CAMP:
;1508:		case LTG_CAMPORDER:
;1509:		{
line 1510
;1510:			BotAI_BotInitialChat(bs, "camping", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $549
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1511
;1511:			break;
ADDRGP4 $536
JUMPV
LABELV $550
line 1514
;1512:		}
;1513:		case LTG_PATROL:
;1514:		{
line 1515
;1515:			BotAI_BotInitialChat(bs, "patrolling", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $551
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1516
;1516:			break;
ADDRGP4 $536
JUMPV
LABELV $552
line 1519
;1517:		}
;1518:		case LTG_GETFLAG:
;1519:		{
line 1520
;1520:			BotAI_BotInitialChat(bs, "capturingflag", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $553
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1521
;1521:			break;
ADDRGP4 $536
JUMPV
LABELV $554
line 1524
;1522:		}
;1523:		case LTG_RUSHBASE:
;1524:		{
line 1525
;1525:			BotAI_BotInitialChat(bs, "rushingbase", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $555
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1526
;1526:			break;
ADDRGP4 $536
JUMPV
LABELV $556
line 1529
;1527:		}
;1528:		case LTG_RETURNFLAG:
;1529:		{
line 1530
;1530:			BotAI_BotInitialChat(bs, "returningflag", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $557
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1531
;1531:			break;
ADDRGP4 $536
JUMPV
LABELV $558
line 1534
;1532:		}
;1533:		case LTG_ATTACKENEMYBASE:
;1534:		{
line 1535
;1535:			BotAI_BotInitialChat(bs, "attackingenemybase", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $559
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1536
;1536:			break;
ADDRGP4 $536
JUMPV
LABELV $560
line 1539
;1537:		}
;1538:		case LTG_HARVEST:
;1539:		{
line 1540
;1540:			BotAI_BotInitialChat(bs, "harvesting", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $561
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1541
;1541:			break;
ADDRGP4 $536
JUMPV
LABELV $562
line 1545
;1542:		}
;1543:
;1544:		case LTG_POINTA:
;1545:		{
line 1546
;1546:			BotAI_BotInitialChat(bs, "dd_pointa", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $563
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1547
;1547:			break;
ADDRGP4 $536
JUMPV
LABELV $564
line 1550
;1548:		}
;1549:		case LTG_POINTB:
;1550:		{
line 1551
;1551:			BotAI_BotInitialChat(bs, "dd_pointb", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $565
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1552
;1552:			break;
ADDRGP4 $536
JUMPV
LABELV $535
line 1555
;1553:		}
;1554:		default:
;1555:		{
line 1556
;1556:			BotAI_BotInitialChat(bs, "roaming", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $566
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1557
;1557:			break;
LABELV $536
line 1561
;1558:		}
;1559:	}
;1560:	//chat what the bot is doing
;1561:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1562
;1562:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 528
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 528
INDIRI4
ASGNI4
line 1563
;1563:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1564
;1564:}
LABELV $532
endproc BotMatch_WhatAreYouDoing 532 16
export BotMatch_WhatIsMyCommand
proc BotMatch_WhatIsMyCommand 40 12
line 1571
;1565:
;1566:/*
;1567:==================
;1568:BotMatch_WhatIsMyCommand
;1569:==================
;1570:*/
;1571:void BotMatch_WhatIsMyCommand(bot_state_t *bs, bot_match_t *match) {
line 1574
;1572:	char netname[MAX_NETNAME];
;1573:
;1574:	ClientName(bs->client, netname, sizeof(netname));
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
line 1575
;1575:	if (Q_stricmp(netname, bs->teamleader) != 0) return;
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $570
ADDRGP4 $569
JUMPV
LABELV $570
line 1576
;1576:	bs->forceorders = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11072
ADDP4
CNSTI4 1
ASGNI4
line 1577
;1577:}
LABELV $569
endproc BotMatch_WhatIsMyCommand 40 12
export BotNearestVisibleItem
proc BotNearestVisibleItem 252 28
line 1584
;1578:
;1579:/*
;1580:==================
;1581:BotNearestVisibleItem
;1582:==================
;1583:*/
;1584:float BotNearestVisibleItem(bot_state_t *bs, char *itemname, bot_goal_t *goal) {
line 1592
;1585:	int i;
;1586:	char name[64];
;1587:	bot_goal_t tmpgoal;
;1588:	float dist, bestdist;
;1589:	vec3_t dir;
;1590:	bsp_trace_t trace;
;1591:
;1592:	bestdist = 999999;
ADDRLP4 140
CNSTF4 1232348144
ASGNF4
line 1593
;1593:	i = -1;
ADDRLP4 68
CNSTI4 -1
ASGNI4
LABELV $573
line 1594
;1594:	do {
line 1595
;1595:		i = trap_BotGetLevelItemGoal(i, itemname, &tmpgoal);
ADDRLP4 68
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 228
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 228
INDIRI4
ASGNI4
line 1596
;1596:		trap_BotGoalName(tmpgoal.number, name, sizeof(name));
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRLP4 72
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1597
;1597:		if (Q_stricmp(itemname, name) != 0)
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
EQI4 $577
line 1598
;1598:			continue;
ADDRGP4 $574
JUMPV
LABELV $577
line 1599
;1599:		VectorSubtract(tmpgoal.origin, bs->origin, dir);
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 0
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1600
;1600:		dist = VectorLength(dir);
ADDRLP4 56
ARGP4
ADDRLP4 240
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 136
ADDRLP4 240
INDIRF4
ASGNF4
line 1601
;1601:		if (dist < bestdist) {
ADDRLP4 136
INDIRF4
ADDRLP4 140
INDIRF4
GEF4 $583
line 1603
;1602:			//trace from start to end
;1603:			BotAI_Trace(&trace, bs->eye, NULL, NULL, tmpgoal.origin, bs->client, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 144
ARGP4
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 248
CNSTP4 0
ASGNP4
ADDRLP4 248
INDIRP4
ARGP4
ADDRLP4 248
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 65537
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1604
;1604:			if (trace.fraction >= 1.0) {
ADDRLP4 144+8
INDIRF4
CNSTF4 1065353216
LTF4 $585
line 1605
;1605:				bestdist = dist;
ADDRLP4 140
ADDRLP4 136
INDIRF4
ASGNF4
line 1606
;1606:				memcpy(goal, &tmpgoal, sizeof(bot_goal_t));
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1607
;1607:			}
LABELV $585
line 1608
;1608:		}
LABELV $583
line 1609
;1609:	} while(i > 0);
LABELV $574
ADDRLP4 68
INDIRI4
CNSTI4 0
GTI4 $573
line 1610
;1610:	return bestdist;
ADDRLP4 140
INDIRF4
RETF4
LABELV $572
endproc BotNearestVisibleItem 252 28
lit
align 4
LABELV $589
address $590
address $591
address $592
address $593
address $594
address $595
address $596
address $597
address $598
address $599
address $600
address $601
address $602
address $603
address $604
address $605
address $606
address $607
address $608
address $609
address $610
address $611
address $612
address $613
address $614
address $615
address $616
address $617
byte 4 0
export BotMatch_WhereAreYou
code
proc BotMatch_WhereAreYou 496 20
line 1618
;1611:}
;1612:
;1613:/*
;1614:==================
;1615:BotMatch_WhereAreYou
;1616:==================
;1617:*/
;1618:void BotMatch_WhereAreYou(bot_state_t *bs, bot_match_t *match) {
line 1623
;1619:	float dist, bestdist;
;1620:	int i, bestitem, redtt, bluett, client;
;1621:	bot_goal_t goal;
;1622:	char netname[MAX_MESSAGE_SIZE];
;1623:	char *nearbyitems[] = {
ADDRLP4 8
ADDRGP4 $589
INDIRB
ASGNB 116
line 1655
;1624:		"Shotgun",
;1625:		"Grenade Launcher",
;1626:		"Rocket Launcher",
;1627:		"Plasmagun",
;1628:		"Railgun",
;1629:		"Lightning Gun",
;1630:		"BFG10K",
;1631:		"Quad Damage",
;1632:		"Regeneration",
;1633:		"Battle Suit",
;1634:		"Speed",
;1635:		"Invisibility",
;1636:		"Flight",
;1637:		"Armor",
;1638:		"Heavy Armor",
;1639:		"Red Flag",
;1640:		"Blue Flag",
;1641:		"Nailgun",
;1642:		"Prox Launcher",
;1643:		"Chaingun",
;1644:		"Scout",
;1645:		"Guard",
;1646:		"Doubler",
;1647:		"Ammo Regen",
;1648:		"Neutral Flag",
;1649:		"Red Obelisk",
;1650:		"Blue Obelisk",
;1651:		"Neutral Obelisk",
;1652:		NULL
;1653:	};
;1654:	//
;1655:	if (!TeamPlayIsOn())
ADDRLP4 456
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 456
INDIRI4
CNSTI4 0
NEI4 $618
line 1656
;1656:		return;
ADDRGP4 $588
JUMPV
LABELV $618
line 1659
;1657:
;1658:	//if not addressed to this bot
;1659:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 460
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 460
INDIRI4
CNSTI4 0
NEI4 $620
line 1660
;1660:		return;
ADDRGP4 $588
JUMPV
LABELV $620
line 1662
;1661:
;1662:	bestitem = -1;
ADDRLP4 184
CNSTI4 -1
ASGNI4
line 1663
;1663:	bestdist = 999999;
ADDRLP4 124
CNSTF4 1232348144
ASGNF4
line 1664
;1664:	for (i = 0; nearbyitems[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $625
JUMPV
LABELV $622
line 1665
;1665:		dist = BotNearestVisibleItem(bs, nearbyitems[i], &goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 464
ADDRGP4 BotNearestVisibleItem
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 464
INDIRF4
ASGNF4
line 1666
;1666:		if (dist < bestdist) {
ADDRLP4 4
INDIRF4
ADDRLP4 124
INDIRF4
GEF4 $626
line 1667
;1667:			bestdist = dist;
ADDRLP4 124
ADDRLP4 4
INDIRF4
ASGNF4
line 1668
;1668:			bestitem = i;
ADDRLP4 184
ADDRLP4 0
INDIRI4
ASGNI4
line 1669
;1669:		}
LABELV $626
line 1670
;1670:	}
LABELV $623
line 1664
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $625
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $622
line 1671
;1671:	if (bestitem != -1) {
ADDRLP4 184
INDIRI4
CNSTI4 -1
EQI4 $628
line 1672
;1672:		if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION
ADDRLP4 464
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 464
INDIRI4
CNSTI4 5
EQI4 $633
ADDRLP4 464
INDIRI4
CNSTI4 10
EQI4 $633
ADDRLP4 464
INDIRI4
CNSTI4 6
NEI4 $630
LABELV $633
line 1674
;1673:			|| gametype == GT_1FCTF
;1674:			) {
line 1675
;1675:			redtt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, ctf_redflag.areanum, TFL_DEFAULT);
ADDRLP4 468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 468
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRGP4 ctf_redflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 472
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 444
ADDRLP4 472
INDIRI4
ASGNI4
line 1676
;1676:			bluett = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, ctf_blueflag.areanum, TFL_DEFAULT);
ADDRLP4 476
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 476
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 476
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRGP4 ctf_blueflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 480
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 480
INDIRI4
ASGNI4
line 1677
;1677:			if (redtt < (redtt + bluett) * 0.4) {
ADDRLP4 484
ADDRLP4 444
INDIRI4
ASGNI4
ADDRLP4 484
INDIRI4
CVIF4 4
CNSTF4 1053609165
ADDRLP4 484
INDIRI4
ADDRLP4 448
INDIRI4
ADDI4
CVIF4 4
MULF4
GEF4 $636
line 1678
;1678:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "red", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $638
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $639
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1679
;1679:			}
ADDRGP4 $631
JUMPV
LABELV $636
line 1680
;1680:			else if (bluett < (redtt + bluett) * 0.4) {
ADDRLP4 488
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 488
INDIRI4
CVIF4 4
CNSTF4 1053609165
ADDRLP4 444
INDIRI4
ADDRLP4 488
INDIRI4
ADDI4
CVIF4 4
MULF4
GEF4 $640
line 1681
;1681:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "blue", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $638
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $642
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1682
;1682:			}
ADDRGP4 $631
JUMPV
LABELV $640
line 1683
;1683:			else {
line 1684
;1684:				BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $643
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1685
;1685:			}
line 1686
;1686:		}
ADDRGP4 $631
JUMPV
LABELV $630
line 1687
;1687:		else if (gametype == GT_OBELISK || gametype == GT_HARVESTER) {
ADDRLP4 468
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 468
INDIRI4
CNSTI4 7
EQI4 $646
ADDRLP4 468
INDIRI4
CNSTI4 8
NEI4 $644
LABELV $646
line 1688
;1688:			redtt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, redobelisk.areanum, TFL_DEFAULT);
ADDRLP4 472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 472
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 472
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRGP4 redobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 476
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 444
ADDRLP4 476
INDIRI4
ASGNI4
line 1689
;1689:			bluett = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, blueobelisk.areanum, TFL_DEFAULT);
ADDRLP4 480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 480
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 480
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRGP4 blueobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 484
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 484
INDIRI4
ASGNI4
line 1690
;1690:			if (redtt < (redtt + bluett) * 0.4) {
ADDRLP4 488
ADDRLP4 444
INDIRI4
ASGNI4
ADDRLP4 488
INDIRI4
CVIF4 4
CNSTF4 1053609165
ADDRLP4 488
INDIRI4
ADDRLP4 448
INDIRI4
ADDI4
CVIF4 4
MULF4
GEF4 $649
line 1691
;1691:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "red", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $638
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $639
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1692
;1692:			}
ADDRGP4 $645
JUMPV
LABELV $649
line 1693
;1693:			else if (bluett < (redtt + bluett) * 0.4) {
ADDRLP4 492
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 492
INDIRI4
CVIF4 4
CNSTF4 1053609165
ADDRLP4 444
INDIRI4
ADDRLP4 492
INDIRI4
ADDI4
CVIF4 4
MULF4
GEF4 $651
line 1694
;1694:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "blue", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $638
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $642
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1695
;1695:			}
ADDRGP4 $645
JUMPV
LABELV $651
line 1696
;1696:			else {
line 1697
;1697:				BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $643
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1698
;1698:			}
line 1699
;1699:		}
ADDRGP4 $645
JUMPV
LABELV $644
line 1700
;1700:		else {
line 1701
;1701:			BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $643
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1702
;1702:		}
LABELV $645
LABELV $631
line 1703
;1703:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 188
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1704
;1704:		client = ClientFromName(netname);
ADDRLP4 188
ARGP4
ADDRLP4 472
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 452
ADDRLP4 472
INDIRI4
ASGNI4
line 1705
;1705:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 452
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1706
;1706:	}
LABELV $628
line 1707
;1707:}
LABELV $588
endproc BotMatch_WhereAreYou 496 20
export BotMatch_LeadTheWay
proc BotMatch_LeadTheWay 680 16
line 1714
;1708:
;1709:/*
;1710:==================
;1711:BotMatch_LeadTheWay
;1712:==================
;1713:*/
;1714:void BotMatch_LeadTheWay(bot_state_t *bs, bot_match_t *match) {
line 1719
;1715:	aas_entityinfo_t entinfo;
;1716:	char netname[MAX_MESSAGE_SIZE], teammate[MAX_MESSAGE_SIZE];
;1717:	int client, areanum, other;
;1718:
;1719:	if (!TeamPlayIsOn()) return;
ADDRLP4 664
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 0
NEI4 $654
ADDRGP4 $653
JUMPV
LABELV $654
line 1721
;1720:	//if not addressed to this bot
;1721:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 668
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 668
INDIRI4
CNSTI4 0
NEI4 $656
ADDRGP4 $653
JUMPV
LABELV $656
line 1723
;1722:	//if someone asks for someone else
;1723:	if (match->subtype & ST_SOMEONE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $658
line 1725
;1724:		//get the team mate name
;1725:		trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 400
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1726
;1726:		client = FindClientByName(teammate);
ADDRLP4 400
ARGP4
ADDRLP4 672
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 1728
;1727:		//if this is the bot self
;1728:		if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $660
line 1729
;1729:			other = qfalse;
ADDRLP4 656
CNSTI4 0
ASGNI4
line 1730
;1730:		}
ADDRGP4 $659
JUMPV
LABELV $660
line 1731
;1731:		else if (!BotSameTeam(bs, client)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 676
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 676
INDIRI4
CNSTI4 0
NEI4 $662
line 1733
;1732:			//FIXME: say "I don't help the enemy"
;1733:			return;
ADDRGP4 $653
JUMPV
LABELV $662
line 1735
;1734:		}
;1735:		else {
line 1736
;1736:			other = qtrue;
ADDRLP4 656
CNSTI4 1
ASGNI4
line 1737
;1737:		}
line 1738
;1738:	}
ADDRGP4 $659
JUMPV
LABELV $658
line 1739
;1739:	else {
line 1741
;1740:		//get the netname
;1741:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 144
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1742
;1742:		client = ClientFromName(netname);
ADDRLP4 144
ARGP4
ADDRLP4 672
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 1743
;1743:		other = qfalse;
ADDRLP4 656
CNSTI4 0
ASGNI4
line 1744
;1744:	}
LABELV $659
line 1746
;1745:	//if the bot doesn't know who to help (FindClientByName returned -1)
;1746:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $664
line 1747
;1747:		BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 144
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1748
;1748:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1749
;1749:		return;
ADDRGP4 $653
JUMPV
LABELV $664
line 1752
;1750:	}
;1751:	//
;1752:	bs->lead_teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 10972
ADDP4
CNSTI4 -1
ASGNI4
line 1753
;1753:	BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1755
;1754:	//if info is valid (in PVS)
;1755:	if (entinfo.valid) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $666
line 1756
;1756:		areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 4+24
ARGP4
ADDRLP4 672
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 660
ADDRLP4 672
INDIRI4
ASGNI4
line 1757
;1757:		if (areanum) { // && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 660
INDIRI4
CNSTI4 0
EQI4 $669
line 1758
;1758:			bs->lead_teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 10972
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1759
;1759:			bs->lead_teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10944
ADDP4
ADDRLP4 660
INDIRI4
ASGNI4
line 1760
;1760:			VectorCopy(entinfo.origin, bs->lead_teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 10932
ADDP4
ADDRLP4 4+24
INDIRB
ASGNB 12
line 1761
;1761:			VectorSet(bs->lead_teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 10948
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10952
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10956
ADDP4
CNSTF4 3238002688
ASGNF4
line 1762
;1762:			VectorSet(bs->lead_teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 10960
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10964
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10968
ADDP4
CNSTF4 1090519040
ASGNF4
line 1763
;1763:		}
LABELV $669
line 1764
;1764:	}
LABELV $666
line 1766
;1765:
;1766:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
CNSTI4 0
GEI4 $672
line 1767
;1767:		if (other) BotAI_BotInitialChat(bs, "whereis", teammate, NULL);
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $674
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 400
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $675
JUMPV
LABELV $674
line 1768
;1768:		else BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 144
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $675
line 1769
;1769:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1770
;1770:		return;
ADDRGP4 $653
JUMPV
LABELV $672
line 1772
;1771:	}
;1772:	bs->lead_teammate = client;
ADDRFP4 0
INDIRP4
CNSTI4 10928
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1773
;1773:	bs->lead_time = FloatTime() + TEAM_LEAD_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10988
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1774
;1774:	bs->leadvisible_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10992
ADDP4
CNSTF4 0
ASGNF4
line 1775
;1775:	bs->leadmessage_time = -(FloatTime() + 2 * random());
ADDRLP4 672
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10996
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 672
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
NEGF4
ASGNF4
line 1776
;1776:}
LABELV $653
endproc BotMatch_LeadTheWay 680 16
export BotMatch_Kill
proc BotMatch_Kill 532 16
line 1783
;1777:
;1778:/*
;1779:==================
;1780:BotMatch_Kill
;1781:==================
;1782:*/
;1783:void BotMatch_Kill(bot_state_t *bs, bot_match_t *match) {
line 1788
;1784:	char enemy[MAX_MESSAGE_SIZE];
;1785:	char netname[MAX_MESSAGE_SIZE];
;1786:	int client;
;1787:
;1788:	if (!TeamPlayIsOn()) return;
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $677
ADDRGP4 $676
JUMPV
LABELV $677
line 1790
;1789:	//if not addressed to this bot
;1790:	if (!BotAddressedToBot(bs, match)) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $679
ADDRGP4 $676
JUMPV
LABELV $679
line 1792
;1791:
;1792:	trap_BotMatchVariable(match, ENEMY, enemy, sizeof(enemy));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1794
;1793:	//
;1794:	client = FindEnemyByName(bs, enemy);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 524
ADDRGP4 FindEnemyByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 524
INDIRI4
ASGNI4
line 1795
;1795:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $681
line 1796
;1796:		BotAI_BotInitialChat(bs, "whois", enemy, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1797
;1797:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1798
;1798:		client = ClientFromName(netname);
ADDRLP4 260
ARGP4
ADDRLP4 528
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 528
INDIRI4
ASGNI4
line 1799
;1799:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1800
;1800:		return;
ADDRGP4 $676
JUMPV
LABELV $681
line 1802
;1801:	}
;1802:	bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1804
;1803:	//set the time to send a message to the team mates
;1804:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 528
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1806
;1805:	//set the ltg type
;1806:	bs->ltgtype = LTG_KILL;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 11
ASGNI4
line 1808
;1807:	//set the team goal time
;1808:	bs->teamgoal_time = FloatTime() + TEAM_KILL_SOMEONE;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 1810
;1809:	//
;1810:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1814
;1811:#ifdef DEBUG
;1812:	BotPrintTeamGoal(bs);
;1813:#endif //DEBUG
;1814:}
LABELV $676
endproc BotMatch_Kill 532 16
export BotMatch_CTF
proc BotMatch_CTF 180 16
line 1821
;1815:
;1816:/*
;1817:==================
;1818:BotMatch_CTF
;1819:==================
;1820:*/
;1821:void BotMatch_CTF(bot_state_t *bs, bot_match_t *match) {
line 1825
;1822:
;1823:	char flag[128], netname[MAX_NETNAME];
;1824:
;1825:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 164
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 5
EQI4 $686
ADDRLP4 164
INDIRI4
CNSTI4 10
NEI4 $684
LABELV $686
line 1826
;1826:		trap_BotMatchVariable(match, FLAG, flag, sizeof(flag));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1827
;1827:		if (match->subtype & ST_GOTFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $687
line 1828
;1828:			if (!Q_stricmp(flag, "red")) {
ADDRLP4 0
ARGP4
ADDRGP4 $639
ARGP4
ADDRLP4 168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $689
line 1829
;1829:				bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 11056
ADDP4
CNSTI4 1
ASGNI4
line 1830
;1830:				if (BotTeam(bs) == TEAM_BLUE) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 2
NEI4 $690
line 1831
;1831:					trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1832
;1832:					bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 176
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
ADDRLP4 176
INDIRI4
ASGNI4
line 1833
;1833:				}
line 1834
;1834:			}
ADDRGP4 $690
JUMPV
LABELV $689
line 1835
;1835:			else {
line 1836
;1836:				bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 11060
ADDP4
CNSTI4 1
ASGNI4
line 1837
;1837:				if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 1
NEI4 $693
line 1838
;1838:					trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1839
;1839:					bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 176
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
ADDRLP4 176
INDIRI4
ASGNI4
line 1840
;1840:				}
LABELV $693
line 1841
;1841:			}
LABELV $690
line 1842
;1842:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 1843
;1843:			bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11048
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1844
;1844:		}
ADDRGP4 $685
JUMPV
LABELV $687
line 1845
;1845:		else if (match->subtype & ST_CAPTUREDFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $695
line 1846
;1846:			bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11056
ADDP4
CNSTI4 0
ASGNI4
line 1847
;1847:			bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11060
ADDP4
CNSTI4 0
ASGNI4
line 1848
;1848:			bs->flagcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
CNSTI4 0
ASGNI4
line 1849
;1849:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 1850
;1850:		}
ADDRGP4 $685
JUMPV
LABELV $695
line 1851
;1851:		else if (match->subtype & ST_RETURNEDFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $685
line 1852
;1852:			if (!Q_stricmp(flag, "red")) bs->redflagstatus = 0;
ADDRLP4 0
ARGP4
ADDRGP4 $639
ARGP4
ADDRLP4 168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $699
ADDRFP4 0
INDIRP4
CNSTI4 11056
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $700
JUMPV
LABELV $699
line 1853
;1853:			else bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11060
ADDP4
CNSTI4 0
ASGNI4
LABELV $700
line 1854
;1854:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 1855
;1855:		}
line 1856
;1856:	}
ADDRGP4 $685
JUMPV
LABELV $684
line 1857
;1857:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $701
line 1858
;1858:		if (match->subtype & ST_1FCTFGOTFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 65535
BANDI4
CNSTI4 0
EQI4 $703
line 1859
;1859:			trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1860
;1860:			bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 168
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 11076
ADDP4
ADDRLP4 168
INDIRI4
ASGNI4
line 1861
;1861:		}
LABELV $703
line 1862
;1862:	}
LABELV $701
LABELV $685
line 1863
;1863:}
LABELV $683
endproc BotMatch_CTF 180 16
export BotMatch_EnterGame
proc BotMatch_EnterGame 44 16
line 1865
;1864:
;1865:void BotMatch_EnterGame(bot_state_t *bs, bot_match_t *match) {
line 1869
;1866:	int client;
;1867:	char netname[MAX_NETNAME];
;1868:
;1869:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1870
;1870:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 1871
;1871:	if (client >= 0) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $706
line 1872
;1872:		notleader[client] = qfalse;
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
CNSTI4 0
ASGNI4
line 1873
;1873:	}
LABELV $706
line 1877
;1874:	//NOTE: eliza chats will catch this
;1875:	//Com_sprintf(buf, sizeof(buf), "heya %s", netname);
;1876:	//EA_Say(bs->client, buf);
;1877:}
LABELV $705
endproc BotMatch_EnterGame 44 16
export BotMatch_NewLeader
proc BotMatch_NewLeader 48 16
line 1879
;1878:
;1879:void BotMatch_NewLeader(bot_state_t *bs, bot_match_t *match) {
line 1883
;1880:	int client;
;1881:	char netname[MAX_NETNAME];
;1882:
;1883:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1884
;1884:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 1885
;1885:	if (!BotSameTeam(bs, client))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $709
line 1886
;1886:		return;
ADDRGP4 $708
JUMPV
LABELV $709
line 1887
;1887:	Q_strncpyz(bs->teamleader, netname, sizeof(bs->teamleader));
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1888
;1888:}
LABELV $708
endproc BotMatch_NewLeader 48 16
export BotMatchMessage
proc BotMatchMessage 344 12
line 1895
;1889:
;1890:/*
;1891:==================
;1892:BotMatchMessage
;1893:==================
;1894:*/
;1895:int BotMatchMessage(bot_state_t *bs, char *message) {
line 1898
;1896:	bot_match_t match;
;1897:
;1898:	match.type = 0;
ADDRLP4 0+256
CNSTI4 0
ASGNI4
line 1900
;1899:	//if it is an unknown message
;1900:	if (!trap_BotFindMatch(message, &match, MTCONTEXT_MISC
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTU4 774
ARGU4
ADDRLP4 328
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
NEI4 $713
line 1903
;1901:	|MTCONTEXT_INITIALTEAMCHAT
;1902:	|MTCONTEXT_CTF
;1903:	|MTCONTEXT_DD)) {
line 1904
;1904:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $711
JUMPV
LABELV $713
line 1907
;1905:	}
;1906:	//react to the found message
;1907:	switch(match.type)
ADDRLP4 332
ADDRLP4 0+256
INDIRI4
ASGNI4
ADDRLP4 332
INDIRI4
CNSTI4 90
EQI4 $752
ADDRLP4 336
CNSTI4 91
ASGNI4
ADDRLP4 332
INDIRI4
ADDRLP4 336
INDIRI4
EQI4 $753
ADDRLP4 332
INDIRI4
ADDRLP4 336
INDIRI4
GTI4 $756
LABELV $755
ADDRLP4 340
ADDRLP4 0+256
INDIRI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 1
LTI4 $715
ADDRLP4 340
INDIRI4
CNSTI4 33
GTI4 $715
ADDRLP4 340
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $757-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $757
address $749
address $748
address $718
address $718
address $719
address $725
address $722
address $740
address $741
address $742
address $716
address $743
address $730
address $731
address $734
address $736
address $737
address $716
address $739
address $720
address $733
address $721
address $746
address $729
address $747
address $745
address $726
address $744
address $732
address $727
address $723
address $724
address $751
code
LABELV $756
ADDRLP4 0+256
INDIRI4
CNSTI4 300
EQI4 $728
ADDRGP4 $715
JUMPV
line 1908
;1908:	{
LABELV $718
line 1911
;1909:		case MSG_HELP:					//someone calling for help
;1910:		case MSG_ACCOMPANY:				//someone calling for company
;1911:		{
line 1912
;1912:			BotMatch_HelpAccompany(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_HelpAccompany
CALLV
pop
line 1913
;1913:			break;
ADDRGP4 $716
JUMPV
LABELV $719
line 1916
;1914:		}
;1915:		case MSG_DEFENDKEYAREA:			//teamplay defend a key area
;1916:		{
line 1917
;1917:			BotMatch_DefendKeyArea(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_DefendKeyArea
CALLV
pop
line 1918
;1918:			break;
ADDRGP4 $716
JUMPV
LABELV $720
line 1921
;1919:		}
;1920:		case MSG_CAMP:					//camp somewhere
;1921:		{
line 1922
;1922:			BotMatch_Camp(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Camp
CALLV
pop
line 1923
;1923:			break;
ADDRGP4 $716
JUMPV
LABELV $721
line 1926
;1924:		}
;1925:		case MSG_PATROL:				//patrol between several key areas
;1926:		{
line 1927
;1927:			BotMatch_Patrol(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Patrol
CALLV
pop
line 1928
;1928:			break;
ADDRGP4 $716
JUMPV
LABELV $722
line 1932
;1929:		}
;1930:		//CTF & 1FCTF
;1931:		case MSG_GETFLAG:				//ctf get the enemy flag
;1932:		{
line 1933
;1933:			BotMatch_GetFlag(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_GetFlag
CALLV
pop
line 1934
;1934:			break;
ADDRGP4 $716
JUMPV
LABELV $723
line 1938
;1935:		}
;1936:		//CTF & 1FCTF & Obelisk & Harvester
;1937:		case MSG_ATTACKENEMYBASE:
;1938:		{
line 1939
;1939:			BotMatch_AttackEnemyBase(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_AttackEnemyBase
CALLV
pop
line 1940
;1940:			break;
ADDRGP4 $716
JUMPV
LABELV $724
line 1944
;1941:		}
;1942:		//Harvester
;1943:		case MSG_HARVEST:
;1944:		{
line 1945
;1945:			BotMatch_Harvest(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Harvest
CALLV
pop
line 1946
;1946:			break;
ADDRGP4 $716
JUMPV
LABELV $725
line 1950
;1947:		}
;1948:		//CTF & 1FCTF & Harvester
;1949:		case MSG_RUSHBASE:				//ctf rush to the base
;1950:		{
line 1951
;1951:			BotMatch_RushBase(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_RushBase
CALLV
pop
line 1952
;1952:			break;
ADDRGP4 $716
JUMPV
LABELV $726
line 1956
;1953:		}
;1954:		//CTF & 1FCTF
;1955:		case MSG_RETURNFLAG:
;1956:		{
line 1957
;1957:			BotMatch_ReturnFlag(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_ReturnFlag
CALLV
pop
line 1958
;1958:			break;
ADDRGP4 $716
JUMPV
LABELV $727
line 1962
;1959:		}
;1960:		//CTF & 1FCTF & Obelisk & Harvester
;1961:		case MSG_TASKPREFERENCE:
;1962:		{
line 1963
;1963:			BotMatch_TaskPreference(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_TaskPreference
CALLV
pop
line 1964
;1964:			break;
ADDRGP4 $716
JUMPV
LABELV $728
line 1968
;1965:		}
;1966:		//CTF & 1FCTF
;1967:		case MSG_CTF:
;1968:		{
line 1969
;1969:			BotMatch_CTF(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_CTF
CALLV
pop
line 1970
;1970:			break;
ADDRGP4 $716
JUMPV
LABELV $729
line 1973
;1971:		}
;1972:		case MSG_GETITEM:
;1973:		{
line 1974
;1974:			BotMatch_GetItem(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_GetItem
CALLV
pop
line 1975
;1975:			break;
ADDRGP4 $716
JUMPV
LABELV $730
line 1978
;1976:		}
;1977:		case MSG_JOINSUBTEAM:			//join a sub team
;1978:		{
line 1979
;1979:			BotMatch_JoinSubteam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_JoinSubteam
CALLV
pop
line 1980
;1980:			break;
ADDRGP4 $716
JUMPV
LABELV $731
line 1983
;1981:		}
;1982:		case MSG_LEAVESUBTEAM:			//leave a sub team
;1983:		{
line 1984
;1984:			BotMatch_LeaveSubteam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_LeaveSubteam
CALLV
pop
line 1985
;1985:			break;
ADDRGP4 $716
JUMPV
LABELV $732
line 1988
;1986:		}
;1987:		case MSG_WHICHTEAM:
;1988:		{
line 1989
;1989:			BotMatch_WhichTeam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhichTeam
CALLV
pop
line 1990
;1990:			break;
ADDRGP4 $716
JUMPV
LABELV $733
line 1993
;1991:		}
;1992:		case MSG_CHECKPOINT:			//remember a check point
;1993:		{
line 1994
;1994:			BotMatch_CheckPoint(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_CheckPoint
CALLV
pop
line 1995
;1995:			break;
ADDRGP4 $716
JUMPV
LABELV $734
line 1998
;1996:		}
;1997:		case MSG_CREATENEWFORMATION:	//start the creation of a new formation
;1998:		{
line 1999
;1999:			trap_EA_SayTeam(bs->client, "the part of my brain to create formations has been damaged");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $735
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 2000
;2000:			break;
ADDRGP4 $716
JUMPV
LABELV $736
line 2003
;2001:		}
;2002:		case MSG_FORMATIONPOSITION:		//tell someone his/her position in the formation
;2003:		{
line 2004
;2004:			trap_EA_SayTeam(bs->client, "the part of my brain to create formations has been damaged");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $735
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 2005
;2005:			break;
ADDRGP4 $716
JUMPV
LABELV $737
line 2008
;2006:		}
;2007:		case MSG_FORMATIONSPACE:		//set the formation space
;2008:		{
line 2009
;2009:			BotMatch_FormationSpace(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_FormationSpace
CALLV
pop
line 2010
;2010:			break;
ADDRGP4 $716
JUMPV
line 2013
;2011:		}
;2012:		case MSG_DOFORMATION:			//form a certain formation
;2013:		{
line 2014
;2014:			break;
LABELV $739
line 2017
;2015:		}
;2016:		case MSG_DISMISS:				//dismiss someone
;2017:		{
line 2018
;2018:			BotMatch_Dismiss(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Dismiss
CALLV
pop
line 2019
;2019:			break;
ADDRGP4 $716
JUMPV
LABELV $740
line 2022
;2020:		}
;2021:		case MSG_STARTTEAMLEADERSHIP:	//someone will become the team leader
;2022:		{
line 2023
;2023:			BotMatch_StartTeamLeaderShip(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_StartTeamLeaderShip
CALLV
pop
line 2024
;2024:			break;
ADDRGP4 $716
JUMPV
LABELV $741
line 2027
;2025:		}
;2026:		case MSG_STOPTEAMLEADERSHIP:	//someone will stop being the team leader
;2027:		{
line 2028
;2028:			BotMatch_StopTeamLeaderShip(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_StopTeamLeaderShip
CALLV
pop
line 2029
;2029:			break;
ADDRGP4 $716
JUMPV
LABELV $742
line 2032
;2030:		}
;2031:		case MSG_WHOISTEAMLAEDER:
;2032:		{
line 2033
;2033:			BotMatch_WhoIsTeamLeader(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhoIsTeamLeader
CALLV
pop
line 2034
;2034:			break;
ADDRGP4 $716
JUMPV
LABELV $743
line 2037
;2035:		}
;2036:		case MSG_WHATAREYOUDOING:		//ask a bot what he/she is doing
;2037:		{
line 2038
;2038:			BotMatch_WhatAreYouDoing(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhatAreYouDoing
CALLV
pop
line 2039
;2039:			break;
ADDRGP4 $716
JUMPV
LABELV $744
line 2042
;2040:		}
;2041:		case MSG_WHATISMYCOMMAND:
;2042:		{
line 2043
;2043:			BotMatch_WhatIsMyCommand(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhatIsMyCommand
CALLV
pop
line 2044
;2044:			break;
ADDRGP4 $716
JUMPV
LABELV $745
line 2047
;2045:		}
;2046:		case MSG_WHEREAREYOU:
;2047:		{
line 2048
;2048:			BotMatch_WhereAreYou(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhereAreYou
CALLV
pop
line 2049
;2049:			break;
ADDRGP4 $716
JUMPV
LABELV $746
line 2052
;2050:		}
;2051:		case MSG_LEADTHEWAY:
;2052:		{
line 2053
;2053:			BotMatch_LeadTheWay(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_LeadTheWay
CALLV
pop
line 2054
;2054:			break;
ADDRGP4 $716
JUMPV
LABELV $747
line 2057
;2055:		}
;2056:		case MSG_KILL:
;2057:		{
line 2058
;2058:			BotMatch_Kill(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Kill
CALLV
pop
line 2059
;2059:			break;
ADDRGP4 $716
JUMPV
LABELV $748
line 2062
;2060:		}
;2061:		case MSG_ENTERGAME:				//someone entered the game
;2062:		{
line 2063
;2063:			BotMatch_EnterGame(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_EnterGame
CALLV
pop
line 2064
;2064:			break;
ADDRGP4 $716
JUMPV
LABELV $749
line 2067
;2065:		}
;2066:		case MSG_NEWLEADER:
;2067:		{
line 2068
;2068:			BotMatch_NewLeader(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_NewLeader
CALLV
pop
line 2069
;2069:			break;
ADDRGP4 $716
JUMPV
line 2072
;2070:		}
;2071:		case MSG_WAIT:
;2072:		{
line 2073
;2073:			break;
LABELV $751
line 2076
;2074:		}
;2075:		case MSG_SUICIDE:
;2076:		{
line 2077
;2077:			BotMatch_Suicide(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Suicide
CALLV
pop
line 2078
;2078:			break;
ADDRGP4 $716
JUMPV
LABELV $752
line 2081
;2079:		}
;2080:		case MSG_TAKEA:
;2081:		{
line 2082
;2082:			BotMatch_TakeA(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_TakeA
CALLV
pop
line 2083
;2083:			break;
ADDRGP4 $716
JUMPV
LABELV $753
line 2086
;2084:		}
;2085:		case MSG_TAKEB:
;2086:		{
line 2087
;2087:			BotMatch_TakeB(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_TakeB
CALLV
pop
line 2088
;2088:			break;
ADDRGP4 $716
JUMPV
LABELV $715
line 2091
;2089:		}
;2090:		default:
;2091:		{
line 2092
;2092:			BotAI_Print(PRT_MESSAGE, "unknown match type\n");
CNSTI4 1
ARGI4
ADDRGP4 $754
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 2093
;2093:			break;
LABELV $716
line 2096
;2094:		}
;2095:	}
;2096:	return qtrue;
CNSTI4 1
RETI4
LABELV $711
endproc BotMatchMessage 344 12
import BotVoiceChatOnly
import BotVoiceChat
import BotSetTeamMateTaskPreference
import BotGetTeamMateTaskPreference
import BotTeamAI
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
bss
export notleader
align 4
LABELV notleader
skip 1024
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
LABELV $754
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $735
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
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
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $643
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $642
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $639
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $638
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $617
byte 1 78
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $616
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $615
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $614
byte 1 78
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $613
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $612
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $611
byte 1 71
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $610
byte 1 83
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $609
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
LABELV $608
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $607
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $606
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $605
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $604
byte 1 72
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $603
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $602
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $601
byte 1 73
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $600
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $599
byte 1 66
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $598
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $597
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $596
byte 1 66
byte 1 70
byte 1 71
byte 1 49
byte 1 48
byte 1 75
byte 1 0
align 1
LABELV $595
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $594
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $593
byte 1 80
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
LABELV $592
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $591
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $590
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $566
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $565
byte 1 100
byte 1 100
byte 1 95
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 98
byte 1 0
align 1
LABELV $563
byte 1 100
byte 1 100
byte 1 95
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $561
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $559
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
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
LABELV $557
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $555
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $553
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $551
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $549
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $547
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $545
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $543
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $541
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $539
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $531
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $509
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $508
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $502
byte 1 100
byte 1 105
byte 1 115
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $486
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $485
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 0
align 1
LABELV $474
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $466
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
LABELV $460
byte 1 110
byte 1 111
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $459
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $451
byte 1 0
align 1
LABELV $450
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $442
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $431
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $430
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 105
byte 1 110
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $279
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 101
byte 1 121
byte 1 111
byte 1 117
byte 1 0
align 1
LABELV $278
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $259
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $242
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $193
byte 1 73
byte 1 32
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $168
byte 1 119
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 115
byte 1 97
byte 1 121
byte 1 63
byte 1 0
align 1
LABELV $106
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
