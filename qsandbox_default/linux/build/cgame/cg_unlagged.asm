export CG_PredictWeaponEffects
code
proc CG_PredictWeaponEffects 192 48
file "../../../code/cgame/cg_unlagged.c"
line 43
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
;23:#include "cg_local.h"
;24:
;25:// we'll need these prototypes
;26:void CG_ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, int otherEntNum );
;27:void CG_Bullet( vec3_t end, int sourceEntityNum, vec3_t normal, qboolean flesh, int fleshEntityNum );
;28:
;29:// and this as well
;30://Must be in sync with g_weapon.c
;31:#define MACHINEGUN_SPREAD	200
;32:#define CHAINGUN_SPREAD		600
;33:
;34:/*
;35:=======================
;36:CG_PredictWeaponEffects
;37:
;38:Draws predicted effects for the railgun, shotgun, and machinegun.  The
;39:lightning gun is done in CG_LightningBolt, since it was just a matter
;40:of setting the right origin and angles.
;41:=======================
;42:*/
;43:void CG_PredictWeaponEffects( centity_t *cent ) {
line 45
;44:	vec3_t		muzzlePoint, forward, right, up;
;45:	entityState_t *ent = &cent->currentState;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
line 50
;46:	clientInfo_t	*ci;
;47:	int				weaphack;
;48:
;49:	// if the client isn't us, forget it
;50:	if ( cent->currentState.number != cg.predictedPlayerState.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+1868928+140
INDIRI4
EQI4 $82
line 51
;51:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 55
;52:	}
;53:
;54:	// if it's not switched on server-side, forget it
;55:	if ( !cgs.delagHitscan ) {
ADDRGP4 cgs+958932
INDIRI4
CNSTI4 0
NEI4 $86
line 56
;56:		return;
ADDRGP4 $81
JUMPV
LABELV $86
line 59
;57:	}
;58:	
;59:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 28
CNSTI4 1944
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 61
;60:	
;61:	if(ci->swepid >= 1){
ADDRLP4 28
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
LTI4 $90
line 62
;62:	weaphack = ci->swepid;
ADDRLP4 24
ADDRLP4 28
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 63
;63:	} else {
ADDRGP4 $91
JUMPV
LABELV $90
line 64
;64:	weaphack = ent->weapon;
ADDRLP4 24
ADDRLP4 56
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 65
;65:	}
LABELV $91
line 68
;66:
;67:	// get the muzzle point
;68:	VectorCopy( cg.predictedPlayerState.origin, muzzlePoint );
ADDRLP4 0
ADDRGP4 cg+1868928+20
INDIRB
ASGNB 12
line 69
;69:	muzzlePoint[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+1868928+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 72
;70:
;71:	// get forward, right, and up
;72:	AngleVectors( cg.predictedPlayerState.viewangles, forward, right, up );
ADDRGP4 cg+1868928+152
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 73
;73:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 60
CNSTF4 1096810496
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1096810496
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 76
;74:
;75:	// was it a rail attack?
;76:	if ( weaphack == WP_RAILGUN ) {
ADDRLP4 24
INDIRI4
CNSTI4 7
NEI4 $105
line 78
;77:		// do we have it on for the rail gun?
;78:		if ( cg_delag.integer & 1 || cg_delag.integer & 16 ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
NEI4 $111
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $106
LABELV $111
line 83
;79:			trace_t trace;
;80:			vec3_t endPoint;
;81:
;82:			// trace forward
;83:			VectorMA( muzzlePoint, 8192, forward, endPoint );
ADDRLP4 136
CNSTF4 1174405120
ASGNF4
ADDRLP4 124
ADDRLP4 0
INDIRF4
ADDRLP4 136
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 136
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1174405120
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 141
;84:
;85:			// THIS IS FOR DEBUGGING!
;86:			// you definitely *will* want something like this to test the backward reconciliation
;87:			// to make sure it's working *exactly* right
;88:			/*if ( cg_debugDelag.integer ) {
;89:                         * Sago: There are some problems with some unlagged code. People will just have to trust it
;90:				// trace forward
;91:				CG_Trace( &trace, muzzlePoint, vec3_origin, vec3_origin, endPoint, cent->currentState.number, CONTENTS_BODY|CONTENTS_SOLID );
;92:
;93:				// did we hit another player?
;94:				if ( trace.fraction < 1.0f && (trace.contents & CONTENTS_BODY) ) {
;95:					// if we have two snapshots (we're interpolating)
;96:					if ( cg.nextSnap ) {
;97:						centity_t *c = &cg_entities[trace.entityNum];
;98:						vec3_t origin1, origin2;
;99:
;100:						// figure the two origins used for interpolation
;101:						BG_EvaluateTrajectory( &c->currentState.pos, cg.snap->serverTime, origin1 );
;102:						BG_EvaluateTrajectory( &c->nextState.pos, cg.nextSnap->serverTime, origin2 );
;103:
;104:						// print some debugging stuff exactly like what the server does
;105:
;106:						// it starts with "Int:" to let you know the target was interpolated
;107:						CG_Printf("^3Int: time: %d, j: %d, k: %d, origin: %0.2f %0.2f %0.2f\n",
;108:								cg.oldTime, cg.snap->serverTime, cg.nextSnap->serverTime,
;109:								c->lerpOrigin[0], c->lerpOrigin[1], c->lerpOrigin[2]);
;110:						CG_Printf("^5frac: %0.4f, origin1: %0.2f %0.2f %0.2f, origin2: %0.2f %0.2f %0.2f\n",
;111:							cg.frameInterpolation, origin1[0], origin1[1], origin1[2], origin2[0], origin2[1], origin2[2]);
;112:					}
;113:					else {
;114:						// we haven't got a next snapshot
;115:						// the client clock has either drifted ahead (seems to happen once per server frame
;116:						// when you play locally) or the client is using timenudge
;117:						// in any case, CG_CalcEntityLerpPositions extrapolated rather than interpolated
;118:						centity_t *c = &cg_entities[trace.entityNum];
;119:						vec3_t origin1, origin2;
;120:
;121:						c->currentState.pos.trTime = TR_LINEAR_STOP;
;122:						c->currentState.pos.trTime = cg.snap->serverTime;
;123:						c->currentState.pos.trDuration = 1000 / sv_fps.integer;
;124:
;125:						BG_EvaluateTrajectory( &c->currentState.pos, cg.snap->serverTime, origin1 );
;126:						BG_EvaluateTrajectory( &c->currentState.pos, cg.snap->serverTime + 1000 / sv_fps.integer, origin2 );
;127:
;128:						// print some debugging stuff exactly like what the server does
;129:
;130:						// it starts with "Ext:" to let you know the target was extrapolated
;131:						CG_Printf("^3Ext: time: %d, j: %d, k: %d, origin: %0.2f %0.2f %0.2f\n",
;132:								cg.oldTime, cg.snap->serverTime, cg.snap->serverTime,
;133:								c->lerpOrigin[0], c->lerpOrigin[1], c->lerpOrigin[2]);
;134:						CG_Printf("^5frac: %0.4f, origin1: %0.2f %0.2f %0.2f, origin2: %0.2f %0.2f %0.2f\n",
;135:							cg.frameInterpolation, origin1[0], origin1[1], origin1[2], origin2[0], origin2[1], origin2[2]);
;136:					}
;137:				}
;138:			}*/
;139:
;140:			// find the rail's end point
;141:			CG_Trace( &trace, muzzlePoint, vec3_origin, vec3_origin, endPoint, cg.predictedPlayerState.clientNum, CONTENTS_SOLID );
ADDRLP4 68
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 cg+1868928+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 144
;142:
;143:			// do the magic-number adjustment
;144:			VectorMA( muzzlePoint, 4, right, muzzlePoint );
ADDRLP4 144
CNSTF4 1082130432
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 144
INDIRF4
ADDRLP4 32+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDRLP4 32+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 145
;145:			VectorMA( muzzlePoint, -1, up, muzzlePoint );
ADDRLP4 148
CNSTF4 3212836864
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3212836864
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 147
;146:
;147:                        if(!cg.renderingThirdPerson) {
ADDRGP4 cg+1868916
INDIRI4
CNSTI4 0
NEI4 $132
line 148
;148:                           if(cg_drawGun.integer == 2)
ADDRGP4 cg_drawGun+12
INDIRI4
CNSTI4 2
NEI4 $135
line 149
;149:				VectorMA(muzzlePoint, 8, cg.refdef.viewaxis[1], muzzlePoint);
ADDRLP4 152
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 152
INDIRF4
ADDRGP4 cg+1870616+36+12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 152
INDIRF4
ADDRGP4 cg+1870616+36+12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDRGP4 cg+1870616+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $136
JUMPV
LABELV $135
line 150
;150:                           else if(cg_drawGun.integer == 3)
ADDRGP4 cg_drawGun+12
INDIRI4
CNSTI4 3
NEI4 $153
line 151
;151:				VectorMA(muzzlePoint, 4, cg.refdef.viewaxis[1], muzzlePoint);
ADDRLP4 156
CNSTF4 1082130432
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 156
INDIRF4
ADDRGP4 cg+1870616+36+12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 156
INDIRF4
ADDRGP4 cg+1870616+36+12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDRGP4 cg+1870616+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $153
LABELV $136
line 152
;152:                        }
LABELV $132
line 155
;153:
;154:			// draw a rail trail
;155:			CG_RailTrail( &cgs.clientinfo[cent->currentState.number], muzzlePoint, trace.endpos );
CNSTI4 1944
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 68+12
ARGP4
ADDRGP4 CG_RailTrail
CALLV
pop
line 159
;156:			//Com_Printf( "Predicted rail trail\n" );
;157:
;158:			// explosion at end if not SURF_NOIMPACT
;159:			if ( !(trace.surfaceFlags & SURF_NOIMPACT) ) {
ADDRLP4 68+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $106
line 161
;160:				// predict an explosion
;161:				CG_MissileHitWall( weaphack, cg.predictedPlayerState.clientNum, trace.endpos, trace.plane.normal, IMPACTSOUND_DEFAULT );
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 cg+1868928+140
INDIRI4
ARGI4
ADDRLP4 68+12
ARGP4
ADDRLP4 68+24
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 162
;162:			}
line 163
;163:		}
line 164
;164:	}
ADDRGP4 $106
JUMPV
LABELV $105
line 166
;165:	// was it a shotgun attack?
;166:	else if ( weaphack == WP_SHOTGUN ) {
ADDRLP4 24
INDIRI4
CNSTI4 3
NEI4 $180
line 168
;167:		// do we have it on for the shotgun?
;168:		if ( cg_delag.integer & 1 || cg_delag.integer & 4 ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
NEI4 $186
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $181
LABELV $186
line 175
;169:			int contents;
;170:			vec3_t endPoint, v;
;171:			vec3_t			up;
;172:
;173:			// do everything like the server does
;174:
;175:			SnapVector( muzzlePoint );
ADDRLP4 0
ADDRLP4 0
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 177
;176:
;177:			VectorScale( forward, 4096, endPoint );
ADDRLP4 108
CNSTF4 1166016512
ASGNF4
ADDRLP4 80
ADDRLP4 108
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 108
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 80+8
CNSTF4 1166016512
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 178
;178:			SnapVector( endPoint );
ADDRLP4 80
ADDRLP4 80
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 80+4
ADDRLP4 80+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 180
;179:
;180:			VectorSubtract( endPoint, muzzlePoint, v );
ADDRLP4 68
ADDRLP4 80
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 80+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 80+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 181
;181:			VectorNormalize( v );
ADDRLP4 68
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 182
;182:			VectorScale( v, 32, v );
ADDRLP4 112
CNSTF4 1107296256
ASGNF4
ADDRLP4 68
ADDRLP4 112
INDIRF4
ADDRLP4 68
INDIRF4
MULF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 112
INDIRF4
ADDRLP4 68+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 68+8
CNSTF4 1107296256
ADDRLP4 68+8
INDIRF4
MULF4
ASGNF4
line 183
;183:			VectorAdd( muzzlePoint, v, v );
ADDRLP4 68
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 68+8
INDIRF4
ADDF4
ASGNF4
line 185
;184:
;185:			contents = trap_CM_PointContents( muzzlePoint, 0 );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 116
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 92
ADDRLP4 116
INDIRI4
ASGNI4
line 186
;186:			if ( !( contents & CONTENTS_WATER ) ) {
ADDRLP4 92
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $215
line 187
;187:				VectorSet( up, 0, 0, 8 );
ADDRLP4 120
CNSTF4 0
ASGNF4
ADDRLP4 96
ADDRLP4 120
INDIRF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 120
INDIRF4
ASGNF4
ADDRLP4 96+8
CNSTF4 1090519040
ASGNF4
line 188
;188:				CG_SmokePuff( v, up, 32, 1, 1, 1, 0.33f, 900, cg.time, 0, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
ADDRLP4 68
ARGP4
ADDRLP4 96
ARGP4
CNSTF4 1107296256
ARGF4
ADDRLP4 124
CNSTF4 1065353216
ASGNF4
ADDRLP4 124
INDIRF4
ARGF4
ADDRLP4 124
INDIRF4
ARGF4
ADDRLP4 124
INDIRF4
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1147207680
ARGF4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+956380+1280
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 189
;189:			}
LABELV $215
line 192
;190:
;191:			// do the shotgun pellets
;192:			CG_ShotgunPattern( muzzlePoint, endPoint, cg.oldTime % 256, cg.predictedPlayerState.clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 cg+1868896
INDIRI4
CNSTI4 256
MODI4
ARGI4
ADDRGP4 cg+1868928+140
INDIRI4
ARGI4
ADDRGP4 CG_ShotgunPattern
CALLV
pop
line 194
;193:			//Com_Printf( "Predicted shotgun pattern\n" );
;194:		}
line 195
;195:	}
ADDRGP4 $181
JUMPV
LABELV $180
line 197
;196:	// was it a machinegun attack?
;197:	else if ( weaphack == WP_MACHINEGUN ) {
ADDRLP4 24
INDIRI4
CNSTI4 2
NEI4 $225
line 199
;198:		// do we have it on for the machinegun?
;199:		if ( cg_delag.integer & 1 || cg_delag.integer & 2 ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
NEI4 $231
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $226
LABELV $231
line 201
;200:			// the server will use this exact time (it'll be serverTime on that end)
;201:			int seed = cg.oldTime % 256;
ADDRLP4 68
ADDRGP4 cg+1868896
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 205
;202:			float r, u;
;203:			trace_t tr;
;204:			qboolean flesh;
;205:			int fleshEntityNum = 0;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 210
;206:			vec3_t endPoint;
;207:
;208:			// do everything exactly like the server does
;209:
;210:			r = Q_random(&seed) * M_PI * 2.0f;
ADDRLP4 68
ARGP4
ADDRLP4 156
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 88
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 156
INDIRF4
MULF4
MULF4
ASGNF4
line 211
;211:			u = sin(r) * Q_crandom(&seed) * mod_mgspread * 16;
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 160
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 68
ARGP4
ADDRLP4 164
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 148
CNSTF4 1098907648
ADDRLP4 160
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
ADDRGP4 mod_mgspread
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 212
;212:			r = cos(r) * Q_crandom(&seed) * mod_mgspread * 16;
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 168
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 68
ARGP4
ADDRLP4 172
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 88
CNSTF4 1098907648
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ADDRGP4 mod_mgspread
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 214
;213:
;214:			VectorMA( muzzlePoint, 8192*16, forward, endPoint );
ADDRLP4 176
CNSTF4 1207959552
ASGNF4
ADDRLP4 76
ADDRLP4 0
INDIRF4
ADDRLP4 176
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 176
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1207959552
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 215
;215:			VectorMA( endPoint, r, right, endPoint );
ADDRLP4 180
ADDRLP4 88
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 76
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 76+4
INDIRF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRLP4 76+8
INDIRF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
line 216
;216:			VectorMA( endPoint, u, up, endPoint );
ADDRLP4 184
ADDRLP4 148
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 76
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 76+4
INDIRF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRLP4 76+8
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ADDF4
ASGNF4
line 218
;217:
;218:			CG_Trace(&tr, muzzlePoint, NULL, NULL, endPoint, cg.predictedPlayerState.clientNum, MASK_SHOT );
ADDRLP4 92
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 188
CNSTP4 0
ASGNP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 cg+1868928+140
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 220
;219:
;220:			if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 92+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $253
line 221
;221:				return;
ADDRGP4 $81
JUMPV
LABELV $253
line 225
;222:			}
;223:
;224:			// snap the endpos to integers, but nudged towards the line
;225:			SnapVectorTowards( tr.endpos, muzzlePoint );
ADDRLP4 92+12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 228
;226:
;227:			// do bullet impact
;228:			if ( tr.entityNum < MAX_CLIENTS ) {
ADDRLP4 92+52
INDIRI4
CNSTI4 256
GEI4 $257
line 229
;229:				flesh = qtrue;
ADDRLP4 152
CNSTI4 1
ASGNI4
line 230
;230:				fleshEntityNum = tr.entityNum;
ADDRLP4 72
ADDRLP4 92+52
INDIRI4
ASGNI4
line 231
;231:			} else {
ADDRGP4 $258
JUMPV
LABELV $257
line 232
;232:				flesh = qfalse;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 233
;233:			}
LABELV $258
line 236
;234:
;235:			// do the bullet impact
;236:			CG_Bullet( tr.endpos, cg.predictedPlayerState.clientNum, tr.plane.normal, flesh, fleshEntityNum );
ADDRLP4 92+12
ARGP4
ADDRGP4 cg+1868928+140
INDIRI4
ARGI4
ADDRLP4 92+24
ARGP4
ADDRLP4 152
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 238
;237:			//Com_Printf( "Predicted bullet\n" );
;238:		}
line 239
;239:	}
ADDRGP4 $226
JUMPV
LABELV $225
line 241
;240:        // was it a chaingun attack?
;241:	else if ( weaphack == WP_CHAINGUN ) {
ADDRLP4 24
INDIRI4
CNSTI4 13
NEI4 $265
line 243
;242:		// do we have it on for the machinegun?
;243:		if ( cg_delag.integer & 1 || cg_delag.integer & 2 ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
NEI4 $271
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $267
LABELV $271
line 245
;244:			// the server will use this exact time (it'll be serverTime on that end)
;245:			int seed = cg.oldTime % 256;
ADDRLP4 68
ADDRGP4 cg+1868896
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 249
;246:			float r, u;
;247:			trace_t tr;
;248:			qboolean flesh;
;249:			int fleshEntityNum = 0;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 254
;250:			vec3_t endPoint;
;251:
;252:			// do everything exactly like the server does
;253:
;254:			r = Q_random(&seed) * M_PI * 2.0f;
ADDRLP4 68
ARGP4
ADDRLP4 156
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 88
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 156
INDIRF4
MULF4
MULF4
ASGNF4
line 255
;255:			u = sin(r) * Q_crandom(&seed) * mod_cgspread * 16;
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 160
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 68
ARGP4
ADDRLP4 164
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 148
CNSTF4 1098907648
ADDRLP4 160
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
ADDRGP4 mod_cgspread
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 256
;256:			r = cos(r) * Q_crandom(&seed) * mod_cgspread * 16;
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 168
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 68
ARGP4
ADDRLP4 172
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 88
CNSTF4 1098907648
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
ADDRGP4 mod_cgspread
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 258
;257:
;258:			VectorMA( muzzlePoint, 8192*16, forward, endPoint );
ADDRLP4 176
CNSTF4 1207959552
ASGNF4
ADDRLP4 76
ADDRLP4 0
INDIRF4
ADDRLP4 176
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 176
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1207959552
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 259
;259:			VectorMA( endPoint, r, right, endPoint );
ADDRLP4 180
ADDRLP4 88
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 76
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 76+4
INDIRF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRLP4 76+8
INDIRF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
line 260
;260:			VectorMA( endPoint, u, up, endPoint );
ADDRLP4 184
ADDRLP4 148
INDIRF4
ASGNF4
ADDRLP4 76
ADDRLP4 76
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 76+4
INDIRF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRLP4 76+8
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ADDF4
ASGNF4
line 262
;261:
;262:			CG_Trace(&tr, muzzlePoint, NULL, NULL, endPoint, cg.predictedPlayerState.clientNum, MASK_SHOT );
ADDRLP4 92
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 188
CNSTP4 0
ASGNP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 cg+1868928+140
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 264
;263:
;264:			if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 92+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $293
line 265
;265:				return;
ADDRGP4 $81
JUMPV
LABELV $293
line 269
;266:			}
;267:
;268:			// snap the endpos to integers, but nudged towards the line
;269:			SnapVectorTowards( tr.endpos, muzzlePoint );
ADDRLP4 92+12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 272
;270:
;271:			// do bullet impact
;272:			if ( tr.entityNum < MAX_CLIENTS ) {
ADDRLP4 92+52
INDIRI4
CNSTI4 256
GEI4 $297
line 273
;273:				flesh = qtrue;
ADDRLP4 152
CNSTI4 1
ASGNI4
line 274
;274:				fleshEntityNum = tr.entityNum;
ADDRLP4 72
ADDRLP4 92+52
INDIRI4
ASGNI4
line 275
;275:			} else {
ADDRGP4 $298
JUMPV
LABELV $297
line 276
;276:				flesh = qfalse;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 277
;277:			}
LABELV $298
line 280
;278:
;279:			// do the bullet impact
;280:			CG_Bullet( tr.endpos, cg.predictedPlayerState.clientNum, tr.plane.normal, flesh, fleshEntityNum );
ADDRLP4 92+12
ARGP4
ADDRGP4 cg+1868928+140
INDIRI4
ARGI4
ADDRLP4 92+24
ARGP4
ADDRLP4 152
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 282
;281:			//Com_Printf( "Predicted bullet\n" );
;282:		}
LABELV $267
line 283
;283:	}
LABELV $265
LABELV $226
LABELV $181
LABELV $106
line 284
;284:}
LABELV $81
endproc CG_PredictWeaponEffects 192 48
export CG_Cvar_ClampInt
proc CG_Cvar_ClampInt 0 16
line 457
;285:
;286:/*
;287:=================
;288:CG_AddBoundingBox
;289:
;290:Draws a bounding box around a player.  Called from CG_Player.
;291:=================
;292:*/
;293:/*void CG_AddBoundingBox( centity_t *cent ) {
;294:	polyVert_t verts[4];
;295:	clientInfo_t *ci;
;296:	int i;
;297:	vec3_t mins = {-15, -15, -24};
;298:	vec3_t maxs = {15, 15, 32};
;299:	float extx, exty, extz;
;300:	vec3_t corners[8];
;301:	qhandle_t bboxShader, bboxShader_nocull;
;302:
;303:	if ( !cg_drawBBox.integer ) {
;304:		return;
;305:	}
;306:
;307:	// don't draw it if it's us in first-person
;308:	if ( cent->currentState.number == cg.predictedPlayerState.clientNum &&
;309:			!cg.renderingThirdPerson ) {
;310:		return;
;311:	}
;312:
;313:	// don't draw it for dead players
;314:	if ( cent->currentState.eFlags & EF_DEAD ) {
;315:		return;
;316:	}
;317:
;318:	// get the shader handles
;319:	bboxShader = trap_R_RegisterShader( "bbox" );
;320:	bboxShader_nocull = trap_R_RegisterShader( "bbox_nocull" );
;321:
;322:	// if they don't exist, forget it
;323:	if ( !bboxShader || !bboxShader_nocull ) {
;324:		return;
;325:	}
;326:
;327:	// get the player's client info
;328:	ci = &cgs.clientinfo[cent->currentState.clientNum];
;329:
;330:	// if it's us
;331:	if ( cent->currentState.number == cg.predictedPlayerState.clientNum ) {
;332:		// use the view height
;333:		maxs[2] = cg.predictedPlayerState.viewheight + 6;
;334:	}
;335:	else {
;336:		int x, zd, zu;
;337:
;338:		// otherwise grab the encoded bounding box
;339:		x = (cent->currentState.solid & 255);
;340:		zd = ((cent->currentState.solid>>8) & 255);
;341:		zu = ((cent->currentState.solid>>16) & 255) - 32;
;342:
;343:		mins[0] = mins[1] = -x;
;344:		maxs[0] = maxs[1] = x;
;345:		mins[2] = -zd;
;346:		maxs[2] = zu;
;347:	}
;348:
;349:	// get the extents (size)
;350:	extx = maxs[0] - mins[0];
;351:	exty = maxs[1] - mins[1];
;352:	extz = maxs[2] - mins[2];
;353:
;354:	
;355:	// set the polygon's texture coordinates
;356:	verts[0].st[0] = 0;
;357:	verts[0].st[1] = 0;
;358:	verts[1].st[0] = 0;
;359:	verts[1].st[1] = 1;
;360:	verts[2].st[0] = 1;
;361:	verts[2].st[1] = 1;
;362:	verts[3].st[0] = 1;
;363:	verts[3].st[1] = 0;
;364:
;365:	// set the polygon's vertex colors
;366:	if ( ci->team == TEAM_RED ) {
;367:		for ( i = 0; i < 4; i++ ) {
;368:			verts[i].modulate[0] = 160;
;369:			verts[i].modulate[1] = 0;
;370:			verts[i].modulate[2] = 0;
;371:			verts[i].modulate[3] = 255;
;372:		}
;373:	}
;374:	else if ( ci->team == TEAM_BLUE ) {
;375:		for ( i = 0; i < 4; i++ ) {
;376:			verts[i].modulate[0] = 0;
;377:			verts[i].modulate[1] = 0;
;378:			verts[i].modulate[2] = 192;
;379:			verts[i].modulate[3] = 255;
;380:		}
;381:	}
;382:	else {
;383:		for ( i = 0; i < 4; i++ ) {
;384:			verts[i].modulate[0] = 0;
;385:			verts[i].modulate[1] = 128;
;386:			verts[i].modulate[2] = 0;
;387:			verts[i].modulate[3] = 255;
;388:		}
;389:	}
;390:
;391:	VectorAdd( cent->lerpOrigin, maxs, corners[3] );
;392:
;393:	VectorCopy( corners[3], corners[2] );
;394:	corners[2][0] -= extx;
;395:
;396:	VectorCopy( corners[2], corners[1] );
;397:	corners[1][1] -= exty;
;398:
;399:	VectorCopy( corners[1], corners[0] );
;400:	corners[0][0] += extx;
;401:
;402:	for ( i = 0; i < 4; i++ ) {
;403:		VectorCopy( corners[i], corners[i + 4] );
;404:		corners[i + 4][2] -= extz;
;405:	}
;406:
;407:	// top
;408:	VectorCopy( corners[0], verts[0].xyz );
;409:	VectorCopy( corners[1], verts[1].xyz );
;410:	VectorCopy( corners[2], verts[2].xyz );
;411:	VectorCopy( corners[3], verts[3].xyz );
;412:	trap_R_AddPolyToScene( bboxShader, 4, verts );
;413:
;414:	// bottom
;415:	VectorCopy( corners[7], verts[0].xyz );
;416:	VectorCopy( corners[6], verts[1].xyz );
;417:	VectorCopy( corners[5], verts[2].xyz );
;418:	VectorCopy( corners[4], verts[3].xyz );
;419:	trap_R_AddPolyToScene( bboxShader, 4, verts );
;420:
;421:	// top side
;422:	VectorCopy( corners[3], verts[0].xyz );
;423:	VectorCopy( corners[2], verts[1].xyz );
;424:	VectorCopy( corners[6], verts[2].xyz );
;425:	VectorCopy( corners[7], verts[3].xyz );
;426:	trap_R_AddPolyToScene( bboxShader_nocull, 4, verts );
;427:
;428:	// left side
;429:	VectorCopy( corners[2], verts[0].xyz );
;430:	VectorCopy( corners[1], verts[1].xyz );
;431:	VectorCopy( corners[5], verts[2].xyz );
;432:	VectorCopy( corners[6], verts[3].xyz );
;433:	trap_R_AddPolyToScene( bboxShader_nocull, 4, verts );
;434:
;435:	// right side
;436:	VectorCopy( corners[0], verts[0].xyz );
;437:	VectorCopy( corners[3], verts[1].xyz );
;438:	VectorCopy( corners[7], verts[2].xyz );
;439:	VectorCopy( corners[4], verts[3].xyz );
;440:	trap_R_AddPolyToScene( bboxShader_nocull, 4, verts );
;441:
;442:	// bottom side
;443:	VectorCopy( corners[1], verts[0].xyz );
;444:	VectorCopy( corners[0], verts[1].xyz );
;445:	VectorCopy( corners[4], verts[2].xyz );
;446:	VectorCopy( corners[5], verts[3].xyz );
;447:	trap_R_AddPolyToScene( bboxShader_nocull, 4, verts );
;448:}*/
;449:
;450:/*
;451:================
;452:CG_Cvar_ClampInt
;453:
;454:Clamps a cvar between two integer values, returns qtrue if it had to.
;455:================
;456:*/
;457:qboolean CG_Cvar_ClampInt( const char *name, vmCvar_t *vmCvar, int min, int max ) {
line 458
;458:	if ( vmCvar->integer > max ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRFP4 12
INDIRI4
LEI4 $306
line 459
;459:		CG_Printf( "Allowed values are %d to %d.\n", min, max );
ADDRGP4 $308
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 461
;460:
;461:		Com_sprintf( vmCvar->string, MAX_CVAR_VALUE_STRING, "%d", max );
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $309
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 462
;462:		vmCvar->value = max;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 12
INDIRI4
CVIF4 4
ASGNF4
line 463
;463:		vmCvar->integer = max;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 465
;464:
;465:		trap_Cvar_Set( name, vmCvar->string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 466
;466:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $306
line 469
;467:	}
;468:
;469:	if ( vmCvar->integer < min ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
GEI4 $310
line 470
;470:		CG_Printf( "Allowed values are %d to %d.\n", min, max );
ADDRGP4 $308
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 472
;471:
;472:		Com_sprintf( vmCvar->string, MAX_CVAR_VALUE_STRING, "%d", min );
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $309
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 473
;473:		vmCvar->value = min;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
line 474
;474:		vmCvar->integer = min;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 476
;475:
;476:		trap_Cvar_Set( name, vmCvar->string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 477
;477:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $305
JUMPV
LABELV $310
line 480
;478:	}
;479:
;480:	return qfalse;
CNSTI4 0
RETI4
LABELV $305
endproc CG_Cvar_ClampInt 0 16
import CG_ShotgunPattern
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
LABELV $309
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $308
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 10
byte 1 0
