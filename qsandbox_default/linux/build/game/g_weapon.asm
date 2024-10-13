export G_BounceProjectile
code
proc G_BounceProjectile 64 4
file "../../../code/game/g_weapon.c"
line 39
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
;23:// g_weapon.c
;24:// perform the server side effects of a weapon firing
;25:
;26:#include "g_local.h"
;27:
;28:static	float	s_quadFactor;
;29:static	vec3_t	forward, right, up;
;30:static	vec3_t	muzzle;
;31:
;32:#define NUM_NAILSHOTS g_ngcount.integer
;33:
;34:/*
;35:================
;36:G_BounceProjectile
;37:================
;38:*/
;39:void G_BounceProjectile( vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout ) {
line 43
;40:	vec3_t v, newv;
;41:	float dot;
;42:
;43:	VectorSubtract( impact, start, v );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 44
;44:	dot = DotProduct( v, dir );
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 45
;45:	VectorMA( v, -2*dot, dir, newv );
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
CNSTF4 3221225472
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 24
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 47
;46:
;47:	VectorNormalize(newv);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 48
;48:	VectorMA(impact, 8192, newv, endout);
ADDRFP4 12
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
CNSTF4 1174405120
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
CNSTF4 1174405120
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
CNSTF4 1174405120
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 49
;49:}
LABELV $64
endproc G_BounceProjectile 64 4
export Laser_Gen
proc Laser_Gen 12 0
line 59
;50:
;51:
;52:/*
;53:============
;54:Laser Sight Stuff
;55:
;56:Flash Light Functions
;57:============
;58:*/
;59:void Laser_Gen( gentity_t *ent )	{
line 64
;60:
;61:	gentity_t	*las;
;62:	int oldtype;
;63:
;64:	las = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 66
;65:
;66:	las->nextthink = level.time + 10;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 67
;67:	las->think = Laser_Think;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 Laser_Think
ASGNP4
line 68
;68:	las->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 69
;69:	las->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 70
;70:	las->s.eType = ET_LASER;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 72
;71:
;72:		las->s.eventParm = 2; //tells CG that it is a flashlight
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 2
ASGNI4
line 73
;73:		las->classname = "flashlight";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $77
ASGNP4
line 75
;74:
;75:	ent->client->lasersight = las;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1348
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 76
;76:}
LABELV $75
endproc Laser_Gen 12 0
export Laser_Think
proc Laser_Think 128 28
line 78
;77:
;78:void Laser_Think( gentity_t *self )	{
line 83
;79:	vec3_t		end, start, forward, up, add;
;80:	trace_t		tr;
;81:
;82:	//If Player Dies, You Die -> now thanks to Camouflage!
;83:	if (self->parent->client->ps.pm_type == PM_DEAD)  {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $79
line 84
;84:		G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 85
;85:		return;
ADDRGP4 $78
JUMPV
LABELV $79
line 88
;86:	}
;87:	
;88:	if (self->parent->client->ps.pm_type == PM_DEAD)  {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $81
line 89
;89:		G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 90
;90:		return;
ADDRGP4 $78
JUMPV
LABELV $81
line 94
;91:	}
;92:
;93:	//Set Aiming Directions
;94:	if(!self->parent->client->vehiclenum){
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $83
line 95
;95:	AngleVectors(self->parent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 right
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 96
;96:	CalcMuzzlePoint(self->parent, forward, right, up, start);
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 right
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 97
;97:	VectorMA (start, 999, forward, end);
ADDRLP4 116
CNSTF4 1148829696
ASGNF4
ADDRLP4 80
ADDRLP4 68
INDIRF4
ADDRLP4 116
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 68+4
INDIRF4
ADDRLP4 116
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80+8
ADDRLP4 68+8
INDIRF4
CNSTF4 1148829696
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 98
;98:	} else {
ADDRGP4 $84
JUMPV
LABELV $83
line 99
;99:	add[0] = 0;
ADDRLP4 104
CNSTF4 0
ASGNF4
line 100
;100:	add[1] = self->parent->s.apos.trBase[1];
ADDRLP4 104+4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ASGNF4
line 101
;101:	add[2] = 0;
ADDRLP4 104+8
CNSTF4 0
ASGNF4
line 102
;102:	AngleVectors(add, forward, right, up);
ADDRLP4 104
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 right
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 103
;103:	CalcMuzzlePoint(self->parent, forward, right, up, start);
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 right
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 104
;104:	VectorMA (start, 320, forward, end);	
ADDRLP4 116
CNSTF4 1134559232
ASGNF4
ADDRLP4 80
ADDRLP4 68
INDIRF4
ADDRLP4 116
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 68+4
INDIRF4
ADDRLP4 116
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80+8
ADDRLP4 68+8
INDIRF4
CNSTF4 1134559232
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 105
;105:	}
LABELV $84
line 106
;106:	VectorScale( forward, 20, forward );
ADDRLP4 116
CNSTF4 1101004800
ASGNF4
ADDRLP4 0
ADDRLP4 116
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 116
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1101004800
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 109
;107:
;108:	//Trace Position
;109:	trap_Trace (&tr, start, NULL, NULL, end, self->parent->s.number, MASK_SHOT );
ADDRLP4 12
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 120
CNSTP4 0
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 112
;110:
;111:	//Did you not hit anything?
;112:	if (tr.surfaceFlags & SURF_NOIMPACT || tr.surfaceFlags & SURF_SKY)	{
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRLP4 12+44
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 124
INDIRI4
NEI4 $107
ADDRLP4 12+44
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 124
INDIRI4
EQI4 $103
LABELV $107
line 113
;113:		self->nextthink = level.time + 5;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 114
;114:		trap_UnlinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 115
;115:		return;
ADDRGP4 $78
JUMPV
LABELV $103
line 119
;116:	}
;117:
;118:	//Move you forward to keep you visible
;119:	if (tr.fraction != 1)	VectorMA(tr.endpos,-4,forward,tr.endpos);
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $109
ADDRLP4 12+12
ADDRLP4 12+12
INDIRF4
CNSTF4 3229614080
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+12+4
ADDRLP4 12+12+4
INDIRF4
CNSTF4 3229614080
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+12+8
ADDRLP4 12+12+8
INDIRF4
CNSTF4 3229614080
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $109
line 122
;120:
;121:	//Set Your position
;122:	VectorCopy( tr.endpos, self->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 12+12
INDIRB
ASGNB 12
line 123
;123:	VectorCopy( tr.endpos, self->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12+12
INDIRB
ASGNB 12
line 125
;124:
;125:	vectoangles(tr.plane.normal, self->s.angles);
ADDRLP4 12+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 127
;126:
;127:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 130
;128:
;129:	//Prep next move
;130:	self->nextthink = level.time + 5;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 131
;131:}
LABELV $78
endproc Laser_Think 128 28
export Weapon_Gauntlet
proc Weapon_Gauntlet 0 0
line 142
;132:
;133:
;134:/*
;135:======================================================================
;136:
;137:GAUNTLET
;138:
;139:======================================================================
;140:*/
;141:
;142:void Weapon_Gauntlet( gentity_t *ent ) {
line 144
;143:
;144:}
LABELV $128
endproc Weapon_Gauntlet 0 0
export CheckGauntletAttack
proc CheckGauntletAttack 140 32
line 151
;145:
;146:/*
;147:===============
;148:CheckGauntletAttack
;149:===============
;150:*/
;151:qboolean CheckGauntletAttack( gentity_t *ent ) {
line 159
;152:	trace_t		tr;
;153:	vec3_t		end;
;154:	gentity_t	*tent;
;155:	gentity_t	*traceEnt;
;156:	int			damage;
;157:
;158:	// set aiming directions
;159:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 161
;160:
;161:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 162
;162:	VectorMA (muzzle, g_grange.integer, forward, end);
ADDRLP4 60
ADDRGP4 muzzle
INDIRF4
ADDRGP4 forward
INDIRF4
ADDRGP4 g_grange+12
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
ADDRGP4 g_grange+12
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
ADDRGP4 g_grange+12
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 163
;163:	trap_Trace (&tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 80
CNSTP4 0
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 165
;164:
;165:	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $139
line 166
;166:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $139
line 169
;167:	}
;168:
;169:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 2492
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 172
;170:
;171:	// send blood impact
;172:	if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $143
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $143
line 173
;173:		tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 0+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 88
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 88
INDIRP4
ASGNP4
line 174
;174:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 175
;175:		tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 92
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 176
;176:		tent->s.generic3 = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 224
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 177
;177:	}
LABELV $143
line 179
;178:	
;179:	if(!ent->client->vehiclenum){
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $147
line 180
;180:		if ( !traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
NEI4 $149
line 181
;181:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $129
JUMPV
LABELV $149
line 183
;182:		}
;183:	}
LABELV $147
line 185
;184:
;185:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $151
line 186
;186:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 187
;187:	} else {
ADDRGP4 $152
JUMPV
LABELV $151
line 188
;188:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 189
;189:	}
LABELV $152
line 190
;190:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
CNSTU4 0
ASGNU4
ADDRLP4 88
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $154
ADDRLP4 96
ADDRLP4 88
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $154
ADDRLP4 96
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 12
NEI4 $154
line 191
;191:	s_quadFactor *= g_doublerdamagefactor.value;
ADDRLP4 100
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
ADDRGP4 g_doublerdamagefactor+8
INDIRF4
MULF4
ASGNF4
line 192
;192:	}
LABELV $154
line 193
;193:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_AMMOREGEN ) {
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRP4
ASGNP4
ADDRLP4 104
CNSTU4 0
ASGNU4
ADDRLP4 100
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRU4
EQU4 $157
ADDRLP4 108
ADDRLP4 100
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRU4
EQU4 $157
ADDRLP4 108
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 13
NEI4 $157
line 194
;194:	s_quadFactor *= g_ammoregendamagefactor.value;
ADDRLP4 112
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
ADDRGP4 g_ammoregendamagefactor+8
INDIRF4
MULF4
ASGNF4
line 195
;195:	}
LABELV $157
line 196
;196:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_GUARD ) {
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRP4
ASGNP4
ADDRLP4 116
CNSTU4 0
ASGNU4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $160
ADDRLP4 120
ADDRLP4 112
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $160
ADDRLP4 120
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 11
NEI4 $160
line 197
;197:	s_quadFactor *= g_guarddamagefactor.value;
ADDRLP4 124
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRGP4 g_guarddamagefactor+8
INDIRF4
MULF4
ASGNF4
line 198
;198:	}
LABELV $160
line 199
;199:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_SCOUT ) {
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRP4
ASGNP4
ADDRLP4 128
CNSTU4 0
ASGNU4
ADDRLP4 124
INDIRP4
CVPU4 4
ADDRLP4 128
INDIRU4
EQU4 $163
ADDRLP4 132
ADDRLP4 124
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
ADDRLP4 128
INDIRU4
EQU4 $163
ADDRLP4 132
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 10
NEI4 $163
line 200
;200:	s_quadFactor *= g_scoutdamagefactor.value;
ADDRLP4 136
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRGP4 g_scoutdamagefactor+8
INDIRF4
MULF4
ASGNF4
line 201
;201:	}
LABELV $163
line 202
;202:	if( ent->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
NEI4 $166
line 203
;203:	s_quadFactor *= mod_teamblue_damage;
ADDRLP4 136
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRGP4 mod_teamblue_damage
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 204
;204:	}
LABELV $166
line 205
;205:	if( ent->client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $168
line 206
;206:	s_quadFactor *= mod_teamred_damage;
ADDRLP4 136
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRGP4 mod_teamred_damage
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 207
;207:	}
LABELV $168
line 208
;208:	if(ent->botskill == 8){
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 8
NEI4 $170
line 209
;209:	s_quadFactor *= 100;
ADDRLP4 136
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 136
INDIRP4
CNSTF4 1120403456
ADDRLP4 136
INDIRP4
INDIRF4
MULF4
ASGNF4
line 210
;210:	}
LABELV $170
line 211
;211:	if(ent->botskill == 9){
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 9
NEI4 $172
line 212
;212:	s_quadFactor *= 5;
ADDRLP4 136
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 136
INDIRP4
CNSTF4 1084227584
ADDRLP4 136
INDIRP4
INDIRF4
MULF4
ASGNF4
line 213
;213:	}
LABELV $172
line 215
;214:
;215:	if(g_instantgib.integer)
ADDRGP4 g_instantgib+12
INDIRI4
CNSTI4 0
EQI4 $174
line 216
;216:		damage = 500; //High damage in instant gib (normally enough to gib)
ADDRLP4 76
CNSTI4 500
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $174
line 218
;217:	else
;218:		damage = g_gdamage.integer * s_quadFactor;
ADDRLP4 76
ADDRGP4 g_gdamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
LABELV $175
line 219
;219:	G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 222
;220:		damage, 0, MOD_GAUNTLET );
;221:
;222:	return qtrue;
CNSTI4 1
RETI4
LABELV $129
endproc CheckGauntletAttack 140 32
export SnapVectorTowards
proc SnapVectorTowards 12 0
line 273
;223:}
;224:
;225:
;226:/*
;227:======================================================================
;228:
;229:MACHINEGUN
;230:
;231:======================================================================
;232:*/
;233:
;234:/*
;235:======================
;236:SnapVectorTowards
;237:
;238:Round a vector to integers for more efficient network
;239:transmission, but make sure that it rounds towards a given point
;240:rather than blindly truncating.  This prevents it from truncating
;241:into a wall.
;242:======================
;243:*/
;244://unlagged - attack prediction #3
;245:// moved to q_shared.c
;246:/*
;247:void SnapVectorTowards( vec3_t v, vec3_t to ) {
;248:	int		i;
;249:
;250:	for ( i = 0 ; i < 3 ; i++ ) {
;251:		if ( to[i] <= v[i] ) {
;252:			v[i] = floor(v[i]);
;253:		} else {
;254:			v[i] = ceil(v[i]);
;255:		}
;256:	}
;257:}
;258:*/
;259://unlagged - attack prediction #3
;260:
;261://unlagged - attack prediction #3
;262:// moved from g_weapon.c
;263:/*
;264:======================
;265:SnapVectorTowards
;266:
;267:Round a vector to integers for more efficient network
;268:transmission, but make sure that it rounds towards a given point
;269:rather than blindly truncating.  This prevents it from truncating
;270:into a wall.
;271:======================
;272:*/
;273:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 276
;274:	int		i;
;275:
;276:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $180
line 277
;277:		if ( to[i] <= v[i] ) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $184
line 278
;278:			v[i] = (int)v[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 279
;279:		} else {
ADDRGP4 $185
JUMPV
LABELV $184
line 280
;280:			v[i] = (int)v[i] + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
line 281
;281:		}
LABELV $185
line 282
;282:	}
LABELV $181
line 276
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $180
line 283
;283:}
LABELV $179
endproc SnapVectorTowards 12 0
export Bullet_Fire
proc Bullet_Fire 176 32
line 292
;284://unlagged - attack prediction #3
;285:
;286:#define CHAINGUN_SPREAD		600.0
;287:#define	CHAINGUN_DAMAGE		g_cgdamage.integer
;288:#define MACHINEGUN_SPREAD	200
;289:#define	MACHINEGUN_DAMAGE	g_mgdamage.integer
;290:#define	MACHINEGUN_TEAM_DAMAGE	g_mgdamage.integer		// wimpier MG in teamplay
;291:
;292:void Bullet_Fire (gentity_t *ent, float spread, int damage ) {
line 304
;293:	trace_t		tr;
;294:	vec3_t		end;
;295:	vec3_t		impactpoint, bouncedir;
;296:	float		r;
;297:	float		u;
;298:	gentity_t	*tent;
;299:	gentity_t	*traceEnt;
;300:	int			i, passent;
;301:
;302://unlagged - attack prediction #2
;303:	// we have to use something now that the client knows in advance
;304:	int			seed = ent->client->attackTime % 256;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1456
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 307
;305://unlagged - attack prediction #2
;306:
;307:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 316
;308:
;309://unlagged - attack prediction #2
;310:	// this has to match what's on the client
;311:/*
;312:	r = random() * M_PI * 2.0f;
;313:	u = sin(r) * crandom() * spread * 16;
;314:	r = cos(r) * crandom() * spread * 16;
;315:*/
;316:	r = Q_random(&seed) * M_PI * 2.0f;
ADDRLP4 104
ARGP4
ADDRLP4 120
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 84
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 120
INDIRF4
MULF4
MULF4
ASGNF4
line 317
;317:	u = sin(r) * Q_crandom(&seed) * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 104
ARGP4
ADDRLP4 128
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 100
CNSTF4 1098907648
ADDRLP4 124
INDIRF4
ADDRLP4 128
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 318
;318:	r = cos(r) * Q_crandom(&seed) * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 104
ARGP4
ADDRLP4 136
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 84
CNSTF4 1098907648
ADDRLP4 132
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 321
;319://unlagged - attack prediction #2
;320:
;321:	VectorMA (muzzle, 8192*16, forward, end);
ADDRLP4 140
CNSTF4 1207959552
ASGNF4
ADDRLP4 64
ADDRGP4 muzzle
INDIRF4
ADDRLP4 140
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 140
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1207959552
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 322
;322:	VectorMA (end, r, right, end);
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 right
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 right+4
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 right+8
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
line 323
;323:	VectorMA (end, u, up, end);
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 up
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 up+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 up+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ADDF4
ASGNF4
line 325
;324:
;325:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 326
;326:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $205
line 330
;327:
;328://unlagged - backward reconciliation #2
;329:		// backward-reconcile the other clients
;330:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 333
;331://unlagged - backward reconciliation #2
;332:
;333:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 152
CNSTP4 0
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 337
;334:
;335://unlagged - backward reconciliation #2
;336:		// put them back
;337:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 340
;338://unlagged - backward reconciliation #2
;339:
;340:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $209
line 341
;341:			return;
ADDRGP4 $186
JUMPV
LABELV $209
line 344
;342:		}
;343:
;344:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 2492
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 346
;345:
;346:    if(g_mgexplode.integer) {
ADDRGP4 g_mgexplode+12
INDIRI4
CNSTI4 0
EQI4 $213
line 347
;347:       tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 0+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 156
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 156
INDIRP4
ASGNP4
line 348
;348:	   tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 349
;349:	   tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 160
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 160
INDIRI4
ASGNI4
line 350
;350:	   tent->s.generic3 = WP_ROCKET_LAUNCHER;
ADDRLP4 60
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 5
ASGNI4
line 351
;351:	   G_RadiusDamage(tr.endpos, ent, g_mgsdamage.value/*70*/ * s_quadFactor, g_mgsradius.value/*50*/ * s_quadFactor, traceEnt, MOD_MACHINEGUN);
ADDRLP4 0+12
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 s_quadFactor
INDIRF4
ASGNF4
ADDRGP4 g_mgsdamage+8
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
ARGF4
ADDRGP4 g_mgsradius+8
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
ARGF4
ADDRLP4 56
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 352
;352:	}
LABELV $213
line 355
;353:
;354:		// snap the endpos to integers, but nudged towards the line
;355:		SnapVectorTowards( tr.endpos, muzzle );
ADDRLP4 0+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 358
;356:
;357:		// send bullet impact
;358:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $222
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $222
line 359
;359:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
ADDRLP4 0+12
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 160
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 160
INDIRP4
ASGNP4
line 360
;360:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 364
;361://unlagged - attack prediction #2
;362:			// we need the client number to determine whether or not to
;363:			// suppress this event
;364:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 164
CNSTI4 180
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 366
;365://unlagged - attack prediction #2
;366:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $223
line 367
;367:				ent->client->accuracy_hits++;
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1300
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
line 368
;368:			}
line 369
;369:		} else {
ADDRGP4 $223
JUMPV
LABELV $222
line 370
;370:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
ADDRLP4 0+12
ARGP4
CNSTI4 49
ARGI4
ADDRLP4 160
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 160
INDIRP4
ASGNP4
line 371
;371:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 164
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 164
INDIRI4
ASGNI4
line 375
;372://unlagged - attack prediction #2
;373:			// we need the client number to determine whether or not to
;374:			// suppress this event
;375:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 168
CNSTI4 180
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 377
;376://unlagged - attack prediction #2
;377:		}
LABELV $223
line 378
;378:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 380
;379:
;380:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $207
line 381
;381:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
ADDRLP4 160
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $231
ADDRLP4 160
INDIRP4
CNSTI4 1432
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $231
line 382
;382:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 164
ADDRGP4 G_InvulnerabilityEffect
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
EQI4 $234
line 383
;383:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
ADDRGP4 muzzle
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_BounceProjectile
CALLV
pop
line 384
;384:					VectorCopy( impactpoint, muzzle );
ADDRGP4 muzzle
ADDRLP4 88
INDIRB
ASGNB 12
line 386
;385:					// the player can hit him/herself with the bounced rail
;386:					passent = ENTITYNUM_NONE;
ADDRLP4 80
CNSTI4 4095
ASGNI4
line 387
;387:				}
ADDRGP4 $206
JUMPV
LABELV $234
line 388
;388:				else {
line 389
;389:					VectorCopy( tr.endpos, muzzle );
ADDRGP4 muzzle
ADDRLP4 0+12
INDIRB
ASGNB 12
line 390
;390:					passent = traceEnt->s.number;
ADDRLP4 80
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 391
;391:				}
line 392
;392:				continue;
ADDRGP4 $206
JUMPV
LABELV $231
line 394
;393:			}
;394:			else {
line 395
;395:                            if(spread == CHAINGUN_SPREAD)
ADDRFP4 4
INDIRF4
CNSTF4 1142292480
NEF4 $238
line 396
;396:                            {
line 397
;397:                                G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 29
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 399
;398:					damage, 0, MOD_CHAINGUN);
;399:                                ent->client->accuracy[WP_CHAINGUN][1]++;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2304
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 400
;400:                            }
ADDRGP4 $207
JUMPV
LABELV $238
line 402
;401:                            else
;402:                            {
line 403
;403:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 405
;404:					damage, 0, MOD_MACHINEGUN);
;405:                                ent->client->accuracy[WP_MACHINEGUN][1]++;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2216
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 406
;406:                            }
line 407
;407:			}
line 408
;408:		}
line 409
;409:		break;
ADDRGP4 $207
JUMPV
LABELV $206
line 326
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $205
LABELV $207
line 411
;410:	}
;411:}
LABELV $186
endproc Bullet_Fire 176 32
export BFG_Fire
proc BFG_Fire 16 12
line 422
;412:
;413:
;414:/*
;415:======================================================================
;416:
;417:BFG
;418:
;419:======================================================================
;420:*/
;421:
;422:void BFG_Fire ( gentity_t *ent ) {
line 425
;423:	gentity_t	*m;
;424:
;425:	m = fire_bfg (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_bfg
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 426
;426:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 427
;427:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 430
;428:
;429://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;430:}
LABELV $242
endproc BFG_Fire 16 12
export ShotgunPellet
proc ShotgunPellet 140 32
line 444
;431:
;432:/*
;433:======================================================================
;434:
;435:SHOTGUN
;436:
;437:======================================================================
;438:*/
;439:
;440:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;441:// client predicts same spreads
;442:#define	DEFAULT_SHOTGUN_DAMAGE	g_sgdamage.integer
;443:
;444:qboolean ShotgunPellet( vec3_t start, vec3_t end, gentity_t *ent ) {
line 452
;445:	trace_t		tr;
;446:	int			damage, i, passent;
;447:	gentity_t	*traceEnt;
;448:	gentity_t		*tent;
;449:	vec3_t		impactpoint, bouncedir;
;450:	vec3_t		tr_start, tr_end;
;451:
;452:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 453
;453:	VectorCopy( start, tr_start );
ADDRLP4 68
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 454
;454:	VectorCopy( end, tr_end );
ADDRLP4 84
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 455
;455:	for (i = 0; i < 10; i++) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $244
line 456
;456:		trap_Trace (&tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 124
CNSTP4 0
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 457
;457:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 2492
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 459
;458:
;459:	if(g_sgexplode.integer) {
ADDRGP4 g_sgexplode+12
INDIRI4
CNSTI4 0
EQI4 $249
line 460
;460:       tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 0+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 128
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 128
INDIRP4
ASGNP4
line 461
;461:	   tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 64
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 462
;462:	   tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 132
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 463
;463:	   tent->s.generic3 = WP_ROCKET_LAUNCHER;
ADDRLP4 64
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 5
ASGNI4
line 464
;464:	   G_RadiusDamage(tr.endpos, ent, g_sgsdamage.value/*45*/ * s_quadFactor, g_sgsradius.value/*35*/ * s_quadFactor, traceEnt, MOD_SHOTGUN);
ADDRLP4 0+12
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 s_quadFactor
INDIRF4
ASGNF4
ADDRGP4 g_sgsdamage+8
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ARGF4
ADDRGP4 g_sgsradius+8
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ARGF4
ADDRLP4 56
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 465
;465:	}
LABELV $249
line 469
;466:
;467:
;468:		// send bullet impact
;469:		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $257
line 470
;470:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $243
JUMPV
LABELV $257
line 473
;471:		}
;472:
;473:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $260
line 474
;474:			damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 96
ADDRGP4 g_sgdamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 475
;475:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
ADDRLP4 128
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $263
ADDRLP4 128
INDIRP4
CNSTI4 1432
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $263
line 476
;476:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 132
ADDRGP4 G_InvulnerabilityEffect
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $266
line 477
;477:					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
ADDRLP4 68
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 G_BounceProjectile
CALLV
pop
line 478
;478:					VectorCopy( impactpoint, tr_start );
ADDRLP4 68
ADDRLP4 100
INDIRB
ASGNB 12
line 480
;479:					// the player can hit him/herself with the bounced rail
;480:					passent = ENTITYNUM_NONE;
ADDRLP4 80
CNSTI4 4095
ASGNI4
line 481
;481:				}
ADDRGP4 $245
JUMPV
LABELV $266
line 482
;482:				else {
line 483
;483:					VectorCopy( tr.endpos, tr_start );
ADDRLP4 68
ADDRLP4 0+12
INDIRB
ASGNB 12
line 484
;484:					passent = traceEnt->s.number;
ADDRLP4 80
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 485
;485:				}
line 486
;486:				continue;
ADDRGP4 $245
JUMPV
LABELV $263
line 488
;487:			}
;488:			else {
line 489
;489:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 132
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 96
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 491
;490:					damage, 0, MOD_SHOTGUN);
;491:				if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $271
line 492
;492:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $243
JUMPV
LABELV $271
line 494
;493:				}
;494:			}
line 495
;495:		}
LABELV $260
line 496
;496:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $243
JUMPV
LABELV $245
line 455
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 10
LTI4 $244
line 498
;497:	}
;498:	return qfalse;
CNSTI4 0
RETI4
LABELV $243
endproc ShotgunPellet 140 32
export ShotgunPattern
proc ShotgunPattern 104 12
line 502
;499:}
;500:
;501:// this should match CG_ShotgunPattern
;502:void ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, gentity_t *ent ) {
line 508
;503:	int			i;
;504:	float		r, u;
;505:	vec3_t		end;
;506:	vec3_t		forward, right, up;
;507:	int			oldScore;
;508:	qboolean	hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 517
;509:
;510://unlagged - attack prediction #2
;511:	// use this for testing
;512:	//Com_Printf( "Server seed: %d\n", seed );
;513://unlagged - attack prediction #2
;514:
;515:	// derive the right and up vectors from the forward vector, because
;516:	// the client won't have any other information
;517:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 518
;518:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 519
;519:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 521
;520:
;521:	oldScore = ent->client->ps.persistant[PERS_SCORE];
ADDRLP4 64
ADDRFP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 525
;522:
;523://unlagged - backward reconciliation #2
;524:	// backward-reconcile the other clients
;525:	G_DoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 529
;526://unlagged - backward reconciliation #2
;527:
;528:	// generate the "random" spread pattern
;529:	for ( i = 0 ; i < mod_sgcount ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRGP4 $277
JUMPV
LABELV $274
line 530
;530:		r = Q_crandom( &seed ) * mod_sgspread * 16;
ADDRFP4 8
ARGP4
ADDRLP4 68
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 12
CNSTF4 1098907648
ADDRLP4 68
INDIRF4
ADDRGP4 mod_sgspread
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 531
;531:		u = Q_crandom( &seed ) * mod_sgspread * 16;
ADDRFP4 8
ARGP4
ADDRLP4 72
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 16
CNSTF4 1098907648
ADDRLP4 72
INDIRF4
ADDRGP4 mod_sgspread
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 532
;532:		VectorMA( origin, 8192 * 16, forward, end);
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTF4 1207959552
ASGNF4
ADDRLP4 0
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 80
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 80
INDIRF4
ADDRLP4 20+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1207959552
ADDRLP4 20+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 533
;533:		VectorMA (end, r, right, end);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 534
;534:		VectorMA (end, u, up, end);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 535
;535:		if( ShotgunPellet( origin, end, ent ) && !hitClient ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 ShotgunPellet
CALLI4
ASGNI4
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $294
ADDRLP4 60
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $294
line 536
;536:			hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 537
;537:			ent->client->accuracy_hits++;
ADDRLP4 100
ADDRFP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1300
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
line 538
;538:		}
LABELV $294
line 539
;539:	}
LABELV $275
line 529
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $277
ADDRLP4 56
INDIRI4
ADDRGP4 mod_sgcount
INDIRI4
LTI4 $274
line 540
;540:        if( hitClient )
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $296
line 541
;541:            ent->client->accuracy[WP_SHOTGUN][1]++;
ADDRLP4 68
ADDRFP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2224
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $296
line 545
;542:
;543://unlagged - backward reconciliation #2
;544:	// put them back
;545:	G_UndoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 547
;546://unlagged - backward reconciliation #2
;547:}
LABELV $273
endproc ShotgunPattern 104 12
export weapon_supershotgun_fire
proc weapon_supershotgun_fire 20 16
line 550
;548:
;549:
;550:void weapon_supershotgun_fire (gentity_t *ent) {
line 554
;551:	gentity_t		*tent;
;552:
;553:	// send shotgun blast
;554:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
ADDRGP4 muzzle
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 555
;555:	VectorScale( forward, 4096, tent->s.origin2 );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
CNSTF4 1166016512
ADDRGP4 forward
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
CNSTF4 1166016512
ADDRGP4 forward+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 1166016512
ADDRGP4 forward+8
INDIRF4
MULF4
ASGNF4
line 556
;556:	SnapVector( tent->s.origin2 );
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 561
;557://Sago: This sound like a bad idea...
;558://unlagged - attack prediction #2
;559:	// this has to be something the client can predict now
;560:	//tent->s.eventParm = rand() & 255;		// seed for spread pattern
;561:	tent->s.eventParm = ent->client->attackTime % 256; // seed for spread pattern
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1456
ADDP4
INDIRI4
CNSTI4 256
MODI4
ASGNI4
line 563
;562://unlagged - attack prediction #2
;563:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 565
;564:
;565:	ShotgunPattern( tent->s.pos.trBase, tent->s.origin2, tent->s.eventParm, ent );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShotgunPattern
CALLV
pop
line 566
;566:}
LABELV $298
endproc weapon_supershotgun_fire 20 16
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 577
;567:
;568:
;569:/*
;570:======================================================================
;571:
;572:GRENADE LAUNCHER
;573:
;574:======================================================================
;575:*/
;576:
;577:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 581
;578:	gentity_t	*m;
;579:
;580:	// extra vertical velocity
;581:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 582
;582:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 584
;583:
;584:	m = fire_grenade (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_grenade
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 585
;585:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 586
;586:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 589
;587:
;588://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;589:}
LABELV $301
endproc weapon_grenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 599
;590:
;591:/*
;592:======================================================================
;593:
;594:ROCKET
;595:
;596:======================================================================
;597:*/
;598:
;599:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 602
;600:	gentity_t	*m;
;601:
;602:	m = fire_rocket (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_rocket
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 603
;603:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 604
;604:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 607
;605:
;606://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;607:}
LABELV $303
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 16 12
line 618
;608:
;609:
;610:/*
;611:======================================================================
;612:
;613:PLASMA GUN
;614:
;615:======================================================================
;616:*/
;617:
;618:void Weapon_Plasmagun_Fire (gentity_t *ent) {
line 621
;619:	gentity_t	*m;
;620:
;621:	m = fire_plasma (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_plasma
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 622
;622:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 623
;623:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 626
;624:
;625://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;626:}
LABELV $304
endproc Weapon_Plasmagun_Fire 16 12
export weapon_railgun_fire
proc weapon_railgun_fire 200 32
line 643
;627:
;628:/*
;629:======================================================================
;630:
;631:RAILGUN
;632:
;633:======================================================================
;634:*/
;635:
;636:
;637:/*
;638:=================
;639:weapon_railgun_fire
;640:=================
;641:*/
;642:#define	MAX_RAIL_HITS	4
;643:void weapon_railgun_fire (gentity_t *ent) {
line 656
;644:	vec3_t		end;
;645:	vec3_t impactpoint, bouncedir;
;646:	trace_t		trace;
;647:	gentity_t	*tent;
;648:	gentity_t	*traceEnt;
;649:	int			damage;
;650:	int			i;
;651:	int			hits;
;652:	int			unlinked;
;653:	int			passent;
;654:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;655:
;656:	damage = g_rgdamage.integer * s_quadFactor;
ADDRLP4 116
ADDRGP4 g_rgdamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 657
;657:	if(g_instantgib.integer)
ADDRGP4 g_instantgib+12
INDIRI4
CNSTI4 0
EQI4 $307
line 658
;658:		damage = 800;
ADDRLP4 116
CNSTI4 800
ASGNI4
LABELV $307
line 660
;659:
;660:	VectorMA (muzzle, 8192, forward, end);
ADDRLP4 136
CNSTF4 1174405120
ASGNF4
ADDRLP4 88
ADDRGP4 muzzle
INDIRF4
ADDRLP4 136
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 136
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1174405120
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 664
;661:
;662://unlagged - backward reconciliation #2
;663:	// backward-reconcile the other clients
;664:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 668
;665://unlagged - backward reconciliation #2
;666:
;667:	// trace only against the solids, so the railgun will go through people
;668:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 669
;669:	hits = 0;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 670
;670:	passent = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $316
line 671
;671:	do {
line 672
;672:		trap_Trace (&trace, muzzle, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle
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
ADDRLP4 88
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 673
;673:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4+52
INDIRI4
CNSTI4 4093
LTI4 $319
line 674
;674:			break;
ADDRGP4 $318
JUMPV
LABELV $319
line 676
;675:		}
;676:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 677
;677:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $323
line 678
;678:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
ADDRLP4 144
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $325
ADDRLP4 144
INDIRP4
CNSTI4 1432
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $325
line 679
;679:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 148
ADDRGP4 G_InvulnerabilityEffect
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $326
line 680
;680:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
ADDRGP4 muzzle
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 G_BounceProjectile
CALLV
pop
line 682
;681:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;682:					SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 684
;683:					// send railgun beam effect
;684:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
ADDRLP4 4+12
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 152
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 152
INDIRP4
ASGNP4
line 686
;685:					// set player number for custom colors on the railtrail
;686:					tent->s.clientNum = ent->s.clientNum;
ADDRLP4 156
CNSTI4 180
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 687
;687:					VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 689
;688:					// move origin a bit to come closer to the drawn gun muzzle
;689:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
ADDRLP4 160
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 164
ADDRLP4 64
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 168
ADDRLP4 64
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 690
;690:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
ADDRLP4 172
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 176
ADDRLP4 64
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 180
ADDRLP4 64
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 691
;691:					tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 64
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 255
ASGNI4
line 693
;692:					//
;693:					VectorCopy( impactpoint, muzzle );
ADDRGP4 muzzle
ADDRLP4 104
INDIRB
ASGNB 12
line 695
;694:					// the player can hit him/herself with the bounced rail
;695:					passent = ENTITYNUM_NONE;
ADDRLP4 100
CNSTI4 4095
ASGNI4
line 696
;696:				}
line 697
;697:			}
ADDRGP4 $326
JUMPV
LABELV $325
line 698
;698:			else {
line 699
;699:				if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $337
line 700
;700:					hits++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 701
;701:				}
LABELV $337
line 702
;702:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 703
;703:			}
LABELV $326
line 704
;704:		}
LABELV $323
line 705
;705:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 4+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $340
line 706
;706:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $318
JUMPV
LABELV $340
line 709
;707:		}
;708:		// unlink this entity, so the next trace will go past it
;709:		trap_UnlinkEntity( traceEnt );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 710
;710:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 72
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 711
;711:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 712
;712:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $317
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $316
LABELV $318
line 716
;713:
;714://unlagged - backward reconciliation #2
;715:	// put them back
;716:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 720
;717://unlagged - backward reconciliation #2
;718:
;719:	// link back in any entities we unlinked
;720:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $346
JUMPV
LABELV $343
line 721
;721:		trap_LinkEntity( unlinkedEntities[i] );
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 72
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 722
;722:	}
LABELV $344
line 720
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $346
ADDRLP4 68
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $343
line 727
;723:
;724:	// the final trace endpos will be the terminal point of the rail trail
;725:
;726:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;727:	SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 730
;728:
;729:	// send railgun beam effect
;730:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
ADDRLP4 4+12
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 140
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 140
INDIRP4
ASGNP4
line 733
;731:
;732:	// set player number for custom colors on the railtrail
;733:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 144
CNSTI4 180
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 735
;734:
;735:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 737
;736:	// move origin a bit to come closer to the drawn gun muzzle
;737:	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
ADDRLP4 148
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 152
ADDRLP4 64
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 156
ADDRLP4 64
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 738
;738:	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
ADDRLP4 160
ADDRLP4 64
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 164
ADDRLP4 64
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 168
ADDRLP4 64
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 741
;739:
;740:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;741:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $353
line 742
;742:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 64
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 255
ASGNI4
line 743
;743:	} else {
ADDRGP4 $354
JUMPV
LABELV $353
line 744
;744:		tent->s.eventParm = DirToByte( trace.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 172
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 172
INDIRI4
ASGNI4
line 745
;745:	}
LABELV $354
line 746
;746:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 172
CNSTI4 180
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 749
;747:
;748:	// give the shooter a reward sound if they have made two railgun hits in a row
;749:	if ( hits == 0 ) {
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $357
line 751
;750:		// complete miss
;751:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
CNSTI4 0
ASGNI4
line 752
;752:	} else {
ADDRGP4 $358
JUMPV
LABELV $357
line 754
;753:		// check for "impressive" reward sound
;754:		ent->client->accurateCount += hits;
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
ADDRLP4 132
INDIRI4
ADDI4
ASGNI4
line 755
;755:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 2
LTI4 $359
line 756
;756:			ent->client->accurateCount -= 2;
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 757
;757:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 758
;758:			ent->client->pers.oldmoney += 1;
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 760
;759:            // add the sprite over the player's head
;760:			ent->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 761
;761:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 762
;762:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 0
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
line 763
;763:		}
LABELV $359
line 764
;764:		ent->client->accuracy_hits++;
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 765
;765:                ent->client->accuracy[WP_RAILGUN][1]++;
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2256
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 766
;766:	}
LABELV $358
line 768
;767:
;768:}
LABELV $305
endproc weapon_railgun_fire 200 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 12
line 779
;769:
;770:/*
;771:======================================================================
;772:
;773:GRAPPLING HOOK
;774:
;775:======================================================================
;776:*/
;777:
;778:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;779:{
line 780
;780:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
CNSTI4 0
NEI4 $363
ADDRLP4 0
INDIRP4
CNSTI4 1344
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $363
line 781
;781:		fire_grapple (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 fire_grapple
CALLP4
pop
LABELV $363
line 783
;782:
;783:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 1
ASGNI4
line 784
;784:}
LABELV $362
endproc Weapon_GrapplingHook_Fire 4 12
export Weapon_Grapple_Fire
proc Weapon_Grapple_Fire 4 12
line 787
;785:
;786:void Weapon_Grapple_Fire (gentity_t *ent)
;787:{
line 788
;788:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
CNSTI4 0
NEI4 $366
ADDRLP4 0
INDIRP4
CNSTI4 1344
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $366
line 789
;789:		fire_grapple (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 fire_grapple
CALLP4
pop
LABELV $366
line 791
;790:
;791:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 1
ASGNI4
line 792
;792:}
LABELV $365
endproc Weapon_Grapple_Fire 4 12
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 795
;793:
;794:void Weapon_HookFree (gentity_t *ent)
;795:{
line 796
;796:	ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTP4 0
ASGNP4
line 797
;797:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 798
;798:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 799
;799:}
LABELV $368
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 802
;800:
;801:void Weapon_HookThink (gentity_t *ent)
;802:{
line 803
;803:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $370
line 806
;804:		vec3_t v, oldorigin;
;805:
;806:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 807
;807:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 24
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 808
;808:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 28
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 809
;809:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 32
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 32
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 810
;810:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 812
;811:
;812:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 813
;813:	}
LABELV $370
line 815
;814:
;815:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 816
;816:}
LABELV $369
endproc Weapon_HookThink 36 8
export Weapon_LightningFire
proc Weapon_LightningFire 144 32
line 826
;817:
;818:/*
;819:======================================================================
;820:
;821:LIGHTNING GUN
;822:
;823:======================================================================
;824:*/
;825:
;826:void Weapon_LightningFire( gentity_t *ent ) {
line 833
;827:	trace_t		tr;
;828:	vec3_t		end;
;829:	vec3_t impactpoint, bouncedir;
;830:	gentity_t	*traceEnt, *tent;
;831:	int			damage, i, passent;
;832:
;833:	damage = g_lgdamage.integer * s_quadFactor;
ADDRLP4 108
ADDRGP4 g_lgdamage+12
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 835
;834:
;835:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 836
;836:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $376
line 837
;837:		VectorMA( muzzle, mod_lgrange, forward, end );
ADDRLP4 112
ADDRGP4 mod_lgrange
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 0
ADDRGP4 muzzle
INDIRF4
ADDRGP4 forward
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 muzzle+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 muzzle+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
ADDRGP4 mod_lgrange
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 842
;838:
;839://Sago: I'm not sure this should recieve backward reconciliation. It is not a real instant hit weapon, it can normally be dogded
;840://unlagged - backward reconciliation #2
;841:	// backward-reconcile the other clients
;842:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 845
;843://unlagged - backward reconciliation #2
;844:
;845:		trap_Trace( &tr, muzzle, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 116
CNSTP4 0
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 849
;846:
;847://unlagged - backward reconciliation #2
;848:	// put them back
;849:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 853
;850://unlagged - backward reconciliation #2
;851:
;852:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;853:		if (i) {
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $386
line 857
;854:			// add bounced off lightning bolt temp entity
;855:			// the first lightning bolt is a cgame only visual
;856:			//
;857:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
ADDRGP4 muzzle
ARGP4
CNSTI4 74
ARGI4
ADDRLP4 120
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 120
INDIRP4
ASGNP4
line 858
;858:			VectorCopy( tr.endpos, end );
ADDRLP4 0
ADDRLP4 12+12
INDIRB
ASGNB 12
line 859
;859:			SnapVector( end );
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
line 860
;860:			VectorCopy( end, tent->s.origin2 );
ADDRLP4 72
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 861
;861:		}
LABELV $386
line 862
;862:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 12+52
INDIRI4
CNSTI4 4095
NEI4 $393
line 863
;863:			return;
ADDRGP4 $374
JUMPV
LABELV $393
line 866
;864:		}
;865:
;866:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 68
CNSTI4 2492
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 868
;867:
;868:	if(g_lgexplode.integer) {
ADDRGP4 g_lgexplode+12
INDIRI4
CNSTI4 0
EQI4 $397
line 869
;869:        tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 12+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 120
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 120
INDIRP4
ASGNP4
line 870
;870:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 68
INDIRP4
INDIRI4
ASGNI4
line 871
;871:		tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 12+24
ARGP4
ADDRLP4 124
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 124
INDIRI4
ASGNI4
line 872
;872:		tent->s.generic3 = WP_ROCKET_LAUNCHER;
ADDRLP4 72
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 5
ASGNI4
line 873
;873:		G_RadiusDamage(tr.endpos, ent, /*70*/g_lgsdamage.value * s_quadFactor, /*75*/g_lgsradius.integer * s_quadFactor, traceEnt, MOD_LIGHTNING);
ADDRLP4 12+12
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 s_quadFactor
INDIRF4
ASGNF4
ADDRGP4 g_lgsdamage+8
INDIRF4
ADDRLP4 128
INDIRF4
MULF4
ARGF4
ADDRGP4 g_lgsradius+12
INDIRI4
CVIF4 4
ADDRLP4 128
INDIRF4
MULF4
ARGF4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 874
;874:	}
LABELV $397
line 876
;875:
;876:		if ( traceEnt->takedamage) {
ADDRLP4 68
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $405
line 877
;877:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
ADDRLP4 120
ADDRLP4 68
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $407
ADDRLP4 120
INDIRP4
CNSTI4 1432
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $407
line 878
;878:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 12+12
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 124
ADDRGP4 G_InvulnerabilityEffect
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $410
line 879
;879:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
ADDRGP4 muzzle
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceProjectile
CALLV
pop
line 880
;880:					VectorCopy( impactpoint, muzzle );
ADDRGP4 muzzle
ADDRLP4 84
INDIRB
ASGNB 12
line 881
;881:					VectorSubtract( end, impactpoint, forward );
ADDRGP4 forward
ADDRLP4 0
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ASGNF4
ADDRGP4 forward+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 84+4
INDIRF4
SUBF4
ASGNF4
ADDRGP4 forward+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 84+8
INDIRF4
SUBF4
ASGNF4
line 882
;882:					VectorNormalize(forward);
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 884
;883:					// the player can hit him/herself with the bounced lightning
;884:					passent = ENTITYNUM_NONE;
ADDRLP4 80
CNSTI4 4095
ASGNI4
line 885
;885:				}
ADDRGP4 $377
JUMPV
LABELV $410
line 886
;886:				else {
line 887
;887:					VectorCopy( tr.endpos, muzzle );
ADDRGP4 muzzle
ADDRLP4 12+12
INDIRB
ASGNB 12
line 888
;888:					passent = traceEnt->s.number;
ADDRLP4 80
ADDRLP4 68
INDIRP4
INDIRI4
ASGNI4
line 889
;889:				}
line 890
;890:				continue;
ADDRGP4 $377
JUMPV
LABELV $407
line 892
;891:			}
;892:			else {
line 893
;893:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 12+12
ARGP4
ADDRLP4 108
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 895
;894:					damage, 0, MOD_LIGHTNING);
;895:			}
line 896
;896:		}
LABELV $405
line 898
;897:
;898:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 68
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $421
ADDRLP4 68
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $421
line 899
;899:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 12+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 124
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 124
INDIRP4
ASGNP4
line 900
;900:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 68
INDIRP4
INDIRI4
ASGNI4
line 901
;901:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 12+24
ARGP4
ADDRLP4 128
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 902
;902:			tent->s.generic3 = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 224
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 903
;903:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 68
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $378
line 904
;904:				ent->client->accuracy_hits++;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 905
;905:                                ent->client->accuracy[WP_LIGHTNING][1]++;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2248
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 906
;906:			}
line 907
;907:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $378
JUMPV
LABELV $421
ADDRLP4 12+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $378
line 908
;908:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 12+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 124
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 124
INDIRP4
ASGNP4
line 909
;909:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 12+24
ARGP4
ADDRLP4 128
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 910
;910:		}
line 912
;911:
;912:		break;
ADDRGP4 $378
JUMPV
LABELV $377
line 836
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $376
LABELV $378
line 914
;913:	}
;914:}
LABELV $374
endproc Weapon_LightningFire 144 32
export Weapon_Nailgun_Fire
proc Weapon_Nailgun_Fire 20 20
line 924
;915:
;916:/*
;917:======================================================================
;918:
;919:NAILGUN
;920:
;921:======================================================================
;922:*/
;923:
;924:void Weapon_Nailgun_Fire (gentity_t *ent) {
line 928
;925:	gentity_t	*m;
;926:	int			count;
;927:
;928:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $433
line 929
;929:		m = fire_nail (ent, muzzle, forward, right, up );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRLP4 8
ADDRGP4 fire_nail
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 930
;930:		m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 931
;931:		m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 932
;932:	}
LABELV $434
line 928
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $436
ADDRLP4 4
INDIRI4
ADDRGP4 g_ngcount+12
INDIRI4
LTI4 $433
line 935
;933:
;934://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;935:}
LABELV $432
endproc Weapon_Nailgun_Fire 20 20
export weapon_proxlauncher_fire
proc weapon_proxlauncher_fire 20 12
line 945
;936:
;937:/*
;938:======================================================================
;939:
;940:PROXIMITY MINE LAUNCHER
;941:
;942:======================================================================
;943:*/
;944:
;945:void weapon_proxlauncher_fire (gentity_t *ent) {
line 949
;946:	gentity_t	*m;
;947:
;948:	// extra vertical velocity
;949:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 950
;950:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 952
;951:
;952:	m = fire_prox (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_prox
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 953
;953:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 954
;954:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 957
;955:
;956://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;957:}
LABELV $438
endproc weapon_proxlauncher_fire 20 12
export Weapon_Flamethrower_Fire
proc Weapon_Flamethrower_Fire 16 12
line 959
;958:
;959:void Weapon_Flamethrower_Fire (gentity_t *ent) {
line 962
;960:	gentity_t	*m;
;961:
;962:	m = fire_flame (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_flame
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 963
;963:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 964
;964:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 967
;965:
;966://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;967:}
LABELV $440
endproc Weapon_Flamethrower_Fire 16 12
export Weapon_Antimatter_Fire
proc Weapon_Antimatter_Fire 16 12
line 969
;968:
;969:void Weapon_Antimatter_Fire (gentity_t *ent) {
line 972
;970:	gentity_t	*m;
;971:
;972:	m = fire_antimatter (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_antimatter
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 973
;973:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 974
;974:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 928
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 977
;975:
;976://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;977:}
LABELV $441
endproc Weapon_Antimatter_Fire 16 12
export Weapon_Toolgun
proc Weapon_Toolgun 92 32
line 989
;978:
;979://======================================================================
;980:
;981:/*
;982:======================================================================
;983:
;984:TOOLGUN
;985:
;986:======================================================================
;987:*/
;988:
;989:void Weapon_Toolgun( gentity_t *ent ) {
line 997
;990:	trace_t		tr;
;991:	vec3_t		end;
;992:	gentity_t	*tent;
;993:	gentity_t	*traceEnt;
;994:	int			damage;
;995:
;996:	// set aiming directions
;997:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 999
;998:
;999:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1000
;1000:	VectorMA (muzzle, TOOLGUN_RANGE, forward, end);
ADDRLP4 80
CNSTF4 1157627904
ASGNF4
ADDRLP4 56
ADDRGP4 muzzle
INDIRF4
ADDRLP4 80
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 80
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1157627904
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1001
;1001:	trap_Trace (&tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SELECT);
ADDRLP4 0
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 84
CNSTP4 0
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1174405121
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1003
;1002:
;1003:	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $449
line 1004
;1004:		return;
ADDRGP4 $442
JUMPV
LABELV $449
line 1007
;1005:	}
;1006:
;1007:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 68
CNSTI4 2492
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1009
;1008:
;1009:	G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1012
;1010:		1, 0, MOD_TOOLGUN );
;1011:
;1012:	return;
LABELV $442
endproc Weapon_Toolgun 92 32
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 1021
;1013:}
;1014:
;1015:
;1016:/*
;1017:===============
;1018:LogAccuracyHit
;1019:===============
;1020:*/
;1021:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 1022
;1022:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
NEI4 $455
line 1023
;1023:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $454
JUMPV
LABELV $455
line 1026
;1024:	}
;1025:
;1026:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $457
line 1027
;1027:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $454
JUMPV
LABELV $457
line 1030
;1028:	}
;1029:
;1030:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $459
line 1031
;1031:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $454
JUMPV
LABELV $459
line 1034
;1032:	}
;1033:
;1034:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $461
line 1035
;1035:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $454
JUMPV
LABELV $461
line 1038
;1036:	}
;1037:
;1038:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $463
line 1039
;1039:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $454
JUMPV
LABELV $463
line 1042
;1040:	}
;1041:
;1042:	if ( OnSameTeam( target, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $465
line 1043
;1043:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $454
JUMPV
LABELV $465
line 1046
;1044:	}
;1045:
;1046:	return qtrue;
CNSTI4 1
RETI4
LABELV $454
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 36 0
line 1057
;1047:}
;1048:
;1049:
;1050:/*
;1051:===============
;1052:CalcMuzzlePoint
;1053:
;1054:set muzzle location relative to pivoting eye
;1055:===============
;1056:*/
;1057:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1058
;1058:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1059
;1059:	muzzlePoint[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1060
;1060:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 4
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 16
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 20
ADDRFP4 16
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1062
;1061:	// snap to integer coordinates for more efficient network bandwidth usage
;1062:	SnapVector( muzzlePoint );
ADDRLP4 24
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 4
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
ADDRFP4 16
INDIRP4
CNSTI4 8
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
line 1063
;1063:}
LABELV $467
endproc CalcMuzzlePoint 36 0
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 36 0
line 1072
;1064:
;1065:/*
;1066:===============
;1067:CalcMuzzlePointOrigin
;1068:
;1069:set muzzle location relative to pivoting eye
;1070:===============
;1071:*/
;1072:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 1073
;1073:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1074
;1074:	muzzlePoint[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1075
;1075:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 4
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 20
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 20
ADDRFP4 20
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1077
;1076:	// snap to integer coordinates for more efficient network bandwidth usage
;1077:	SnapVector( muzzlePoint );
ADDRLP4 24
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 20
INDIRP4
CNSTI4 4
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
ADDRFP4 20
INDIRP4
CNSTI4 8
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
line 1078
;1078:}
LABELV $468
endproc CalcMuzzlePointOrigin 36 0
export FireWeapon
proc FireWeapon 64 24
line 1087
;1079:
;1080:
;1081:
;1082:/*
;1083:===============
;1084:FireWeapon
;1085:===============
;1086:*/
;1087:void FireWeapon( gentity_t *ent ) {
line 1089
;1088:	//Make people drop out of follow mode (this should be moved, so people can change betwean players.)
;1089:	if (ent->client->sess.spectatorState == SPECTATOR_FOLLOW) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 2
NEI4 $470
line 1090
;1090:		StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1091
;1091:		return;
ADDRGP4 $469
JUMPV
LABELV $470
line 1094
;1092:	}
;1093:
;1094:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $472
line 1095
;1095:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 1096
;1096:	} else {
ADDRGP4 $473
JUMPV
LABELV $472
line 1097
;1097:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 1098
;1098:	}
LABELV $473
line 1099
;1099:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $475
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $475
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 12
NEI4 $475
line 1100
;1100:	s_quadFactor *= g_doublerdamagefactor.value;
ADDRLP4 12
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 g_doublerdamagefactor+8
INDIRF4
MULF4
ASGNF4
line 1101
;1101:	}
LABELV $475
line 1102
;1102:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_AMMOREGEN ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $478
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $478
ADDRLP4 20
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 13
NEI4 $478
line 1103
;1103:	s_quadFactor *= g_ammoregendamagefactor.value;
ADDRLP4 24
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRGP4 g_ammoregendamagefactor+8
INDIRF4
MULF4
ASGNF4
line 1104
;1104:	}
LABELV $478
line 1105
;1105:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_GUARD ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $481
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $481
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 11
NEI4 $481
line 1106
;1106:	s_quadFactor *= g_guarddamagefactor.value;
ADDRLP4 36
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRGP4 g_guarddamagefactor+8
INDIRF4
MULF4
ASGNF4
line 1107
;1107:	}
LABELV $481
line 1108
;1108:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_SCOUT ) {
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $484
ADDRLP4 44
ADDRLP4 36
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $484
ADDRLP4 44
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 10
NEI4 $484
line 1109
;1109:	s_quadFactor *= g_scoutdamagefactor.value;
ADDRLP4 48
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRGP4 g_scoutdamagefactor+8
INDIRF4
MULF4
ASGNF4
line 1110
;1110:	}
LABELV $484
line 1111
;1111:	if( ent->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
NEI4 $487
line 1112
;1112:	s_quadFactor *= mod_teamblue_damage;
ADDRLP4 48
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRGP4 mod_teamblue_damage
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1113
;1113:	}
LABELV $487
line 1114
;1114:	if( ent->client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $489
line 1115
;1115:	s_quadFactor *= mod_teamred_damage;
ADDRLP4 48
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRGP4 mod_teamred_damage
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1116
;1116:	}
LABELV $489
line 1117
;1117:	if(ent->botskill == 8){
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 8
NEI4 $491
line 1118
;1118:	s_quadFactor *= 100;
ADDRLP4 48
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 48
INDIRP4
CNSTF4 1120403456
ADDRLP4 48
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1119
;1119:	}
LABELV $491
line 1120
;1120:	if(ent->botskill == 9){
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 9
NEI4 $493
line 1121
;1121:	s_quadFactor *= 5;
ADDRLP4 48
ADDRGP4 s_quadFactor
ASGNP4
ADDRLP4 48
INDIRP4
CNSTF4 1084227584
ADDRLP4 48
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1122
;1122:	}
LABELV $493
line 1124
;1123:
;1124:    if (ent->client->spawnprotected)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $495
line 1125
;1125:        ent->client->spawnprotected = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2192
ADDP4
CNSTI4 0
ASGNI4
LABELV $495
line 1128
;1126:
;1127:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;1128:	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 10
EQI4 $497
ADDRLP4 48
INDIRI4
CNSTI4 1
EQI4 $497
line 1129
;1129:		if( ent->s.weapon == WP_NAILGUN ) {
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 11
NEI4 $499
line 1130
;1130:			ent->client->accuracy_shots += NUM_NAILSHOTS;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
ADDRGP4 g_ngcount+12
INDIRI4
ADDI4
ASGNI4
line 1131
;1131:                        ent->client->accuracy[WP_NAILGUN][0]++;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2284
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1132
;1132:		} else {
ADDRGP4 $500
JUMPV
LABELV $499
line 1133
;1133:			ent->client->accuracy_shots++;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1134
;1134:                        ent->client->accuracy[ent->s.weapon][0]++;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2196
ADDP4
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1135
;1135:		}
LABELV $500
line 1136
;1136:	}
LABELV $497
line 1139
;1137:
;1138:	// set aiming directions
;1139:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1141
;1140:
;1141:	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 1144
;1142:	
;1143:	// fire the specific weapon
;1144:	switch( ent->swep_id ) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 1
LTI4 $503
ADDRLP4 56
INDIRI4
CNSTI4 18
GTI4 $503
ADDRLP4 56
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $529-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $529
address $505
address $506
address $512
address $513
address $514
address $515
address $516
address $517
address $518
address $519
address $520
address $521
address $522
address $524
address $525
address $526
address $503
address $503
code
LABELV $505
line 1146
;1145:	case WP_GAUNTLET:
;1146:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 1147
;1147:		break;
ADDRGP4 $503
JUMPV
LABELV $506
line 1149
;1148:	case WP_MACHINEGUN:
;1149:		if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $507
line 1150
;1150:			Bullet_Fire( ent, mod_mgspread, MACHINEGUN_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 mod_mgspread
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 g_mgdamage+12
INDIRI4
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 1151
;1151:		} else {
ADDRGP4 $503
JUMPV
LABELV $507
line 1152
;1152:			Bullet_Fire( ent, mod_mgspread, MACHINEGUN_TEAM_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 mod_mgspread
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 g_mgdamage+12
INDIRI4
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 1153
;1153:		}
line 1154
;1154:		break;
ADDRGP4 $503
JUMPV
LABELV $512
line 1156
;1155:	case WP_SHOTGUN:
;1156:		weapon_supershotgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 1157
;1157:		break;
ADDRGP4 $503
JUMPV
LABELV $513
line 1159
;1158:	case WP_GRENADE_LAUNCHER:
;1159:		weapon_grenadelauncher_fire (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 1160
;1160:		break;
ADDRGP4 $503
JUMPV
LABELV $514
line 1162
;1161:	case WP_ROCKET_LAUNCHER:
;1162:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 1163
;1163:		break;
ADDRGP4 $503
JUMPV
LABELV $515
line 1165
;1164:	case WP_LIGHTNING:
;1165:		Weapon_LightningFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_LightningFire
CALLV
pop
line 1166
;1166:		break;
ADDRGP4 $503
JUMPV
LABELV $516
line 1168
;1167:	case WP_RAILGUN:
;1168:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 1169
;1169:		break;
ADDRGP4 $503
JUMPV
LABELV $517
line 1171
;1170:	case WP_PLASMAGUN:
;1171:		Weapon_Plasmagun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 1172
;1172:		break;
ADDRGP4 $503
JUMPV
LABELV $518
line 1174
;1173:	case WP_BFG:
;1174:		BFG_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BFG_Fire
CALLV
pop
line 1175
;1175:		break;
ADDRGP4 $503
JUMPV
LABELV $519
line 1177
;1176:	case WP_GRAPPLING_HOOK:
;1177:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 1178
;1178:		break;
ADDRGP4 $503
JUMPV
LABELV $520
line 1180
;1179:	case WP_NAILGUN:
;1180:		Weapon_Nailgun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Nailgun_Fire
CALLV
pop
line 1181
;1181:		break;
ADDRGP4 $503
JUMPV
LABELV $521
line 1183
;1182:	case WP_PROX_LAUNCHER:
;1183:		weapon_proxlauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_proxlauncher_fire
CALLV
pop
line 1184
;1184:		break;
ADDRGP4 $503
JUMPV
LABELV $522
line 1186
;1185:	case WP_CHAINGUN:
;1186:		Bullet_Fire( ent, mod_cgspread, CHAINGUN_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 mod_cgspread
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 g_cgdamage+12
INDIRI4
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 1187
;1187:		break;
ADDRGP4 $503
JUMPV
LABELV $524
line 1189
;1188:	case WP_FLAMETHROWER:
;1189:		Weapon_Flamethrower_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Flamethrower_Fire
CALLV
pop
line 1190
;1190:		break;
ADDRGP4 $503
JUMPV
LABELV $525
line 1192
;1191:	case WP_ANTIMATTER:
;1192:		Weapon_Antimatter_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Antimatter_Fire
CALLV
pop
line 1193
;1193:		break;
ADDRGP4 $503
JUMPV
LABELV $526
line 1195
;1194:	case WP_TOOLGUN:
;1195:		Weapon_Toolgun( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Toolgun
CALLV
pop
line 1196
;1196:		break;
line 1199
;1197:	case WP_PHYSGUN:
;1198:		//PhysgunHold()
;1199:		break;
line 1202
;1200:	case WP_GRAVITYGUN:
;1201:		//GravitygunHold()
;1202:		break;
line 1205
;1203:	default:
;1204:// FIXME		G_Error( "Bad ent->s.weapon" );
;1205:		break;
LABELV $503
line 1208
;1206:	}
;1207:	
;1208:}
LABELV $469
endproc FireWeapon 64 24
export KamikazeRadiusDamage
proc KamikazeRadiusDamage 84 32
line 1216
;1209:
;1210:
;1211:/*
;1212:===============
;1213:KamikazeRadiusDamage
;1214:===============
;1215:*/
;1216:void KamikazeRadiusDamage( vec3_t origin, gentity_t *attacker, float damage, float radius, int mod ) {
line 1225
;1217:	float		dist;
;1218:	gentity_t	*ent;
;1219:	int			numListedEntities;
;1220:	vec3_t		mins, maxs;
;1221:	vec3_t		v;
;1222:	vec3_t		dir;
;1223:	int			i, e;
;1224:
;1225:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $532
line 1226
;1226:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1227
;1227:	}
LABELV $532
line 1229
;1228:
;1229:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $534
line 1230
;1230:		mins[i] = origin[i] - radius;
ADDRLP4 68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRLP4 44
ADDP4
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 1231
;1231:		maxs[i] = origin[i] + radius;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 56
ADDP4
ADDRLP4 72
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 1232
;1232:	}
LABELV $535
line 1229
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $534
line 1234
;1233:
;1234:	numListedEntities = trap_EntitiesInBox( mins, maxs, MiTechEntityList, MAX_GENTITIES );
ADDRLP4 44
ARGP4
ADDRLP4 56
ARGP4
ADDRGP4 MiTechEntityList
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 68
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 68
INDIRI4
ASGNI4
line 1236
;1235:
;1236:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $541
JUMPV
LABELV $538
line 1237
;1237:		ent = &g_entities[MiTechEntityList[ e ]];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 MiTechEntityList
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1239
;1238:
;1239:		if (!ent->takedamage) {
ADDRLP4 4
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
NEI4 $542
line 1240
;1240:			continue;
ADDRGP4 $539
JUMPV
LABELV $542
line 1244
;1241:		}
;1242:
;1243:		// dont hit things we have already hit
;1244:		if( ent->kamikazeTime > level.time ) {
ADDRLP4 4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $544
line 1245
;1245:			continue;
ADDRGP4 $539
JUMPV
LABELV $544
line 1249
;1246:		}
;1247:
;1248:		// find the distance from the edge of the bounding box
;1249:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $547
line 1250
;1250:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 72
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
ADDP4
INDIRF4
GEF4 $551
line 1251
;1251:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 76
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
ADDP4
INDIRF4
ADDRLP4 76
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1252
;1252:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $552
JUMPV
LABELV $551
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 76
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRF4
LEF4 $553
line 1253
;1253:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 80
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 80
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1254
;1254:			} else {
ADDRGP4 $554
JUMPV
LABELV $553
line 1255
;1255:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1256
;1256:			}
LABELV $554
LABELV $552
line 1257
;1257:		}
LABELV $548
line 1249
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $547
line 1259
;1258:
;1259:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 72
INDIRF4
ASGNF4
line 1260
;1260:		if ( dist >= radius ) {
ADDRLP4 36
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $555
line 1261
;1261:			continue;
ADDRGP4 $539
JUMPV
LABELV $555
line 1265
;1262:		}
;1263:
;1264://		if( CanDamage (ent, origin) ) {
;1265:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 4
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1268
;1266:			// push the center of mass higher than the origin so players
;1267:			// get knocked into the air more
;1268:			dir[2] += 24;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1269
;1269:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, mod );
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
CNSTI4 17
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1270
;1270:			ent->kamikazeTime = level.time + 3000;
ADDRLP4 4
INDIRP4
CNSTI4 980
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1272
;1271://		}
;1272:	}
LABELV $539
line 1236
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $541
ADDRLP4 32
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $538
line 1273
;1273:}
LABELV $531
endproc KamikazeRadiusDamage 84 32
export KamikazeShockWave
proc KamikazeShockWave 84 32
line 1280
;1274:
;1275:/*
;1276:===============
;1277:KamikazeShockWave
;1278:===============
;1279:*/
;1280:void KamikazeShockWave( vec3_t origin, gentity_t *attacker, float damage, float push, float radius, int mod ) {
line 1289
;1281:	float		dist;
;1282:	gentity_t	*ent;
;1283:	int			numListedEntities;
;1284:	vec3_t		mins, maxs;
;1285:	vec3_t		v;
;1286:	vec3_t		dir;
;1287:	int			i, e;
;1288:
;1289:	if ( radius < 1 )
ADDRFP4 16
INDIRF4
CNSTF4 1065353216
GEF4 $562
line 1290
;1290:		radius = 1;
ADDRFP4 16
CNSTF4 1065353216
ASGNF4
LABELV $562
line 1292
;1291:
;1292:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $564
line 1293
;1293:		mins[i] = origin[i] - radius;
ADDRLP4 68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRLP4 44
ADDP4
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 16
INDIRF4
SUBF4
ASGNF4
line 1294
;1294:		maxs[i] = origin[i] + radius;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 56
ADDP4
ADDRLP4 72
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 16
INDIRF4
ADDF4
ASGNF4
line 1295
;1295:	}
LABELV $565
line 1292
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $564
line 1297
;1296:
;1297:	numListedEntities = trap_EntitiesInBox( mins, maxs, MiTechEntityList, MAX_GENTITIES );
ADDRLP4 44
ARGP4
ADDRLP4 56
ARGP4
ADDRGP4 MiTechEntityList
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 68
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 68
INDIRI4
ASGNI4
line 1299
;1298:
;1299:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $571
JUMPV
LABELV $568
line 1300
;1300:		ent = &g_entities[MiTechEntityList[ e ]];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 MiTechEntityList
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1303
;1301:
;1302:		// dont hit things we have already hit
;1303:		if( ent->kamikazeShockTime > level.time ) {
ADDRLP4 4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $572
line 1304
;1304:			continue;
ADDRGP4 $569
JUMPV
LABELV $572
line 1308
;1305:		}
;1306:
;1307:		// find the distance from the edge of the bounding box
;1308:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $575
line 1309
;1309:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 72
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
ADDP4
INDIRF4
GEF4 $579
line 1310
;1310:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 76
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
ADDP4
INDIRF4
ADDRLP4 76
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1311
;1311:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $580
JUMPV
LABELV $579
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 76
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRF4
LEF4 $581
line 1312
;1312:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 80
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 80
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1313
;1313:			} else {
ADDRGP4 $582
JUMPV
LABELV $581
line 1314
;1314:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1315
;1315:			}
LABELV $582
LABELV $580
line 1316
;1316:		}
LABELV $576
line 1308
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $575
line 1318
;1317:
;1318:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 72
INDIRF4
ASGNF4
line 1319
;1319:		if ( dist >= radius ) {
ADDRLP4 36
INDIRF4
ADDRFP4 16
INDIRF4
LTF4 $583
line 1320
;1320:			continue;
ADDRGP4 $569
JUMPV
LABELV $583
line 1324
;1321:		}
;1322:
;1323://		if( CanDamage (ent, origin) ) {
;1324:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 4
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1325
;1325:			dir[2] += 24;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1326
;1326:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, mod );
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
CNSTI4 17
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1328
;1327:			//
;1328:			dir[2] = 0;
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 1329
;1329:			VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1330
;1330:			if ( ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $589
line 1331
;1331:				ent->client->ps.velocity[0] = dir[0] * push;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 20
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1332
;1332:				ent->client->ps.velocity[1] = dir[1] * push;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20+4
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1333
;1333:				ent->client->ps.velocity[2] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1120403456
ASGNF4
line 1334
;1334:			}
LABELV $589
line 1335
;1335:			ent->kamikazeShockTime = level.time + 3000;
ADDRLP4 4
INDIRP4
CNSTI4 984
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1337
;1336://		}
;1337:	}
LABELV $569
line 1299
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $571
ADDRLP4 32
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $568
line 1338
;1338:}
LABELV $561
endproc KamikazeShockWave 84 32
export KamikazeDamage
proc KamikazeDamage 64 24
line 1345
;1339:
;1340:/*
;1341:===============
;1342:KamikazeDamage
;1343:===============
;1344:*/
;1345:void KamikazeDamage( gentity_t *self ) {
line 1351
;1346:	int i;
;1347:	float t;
;1348:	gentity_t *ent;
;1349:	vec3_t newangles;
;1350:
;1351:	self->count += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1353
;1352:
;1353:	if (self->count >= KAMI_SHOCKWAVE_STARTTIME) {
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 0
LTI4 $594
line 1355
;1354:		// shockwave push back
;1355:		t = self->count - KAMI_SHOCKWAVE_STARTTIME;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1356
;1356:		KamikazeShockWave(self->s.pos.trBase, self->activator, 25, 400,	(int) (float) t * KAMI_SHOCKWAVE_MAXRADIUS / (KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME), MOD_KAMIKAZE );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
ARGP4
CNSTF4 1103626240
ARGF4
CNSTF4 1137180672
ARGF4
CNSTI4 1320
ADDRLP4 20
INDIRF4
CVFI4 4
MULI4
CNSTI4 2000
DIVI4
CVIF4 4
ARGF4
CNSTI4 31
ARGI4
ADDRGP4 KamikazeShockWave
CALLV
pop
line 1357
;1357:	}
LABELV $594
line 1359
;1358:	//
;1359:	if (self->count >= KAMI_EXPLODE_STARTTIME) {
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 250
LTI4 $596
line 1361
;1360:		// do our damage
;1361:		t = self->count - KAMI_EXPLODE_STARTTIME;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 250
SUBI4
CVIF4 4
ASGNF4
line 1362
;1362:		KamikazeRadiusDamage( self->s.pos.trBase, self->activator, 400,	(int) (float) t * KAMI_BOOMSPHERE_MAXRADIUS / (KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME), MOD_KAMIKAZE );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 720
ADDRLP4 20
INDIRF4
CVFI4 4
MULI4
CNSTI4 1750
DIVI4
CVIF4 4
ARGF4
CNSTI4 31
ARGI4
ADDRGP4 KamikazeRadiusDamage
CALLV
pop
line 1363
;1363:	}
LABELV $596
line 1366
;1364:
;1365:	// either cycle or kill self
;1366:	if( self->count >= KAMI_SHOCKWAVE_ENDTIME ) {
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 2000
LTI4 $598
line 1367
;1367:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1368
;1368:		return;
ADDRGP4 $593
JUMPV
LABELV $598
line 1370
;1369:	}
;1370:	self->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1373
;1371:
;1372:	// add earth quake effect
;1373:	newangles[0] = crandom() * 2;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 32
CNSTF4 1073741824
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 28
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
ASGNF4
line 1374
;1374:	newangles[1] = crandom() * 2;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
CNSTF4 1073741824
ASGNF4
ADDRLP4 4+4
ADDRLP4 40
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 36
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
ASGNF4
line 1375
;1375:	newangles[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 1376
;1376:	for (i = 0; i < MAX_CLIENTS; i++)
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $603
line 1377
;1377:	{
line 1378
;1378:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1379
;1379:		if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $607
line 1380
;1380:			continue;
ADDRGP4 $604
JUMPV
LABELV $607
line 1381
;1381:		if (!ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $609
line 1382
;1382:			continue;
ADDRGP4 $604
JUMPV
LABELV $609
line 1384
;1383:
;1384:		if (ent->client->ps.groundEntityNum != ENTITYNUM_NONE) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 4095
EQI4 $611
line 1385
;1385:			ent->client->ps.velocity[0] += crandom() * 120;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1123024896
CNSTF4 1073741824
ADDRLP4 44
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
line 1386
;1386:			ent->client->ps.velocity[1] += crandom() * 120;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1123024896
CNSTF4 1073741824
ADDRLP4 52
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
line 1387
;1387:			ent->client->ps.velocity[2] = 30 + random() * 25;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1103626240
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 1388
;1388:		}
LABELV $611
line 1390
;1389:
;1390:		ent->client->ps.delta_angles[0] += ANGLE2SHORT(newangles[0] - self->movedir[0]);
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRF4
SUBF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 1391
;1391:		ent->client->ps.delta_angles[1] += ANGLE2SHORT(newangles[1] - self->movedir[1]);
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRLP4 4+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRF4
SUBF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 1392
;1392:		ent->client->ps.delta_angles[2] += ANGLE2SHORT(newangles[2] - self->movedir[2]);
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRLP4 4+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
SUBF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 1393
;1393:	}
LABELV $604
line 1376
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 256
LTI4 $603
line 1394
;1394:	VectorCopy(newangles, self->movedir);
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1395
;1395:}
LABELV $593
endproc KamikazeDamage 64 24
export G_StartKamikaze
proc G_StartKamikaze 40 8
line 1402
;1396:
;1397:/*
;1398:===============
;1399:G_StartKamikaze
;1400:===============
;1401:*/
;1402:void G_StartKamikaze( gentity_t *ent ) {
line 1408
;1403:	gentity_t	*explosion;
;1404:	gentity_t	*te;
;1405:	vec3_t		snapped;
;1406:
;1407:	// start up the explosion logic
;1408:	explosion = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1410
;1409:
;1410:	explosion->s.eType = ET_EVENTS + EV_KAMIKAZE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 84
ASGNI4
line 1411
;1411:	explosion->eventTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 592
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1413
;1412:
;1413:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $617
line 1414
;1414:		VectorCopy( ent->s.pos.trBase, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1415
;1415:	}
ADDRGP4 $618
JUMPV
LABELV $617
line 1416
;1416:	else {
line 1417
;1417:		VectorCopy( ent->activator->s.pos.trBase, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1418
;1418:	}
LABELV $618
line 1419
;1419:	SnapVector( snapped );		// save network bandwidth
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1420
;1420:	G_SetOrigin( explosion, snapped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1422
;1421:
;1422:	explosion->classname = "kamikaze";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $623
ASGNP4
line 1423
;1423:	explosion->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1425
;1424:
;1425:	explosion->kamikazeTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 980
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1427
;1426:
;1427:	explosion->think = KamikazeDamage;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 KamikazeDamage
ASGNP4
line 1428
;1428:	explosion->nextthink = level.time + 100;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1429
;1429:	explosion->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 0
ASGNI4
line 1430
;1430:	VectorClear(explosion->movedir);
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
line 1432
;1431:
;1432:	trap_LinkEntity( explosion );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1434
;1433:
;1434:	if (ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $626
line 1436
;1435:		//
;1436:		explosion->activator = ent;
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1438
;1437:		//
;1438:		ent->s.eFlags &= ~EF_KAMIKAZE;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 1441
;1439:		// nuke the guy that used it
;1440:		//G_Damage( ent, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_KAMIKAZE );
;1441:	}
ADDRGP4 $627
JUMPV
LABELV $626
line 1442
;1442:	else {
line 1443
;1443:		if ( !strcmp(ent->activator->classname, "bodyque") ) {
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $630
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $628
line 1444
;1444:			explosion->activator = &g_entities[ent->activator->r.ownerNum];
ADDRLP4 36
CNSTI4 968
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
CNSTI4 2492
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1445
;1445:		}
ADDRGP4 $629
JUMPV
LABELV $628
line 1446
;1446:		else {
line 1447
;1447:			explosion->activator = ent->activator;
ADDRLP4 36
CNSTI4 968
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
INDIRP4
ASGNP4
line 1448
;1448:		}
LABELV $629
line 1449
;1449:	}
LABELV $627
line 1452
;1450:
;1451:	// play global sound at all clients
;1452:	te = G_TempEntity(snapped, EV_GLOBAL_TEAM_SOUND );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 32
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 1453
;1453:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 36
ADDRLP4 16
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1454
;1454:	te->s.eventParm = GTS_KAMIKAZE;
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 13
ASGNI4
line 1455
;1455:}
LABELV $615
endproc G_StartKamikaze 40 8
export CarExplodeDamage
proc CarExplodeDamage 32 24
line 1457
;1456:
;1457:void CarExplodeDamage( gentity_t *self ) {
line 1463
;1458:	int i;
;1459:	float t;
;1460:	gentity_t *ent;
;1461:	vec3_t newangles;
;1462:
;1463:	self->count += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1465
;1464:
;1465:	if (self->count >= KAMI_SHOCKWAVE_STARTTIME) {
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 0
LTI4 $632
line 1467
;1466:		// shockwave push back
;1467:		t = self->count - KAMI_SHOCKWAVE_STARTTIME;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1468
;1468:		KamikazeShockWave(self->s.pos.trBase, self->activator, 25, 400,	(int) (float) t * 300 / (KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME), MOD_CAREXPLODE );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
ARGP4
CNSTF4 1103626240
ARGF4
CNSTF4 1137180672
ARGF4
CNSTI4 300
ADDRLP4 0
INDIRF4
CVFI4 4
MULI4
CNSTI4 2000
DIVI4
CVIF4 4
ARGF4
CNSTI4 35
ARGI4
ADDRGP4 KamikazeShockWave
CALLV
pop
line 1469
;1469:	}
LABELV $632
line 1471
;1470:	//
;1471:	if (self->count >= KAMI_EXPLODE_STARTTIME) {
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 250
LTI4 $634
line 1473
;1472:		// do our damage
;1473:		t = self->count - KAMI_EXPLODE_STARTTIME;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 250
SUBI4
CVIF4 4
ASGNF4
line 1474
;1474:		KamikazeRadiusDamage( self->s.pos.trBase, self->activator, 400,	(int) (float) t * 150 / (KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME), MOD_CAREXPLODE );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 150
ADDRLP4 0
INDIRF4
CVFI4 4
MULI4
CNSTI4 1750
DIVI4
CVIF4 4
ARGF4
CNSTI4 35
ARGI4
ADDRGP4 KamikazeRadiusDamage
CALLV
pop
line 1475
;1475:	}
LABELV $634
line 1478
;1476:
;1477:	// either cycle or kill self
;1478:	if( self->count >= KAMI_SHOCKWAVE_ENDTIME ) {
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 2000
LTI4 $636
line 1479
;1479:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1480
;1480:		return;
ADDRGP4 $631
JUMPV
LABELV $636
line 1482
;1481:	}
;1482:	self->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1483
;1483:}
LABELV $631
endproc CarExplodeDamage 32 24
export G_StartCarExplode
proc G_StartCarExplode 44 8
line 1485
;1484:
;1485:void G_StartCarExplode( gentity_t *ent ) {
line 1491
;1486:	gentity_t	*explosion;
;1487:	gentity_t	*te;
;1488:	vec3_t		snapped;
;1489:
;1490:	// start up the explosion logic
;1491:	explosion = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1493
;1492:
;1493:	explosion->s.eType = ET_EVENTS + EV_KAMIKAZE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 84
ASGNI4
line 1494
;1494:	explosion->eventTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 592
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1496
;1495:
;1496:	VectorCopy( ent->r.currentOrigin, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 1497
;1497:	SnapVector( snapped );		// save network bandwidth
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1498
;1498:	G_SetOrigin( explosion, snapped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1500
;1499:
;1500:	explosion->classname = "kamikaze";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $623
ASGNP4
line 1501
;1501:	explosion->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1503
;1502:
;1503:	explosion->kamikazeTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 980
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1505
;1504:
;1505:	explosion->think = CarExplodeDamage;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 CarExplodeDamage
ASGNP4
line 1506
;1506:	explosion->nextthink = level.time + 100;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1507
;1507:	explosion->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 0
ASGNI4
line 1508
;1508:	VectorClear(explosion->movedir);
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
line 1510
;1509:
;1510:	trap_LinkEntity( explosion );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1512
;1511:
;1512:	if ( !strcmp(ent->activator->classname, "bodyque") ) {
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $630
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $647
line 1513
;1513:		explosion->activator = &g_entities[ent->activator->r.ownerNum];
ADDRLP4 36
CNSTI4 968
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
CNSTI4 2492
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1514
;1514:	}
ADDRGP4 $648
JUMPV
LABELV $647
line 1515
;1515:	else {
line 1516
;1516:		explosion->activator = ent->activator;
ADDRLP4 36
CNSTI4 968
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
INDIRP4
ASGNP4
line 1517
;1517:	}
LABELV $648
line 1520
;1518:
;1519:	// play global sound at all clients
;1520:	te = G_TempEntity(snapped, EV_GLOBAL_TEAM_SOUND );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 36
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 1521
;1521:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 40
ADDRLP4 16
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1522
;1522:	te->s.eventParm = GTS_KAMIKAZE;
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 13
ASGNI4
line 1523
;1523:}
LABELV $639
endproc G_StartCarExplode 44 8
bss
align 4
LABELV muzzle
skip 12
align 4
LABELV up
skip 12
align 4
LABELV right
skip 12
align 4
LABELV forward
skip 12
align 4
LABELV s_quadFactor
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
LABELV $630
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $623
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $77
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
