export G_ResetHistory
code
proc G_ResetHistory 20 0
file "../../../code/game/g_unlagged.c"
line 35
;1:/*
;2:===========================================================================
;3:Copyright (C) 2006 Neil Toronto.
;4:
;5:This file is part of the Unlagged source code.
;6:
;7:Unlagged source code is free software; you can redistribute it and/or
;8:modify it under the terms of the GNU General Public License as published by
;9:the Free Software Foundation; either version 2 of the License, or (at your
;10:option) any later version.
;11:
;12:Unlagged source code is distributed in the hope that it will be useful, but
;13:WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
;14:or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;15:for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Unlagged source code; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22:
;23://Sago: For some reason the Niels version must use a different char set.
;24:#include "g_local.h"
;25:
;26://#include "g_local.h"
;27:
;28:/*
;29:============
;30:G_ResetHistory
;31:
;32:Clear out the given client's history (should be called when the teleport bit is flipped)
;33:============
;34:*/
;35:void G_ResetHistory( gentity_t *ent ) {
line 39
;36:	int		i, time;
;37:
;38:	// fill up the history with data (assume the current position)
;39:	ent->client->historyHead = NUM_CLIENT_HISTORY - 1;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1460
ADDP4
CNSTI4 16
ASGNI4
line 40
;40:	for ( i = ent->client->historyHead, time = level.time; i >= 0; i--, time -= 50 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1460
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRGP4 $68
JUMPV
LABELV $65
line 41
;41:		VectorCopy( ent->r.mins, ent->client->history[i].mins );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 42
;42:		VectorCopy( ent->r.maxs, ent->client->history[i].maxs );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 43
;43:		VectorCopy( ent->r.currentOrigin, ent->client->history[i].currentOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 44
;44:		ent->client->history[i].leveltime = time;
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 45
;45:	}
LABELV $66
line 40
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
LABELV $68
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $65
line 46
;46:}
LABELV $64
endproc G_ResetHistory 20 0
export G_StoreHistory
proc G_StoreHistory 40 0
line 56
;47:
;48:
;49:/*
;50:============
;51:G_StoreHistory
;52:
;53:Keep track of where the client's been
;54:============
;55:*/
;56:void G_StoreHistory( gentity_t *ent ) {
line 59
;57:	int		head, frametime;
;58:
;59:	frametime = level.time - level.previousTime;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ASGNI4
line 61
;60:
;61:	ent->client->historyHead++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1460
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
line 62
;62:	if ( ent->client->historyHead >= NUM_CLIENT_HISTORY ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1460
ADDP4
INDIRI4
CNSTI4 17
LTI4 $73
line 63
;63:		ent->client->historyHead = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1460
ADDP4
CNSTI4 0
ASGNI4
line 64
;64:	}
LABELV $73
line 66
;65:
;66:	head = ent->client->historyHead;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1460
ADDP4
INDIRI4
ASGNI4
line 69
;67:
;68:	// store all the collision-detection info and the time
;69:	VectorCopy( ent->r.mins, ent->client->history[head].mins );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 70
;70:	VectorCopy( ent->r.maxs, ent->client->history[head].maxs );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 71
;71:	VectorCopy( ent->s.pos.trBase, ent->client->history[head].currentOrigin );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 24
ASGNI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 72
;72:	SnapVector( ent->client->history[head].currentOrigin );
ADDRLP4 28
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 36
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 73
;73:	ent->client->history[head].leveltime = level.time;
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 36
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 74
;74:}
LABELV $70
endproc G_StoreHistory 40 0
proc TimeShiftLerp 20 0
line 85
;75:
;76:
;77:/*
;78:=============
;79:TimeShiftLerp
;80:
;81:Used below to interpolate between two previous vectors
;82:Returns a vector "frac" times the distance between "start" and "end"
;83:=============
;84:*/
;85:static void TimeShiftLerp( float frac, vec3_t start, vec3_t end, vec3_t result ) {
line 94
;86:// From CG_InterpolateEntityPosition in cg_ents.c:
;87:/*
;88:	cent->lerpOrigin[0] = current[0] + f * ( next[0] - current[0] );
;89:	cent->lerpOrigin[1] = current[1] + f * ( next[1] - current[1] );
;90:	cent->lerpOrigin[2] = current[2] + f * ( next[2] - current[2] );
;91:*/
;92:// Making these exactly the same should avoid floating-point error
;93:
;94:	result[0] = start[0] + frac * ( end[0] - start[0] );
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 95
;95:	result[1] = start[1] + frac * ( end[1] - start[1] );
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 8
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 96
;96:	result[2] = start[2] + frac * ( end[2] - start[2] );
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRLP4 16
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 97
;97:}
LABELV $76
endproc TimeShiftLerp 20 0
export G_TimeShiftClient
proc G_TimeShiftClient 76 16
line 107
;98:
;99:
;100:/*
;101:=================
;102:G_TimeShiftClient
;103:
;104:Move a client back to where he was at the specified "time"
;105:=================
;106:*/
;107:void G_TimeShiftClient( gentity_t *ent, int time, qboolean debug, gentity_t *debugger ) {
line 142
;108:	int		j, k;
;109:	//char msg[2048];
;110:
;111:	// this will dump out the head index, and the time for all the stored positions
;112:/*
;113:	if ( debug ) {
;114:		char	str[MAX_STRING_CHARS];
;115:
;116:		Com_sprintf(str, sizeof(str), "print \"head: %d, %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n\"",
;117:			ent->client->historyHead,
;118:			ent->client->history[0].leveltime,
;119:			ent->client->history[1].leveltime,
;120:			ent->client->history[2].leveltime,
;121:			ent->client->history[3].leveltime,
;122:			ent->client->history[4].leveltime,
;123:			ent->client->history[5].leveltime,
;124:			ent->client->history[6].leveltime,
;125:			ent->client->history[7].leveltime,
;126:			ent->client->history[8].leveltime,
;127:			ent->client->history[9].leveltime,
;128:			ent->client->history[10].leveltime,
;129:			ent->client->history[11].leveltime,
;130:			ent->client->history[12].leveltime,
;131:			ent->client->history[13].leveltime,
;132:			ent->client->history[14].leveltime,
;133:			ent->client->history[15].leveltime,
;134:			ent->client->history[16].leveltime);
;135:
;136:		trap_SendServerCommand( debugger - g_entities, str );
;137:	}
;138:*/
;139:
;140:	// find two entries in the history whose times sandwich "time"
;141:	// assumes no two adjacent records have the same timestamp
;142:	j = k = ent->client->historyHead;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1460
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $78
line 143
;143:	do {
line 144
;144:		if ( ent->client->history[j].leveltime <= time )
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $81
line 145
;145:			break;
ADDRGP4 $80
JUMPV
LABELV $81
line 147
;146:
;147:		k = j;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 148
;148:		j--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 149
;149:		if ( j < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $83
line 150
;150:			j = NUM_CLIENT_HISTORY - 1;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 151
;151:		}
LABELV $83
line 152
;152:	}
LABELV $79
line 153
;153:	while ( j != ent->client->historyHead );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1460
ADDP4
INDIRI4
NEI4 $78
LABELV $80
line 156
;154:
;155:	// if we got past the first iteration above, we've sandwiched (or wrapped)
;156:	if ( j != k ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $85
line 158
;157:		// make sure it doesn't get re-saved
;158:		if ( ent->client->saved.leveltime != level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
EQI4 $87
line 160
;159:			// save the current origin and bounding box
;160:			VectorCopy( ent->r.mins, ent->client->saved.mins );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2144
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 161
;161:			VectorCopy( ent->r.maxs, ent->client->saved.maxs );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2156
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 162
;162:			VectorCopy( ent->r.currentOrigin, ent->client->saved.currentOrigin );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2168
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 163
;163:			ent->client->saved.leveltime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2180
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 164
;164:		}
LABELV $87
line 168
;165:
;166:		// if we haven't wrapped back to the head, we've sandwiched, so
;167:		// we shift the client's position back to where he was at "time"
;168:		if ( j != ent->client->historyHead ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1460
ADDP4
INDIRI4
EQI4 $91
line 169
;169:			float	frac = (float)(time - ent->client->history[j].leveltime) /
ADDRLP4 16
CNSTI4 40
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ASGNP4
ADDRLP4 24
CNSTI4 36
ASGNI4
ADDRLP4 28
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 16
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 173
;170:				(float)(ent->client->history[k].leveltime - ent->client->history[j].leveltime);
;171:
;172:			// interpolate between the two origins to give position at time index "time"
;173:			TimeShiftLerp( frac,
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 32
CNSTI4 40
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ASGNP4
ADDRLP4 44
CNSTI4 24
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 40
INDIRP4
ADDP4
ADDRLP4 44
INDIRI4
ADDP4
ARGP4
ADDRLP4 32
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 40
INDIRP4
ADDP4
ADDRLP4 44
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 178
;174:				ent->client->history[j].currentOrigin, ent->client->history[k].currentOrigin,
;175:				ent->r.currentOrigin );
;176:
;177:			// lerp these too, just for fun (and ducking)
;178:			TimeShiftLerp( frac,
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 48
CNSTI4 40
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ASGNP4
ADDRLP4 48
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
ADDP4
ARGP4
ADDRLP4 48
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 182
;179:				ent->client->history[j].mins, ent->client->history[k].mins,
;180:				ent->r.mins );
;181:
;182:			TimeShiftLerp( frac,
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 60
CNSTI4 40
ASGNI4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ASGNP4
ADDRLP4 72
CNSTI4 12
ASGNI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 68
INDIRP4
ADDP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRLP4 60
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 68
INDIRP4
ADDP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 210
;183:				ent->client->history[j].maxs, ent->client->history[k].maxs,
;184:				ent->r.maxs );
;185:
;186:			/*if ( debug && debugger != NULL ) {
;187:				// print some debugging stuff exactly like what the client does
;188:
;189:				// it starts with "Rec:" to let you know it backward-reconciled
;190:				Com_sprintf( msg, sizeof(msg),
;191:					"print \"^1Rec: time: %d, j: %d, k: %d, origin: %0.2f %0.2f %0.2f\n"
;192:					"^2frac: %0.4f, origin1: %0.2f %0.2f %0.2f, origin2: %0.2f %0.2f %0.2f\n"
;193:					"^7level.time: %d, est time: %d, level.time delta: %d, est real ping: %d\n\"",
;194:					time, ent->client->history[j].leveltime, ent->client->history[k].leveltime,
;195:					ent->r.currentOrigin[0], ent->r.currentOrigin[1], ent->r.currentOrigin[2],
;196:					frac,
;197:					ent->client->history[j].currentOrigin[0],
;198:					ent->client->history[j].currentOrigin[1],
;199:					ent->client->history[j].currentOrigin[2], 
;200:					ent->client->history[k].currentOrigin[0],
;201:					ent->client->history[k].currentOrigin[1],
;202:					ent->client->history[k].currentOrigin[2],
;203:					level.time, level.time + debugger->client->frameOffset,
;204:					level.time - time, level.time + debugger->client->frameOffset - time);
;205:
;206:				trap_SendServerCommand( debugger - g_entities, msg );
;207:			}*/
;208:
;209:			// this will recalculate absmin and absmax
;210:			trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 211
;211:		} else {
ADDRGP4 $86
JUMPV
LABELV $91
line 213
;212:			// we wrapped, so grab the earliest
;213:			VectorCopy( ent->client->history[k].currentOrigin, ent->r.currentOrigin );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 214
;214:			VectorCopy( ent->client->history[k].mins, ent->r.mins );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
INDIRB
ASGNB 12
line 215
;215:			VectorCopy( ent->client->history[k].maxs, ent->r.maxs );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 218
;216:
;217:			// this will recalculate absmin and absmax
;218:			trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 219
;219:		}
line 220
;220:	}
LABELV $85
line 221
;221:	else {
line 230
;222:		// this only happens when the client is using a negative timenudge, because that
;223:		// number is added to the command time
;224:
;225:		// print some debugging stuff exactly like what the client does
;226:
;227:		// it starts with "No rec:" to let you know it didn't backward-reconcile
;228:		//Sago: This code looks wierd
;229:
;230:	}
LABELV $86
line 231
;231:}
LABELV $77
endproc G_TimeShiftClient 76 16
export G_TimeShiftAllClients
proc G_TimeShiftAllClients 32 16
line 242
;232:
;233:
;234:/*
;235:=====================
;236:G_TimeShiftAllClients
;237:
;238:Move ALL clients back to where they were at the specified "time",
;239:except for "skip"
;240:=====================
;241:*/
;242:void G_TimeShiftAllClients( int time, gentity_t *skip ) {
line 245
;243:	int			i;
;244:	gentity_t	*ent;
;245:	qboolean debug = ( skip != NULL && skip->client && 
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $95
ADDRLP4 16
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $95
ADDRLP4 16
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 7
NEI4 $95
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $95
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $96
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 249
;246:			/*skip->client->pers.debugDelag && */ skip->s.weapon == WP_RAILGUN );
;247:
;248:	// for every client
;249:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 250
;250:	for ( i = 0; i < MAX_CLIENTS; i++, ent++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $97
line 251
;251:		if ( ent->client && ent->inuse && ent->client->sess.sessionTeam < TEAM_SPECTATOR && ent != skip ) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $101
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $101
ADDRLP4 28
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
GEI4 $101
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $101
line 252
;252:			G_TimeShiftClient( ent, time, debug, skip );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_TimeShiftClient
CALLV
pop
line 253
;253:		}
LABELV $101
line 254
;254:	}
LABELV $98
line 250
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
ADDRLP4 4
INDIRI4
CNSTI4 256
LTI4 $97
line 255
;255:}
LABELV $93
endproc G_TimeShiftAllClients 32 16
lit
align 4
LABELV $104
byte 4 0
byte 4 0
byte 4 2
byte 4 4
byte 4 0
byte 4 0
byte 4 8
byte 4 16
byte 4 0
byte 4 0
byte 4 0
byte 4 32
byte 4 0
byte 4 64
skip 8
export G_DoTimeShiftFor
code
proc G_DoTimeShiftFor 92 8
line 265
;256:
;257:
;258:/*
;259:================
;260:G_DoTimeShiftFor
;261:
;262:Decide what time to shift everyone back to, and do it
;263:================
;264:*/
;265:void G_DoTimeShiftFor( gentity_t *ent ) {	
line 266
;266:	int wpflags[WP_NUM_WEAPONS] = { 0, 0, 2, 4, 0, 0, 8, 16, 0, 0, 0, 32, 0, 64 };
ADDRLP4 4
ADDRGP4 $104
INDIRB
ASGNB 64
line 268
;267:
;268:	int wpflag = wpflags[ent->client->ps.weapon];
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 272
;269:	int time;
;270:
;271:	// don't time shift for mistakes or bots
;272:	if ( !ent->inuse || !ent->client || (ent->r.svFlags & SVF_BOT) ) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $108
ADDRLP4 72
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $108
ADDRLP4 72
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 76
INDIRI4
EQI4 $105
LABELV $108
line 273
;273:		return;
ADDRGP4 $103
JUMPV
LABELV $105
line 277
;274:	}
;275:
;276:	// if it's enabled server-side and the client wants it or wants it for this weapon
;277:	if ( g_delagHitscan.integer && ( ent->client->pers.delag & 1 || ent->client->pers.delag & wpflag ) ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 g_delagHitscan+12
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $109
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $112
ADDRLP4 84
INDIRI4
ADDRLP4 68
INDIRI4
BANDI4
ADDRLP4 80
INDIRI4
EQI4 $109
LABELV $112
line 279
;278:		// do the full lag compensation, except what the client nudges
;279:		time = ent->client->attackTime + ent->client->pers.cmdTimeNudge;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
CNSTI4 1456
ADDP4
INDIRI4
ADDRLP4 88
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDI4
ASGNI4
line 281
;280:                //Give the lightning gun some handicap (lag was part of weapon balance in VQ3)
;281:                if(ent->client->ps.weapon == WP_LIGHTNING && g_lagLightning.integer)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 6
NEI4 $110
ADDRGP4 g_lagLightning+12
INDIRI4
CNSTI4 0
EQI4 $110
line 282
;282:                    time+=50;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 283
;283:	}
ADDRGP4 $110
JUMPV
LABELV $109
line 284
;284:	else {
line 286
;285:		// do just 50ms
;286:		time = level.previousTime + ent->client->frameOffset;
ADDRLP4 0
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2184
ADDP4
INDIRI4
ADDI4
ASGNI4
line 287
;287:	}
LABELV $110
line 289
;288:
;289:	G_TimeShiftAllClients( time, ent );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TimeShiftAllClients
CALLV
pop
line 290
;290:}
LABELV $103
endproc G_DoTimeShiftFor 92 8
export G_UnTimeShiftClient
proc G_UnTimeShiftClient 12 4
line 300
;291:
;292:
;293:/*
;294:===================
;295:G_UnTimeShiftClient
;296:
;297:Move a client back to where he was before the time shift
;298:===================
;299:*/
;300:void G_UnTimeShiftClient( gentity_t *ent ) {
line 302
;301:	// if it was saved
;302:	if ( ent->client->saved.leveltime == level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2180
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
NEI4 $118
line 304
;303:		// move it back
;304:		VectorCopy( ent->client->saved.mins, ent->r.mins );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2144
ADDP4
INDIRB
ASGNB 12
line 305
;305:		VectorCopy( ent->client->saved.maxs, ent->r.maxs );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2156
ADDP4
INDIRB
ASGNB 12
line 306
;306:		VectorCopy( ent->client->saved.currentOrigin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2168
ADDP4
INDIRB
ASGNB 12
line 307
;307:		ent->client->saved.leveltime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2180
ADDP4
CNSTI4 0
ASGNI4
line 310
;308:
;309:		// this will recalculate absmin and absmax
;310:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 311
;311:	}
LABELV $118
line 312
;312:}
LABELV $117
endproc G_UnTimeShiftClient 12 4
export G_UnTimeShiftAllClients
proc G_UnTimeShiftAllClients 16 4
line 323
;313:
;314:
;315:/*
;316:=======================
;317:G_UnTimeShiftAllClients
;318:
;319:Move ALL the clients back to where they were before the time shift,
;320:except for "skip"
;321:=======================
;322:*/
;323:void G_UnTimeShiftAllClients( gentity_t *skip ) {
line 327
;324:	int			i;
;325:	gentity_t	*ent;
;326:
;327:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 328
;328:	for ( i = 0; i < MAX_CLIENTS; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $122
line 329
;329:		if ( ent->client && ent->inuse && ent->client->sess.sessionTeam < TEAM_SPECTATOR && ent != skip ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $126
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $126
ADDRLP4 12
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
GEI4 $126
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $126
line 330
;330:			G_UnTimeShiftClient( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 331
;331:		}
LABELV $126
line 332
;332:	}
LABELV $123
line 328
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
ADDRLP4 4
INDIRI4
CNSTI4 256
LTI4 $122
line 333
;333:}
LABELV $121
endproc G_UnTimeShiftAllClients 16 4
export G_UndoTimeShiftFor
proc G_UndoTimeShiftFor 8 4
line 343
;334:
;335:
;336:/*
;337:==================
;338:G_UndoTimeShiftFor
;339:
;340:Put everyone except for this client back where they were
;341:==================
;342:*/
;343:void G_UndoTimeShiftFor( gentity_t *ent ) {
line 346
;344:
;345:	// don't un-time shift for mistakes or bots
;346:	if ( !ent->inuse || !ent->client || (ent->r.svFlags & SVF_BOT) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $132
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $132
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $129
LABELV $132
line 347
;347:		return;
ADDRGP4 $128
JUMPV
LABELV $129
line 350
;348:	}
;349:
;350:	G_UnTimeShiftAllClients( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftAllClients
CALLV
pop
line 351
;351:}
LABELV $128
endproc G_UndoTimeShiftFor 8 4
export G_PredictPlayerClipVelocity
proc G_PredictPlayerClipVelocity 28 0
line 364
;352:
;353:
;354:/*
;355:===========================
;356:G_PredictPlayerClipVelocity
;357:
;358:Slide on the impacting surface
;359:===========================
;360:*/
;361:
;362:#define	OVERCLIP		1.001f
;363:
;364:void G_PredictPlayerClipVelocity( vec3_t in, vec3_t normal, vec3_t out ) {
line 368
;365:	float	backoff;
;366:
;367:	// find the magnitude of the vector "in" along "normal"
;368:	backoff = DotProduct (in, normal);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 4
ASGNI4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 371
;369:
;370:	// tilt the plane a bit to avoid floating-point error issues
;371:	if ( backoff < 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $134
line 372
;372:		backoff *= OVERCLIP;
ADDRLP4 0
CNSTF4 1065361605
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 373
;373:	} else {
ADDRGP4 $135
JUMPV
LABELV $134
line 374
;374:		backoff /= OVERCLIP;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1065361605
DIVF4
ASGNF4
line 375
;375:	}
LABELV $135
line 378
;376:
;377:	// slide along
;378:	VectorMA( in, -backoff, normal, out );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 379
;379:}
LABELV $133
endproc G_PredictPlayerClipVelocity 28 0
export G_PredictPlayerSlideMove
proc G_PredictPlayerSlideMove 300 28
line 391
;380:
;381:
;382:/*
;383:========================
;384:G_PredictPlayerSlideMove
;385:
;386:Advance the given entity frametime seconds, sliding as appropriate
;387:========================
;388:*/
;389:#define	MAX_CLIP_PLANES	5
;390:
;391:qboolean G_PredictPlayerSlideMove( gentity_t *ent, float frametime ) {
line 408
;392:	int			bumpcount, numbumps;
;393:	vec3_t		dir;
;394:	float		d;
;395:	int			numplanes;
;396:	vec3_t		planes[MAX_CLIP_PLANES];
;397:	vec3_t		primal_velocity, velocity, origin;
;398:	vec3_t		clipVelocity;
;399:	int			i, j, k;
;400:	trace_t	trace;
;401:	vec3_t		end;
;402:	float		time_left;
;403:	float		into;
;404:	vec3_t		endVelocity;
;405:	vec3_t		endClipVelocity;
;406://	vec3_t		worldUp = { 0.0f, 0.0f, 1.0f };
;407:	
;408:	numbumps = 4;
ADDRLP4 232
CNSTI4 4
ASGNI4
line 410
;409:
;410:	VectorCopy( ent->s.pos.trDelta, primal_velocity );
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 411
;411:	VectorCopy( primal_velocity, velocity );
ADDRLP4 76
ADDRLP4 236
INDIRB
ASGNB 12
line 412
;412:	VectorCopy( ent->s.pos.trBase, origin );
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 414
;413:
;414:	VectorCopy( velocity, endVelocity );
ADDRLP4 140
ADDRLP4 76
INDIRB
ASGNB 12
line 416
;415:
;416:	time_left = frametime;
ADDRLP4 212
ADDRFP4 4
INDIRF4
ASGNF4
line 418
;417:
;418:	numplanes = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 420
;419:
;420:	for ( bumpcount = 0; bumpcount < numbumps; bumpcount++ ) {
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $137
line 423
;421:
;422:		// calculate position we are trying to move to
;423:		VectorMA( origin, time_left, velocity, end );
ADDRLP4 216
ADDRLP4 112
INDIRF4
ADDRLP4 76
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 76+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216+8
ADDRLP4 112+8
INDIRF4
ADDRLP4 76+8
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
line 426
;424:
;425:		// see if we can make it there
;426:		trap_Trace( &trace, origin, ent->r.mins, ent->r.maxs, end, ent->s.number, ent->clipmask );
ADDRLP4 152
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRLP4 252
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 216
ARGP4
ADDRLP4 252
INDIRP4
INDIRI4
ARGI4
ADDRLP4 252
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 428
;427:
;428:		if (trace.allsolid) {
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $147
line 430
;429:			// entity is completely trapped in another solid
;430:			VectorClear( velocity );
ADDRLP4 256
CNSTF4 0
ASGNF4
ADDRLP4 76+8
ADDRLP4 256
INDIRF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 256
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 256
INDIRF4
ASGNF4
line 431
;431:			VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 432
;432:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $136
JUMPV
LABELV $147
line 435
;433:		}
;434:
;435:		if (trace.fraction > 0) {
ADDRLP4 152+8
INDIRF4
CNSTF4 0
LEF4 $151
line 437
;436:			// actually covered some distance
;437:			VectorCopy( trace.endpos, origin );
ADDRLP4 112
ADDRLP4 152+12
INDIRB
ASGNB 12
line 438
;438:		}
LABELV $151
line 440
;439:
;440:		if (trace.fraction == 1) {
ADDRLP4 152+8
INDIRF4
CNSTF4 1065353216
NEF4 $155
line 441
;441:			break;		// moved the entire distance
ADDRGP4 $139
JUMPV
LABELV $155
line 444
;442:		}
;443:
;444:		time_left -= time_left * trace.fraction;
ADDRLP4 212
ADDRLP4 212
INDIRF4
ADDRLP4 212
INDIRF4
ADDRLP4 152+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 446
;445:
;446:		if ( numplanes >= MAX_CLIP_PLANES ) {
ADDRLP4 108
INDIRI4
CNSTI4 5
LTI4 $159
line 448
;447:			// this shouldn't really happen
;448:			VectorClear( velocity );
ADDRLP4 260
CNSTF4 0
ASGNF4
ADDRLP4 76+8
ADDRLP4 260
INDIRF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 260
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 260
INDIRF4
ASGNF4
line 449
;449:			VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 450
;450:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $136
JUMPV
LABELV $159
line 458
;451:		}
;452:
;453:		//
;454:		// if this is the same plane we hit before, nudge velocity
;455:		// out along it, which fixes some epsilon issues with
;456:		// non-axial planes
;457:		//
;458:		for ( i = 0; i < numplanes; i++ ) {
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $166
JUMPV
LABELV $163
line 459
;459:			if ( DotProduct( trace.plane.normal, planes[i] ) > 0.99 ) {
ADDRLP4 260
CNSTI4 12
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 152+24
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 152+24+4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 152+24+8
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $167
line 460
;460:				VectorAdd( trace.plane.normal, velocity, velocity );
ADDRLP4 76
ADDRLP4 152+24
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 152+24+4
INDIRF4
ADDRLP4 76+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRLP4 152+24+8
INDIRF4
ADDRLP4 76+8
INDIRF4
ADDF4
ASGNF4
line 461
;461:				break;
ADDRGP4 $165
JUMPV
LABELV $167
line 463
;462:			}
;463:		}
LABELV $164
line 458
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $166
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $163
LABELV $165
line 465
;464:
;465:		if ( i < numplanes ) {
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $185
line 466
;466:			continue;
ADDRGP4 $138
JUMPV
LABELV $185
line 469
;467:		}
;468:
;469:		VectorCopy( trace.plane.normal, planes[numplanes] );
CNSTI4 12
ADDRLP4 108
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 152+24
INDIRB
ASGNB 12
line 470
;470:		numplanes++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 477
;471:
;472:		//
;473:		// modify velocity so it parallels all of the clip planes
;474:		//
;475:
;476:		// find a plane that it enters
;477:		for ( i = 0; i < numplanes; i++ ) {
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $191
JUMPV
LABELV $188
line 478
;478:			into = DotProduct( velocity, planes[i] );
ADDRLP4 260
CNSTI4 12
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 208
ADDRLP4 76
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 76+4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 76+8
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 479
;479:			if ( into >= 0.1 ) {
ADDRLP4 208
INDIRF4
CNSTF4 1036831949
LTF4 $196
line 480
;480:				continue;		// move doesn't interact with the plane
ADDRGP4 $189
JUMPV
LABELV $196
line 484
;481:			}
;482:
;483:			// slide along the plane
;484:			G_PredictPlayerClipVelocity( velocity, planes[i], clipVelocity );
ADDRLP4 76
ARGP4
CNSTI4 12
ADDRLP4 92
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 487
;485:
;486:			// slide along the plane
;487:			G_PredictPlayerClipVelocity( endVelocity, planes[i], endClipVelocity );
ADDRLP4 140
ARGP4
CNSTI4 12
ADDRLP4 92
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 490
;488:
;489:			// see if there is a second plane that the new move enters
;490:			for ( j = 0; j < numplanes; j++ ) {
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 $201
JUMPV
LABELV $198
line 491
;491:				if ( j == i ) {
ADDRLP4 88
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $202
line 492
;492:					continue;
ADDRGP4 $199
JUMPV
LABELV $202
line 495
;493:				}
;494:
;495:				if ( DotProduct( clipVelocity, planes[j] ) >= 0.1 ) {
ADDRLP4 264
CNSTI4 12
ADDRLP4 88
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $204
line 496
;496:					continue;		// move doesn't interact with the plane
ADDRGP4 $199
JUMPV
LABELV $204
line 500
;497:				}
;498:
;499:				// try clipping the move to the plane
;500:				G_PredictPlayerClipVelocity( clipVelocity, planes[j], clipVelocity );
ADDRLP4 64
ARGP4
CNSTI4 12
ADDRLP4 88
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 501
;501:				G_PredictPlayerClipVelocity( endClipVelocity, planes[j], endClipVelocity );
ADDRLP4 128
ARGP4
CNSTI4 12
ADDRLP4 88
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 504
;502:
;503:				// see if it goes back into the first clip plane
;504:				if ( DotProduct( clipVelocity, planes[i] ) >= 0 ) {
ADDRLP4 268
CNSTI4 12
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $210
line 505
;505:					continue;
ADDRGP4 $199
JUMPV
LABELV $210
line 509
;506:				}
;507:
;508:				// slide the original velocity along the crease
;509:				CrossProduct( planes[i], planes[j], dir );
ADDRLP4 272
CNSTI4 12
ASGNI4
ADDRLP4 272
INDIRI4
ADDRLP4 92
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 272
INDIRI4
ADDRLP4 88
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 510
;510:				VectorNormalize( dir );
ADDRLP4 96
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 511
;511:				d = DotProduct( dir, velocity );
ADDRLP4 124
ADDRLP4 96
INDIRF4
ADDRLP4 76
INDIRF4
MULF4
ADDRLP4 96+4
INDIRF4
ADDRLP4 76+4
INDIRF4
MULF4
ADDF4
ADDRLP4 96+8
INDIRF4
ADDRLP4 76+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 512
;512:				VectorScale( dir, d, clipVelocity );
ADDRLP4 64
ADDRLP4 96
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
line 514
;513:
;514:				CrossProduct( planes[i], planes[j], dir );
ADDRLP4 280
CNSTI4 12
ASGNI4
ADDRLP4 280
INDIRI4
ADDRLP4 92
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 280
INDIRI4
ADDRLP4 88
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 515
;515:				VectorNormalize( dir );
ADDRLP4 96
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 516
;516:				d = DotProduct( dir, endVelocity );
ADDRLP4 124
ADDRLP4 96
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ADDRLP4 96+4
INDIRF4
ADDRLP4 140+4
INDIRF4
MULF4
ADDF4
ADDRLP4 96+8
INDIRF4
ADDRLP4 140+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 517
;517:				VectorScale( dir, d, endClipVelocity );
ADDRLP4 128
ADDRLP4 96
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 128+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 128+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
line 520
;518:
;519:				// see if there is a third plane the the new move enters
;520:				for ( k = 0; k < numplanes; k++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $235
JUMPV
LABELV $232
line 521
;521:					if ( k == i || k == j ) {
ADDRLP4 0
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $238
ADDRLP4 0
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $236
LABELV $238
line 522
;522:						continue;
ADDRGP4 $233
JUMPV
LABELV $236
line 525
;523:					}
;524:
;525:					if ( DotProduct( clipVelocity, planes[k] ) >= 0.1 ) {
ADDRLP4 292
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 292
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 292
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 292
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $239
line 526
;526:						continue;		// move doesn't interact with the plane
ADDRGP4 $233
JUMPV
LABELV $239
line 530
;527:					}
;528:
;529:					// stop dead at a tripple plane interaction
;530:					VectorClear( velocity );
ADDRLP4 296
CNSTF4 0
ASGNF4
ADDRLP4 76+8
ADDRLP4 296
INDIRF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 296
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 296
INDIRF4
ASGNF4
line 531
;531:					VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 532
;532:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $136
JUMPV
LABELV $233
line 520
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $235
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $232
line 534
;533:				}
;534:			}
LABELV $199
line 490
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $201
ADDRLP4 88
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $198
line 537
;535:
;536:			// if we have fixed all interactions, try another move
;537:			VectorCopy( clipVelocity, velocity );
ADDRLP4 76
ADDRLP4 64
INDIRB
ASGNB 12
line 538
;538:			VectorCopy( endClipVelocity, endVelocity );
ADDRLP4 140
ADDRLP4 128
INDIRB
ASGNB 12
line 539
;539:			break;
ADDRGP4 $190
JUMPV
LABELV $189
line 477
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $191
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $188
LABELV $190
line 541
;540:		}
;541:	}
LABELV $138
line 420
ADDRLP4 228
ADDRLP4 228
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $140
ADDRLP4 228
INDIRI4
ADDRLP4 232
INDIRI4
LTI4 $137
LABELV $139
line 543
;542:
;543:	VectorCopy( endVelocity, velocity );
ADDRLP4 76
ADDRLP4 140
INDIRB
ASGNB 12
line 544
;544:	VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 546
;545:
;546:	return (bumpcount != 0);
ADDRLP4 228
INDIRI4
CNSTI4 0
EQI4 $248
ADDRLP4 248
CNSTI4 1
ASGNI4
ADDRGP4 $249
JUMPV
LABELV $248
ADDRLP4 248
CNSTI4 0
ASGNI4
LABELV $249
ADDRLP4 248
INDIRI4
RETI4
LABELV $136
endproc G_PredictPlayerSlideMove 300 28
export G_PredictPlayerStepSlideMove
proc G_PredictPlayerStepSlideMove 148 28
line 559
;547:}
;548:
;549:
;550:/*
;551:============================
;552:G_PredictPlayerStepSlideMove
;553:
;554:Advance the given entity frametime seconds, stepping and sliding as appropriate
;555:============================
;556:*/
;557:#define	STEPSIZE 18
;558:
;559:void G_PredictPlayerStepSlideMove( gentity_t *ent, float frametime ) {
line 565
;560:	vec3_t start_o, start_v, down_o, down_v;
;561:	vec3_t down, up;
;562:	trace_t trace;
;563:	float stepSize;
;564:
;565:	VectorCopy (ent->s.pos.trBase, start_o);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 566
;566:	VectorCopy (ent->s.pos.trDelta, start_v);
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 568
;567:
;568:	if ( !G_PredictPlayerSlideMove( ent, frametime ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 G_PredictPlayerSlideMove
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $251
line 570
;569:		// not clipped, so forget stepping
;570:		return;
ADDRGP4 $250
JUMPV
LABELV $251
line 573
;571:	}
;572:
;573:	VectorCopy( ent->s.pos.trBase, down_o);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 574
;574:	VectorCopy( ent->s.pos.trDelta, down_v);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 576
;575:
;576:	VectorCopy (start_o, up);
ADDRLP4 80
ADDRLP4 56
INDIRB
ASGNB 12
line 577
;577:	up[2] += STEPSIZE;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 580
;578:
;579:	// test the player position if they were a stepheight higher
;580:	trap_Trace( &trace, start_o, ent->r.mins, ent->r.maxs, up, ent->s.number, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRLP4 136
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 136
INDIRP4
INDIRI4
ARGI4
ADDRLP4 136
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 581
;581:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $254
line 582
;582:		return;		// can't step up
ADDRGP4 $250
JUMPV
LABELV $254
line 585
;583:	}
;584:
;585:	stepSize = trace.endpos[2] - start_o[2];
ADDRLP4 104
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 56+8
INDIRF4
SUBF4
ASGNF4
line 588
;586:
;587:	// try slidemove from this position
;588:	VectorCopy( trace.endpos, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 589
;589:	VectorCopy( start_v, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 92
INDIRB
ASGNB 12
line 591
;590:
;591:	G_PredictPlayerSlideMove( ent, frametime );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 G_PredictPlayerSlideMove
CALLI4
pop
line 594
;592:
;593:	// push down the final amount
;594:	VectorCopy( ent->s.pos.trBase, down );
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 595
;595:	down[2] -= stepSize;
ADDRLP4 68+8
ADDRLP4 68+8
INDIRF4
ADDRLP4 104
INDIRF4
SUBF4
ASGNF4
line 596
;596:	trap_Trace( &trace, ent->s.pos.trBase, ent->r.mins, ent->r.maxs, down, ent->s.number, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 140
INDIRP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 597
;597:	if ( !trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $261
line 598
;598:		VectorCopy( trace.endpos, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 599
;599:	}
LABELV $261
line 600
;600:	if ( trace.fraction < 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $264
line 601
;601:		G_PredictPlayerClipVelocity( ent->s.pos.trDelta, trace.plane.normal, ent->s.pos.trDelta );
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 602
;602:	}
LABELV $264
line 603
;603:}
LABELV $250
endproc G_PredictPlayerStepSlideMove 148 28
export G_PredictPlayerMove
proc G_PredictPlayerMove 0 8
line 615
;604:
;605:
;606:/*
;607:===================
;608:G_PredictPlayerMove
;609:
;610:Advance the given entity frametime seconds, stepping and sliding as appropriate
;611:
;612:This is the entry point to the server-side-only prediction code
;613:===================
;614:*/
;615:void G_PredictPlayerMove( gentity_t *ent, float frametime ) {
line 616
;616:	G_PredictPlayerStepSlideMove( ent, frametime );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 G_PredictPlayerStepSlideMove
CALLV
pop
line 617
;617:}
LABELV $268
endproc G_PredictPlayerMove 0 8
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
