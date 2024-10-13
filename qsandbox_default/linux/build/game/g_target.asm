export Use_Target_Give
code
proc Use_Target_Give 64 16
file "../../../code/game/g_target.c"
line 31
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
;23:#include "g_local.h"
;24:
;25://==========================================================
;26:
;27:/*QUAKED target_give (1 0 0) (-8 -8 -8) (8 8 8)
;28:Gives the activator all the items pointed to.
;29:GIVE_PLAYER : targeted item is always given to player instead of activating entity.
;30:*/
;31:void Use_Target_Give( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 35
;32:	gentity_t	*t;
;33:	trace_t		trace;
;34:
;35:	if ( ent->spawnflags & 1 )
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $65
line 36
;36:		activator = level.player;
ADDRFP4 8
ADDRGP4 level+10284
INDIRP4
ASGNP4
LABELV $65
line 38
;37:	
;38:	if ( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $68
line 39
;39:		return;
ADDRGP4 $64
JUMPV
LABELV $68
line 42
;40:	}
;41:
;42:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $70
line 43
;43:		return;
ADDRGP4 $64
JUMPV
LABELV $70
line 46
;44:	}
;45:
;46:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 47
;47:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $73
JUMPV
LABELV $72
line 48
;48:	while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 49
;49:		if ( !t->item ) {
ADDRLP4 0
INDIRP4
CNSTI4 1020
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $75
line 50
;50:			continue;
ADDRGP4 $73
JUMPV
LABELV $75
line 52
;51:		}
;52:		Touch_Item2( t, activator, &trace, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Touch_Item2
CALLV
pop
line 55
;53:
;54:		// make sure it isn't going to respawn or show any events
;55:		t->nextthink = 0;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 56
;56:		trap_UnlinkEntity( t );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 57
;57:	}
LABELV $73
line 48
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $72
line 58
;58:}
LABELV $64
endproc Use_Target_Give 64 16
export SP_target_give
proc SP_target_give 0 0
line 60
;59:
;60:void SP_target_give( gentity_t *ent ) {
line 61
;61:	ent->use = Use_Target_Give;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_Target_Give
ASGNP4
line 62
;62:}
LABELV $77
endproc SP_target_give 0 0
export Use_target_remove_powerups
proc Use_target_remove_powerups 4 0
line 71
;63:
;64:
;65://==========================================================
;66:
;67:/*QUAKED target_remove_powerups (1 0 0) (-8 -8 -8) (8 8 8)
;68:takes away all the activators powerups.
;69:Used to drop flight powerups into death puts.
;70:*/
;71:void Use_target_remove_powerups( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 74
;72:	int i;
;73:
;74:	if( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $79
line 75
;75:		return;
ADDRGP4 $78
JUMPV
LABELV $79
line 78
;76:	}
;77:
;78:	if ( !ent->spawnflags )
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 0
NEI4 $81
line 79
;79:		ent->spawnflags = 3;	//POWERUPS + FLAGS
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTI4 3
ASGNI4
LABELV $81
line 82
;80:
;81:	//remove powerups
;82:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $83
line 83
;83:		activator->client->ps.powerups[PW_QUAD] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 316
ADDP4
CNSTI4 0
ASGNI4
line 84
;84:		activator->client->ps.powerups[PW_BATTLESUIT] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 320
ADDP4
CNSTI4 0
ASGNI4
line 85
;85:		activator->client->ps.powerups[PW_HASTE] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 324
ADDP4
CNSTI4 0
ASGNI4
line 86
;86:		activator->client->ps.powerups[PW_INVIS] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 328
ADDP4
CNSTI4 0
ASGNI4
line 87
;87:		activator->client->ps.powerups[PW_REGEN] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 332
ADDP4
CNSTI4 0
ASGNI4
line 88
;88:		activator->client->ps.powerups[PW_FLIGHT] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 336
ADDP4
CNSTI4 0
ASGNI4
line 89
;89:	}
LABELV $83
line 92
;90:
;91:	//remove weapons and ammo
;92:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $85
line 93
;93:		activator->client->ps.weapon = WP_NONE;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 95
;94:
;95:		activator->client->ps.stats[STAT_WEAPONS] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 0
ASGNI4
line 97
;96:
;97:		for ( i = WP_MACHINEGUN; i < WP_NUM_WEAPONS; i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $87
line 98
;98:			activator->client->ps.ammo[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 99
;99:		}
LABELV $88
line 97
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $87
line 100
;100:	}
LABELV $85
line 103
;101:
;102:	//remove holdables and keys
;103:	if ( ent->spawnflags & 8 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $91
line 104
;104:		activator->client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 105
;105:	}
LABELV $91
line 106
;106:}
LABELV $78
endproc Use_target_remove_powerups 4 0
export SP_target_remove_powerups
proc SP_target_remove_powerups 0 0
line 108
;107:
;108:void SP_target_remove_powerups( gentity_t *ent ) {
line 109
;109:	ent->use = Use_target_remove_powerups;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_target_remove_powerups
ASGNP4
line 110
;110:}
LABELV $93
endproc SP_target_remove_powerups 0 0
export Think_Target_Delay
proc Think_Target_Delay 4 8
line 119
;111:
;112:
;113://==========================================================
;114:
;115:/*QUAKED target_delay (1 0 0) (-8 -8 -8) (8 8 8)
;116:"wait" seconds to pause before firing targets.
;117:"random" delay variance, total delay = delay +/- random seconds
;118:*/
;119:void Think_Target_Delay( gentity_t *ent ) {
line 120
;120:	if (!ent->r.linked)
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
NEI4 $95
line 121
;121:		return;
ADDRGP4 $94
JUMPV
LABELV $95
line 123
;122:
;123:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 124
;124:	G_UseTargets( ent, ent->activator );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 125
;125:}
LABELV $94
endproc Think_Target_Delay 4 8
export Use_Target_Delay
proc Use_Target_Delay 16 0
line 127
;126:
;127:void Use_Target_Delay( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 128
;128:	if (!ent->r.linked)
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
NEI4 $98
line 129
;129:		return;
ADDRGP4 $97
JUMPV
LABELV $98
line 131
;130:
;131:	if ( ent->nextthink && (ent->spawnflags & 1) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $100
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $100
line 132
;132:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 133
;133:	} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 134
;134:	ent->nextthink = level.time + ( ent->wait + ent->random * crandom() ) * 1000;
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 8
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
MULF4
ADDF4
CVFI4 4
ASGNI4
line 135
;135:	ent->think = Think_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 Think_Target_Delay
ASGNP4
line 136
;136:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 137
;137:	}
LABELV $101
line 138
;138:}
LABELV $97
endproc Use_Target_Delay 16 0
export SP_target_delay
proc SP_target_delay 4 12
line 140
;139:
;140:void SP_target_delay( gentity_t *ent ) {
line 142
;141:	// check delay for backwards compatability
;142:	if ( !G_SpawnFloat( "delay", "0", &ent->wait ) ) {
ADDRGP4 $106
ARGP4
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $104
line 143
;143:		G_SpawnFloat( "wait", "1", &ent->wait );
ADDRGP4 $108
ARGP4
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 144
;144:	}
LABELV $104
line 146
;145:
;146:	if ( !ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CNSTF4 0
NEF4 $110
line 147
;147:		ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
CNSTF4 1065353216
ASGNF4
line 148
;148:	}
LABELV $110
line 149
;149:	ent->use = Use_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_Target_Delay
ASGNP4
line 150
;150:	ent->r.linked = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTI4 1
ASGNI4
line 151
;151:}
LABELV $103
endproc SP_target_delay 4 12
export Use_Target_Score
proc Use_Target_Score 4 12
line 161
;152:
;153:
;154://==========================================================
;155:
;156:/*QUAKED target_score (1 0 0) (-8 -8 -8) (8 8 8)
;157:"count" number of points to add, default 1
;158:
;159:The activator is given this many points.
;160:*/
;161:void Use_Target_Score (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 162
;162:	AddScore( activator, ent->r.currentOrigin, ent->count );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 163
;163:}
LABELV $112
endproc Use_Target_Score 4 12
export SP_target_score
proc SP_target_score 0 0
line 165
;164:
;165:void SP_target_score( gentity_t *ent ) {
line 166
;166:	if ( !ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 0
NEI4 $114
line 167
;167:		ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 1
ASGNI4
line 168
;168:	}
LABELV $114
line 169
;169:	ent->use = Use_Target_Score;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_Target_Score
ASGNP4
line 170
;170:}
LABELV $113
endproc SP_target_score 0 0
export Use_Target_Clienttarg
proc Use_Target_Clienttarg 0 0
line 178
;171://==========================================================
;172:
;173:/*QUAKED target_clienttarg (1 0 0) (-8 -8 -8) (8 8 8)
;174:"count" number of points to add, default 1
;175:
;176:The activator is given this many points.
;177:*/
;178:void Use_Target_Clienttarg (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 179
;179:		activator->targetname = ent->value;
ADDRFP4 8
INDIRP4
CNSTI4 724
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 180
;180:}
LABELV $116
endproc Use_Target_Clienttarg 0 0
export SP_target_clienttarg
proc SP_target_clienttarg 0 0
line 182
;181:
;182:void SP_target_clienttarg( gentity_t *ent ) {
line 183
;183:	ent->use = Use_Target_Clienttarg;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_Target_Clienttarg
ASGNP4
line 184
;184:}
LABELV $117
endproc SP_target_clienttarg 0 0
export Use_Target_Stats
proc Use_Target_Stats 8 0
line 187
;185:
;186:/*QUAKED target_stats for QSandbox (1 0 0) (-8 -8 -8) (8 8 8)*/
;187:void Use_Target_Stats (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 188
;188:if(ent->spawnflags & 1){
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $119
line 189
;189:if(ent->type == 1){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 1
NEI4 $121
line 190
;190:activator->client->ps.stats[STAT_HEALTH] += ent->count;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDI4
ASGNI4
line 191
;191:activator->health += ent->count;
ADDRLP4 4
ADDRFP4 8
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDI4
ASGNI4
line 192
;192:}
LABELV $121
line 193
;193:if(ent->type == 2){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 2
NEI4 $123
line 194
;194:activator->client->ps.stats[STAT_HOLDABLE_ITEM] += ent->count;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDI4
ASGNI4
line 195
;195:}
LABELV $123
line 196
;196:if(ent->type == 3){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 3
NEI4 $125
line 197
;197:activator->client->ps.stats[STAT_PERSISTANT_POWERUP] += ent->count;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDI4
ASGNI4
line 198
;198:}
LABELV $125
line 199
;199:if(ent->type == 4){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 4
NEI4 $127
line 200
;200:activator->client->ps.stats[STAT_WEAPONS] += ent->count;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDI4
ASGNI4
line 201
;201:}
LABELV $127
line 202
;202:if(ent->type == 5){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 5
NEI4 $129
line 203
;203:activator->client->ps.stats[STAT_ARMOR] += ent->count;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDI4
ASGNI4
line 204
;204:}
LABELV $129
line 205
;205:if(ent->type == 6){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 6
NEI4 $131
line 206
;206:activator->client->ps.stats[STAT_MAX_HEALTH] += ent->count;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 212
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDI4
ASGNI4
line 207
;207:}
LABELV $131
line 208
;208:if(ent->type == 7){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 7
NEI4 $133
line 209
;209:activator->client->ps.stats[STAT_NO_PICKUP] += ent->count;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDI4
ASGNI4
line 210
;210:}
LABELV $133
line 211
;211:if(ent->type == 8){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 8
NEI4 $135
line 213
;212:
;213:}
LABELV $135
line 214
;214:if(ent->type == 9){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 9
NEI4 $118
line 215
;215:activator->client->ps.stats[STAT_MONEY] += ent->count;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 220
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDI4
ASGNI4
line 216
;216:activator->client->pers.oldmoney += ent->count;
ADDRLP4 4
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ADDI4
ASGNI4
line 217
;217:}
line 218
;218:return;
ADDRGP4 $118
JUMPV
LABELV $119
line 220
;219:}
;220:if(ent->type == 1){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 1
NEI4 $139
line 221
;221:activator->client->ps.stats[STAT_HEALTH] = ent->count;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 222
;222:activator->health = ent->count;
ADDRFP4 8
INDIRP4
CNSTI4 808
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 223
;223:}
LABELV $139
line 224
;224:if(ent->type == 2){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 2
NEI4 $141
line 225
;225:activator->client->ps.stats[STAT_HOLDABLE_ITEM] = ent->count;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 226
;226:}
LABELV $141
line 227
;227:if(ent->type == 3){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 3
NEI4 $143
line 228
;228:activator->client->ps.stats[STAT_PERSISTANT_POWERUP] = ent->count;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 229
;229:}
LABELV $143
line 230
;230:if(ent->type == 4){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 4
NEI4 $145
line 231
;231:activator->client->ps.stats[STAT_WEAPONS] = ent->count;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 232
;232:}
LABELV $145
line 233
;233:if(ent->type == 5){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 5
NEI4 $147
line 234
;234:activator->client->ps.stats[STAT_ARMOR] = ent->count;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 235
;235:}
LABELV $147
line 236
;236:if(ent->type == 6){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 6
NEI4 $149
line 237
;237:activator->client->ps.stats[STAT_MAX_HEALTH] = ent->count;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 212
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 238
;238:}
LABELV $149
line 239
;239:if(ent->type == 7){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 7
NEI4 $151
line 240
;240:activator->client->ps.stats[STAT_NO_PICKUP] = ent->count;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 241
;241:}
LABELV $151
line 242
;242:if(ent->type == 8){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 8
NEI4 $153
line 244
;243:
;244:}
LABELV $153
line 245
;245:if(ent->type == 9){
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 9
NEI4 $155
line 246
;246:activator->client->ps.stats[STAT_MONEY] = ent->count;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 220
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 247
;247:activator->client->pers.oldmoney = ent->count;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 248
;248:}
LABELV $155
line 249
;249:}
LABELV $118
endproc Use_Target_Stats 8 0
export SP_target_stats
proc SP_target_stats 0 4
line 251
;250:
;251:void SP_target_stats( gentity_t *ent ) {
line 252
;252:	if ( !ent->type ) {
ADDRFP4 0
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
CNSTI4 0
NEI4 $158
line 253
;253:G_Printf ("No type in target_stats\n");
ADDRGP4 $160
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 254
;254:	}
LABELV $158
line 255
;255:	ent->use = Use_Target_Stats;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_Target_Stats
ASGNP4
line 256
;256:}
LABELV $157
endproc SP_target_stats 0 4
export Use_Target_Print
proc Use_Target_Print 8 8
line 264
;257:
;258://==========================================================
;259:
;260:/*QUAKED target_print (1 0 0) (-8 -8 -8) (8 8 8) redteam blueteam private
;261:"message"	text to print
;262:If "private", only the activator gets the message.  If no checks, all clients get the message.
;263:*/
;264:void Use_Target_Print (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 265
;265:if ( ent->spawnflags & 8 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $162
line 266
;266:	if ( activator->client && ( ent->spawnflags & 4 ) ) {
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $164
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $164
line 267
;267:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $166
line 268
;268:		trap_SendServerCommand( activator-g_entities, va("clp \"%s\"", ent->message ));
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 269
;269:		}
LABELV $166
line 270
;270:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $161
line 271
;271:			if(strlen(ent->messageru) > 0){
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $173
line 272
;272:			trap_SendServerCommand( activator-g_entities, va("rusclp \"%s\"", ent->messageru ));
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 273
;273:			} else {
ADDRGP4 $161
JUMPV
LABELV $173
line 274
;274:			trap_SendServerCommand( activator-g_entities, va("clp \"%s\"", ent->message ));
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 275
;275:			}
line 276
;276:		}
line 277
;277:		return;
ADDRGP4 $161
JUMPV
LABELV $164
line 280
;278:	}
;279:
;280:	if ( ent->spawnflags & 3 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $176
line 281
;281:		if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $178
line 282
;282:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $180
line 283
;283:			G_TeamCommand( TEAM_RED, va("clp \"%s\"", ent->message) );
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 284
;284:			}
LABELV $180
line 285
;285:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $183
line 286
;286:			if(strlen(ent->messageru) > 0){
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $186
line 287
;287:			G_TeamCommand( TEAM_RED, va("rusclp \"%s\"", ent->messageru) );
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 288
;288:			} else {
ADDRGP4 $187
JUMPV
LABELV $186
line 289
;289:			G_TeamCommand( TEAM_RED, va("clp \"%s\"", ent->message) );	
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 290
;290:			}
LABELV $187
line 291
;291:			}
LABELV $183
line 292
;292:		}
LABELV $178
line 293
;293:		if ( ent->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $161
line 294
;294:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $190
line 295
;295:			G_TeamCommand( TEAM_BLUE, va("clp \"%s\"", ent->message) );
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 296
;296:			}
LABELV $190
line 297
;297:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $161
line 298
;298:			if(strlen(ent->messageru) > 0){
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $196
line 299
;299:			G_TeamCommand( TEAM_BLUE, va("rusclp \"%s\"", ent->messageru) );
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 300
;300:			} else {
ADDRGP4 $161
JUMPV
LABELV $196
line 301
;301:			G_TeamCommand( TEAM_BLUE, va("clp \"%s\"", ent->message) );	
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 302
;302:			}
line 303
;303:			}
line 304
;304:		}
line 305
;305:		return;
ADDRGP4 $161
JUMPV
LABELV $176
line 307
;306:	}
;307:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $198
line 308
;308:	trap_SendServerCommand( -1, va("clp \"%s\"", ent->message ));
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 309
;309:}
LABELV $198
line 310
;310:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $163
line 311
;311:	if(strlen(ent->messageru) > 0){
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $204
line 312
;312:	trap_SendServerCommand( -1, va("rusclp \"%s\"", ent->messageru ));
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 313
;313:	} else {
ADDRGP4 $163
JUMPV
LABELV $204
line 314
;314:	trap_SendServerCommand( -1, va("clp \"%s\"", ent->message ));	
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 315
;315:	}
line 316
;316:}
line 317
;317:} else {
ADDRGP4 $163
JUMPV
LABELV $162
line 318
;318:	if ( activator->client && ( ent->spawnflags & 4 ) ) {
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $206
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $206
line 319
;319:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $208
line 320
;320:		trap_SendServerCommand( activator-g_entities, va("cp \"%s\"", ent->message ));
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 321
;321:		}
LABELV $208
line 322
;322:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $161
line 323
;323:			if(strlen(ent->messageru) > 0){
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $215
line 324
;324:			trap_SendServerCommand( activator-g_entities, va("ruscp \"%s\"", ent->messageru ));
ADDRGP4 $217
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 325
;325:			} else {
ADDRGP4 $161
JUMPV
LABELV $215
line 326
;326:			trap_SendServerCommand( activator-g_entities, va("cp \"%s\"", ent->message ));
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 327
;327:			}
line 328
;328:		}
line 329
;329:		return;
ADDRGP4 $161
JUMPV
LABELV $206
line 332
;330:	}
;331:
;332:	if ( ent->spawnflags & 3 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $218
line 333
;333:		if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $220
line 334
;334:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $222
line 335
;335:			G_TeamCommand( TEAM_RED, va("cp \"%s\"", ent->message) );
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 336
;336:			}
LABELV $222
line 337
;337:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $225
line 338
;338:			if(strlen(ent->messageru) > 0){
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $228
line 339
;339:			G_TeamCommand( TEAM_RED, va("ruscp \"%s\"", ent->messageru) );
ADDRGP4 $217
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 340
;340:			} else {
ADDRGP4 $229
JUMPV
LABELV $228
line 341
;341:			G_TeamCommand( TEAM_RED, va("cp \"%s\"", ent->message) );	
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 342
;342:			}
LABELV $229
line 343
;343:			}
LABELV $225
line 344
;344:		}
LABELV $220
line 345
;345:		if ( ent->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $161
line 346
;346:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $232
line 347
;347:			G_TeamCommand( TEAM_BLUE, va("cp \"%s\"", ent->message) );
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 348
;348:			}
LABELV $232
line 349
;349:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $161
line 350
;350:			if(strlen(ent->messageru) > 0){
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $238
line 351
;351:			G_TeamCommand( TEAM_BLUE, va("ruscp \"%s\"", ent->messageru) );
ADDRGP4 $217
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 352
;352:			} else {
ADDRGP4 $161
JUMPV
LABELV $238
line 353
;353:			G_TeamCommand( TEAM_BLUE, va("cp \"%s\"", ent->message) );	
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 354
;354:			}
line 355
;355:			}
line 356
;356:		}
line 357
;357:		return;
ADDRGP4 $161
JUMPV
LABELV $218
line 359
;358:	}
;359:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $240
line 360
;360:	trap_SendServerCommand( -1, va("cp \"%s\"", ent->message ));
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 361
;361:}
LABELV $240
line 362
;362:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $243
line 363
;363:	if(strlen(ent->messageru) > 0){
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $246
line 364
;364:	trap_SendServerCommand( -1, va("ruscp \"%s\"", ent->messageru ));
ADDRGP4 $217
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 365
;365:	} else {
ADDRGP4 $247
JUMPV
LABELV $246
line 366
;366:	trap_SendServerCommand( -1, va("cp \"%s\"", ent->message ));	
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 367
;367:	}
LABELV $247
line 368
;368:}
LABELV $243
line 369
;369:}
LABELV $163
line 370
;370:}
LABELV $161
endproc Use_Target_Print 8 8
export SP_target_print
proc SP_target_print 0 12
line 372
;371:
;372:void SP_target_print( gentity_t *ent ) {
line 373
;373:	G_SpawnFloat( "wait", "-1", &ent->wait );
ADDRGP4 $108
ARGP4
ADDRGP4 $249
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 375
;374:
;375:	ent->use = Use_Target_Print;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_Target_Print
ASGNP4
line 376
;376:}
LABELV $248
endproc SP_target_print 0 12
export Use_Target_Speaker
proc Use_Target_Speaker 4 12
line 392
;377://==========================================================
;378:
;379:
;380:/*QUAKED target_speaker (1 0 0) (-8 -8 -8) (8 8 8) looped-on looped-off global activator
;381:"noise"		wav file to play
;382:
;383:A global sound will play full volume throughout the level.
;384:Activator sounds will play on the player that activated the target.
;385:Global and activator sounds can't be combined with looping.
;386:Normal sounds play each time the target is used.
;387:Looped sounds will be toggled by use functions.
;388:Multiple identical looping sounds will just increase volume without any speed cost.
;389:"wait" : Seconds between auto triggerings, 0 = don't auto trigger
;390:"random"	wait variance, default is 0
;391:*/
;392:void Use_Target_Speaker (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 393
;393:	if (ent->spawnflags & 3) {	// looping sound toggles
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $251
line 394
;394:		if (ent->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
EQI4 $253
line 395
;395:			ent->s.loopSound = 0;	// turn it off
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $252
JUMPV
LABELV $253
line 397
;396:		else
;397:			ent->s.loopSound = ent->noise_index;	// start it
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ASGNI4
line 398
;398:	}else {	// normal sound
ADDRGP4 $252
JUMPV
LABELV $251
line 399
;399:		if ( ent->spawnflags & 8 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $255
line 400
;400:			G_AddEvent( activator, EV_GENERAL_SOUND, ent->noise_index );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 401
;401:		} else if (ent->spawnflags & 4) {
ADDRGP4 $256
JUMPV
LABELV $255
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $257
line 402
;402:			G_AddEvent( ent, EV_GLOBAL_SOUND, ent->noise_index );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 403
;403:		} else {
ADDRGP4 $258
JUMPV
LABELV $257
line 404
;404:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->noise_index );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 405
;405:		}
LABELV $258
LABELV $256
line 406
;406:	}
LABELV $252
line 407
;407:}
LABELV $250
endproc Use_Target_Speaker 4 12
export SP_target_speaker
proc SP_target_speaker 96 16
line 409
;408:
;409:void SP_target_speaker( gentity_t *ent ) {
line 413
;410:	char	buffer[MAX_QPATH];
;411:	char	*s;
;412:
;413:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $108
ARGP4
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 414
;414:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $260
ARGP4
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 416
;415:
;416:	if ( !G_SpawnString( "noise", "NOSOUND", &s ) ) {
ADDRGP4 $263
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $261
line 418
;417:		//G_Error( "target_speaker without a noise key at %s", vtos( ent->s.origin ) );
;418:	}
LABELV $261
line 422
;419:
;420:	// force all client reletive sounds to be "activator" speakers that
;421:	// play on the entity that activates it
;422:	if ( s[0] == '*' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $265
line 423
;423:		ent->spawnflags |= 8;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 424
;424:	}
LABELV $265
line 426
;425:
;426:	if (!strstr( s, ".wav" )) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $269
ARGP4
ADDRLP4 72
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $267
line 427
;427:		Com_sprintf (buffer, sizeof(buffer), "%s.wav", s );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $270
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 428
;428:	} else {
ADDRGP4 $268
JUMPV
LABELV $267
line 429
;429:		Q_strncpyz( buffer, s, sizeof(buffer) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 430
;430:	}
LABELV $268
line 431
;431:	ent->noise_index = G_SoundIndex(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 434
;432:
;433:	// a repeating speaker can be done completely client side
;434:	ent->s.eType = ET_SPEAKER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 435
;435:	ent->s.eventParm = ent->noise_index;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ASGNI4
line 436
;436:	ent->s.frame = ent->wait * 10;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 1092616192
ADDRLP4 84
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 437
;437:	ent->s.clientNum = ent->random * 10;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 1092616192
ADDRLP4 88
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 441
;438:
;439:
;440:	// check for prestarted looping sound
;441:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $271
line 442
;442:		ent->s.loopSound = ent->noise_index;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ASGNI4
line 443
;443:	}
LABELV $271
line 445
;444:
;445:	ent->use = Use_Target_Speaker;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_Target_Speaker
ASGNP4
line 447
;446:
;447:	if (ent->spawnflags & 4) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $273
line 448
;448:		ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 449
;449:	}
LABELV $273
line 451
;450:
;451:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 455
;452:
;453:	// must link the entity so we get areas and clusters so
;454:	// the server can determine who to send updates to
;455:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 456
;456:}
LABELV $259
endproc SP_target_speaker 96 16
export target_laser_think
proc target_laser_think 120 32
line 465
;457:
;458:
;459:
;460://==========================================================
;461:
;462:/*QUAKED target_laser (0 .5 .8) (-8 -8 -8) (8 8 8) START_ON
;463:When triggered, fires a laser.  You can either set a target or a direction.
;464:*/
;465:void target_laser_think(gentity_t *self) {
line 471
;466:	vec3_t	end;
;467:	trace_t	tr;
;468:	vec3_t	point;
;469:
;470:	// if pointed at another entity, set movedir to point at it
;471:	if (self->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $276
line 473
;472:		//VectorMA(self->enemy->s.origin, 0.5, self->enemy->r.mins, point);
;473:		VectorMA(self->enemy->r.currentOrigin, 0.5, self->enemy->r.mins, point);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 84
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRLP4 80
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 92
INDIRP4
CNSTI4 532
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 96
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 96
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 475
;474:		
;475:		VectorMA(point, 0.5, self->enemy->r.maxs, point);
ADDRLP4 100
CNSTF4 1056964608
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 100
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 100
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1056964608
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 476
;476:		VectorSubtract(point, self->s.origin, self->movedir);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 116
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 477
;477:		VectorNormalize(self->movedir);
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 478
;478:	}
LABELV $276
line 481
;479:
;480:	// fire forward and see what we hit
;481:	VectorMA(self->s.origin, 4096, self->movedir, end);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTF4 1166016512
ASGNF4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 748
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 752
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 88
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
ADDRLP4 88
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 483
;482:
;483:	trap_Trace(&tr, self->s.origin, NULL, NULL, end, self->s.number, CONTENTS_SOLID | CONTENTS_BODY );
ADDRLP4 24
ARGP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 96
CNSTP4 0
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 92
INDIRP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 485
;484:
;485:	if (tr.entityNum != ENTITYNUM_NONE && self->damage) {
ADDRLP4 24+52
INDIRI4
CNSTI4 4095
EQI4 $288
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
CNSTI4 0
EQI4 $288
line 487
;486:		// hurt it if we can
;487:		G_Damage(&g_entities[tr.entityNum], self, self, self->movedir,
CNSTI4 2492
ADDRLP4 24+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRLP4 24+12
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 26
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 489
;488:			tr.endpos, self->damage, 0, MOD_TARGET_LASER);
;489:	}
LABELV $288
line 491
;490:
;491:	VectorCopy(tr.endpos, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 24+12
INDIRB
ASGNB 12
line 493
;492:
;493:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 494
;494:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 495
;495:}
LABELV $275
endproc target_laser_think 120 32
export target_laser_on
proc target_laser_on 4 4
line 499
;496:
;497:
;498:void target_laser_on (gentity_t *self)
;499:{
line 500
;500:	if (!self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $296
line 501
;501:		self->activator = self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $296
line 502
;502:	target_laser_think (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_think
CALLV
pop
line 503
;503:}
LABELV $295
endproc target_laser_on 4 4
export target_laser_off
proc target_laser_off 0 4
line 506
;504:
;505:void target_laser_off (gentity_t *self)
;506:{
line 507
;507:	trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 508
;508:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 509
;509:}
LABELV $298
endproc target_laser_off 0 4
export target_laser_use
proc target_laser_use 0 4
line 512
;510:
;511:void target_laser_use (gentity_t *self, gentity_t *other, gentity_t *activator)
;512:{
line 513
;513:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 514
;514:	if ( self->nextthink > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
LEI4 $300
line 515
;515:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
ADDRGP4 $301
JUMPV
LABELV $300
line 517
;516:	else
;517:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
LABELV $301
line 518
;518:}
LABELV $299
endproc target_laser_use 0 4
export target_laser_start
proc target_laser_start 16 16
line 521
;519:
;520:void target_laser_start (gentity_t *self)
;521:{
line 524
;522:	gentity_t *ent;
;523:
;524:	self->s.eType = ET_BEAM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 526
;525:
;526:	if (self->target) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $303
line 527
;527:		ent = G_Find (NULL, FOFS(targetname), self->target);
CNSTP4 0
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 528
;528:		if (!ent) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $305
line 529
;529:			G_Printf ("%s at %s: %s is a bad target\n", self->classname, vtos(self->s.origin), self->target);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $307
ARGP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 530
;530:		}
LABELV $305
line 531
;531:		self->enemy = ent;
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 532
;532:	} else {
ADDRGP4 $304
JUMPV
LABELV $303
line 533
;533:		G_SetMovedir (self->s.angles, self->movedir);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 748
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 534
;534:	}
LABELV $304
line 536
;535:
;536:	self->use = target_laser_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_laser_use
ASGNP4
line 537
;537:	self->think = target_laser_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 target_laser_think
ASGNP4
line 539
;538:
;539:	if ( !self->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
CNSTI4 0
NEI4 $308
line 540
;540:		self->damage = 1;
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 1
ASGNI4
line 541
;541:	}
LABELV $308
line 543
;542:
;543:	if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $310
line 544
;544:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
ADDRGP4 $311
JUMPV
LABELV $310
line 546
;545:	else
;546:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
LABELV $311
line 549
;547:
;548:
;549:	if (self->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $312
line 550
;550:		self->s.generic1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $313
JUMPV
LABELV $312
line 552
;551:	else
;552:		self->s.generic1 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 1
ASGNI4
LABELV $313
line 553
;553:}
LABELV $302
endproc target_laser_start 16 16
export SP_target_laser
proc SP_target_laser 40 12
line 556
;554:
;555:void SP_target_laser (gentity_t *self)
;556:{
line 562
;557:	char        *sound;
;558:	vec3_t		color;
;559:	int			r, g, b, i;
;560:
;561:	// if the "noise" key is set, use a constant looping sound when moving
;562:	if (G_SpawnString("noise", "100", &sound)) {
ADDRGP4 $263
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 32
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $315
line 563
;563:		self->s.loopSound = G_SoundIndex(sound);
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 564
;564:	}
LABELV $315
line 566
;565:	// let everything else get spawned before we start firing
;566:	self->think = target_laser_start;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 target_laser_start
ASGNP4
line 567
;567:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 570
;568:
;569:	//beam color
;570:	G_SpawnVector("color", "1 0 0", color);
ADDRGP4 $319
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnVector
CALLI4
pop
line 572
;571:
;572:	r = color[0] * 255;
ADDRLP4 12
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 573
;573:	if (r > 255) {
ADDRLP4 12
INDIRI4
CNSTI4 255
LEI4 $321
line 574
;574:		r = 255;
ADDRLP4 12
CNSTI4 255
ASGNI4
line 575
;575:	}
LABELV $321
line 576
;576:	g = color[1] * 255;
ADDRLP4 16
CNSTF4 1132396544
ADDRLP4 0+4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 577
;577:	if (g > 255) {
ADDRLP4 16
INDIRI4
CNSTI4 255
LEI4 $324
line 578
;578:		g = 255;
ADDRLP4 16
CNSTI4 255
ASGNI4
line 579
;579:	}
LABELV $324
line 580
;580:	b = color[2] * 255;
ADDRLP4 20
CNSTF4 1132396544
ADDRLP4 0+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 581
;581:	if (b > 255) {
ADDRLP4 20
INDIRI4
CNSTI4 255
LEI4 $327
line 582
;582:		b = 255;
ADDRLP4 20
CNSTI4 255
ASGNI4
line 583
;583:	}
LABELV $327
line 591
;584:	/*
;585:	i = light / 4;
;586:	if (i > 255) {
;587:		i = 255;
;588:	}
;589:	self->s.constantLight = r | (g << 8) | (b << 16) | (i << 24);
;590:	*/
;591:	self->s.constantLight = r | (g << 8) | (b << 16);
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 20
INDIRI4
CNSTI4 16
LSHI4
BORI4
ASGNI4
line 592
;592:}
LABELV $314
endproc SP_target_laser 40 12
export target_teleporter_use
proc target_teleporter_use 12 12
line 597
;593:
;594:
;595://==========================================================
;596:
;597:void target_teleporter_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 600
;598:	gentity_t	*dest;
;599:
;600:	if (!activator->client)
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $330
line 601
;601:		return;
ADDRGP4 $329
JUMPV
LABELV $330
line 602
;602:	dest = 	G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 603
;603:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $332
line 604
;604:                G_Printf ("Couldn't find teleporter destination\n");
ADDRGP4 $334
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 605
;605:		return;
ADDRGP4 $329
JUMPV
LABELV $332
line 608
;606:	}
;607:
;608:	TeleportPlayer( activator, dest->s.origin, dest->s.angles );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 609
;609:}
LABELV $329
endproc target_teleporter_use 12 12
export SP_target_teleporter
proc SP_target_teleporter 4 12
line 614
;610:
;611:/*QUAKED target_teleporter (1 0 0) (-8 -8 -8) (8 8 8)
;612:The activator will be teleported away.
;613:*/
;614:void SP_target_teleporter( gentity_t *self ) {
line 615
;615:	if (!self->targetname)
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $336
line 616
;616:            G_Printf("untargeted %s at %s\n", self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $338
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $336
line 618
;617:
;618:	self->use = target_teleporter_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_teleporter_use
ASGNP4
line 619
;619:}
LABELV $335
endproc SP_target_teleporter 4 12
export target_relay_use
proc target_relay_use 48 12
line 630
;620:
;621://==========================================================
;622:
;623:
;624:/*QUAKED target_relay (.5 .5 .5) (-8 -8 -8) (8 8 8) RED_ONLY BLUE_ONLY RANDOM
;625:This doesn't perform any actions except fire its targets.
;626:The activator can be forced to be from a certain team.
;627:if RANDOM is checked, only one of the targets will be fired, not all of them
;628:A count key can be set to delay the triggering until the entity has been triggered [count] number of times
;629:*/
;630:void target_relay_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 631
;631:	if (!self->r.linked)
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
NEI4 $340
line 632
;632:		return;
ADDRGP4 $339
JUMPV
LABELV $340
line 634
;633:
;634:	if ( ( self->spawnflags & 1 ) && activator->client 
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
BANDI4
CNSTI4 0
EQI4 $342
ADDRLP4 4
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $342
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $342
line 635
;635:		&& activator->client->sess.sessionTeam != TEAM_RED ) {
line 636
;636:		return;
ADDRGP4 $339
JUMPV
LABELV $342
line 638
;637:	}
;638:	if ( ( self->spawnflags & 2 ) && activator->client 
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 0
EQI4 $344
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $344
ADDRLP4 12
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $344
line 639
;639:		&& activator->client->sess.sessionTeam != TEAM_BLUE ) {
line 640
;640:		return;
ADDRGP4 $339
JUMPV
LABELV $344
line 642
;641:	}
;642:	if ( self->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $346
line 645
;643:		gentity_t	*ent;
;644:
;645:		ent = G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 646
;646:		if ( ent && ent->use ) {
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $348
ADDRLP4 16
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $348
line 647
;647:			ent->use( ent, self, activator );
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 648
;648:		}
LABELV $348
line 650
;649:
;650:		if ( self->target2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $339
line 651
;651:			ent = G_PickTarget( self->target2 );
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 652
;652:			if ( ent && ent->use ) {
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $339
ADDRLP4 16
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $339
line 653
;653:				ent->use( ent, self, activator );
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 654
;654:			}
line 655
;655:		}
line 656
;656:		return;
ADDRGP4 $339
JUMPV
LABELV $346
line 659
;657:	}
;658:
;659:	if (!self->count || self->count < 0) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $356
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
GEI4 $354
LABELV $356
line 660
;660:		self->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 1
ASGNI4
line 661
;661:	}
LABELV $354
line 663
;662:
;663:	if (!self->damage)		//damage is used to keep track of the number of times the target_relay was triggered
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
CNSTI4 0
NEI4 $357
line 664
;664:		self->damage = 1;
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $357
line 666
;665:	else
;666:		self->damage++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $358
line 668
;667:
;668:	if (self->damage == self->count)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
NEI4 $359
line 669
;669:	{
line 670
;670:	G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 672
;671:		
;672:		if ( self->spawnflags & 8 )
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $361
line 673
;673:			G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
ADDRGP4 $362
JUMPV
LABELV $361
line 675
;674:		else
;675:			self->damage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 0
ASGNI4
LABELV $362
line 676
;676:	}
LABELV $359
line 677
;677:}
LABELV $339
endproc target_relay_use 48 12
export SP_target_relay
proc SP_target_relay 0 0
line 679
;678:
;679:void SP_target_relay (gentity_t *self) {
line 680
;680:	self->use = target_relay_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_relay_use
ASGNP4
line 681
;681:	self->r.linked = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTI4 1
ASGNI4
line 682
;682:}
LABELV $363
endproc SP_target_relay 0 0
export target_logic_reset
proc target_logic_reset 4 0
line 691
;683:
;684://==========================================================
;685:
;686:/*QUAKED target_logic (.5 .5 .5) (-8 -8 -8) (8 8 8) RED_ONLY BLUE_ONLY RANDOM STAY_ON
;687:This doesn't perform any actions except fire its targets when it's triggered by two different triggers.
;688:The activator can be forced to be from a certain team.
;689:if RANDOM is checked, only one of the targets will be fired, not all of them
;690:*/
;691:void target_logic_reset (gentity_t *self) {
line 693
;692:	int i;
;693:	for (i = 0; i < MAX_LOGIC_ENTITIES; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $365
line 694
;694:		self->logicEntities[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
ADDP4
CNSTI4 0
ASGNI4
LABELV $366
line 693
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $365
line 695
;695:}
LABELV $364
endproc target_logic_reset 4 0
export target_logic_use
proc target_logic_use 48 12
line 697
;696:
;697:void target_logic_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 705
;698:	int			i;
;699:	int			triggerCount;		//number of entities targetting this target_logic
;700:	int			triggeredCount;		//number of entities targetting this target_logic that have already been triggered
;701:	qboolean	found;
;702:	gentity_t	*t;
;703:
;704:	//determine the number of entities (triggers) targeting this target_logic
;705:	triggerCount = triggeredCount = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 706
;706:	t = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRGP4 $371
JUMPV
LABELV $370
line 707
;707:	while ( (t = G_Find (t, FOFS(target), self->targetname)) != NULL ) {
line 708
;708:		found = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 709
;709:		if ( t == self ) {
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $373
line 710
;710:			G_Printf ("WARNING: Entity %s at %s used itself.\n", self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $375
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 711
;711:		} else {
ADDRGP4 $374
JUMPV
LABELV $373
line 712
;712:			triggerCount++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 713
;713:		}
LABELV $374
line 714
;714:	}
LABELV $371
line 707
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 720
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $370
line 717
;715:
;716:	//count the number of entities that have already triggered the target_logic
;717:	for ( i = 0; i < MAX_LOGIC_ENTITIES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $376
line 718
;718:		if ( self->logicEntities[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $380
line 719
;719:			triggeredCount++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 722
;720:
;721:			//if the entity that is currently being triggered is in the list, see if we should remove it again
;722:			if ( self->logicEntities[i] == other->s.number ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
NEI4 $382
line 723
;723:				found = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 726
;724:				
;725:				//STAY_ON is not selected, remove the trigger for the list of triggered entities
;726:				if ( !(self->spawnflags & 8) ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $384
line 727
;727:					self->logicEntities[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 728
;728:					triggeredCount--;		//the trigger was counted as being triggerd, but is not so anymore
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 729
;729:				}
LABELV $384
line 730
;730:			}
LABELV $382
line 731
;731:		}
LABELV $380
line 732
;732:	}
LABELV $377
line 717
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $376
line 735
;733:
;734:	//the entity was not yet in the list of triggered entities, so add it
;735:	if ( !found ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $386
line 736
;736:		for ( i = 0; i < MAX_LOGIC_ENTITIES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $388
line 737
;737:			if ( !self->logicEntities[i] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $392
line 738
;738:			{
line 739
;739:				self->logicEntities[i] = other->s.number;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1076
ADDP4
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 740
;740:				triggeredCount++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 741
;741:				break;
ADDRGP4 $390
JUMPV
LABELV $392
line 743
;742:			}
;743:		}
LABELV $389
line 736
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $388
LABELV $390
line 744
;744:	}
LABELV $386
line 746
;745:       
;746:	if ( triggerCount == triggeredCount ) {
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $394
line 747
;747:		target_logic_reset( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_logic_reset
CALLV
pop
line 750
;748:
;749:		//If RANDOM is selected so use a random target
;750:		if ( self->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $396
line 753
;751:			gentity_t	*ent;
;752:
;753:			ent = G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
ASGNP4
line 754
;754:			if ( ent && ent->use ) {
ADDRLP4 36
ADDRLP4 28
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
EQU4 $369
ADDRLP4 36
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $369
line 755
;755:				ent->use( ent, self, activator );
ADDRLP4 44
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 756
;756:			}
line 757
;757:			return;
ADDRGP4 $369
JUMPV
LABELV $396
line 761
;758:		}
;759:		
;760:		//The RANDOM spawnflag wasn't selected, so use all targets
;761:		G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 762
;762:	}
LABELV $394
line 763
;763:}
LABELV $369
endproc target_logic_use 48 12
export SP_target_logic
proc SP_target_logic 0 4
line 767
;764:
;765:
;766:
;767:void SP_target_logic (gentity_t *self) {
line 768
;768:	self->use = target_logic_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_logic_use
ASGNP4
line 769
;769:	target_logic_reset( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_logic_reset
CALLV
pop
line 770
;770:}
LABELV $400
endproc SP_target_logic 0 4
export target_mapchange_use
proc target_mapchange_use 0 8
line 777
;771:
;772://==========================================================
;773:
;774:/*QUAKED target_mapchange (.5 .5 .5) (-8 -8 -8) (8 8 8)
;775:When triggered, loads the specified map. 
;776:*/
;777:void target_mapchange_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 778
;778:	self->nextthink = level.time + FADEOUT_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1140457472
ADDF4
CVFI4 4
ASGNI4
line 781
;779:	
;780:	//store session data to persist health/armor/weapons/ammo and variables to next level (only in SP mode)
;781:	G_UpdateClientSessionDataForMapChange( activator->client );
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UpdateClientSessionDataForMapChange
CALLI4
pop
line 782
;782:	G_UpdateGlobalSessionDataForMapChange();
ADDRGP4 G_UpdateGlobalSessionDataForMapChange
CALLI4
pop
line 784
;783:	
;784:	G_FadeOut( FADEOUT_TIME / 1000, -1 );
CNSTF4 1056964608
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 G_FadeOut
CALLV
pop
line 785
;785:}
LABELV $401
endproc target_mapchange_use 0 8
export target_mapchange_think
proc target_mapchange_think 8 12
line 787
;786:
;787:void target_mapchange_think (gentity_t *self) {
line 791
;788:	char	*cmd;	
;789:
;790:	//determine map switch command to use
;791:	if ( g_gametype.integer == GT_SINGLE )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $404
line 792
;792:		cmd = "spmap";		//keep single player enabled
ADDRLP4 0
ADDRGP4 $407
ASGNP4
ADDRGP4 $405
JUMPV
LABELV $404
line 794
;793:	else
;794:		cmd = "map";
ADDRLP4 0
ADDRGP4 $408
ASGNP4
LABELV $405
line 797
;795:
;796:	//perform map switch
;797:	if ( self->mapname )
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $409
line 798
;798:		trap_SendConsoleCommand( EXEC_INSERT, va( "%s %s\n", cmd, self->mapname ) ); 
ADDRGP4 $411
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $410
JUMPV
LABELV $409
line 800
;799:	else
;800:		trap_SendConsoleCommand( EXEC_INSERT, "map_restart 0\n" ); //shouldn't happen
CNSTI4 1
ARGI4
ADDRGP4 $412
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $410
line 801
;801:}
LABELV $403
endproc target_mapchange_think 8 12
export SP_target_mapchange
proc SP_target_mapchange 1028 8
line 803
;802:
;803:void SP_target_mapchange (gentity_t *self) {
line 806
;804:	char info[1024];
;805:
;806:	if ( !self->mapname )
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $414
line 807
;807:	{
line 808
;808:		trap_GetServerinfo(info, sizeof(info));
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 809
;809:		self->mapname = Info_ValueForKey( info, "mapname" );
ADDRLP4 0
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 1068
ADDP4
ADDRLP4 1024
INDIRP4
ASGNP4
line 810
;810:	}
LABELV $414
line 811
;811:	self->use = target_mapchange_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_mapchange_use
ASGNP4
line 812
;812:	self->think = target_mapchange_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 target_mapchange_think
ASGNP4
line 813
;813:}
LABELV $413
endproc SP_target_mapchange 1028 8
export target_gravity_use
proc target_gravity_use 4 0
line 821
;814:
;815://==========================================================
;816:
;817:/*QUAKED target_gravity (.5 .5 .5) (-8 -8 -8) (8 8 8) GLOBAL
;818:Sets the gravity of the activator. The gravity is set through the "count" key.
;819:If GLOBAL is checked, all players in the game will have their gravity changed.
;820:*/
;821:void target_gravity_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 824
;822:	int i;
;823:
;824:	if ( !self->count )
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 0
NEI4 $418
line 825
;825:		self->count = g_gravity.integer;
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDRGP4 g_gravity+12
INDIRI4
ASGNI4
LABELV $418
line 827
;826:	
;827:	if ( (self->spawnflags & 1) )
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $421
line 828
;828:	{
line 829
;829:		for (i = 0; i < level.maxclients; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $426
JUMPV
LABELV $423
line 830
;830:		{
line 831
;831:			level.clients[i].ps.gravity = self->count;
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 48
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 832
;832:		}
LABELV $424
line 829
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $426
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $423
line 833
;833:	}
ADDRGP4 $422
JUMPV
LABELV $421
line 835
;834:	else
;835:		activator->client->ps.gravity = self->count;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
LABELV $422
line 836
;836:}
LABELV $417
endproc target_gravity_use 4 0
export SP_target_gravity
proc SP_target_gravity 0 0
line 838
;837:
;838:void SP_target_gravity (gentity_t *self) {
line 839
;839:	self->use = target_gravity_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_gravity_use
ASGNP4
line 840
;840:}
LABELV $428
endproc SP_target_gravity 0 0
export target_botspawn_use
proc target_botspawn_use 8 32
line 851
;841:
;842://==========================================================
;843:
;844:/*QUAKED target_botspawn (.5 .5 .5) (-8 -8 -8) (8 8 8) 
;845:WP_GAUNTLET WP_MACHINEGUN WP_SHOTGUN WP_GRENADE_LAUNCHER WP_ROCKET_LAUNCHER WP_LIGHTNING WP_RAILGUN WP_PLASMAGUN WP_BFG - - IGNORE_PLAYER PATROL_WALK ALWAYS_WALK 
;846:Spawns a bot into the game
;847:Use the health key to determine the amount of health the bot will spawn with
;848:The entity specified with deathtarget will be activated when the spawned bot dies
;849:Use the skill key to specify the skill level for the bot relative to the g_spskill level. This is only applied to the amount of damage it deals.
;850:*/
;851:void target_botspawn_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 852
;852:	if ( g_debugBotspawns.integer ) 
ADDRGP4 g_debugBotspawns+12
INDIRI4
CNSTI4 0
EQI4 $430
line 853
;853:		G_Printf("\ntime %i\n spawn bot \"%s\"\n botspawn \"%s\" / \"%s\" (%i)\n waypoint \"%s\"\n health %i\n", level.time, self->clientname, self->targetname, self->targetname2, self->s.number, self->target, self->health);
ADDRGP4 $433
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 2108
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
LABELV $430
line 854
;854:	G_AddCustomBot( self->clientname, self->s.number, self->target, self->skill, self->type, self->message );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_AddCustomBot
CALLI4
pop
line 855
;855:}
LABELV $429
endproc target_botspawn_use 8 32
export botsandbox_check
proc botsandbox_check 8 4
line 857
;856:
;857:void botsandbox_check (gentity_t *self){
line 858
;858:	if(self->parent && self->parent->health <= 0){
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $436
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
GTI4 $436
line 859
;859:	self->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTP4 0
ASGNP4
line 860
;860:	self->nextthink = level.time + 1;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 861
;861:	G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 862
;862:	}
LABELV $436
line 863
;863:	VectorCopy( self->parent->s.pos.trBase, self->s.origin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 864
;864:	self->think = botsandbox_check;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 botsandbox_check
ASGNP4
line 865
;865:	self->nextthink = level.time + 1;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 866
;866:}
LABELV $435
endproc botsandbox_check 8 4
export SP_target_botspawn
proc SP_target_botspawn 20 36
line 868
;867:
;868:void SP_target_botspawn (gentity_t *self) {
line 869
;869:	float healthMultiplier = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 871
;870:	float skill;
;871:	if(self->sb_ettype <= 0){
ADDRFP4 0
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
CNSTI4 0
GTI4 $441
line 872
;872:	if ( !self->clientname || !strcmp(self->clientname, "") )
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $446
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $445
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $443
LABELV $446
line 873
;873:		self->clientname = "sarge";
ADDRFP4 0
INDIRP4
CNSTI4 1064
ADDP4
ADDRGP4 $447
ASGNP4
LABELV $443
line 875
;874:
;875:	G_SpawnFloat( "skill", "0", &self->skill );
ADDRGP4 $448
ARGP4
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2180
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 878
;876:
;877:	//determine bot's health based on current and relative skill level
;878:	if ( !self->health )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
NEI4 $449
line 879
;879:		self->health = 100;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 100
ASGNI4
LABELV $449
line 881
;880:
;881:	skill = self->skill;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
ASGNF4
line 882
;882:	if ( skill < 1 )
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
GEF4 $451
line 883
;883:		skill = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
LABELV $451
line 886
;884:
;885:	//bot's health will be 20% less for each skill level under level 3 and 20% more for each skill level above level 3
;886:	healthMultiplier = 1 + ((skill - 3) * 0.2);
ADDRLP4 0
CNSTF4 1045220557
ADDRLP4 4
INDIRF4
CNSTF4 1077936128
SUBF4
MULF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 887
;887:	self->health *= healthMultiplier;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 889
;888:
;889:	self->use = target_botspawn_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_botspawn_use
ASGNP4
line 890
;890:	} else {
ADDRGP4 $442
JUMPV
LABELV $441
line 891
;891:		G_AddBot(self->clientname, self->skill, "Blue", 0, self->message, self->s.number, self->target, self->type, self );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
ARGF4
ADDRGP4 $453
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_AddBot
CALLI4
pop
line 892
;892:	}
LABELV $442
line 893
;893:}
LABELV $440
endproc SP_target_botspawn 20 36
export target_unlink_use
proc target_unlink_use 0 4
line 900
;894:
;895://==========================================================
;896:
;897:/*QUAKED target_disable (.5 .5 .5) (-8 -8 -8) (8 8 8) - - ALWAYS_UNLINK ALWAYS_LINK IMMEDIATELY
;898:links or unlinks entities from the world, effectively enabling or disabling triggers
;899:*/
;900:void target_unlink_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 901
;901:	G_ToggleTargetsLinked( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ToggleTargetsLinked
CALLI4
pop
line 902
;902:}
LABELV $454
endproc target_unlink_use 0 4
export target_unlink_think
proc target_unlink_think 0 4
line 905
;903:
;904://used for immediately spawnflag
;905:void target_unlink_think (gentity_t *self) {
line 906
;906:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 907
;907:	G_ToggleTargetsLinked( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ToggleTargetsLinked
CALLI4
pop
line 908
;908:}
LABELV $455
endproc target_unlink_think 0 4
export SP_target_unlink
proc SP_target_unlink 0 0
line 910
;909:
;910:void SP_target_unlink (gentity_t *self) {
line 911
;911:	self->use = target_unlink_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_unlink_use
ASGNP4
line 913
;912:	
;913:	if ( ( self->spawnflags & 16 ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $457
line 914
;914:		self->nextthink = level.time + FRAMETIME * 3;	//unlink entities next frame so they can spawn first
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 915
;915:		self->think = target_unlink_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 target_unlink_think
ASGNP4
line 916
;916:	}
LABELV $457
line 917
;917:}
LABELV $456
endproc SP_target_unlink 0 0
export target_playerspeed_use
proc target_playerspeed_use 8 0
line 924
;918:
;919://==========================================================
;920:
;921:/*QUAKED target_playerspeed (.5 .5 .5) (-8 -8 -8) (8 8 8) GLOBAL
;922:Sets the movement speed for player(s). Defaults to the speed set through the g_speed cvar (320 by default).
;923:*/
;924:void target_playerspeed_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 925
;925:	if ( !self->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $461
line 926
;926:		self->speed = g_speed.value;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 g_speed+8
INDIRF4
ASGNF4
line 927
;927:	}
LABELV $461
line 929
;928:
;929:	if ( self->speed == -1 )
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $464
line 930
;930:		activator->client->ps.pm_type = PM_FREEZE;
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $465
JUMPV
LABELV $464
line 931
;931:	else {
line 932
;932:		activator->client->ps.pm_type = PM_NORMAL;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 933
;933:		activator->speed = self->speed;	//this doesn't actually change the player's speed. This value is read in ClientThink_real (g_active.c) again.
ADDRLP4 4
CNSTI4 744
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 934
;934:	}
LABELV $465
line 935
;935:}
LABELV $460
endproc target_playerspeed_use 8 0
export SP_target_playerspeed
proc SP_target_playerspeed 0 0
line 937
;936:
;937:void SP_target_playerspeed (gentity_t *self) {
line 938
;938:	self->use = target_playerspeed_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_playerspeed_use
ASGNP4
line 939
;939:}
LABELV $466
endproc SP_target_playerspeed 0 0
export target_debrisemitter_use
proc target_debrisemitter_use 12 8
line 948
;940:
;941://==========================================================
;942:
;943:/*QUAKED target_debrisemitter (.5 .5 .5) (-8 -8 -8) (8 8 8) see PickDebrisType in g_util.c for spawnflags
;944:Emits chunks of debris.
;945:If no spawnflag is set, the entity will emit light chunks of concrete
;946:*/
;947:
;948:void target_debrisemitter_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 951
;949:	gentity_t *ent;
;950:	
;951:	if ( !self->count )
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 0
NEI4 $468
line 952
;952:		self->count = 10;
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 10
ASGNI4
LABELV $468
line 954
;953:
;954:	ent = G_TempEntity( self->s.origin, PickDebrisType( self->spawnflags ) );
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 PickDebrisType
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 955
;955:	ent->s.eventParm = self->count;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 956
;956:}
LABELV $467
endproc target_debrisemitter_use 12 8
export SP_target_debrisemitter
proc SP_target_debrisemitter 0 0
line 958
;957:
;958:void SP_target_debrisemitter (gentity_t *self) {
line 959
;959:	self->use = target_debrisemitter_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_debrisemitter_use
ASGNP4
line 960
;960:}
LABELV $470
endproc SP_target_debrisemitter 0 0
export target_objective_use
proc target_objective_use 0 8
line 969
;961:
;962://==========================================================
;963:
;964:/*QUAKED target_objective (.5 .5 .5) (-8 -8 -8) (8 8 8) SECONDARY SILENT
;965:Sets the textual representation of the player's objective.
;966:Set the SECONDARY spawnflag to set the secondary objective instead of the primary.
;967:*/
;968:
;969:void target_objective_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 971
;970:	
;971:	if ( self->spawnflags & 1 )
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $472
line 972
;972:		trap_SetConfigstring( CS_SECONDARYOBJECTIVE, self->message );
CNSTI4 8609
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
ADDRGP4 $473
JUMPV
LABELV $472
line 974
;973:	else
;974:		trap_SetConfigstring( CS_PRIMARYOBJECTIVE, self->message );
CNSTI4 8608
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $473
line 976
;975:
;976:	if ( !(self->spawnflags & 2) )
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $474
line 977
;977:		trap_SendServerCommand( -1, "ou" );
CNSTI4 -1
ARGI4
ADDRGP4 $476
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $474
line 979
;978:		//G_TempEntity( self->s.origin, EV_OBJECTIVES_UPDATED );
;979:}
LABELV $471
endproc target_objective_use 0 8
export SP_target_objective
proc SP_target_objective 0 12
line 981
;980:
;981:void SP_target_objective (gentity_t *self) {
line 982
;982:	G_SpawnInt( "id", "-1", &self->s.generic1 );
ADDRGP4 $478
ARGP4
ADDRGP4 $249
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 983
;983:	self->use = target_objective_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_objective_use
ASGNP4
line 984
;984:}
LABELV $477
endproc SP_target_objective 0 12
export target_skill_use
proc target_skill_use 4 8
line 992
;985:
;986://==========================================================
;987:
;988:/*QUAKED target_skill (.5 .5 .5) (-8 -8 -8) (8 8 8)
;989:Sets the skill level for the next map that will be loaded
;990:*/
;991:
;992:void target_skill_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 993
;993:	trap_SendConsoleCommand( EXEC_INSERT, va( "seta g_spskill %i\n", self->skill) );
ADDRGP4 $480
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 994
;994:}
LABELV $479
endproc target_skill_use 4 8
export SP_target_skill
proc SP_target_skill 0 12
line 996
;995:
;996:void SP_target_skill (gentity_t *self) {
line 997
;997:	G_SpawnFloat( "skill", "2", &self->skill );
ADDRGP4 $448
ARGP4
ADDRGP4 $482
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2180
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 999
;998:
;999:	if ( self->skill > 14 ) 
ADDRFP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
CNSTF4 1096810496
LEF4 $483
line 1000
;1000:		self->skill = 14;
ADDRFP4 0
INDIRP4
CNSTI4 2180
ADDP4
CNSTF4 1096810496
ASGNF4
ADDRGP4 $484
JUMPV
LABELV $483
line 1001
;1001:	else if ( self->skill < 1 )
ADDRFP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
CNSTF4 1065353216
GEF4 $485
line 1002
;1002:		self->skill = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2180
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $485
LABELV $484
line 1004
;1003:	
;1004:	self->use = target_skill_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_skill_use
ASGNP4
line 1005
;1005:}
LABELV $481
endproc SP_target_skill 0 12
export target_earthquake_use
proc target_earthquake_use 0 12
line 1015
;1006:
;1007://==========================================================
;1008:
;1009:/*QUAKED target_earthquake (.5 .5 .5) (-8 -8 -8) (8 8 8)
;1010:starts earthquake
;1011:"length" - length in  seconds (2-32, in steps of 2)
;1012:"intensity" - strength of earthquake (1-16)
;1013:*/
;1014:
;1015:void target_earthquake_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1016
;1016:	G_AddEvent(activator, EV_EARTHQUAKE, self->s.generic1);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1017
;1017:}
LABELV $487
endproc target_earthquake_use 0 12
export SP_target_earthquake
proc SP_target_earthquake 24 12
line 1019
;1018:
;1019:void SP_target_earthquake (gentity_t *self) {
line 1027
;1020:	int param;
;1021:	float length;		// length in seconds (3 to 32)
;1022:	float intensity;	// intensity (1 to 16)
;1023:	int length_;
;1024:	int intensity_;
;1025:	
;1026:	// read parameters
;1027:	G_SpawnFloat( "length", "3.0", &length );
ADDRGP4 $489
ARGP4
ADDRGP4 $490
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1028
;1028:	G_SpawnFloat( "intensity", "1.0", &intensity );
ADDRGP4 $491
ARGP4
ADDRGP4 $492
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1029
;1029:	if ( length < 2 ) length = 2;
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
GEF4 $493
ADDRLP4 0
CNSTF4 1073741824
ASGNF4
LABELV $493
line 1030
;1030:	if ( length > 32 ) length = 32;
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
LEF4 $495
ADDRLP4 0
CNSTF4 1107296256
ASGNF4
LABELV $495
line 1031
;1031:	if ( intensity < 1 ) intensity = 1;
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
GEF4 $497
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
LABELV $497
line 1032
;1032:	if ( intensity > 16 ) intensity = 16;
ADDRLP4 4
INDIRF4
CNSTF4 1098907648
LEF4 $499
ADDRLP4 4
CNSTF4 1098907648
ASGNF4
LABELV $499
line 1035
;1033:	
;1034:	// adjust parameters
;1035:	length_ = ((int)(length) - 2) / 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
ADDRLP4 12
ADDRLP4 0
INDIRF4
CVFI4 4
ADDRLP4 20
INDIRI4
SUBI4
ADDRLP4 20
INDIRI4
DIVI4
ASGNI4
line 1036
;1036:	intensity_ = (int)intensity - 1;
ADDRLP4 16
ADDRLP4 4
INDIRF4
CVFI4 4
CNSTI4 1
SUBI4
ASGNI4
line 1037
;1037:	param = ( intensity_ | (length_ << 4) );
ADDRLP4 8
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
BORI4
ASGNI4
line 1038
;1038:	self->s.generic1 = param;
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1039
;1039:	self->use = target_earthquake_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_earthquake_use
ASGNP4
line 1040
;1040:	self->s.eType = ET_EVENTS;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 15
ASGNI4
line 1041
;1041:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1042
;1042:}
LABELV $488
endproc SP_target_earthquake 24 12
export target_effect_use
proc target_effect_use 32 16
line 1058
;1043:
;1044://==========================================================
;1045:
;1046:/*QUAKED target_effect (.5 .5 .5) (-8 -8 -8) (8 8 8) EXPLOSION PARTICLES_GRAVITY PARTICLES_LINEAR PARTICLES_LINEAR_UP PARTICLES_LINEAR_DOWN OVERLAY FADE
;1047:shows animated environmental effect
;1048:The EXPLOSION spawnflag will cause the entity to show an explosion
;1049:The PARTICLES_GRAVITY spawnflag will cause the entity to show particles which are affected by gravity and drop to the ground
;1050:The PARTICLES_LINEAR spawnflag will cause the entity to show particles which are not affected by gravity and move in a straight line
;1051:color key takes normalized color values (0.0 - 1.0)
;1052:startcolor key takes normalized color values (0.0 - 1.0)
;1053:endcolor key takes normalized color values (0.0 - 1.0)
;1054:count key takes int (0 - 255)
;1055:speed key takes int (0 - 255)
;1056:*/
;1057:
;1058:void target_effect_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1065
;1059:	gentity_t	*ent2;
;1060:	gentity_t	*ent3;
;1061:	gentity_t	*ent4;
;1062:	gentity_t	*ent5;
;1063:	gentity_t   *ent6;
;1064:
;1065:	if ( !self->r.linked )
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
NEI4 $502
line 1066
;1066:		return;
ADDRGP4 $501
JUMPV
LABELV $502
line 1069
;1067:
;1068:	//explosion
;1069:	if ( self->spawnflags & SF_EFFECT_EXPLOSION ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $504
line 1070
;1070:		G_TempEntity( self->s.origin, EV_EXPLOSION );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 93
ARGI4
ADDRGP4 G_TempEntity
CALLP4
pop
line 1071
;1071:	}
LABELV $504
line 1074
;1072:
;1073:	//particles_gravity
;1074:	if ( self->spawnflags & SF_EFFECT_PARTICLES_GRAVITY ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $506
line 1075
;1075:		ent2 = G_TempEntity( self->s.origin, EV_PARTICLES_GRAVITY );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1076
;1076:		ent2->s.constantLight = self->s.constantLight;	//constantLight is used to determine particle color
ADDRLP4 24
CNSTI4 164
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
line 1077
;1077:		ent2->s.eventParm = self->count; //eventParm is used to determine the number of particles
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 1078
;1078:		ent2->s.generic1 = self->speed; //generic1 is used to determine the speed of the particles
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1079
;1079:		ent2->s.generic2 = atoi(self->value); //generic2 is used to determine the size of the particles
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1080
;1080:	}
LABELV $506
line 1083
;1081:
;1082:	//particles_linear
;1083:	if ( self->spawnflags & SF_EFFECT_PARTICLES_LINEAR ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $508
line 1084
;1084:		ent3 = G_TempEntity( self->s.origin, EV_PARTICLES_LINEAR );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 95
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1085
;1085:		ent3->s.constantLight = self->s.constantLight;	//constantLight is used to determine particle color
ADDRLP4 24
CNSTI4 164
ASGNI4
ADDRLP4 8
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
line 1086
;1086:		ent3->s.eventParm = self->count; //eventParm is used to determine the number of particles
ADDRLP4 8
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 1087
;1087:		ent3->s.generic1 = self->speed; //generic1 is used to determine the speed of the particles
ADDRLP4 8
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1088
;1088:		ent2->s.generic2 = atoi(self->value); //generic2 is used to determine the size of the particles
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1089
;1089:	}
LABELV $508
line 1092
;1090:
;1091:	//particles_linear_up
;1092:	if ( self->spawnflags & SF_EFFECT_PARTICLES_LINEAR_UP ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $510
line 1093
;1093:		ent4 = G_TempEntity( self->s.origin, EV_PARTICLES_LINEAR_UP );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 96
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 1094
;1094:		ent4->s.constantLight = self->s.constantLight;	//constantLight is used to determine particle color
ADDRLP4 24
CNSTI4 164
ASGNI4
ADDRLP4 12
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
line 1095
;1095:		ent4->s.eventParm = self->count; //eventParm is used to determine the number of particles
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 1096
;1096:		ent4->s.generic1 = self->speed; //generic1 is used to determine the speed of the particles
ADDRLP4 12
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1097
;1097:		ent2->s.generic2 = atoi(self->value); //generic2 is used to determine the size of the particles
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1098
;1098:	}
LABELV $510
line 1101
;1099:
;1100:	//particles_linear_down
;1101:	if ( self->spawnflags & SF_EFFECT_PARTICLES_LINEAR_DOWN ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $512
line 1102
;1102:		ent5 = G_TempEntity( self->s.origin, EV_PARTICLES_LINEAR_DOWN );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 97
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 1103
;1103:		ent5->s.constantLight = self->s.constantLight;	//constantLight is used to determine particle color
ADDRLP4 24
CNSTI4 164
ASGNI4
ADDRLP4 16
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
line 1104
;1104:		ent5->s.eventParm = self->count; //eventParm is used to determine the number of particles
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
line 1105
;1105:		ent5->s.generic1 = self->speed; //generic1 is used to determine the speed of the particles
ADDRLP4 16
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1106
;1106:		ent2->s.generic2 = atoi(self->value); //generic2 is used to determine the size of the particles
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1107
;1107:	}
LABELV $512
line 1110
;1108:
;1109:	//overlay
;1110:	if ( self->spawnflags & SF_EFFECT_OVERLAY ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $514
line 1111
;1111:		if ( self->overlay ) {
ADDRFP4 0
INDIRP4
CNSTI4 2184
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $516
line 1112
;1112:			trap_SetConfigstring( CS_OVERLAY, self->overlay );
CNSTI4 8610
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2184
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1113
;1113:		} else {
ADDRGP4 $517
JUMPV
LABELV $516
line 1114
;1114:			trap_SetConfigstring( CS_OVERLAY, "" );
CNSTI4 8610
ARGI4
ADDRGP4 $445
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1115
;1115:		}
LABELV $517
line 1118
;1116:		
;1117:		//send event to player which will register the asset so it may subsequently be drawn each frame.
;1118:		G_TempEntity( self->s.origin, EV_OVERLAY );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 98
ARGI4
ADDRGP4 G_TempEntity
CALLP4
pop
line 1119
;1119:	}
LABELV $514
line 1122
;1120:
;1121:	//fade
;1122:	if ( self->spawnflags & SF_EFFECT_FADE ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $518
line 1123
;1123:		if ( self->spawnflags & SF_EFFECT_ACTIVATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $520
line 1124
;1124:		G_Fade( self->wait, self->rgba1, self->rgba2, activator-g_entities ); 
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 2216
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 2232
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRGP4 G_Fade
CALLV
pop
line 1125
;1125:		} else {
ADDRGP4 $521
JUMPV
LABELV $520
line 1126
;1126:		G_Fade( self->wait, self->rgba1, self->rgba2, -1 ); 
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 2216
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 2232
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 G_Fade
CALLV
pop
line 1127
;1127:		}
LABELV $521
line 1128
;1128:	}
LABELV $518
line 1131
;1129:
;1130:	//smoke
;1131:	if (self->spawnflags & SF_EFFECT_SMOKEPUFF) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $522
line 1132
;1132:		ent6 = G_TempEntity(self->s.origin, EV_SMOKEPUFF);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 99
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 1133
;1133:		ent6->s.constantLight = self->s.constantLight;
ADDRLP4 24
CNSTI4 164
ASGNI4
ADDRLP4 4
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
line 1134
;1134:		ent6->s.eventParm = self->wait;	//eventParm is used to determine the amount of time the smoke puff exists
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1135
;1135:		ent6->s.generic1 = self->speed;	//generic1 is used to determine the movement speed of the smoke puff
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1136
;1136:		ent6->s.otherEntityNum = self->distance * 32; //otherEntityNum is used to determine the size of the smokepuff. The default is 32.
ADDRLP4 4
INDIRP4
CNSTI4 152
ADDP4
CNSTF4 1107296256
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1137
;1137:		VectorCopy(self->s.angles, ent6->s.angles);
ADDRLP4 28
CNSTI4 128
ASGNI4
ADDRLP4 4
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
line 1138
;1138:	}
LABELV $522
line 1139
;1139:}
LABELV $501
endproc target_effect_use 32 16
export target_effect_think
proc target_effect_think 52 4
line 1141
;1140:
;1141:void target_effect_think(gentity_t* self) {
line 1146
;1142:	gentity_t* tmp;
;1143:	vec3_t		wut;
;1144:	vec3_t		dir;
;1145:
;1146:	if (self->target) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $525
line 1147
;1147:		tmp = G_PickTarget(self->target);
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1148
;1148:		VectorSubtract(tmp->s.origin, self->s.origin, dir);
ADDRLP4 36
CNSTI4 92
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 96
ASGNI4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 100
ASGNI4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1149
;1149:		VectorCopy(dir, self->s.angles);
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1150
;1150:	}
ADDRGP4 $526
JUMPV
LABELV $525
line 1151
;1151:	else if (self->target2) {
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $529
line 1152
;1152:		tmp = G_PickTarget(self->target2);
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1153
;1153:		VectorSubtract(tmp->s.origin, self->s.origin, dir);
ADDRLP4 36
CNSTI4 92
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 96
ASGNI4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 100
ASGNI4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1154
;1154:		VectorCopy(dir, self->s.angles);
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1155
;1155:	}
ADDRGP4 $530
JUMPV
LABELV $529
line 1156
;1156:	else {
line 1157
;1157:		self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTF4 0
ASGNF4
line 1158
;1158:		self->s.angles[1] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTF4 0
ASGNF4
line 1159
;1159:		self->s.angles[2] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
CNSTF4 1065353216
ASGNF4
line 1160
;1160:	}
LABELV $530
LABELV $526
line 1161
;1161:	VectorNormalize(self->s.angles);
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1163
;1162:
;1163:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 1164
;1164:}
LABELV $524
endproc target_effect_think 52 4
export SP_target_effect
proc SP_target_effect 56 12
line 1166
;1165:
;1166:void SP_target_effect (gentity_t *self) {
line 1173
;1167:	vec3_t		color;
;1168:	float		light;
;1169:	int			r, g, b, i;
;1170:	float		scale;
;1171:	
;1172:	//check if effects are selected
;1173:	if ( !self->spawnflags ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 0
NEI4 $534
line 1174
;1174:		G_Printf( va( S_COLOR_YELLOW "WARNING: %s without selected effects at %s\n", self->classname, vtos(self->s.origin) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $536
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1175
;1175:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1176
;1176:	}
LABELV $534
line 1180
;1177:	
;1178:	// particle/smoke color
;1179:	if ( 
;1180:		self->spawnflags & SF_EFFECT_PARTICLES_GRAVITY || 
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $542
ADDRLP4 36
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $542
ADDRLP4 36
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $542
ADDRLP4 36
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $542
ADDRLP4 36
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $537
LABELV $542
line 1185
;1181:		self->spawnflags & SF_EFFECT_PARTICLES_LINEAR || 
;1182:		self->spawnflags & SF_EFFECT_PARTICLES_LINEAR_UP ||
;1183:		self->spawnflags & SF_EFFECT_PARTICLES_LINEAR_DOWN ||
;1184:		self->spawnflags & SF_EFFECT_SMOKEPUFF
;1185:	) {
line 1186
;1186:		G_SpawnVector( "color", "1 1 1", color );
ADDRGP4 $319
ARGP4
ADDRGP4 $543
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnVector
CALLI4
pop
line 1187
;1187:		G_SpawnInt( "value", "3", &self->s.generic2 );		//particle size
ADDRGP4 $544
ARGP4
ADDRGP4 $545
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1189
;1188:
;1189:		r = color[0] * 255;
ADDRLP4 12
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1190
;1190:		if ( r > 255 ) {
ADDRLP4 12
INDIRI4
CNSTI4 255
LEI4 $546
line 1191
;1191:			r = 255;
ADDRLP4 12
CNSTI4 255
ASGNI4
line 1192
;1192:		}
LABELV $546
line 1193
;1193:		g = color[1] * 255;
ADDRLP4 16
CNSTF4 1132396544
ADDRLP4 0+4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1194
;1194:		if ( g > 255 ) {
ADDRLP4 16
INDIRI4
CNSTI4 255
LEI4 $549
line 1195
;1195:			g = 255;
ADDRLP4 16
CNSTI4 255
ASGNI4
line 1196
;1196:		}
LABELV $549
line 1197
;1197:		b = color[2] * 255;
ADDRLP4 20
CNSTF4 1132396544
ADDRLP4 0+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1198
;1198:		if ( b > 255 ) {
ADDRLP4 20
INDIRI4
CNSTI4 255
LEI4 $552
line 1199
;1199:			b = 255;
ADDRLP4 20
CNSTI4 255
ASGNI4
line 1200
;1200:		}
LABELV $552
line 1201
;1201:		i = light / 4;
ADDRLP4 24
ADDRLP4 32
INDIRF4
CNSTF4 1082130432
DIVF4
CVFI4 4
ASGNI4
line 1202
;1202:		if ( i > 255 ) {
ADDRLP4 24
INDIRI4
CNSTI4 255
LEI4 $554
line 1203
;1203:			i = 255;
ADDRLP4 24
CNSTI4 255
ASGNI4
line 1204
;1204:		}
LABELV $554
line 1205
;1205:		self->s.constantLight = r | ( g << 8 ) | ( b << 16 ) | ( i << 24 );
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 20
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 24
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 1206
;1206:	}
LABELV $537
line 1210
;1207:
;1208:	//particle count
;1209:	if ( 
;1210:		self->spawnflags & SF_EFFECT_PARTICLES_GRAVITY || 
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $560
ADDRLP4 44
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $560
ADDRLP4 44
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $560
ADDRLP4 44
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 48
INDIRI4
EQI4 $556
LABELV $560
line 1214
;1211:		self->spawnflags & SF_EFFECT_PARTICLES_LINEAR || 
;1212:		self->spawnflags & SF_EFFECT_PARTICLES_LINEAR_UP ||
;1213:		self->spawnflags & SF_EFFECT_PARTICLES_LINEAR_DOWN
;1214:	) {
line 1215
;1215:		if ( !self->count )
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 0
NEI4 $561
line 1216
;1216:			self->count = 100;
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 100
ASGNI4
ADDRGP4 $562
JUMPV
LABELV $561
line 1217
;1217:		else if (self->count > 255)
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 255
LEI4 $563
line 1218
;1218:			self->count = 255;
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 255
ASGNI4
LABELV $563
LABELV $562
line 1220
;1219:
;1220:		if ( !self->speed )
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $565
line 1221
;1221:			self->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTF4 1120403456
ASGNF4
LABELV $565
line 1222
;1222:	}
LABELV $556
line 1225
;1223:
;1224:	//smoke speed, duration and angle
;1225:	if (self->spawnflags & SF_EFFECT_SMOKEPUFF) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $567
line 1226
;1226:		if ( !self->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $569
line 1227
;1227:			self->speed = 16;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTF4 1098907648
ASGNF4
line 1228
;1228:		}
LABELV $569
line 1229
;1229:		if (!self->wait) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CNSTF4 0
NEF4 $571
line 1230
;1230:			self->wait = 2;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
CNSTF4 1073741824
ASGNF4
line 1231
;1231:		}
LABELV $571
line 1232
;1232:		if (!G_SpawnFloat("scale", "1", &scale)) {
ADDRGP4 $575
ARGP4
ADDRGP4 $109
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 52
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $573
line 1233
;1233:			scale = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 1234
;1234:		}
LABELV $573
line 1236
;1235:
;1236:		self->distance = scale;		//abuse the distance field for scale
ADDRFP4 0
INDIRP4
CNSTI4 1044
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
line 1238
;1237:		
;1238:		self->nextthink = level.time + FRAMETIME * 3;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1239
;1239:		self->think = target_effect_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 target_effect_think
ASGNP4
line 1240
;1240:	}
LABELV $567
line 1243
;1241:
;1242:	//preload explosion assets if necessary
;1243:	if ( self->spawnflags & SF_EFFECT_EXPLOSION ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $577
line 1244
;1244:		RegisterItem( BG_FindItemForWeapon( WP_ROCKET_LAUNCHER ) );	//uses RL gfx so we must register the RL
CNSTI4 5
ARGI4
ADDRLP4 52
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 1245
;1245:	}
LABELV $577
line 1248
;1246:
;1247:	//fade info
;1248:	if ( self->spawnflags & SF_EFFECT_FADE ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $579
line 1249
;1249:		G_SpawnVector4( "startcolor", "0 0 0 0", self->rgba1 );
ADDRGP4 $581
ARGP4
ADDRGP4 $582
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2216
ADDP4
ARGP4
ADDRGP4 G_SpawnVector4
CALLI4
pop
line 1250
;1250:		G_SpawnVector4( "endcolor", "0 0 0 1", self->rgba2 );
ADDRGP4 $583
ARGP4
ADDRGP4 $584
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2232
ADDP4
ARGP4
ADDRGP4 G_SpawnVector4
CALLI4
pop
line 1251
;1251:		if ( !self->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CNSTF4 0
NEF4 $585
line 1252
;1252:			self->wait = 2;
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
CNSTF4 1073741824
ASGNF4
line 1253
;1253:		}
LABELV $585
line 1254
;1254:	}
LABELV $579
line 1256
;1255:
;1256:	self->use = target_effect_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_effect_use
ASGNP4
line 1258
;1257:
;1258:	trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1259
;1259:}
LABELV $533
endproc SP_target_effect 56 12
export target_finish_think
proc target_finish_think 4 12
line 1269
;1260:
;1261://==========================================================
;1262:
;1263:/*QUAKED target_finish (.5 .5 .5) (-8 -8 -8) (8 8 8)
;1264:When triggered, forces the game to go into the intermission which will show the SP end-level scores, registers the player's score as new 
;1265:high score (if it is higher than the current highscore) for the current map and, when the player clicks during the intermission, ends the
;1266:game.
;1267:*/
;1268:
;1269:void target_finish_think(gentity_t* self) {
line 1270
;1270:	target_finish_use(self, self, level.player);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 level+10284
INDIRP4
ARGP4
ADDRGP4 target_finish_use
CALLV
pop
line 1271
;1271:}
LABELV $587
endproc target_finish_think 4 12
export target_finish_use
proc target_finish_use 160 8
line 1273
;1272:
;1273:void target_finish_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1279
;1274:	int secretFound, secretCount;
;1275:	playerscore_t highScores;
;1276:	playerscore_t scores;
;1277:
;1278:	// bots should not be able to activate this
;1279:	if ( IsBot( activator ) )
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 IsBot
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $590
line 1280
;1280:		return;
ADDRGP4 $589
JUMPV
LABELV $590
line 1282
;1281:
;1282:	if (level.player->client->ps.pm_type == PM_CUTSCENE) {
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
NEI4 $592
line 1284
;1283:		// we're in a cutscene. Things break if we go to intermission while in a cutscene. Make target_finish wait for cutscene to end.
;1284:		self->think = target_finish_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 target_finish_think
ASGNP4
line 1285
;1285:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1286
;1286:	} else {
ADDRGP4 $593
JUMPV
LABELV $592
line 1291
;1287:		//set number of secrets to persistant so it can be displayed in the client side scoreboard. If user persistant secretcount already
;1288:		//contains a secretcount from a previous level, add that to the secretcount of this level.
;1289:
;1290:		//TODO: This code below is "run once" code (I think). Rewrite it so it can be run over and over again so we can properly determine the player's score at any point in time
;1291:		secretFound = (level.player->client->ps.persistant[PERS_SECRETS] & 0x7F);
ADDRLP4 48
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 308
ADDP4
INDIRI4
CNSTI4 127
BANDI4
ASGNI4
line 1292
;1292:		secretCount = ((level.player->client->ps.persistant[PERS_SECRETS] >> 7) & 0x7F) + level.secretCount;
ADDRLP4 52
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 308
ADDP4
INDIRI4
CNSTI4 7
RSHI4
CNSTI4 127
BANDI4
ADDRGP4 level+10352
INDIRI4
ADDI4
ASGNI4
line 1293
;1293:		level.player->client->ps.persistant[PERS_SECRETS] = secretFound + (secretCount << 7);
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 308
ADDP4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRI4
CNSTI4 7
LSHI4
ADDI4
ASGNI4
line 1298
;1294:		///
;1295:
;1296:
;1297:		// calculate player's score
;1298:		scores = G_CalculatePlayerScore(level.player);
ADDRLP4 0
ARGP4
ADDRGP4 level+10284
INDIRP4
ARGP4
ADDRGP4 G_CalculatePlayerScore
CALLV
pop
line 1301
;1299:
;1300:		// write high score file
;1301:		COM_WriteLevelScores(G_GetScoringMapName(), scores);
ADDRLP4 156
ADDRGP4 G_GetScoringMapName
CALLP4
ASGNP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 108
ADDRLP4 0
INDIRB
ASGNB 48
ADDRLP4 108
ARGP4
ADDRGP4 COM_WriteLevelScores
CALLI4
pop
line 1303
;1302:
;1303:		BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 1304
;1304:	}
LABELV $593
line 1305
;1305:}
LABELV $589
endproc target_finish_use 160 8
export SP_target_finish
proc SP_target_finish 0 0
line 1307
;1306:
;1307:void SP_target_finish (gentity_t *self) {
line 1308
;1308:	self->use = target_finish_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_finish_use
ASGNP4
line 1309
;1309:}
LABELV $601
endproc SP_target_finish 0 0
export modify_entity
proc modify_entity 148 16
line 1316
;1310:
;1311://==========================================================
;1312:
;1313:/*QUAKED target_modify (.5 .5 .5) (-8 -8 -8) (8 8 8)
;1314:When triggered, modifies the value of the specified key on the entities the target_modify targets
;1315:*/
;1316:void modify_entity ( gentity_t *self, gentity_t *ent ) {
line 1317
;1317:	if ( !strcmp( self->key, "spawnflags" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $605
ARGP4
ADDRLP4 0
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $603
line 1318
;1318:		ent->spawnflags = atoi(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1319
;1319:		return;
ADDRGP4 $602
JUMPV
LABELV $603
line 1322
;1320:	}
;1321:
;1322:	if (!strcmp(self->key, "wait")) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $108
ARGP4
ADDRLP4 4
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $606
line 1323
;1323:		ent->wait = atof(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1012
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 1324
;1324:		return;
ADDRGP4 $602
JUMPV
LABELV $606
line 1327
;1325:	}
;1326:	
;1327:	if (!strcmp(self->key, "random")) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $260
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $608
line 1328
;1328:		ent->random = atof(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1016
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1329
;1329:		return;
ADDRGP4 $602
JUMPV
LABELV $608
line 1332
;1330:	}
;1331:	
;1332:	if (!strcmp(self->key, "team")) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $612
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $610
line 1333
;1333:		ent->team = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1334
;1334:		return;
ADDRGP4 $602
JUMPV
LABELV $610
line 1337
;1335:	}
;1336:
;1337:	if ( !strcmp( self->key, "message" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $615
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $613
line 1338
;1338:		ent->message = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 680
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1339
;1339:		return;
ADDRGP4 $602
JUMPV
LABELV $613
line 1342
;1340:	}
;1341:	
;1342:	if ( !strcmp( self->key, "messageru" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $618
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $616
line 1343
;1343:		ent->messageru = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 684
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1344
;1344:		return;
ADDRGP4 $602
JUMPV
LABELV $616
line 1347
;1345:	}
;1346:	
;1347:	if ( !strcmp( self->key, "playerangle" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $621
ARGP4
ADDRLP4 24
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $619
line 1348
;1348:		ent->playerangle = atoi(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 948
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1349
;1349:		return;
ADDRGP4 $602
JUMPV
LABELV $619
line 1352
;1350:	}
;1351:
;1352:	if ( !strcmp( self->key, "price" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $624
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $622
line 1353
;1353:		ent->price = atoi(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1354
;1354:		return;
ADDRGP4 $602
JUMPV
LABELV $622
line 1357
;1355:	}
;1356:
;1357:	if ( !strcmp( self->key, "target" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $627
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $625
line 1358
;1358:		ent->target = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 720
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1359
;1359:		if ( !strcmp( ent->classname, "path_corner" ) )
ADDRFP4 4
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $630
ARGP4
ADDRLP4 36
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $628
line 1360
;1360:			Think_SetupTrainTargets( ent );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Think_SetupTrainTargets
CALLI4
pop
LABELV $628
line 1362
;1361:		
;1362:		if ( strstr( ent->classname, "shooter_" ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $633
ARGP4
ADDRLP4 40
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $602
line 1363
;1363:			InitShooter( ent, ent->s.weapon );
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ARGI4
ADDRGP4 InitShooter
CALLI4
pop
line 1364
;1364:		}
line 1366
;1365:
;1366:		return;
ADDRGP4 $602
JUMPV
LABELV $625
line 1369
;1367:	}
;1368:
;1369:	if ( !strcmp( self->key, "targetname" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $636
ARGP4
ADDRLP4 36
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $634
line 1370
;1370:		ent->targetname = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 724
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1371
;1371:		if ( !strcmp( ent->classname, "path_corner" ) )
ADDRFP4 4
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $630
ARGP4
ADDRLP4 40
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $602
line 1372
;1372:			Think_SetupTrainTargets( ent );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Think_SetupTrainTargets
CALLI4
pop
line 1373
;1373:		return;
ADDRGP4 $602
JUMPV
LABELV $634
line 1376
;1374:	}
;1375:
;1376:	if ( !strcmp( self->key, "targetshadername" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $641
ARGP4
ADDRLP4 40
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $639
line 1377
;1377:		ent->targetShaderName = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1378
;1378:		return;
ADDRGP4 $602
JUMPV
LABELV $639
line 1381
;1379:	}
;1380:
;1381:	if ( !strcmp( self->key, "targetnewshadername" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $644
ARGP4
ADDRLP4 44
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $642
line 1382
;1382:		ent->targetShaderNewName = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 736
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1383
;1383:		return;
ADDRGP4 $602
JUMPV
LABELV $642
line 1386
;1384:	}
;1385:
;1386:	if ( !strcmp( self->key, "angle" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $647
ARGP4
ADDRLP4 48
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $645
line 1387
;1387:		ent->angle = atof(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
line 1388
;1388:		return;
ADDRGP4 $602
JUMPV
LABELV $645
line 1391
;1389:	}
;1390:
;1391:	if ( !strcmp( self->key, "speed" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $650
ARGP4
ADDRLP4 52
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $648
line 1392
;1392:		ent->speed = atof(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 744
ADDP4
ADDRLP4 56
INDIRF4
ASGNF4
line 1393
;1393:		return;
ADDRGP4 $602
JUMPV
LABELV $648
line 1396
;1394:	}
;1395:
;1396:	if ( !strcmp( self->key, "health" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $653
ARGP4
ADDRLP4 56
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $651
line 1397
;1397:		ent->health = atoi(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 1398
;1398:		return;
ADDRGP4 $602
JUMPV
LABELV $651
line 1401
;1399:	}
;1400:
;1401:	if ( !strcmp( self->key, "count" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $656
ARGP4
ADDRLP4 60
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $654
line 1402
;1402:		ent->count = atoi(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 1403
;1403:		return;
ADDRGP4 $602
JUMPV
LABELV $654
line 1406
;1404:	}
;1405:
;1406:	if ( !strcmp( self->key, "clientname" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $659
ARGP4
ADDRLP4 64
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $657
line 1407
;1407:		ent->clientname = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 1064
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1408
;1408:		return;
ADDRGP4 $602
JUMPV
LABELV $657
line 1411
;1409:	}
;1410:
;1411:	if ( !strcmp( self->key, "mapname" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 68
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $660
line 1412
;1412:		ent->mapname = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 1068
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1413
;1413:		return;
ADDRGP4 $602
JUMPV
LABELV $660
line 1416
;1414:	}
;1415:	
;1416:	if ( !strcmp( self->key, "music" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $664
ARGP4
ADDRLP4 72
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $662
line 1417
;1417:		ent->music = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 2212
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1418
;1418:		return;
ADDRGP4 $602
JUMPV
LABELV $662
line 1421
;1419:	}
;1420:	
;1421:	if ( !strcmp( self->key, "teleportertarget" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $667
ARGP4
ADDRLP4 76
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $665
line 1422
;1422:		ent->teleporterTarget = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 1072
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1423
;1423:		return;
ADDRGP4 $602
JUMPV
LABELV $665
line 1426
;1424:	}
;1425:
;1426:	if ( !strcmp( self->key, "target2" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $670
ARGP4
ADDRLP4 80
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $668
line 1427
;1427:		ent->target2 = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 2100
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1428
;1428:		return;
ADDRGP4 $602
JUMPV
LABELV $668
line 1431
;1429:	}
;1430:
;1431:	if ( !strcmp( self->key, "targetname2" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $673
ARGP4
ADDRLP4 84
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $671
line 1432
;1432:		ent->targetname2 = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 2108
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1433
;1433:		return;
ADDRGP4 $602
JUMPV
LABELV $671
line 1436
;1434:	}
;1435:
;1436:	if ( !strcmp( self->key, "deathtarget" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $676
ARGP4
ADDRLP4 88
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $674
line 1437
;1437:		ent->deathTarget = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 2172
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1438
;1438:		return;
ADDRGP4 $602
JUMPV
LABELV $674
line 1441
;1439:	}
;1440:
;1441:	if ( !strcmp( self->key, "loottarget" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $679
ARGP4
ADDRLP4 92
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $677
line 1442
;1442:		ent->lootTarget = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 2176
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1443
;1443:		return;
ADDRGP4 $602
JUMPV
LABELV $677
line 1446
;1444:	}
;1445:
;1446:	if ( !strcmp( self->key, "skill" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $448
ARGP4
ADDRLP4 96
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $680
line 1447
;1447:		ent->skill = atof(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 2180
ADDP4
ADDRLP4 100
INDIRF4
ASGNF4
line 1448
;1448:		return;
ADDRGP4 $602
JUMPV
LABELV $680
line 1451
;1449:	}
;1450:	
;1451:	if ( !strcmp( self->key, "overlay" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $684
ARGP4
ADDRLP4 100
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $682
line 1452
;1452:		ent->overlay = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 2184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1453
;1453:		return;
ADDRGP4 $602
JUMPV
LABELV $682
line 1456
;1454:	}
;1455:
;1456:	if ( !strcmp( self->key, "armor" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $687
ARGP4
ADDRLP4 104
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $685
line 1457
;1457:		ent->armor = atoi(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 2196
ADDP4
ADDRLP4 108
INDIRI4
ASGNI4
line 1458
;1458:		return;
ADDRGP4 $602
JUMPV
LABELV $685
line 1461
;1459:	}
;1460:
;1461:	if ( !strcmp( self->key, "key" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $690
ARGP4
ADDRLP4 108
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $688
line 1462
;1462:		ent->key = self->value;
ADDRFP4 4
INDIRP4
CNSTI4 2188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ASGNP4
line 1463
;1463:		return;
ADDRGP4 $602
JUMPV
LABELV $688
line 1466
;1464:	}
;1465:
;1466:	if ( !strcmp( self->key, "value" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 112
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $691
line 1467
;1467:		ent->value = self->value;
ADDRLP4 116
CNSTI4 2192
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 1468
;1468:		return;
ADDRGP4 $602
JUMPV
LABELV $691
line 1471
;1469:	}
;1470:
;1471:	if ( !strcmp( self->key, "light" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $695
ARGP4
ADDRLP4 116
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $693
line 1475
;1472:		int		cl;
;1473:		int r, g, b, i;
;1474:
;1475:		cl = ent->s.constantLight;
ADDRLP4 120
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 1477
;1476:
;1477:		r = (cl & 0xFF);
ADDRLP4 124
ADDRLP4 120
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 1478
;1478:		g = ((cl >> 8) & 0xFF);
ADDRLP4 128
ADDRLP4 120
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 1479
;1479:		b = ((cl >> 16) & 0xFF);
ADDRLP4 132
ADDRLP4 120
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 1481
;1480:
;1481:		ent->s.constantLight = r | ( g << 8 ) | ( b << 16 ) | ( atoi(self->value) << 24 );		
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 124
INDIRI4
ADDRLP4 128
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 132
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 140
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 1482
;1482:		return;
ADDRGP4 $602
JUMPV
LABELV $693
line 1485
;1483:	}
;1484:
;1485:	if ( !strcmp( self->key, "color" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $319
ARGP4
ADDRLP4 120
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $696
line 1489
;1486:		int		cl, gn;
;1487:		int r, g, b, i;
;1488:
;1489:		cl = ent->s.constantLight;
ADDRLP4 128
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 1490
;1490:		gn = self->s.generic1;		
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 1492
;1491:
;1492:		r = (gn & 0xFF);
ADDRLP4 132
ADDRLP4 124
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 1493
;1493:		g = ((gn >> 8) & 0xFF);
ADDRLP4 136
ADDRLP4 124
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 1494
;1494:		b = ((gn >> 16) & 0xFF);
ADDRLP4 140
ADDRLP4 124
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 1495
;1495:		i = ((cl >> 24) & 0xFF) * 4.0;
ADDRLP4 144
CNSTF4 1082130432
ADDRLP4 128
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1497
;1496:
;1497:		ent->s.constantLight = r | ( g << 8 ) | ( b << 16 ) | ( i << 24 );		
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 140
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 144
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 1498
;1498:		return;
ADDRGP4 $602
JUMPV
LABELV $696
line 1501
;1499:	}
;1500:
;1501:	if ( !strcmp( self->key, "damage" ) || !strcmp( self->key, "dmg" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $700
ARGP4
ADDRLP4 124
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $702
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $701
ARGP4
ADDRLP4 128
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $698
LABELV $702
line 1502
;1502:		ent->damage = atoi(self->value);
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 924
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 1503
;1503:		return;
ADDRGP4 $602
JUMPV
LABELV $698
line 1506
;1504:	}
;1505:
;1506:	G_Printf("WARNING: Incorrect key \"%s\" for %s at %s\n", self->key, self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 132
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $703
ARGP4
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1507
;1507:}
LABELV $602
endproc modify_entity 148 16
export target_modify_use
proc target_modify_use 20 12
line 1509
;1508:
;1509:void target_modify_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1512
;1510:	gentity_t *t;
;1511:
;1512:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $706
JUMPV
LABELV $705
line 1513
;1513:	while ( (t = G_Find (t, FOFS(targetname), self->target)) != NULL ) {
line 1514
;1514:		modify_entity(self, t);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 modify_entity
CALLV
pop
line 1515
;1515:		if(self->spawnflags & 1){
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $708
line 1516
;1516:		G_CallSpawn(t);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_CallSpawn
CALLI4
pop
line 1517
;1517:		}
LABELV $708
line 1518
;1518:		if ( !self->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $710
line 1519
;1519:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $712
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1520
;1520:			return;
ADDRGP4 $704
JUMPV
LABELV $710
line 1522
;1521:		}
;1522:	}
LABELV $706
line 1513
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $705
line 1524
;1523:
;1524:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $714
JUMPV
LABELV $713
line 1525
;1525:	while ( (t = G_Find (t, FOFS(targetname2), self->target)) != NULL ) {
line 1526
;1526:		modify_entity(self, t);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 modify_entity
CALLV
pop
line 1527
;1527:		if(self->spawnflags & 1){
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $716
line 1528
;1528:		G_CallSpawn(t);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_CallSpawn
CALLI4
pop
line 1529
;1529:		}
LABELV $716
line 1530
;1530:		if ( !self->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $718
line 1531
;1531:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $712
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1532
;1532:			return;
ADDRGP4 $704
JUMPV
LABELV $718
line 1534
;1533:		}
;1534:	}
LABELV $714
line 1525
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $713
line 1536
;1535:
;1536:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $721
JUMPV
LABELV $720
line 1537
;1537:	while ( (t = G_Find (t, FOFS(targetname), self->target2)) != NULL ) {
line 1538
;1538:		modify_entity(self, t);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 modify_entity
CALLV
pop
line 1539
;1539:		if(self->spawnflags & 1){
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $723
line 1540
;1540:		G_CallSpawn(t);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_CallSpawn
CALLI4
pop
line 1541
;1541:		}
LABELV $723
line 1542
;1542:		if ( !self->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $725
line 1543
;1543:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $712
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1544
;1544:			return;
ADDRGP4 $704
JUMPV
LABELV $725
line 1546
;1545:		}
;1546:	}
LABELV $721
line 1537
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 724
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $720
line 1548
;1547:
;1548:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $728
JUMPV
LABELV $727
line 1549
;1549:	while ( (t = G_Find (t, FOFS(targetname2), self->target2)) != NULL ) {
line 1550
;1550:		modify_entity(self, t);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 modify_entity
CALLV
pop
line 1551
;1551:		if(self->spawnflags & 1){
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $730
line 1552
;1552:		G_CallSpawn(t);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_CallSpawn
CALLI4
pop
line 1553
;1553:		}
LABELV $730
line 1554
;1554:		if ( !self->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $732
line 1555
;1555:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $712
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1556
;1556:			return;
ADDRGP4 $704
JUMPV
LABELV $732
line 1558
;1557:		}
;1558:	}
LABELV $728
line 1549
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2108
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $727
line 1559
;1559:}
LABELV $704
endproc target_modify_use 20 12
export SP_target_modify
proc SP_target_modify 32 12
line 1561
;1560:
;1561:void SP_target_modify (gentity_t *self) {
line 1565
;1562:	vec3_t	color;
;1563:	int		r, g, b, i;
;1564:
;1565:	self->use = target_modify_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_modify_use
ASGNP4
line 1568
;1566:
;1567:	//store color value in generic1
;1568:	if ( !strcmp(self->key, "color" ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRGP4 $319
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $735
line 1569
;1569:		G_SpawnVector( "value", "1 1 1", color );
ADDRGP4 $544
ARGP4
ADDRGP4 $543
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnVector
CALLI4
pop
line 1571
;1570:
;1571:		r = color[0] * 255;
ADDRLP4 12
CNSTF4 1132396544
ADDRLP4 0
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1572
;1572:		if ( r > 255 ) {
ADDRLP4 12
INDIRI4
CNSTI4 255
LEI4 $737
line 1573
;1573:			r = 255;
ADDRLP4 12
CNSTI4 255
ASGNI4
line 1574
;1574:		}
LABELV $737
line 1575
;1575:		g = color[1] * 255;
ADDRLP4 16
CNSTF4 1132396544
ADDRLP4 0+4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1576
;1576:		if ( g > 255 ) {
ADDRLP4 16
INDIRI4
CNSTI4 255
LEI4 $740
line 1577
;1577:			g = 255;
ADDRLP4 16
CNSTI4 255
ASGNI4
line 1578
;1578:		}
LABELV $740
line 1579
;1579:		b = color[2] * 255;
ADDRLP4 20
CNSTF4 1132396544
ADDRLP4 0+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1580
;1580:		if ( b > 255 ) {
ADDRLP4 20
INDIRI4
CNSTI4 255
LEI4 $743
line 1581
;1581:			b = 255;
ADDRLP4 20
CNSTI4 255
ASGNI4
line 1582
;1582:		}
LABELV $743
line 1583
;1583:		i = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 1584
;1584:		self->s.generic1 = r | ( g << 8 ) | ( b << 16 ) | ( i << 24 );
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 20
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 24
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 1585
;1585:	}
LABELV $735
line 1586
;1586:}
LABELV $734
endproc SP_target_modify 32 12
export target_secret_use
proc target_secret_use 12 8
line 1594
;1587:
;1588://==========================================================
;1589:
;1590:/*QUAKED target_secret (.5 .5 .5) (-8 -8 -8) (8 8 8) SILENT
;1591:When triggered, marks the secret as 'found'
;1592:*/
;1593:
;1594:void target_secret_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1595
;1595:	activator->client->ps.persistant[PERS_SECRETS]++;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 308
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1597
;1596:
;1597:	if ( !(self->spawnflags & 1) ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $746
line 1598
;1598:		if ( self->message )
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $748
line 1599
;1599:			trap_SendServerCommand( -1, va("cp \"%s\"", self->message ));
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 $749
JUMPV
LABELV $748
line 1601
;1600:		else
;1601:			trap_SendServerCommand( -1, va("cp \"%s\"", "You found a secret!" ));
ADDRGP4 $211
ARGP4
ADDRGP4 $750
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $749
line 1602
;1602:	}
LABELV $746
line 1605
;1603:
;1604:	//remove the entity so it cannot be triggered again
;1605:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1606
;1606:}
LABELV $745
endproc target_secret_use 12 8
export SP_target_secret
proc SP_target_secret 4 0
line 1608
;1607:
;1608:void SP_target_secret (gentity_t *self) {
line 1611
;1609:	
;1610:	//register the secret
;1611:	level.secretCount++;
ADDRLP4 0
ADDRGP4 level+10352
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1613
;1612:
;1613:	self->use = target_secret_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_secret_use
ASGNP4
line 1614
;1614:}
LABELV $751
endproc SP_target_secret 4 0
export target_playerstats_use
proc target_playerstats_use 24 4
line 1622
;1615:
;1616://==========================================================
;1617:
;1618:/*QUAKED target_playerstats (.5 .5 .5) (-8 -8 -8) (8 8 8) ONLY_WHEN_LOWER NO_HEALTH NO_ARMOR
;1619:When triggered, sets to the players health/armor to the specified amounts
;1620:*/
;1621:
;1622:void target_playerstats_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1623
;1623:	if ( IsBot(activator) )		//do not allow bots to trigger this entity
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 IsBot
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $754
line 1624
;1624:		return;
ADDRGP4 $753
JUMPV
LABELV $754
line 1626
;1625:
;1626:	if ((activator->client->ps.stats[STAT_HEALTH] < self->health || !(self->spawnflags & 1)) && !(self->spawnflags & 2))
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
LTI4 $758
ADDRLP4 4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $756
LABELV $758
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $756
line 1627
;1627:		activator->health = activator->client->ps.stats[STAT_HEALTH] = self->health;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 808
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
LABELV $756
line 1629
;1628:
;1629:	if ((activator->client->ps.stats[STAT_ARMOR] < self->armor || !(self->spawnflags & 1)) && !(self->spawnflags & 4))
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 2196
ADDP4
INDIRI4
LTI4 $761
ADDRLP4 20
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $759
LABELV $761
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $759
line 1630
;1630:		activator->client->ps.stats[STAT_ARMOR] = self->armor;
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2196
ADDP4
INDIRI4
ASGNI4
LABELV $759
line 1631
;1631:}
LABELV $753
endproc target_playerstats_use 24 4
export SP_target_playerstats
proc SP_target_playerstats 0 0
line 1633
;1632:
;1633:void SP_target_playerstats (gentity_t *self) {
line 1634
;1634:	self->use = target_playerstats_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_playerstats_use
ASGNP4
line 1635
;1635:}
LABELV $762
endproc SP_target_playerstats 0 0
export target_variable_use
proc target_variable_use 2080 12
line 1643
;1636:
;1637://==========================================================
;1638:
;1639:/*QUAKED target_variable (.5 .5 .5) (-8 -8 -8) (8 8 8) COMPARE_EQUALS COMPARE_NOT_EQUALS IMMEDIATELY
;1640:When triggered, this writes a variable with a specified value to memory or compares the value of that variable
;1641:*/
;1642:
;1643:void target_variable_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1648
;1644:	char buf[MAX_INFO_STRING];
;1645:	char variableInfo[MAX_INFO_STRING];
;1646:	char *value;
;1647:
;1648:	if ( self->spawnflags & 1 || self->spawnflags & 2)
ADDRLP4 2052
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2056
CNSTI4 0
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 2056
INDIRI4
NEI4 $766
ADDRLP4 2052
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 2056
INDIRI4
EQI4 $764
LABELV $766
line 1649
;1649:	{
line 1650
;1650:		trap_GetConfigstring(CS_TARGET_VARIABLE, buf, sizeof(buf));
CNSTI4 8613
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1651
;1651:		value = Info_ValueForKey(buf, self->key);
ADDRLP4 1028
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 2060
INDIRP4
ASGNP4
line 1652
;1652:		if ( g_debugVariables.integer ) {
ADDRGP4 g_debugVariables+12
INDIRI4
CNSTI4 0
EQI4 $767
line 1653
;1653:			G_Printf("\nDebugvariables: comparing variable \"%s\" to \"%s\"\n", self->key, self->value);
ADDRGP4 $770
ARGP4
ADDRLP4 2064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2064
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRLP4 2064
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1654
;1654:			G_Printf("In-memory value for variable = \"%s\"\n", value);
ADDRGP4 $771
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1655
;1655:			G_Printf("Variable infostring = %s\n", variableInfo);
ADDRGP4 $772
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1656
;1656:		}
LABELV $767
line 1658
;1657:		
;1658:		if ( (self->spawnflags & 1) && !strcmp(value, self->value) ) {
ADDRLP4 2064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2064
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $773
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 2064
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $773
line 1659
;1659:			if ( g_debugVariables.integer ) G_Printf("Variables match, targets will be activated\n");
ADDRGP4 g_debugVariables+12
INDIRI4
CNSTI4 0
EQI4 $775
ADDRGP4 $778
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $775
line 1660
;1660:			G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1661
;1661:		}
LABELV $773
line 1663
;1662:		
;1663:		if ( (self->spawnflags & 2) && strcmp(value, self->value) ) {
ADDRLP4 2072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $763
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 2072
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
EQI4 $763
line 1664
;1664:			if ( g_debugVariables.integer ) G_Printf("Variables do not match, targets will be activated\n");
ADDRGP4 g_debugVariables+12
INDIRI4
CNSTI4 0
EQI4 $781
ADDRGP4 $784
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $781
line 1665
;1665:			G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1666
;1666:		}
line 1668
;1667:		
;1668:		return;
ADDRGP4 $763
JUMPV
LABELV $764
line 1671
;1669:	}
;1670:	
;1671:	variableInfo[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 1672
;1672:	Info_SetValueForKey(variableInfo, self->key, self->value);
ADDRLP4 0
ARGP4
ADDRLP4 2060
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2060
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRLP4 2060
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1673
;1673:	trap_SetConfigstring( CS_TARGET_VARIABLE, variableInfo );
CNSTI4 8613
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1674
;1674:	if ( g_debugVariables.integer ) {
ADDRGP4 g_debugVariables+12
INDIRI4
CNSTI4 0
EQI4 $785
line 1675
;1675:		G_Printf("\nDebugvariables: setting variable \"%s\" to \"%s\"\n", self->key, self->value);
ADDRGP4 $788
ARGP4
ADDRLP4 2064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2064
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRLP4 2064
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1676
;1676:		G_Printf("Variable infostring = %s\n", variableInfo);
ADDRGP4 $772
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1677
;1677:	}
LABELV $785
line 1678
;1678:}
LABELV $763
endproc target_variable_use 2080 12
export target_variable_think
proc target_variable_think 4 12
line 1681
;1679:
;1680://used for immediately spawnflag
;1681:void target_variable_think (gentity_t *self) {
line 1682
;1682:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 1683
;1683:	target_variable_use( self, NULL, self );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 target_variable_use
CALLV
pop
line 1684
;1684:}
LABELV $789
endproc target_variable_think 4 12
export SP_target_variable
proc SP_target_variable 4 8
line 1686
;1685:
;1686:void SP_target_variable (gentity_t *self) {
line 1687
;1687:	if ( !self->key ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $791
line 1688
;1688:		G_Printf("WARNING: target_variable without key at %s\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $793
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1689
;1689:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1690
;1690:		return;
ADDRGP4 $790
JUMPV
LABELV $791
line 1693
;1691:	}
;1692:
;1693:	if ( !self->key ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $794
line 1694
;1694:		G_Printf("WARNING: target_variable without value at %s\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $796
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1695
;1695:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1696
;1696:		return;
ADDRGP4 $790
JUMPV
LABELV $794
line 1699
;1697:	}
;1698:	
;1699:	self->use = target_variable_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_variable_use
ASGNP4
line 1701
;1700:
;1701:	if ( ( self->spawnflags & 4 ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $797
line 1702
;1702:		self->nextthink = level.time + FRAMETIME * 3;	//trigger entities next frame so they can spawn first
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1703
;1703:		self->think = target_variable_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 target_variable_think
ASGNP4
line 1704
;1704:	}
LABELV $797
line 1705
;1705:}
LABELV $790
endproc SP_target_variable 4 8
export target_cutscene_use
proc target_cutscene_use 16 12
line 1713
;1706:
;1707://==========================================================
;1708:
;1709:/*QUAKED target_cutscene (.5 .5 .5) (-8 -8 -8) (8 8 8) HALT_AI
;1710:When triggered, starts a cutscene.
;1711:HALT_AI: Prevents bots from moving and shooting while the cutscene is playing
;1712:*/
;1713:void target_cutscene_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1717
;1714:	int i;
;1715:
;1716:	//if cutscenes are disabled, do nothing
;1717:	if ( g_disableCutscenes.integer ) {
ADDRGP4 g_disableCutscenes+12
INDIRI4
CNSTI4 0
EQI4 $801
line 1718
;1718:		return;
ADDRGP4 $800
JUMPV
LABELV $801
line 1722
;1719:	}
;1720:
;1721:	//bots shouldn't be able to activate this entity
;1722:	if ( IsBot( activator ) )
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 IsBot
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $804
line 1723
;1723:		return;
ADDRGP4 $800
JUMPV
LABELV $804
line 1726
;1724:
;1725:	//if the entity doesnt target camera, return
;1726:	if ( !self->nextTrain ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $806
line 1727
;1727:		G_Printf("WARNING: %s at %s does not target an info_camera", self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $808
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1728
;1728:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1729
;1729:		return;
ADDRGP4 $800
JUMPV
LABELV $806
line 1733
;1730:	}
;1731:
;1732:	//unlink the player from the world so he becomes non-solid, as the player will physically be in the position of the camera
;1733:	trap_UnlinkEntity( level.player );
ADDRGP4 level+10284
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1734
;1734:	level.player->r.contents -= CONTENTS_BODY;
ADDRLP4 8
ADDRGP4 level+10284
INDIRP4
CNSTI4 500
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 33554432
SUBI4
ASGNI4
line 1737
;1735:
;1736:	//prevent bots from moving/shooting while playing the cutscene
;1737:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $811
line 1738
;1738:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $816
JUMPV
LABELV $813
line 1739
;1739:			if ( level.clients[i].pers.connected != CON_DISCONNECTED && level.clients[i].ps.pm_type != PM_DEAD )
ADDRLP4 12
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $818
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $818
line 1740
;1740:				level.clients[i].ps.pm_type = PM_CUTSCENE;
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
LABELV $818
line 1741
;1741:		}
LABELV $814
line 1738
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $816
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $813
line 1742
;1742:	}
LABELV $811
line 1745
;1743:
;1744:	//set player's velocity to 0 so he stops right in his tracks (without this the player slides slightly forward when the cutscene ends)
;1745:	level.player->client->ps.velocity[0] = 0;
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
line 1746
;1746:	level.player->client->ps.velocity[1] = 0;
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
line 1747
;1747:	level.player->client->ps.velocity[2] = 0;
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 1751
;1748:
;1749:	//set player's orgOrigin so we can move the player back to its original location when the cutscene ends
;1750:	//if (level.player->client->ps.pm_type != PM_CUTSCENE) {
;1751:	VectorCopy(level.player->client->ps.origin, level.player->orgOrigin);
ADDRGP4 level+10284
INDIRP4
CNSTI4 2200
ADDP4
ADDRGP4 level+10284
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1755
;1752:	//}
;1753:
;1754:	//disable synchronousClients to prevent "CVAR_Update: handle out of range" error. See issue 162.
;1755:	if (g_allowSyncCutscene.integer == 0) {
ADDRGP4 g_allowSyncCutscene+12
INDIRI4
CNSTI4 0
NEI4 $825
line 1756
;1756:		level.player->skill = g_synchronousClients.integer;	//abusing the skill field to temporarily store the sync-clients value
ADDRGP4 level+10284
INDIRP4
CNSTI4 2180
ADDP4
ADDRGP4 g_synchronousClients+12
INDIRI4
CVIF4 4
ASGNF4
line 1757
;1757:		trap_Cvar_Set("g_synchronousClients", "0");
ADDRGP4 $830
ARGP4
ADDRGP4 $107
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1758
;1758:	}
LABELV $825
line 1761
;1759:	
;1760:	//activate the first camera
;1761:	self->nextTrain->use( self->nextTrain, other, level.player);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 level+10284
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 1762
;1762:}
LABELV $800
endproc target_cutscene_use 16 12
export target_cutscene_think
proc target_cutscene_think 0 4
line 1764
;1763:
;1764:void target_cutscene_think (gentity_t *self) {
line 1765
;1765:	G_LinkCameras( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_LinkCameras
CALLI4
pop
line 1766
;1766:}
LABELV $832
endproc target_cutscene_think 0 4
export SP_target_cutscene
proc SP_target_cutscene 0 0
line 1768
;1767:
;1768:void SP_target_cutscene (gentity_t *self) {
line 1775
;1769:	/*if ( !self->target && !self->target2 ) {
;1770:		G_Printf("WARNING: %s without a target or target2 at %s\n", self->classname, vtos(self->s.origin));
;1771:		G_FreeEntity( self );
;1772:		return;
;1773:	}*/
;1774:
;1775:	self->nextthink = level.time + FRAMETIME * 3;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1776
;1776:	self->think = target_cutscene_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 target_cutscene_think
ASGNP4
line 1777
;1777:	self->use = target_cutscene_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_cutscene_use
ASGNP4
line 1778
;1778:}
LABELV $833
endproc SP_target_cutscene 0 0
export target_botremove_use
proc target_botremove_use 8 12
line 1786
;1779:
;1780://==========================================================
;1781:
;1782:/*QUAKED target_botremove (.5 .5 .5) (-8 -8 -8) (8 8 8) LETHAL_INJECTION SPONTANEOUS_COMBUSTION
;1783:When triggered, removes all bots that were spawned by the targeted target_botspawn entity
;1784:*/
;1785:
;1786:void target_botremove_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1787
;1787:	G_RemoveBotsForTarget( self, (self->spawnflags & 1), (self->spawnflags & 2) );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
BANDI4
ARGI4
ADDRGP4 G_RemoveBotsForTarget
CALLI4
pop
line 1788
;1788:}
LABELV $835
endproc target_botremove_use 8 12
export SP_target_botremove
proc SP_target_botremove 12 12
line 1790
;1789:
;1790:void SP_target_botremove (gentity_t *self) {
line 1791
;1791:	if ( !self->target && !self->target2 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $837
ADDRLP4 0
INDIRP4
CNSTI4 2100
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $837
line 1792
;1792:		G_Printf("WARNING: %s without a target or target2 at %s\n", self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $839
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1793
;1793:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1794
;1794:		return;
ADDRGP4 $836
JUMPV
LABELV $837
line 1797
;1795:	}
;1796:	
;1797:	self->use = target_botremove_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_botremove_use
ASGNP4
line 1798
;1798:}
LABELV $836
endproc SP_target_botremove 12 12
export target_music_use
proc target_music_use 0 8
line 1805
;1799:
;1800://==========================================================
;1801:
;1802:/*QUAKED target_music (0 .7 .7) (-8 -8 -8) (8 8 8)
;1803:When triggered, starts playing specified music track
;1804:*/
;1805:void target_music_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1806
;1806:	trap_SetConfigstring( CS_MUSIC, self->music );
CNSTI4 2
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 2212
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1807
;1807:}
LABELV $840
endproc target_music_use 0 8
export SP_target_music
proc SP_target_music 1028 12
line 1809
;1808:
;1809:void SP_target_music (gentity_t *self) {
line 1812
;1810:	char	*s;
;1811:	char	buffer[MAX_INFO_STRING];
;1812:	G_SpawnString( "music", "", &s );
ADDRGP4 $664
ARGP4
ADDRGP4 $445
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1813
;1813:	Q_strncpyz( self->music, s, sizeof(self->music) );
ADDRFP4 0
INDIRP4
CNSTI4 2212
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1815
;1814:
;1815:	self->use = target_music_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_music_use
ASGNP4
line 1816
;1816:}
LABELV $841
endproc SP_target_music 1028 12
export target_kill_use
proc target_kill_use 8 32
line 1822
;1817:
;1818:
;1819:/*QUAKED target_kill (.5 .5 .5) (-8 -8 -8) (8 8 8)
;1820:Kills the activator.
;1821:*/
;1822:void target_kill_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 1823
;1823:	G_Damage ( activator, NULL, NULL, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 23
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1824
;1824:}
LABELV $842
endproc target_kill_use 8 32
export SP_target_kill
proc SP_target_kill 0 0
line 1826
;1825:
;1826:void SP_target_kill( gentity_t *self ) {
line 1827
;1827:	self->use = target_kill_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 target_kill_use
ASGNP4
line 1828
;1828:}
LABELV $843
endproc SP_target_kill 0 0
export SP_target_position
proc SP_target_position 4 8
line 1833
;1829:
;1830:/*QUAKED target_position (0 0.5 0) (-4 -4 -4) (4 4 4)
;1831:Used as a positional target for in-game calculation, like jumppad targets.
;1832:*/
;1833:void SP_target_position( gentity_t *self ){
line 1834
;1834:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1835
;1835:}
LABELV $844
endproc SP_target_position 4 8
proc target_location_linkup 16 8
line 1838
;1836:
;1837:static void target_location_linkup(gentity_t *ent)
;1838:{
line 1842
;1839:	int i;
;1840:	int n;
;1841:
;1842:	if (level.locationLinked) 
ADDRGP4 level+9952
INDIRI4
CNSTI4 0
EQI4 $846
line 1843
;1843:		return;
ADDRGP4 $845
JUMPV
LABELV $846
line 1845
;1844:
;1845:	level.locationLinked = qtrue;
ADDRGP4 level+9952
CNSTI4 1
ASGNI4
line 1847
;1846:
;1847:	level.locationHead = NULL;
ADDRGP4 level+9956
CNSTP4 0
ASGNP4
line 1849
;1848:
;1849:	trap_SetConfigstring( CS_LOCATIONS, "unknown" );
CNSTI4 8480
ARGI4
ADDRGP4 $851
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1851
;1850:
;1851:	for (i = 0, ent = g_entities, n = 1;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $855
JUMPV
LABELV $852
line 1853
;1852:			i < level.num_entities;
;1853:			i++, ent++) {
line 1854
;1854:		if (ent->classname && !Q_stricmp(ent->classname, "target_location") ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $857
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $859
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $857
line 1856
;1855:			// lets overload some variables!
;1856:			ent->health = n; // use for location marking
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1857
;1857:			trap_SetConfigstring( CS_LOCATIONS + n, ent->message );
ADDRLP4 4
INDIRI4
CNSTI4 8480
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1858
;1858:			n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1859
;1859:			ent->nextTrain = level.locationHead;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+9956
INDIRP4
ASGNP4
line 1860
;1860:			level.locationHead = ent;
ADDRGP4 level+9956
ADDRFP4 0
INDIRP4
ASGNP4
line 1861
;1861:		}
LABELV $857
line 1862
;1862:	}
LABELV $853
line 1853
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2492
ADDP4
ASGNP4
LABELV $855
line 1852
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $852
line 1865
;1863:
;1864:	// All linked together now
;1865:}
LABELV $845
endproc target_location_linkup 16 8
export SP_target_location
proc SP_target_location 4 8
line 1875
;1866:
;1867:/*QUAKED target_location (0 0.5 0) (-8 -8 -8) (8 8 8)
;1868:Set "message" to the name of this location.
;1869:Set "count" to 0-7 for color.
;1870:0:white 1:red 2:green 3:yellow 4:blue 5:cyan 6:magenta 7:white
;1871:
;1872:Closest target_location in sight used for the location, if none
;1873:in site, closest in distance
;1874:*/
;1875:void SP_target_location( gentity_t *self ){
line 1876
;1876:	self->think = target_location_linkup;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 target_location_linkup
ASGNP4
line 1877
;1877:	self->nextthink = level.time + 200;  // Let them all spawn first
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1879
;1878:
;1879:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1880
;1880:}
LABELV $862
endproc SP_target_location 4 8
export SP_rally_weather_rain
proc SP_rally_weather_rain 12 8
line 1883
;1881:
;1882:// FIXME: improve these so they only need to be send to the client once?
;1883:void SP_rally_weather_rain( gentity_t *ent ){
line 1884
;1884:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1885
;1885:	ent->s.eType = ET_WEATHER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 14
ASGNI4
line 1887
;1886:
;1887:	ent->s.powerups = ent->type;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
ASGNI4
line 1888
;1888:	ent->s.weapon = 0;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 1889
;1889:	ent->s.legsAnim = ent->spawnflags;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ASGNI4
line 1891
;1890:
;1891:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1892
;1892:}
LABELV $864
endproc SP_rally_weather_rain 12 8
export SP_rally_weather_snow
proc SP_rally_weather_snow 8 8
line 1895
;1893:
;1894:
;1895:void SP_rally_weather_snow( gentity_t *ent ){
line 1896
;1896:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1897
;1897:	ent->s.eType = ET_WEATHER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 14
ASGNI4
line 1899
;1898:
;1899:	ent->s.powerups = ent->type;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
ASGNI4
line 1900
;1900:	ent->s.weapon = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 1901
;1901:	ent->s.legsAnim = 0;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 0
ASGNI4
line 1903
;1902:
;1903:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1904
;1904:}
LABELV $865
endproc SP_rally_weather_snow 8 8
export script_variable_use
proc script_variable_use 2216 12
line 1910
;1905:
;1906:/*QUAKED script_variable (.5 .5 .5) (-8 -8 -8) (8 8 8) = != <= >= IMMEDIATELY
;1907:When triggered, this writes a variable with a specified value to memory or compares the value of that variable
;1908:*/
;1909:
;1910:void script_variable_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 1915
;1911:	char buf[MAX_INFO_STRING];
;1912:	char variableInfo[MAX_INFO_STRING];
;1913:	char value[128];
;1914:
;1915:	if ( self->spawnflags & 1 || self->spawnflags & 2)
ADDRLP4 2176
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2180
CNSTI4 0
ASGNI4
ADDRLP4 2176
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 2180
INDIRI4
NEI4 $869
ADDRLP4 2176
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 2180
INDIRI4
EQI4 $867
LABELV $869
line 1916
;1916:	{
line 1917
;1917:		trap_Cvar_VariableStringBuffer(self->key, value, sizeof( value ));
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1918
;1918:		if ( g_debugVariables.integer ) {
ADDRGP4 g_debugVariables+12
INDIRI4
CNSTI4 0
EQI4 $870
line 1919
;1919:			G_Printf("\nDebugvariables: comparing variable \"%s\" to \"%s\"\n", self->key, self->value);
ADDRGP4 $770
ARGP4
ADDRLP4 2184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2184
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRLP4 2184
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1920
;1920:			G_Printf("In-memory value for variable = \"%s\"\n", value);
ADDRGP4 $771
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1921
;1921:		}
LABELV $870
line 1923
;1922:		
;1923:		if ( (self->spawnflags & 1) && !strcmp(value, self->value) ) {
ADDRLP4 2184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2184
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $873
ADDRLP4 0
ARGP4
ADDRLP4 2184
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 2188
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2188
INDIRI4
CNSTI4 0
NEI4 $873
line 1924
;1924:			if ( g_debugVariables.integer ) G_Printf("Variable =, targets will be activated\n");
ADDRGP4 g_debugVariables+12
INDIRI4
CNSTI4 0
EQI4 $875
ADDRGP4 $878
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $875
line 1925
;1925:			G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1926
;1926:		}
LABELV $873
line 1928
;1927:		
;1928:		if ( (self->spawnflags & 2) && strcmp(value, self->value) ) {
ADDRLP4 2192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2192
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $879
ADDRLP4 0
ARGP4
ADDRLP4 2192
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 2196
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2196
INDIRI4
CNSTI4 0
EQI4 $879
line 1929
;1929:			if ( g_debugVariables.integer ) G_Printf("Variable !=, targets will be activated\n");
ADDRGP4 g_debugVariables+12
INDIRI4
CNSTI4 0
EQI4 $881
ADDRGP4 $884
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $881
line 1930
;1930:			G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1931
;1931:		}
LABELV $879
line 1933
;1932:		
;1933:		if ( (self->spawnflags & 4) && (atoi(value) <= atoi(self->value)) ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $885
ADDRLP4 0
ARGP4
ADDRLP4 2200
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 2204
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2200
INDIRI4
ADDRLP4 2204
INDIRI4
GTI4 $885
line 1934
;1934:			if ( g_debugVariables.integer ) G_Printf("Variable <=, targets will be activated\n");
ADDRGP4 g_debugVariables+12
INDIRI4
CNSTI4 0
EQI4 $887
ADDRGP4 $890
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $887
line 1935
;1935:			G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1936
;1936:		}
LABELV $885
line 1938
;1937:		
;1938:		if ( (self->spawnflags & 8) && (atoi(value) >= atoi(self->value)) ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $866
ADDRLP4 0
ARGP4
ADDRLP4 2208
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 2212
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2208
INDIRI4
ADDRLP4 2212
INDIRI4
LTI4 $866
line 1939
;1939:			if ( g_debugVariables.integer ) G_Printf("Variable >=, targets will be activated\n");
ADDRGP4 g_debugVariables+12
INDIRI4
CNSTI4 0
EQI4 $893
ADDRGP4 $896
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $893
line 1940
;1940:			G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1941
;1941:		}
line 1943
;1942:		
;1943:		return;
ADDRGP4 $866
JUMPV
LABELV $867
line 1945
;1944:	}
;1945:	if ( self->spawnflags & 8192 ){
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $897
line 1946
;1946:	trap_SendConsoleCommand( EXEC_APPEND, va("seta %s %s\n", self->key, self->value) );
ADDRGP4 $899
ARGP4
ADDRLP4 2184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2184
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRLP4 2184
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRLP4 2188
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 2188
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1947
;1947:	} else {
ADDRGP4 $898
JUMPV
LABELV $897
line 1948
;1948:	trap_Cvar_Set( self->key, self->value );
ADDRLP4 2184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2184
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRLP4 2184
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1949
;1949:	}
LABELV $898
line 1950
;1950:	if ( g_debugVariables.integer ) {
ADDRGP4 g_debugVariables+12
INDIRI4
CNSTI4 0
EQI4 $900
line 1951
;1951:		G_Printf("\nDebugvariables: setting variable \"%s\" to \"%s\"\n", self->key, self->value);
ADDRGP4 $788
ARGP4
ADDRLP4 2184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2184
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
ARGP4
ADDRLP4 2184
INDIRP4
CNSTI4 2192
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1952
;1952:	}
LABELV $900
line 1953
;1953:}
LABELV $866
endproc script_variable_use 2216 12
export script_variable_think
proc script_variable_think 4 12
line 1956
;1954:
;1955://used for immediately spawnflag
;1956:void script_variable_think (gentity_t *self) {
line 1957
;1957:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 1958
;1958:	script_variable_use( self, NULL, self );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 script_variable_use
CALLV
pop
line 1959
;1959:}
LABELV $903
endproc script_variable_think 4 12
export SP_script_variable
proc SP_script_variable 4 8
line 1961
;1960:
;1961:void SP_script_variable (gentity_t *self) {
line 1962
;1962:	if ( !self->key ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $905
line 1963
;1963:		G_Printf("WARNING: script_variable without key at %s\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $907
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1964
;1964:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1965
;1965:		return;
ADDRGP4 $904
JUMPV
LABELV $905
line 1968
;1966:	}
;1967:
;1968:	if ( !self->key ) {
ADDRFP4 0
INDIRP4
CNSTI4 2188
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $908
line 1969
;1969:		G_Printf("WARNING: script_variable without value at %s\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $910
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1970
;1970:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1971
;1971:		return;
ADDRGP4 $904
JUMPV
LABELV $908
line 1974
;1972:	}
;1973:	
;1974:	self->use = script_variable_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 script_variable_use
ASGNP4
line 1976
;1975:
;1976:	if ( ( self->spawnflags & 4096 ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $911
line 1977
;1977:		self->nextthink = level.time + FRAMETIME * 3;	//trigger entities next frame so they can spawn first
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1978
;1978:		self->think = script_variable_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 script_variable_think
ASGNP4
line 1979
;1979:	}
LABELV $911
line 1980
;1980:}
LABELV $904
endproc SP_script_variable 4 8
export script_layer_use
proc script_layer_use 8 12
line 1982
;1981:
;1982:void script_layer_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 1985
;1983:	gentity_t	*dest;
;1984:
;1985:	if (!activator->client)
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $915
line 1986
;1986:		return;
ADDRGP4 $914
JUMPV
LABELV $915
line 1988
;1987:
;1988:	TeleportPlayerForLayer( activator, self->distance, self->s.origin[2] );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1044
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ARGF4
ADDRGP4 TeleportPlayerForLayer
CALLI4
pop
line 1989
;1989:}
LABELV $914
endproc script_layer_use 8 12
export SP_script_layer
proc SP_script_layer 0 0
line 1991
;1990:
;1991:void SP_script_layer( gentity_t *self ) {
line 1992
;1992:	self->use = script_layer_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 script_layer_use
ASGNP4
line 1993
;1993:}
LABELV $917
endproc SP_script_layer 0 0
export use_script_cmd
proc use_script_cmd 4 8
line 1995
;1994:
;1995:void use_script_cmd (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 1996
;1996:	if (ent->spawnflags & 1) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $919
line 1997
;1997:	trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", ent->target) );
ADDRGP4 $921
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1998
;1998:	}
LABELV $919
line 1999
;1999:	if (ent->spawnflags & 2) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $922
line 2000
;2000:	trap_SendServerCommand( activator-g_entities, va("clcmd \"%s\"", ent->target ));	
ADDRGP4 $924
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2001
;2001:	}
LABELV $922
line 2002
;2002:	if (ent->spawnflags & 4) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $925
line 2003
;2003:	trap_SendServerCommand( -1, va("clcmd \"%s\"", ent->target ));	
ADDRGP4 $924
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2004
;2004:	}
LABELV $925
line 2005
;2005:}
LABELV $918
endproc use_script_cmd 4 8
export script_cmd_think
proc script_cmd_think 4 12
line 2008
;2006:
;2007://used for immediately spawnflag
;2008:void script_cmd_think (gentity_t *ent) {
line 2009
;2009:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 2010
;2010:	use_script_cmd( ent, NULL, ent );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 use_script_cmd
CALLV
pop
line 2011
;2011:}
LABELV $927
endproc script_cmd_think 4 12
export SP_script_cmd
proc SP_script_cmd 0 4
line 2013
;2012:
;2013:void SP_script_cmd( gentity_t *ent ) {
line 2014
;2014:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $929
line 2015
;2015:	G_Printf ("No target in script_cmd\n");
ADDRGP4 $931
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2016
;2016:	}
LABELV $929
line 2017
;2017:	if ( ent->spawnflags & 4096 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $932
line 2018
;2018:		ent->nextthink = level.time + FRAMETIME * 10;	//trigger entities next frame so they can spawn first
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2019
;2019:		ent->think = script_cmd_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 script_cmd_think
ASGNP4
line 2020
;2020:	}
LABELV $932
line 2021
;2021:	ent->use = use_script_cmd;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 use_script_cmd
ASGNP4
line 2022
;2022:}
LABELV $928
endproc SP_script_cmd 0 4
export use_script_menu
proc use_script_menu 4 8
line 2024
;2023:
;2024:void use_script_menu (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 2025
;2025:	if (ent->spawnflags & 1) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $936
line 2026
;2026:	trap_SendConsoleCommand( EXEC_APPEND, va("mgui %s\n", ent->target) );
ADDRGP4 $938
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2027
;2027:	}
LABELV $936
line 2028
;2028:	if (ent->spawnflags & 2) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $939
line 2029
;2029:	trap_SendServerCommand( activator-g_entities, va("clcmd \"mgui %s\"", ent->target ));	
ADDRGP4 $941
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2030
;2030:	}
LABELV $939
line 2031
;2031:	if (ent->spawnflags & 4) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $942
line 2032
;2032:	trap_SendServerCommand( -1, va("clcmd \"mgui %s\"", ent->target ));	
ADDRGP4 $941
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2033
;2033:	}
LABELV $942
line 2034
;2034:}
LABELV $935
endproc use_script_menu 4 8
export script_menu_think
proc script_menu_think 4 12
line 2037
;2035:
;2036://used for immediately spawnflag
;2037:void script_menu_think (gentity_t *ent) {
line 2038
;2038:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 2039
;2039:	use_script_menu( ent, NULL, ent );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 use_script_menu
CALLV
pop
line 2040
;2040:}
LABELV $944
endproc script_menu_think 4 12
export SP_script_menu
proc SP_script_menu 0 4
line 2042
;2041:
;2042:void SP_script_menu( gentity_t *ent ) {
line 2043
;2043:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $946
line 2044
;2044:	G_Printf ("No target in script_menu\n");
ADDRGP4 $948
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2045
;2045:	}
LABELV $946
line 2046
;2046:	if ( ent->spawnflags & 4096 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $949
line 2047
;2047:		ent->nextthink = level.time + FRAMETIME * 10;	//trigger entities next frame so they can spawn first
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2048
;2048:		ent->think = script_menu_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 script_menu_think
ASGNP4
line 2049
;2049:	}
LABELV $949
line 2050
;2050:	ent->use = use_script_menu;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 use_script_menu
ASGNP4
line 2051
;2051:}
LABELV $945
endproc SP_script_menu 0 4
export use_script_aicontrol
proc use_script_aicontrol 8 12
line 2053
;2052:
;2053:void use_script_aicontrol (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 2054
;2054:	trap_SendConsoleCommand( EXEC_APPEND, va("say_team %s %s\n", ent->clientname, ent->target) );
ADDRGP4 $953
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2055
;2055:}
LABELV $952
endproc use_script_aicontrol 8 12
export SP_script_aicontrol
proc SP_script_aicontrol 0 4
line 2057
;2056:
;2057:void SP_script_aicontrol( gentity_t *ent ) {
line 2058
;2058:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $955
line 2059
;2059:	G_Printf ("No target in script_aicontrol\n");
ADDRGP4 $957
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2060
;2060:	}
LABELV $955
line 2061
;2061:	ent->use = use_script_aicontrol;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 use_script_aicontrol
ASGNP4
line 2062
;2062:}
LABELV $954
endproc SP_script_aicontrol 0 4
import TeleportPlayerForLayer
import G_RemoveBotsForTarget
import G_LinkCameras
import G_CallSpawn
import InitShooter
import Think_SetupTrainTargets
import COM_WriteLevelScores
import IsBot
import PickDebrisType
import G_ToggleTargetsLinked
import G_AddBot
import G_AddCustomBot
import G_UpdateGlobalSessionDataForMapChange
import G_UpdateClientSessionDataForMapChange
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
LABELV $957
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 97
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $953
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $948
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $941
byte 1 99
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 34
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $938
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $931
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $924
byte 1 99
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $921
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $910
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $907
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $899
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $896
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 62
byte 1 61
byte 1 44
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
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
byte 1 10
byte 1 0
align 1
LABELV $890
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 60
byte 1 61
byte 1 44
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
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
byte 1 10
byte 1 0
align 1
LABELV $884
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 33
byte 1 61
byte 1 44
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
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
byte 1 10
byte 1 0
align 1
LABELV $878
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 61
byte 1 44
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
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
byte 1 10
byte 1 0
align 1
LABELV $859
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
LABELV $851
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $839
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
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
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 50
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $830
byte 1 103
byte 1 95
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 104
byte 1 114
byte 1 111
byte 1 110
byte 1 111
byte 1 117
byte 1 115
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $808
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $796
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $793
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $788
byte 1 10
byte 1 68
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $784
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 44
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
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
byte 1 10
byte 1 0
align 1
LABELV $778
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 44
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
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
byte 1 10
byte 1 0
align 1
LABELV $772
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $771
byte 1 73
byte 1 110
byte 1 45
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $770
byte 1 10
byte 1 68
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $750
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
byte 1 97
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 33
byte 1 0
align 1
LABELV $712
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $703
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 73
byte 1 110
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $701
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $700
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $695
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $690
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $687
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $684
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $679
byte 1 108
byte 1 111
byte 1 111
byte 1 116
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $676
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $673
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
byte 1 50
byte 1 0
align 1
LABELV $670
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 50
byte 1 0
align 1
LABELV $667
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $664
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $659
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $656
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $653
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $650
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $647
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $644
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 101
byte 1 119
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $641
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $636
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
LABELV $633
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 0
align 1
LABELV $630
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $627
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $624
byte 1 112
byte 1 114
byte 1 105
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $621
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $618
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 114
byte 1 117
byte 1 0
align 1
LABELV $615
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $612
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $605
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
LABELV $584
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $583
byte 1 101
byte 1 110
byte 1 100
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $582
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $581
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $575
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $545
byte 1 51
byte 1 0
align 1
LABELV $544
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $543
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $536
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
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
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $492
byte 1 49
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $491
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $490
byte 1 51
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $489
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $482
byte 1 50
byte 1 0
align 1
LABELV $480
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $478
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $476
byte 1 111
byte 1 117
byte 1 0
align 1
LABELV $453
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $448
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $447
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $445
byte 1 0
align 1
LABELV $433
byte 1 10
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 47
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
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
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $416
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $412
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $411
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $408
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $407
byte 1 115
byte 1 112
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $375
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $338
byte 1 117
byte 1 110
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $334
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $320
byte 1 49
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $319
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $317
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $307
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $270
byte 1 37
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $269
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $264
byte 1 78
byte 1 79
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $263
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $260
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $249
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $217
byte 1 114
byte 1 117
byte 1 115
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $211
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $175
byte 1 114
byte 1 117
byte 1 115
byte 1 99
byte 1 108
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $169
byte 1 99
byte 1 108
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $160
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $109
byte 1 49
byte 1 0
align 1
LABELV $108
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 48
byte 1 0
align 1
LABELV $106
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
