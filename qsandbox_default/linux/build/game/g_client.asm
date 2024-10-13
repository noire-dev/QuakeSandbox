data
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1107296256
export info_player_deathmatch_use
code
proc info_player_deathmatch_use 4 0
file "../../../code/game/g_client.c"
line 40
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
;25:// g_client.c -- client functions that don't happen every frame
;26:
;27:
;28:static vec3_t	playerMins = {-15, -15, -24};
;29:static vec3_t	playerMaxs = {15, 15, 32};
;30:
;31:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;32:potential spawning position for deathmatch games.
;33:The first time a player enters the game, they will be at an 'initial' spot.
;34:Targets will be fired when someone spawns in on them.
;35:"nobots" will prevent bots from using this spot.
;36:"nohumans" will prevent non-bots from using this spot.
;37:"count" is used to limit the number of times the spawnpoint can be used. When 0 or omitted there is no limit
;38:*/
;39:
;40:void info_player_deathmatch_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 41
;41:	self->flags ^= FL_NO_SPAWN;	//toggle no spawn flag
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 65536
BXORI4
ASGNI4
line 42
;42:}
LABELV $64
endproc info_player_deathmatch_use 4 0
export SP_info_player_deathmatch
proc SP_info_player_deathmatch 16 12
line 44
;43:
;44:void SP_info_player_deathmatch( gentity_t *ent ) {
line 47
;45:	int		i;
;46:
;47:	G_SpawnInt( "count", "0", &ent->count);
ADDRGP4 $66
ARGP4
ADDRGP4 $67
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 48
;48:	ent->damage = 0; //damage is used to keep track of the number of times this spawnpoint was used.
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 0
ASGNI4
line 50
;49:
;50:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $68
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 51
;51:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $69
line 52
;52:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 53
;53:	}
LABELV $69
line 54
;54:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $71
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 55
;55:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $72
line 56
;56:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 57
;57:	}
LABELV $72
line 60
;58:
;59:	//if DISABLED spawnflag is, disable the spawnpoint at start
;60:	if (ent->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $74
line 61
;61:		info_player_deathmatch_use( ent, NULL, NULL );
ADDRFP4 0
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
ADDRGP4 info_player_deathmatch_use
CALLV
pop
LABELV $74
line 63
;62:	
;63:	ent->use = info_player_deathmatch_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 info_player_deathmatch_use
ASGNP4
line 65
;64:
;65:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 66
;66:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 67
;67:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $76
ASGNP4
line 68
;68:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 69
;69:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 70
;70:	VectorSet( ent->r.mins, -10, -10, -10);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3240099840
ASGNF4
line 71
;71:	VectorSet( ent->r.maxs, 10, 10, 10 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1092616192
ASGNF4
line 72
;72:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 75
;73:	//ent->s.modelindex = G_ModelIndex( "45.md3" );
;74:	
;75:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 76
;76:}
LABELV $65
endproc SP_info_player_deathmatch 16 12
export SP_info_player_start
proc SP_info_player_start 8 4
line 81
;77:
;78:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;79:equivelant to info_player_deathmatch
;80:*/
;81:void SP_info_player_start(gentity_t *ent) {
line 82
;82:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $76
ASGNP4
line 83
;83:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 84
;84:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 85
;85:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 86
;86:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 87
;87:	VectorSet( ent->r.mins, -10, -10, -10);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3240099840
ASGNF4
line 88
;88:	VectorSet( ent->r.maxs, 10, 10, 10 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1092616192
ASGNF4
line 89
;89:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 92
;90:	//ent->s.modelindex = G_ModelIndex( "45.md3" );
;91:
;92:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 93
;93:}
LABELV $77
endproc SP_info_player_start 8 4
export SP_info_player_dd
proc SP_info_player_dd 8 4
line 96
;94:
;95://Three for Double_D
;96:void SP_info_player_dd(gentity_t *ent) {
line 97
;97:		VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 98
;98:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 99
;99:	ent->classname = "info_player_dd";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $79
ASGNP4
line 100
;100:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 101
;101:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 102
;102:	VectorSet( ent->r.mins, -10, -10, -10);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3240099840
ASGNF4
line 103
;103:	VectorSet( ent->r.maxs, 10, 10, 10 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1092616192
ASGNF4
line 104
;104:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 107
;105:	//ent->s.modelindex = G_ModelIndex( "45.md3" );
;106:	
;107:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 108
;108:}
LABELV $78
endproc SP_info_player_dd 8 4
export SP_info_player_dd_red
proc SP_info_player_dd_red 8 4
line 109
;109:void SP_info_player_dd_red(gentity_t *ent) {
line 110
;110:		VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 111
;111:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 112
;112:	ent->classname = "info_player_dd_red";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $81
ASGNP4
line 113
;113:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 114
;114:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 115
;115:	VectorSet( ent->r.mins, -10, -10, -10);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3240099840
ASGNF4
line 116
;116:	VectorSet( ent->r.maxs, 10, 10, 10 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1092616192
ASGNF4
line 117
;117:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 120
;118:	//ent->s.modelindex = G_ModelIndex( "45.md3" );
;119:	
;120:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 121
;121:}
LABELV $80
endproc SP_info_player_dd_red 8 4
export SP_info_player_dd_blue
proc SP_info_player_dd_blue 8 4
line 122
;122:void SP_info_player_dd_blue(gentity_t *ent) {
line 123
;123:		VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 124
;124:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 125
;125:	ent->classname = "info_player_dd_blue";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $83
ASGNP4
line 126
;126:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 127
;127:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 128
;128:	VectorSet( ent->r.mins, -10, -10, -10);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTF4 3240099840
ASGNF4
line 129
;129:	VectorSet( ent->r.maxs, 10, 10, 10 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTF4 1092616192
ASGNF4
line 130
;130:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 133
;131:	//ent->s.modelindex = G_ModelIndex( "45.md3" );
;132:	
;133:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 134
;134:}
LABELV $82
endproc SP_info_player_dd_blue 8 4
export SP_domination_point
proc SP_domination_point 0 0
line 137
;135:
;136://One for Standard Domination, not really a player spawn point
;137:void SP_domination_point(gentity_t *ent) {
line 138
;138:}
LABELV $84
endproc SP_domination_point 0 0
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 143
;139:
;140:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;141:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;142:*/
;143:void SP_info_player_intermission( gentity_t *ent ) {
line 145
;144:
;145:}
LABELV $85
endproc SP_info_player_intermission 0 0
export SpotWouldTelefrag
proc SpotWouldTelefrag 48 16
line 163
;146:
;147:
;148:
;149:/*
;150:=======================================================================
;151:
;152:  SelectSpawnPoint
;153:
;154:=======================================================================
;155:*/
;156:
;157:/*
;158:================
;159:SpotWouldTelefrag
;160:
;161:================
;162:*/
;163:qboolean SpotWouldTelefrag( gentity_t *spot ) {
line 168
;164:	int			i, num;
;165:	gentity_t	*hit;
;166:	vec3_t		mins, maxs;
;167:
;168:	VectorAdd( spot->s.origin, playerMins, mins );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 169
;169:	VectorAdd( spot->s.origin, playerMaxs, maxs );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 40
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 170
;170:	num = trap_EntitiesInBox( mins, maxs, MiTechEntityList, MAX_GENTITIES );
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 MiTechEntityList
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 44
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 44
INDIRI4
ASGNI4
line 172
;171:
;172:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $98
JUMPV
LABELV $95
line 173
;173:		hit = &g_entities[MiTechEntityList[i]];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
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
line 175
;174:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;175:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $99
line 176
;176:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $86
JUMPV
LABELV $99
line 179
;177:		}
;178:
;179:	}
LABELV $96
line 172
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $98
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $95
line 181
;180:
;181:	return qfalse;
CNSTI4 0
RETI4
LABELV $86
endproc SpotWouldTelefrag 48 16
export SpawnPointIsActive
proc SpawnPointIsActive 4 0
line 197
;182:}
;183:
;184:
;185:/*
;186:===========
;187:SpawnPointIsActive
;188:
;189:Returns the active state of a spawnpoint. A spawnpoint is not active
;190:when it has reached the maximum number of spawns. A spawnpoint's
;191:count key is used to set the max number of spawns allowed in that spot.
;192:If a spawnpoint has it's FL_NO_SPAWN flag set, it is also disabled.
;193:This flag can be toggled by aiming at the spawnpoint with a trigger.
;194:
;195:============
;196:*/
;197:qboolean SpawnPointIsActive( gentity_t *spot ) {
line 198
;198:	if ( spot->flags & FL_NO_SPAWN )
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $102
line 199
;199:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $101
JUMPV
LABELV $102
line 201
;200:
;201:	if ( !spot->count )
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 0
NEI4 $104
line 202
;202:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $101
JUMPV
LABELV $104
line 205
;203:
;204:	//damage is used to keep track of the number of spawns at this spot
;205:	if ( spot->damage < spot->count )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
GEI4 $106
line 206
;206:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $101
JUMPV
LABELV $106
line 208
;207:
;208:	return qfalse;
CNSTI4 0
RETI4
LABELV $101
endproc SpawnPointIsActive 4 0
export SelectNearestDeathmatchSpawnPoint
proc SelectNearestDeathmatchSpawnPoint 44 12
line 220
;209:}
;210:
;211:
;212:/*
;213:================
;214:SelectNearestDeathmatchSpawnPoint
;215:
;216:Find the spot that we DON'T want to use
;217:================
;218:*/
;219:#define	MAX_SPAWN_POINTS	128
;220:gentity_t *SelectNearestDeathmatchSpawnPoint( vec3_t from ) {
line 226
;221:	gentity_t	*spot;
;222:	vec3_t		delta;
;223:	float		dist, nearestDist;
;224:	gentity_t	*nearestSpot;
;225:
;226:	nearestDist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 227
;227:	nearestSpot = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 228
;228:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $110
JUMPV
LABELV $109
line 230
;229:
;230:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 232
;231:
;232:		VectorSubtract( spot->s.origin, from, delta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 233
;233:		dist = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ASGNF4
line 234
;234:		if ( dist < nearestDist && SpawnPointIsActive(spot) ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $114
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 SpawnPointIsActive
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $114
line 235
;235:			nearestDist = dist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 236
;236:			nearestSpot = spot;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 237
;237:		}
LABELV $114
line 238
;238:	}
LABELV $110
line 230
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $76
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $109
line 240
;239:
;240:	return nearestSpot;
ADDRLP4 24
INDIRP4
RETP4
LABELV $108
endproc SelectNearestDeathmatchSpawnPoint 44 12
export SelectRandomDeathmatchSpawnPoint
proc SelectRandomDeathmatchSpawnPoint 532 12
line 252
;241:}
;242:
;243:
;244:/*
;245:================
;246:SelectRandomDeathmatchSpawnPoint
;247:
;248:go to a random point that doesn't telefrag
;249:================
;250:*/
;251:#define	MAX_SPAWN_POINTS	128
;252:gentity_t *SelectRandomDeathmatchSpawnPoint( void ) {
line 258
;253:	gentity_t	*spot;
;254:	int			count;
;255:	int			selection;
;256:	gentity_t	*spots[MAX_SPAWN_POINTS];
;257:
;258:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 259
;259:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $118
JUMPV
LABELV $117
line 262
;260:
;261:	//find the spots that are active and do not telefrag
;262:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 263
;263:		if ( SpotWouldTelefrag( spot ) || !SpawnPointIsActive( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
NEI4 $122
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 528
ADDRGP4 SpawnPointIsActive
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
NEI4 $120
LABELV $122
line 264
;264:			continue;
ADDRGP4 $118
JUMPV
LABELV $120
line 266
;265:		}
;266:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 267
;267:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 268
;268:	}
LABELV $118
line 262
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $76
ARGP4
ADDRLP4 524
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $117
line 271
;269:
;270:	//no spots are found, so we look for active spots even if they telefrag
;271:	if ( !count ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $123
line 272
;272:		spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $126
JUMPV
LABELV $125
line 273
;273:		while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 274
;274:			if ( !SpawnPointIsActive( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 528
ADDRGP4 SpawnPointIsActive
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
NEI4 $128
line 275
;275:				continue;
ADDRGP4 $126
JUMPV
LABELV $128
line 277
;276:			}
;277:			spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 278
;278:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 279
;279:		}
LABELV $126
line 273
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $76
ARGP4
ADDRLP4 528
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 528
INDIRP4
ASGNP4
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $125
line 280
;280:	}
LABELV $123
line 283
;281:	
;282:
;283:	if ( !count ) {	
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $130
line 288
;284:		// there are no active spots at all, so we'll allow spawning at a random non-active spot
;285:		// TODO: Make a more predictable solution for this
;286:		
;287:		//G_Error( "Couldn't find a spawn point" );
;288:		return G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $76
ARGP4
ADDRLP4 528
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $116
JUMPV
LABELV $130
line 291
;289:	}
;290:
;291:	selection = rand() % count;
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 528
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 292
;292:	return spots[ selection ];
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $116
endproc SelectRandomDeathmatchSpawnPoint 532 12
export SelectRandomFurthestSpawnPoint
proc SelectRandomFurthestSpawnPoint 576 12
line 302
;293:}
;294:
;295:/*
;296:===========
;297:SelectRandomFurthestSpawnPoint
;298:
;299:Chooses a player start, deathmatch start, etc
;300:============
;301:*/
;302:gentity_t *SelectRandomFurthestSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 310
;303:	gentity_t	*spot;
;304:	vec3_t		delta;
;305:	float		dist;
;306:	float		list_dist[64];
;307:	gentity_t	*list_spot[64];
;308:	int			numSpots, rnd, i, j;
;309:
;310:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 311
;311:	spot = NULL;
ADDRLP4 528
CNSTP4 0
ASGNP4
ADDRGP4 $134
JUMPV
LABELV $133
line 314
;312:
;313:	// Find spots that are active and don't telefrag
;314:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 315
;315:		if ( SpotWouldTelefrag( spot ) || !SpawnPointIsActive( spot ) ) {
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
NEI4 $138
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 SpawnPointIsActive
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
NEI4 $136
LABELV $138
line 316
;316:			continue;
ADDRGP4 $134
JUMPV
LABELV $136
line 318
;317:		}
;318:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 560
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 560
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 560
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 319
;319:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 564
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 564
INDIRF4
ASGNF4
line 320
;320:		for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $141
line 321
;321:			if ( dist > list_dist[i] ) {
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $145
line 322
;322:				if ( numSpots >= 64 )
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $147
line 323
;323:					numSpots = 64-1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $147
line 324
;324:				for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $152
JUMPV
LABELV $149
line 325
;325:					list_dist[j] = list_dist[j-1];
ADDRLP4 568
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 568
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 568
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 326
;326:					list_spot[j] = list_spot[j-1];
ADDRLP4 572
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 572
INDIRI4
ADDRLP4 260
ADDP4
ADDRLP4 572
INDIRI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 327
;327:				}
LABELV $150
line 324
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $152
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $149
line 328
;328:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 329
;329:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 330
;330:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 331
;331:				if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $143
line 332
;332:					numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 333
;333:				break;
ADDRGP4 $143
JUMPV
LABELV $145
line 335
;334:			}
;335:		}
LABELV $142
line 320
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $144
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $141
LABELV $143
line 336
;336:		if (i >= numSpots && numSpots < 64) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $157
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $157
line 337
;337:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 338
;338:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 339
;339:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 340
;340:		}
LABELV $157
line 341
;341:	}
LABELV $134
line 314
ADDRLP4 528
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $76
ARGP4
ADDRLP4 548
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 548
INDIRP4
ASGNP4
ADDRLP4 548
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $133
line 343
;342:
;343:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $159
ADDRGP4 $162
JUMPV
LABELV $161
line 345
;344:		// No spots were found, so find spots that are active even if they telefrag
;345:		while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 346
;346:			if ( !SpawnPointIsActive( spot ) ) {
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 SpawnPointIsActive
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
NEI4 $164
line 347
;347:				continue;
ADDRGP4 $162
JUMPV
LABELV $164
line 349
;348:			}
;349:			VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 560
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 560
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 560
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 350
;350:			dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 564
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 564
INDIRF4
ASGNF4
line 351
;351:			for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $168
line 352
;352:				if ( dist > list_dist[i] ) {
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $172
line 353
;353:					if ( numSpots >= 64 )
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $174
line 354
;354:						numSpots = 64-1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $174
line 355
;355:					for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $179
JUMPV
LABELV $176
line 356
;356:						list_dist[j] = list_dist[j-1];
ADDRLP4 568
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 568
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 568
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 357
;357:						list_spot[j] = list_spot[j-1];
ADDRLP4 572
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 572
INDIRI4
ADDRLP4 260
ADDP4
ADDRLP4 572
INDIRI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 358
;358:					}
LABELV $177
line 355
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $179
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $176
line 359
;359:					list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 360
;360:					list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 361
;361:					numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 362
;362:					if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $170
line 363
;363:						numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 364
;364:					break;
ADDRGP4 $170
JUMPV
LABELV $172
line 366
;365:				}
;366:			}
LABELV $169
line 351
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $171
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $168
LABELV $170
line 367
;367:			if (i >= numSpots && numSpots < 64) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $184
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $184
line 368
;368:				list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 369
;369:				list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 370
;370:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 371
;371:			}
LABELV $184
line 372
;372:		}
LABELV $162
line 345
ADDRLP4 528
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $76
ARGP4
ADDRLP4 552
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 552
INDIRP4
ASGNP4
ADDRLP4 552
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $161
line 373
;373:	}
LABELV $159
line 375
;374:
;375:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $186
line 377
;376:		// there are no active spots at all, so we'll allow spawning at a random non-active spot
;377:		spot = G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $76
ARGP4
ADDRLP4 552
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 552
INDIRP4
ASGNP4
line 378
;378:		if (!spot)
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $188
line 379
;379:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $190
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $188
line 380
;380:		VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 381
;381:		origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 382
;382:		VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 383
;383:		return spot;
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $132
JUMPV
LABELV $186
line 387
;384:	}
;385:
;386:	// select a random spot from the spawn points furthest away
;387:	rnd = random() * (numSpots / 2);
ADDRLP4 552
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
ADDRLP4 552
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 389
;388:
;389:	VectorCopy (list_spot[rnd]->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 390
;390:	origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 391
;391:	VectorCopy (list_spot[rnd]->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 393
;392:
;393:	return list_spot[rnd];
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
RETP4
LABELV $132
endproc SelectRandomFurthestSpawnPoint 576 12
export FindTeleporterTarget
proc FindTeleporterTarget 12 12
line 403
;394:}
;395:
;396:/*
;397:===========
;398:FindTeleporterTarget
;399:
;400:Finds target location for holdable_teleporter if forced
;401:============
;402:*/
;403:gentity_t *FindTeleporterTarget ( gentity_t *ent, vec3_t origin, vec3_t angles ) {
line 406
;404:	gentity_t *target;
;405:	
;406:	target = G_PickTarget( ent->teleporterTarget );
ADDRFP4 0
INDIRP4
CNSTI4 1072
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
line 409
;407:	
;408:	//target does not exist, so find a random spawnpoint
;409:	if ( !target ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $192
line 410
;410:		return SelectSpawnPoint( ent->client->ps.origin, origin, angles);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $191
JUMPV
LABELV $192
line 413
;411:	}
;412:
;413:	VectorCopy (target->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 414
;414:	origin[2] += 9;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 415
;415:	VectorCopy (target->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 417
;416:
;417:	return target;
ADDRLP4 0
INDIRP4
RETP4
LABELV $191
endproc FindTeleporterTarget 12 12
export SelectSpawnPoint
proc SelectSpawnPoint 24 4
line 427
;418:}
;419:
;420:/*
;421:===========
;422:SelectSpawnPoint
;423:
;424:Chooses a player start, deathmatch start, etc
;425:============
;426:*/
;427:gentity_t *SelectSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 434
;428:	//return SelectRandomFurthestSpawnPoint( avoidPoint, origin, angles );
;429:
;430:
;431:	gentity_t	*spot;
;432:	gentity_t	*nearestSpot;
;433:
;434:	nearestSpot = SelectNearestDeathmatchSpawnPoint( avoidPoint );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectNearestDeathmatchSpawnPoint
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 436
;435:
;436:	spot = SelectRandomDeathmatchSpawnPoint ( );
ADDRLP4 12
ADDRGP4 SelectRandomDeathmatchSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 437
;437:	if ( spot == nearestSpot ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $195
line 439
;438:		// roll again if it would be real close to point of death
;439:		spot = SelectRandomDeathmatchSpawnPoint ( );
ADDRLP4 16
ADDRGP4 SelectRandomDeathmatchSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 440
;440:		if ( spot == nearestSpot ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $197
line 442
;441:			// last try
;442:			spot = SelectRandomDeathmatchSpawnPoint ( );
ADDRLP4 20
ADDRGP4 SelectRandomDeathmatchSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 443
;443:		}
LABELV $197
line 444
;444:	}
LABELV $195
line 447
;445:
;446:	// find a single player start spot
;447:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $199
line 448
;448:		G_Error( "Couldn't find a spawn point" );
ADDRGP4 $190
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 449
;449:	}
LABELV $199
line 451
;450:
;451:	VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 452
;452:	origin[2] += 9;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 453
;453:	VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 455
;454:
;455:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $194
endproc SelectSpawnPoint 24 4
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 12
line 468
;456:}
;457:
;458:/*
;459:===========
;460:SelectInitialSpawnPoint
;461:
;462:Try to find a spawn point marked 'initial', where the client
;463:is allowed to spawn. Otherwise use normal spawn selection.
;464:It is assumed there's only ONE spawnpoint marked 'initial'
;465:in the map.
;466:============
;467:*/
;468:gentity_t *SelectInitialSpawnPoint( vec3_t origin, vec3_t angles ) {
line 471
;469:	gentity_t	*spot;
;470:
;471:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $203
JUMPV
LABELV $202
line 472
;472:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 473
;473:		if ( (spot->spawnflags & 1) && SpawnPointIsActive(spot) ) {
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $205
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SpawnPointIsActive
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $205
line 474
;474:			break;
ADDRGP4 $204
JUMPV
LABELV $205
line 476
;475:		}
;476:	}
LABELV $203
line 472
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $76
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
NEU4 $202
LABELV $204
line 478
;477:
;478:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $209
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $207
LABELV $209
line 479
;479:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $201
JUMPV
LABELV $207
line 482
;480:	}
;481:
;482:	VectorCopy (spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 483
;483:	origin[2] += 9;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 484
;484:	VectorCopy (spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 486
;485:
;486:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $201
endproc SelectInitialSpawnPoint 20 12
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 495
;487:}
;488:
;489:/*
;490:===========
;491:SelectSpectatorSpawnPoint
;492:
;493:============
;494:*/
;495:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 498
;496:	//gentity_t	*spot;
;497:
;498:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 500
;499:
;500:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+9928
INDIRB
ASGNB 12
line 501
;501:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+9940
INDIRB
ASGNB 12
line 513
;502:
;503:
;504:
;505:	//for some reason we need to return an specific point in elimination (this might not be neccecary anymore but to be sure...)
;506:	//if(g_gametype.integer == GT_ELIMINATION)
;507:	//	return SelectSpawnPoint( vec3_origin, origin, angles );
;508:
;509:	//VectorCopy (origin,spot->s.origin);
;510:	//spot->s.origin[2] += 9;
;511:	//VectorCopy (angles, spot->s.angles);
;512:
;513:	return NULL;
CNSTP4 0
RETP4
LABELV $210
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 529
;514:}
;515:
;516:/*
;517:=======================================================================
;518:
;519:BODYQUE
;520:
;521:=======================================================================
;522:*/
;523:
;524:/*
;525:===============
;526:InitBodyQue
;527:===============
;528:*/
;529:void InitBodyQue (void) {
line 533
;530:	int		i;
;531:	gentity_t	*ent;
;532:
;533:	level.bodyQueIndex = 0;
ADDRGP4 level+9960
CNSTI4 0
ASGNI4
line 534
;534:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $215
line 535
;535:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 536
;536:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $219
ASGNP4
line 537
;537:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 1
ASGNI4
line 538
;538:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9964
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 539
;539:	}
LABELV $216
line 534
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $215
line 540
;540:}
LABELV $213
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 549
;541:
;542:/*
;543:=============
;544:BodySink
;545:
;546:After sitting around for five seconds, fall into the ground and dissapear
;547:=============
;548:*/
;549:void BodySink( gentity_t *ent ) {
line 550
;550:	if ( level.time - ent->timestamp > 6500 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
SUBI4
CNSTI4 6500
LEI4 $222
line 554
;551:
;552:
;553:		// the body ques are never actually freed, they are just unlinked
;554:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 555
;555:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 556
;556:		return;
ADDRGP4 $221
JUMPV
LABELV $222
line 558
;557:	}
;558:	ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 559
;559:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 561
;560:	//GibEntity( ent, 0 );
;561:}
LABELV $221
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 56 8
line 571
;562:
;563:/*
;564:=============
;565:CopyToBodyQue
;566:
;567:A player is respawning, so make an entity that looks
;568:just like the existing corpse to leave behind.
;569:=============
;570:*/
;571:void CopyToBodyQue( gentity_t *ent ) {
line 577
;572:	gentity_t	*e;
;573:	int i;
;574:	gentity_t		*body;
;575:	int			contents;
;576:
;577:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 580
;578:
;579:	// if client is in a nodrop area, don't leave the body
;580:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 581
;581:	if ( (contents & CONTENTS_NODROP) && !(ent->s.eFlags & EF_KAMIKAZE) ) { //the check for kamikaze is a workaround for ctf4ish
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $227
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $227
line 582
;582:            return;
ADDRGP4 $226
JUMPV
LABELV $227
line 586
;583:	}
;584:
;585:	// grab a body que and cycle to the next one
;586:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 4
ADDRGP4 level+9960
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9964
ADDP4
INDIRP4
ASGNP4
line 587
;587:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+9960
ADDRGP4 level+9960
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 590
;588:
;589:        //Check if the next body has the kamikaze, in that case skip it.
;590:        for(i=0;(level.bodyQue[ level.bodyQueIndex ]->s.eFlags & EF_KAMIKAZE) && (i<10);i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $236
JUMPV
LABELV $233
line 591
;591:            level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+9960
ADDRGP4 level+9960
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 592
;592:        }
LABELV $234
line 590
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $236
ADDRGP4 level+9960
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9964
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $241
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $233
LABELV $241
line 594
;593:
;594:	body->s = ent->s;
ADDRLP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 228
line 595
;595:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 596
;596:	if ( ent->s.eFlags & EF_KAMIKAZE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $242
line 597
;597:                ent->s.eFlags &= ~EF_KAMIKAZE;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 598
;598:		body->s.eFlags |= EF_KAMIKAZE;
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 601
;599:
;600:		// check if there is a kamikaze timer around for this owner
;601:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $244
line 602
;602:			e = &g_entities[i];
ADDRLP4 8
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 603
;603:			if (!e->inuse)
ADDRLP4 8
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $248
line 604
;604:				continue;
ADDRGP4 $245
JUMPV
LABELV $248
line 605
;605:			if (e->activator != ent)
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $250
line 606
;606:				continue;
ADDRGP4 $245
JUMPV
LABELV $250
line 607
;607:			if (strcmp(e->classname, "kamikaze timer"))
ADDRLP4 8
INDIRP4
CNSTI4 564
ADDP4
INDIRP4
ARGP4
ADDRGP4 $254
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $252
line 608
;608:				continue;
ADDRGP4 $245
JUMPV
LABELV $252
line 609
;609:			e->activator = body;
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 610
;610:			break;
ADDRGP4 $246
JUMPV
LABELV $245
line 601
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4096
LTI4 $244
LABELV $246
line 612
;611:		}
;612:	}
LABELV $242
line 613
;613:	body->s.powerups = 0;	// clear powerups
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 614
;614:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 0
ASGNI4
line 615
;615:	body->s.number = body - g_entities;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ASGNI4
line 616
;616:	body->timestamp = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 617
;617:	body->physicsObject = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
line 618
;618:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 4
INDIRP4
CNSTI4 608
ADDP4
CNSTF4 0
ASGNF4
line 619
;619:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 4095
NEI4 $256
line 620
;620:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 621
;621:		body->s.pos.trTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 622
;622:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 623
;623:	} else {
ADDRGP4 $257
JUMPV
LABELV $256
line 624
;624:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 625
;625:	}
LABELV $257
line 626
;626:	body->s.event = 0;
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 630
;627:
;628:	// change the animation to the last-frame only, so the sequence
;629:	// doesn't repeat anew for the body
;630:	switch ( body->s.legsAnim & ~ANIM_TOGGLEBIT ) {
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $259
ADDRLP4 24
INDIRI4
CNSTI4 5
GTI4 $259
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $265
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $265
address $262
address $262
address $263
address $263
address $264
address $264
code
LABELV $262
line 633
;631:	case BOTH_DEATH1:
;632:	case BOTH_DEAD1:
;633:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD1;
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 634
;634:		break;
ADDRGP4 $260
JUMPV
LABELV $263
line 637
;635:	case BOTH_DEATH2:
;636:	case BOTH_DEAD2:
;637:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD2;
ADDRLP4 44
CNSTI4 3
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 638
;638:		break;
ADDRGP4 $260
JUMPV
LABELV $264
LABELV $259
line 642
;639:	case BOTH_DEATH3:
;640:	case BOTH_DEAD3:
;641:	default:
;642:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD3;
ADDRLP4 52
CNSTI4 5
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 643
;643:		break;
LABELV $260
line 646
;644:	}
;645:
;646:	body->r.svFlags = ent->r.svFlags;
ADDRLP4 32
CNSTI4 464
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 647
;647:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 36
CNSTI4 476
ASGNI4
ADDRLP4 4
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
line 648
;648:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 40
CNSTI4 488
ASGNI4
ADDRLP4 4
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
line 649
;649:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 44
CNSTI4 504
ASGNI4
ADDRLP4 4
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
line 650
;650:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 48
CNSTI4 516
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 652
;651:
;652:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 65537
ASGNI4
line 653
;653:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 67108864
ASGNI4
line 654
;654:	body->r.ownerNum = ent->s.number;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 656
;655:
;656:	body->nextthink = level.time + 5000;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 657
;657:	body->think = BodySink;
ADDRLP4 4
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 BodySink
ASGNP4
line 659
;658:
;659:	body->die = body_die;
ADDRLP4 4
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 body_die
ASGNP4
line 662
;660:
;661:	// don't take more damage if already gibbed
;662:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 -66
GTI4 $267
line 663
;663:		body->takedamage = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 664
;664:	} else {
ADDRGP4 $268
JUMPV
LABELV $267
line 665
;665:		body->takedamage = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 666
;666:	}
LABELV $268
line 669
;667:
;668:
;669:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 670
;670:	trap_LinkEntity (body);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 671
;671:}
LABELV $226
endproc CopyToBodyQue 56 8
export SetClientViewAngle
proc SetClientViewAngle 16 0
line 682
;672:
;673://======================================================================
;674:
;675:
;676:/*
;677:==================
;678:SetClientViewAngle
;679:
;680:==================
;681:*/
;682:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 686
;683:	int			i;
;684:
;685:	// set the delta angle
;686:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $270
line 689
;687:		int		cmdAngle;
;688:
;689:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 4
CNSTF4 1199570944
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 690
;690:		ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 56
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 480
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 691
;691:	}
LABELV $271
line 686
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $270
line 692
;692:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 693
;693:	VectorCopy (ent->s.angles, ent->client->ps.viewangles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 694
;694:}
LABELV $269
endproc SetClientViewAngle 16 0
export ClientRespawn
proc ClientRespawn 16 8
line 701
;695:
;696:/*
;697:================
;698:respawn
;699:================
;700:*/
;701:void ClientRespawn( gentity_t *ent ) {
line 704
;702:	gentity_t	*tent;
;703:
;704:if(ent->singlebot >= 1){
ADDRFP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 1
LTI4 $275
line 706
;705:	//kick fragged bots from game
;706:	DropClientSilently( ent->client->ps.clientNum );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 DropClientSilently
CALLV
pop
line 707
;707:	return;
ADDRGP4 $274
JUMPV
LABELV $275
line 710
;708:}
;709:
;710:	if((g_gametype.integer!=GT_ELIMINATION && g_gametype.integer!=GT_CTF_ELIMINATION && g_gametype.integer !=GT_LMS) && !ent->client->isEliminated)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $277
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $277
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
EQI4 $277
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $277
line 711
;711:	{
line 712
;712:		ent->client->isEliminated = qtrue; //must not be true in warmup
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 1
ASGNI4
line 714
;713:		//Tried moving CopyToBodyQue
;714:	} else {
ADDRGP4 $278
JUMPV
LABELV $277
line 716
;715:                //Must always be false in other gametypes
;716:                ent->client->isEliminated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 0
ASGNI4
line 717
;717:        }
LABELV $278
line 718
;718:        CopyToBodyQue (ent); //Unlinks ent
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 720
;719:
;720:	if(g_gametype.integer==GT_LMS) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $282
line 721
;721:		if(ent->client->pers.livesLeft>0)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
LEI4 $285
line 722
;722:		{
line 724
;723:			//ent->client->pers.livesLeft--; Coutned down somewhere else
;724:			ent->client->isEliminated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 0
ASGNI4
line 725
;725:		}
ADDRGP4 $286
JUMPV
LABELV $285
line 727
;726:		else //We have used all our lives
;727:		{
line 728
;728:			if( ent->client->isEliminated!=qtrue) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 1
EQI4 $274
line 729
;729:				ent->client->isEliminated = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 1
ASGNI4
line 730
;730:				if((g_lms_mode.integer == 2 || g_lms_mode.integer == 3) && level.roundNumber == level.roundNumberStarted)
ADDRGP4 g_lms_mode+12
INDIRI4
CNSTI4 2
EQI4 $295
ADDRGP4 g_lms_mode+12
INDIRI4
CNSTI4 3
NEI4 $289
LABELV $295
ADDRGP4 level+10004
INDIRI4
ADDRGP4 level+10008
INDIRI4
NEI4 $289
line 731
;731:					LMSpoint();
ADDRGP4 LMSpoint
CALLV
pop
LABELV $289
line 734
;732:                                //Sago: This is really bad
;733:                                //TODO: Try not to make people spectators here
;734:				ent->client->sess.spectatorState = PM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 2
ASGNI4
line 736
;735:                                //We have to force spawn imidiantly to prevent lag.
;736:                                ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 737
;737:			}
line 738
;738:			return;
ADDRGP4 $274
JUMPV
LABELV $286
line 740
;739:		}
;740:	}
LABELV $282
line 742
;741:
;742:	if((g_gametype.integer==GT_ELIMINATION || g_gametype.integer==GT_CTF_ELIMINATION || g_gametype.integer==GT_LMS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $302
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $302
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $296
LABELV $302
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $296
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $296
line 744
;743:			&& ent->client->ps.pm_type == PM_SPECTATOR && ent->client->ps.stats[STAT_HEALTH] > 0)
;744:		return;
ADDRGP4 $274
JUMPV
LABELV $296
line 745
;745:		ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 748
;746:
;747:		// add a teleportation effect
;748:		if(g_gametype.integer!=GT_ELIMINATION && g_gametype.integer!=GT_CTF_ELIMINATION && g_gametype.integer!=GT_LMS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $303
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $303
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
EQI4 $303
line 749
;749:		{
line 750
;750:			tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 751
;751:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 12
CNSTI4 180
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 752
;752:		}
LABELV $303
line 753
;753:}
LABELV $274
endproc ClientRespawn 16 8
export respawnRound
proc respawnRound 12 8
line 760
;754:
;755:/*
;756:================
;757:respawnRound
;758:================
;759:*/
;760:void respawnRound( gentity_t *ent ) {
line 772
;761:	gentity_t	*tent;
;762:
;763:	//if(g_gametype.integer!=GT_ELIMINATION || !ent->client->isEliminated)
;764:	//{
;765:	//	ent->client->isEliminated  = qtrue;
;766:		//CopyToBodyQue (ent);
;767:	//}
;768:
;769:
;770:	//if(g_gametype.integer==GT_ELIMINATION && ent->client->ps.pm_type == PM_SPECTATOR && ent->client->ps.stats[STAT_HEALTH] > 0)
;771:	//	return;
;772:        if(ent->client->hook)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1344
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $309
line 773
;773:                Weapon_HookFree(ent->client->hook);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1344
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
LABELV $309
line 775
;774:
;775:        trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 777
;776:
;777:	ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 780
;778:
;779:        // add a teleportation effect
;780:        if(g_gametype.integer!=GT_ELIMINATION && g_gametype.integer!=GT_CTF_ELIMINATION && g_gametype.integer!=GT_LMS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $311
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $311
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
EQI4 $311
line 781
;781:        {
line 782
;782:                tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 783
;783:                tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
CNSTI4 180
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 784
;784:        }
LABELV $311
line 785
;785:}
LABELV $308
endproc respawnRound 12 8
export TeamCvarSet
proc TeamCvarSet 28 12
line 795
;786:
;787:/*
;788:================
;789:TeamCvarSet
;790:
;791:Sets the red and blue team client number cvars.
;792:================
;793: */
;794:void TeamCvarSet( void )
;795:{
line 797
;796:    int i;
;797:    qboolean redChanged = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 798
;798:    qboolean blueChanged = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 799
;799:    qboolean first = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 800
;800:    char* temp = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 802
;801:
;802:    for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $320
JUMPV
LABELV $317
line 803
;803:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $322
line 804
;804:			continue;
ADDRGP4 $318
JUMPV
LABELV $322
line 806
;805:		}
;806:		if ( level.clients[i].sess.sessionTeam == TEAM_RED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $324
line 807
;807:                    if(first) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $326
line 808
;808:                        temp = va("%i",i);
ADDRGP4 $328
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 809
;809:                        first = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 810
;810:                    }
ADDRGP4 $327
JUMPV
LABELV $326
line 812
;811:                    else
;812:                        temp = va("%s,%i",temp,i);
ADDRGP4 $329
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
LABELV $327
line 813
;813:		}
LABELV $324
line 814
;814:	}
LABELV $318
line 802
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $320
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $317
line 816
;815:
;816:    if(Q_stricmp(g_redTeamClientNumbers.string,temp))
ADDRGP4 g_redTeamClientNumbers+16
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $330
line 817
;817:        redChanged = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $330
line 818
;818:    trap_Cvar_Set("g_redTeamClientNumbers",temp); //Set it right
ADDRGP4 $333
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 819
;819:    first= qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 821
;820:
;821:    for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $337
JUMPV
LABELV $334
line 822
;822:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $339
line 823
;823:			continue;
ADDRGP4 $335
JUMPV
LABELV $339
line 825
;824:		}
;825:		if ( level.clients[i].sess.sessionTeam == TEAM_BLUE ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
NEI4 $341
line 826
;826:                    if(first) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $343
line 827
;827:                        temp = va("%i",i);
ADDRGP4 $328
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 828
;828:                        first = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 829
;829:                    }
ADDRGP4 $344
JUMPV
LABELV $343
line 831
;830:                    else
;831:                        temp = va("%s,%i",temp,i);
ADDRGP4 $329
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
LABELV $344
line 832
;832:		}
LABELV $341
line 833
;833:	}
LABELV $335
line 821
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $337
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $334
line 834
;834:    if(Q_stricmp(g_blueTeamClientNumbers.string,temp))
ADDRGP4 g_blueTeamClientNumbers+16
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $345
line 835
;835:        blueChanged = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
LABELV $345
line 836
;836:    trap_Cvar_Set("g_blueTeamClientNumbers",temp);
ADDRGP4 $348
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 839
;837:
;838:    //Note: We need to force update of the cvar or SendYourTeamMessage will send the old cvar value!
;839:    if(redChanged) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $349
line 840
;840:        trap_Cvar_Update(&g_redTeamClientNumbers); //Force update of CVAR
ADDRGP4 g_redTeamClientNumbers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 841
;841:        SendYourTeamMessageToTeam(TEAM_RED);
CNSTI4 1
ARGI4
ADDRGP4 SendYourTeamMessageToTeam
CALLV
pop
line 842
;842:    }
LABELV $349
line 843
;843:    if(blueChanged) {
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $351
line 844
;844:        trap_Cvar_Update(&g_blueTeamClientNumbers);
ADDRGP4 g_blueTeamClientNumbers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 845
;845:        SendYourTeamMessageToTeam(TEAM_BLUE); //Force update of CVAR
CNSTI4 2
ARGI4
ADDRGP4 SendYourTeamMessageToTeam
CALLV
pop
line 846
;846:    }
LABELV $351
line 847
;847:}
LABELV $316
endproc TeamCvarSet 28 12
export TeamCount
proc TeamCount 8 0
line 856
;848:
;849:/*
;850:================
;851:TeamCount
;852:
;853:Returns number of players on a team
;854:================
;855:*/
;856:team_t TeamCount( int ignoreClientNum, int team ) {
line 858
;857:	int		i;
;858:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 860
;859:
;860:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $357
JUMPV
LABELV $354
line 861
;861:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $359
line 862
;862:			continue;
ADDRGP4 $355
JUMPV
LABELV $359
line 864
;863:		}
;864:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $361
line 865
;865:			continue;
ADDRGP4 $355
JUMPV
LABELV $361
line 868
;866:		}
;867:
;868:                if ( level.clients[i].pers.connected == CON_CONNECTING) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $363
line 869
;869:                        continue;
ADDRGP4 $355
JUMPV
LABELV $363
line 872
;870:                }
;871:
;872:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $365
line 873
;873:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 874
;874:		}
LABELV $365
line 875
;875:	}
LABELV $355
line 860
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $357
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $354
line 877
;876:
;877:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $353
endproc TeamCount 8 0
export TeamLivingCount
proc TeamLivingCount 24 0
line 887
;878:}
;879:
;880:/*
;881:================
;882:TeamLivingCount
;883:
;884:Returns number of living players on a team
;885:================
;886:*/
;887:team_t TeamLivingCount( int ignoreClientNum, int team ) {
line 889
;888:	int		i;
;889:	int		count = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 890
;890:	qboolean	LMS = (g_gametype.integer==GT_LMS);
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $370
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $371
JUMPV
LABELV $370
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $371
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 892
;891:
;892:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $375
JUMPV
LABELV $372
line 893
;893:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $377
line 894
;894:			continue;
ADDRGP4 $373
JUMPV
LABELV $377
line 896
;895:		}
;896:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $379
line 897
;897:			continue;
ADDRGP4 $373
JUMPV
LABELV $379
line 900
;898:		}
;899:
;900:                if ( level.clients[i].pers.connected == CON_CONNECTING) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $381
line 901
;901:                        continue;
ADDRGP4 $373
JUMPV
LABELV $381
line 904
;902:                }
;903:		//crash if g_gametype.integer is used here, why?
;904:		if ( level.clients[i].sess.sessionTeam == team && (level.clients[i].ps.stats[STAT_HEALTH]>0 || LMS) && !(level.clients[i].isEliminated)) {
ADDRLP4 16
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $383
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
GTI4 $385
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $383
LABELV $385
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $383
line 905
;905:			count++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 906
;906:		}
LABELV $383
line 907
;907:	}
LABELV $373
line 892
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $375
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $372
line 909
;908:
;909:	return count;
ADDRLP4 8
INDIRI4
RETI4
LABELV $367
endproc TeamLivingCount 24 0
export TeamHealthCount
proc TeamHealthCount 16 0
line 920
;910:}
;911:
;912:/*
;913:================
;914:TeamHealthCount
;915:
;916:Count total number of healthpoints on teh teams used for draws in Elimination
;917:================
;918:*/
;919:
;920:team_t TeamHealthCount(int ignoreClientNum, int team ) {
line 922
;921:	int 		i;
;922:	int 		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 924
;923:
;924:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $390
JUMPV
LABELV $387
line 925
;925:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $392
line 926
;926:			continue;
ADDRGP4 $388
JUMPV
LABELV $392
line 928
;927:		}
;928:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $394
line 929
;929:			continue;
ADDRGP4 $388
JUMPV
LABELV $394
line 932
;930:		}
;931:
;932:                if ( level.clients[i].pers.connected == CON_CONNECTING) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $396
line 933
;933:                        continue;
ADDRGP4 $388
JUMPV
LABELV $396
line 937
;934:                }
;935:
;936:		//only count clients with positive health
;937:		if ( level.clients[i].sess.sessionTeam == team && (level.clients[i].ps.stats[STAT_HEALTH]>0)&& !(level.clients[i].isEliminated)) {
ADDRLP4 8
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $398
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $398
ADDRLP4 8
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $398
line 938
;938:			count+=level.clients[i].ps.stats[STAT_HEALTH];
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 184
ADDP4
INDIRI4
ADDI4
ASGNI4
line 939
;939:		}
LABELV $398
line 940
;940:	}
LABELV $388
line 924
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $390
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $387
line 942
;941:
;942:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $386
endproc TeamHealthCount 16 0
export RespawnAll
proc RespawnAll 8 4
line 955
;943:}
;944:
;945:
;946:/*
;947:================
;948:RespawnAll
;949:
;950:Forces all clients to respawn.
;951:================
;952:*/
;953:
;954:void RespawnAll(void)
;955:{
line 958
;956:	int i;
;957:	gentity_t	*client;
;958:	for(i=0;i<level.maxclients;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $404
JUMPV
LABELV $401
line 959
;959:	{
line 960
;960:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $406
line 961
;961:			continue;
ADDRGP4 $402
JUMPV
LABELV $406
line 964
;962:		}
;963:
;964:                if ( level.clients[i].pers.connected == CON_CONNECTING) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $408
line 965
;965:                        continue;
ADDRGP4 $402
JUMPV
LABELV $408
line 968
;966:                }
;967:
;968:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $410
line 969
;969:			continue;
ADDRGP4 $402
JUMPV
LABELV $410
line 971
;970:		}
;971:		client = g_entities + i;
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 972
;972:		client->client->ps.pm_type = PM_NORMAL;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 973
;973:		client->client->pers.livesLeft = g_lms_lives.integer;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 g_lms_lives+12
INDIRI4
ASGNI4
line 974
;974:		respawnRound(client);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 respawnRound
CALLV
pop
line 975
;975:	}
LABELV $402
line 958
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $404
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $401
line 976
;976:	return;
LABELV $400
endproc RespawnAll 8 4
export RespawnDead
proc RespawnDead 8 4
line 988
;977:}
;978:
;979:/*
;980:================
;981:RespawnDead
;982:
;983:Forces all *DEAD* clients to respawn.
;984:================
;985:*/
;986:
;987:void RespawnDead(void)
;988:{
line 991
;989:	int i;
;990:	gentity_t	*client;
;991:	for(i=0;i<level.maxclients;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $417
JUMPV
LABELV $414
line 992
;992:	{
line 994
;993:
;994:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $419
line 995
;995:			continue;
ADDRGP4 $415
JUMPV
LABELV $419
line 997
;996:		}
;997:                if ( level.clients[i].pers.connected == CON_CONNECTING) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $421
line 998
;998:                        continue;
ADDRGP4 $415
JUMPV
LABELV $421
line 1000
;999:                }
;1000:                client = g_entities + i;
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1001
;1001:                client->client->pers.livesLeft = g_lms_lives.integer-1;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 g_lms_lives+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1002
;1002:		if ( level.clients[i].isEliminated == qfalse ){
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $424
line 1003
;1003:			continue;
ADDRGP4 $415
JUMPV
LABELV $424
line 1005
;1004:		}
;1005:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $426
line 1006
;1006:			continue;
ADDRGP4 $415
JUMPV
LABELV $426
line 1009
;1007:		}
;1008:
;1009:		client->client->pers.livesLeft = g_lms_lives.integer;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 628
ADDP4
ADDRGP4 g_lms_lives+12
INDIRI4
ASGNI4
line 1011
;1010:
;1011:		respawnRound(client);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 respawnRound
CALLV
pop
line 1012
;1012:	}
LABELV $415
line 991
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $417
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $414
line 1013
;1013:	return;
LABELV $413
endproc RespawnDead 8 4
export DisableWeapons
proc DisableWeapons 12 0
line 1025
;1014:}
;1015:
;1016:/*
;1017:================
;1018:DisableWeapons
;1019:
;1020:disables all weapons
;1021:================
;1022:*/
;1023:
;1024:void DisableWeapons(void)
;1025:{
line 1028
;1026:	int i;
;1027:	gentity_t	*client;
;1028:	for(i=0;i<level.maxclients;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $433
JUMPV
LABELV $430
line 1029
;1029:	{
line 1030
;1030:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $435
line 1031
;1031:			continue;
ADDRGP4 $431
JUMPV
LABELV $435
line 1033
;1032:		}
;1033:                if ( level.clients[i].pers.connected == CON_CONNECTING) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $437
line 1034
;1034:                        continue;
ADDRGP4 $431
JUMPV
LABELV $437
line 1037
;1035:                }
;1036:
;1037:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $439
line 1038
;1038:			continue;
ADDRGP4 $431
JUMPV
LABELV $439
line 1040
;1039:		}
;1040:		client = g_entities + i;
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1041
;1041:		client->client->ps.pm_flags |= PMF_ELIMWARMUP;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 1042
;1042:	}
LABELV $431
line 1028
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $433
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $430
line 1043
;1043:        ProximityMine_RemoveAll(); //Remove all the prox mines
ADDRGP4 ProximityMine_RemoveAll
CALLV
pop
line 1044
;1044:	return;
LABELV $429
endproc DisableWeapons 12 0
export EnableWeapons
proc EnableWeapons 12 0
line 1056
;1045:}
;1046:
;1047:/*
;1048:================
;1049:EnableWeapons
;1050:
;1051:enables all weapons
;1052:================
;1053:*/
;1054:
;1055:void EnableWeapons(void)
;1056:{
line 1059
;1057:	int i;
;1058:	gentity_t	*client;
;1059:	for(i=0;i<level.maxclients;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $445
JUMPV
LABELV $442
line 1060
;1060:	{
line 1061
;1061:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $447
line 1062
;1062:			continue;
ADDRGP4 $443
JUMPV
LABELV $447
line 1065
;1063:		}
;1064:
;1065:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $449
line 1066
;1066:			continue;
ADDRGP4 $443
JUMPV
LABELV $449
line 1073
;1067:		}
;1068:
;1069:		/*if ( level.clients[i].isEliminated == qtrue ){
;1070:			continue;
;1071:		}*/
;1072:
;1073:		client = g_entities + i;
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1074
;1074:		client->client->ps.pm_flags &= ~PMF_ELIMWARMUP;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 1075
;1075:	}
LABELV $443
line 1059
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $445
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $442
line 1076
;1076:	return;
LABELV $441
endproc EnableWeapons 12 0
export LMSpoint
proc LMSpoint 20 20
line 1088
;1077:}
;1078:
;1079:/*
;1080:================
;1081:LMSpoint
;1082:
;1083:Gives a point to the lucky survivor
;1084:================
;1085:*/
;1086:
;1087:void LMSpoint(void)
;1088:{
line 1091
;1089:	int i;
;1090:	gentity_t	*client;
;1091:	for(i=0;i<level.maxclients;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $455
JUMPV
LABELV $452
line 1092
;1092:	{
line 1093
;1093:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $457
line 1094
;1094:			continue;
ADDRGP4 $453
JUMPV
LABELV $457
line 1097
;1095:		}
;1096:
;1097:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $459
line 1098
;1098:			continue;
ADDRGP4 $453
JUMPV
LABELV $459
line 1101
;1099:		}
;1100:
;1101:		if ( level.clients[i].isEliminated ){
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $461
line 1102
;1102:			continue;
ADDRGP4 $453
JUMPV
LABELV $461
line 1105
;1103:		}
;1104:
;1105:		client = g_entities + i;
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1113
;1106:		/*
;1107:		Not good in mode 2 & 3
;1108:		if ( client->health <= 0 ){
;1109:			continue;
;1110:		}
;1111:		*/
;1112:
;1113:		client->client->ps.persistant[PERS_SCORE] += 1;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 248
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
line 1114
;1114:                        G_LogPrintf("PlayerScore: %i %i: %s now has %d points\n",
ADDRGP4 $463
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1116
;1115:		i, client->client->ps.persistant[PERS_SCORE], client->client->pers.netname, client->client->ps.persistant[PERS_SCORE] );
;1116:	}
LABELV $453
line 1091
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $455
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $452
line 1118
;1117:
;1118:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1119
;1119:	return;
LABELV $451
endproc LMSpoint 20 20
export TeamLeader
proc TeamLeader 4 0
line 1129
;1120:}
;1121:
;1122:/*
;1123:================
;1124:TeamLeader
;1125:
;1126:Returns the client number of the team leader
;1127:================
;1128:*/
;1129:int TeamLeader( int team ) {
line 1132
;1130:	int		i;
;1131:
;1132:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $468
JUMPV
LABELV $465
line 1133
;1133:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $470
line 1134
;1134:			continue;
ADDRGP4 $466
JUMPV
LABELV $470
line 1136
;1135:		}
;1136:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $472
line 1137
;1137:			if ( level.clients[i].sess.teamLeader )
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $474
line 1138
;1138:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $464
JUMPV
LABELV $474
line 1139
;1139:		}
LABELV $472
line 1140
;1140:	}
LABELV $466
line 1132
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $468
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $465
line 1142
;1141:
;1142:	return -1;
CNSTI4 -1
RETI4
LABELV $464
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 28 8
line 1152
;1143:}
;1144:
;1145:
;1146:/*
;1147:================
;1148:PickTeam
;1149:
;1150:================
;1151:*/
;1152:team_t PickTeam( int ignoreClientNum ) {
line 1155
;1153:	int		counts[TEAM_NUM_TEAMS];
;1154:
;1155:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 1156
;1156:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 1159
;1157:
;1158:    //KK-OAX Both Teams locked...forget about it, print an error message, keep as spec
;1159:    if ( level.RedTeamLocked && level.BlueTeamLocked ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 level+10260
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $479
ADDRGP4 level+10264
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $479
line 1160
;1160:        G_Printf( "Both teams have been locked by the Admin! \n" );
ADDRGP4 $483
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1161
;1161:        return TEAM_NONE;
CNSTI4 3
RETI4
ADDRGP4 $476
JUMPV
LABELV $479
line 1163
;1162:    }
;1163:	if ( ( counts[TEAM_BLUE] > counts[TEAM_RED] ) && ( !level.RedTeamLocked ) ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $484
ADDRGP4 level+10260
INDIRI4
CNSTI4 0
NEI4 $484
line 1164
;1164:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $476
JUMPV
LABELV $484
line 1166
;1165:	}
;1166:	if ( ( counts[TEAM_RED] > counts[TEAM_BLUE] ) && ( !level.BlueTeamLocked ) ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $489
ADDRGP4 level+10264
INDIRI4
CNSTI4 0
NEI4 $489
line 1167
;1167:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $476
JUMPV
LABELV $489
line 1170
;1168:	}
;1169:	// equal team count, so join the team with the lowest score
;1170:	if ( ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) && ( !level.RedTeamLocked ) ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 level+44+4
INDIRI4
LEI4 $494
ADDRGP4 level+10260
INDIRI4
CNSTI4 0
NEI4 $494
line 1171
;1171:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $476
JUMPV
LABELV $494
line 1173
;1172:	}
;1173:	if ( ( level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE] ) && ( !level.BlueTeamLocked ) ) {
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
LEI4 $501
ADDRGP4 level+10264
INDIRI4
CNSTI4 0
NEI4 $501
line 1174
;1174:	    return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $476
JUMPV
LABELV $501
line 1177
;1175:    }
;1176:    //KK-OAX Force Team Blue?
;1177:    return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $476
endproc PickTeam 28 8
proc ClientCleanName 36 12
line 1206
;1178:}
;1179:
;1180:/*
;1181:===========
;1182:ForceClientSkin
;1183:
;1184:Forces a client's skin (for teamplay)
;1185:===========
;1186:*/
;1187:/*
;1188:static void ForceClientSkin( gclient_t *client, char *model, const char *skin ) {
;1189:	char *p;
;1190:
;1191:	if ((p = strrchr(model, '/')) != 0) {
;1192:		*p = 0;
;1193:	}
;1194:
;1195:	Q_strcat(model, MAX_QPATH, "/");
;1196:	Q_strcat(model, MAX_QPATH, skin);
;1197:}
;1198:*/
;1199:
;1200:/*
;1201:===========
;1202:ClientCheckName
;1203:============
;1204:*/
;1205:static void ClientCleanName(const char *in, char *out, int outSize, int clientNum)
;1206:{
line 1207
;1207:    int outpos = 0, colorlessLen = 0, spaces = 0, notblack=0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1208
;1208:    qboolean black = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1211
;1209:
;1210:    // discard leading spaces
;1211:    for(; *in == ' '; in++);
ADDRGP4 $512
JUMPV
LABELV $509
LABELV $510
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $512
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $509
line 1213
;1212:
;1213:    for(; *in && outpos < outSize - 1; in++)
ADDRGP4 $516
JUMPV
LABELV $513
line 1214
;1214:    {
line 1215
;1215:        out[outpos] = *in;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRFP4 0
INDIRP4
INDIRI1
ASGNI1
line 1217
;1216:
;1217:        if(*in == ' ')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $517
line 1218
;1218:        {
line 1220
;1219:            // don't allow too many consecutive spaces
;1220:            if(spaces > 2)
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $519
line 1221
;1221:                continue;
ADDRGP4 $514
JUMPV
LABELV $519
line 1223
;1222:
;1223:            spaces++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1224
;1224:        }
ADDRGP4 $518
JUMPV
LABELV $517
line 1225
;1225:        else if(outpos > 0 && out[outpos - 1] == Q_COLOR_ESCAPE)
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $521
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $521
line 1226
;1226:        {
line 1227
;1227:            if(Q_IsColorString(&out[outpos - 1]))
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 28
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $523
ADDRLP4 32
ADDRLP4 28
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $523
ADDRLP4 32
INDIRI4
CNSTI4 48
LTI4 $523
ADDRLP4 32
INDIRI4
CNSTI4 57
GTI4 $523
line 1228
;1228:            {
line 1229
;1229:                colorlessLen--;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1231
;1230:
;1231:                if(ColorIndex(*in) == 0)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 0
NEI4 $525
line 1232
;1232:                {
line 1237
;1233:                    // Disallow color black in names to prevent players
;1234:                    // from getting advantage playing in front of black backgrounds
;1235:                    //outpos--;
;1236:                    //continue;
;1237:                    black = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1238
;1238:                }
ADDRGP4 $522
JUMPV
LABELV $525
line 1240
;1239:                else
;1240:                    black = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1241
;1241:            }
ADDRGP4 $522
JUMPV
LABELV $523
line 1243
;1242:            else
;1243:            {
line 1244
;1244:                spaces = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1245
;1245:                colorlessLen++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1246
;1246:            }
line 1247
;1247:        }
ADDRGP4 $522
JUMPV
LABELV $521
line 1249
;1248:        else
;1249:        {
line 1250
;1250:            spaces = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1251
;1251:            colorlessLen++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1252
;1252:            if(!black && (Q_isalpha(*in) || (*in>='0' && *in<='9') ) )
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $527
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 Q_isalpha
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $529
ADDRLP4 28
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 48
LTI4 $527
ADDRLP4 28
INDIRI4
CNSTI4 57
GTI4 $527
LABELV $529
line 1253
;1253:                notblack++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $527
line 1254
;1254:        }
LABELV $522
LABELV $518
line 1256
;1255:
;1256:        outpos++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1257
;1257:    }
LABELV $514
line 1213
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $516
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $530
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LTI4 $513
LABELV $530
line 1259
;1258:
;1259:    out[outpos] = '\0';
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1262
;1260:
;1261:    //There was none not-black alphanum chars. Remove all colors
;1262:    if(notblack<1)
ADDRLP4 16
INDIRI4
CNSTI4 1
GEI4 $531
line 1263
;1263:        Q_CleanStr(out);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
LABELV $531
line 1266
;1264:
;1265:    // don't allow empty names
;1266:    if( *out == '\0' || colorlessLen == 0)
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
EQI4 $535
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $533
LABELV $535
line 1267
;1267:        Q_strncpyz(out, va("Nameless%i",clientNum), outSize );
ADDRGP4 $536
ARGP4
ADDRFP4 12
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
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $533
line 1268
;1268:}
LABELV $508
endproc ClientCleanName 36 12
export ClientUserinfoChanged
proc ClientUserinfoChanged 20804 112
line 1283
;1269:
;1270:
;1271:
;1272:/*
;1273:===========
;1274:ClientUserInfoChanged
;1275:
;1276:Called from ClientConnect when the player first connects and
;1277:directly by the server system when the player updates a userinfo variable.
;1278:
;1279:The game can override any of the settings and call trap_SetUserinfo
;1280:if desired.
;1281:============
;1282:*/
;1283:void ClientUserinfoChanged( int clientNum ) {
line 1293
;1284:	gentity_t *ent;
;1285:	int		teamTask, teamLeader, team, health;
;1286:	int		singlebot;
;1287:	int		botskill;
;1288:	char	*s;
;1289:	char	model[MAX_QPATH];
;1290:	char	headModel[MAX_QPATH];
;1291:	char	oldname[MAX_STRING_CHARS];
;1292:	char        err[MAX_STRING_CHARS];
;1293:	qboolean    revertName = qfalse;
ADDRLP4 3216
CNSTI4 0
ASGNI4
line 1314
;1294:	gclient_t	*client;
;1295:	char	c1[MAX_INFO_STRING];
;1296:	char	c2[MAX_INFO_STRING];
;1297:	char	heligred[MAX_INFO_STRING];
;1298:	char	heliggreen[MAX_INFO_STRING];
;1299:	char	heligblue[MAX_INFO_STRING];
;1300:	char	toligred[MAX_INFO_STRING];
;1301:	char	toliggreen[MAX_INFO_STRING];
;1302:	char	toligblue[MAX_INFO_STRING];
;1303:	char	pligred[MAX_INFO_STRING];
;1304:	char	pliggreen[MAX_INFO_STRING];
;1305:	char	pligblue[MAX_INFO_STRING];
;1306:	char	pgred[MAX_INFO_STRING];
;1307:	char	pggreen[MAX_INFO_STRING];
;1308:	char	pgblue[MAX_INFO_STRING];
;1309:	char	swep_id[MAX_INFO_STRING];
;1310:	char	redTeam[MAX_INFO_STRING];
;1311:	char	blueTeam[MAX_INFO_STRING];
;1312:	char	userinfo[MAX_INFO_STRING];
;1313:
;1314:	ent = g_entities + clientNum;
ADDRLP4 1032
CNSTI4 2492
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1315
;1315:	client = ent->client;
ADDRLP4 1024
ADDRLP4 1032
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1317
;1316:
;1317:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1320
;1318:
;1319:	// check for malformed or illegal info strings
;1320:	if ( !Info_Validate(userinfo) ) {
ADDRLP4 0
ARGP4
ADDRLP4 20648
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 20648
INDIRI4
CNSTI4 0
NEI4 $538
line 1321
;1321:		strcpy (userinfo, "\\name\\badinfo");
ADDRLP4 0
ARGP4
ADDRGP4 $540
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1322
;1322:	}
LABELV $538
line 1325
;1323:
;1324:	// check for local client
;1325:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 0
ARGP4
ADDRGP4 $541
ARGP4
ADDRLP4 20652
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 20652
INDIRP4
ASGNP4
line 1326
;1326:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 20656
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20656
INDIRI4
CNSTI4 0
NEI4 $542
line 1327
;1327:		client->pers.localClient = qtrue;
ADDRLP4 1024
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1328
;1328:	}
LABELV $542
line 1331
;1329:
;1330:	// check the item prediction
;1331:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 0
ARGP4
ADDRGP4 $545
ARGP4
ADDRLP4 20660
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 20660
INDIRP4
ASGNP4
line 1332
;1332:	if ( !atoi( s ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 20664
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20664
INDIRI4
CNSTI4 0
NEI4 $546
line 1333
;1333:		client->pers.predictItemPickup = qfalse;
ADDRLP4 1024
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 1334
;1334:	} else {
ADDRGP4 $547
JUMPV
LABELV $546
line 1335
;1335:		client->pers.predictItemPickup = qtrue;
ADDRLP4 1024
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 1336
;1336:	}
LABELV $547
line 1340
;1337:
;1338://unlagged - client options
;1339:	// see if the player has opted out
;1340:	s = Info_ValueForKey( userinfo, "cg_delag" );
ADDRLP4 0
ARGP4
ADDRGP4 $548
ARGP4
ADDRLP4 20668
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 20668
INDIRP4
ASGNP4
line 1341
;1341:	if ( !atoi( s ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 20672
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20672
INDIRI4
CNSTI4 0
NEI4 $549
line 1342
;1342:		client->pers.delag = 0;
ADDRLP4 1024
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 0
ASGNI4
line 1343
;1343:	} else {
ADDRGP4 $550
JUMPV
LABELV $549
line 1344
;1344:		client->pers.delag = atoi( s );
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 20676
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 20676
INDIRI4
ASGNI4
line 1345
;1345:	}
LABELV $550
line 1348
;1346:
;1347:	// see if the player is nudging his shots
;1348:	s = Info_ValueForKey( userinfo, "cg_cmdTimeNudge" );
ADDRLP4 0
ARGP4
ADDRGP4 $551
ARGP4
ADDRLP4 20676
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 20676
INDIRP4
ASGNP4
line 1349
;1349:	client->pers.cmdTimeNudge = atoi( s );
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 20680
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 20680
INDIRI4
ASGNI4
line 1352
;1350:
;1351:	// set name
;1352:	Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 1036
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1353
;1353:	s = Info_ValueForKey (userinfo, "name");
ADDRLP4 0
ARGP4
ADDRGP4 $552
ARGP4
ADDRLP4 20684
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 20684
INDIRP4
ASGNP4
line 1354
;1354:	ClientCleanName( s, client->pers.netname, sizeof(client->pers.netname), clientNum );
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientCleanName
CALLV
pop
line 1357
;1355:
;1356:    //KK-OAPub Added From Tremulous-Control Name Changes
;1357:    if( strcmp( oldname, client->pers.netname ) )
ADDRLP4 1036
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 20688
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20688
INDIRI4
CNSTI4 0
EQI4 $553
line 1358
;1358:    {
line 1359
;1359:        if( client->pers.nameChangeTime &&
ADDRLP4 20692
ADDRLP4 1024
INDIRP4
CNSTI4 1020
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20692
INDIRI4
CNSTI4 0
EQI4 $555
ADDRGP4 level+32
INDIRI4
ADDRLP4 20692
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
ADDRGP4 g_minNameChangePeriod+8
INDIRF4
MULF4
GTF4 $555
line 1362
;1360:            ( level.time - client->pers.nameChangeTime )
;1361:            <= ( g_minNameChangePeriod.value * 1000 ) )
;1362:        {
line 1363
;1363:            trap_SendServerCommand( ent - g_entities, va(
ADDRGP4 $559
ARGP4
ADDRGP4 g_minNameChangePeriod+12
INDIRI4
ARGI4
ADDRLP4 20696
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 20696
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1366
;1364:            "print \"Name change spam protection (g_minNameChangePeriod = %d)\n\"",
;1365:            g_minNameChangePeriod.integer ) );
;1366:            revertName = qtrue;
ADDRLP4 3216
CNSTI4 1
ASGNI4
line 1367
;1367:        }
ADDRGP4 $556
JUMPV
LABELV $555
line 1368
;1368:        else if( g_maxNameChanges.integer > 0
ADDRGP4 g_maxNameChanges+12
INDIRI4
CNSTI4 0
LEI4 $561
ADDRLP4 1024
INDIRP4
CNSTI4 1024
ADDP4
INDIRI4
ADDRGP4 g_maxNameChanges+12
INDIRI4
LTI4 $561
line 1370
;1369:            && client->pers.nameChanges >= g_maxNameChanges.integer  )
;1370:        {
line 1371
;1371:            trap_SendServerCommand( ent - g_entities, va(
ADDRGP4 $565
ARGP4
ADDRGP4 g_maxNameChanges+12
INDIRI4
ARGI4
ADDRLP4 20696
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 20696
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1374
;1372:                "print \"Maximum name changes reached (g_maxNameChanges = %d)\n\"",
;1373:                g_maxNameChanges.integer ) );
;1374:            revertName = qtrue;
ADDRLP4 3216
CNSTI4 1
ASGNI4
line 1375
;1375:        }
ADDRGP4 $562
JUMPV
LABELV $561
line 1376
;1376:        else if( client->pers.muted )
ADDRLP4 1024
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $567
line 1377
;1377:        {
line 1378
;1378:            trap_SendServerCommand( ent - g_entities,
ADDRLP4 1032
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRGP4 $569
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1380
;1379:                "print \"You cannot change your name while you are muted\n\"" );
;1380:            revertName = qtrue;
ADDRLP4 3216
CNSTI4 1
ASGNI4
line 1381
;1381:        }
ADDRGP4 $568
JUMPV
LABELV $567
line 1382
;1382:        else if( !G_admin_name_check( ent, client->pers.netname, err, sizeof( err ) ) )
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 19624
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 20696
ADDRGP4 G_admin_name_check
CALLI4
ASGNI4
ADDRLP4 20696
INDIRI4
CNSTI4 0
NEI4 $570
line 1383
;1383:        {
line 1384
;1384:            trap_SendServerCommand( ent - g_entities, va( "print \"%s\n\"", err ) );
ADDRGP4 $572
ARGP4
ADDRLP4 19624
ARGP4
ADDRLP4 20700
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 20700
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1385
;1385:            revertName = qtrue;
ADDRLP4 3216
CNSTI4 1
ASGNI4
line 1386
;1386:        }
LABELV $570
LABELV $568
LABELV $562
LABELV $556
line 1389
;1387:
;1388:        //Never revert a bots name... just to bad if it hapens... but the bot will always be expendeble :-)
;1389:        if (ent->r.svFlags & SVF_BOT)
ADDRLP4 1032
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $573
line 1390
;1390:            revertName = qfalse;
ADDRLP4 3216
CNSTI4 0
ASGNI4
LABELV $573
line 1392
;1391:
;1392:        if( revertName )
ADDRLP4 3216
INDIRI4
CNSTI4 0
EQI4 $575
line 1393
;1393:        {
line 1394
;1394:            Q_strncpyz( client->pers.netname, *oldname ? oldname : "UnnamedPlayer",
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 1036
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $579
ADDRLP4 20700
ADDRLP4 1036
ASGNP4
ADDRGP4 $580
JUMPV
LABELV $579
ADDRLP4 20700
ADDRGP4 $577
ASGNP4
LABELV $580
ADDRLP4 20700
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1396
;1395:                sizeof( client->pers.netname ) );
;1396:            Info_SetValueForKey( userinfo, "name", oldname );
ADDRLP4 0
ARGP4
ADDRGP4 $552
ARGP4
ADDRLP4 1036
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1397
;1397:            trap_SetUserinfo( clientNum, userinfo );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 1398
;1398:        }
ADDRGP4 $576
JUMPV
LABELV $575
line 1400
;1399:        else
;1400:        {
line 1401
;1401:            if( client->pers.connected == CON_CONNECTED )
ADDRLP4 1024
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $581
line 1402
;1402:            {
line 1403
;1403:                client->pers.nameChangeTime = level.time;
ADDRLP4 1024
INDIRP4
CNSTI4 1020
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1404
;1404:                client->pers.nameChanges++;
ADDRLP4 20700
ADDRLP4 1024
INDIRP4
CNSTI4 1024
ADDP4
ASGNP4
ADDRLP4 20700
INDIRP4
ADDRLP4 20700
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1405
;1405:            }
LABELV $581
line 1406
;1406:        }
LABELV $576
line 1407
;1407:    }
LABELV $553
line 1410
;1408:
;1409://ArenaScript
;1410:ent->playername = ent->client->pers.netname;
ADDRLP4 1032
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 1032
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
line 1411
;1411:ent->maxHealth = ent->client->pers.maxHealth;
ADDRLP4 1032
INDIRP4
CNSTI4 696
ADDP4
ADDRLP4 1032
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
line 1412
;1412:ent->playerTeam = ent->client->sess.sessionTeam;
ADDRLP4 1032
INDIRP4
CNSTI4 700
ADDP4
ADDRLP4 1032
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 1414
;1413:
;1414:ent->tool_id = atoi( Info_ValueForKey( userinfo, "toolgun_tool" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $584
ARGP4
ADDRLP4 20704
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20704
INDIRP4
ARGP4
ADDRLP4 20708
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
INDIRP4
CNSTI4 1032
ADDP4
ADDRLP4 20708
INDIRI4
ASGNI4
line 1416
;1415:
;1416:if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $585
line 1417
;1417:botskill = atoi( Info_ValueForKey( userinfo, "skill" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $587
ARGP4
ADDRLP4 20712
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20712
INDIRP4
ARGP4
ADDRLP4 20716
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 19620
ADDRLP4 20716
INDIRI4
ASGNI4
line 1418
;1418:ent->botskill = botskill;
ADDRLP4 1032
INDIRP4
CNSTI4 1040
ADDP4
ADDRLP4 19620
INDIRI4
ASGNI4
line 1419
;1419:singlebot = atoi( Info_ValueForKey( userinfo, "singlebot" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $588
ARGP4
ADDRLP4 20720
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20720
INDIRP4
ARGP4
ADDRLP4 20724
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 19616
ADDRLP4 20724
INDIRI4
ASGNI4
line 1420
;1420:ent->singlebot = singlebot;
ADDRLP4 1032
INDIRP4
CNSTI4 1028
ADDP4
ADDRLP4 19616
INDIRI4
ASGNI4
line 1421
;1421:if(ent->singlebot){
ADDRLP4 1032
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $589
line 1422
;1422:if(!G_NpcFactionProp(NP_PICKUP, ent)){
CNSTI4 8
ARGI4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 20728
ADDRGP4 G_NpcFactionProp
CALLI4
ASGNI4
ADDRLP4 20728
INDIRI4
CNSTI4 0
NEI4 $591
line 1423
;1423:ent->client->ps.stats[STAT_NO_PICKUP] = 1;
ADDRLP4 1032
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 1
ASGNI4
line 1424
;1424:ent->wait_to_pickup = 100000000;
ADDRLP4 1032
INDIRP4
CNSTI4 1024
ADDP4
CNSTI4 100000000
ASGNI4
line 1425
;1425:}}
LABELV $591
LABELV $589
line 1426
;1426:}
LABELV $585
line 1434
;1427:
;1428:	// N_G: this condition makes no sense to me and I'm not going to
;1429:	// try finding out what it means, I've added parentheses according to
;1430:	// evaluation rules of the original code so grab a
;1431:	// parentheses pairing highlighting text editor and see for yourself
;1432:	// if you got it right
;1433:	//Sago: One redundant check and CTF Elim and LMS was missing. Not an important function and I might never have noticed, should properly be ||
;1434:	if ( ( ( client->sess.sessionTeam == TEAM_SPECTATOR ) ||
ADDRLP4 1024
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $600
ADDRLP4 1024
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $593
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $600
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $600
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $593
LABELV $600
ADDRLP4 1024
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 3
NEI4 $593
line 1438
;1435:		( ( ( client->isEliminated ) /*||
;1436:		( client->ps.pm_type == PM_SPECTATOR )*/ ) &&   //Sago: If this is true client.isEliminated or TEAM_SPECTATOR is true to and this is redundant
;1437:		( g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION || g_gametype.integer == GT_LMS) ) ) &&
;1438:		( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) ) {
line 1440
;1439:
;1440:		Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 $601
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1441
;1441:	}
LABELV $593
line 1443
;1442:
;1443:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 1024
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $602
line 1444
;1444:		if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 1036
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 20716
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20716
INDIRI4
CNSTI4 0
EQI4 $604
line 1445
;1445:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname,
ADDRGP4 $606
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 20720
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 20720
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1447
;1446:				client->pers.netname) );
;1447:		}
LABELV $604
line 1448
;1448:	}
LABELV $602
line 1451
;1449:
;1450:	// set max health
;1451:	if (client->ps.powerups[PW_GUARD]) {
ADDRLP4 1024
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $607
line 1452
;1452:		client->pers.maxHealth = 200*g_guardhealthmodifier.value;
ADDRLP4 1024
INDIRP4
CNSTI4 552
ADDP4
CNSTF4 1128792064
ADDRGP4 g_guardhealthmodifier+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1453
;1453:	} else {
ADDRGP4 $608
JUMPV
LABELV $607
line 1454
;1454:		health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $610
ARGP4
ADDRLP4 20716
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20716
INDIRP4
ARGP4
ADDRLP4 20720
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 19612
ADDRLP4 20720
INDIRI4
ASGNI4
line 1455
;1455:		client->pers.maxHealth = health;
ADDRLP4 1024
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 19612
INDIRI4
ASGNI4
line 1456
;1456:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 20724
ADDRLP4 1024
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20724
INDIRI4
CNSTI4 1
LTI4 $613
ADDRLP4 20724
INDIRI4
CNSTI4 100
LEI4 $611
LABELV $613
line 1457
;1457:			client->pers.maxHealth = 100;
ADDRLP4 1024
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 100
ASGNI4
line 1458
;1458:		}
LABELV $611
line 1459
;1459:	}
LABELV $608
line 1460
;1460:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 1024
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 1024
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
line 1463
;1461:
;1462:	// set model
;1463:	if( g_gametype.integer >= GT_TEAM && g_ffa_gt==0) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $614
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 0
NEI4 $614
line 1464
;1464:		Q_strncpyz( model, Info_ValueForKey (userinfo, "team_model"), sizeof( model ) );
ADDRLP4 0
ARGP4
ADDRGP4 $617
ARGP4
ADDRLP4 20720
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2060
ARGP4
ADDRLP4 20720
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1465
;1465:		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "team_headmodel"), sizeof( headModel ) );
ADDRLP4 0
ARGP4
ADDRGP4 $618
ARGP4
ADDRLP4 20724
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2124
ARGP4
ADDRLP4 20724
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1466
;1466:		strcpy(redTeam, Info_ValueForKey( userinfo, "team_legsskin" ));
ADDRLP4 0
ARGP4
ADDRGP4 $619
ARGP4
ADDRLP4 20728
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2192
ARGP4
ADDRLP4 20728
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1467
;1467:	} else {
ADDRGP4 $615
JUMPV
LABELV $614
line 1468
;1468:		Q_strncpyz( model, Info_ValueForKey (userinfo, "model"), sizeof( model ) );
ADDRLP4 0
ARGP4
ADDRGP4 $620
ARGP4
ADDRLP4 20720
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2060
ARGP4
ADDRLP4 20720
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1469
;1469:		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "headmodel"), sizeof( headModel ) );
ADDRLP4 0
ARGP4
ADDRGP4 $621
ARGP4
ADDRLP4 20724
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2124
ARGP4
ADDRLP4 20724
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1470
;1470:		strcpy(redTeam, Info_ValueForKey( userinfo, "legsskin" ));
ADDRLP4 0
ARGP4
ADDRGP4 $622
ARGP4
ADDRLP4 20728
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2192
ARGP4
ADDRLP4 20728
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1471
;1471:	}
LABELV $615
line 1473
;1472:	
;1473:if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $623
line 1474
;1474:	if( g_gametype.integer >= GT_TEAM && g_ffa_gt==0) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $625
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 0
NEI4 $625
line 1475
;1475:		strcpy(redTeam, Info_ValueForKey( userinfo, "team_model" ));
ADDRLP4 0
ARGP4
ADDRGP4 $617
ARGP4
ADDRLP4 20720
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2192
ARGP4
ADDRLP4 20720
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1476
;1476:	} else {
ADDRGP4 $626
JUMPV
LABELV $625
line 1477
;1477:		strcpy(redTeam, Info_ValueForKey( userinfo, "model" ));
ADDRLP4 0
ARGP4
ADDRGP4 $620
ARGP4
ADDRLP4 20720
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2192
ARGP4
ADDRLP4 20720
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1478
;1478:	}	
LABELV $626
line 1479
;1479:}
LABELV $623
line 1482
;1480:
;1481:	// bots set their team a few frames later
;1482:	if (g_gametype.integer >= GT_TEAM && g_ffa_gt==0 && g_entities[clientNum].r.svFlags & SVF_BOT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $628
ADDRLP4 20720
CNSTI4 0
ASGNI4
ADDRGP4 g_ffa_gt
INDIRI4
ADDRLP4 20720
INDIRI4
NEI4 $628
CNSTI4 2492
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 20720
INDIRI4
EQI4 $628
line 1483
;1483:		s = Info_ValueForKey( userinfo, "team" );
ADDRLP4 0
ARGP4
ADDRGP4 $633
ARGP4
ADDRLP4 20724
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 20724
INDIRP4
ASGNP4
line 1484
;1484:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $636
ARGP4
ADDRLP4 20728
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20728
INDIRI4
CNSTI4 0
EQI4 $638
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $637
ARGP4
ADDRLP4 20732
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20732
INDIRI4
CNSTI4 0
NEI4 $634
LABELV $638
line 1485
;1485:			team = TEAM_RED;
ADDRLP4 2188
CNSTI4 1
ASGNI4
line 1486
;1486:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $635
JUMPV
LABELV $634
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $641
ARGP4
ADDRLP4 20736
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20736
INDIRI4
CNSTI4 0
EQI4 $643
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $642
ARGP4
ADDRLP4 20740
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20740
INDIRI4
CNSTI4 0
NEI4 $639
LABELV $643
line 1487
;1487:			team = TEAM_BLUE;
ADDRLP4 2188
CNSTI4 2
ASGNI4
line 1488
;1488:		} else {
ADDRGP4 $640
JUMPV
LABELV $639
line 1490
;1489:			// pick the team with the least number of players
;1490:			team = PickTeam( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20744
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 2188
ADDRLP4 20744
INDIRI4
ASGNI4
line 1491
;1491:		}
LABELV $640
LABELV $635
line 1492
;1492:                client->sess.sessionTeam = team;
ADDRLP4 1024
INDIRP4
CNSTI4 1032
ADDP4
ADDRLP4 2188
INDIRI4
ASGNI4
line 1493
;1493:	}
ADDRGP4 $629
JUMPV
LABELV $628
line 1494
;1494:	else {
line 1495
;1495:		team = client->sess.sessionTeam;
ADDRLP4 2188
ADDRLP4 1024
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 1496
;1496:	}
LABELV $629
line 1498
;1497:
;1498:	if (g_gametype.integer >= GT_TEAM && g_ffa_gt!=1) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $644
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
EQI4 $644
line 1499
;1499:		client->pers.teamInfo = qtrue;
ADDRLP4 1024
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 1
ASGNI4
line 1500
;1500:	} else {
ADDRGP4 $645
JUMPV
LABELV $644
line 1501
;1501:		s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 0
ARGP4
ADDRGP4 $647
ARGP4
ADDRLP4 20724
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 20724
INDIRP4
ASGNP4
line 1502
;1502:		if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $650
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 20732
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20732
INDIRI4
CNSTI4 0
EQI4 $648
LABELV $650
line 1503
;1503:			client->pers.teamInfo = qtrue;
ADDRLP4 1024
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 1
ASGNI4
line 1504
;1504:		} else {
ADDRGP4 $649
JUMPV
LABELV $648
line 1505
;1505:			client->pers.teamInfo = qfalse;
ADDRLP4 1024
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1506
;1506:		}
LABELV $649
line 1507
;1507:	}
LABELV $645
line 1510
;1508:
;1509:	// team task (0 = none, 1 = offence, 2 = defence)
;1510:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 0
ARGP4
ADDRGP4 $651
ARGP4
ADDRLP4 20724
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20724
INDIRP4
ARGP4
ADDRLP4 20728
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3220
ADDRLP4 20728
INDIRI4
ASGNI4
line 1512
;1511:	// team Leader (1 = leader, 0 is normal player)
;1512:	teamLeader = client->sess.teamLeader;
ADDRLP4 3224
ADDRLP4 1024
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
ASGNI4
line 1515
;1513:
;1514:	// colors
;1515:        if( g_gametype.integer >= GT_TEAM && g_ffa_gt==0 && g_instantgib.integer) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $652
ADDRLP4 20732
CNSTI4 0
ASGNI4
ADDRGP4 g_ffa_gt
INDIRI4
ADDRLP4 20732
INDIRI4
NEI4 $652
ADDRGP4 g_instantgib+12
INDIRI4
ADDRLP4 20732
INDIRI4
EQI4 $652
line 1516
;1516:            switch(team) {
ADDRLP4 20736
ADDRLP4 2188
INDIRI4
ASGNI4
ADDRLP4 20736
INDIRI4
CNSTI4 1
EQI4 $658
ADDRLP4 20736
INDIRI4
CNSTI4 2
EQI4 $661
ADDRGP4 $653
JUMPV
LABELV $658
line 1518
;1517:                case TEAM_RED:
;1518:                    c1[0] = COLOR_BLUE;
ADDRLP4 4252
CNSTI1 52
ASGNI1
line 1519
;1519:                    c2[0] = COLOR_BLUE;
ADDRLP4 5276
CNSTI1 52
ASGNI1
line 1520
;1520:                    c1[1] = 0;
ADDRLP4 4252+1
CNSTI1 0
ASGNI1
line 1521
;1521:                    c2[1] = 0;
ADDRLP4 5276+1
CNSTI1 0
ASGNI1
line 1522
;1522:                    break;
ADDRGP4 $653
JUMPV
LABELV $661
line 1524
;1523:                case TEAM_BLUE:
;1524:                    c1[0] = COLOR_RED;
ADDRLP4 4252
CNSTI1 49
ASGNI1
line 1525
;1525:                    c2[0] = COLOR_RED;
ADDRLP4 5276
CNSTI1 49
ASGNI1
line 1526
;1526:                    c1[1] = 0;
ADDRLP4 4252+1
CNSTI1 0
ASGNI1
line 1527
;1527:                    c2[1] = 0;
ADDRLP4 5276+1
CNSTI1 0
ASGNI1
line 1528
;1528:                    break;
line 1530
;1529:                default:
;1530:                    break;
line 1532
;1531:            }
;1532:        } else {
ADDRGP4 $653
JUMPV
LABELV $652
line 1533
;1533:            strcpy(c1, Info_ValueForKey( userinfo, "color1" ));
ADDRLP4 0
ARGP4
ADDRGP4 $664
ARGP4
ADDRLP4 20736
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4252
ARGP4
ADDRLP4 20736
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1534
;1534:            strcpy(c2, Info_ValueForKey( userinfo, "color2" ));
ADDRLP4 0
ARGP4
ADDRGP4 $665
ARGP4
ADDRLP4 20740
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 5276
ARGP4
ADDRLP4 20740
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1535
;1535:        }
LABELV $653
line 1537
;1536:
;1537:	strcpy(pligred, Info_ValueForKey( userinfo, "cg_plightred" ));
ADDRLP4 0
ARGP4
ADDRGP4 $666
ARGP4
ADDRLP4 20736
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12444
ARGP4
ADDRLP4 20736
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1538
;1538:	strcpy(pliggreen, Info_ValueForKey( userinfo, "cg_plightgreen" ));
ADDRLP4 0
ARGP4
ADDRGP4 $667
ARGP4
ADDRLP4 20740
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 13468
ARGP4
ADDRLP4 20740
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1539
;1539:	strcpy(pligblue, Info_ValueForKey( userinfo, "cg_plightblue" ));
ADDRLP4 0
ARGP4
ADDRGP4 $668
ARGP4
ADDRLP4 20744
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 14492
ARGP4
ADDRLP4 20744
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1540
;1540:	strcpy(toligred, Info_ValueForKey( userinfo, "cg_tolightred" ));
ADDRLP4 0
ARGP4
ADDRGP4 $669
ARGP4
ADDRLP4 20748
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 9372
ARGP4
ADDRLP4 20748
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1541
;1541:	strcpy(toliggreen, Info_ValueForKey( userinfo, "cg_tolightgreen" ));
ADDRLP4 0
ARGP4
ADDRGP4 $670
ARGP4
ADDRLP4 20752
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 10396
ARGP4
ADDRLP4 20752
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1542
;1542:	strcpy(toligblue, Info_ValueForKey( userinfo, "cg_tolightblue" ));
ADDRLP4 0
ARGP4
ADDRGP4 $671
ARGP4
ADDRLP4 20756
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 11420
ARGP4
ADDRLP4 20756
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1543
;1543:	strcpy(heligred, Info_ValueForKey( userinfo, "cg_helightred" ));
ADDRLP4 0
ARGP4
ADDRGP4 $672
ARGP4
ADDRLP4 20760
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6300
ARGP4
ADDRLP4 20760
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1544
;1544:	strcpy(heliggreen, Info_ValueForKey( userinfo, "cg_helightgreen" ));
ADDRLP4 0
ARGP4
ADDRGP4 $673
ARGP4
ADDRLP4 20764
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 7324
ARGP4
ADDRLP4 20764
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1545
;1545:	strcpy(heligblue, Info_ValueForKey( userinfo, "cg_helightblue" ));
ADDRLP4 0
ARGP4
ADDRGP4 $674
ARGP4
ADDRLP4 20768
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8348
ARGP4
ADDRLP4 20768
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1546
;1546:	strcpy(pgred, Info_ValueForKey( userinfo, "cg_crosshairColorRed" ));
ADDRLP4 0
ARGP4
ADDRGP4 $675
ARGP4
ADDRLP4 20772
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 15516
ARGP4
ADDRLP4 20772
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1547
;1547:	strcpy(pggreen, Info_ValueForKey( userinfo, "cg_crosshairColorGreen" ));
ADDRLP4 0
ARGP4
ADDRGP4 $676
ARGP4
ADDRLP4 20776
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16540
ARGP4
ADDRLP4 20776
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1548
;1548:	strcpy(pgblue, Info_ValueForKey( userinfo, "cg_crosshairColorBlue" ));
ADDRLP4 0
ARGP4
ADDRGP4 $677
ARGP4
ADDRLP4 20780
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 17564
ARGP4
ADDRLP4 20780
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1549
;1549:	strcpy(swep_id, va("%i", ent->swep_id));
ADDRGP4 $328
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 2444
ADDP4
INDIRI4
ARGI4
ADDRLP4 20784
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 18588
ARGP4
ADDRLP4 20784
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1550
;1550:	strcpy(blueTeam, Info_ValueForKey( userinfo, "g_blueteam" ));
ADDRLP4 0
ARGP4
ADDRGP4 $678
ARGP4
ADDRLP4 20788
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3228
ARGP4
ADDRLP4 20788
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1552
;1551:
;1552:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $679
line 1553
;1553:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\g_redteam\\%s\\g_blueteam\\%s\\vn\\%i\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 0
ARGP4
ADDRGP4 $587
ARGP4
ADDRLP4 20792
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $681
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2188
INDIRI4
ARGI4
ADDRLP4 2060
ARGP4
ADDRLP4 2124
ARGP4
ADDRLP4 2192
ARGP4
ADDRLP4 3228
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ARGI4
ADDRLP4 4252
ARGP4
ADDRLP4 5276
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
ARGI4
ADDRLP4 20792
INDIRP4
ARGP4
ADDRLP4 3220
INDIRI4
ARGI4
ADDRLP4 3224
INDIRI4
ARGI4
ADDRLP4 20800
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 20800
INDIRP4
ASGNP4
line 1557
;1554:			client->pers.netname, team, model, headModel, redTeam, blueTeam, client->vehiclenum, c1, c2,
;1555:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;1556:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;1557:	} else {
ADDRGP4 $680
JUMPV
LABELV $679
line 1558
;1558:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\g_redteam\\%s\\g_blueteam\\%s\\hr\\%s\\hg\\%s\\hb\\%s\\tr\\%s\\tg\\%s\\tb\\%s\\pr\\%s\\pg\\%s\\pb\\%s\\pg_r\\%s\\pg_g\\%s\\pg_b\\%s\\si\\%s\\vn\\%i\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
ADDRGP4 $682
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 2060
ARGP4
ADDRLP4 2124
ARGP4
ADDRLP4 2192
ARGP4
ADDRLP4 3228
ARGP4
ADDRLP4 6300
ARGP4
ADDRLP4 7324
ARGP4
ADDRLP4 8348
ARGP4
ADDRLP4 9372
ARGP4
ADDRLP4 10396
ARGP4
ADDRLP4 11420
ARGP4
ADDRLP4 12444
ARGP4
ADDRLP4 13468
ARGP4
ADDRLP4 14492
ARGP4
ADDRLP4 15516
ARGP4
ADDRLP4 16540
ARGP4
ADDRLP4 17564
ARGP4
ADDRLP4 18588
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ARGI4
ADDRLP4 4252
ARGP4
ADDRLP4 5276
ARGP4
ADDRLP4 1024
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 1048
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
ARGI4
ADDRLP4 3220
INDIRI4
ARGI4
ADDRLP4 3224
INDIRI4
ARGI4
ADDRLP4 20796
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 20796
INDIRP4
ASGNP4
line 1561
;1559:			client->pers.netname, client->sess.sessionTeam, model, headModel, redTeam, blueTeam, heligred, heliggreen, heligblue, toligred, toliggreen, toligblue, pligred, pliggreen, pligblue, pgred, pggreen, pgblue, swep_id, client->vehiclenum, c1, c2,
;1560:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader);
;1561:	}
LABELV $680
line 1563
;1562:
;1563:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1565
;1564:
;1565:	G_LogPrintf( "ClientUserinfoChanged: %i %s\\id\\%s\n", clientNum, s, Info_ValueForKey(userinfo, "cl_guid") );
ADDRLP4 0
ARGP4
ADDRGP4 $684
ARGP4
ADDRLP4 20792
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $683
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 20792
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1566
;1566:}
LABELV $537
endproc ClientUserinfoChanged 20804 112
lit
align 1
LABELV $686
byte 1 0
skip 1023
export ClientConnect
code
proc ClientConnect 2140 12
line 1589
;1567:
;1568:
;1569:/*
;1570:===========
;1571:ClientConnect
;1572:
;1573:Called when a player begins connecting to the server.
;1574:Called again for every map change or tournement restart.
;1575:
;1576:The session information will be valid after exit.
;1577:
;1578:Return NULL if the client should be allowed, otherwise return
;1579:a string with the reason for denial.
;1580:
;1581:Otherwise, the client will be sent the current gamestate
;1582:and will eventually get to ClientBegin.
;1583:
;1584:firstTime will be qtrue the very first time a client connects
;1585:to the server machine, but qfalse on map changes and tournement
;1586:restarts.
;1587:============
;1588:*/
;1589:char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 1595
;1590:	char		*value;
;1591://	char		*areabits;
;1592:	gclient_t	*client;
;1593:	char		userinfo[MAX_INFO_STRING];
;1594:	gentity_t	*ent;
;1595:	char        reason[ MAX_STRING_CHARS ] = {""};
ADDRLP4 1040
ADDRGP4 $686
INDIRB
ASGNB 1024
line 1604
;1596:	int         i;
;1597:	int icount;
;1598:	gentity_t		*entscr;
;1599:
;1600:	/*if ( !isBot && level.player )
;1601:		return "Server is running a single player gametype.";*/
;1602:
;1603:    //KK-OAX I moved these up so userinfo could be assigned/used.
;1604:	ent = &g_entities[ clientNum ];
ADDRLP4 12
CNSTI4 2492
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1605
;1605:	client = &level.clients[ clientNum ];
ADDRLP4 4
CNSTI4 2324
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1606
;1606:	ent->client = client;
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1607
;1607:	memset( client, 0, sizeof(*client) );
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2324
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1609
;1608:
;1609:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1611
;1610:
;1611: 	value = Info_ValueForKey( userinfo, "cl_guid" );
ADDRLP4 16
ARGP4
ADDRGP4 $684
ARGP4
ADDRLP4 2072
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 2072
INDIRP4
ASGNP4
line 1612
;1612: 	Q_strncpyz( client->pers.guid, value, sizeof( client->pers.guid ) );
ADDRLP4 4
INDIRP4
CNSTI4 920
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1619
;1613:
;1614:
;1615: 	// IP filtering //KK-OAX Has this been obsoleted?
;1616: 	// https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=500
;1617: 	// recommanding PB based IP / GUID banning, the builtin system is pretty limited
;1618: 	// check to see if they are on the banned IP list
;1619:	value = Info_ValueForKey (userinfo, "ip");
ADDRLP4 16
ARGP4
ADDRGP4 $541
ARGP4
ADDRLP4 2076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 2076
INDIRP4
ASGNP4
line 1620
;1620:	Q_strncpyz( client->pers.ip, value, sizeof( client->pers.ip ) );
ADDRLP4 4
INDIRP4
CNSTI4 953
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1622
;1621:
;1622:	if ( G_FilterPacket( value ) && !Q_stricmp(value,"localhost") ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
EQI4 $687
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $687
line 1623
;1623:            G_Printf("Player with IP: %s is banned\n",value);
ADDRGP4 $689
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1624
;1624:		return "You are banned from this server.";
ADDRGP4 $690
RETP4
ADDRGP4 $685
JUMPV
LABELV $687
line 1627
;1625:	}
;1626:
;1627:    if( G_admin_ban_check( userinfo, reason, sizeof( reason ) ) ) {
ADDRLP4 16
ARGP4
ADDRLP4 1040
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2088
ADDRGP4 G_admin_ban_check
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
EQI4 $691
line 1628
;1628: 	    return va( "%s", reason );
ADDRGP4 $693
ARGP4
ADDRLP4 1040
ARGP4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2092
INDIRP4
RETP4
ADDRGP4 $685
JUMPV
LABELV $691
line 1635
;1629: 	}
;1630:
;1631:  //KK-OAX
;1632:  // we don't check GUID or password for bots and local client
;1633:  // NOTE: local client <-> "ip" "localhost"
;1634:  //   this means this client is not running in our current process
;1635:	if ( !isBot && (strcmp(value, "localhost") != 0)) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $694
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 2092
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
EQI4 $694
line 1637
;1636:		// check for a password
;1637:		value = Info_ValueForKey (userinfo, "password");
ADDRLP4 16
ARGP4
ADDRGP4 $696
ARGP4
ADDRLP4 2096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 2096
INDIRP4
ASGNP4
line 1638
;1638:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $697
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $701
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
EQI4 $697
ADDRGP4 g_password+16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 2104
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
EQI4 $697
line 1639
;1639:			strcmp( g_password.string, value) != 0) {
line 1640
;1640:			return "Invalid password";
ADDRGP4 $703
RETP4
ADDRGP4 $685
JUMPV
LABELV $697
line 1642
;1641:		}
;1642:		for( i = 0; i < sizeof( client->pers.guid ) - 1 &&
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $707
JUMPV
LABELV $704
line 1643
;1643:		    isxdigit( client->pers.guid[ i ] ); i++ );
LABELV $705
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $707
line 1642
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32
GEU4 $712
ADDRLP4 2112
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 920
ADDP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 48
LTI4 $709
ADDRLP4 2112
INDIRI4
CNSTI4 57
LEI4 $704
LABELV $709
ADDRLP4 2116
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 920
ADDP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2116
INDIRI4
CNSTI4 65
LTI4 $710
ADDRLP4 2116
INDIRI4
CNSTI4 70
LEI4 $704
LABELV $710
ADDRLP4 2120
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 920
ADDP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2120
INDIRI4
CNSTI4 48
LTI4 $711
ADDRLP4 2120
INDIRI4
CNSTI4 57
LEI4 $704
LABELV $711
ADDRLP4 2124
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 920
ADDP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2124
INDIRI4
CNSTI4 97
LTI4 $712
ADDRLP4 2124
INDIRI4
CNSTI4 102
LEI4 $704
LABELV $712
line 1644
;1644:		if( i < sizeof( client->pers.guid ) - 1 )
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32
GEU4 $713
line 1645
;1645:		    return "Invalid GUID";
ADDRGP4 $715
RETP4
ADDRGP4 $685
JUMPV
LABELV $713
line 1647
;1646:
;1647:		for( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $719
JUMPV
LABELV $716
line 1649
;1648:
;1649:		    if( level.clients[ i ].pers.connected == CON_DISCONNECTED )
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $721
line 1650
;1650:		        continue;
ADDRGP4 $717
JUMPV
LABELV $721
line 1652
;1651:
;1652:		    if( !Q_stricmp( client->pers.guid, level.clients[ i ].pers.guid ) ) {
ADDRLP4 2128
CNSTI4 920
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 2128
INDIRI4
ADDP4
ARGP4
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ADDRLP4 2128
INDIRI4
ADDP4
ARGP4
ADDRLP4 2132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2132
INDIRI4
CNSTI4 0
NEI4 $723
line 1653
;1653:		        if( !G_ClientIsLagging( level.clients + i ) ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRLP4 2136
ADDRGP4 G_ClientIsLagging
CALLI4
ASGNI4
ADDRLP4 2136
INDIRI4
CNSTI4 0
NEI4 $725
line 1656
;1654:		            //trap_SendServerCommand( i, "cp \"Your GUID is not secure\"" );
;1655:		                //return "Duplicate GUID";
;1656:		        }
LABELV $725
line 1658
;1657:		        //trap_DropClient( i, "Ghost" );
;1658:		    }
LABELV $723
line 1659
;1659:		}
LABELV $717
line 1647
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $719
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $716
line 1661
;1660:
;1661:	}
LABELV $694
line 1664
;1662:
;1663:    //Check for local client
;1664:    if( !strcmp( client->pers.ip, "localhost" ) )
ADDRLP4 4
INDIRP4
CNSTI4 953
ADDP4
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 2096
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $727
line 1665
;1665:        client->pers.localClient = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
LABELV $727
line 1666
;1666:        client->pers.adminLevel = G_admin_level( ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 2100
ADDRGP4 G_admin_level
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1008
ADDP4
ADDRLP4 2100
INDIRI4
ASGNI4
line 1668
;1667:
;1668:	client->pers.connected = CON_CONNECTING;
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 1
ASGNI4
line 1671
;1669:
;1670:	// read or initialize the session data
;1671:	if(g_gametype.integer != GT_SINGLE){
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $729
line 1672
;1672:	if ( firstTime || level.newSession ) {
ADDRLP4 2104
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 2104
INDIRI4
NEI4 $735
ADDRGP4 level+64
INDIRI4
ADDRLP4 2104
INDIRI4
EQI4 $732
LABELV $735
line 1673
;1673:		G_InitSessionData( client, userinfo );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_InitSessionData
CALLV
pop
line 1674
;1674:	}
LABELV $732
line 1675
;1675:	}
LABELV $729
line 1676
;1676:	G_ReadSessionData( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 1678
;1677:
;1678:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $736
line 1679
;1679:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 2104
ADDRLP4 12
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 2104
INDIRP4
ADDRLP4 2104
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1680
;1680:		ent->inuse = qtrue;
ADDRLP4 12
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 1681
;1681:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $741
ADDRLP4 2108
CNSTI4 1
ASGNI4
ADDRGP4 $742
JUMPV
LABELV $741
ADDRLP4 2108
CNSTI4 0
ASGNI4
LABELV $742
ADDRLP4 2108
INDIRI4
ARGI4
ADDRLP4 2112
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $738
line 1682
;1682:			return "BotConnectfailed";
ADDRGP4 $743
RETP4
ADDRGP4 $685
JUMPV
LABELV $738
line 1686
;1683:		}
;1684:
;1685:		//link the bot to the target_botspawn entity. For this we abuse the parent property.
;1686:		if(ent){
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $744
line 1687
;1687:		LinkBotSpawnEntity( ent, Info_ValueForKey (userinfo, "parentid") );
ADDRLP4 16
ARGP4
ADDRGP4 $746
ARGP4
ADDRLP4 2116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 2116
INDIRP4
ARGP4
ADDRGP4 LinkBotSpawnEntity
CALLV
pop
line 1688
;1688:		}
LABELV $744
line 1689
;1689:	}
LABELV $736
line 1693
;1690:
;1691:	//KK-OAX Swapped these in order...seemed to help the connection process.
;1692:	// get and distribute relevent paramters
;1693:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1694
;1694:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $747
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1698
;1695:
;1696:
;1697:	// don't do the "xxx connected" messages if they were caried over from previous level
;1698:	if ( firstTime && ( !ent->singlebot )) {
ADDRLP4 2104
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 2104
INDIRI4
EQI4 $748
ADDRLP4 12
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRLP4 2104
INDIRI4
NEI4 $748
line 1699
;1699:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname) );
ADDRGP4 $750
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2108
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1700
;1700:	}
LABELV $748
line 1702
;1701:
;1702:	if ( g_gametype.integer >= GT_TEAM &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $751
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $751
line 1703
;1703:		client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1704
;1704:		BroadcastTeamChange( client, -1 );
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1705
;1705:	}
LABELV $751
line 1708
;1706:
;1707:	// count current clients and rank for scoreboard
;1708:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1714
;1709:
;1710:	// for statistics
;1711://	client->areabits = areabits;
;1712://	if ( !client->areabits )
;1713://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;1714:	if ( !isBot && !level.player ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $754
ADDRGP4 level+10284
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $754
line 1715
;1715:		level.player = ent;
ADDRGP4 level+10284
ADDRLP4 12
INDIRP4
ASGNP4
line 1716
;1716:	}
LABELV $754
line 1720
;1717://Sago: Changed the message
;1718://unlagged - backward reconciliation #5
;1719:	// announce it
;1720:	if ( g_delagHitscan.integer ) {
ADDRGP4 g_delagHitscan+12
INDIRI4
CNSTI4 0
EQI4 $758
line 1721
;1721:		trap_SendServerCommand( clientNum, "print \"Full lag compensation is ON!\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $761
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1722
;1722:	}
ADDRGP4 $759
JUMPV
LABELV $758
line 1723
;1723:	else {
line 1724
;1724:		trap_SendServerCommand( clientNum, "print \"Full lag compensation is OFF!\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $762
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1725
;1725:	}
LABELV $759
line 1727
;1726:
;1727:		trap_SendServerCommand( clientNum, "print \"QSandbox By Noire.dev\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $763
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1729
;1728:		
;1729:		icount = 0;
ADDRLP4 2064
CNSTI4 0
ASGNI4
line 1734
;1730:		/*while ( (entscr = G_Find(entscr, FOFS(classname), "info_player_deathmatch")) != NULL ) {icount += 1;}	
;1731:		trap_SendServerCommand( clientNum, va("print \"Spawn point count is %i\n\"", icount) );*/
;1732:
;1733://unlagged - backward reconciliation #5
;1734:    G_admin_namelog_update( client, qfalse );
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_admin_namelog_update
CALLV
pop
line 1735
;1735:	return NULL;
CNSTP4 0
RETP4
LABELV $685
endproc ClientConnect 2140 12
export motd
proc motd 1056 12
line 1739
;1736:}
;1737:
;1738:void motd (gentity_t *ent)
;1739:{
line 1745
;1740:	char motd[1024];
;1741:	fileHandle_t motdFile;
;1742:	int motdLen;
;1743:	int fileLen;
;1744:
;1745:	strcpy (motd, "cp \"");
ADDRLP4 0
ARGP4
ADDRGP4 $765
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1746
;1746:	fileLen = trap_FS_FOpenFile(g_motdfile.string, &motdFile, FS_READ);
ADDRGP4 g_motdfile+16
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1036
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1747
;1747:	if(motdFile)
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $767
line 1748
;1748:	{
line 1751
;1749:		char * p;
;1750:
;1751:		motdLen = strlen(motd);
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1044
INDIRI4
ASGNI4
line 1752
;1752:		if((motdLen + fileLen) > (sizeof(motd) - 2))
ADDRLP4 1028
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
CVIU4 4
CNSTU4 1022
LEU4 $769
line 1753
;1753:			fileLen = (sizeof(motd) - 2 - motdLen);
ADDRLP4 1024
CNSTU4 1022
ADDRLP4 1028
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ASGNI4
LABELV $769
line 1754
;1754:		trap_FS_Read(motd + motdLen, fileLen, motdFile);
ADDRLP4 1028
INDIRI4
ADDRLP4 0
ADDP4
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1755
;1755:		motd[motdLen + fileLen] = '"';
ADDRLP4 1028
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ADDRLP4 0
ADDP4
CNSTI1 34
ASGNI1
line 1756
;1756:		motd[motdLen + fileLen + 1] = 0;
ADDRLP4 1028
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ADDRLP4 0+1
ADDP4
CNSTI1 0
ASGNI1
line 1757
;1757:		trap_FS_FCloseFile(motdFile);
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
ADDRGP4 $773
JUMPV
LABELV $772
line 1760
;1758:
;1759:		while((p = strchr(motd, '\r'))) //Remove carrier return. 0x0D
;1760:		memmove(p, p + 1, motdLen + fileLen - (p - motd));
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1028
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ADDRLP4 1040
INDIRP4
CVPU4 4
ADDRLP4 0
CVPU4 4
SUBU4
CVUI4 4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
LABELV $773
line 1759
ADDRLP4 0
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 1052
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1052
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $772
line 1761
;1761:	}
LABELV $767
line 1762
;1762:	trap_SendServerCommand(ent - g_entities, motd);
ADDRFP4 0
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
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1763
;1763:}
LABELV $764
endproc motd 1056 12
export ClientBegin
proc ClientBegin 1064 12
line 1774
;1764:
;1765:/*
;1766:===========
;1767:ClientBegin
;1768:
;1769:called when a client has finished connecting, and is ready
;1770:to be placed into the level.  This will happen every level load,
;1771:and on transition between teams, but doesn't happen on respawns
;1772:============
;1773:*/
;1774:void ClientBegin( int clientNum ) {
line 1781
;1775:	gentity_t	*ent;
;1776:	gclient_t	*client;
;1777:	gentity_t       *tent;
;1778:	int			flags;
;1779:    char		userinfo[MAX_INFO_STRING];
;1780:
;1781:        trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1783
;1782:
;1783:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 2492
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1785
;1784:
;1785:	client = level.clients + clientNum;
ADDRLP4 0
CNSTI4 2324
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1787
;1786:
;1787:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $776
line 1788
;1788:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1789
;1789:	}
LABELV $776
line 1790
;1790:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1791
;1791:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 780
ADDP4
CNSTP4 0
ASGNP4
line 1792
;1792:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 788
ADDP4
CNSTP4 0
ASGNP4
line 1793
;1793:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1795
;1794:
;1795:	client->pers.connected = CON_CONNECTED;
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 2
ASGNI4
line 1796
;1796:	client->pers.enterTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1797
;1797:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 1800
;1798:
;1799:	//Elimination:
;1800:	client->pers.roundReached = 0; //We will spawn in next round
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 0
ASGNI4
line 1801
;1801:	if(g_gametype.integer == GT_LMS) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $779
line 1802
;1802:		client->isEliminated = qtrue; //So player does not give a point in gamemode 2 and 3
ADDRLP4 0
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 1
ASGNI4
line 1804
;1803:		//trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " will start dead\n\"", client->pers.netname) );
;1804:	}
LABELV $779
line 1811
;1805:
;1806:	// save eflags around this, because changing teams will
;1807:	// cause this to happen with a valid entity, and we
;1808:	// want to make sure the teleport bit is set right
;1809:	// so the viewpoint doesn't interpolate through the
;1810:	// world to the new position
;1811:	flags = client->ps.eFlags;
ADDRLP4 1032
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1812
;1812:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 472
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1813
;1813:        if( client->sess.sessionTeam != TEAM_SPECTATOR )
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $782
line 1814
;1814:            PlayerStore_restore(Info_ValueForKey(userinfo,"cl_guid"),&(client->ps));
ADDRLP4 8
ARGP4
ADDRGP4 $684
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 PlayerStore_restore
CALLV
pop
LABELV $782
line 1815
;1815:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 1032
INDIRI4
ASGNI4
line 1818
;1816:
;1817:	// locate ent at a spawn point
;1818:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1820
;1819:
;1820:	if( ( client->sess.sessionTeam != TEAM_SPECTATOR ) &&
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $784
ADDRLP4 1048
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
ADDRLP4 1048
INDIRI4
EQI4 $795
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
NEI4 $793
ADDRGP4 level+9912
INDIRI4
ADDRLP4 1048
INDIRI4
EQI4 $784
LABELV $793
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $794
ADDRGP4 level+9912
INDIRI4
CNSTI4 0
EQI4 $784
LABELV $794
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $795
ADDRGP4 level+9912
INDIRI4
CNSTI4 0
EQI4 $784
LABELV $795
line 1825
;1821:		( ( !( client->isEliminated ) /*&&
;1822:		( ( !client->ps.pm_type ) == PM_SPECTATOR ) */ ) || //Sago: Yes, it made no sense
;1823:		( ( g_gametype.integer != GT_ELIMINATION || level.intermissiontime) &&
;1824:		( g_gametype.integer != GT_CTF_ELIMINATION || level.intermissiontime) &&
;1825:		( g_gametype.integer != GT_LMS || level.intermissiontime ) ) ) ) {
line 1827
;1826:		// send event
;1827:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 1052
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1036
ADDRLP4 1052
INDIRP4
ASGNP4
line 1828
;1828:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 1056
CNSTI4 180
ASGNI4
ADDRLP4 1036
INDIRP4
ADDRLP4 1056
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 1056
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1830
;1829:
;1830:		if ( g_gametype.integer != GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $796
line 1831
;1831:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname) );
ADDRGP4 $799
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1832
;1832:		}
LABELV $796
line 1833
;1833:	}
LABELV $784
line 1835
;1834:
;1835:        motd ( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 motd
CALLV
pop
line 1837
;1836:	// set info that persisted after mapchange
;1837:	if (!IsBot(ent)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 IsBot
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $800
line 1838
;1838:		G_UpdateClientWithSessionData(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_UpdateClientWithSessionData
CALLI4
pop
line 1839
;1839:	}
LABELV $800
line 1840
;1840:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $802
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1843
;1841:
;1842:	//Send domination point names:
;1843:	if(g_gametype.integer == GT_DOMINATION) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 13
NEI4 $803
line 1844
;1844:		DominationPointNamesMessage(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 DominationPointNamesMessage
CALLV
pop
line 1845
;1845:		DominationPointStatusMessage(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 DominationPointStatusMessage
CALLV
pop
line 1846
;1846:	}
LABELV $803
line 1848
;1847:
;1848:			TeamCvarSet();
ADDRGP4 TeamCvarSet
CALLV
pop
line 1851
;1849:
;1850:			// count current clients and rank for scoreboard
;1851:			CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1853
;1852:
;1853:			G_SendWeaponProperties( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SendWeaponProperties
CALLV
pop
line 1856
;1854:			
;1855:        //Send the list of custom vote options:
;1856:        if(strlen(custom_vote_info))
ADDRGP4 custom_vote_info
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $806
line 1857
;1857:            SendCustomVoteCommands(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 SendCustomVoteCommands
CALLV
pop
LABELV $806
line 1858
;1858:}
LABELV $775
endproc ClientBegin 1064 12
export ClientSpawn
proc ClientSpawn 2096 20
line 1868
;1859:/*
;1860:===========
;1861:ClientSpawn
;1862:
;1863:Called every time a client is placed fresh in the world:
;1864:after the first ClientBegin, and after each respawn
;1865:Initializes all non-persistant parts of playerState
;1866:============
;1867:*/
;1868:void ClientSpawn(gentity_t *ent) {
line 1885
;1869:	int		index;
;1870:	vec3_t	spawn_origin, spawn_angles;
;1871:	gclient_t	*client;
;1872:	int		i;
;1873:	clientPersistant_t	saved;
;1874:	clientSession_t		savedSess;
;1875:	int		persistant[MAX_PERSISTANT];
;1876:	gentity_t	*spawnPoint;
;1877:	int		flags;
;1878:	int		health;
;1879:	int		savedPing;
;1880:	int		accuracy_hits, accuracy_shots,vote;
;1881:    int		accuracy[WP_NUM_WEAPONS][2];
;1882:	int		eventSequence;
;1883:	char	userinfo[MAX_INFO_STRING];
;1884:
;1885:	index = ent - g_entities;
ADDRLP4 216
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ASGNI4
line 1886
;1886:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 1888
;1887:
;1888:	if(g_gametype.integer == GT_SINGLE){
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $809
line 1889
;1889:	if ( !IsBot( ent ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2040
ADDRGP4 IsBot
CALLI4
ASGNI4
ADDRLP4 2040
INDIRI4
CNSTI4 0
NEI4 $812
line 1890
;1890:		G_FadeIn( 1.0, ent-g_entities );
CNSTF4 1065353216
ARGF4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRGP4 G_FadeIn
CALLV
pop
LABELV $812
line 1891
;1891:	}
LABELV $809
line 1897
;1892:
;1893:	//In Elimination the player should not spawn if he have already spawned in the round (but not for spectators)
;1894:	// N_G: You've obviously wanted something ELSE
;1895:	//Sago: Yes, the !level.intermissiontime is currently redundant but it might still be the bast place to make the test, CheckElimination in g_main makes sure the next if will fail and the rest of the things this block does might not affect if in Intermission (I'll just test that)
;1896:	if(
;1897:	(
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $822
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $822
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $814
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $814
LABELV $822
ADDRLP4 2040
CNSTI4 0
ASGNI4
ADDRGP4 level+9912
INDIRI4
ADDRLP4 2040
INDIRI4
EQI4 $823
ADDRGP4 level+16
INDIRI4
ADDRLP4 2040
INDIRI4
EQI4 $814
LABELV $823
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $814
line 1905
;1898:		(
;1899:			g_gametype.integer == GT_ELIMINATION ||
;1900:			g_gametype.integer == GT_CTF_ELIMINATION || (g_gametype.integer == GT_LMS && client->isEliminated)) &&
;1901:			(!level.intermissiontime || level.warmupTime != 0)
;1902:		) &&
;1903:		( client->sess.sessionTeam != TEAM_SPECTATOR )
;1904:	)
;1905:	{
line 1909
;1906:		// N_G: Another condition that makes no sense to me, see for
;1907:		// yourself if you really meant this
;1908:		// Sago: I beleive the TeamCount is to make sure people can join even if the game can't start
;1909:		if( ( level.roundNumber == level.roundNumberStarted ) ||
ADDRGP4 level+10004
INDIRI4
ADDRGP4 level+10008
INDIRI4
EQI4 $831
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+10000
INDIRI4
CNSTI4 1000
ADDRGP4 g_elimination_activewarmup+12
INDIRI4
MULI4
SUBI4
GEI4 $824
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 2044
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 2044
INDIRI4
CNSTI4 0
EQI4 $824
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 2048
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
EQI4 $824
LABELV $831
line 1913
;1910:			( (level.time < level.roundStartTime - g_elimination_activewarmup.integer*1000 ) &&
;1911:			TeamCount( -1, TEAM_BLUE ) &&
;1912:			TeamCount( -1, TEAM_RED )  ) )
;1913:		{
line 1914
;1914:		if	(client->sess.sessionTeam == TEAM_BLUE) {
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
NEI4 $832
line 1915
;1915:			if(eliminationrespawn.integer == 0){
ADDRGP4 eliminationrespawn+12
INDIRI4
CNSTI4 0
NEI4 $834
line 1916
;1916:			client->sess.spectatorState = SPECTATOR_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 1
ASGNI4
line 1917
;1917:			client->isEliminated = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 1
ASGNI4
line 1918
;1918:                        if(g_gametype.integer == GT_LMS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $837
line 1919
;1919:                                G_LogPrintf( "LMS: %i %i %i: Player \"%s^7\" eliminated!\n", level.roundNumber, index, 1, client->pers.netname );
ADDRGP4 $840
ARGP4
ADDRGP4 level+10004
INDIRI4
ARGI4
ADDRLP4 216
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
LABELV $837
line 1920
;1920:			client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1921
;1921:			}
LABELV $834
line 1922
;1922:		}
LABELV $832
line 1923
;1923:		if	(client->sess.sessionTeam == TEAM_RED) {
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $842
line 1924
;1924:			if(eliminationredrespawn.integer == 0){
ADDRGP4 eliminationredrespawn+12
INDIRI4
CNSTI4 0
NEI4 $844
line 1925
;1925:			client->sess.spectatorState = SPECTATOR_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 1
ASGNI4
line 1926
;1926:			client->isEliminated = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 1
ASGNI4
line 1927
;1927:                        if(g_gametype.integer == GT_LMS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $847
line 1928
;1928:                                G_LogPrintf( "LMS: %i %i %i: Player \"%s^7\" eliminated!\n", level.roundNumber, index, 1, client->pers.netname );
ADDRGP4 $840
ARGP4
ADDRGP4 level+10004
INDIRI4
ARGI4
ADDRLP4 216
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
LABELV $847
line 1929
;1929:			client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1930
;1930:			}
LABELV $844
line 1931
;1931:		}
LABELV $842
line 1934
;1932:
;1933:
;1934:			if	(client->sess.sessionTeam == TEAM_BLUE) {
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
NEI4 $851
line 1935
;1935:			if(eliminationrespawn.integer == 1){
ADDRGP4 eliminationrespawn+12
INDIRI4
CNSTI4 1
NEI4 $853
line 1939
;1936:				// find a spawn point
;1937:	// do it before setting health back up, so farthest
;1938:	// ranging doesn't count this client
;1939:	if ( ent->botspawn ) {
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $856
line 1940
;1940:		spawnPoint = ent->botspawn;
ADDRLP4 200
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ASGNP4
line 1941
;1941:		VectorCopy( spawnPoint->s.origin, spawn_origin );
ADDRLP4 204
ADDRLP4 200
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1942
;1942:		VectorCopy(  spawnPoint->s.angles, spawn_angles );
ADDRLP4 1248
ADDRLP4 200
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 1944
;1943:		//trap_SendServerCommand( -1, "loaddefered\n" );	//force clients to load the deferred assets
;1944:	} else {
ADDRGP4 $857
JUMPV
LABELV $856
line 1945
;1945:	if ((client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $864
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $863
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $858
LABELV $863
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $864
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $858
LABELV $864
line 1946
;1946:			|| ( (client->ps.pm_type == PM_SPECTATOR || client->isEliminated )  && (g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION) ) ) {
line 1947
;1947:		spawnPoint = SelectSpectatorSpawnPoint ( spawn_origin, spawn_angles);
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2056
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2056
INDIRP4
ASGNP4
line 1948
;1948:	} else if (g_gametype.integer == GT_DOUBLE_D) {
ADDRGP4 $859
JUMPV
LABELV $858
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 12
NEI4 $865
line 1950
;1949:		//Double Domination uses special spawn points:
;1950:		spawnPoint = SelectDoubleDominationSpawnPoint (client->sess.sessionTeam, spawn_origin, spawn_angles);
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2056
ADDRGP4 SelectDoubleDominationSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2056
INDIRP4
ASGNP4
line 1951
;1951:	} else if (g_gametype.integer >= GT_CTF && g_ffa_gt==0 && g_gametype.integer!= GT_DOMINATION) {
ADDRGP4 $866
JUMPV
LABELV $865
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $868
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 0
NEI4 $868
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 13
EQI4 $868
line 1953
;1952:		// all base oriented team games use the CTF spawn points
;1953:		spawnPoint = SelectCTFSpawnPoint (
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ARGI4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2060
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2060
INDIRP4
ASGNP4
line 1957
;1954:						client->sess.sessionTeam,
;1955:						client->pers.teamState.state,
;1956:						spawn_origin, spawn_angles);
;1957:	} else {
ADDRGP4 $869
JUMPV
LABELV $868
LABELV $872
line 1958
;1958:		do {
line 1960
;1959:			// the first spawn should be at a good looking spot
;1960:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 2060
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 2060
INDIRI4
NEI4 $875
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 2060
INDIRI4
EQI4 $875
line 1961
;1961:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 1962
;1962:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2064
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2064
INDIRP4
ASGNP4
line 1963
;1963:			} else {
ADDRGP4 $876
JUMPV
LABELV $875
line 1965
;1964:				// don't spawn near existing origin if possible
;1965:				spawnPoint = SelectSpawnPoint (
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2064
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2064
INDIRP4
ASGNP4
line 1968
;1966:					client->ps.origin,
;1967:					spawn_origin, spawn_angles);
;1968:			}
LABELV $876
line 1972
;1969:
;1970:			// Tim needs to prevent bots from spawning at the initial point
;1971:			// on q3dm0...
;1972:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2064
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 2064
INDIRI4
EQI4 $877
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2064
INDIRI4
EQI4 $877
line 1977
;1973:                            //Sago: The game has a tendency to select the furtest spawn point
;1974:                            //This is a problem if the fursest spawnpoint keeps being NO_BOTS and it does!
;1975:                            //This is a hot fix that seeks a spawn point faraway from the the currently found one
;1976:                            vec3_t old_origin;
;1977:                            VectorCopy(spawn_origin,old_origin);
ADDRLP4 2068
ADDRLP4 204
INDIRB
ASGNB 12
line 1978
;1978:                            spawnPoint = SelectSpawnPoint (old_origin, spawn_origin, spawn_angles);
ADDRLP4 2068
ARGP4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2080
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2080
INDIRP4
ASGNP4
line 1979
;1979:                            if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2084
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 2084
INDIRI4
EQI4 $879
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2084
INDIRI4
EQI4 $879
line 1980
;1980:				continue;	// try again
ADDRGP4 $873
JUMPV
LABELV $879
line 1982
;1981:                            }
;1982:			}
LABELV $877
line 1984
;1983:			// just to be symetric, we have a nohumans option...
;1984:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2068
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 2068
INDIRI4
EQI4 $874
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2068
INDIRI4
NEI4 $874
line 1985
;1985:				continue;	// try again
line 1988
;1986:			}
;1987:
;1988:			break;
LABELV $873
line 1990
;1989:
;1990:		} while ( 1 );
ADDRGP4 $872
JUMPV
LABELV $874
line 1991
;1991:	}
LABELV $869
LABELV $866
LABELV $859
line 1992
;1992:	}
LABELV $857
line 1993
;1993:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 1996
;1994:
;1995:	// always clear the kamikaze flag
;1996:	ent->s.eFlags &= ~EF_KAMIKAZE;
ADDRLP4 2052
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 2052
INDIRP4
ADDRLP4 2052
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2000
;1997:
;1998:	// toggle the teleport bit so the client knows to not lerp
;1999:	// and never clear the voted flag
;2000:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 220
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 2001
;2001:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 220
ADDRLP4 220
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 2005
;2002:
;2003://unlagged - backward reconciliation #3
;2004:	// we don't want players being backward-reconciled to the place they died
;2005:	G_ResetHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 2007
;2006:	// and this is as good a time as any to clear the saved state
;2007:	ent->client->saved.leveltime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2180
ADDP4
CNSTI4 0
ASGNI4
line 2012
;2008://unlagged - backward reconciliation #3
;2009:
;2010:	// clear everything but the persistant data
;2011:
;2012:	saved = client->pers;
ADDRLP4 1260
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRB
ASGNB 560
line 2013
;2013:	savedSess = client->sess;
ADDRLP4 1820
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRB
ASGNB 196
line 2014
;2014:	savedPing = client->ps.ping;
ADDRLP4 2020
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ASGNI4
line 2015
;2015:	vote = client->vote;
ADDRLP4 2032
ADDRLP4 4
INDIRP4
CNSTI4 1444
ADDP4
INDIRI4
ASGNI4
line 2017
;2016://	savedAreaBits = client->areabits;
;2017:	accuracy_hits = client->accuracy_hits;
ADDRLP4 2024
ADDRLP4 4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ASGNI4
line 2018
;2018:	accuracy_shots = client->accuracy_shots;
ADDRLP4 2028
ADDRLP4 4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ASGNI4
line 2019
;2019:    memcpy(accuracy,client->accuracy,sizeof(accuracy));
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 2196
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2021
;2020:
;2021:    memcpy(persistant,client->ps.persistant,MAX_PERSISTANT*sizeof(int));
ADDRLP4 136
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2022
;2022:	eventSequence = client->ps.eventSequence;
ADDRLP4 2036
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2024
;2023:
;2024:	Com_Memset (client, 0, sizeof(*client));
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2324
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2026
;2025:
;2026:	client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDRLP4 1260
INDIRB
ASGNB 560
line 2027
;2027:	client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
ADDRLP4 1820
INDIRB
ASGNB 196
line 2028
;2028:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 2020
INDIRI4
ASGNI4
line 2029
;2029:	client->vote = vote;
ADDRLP4 4
INDIRP4
CNSTI4 1444
ADDP4
ADDRLP4 2032
INDIRI4
ASGNI4
line 2031
;2030://	client->areabits = savedAreaBits;
;2031:	client->accuracy_hits = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 1300
ADDP4
ADDRLP4 2024
INDIRI4
ASGNI4
line 2032
;2032:	client->accuracy_shots = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 1296
ADDP4
ADDRLP4 2028
INDIRI4
ASGNI4
line 2033
;2033:        for( i = 0 ; i < WP_NUM_WEAPONS ; i++ ){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $883
line 2034
;2034:		client->accuracy[i][0] = accuracy[i][0];
ADDRLP4 2056
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 2056
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 2196
ADDP4
ADDP4
ADDRLP4 2056
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 2035
;2035:		client->accuracy[i][1] = accuracy[i][1];
ADDRLP4 2060
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 2196
ADDP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 2060
INDIRI4
ADDRLP4 8+4
ADDP4
INDIRI4
ASGNI4
line 2036
;2036:	}
LABELV $884
line 2033
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $883
line 2038
;2037:
;2038:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 -1
ASGNI4
line 2040
;2039:
;2040:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $888
line 2041
;2041:		client->ps.persistant[i] = persistant[i];
ADDRLP4 2056
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2056
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 2056
INDIRI4
ADDRLP4 136
ADDP4
INDIRI4
ASGNI4
line 2042
;2042:	}
LABELV $889
line 2040
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $888
line 2043
;2043:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 2036
INDIRI4
ASGNI4
line 2045
;2044:	// increment the spawncount so the client will detect the respawn
;2045:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 2056
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 2056
INDIRP4
ADDRLP4 2056
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2046
;2046:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 2048
;2047:
;2048:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 1332
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 2050
;2049:
;2050:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
ADDRLP4 216
INDIRI4
ARGI4
ADDRLP4 224
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 2052
;2051:	// set max health
;2052:	health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 224
ARGP4
ADDRGP4 $610
ARGP4
ADDRLP4 2064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRLP4 2068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2016
ADDRLP4 2068
INDIRI4
ASGNI4
line 2053
;2053:	client->pers.maxHealth = health;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 2016
INDIRI4
ASGNI4
line 2054
;2054:	if (!(ent->r.svFlags & SVF_BOT)){
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $893
line 2055
;2055:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 2072
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 1
LTI4 $897
ADDRLP4 2072
INDIRI4
CNSTI4 100
LEI4 $895
LABELV $897
line 2056
;2056:			client->pers.maxHealth = 100;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 100
ASGNI4
line 2057
;2057:		}
LABELV $895
line 2058
;2058:	}
LABELV $893
line 2061
;2059:
;2060:	// clear entity values
;2061:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
line 2062
;2062:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 220
INDIRI4
ASGNI4
line 2064
;2063:
;2064:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 4095
ASGNI4
line 2065
;2065:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 2324
ADDRLP4 216
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2066
;2066:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 2067
;2067:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 2068
;2068:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $898
ASGNP4
line 2069
;2069:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 33554432
ASGNI4
line 2070
;2070:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 33619969
ASGNI4
line 2071
;2071:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 player_die
ASGNP4
line 2072
;2072:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 2073
;2073:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 2074
;2074:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTI4 0
ASGNI4
line 2077
;2075:
;2076:    //Sago: No one has hit the client yet!
;2077:    client->lastSentFlying = -1;
ADDRLP4 4
INDIRP4
CNSTI4 1448
ADDP4
CNSTI4 -1
ASGNI4
line 2078
;2078:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 2079
;2079:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 2081
;2080:
;2081:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 2083
;2082:
;2083:	SetUnlimitedWeapons(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetUnlimitedWeapons
CALLV
pop
line 2084
;2084:	SetSandboxWeapons(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetSandboxWeapons
CALLV
pop
line 2085
;2085:	if ( ent->botspawn ) {
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $899
line 2086
;2086:		SetupCustomBot( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetupCustomBot
CALLV
pop
line 2087
;2087:	} else {
ADDRGP4 $900
JUMPV
LABELV $899
line 2088
;2088:		SetCustomWeapons( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetCustomWeapons
CALLV
pop
line 2089
;2089:	}
LABELV $900
line 2091
;2090:
;2091:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2092
;2092:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 204
INDIRB
ASGNB 12
line 2095
;2093:
;2094:	// the respawned flag will be cleared after the attack and jump keys come up
;2095:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 2076
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 2096
;2096:	if(g_gametype.integer==GT_ELIMINATION || g_gametype.integer==GT_CTF_ELIMINATION || g_gametype.integer==GT_LMS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $907
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $907
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $901
LABELV $907
line 2097
;2097:		client->ps.pm_flags &= ~PMF_ELIMWARMUP;
ADDRLP4 2080
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2080
INDIRP4
ADDRLP4 2080
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
LABELV $901
line 2099
;2098:
;2099:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 2100
;2100:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1248
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 2102
;2101:
;2102:	if ( !ent->botspawn ) { G_KillBox( ent );}
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $908
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
LABELV $908
line 2103
;2103:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2106
;2104:
;2105:	// force the base weapon up
;2106:	client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 2107
;2107:	ent->swep_id = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
CNSTI4 2
ASGNI4
line 2108
;2108:	ent->client->ps.stats[STAT_SWEP] = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 2
ASGNI4
line 2109
;2109:	client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2110
;2110:	ent->client->isEliminated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 0
ASGNI4
line 2113
;2111:
;2112:	// don't allow full run speed for a bit
;2113:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 2084
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2114
;2114:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 2116
;2115:
;2116:	client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 1316
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2117
;2117:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
INDIRP4
CNSTI4 1320
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 2118
;2118:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 2121
;2119:
;2120:	// set default animations
;2121:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 2122
;2122:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 2124
;2123:
;2124:	if ( level.intermissiontime ) {
ADDRGP4 level+9912
INDIRI4
CNSTI4 0
EQI4 $913
line 2125
;2125:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 2126
;2126:	} else {
ADDRGP4 $914
JUMPV
LABELV $913
line 2128
;2127:		// fire the targets of the spawn point
;2128:		G_UseTargets( spawnPoint, ent );
ADDRLP4 200
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2132
;2129:
;2130:		// select the highest weapon number available, after any
;2131:		// spawn given items have fired
;2132:		client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 2133
;2133:		ent->swep_id = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
CNSTI4 1
ASGNI4
line 2134
;2134:		ent->client->ps.stats[STAT_SWEP] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 1
ASGNI4
line 2135
;2135:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 0
CNSTI4 15
ASGNI4
LABELV $916
line 2136
;2136:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) && i != WP_GRAPPLING_HOOK ) {
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $920
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $920
line 2137
;2137:				client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2138
;2138:				ent->swep_id = i;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2139
;2139:				ent->client->ps.stats[STAT_SWEP] = i;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2140
;2140:				break;
ADDRGP4 $918
JUMPV
LABELV $920
line 2142
;2141:			}
;2142:		}
LABELV $917
line 2135
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $916
LABELV $918
line 2143
;2143:	}
LABELV $914
line 2147
;2144:
;2145:	// run a client frame to drop exactly to the floor,
;2146:	// initialize animations and other things
;2147:	client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 2148
;2148:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2149
;2149:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 2152
;2150:
;2151:	// positively link the client, even if the command times are weird
;2152:	if ( (ent->client->sess.sessionTeam != TEAM_SPECTATOR) || ( (!client->isEliminated || client->ps.pm_type != PM_SPECTATOR)&&
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $932
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $930
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $924
LABELV $930
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $932
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $932
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $924
LABELV $932
line 2153
;2153:		(g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION || g_gametype.integer == GT_LMS) ) ) {
line 2154
;2154:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2155
;2155:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 2092
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2092
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 2092
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2156
;2156:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2157
;2157:	}
LABELV $924
line 2160
;2158:
;2159:	// run the presend to set anything else
;2160:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 2163
;2161:
;2162:	// clear entity state values
;2163:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2165
;2164:
;2165:        if(g_spawnprotect.integer)
ADDRGP4 g_spawnprotect+12
INDIRI4
CNSTI4 0
EQI4 $933
line 2166
;2166:            client->spawnprotected = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 2192
ADDP4
CNSTI4 1
ASGNI4
LABELV $933
line 2168
;2167:
;2168:        RespawnTimeMessage(ent,0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 RespawnTimeMessage
CALLV
pop
line 2169
;2169:		client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 2170
;2170:		ent->swep_id = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
CNSTI4 2
ASGNI4
line 2171
;2171:		ent->client->ps.stats[STAT_SWEP] = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 2
ASGNI4
line 2172
;2172:		client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2173
;2173:		ent->client->isEliminated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 0
ASGNI4
line 2174
;2174:		return;
ADDRGP4 $808
JUMPV
LABELV $853
line 2176
;2175:			}
;2176:			}
LABELV $851
line 2177
;2177:			if	(client->sess.sessionTeam == TEAM_RED) {
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $936
line 2178
;2178:			if(eliminationredrespawn.integer == 1){
ADDRGP4 eliminationredrespawn+12
INDIRI4
CNSTI4 1
NEI4 $938
line 2182
;2179:				// find a spawn point
;2180:	// do it before setting health back up, so farthest
;2181:	// ranging doesn't count this client
;2182:	if ( ent->botspawn ) {
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $941
line 2183
;2183:		spawnPoint = ent->botspawn;
ADDRLP4 200
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ASGNP4
line 2184
;2184:		VectorCopy( spawnPoint->s.origin, spawn_origin );
ADDRLP4 204
ADDRLP4 200
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2185
;2185:		VectorCopy(  spawnPoint->s.angles, spawn_angles );
ADDRLP4 1248
ADDRLP4 200
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 2187
;2186:		//trap_SendServerCommand( -1, "loaddefered\n" );	//force clients to load the deferred assets
;2187:	} else {
ADDRGP4 $942
JUMPV
LABELV $941
line 2188
;2188:	if ((client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $949
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $948
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $943
LABELV $948
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $949
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $943
LABELV $949
line 2189
;2189:			|| ( (client->ps.pm_type == PM_SPECTATOR || client->isEliminated )  && (g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION) ) ) {
line 2190
;2190:		spawnPoint = SelectSpectatorSpawnPoint ( spawn_origin, spawn_angles);
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2056
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2056
INDIRP4
ASGNP4
line 2191
;2191:	} else if (g_gametype.integer == GT_DOUBLE_D) {
ADDRGP4 $944
JUMPV
LABELV $943
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 12
NEI4 $950
line 2193
;2192:		//Double Domination uses special spawn points:
;2193:		spawnPoint = SelectDoubleDominationSpawnPoint (client->sess.sessionTeam, spawn_origin, spawn_angles);
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2056
ADDRGP4 SelectDoubleDominationSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2056
INDIRP4
ASGNP4
line 2194
;2194:	} else if (g_gametype.integer >= GT_CTF && g_ffa_gt==0 && g_gametype.integer!= GT_DOMINATION) {
ADDRGP4 $951
JUMPV
LABELV $950
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $953
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 0
NEI4 $953
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 13
EQI4 $953
line 2196
;2195:		// all base oriented team games use the CTF spawn points
;2196:		spawnPoint = SelectCTFSpawnPoint (
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ARGI4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2060
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2060
INDIRP4
ASGNP4
line 2200
;2197:						client->sess.sessionTeam,
;2198:						client->pers.teamState.state,
;2199:						spawn_origin, spawn_angles);
;2200:	} else {
ADDRGP4 $954
JUMPV
LABELV $953
LABELV $957
line 2201
;2201:		do {
line 2203
;2202:			// the first spawn should be at a good looking spot
;2203:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 2060
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 2060
INDIRI4
NEI4 $960
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 2060
INDIRI4
EQI4 $960
line 2204
;2204:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 2205
;2205:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2064
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2064
INDIRP4
ASGNP4
line 2206
;2206:			} else {
ADDRGP4 $961
JUMPV
LABELV $960
line 2208
;2207:				// don't spawn near existing origin if possible
;2208:				spawnPoint = SelectSpawnPoint (
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2064
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2064
INDIRP4
ASGNP4
line 2211
;2209:					client->ps.origin,
;2210:					spawn_origin, spawn_angles);
;2211:			}
LABELV $961
line 2215
;2212:
;2213:			// Tim needs to prevent bots from spawning at the initial point
;2214:			// on q3dm0...
;2215:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2064
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 2064
INDIRI4
EQI4 $962
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2064
INDIRI4
EQI4 $962
line 2220
;2216:                            //Sago: The game has a tendency to select the furtest spawn point
;2217:                            //This is a problem if the fursest spawnpoint keeps being NO_BOTS and it does!
;2218:                            //This is a hot fix that seeks a spawn point faraway from the the currently found one
;2219:                            vec3_t old_origin;
;2220:                            VectorCopy(spawn_origin,old_origin);
ADDRLP4 2068
ADDRLP4 204
INDIRB
ASGNB 12
line 2221
;2221:                            spawnPoint = SelectSpawnPoint (old_origin, spawn_origin, spawn_angles);
ADDRLP4 2068
ARGP4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2080
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2080
INDIRP4
ASGNP4
line 2222
;2222:                            if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2084
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 2084
INDIRI4
EQI4 $964
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2084
INDIRI4
EQI4 $964
line 2223
;2223:				continue;	// try again
ADDRGP4 $958
JUMPV
LABELV $964
line 2225
;2224:                            }
;2225:			}
LABELV $962
line 2227
;2226:			// just to be symetric, we have a nohumans option...
;2227:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2068
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 2068
INDIRI4
EQI4 $959
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2068
INDIRI4
NEI4 $959
line 2228
;2228:				continue;	// try again
line 2231
;2229:			}
;2230:
;2231:			break;
LABELV $958
line 2233
;2232:
;2233:		} while ( 1 );
ADDRGP4 $957
JUMPV
LABELV $959
line 2234
;2234:	}
LABELV $954
LABELV $951
LABELV $944
line 2235
;2235:	}
LABELV $942
line 2236
;2236:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 2239
;2237:
;2238:	// always clear the kamikaze flag
;2239:	ent->s.eFlags &= ~EF_KAMIKAZE;
ADDRLP4 2052
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 2052
INDIRP4
ADDRLP4 2052
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2243
;2240:
;2241:	// toggle the teleport bit so the client knows to not lerp
;2242:	// and never clear the voted flag
;2243:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 220
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 2244
;2244:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 220
ADDRLP4 220
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 2248
;2245:
;2246://unlagged - backward reconciliation #3
;2247:	// we don't want players being backward-reconciled to the place they died
;2248:	G_ResetHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 2250
;2249:	// and this is as good a time as any to clear the saved state
;2250:	ent->client->saved.leveltime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2180
ADDP4
CNSTI4 0
ASGNI4
line 2255
;2251://unlagged - backward reconciliation #3
;2252:
;2253:	// clear everything but the persistant data
;2254:
;2255:	saved = client->pers;
ADDRLP4 1260
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRB
ASGNB 560
line 2256
;2256:	savedSess = client->sess;
ADDRLP4 1820
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRB
ASGNB 196
line 2257
;2257:	savedPing = client->ps.ping;
ADDRLP4 2020
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ASGNI4
line 2258
;2258:	vote = client->vote;
ADDRLP4 2032
ADDRLP4 4
INDIRP4
CNSTI4 1444
ADDP4
INDIRI4
ASGNI4
line 2260
;2259://	savedAreaBits = client->areabits;
;2260:	accuracy_hits = client->accuracy_hits;
ADDRLP4 2024
ADDRLP4 4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ASGNI4
line 2261
;2261:	accuracy_shots = client->accuracy_shots;
ADDRLP4 2028
ADDRLP4 4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ASGNI4
line 2262
;2262:    memcpy(accuracy,client->accuracy,sizeof(accuracy));
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 2196
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2264
;2263:
;2264:    memcpy(persistant,client->ps.persistant,MAX_PERSISTANT*sizeof(int));
ADDRLP4 136
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2265
;2265:	eventSequence = client->ps.eventSequence;
ADDRLP4 2036
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2267
;2266:
;2267:	Com_Memset (client, 0, sizeof(*client));
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2324
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2269
;2268:
;2269:	client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDRLP4 1260
INDIRB
ASGNB 560
line 2270
;2270:	client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
ADDRLP4 1820
INDIRB
ASGNB 196
line 2271
;2271:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 2020
INDIRI4
ASGNI4
line 2272
;2272:	client->vote = vote;
ADDRLP4 4
INDIRP4
CNSTI4 1444
ADDP4
ADDRLP4 2032
INDIRI4
ASGNI4
line 2274
;2273://	client->areabits = savedAreaBits;
;2274:	client->accuracy_hits = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 1300
ADDP4
ADDRLP4 2024
INDIRI4
ASGNI4
line 2275
;2275:	client->accuracy_shots = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 1296
ADDP4
ADDRLP4 2028
INDIRI4
ASGNI4
line 2276
;2276:        for( i = 0 ; i < WP_NUM_WEAPONS ; i++ ){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $968
line 2277
;2277:		client->accuracy[i][0] = accuracy[i][0];
ADDRLP4 2056
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 2056
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 2196
ADDP4
ADDP4
ADDRLP4 2056
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 2278
;2278:		client->accuracy[i][1] = accuracy[i][1];
ADDRLP4 2060
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 2196
ADDP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 2060
INDIRI4
ADDRLP4 8+4
ADDP4
INDIRI4
ASGNI4
line 2279
;2279:	}
LABELV $969
line 2276
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $968
line 2281
;2280:
;2281:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 -1
ASGNI4
line 2283
;2282:
;2283:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $973
line 2284
;2284:		client->ps.persistant[i] = persistant[i];
ADDRLP4 2056
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2056
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 2056
INDIRI4
ADDRLP4 136
ADDP4
INDIRI4
ASGNI4
line 2285
;2285:	}
LABELV $974
line 2283
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $973
line 2286
;2286:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 2036
INDIRI4
ASGNI4
line 2288
;2287:	// increment the spawncount so the client will detect the respawn
;2288:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 2056
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 2056
INDIRP4
ADDRLP4 2056
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2289
;2289:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 2291
;2290:
;2291:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 1332
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 2293
;2292:
;2293:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
ADDRLP4 216
INDIRI4
ARGI4
ADDRLP4 224
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 2295
;2294:	// set max health
;2295:	health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 224
ARGP4
ADDRGP4 $610
ARGP4
ADDRLP4 2064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRLP4 2068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2016
ADDRLP4 2068
INDIRI4
ASGNI4
line 2296
;2296:	client->pers.maxHealth = health;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 2016
INDIRI4
ASGNI4
line 2297
;2297:	if (!(ent->r.svFlags & SVF_BOT)){
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $978
line 2298
;2298:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 2072
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 1
LTI4 $982
ADDRLP4 2072
INDIRI4
CNSTI4 100
LEI4 $980
LABELV $982
line 2299
;2299:			client->pers.maxHealth = 100;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 100
ASGNI4
line 2300
;2300:		}
LABELV $980
line 2301
;2301:	}
LABELV $978
line 2304
;2302:
;2303:	// clear entity values
;2304:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
line 2305
;2305:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 220
INDIRI4
ASGNI4
line 2307
;2306:
;2307:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 4095
ASGNI4
line 2308
;2308:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 2324
ADDRLP4 216
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2309
;2309:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 2310
;2310:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 2311
;2311:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $898
ASGNP4
line 2312
;2312:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 33554432
ASGNI4
line 2313
;2313:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 33619969
ASGNI4
line 2314
;2314:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 player_die
ASGNP4
line 2315
;2315:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 2316
;2316:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 2317
;2317:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTI4 0
ASGNI4
line 2320
;2318:
;2319:    //Sago: No one has hit the client yet!
;2320:    client->lastSentFlying = -1;
ADDRLP4 4
INDIRP4
CNSTI4 1448
ADDP4
CNSTI4 -1
ASGNI4
line 2322
;2321:
;2322:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 2323
;2323:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 2325
;2324:
;2325:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 2327
;2326:
;2327:	SetUnlimitedWeapons(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetUnlimitedWeapons
CALLV
pop
line 2328
;2328:	SetSandboxWeapons(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetSandboxWeapons
CALLV
pop
line 2329
;2329:	if ( ent->botspawn ) {
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $983
line 2330
;2330:		SetupCustomBot( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetupCustomBot
CALLV
pop
line 2331
;2331:	} else {
ADDRGP4 $984
JUMPV
LABELV $983
line 2332
;2332:		SetCustomWeapons( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetCustomWeapons
CALLV
pop
line 2333
;2333:	}
LABELV $984
line 2335
;2334:
;2335:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2336
;2336:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 204
INDIRB
ASGNB 12
line 2339
;2337:
;2338:	// the respawned flag will be cleared after the attack and jump keys come up
;2339:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 2076
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 2340
;2340:	if(g_gametype.integer==GT_ELIMINATION || g_gametype.integer==GT_CTF_ELIMINATION || g_gametype.integer==GT_LMS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $991
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $991
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $985
LABELV $991
line 2341
;2341:		client->ps.pm_flags &= ~PMF_ELIMWARMUP;
ADDRLP4 2080
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2080
INDIRP4
ADDRLP4 2080
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
LABELV $985
line 2343
;2342:
;2343:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 2344
;2344:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1248
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 2346
;2345:
;2346:	if ( !ent->botspawn ) { G_KillBox( ent );}
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $992
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
LABELV $992
line 2347
;2347:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2350
;2348:
;2349:	// force the base weapon up
;2350:	client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 2351
;2351:	ent->swep_id = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
CNSTI4 2
ASGNI4
line 2352
;2352:	ent->client->ps.stats[STAT_SWEP] = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 2
ASGNI4
line 2353
;2353:	client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2354
;2354:	ent->client->isEliminated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 0
ASGNI4
line 2357
;2355:
;2356:	// don't allow full run speed for a bit
;2357:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 2084
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2358
;2358:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 2360
;2359:
;2360:	client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 1316
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2361
;2361:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
INDIRP4
CNSTI4 1320
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 2362
;2362:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 2365
;2363:
;2364:	// set default animations
;2365:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 2366
;2366:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 2368
;2367:
;2368:	if ( level.intermissiontime ) {
ADDRGP4 level+9912
INDIRI4
CNSTI4 0
EQI4 $997
line 2369
;2369:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 2370
;2370:	} else {
ADDRGP4 $998
JUMPV
LABELV $997
line 2372
;2371:		// fire the targets of the spawn point
;2372:		G_UseTargets( spawnPoint, ent );
ADDRLP4 200
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2376
;2373:
;2374:		// select the highest weapon number available, after any
;2375:		// spawn given items have fired
;2376:		client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 2377
;2377:		ent->swep_id = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
CNSTI4 1
ASGNI4
line 2378
;2378:		ent->client->ps.stats[STAT_SWEP] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 1
ASGNI4
line 2379
;2379:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 0
CNSTI4 15
ASGNI4
LABELV $1000
line 2380
;2380:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) && i != WP_GRAPPLING_HOOK ) {
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1004
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1004
line 2381
;2381:				client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2382
;2382:				ent->swep_id = i;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2383
;2383:				ent->client->ps.stats[STAT_SWEP] = i;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2384
;2384:				break;
ADDRGP4 $1002
JUMPV
LABELV $1004
line 2386
;2385:			}
;2386:		}
LABELV $1001
line 2379
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $1000
LABELV $1002
line 2387
;2387:	}
LABELV $998
line 2391
;2388:
;2389:	// run a client frame to drop exactly to the floor,
;2390:	// initialize animations and other things
;2391:	client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 2392
;2392:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2393
;2393:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 2396
;2394:
;2395:	// positively link the client, even if the command times are weird
;2396:	if ( (ent->client->sess.sessionTeam != TEAM_SPECTATOR) || ( (!client->isEliminated || client->ps.pm_type != PM_SPECTATOR)&&
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1016
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1014
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1008
LABELV $1014
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $1016
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $1016
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $1008
LABELV $1016
line 2397
;2397:		(g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION || g_gametype.integer == GT_LMS) ) ) {
line 2398
;2398:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2399
;2399:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 2092
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2092
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 2092
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2400
;2400:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2401
;2401:	}
LABELV $1008
line 2404
;2402:
;2403:	// run the presend to set anything else
;2404:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 2407
;2405:
;2406:	// clear entity state values
;2407:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2409
;2408:
;2409:        if(g_spawnprotect.integer)
ADDRGP4 g_spawnprotect+12
INDIRI4
CNSTI4 0
EQI4 $1017
line 2410
;2410:            client->spawnprotected = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 2192
ADDP4
CNSTI4 1
ASGNI4
LABELV $1017
line 2412
;2411:
;2412:        RespawnTimeMessage(ent,0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 RespawnTimeMessage
CALLV
pop
line 2413
;2413:		client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 2414
;2414:		ent->swep_id = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
CNSTI4 2
ASGNI4
line 2415
;2415:		ent->client->ps.stats[STAT_SWEP] = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 2
ASGNI4
line 2416
;2416:		client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2417
;2417:		ent->client->isEliminated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 0
ASGNI4
line 2418
;2418:		return;
ADDRGP4 $808
JUMPV
LABELV $938
line 2420
;2419:			}
;2420:			}
LABELV $936
line 2422
;2421:
;2422:                        CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2423
;2423:			return;
ADDRGP4 $808
JUMPV
LABELV $824
line 2426
;2424:		}
;2425:		else
;2426:		{
line 2427
;2427:			client->pers.roundReached = level.roundNumber+1;
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
ADDRGP4 level+10004
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2428
;2428:			client->sess.spectatorState = SPECTATOR_NOT;
ADDRLP4 4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 0
ASGNI4
line 2429
;2429:			client->ps.pm_type = PM_NORMAL;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2430
;2430:			client->isEliminated = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 0
ASGNI4
line 2431
;2431:                        CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2432
;2432:		}
line 2433
;2433:	} else {
ADDRGP4 $815
JUMPV
LABELV $814
line 2435
;2434:            //Force false.
;2435:            if(client->isEliminated) {
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1021
line 2436
;2436:                client->isEliminated = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 0
ASGNI4
line 2437
;2437:                CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2438
;2438:            }
LABELV $1021
line 2439
;2439:        }
LABELV $815
line 2441
;2440:
;2441:	if(g_gametype.integer == GT_LMS && client->sess.sessionTeam != TEAM_SPECTATOR && (!level.intermissiontime || level.warmupTime != 0))
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $1023
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1023
ADDRLP4 2044
CNSTI4 0
ASGNI4
ADDRGP4 level+9912
INDIRI4
ADDRLP4 2044
INDIRI4
EQI4 $1028
ADDRGP4 level+16
INDIRI4
ADDRLP4 2044
INDIRI4
EQI4 $1023
LABELV $1028
line 2442
;2442:	{
line 2443
;2443:		if(level.roundNumber==level.roundNumberStarted /*|| level.time<level.roundStartTime-g_elimination_activewarmup.integer*1000*/ && 1>client->pers.livesLeft)
ADDRGP4 level+10004
INDIRI4
ADDRGP4 level+10008
INDIRI4
NEI4 $1029
CNSTI4 1
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
LEI4 $1029
line 2444
;2444:		{
line 2445
;2445:			client->sess.spectatorState = SPECTATOR_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 1
ASGNI4
line 2446
;2446:			if( ent->client->isEliminated!=qtrue) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1033
line 2447
;2447:				client->isEliminated = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 1
ASGNI4
line 2448
;2448:				if((g_lms_mode.integer == 2 || g_lms_mode.integer == 3) && level.roundNumber == level.roundNumberStarted)
ADDRGP4 g_lms_mode+12
INDIRI4
CNSTI4 2
EQI4 $1041
ADDRGP4 g_lms_mode+12
INDIRI4
CNSTI4 3
NEI4 $1035
LABELV $1041
ADDRGP4 level+10004
INDIRI4
ADDRGP4 level+10008
INDIRI4
NEI4 $1035
line 2449
;2449:					LMSpoint();
ADDRGP4 LMSpoint
CALLV
pop
LABELV $1035
line 2450
;2450:                                G_LogPrintf( "LMS: %i %i %i: Player \"%s^7\" eliminated!\n", level.roundNumber, index, 1, client->pers.netname );
ADDRGP4 $840
ARGP4
ADDRGP4 level+10004
INDIRI4
ARGI4
ADDRLP4 216
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2451
;2451:			}
LABELV $1033
line 2452
;2452:			client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 2453
;2453:			return;
ADDRGP4 $808
JUMPV
LABELV $1029
line 2456
;2454:		}
;2455:
;2456:		client->sess.spectatorState = SPECTATOR_NOT;
ADDRLP4 4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 0
ASGNI4
line 2457
;2457:		client->ps.pm_type = PM_NORMAL;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2458
;2458:		client->isEliminated = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
CNSTI4 0
ASGNI4
line 2459
;2459:		if(client->pers.livesLeft>0)
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1043
line 2460
;2460:			client->pers.livesLeft--;
ADDRLP4 2048
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
ASGNP4
ADDRLP4 2048
INDIRP4
ADDRLP4 2048
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1043
line 2461
;2461:	}
LABELV $1023
line 2466
;2462:
;2463:	// find a spawn point
;2464:	// do it before setting health back up, so farthest
;2465:	// ranging doesn't count this client
;2466:	if ( ent->botspawn ) {
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1045
line 2467
;2467:		spawnPoint = ent->botspawn;
ADDRLP4 200
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ASGNP4
line 2468
;2468:		VectorCopy( spawnPoint->s.origin, spawn_origin );
ADDRLP4 204
ADDRLP4 200
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2469
;2469:		VectorCopy(  spawnPoint->s.angles, spawn_angles );
ADDRLP4 1248
ADDRLP4 200
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 2471
;2470:		//trap_SendServerCommand( -1, "loaddefered\n" );	//force clients to load the deferred assets
;2471:	} else {
ADDRGP4 $1046
JUMPV
LABELV $1045
line 2472
;2472:	if ((client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1053
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1052
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1047
LABELV $1052
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $1053
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $1047
LABELV $1053
line 2473
;2473:			|| ( (client->ps.pm_type == PM_SPECTATOR || client->isEliminated )  && (g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION) ) ) {
line 2474
;2474:		spawnPoint = SelectSpectatorSpawnPoint ( spawn_origin, spawn_angles);
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2052
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2052
INDIRP4
ASGNP4
line 2475
;2475:	} else if (g_gametype.integer == GT_DOUBLE_D) {
ADDRGP4 $1048
JUMPV
LABELV $1047
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 12
NEI4 $1054
line 2477
;2476:		//Double Domination uses special spawn points:
;2477:		spawnPoint = SelectDoubleDominationSpawnPoint (client->sess.sessionTeam, spawn_origin, spawn_angles);
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2052
ADDRGP4 SelectDoubleDominationSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2052
INDIRP4
ASGNP4
line 2478
;2478:	} else if (g_gametype.integer >= GT_CTF && g_ffa_gt==0 && g_gametype.integer!= GT_DOMINATION) {
ADDRGP4 $1055
JUMPV
LABELV $1054
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $1057
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 0
NEI4 $1057
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 13
EQI4 $1057
line 2480
;2479:		// all base oriented team games use the CTF spawn points
;2480:		spawnPoint = SelectCTFSpawnPoint (
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ARGI4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2056
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2056
INDIRP4
ASGNP4
line 2484
;2481:						client->sess.sessionTeam,
;2482:						client->pers.teamState.state,
;2483:						spawn_origin, spawn_angles);
;2484:	} else {
ADDRGP4 $1058
JUMPV
LABELV $1057
LABELV $1061
line 2485
;2485:		do {
line 2487
;2486:			// the first spawn should be at a good looking spot
;2487:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 2056
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 2056
INDIRI4
NEI4 $1064
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 2056
INDIRI4
EQI4 $1064
line 2488
;2488:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 2489
;2489:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2060
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2060
INDIRP4
ASGNP4
line 2490
;2490:			} else {
ADDRGP4 $1065
JUMPV
LABELV $1064
line 2492
;2491:				// don't spawn near existing origin if possible
;2492:				spawnPoint = SelectSpawnPoint (
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2060
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2060
INDIRP4
ASGNP4
line 2495
;2493:					client->ps.origin,
;2494:					spawn_origin, spawn_angles);
;2495:			}
LABELV $1065
line 2499
;2496:
;2497:			// Tim needs to prevent bots from spawning at the initial point
;2498:			// on q3dm0...
;2499:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2060
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 2060
INDIRI4
EQI4 $1066
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2060
INDIRI4
EQI4 $1066
line 2504
;2500:                            //Sago: The game has a tendency to select the furtest spawn point
;2501:                            //This is a problem if the fursest spawnpoint keeps being NO_BOTS and it does!
;2502:                            //This is a hot fix that seeks a spawn point faraway from the the currently found one
;2503:                            vec3_t old_origin;
;2504:                            VectorCopy(spawn_origin,old_origin);
ADDRLP4 2064
ADDRLP4 204
INDIRB
ASGNB 12
line 2505
;2505:                            spawnPoint = SelectSpawnPoint (old_origin, spawn_origin, spawn_angles);
ADDRLP4 2064
ARGP4
ADDRLP4 204
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 2076
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 2076
INDIRP4
ASGNP4
line 2506
;2506:                            if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2080
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 2080
INDIRI4
EQI4 $1068
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2080
INDIRI4
EQI4 $1068
line 2507
;2507:				continue;	// try again
ADDRGP4 $1062
JUMPV
LABELV $1068
line 2509
;2508:                            }
;2509:			}
LABELV $1066
line 2511
;2510:			// just to be symetric, we have a nohumans option...
;2511:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 2064
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 2064
INDIRI4
EQI4 $1063
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 2064
INDIRI4
NEI4 $1063
line 2512
;2512:				continue;	// try again
line 2515
;2513:			}
;2514:
;2515:			break;
LABELV $1062
line 2517
;2516:
;2517:		} while ( 1 );
ADDRGP4 $1061
JUMPV
LABELV $1063
line 2518
;2518:	}
LABELV $1058
LABELV $1055
LABELV $1048
line 2519
;2519:	}
LABELV $1046
line 2520
;2520:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 2523
;2521:
;2522:	// always clear the kamikaze flag
;2523:	ent->s.eFlags &= ~EF_KAMIKAZE;
ADDRLP4 2048
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 2048
INDIRP4
ADDRLP4 2048
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2527
;2524:
;2525:	// toggle the teleport bit so the client knows to not lerp
;2526:	// and never clear the voted flag
;2527:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 220
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 2528
;2528:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 220
ADDRLP4 220
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 2532
;2529:
;2530://unlagged - backward reconciliation #3
;2531:	// we don't want players being backward-reconciled to the place they died
;2532:	G_ResetHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 2534
;2533:	// and this is as good a time as any to clear the saved state
;2534:	ent->client->saved.leveltime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 2180
ADDP4
CNSTI4 0
ASGNI4
line 2539
;2535://unlagged - backward reconciliation #3
;2536:
;2537:	// clear everything but the persistant data
;2538:
;2539:	saved = client->pers;
ADDRLP4 1260
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRB
ASGNB 560
line 2540
;2540:	savedSess = client->sess;
ADDRLP4 1820
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRB
ASGNB 196
line 2541
;2541:	savedPing = client->ps.ping;
ADDRLP4 2020
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ASGNI4
line 2542
;2542:	vote = client->vote;
ADDRLP4 2032
ADDRLP4 4
INDIRP4
CNSTI4 1444
ADDP4
INDIRI4
ASGNI4
line 2544
;2543://	savedAreaBits = client->areabits;
;2544:	accuracy_hits = client->accuracy_hits;
ADDRLP4 2024
ADDRLP4 4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ASGNI4
line 2545
;2545:	accuracy_shots = client->accuracy_shots;
ADDRLP4 2028
ADDRLP4 4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ASGNI4
line 2546
;2546:    memcpy(accuracy,client->accuracy,sizeof(accuracy));
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 2196
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2548
;2547:
;2548:    memcpy(persistant,client->ps.persistant,MAX_PERSISTANT*sizeof(int));
ADDRLP4 136
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2549
;2549:	eventSequence = client->ps.eventSequence;
ADDRLP4 2036
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2551
;2550:
;2551:	Com_Memset (client, 0, sizeof(*client));
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2324
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2553
;2552:
;2553:	client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDRLP4 1260
INDIRB
ASGNB 560
line 2554
;2554:	client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
ADDRLP4 1820
INDIRB
ASGNB 196
line 2555
;2555:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 2020
INDIRI4
ASGNI4
line 2556
;2556:	client->vote = vote;
ADDRLP4 4
INDIRP4
CNSTI4 1444
ADDP4
ADDRLP4 2032
INDIRI4
ASGNI4
line 2558
;2557://	client->areabits = savedAreaBits;
;2558:	client->accuracy_hits = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 1300
ADDP4
ADDRLP4 2024
INDIRI4
ASGNI4
line 2559
;2559:	client->accuracy_shots = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 1296
ADDP4
ADDRLP4 2028
INDIRI4
ASGNI4
line 2560
;2560:        for( i = 0 ; i < WP_NUM_WEAPONS ; i++ ){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1072
line 2561
;2561:		client->accuracy[i][0] = accuracy[i][0];
ADDRLP4 2052
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 2052
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 2196
ADDP4
ADDP4
ADDRLP4 2052
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 2562
;2562:		client->accuracy[i][1] = accuracy[i][1];
ADDRLP4 2056
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 2056
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 2196
ADDP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 2056
INDIRI4
ADDRLP4 8+4
ADDP4
INDIRI4
ASGNI4
line 2563
;2563:	}
LABELV $1073
line 2560
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1072
line 2565
;2564:
;2565:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 -1
ASGNI4
line 2567
;2566:
;2567:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1077
line 2568
;2568:		client->ps.persistant[i] = persistant[i];
ADDRLP4 2052
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2052
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 2052
INDIRI4
ADDRLP4 136
ADDP4
INDIRI4
ASGNI4
line 2569
;2569:	}
LABELV $1078
line 2567
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1077
line 2570
;2570:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 2036
INDIRI4
ASGNI4
line 2572
;2571:	// increment the spawncount so the client will detect the respawn
;2572:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 2052
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 2052
INDIRP4
ADDRLP4 2052
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2573
;2573:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 2575
;2574:
;2575:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 1332
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 2577
;2576:
;2577:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
ADDRLP4 216
INDIRI4
ARGI4
ADDRLP4 224
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 2579
;2578:	// set max health
;2579:	health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 224
ARGP4
ADDRGP4 $610
ARGP4
ADDRLP4 2060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRLP4 2064
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2016
ADDRLP4 2064
INDIRI4
ASGNI4
line 2580
;2580:	client->pers.maxHealth = health;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 2016
INDIRI4
ASGNI4
line 2581
;2581:	if (!(ent->r.svFlags & SVF_BOT)){
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1082
line 2582
;2582:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 2068
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 1
LTI4 $1086
ADDRLP4 2068
INDIRI4
CNSTI4 100
LEI4 $1084
LABELV $1086
line 2583
;2583:			client->pers.maxHealth = 100;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 100
ASGNI4
line 2584
;2584:		}
LABELV $1084
line 2585
;2585:	}
LABELV $1082
line 2588
;2586:
;2587:	// clear entity values
;2588:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ASGNI4
line 2589
;2589:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 220
INDIRI4
ASGNI4
line 2591
;2590:
;2591:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 4095
ASGNI4
line 2592
;2592:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 2324
ADDRLP4 216
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2593
;2593:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 1
ASGNI4
line 2594
;2594:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 2595
;2595:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $898
ASGNP4
line 2596
;2596:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 33554432
ASGNI4
line 2597
;2597:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 33619969
ASGNI4
line 2598
;2598:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRGP4 player_die
ASGNP4
line 2599
;2599:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 0
ASGNI4
line 2600
;2600:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 2601
;2601:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTI4 0
ASGNI4
line 2604
;2602:
;2603:	//Sago: No one has hit the client yet!
;2604:	client->lastSentFlying = -1;
ADDRLP4 4
INDIRP4
CNSTI4 1448
ADDP4
CNSTI4 -1
ASGNI4
line 2606
;2605:
;2606:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 2607
;2607:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 2609
;2608:
;2609:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 2611
;2610:
;2611:	SetUnlimitedWeapons(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetUnlimitedWeapons
CALLV
pop
line 2612
;2612:	SetSandboxWeapons(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetSandboxWeapons
CALLV
pop
line 2613
;2613:	if ( ent->botspawn ) {
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1087
line 2614
;2614:		SetupCustomBot( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetupCustomBot
CALLV
pop
line 2615
;2615:	} else {
ADDRGP4 $1088
JUMPV
LABELV $1087
line 2616
;2616:		SetCustomWeapons( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetCustomWeapons
CALLV
pop
line 2617
;2617:	}
LABELV $1088
line 2619
;2618:
;2619:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2620
;2620:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 204
INDIRB
ASGNB 12
line 2623
;2621:
;2622:	// the respawned flag will be cleared after the attack and jump keys come up
;2623:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 2072
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2072
INDIRP4
ADDRLP4 2072
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 2624
;2624:	if(g_gametype.integer==GT_ELIMINATION || g_gametype.integer==GT_CTF_ELIMINATION || g_gametype.integer==GT_LMS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $1095
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $1095
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $1089
LABELV $1095
line 2625
;2625:		client->ps.pm_flags |= PMF_ELIMWARMUP;
ADDRLP4 2076
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
LABELV $1089
line 2627
;2626:
;2627:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 2628
;2628:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1248
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 2630
;2629:
;2630:	if ( (ent->client->sess.sessionTeam == TEAM_SPECTATOR) || ((client->ps.pm_type == PM_SPECTATOR || client->isEliminated) &&
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1104
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1102
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1096
LABELV $1102
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $1104
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $1104
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $1096
LABELV $1104
line 2631
;2631:		(g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION || g_gametype.integer == GT_LMS) ) ) {
line 2637
;2632:        //Sago: Lets see if this fixes the bots only bug - loose all point on dead bug. (It didn't)
;2633:        /*if(g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION || g_gametype.integer == GT_LMS) {
;2634:        G_KillBox( ent );
;2635:		trap_LinkEntity (ent);
;2636:        }*/
;2637:	} else {
ADDRGP4 $1097
JUMPV
LABELV $1096
line 2638
;2638:		if ( !ent->botspawn ) { G_KillBox( ent );}
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1105
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
LABELV $1105
line 2639
;2639:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2642
;2640:
;2641:		// force the base weapon up
;2642:		client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 2643
;2643:		ent->swep_id = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
CNSTI4 2
ASGNI4
line 2644
;2644:		ent->client->ps.stats[STAT_SWEP] = WP_MACHINEGUN;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 2
ASGNI4
line 2645
;2645:		client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2647
;2646:
;2647:	}
LABELV $1097
line 2650
;2648:
;2649:	// don't allow full run speed for a bit
;2650:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 2084
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2651
;2651:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 2653
;2652:
;2653:	client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 1316
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2654
;2654:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
INDIRP4
CNSTI4 1320
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 2655
;2655:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 2658
;2656:
;2657:	// set default animations
;2658:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 2659
;2659:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 2661
;2660:
;2661:	if ( level.intermissiontime ) {
ADDRGP4 level+9912
INDIRI4
CNSTI4 0
EQI4 $1110
line 2662
;2662:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 2663
;2663:	} else {
ADDRGP4 $1111
JUMPV
LABELV $1110
line 2665
;2664:		// fire the targets of the spawn point
;2665:		G_UseTargets( spawnPoint, ent );
ADDRLP4 200
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2669
;2666:
;2667:		// select the highest weapon number available, after any
;2668:		// spawn given items have fired
;2669:		client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 2670
;2670:		ent->swep_id = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
CNSTI4 1
ASGNI4
line 2671
;2671:		ent->client->ps.stats[STAT_SWEP] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 1
ASGNI4
line 2672
;2672:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 0
CNSTI4 15
ASGNI4
LABELV $1113
line 2673
;2673:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) && i != WP_GRAPPLING_HOOK ) {
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1117
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $1117
line 2674
;2674:				client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2675
;2675:				ent->swep_id = i;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2676
;2676:				ent->client->ps.stats[STAT_SWEP] = i;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2677
;2677:				break;
ADDRGP4 $1115
JUMPV
LABELV $1117
line 2679
;2678:			}
;2679:		}
LABELV $1114
line 2672
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $1113
LABELV $1115
line 2680
;2680:	}
LABELV $1111
line 2684
;2681:
;2682:	// run a client frame to drop exactly to the floor,
;2683:	// initialize animations and other things
;2684:	client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 2685
;2685:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2686
;2686:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 2689
;2687:
;2688:	// positively link the client, even if the command times are weird
;2689:	if ( (ent->client->sess.sessionTeam != TEAM_SPECTATOR) || ( (!client->isEliminated || client->ps.pm_type != PM_SPECTATOR)&&
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1129
ADDRLP4 4
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1127
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1121
LABELV $1127
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $1129
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
EQI4 $1129
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $1121
LABELV $1129
line 2690
;2690:		(g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION || g_gametype.integer == GT_LMS) ) ) {
line 2691
;2691:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2692
;2692:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 2092
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 2092
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 2092
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2693
;2693:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2694
;2694:	}
LABELV $1121
line 2697
;2695:
;2696:	// run the presend to set anything else
;2697:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 2700
;2698:
;2699:	// clear entity state values
;2700:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2702
;2701:
;2702:        if(g_spawnprotect.integer)
ADDRGP4 g_spawnprotect+12
INDIRI4
CNSTI4 0
EQI4 $1130
line 2703
;2703:            client->spawnprotected = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 2192
ADDP4
CNSTI4 1
ASGNI4
LABELV $1130
line 2705
;2704:
;2705:        RespawnTimeMessage(ent,0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 RespawnTimeMessage
CALLV
pop
line 2706
;2706:}
LABELV $808
endproc ClientSpawn 2096 20
export ClientDisconnect
proc ClientDisconnect 1528 20
line 2721
;2707:
;2708:
;2709:/*
;2710:===========
;2711:ClientDisconnect
;2712:
;2713:Called when a player drops from the server.
;2714:Will not be called between levels.
;2715:
;2716:This should NOT be called directly by any game logic,
;2717:call trap_DropClient(), which will call this and do
;2718:server system housekeeping.
;2719:============
;2720:*/
;2721:void ClientDisconnect( int clientNum ) {
line 2728
;2722:	gentity_t	*ent;
;2723:	int			i;
;2724:        char	userinfo[MAX_INFO_STRING];
;2725:
;2726:	// cleanup if we are kicking a bot that
;2727:	// hasn't spawned yet
;2728:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 2730
;2729:
;2730:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 2492
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2731
;2731:	if ( !ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1134
line 2732
;2732:		return;
ADDRGP4 $1133
JUMPV
LABELV $1134
line 2735
;2733:	}
;2734:
;2735:        ClientLeaving( clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientLeaving
CALLV
pop
line 2737
;2736:    //KK-OAX Admin
;2737:    G_admin_namelog_update( ent->client, qtrue );
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_admin_namelog_update
CALLV
pop
line 2739
;2738:
;2739:        trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 2742
;2740:
;2741:	// stop any following clients
;2742:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1139
JUMPV
LABELV $1136
line 2743
;2743:		if ( (level.clients[i].sess.sessionTeam == TEAM_SPECTATOR || level.clients[i].ps.pm_type == PM_SPECTATOR)
ADDRLP4 1032
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1143
ADDRLP4 1032
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1141
LABELV $1143
ADDRLP4 1036
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1141
ADDRLP4 1036
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1141
line 2745
;2744:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;2745:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 2746
;2746:			StopFollowing( &g_entities[i] );
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 2747
;2747:		}
LABELV $1141
line 2748
;2748:	}
LABELV $1137
line 2742
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1139
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1136
line 2771
;2749:
;2750:	// send effect if they were completely connected
;2751:        /*
;2752:         *Sago: I have removed this. A little dangerous but I make him suicide in a moment.
;2753:         */
;2754:	/*if ( ent->client->pers.connected == CON_CONNECTED
;2755:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
;2756:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
;2757:		tent->s.clientNum = ent->s.clientNum;
;2758:
;2759:		// They don't get to take powerups with them!
;2760:		// Especially important for stuff like CTF flags
;2761:		TossClientItems( ent );
;2762:		TossClientPersistantPowerups( ent );
;2763:                if( g_gametype.integer == GT_HARVESTER ) {
;2764:			TossClientCubes( ent );
;2765:		}
;2766:
;2767:
;2768:	}*/
;2769:
;2770:        //Is the player alive?
;2771:        i = (ent->client->ps.stats[STAT_HEALTH]>0);
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1145
ADDRLP4 1032
CNSTI4 1
ASGNI4
ADDRGP4 $1146
JUMPV
LABELV $1145
ADDRLP4 1032
CNSTI4 0
ASGNI4
LABELV $1146
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 2773
;2772:        //Commit suicide!
;2773:        if ( ent->client->pers.connected == CON_CONNECTED
ADDRLP4 1036
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1147
ADDRLP4 1036
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1147
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1147
line 2774
;2774:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR && i ) {
line 2776
;2775:                //Prevent a team from loosing point because of player leaving
;2776:                int teamscore = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 2777
;2777:                if(g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $1149
line 2778
;2778:                    teamscore = level.teamScores[ ent->client->sess.sessionTeam ];
ADDRLP4 1040
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+44
ADDP4
INDIRI4
ASGNI4
LABELV $1149
line 2780
;2779:		// Kill him (makes sure he loses flags, etc)
;2780:		ent->flags &= ~FL_GODMODE;
ADDRLP4 1044
ADDRLP4 4
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2781
;2781:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 2782
;2782:		player_die (ent, ent, g_entities + ENTITYNUM_WORLD, 100000, MOD_SUICIDE);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 g_entities+10202248
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 25
ARGI4
ADDRGP4 player_die
CALLV
pop
line 2783
;2783:                if(g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $1154
line 2784
;2784:                    level.teamScores[ ent->client->sess.sessionTeam ] = teamscore;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+44
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
LABELV $1154
line 2785
;2785:	}
LABELV $1147
line 2789
;2786:
;2787:
;2788:
;2789:        if ( ent->client->pers.connected == CON_CONNECTED && ent->client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRLP4 1040
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1158
ADDRLP4 1040
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1158
line 2790
;2790:            PlayerStore_store(Info_ValueForKey(userinfo,"cl_guid"),ent->client->ps);
ADDRLP4 8
ARGP4
ADDRGP4 $684
ARGP4
ADDRLP4 1516
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1516
INDIRP4
ARGP4
ADDRLP4 1044
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
INDIRB
ASGNB 472
ADDRLP4 1044
ARGP4
ADDRGP4 PlayerStore_store
CALLV
pop
LABELV $1158
line 2792
;2791:
;2792:	G_LogPrintf( "ClientDisconnect: %i\n", clientNum );
ADDRGP4 $1160
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2795
;2793:
;2794:	// if we are playing in tourney mode and losing, give a win to the other player
;2795:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1161
ADDRLP4 1520
CNSTI4 0
ASGNI4
ADDRGP4 level+9912
INDIRI4
ADDRLP4 1520
INDIRI4
NEI4 $1161
ADDRGP4 level+16
INDIRI4
ADDRLP4 1520
INDIRI4
NEI4 $1161
ADDRGP4 level+84+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1161
line 2797
;2796:		&& !level.intermissiontime
;2797:		&& !level.warmupTime && level.sortedClients[1] == clientNum ) {
line 2798
;2798:		level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 1524
CNSTI4 2324
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1048
ADDP4
ASGNP4
ADDRLP4 1524
INDIRP4
ADDRLP4 1524
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2799
;2799:		ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+84
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2800
;2800:	}
LABELV $1161
line 2802
;2801:
;2802:	if( g_gametype.integer == GT_TOURNAMENT &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1170
ADDRLP4 1524
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 1524
INDIRI4
NEI4 $1170
ADDRGP4 level+9912
INDIRI4
ADDRLP4 1524
INDIRI4
EQI4 $1170
line 2804
;2803:		ent->client->sess.sessionTeam == TEAM_FREE &&
;2804:		level.intermissiontime ) {
line 2806
;2805:
;2806:		trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $1174
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2807
;2807:		level.restarted = qtrue;
ADDRGP4 level+68
CNSTI4 1
ASGNI4
line 2808
;2808:		level.changemap = NULL;
ADDRGP4 level+9916
CNSTP4 0
ASGNP4
line 2809
;2809:		level.intermissiontime = 0;
ADDRGP4 level+9912
CNSTI4 0
ASGNI4
line 2810
;2810:	}
LABELV $1170
line 2812
;2811:
;2812:	trap_UnlinkEntity (ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2813
;2813:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 0
ASGNI4
line 2814
;2814:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 2815
;2815:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $1178
ASGNP4
line 2816
;2816:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 0
ASGNI4
line 2817
;2817:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 2818
;2818:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
CNSTI4 0
ASGNI4
line 2820
;2819:
;2820:	trap_SetConfigstring( CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRGP4 $1179
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2822
;2821:
;2822:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2823
;2823:        CountVotes();
ADDRGP4 CountVotes
CALLV
pop
line 2825
;2824:
;2825:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1180
line 2826
;2826:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 2827
;2827:	}
LABELV $1180
line 2828
;2828:}
LABELV $1133
endproc ClientDisconnect 1528 20
export DropClientSilently
proc DropClientSilently 0 8
line 2838
;2829:
;2830:/*
;2831:===========
;2832:DropClientSilently
;2833:
;2834:Drops a client without displaying a message about it.
;2835:See http://www.quake3world.com/forum/viewtopic.php?f=16&t=45625
;2836:============
;2837:*/
;2838:void DropClientSilently( int clientNum ) {
line 2839
;2839:	if ( 0 )
ADDRGP4 $1183
JUMPV
line 2840
;2840:		trap_DropClient( clientNum, " : removing dead bot" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $1185
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
ADDRGP4 $1184
JUMPV
LABELV $1183
line 2842
;2841:	else
;2842:		trap_DropClient( clientNum, "DR_SILENT_DROP" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $1186
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
LABELV $1184
line 2843
;2843:}
LABELV $1182
endproc DropClientSilently 0 8
export SetupCustomBot
proc SetupCustomBot 100 8
line 2852
;2844:
;2845:/*
;2846:===========
;2847:SetupCustomBot
;2848:
;2849:Applies properties from the entity that spawned the bot to the bot
;2850:============
;2851:*/
;2852:void SetupCustomBot( gentity_t *bot ) {
line 2853
;2853:	if ( !bot->singlebot || !(bot->botspawn) )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1190
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1188
LABELV $1190
line 2854
;2854:		return;
ADDRGP4 $1187
JUMPV
LABELV $1188
line 2857
;2855:
;2856:	//give bot unlimited ammo. 999 ammo is considered unlimited here, because -1 leads to odd weapon choices for bots.
;2857:	bot->client->ps.ammo[WP_GAUNTLET] = -1;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 2858
;2858:	bot->client->ps.ammo[WP_MACHINEGUN] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 9999
ASGNI4
line 2859
;2859:	bot->client->ps.ammo[WP_SHOTGUN] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 9999
ASGNI4
line 2860
;2860:	bot->client->ps.ammo[WP_GRENADE_LAUNCHER] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 9999
ASGNI4
line 2861
;2861:	bot->client->ps.ammo[WP_ROCKET_LAUNCHER] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 9999
ASGNI4
line 2862
;2862:	bot->client->ps.ammo[WP_LIGHTNING] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 400
ADDP4
CNSTI4 9999
ASGNI4
line 2863
;2863:	bot->client->ps.ammo[WP_RAILGUN] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 404
ADDP4
CNSTI4 9999
ASGNI4
line 2864
;2864:	bot->client->ps.ammo[WP_PLASMAGUN] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 9999
ASGNI4
line 2865
;2865:	bot->client->ps.ammo[WP_BFG] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 9999
ASGNI4
line 2866
;2866:	bot->client->ps.ammo[WP_NAILGUN] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 9999
ASGNI4
line 2867
;2867:	bot->client->ps.ammo[WP_PROX_LAUNCHER] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 9999
ASGNI4
line 2868
;2868:	bot->client->ps.ammo[WP_CHAINGUN] = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 9999
ASGNI4
line 2872
;2869:	
;2870:
;2871:	//give bot weapons
;2872:	if ( bot->botspawn->spawnflags & 1 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1191
line 2873
;2873:		bot->client->ps.stats[STAT_WEAPONS] = ( 1 << WP_GAUNTLET );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 2
ASGNI4
LABELV $1191
line 2874
;2874:	if ( bot->botspawn->spawnflags & 2 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1193
line 2875
;2875:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_MACHINEGUN );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $1193
line 2876
;2876:	if ( bot->botspawn->spawnflags & 4 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1195
line 2877
;2877:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SHOTGUN );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $1195
line 2878
;2878:	if ( bot->botspawn->spawnflags & 8 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1197
line 2879
;2879:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GRENADE_LAUNCHER );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
LABELV $1197
line 2880
;2880:	if ( bot->botspawn->spawnflags & 16 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1199
line 2881
;2881:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_ROCKET_LAUNCHER );
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
LABELV $1199
line 2882
;2882:	if ( bot->botspawn->spawnflags & 32 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1201
line 2883
;2883:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_LIGHTNING );
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
LABELV $1201
line 2884
;2884:	if ( bot->botspawn->spawnflags & 64 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1203
line 2885
;2885:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_RAILGUN );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
LABELV $1203
line 2886
;2886:	if ( bot->botspawn->spawnflags & 128 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1205
line 2887
;2887:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_PLASMAGUN );
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $1205
line 2888
;2888:	if ( bot->botspawn->spawnflags & 256 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1207
line 2889
;2889:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BFG );
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $1207
line 2890
;2890:	if ( bot->botspawn->spawnflags & 512 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1209
line 2891
;2891:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_NAILGUN );
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
LABELV $1209
line 2892
;2892:	if ( bot->botspawn->spawnflags & 1024 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1211
line 2893
;2893:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_PROX_LAUNCHER );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
LABELV $1211
line 2894
;2894:	if ( bot->botspawn->spawnflags & 2048 )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1213
line 2895
;2895:		bot->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_CHAINGUN );
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
LABELV $1213
line 2899
;2896:
;2897:	//G_Printf("bot health: %i\n", bot->botspawn->health);
;2898:	//set bot's health (it doesn't degrade automatically)
;2899:	bot->health = bot->client->ps.stats[STAT_HEALTH] = bot->client->ps.stats[STAT_MAX_HEALTH] = bot->botspawn->health;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 808
ASGNI4
ADDRLP4 60
ADDRLP4 48
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 48
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 2902
;2900:
;2901:	//set walking behavior
;2902:	if (bot->botspawn->spawnflags & 4096 || bot->botspawn->spawnflags & 8192)
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 68
INDIRI4
NEI4 $1217
ADDRLP4 64
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 68
INDIRI4
EQI4 $1215
LABELV $1217
line 2903
;2903:		bot->client->ps.pm_flags |= PMF_FORCE_WALK;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
LABELV $1215
line 2905
;2904:
;2905:	if (bot->botspawn->spawnflags & 4096 && !(bot->botspawn->spawnflags & 8192))
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ASGNI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 80
INDIRI4
EQI4 $1218
ADDRLP4 76
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $1218
line 2906
;2906:		bot->client->ps.pm_flags |= PMF_ATTACK_RUN;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
LABELV $1218
line 2909
;2907:
;2908:	//use targets of target_botspawn
;2909:	if ( bot->botspawn->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1220
line 2910
;2910:		G_UseTargets( bot->botspawn, bot);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2911
;2911:	}
LABELV $1220
line 2913
;2912:	
;2913:	if(g_gametype.integer == GT_SANDBOX){
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $1222
LABELV $1225
line 2914
;2914:	CopyAlloc(bot->target, bot->botspawn->target);
CNSTU4 4
ARGU4
ADDRLP4 88
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 88
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1228
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
CNSTI4 720
ASGNI4
ADDRLP4 92
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $1228
LABELV $1226
line 2915
;2915:	}
LABELV $1222
line 2916
;2916:}
LABELV $1187
endproc SetupCustomBot 100 8
export SetUnlimitedWeapons
proc SetUnlimitedWeapons 0 12
line 2918
;2917:
;2918:void SetUnlimitedWeapons( gentity_t *ent ) {
line 2919
;2919:	Set_Ammo(ent, WP_GAUNTLET, -1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2920
;2920:	Set_Ammo(ent, WP_GRAPPLING_HOOK, -1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2921
;2921:	Set_Ammo(ent, WP_TOOLGUN, -1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2922
;2922:	Set_Ammo(ent, WP_PHYSGUN, -1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 17
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2923
;2923:	Set_Ammo(ent, WP_GRAVITYGUN, -1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 18
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2924
;2924:}
LABELV $1230
endproc SetUnlimitedWeapons 0 12
export SetSandboxWeapons
proc SetSandboxWeapons 0 12
line 2926
;2925:
;2926:void SetSandboxWeapons( gentity_t *ent ) {
line 2927
;2927:	if(g_gametype.integer == GT_SANDBOX){
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $1232
line 2928
;2928:		if(g_allowtoolgun.integer){
ADDRGP4 g_allowtoolgun+12
INDIRI4
CNSTI4 0
EQI4 $1235
line 2929
;2929:		Set_Weapon(ent, WP_TOOLGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2930
;2930:		}
LABELV $1235
line 2931
;2931:		if(g_allowphysgun.integer){
ADDRGP4 g_allowphysgun+12
INDIRI4
CNSTI4 0
EQI4 $1238
line 2932
;2932:		Set_Weapon(ent, WP_PHYSGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 17
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2933
;2933:		}
LABELV $1238
line 2934
;2934:		if(g_allowgravitygun.integer){
ADDRGP4 g_allowgravitygun+12
INDIRI4
CNSTI4 0
EQI4 $1241
line 2935
;2935:		Set_Weapon(ent, WP_GRAVITYGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 18
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2936
;2936:		}
LABELV $1241
line 2937
;2937:	}
LABELV $1232
line 2938
;2938:}
LABELV $1231
endproc SetSandboxWeapons 0 12
export SetCustomWeapons
proc SetCustomWeapons 28 12
line 2940
;2939:
;2940:void SetCustomWeapons( gentity_t *ent ) {
line 2941
;2941:	Set_Ammo(ent, WP_GAUNTLET, -1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2942
;2942:	Set_Ammo(ent, WP_GRAPPLING_HOOK, -1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2943
;2943:	Set_Ammo(ent, WP_TOOLGUN, -1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2944
;2944:	Set_Ammo(ent, WP_PHYSGUN, -1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 17
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2945
;2945:	Set_Ammo(ent, WP_GRAVITYGUN, -1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 18
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2946
;2946:	if (ent->client->sess.sessionTeam == TEAM_FREE || ent->client->sess.sessionTeam == TEAM_BLUE) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1247
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $1245
LABELV $1247
line 2947
;2947:		if (g_elimination_gauntlet.integer) {
ADDRGP4 g_elimination_gauntlet+12
INDIRI4
CNSTI4 0
EQI4 $1248
line 2948
;2948:			Set_Weapon(ent, WP_GAUNTLET, 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2949
;2949:		}
LABELV $1248
line 2950
;2950:		if (g_elimination_machinegun.integer > 0) {
ADDRGP4 g_elimination_machinegun+12
INDIRI4
CNSTI4 0
LEI4 $1251
line 2951
;2951:			Set_Weapon(ent, WP_MACHINEGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2952
;2952:			Set_Ammo(ent, WP_MACHINEGUN, g_elimination_machinegun.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 g_elimination_machinegun+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2953
;2953:		}
LABELV $1251
line 2954
;2954:		if (g_elimination_shotgun.integer > 0) {
ADDRGP4 g_elimination_shotgun+12
INDIRI4
CNSTI4 0
LEI4 $1255
line 2955
;2955:			Set_Weapon(ent, WP_SHOTGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2956
;2956:			Set_Ammo(ent, WP_SHOTGUN, g_elimination_shotgun.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 g_elimination_shotgun+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2957
;2957:		}
LABELV $1255
line 2958
;2958:		if (g_elimination_grenade.integer > 0) {
ADDRGP4 g_elimination_grenade+12
INDIRI4
CNSTI4 0
LEI4 $1259
line 2959
;2959:			Set_Weapon(ent, WP_GRENADE_LAUNCHER, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2960
;2960:			Set_Ammo(ent, WP_GRENADE_LAUNCHER, g_elimination_grenade.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 g_elimination_grenade+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2961
;2961:		}
LABELV $1259
line 2962
;2962:		if (g_elimination_rocket.integer > 0) {
ADDRGP4 g_elimination_rocket+12
INDIRI4
CNSTI4 0
LEI4 $1263
line 2963
;2963:			Set_Weapon(ent, WP_ROCKET_LAUNCHER, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2964
;2964:			Set_Ammo(ent, WP_ROCKET_LAUNCHER, g_elimination_rocket.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 g_elimination_rocket+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2965
;2965:		}
LABELV $1263
line 2966
;2966:		if (g_elimination_lightning.integer > 0) {
ADDRGP4 g_elimination_lightning+12
INDIRI4
CNSTI4 0
LEI4 $1267
line 2967
;2967:			Set_Weapon(ent, WP_LIGHTNING, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2968
;2968:			Set_Ammo(ent, WP_LIGHTNING, g_elimination_lightning.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 g_elimination_lightning+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2969
;2969:		}
LABELV $1267
line 2970
;2970:		if (g_elimination_railgun.integer > 0) {
ADDRGP4 g_elimination_railgun+12
INDIRI4
CNSTI4 0
LEI4 $1271
line 2971
;2971:			Set_Weapon(ent, WP_RAILGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2972
;2972:			Set_Ammo(ent, WP_RAILGUN, g_elimination_railgun.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 g_elimination_railgun+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2973
;2973:		}
LABELV $1271
line 2974
;2974:		if (g_elimination_plasmagun.integer > 0) {
ADDRGP4 g_elimination_plasmagun+12
INDIRI4
CNSTI4 0
LEI4 $1275
line 2975
;2975:			Set_Weapon(ent, WP_PLASMAGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2976
;2976:			Set_Ammo(ent, WP_PLASMAGUN, g_elimination_plasmagun.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 g_elimination_plasmagun+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2977
;2977:		}
LABELV $1275
line 2978
;2978:		if (g_elimination_bfg.integer > 0) {
ADDRGP4 g_elimination_bfg+12
INDIRI4
CNSTI4 0
LEI4 $1279
line 2979
;2979:			Set_Weapon(ent, WP_BFG, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2980
;2980:			Set_Ammo(ent, WP_BFG, g_elimination_bfg.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 g_elimination_bfg+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2981
;2981:		}
LABELV $1279
line 2982
;2982:		if (g_elimination_grapple.integer) {
ADDRGP4 g_elimination_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1283
line 2983
;2983:			Set_Weapon(ent, WP_GRAPPLING_HOOK, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2984
;2984:		}
LABELV $1283
line 2985
;2985:		if (g_elimination_nail.integer > 0) {
ADDRGP4 g_elimination_nail+12
INDIRI4
CNSTI4 0
LEI4 $1286
line 2986
;2986:			Set_Weapon(ent, WP_NAILGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2987
;2987:			Set_Ammo(ent, WP_NAILGUN, g_elimination_nail.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 g_elimination_nail+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2988
;2988:		}
LABELV $1286
line 2989
;2989:		if (g_elimination_mine.integer > 0) {
ADDRGP4 g_elimination_mine+12
INDIRI4
CNSTI4 0
LEI4 $1290
line 2990
;2990:			Set_Weapon(ent, WP_PROX_LAUNCHER, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2991
;2991:			Set_Ammo(ent, WP_PROX_LAUNCHER, g_elimination_mine.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 g_elimination_mine+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2992
;2992:		}
LABELV $1290
line 2993
;2993:		if (g_elimination_chain.integer > 0) {
ADDRGP4 g_elimination_chain+12
INDIRI4
CNSTI4 0
LEI4 $1294
line 2994
;2994:			Set_Weapon(ent, WP_CHAINGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2995
;2995:			Set_Ammo(ent, WP_CHAINGUN, g_elimination_chain.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRGP4 g_elimination_chain+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 2996
;2996:		}
LABELV $1294
line 2997
;2997:		if (g_elimination_flame.integer > 0) {
ADDRGP4 g_elimination_flame+12
INDIRI4
CNSTI4 0
LEI4 $1298
line 2998
;2998:			Set_Weapon(ent, WP_FLAMETHROWER, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 2999
;2999:			Set_Ammo(ent, WP_FLAMETHROWER, g_elimination_flame.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRGP4 g_elimination_flame+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3000
;3000:		}
LABELV $1298
line 3001
;3001:		if (g_elimination_antimatter.integer > 0) {
ADDRGP4 g_elimination_antimatter+12
INDIRI4
CNSTI4 0
LEI4 $1302
line 3002
;3002:			Set_Weapon(ent, WP_ANTIMATTER, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 15
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3003
;3003:			Set_Ammo(ent, WP_ANTIMATTER, g_elimination_antimatter.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 15
ARGI4
ADDRGP4 g_elimination_antimatter+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3004
;3004:		}
LABELV $1302
line 3005
;3005:		if(g_elimination_quad.integer) {
ADDRGP4 g_elimination_quad+12
INDIRI4
CNSTI4 0
EQI4 $1306
line 3006
;3006:			ent->client->ps.powerups[PW_QUAD] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 316
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3007
;3007:			ent->client->ps.powerups[PW_QUAD] +=  g_elimination_quad.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 316
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_elimination_quad+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3008
;3008:		}
LABELV $1306
line 3009
;3009:		if(g_elimination_regen.integer) {
ADDRGP4 g_elimination_regen+12
INDIRI4
CNSTI4 0
EQI4 $1312
line 3010
;3010:			ent->client->ps.powerups[PW_REGEN] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 332
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3011
;3011:			ent->client->ps.powerups[PW_REGEN] +=  g_elimination_regen.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 332
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_elimination_regen+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3012
;3012:		}
LABELV $1312
line 3013
;3013:		if(g_elimination_haste.integer) {
ADDRGP4 g_elimination_haste+12
INDIRI4
CNSTI4 0
EQI4 $1318
line 3014
;3014:			ent->client->ps.powerups[PW_HASTE] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3015
;3015:			ent->client->ps.powerups[PW_HASTE] +=  g_elimination_haste.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_elimination_haste+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3016
;3016:		}
LABELV $1318
line 3017
;3017:		if(g_elimination_bsuit.integer) {
ADDRGP4 g_elimination_bsuit+12
INDIRI4
CNSTI4 0
EQI4 $1324
line 3018
;3018:			ent->client->ps.powerups[PW_BATTLESUIT] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 320
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3019
;3019:			ent->client->ps.powerups[PW_BATTLESUIT] +=  g_elimination_bsuit.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 320
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_elimination_bsuit+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3020
;3020:		}
LABELV $1324
line 3021
;3021:		if(g_elimination_invis.integer) {
ADDRGP4 g_elimination_invis+12
INDIRI4
CNSTI4 0
EQI4 $1330
line 3022
;3022:			ent->client->ps.powerups[PW_INVIS] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3023
;3023:			ent->client->ps.powerups[PW_INVIS] +=  g_elimination_invis.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_elimination_invis+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3024
;3024:		}
LABELV $1330
line 3025
;3025:		if(g_elimination_flight.integer) {
ADDRGP4 g_elimination_flight+12
INDIRI4
CNSTI4 0
EQI4 $1336
line 3026
;3026:			ent->client->ps.powerups[PW_FLIGHT] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 336
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3027
;3027:			ent->client->ps.powerups[PW_FLIGHT] +=  g_elimination_flight.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_elimination_flight+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3028
;3028:		}
LABELV $1336
line 3029
;3029:		if(g_elimination_holdable.integer == 1) {
ADDRGP4 g_elimination_holdable+12
INDIRI4
CNSTI4 1
NEI4 $1342
line 3030
;3030:			ent->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_TELEPORTER);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 3031
;3031:		}
LABELV $1342
line 3032
;3032:		if(g_elimination_holdable.integer == 2) {
ADDRGP4 g_elimination_holdable+12
INDIRI4
CNSTI4 2
NEI4 $1345
line 3033
;3033:			ent->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_MEDKIT);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 3034
;3034:		}
LABELV $1345
line 3035
;3035:		if(g_elimination_holdable.integer == 3) {
ADDRGP4 g_elimination_holdable+12
INDIRI4
CNSTI4 3
NEI4 $1348
line 3036
;3036:			ent->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_KAMIKAZE);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 3037
;3037:			ent->client->ps.eFlags |= EF_KAMIKAZE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 3038
;3038:		}
LABELV $1348
line 3039
;3039:		if(g_elimination_holdable.integer == 4) {
ADDRGP4 g_elimination_holdable+12
INDIRI4
CNSTI4 4
NEI4 $1351
line 3040
;3040:			ent->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_INVULNERABILITY);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 3041
;3041:		}
LABELV $1351
line 3042
;3042:		if(g_elimination_holdable.integer == 5) {
ADDRGP4 g_elimination_holdable+12
INDIRI4
CNSTI4 5
NEI4 $1354
line 3043
;3043:			ent->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_PORTAL);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 3044
;3044:		}
LABELV $1354
line 3046
;3045:
;3046:		ent->health = ent->client->ps.stats[STAT_ARMOR] = g_elimination_startArmor.integer;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRGP4 g_elimination_startArmor+12
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 3047
;3047:		ent->health = ent->client->ps.stats[STAT_HEALTH] = g_elimination_startHealth.integer;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRGP4 g_elimination_startHealth+12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 3048
;3048:		if(ent->botskill == 7){
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 7
NEI4 $1359
line 3049
;3049:			ent->health = ent->client->ps.stats[STAT_HEALTH] = 65000;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 65000
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 3050
;3050:		}
LABELV $1359
line 3051
;3051:		ent->helpme = 0;
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
CNSTI4 0
ASGNI4
line 3052
;3052:	}
LABELV $1245
line 3053
;3053:	if (ent->client->sess.sessionTeam == TEAM_RED) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1361
line 3054
;3054:		if (g_eliminationred_gauntlet.integer) {
ADDRGP4 g_eliminationred_gauntlet+12
INDIRI4
CNSTI4 0
EQI4 $1363
line 3055
;3055:			Set_Weapon(ent, WP_GAUNTLET, 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3056
;3056:		}
LABELV $1363
line 3057
;3057:		if (g_eliminationred_machinegun.integer > 0) {
ADDRGP4 g_eliminationred_machinegun+12
INDIRI4
CNSTI4 0
LEI4 $1366
line 3058
;3058:			Set_Weapon(ent, WP_MACHINEGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3059
;3059:			Set_Ammo(ent, WP_MACHINEGUN, g_eliminationred_machinegun.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 g_eliminationred_machinegun+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3060
;3060:		}
LABELV $1366
line 3061
;3061:		if (g_eliminationred_shotgun.integer > 0) {
ADDRGP4 g_eliminationred_shotgun+12
INDIRI4
CNSTI4 0
LEI4 $1370
line 3062
;3062:			Set_Weapon(ent, WP_SHOTGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3063
;3063:			Set_Ammo(ent, WP_SHOTGUN, g_eliminationred_shotgun.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 g_eliminationred_shotgun+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3064
;3064:		}
LABELV $1370
line 3065
;3065:		if (g_eliminationred_grenade.integer > 0) {
ADDRGP4 g_eliminationred_grenade+12
INDIRI4
CNSTI4 0
LEI4 $1374
line 3066
;3066:			Set_Weapon(ent, WP_GRENADE_LAUNCHER, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3067
;3067:			Set_Ammo(ent, WP_GRENADE_LAUNCHER, g_eliminationred_grenade.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 g_eliminationred_grenade+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3068
;3068:		}
LABELV $1374
line 3069
;3069:		if (g_eliminationred_rocket.integer > 0) {
ADDRGP4 g_eliminationred_rocket+12
INDIRI4
CNSTI4 0
LEI4 $1378
line 3070
;3070:			Set_Weapon(ent, WP_ROCKET_LAUNCHER, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3071
;3071:			Set_Ammo(ent, WP_ROCKET_LAUNCHER, g_eliminationred_rocket.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 g_eliminationred_rocket+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3072
;3072:		}
LABELV $1378
line 3073
;3073:		if (g_eliminationred_lightning.integer > 0) {
ADDRGP4 g_eliminationred_lightning+12
INDIRI4
CNSTI4 0
LEI4 $1382
line 3074
;3074:			Set_Weapon(ent, WP_LIGHTNING, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3075
;3075:			Set_Ammo(ent, WP_LIGHTNING, g_eliminationred_lightning.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 g_eliminationred_lightning+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3076
;3076:		}
LABELV $1382
line 3077
;3077:		if (g_eliminationred_railgun.integer > 0) {
ADDRGP4 g_eliminationred_railgun+12
INDIRI4
CNSTI4 0
LEI4 $1386
line 3078
;3078:			Set_Weapon(ent, WP_RAILGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3079
;3079:			Set_Ammo(ent, WP_RAILGUN, g_eliminationred_railgun.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 g_eliminationred_railgun+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3080
;3080:		}
LABELV $1386
line 3081
;3081:		if (g_eliminationred_plasmagun.integer > 0) {
ADDRGP4 g_eliminationred_plasmagun+12
INDIRI4
CNSTI4 0
LEI4 $1390
line 3082
;3082:			Set_Weapon(ent, WP_PLASMAGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3083
;3083:			Set_Ammo(ent, WP_PLASMAGUN, g_eliminationred_plasmagun.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 g_eliminationred_plasmagun+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3084
;3084:		}
LABELV $1390
line 3085
;3085:		if (g_eliminationred_bfg.integer > 0) {
ADDRGP4 g_eliminationred_bfg+12
INDIRI4
CNSTI4 0
LEI4 $1394
line 3086
;3086:			Set_Weapon(ent, WP_BFG, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3087
;3087:			Set_Ammo(ent, WP_BFG, g_eliminationred_bfg.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 g_eliminationred_bfg+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3088
;3088:		}
LABELV $1394
line 3089
;3089:		if (g_eliminationred_grapple.integer) {
ADDRGP4 g_eliminationred_grapple+12
INDIRI4
CNSTI4 0
EQI4 $1398
line 3090
;3090:			Set_Weapon(ent, WP_GRAPPLING_HOOK, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3091
;3091:		}
LABELV $1398
line 3092
;3092:		if (g_eliminationred_nail.integer > 0) {
ADDRGP4 g_eliminationred_nail+12
INDIRI4
CNSTI4 0
LEI4 $1401
line 3093
;3093:			Set_Weapon(ent, WP_NAILGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3094
;3094:			Set_Ammo(ent, WP_NAILGUN, g_eliminationred_nail.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 g_eliminationred_nail+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3095
;3095:		}
LABELV $1401
line 3096
;3096:		if (g_eliminationred_mine.integer > 0) {
ADDRGP4 g_eliminationred_mine+12
INDIRI4
CNSTI4 0
LEI4 $1405
line 3097
;3097:			Set_Weapon(ent, WP_PROX_LAUNCHER, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3098
;3098:			Set_Ammo(ent, WP_PROX_LAUNCHER, g_eliminationred_mine.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 g_eliminationred_mine+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3099
;3099:		}
LABELV $1405
line 3100
;3100:		if (g_eliminationred_chain.integer > 0) {
ADDRGP4 g_eliminationred_chain+12
INDIRI4
CNSTI4 0
LEI4 $1409
line 3101
;3101:			Set_Weapon(ent, WP_CHAINGUN, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3102
;3102:			Set_Ammo(ent, WP_CHAINGUN, g_eliminationred_chain.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRGP4 g_eliminationred_chain+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3103
;3103:		}
LABELV $1409
line 3104
;3104:		if (g_eliminationred_flame.integer > 0) {
ADDRGP4 g_eliminationred_flame+12
INDIRI4
CNSTI4 0
LEI4 $1413
line 3105
;3105:			Set_Weapon(ent, WP_FLAMETHROWER, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3106
;3106:			Set_Ammo(ent, WP_FLAMETHROWER, g_eliminationred_flame.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRGP4 g_eliminationred_flame+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3107
;3107:		}
LABELV $1413
line 3108
;3108:		if (g_eliminationred_antimatter.integer > 0) {
ADDRGP4 g_eliminationred_antimatter+12
INDIRI4
CNSTI4 0
LEI4 $1417
line 3109
;3109:			Set_Weapon(ent, WP_ANTIMATTER, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 15
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 3110
;3110:			Set_Ammo(ent, WP_ANTIMATTER, g_eliminationred_antimatter.integer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 15
ARGI4
ADDRGP4 g_eliminationred_antimatter+12
INDIRI4
ARGI4
ADDRGP4 Set_Ammo
CALLV
pop
line 3111
;3111:		}
LABELV $1417
line 3112
;3112:		if(g_eliminationred_quad.integer) {
ADDRGP4 g_eliminationred_quad+12
INDIRI4
CNSTI4 0
EQI4 $1421
line 3113
;3113:			ent->client->ps.powerups[PW_QUAD] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 316
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3114
;3114:			ent->client->ps.powerups[PW_QUAD] +=  g_eliminationred_quad.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 316
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_eliminationred_quad+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3115
;3115:		}
LABELV $1421
line 3116
;3116:		if(g_eliminationred_regen.integer) {
ADDRGP4 g_eliminationred_regen+12
INDIRI4
CNSTI4 0
EQI4 $1427
line 3117
;3117:			ent->client->ps.powerups[PW_REGEN] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 332
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3118
;3118:			ent->client->ps.powerups[PW_REGEN] +=  g_eliminationred_regen.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 332
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_eliminationred_regen+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3119
;3119:		}
LABELV $1427
line 3120
;3120:		if(g_eliminationred_haste.integer) {
ADDRGP4 g_eliminationred_haste+12
INDIRI4
CNSTI4 0
EQI4 $1433
line 3121
;3121:			ent->client->ps.powerups[PW_HASTE] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3122
;3122:			ent->client->ps.powerups[PW_HASTE] +=  g_eliminationred_haste.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_eliminationred_haste+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3123
;3123:		}
LABELV $1433
line 3124
;3124:		if(g_eliminationred_bsuit.integer) {
ADDRGP4 g_eliminationred_bsuit+12
INDIRI4
CNSTI4 0
EQI4 $1439
line 3125
;3125:			ent->client->ps.powerups[PW_BATTLESUIT] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 320
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3126
;3126:			ent->client->ps.powerups[PW_BATTLESUIT] +=  g_eliminationred_bsuit.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 320
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_eliminationred_bsuit+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3127
;3127:		}
LABELV $1439
line 3128
;3128:		if(g_eliminationred_invis.integer) {
ADDRGP4 g_eliminationred_invis+12
INDIRI4
CNSTI4 0
EQI4 $1445
line 3129
;3129:			ent->client->ps.powerups[PW_INVIS] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3130
;3130:			ent->client->ps.powerups[PW_INVIS] +=  g_eliminationred_invis.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_eliminationred_invis+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3131
;3131:		}
LABELV $1445
line 3132
;3132:		if(g_eliminationred_flight.integer) {
ADDRGP4 g_eliminationred_flight+12
INDIRI4
CNSTI4 0
EQI4 $1451
line 3133
;3133:			ent->client->ps.powerups[PW_FLIGHT] =  level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 336
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 3134
;3134:			ent->client->ps.powerups[PW_FLIGHT] +=  g_eliminationred_flight.integer * 1000;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDRGP4 g_eliminationred_flight+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3135
;3135:		}
LABELV $1451
line 3136
;3136:		if(g_eliminationred_holdable.integer == 1) {
ADDRGP4 g_eliminationred_holdable+12
INDIRI4
CNSTI4 1
NEI4 $1457
line 3137
;3137:			ent->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_TELEPORTER);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 3138
;3138:		}
LABELV $1457
line 3139
;3139:		if(g_eliminationred_holdable.integer == 2) {
ADDRGP4 g_eliminationred_holdable+12
INDIRI4
CNSTI4 2
NEI4 $1460
line 3140
;3140:			ent->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_MEDKIT);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 3141
;3141:		}
LABELV $1460
line 3142
;3142:		if(g_eliminationred_holdable.integer == 3) {
ADDRGP4 g_eliminationred_holdable+12
INDIRI4
CNSTI4 3
NEI4 $1463
line 3143
;3143:			ent->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_KAMIKAZE);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 3144
;3144:			ent->client->ps.eFlags |= EF_KAMIKAZE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 3145
;3145:		}
LABELV $1463
line 3146
;3146:		if(g_eliminationred_holdable.integer == 4) {
ADDRGP4 g_eliminationred_holdable+12
INDIRI4
CNSTI4 4
NEI4 $1466
line 3147
;3147:			ent->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_INVULNERABILITY);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 3148
;3148:		}
LABELV $1466
line 3149
;3149:		if(g_eliminationred_holdable.integer == 5) {
ADDRGP4 g_eliminationred_holdable+12
INDIRI4
CNSTI4 5
NEI4 $1469
line 3150
;3150:			ent->client->ps.stats[STAT_HOLDABLE_ITEM] |= (1 << HI_PORTAL);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 3151
;3151:		}
LABELV $1469
line 3153
;3152:
;3153:		ent->health = ent->client->ps.stats[STAT_ARMOR] = g_eliminationred_startArmor.integer;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRGP4 g_eliminationred_startArmor+12
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 3154
;3154:		ent->health = ent->client->ps.stats[STAT_HEALTH] = g_eliminationred_startHealth.integer;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRGP4 g_eliminationred_startHealth+12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 3155
;3155:		if(ent->botskill == 7){
ADDRFP4 0
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 7
NEI4 $1474
line 3156
;3156:			ent->health = ent->client->ps.stats[STAT_HEALTH] = 65000;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 65000
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 3157
;3157:		}
LABELV $1474
line 3158
;3158:		ent->helpme = 0;
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
CNSTI4 0
ASGNI4
line 3159
;3159:	}
LABELV $1361
line 3160
;3160:}
LABELV $1244
endproc SetCustomWeapons 28 12
export LinkBotSpawnEntity
proc LinkBotSpawnEntity 24 12
line 3170
;3161:
;3162:
;3163:/*
;3164:===========
;3165:LinkBotSpawnEntity
;3166:
;3167:Links a bot to the entity that spawned it
;3168:============
;3169:*/
;3170:void LinkBotSpawnEntity( gentity_t *bot, char parentid[] ) {
line 3174
;3171:	gentity_t	*t;
;3172:	int			entityNum;
;3173:	
;3174:	if ( !bot )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1477
line 3175
;3175:		return;
ADDRGP4 $1476
JUMPV
LABELV $1477
line 3177
;3176:
;3177:	if ( !parentid || !strcmp(parentid, "") )
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1481
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $1179
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1479
LABELV $1481
line 3178
;3178:		return;
ADDRGP4 $1476
JUMPV
LABELV $1479
line 3180
;3179:
;3180:	entityNum = atoi(parentid);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 3182
;3181:
;3182:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 3183
;3183:	bot->botspawn = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTP4 0
ASGNP4
ADDRGP4 $1483
JUMPV
LABELV $1482
line 3184
;3184:	while ( (t = G_Find (t, FOFS(classname), "target_botspawn")) != NULL ) {
line 3185
;3185:		if ( t->s.number == entityNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1486
line 3186
;3186:			bot->botspawn = t;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3187
;3187:		}
LABELV $1486
line 3188
;3188:	}
LABELV $1483
line 3184
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 564
ARGI4
ADDRGP4 $1485
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1482
line 3189
;3189:}
LABELV $1476
endproc LinkBotSpawnEntity 24 12
import G_UpdateClientWithSessionData
import IsBot
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
import ClientCommand
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
import CalculateRanks
import AddScore
import player_die
import InitClientResp
import InitClientPersistant
import BeginIntermission
import EndEliminationRound
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
LABELV $1485
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1186
byte 1 68
byte 1 82
byte 1 95
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 78
byte 1 84
byte 1 95
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 0
align 1
LABELV $1185
byte 1 32
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $1179
byte 1 0
align 1
LABELV $1178
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1174
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
LABELV $1160
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $898
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $840
byte 1 76
byte 1 77
byte 1 83
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 34
byte 1 32
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $802
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $799
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $765
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 0
align 1
LABELV $763
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 81
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 32
byte 1 66
byte 1 121
byte 1 32
byte 1 78
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 46
byte 1 100
byte 1 101
byte 1 118
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $762
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 101
byte 1 110
byte 1 115
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $761
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 101
byte 1 110
byte 1 115
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 79
byte 1 78
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $750
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $747
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $746
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $743
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $715
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 71
byte 1 85
byte 1 73
byte 1 68
byte 1 0
align 1
LABELV $703
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $701
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $696
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $693
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $690
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $689
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 73
byte 1 80
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $684
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $683
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 92
byte 1 105
byte 1 100
byte 1 92
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $682
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 114
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 103
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 98
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 114
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 103
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 98
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 112
byte 1 114
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 112
byte 1 103
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 112
byte 1 98
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 112
byte 1 103
byte 1 95
byte 1 114
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 112
byte 1 103
byte 1 95
byte 1 103
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 112
byte 1 103
byte 1 95
byte 1 98
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 115
byte 1 105
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 118
byte 1 110
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $681
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 118
byte 1 110
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $678
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $677
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $676
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 71
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $675
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $674
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $673
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $672
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $671
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $670
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $669
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $668
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $667
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $666
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $665
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $664
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $651
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
LABELV $647
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $642
byte 1 98
byte 1 0
align 1
LABELV $641
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $637
byte 1 114
byte 1 0
align 1
LABELV $636
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $633
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $622
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $621
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $620
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $619
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $618
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $617
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $610
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $606
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $601
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $588
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $587
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $584
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $577
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $572
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $569
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $565
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $559
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 109
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 40
byte 1 103
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 80
byte 1 101
byte 1 114
byte 1 105
byte 1 111
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $552
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $551
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 78
byte 1 117
byte 1 100
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $548
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $545
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $544
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $541
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $540
byte 1 92
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 92
byte 1 98
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $536
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $483
byte 1 66
byte 1 111
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 33
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $463
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 119
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $348
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $333
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $329
byte 1 37
byte 1 115
byte 1 44
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $328
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $254
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $219
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $190
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
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $83
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
byte 1 100
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $81
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
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $79
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
byte 1 100
byte 1 0
align 1
LABELV $76
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
LABELV $71
byte 1 110
byte 1 111
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $68
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $67
byte 1 48
byte 1 0
align 1
LABELV $66
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
