data
align 4
LABELV $66
address $67
address $68
address $69
address $70
address $69
address $71
address $72
address $73
address $74
address $75
address $76
address $72
address $77
address $78
address $79
export untrap_BotGetLevelItemGoal
code
proc untrap_BotGetLevelItemGoal 148 16
file "../../../code/game/ai_dmq3.c"
line 118
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
;25: * name:		ai_dmq3.c
;26: *
;27: * desc:		Quake3 bot AI
;28: *
;29: * $Archive: /MissionPack/code/game/ai_dmq3.c $
;30: *
;31: *****************************************************************************/
;32:
;33:
;34:#include "g_local.h"
;35:#include "../botlib/botlib.h"
;36:#include "../botlib/be_aas.h"
;37:#include "../botlib/be_ea.h"
;38:#include "../botlib/be_ai_char.h"
;39:#include "../botlib/be_ai_chat.h"
;40:#include "../botlib/be_ai_gen.h"
;41:#include "../botlib/be_ai_goal.h"
;42:#include "../botlib/be_ai_move.h"
;43:#include "../botlib/be_ai_weap.h"
;44://
;45:#include "ai_main.h"
;46:#include "ai_dmq3.h"
;47:#include "ai_chat.h"
;48:#include "ai_cmd.h"
;49:#include "ai_dmnet.h"
;50:#include "ai_team.h"
;51://
;52:#include "chars.h"				//characteristics
;53:#include "inv.h"				//indexes into the inventory
;54:#include "syn.h"				//synonyms
;55:#include "match.h"				//string matching types and vars
;56:
;57:// for the voice chats
;58:#include "../../ui/menudef.h" // sos001205 - for q3_ui also
;59:
;60:// from aasfile.h
;61:#define AREACONTENTS_MOVER				1024
;62:#define AREACONTENTS_MODELNUMSHIFT		24
;63:#define AREACONTENTS_MAXMODELNUM		0xFF
;64:#define AREACONTENTS_MODELNUM			(AREACONTENTS_MAXMODELNUM << AREACONTENTS_MODELNUMSHIFT)
;65:
;66:#define IDEAL_ATTACKDIST			140
;67:
;68:#define MAX_WAYPOINTS		128
;69:
;70:#define MAX_EPAIRKEY		128
;71://
;72:bot_waypoint_t botai_waypoints[MAX_WAYPOINTS];
;73:bot_waypoint_t *botai_freewaypoints;
;74:
;75://NOTE: not using a cvars which can be updated because the game should be reloaded anyway
;76:int gametype;		//game type
;77:int maxclients;		//maximum number of clients
;78:
;79:vmCvar_t bot_grapple;
;80:vmCvar_t bot_rocketjump;
;81:vmCvar_t bot_fastchat;
;82:vmCvar_t bot_nochat;
;83:vmCvar_t bot_testrchat;
;84:vmCvar_t bot_challenge;
;85:vmCvar_t bot_predictobstacles;
;86:vmCvar_t g_spSkill;
;87:
;88:extern vmCvar_t bot_developer;
;89:
;90:vec3_t lastteleport_origin;		//last teleport event origin
;91:float lastteleport_time;		//last teleport event time
;92:int max_bspmodelindex;			//maximum BSP model index
;93:
;94://CTF flag goals
;95:bot_goal_t ctf_redflag;
;96:bot_goal_t ctf_blueflag;
;97://Domination goals:
;98:bot_goal_t dom_points_bot[MAX_DOMINATION_POINTS];
;99:bot_goal_t ctf_neutralflag;
;100:bot_goal_t redobelisk;
;101:bot_goal_t blueobelisk;
;102:bot_goal_t neutralobelisk;
;103:
;104:#define MAX_ALTROUTEGOALS		32
;105:
;106:int altroutegoals_setup;
;107:aas_altroutegoal_t red_altroutegoals[MAX_ALTROUTEGOALS];
;108:int red_numaltroutegoals;
;109:aas_altroutegoal_t blue_altroutegoals[MAX_ALTROUTEGOALS];
;110:int blue_numaltroutegoals;
;111:
;112:/*
;113:==================
;114:untrap_BotGetLevelItemGoal
;115: *same as trap_BotGetLevelItemGoal, but respects the gametype flag!
;116:==================
;117: */
;118:int untrap_BotGetLevelItemGoal(int start, char *classname, void /* struct bot_goal_s */ *goal) {
line 123
;119:    static char *gametypeNames[] = {"sandbox", "ffa", "single", "tournament", "single", "team", "ctf", "oneflag", "obelisk", "harvester", "elimination", "ctf", "lms", "dd", "dom"};
;120:    char allowedGametypes[MAX_EPAIRKEY];
;121:    char *gametypeName;
;122:
;123:    start = trap_BotGetLevelItemGoal(start,classname,goal);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRFP4 0
ADDRLP4 132
INDIRI4
ASGNI4
ADDRGP4 $81
JUMPV
LABELV $80
line 124
;124:    while(start>-1) {
line 125
;125:        if(!trap_AAS_ValueForBSPEpairKey(start,"gametype",allowedGametypes,MAX_EPAIRKEY))
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $85
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 136
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $83
line 126
;126:            return start; //No gametype flag
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $65
JUMPV
LABELV $83
line 127
;127:        if( gametype >= GT_SANDBOX && gametype < GT_MAX_GAME_TYPE ) {
ADDRLP4 140
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $86
ADDRLP4 140
INDIRI4
CNSTI4 14
GEI4 $86
line 128
;128:            gametypeName = gametypeNames[gametype];
ADDRLP4 128
ADDRGP4 gametype
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $66
ADDP4
INDIRP4
ASGNP4
line 129
;129:            if(strstr( allowedGametypes, gametypeName ))
ADDRLP4 0
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $87
line 130
;130:            {
line 132
;131:                //In gametype strig
;132:                return start;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $65
JUMPV
line 134
;133:            }
;134:        }
LABELV $86
line 136
;135:        else
;136:            return start;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $65
JUMPV
LABELV $87
line 137
;137:        start = trap_BotGetLevelItemGoal(start,classname,goal);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRFP4 0
ADDRLP4 144
INDIRI4
ASGNI4
line 138
;138:    }
LABELV $81
line 124
ADDRFP4 0
INDIRI4
CNSTI4 -1
GTI4 $80
line 139
;139:    return -1;
CNSTI4 -1
RETI4
LABELV $65
endproc untrap_BotGetLevelItemGoal 148 16
export BotSetUserInfo
proc BotSetUserInfo 1024 12
line 147
;140:}
;141:
;142:/*
;143:==================
;144:BotSetUserInfo
;145:==================
;146:*/
;147:void BotSetUserInfo(bot_state_t *bs, char *key, char *value) {
line 150
;148:	char userinfo[MAX_INFO_STRING];
;149:
;150:	trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 151
;151:	Info_SetValueForKey(userinfo, key, value);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 152
;152:	trap_SetUserinfo(bs->client, userinfo);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 153
;153:	ClientUserinfoChanged( bs->client );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 154
;154:}
LABELV $90
endproc BotSetUserInfo 1024 12
export BotCTFCarryingFlag
proc BotCTFCarryingFlag 4 0
line 161
;155:
;156:/*
;157:==================
;158:BotCTFCarryingFlag
;159:==================
;160:*/
;161:int BotCTFCarryingFlag(bot_state_t *bs) {
line 162
;162:	if (gametype != GT_CTF && gametype!=GT_CTF_ELIMINATION) return CTF_FLAG_NONE;
ADDRLP4 0
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $92
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $92
CNSTI4 0
RETI4
ADDRGP4 $91
JUMPV
LABELV $92
line 164
;163:
;164:	if (bs->inventory[INVENTORY_REDFLAG] > 0) return CTF_FLAG_RED;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRI4
CNSTI4 0
LEI4 $94
CNSTI4 1
RETI4
ADDRGP4 $91
JUMPV
LABELV $94
line 165
;165:	else if (bs->inventory[INVENTORY_BLUEFLAG] > 0) return CTF_FLAG_BLUE;
ADDRFP4 0
INDIRP4
CNSTI4 6168
ADDP4
INDIRI4
CNSTI4 0
LEI4 $96
CNSTI4 2
RETI4
ADDRGP4 $91
JUMPV
LABELV $96
line 166
;166:	return CTF_FLAG_NONE;
CNSTI4 0
RETI4
LABELV $91
endproc BotCTFCarryingFlag 4 0
export BotTeam
proc BotTeam 4 0
line 174
;167:}
;168:
;169:/*
;170:==================
;171:BotTeam
;172:==================
;173:*/
;174:int BotTeam(bot_state_t *bs) {
line 175
;175:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $101
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $99
LABELV $101
line 176
;176:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $98
JUMPV
LABELV $99
line 179
;177:	}
;178:
;179:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED) {
CNSTI4 2324
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $102
line 180
;180:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
LABELV $102
line 181
;181:	} else if (level.clients[bs->client].sess.sessionTeam == TEAM_BLUE) {
CNSTI4 2324
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
NEI4 $104
line 182
;182:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $98
JUMPV
LABELV $104
line 185
;183:	}
;184:
;185:	return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $98
endproc BotTeam 4 0
export BotOppositeTeam
proc BotOppositeTeam 12 4
line 193
;186:}
;187:
;188:/*
;189:==================
;190:BotOppositeTeam
;191:==================
;192:*/
;193:int BotOppositeTeam(bot_state_t *bs) {
line 194
;194:	switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $110
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $111
ADDRGP4 $107
JUMPV
LABELV $110
line 195
;195:		case TEAM_RED: return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $106
JUMPV
LABELV $111
line 196
;196:		case TEAM_BLUE: return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $106
JUMPV
LABELV $107
line 197
;197:		default: return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $106
endproc BotOppositeTeam 12 4
export BotEnemyFlag
proc BotEnemyFlag 4 4
line 206
;198:	}
;199:}
;200:
;201:/*
;202:==================
;203:BotEnemyFlag
;204:==================
;205:*/
;206:bot_goal_t *BotEnemyFlag(bot_state_t *bs) {
line 207
;207:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $113
line 208
;208:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
ADDRGP4 $112
JUMPV
LABELV $113
line 210
;209:	}
;210:	else {
line 211
;211:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
LABELV $112
endproc BotEnemyFlag 4 4
export BotTeamFlag
proc BotTeamFlag 4 4
line 220
;212:	}
;213:}
;214:
;215:/*
;216:==================
;217:BotTeamFlag
;218:==================
;219:*/
;220:bot_goal_t *BotTeamFlag(bot_state_t *bs) {
line 221
;221:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $116
line 222
;222:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
ADDRGP4 $115
JUMPV
LABELV $116
line 224
;223:	}
;224:	else {
line 225
;225:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
LABELV $115
endproc BotTeamFlag 4 4
export EntityIsDead
proc EntityIsDead 476 8
line 235
;226:	}
;227:}
;228:
;229:
;230:/*
;231:==================
;232:EntityIsDead
;233:==================
;234:*/
;235:qboolean EntityIsDead(aas_entityinfo_t *entinfo) {
line 238
;236:	playerState_t ps;
;237:
;238:	if (entinfo->number >= 0 && entinfo->number < MAX_CLIENTS) {
ADDRLP4 472
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 472
INDIRI4
CNSTI4 0
LTI4 $119
ADDRLP4 472
INDIRI4
CNSTI4 256
GEI4 $119
line 240
;239:		//retrieve the current client state
;240:		BotAI_GetClientState( entinfo->number, &ps );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 241
;241:		if (ps.pm_type != PM_NORMAL) return qtrue;
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $121
CNSTI4 1
RETI4
ADDRGP4 $118
JUMPV
LABELV $121
line 242
;242:	}
LABELV $119
line 243
;243:	return qfalse;
CNSTI4 0
RETI4
LABELV $118
endproc EntityIsDead 476 8
export EntityCarriesFlag
proc EntityCarriesFlag 0 0
line 251
;244:}
;245:
;246:/*
;247:==================
;248:EntityCarriesFlag
;249:==================
;250:*/
;251:qboolean EntityCarriesFlag(aas_entityinfo_t *entinfo) {
line 252
;252:	if ( entinfo->powerups & ( 1 << PW_REDFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $125
line 253
;253:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $124
JUMPV
LABELV $125
line 254
;254:	if ( entinfo->powerups & ( 1 << PW_BLUEFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $127
line 255
;255:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $124
JUMPV
LABELV $127
line 256
;256:	if ( entinfo->powerups & ( 1 << PW_NEUTRALFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $129
line 257
;257:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $124
JUMPV
LABELV $129
line 258
;258:	return qfalse;
CNSTI4 0
RETI4
LABELV $124
endproc EntityCarriesFlag 0 0
export EntityIsInvisible
proc EntityIsInvisible 4 4
line 266
;259:}
;260:
;261:/*
;262:==================
;263:EntityIsInvisible
;264:==================
;265:*/
;266:qboolean EntityIsInvisible(aas_entityinfo_t *entinfo) {
line 268
;267:	// the flag is always visible
;268:	if (EntityCarriesFlag(entinfo)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $132
line 269
;269:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $132
line 271
;270:	}
;271:	if (entinfo->powerups & (1 << PW_INVIS)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $134
line 272
;272:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $131
JUMPV
LABELV $134
line 274
;273:	}
;274:	return qfalse;
CNSTI4 0
RETI4
LABELV $131
endproc EntityIsInvisible 4 4
export EntityIsShooting
proc EntityIsShooting 0 0
line 282
;275:}
;276:
;277:/*
;278:==================
;279:EntityIsShooting
;280:==================
;281:*/
;282:qboolean EntityIsShooting(aas_entityinfo_t *entinfo) {
line 283
;283:	if (entinfo->flags & EF_FIRING) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $137
line 284
;284:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $136
JUMPV
LABELV $137
line 286
;285:	}
;286:	return qfalse;
CNSTI4 0
RETI4
LABELV $136
endproc EntityIsShooting 0 0
export EntityIsChatting
proc EntityIsChatting 0 0
line 294
;287:}
;288:
;289:/*
;290:==================
;291:EntityIsChatting
;292:==================
;293:*/
;294:qboolean EntityIsChatting(aas_entityinfo_t *entinfo) {
line 295
;295:	if (entinfo->flags & EF_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $140
line 296
;296:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $139
JUMPV
LABELV $140
line 298
;297:	}
;298:	return qfalse;
CNSTI4 0
RETI4
LABELV $139
endproc EntityIsChatting 0 0
export EntityHasQuad
proc EntityHasQuad 0 0
line 306
;299:}
;300:
;301:/*
;302:==================
;303:EntityHasQuad
;304:==================
;305:*/
;306:qboolean EntityHasQuad(aas_entityinfo_t *entinfo) {
line 307
;307:	if (entinfo->powerups & (1 << PW_QUAD)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $143
line 308
;308:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $142
JUMPV
LABELV $143
line 310
;309:	}
;310:	return qfalse;
CNSTI4 0
RETI4
LABELV $142
endproc EntityHasQuad 0 0
export EntityHasKamikaze
proc EntityHasKamikaze 0 0
line 318
;311:}
;312:
;313:/*
;314:==================
;315:EntityHasKamikze
;316:==================
;317:*/
;318:qboolean EntityHasKamikaze(aas_entityinfo_t *entinfo) {
line 319
;319:	if (entinfo->flags & EF_KAMIKAZE) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $146
line 320
;320:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $146
line 322
;321:	}
;322:	return qfalse;
CNSTI4 0
RETI4
LABELV $145
endproc EntityHasKamikaze 0 0
export EntityCarriesCubes
proc EntityCarriesCubes 228 8
line 330
;323:}
;324:
;325:/*
;326:==================
;327:EntityCarriesCubes
;328:==================
;329:*/
;330:qboolean EntityCarriesCubes(aas_entityinfo_t *entinfo) {
line 333
;331:	entityState_t state;
;332:
;333:	if (gametype != GT_HARVESTER)
ADDRGP4 gametype
INDIRI4
CNSTI4 8
EQI4 $149
line 334
;334:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $148
JUMPV
LABELV $149
line 336
;335:	//FIXME: get this info from the aas_entityinfo_t ?
;336:	BotAI_GetEntityState(entinfo->number, &state);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 337
;337:	if (state.generic1 > 0)
ADDRLP4 0+216
INDIRI4
CNSTI4 0
LEI4 $151
line 338
;338:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $148
JUMPV
LABELV $151
line 339
;339:	return qfalse;
CNSTI4 0
RETI4
LABELV $148
endproc EntityCarriesCubes 228 8
export Bot1FCTFCarryingFlag
proc Bot1FCTFCarryingFlag 0 0
line 347
;340:}
;341:
;342:/*
;343:==================
;344:Bot1FCTFCarryingFlag
;345:==================
;346:*/
;347:int Bot1FCTFCarryingFlag(bot_state_t *bs) {
line 348
;348:	if (gametype != GT_1FCTF) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 6
EQI4 $155
CNSTI4 0
RETI4
ADDRGP4 $154
JUMPV
LABELV $155
line 350
;349:
;350:	if (bs->inventory[INVENTORY_NEUTRALFLAG] > 0) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
INDIRI4
CNSTI4 0
LEI4 $157
CNSTI4 1
RETI4
ADDRGP4 $154
JUMPV
LABELV $157
line 351
;351:	return qfalse;
CNSTI4 0
RETI4
LABELV $154
endproc Bot1FCTFCarryingFlag 0 0
export BotHarvesterCarryingCubes
proc BotHarvesterCarryingCubes 0 0
line 359
;352:}
;353:
;354:/*
;355:==================
;356:BotHarvesterCarryingCubes
;357:==================
;358:*/
;359:int BotHarvesterCarryingCubes(bot_state_t *bs) {
line 360
;360:	if (gametype != GT_HARVESTER) return qfalse;
ADDRGP4 gametype
INDIRI4
CNSTI4 8
EQI4 $160
CNSTI4 0
RETI4
ADDRGP4 $159
JUMPV
LABELV $160
line 362
;361:
;362:	if (bs->inventory[INVENTORY_REDCUBE] > 0) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
INDIRI4
CNSTI4 0
LEI4 $162
CNSTI4 1
RETI4
ADDRGP4 $159
JUMPV
LABELV $162
line 363
;363:	if (bs->inventory[INVENTORY_BLUECUBE] > 0) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRI4
CNSTI4 0
LEI4 $164
CNSTI4 1
RETI4
ADDRGP4 $159
JUMPV
LABELV $164
line 364
;364:	return qfalse;
CNSTI4 0
RETI4
LABELV $159
endproc BotHarvesterCarryingCubes 0 0
export BotRememberLastOrderedTask
proc BotRememberLastOrderedTask 16 12
line 373
;365:}
;366:
;367:
;368:/*
;369:==================
;370:BotRememberLastOrderedTask
;371:==================
;372:*/
;373:void BotRememberLastOrderedTask(bot_state_t *bs) {
line 374
;374:	if (!bs->ordered) {
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
INDIRI4
CNSTI4 0
NEI4 $167
line 375
;375:		return;
ADDRGP4 $166
JUMPV
LABELV $167
line 377
;376:	}
;377:	bs->lastgoal_decisionmaker = bs->decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 10860
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ASGNI4
line 378
;378:	bs->lastgoal_ltgtype = bs->ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 10864
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
line 379
;379:	memcpy(&bs->lastgoal_teamgoal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 10872
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 380
;380:	bs->lastgoal_teammate = bs->teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 10868
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ASGNI4
line 381
;381:}
LABELV $166
endproc BotRememberLastOrderedTask 16 12
export BotSetTeamStatus
proc BotSetTeamStatus 172 12
line 388
;382:
;383:/*
;384:==================
;385:BotSetTeamStatus
;386:==================
;387:*/
;388:void BotSetTeamStatus(bot_state_t *bs) {
line 392
;389:	int teamtask;
;390:	aas_entityinfo_t entinfo;
;391:
;392:	teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 394
;393:
;394:	switch(bs->ltgtype) {
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 1
LTI4 $170
ADDRLP4 144
INDIRI4
CNSTI4 17
GTI4 $170
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $197-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $197
address $171
address $174
address $181
address $182
address $183
address $184
address $185
address $185
address $186
address $187
address $188
address $189
address $190
address $170
address $170
address $191
address $194
code
line 396
;395:		case LTG_TEAMHELP:
;396:			break;
LABELV $174
line 398
;397:		case LTG_TEAMACCOMPANY:
;398:			BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 399
;399:			if ( ( (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION || gametype == GT_1FCTF) && EntityCarriesFlag(&entinfo))
ADDRLP4 152
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 5
EQI4 $180
ADDRLP4 152
INDIRI4
CNSTI4 10
EQI4 $180
ADDRLP4 152
INDIRI4
CNSTI4 6
NEI4 $178
LABELV $180
ADDRLP4 4
ARGP4
ADDRLP4 156
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $177
LABELV $178
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $175
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $175
LABELV $177
line 400
;400:				|| ( gametype == GT_HARVESTER && EntityCarriesCubes(&entinfo)) ) {
line 401
;401:				teamtask = TEAMTASK_ESCORT;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 402
;402:			}
ADDRGP4 $171
JUMPV
LABELV $175
line 403
;403:			else {
line 404
;404:				teamtask = TEAMTASK_FOLLOW;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 405
;405:			}
line 406
;406:			break;
ADDRGP4 $171
JUMPV
LABELV $181
line 408
;407:		case LTG_DEFENDKEYAREA:
;408:			teamtask = TEAMTASK_DEFENSE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 409
;409:			break;
ADDRGP4 $171
JUMPV
LABELV $182
line 411
;410:		case LTG_GETFLAG:
;411:			teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 412
;412:			break;
ADDRGP4 $171
JUMPV
LABELV $183
line 414
;413:		case LTG_RUSHBASE:
;414:			teamtask = TEAMTASK_DEFENSE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 415
;415:			break;
ADDRGP4 $171
JUMPV
LABELV $184
line 417
;416:		case LTG_RETURNFLAG:
;417:			teamtask = TEAMTASK_RETRIEVE;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 418
;418:			break;
ADDRGP4 $171
JUMPV
LABELV $185
line 421
;419:		case LTG_CAMP:
;420:		case LTG_CAMPORDER:
;421:			teamtask = TEAMTASK_CAMP;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 422
;422:			break;
ADDRGP4 $171
JUMPV
LABELV $186
line 424
;423:		case LTG_PATROL:
;424:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 425
;425:			break;
ADDRGP4 $171
JUMPV
LABELV $187
line 427
;426:		case LTG_GETITEM:
;427:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 428
;428:			break;
ADDRGP4 $171
JUMPV
LABELV $188
line 430
;429:		case LTG_KILL:
;430:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 431
;431:			break;
ADDRGP4 $171
JUMPV
LABELV $189
line 433
;432:		case LTG_HARVEST:
;433:			teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 434
;434:			break;
ADDRGP4 $171
JUMPV
LABELV $190
line 436
;435:		case LTG_ATTACKENEMYBASE:
;436:			teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 437
;437:			break;
ADDRGP4 $171
JUMPV
LABELV $191
line 439
;438:		case LTG_POINTA:
;439:			if(BotTeam(bs) == TEAM_BLUE)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 2
NEI4 $192
line 440
;440:				teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $193
JUMPV
LABELV $192
line 442
;441:			else
;442:				teamtask = TEAMTASK_DEFENSE;
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $193
LABELV $194
line 444
;443:		case LTG_POINTB:
;444:			if(BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 1
NEI4 $195
line 445
;445:				teamtask = TEAMTASK_OFFENSE;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $196
JUMPV
LABELV $195
line 447
;446:			else
;447:				teamtask = TEAMTASK_DEFENSE;
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $196
LABELV $170
line 449
;448:		default:
;449:			teamtask = TEAMTASK_PATROL;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 450
;450:			break;
LABELV $171
line 452
;451:	}
;452:	BotSetUserInfo(bs, "teamtask", va("%d", teamtask));
ADDRGP4 $200
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 453
;453:}
LABELV $169
endproc BotSetTeamStatus 172 12
export BotSetLastOrderedTask
proc BotSetLastOrderedTask 68 16
line 460
;454:
;455:/*
;456:==================
;457:BotSetLastOrderedTask
;458:==================
;459:*/
;460:int BotSetLastOrderedTask(bot_state_t *bs) {
line 462
;461:
;462:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 0
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $204
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $202
LABELV $204
line 464
;463:		// don't go back to returning the flag if it's at the base
;464:		if ( bs->lastgoal_ltgtype == LTG_RETURNFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
CNSTI4 6
NEI4 $205
line 465
;465:			if ( BotTeam(bs) == TEAM_RED ) {
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
NEI4 $207
line 466
;466:				if ( bs->redflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 11056
ADDP4
INDIRI4
CNSTI4 0
NEI4 $208
line 467
;467:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
CNSTI4 0
ASGNI4
line 468
;468:				}
line 469
;469:			}
ADDRGP4 $208
JUMPV
LABELV $207
line 470
;470:			else {
line 471
;471:				if ( bs->blueflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 11060
ADDP4
INDIRI4
CNSTI4 0
NEI4 $211
line 472
;472:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
CNSTI4 0
ASGNI4
line 473
;473:				}
LABELV $211
line 474
;474:			}
LABELV $208
line 475
;475:		}
LABELV $205
line 476
;476:	}
LABELV $202
line 478
;477:
;478:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
CNSTI4 0
EQI4 $213
line 479
;479:		bs->decisionmaker = bs->lastgoal_decisionmaker;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 10860
ADDP4
INDIRI4
ASGNI4
line 480
;480:		bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 481
;481:		bs->ltgtype = bs->lastgoal_ltgtype;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 10704
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
ASGNI4
line 482
;482:		memcpy(&bs->teamgoal, &bs->lastgoal_teamgoal, sizeof(bot_goal_t));
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 10872
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 483
;483:		bs->teammate = bs->lastgoal_teammate;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 10708
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 10868
ADDP4
INDIRI4
ASGNI4
line 484
;484:		bs->teamgoal_time = FloatTime() + 300;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1133903872
ADDF4
ASGNF4
line 485
;485:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 487
;486:		//
;487:		if ( gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 20
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $217
ADDRLP4 20
INDIRI4
CNSTI4 10
NEI4 $215
LABELV $217
line 488
;488:			if ( bs->ltgtype == LTG_GETFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 4
NEI4 $218
line 492
;489:				bot_goal_t *tb, *eb;
;490:				int tt, et;
;491:
;492:				tb = BotTeamFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BotTeamFlag
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 40
INDIRP4
ASGNP4
line 493
;493:				eb = BotEnemyFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 BotEnemyFlag
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 44
INDIRP4
ASGNP4
line 494
;494:				tt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, tb->areanum, TFL_DEFAULT);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 52
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 52
INDIRI4
ASGNI4
line 495
;495:				et = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, eb->areanum, TFL_DEFAULT);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 60
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 60
INDIRI4
ASGNI4
line 497
;496:				// if the travel time towards the enemy base is larger than towards our base
;497:				if (et > tt) {
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $220
line 499
;498:					//get an alternative route goal towards the enemy base
;499:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 500
;500:				}
LABELV $220
line 501
;501:			}
LABELV $218
line 502
;502:		}
LABELV $215
line 503
;503:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $201
JUMPV
LABELV $213
line 505
;504:	}
;505:	return qfalse;
CNSTI4 0
RETI4
LABELV $201
endproc BotSetLastOrderedTask 68 16
export BotRefuseOrder
proc BotRefuseOrder 8 12
line 513
;506:}
;507:
;508:/*
;509:==================
;510:BotRefuseOrder
;511:==================
;512:*/
;513:void BotRefuseOrder(bot_state_t *bs) {
line 514
;514:	if (!bs->ordered)
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
INDIRI4
CNSTI4 0
NEI4 $223
line 515
;515:		return;
ADDRGP4 $222
JUMPV
LABELV $223
line 517
;516:	// if the bot was ordered to do something
;517:	if ( bs->order_time && bs->order_time > FloatTime() - 10 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $225
ADDRLP4 0
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
LEF4 $225
line 518
;518:		trap_EA_Action(bs->client, ACTION_NEGATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 2097152
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 519
;519:		BotVoiceChat(bs, bs->decisionmaker, VOICECHAT_NO);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 10712
ADDP4
INDIRI4
ARGI4
ADDRGP4 $227
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 520
;520:		bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
CNSTF4 0
ASGNF4
line 521
;521:	}
LABELV $225
line 522
;522:}
LABELV $222
endproc BotRefuseOrder 8 12
export BotCTFSeekGoals
proc BotCTFSeekGoals 240 12
line 529
;523:
;524:/*
;525:==================
;526:BotCTFSeekGoals
;527:==================
;528:*/
;529:void BotCTFSeekGoals(bot_state_t *bs) {
line 536
;530:	float rnd, l1, l2;
;531:	int flagstatus, c;
;532:	vec3_t dir;
;533:	aas_entityinfo_t entinfo;
;534:
;535:	//when carrying a flag in ctf the bot should rush to the base
;536:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $229
line 538
;537:		//if not already rushing to the base
;538:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 5
EQI4 $231
line 539
;539:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 540
;540:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 5
ASGNI4
line 541
;541:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 542
;542:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
CNSTF4 0
ASGNF4
line 543
;543:			bs->decisionmaker = bs->client;
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 176
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 544
;544:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 546
;545:			//
;546:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
ADDRLP4 184
INDIRI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
EQI4 $236
ADDRLP4 180
INDIRI4
CNSTI4 2
EQI4 $241
ADDRGP4 $233
JUMPV
LABELV $236
line 547
;547:				case TEAM_RED: VectorSubtract(bs->origin, ctf_blueflag.origin, dir); break;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 192
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 192
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $234
JUMPV
LABELV $241
line 548
;548:				case TEAM_BLUE: VectorSubtract(bs->origin, ctf_redflag.origin, dir); break;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 196
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRGP4 ctf_redflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 196
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $234
JUMPV
LABELV $233
line 549
;549:				default: VectorSet(dir, 999, 999, 999); break;
ADDRLP4 200
CNSTF4 1148829696
ASGNF4
ADDRLP4 160
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 160+8
CNSTF4 1148829696
ASGNF4
LABELV $234
line 552
;550:			}
;551:			// if the bot picked up the flag very close to the enemy base
;552:			if ( VectorLength(dir) < 128 ) {
ADDRLP4 160
ARGP4
ADDRLP4 192
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 192
INDIRF4
CNSTF4 1124073472
GEF4 $248
line 554
;553:				// get an alternative route goal through the enemy base
;554:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 555
;555:			} else {
ADDRGP4 $249
JUMPV
LABELV $248
line 557
;556:				// don't use any alt route goal, just get the hell out of the base
;557:				bs->altroutegoal.areanum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10796
ADDP4
CNSTI4 0
ASGNI4
line 558
;558:			}
LABELV $249
line 559
;559:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_OFFENSE));
ADDRGP4 $200
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 196
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 560
;560:                        BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $250
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 561
;561:		}
ADDRGP4 $228
JUMPV
LABELV $231
line 562
;562:		else if (bs->rushbaseaway_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $228
line 563
;563:			if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
NEI4 $253
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 11056
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $254
JUMPV
LABELV $253
line 564
;564:			else flagstatus = bs->blueflagstatus;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 11060
ADDP4
INDIRI4
ASGNI4
LABELV $254
line 566
;565:			//if the flag is back
;566:			if (flagstatus == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $228
line 567
;567:				bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
CNSTF4 0
ASGNF4
line 568
;568:			}
line 569
;569:		}
line 570
;570:		return;
ADDRGP4 $228
JUMPV
LABELV $229
line 573
;571:	}
;572:	// if the bot decided to follow someone
;573:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 2
NEI4 $257
ADDRLP4 176
INDIRP4
CNSTI4 10716
ADDP4
INDIRI4
CNSTI4 0
NEI4 $257
line 575
;574:		// if the team mate being accompanied no longer carries the flag
;575:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 576
;576:		if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 16
ARGP4
ADDRLP4 180
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $259
line 577
;577:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 578
;578:		}
LABELV $259
line 579
;579:	}
LABELV $257
line 581
;580:	//
;581:	if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
NEI4 $261
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 184
INDIRP4
CNSTI4 11056
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 184
INDIRP4
CNSTI4 11060
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $262
JUMPV
LABELV $261
line 582
;582:	else flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 188
INDIRP4
CNSTI4 11060
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 188
INDIRP4
CNSTI4 11056
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $262
line 584
;583:	//if our team has the enemy flag and our flag is at the base
;584:	if (flagstatus == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $263
line 586
;585:		//
;586:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $228
line 588
;587:			//if Not defending the base already
;588:			if (!(bs->ltgtype == LTG_DEFENDKEYAREA &&
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 3
NEI4 $271
ADDRLP4 196
ADDRLP4 192
INDIRP4
CNSTI4 10772
ADDP4
INDIRI4
ASGNI4
ADDRLP4 196
INDIRI4
ADDRGP4 ctf_redflag+44
INDIRI4
EQI4 $228
ADDRLP4 196
INDIRI4
ADDRGP4 ctf_blueflag+44
INDIRI4
EQI4 $228
LABELV $271
line 590
;589:					(bs->teamgoal.number == ctf_redflag.number ||
;590:					bs->teamgoal.number == ctf_blueflag.number))) {
line 592
;591:				//if there is a visible team mate flag carrier
;592:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 200
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 200
INDIRI4
ASGNI4
line 593
;593:				if (c >= 0 &&
ADDRLP4 204
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
LTI4 $228
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 2
NEI4 $274
ADDRLP4 208
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $228
LABELV $274
line 595
;594:						// and not already following the team mate flag carrier
;595:						(bs->ltgtype != LTG_TEAMACCOMPANY || bs->teammate != c)) {
line 597
;596:					//
;597:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 599
;598:					//follow the flag carrier
;599:					bs->decisionmaker = bs->client;
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 212
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 600
;600:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 602
;601:					//the team mate
;602:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 604
;603:					//last time the team mate was visible
;604:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 606
;605:					//no message
;606:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 608
;607:					//no arrive message
;608:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
CNSTF4 1065353216
ASGNF4
line 610
;609:					//
;610:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
INDIRP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRGP4 $275
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 612
;611:					//get the team goal time
;612:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 613
;613:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 2
ASGNI4
line 614
;614:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 11116
ADDP4
CNSTF4 1121976320
ASGNF4
line 615
;615:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 616
;616:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 617
;617:				}
line 618
;618:			}
line 619
;619:		}
line 620
;620:		return;
ADDRGP4 $228
JUMPV
LABELV $263
line 623
;621:	}
;622:	//if the enemy has our flag
;623:	else if (flagstatus == 2) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $276
line 625
;624:		//
;625:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $228
line 627
;626:			//if enemy flag carrier is visible
;627:			c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 192
INDIRI4
ASGNI4
line 628
;628:			if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $280
line 630
;629:				//FIXME: fight enemy flag carrier
;630:			}
LABELV $280
line 632
;631:			//if not already doing something important
;632:			if (bs->ltgtype != LTG_GETFLAG &&
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 4
EQI4 $228
ADDRLP4 196
INDIRI4
CNSTI4 6
EQI4 $228
ADDRLP4 196
INDIRI4
CNSTI4 1
EQI4 $228
ADDRLP4 196
INDIRI4
CNSTI4 2
EQI4 $228
ADDRLP4 196
INDIRI4
CNSTI4 8
EQI4 $228
ADDRLP4 196
INDIRI4
CNSTI4 9
EQI4 $228
ADDRLP4 196
INDIRI4
CNSTI4 10
EQI4 $228
line 638
;633:				bs->ltgtype != LTG_RETURNFLAG &&
;634:				bs->ltgtype != LTG_TEAMHELP &&
;635:				bs->ltgtype != LTG_TEAMACCOMPANY &&
;636:				bs->ltgtype != LTG_CAMPORDER &&
;637:				bs->ltgtype != LTG_PATROL &&
;638:				bs->ltgtype != LTG_GETITEM) {
line 640
;639:
;640:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 641
;641:				bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 642
;642:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 644
;643:				//
;644:				if (random() < 0.5) {
ADDRLP4 204
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $284
line 646
;645:					//go for the enemy flag
;646:					bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 4
ASGNI4
line 647
;647:				}
ADDRGP4 $285
JUMPV
LABELV $284
line 648
;648:				else {
line 649
;649:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 6
ASGNI4
line 650
;650:				}
LABELV $285
line 652
;651:				//no team message
;652:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 654
;653:				//set the time the bot will stop getting the flag
;654:				bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 656
;655:				//get an alternative route goal towards the enemy base
;656:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 658
;657:				//
;658:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 659
;659:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 660
;660:			}
line 661
;661:		}
line 662
;662:		return;
ADDRGP4 $228
JUMPV
LABELV $276
line 665
;663:	}
;664:	//if both flags Not at their bases
;665:	else if (flagstatus == 3) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $286
line 667
;666:		//
;667:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $228
line 669
;668:			// if not trying to return the flag and not following the team flag carrier
;669:			if ( bs->ltgtype != LTG_RETURNFLAG && bs->ltgtype != LTG_TEAMACCOMPANY ) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 6
EQI4 $228
ADDRLP4 192
INDIRI4
CNSTI4 2
EQI4 $228
line 671
;670:				//
;671:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 196
INDIRI4
ASGNI4
line 673
;672:				// if there is a visible team mate flag carrier
;673:				if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $292
line 674
;674:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 676
;675:					//follow the flag carrier
;676:					bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 677
;677:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 679
;678:					//the team mate
;679:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 681
;680:					//last time the team mate was visible
;681:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 683
;682:					//no message
;683:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 685
;684:					//no arrive message
;685:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
CNSTF4 1065353216
ASGNF4
line 687
;686:					//
;687:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRLP4 204
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRGP4 $275
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 689
;688:					//get the team goal time
;689:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 690
;690:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 2
ASGNI4
line 691
;691:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 11116
ADDP4
CNSTF4 1121976320
ASGNF4
line 693
;692:					//
;693:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 694
;694:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 695
;695:				}
ADDRGP4 $228
JUMPV
LABELV $292
line 696
;696:				else {
line 697
;697:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 698
;698:					bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 699
;699:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 701
;700:					//get the enemy flag
;701:					bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 204
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
ADDRLP4 204
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 703
;702:					//get the flag
;703:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 6
ASGNI4
line 705
;704:					//set the time the bot will stop getting the flag
;705:					bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 707
;706:					//get an alternative route goal towards the enemy base
;707:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 709
;708:					//
;709:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 710
;710:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 711
;711:				}
line 712
;712:			}
line 713
;713:		}
line 714
;714:		return;
ADDRGP4 $228
JUMPV
LABELV $286
line 717
;715:	}
;716:	// don't just do something wait for the bot team leader to give orders
;717:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $294
line 718
;718:		return;
ADDRGP4 $228
JUMPV
LABELV $294
line 721
;719:	}
;720:	// if the bot is ordered to do something
;721:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
CNSTI4 0
EQI4 $296
line 722
;722:		bs->teamgoal_time += 60;
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 723
;723:	}
LABELV $296
line 725
;724:	// if the bot decided to do something on it's own and has a last ordered goal
;725:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 196
INDIRP4
CNSTI4 10716
ADDP4
INDIRI4
ADDRLP4 200
INDIRI4
NEI4 $298
ADDRLP4 196
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
ADDRLP4 200
INDIRI4
EQI4 $298
line 726
;726:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 727
;727:	}
LABELV $298
line 729
;728:	//if already a CTF or team goal
;729:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 1
EQI4 $311
ADDRLP4 204
INDIRI4
CNSTI4 2
EQI4 $311
ADDRLP4 204
INDIRI4
CNSTI4 3
EQI4 $311
ADDRLP4 204
INDIRI4
CNSTI4 4
EQI4 $311
ADDRLP4 204
INDIRI4
CNSTI4 5
EQI4 $311
ADDRLP4 204
INDIRI4
CNSTI4 6
EQI4 $311
ADDRLP4 204
INDIRI4
CNSTI4 8
EQI4 $311
ADDRLP4 204
INDIRI4
CNSTI4 9
EQI4 $311
ADDRLP4 204
INDIRI4
CNSTI4 10
EQI4 $311
ADDRLP4 204
INDIRI4
CNSTI4 14
EQI4 $311
ADDRLP4 204
INDIRI4
CNSTI4 15
NEI4 $300
LABELV $311
line 739
;730:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;731:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;732:			bs->ltgtype == LTG_GETFLAG ||
;733:			bs->ltgtype == LTG_RUSHBASE ||
;734:			bs->ltgtype == LTG_RETURNFLAG ||
;735:			bs->ltgtype == LTG_CAMPORDER ||
;736:			bs->ltgtype == LTG_PATROL ||
;737:			bs->ltgtype == LTG_GETITEM ||
;738:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;739:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 740
;740:		return;
ADDRGP4 $228
JUMPV
LABELV $300
line 743
;741:	}
;742:	//
;743:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $312
line 744
;744:		return;
ADDRGP4 $228
JUMPV
LABELV $312
line 746
;745:	//
;746:	if (bs->owndecision_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
LEF4 $314
line 747
;747:		return;;
ADDRGP4 $228
JUMPV
LABELV $314
line 749
;748:	//if the bot is roaming
;749:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 10268
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $316
line 750
;750:		return;
ADDRGP4 $228
JUMPV
LABELV $316
line 752
;751:	//if the bot has anough aggression to decide what to do
;752:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 212
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 212
INDIRF4
CNSTF4 1112014848
GEF4 $318
line 753
;753:		return;
ADDRGP4 $228
JUMPV
LABELV $318
line 755
;754:	//set the time to send a message to the team mates
;755:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 216
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
ADDRLP4 216
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 757
;756:	//
;757:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $320
line 758
;758:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $322
line 759
;759:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 760
;760:		}
ADDRGP4 $323
JUMPV
LABELV $322
line 761
;761:		else {
line 762
;762:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 763
;763:		}
LABELV $323
line 764
;764:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 765
;765:	}
ADDRGP4 $321
JUMPV
LABELV $320
line 766
;766:	else {
line 767
;767:		l1 = 0.4f;
ADDRLP4 8
CNSTF4 1053609165
ASGNF4
line 768
;768:		l2 = 0.7f;
ADDRLP4 12
CNSTF4 1060320051
ASGNF4
line 769
;769:	}
LABELV $321
line 771
;770:	//get the flag or defend the base
;771:	rnd = random();
ADDRLP4 220
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 220
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 772
;772:	if (rnd < l1 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $324
ADDRLP4 224
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 224
INDIRI4
EQI4 $324
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 224
INDIRI4
EQI4 $324
line 773
;773:		bs->decisionmaker = bs->client;
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 228
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 774
;774:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 775
;775:		bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 4
ASGNI4
line 777
;776:		//set the time the bot will stop getting the flag
;777:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 779
;778:		//get an alternative route goal towards the enemy base
;779:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 780
;780:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 781
;781:	}
ADDRGP4 $325
JUMPV
LABELV $324
line 782
;782:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $328
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $328
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $328
line 783
;783:		bs->decisionmaker = bs->client;
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 232
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 784
;784:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 786
;785:		//
;786:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 1
NEI4 $332
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $333
JUMPV
LABELV $332
line 787
;787:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $333
line 789
;788:		//set the ltg type
;789:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 3
ASGNI4
line 791
;790:		//set the time the bot stops defending the base
;791:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 792
;792:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
CNSTF4 0
ASGNF4
line 793
;793:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 794
;794:	}
ADDRGP4 $329
JUMPV
LABELV $328
line 795
;795:	else {
line 796
;796:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 798
;797:		//set the time the bot will stop roaming
;798:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10268
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 799
;799:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 800
;800:	}
LABELV $329
LABELV $325
line 801
;801:	bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 805
;802:#ifdef DEBUG
;803:	BotPrintTeamGoal(bs);
;804:#endif //DEBUG
;805:}
LABELV $228
endproc BotCTFSeekGoals 240 12
export BotCTFRetreatGoals
proc BotCTFRetreatGoals 8 4
line 812
;806:
;807:/*
;808:==================
;809:BotCTFRetreatGoals
;810:==================
;811:*/
;812:void BotCTFRetreatGoals(bot_state_t *bs) {
line 814
;813:	//when carrying a flag in ctf the bot should rush to the base
;814:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $335
line 816
;815:		//if not already rushing to the base
;816:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 5
EQI4 $337
line 817
;817:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 818
;818:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 5
ASGNI4
line 819
;819:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 820
;820:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
CNSTF4 0
ASGNF4
line 821
;821:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 822
;822:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 823
;823:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 824
;824:		}
LABELV $337
line 825
;825:	}
LABELV $335
line 826
;826:}
LABELV $334
endproc BotCTFRetreatGoals 8 4
export BotDDSeekGoals
proc BotDDSeekGoals 20 12
line 863
;827:
;828:/*
;829:==================
;830:BotDomSeekGoals
;831:==================
;832: */
;833:
;834:/*void BotDomSeekGoals(bot_state_t *bs) {
;835:    int index;
;836:    bs->ltgtype = LTG_DOMHOLD; //For debugging we are forcing roam
;837:    
;838:    index=0;
;839:    //dom_points_bot[i]
;840:    
;841:    if(bs->ltgtype == LTG_DOMHOLD) {
;842:        //index = 0;
;843:        index = ((rand()) % (level.domination_points_count));
;844:    }
;845:    
;846:    //if(bs->ltgtype == LTG_DOMROAM) {
;847:        
;848:    //}
;849:        
;850:    memcpy(&bs->teamgoal, &dom_points_bot[index], sizeof(bot_goal_t));
;851:
;852:    BotAlternateRoute(bs, &bs->teamgoal);
;853:
;854:    BotSetTeamStatus(bs);
;855:}*/
;856:
;857:/*
;858:==================
;859:BotDDSeekGoals
;860:==================
;861:*/
;862:
;863:void BotDDSeekGoals(bot_state_t *bs) {
line 873
;864:
;865:	/*if (bs->ltgtype == LTG_TEAMHELP ||
;866:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;867:			bs->ltgtype == LTG_CAMPORDER ||
;868:			bs->ltgtype == LTG_PATROL ||
;869:			bs->ltgtype == LTG_GETITEM) {
;870:		return;
;871:	}*/
;872:
;873:	if(bs->ltgtype == LTG_POINTA)
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 16
NEI4 $340
line 874
;874:		memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $340
line 875
;875:	if(bs->ltgtype == LTG_POINTB)
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 17
NEI4 $342
line 876
;876:		memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $342
line 878
;877:
;878:	if(bs->ltgtype == LTG_POINTA || bs->ltgtype == LTG_POINTB)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
EQI4 $346
ADDRLP4 0
INDIRI4
CNSTI4 17
NEI4 $344
LABELV $346
line 879
;879:		return;
ADDRGP4 $339
JUMPV
LABELV $344
line 881
;880:
;881:	if(rand()%2==0)
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
MODI4
CNSTI4 0
NEI4 $347
line 882
;882:		bs->ltgtype = LTG_POINTA;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 16
ASGNI4
ADDRGP4 $348
JUMPV
LABELV $347
line 884
;883:	else
;884:		bs->ltgtype = LTG_POINTB;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 17
ASGNI4
LABELV $348
line 886
;885:
;886:	if(bs->ltgtype == LTG_POINTA) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 16
NEI4 $349
line 887
;887:		memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 888
;888:		if(BotTeam(bs) == TEAM_BLUE)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $351
line 889
;889:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_OFFENSE));
ADDRGP4 $200
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
ADDRGP4 $350
JUMPV
LABELV $351
line 891
;890:		else
;891:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_DEFENSE));
ADDRGP4 $200
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 892
;892:	} else
ADDRGP4 $350
JUMPV
LABELV $349
line 893
;893:	if(bs->ltgtype == LTG_POINTB) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 17
NEI4 $353
line 894
;894:		memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 895
;895:		if(BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $355
line 896
;896:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_OFFENSE));
ADDRGP4 $200
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
ADDRGP4 $356
JUMPV
LABELV $355
line 898
;897:		else
;898:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_DEFENSE));
ADDRGP4 $200
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $199
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
LABELV $356
line 899
;899:	}
LABELV $353
LABELV $350
line 902
;900:
;901:
;902:}
LABELV $339
endproc BotDDSeekGoals 20 12
export Bot1FCTFSeekGoals
proc Bot1FCTFSeekGoals 208 12
line 909
;903:
;904:/*
;905:==================
;906:Bot1FCTFSeekGoals
;907:==================
;908:*/
;909:void Bot1FCTFSeekGoals(bot_state_t *bs) {
line 915
;910:	aas_entityinfo_t entinfo;
;911:	float rnd, l1, l2;
;912:	int c;
;913:
;914:	//when carrying a flag in ctf the bot should rush to the base
;915:	if (Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $358
line 917
;916:		//if not already rushing to the base
;917:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 5
EQI4 $357
line 918
;918:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 919
;919:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 5
ASGNI4
line 920
;920:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 921
;921:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
CNSTF4 0
ASGNF4
line 922
;922:			bs->decisionmaker = bs->client;
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 160
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 923
;923:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 925
;924:			//get an alternative route goal towards the enemy base
;925:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 927
;926:			//
;927:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 928
;928:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $250
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 929
;929:		}
line 930
;930:		return;
ADDRGP4 $357
JUMPV
LABELV $358
line 933
;931:	}
;932:	// if the bot decided to follow someone
;933:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 2
NEI4 $362
ADDRLP4 160
INDIRP4
CNSTI4 10716
ADDP4
INDIRI4
CNSTI4 0
NEI4 $362
line 935
;934:		// if the team mate being accompanied no longer carries the flag
;935:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 936
;936:		if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 12
ARGP4
ADDRLP4 164
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $364
line 937
;937:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 938
;938:		}
LABELV $364
line 939
;939:	}
LABELV $362
line 941
;940:	//our team has the flag
;941:	if (bs->neutralflagstatus == 1) {
ADDRFP4 0
INDIRP4
CNSTI4 11064
ADDP4
INDIRI4
CNSTI4 1
NEI4 $366
line 942
;942:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $357
line 944
;943:			// if not already following someone
;944:			if (bs->ltgtype != LTG_TEAMACCOMPANY) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 2
EQI4 $370
line 946
;945:				//if there is a visible team mate flag carrier
;946:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 164
INDIRI4
ASGNI4
line 947
;947:				if (c >= 0) {
ADDRLP4 152
INDIRI4
CNSTI4 0
LTI4 $372
line 948
;948:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 950
;949:					//follow the flag carrier
;950:					bs->decisionmaker = bs->client;
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 168
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 951
;951:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 953
;952:					//the team mate
;953:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 955
;954:					//last time the team mate was visible
;955:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 957
;956:					//no message
;957:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 959
;958:					//no arrive message
;959:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
CNSTF4 1065353216
ASGNF4
line 961
;960:					//
;961:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRGP4 $275
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 963
;962:					//get the team goal time
;963:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 964
;964:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 2
ASGNI4
line 965
;965:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 11116
ADDP4
CNSTF4 1121976320
ASGNF4
line 966
;966:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 967
;967:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 968
;968:					return;
ADDRGP4 $357
JUMPV
LABELV $372
line 970
;969:				}
;970:			}
LABELV $370
line 972
;971:			//if already a CTF or team goal
;972:			if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 1
EQI4 $385
ADDRLP4 164
INDIRI4
CNSTI4 2
EQI4 $385
ADDRLP4 164
INDIRI4
CNSTI4 3
EQI4 $385
ADDRLP4 164
INDIRI4
CNSTI4 4
EQI4 $385
ADDRLP4 164
INDIRI4
CNSTI4 5
EQI4 $385
ADDRLP4 164
INDIRI4
CNSTI4 8
EQI4 $385
ADDRLP4 164
INDIRI4
CNSTI4 9
EQI4 $385
ADDRLP4 164
INDIRI4
CNSTI4 13
EQI4 $385
ADDRLP4 164
INDIRI4
CNSTI4 10
EQI4 $385
ADDRLP4 164
INDIRI4
CNSTI4 14
EQI4 $385
ADDRLP4 164
INDIRI4
CNSTI4 15
NEI4 $374
LABELV $385
line 982
;973:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;974:					bs->ltgtype == LTG_DEFENDKEYAREA ||
;975:					bs->ltgtype == LTG_GETFLAG ||
;976:					bs->ltgtype == LTG_RUSHBASE ||
;977:					bs->ltgtype == LTG_CAMPORDER ||
;978:					bs->ltgtype == LTG_PATROL ||
;979:					bs->ltgtype == LTG_ATTACKENEMYBASE ||
;980:					bs->ltgtype == LTG_GETITEM ||
;981:					bs->ltgtype == LTG_MAKELOVE_UNDER ||
;982:					bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 983
;983:				return;
ADDRGP4 $357
JUMPV
LABELV $374
line 986
;984:			}
;985:			//if not already attacking the enemy base
;986:			if (bs->ltgtype != LTG_ATTACKENEMYBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 13
EQI4 $357
line 987
;987:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 988
;988:				bs->decisionmaker = bs->client;
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 168
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 989
;989:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 991
;990:				//
;991:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
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
NEI4 $388
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $389
JUMPV
LABELV $388
line 992
;992:				else memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $389
line 994
;993:				//set the ltg type
;994:				bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 13
ASGNI4
line 996
;995:				//set the time the bot will stop getting the flag
;996:				bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 997
;997:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 998
;998:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 999
;999:			}
line 1000
;1000:		}
line 1001
;1001:		return;
ADDRGP4 $357
JUMPV
LABELV $366
line 1004
;1002:	}
;1003:	//enemy team has the flag
;1004:	else if (bs->neutralflagstatus == 2) {
ADDRFP4 0
INDIRP4
CNSTI4 11064
ADDP4
INDIRI4
CNSTI4 2
NEI4 $390
line 1005
;1005:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $357
line 1006
;1006:			c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 164
INDIRI4
ASGNI4
line 1007
;1007:			if (c >= 0) {
ADDRLP4 152
INDIRI4
CNSTI4 0
LTI4 $394
line 1009
;1008:				//FIXME: attack enemy flag carrier
;1009:			}
LABELV $394
line 1011
;1010:			//if already a CTF or team goal
;1011:			if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 1
EQI4 $401
ADDRLP4 168
INDIRI4
CNSTI4 2
EQI4 $401
ADDRLP4 168
INDIRI4
CNSTI4 8
EQI4 $401
ADDRLP4 168
INDIRI4
CNSTI4 9
EQI4 $401
ADDRLP4 168
INDIRI4
CNSTI4 10
NEI4 $396
LABELV $401
line 1015
;1012:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;1013:					bs->ltgtype == LTG_CAMPORDER ||
;1014:					bs->ltgtype == LTG_PATROL ||
;1015:					bs->ltgtype == LTG_GETITEM) {
line 1016
;1016:				return;
ADDRGP4 $357
JUMPV
LABELV $396
line 1019
;1017:			}
;1018:			// if not already defending the base
;1019:			if (bs->ltgtype != LTG_DEFENDKEYAREA) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 3
EQI4 $357
line 1020
;1020:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 1021
;1021:				bs->decisionmaker = bs->client;
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 172
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1022
;1022:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1024
;1023:				//
;1024:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
NEI4 $404
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $405
JUMPV
LABELV $404
line 1025
;1025:				else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $405
line 1027
;1026:				//set the ltg type
;1027:				bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 3
ASGNI4
line 1029
;1028:				//set the time the bot stops defending the base
;1029:				bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1030
;1030:				bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
CNSTF4 0
ASGNF4
line 1031
;1031:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1032
;1032:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 1033
;1033:			}
line 1034
;1034:		}
line 1035
;1035:		return;
ADDRGP4 $357
JUMPV
LABELV $390
line 1038
;1036:	}
;1037:	// don't just do something wait for the bot team leader to give orders
;1038:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $406
line 1039
;1039:		return;
ADDRGP4 $357
JUMPV
LABELV $406
line 1042
;1040:	}
;1041:	// if the bot is ordered to do something
;1042:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
CNSTI4 0
EQI4 $408
line 1043
;1043:		bs->teamgoal_time += 60;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1044
;1044:	}
LABELV $408
line 1046
;1045:	// if the bot decided to do something on it's own and has a last ordered goal
;1046:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 168
INDIRP4
CNSTI4 10716
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
NEI4 $410
ADDRLP4 168
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
EQI4 $410
line 1047
;1047:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1048
;1048:	}
LABELV $410
line 1050
;1049:	//if already a CTF or team goal
;1050:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 2
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 3
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 4
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 5
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 6
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 8
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 9
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 13
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 10
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 14
EQI4 $424
ADDRLP4 176
INDIRI4
CNSTI4 15
NEI4 $412
LABELV $424
line 1061
;1051:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1052:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1053:			bs->ltgtype == LTG_GETFLAG ||
;1054:			bs->ltgtype == LTG_RUSHBASE ||
;1055:			bs->ltgtype == LTG_RETURNFLAG ||
;1056:			bs->ltgtype == LTG_CAMPORDER ||
;1057:			bs->ltgtype == LTG_PATROL ||
;1058:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1059:			bs->ltgtype == LTG_GETITEM ||
;1060:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1061:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 1062
;1062:		return;
ADDRGP4 $357
JUMPV
LABELV $412
line 1065
;1063:	}
;1064:	//
;1065:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
EQI4 $425
line 1066
;1066:		return;
ADDRGP4 $357
JUMPV
LABELV $425
line 1068
;1067:	//
;1068:	if (bs->owndecision_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
LEF4 $427
line 1069
;1069:		return;;
ADDRGP4 $357
JUMPV
LABELV $427
line 1071
;1070:	//if the bot is roaming
;1071:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 10268
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $429
line 1072
;1072:		return;
ADDRGP4 $357
JUMPV
LABELV $429
line 1074
;1073:	//if the bot has anough aggression to decide what to do
;1074:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 184
INDIRF4
CNSTF4 1112014848
GEF4 $431
line 1075
;1075:		return;
ADDRGP4 $357
JUMPV
LABELV $431
line 1077
;1076:	//set the time to send a message to the team mates
;1077:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 188
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
ADDRLP4 188
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1079
;1078:	//
;1079:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $433
line 1080
;1080:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $435
line 1081
;1081:			l1 = 0.7f;
ADDRLP4 4
CNSTF4 1060320051
ASGNF4
line 1082
;1082:		}
ADDRGP4 $436
JUMPV
LABELV $435
line 1083
;1083:		else {
line 1084
;1084:			l1 = 0.2f;
ADDRLP4 4
CNSTF4 1045220557
ASGNF4
line 1085
;1085:		}
LABELV $436
line 1086
;1086:		l2 = 0.9f;
ADDRLP4 8
CNSTF4 1063675494
ASGNF4
line 1087
;1087:	}
ADDRGP4 $434
JUMPV
LABELV $433
line 1088
;1088:	else {
line 1089
;1089:		l1 = 0.4f;
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 1090
;1090:		l2 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 1091
;1091:	}
LABELV $434
line 1093
;1092:	//get the flag or defend the base
;1093:	rnd = random();
ADDRLP4 192
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 192
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 1094
;1094:	if (rnd < l1 && ctf_neutralflag.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $437
ADDRGP4 ctf_neutralflag+12
INDIRI4
CNSTI4 0
EQI4 $437
line 1095
;1095:		bs->decisionmaker = bs->client;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 196
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1096
;1096:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1097
;1097:		bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 4
ASGNI4
line 1099
;1098:		//set the time the bot will stop getting the flag
;1099:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1100
;1100:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1101
;1101:	}
ADDRGP4 $438
JUMPV
LABELV $437
line 1102
;1102:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $440
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $440
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $440
line 1103
;1103:		bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1104
;1104:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1106
;1105:		//
;1106:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 1
NEI4 $444
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $445
JUMPV
LABELV $444
line 1107
;1107:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $445
line 1109
;1108:		//set the ltg type
;1109:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 3
ASGNI4
line 1111
;1110:		//set the time the bot stops defending the base
;1111:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1112
;1112:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
CNSTF4 0
ASGNF4
line 1113
;1113:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1114
;1114:	}
ADDRGP4 $441
JUMPV
LABELV $440
line 1115
;1115:	else {
line 1116
;1116:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1118
;1117:		//set the time the bot will stop roaming
;1118:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10268
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1119
;1119:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1120
;1120:	}
LABELV $441
LABELV $438
line 1121
;1121:	bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 10724
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 1125
;1122:#ifdef DEBUG
;1123:	BotPrintTeamGoal(bs);
;1124:#endif //DEBUG
;1125:}
LABELV $357
endproc Bot1FCTFSeekGoals 208 12
export Bot1FCTFRetreatGoals
proc Bot1FCTFRetreatGoals 12 8
line 1132
;1126:
;1127:/*
;1128:==================
;1129:Bot1FCTFRetreatGoals
;1130:==================
;1131:*/
;1132:void Bot1FCTFRetreatGoals(bot_state_t *bs) {
line 1134
;1133:	//when carrying a flag in ctf the bot should rush to the enemy base
;1134:	if (Bot1FCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $447
line 1136
;1135:		//if not already rushing to the base
;1136:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 5
EQI4 $449
line 1137
;1137:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 1138
;1138:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 5
ASGNI4
line 1139
;1139:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1140
;1140:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
CNSTF4 0
ASGNF4
line 1141
;1141:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1142
;1142:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1144
;1143:			//get an alternative route goal towards the enemy base
;1144:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 1145
;1145:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1146
;1146:		}
LABELV $449
line 1147
;1147:	}
LABELV $447
line 1148
;1148:}
LABELV $446
endproc Bot1FCTFRetreatGoals 12 8
export BotObeliskSeekGoals
proc BotObeliskSeekGoals 52 12
line 1155
;1149:
;1150:/*
;1151:==================
;1152:BotObeliskSeekGoals
;1153:==================
;1154:*/
;1155:void BotObeliskSeekGoals(bot_state_t *bs) {
line 1159
;1156:	float rnd, l1, l2;
;1157:
;1158:	// don't just do something wait for the bot team leader to give orders
;1159:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $452
line 1160
;1160:		return;
ADDRGP4 $451
JUMPV
LABELV $452
line 1163
;1161:	}
;1162:	// if the bot is ordered to do something
;1163:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
CNSTI4 0
EQI4 $454
line 1164
;1164:		bs->teamgoal_time += 60;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1165
;1165:	}
LABELV $454
line 1167
;1166:	//if already a team goal
;1167:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 3
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 4
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 5
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 6
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 8
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 9
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 13
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 10
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 14
EQI4 $468
ADDRLP4 16
INDIRI4
CNSTI4 15
NEI4 $456
LABELV $468
line 1178
;1168:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1169:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1170:			bs->ltgtype == LTG_GETFLAG ||
;1171:			bs->ltgtype == LTG_RUSHBASE ||
;1172:			bs->ltgtype == LTG_RETURNFLAG ||
;1173:			bs->ltgtype == LTG_CAMPORDER ||
;1174:			bs->ltgtype == LTG_PATROL ||
;1175:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1176:			bs->ltgtype == LTG_GETITEM ||
;1177:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1178:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 1179
;1179:		return;
ADDRGP4 $451
JUMPV
LABELV $456
line 1182
;1180:	}
;1181:	//
;1182:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $469
line 1183
;1183:		return;
ADDRGP4 $451
JUMPV
LABELV $469
line 1185
;1184:	//if the bot is roaming
;1185:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 10268
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $471
line 1186
;1186:		return;
ADDRGP4 $451
JUMPV
LABELV $471
line 1188
;1187:	//if the bot has anough aggression to decide what to do
;1188:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1112014848
GEF4 $473
line 1189
;1189:		return;
ADDRGP4 $451
JUMPV
LABELV $473
line 1191
;1190:	//set the time to send a message to the team mates
;1191:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 28
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
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1193
;1192:	//
;1193:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $475
line 1194
;1194:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $477
line 1195
;1195:			l1 = 0.7f;
ADDRLP4 4
CNSTF4 1060320051
ASGNF4
line 1196
;1196:		}
ADDRGP4 $478
JUMPV
LABELV $477
line 1197
;1197:		else {
line 1198
;1198:			l1 = 0.2f;
ADDRLP4 4
CNSTF4 1045220557
ASGNF4
line 1199
;1199:		}
LABELV $478
line 1200
;1200:		l2 = 0.9f;
ADDRLP4 8
CNSTF4 1063675494
ASGNF4
line 1201
;1201:	}
ADDRGP4 $476
JUMPV
LABELV $475
line 1202
;1202:	else {
line 1203
;1203:		l1 = 0.4f;
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 1204
;1204:		l2 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 1205
;1205:	}
LABELV $476
line 1207
;1206:	//get the flag or defend the base
;1207:	rnd = random();
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 1208
;1208:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $479
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $479
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $479
line 1209
;1209:		bs->decisionmaker = bs->client;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1210
;1210:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1212
;1211:		//
;1212:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $483
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $484
JUMPV
LABELV $483
line 1213
;1213:		else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $484
line 1215
;1214:		//set the ltg type
;1215:		bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 13
ASGNI4
line 1217
;1216:		//set the time the bot will stop attacking the enemy base
;1217:		bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1219
;1218:		//get an alternate route goal towards the enemy base
;1219:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 1220
;1220:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1221
;1221:	}
ADDRGP4 $480
JUMPV
LABELV $479
line 1222
;1222:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $485
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $485
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $485
line 1223
;1223:		bs->decisionmaker = bs->client;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1224
;1224:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1226
;1225:		//
;1226:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
NEI4 $489
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $490
JUMPV
LABELV $489
line 1227
;1227:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $490
line 1229
;1228:		//set the ltg type
;1229:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 3
ASGNI4
line 1231
;1230:		//set the time the bot stops defending the base
;1231:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1232
;1232:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
CNSTF4 0
ASGNF4
line 1233
;1233:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1234
;1234:	}
ADDRGP4 $486
JUMPV
LABELV $485
line 1235
;1235:	else {
line 1236
;1236:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1238
;1237:		//set the time the bot will stop roaming
;1238:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10268
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1239
;1239:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1240
;1240:	}
LABELV $486
LABELV $480
line 1241
;1241:}
LABELV $451
endproc BotObeliskSeekGoals 52 12
export BotGoHarvest
proc BotGoHarvest 4 12
line 1248
;1242:
;1243:/*
;1244:==================
;1245:BotGoHarvest
;1246:==================
;1247:*/
;1248:void BotGoHarvest(bot_state_t *bs) {
line 1250
;1249:	//
;1250:	if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $492
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $493
JUMPV
LABELV $492
line 1251
;1251:	else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $493
line 1253
;1252:	//set the ltg type
;1253:	bs->ltgtype = LTG_HARVEST;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 12
ASGNI4
line 1255
;1254:	//set the time the bot will stop harvesting
;1255:	bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1256
;1256:	bs->harvestaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10264
ADDP4
CNSTF4 0
ASGNF4
line 1257
;1257:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1258
;1258:}
LABELV $491
endproc BotGoHarvest 4 12
export BotObeliskRetreatGoals
proc BotObeliskRetreatGoals 0 0
line 1265
;1259:
;1260:/*
;1261:==================
;1262:BotObeliskRetreatGoals
;1263:==================
;1264:*/
;1265:void BotObeliskRetreatGoals(bot_state_t *bs) {
line 1267
;1266:	//nothing special
;1267:}
LABELV $494
endproc BotObeliskRetreatGoals 0 0
export BotHarvesterSeekGoals
proc BotHarvesterSeekGoals 208 12
line 1274
;1268:
;1269:/*
;1270:==================
;1271:BotHarvesterSeekGoals
;1272:==================
;1273:*/
;1274:void BotHarvesterSeekGoals(bot_state_t *bs) {
line 1280
;1275:	aas_entityinfo_t entinfo;
;1276:	float rnd, l1, l2;
;1277:	int c;
;1278:
;1279:	//when carrying cubes in harvester the bot should rush to the base
;1280:	if (BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $496
line 1282
;1281:		//if not already rushing to the base
;1282:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 5
EQI4 $495
line 1283
;1283:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 1284
;1284:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 5
ASGNI4
line 1285
;1285:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1286
;1286:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
CNSTF4 0
ASGNF4
line 1287
;1287:			bs->decisionmaker = bs->client;
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 160
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1288
;1288:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1290
;1289:			//get an alternative route goal towards the enemy base
;1290:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 1292
;1291:			//
;1292:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1293
;1293:		}
line 1294
;1294:		return;
ADDRGP4 $495
JUMPV
LABELV $496
line 1297
;1295:	}
;1296:	// don't just do something wait for the bot team leader to give orders
;1297:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $500
line 1298
;1298:		return;
ADDRGP4 $495
JUMPV
LABELV $500
line 1301
;1299:	}
;1300:	// if the bot decided to follow someone
;1301:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 2
NEI4 $502
ADDRLP4 164
INDIRP4
CNSTI4 10716
ADDP4
INDIRI4
CNSTI4 0
NEI4 $502
line 1303
;1302:		// if the team mate being accompanied no longer carries the flag
;1303:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1304
;1304:		if (!EntityCarriesCubes(&entinfo)) {
ADDRLP4 16
ARGP4
ADDRLP4 168
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $504
line 1305
;1305:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1306
;1306:		}
LABELV $504
line 1307
;1307:	}
LABELV $502
line 1309
;1308:	// if the bot is ordered to do something
;1309:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
INDIRI4
CNSTI4 0
EQI4 $506
line 1310
;1310:		bs->teamgoal_time += 60;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1311
;1311:	}
LABELV $506
line 1313
;1312:	//if not yet doing something
;1313:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 1
EQI4 $519
ADDRLP4 168
INDIRI4
CNSTI4 2
EQI4 $519
ADDRLP4 168
INDIRI4
CNSTI4 3
EQI4 $519
ADDRLP4 168
INDIRI4
CNSTI4 4
EQI4 $519
ADDRLP4 168
INDIRI4
CNSTI4 8
EQI4 $519
ADDRLP4 168
INDIRI4
CNSTI4 9
EQI4 $519
ADDRLP4 168
INDIRI4
CNSTI4 13
EQI4 $519
ADDRLP4 168
INDIRI4
CNSTI4 12
EQI4 $519
ADDRLP4 168
INDIRI4
CNSTI4 10
EQI4 $519
ADDRLP4 168
INDIRI4
CNSTI4 14
EQI4 $519
ADDRLP4 168
INDIRI4
CNSTI4 15
NEI4 $508
LABELV $519
line 1323
;1314:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1315:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1316:			bs->ltgtype == LTG_GETFLAG ||
;1317:			bs->ltgtype == LTG_CAMPORDER ||
;1318:			bs->ltgtype == LTG_PATROL ||
;1319:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1320:			bs->ltgtype == LTG_HARVEST ||
;1321:			bs->ltgtype == LTG_GETITEM ||
;1322:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1323:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 1324
;1324:		return;
ADDRGP4 $495
JUMPV
LABELV $508
line 1327
;1325:	}
;1326:	//
;1327:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $520
line 1328
;1328:		return;
ADDRGP4 $495
JUMPV
LABELV $520
line 1330
;1329:	//if the bot is roaming
;1330:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 10268
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $522
line 1331
;1331:		return;
ADDRGP4 $495
JUMPV
LABELV $522
line 1333
;1332:	//if the bot has anough aggression to decide what to do
;1333:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 176
INDIRF4
CNSTF4 1112014848
GEF4 $524
line 1334
;1334:		return;
ADDRGP4 $495
JUMPV
LABELV $524
line 1336
;1335:	//set the time to send a message to the team mates
;1336:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 180
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
ADDRLP4 180
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1338
;1337:	//
;1338:	c = BotEnemyCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotEnemyCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 184
INDIRI4
ASGNI4
line 1339
;1339:	if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $526
line 1341
;1340:		//FIXME: attack enemy cube carrier
;1341:	}
LABELV $526
line 1342
;1342:	if (bs->ltgtype != LTG_TEAMACCOMPANY) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 2
EQI4 $528
line 1344
;1343:		//if there is a visible team mate carrying cubes
;1344:		c = BotTeamCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 BotTeamCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 188
INDIRI4
ASGNI4
line 1345
;1345:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $530
line 1347
;1346:			//follow the team mate carrying cubes
;1347:			bs->decisionmaker = bs->client;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 192
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1348
;1348:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1350
;1349:			//the team mate
;1350:			bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1352
;1351:			//last time the team mate was visible
;1352:			bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1354
;1353:			//no message
;1354:			bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 1356
;1355:			//no arrive message
;1356:			bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
CNSTF4 1065353216
ASGNF4
line 1358
;1357:			//
;1358:			BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRLP4 196
INDIRP4
CNSTI4 10708
ADDP4
INDIRI4
ARGI4
ADDRGP4 $275
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1360
;1359:			//get the team goal time
;1360:			bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1361
;1361:			bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 2
ASGNI4
line 1362
;1362:			bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 11116
ADDP4
CNSTF4 1121976320
ASGNF4
line 1363
;1363:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1364
;1364:			return;
ADDRGP4 $495
JUMPV
LABELV $530
line 1366
;1365:		}
;1366:	}
LABELV $528
line 1368
;1367:	//
;1368:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $532
line 1369
;1369:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $534
line 1370
;1370:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 1371
;1371:		}
ADDRGP4 $535
JUMPV
LABELV $534
line 1372
;1372:		else {
line 1373
;1373:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 1374
;1374:		}
LABELV $535
line 1375
;1375:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 1376
;1376:	}
ADDRGP4 $533
JUMPV
LABELV $532
line 1377
;1377:	else {
line 1378
;1378:		l1 = 0.4f;
ADDRLP4 8
CNSTF4 1053609165
ASGNF4
line 1379
;1379:		l2 = 0.7f;
ADDRLP4 12
CNSTF4 1060320051
ASGNF4
line 1380
;1380:	}
LABELV $533
line 1382
;1381:	//
;1382:	rnd = random();
ADDRLP4 188
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 188
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 1383
;1383:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $536
ADDRLP4 192
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 192
INDIRI4
EQI4 $536
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 192
INDIRI4
EQI4 $536
line 1384
;1384:		bs->decisionmaker = bs->client;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 196
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1385
;1385:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1386
;1386:		BotGoHarvest(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoHarvest
CALLV
pop
line 1387
;1387:	}
ADDRGP4 $537
JUMPV
LABELV $536
line 1388
;1388:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $540
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRGP4 redobelisk+12
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $540
ADDRGP4 blueobelisk+12
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $540
line 1389
;1389:		bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1390
;1390:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1392
;1391:		//
;1392:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 1
NEI4 $544
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 redobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $545
JUMPV
LABELV $544
line 1393
;1393:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRGP4 blueobelisk
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $545
line 1395
;1394:		//set the ltg type
;1395:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 3
ASGNI4
line 1397
;1396:		//set the time the bot stops defending the base
;1397:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1398
;1398:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
CNSTF4 0
ASGNF4
line 1399
;1399:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1400
;1400:	}
ADDRGP4 $541
JUMPV
LABELV $540
line 1401
;1401:	else {
line 1402
;1402:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 1404
;1403:		//set the time the bot will stop roaming
;1404:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10268
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 1405
;1405:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1406
;1406:	}
LABELV $541
LABELV $537
line 1407
;1407:}
LABELV $495
endproc BotHarvesterSeekGoals 208 12
export BotHarvesterRetreatGoals
proc BotHarvesterRetreatGoals 8 4
line 1414
;1408:
;1409:/*
;1410:==================
;1411:BotHarvesterRetreatGoals
;1412:==================
;1413:*/
;1414:void BotHarvesterRetreatGoals(bot_state_t *bs) {
line 1416
;1415:	//when carrying cubes in harvester the bot should rush to the base
;1416:	if (BotHarvesterCarryingCubes(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $547
line 1418
;1417:		//if not already rushing to the base
;1418:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 5
EQI4 $546
line 1419
;1419:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 1420
;1420:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 5
ASGNI4
line 1421
;1421:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1422
;1422:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
CNSTF4 0
ASGNF4
line 1423
;1423:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1424
;1424:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 1425
;1425:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1426
;1426:		}
line 1427
;1427:		return;
LABELV $547
line 1429
;1428:	}
;1429:}
LABELV $546
endproc BotHarvesterRetreatGoals 8 4
export BotTeamGoals
proc BotTeamGoals 4 4
line 1437
;1430:
;1431:
;1432:/*
;1433:==================
;1434:BotTeamGoals
;1435:==================
;1436:*/
;1437:void BotTeamGoals(bot_state_t *bs, int retreat) {
line 1439
;1438:
;1439:	if ( retreat ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $552
line 1440
;1440:		if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION ) {
ADDRLP4 0
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $556
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $554
LABELV $556
line 1441
;1441:			BotCTFRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFRetreatGoals
CALLV
pop
line 1442
;1442:		}
ADDRGP4 $553
JUMPV
LABELV $554
line 1443
;1443:		else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $557
line 1444
;1444:			Bot1FCTFRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFRetreatGoals
CALLV
pop
line 1445
;1445:		}
ADDRGP4 $553
JUMPV
LABELV $557
line 1446
;1446:		else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $559
line 1447
;1447:			BotObeliskRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotObeliskRetreatGoals
CALLV
pop
line 1448
;1448:		}
ADDRGP4 $553
JUMPV
LABELV $559
line 1449
;1449:		else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $553
line 1450
;1450:			BotHarvesterRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotHarvesterRetreatGoals
CALLV
pop
line 1451
;1451:		}
line 1452
;1452:	}
ADDRGP4 $553
JUMPV
LABELV $552
line 1453
;1453:	else {
line 1454
;1454:		if (gametype == GT_CTF|| gametype == GT_CTF_ELIMINATION) {
ADDRLP4 0
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $565
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $563
LABELV $565
line 1456
;1455:			//decide what to do in CTF mode
;1456:			BotCTFSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFSeekGoals
CALLV
pop
line 1457
;1457:		}
ADDRGP4 $564
JUMPV
LABELV $563
line 1458
;1458:		else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $566
line 1459
;1459:			Bot1FCTFSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Bot1FCTFSeekGoals
CALLV
pop
line 1460
;1460:		}
ADDRGP4 $567
JUMPV
LABELV $566
line 1461
;1461:		else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $568
line 1462
;1462:			BotObeliskSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotObeliskSeekGoals
CALLV
pop
line 1463
;1463:		}
ADDRGP4 $569
JUMPV
LABELV $568
line 1464
;1464:		else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $570
line 1465
;1465:			BotHarvesterSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotHarvesterSeekGoals
CALLV
pop
line 1466
;1466:		}
LABELV $570
LABELV $569
LABELV $567
LABELV $564
line 1467
;1467:	}
LABELV $553
line 1469
;1468:
;1469:	if(gametype == GT_DOUBLE_D) //Don't care about retreat
ADDRGP4 gametype
INDIRI4
CNSTI4 12
NEI4 $572
line 1470
;1470:		BotDDSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDDSeekGoals
CALLV
pop
LABELV $572
line 1477
;1471:        
;1472:        //if(gametype == GT_DOMINATION) //Don't care about retreat
;1473:	//	BotDomSeekGoals(bs);
;1474:
;1475:	// reset the order time which is used to see if
;1476:	// we decided to refuse an order
;1477:	bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
CNSTF4 0
ASGNF4
line 1478
;1478:}
LABELV $551
endproc BotTeamGoals 4 4
export BotPointAreaNum
proc BotPointAreaNum 68 20
line 1485
;1479:
;1480:/*
;1481:==================
;1482:BotPointAreaNum
;1483:==================
;1484:*/
;1485:int BotPointAreaNum(vec3_t origin) {
line 1489
;1486:	int areanum, numareas, areas[10];
;1487:	vec3_t end;
;1488:
;1489:	areanum = trap_AAS_PointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 trap_AAS_PointAreaNum
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 1490
;1490:	if (areanum) return areanum;
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $575
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $574
JUMPV
LABELV $575
line 1491
;1491:	VectorCopy(origin, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1492
;1492:	end[2] += 10;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1493
;1493:	numareas = trap_AAS_TraceAreas(origin, end, areas, NULL, 10);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 64
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
ASGNI4
line 1494
;1494:	if (numareas > 0) return areas[0];
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $578
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $574
JUMPV
LABELV $578
line 1495
;1495:	return 0;
CNSTI4 0
RETI4
LABELV $574
endproc BotPointAreaNum 68 20
export ClientName
proc ClientName 1032 12
line 1503
;1496:}
;1497:
;1498:/*
;1499:==================
;1500:ClientName
;1501:==================
;1502:*/
;1503:char *ClientName(int client, char *name, int size) {
line 1506
;1504:	char buf[MAX_INFO_STRING];
;1505:
;1506:	if (client < 0 || client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $583
ADDRLP4 1024
INDIRI4
CNSTI4 256
LTI4 $581
LABELV $583
line 1507
;1507:		BotAI_Print(PRT_ERROR, "ClientName: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $584
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1508
;1508:		return "[client out of range]";
ADDRGP4 $585
RETP4
ADDRGP4 $580
JUMPV
LABELV $581
line 1510
;1509:	}
;1510:	trap_GetConfigstring(CS_PLAYERS+client, buf, sizeof(buf));
ADDRFP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1511
;1511:	strncpy(name, Info_ValueForKey(buf, "n"), size-1);
ADDRLP4 0
ARGP4
ADDRGP4 $586
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
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
line 1512
;1512:	name[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1513
;1513:	Q_CleanStr( name );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1514
;1514:	return name;
ADDRFP4 4
INDIRP4
RETP4
LABELV $580
endproc ClientName 1032 12
export ClientSkin
proc ClientSkin 1032 12
line 1522
;1515:}
;1516:
;1517:/*
;1518:==================
;1519:ClientSkin
;1520:==================
;1521:*/
;1522:char *ClientSkin(int client, char *skin, int size) {
line 1525
;1523:	char buf[MAX_INFO_STRING];
;1524:
;1525:	if (client < 0 || client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $590
ADDRLP4 1024
INDIRI4
CNSTI4 256
LTI4 $588
LABELV $590
line 1526
;1526:		BotAI_Print(PRT_ERROR, "ClientSkin: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $591
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1527
;1527:		return "[client out of range]";
ADDRGP4 $585
RETP4
ADDRGP4 $587
JUMPV
LABELV $588
line 1529
;1528:	}
;1529:	trap_GetConfigstring(CS_PLAYERS+client, buf, sizeof(buf));
ADDRFP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1530
;1530:	strncpy(skin, Info_ValueForKey(buf, "model"), size-1);
ADDRLP4 0
ARGP4
ADDRGP4 $592
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
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
line 1531
;1531:	skin[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1532
;1532:	return skin;
ADDRFP4 4
INDIRP4
RETP4
LABELV $587
endproc ClientSkin 1032 12
bss
align 4
LABELV $594
skip 4
export ClientFromName
code
proc ClientFromName 1040 12
line 1540
;1533:}
;1534:
;1535:/*
;1536:==================
;1537:ClientFromName
;1538:==================
;1539:*/
;1540:int ClientFromName(char *name) {
line 1545
;1541:	int i;
;1542:	char buf[MAX_INFO_STRING];
;1543:	static int maxclients;
;1544:
;1545:	if (!maxclients)
ADDRGP4 $594
INDIRI4
CNSTI4 0
NEI4 $595
line 1546
;1546:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $597
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $594
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $595
line 1547
;1547:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $601
JUMPV
LABELV $598
line 1548
;1548:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 1549
;1549:		Q_CleanStr( buf );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1551
;1550:        // Используем strcmp для точного сравнения имен
;1551:        if (strcasecmp(Info_ValueForKey(buf, "n"), name) == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $586
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 strcasecmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $602
line 1552
;1552:            return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $593
JUMPV
LABELV $602
line 1554
;1553:        }
;1554:	}
LABELV $599
line 1547
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $601
ADDRLP4 0
INDIRI4
ADDRGP4 $594
INDIRI4
GEI4 $604
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $598
LABELV $604
line 1555
;1555:	return -1;
CNSTI4 -1
RETI4
LABELV $593
endproc ClientFromName 1040 12
bss
align 4
LABELV $606
skip 4
export ClientOnSameTeamFromName
code
proc ClientOnSameTeamFromName 1044 12
line 1563
;1556:}
;1557:
;1558:/*
;1559:==================
;1560:ClientOnSameTeamFromName
;1561:==================
;1562:*/
;1563:int ClientOnSameTeamFromName(bot_state_t *bs, char *name) {
line 1568
;1564:	int i;
;1565:	char buf[MAX_INFO_STRING];
;1566:	static int maxclients;
;1567:
;1568:	if (!maxclients)
ADDRGP4 $606
INDIRI4
CNSTI4 0
NEI4 $607
line 1569
;1569:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $597
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $606
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $607
line 1570
;1570:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $612
JUMPV
LABELV $609
line 1571
;1571:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1032
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $613
line 1572
;1572:			continue;
ADDRGP4 $610
JUMPV
LABELV $613
line 1573
;1573:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
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
line 1574
;1574:		Q_CleanStr( buf );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1576
;1575:		// Используем strcmp для точного сравнения имен
;1576:        if (strcasecmp(Info_ValueForKey(buf, "n"), name) == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $586
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 strcasecmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $615
line 1577
;1577:            return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $605
JUMPV
LABELV $615
line 1579
;1578:        }
;1579:	}
LABELV $610
line 1570
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $612
ADDRLP4 0
INDIRI4
ADDRGP4 $606
INDIRI4
GEI4 $617
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $609
LABELV $617
line 1580
;1580:	return -1;
CNSTI4 -1
RETI4
LABELV $605
endproc ClientOnSameTeamFromName 1044 12
export stristr
proc stristr 12 4
line 1588
;1581:}
;1582:
;1583:/*
;1584:==================
;1585:stristr
;1586:==================
;1587:*/
;1588:char *stristr(char *str, char *charset) {
ADDRGP4 $620
JUMPV
LABELV $619
line 1591
;1589:	int i;
;1590:
;1591:	while(*str) {
line 1592
;1592:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $625
JUMPV
LABELV $622
line 1593
;1593:			if (toupper(charset[i]) != toupper(str[i])) break;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $626
ADDRGP4 $624
JUMPV
LABELV $626
line 1594
;1594:		}
LABELV $623
line 1592
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $625
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $628
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $622
LABELV $628
LABELV $624
line 1595
;1595:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $629
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $618
JUMPV
LABELV $629
line 1596
;1596:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1597
;1597:	}
LABELV $620
line 1591
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $619
line 1598
;1598:	return NULL;
CNSTP4 0
RETP4
LABELV $618
endproc stristr 12 4
export EasyClientName
proc EasyClientName 200 12
line 1606
;1599:}
;1600:
;1601:/*
;1602:==================
;1603:EasyClientName
;1604:==================
;1605:*/
;1606:char *EasyClientName(int client, char *buf, int size) {
line 1611
;1607:	int i;
;1608:	char *str1, *str2, *ptr, c;
;1609:	char name[128];
;1610:
;1611:	ClientName(client, name, sizeof(name));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 5
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1612
;1612:	for (i = 0; name[i]; i++) name[i] &= 127;
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $635
JUMPV
LABELV $632
ADDRLP4 148
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVII1 4
ASGNI1
LABELV $633
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $635
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $632
line 1614
;1613:	//remove all spaces
;1614:	for (ptr = strstr(name, " "); ptr; ptr = strstr(name, " ")) {
ADDRLP4 5
ARGP4
ADDRGP4 $640
ARGP4
ADDRLP4 152
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 152
INDIRP4
ASGNP4
ADDRGP4 $639
JUMPV
LABELV $636
line 1615
;1615:		memmove(ptr, ptr+1, strlen(ptr+1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 164
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
ARGP4
ADDRLP4 156
INDIRI4
ADDRLP4 164
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1616
;1616:	}
LABELV $637
line 1614
ADDRLP4 5
ARGP4
ADDRGP4 $640
ARGP4
ADDRLP4 156
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
LABELV $639
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $636
line 1618
;1617:	//check for [x] and ]x[ clan names
;1618:	str1 = strstr(name, "[");
ADDRLP4 5
ARGP4
ADDRGP4 $641
ARGP4
ADDRLP4 160
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 160
INDIRP4
ASGNP4
line 1619
;1619:	str2 = strstr(name, "]");
ADDRLP4 5
ARGP4
ADDRGP4 $642
ARGP4
ADDRLP4 164
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 144
ADDRLP4 164
INDIRP4
ASGNP4
line 1620
;1620:	if (str1 && str2) {
ADDRLP4 168
CNSTU4 0
ASGNU4
ADDRLP4 140
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $643
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $643
line 1621
;1621:		if (str2 > str1) memmove(str1, str2+1, strlen(str2+1)+1);
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRP4
CVPU4 4
LEU4 $645
ADDRLP4 144
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 172
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 176
CNSTI4 1
ASGNI4
ADDRLP4 144
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
ARGP4
ADDRLP4 172
INDIRI4
ADDRLP4 176
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
ADDRGP4 $646
JUMPV
LABELV $645
line 1622
;1622:		else memmove(str2, str1+1, strlen(str1+1)+1);
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 180
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 184
CNSTI4 1
ASGNI4
ADDRLP4 140
INDIRP4
ADDRLP4 184
INDIRI4
ADDP4
ARGP4
ADDRLP4 180
INDIRI4
ADDRLP4 184
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
LABELV $646
line 1623
;1623:	}
LABELV $643
line 1625
;1624:	//remove Mr prefix
;1625:	if ((name[0] == 'm' || name[0] == 'M') &&
ADDRLP4 172
ADDRLP4 5
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 109
EQI4 $651
ADDRLP4 172
INDIRI4
CNSTI4 77
NEI4 $647
LABELV $651
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 114
EQI4 $652
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 82
NEI4 $647
LABELV $652
line 1626
;1626:			(name[1] == 'r' || name[1] == 'R')) {
line 1627
;1627:		memmove(name, name+2, strlen(name+2)+1);
ADDRLP4 5+2
ARGP4
ADDRLP4 176
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 5
ARGP4
ADDRLP4 5+2
ARGP4
ADDRLP4 176
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1628
;1628:	}
LABELV $647
line 1630
;1629:	//only allow lower case alphabet characters
;1630:	ptr = name;
ADDRLP4 0
ADDRLP4 5
ASGNP4
ADDRGP4 $656
JUMPV
LABELV $655
line 1631
;1631:	while(*ptr) {
line 1632
;1632:		c = *ptr;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 1633
;1633:		if ((c >= 'a' && c <= 'z') ||
ADDRLP4 176
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 97
LTI4 $661
ADDRLP4 176
INDIRI4
CNSTI4 122
LEI4 $662
LABELV $661
ADDRLP4 180
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 48
LTI4 $663
ADDRLP4 180
INDIRI4
CNSTI4 57
LEI4 $662
LABELV $663
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $658
LABELV $662
line 1634
;1634:				(c >= '0' && c <= '9') || c == '_') {
line 1635
;1635:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1636
;1636:		}
ADDRGP4 $659
JUMPV
LABELV $658
line 1637
;1637:		else if (c >= 'A' && c <= 'Z') {
ADDRLP4 184
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 65
LTI4 $664
ADDRLP4 184
INDIRI4
CNSTI4 90
GTI4 $664
line 1638
;1638:			*ptr += 'a' - 'A';
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
ADDI4
CVII1 4
ASGNI1
line 1639
;1639:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1640
;1640:		}
ADDRGP4 $665
JUMPV
LABELV $664
line 1641
;1641:		else {
line 1642
;1642:			memmove(ptr, ptr+1, strlen(ptr + 1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 188
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 196
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 196
INDIRI4
ADDP4
ARGP4
ADDRLP4 188
INDIRI4
ADDRLP4 196
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1643
;1643:		}
LABELV $665
LABELV $659
line 1644
;1644:	}
LABELV $656
line 1631
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $655
line 1645
;1645:	strncpy(buf, name, size-1);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 5
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1646
;1646:	buf[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1647
;1647:	return buf;
ADDRFP4 4
INDIRP4
RETP4
LABELV $631
endproc EasyClientName 200 12
export BotSynonymContext
proc BotSynonymContext 12 4
line 1655
;1648:}
;1649:
;1650:/*
;1651:==================
;1652:BotSynonymContext
;1653:==================
;1654:*/
;1655:int BotSynonymContext(bot_state_t *bs) {
line 1658
;1656:	int context;
;1657:
;1658:	context = CONTEXT_NORMAL|CONTEXT_NEARBYITEM|CONTEXT_NAMES;
ADDRLP4 0
CNSTI4 1027
ASGNI4
line 1660
;1659:	//
;1660:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION
ADDRLP4 4
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
EQI4 $670
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $670
ADDRLP4 4
INDIRI4
CNSTI4 6
NEI4 $667
LABELV $670
line 1662
;1661:		|| gametype == GT_1FCTF
;1662:		) {
line 1663
;1663:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_CTFREDTEAM;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $671
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
ADDRGP4 $668
JUMPV
LABELV $671
line 1664
;1664:		else context |= CONTEXT_CTFBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1665
;1665:	}
ADDRGP4 $668
JUMPV
LABELV $667
line 1666
;1666:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $673
line 1667
;1667:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_OBELISKREDTEAM;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $675
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
BORI4
ASGNI4
ADDRGP4 $674
JUMPV
LABELV $675
line 1668
;1668:		else context |= CONTEXT_OBELISKBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1669
;1669:	}
ADDRGP4 $674
JUMPV
LABELV $673
line 1670
;1670:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $677
line 1671
;1671:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_HARVESTERREDTEAM;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $679
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 128
BORI4
ASGNI4
ADDRGP4 $680
JUMPV
LABELV $679
line 1672
;1672:		else context |= CONTEXT_HARVESTERBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $680
line 1673
;1673:	}
LABELV $677
LABELV $674
LABELV $668
line 1674
;1674:	return context;
ADDRLP4 0
INDIRI4
RETI4
LABELV $666
endproc BotSynonymContext 12 4
export BotChooseWeapon
proc BotChooseWeapon 20 8
line 1682
;1675:}
;1676:
;1677:/*
;1678:==================
;1679:BotChooseWeapon
;1680:==================
;1681:*/
;1682:void BotChooseWeapon(bot_state_t *bs) {
line 1685
;1683:	int newweaponnum;
;1684:
;1685:	if (bs->cur_ps.weaponstate == WEAPON_RAISING ||
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $684
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $682
LABELV $684
line 1686
;1686:			bs->cur_ps.weaponstate == WEAPON_DROPPING) {
line 1687
;1687:		trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1688
;1688:	}
ADDRGP4 $683
JUMPV
LABELV $682
line 1689
;1689:	else {
line 1690
;1690:		newweaponnum = trap_BotChooseBestFightWeapon(bs->ws, bs->inventory);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 10640
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 5984
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_BotChooseBestFightWeapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1693
;1691:
;1692:		//in case "weapon index out of range" error occurs.
;1693:		if (!newweaponnum) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $685
line 1694
;1694:			if (bs->inventory[INVENTORY_GAUNTLET] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 1
NEI4 $687
line 1695
;1695:			  newweaponnum = WP_GAUNTLET;
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $687
line 1696
;1696:			if (bs->inventory[INVENTORY_MACHINEGUN] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
INDIRI4
CNSTI4 1
NEI4 $689
line 1697
;1697:			  newweaponnum = WP_MACHINEGUN;
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $689
line 1698
;1698:			if (bs->inventory[INVENTORY_SHOTGUN] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
INDIRI4
CNSTI4 1
NEI4 $691
line 1699
;1699:			  newweaponnum = WP_SHOTGUN;
ADDRLP4 0
CNSTI4 3
ASGNI4
LABELV $691
line 1700
;1700:			if (bs->inventory[INVENTORY_GRENADELAUNCHER] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
INDIRI4
CNSTI4 1
NEI4 $693
line 1701
;1701:			  newweaponnum = WP_GRENADE_LAUNCHER;
ADDRLP4 0
CNSTI4 4
ASGNI4
LABELV $693
line 1702
;1702:			if (bs->inventory[INVENTORY_ROCKETLAUNCHER] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 1
NEI4 $695
line 1703
;1703:			  newweaponnum = WP_ROCKET_LAUNCHER;
ADDRLP4 0
CNSTI4 5
ASGNI4
LABELV $695
line 1704
;1704:			if (bs->inventory[INVENTORY_LIGHTNING] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
CNSTI4 1
NEI4 $697
line 1705
;1705:			  newweaponnum = WP_LIGHTNING;
ADDRLP4 0
CNSTI4 6
ASGNI4
LABELV $697
line 1706
;1706:			if (bs->inventory[INVENTORY_RAILGUN] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6024
ADDP4
INDIRI4
CNSTI4 1
NEI4 $699
line 1707
;1707:                          newweaponnum = WP_RAILGUN;
ADDRLP4 0
CNSTI4 7
ASGNI4
LABELV $699
line 1708
;1708:			if (bs->inventory[INVENTORY_PLASMAGUN] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
CNSTI4 1
NEI4 $701
line 1709
;1709:			  newweaponnum = WP_PLASMAGUN;
ADDRLP4 0
CNSTI4 8
ASGNI4
LABELV $701
line 1710
;1710:			if (bs->inventory[INVENTORY_BFG10K] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6036
ADDP4
INDIRI4
CNSTI4 1
NEI4 $703
line 1711
;1711:			  newweaponnum = WP_BFG;
ADDRLP4 0
CNSTI4 9
ASGNI4
LABELV $703
line 1712
;1712:			if (bs->inventory[INVENTORY_NAILGUN] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6044
ADDP4
INDIRI4
CNSTI4 1
NEI4 $705
line 1713
;1713:			  newweaponnum = WP_NAILGUN;
ADDRLP4 0
CNSTI4 11
ASGNI4
LABELV $705
line 1714
;1714:			if (bs->inventory[INVENTORY_PROXLAUNCHER] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6048
ADDP4
INDIRI4
CNSTI4 1
NEI4 $707
line 1715
;1715:			  newweaponnum = WP_PROX_LAUNCHER;
ADDRLP4 0
CNSTI4 12
ASGNI4
LABELV $707
line 1716
;1716:			if (bs->inventory[INVENTORY_CHAINGUN] == 1)
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
INDIRI4
CNSTI4 1
NEI4 $709
line 1717
;1717:			  newweaponnum = WP_CHAINGUN;
ADDRLP4 0
CNSTI4 13
ASGNI4
LABELV $709
line 1718
;1718:		}
LABELV $685
line 1720
;1719:
;1720:		if (bs->weaponnum != newweaponnum) bs->weaponchange_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $711
ADDRFP4 0
INDIRP4
CNSTI4 10296
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $711
line 1721
;1721:		bs->weaponnum = newweaponnum;
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1723
;1722:		//BotAI_Print(PRT_MESSAGE, "bs->weaponnum = %d\n", bs->weaponnum);
;1723:		trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1724
;1724:	}
LABELV $683
line 1725
;1725:}
LABELV $681
endproc BotChooseWeapon 20 8
export BotSetupForMovement
proc BotSetupForMovement 88 12
line 1732
;1726:
;1727:/*
;1728:==================
;1729:BotSetupForMovement
;1730:==================
;1731:*/
;1732:void BotSetupForMovement(bot_state_t *bs) {
line 1735
;1733:	bot_initmove_t initmove;
;1734:
;1735:	memset(&initmove, 0, sizeof(bot_initmove_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 68
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1736
;1736:	VectorCopy(bs->cur_ps.origin, initmove.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRB
ASGNB 12
line 1737
;1737:	VectorCopy(bs->cur_ps.velocity, initmove.velocity);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRB
ASGNB 12
line 1738
;1738:	VectorClear(initmove.viewoffset);
ADDRLP4 68
CNSTF4 0
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 0+24
ADDRLP4 68
INDIRF4
ASGNF4
line 1739
;1739:	initmove.viewoffset[2] += bs->cur_ps.viewheight;
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1740
;1740:	initmove.entitynum = bs->entitynum;
ADDRLP4 0+36
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1741
;1741:	initmove.client = bs->client;
ADDRLP4 0+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1742
;1742:	initmove.thinktime = bs->thinktime;
ADDRLP4 0+44
ADDRFP4 0
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
ASGNF4
line 1744
;1743:	//set the onground flag
;1744:	if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE) initmove.or_moveflags |= MFL_ONGROUND;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 4095
EQI4 $725
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $725
line 1746
;1745:	//set the teleported flag
;1746:	if ((bs->cur_ps.pm_flags & PMF_TIME_KNOCKBACK) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 76
INDIRI4
EQI4 $728
ADDRLP4 72
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $728
line 1747
;1747:		initmove.or_moveflags |= MFL_TELEPORTED;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1748
;1748:	}
LABELV $728
line 1750
;1749:	//set the waterjump flag
;1750:	if ((bs->cur_ps.pm_flags & PMF_TIME_WATERJUMP) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $731
ADDRLP4 80
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
LEI4 $731
line 1751
;1751:		initmove.or_moveflags |= MFL_WATERJUMP;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1752
;1752:	}
LABELV $731
line 1754
;1753:	//set presence type
;1754:	if (bs->cur_ps.pm_flags & PMF_DUCKED) initmove.presencetype = PRESENCE_CROUCH;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $734
ADDRLP4 0+48
CNSTI4 4
ASGNI4
ADDRGP4 $735
JUMPV
LABELV $734
line 1755
;1755:	else initmove.presencetype = PRESENCE_NORMAL;
ADDRLP4 0+48
CNSTI4 2
ASGNI4
LABELV $735
line 1757
;1756:	//
;1757:	if (bs->walker > 0.5) initmove.or_moveflags |= MFL_WALK;
ADDRFP4 0
INDIRP4
CNSTI4 10160
ADDP4
INDIRF4
CNSTF4 1056964608
LEF4 $738
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $738
line 1759
;1758:	//
;1759:	VectorCopy(bs->viewangles, initmove.viewangles);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
INDIRB
ASGNB 12
line 1761
;1760:	//
;1761:	trap_BotInitMoveState(bs->ms, &initmove);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotInitMoveState
CALLV
pop
line 1762
;1762:}
LABELV $713
endproc BotSetupForMovement 88 12
export BotCheckItemPickup
proc BotCheckItemPickup 44 12
line 1769
;1763:
;1764:/*
;1765:==================
;1766:BotCheckItemPickup
;1767:==================
;1768:*/
;1769:void BotCheckItemPickup(bot_state_t *bs, int *oldinventory) {
line 1772
;1770:	int offence, leader;
;1771:
;1772:if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $743
line 1773
;1773:if(!NpcFactionProp(bs, NP_GOAL, 0)){
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
NEI4 $745
line 1774
;1774:        return; // spbot no items
ADDRGP4 $742
JUMPV
LABELV $745
line 1775
;1775:}}
LABELV $743
line 1777
;1776:
;1777:	if (gametype <= GT_TEAM && g_ffa_gt==0)
ADDRGP4 gametype
INDIRI4
CNSTI4 4
GTI4 $747
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 0
NEI4 $747
line 1778
;1778:		return;
ADDRGP4 $742
JUMPV
LABELV $747
line 1780
;1779:
;1780:	offence = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1782
;1781:	// go into offence if picked up the kamikaze or invulnerability
;1782:	if (!oldinventory[INVENTORY_KAMIKAZE] && bs->inventory[INVENTORY_KAMIKAZE] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 0
NEI4 $749
ADDRFP4 0
INDIRP4
CNSTI4 6112
ADDP4
INDIRI4
CNSTI4 1
LTI4 $749
line 1783
;1783:		offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1784
;1784:	}
LABELV $749
line 1785
;1785:	if (!oldinventory[INVENTORY_INVULNERABILITY] && bs->inventory[INVENTORY_INVULNERABILITY] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
CNSTI4 0
NEI4 $751
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
INDIRI4
CNSTI4 1
LTI4 $751
line 1786
;1786:		offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1787
;1787:	}
LABELV $751
line 1789
;1788:	// if not already wearing the kamikaze or invulnerability
;1789:	if (!bs->inventory[INVENTORY_KAMIKAZE] && !bs->inventory[INVENTORY_INVULNERABILITY]) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 6112
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $753
ADDRLP4 8
INDIRP4
CNSTI4 6120
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $753
line 1790
;1790:		if (!oldinventory[INVENTORY_SCOUT] && bs->inventory[INVENTORY_SCOUT] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $755
ADDRFP4 0
INDIRP4
CNSTI4 6148
ADDP4
INDIRI4
CNSTI4 1
LTI4 $755
line 1791
;1791:			offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1792
;1792:		}
LABELV $755
line 1793
;1793:		if (!oldinventory[INVENTORY_GUARD] && bs->inventory[INVENTORY_GUARD] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $757
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
INDIRI4
CNSTI4 1
LTI4 $757
line 1794
;1794:			offence = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1795
;1795:		}
LABELV $757
line 1796
;1796:		if (!oldinventory[INVENTORY_DOUBLER] && bs->inventory[INVENTORY_DOUBLER] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 0
NEI4 $759
ADDRFP4 0
INDIRP4
CNSTI4 6156
ADDP4
INDIRI4
CNSTI4 1
LTI4 $759
line 1797
;1797:			offence = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1798
;1798:		}
LABELV $759
line 1799
;1799:		if (!oldinventory[INVENTORY_AMMOREGEN] && bs->inventory[INVENTORY_AMMOREGEN] >= 1) {
ADDRFP4 4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 0
NEI4 $761
ADDRFP4 0
INDIRP4
CNSTI4 6160
ADDP4
INDIRI4
CNSTI4 1
LTI4 $761
line 1800
;1800:			offence = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1801
;1801:		}
LABELV $761
line 1802
;1802:	}
LABELV $753
line 1804
;1803:
;1804:	if (offence >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $763
line 1805
;1805:		leader = ClientFromName(bs->teamleader);
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 1806
;1806:		if (offence) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $765
line 1807
;1807:			if (!(bs->teamtaskpreference & TEAMTP_ATTACKER)) {
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $767
line 1809
;1808:				// if we have a bot team leader
;1809:				if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $769
line 1811
;1810:					// tell the leader we want to be on offence
;1811:					BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $771
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1814
;1812:					//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1813:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1814:				}
ADDRGP4 $770
JUMPV
LABELV $769
line 1815
;1815:				else if (g_spSkill.integer <= 3) {
ADDRGP4 g_spSkill+12
INDIRI4
CNSTI4 3
GTI4 $772
line 1816
;1816:					if ( ( bs->ltgtype != LTG_GETFLAG ) &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 4
EQI4 $775
ADDRLP4 24
INDIRI4
CNSTI4 13
EQI4 $775
ADDRLP4 24
INDIRI4
CNSTI4 12
EQI4 $775
ADDRLP4 28
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 5
EQI4 $778
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $777
LABELV $778
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 11056
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $775
ADDRLP4 32
INDIRP4
CNSTI4 11060
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $775
LABELV $777
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $779
ADDRFP4 0
INDIRP4
CNSTI4 11064
ADDP4
INDIRI4
CNSTI4 0
NEI4 $775
LABELV $779
line 1824
;1817:						( bs->ltgtype != LTG_ATTACKENEMYBASE ) &&
;1818:						( bs->ltgtype != LTG_HARVEST ) &&
;1819:						( ( ( gametype != GT_CTF ) &&
;1820:						( gametype != GT_CTF_ELIMINATION ) ) ||
;1821:						( ( bs->redflagstatus == 0 ) &&
;1822:						( bs->blueflagstatus == 0 ) ) ) &&
;1823:						( ( gametype != GT_1FCTF ) ||
;1824:						( bs->neutralflagstatus == 0 ) ) ) {
line 1826
;1825:							// tell the leader we want to be on offence
;1826:							BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $771
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1829
;1827:							//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1828:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1829:						}
LABELV $775
line 1830
;1830:					bs->teamtaskpreference |= TEAMTP_ATTACKER;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1831
;1831:				}
LABELV $772
LABELV $770
line 1832
;1832:			}
LABELV $767
line 1833
;1833:			bs->teamtaskpreference &= ~TEAMTP_DEFENDER;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1834
;1834:		}
ADDRGP4 $766
JUMPV
LABELV $765
line 1835
;1835:		else {
line 1836
;1836:			if (!(bs->teamtaskpreference & TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $780
line 1838
;1837:				// if we have a bot team leader
;1838:				if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $782
line 1840
;1839:					// tell the leader we want to be on defense
;1840:					BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $784
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1843
;1841:					//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1842:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1843:				}
ADDRGP4 $783
JUMPV
LABELV $782
line 1844
;1844:				else if ( (g_spSkill.integer <= 3) &&
ADDRLP4 24
CNSTI4 3
ASGNI4
ADDRGP4 g_spSkill+12
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $785
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $785
ADDRLP4 28
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 5
EQI4 $789
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $788
LABELV $789
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 11056
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $785
ADDRLP4 32
INDIRP4
CNSTI4 11060
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $785
LABELV $788
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $790
ADDRFP4 0
INDIRP4
CNSTI4 11064
ADDP4
INDIRI4
CNSTI4 0
NEI4 $785
LABELV $790
line 1851
;1845:					( bs->ltgtype != LTG_DEFENDKEYAREA ) &&
;1846:					( ( ( gametype != GT_CTF ) &&
;1847:					( gametype != GT_CTF_ELIMINATION ) ) ||
;1848:					( ( bs->redflagstatus == 0 ) &&
;1849:					( bs->blueflagstatus == 0 ) ) ) &&
;1850:					( ( gametype != GT_1FCTF ) ||
;1851:					( bs->neutralflagstatus == 0 ) ) ) {
line 1854
;1852:
;1853:					// tell the leader we want to be on defense
;1854:					BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $784
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 1857
;1855:					//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1856:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1857:				}
LABELV $785
LABELV $783
line 1858
;1858:				bs->teamtaskpreference |= TEAMTP_DEFENDER;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1859
;1859:			}
LABELV $780
line 1860
;1860:			bs->teamtaskpreference &= ~TEAMTP_ATTACKER;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 10856
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1861
;1861:		}
LABELV $766
line 1862
;1862:	}
LABELV $763
line 1864
;1863:
;1864:}
LABELV $742
endproc BotCheckItemPickup 44 12
export BotUpdateInventory
proc BotUpdateInventory 4404 12
line 1871
;1865:
;1866:/*
;1867:==================
;1868:BotUpdateInventory
;1869:==================
;1870:*/
;1871:void BotUpdateInventory(bot_state_t *bs) {
line 1874
;1872:	int oldinventory[MAX_ITEMS];
;1873:
;1874:	memcpy(oldinventory, bs->inventory, sizeof(oldinventory));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 5984
ADDP4
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1876
;1875:	//armor
;1876:	bs->inventory[INVENTORY_ARMOR] = bs->cur_ps.stats[STAT_ARMOR];
ADDRLP4 4096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4096
INDIRP4
CNSTI4 5988
ADDP4
ADDRLP4 4096
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
line 1878
;1877:	//weapons
;1878:	bs->inventory[INVENTORY_GAUNTLET] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GAUNTLET)) != 0;
ADDRLP4 4104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4104
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $793
ADDRLP4 4100
CNSTI4 1
ASGNI4
ADDRGP4 $794
JUMPV
LABELV $793
ADDRLP4 4100
CNSTI4 0
ASGNI4
LABELV $794
ADDRLP4 4104
INDIRP4
CNSTI4 6000
ADDP4
ADDRLP4 4100
INDIRI4
ASGNI4
line 1879
;1879:	bs->inventory[INVENTORY_SHOTGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_SHOTGUN)) != 0;
ADDRLP4 4112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4112
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $796
ADDRLP4 4108
CNSTI4 1
ASGNI4
ADDRGP4 $797
JUMPV
LABELV $796
ADDRLP4 4108
CNSTI4 0
ASGNI4
LABELV $797
ADDRLP4 4112
INDIRP4
CNSTI4 6004
ADDP4
ADDRLP4 4108
INDIRI4
ASGNI4
line 1880
;1880:	bs->inventory[INVENTORY_MACHINEGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_MACHINEGUN)) != 0;
ADDRLP4 4120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $799
ADDRLP4 4116
CNSTI4 1
ASGNI4
ADDRGP4 $800
JUMPV
LABELV $799
ADDRLP4 4116
CNSTI4 0
ASGNI4
LABELV $800
ADDRLP4 4120
INDIRP4
CNSTI4 6008
ADDP4
ADDRLP4 4116
INDIRI4
ASGNI4
line 1881
;1881:	bs->inventory[INVENTORY_GRENADELAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRENADE_LAUNCHER)) != 0;
ADDRLP4 4128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4128
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $802
ADDRLP4 4124
CNSTI4 1
ASGNI4
ADDRGP4 $803
JUMPV
LABELV $802
ADDRLP4 4124
CNSTI4 0
ASGNI4
LABELV $803
ADDRLP4 4128
INDIRP4
CNSTI4 6012
ADDP4
ADDRLP4 4124
INDIRI4
ASGNI4
line 1882
;1882:	bs->inventory[INVENTORY_ROCKETLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_ROCKET_LAUNCHER)) != 0;
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4136
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $805
ADDRLP4 4132
CNSTI4 1
ASGNI4
ADDRGP4 $806
JUMPV
LABELV $805
ADDRLP4 4132
CNSTI4 0
ASGNI4
LABELV $806
ADDRLP4 4136
INDIRP4
CNSTI4 6016
ADDP4
ADDRLP4 4132
INDIRI4
ASGNI4
line 1883
;1883:	bs->inventory[INVENTORY_LIGHTNING] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_LIGHTNING)) != 0;
ADDRLP4 4144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4144
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $808
ADDRLP4 4140
CNSTI4 1
ASGNI4
ADDRGP4 $809
JUMPV
LABELV $808
ADDRLP4 4140
CNSTI4 0
ASGNI4
LABELV $809
ADDRLP4 4144
INDIRP4
CNSTI4 6020
ADDP4
ADDRLP4 4140
INDIRI4
ASGNI4
line 1884
;1884:	bs->inventory[INVENTORY_RAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_RAILGUN)) != 0;
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4152
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $811
ADDRLP4 4148
CNSTI4 1
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $811
ADDRLP4 4148
CNSTI4 0
ASGNI4
LABELV $812
ADDRLP4 4152
INDIRP4
CNSTI4 6024
ADDP4
ADDRLP4 4148
INDIRI4
ASGNI4
line 1885
;1885:	bs->inventory[INVENTORY_PLASMAGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PLASMAGUN)) != 0;
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4160
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $814
ADDRLP4 4156
CNSTI4 1
ASGNI4
ADDRGP4 $815
JUMPV
LABELV $814
ADDRLP4 4156
CNSTI4 0
ASGNI4
LABELV $815
ADDRLP4 4160
INDIRP4
CNSTI4 6028
ADDP4
ADDRLP4 4156
INDIRI4
ASGNI4
line 1886
;1886:	bs->inventory[INVENTORY_BFG10K] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_BFG)) != 0;
ADDRLP4 4168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $817
ADDRLP4 4164
CNSTI4 1
ASGNI4
ADDRGP4 $818
JUMPV
LABELV $817
ADDRLP4 4164
CNSTI4 0
ASGNI4
LABELV $818
ADDRLP4 4168
INDIRP4
CNSTI4 6036
ADDP4
ADDRLP4 4164
INDIRI4
ASGNI4
line 1887
;1887:	bs->inventory[INVENTORY_GRAPPLINGHOOK] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRAPPLING_HOOK)) != 0;
ADDRLP4 4176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4176
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $820
ADDRLP4 4172
CNSTI4 1
ASGNI4
ADDRGP4 $821
JUMPV
LABELV $820
ADDRLP4 4172
CNSTI4 0
ASGNI4
LABELV $821
ADDRLP4 4176
INDIRP4
CNSTI4 6040
ADDP4
ADDRLP4 4172
INDIRI4
ASGNI4
line 1888
;1888:	bs->inventory[INVENTORY_NAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_NAILGUN)) != 0;;
ADDRLP4 4184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4184
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $823
ADDRLP4 4180
CNSTI4 1
ASGNI4
ADDRGP4 $824
JUMPV
LABELV $823
ADDRLP4 4180
CNSTI4 0
ASGNI4
LABELV $824
ADDRLP4 4184
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 4180
INDIRI4
ASGNI4
line 1889
;1889:	bs->inventory[INVENTORY_PROXLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PROX_LAUNCHER)) != 0;;
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4192
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $826
ADDRLP4 4188
CNSTI4 1
ASGNI4
ADDRGP4 $827
JUMPV
LABELV $826
ADDRLP4 4188
CNSTI4 0
ASGNI4
LABELV $827
ADDRLP4 4192
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 4188
INDIRI4
ASGNI4
line 1890
;1890:	bs->inventory[INVENTORY_CHAINGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_CHAINGUN)) != 0;;
ADDRLP4 4200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4200
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $829
ADDRLP4 4196
CNSTI4 1
ASGNI4
ADDRGP4 $830
JUMPV
LABELV $829
ADDRLP4 4196
CNSTI4 0
ASGNI4
LABELV $830
ADDRLP4 4200
INDIRP4
CNSTI4 6052
ADDP4
ADDRLP4 4196
INDIRI4
ASGNI4
line 1892
;1891:	//ammo
;1892:	bs->inventory[INVENTORY_SHELLS] = bs->cur_ps.ammo[WP_SHOTGUN];
ADDRLP4 4204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4204
INDIRP4
CNSTI4 6056
ADDP4
ADDRLP4 4204
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
ASGNI4
line 1893
;1893:	bs->inventory[INVENTORY_BULLETS] = bs->cur_ps.ammo[WP_MACHINEGUN];
ADDRLP4 4208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4208
INDIRP4
CNSTI4 6060
ADDP4
ADDRLP4 4208
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
ASGNI4
line 1894
;1894:	bs->inventory[INVENTORY_GRENADES] = bs->cur_ps.ammo[WP_GRENADE_LAUNCHER];
ADDRLP4 4212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4212
INDIRP4
CNSTI4 6064
ADDP4
ADDRLP4 4212
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 1895
;1895:	bs->inventory[INVENTORY_CELLS] = bs->cur_ps.ammo[WP_PLASMAGUN];
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
INDIRP4
CNSTI4 6068
ADDP4
ADDRLP4 4216
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 1896
;1896:	bs->inventory[INVENTORY_LIGHTNINGAMMO] = bs->cur_ps.ammo[WP_LIGHTNING];
ADDRLP4 4220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4220
INDIRP4
CNSTI4 6072
ADDP4
ADDRLP4 4220
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 1897
;1897:	bs->inventory[INVENTORY_ROCKETS] = bs->cur_ps.ammo[WP_ROCKET_LAUNCHER];
ADDRLP4 4224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4224
INDIRP4
CNSTI4 6076
ADDP4
ADDRLP4 4224
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 1898
;1898:	bs->inventory[INVENTORY_SLUGS] = bs->cur_ps.ammo[WP_RAILGUN];
ADDRLP4 4228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4228
INDIRP4
CNSTI4 6080
ADDP4
ADDRLP4 4228
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 1899
;1899:	bs->inventory[INVENTORY_BFGAMMO] = bs->cur_ps.ammo[WP_BFG];
ADDRLP4 4232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4232
INDIRP4
CNSTI4 6084
ADDP4
ADDRLP4 4232
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
ASGNI4
line 1900
;1900:	bs->inventory[INVENTORY_NAILS] = bs->cur_ps.ammo[WP_NAILGUN];
ADDRLP4 4236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4236
INDIRP4
CNSTI4 6088
ADDP4
ADDRLP4 4236
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 1901
;1901:	bs->inventory[INVENTORY_MINES] = bs->cur_ps.ammo[WP_PROX_LAUNCHER];
ADDRLP4 4240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4240
INDIRP4
CNSTI4 6092
ADDP4
ADDRLP4 4240
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 1902
;1902:	bs->inventory[INVENTORY_BELT] = bs->cur_ps.ammo[WP_CHAINGUN];
ADDRLP4 4244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4244
INDIRP4
CNSTI4 6096
ADDP4
ADDRLP4 4244
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ASGNI4
line 1904
;1903:	//powerups
;1904:	bs->inventory[INVENTORY_HEALTH] = bs->cur_ps.stats[STAT_HEALTH];
ADDRLP4 4248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4248
INDIRP4
CNSTI4 6100
ADDP4
ADDRLP4 4248
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 1905
;1905:	bs->inventory[INVENTORY_TELEPORTER] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_TELEPORTER;
ADDRLP4 4256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4256
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 26
NEI4 $832
ADDRLP4 4252
CNSTI4 1
ASGNI4
ADDRGP4 $833
JUMPV
LABELV $832
ADDRLP4 4252
CNSTI4 0
ASGNI4
LABELV $833
ADDRLP4 4256
INDIRP4
CNSTI4 6104
ADDP4
ADDRLP4 4252
INDIRI4
ASGNI4
line 1906
;1906:	bs->inventory[INVENTORY_MEDKIT] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_MEDKIT;
ADDRLP4 4264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4264
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 27
NEI4 $835
ADDRLP4 4260
CNSTI4 1
ASGNI4
ADDRGP4 $836
JUMPV
LABELV $835
ADDRLP4 4260
CNSTI4 0
ASGNI4
LABELV $836
ADDRLP4 4264
INDIRP4
CNSTI4 6108
ADDP4
ADDRLP4 4260
INDIRI4
ASGNI4
line 1907
;1907:	bs->inventory[INVENTORY_KAMIKAZE] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_KAMIKAZE;
ADDRLP4 4272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4272
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 36
NEI4 $838
ADDRLP4 4268
CNSTI4 1
ASGNI4
ADDRGP4 $839
JUMPV
LABELV $838
ADDRLP4 4268
CNSTI4 0
ASGNI4
LABELV $839
ADDRLP4 4272
INDIRP4
CNSTI4 6112
ADDP4
ADDRLP4 4268
INDIRI4
ASGNI4
line 1908
;1908:	bs->inventory[INVENTORY_PORTAL] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_PORTAL;
ADDRLP4 4280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4280
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 37
NEI4 $841
ADDRLP4 4276
CNSTI4 1
ASGNI4
ADDRGP4 $842
JUMPV
LABELV $841
ADDRLP4 4276
CNSTI4 0
ASGNI4
LABELV $842
ADDRLP4 4280
INDIRP4
CNSTI4 6116
ADDP4
ADDRLP4 4276
INDIRI4
ASGNI4
line 1909
;1909:	bs->inventory[INVENTORY_INVULNERABILITY] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_INVULNERABILITY;
ADDRLP4 4288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4288
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 38
NEI4 $844
ADDRLP4 4284
CNSTI4 1
ASGNI4
ADDRGP4 $845
JUMPV
LABELV $844
ADDRLP4 4284
CNSTI4 0
ASGNI4
LABELV $845
ADDRLP4 4288
INDIRP4
CNSTI4 6120
ADDP4
ADDRLP4 4284
INDIRI4
ASGNI4
line 1910
;1910:	bs->inventory[INVENTORY_QUAD] = bs->cur_ps.powerups[PW_QUAD] != 0;
ADDRLP4 4296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4296
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $847
ADDRLP4 4292
CNSTI4 1
ASGNI4
ADDRGP4 $848
JUMPV
LABELV $847
ADDRLP4 4292
CNSTI4 0
ASGNI4
LABELV $848
ADDRLP4 4296
INDIRP4
CNSTI4 6124
ADDP4
ADDRLP4 4292
INDIRI4
ASGNI4
line 1911
;1911:	bs->inventory[INVENTORY_ENVIRONMENTSUIT] = bs->cur_ps.powerups[PW_BATTLESUIT] != 0;
ADDRLP4 4304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4304
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $850
ADDRLP4 4300
CNSTI4 1
ASGNI4
ADDRGP4 $851
JUMPV
LABELV $850
ADDRLP4 4300
CNSTI4 0
ASGNI4
LABELV $851
ADDRLP4 4304
INDIRP4
CNSTI4 6128
ADDP4
ADDRLP4 4300
INDIRI4
ASGNI4
line 1912
;1912:	bs->inventory[INVENTORY_HASTE] = bs->cur_ps.powerups[PW_HASTE] != 0;
ADDRLP4 4312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4312
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $853
ADDRLP4 4308
CNSTI4 1
ASGNI4
ADDRGP4 $854
JUMPV
LABELV $853
ADDRLP4 4308
CNSTI4 0
ASGNI4
LABELV $854
ADDRLP4 4312
INDIRP4
CNSTI4 6132
ADDP4
ADDRLP4 4308
INDIRI4
ASGNI4
line 1913
;1913:	bs->inventory[INVENTORY_INVISIBILITY] = bs->cur_ps.powerups[PW_INVIS] != 0;
ADDRLP4 4320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4320
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $856
ADDRLP4 4316
CNSTI4 1
ASGNI4
ADDRGP4 $857
JUMPV
LABELV $856
ADDRLP4 4316
CNSTI4 0
ASGNI4
LABELV $857
ADDRLP4 4320
INDIRP4
CNSTI4 6136
ADDP4
ADDRLP4 4316
INDIRI4
ASGNI4
line 1914
;1914:	bs->inventory[INVENTORY_REGEN] = bs->cur_ps.powerups[PW_REGEN] != 0;
ADDRLP4 4328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4328
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $859
ADDRLP4 4324
CNSTI4 1
ASGNI4
ADDRGP4 $860
JUMPV
LABELV $859
ADDRLP4 4324
CNSTI4 0
ASGNI4
LABELV $860
ADDRLP4 4328
INDIRP4
CNSTI4 6140
ADDP4
ADDRLP4 4324
INDIRI4
ASGNI4
line 1915
;1915:	bs->inventory[INVENTORY_FLIGHT] = bs->cur_ps.powerups[PW_FLIGHT] != 0;
ADDRLP4 4336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4336
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $862
ADDRLP4 4332
CNSTI4 1
ASGNI4
ADDRGP4 $863
JUMPV
LABELV $862
ADDRLP4 4332
CNSTI4 0
ASGNI4
LABELV $863
ADDRLP4 4336
INDIRP4
CNSTI4 6144
ADDP4
ADDRLP4 4332
INDIRI4
ASGNI4
line 1916
;1916:	bs->inventory[INVENTORY_SCOUT] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_SCOUT;
ADDRLP4 4344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4344
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 42
NEI4 $865
ADDRLP4 4340
CNSTI4 1
ASGNI4
ADDRGP4 $866
JUMPV
LABELV $865
ADDRLP4 4340
CNSTI4 0
ASGNI4
LABELV $866
ADDRLP4 4344
INDIRP4
CNSTI4 6148
ADDP4
ADDRLP4 4340
INDIRI4
ASGNI4
line 1917
;1917:	bs->inventory[INVENTORY_GUARD] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_GUARD;
ADDRLP4 4352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4352
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 43
NEI4 $868
ADDRLP4 4348
CNSTI4 1
ASGNI4
ADDRGP4 $869
JUMPV
LABELV $868
ADDRLP4 4348
CNSTI4 0
ASGNI4
LABELV $869
ADDRLP4 4352
INDIRP4
CNSTI4 6152
ADDP4
ADDRLP4 4348
INDIRI4
ASGNI4
line 1918
;1918:	bs->inventory[INVENTORY_DOUBLER] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_DOUBLER;
ADDRLP4 4360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4360
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 44
NEI4 $871
ADDRLP4 4356
CNSTI4 1
ASGNI4
ADDRGP4 $872
JUMPV
LABELV $871
ADDRLP4 4356
CNSTI4 0
ASGNI4
LABELV $872
ADDRLP4 4360
INDIRP4
CNSTI4 6156
ADDP4
ADDRLP4 4356
INDIRI4
ASGNI4
line 1919
;1919:	bs->inventory[INVENTORY_AMMOREGEN] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_AMMOREGEN;
ADDRLP4 4368
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4368
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 45
NEI4 $874
ADDRLP4 4364
CNSTI4 1
ASGNI4
ADDRGP4 $875
JUMPV
LABELV $874
ADDRLP4 4364
CNSTI4 0
ASGNI4
LABELV $875
ADDRLP4 4368
INDIRP4
CNSTI4 6160
ADDP4
ADDRLP4 4364
INDIRI4
ASGNI4
line 1920
;1920:	bs->inventory[INVENTORY_REDFLAG] = bs->cur_ps.powerups[PW_REDFLAG] != 0;
ADDRLP4 4376
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4376
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $877
ADDRLP4 4372
CNSTI4 1
ASGNI4
ADDRGP4 $878
JUMPV
LABELV $877
ADDRLP4 4372
CNSTI4 0
ASGNI4
LABELV $878
ADDRLP4 4376
INDIRP4
CNSTI4 6164
ADDP4
ADDRLP4 4372
INDIRI4
ASGNI4
line 1921
;1921:	bs->inventory[INVENTORY_BLUEFLAG] = bs->cur_ps.powerups[PW_BLUEFLAG] != 0;
ADDRLP4 4384
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4384
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $880
ADDRLP4 4380
CNSTI4 1
ASGNI4
ADDRGP4 $881
JUMPV
LABELV $880
ADDRLP4 4380
CNSTI4 0
ASGNI4
LABELV $881
ADDRLP4 4384
INDIRP4
CNSTI4 6168
ADDP4
ADDRLP4 4380
INDIRI4
ASGNI4
line 1922
;1922:	bs->inventory[INVENTORY_NEUTRALFLAG] = bs->cur_ps.powerups[PW_NEUTRALFLAG] != 0;
ADDRLP4 4392
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4392
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $883
ADDRLP4 4388
CNSTI4 1
ASGNI4
ADDRGP4 $884
JUMPV
LABELV $883
ADDRLP4 4388
CNSTI4 0
ASGNI4
LABELV $884
ADDRLP4 4392
INDIRP4
CNSTI4 6172
ADDP4
ADDRLP4 4388
INDIRI4
ASGNI4
line 1923
;1923:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4396
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 4396
INDIRI4
CNSTI4 1
NEI4 $885
line 1924
;1924:		bs->inventory[INVENTORY_REDCUBE] = bs->cur_ps.generic1;
ADDRLP4 4400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4400
INDIRP4
CNSTI4 6176
ADDP4
ADDRLP4 4400
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ASGNI4
line 1925
;1925:		bs->inventory[INVENTORY_BLUECUBE] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
CNSTI4 0
ASGNI4
line 1926
;1926:	}
ADDRGP4 $886
JUMPV
LABELV $885
line 1927
;1927:	else {
line 1928
;1928:		bs->inventory[INVENTORY_REDCUBE] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
CNSTI4 0
ASGNI4
line 1929
;1929:		bs->inventory[INVENTORY_BLUECUBE] = bs->cur_ps.generic1;
ADDRLP4 4400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4400
INDIRP4
CNSTI4 6180
ADDP4
ADDRLP4 4400
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ASGNI4
line 1930
;1930:	}
LABELV $886
line 1931
;1931:	BotCheckItemPickup(bs, oldinventory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckItemPickup
CALLV
pop
line 1932
;1932:}
LABELV $791
endproc BotUpdateInventory 4404 12
export BotUpdateBattleInventory
proc BotUpdateBattleInventory 160 8
line 1939
;1933:
;1934:/*
;1935:==================
;1936:BotUpdateBattleInventory
;1937:==================
;1938:*/
;1939:void BotUpdateBattleInventory(bot_state_t *bs, int enemy) {
line 1943
;1940:	vec3_t dir;
;1941:	aas_entityinfo_t entinfo;
;1942:
;1943:	BotEntityInfo(enemy, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1944
;1944:	VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+24
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+24+4
INDIRF4
ADDRLP4 152
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
line 1945
;1945:	bs->inventory[ENEMY_HEIGHT] = (int) dir[2];
ADDRFP4 0
INDIRP4
CNSTI4 6788
ADDP4
ADDRLP4 0+8
INDIRF4
CVFI4 4
ASGNI4
line 1946
;1946:	dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1947
;1947:	bs->inventory[ENEMY_HORIZONTAL_DIST] = (int) VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6784
ADDP4
ADDRLP4 156
INDIRF4
CVFI4 4
ASGNI4
line 1949
;1948:	//FIXME: add num visible enemies and num visible team mates to the inventory
;1949:}
LABELV $887
endproc BotUpdateBattleInventory 160 8
export BotUseKamikaze
proc BotUseKamikaze 292 28
line 1958
;1950:
;1951:/*
;1952:==================
;1953:BotUseKamikaze
;1954:==================
;1955:*/
;1956:#define KAMIKAZE_DIST		1024
;1957:
;1958:void BotUseKamikaze(bot_state_t *bs) {
line 1966
;1959:	int c, teammates, enemies;
;1960:	aas_entityinfo_t entinfo;
;1961:	vec3_t dir, target;
;1962:	bot_goal_t *goal;
;1963:	bsp_trace_t trace;
;1964:
;1965:	//if the bot has no kamikaze
;1966:	if (bs->inventory[INVENTORY_KAMIKAZE] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 6112
ADDP4
INDIRI4
CNSTI4 0
GTI4 $898
line 1967
;1967:		return;
ADDRGP4 $897
JUMPV
LABELV $898
line 1968
;1968:	if (bs->kamikaze_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 10208
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $900
line 1969
;1969:		return;
ADDRGP4 $897
JUMPV
LABELV $900
line 1970
;1970:	bs->kamikaze_time = FloatTime() + 0.2;
ADDRFP4 0
INDIRP4
CNSTI4 10208
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 1971
;1971:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 264
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 5
EQI4 $904
ADDRLP4 264
INDIRI4
CNSTI4 10
NEI4 $902
LABELV $904
line 1973
;1972:		//never use kamikaze if the team flag carrier is visible
;1973:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $905
line 1974
;1974:			return;
ADDRGP4 $897
JUMPV
LABELV $905
line 1975
;1975:		c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 272
INDIRI4
ASGNI4
line 1976
;1976:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $907
line 1977
;1977:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1978
;1978:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1979
;1979:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 280
INDIRF4
CNSTF4 1233125376
GEF4 $916
line 1980
;1980:				return;
ADDRGP4 $897
JUMPV
LABELV $916
line 1981
;1981:		}
LABELV $907
line 1982
;1982:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 276
INDIRI4
ASGNI4
line 1983
;1983:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $903
line 1984
;1984:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1985
;1985:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1986
;1986:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
ADDRLP4 4
ARGP4
ADDRLP4 284
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 284
INDIRF4
CNSTF4 1233125376
GEF4 $903
line 1987
;1987:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 1988
;1988:				return;
ADDRGP4 $897
JUMPV
line 1990
;1989:			}
;1990:		}
line 1991
;1991:	}
LABELV $902
line 1992
;1992:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $929
line 1994
;1993:		//never use kamikaze if the team flag carrier is visible
;1994:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $931
line 1995
;1995:			return;
ADDRGP4 $897
JUMPV
LABELV $931
line 1996
;1996:		c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 272
INDIRI4
ASGNI4
line 1997
;1997:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $933
line 1998
;1998:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1999
;1999:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2000
;2000:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 280
INDIRF4
CNSTF4 1233125376
GEF4 $942
line 2001
;2001:				return;
ADDRGP4 $897
JUMPV
LABELV $942
line 2002
;2002:		}
LABELV $933
line 2003
;2003:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 276
INDIRI4
ASGNI4
line 2004
;2004:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $930
line 2005
;2005:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2006
;2006:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2007
;2007:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
ADDRLP4 4
ARGP4
ADDRLP4 284
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 284
INDIRF4
CNSTF4 1233125376
GEF4 $930
line 2008
;2008:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2009
;2009:				return;
ADDRGP4 $897
JUMPV
line 2011
;2010:			}
;2011:		}
line 2012
;2012:	}
LABELV $929
line 2013
;2013:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $955
line 2014
;2014:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 268
ADDRLP4 272
INDIRI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 1
EQI4 $960
ADDRGP4 $957
JUMPV
LABELV $960
line 2015
;2015:			case TEAM_RED: goal = &blueobelisk; break;
ADDRLP4 176
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $958
JUMPV
LABELV $957
line 2016
;2016:			default: goal = &redobelisk; break;
ADDRLP4 176
ADDRGP4 redobelisk
ASGNP4
LABELV $958
line 2019
;2017:		}
;2018:		//if the obelisk is visible
;2019:		VectorCopy(goal->origin, target);
ADDRLP4 164
ADDRLP4 176
INDIRP4
INDIRB
ASGNB 12
line 2020
;2020:		target[2] += 1;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2021
;2021:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 276
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRLP4 164
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 276
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRLP4 164+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRLP4 164+8
INDIRF4
SUBF4
ASGNF4
line 2022
;2022:		if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST * 0.9)) {
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 280
INDIRF4
CNSTF4 1229937705
GEF4 $956
line 2023
;2023:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 180
ARGP4
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 288
CNSTP4 0
ASGNP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 164
ARGP4
ADDRLP4 284
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2024
;2024:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 180+8
INDIRF4
CNSTF4 1065353216
GEF4 $972
ADDRLP4 180+80
INDIRI4
ADDRLP4 176
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $956
LABELV $972
line 2025
;2025:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2026
;2026:				return;
ADDRGP4 $897
JUMPV
line 2028
;2027:			}
;2028:		}
line 2029
;2029:	}
LABELV $955
line 2030
;2030:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $973
line 2032
;2031:		//
;2032:		if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $975
line 2033
;2033:			return;
ADDRGP4 $897
JUMPV
LABELV $975
line 2035
;2034:		//never use kamikaze if a team mate carrying cubes is visible
;2035:		c = BotTeamCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotTeamCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 272
INDIRI4
ASGNI4
line 2036
;2036:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $977
line 2037
;2037:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2038
;2038:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2039
;2039:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
ADDRLP4 4
ARGP4
ADDRLP4 280
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 280
INDIRF4
CNSTF4 1233125376
GEF4 $986
line 2040
;2040:				return;
ADDRGP4 $897
JUMPV
LABELV $986
line 2041
;2041:		}
LABELV $977
line 2042
;2042:		c = BotEnemyCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 BotEnemyCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 276
INDIRI4
ASGNI4
line 2043
;2043:		if (c >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $988
line 2044
;2044:			BotEntityInfo(c, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2045
;2045:			VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16+24
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16+24+4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2046
;2046:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
ADDRLP4 4
ARGP4
ADDRLP4 284
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 284
INDIRF4
CNSTF4 1233125376
GEF4 $997
line 2047
;2047:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2048
;2048:				return;
ADDRGP4 $897
JUMPV
LABELV $997
line 2050
;2049:			}
;2050:		}
LABELV $988
line 2051
;2051:	}
LABELV $973
LABELV $956
LABELV $930
LABELV $903
line 2053
;2052:	//
;2053:	BotVisibleTeamMatesAndEnemies(bs, &teammates, &enemies, KAMIKAZE_DIST);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 156
ARGP4
CNSTF4 1149239296
ARGF4
ADDRGP4 BotVisibleTeamMatesAndEnemies
CALLV
pop
line 2055
;2054:	//
;2055:	if (enemies > 2 && enemies > teammates+1) {
ADDRLP4 268
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 2
LEI4 $999
ADDRLP4 268
INDIRI4
ADDRLP4 160
INDIRI4
CNSTI4 1
ADDI4
LEI4 $999
line 2056
;2056:		trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2057
;2057:		return;
LABELV $999
line 2059
;2058:	}
;2059:}
LABELV $897
endproc BotUseKamikaze 292 28
export BotUseInvulnerability
proc BotUseInvulnerability 152 28
line 2066
;2060:
;2061:/*
;2062:==================
;2063:BotUseInvulnerability
;2064:==================
;2065:*/
;2066:void BotUseInvulnerability(bot_state_t *bs) {
line 2073
;2067:	int c;
;2068:	vec3_t dir, target;
;2069:	bot_goal_t *goal;
;2070:	bsp_trace_t trace;
;2071:
;2072:	//if the bot has no invulnerability
;2073:	if (bs->inventory[INVENTORY_INVULNERABILITY] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 6120
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1002
line 2074
;2074:		return;
ADDRGP4 $1001
JUMPV
LABELV $1002
line 2075
;2075:	if (bs->invulnerability_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 10212
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1004
line 2076
;2076:		return;
ADDRGP4 $1001
JUMPV
LABELV $1004
line 2077
;2077:	bs->invulnerability_time = FloatTime() + 0.2;
ADDRFP4 0
INDIRP4
CNSTI4 10212
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 2078
;2078:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 116
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 5
EQI4 $1008
ADDRLP4 116
INDIRI4
CNSTI4 10
NEI4 $1006
LABELV $1008
line 2080
;2079:		//never use kamikaze if the team flag carrier is visible
;2080:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $1009
line 2081
;2081:			return;
ADDRGP4 $1001
JUMPV
LABELV $1009
line 2082
;2082:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 124
INDIRI4
ASGNI4
line 2083
;2083:		if (c >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $1011
line 2084
;2084:			return;
ADDRGP4 $1001
JUMPV
LABELV $1011
line 2086
;2085:		//if near enemy flag and the flag is visible
;2086:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 128
ADDRLP4 132
INDIRI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 1
EQI4 $1016
ADDRGP4 $1013
JUMPV
LABELV $1016
line 2087
;2087:			case TEAM_RED: goal = &ctf_blueflag; break;
ADDRLP4 28
ADDRGP4 ctf_blueflag
ASGNP4
ADDRGP4 $1014
JUMPV
LABELV $1013
line 2088
;2088:			default: goal = &ctf_redflag; break;
ADDRLP4 28
ADDRGP4 ctf_redflag
ASGNP4
LABELV $1014
line 2091
;2089:		}
;2090:		//if the obelisk is visible
;2091:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 2092
;2092:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2093
;2093:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 136
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 136
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2094
;2094:		if (VectorLengthSquared(dir) < Square(200)) {
ADDRLP4 12
ARGP4
ADDRLP4 140
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1193033728
GEF4 $1007
line 2095
;2095:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2096
;2096:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $1028
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $1007
LABELV $1028
line 2097
;2097:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2098
;2098:				return;
ADDRGP4 $1001
JUMPV
line 2100
;2099:			}
;2100:		}
line 2101
;2101:	}
LABELV $1006
line 2102
;2102:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1029
line 2104
;2103:		//never use kamikaze if the team flag carrier is visible
;2104:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $1031
line 2105
;2105:			return;
ADDRGP4 $1001
JUMPV
LABELV $1031
line 2106
;2106:		c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 124
INDIRI4
ASGNI4
line 2107
;2107:		if (c >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $1033
line 2108
;2108:			return;
ADDRGP4 $1001
JUMPV
LABELV $1033
line 2110
;2109:		//if near enemy flag and the flag is visible
;2110:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 128
ADDRLP4 132
INDIRI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 1
EQI4 $1038
ADDRGP4 $1035
JUMPV
LABELV $1038
line 2111
;2111:			case TEAM_RED: goal = &ctf_blueflag; break;
ADDRLP4 28
ADDRGP4 ctf_blueflag
ASGNP4
ADDRGP4 $1036
JUMPV
LABELV $1035
line 2112
;2112:			default: goal = &ctf_redflag; break;
ADDRLP4 28
ADDRGP4 ctf_redflag
ASGNP4
LABELV $1036
line 2115
;2113:		}
;2114:		//if the obelisk is visible
;2115:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 2116
;2116:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2117
;2117:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 136
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 136
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2118
;2118:		if (VectorLengthSquared(dir) < Square(200)) {
ADDRLP4 12
ARGP4
ADDRLP4 140
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1193033728
GEF4 $1030
line 2119
;2119:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2120
;2120:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $1050
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $1030
LABELV $1050
line 2121
;2121:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2122
;2122:				return;
ADDRGP4 $1001
JUMPV
line 2124
;2123:			}
;2124:		}
line 2125
;2125:	}
LABELV $1029
line 2126
;2126:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $1051
line 2127
;2127:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 120
ADDRLP4 124
INDIRI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 1
EQI4 $1056
ADDRGP4 $1053
JUMPV
LABELV $1056
line 2128
;2128:			case TEAM_RED: goal = &blueobelisk; break;
ADDRLP4 28
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $1054
JUMPV
LABELV $1053
line 2129
;2129:			default: goal = &redobelisk; break;
ADDRLP4 28
ADDRGP4 redobelisk
ASGNP4
LABELV $1054
line 2132
;2130:		}
;2131:		//if the obelisk is visible
;2132:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 2133
;2133:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2134
;2134:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 128
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2135
;2135:		if (VectorLengthSquared(dir) < Square(300)) {
ADDRLP4 12
ARGP4
ADDRLP4 132
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 132
INDIRF4
CNSTF4 1202702336
GEF4 $1052
line 2136
;2136:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 140
CNSTP4 0
ASGNP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 136
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2137
;2137:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $1068
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $1052
LABELV $1068
line 2138
;2138:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2139
;2139:				return;
ADDRGP4 $1001
JUMPV
line 2141
;2140:			}
;2141:		}
line 2142
;2142:	}
LABELV $1051
line 2143
;2143:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $1069
line 2145
;2144:		//
;2145:		if (BotHarvesterCarryingCubes(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $1071
line 2146
;2146:			return;
ADDRGP4 $1001
JUMPV
LABELV $1071
line 2147
;2147:		c = BotEnemyCubeCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BotEnemyCubeCarrierVisible
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 124
INDIRI4
ASGNI4
line 2148
;2148:		if (c >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $1073
line 2149
;2149:			return;
ADDRGP4 $1001
JUMPV
LABELV $1073
line 2151
;2150:		//if near enemy base and enemy base is visible
;2151:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 128
ADDRLP4 132
INDIRI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 1
EQI4 $1078
ADDRGP4 $1075
JUMPV
LABELV $1078
line 2152
;2152:			case TEAM_RED: goal = &blueobelisk; break;
ADDRLP4 28
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $1076
JUMPV
LABELV $1075
line 2153
;2153:			default: goal = &redobelisk; break;
ADDRLP4 28
ADDRGP4 redobelisk
ASGNP4
LABELV $1076
line 2156
;2154:		}
;2155:		//if the obelisk is visible
;2156:		VectorCopy(goal->origin, target);
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRB
ASGNB 12
line 2157
;2157:		target[2] += 1;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2158
;2158:		VectorSubtract(bs->origin, target, dir);
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 136
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 136
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2159
;2159:		if (VectorLengthSquared(dir) < Square(200)) {
ADDRLP4 12
ARGP4
ADDRLP4 140
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1193033728
GEF4 $1084
line 2160
;2160:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 32
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2161
;2161:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
GEF4 $1090
ADDRLP4 32+80
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $1086
LABELV $1090
line 2162
;2162:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2163
;2163:				return;
LABELV $1086
line 2165
;2164:			}
;2165:		}
LABELV $1084
line 2166
;2166:	}
LABELV $1069
LABELV $1052
LABELV $1030
LABELV $1007
line 2167
;2167:}
LABELV $1001
endproc BotUseInvulnerability 152 28
export BotBattleUseItems
proc BotBattleUseItems 12 4
line 2174
;2168:
;2169:/*
;2170:==================
;2171:BotBattleUseItems
;2172:==================
;2173:*/
;2174:void BotBattleUseItems(bot_state_t *bs) {
line 2175
;2175:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1092
line 2176
;2176:		if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6104
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1094
line 2177
;2177:			if (!BotCTFCarryingFlag(bs)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1096
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1096
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1096
line 2180
;2178:				&& !Bot1FCTFCarryingFlag(bs)
;2179:				&& !BotHarvesterCarryingCubes(bs)
;2180:				) {
line 2181
;2181:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2182
;2182:			}
LABELV $1096
line 2183
;2183:		}
LABELV $1094
line 2184
;2184:	}
LABELV $1092
line 2185
;2185:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1098
line 2186
;2186:		if (bs->inventory[INVENTORY_MEDKIT] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6108
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1100
line 2187
;2187:			trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2188
;2188:		}
LABELV $1100
line 2189
;2189:	}
LABELV $1098
line 2190
;2190:	BotUseKamikaze(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUseKamikaze
CALLV
pop
line 2191
;2191:	BotUseInvulnerability(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUseInvulnerability
CALLV
pop
line 2192
;2192:}
LABELV $1091
endproc BotBattleUseItems 12 4
export BotSetTeleportTime
proc BotSetTeleportTime 8 0
line 2199
;2193:
;2194:/*
;2195:==================
;2196:BotSetTeleportTime
;2197:==================
;2198:*/
;2199:void BotSetTeleportTime(bot_state_t *bs) {
line 2200
;2200:	if ((bs->cur_ps.eFlags ^ bs->last_eFlags) & EF_TELEPORT_BIT) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1103
line 2201
;2201:		bs->teleport_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10284
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2202
;2202:	}
LABELV $1103
line 2203
;2203:	bs->last_eFlags = bs->cur_ps.eFlags;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ASGNI4
line 2204
;2204:}
LABELV $1102
endproc BotSetTeleportTime 8 0
export BotIsDead
proc BotIsDead 4 0
line 2211
;2205:
;2206:/*
;2207:==================
;2208:BotIsDead
;2209:==================
;2210:*/
;2211:qboolean BotIsDead(bot_state_t *bs) {
line 2212
;2212:	return (bs->cur_ps.pm_type == PM_DEAD);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1107
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1108
JUMPV
LABELV $1107
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1108
ADDRLP4 0
INDIRI4
RETI4
LABELV $1105
endproc BotIsDead 4 0
export BotIsObserver
proc BotIsObserver 1032 12
line 2220
;2213:}
;2214:
;2215:/*
;2216:==================
;2217:BotIsObserver
;2218:==================
;2219:*/
;2220:qboolean BotIsObserver(bot_state_t *bs) {
line 2222
;2221:	char buf[MAX_INFO_STRING];
;2222:	if (bs->cur_ps.pm_type == PM_SPECTATOR) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1110
CNSTI4 1
RETI4
ADDRGP4 $1109
JUMPV
LABELV $1110
line 2223
;2223:	trap_GetConfigstring(CS_PLAYERS+bs->client, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 2224
;2224:	if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) return qtrue;
ADDRLP4 0
ARGP4
ADDRGP4 $1114
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 3
NEI4 $1112
CNSTI4 1
RETI4
ADDRGP4 $1109
JUMPV
LABELV $1112
line 2225
;2225:	return qfalse;
CNSTI4 0
RETI4
LABELV $1109
endproc BotIsObserver 1032 12
export BotIntermission
proc BotIntermission 8 0
line 2233
;2226:}
;2227:
;2228:/*
;2229:==================
;2230:BotIntermission
;2231:==================
;2232:*/
;2233:qboolean BotIntermission(bot_state_t *bs) {
line 2235
;2234:	//NOTE: we shouldn't be looking at the game code...
;2235:	if (level.intermissiontime) return qtrue;
ADDRGP4 level+9912
INDIRI4
CNSTI4 0
EQI4 $1116
CNSTI4 1
RETI4
ADDRGP4 $1115
JUMPV
LABELV $1116
line 2236
;2236:	return (bs->cur_ps.pm_type == PM_FREEZE || bs->cur_ps.pm_type == PM_INTERMISSION);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
EQI4 $1122
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $1120
LABELV $1122
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1121
JUMPV
LABELV $1120
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1121
ADDRLP4 0
INDIRI4
RETI4
LABELV $1115
endproc BotIntermission 8 0
export BotInLavaOrSlime
proc BotInLavaOrSlime 16 4
line 2244
;2237:}
;2238:
;2239:/*
;2240:==================
;2241:BotInLavaOrSlime
;2242:==================
;2243:*/
;2244:qboolean BotInLavaOrSlime(bot_state_t *bs) {
line 2247
;2245:	vec3_t feet;
;2246:
;2247:	VectorCopy(bs->origin, feet);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
INDIRB
ASGNB 12
line 2248
;2248:	feet[2] -= 23;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1102577664
SUBF4
ASGNF4
line 2249
;2249:	return (trap_AAS_PointContents(feet) & (CONTENTS_LAVA|CONTENTS_SLIME));
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 24
BANDI4
RETI4
LABELV $1123
endproc BotInLavaOrSlime 16 4
lit
align 4
LABELV $1126
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $1127
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCreateWayPoint
code
proc BotCreateWayPoint 32 12
line 2257
;2250:}
;2251:
;2252:/*
;2253:==================
;2254:BotCreateWayPoint
;2255:==================
;2256:*/
;2257:bot_waypoint_t *BotCreateWayPoint(char *name, vec3_t origin, float wait, int areanum) {
line 2259
;2258:	bot_waypoint_t *wp;
;2259:	vec3_t waypointmins = {-8, -8, -8}, waypointmaxs = {8, 8, 8};
ADDRLP4 4
ADDRGP4 $1126
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $1127
INDIRB
ASGNB 12
line 2261
;2260:
;2261:	wp = botai_freewaypoints;
ADDRLP4 0
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2262
;2262:	if ( !wp ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1128
line 2263
;2263:		BotAI_Print( PRT_WARNING, "BotCreateWayPoint: Out of waypoints\n" );
CNSTI4 2
ARGI4
ADDRGP4 $1130
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 2264
;2264:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $1125
JUMPV
LABELV $1128
line 2266
;2265:	}
;2266:	botai_freewaypoints = botai_freewaypoints->next;
ADDRLP4 28
ADDRGP4 botai_freewaypoints
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
line 2268
;2267:
;2268:	Q_strncpyz( wp->name, name, sizeof(wp->name) );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2269
;2269:	VectorCopy(origin, wp->goal.origin);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2270
;2270:	VectorCopy(waypointmins, wp->goal.mins);
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2271
;2271:	VectorCopy(waypointmaxs, wp->goal.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2272
;2272:	wp->goal.areanum = areanum;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 2273
;2273:	wp->wait = wait * 1000;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTF4 1148846080
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 2274
;2274:	wp->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTP4 0
ASGNP4
line 2275
;2275:	wp->prev = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
CNSTP4 0
ASGNP4
line 2276
;2276:	return wp;
ADDRLP4 0
INDIRP4
RETP4
LABELV $1125
endproc BotCreateWayPoint 32 12
export BotFindWayPoint
proc BotFindWayPoint 8 8
line 2284
;2277:}
;2278:
;2279:/*
;2280:==================
;2281:BotFindWayPoint
;2282:==================
;2283:*/
;2284:bot_waypoint_t *BotFindWayPoint(bot_waypoint_t *waypoints, char *name) {
line 2287
;2285:	bot_waypoint_t *wp;
;2286:
;2287:	for (wp = waypoints; wp; wp = wp->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $1135
JUMPV
LABELV $1132
line 2288
;2288:		if (!Q_stricmp(wp->name, name)) return wp;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1136
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $1131
JUMPV
LABELV $1136
line 2289
;2289:	}
LABELV $1133
line 2287
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $1135
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1132
line 2290
;2290:	return NULL;
CNSTP4 0
RETP4
LABELV $1131
endproc BotFindWayPoint 8 8
export BotFreeWaypoints
proc BotFreeWaypoints 4 0
line 2298
;2291:}
;2292:
;2293:/*
;2294:==================
;2295:BotFreeWaypoints
;2296:==================
;2297:*/
;2298:void BotFreeWaypoints(bot_waypoint_t *wp) {
line 2301
;2299:	bot_waypoint_t *nextwp;
;2300:
;2301:	for (; wp; wp = nextwp) {
ADDRGP4 $1142
JUMPV
LABELV $1139
line 2302
;2302:		nextwp = wp->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
line 2303
;2303:		wp->next = botai_freewaypoints;
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2304
;2304:		botai_freewaypoints = wp;
ADDRGP4 botai_freewaypoints
ADDRFP4 0
INDIRP4
ASGNP4
line 2305
;2305:	}
LABELV $1140
line 2301
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $1142
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1139
line 2306
;2306:}
LABELV $1138
endproc BotFreeWaypoints 4 0
export BotInitWaypoints
proc BotInitWaypoints 4 0
line 2313
;2307:
;2308:/*
;2309:==================
;2310:BotInitWaypoints
;2311:==================
;2312:*/
;2313:void BotInitWaypoints(void) {
line 2316
;2314:	int i;
;2315:
;2316:	botai_freewaypoints = NULL;
ADDRGP4 botai_freewaypoints
CNSTP4 0
ASGNP4
line 2317
;2317:	for (i = 0; i < MAX_WAYPOINTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1144
line 2318
;2318:		botai_waypoints[i].next = botai_freewaypoints;
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botai_waypoints+100
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2319
;2319:		botai_freewaypoints = &botai_waypoints[i];
ADDRGP4 botai_freewaypoints
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botai_waypoints
ADDP4
ASGNP4
line 2320
;2320:	}
LABELV $1145
line 2317
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $1144
line 2321
;2321:}
LABELV $1143
endproc BotInitWaypoints 4 0
export TeamPlayIsOn
proc TeamPlayIsOn 8 0
line 2328
;2322:
;2323:/*
;2324:==================
;2325:TeamPlayIsOn
;2326:==================
;2327:*/
;2328:int TeamPlayIsOn(void) {
line 2329
;2329:	if(gametype == GT_SANDBOX || gametype == GT_SINGLE){ return 1; }
ADDRLP4 0
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1152
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $1150
LABELV $1152
CNSTI4 1
RETI4
ADDRGP4 $1149
JUMPV
LABELV $1150
line 2331
;2330:	
;2331:	return ( gametype >= GT_TEAM && g_ffa_gt!=1);
ADDRGP4 gametype
INDIRI4
CNSTI4 4
LTI4 $1154
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
EQI4 $1154
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $1155
JUMPV
LABELV $1154
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1155
ADDRLP4 4
INDIRI4
RETI4
LABELV $1149
endproc TeamPlayIsOn 8 0
export BotAggression
proc BotAggression 40 16
line 2339
;2332:}
;2333:
;2334:/*
;2335:==================
;2336:BotAggression
;2337:==================
;2338:*/
;2339:float BotAggression(bot_state_t *bs) {
line 2340
;2340:        if (trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AGGRESSION, 0, 2) > 1.999) {
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 41
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRLP4 0
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1073733435
LEF4 $1157
line 2342
;2341:                // Mix3r_Durachok: rage, special character (Xen) attacks aggressively on sight
;2342:                return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1157
line 2344
;2343:        }
;2344:        if(gametype == GT_SANDBOX || gametype == GT_SINGLE){
ADDRLP4 4
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1161
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1159
LABELV $1161
line 2345
;2345:            return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1159
line 2348
;2346:        }
;2347:	//if the bot has quad
;2348:	if (bs->inventory[INVENTORY_QUAD]) {
ADDRFP4 0
INDIRP4
CNSTI4 6124
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1162
line 2352
;2349:		//if the bot is not holding the gauntlet or the enemy is really nearby
;2350:		//if (bs->weaponnum != WP_GAUNTLET ||
;2351:		//	bs->inventory[ENEMY_HORIZONTAL_DIST] < 80) {
;2352:			return 70;
CNSTF4 1116471296
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1162
line 2357
;2353:		//}
;2354:	}
;2355:	
;2356:	//if the bot doesn't have a weapon
;2357:	if (bs->weaponnum <= WP_NONE || bs->weaponnum >= WP_NUM_WEAPONS) return 0;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $1166
ADDRLP4 8
INDIRI4
CNSTI4 16
LTI4 $1164
LABELV $1166
CNSTF4 0
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1164
line 2361
;2358:	//if the enemy is located way higher than the bot
;2359://	if (bs->inventory[ENEMY_HEIGHT] > 200) return 0;
;2360:	//if the bot is very low on health
;2361:	if (bs->inventory[INVENTORY_HEALTH] < 20) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
CNSTI4 20
GEI4 $1167
CNSTF4 0
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1167
line 2363
;2362:	//if the bot is low on health
;2363:	if (bs->inventory[INVENTORY_HEALTH] < 10) {
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1169
line 2366
;2364:		//if the bot has insufficient armor
;2365://		if (bs->inventory[INVENTORY_ARMOR] < 40) return 0;
;2366:	return 0;
CNSTF4 0
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1169
line 2369
;2367:	}
;2368:	//if the bot can use the bfg
;2369:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6036
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1171
ADDRLP4 12
INDIRP4
CNSTI4 6084
ADDP4
INDIRI4
CNSTI4 7
LEI4 $1171
line 2370
;2370:			bs->inventory[INVENTORY_BFGAMMO] > 7) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1171
line 2372
;2371:	//if the bot can use the railgun
;2372:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 6024
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1173
ADDRLP4 16
INDIRP4
CNSTI4 6080
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1173
line 2373
;2373:			bs->inventory[INVENTORY_SLUGS] > 5) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1173
line 2375
;2374:	//if the bot can use the lightning gun
;2375:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1175
ADDRLP4 20
INDIRP4
CNSTI4 6072
ADDP4
INDIRI4
CNSTI4 50
LEI4 $1175
line 2376
;2376:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1175
line 2378
;2377:	//if the bot can use the rocketlauncher
;2378:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1177
ADDRLP4 24
INDIRP4
CNSTI4 6076
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1177
line 2379
;2379:			bs->inventory[INVENTORY_ROCKETS] > 5) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1177
line 2381
;2380:	//if the bot can use the plasmagun
;2381:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1179
ADDRLP4 28
INDIRP4
CNSTI4 6068
ADDP4
INDIRI4
CNSTI4 40
LEI4 $1179
line 2382
;2382:			bs->inventory[INVENTORY_CELLS] > 40) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1179
line 2384
;2383:	//if the bot can use the grenade launcher
;2384:	if (bs->inventory[INVENTORY_GRENADELAUNCHER] > 0 &&
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 6012
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1181
ADDRLP4 32
INDIRP4
CNSTI4 6064
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1181
line 2385
;2385:			bs->inventory[INVENTORY_GRENADES] > 10) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1181
line 2387
;2386:	//if the bot can use the shotgun
;2387:	if (bs->inventory[INVENTORY_SHOTGUN] > 0 &&
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 6004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1183
ADDRLP4 36
INDIRP4
CNSTI4 6056
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1183
line 2388
;2388:			bs->inventory[INVENTORY_SHELLS] > 10) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1156
JUMPV
LABELV $1183
line 2390
;2389:	//otherwise the bot is not feeling too good
;2390:	return 100;
CNSTF4 1120403456
RETF4
LABELV $1156
endproc BotAggression 40 16
export BotFeelingBad
proc BotFeelingBad 0 0
line 2398
;2391:}
;2392:
;2393:/*
;2394:==================
;2395:BotFeelingBad
;2396:==================
;2397:*/
;2398:float BotFeelingBad(bot_state_t *bs) {
line 2399
;2399:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1186
line 2400
;2400:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $1185
JUMPV
LABELV $1186
line 2402
;2401:	}
;2402:	if (bs->inventory[INVENTORY_HEALTH] < 5) {
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
CNSTI4 5
GEI4 $1188
line 2403
;2403:		return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $1185
JUMPV
LABELV $1188
line 2405
;2404:	}
;2405:	if (bs->weaponnum == WP_MACHINEGUN) {
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1190
line 2406
;2406:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $1185
JUMPV
LABELV $1190
line 2408
;2407:	}
;2408:	if (bs->inventory[INVENTORY_HEALTH] < 10) {
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1192
line 2409
;2409:		return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $1185
JUMPV
LABELV $1192
line 2411
;2410:	}
;2411:	return 0;
CNSTF4 0
RETF4
LABELV $1185
endproc BotFeelingBad 0 0
export BotWantsToRetreat
proc BotWantsToRetreat 152 8
line 2419
;2412:}
;2413:
;2414:/*
;2415:==================
;2416:BotWantsToRetreat
;2417:==================
;2418:*/
;2419:int BotWantsToRetreat(bot_state_t *bs) {
line 2422
;2420:	aas_entityinfo_t entinfo;
;2421:
;2422:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 140
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 5
EQI4 $1197
ADDRLP4 140
INDIRI4
CNSTI4 10
NEI4 $1195
LABELV $1197
line 2424
;2423:		//always retreat when carrying a CTF flag
;2424:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1196
line 2425
;2425:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1194
JUMPV
line 2426
;2426:	}
LABELV $1195
line 2427
;2427:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1200
line 2429
;2428:		//if carrying the flag then always retreat
;2429:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1201
line 2430
;2430:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1194
JUMPV
line 2431
;2431:	}
LABELV $1200
line 2432
;2432:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $1204
line 2434
;2433:		//the bots should be dedicated to attacking the enemy obelisk
;2434:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1206
line 2435
;2435:			if (bs->enemy != redobelisk.entitynum &&
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1208
ADDRLP4 144
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
EQI4 $1208
line 2436
;2436:						bs->enemy != blueobelisk.entitynum) {
line 2437
;2437:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1208
line 2439
;2438:			}
;2439:		}
LABELV $1206
line 2440
;2440:		if (BotFeelingBad(bs) > 50) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotFeelingBad
CALLF4
ASGNF4
ADDRLP4 144
INDIRF4
CNSTF4 1112014848
LEF4 $1212
line 2441
;2441:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1212
line 2443
;2442:		}
;2443:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1204
line 2445
;2444:	}
;2445:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $1214
line 2447
;2446:		//if carrying cubes then always retreat
;2447:		if (BotHarvesterCarryingCubes(bs)) return qtrue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1216
CNSTI4 1
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1216
line 2448
;2448:	}
LABELV $1214
LABELV $1201
LABELV $1196
line 2450
;2449:	//
;2450:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1218
line 2452
;2451:		//if the enemy is carrying a flag
;2452:		BotEntityInfo(bs->enemy, &entinfo);
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
line 2454
;2453:		// if the enemy is carrying a flag
;2454:		if (EntityCarriesFlag(&entinfo)) return qfalse;
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1220
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1220
line 2457
;2455:#ifdef MISSIONPACK
;2456:		// if the enemy is carrying cubes
;2457:		if (EntityCarriesCubes(&entinfo)) return qfalse;
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1222
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1222
line 2459
;2458:#endif
;2459:	}
LABELV $1218
line 2461
;2460:	//if the bot is getting the flag
;2461:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1224
line 2462
;2462:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1224
line 2464
;2463:	//
;2464:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 144
INDIRF4
CNSTF4 1112014848
GEF4 $1226
line 2465
;2465:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1226
line 2466
;2466:	return qfalse;
CNSTI4 0
RETI4
LABELV $1194
endproc BotWantsToRetreat 152 8
export BotWantsToChase
proc BotWantsToChase 152 8
line 2474
;2467:}
;2468:
;2469:/*
;2470:==================
;2471:BotWantsToChase
;2472:==================
;2473:*/
;2474:int BotWantsToChase(bot_state_t *bs) {
line 2477
;2475:	aas_entityinfo_t entinfo;
;2476:
;2477:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 140
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 5
EQI4 $1231
ADDRLP4 140
INDIRI4
CNSTI4 10
NEI4 $1229
LABELV $1231
line 2479
;2478:		//never chase when carrying a CTF flag
;2479:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1232
line 2480
;2480:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1228
JUMPV
LABELV $1232
line 2482
;2481:		//always chase if the enemy is carrying a flag
;2482:		BotEntityInfo(bs->enemy, &entinfo);
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
line 2483
;2483:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1230
line 2484
;2484:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1228
JUMPV
line 2485
;2485:	}
LABELV $1229
line 2486
;2486:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $1236
line 2488
;2487:		//never chase if carrying the flag
;2488:		if (Bot1FCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 Bot1FCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1238
line 2489
;2489:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1228
JUMPV
LABELV $1238
line 2491
;2490:		//always chase if the enemy is carrying a flag
;2491:		BotEntityInfo(bs->enemy, &entinfo);
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
line 2492
;2492:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1237
line 2493
;2493:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1228
JUMPV
line 2494
;2494:	}
LABELV $1236
line 2495
;2495:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $1242
line 2497
;2496:		//the bots should be dedicated to attacking the enemy obelisk
;2497:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1243
line 2498
;2498:			if (bs->enemy != redobelisk.entitynum &&
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1243
ADDRLP4 144
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
EQI4 $1243
line 2499
;2499:						bs->enemy != blueobelisk.entitynum) {
line 2500
;2500:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1228
JUMPV
line 2502
;2501:			}
;2502:		}
line 2503
;2503:	}
LABELV $1242
line 2504
;2504:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $1250
line 2506
;2505:		//never chase if carrying cubes
;2506:		if (BotHarvesterCarryingCubes(bs)) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotHarvesterCarryingCubes
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1252
CNSTI4 0
RETI4
ADDRGP4 $1228
JUMPV
LABELV $1252
line 2508
;2507:
;2508:		BotEntityInfo(bs->enemy, &entinfo);
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
line 2510
;2509:		// always chase if the enemy is carrying cubes
;2510:		if (EntityCarriesCubes(&entinfo)) return qtrue;
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1254
CNSTI4 1
RETI4
ADDRGP4 $1228
JUMPV
LABELV $1254
line 2511
;2511:	}
LABELV $1250
LABELV $1243
LABELV $1237
LABELV $1230
line 2513
;2512:	//if the bot is getting the flag
;2513:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1256
line 2514
;2514:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1228
JUMPV
LABELV $1256
line 2516
;2515:	//
;2516:	if (BotAggression(bs) > 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 144
INDIRF4
CNSTF4 1112014848
LEF4 $1258
line 2517
;2517:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1228
JUMPV
LABELV $1258
line 2518
;2518:	return qfalse;
CNSTI4 0
RETI4
LABELV $1228
endproc BotWantsToChase 152 8
export BotWantsToHelp
proc BotWantsToHelp 0 0
line 2526
;2519:}
;2520:
;2521:/*
;2522:==================
;2523:BotWantsToHelp
;2524:==================
;2525:*/
;2526:int BotWantsToHelp(bot_state_t *bs) {
line 2527
;2527:	return qtrue;
CNSTI4 1
RETI4
LABELV $1260
endproc BotWantsToHelp 0 0
export BotCanAndWantsToRocketJump
proc BotCanAndWantsToRocketJump 8 16
line 2535
;2528:}
;2529:
;2530:/*
;2531:==================
;2532:BotCanAndWantsToRocketJump
;2533:==================
;2534:*/
;2535:int BotCanAndWantsToRocketJump(bot_state_t *bs) {
line 2539
;2536:	float rocketjumper;
;2537:
;2538:	//if rocket jumping is disabled
;2539:	if (!bot_rocketjump.integer) return qfalse;
ADDRGP4 bot_rocketjump+12
INDIRI4
CNSTI4 0
NEI4 $1262
CNSTI4 0
RETI4
ADDRGP4 $1261
JUMPV
LABELV $1262
line 2541
;2540:	//if no rocket launcher
;2541:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1265
CNSTI4 0
RETI4
ADDRGP4 $1261
JUMPV
LABELV $1265
line 2543
;2542:	//if low on rockets
;2543:	if (bs->inventory[INVENTORY_ROCKETS] < 3) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6076
ADDP4
INDIRI4
CNSTI4 3
GEI4 $1267
CNSTI4 0
RETI4
ADDRGP4 $1261
JUMPV
LABELV $1267
line 2545
;2544:        //Sago: Special rule - always happy to rocket jump in elimination, eCTF end LMS if
;2545:        if ( (g_gametype.integer==GT_ELIMINATION || g_gametype.integer==GT_CTF_ELIMINATION || g_gametype.integer==GT_LMS )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $1276
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $1276
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $1269
LABELV $1276
ADDRGP4 g_elimination_selfdamage+12
INDIRI4
CNSTI4 0
NEI4 $1269
line 2546
;2546:                && g_elimination_selfdamage.integer==0) {
line 2547
;2547:            return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1261
JUMPV
LABELV $1269
line 2552
;2548:        }
;2549:	//never rocket jump with the Quad
;2550://	if (bs->inventory[INVENTORY_QUAD]) return qfalse;
;2551:	//if low on health
;2552:	if (bs->inventory[INVENTORY_HEALTH] < 20) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
CNSTI4 20
GEI4 $1277
CNSTI4 0
RETI4
ADDRGP4 $1261
JUMPV
LABELV $1277
line 2554
;2553:	//if not full health
;2554:	if (bs->inventory[INVENTORY_HEALTH] < 30) {
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
CNSTI4 30
GEI4 $1279
line 2556
;2555:		//if the bot has insufficient armor
;2556:		if (bs->inventory[INVENTORY_ARMOR] < 5) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5988
ADDP4
INDIRI4
CNSTI4 5
GEI4 $1281
CNSTI4 0
RETI4
ADDRGP4 $1261
JUMPV
LABELV $1281
line 2557
;2557:	}
LABELV $1279
line 2558
;2558:	rocketjumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WEAPONJUMPING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 38
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 4
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 2559
;2559:	if (rocketjumper < 0.5) return qfalse;
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
GEF4 $1283
CNSTI4 0
RETI4
ADDRGP4 $1261
JUMPV
LABELV $1283
line 2560
;2560:	return qtrue;
CNSTI4 1
RETI4
LABELV $1261
endproc BotCanAndWantsToRocketJump 8 16
export BotHasPersistantPowerupAndWeapon
proc BotHasPersistantPowerupAndWeapon 32 0
line 2568
;2561:}
;2562:
;2563:/*
;2564:==================
;2565:BotHasPersistantPowerupAndWeapon
;2566:==================
;2567:*/
;2568:int BotHasPersistantPowerupAndWeapon(bot_state_t *bs) {
line 2578
;2569:	// if the bot does not have a persistant powerup
;2570:        //Sago - FIXME - This causes problems if there are no persistant powerups
;2571:/*	if (!bs->inventory[INVENTORY_SCOUT] &&
;2572:		!bs->inventory[INVENTORY_GUARD] &&
;2573:		!bs->inventory[INVENTORY_DOUBLER] &&
;2574:		!bs->inventory[INVENTORY_AMMOREGEN] ) {
;2575:		return qfalse;
;2576:	}*/
;2577:	//if the bot is very low on health
;2578:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
CNSTI4 60
GEI4 $1286
CNSTI4 0
RETI4
ADDRGP4 $1285
JUMPV
LABELV $1286
line 2580
;2579:	//if the bot is low on health
;2580:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
CNSTI4 80
GEI4 $1288
line 2582
;2581:		//if the bot has insufficient armor
;2582:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5988
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1290
CNSTI4 0
RETI4
ADDRGP4 $1285
JUMPV
LABELV $1290
line 2583
;2583:	}
LABELV $1288
line 2585
;2584:	//if the bot can use the bfg
;2585:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6036
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1292
ADDRLP4 0
INDIRP4
CNSTI4 6084
ADDP4
INDIRI4
CNSTI4 7
LEI4 $1292
line 2586
;2586:			bs->inventory[INVENTORY_BFGAMMO] > 7) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1285
JUMPV
LABELV $1292
line 2588
;2587:	//if the bot can use the railgun
;2588:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6024
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1294
ADDRLP4 4
INDIRP4
CNSTI4 6080
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1294
line 2589
;2589:			bs->inventory[INVENTORY_SLUGS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1285
JUMPV
LABELV $1294
line 2591
;2590:	//if the bot can use the lightning gun
;2591:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1296
ADDRLP4 8
INDIRP4
CNSTI4 6072
ADDP4
INDIRI4
CNSTI4 50
LEI4 $1296
line 2592
;2592:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1285
JUMPV
LABELV $1296
line 2594
;2593:	//if the bot can use the rocketlauncher
;2594:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1298
ADDRLP4 12
INDIRP4
CNSTI4 6076
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1298
line 2595
;2595:			bs->inventory[INVENTORY_ROCKETS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1285
JUMPV
LABELV $1298
line 2597
;2596:	//
;2597:	if (bs->inventory[INVENTORY_NAILGUN] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 6044
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1300
ADDRLP4 16
INDIRP4
CNSTI4 6088
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1300
line 2598
;2598:			bs->inventory[INVENTORY_NAILS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1285
JUMPV
LABELV $1300
line 2600
;2599:	//
;2600:	if (bs->inventory[INVENTORY_PROXLAUNCHER] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 6048
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1302
ADDRLP4 20
INDIRP4
CNSTI4 6092
ADDP4
INDIRI4
CNSTI4 5
LEI4 $1302
line 2601
;2601:			bs->inventory[INVENTORY_MINES] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1285
JUMPV
LABELV $1302
line 2603
;2602:	//
;2603:	if (bs->inventory[INVENTORY_CHAINGUN] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 6052
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1304
ADDRLP4 24
INDIRP4
CNSTI4 6096
ADDP4
INDIRI4
CNSTI4 40
LEI4 $1304
line 2604
;2604:			bs->inventory[INVENTORY_BELT] > 40) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1285
JUMPV
LABELV $1304
line 2606
;2605:	//if the bot can use the plasmagun
;2606:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1306
ADDRLP4 28
INDIRP4
CNSTI4 6068
ADDP4
INDIRI4
CNSTI4 20
LEI4 $1306
line 2607
;2607:			bs->inventory[INVENTORY_CELLS] > 20) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1285
JUMPV
LABELV $1306
line 2608
;2608:	return qfalse;
CNSTI4 0
RETI4
LABELV $1285
endproc BotHasPersistantPowerupAndWeapon 32 0
export BotGoCamp
proc BotGoCamp 16 16
line 2616
;2609:}
;2610:
;2611:/*
;2612:==================
;2613:BotGoCamp
;2614:==================
;2615:*/
;2616:void BotGoCamp(bot_state_t *bs, bot_goal_t *goal) {
line 2619
;2617:	float camper;
;2618:
;2619:	bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 10712
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 2621
;2620:	//set message time to zero so bot will NOT show any message
;2621:	bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10844
ADDP4
CNSTF4 0
ASGNF4
line 2623
;2622:	//set the ltg type
;2623:	bs->ltgtype = LTG_CAMP;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 7
ASGNI4
line 2625
;2624:	//set the team goal
;2625:	memcpy(&bs->teamgoal, goal, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2627
;2626:	//get the team goal time
;2627:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 8
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2628
;2628:	if (camper > 0.99) bs->teamgoal_time = FloatTime() + 99999;
ADDRLP4 0
INDIRF4
CNSTF4 1065185444
LEF4 $1309
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1203982208
ADDF4
ASGNF4
ADDRGP4 $1310
JUMPV
LABELV $1309
line 2629
;2629:	else bs->teamgoal_time = FloatTime() + 120 + 180 * camper + random() * 15;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
CNSTF4 1127481344
ADDRLP4 0
INDIRF4
MULF4
ADDF4
CNSTF4 1097859072
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
LABELV $1310
line 2631
;2630:	//set the last time the bot started camping
;2631:	bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10288
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2633
;2632:	//the teammate that requested the camping
;2633:	bs->teammate = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
CNSTI4 0
ASGNI4
line 2635
;2634:	//do NOT type arrive message
;2635:	bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
CNSTF4 1065353216
ASGNF4
line 2636
;2636:}
LABELV $1308
endproc BotGoCamp 16 16
export BotWantsToCamp
proc BotWantsToCamp 172 16
line 2643
;2637:
;2638:/*
;2639:==================
;2640:BotWantsToCamp
;2641:==================
;2642:*/
;2643:int BotWantsToCamp(bot_state_t *bs) {
line 2648
;2644:	float camper;
;2645:	int cs, traveltime, besttraveltime;
;2646:	bot_goal_t goal, bestgoal;
;2647:
;2648:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 128
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 124
ADDRLP4 128
INDIRF4
ASGNF4
line 2649
;2649:	if (camper < 0.1) return qfalse;
ADDRLP4 124
INDIRF4
CNSTF4 1036831949
GEF4 $1312
CNSTI4 0
RETI4
ADDRGP4 $1311
JUMPV
LABELV $1312
line 2651
;2650:	//if the bot has a team goal
;2651:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 1
EQI4 $1322
ADDRLP4 132
INDIRI4
CNSTI4 2
EQI4 $1322
ADDRLP4 132
INDIRI4
CNSTI4 3
EQI4 $1322
ADDRLP4 132
INDIRI4
CNSTI4 4
EQI4 $1322
ADDRLP4 132
INDIRI4
CNSTI4 5
EQI4 $1322
ADDRLP4 132
INDIRI4
CNSTI4 7
EQI4 $1322
ADDRLP4 132
INDIRI4
CNSTI4 8
EQI4 $1322
ADDRLP4 132
INDIRI4
CNSTI4 9
NEI4 $1314
LABELV $1322
line 2658
;2652:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;2653:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;2654:			bs->ltgtype == LTG_GETFLAG ||
;2655:			bs->ltgtype == LTG_RUSHBASE ||
;2656:			bs->ltgtype == LTG_CAMP ||
;2657:			bs->ltgtype == LTG_CAMPORDER ||
;2658:			bs->ltgtype == LTG_PATROL) {
line 2659
;2659:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1311
JUMPV
LABELV $1314
line 2662
;2660:	}
;2661:	//if camped recently
;2662:	if (bs->camp_time > FloatTime() - 60 + 300 * (1-camper)) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10288
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
SUBF4
CNSTF4 1133903872
CNSTF4 1065353216
ADDRLP4 124
INDIRF4
SUBF4
MULF4
ADDF4
LEF4 $1323
CNSTI4 0
RETI4
ADDRGP4 $1311
JUMPV
LABELV $1323
line 2664
;2663:	//
;2664:	if (random() > camper) {
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 124
INDIRF4
LEF4 $1325
line 2665
;2665:		bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10288
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2666
;2666:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1311
JUMPV
LABELV $1325
line 2669
;2667:	}
;2668:	//if the bot isn't healthy anough
;2669:	if (BotAggression(bs) < 50) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $1327
CNSTI4 0
RETI4
ADDRGP4 $1311
JUMPV
LABELV $1327
line 2671
;2670:	//the bot should have at least have the rocket launcher, the railgun or the bfg10k with some ammo
;2671:	if ((bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0 || bs->inventory[INVENTORY_ROCKETS] < 10) &&
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1331
ADDRLP4 144
INDIRP4
CNSTI4 6076
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1329
LABELV $1331
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 6024
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1332
ADDRLP4 148
INDIRP4
CNSTI4 6080
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1329
LABELV $1332
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 6036
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1333
ADDRLP4 152
INDIRP4
CNSTI4 6084
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1329
LABELV $1333
line 2673
;2672:		(bs->inventory[INVENTORY_RAILGUN] <= 0 || bs->inventory[INVENTORY_SLUGS] < 10) &&
;2673:		(bs->inventory[INVENTORY_BFG10K] <= 0 || bs->inventory[INVENTORY_BFGAMMO] < 10)) {
line 2674
;2674:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1311
JUMPV
LABELV $1329
line 2677
;2675:	}
;2676:	//find the closest camp spot
;2677:	besttraveltime = 99999;
ADDRLP4 64
CNSTI4 99999
ASGNI4
line 2678
;2678:	for (cs = trap_BotGetNextCampSpotGoal(0, &goal); cs; cs = trap_BotGetNextCampSpotGoal(cs, &goal)) {
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 156
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 156
INDIRI4
ASGNI4
ADDRGP4 $1337
JUMPV
LABELV $1334
line 2679
;2679:		traveltime = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal.areanum, TFL_DEFAULT);
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 8+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 164
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 164
INDIRI4
ASGNI4
line 2680
;2680:		if (traveltime && traveltime < besttraveltime) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1339
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $1339
line 2681
;2681:			besttraveltime = traveltime;
ADDRLP4 64
ADDRLP4 0
INDIRI4
ASGNI4
line 2682
;2682:			memcpy(&bestgoal, &goal, sizeof(bot_goal_t));
ADDRLP4 68
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2683
;2683:		}
LABELV $1339
line 2684
;2684:	}
LABELV $1335
line 2678
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 160
INDIRI4
ASGNI4
LABELV $1337
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1334
line 2685
;2685:	if (besttraveltime > 150) return qfalse;
ADDRLP4 64
INDIRI4
CNSTI4 150
LEI4 $1341
CNSTI4 0
RETI4
ADDRGP4 $1311
JUMPV
LABELV $1341
line 2687
;2686:	//ok found a camp spot, go camp there
;2687:	BotGoCamp(bs, &bestgoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 BotGoCamp
CALLV
pop
line 2688
;2688:	bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 0
ASGNI4
line 2690
;2689:	//
;2690:	return qtrue;
CNSTI4 1
RETI4
LABELV $1311
endproc BotWantsToCamp 172 16
export BotDontAvoid
proc BotDontAvoid 68 12
line 2698
;2691:}
;2692:
;2693:/*
;2694:==================
;2695:BotDontAvoid
;2696:==================
;2697:*/
;2698:void BotDontAvoid(bot_state_t *bs, char *itemname) {
line 2702
;2699:	bot_goal_t goal;
;2700:	int num;
;2701:
;2702:	num = trap_BotGetLevelItemGoal(-1, itemname, &goal);
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 60
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
ADDRGP4 $1345
JUMPV
LABELV $1344
line 2703
;2703:	while(num >= 0) {
line 2704
;2704:		trap_BotRemoveFromAvoidGoals(bs->gs, goal.number);
ADDRFP4 0
INDIRP4
CNSTI4 10632
ADDP4
INDIRI4
ARGI4
ADDRLP4 4+44
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveFromAvoidGoals
CALLV
pop
line 2705
;2705:		num = trap_BotGetLevelItemGoal(num, itemname, &goal);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 64
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 64
INDIRI4
ASGNI4
line 2706
;2706:	}
LABELV $1345
line 2703
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1344
line 2707
;2707:}
LABELV $1343
endproc BotDontAvoid 68 12
export BotGoForPowerups
proc BotGoForPowerups 0 8
line 2714
;2708:
;2709:/*
;2710:==================
;2711:BotGoForPowerups
;2712:==================
;2713:*/
;2714:void BotGoForPowerups(bot_state_t *bs) {
line 2717
;2715:
;2716:	//don't avoid any of the powerups anymore
;2717:	BotDontAvoid(bs, "Quad Damage");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1349
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2718
;2718:	BotDontAvoid(bs, "Regeneration");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1350
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2719
;2719:	BotDontAvoid(bs, "Battle Suit");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1351
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2720
;2720:	BotDontAvoid(bs, "Speed");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1352
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2721
;2721:	BotDontAvoid(bs, "Invisibility");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1353
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2725
;2722:	//BotDontAvoid(bs, "Flight");
;2723:	//reset the long term goal time so the bot will go for the powerup
;2724:	//NOTE: the long term goal type doesn't change
;2725:	bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
CNSTF4 0
ASGNF4
line 2726
;2726:}
LABELV $1348
endproc BotGoForPowerups 0 8
export BotRoamGoal
proc BotRoamGoal 180 28
line 2733
;2727:
;2728:/*
;2729:==================
;2730:BotRoamGoal
;2731:==================
;2732:*/
;2733:void BotRoamGoal(bot_state_t *bs, vec3_t goal) {
line 2739
;2734:	int pc, i;
;2735:	float len, rnd;
;2736:	vec3_t dir, bestorg, belowbestorg;
;2737:	bsp_trace_t trace;
;2738:
;2739:	for (i = 0; i < 10; i++) {
ADDRLP4 116
CNSTI4 0
ASGNI4
LABELV $1355
line 2741
;2740:		//start at the bot origin
;2741:		VectorCopy(bs->origin, bestorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
INDIRB
ASGNB 12
line 2742
;2742:		rnd = random();
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 2743
;2743:		if (rnd > 0.25) {
ADDRLP4 112
INDIRF4
CNSTF4 1048576000
LEF4 $1359
line 2745
;2744:			//add a random value to the x-coordinate
;2745:			if (random() < 0.5) bestorg[0] -= 800 * random() + 100;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $1361
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1145569280
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $1362
JUMPV
LABELV $1361
line 2746
;2746:			else bestorg[0] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1145569280
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $1362
line 2747
;2747:		}
LABELV $1359
line 2748
;2748:		if (rnd < 0.75) {
ADDRLP4 112
INDIRF4
CNSTF4 1061158912
GEF4 $1363
line 2750
;2749:			//add a random value to the y-coordinate
;2750:			if (random() < 0.5) bestorg[1] -= 800 * random() + 100;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $1365
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1145569280
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $1366
JUMPV
LABELV $1365
line 2751
;2751:			else bestorg[1] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1145569280
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $1366
line 2752
;2752:		}
LABELV $1363
line 2754
;2753:		//add a random value to the z-coordinate (NOTE: 48 = maxjump?)
;2754:		bestorg[2] += 2 * 48 * crandom();
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1119879168
CNSTF4 1073741824
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 2756
;2755:		//trace a line from the origin to the roam target
;2756:		BotAI_Trace(&trace, bs->origin, NULL, NULL, bestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2758
;2757:		//direction and length towards the roam target
;2758:		VectorSubtract(trace.endpos, bs->origin, dir);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24+12
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+12+4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2759
;2759:		len = VectorNormalize(dir);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 156
INDIRF4
ASGNF4
line 2761
;2760:		//if the roam target is far away anough
;2761:		if (len > 200) {
ADDRLP4 108
INDIRF4
CNSTF4 1128792064
LEF4 $1377
line 2763
;2762:			//the roam target is in the given direction before walls
;2763:			VectorScale(dir, len * trace.fraction - 40, dir);
ADDRLP4 164
CNSTF4 1109393408
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDRLP4 164
INDIRF4
SUBF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDRLP4 164
INDIRF4
SUBF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
line 2764
;2764:			VectorAdd(bs->origin, dir, bestorg);
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 168
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 168
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2766
;2765:			//get the coordinates of the floor below the roam target
;2766:			belowbestorg[0] = bestorg[0];
ADDRLP4 120
ADDRLP4 12
INDIRF4
ASGNF4
line 2767
;2767:			belowbestorg[1] = bestorg[1];
ADDRLP4 120+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2768
;2768:			belowbestorg[2] = bestorg[2] - 800;
ADDRLP4 120+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1145569280
SUBF4
ASGNF4
line 2769
;2769:			BotAI_Trace(&trace, bestorg, NULL, NULL, belowbestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 172
CNSTP4 0
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2771
;2770:			//
;2771:			if (!trace.startsolid) {
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $1394
line 2772
;2772:				trace.endpos[2]++;
ADDRLP4 24+12+8
ADDRLP4 24+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2773
;2773:				pc = trap_PointContents(trace.endpos, bs->entitynum);
ADDRLP4 24+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 176
INDIRI4
ASGNI4
line 2774
;2774:				if (!(pc & (CONTENTS_LAVA | CONTENTS_SLIME))) {
ADDRLP4 132
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
NEI4 $1400
line 2775
;2775:					VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2776
;2776:					return;
ADDRGP4 $1354
JUMPV
LABELV $1400
line 2778
;2777:				}
;2778:			}
LABELV $1394
line 2779
;2779:		}
LABELV $1377
line 2780
;2780:	}
LABELV $1356
line 2739
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 10
LTI4 $1355
line 2781
;2781:	VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2782
;2782:}
LABELV $1354
endproc BotRoamGoal 180 28
lit
align 4
LABELV $1404
byte 4 0
byte 4 0
byte 4 1065353216
export BotAttackMove
code
proc BotAttackMove 396 16
line 2789
;2783:
;2784:/*
;2785:==================
;2786:BotAttackMove
;2787:==================
;2788:*/
;2789:bot_moveresult_t BotAttackMove(bot_state_t *bs, int tfl) {
line 2793
;2790:	int movetype, i, attackentity;
;2791:	float attack_skill, jumper, croucher, dist, strafechange_time;
;2792:	float attack_dist, attack_range;
;2793:	vec3_t forward, backward, sideward, hordir, up = {0, 0, 1};
ADDRLP4 56
ADDRGP4 $1404
INDIRB
ASGNB 12
line 2799
;2794:	aas_entityinfo_t entinfo;
;2795:	bot_moveresult_t moveresult;
;2796:	bot_goal_t goal;
;2797:
;2798:	//remove force walk flag so bot can run again if this is allowed
;2799:	if (bs->cur_ps.pm_flags & PMF_ATTACK_RUN)
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $1405
line 2800
;2800:		bs->cur_ps.pm_flags &= ~PMF_FORCE_WALK;
ADDRLP4 348
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 348
INDIRP4
ADDRLP4 348
INDIRP4
INDIRI4
CNSTI4 -65537
BANDI4
ASGNI4
LABELV $1405
line 2802
;2801:
;2802:	attackentity = bs->enemy;
ADDRLP4 336
ADDRFP4 4
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ASGNI4
line 2804
;2803:	//
;2804:        if (bs->cur_ps.weapon == WP_GAUNTLET) {
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1407
line 2805
;2805:		attack_dist = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 2806
;2806:		attack_range = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 2807
;2807:                jumper = 0.5; // Mix3r_Durachok: less jumpy on the ring
ADDRLP4 332
CNSTF4 1056964608
ASGNF4
line 2808
;2808:                attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AGGRESSION, 0, 3);
ADDRFP4 4
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 41
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRLP4 352
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 132
ADDRLP4 352
INDIRF4
ASGNF4
line 2809
;2809:                if (attack_skill > 1.999) {
ADDRLP4 132
INDIRF4
CNSTF4 1073733435
LEF4 $1408
line 2810
;2810:                        level.clients[bs->client].accurateCount = -3;
CNSTI4 2324
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1292
ADDP4
CNSTI4 -3
ASGNI4
line 2811
;2811:                }
line 2812
;2812:	} else {
ADDRGP4 $1408
JUMPV
LABELV $1407
line 2813
;2813:		attack_dist = IDEAL_ATTACKDIST;
ADDRLP4 68
CNSTF4 1124859904
ASGNF4
line 2814
;2814:		attack_range = 40;
ADDRLP4 72
CNSTF4 1109393408
ASGNF4
line 2815
;2815:                jumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_JUMPER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 37
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 352
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 332
ADDRLP4 352
INDIRF4
ASGNF4
line 2816
;2816:	}
LABELV $1408
line 2819
;2817:
;2818:	//if (bs->attackchase_time > FloatTime()) {
;2819:        if (level.clients[bs->client].accurateCount < -2) {
CNSTI4 2324
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 -2
GEI4 $1411
line 2821
;2820:		//create the chase goal
;2821:		goal.entitynum = attackentity;
ADDRLP4 136+40
ADDRLP4 336
INDIRI4
ASGNI4
line 2822
;2822:		goal.areanum = bs->lastenemyareanum;
ADDRLP4 136+12
ADDRFP4 4
INDIRP4
CNSTI4 10648
ADDP4
INDIRI4
ASGNI4
line 2823
;2823:		VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 10652
ADDP4
INDIRB
ASGNB 12
line 2824
;2824:		VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 136+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+8
CNSTF4 3238002688
ASGNF4
line 2825
;2825:		VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 136+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+8
CNSTF4 1090519040
ASGNF4
line 2827
;2826:		//initialize the movement state
;2827:		BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2829
;2828:		//move towards the goal
;2829:		trap_BotMoveToGoal(&moveresult, bs->ms, &goal, tfl);
ADDRLP4 80
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2830
;2830:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1402
JUMPV
LABELV $1411
line 2833
;2831:	}
;2832:	//
;2833:	memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 80
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2835
;2834:	//
;2835:	attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 4
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
ADDRLP4 132
ADDRLP4 352
INDIRF4
ASGNF4
line 2836
;2836:	jumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_JUMPER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 37
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 356
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 332
ADDRLP4 356
INDIRF4
ASGNF4
line 2837
;2837:	croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 4
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
ADDRLP4 360
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 344
ADDRLP4 360
INDIRF4
ASGNF4
line 2838
;2838:if(bs->spbot){
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1425
line 2839
;2839:if(!NpcFactionProp(bs, NP_JUMP, 0)){
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 7
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 364
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
NEI4 $1427
line 2840
;2840:    jumper = 0;
ADDRLP4 332
CNSTF4 0
ASGNF4
line 2841
;2841:	croucher = 0;
ADDRLP4 344
CNSTF4 0
ASGNF4
line 2842
;2842:}}
LABELV $1427
LABELV $1425
line 2844
;2843:	//if the bot is really stupid
;2844:	if (attack_skill < 0.2) return moveresult;
ADDRLP4 132
INDIRF4
CNSTF4 1045220557
GEF4 $1429
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1402
JUMPV
LABELV $1429
line 2846
;2845:	//initialize the movement state
;2846:	BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2848
;2847:	//get the enemy entity info
;2848:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 336
INDIRI4
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2850
;2849:	//direction towards the enemy
;2850:	VectorSubtract(entinfo.origin, bs->origin, forward);
ADDRLP4 364
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 192+24
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 192+24+4
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 192+24+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2852
;2851:	//the distance towards the enemy
;2852:	dist = VectorNormalize(forward);
ADDRLP4 24
ARGP4
ADDRLP4 368
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 76
ADDRLP4 368
INDIRF4
ASGNF4
line 2853
;2853:	VectorNegate(forward, backward);
ADDRLP4 36
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 24+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 24+8
INDIRF4
NEGF4
ASGNF4
line 2855
;2854:	//walk, crouch or jump
;2855:	movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2857
;2856:	//
;2857:	if (bs->attackcrouch_time < FloatTime() - 1) {
ADDRFP4 4
INDIRP4
CNSTI4 10224
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1442
line 2858
;2858:		if (random() < jumper) {
ADDRLP4 372
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 332
INDIRF4
GEF4 $1444
line 2859
;2859:			movetype = MOVE_JUMP;
ADDRLP4 52
CNSTI4 4
ASGNI4
line 2860
;2860:		}
ADDRGP4 $1445
JUMPV
LABELV $1444
line 2862
;2861:		//wait at least one second before crouching again
;2862:		else if (bs->attackcrouch_time < FloatTime() - 1 && random() < croucher) {
ADDRFP4 4
INDIRP4
CNSTI4 10224
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1446
ADDRLP4 376
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 344
INDIRF4
GEF4 $1446
line 2863
;2863:			bs->attackcrouch_time = FloatTime() + croucher * 5;
ADDRFP4 4
INDIRP4
CNSTI4 10224
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDRLP4 344
INDIRF4
MULF4
ADDF4
ASGNF4
line 2864
;2864:		}
LABELV $1446
LABELV $1445
line 2865
;2865:	}
LABELV $1442
line 2866
;2866:	if (bs->attackcrouch_time > FloatTime()) movetype = MOVE_CROUCH;
ADDRFP4 4
INDIRP4
CNSTI4 10224
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1448
ADDRLP4 52
CNSTI4 2
ASGNI4
LABELV $1448
line 2868
;2867:	//if the bot should jump
;2868:	if (movetype == MOVE_JUMP) {
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $1450
line 2870
;2869:		//if jumped last frame
;2870:		if (bs->attackjump_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 10232
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1452
line 2871
;2871:			movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2872
;2872:		}
ADDRGP4 $1453
JUMPV
LABELV $1452
line 2873
;2873:		else {
line 2874
;2874:			bs->attackjump_time = FloatTime() + 1;
ADDRFP4 4
INDIRP4
CNSTI4 10232
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2875
;2875:		}
LABELV $1453
line 2876
;2876:	}
LABELV $1450
line 2877
;2877:	if (bs->cur_ps.weapon == WP_GAUNTLET) {
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1454
line 2878
;2878:		attack_dist = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 2879
;2879:		attack_range = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 2880
;2880:	}
ADDRGP4 $1455
JUMPV
LABELV $1454
line 2881
;2881:	else {
line 2882
;2882:		attack_dist = IDEAL_ATTACKDIST;
ADDRLP4 68
CNSTF4 1124859904
ASGNF4
line 2883
;2883:		attack_range = 40;
ADDRLP4 72
CNSTF4 1109393408
ASGNF4
line 2884
;2884:	}
LABELV $1455
line 2886
;2885:	//if the bot is stupid
;2886:	if (attack_skill <= 0.4) {
ADDRLP4 132
INDIRF4
CNSTF4 1053609165
GTF4 $1456
line 2888
;2887:		//just walk to or away from the enemy
;2888:		if (dist > attack_dist + attack_range) {
ADDRLP4 76
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
LEF4 $1458
line 2889
;2889:			if (trap_BotMoveInDirection(bs->ms, forward, 400, movetype)) return moveresult;
ADDRFP4 4
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 372
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $1460
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1402
JUMPV
LABELV $1460
line 2890
;2890:		}
LABELV $1458
line 2891
;2891:		if (dist < attack_dist - attack_range) {
ADDRLP4 76
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
GEF4 $1462
line 2892
;2892:			if (trap_BotMoveInDirection(bs->ms, backward, 400, movetype)) return moveresult;
ADDRFP4 4
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 372
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $1464
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1402
JUMPV
LABELV $1464
line 2893
;2893:		}
LABELV $1462
line 2894
;2894:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1402
JUMPV
LABELV $1456
line 2897
;2895:	}
;2896:	//increase the strafe time
;2897:	bs->attackstrafe_time += bs->thinktime;
ADDRLP4 372
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 376
ADDRLP4 372
INDIRP4
CNSTI4 10220
ADDP4
ASGNP4
ADDRLP4 376
INDIRP4
ADDRLP4 376
INDIRP4
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 5936
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2899
;2898:	//get the strafe change time
;2899:	strafechange_time = 0.4 + (1 - attack_skill) * 0.2;
ADDRLP4 340
CNSTF4 1045220557
CNSTF4 1065353216
ADDRLP4 132
INDIRF4
SUBF4
MULF4
CNSTF4 1053609165
ADDF4
ASGNF4
line 2900
;2900:	if (attack_skill > 0.7) strafechange_time += crandom() * 0.2;
ADDRLP4 132
INDIRF4
CNSTF4 1060320051
LEF4 $1466
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 340
ADDRLP4 340
INDIRF4
CNSTF4 1045220557
CNSTF4 1073741824
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
LABELV $1466
line 2902
;2901:	//if the strafe direction should be changed
;2902:	if (bs->attackstrafe_time > strafechange_time) {
ADDRFP4 4
INDIRP4
CNSTI4 10220
ADDP4
INDIRF4
ADDRLP4 340
INDIRF4
LEF4 $1468
line 2904
;2903:		//some magic number :)
;2904:		if (random() > 0.935) {
ADDRLP4 384
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1064262697
LEF4 $1470
line 2906
;2905:			//flip the strafe direction
;2906:			bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 388
ADDRFP4 4
INDIRP4
CNSTI4 10084
ADDP4
ASGNP4
ADDRLP4 388
INDIRP4
ADDRLP4 388
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2907
;2907:			bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 10220
ADDP4
CNSTF4 0
ASGNF4
line 2908
;2908:		}
LABELV $1470
line 2909
;2909:	}
LABELV $1468
line 2911
;2910:	//
;2911:	for (i = 0; i < 2; i++) {
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $1472
line 2912
;2912:		hordir[0] = forward[0];
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 2913
;2913:		hordir[1] = forward[1];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ASGNF4
line 2914
;2914:		hordir[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2915
;2915:		VectorNormalize(hordir);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2917
;2916:		//get the sideward vector
;2917:		CrossProduct(hordir, up, sideward);
ADDRLP4 12
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2919
;2918:		//reverse the vector depending on the strafe direction
;2919:		if (bs->flags & BFL_STRAFERIGHT) VectorNegate(sideward, sideward);
ADDRFP4 4
INDIRP4
CNSTI4 10084
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1479
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
NEGF4
ASGNF4
LABELV $1479
line 2921
;2920:		//randomly go back a little
;2921:		if (random() > 0.9) {
ADDRLP4 384
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1063675494
LEF4 $1485
line 2922
;2922:			VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2923
;2923:		}
ADDRGP4 $1486
JUMPV
LABELV $1485
line 2924
;2924:		else {
line 2926
;2925:			//walk forward or backward to get at the ideal attack distance
;2926:			if (dist > attack_dist + attack_range) {
ADDRLP4 76
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
LEF4 $1493
line 2927
;2927:				VectorAdd(sideward, forward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 2928
;2928:			}
ADDRGP4 $1494
JUMPV
LABELV $1493
line 2929
;2929:			else if (dist < attack_dist - attack_range) {
ADDRLP4 76
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
GEF4 $1501
line 2930
;2930:				VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2931
;2931:			}
LABELV $1501
LABELV $1494
line 2932
;2932:		}
LABELV $1486
line 2934
;2933:		//perform the movement
;2934:		if (trap_BotMoveInDirection(bs->ms, sideward, 400, movetype))
ADDRFP4 4
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $1509
line 2935
;2935:			return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $1402
JUMPV
LABELV $1509
line 2937
;2936:		//movement failed, flip the strafe direction
;2937:		bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 392
ADDRFP4 4
INDIRP4
CNSTI4 10084
ADDP4
ASGNP4
ADDRLP4 392
INDIRP4
ADDRLP4 392
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2938
;2938:		bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 10220
ADDP4
CNSTF4 0
ASGNF4
line 2939
;2939:	}
LABELV $1473
line 2911
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 2
LTI4 $1472
line 2942
;2940:	//bot couldn't do any usefull movement
;2941://	bs->attackchase_time = AAS_Time() + 6;
;2942:	return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
LABELV $1402
endproc BotAttackMove 396 16
export BotSameTeam
proc BotSameTeam 24 0
line 2950
;2943:}
;2944:
;2945:/*
;2946:==================
;2947:BotSameTeam
;2948:==================
;2949:*/
;2950:int BotSameTeam(bot_state_t *bs, int entnum) {
line 2951
;2951:	if(gametype == GT_SANDBOX || gametype == GT_SINGLE){
ADDRLP4 0
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1514
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $1512
LABELV $1514
line 2952
;2952:	if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1515
line 2953
;2953:		return 1; 
CNSTI4 1
RETI4
ADDRGP4 $1511
JUMPV
LABELV $1515
line 2955
;2954:	}
;2955:	}
LABELV $1512
line 2956
;2956:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1519
ADDRLP4 4
INDIRI4
CNSTI4 256
LTI4 $1517
LABELV $1519
line 2958
;2957:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2958:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1511
JUMPV
LABELV $1517
line 2960
;2959:	}
;2960:	if (entnum < 0 || entnum >= MAX_CLIENTS) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $1522
ADDRLP4 8
INDIRI4
CNSTI4 256
LTI4 $1520
LABELV $1522
line 2962
;2961:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2962:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1511
JUMPV
LABELV $1520
line 2964
;2963:	}
;2964:	if ( gametype >= GT_TEAM && g_ffa_gt!=1) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
LTI4 $1523
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
EQI4 $1523
line 2968
;2965:                /*Sago: I don't know why they decided to check the configstring instead of the real value.
;2966:                 For some reason bots sometimes gets a wrong config string when chaning gametypes.
;2967:                 Now we check the real value: */
;2968:                if(level.clients[bs->client].sess.sessionTeam==level.clients[entnum].sess.sessionTeam) return qtrue;
ADDRLP4 12
CNSTI4 2324
ASGNI4
ADDRLP4 16
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 1032
ASGNI4
ADDRLP4 12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
NEI4 $1525
CNSTI4 1
RETI4
ADDRGP4 $1511
JUMPV
LABELV $1525
line 2969
;2969:	}
LABELV $1523
line 2970
;2970:	return qfalse;
CNSTI4 0
RETI4
LABELV $1511
endproc BotSameTeam 24 0
export InFieldOfVision
proc InFieldOfVision 24 4
line 2979
;2971:}
;2972:
;2973:/*
;2974:==================
;2975:InFieldOfVision
;2976:==================
;2977:*/
;2978:qboolean InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles)
;2979:{
line 2983
;2980:	int i;
;2981:	float diff, angle;
;2982:
;2983:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1528
line 2984
;2984:		angle = AngleMod(viewangles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ASGNF4
line 2985
;2985:		angles[i] = AngleMod(angles[i]);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
line 2986
;2986:		diff = angles[i] - angle;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 2987
;2987:		if (angles[i] > angle) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $1532
line 2988
;2988:			if (diff > 180.0) diff -= 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $1533
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 2989
;2989:		}
ADDRGP4 $1533
JUMPV
LABELV $1532
line 2990
;2990:		else {
line 2991
;2991:			if (diff < -180.0) diff += 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $1536
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $1536
line 2992
;2992:		}
LABELV $1533
line 2993
;2993:		if (diff > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $1538
line 2994
;2994:			if (diff > fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
LEF4 $1539
CNSTI4 0
RETI4
ADDRGP4 $1527
JUMPV
line 2995
;2995:		}
LABELV $1538
line 2996
;2996:		else {
line 2997
;2997:			if (diff < -fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
NEGF4
MULF4
GEF4 $1542
CNSTI4 0
RETI4
ADDRGP4 $1527
JUMPV
LABELV $1542
line 2998
;2998:		}
LABELV $1539
line 2999
;2999:	}
LABELV $1529
line 2983
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $1528
line 3000
;3000:	return qtrue;
CNSTI4 1
RETI4
LABELV $1527
endproc InFieldOfVision 24 4
export BotEntityVisible
proc BotEntityVisible 376 28
line 3010
;3001:}
;3002:
;3003:/*
;3004:==================
;3005:BotEntityVisible
;3006:
;3007:returns visibility in the range [0, 1] taking fog and water surfaces into account
;3008:==================
;3009:*/
;3010:float BotEntityVisible(int viewer, vec3_t eye, vec3_t viewangles, float fov, int ent) {
line 3018
;3011:	int i, contents_mask, passent, hitent, infog, inwater, otherinfog, pc;
;3012:	float squaredfogdist, waterfactor, vis, bestvis;
;3013:	bsp_trace_t trace;
;3014:	aas_entityinfo_t entinfo;
;3015:	vec3_t dir, entangles, start, end, middle;
;3016:
;3017:	//calculate middle of bounding box
;3018:	BotEntityInfo(ent, &entinfo);
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3019
;3019:	VectorAdd(entinfo.mins, entinfo.maxs, middle);
ADDRLP4 84
ADDRLP4 148+72
INDIRF4
ADDRLP4 148+84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+72+4
INDIRF4
ADDRLP4 148+84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+72+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDF4
ASGNF4
line 3020
;3020:	VectorScale(middle, 0.5, middle);
ADDRLP4 332
CNSTF4 1056964608
ASGNF4
ADDRLP4 84
ADDRLP4 332
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 332
INDIRF4
ADDRLP4 84+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 84+8
CNSTF4 1056964608
ADDRLP4 84+8
INDIRF4
MULF4
ASGNF4
line 3021
;3021:	VectorAdd(entinfo.origin, middle, middle);
ADDRLP4 84
ADDRLP4 148+24
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+24+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+24+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 3023
;3022:	//check if entity is within field of vision
;3023:	VectorSubtract(middle, eye, dir);
ADDRLP4 336
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 84
INDIRF4
ADDRLP4 336
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 336
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 84+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3024
;3024:	vectoangles(dir, entangles);
ADDRLP4 136
ARGP4
ADDRLP4 320
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3025
;3025:	if (!InFieldOfVision(viewangles, fov, entangles)) return 0;
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 320
ARGP4
ADDRLP4 340
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
NEI4 $1574
CNSTF4 0
RETF4
ADDRGP4 $1544
JUMPV
LABELV $1574
line 3027
;3026:	//
;3027:	pc = trap_AAS_PointContents(eye);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 316
ADDRLP4 344
INDIRI4
ASGNI4
line 3028
;3028:	infog = (pc & CONTENTS_FOG);
ADDRLP4 312
ADDRLP4 316
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 3029
;3029:	inwater = (pc & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER));
ADDRLP4 308
ADDRLP4 316
INDIRI4
CNSTI4 56
BANDI4
ASGNI4
line 3031
;3030:	//
;3031:	bestvis = 0;
ADDRLP4 296
CNSTF4 0
ASGNF4
line 3032
;3032:	for (i = 0; i < 3; i++) {
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $1576
line 3036
;3033:		//if the point is not in potential visible sight
;3034:		//if (!AAS_inPVS(eye, middle)) continue;
;3035:		//
;3036:		contents_mask = CONTENTS_SOLID|CONTENTS_PLAYERCLIP;
ADDRLP4 96
CNSTI4 65537
ASGNI4
line 3037
;3037:		passent = viewer;
ADDRLP4 116
ADDRFP4 0
INDIRI4
ASGNI4
line 3038
;3038:		hitent = ent;
ADDRLP4 132
ADDRFP4 16
INDIRI4
ASGNI4
line 3039
;3039:		VectorCopy(eye, start);
ADDRLP4 120
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 3040
;3040:		VectorCopy(middle, end);
ADDRLP4 104
ADDRLP4 84
INDIRB
ASGNB 12
line 3042
;3041:		//if the entity is in water, lava or slime
;3042:		if (trap_AAS_PointContents(middle) & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 84
ARGP4
ADDRLP4 348
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $1580
line 3043
;3043:			contents_mask |= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BORI4
ASGNI4
line 3044
;3044:		}
LABELV $1580
line 3046
;3045:		//if eye is in water, lava or slime
;3046:		if (inwater) {
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $1582
line 3047
;3047:			if (!(contents_mask & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))) {
ADDRLP4 96
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $1584
line 3048
;3048:				passent = ent;
ADDRLP4 116
ADDRFP4 16
INDIRI4
ASGNI4
line 3049
;3049:				hitent = viewer;
ADDRLP4 132
ADDRFP4 0
INDIRI4
ASGNI4
line 3050
;3050:				VectorCopy(middle, start);
ADDRLP4 120
ADDRLP4 84
INDIRB
ASGNB 12
line 3051
;3051:				VectorCopy(eye, end);
ADDRLP4 104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 3052
;3052:			}
LABELV $1584
line 3053
;3053:			contents_mask ^= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BXORI4
ASGNI4
line 3054
;3054:		}
LABELV $1582
line 3056
;3055:		//trace from start to end
;3056:		BotAI_Trace(&trace, start, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 352
CNSTP4 0
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3058
;3057:		//if water was hit
;3058:		waterfactor = 1.0;
ADDRLP4 288
CNSTF4 1065353216
ASGNF4
line 3059
;3059:		if (trace.contents & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 0+76
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $1586
line 3061
;3060:			//if the water surface is translucent
;3061:			if (1) {
line 3063
;3062:				//trace through the water
;3063:				contents_mask &= ~(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 -57
BANDI4
ASGNI4
line 3064
;3064:				BotAI_Trace(&trace, trace.endpos, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 356
CNSTP4 0
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3065
;3065:				waterfactor = 0.5;
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
line 3066
;3066:			}
LABELV $1589
line 3067
;3067:		}
LABELV $1586
line 3069
;3068:		//if a full trace or the hitent was hit
;3069:		if (trace.fraction >= 1 || trace.ent == hitent) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $1596
ADDRLP4 0+80
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $1592
LABELV $1596
line 3072
;3070:			//check for fog, assuming there's only one fog brush where
;3071:			//either the viewer or the entity is in or both are in
;3072:			otherinfog = (trap_AAS_PointContents(middle) & CONTENTS_FOG);
ADDRLP4 84
ARGP4
ADDRLP4 356
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 304
ADDRLP4 356
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 3073
;3073:			if (infog && otherinfog) {
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 312
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $1597
ADDRLP4 304
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $1597
line 3074
;3074:				VectorSubtract(trace.endpos, eye, dir);
ADDRLP4 364
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 0+12
INDIRF4
ADDRLP4 364
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 0+12+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3075
;3075:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 368
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 368
INDIRF4
ASGNF4
line 3076
;3076:			}
ADDRGP4 $1598
JUMPV
LABELV $1597
line 3077
;3077:			else if (infog) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $1606
line 3078
;3078:				VectorCopy(trace.endpos, start);
ADDRLP4 120
ADDRLP4 0+12
INDIRB
ASGNB 12
line 3079
;3079:				BotAI_Trace(&trace, start, NULL, NULL, eye, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 364
CNSTP4 0
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3080
;3080:				VectorSubtract(eye, trace.endpos, dir);
ADDRLP4 368
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 368
INDIRP4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 368
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 3081
;3081:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 372
INDIRF4
ASGNF4
line 3082
;3082:			}
ADDRGP4 $1607
JUMPV
LABELV $1606
line 3083
;3083:			else if (otherinfog) {
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $1616
line 3084
;3084:				VectorCopy(trace.endpos, end);
ADDRLP4 104
ADDRLP4 0+12
INDIRB
ASGNB 12
line 3085
;3085:				BotAI_Trace(&trace, eye, NULL, NULL, end, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 364
CNSTP4 0
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3086
;3086:				VectorSubtract(end, trace.endpos, dir);
ADDRLP4 136
ADDRLP4 104
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 104+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 104+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 3087
;3087:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 368
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 368
INDIRF4
ASGNF4
line 3088
;3088:			}
ADDRGP4 $1617
JUMPV
LABELV $1616
line 3089
;3089:			else {
line 3091
;3090:				//if the entity and the viewer are not in fog assume there's no fog in between
;3091:				squaredfogdist = 0;
ADDRLP4 300
CNSTF4 0
ASGNF4
line 3092
;3092:			}
LABELV $1617
LABELV $1607
LABELV $1598
line 3094
;3093:			//decrease visibility with the view distance through fog
;3094:			vis = 1 / ((squaredfogdist * 0.001) < 1 ? 1 : (squaredfogdist * 0.001));
ADDRLP4 368
CNSTF4 1065353216
ASGNF4
CNSTF4 981668463
ADDRLP4 300
INDIRF4
MULF4
ADDRLP4 368
INDIRF4
GEF4 $1629
ADDRLP4 364
CNSTF4 1065353216
ASGNF4
ADDRGP4 $1630
JUMPV
LABELV $1629
ADDRLP4 364
CNSTF4 981668463
ADDRLP4 300
INDIRF4
MULF4
ASGNF4
LABELV $1630
ADDRLP4 292
ADDRLP4 368
INDIRF4
ADDRLP4 364
INDIRF4
DIVF4
ASGNF4
line 3096
;3095:			//if entering water visibility is reduced
;3096:			vis *= waterfactor;
ADDRLP4 292
ADDRLP4 292
INDIRF4
ADDRLP4 288
INDIRF4
MULF4
ASGNF4
line 3098
;3097:			//
;3098:			if (vis > bestvis) bestvis = vis;
ADDRLP4 292
INDIRF4
ADDRLP4 296
INDIRF4
LEF4 $1631
ADDRLP4 296
ADDRLP4 292
INDIRF4
ASGNF4
LABELV $1631
line 3100
;3099:			//if pretty much no fog
;3100:			if (bestvis >= 0.95) return bestvis;
ADDRLP4 296
INDIRF4
CNSTF4 1064514355
LTF4 $1633
ADDRLP4 296
INDIRF4
RETF4
ADDRGP4 $1544
JUMPV
LABELV $1633
line 3101
;3101:		}
LABELV $1592
line 3103
;3102:		//check bottom and top of bounding box as well
;3103:		if (i == 0) middle[2] += entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $1635
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $1636
JUMPV
LABELV $1635
line 3104
;3104:		else if (i == 1) middle[2] += entinfo.maxs[2] - entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $1640
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
SUBF4
ADDF4
ASGNF4
LABELV $1640
LABELV $1636
line 3105
;3105:	}
LABELV $1577
line 3032
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 3
LTI4 $1576
line 3106
;3106:	return bestvis;
ADDRLP4 296
INDIRF4
RETF4
LABELV $1544
endproc BotEntityVisible 376 28
export BotFindEnemy
proc BotFindEnemy 468 28
line 3114
;3107:}
;3108:
;3109:/*
;3110:==================
;3111:BotFindEnemy
;3112:==================
;3113:*/
;3114:int BotFindEnemy(bot_state_t *bs, int curenemy) {
line 3121
;3115:	int i, healthdecrease;
;3116:	float f, alertness, easyfragger, vis;
;3117:	float squaredist, cursquaredist;
;3118:	aas_entityinfo_t entinfo, curenemyinfo;
;3119:	vec3_t dir, angles;
;3120:    
;3121:	alertness = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ALERTNESS, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 46
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 336
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 164
ADDRLP4 336
INDIRF4
ASGNF4
line 3122
;3122:	easyfragger = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_EASY_FRAGGER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 45
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 340
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 176
ADDRLP4 340
INDIRF4
ASGNF4
line 3124
;3123:	//check if the health decreased
;3124:	healthdecrease = bs->lasthealth > bs->inventory[INVENTORY_HEALTH];
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 10092
ADDP4
INDIRI4
ADDRLP4 348
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
LEI4 $1649
ADDRLP4 344
CNSTI4 1
ASGNI4
ADDRGP4 $1650
JUMPV
LABELV $1649
ADDRLP4 344
CNSTI4 0
ASGNI4
LABELV $1650
ADDRLP4 160
ADDRLP4 344
INDIRI4
ASGNI4
line 3126
;3125:	//remember the current health value
;3126:	bs->lasthealth = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 10092
ADDP4
ADDRLP4 352
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
ASGNI4
line 3128
;3127:	//
;3128:	if (curenemy >= 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1651
line 3129
;3129:		BotEntityInfo(curenemy, &curenemyinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 196
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3130
;3130:		if (EntityCarriesFlag(&curenemyinfo)) return qfalse;
ADDRLP4 196
ARGP4
ADDRLP4 356
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $1653
CNSTI4 0
RETI4
ADDRGP4 $1647
JUMPV
LABELV $1653
line 3131
;3131:		VectorSubtract(curenemyinfo.origin, bs->origin, dir);
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 196+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 196+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 196+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3132
;3132:		cursquaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 364
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 192
ADDRLP4 364
INDIRF4
ASGNF4
line 3133
;3133:	}
ADDRGP4 $1652
JUMPV
LABELV $1651
line 3134
;3134:	else {
line 3135
;3135:		cursquaredist = 0;
ADDRLP4 192
CNSTF4 0
ASGNF4
line 3136
;3136:	}
LABELV $1652
line 3137
;3137:	if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $1662
line 3142
;3138:		vec3_t target;
;3139:		bot_goal_t *goal;
;3140:		bsp_trace_t trace;
;3141:
;3142:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 456
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 456
INDIRI4
CNSTI4 1
NEI4 $1664
line 3143
;3143:			goal = &blueobelisk;
ADDRLP4 356
ADDRGP4 blueobelisk
ASGNP4
ADDRGP4 $1665
JUMPV
LABELV $1664
line 3145
;3144:		else
;3145:			goal = &redobelisk;
ADDRLP4 356
ADDRGP4 redobelisk
ASGNP4
LABELV $1665
line 3147
;3146:		//if the obelisk is visible
;3147:		VectorCopy(goal->origin, target);
ADDRLP4 360
ADDRLP4 356
INDIRP4
INDIRB
ASGNB 12
line 3148
;3148:		target[2] += 1;
ADDRLP4 360+8
ADDRLP4 360+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3149
;3149:		BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
ADDRLP4 372
ARGP4
ADDRLP4 460
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 460
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 464
CNSTP4 0
ASGNP4
ADDRLP4 464
INDIRP4
ARGP4
ADDRLP4 464
INDIRP4
ARGP4
ADDRLP4 360
ARGP4
ADDRLP4 460
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3150
;3150:		if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
ADDRLP4 372+8
INDIRF4
CNSTF4 1065353216
GEF4 $1671
ADDRLP4 372+80
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $1667
LABELV $1671
line 3151
;3151:			if (goal->entitynum == bs->enemy) {
ADDRLP4 356
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
NEI4 $1672
line 3152
;3152:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1647
JUMPV
LABELV $1672
line 3154
;3153:			}
;3154:			bs->enemy = goal->entitynum;
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
ADDRLP4 356
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
line 3155
;3155:			bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10236
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 3156
;3156:			bs->enemysuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10116
ADDP4
CNSTI4 0
ASGNI4
line 3157
;3157:			bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10240
ADDP4
CNSTF4 0
ASGNF4
line 3158
;3158:			bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 3159
;3159:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1647
JUMPV
LABELV $1667
line 3161
;3160:		}
;3161:	}
LABELV $1662
line 3163
;3162:	//
;3163:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $1677
JUMPV
LABELV $1674
line 3165
;3164:
;3165:		if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1678
ADDRGP4 $1675
JUMPV
LABELV $1678
line 3167
;3166:		//if it's the current enemy
;3167:		if (i == curenemy) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1680
ADDRGP4 $1675
JUMPV
LABELV $1680
line 3169
;3168:		//
;3169:		BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3171
;3170:		//
;3171:		if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1682
ADDRGP4 $1675
JUMPV
LABELV $1682
line 3173
;3172:		//if the enemy isn't dead and the enemy isn't the bot self
;3173:		if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 356
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
NEI4 $1687
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $1684
LABELV $1687
ADDRGP4 $1675
JUMPV
LABELV $1684
line 3175
;3174:		//if the enemy is invisible and not shooting
;3175:		if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 360
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $1688
ADDRLP4 0
ARGP4
ADDRLP4 364
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
NEI4 $1688
line 3176
;3176:			continue;
ADDRGP4 $1675
JUMPV
LABELV $1688
line 3181
;3177:		}
;3178://Neil Torontos unlagged
;3179://unlagged - misc
;3180:		// this has nothing to do with lag compensation, but it's great for testing
;3181:		if ( g_entities[i].flags & FL_NOTARGET ) continue;
CNSTI4 2492
ADDRLP4 140
INDIRI4
MULI4
ADDRGP4 g_entities+576
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1690
ADDRGP4 $1675
JUMPV
LABELV $1690
line 3184
;3182://unlagged - misc
;3183:		//if not an easy fragger don't shoot at chatting players
;3184:		if (easyfragger < 0.5 && EntityIsChatting(&entinfo)) continue;
ADDRLP4 176
INDIRF4
CNSTF4 1056964608
GEF4 $1693
ADDRLP4 0
ARGP4
ADDRLP4 368
ADDRGP4 EntityIsChatting
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $1693
ADDRGP4 $1675
JUMPV
LABELV $1693
line 3186
;3185:		//
;3186:		if (lastteleport_time > FloatTime() - 3) {
ADDRGP4 lastteleport_time
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
LEF4 $1695
line 3187
;3187:			VectorSubtract(entinfo.origin, lastteleport_origin, dir);
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRGP4 lastteleport_origin
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRGP4 lastteleport_origin+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRGP4 lastteleport_origin+8
INDIRF4
SUBF4
ASGNF4
line 3188
;3188:			if (VectorLengthSquared(dir) < Square(70)) continue;
ADDRLP4 144
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 372
INDIRF4
CNSTF4 1167663104
GEF4 $1706
ADDRGP4 $1675
JUMPV
LABELV $1706
line 3189
;3189:		}
LABELV $1695
line 3191
;3190:		//calculate the distance towards the enemy
;3191:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3192
;3192:		squaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 376
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 376
INDIRF4
ASGNF4
line 3194
;3193:		//if this entity is not carrying a flag
;3194:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 380
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $1715
line 3195
;3195:		{
line 3197
;3196:			//if this enemy is further away than the current one
;3197:			if (curenemy >= 0 && squaredist > cursquaredist) continue;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1717
ADDRLP4 156
INDIRF4
ADDRLP4 192
INDIRF4
LEF4 $1717
ADDRGP4 $1675
JUMPV
LABELV $1717
line 3198
;3198:		} //end if
LABELV $1715
line 3200
;3199:		//if the bot has no
;3200:		if (squaredist > Square((900.0 + alertness * 4000.0) * 8)) continue;	//VIEW DISTANCE FOR BOTS * 8
ADDRLP4 384
CNSTF4 1090519040
CNSTF4 1165623296
ADDRLP4 164
INDIRF4
MULF4
CNSTF4 1147207680
ADDF4
MULF4
ASGNF4
ADDRLP4 156
INDIRF4
ADDRLP4 384
INDIRF4
ADDRLP4 384
INDIRF4
MULF4
LEF4 $1719
ADDRGP4 $1675
JUMPV
LABELV $1719
line 3202
;3201:		//if on the same team
;3202:		if(!bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1721
line 3203
;3203:		if (BotSameTeam(bs, i)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $1723
line 3204
;3204:		continue;
ADDRGP4 $1675
JUMPV
LABELV $1723
line 3205
;3205:		}
LABELV $1721
line 3206
;3206:		if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1725
line 3207
;3207:		if(!NpcFactionProp(bs, NP_ATTACK, &g_entities[i]))  continue;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
CNSTI4 2492
ADDRLP4 140
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 388
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
NEI4 $1727
ADDRGP4 $1675
JUMPV
LABELV $1727
line 3208
;3208:		}
LABELV $1725
line 3210
;3209:		//if the bot's health decreased or the enemy is shooting
;3210:		if (curenemy < 0 && (healthdecrease || EntityIsShooting(&entinfo)))
ADDRLP4 388
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 388
INDIRI4
GEI4 $1729
ADDRLP4 160
INDIRI4
ADDRLP4 388
INDIRI4
NEI4 $1731
ADDRLP4 0
ARGP4
ADDRLP4 392
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 392
INDIRI4
CNSTI4 0
EQI4 $1729
LABELV $1731
line 3211
;3211:			f = 360;
ADDRLP4 168
CNSTF4 1135869952
ASGNF4
ADDRGP4 $1730
JUMPV
LABELV $1729
line 3213
;3212:		else
;3213:			f = 90 + 90 - (90 - (squaredist > Square(810) ? Square(810) : squaredist) / (810 * 9));
ADDRLP4 156
INDIRF4
CNSTF4 1226845760
LEF4 $1733
ADDRLP4 396
CNSTF4 1226845760
ASGNF4
ADDRGP4 $1734
JUMPV
LABELV $1733
ADDRLP4 396
ADDRLP4 156
INDIRF4
ASGNF4
LABELV $1734
ADDRLP4 168
CNSTF4 1127481344
CNSTF4 1119092736
ADDRLP4 396
INDIRF4
CNSTF4 1172557824
DIVF4
SUBF4
SUBF4
ASGNF4
LABELV $1730
line 3215
;3214:		//check if the enemy is visible
;3215:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, f, i);
ADDRLP4 400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 400
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 400
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 400
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
ADDRLP4 168
INDIRF4
ARGF4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 404
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 172
ADDRLP4 404
INDIRF4
ASGNF4
line 3216
;3216:		if (vis <= 0) continue;
ADDRLP4 172
INDIRF4
CNSTF4 0
GTF4 $1735
ADDRGP4 $1675
JUMPV
LABELV $1735
line 3218
;3217:		//if the enemy is quite far away, not shooting and the bot is not damaged
;3218:		if (curenemy < 0 && squaredist > Square(100) && !healthdecrease && !EntityIsShooting(&entinfo))
ADDRLP4 408
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 408
INDIRI4
GEI4 $1737
ADDRLP4 156
INDIRF4
CNSTF4 1176256512
LEF4 $1737
ADDRLP4 160
INDIRI4
ADDRLP4 408
INDIRI4
NEI4 $1737
ADDRLP4 0
ARGP4
ADDRLP4 412
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 412
INDIRI4
CNSTI4 0
NEI4 $1737
line 3219
;3219:		{
line 3221
;3220:			//check if we can avoid this enemy
;3221:			VectorSubtract(bs->origin, entinfo.origin, dir);
ADDRLP4 416
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 416
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 416
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
SUBF4
ASGNF4
line 3222
;3222:			vectoangles(dir, angles);
ADDRLP4 144
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3224
;3223:			//if the bot isn't in the fov of the enemy
;3224:			if (!InFieldOfVision(entinfo.angles, 90, angles)) {
ADDRLP4 0+36
ARGP4
CNSTF4 1119092736
ARGF4
ADDRLP4 180
ARGP4
ADDRLP4 420
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 420
INDIRI4
CNSTI4 0
NEI4 $1746
line 3226
;3225:				//update some stuff for this enemy
;3226:				BotUpdateBattleInventory(bs, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 3228
;3227:				//if the bot doesn't really want to fight
;3228:				if (BotWantsToRetreat(bs)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 424
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $1749
ADDRGP4 $1675
JUMPV
LABELV $1749
line 3229
;3229:			}
LABELV $1746
line 3230
;3230:		}
LABELV $1737
line 3232
;3231:		//found an enemy
;3232:		bs->enemy = entinfo.number;
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
ADDRLP4 0+20
INDIRI4
ASGNI4
line 3233
;3233:		if (curenemy >= 0) bs->enemysight_time = FloatTime() - 2;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1752
ADDRFP4 0
INDIRP4
CNSTI4 10236
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
ADDRGP4 $1753
JUMPV
LABELV $1752
line 3234
;3234:		else bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10236
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $1753
line 3235
;3235:		bs->enemysuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10116
ADDP4
CNSTI4 0
ASGNI4
line 3236
;3236:		bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10240
ADDP4
CNSTF4 0
ASGNF4
line 3237
;3237:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 3238
;3238:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1647
JUMPV
LABELV $1675
line 3163
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1677
ADDRLP4 140
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1754
ADDRLP4 140
INDIRI4
CNSTI4 256
LTI4 $1674
LABELV $1754
line 3240
;3239:	}
;3240:	return qfalse;
CNSTI4 0
RETI4
LABELV $1647
endproc BotFindEnemy 468 28
export BotTeamFlagCarrierVisible
proc BotTeamFlagCarrierVisible 164 20
line 3248
;3241:}
;3242:
;3243:/*
;3244:==================
;3245:BotTeamFlagCarrierVisible
;3246:==================
;3247:*/
;3248:int BotTeamFlagCarrierVisible(bot_state_t *bs) {
line 3253
;3249:	int i;
;3250:	float vis;
;3251:	aas_entityinfo_t entinfo;
;3252:
;3253:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1759
JUMPV
LABELV $1756
line 3254
;3254:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1760
line 3255
;3255:			continue;
ADDRGP4 $1757
JUMPV
LABELV $1760
line 3257
;3256:		//
;3257:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3259
;3258:		//if this player is active
;3259:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1762
line 3260
;3260:			continue;
ADDRGP4 $1757
JUMPV
LABELV $1762
line 3262
;3261:		//if this player is carrying a flag
;3262:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1764
line 3263
;3263:			continue;
ADDRGP4 $1757
JUMPV
LABELV $1764
line 3265
;3264:		//if the flag carrier is not on the same team
;3265:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $1766
line 3266
;3266:			continue;
ADDRGP4 $1757
JUMPV
LABELV $1766
line 3268
;3267:		//if the flag carrier is not visible
;3268:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3269
;3269:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1768
line 3270
;3270:			continue;
ADDRGP4 $1757
JUMPV
LABELV $1768
line 3272
;3271:		//
;3272:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1755
JUMPV
LABELV $1757
line 3253
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1759
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1770
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1756
LABELV $1770
line 3274
;3273:	}
;3274:	return -1;
CNSTI4 -1
RETI4
LABELV $1755
endproc BotTeamFlagCarrierVisible 164 20
export BotTeamFlagCarrier
proc BotTeamFlagCarrier 152 8
line 3282
;3275:}
;3276:
;3277:/*
;3278:==================
;3279:BotTeamFlagCarrier
;3280:==================
;3281:*/
;3282:int BotTeamFlagCarrier(bot_state_t *bs) {
line 3286
;3283:	int i;
;3284:	aas_entityinfo_t entinfo;
;3285:
;3286:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1775
JUMPV
LABELV $1772
line 3287
;3287:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1776
line 3288
;3288:			continue;
ADDRGP4 $1773
JUMPV
LABELV $1776
line 3290
;3289:		//
;3290:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3292
;3291:		//if this player is active
;3292:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1778
line 3293
;3293:			continue;
ADDRGP4 $1773
JUMPV
LABELV $1778
line 3295
;3294:		//if this player is carrying a flag
;3295:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1780
line 3296
;3296:			continue;
ADDRGP4 $1773
JUMPV
LABELV $1780
line 3298
;3297:		//if the flag carrier is not on the same team
;3298:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1782
line 3299
;3299:			continue;
ADDRGP4 $1773
JUMPV
LABELV $1782
line 3301
;3300:		//
;3301:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1771
JUMPV
LABELV $1773
line 3286
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1775
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1784
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1772
LABELV $1784
line 3303
;3302:	}
;3303:	return -1;
CNSTI4 -1
RETI4
LABELV $1771
endproc BotTeamFlagCarrier 152 8
export BotEnemyFlagCarrierVisible
proc BotEnemyFlagCarrierVisible 164 20
line 3311
;3304:}
;3305:
;3306:/*
;3307:==================
;3308:BotEnemyFlagCarrierVisible
;3309:==================
;3310:*/
;3311:int BotEnemyFlagCarrierVisible(bot_state_t *bs) {
line 3316
;3312:	int i;
;3313:	float vis;
;3314:	aas_entityinfo_t entinfo;
;3315:
;3316:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1789
JUMPV
LABELV $1786
line 3317
;3317:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1790
line 3318
;3318:			continue;
ADDRGP4 $1787
JUMPV
LABELV $1790
line 3320
;3319:		//
;3320:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3322
;3321:		//if this player is active
;3322:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1792
line 3323
;3323:			continue;
ADDRGP4 $1787
JUMPV
LABELV $1792
line 3325
;3324:		//if this player is carrying a flag
;3325:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1794
line 3326
;3326:			continue;
ADDRGP4 $1787
JUMPV
LABELV $1794
line 3328
;3327:		//if the flag carrier is on the same team
;3328:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1796
line 3329
;3329:			continue;
ADDRGP4 $1787
JUMPV
LABELV $1796
line 3331
;3330:		//if the flag carrier is not visible
;3331:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3332
;3332:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1798
line 3333
;3333:			continue;
ADDRGP4 $1787
JUMPV
LABELV $1798
line 3335
;3334:		//
;3335:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1785
JUMPV
LABELV $1787
line 3316
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1789
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1800
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1786
LABELV $1800
line 3337
;3336:	}
;3337:	return -1;
CNSTI4 -1
RETI4
LABELV $1785
endproc BotEnemyFlagCarrierVisible 164 20
export BotVisibleTeamMatesAndEnemies
proc BotVisibleTeamMatesAndEnemies 192 20
line 3345
;3338:}
;3339:
;3340:/*
;3341:==================
;3342:BotVisibleTeamMatesAndEnemies
;3343:==================
;3344:*/
;3345:void BotVisibleTeamMatesAndEnemies(bot_state_t *bs, int *teammates, int *enemies, float range) {
line 3351
;3346:	int i;
;3347:	float vis;
;3348:	aas_entityinfo_t entinfo;
;3349:	vec3_t dir;
;3350:
;3351:	if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1802
line 3352
;3352:		*teammates = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1802
line 3353
;3353:	if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1804
line 3354
;3354:		*enemies = 0;
ADDRFP4 8
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1804
line 3355
;3355:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1809
JUMPV
LABELV $1806
line 3356
;3356:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1810
line 3357
;3357:			continue;
ADDRGP4 $1807
JUMPV
LABELV $1810
line 3359
;3358:		//
;3359:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3361
;3360:		//if this player is active
;3361:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1812
line 3362
;3362:			continue;
ADDRGP4 $1807
JUMPV
LABELV $1812
line 3364
;3363:		//if this player is carrying a flag
;3364:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1814
line 3365
;3365:			continue;
ADDRGP4 $1807
JUMPV
LABELV $1814
line 3367
;3366:		//if not within range
;3367:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 4+24
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 4+24+4
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 4+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3368
;3368:		if (VectorLengthSquared(dir) > Square(range))
ADDRLP4 144
ARGP4
ADDRLP4 168
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 172
ADDRFP4 12
INDIRF4
ASGNF4
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
LEF4 $1823
line 3369
;3369:			continue;
ADDRGP4 $1807
JUMPV
LABELV $1823
line 3371
;3370:		//if the flag carrier is not visible
;3371:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 180
INDIRF4
ASGNF4
line 3372
;3372:		if (vis <= 0)
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1825
line 3373
;3373:			continue;
ADDRGP4 $1807
JUMPV
LABELV $1825
line 3375
;3374:		//if the flag carrier is on the same team
;3375:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1827
line 3376
;3376:			if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1828
line 3377
;3377:				(*teammates)++;
ADDRLP4 188
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3378
;3378:		}
ADDRGP4 $1828
JUMPV
LABELV $1827
line 3379
;3379:		else {
line 3380
;3380:			if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1831
line 3381
;3381:				(*enemies)++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1831
line 3382
;3382:		}
LABELV $1828
line 3383
;3383:	}
LABELV $1807
line 3355
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1809
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1833
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1806
LABELV $1833
line 3384
;3384:}
LABELV $1801
endproc BotVisibleTeamMatesAndEnemies 192 20
export BotTeamCubeCarrierVisible
proc BotTeamCubeCarrierVisible 164 20
line 3391
;3385:
;3386:/*
;3387:==================
;3388:BotTeamCubeCarrierVisible
;3389:==================
;3390:*/
;3391:int BotTeamCubeCarrierVisible(bot_state_t *bs) {
line 3396
;3392:	int i;
;3393:	float vis;
;3394:	aas_entityinfo_t entinfo;
;3395:
;3396:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1838
JUMPV
LABELV $1835
line 3397
;3397:		if (i == bs->client) continue;
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1839
ADDRGP4 $1836
JUMPV
LABELV $1839
line 3399
;3398:		//
;3399:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3401
;3400:		//if this player is active
;3401:		if (!entinfo.valid) continue;
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1841
ADDRGP4 $1836
JUMPV
LABELV $1841
line 3403
;3402:		//if this player is carrying a flag
;3403:		if (!EntityCarriesCubes(&entinfo)) continue;
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1843
ADDRGP4 $1836
JUMPV
LABELV $1843
line 3405
;3404:		//if the flag carrier is not on the same team
;3405:		if (!BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $1845
ADDRGP4 $1836
JUMPV
LABELV $1845
line 3407
;3406:		//if the flag carrier is not visible
;3407:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3408
;3408:		if (vis <= 0) continue;
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1847
ADDRGP4 $1836
JUMPV
LABELV $1847
line 3410
;3409:		//
;3410:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1834
JUMPV
LABELV $1836
line 3396
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1838
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1849
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1835
LABELV $1849
line 3412
;3411:	}
;3412:	return -1;
CNSTI4 -1
RETI4
LABELV $1834
endproc BotTeamCubeCarrierVisible 164 20
export BotEnemyCubeCarrierVisible
proc BotEnemyCubeCarrierVisible 164 20
line 3420
;3413:}
;3414:
;3415:/*
;3416:==================
;3417:BotEnemyCubeCarrierVisible
;3418:==================
;3419:*/
;3420:int BotEnemyCubeCarrierVisible(bot_state_t *bs) {
line 3425
;3421:	int i;
;3422:	float vis;
;3423:	aas_entityinfo_t entinfo;
;3424:
;3425:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1854
JUMPV
LABELV $1851
line 3426
;3426:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1855
line 3427
;3427:			continue;
ADDRGP4 $1852
JUMPV
LABELV $1855
line 3429
;3428:		//
;3429:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3431
;3430:		//if this player is active
;3431:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1857
line 3432
;3432:			continue;
ADDRGP4 $1852
JUMPV
LABELV $1857
line 3434
;3433:		//if this player is carrying a flag
;3434:		if (!EntityCarriesCubes(&entinfo)) continue;
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesCubes
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1859
ADDRGP4 $1852
JUMPV
LABELV $1859
line 3436
;3435:		//if the flag carrier is on the same team
;3436:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1861
line 3437
;3437:			continue;
ADDRGP4 $1852
JUMPV
LABELV $1861
line 3439
;3438:		//if the flag carrier is not visible
;3439:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3440
;3440:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1863
line 3441
;3441:			continue;
ADDRGP4 $1852
JUMPV
LABELV $1863
line 3443
;3442:		//
;3443:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1850
JUMPV
LABELV $1852
line 3425
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1854
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1865
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1851
LABELV $1865
line 3445
;3444:	}
;3445:	return -1;
CNSTI4 -1
RETI4
LABELV $1850
endproc BotEnemyCubeCarrierVisible 164 20
lit
align 4
LABELV $1867
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $1868
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
export BotAimAtEnemy
code
proc BotAimAtEnemy 1148 52
line 3454
;3446:}
;3447:
;3448:
;3449:/*
;3450:==================
;3451:BotAimAtEnemy
;3452:==================
;3453:*/
;3454:void BotAimAtEnemy(bot_state_t *bs) {
line 3458
;3455:	int i, enemyvisible;
;3456:	float dist, f, aim_skill, aim_accuracy, speed, reactiontime;
;3457:	vec3_t dir, bestorigin, end, start, groundtarget, cmdmove, enemyvelocity;
;3458:	vec3_t mins = {-4,-4,-4}, maxs = {4, 4, 4};
ADDRLP4 860
ADDRGP4 $1867
INDIRB
ASGNB 12
ADDRLP4 872
ADDRGP4 $1868
INDIRB
ASGNB 12
line 3466
;3459:	weaponinfo_t wi;
;3460:	aas_entityinfo_t entinfo;
;3461:	bot_goal_t goal;
;3462:	bsp_trace_t trace;
;3463:	vec3_t target;
;3464:
;3465:	//if the bot has no enemy
;3466:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1869
line 3467
;3467:		return;
ADDRGP4 $1866
JUMPV
LABELV $1869
line 3471
;3468:	}
;3469:
;3470:	//if bot has no valid weapon, return
;3471:	if (bs->weaponnum <= WP_NONE || bs->weaponnum >= WP_NUM_WEAPONS)
ADDRLP4 984
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 0
LEI4 $1873
ADDRLP4 984
INDIRI4
CNSTI4 16
LTI4 $1871
LABELV $1873
line 3472
;3472:		return;
ADDRGP4 $1866
JUMPV
LABELV $1871
line 3475
;3473:
;3474:	//get the enemy entity information
;3475:	BotEntityInfo(bs->enemy, &entinfo);
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
line 3477
;3476:	//if this is not a player (should be an obelisk)
;3477:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
CNSTI4 256
LTI4 $1874
line 3479
;3478:		//if the obelisk is visible
;3479:		VectorCopy(entinfo.origin, target);
ADDRLP4 824
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3481
;3480:		// if attacking an obelisk
;3481:		if ( bs->enemy == redobelisk.entitynum ||
ADDRLP4 988
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ASGNI4
ADDRLP4 988
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $1881
ADDRLP4 988
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $1877
LABELV $1881
line 3482
;3482:			bs->enemy == blueobelisk.entitynum ) {
line 3483
;3483:			target[2] += 32;
ADDRLP4 824+8
ADDRLP4 824+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 3484
;3484:		}
LABELV $1877
line 3486
;3485:		//aim at the obelisk
;3486:		VectorSubtract(target, bs->eye, dir);
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 824
INDIRF4
ADDRLP4 992
INDIRP4
CNSTI4 5968
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 824+4
INDIRF4
ADDRLP4 992
INDIRP4
CNSTI4 5972
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 824+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3487
;3487:		vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3489
;3488:		//set the aim target before trying to attack
;3489:		VectorCopy(target, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 10324
ADDP4
ADDRLP4 824
INDIRB
ASGNB 12
line 3490
;3490:		return;
ADDRGP4 $1866
JUMPV
LABELV $1874
line 3495
;3491:	}
;3492:	//
;3493:	//BotAI_Print(PRT_MESSAGE, "client %d: aiming at client %d\n", bs->entitynum, bs->enemy);
;3494:	//
;3495:	aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 988
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 988
INDIRF4
ASGNF4
line 3496
;3496:	aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 992
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 992
INDIRF4
ASGNF4
line 3498
;3497:	//
;3498:	if (aim_skill > 0.95) {
ADDRLP4 736
INDIRF4
CNSTF4 1064514355
LEF4 $1887
line 3500
;3499:		//don't aim too early
;3500:		reactiontime = 0.5 * trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 856
CNSTF4 1056964608
ADDRLP4 996
INDIRF4
MULF4
ASGNF4
line 3501
;3501:		if (bs->enemysight_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 10236
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1889
ADDRGP4 $1866
JUMPV
LABELV $1889
line 3502
;3502:		if (bs->teleport_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 10284
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1891
ADDRGP4 $1866
JUMPV
LABELV $1891
line 3503
;3503:	}
LABELV $1887
line 3506
;3504:
;3505:	//get the weapon information
;3506:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 996
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 996
INDIRP4
CNSTI4 10640
ADDP4
INDIRI4
ARGI4
ADDRLP4 996
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3508
;3507:	//get the weapon specific aim accuracy and or aim skill
;3508:	if (wi.number == WP_MACHINEGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 2
NEI4 $1893
line 3509
;3509:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 1000
INDIRF4
ASGNF4
line 3510
;3510:	}
ADDRGP4 $1894
JUMPV
LABELV $1893
line 3511
;3511:	else if (wi.number == WP_SHOTGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 3
NEI4 $1896
line 3512
;3512:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_SHOTGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 9
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 1000
INDIRF4
ASGNF4
line 3513
;3513:	}
ADDRGP4 $1897
JUMPV
LABELV $1896
line 3514
;3514:	else if (wi.number == WP_GRENADE_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1899
line 3515
;3515:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 11
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 1000
INDIRF4
ASGNF4
line 3516
;3516:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 18
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1004
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1004
INDIRF4
ASGNF4
line 3517
;3517:	}
ADDRGP4 $1900
JUMPV
LABELV $1899
line 3518
;3518:	else if (wi.number == WP_ROCKET_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 5
NEI4 $1902
line 3519
;3519:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 1000
INDIRF4
ASGNF4
line 3520
;3520:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 17
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1004
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1004
INDIRF4
ASGNF4
line 3521
;3521:	}
ADDRGP4 $1903
JUMPV
LABELV $1902
line 3522
;3522:	else if (wi.number == WP_LIGHTNING) {
ADDRLP4 160+4
INDIRI4
CNSTI4 6
NEI4 $1905
line 3523
;3523:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_LIGHTNING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 1000
INDIRF4
ASGNF4
line 3524
;3524:	}
ADDRGP4 $1906
JUMPV
LABELV $1905
line 3525
;3525:	else if (wi.number == WP_RAILGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1908
line 3526
;3526:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_RAILGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 14
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 1000
INDIRF4
ASGNF4
line 3527
;3527:	}
ADDRGP4 $1909
JUMPV
LABELV $1908
line 3528
;3528:	else if (wi.number == WP_PLASMAGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 8
NEI4 $1911
line 3529
;3529:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 1000
INDIRF4
ASGNF4
line 3530
;3530:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 19
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1004
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1004
INDIRF4
ASGNF4
line 3531
;3531:	}
ADDRGP4 $1912
JUMPV
LABELV $1911
line 3532
;3532:	else if (wi.number == WP_BFG) {
ADDRLP4 160+4
INDIRI4
CNSTI4 9
NEI4 $1914
line 3533
;3533:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 15
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 1000
INDIRF4
ASGNF4
line 3534
;3534:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 20
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1004
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1004
INDIRF4
ASGNF4
line 3535
;3535:	}
LABELV $1914
LABELV $1912
LABELV $1909
LABELV $1906
LABELV $1903
LABELV $1900
LABELV $1897
LABELV $1894
line 3537
;3536:	//
;3537:	if (aim_accuracy <= 0) aim_accuracy = 0.0001f;
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1917
ADDRLP4 156
CNSTF4 953267991
ASGNF4
LABELV $1917
line 3539
;3538:	//get the enemy entity information
;3539:	BotEntityInfo(bs->enemy, &entinfo);
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
line 3541
;3540:	//if the enemy is invisible then shoot crappy most of the time
;3541:	if (EntityIsInvisible(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 1000
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 0
EQI4 $1919
line 3542
;3542:		if (random() > 0.1) aim_accuracy *= 0.4f;
ADDRLP4 1004
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1004
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1036831949
LEF4 $1921
ADDRLP4 156
CNSTF4 1053609165
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
LABELV $1921
line 3543
;3543:	}
LABELV $1919
line 3545
;3544:	//
;3545:	VectorSubtract(entinfo.origin, entinfo.lastvisorigin, enemyvelocity);
ADDRLP4 712
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3546
;3546:	VectorScale(enemyvelocity, 1 / entinfo.update_time, enemyvelocity);
ADDRLP4 1004
CNSTF4 1065353216
ASGNF4
ADDRLP4 712
ADDRLP4 712
INDIRF4
ADDRLP4 1004
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 712+4
INDIRF4
ADDRLP4 1004
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 712+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3548
;3547:	//enemy origin and velocity is remembered every 0.5 seconds
;3548:	if (bs->enemyposition_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10244
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1942
line 3550
;3549:		//
;3550:		bs->enemyposition_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 10244
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3551
;3551:		VectorCopy(enemyvelocity, bs->enemyvelocity);
ADDRFP4 0
INDIRP4
CNSTI4 10336
ADDP4
ADDRLP4 712
INDIRB
ASGNB 12
line 3552
;3552:		VectorCopy(entinfo.origin, bs->enemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 10348
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3553
;3553:	}
LABELV $1942
line 3555
;3554:	//if not extremely skilled
;3555:	if (aim_skill < 0.9) {
ADDRLP4 736
INDIRF4
CNSTF4 1063675494
GEF4 $1945
line 3556
;3556:		VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 10348
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 10352
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 10356
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3558
;3557:		//if the enemy moved a bit
;3558:		if (VectorLengthSquared(dir) > Square(48)) {
ADDRLP4 140
ARGP4
ADDRLP4 1012
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1012
INDIRF4
CNSTF4 1158676480
LEF4 $1954
line 3560
;3559:			//if the enemy changed direction
;3560:			if (DotProduct(bs->enemyvelocity, enemyvelocity) < 0) {
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1016
INDIRP4
CNSTI4 10336
ADDP4
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ADDRLP4 1016
INDIRP4
CNSTI4 10340
ADDP4
INDIRF4
ADDRLP4 712+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1016
INDIRP4
CNSTI4 10344
ADDP4
INDIRF4
ADDRLP4 712+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $1956
line 3562
;3561:				//aim accuracy should be worse now
;3562:				aim_accuracy *= 0.7f;
ADDRLP4 156
CNSTF4 1060320051
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 3563
;3563:			}
LABELV $1956
line 3564
;3564:		}
LABELV $1954
line 3565
;3565:	}
LABELV $1945
line 3567
;3566:	//check visibility of enemy
;3567:	enemyvisible = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 1008
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 1008
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 1008
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 1012
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 836
ADDRLP4 1012
INDIRF4
CVFI4 4
ASGNI4
line 3569
;3568:	//if the enemy is visible
;3569:	if (enemyvisible) {
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $1960
line 3571
;3570:		//
;3571:		VectorCopy(entinfo.origin, bestorigin);
ADDRLP4 724
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3572
;3572:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3575
;3573:		//get the start point shooting from
;3574:		//NOTE: the x and y projectile start offsets are ignored
;3575:		VectorCopy(bs->origin, start);
ADDRLP4 844
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
INDIRB
ASGNB 12
line 3576
;3576:		start[2] += bs->cur_ps.viewheight;
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3577
;3577:		start[2] += wi.offset[2];
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRLP4 160+292+8
INDIRF4
ADDF4
ASGNF4
line 3579
;3578:		//
;3579:		BotAI_Trace(&trace, start, mins, maxs, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
ADDRLP4 860
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 724
ARGP4
ADDRFP4 0
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
line 3581
;3580:		//if the enemy is NOT hit
;3581:		if (trace.fraction <= 1 && trace.ent != entinfo.number) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
GTF4 $1968
ADDRLP4 740+80
INDIRI4
ADDRLP4 0+20
INDIRI4
EQI4 $1968
line 3582
;3582:			bestorigin[2] += 16;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3583
;3583:		}
LABELV $1968
line 3585
;3584:		//if it is not an instant hit weapon the bot might want to predict the enemy
;3585:		if (wi.speed) {
ADDRLP4 160+272
INDIRF4
CNSTF4 0
EQF4 $1974
line 3587
;3586:			//
;3587:			VectorSubtract(bestorigin, bs->origin, dir);
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3588
;3588:			dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1020
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1020
INDIRF4
ASGNF4
line 3589
;3589:			VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1024
INDIRP4
CNSTI4 10348
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1024
INDIRP4
CNSTI4 10352
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 10356
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3591
;3590:			//if the enemy is NOT pretty far away and strafing just small steps left and right
;3591:			if (!(dist > 100 && VectorLengthSquared(dir) < Square(32))) {
ADDRLP4 840
INDIRF4
CNSTF4 1120403456
LEF4 $1990
ADDRLP4 140
ARGP4
ADDRLP4 1028
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1028
INDIRF4
CNSTF4 1149239296
LTF4 $1988
LABELV $1990
line 3593
;3592:				//if skilled anough do exact prediction
;3593:				if (aim_skill > 0.8 &&
ADDRLP4 736
INDIRF4
CNSTF4 1061997773
LEF4 $1991
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1991
line 3595
;3594:						//if the weapon is ready to fire
;3595:						bs->cur_ps.weaponstate == WEAPON_READY) {
line 3599
;3596:					aas_clientmove_t move;
;3597:					vec3_t origin;
;3598:
;3599:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1128
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1128
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3601
;3600:					//distance towards the enemy
;3601:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1132
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1132
INDIRF4
ASGNF4
line 3603
;3602:					//direction the enemy is moving in
;3603:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3605
;3604:					//
;3605:					VectorScale(dir, 1 / entinfo.update_time, dir);
ADDRLP4 1136
CNSTF4 1065353216
ASGNF4
ADDRLP4 140
ADDRLP4 140
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 140+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3607
;3606:					//
;3607:					VectorCopy(entinfo.origin, origin);
ADDRLP4 1032
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3608
;3608:					origin[2] += 1;
ADDRLP4 1032+8
ADDRLP4 1032+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3610
;3609:					//
;3610:					VectorClear(cmdmove);
ADDRLP4 1140
CNSTF4 0
ASGNF4
ADDRLP4 968+8
ADDRLP4 1140
INDIRF4
ASGNF4
ADDRLP4 968+4
ADDRLP4 1140
INDIRF4
ASGNF4
ADDRLP4 968
ADDRLP4 1140
INDIRF4
ASGNF4
line 3612
;3611:					//AAS_ClearShownDebugLines();
;3612:					trap_AAS_PredictClientMovement(&move, bs->enemy, origin,
ADDRLP4 1044
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1144
CNSTI4 0
ASGNI4
ADDRLP4 1144
INDIRI4
ARGI4
ADDRLP4 140
ARGP4
ADDRLP4 968
ARGP4
ADDRLP4 1144
INDIRI4
ARGI4
CNSTF4 1092616192
ADDRLP4 840
INDIRF4
MULF4
ADDRLP4 160+272
INDIRF4
DIVF4
CVFI4 4
ARGI4
CNSTF4 1036831949
ARGF4
ADDRLP4 1144
INDIRI4
ARGI4
ADDRLP4 1144
INDIRI4
ARGI4
ADDRLP4 1144
INDIRI4
ARGI4
ADDRGP4 trap_AAS_PredictClientMovement
CALLI4
pop
line 3616
;3613:														PRESENCE_CROUCH, qfalse,
;3614:														dir, cmdmove, 0,
;3615:														dist * 10 / wi.speed, 0.1f, 0, 0, qfalse);
;3616:					VectorCopy(move.endpos, bestorigin);
ADDRLP4 724
ADDRLP4 1044
INDIRB
ASGNB 12
line 3618
;3617:					//BotAI_Print(PRT_MESSAGE, "%1.1f predicted speed = %f, frames = %f\n", FloatTime(), VectorLength(dir), dist * 10 / wi.speed);
;3618:				}
ADDRGP4 $1992
JUMPV
LABELV $1991
line 3620
;3619:				//if not that skilled do linear prediction
;3620:				else if (aim_skill > 0.4) {
ADDRLP4 736
INDIRF4
CNSTF4 1053609165
LEF4 $2024
line 3621
;3621:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1032
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1032
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3623
;3622:					//distance towards the enemy
;3623:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1036
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1036
INDIRF4
ASGNF4
line 3625
;3624:					//direction the enemy is moving in
;3625:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3626
;3626:					dir[2] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 3628
;3627:					//
;3628:					speed = VectorNormalize(dir) / entinfo.update_time;
ADDRLP4 140
ARGP4
ADDRLP4 1040
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 980
ADDRLP4 1040
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
ASGNF4
line 3631
;3629:					//botimport.Print(PRT_MESSAGE, "speed = %f, wi->speed = %f\n", speed, wi->speed);
;3630:					//best spot to aim at
;3631:					VectorMA(entinfo.origin, (dist / wi.speed) * speed, dir, bestorigin);
ADDRLP4 1044
ADDRLP4 840
INDIRF4
ASGNF4
ADDRLP4 1048
ADDRLP4 980
INDIRF4
ASGNF4
ADDRLP4 724
ADDRLP4 0+24
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 1044
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1048
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 140+4
INDIRF4
ADDRLP4 1044
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1048
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 140+8
INDIRF4
ADDRLP4 840
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 980
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 3632
;3632:				}
LABELV $2024
LABELV $1992
line 3633
;3633:			}
LABELV $1988
line 3634
;3634:		}
LABELV $1974
line 3636
;3635:		//if the projectile does radial damage
;3636:		if (aim_skill > 0.6 && wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 736
INDIRF4
CNSTF4 1058642330
LEF4 $2059
ADDRLP4 160+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2059
line 3638
;3637:			//if the enemy isn't standing significantly higher than the bot
;3638:			if (entinfo.origin[2] < bs->origin[2] + 16) {
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
GEF4 $2063
line 3640
;3639:				//try to aim at the ground in front of the enemy
;3640:				VectorCopy(entinfo.origin, end);
ADDRLP4 956
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3641
;3641:				end[2] -= 64;
ADDRLP4 956+8
ADDRLP4 956+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 3642
;3642:				BotAI_Trace(&trace, entinfo.origin, NULL, NULL, end, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 1016
CNSTP4 0
ASGNP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRLP4 956
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3644
;3643:				//
;3644:				VectorCopy(bestorigin, groundtarget);
ADDRLP4 944
ADDRLP4 724
INDIRB
ASGNB 12
line 3645
;3645:				if (trace.startsolid) groundtarget[2] = entinfo.origin[2] - 16;
ADDRLP4 740+4
INDIRI4
CNSTI4 0
EQI4 $2071
ADDRLP4 944+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
ADDRGP4 $2072
JUMPV
LABELV $2071
line 3646
;3646:				else groundtarget[2] = trace.endpos[2] - 8;
ADDRLP4 944+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
LABELV $2072
line 3648
;3647:				//trace a line from projectile start to ground target
;3648:				BotAI_Trace(&trace, start, NULL, NULL, groundtarget, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
ADDRLP4 1020
CNSTP4 0
ASGNP4
ADDRLP4 1020
INDIRP4
ARGP4
ADDRLP4 1020
INDIRP4
ARGP4
ADDRLP4 944
ARGP4
ADDRFP4 0
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
line 3650
;3649:				//if hitpoint is not vertically too far from the ground target
;3650:				if (fabs(trace.endpos[2] - groundtarget[2]) < 50) {
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ARGF4
ADDRLP4 1024
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1112014848
GEF4 $2080
line 3651
;3651:					VectorSubtract(trace.endpos, groundtarget, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 944
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 944+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ASGNF4
line 3653
;3652:					//if the hitpoint is near anough the ground target
;3653:					if (VectorLengthSquared(dir) < Square(60)) {
ADDRLP4 140
ARGP4
ADDRLP4 1028
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1028
INDIRF4
CNSTF4 1163984896
GEF4 $2094
line 3654
;3654:						VectorSubtract(trace.endpos, start, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 844
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 844+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 844+8
INDIRF4
SUBF4
ASGNF4
line 3656
;3655:						//if the hitpoint is far anough from the bot
;3656:						if (VectorLengthSquared(dir) > Square(100)) {
ADDRLP4 140
ARGP4
ADDRLP4 1032
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1032
INDIRF4
CNSTF4 1176256512
LEF4 $2105
line 3658
;3657:							//check if the bot is visible from the ground target
;3658:							trace.endpos[2] += 1;
ADDRLP4 740+12+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3659
;3659:							BotAI_Trace(&trace, trace.endpos, NULL, NULL, entinfo.origin, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 740+12
ARGP4
ADDRLP4 1036
CNSTP4 0
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3660
;3660:							if (trace.fraction >= 1) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
LTF4 $2112
line 3662
;3661:								//botimport.Print(PRT_MESSAGE, "%1.1f aiming at ground\n", AAS_Time());
;3662:								VectorCopy(groundtarget, bestorigin);
ADDRLP4 724
ADDRLP4 944
INDIRB
ASGNB 12
line 3663
;3663:							}
LABELV $2112
line 3664
;3664:						}
LABELV $2105
line 3665
;3665:					}
LABELV $2094
line 3666
;3666:				}
LABELV $2080
line 3667
;3667:			}
LABELV $2063
line 3668
;3668:		}
LABELV $2059
line 3669
;3669:		bestorigin[0] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1016
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724
ADDRLP4 724
INDIRF4
CNSTF4 1101004800
CNSTF4 1073741824
ADDRLP4 1016
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3670
;3670:		bestorigin[1] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1020
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+4
ADDRLP4 724+4
INDIRF4
CNSTF4 1101004800
CNSTF4 1073741824
ADDRLP4 1020
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3671
;3671:		bestorigin[2] += 10 * crandom() * (1 - aim_accuracy);
ADDRLP4 1024
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1092616192
CNSTF4 1073741824
ADDRLP4 1024
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3672
;3672:	}
ADDRGP4 $1961
JUMPV
LABELV $1960
line 3673
;3673:	else {
line 3675
;3674:		//
;3675:		VectorCopy(bs->lastenemyorigin, bestorigin);
ADDRLP4 724
ADDRFP4 0
INDIRP4
CNSTI4 10652
ADDP4
INDIRB
ASGNB 12
line 3676
;3676:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3678
;3677:		//if the bot is skilled anough
;3678:		if (aim_skill > 0.5) {
ADDRLP4 736
INDIRF4
CNSTF4 1056964608
LEF4 $2118
line 3680
;3679:			//do prediction shots around corners
;3680:			if (wi.number == WP_BFG ||
ADDRLP4 160+4
INDIRI4
CNSTI4 9
EQI4 $2126
ADDRLP4 160+4
INDIRI4
CNSTI4 5
EQI4 $2126
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $2120
LABELV $2126
line 3682
;3681:				wi.number == WP_ROCKET_LAUNCHER ||
;3682:				wi.number == WP_GRENADE_LAUNCHER) {
line 3684
;3683:				//create the chase goal
;3684:				goal.entitynum = bs->client;
ADDRLP4 884+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 3685
;3685:				goal.areanum = bs->areanum;
ADDRLP4 884+12
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ASGNI4
line 3686
;3686:				VectorCopy(bs->eye, goal.origin);
ADDRLP4 884
ADDRFP4 0
INDIRP4
CNSTI4 5968
ADDP4
INDIRB
ASGNB 12
line 3687
;3687:				VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 884+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+8
CNSTF4 3238002688
ASGNF4
line 3688
;3688:				VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 884+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+8
CNSTF4 1090519040
ASGNF4
line 3690
;3689:				//
;3690:				if (trap_BotPredictVisiblePosition(bs->lastenemyorigin, bs->lastenemyareanum, &goal, TFL_DEFAULT, target)) {
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1016
INDIRP4
CNSTI4 10652
ADDP4
ARGP4
ADDRLP4 1016
INDIRP4
CNSTI4 10648
ADDP4
INDIRI4
ARGI4
ADDRLP4 884
ARGP4
CNSTI4 18616254
ARGI4
ADDRLP4 824
ARGP4
ADDRLP4 1020
ADDRGP4 trap_BotPredictVisiblePosition
CALLI4
ASGNI4
ADDRLP4 1020
INDIRI4
CNSTI4 0
EQI4 $2139
line 3691
;3691:					VectorSubtract(target, bs->eye, dir);
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 824
INDIRF4
ADDRLP4 1024
INDIRP4
CNSTI4 5968
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 824+4
INDIRF4
ADDRLP4 1024
INDIRP4
CNSTI4 5972
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 824+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3692
;3692:					if (VectorLengthSquared(dir) > Square(80)) {
ADDRLP4 140
ARGP4
ADDRLP4 1028
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1028
INDIRF4
CNSTF4 1170735104
LEF4 $2145
line 3693
;3693:						VectorCopy(target, bestorigin);
ADDRLP4 724
ADDRLP4 824
INDIRB
ASGNB 12
line 3694
;3694:						bestorigin[2] -= 20;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 3695
;3695:					}
LABELV $2145
line 3696
;3696:				}
LABELV $2139
line 3697
;3697:				aim_accuracy = 1;
ADDRLP4 156
CNSTF4 1065353216
ASGNF4
line 3698
;3698:			}
LABELV $2120
line 3699
;3699:		}
LABELV $2118
line 3700
;3700:	}
LABELV $1961
line 3702
;3701:	//
;3702:	if (enemyvisible) {
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $2148
line 3703
;3703:		BotAI_Trace(&trace, bs->eye, NULL, NULL, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1016
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 1020
CNSTP4 0
ASGNP4
ADDRLP4 1020
INDIRP4
ARGP4
ADDRLP4 1020
INDIRP4
ARGP4
ADDRLP4 724
ARGP4
ADDRLP4 1016
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
line 3704
;3704:		VectorCopy(trace.endpos, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 10324
ADDP4
ADDRLP4 740+12
INDIRB
ASGNB 12
line 3705
;3705:	}
ADDRGP4 $2149
JUMPV
LABELV $2148
line 3706
;3706:	else {
line 3707
;3707:		VectorCopy(bestorigin, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 10324
ADDP4
ADDRLP4 724
INDIRB
ASGNB 12
line 3708
;3708:	}
LABELV $2149
line 3710
;3709:	//get aim direction
;3710:	VectorSubtract(bestorigin, bs->eye, dir);
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 5968
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 5972
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3712
;3711:	//
;3712:	if (wi.number == WP_MACHINEGUN ||
ADDRLP4 160+4
INDIRI4
CNSTI4 2
EQI4 $2163
ADDRLP4 160+4
INDIRI4
CNSTI4 3
EQI4 $2163
ADDRLP4 160+4
INDIRI4
CNSTI4 6
EQI4 $2163
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $2155
LABELV $2163
line 3715
;3713:		wi.number == WP_SHOTGUN ||
;3714:		wi.number == WP_LIGHTNING ||
;3715:		wi.number == WP_RAILGUN) {
line 3717
;3716:		//distance towards the enemy
;3717:		dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1020
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1020
INDIRF4
ASGNF4
line 3718
;3718:		if (dist > 150) dist = 150;
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
LEF4 $2164
ADDRLP4 840
CNSTF4 1125515264
ASGNF4
LABELV $2164
line 3719
;3719:		f = 0.6 + dist / 150 * 0.4;
ADDRLP4 940
CNSTF4 1053609165
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
DIVF4
MULF4
CNSTF4 1058642330
ADDF4
ASGNF4
line 3720
;3720:		aim_accuracy *= f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
ADDRLP4 940
INDIRF4
MULF4
ASGNF4
line 3721
;3721:	}
LABELV $2155
line 3723
;3722:	//add some random stuff to the aim direction depending on the aim accuracy
;3723:	if (aim_accuracy < 0.8) {
ADDRLP4 156
INDIRF4
CNSTF4 1061997773
GEF4 $2166
line 3724
;3724:		VectorNormalize(dir);
ADDRLP4 140
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3725
;3725:		for (i = 0; i < 3; i++) dir[i] += 0.3 * crandom() * (1 - aim_accuracy);
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $2168
ADDRLP4 1020
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
ADDP4
ASGNP4
ADDRLP4 1024
INDIRP4
ADDRLP4 1024
INDIRP4
INDIRF4
CNSTF4 1050253722
CNSTF4 1073741824
ADDRLP4 1020
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
LABELV $2169
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 3
LTI4 $2168
line 3726
;3726:	}
LABELV $2166
line 3728
;3727:	//set the ideal view angles
;3728:	vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3730
;3729:	//take the weapon spread into account for lower skilled bots
;3730:	bs->ideal_viewangles[PITCH] += 6 * wi.vspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1020
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ASGNP4
ADDRLP4 1024
INDIRP4
ADDRLP4 1024
INDIRP4
INDIRF4
CNSTF4 1086324736
ADDRLP4 160+268
INDIRF4
MULF4
CNSTF4 1073741824
ADDRLP4 1020
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3731
;3731:	bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ASGNP4
ADDRLP4 1028
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1032
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1028
INDIRP4
ADDRLP4 1032
INDIRF4
ASGNF4
line 3732
;3732:	bs->ideal_viewangles[YAW] += 6 * wi.hspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1036
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CNSTI4 10684
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRF4
CNSTF4 1086324736
ADDRLP4 160+264
INDIRF4
MULF4
CNSTF4 1073741824
ADDRLP4 1036
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3733
;3733:	bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 1044
ADDRFP4 0
INDIRP4
CNSTI4 10684
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1048
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1044
INDIRP4
ADDRLP4 1048
INDIRF4
ASGNF4
line 3735
;3734:	//if the bots should be really challenging
;3735:	if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $2174
line 3737
;3736:		//if the bot is really accurate and has the enemy in view for some time
;3737:		if (aim_accuracy > 0.9 && bs->enemysight_time < FloatTime() - 1) {
ADDRLP4 156
INDIRF4
CNSTF4 1063675494
LEF4 $2177
ADDRFP4 0
INDIRP4
CNSTI4 10236
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $2177
line 3739
;3738:			//set the view angles directly
;3739:			if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $2179
ADDRLP4 1052
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $2179
line 3740
;3740:			VectorCopy(bs->ideal_viewangles, bs->viewangles);
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CNSTI4 10668
ADDP4
ADDRLP4 1056
INDIRP4
CNSTI4 10680
ADDP4
INDIRB
ASGNB 12
line 3741
;3741:			trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 1060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1060
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 3742
;3742:		}
LABELV $2177
line 3743
;3743:	}
LABELV $2174
line 3744
;3744:}
LABELV $1866
endproc BotAimAtEnemy 1148 52
lit
align 4
LABELV $2182
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $2183
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCheckAttack
code
proc BotCheckAttack 1028 28
line 3751
;3745:
;3746:/*
;3747:==================
;3748:BotCheckAttack
;3749:==================
;3750:*/
;3751:void BotCheckAttack(bot_state_t *bs) {
line 3760
;3752:	float points, reactiontime, fov, firethrottle;
;3753:	int attackentity;
;3754:	bsp_trace_t bsptrace;
;3755:	//float selfpreservation;
;3756:	vec3_t forward, right, start, end, dir, angles;
;3757:	weaponinfo_t wi;
;3758:	bsp_trace_t trace;
;3759:	aas_entityinfo_t entinfo;
;3760:	vec3_t mins = {-8, -8, -8}, maxs = {8, 8, 8};
ADDRLP4 948
ADDRGP4 $2182
INDIRB
ASGNB 12
ADDRLP4 960
ADDRGP4 $2183
INDIRB
ASGNB 12
line 3762
;3761:
;3762:	attackentity = bs->enemy;
ADDRLP4 576
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
ASGNI4
line 3764
;3763:	//
;3764:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 576
INDIRI4
ARGI4
ADDRLP4 788
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3766
;3765:	// if not attacking a player
;3766:	if (attackentity >= MAX_CLIENTS) {
ADDRLP4 576
INDIRI4
CNSTI4 256
LTI4 $2184
line 3768
;3767:		// if attacking an obelisk
;3768:		if ( entinfo.number == redobelisk.entitynum ||
ADDRLP4 788+20
INDIRI4
ADDRGP4 redobelisk+40
INDIRI4
EQI4 $2192
ADDRLP4 788+20
INDIRI4
ADDRGP4 blueobelisk+40
INDIRI4
NEI4 $2186
LABELV $2192
line 3769
;3769:			entinfo.number == blueobelisk.entitynum ) {
line 3771
;3770:			// if obelisk is respawning return
;3771:			if ( g_entities[entinfo.number].activator &&
ADDRLP4 976
CNSTI4 2492
ASGNI4
ADDRLP4 976
INDIRI4
ADDRLP4 788+20
INDIRI4
MULI4
ADDRGP4 g_entities+968
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2193
ADDRLP4 976
INDIRI4
ADDRLP4 788+20
INDIRI4
MULI4
ADDRGP4 g_entities+968
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2193
line 3772
;3772:				g_entities[entinfo.number].activator->s.frame == 2 ) {
line 3773
;3773:				return;
ADDRGP4 $2181
JUMPV
LABELV $2193
line 3775
;3774:			}
;3775:		}
LABELV $2186
line 3776
;3776:	}
LABELV $2184
line 3778
;3777:	//
;3778:	reactiontime = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 976
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 700
ADDRLP4 976
INDIRF4
ASGNF4
line 3779
;3779:	if (bs->enemysight_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 10236
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 700
INDIRF4
SUBF4
LEF4 $2199
ADDRGP4 $2181
JUMPV
LABELV $2199
line 3780
;3780:	if (bs->teleport_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 10284
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 700
INDIRF4
SUBF4
LEF4 $2201
ADDRGP4 $2181
JUMPV
LABELV $2201
line 3782
;3781:	//if changing weapons
;3782:	if (bs->weaponchange_time > FloatTime() - 0.1) return;
ADDRFP4 0
INDIRP4
CNSTI4 10296
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1036831949
SUBF4
LEF4 $2203
ADDRGP4 $2181
JUMPV
LABELV $2203
line 3784
;3783:	//check fire throttle characteristic
;3784:	if (bs->firethrottlewait_time > FloatTime()) return;
ADDRFP4 0
INDIRP4
CNSTI4 10300
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $2205
ADDRGP4 $2181
JUMPV
LABELV $2205
line 3785
;3785:	firethrottle = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_FIRETHROTTLE, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 47
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 932
ADDRLP4 980
INDIRF4
ASGNF4
line 3786
;3786:	if (bs->firethrottleshoot_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 10304
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $2207
line 3787
;3787:		if (random() > firethrottle) {
ADDRLP4 984
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 932
INDIRF4
LEF4 $2209
line 3788
;3788:			bs->firethrottlewait_time = FloatTime() + firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 10300
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 932
INDIRF4
ADDF4
ASGNF4
line 3789
;3789:			bs->firethrottleshoot_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10304
ADDP4
CNSTF4 0
ASGNF4
line 3790
;3790:		}
ADDRGP4 $2210
JUMPV
LABELV $2209
line 3791
;3791:		else {
line 3792
;3792:			bs->firethrottleshoot_time = FloatTime() + 1 - firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 10304
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 932
INDIRF4
SUBF4
ASGNF4
line 3793
;3793:			bs->firethrottlewait_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10300
ADDP4
CNSTF4 0
ASGNF4
line 3794
;3794:		}
LABELV $2210
line 3795
;3795:	}
LABELV $2207
line 3798
;3796:	//
;3797:	//
;3798:	VectorSubtract(bs->aimtarget, bs->eye, dir);
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580
ADDRLP4 984
INDIRP4
CNSTI4 10324
ADDP4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 5968
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 580+4
ADDRLP4 984
INDIRP4
CNSTI4 10328
ADDP4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 5972
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 988
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580+8
ADDRLP4 988
INDIRP4
CNSTI4 10332
ADDP4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 5976
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3800
;3799:	//
;3800:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2213
line 3801
;3801:		if (VectorLengthSquared(dir) > Square(60)) {
ADDRLP4 580
ARGP4
ADDRLP4 992
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 992
INDIRF4
CNSTF4 1163984896
LEF4 $2215
line 3802
;3802:			return;
ADDRGP4 $2181
JUMPV
LABELV $2215
line 3804
;3803:		}
;3804:	}
LABELV $2213
line 3805
;3805:	if (VectorLengthSquared(dir) < Square(100))
ADDRLP4 580
ARGP4
ADDRLP4 992
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 992
INDIRF4
CNSTF4 1176256512
GEF4 $2217
line 3806
;3806:		fov = 120;
ADDRLP4 928
CNSTF4 1123024896
ASGNF4
ADDRGP4 $2218
JUMPV
LABELV $2217
line 3808
;3807:	else
;3808:		fov = 50;
ADDRLP4 928
CNSTF4 1112014848
ASGNF4
LABELV $2218
line 3810
;3809:	//
;3810:	vectoangles(dir, angles);
ADDRLP4 580
ARGP4
ADDRLP4 936
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3811
;3811:	if (!InFieldOfVision(bs->viewangles, fov, angles))
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
ADDRLP4 928
INDIRF4
ARGF4
ADDRLP4 936
ARGP4
ADDRLP4 996
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
NEI4 $2219
line 3812
;3812:		return;
ADDRGP4 $2181
JUMPV
LABELV $2219
line 3813
;3813:	BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->aimtarget, bs->client, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 704
ARGP4
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 1004
CNSTP4 0
ASGNP4
ADDRLP4 1004
INDIRP4
ARGP4
ADDRLP4 1004
INDIRP4
ARGP4
ADDRLP4 1000
INDIRP4
CNSTI4 10324
ADDP4
ARGP4
ADDRLP4 1000
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
line 3814
;3814:	if (bsptrace.fraction < 1 && bsptrace.ent != attackentity)
ADDRLP4 704+8
INDIRF4
CNSTF4 1065353216
GEF4 $2221
ADDRLP4 704+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $2221
line 3815
;3815:		return;
ADDRGP4 $2181
JUMPV
LABELV $2221
line 3818
;3816:
;3817:	//get the weapon info
;3818:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 10640
ADDP4
INDIRI4
ARGI4
ADDRLP4 1008
INDIRP4
CNSTI4 10664
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3820
;3819:	//get the start point shooting from
;3820:	VectorCopy(bs->origin, start);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
INDIRB
ASGNB 12
line 3821
;3821:	start[2] += bs->cur_ps.viewheight;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3822
;3822:	AngleVectors(bs->viewangles, forward, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 676
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3823
;3823:	start[0] += forward[0] * wi.offset[0] + right[0] * wi.offset[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3824
;3824:	start[1] += forward[1] * wi.offset[0] + right[1] * wi.offset[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+4
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3825
;3825:	start[2] += forward[2] * wi.offset[0] + right[2] * wi.offset[1] + wi.offset[2];
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+8
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+292+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 3827
;3826:	//end point aiming at
;3827:	VectorMA(start, 1000, forward, end);
ADDRLP4 1012
CNSTF4 1148846080
ASGNF4
ADDRLP4 688
ADDRLP4 0
INDIRF4
ADDRLP4 1012
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 688+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1012
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 688+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1148846080
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3829
;3828:	//a little back to make sure not inside a very close enemy
;3829:	VectorMA(start, -12, forward, start);
ADDRLP4 1016
CNSTF4 3242196992
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 1016
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1016
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3242196992
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3830
;3830:	BotAI_Trace(&trace, start, mins, maxs, end, bs->entitynum, MASK_SHOT);
ADDRLP4 592
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 948
ARGP4
ADDRLP4 960
ARGP4
ADDRLP4 688
ARGP4
ADDRFP4 0
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
line 3832
;3831:	//if the entity is a client
;3832:	if (trace.ent >= 0 && trace.ent < MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
CNSTI4 0
LTI4 $2255
ADDRLP4 592+80
INDIRI4
CNSTI4 256
GEI4 $2255
line 3833
;3833:		if (trace.ent != attackentity) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $2259
line 3835
;3834:			//if a teammate is hit
;3835:			if (BotSameTeam(bs, trace.ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592+80
INDIRI4
ARGI4
ADDRLP4 1020
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1020
INDIRI4
CNSTI4 0
EQI4 $2262
line 3836
;3836:				return;
ADDRGP4 $2181
JUMPV
LABELV $2262
line 3837
;3837:		}
LABELV $2259
line 3838
;3838:	}
LABELV $2255
line 3840
;3839:	//if won't hit the enemy or not attacking a player (obelisk)
;3840:	if (trace.ent != attackentity || attackentity >= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
NEI4 $2268
ADDRLP4 576
INDIRI4
CNSTI4 256
LTI4 $2265
LABELV $2268
line 3842
;3841:		//if the projectile does radial damage
;3842:		if (wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 24+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2269
line 3843
;3843:			if (trace.fraction * 1000 < wi.proj.radius) {
CNSTF4 1148846080
ADDRLP4 592+8
INDIRF4
MULF4
ADDRLP4 24+344+172
INDIRF4
GEF4 $2273
line 3844
;3844:				points = (wi.proj.damage - 0.5 * trace.fraction * 1000) * 0.5;
ADDRLP4 1024
CNSTF4 1056964608
ASGNF4
ADDRLP4 972
ADDRLP4 1024
INDIRF4
ADDRLP4 24+344+168
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 1024
INDIRF4
ADDRLP4 592+8
INDIRF4
MULF4
MULF4
SUBF4
MULF4
ASGNF4
line 3845
;3845:				if (points > 0) {
ADDRLP4 972
INDIRF4
CNSTF4 0
LEF4 $2281
line 3846
;3846:					return;
ADDRGP4 $2181
JUMPV
LABELV $2281
line 3848
;3847:				}
;3848:			}
LABELV $2273
line 3850
;3849:			//FIXME: check if a teammate gets radial damage
;3850:		}
LABELV $2269
line 3851
;3851:	}
LABELV $2265
line 3853
;3852:	//if fire has to be release to activate weapon
;3853:	if (wi.flags & WFL_FIRERELEASED) {
ADDRLP4 24+176
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2283
line 3854
;3854:		if (bs->flags & BFL_ATTACKED) {
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2284
line 3855
;3855:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3856
;3856:		}
line 3857
;3857:	}
ADDRGP4 $2284
JUMPV
LABELV $2283
line 3858
;3858:	else {
line 3859
;3859:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3860
;3860:	}
LABELV $2284
line 3861
;3861:	bs->flags ^= BFL_ATTACKED;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
ASGNP4
ADDRLP4 1024
INDIRP4
ADDRLP4 1024
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 3862
;3862:}
LABELV $2181
endproc BotCheckAttack 1028 28
lit
align 4
LABELV $2294
byte 4 1143930880
byte 4 1129054208
byte 4 1143472128
align 4
LABELV $2295
byte 4 1148256256
byte 4 1139408896
byte 4 1143603200
align 4
LABELV $2296
byte 4 1134034944
byte 4 1135607808
byte 4 1147535360
export BotMapScripts
code
proc BotMapScripts 1424 16
line 3869
;3863:
;3864:/*
;3865:==================
;3866:BotMapScripts
;3867:==================
;3868:*/
;3869:void BotMapScripts(bot_state_t *bs) {
line 3877
;3870:	char info[1024];
;3871:	char mapname[128];
;3872:	int i, shootbutton;
;3873:	float aim_accuracy;
;3874:	aas_entityinfo_t entinfo;
;3875:	vec3_t dir;
;3876:
;3877:	trap_GetServerinfo(info, sizeof(info));
ADDRLP4 272
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 3879
;3878:
;3879:	strncpy(mapname, Info_ValueForKey( info, "mapname" ), sizeof(mapname)-1);
ADDRLP4 272
ARGP4
ADDRGP4 $2289
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 144
ARGP4
ADDRLP4 1316
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 3880
;3880:	mapname[sizeof(mapname)-1] = '\0';
ADDRLP4 144+127
CNSTI1 0
ASGNI1
line 3882
;3881:
;3882:	if (!Q_stricmp(mapname, "q3tourney6")) {
ADDRLP4 144
ARGP4
ADDRGP4 $2293
ARGP4
ADDRLP4 1320
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1320
INDIRI4
CNSTI4 0
NEI4 $2291
line 3883
;3883:		vec3_t mins = {700, 204, 672}, maxs = {964, 468, 680};
ADDRLP4 1324
ADDRGP4 $2294
INDIRB
ASGNB 12
ADDRLP4 1336
ADDRGP4 $2295
INDIRB
ASGNB 12
line 3884
;3884:		vec3_t buttonorg = {304, 352, 920};
ADDRLP4 1348
ADDRGP4 $2296
INDIRB
ASGNB 12
line 3886
;3885:		//NOTE: NEVER use the func_bobbing in q3tourney6
;3886:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 1360
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 1360
INDIRP4
ADDRLP4 1360
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3888
;3887:		//if the bot is below the bounding box
;3888:		if (bs->origin[0] > mins[0] && bs->origin[0] < maxs[0]) {
ADDRLP4 1364
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1364
INDIRF4
ADDRLP4 1324
INDIRF4
LEF4 $2297
ADDRLP4 1364
INDIRF4
ADDRLP4 1336
INDIRF4
GEF4 $2297
line 3889
;3889:			if (bs->origin[1] > mins[1] && bs->origin[1] < maxs[1]) {
ADDRLP4 1368
ADDRFP4 0
INDIRP4
CNSTI4 5944
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1368
INDIRF4
ADDRLP4 1324+4
INDIRF4
LEF4 $2299
ADDRLP4 1368
INDIRF4
ADDRLP4 1336+4
INDIRF4
GEF4 $2299
line 3890
;3890:				if (bs->origin[2] < mins[2]) {
ADDRFP4 0
INDIRP4
CNSTI4 5948
ADDP4
INDIRF4
ADDRLP4 1324+8
INDIRF4
GEF4 $2303
line 3891
;3891:					return;
ADDRGP4 $2288
JUMPV
LABELV $2303
line 3893
;3892:				}
;3893:			}
LABELV $2299
line 3894
;3894:		}
LABELV $2297
line 3895
;3895:		shootbutton = qfalse;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 3897
;3896:		//if an enemy is below this bounding box then shoot the button
;3897:		for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $2309
JUMPV
LABELV $2306
line 3899
;3898:
;3899:			if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2310
ADDRGP4 $2307
JUMPV
LABELV $2310
line 3901
;3900:			//
;3901:			BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3903
;3902:			//
;3903:			if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2312
ADDRGP4 $2307
JUMPV
LABELV $2312
line 3905
;3904:			//if the enemy isn't dead and the enemy isn't the bot self
;3905:			if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 1368
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 1368
INDIRI4
CNSTI4 0
NEI4 $2317
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $2314
LABELV $2317
ADDRGP4 $2307
JUMPV
LABELV $2314
line 3907
;3906:			//
;3907:			if (entinfo.origin[0] > mins[0] && entinfo.origin[0] < maxs[0]) {
ADDRLP4 0+24
INDIRF4
ADDRLP4 1324
INDIRF4
LEF4 $2318
ADDRLP4 0+24
INDIRF4
ADDRLP4 1336
INDIRF4
GEF4 $2318
line 3908
;3908:				if (entinfo.origin[1] > mins[1] && entinfo.origin[1] < maxs[1]) {
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1324+4
INDIRF4
LEF4 $2322
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1336+4
INDIRF4
GEF4 $2322
line 3909
;3909:					if (entinfo.origin[2] < mins[2]) {
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 1324+8
INDIRF4
GEF4 $2330
line 3911
;3910:						//if there's a team mate below the crusher
;3911:						if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 1372
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1372
INDIRI4
CNSTI4 0
EQI4 $2335
line 3912
;3912:							shootbutton = qfalse;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 3913
;3913:							break;
ADDRGP4 $2308
JUMPV
LABELV $2335
line 3915
;3914:						}
;3915:						else {
line 3916
;3916:							shootbutton = qtrue;
ADDRLP4 1296
CNSTI4 1
ASGNI4
line 3917
;3917:						}
line 3918
;3918:					}
LABELV $2330
line 3919
;3919:				}
LABELV $2322
line 3920
;3920:			}
LABELV $2318
line 3921
;3921:		}
LABELV $2307
line 3897
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2309
ADDRLP4 140
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $2337
ADDRLP4 140
INDIRI4
CNSTI4 256
LTI4 $2306
LABELV $2337
LABELV $2308
line 3922
;3922:		if (shootbutton) {
ADDRLP4 1296
INDIRI4
CNSTI4 0
EQI4 $2292
line 3923
;3923:			bs->flags |= BFL_IDEALVIEWSET;
ADDRLP4 1372
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
ASGNP4
ADDRLP4 1372
INDIRP4
ADDRLP4 1372
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 3924
;3924:			VectorSubtract(buttonorg, bs->eye, dir);
ADDRLP4 1376
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1300
ADDRLP4 1348
INDIRF4
ADDRLP4 1376
INDIRP4
CNSTI4 5968
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1300+4
ADDRLP4 1348+4
INDIRF4
ADDRLP4 1376
INDIRP4
CNSTI4 5972
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1300+8
ADDRLP4 1348+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3925
;3925:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 1300
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3926
;3926:			aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1380
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 1312
ADDRLP4 1380
INDIRF4
ASGNF4
line 3927
;3927:			bs->ideal_viewangles[PITCH] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 1384
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1388
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ASGNP4
ADDRLP4 1388
INDIRP4
ADDRLP4 1388
INDIRP4
INDIRF4
CNSTF4 1090519040
CNSTF4 1073741824
ADDRLP4 1384
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 1312
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3928
;3928:			bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 1392
ADDRFP4 0
INDIRP4
CNSTI4 10680
ADDP4
ASGNP4
ADDRLP4 1392
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1396
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1392
INDIRP4
ADDRLP4 1396
INDIRF4
ASGNF4
line 3929
;3929:			bs->ideal_viewangles[YAW] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 1400
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1404
ADDRFP4 0
INDIRP4
CNSTI4 10684
ADDP4
ASGNP4
ADDRLP4 1404
INDIRP4
ADDRLP4 1404
INDIRP4
INDIRF4
CNSTF4 1090519040
CNSTF4 1073741824
ADDRLP4 1400
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 1312
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3930
;3930:			bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 1408
ADDRFP4 0
INDIRP4
CNSTI4 10684
ADDP4
ASGNP4
ADDRLP4 1408
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1412
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1408
INDIRP4
ADDRLP4 1412
INDIRF4
ASGNF4
line 3932
;3931:			//
;3932:			if (InFieldOfVision(bs->viewangles, 20, bs->ideal_viewangles)) {
ADDRLP4 1416
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1416
INDIRP4
CNSTI4 10668
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 1416
INDIRP4
CNSTI4 10680
ADDP4
ARGP4
ADDRLP4 1420
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 1420
INDIRI4
CNSTI4 0
EQI4 $2292
line 3933
;3933:				trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3934
;3934:			}
line 3935
;3935:		}
line 3936
;3936:	}
ADDRGP4 $2292
JUMPV
LABELV $2291
line 3937
;3937:	else if (!Q_stricmp(mapname, "mpq3tourney6")) {
ADDRLP4 144
ARGP4
ADDRGP4 $2348
ARGP4
ADDRLP4 1324
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
NEI4 $2346
line 3939
;3938:		//NOTE: NEVER use the func_bobbing in mpq3tourney6
;3939:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 1328
ADDRFP4 0
INDIRP4
CNSTI4 10080
ADDP4
ASGNP4
ADDRLP4 1328
INDIRP4
ADDRLP4 1328
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3940
;3940:	}
LABELV $2346
LABELV $2292
line 3941
;3941:}
LABELV $2288
endproc BotMapScripts 1424 16
data
align 4
LABELV VEC_UP
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV MOVEDIR_UP
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV VEC_DOWN
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV MOVEDIR_DOWN
byte 4 0
byte 4 0
byte 4 3212836864
export BotSetMovedir
code
proc BotSetMovedir 12 16
line 3954
;3942:
;3943:/*
;3944:==================
;3945:BotSetMovedir
;3946:==================
;3947:*/
;3948:// bk001205 - made these static
;3949:static vec3_t VEC_UP		= {0, -1,  0};
;3950:static vec3_t MOVEDIR_UP	= {0,  0,  1};
;3951:static vec3_t VEC_DOWN		= {0, -2,  0};
;3952:static vec3_t MOVEDIR_DOWN	= {0,  0, -1};
;3953:
;3954:void BotSetMovedir(vec3_t angles, vec3_t movedir) {
line 3955
;3955:	if (VectorCompare(angles, VEC_UP)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_UP
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2350
line 3956
;3956:		VectorCopy(MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_UP
INDIRB
ASGNB 12
line 3957
;3957:	}
ADDRGP4 $2351
JUMPV
LABELV $2350
line 3958
;3958:	else if (VectorCompare(angles, VEC_DOWN)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_DOWN
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2352
line 3959
;3959:		VectorCopy(MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_DOWN
INDIRB
ASGNB 12
line 3960
;3960:	}
ADDRGP4 $2353
JUMPV
LABELV $2352
line 3961
;3961:	else {
line 3962
;3962:		AngleVectors(angles, movedir, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3963
;3963:	}
LABELV $2353
LABELV $2351
line 3964
;3964:}
LABELV $2349
endproc BotSetMovedir 12 16
export BotModelMinsMaxs
proc BotModelMinsMaxs 40 0
line 3973
;3965:
;3966:/*
;3967:==================
;3968:BotModelMinsMaxs
;3969:
;3970:this is ugly
;3971:==================
;3972:*/
;3973:int BotModelMinsMaxs(int modelindex, int eType, int contents, vec3_t mins, vec3_t maxs) {
line 3977
;3974:	gentity_t *ent;
;3975:	int i;
;3976:
;3977:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 3978
;3978:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2358
JUMPV
LABELV $2355
line 3979
;3979:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2360
line 3980
;3980:			continue;
ADDRGP4 $2356
JUMPV
LABELV $2360
line 3982
;3981:		}
;3982:		if ( eType && ent->s.eType != eType) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2362
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2362
line 3983
;3983:			continue;
ADDRGP4 $2356
JUMPV
LABELV $2362
line 3985
;3984:		}
;3985:		if ( contents && ent->r.contents != contents) {
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2364
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $2364
line 3986
;3986:			continue;
ADDRGP4 $2356
JUMPV
LABELV $2364
line 3988
;3987:		}
;3988:		if (ent->s.modelindex == modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2366
line 3989
;3989:			if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2368
line 3990
;3990:				VectorAdd(ent->r.currentOrigin, ent->r.mins, mins);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $2368
line 3991
;3991:			if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2370
line 3992
;3992:				VectorAdd(ent->r.currentOrigin, ent->r.maxs, maxs);
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $2370
line 3993
;3993:			return i;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $2354
JUMPV
LABELV $2366
line 3995
;3994:		}
;3995:	}
LABELV $2356
line 3978
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $2358
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2355
line 3996
;3996:	if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2372
line 3997
;3997:		VectorClear(mins);
ADDRLP4 8
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
LABELV $2372
line 3998
;3998:	if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2374
line 3999
;3999:		VectorClear(maxs);
ADDRLP4 16
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
LABELV $2374
line 4000
;4000:	return 0;
CNSTI4 0
RETI4
LABELV $2354
endproc BotModelMinsMaxs 40 0
lit
align 4
LABELV $2377
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $2378
byte 4 3212836864
byte 4 3212836864
byte 4 3212836864
export BotFuncButtonActivateGoal
code
proc BotFuncButtonActivateGoal 648 28
line 4008
;4001:}
;4002:
;4003:/*
;4004:==================
;4005:BotFuncButtonGoal
;4006:==================
;4007:*/
;4008:int BotFuncButtonActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 4014
;4009:	int i, areas[10], numareas, modelindex, entitynum;
;4010:	char model[128];
;4011:	float lip, dist, health, angle;
;4012:	vec3_t size, start, end, mins, maxs, angles, points[10];
;4013:	vec3_t movedir, origin, goalorigin, bboxmins, bboxmaxs;
;4014:	vec3_t extramins = {1, 1, 1}, extramaxs = {-1, -1, -1};
ADDRLP4 304
ADDRGP4 $2377
INDIRB
ASGNB 12
ADDRLP4 316
ADDRGP4 $2378
INDIRB
ASGNB 12
line 4017
;4015:	bsp_trace_t bsptrace;
;4016:
;4017:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 4018
;4018:	VectorClear(activategoal->target);
ADDRLP4 560
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 564
CNSTF4 0
ASGNF4
ADDRLP4 560
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 564
INDIRF4
ASGNF4
ADDRLP4 560
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 564
INDIRF4
ASGNF4
ADDRLP4 560
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 564
INDIRF4
ASGNF4
line 4020
;4019:	//create a bot goal towards the button
;4020:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $592
ARGP4
ADDRLP4 160
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4021
;4021:	if (!*model)
ADDRLP4 160
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2379
line 4022
;4022:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2379
line 4023
;4023:	modelindex = atoi(model+1);
ADDRLP4 160+1
ARGP4
ADDRLP4 568
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 288
ADDRLP4 568
INDIRI4
ASGNI4
line 4024
;4024:	if (!modelindex)
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $2382
line 4025
;4025:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2382
line 4026
;4026:	VectorClear(angles);
ADDRLP4 572
CNSTF4 0
ASGNF4
ADDRLP4 96+8
ADDRLP4 572
INDIRF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 572
INDIRF4
ASGNF4
ADDRLP4 96
ADDRLP4 572
INDIRF4
ASGNF4
line 4027
;4027:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 288
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 576
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 344
ADDRLP4 576
INDIRI4
ASGNI4
line 4029
;4028:	//get the lip of the button
;4029:	trap_AAS_FloatForBSPEpairKey(bspent, "lip", &lip);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2386
ARGP4
ADDRLP4 328
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 4030
;4030:	if (!lip) lip = 4;
ADDRLP4 328
INDIRF4
CNSTF4 0
NEF4 $2387
ADDRLP4 328
CNSTF4 1082130432
ASGNF4
LABELV $2387
line 4032
;4031:	//get the move direction from the angle
;4032:	trap_AAS_FloatForBSPEpairKey(bspent, "angle", &angle);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2389
ARGP4
ADDRLP4 352
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 4033
;4033:	VectorSet(angles, 0, angle, 0);
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRLP4 96+4
ADDRLP4 352
INDIRF4
ASGNF4
ADDRLP4 96+8
CNSTF4 0
ASGNF4
line 4034
;4034:	BotSetMovedir(angles, movedir);
ADDRLP4 96
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BotSetMovedir
CALLV
pop
line 4036
;4035:	//button size
;4036:	VectorSubtract(maxs, mins, size);
ADDRLP4 112
ADDRLP4 84
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 72+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 72+8
INDIRF4
SUBF4
ASGNF4
line 4038
;4037:	//button origin
;4038:	VectorAdd(mins, maxs, origin);
ADDRLP4 16
ADDRLP4 72
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 72+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 72+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 4039
;4039:	VectorScale(origin, 0.5, origin);
ADDRLP4 580
CNSTF4 1056964608
ASGNF4
ADDRLP4 16
ADDRLP4 580
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 580
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1056964608
ADDRLP4 16+8
INDIRF4
MULF4
ASGNF4
line 4041
;4040:	//touch distance of the button
;4041:	dist = fabs(movedir[0]) * size[0] + fabs(movedir[1]) * size[1] + fabs(movedir[2]) * size[2];
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 584
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+4
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+8
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 584
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDRLP4 588
INDIRF4
ADDRLP4 112+4
INDIRF4
MULF4
ADDF4
ADDRLP4 592
INDIRF4
ADDRLP4 112+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4042
;4042:	dist *= 0.5;
ADDRLP4 28
CNSTF4 1056964608
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 4044
;4043:	//
;4044:	trap_AAS_FloatForBSPEpairKey(bspent, "health", &health);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $2412
ARGP4
ADDRLP4 348
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 4046
;4045:	//if the button is shootable
;4046:	if (health) {
ADDRLP4 348
INDIRF4
CNSTF4 0
EQF4 $2413
line 4048
;4047:		//calculate the shoot target
;4048:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 596
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 4050
;4049:		//
;4050:		VectorCopy(goalorigin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 4051
;4051:		activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 4053
;4052:		//
;4053:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, goalorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 356
ARGP4
ADDRLP4 600
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 600
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 604
CNSTP4 0
ASGNP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 600
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
line 4055
;4054:		// if the button is visible from the current position
;4055:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == entitynum) {
ADDRLP4 356+8
INDIRF4
CNSTF4 1065353216
GEF4 $2425
ADDRLP4 356+80
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $2421
LABELV $2425
line 4057
;4056:			//
;4057:			activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable button
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 4058
;4058:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4059
;4059:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4060
;4060:			VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
INDIRB
ASGNB 12
line 4061
;4061:			activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ASGNI4
line 4062
;4062:			VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 4063
;4063:			VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 4065
;4064:			//
;4065:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2421
line 4067
;4066:		}
;4067:		else {
line 4070
;4068:			//create a goal from where the button is visible and shoot at the button from there
;4069:			//add bounding box size to the dist
;4070:			trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 4071
;4071:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2426
line 4072
;4072:				if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2430
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 612
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 608
INDIRF4
ADDRLP4 612
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2431
JUMPV
LABELV $2430
line 4073
;4073:				else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 616
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 620
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 616
INDIRF4
ADDRLP4 620
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2431
line 4074
;4074:			}
LABELV $2427
line 4071
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2426
line 4076
;4075:			//calculate the goal origin
;4076:			VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 608
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 4078
;4077:			//
;4078:			VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 4079
;4079:			start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 4080
;4080:			VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 4081
;4081:			end[2] -= 512;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1140850688
SUBF4
ASGNF4
line 4082
;4082:			numareas = trap_AAS_TraceAreas(start, end, areas, points, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 440
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 612
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 612
INDIRI4
ASGNI4
line 4084
;4083:			//
;4084:			for (i = numareas-1; i >= 0; i--) {
ADDRLP4 0
ADDRLP4 108
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $2443
JUMPV
LABELV $2440
line 4085
;4085:				if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 616
INDIRI4
CNSTI4 0
EQI4 $2444
line 4086
;4086:					break;
ADDRGP4 $2442
JUMPV
LABELV $2444
line 4088
;4087:				}
;4088:			}
LABELV $2441
line 4084
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2443
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2440
LABELV $2442
line 4089
;4089:			if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $2446
line 4091
;4090:				// FIXME: trace forward and maybe in other directions to find a valid area
;4091:			}
LABELV $2446
line 4092
;4092:			if (i >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $2448
line 4094
;4093:				//
;4094:				VectorCopy(points[i], activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 440
ADDP4
INDIRB
ASGNB 12
line 4095
;4095:				activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 4096
;4096:				VectorSet(activategoal->goal.mins, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
line 4097
;4097:				VectorSet(activategoal->goal.maxs, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3238002688
ASGNF4
line 4099
;4098:				//
;4099:				for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2450
line 4100
;4100:				{
line 4101
;4101:					if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2454
ADDRLP4 616
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 616
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 620
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 624
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 628
ADDRLP4 616
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 628
INDIRP4
ADDRLP4 628
INDIRP4
INDIRF4
ADDRLP4 620
INDIRF4
ADDRLP4 624
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2455
JUMPV
LABELV $2454
line 4102
;4102:					else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 632
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 632
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 636
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 640
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 644
ADDRLP4 632
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 644
INDIRP4
ADDRLP4 644
INDIRP4
INDIRF4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2455
line 4103
;4103:				} //end for
LABELV $2451
line 4099
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2450
line 4105
;4104:				//
;4105:				activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 4106
;4106:				activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4107
;4107:				activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4108
;4108:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2448
line 4110
;4109:			}
;4110:		}
line 4111
;4111:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2413
line 4113
;4112:	}
;4113:	else {
line 4115
;4114:		//add bounding box size to the dist
;4115:		trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 4116
;4116:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2456
line 4117
;4117:			if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2460
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 596
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 600
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 596
INDIRF4
ADDRLP4 600
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2461
JUMPV
LABELV $2460
line 4118
;4118:			else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 604
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2461
line 4119
;4119:		}
LABELV $2457
line 4116
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2456
line 4121
;4120:		//calculate the goal origin
;4121:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 596
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 4123
;4122:		//
;4123:		VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 4124
;4124:		start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 4125
;4125:		VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 4126
;4126:		end[2] -= 100;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 4127
;4127:		numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 600
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 600
INDIRI4
ASGNI4
line 4129
;4128:		//
;4129:		for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2473
JUMPV
LABELV $2470
line 4130
;4130:			if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 604
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 604
INDIRI4
CNSTI4 0
EQI4 $2474
line 4131
;4131:				break;
ADDRGP4 $2472
JUMPV
LABELV $2474
line 4133
;4132:			}
;4133:		}
LABELV $2471
line 4129
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2473
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $2470
LABELV $2472
line 4134
;4134:		if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $2476
line 4136
;4135:			//
;4136:			VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 4137
;4137:			activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 4138
;4138:			VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 4139
;4139:			VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 84
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 84+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 84+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 4141
;4140:			//
;4141:			for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2486
line 4142
;4142:			{
line 4143
;4143:				if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $2490
ADDRLP4 604
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 604
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 612
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 616
ADDRLP4 604
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 616
INDIRP4
ADDRLP4 616
INDIRP4
INDIRF4
ADDRLP4 608
INDIRF4
ADDRLP4 612
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $2491
JUMPV
LABELV $2490
line 4144
;4144:				else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 620
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 620
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 624
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 628
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 632
ADDRLP4 620
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 632
INDIRP4
ADDRLP4 632
INDIRP4
INDIRF4
ADDRLP4 624
INDIRF4
ADDRLP4 628
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $2491
line 4145
;4145:			} //end for
LABELV $2487
line 4141
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2486
line 4147
;4146:			//
;4147:			activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 4148
;4148:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4149
;4149:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4150
;4150:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2476
line 4152
;4151:		}
;4152:	}
line 4153
;4153:	return qfalse;
CNSTI4 0
RETI4
LABELV $2376
endproc BotFuncButtonActivateGoal 648 28
export BotFuncDoorActivateGoal
proc BotFuncDoorActivateGoal 1096 20
line 4161
;4154:}
;4155:
;4156:/*
;4157:==================
;4158:BotFuncDoorGoal
;4159:==================
;4160:*/
;4161:int BotFuncDoorActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 4167
;4162:	int modelindex, entitynum;
;4163:	char model[MAX_INFO_STRING];
;4164:	vec3_t mins, maxs, origin, angles;
;4165:
;4166:	//shoot at the shootable door
;4167:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $592
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4168
;4168:	if (!*model)
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2493
line 4169
;4169:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2492
JUMPV
LABELV $2493
line 4170
;4170:	modelindex = atoi(model+1);
ADDRLP4 12+1
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1080
INDIRI4
ASGNI4
line 4171
;4171:	if (!modelindex)
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2496
line 4172
;4172:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2492
JUMPV
LABELV $2496
line 4173
;4173:	VectorClear(angles);
ADDRLP4 1084
CNSTF4 0
ASGNF4
ADDRLP4 1064+8
ADDRLP4 1084
INDIRF4
ASGNF4
ADDRLP4 1064+4
ADDRLP4 1084
INDIRF4
ASGNF4
ADDRLP4 1064
ADDRLP4 1084
INDIRF4
ASGNF4
line 4174
;4174:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 1060
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1088
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 1076
ADDRLP4 1088
INDIRI4
ASGNI4
line 4176
;4175:	//door origin
;4176:	VectorAdd(mins, maxs, origin);
ADDRLP4 0
ADDRLP4 1036
INDIRF4
ADDRLP4 1048
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1036+4
INDIRF4
ADDRLP4 1048+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 1036+8
INDIRF4
ADDRLP4 1048+8
INDIRF4
ADDF4
ASGNF4
line 4177
;4177:	VectorScale(origin, 0.5, origin);
ADDRLP4 1092
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 1092
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1092
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 4178
;4178:	VectorCopy(origin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 4179
;4179:	activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 4181
;4180:	//
;4181:	activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable door
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 4182
;4182:	activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4183
;4183:	activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4184
;4184:	VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
INDIRB
ASGNB 12
line 4185
;4185:	activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ASGNI4
line 4186
;4186:	VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 4187
;4187:	VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 4188
;4188:	return qtrue;
CNSTI4 1
RETI4
LABELV $2492
endproc BotFuncDoorActivateGoal 1096 20
export BotTriggerMultipleActivateGoal
proc BotTriggerMultipleActivateGoal 300 20
line 4196
;4189:}
;4190:
;4191:/*
;4192:==================
;4193:BotTriggerMultipleGoal
;4194:==================
;4195:*/
;4196:int BotTriggerMultipleActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 4202
;4197:	int i, areas[10], numareas, modelindex, entitynum;
;4198:	char model[128];
;4199:	vec3_t start, end, mins, maxs, angles;
;4200:	vec3_t origin, goalorigin;
;4201:
;4202:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 4203
;4203:	VectorClear(activategoal->target);
ADDRLP4 268
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 272
INDIRF4
ASGNF4
line 4205
;4204:	//create a bot goal towards the trigger
;4205:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $592
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4206
;4206:	if (!*model)
ADDRLP4 84
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2511
line 4207
;4207:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2510
JUMPV
LABELV $2511
line 4208
;4208:	modelindex = atoi(model+1);
ADDRLP4 84+1
ARGP4
ADDRLP4 276
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 224
ADDRLP4 276
INDIRI4
ASGNI4
line 4209
;4209:	if (!modelindex)
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $2514
line 4210
;4210:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2510
JUMPV
LABELV $2514
line 4211
;4211:	VectorClear(angles);
ADDRLP4 280
CNSTF4 0
ASGNF4
ADDRLP4 240+8
ADDRLP4 280
INDIRF4
ASGNF4
ADDRLP4 240+4
ADDRLP4 280
INDIRF4
ASGNF4
ADDRLP4 240
ADDRLP4 280
INDIRF4
ASGNF4
line 4212
;4212:	entitynum = BotModelMinsMaxs(modelindex, 0, CONTENTS_TRIGGER, mins, maxs);
ADDRLP4 224
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1073741824
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 284
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 264
ADDRLP4 284
INDIRI4
ASGNI4
line 4214
;4213:	//trigger origin
;4214:	VectorAdd(mins, maxs, origin);
ADDRLP4 4
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
ADDF4
ASGNF4
line 4215
;4215:	VectorScale(origin, 0.5, origin);
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 288
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 288
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1056964608
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 4216
;4216:	VectorCopy(origin, goalorigin);
ADDRLP4 252
ADDRLP4 4
INDIRB
ASGNB 12
line 4218
;4217:	//
;4218:	VectorCopy(goalorigin, start);
ADDRLP4 212
ADDRLP4 252
INDIRB
ASGNB 12
line 4219
;4219:	start[2] += 24;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 4220
;4220:	VectorCopy(start, end);
ADDRLP4 228
ADDRLP4 212
INDIRB
ASGNB 12
line 4221
;4221:	end[2] -= 100;
ADDRLP4 228+8
ADDRLP4 228+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 4222
;4222:	numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 212
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 292
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 292
INDIRI4
ASGNI4
line 4224
;4223:	//
;4224:	for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2533
JUMPV
LABELV $2530
line 4225
;4225:		if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $2534
line 4226
;4226:			break;
ADDRGP4 $2532
JUMPV
LABELV $2534
line 4228
;4227:		}
;4228:	}
LABELV $2531
line 4224
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2533
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2530
LABELV $2532
line 4229
;4229:	if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $2536
line 4230
;4230:		VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 4231
;4231:		activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ASGNI4
line 4232
;4232:		VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 60
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 60+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 4233
;4233:		VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 4235
;4234:		//
;4235:		activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 4236
;4236:		activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4237
;4237:		activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4238
;4238:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2510
JUMPV
LABELV $2536
line 4240
;4239:	}
;4240:	return qfalse;
CNSTI4 0
RETI4
LABELV $2510
endproc BotTriggerMultipleActivateGoal 300 20
export BotPopFromActivateGoalStack
proc BotPopFromActivateGoalStack 4 8
line 4248
;4241:}
;4242:
;4243:/*
;4244:==================
;4245:BotPopFromActivateGoalStack
;4246:==================
;4247:*/
;4248:int BotPopFromActivateGoalStack(bot_state_t *bs) {
line 4249
;4249:	if (!bs->activatestack)
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2547
line 4250
;4250:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2546
JUMPV
LABELV $2547
line 4251
;4251:	BotEnableActivateGoalAreas(bs->activatestack, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4252
;4252:	bs->activatestack->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 0
ASGNI4
line 4253
;4253:	bs->activatestack->justused_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4254
;4254:	bs->activatestack = bs->activatestack->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
line 4255
;4255:	return qtrue;
CNSTI4 1
RETI4
LABELV $2546
endproc BotPopFromActivateGoalStack 4 8
export BotPushOntoActivateGoalStack
proc BotPushOntoActivateGoalStack 24 12
line 4263
;4256:}
;4257:
;4258:/*
;4259:==================
;4260:BotPushOntoActivateGoalStack
;4261:==================
;4262:*/
;4263:int BotPushOntoActivateGoalStack(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4267
;4264:	int i, best;
;4265:	float besttime;
;4266:
;4267:	best = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 4268
;4268:	besttime = FloatTime() + 9999;
ADDRLP4 4
ADDRGP4 floattime
INDIRF4
CNSTF4 1176255488
ADDF4
ASGNF4
line 4270
;4269:	//
;4270:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2550
line 4271
;4271:		if (!bs->activategoalheap[i].inuse) {
CNSTI4 244
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 11224
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2554
line 4272
;4272:			if (bs->activategoalheap[i].justused_time < besttime) {
CNSTI4 244
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 11224
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $2556
line 4273
;4273:				besttime = bs->activategoalheap[i].justused_time;
ADDRLP4 4
CNSTI4 244
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 11224
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ASGNF4
line 4274
;4274:				best = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4275
;4275:			}
LABELV $2556
line 4276
;4276:		}
LABELV $2554
line 4277
;4277:	}
LABELV $2551
line 4270
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $2550
line 4278
;4278:	if (best != -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $2558
line 4279
;4279:		memcpy(&bs->activategoalheap[best], activategoal, sizeof(bot_activategoal_t));
ADDRLP4 12
CNSTI4 244
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 11224
ADDP4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4280
;4280:		bs->activategoalheap[best].inuse = qtrue;
CNSTI4 244
ADDRLP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 11224
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4281
;4281:		bs->activategoalheap[best].next = bs->activatestack;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 244
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 11224
ADDP4
ADDP4
CNSTI4 240
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
ASGNP4
line 4282
;4282:		bs->activatestack = &bs->activategoalheap[best];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 11220
ADDP4
CNSTI4 244
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
CNSTI4 11224
ADDP4
ADDP4
ASGNP4
line 4283
;4283:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2549
JUMPV
LABELV $2558
line 4285
;4284:	}
;4285:	return qfalse;
CNSTI4 0
RETI4
LABELV $2549
endproc BotPushOntoActivateGoalStack 24 12
export BotClearActivateGoalStack
proc BotClearActivateGoalStack 0 4
line 4293
;4286:}
;4287:
;4288:/*
;4289:==================
;4290:BotClearActivateGoalStack
;4291:==================
;4292:*/
;4293:void BotClearActivateGoalStack(bot_state_t *bs) {
ADDRGP4 $2562
JUMPV
LABELV $2561
line 4295
;4294:	while(bs->activatestack)
;4295:		BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
LABELV $2562
line 4294
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2561
line 4296
;4296:}
LABELV $2560
endproc BotClearActivateGoalStack 0 4
export BotEnableActivateGoalAreas
proc BotEnableActivateGoalAreas 12 8
line 4303
;4297:
;4298:/*
;4299:==================
;4300:BotEnableActivateGoalAreas
;4301:==================
;4302:*/
;4303:void BotEnableActivateGoalAreas(bot_activategoal_t *activategoal, int enable) {
line 4306
;4304:	int i;
;4305:
;4306:	if (activategoal->areasdisabled == !enable)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2568
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $2569
JUMPV
LABELV $2568
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2569
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $2565
line 4307
;4307:		return;
ADDRGP4 $2564
JUMPV
LABELV $2565
line 4308
;4308:	for (i = 0; i < activategoal->numareas; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2573
JUMPV
LABELV $2570
line 4309
;4309:		trap_AAS_EnableRoutingArea( activategoal->areas[i], enable );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_AAS_EnableRoutingArea
CALLI4
pop
LABELV $2571
line 4308
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2573
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
LTI4 $2570
line 4310
;4310:	activategoal->areasdisabled = !enable;
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2575
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $2576
JUMPV
LABELV $2575
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2576
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4311
;4311:}
LABELV $2564
endproc BotEnableActivateGoalAreas 12 8
export BotIsGoingToActivateEntity
proc BotIsGoingToActivateEntity 8 0
line 4318
;4312:
;4313:/*
;4314:==================
;4315:BotIsGoingToActivateEntity
;4316:==================
;4317:*/
;4318:int BotIsGoingToActivateEntity(bot_state_t *bs, int entitynum) {
line 4322
;4319:	bot_activategoal_t *a;
;4320:	int i;
;4321:
;4322:	for (a = bs->activatestack; a; a = a->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $2581
JUMPV
LABELV $2578
line 4323
;4323:		if (a->time < FloatTime())
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $2582
line 4324
;4324:			continue;
ADDRGP4 $2579
JUMPV
LABELV $2582
line 4325
;4325:		if (a->goal.entitynum == entitynum)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2584
line 4326
;4326:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2577
JUMPV
LABELV $2584
line 4327
;4327:	}
LABELV $2579
line 4322
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
LABELV $2581
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2578
line 4328
;4328:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2586
line 4329
;4329:		if (bs->activategoalheap[i].inuse)
CNSTI4 244
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 11224
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2590
line 4330
;4330:			continue;
ADDRGP4 $2587
JUMPV
LABELV $2590
line 4332
;4331:		//
;4332:		if (bs->activategoalheap[i].goal.entitynum == entitynum) {
CNSTI4 244
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 11224
ADDP4
ADDP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2592
line 4334
;4333:			// if the bot went for this goal less than 2 seconds ago
;4334:			if (bs->activategoalheap[i].justused_time > FloatTime() - 2)
CNSTI4 244
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 11224
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $2594
line 4335
;4335:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2577
JUMPV
LABELV $2594
line 4336
;4336:		}
LABELV $2592
line 4337
;4337:	}
LABELV $2587
line 4328
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $2586
line 4338
;4338:	return qfalse;
CNSTI4 0
RETI4
LABELV $2577
endproc BotIsGoingToActivateEntity 8 0
export BotGetActivateGoal
proc BotGetActivateGoal 3320 20
line 4351
;4339:}
;4340:
;4341:/*
;4342:==================
;4343:BotGetActivateGoal
;4344:
;4345:  returns the number of the bsp entity to activate
;4346:  goal->entitynum will be set to the game entity to activate
;4347:==================
;4348:*/
;4349://#define OBSTACLEDEBUG
;4350:
;4351:int BotGetActivateGoal(bot_state_t *bs, int entitynum, bot_activategoal_t *activategoal) {
line 4361
;4352:	int i, ent, cur_entities[10], spawnflags, modelindex, areas[MAX_ACTIVATEAREAS*2], numareas, t;
;4353:	char model[MAX_INFO_STRING], tmpmodel[128];
;4354:	char target[128], classname[128];
;4355:	float health;
;4356:	char targetname[10][128];
;4357:	aas_entityinfo_t entinfo;
;4358:	aas_areainfo_t areainfo;
;4359:	vec3_t origin, angles, absmins, absmaxs;
;4360:
;4361:	memset(activategoal, 0, sizeof(bot_activategoal_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4362
;4362:	BotEntityInfo(entitynum, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 3052
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4363
;4363:	Com_sprintf(model, sizeof( model ), "*%d", entinfo.modelindex);
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2597
ARGP4
ADDRLP4 3052+104
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4364
;4364:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 3252
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3252
INDIRI4
ASGNI4
ADDRGP4 $2602
JUMPV
LABELV $2599
line 4365
;4365:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", tmpmodel, sizeof(tmpmodel))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $592
ARGP4
ADDRLP4 1584
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3256
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3256
INDIRI4
CNSTI4 0
NEI4 $2603
ADDRGP4 $2600
JUMPV
LABELV $2603
line 4366
;4366:		if (!strcmp(model, tmpmodel)) break;
ADDRLP4 1712
ARGP4
ADDRLP4 1584
ARGP4
ADDRLP4 3260
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $2605
ADDRGP4 $2601
JUMPV
LABELV $2605
line 4367
;4367:	}
LABELV $2600
line 4364
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3256
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3256
INDIRI4
ASGNI4
LABELV $2602
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2599
LABELV $2601
line 4368
;4368:	if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2607
line 4369
;4369:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity found with model %s\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $2609
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4370
;4370:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2596
JUMPV
LABELV $2607
line 4372
;4371:	}
;4372:	trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2610
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4373
;4373:	if (!*classname) {
ADDRLP4 1456
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2611
line 4374
;4374:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model %s has no classname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $2613
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4375
;4375:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2596
JUMPV
LABELV $2611
line 4378
;4376:	}
;4377:	//if it is a door
;4378:	if (!strcmp(classname, "func_door")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2616
ARGP4
ADDRLP4 3260
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $2614
line 4379
;4379:		if (trap_AAS_FloatForBSPEpairKey(ent, "health", &health)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2412
ARGP4
ADDRLP4 3208
ARGP4
ADDRLP4 3264
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
EQI4 $2617
line 4381
;4380:			//if the door has health then the door must be shot to open
;4381:			if (health) {
ADDRLP4 3208
INDIRF4
CNSTF4 0
EQF4 $2619
line 4382
;4382:				BotFuncDoorActivateGoal(bs, ent, activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotFuncDoorActivateGoal
CALLI4
pop
line 4383
;4383:				return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2596
JUMPV
LABELV $2619
line 4385
;4384:			}
;4385:		}
LABELV $2617
line 4387
;4386:		//
;4387:		trap_AAS_IntForBSPEpairKey(ent, "spawnflags", &spawnflags);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2621
ARGP4
ADDRLP4 3204
ARGP4
ADDRGP4 trap_AAS_IntForBSPEpairKey
CALLI4
pop
line 4389
;4388:		// if the door starts open then just wait for the door to return
;4389:		if ( spawnflags & 1 )
ADDRLP4 3204
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2622
line 4390
;4390:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $2596
JUMPV
LABELV $2622
line 4392
;4391:		//get the door origin
;4392:		if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2626
ARGP4
ADDRLP4 3192
ARGP4
ADDRLP4 3268
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $2624
line 4393
;4393:			VectorClear(origin);
ADDRLP4 3272
CNSTF4 0
ASGNF4
ADDRLP4 3192+8
ADDRLP4 3272
INDIRF4
ASGNF4
ADDRLP4 3192+4
ADDRLP4 3272
INDIRF4
ASGNF4
ADDRLP4 3192
ADDRLP4 3272
INDIRF4
ASGNF4
line 4394
;4394:		}
LABELV $2624
line 4396
;4395:		//if the door is open or opening already
;4396:		if (!VectorCompare(origin, entinfo.origin))
ADDRLP4 3192
ARGP4
ADDRLP4 3052+24
ARGP4
ADDRLP4 3272
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $2629
line 4397
;4397:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $2596
JUMPV
LABELV $2629
line 4399
;4398:		// store all the areas the door is in
;4399:		trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $592
ARGP4
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4400
;4400:		if (*model) {
ADDRLP4 1712
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2632
line 4401
;4401:			modelindex = atoi(model+1);
ADDRLP4 1712+1
ARGP4
ADDRLP4 3276
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3212
ADDRLP4 3276
INDIRI4
ASGNI4
line 4402
;4402:			if (modelindex) {
ADDRLP4 3212
INDIRI4
CNSTI4 0
EQI4 $2635
line 4403
;4403:				VectorClear(angles);
ADDRLP4 3280
CNSTF4 0
ASGNF4
ADDRLP4 3216+8
ADDRLP4 3280
INDIRF4
ASGNF4
ADDRLP4 3216+4
ADDRLP4 3280
INDIRF4
ASGNF4
ADDRLP4 3216
ADDRLP4 3280
INDIRF4
ASGNF4
line 4404
;4404:				BotModelMinsMaxs(modelindex, ET_MOVER, 0, absmins, absmaxs);
ADDRLP4 3212
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 3228
ARGP4
ADDRLP4 3240
ARGP4
ADDRGP4 BotModelMinsMaxs
CALLI4
pop
line 4406
;4405:				//
;4406:				numareas = trap_AAS_BBoxAreas(absmins, absmaxs, areas, MAX_ACTIVATEAREAS*2);
ADDRLP4 3228
ARGP4
ADDRLP4 3240
ARGP4
ADDRLP4 2740
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 3284
ADDRGP4 trap_AAS_BBoxAreas
CALLI4
ASGNI4
ADDRLP4 3048
ADDRLP4 3284
INDIRI4
ASGNI4
line 4408
;4407:				// store the areas with reachabilities first
;4408:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $2642
JUMPV
LABELV $2639
line 4409
;4409:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $2643
line 4410
;4410:						break;
ADDRGP4 $2641
JUMPV
LABELV $2643
line 4411
;4411:					if ( !trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3288
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $2645
line 4412
;4412:						continue;
ADDRGP4 $2640
JUMPV
LABELV $2645
line 4414
;4413:					}
;4414:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4415
;4415:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2647
line 4416
;4416:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3296
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3292
ADDRLP4 3296
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3296
INDIRP4
ADDRLP4 3292
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3300
CNSTI4 2
ASGNI4
ADDRLP4 3292
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4417
;4417:					}
LABELV $2647
line 4418
;4418:				}
LABELV $2640
line 4408
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2642
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $2639
LABELV $2641
line 4420
;4419:				// store any remaining areas
;4420:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $2652
JUMPV
LABELV $2649
line 4421
;4421:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $2653
line 4422
;4422:						break;
ADDRGP4 $2651
JUMPV
LABELV $2653
line 4423
;4423:					if ( trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3288
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
EQI4 $2655
line 4424
;4424:						continue;
ADDRGP4 $2650
JUMPV
LABELV $2655
line 4426
;4425:					}
;4426:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4427
;4427:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2657
line 4428
;4428:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3296
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3292
ADDRLP4 3296
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3296
INDIRP4
ADDRLP4 3292
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3300
CNSTI4 2
ASGNI4
ADDRLP4 3292
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4429
;4429:					}
LABELV $2657
line 4430
;4430:				}
LABELV $2650
line 4420
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2652
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $2649
LABELV $2651
line 4431
;4431:			}
LABELV $2635
line 4432
;4432:		}
LABELV $2632
line 4433
;4433:	}
LABELV $2614
line 4435
;4434:	// if the bot is blocked by or standing on top of a button
;4435:	if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2661
ARGP4
ADDRLP4 3264
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
NEI4 $2659
line 4436
;4436:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2596
JUMPV
LABELV $2659
line 4439
;4437:	}
;4438:	// get the targetname so we can find an entity with a matching target
;4439:	if (!trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[0], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2664
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3268
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $2662
line 4440
;4440:		if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $2665
line 4441
;4441:			BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model \"%s\" has no targetname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $2668
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4442
;4442:		}
LABELV $2665
line 4443
;4443:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2596
JUMPV
LABELV $2662
line 4446
;4444:	}
;4445:	// allow tree-like activation
;4446:	cur_entities[0] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 1416
ADDRLP4 3272
INDIRI4
ASGNI4
line 4447
;4447:	for (i = 0; i >= 0 && i < 10;) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $2672
JUMPV
LABELV $2669
line 4448
;4448:		for (ent = cur_entities[i]; ent; ent = trap_AAS_NextBSPEntity(ent)) {
ADDRLP4 0
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2676
JUMPV
LABELV $2673
line 4449
;4449:			if (!trap_AAS_ValueForBSPEpairKey(ent, "target", target, sizeof(target))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2679
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3276
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 0
NEI4 $2677
ADDRGP4 $2674
JUMPV
LABELV $2677
line 4450
;4450:			if (!strcmp(targetname[i], target)) {
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 3280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $2680
line 4451
;4451:				cur_entities[i] = trap_AAS_NextBSPEntity(ent);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3284
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3284
INDIRI4
ASGNI4
line 4452
;4452:				break;
ADDRGP4 $2675
JUMPV
LABELV $2680
line 4454
;4453:			}
;4454:		}
LABELV $2674
line 4448
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3276
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3276
INDIRI4
ASGNI4
LABELV $2676
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2673
LABELV $2675
line 4455
;4455:		if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2682
line 4456
;4456:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $2684
line 4457
;4457:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity with target \"%s\"\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $2687
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4458
;4458:			}
LABELV $2684
line 4459
;4459:			i--;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4460
;4460:			continue;
ADDRGP4 $2670
JUMPV
LABELV $2682
line 4462
;4461:		}
;4462:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2610
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3280
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $2688
line 4463
;4463:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $2670
line 4464
;4464:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with target \"%s\" has no classname\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $2693
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4465
;4465:			}
line 4466
;4466:			continue;
ADDRGP4 $2670
JUMPV
LABELV $2688
line 4469
;4467:		}
;4468:		// BSP button model
;4469:		if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2661
ARGP4
ADDRLP4 3284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3284
INDIRI4
CNSTI4 0
NEI4 $2694
line 4471
;4470:			//
;4471:			if (!BotFuncButtonActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3288
ADDRGP4 BotFuncButtonActivateGoal
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $2696
line 4472
;4472:				continue;
ADDRGP4 $2670
JUMPV
LABELV $2696
line 4474
;4473:			// if the bot tries to activate this button already
;4474:			if ( bs->activatestack && bs->activatestack->inuse &&
ADDRLP4 3292
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
ASGNP4
ADDRLP4 3292
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2698
ADDRLP4 3292
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $2698
ADDRLP4 3296
CNSTI4 44
ASGNI4
ADDRLP4 3292
INDIRP4
ADDRLP4 3296
INDIRI4
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
ADDRLP4 3296
INDIRI4
ADDP4
INDIRI4
NEI4 $2698
ADDRLP4 3300
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3292
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3300
INDIRF4
LEF4 $2698
ADDRLP4 3292
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3300
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $2698
line 4478
;4475:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4476:				 bs->activatestack->time > FloatTime() &&
;4477:				 bs->activatestack->start_time < FloatTime() - 2)
;4478:				continue;
ADDRGP4 $2670
JUMPV
LABELV $2698
line 4480
;4479:			// if the bot is in a reachability area
;4480:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 3304
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3304
INDIRI4
CNSTI4 0
EQI4 $2700
line 4482
;4481:				// disable all areas the blocking entity is in
;4482:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4484
;4483:				//
;4484:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3308
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 3308
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3308
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRLP4 3312
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3312
INDIRI4
ASGNI4
line 4486
;4485:				// if the button is not reachable
;4486:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $2702
line 4487
;4487:					continue;
ADDRGP4 $2670
JUMPV
LABELV $2702
line 4489
;4488:				}
;4489:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1008981770
ADDRLP4 2736
INDIRI4
CVIF4 4
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4490
;4490:			}
LABELV $2700
line 4491
;4491:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2596
JUMPV
LABELV $2694
line 4494
;4492:		}
;4493:		// invisible trigger multiple box
;4494:		else if (!strcmp(classname, "trigger_multiple")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2706
ARGP4
ADDRLP4 3288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $2704
line 4496
;4495:			//
;4496:			if (!BotTriggerMultipleActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3292
ADDRGP4 BotTriggerMultipleActivateGoal
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
NEI4 $2707
line 4497
;4497:				continue;
ADDRGP4 $2670
JUMPV
LABELV $2707
line 4499
;4498:			// if the bot tries to activate this trigger already
;4499:			if ( bs->activatestack && bs->activatestack->inuse &&
ADDRLP4 3296
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
ASGNP4
ADDRLP4 3296
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2709
ADDRLP4 3296
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $2709
ADDRLP4 3300
CNSTI4 44
ASGNI4
ADDRLP4 3296
INDIRP4
ADDRLP4 3300
INDIRI4
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
ADDRLP4 3300
INDIRI4
ADDP4
INDIRI4
NEI4 $2709
ADDRLP4 3304
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3296
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3304
INDIRF4
LEF4 $2709
ADDRLP4 3296
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3304
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $2709
line 4503
;4500:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4501:				 bs->activatestack->time > FloatTime() &&
;4502:				 bs->activatestack->start_time < FloatTime() - 2)
;4503:				continue;
ADDRGP4 $2670
JUMPV
LABELV $2709
line 4505
;4504:			// if the bot is in a reachability area
;4505:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 3308
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3308
INDIRI4
CNSTI4 0
EQI4 $2711
line 4507
;4506:				// disable all areas the blocking entity is in
;4507:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4509
;4508:				//
;4509:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3312
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 3312
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3312
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRLP4 3316
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3316
INDIRI4
ASGNI4
line 4511
;4510:				// if the trigger is not reachable
;4511:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $2713
line 4512
;4512:					continue;
ADDRGP4 $2670
JUMPV
LABELV $2713
line 4514
;4513:				}
;4514:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1008981770
ADDRLP4 2736
INDIRI4
CVIF4 4
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4515
;4515:			}
LABELV $2711
line 4516
;4516:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $2596
JUMPV
LABELV $2704
line 4518
;4517:		}
;4518:		else if (!strcmp(classname, "func_timer")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2717
ARGP4
ADDRLP4 3292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
NEI4 $2715
line 4520
;4519:			// just skip the func_timer
;4520:			continue;
ADDRGP4 $2670
JUMPV
LABELV $2715
line 4523
;4521:		}
;4522:		// the actual button or trigger might be linked through a target_relay or target_delay
;4523:		else if (!strcmp(classname, "target_relay") || !strcmp(classname, "target_delay")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $2720
ARGP4
ADDRLP4 3296
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3296
INDIRI4
CNSTI4 0
EQI4 $2722
ADDRLP4 1456
ARGP4
ADDRGP4 $2721
ARGP4
ADDRLP4 3300
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3300
INDIRI4
CNSTI4 0
NEI4 $2718
LABELV $2722
line 4524
;4524:			if (trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[i+1], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2664
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136+128
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3304
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3304
INDIRI4
CNSTI4 0
EQI4 $2723
line 4525
;4525:				i++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4526
;4526:				cur_entities[i] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3308
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3308
INDIRI4
ASGNI4
line 4527
;4527:			}
LABELV $2723
line 4528
;4528:		}
LABELV $2718
line 4529
;4529:	}
LABELV $2670
line 4447
LABELV $2672
ADDRLP4 132
INDIRI4
CNSTI4 0
LTI4 $2726
ADDRLP4 132
INDIRI4
CNSTI4 10
LTI4 $2669
LABELV $2726
line 4533
;4530:#ifdef OBSTACLEDEBUG
;4531:	BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no valid activator for entity with target \"%s\"\n", targetname[0]);
;4532:#endif
;4533:	return 0;
CNSTI4 0
RETI4
LABELV $2596
endproc BotGetActivateGoal 3320 20
export BotGoForActivateGoal
proc BotGoForActivateGoal 144 8
line 4541
;4534:}
;4535:
;4536:/*
;4537:==================
;4538:BotGoForActivateGoal
;4539:==================
;4540:*/
;4541:int BotGoForActivateGoal(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4544
;4542:	aas_entityinfo_t activateinfo;
;4543:
;4544:	activategoal->inuse = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 4545
;4545:	if (!activategoal->time)
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CNSTF4 0
NEF4 $2728
line 4546
;4546:		activategoal->time = FloatTime() + 10;
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
LABELV $2728
line 4547
;4547:	activategoal->start_time = FloatTime();
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4548
;4548:	BotEntityInfo(activategoal->goal.entitynum, &activateinfo);
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4549
;4549:	VectorCopy(activateinfo.origin, activategoal->origin);
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4551
;4550:	//
;4551:	if (BotPushOntoActivateGoalStack(bs, activategoal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotPushOntoActivateGoalStack
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $2731
line 4553
;4552:		// enter the activate entity AI node
;4553:		AIEnter_Seek_ActivateEntity(bs, "BotGoForActivateGoal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2733
ARGP4
ADDRGP4 AIEnter_Seek_ActivateEntity
CALLV
pop
line 4554
;4554:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2727
JUMPV
LABELV $2731
line 4556
;4555:	}
;4556:	else {
line 4558
;4557:		// enable any routing areas that were disabled
;4558:		BotEnableActivateGoalAreas(activategoal, qtrue);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4559
;4559:		return qfalse;
CNSTI4 0
RETI4
LABELV $2727
endproc BotGoForActivateGoal 144 8
export BotPrintActivateGoalInfo
proc BotPrintActivateGoalInfo 296 36
line 4568
;4560:	}
;4561:}
;4562:
;4563:/*
;4564:==================
;4565:BotPrintActivateGoalInfo
;4566:==================
;4567:*/
;4568:void BotPrintActivateGoalInfo(bot_state_t *bs, bot_activategoal_t *activategoal, int bspent) {
line 4573
;4569:	char netname[MAX_NETNAME];
;4570:	char classname[128];
;4571:	char buf[128];
;4572:
;4573:	ClientName(bs->client, netname, sizeof(netname));
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
line 4574
;4574:	trap_AAS_ValueForBSPEpairKey(bspent, "classname", classname, sizeof(classname));
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $2610
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4575
;4575:	if (activategoal->shoot) {
ADDRFP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2735
line 4576
;4576:		Com_sprintf(buf, sizeof(buf), "%s: I have to shoot at a %s from %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $2737
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4582
;4577:						netname, classname,
;4578:						activategoal->goal.origin[0],
;4579:						activategoal->goal.origin[1],
;4580:						activategoal->goal.origin[2],
;4581:						activategoal->goal.areanum);
;4582:	}
ADDRGP4 $2736
JUMPV
LABELV $2735
line 4583
;4583:	else {
line 4584
;4584:		Com_sprintf(buf, sizeof(buf), "%s: I have to activate a %s at %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $2738
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4590
;4585:						netname, classname,
;4586:						activategoal->goal.origin[0],
;4587:						activategoal->goal.origin[1],
;4588:						activategoal->goal.origin[2],
;4589:						activategoal->goal.areanum);
;4590:	}
LABELV $2736
line 4591
;4591:	trap_EA_Say(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ARGP4
ADDRGP4 trap_EA_Say
CALLV
pop
line 4592
;4592:}
LABELV $2734
endproc BotPrintActivateGoalInfo 296 36
export BotRandomMove
proc BotRandomMove 32 16
line 4599
;4593:
;4594:/*
;4595:==================
;4596:BotRandomMove
;4597:==================
;4598:*/
;4599:void BotRandomMove(bot_state_t *bs, bot_moveresult_t *moveresult) {
line 4602
;4600:	vec3_t dir, angles;
;4601:
;4602:	angles[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4603
;4603:	angles[1] = random() * 360;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
CNSTF4 1135869952
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 4604
;4604:	angles[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4605
;4605:	AngleVectors(angles, dir, NULL, NULL);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
CNSTP4 0
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4607
;4606:
;4607:	trap_BotMoveInDirection(bs->ms, dir, 400, MOVE_WALK);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4609
;4608:
;4609:	moveresult->failure = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4610
;4610:	VectorCopy(dir, moveresult->movedir);
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4611
;4611:}
LABELV $2739
endproc BotRandomMove 32 16
lit
align 4
LABELV $2743
byte 4 0
byte 4 0
byte 4 1065353216
export BotAIBlocked
code
proc BotAIBlocked 528 16
line 4624
;4612:
;4613:/*
;4614:==================
;4615:BotAIBlocked
;4616:
;4617:Very basic handling of bots being blocked by other entities.
;4618:Check what kind of entity is blocking the bot and try to activate
;4619:it. If that's not an option then try to walk around or over the entity.
;4620:Before the bot ends in this part of the AI it should predict which doors to
;4621:open, which buttons to activate etc.
;4622:==================
;4623:*/
;4624:void BotAIBlocked(bot_state_t *bs, bot_moveresult_t *moveresult, int activate) {
line 4626
;4625:	int movetype, bspent;
;4626:	vec3_t hordir, start, end, mins, maxs, sideward, angles, up = {0, 0, 1};
ADDRLP4 228
ADDRGP4 $2743
INDIRB
ASGNB 12
line 4631
;4627:	aas_entityinfo_t entinfo;
;4628:	bot_activategoal_t activategoal;
;4629:
;4630:	// if the bot is not blocked by anything
;4631:	if (!moveresult->blocked) {
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2744
line 4632
;4632:		bs->notblocked_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10308
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4633
;4633:		return;
ADDRGP4 $2742
JUMPV
LABELV $2744
line 4636
;4634:	}
;4635:	// if stuck in a solid area
;4636:	if ( moveresult->type == RESULTTYPE_INSOLIDAREA ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $2746
line 4638
;4637:		// move in a random direction in the hope to get out
;4638:		BotRandomMove(bs, moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRandomMove
CALLV
pop
line 4640
;4639:		//
;4640:		return;
ADDRGP4 $2742
JUMPV
LABELV $2746
line 4643
;4641:	}
;4642:	// get info for the entity that is blocking the bot
;4643:	BotEntityInfo(moveresult->blockentity, &entinfo);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4649
;4644:#ifdef OBSTACLEDEBUG
;4645:	ClientName(bs->client, netname, sizeof(netname));
;4646:	BotAI_Print(PRT_MESSAGE, "%s: I'm blocked by model %d\n", netname, entinfo.modelindex);
;4647:#endif // OBSTACLEDEBUG
;4648:	// if blocked by a bsp model and the bot wants to activate it
;4649:	if (activate && entinfo.modelindex > 0 && entinfo.modelindex <= max_bspmodelindex) {
ADDRLP4 488
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 488
INDIRI4
EQI4 $2748
ADDRLP4 40+104
INDIRI4
ADDRLP4 488
INDIRI4
LEI4 $2748
ADDRLP4 40+104
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
GTI4 $2748
line 4651
;4650:		// find the bsp entity which should be activated in order to get the blocking entity out of the way
;4651:		bspent = BotGetActivateGoal(bs, entinfo.number, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40+20
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 492
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 484
ADDRLP4 492
INDIRI4
ASGNI4
line 4652
;4652:		if (bspent) {
ADDRLP4 484
INDIRI4
CNSTI4 0
EQI4 $2753
line 4654
;4653:			//
;4654:			if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 496
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
ASGNP4
ADDRLP4 496
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2755
ADDRLP4 496
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2755
line 4655
;4655:				bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
CNSTP4 0
ASGNP4
LABELV $2755
line 4657
;4656:			// if not already trying to activate this entity
;4657:			if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240+4+40
INDIRI4
ARGI4
ADDRLP4 500
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 500
INDIRI4
CNSTI4 0
NEI4 $2757
line 4659
;4658:				//
;4659:				BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4660
;4660:			}
LABELV $2757
line 4664
;4661:			// if ontop of an obstacle or
;4662:			// if the bot is not in a reachability area it'll still
;4663:			// need some dynamic obstacle avoidance, otherwise return
;4664:			if (!(moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) &&
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $2754
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 504
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 504
INDIRI4
CNSTI4 0
EQI4 $2754
line 4666
;4665:				trap_AAS_AreaReachability(bs->areanum))
;4666:				return;
ADDRGP4 $2742
JUMPV
line 4667
;4667:		}
LABELV $2753
line 4668
;4668:		else {
line 4670
;4669:			// enable any routing areas that were disabled
;4670:			BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 240
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4671
;4671:		}
LABELV $2754
line 4672
;4672:	}
LABELV $2748
line 4674
;4673:	// just some basic dynamic obstacle avoidance code
;4674:	hordir[0] = moveresult->movedir[0];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 4675
;4675:	hordir[1] = moveresult->movedir[1];
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 4676
;4676:	hordir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4678
;4677:	// if no direction just take a random direction
;4678:	if (VectorNormalize(hordir) < 0.1) {
ADDRLP4 0
ARGP4
ADDRLP4 492
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 492
INDIRF4
CNSTF4 1036831949
GEF4 $2765
line 4679
;4679:		VectorSet(angles, 0, 360 * random(), 0);
ADDRLP4 216
CNSTF4 0
ASGNF4
ADDRLP4 496
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 216+4
CNSTF4 1135869952
ADDRLP4 496
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
ADDRLP4 216+8
CNSTF4 0
ASGNF4
line 4680
;4680:		AngleVectors(angles, hordir, NULL, NULL);
ADDRLP4 216
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 500
CNSTP4 0
ASGNP4
ADDRLP4 500
INDIRP4
ARGP4
ADDRLP4 500
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4681
;4681:	}
LABELV $2765
line 4685
;4682:	//
;4683:	//if (moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) movetype = MOVE_JUMP;
;4684:	//else
;4685:	movetype = MOVE_WALK;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 4688
;4686:	// if there's an obstacle at the bot's feet and head then
;4687:	// the bot might be able to crouch through
;4688:	VectorCopy(bs->origin, start);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 5940
ADDP4
INDIRB
ASGNB 12
line 4689
;4689:	start[2] += 18;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 4690
;4690:	VectorMA(start, 5, hordir, end);
ADDRLP4 496
CNSTF4 1084227584
ASGNF4
ADDRLP4 180
ADDRLP4 24
INDIRF4
ADDRLP4 496
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 180+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 496
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 180+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1084227584
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4691
;4691:	VectorSet(mins, -16, -16, -24);
ADDRLP4 500
CNSTF4 3246391296
ASGNF4
ADDRLP4 192
ADDRLP4 500
INDIRF4
ASGNF4
ADDRLP4 192+4
ADDRLP4 500
INDIRF4
ASGNF4
ADDRLP4 192+8
CNSTF4 3250585600
ASGNF4
line 4692
;4692:	VectorSet(maxs, 16, 16, 4);
ADDRLP4 504
CNSTF4 1098907648
ASGNF4
ADDRLP4 204
ADDRLP4 504
INDIRF4
ASGNF4
ADDRLP4 204+4
ADDRLP4 504
INDIRF4
ASGNF4
ADDRLP4 204+8
CNSTF4 1082130432
ASGNF4
line 4697
;4693:	//
;4694:	//bsptrace = AAS_Trace(start, mins, maxs, end, bs->entitynum, MASK_PLAYERSOLID);
;4695:	//if (bsptrace.fraction >= 1) movetype = MOVE_CROUCH;
;4696:	// get the sideward vector
;4697:	CrossProduct(hordir, up, sideward);
ADDRLP4 0
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 4699
;4698:	//
;4699:	if (bs->flags & BFL_AVOIDRIGHT) VectorNegate(sideward, sideward);
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2780
ADDRLP4 12
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
NEGF4
ASGNF4
LABELV $2780
line 4701
;4700:	// try to crouch straight forward?
;4701:	if (movetype != MOVE_CROUCH || !trap_BotMoveInDirection(bs->ms, hordir, 400, movetype)) {
ADDRLP4 36
INDIRI4
CNSTI4 2
NEI4 $2788
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 512
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 512
INDIRI4
CNSTI4 0
NEI4 $2786
LABELV $2788
line 4703
;4702:		// perform the movement
;4703:		if (!trap_BotMoveInDirection(bs->ms, sideward, 400, movetype)) {
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 516
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $2789
line 4705
;4704:			// flip the avoid direction flag
;4705:			bs->flags ^= BFL_AVOIDRIGHT;
ADDRLP4 520
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
ASGNP4
ADDRLP4 520
INDIRP4
ADDRLP4 520
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 4708
;4706:			// flip the direction
;4707:			// VectorNegate(sideward, sideward);
;4708:			VectorMA(sideward, -1, hordir, sideward);
ADDRLP4 524
CNSTF4 3212836864
ASGNF4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 524
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 524
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 3212836864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4710
;4709:			// move in the other direction
;4710:			trap_BotMoveInDirection(bs->ms, sideward, 400, movetype);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4711
;4711:		}
LABELV $2789
line 4712
;4712:	}
LABELV $2786
line 4714
;4713:	//
;4714:	if (bs->notblocked_time < FloatTime() - 0.4) {
ADDRFP4 0
INDIRP4
CNSTI4 10308
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1053609165
SUBF4
GEF4 $2797
line 4717
;4715:		// just reset goals and hope the bot will go into another direction?
;4716:		// is this still needed??
;4717:		if (bs->ainode == AINode_Seek_NBG) bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_NBG
CVPU4 4
NEU4 $2799
ADDRFP4 0
INDIRP4
CNSTI4 10176
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $2800
JUMPV
LABELV $2799
line 4718
;4718:		else if (bs->ainode == AINode_Seek_LTG) bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_LTG
CVPU4 4
NEU4 $2801
ADDRFP4 0
INDIRP4
CNSTI4 10172
ADDP4
CNSTF4 0
ASGNF4
LABELV $2801
LABELV $2800
line 4719
;4719:	}
LABELV $2797
line 4720
;4720:}
LABELV $2742
endproc BotAIBlocked 528 16
export BotAIPredictObstacles
proc BotAIPredictObstacles 324 44
line 4732
;4721:
;4722:/*
;4723:==================
;4724:BotAIPredictObstacles
;4725:
;4726:Predict the route towards the goal and check if the bot
;4727:will be blocked by certain obstacles. When the bot has obstacles
;4728:on it's path the bot should figure out if they can be removed
;4729:by activating certain entities.
;4730:==================
;4731:*/
;4732:int BotAIPredictObstacles(bot_state_t *bs, bot_goal_t *goal) {
line 4737
;4733:	int modelnum, entitynum, bspent;
;4734:	bot_activategoal_t activategoal;
;4735:	aas_predictroute_t route;
;4736:
;4737:	if (!bot_predictobstacles.integer)
ADDRGP4 bot_predictobstacles+12
INDIRI4
CNSTI4 0
NEI4 $2804
line 4738
;4738:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2803
JUMPV
LABELV $2804
line 4741
;4739:
;4740:	// always predict when the goal change or at regular intervals
;4741:	if (bs->predictobstacles_goalareanum == goal->areanum &&
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 10320
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $2807
ADDRLP4 292
INDIRP4
CNSTI4 10316
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
LEF4 $2807
line 4742
;4742:		bs->predictobstacles_time > FloatTime() - 6) {
line 4743
;4743:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2803
JUMPV
LABELV $2807
line 4745
;4744:	}
;4745:	bs->predictobstacles_goalareanum = goal->areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10320
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 4746
;4746:	bs->predictobstacles_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10316
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4749
;4747:
;4748:	// predict at most 100 areas or 10 seconds ahead
;4749:	trap_AAS_PredictRoute(&route, bs->areanum, bs->origin,
ADDRLP4 0
ARGP4
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
CNSTI4 100
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1024
ARGI4
CNSTI4 67108864
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_AAS_PredictRoute
CALLI4
pop
line 4754
;4750:							goal->areanum, bs->tfl, 100, 1000,
;4751:							RSE_USETRAVELTYPE|RSE_ENTERCONTENTS,
;4752:							AREACONTENTS_MOVER, TFL_BRIDGE, 0);
;4753:	// if bot has to travel through an area with a mover
;4754:	if (route.stopevent & RSE_ENTERCONTENTS) {
ADDRLP4 0+16
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2809
line 4756
;4755:		// if the bot will run into a mover
;4756:		if (route.endcontents & AREACONTENTS_MOVER) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2810
line 4758
;4757:			//NOTE: this only works with bspc 2.1 or higher
;4758:			modelnum = (route.endcontents & AREACONTENTS_MODELNUM) >> AREACONTENTS_MODELNUMSHIFT;
ADDRLP4 300
CNSTI4 24
ASGNI4
ADDRLP4 36
ADDRLP4 0+20
INDIRI4
CNSTI4 255
ADDRLP4 300
INDIRI4
LSHI4
BANDI4
ADDRLP4 300
INDIRI4
RSHI4
ASGNI4
line 4759
;4759:			if (modelnum) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2810
line 4761
;4760:				//
;4761:				entitynum = BotModelMinsMaxs(modelnum, ET_MOVER, 0, NULL, NULL);
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 304
CNSTP4 0
ASGNP4
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 308
INDIRI4
ASGNI4
line 4762
;4762:				if (entitynum) {
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2810
line 4764
;4763:					//NOTE: BotGetActivateGoal already checks if the door is open or not
;4764:					bspent = BotGetActivateGoal(bs, entitynum, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 312
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 312
INDIRI4
ASGNI4
line 4765
;4765:					if (bspent) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2810
line 4767
;4766:						//
;4767:						if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
INDIRP4
ASGNP4
ADDRLP4 316
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2822
ADDRLP4 316
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2822
line 4768
;4768:							bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 11220
ADDP4
CNSTP4 0
ASGNP4
LABELV $2822
line 4770
;4769:						// if not already trying to activate this entity
;4770:						if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48+4+40
INDIRI4
ARGI4
ADDRLP4 320
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
NEI4 $2824
line 4774
;4771:							//
;4772:							//BotAI_Print(PRT_MESSAGE, "blocked by mover model %d, entity %d ?\n", modelnum, entitynum);
;4773:							//
;4774:							BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4775
;4775:							return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2803
JUMPV
LABELV $2824
line 4777
;4776:						}
;4777:						else {
line 4779
;4778:							// enable any routing areas that were disabled
;4779:							BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 48
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4780
;4780:						}
line 4781
;4781:					}
line 4782
;4782:				}
line 4783
;4783:			}
line 4784
;4784:		}
line 4785
;4785:	}
ADDRGP4 $2810
JUMPV
LABELV $2809
line 4786
;4786:	else if (route.stopevent & RSE_USETRAVELTYPE) {
ADDRLP4 0+16
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2828
line 4787
;4787:		if (route.endtravelflags & TFL_BRIDGE) {
ADDRLP4 0+24
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $2831
line 4789
;4788:			//FIXME: check if the bridge is available to travel over
;4789:		}
LABELV $2831
line 4790
;4790:	}
LABELV $2828
LABELV $2810
line 4791
;4791:	return qfalse;
CNSTI4 0
RETI4
LABELV $2803
endproc BotAIPredictObstacles 324 44
export BotCheckConsoleMessages
proc BotCheckConsoleMessages 1016 48
line 4799
;4792:}
;4793:
;4794:/*
;4795:==================
;4796:BotCheckConsoleMessages
;4797:==================
;4798:*/
;4799:void BotCheckConsoleMessages(bot_state_t *bs) {
line 4807
;4800:	char botname[MAX_NETNAME], message[MAX_MESSAGE_SIZE], netname[MAX_NETNAME], *ptr;
;4801:	float chat_reply;
;4802:	int context, handle;
;4803:	bot_consolemessage_t m;
;4804:	bot_match_t match;
;4805:
;4806:	//the name of this bot
;4807:	ClientName(bs->client, botname, sizeof(botname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 908
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRGP4 $2836
JUMPV
LABELV $2835
line 4809
;4808:	//
;4809:	while((handle = trap_BotNextConsoleMessage(bs->cs, &m)) != 0) {
line 4811
;4810:		//if the chat state is flooded with messages the bot will read them quickly
;4811:		if (trap_BotNumConsoleMessages(bs->cs) < 10) {
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 948
ADDRGP4 trap_BotNumConsoleMessages
CALLI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 10
GEI4 $2838
line 4813
;4812:			//if it is a chat message the bot needs some time to read it
;4813:			if (m.type == CMS_CHAT && m.time > FloatTime() - (1 + random())) break;
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2840
ADDRLP4 952
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 952
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1065353216
ADDF4
SUBF4
LEF4 $2840
ADDRGP4 $2837
JUMPV
LABELV $2840
line 4814
;4814:		}
LABELV $2838
line 4816
;4815:		//
;4816:		ptr = m.message;
ADDRLP4 276
ADDRLP4 0+12
ASGNP4
line 4819
;4817:		//if it is a chat message then don't unify white spaces and don't
;4818:		//replace synonyms in the netname
;4819:		if (m.type == CMS_CHAT) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2845
line 4821
;4820:			//
;4821:			if (trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 952
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 952
INDIRI4
CNSTI4 0
EQI4 $2848
line 4822
;4822:				ptr = m.message + match.variables[MESSAGE].offset;
ADDRLP4 276
ADDRLP4 288+264+16
INDIRI1
CVII4 1
ADDRLP4 0+12
ADDP4
ASGNP4
line 4823
;4823:			}
LABELV $2848
line 4824
;4824:		}
LABELV $2845
line 4826
;4825:		//unify the white spaces in the message
;4826:		trap_UnifyWhiteSpaces(ptr);
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4828
;4827:		//replace synonyms in the right context
;4828:		context = BotSynonymContext(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 952
ADDRGP4 BotSynonymContext
CALLI4
ASGNI4
ADDRLP4 284
ADDRLP4 952
INDIRI4
ASGNI4
line 4829
;4829:		trap_BotReplaceSynonyms(ptr, context);
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 284
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 trap_BotReplaceSynonyms
CALLV
pop
line 4831
;4830:		//if there's no match
;4831:		if (!BotMatchMessage(bs, m.message)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 956
ADDRGP4 BotMatchMessage
CALLI4
ASGNI4
ADDRLP4 956
INDIRI4
CNSTI4 0
NEI4 $2854
line 4833
;4832:			//if it is a chat message
;4833:			if (m.type == CMS_CHAT && !bot_nochat.integer) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2857
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
NEI4 $2857
line 4835
;4834:				//
;4835:				if (!trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 960
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 960
INDIRI4
CNSTI4 0
NEI4 $2861
line 4836
;4836:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4837
;4837:					continue;
ADDRGP4 $2836
JUMPV
LABELV $2861
line 4840
;4838:				}
;4839:				//don't use eliza chats with team messages
;4840:				if (match.subtype & ST_TEAM) {
ADDRLP4 288+260
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $2864
line 4841
;4841:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4842
;4842:					continue;
ADDRGP4 $2836
JUMPV
LABELV $2864
line 4845
;4843:				}
;4844:				//
;4845:				trap_BotMatchVariable(&match, NETNAME, netname, sizeof(netname));
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 872
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4846
;4846:				trap_BotMatchVariable(&match, MESSAGE, message, sizeof(message));
ADDRLP4 288
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 616
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4848
;4847:				//if this is a message from the bot self
;4848:				if (bs->client == ClientFromName(netname)) {
ADDRLP4 872
ARGP4
ADDRLP4 964
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 964
INDIRI4
NEI4 $2867
line 4849
;4849:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4850
;4850:					continue;
ADDRGP4 $2836
JUMPV
LABELV $2867
line 4853
;4851:				}
;4852:				//unify the message
;4853:				trap_UnifyWhiteSpaces(message);
ADDRLP4 616
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4855
;4854:				//
;4855:				trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 4856
;4856:				if (bot_testrchat.integer) {
ADDRGP4 bot_testrchat+12
INDIRI4
CNSTI4 0
EQI4 $2869
line 4858
;4857:					//
;4858:					trap_BotLibVarSet("bot_testrchat", "1");
ADDRGP4 $2872
ARGP4
ADDRGP4 $2873
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 4860
;4859:					//if bot replies with a chat message
;4860:					if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 968
CNSTP4 0
ASGNP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 972
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 972
INDIRI4
CNSTI4 0
EQI4 $2874
line 4864
;4861:															NULL, NULL,
;4862:															NULL, NULL,
;4863:															NULL, NULL,
;4864:															botname, netname)) {
line 4865
;4865:						BotAI_Print(PRT_MESSAGE, "------------------------\n");
CNSTI4 1
ARGI4
ADDRGP4 $2876
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4866
;4866:					}
ADDRGP4 $2870
JUMPV
LABELV $2874
line 4867
;4867:					else {
line 4868
;4868:						BotAI_Print(PRT_MESSAGE, "**** no valid reply ****\n");
CNSTI4 1
ARGI4
ADDRGP4 $2877
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4869
;4869:					}
line 4870
;4870:				}
ADDRGP4 $2870
JUMPV
LABELV $2869
line 4872
;4871:				//if at a valid chat position and not chatting already and not in teamplay
;4872:				else if (bs->ainode != AINode_Stand && BotValidChatPosition(bs) && !TeamPlayIsOn()) {
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 968
INDIRP4
CNSTI4 5932
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Stand
CVPU4 4
EQU4 $2878
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 972
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 972
INDIRI4
CNSTI4 0
EQI4 $2878
ADDRLP4 976
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 976
INDIRI4
CNSTI4 0
NEI4 $2878
line 4873
;4873:					chat_reply = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_REPLY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 35
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 944
ADDRLP4 980
INDIRF4
ASGNF4
line 4874
;4874:					if (random() < 1.5 / (NumBots()+1) && random() < chat_reply) {
ADDRLP4 984
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 988
ADDRGP4 NumBots
CALLI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1069547520
ADDRLP4 988
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
DIVF4
GEF4 $2879
ADDRLP4 992
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 992
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 944
INDIRF4
GEF4 $2879
line 4876
;4875:						//if bot replies with a chat message
;4876:						if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 996
CNSTP4 0
ASGNP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 1000
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 0
EQI4 $2879
line 4880
;4877:																NULL, NULL,
;4878:																NULL, NULL,
;4879:																NULL, NULL,
;4880:																botname, netname)) {
line 4882
;4881:							//remove the console message
;4882:							trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4883
;4883:							bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1004
INDIRP4
ARGP4
ADDRLP4 1008
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1004
INDIRP4
CNSTI4 10200
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1008
INDIRF4
ADDF4
ASGNF4
line 4884
;4884:							AIEnter_Stand(bs, "BotCheckConsoleMessages: reply chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2884
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 4886
;4885:							//EA_Say(bs->client, bs->cs.chatmessage);
;4886:							break;
ADDRGP4 $2837
JUMPV
line 4888
;4887:						}
;4888:					}
line 4889
;4889:				} else if (gametype == GT_FFA || gametype == GT_LMS || gametype == GT_SANDBOX) {
LABELV $2878
ADDRLP4 980
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 980
INDIRI4
CNSTI4 1
EQI4 $2888
ADDRLP4 980
INDIRI4
CNSTI4 11
EQI4 $2888
ADDRLP4 980
INDIRI4
CNSTI4 0
NEI4 $2885
LABELV $2888
line 4890
;4890:					chat_reply = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_REPLY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 35
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 984
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 944
ADDRLP4 984
INDIRF4
ASGNF4
line 4891
;4891:					if (random() < 1.5 / (NumBots()+1) && random() < chat_reply) {
ADDRLP4 988
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 992
ADDRGP4 NumBots
CALLI4
ASGNI4
ADDRLP4 988
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1069547520
ADDRLP4 992
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
DIVF4
GEF4 $2889
ADDRLP4 996
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 944
INDIRF4
GEF4 $2889
line 4893
;4892:						//if bot replies with a chat message
;4893:						if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 1000
CNSTP4 0
ASGNP4
ADDRLP4 1000
INDIRP4
ARGP4
ADDRLP4 1000
INDIRP4
ARGP4
ADDRLP4 1000
INDIRP4
ARGP4
ADDRLP4 1000
INDIRP4
ARGP4
ADDRLP4 1000
INDIRP4
ARGP4
ADDRLP4 1000
INDIRP4
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 1004
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 1004
INDIRI4
CNSTI4 0
EQI4 $2891
line 4897
;4894:																NULL, NULL,
;4895:																NULL, NULL,
;4896:																NULL, NULL,
;4897:																botname, netname)) {
line 4899
;4898:							//remove the console message
;4899:							trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4900
;4900:							bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
ARGP4
ADDRLP4 1012
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1008
INDIRP4
CNSTI4 10200
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1012
INDIRF4
ADDF4
ASGNF4
line 4901
;4901:							AIEnter_Stand(bs, "BotCheckConsoleMessages: reply chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2884
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 4903
;4902:							//EA_Say(bs->client, bs->cs.chatmessage);
;4903:							break;
ADDRGP4 $2837
JUMPV
LABELV $2891
line 4905
;4904:						}
;4905:					}
LABELV $2889
line 4906
;4906:				}
LABELV $2885
LABELV $2879
LABELV $2870
line 4907
;4907:			}
LABELV $2857
line 4908
;4908:		}
LABELV $2854
line 4910
;4909:		//remove the console message
;4910:		trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4911
;4911:	}
LABELV $2836
line 4809
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 948
ADDRGP4 trap_BotNextConsoleMessage
CALLI4
ASGNI4
ADDRLP4 280
ADDRLP4 948
INDIRI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 0
NEI4 $2835
LABELV $2837
line 4912
;4912:}
LABELV $2834
endproc BotCheckConsoleMessages 1016 48
export BotCheckForGrenades
proc BotCheckForGrenades 8 16
line 4919
;4913:
;4914:/*
;4915:==================
;4916:BotCheckEvents
;4917:==================
;4918:*/
;4919:void BotCheckForGrenades(bot_state_t *bs, entityState_t *state) {
line 4921
;4920:	// if this is not a grenade
;4921:	if (state->eType != ET_MISSILE || state->weapon != WP_GRENADE_LAUNCHER)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2896
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2894
LABELV $2896
line 4922
;4922:		return;
ADDRGP4 $2893
JUMPV
LABELV $2894
line 4924
;4923:	// try to avoid the grenade
;4924:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1126170624
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 4925
;4925:}
LABELV $2893
endproc BotCheckForGrenades 8 16
export BotCheckForProxMines
proc BotCheckForProxMines 40 16
line 4933
;4926:
;4927:
;4928:/*
;4929:==================
;4930:BotCheckForProxMines
;4931:==================
;4932:*/
;4933:void BotCheckForProxMines(bot_state_t *bs, entityState_t *state) {
line 4935
;4934:	// if this is not a prox mine
;4935:	if (state->eType != ET_MISSILE || state->weapon != WP_PROX_LAUNCHER)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2900
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 12
EQI4 $2898
LABELV $2900
line 4936
;4936:		return;
ADDRGP4 $2897
JUMPV
LABELV $2898
line 4938
;4937:	// if this prox mine is from someone on our own team
;4938:	if (state->generic1 == BotTeam(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $2901
line 4939
;4939:		return;
ADDRGP4 $2897
JUMPV
LABELV $2901
line 4941
;4940:	// if the bot doesn't have a weapon to deactivate the mine
;4941:	if (!(bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0) &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $2905
ADDRLP4 8
INDIRP4
CNSTI4 6068
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
GTI4 $2903
LABELV $2905
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $2906
ADDRLP4 16
INDIRP4
CNSTI4 6076
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
GTI4 $2903
LABELV $2906
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 6036
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $2907
ADDRLP4 24
INDIRP4
CNSTI4 6084
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
GTI4 $2903
LABELV $2907
line 4943
;4942:		!(bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0) &&
;4943:		!(bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0) ) {
line 4944
;4944:		return;
ADDRGP4 $2897
JUMPV
LABELV $2903
line 4947
;4945:	}
;4946:	// try to avoid the prox mine
;4947:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1126170624
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 4949
;4948:	//
;4949:	if (bs->numproxmines >= MAX_PROXMINES)
ADDRFP4 0
INDIRP4
CNSTI4 10620
ADDP4
INDIRI4
CNSTI4 64
LTI4 $2908
line 4950
;4950:		return;
ADDRGP4 $2897
JUMPV
LABELV $2908
line 4951
;4951:	bs->proxmines[bs->numproxmines] = state->number;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 10620
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 10364
ADDP4
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 4952
;4952:	bs->numproxmines++;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 10620
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4953
;4953:}
LABELV $2897
endproc BotCheckForProxMines 40 16
export BotCheckForKamikazeBody
proc BotCheckForKamikazeBody 0 0
line 4960
;4954:
;4955:/*
;4956:==================
;4957:BotCheckForKamikazeBody
;4958:==================
;4959:*/
;4960:void BotCheckForKamikazeBody(bot_state_t *bs, entityState_t *state) {
line 4962
;4961:	// if this entity is not wearing the kamikaze
;4962:	if (!(state->eFlags & EF_KAMIKAZE))
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $2911
line 4963
;4963:		return;
ADDRGP4 $2910
JUMPV
LABELV $2911
line 4965
;4964:	// if this entity isn't dead
;4965:	if (!(state->eFlags & EF_DEAD))
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $2913
line 4966
;4966:		return;
ADDRGP4 $2910
JUMPV
LABELV $2913
line 4968
;4967:	//remember this kamikaze body
;4968:	bs->kamikazebody = state->number;
ADDRFP4 0
INDIRP4
CNSTI4 10360
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 4969
;4969:}
LABELV $2910
endproc BotCheckForKamikazeBody 0 0
export BotCheckEvents
proc BotCheckEvents 320 12
line 4976
;4970:
;4971:/*
;4972:==================
;4973:BotCheckEvents
;4974:==================
;4975:*/
;4976:void BotCheckEvents(bot_state_t *bs, entityState_t *state) {
line 4983
;4977:	int event;
;4978:	char buf[128];
;4979:	aas_entityinfo_t entinfo;
;4980:
;4981:	//NOTE: this sucks, we're accessing the gentity_t directly
;4982:	//but there's no other fast way to do it right now
;4983:	if (bs->entityeventTime[state->number] == g_entities[state->number].eventTime) {
ADDRLP4 272
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDP4
INDIRI4
CNSTI4 2492
ADDRLP4 272
INDIRI4
MULI4
ADDRGP4 g_entities+592
ADDP4
INDIRI4
NEI4 $2916
line 4984
;4984:		return;
ADDRGP4 $2915
JUMPV
LABELV $2916
line 4986
;4985:	}
;4986:	bs->entityeventTime[state->number] = g_entities[state->number].eventTime;
ADDRLP4 276
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDP4
CNSTI4 2492
ADDRLP4 276
INDIRI4
MULI4
ADDRGP4 g_entities+592
ADDP4
INDIRI4
ASGNI4
line 4988
;4987:	//if it's an event only entity
;4988:	if (state->eType > ET_EVENTS) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
LEI4 $2920
line 4989
;4989:		event = (state->eType - ET_EVENTS) & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
SUBI4
CNSTI4 -769
BANDI4
ASGNI4
line 4990
;4990:	}
ADDRGP4 $2921
JUMPV
LABELV $2920
line 4991
;4991:	else {
line 4992
;4992:		event = state->event & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 4993
;4993:	}
LABELV $2921
line 4995
;4994:	//
;4995:	switch(event) {
ADDRLP4 280
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 1
LTI4 $2922
ADDRLP4 280
INDIRI4
CNSTI4 77
GTI4 $3001
ADDRLP4 280
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $3002-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $3002
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2923
address $2922
address $2922
address $2922
address $2986
address $2922
address $2922
address $2987
address $2942
address $2954
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2924
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2922
address $2923
code
LABELV $3001
ADDRLP4 0
INDIRI4
CNSTI4 102
EQI4 $2923
ADDRGP4 $2922
JUMPV
LABELV $2924
line 4998
;4996:		//client obituary event
;4997:		case EV_OBITUARY:
;4998:		{
line 5001
;4999:			int target, attacker, mod;
;5000:
;5001:			target = state->otherEntityNum;
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 5002
;5002:			attacker = state->otherEntityNum2;
ADDRLP4 288
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ASGNI4
line 5003
;5003:			mod = state->eventParm;
ADDRLP4 292
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 5005
;5004:			//
;5005:			if (target == bs->client) {
ADDRLP4 284
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2925
line 5006
;5006:				bs->botdeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 10104
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 5007
;5007:				bs->lastkilledby = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 10100
ADDP4
ADDRLP4 288
INDIRI4
ASGNI4
line 5009
;5008:				//
;5009:				if (target == attacker ||
ADDRLP4 296
ADDRLP4 284
INDIRI4
ASGNI4
ADDRLP4 296
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $2930
ADDRLP4 296
INDIRI4
CNSTI4 4095
EQI4 $2930
ADDRLP4 296
INDIRI4
CNSTI4 4094
NEI4 $2927
LABELV $2930
line 5011
;5010:					target == ENTITYNUM_NONE ||
;5011:					target == ENTITYNUM_WORLD) bs->botsuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10112
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $2928
JUMPV
LABELV $2927
line 5012
;5012:				else bs->botsuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 10112
ADDP4
CNSTI4 0
ASGNI4
LABELV $2928
line 5014
;5013:				//
;5014:				bs->num_deaths++;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 10132
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5015
;5015:			}
ADDRGP4 $2926
JUMPV
LABELV $2925
line 5017
;5016:			//else if this client was killed by the bot
;5017:			else if (attacker == bs->client) {
ADDRLP4 288
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2931
line 5018
;5018:				bs->enemydeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 10108
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 5019
;5019:				bs->lastkilledplayer = target;
ADDRFP4 0
INDIRP4
CNSTI4 10096
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 5020
;5020:				bs->killedenemy_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10272
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5022
;5021:				//
;5022:				bs->num_kills++;
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 10136
ADDP4
ASGNP4
ADDRLP4 296
INDIRP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5023
;5023:			}
ADDRGP4 $2932
JUMPV
LABELV $2931
line 5024
;5024:			else if (attacker == bs->enemy && target == attacker) {
ADDRLP4 296
ADDRLP4 288
INDIRI4
ASGNI4
ADDRLP4 296
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 10644
ADDP4
INDIRI4
NEI4 $2933
ADDRLP4 284
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $2933
line 5025
;5025:				bs->enemysuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10116
ADDP4
CNSTI4 1
ASGNI4
line 5026
;5026:			}
LABELV $2933
LABELV $2932
LABELV $2926
line 5028
;5027:			//	
;5028:			if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $2923
line 5030
;5029:				//
;5030:				BotEntityInfo(target, &entinfo);
ADDRLP4 284
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 5031
;5031:				if ( entinfo.powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 132+124
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2923
line 5032
;5032:					if (!BotSameTeam(bs, target)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
ADDRLP4 300
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $2923
line 5033
;5033:						bs->neutralflagstatus = 3;	//enemy dropped the flag
ADDRFP4 0
INDIRP4
CNSTI4 11064
ADDP4
CNSTI4 3
ASGNI4
line 5034
;5034:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5035
;5035:					}
line 5036
;5036:				}
line 5037
;5037:			}
line 5038
;5038:			break;
ADDRGP4 $2923
JUMPV
LABELV $2942
line 5041
;5039:		}
;5040:		case EV_GLOBAL_SOUND:
;5041:		{
line 5042
;5042:			if (state->eventParm < 0 || state->eventParm > MAX_SOUNDS) {
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
LTI4 $2945
ADDRLP4 284
INDIRI4
CNSTI4 4096
LEI4 $2943
LABELV $2945
line 5043
;5043:				BotAI_Print(PRT_ERROR, "EV_GLOBAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2946
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 5044
;5044:				break;
ADDRGP4 $2923
JUMPV
LABELV $2943
line 5046
;5045:			}
;5046:			trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 4128
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 5059
;5047:			/*
;5048:			if (!strcmp(buf, "sound/teamplay/flagret_red.wav")) {
;5049:				//red flag is returned
;5050:				bs->redflagstatus = 0;
;5051:				bs->flagstatuschanged = qtrue;
;5052:			}
;5053:			else if (!strcmp(buf, "sound/teamplay/flagret_blu.wav")) {
;5054:				//blue flag is returned
;5055:				bs->blueflagstatus = 0;
;5056:				bs->flagstatuschanged = qtrue;
;5057:			}
;5058:			else*/
;5059:			if (!strcmp(buf, "sound/items/kamikazerespawn.wav" )) {
ADDRLP4 4
ARGP4
ADDRGP4 $2949
ARGP4
ADDRLP4 288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $2947
line 5061
;5060:				//the kamikaze respawned so dont avoid it
;5061:				BotDontAvoid(bs, "Kamikaze");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2950
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 5062
;5062:			}
ADDRGP4 $2923
JUMPV
LABELV $2947
line 5064
;5063:			else
;5064:				if (!strcmp(buf, "sound/items/poweruprespawn.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2953
ARGP4
ADDRLP4 292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $2923
line 5066
;5065:				//powerup respawned... go get it
;5066:				BotGoForPowerups(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoForPowerups
CALLV
pop
line 5067
;5067:			}
line 5068
;5068:			break;
ADDRGP4 $2923
JUMPV
LABELV $2954
line 5071
;5069:		}
;5070:		case EV_GLOBAL_TEAM_SOUND:
;5071:		{
line 5072
;5072:			if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 284
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 5
EQI4 $2957
ADDRLP4 284
INDIRI4
CNSTI4 10
NEI4 $2955
LABELV $2957
line 5073
;5073:				switch(state->eventParm) {
ADDRLP4 288
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
LTI4 $2923
ADDRLP4 288
INDIRI4
CNSTI4 5
GTI4 $2923
ADDRLP4 288
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2967
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2967
address $2961
address $2962
address $2963
address $2964
address $2965
address $2966
code
LABELV $2961
line 5075
;5074:					case GTS_RED_CAPTURE:
;5075:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11060
ADDP4
CNSTI4 0
ASGNI4
line 5076
;5076:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11056
ADDP4
CNSTI4 0
ASGNI4
line 5077
;5077:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5078
;5078:						break; //see BotMatch_CTF
ADDRGP4 $2923
JUMPV
LABELV $2962
line 5080
;5079:					case GTS_BLUE_CAPTURE:
;5080:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11060
ADDP4
CNSTI4 0
ASGNI4
line 5081
;5081:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11056
ADDP4
CNSTI4 0
ASGNI4
line 5082
;5082:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5083
;5083:						break; //see BotMatch_CTF
ADDRGP4 $2923
JUMPV
LABELV $2963
line 5086
;5084:					case GTS_RED_RETURN:
;5085:						//blue flag is returned
;5086:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11060
ADDP4
CNSTI4 0
ASGNI4
line 5087
;5087:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5088
;5088:						break;
ADDRGP4 $2923
JUMPV
LABELV $2964
line 5091
;5089:					case GTS_BLUE_RETURN:
;5090:						//red flag is returned
;5091:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11056
ADDP4
CNSTI4 0
ASGNI4
line 5092
;5092:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5093
;5093:						break;
ADDRGP4 $2923
JUMPV
LABELV $2965
line 5096
;5094:					case GTS_RED_TAKEN:
;5095:						//blue flag is taken
;5096:						bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 11060
ADDP4
CNSTI4 1
ASGNI4
line 5097
;5097:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5098
;5098:						break; //see BotMatch_CTF
ADDRGP4 $2923
JUMPV
LABELV $2966
line 5101
;5099:					case GTS_BLUE_TAKEN:
;5100:						//red flag is taken
;5101:						bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 11056
ADDP4
CNSTI4 1
ASGNI4
line 5102
;5102:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5103
;5103:						break; //see BotMatch_CTF
line 5105
;5104:				}
;5105:			}
ADDRGP4 $2923
JUMPV
LABELV $2955
line 5106
;5106:			else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $2923
line 5107
;5107:				switch(state->eventParm) {
ADDRLP4 288
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
LTI4 $2923
ADDRLP4 288
INDIRI4
CNSTI4 5
GTI4 $2923
ADDRLP4 288
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2985
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2985
address $2973
address $2974
address $2975
address $2976
address $2977
address $2981
code
LABELV $2973
line 5109
;5108:					case GTS_RED_CAPTURE:
;5109:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11064
ADDP4
CNSTI4 0
ASGNI4
line 5110
;5110:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5111
;5111:						break;
ADDRGP4 $2923
JUMPV
LABELV $2974
line 5113
;5112:					case GTS_BLUE_CAPTURE:
;5113:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11064
ADDP4
CNSTI4 0
ASGNI4
line 5114
;5114:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5115
;5115:						break;
ADDRGP4 $2923
JUMPV
LABELV $2975
line 5118
;5116:					case GTS_RED_RETURN:
;5117:						//flag has returned
;5118:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11064
ADDP4
CNSTI4 0
ASGNI4
line 5119
;5119:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5120
;5120:						break;
ADDRGP4 $2923
JUMPV
LABELV $2976
line 5123
;5121:					case GTS_BLUE_RETURN:
;5122:						//flag has returned
;5123:						bs->neutralflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 11064
ADDP4
CNSTI4 0
ASGNI4
line 5124
;5124:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5125
;5125:						break;
ADDRGP4 $2923
JUMPV
LABELV $2977
line 5127
;5126:					case GTS_RED_TAKEN:
;5127:						bs->neutralflagstatus = BotTeam(bs) == TEAM_RED ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRLP4 304
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 1
NEI4 $2979
ADDRLP4 296
CNSTI4 2
ASGNI4
ADDRGP4 $2980
JUMPV
LABELV $2979
ADDRLP4 296
CNSTI4 1
ASGNI4
LABELV $2980
ADDRLP4 300
INDIRP4
CNSTI4 11064
ADDP4
ADDRLP4 296
INDIRI4
ASGNI4
line 5128
;5128:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5129
;5129:						break;
ADDRGP4 $2923
JUMPV
LABELV $2981
line 5131
;5130:					case GTS_BLUE_TAKEN:
;5131:						bs->neutralflagstatus = BotTeam(bs) == TEAM_BLUE ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 316
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 2
NEI4 $2983
ADDRLP4 308
CNSTI4 2
ASGNI4
ADDRGP4 $2984
JUMPV
LABELV $2983
ADDRLP4 308
CNSTI4 1
ASGNI4
LABELV $2984
ADDRLP4 312
INDIRP4
CNSTI4 11064
ADDP4
ADDRLP4 308
INDIRI4
ASGNI4
line 5132
;5132:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 11068
ADDP4
CNSTI4 1
ASGNI4
line 5133
;5133:						break;
line 5135
;5134:				}
;5135:			}
line 5136
;5136:			break;
ADDRGP4 $2923
JUMPV
LABELV $2986
line 5139
;5137:		}
;5138:		case EV_PLAYER_TELEPORT_IN:
;5139:		{
line 5140
;5140:			VectorCopy(state->origin, lastteleport_origin);
ADDRGP4 lastteleport_origin
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 5141
;5141:			lastteleport_time = FloatTime();
ADDRGP4 lastteleport_time
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5142
;5142:			break;
ADDRGP4 $2923
JUMPV
LABELV $2987
line 5145
;5143:		}
;5144:		case EV_GENERAL_SOUND:
;5145:		{
line 5147
;5146:			//if this sound is played on the bot
;5147:			if (state->number == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2923
line 5148
;5148:				if (state->eventParm < 0 || state->eventParm > MAX_SOUNDS) {
ADDRLP4 284
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
LTI4 $2992
ADDRLP4 284
INDIRI4
CNSTI4 4096
LEI4 $2990
LABELV $2992
line 5149
;5149:					BotAI_Print(PRT_ERROR, "EV_GENERAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2993
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 5150
;5150:					break;
ADDRGP4 $2923
JUMPV
LABELV $2990
line 5153
;5151:				}
;5152:				//check out the sound
;5153:				trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 4128
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 5155
;5154:				//if falling into a death pit
;5155:				if (!strcmp(buf, "*falling1.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2996
ARGP4
ADDRLP4 288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $2923
line 5157
;5156:					//if the bot has a personal teleporter
;5157:					if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6104
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2923
line 5159
;5158:						//use the holdable item
;5159:						trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 5160
;5160:					}
line 5161
;5161:				}
line 5162
;5162:			}
line 5163
;5163:			break;
line 5191
;5164:		}
;5165:		case EV_FOOTSTEP:
;5166:		case EV_FOOTSTEP_METAL:
;5167:		case EV_FOOTSTEP_FLESH:
;5168:		case EV_FOOTSPLASH:
;5169:		case EV_FOOTWADE:
;5170:		case EV_SWIM:
;5171:		case EV_FALL_SHORT:
;5172:		case EV_FALL_MEDIUM:
;5173:		case EV_FALL_FAR:
;5174:		case EV_STEP_4:
;5175:		case EV_STEP_8:
;5176:		case EV_STEP_12:
;5177:		case EV_STEP_16:
;5178:		case EV_JUMP_PAD:
;5179:		case EV_JUMP:
;5180:		case EV_TAUNT:
;5181:		case EV_WATER_TOUCH:
;5182:		case EV_WATER_LEAVE:
;5183:		case EV_WATER_UNDER:
;5184:		case EV_WATER_CLEAR:
;5185:		case EV_ITEM_PICKUP:
;5186:		case EV_GLOBAL_ITEM_PICKUP:
;5187:		case EV_NOAMMO:
;5188:		case EV_CHANGE_WEAPON:
;5189:		case EV_FIRE_WEAPON:
;5190:			//FIXME: either add to sound queue or mark player as someone making noise
;5191:			break;
line 5207
;5192:		case EV_USE_ITEM0:
;5193:		case EV_USE_ITEM1:
;5194:		case EV_USE_ITEM2:
;5195:		case EV_USE_ITEM3:
;5196:		case EV_USE_ITEM4:
;5197:		case EV_USE_ITEM5:
;5198:		case EV_USE_ITEM6:
;5199:		case EV_USE_ITEM7:
;5200:		case EV_USE_ITEM8:
;5201:		case EV_USE_ITEM9:
;5202:		case EV_USE_ITEM10:
;5203:		case EV_USE_ITEM11:
;5204:		case EV_USE_ITEM12:
;5205:		case EV_USE_ITEM13:
;5206:		case EV_USE_ITEM14:
;5207:			break;
LABELV $2922
LABELV $2923
line 5209
;5208:	}
;5209:}
LABELV $2915
endproc BotCheckEvents 320 12
export BotCheckSnapshot
proc BotCheckSnapshot 236 16
line 5216
;5210:
;5211:/*
;5212:==================
;5213:BotCheckSnapshot
;5214:==================
;5215:*/
;5216:void BotCheckSnapshot(bot_state_t *bs) {
line 5221
;5217:	int ent;
;5218:	entityState_t state;
;5219:
;5220:	//remove all avoid spots
;5221:	trap_BotAddAvoidSpot(bs->ms, vec3_origin, 0, AVOID_CLEAR);
ADDRFP4 0
INDIRP4
CNSTI4 10628
ADDP4
INDIRI4
ARGI4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 5223
;5222:	//reset kamikaze body
;5223:	bs->kamikazebody = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10360
ADDP4
CNSTI4 0
ASGNI4
line 5225
;5224:	//reset number of proxmines
;5225:	bs->numproxmines = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10620
ADDP4
CNSTI4 0
ASGNI4
line 5227
;5226:	//
;5227:	ent = 0;
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRGP4 $3006
JUMPV
LABELV $3005
line 5228
;5228:	while( ( ent = BotAI_GetSnapshotEntity( bs->client, ent, &state ) ) != -1 ) {
line 5230
;5229:		//check the entity state for events
;5230:		BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5232
;5231:		//check for grenades the bot should avoid
;5232:		BotCheckForGrenades(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForGrenades
CALLV
pop
line 5236
;5233:		//
;5234:
;5235:		//check for proximity mines which the bot should deactivate
;5236:		BotCheckForProxMines(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForProxMines
CALLV
pop
line 5238
;5237:		//check for dead bodies with the kamikaze effect which should be gibbed
;5238:		BotCheckForKamikazeBody(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForKamikazeBody
CALLV
pop
line 5239
;5239:	}
LABELV $3006
line 5228
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 228
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 232
ADDRGP4 BotAI_GetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 228
ADDRLP4 232
INDIRI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 -1
NEI4 $3005
line 5241
;5240:	//check the player state for events
;5241:	BotAI_GetEntityState(bs->client, &state);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 5243
;5242:	//copy the player state events to the entity state
;5243:	state.event = bs->cur_ps.externalEvent;
ADDRLP4 0+192
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 5244
;5244:	state.eventParm = bs->cur_ps.externalEventParm;
ADDRLP4 0+196
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 5246
;5245:	//
;5246:	BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5247
;5247:}
LABELV $3004
endproc BotCheckSnapshot 236 16
export BotCheckAir
proc BotCheckAir 4 4
line 5254
;5248:
;5249:/*
;5250:==================
;5251:BotCheckAir
;5252:==================
;5253:*/
;5254:void BotCheckAir(bot_state_t *bs) {
line 5255
;5255:	if (bs->inventory[INVENTORY_ENVIRONMENTSUIT] <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6128
ADDP4
INDIRI4
CNSTI4 0
GTI4 $3011
line 5256
;5256:		if (trap_AAS_PointContents(bs->eye) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)) {
ADDRFP4 0
INDIRP4
CNSTI4 5968
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $3013
line 5257
;5257:			return;
ADDRGP4 $3010
JUMPV
LABELV $3013
line 5259
;5258:		}
;5259:	}
LABELV $3011
line 5260
;5260:	bs->lastair_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10280
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5261
;5261:}
LABELV $3010
endproc BotCheckAir 4 4
export BotAlternateRoute
proc BotAlternateRoute 16 16
line 5268
;5262:
;5263:/*
;5264:==================
;5265:BotAlternateRoute
;5266:==================
;5267:*/
;5268:bot_goal_t *BotAlternateRoute(bot_state_t *bs, bot_goal_t *goal) {
line 5272
;5269:	int t;
;5270:
;5271:	// if the bot has an alternative route goal
;5272:	if (bs->altroutegoal.areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 10796
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3016
line 5274
;5273:		//
;5274:		if (bs->reachedaltroutegoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 10840
ADDP4
INDIRF4
CNSTF4 0
EQF4 $3018
line 5275
;5275:			return goal;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $3015
JUMPV
LABELV $3018
line 5277
;5276:		// travel time towards alternative route goal
;5277:		t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, bs->altroutegoal.areanum, bs->tfl);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 5940
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 10796
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 10080
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 5278
;5278:		if (t && t < 20) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $3020
ADDRLP4 12
INDIRI4
CNSTI4 20
GEI4 $3020
line 5280
;5279:			//BotAI_Print(PRT_MESSAGE, "reached alternate route goal\n");
;5280:			bs->reachedaltroutegoal_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10840
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5281
;5281:		}
LABELV $3020
line 5282
;5282:		memcpy(goal, &bs->altroutegoal, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 10784
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 5283
;5283:		return &bs->altroutegoal;
ADDRFP4 0
INDIRP4
CNSTI4 10784
ADDP4
RETP4
ADDRGP4 $3015
JUMPV
LABELV $3016
line 5285
;5284:	}
;5285:	return goal;
ADDRFP4 4
INDIRP4
RETP4
LABELV $3015
endproc BotAlternateRoute 16 16
export BotGetAlternateRouteGoal
proc BotGetAlternateRouteGoal 24 0
line 5293
;5286:}
;5287:
;5288:/*
;5289:==================
;5290:BotGetAlternateRouteGoal
;5291:==================
;5292:*/
;5293:int BotGetAlternateRouteGoal(bot_state_t *bs, int base) {
line 5298
;5294:	aas_altroutegoal_t *altroutegoals;
;5295:	bot_goal_t *goal;
;5296:	int numaltroutegoals, rnd;
;5297:
;5298:	if (base == TEAM_RED) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $3023
line 5299
;5299:		altroutegoals = red_altroutegoals;
ADDRLP4 12
ADDRGP4 red_altroutegoals
ASGNP4
line 5300
;5300:		numaltroutegoals = red_numaltroutegoals;
ADDRLP4 4
ADDRGP4 red_numaltroutegoals
INDIRI4
ASGNI4
line 5301
;5301:	}
ADDRGP4 $3024
JUMPV
LABELV $3023
line 5302
;5302:	else {
line 5303
;5303:		altroutegoals = blue_altroutegoals;
ADDRLP4 12
ADDRGP4 blue_altroutegoals
ASGNP4
line 5304
;5304:		numaltroutegoals = blue_numaltroutegoals;
ADDRLP4 4
ADDRGP4 blue_numaltroutegoals
INDIRI4
ASGNI4
line 5305
;5305:	}
LABELV $3024
line 5306
;5306:	if (!numaltroutegoals)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3025
line 5307
;5307:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3022
JUMPV
LABELV $3025
line 5308
;5308:	rnd = (float) random() * numaltroutegoals;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5309
;5309:	if (rnd >= numaltroutegoals)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $3027
line 5310
;5310:		rnd = numaltroutegoals-1;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $3027
line 5311
;5311:	goal = &bs->altroutegoal;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 10784
ADDP4
ASGNP4
line 5312
;5312:	goal->areanum = altroutegoals[rnd].areanum;
ADDRLP4 20
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
CNSTI4 24
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 5313
;5313:	VectorCopy(altroutegoals[rnd].origin, goal->origin);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 5314
;5314:	VectorSet(goal->mins, -8, -8, -8);
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
line 5315
;5315:	VectorSet(goal->maxs, 8, 8, 8);
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
line 5316
;5316:	goal->entitynum = 0;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 5317
;5317:	goal->iteminfo = 0;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 5318
;5318:	goal->number = 0;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 5319
;5319:	goal->flags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 5321
;5320:	//
;5321:	bs->reachedaltroutegoal_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10840
ADDP4
CNSTF4 0
ASGNF4
line 5322
;5322:	return qtrue;
CNSTI4 1
RETI4
LABELV $3022
endproc BotGetAlternateRouteGoal 24 0
export BotSetupAlternativeRouteGoals
proc BotSetupAlternativeRouteGoals 16 32
line 5330
;5323:}
;5324:
;5325:/*
;5326:==================
;5327:BotSetupAlternateRouteGoals
;5328:==================
;5329:*/
;5330:void BotSetupAlternativeRouteGoals(void) {
line 5332
;5331:
;5332:	if (altroutegoals_setup)
ADDRGP4 altroutegoals_setup
INDIRI4
CNSTI4 0
EQI4 $3030
line 5333
;5333:		return;
ADDRGP4 $3029
JUMPV
LABELV $3030
line 5334
;5334:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 0
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $3034
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $3032
LABELV $3034
line 5335
;5335:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3037
ARGP4
ADDRGP4 ctf_neutralflag
ARGP4
ADDRLP4 4
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $3035
line 5336
;5336:			BotAI_Print(PRT_WARNING, "No alt routes without Neutral Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3038
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3035
line 5337
;5337:		if (ctf_neutralflag.areanum) {
ADDRGP4 ctf_neutralflag+12
INDIRI4
CNSTI4 0
EQI4 $3033
line 5339
;5338:			//
;5339:			red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_redflag
ARGP4
ADDRGP4 ctf_redflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 8
INDIRI4
ASGNI4
line 5345
;5340:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5341:										ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5342:										red_altroutegoals, MAX_ALTROUTEGOALS,
;5343:										ALTROUTEGOAL_CLUSTERPORTALS|
;5344:										ALTROUTEGOAL_VIEWPORTALS);
;5345:			blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_blueflag
ARGP4
ADDRGP4 ctf_blueflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 12
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 12
INDIRI4
ASGNI4
line 5351
;5346:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5347:										ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5348:										blue_altroutegoals, MAX_ALTROUTEGOALS,
;5349:										ALTROUTEGOAL_CLUSTERPORTALS|
;5350:										ALTROUTEGOAL_VIEWPORTALS);
;5351:		}
line 5352
;5352:	}
ADDRGP4 $3033
JUMPV
LABELV $3032
line 5353
;5353:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $3046
line 5354
;5354:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3050
ARGP4
ADDRGP4 neutralobelisk
ARGP4
ADDRLP4 4
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $3048
line 5355
;5355:			BotAI_Print(PRT_WARNING, "One Flag CTF without Neutral Obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3051
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3048
line 5356
;5356:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_redflag
ARGP4
ADDRGP4 ctf_redflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 8
INDIRI4
ASGNI4
line 5362
;5357:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5358:									ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5359:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5360:									ALTROUTEGOAL_CLUSTERPORTALS|
;5361:									ALTROUTEGOAL_VIEWPORTALS);
;5362:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 ctf_neutralflag
ARGP4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ARGI4
ADDRGP4 ctf_blueflag
ARGP4
ADDRGP4 ctf_blueflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 12
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 12
INDIRI4
ASGNI4
line 5368
;5363:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5364:									ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5365:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5366:									ALTROUTEGOAL_CLUSTERPORTALS|
;5367:									ALTROUTEGOAL_VIEWPORTALS);
;5368:	}
ADDRGP4 $3047
JUMPV
LABELV $3046
line 5369
;5369:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $3056
line 5370
;5370:                if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3050
ARGP4
ADDRGP4 neutralobelisk
ARGP4
ADDRLP4 4
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $3058
line 5371
;5371:			BotAI_Print(PRT_WARNING, "Obelisk without neutral obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3060
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3058
line 5373
;5372:		//
;5373:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 redobelisk
ARGP4
ADDRGP4 redobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 8
INDIRI4
ASGNI4
line 5379
;5374:									neutralobelisk.origin, neutralobelisk.areanum,
;5375:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5376:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5377:									ALTROUTEGOAL_CLUSTERPORTALS|
;5378:									ALTROUTEGOAL_VIEWPORTALS);
;5379:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 blueobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 12
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 12
INDIRI4
ASGNI4
line 5385
;5380:									neutralobelisk.origin, neutralobelisk.areanum,
;5381:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5382:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5383:									ALTROUTEGOAL_CLUSTERPORTALS|
;5384:									ALTROUTEGOAL_VIEWPORTALS);
;5385:	}
ADDRGP4 $3057
JUMPV
LABELV $3056
line 5386
;5386:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $3065
line 5387
;5387:		if (untrap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3050
ARGP4
ADDRGP4 neutralobelisk
ARGP4
ADDRLP4 4
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $3067
line 5388
;5388:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3069
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3067
line 5390
;5389:		//
;5390:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 redobelisk
ARGP4
ADDRGP4 redobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 red_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 red_numaltroutegoals
ADDRLP4 8
INDIRI4
ASGNI4
line 5396
;5391:									neutralobelisk.origin, neutralobelisk.areanum,
;5392:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5393:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5394:									ALTROUTEGOAL_CLUSTERPORTALS|
;5395:									ALTROUTEGOAL_VIEWPORTALS);
;5396:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 neutralobelisk+12
INDIRI4
ARGI4
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 blueobelisk+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRGP4 blue_altroutegoals
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 12
ADDRGP4 trap_AAS_AlternativeRouteGoals
CALLI4
ASGNI4
ADDRGP4 blue_numaltroutegoals
ADDRLP4 12
INDIRI4
ASGNI4
line 5402
;5397:									neutralobelisk.origin, neutralobelisk.areanum,
;5398:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5399:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5400:									ALTROUTEGOAL_CLUSTERPORTALS|
;5401:									ALTROUTEGOAL_VIEWPORTALS);
;5402:	}
LABELV $3065
LABELV $3057
LABELV $3047
LABELV $3033
line 5403
;5403:	altroutegoals_setup = qtrue;
ADDRGP4 altroutegoals_setup
CNSTI4 1
ASGNI4
line 5404
;5404:}
LABELV $3029
endproc BotSetupAlternativeRouteGoals 16 32
export BotDeathmatchAI
proc BotDeathmatchAI 1504 16
line 5411
;5405:
;5406:/*
;5407:==================
;5408:BotDeathmatchAI
;5409:==================
;5410:*/
;5411:void BotDeathmatchAI(bot_state_t *bs, float thinktime) {
line 5417
;5412:	char gender[144], name[144], buf[144];
;5413:	char userinfo[MAX_INFO_STRING];
;5414:	int i;
;5415:
;5416:	//if the bot has just been setup
;5417:	if (bs->setupcount > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10120
ADDP4
INDIRI4
CNSTI4 0
LEI4 $3075
line 5418
;5418:		bs->setupcount--;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 10120
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5419
;5419:		if (bs->setupcount > 0) return;
ADDRFP4 0
INDIRP4
CNSTI4 10120
ADDP4
INDIRI4
CNSTI4 0
LEI4 $3077
ADDRGP4 $3074
JUMPV
LABELV $3077
line 5421
;5420:		//get the gender characteristic
;5421:		trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, sizeof(gender));
ADDRFP4 0
INDIRP4
CNSTI4 10624
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 5423
;5422:		//set the bot gender
;5423:		trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 5424
;5424:		Info_SetValueForKey(userinfo, "sex", gender);
ADDRLP4 148
ARGP4
ADDRGP4 $3079
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 5425
;5425:		trap_SetUserinfo(bs->client, userinfo);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 5427
;5426:		//set the team
;5427:		if ( !bs->map_restart && g_gametype.integer != GT_TOURNAMENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 10124
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3080
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $3080
line 5428
;5428:			Com_sprintf(buf, sizeof(buf), "team %s", bs->settings.team);
ADDRLP4 1316
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $3083
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4764
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5429
;5429:			trap_EA_Command(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1316
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 5430
;5430:		}
LABELV $3080
line 5432
;5431:		//set the chat gender
;5432:		if (gender[0] == 'm') trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 109
NEI4 $3084
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $3085
JUMPV
LABELV $3084
line 5433
;5433:		else if (gender[0] == 'f')  trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $3086
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $3087
JUMPV
LABELV $3086
line 5434
;5434:		else  trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
ADDRFP4 0
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
LABELV $3087
LABELV $3085
line 5436
;5435:		//set the chat name
;5436:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1172
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5437
;5437:		trap_BotSetChatName(bs->cs, name, bs->client);
ADDRLP4 1464
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1464
INDIRP4
CNSTI4 10636
ADDP4
INDIRI4
ARGI4
ADDRLP4 1172
ARGP4
ADDRLP4 1464
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotSetChatName
CALLV
pop
line 5439
;5438:		//
;5439:		bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1468
INDIRP4
CNSTI4 10148
ADDP4
ADDRLP4 1468
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
ASGNI4
line 5440
;5440:		bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1472
INDIRP4
CNSTI4 10152
ADDP4
ADDRLP4 1472
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ASGNI4
line 5442
;5441:		//
;5442:		bs->setupcount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10120
ADDP4
CNSTI4 0
ASGNI4
line 5444
;5443:		//
;5444:		BotSetupAlternativeRouteGoals();
ADDRGP4 BotSetupAlternativeRouteGoals
CALLV
pop
line 5445
;5445:	}
LABELV $3075
line 5447
;5446:	//no ideal view set
;5447:	bs->flags &= ~BFL_IDEALVIEWSET;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 10084
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 5449
;5448:	//
;5449:	if (!BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1464
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1464
INDIRI4
CNSTI4 0
NEI4 $3088
line 5451
;5450:		//set the teleport time
;5451:		BotSetTeleportTime(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeleportTime
CALLV
pop
line 5453
;5452:		//update some inventory values
;5453:		BotUpdateInventory(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUpdateInventory
CALLV
pop
line 5455
;5454:		//check out the snapshot
;5455:		BotCheckSnapshot(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckSnapshot
CALLV
pop
line 5457
;5456:		//check for air
;5457:		BotCheckAir(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAir
CALLV
pop
line 5458
;5458:	}
LABELV $3088
line 5460
;5459:	//check the console messages
;5460:	if(bs->spbot){
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3090
line 5461
;5461:	if(NpcFactionProp(bs, NP_CONTROL, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1468
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 1468
INDIRI4
CNSTI4 0
EQI4 $3091
line 5462
;5462:	BotCheckConsoleMessages(bs);		
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckConsoleMessages
CALLV
pop
line 5463
;5463:	}
line 5464
;5464:	} else {
ADDRGP4 $3091
JUMPV
LABELV $3090
line 5465
;5465:	BotCheckConsoleMessages(bs);	
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckConsoleMessages
CALLV
pop
line 5466
;5466:	}
LABELV $3091
line 5469
;5467:	
;5468:	// patrolling AI should never go for items
;5469:	if( bs->patrolpoints && !bs->ltgtype ){
ADDRLP4 1468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1468
INDIRP4
CNSTI4 13180
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3094
ADDRLP4 1468
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3094
line 5470
;5470:		bs->ltgtype = LTG_PATROL;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 9
ASGNI4
line 5471
;5471:	} else if(!bs->ltgtype && bs->spbot){
ADDRGP4 $3095
JUMPV
LABELV $3094
ADDRLP4 1472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1476
CNSTI4 0
ASGNI4
ADDRLP4 1472
INDIRP4
CNSTI4 10704
ADDP4
INDIRI4
ADDRLP4 1476
INDIRI4
NEI4 $3096
ADDRLP4 1472
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 1476
INDIRI4
EQI4 $3096
line 5472
;5472:		bs->ltgtype = LTG_CAMP;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 7
ASGNI4
line 5473
;5473:	}
LABELV $3096
LABELV $3095
line 5476
;5474:
;5475:	//if not in the intermission and not in observer mode
;5476:	if (!BotIntermission(bs) && !BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1480
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1480
INDIRI4
CNSTI4 0
NEI4 $3098
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1484
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 1484
INDIRI4
CNSTI4 0
NEI4 $3098
line 5478
;5477:		//do team AI
;5478:		BotTeamAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamAI
CALLV
pop
line 5479
;5479:	}
LABELV $3098
line 5481
;5480:	//if the bot has no ai node
;5481:	if (!bs->ainode) {
ADDRFP4 0
INDIRP4
CNSTI4 5932
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3100
line 5482
;5482:		AIEnter_Seek_LTG(bs, "BotDeathmatchAI: no ai node");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3102
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 5483
;5483:	}
LABELV $3100
line 5485
;5484:	//if the bot entered the game less than 8 seconds ago
;5485:	if (!bs->entergamechat && bs->entergame_time > FloatTime() - 8) {
ADDRLP4 1488
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1488
INDIRP4
CNSTI4 10128
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3103
ADDRLP4 1488
INDIRP4
CNSTI4 10168
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
SUBF4
LEF4 $3103
line 5486
;5486:		if (BotChat_EnterGame(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1492
ADDRGP4 BotChat_EnterGame
CALLI4
ASGNI4
ADDRLP4 1492
INDIRI4
CNSTI4 0
EQI4 $3105
line 5487
;5487:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1496
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1496
INDIRP4
ARGP4
ADDRLP4 1500
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1496
INDIRP4
CNSTI4 10200
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1500
INDIRF4
ADDF4
ASGNF4
line 5488
;5488:			AIEnter_Stand(bs, "BotDeathmatchAI: chat enter game");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3107
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 5489
;5489:		}
LABELV $3105
line 5490
;5490:		bs->entergamechat = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10128
ADDP4
CNSTI4 1
ASGNI4
line 5491
;5491:	}
LABELV $3103
line 5493
;5492:	//reset the node switches from the previous frame
;5493:	BotResetNodeSwitches();
ADDRGP4 BotResetNodeSwitches
CALLV
pop
line 5495
;5494:	//execute AI nodes
;5495:	for (i = 0; i < MAX_NODESWITCHES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3108
line 5496
;5496:		if (bs->ainode(bs)) break;
ADDRLP4 1492
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1492
INDIRP4
ARGP4
ADDRLP4 1496
ADDRLP4 1492
INDIRP4
CNSTI4 5932
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1496
INDIRI4
CNSTI4 0
EQI4 $3112
ADDRGP4 $3110
JUMPV
LABELV $3112
line 5497
;5497:	}
LABELV $3109
line 5495
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $3108
LABELV $3110
line 5499
;5498:	//if the bot removed itself :)
;5499:	if (!bs->inuse) return;
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $3114
ADDRGP4 $3074
JUMPV
LABELV $3114
line 5512
;5500:	//if the bot executed too many AI nodes
;5501:	//Sago: FIXME - Outcommented this test... this is wrong
;5502:        #ifdef DEBUG
;5503:        if (i >= MAX_NODESWITCHES) {
;5504:		trap_BotDumpGoalStack(bs->gs);
;5505:		trap_BotDumpAvoidGoals(bs->gs);
;5506:		BotDumpNodeSwitches(bs);
;5507:		ClientName(bs->client, name, sizeof(name));
;5508:                BotAI_Print(PRT_ERROR, "%s at %1.1f switched more than %d AI nodes\n", name, FloatTime(), MAX_NODESWITCHES);
;5509:	}
;5510:        #endif
;5511:	//
;5512:	bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1492
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1492
INDIRP4
CNSTI4 10148
ADDP4
ADDRLP4 1492
INDIRP4
CNSTI4 6100
ADDP4
INDIRI4
ASGNI4
line 5513
;5513:	bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1496
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1496
INDIRP4
CNSTI4 10152
ADDP4
ADDRLP4 1496
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ASGNI4
line 5514
;5514:}
LABELV $3074
endproc BotDeathmatchAI 1504 16
export BotSetEntityNumForGoalWithModel
proc BotSetEntityNumForGoalWithModel 44 4
line 5521
;5515:
;5516:/*
;5517:==================
;5518:BotSetEntityNumForGoalWithModel
;5519:==================
;5520:*/
;5521:void BotSetEntityNumForGoalWithModel(bot_goal_t *goal, int eType, char *modelname) {
line 5526
;5522:	gentity_t *ent;
;5523:	int i, modelindex;
;5524:	vec3_t dir;
;5525:
;5526:	modelindex = G_ModelIndex( modelname );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 5527
;5527:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5528
;5528:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $3120
JUMPV
LABELV $3117
line 5529
;5529:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3122
line 5530
;5530:			continue;
ADDRGP4 $3118
JUMPV
LABELV $3122
line 5532
;5531:		}
;5532:		if ( eType && ent->s.eType != eType) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $3124
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $3124
line 5533
;5533:			continue;
ADDRGP4 $3118
JUMPV
LABELV $3124
line 5535
;5534:		}
;5535:		if (ent->s.modelindex != modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $3126
line 5536
;5536:			continue;
ADDRGP4 $3118
JUMPV
LABELV $3126
line 5538
;5537:		}
;5538:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5539
;5539:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 40
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1120403456
GEF4 $3130
line 5540
;5540:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5541
;5541:			return;
ADDRGP4 $3116
JUMPV
LABELV $3130
line 5543
;5542:		}
;5543:	}
LABELV $3118
line 5528
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $3120
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $3117
line 5544
;5544:}
LABELV $3116
endproc BotSetEntityNumForGoalWithModel 44 4
export BotSetEntityNumForGoal
proc BotSetEntityNumForGoal 36 8
line 5551
;5545:
;5546:/*
;5547:==================
;5548:BotSetEntityNumForGoal
;5549:==================
;5550:*/
;5551:void BotSetEntityNumForGoal(bot_goal_t *goal, char *classname) {
line 5556
;5552:	gentity_t *ent;
;5553:	int i;
;5554:	vec3_t dir;
;5555:
;5556:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5557
;5557:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $3136
JUMPV
LABELV $3133
line 5558
;5558:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $3138
line 5559
;5559:			continue;
ADDRGP4 $3134
JUMPV
LABELV $3138
line 5561
;5560:		}
;5561:		if ( !Q_stricmp(ent->classname, classname) ) {
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $3140
line 5562
;5562:			continue;
ADDRGP4 $3134
JUMPV
LABELV $3140
line 5564
;5563:		}
;5564:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5565
;5565:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $3144
line 5566
;5566:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5567
;5567:			return;
ADDRGP4 $3132
JUMPV
LABELV $3144
line 5569
;5568:		}
;5569:	}
LABELV $3134
line 5557
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $3136
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $3133
line 5570
;5570:}
LABELV $3132
endproc BotSetEntityNumForGoal 36 8
export BotGoalForBSPEntity
proc BotGoalForBSPEntity 1128 20
line 5577
;5571:
;5572:/*
;5573:==================
;5574:BotGoalForBSPEntity
;5575:==================
;5576:*/
;5577:int BotGoalForBSPEntity( char *classname, bot_goal_t *goal ) {
line 5582
;5578:	char value[MAX_INFO_STRING];
;5579:	vec3_t origin, start, end;
;5580:	int ent, numareas, areas[10];
;5581:
;5582:	memset(goal, 0, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5583
;5583:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 1108
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1108
INDIRI4
ASGNI4
ADDRGP4 $3150
JUMPV
LABELV $3147
line 5584
;5584:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", value, sizeof(value)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2610
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $3151
line 5585
;5585:			continue;
ADDRGP4 $3148
JUMPV
LABELV $3151
line 5586
;5586:		if (!strcmp(value, classname)) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $3153
line 5587
;5587:			if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2626
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1120
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $3155
line 5588
;5588:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3146
JUMPV
LABELV $3155
line 5589
;5589:			VectorCopy(origin, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 12
line 5590
;5590:			VectorCopy(origin, start);
ADDRLP4 1040
ADDRLP4 1028
INDIRB
ASGNB 12
line 5591
;5591:			start[2] -= 32;
ADDRLP4 1040+8
ADDRLP4 1040+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5592
;5592:			VectorCopy(origin, end);
ADDRLP4 1052
ADDRLP4 1028
INDIRB
ASGNB 12
line 5593
;5593:			end[2] += 32;
ADDRLP4 1052+8
ADDRLP4 1052+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 5594
;5594:			numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 1040
ARGP4
ADDRLP4 1052
ARGP4
ADDRLP4 1068
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 1124
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1124
INDIRI4
ASGNI4
line 5595
;5595:			if (!numareas)
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $3159
line 5596
;5596:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3146
JUMPV
LABELV $3159
line 5597
;5597:			goal->areanum = areas[0];
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 5598
;5598:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3146
JUMPV
LABELV $3153
line 5600
;5599:		}
;5600:	}
LABELV $3148
line 5583
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1112
INDIRI4
ASGNI4
LABELV $3150
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $3147
line 5601
;5601:	return qfalse;
CNSTI4 0
RETI4
LABELV $3146
endproc BotGoalForBSPEntity 1128 20
export BotSetupDeathmatchAI
proc BotSetupDeathmatchAI 168 16
line 5609
;5602:}
;5603:
;5604:/*
;5605:==================
;5606:BotSetupDeathmatchAI
;5607:==================
;5608:*/
;5609:void BotSetupDeathmatchAI(void) {
line 5613
;5610:	int ent, modelnum,i;
;5611:	char model[128];
;5612:
;5613:	gametype = trap_Cvar_VariableIntegerValue("g_gametype");
ADDRGP4 $3162
ARGP4
ADDRLP4 140
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 gametype
ADDRLP4 140
INDIRI4
ASGNI4
line 5614
;5614:	maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $597
ARGP4
ADDRLP4 144
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 maxclients
ADDRLP4 144
INDIRI4
ASGNI4
line 5616
;5615:
;5616:	trap_Cvar_Register(&bot_rocketjump, "bot_rocketjump", "1", 0);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 $3163
ARGP4
ADDRGP4 $2873
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5617
;5617:	trap_Cvar_Register(&bot_grapple, "bot_grapple", "1", 0);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 $3164
ARGP4
ADDRGP4 $2873
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5618
;5618:	trap_Cvar_Register(&bot_fastchat, "bot_fastchat", "0", 0);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 $3165
ARGP4
ADDRGP4 $3166
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5619
;5619:	trap_Cvar_Register(&bot_nochat, "bot_nochat", "0", 0);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 $3167
ARGP4
ADDRGP4 $3166
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5620
;5620:	trap_Cvar_Register(&bot_testrchat, "bot_testrchat", "0", 0);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 $2872
ARGP4
ADDRGP4 $3166
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5621
;5621:	trap_Cvar_Register(&bot_challenge, "bot_challenge", "0", 0);
ADDRGP4 bot_challenge
ARGP4
ADDRGP4 $3168
ARGP4
ADDRGP4 $3166
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5622
;5622:	trap_Cvar_Register(&bot_predictobstacles, "bot_predictobstacles", "1", 0);
ADDRGP4 bot_predictobstacles
ARGP4
ADDRGP4 $3169
ARGP4
ADDRGP4 $2873
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5623
;5623:	trap_Cvar_Register(&g_spSkill, "g_spSkill", "2", 0);
ADDRGP4 g_spSkill
ARGP4
ADDRGP4 $3170
ARGP4
ADDRGP4 $3171
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5625
;5624:	//
;5625:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 148
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 5
EQI4 $3174
ADDRLP4 148
INDIRI4
CNSTI4 10
NEI4 $3172
LABELV $3174
line 5626
;5626:		if (untrap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3177
ARGP4
ADDRGP4 ctf_redflag
ARGP4
ADDRLP4 152
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
GEI4 $3175
line 5627
;5627:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3178
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3175
line 5628
;5628:		if (untrap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3181
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
ADDRLP4 156
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
GEI4 $3173
line 5629
;5629:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3182
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 5630
;5630:	}
ADDRGP4 $3173
JUMPV
LABELV $3172
line 5631
;5631:	else if (gametype == GT_DOUBLE_D) {
ADDRGP4 gametype
INDIRI4
CNSTI4 12
NEI4 $3183
line 5632
;5632:		if (untrap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3177
ARGP4
ADDRGP4 ctf_redflag
ARGP4
ADDRLP4 152
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
GEI4 $3185
line 5633
;5633:			BotAI_Print(PRT_WARNING, "DD without Point A\n");
CNSTI4 2
ARGI4
ADDRGP4 $3187
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3185
line 5634
;5634:		if (untrap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3181
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
ADDRLP4 156
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
GEI4 $3184
line 5635
;5635:			BotAI_Print(PRT_WARNING, "DD without Point B\n");
CNSTI4 2
ARGI4
ADDRGP4 $3190
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 5636
;5636:	}
ADDRGP4 $3184
JUMPV
LABELV $3183
line 5637
;5637:        else if (gametype == GT_DOMINATION) {
ADDRGP4 gametype
INDIRI4
CNSTI4 13
NEI4 $3191
line 5638
;5638:            ent = untrap_BotGetLevelItemGoal(-1, "Domination point", &dom_points_bot[0]);
CNSTI4 -1
ARGI4
ADDRGP4 $3193
ARGP4
ADDRGP4 dom_points_bot
ARGP4
ADDRLP4 152
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 152
INDIRI4
ASGNI4
line 5639
;5639:            if(ent < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $3194
line 5640
;5640:		BotAI_Print(PRT_WARNING, "Domination without a single domination point\n");
CNSTI4 2
ARGI4
ADDRGP4 $3196
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
ADDRGP4 $3195
JUMPV
LABELV $3194
line 5642
;5641:            else
;5642:                BotSetEntityNumForGoal(&dom_points_bot[0], va("domination_point%i",0) );
ADDRGP4 $3197
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 156
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 dom_points_bot
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
LABELV $3195
line 5643
;5643:            for(i=1;i<level.domination_points_count;i++) {
ADDRLP4 136
CNSTI4 1
ASGNI4
ADDRGP4 $3201
JUMPV
LABELV $3198
line 5645
;5644:                //Find next from the privius found entity
;5645:                ent = untrap_BotGetLevelItemGoal(ent, "Domination point", &dom_points_bot[i]);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $3193
ARGP4
CNSTI4 56
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 dom_points_bot
ADDP4
ARGP4
ADDRLP4 160
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 160
INDIRI4
ASGNI4
line 5646
;5646:                if(ent < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $3203
line 5647
;5647:                    BotAI_Print(PRT_WARNING, "Domination point %i not found!\n",i);
CNSTI4 2
ARGI4
ADDRGP4 $3205
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
ADDRGP4 $3204
JUMPV
LABELV $3203
line 5649
;5648:                else
;5649:                    BotSetEntityNumForGoal(&dom_points_bot[0], va("domination_point%i",i) );
ADDRGP4 $3197
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 dom_points_bot
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
LABELV $3204
line 5650
;5650:            }
LABELV $3199
line 5643
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3201
ADDRLP4 136
INDIRI4
ADDRGP4 level+10076
INDIRI4
LTI4 $3198
line 5652
;5651:            //MAX_DOMINATION_POINTS
;5652:	}
ADDRGP4 $3192
JUMPV
LABELV $3191
line 5653
;5653:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $3206
line 5654
;5654:		if (untrap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3037
ARGP4
ADDRGP4 ctf_neutralflag
ARGP4
ADDRLP4 152
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
GEI4 $3208
line 5655
;5655:			BotAI_Print(PRT_WARNING, "One Flag CTF without Neutral Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3210
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3208
line 5656
;5656:		if (untrap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3177
ARGP4
ADDRGP4 ctf_redflag
ARGP4
ADDRLP4 156
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
GEI4 $3211
line 5657
;5657:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3178
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3211
line 5658
;5658:		if (untrap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3181
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
ADDRLP4 160
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
GEI4 $3207
line 5659
;5659:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $3182
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 5660
;5660:	}
ADDRGP4 $3207
JUMPV
LABELV $3206
line 5661
;5661:	else if (gametype == GT_OBELISK) {
ADDRGP4 gametype
INDIRI4
CNSTI4 7
NEI4 $3215
line 5662
;5662:		if (untrap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3219
ARGP4
ADDRGP4 redobelisk
ARGP4
ADDRLP4 152
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
GEI4 $3217
line 5663
;5663:			BotAI_Print(PRT_WARNING, "Obelisk without red obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3220
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3217
line 5664
;5664:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
ADDRGP4 redobelisk
ARGP4
ADDRGP4 $3221
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5665
;5665:		if (untrap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3224
ARGP4
ADDRGP4 blueobelisk
ARGP4
ADDRLP4 156
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
GEI4 $3222
line 5666
;5666:			BotAI_Print(PRT_WARNING, "Obelisk without blue obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3225
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3222
line 5667
;5667:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 $3226
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5668
;5668:	}
ADDRGP4 $3216
JUMPV
LABELV $3215
line 5669
;5669:	else if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $3227
line 5670
;5670:		if (untrap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3219
ARGP4
ADDRGP4 redobelisk
ARGP4
ADDRLP4 152
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
GEI4 $3229
line 5671
;5671:			BotAI_Print(PRT_WARNING, "Harvester without red obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3231
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3229
line 5672
;5672:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
ADDRGP4 redobelisk
ARGP4
ADDRGP4 $3221
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5673
;5673:		if (untrap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3224
ARGP4
ADDRGP4 blueobelisk
ARGP4
ADDRLP4 156
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
GEI4 $3232
line 5674
;5674:			BotAI_Print(PRT_WARNING, "Harvester without blue obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3234
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3232
line 5675
;5675:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
ADDRGP4 blueobelisk
ARGP4
ADDRGP4 $3226
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5676
;5676:		if (untrap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $3050
ARGP4
ADDRGP4 neutralobelisk
ARGP4
ADDRLP4 160
ADDRGP4 untrap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
GEI4 $3235
line 5677
;5677:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
CNSTI4 2
ARGI4
ADDRGP4 $3069
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $3235
line 5678
;5678:		BotSetEntityNumForGoal(&neutralobelisk, "team_neutralobelisk");
ADDRGP4 neutralobelisk
ARGP4
ADDRGP4 $3237
ARGP4
ADDRGP4 BotSetEntityNumForGoal
CALLV
pop
line 5679
;5679:	}
LABELV $3227
LABELV $3216
LABELV $3207
LABELV $3192
LABELV $3184
LABELV $3173
line 5681
;5680:
;5681:	max_bspmodelindex = 0;
ADDRGP4 max_bspmodelindex
CNSTI4 0
ASGNI4
line 5682
;5682:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 152
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 152
INDIRI4
ASGNI4
ADDRGP4 $3241
JUMPV
LABELV $3238
line 5683
;5683:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $592
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 156
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $3242
ADDRGP4 $3239
JUMPV
LABELV $3242
line 5684
;5684:		if (model[0] == '*') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $3244
line 5685
;5685:			modelnum = atoi(model+1);
ADDRLP4 4+1
ARGP4
ADDRLP4 160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 160
INDIRI4
ASGNI4
line 5686
;5686:			if (modelnum > max_bspmodelindex)
ADDRLP4 132
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
LEI4 $3247
line 5687
;5687:				max_bspmodelindex = modelnum;
ADDRGP4 max_bspmodelindex
ADDRLP4 132
INDIRI4
ASGNI4
LABELV $3247
line 5688
;5688:		}
LABELV $3244
line 5689
;5689:	}
LABELV $3239
line 5682
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 156
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 156
INDIRI4
ASGNI4
LABELV $3241
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $3238
line 5691
;5690:	//initialize the waypoint heap
;5691:	BotInitWaypoints();
ADDRGP4 BotInitWaypoints
CALLV
pop
line 5692
;5692:}
LABELV $3161
endproc BotSetupDeathmatchAI 168 16
export BotShutdownDeathmatchAI
proc BotShutdownDeathmatchAI 0 0
line 5699
;5693:
;5694:/*
;5695:==================
;5696:BotShutdownDeathmatchAI
;5697:==================
;5698:*/
;5699:void BotShutdownDeathmatchAI(void) {
line 5700
;5700:	altroutegoals_setup = qfalse;
ADDRGP4 altroutegoals_setup
CNSTI4 0
ASGNI4
line 5701
;5701:}
LABELV $3249
endproc BotShutdownDeathmatchAI 0 0
import NpcFactionProp
import strcasecmp
bss
export blue_numaltroutegoals
align 4
LABELV blue_numaltroutegoals
skip 4
export blue_altroutegoals
align 4
LABELV blue_altroutegoals
skip 768
export red_numaltroutegoals
align 4
LABELV red_numaltroutegoals
skip 4
export red_altroutegoals
align 4
LABELV red_altroutegoals
skip 768
export altroutegoals_setup
align 4
LABELV altroutegoals_setup
skip 4
export dom_points_bot
align 4
LABELV dom_points_bot
skip 448
export max_bspmodelindex
align 4
LABELV max_bspmodelindex
skip 4
export lastteleport_time
align 4
LABELV lastteleport_time
skip 4
export lastteleport_origin
align 4
LABELV lastteleport_origin
skip 12
import bot_developer
export g_spSkill
align 4
LABELV g_spSkill
skip 272
export bot_predictobstacles
align 4
LABELV bot_predictobstacles
skip 272
export botai_freewaypoints
align 4
LABELV botai_freewaypoints
skip 4
export botai_waypoints
align 4
LABELV botai_waypoints
skip 13824
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
export neutralobelisk
align 4
LABELV neutralobelisk
skip 56
export blueobelisk
align 4
LABELV blueobelisk
skip 56
export redobelisk
align 4
LABELV redobelisk
skip 56
export ctf_neutralflag
align 4
LABELV ctf_neutralflag
skip 56
export ctf_blueflag
align 4
LABELV ctf_blueflag
skip 56
export ctf_redflag
align 4
LABELV ctf_redflag
skip 56
export bot_challenge
align 4
LABELV bot_challenge
skip 272
export bot_testrchat
align 4
LABELV bot_testrchat
skip 272
export bot_nochat
align 4
LABELV bot_nochat
skip 272
export bot_fastchat
align 4
LABELV bot_fastchat
skip 272
export bot_rocketjump
align 4
LABELV bot_rocketjump
skip 272
export bot_grapple
align 4
LABELV bot_grapple
skip 272
export maxclients
align 4
LABELV maxclients
skip 4
export gametype
align 4
LABELV gametype
skip 4
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
LABELV $3237
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
LABELV $3234
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3231
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3226
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
LABELV $3225
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3224
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
LABELV $3221
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
LABELV $3220
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3219
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
LABELV $3210
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $3205
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
byte 1 37
byte 1 105
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
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3197
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
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $3196
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
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
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
byte 1 10
byte 1 0
align 1
LABELV $3193
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
byte 1 0
align 1
LABELV $3190
byte 1 68
byte 1 68
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 10
byte 1 0
align 1
LABELV $3187
byte 1 68
byte 1 68
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 65
byte 1 10
byte 1 0
align 1
LABELV $3182
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $3181
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
LABELV $3178
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $3177
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
LABELV $3171
byte 1 50
byte 1 0
align 1
LABELV $3170
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $3169
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 98
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3168
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $3167
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $3166
byte 1 48
byte 1 0
align 1
LABELV $3165
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $3164
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $3163
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $3162
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $3107
byte 1 66
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3102
byte 1 66
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $3083
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $3079
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $3069
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3060
byte 1 79
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $3051
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $3050
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
LABELV $3038
byte 1 78
byte 1 111
byte 1 32
byte 1 97
byte 1 108
byte 1 116
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $3037
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
LABELV $2996
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
LABELV $2993
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
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
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
byte 1 10
byte 1 0
align 1
LABELV $2953
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2950
byte 1 75
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $2949
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2946
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
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
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
byte 1 10
byte 1 0
align 1
LABELV $2884
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2877
byte 1 42
byte 1 42
byte 1 42
byte 1 42
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
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 42
byte 1 10
byte 1 0
align 1
LABELV $2876
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $2873
byte 1 49
byte 1 0
align 1
LABELV $2872
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2738
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
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
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2737
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 97
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
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2733
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 111
byte 1 70
byte 1 111
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $2721
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $2720
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $2717
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2706
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2693
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2687
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2679
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $2668
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $2664
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
LABELV $2661
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2626
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2621
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
LABELV $2616
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2613
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2610
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
LABELV $2609
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2597
byte 1 42
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2412
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $2389
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2386
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $2348
byte 1 109
byte 1 112
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $2293
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $2289
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1353
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
LABELV $1352
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1351
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
LABELV $1350
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
LABELV $1349
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
LABELV $1130
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 87
byte 1 97
byte 1 121
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 79
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1114
byte 1 116
byte 1 0
align 1
LABELV $784
byte 1 119
byte 1 97
byte 1 110
byte 1 116
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
LABELV $771
byte 1 119
byte 1 97
byte 1 110
byte 1 116
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
LABELV $642
byte 1 93
byte 1 0
align 1
LABELV $641
byte 1 91
byte 1 0
align 1
LABELV $640
byte 1 32
byte 1 0
align 1
LABELV $597
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
align 1
LABELV $592
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $591
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
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
byte 1 10
byte 1 0
align 1
LABELV $586
byte 1 110
byte 1 0
align 1
LABELV $585
byte 1 91
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
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
byte 1 93
byte 1 0
align 1
LABELV $584
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
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
byte 1 10
byte 1 0
align 1
LABELV $275
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $250
byte 1 105
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $227
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $200
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $199
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $85
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $79
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $78
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $77
byte 1 108
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $76
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $75
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $74
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $73
byte 1 111
byte 1 110
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $72
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $71
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $70
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $69
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $68
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $67
byte 1 115
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
