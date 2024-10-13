export CG_CheckAmmo
code
proc CG_CheckAmmo 20 8
file "../../../code/cgame/cg_playerstate.c"
line 37
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
;23:// cg_playerstate.c -- this file acts on changes in a new playerState_t
;24:// With normal play, this will be done after local prediction, but when
;25:// following another player or playing back a demo, it will be checked
;26:// when the snapshot transitions like all the other entities
;27:
;28:#include "cg_local.h"
;29:
;30:/*
;31:==============
;32:CG_CheckAmmo
;33:
;34:If the ammo has gone low enough to generate the warning, play a sound
;35:==============
;36:*/
;37:void CG_CheckAmmo( void ) {
line 44
;38:	int		i;
;39:	int		total;
;40:	int		previous;
;41:	int		weapons;
;42:
;43:	// see about how many seconds of ammo we have remaining
;44:	weapons = cg.snap->ps.stats[ STAT_WEAPONS ];
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ASGNI4
line 47
;45:
;46:	// if player doesn't have a weapon, don't draw an ammo warning
;47:	if ( weapons == WP_NONE )
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $83
line 48
;48:		return;	
ADDRGP4 $81
JUMPV
LABELV $83
line 50
;49:
;50:	total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 51
;51:	for ( i = WP_MACHINEGUN ; i < WP_NUM_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $85
line 52
;52:		if ( ! ( weapons & ( 1 << i ) ) ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $89
line 53
;53:			continue;
ADDRGP4 $86
JUMPV
LABELV $89
line 55
;54:		}
;55:		if(cg.snap->ps.ammo[i] == -1){
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $91
line 56
;56:			continue;
ADDRGP4 $86
JUMPV
LABELV $91
line 58
;57:		}
;58:		switch ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $94
ADDRLP4 0
INDIRI4
CNSTI4 12
GTI4 $94
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $99-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $99
address $96
address $96
address $96
address $94
address $96
address $94
address $94
address $94
address $94
address $96
code
LABELV $96
line 66
;59:		case WP_ROCKET_LAUNCHER:
;60:		case WP_GRENADE_LAUNCHER:
;61:		case WP_RAILGUN:
;62:		case WP_SHOTGUN:
;63:
;64:		case WP_PROX_LAUNCHER:
;65:
;66:			total += cg.snap->ps.ammo[i] * 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1000
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
MULI4
ADDI4
ASGNI4
line 67
;67:			break;
ADDRGP4 $95
JUMPV
LABELV $94
line 69
;68:		default:
;69:			total += cg.snap->ps.ammo[i] * 200;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 200
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
MULI4
ADDI4
ASGNI4
line 70
;70:			break;
LABELV $95
line 72
;71:		}
;72:		if ( total >= 5000 ) {
ADDRLP4 4
INDIRI4
CNSTI4 5000
LTI4 $101
line 73
;73:			cg.lowAmmoWarning = 0;
ADDRGP4 cg+1952676
CNSTI4 0
ASGNI4
line 74
;74:			return;
ADDRGP4 $81
JUMPV
LABELV $101
line 76
;75:		}
;76:	}
LABELV $86
line 51
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $85
line 78
;77:
;78:	previous = cg.lowAmmoWarning;
ADDRLP4 12
ADDRGP4 cg+1952676
INDIRI4
ASGNI4
line 80
;79:
;80:	if ( total == 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $105
line 81
;81:		cg.lowAmmoWarning = 2;
ADDRGP4 cg+1952676
CNSTI4 2
ASGNI4
line 82
;82:	} else {
ADDRGP4 $106
JUMPV
LABELV $105
line 83
;83:		cg.lowAmmoWarning = 1;
ADDRGP4 cg+1952676
CNSTI4 1
ASGNI4
line 84
;84:	}
LABELV $106
line 87
;85:
;86:	// play a sound on transitions
;87:	if ( cg.lowAmmoWarning != previous ) {
ADDRGP4 cg+1952676
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $109
line 88
;88:		trap_S_StartLocalSound( cgs.media.noAmmoSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+956380+2144
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 89
;89:	}
LABELV $109
line 90
;90:}
LABELV $81
endproc CG_CheckAmmo 20 8
export CG_DamageFeedback
proc CG_DamageFeedback 72 16
line 97
;91:
;92:/*
;93:==============
;94:CG_DamageFeedback
;95:==============
;96:*/
;97:void CG_DamageFeedback( int yawByte, int pitchByte, int damage ) {
line 108
;98:	float		left, front, up;
;99:	float		kick;
;100:	int			health;
;101:	float		scale;
;102:	vec3_t		dir;
;103:	vec3_t		angles;
;104:	float		dist;
;105:	float		yaw, pitch;
;106:
;107:	// show the attacking player's head and name in corner
;108:	cg.attackerTime = cg.time;
ADDRGP4 cg+1952704
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 111
;109:
;110:	// the lower on health you are, the greater the view kick will be
;111:	health = cg.snap->ps.stats[STAT_HEALTH];
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ASGNI4
line 112
;112:	if ( health < 40 ) {
ADDRLP4 20
INDIRI4
CNSTI4 40
GEI4 $118
line 113
;113:		scale = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 114
;114:	} else {
ADDRGP4 $119
JUMPV
LABELV $118
line 115
;115:		scale = 40.0 / health;
ADDRLP4 28
CNSTF4 1109393408
ADDRLP4 20
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 116
;116:	}
LABELV $119
line 117
;117:	kick = damage * scale;
ADDRLP4 12
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 119
;118:
;119:	if (kick < 5)
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
GEF4 $120
line 120
;120:		kick = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
LABELV $120
line 121
;121:	if (kick > 10)
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $122
line 122
;122:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
LABELV $122
line 125
;123:
;124:	// if yaw and pitch are both 255, make the damage always centered (falling, etc)
;125:	if ( yawByte == 255 && pitchByte == 255 ) {
ADDRLP4 60
CNSTI4 255
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $124
ADDRFP4 4
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $124
line 126
;126:		cg.damageX = 0;
ADDRGP4 cg+1952980
CNSTF4 0
ASGNF4
line 127
;127:		cg.damageY = 0;
ADDRGP4 cg+1952984
CNSTF4 0
ASGNF4
line 128
;128:		cg.v_dmg_roll = 0;
ADDRGP4 cg+1953028
CNSTF4 0
ASGNF4
line 129
;129:		cg.v_dmg_pitch = -kick;
ADDRGP4 cg+1953024
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
line 130
;130:	} else {
ADDRGP4 $125
JUMPV
LABELV $124
line 132
;131:		// positional
;132:		pitch = pitchByte / 255.0 * 360;
ADDRLP4 56
CNSTF4 1135869952
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1132396544
DIVF4
MULF4
ASGNF4
line 133
;133:		yaw = yawByte / 255.0 * 360;
ADDRLP4 52
CNSTF4 1135869952
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1132396544
DIVF4
MULF4
ASGNF4
line 135
;134:
;135:		angles[PITCH] = pitch;
ADDRLP4 32
ADDRLP4 56
INDIRF4
ASGNF4
line 136
;136:		angles[YAW] = yaw;
ADDRLP4 32+4
ADDRLP4 52
INDIRF4
ASGNF4
line 137
;137:		angles[ROLL] = 0;
ADDRLP4 32+8
CNSTF4 0
ASGNF4
line 139
;138:
;139:		AngleVectors( angles, dir, NULL, NULL );
ADDRLP4 32
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 140
;140:		VectorSubtract( vec3_origin, dir, dir );
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 142
;141:
;142:		front = DotProduct (dir, cg.refdef.viewaxis[0] );
ADDRLP4 16
ADDRLP4 0
INDIRF4
ADDRGP4 cg+1870616+36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+1870616+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+1870616+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 143
;143:		left = DotProduct (dir, cg.refdef.viewaxis[1] );
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRGP4 cg+1870616+36+12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+1870616+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+1870616+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 144
;144:		up = DotProduct (dir, cg.refdef.viewaxis[2] );
ADDRLP4 48
ADDRLP4 0
INDIRF4
ADDRGP4 cg+1870616+36+24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+1870616+36+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+1870616+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 146
;145:
;146:		dir[0] = front;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 147
;147:		dir[1] = left;
ADDRLP4 0+4
ADDRLP4 24
INDIRF4
ASGNF4
line 148
;148:		dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 149
;149:		dist = VectorLength( dir );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 68
INDIRF4
ASGNF4
line 150
;150:		if ( dist < 0.1 ) {
ADDRLP4 44
INDIRF4
CNSTF4 1036831949
GEF4 $176
line 151
;151:			dist = 0.1f;
ADDRLP4 44
CNSTF4 1036831949
ASGNF4
line 152
;152:		}
LABELV $176
line 154
;153:
;154:		cg.v_dmg_roll = kick * left;
ADDRGP4 cg+1953028
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 156
;155:		
;156:		cg.v_dmg_pitch = -kick * front;
ADDRGP4 cg+1953024
ADDRLP4 12
INDIRF4
NEGF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 158
;157:
;158:		if ( front <= 0.1 ) {
ADDRLP4 16
INDIRF4
CNSTF4 1036831949
GTF4 $180
line 159
;159:			front = 0.1f;
ADDRLP4 16
CNSTF4 1036831949
ASGNF4
line 160
;160:		}
LABELV $180
line 161
;161:		cg.damageX = -left / front;
ADDRGP4 cg+1952980
ADDRLP4 24
INDIRF4
NEGF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
line 162
;162:		cg.damageY = up / dist;
ADDRGP4 cg+1952984
ADDRLP4 48
INDIRF4
ADDRLP4 44
INDIRF4
DIVF4
ASGNF4
line 163
;163:	}
LABELV $125
line 166
;164:
;165:	// clamp the position
;166:	if ( cg.damageX > 1.0 ) {
ADDRGP4 cg+1952980
INDIRF4
CNSTF4 1065353216
LEF4 $184
line 167
;167:		cg.damageX = 1.0;
ADDRGP4 cg+1952980
CNSTF4 1065353216
ASGNF4
line 168
;168:	}
LABELV $184
line 169
;169:	if ( cg.damageX < - 1.0 ) {
ADDRGP4 cg+1952980
INDIRF4
CNSTF4 3212836864
GEF4 $188
line 170
;170:		cg.damageX = -1.0;
ADDRGP4 cg+1952980
CNSTF4 3212836864
ASGNF4
line 171
;171:	}
LABELV $188
line 173
;172:
;173:	if ( cg.damageY > 1.0 ) {
ADDRGP4 cg+1952984
INDIRF4
CNSTF4 1065353216
LEF4 $192
line 174
;174:		cg.damageY = 1.0;
ADDRGP4 cg+1952984
CNSTF4 1065353216
ASGNF4
line 175
;175:	}
LABELV $192
line 176
;176:	if ( cg.damageY < - 1.0 ) {
ADDRGP4 cg+1952984
INDIRF4
CNSTF4 3212836864
GEF4 $196
line 177
;177:		cg.damageY = -1.0;
ADDRGP4 cg+1952984
CNSTF4 3212836864
ASGNF4
line 178
;178:	}
LABELV $196
line 181
;179:
;180:	// don't let the screen flashes vary as much
;181:	if ( kick > 10 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $200
line 182
;182:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
line 183
;183:	}
LABELV $200
line 184
;184:	cg.damageValue = kick;
ADDRGP4 cg+1952988
ADDRLP4 12
INDIRF4
ASGNF4
line 185
;185:	cg.v_dmg_time = cg.time + DAMAGE_TIME;
ADDRGP4 cg+1953020
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 186
;186:	cg.damageTime = cg.snap->serverTime;
ADDRGP4 cg+1952976
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 187
;187:}
LABELV $114
endproc CG_DamageFeedback 72 16
export CG_Respawn
proc CG_Respawn 4 0
line 199
;188:
;189:
;190:
;191:
;192:/*
;193:================
;194:CG_Respawn
;195:
;196:A respawn happened this snapshot
;197:================
;198:*/
;199:void CG_Respawn( void ) {
line 202
;200:	int i;
;201:	// no error decay on player movement
;202:	cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+1868880
CNSTI4 1
ASGNI4
line 205
;203:
;204:	// display weapons available
;205:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+1952964
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 208
;206:
;207:	// select the weapon the server says we are using
;208:	cg.weaponSelect = cg.snap->ps.weapon;
ADDRGP4 cg+1870440
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 210
;209:	
;210:	for(i = 1 ; i < WEAPONS_NUM-15 ; i++){
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $213
line 211
;211:		cg.swep_listcl[i+15] = 0; 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1870444+60
ADDP4
CNSTI4 0
ASGNI4
line 212
;212:	}
LABELV $214
line 210
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $213
line 213
;213:}
LABELV $207
endproc CG_Respawn 4 0
export CG_CheckPlayerstateEvents
proc CG_CheckPlayerstateEvents 52 8
line 222
;214:
;215:extern char *eventnames[];
;216:
;217:/*
;218:==============
;219:CG_CheckPlayerstateEvents
;220:==============
;221:*/
;222:void CG_CheckPlayerstateEvents( playerState_t *ps, playerState_t *ops ) {
line 227
;223:	int			i;
;224:	int			event;
;225:	centity_t	*cent;
;226:
;227:	if ( ps->externalEvent && ps->externalEvent != ops->externalEvent ) {
ADDRLP4 12
CNSTI4 128
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $220
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
EQI4 $220
line 228
;228:		cent = &cg_entities[ ps->clientNum ];
ADDRLP4 4
CNSTI4 928
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 229
;229:		cent->currentState.event = ps->externalEvent;
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 230
;230:		cent->currentState.eventParm = ps->externalEventParm;
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 231
;231:		CG_EntityEvent( cent, cent->lerpOrigin );
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
line 232
;232:	}
LABELV $220
line 234
;233:
;234:	cent = &cg.predictedPlayerEntity; // cg_entities[ ps->clientNum ];
ADDRLP4 4
ADDRGP4 cg+1869400
ASGNP4
line 236
;235:	// go through the predictable events buffer
;236:	for ( i = ps->eventSequence - MAX_PS_EVENTS ; i < ps->eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $223
line 238
;237:		// if we have a new predictable event
;238:		if ( i >= ops->eventSequence
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $229
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
LEI4 $227
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 32
INDIRI4
LSHI4
ASGNI4
ADDRLP4 40
CNSTI4 112
ASGNI4
ADDRLP4 36
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 24
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
EQI4 $227
LABELV $229
line 241
;239:			// or the server told us to play another event instead of a predicted event we already issued
;240:			// or something the server told us changed our prediction causing a different event
;241:			|| (i > ops->eventSequence - MAX_PS_EVENTS && ps->events[i & (MAX_PS_EVENTS-1)] != ops->events[i & (MAX_PS_EVENTS-1)]) ) {
line 243
;242:
;243:			event = ps->events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 244
;244:			cent->currentState.event = event;
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 245
;245:			cent->currentState.eventParm = ps->eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 246
;246:			CG_EntityEvent( cent, cent->lerpOrigin );
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
line 248
;247:
;248:			cg.predictableEvents[ i & (MAX_PREDICTED_EVENTS-1) ] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1870352
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 250
;249:
;250:			cg.eventSequence++;
ADDRLP4 48
ADDRGP4 cg+1870348
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 251
;251:		}
LABELV $227
line 252
;252:	}
LABELV $224
line 236
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $226
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $223
line 253
;253:}
LABELV $219
endproc CG_CheckPlayerstateEvents 52 8
export CG_CheckChangedPredictableEvents
proc CG_CheckChangedPredictableEvents 24 8
line 260
;254:
;255:/*
;256:==================
;257:CG_CheckChangedPredictableEvents
;258:==================
;259:*/
;260:void CG_CheckChangedPredictableEvents( playerState_t *ps ) {
line 265
;261:	int i;
;262:	int event;
;263:	centity_t	*cent;
;264:
;265:	cent = &cg.predictedPlayerEntity;
ADDRLP4 4
ADDRGP4 cg+1869400
ASGNP4
line 266
;266:	for ( i = ps->eventSequence - MAX_PS_EVENTS ; i < ps->eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $234
line 268
;267:		//
;268:		if (i >= cg.eventSequence) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1870348
INDIRI4
LTI4 $238
line 269
;269:			continue;
ADDRGP4 $235
JUMPV
LABELV $238
line 272
;270:		}
;271:		// if this event is not further back in than the maximum predictable events we remember
;272:		if (i > cg.eventSequence - MAX_PREDICTED_EVENTS) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+1870348
INDIRI4
CNSTI4 16
SUBI4
LEI4 $241
line 274
;273:			// if the new playerstate event is different from a previously predicted one
;274:			if ( ps->events[i & (MAX_PS_EVENTS-1)] != cg.predictableEvents[i & (MAX_PREDICTED_EVENTS-1) ] ) {
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 cg+1870352
ADDP4
INDIRI4
EQI4 $244
line 276
;275:
;276:				event = ps->events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 277
;277:				cent->currentState.event = event;
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 278
;278:				cent->currentState.eventParm = ps->eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 279
;279:				CG_EntityEvent( cent, cent->lerpOrigin );
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
line 281
;280:
;281:				cg.predictableEvents[ i & (MAX_PREDICTED_EVENTS-1) ] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1870352
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 283
;282:
;283:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $248
line 284
;284:					CG_Printf("WARNING: changed predicted event\n");
ADDRGP4 $251
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 285
;285:				}
LABELV $248
line 286
;286:			}
LABELV $244
line 287
;287:		}
LABELV $241
line 288
;288:	}
LABELV $235
line 266
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $237
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $234
line 289
;289:}
LABELV $232
endproc CG_CheckChangedPredictableEvents 24 8
proc pushReward 4 0
line 296
;290:
;291:/*
;292:==================
;293:pushReward
;294:==================
;295:*/
;296:static void pushReward(sfxHandle_t sfx, qhandle_t shader, int rewardCount) {
line 297
;297:	if (cg.rewardStack < (MAX_REWARDSTACK-1)) {
ADDRGP4 cg+1952712
INDIRI4
CNSTI4 9
GEI4 $253
line 298
;298:		cg.rewardStack++;
ADDRLP4 0
ADDRGP4 cg+1952712
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 299
;299:		cg.rewardSound[cg.rewardStack] = sfx;
ADDRGP4 cg+1952712
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1952800
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 300
;300:		cg.rewardShader[cg.rewardStack] = shader;
ADDRGP4 cg+1952712
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1952760
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 301
;301:		cg.rewardCount[cg.rewardStack] = rewardCount;
ADDRGP4 cg+1952712
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+1952720
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 302
;302:	}
LABELV $253
line 303
;303:}
LABELV $252
endproc pushReward 4 0
export CG_CheckLocalSounds
proc CG_CheckLocalSounds 44 16
line 311
;304:
;305:        
;306:/*
;307:==================
;308:CG_CheckLocalSounds
;309:==================
;310:*/
;311:void CG_CheckLocalSounds( playerState_t *ps, playerState_t *ops ) {
line 316
;312:	int			highScore, health, armor, reward;
;313:	sfxHandle_t sfx;
;314:
;315:	// don't play the sounds if the player just changed teams
;316:	if ( ps->persistant[PERS_TEAM] != ops->persistant[PERS_TEAM] ) {
ADDRLP4 20
CNSTI4 260
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $264
line 317
;317:		return;
ADDRGP4 $263
JUMPV
LABELV $264
line 321
;318:	}
;319:
;320:	// hit changes
;321:	if ( ps->persistant[PERS_HITS] > ops->persistant[PERS_HITS] ) {
ADDRLP4 24
CNSTI4 252
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
LEI4 $266
line 322
;322:		armor  = ps->persistant[PERS_ATTACKEE_ARMOR] & 0xff;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 323
;323:		health = ps->persistant[PERS_ATTACKEE_ARMOR] >> 8;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 8
RSHI4
ASGNI4
line 324
;324:if(cgs.gametype != GT_SANDBOX && cgs.gametype != GT_SINGLE){
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 0
EQI4 $267
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
EQI4 $267
line 325
;325:		if (health > 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
LEI4 $272
line 326
;326:			trap_S_StartLocalSound( cgs.media.hitSoundHighArmor, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+956380+2232
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 327
;327:		} else if (health > 50 ) {
ADDRGP4 $267
JUMPV
LABELV $272
ADDRLP4 0
INDIRI4
CNSTI4 50
LEI4 $276
line 328
;328:			trap_S_StartLocalSound( cgs.media.hitSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+956380+2228
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 329
;329:		} else {
ADDRGP4 $267
JUMPV
LABELV $276
line 330
;330:			trap_S_StartLocalSound( cgs.media.hitSoundLowArmor, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+956380+2236
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 331
;331:		}
line 332
;332:}
line 333
;333:	} else if ( ps->persistant[PERS_HITS] < ops->persistant[PERS_HITS] ) {
ADDRGP4 $267
JUMPV
LABELV $266
ADDRLP4 28
CNSTI4 252
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
GEI4 $282
line 334
;334:		trap_S_StartLocalSound( cgs.media.hitTeamSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+956380+2240
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 335
;335:	}
LABELV $282
LABELV $267
line 338
;336:
;337:	// health changes of more than -1 should make pain sounds
;338:	if ( ps->stats[STAT_HEALTH] < ops->stats[STAT_HEALTH] - 1 ) {
ADDRLP4 32
CNSTI4 184
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $286
line 339
;339:		if ( ps->stats[STAT_HEALTH] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $288
line 340
;340:			CG_PainEvent( &cg.predictedPlayerEntity, ps->stats[STAT_HEALTH] );
ADDRGP4 cg+1869400
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 341
;341:		}
LABELV $288
line 342
;342:                CG_ScorePlum( ps->clientNum, ps->origin, ops->stats[STAT_HEALTH] - ps->stats[STAT_HEALTH], 0 );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 40
CNSTI4 184
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
SUBI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 343
;343:	}
LABELV $286
line 347
;344:
;345:
;346:	// if we are going into the intermission, don't start any voices
;347:	if ( cg.intermissionStarted ) {
ADDRGP4 cg+24
INDIRI4
CNSTI4 0
EQI4 $291
line 348
;348:		return;
LABELV $291
line 350
;349:	}
;350:}
LABELV $263
endproc CG_CheckLocalSounds 44 16
export CG_CheckLocalSoundsVeh
proc CG_CheckLocalSoundsVeh 44 16
line 352
;351:
;352:void CG_CheckLocalSoundsVeh( playerState_t *ps, playerState_t *ops ) {
line 357
;353:	int			highScore, health, armor, reward;
;354:	sfxHandle_t sfx;
;355:
;356:	// don't play the sounds if the player just changed teams
;357:	if ( ps->persistant[PERS_TEAM] != ops->persistant[PERS_TEAM] ) {
ADDRLP4 20
CNSTI4 260
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $295
line 358
;358:		return;
ADDRGP4 $294
JUMPV
LABELV $295
line 362
;359:	}
;360:
;361:	// hit changes
;362:	if ( ps->persistant[PERS_HITS] > ops->persistant[PERS_HITS] ) {
ADDRLP4 24
CNSTI4 252
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
LEI4 $297
line 363
;363:		armor  = ps->persistant[PERS_ATTACKEE_ARMOR] & 0xff;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 364
;364:		health = ps->persistant[PERS_ATTACKEE_ARMOR] >> 8;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 8
RSHI4
ASGNI4
line 374
;365:#if 0
;366:		if (health > 100 ) {
;367:			trap_S_StartLocalSound( cgs.media.hitSoundHighArmor, CHAN_LOCAL_SOUND );
;368:		} else if (health > 50 ) {
;369:			trap_S_StartLocalSound( cgs.media.hitSound, CHAN_LOCAL_SOUND );
;370:		} else {
;371:			trap_S_StartLocalSound( cgs.media.hitSoundLowArmor, CHAN_LOCAL_SOUND );
;372:		}
;373:#endif
;374:	} else if ( ps->persistant[PERS_HITS] < ops->persistant[PERS_HITS] ) {
ADDRGP4 $298
JUMPV
LABELV $297
ADDRLP4 28
CNSTI4 252
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
GEI4 $299
line 375
;375:		trap_S_StartLocalSound( cgs.media.hitTeamSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+956380+2240
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 376
;376:	}
LABELV $299
LABELV $298
line 379
;377:
;378:	// health changes of more than -1 should make pain sounds
;379:	if ( ps->stats[STAT_VEHICLEHP] < ops->stats[STAT_VEHICLEHP] - 1 ) {
ADDRLP4 32
CNSTI4 236
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $303
line 380
;380:		if ( ps->stats[STAT_VEHICLEHP] > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 0
LEI4 $305
line 381
;381:			CG_PainVehicleEvent( &cg.predictedPlayerEntity, ps->stats[STAT_VEHICLEHP] );
ADDRGP4 cg+1869400
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainVehicleEvent
CALLV
pop
line 382
;382:		}
LABELV $305
line 383
;383:                CG_ScorePlum( ps->clientNum, ps->origin, ops->stats[STAT_VEHICLEHP] - ps->stats[STAT_VEHICLEHP], 0 );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 40
CNSTI4 236
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
SUBI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 384
;384:	}
LABELV $303
line 388
;385:
;386:
;387:	// if we are going into the intermission, don't start any voices
;388:	if ( cg.intermissionStarted ) {
ADDRGP4 cg+24
INDIRI4
CNSTI4 0
EQI4 $308
line 389
;389:		return;
LABELV $308
line 391
;390:	}
;391:}
LABELV $294
endproc CG_CheckLocalSoundsVeh 44 16
export CG_TransitionPlayerState
proc CG_TransitionPlayerState 24 12
line 399
;392:
;393:/*
;394:===============
;395:CG_TransitionPlayerState
;396:
;397:===============
;398:*/
;399:void CG_TransitionPlayerState( playerState_t *ps, playerState_t *ops ) {
line 401
;400:	// check for changing follow mode
;401:	if ( ps->clientNum != ops->clientNum ) {
ADDRLP4 0
CNSTI4 140
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
EQI4 $312
line 402
;402:		cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+1868880
CNSTI4 1
ASGNI4
line 404
;403:		// make sure we don't get any unwanted transition effects
;404:		*ops = *ps;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 472
line 405
;405:	}
LABELV $312
line 408
;406:
;407:	// damage events (player is getting wounded)
;408:	if ( ps->damageEvent != ops->damageEvent && ps->damageCount ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 168
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
EQI4 $315
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $315
line 409
;409:		CG_DamageFeedback( ps->damageYaw, ps->damagePitch, ps->damageCount );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DamageFeedback
CALLV
pop
line 410
;410:	}
LABELV $315
line 413
;411:
;412:	// respawning
;413:	if ( ps->persistant[PERS_SPAWN_COUNT] != ops->persistant[PERS_SPAWN_COUNT] ) {
ADDRLP4 12
CNSTI4 264
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
EQI4 $317
line 414
;414:		CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 415
;415:	}
LABELV $317
line 417
;416:
;417:	if ( cg.mapRestart ) {
ADDRGP4 cg+1868912
INDIRI4
CNSTI4 0
EQI4 $319
line 418
;418:		CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 419
;419:		cg.mapRestart = qfalse;
ADDRGP4 cg+1868912
CNSTI4 0
ASGNI4
line 420
;420:	}
LABELV $319
line 422
;421:
;422:	if(!cg.snap->ps.stats[STAT_VEHICLE]){
ADDRGP4 cg+36
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $323
line 423
;423:	if ( cg.snap->ps.pm_type != PM_INTERMISSION 
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
EQI4 $324
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
EQI4 $324
line 424
;424:		&& ps->persistant[PERS_TEAM] != TEAM_SPECTATOR ) {
line 425
;425:		CG_CheckLocalSounds( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckLocalSounds
CALLV
pop
line 426
;426:	}
line 427
;427:	} else {
ADDRGP4 $324
JUMPV
LABELV $323
line 428
;428:	if ( cg.snap->ps.pm_type != PM_INTERMISSION 
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
EQI4 $329
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
EQI4 $329
line 429
;429:		&& ps->persistant[PERS_TEAM] != TEAM_SPECTATOR ) {
line 430
;430:		CG_CheckLocalSoundsVeh( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckLocalSoundsVeh
CALLV
pop
line 431
;431:	}
LABELV $329
line 432
;432:	}
LABELV $324
line 435
;433:
;434:	// check for going low on ammo
;435:	CG_CheckAmmo();
ADDRGP4 CG_CheckAmmo
CALLV
pop
line 438
;436:
;437:	// run events
;438:	CG_CheckPlayerstateEvents( ps, ops );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckPlayerstateEvents
CALLV
pop
line 441
;439:
;440:	// smooth the ducking viewheight change
;441:	if ( ps->viewheight != ops->viewheight ) {
ADDRLP4 16
CNSTI4 164
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
EQI4 $332
line 442
;442:		cg.duckChange = ps->viewheight - ops->viewheight;
ADDRLP4 20
CNSTI4 164
ASGNI4
ADDRGP4 cg+1870424
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 443
;443:		cg.duckTime = cg.time;
ADDRGP4 cg+1870428
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 444
;444:	}
LABELV $332
line 445
;445:}
LABELV $311
endproc CG_TransitionPlayerState 24 12
import eventnames
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
LABELV $251
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
