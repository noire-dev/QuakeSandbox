export BotVoiceChat_GetFlag
code
proc BotVoiceChat_GetFlag 20 12
file "../../../code/game/ai_vcmd.c"
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
;25: * name:		ai_vcmd.c
;26: *
;27: * desc:		Quake3 bot AI
;28: *
;29: * $Archive: /MissionPack/code/game/ai_vcmd.c $
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
;51://
;52:#include "chars.h"				//characteristics
;53:#include "inv.h"				//indexes into the inventory
;54:#include "syn.h"				//synonyms
;55:#include "match.h"				//string matching types and vars
;56:
;57:// for the voice chats
;58:#include "../../ui/menudef.h"
;59:
;60:
;61:typedef struct voiceCommand_s
;62:{
;63:	char *cmd;
;64:	void (*func)(bot_state_t *bs, int client, int mode);
;65:} voiceCommand_t;
;66:
;67:/*
;68:==================
;69:BotVoiceChat_GetFlag
;70:==================
;71:*/
;72:void BotVoiceChat_GetFlag(bot_state_t *bs, int client, int mode) {
line 73
;73:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
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
NEI4 $66
line 74
;74:        return; // spbot no chat
ADDRGP4 $65
JUMPV
LABELV $66
line 77
;75:}
;76:	//
;77:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 4
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
EQI4 $70
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $68
LABELV $70
line 78
;78:		if (!ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $75
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $69
LABELV $75
line 79
;79:			return;
ADDRGP4 $65
JUMPV
line 80
;80:	}
LABELV $68
line 81
;81:	else if (gametype == GT_1FCTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 6
NEI4 $65
line 82
;82:		if (!ctf_neutralflag.areanum || !ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 ctf_neutralflag+12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $84
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $84
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $77
LABELV $84
line 83
;83:			return;
ADDRGP4 $65
JUMPV
line 84
;84:	}
line 85
;85:	else {
line 86
;86:		return;
LABELV $77
LABELV $69
line 89
;87:	}
;88:	//
;89:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 90
;90:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 91
;91:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 93
;92:	//set the time to send a message to the team mates
;93:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 8
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
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 95
;94:	//set the ltg type
;95:	bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 4
ASGNI4
line 97
;96:	//set the team goal time
;97:	bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 99
;98:	// get an alternate route in ctf
;99:	if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION) {
ADDRLP4 12
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 5
EQI4 $87
ADDRLP4 12
INDIRI4
CNSTI4 10
NEI4 $85
LABELV $87
line 101
;100:		//get an alternative route goal towards the enemy base
;101:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 102
;102:	}
LABELV $85
line 104
;103:	//
;104:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 106
;105:	// remember last ordered task
;106:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 110
;107:#ifdef DEBUG
;108:	BotPrintTeamGoal(bs);
;109:#endif //DEBUG
;110:}
LABELV $65
endproc BotVoiceChat_GetFlag 20 12
export BotVoiceChat_Offense
proc BotVoiceChat_Offense 12 12
line 117
;111:
;112:/*
;113:==================
;114:BotVoiceChat_Offense
;115:==================
;116:*/
;117:void BotVoiceChat_Offense(bot_state_t *bs, int client, int mode) {
line 118
;118:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
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
NEI4 $89
line 119
;119:        return; // spbot no chat
ADDRGP4 $88
JUMPV
LABELV $89
line 121
;120:}
;121:	if ( gametype == GT_CTF || gametype == GT_CTF_ELIMINATION || gametype == GT_1FCTF ) {
ADDRLP4 4
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
EQI4 $94
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $94
ADDRLP4 4
INDIRI4
CNSTI4 6
NEI4 $91
LABELV $94
line 122
;122:		BotVoiceChat_GetFlag(bs, client, mode);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotVoiceChat_GetFlag
CALLV
pop
line 123
;123:		return;
ADDRGP4 $88
JUMPV
LABELV $91
line 125
;124:	}
;125:	if (gametype == GT_HARVESTER) {
ADDRGP4 gametype
INDIRI4
CNSTI4 8
NEI4 $95
line 127
;126:		//
;127:		bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 128
;128:		bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 129
;129:		bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 131
;130:		//set the time to send a message to the team mates
;131:		bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 8
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
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 133
;132:		//set the ltg type
;133:		bs->ltgtype = LTG_HARVEST;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 12
ASGNI4
line 135
;134:		//set the team goal time
;135:		bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 136
;136:		bs->harvestaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10264
ADDP4
CNSTF4 0
ASGNF4
line 138
;137:		//
;138:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 140
;139:		// remember last ordered task
;140:		BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 141
;141:	}
ADDRGP4 $96
JUMPV
LABELV $95
line 143
;142:	else
;143:	{
line 145
;144:		//
;145:		bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 146
;146:		bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 147
;147:		bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 149
;148:		//set the time to send a message to the team mates
;149:		bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 8
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
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 151
;150:		//set the ltg type
;151:		bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 13
ASGNI4
line 153
;152:		//set the team goal time
;153:		bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 154
;154:		bs->attackaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10260
ADDP4
CNSTF4 0
ASGNF4
line 156
;155:		//
;156:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 158
;157:		// remember last ordered task
;158:		BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 159
;159:	}
LABELV $96
line 163
;160:#ifdef DEBUG
;161:	BotPrintTeamGoal(bs);
;162:#endif //DEBUG
;163:}
LABELV $88
endproc BotVoiceChat_Offense 12 12
export BotVoiceChat_Defend
proc BotVoiceChat_Defend 24 12
line 170
;164:
;165:/*
;166:==================
;167:BotVoiceChat_Defend
;168:==================
;169:*/
;170:void BotVoiceChat_Defend(bot_state_t *bs, int client, int mode) {
line 171
;171:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
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
NEI4 $98
line 172
;172:        return; // spbot no chat
ADDRGP4 $97
JUMPV
LABELV $98
line 174
;173:}
;174:	if ( gametype == GT_OBELISK || gametype == GT_HARVESTER) {
ADDRLP4 4
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 7
EQI4 $102
ADDRLP4 4
INDIRI4
CNSTI4 8
NEI4 $100
LABELV $102
line 176
;175:		//
;176:		switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $106
ADDRLP4 8
INDIRI4
CNSTI4 2
EQI4 $107
ADDRGP4 $97
JUMPV
LABELV $106
line 177
;177:			case TEAM_RED: memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t)); break;
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
ADDRGP4 $101
JUMPV
LABELV $107
line 178
;178:			case TEAM_BLUE: memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t)); break;
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
line 179
;179:			default: return;
line 181
;180:		}
;181:	}
ADDRGP4 $101
JUMPV
LABELV $100
line 183
;182:	else
;183:		if (gametype == GT_CTF || gametype == GT_CTF_ELIMINATION || gametype == GT_1FCTF ) {
ADDRLP4 8
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
EQI4 $111
ADDRLP4 8
INDIRI4
CNSTI4 10
EQI4 $111
ADDRLP4 8
INDIRI4
CNSTI4 6
NEI4 $97
LABELV $111
line 185
;184:                    //
;185:                    switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $115
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $116
ADDRGP4 $97
JUMPV
LABELV $115
line 186
;186:			case TEAM_RED: memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t)); break;
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
ADDRGP4 $109
JUMPV
LABELV $116
line 187
;187:			case TEAM_BLUE: memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t)); break;
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
line 188
;188:			default: return;
line 190
;189:		}
;190:	}
line 191
;191:	else {
line 192
;192:		return;
LABELV $109
LABELV $101
line 195
;193:	}
;194:	//
;195:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 196
;196:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 197
;197:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 199
;198:	//set the time to send a message to the team mates
;199:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 12
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
line 201
;200:	//set the ltg type
;201:	bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 3
ASGNI4
line 203
;202:	//get the team goal time
;203:	bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 205
;204:	//away from defending
;205:	bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10248
ADDP4
CNSTF4 0
ASGNF4
line 207
;206:	//
;207:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 209
;208:	// remember last ordered task
;209:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 213
;210:#ifdef DEBUG
;211:	BotPrintTeamGoal(bs);
;212:#endif //DEBUG
;213:}
LABELV $97
endproc BotVoiceChat_Defend 24 12
export BotVoiceChat_DefendFlag
proc BotVoiceChat_DefendFlag 4 12
line 220
;214:
;215:/*
;216:==================
;217:BotVoiceChat_DefendFlag
;218:==================
;219:*/
;220:void BotVoiceChat_DefendFlag(bot_state_t *bs, int client, int mode) {
line 221
;221:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
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
NEI4 $118
line 222
;222:        return; // spbot no chat
ADDRGP4 $117
JUMPV
LABELV $118
line 224
;223:}
;224:	BotVoiceChat_Defend(bs, client, mode);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotVoiceChat_Defend
CALLV
pop
line 225
;225:}
LABELV $117
endproc BotVoiceChat_DefendFlag 4 12
export BotVoiceChat_Patrol
proc BotVoiceChat_Patrol 4 12
line 232
;226:
;227:/*
;228:==================
;229:BotVoiceChat_Patrol
;230:==================
;231:*/
;232:void BotVoiceChat_Patrol(bot_state_t *bs, int client, int mode) {
line 233
;233:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
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
NEI4 $121
line 234
;234:        return; // spbot no chat
ADDRGP4 $120
JUMPV
LABELV $121
line 237
;235:}
;236:	//
;237:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 239
;238:	//
;239:	bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 0
ASGNI4
line 240
;240:	bs->lead_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10988
ADDP4
CNSTF4 0
ASGNF4
line 241
;241:	bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10864
ADDP4
CNSTI4 0
ASGNI4
line 243
;242:	//
;243:	BotAI_BotInitialChat(bs, "dismissed", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $123
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 244
;244:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
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
line 245
;245:	BotVoiceChatOnly(bs, -1, VOICECHAT_ONPATROL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $124
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 247
;246:	//
;247:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 251
;248:#ifdef DEBUG
;249:	BotPrintTeamGoal(bs);
;250:#endif //DEBUG
;251:}
LABELV $120
endproc BotVoiceChat_Patrol 4 12
export BotVoiceChat_Camp
proc BotVoiceChat_Camp 188 16
line 258
;252:
;253:/*
;254:==================
;255:BotVoiceChat_Camp
;256:==================
;257:*/
;258:void BotVoiceChat_Camp(bot_state_t *bs, int client, int mode) {
line 263
;259:	int areanum;
;260:	aas_entityinfo_t entinfo;
;261:	char netname[MAX_NETNAME];
;262:	
;263:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $126
line 264
;264:        return; // spbot no chat
ADDRGP4 $125
JUMPV
LABELV $126
line 268
;265:}
;266:
;267:	//
;268:	bs->teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
CNSTI4 -1
ASGNI4
line 269
;269:	BotEntityInfo(client, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 271
;270:	//if info is valid (in PVS)
;271:	if (entinfo.valid) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $128
line 272
;272:		areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 0+24
ARGP4
ADDRLP4 184
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 184
INDIRI4
ASGNI4
line 273
;273:		if (areanum) { // && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $131
line 276
;274:			//NOTE: just assume the bot knows where the person is
;275:			//if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, client)) {
;276:				bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 277
;277:				bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10740
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 278
;278:				VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 279
;279:				VectorSet(bs->teamgoal.mins, -8, -8, -8);
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
line 280
;280:				VectorSet(bs->teamgoal.maxs, 8, 8, 8);
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
line 282
;281:			//}
;282:		}
LABELV $131
line 283
;283:	}
LABELV $128
line 285
;284:	//if the other is not visible
;285:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
CNSTI4 0
GEI4 $134
line 286
;286:		BotAI_BotInitialChat(bs, "whereareyou", EasyClientName(client, netname, sizeof(netname)), NULL);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 144
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 184
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 184
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 287
;287:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
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
line 288
;288:		return;
ADDRGP4 $125
JUMPV
LABELV $134
line 291
;289:	}
;290:	//
;291:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 292
;292:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 293
;293:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 295
;294:	//set the time to send a message to the team mates
;295:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 184
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
ADDRLP4 184
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 297
;296:	//set the ltg type
;297:	bs->ltgtype = LTG_CAMPORDER;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 8
ASGNI4
line 299
;298:	//get the team goal time
;299:	bs->teamgoal_time = FloatTime() + TEAM_CAMP_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 301
;300:	//the teammate that requested the camping
;301:	bs->teammate = client;
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 303
;302:	//not arrived yet
;303:	bs->arrive_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
CNSTF4 0
ASGNF4
line 305
;304:	//
;305:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 307
;306:	// remember last ordered task
;307:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 311
;308:#ifdef DEBUG
;309:	BotPrintTeamGoal(bs);
;310:#endif //DEBUG
;311:}
LABELV $125
endproc BotVoiceChat_Camp 188 16
export BotVoiceChat_FollowMe
proc BotVoiceChat_FollowMe 188 16
line 318
;312:
;313:/*
;314:==================
;315:BotVoiceChat_FollowMe
;316:==================
;317:*/
;318:void BotVoiceChat_FollowMe(bot_state_t *bs, int client, int mode) {
line 323
;319:	int areanum;
;320:	aas_entityinfo_t entinfo;
;321:	char netname[MAX_NETNAME];
;322:	
;323:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $138
line 324
;324:        return; // spbot no chat
ADDRGP4 $137
JUMPV
LABELV $138
line 327
;325:}
;326:
;327:	bs->teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
CNSTI4 -1
ASGNI4
line 328
;328:	BotEntityInfo(client, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 330
;329:	//if info is valid (in PVS)
;330:	if (entinfo.valid) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $140
line 331
;331:		areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 0+24
ARGP4
ADDRLP4 184
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 184
INDIRI4
ASGNI4
line 332
;332:		if (areanum) { // && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $143
line 333
;333:			bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 334
;334:			bs->teamgoal.areanum = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 10740
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 335
;335:			VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 10728
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 336
;336:			VectorSet(bs->teamgoal.mins, -8, -8, -8);
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
line 337
;337:			VectorSet(bs->teamgoal.maxs, 8, 8, 8);
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
line 338
;338:		}
LABELV $143
line 339
;339:	}
LABELV $140
line 341
;340:	//if the other is not visible
;341:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 10768
ADDP4
INDIRI4
CNSTI4 0
GEI4 $146
line 342
;342:		BotAI_BotInitialChat(bs, "whereareyou", EasyClientName(client, netname, sizeof(netname)), NULL);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 144
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 184
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 184
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 343
;343:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
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
line 344
;344:		return;
ADDRGP4 $137
JUMPV
LABELV $146
line 347
;345:	}
;346:	//
;347:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 348
;348:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 349
;349:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 351
;350:	//the team mate
;351:	bs->teammate = client;
ADDRFP4 0
INDIRP4
CNSTI4 10708
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 353
;352:	//last time the team mate was assumed visible
;353:	bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10852
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 355
;354:	//set the time to send a message to the team mates
;355:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 184
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
ADDRLP4 184
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 357
;356:	//get the team goal time
;357:	bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 359
;358:	//set the ltg type
;359:	bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 2
ASGNI4
line 360
;360:	bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 11116
ADDP4
CNSTF4 1121976320
ASGNF4
line 361
;361:	bs->arrive_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10276
ADDP4
CNSTF4 0
ASGNF4
line 363
;362:	//
;363:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 365
;364:	// remember last ordered task
;365:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 369
;366:#ifdef DEBUG
;367:	BotPrintTeamGoal(bs);
;368:#endif //DEBUG
;369:}
LABELV $137
endproc BotVoiceChat_FollowMe 188 16
export BotVoiceChat_FollowFlagCarrier
proc BotVoiceChat_FollowFlagCarrier 12 12
line 376
;370:
;371:/*
;372:==================
;373:BotVoiceChat_FollowFlagCarrier
;374:==================
;375:*/
;376:void BotVoiceChat_FollowFlagCarrier(bot_state_t *bs, int client, int mode) {
line 379
;377:	int carrier;
;378:
;379:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $149
line 380
;380:        return; // spbot no chat
ADDRGP4 $148
JUMPV
LABELV $149
line 383
;381:}
;382:
;383:	carrier = BotTeamFlagCarrier(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotTeamFlagCarrier
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 384
;384:	if (carrier >= 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $151
line 385
;385:		BotVoiceChat_FollowMe(bs, carrier, mode);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotVoiceChat_FollowMe
CALLV
pop
LABELV $151
line 389
;386:#ifdef DEBUG
;387:	BotPrintTeamGoal(bs);
;388:#endif //DEBUG
;389:}
LABELV $148
endproc BotVoiceChat_FollowFlagCarrier 12 12
export BotVoiceChat_ReturnFlag
proc BotVoiceChat_ReturnFlag 12 12
line 396
;390:
;391:/*
;392:==================
;393:BotVoiceChat_ReturnFlag
;394:==================
;395:*/
;396:void BotVoiceChat_ReturnFlag(bot_state_t *bs, int client, int mode) {
line 398
;397:	//if not in CTF mode
;398:	if ( gametype != GT_CTF && gametype != GT_CTF_ELIMINATION && gametype != GT_1FCTF ) {
ADDRLP4 0
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $154
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $154
ADDRLP4 0
INDIRI4
CNSTI4 6
EQI4 $154
line 399
;399:		return;
ADDRGP4 $153
JUMPV
LABELV $154
line 402
;400:	}
;401:	
;402:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $156
line 403
;403:        return; // spbot no chat
ADDRGP4 $153
JUMPV
LABELV $156
line 406
;404:}
;405:	//
;406:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 10712
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 407
;407:	bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 10716
ADDP4
CNSTI4 1
ASGNI4
line 408
;408:	bs->order_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 10720
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 410
;409:	//set the time to send a message to the team mates
;410:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 8
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
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 412
;411:	//set the ltg type
;412:	bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 10704
ADDP4
CNSTI4 6
ASGNI4
line 414
;413:	//set the team goal time
;414:	bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 10848
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 415
;415:	bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 10256
ADDP4
CNSTF4 0
ASGNF4
line 416
;416:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 420
;417:#ifdef DEBUG
;418:	BotPrintTeamGoal(bs);
;419:#endif //DEBUG
;420:}
LABELV $153
endproc BotVoiceChat_ReturnFlag 12 12
export BotVoiceChat_StartLeader
proc BotVoiceChat_StartLeader 4 12
line 427
;421:
;422:/*
;423:==================
;424:BotVoiceChat_StartLeader
;425:==================
;426:*/
;427:void BotVoiceChat_StartLeader(bot_state_t *bs, int client, int mode) {
line 428
;428:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
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
NEI4 $159
line 429
;429:        return; // spbot no chat
ADDRGP4 $158
JUMPV
LABELV $159
line 431
;430:}
;431:	ClientName(client, bs->teamleader, sizeof(bs->teamleader));
ADDRFP4 4
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
line 432
;432:}
LABELV $158
endproc BotVoiceChat_StartLeader 4 12
export BotVoiceChat_StopLeader
proc BotVoiceChat_StopLeader 268 12
line 439
;433:
;434:/*
;435:==================
;436:BotVoiceChat_StopLeader
;437:==================
;438:*/
;439:void BotVoiceChat_StopLeader(bot_state_t *bs, int client, int mode) {
line 442
;440:	char netname[MAX_MESSAGE_SIZE];
;441:	
;442:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
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
NEI4 $162
line 443
;443:        return; // spbot no chat
ADDRGP4 $161
JUMPV
LABELV $162
line 446
;444:}
;445:
;446:	if (!Q_stricmp(bs->teamleader, ClientName(client, netname, sizeof(netname)))) {
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
ADDRGP4 ClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 260
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $164
line 447
;447:		bs->teamleader[0] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
CNSTI1 0
ASGNI1
line 448
;448:		notleader[client] = qtrue;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
CNSTI4 1
ASGNI4
line 449
;449:	}
LABELV $164
line 450
;450:}
LABELV $161
endproc BotVoiceChat_StopLeader 268 12
export BotVoiceChat_WhoIsLeader
proc BotVoiceChat_WhoIsLeader 268 12
line 457
;451:
;452:/*
;453:==================
;454:BotVoiceChat_WhoIsLeader
;455:==================
;456:*/
;457:void BotVoiceChat_WhoIsLeader(bot_state_t *bs, int client, int mode) {
line 460
;458:	char netname[MAX_MESSAGE_SIZE];
;459:	
;460:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
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
NEI4 $167
line 461
;461:        return; // spbot no chat
ADDRGP4 $166
JUMPV
LABELV $167
line 464
;462:}
;463:
;464:	if (!TeamPlayIsOn()) return;
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $169
ADDRGP4 $166
JUMPV
LABELV $169
line 466
;465:
;466:	ClientName(bs->client, netname, sizeof(netname));
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
line 468
;467:	//if this bot IS the team leader
;468:	if (!Q_stricmp(netname, bs->teamleader)) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 11004
ADDP4
ARGP4
ADDRLP4 264
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $171
line 469
;469:		BotAI_BotInitialChat(bs, "iamteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $173
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 470
;470:		trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
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
line 471
;471:		BotVoiceChatOnly(bs, -1, VOICECHAT_STARTLEADER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $174
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 472
;472:	}
LABELV $171
line 473
;473:}
LABELV $166
endproc BotVoiceChat_WhoIsLeader 268 12
export BotVoiceChat_WantOnDefense
proc BotVoiceChat_WantOnDefense 48 16
line 480
;474:
;475:/*
;476:==================
;477:BotVoiceChat_WantOnDefense
;478:==================
;479:*/
;480:void BotVoiceChat_WantOnDefense(bot_state_t *bs, int client, int mode) {
line 484
;481:	char netname[MAX_NETNAME];
;482:	int preference;
;483:	
;484:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
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
NEI4 $176
line 485
;485:        return; // spbot no chat
ADDRGP4 $175
JUMPV
LABELV $176
line 488
;486:}
;487:
;488:	preference = BotGetTeamMateTaskPreference(bs, client);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ASGNI4
line 489
;489:	preference &= ~TEAMTP_ATTACKER;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 490
;490:	preference |= TEAMTP_DEFENDER;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 491
;491:	BotSetTeamMateTaskPreference(bs, client, preference);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSetTeamMateTaskPreference
CALLV
pop
line 493
;492:	//
;493:	EasyClientName(client, netname, sizeof(netname));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 494
;494:	BotAI_BotInitialChat(bs, "keepinmind", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $178
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 495
;495:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
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
line 496
;496:	BotVoiceChatOnly(bs, client, VOICECHAT_YES);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $179
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 497
;497:	trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 498
;498:}
LABELV $175
endproc BotVoiceChat_WantOnDefense 48 16
export BotVoiceChat_WantOnOffense
proc BotVoiceChat_WantOnOffense 48 16
line 505
;499:
;500:/*
;501:==================
;502:BotVoiceChat_WantOnOffense
;503:==================
;504:*/
;505:void BotVoiceChat_WantOnOffense(bot_state_t *bs, int client, int mode) {
line 509
;506:	char netname[MAX_NETNAME];
;507:	int preference;
;508:	
;509:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
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
NEI4 $181
line 510
;510:        return; // spbot no chat
ADDRGP4 $180
JUMPV
LABELV $181
line 513
;511:}
;512:
;513:	preference = BotGetTeamMateTaskPreference(bs, client);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ASGNI4
line 514
;514:	preference &= ~TEAMTP_DEFENDER;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 515
;515:	preference |= TEAMTP_ATTACKER;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 516
;516:	BotSetTeamMateTaskPreference(bs, client, preference);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSetTeamMateTaskPreference
CALLV
pop
line 518
;517:	//
;518:	EasyClientName(client, netname, sizeof(netname));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 519
;519:	BotAI_BotInitialChat(bs, "keepinmind", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $178
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 520
;520:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
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
line 521
;521:	BotVoiceChatOnly(bs, client, VOICECHAT_YES);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $179
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
line 522
;522:	trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
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
line 523
;523:}
LABELV $180
endproc BotVoiceChat_WantOnOffense 48 16
export BotVoiceChat_Dummy
proc BotVoiceChat_Dummy 0 0
line 525
;524:
;525:void BotVoiceChat_Dummy(bot_state_t *bs, int client, int mode) {
line 526
;526:}
LABELV $183
endproc BotVoiceChat_Dummy 0 0
data
export voiceCommands
align 4
LABELV voiceCommands
address $184
address BotVoiceChat_GetFlag
address $185
address BotVoiceChat_Offense
address $186
address BotVoiceChat_Defend
address $187
address BotVoiceChat_DefendFlag
address $188
address BotVoiceChat_Patrol
address $189
address BotVoiceChat_Camp
address $190
address BotVoiceChat_FollowMe
address $191
address BotVoiceChat_FollowFlagCarrier
address $192
address BotVoiceChat_ReturnFlag
address $174
address BotVoiceChat_StartLeader
address $193
address BotVoiceChat_StopLeader
address $194
address BotVoiceChat_WhoIsLeader
address $195
address BotVoiceChat_WantOnDefense
address $196
address BotVoiceChat_WantOnOffense
byte 4 0
address BotVoiceChat_Dummy
export BotVoiceChatCommand
code
proc BotVoiceChatCommand 344 12
line 546
;527:
;528:voiceCommand_t voiceCommands[] = {
;529:	{VOICECHAT_GETFLAG, BotVoiceChat_GetFlag},
;530:	{VOICECHAT_OFFENSE, BotVoiceChat_Offense },
;531:	{VOICECHAT_DEFEND, BotVoiceChat_Defend },
;532:	{VOICECHAT_DEFENDFLAG, BotVoiceChat_DefendFlag },
;533:	{VOICECHAT_PATROL, BotVoiceChat_Patrol },
;534:	{VOICECHAT_CAMP, BotVoiceChat_Camp },
;535:	{VOICECHAT_FOLLOWME, BotVoiceChat_FollowMe },
;536:	{VOICECHAT_FOLLOWFLAGCARRIER, BotVoiceChat_FollowFlagCarrier },
;537:	{VOICECHAT_RETURNFLAG, BotVoiceChat_ReturnFlag },
;538:	{VOICECHAT_STARTLEADER, BotVoiceChat_StartLeader },
;539:	{VOICECHAT_STOPLEADER, BotVoiceChat_StopLeader },
;540:	{VOICECHAT_WHOISLEADER, BotVoiceChat_WhoIsLeader },
;541:	{VOICECHAT_WANTONDEFENSE, BotVoiceChat_WantOnDefense },
;542:	{VOICECHAT_WANTONOFFENSE, BotVoiceChat_WantOnOffense },
;543:	{NULL, BotVoiceChat_Dummy}
;544:};
;545:
;546:int BotVoiceChatCommand(bot_state_t *bs, int mode, char *voiceChat) {
line 550
;547:	int i, voiceOnly, clientNum, color;
;548:	char *ptr, buf[MAX_MESSAGE_SIZE], *cmd;
;549:	
;550:if(!NpcFactionProp(bs, NP_CHATLISTEN, 0)){
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 280
ADDRGP4 NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $198
line 551
;551:        return qfalse; // spbot no chat
CNSTI4 0
RETI4
ADDRGP4 $197
JUMPV
LABELV $198
line 554
;552:}
;553:
;554:	if (!TeamPlayIsOn()) {
ADDRLP4 284
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $200
line 555
;555:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $197
JUMPV
LABELV $200
line 558
;556:	}
;557:
;558:	if ( mode == SAY_ALL ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $202
line 559
;559:		return qfalse;	// don't do anything with voice chats to everyone
CNSTI4 0
RETI4
ADDRGP4 $197
JUMPV
LABELV $202
line 562
;560:	}
;561:
;562:	Q_strncpyz(buf, voiceChat, sizeof(buf));
ADDRLP4 16
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 563
;563:	cmd = buf;
ADDRLP4 0
ADDRLP4 16
ASGNP4
line 564
;564:	for (ptr = cmd; *cmd && *cmd > ' '; cmd++);
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $207
JUMPV
LABELV $204
LABELV $205
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $207
ADDRLP4 288
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $208
ADDRLP4 288
INDIRI4
CNSTI4 32
GTI4 $204
LABELV $208
ADDRGP4 $210
JUMPV
LABELV $209
line 565
;565:	while (*cmd && *cmd <= ' ') *cmd++ = '\0';
ADDRLP4 292
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 292
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI1 0
ASGNI1
LABELV $210
ADDRLP4 296
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $212
ADDRLP4 296
INDIRI4
CNSTI4 32
LEI4 $209
LABELV $212
line 566
;566:	voiceOnly = atoi(ptr);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 272
ADDRLP4 300
INDIRI4
ASGNI4
line 567
;567:	for (ptr = cmd; *cmd && *cmd > ' '; cmd++);
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $216
JUMPV
LABELV $213
LABELV $214
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $216
ADDRLP4 304
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $217
ADDRLP4 304
INDIRI4
CNSTI4 32
GTI4 $213
LABELV $217
ADDRGP4 $219
JUMPV
LABELV $218
line 568
;568:	while (*cmd && *cmd <= ' ') *cmd++ = '\0';
ADDRLP4 308
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 308
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI1 0
ASGNI1
LABELV $219
ADDRLP4 312
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $221
ADDRLP4 312
INDIRI4
CNSTI4 32
LEI4 $218
LABELV $221
line 569
;569:	clientNum = atoi(ptr);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 316
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 316
INDIRI4
ASGNI4
line 570
;570:	for (ptr = cmd; *cmd && *cmd > ' '; cmd++);
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $225
JUMPV
LABELV $222
LABELV $223
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $225
ADDRLP4 320
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $226
ADDRLP4 320
INDIRI4
CNSTI4 32
GTI4 $222
LABELV $226
ADDRGP4 $228
JUMPV
LABELV $227
line 571
;571:	while (*cmd && *cmd <= ' ') *cmd++ = '\0';
ADDRLP4 324
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 324
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 324
INDIRP4
CNSTI1 0
ASGNI1
LABELV $228
ADDRLP4 328
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $230
ADDRLP4 328
INDIRI4
CNSTI4 32
LEI4 $227
LABELV $230
line 572
;572:	color = atoi(ptr);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 332
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 276
ADDRLP4 332
INDIRI4
ASGNI4
line 574
;573:
;574:	if (!BotSameTeam(bs, clientNum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 336
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
NEI4 $231
line 575
;575:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $197
JUMPV
LABELV $231
line 578
;576:	}
;577:
;578:	for (i = 0; voiceCommands[i].cmd; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $236
JUMPV
LABELV $233
line 579
;579:		if (!Q_stricmp(cmd, voiceCommands[i].cmd)) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 voiceCommands
ADDP4
INDIRP4
ARGP4
ADDRLP4 340
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
NEI4 $237
line 580
;580:			voiceCommands[i].func(bs, clientNum, mode);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 voiceCommands+4
ADDP4
INDIRP4
CALLV
pop
line 581
;581:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $197
JUMPV
LABELV $237
line 583
;582:		}
;583:	}
LABELV $234
line 578
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $236
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 voiceCommands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $233
line 584
;584:	return qfalse;
CNSTI4 0
RETI4
LABELV $197
endproc BotVoiceChatCommand 344 12
import NpcFactionProp
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
LABELV $196
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
LABELV $195
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
LABELV $194
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $193
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $192
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
LABELV $191
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
LABELV $190
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
LABELV $189
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $188
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $187
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $186
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $185
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $184
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $179
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $178
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
LABELV $174
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
LABELV $173
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
LABELV $136
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
LABELV $124
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
LABELV $123
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
