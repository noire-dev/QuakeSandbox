code
proc waypointAnimStop 12 0
file "../../../code/game/g_minigames.c"
line 34
;1:/*
;2:===========================================================================
;3:Copyright (C) 2019 davidd
;4:
;5:This file is part of AfterShock-XE source code.
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
;24:#include "inv.h"
;25:
;26:int numwaypoints;
;27:int numwaypointsarena[9];
;28:int touchedWaypoints[MAX_CLIENTS];
;29:int lastTouchedNewWaypoint[MAX_CLIENTS];
;30:int firstTouchedWaypointTime[MAX_CLIENTS];
;31:int startTouchedWaypointTime[MAX_CLIENTS];
;32:int numTouchedWaypoints[MAX_CLIENTS];
;33:
;34:static void waypointAnimStop( gentity_t *player ) {
line 37
;35:	int		anim;
;36:
;37:	if( player->s.weapon == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $65
line 38
;38:		anim = TORSO_STAND2;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 39
;39:	}
ADDRGP4 $66
JUMPV
LABELV $65
line 40
;40:	else {
line 41
;41:		anim = TORSO_STAND;
ADDRLP4 0
CNSTI4 11
ASGNI4
line 42
;42:	}
LABELV $66
line 43
;43:	player->s.torsoAnim = ( ( player->s.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ASGNP4
ADDRLP4 8
CNSTI4 128
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
ADDRLP4 8
INDIRI4
BXORI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 44
;44:}
LABELV $64
endproc waypointAnimStop 12 0
proc waypointAnimStart 8 0
line 48
;45:
;46:
;47:#define	TIMER_GESTURE	(34*66+50)
;48:static void waypointAnimStart( gentity_t *player ) {
line 49
;49:	player->s.torsoAnim = ( ( player->s.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | TORSO_GESTURE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
CNSTI4 6
BORI4
ASGNI4
line 50
;50:	player->nextthink = level.time + TIMER_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2294
ADDI4
ASGNI4
line 51
;51:	player->think = waypointAnimStop;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 waypointAnimStop
ASGNP4
line 53
;52:
;53:}
LABELV $67
endproc waypointAnimStart 8 0
export MinigameTouchmaskToString
proc MinigameTouchmaskToString 32 8
line 55
;54:
;55:void MinigameTouchmaskToString(int touchmask,char* string) {
line 57
;56:  int tmp;
;57:  int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 58
;58:  int mask = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 59
;59:  qboolean lastf = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 60
;60:  tmp = touchmask;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
line 61
;61:  string[0] = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 62
;62:  strcat (string, "^7Found: ");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $70
ARGP4
ADDRGP4 strcat
CALLP4
pop
ADDRGP4 $72
JUMPV
LABELV $71
line 63
;63:  while (i<numwaypoints) {
line 64
;64:    if (i>0 && i % 10 == 0) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $74
ADDRLP4 0
INDIRI4
CNSTI4 10
MODI4
ADDRLP4 20
INDIRI4
NEI4 $74
line 65
;65:       strcat(string,va ("^7 %i + ",i ));
ADDRGP4 $76
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 66
;66:       lastf = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 67
;67:    }
LABELV $74
line 68
;68:    if ((tmp & mask) == mask) {
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $77
line 69
;69:       if (!lastf) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $79
line 70
;70:         strcat(string,"^7");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 71
;71:       }
LABELV $79
line 72
;72:       strcat(string,va ("%i",i %10));
ADDRGP4 $82
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
MODI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 73
;73:       lastf=qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 74
;74:    } else {
ADDRGP4 $78
JUMPV
LABELV $77
line 75
;75:       if (lastf) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $83
line 76
;76:         strcat(string,"^1");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $85
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 77
;77:       }
LABELV $83
line 78
;78:       strcat(string,"X");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $86
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 79
;79:       lastf=qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 80
;80:    }
LABELV $78
line 81
;81:    i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 82
;82:    tmp >>= 1;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
RSHI4
ASGNI4
line 83
;83:  }
LABELV $72
line 63
ADDRLP4 0
INDIRI4
ADDRGP4 numwaypoints
INDIRI4
LTI4 $71
line 84
;84:}
LABELV $69
endproc MinigameTouchmaskToString 32 8
export MinigameReward
proc MinigameReward 8 12
line 94
;85:
;86:/*
;87:===============
;88:MinigameReward
;89:give quad damage, same number of seconds as score.
;90:
;91:
;92:===============
;93:*/
;94:void MinigameReward(gentity_t *ent,int score) {
line 96
;95:  // check if already quad
;96:  if (ent->client->ps.powerups[PW_QUAD]) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $88
line 97
;97:    ent->client->ps.powerups[PW_QUAD] += score*1000;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 316
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1000
ADDRFP4 4
INDIRI4
MULI4
ADDI4
ASGNI4
line 98
;98:	AddScore( ent, ent->r.currentOrigin, 1 );	
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 99
;99:  } else {
ADDRGP4 $89
JUMPV
LABELV $88
line 100
;100:    ent->client->ps.powerups[PW_QUAD] = level.time + score*1000 - (level.time % 1000); 
ADDRLP4 0
CNSTI4 1000
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 316
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
SUBI4
ASGNI4
line 101
;101:	AddScore( ent, ent->r.currentOrigin, 1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 103
;102: //   ent->client->quadKills = 0;
;103:  }
LABELV $89
line 105
;104://  trap_SendServerCommand( ent-g_entities, va( "quadKill %i", ent->client->quadKills ) );
;105:}
LABELV $87
endproc MinigameReward 8 12
export Touch_MinigameWaypoint
proc Touch_MinigameWaypoint 320 24
line 114
;106:
;107:
;108:/*
;109:===============
;110:Touch_MinigameWaypoint
;111:
;112:===============
;113:*/
;114:void Touch_MinigameWaypoint (gentity_t *waypoint, gentity_t *ent, trace_t *trace) {
line 122
;115:	//int			respawn;
;116:	//qboolean	predict;
;117:  int clientNum;
;118:  int wpnum;
;119:  int mask;
;120:  int msecs,secs,mins;
;121:  char string[256];
;122:  clientNum = ent-g_entities;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ASGNI4
line 123
;123:  wpnum = waypoint->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 124
;124:  mask = 1 << (wpnum);
ADDRLP4 4
CNSTI4 1
ADDRLP4 8
INDIRI4
LSHI4
ASGNI4
line 125
;125:  if (0 == 1) {
ADDRGP4 $93
JUMPV
line 127
;126: //   numwaypoints = numwaypointsarena[ent->client->curArena];
;127:  }
LABELV $93
line 128
;128:  if (touchedWaypoints[clientNum] & mask) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 touchedWaypoints
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $95
line 129
;129:      if (lastTouchedNewWaypoint[clientNum]+2000 < level.time) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lastTouchedNewWaypoint
ADDP4
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 level+32
INDIRI4
GEI4 $92
line 131
;130:          // sendclient print already touched
;131:          trap_SendServerCommand(clientNum, va ("cp \"Already touched waypoint %i\"", wpnum));
ADDRGP4 $100
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 280
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 133
;132:          // reset the timer
;133:          MinigameTouchmaskToString(touchedWaypoints[clientNum],string);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 touchedWaypoints
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 MinigameTouchmaskToString
CALLV
pop
line 134
;134:          trap_SendServerCommand(clientNum, va ("cp \"%s\"", string));
ADDRGP4 $101
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 284
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 284
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 135
;135:          lastTouchedNewWaypoint[clientNum] = level.time;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lastTouchedNewWaypoint
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 136
;136:      }
line 137
;137:      return;
ADDRGP4 $92
JUMPV
LABELV $95
line 139
;138:  } 
;139:  numTouchedWaypoints[clientNum]++;
ADDRLP4 280
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 numTouchedWaypoints
ADDP4
ASGNP4
ADDRLP4 280
INDIRP4
ADDRLP4 280
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 140
;140:  if (numTouchedWaypoints[clientNum] == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 numTouchedWaypoints
ADDP4
INDIRI4
CNSTI4 1
NEI4 $103
line 141
;141:    firstTouchedWaypointTime[clientNum] = level.time;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 firstTouchedWaypointTime
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 142
;142:    startTouchedWaypointTime[clientNum] = level.time;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 startTouchedWaypointTime
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 143
;143:  }
LABELV $103
line 144
;144:  touchedWaypoints[clientNum] |= mask;
ADDRLP4 284
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 touchedWaypoints
ADDP4
ASGNP4
ADDRLP4 284
INDIRP4
ADDRLP4 284
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BORI4
ASGNI4
line 145
;145:  lastTouchedNewWaypoint[clientNum] = level.time;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lastTouchedNewWaypoint
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 146
;146:  trap_SendServerCommand(clientNum, va ("cp \"You found waypoint %i, that is %i of %i\"", wpnum, numTouchedWaypoints[clientNum], numwaypoints));
ADDRGP4 $108
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 numTouchedWaypoints
ADDP4
INDIRI4
ARGI4
ADDRGP4 numwaypoints
INDIRI4
ARGI4
ADDRLP4 288
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 288
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 147
;147:  waypointAnimStart(waypoint);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 waypointAnimStart
CALLV
pop
line 148
;148:	ent->client->ps.events[ent->client->ps.eventSequence & (MAX_PS_EVENTS-1)] = EV_TAUNT;
ADDRLP4 292
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 292
INDIRP4
CNSTI4 112
ADDP4
ADDP4
CNSTI4 77
ASGNI4
line 149
;149:	ent->client->ps.eventParms[ent->client->ps.eventSequence & (MAX_PS_EVENTS-1)] = 0;
ADDRLP4 296
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 296
INDIRP4
CNSTI4 120
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 150
;150:	ent->client->ps.eventSequence++;
ADDRLP4 300
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 108
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
line 151
;151:	G_AddEvent(ent, EV_TAUNT, 0);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 77
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 153
;152:  // detect if round complete;
;153:  if (touchedWaypoints[clientNum] + 1 == (1 << numwaypoints)) {
ADDRLP4 304
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 touchedWaypoints
ADDP4
INDIRI4
ADDRLP4 304
INDIRI4
ADDI4
ADDRLP4 304
INDIRI4
ADDRGP4 numwaypoints
INDIRI4
LSHI4
NEI4 $109
line 154
;154:			msecs = level.time - startTouchedWaypointTime[clientNum];
ADDRLP4 16
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 startTouchedWaypointTime
ADDP4
INDIRI4
SUBI4
ASGNI4
line 155
;155:			secs = msecs/1000;
ADDRLP4 12
ADDRLP4 16
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 156
;156:			msecs -= secs*1000;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1000
ADDRLP4 12
INDIRI4
MULI4
SUBI4
ASGNI4
line 157
;157:			mins = secs/60;
ADDRLP4 20
ADDRLP4 12
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 158
;158:			secs -= mins*60;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 60
ADDRLP4 20
INDIRI4
MULI4
SUBI4
ASGNI4
line 159
;159:    trap_SendServerCommand(-1, va ("cp \"%s^7 Found all %i waypoints in %i:%02i:%03i\"", ent->client->pers.netname, numwaypoints,mins,secs,msecs));
ADDRGP4 $112
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 numwaypoints
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 308
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 308
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 160
;160:    Team_CaptureFlagSound(ent,ent->client->sess.sessionTeam);
ADDRLP4 312
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 312
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRGP4 Team_CaptureFlagSound
CALLI4
pop
line 161
;161:    MinigameReward(ent,numTouchedWaypoints[clientNum]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 numTouchedWaypoints
ADDP4
INDIRI4
ARGI4
ADDRGP4 MinigameReward
CALLV
pop
line 162
;162:    touchedWaypoints[clientNum] = mask;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 touchedWaypoints
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 163
;163:    numTouchedWaypoints[clientNum]++;
ADDRLP4 316
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 numTouchedWaypoints
ADDP4
ASGNP4
ADDRLP4 316
INDIRP4
ADDRLP4 316
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 164
;164:    startTouchedWaypointTime[clientNum] = level.time;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 startTouchedWaypointTime
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 165
;165:  }
LABELV $109
line 171
;166:
;167:
;168:
;169:
;170:
;171:}
LABELV $92
endproc Touch_MinigameWaypoint 320 24
proc SpawnWaypointOnSpot 48 8
line 174
;172:
;173:
;174:static gentity_t *SpawnWaypointOnSpot(  gentity_t *ent, int place ) {
line 179
;175:	gentity_t	*waypoint;
;176:	vec3_t		vec;
;177:	//vec3_t		f, r, u;
;178:
;179:	waypoint = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 180
;180:	if ( !waypoint ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $115
line 181
;181:                G_Printf( S_COLOR_RED "ERROR: out of gentities\n" );
ADDRGP4 $117
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 182
;182:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $114
JUMPV
LABELV $115
line 186
;183:	}
;184:
;185:	//waypoint->classname = ent->client->pers.netname;
;186:	waypoint->classname = "minigame_waypoint";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $118
ASGNP4
line 190
;187:	//waypoint->client = ent->client;
;188:	//waypoint->s = ent->s;
;189:	//waypoint->s.eType = ET_PLAYER;		// could be ET_INVISIBLE
;190:	waypoint->s.eType = ET_ITEM;		// could be ET_INVISIBLE
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 191
;191:	waypoint->s.eFlags = 0;				// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 192
;192:	waypoint->s.powerups = 0;			// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 193
;193:	waypoint->s.loopSound = 0;			// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 0
ASGNI4
line 194
;194:	waypoint->s.number = waypoint - g_entities; // communicate entitity number to client
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ASGNI4
line 195
;195:	waypoint->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 196
;196:	waypoint->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
line 197
;197:	waypoint->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTF4 0
ASGNF4
line 198
;198:	waypoint->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 199
;199:	waypoint->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 200
;200:	waypoint->s.groundEntityNum = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 4094
ASGNI4
line 201
;201:	waypoint->s.legsAnim = LEGS_IDLE;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 22
ASGNI4
line 202
;202:	waypoint->s.torsoAnim = TORSO_STAND;
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 11
ASGNI4
line 204
;203:  //waypoint->s.modelindex = MODELINDEX_QUAD;
;204:  waypoint->s.modelindex = MODELINDEX_HEALTHMEGA;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 7
ASGNI4
line 206
;205:	//waypoint->s.modelindex = G_ModelIndex( "models/powerups/teleporter/tele_enter.md3" );
;206:	if( waypoint->s.weapon == WP_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
NEI4 $120
line 207
;207:		waypoint->s.weapon = WP_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 2
ASGNI4
line 208
;208:	}
LABELV $120
line 209
;209:	if( waypoint->s.weapon == WP_GAUNTLET) {
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $122
line 210
;210:		waypoint->s.torsoAnim = TORSO_STAND2;
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 12
ASGNI4
line 211
;211:	}
LABELV $122
line 212
;212:	waypoint->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 213
;213:	waypoint->r.svFlags = ent->r.svFlags;
ADDRLP4 24
CNSTI4 464
ASGNI4
ADDRLP4 0
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
line 214
;214:	VectorCopy (ent->r.mins, waypoint->r.mins);
ADDRLP4 28
CNSTI4 476
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 215
;215:	VectorCopy (ent->r.maxs, waypoint->r.maxs);
ADDRLP4 32
CNSTI4 488
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 216
;216:	VectorCopy (ent->r.absmin, waypoint->r.absmin);
ADDRLP4 36
CNSTI4 504
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 217
;217:	VectorCopy (ent->r.absmax, waypoint->r.absmax);
ADDRLP4 40
CNSTI4 516
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 221
;218:	//waypoint->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
;219:	//waypoint->r.contents = CONTENTS_BODY;
;220:	//waypoint->r.ownerNum = ent->r.ownerNum;
;221:	waypoint->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 233
;222:
;223:	//VectorSubtract( level.intermission_origin, pad->r.currentOrigin, vec );
;224:	//vectoangles( vec, waypoint->s.apos.trBase );
;225:	//waypoint->s.apos.trBase[PITCH] = 0;
;226:	//waypoint->s.apos.trBase[ROLL] = 0;
;227:
;228:	//AngleVectors( waypoint->s.apos.trBase, f, r, u );
;229:	//VectorMA( pad->r.currentOrigin, offset[0], f, vec );
;230:	//VectorMA( vec, offset[1], r, vec );
;231:	//VectorMA( vec, offset[2], u, vec );
;232:
;233:	VectorCopy (ent->r.currentOrigin, vec);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 234
;234:	VectorCopy (ent->s.angles, waypoint->s.angles);
ADDRLP4 44
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 237
;235:	//VectorCopy (ent->r., waypoint->r.);
;236:	//G_SetAngles( waypoint, ent->s.angles );
;237:	G_SetOrigin( waypoint, vec );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 239
;238:
;239:	waypoint->count = place;
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 240
;240:  waypoint->touch = Touch_MinigameWaypoint ;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 Touch_MinigameWaypoint
ASGNP4
line 243
;241:
;242:  // makes touch work
;243:	waypoint->r.contents = CONTENTS_TRIGGER;		// replaces the -1 from trap_SetBrushModel
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 246
;244:	//waypoint->r.svFlags = SVF_NOCLIENT;
;245:
;246:	trap_LinkEntity (waypoint);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 249
;247:
;248:
;249:	return waypoint;
ADDRLP4 0
INDIRP4
RETP4
LABELV $114
endproc SpawnWaypointOnSpot 48 8
export G_beginMinigame
proc G_beginMinigame 24 12
line 258
;250:}
;251:
;252:/*
;253:===========
;254:Begin minigame
;255:
;256:============
;257:*/
;258:void G_beginMinigame(void) {
line 262
;259:	gentity_t	*spot;
;260:	//gentity_t	*ent;
;261:  int i;
;262:  int number = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 264
;263:
;264:	spot = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRGP4 $126
JUMPV
LABELV $125
line 266
;265:	
;266:  while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL && number < 32) {
line 268
;267:
;268:    if( spot->flags & FL_NO_HUMANS )
ADDRLP4 4
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $129
line 269
;269:    {
line 270
;270:      continue;
ADDRGP4 $126
JUMPV
LABELV $129
line 272
;271:    }
;272:    if (0 == 1) {
ADDRGP4 $131
JUMPV
line 275
;273:      int arena;
;274:      //if (spot->r.singleClient != level.curMultiArenaMap) { }
;275:      arena = spot->r.singleClient;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 276
;276:      number = numwaypointsarena[arena]++;
ADDRLP4 20
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 numwaypointsarena
ADDP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 277
;277:      if (number < 32) {
ADDRLP4 8
INDIRI4
CNSTI4 32
GEI4 $132
line 278
;278:        SpawnWaypointOnSpot(spot,number);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 SpawnWaypointOnSpot
CALLP4
pop
line 279
;279:      }
line 281
;280:
;281:    } else {
ADDRGP4 $132
JUMPV
LABELV $131
line 282
;282:      if (number < 32) {
ADDRLP4 8
INDIRI4
CNSTI4 32
GEI4 $135
line 284
;283:        //ent = SpawnWaypointOnSpot(spot,number);
;284:        SpawnWaypointOnSpot(spot,number);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 SpawnWaypointOnSpot
CALLP4
pop
line 285
;285:      }
LABELV $135
line 286
;286:      number++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 287
;287:    }
LABELV $132
line 288
;288:  }
LABELV $126
line 266
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $128
ARGP4
ADDRLP4 12
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $137
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $125
LABELV $137
line 289
;289:  numwaypoints=number;
ADDRGP4 numwaypoints
ADDRLP4 8
INDIRI4
ASGNI4
line 291
;290:  // clear player data
;291:  for (i=0; i<MAX_CLIENTS;i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $138
line 292
;292:      touchedWaypoints[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 touchedWaypoints
ADDP4
CNSTI4 0
ASGNI4
line 293
;293:      lastTouchedNewWaypoint[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lastTouchedNewWaypoint
ADDP4
CNSTI4 0
ASGNI4
line 294
;294:      numTouchedWaypoints[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 numTouchedWaypoints
ADDP4
CNSTI4 0
ASGNI4
line 295
;295:  }
LABELV $139
line 291
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $138
line 296
;296:}
LABELV $124
endproc G_beginMinigame 24 12
import Team_CaptureFlagSound
bss
export numTouchedWaypoints
align 4
LABELV numTouchedWaypoints
skip 1024
export startTouchedWaypointTime
align 4
LABELV startTouchedWaypointTime
skip 1024
export firstTouchedWaypointTime
align 4
LABELV firstTouchedWaypointTime
skip 1024
export lastTouchedNewWaypoint
align 4
LABELV lastTouchedNewWaypoint
skip 1024
export touchedWaypoints
align 4
LABELV touchedWaypoints
skip 1024
export numwaypointsarena
align 4
LABELV numwaypointsarena
skip 36
export numwaypoints
align 4
LABELV numwaypoints
skip 4
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
LABELV $128
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
LABELV $118
byte 1 109
byte 1 105
byte 1 110
byte 1 105
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $117
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $112
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
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
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 51
byte 1 105
byte 1 34
byte 1 0
align 1
LABELV $108
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 34
byte 1 0
align 1
LABELV $101
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $100
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 65
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 34
byte 1 0
align 1
LABELV $86
byte 1 88
byte 1 0
align 1
LABELV $85
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $82
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $81
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $76
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 43
byte 1 32
byte 1 0
align 1
LABELV $70
byte 1 94
byte 1 55
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 0
