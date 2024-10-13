export CG_InitLocalEntities
code
proc CG_InitLocalEntities 12 12
file "../../../code/cgame/cg_localents.c"
line 41
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
;24:// cg_localents.c -- every frame, generate renderer commands for locally
;25:// processed entities, like smoke puffs, gibs, shells, etc.
;26:
;27:#include "cg_local.h"
;28:
;29:#define	MAX_LOCAL_ENTITIES	4096 
;30:localEntity_t	cg_localEntities[MAX_LOCAL_ENTITIES];
;31:localEntity_t	cg_activeLocalEntities;		// double linked list
;32:localEntity_t	*cg_freeLocalEntities;		// single linked list
;33:
;34:/*
;35:===================
;36:CG_InitLocalEntities
;37:
;38:This is called at startup and for tournement restarts
;39:===================
;40:*/
;41:void	CG_InitLocalEntities( void ) {
line 44
;42:	int		i;
;43:
;44:	memset( cg_localEntities, 0, sizeof( cg_localEntities ) );
ADDRGP4 cg_localEntities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1359872
ARGI4
ADDRGP4 memset
CALLP4
pop
line 45
;45:	cg_activeLocalEntities.next = &cg_activeLocalEntities;
ADDRGP4 cg_activeLocalEntities+4
ADDRGP4 cg_activeLocalEntities
ASGNP4
line 46
;46:	cg_activeLocalEntities.prev = &cg_activeLocalEntities;
ADDRLP4 4
ADDRGP4 cg_activeLocalEntities
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 47
;47:	cg_freeLocalEntities = cg_localEntities;
ADDRGP4 cg_freeLocalEntities
ADDRGP4 cg_localEntities
ASGNP4
line 48
;48:	for ( i = 0 ; i < MAX_LOCAL_ENTITIES - 1 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $83
line 49
;49:		cg_localEntities[i].next = &cg_localEntities[i+1];
ADDRLP4 8
CNSTI4 332
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 cg_localEntities+4
ADDP4
ADDRLP4 8
INDIRI4
ADDRGP4 cg_localEntities+332
ADDP4
ASGNP4
line 50
;50:	}
LABELV $84
line 48
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4095
LTI4 $83
line 51
;51:}
LABELV $81
endproc CG_InitLocalEntities 12 12
export CG_FreeLocalEntity
proc CG_FreeLocalEntity 12 4
line 59
;52:
;53:
;54:/*
;55:==================
;56:CG_FreeLocalEntity
;57:==================
;58:*/
;59:void CG_FreeLocalEntity( localEntity_t *le ) {
line 60
;60:	if ( !le->prev ) {
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $90
line 61
;61:		CG_Error( "CG_FreeLocalEntity: not active" );
ADDRGP4 $92
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 62
;62:	}
LABELV $90
line 65
;63:
;64:	// remove from the doubly linked active list
;65:	le->prev->next = le->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 66
;66:	le->next->prev = le->prev;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRP4
ASGNP4
line 69
;67:
;68:	// the free list is only singly linked
;69:	le->next = cg_freeLocalEntities;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg_freeLocalEntities
INDIRP4
ASGNP4
line 70
;70:	cg_freeLocalEntities = le;
ADDRGP4 cg_freeLocalEntities
ADDRFP4 0
INDIRP4
ASGNP4
line 71
;71:}
LABELV $89
endproc CG_FreeLocalEntity 12 4
export CG_AllocLocalEntity
proc CG_AllocLocalEntity 8 12
line 80
;72:
;73:/*
;74:===================
;75:CG_AllocLocalEntity
;76:
;77:Will allways succeed, even if it requires freeing an old active entity
;78:===================
;79:*/
;80:localEntity_t	*CG_AllocLocalEntity( void ) {
line 83
;81:	localEntity_t	*le;
;82:
;83:	if ( !cg_freeLocalEntities ) {
ADDRGP4 cg_freeLocalEntities
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $94
line 86
;84:		// no free entities, so free the one at the end of the chain
;85:		// remove the oldest active entity
;86:		CG_FreeLocalEntity( cg_activeLocalEntities.prev );
ADDRGP4 cg_activeLocalEntities
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 87
;87:	}
LABELV $94
line 89
;88:
;89:	le = cg_freeLocalEntities;
ADDRLP4 0
ADDRGP4 cg_freeLocalEntities
INDIRP4
ASGNP4
line 90
;90:	cg_freeLocalEntities = cg_freeLocalEntities->next;
ADDRLP4 4
ADDRGP4 cg_freeLocalEntities
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
line 92
;91:
;92:	memset( le, 0, sizeof( *le ) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 332
ARGI4
ADDRGP4 memset
CALLP4
pop
line 95
;93:
;94:	// link into the active list
;95:	le->next = cg_activeLocalEntities.next;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg_activeLocalEntities+4
INDIRP4
ASGNP4
line 96
;96:	le->prev = &cg_activeLocalEntities;
ADDRLP4 0
INDIRP4
ADDRGP4 cg_activeLocalEntities
ASGNP4
line 97
;97:	cg_activeLocalEntities.next->prev = le;
ADDRGP4 cg_activeLocalEntities+4
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 98
;98:	cg_activeLocalEntities.next = le;
ADDRGP4 cg_activeLocalEntities+4
ADDRLP4 0
INDIRP4
ASGNP4
line 99
;99:	return le;
ADDRLP4 0
INDIRP4
RETP4
LABELV $93
endproc CG_AllocLocalEntity 8 12
export CG_PuffTrail
proc CG_PuffTrail 68 48
line 121
;100:}
;101:
;102:
;103:/*
;104:====================================================================================
;105:
;106:FRAGMENT PROCESSING
;107:
;108:A fragment localentity interacts with the environment in some way (hitting walls),
;109:or generates more localentities along a trail.
;110:
;111:====================================================================================
;112:*/
;113:
;114:/*
;115:================
;116:CG_PuffTrail
;117:
;118:Leave expanding puffs behind fragments
;119:================
;120:*/
;121:void CG_PuffTrail( localEntity_t *le ) {
line 131
;122:	int		t;
;123:	int		t2;
;124:	int		step;
;125:	vec3_t	newOrigin;
;126:	localEntity_t	*puff;
;127:	float r, g, b, a;
;128:	qhandle_t mediaShader;
;129:	int verticalMovement;
;130:
;131:	if ( le->leTrailType == LETT_NONE )
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
NEI4 $100
line 132
;132:		return;
ADDRGP4 $99
JUMPV
LABELV $100
line 134
;133:
;134:	if ( le->leTrailType == LETT_BLOOD ) {
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 1
NEI4 $102
line 135
;135:		if (cg_gibs.integer == 2)
ADDRGP4 cg_gibs+12
INDIRI4
CNSTI4 2
NEI4 $104
line 136
;136:			step = 50;
ADDRLP4 20
CNSTI4 50
ASGNI4
ADDRGP4 $105
JUMPV
LABELV $104
line 138
;137:		else
;138:	step = 150;
ADDRLP4 20
CNSTI4 150
ASGNI4
LABELV $105
line 139
;139:		r = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 140
;140:		g = 1;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 141
;141:		b = 1;
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
line 142
;142:		a = 1;
ADDRLP4 40
CNSTF4 1065353216
ASGNF4
line 143
;143:		mediaShader = cgs.media.bloodTrailShader;
ADDRLP4 44
ADDRGP4 cgs+956380+1300
INDIRI4
ASGNI4
line 144
;144:		verticalMovement = 40;
ADDRLP4 48
CNSTI4 40
ASGNI4
line 145
;145:	}
ADDRGP4 $103
JUMPV
LABELV $102
line 146
;146:	else if ( le->leTrailType == LETT_DEBRIS_CONCRETE ) {
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 2
NEI4 $109
line 147
;147:		step = 25;
ADDRLP4 20
CNSTI4 25
ASGNI4
line 148
;148:		r = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 149
;149:		g = 1;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 150
;150:		b = 1;
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
line 151
;151:		a = 0.2;
ADDRLP4 40
CNSTF4 1045220557
ASGNF4
line 152
;152:		mediaShader = cgs.media.smokePuffShader;
ADDRLP4 44
ADDRGP4 cgs+956380+1272
INDIRI4
ASGNI4
line 153
;153:		verticalMovement = -40;
ADDRLP4 48
CNSTI4 -40
ASGNI4
line 154
;154:			}
ADDRGP4 $110
JUMPV
LABELV $109
line 155
;155:	else if ( le->leTrailType == LETT_DEBRIS_WOOD ) {
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 3
NEI4 $113
line 156
;156:		step = 25;
ADDRLP4 20
CNSTI4 25
ASGNI4
line 157
;157:		r = 0.5;
ADDRLP4 28
CNSTF4 1056964608
ASGNF4
line 158
;158:		g = 0.42;
ADDRLP4 32
CNSTF4 1054280253
ASGNF4
line 159
;159:		b = 0.36;
ADDRLP4 36
CNSTF4 1052266988
ASGNF4
line 160
;160:		a = 0.2;
ADDRLP4 40
CNSTF4 1045220557
ASGNF4
line 161
;161:		mediaShader = cgs.media.smokePuffShader;
ADDRLP4 44
ADDRGP4 cgs+956380+1272
INDIRI4
ASGNI4
line 162
;162:		verticalMovement = -40;
ADDRLP4 48
CNSTI4 -40
ASGNI4
line 163
;163:	}
LABELV $113
LABELV $110
LABELV $103
line 165
;164:
;165:	t = step * ( (cg.time - cg.frametime + step ) / step );
ADDRLP4 0
ADDRLP4 20
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1868888
INDIRI4
SUBI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRLP4 20
INDIRI4
DIVI4
MULI4
ASGNI4
line 166
;166:	t2 = step * ( cg.time / step );
ADDRLP4 24
ADDRLP4 20
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 20
INDIRI4
DIVI4
MULI4
ASGNI4
line 168
;167:
;168:	for ( ; t <= t2; t += step ) {
ADDRGP4 $123
JUMPV
LABELV $120
line 169
;169:		BG_EvaluateTrajectory( &le->pos, t, newOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 171
;170:
;171:		puff = CG_SmokePuff( newOrigin, vec3_origin, 
ADDRLP4 8
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1157234688
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 64
INDIRP4
ASGNP4
line 180
;172:					  20,		// radius
;173:					  r, g, b, a,	// color
;174:					  2000,		// trailTime
;175:					  t,		// startTime
;176:					  0,		// fadeInTime
;177:					  0,		// flags
;178:					  mediaShader );
;179:		// use the optimized version
;180:		puff->leType = LE_FALL_SCALE_FADE;
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 6
ASGNI4
line 182
;181:		// drop or rise a total of n units over its lifetime
;182:		puff->pos.trDelta[2] = verticalMovement;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 183
;183:	}
LABELV $121
line 168
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
LABELV $123
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $120
line 184
;184:}
LABELV $99
endproc CG_PuffTrail 68 48
export CG_SmallBloodTrail
proc CG_SmallBloodTrail 48 48
line 186
;185:
;186:void CG_SmallBloodTrail( localEntity_t *le ) {
line 193
;187:	int		t;
;188:	int		t2;
;189:	int		step;
;190:	vec3_t	newOrigin;
;191:	localEntity_t	*blood;
;192:
;193:	step = 61;
ADDRLP4 20
CNSTI4 61
ASGNI4
line 194
;194:	t = step * ( (cg.time - cg.frametime + step ) / step );
ADDRLP4 0
ADDRLP4 20
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1868888
INDIRI4
SUBI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRLP4 20
INDIRI4
DIVI4
MULI4
ASGNI4
line 195
;195:	t2 = step * ( cg.time / step );
ADDRLP4 24
ADDRLP4 20
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 20
INDIRI4
DIVI4
MULI4
ASGNI4
line 197
;196:
;197:	for ( ; t <= t2; t += step ) {
ADDRGP4 $131
JUMPV
LABELV $128
line 198
;198:		BG_EvaluateTrajectory( &le->pos, t, newOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 200
;199:
;200:		blood = CG_SmokePuff( newOrigin, vec3_origin, 
ADDRLP4 8
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1077936128
ARGF4
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTF4 1145077760
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 cgs+956380+1340
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 44
INDIRP4
ASGNP4
line 209
;201:					  3,		// radius
;202:					  1, 1, 1, 1,	// color
;203:					  770,		// trailTime
;204:					  t,		// startTime
;205:					  0,		// fadeInTime
;206:					  0,		// flags
;207:					  cgs.media.lbldShader1 );
;208:		// use the optimized version
;209:		blood->leType = LE_FALL_SCALE_FADE;
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 6
ASGNI4
line 211
;210:		// drop a total of 40 units over its lifetime
;211:		blood->pos.trDelta[2] = 120;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
CNSTF4 1123024896
ASGNF4
line 212
;212:	}
LABELV $129
line 197
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
LABELV $131
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $128
line 213
;213:}
LABELV $124
endproc CG_SmallBloodTrail 48 48
export CG_FragmentBounceMark
proc CG_FragmentBounceMark 20 44
line 221
;214:
;215:
;216:/*
;217:================
;218:CG_FragmentBounceMark
;219:================
;220:*/
;221:void CG_FragmentBounceMark( localEntity_t *le, trace_t *trace ) {
line 224
;222:	int			radius;
;223:
;224:	if ( le->leMarkType == LEMT_BLOOD ) {
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
NEI4 $135
line 225
;225:		radius = 16 + (rand()&31);
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 16
ADDI4
ASGNI4
line 226
;226:		CG_ImpactMark( cgs.media.bloodMarkShader, trace->endpos, trace->plane.normal, random()*360,
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1500
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1135869952
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 228
;227:			1,1,1,1, qtrue, radius, qfalse );
;228:	} else if ( le->leMarkType == LEMT_BURN ) {
ADDRGP4 $136
JUMPV
LABELV $135
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $139
line 230
;229:
;230:		radius = 8 + (rand()&15);
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 8
ADDI4
ASGNI4
line 231
;231:		CG_ImpactMark( cgs.media.burnMarkShader, trace->endpos, trace->plane.normal, random()*360,
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1508
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1135869952
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 233
;232:			1,1,1,1, qtrue, radius, qfalse );
;233:	}
LABELV $139
LABELV $136
line 238
;234:
;235:
;236:	// don't allow a fragment to make multiple marks, or they
;237:	// pile up while settling
;238:	le->leMarkType = LEMT_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 239
;239:}
LABELV $134
endproc CG_FragmentBounceMark 20 44
export CG_FragmentBounceSound
proc CG_FragmentBounceSound 16 16
line 246
;240:
;241:/*
;242:================
;243:CG_FragmentBounceSound
;244:================
;245:*/
;246:void CG_FragmentBounceSound( localEntity_t *le, trace_t *trace ) {
line 247
;247:	if ( le->leBounceSoundType == LEBS_BLOOD ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $144
line 249
;248:		// half the gibs will make splat sounds
;249:		if ( rand() & 1 ) {
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $145
line 250
;250:			int r = rand()&3;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 3
BANDI4
ASGNI4
line 253
;251:			sfxHandle_t	s;
;252:
;253:			if ( r == 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $148
line 254
;254:				s = cgs.media.gibBounce1Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2124
INDIRI4
ASGNI4
line 255
;255:			} else if ( r == 1 ) {
ADDRGP4 $149
JUMPV
LABELV $148
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $152
line 256
;256:				s = cgs.media.gibBounce2Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2128
INDIRI4
ASGNI4
line 257
;257:			} else {
ADDRGP4 $153
JUMPV
LABELV $152
line 258
;258:				s = cgs.media.gibBounce3Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2132
INDIRI4
ASGNI4
line 259
;259:			}
LABELV $153
LABELV $149
line 260
;260:			trap_S_StartSound( trace->endpos, ENTITYNUM_WORLD, CHAN_AUTO, s );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
CNSTI4 4094
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 261
;261:		}
line 262
;262:	} else if ( le->leBounceSoundType == LEBS_BRASS ) {
ADDRGP4 $145
JUMPV
LABELV $144
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $158
line 263
;263:		if ( cg_leiBrassNoise.integer ) {
ADDRGP4 cg_leiBrassNoise+12
INDIRI4
CNSTI4 0
EQI4 $159
line 265
;264:		// half the casings will make  casing sounds
;265:		if ( rand() & 1 ) {
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $159
line 266
;266:			int r = rand()&3;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 3
BANDI4
ASGNI4
line 269
;267:			sfxHandle_t	s;
;268:
;269:			if ( r == 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $165
line 270
;270:				s = cgs.media.lbul1Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2180
INDIRI4
ASGNI4
line 271
;271:			} else if ( r == 1 ) {
ADDRGP4 $166
JUMPV
LABELV $165
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $169
line 272
;272:				s = cgs.media.lbul2Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2184
INDIRI4
ASGNI4
line 273
;273:			} else {
ADDRGP4 $170
JUMPV
LABELV $169
line 274
;274:				s = cgs.media.lbul3Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2188
INDIRI4
ASGNI4
line 275
;275:			}
LABELV $170
LABELV $166
line 276
;276:			trap_S_StartSound( trace->endpos, ENTITYNUM_WORLD, CHAN_AUTO, s );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
CNSTI4 4094
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 277
;277:			}
line 278
;278:		}
line 280
;279:
;280:	} else if ( le->leBounceSoundType == LEBS_SHELL ) {
ADDRGP4 $159
JUMPV
LABELV $158
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
NEI4 $175
line 282
;281:		
;282:		if ( cg_leiBrassNoise.integer ) {
ADDRGP4 cg_leiBrassNoise+12
INDIRI4
CNSTI4 0
EQI4 $177
line 285
;283:			
;284:		// half the casings will make  casing sounds
;285:		if ( rand() & 1 ) {
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $180
line 286
;286:			int r = rand()&3;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 3
BANDI4
ASGNI4
line 289
;287:			sfxHandle_t	s;
;288:
;289:			if ( r == 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $182
line 290
;290:				s = cgs.media.lshl1Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2192
INDIRI4
ASGNI4
line 291
;291:			} else if ( r == 1 ) {
ADDRGP4 $183
JUMPV
LABELV $182
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $186
line 292
;292:				s = cgs.media.lshl2Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2196
INDIRI4
ASGNI4
line 293
;293:			} else {
ADDRGP4 $187
JUMPV
LABELV $186
line 294
;294:				s = cgs.media.lshl3Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2200
INDIRI4
ASGNI4
line 295
;295:			}
LABELV $187
LABELV $183
line 296
;296:			trap_S_StartSound( trace->endpos, ENTITYNUM_WORLD, CHAN_AUTO, s );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
CNSTI4 4094
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 297
;297:		}
LABELV $180
line 298
;298:		}
LABELV $177
line 300
;299:
;300:	}
LABELV $175
LABELV $159
LABELV $145
line 304
;301:
;302:	// don't allow a fragment to make multiple bounce sounds,
;303:	// or it gets too noisy as they settle
;304:	le->leBounceSoundType = LEBS_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 305
;305:}
LABELV $143
endproc CG_FragmentBounceSound 16 16
export CG_GoreMark
proc CG_GoreMark 20 44
line 309
;306:
;307:
;308:// LEILEI 
;309:void CG_GoreMark( localEntity_t *le, trace_t *trace ) {
line 312
;310:	int			radius;
;311:
;312:	if ( le->leMarkType == LEMT_BURN ) {
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $193
line 314
;313:
;314:		radius = 6 + (rand()&16);
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 6
ADDI4
ASGNI4
line 315
;315:		CG_ImpactMark( cgs.media.lbldShader2, trace->endpos, trace->plane.normal, random()*360,
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cgs+956380+1344
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1135869952
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ARGF4
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 318
;316:			1,1,1,1, qtrue, radius, qfalse );
;317:	
;318:	}
LABELV $193
line 320
;319:
;320:	le->leMarkType = LEMT_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 321
;321:}
LABELV $192
endproc CG_GoreMark 20 44
export CG_SplatSound
proc CG_SplatSound 16 16
line 329
;322:
;323:
;324:/*
;325:================
;326:CG_SplatSound LEILEI
;327:================
;328:*/
;329:void CG_SplatSound( localEntity_t *le, trace_t *trace ) {
line 330
;330:	if ( le->leBounceSoundType == LEBS_BLOOD ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $198
line 332
;331:		// half the splats will make splat sounds
;332:	if ( cg_leiGoreNoise.integer ) {
ADDRGP4 cg_leiGoreNoise+12
INDIRI4
CNSTI4 0
EQI4 $199
line 333
;333:		if ( rand() & 1 ) {
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $199
line 334
;334:			int r = rand()&3;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 3
BANDI4
ASGNI4
line 337
;335:			sfxHandle_t	s;
;336:
;337:			if ( r == 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $205
line 338
;338:				s = cgs.media.lspl1Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2168
INDIRI4
ASGNI4
line 339
;339:			} else if ( r == 1 ) {
ADDRGP4 $206
JUMPV
LABELV $205
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $209
line 340
;340:				s = cgs.media.lspl2Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2172
INDIRI4
ASGNI4
line 341
;341:			} else {
ADDRGP4 $210
JUMPV
LABELV $209
line 342
;342:				s = cgs.media.lspl3Sound;
ADDRLP4 8
ADDRGP4 cgs+956380+2176
INDIRI4
ASGNI4
line 343
;343:			}
LABELV $210
LABELV $206
line 344
;344:			trap_S_StartSound( trace->endpos, ENTITYNUM_WORLD, CHAN_AUTO, s );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
CNSTI4 4094
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 345
;345:		}
line 346
;346:		}
line 347
;347:	} else if ( le->leBounceSoundType == LEBS_BRASS ) {
ADDRGP4 $199
JUMPV
LABELV $198
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $215
line 349
;348:		// no GERMAN EURO CENSOR ROBOTS mode yet.
;349:	}
LABELV $215
LABELV $199
line 353
;350:
;351:	// don't allow a fragment to make multiple bounce sounds,
;352:	// or it gets too noisy as they settle
;353:	le->leBounceSoundType = LEBS_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 354
;354:}
LABELV $197
endproc CG_SplatSound 16 16
export CG_ReflectVelocity
proc CG_ReflectVelocity 56 12
line 363
;355:
;356:
;357:
;358:/*
;359:================
;360:CG_ReflectVelocity
;361:================
;362:*/
;363:void CG_ReflectVelocity( localEntity_t *le, trace_t *trace ) {
line 369
;364:	vec3_t	velocity;
;365:	float	dot;
;366:	int		hitTime;
;367:
;368:	// reflect the velocity on the trace plane
;369:	hitTime = cg.time - cg.frametime + cg.frametime * trace->fraction;
ADDRLP4 16
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1868888
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg+1868888
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 370
;370:	BG_EvaluateTrajectoryDelta( &le->pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 371
;371:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 372
;372:	VectorMA( velocity, -2*dot, trace->plane.normal, le->pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 374
;373:
;374:	VectorScale( le->pos.trDelta, le->bounceFactor, le->pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
line 376
;375:
;376:	VectorCopy( trace->endpos, le->pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 377
;377:	le->pos.trTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 381
;378:
;379:
;380:	// check for stop, making sure that even on low FPS systems it doesn't bobble
;381:	if ( trace->allsolid || 
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $230
ADDRLP4 48
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $226
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1109393408
LTF4 $230
ADDRLP4 52
INDIRF4
ADDRGP4 cg+1868888
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 52
INDIRF4
MULF4
GEF4 $226
LABELV $230
line 383
;382:		( trace->plane.normal[2] > 0 && 
;383:		( le->pos.trDelta[2] < 40 || le->pos.trDelta[2] < -cg.frametime * le->pos.trDelta[2] ) ) ) {
line 384
;384:		le->pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 0
ASGNI4
line 385
;385:	} else {
LABELV $226
line 387
;386:
;387:	}
LABELV $227
line 388
;388:}
LABELV $217
endproc CG_ReflectVelocity 56 12
export CG_AddFragment
proc CG_AddFragment 88 28
line 395
;389:
;390:/*
;391:================
;392:CG_AddFragment
;393:================
;394:*/
;395:void CG_AddFragment( localEntity_t *le ) {
line 399
;396:	vec3_t	newOrigin;
;397:	trace_t	trace;
;398:
;399:	if ( le->pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
NEI4 $232
line 404
;400:		// sink into the ground if near the removal time
;401:		int		t;
;402:		float	oldZ;
;403:		
;404:		t = le->endTime - cg.time;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
ASGNI4
line 405
;405:		if ( t < SINK_TIME ) {
ADDRLP4 68
INDIRI4
CNSTI4 3000
GEI4 $235
line 409
;406:			// we must use an explicit lighting origin, otherwise the
;407:			// lighting would be lost as soon as the origin went
;408:			// into the ground
;409:			VectorCopy( le->refEntity.origin, le->refEntity.lightingOrigin );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 224
ADDP4
INDIRB
ASGNB 12
line 410
;410:			le->refEntity.renderfx |= RF_LIGHTING_ORIGIN;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 411
;411:			oldZ = le->refEntity.origin[2];
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ASGNF4
line 412
;412:			le->refEntity.origin[2] -= 16 * ( 1.0 - (float)t / SINK_TIME );
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
CNSTF4 1098907648
CNSTF4 1065353216
ADDRLP4 68
INDIRI4
CVIF4 4
CNSTF4 1161527296
DIVF4
SUBF4
MULF4
SUBF4
ASGNF4
line 413
;413:			trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 414
;414:			le->refEntity.origin[2] = oldZ;
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 72
INDIRF4
ASGNF4
line 415
;415:		} else {
ADDRGP4 $231
JUMPV
LABELV $235
line 416
;416:			trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 417
;417:		}
line 419
;418:
;419:		return;
ADDRGP4 $231
JUMPV
LABELV $232
line 423
;420:	}
;421:
;422:	// calculate new position
;423:	BG_EvaluateTrajectory( &le->pos, cg.time, newOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 428
;424:	
;425:	//le->leTrailType = LETT_DEBRIS_CONCRETE;
;426:
;427:	// trace a line from previous position to new position
;428:	CG_Trace( &trace, le->refEntity.origin, NULL, NULL, newOrigin, -1, CONTENTS_SOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 68
CNSTP4 0
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 429
;429:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $238
line 431
;430:		// still in free fall
;431:		VectorCopy( newOrigin, le->refEntity.origin );
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ADDRLP4 56
INDIRB
ASGNB 12
line 433
;432:
;433:		if ( le->leFlags & LEF_TUMBLE ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $241
line 436
;434:			vec3_t angles;
;435:
;436:			BG_EvaluateTrajectory( &le->angles, cg.time, angles );
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 72
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 437
;437:			AnglesToAxis( angles, le->refEntity.axis );
ADDRLP4 72
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 438
;438:		}
LABELV $241
line 440
;439:
;440:		trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 443
;441:
;442:		// add a puff trail
;443:		CG_PuffTrail( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PuffTrail
CALLV
pop
line 444
;444:		return;
ADDRGP4 $231
JUMPV
LABELV $238
line 450
;445:	}
;446:
;447:	// if it is in a nodrop zone, remove it
;448:	// this keeps gibs from waiting at the bottom of pits of death
;449:	// and floating levels
;450:	if ( CG_PointContents( trace.endpos, 0 ) & CONTENTS_NODROP ) {
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $244
line 451
;451:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 452
;452:		return;
ADDRGP4 $231
JUMPV
LABELV $244
line 456
;453:	}
;454:
;455:	// leave a mark
;456:	CG_FragmentBounceMark( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FragmentBounceMark
CALLV
pop
line 459
;457:
;458:	// do a bouncy sound
;459:	CG_FragmentBounceSound( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FragmentBounceSound
CALLV
pop
line 462
;460:
;461:	// reflect the velocity on the trace plane
;462:	CG_ReflectVelocity( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_ReflectVelocity
CALLV
pop
line 464
;463:
;464:	trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 465
;465:}
LABELV $231
endproc CG_AddFragment 88 28
export CG_AddFragment2
proc CG_AddFragment2 88 28
line 472
;466:
;467:/*
;468:================
;469:CG_AddFragment2
;470:================
;471:*/
;472:void CG_AddFragment2( localEntity_t *le ) {
line 476
;473:	vec3_t	newOrigin;
;474:	trace_t	trace;
;475:
;476:	if ( le->pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
NEI4 $248
line 481
;477:		// sink into the ground if near the removal time
;478:		int		t;
;479:		float	oldZ;
;480:		
;481:		t = le->endTime - cg.time;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
ASGNI4
line 482
;482:		if ( t < SINK_TIME ) {
ADDRLP4 68
INDIRI4
CNSTI4 3000
GEI4 $251
line 486
;483:			// we must use an explicit lighting origin, otherwise the
;484:			// lighting would be lost as soon as the origin went
;485:			// into the ground
;486:			VectorCopy( le->refEntity.origin, le->refEntity.lightingOrigin );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 224
ADDP4
INDIRB
ASGNB 12
line 487
;487:			le->refEntity.renderfx |= RF_LIGHTING_ORIGIN;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 488
;488:			oldZ = le->refEntity.origin[2];
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ASGNF4
line 489
;489:			le->refEntity.origin[2] -= 16 * ( 1.0 - (float)t / SINK_TIME );
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
CNSTF4 1098907648
CNSTF4 1065353216
ADDRLP4 68
INDIRI4
CVIF4 4
CNSTF4 1161527296
DIVF4
SUBF4
MULF4
SUBF4
ASGNF4
line 490
;490:			trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 491
;491:			le->refEntity.origin[2] = oldZ;
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 72
INDIRF4
ASGNF4
line 492
;492:		} else {
ADDRGP4 $247
JUMPV
LABELV $251
line 493
;493:			trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 494
;494:		}
line 496
;495:
;496:		return;
ADDRGP4 $247
JUMPV
LABELV $248
line 500
;497:	}
;498:
;499:	// calculate new position
;500:	BG_EvaluateTrajectory( &le->pos, cg.time, newOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 502
;501:	
;502:	le->leTrailType = LETT_BLOOD;
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 1
ASGNI4
line 505
;503:
;504:	// trace a line from previous position to new position
;505:	CG_Trace( &trace, le->refEntity.origin, NULL, NULL, newOrigin, -1, CONTENTS_SOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 68
CNSTP4 0
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 506
;506:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $254
line 508
;507:		// still in free fall
;508:		VectorCopy( newOrigin, le->refEntity.origin );
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ADDRLP4 56
INDIRB
ASGNB 12
line 510
;509:
;510:		if ( le->leFlags & LEF_TUMBLE ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $257
line 513
;511:			vec3_t angles;
;512:
;513:			BG_EvaluateTrajectory( &le->angles, cg.time, angles );
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 72
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 514
;514:			AnglesToAxis( angles, le->refEntity.axis );
ADDRLP4 72
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 515
;515:		}
LABELV $257
line 517
;516:
;517:		trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 520
;518:
;519:		// add a puff trail
;520:		CG_PuffTrail( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PuffTrail
CALLV
pop
line 521
;521:		return;
ADDRGP4 $247
JUMPV
LABELV $254
line 527
;522:	}
;523:
;524:	// if it is in a nodrop zone, remove it
;525:	// this keeps gibs from waiting at the bottom of pits of death
;526:	// and floating levels
;527:	if ( CG_PointContents( trace.endpos, 0 ) & CONTENTS_NODROP ) {
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $260
line 528
;528:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 529
;529:		return;
ADDRGP4 $247
JUMPV
LABELV $260
line 533
;530:	}
;531:
;532:	// leave a mark
;533:	CG_FragmentBounceMark( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FragmentBounceMark
CALLV
pop
line 536
;534:
;535:	// do a bouncy sound
;536:	CG_FragmentBounceSound( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FragmentBounceSound
CALLV
pop
line 539
;537:
;538:	// reflect the velocity on the trace plane
;539:	CG_ReflectVelocity( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_ReflectVelocity
CALLV
pop
line 541
;540:
;541:	trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 542
;542:}
LABELV $247
endproc CG_AddFragment2 88 28
export CG_JustSplat
proc CG_JustSplat 56 12
line 546
;543:
;544:// LEILEI
;545:
;546:void CG_JustSplat( localEntity_t *le, trace_t *trace ) {
line 552
;547:	vec3_t	velocity;
;548:	float	dot;
;549:	int		hitTime;
;550:
;551:	// reflect the velocity on the trace plane
;552:	hitTime = cg.time - cg.frametime + cg.frametime * trace->fraction;
ADDRLP4 16
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1868888
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg+1868888
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 553
;553:	BG_EvaluateTrajectoryDelta( &le->pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 554
;554:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 555
;555:	VectorMA( velocity, -2*dot, trace->plane.normal, le->pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 557
;556:
;557:	VectorScale( le->pos.trDelta, le->bounceFactor, le->pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
MULF4
ASGNF4
line 559
;558:
;559:	VectorCopy( trace->endpos, le->pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 560
;560:	le->pos.trTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 564
;561:
;562:
;563:	// check for stop, making sure that even on low FPS systems it doesn't bobble
;564:	if ( trace->allsolid || 
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $276
ADDRLP4 48
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $272
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1109393408
LTF4 $276
ADDRLP4 52
INDIRF4
ADDRGP4 cg+1868888
INDIRI4
NEGI4
CVIF4 4
ADDRLP4 52
INDIRF4
MULF4
GEF4 $272
LABELV $276
line 566
;565:		( trace->plane.normal[2] > 0 && 
;566:		( le->pos.trDelta[2] < 40 || le->pos.trDelta[2] < -cg.frametime * le->pos.trDelta[2] ) ) ) {
line 567
;567:		le->pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTI4 0
ASGNI4
line 568
;568:	} else {
LABELV $272
line 570
;569:
;570:	}
LABELV $273
line 571
;571:}
LABELV $263
endproc CG_JustSplat 56 12
export CG_AddGore
proc CG_AddGore 84 28
line 573
;572:
;573:void CG_AddGore( localEntity_t *le ) {
line 577
;574:	vec3_t	newOrigin;
;575:	trace_t	trace;
;576:
;577:	if ( le->pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
NEI4 $278
line 582
;578:		// sink into the ground if near the removal time
;579:		//int		t;
;580:		//float	oldZ;
;581:		
;582:		CG_FreeLocalEntity( le ); // kill it
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 584
;583:
;584:		return;
ADDRGP4 $277
JUMPV
LABELV $278
line 588
;585:	}
;586:
;587:	// calculate new position
;588:	BG_EvaluateTrajectory( &le->pos, cg.time, newOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 591
;589:
;590:	// trace a line from previous position to new position
;591:	CG_Trace( &trace, le->refEntity.origin, NULL, NULL, newOrigin, -1, CONTENTS_SOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 68
CNSTP4 0
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 592
;592:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $281
line 594
;593:		// still in free fall
;594:		VectorCopy( newOrigin, le->refEntity.origin );
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ADDRLP4 56
INDIRB
ASGNB 12
line 596
;595:
;596:		if ( le->leFlags & LEF_TUMBLE ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $284
line 599
;597:			vec3_t angles;
;598:
;599:			BG_EvaluateTrajectory( &le->angles, cg.time, angles );
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 72
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 600
;600:			AnglesToAxis( angles, le->refEntity.axis );
ADDRLP4 72
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 601
;601:		}
LABELV $284
line 603
;602:
;603:		trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 605
;604:
;605:		CG_SmallBloodTrail( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SmallBloodTrail
CALLV
pop
line 607
;606:	
;607:		return;
ADDRGP4 $277
JUMPV
LABELV $281
line 613
;608:	}
;609:
;610:	// if it is in a nodrop zone, remove it
;611:	// this keeps gibs from waiting at the bottom of pits of death
;612:	// and floating levels
;613:	if ( trap_CM_PointContents( trace.endpos, 0 ) & CONTENTS_NODROP ) {
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $287
line 614
;614:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 615
;615:		return;
ADDRGP4 $277
JUMPV
LABELV $287
line 619
;616:	}
;617:
;618:	// leave a mark
;619:	CG_GoreMark( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_GoreMark
CALLV
pop
line 622
;620:
;621:	// do a juicy sound
;622:	CG_SplatSound( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_SplatSound
CALLV
pop
line 624
;623:
;624:	CG_JustSplat( le, &trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_JustSplat
CALLV
pop
line 626
;625:
;626:	trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 627
;627:}
LABELV $277
endproc CG_AddGore 84 28
export CG_AddFadeRGB
proc CG_AddFadeRGB 60 4
line 643
;628:
;629:/*
;630:=====================================================================
;631:
;632:TRIVIAL LOCAL ENTITIES
;633:
;634:These only do simple scaling or modulation before passing to the renderer
;635:=====================================================================
;636:*/
;637:
;638:/*
;639:====================
;640:CG_AddFadeRGB
;641:====================
;642:*/
;643:void CG_AddFadeRGB( localEntity_t *le ) {
line 647
;644:	refEntity_t *re;
;645:	float c;
;646:
;647:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
line 649
;648:
;649:	c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 650
;650:	c *= 0xff;
ADDRLP4 4
CNSTF4 1132396544
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 652
;651:
;652:	re->shaderRGBA[0] = le->color[0] * c;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
CNSTF4 1325400064
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
LTF4 $293
ADDRLP4 12
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $294
JUMPV
LABELV $293
ADDRLP4 12
ADDRLP4 16
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $294
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 12
INDIRU4
CVUU1 4
ASGNU1
line 653
;653:	re->shaderRGBA[1] = le->color[1] * c;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
CNSTF4 1325400064
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRF4
LTF4 $296
ADDRLP4 24
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $297
JUMPV
LABELV $296
ADDRLP4 24
ADDRLP4 28
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $297
ADDRLP4 0
INDIRP4
CNSTI4 117
ADDP4
ADDRLP4 24
INDIRU4
CVUU1 4
ASGNU1
line 654
;654:	re->shaderRGBA[2] = le->color[2] * c;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 44
CNSTF4 1325400064
ASGNF4
ADDRLP4 40
INDIRF4
ADDRLP4 44
INDIRF4
LTF4 $299
ADDRLP4 36
ADDRLP4 40
INDIRF4
ADDRLP4 44
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $300
JUMPV
LABELV $299
ADDRLP4 36
ADDRLP4 40
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $300
ADDRLP4 0
INDIRP4
CNSTI4 118
ADDP4
ADDRLP4 36
INDIRU4
CVUU1 4
ASGNU1
line 655
;655:	re->shaderRGBA[3] = le->color[3] * c;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 56
CNSTF4 1325400064
ASGNF4
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRF4
LTF4 $302
ADDRLP4 48
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $303
JUMPV
LABELV $302
ADDRLP4 48
ADDRLP4 52
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $303
ADDRLP4 0
INDIRP4
CNSTI4 119
ADDP4
ADDRLP4 48
INDIRU4
CVUU1 4
ASGNU1
line 657
;656:
;657:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 658
;658:}
LABELV $290
endproc CG_AddFadeRGB 60 4
proc CG_AddMoveScaleFade 52 12
line 665
;659:
;660:/*
;661:==================
;662:CG_AddMoveScaleFade
;663:==================
;664:*/
;665:static void CG_AddMoveScaleFade( localEntity_t *le ) {
line 671
;666:	refEntity_t	*re;
;667:	float		c;
;668:	vec3_t		delta;
;669:	float		len;
;670:
;671:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
line 673
;672:
;673:	if ( le->fadeInTime > le->startTime && cg.time < le->fadeInTime ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LEI4 $305
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $305
line 675
;674:		// fade / grow time
;675:		c = 1.0 - (float) ( le->fadeInTime - cg.time ) / ( le->fadeInTime - le->startTime );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
CNSTF4 1065353216
ADDRLP4 36
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 676
;676:	}
ADDRGP4 $306
JUMPV
LABELV $305
line 677
;677:	else {
line 679
;678:		// fade / grow time
;679:		c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 32
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 680
;680:	}
LABELV $306
line 682
;681:
;682:	re->shaderRGBA[3] = 0xff * c * le->color[3];
ADDRLP4 36
CNSTF4 1132396544
ADDRLP4 16
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
CNSTF4 1325400064
ASGNF4
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
LTF4 $311
ADDRLP4 32
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $312
JUMPV
LABELV $311
ADDRLP4 32
ADDRLP4 36
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $312
ADDRLP4 0
INDIRP4
CNSTI4 119
ADDP4
ADDRLP4 32
INDIRU4
CVUU1 4
ASGNU1
line 684
;683:
;684:	if ( !( le->leFlags & LEF_PUFF_DONT_SCALE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $313
line 685
;685:		re->radius = le->radius * ( 1.0 - c ) + 8;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 16
INDIRF4
SUBF4
MULF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 686
;686:	}
LABELV $313
line 688
;687:
;688:	BG_EvaluateTrajectory( &le->pos, cg.time, re->origin );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 cg+1868892
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 692
;689:
;690:	// if the view would be "inside" the sprite, kill the sprite
;691:	// so it doesn't add too much overdraw
;692:	VectorSubtract( re->origin, cg.refdef.vieworg, delta );
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRGP4 cg+1870616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRGP4 cg+1870616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDRGP4 cg+1870616+24+8
INDIRF4
SUBF4
ASGNF4
line 693
;693:	len = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 48
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 694
;694:	if ( len < le->radius ) {
ADDRLP4 20
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
GEF4 $326
line 695
;695:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 696
;696:		return;
ADDRGP4 $304
JUMPV
LABELV $326
line 699
;697:	}
;698:
;699:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 700
;700:}
LABELV $304
endproc CG_AddMoveScaleFade 52 12
proc CG_AddScaleFade 48 4
line 712
;701:
;702:
;703:/*
;704:===================
;705:CG_AddScaleFade
;706:
;707:For rocket smokes that hang in place, fade out, and are
;708:removed if the view passes through them.
;709:There are often many of these, so it needs to be simple.
;710:===================
;711:*/
;712:static void CG_AddScaleFade( localEntity_t *le ) {
line 718
;713:	refEntity_t	*re;
;714:	float		c;
;715:	vec3_t		delta;
;716:	float		len;
;717:
;718:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
line 721
;719:
;720:	// fade / grow time
;721:	c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 723
;722:
;723:	re->shaderRGBA[3] = 0xff * c * le->color[3];
ADDRLP4 32
CNSTF4 1132396544
ADDRLP4 16
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
CNSTF4 1325400064
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $331
ADDRLP4 28
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $332
JUMPV
LABELV $331
ADDRLP4 28
ADDRLP4 32
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $332
ADDRLP4 0
INDIRP4
CNSTI4 119
ADDP4
ADDRLP4 28
INDIRU4
CVUU1 4
ASGNU1
line 724
;724:	re->radius = le->radius * ( 1.0 - c ) + 8;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 16
INDIRF4
SUBF4
MULF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 728
;725:
;726:	// if the view would be "inside" the sprite, kill the sprite
;727:	// so it doesn't add too much overdraw
;728:	VectorSubtract( re->origin, cg.refdef.vieworg, delta );
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRGP4 cg+1870616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRGP4 cg+1870616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDRGP4 cg+1870616+24+8
INDIRF4
SUBF4
ASGNF4
line 729
;729:	len = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 731
;730:	// LEILEI
;731:	if (!cg_leiEnhancement.integer) {
ADDRGP4 cg_leiEnhancement+12
INDIRI4
CNSTI4 0
NEI4 $343
line 732
;732:	if ( len < le->radius ) {
ADDRLP4 20
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
GEF4 $346
line 733
;733:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 734
;734:		return;
ADDRGP4 $328
JUMPV
LABELV $346
line 736
;735:	}
;736:		}
LABELV $343
line 737
;737:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 738
;738:}
LABELV $328
endproc CG_AddScaleFade 48 4
proc CG_AddFallScaleFade 52 4
line 751
;739:
;740:
;741:/*
;742:=================
;743:CG_AddFallScaleFade
;744:
;745:This is just an optimized CG_AddMoveScaleFade
;746:For blood mists that drift down, fade out, and are
;747:removed if the view passes through them.
;748:There are often 100+ of these, so it needs to be simple.
;749:=================
;750:*/
;751:static void CG_AddFallScaleFade( localEntity_t *le ) {
line 757
;752:	refEntity_t	*re;
;753:	float		c;
;754:	vec3_t		delta;
;755:	float		len;
;756:
;757:	re = &le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
line 760
;758:
;759:	// fade time
;760:	c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 762
;761:
;762:	re->shaderRGBA[3] = 0xff * c * le->color[3];
ADDRLP4 32
CNSTF4 1132396544
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
CNSTF4 1325400064
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $351
ADDRLP4 28
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $352
JUMPV
LABELV $351
ADDRLP4 28
ADDRLP4 32
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $352
ADDRLP4 0
INDIRP4
CNSTI4 119
ADDP4
ADDRLP4 28
INDIRU4
CVUU1 4
ASGNU1
line 764
;763:
;764:	re->origin[2] = le->pos.trBase[2] - ( 1.0 - c ) * le->pos.trDelta[2];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
SUBF4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 766
;765:
;766:	re->radius = le->radius * ( 1.0 - c ) + 16;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 4
INDIRF4
SUBF4
MULF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 770
;767:
;768:	// if the view would be "inside" the sprite, kill the sprite
;769:	// so it doesn't add too much overdraw
;770:	VectorSubtract( re->origin, cg.refdef.vieworg, delta );
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRGP4 cg+1870616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRGP4 cg+1870616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDRGP4 cg+1870616+24+8
INDIRF4
SUBF4
ASGNF4
line 771
;771:	len = VectorLength( delta );
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 774
;772:	
;773:	// LEILEI
;774:if (!cg_leiEnhancement.integer) {
ADDRGP4 cg_leiEnhancement+12
INDIRI4
CNSTI4 0
NEI4 $363
line 775
;775:	if ( len < le->radius ) {
ADDRLP4 20
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
GEF4 $366
line 776
;776:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 777
;777:		return;
ADDRGP4 $348
JUMPV
LABELV $366
line 779
;778:	}
;779:	}
LABELV $363
line 780
;780:	trap_R_AddRefEntityToScene( re );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 781
;781:}
LABELV $348
endproc CG_AddFallScaleFade 52 4
proc CG_AddExplosion 20 20
line 790
;782:
;783:
;784:
;785:/*
;786:================
;787:CG_AddExplosion
;788:================
;789:*/
;790:static void CG_AddExplosion( localEntity_t *ex ) {
line 793
;791:	refEntity_t	*ent;
;792:
;793:	ent = &ex->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
line 796
;794:
;795:	// add the entity
;796:	trap_R_AddRefEntityToScene(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 799
;797:
;798:	// add the dlight
;799:	if ( ex->light ) {
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
CNSTF4 0
EQF4 $369
line 802
;800:		float		light;
;801:
;802:		light = (float)( cg.time - ex->startTime ) / ( ex->endTime - ex->startTime );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 803
;803:		if ( light < 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
GEF4 $372
line 804
;804:			light = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 805
;805:		} else {
ADDRGP4 $373
JUMPV
LABELV $372
line 806
;806:			light = 1.0 - ( light - 0.5 ) * 2;
ADDRLP4 4
CNSTF4 1065353216
CNSTF4 1073741824
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
SUBF4
MULF4
SUBF4
ASGNF4
line 807
;807:		}
LABELV $373
line 808
;808:		light = ex->light * light;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 809
;809:		trap_R_AddLightToScene(ent->origin, light, ex->lightColor[0], ex->lightColor[1], ex->lightColor[2] );
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 810
;810:	}
LABELV $369
line 811
;811:}
LABELV $368
endproc CG_AddExplosion 20 20
proc CG_AddSpriteExplosion 216 20
line 818
;812:
;813:/*
;814:================
;815:CG_AddSpriteExplosion
;816:================
;817:*/
;818:static void CG_AddSpriteExplosion( localEntity_t *le ) {
line 822
;819:	refEntity_t	re;
;820:	float c;
;821:
;822:	re = le->refEntity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 176
line 824
;823:
;824:	c = ( le->endTime - cg.time ) / ( float ) ( le->endTime - le->startTime );
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
ADDRLP4 180
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 176
ADDRLP4 184
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 184
INDIRI4
ADDRLP4 180
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 825
;825:	if ( c > 1 ) {
ADDRLP4 176
INDIRF4
CNSTF4 1065353216
LEF4 $376
line 826
;826:		c = 1.0;	// can happen during connection problems
ADDRLP4 176
CNSTF4 1065353216
ASGNF4
line 827
;827:	}
LABELV $376
line 829
;828:
;829:	re.shaderRGBA[0] = 0xff;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 830
;830:	re.shaderRGBA[1] = 0xff;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 831
;831:	re.shaderRGBA[2] = 0xff;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 832
;832:	re.shaderRGBA[3] = 0xff * c * 0.33;
ADDRLP4 192
CNSTF4 1051260355
CNSTF4 1132396544
ADDRLP4 176
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 196
CNSTF4 1325400064
ASGNF4
ADDRLP4 192
INDIRF4
ADDRLP4 196
INDIRF4
LTF4 $386
ADDRLP4 188
ADDRLP4 192
INDIRF4
ADDRLP4 196
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $387
JUMPV
LABELV $386
ADDRLP4 188
ADDRLP4 192
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $387
ADDRLP4 0+116+3
ADDRLP4 188
INDIRU4
CVUU1 4
ASGNU1
line 834
;833:
;834:	re.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 835
;835:	re.radius = 42 * ( 1.0 - c ) + 30;
ADDRLP4 0+132
CNSTF4 1109917696
CNSTF4 1065353216
ADDRLP4 176
INDIRF4
SUBF4
MULF4
CNSTF4 1106247680
ADDF4
ASGNF4
line 837
;836:
;837:	trap_R_AddRefEntityToScene( &re );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 840
;838:
;839:	// add the dlight
;840:	if ( le->light ) {
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
CNSTF4 0
EQF4 $389
line 843
;841:		float		light;
;842:
;843:		light = (float)( cg.time - le->startTime ) / ( le->endTime - le->startTime );
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
ADDRLP4 204
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 200
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 208
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 204
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 208
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 844
;844:		if ( light < 0.5 ) {
ADDRLP4 200
INDIRF4
CNSTF4 1056964608
GEF4 $392
line 845
;845:			light = 1.0;
ADDRLP4 200
CNSTF4 1065353216
ASGNF4
line 846
;846:		} else {
ADDRGP4 $393
JUMPV
LABELV $392
line 847
;847:			light = 1.0 - ( light - 0.5 ) * 2;
ADDRLP4 200
CNSTF4 1065353216
CNSTF4 1073741824
ADDRLP4 200
INDIRF4
CNSTF4 1056964608
SUBF4
MULF4
SUBF4
ASGNF4
line 848
;848:		}
LABELV $393
line 849
;849:		light = le->light * light;
ADDRLP4 200
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ADDRLP4 200
INDIRF4
MULF4
ASGNF4
line 850
;850:		trap_R_AddLightToScene(re.origin, light, le->lightColor[0], le->lightColor[1], le->lightColor[2] );
ADDRLP4 0+68
ARGP4
ADDRLP4 200
INDIRF4
ARGF4
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
ARGF4
ADDRLP4 212
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 212
INDIRP4
CNSTI4 140
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 851
;851:	}
LABELV $389
line 852
;852:}
LABELV $374
endproc CG_AddSpriteExplosion 216 20
export CG_AddKamikaze
proc CG_AddKamikaze 308 20
line 861
;853:
;854:
;855:
;856:/*
;857:====================
;858:CG_AddKamikaze
;859:====================
;860:*/
;861:void CG_AddKamikaze( localEntity_t *le ) {
line 868
;862:	refEntity_t	*re;
;863:	refEntity_t shockwave;
;864:	float		c;
;865:	vec3_t		test, axis[3];
;866:	int			t;
;867:
;868:	re = &le->refEntity;
ADDRLP4 216
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
line 870
;869:
;870:	t = cg.time - le->startTime;
ADDRLP4 220
ADDRGP4 cg+1868892
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 871
;871:	VectorClear( test );
ADDRLP4 236
CNSTF4 0
ASGNF4
ADDRLP4 224+8
ADDRLP4 236
INDIRF4
ASGNF4
ADDRLP4 224+4
ADDRLP4 236
INDIRF4
ASGNF4
ADDRLP4 224
ADDRLP4 236
INDIRF4
ASGNF4
line 872
;872:	AnglesToAxis( test, axis );
ADDRLP4 224
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 874
;873:
;874:	if (t > KAMI_SHOCKWAVE_STARTTIME && t < KAMI_SHOCKWAVE_ENDTIME) {
ADDRLP4 220
INDIRI4
CNSTI4 0
LEI4 $399
ADDRLP4 220
INDIRI4
CNSTI4 2000
GEI4 $399
line 876
;875:
;876:		if (!(le->leFlags & LEF_SOUND1)) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $401
line 878
;877://			trap_S_StartSound (re->origin, ENTITYNUM_WORLD, CHAN_AUTO, cgs.media.kamikazeExplodeSound );
;878:			trap_S_StartLocalSound(cgs.media.kamikazeExplodeSound, CHAN_AUTO);
ADDRGP4 cgs+956380+2060
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 879
;879:			le->leFlags |= LEF_SOUND1;
ADDRLP4 244
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 244
INDIRP4
ADDRLP4 244
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 880
;880:		}
LABELV $401
line 882
;881:		// 1st kamikaze shockwave
;882:		memset(&shockwave, 0, sizeof(shockwave));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 883
;883:		shockwave.hModel = cgs.media.kamikazeShockWave;
ADDRLP4 4+8
ADDRGP4 cgs+956380+1696
INDIRI4
ASGNI4
line 884
;884:		shockwave.reType = RT_MODEL;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 885
;885:		shockwave.shaderTime = re->shaderTime;
ADDRLP4 4+128
ADDRLP4 216
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ASGNF4
line 886
;886:		VectorCopy(re->origin, shockwave.origin);
ADDRLP4 4+68
ADDRLP4 216
INDIRP4
CNSTI4 68
ADDP4
INDIRB
ASGNB 12
line 888
;887:
;888:		c = (float)(t - KAMI_SHOCKWAVE_STARTTIME) / (float)(KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME);
ADDRLP4 0
ADDRLP4 220
INDIRI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ASGNF4
line 889
;889:		VectorScale( axis[0], c * KAMI_SHOCKWAVE_MAXRADIUS / KAMI_SHOCKWAVEMODEL_RADIUS, shockwave.axis[0] );
ADDRLP4 4+28
ADDRLP4 180
INDIRF4
CNSTF4 1151664128
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+4
ADDRLP4 180+4
INDIRF4
CNSTF4 1151664128
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+8
ADDRLP4 180+8
INDIRF4
CNSTF4 1151664128
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
line 890
;890:		VectorScale( axis[1], c * KAMI_SHOCKWAVE_MAXRADIUS / KAMI_SHOCKWAVEMODEL_RADIUS, shockwave.axis[1] );
ADDRLP4 4+28+12
ADDRLP4 180+12
INDIRF4
CNSTF4 1151664128
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+12+4
ADDRLP4 180+12+4
INDIRF4
CNSTF4 1151664128
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+12+8
ADDRLP4 180+12+8
INDIRF4
CNSTF4 1151664128
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
line 891
;891:		VectorScale( axis[2], c * KAMI_SHOCKWAVE_MAXRADIUS / KAMI_SHOCKWAVEMODEL_RADIUS, shockwave.axis[2] );
ADDRLP4 4+28+24
ADDRLP4 180+24
INDIRF4
CNSTF4 1151664128
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+24+4
ADDRLP4 180+24+4
INDIRF4
CNSTF4 1151664128
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+24+8
ADDRLP4 180+24+8
INDIRF4
CNSTF4 1151664128
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
line 892
;892:		shockwave.nonNormalizedAxes = qtrue;
ADDRLP4 4+64
CNSTI4 1
ASGNI4
line 894
;893:
;894:		if (t > KAMI_SHOCKWAVEFADE_STARTTIME) {
ADDRLP4 220
INDIRI4
CNSTI4 1500
LEI4 $444
line 895
;895:			c = (float)(t - KAMI_SHOCKWAVEFADE_STARTTIME) / (float)(KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVEFADE_STARTTIME);
ADDRLP4 0
ADDRLP4 220
INDIRI4
CNSTI4 1500
SUBI4
CVIF4 4
CNSTF4 1140457472
DIVF4
ASGNF4
line 896
;896:		}
ADDRGP4 $445
JUMPV
LABELV $444
line 897
;897:		else {
line 898
;898:			c = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 899
;899:		}
LABELV $445
line 900
;900:		c *= 0xff;
ADDRLP4 0
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 901
;901:		shockwave.shaderRGBA[0] = 0xff - c;
ADDRLP4 248
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 252
CNSTF4 1325400064
ASGNF4
ADDRLP4 248
INDIRF4
ADDRLP4 252
INDIRF4
LTF4 $448
ADDRLP4 244
ADDRLP4 248
INDIRF4
ADDRLP4 252
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $449
JUMPV
LABELV $448
ADDRLP4 244
ADDRLP4 248
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $449
ADDRLP4 4+116
ADDRLP4 244
INDIRU4
CVUU1 4
ASGNU1
line 902
;902:		shockwave.shaderRGBA[1] = 0xff - c;
ADDRLP4 260
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 264
CNSTF4 1325400064
ASGNF4
ADDRLP4 260
INDIRF4
ADDRLP4 264
INDIRF4
LTF4 $453
ADDRLP4 256
ADDRLP4 260
INDIRF4
ADDRLP4 264
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $454
JUMPV
LABELV $453
ADDRLP4 256
ADDRLP4 260
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $454
ADDRLP4 4+116+1
ADDRLP4 256
INDIRU4
CVUU1 4
ASGNU1
line 903
;903:		shockwave.shaderRGBA[2] = 0xff - c;
ADDRLP4 272
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 276
CNSTF4 1325400064
ASGNF4
ADDRLP4 272
INDIRF4
ADDRLP4 276
INDIRF4
LTF4 $458
ADDRLP4 268
ADDRLP4 272
INDIRF4
ADDRLP4 276
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $459
JUMPV
LABELV $458
ADDRLP4 268
ADDRLP4 272
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $459
ADDRLP4 4+116+2
ADDRLP4 268
INDIRU4
CVUU1 4
ASGNU1
line 904
;904:		shockwave.shaderRGBA[3] = 0xff - c;
ADDRLP4 284
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 288
CNSTF4 1325400064
ASGNF4
ADDRLP4 284
INDIRF4
ADDRLP4 288
INDIRF4
LTF4 $463
ADDRLP4 280
ADDRLP4 284
INDIRF4
ADDRLP4 288
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $464
JUMPV
LABELV $463
ADDRLP4 280
ADDRLP4 284
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $464
ADDRLP4 4+116+3
ADDRLP4 280
INDIRU4
CVUU1 4
ASGNU1
line 906
;905:
;906:		trap_R_AddRefEntityToScene( &shockwave );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 907
;907:	}
LABELV $399
line 909
;908:
;909:	if (t > KAMI_EXPLODE_STARTTIME && t < KAMI_IMPLODE_ENDTIME) {
ADDRLP4 220
INDIRI4
CNSTI4 250
LEI4 $465
ADDRLP4 220
INDIRI4
CNSTI4 2250
GEI4 $465
line 911
;910:		// explosion and implosion
;911:		c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 248
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 248
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 912
;912:		c *= 0xff;
ADDRLP4 0
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 913
;913:		re->shaderRGBA[0] = le->color[0] * c;
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 260
CNSTF4 1325400064
ASGNF4
ADDRLP4 256
INDIRF4
ADDRLP4 260
INDIRF4
LTF4 $469
ADDRLP4 252
ADDRLP4 256
INDIRF4
ADDRLP4 260
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $470
JUMPV
LABELV $469
ADDRLP4 252
ADDRLP4 256
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $470
ADDRLP4 216
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 252
INDIRU4
CVUU1 4
ASGNU1
line 914
;914:		re->shaderRGBA[1] = le->color[1] * c;
ADDRLP4 268
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 272
CNSTF4 1325400064
ASGNF4
ADDRLP4 268
INDIRF4
ADDRLP4 272
INDIRF4
LTF4 $472
ADDRLP4 264
ADDRLP4 268
INDIRF4
ADDRLP4 272
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $473
JUMPV
LABELV $472
ADDRLP4 264
ADDRLP4 268
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $473
ADDRLP4 216
INDIRP4
CNSTI4 117
ADDP4
ADDRLP4 264
INDIRU4
CVUU1 4
ASGNU1
line 915
;915:		re->shaderRGBA[2] = le->color[2] * c;
ADDRLP4 280
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 284
CNSTF4 1325400064
ASGNF4
ADDRLP4 280
INDIRF4
ADDRLP4 284
INDIRF4
LTF4 $475
ADDRLP4 276
ADDRLP4 280
INDIRF4
ADDRLP4 284
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $476
JUMPV
LABELV $475
ADDRLP4 276
ADDRLP4 280
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $476
ADDRLP4 216
INDIRP4
CNSTI4 118
ADDP4
ADDRLP4 276
INDIRU4
CVUU1 4
ASGNU1
line 916
;916:		re->shaderRGBA[3] = le->color[3] * c;
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 296
CNSTF4 1325400064
ASGNF4
ADDRLP4 292
INDIRF4
ADDRLP4 296
INDIRF4
LTF4 $478
ADDRLP4 288
ADDRLP4 292
INDIRF4
ADDRLP4 296
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $479
JUMPV
LABELV $478
ADDRLP4 288
ADDRLP4 292
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $479
ADDRLP4 216
INDIRP4
CNSTI4 119
ADDP4
ADDRLP4 288
INDIRU4
CVUU1 4
ASGNU1
line 918
;917:
;918:		if( t < KAMI_IMPLODE_STARTTIME ) {
ADDRLP4 220
INDIRI4
CNSTI4 2000
GEI4 $480
line 919
;919:			c = (float)(t - KAMI_EXPLODE_STARTTIME) / (float)(KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME);
ADDRLP4 0
ADDRLP4 220
INDIRI4
CNSTI4 250
SUBI4
CVIF4 4
CNSTF4 1155186688
DIVF4
ASGNF4
line 920
;920:		}
ADDRGP4 $481
JUMPV
LABELV $480
line 921
;921:		else {
line 922
;922:			if (!(le->leFlags & LEF_SOUND2)) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $482
line 924
;923://				trap_S_StartSound (re->origin, ENTITYNUM_WORLD, CHAN_AUTO, cgs.media.kamikazeImplodeSound );
;924:				trap_S_StartLocalSound(cgs.media.kamikazeImplodeSound, CHAN_AUTO);
ADDRGP4 cgs+956380+2064
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 925
;925:				le->leFlags |= LEF_SOUND2;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 926
;926:			}
LABELV $482
line 927
;927:			c = (float)(KAMI_IMPLODE_ENDTIME - t) / (float) (KAMI_IMPLODE_ENDTIME - KAMI_IMPLODE_STARTTIME);
ADDRLP4 0
CNSTI4 2250
ADDRLP4 220
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1132068864
DIVF4
ASGNF4
line 928
;928:		}
LABELV $481
line 929
;929:		VectorScale( axis[0], c * KAMI_BOOMSPHERE_MAXRADIUS / KAMI_BOOMSPHEREMODEL_RADIUS, re->axis[0] );
ADDRLP4 216
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 180
INDIRF4
CNSTF4 1144258560
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1116733440
DIVF4
MULF4
ASGNF4
ADDRLP4 216
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 180+4
INDIRF4
CNSTF4 1144258560
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1116733440
DIVF4
MULF4
ASGNF4
ADDRLP4 216
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 180+8
INDIRF4
CNSTF4 1144258560
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1116733440
DIVF4
MULF4
ASGNF4
line 930
;930:		VectorScale( axis[1], c * KAMI_BOOMSPHERE_MAXRADIUS / KAMI_BOOMSPHEREMODEL_RADIUS, re->axis[1] );
ADDRLP4 216
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 180+12
INDIRF4
CNSTF4 1144258560
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1116733440
DIVF4
MULF4
ASGNF4
ADDRLP4 216
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 180+12+4
INDIRF4
CNSTF4 1144258560
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1116733440
DIVF4
MULF4
ASGNF4
ADDRLP4 216
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 180+12+8
INDIRF4
CNSTF4 1144258560
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1116733440
DIVF4
MULF4
ASGNF4
line 931
;931:		VectorScale( axis[2], c * KAMI_BOOMSPHERE_MAXRADIUS / KAMI_BOOMSPHEREMODEL_RADIUS, re->axis[2] );
ADDRLP4 216
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 180+24
INDIRF4
CNSTF4 1144258560
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1116733440
DIVF4
MULF4
ASGNF4
ADDRLP4 216
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 180+24+4
INDIRF4
CNSTF4 1144258560
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1116733440
DIVF4
MULF4
ASGNF4
ADDRLP4 216
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 180+24+8
INDIRF4
CNSTF4 1144258560
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1116733440
DIVF4
MULF4
ASGNF4
line 932
;932:		re->nonNormalizedAxes = qtrue;
ADDRLP4 216
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 1
ASGNI4
line 934
;933:
;934:		trap_R_AddRefEntityToScene( re );
ADDRLP4 216
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 936
;935:		// add the dlight
;936:		trap_R_AddLightToScene( re->origin, c * 1000.0, 1.0, 1.0, c );
ADDRLP4 216
INDIRP4
CNSTI4 68
ADDP4
ARGP4
CNSTF4 1148846080
ADDRLP4 0
INDIRF4
MULF4
ARGF4
ADDRLP4 304
CNSTF4 1065353216
ASGNF4
ADDRLP4 304
INDIRF4
ARGF4
ADDRLP4 304
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 937
;937:	}
LABELV $465
line 939
;938:
;939:	if (t > KAMI_SHOCKWAVE2_STARTTIME && t < KAMI_SHOCKWAVE2_ENDTIME) {
ADDRLP4 220
INDIRI4
CNSTI4 2000
LEI4 $498
ADDRLP4 220
INDIRI4
CNSTI4 3000
GEI4 $498
line 941
;940:		// 2nd kamikaze shockwave
;941:		if (le->angles.trBase[0] == 0 &&
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
CNSTF4 0
ASGNF4
ADDRLP4 252
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ADDRLP4 256
INDIRF4
NEF4 $500
ADDRLP4 252
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ADDRLP4 256
INDIRF4
NEF4 $500
ADDRLP4 252
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ADDRLP4 256
INDIRF4
NEF4 $500
line 943
;942:			le->angles.trBase[1] == 0 &&
;943:			le->angles.trBase[2] == 0) {
line 944
;944:			le->angles.trBase[0] = random() * 360;
ADDRLP4 260
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 1135869952
ADDRLP4 260
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 945
;945:			le->angles.trBase[1] = random() * 360;
ADDRLP4 264
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTF4 1135869952
ADDRLP4 264
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 946
;946:			le->angles.trBase[2] = random() * 360;
ADDRLP4 268
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTF4 1135869952
ADDRLP4 268
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 947
;947:		}
ADDRGP4 $501
JUMPV
LABELV $500
line 948
;948:		else {
line 949
;949:			c = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 950
;950:		}
LABELV $501
line 951
;951:		memset(&shockwave, 0, sizeof(shockwave));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 952
;952:		shockwave.hModel = cgs.media.kamikazeShockWave;
ADDRLP4 4+8
ADDRGP4 cgs+956380+1696
INDIRI4
ASGNI4
line 953
;953:		shockwave.reType = RT_MODEL;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 954
;954:		shockwave.shaderTime = re->shaderTime;
ADDRLP4 4+128
ADDRLP4 216
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ASGNF4
line 955
;955:		VectorCopy(re->origin, shockwave.origin);
ADDRLP4 4+68
ADDRLP4 216
INDIRP4
CNSTI4 68
ADDP4
INDIRB
ASGNB 12
line 957
;956:
;957:		test[0] = le->angles.trBase[0];
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRF4
ASGNF4
line 958
;958:		test[1] = le->angles.trBase[1];
ADDRLP4 224+4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRF4
ASGNF4
line 959
;959:		test[2] = le->angles.trBase[2];
ADDRLP4 224+8
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRF4
ASGNF4
line 960
;960:		AnglesToAxis( test, axis );
ADDRLP4 224
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 962
;961:
;962:		c = (float)(t - KAMI_SHOCKWAVE2_STARTTIME) / (float)(KAMI_SHOCKWAVE2_ENDTIME - KAMI_SHOCKWAVE2_STARTTIME);
ADDRLP4 0
ADDRLP4 220
INDIRI4
CNSTI4 2000
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 963
;963:		VectorScale( axis[0], c * KAMI_SHOCKWAVE2_MAXRADIUS / KAMI_SHOCKWAVEMODEL_RADIUS, shockwave.axis[0] );
ADDRLP4 4+28
ADDRLP4 180
INDIRF4
CNSTF4 1143996416
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+4
ADDRLP4 180+4
INDIRF4
CNSTF4 1143996416
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+8
ADDRLP4 180+8
INDIRF4
CNSTF4 1143996416
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
line 964
;964:		VectorScale( axis[1], c * KAMI_SHOCKWAVE2_MAXRADIUS / KAMI_SHOCKWAVEMODEL_RADIUS, shockwave.axis[1] );
ADDRLP4 4+28+12
ADDRLP4 180+12
INDIRF4
CNSTF4 1143996416
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+12+4
ADDRLP4 180+12+4
INDIRF4
CNSTF4 1143996416
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+12+8
ADDRLP4 180+12+8
INDIRF4
CNSTF4 1143996416
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
line 965
;965:		VectorScale( axis[2], c * KAMI_SHOCKWAVE2_MAXRADIUS / KAMI_SHOCKWAVEMODEL_RADIUS, shockwave.axis[2] );
ADDRLP4 4+28+24
ADDRLP4 180+24
INDIRF4
CNSTF4 1143996416
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+24+4
ADDRLP4 180+24+4
INDIRF4
CNSTF4 1143996416
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
ADDRLP4 4+28+24+8
ADDRLP4 180+24+8
INDIRF4
CNSTF4 1143996416
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1118830592
DIVF4
MULF4
ASGNF4
line 966
;966:		shockwave.nonNormalizedAxes = qtrue;
ADDRLP4 4+64
CNSTI4 1
ASGNI4
line 968
;967:
;968:		if (t > KAMI_SHOCKWAVE2FADE_STARTTIME) {
ADDRLP4 220
INDIRI4
CNSTI4 2500
LEI4 $543
line 969
;969:			c = (float)(t - KAMI_SHOCKWAVE2FADE_STARTTIME) / (float)(KAMI_SHOCKWAVE2_ENDTIME - KAMI_SHOCKWAVE2FADE_STARTTIME);
ADDRLP4 0
ADDRLP4 220
INDIRI4
CNSTI4 2500
SUBI4
CVIF4 4
CNSTF4 1140457472
DIVF4
ASGNF4
line 970
;970:		}
ADDRGP4 $544
JUMPV
LABELV $543
line 971
;971:		else {
line 972
;972:			c = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 973
;973:		}
LABELV $544
line 974
;974:		c *= 0xff;
ADDRLP4 0
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 975
;975:		shockwave.shaderRGBA[0] = 0xff - c;
ADDRLP4 264
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 268
CNSTF4 1325400064
ASGNF4
ADDRLP4 264
INDIRF4
ADDRLP4 268
INDIRF4
LTF4 $547
ADDRLP4 260
ADDRLP4 264
INDIRF4
ADDRLP4 268
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $548
JUMPV
LABELV $547
ADDRLP4 260
ADDRLP4 264
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $548
ADDRLP4 4+116
ADDRLP4 260
INDIRU4
CVUU1 4
ASGNU1
line 976
;976:		shockwave.shaderRGBA[1] = 0xff - c;
ADDRLP4 276
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 280
CNSTF4 1325400064
ASGNF4
ADDRLP4 276
INDIRF4
ADDRLP4 280
INDIRF4
LTF4 $552
ADDRLP4 272
ADDRLP4 276
INDIRF4
ADDRLP4 280
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $553
JUMPV
LABELV $552
ADDRLP4 272
ADDRLP4 276
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $553
ADDRLP4 4+116+1
ADDRLP4 272
INDIRU4
CVUU1 4
ASGNU1
line 977
;977:		shockwave.shaderRGBA[2] = 0xff - c;
ADDRLP4 288
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 292
CNSTF4 1325400064
ASGNF4
ADDRLP4 288
INDIRF4
ADDRLP4 292
INDIRF4
LTF4 $557
ADDRLP4 284
ADDRLP4 288
INDIRF4
ADDRLP4 292
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $558
JUMPV
LABELV $557
ADDRLP4 284
ADDRLP4 288
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $558
ADDRLP4 4+116+2
ADDRLP4 284
INDIRU4
CVUU1 4
ASGNU1
line 978
;978:		shockwave.shaderRGBA[3] = 0xff - c;
ADDRLP4 300
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 304
CNSTF4 1325400064
ASGNF4
ADDRLP4 300
INDIRF4
ADDRLP4 304
INDIRF4
LTF4 $562
ADDRLP4 296
ADDRLP4 300
INDIRF4
ADDRLP4 304
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $563
JUMPV
LABELV $562
ADDRLP4 296
ADDRLP4 300
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $563
ADDRLP4 4+116+3
ADDRLP4 296
INDIRU4
CVUU1 4
ASGNU1
line 980
;979:
;980:		trap_R_AddRefEntityToScene( &shockwave );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 981
;981:	}
LABELV $498
line 982
;982:}
LABELV $395
endproc CG_AddKamikaze 308 20
export CG_AddInvulnerabilityImpact
proc CG_AddInvulnerabilityImpact 0 4
line 989
;983:
;984:/*
;985:===================
;986:CG_AddInvulnerabilityImpact
;987:===================
;988:*/
;989:void CG_AddInvulnerabilityImpact( localEntity_t *le ) {
line 990
;990:	trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 991
;991:}
LABELV $564
endproc CG_AddInvulnerabilityImpact 0 4
export CG_AddInvulnerabilityJuiced
proc CG_AddInvulnerabilityJuiced 4 4
line 998
;992:
;993:/*
;994:===================
;995:CG_AddInvulnerabilityJuiced
;996:===================
;997:*/
;998:void CG_AddInvulnerabilityJuiced( localEntity_t *le ) {
line 1001
;999:	int t;
;1000:
;1001:	t = cg.time - le->startTime;
ADDRLP4 0
ADDRGP4 cg+1868892
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1002
;1002:	if ( t > 3000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 3000
LEI4 $567
line 1003
;1003:		le->refEntity.axis[0][0] = (float) 1.0 + 0.3 * (t - 3000) / 2000;
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 1050253722
ADDRLP4 0
INDIRI4
CNSTI4 3000
SUBI4
CVIF4 4
MULF4
CNSTF4 1157234688
DIVF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1004
;1004:		le->refEntity.axis[1][1] = (float) 1.0 + 0.3 * (t - 3000) / 2000;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTF4 1050253722
ADDRLP4 0
INDIRI4
CNSTI4 3000
SUBI4
CVIF4 4
MULF4
CNSTF4 1157234688
DIVF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1005
;1005:		le->refEntity.axis[2][2] = (float) 0.7 + 0.3 * (2000 - (t - 3000)) / 2000;
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
CNSTF4 1050253722
CNSTI4 2000
ADDRLP4 0
INDIRI4
CNSTI4 3000
SUBI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1157234688
DIVF4
CNSTF4 1060320051
ADDF4
ASGNF4
line 1006
;1006:	}
LABELV $567
line 1007
;1007:	if ( t > 5000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
LEI4 $569
line 1008
;1008:		le->endTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 1009
;1009:		CG_GibPlayer( le->refEntity.origin );
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1010
;1010:	}
ADDRGP4 $570
JUMPV
LABELV $569
line 1011
;1011:	else {
line 1012
;1012:		trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1013
;1013:	}
LABELV $570
line 1014
;1014:}
LABELV $565
endproc CG_AddInvulnerabilityJuiced 4 4
export CG_AddRefEntity
proc CG_AddRefEntity 0 4
line 1021
;1015:
;1016:/*
;1017:===================
;1018:CG_AddRefEntity
;1019:===================
;1020:*/
;1021:void CG_AddRefEntity( localEntity_t *le ) {
line 1022
;1022:	if (le->endTime < cg.time) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
GEI4 $572
line 1023
;1023:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 1024
;1024:		return;
ADDRGP4 $571
JUMPV
LABELV $572
line 1026
;1025:	}
;1026:	trap_R_AddRefEntityToScene( &le->refEntity );
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1027
;1027:}
LABELV $571
endproc CG_AddRefEntity 0 4
lit
align 4
LABELV $576
byte 4 0
byte 4 0
byte 4 1065353216
export CG_AddScorePlum
code
proc CG_AddScorePlum 168 12
line 1037
;1028:
;1029:
;1030:/*
;1031:===================
;1032:CG_AddScorePlum
;1033:===================
;1034:*/
;1035:#define NUMBER_SIZE		12
;1036:
;1037:void CG_AddScorePlum( localEntity_t *le ) {
line 1039
;1038:	refEntity_t	*re;
;1039:	vec3_t		origin, delta, dir, vec, up = {0, 0, 1};
ADDRLP4 112
ADDRGP4 $576
INDIRB
ASGNB 12
line 1043
;1040:	float		c, len;
;1041:	int			i, score, digits[10], numdigits, negative;
;1042:
;1043:	re = &le->refEntity;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
line 1045
;1044:
;1045:	c = ( le->endTime - cg.time ) * le->lifeRate;
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 128
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 128
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 1047
;1046:
;1047:	score = le->radius;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1048
;1048:	if (score < 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $578
line 1049
;1049:		re->shaderRGBA[0] = 0xff;
ADDRLP4 8
INDIRP4
CNSTI4 116
ADDP4
CNSTU1 255
ASGNU1
line 1050
;1050:		re->shaderRGBA[1] = 0x11;
ADDRLP4 8
INDIRP4
CNSTI4 117
ADDP4
CNSTU1 17
ASGNU1
line 1051
;1051:		re->shaderRGBA[2] = 0x11;
ADDRLP4 8
INDIRP4
CNSTI4 118
ADDP4
CNSTU1 17
ASGNU1
line 1052
;1052:	}
ADDRGP4 $579
JUMPV
LABELV $578
line 1053
;1053:	else {
line 1054
;1054:		re->shaderRGBA[0] = 0xff;
ADDRLP4 8
INDIRP4
CNSTI4 116
ADDP4
CNSTU1 255
ASGNU1
line 1055
;1055:		re->shaderRGBA[1] = 0xff;
ADDRLP4 8
INDIRP4
CNSTI4 117
ADDP4
CNSTU1 255
ASGNU1
line 1056
;1056:		re->shaderRGBA[2] = 0xff;
ADDRLP4 8
INDIRP4
CNSTI4 118
ADDP4
CNSTU1 255
ASGNU1
line 1057
;1057:		if (score >= 50) {
ADDRLP4 12
INDIRI4
CNSTI4 50
LTI4 $580
line 1058
;1058:			re->shaderRGBA[1] = 0;
ADDRLP4 8
INDIRP4
CNSTI4 117
ADDP4
CNSTU1 0
ASGNU1
line 1059
;1059:		} else if (score >= 20) {
ADDRGP4 $581
JUMPV
LABELV $580
ADDRLP4 12
INDIRI4
CNSTI4 20
LTI4 $582
line 1060
;1060:			re->shaderRGBA[0] = re->shaderRGBA[1] = 0;
ADDRLP4 136
CNSTU1 0
ASGNU1
ADDRLP4 8
INDIRP4
CNSTI4 117
ADDP4
ADDRLP4 136
INDIRU1
ASGNU1
ADDRLP4 8
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 136
INDIRU1
ASGNU1
line 1061
;1061:		} else if (score >= 10) {
ADDRGP4 $583
JUMPV
LABELV $582
ADDRLP4 12
INDIRI4
CNSTI4 10
LTI4 $584
line 1062
;1062:			re->shaderRGBA[2] = 0;
ADDRLP4 8
INDIRP4
CNSTI4 118
ADDP4
CNSTU1 0
ASGNU1
line 1063
;1063:		} else if (score >= 2) {
ADDRGP4 $585
JUMPV
LABELV $584
ADDRLP4 12
INDIRI4
CNSTI4 2
LTI4 $586
line 1064
;1064:			re->shaderRGBA[0] = re->shaderRGBA[2] = 0;
ADDRLP4 136
CNSTU1 0
ASGNU1
ADDRLP4 8
INDIRP4
CNSTI4 118
ADDP4
ADDRLP4 136
INDIRU1
ASGNU1
ADDRLP4 8
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 136
INDIRU1
ASGNU1
line 1065
;1065:		}
LABELV $586
LABELV $585
LABELV $583
LABELV $581
line 1067
;1066:
;1067:	}
LABELV $579
line 1068
;1068:	if (c < 0.25)
ADDRLP4 80
INDIRF4
CNSTF4 1048576000
GEF4 $588
line 1069
;1069:		re->shaderRGBA[3] = 0xff * 4 * c;
ADDRLP4 136
CNSTF4 1149173760
ADDRLP4 80
INDIRF4
MULF4
ASGNF4
ADDRLP4 140
CNSTF4 1325400064
ASGNF4
ADDRLP4 136
INDIRF4
ADDRLP4 140
INDIRF4
LTF4 $591
ADDRLP4 132
ADDRLP4 136
INDIRF4
ADDRLP4 140
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $592
JUMPV
LABELV $591
ADDRLP4 132
ADDRLP4 136
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $592
ADDRLP4 8
INDIRP4
CNSTI4 119
ADDP4
ADDRLP4 132
INDIRU4
CVUU1 4
ASGNU1
ADDRGP4 $589
JUMPV
LABELV $588
line 1071
;1070:	else
;1071:		re->shaderRGBA[3] = 0xff;
ADDRLP4 8
INDIRP4
CNSTI4 119
ADDP4
CNSTU1 255
ASGNU1
LABELV $589
line 1073
;1072:
;1073:	re->radius = NUMBER_SIZE / 2;
ADDRLP4 8
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 1086324736
ASGNF4
line 1075
;1074:
;1075:	VectorCopy(le->pos.trBase, origin);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 12
line 1076
;1076:	origin[2] += 20 * 12 - c * 20 * 13;
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
CNSTF4 1131413504
CNSTF4 1095761920
CNSTF4 1101004800
ADDRLP4 80
INDIRF4
MULF4
MULF4
SUBF4
ADDF4
ASGNF4
line 1078
;1077:
;1078:	VectorSubtract(cg.refdef.vieworg, origin, dir);
ADDRLP4 96
ADDRGP4 cg+1870616+24
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96+4
ADDRGP4 cg+1870616+24+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96+8
ADDRGP4 cg+1870616+24+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 1079
;1079:	CrossProduct(dir, up, vec);
ADDRLP4 96
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1080
;1080:	VectorNormalize(vec);
ADDRLP4 28
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1082
;1081:
;1082:	VectorMA(origin, -10 + 20 * sin(c * 2 * M_PI), vec, origin);
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 80
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 144
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
CNSTF4 1101004800
ADDRLP4 144
INDIRF4
MULF4
CNSTF4 3240099840
ADDF4
MULF4
ADDF4
ASGNF4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 80
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 148
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
CNSTF4 1101004800
ADDRLP4 148
INDIRF4
MULF4
CNSTF4 3240099840
ADDF4
MULF4
ADDF4
ASGNF4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 80
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 152
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
CNSTF4 1101004800
ADDRLP4 152
INDIRF4
MULF4
CNSTF4 3240099840
ADDF4
MULF4
ADDF4
ASGNF4
line 1086
;1083:
;1084:	// if the view would be "inside" the sprite, kill the sprite
;1085:	// so it doesn't add too much overdraw
;1086:	VectorSubtract( origin, cg.refdef.vieworg, delta );
ADDRLP4 84
ADDRLP4 16
INDIRF4
ADDRGP4 cg+1870616+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 16+4
INDIRF4
ADDRGP4 cg+1870616+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 16+8
INDIRF4
ADDRGP4 cg+1870616+24+8
INDIRF4
SUBF4
ASGNF4
line 1087
;1087:	len = VectorLength( delta );
ADDRLP4 84
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 124
ADDRLP4 156
INDIRF4
ASGNF4
line 1088
;1088:	if ( len < 20 ) {
ADDRLP4 124
INDIRF4
CNSTF4 1101004800
GEF4 $624
line 1089
;1089:		CG_FreeLocalEntity( le );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 1090
;1090:		return;
ADDRGP4 $575
JUMPV
LABELV $624
line 1093
;1091:	}
;1092:
;1093:	negative = qfalse;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 1094
;1094:	if (score < 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $626
line 1095
;1095:		negative = qtrue;
ADDRLP4 108
CNSTI4 1
ASGNI4
line 1096
;1096:		score = -score;
ADDRLP4 12
ADDRLP4 12
INDIRI4
NEGI4
ASGNI4
line 1097
;1097:	}
LABELV $626
line 1099
;1098:
;1099:	for (numdigits = 0; !(numdigits && !score); numdigits++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $631
JUMPV
LABELV $628
line 1100
;1100:		digits[numdigits] = score % 10;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 10
MODI4
ASGNI4
line 1101
;1101:		score = score / 10;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 1102
;1102:	}
LABELV $629
line 1099
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $631
ADDRLP4 160
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 160
INDIRI4
EQI4 $628
ADDRLP4 12
INDIRI4
ADDRLP4 160
INDIRI4
NEI4 $628
line 1104
;1103:
;1104:	if (negative) {
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $632
line 1105
;1105:		digits[numdigits] = 10;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
CNSTI4 10
ASGNI4
line 1106
;1106:		numdigits++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1107
;1107:	}
LABELV $632
line 1109
;1108:
;1109:	for (i = 0; i < numdigits; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $637
JUMPV
LABELV $634
line 1110
;1110:		VectorMA(origin, (float) (((float) numdigits / 2) - i) * NUMBER_SIZE, vec, re->origin);
ADDRLP4 8
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
CNSTF4 1094713344
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
CNSTF4 1094713344
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
CNSTF4 1094713344
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1111
;1111:		re->customShader = cgs.media.numberShaders[digits[numdigits-1-i]];
ADDRLP4 164
CNSTI4 2
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ADDRLP4 164
INDIRI4
LSHI4
ADDRLP4 40
ADDP4
INDIRI4
ADDRLP4 164
INDIRI4
LSHI4
ADDRGP4 cgs+956380+1392
ADDP4
INDIRI4
ASGNI4
line 1112
;1112:		trap_R_AddRefEntityToScene( re );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1113
;1113:	}
LABELV $635
line 1109
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $637
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $634
line 1114
;1114:}
LABELV $575
endproc CG_AddScorePlum 168 12
export CG_AddLocalEntities
proc CG_AddLocalEntities 16 8
line 1127
;1115:
;1116:
;1117:
;1118:
;1119://==============================================================================
;1120:
;1121:/*
;1122:===================
;1123:CG_AddLocalEntities
;1124:
;1125:===================
;1126:*/
;1127:void CG_AddLocalEntities( void ) {
line 1132
;1128:	localEntity_t	*le, *next;
;1129:
;1130:	// walk the list backwards, so any new local entities generated
;1131:	// (trails, marks, etc) will be present this frame
;1132:	le = cg_activeLocalEntities.prev;
ADDRLP4 0
ADDRGP4 cg_activeLocalEntities
INDIRP4
ASGNP4
line 1133
;1133:	for ( ; le != &cg_activeLocalEntities ; le = next ) {
ADDRGP4 $648
JUMPV
LABELV $645
line 1136
;1134:		// grab next now, so if the local entity is freed we
;1135:		// still have it
;1136:		next = le->prev;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
line 1138
;1137:
;1138:		if ( cg.time >= le->endTime ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
LTI4 $649
line 1139
;1139:			CG_FreeLocalEntity( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FreeLocalEntity
CALLV
pop
line 1140
;1140:			continue;
ADDRGP4 $646
JUMPV
LABELV $649
line 1142
;1141:		}
;1142:		switch ( le->leType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $652
ADDRLP4 8
INDIRI4
CNSTI4 14
GTI4 $652
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $671
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $671
address $653
address $658
address $657
address $659
address $660
address $661
address $663
address $662
address $664
address $665
address $666
address $667
address $668
address $669
address $670
code
LABELV $652
line 1144
;1143:		default:
;1144:			CG_Error( "Bad leType: %i", le->leType );
ADDRGP4 $655
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1145
;1145:			break;
ADDRGP4 $653
JUMPV
line 1148
;1146:
;1147:		case LE_MARK:
;1148:			break;
LABELV $657
line 1151
;1149:
;1150:		case LE_SPRITE_EXPLOSION:
;1151:			CG_AddSpriteExplosion( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddSpriteExplosion
CALLV
pop
line 1152
;1152:			break;
ADDRGP4 $653
JUMPV
LABELV $658
line 1155
;1153:
;1154:		case LE_EXPLOSION:
;1155:			CG_AddExplosion( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddExplosion
CALLV
pop
line 1156
;1156:			break;
ADDRGP4 $653
JUMPV
LABELV $659
line 1159
;1157:
;1158:		case LE_FRAGMENT:			// gibs and brass
;1159:			CG_AddFragment( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddFragment
CALLV
pop
line 1160
;1160:			break;
ADDRGP4 $653
JUMPV
LABELV $660
line 1163
;1161:			
;1162:		case LE_FRAGMENT2:			// gibs and brass
;1163:			CG_AddFragment2( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddFragment2
CALLV
pop
line 1164
;1164:			break;
ADDRGP4 $653
JUMPV
LABELV $661
line 1167
;1165:
;1166:		case LE_MOVE_SCALE_FADE:		// water bubbles
;1167:			CG_AddMoveScaleFade( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddMoveScaleFade
CALLV
pop
line 1168
;1168:			break;
ADDRGP4 $653
JUMPV
LABELV $662
line 1171
;1169:
;1170:		case LE_FADE_RGB:				// teleporters, railtrails
;1171:			CG_AddFadeRGB( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddFadeRGB
CALLV
pop
line 1172
;1172:			break;
ADDRGP4 $653
JUMPV
LABELV $663
line 1175
;1173:
;1174:		case LE_FALL_SCALE_FADE: // gib blood trails
;1175:			CG_AddFallScaleFade( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddFallScaleFade
CALLV
pop
line 1176
;1176:			break;
ADDRGP4 $653
JUMPV
LABELV $664
line 1179
;1177:
;1178:		case LE_SCALE_FADE:		// rocket trails
;1179:			CG_AddScaleFade( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddScaleFade
CALLV
pop
line 1180
;1180:			break;
ADDRGP4 $653
JUMPV
LABELV $665
line 1183
;1181:
;1182:		case LE_SCOREPLUM:
;1183:			CG_AddScorePlum( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddScorePlum
CALLV
pop
line 1184
;1184:			break;
ADDRGP4 $653
JUMPV
LABELV $666
line 1188
;1185:
;1186:
;1187:		case LE_KAMIKAZE:
;1188:			CG_AddKamikaze( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddKamikaze
CALLV
pop
line 1189
;1189:			break;
ADDRGP4 $653
JUMPV
LABELV $667
line 1191
;1190:		case LE_INVULIMPACT:
;1191:			CG_AddInvulnerabilityImpact( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddInvulnerabilityImpact
CALLV
pop
line 1192
;1192:			break;
ADDRGP4 $653
JUMPV
LABELV $668
line 1194
;1193:		case LE_INVULJUICED:
;1194:			CG_AddInvulnerabilityJuiced( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddInvulnerabilityJuiced
CALLV
pop
line 1195
;1195:			break;
ADDRGP4 $653
JUMPV
LABELV $669
line 1197
;1196:		case LE_SHOWREFENTITY:
;1197:			CG_AddRefEntity( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddRefEntity
CALLV
pop
line 1198
;1198:			break;
ADDRGP4 $653
JUMPV
LABELV $670
line 1202
;1199:
;1200:
;1201:		case LE_GORE:			// blood
;1202:			CG_AddGore( le );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddGore
CALLV
pop
line 1203
;1203:			break;
LABELV $653
line 1205
;1204:		}
;1205:	}
LABELV $646
line 1133
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
LABELV $648
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg_activeLocalEntities
CVPU4 4
NEU4 $645
line 1206
;1206:}
LABELV $644
endproc CG_AddLocalEntities 16 8
bss
export cg_freeLocalEntities
align 4
LABELV cg_freeLocalEntities
skip 4
export cg_activeLocalEntities
align 4
LABELV cg_activeLocalEntities
skip 332
export cg_localEntities
align 4
LABELV cg_localEntities
skip 1359872
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
LABELV $655
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 108
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $92
byte 1 67
byte 1 71
byte 1 95
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
