export BotResetNodeSwitches
code
proc BotResetNodeSwitches 0 0
file "../../../code/game/ai_dmnet.c"
line 74
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
;25: * name:		ai_dmnet.c
;26: *
;27: * desc:		Quake3 bot AI
;28: *
;29: * $Archive: /MissionPack/code/game/ai_dmnet.c $
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
;50://data file headers
;51:#include "chars.h"			//characteristics
;52:#include "inv.h"			//indexes into the inventory
;53:#include "syn.h"			//synonyms
;54:#include "match.h"			//string matching types and vars
;55:
;56:// for the voice chats
;57:#include "../../ui/menudef.h"
;58:
;59://goal flag, see ../botlib/be_ai_goal.h for the other GFL_*
;60:#define GFL_AIR			128
;61:
;62:int numnodeswitches;
;63:char nodeswitch[MAX_NODESWITCHES+1][144];
;64:
;65:#define LOOKAHEAD_DISTANCE			300
;66:
;67:extern bot_goal_t dom_points_bot[MAX_DOMINATION_POINTS];
;68:
;69:/*
;70:==================
;71:BotResetNodeSwitches
;72:==================
;73:*/
;74:void BotResetNodeSwitches(void) {
line 75
;75:	numnodeswitches = 0;
ADDRGP4 numnodeswitches
CNSTI4 0
ASGNI4
line 76
;76:}
LABELV $65
endproc BotResetNodeSwitches 0 0
export BotDumpNodeSwitches
proc BotDumpNodeSwitches 40 20
line 83
;77:
;78:/*
;79:==================
;80:BotDumpNodeSwitches
;81:==================
;82:*/
;83:void BotDumpNodeSwitches(bot_state_t *bs) {
line 87
;84:	int i;
;85:	char netname[MAX_NETNAME];
;86:
;87:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
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
line 88
;88:	BotAI_Print(PRT_MESSAGE, "%s at %1.1f switched more than %d AI nodes\n", netname, FloatTime(), MAX_NODESWITCHES);
CNSTI4 1
ARGI4
ADDRGP4 $67
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 floattime
INDIRF4
ARGF4
CNSTI4 50
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 89
;89:	for (i = 0; i < numnodeswitches; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $71
JUMPV
LABELV $68
line 90
;90:		BotAI_Print(PRT_MESSAGE, "%s", nodeswitch[i]);
CNSTI4 1
ARGI4
ADDRGP4 $72
ARGP4
CNSTI4 144
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodeswitch
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 91
;91:	}
LABELV $69
line 89
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $71
ADDRLP4 0
INDIRI4
ADDRGP4 numnodeswitches
INDIRI4
LTI4 $68
line 92
;92:	BotAI_Print(PRT_FATAL, "");
CNSTI4 4
ARGI4
ADDRGP4 $73
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 93
;93:}
LABELV $66
endproc BotDumpNodeSwitches 40 20
export BotRecordNodeSwitch
proc BotRecordNodeSwitch 44 32
line 100
;94:
;95:/*
;96:==================
;97:BotRecordNodeSwitch
;98:==================
;99:*/
;100:void BotRecordNodeSwitch(bot_state_t *bs, char *node, char *str, char *s) {
line 103
;101:	char netname[MAX_NETNAME];
;102:
;103:	ClientName(bs->client, netname, sizeof(netname));
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
line 104
;104:	Com_sprintf(nodeswitch[numnodeswitches], 144, "%s at %2.1f entered %s: %s from %s\n", netname, FloatTime(), node, str, s);
ADDRLP4 36
CNSTI4 144
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 numnodeswitches
INDIRI4
MULI4
ADDRGP4 nodeswitch
ADDP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 $75
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 floattime
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 110
;105:#ifdef DEBUG
;106:	if (0) {
;107:		BotAI_Print(PRT_MESSAGE, "%s", nodeswitch[numnodeswitches]);
;108:	}
;109:#endif //DEBUG
;110:	numnodeswitches++;
ADDRLP4 40
ADDRGP4 numnodeswitches
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 111
;111:}
LABELV $74
endproc BotRecordNodeSwitch 44 32
lit
align 4
LABELV $77
byte 4 3245342720
byte 4 3245342720
byte 4 3221225472
align 4
LABELV $78
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
export BotGetAirGoal
code
proc BotGetAirGoal 140 28
line 118
;112:
;113:/*
;114:==================
;115:BotGetAirGoal
;116:==================
;117:*/
;118:int BotGetAirGoal(bot_state_t *bs, bot_goal_t *goal) {
line 120
;119:	bsp_trace_t bsptrace;
;120:	vec3_t end, mins = {-15, -15, -2}, maxs = {15, 15, 2};
ADDRLP4 96
ADDRGP4 $77
INDIRB
ASGNB 12
ADDRLP4 108
ADDRGP4 $78
INDIRB
ASGNB 12
line 124
;121:	int areanum;
;122:
;123:	//trace up until we hit solid
;124:	VectorCopy(bs->origin, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
INDIRB
ASGNB 12
line 125
;125:	end[2] += 1000;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1148846080
ADDF4
ASGNF4
line 126
;126:	BotAI_Trace(&bsptrace, bs->origin, mins, maxs, end, bs->entitynum, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 12
ARGP4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 65537
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 128
;127:	//trace down until we hit water
;128:	VectorCopy(bsptrace.endpos, end);
ADDRLP4 0
ADDRLP4 12+12
INDIRB
ASGNB 12
line 129
;129:	BotAI_Trace(&bsptrace, end, mins, maxs, bs->origin, bs->entitynum, CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA);
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 131
;130:	//if we found the water surface
;131:	if (bsptrace.fraction > 0) {
ADDRLP4 12+8
INDIRF4
CNSTF4 0
LEF4 $81
line 132
;132:		areanum = BotPointAreaNum(bsptrace.endpos);
ADDRLP4 12+12
ARGP4
ADDRLP4 132
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 120
ADDRLP4 132
INDIRI4
ASGNI4
line 133
;133:		if (areanum) {
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $85
line 134
;134:			VectorCopy(bsptrace.endpos, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 12+12
INDIRB
ASGNB 12
line 135
;135:			goal->origin[2] -= 2;
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 136
;136:			goal->areanum = areanum;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
line 137
;137:			goal->mins[0] = -15;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 3245342720
ASGNF4
line 138
;138:			goal->mins[1] = -15;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3245342720
ASGNF4
line 139
;139:			goal->mins[2] = -1;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3212836864
ASGNF4
line 140
;140:			goal->maxs[0] = 15;
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1097859072
ASGNF4
line 141
;141:			goal->maxs[1] = 15;
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1097859072
ASGNF4
line 142
;142:			goal->maxs[2] = 1;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1065353216
ASGNF4
line 143
;143:			goal->flags = GFL_AIR;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 128
ASGNI4
line 144
;144:			goal->number = 0;
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 145
;145:			goal->iteminfo = 0;
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 146
;146:			goal->entitynum = 0;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 147
;147:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $76
JUMPV
LABELV $85
line 149
;148:		}
;149:	}
LABELV $81
line 150
;150:	return qfalse;
CNSTI4 0
RETI4
LABELV $76
endproc BotGetAirGoal 140 28
export BotGoForAir
proc BotGoForAir 68 24
line 158
;151:}
;152:
;153:/*
;154:==================
;155:BotGoForAir
;156:==================
;157:*/
;158:int BotGoForAir(bot_state_t *bs, int tfl, bot_goal_t *ltg, float range) {
line 162
;159:	bot_goal_t goal;
;160:
;161:	//if the bot needs air
;162:	if (bs->lastair_time < FloatTime() - 6) {
ADDRFP4 0
INDIRP4
CNSTI4 10280
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
GEF4 $89
line 168
;163:		//
;164:#ifdef DEBUG
;165:		//BotAI_Print(PRT_MESSAGE, "going for air\n");
;166:#endif //DEBUG
;167:		//if we can find an air goal
;168:		if (BotGetAirGoal(bs, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 56
ADDRGP4 BotGetAirGoal
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $94
line 169
;169:			trap_BotPushGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotPushGoal
CALLV
pop
line 170
;170:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $88
JUMPV
line 172
;171:		}
;172:		else {
LABELV $93
line 174
;173:			//get a nearby goal outside the water
;174:			while(trap_BotChooseNBGItem(bs->gs, bs->origin, bs->inventory, tfl, ltg, range)) {
line 175
;175:				trap_BotGetTopGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotGetTopGoal
CALLI4
pop
line 177
;176:				//if the goal is not in water
;177:				if (!(trap_AAS_PointContents(goal.origin) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA))) {
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $96
line 178
;178:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $88
JUMPV
LABELV $96
line 180
;179:				}
;180:				trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 181
;181:			}
LABELV $94
line 174
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 5984
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 trap_BotChooseNBGItem
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $93
line 182
;182:			trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
line 183
;183:		}
line 184
;184:	}
LABELV $89
line 185
;185:	return qfalse;
CNSTI4 0
RETI4
LABELV $88
endproc BotGoForAir 68 24
export BotNearbyGoal
proc BotNearbyGoal 28 24
line 193
;186:}
;187:
;188:/*
;189:==================
;190:BotNearbyGoal
;191:==================
;192:*/
;193:int BotNearbyGoal(bot_state_t *bs, int tfl, bot_goal_t *ltg, float range) {
line 197
;194:	int ret;
;195:
;196:	//check if the bot should go for air
;197:	if (BotGoForAir(bs, tfl, ltg, range)) return qtrue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 BotGoForAir
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $99
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
LABELV $99
line 199
;198:
;199:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $101
line 200
;200:if(!NpcFactionProp(bs, NP_GOAL, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $103
line 201
;201:        return qfalse; // spbot no items
CNSTI4 0
RETI4
ADDRGP4 $98
JUMPV
LABELV $103
line 202
;202:}}
LABELV $101
line 204
;203:	// if the bot is carrying a flag or cubes
;204:	if (BotCTFCarryingFlag(bs)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $108
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $108
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $105
LABELV $108
line 208
;205:#ifdef MISSIONPACK
;206:		|| Bot1FCTFCarryingFlag(bs) || BotHarvesterCarryingCubes(bs)
;207:#endif
;208:		) {
line 210
;209:		//if the bot is just a few secs away from the base 
;210:		if (trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin,
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 10740
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 24
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 300
GEI4 $109
line 211
;211:				bs->teamgoal.areanum, TFL_DEFAULT) < 300) {
line 213
;212:			//make the range really small
;213:			range = 50;
ADDRFP4 12
CNSTF4 1112014848
ASGNF4
line 214
;214:		}
LABELV $109
line 215
;215:	}
LABELV $105
line 217
;216:	//
;217:	ret = trap_BotChooseNBGItem(bs->gs, bs->origin, bs->inventory, tfl, ltg, range);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 5984
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 trap_BotChooseNBGItem
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 228
;218:	/*
;219:	if (ret)
;220:	{
;221:		char buf[128];
;222:		//get the goal at the top of the stack
;223:		trap_BotGetTopGoal(bs->gs, &goal);
;224:		trap_BotGoalName(goal.number, buf, sizeof(buf));
;225:		BotAI_Print(PRT_MESSAGE, "%1.1f: new nearby goal %s\n", FloatTime(), buf);
;226:	}
;227:    */
;228:	return ret;
ADDRLP4 0
INDIRI4
RETI4
LABELV $98
endproc BotNearbyGoal 28 24
export BotReachedGoal
proc BotReachedGoal 40 16
line 236
;229:}
;230:
;231:/*
;232:==================
;233:BotReachedGoal
;234:==================
;235:*/
;236:int BotReachedGoal(bot_state_t *bs, bot_goal_t *goal) {
line 237
;237:	if (goal->flags & GFL_ITEM) {
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $112
line 239
;238:		//if touching the goal
;239:		if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $114
line 240
;240:			if (!(goal->flags & GFL_DROPPED)) {
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $116
line 241
;241:				trap_BotSetAvoidGoalTime(bs->gs, goal->number, -1);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
ADDRGP4 trap_BotSetAvoidGoalTime
CALLV
pop
line 242
;242:			}
LABELV $116
line 243
;243:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $111
JUMPV
LABELV $114
line 246
;244:		}
;245:		//if the goal isn't there
;246:		if (trap_BotItemGoalInVisButNotVisible(bs->entitynum, bs->eye, bs->viewangles, goal)) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_BotItemGoalInVisButNotVisible
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $118
line 258
;247:			/*
;248:			float avoidtime;
;249:			int t;
;250:
;251:			avoidtime = trap_BotAvoidGoalTime(bs->gs, goal->number);
;252:			if (avoidtime > 0) {
;253:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal->areanum, bs->tfl);
;254:				if ((float) t * 0.009 < avoidtime)
;255:					return qtrue;
;256:			}
;257:			*/
;258:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $111
JUMPV
LABELV $118
line 261
;259:		}
;260:		//if in the goal area and below or above the goal and not swimming
;261:		if (bs->areanum == goal->areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $113
line 262
;262:			if (bs->origin[0] > goal->origin[0] + goal->mins[0] && bs->origin[0] < goal->origin[0] + goal->maxs[0]) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 12
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDF4
LEF4 $113
ADDRLP4 12
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
GEF4 $113
line 263
;263:				if (bs->origin[1] > goal->origin[1] + goal->mins[1] && bs->origin[1] < goal->origin[1] + goal->maxs[1]) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDF4
LEF4 $113
ADDRLP4 24
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
GEF4 $113
line 264
;264:					if (!trap_AAS_Swimming(bs->origin)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_AAS_Swimming
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $113
line 265
;265:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $111
JUMPV
line 267
;266:					}
;267:				}
line 268
;268:			}
line 269
;269:		}
line 270
;270:	}
LABELV $112
line 271
;271:	else if (goal->flags & GFL_AIR) {
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $128
line 273
;272:		//if touching the goal
;273:		if (trap_BotTouchingGoal(bs->origin, goal)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $130
CNSTI4 1
RETI4
ADDRGP4 $111
JUMPV
LABELV $130
line 275
;274:		//if the bot got air
;275:		if (bs->lastair_time > FloatTime() - 1) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10280
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
LEF4 $129
CNSTI4 1
RETI4
ADDRGP4 $111
JUMPV
line 276
;276:	}
LABELV $128
line 277
;277:	else {
line 279
;278:		//if touching the goal
;279:		if (trap_BotTouchingGoal(bs->origin, goal)) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $134
CNSTI4 1
RETI4
ADDRGP4 $111
JUMPV
LABELV $134
line 280
;280:	}
LABELV $129
LABELV $113
line 281
;281:	return qfalse;
CNSTI4 0
RETI4
LABELV $111
endproc BotReachedGoal 40 16
export BotGetItemLongTermGoal
proc BotGetItemLongTermGoal 20 16
line 289
;282:}
;283:
;284:/*
;285:==================
;286:BotGetItemLongTermGoal
;287:==================
;288:*/
;289:int BotGetItemLongTermGoal(bot_state_t *bs, int tfl, bot_goal_t *goal) {
line 291
;290:	//if the bot has no goal
;291:	if (!trap_BotGetTopGoal(bs->gs, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $137
line 293
;292:		//BotAI_Print(PRT_MESSAGE, "no ltg on stack\n");
;293:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
CNSTF4 0
ASGNF4
line 294
;294:	}
ADDRGP4 $138
JUMPV
LABELV $137
line 296
;295:	//if the bot touches the current goal
;296:	else if (BotReachedGoal(bs, goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $139
line 297
;297:		BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 298
;298:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
CNSTF4 0
ASGNF4
line 299
;299:	}
LABELV $139
LABELV $138
line 301
;300:	//if it is time to find a new long term goal
;301:	if (bs->ltg_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $141
line 303
;302:		//pop the current goal from the stack
;303:		trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 307
;304:		//BotAI_Print(PRT_MESSAGE, "%s: choosing new ltg\n", ClientName(bs->client, netname, sizeof(netname)));
;305:		//choose a new goal
;306:		//BotAI_Print(PRT_MESSAGE, "%6.1f client %d: BotChooseLTGItem\n", FloatTime(), bs->client);
;307:		if (trap_BotChooseLTGItem(bs->gs, bs->origin, bs->inventory, tfl)) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 5984
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 trap_BotChooseLTGItem
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $143
line 315
;308:			/*
;309:			char buf[128];
;310:			//get the goal at the top of the stack
;311:			trap_BotGetTopGoal(bs->gs, goal);
;312:			trap_BotGoalName(goal->number, buf, sizeof(buf));
;313:			BotAI_Print(PRT_MESSAGE, "%1.1f: new long term goal %s\n", FloatTime(), buf);
;314:            */
;315:			bs->ltg_time = FloatTime() + 20;
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 316
;316:		}
ADDRGP4 $144
JUMPV
LABELV $143
line 317
;317:		else {//the bot gets sorta stuck with all the avoid timings, shouldn't happen though
line 326
;318:			//
;319:#ifdef DEBUG
;320:			char netname[128];
;321:
;322:			BotAI_Print(PRT_MESSAGE, "%s: no valid ltg (probably stuck)\n", ClientName(bs->client, netname, sizeof(netname)));
;323:#endif
;324:			//trap_BotDumpAvoidGoals(bs->gs);
;325:			//reset the avoid goals and the avoid reach
;326:			trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
line 327
;327:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 328
;328:		}
LABELV $144
line 330
;329:		//get the goal at the top of the stack
;330:		return trap_BotGetTopGoal(bs->gs, goal);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $136
JUMPV
LABELV $141
line 332
;331:	}
;332:	return qtrue;
CNSTI4 1
RETI4
LABELV $136
endproc BotGetItemLongTermGoal 20 16
export BotGetLongTermGoal
proc BotGetLongTermGoal 684 20
line 343
;333:}
;334:
;335:/*
;336:==================
;337:BotGetLongTermGoal
;338:
;339:we could also create a seperate AI node for every long term goal type
;340:however this saves us a lot of code
;341:==================
;342:*/
;343:int BotGetLongTermGoal(bot_state_t *bs, int tfl, int retreat, bot_goal_t *goal) {
line 352
;344:	vec3_t target, dir, dir2;
;345:	char netname[MAX_NETNAME];
;346:	char buf[MAX_MESSAGE_SIZE];
;347:	int areanum;
;348:	float croucher;
;349:	aas_entityinfo_t entinfo, botinfo;
;350:	bot_waypoint_t *wp;
;351:
;352:	if (bs->ltgtype == LTG_TEAMHELP && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 1
NEI4 $146
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $146
line 354
;353:		//check for bot typing status message
;354:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 620
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 620
INDIRF4
CNSTF4 0
EQF4 $148
ADDRLP4 620
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $148
line 355
;355:			BotAI_BotInitialChat(bs, "help_start", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 624
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $150
ARGP4
ADDRLP4 624
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 356
;356:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 357
;357:			BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_YES);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
ARGP4
ADDRLP4 632
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
ADDRGP4 $151
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 358
;358:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 359
;359:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 360
;360:		}
LABELV $148
line 362
;361:		//if trying to help the team mate for more than a minute
;362:		if (bs->teamgoal_time < FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $152
line 363
;363:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
LABELV $152
line 365
;364:		//if the team mate IS visible for quite some time
;365:		if (bs->teammatevisible_time < FloatTime() - 10) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
GEF4 $154
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
LABELV $154
line 367
;366:		//get entity information of the companion
;367:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 272
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 369
;368:		//if the team mate is visible
;369:		if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->teammate)) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 624
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 624
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 624
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 628
INDIRF4
CNSTF4 0
EQF4 $156
line 371
;370:			//if close just stand still there
;371:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 272+24
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 272+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 372
;372:			if (VectorLengthSquared(dir) < Square(100)) {
ADDRLP4 4
ARGP4
ADDRLP4 636
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 636
INDIRF4
CNSTF4 1176256512
GEF4 $157
line 373
;373:				trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 374
;374:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
line 376
;375:			}
;376:		}
LABELV $156
line 377
;377:		else {
line 379
;378:			//last time the bot was NOT visible
;379:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 380
;380:		}
LABELV $157
line 382
;381:		//if the entity information is valid (entity in PVS)
;382:		if (entinfo.valid) {
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $167
line 383
;383:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 272+24
ARGP4
ADDRLP4 632
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 632
INDIRI4
ASGNI4
line 384
;384:			if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 636
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 0
EQI4 $170
ADDRLP4 636
INDIRI4
ARGI4
ADDRLP4 640
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 0
EQI4 $170
line 386
;385:				//update team goal
;386:				bs->teamgoal.entitynum = bs->teammate;
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
INDIRP4
CNSTI4 10768
ADDP4
ADDRLP4 644
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ASGNI4
line 387
;387:				bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10740
ADDP4
ADDRLP4 448
INDIRI4
ASGNI4
line 388
;388:				VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ADDRLP4 272+24
INDIRB
ASGNB 12
line 389
;389:				VectorSet(bs->teamgoal.mins, -8, -8, -8);
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
line 390
;390:				VectorSet(bs->teamgoal.maxs, 8, 8, 8);
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
line 391
;391:			}
LABELV $170
line 392
;392:		}
LABELV $167
line 393
;393:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 394
;394:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $146
line 397
;395:	}
;396:	//if the bot accompanies someone
;397:	if (bs->ltgtype == LTG_TEAMACCOMPANY && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 2
NEI4 $173
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $173
line 399
;398:		//check for bot typing status message
;399:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 620
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 620
INDIRF4
CNSTF4 0
EQF4 $175
ADDRLP4 620
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $175
line 400
;400:			BotAI_BotInitialChat(bs, "accompany_start", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 624
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 624
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 401
;401:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 402
;402:			BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_YES);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 632
INDIRP4
ARGP4
ADDRLP4 632
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
ADDRGP4 $151
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 403
;403:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 404
;404:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 405
;405:		}
LABELV $175
line 407
;406:		//if accompanying the companion for 3 minutes
;407:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $178
line 408
;408:			BotAI_BotInitialChat(bs, "accompany_stop", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 624
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $180
ARGP4
ADDRLP4 624
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 409
;409:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 410
;410:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 411
;411:		}
LABELV $178
line 413
;412:		//get entity information of the companion
;413:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 272
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 415
;414:		//if the companion is visible
;415:		if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->teammate)) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 624
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 624
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 624
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 628
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 628
INDIRF4
CNSTF4 0
EQF4 $181
line 417
;416:			//update visible time
;417:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 418
;418:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 272+24
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 272+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 419
;419:			if (VectorLengthSquared(dir) < Square(bs->formation_dist)) {
ADDRLP4 4
ARGP4
ADDRLP4 636
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 640
ADDRFP4 0
INDIRP4
CNSTI4 11116
ADDP4
INDIRF4
ASGNF4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
ADDRLP4 640
INDIRF4
MULF4
GEF4 $190
line 423
;420:				//
;421:				// if the client being followed bumps into this bot then
;422:				// the bot should back up
;423:				BotEntityInfo(bs->entitynum, &botinfo);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 452
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 425
;424:				// if the followed client is not standing ontop of the bot
;425:				if (botinfo.origin[2] + botinfo.maxs[2] > entinfo.origin[2] + entinfo.mins[2]) {
ADDRLP4 452+24+8
INDIRF4
ADDRLP4 452+84+8
INDIRF4
ADDF4
ADDRLP4 272+24+8
INDIRF4
ADDRLP4 272+72+8
INDIRF4
ADDF4
LEF4 $192
line 427
;426:					// if the bounding boxes touch each other
;427:					if (botinfo.origin[0] + botinfo.maxs[0] > entinfo.origin[0] + entinfo.mins[0] - 4&&
ADDRLP4 644
CNSTF4 1082130432
ASGNF4
ADDRLP4 452+24
INDIRF4
ADDRLP4 452+84
INDIRF4
ADDF4
ADDRLP4 272+24
INDIRF4
ADDRLP4 272+72
INDIRF4
ADDF4
ADDRLP4 644
INDIRF4
SUBF4
LEF4 $202
ADDRLP4 452+24
INDIRF4
ADDRLP4 452+72
INDIRF4
ADDF4
ADDRLP4 272+24
INDIRF4
ADDRLP4 272+84
INDIRF4
ADDF4
ADDRLP4 644
INDIRF4
ADDF4
GEF4 $202
line 428
;428:						botinfo.origin[0] + botinfo.mins[0] < entinfo.origin[0] + entinfo.maxs[0] + 4) {
line 429
;429:						if (botinfo.origin[1] + botinfo.maxs[1] > entinfo.origin[1] + entinfo.mins[1] - 4 &&
ADDRLP4 648
CNSTF4 1082130432
ASGNF4
ADDRLP4 452+24+4
INDIRF4
ADDRLP4 452+84+4
INDIRF4
ADDF4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 272+72+4
INDIRF4
ADDF4
ADDRLP4 648
INDIRF4
SUBF4
LEF4 $212
ADDRLP4 452+24+4
INDIRF4
ADDRLP4 452+72+4
INDIRF4
ADDF4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 272+84+4
INDIRF4
ADDF4
ADDRLP4 648
INDIRF4
ADDF4
GEF4 $212
line 430
;430:							botinfo.origin[1] + botinfo.mins[1] < entinfo.origin[1] + entinfo.maxs[1] + 4) {
line 431
;431:							if (botinfo.origin[2] + botinfo.maxs[2] > entinfo.origin[2] + entinfo.mins[2] - 4 &&
ADDRLP4 652
CNSTF4 1082130432
ASGNF4
ADDRLP4 452+24+8
INDIRF4
ADDRLP4 452+84+8
INDIRF4
ADDF4
ADDRLP4 272+24+8
INDIRF4
ADDRLP4 272+72+8
INDIRF4
ADDF4
ADDRLP4 652
INDIRF4
SUBF4
LEF4 $230
ADDRLP4 452+24+8
INDIRF4
ADDRLP4 452+72+8
INDIRF4
ADDF4
ADDRLP4 272+24+8
INDIRF4
ADDRLP4 272+84+8
INDIRF4
ADDF4
ADDRLP4 652
INDIRF4
ADDF4
GEF4 $230
line 432
;432:								botinfo.origin[2] + botinfo.mins[2] < entinfo.origin[2] + entinfo.maxs[2] + 4) {
line 434
;433:								// if the followed client looks in the direction of this bot
;434:								AngleVectors(entinfo.angles, dir, NULL, NULL);
ADDRLP4 272+36
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 656
CNSTP4 0
ASGNP4
ADDRLP4 656
INDIRP4
ARGP4
ADDRLP4 656
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 435
;435:								dir[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 436
;436:								VectorNormalize(dir);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 438
;437:								//VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
;438:								VectorSubtract(bs->origin, entinfo.origin, dir2);
ADDRLP4 660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 608
ADDRLP4 660
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRLP4 272+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 608+4
ADDRLP4 660
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRLP4 272+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 608+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRLP4 272+24+8
INDIRF4
SUBF4
ASGNF4
line 439
;439:								VectorNormalize(dir2);
ADDRLP4 608
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 440
;440:								if (DotProduct(dir, dir2) > 0.7) {
ADDRLP4 4
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 608+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 608+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
LEF4 $257
line 442
;441:									// back up
;442:									BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 443
;443:									trap_BotMoveInDirection(bs->ms, dir2, 400, MOVE_WALK);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 608
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 444
;444:								}
LABELV $257
line 445
;445:							}
LABELV $230
line 446
;446:						}
LABELV $212
line 447
;447:					}
LABELV $202
line 448
;448:				}
LABELV $192
line 451
;449:				//check if the bot wants to crouch
;450:				//don't crouch if crouched less than 5 seconds ago
;451:				if (bs->attackcrouch_time < FloatTime() - 5) {
ADDRFP4 0
INDIRP4
CNSTI4 10224
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $263
line 452
;452:					croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 36
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 644
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 604
ADDRLP4 644
INDIRF4
ASGNF4
line 453
;453:					if (random() < bs->thinktime * croucher) {
ADDRLP4 648
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
ADDRLP4 604
INDIRF4
MULF4
GEF4 $265
line 454
;454:						bs->attackcrouch_time = FloatTime() + 5 + croucher * 15;
ADDRFP4 0
INDIRP4
CNSTI4 10224
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CNSTF4 1097859072
ADDRLP4 604
INDIRF4
MULF4
ADDF4
ASGNF4
line 455
;455:					}
LABELV $265
line 456
;456:				}
LABELV $263
line 458
;457:				//don't crouch when swimming
;458:				if (trap_AAS_Swimming(bs->origin)) bs->attackcrouch_time = FloatTime() - 1;
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 644
ADDRGP4 trap_AAS_Swimming
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $267
ADDRFP4 0
INDIRP4
CNSTI4 10224
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
LABELV $267
line 460
;459:				//if not arrived yet or arived some time ago
;460:				if (bs->arrive_time < FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $269
line 462
;461:					//if not arrived yet
;462:					if (!bs->arrive_time) {
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
INDIRF4
CNSTF4 0
NEF4 $271
line 463
;463:						trap_EA_Gesture(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Gesture
CALLV
pop
line 464
;464:						BotAI_BotInitialChat(bs, "accompany_arrive", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 648
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $273
ARGP4
ADDRLP4 648
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 465
;465:						trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 652
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 652
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 466
;466:						bs->arrive_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 467
;467:					}
ADDRGP4 $272
JUMPV
LABELV $271
line 469
;468:					//if the bot wants to crouch
;469:					else if (bs->attackcrouch_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10224
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $274
line 470
;470:						trap_EA_Crouch(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Crouch
CALLV
pop
line 471
;471:					}
ADDRGP4 $275
JUMPV
LABELV $274
line 473
;472:					//else do some model taunts
;473:					else if (random() < bs->thinktime * 0.05) {
ADDRLP4 648
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1028443341
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
MULF4
GEF4 $276
line 475
;474:						//do a gesture :)
;475:						trap_EA_Gesture(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Gesture
CALLV
pop
line 476
;476:					}
LABELV $276
LABELV $275
LABELV $272
line 477
;477:				}
LABELV $269
line 479
;478:				//if just arrived look at the companion
;479:				if (bs->arrive_time > FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $278
line 480
;480:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 272+24
INDIRF4
ADDRLP4 648
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 272+24+4
INDIRF4
ADDRLP4 648
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 272+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 481
;481:					vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 482
;482:					bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 652
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 652
INDIRP4
CNSTF4 1056964608
ADDRLP4 652
INDIRP4
INDIRF4
MULF4
ASGNF4
line 483
;483:				}
ADDRGP4 $279
JUMPV
LABELV $278
line 485
;484:				//else look strategically around for enemies
;485:				else if (random() < bs->thinktime * 0.8) {
ADDRLP4 648
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
MULF4
GEF4 $287
line 486
;486:					BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 487
;487:					VectorSubtract(target, bs->origin, dir);
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 592
INDIRF4
ADDRLP4 652
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 592+4
INDIRF4
ADDRLP4 652
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 592+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 488
;488:					vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 489
;489:					bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 656
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 656
INDIRP4
CNSTF4 1056964608
ADDRLP4 656
INDIRP4
INDIRF4
MULF4
ASGNF4
line 490
;490:				}
LABELV $287
LABELV $279
line 492
;491:				//check if the bot wants to go for air
;492:				if (BotGoForAir(bs, bs->tfl, &bs->teamgoal, 400)) {
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 652
INDIRP4
ARGP4
ADDRLP4 652
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRLP4 652
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 656
ADDRGP4 BotGoForAir
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $293
line 493
;493:					trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 499
;494:					//get the goal at the top of the stack
;495:					//trap_BotGetTopGoal(bs->gs, &tmpgoal);
;496:					//trap_BotGoalName(tmpgoal.number, buf, 144);
;497:					//BotAI_Print(PRT_MESSAGE, "new nearby goal %s\n", buf);
;498:					//time the bot gets to pick up the nearby goal item
;499:					bs->nbg_time = FloatTime() + 8;
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 500
;500:					AIEnter_Seek_NBG(bs, "BotLongTermGoal: go for air");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $295
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 501
;501:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $293
line 504
;502:				}
;503:				//
;504:				trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 505
;505:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $190
line 507
;506:			}
;507:		}
LABELV $181
line 509
;508:		//if the entity information is valid (entity in PVS)
;509:		if (entinfo.valid) {
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $296
line 510
;510:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 272+24
ARGP4
ADDRLP4 632
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 632
INDIRI4
ASGNI4
line 511
;511:			if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 636
ADDRLP4 448
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 0
EQI4 $299
ADDRLP4 636
INDIRI4
ARGI4
ADDRLP4 640
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 0
EQI4 $299
line 513
;512:				//update team goal
;513:				bs->teamgoal.entitynum = bs->teammate;
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
INDIRP4
CNSTI4 10768
ADDP4
ADDRLP4 644
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ASGNI4
line 514
;514:				bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10740
ADDP4
ADDRLP4 448
INDIRI4
ASGNI4
line 515
;515:				VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ADDRLP4 272+24
INDIRB
ASGNB 12
line 516
;516:				VectorSet(bs->teamgoal.mins, -8, -8, -8);
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
line 517
;517:				VectorSet(bs->teamgoal.maxs, 8, 8, 8);
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
line 518
;518:			}
LABELV $299
line 519
;519:		}
LABELV $296
line 521
;520:		//the goal the bot should go for
;521:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 523
;522:		//if the companion is NOT visible for too long
;523:		if (bs->teammatevisible_time < FloatTime() - 60) {
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
SUBF4
GEF4 $302
line 524
;524:			BotAI_BotInitialChat(bs, "accompany_cannotfind", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 632
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $304
ARGP4
ADDRLP4 632
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 525
;525:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 636
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 526
;526:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 528
;527:			// just to make sure the bot won't spam this message
;528:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 529
;529:		}
LABELV $302
line 530
;530:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $173
line 533
;531:	}
;532:	//
;533:	if (bs->ltgtype == LTG_DEFENDKEYAREA) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 3
NEI4 $305
line 534
;534:		if (trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin,
ADDRLP4 620
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 620
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 620
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 620
INDIRP4
CNSTI4 10740
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 624
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 624
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 10252
ADDP4
INDIRF4
LEF4 $307
line 535
;535:				bs->teamgoal.areanum, TFL_DEFAULT) > bs->defendaway_range) {
line 536
;536:			bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
CNSTF4 0
ASGNF4
line 537
;537:		}
LABELV $307
line 538
;538:	}
LABELV $305
line 540
;539:	//For double domination
;540:	if (bs->ltgtype == LTG_POINTA &&
ADDRLP4 620
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 620
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 16
NEI4 $309
ADDRLP4 620
INDIRP4
CNSTI4 10248
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $309
line 541
;541:				bs->defendaway_time < FloatTime()) {
line 543
;542:		//check for bot typing status message
;543:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 624
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 624
INDIRF4
CNSTF4 0
EQF4 $311
ADDRLP4 624
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $311
line 544
;544:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 545
;545:			BotAI_BotInitialChat(bs, "dd_start_pointa", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 546
;546:			trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 548
;547:			//BotVoiceChatOnly(bs, -1, VOICECHAT_ONDEFENSE);
;548:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 549
;549:		}
LABELV $311
line 551
;550:		//set the bot goal
;551:		memcpy(goal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 553
;552:		//if very close... go away for some time
;553:		VectorSubtract(goal->origin, bs->origin, dir);
ADDRLP4 628
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 628
INDIRP4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 628
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 632
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 554
;554:		if (VectorLengthSquared(dir) < Square(70)) {
ADDRLP4 4
ARGP4
ADDRLP4 636
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 636
INDIRF4
CNSTF4 1167663104
GEF4 $316
line 555
;555:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 556
;556:			bs->defendaway_time = FloatTime() + 3 + 3 * random();
ADDRLP4 640
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 644
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 644
INDIRF4
ADDF4
ADDRLP4 644
INDIRF4
ADDRLP4 640
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 557
;557:			if (BotHasPersistantPowerupAndWeapon(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 BotHasPersistantPowerupAndWeapon
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 0
EQI4 $318
line 558
;558:				bs->defendaway_range = 100;
ADDRFP4 0
INDIRP4
CNSTI4 10252
ADDP4
CNSTF4 1120403456
ASGNF4
line 559
;559:			}
ADDRGP4 $319
JUMPV
LABELV $318
line 560
;560:			else {
line 561
;561:				bs->defendaway_range = 350;
ADDRFP4 0
INDIRP4
CNSTI4 10252
ADDP4
CNSTF4 1135542272
ASGNF4
line 562
;562:			}
LABELV $319
line 563
;563:		}
LABELV $316
line 564
;564:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $309
line 566
;565:	}
;566:	if (bs->ltgtype == LTG_POINTB &&
ADDRLP4 624
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 624
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 17
NEI4 $320
ADDRLP4 624
INDIRP4
CNSTI4 10248
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $320
line 567
;567:				bs->defendaway_time < FloatTime()) {
line 569
;568:		//check for bot typing status message
;569:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 628
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 628
INDIRF4
CNSTF4 0
EQF4 $322
ADDRLP4 628
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $322
line 570
;570:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 571
;571:			BotAI_BotInitialChat(bs, "dd_start_pointb", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $324
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 572
;572:			trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 574
;573:			//BotVoiceChatOnly(bs, -1, VOICECHAT_ONDEFENSE);
;574:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 575
;575:		}
LABELV $322
line 577
;576:		//set the bot goal
;577:		memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 579
;578:		//if very close... go away for some time
;579:		VectorSubtract(goal->origin, bs->origin, dir);
ADDRLP4 632
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 632
INDIRP4
INDIRF4
ADDRLP4 636
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 632
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 636
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 580
;580:		if (VectorLengthSquared(dir) < Square(70)) {
ADDRLP4 4
ARGP4
ADDRLP4 640
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 640
INDIRF4
CNSTF4 1167663104
GEF4 $327
line 581
;581:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 582
;582:			bs->defendaway_time = FloatTime() + 3 + 3 * random();
ADDRLP4 644
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 648
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 648
INDIRF4
ADDF4
ADDRLP4 648
INDIRF4
ADDRLP4 644
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 583
;583:			if (BotHasPersistantPowerupAndWeapon(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotHasPersistantPowerupAndWeapon
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
CNSTI4 0
EQI4 $329
line 584
;584:				bs->defendaway_range = 100;
ADDRFP4 0
INDIRP4
CNSTI4 10252
ADDP4
CNSTF4 1120403456
ASGNF4
line 585
;585:			}
ADDRGP4 $330
JUMPV
LABELV $329
line 586
;586:			else {
line 587
;587:				bs->defendaway_range = 350;
ADDRFP4 0
INDIRP4
CNSTI4 10252
ADDP4
CNSTF4 1135542272
ASGNF4
line 588
;588:			}
LABELV $330
line 589
;589:		}
LABELV $327
line 590
;590:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $320
line 624
;591:	}
;592:        //if (bs->ltgtype == LTG_DOMHOLD &&
;593:	//			bs->defendaway_time < FloatTime()) {
;594:            //check for bot typing status message
;595:		/*if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
;596:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
;597:			BotAI_BotInitialChat(bs, "dd_start_pointb", buf, NULL);
;598:			trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;599:			//BotVoiceChatOnly(bs, -1, VOICECHAT_ONDEFENSE);
;600:			bs->teammessage_time = 0;
;601:		}*/
;602:		//set the bot goal
;603:	//	memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
;604:		//if very close... go away for some time
;605:	//	VectorSubtract(goal->origin, bs->origin, dir);
;606:	//	if (VectorLengthSquared(dir) < Square(30)) {
;607:			/*trap_BotResetAvoidReach(bs->ms);
;608:			bs->defendaway_time = FloatTime() + 3 + 3 * random();
;609:			if (BotHasPersistantPowerupAndWeapon(bs)) {
;610:				bs->defendaway_range = 100;
;611:			}
;612:			else {
;613:				bs->defendaway_range = 350;
;614:			}*/
;615:          //              memcpy(&bs->teamgoal, &dom_points_bot[((rand()) % (level.domination_points_count))], sizeof(bot_goal_t));
;616:            //            BotAlternateRoute(bs, &bs->teamgoal);
;617:              //          BotSetTeamStatus(bs);
;618:
;619:		//}
;620:		//return qtrue;
;621:
;622:       // }
;623:	//if defending a key area
;624:	if (bs->ltgtype == LTG_DEFENDKEYAREA && !retreat &&
ADDRLP4 628
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 628
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 3
NEI4 $331
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $331
ADDRLP4 628
INDIRP4
CNSTI4 10248
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $331
line 625
;625:				bs->defendaway_time < FloatTime()) {
line 627
;626:		//check for bot typing status message
;627:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 632
INDIRF4
CNSTF4 0
EQF4 $333
ADDRLP4 632
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $333
line 628
;628:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 629
;629:			BotAI_BotInitialChat(bs, "defend_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $335
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 630
;630:			trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 631
;631:			BotVoiceChatOnly(bs, -1, VOICECHAT_ONDEFENSE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $336
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 632
;632:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 633
;633:		}
LABELV $333
line 635
;634:		//set the bot goal
;635:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 637
;636:		//stop after 2 minutes
;637:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $337
line 638
;638:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 639
;639:			BotAI_BotInitialChat(bs, "defend_stop", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $339
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 640
;640:			trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 641
;641:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 642
;642:		}
LABELV $337
line 644
;643:		//if very close... go away for some time
;644:		VectorSubtract(goal->origin, bs->origin, dir);
ADDRLP4 636
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 636
INDIRP4
INDIRF4
ADDRLP4 640
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 636
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 640
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 645
;645:		if (VectorLengthSquared(dir) < Square(70)) {
ADDRLP4 4
ARGP4
ADDRLP4 644
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 644
INDIRF4
CNSTF4 1167663104
GEF4 $342
line 646
;646:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 647
;647:			bs->defendaway_time = FloatTime() + 3 + 3 * random();
ADDRLP4 648
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 652
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 652
INDIRF4
ADDF4
ADDRLP4 652
INDIRF4
ADDRLP4 648
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 648
;648:			if (BotHasPersistantPowerupAndWeapon(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 656
ADDRGP4 BotHasPersistantPowerupAndWeapon
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $344
line 649
;649:				bs->defendaway_range = 100;
ADDRFP4 0
INDIRP4
CNSTI4 10252
ADDP4
CNSTF4 1120403456
ASGNF4
line 650
;650:			}
ADDRGP4 $345
JUMPV
LABELV $344
line 651
;651:			else {
line 652
;652:				bs->defendaway_range = 350;
ADDRFP4 0
INDIRP4
CNSTI4 10252
ADDP4
CNSTF4 1135542272
ASGNF4
line 653
;653:			}
LABELV $345
line 654
;654:		}
LABELV $342
line 655
;655:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $331
line 658
;656:	}
;657:	//going to kill someone
;658:	if (bs->ltgtype == LTG_KILL && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 11
NEI4 $346
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $346
line 660
;659:		//check for bot typing status message
;660:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 632
INDIRF4
CNSTF4 0
EQF4 $348
ADDRLP4 632
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $348
line 661
;661:			EasyClientName(bs->teamgoal.entitynum, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 662
;662:			BotAI_BotInitialChat(bs, "kill_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 663
;663:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 636
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 664
;664:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 665
;665:		}
LABELV $348
line 667
;666:		//
;667:		if (bs->lastkilledplayer == bs->teamgoal.entitynum) {
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 10096
ADDP4
INDIRI4
ADDRLP4 636
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
NEI4 $351
line 668
;668:			EasyClientName(bs->teamgoal.entitynum, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 669
;669:			BotAI_BotInitialChat(bs, "kill_done", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $353
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 670
;670:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 640
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 671
;671:			bs->lastkilledplayer = -1;
ADDRFP4 0
INDIRP4
CNSTI4 10096
ADDP4
CNSTI4 -1
ASGNI4
line 672
;672:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 673
;673:		}
LABELV $351
line 675
;674:		//
;675:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $354
line 676
;676:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 677
;677:		}
LABELV $354
line 679
;678:		//just roam around
;679:		return BotGetItemLongTermGoal(bs, tfl, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 BotGetItemLongTermGoal
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
RETI4
ADDRGP4 $145
JUMPV
LABELV $346
line 682
;680:	}
;681:	//get an item
;682:	if (bs->ltgtype == LTG_GETITEM && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 10
NEI4 $356
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $356
line 684
;683:		//check for bot typing status message
;684:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 632
INDIRF4
CNSTF4 0
EQF4 $358
ADDRLP4 632
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $358
line 685
;685:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 686
;686:			BotAI_BotInitialChat(bs, "getitem_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $360
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 687
;687:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 636
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 688
;688:			BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_YES);
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
ARGP4
ADDRLP4 640
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
ADDRGP4 $151
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 689
;689:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 690
;690:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 691
;691:		}
LABELV $358
line 693
;692:		//set the bot goal
;693:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 695
;694:		//stop after some time
;695:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $361
line 696
;696:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 697
;697:		}
LABELV $361
line 699
;698:		//
;699:		if (trap_BotItemGoalInVisButNotVisible(bs->entitynum, bs->eye, bs->viewangles, goal)) {
ADDRLP4 636
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 636
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 636
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 trap_BotItemGoalInVisButNotVisible
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 0
EQI4 $363
line 700
;700:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 701
;701:			BotAI_BotInitialChat(bs, "getitem_notthere", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $365
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 702
;702:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 644
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 703
;703:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 704
;704:		}
ADDRGP4 $364
JUMPV
LABELV $363
line 705
;705:		else if (BotReachedGoal(bs, goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $366
line 706
;706:			trap_BotGoalName(bs->teamgoal.number, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 707
;707:			BotAI_BotInitialChat(bs, "getitem_gotit", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $368
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 708
;708:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 648
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 648
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 709
;709:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 710
;710:		}
LABELV $366
LABELV $364
line 711
;711:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $356
line 714
;712:	}
;713:	//if camping somewhere
;714:	if ((bs->ltgtype == LTG_CAMP || bs->ltgtype == LTG_CAMPORDER) && !retreat) {
ADDRLP4 632
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 632
INDIRI4
CNSTI4 7
EQI4 $371
ADDRLP4 632
INDIRI4
CNSTI4 8
NEI4 $369
LABELV $371
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $369
line 716
;715:		//check for bot typing status message
;716:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 636
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 636
INDIRF4
CNSTF4 0
EQF4 $372
ADDRLP4 636
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $372
line 717
;717:			if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 8
NEI4 $374
line 718
;718:				BotAI_BotInitialChat(bs, "camp_start", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 640
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 640
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 719
;719:				trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 644
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 720
;720:				BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_YES);
ADDRLP4 648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 648
INDIRP4
ARGP4
ADDRLP4 648
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
ADDRGP4 $151
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 721
;721:				trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 722
;722:			}
LABELV $374
line 723
;723:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 724
;724:		}
LABELV $372
line 726
;725:		//set the bot goal
;726:		memcpy(goal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 728
;727:		//
;728:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $377
line 729
;729:			if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 8
NEI4 $379
line 730
;730:				BotAI_BotInitialChat(bs, "camp_stop", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $381
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 731
;731:				trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 640
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 732
;732:			}
LABELV $379
line 733
;733:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 734
;734:		}
LABELV $377
line 736
;735:		//if really near the camp spot
;736:		VectorSubtract(goal->origin, bs->origin, dir);
ADDRLP4 640
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 640
INDIRP4
INDIRF4
ADDRLP4 644
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 640
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 644
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 737
;737:		if (VectorLengthSquared(dir) < Square(60))
ADDRLP4 4
ARGP4
ADDRLP4 648
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 648
INDIRF4
CNSTF4 1163984896
GEF4 $384
line 738
;738:		{
line 740
;739:			//if not arrived yet
;740:			if (!bs->arrive_time) {
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
INDIRF4
CNSTF4 0
NEF4 $386
line 741
;741:				if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 8
NEI4 $388
line 742
;742:					BotAI_BotInitialChat(bs, "camp_arrive", EasyClientName(bs->teammate, netname, sizeof(netname)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 652
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 652
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 743
;743:					trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 656
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 656
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 656
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 744
;744:					BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_INPOSITION);
ADDRLP4 660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 660
INDIRP4
ARGP4
ADDRLP4 660
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
ADDRGP4 $391
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 745
;745:				}
LABELV $388
line 746
;746:				bs->arrive_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 747
;747:			}
LABELV $386
line 749
;748:			//look strategically around for enemies
;749:			if (random() < bs->thinktime * 0.8) {
ADDRLP4 652
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
MULF4
GEF4 $392
line 750
;750:				BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 751
;751:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 656
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 592
INDIRF4
ADDRLP4 656
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 592+4
INDIRF4
ADDRLP4 656
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 592+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 752
;752:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 753
;753:				bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 660
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 660
INDIRP4
CNSTF4 1056964608
ADDRLP4 660
INDIRP4
INDIRF4
MULF4
ASGNF4
line 754
;754:			}
LABELV $392
line 757
;755:			//check if the bot wants to crouch
;756:			//don't crouch if crouched less than 5 seconds ago
;757:			if (bs->attackcrouch_time < FloatTime() - 5) {
ADDRFP4 0
INDIRP4
CNSTI4 10224
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $398
line 758
;758:				croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 36
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 656
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 604
ADDRLP4 656
INDIRF4
ASGNF4
line 759
;759:				if (random() < bs->thinktime * croucher) {
ADDRLP4 660
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
ADDRLP4 604
INDIRF4
MULF4
GEF4 $400
line 760
;760:					bs->attackcrouch_time = FloatTime() + 5 + croucher * 15;
ADDRFP4 0
INDIRP4
CNSTI4 10224
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CNSTF4 1097859072
ADDRLP4 604
INDIRF4
MULF4
ADDF4
ASGNF4
line 761
;761:				}
LABELV $400
line 762
;762:			}
LABELV $398
line 764
;763:			//if the bot wants to crouch
;764:			if (bs->attackcrouch_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10224
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $402
line 765
;765:				trap_EA_Crouch(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Crouch
CALLV
pop
line 766
;766:			}
LABELV $402
line 768
;767:			//don't crouch when swimming
;768:			if (trap_AAS_Swimming(bs->origin)) bs->attackcrouch_time = FloatTime() - 1;
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 656
ADDRGP4 trap_AAS_Swimming
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $404
ADDRFP4 0
INDIRP4
CNSTI4 10224
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
LABELV $404
line 770
;769:			//make sure the bot is not gonna drown
;770:			if (trap_PointContents(bs->eye,bs->entitynum) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)) {
ADDRLP4 660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 660
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 660
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 664
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $406
line 771
;771:				if (bs->ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 8
NEI4 $408
line 772
;772:					BotAI_BotInitialChat(bs, "camp_stop", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $381
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 773
;773:					trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 668
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 668
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 668
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 775
;774:					//
;775:					if (bs->lastgoal_ltgtype == LTG_CAMPORDER) {
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
CNSTI4 8
NEI4 $410
line 776
;776:						bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
CNSTI4 0
ASGNI4
line 777
;777:					}
LABELV $410
line 778
;778:				}
LABELV $408
line 779
;779:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 780
;780:			}
LABELV $406
line 782
;781:			//
;782:			if (bs->camp_range > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10292
ADDP4
INDIRF4
CNSTF4 0
LEF4 $412
line 784
;783:				//FIXME: move around a bit
;784:			}
LABELV $412
line 786
;785:			//
;786:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 787
;787:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $384
line 789
;788:		}
;789:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $369
line 792
;790:	}
;791:	//patrolling along several waypoints
;792:	if (bs->ltgtype == LTG_PATROL && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 9
NEI4 $414
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $414
line 794
;793:		//check for bot typing status message
;794:		if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 636
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 636
INDIRF4
CNSTF4 0
EQF4 $416
ADDRLP4 636
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $416
line 795
;795:			strcpy(buf, "");
ADDRLP4 16
ARGP4
ADDRGP4 $73
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 796
;796:			for (wp = bs->patrolpoints; wp; wp = wp->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $421
JUMPV
LABELV $418
line 797
;797:				strcat(buf, wp->name);
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 798
;798:				if (wp->next) strcat(buf, " to ");
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $422
ADDRLP4 16
ARGP4
ADDRGP4 $424
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $422
line 799
;799:			}
LABELV $419
line 796
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $421
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $418
line 800
;800:			BotAI_BotInitialChat(bs, "patrol_start", buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $425
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 801
;801:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 640
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 802
;802:			BotVoiceChatOnly(bs, bs->decisionmaker, VOICECHAT_YES);
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
INDIRP4
ARGP4
ADDRLP4 644
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
ADDRGP4 $151
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 803
;803:			trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 804
;804:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 805
;805:		}
LABELV $416
line 807
;806:		//
;807:		if (!bs->curpatrolpoint) {
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $426
line 808
;808:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 809
;809:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $426
line 812
;810:		}
;811:		//if the bot touches the current goal
;812:		if (trap_BotTouchingGoal(bs->origin, &bs->curpatrolpoint->goal)) {
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 640
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 644
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $428
line 815
;813:			
;814:			//if bot should wait at current waypoint (will break away when shot at)
;815:			if (bs->curpatrolpoint->wait) {
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CNSTF4 0
EQF4 $430
line 816
;816:				if (!bs->curpatrolpoint->stoptime) {
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
NEI4 $432
line 817
;817:					bs->curpatrolpoint->stoptime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CNSTI4 96
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 818
;818:				}
LABELV $432
line 820
;819:
;820:				if (bs->curpatrolpoint->wait == -1000 || level.time < bs->curpatrolpoint->stoptime + bs->curpatrolpoint->wait)
ADDRLP4 648
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
ASGNP4
ADDRLP4 652
ADDRLP4 648
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 652
INDIRF4
CNSTF4 3296329728
EQF4 $438
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 648
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 652
INDIRF4
ADDF4
GEF4 $435
LABELV $438
line 821
;821:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $435
line 822
;822:			}
LABELV $430
line 824
;823:			
;824:			bs->curpatrolpoint->stoptime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 825
;825:			if (bs->patrolflags & PATROL_LOOP) {
ADDRFP4 0
INDIRP4
CNSTI4 13188
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $439
line 826
;826:				if (bs->curpatrolpoint->next)
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $441
line 827
;827:					bs->curpatrolpoint = bs->curpatrolpoint->next;
ADDRLP4 648
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
ASGNP4
ADDRLP4 648
INDIRP4
ADDRLP4 648
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $440
JUMPV
LABELV $441
line 829
;828:				else
;829:					bs->curpatrolpoint = bs->patrolpoints;
ADDRLP4 652
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 652
INDIRP4
CNSTI4 13184
ADDP4
ADDRLP4 652
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
ASGNP4
line 830
;830:			} else {	// back and forth mode
ADDRGP4 $440
JUMPV
LABELV $439
line 831
;831:			if (bs->patrolflags & PATROL_BACK) {
ADDRFP4 0
INDIRP4
CNSTI4 13188
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $443
line 832
;832:				if (bs->curpatrolpoint->prev) {
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
line 833
;833:					bs->curpatrolpoint = bs->curpatrolpoint->prev;
ADDRLP4 648
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
ASGNP4
ADDRLP4 648
INDIRP4
ADDRLP4 648
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ASGNP4
line 834
;834:				}
ADDRGP4 $444
JUMPV
LABELV $445
line 835
;835:				else {
line 836
;836:					bs->curpatrolpoint = bs->curpatrolpoint->next;
ADDRLP4 648
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
ASGNP4
ADDRLP4 648
INDIRP4
ADDRLP4 648
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
line 837
;837:					bs->patrolflags &= ~PATROL_BACK;
ADDRLP4 652
ADDRFP4 0
INDIRP4
CNSTI4 13188
ADDP4
ASGNP4
ADDRLP4 652
INDIRP4
ADDRLP4 652
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 838
;838:				}
line 839
;839:			}
ADDRGP4 $444
JUMPV
LABELV $443
line 840
;840:			else {
line 841
;841:				if (bs->curpatrolpoint->next) {
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $447
line 842
;842:					bs->curpatrolpoint = bs->curpatrolpoint->next;
ADDRLP4 648
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
ASGNP4
ADDRLP4 648
INDIRP4
ADDRLP4 648
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
line 843
;843:				}
ADDRGP4 $448
JUMPV
LABELV $447
line 844
;844:				else {
line 845
;845:					bs->curpatrolpoint = bs->curpatrolpoint->prev;
ADDRLP4 648
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
ASGNP4
ADDRLP4 648
INDIRP4
ADDRLP4 648
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ASGNP4
line 846
;846:					bs->patrolflags |= PATROL_BACK;
ADDRLP4 652
ADDRFP4 0
INDIRP4
CNSTI4 13188
ADDP4
ASGNP4
ADDRLP4 652
INDIRP4
ADDRLP4 652
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 847
;847:				}
LABELV $448
line 848
;848:			}
LABELV $444
line 849
;849:		}
LABELV $440
line 851
;850:		//stop after 5 minutes
;851:		if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $449
line 852
;852:			BotAI_BotInitialChat(bs, "patrol_stop", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $451
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 853
;853:			trap_BotEnterChat(bs->cs, bs->decisionmaker, CHAT_TELL);
ADDRLP4 648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 648
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 648
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 854
;854:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 855
;855:		}
LABELV $449
line 856
;856:}
LABELV $428
line 857
;857:		if (!bs->curpatrolpoint) {
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $452
line 858
;858:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 859
;859:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $452
line 861
;860:		}
;861:		memcpy(goal, &bs->curpatrolpoint->goal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 13184
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 862
;862:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $414
line 864
;863:	}
;864:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 636
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 636
INDIRI4
CNSTI4 5
EQI4 $456
ADDRLP4 636
INDIRI4
CNSTI4 10
NEI4 $454
LABELV $456
line 866
;865:		//if going for enemy flag
;866:		if (bs->ltgtype == LTG_GETFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 4
NEI4 $457
line 868
;867:			//check for bot typing status message
;868:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 640
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 640
INDIRF4
CNSTF4 0
EQF4 $459
ADDRLP4 640
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $459
line 869
;869:				BotAI_BotInitialChat(bs, "captureflag_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $461
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 870
;870:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 871
;871:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONGETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $462
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 872
;872:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 873
;873:			}
LABELV $459
line 875
;874:			//
;875:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 644
ADDRLP4 648
INDIRI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 1
EQI4 $466
ADDRLP4 644
INDIRI4
CNSTI4 2
EQI4 $467
ADDRGP4 $463
JUMPV
LABELV $466
line 876
;876:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $464
JUMPV
LABELV $467
line 877
;877:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $464
JUMPV
LABELV $463
line 878
;878:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $464
line 881
;879:			}
;880:			//if touching the flag
;881:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 656
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $468
line 883
;882:				// make sure the bot knows the flag isn't there anymore
;883:				switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 664
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 660
ADDRLP4 664
INDIRI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 1
EQI4 $473
ADDRLP4 660
INDIRI4
CNSTI4 2
EQI4 $474
ADDRGP4 $470
JUMPV
LABELV $473
line 884
;884:					case TEAM_RED: bs->blueflagstatus = 1; break;
ADDRFP4 0
INDIRP4
CNSTI4 11060
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $471
JUMPV
LABELV $474
line 885
;885:					case TEAM_BLUE: bs->redflagstatus = 1; break;
ADDRFP4 0
INDIRP4
CNSTI4 11056
ADDP4
CNSTI4 1
ASGNI4
LABELV $470
LABELV $471
line 887
;886:				}
;887:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 888
;888:			}
LABELV $468
line 890
;889:			//stop after 3 minutes
;890:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $475
line 891
;891:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 892
;892:			}
LABELV $475
line 893
;893:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 894
;894:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $457
line 897
;895:		}
;896:		//if rushing to the base
;897:		if (bs->ltgtype == LTG_RUSHBASE && bs->rushbaseaway_time < FloatTime()) {
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 5
NEI4 $477
ADDRLP4 640
INDIRP4
CNSTI4 10256
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $477
line 898
;898:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 644
ADDRLP4 648
INDIRI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 1
EQI4 $482
ADDRLP4 644
INDIRI4
CNSTI4 2
EQI4 $483
ADDRGP4 $479
JUMPV
LABELV $482
line 899
;899:				case TEAM_RED: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $480
JUMPV
LABELV $483
line 900
;900:				case TEAM_BLUE: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $480
JUMPV
LABELV $479
line 901
;901:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $480
line 904
;902:			}
;903:			//if not carrying the flag anymore
;904:			if (!BotCTFCarryingFlag(bs)) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 656
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
NEI4 $484
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
LABELV $484
line 906
;905:			//quit rushing after 2 minutes
;906:			if (bs->teamgoal_time < FloatTime()) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $486
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
LABELV $486
line 908
;907:			//if touching the base flag the bot should loose the enemy flag
;908:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 660
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
EQI4 $488
line 911
;909:				//if the bot is still carrying the enemy flag then the
;910:				//base flag is gone, now just walk near the base a bit
;911:				if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 664
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 0
EQI4 $490
line 912
;912:					trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 913
;913:					bs->rushbaseaway_time = FloatTime() + 5 + 10 * random();
ADDRLP4 668
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CNSTF4 1092616192
ADDRLP4 668
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 915
;914:					//FIXME: add chat to tell the others to get back the flag
;915:				}
ADDRGP4 $491
JUMPV
LABELV $490
line 916
;916:				else {
line 917
;917:					bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 918
;918:				}
LABELV $491
line 919
;919:			}
LABELV $488
line 920
;920:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 921
;921:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $477
line 924
;922:		}
;923:		//returning flag
;924:		if (bs->ltgtype == LTG_RETURNFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 6
NEI4 $455
line 926
;925:			//check for bot typing status message
;926:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 644
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 644
INDIRF4
CNSTF4 0
EQF4 $494
ADDRLP4 644
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $494
line 927
;927:				BotAI_BotInitialChat(bs, "returnflag_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $496
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 928
;928:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 929
;929:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONRETURNFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $497
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 930
;930:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 931
;931:			}
LABELV $494
line 933
;932:			//
;933:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 648
ADDRLP4 652
INDIRI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 1
EQI4 $501
ADDRLP4 648
INDIRI4
CNSTI4 2
EQI4 $502
ADDRGP4 $498
JUMPV
LABELV $501
line 934
;934:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $499
JUMPV
LABELV $502
line 935
;935:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $499
JUMPV
LABELV $498
line 936
;936:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $499
line 939
;937:			}
;938:			//if touching the flag
;939:			if (trap_BotTouchingGoal(bs->origin, goal)) bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 660
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
EQI4 $503
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
LABELV $503
line 941
;940:			//stop after 3 minutes
;941:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $505
line 942
;942:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 943
;943:			}
LABELV $505
line 944
;944:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 945
;945:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
line 947
;946:		}
;947:	}
LABELV $454
line 948
;948:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $507
line 949
;949:		if (bs->ltgtype == LTG_GETFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 4
NEI4 $509
line 951
;950:			//check for bot typing status message
;951:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 640
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 640
INDIRF4
CNSTF4 0
EQF4 $511
ADDRLP4 640
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $511
line 952
;952:				BotAI_BotInitialChat(bs, "captureflag_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $461
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 953
;953:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 954
;954:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONGETFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $462
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 955
;955:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 956
;956:			}
LABELV $511
line 957
;957:			memcpy(goal, &ctf_neutralflag, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_neutralflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 959
;958:			//if touching the flag
;959:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 644
INDIRI4
CNSTI4 0
EQI4 $513
line 960
;960:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 961
;961:			}
LABELV $513
line 963
;962:			//stop after 3 minutes
;963:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $515
line 964
;964:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 965
;965:			}
LABELV $515
line 966
;966:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $509
line 969
;967:		}
;968:		//if rushing to the base
;969:		if (bs->ltgtype == LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 5
NEI4 $517
line 970
;970:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 640
ADDRLP4 644
INDIRI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 1
EQI4 $522
ADDRLP4 640
INDIRI4
CNSTI4 2
EQI4 $523
ADDRGP4 $519
JUMPV
LABELV $522
line 971
;971:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $520
JUMPV
LABELV $523
line 972
;972:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $520
JUMPV
LABELV $519
line 973
;973:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $520
line 976
;974:			}
;975:			//if not carrying the flag anymore
;976:			if (!Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
CNSTI4 0
NEI4 $524
line 977
;977:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 978
;978:			}
LABELV $524
line 980
;979:			//quit rushing after 2 minutes
;980:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $526
line 981
;981:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 982
;982:			}
LABELV $526
line 984
;983:			//if touching the base flag the bot should loose the enemy flag
;984:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 656
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $528
line 985
;985:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 986
;986:			}
LABELV $528
line 987
;987:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 988
;988:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $517
line 991
;989:		}
;990:		//attack the enemy base
;991:		if (bs->ltgtype == LTG_ATTACKENEMYBASE &&
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 13
NEI4 $530
ADDRLP4 640
INDIRP4
CNSTI4 10260
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $530
line 992
;992:				bs->attackaway_time < FloatTime()) {
line 994
;993:			//check for bot typing status message
;994:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 644
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 644
INDIRF4
CNSTF4 0
EQF4 $532
ADDRLP4 644
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $532
line 995
;995:				BotAI_BotInitialChat(bs, "attackenemybase_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 996
;996:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 997
;997:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONOFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $535
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 998
;998:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 999
;999:			}
LABELV $532
line 1000
;1000:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 648
ADDRLP4 652
INDIRI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 1
EQI4 $539
ADDRLP4 648
INDIRI4
CNSTI4 2
EQI4 $540
ADDRGP4 $536
JUMPV
LABELV $539
line 1001
;1001:				case TEAM_RED: memcpy(goal, &ctf_blueflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $537
JUMPV
LABELV $540
line 1002
;1002:				case TEAM_BLUE: memcpy(goal, &ctf_redflag, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $537
JUMPV
LABELV $536
line 1003
;1003:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $537
line 1006
;1004:			}
;1005:			//quit rushing after 2 minutes
;1006:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $541
line 1007
;1007:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1008
;1008:			}
LABELV $541
line 1010
;1009:			//if touching the base flag the bot should loose the enemy flag
;1010:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 660
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
EQI4 $543
line 1011
;1011:				bs->attackaway_time = FloatTime() + 2 + 5 * random();
ADDRLP4 664
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10260
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDF4
CNSTF4 1084227584
ADDRLP4 664
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
;1012:			}
LABELV $543
line 1013
;1013:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $530
line 1016
;1014:		}
;1015:		//returning flag
;1016:		if (bs->ltgtype == LTG_RETURNFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 6
NEI4 $508
line 1018
;1017:			//check for bot typing status message
;1018:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 644
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 644
INDIRF4
CNSTF4 0
EQF4 $547
ADDRLP4 644
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $547
line 1019
;1019:				BotAI_BotInitialChat(bs, "returnflag_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $496
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1020
;1020:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 1021
;1021:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONRETURNFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $497
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 1022
;1022:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 1023
;1023:			}
LABELV $547
line 1025
;1024:			//
;1025:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $549
line 1026
;1026:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1027
;1027:			}
LABELV $549
line 1029
;1028:			//just roam around
;1029:			return BotGetItemLongTermGoal(bs, tfl, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 648
ADDRGP4 BotGetItemLongTermGoal
CALLI4
ASGNI4
ADDRLP4 648
INDIRI4
RETI4
ADDRGP4 $145
JUMPV
line 1031
;1030:		}
;1031:	}
LABELV $507
line 1032
;1032:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $551
line 1033
;1033:		if (bs->ltgtype == LTG_ATTACKENEMYBASE &&
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 13
NEI4 $552
ADDRLP4 640
INDIRP4
CNSTI4 10260
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $552
line 1034
;1034:				bs->attackaway_time < FloatTime()) {
line 1037
;1035:
;1036:			//check for bot typing status message
;1037:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 644
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 644
INDIRF4
CNSTF4 0
EQF4 $555
ADDRLP4 644
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $555
line 1038
;1038:				BotAI_BotInitialChat(bs, "attackenemybase_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1039
;1039:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 1040
;1040:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONOFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $535
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 1041
;1041:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 1042
;1042:			}
LABELV $555
line 1043
;1043:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 648
ADDRLP4 652
INDIRI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 1
EQI4 $560
ADDRLP4 648
INDIRI4
CNSTI4 2
EQI4 $561
ADDRGP4 $557
JUMPV
LABELV $560
line 1044
;1044:				case TEAM_RED: memcpy(goal, &blueobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $558
JUMPV
LABELV $561
line 1045
;1045:				case TEAM_BLUE: memcpy(goal, &redobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $558
JUMPV
LABELV $557
line 1046
;1046:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $558
line 1049
;1047:			}
;1048:			//if the bot no longer wants to attack the obelisk
;1049:			if (BotFeelingBad(bs) > 50) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 660
ADDRGP4 BotFeelingBad
CALLF4
ASGNF4
ADDRLP4 660
INDIRF4
CNSTF4 1112014848
LEF4 $562
line 1050
;1050:				return BotGetItemLongTermGoal(bs, tfl, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 664
ADDRGP4 BotGetItemLongTermGoal
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
RETI4
ADDRGP4 $145
JUMPV
LABELV $562
line 1053
;1051:			}
;1052:			//if touching the obelisk
;1053:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 664
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 0
EQI4 $564
line 1054
;1054:				bs->attackaway_time = FloatTime() + 3 + 5 * random();
ADDRLP4 668
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10260
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
ADDF4
CNSTF4 1084227584
ADDRLP4 668
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1055
;1055:			}
LABELV $564
line 1057
;1056:			// or very close to the obelisk
;1057:			VectorSubtract(bs->origin, goal->origin, dir);
ADDRLP4 668
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 668
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRLP4 672
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 668
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRLP4 672
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1058
;1058:			if (VectorLengthSquared(dir) < Square(60)) {
ADDRLP4 4
ARGP4
ADDRLP4 676
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 676
INDIRF4
CNSTF4 1163984896
GEF4 $568
line 1059
;1059:				bs->attackaway_time = FloatTime() + 3 + 5 * random();
ADDRLP4 680
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10260
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
ADDF4
CNSTF4 1084227584
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
line 1060
;1060:			}
LABELV $568
line 1062
;1061:			//quit rushing after 2 minutes
;1062:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $570
line 1063
;1063:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1064
;1064:			}
LABELV $570
line 1065
;1065:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 1067
;1066:			//just move towards the obelisk
;1067:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
line 1069
;1068:		}
;1069:	}
LABELV $551
line 1070
;1070:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $572
line 1072
;1071:		//if rushing to the base
;1072:		if (bs->ltgtype == LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 5
NEI4 $574
line 1073
;1073:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 644
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 640
ADDRLP4 644
INDIRI4
ASGNI4
ADDRLP4 640
INDIRI4
CNSTI4 1
EQI4 $579
ADDRLP4 640
INDIRI4
CNSTI4 2
EQI4 $580
ADDRGP4 $576
JUMPV
LABELV $579
line 1074
;1074:				case TEAM_RED: memcpy(goal, &blueobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $577
JUMPV
LABELV $580
line 1075
;1075:				case TEAM_BLUE: memcpy(goal, &redobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $577
JUMPV
LABELV $576
line 1076
;1076:				default: BotGoHarvest(bs); return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $577
line 1079
;1077:			}
;1078:			//if not carrying any cubes
;1079:			if (!BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
CNSTI4 0
NEI4 $581
line 1080
;1080:				BotGoHarvest(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
line 1081
;1081:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $581
line 1084
;1082:			}
;1083:			//quit rushing after 2 minutes
;1084:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $583
line 1085
;1085:				BotGoHarvest(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
line 1086
;1086:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $583
line 1089
;1087:			}
;1088:			//if touching the base flag the bot should loose the enemy flag
;1089:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 656
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $585
line 1090
;1090:				BotGoHarvest(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
line 1091
;1091:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $585
line 1093
;1092:			}
;1093:			BotAlternateRoute(bs, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 BotAlternateRoute
CALLP4
pop
line 1094
;1094:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $574
line 1097
;1095:		}
;1096:		//attack the enemy base
;1097:		if (bs->ltgtype == LTG_ATTACKENEMYBASE &&
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 640
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 13
NEI4 $587
ADDRLP4 640
INDIRP4
CNSTI4 10260
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $587
line 1098
;1098:				bs->attackaway_time < FloatTime()) {
line 1100
;1099:			//check for bot typing status message
;1100:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 644
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 644
INDIRF4
CNSTF4 0
EQF4 $589
ADDRLP4 644
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $589
line 1101
;1101:				BotAI_BotInitialChat(bs, "attackenemybase_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1102
;1102:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 1103
;1103:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONOFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $535
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 1104
;1104:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 1105
;1105:			}
LABELV $589
line 1106
;1106:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 648
ADDRLP4 652
INDIRI4
ASGNI4
ADDRLP4 648
INDIRI4
CNSTI4 1
EQI4 $594
ADDRLP4 648
INDIRI4
CNSTI4 2
EQI4 $595
ADDRGP4 $591
JUMPV
LABELV $594
line 1107
;1107:				case TEAM_RED: memcpy(goal, &blueobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $592
JUMPV
LABELV $595
line 1108
;1108:				case TEAM_BLUE: memcpy(goal, &redobelisk, sizeof(bot_goal_t)); break;
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $592
JUMPV
LABELV $591
line 1109
;1109:				default: bs->ltgtype = 0; return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $592
line 1112
;1110:			}
;1111:			//quit rushing after 2 minutes
;1112:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $596
line 1113
;1113:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1114
;1114:			}
LABELV $596
line 1116
;1115:			//if touching the base flag the bot should loose the enemy flag
;1116:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 660
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
EQI4 $598
line 1117
;1117:				bs->attackaway_time = FloatTime() + 2 + 5 * random();
ADDRLP4 664
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10260
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDF4
CNSTF4 1084227584
ADDRLP4 664
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1118
;1118:			}
LABELV $598
line 1119
;1119:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $587
line 1122
;1120:		}
;1121:		//harvest cubes
;1122:		if (bs->ltgtype == LTG_HARVEST &&
ADDRLP4 644
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 12
NEI4 $600
ADDRLP4 644
INDIRP4
CNSTI4 10264
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $600
line 1123
;1123:			bs->harvestaway_time < FloatTime()) {
line 1125
;1124:			//check for bot typing status message
;1125:			if (bs->teammessage_time && bs->teammessage_time < FloatTime()) {
ADDRLP4 648
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
INDIRF4
ASGNF4
ADDRLP4 648
INDIRF4
CNSTF4 0
EQF4 $602
ADDRLP4 648
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $602
line 1126
;1126:				BotAI_BotInitialChat(bs, "harvest_start", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $604
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1127
;1127:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 1128
;1128:				BotVoiceChatOnly(bs, -1, VOICECHAT_ONOFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $535
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 1129
;1129:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 1130
;1130:			}
LABELV $602
line 1131
;1131:			memcpy(goal, &neutralobelisk, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 neutralobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1133
;1132:			//
;1133:			if (bs->teamgoal_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $605
line 1134
;1134:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1135
;1135:			}
LABELV $605
line 1137
;1136:			//
;1137:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 652
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 652
INDIRI4
CNSTI4 0
EQI4 $607
line 1138
;1138:				bs->harvestaway_time = FloatTime() + 4 + 3 * random();
ADDRLP4 656
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10264
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1082130432
ADDF4
CNSTF4 1077936128
ADDRLP4 656
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1139
;1139:			}
LABELV $607
line 1140
;1140:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $600
line 1142
;1141:		}
;1142:	}
LABELV $572
LABELV $552
LABELV $508
LABELV $455
line 1145
;1143:
;1144:	//normal goal stuff
;1145:	return BotGetItemLongTermGoal(bs, tfl, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 640
ADDRGP4 BotGetItemLongTermGoal
CALLI4
ASGNI4
ADDRLP4 640
INDIRI4
RETI4
LABELV $145
endproc BotGetLongTermGoal 684 20
export BotLongTermGoal
proc BotLongTermGoal 448 20
line 1153
;1146:}
;1147:
;1148:/*
;1149:==================
;1150:BotLongTermGoal
;1151:==================
;1152:*/
;1153:int BotLongTermGoal(bot_state_t *bs, int tfl, int retreat, bot_goal_t *goal) {
line 1163
;1154:	aas_entityinfo_t entinfo;
;1155:	char teammate[MAX_MESSAGE_SIZE];
;1156:	float squaredist;
;1157:	int areanum;
;1158:	vec3_t dir;
;1159:
;1160:	//FIXME: also have air long term goals?
;1161:	//
;1162:	//if the bot is leading someone and not retreating
;1163:	if (bs->lead_time > 0 && !retreat) {
ADDRFP4 0
INDIRP4
CNSTI4 10988
ADDP4
INDIRF4
CNSTF4 0
LEF4 $610
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $610
line 1164
;1164:		if (bs->lead_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10988
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $612
line 1165
;1165:			BotAI_BotInitialChat(bs, "lead_stop", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10928
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 416
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $614
ARGP4
ADDRLP4 416
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1166
;1166:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 420
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 420
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 420
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1167
;1167:			bs->lead_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10988
ADDP4
CNSTF4 0
ASGNF4
line 1168
;1168:			return BotGetLongTermGoal(bs, tfl, retreat, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 424
ADDRGP4 BotGetLongTermGoal
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
RETI4
ADDRGP4 $609
JUMPV
LABELV $612
line 1171
;1169:		}
;1170:		//
;1171:		if (bs->leadmessage_time < 0 && -bs->leadmessage_time < FloatTime()) {
ADDRLP4 416
ADDRFP4 0
INDIRP4
CNSTI4 10996
ADDP4
INDIRF4
ASGNF4
ADDRLP4 416
INDIRF4
CNSTF4 0
GEF4 $615
ADDRLP4 416
INDIRF4
NEGF4
ADDRGP4 floattime
INDIRF4
GEF4 $615
line 1172
;1172:			BotAI_BotInitialChat(bs, "followme", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10928
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 420
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $617
ARGP4
ADDRLP4 420
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1173
;1173:			trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 424
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 424
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 424
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1174
;1174:			bs->leadmessage_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10996
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1175
;1175:		}
LABELV $615
line 1177
;1176:		//get entity information of the companion
;1177:		BotEntityInfo(bs->lead_teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 10928
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1179
;1178:		//
;1179:		if (entinfo.valid) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $618
line 1180
;1180:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 12+24
ARGP4
ADDRLP4 420
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 412
ADDRLP4 420
INDIRI4
ASGNI4
line 1181
;1181:			if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 424
ADDRLP4 412
INDIRI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $621
ADDRLP4 424
INDIRI4
ARGI4
ADDRLP4 428
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 428
INDIRI4
CNSTI4 0
EQI4 $621
line 1183
;1182:				//update team goal
;1183:				bs->lead_teamgoal.entitynum = bs->lead_teammate;
ADDRLP4 432
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 432
INDIRP4
CNSTI4 10972
ADDP4
ADDRLP4 432
INDIRP4
CNSTI4 10928
ADDP4
INDIRI4
ASGNI4
line 1184
;1184:				bs->lead_teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10944
ADDP4
ADDRLP4 412
INDIRI4
ASGNI4
line 1185
;1185:				VectorCopy(entinfo.origin, bs->lead_teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 10932
ADDP4
ADDRLP4 12+24
INDIRB
ASGNB 12
line 1186
;1186:				VectorSet(bs->lead_teamgoal.mins, -8, -8, -8);
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
line 1187
;1187:				VectorSet(bs->lead_teamgoal.maxs, 8, 8, 8);
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
line 1188
;1188:			}
LABELV $621
line 1189
;1189:		}
LABELV $618
line 1191
;1190:		//if the team mate is visible
;1191:		if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->lead_teammate)) {
ADDRLP4 420
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 420
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 420
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 420
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 420
INDIRP4
CNSTI4 10928
ADDP4
INDIRI4
ARGI4
ADDRLP4 424
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 424
INDIRF4
CNSTF4 0
EQF4 $624
line 1192
;1192:			bs->leadvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10992
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1193
;1193:		}
LABELV $624
line 1195
;1194:		//if the team mate is not visible for 1 seconds
;1195:		if (bs->leadvisible_time < FloatTime() - 1) {
ADDRFP4 0
INDIRP4
CNSTI4 10992
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $626
line 1196
;1196:			bs->leadbackup_time = FloatTime() + 2;
ADDRFP4 0
INDIRP4
CNSTI4 11000
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1197
;1197:		}
LABELV $626
line 1199
;1198:		//distance towards the team mate
;1199:		VectorSubtract(bs->origin, bs->lead_teamgoal.origin, dir);
ADDRLP4 428
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 428
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRLP4 428
INDIRP4
CNSTI4 10932
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 428
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRLP4 428
INDIRP4
CNSTI4 10936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 432
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 432
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRLP4 432
INDIRP4
CNSTI4 10940
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1200
;1200:		squaredist = VectorLengthSquared(dir);
ADDRLP4 0
ARGP4
ADDRLP4 436
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 408
ADDRLP4 436
INDIRF4
ASGNF4
line 1202
;1201:		//if backing up towards the team mate
;1202:		if (bs->leadbackup_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 11000
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $630
line 1203
;1203:			if (bs->leadmessage_time < FloatTime() - 20) {
ADDRFP4 0
INDIRP4
CNSTI4 10996
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1101004800
SUBF4
GEF4 $632
line 1204
;1204:				BotAI_BotInitialChat(bs, "followme", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10928
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 440
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $617
ARGP4
ADDRLP4 440
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1205
;1205:				trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 444
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 444
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 444
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1206
;1206:				bs->leadmessage_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10996
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1207
;1207:			}
LABELV $632
line 1209
;1208:			//if very close to the team mate
;1209:			if (squaredist < Square(100)) {
ADDRLP4 408
INDIRF4
CNSTF4 1176256512
GEF4 $634
line 1210
;1210:				bs->leadbackup_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11000
ADDP4
CNSTF4 0
ASGNF4
line 1211
;1211:			}
LABELV $634
line 1213
;1212:			//the bot should go back to the team mate
;1213:			memcpy(goal, &bs->lead_teamgoal, sizeof(bot_goal_t));
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10932
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1214
;1214:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $609
JUMPV
LABELV $630
line 1216
;1215:		}
;1216:		else {
line 1218
;1217:			//if quite distant from the team mate
;1218:			if (squaredist > Square(500)) {
ADDRLP4 408
INDIRF4
CNSTF4 1215570944
LEF4 $636
line 1219
;1219:				if (bs->leadmessage_time < FloatTime() - 20) {
ADDRFP4 0
INDIRP4
CNSTI4 10996
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1101004800
SUBF4
GEF4 $638
line 1220
;1220:					BotAI_BotInitialChat(bs, "followme", EasyClientName(bs->lead_teammate, teammate, sizeof(teammate)), NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10928
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 440
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $617
ARGP4
ADDRLP4 440
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1221
;1221:					trap_BotEnterChat(bs->cs, bs->teammate, CHAT_TELL);
ADDRLP4 444
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 444
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 444
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1222
;1222:					bs->leadmessage_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10996
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1223
;1223:				}
LABELV $638
line 1225
;1224:				//look at the team mate
;1225:				VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 440
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+24
INDIRF4
ADDRLP4 440
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+24+4
INDIRF4
ADDRLP4 440
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1226
;1226:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1227
;1227:				bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 444
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 444
INDIRP4
CNSTF4 1056964608
ADDRLP4 444
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1229
;1228:				//just wait for the team mate
;1229:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $609
JUMPV
LABELV $636
line 1231
;1230:			}
;1231:		}
line 1232
;1232:	}
LABELV $610
line 1233
;1233:	return BotGetLongTermGoal(bs, tfl, retreat, goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 416
ADDRGP4 BotGetLongTermGoal
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
RETI4
LABELV $609
endproc BotLongTermGoal 448 20
export AIEnter_Intermission
proc AIEnter_Intermission 8 16
line 1241
;1234:}
;1235:
;1236:/*
;1237:==================
;1238:AIEnter_Intermission
;1239:==================
;1240:*/
;1241:void AIEnter_Intermission(bot_state_t *bs, char *s) {
line 1242
;1242:	BotRecordNodeSwitch(bs, "intermission", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $648
ARGP4
ADDRGP4 $73
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1244
;1243:	//reset the bot state
;1244:	BotResetState(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 1246
;1245:	//check for end level chat
;1246:	if (BotChat_EndLevel(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotChat_EndLevel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $649
line 1247
;1247:		trap_BotEnterChat(bs->cs, 0, bs->chatto);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 10156
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1248
;1248:	}
LABELV $649
line 1249
;1249:	bs->ainode = AINode_Intermission;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Intermission
ASGNP4
line 1250
;1250:}
LABELV $647
endproc AIEnter_Intermission 8 16
export AINode_Intermission
proc AINode_Intermission 16 8
line 1257
;1251:
;1252:/*
;1253:==================
;1254:AINode_Intermission
;1255:==================
;1256:*/
;1257:int AINode_Intermission(bot_state_t *bs) {
line 1259
;1258:	//if the intermission ended
;1259:	if (!BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $652
line 1260
;1260:		if (BotChat_StartLevel(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotChat_StartLevel
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $654
line 1261
;1261:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 10200
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 1262
;1262:		}
ADDRGP4 $655
JUMPV
LABELV $654
line 1263
;1263:		else {
line 1264
;1264:			bs->stand_time = FloatTime() + 2;
ADDRFP4 0
INDIRP4
CNSTI4 10200
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1265
;1265:		}
LABELV $655
line 1266
;1266:		AIEnter_Stand(bs, "intermission: chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $656
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 1267
;1267:	}
LABELV $652
line 1268
;1268:	return qtrue;
CNSTI4 1
RETI4
LABELV $651
endproc AINode_Intermission 16 8
export AIEnter_Observer
proc AIEnter_Observer 0 16
line 1276
;1269:}
;1270:
;1271:/*
;1272:==================
;1273:AIEnter_Observer
;1274:==================
;1275:*/
;1276:void AIEnter_Observer(bot_state_t *bs, char *s) {
line 1277
;1277:	BotRecordNodeSwitch(bs, "observer", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $658
ARGP4
ADDRGP4 $73
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1279
;1278:	//reset the bot state
;1279:	BotResetState(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 1280
;1280:	bs->ainode = AINode_Observer;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Observer
ASGNP4
line 1281
;1281:}
LABELV $657
endproc AIEnter_Observer 0 16
export AINode_Observer
proc AINode_Observer 4 8
line 1288
;1282:
;1283:/*
;1284:==================
;1285:AINode_Observer
;1286:==================
;1287:*/
;1288:int AINode_Observer(bot_state_t *bs) {
line 1290
;1289:	//if the bot left observer mode
;1290:	if (!BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $660
line 1291
;1291:		AIEnter_Stand(bs, "observer: left observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $662
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 1292
;1292:	}
LABELV $660
line 1293
;1293:	return qtrue;
CNSTI4 1
RETI4
LABELV $659
endproc AINode_Observer 4 8
export AIEnter_Stand
proc AIEnter_Stand 0 16
line 1301
;1294:}
;1295:
;1296:/*
;1297:==================
;1298:AIEnter_Stand
;1299:==================
;1300:*/
;1301:void AIEnter_Stand(bot_state_t *bs, char *s) {
line 1302
;1302:	BotRecordNodeSwitch(bs, "stand", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $664
ARGP4
ADDRGP4 $73
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1303
;1303:	bs->standfindenemy_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 10216
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1304
;1304:	bs->ainode = AINode_Stand;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Stand
ASGNP4
line 1305
;1305:}
LABELV $663
endproc AIEnter_Stand 0 16
export AINode_Stand
proc AINode_Stand 24 12
line 1312
;1306:
;1307:/*
;1308:==================
;1309:AINode_Stand
;1310:==================
;1311:*/
;1312:int AINode_Stand(bot_state_t *bs) {
line 1315
;1313:
;1314:	//if the bot's health decreased
;1315:	if (bs->lastframe_health > bs->inventory[INVENTORY_HEALTH]) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 10148
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
LEI4 $666
line 1316
;1316:		if (BotChat_HitTalking(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotChat_HitTalking
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $668
line 1317
;1317:			bs->standfindenemy_time = FloatTime() + BotChatTime(bs) + 0.1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 10216
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1318
;1318:			bs->stand_time = FloatTime() + BotChatTime(bs) + 0.1;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 10200
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1319
;1319:		}
LABELV $668
line 1320
;1320:	}
LABELV $666
line 1321
;1321:	if (bs->standfindenemy_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10216
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $670
line 1322
;1322:		if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 4
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $672
line 1323
;1323:			AIEnter_Battle_Fight(bs, "stand: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $674
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1324
;1324:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $665
JUMPV
LABELV $672
line 1326
;1325:		}
;1326:		bs->standfindenemy_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 10216
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1327
;1327:	}
LABELV $670
line 1329
;1328:	// put up chat icon
;1329:	trap_EA_Talk(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Talk
CALLV
pop
line 1331
;1330:	// when done standing
;1331:	if (bs->stand_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10200
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $675
line 1332
;1332:		trap_BotEnterChat(bs->cs, 0, bs->chatto);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 10156
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1333
;1333:		AIEnter_Seek_LTG(bs, "stand: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $677
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1334
;1334:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $665
JUMPV
LABELV $675
line 1337
;1335:	}
;1336:	//
;1337:	return qtrue;
CNSTI4 1
RETI4
LABELV $665
endproc AINode_Stand 24 12
export AIEnter_Respawn
proc AIEnter_Respawn 12 16
line 1345
;1338:}
;1339:
;1340:/*
;1341:==================
;1342:AIEnter_Respawn
;1343:==================
;1344:*/
;1345:void AIEnter_Respawn(bot_state_t *bs, char *s) {
line 1346
;1346:	BotRecordNodeSwitch(bs, "respawn", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $679
ARGP4
ADDRGP4 $73
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1348
;1347:	//reset some states
;1348:	trap_BotResetMoveState(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetMoveState
CALLV
pop
line 1349
;1349:	trap_BotResetGoalState(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetGoalState
CALLV
pop
line 1350
;1350:	trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
line 1351
;1351:	trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1353
;1352:	//if the bot wants to chat
;1353:	if (BotChat_Death(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotChat_Death
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $680
line 1354
;1354:		bs->respawn_time = FloatTime() + BotChatTime(bs);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 10180
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 1355
;1355:		bs->respawnchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1356
;1356:	}
ADDRGP4 $681
JUMPV
LABELV $680
line 1357
;1357:	else {
line 1358
;1358:		bs->respawn_time = FloatTime() + 1 + random();
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10180
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDF4
ASGNF4
line 1359
;1359:		bs->respawnchat_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10184
ADDP4
CNSTF4 0
ASGNF4
line 1360
;1360:	}
LABELV $681
line 1362
;1361:	//set respawn state
;1362:	bs->respawn_wait = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10088
ADDP4
CNSTI4 0
ASGNI4
line 1363
;1363:	bs->ainode = AINode_Respawn;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Respawn
ASGNP4
line 1364
;1364:}
LABELV $678
endproc AIEnter_Respawn 12 16
export AINode_Respawn
proc AINode_Respawn 4 12
line 1371
;1365:
;1366:/*
;1367:==================
;1368:AINode_Respawn
;1369:==================
;1370:*/
;1371:int AINode_Respawn(bot_state_t *bs) {
line 1373
;1372:	// if waiting for the actual respawn
;1373:	if (bs->respawn_wait) {
ADDRFP4 0
INDIRP4
CNSTI4 10088
ADDP4
INDIRI4
CNSTI4 0
EQI4 $683
line 1374
;1374:		if (!BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $685
line 1375
;1375:			AIEnter_Seek_LTG(bs, "respawn: respawned");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $687
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1376
;1376:		}
ADDRGP4 $684
JUMPV
LABELV $685
line 1377
;1377:		else {
line 1378
;1378:			trap_EA_Respawn(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Respawn
CALLV
pop
line 1379
;1379:		}
line 1380
;1380:	}
ADDRGP4 $684
JUMPV
LABELV $683
line 1381
;1381:	else if (bs->respawn_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $688
line 1383
;1382:		// wait until respawned
;1383:		bs->respawn_wait = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10088
ADDP4
CNSTI4 1
ASGNI4
line 1385
;1384:		// elementary action respawn
;1385:		trap_EA_Respawn(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Respawn
CALLV
pop
line 1387
;1386:		//
;1387:		if (bs->respawnchat_time) {
ADDRFP4 0
INDIRP4
CNSTI4 10184
ADDP4
INDIRF4
CNSTF4 0
EQF4 $690
line 1388
;1388:			trap_BotEnterChat(bs->cs, 0, bs->chatto);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 10156
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1389
;1389:			bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
CNSTI4 -1
ASGNI4
line 1390
;1390:		}
LABELV $690
line 1391
;1391:	}
LABELV $688
LABELV $684
line 1392
;1392:	if (bs->respawnchat_time && bs->respawnchat_time < FloatTime() - 0.5) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 10184
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $692
ADDRLP4 0
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
SUBF4
GEF4 $692
line 1393
;1393:		trap_EA_Talk(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Talk
CALLV
pop
line 1394
;1394:	}
LABELV $692
line 1396
;1395:	//
;1396:	return qtrue;
CNSTI4 1
RETI4
LABELV $682
endproc AINode_Respawn 4 12
export BotSelectActivateWeapon
proc BotSelectActivateWeapon 88 0
line 1404
;1397:}
;1398:
;1399:/*
;1400:==================
;1401:BotSelectActivateWeapon
;1402:==================
;1403:*/
;1404:int BotSelectActivateWeapon(bot_state_t *bs) {
line 1406
;1405:	//
;1406:	if (bs->inventory[INVENTORY_MACHINEGUN] > 0 && bs->inventory[INVENTORY_BULLETS] > 0)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6008
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $695
ADDRLP4 0
INDIRP4
CNSTI4 6060
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $695
line 1407
;1407:		return WEAPONINDEX_MACHINEGUN;
CNSTI4 2
RETI4
ADDRGP4 $694
JUMPV
LABELV $695
line 1408
;1408:	else if (bs->inventory[INVENTORY_SHOTGUN] > 0 && bs->inventory[INVENTORY_SHELLS] > 0)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 6004
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $697
ADDRLP4 8
INDIRP4
CNSTI4 6056
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $697
line 1409
;1409:		return WEAPONINDEX_SHOTGUN;
CNSTI4 3
RETI4
ADDRGP4 $694
JUMPV
LABELV $697
line 1410
;1410:	else if (bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $699
ADDRLP4 16
INDIRP4
CNSTI4 6068
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $699
line 1411
;1411:		return WEAPONINDEX_PLASMAGUN;
CNSTI4 8
RETI4
ADDRGP4 $694
JUMPV
LABELV $699
line 1412
;1412:	else if (bs->inventory[INVENTORY_LIGHTNING] > 0 && bs->inventory[INVENTORY_LIGHTNINGAMMO] > 0)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $701
ADDRLP4 24
INDIRP4
CNSTI4 6072
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $701
line 1413
;1413:		return WEAPONINDEX_LIGHTNING;
CNSTI4 6
RETI4
ADDRGP4 $694
JUMPV
LABELV $701
line 1414
;1414:	else if (bs->inventory[INVENTORY_CHAINGUN] > 0 && bs->inventory[INVENTORY_BELT] > 0)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 6052
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $703
ADDRLP4 32
INDIRP4
CNSTI4 6096
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $703
line 1415
;1415:		return WEAPONINDEX_CHAINGUN;
CNSTI4 13
RETI4
ADDRGP4 $694
JUMPV
LABELV $703
line 1416
;1416:	else if (bs->inventory[INVENTORY_NAILGUN] > 0 && bs->inventory[INVENTORY_NAILS] > 0)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 6044
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $705
ADDRLP4 40
INDIRP4
CNSTI4 6088
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $705
line 1417
;1417:		return WEAPONINDEX_NAILGUN;
CNSTI4 11
RETI4
ADDRGP4 $694
JUMPV
LABELV $705
line 1418
;1418:	else if (bs->inventory[INVENTORY_PROXLAUNCHER] > 0 && bs->inventory[INVENTORY_MINES] > 0)
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 6048
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $707
ADDRLP4 48
INDIRP4
CNSTI4 6092
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $707
line 1419
;1419:		return WEAPONINDEX_PROXLAUNCHER;
CNSTI4 12
RETI4
ADDRGP4 $694
JUMPV
LABELV $707
line 1420
;1420:	else if (bs->inventory[INVENTORY_GRENADELAUNCHER] > 0 && bs->inventory[INVENTORY_GRENADES] > 0)
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 6012
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $709
ADDRLP4 56
INDIRP4
CNSTI4 6064
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $709
line 1421
;1421:		return WEAPONINDEX_GRENADE_LAUNCHER;
CNSTI4 4
RETI4
ADDRGP4 $694
JUMPV
LABELV $709
line 1422
;1422:	else if (bs->inventory[INVENTORY_RAILGUN] > 0 && bs->inventory[INVENTORY_SLUGS] > 0)
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 6024
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $711
ADDRLP4 64
INDIRP4
CNSTI4 6080
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $711
line 1423
;1423:		return WEAPONINDEX_RAILGUN;
CNSTI4 7
RETI4
ADDRGP4 $694
JUMPV
LABELV $711
line 1424
;1424:	else if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0)
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $713
ADDRLP4 72
INDIRP4
CNSTI4 6076
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $713
line 1425
;1425:		return WEAPONINDEX_ROCKET_LAUNCHER;
CNSTI4 5
RETI4
ADDRGP4 $694
JUMPV
LABELV $713
line 1426
;1426:	else if (bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0)
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 6036
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
LEI4 $715
ADDRLP4 80
INDIRP4
CNSTI4 6084
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
LEI4 $715
line 1427
;1427:		return WEAPONINDEX_BFG;
CNSTI4 9
RETI4
ADDRGP4 $694
JUMPV
LABELV $715
line 1428
;1428:	else {
line 1429
;1429:		return -1;
CNSTI4 -1
RETI4
LABELV $694
endproc BotSelectActivateWeapon 88 0
export BotClearPath
proc BotClearPath 396 28
line 1440
;1430:	}
;1431:}
;1432:
;1433:/*
;1434:==================
;1435:BotClearPath
;1436:
;1437: try to deactivate obstacles like proximity mines on the bot's path
;1438:==================
;1439:*/
;1440:void BotClearPath(bot_state_t *bs, bot_moveresult_t *moveresult) {
line 1448
;1441:	int i, bestmine;
;1442:	float dist, bestdist;
;1443:	vec3_t target, dir;
;1444:	bsp_trace_t bsptrace;
;1445:	entityState_t state;
;1446:
;1447:	// if there is a dead body wearing kamikze nearby
;1448:	if (bs->kamikazebody) {
ADDRFP4 0
INDIRP4
CNSTI4 10360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $718
line 1450
;1449:		// if the bot's view angles and weapon are not used for movement
;1450:		if ( !(moveresult->flags & (MOVERESULT_MOVEMENTVIEW | MOVERESULT_MOVEMENTWEAPON)) ) {
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 17
BANDI4
CNSTI4 0
NEI4 $720
line 1452
;1451:			//
;1452:			BotAI_GetEntityState(bs->kamikazebody, &state);
ADDRFP4 0
INDIRP4
CNSTI4 10360
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 1453
;1453:			VectorCopy(state.pos.trBase, target);
ADDRLP4 256
ADDRLP4 12+12+12
INDIRB
ASGNB 12
line 1454
;1454:			target[2] += 8;
ADDRLP4 256+8
ADDRLP4 256+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1455
;1455:			VectorSubtract(target, bs->eye, dir);
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 256
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5968
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 256+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5972
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 256+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1456
;1456:			vectoangles(dir, moveresult->ideal_viewangles);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1458
;1457:			//
;1458:			moveresult->weapon = BotSelectActivateWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 BotSelectActivateWeapon
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 1459
;1459:			if (moveresult->weapon == -1) {
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $729
line 1461
;1460:				// FIXME: run away!
;1461:				moveresult->weapon = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 1462
;1462:			}
LABELV $729
line 1463
;1463:			if (moveresult->weapon) {
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $731
line 1465
;1464:				//
;1465:				moveresult->flags |= MOVERESULT_MOVEMENTWEAPON | MOVERESULT_MOVEMENTVIEW;
ADDRLP4 360
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 360
INDIRP4
ADDRLP4 360
INDIRP4
INDIRI4
CNSTI4 17
BORI4
ASGNI4
line 1467
;1466:				// if holding the right weapon
;1467:				if (bs->cur_ps.weapon == moveresult->weapon) {
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
NEI4 $733
line 1469
;1468:					// if the bot is pretty close with it's aim
;1469:					if (InFieldOfVision(bs->viewangles, 20, moveresult->ideal_viewangles)) {
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRLP4 364
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
EQI4 $735
line 1471
;1470:						//
;1471:						BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, target, bs->entitynum, MASK_SHOT);
ADDRLP4 268
ARGP4
ADDRLP4 368
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 368
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 372
CNSTP4 0
ASGNP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 368
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1473
;1472:						// if the mine is visible from the current position
;1473:						if (bsptrace.fraction >= 1.0 || bsptrace.ent == state.number) {
ADDRLP4 268+8
INDIRF4
CNSTF4 1065353216
GEF4 $741
ADDRLP4 268+80
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $737
LABELV $741
line 1475
;1474:							// shoot at the mine
;1475:							trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 1476
;1476:						}
LABELV $737
line 1477
;1477:					}
LABELV $735
line 1478
;1478:				}
LABELV $733
line 1479
;1479:			}
LABELV $731
line 1480
;1480:		}
LABELV $720
line 1481
;1481:	}
LABELV $718
line 1482
;1482:	if (moveresult->flags & MOVERESULT_BLOCKEDBYAVOIDSPOT) {
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $742
line 1483
;1483:		bs->blockedbyavoidspot_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 10312
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 1484
;1484:	}
LABELV $742
line 1486
;1485:	// if blocked by an avoid spot and the view angles and weapon are used for movement
;1486:	if (bs->blockedbyavoidspot_time > FloatTime() &&
ADDRFP4 0
INDIRP4
CNSTI4 10312
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $744
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 17
BANDI4
CNSTI4 0
NEI4 $744
line 1487
;1487:		!(moveresult->flags & (MOVERESULT_MOVEMENTVIEW | MOVERESULT_MOVEMENTWEAPON)) ) {
line 1488
;1488:		bestdist = 300;
ADDRLP4 248
CNSTF4 1133903872
ASGNF4
line 1489
;1489:		bestmine = -1;
ADDRLP4 252
CNSTI4 -1
ASGNI4
line 1490
;1490:		for (i = 0; i < bs->numproxmines; i++) {
ADDRLP4 240
CNSTI4 0
ASGNI4
ADDRGP4 $749
JUMPV
LABELV $746
line 1491
;1491:			BotAI_GetEntityState(bs->proxmines[i], &state);
ADDRLP4 240
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10364
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 1492
;1492:			VectorSubtract(state.pos.trBase, bs->origin, dir);
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+12+12
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+12+12+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+12+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1493
;1493:			dist = VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 356
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 244
ADDRLP4 356
INDIRF4
ASGNF4
line 1494
;1494:			if (dist < bestdist) {
ADDRLP4 244
INDIRF4
ADDRLP4 248
INDIRF4
GEF4 $760
line 1495
;1495:				bestdist = dist;
ADDRLP4 248
ADDRLP4 244
INDIRF4
ASGNF4
line 1496
;1496:				bestmine = i;
ADDRLP4 252
ADDRLP4 240
INDIRI4
ASGNI4
line 1497
;1497:			}
LABELV $760
line 1498
;1498:		}
LABELV $747
line 1490
ADDRLP4 240
ADDRLP4 240
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $749
ADDRLP4 240
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 10620
ADDP4
INDIRI4
LTI4 $746
line 1499
;1499:		if (bestmine != -1) {
ADDRLP4 252
INDIRI4
CNSTI4 -1
EQI4 $762
line 1505
;1500:			//
;1501:			// state->generic1 == TEAM_RED || state->generic1 == TEAM_BLUE
;1502:			//
;1503:			// deactivate prox mines in the bot's path by shooting
;1504:			// rockets or plasma cells etc. at them
;1505:			BotAI_GetEntityState(bs->proxmines[bestmine], &state);
ADDRLP4 252
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 10364
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 1506
;1506:			VectorCopy(state.pos.trBase, target);
ADDRLP4 256
ADDRLP4 12+12+12
INDIRB
ASGNB 12
line 1507
;1507:			target[2] += 2;
ADDRLP4 256+8
ADDRLP4 256+8
INDIRF4
CNSTF4 1073741824
ADDF4
ASGNF4
line 1508
;1508:			VectorSubtract(target, bs->eye, dir);
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 256
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5968
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 256+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5972
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 256+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1509
;1509:			vectoangles(dir, moveresult->ideal_viewangles);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1511
;1510:			// if the bot has a weapon that does splash damage
;1511:			if (bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0)
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 356
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
ADDRLP4 360
INDIRI4
LEI4 $771
ADDRLP4 356
INDIRP4
CNSTI4 6068
ADDP4
INDIRI4
ADDRLP4 360
INDIRI4
LEI4 $771
line 1512
;1512:				moveresult->weapon = WEAPONINDEX_PLASMAGUN;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 8
ASGNI4
ADDRGP4 $772
JUMPV
LABELV $771
line 1513
;1513:			else if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0)
ADDRLP4 364
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 368
CNSTI4 0
ASGNI4
ADDRLP4 364
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
ADDRLP4 368
INDIRI4
LEI4 $773
ADDRLP4 364
INDIRP4
CNSTI4 6076
ADDP4
INDIRI4
ADDRLP4 368
INDIRI4
LEI4 $773
line 1514
;1514:				moveresult->weapon = WEAPONINDEX_ROCKET_LAUNCHER;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 5
ASGNI4
ADDRGP4 $774
JUMPV
LABELV $773
line 1515
;1515:			else if (bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0)
ADDRLP4 372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 376
CNSTI4 0
ASGNI4
ADDRLP4 372
INDIRP4
CNSTI4 6036
ADDP4
INDIRI4
ADDRLP4 376
INDIRI4
LEI4 $775
ADDRLP4 372
INDIRP4
CNSTI4 6084
ADDP4
INDIRI4
ADDRLP4 376
INDIRI4
LEI4 $775
line 1516
;1516:				moveresult->weapon = WEAPONINDEX_BFG;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 9
ASGNI4
ADDRGP4 $776
JUMPV
LABELV $775
line 1517
;1517:			else {
line 1518
;1518:				moveresult->weapon = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 1519
;1519:			}
LABELV $776
LABELV $774
LABELV $772
line 1520
;1520:			if (moveresult->weapon) {
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $777
line 1522
;1521:				//
;1522:				moveresult->flags |= MOVERESULT_MOVEMENTWEAPON | MOVERESULT_MOVEMENTVIEW;
ADDRLP4 380
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 380
INDIRP4
ADDRLP4 380
INDIRP4
INDIRI4
CNSTI4 17
BORI4
ASGNI4
line 1524
;1523:				// if holding the right weapon
;1524:				if (bs->cur_ps.weapon == moveresult->weapon) {
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
NEI4 $779
line 1526
;1525:					// if the bot is pretty close with it's aim
;1526:					if (InFieldOfVision(bs->viewangles, 20, moveresult->ideal_viewangles)) {
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRLP4 384
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $781
line 1528
;1527:						//
;1528:						BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, target, bs->entitynum, MASK_SHOT);
ADDRLP4 268
ARGP4
ADDRLP4 388
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 388
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 392
CNSTP4 0
ASGNP4
ADDRLP4 392
INDIRP4
ARGP4
ADDRLP4 392
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 388
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1530
;1529:						// if the mine is visible from the current position
;1530:						if (bsptrace.fraction >= 1.0 || bsptrace.ent == state.number) {
ADDRLP4 268+8
INDIRF4
CNSTF4 1065353216
GEF4 $787
ADDRLP4 268+80
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $783
LABELV $787
line 1532
;1531:							// shoot at the mine
;1532:							trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 1533
;1533:						}
LABELV $783
line 1534
;1534:					}
LABELV $781
line 1535
;1535:				}
LABELV $779
line 1536
;1536:			}
LABELV $777
line 1537
;1537:		}
LABELV $762
line 1538
;1538:	}
LABELV $744
line 1539
;1539:}
LABELV $717
endproc BotClearPath 396 28
export AIEnter_Seek_ActivateEntity
proc AIEnter_Seek_ActivateEntity 0 16
line 1546
;1540:
;1541:/*
;1542:==================
;1543:AIEnter_Seek_ActivateEntity
;1544:==================
;1545:*/
;1546:void AIEnter_Seek_ActivateEntity(bot_state_t *bs, char *s) {
line 1547
;1547:	BotRecordNodeSwitch(bs, "activate entity", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $789
ARGP4
ADDRGP4 $73
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1548
;1548:	bs->ainode = AINode_Seek_ActivateEntity;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Seek_ActivateEntity
ASGNP4
line 1549
;1549:}
LABELV $788
endproc AIEnter_Seek_ActivateEntity 0 16
export AINode_Seek_ActivateEntity
proc AINode_Seek_ActivateEntity 372 28
line 1556
;1550:
;1551:/*
;1552:==================
;1553:AINode_Seek_Activate_Entity
;1554:==================
;1555:*/
;1556:int AINode_Seek_ActivateEntity(bot_state_t *bs) {
line 1564
;1557:	bot_goal_t *goal;
;1558:	vec3_t target, dir, ideal_viewangles;
;1559:	bot_moveresult_t moveresult;
;1560:	int targetvisible;
;1561:	bsp_trace_t bsptrace;
;1562:	aas_entityinfo_t entinfo;
;1563:
;1564:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 320
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $791
line 1565
;1565:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1566
;1566:		AIEnter_Observer(bs, "active entity: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $793
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1567
;1567:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $790
JUMPV
LABELV $791
line 1570
;1568:	}
;1569:	//if in the intermission
;1570:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 324
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $794
line 1571
;1571:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1572
;1572:		AIEnter_Intermission(bs, "activate entity: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $796
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1573
;1573:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $790
JUMPV
LABELV $794
line 1576
;1574:	}
;1575:	//respawn if dead
;1576:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 328
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $797
line 1577
;1577:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1578
;1578:		AIEnter_Respawn(bs, "activate entity: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $799
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1579
;1579:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $790
JUMPV
LABELV $797
line 1582
;1580:	}
;1581:	//
;1582:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
CNSTI4 18616254
ASGNI4
line 1583
;1583:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $800
ADDRLP4 332
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 332
INDIRP4
ADDRLP4 332
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $800
line 1585
;1584:	// if in lava or slime the bot should be able to get out
;1585:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 336
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
EQI4 $803
ADDRLP4 340
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 340
INDIRP4
ADDRLP4 340
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $803
line 1587
;1586:	// map specific code
;1587:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 1589
;1588:	// no enemy
;1589:	bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
CNSTI4 -1
ASGNI4
line 1591
;1590:	// if the bot has no activate goal
;1591:	if (!bs->activatestack) {
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $805
line 1592
;1592:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1593
;1593:		AIEnter_Seek_NBG(bs, "activate entity: no goal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $807
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1594
;1594:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $790
JUMPV
LABELV $805
line 1597
;1595:	}
;1596:	//
;1597:	goal = &bs->activatestack->goal;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 1599
;1598:	// initialize target being visible to false
;1599:	targetvisible = qfalse;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 1601
;1600:	// if the bot has to shoot at a target to activate something
;1601:	if (bs->activatestack->shoot) {
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $808
line 1603
;1602:		//
;1603:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->activatestack->target, bs->entitynum, MASK_SHOT);
ADDRLP4 72
ARGP4
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 348
CNSTP4 0
ASGNP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 80
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 1605
;1604:		// if the shootable entity is visible from the current position
;1605:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == goal->entitynum) {
ADDRLP4 72+8
INDIRF4
CNSTF4 1065353216
GEF4 $814
ADDRLP4 72+80
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $810
LABELV $814
line 1606
;1606:			targetvisible = qtrue;
ADDRLP4 68
CNSTI4 1
ASGNI4
line 1608
;1607:			// if holding the right weapon
;1608:			if (bs->cur_ps.weapon == bs->activatestack->weapon) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 352
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
NEI4 $815
line 1609
;1609:				VectorSubtract(bs->activatestack->target, bs->eye, dir);
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
ADDRLP4 356
INDIRP4
CNSTI4 11220
ADDP4
ASGNP4
ADDRLP4 56
ADDRLP4 360
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ADDRLP4 356
INDIRP4
CNSTI4 5968
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 360
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ADDRLP4 356
INDIRP4
CNSTI4 5972
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 364
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56+8
ADDRLP4 364
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 5976
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1610
;1610:				vectoangles(dir, ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRLP4 308
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1612
;1611:				// if the bot is pretty close with it's aim
;1612:				if (InFieldOfVision(bs->viewangles, 20, ideal_viewangles)) {
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 308
ARGP4
ADDRLP4 368
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $819
line 1613
;1613:					trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 1614
;1614:				}
LABELV $819
line 1615
;1615:			}
LABELV $815
line 1616
;1616:		}
LABELV $810
line 1617
;1617:	}
LABELV $808
line 1619
;1618:	// if the shoot target is visible
;1619:	if (targetvisible) {
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $821
line 1621
;1620:		// get the entity info of the entity the bot is shooting at
;1621:		BotEntityInfo(goal->entitynum, &entinfo);
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1623
;1622:		// if the entity the bot shoots at moved
;1623:		if (!VectorCompare(bs->activatestack->origin, entinfo.origin)) {
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 156+24
ARGP4
ADDRLP4 344
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
NEI4 $823
line 1627
;1624:#ifdef DEBUG
;1625:			BotAI_Print(PRT_MESSAGE, "hit shootable button or trigger\n");
;1626:#endif //DEBUG
;1627:			bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1628
;1628:		}
LABELV $823
line 1630
;1629:		// if the activate goal has been activated or the bot takes too long
;1630:		if (bs->activatestack->time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $826
line 1631
;1631:			BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
line 1633
;1632:			// if there are more activate goals on the stack
;1633:			if (bs->activatestack) {
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $828
line 1634
;1634:				bs->activatestack->time = FloatTime() + 10;
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1635
;1635:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $790
JUMPV
LABELV $828
line 1637
;1636:			}
;1637:			AIEnter_Seek_NBG(bs, "activate entity: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $830
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1638
;1638:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $790
JUMPV
LABELV $826
line 1640
;1639:		}
;1640:		memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1641
;1641:	}
ADDRGP4 $822
JUMPV
LABELV $821
line 1642
;1642:	else {
line 1644
;1643:		// if the bot has no goal
;1644:		if (!goal) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $831
line 1645
;1645:			bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1646
;1646:		}
ADDRGP4 $832
JUMPV
LABELV $831
line 1648
;1647:		// if the bot does not have a shoot goal
;1648:		else if (!bs->activatestack->shoot) {
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $833
line 1650
;1649:			//if the bot touches the current goal
;1650:			if (trap_BotTouchingGoal(bs->origin, goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $835
line 1654
;1651:#ifdef DEBUG
;1652:				BotAI_Print(PRT_MESSAGE, "touched button or trigger\n");
;1653:#endif //DEBUG
;1654:				bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1655
;1655:			}
LABELV $835
line 1656
;1656:		}
LABELV $833
LABELV $832
line 1658
;1657:		// if the activate goal has been activated or the bot takes too long
;1658:		if (bs->activatestack->time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $837
line 1659
;1659:			BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
line 1661
;1660:			// if there are more activate goals on the stack
;1661:			if (bs->activatestack) {
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $839
line 1662
;1662:				bs->activatestack->time = FloatTime() + 10;
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1663
;1663:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $790
JUMPV
LABELV $839
line 1665
;1664:			}
;1665:			AIEnter_Seek_NBG(bs, "activate entity: activated");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $841
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 1666
;1666:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $790
JUMPV
LABELV $837
line 1669
;1667:		}
;1668:		//predict obstacles
;1669:		if (BotAIPredictObstacles(bs, goal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 BotAIPredictObstacles
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $842
line 1670
;1670:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $790
JUMPV
LABELV $842
line 1672
;1671:		//initialize the movement state
;1672:		BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 1674
;1673:		//move towards the goal
;1674:		trap_BotMoveToGoal(&moveresult, bs->ms, goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 1676
;1675:		//if the movement failed
;1676:		if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $844
line 1678
;1677:			//reset the avoid reach, otherwise bot is stuck in current area
;1678:			trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1680
;1679:			//
;1680:			bs->activatestack->time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 1681
;1681:		}
LABELV $844
line 1683
;1682:		//check if the bot is blocked
;1683:		BotAIBlocked(bs, &moveresult, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 1684
;1684:	}
LABELV $822
line 1686
;1685:	//
;1686:	BotClearPath(bs, &moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotClearPath
CALLV
pop
line 1688
;1687:	// if the bot has to shoot to activate
;1688:	if (bs->activatestack->shoot) {
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $846
line 1690
;1689:		// if the view angles aren't yet used for the movement
;1690:		if (!(moveresult.flags & MOVERESULT_MOVEMENTVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $848
line 1691
;1691:			VectorSubtract(bs->activatestack->target, bs->eye, dir);
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
ADDRLP4 344
INDIRP4
CNSTI4 11220
ADDP4
ASGNP4
ADDRLP4 56
ADDRLP4 348
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 5968
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 348
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ADDRLP4 344
INDIRP4
CNSTI4 5972
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56+8
ADDRLP4 352
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5976
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1692
;1692:			vectoangles(dir, moveresult.ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRLP4 0+40
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1693
;1693:			moveresult.flags |= MOVERESULT_MOVEMENTVIEW;
ADDRLP4 0+20
ADDRLP4 0+20
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1694
;1694:		}
LABELV $848
line 1696
;1695:		// if there's no weapon yet used for the movement
;1696:		if (!(moveresult.flags & MOVERESULT_MOVEMENTWEAPON)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $855
line 1697
;1697:			moveresult.flags |= MOVERESULT_MOVEMENTWEAPON;
ADDRLP4 0+20
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1699
;1698:			//
;1699:			bs->activatestack->weapon = BotSelectActivateWeapon(bs);
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 BotSelectActivateWeapon
CALLI4
ASGNI4
ADDRLP4 344
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 348
INDIRI4
ASGNI4
line 1700
;1700:			if (bs->activatestack->weapon == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $859
line 1702
;1701:				//FIXME: find a decent weapon first
;1702:				bs->activatestack->weapon = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 0
ASGNI4
line 1703
;1703:			}
LABELV $859
line 1704
;1704:			moveresult.weapon = bs->activatestack->weapon;
ADDRLP4 0+24
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 1705
;1705:		}
LABELV $855
line 1706
;1706:	}
LABELV $846
line 1708
;1707:	// if the ideal view angles are set for movement
;1708:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $862
line 1709
;1709:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 1710
;1710:	}
ADDRGP4 $863
JUMPV
LABELV $862
line 1712
;1711:	// if waiting for something
;1712:	else if (moveresult.flags & MOVERESULT_WAITING) {
ADDRLP4 0+20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $866
line 1713
;1713:		if (random() < bs->thinktime * 0.8) {
ADDRLP4 344
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
MULF4
GEF4 $867
line 1714
;1714:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 1715
;1715:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 296
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 296+4
INDIRF4
ADDRLP4 348
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
ADDRLP4 296+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1716
;1716:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1717
;1717:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTF4 1056964608
ADDRLP4 352
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1718
;1718:		}
line 1719
;1719:	}
ADDRGP4 $867
JUMPV
LABELV $866
line 1720
;1720:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $875
line 1721
;1721:		if (trap_BotMovementViewTarget(bs->ms, goal, bs->tfl, 300, target)) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 296
ARGP4
ADDRLP4 348
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $877
line 1722
;1722:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 296
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 296+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
ADDRLP4 296+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1723
;1723:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 56
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1724
;1724:		}
ADDRGP4 $878
JUMPV
LABELV $877
line 1725
;1725:		else {
line 1726
;1726:			vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1727
;1727:		}
LABELV $878
line 1728
;1728:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTF4 1056964608
ADDRLP4 352
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1729
;1729:	}
LABELV $875
LABELV $867
LABELV $863
line 1731
;1730:	// if the weapon is used for the bot movement
;1731:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON)
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $884
line 1732
;1732:		bs->weaponnum = moveresult.weapon;
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $884
line 1734
;1733:	// if there is an enemy
;1734:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 344
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $888
line 1735
;1735:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $890
line 1737
;1736:			//keep the current long term goal and retreat
;1737:			AIEnter_Battle_NBG(bs, "activate entity: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $892
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 1738
;1738:		}
ADDRGP4 $891
JUMPV
LABELV $890
line 1739
;1739:		else {
line 1740
;1740:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1742
;1741:			//empty the goal stack
;1742:			trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 1744
;1743:			//go fight
;1744:			AIEnter_Battle_Fight(bs, "activate entity: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $892
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1745
;1745:		}
LABELV $891
line 1746
;1746:		BotClearActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1747
;1747:	}
LABELV $888
line 1748
;1748:	return qtrue;
CNSTI4 1
RETI4
LABELV $790
endproc AINode_Seek_ActivateEntity 372 28
export AIEnter_Seek_NBG
proc AIEnter_Seek_NBG 204 16
line 1756
;1749:}
;1750:
;1751:/*
;1752:==================
;1753:AIEnter_Seek_NBG
;1754:==================
;1755:*/
;1756:void AIEnter_Seek_NBG(bot_state_t *bs, char *s) {
line 1760
;1757:	bot_goal_t goal;
;1758:	char buf[144];
;1759:
;1760:	if (trap_BotGetTopGoal(bs->gs, &goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 200
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $894
line 1761
;1761:		trap_BotGoalName(goal.number, buf, 144);
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1762
;1762:		BotRecordNodeSwitch(bs, "seek NBG", buf, s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $897
ARGP4
ADDRLP4 56
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1763
;1763:	}
ADDRGP4 $895
JUMPV
LABELV $894
line 1764
;1764:	else {
line 1765
;1765:		BotRecordNodeSwitch(bs, "seek NBG", "no goal", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $897
ARGP4
ADDRGP4 $898
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1766
;1766:	}
LABELV $895
line 1767
;1767:	bs->ainode = AINode_Seek_NBG;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Seek_NBG
ASGNP4
line 1768
;1768:}
LABELV $893
endproc AIEnter_Seek_NBG 204 16
export AINode_Seek_NBG
proc AINode_Seek_NBG 192 20
line 1775
;1769:
;1770:/*
;1771:==================
;1772:AINode_Seek_NBG
;1773:==================
;1774:*/
;1775:int AINode_Seek_NBG(bot_state_t *bs) {
line 1780
;1776:	bot_goal_t goal;
;1777:	vec3_t target, dir;
;1778:	bot_moveresult_t moveresult;
;1779:
;1780:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $900
line 1781
;1781:		AIEnter_Observer(bs, "seek nbg: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $902
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1782
;1782:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $899
JUMPV
LABELV $900
line 1785
;1783:	}
;1784:	//if in the intermission
;1785:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $903
line 1786
;1786:		AIEnter_Intermission(bs, "seek nbg: intermision");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $905
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1787
;1787:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $899
JUMPV
LABELV $903
line 1790
;1788:	}
;1789:	//respawn if dead
;1790:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $906
line 1791
;1791:		AIEnter_Respawn(bs, "seek nbg: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $908
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1792
;1792:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $899
JUMPV
LABELV $906
line 1795
;1793:	}
;1794:	//
;1795:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
CNSTI4 18616254
ASGNI4
line 1796
;1796:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $909
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $909
line 1798
;1797:	//if in lava or slime the bot should be able to get out
;1798:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $912
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $912
line 1800
;1799:	//
;1800:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $914
line 1801
;1801:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1802
;1802:	}
LABELV $914
line 1804
;1803:	//map specific code
;1804:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 1806
;1805:	//no enemy
;1806:	bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
CNSTI4 -1
ASGNI4
line 1808
;1807:	//if the bot has no goal
;1808:	if (!trap_BotGetTopGoal(bs->gs, &goal)) bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $916
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $917
JUMPV
LABELV $916
line 1810
;1809:	//if the bot touches the current goal
;1810:	else if (BotReachedGoal(bs, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 164
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $918
line 1811
;1811:		BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 1812
;1812:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
CNSTF4 0
ASGNF4
line 1813
;1813:	}
LABELV $918
LABELV $917
line 1815
;1814:	//
;1815:	if (bs->nbg_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $920
line 1817
;1816:		//pop the current goal from the stack
;1817:		trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 1820
;1818:		//check for new nearby items right away
;1819:		//NOTE: we canNOT reset the check_time to zero because it would create an endless loop of node switches
;1820:		bs->check_time = FloatTime() + 0.05;
ADDRFP4 0
INDIRP4
CNSTI4 10196
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1028443341
ADDF4
ASGNF4
line 1822
;1821:		//go back to seek ltg
;1822:		AIEnter_Seek_LTG(bs, "seek nbg: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $922
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 1823
;1823:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $899
JUMPV
LABELV $920
line 1826
;1824:	}
;1825:	//predict obstacles
;1826:	if (BotAIPredictObstacles(bs, &goal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 168
ADDRGP4 BotAIPredictObstacles
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $923
line 1827
;1827:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $899
JUMPV
LABELV $923
line 1829
;1828:	//initialize the movement state
;1829:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 1831
;1830:	//move towards the goal
;1831:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 172
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 1833
;1832:	//if the movement failed
;1833:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $925
line 1835
;1834:		//reset the avoid reach, otherwise bot is stuck in current area
;1835:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 1836
;1836:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
CNSTF4 0
ASGNF4
line 1837
;1837:	}
LABELV $925
line 1839
;1838:	//check if the bot is blocked
;1839:	BotAIBlocked(bs, &moveresult, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 1841
;1840:	//
;1841:	BotClearPath(bs, &moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotClearPath
CALLV
pop
line 1843
;1842:	//if the viewangles are used for the movement
;1843:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $927
line 1844
;1844:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 1845
;1845:	}
ADDRGP4 $928
JUMPV
LABELV $927
line 1847
;1846:	//if waiting for something
;1847:	else if (moveresult.flags & MOVERESULT_WAITING) {
ADDRLP4 0+20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $931
line 1848
;1848:		if (random() < bs->thinktime * 0.8) {
ADDRLP4 176
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
MULF4
GEF4 $932
line 1849
;1849:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 1850
;1850:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 108
INDIRF4
ADDRLP4 180
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 180
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1851
;1851:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1852
;1852:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
CNSTF4 1056964608
ADDRLP4 184
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1853
;1853:		}
line 1854
;1854:	}
ADDRGP4 $932
JUMPV
LABELV $931
line 1855
;1855:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $940
line 1856
;1856:		if (!trap_BotGetSecondGoal(bs->gs, &goal)) trap_BotGetTopGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 176
ADDRGP4 trap_BotGetSecondGoal
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $942
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRGP4 trap_BotGetTopGoal
CALLI4
pop
LABELV $942
line 1857
;1857:		if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 180
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 108
ARGP4
ADDRLP4 184
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $944
line 1858
;1858:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 108
INDIRF4
ADDRLP4 188
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 188
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 120+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1859
;1859:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1860
;1860:		}
ADDRGP4 $945
JUMPV
LABELV $944
line 1862
;1861:		//FIXME: look at cluster portals?
;1862:		else vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
LABELV $945
line 1863
;1863:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTF4 1056964608
ADDRLP4 188
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1864
;1864:	}
LABELV $940
LABELV $932
LABELV $928
line 1866
;1865:	//if the weapon is used for the bot movement
;1866:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $951
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $951
line 1868
;1867:	//if there is an enemy
;1868:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 176
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $955
line 1869
;1869:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $957
line 1871
;1870:			//keep the current long term goal and retreat
;1871:			AIEnter_Battle_NBG(bs, "seek nbg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $959
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 1872
;1872:		}
ADDRGP4 $958
JUMPV
LABELV $957
line 1873
;1873:		else {
line 1874
;1874:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1876
;1875:			//empty the goal stack
;1876:			trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 1878
;1877:			//go fight
;1878:			AIEnter_Battle_Fight(bs, "seek nbg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $959
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1879
;1879:		}
LABELV $958
line 1880
;1880:	}
LABELV $955
line 1881
;1881:	return qtrue;
CNSTI4 1
RETI4
LABELV $899
endproc AINode_Seek_NBG 192 20
export AIEnter_Seek_LTG
proc AIEnter_Seek_LTG 204 16
line 1889
;1882:}
;1883:
;1884:/*
;1885:==================
;1886:AIEnter_Seek_LTG
;1887:==================
;1888:*/
;1889:void AIEnter_Seek_LTG(bot_state_t *bs, char *s) {
line 1893
;1890:	bot_goal_t goal;
;1891:	char buf[144];
;1892:
;1893:	if (trap_BotGetTopGoal(bs->gs, &goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 200
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $961
line 1894
;1894:		trap_BotGoalName(goal.number, buf, 144);
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1895
;1895:		BotRecordNodeSwitch(bs, "seek LTG", buf, s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $964
ARGP4
ADDRLP4 56
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1896
;1896:	}
ADDRGP4 $962
JUMPV
LABELV $961
line 1897
;1897:	else {
line 1898
;1898:		BotRecordNodeSwitch(bs, "seek LTG", "no goal", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $964
ARGP4
ADDRGP4 $898
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 1899
;1899:	}
LABELV $962
line 1900
;1900:	bs->ainode = AINode_Seek_LTG;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Seek_LTG
ASGNP4
line 1901
;1901:}
LABELV $960
endproc AIEnter_Seek_LTG 204 16
export AINode_Seek_LTG
proc AINode_Seek_LTG 212 20
line 1909
;1902:
;1903:/*
;1904:==================
;1905:AINode_Seek_LTG
;1906:==================
;1907:*/
;1908:int AINode_Seek_LTG(bot_state_t *bs)
;1909:{
line 1917
;1910:	bot_goal_t goal;
;1911:	vec3_t target, dir;
;1912:	bot_moveresult_t moveresult;
;1913:	int range;
;1914:	//char buf[128];
;1915:	//bot_goal_t tmpgoal;
;1916:
;1917:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $966
line 1918
;1918:		AIEnter_Observer(bs, "seek ltg: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $968
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 1919
;1919:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $965
JUMPV
LABELV $966
line 1922
;1920:	}
;1921:	//if in the intermission
;1922:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $969
line 1923
;1923:		AIEnter_Intermission(bs, "seek ltg: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $971
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 1924
;1924:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $965
JUMPV
LABELV $969
line 1927
;1925:	}
;1926:	//respawn if dead
;1927:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $972
line 1928
;1928:		AIEnter_Respawn(bs, "seek ltg: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $974
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 1929
;1929:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $965
JUMPV
LABELV $972
line 1932
;1930:	}
;1931:	//
;1932:	if (BotChat_Random(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 BotChat_Random
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $975
line 1933
;1933:		bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 152
INDIRP4
CNSTI4 10200
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 156
INDIRF4
ADDF4
ASGNF4
line 1934
;1934:		AIEnter_Stand(bs, "seek ltg: random chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $977
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 1935
;1935:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $965
JUMPV
LABELV $975
line 1938
;1936:	}
;1937:	//
;1938:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
CNSTI4 18616254
ASGNI4
line 1939
;1939:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $978
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $978
line 1941
;1940:	//if in lava or slime the bot should be able to get out
;1941:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $981
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $981
line 1943
;1942:	//
;1943:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $983
line 1944
;1944:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1945
;1945:	}
LABELV $983
line 1947
;1946:	//map specific code
;1947:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 1949
;1948:	//no enemy
;1949:	bs->enemy = -1;
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
CNSTI4 -1
ASGNI4
line 1951
;1950:	//
;1951:	if (bs->killedenemy_time > FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 10272
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $985
line 1952
;1952:		if (random() < bs->thinktime * 1) {
ADDRLP4 168
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1065353216
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
MULF4
GEF4 $987
line 1953
;1953:			trap_EA_Gesture(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Gesture
CALLV
pop
line 1954
;1954:		}
LABELV $987
line 1955
;1955:	}
LABELV $985
line 1957
;1956:	//if there is an enemy
;1957:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 168
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $989
line 1958
;1958:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $991
line 1960
;1959:			//keep the current long term goal and retreat
;1960:			AIEnter_Battle_Retreat(bs, "seek ltg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $993
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
line 1961
;1961:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $965
JUMPV
LABELV $991
line 1963
;1962:		}
;1963:		else {
line 1964
;1964:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 1966
;1965:			//empty the goal stack
;1966:			trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 1968
;1967:			//go fight
;1968:			AIEnter_Battle_Fight(bs, "seek ltg: found enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $993
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 1969
;1969:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $965
JUMPV
LABELV $989
line 1973
;1970:		}
;1971:	}
;1972:	//
;1973:	BotTeamGoals(bs, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotTeamGoals
CALLV
pop
line 1975
;1974:	//get the current long term goal
;1975:	if (!BotLongTermGoal(bs, bs->tfl, qfalse, &goal)) {
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 176
ADDRGP4 BotLongTermGoal
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $994
line 1976
;1976:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $965
JUMPV
LABELV $994
line 1979
;1977:	}
;1978:	//check for nearby goals periodicly
;1979:	if (bs->check_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10196
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $996
line 1980
;1980:		bs->check_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 10196
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1982
;1981:		//check if the bot wants to camp
;1982:		BotWantsToCamp(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotWantsToCamp
CALLI4
pop
line 1984
;1983:		//
;1984:		if (bs->ltgtype == LTG_DEFENDKEYAREA) range = 400;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 3
NEI4 $998
ADDRLP4 108
CNSTI4 400
ASGNI4
ADDRGP4 $999
JUMPV
LABELV $998
line 1985
;1985:		else range = 150;
ADDRLP4 108
CNSTI4 150
ASGNI4
LABELV $999
line 1987
;1986:		//
;1987:		if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 180
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 5
EQI4 $1002
ADDRLP4 180
INDIRI4
CNSTI4 10
NEI4 $1000
LABELV $1002
line 1989
;1988:			//if carrying a flag the bot shouldn't be distracted too much
;1989:			if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1001
line 1990
;1990:				range = 50;
ADDRLP4 108
CNSTI4 50
ASGNI4
line 1991
;1991:		}
ADDRGP4 $1001
JUMPV
LABELV $1000
line 1992
;1992:		else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1005
line 1993
;1993:			if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1006
line 1994
;1994:				range = 50;
ADDRLP4 108
CNSTI4 50
ASGNI4
line 1995
;1995:		}
ADDRGP4 $1006
JUMPV
LABELV $1005
line 1996
;1996:		else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $1009
line 1997
;1997:			if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1011
line 1998
;1998:				range = 80;
ADDRLP4 108
CNSTI4 80
ASGNI4
LABELV $1011
line 1999
;1999:		}
LABELV $1009
LABELV $1006
LABELV $1001
line 2001
;2000:		//
;2001:		if (BotNearbyGoal(bs, bs->tfl, &goal, range)) {
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 108
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 188
ADDRGP4 BotNearbyGoal
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $1013
line 2002
;2002:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 2008
;2003:			//get the goal at the top of the stack
;2004:			//trap_BotGetTopGoal(bs->gs, &tmpgoal);
;2005:			//trap_BotGoalName(tmpgoal.number, buf, 144);
;2006:			//BotAI_Print(PRT_MESSAGE, "new nearby goal %s\n", buf);
;2007:			//time the bot gets to pick up the nearby goal item
;2008:			bs->nbg_time = FloatTime() + 4 + range * 0.01;
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1082130432
ADDF4
CNSTF4 1008981770
ADDRLP4 108
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 2009
;2009:			AIEnter_Seek_NBG(bs, "ltg seek: nbg");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1015
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 2010
;2010:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $965
JUMPV
LABELV $1013
line 2012
;2011:		}
;2012:	}
LABELV $996
line 2014
;2013:	//predict obstacles
;2014:	if (BotAIPredictObstacles(bs, &goal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 180
ADDRGP4 BotAIPredictObstacles
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $1016
line 2015
;2015:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $965
JUMPV
LABELV $1016
line 2017
;2016:	//initialize the movement state
;2017:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2019
;2018:	//move towards the goal
;2019:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2021
;2020:	//if the movement failed
;2021:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1018
line 2023
;2022:		//reset the avoid reach, otherwise bot is stuck in current area
;2023:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2025
;2024:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2025:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
CNSTF4 0
ASGNF4
line 2026
;2026:	}
LABELV $1018
line 2028
;2027:	//
;2028:	BotAIBlocked(bs, &moveresult, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2030
;2029:	//
;2030:	BotClearPath(bs, &moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotClearPath
CALLV
pop
line 2032
;2031:	//if the viewangles are used for the movement
;2032:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $1020
line 2033
;2033:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 2034
;2034:	}
ADDRGP4 $1021
JUMPV
LABELV $1020
line 2036
;2035:	//if waiting for something
;2036:	else if (moveresult.flags & MOVERESULT_WAITING) {
ADDRLP4 0+20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1024
line 2037
;2037:		if (random() < bs->thinktime * 0.8) {
ADDRLP4 188
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
MULF4
GEF4 $1025
line 2038
;2038:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 2039
;2039:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 192
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 192
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2040
;2040:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2041
;2041:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTF4 1056964608
ADDRLP4 196
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2042
;2042:		}
line 2043
;2043:	}
ADDRGP4 $1025
JUMPV
LABELV $1024
line 2044
;2044:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1033
line 2045
;2045:		if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 112
ARGP4
ADDRLP4 192
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $1035
line 2046
;2046:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 196
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 196
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2047
;2047:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2048
;2048:		}
ADDRGP4 $1036
JUMPV
LABELV $1035
line 2050
;2049:		//FIXME: look at cluster portals?
;2050:		else if (VectorLengthSquared(moveresult.movedir)) {
ADDRLP4 0+28
ARGP4
ADDRLP4 196
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 196
INDIRF4
CNSTF4 0
EQF4 $1041
line 2051
;2051:			vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2052
;2052:		}
ADDRGP4 $1042
JUMPV
LABELV $1041
line 2053
;2053:		else if (random() < bs->thinktime * 0.8) {
ADDRLP4 200
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
MULF4
GEF4 $1045
line 2054
;2054:			BotRoamGoal(bs, target);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 BotRoamGoal
CALLV
pop
line 2055
;2055:			VectorSubtract(target, bs->origin, dir);
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 204
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 204
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2056
;2056:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2057
;2057:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTF4 1056964608
ADDRLP4 208
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2058
;2058:		}
LABELV $1045
LABELV $1042
LABELV $1036
line 2059
;2059:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
CNSTF4 1056964608
ADDRLP4 204
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2060
;2060:	}
LABELV $1033
LABELV $1025
LABELV $1021
line 2062
;2061:	//if the weapon is used for the bot movement
;2062:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1051
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $1051
line 2064
;2063:	//
;2064:	return qtrue;
CNSTI4 1
RETI4
LABELV $965
endproc AINode_Seek_LTG 212 20
export AIEnter_Battle_Fight
proc AIEnter_Battle_Fight 4 16
line 2072
;2065:}
;2066:
;2067:/*
;2068:==================
;2069:AIEnter_Battle_Fight
;2070:==================
;2071:*/
;2072:void AIEnter_Battle_Fight(bot_state_t *bs, char *s) {
line 2073
;2073:	BotRecordNodeSwitch(bs, "battle fight", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1056
ARGP4
ADDRGP4 $73
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2074
;2074:	trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 2075
;2075:	bs->ainode = AINode_Battle_Fight;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Battle_Fight
ASGNP4
line 2076
;2076:	bs->flags &= ~BFL_FIGHTSUICIDAL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 2077
;2077:}
LABELV $1055
endproc AIEnter_Battle_Fight 4 16
export AIEnter_Battle_SuicidalFight
proc AIEnter_Battle_SuicidalFight 4 16
line 2084
;2078:
;2079:/*
;2080:==================
;2081:AIEnter_Battle_SuicidalFight
;2082:==================
;2083:*/
;2084:void AIEnter_Battle_SuicidalFight(bot_state_t *bs, char *s) {
line 2085
;2085:	BotRecordNodeSwitch(bs, "battle fight", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1056
ARGP4
ADDRGP4 $73
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2086
;2086:	trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 2087
;2087:	bs->ainode = AINode_Battle_Fight;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Battle_Fight
ASGNP4
line 2088
;2088:	bs->flags |= BFL_FIGHTSUICIDAL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2089
;2089:}
LABELV $1057
endproc AIEnter_Battle_SuicidalFight 4 16
export AINode_Battle_Fight
proc AINode_Battle_Fight 292 20
line 2096
;2090:
;2091:/*
;2092:==================
;2093:AINode_Battle_Fight
;2094:==================
;2095:*/
;2096:int AINode_Battle_Fight(bot_state_t *bs) {
line 2102
;2097:	int areanum;
;2098:	vec3_t target;
;2099:	aas_entityinfo_t entinfo;
;2100:	bot_moveresult_t moveresult;
;2101:
;2102:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $1059
line 2103
;2103:		AIEnter_Observer(bs, "battle fight: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1061
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 2104
;2104:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1059
line 2108
;2105:	}
;2106:
;2107:	//if in the intermission
;2108:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 212
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
EQI4 $1062
line 2109
;2109:		AIEnter_Intermission(bs, "battle fight: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1064
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 2110
;2110:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1062
line 2113
;2111:	}
;2112:	//respawn if dead
;2113:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 216
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $1065
line 2114
;2114:		AIEnter_Respawn(bs, "battle fight: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1067
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 2115
;2115:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1065
line 2118
;2116:	}
;2117:	//if there is another better enemy
;2118:	if (BotFindEnemy(bs, bs->enemy)) {
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
ARGP4
ADDRLP4 220
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 224
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 0
EQI4 $1068
line 2122
;2119:#ifdef DEBUG
;2120:		BotAI_Print(PRT_MESSAGE, "found new better enemy\n");
;2121:#endif
;2122:	}
LABELV $1068
line 2124
;2123:	//if no enemy
;2124:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1070
line 2125
;2125:		AIEnter_Seek_LTG(bs, "battle fight: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1072
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2126
;2126:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1070
line 2129
;2127:	}
;2128:	//
;2129:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2131
;2130:	//if the enemy is dead
;2131:	if (bs->enemydeath_time) {
ADDRFP4 0
INDIRP4
CNSTI4 10240
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1073
line 2132
;2132:		if (bs->enemydeath_time < FloatTime() - 1.0) {
ADDRFP4 0
INDIRP4
CNSTI4 10240
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1074
line 2133
;2133:			bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10240
ADDP4
CNSTF4 0
ASGNF4
line 2134
;2134:			if (bs->enemysuicide) {
ADDRFP4 0
INDIRP4
CNSTI4 10116
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1077
line 2135
;2135:				BotChat_EnemySuicide(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChat_EnemySuicide
CALLI4
pop
line 2136
;2136:			}
LABELV $1077
line 2137
;2137:			if (bs->lastkilledplayer == bs->enemy && BotChat_Kill(bs)) {
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 10096
ADDP4
INDIRI4
ADDRLP4 228
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
NEI4 $1079
ADDRLP4 228
INDIRP4
ARGP4
ADDRLP4 232
ADDRGP4 BotChat_Kill
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
EQI4 $1079
line 2138
;2138:				bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRLP4 240
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 236
INDIRP4
CNSTI4 10200
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 240
INDIRF4
ADDF4
ASGNF4
line 2139
;2139:				AIEnter_Stand(bs, "battle fight: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1081
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 2140
;2140:			}
ADDRGP4 $1080
JUMPV
LABELV $1079
line 2141
;2141:			else {
line 2142
;2142:				bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
CNSTF4 0
ASGNF4
line 2143
;2143:				AIEnter_Seek_LTG(bs, "battle fight: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1081
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2144
;2144:			}
LABELV $1080
line 2145
;2145:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
line 2147
;2146:		}
;2147:	}
LABELV $1073
line 2148
;2148:	else {
line 2149
;2149:		if (EntityIsDead(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 228
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 0
EQI4 $1082
line 2150
;2150:			bs->enemydeath_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10240
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2151
;2151:		}
LABELV $1082
line 2152
;2152:	}
LABELV $1074
line 2154
;2153:	//if the enemy is invisible and not shooting the bot looses track easily
;2154:	if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 228
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 0
EQI4 $1084
ADDRLP4 0
ARGP4
ADDRLP4 232
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
NEI4 $1084
line 2155
;2155:		if (random() < 0.2) {
ADDRLP4 236
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1045220557
GEF4 $1086
line 2156
;2156:			AIEnter_Seek_LTG(bs, "battle fight: invisible");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1088
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2157
;2157:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1086
line 2159
;2158:		}
;2159:	}
LABELV $1084
line 2161
;2160:	//
;2161:	VectorCopy(entinfo.origin, target);
ADDRLP4 196
ADDRLP4 0+24
INDIRB
ASGNB 12
line 2163
;2162:	// if not a player enemy
;2163:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 256
LTI4 $1090
line 2165
;2164:		// if attacking an obelisk
;2165:		if ( bs->enemy == redobelisk.entitynum ||
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ASGNI4
ADDRLP4 236
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1096
ADDRLP4 236
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1092
LABELV $1096
line 2166
;2166:			bs->enemy == blueobelisk.entitynum ) {
line 2167
;2167:			target[2] += 16;
ADDRLP4 196+8
ADDRLP4 196+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2168
;2168:		}
LABELV $1092
line 2169
;2169:	}
LABELV $1090
line 2171
;2170:	//update the reachability area and origin if possible
;2171:	areanum = BotPointAreaNum(target);
ADDRLP4 196
ARGP4
ADDRLP4 236
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 192
ADDRLP4 236
INDIRI4
ASGNI4
line 2172
;2172:	if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $1098
ADDRLP4 192
INDIRI4
ARGI4
ADDRLP4 244
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
EQI4 $1098
line 2173
;2173:		VectorCopy(target, bs->lastenemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 10652
ADDP4
ADDRLP4 196
INDIRB
ASGNB 12
line 2174
;2174:		bs->lastenemyareanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10648
ADDP4
ADDRLP4 192
INDIRI4
ASGNI4
line 2175
;2175:	}
LABELV $1098
line 2177
;2176:	//update the attack inventory values
;2177:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2179
;2178:	//if the bot's health decreased
;2179:	if (bs->lastframe_health > bs->inventory[INVENTORY_HEALTH]) {
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 10148
ADDP4
INDIRI4
ADDRLP4 252
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
LEI4 $1100
line 2180
;2180:		if (BotChat_HitNoDeath(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
ADDRGP4 BotChat_HitNoDeath
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
EQI4 $1102
line 2181
;2181:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 260
INDIRP4
CNSTI4 10200
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 264
INDIRF4
ADDF4
ASGNF4
line 2182
;2182:			AIEnter_Stand(bs, "battle fight: chat health decreased");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1104
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 2183
;2183:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1102
line 2185
;2184:		}
;2185:	}
LABELV $1100
line 2187
;2186:	//if the bot hit someone
;2187:	if (bs->cur_ps.persistant[PERS_HITS] > bs->lasthitcount) {
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ADDRLP4 256
INDIRP4
CNSTI4 10152
ADDP4
INDIRI4
LEI4 $1105
line 2188
;2188:		if (BotChat_HitNoKill(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotChat_HitNoKill
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $1107
line 2189
;2189:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 264
INDIRP4
CNSTI4 10200
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 268
INDIRF4
ADDF4
ASGNF4
line 2190
;2190:			AIEnter_Stand(bs, "battle fight: chat hit someone");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1109
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 2191
;2191:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1107
line 2193
;2192:		}
;2193:	}
LABELV $1105
line 2195
;2194:	//if the enemy is not visible
;2195:	if (!BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 260
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 260
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 264
INDIRF4
CNSTF4 0
NEF4 $1110
line 2197
;2196:#ifdef MISSIONPACK
;2197:		if (bs->enemy == redobelisk.entitynum || bs->enemy == blueobelisk.entitynum) {
ADDRLP4 268
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ASGNI4
ADDRLP4 268
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1116
ADDRLP4 268
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1112
LABELV $1116
line 2198
;2198:			AIEnter_Battle_Chase(bs, "battle fight: obelisk out of sight");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1117
ARGP4
ADDRGP4 AIEnter_Battle_Chase
CALLV
pop
line 2199
;2199:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1112
line 2202
;2200:		}
;2201:#endif
;2202:		if (BotWantsToChase(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotWantsToChase
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $1118
line 2203
;2203:			AIEnter_Battle_Chase(bs, "battle fight: enemy out of sight");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1120
ARGP4
ADDRGP4 AIEnter_Battle_Chase
CALLV
pop
line 2204
;2204:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1118
line 2206
;2205:		}
;2206:		else {
line 2207
;2207:			AIEnter_Seek_LTG(bs, "battle fight: enemy out of sight");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1120
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2208
;2208:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1110
line 2212
;2209:		}
;2210:	}
;2211:	//use holdable items
;2212:	BotBattleUseItems(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotBattleUseItems
CALLV
pop
line 2214
;2213:	//
;2214:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
CNSTI4 18616254
ASGNI4
line 2215
;2215:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1121
ADDRLP4 268
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $1121
line 2217
;2216:	//if in lava or slime the bot should be able to get out
;2217:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $1124
ADDRLP4 276
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
ADDRLP4 276
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $1124
line 2219
;2218:	//
;2219:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $1126
line 2220
;2220:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 284
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
ADDRLP4 284
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2221
;2221:	}
LABELV $1126
line 2223
;2222:	//choose the best weapon to fight with
;2223:	BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 2225
;2224:	//do attack movements
;2225:	moveresult = BotAttackMove(bs, bs->tfl);
ADDRLP4 140
ARGP4
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAttackMove
CALLV
pop
line 2227
;2226:	//if the movement failed
;2227:	if (moveresult.failure) {
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1128
line 2229
;2228:		//reset the avoid reach, otherwise bot is stuck in current area
;2229:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2231
;2230:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2231:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
CNSTF4 0
ASGNF4
line 2232
;2232:	}
LABELV $1128
line 2234
;2233:	//
;2234:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2236
;2235:	//aim at the enemy
;2236:	BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2238
;2237:	//attack the enemy if possible
;2238:	BotCheckAttack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAttack
CALLV
pop
line 2240
;2239:	//if the bot wants to retreat
;2240:	if (!(bs->flags & BFL_FIGHTSUICIDAL)) {
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $1130
line 2241
;2241:		if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $1132
line 2242
;2242:			AIEnter_Battle_Retreat(bs, "battle fight: wants to retreat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1134
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
line 2243
;2243:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1058
JUMPV
LABELV $1132
line 2245
;2244:		}
;2245:	}
LABELV $1130
line 2246
;2246:	return qtrue;
CNSTI4 1
RETI4
LABELV $1058
endproc AINode_Battle_Fight 292 20
export AIEnter_Battle_Chase
proc AIEnter_Battle_Chase 0 16
line 2254
;2247:}
;2248:
;2249:/*
;2250:==================
;2251:AIEnter_Battle_Chase
;2252:==================
;2253:*/
;2254:void AIEnter_Battle_Chase(bot_state_t *bs, char *s) {
line 2255
;2255:	BotRecordNodeSwitch(bs, "battle chase", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1136
ARGP4
ADDRGP4 $73
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2256
;2256:	bs->chase_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10188
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2257
;2257:	bs->ainode = AINode_Battle_Chase;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Battle_Chase
ASGNP4
line 2258
;2258:}
LABELV $1135
endproc AIEnter_Battle_Chase 0 16
export AINode_Battle_Chase
proc AINode_Battle_Chase 204 20
line 2266
;2259:
;2260:/*
;2261:==================
;2262:AINode_Battle_Chase
;2263:==================
;2264:*/
;2265:int AINode_Battle_Chase(bot_state_t *bs)
;2266:{
line 2272
;2267:	bot_goal_t goal;
;2268:	vec3_t target, dir;
;2269:	bot_moveresult_t moveresult;
;2270:	float range;
;2271:
;2272:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $1138
line 2273
;2273:		AIEnter_Observer(bs, "battle chase: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1140
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 2274
;2274:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1138
line 2277
;2275:	}
;2276:	//if in the intermission
;2277:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1141
line 2278
;2278:		AIEnter_Intermission(bs, "battle chase: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1143
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 2279
;2279:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1141
line 2282
;2280:	}
;2281:	//respawn if dead
;2282:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1144
line 2283
;2283:		AIEnter_Respawn(bs, "battle chase: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1146
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 2284
;2284:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1144
line 2287
;2285:	}
;2286:	//if no enemy
;2287:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1147
line 2288
;2288:		AIEnter_Seek_LTG(bs, "battle chase: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1149
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2289
;2289:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1147
line 2292
;2290:	}
;2291:	//if the enemy is visible
;2292:	if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 148
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 0
EQF4 $1150
line 2293
;2293:		AIEnter_Battle_Fight(bs, "battle chase");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1136
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 2294
;2294:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1150
line 2297
;2295:	}
;2296:	//if there is another enemy
;2297:	if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 156
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $1152
line 2298
;2298:		AIEnter_Battle_Fight(bs, "battle chase: better enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1154
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 2299
;2299:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1152
line 2302
;2300:	}
;2301:	//there is no last enemy area
;2302:	if (!bs->lastenemyareanum) {
ADDRFP4 0
INDIRP4
CNSTI4 10648
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1155
line 2303
;2303:		AIEnter_Seek_LTG(bs, "battle chase: no enemy area");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1157
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2304
;2304:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1155
line 2307
;2305:	}
;2306:	//
;2307:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
CNSTI4 18616254
ASGNI4
line 2308
;2308:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1158
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $1158
line 2310
;2309:	//if in lava or slime the bot should be able to get out
;2310:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $1161
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $1161
line 2312
;2311:	//
;2312:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1163
line 2313
;2313:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2314
;2314:	}
LABELV $1163
line 2316
;2315:	//map specific code
;2316:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 2318
;2317:	//create the chase goal
;2318:	goal.entitynum = bs->enemy;
ADDRLP4 0+40
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ASGNI4
line 2319
;2319:	goal.areanum = bs->lastenemyareanum;
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 10648
ADDP4
INDIRI4
ASGNI4
line 2320
;2320:	VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 10652
ADDP4
INDIRB
ASGNB 12
line 2321
;2321:	VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 0+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 0+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0+16+8
CNSTF4 3238002688
ASGNF4
line 2322
;2322:	VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 0+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 0+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0+28+8
CNSTF4 1090519040
ASGNF4
line 2324
;2323:	//if the last seen enemy spot is reached the enemy could not be found
;2324:	if (trap_BotTouchingGoal(bs->origin, &goal)) bs->chase_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 176
ADDRGP4 trap_BotTouchingGoal
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $1177
ADDRFP4 0
INDIRP4
CNSTI4 10188
ADDP4
CNSTF4 0
ASGNF4
LABELV $1177
line 2326
;2325:	//if there's no chase time left
;2326:	if (!bs->chase_time || bs->chase_time < FloatTime() - 10) {
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 10188
ADDP4
INDIRF4
ASGNF4
ADDRLP4 180
INDIRF4
CNSTF4 0
EQF4 $1181
ADDRLP4 180
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
GEF4 $1179
LABELV $1181
line 2327
;2327:		AIEnter_Seek_LTG(bs, "battle chase: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1182
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2328
;2328:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1179
line 2331
;2329:	}
;2330:	//check for nearby goals periodicly
;2331:	if (bs->check_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10196
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1183
line 2332
;2332:		bs->check_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 10196
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2333
;2333:		range = 150;
ADDRLP4 108
CNSTF4 1125515264
ASGNF4
line 2335
;2334:		//
;2335:		if (BotNearbyGoal(bs, bs->tfl, &goal, range)) {
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 108
INDIRF4
ARGF4
ADDRLP4 188
ADDRGP4 BotNearbyGoal
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $1185
line 2337
;2336:			//the bot gets 5 seconds to pick up the nearby goal item
;2337:			bs->nbg_time = FloatTime() + 0.1 * range + 1;
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1036831949
ADDRLP4 108
INDIRF4
MULF4
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2338
;2338:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 2339
;2339:			AIEnter_Battle_NBG(bs, "battle chase: nbg");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1187
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 2340
;2340:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1185
line 2342
;2341:		}
;2342:	}
LABELV $1183
line 2344
;2343:	//
;2344:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2346
;2345:	//initialize the movement state
;2346:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2348
;2347:	//move towards the goal
;2348:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 56
ARGP4
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2350
;2349:	//if the movement failed
;2350:	if (moveresult.failure) {
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $1188
line 2352
;2351:		//reset the avoid reach, otherwise bot is stuck in current area
;2352:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2354
;2353:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2354:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
CNSTF4 0
ASGNF4
line 2355
;2355:	}
LABELV $1188
line 2357
;2356:	//
;2357:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2359
;2358:	//
;2359:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 56+20
INDIRI4
CNSTI4 11
BANDI4
CNSTI4 0
EQI4 $1190
line 2360
;2360:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ADDRLP4 56+40
INDIRB
ASGNB 12
line 2361
;2361:	}
ADDRGP4 $1191
JUMPV
LABELV $1190
line 2362
;2362:	else if (!(bs->flags & BFL_IDEALVIEWSET)) {
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1194
line 2363
;2363:		if (bs->chase_time > FloatTime() - 2) {
ADDRFP4 0
INDIRP4
CNSTI4 10188
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $1196
line 2364
;2364:			BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2365
;2365:		}
ADDRGP4 $1197
JUMPV
LABELV $1196
line 2366
;2366:		else {
line 2367
;2367:			if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 192
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 112
ARGP4
ADDRLP4 196
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $1198
line 2368
;2368:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 112
INDIRF4
ADDRLP4 200
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 200
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2369
;2369:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 124
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2370
;2370:			}
ADDRGP4 $1199
JUMPV
LABELV $1198
line 2371
;2371:			else {
line 2372
;2372:				vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 56+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2373
;2373:			}
LABELV $1199
line 2374
;2374:		}
LABELV $1197
line 2375
;2375:		bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTF4 1056964608
ADDRLP4 192
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2376
;2376:	}
LABELV $1194
LABELV $1191
line 2378
;2377:	//if the weapon is used for the bot movement
;2378:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 56+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1205
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
ADDRLP4 56+24
INDIRI4
ASGNI4
LABELV $1205
line 2380
;2379:	//if the bot is in the area the enemy was last seen in
;2380:	if (bs->areanum == bs->lastenemyareanum) bs->chase_time = 0;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ADDRLP4 192
INDIRP4
CNSTI4 10648
ADDP4
INDIRI4
NEI4 $1209
ADDRFP4 0
INDIRP4
CNSTI4 10188
ADDP4
CNSTF4 0
ASGNF4
LABELV $1209
line 2382
;2381:	//if the bot wants to retreat (the bot could have been damage during the chase)
;2382:	if (BotWantsToRetreat(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $1211
line 2383
;2383:		AIEnter_Battle_Retreat(bs, "battle chase: wants to retreat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1213
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
line 2384
;2384:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1211
line 2386
;2385:	}
;2386:	return qtrue;
CNSTI4 1
RETI4
LABELV $1137
endproc AINode_Battle_Chase 204 20
export AIEnter_Battle_Retreat
proc AIEnter_Battle_Retreat 0 16
line 2394
;2387:}
;2388:
;2389:/*
;2390:==================
;2391:AIEnter_Battle_Retreat
;2392:==================
;2393:*/
;2394:void AIEnter_Battle_Retreat(bot_state_t *bs, char *s) {
line 2395
;2395:	BotRecordNodeSwitch(bs, "battle retreat", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1215
ARGP4
ADDRGP4 $73
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2396
;2396:	bs->ainode = AINode_Battle_Retreat;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Battle_Retreat
ASGNP4
line 2397
;2397:}
LABELV $1214
endproc AIEnter_Battle_Retreat 0 16
export AINode_Battle_Retreat
proc AINode_Battle_Retreat 368 20
line 2404
;2398:
;2399:/*
;2400:==================
;2401:AINode_Battle_Retreat
;2402:==================
;2403:*/
;2404:int AINode_Battle_Retreat(bot_state_t *bs) {
line 2412
;2405:	bot_goal_t goal;
;2406:	aas_entityinfo_t entinfo;
;2407:	bot_moveresult_t moveresult;
;2408:	vec3_t target, dir;
;2409:	float attack_skill, range;
;2410:	int areanum;
;2411:
;2412:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $1217
line 2413
;2413:		AIEnter_Observer(bs, "battle retreat: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1219
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 2414
;2414:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1217
line 2417
;2415:	}
;2416:	//if in the intermission
;2417:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $1220
line 2418
;2418:		AIEnter_Intermission(bs, "battle retreat: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1222
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 2419
;2419:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1220
line 2422
;2420:	}
;2421:	//respawn if dead
;2422:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1223
line 2423
;2423:		AIEnter_Respawn(bs, "battle retreat: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1225
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 2424
;2424:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1223
line 2427
;2425:	}
;2426:	//if no enemy
;2427:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1226
line 2428
;2428:		AIEnter_Seek_LTG(bs, "battle retreat: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1228
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2429
;2429:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1226
line 2432
;2430:	}
;2431:	//
;2432:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2433
;2433:	if (EntityIsDead(&entinfo)) {
ADDRLP4 108
ARGP4
ADDRLP4 296
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $1229
line 2434
;2434:		AIEnter_Seek_LTG(bs, "battle retreat: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1231
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2435
;2435:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1229
line 2438
;2436:	}
;2437:	//if there is another better enemy
;2438:	if (BotFindEnemy(bs, bs->enemy)) {
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRLP4 300
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 304
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $1232
line 2442
;2439:#ifdef DEBUG
;2440:		BotAI_Print(PRT_MESSAGE, "found new better enemy\n");
;2441:#endif
;2442:	}
LABELV $1232
line 2444
;2443:	//
;2444:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
CNSTI4 18616254
ASGNI4
line 2445
;2445:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1234
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 308
INDIRP4
ADDRLP4 308
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $1234
line 2447
;2446:	//if in lava or slime the bot should be able to get out
;2447:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 312
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $1237
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 316
INDIRP4
ADDRLP4 316
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $1237
line 2449
;2448:	//map specific code
;2449:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 2451
;2450:	//update the attack inventory values
;2451:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 320
INDIRP4
ARGP4
ADDRLP4 320
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2453
;2452:	//if the bot doesn't want to retreat anymore... probably picked up some nice items
;2453:	if (BotWantsToChase(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 324
ADDRGP4 BotWantsToChase
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1239
line 2455
;2454:		//empty the goal stack, when chasing, only the enemy is the goal
;2455:		trap_BotEmptyGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotEmptyGoalStack
CALLV
pop
line 2457
;2456:		//go chase the enemy
;2457:		AIEnter_Battle_Chase(bs, "battle retreat: wants to chase");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1241
ARGP4
ADDRGP4 AIEnter_Battle_Chase
CALLV
pop
line 2458
;2458:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1239
line 2461
;2459:	}
;2460:	//update the last time the enemy was visible
;2461:	if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 328
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 328
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 332
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 332
INDIRF4
CNSTF4 0
EQF4 $1242
line 2462
;2462:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2463
;2463:		VectorCopy(entinfo.origin, target);
ADDRLP4 252
ADDRLP4 108+24
INDIRB
ASGNB 12
line 2465
;2464:		// if not a player enemy
;2465:		if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 256
LTI4 $1245
line 2467
;2466:			// if attacking an obelisk
;2467:			if ( bs->enemy == redobelisk.entitynum ||
ADDRLP4 336
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ASGNI4
ADDRLP4 336
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1251
ADDRLP4 336
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1247
LABELV $1251
line 2468
;2468:				bs->enemy == blueobelisk.entitynum ) {
line 2469
;2469:				target[2] += 16;
ADDRLP4 252+8
ADDRLP4 252+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2470
;2470:			}
LABELV $1247
line 2471
;2471:		}
LABELV $1245
line 2473
;2472:		//update the reachability area and origin if possible
;2473:		areanum = BotPointAreaNum(target);
ADDRLP4 252
ARGP4
ADDRLP4 336
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 248
ADDRLP4 336
INDIRI4
ASGNI4
line 2474
;2474:		if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 340
ADDRLP4 248
INDIRI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $1253
ADDRLP4 340
INDIRI4
ARGI4
ADDRLP4 344
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $1253
line 2475
;2475:			VectorCopy(target, bs->lastenemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 10652
ADDP4
ADDRLP4 252
INDIRB
ASGNB 12
line 2476
;2476:			bs->lastenemyareanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10648
ADDP4
ADDRLP4 248
INDIRI4
ASGNI4
line 2477
;2477:		}
LABELV $1253
line 2478
;2478:	}
LABELV $1242
line 2480
;2479:	//if the enemy is NOT visible for 4 seconds
;2480:	if (bs->enemyvisible_time < FloatTime() - 4) {
ADDRFP4 0
INDIRP4
CNSTI4 10192
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1082130432
SUBF4
GEF4 $1255
line 2481
;2481:		AIEnter_Seek_LTG(bs, "battle retreat: lost enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1257
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 2482
;2482:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1255
line 2485
;2483:	}
;2484:	//else if the enemy is NOT visible
;2485:	else if (bs->enemyvisible_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10192
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1258
line 2487
;2486:		//if there is another enemy
;2487:		if (BotFindEnemy(bs, -1)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 336
ADDRGP4 BotFindEnemy
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
EQI4 $1260
line 2488
;2488:			AIEnter_Battle_Fight(bs, "battle retreat: another enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1262
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
line 2489
;2489:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1260
line 2491
;2490:		}
;2491:	}
LABELV $1258
line 2493
;2492:	//
;2493:	BotTeamGoals(bs, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotTeamGoals
CALLV
pop
line 2495
;2494:	//use holdable items
;2495:	BotBattleUseItems(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotBattleUseItems
CALLV
pop
line 2497
;2496:	//get the current long term goal while retreating
;2497:	if (!BotLongTermGoal(bs, bs->tfl, qtrue, &goal)) {
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
ARGP4
ADDRLP4 336
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 340
ADDRGP4 BotLongTermGoal
CALLI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
NEI4 $1263
line 2498
;2498:		AIEnter_Battle_SuicidalFight(bs, "battle retreat: no way out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1265
ARGP4
ADDRGP4 AIEnter_Battle_SuicidalFight
CALLV
pop
line 2499
;2499:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1263
line 2502
;2500:	}
;2501:	//check for nearby goals periodicly
;2502:	if (bs->check_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10196
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1266
line 2503
;2503:		bs->check_time = FloatTime() + 1;
ADDRFP4 0
INDIRP4
CNSTI4 10196
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2504
;2504:		range = 150;
ADDRLP4 264
CNSTF4 1125515264
ASGNF4
line 2505
;2505:		if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 344
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 5
EQI4 $1270
ADDRLP4 344
INDIRI4
CNSTI4 10
NEI4 $1268
LABELV $1270
line 2507
;2506:			//if carrying a flag the bot shouldn't be distracted too much
;2507:			if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $1269
line 2508
;2508:				range = 50;
ADDRLP4 264
CNSTF4 1112014848
ASGNF4
line 2509
;2509:		}
ADDRGP4 $1269
JUMPV
LABELV $1268
line 2510
;2510:		else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1273
line 2511
;2511:			if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $1274
line 2512
;2512:				range = 50;
ADDRLP4 264
CNSTF4 1112014848
ASGNF4
line 2513
;2513:		}
ADDRGP4 $1274
JUMPV
LABELV $1273
line 2514
;2514:		else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $1277
line 2515
;2515:			if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $1279
line 2516
;2516:				range = 80;
ADDRLP4 264
CNSTF4 1117782016
ASGNF4
LABELV $1279
line 2517
;2517:		}
LABELV $1277
LABELV $1274
LABELV $1269
line 2519
;2518:		//
;2519:		if (BotNearbyGoal(bs, bs->tfl, &goal, range)) {
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 264
INDIRF4
ARGF4
ADDRLP4 352
ADDRGP4 BotNearbyGoal
CALLI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $1281
line 2520
;2520:			trap_BotResetLastAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetLastAvoidReach
CALLV
pop
line 2522
;2521:			//time the bot gets to pick up the nearby goal item
;2522:			bs->nbg_time = FloatTime() + range / 100 + 1;
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 264
INDIRF4
CNSTF4 1120403456
DIVF4
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2523
;2523:			AIEnter_Battle_NBG(bs, "battle retreat: nbg");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1283
ARGP4
ADDRGP4 AIEnter_Battle_NBG
CALLV
pop
line 2524
;2524:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1281
line 2526
;2525:		}
;2526:	}
LABELV $1266
line 2528
;2527:	//initialize the movement state
;2528:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2530
;2529:	//move towards the goal
;2530:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2532
;2531:	//if the movement failed
;2532:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1284
line 2534
;2533:		//reset the avoid reach, otherwise bot is stuck in current area
;2534:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2536
;2535:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2536:		bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
CNSTF4 0
ASGNF4
line 2537
;2537:	}
LABELV $1284
line 2539
;2538:	//
;2539:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2541
;2540:	//choose the best weapon to fight with
;2541:	BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 2543
;2542:	//if the view is fixed for the movement
;2543:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $1286
line 2544
;2544:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 2545
;2545:	}
ADDRGP4 $1287
JUMPV
LABELV $1286
line 2546
;2546:	else if (!(moveresult.flags & MOVERESULT_MOVEMENTVIEWSET)
ADDRLP4 348
CNSTI4 0
ASGNI4
ADDRLP4 0+20
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 348
INDIRI4
NEI4 $1290
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 348
INDIRI4
NEI4 $1290
line 2547
;2547:				&& !(bs->flags & BFL_IDEALVIEWSET) ) {
line 2548
;2548:		attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 352
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 268
ADDRLP4 352
INDIRF4
ASGNF4
line 2550
;2549:		//if the bot is skilled anough
;2550:		if (attack_skill > 0.3) {
ADDRLP4 268
INDIRF4
CNSTF4 1050253722
LEF4 $1293
line 2551
;2551:			BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2552
;2552:		}
ADDRGP4 $1294
JUMPV
LABELV $1293
line 2553
;2553:		else {
line 2554
;2554:			if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 356
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 252
ARGP4
ADDRLP4 360
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $1295
line 2555
;2555:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 364
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
ADDRLP4 252
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 272+4
ADDRLP4 252+4
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 272+8
ADDRLP4 252+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2556
;2556:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 272
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2557
;2557:			}
ADDRGP4 $1296
JUMPV
LABELV $1295
line 2558
;2558:			else {
line 2559
;2559:				vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2560
;2560:			}
LABELV $1296
line 2561
;2561:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 364
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 364
INDIRP4
CNSTF4 1056964608
ADDRLP4 364
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2562
;2562:		}
LABELV $1294
line 2563
;2563:	}
LABELV $1290
LABELV $1287
line 2565
;2564:	//if the weapon is used for the bot movement
;2565:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1302
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $1302
line 2567
;2566:	//attack the enemy if possible
;2567:	BotCheckAttack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAttack
CALLV
pop
line 2569
;2568:	//
;2569:	return qtrue;
CNSTI4 1
RETI4
LABELV $1216
endproc AINode_Battle_Retreat 368 20
export AIEnter_Battle_NBG
proc AIEnter_Battle_NBG 0 16
line 2577
;2570:}
;2571:
;2572:/*
;2573:==================
;2574:AIEnter_Battle_NBG
;2575:==================
;2576:*/
;2577:void AIEnter_Battle_NBG(bot_state_t *bs, char *s) {
line 2578
;2578:	BotRecordNodeSwitch(bs, "battle NBG", "", s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1307
ARGP4
ADDRGP4 $73
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRecordNodeSwitch
CALLV
pop
line 2579
;2579:	bs->ainode = AINode_Battle_NBG;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
ADDRGP4 AINode_Battle_NBG
ASGNP4
line 2580
;2580:}
LABELV $1306
endproc AIEnter_Battle_NBG 0 16
export AINode_Battle_NBG
proc AINode_Battle_NBG 356 20
line 2587
;2581:
;2582:/*
;2583:==================
;2584:AINode_Battle_NBG
;2585:==================
;2586:*/
;2587:int AINode_Battle_NBG(bot_state_t *bs) {
line 2595
;2588:	int areanum;
;2589:	bot_goal_t goal;
;2590:	aas_entityinfo_t entinfo;
;2591:	bot_moveresult_t moveresult;
;2592:	float attack_skill;
;2593:	vec3_t target, dir;
;2594:
;2595:	if (BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $1309
line 2596
;2596:		AIEnter_Observer(bs, "battle nbg: observer");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1311
ARGP4
ADDRGP4 AIEnter_Observer
CALLV
pop
line 2597
;2597:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1308
JUMPV
LABELV $1309
line 2600
;2598:	}
;2599:	//if in the intermission
;2600:	if (BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $1312
line 2601
;2601:		AIEnter_Intermission(bs, "battle nbg: intermission");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1314
ARGP4
ADDRGP4 AIEnter_Intermission
CALLV
pop
line 2602
;2602:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1308
JUMPV
LABELV $1312
line 2605
;2603:	}
;2604:	//respawn if dead
;2605:	if (BotIsDead(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $1315
line 2606
;2606:		AIEnter_Respawn(bs, "battle nbg: bot dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1317
ARGP4
ADDRGP4 AIEnter_Respawn
CALLV
pop
line 2607
;2607:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1308
JUMPV
LABELV $1315
line 2610
;2608:	}
;2609:	//if no enemy
;2610:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1318
line 2611
;2611:		AIEnter_Seek_NBG(bs, "battle nbg: no enemy");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1320
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 2612
;2612:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1308
JUMPV
LABELV $1318
line 2615
;2613:	}
;2614:	//
;2615:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2616
;2616:	if (EntityIsDead(&entinfo)) {
ADDRLP4 108
ARGP4
ADDRLP4 292
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1321
line 2617
;2617:		AIEnter_Seek_NBG(bs, "battle nbg: enemy dead");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1323
ARGP4
ADDRGP4 AIEnter_Seek_NBG
CALLV
pop
line 2618
;2618:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1308
JUMPV
LABELV $1321
line 2621
;2619:	}
;2620:	//
;2621:	bs->tfl = TFL_DEFAULT;
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
CNSTI4 18616254
ASGNI4
line 2622
;2622:	if (bot_grapple.integer) bs->tfl |= TFL_GRAPPLEHOOK;
ADDRGP4 bot_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1324
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 296
INDIRP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
LABELV $1324
line 2624
;2623:	//if in lava or slime the bot should be able to get out
;2624:	if (BotInLavaOrSlime(bs)) bs->tfl |= TFL_LAVA|TFL_SLIME;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 BotInLavaOrSlime
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $1327
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 304
INDIRP4
ADDRLP4 304
INDIRP4
INDIRI4
CNSTI4 6291456
BORI4
ASGNI4
LABELV $1327
line 2626
;2625:	//
;2626:	if (BotCanAndWantsToRocketJump(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 BotCanAndWantsToRocketJump
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $1329
line 2627
;2627:		bs->tfl |= TFL_ROCKETJUMP;
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 312
INDIRP4
ADDRLP4 312
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2628
;2628:	}
LABELV $1329
line 2630
;2629:	//map specific code
;2630:	BotMapScripts(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotMapScripts
CALLV
pop
line 2632
;2631:	//update the last time the enemy was visible
;2632:	if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 312
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 312
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 316
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 316
INDIRF4
CNSTF4 0
EQF4 $1331
line 2633
;2633:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2634
;2634:		VectorCopy(entinfo.origin, target);
ADDRLP4 252
ADDRLP4 108+24
INDIRB
ASGNB 12
line 2636
;2635:		// if not a player enemy
;2636:		if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 256
LTI4 $1334
line 2638
;2637:			// if attacking an obelisk
;2638:			if ( bs->enemy == redobelisk.entitynum ||
ADDRLP4 320
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ASGNI4
ADDRLP4 320
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1340
ADDRLP4 320
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1336
LABELV $1340
line 2639
;2639:				bs->enemy == blueobelisk.entitynum ) {
line 2640
;2640:				target[2] += 16;
ADDRLP4 252+8
ADDRLP4 252+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2641
;2641:			}
LABELV $1336
line 2642
;2642:		}
LABELV $1334
line 2644
;2643:		//update the reachability area and origin if possible
;2644:		areanum = BotPointAreaNum(target);
ADDRLP4 252
ARGP4
ADDRLP4 320
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 248
ADDRLP4 320
INDIRI4
ASGNI4
line 2645
;2645:		if (areanum && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 324
ADDRLP4 248
INDIRI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1342
ADDRLP4 324
INDIRI4
ARGI4
ADDRLP4 328
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $1342
line 2646
;2646:			VectorCopy(target, bs->lastenemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 10652
ADDP4
ADDRLP4 252
INDIRB
ASGNB 12
line 2647
;2647:			bs->lastenemyareanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10648
ADDP4
ADDRLP4 248
INDIRI4
ASGNI4
line 2648
;2648:		}
LABELV $1342
line 2649
;2649:	}
LABELV $1331
line 2651
;2650:	//if the bot has no goal or touches the current goal
;2651:	if (!trap_BotGetTopGoal(bs->gs, &goal)) {
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 320
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
NEI4 $1344
line 2652
;2652:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
CNSTF4 0
ASGNF4
line 2653
;2653:	}
ADDRGP4 $1345
JUMPV
LABELV $1344
line 2654
;2654:	else if (BotReachedGoal(bs, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 324
ADDRGP4 BotReachedGoal
CALLI4
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1346
line 2655
;2655:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
CNSTF4 0
ASGNF4
line 2656
;2656:	}
LABELV $1346
LABELV $1345
line 2658
;2657:	//
;2658:	if (bs->nbg_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1348
line 2660
;2659:		//pop the current goal from the stack
;2660:		trap_BotPopGoal(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotPopGoal
CALLV
pop
line 2662
;2661:		//if the bot still has a goal
;2662:		if (trap_BotGetTopGoal(bs->gs, &goal))
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 328
ADDRGP4 trap_BotGetTopGoal
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $1350
line 2663
;2663:			AIEnter_Battle_Retreat(bs, "battle nbg: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1352
ARGP4
ADDRGP4 AIEnter_Battle_Retreat
CALLV
pop
ADDRGP4 $1351
JUMPV
LABELV $1350
line 2665
;2664:		else
;2665:			AIEnter_Battle_Fight(bs, "battle nbg: time out");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1352
ARGP4
ADDRGP4 AIEnter_Battle_Fight
CALLV
pop
LABELV $1351
line 2667
;2666:		//
;2667:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1308
JUMPV
LABELV $1348
line 2670
;2668:	}
;2669:	//initialize the movement state
;2670:	BotSetupForMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2672
;2671:	//move towards the goal
;2672:	trap_BotMoveToGoal(&moveresult, bs->ms, &goal, bs->tfl);
ADDRLP4 0
ARGP4
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2674
;2673:	//if the movement failed
;2674:	if (moveresult.failure) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1353
line 2676
;2675:		//reset the avoid reach, otherwise bot is stuck in current area
;2676:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
line 2678
;2677:		//BotAI_Print(PRT_MESSAGE, "movement failure %d\n", moveresult.traveltype);
;2678:		bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
CNSTF4 0
ASGNF4
line 2679
;2679:	}
LABELV $1353
line 2681
;2680:	//
;2681:	BotAIBlocked(bs, &moveresult, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotAIBlocked
CALLV
pop
line 2683
;2682:	//update the attack inventory values
;2683:	BotUpdateBattleInventory(bs, bs->enemy);
ADDRLP4 332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 332
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 2685
;2684:	//choose the best weapon to fight with
;2685:	BotChooseWeapon(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotChooseWeapon
CALLV
pop
line 2687
;2686:	//if the view is fixed for the movement
;2687:	if (moveresult.flags & (MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW)) {
ADDRLP4 0+20
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $1355
line 2688
;2688:		VectorCopy(moveresult.ideal_viewangles, bs->ideal_viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ADDRLP4 0+40
INDIRB
ASGNB 12
line 2689
;2689:	}
ADDRGP4 $1356
JUMPV
LABELV $1355
line 2690
;2690:	else if (!(moveresult.flags & MOVERESULT_MOVEMENTVIEWSET)
ADDRLP4 336
CNSTI4 0
ASGNI4
ADDRLP4 0+20
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 336
INDIRI4
NEI4 $1359
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 336
INDIRI4
NEI4 $1359
line 2691
;2691:				&& !(bs->flags & BFL_IDEALVIEWSET)) {
line 2692
;2692:		attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 340
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 264
ADDRLP4 340
INDIRF4
ASGNF4
line 2694
;2693:		//if the bot is skilled anough and the enemy is visible
;2694:		if (attack_skill > 0.3) {
ADDRLP4 264
INDIRF4
CNSTF4 1050253722
LEF4 $1362
line 2696
;2695:			//&& BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy)
;2696:			BotAimAtEnemy(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimAtEnemy
CALLV
pop
line 2697
;2697:		}
ADDRGP4 $1363
JUMPV
LABELV $1362
line 2698
;2698:		else {
line 2699
;2699:			if (trap_BotMovementViewTarget(bs->ms, &goal, bs->tfl, 300, target)) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
CNSTF4 1133903872
ARGF4
ADDRLP4 252
ARGP4
ADDRLP4 348
ADDRGP4 trap_BotMovementViewTarget
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $1364
line 2700
;2700:				VectorSubtract(target, bs->origin, dir);
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
ADDRLP4 252
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 268+4
ADDRLP4 252+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 268+8
ADDRLP4 252+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2701
;2701:				vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 268
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2702
;2702:			}
ADDRGP4 $1365
JUMPV
LABELV $1364
line 2703
;2703:			else {
line 2704
;2704:				vectoangles(moveresult.movedir, bs->ideal_viewangles);
ADDRLP4 0+28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2705
;2705:			}
LABELV $1365
line 2706
;2706:			bs->ideal_viewangles[2] *= 0.5;
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 10688
ADDP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTF4 1056964608
ADDRLP4 352
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2707
;2707:		}
LABELV $1363
line 2708
;2708:	}
LABELV $1359
LABELV $1356
line 2710
;2709:	//if the weapon is used for the bot movement
;2710:	if (moveresult.flags & MOVERESULT_MOVEMENTWEAPON) bs->weaponnum = moveresult.weapon;
ADDRLP4 0+20
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1371
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
ADDRLP4 0+24
INDIRI4
ASGNI4
LABELV $1371
line 2712
;2711:	//attack the enemy if possible
;2712:	BotCheckAttack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAttack
CALLV
pop
line 2714
;2713:	//
;2714:	return qtrue;
CNSTI4 1
RETI4
LABELV $1308
endproc AINode_Battle_NBG 356 20
import NpcFactionProp
import dom_points_bot
bss
export nodeswitch
align 1
LABELV nodeswitch
skip 7344
export numnodeswitches
align 4
LABELV numnodeswitches
skip 4
import BotVoiceChatOnly
import BotVoiceChat
import BotSetTeamMateTaskPreference
import BotGetTeamMateTaskPreference
import BotTeamAI
import AIEnter_Seek_Camp
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
LABELV $1352
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1323
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1320
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1317
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1314
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1311
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1307
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 78
byte 1 66
byte 1 71
byte 1 0
align 1
LABELV $1283
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 0
align 1
LABELV $1265
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1262
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1257
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1241
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1231
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1228
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1225
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1222
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1219
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1215
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1213
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1187
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 0
align 1
LABELV $1182
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1157
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $1154
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 98
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1149
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1146
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1143
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1140
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1136
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $1134
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1120
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1117
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1109
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 115
byte 1 111
byte 1 109
byte 1 101
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1104
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1088
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1081
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1072
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $1067
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1064
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1061
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1056
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1015
byte 1 108
byte 1 116
byte 1 103
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 58
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 0
align 1
LABELV $993
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $977
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $974
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $971
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $968
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 108
byte 1 116
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $964
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 76
byte 1 84
byte 1 71
byte 1 0
align 1
LABELV $959
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $922
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $908
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $905
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $902
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 110
byte 1 98
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $898
byte 1 110
byte 1 111
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $897
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 32
byte 1 78
byte 1 66
byte 1 71
byte 1 0
align 1
LABELV $892
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $841
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $830
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $807
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $799
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $796
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $793
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $789
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $687
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $679
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $677
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $674
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $664
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $662
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $658
byte 1 111
byte 1 98
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $656
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $648
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $617
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
LABELV $614
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $604
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $535
byte 1 111
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $534
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
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $497
byte 1 111
byte 1 110
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
LABELV $496
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
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $462
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
LABELV $461
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $451
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $425
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $424
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 0
align 1
LABELV $391
byte 1 105
byte 1 110
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
LABELV $390
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $381
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $376
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $368
byte 1 103
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 103
byte 1 111
byte 1 116
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $365
byte 1 103
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $360
byte 1 103
byte 1 101
byte 1 116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $353
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $350
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $339
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $336
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
LABELV $335
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $324
byte 1 100
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 98
byte 1 0
align 1
LABELV $313
byte 1 100
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $304
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $295
byte 1 66
byte 1 111
byte 1 116
byte 1 76
byte 1 111
byte 1 110
byte 1 103
byte 1 84
byte 1 101
byte 1 114
byte 1 109
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 103
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $273
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $180
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $177
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $151
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $150
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $75
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 50
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $73
byte 1 0
align 1
LABELV $72
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $67
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
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
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 73
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 10
byte 1 0
