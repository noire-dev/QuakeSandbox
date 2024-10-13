export InitTrigger
code
proc InitTrigger 12 8
file "../../../code/game/g_trigger.c"
line 26
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
;25:
;26:void InitTrigger( gentity_t *self ) {
line 27
;27:	if (!VectorCompare (self->s.angles, vec3_origin))
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $65
line 28
;28:		G_SetMovedir (self->s.angles, self->movedir);
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
LABELV $65
line 30
;29:
;30:	if(!self->sandboxObject){
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
NEI4 $67
line 31
;31:	trap_SetBrushModel( self, self->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 580
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 32
;32:	}
LABELV $67
line 33
;33:	self->r.contents = CONTENTS_TRIGGER;		// replaces the -1 from trap_SetBrushModel
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 34
;34:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTI4 1
ASGNI4
line 35
;35:}
LABELV $64
endproc InitTrigger 12 8
export multi_wait
proc multi_wait 0 0
line 39
;36:
;37:
;38:// the wait time has passed, so set back up for another activation
;39:void multi_wait( gentity_t *ent ) {
line 40
;40:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 41
;41:}
LABELV $69
endproc multi_wait 0 0
export multi_trigger
proc multi_trigger 24 8
line 47
;42:
;43:
;44:// the trigger was just activated
;45:// ent->activator should be set to the activator so it can be held through a delay
;46:// so wait for the delay time before firing
;47:void multi_trigger( gentity_t *ent, gentity_t *activator ) {
line 49
;48:	//if nobots flag is set and activator is a bot, do nothing
;49:	if ( (ent->flags & FL_NO_BOTS) && IsBot( activator ) )
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $71
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 IsBot
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $71
line 50
;50:		return;
ADDRGP4 $70
JUMPV
LABELV $71
line 53
;51:
;52:	//if nohumans flag is set and activtaor is a human, do nothing
;53:	if ( (ent->flags & FL_NO_HUMANS) && !IsBot( activator ) )
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $73
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 IsBot
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $73
line 54
;54:		return;
ADDRGP4 $70
JUMPV
LABELV $73
line 56
;55:	
;56:	if(strlen(ent->message) >= 1){
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $75
line 57
;57:	if(!Q_stricmp (activator->botspawn->message, ent->message)){
ADDRLP4 12
CNSTI4 680
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $70
line 59
;58:	
;59:	} else {
line 60
;60:	return;
LABELV $78
line 62
;61:	}
;62:	}
LABELV $75
line 65
;63:	
;64:	
;65:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 66
;66:	if ( ent->nextthink ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $79
line 67
;67:		return;		// can't retrigger until the wait is over
ADDRGP4 $70
JUMPV
LABELV $79
line 70
;68:	}
;69:
;70:	if ( activator->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $81
line 71
;71:		if ( ( ent->spawnflags & 1 ) &&
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
BANDI4
CNSTI4 0
EQI4 $83
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $83
line 72
;72:			activator->client->sess.sessionTeam != TEAM_RED ) {
line 73
;73:			return;
ADDRGP4 $70
JUMPV
LABELV $83
line 75
;74:		}
;75:		if ( ( ent->spawnflags & 2 ) &&
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
CNSTI4 0
EQI4 $85
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $85
line 76
;76:			activator->client->sess.sessionTeam != TEAM_BLUE ) {
line 77
;77:			return;
ADDRGP4 $70
JUMPV
LABELV $85
line 79
;78:		}
;79:	}
LABELV $81
line 81
;80:
;81:	G_UseTargets (ent, ent->activator);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 968
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 83
;82:
;83:	if ( ent->wait > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CNSTF4 0
LEF4 $87
line 84
;84:		ent->think = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 85
;85:		ent->nextthink = level.time + ( ent->wait + ent->random * crandom() ) * 1000;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 20
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 16
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
line 86
;86:	} else {
ADDRGP4 $88
JUMPV
LABELV $87
line 89
;87:		// we can't just remove (self) here, because this is a touch function
;88:		// called while looping through area links...
;89:		ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTP4 0
ASGNP4
line 90
;90:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 91
;91:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 92
;92:	}
LABELV $88
line 93
;93:}
LABELV $70
endproc multi_trigger 24 8
export Use_Multi
proc Use_Multi 12 12
line 95
;94:
;95:void Use_Multi( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 98
;96:	usercmd_t	*ucmd;
;97:	
;98:ucmd = &activator->client->pers.cmd;
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ASGNP4
line 100
;99:		
;100:if(ent->owner != activator->s.clientNum + 1){
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 1
ADDI4
EQI4 $92
line 101
;101:if(ent->owner != 0){
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
CNSTI4 0
EQI4 $94
line 102
;102:trap_SendServerCommand( activator->s.clientNum, va( "cp \"Owned by %s\n\"", ent->ownername ));
ADDRGP4 $96
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 103
;103:return;
ADDRGP4 $91
JUMPV
LABELV $94
line 105
;104:}	
;105:}
LABELV $92
line 106
;106:if(ent->locked != 0){
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $97
line 107
;107:return;
ADDRGP4 $91
JUMPV
LABELV $97
line 110
;108:}
;109:
;110:if(ent->price > 0){
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
LEI4 $99
line 112
;111:	
;112:if(activator->client->pers.oldmoney < ent->price){	
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
GEI4 $101
line 113
;113:if(ucmd->buttons & BUTTON_GESTURE){
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $103
line 114
;114:trap_SendServerCommand( activator->s.clientNum, va( "lp \"%i is not enough\"\n", ent->price - activator->client->pers.oldmoney ));
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 115
;115:return;	
ADDRGP4 $91
JUMPV
LABELV $103
line 116
;116:} else {
line 117
;117:trap_SendServerCommand( activator->s.clientNum, va( "lp \"^1%s %i$\"\n", ent->messageru, ent->price ));
ADDRGP4 $106
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 118
;118:return;		
ADDRGP4 $91
JUMPV
LABELV $101
line 122
;119:}
;120:}
;121:
;122:if(activator->client->pers.oldmoney >= ent->price){	
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
LTI4 $107
line 123
;123:if(ucmd->buttons & BUTTON_GESTURE){
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $109
line 124
;124:trap_SendServerCommand( activator->s.clientNum, va( "lp \"%s purchased\"\n", ent->messageru, ent->price ));
ADDRGP4 $111
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 125
;125:} else {
ADDRGP4 $110
JUMPV
LABELV $109
line 126
;126:trap_SendServerCommand( activator->s.clientNum, va( "lp \"^2%s %i$\"\n", ent->messageru, ent->price ));
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 127
;127:return;		
ADDRGP4 $91
JUMPV
LABELV $110
line 129
;128:}
;129:}
LABELV $107
line 131
;130:
;131:}
LABELV $99
line 134
;132:
;133:
;134:if(ent->price == -1){
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $113
line 136
;135:	
;136:if(ucmd->buttons & BUTTON_GESTURE){
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $115
line 137
;137:trap_SendServerCommand( activator->s.clientNum, va( "lp \"%s activated\"\n", ent->messageru));
ADDRGP4 $117
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
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 138
;138:} else {
ADDRGP4 $116
JUMPV
LABELV $115
line 139
;139:trap_SendServerCommand( activator->s.clientNum, va( "lp \"^2%s\"\n", ent->messageru));
ADDRGP4 $118
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
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 140
;140:return;
ADDRGP4 $91
JUMPV
LABELV $116
line 143
;141:}
;142:
;143:}
LABELV $113
line 147
;144:
;145:
;146:
;147:	multi_trigger( ent, activator );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 148
;148:}
LABELV $91
endproc Use_Multi 12 12
export Touch_Multi
proc Touch_Multi 12 12
line 150
;149:
;150:void Touch_Multi( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 153
;151:	usercmd_t	*ucmd;
;152:	
;153:ucmd = &other->client->pers.cmd;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ASGNP4
line 155
;154:
;155:	if( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $120
line 156
;156:		return;
ADDRGP4 $119
JUMPV
LABELV $120
line 158
;157:	}
;158:if(self->owner != other->s.clientNum + 1){
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 1
ADDI4
EQI4 $122
line 159
;159:if(self->owner != 0){
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
CNSTI4 0
EQI4 $124
line 160
;160:trap_SendServerCommand( other->s.clientNum, va( "cp \"Owned by %s\n\"", self->ownername ));
ADDRGP4 $96
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 161
;161:return;
ADDRGP4 $119
JUMPV
LABELV $124
line 163
;162:}	
;163:}
LABELV $122
line 164
;164:if(self->locked != 0){
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $126
line 165
;165:return;
ADDRGP4 $119
JUMPV
LABELV $126
line 168
;166:}
;167:
;168:if(self->price > 0){
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
LEI4 $128
line 170
;169:	
;170:if(other->client->pers.oldmoney < self->price){	
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
GEI4 $130
line 171
;171:if(ucmd->buttons & BUTTON_GESTURE){
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $132
line 172
;172:trap_SendServerCommand( other->s.clientNum, va( "lp \"%i is not enough\"\n", self->price - other->client->pers.oldmoney ));
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 173
;173:return;	
ADDRGP4 $119
JUMPV
LABELV $132
line 174
;174:} else {
line 175
;175:trap_SendServerCommand( other->s.clientNum, va( "lp \"^1%s %i$\"\n", self->messageru, self->price ));
ADDRGP4 $106
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 176
;176:return;		
ADDRGP4 $119
JUMPV
LABELV $130
line 180
;177:}
;178:}
;179:
;180:if(other->client->pers.oldmoney >= self->price){	
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
LTI4 $134
line 181
;181:if(ucmd->buttons & BUTTON_GESTURE){
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $136
line 182
;182:trap_SendServerCommand( other->s.clientNum, va( "lp \"%s purchased\"\n", self->messageru, self->price ));
ADDRGP4 $111
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 183
;183:} else {
ADDRGP4 $137
JUMPV
LABELV $136
line 184
;184:trap_SendServerCommand( other->s.clientNum, va( "lp \"^2%s %i$\"\n", self->messageru, self->price ));
ADDRGP4 $112
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 684
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 185
;185:return;		
ADDRGP4 $119
JUMPV
LABELV $137
line 187
;186:}
;187:}
LABELV $134
line 189
;188:
;189:}
LABELV $128
line 192
;190:
;191:
;192:if(self->price == -1){
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $138
line 194
;193:	
;194:if(ucmd->buttons & BUTTON_GESTURE){
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $140
line 195
;195:trap_SendServerCommand( other->s.clientNum, va( "lp \"%s activated\"\n", self->messageru));
ADDRGP4 $117
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
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 196
;196:} else {
ADDRGP4 $141
JUMPV
LABELV $140
line 197
;197:trap_SendServerCommand( other->s.clientNum, va( "lp \"^2%s\"\n", self->messageru));
ADDRGP4 $118
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
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 198
;198:return;
ADDRGP4 $119
JUMPV
LABELV $141
line 201
;199:}
;200:
;201:}
LABELV $138
line 203
;202:
;203:	multi_trigger( self, other );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 204
;204:}
LABELV $119
endproc Touch_Multi 12 12
export SP_trigger_multiple
proc SP_trigger_multiple 16 12
line 213
;205:
;206:/*QUAKED trigger_multiple (.5 .5 .5) ?
;207:"wait" : Seconds between triggerings, 0.5 default, -1 = one time only.
;208:"random"	wait variance, default is 0
;209:Variable sized repeatable trigger.  Must be targeted at one or more entities.
;210:so, the basic time between firing is a random time between
;211:(wait - random) and (wait + random)
;212:*/
;213:void SP_trigger_multiple( gentity_t *ent ) {
line 216
;214:	int		i;
;215:
;216:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $143
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 217
;217:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $145
line 218
;218:		ent->flags |= FL_NO_BOTS;
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
line 219
;219:	}
LABELV $145
line 220
;220:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $147
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 221
;221:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $148
line 222
;222:		ent->flags |= FL_NO_HUMANS;
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
line 223
;223:	}
LABELV $148
line 225
;224:	
;225:	G_SpawnFloat( "wait", "0.5", &ent->wait );
ADDRGP4 $150
ARGP4
ADDRGP4 $151
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 226
;226:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $152
ARGP4
ADDRGP4 $144
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 228
;227:
;228:	if ( ent->random >= ent->wait && ent->wait >= 0 ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LTF4 $153
ADDRLP4 8
INDIRF4
CNSTF4 0
LTF4 $153
line 229
;229:		ent->random = ent->wait - FRAMETIME;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1016
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 230
;230:                G_Printf( "trigger_multiple has random >= wait\n" );
ADDRGP4 $155
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 231
;231:	}
LABELV $153
line 233
;232:
;233:	ent->touch = Touch_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 Touch_Multi
ASGNP4
line 234
;234:	ent->use = Use_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_Multi
ASGNP4
line 236
;235:
;236:	InitTrigger( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 237
;237:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 238
;238:}
LABELV $142
endproc SP_trigger_multiple 16 12
export trigger_always_think
proc trigger_always_think 4 8
line 250
;239:
;240:
;241:
;242:/*
;243:==============================================================================
;244:
;245:trigger_always
;246:
;247:==============================================================================
;248:*/
;249:
;250:void trigger_always_think( gentity_t *ent ) {
line 251
;251:	G_UseTargets(ent, ent);
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
ADDRGP4 G_UseTargets
CALLV
pop
line 252
;252:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 253
;253:}
LABELV $156
endproc trigger_always_think 4 8
export SP_trigger_always
proc SP_trigger_always 0 0
line 258
;254:
;255:/*QUAKED trigger_always (.5 .5 .5) (-8 -8 -8) (8 8 8)
;256:This trigger will always fire.  It is activated by the world.
;257:*/
;258:void SP_trigger_always (gentity_t *ent) {
line 260
;259:	// we must have some delay to make sure our use targets are present
;260:	ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 261
;261:	ent->think = trigger_always_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 trigger_always_think
ASGNP4
line 262
;262:}
LABELV $157
endproc SP_trigger_always 0 0
export trigger_push_touch
proc trigger_push_touch 8 12
line 276
;263:
;264:
;265:/*
;266:==============================================================================
;267:
;268:trigger_push
;269:
;270:==============================================================================
;271:*/
;272:
;273:/*QUAKED trigger_push SILENT 
;274:This trigger will push a player or bot towards a targeted entity.
;275:*/
;276:void trigger_push_touch (gentity_t *self, gentity_t *other, trace_t *trace ) {
line 278
;277:
;278:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $160
line 279
;279:		return;
ADDRGP4 $159
JUMPV
LABELV $160
line 282
;280:	}
;281:
;282:	BG_TouchJumpPad( &other->client->ps, &self->s, !(self->spawnflags & 1) );
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $163
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $163
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $164
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BG_TouchJumpPad
CALLV
pop
line 283
;283:}
LABELV $159
endproc trigger_push_touch 8 12
export AimAtTarget
proc AimAtTarget 72 4
line 293
;284:
;285:
;286:/*
;287:=================
;288:AimAtTarget
;289:
;290:Calculate origin2 so the target apogee will be hit
;291:=================
;292:*/
;293:void AimAtTarget( gentity_t *self ) {
line 299
;294:	gentity_t	*ent;
;295:	vec3_t		origin;
;296:	float		height, gravity, time, forward;
;297:	float		dist;
;298:
;299:	VectorAdd( self->r.absmin, self->r.absmax, origin );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 520
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 512
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 524
ADDP4
INDIRF4
ADDF4
ASGNF4
line 300
;300:	VectorScale ( origin, 0.5, origin );
ADDRLP4 44
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 44
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
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
line 302
;301:
;302:	ent = G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 48
INDIRP4
ASGNP4
line 303
;303:	if ( !ent ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $172
line 304
;304:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 305
;305:		return;
ADDRGP4 $165
JUMPV
LABELV $172
line 308
;306:	}
;307:
;308:	height = ent->s.origin[2] - origin[2];
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 309
;309:	gravity = g_gravity.value*g_gravityModifier.value;
ADDRLP4 24
ADDRGP4 g_gravity+8
INDIRF4
ADDRGP4 g_gravityModifier+8
INDIRF4
MULF4
ASGNF4
line 310
;310:	time = sqrt( height / ( .5 * gravity ) );
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
ADDRLP4 24
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 52
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 52
INDIRF4
ASGNF4
line 311
;311:	if ( !time ) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $177
line 312
;312:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 313
;313:		return;
ADDRGP4 $165
JUMPV
LABELV $177
line 317
;314:	}
;315:
;316:	// set s.origin2 to the push velocity
;317:	VectorSubtract ( ent->s.origin, origin, self->s.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 318
;318:	self->s.origin2[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 0
ASGNF4
line 319
;319:	dist = VectorNormalize( self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 56
INDIRF4
ASGNF4
line 321
;320:
;321:	forward = dist / time;
ADDRLP4 20
ADDRLP4 32
INDIRF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
line 322
;322:	VectorScale( self->s.origin2, forward, self->s.origin2 );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 324
;323:
;324:	self->s.origin2[2] = time * gravity;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 325
;325:}
LABELV $165
endproc AimAtTarget 72 4
export SP_trigger_push
proc SP_trigger_push 0 4
line 332
;326:
;327:
;328:/*QUAKED trigger_push (.5 .5 .5) ?
;329:Must point at a target_position, which will be the apex of the leap.
;330:This will be client side predicted, unlike target_push
;331:*/
;332:void SP_trigger_push( gentity_t *self ) {
line 333
;333:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 336
;334:
;335:	// unlike other triggers, we need to send this one to the client
;336:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTI4 1
ASGNI4
line 339
;337:
;338:	// make sure the client precaches this sound
;339:	G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $182
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 341
;340:
;341:	self->s.eType = ET_PUSH_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 8
ASGNI4
line 342
;342:	self->touch = trigger_push_touch;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 trigger_push_touch
ASGNP4
line 343
;343:	self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 344
;344:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 345
;345:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 346
;346:}
LABELV $181
endproc SP_trigger_push 0 4
export Use_target_push
proc Use_target_push 0 12
line 349
;347:
;348:
;349:void Use_target_push( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 350
;350:	if ( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $185
line 351
;351:		return;
ADDRGP4 $184
JUMPV
LABELV $185
line 354
;352:	}
;353:
;354:	if ( activator->client->ps.pm_type != PM_NORMAL ) {
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $187
line 355
;355:		return;
ADDRGP4 $184
JUMPV
LABELV $187
line 357
;356:	}
;357:	if ( activator->client->ps.powerups[PW_FLIGHT] ) {
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $189
line 358
;358:		return;
ADDRGP4 $184
JUMPV
LABELV $189
line 360
;359:	}
;360:if(self->locked != 0){
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $191
line 361
;361:return;
ADDRGP4 $184
JUMPV
LABELV $191
line 364
;362:}
;363:
;364:	VectorCopy (self->s.origin2, activator->client->ps.velocity);
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 367
;365:
;366:	// play fly sound every 1.5 seconds
;367:	if ( activator->fly_sound_debounce_time < level.time ) {
ADDRFP4 8
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $193
line 368
;368:		activator->fly_sound_debounce_time = level.time + 1500;
ADDRFP4 8
INDIRP4
CNSTI4 800
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 369
;369:		G_Sound( activator, CHAN_AUTO, self->noise_index );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 370
;370:	}
LABELV $193
line 371
;371:}
LABELV $184
endproc Use_target_push 0 12
export SP_target_push
proc SP_target_push 36 8
line 378
;372:
;373:/*QUAKED target_push (.5 .5 .5) (-8 -8 -8) (8 8 8) bouncepad
;374:Pushes the activator in the direction.of angle, or towards a target apex.
;375:"speed"		defaults to 1000
;376:if "bouncepad", play bounce noise instead of windfly
;377:*/
;378:void SP_target_push( gentity_t *self ) {
line 379
;379:	if (!self->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $198
line 380
;380:		self->speed = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTF4 1148846080
ASGNF4
line 381
;381:	}
LABELV $198
line 382
;382:	G_SetMovedir (self->s.angles, self->s.origin2);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 383
;383:	VectorScale (self->s.origin2, self->speed, self->s.origin2);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 744
ADDP4
INDIRF4
MULF4
ASGNF4
line 385
;384:
;385:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $200
line 386
;386:		self->noise_index = G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $182
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 387
;387:	} else if (self->spawnflags & 2) {
ADDRGP4 $201
JUMPV
LABELV $200
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $202
line 388
;388:		self->noise_index = G_SoundIndex("*jump1.wav");
ADDRGP4 $204
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 389
;389:	} else {
ADDRGP4 $203
JUMPV
LABELV $202
line 390
;390:		self->noise_index = G_SoundIndex("sound/misc/windfly.wav");
ADDRGP4 $205
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 391
;391:	}
LABELV $203
LABELV $201
line 392
;392:	if ( self->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $206
line 393
;393:		VectorCopy( self->s.origin, self->r.absmin );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 504
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 394
;394:		VectorCopy( self->s.origin, self->r.absmax );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 395
;395:		self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 396
;396:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 397
;397:	}
LABELV $206
line 398
;398:	self->use = Use_target_push;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 Use_target_push
ASGNP4
line 399
;399:}
LABELV $197
endproc SP_target_push 36 8
export trigger_teleporter_touch
proc trigger_teleporter_touch 92 16
line 409
;400:
;401:/*
;402:==============================================================================
;403:
;404:trigger_teleport
;405:
;406:==============================================================================
;407:*/
;408:
;409:void trigger_teleporter_touch (gentity_t *self, gentity_t *other, trace_t *trace ) {
line 417
;410:	gentity_t	*dest;
;411:    vec3_t		origin, angles;
;412:	vec3_t originDiff;
;413:	vec3_t originDiffto;
;414:	vec3_t anglesto;
;415:	vec3_t destRelOrigin;
;416:
;417:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $210
line 418
;418:		return;
ADDRGP4 $209
JUMPV
LABELV $210
line 420
;419:	}
;420:if(self->locked != 0){
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $212
line 421
;421:return;
ADDRGP4 $209
JUMPV
LABELV $212
line 423
;422:}
;423:	if ( other->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $214
line 424
;424:		return;
ADDRGP4 $209
JUMPV
LABELV $214
line 433
;425:	}
;426:	// Spectators only?
;427:	/*if ( ( self->spawnflags & 1 ) && 
;428:		(other->client->sess.sessionTeam != TEAM_SPECTATOR && other->client->ps.pm_type != PM_SPECTATOR) ) {
;429:		return;
;430:	}*/
;431:
;432:
;433:	dest = 	G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 76
INDIRP4
ASGNP4
line 434
;434:	if (!dest) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $216
line 435
;435:                G_Printf ("Couldn't find teleporter destination\n");
ADDRGP4 $218
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 436
;436:		return;
ADDRGP4 $209
JUMPV
LABELV $216
line 439
;437:	}
;438:
;439:	if (self->spawnflags & 1) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $219
line 440
;440:		VectorSubtract(self->s.origin, other->client->ps.origin, originDiff);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 441
;441:		if (self->spawnflags & 2) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $223
line 442
;442:			VectorCopy(originDiff, originDiffto);
ADDRLP4 16
ADDRLP4 0
INDIRB
ASGNB 12
line 443
;443:			originDiff[0] = originDiffto[1];
ADDRLP4 0
ADDRLP4 16+4
INDIRF4
ASGNF4
line 444
;444:			originDiff[1] = originDiffto[0];
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
line 445
;445:		}
LABELV $223
line 446
;446:		if (self->spawnflags & 4) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $227
line 447
;447:			VectorCopy(originDiff, originDiffto);
ADDRLP4 16
ADDRLP4 0
INDIRB
ASGNB 12
line 448
;448:			originDiff[0] = -originDiffto[0];
ADDRLP4 0
ADDRLP4 16
INDIRF4
NEGF4
ASGNF4
line 449
;449:			originDiff[1] = -originDiffto[1];
ADDRLP4 0+4
ADDRLP4 16+4
INDIRF4
NEGF4
ASGNF4
line 450
;450:		}
LABELV $227
line 451
;451:		if (self->spawnflags & 8) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $231
line 452
;452:			VectorCopy(originDiff, originDiffto);
ADDRLP4 16
ADDRLP4 0
INDIRB
ASGNB 12
line 453
;453:			originDiff[0] = -originDiffto[1];
ADDRLP4 0
ADDRLP4 16+4
INDIRF4
NEGF4
ASGNF4
line 454
;454:			originDiff[1] = -originDiffto[0];
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
NEGF4
ASGNF4
line 455
;455:		}
LABELV $231
line 456
;456:		VectorSubtract(dest->s.origin, originDiff, destRelOrigin);
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 464
;457:
;458:		/*
;459:		G_Printf("self->s.origin: %s\n", vtos(self->s.origin));
;460:		G_Printf("dest->s.origin: %s\n", vtos(dest->s.origin));
;461:		G_Printf("originDiff: %s\n", vtos(originDiff));
;462:		G_Printf("destRelOrigin: %s\n", vtos(destRelOrigin));
;463:		*/
;464:		if (self->spawnflags & 2) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $239
line 465
;465:		VectorCopy(other->client->ps.viewangles, anglesto);
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 466
;466:		anglesto[1] += self->playerangle;
ADDRLP4 40+4
ADDRLP4 40+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 467
;467:		TeleportPlayerNoKnockback(other, destRelOrigin, anglesto, 90);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 90
ARGI4
ADDRGP4 TeleportPlayerNoKnockback
CALLI4
pop
line 468
;468:		} else if (self->spawnflags & 4) {
ADDRGP4 $220
JUMPV
LABELV $239
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $242
line 469
;469:		VectorCopy(other->client->ps.viewangles, anglesto);
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 470
;470:		anglesto[1] += self->playerangle;
ADDRLP4 40+4
ADDRLP4 40+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 471
;471:		TeleportPlayerNoKnockback(other, destRelOrigin, anglesto, 180);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 180
ARGI4
ADDRGP4 TeleportPlayerNoKnockback
CALLI4
pop
line 472
;472:		} else if (self->spawnflags & 8) {
ADDRGP4 $220
JUMPV
LABELV $242
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $245
line 473
;473:		VectorCopy(other->client->ps.viewangles, anglesto);
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 474
;474:		anglesto[1] += self->playerangle;
ADDRLP4 40+4
ADDRLP4 40+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 475
;475:		TeleportPlayerNoKnockback(other, destRelOrigin, anglesto, 270);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 270
ARGI4
ADDRGP4 TeleportPlayerNoKnockback
CALLI4
pop
line 476
;476:		} else {
ADDRGP4 $220
JUMPV
LABELV $245
line 477
;477:		VectorCopy(other->client->ps.viewangles, anglesto);
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 478
;478:		anglesto[1] += self->playerangle;
ADDRLP4 40+4
ADDRLP4 40+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 479
;479:		TeleportPlayerNoKnockback(other, destRelOrigin, anglesto, 0);	
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 TeleportPlayerNoKnockback
CALLI4
pop
line 480
;480:		}
line 481
;481:	} else {
ADDRGP4 $220
JUMPV
LABELV $219
line 482
;482:    if ( g_randomteleport.integer ) {
ADDRGP4 g_randomteleport+12
INDIRI4
CNSTI4 0
EQI4 $249
line 483
;483:        SelectSpawnPoint ( other->client->ps.origin, origin, angles );
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 484
;484:        TeleportPlayer( other, origin, angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 485
;485:	    return;
ADDRGP4 $209
JUMPV
LABELV $249
line 486
;486:	} else {
line 487
;487:	TeleportPlayer( other, dest->s.origin, dest->s.angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 488
;488:	}
line 489
;489:}
LABELV $220
line 490
;490:}
LABELV $209
endproc trigger_teleporter_touch 92 16
export SP_trigger_teleport
proc SP_trigger_teleport 4 4
line 501
;491:
;492:
;493:/*QUAKED trigger_teleport (.5 .5 .5) ? SPECTATOR
;494:Allows client side prediction of teleportation events.
;495:Must point at a target_position, which will be the teleport destination.
;496:
;497:If spectator is set, only spectators can use this teleport
;498:Spectator teleporters are not normally placed in the editor, but are created
;499:automatically near doors to allow spectators to move through them
;500:*/
;501:void SP_trigger_teleport( gentity_t *self ) {
line 502
;502:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 506
;503:
;504:	// unlike other triggers, we need to send this one to the client
;505:	// unless is a spectator trigger
;506:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $253
line 507
;507:		self->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 508
;508:	} else {
ADDRGP4 $254
JUMPV
LABELV $253
line 509
;509:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTI4 1
ASGNI4
line 510
;510:	}
LABELV $254
line 513
;511:
;512:	// make sure the client precaches this sound
;513:	G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $182
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 515
;514:
;515:	self->s.eType = ET_TELEPORT_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 9
ASGNI4
line 516
;516:	self->touch = trigger_teleporter_touch;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 trigger_teleporter_touch
ASGNP4
line 518
;517:
;518:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 519
;519:}
LABELV $252
endproc SP_trigger_teleport 4 4
export hurt_use
proc hurt_use 0 4
line 542
;520:
;521:
;522:/*
;523:==============================================================================
;524:
;525:trigger_hurt
;526:
;527:==============================================================================
;528:*/
;529:
;530:/*QUAKED trigger_hurt (.5 .5 .5) ? START_OFF - SILENT NO_PROTECTION SLOW
;531:Any entity that touches this will be hurt.
;532:It does dmg points of damage each server frame
;533:Targeting the trigger will toggle its on / off state.
;534:
;535:SILENT			supresses playing the sound
;536:SLOW			changes the damage rate to once per second
;537:NO_PROTECTION	*nothing* stops the damage
;538:
;539:"dmg"			default 5 (whole numbers only)
;540:
;541:*/
;542:void hurt_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 543
;543:	if ( self->r.linked ) {
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $256
line 544
;544:		trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 545
;545:	} else {
ADDRGP4 $257
JUMPV
LABELV $256
line 546
;546:		trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 547
;547:	}
LABELV $257
line 548
;548:}
LABELV $255
endproc hurt_use 0 4
export hurt_touch
proc hurt_touch 12 32
line 550
;549:
;550:void hurt_touch( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 553
;551:	int		dflags;
;552:
;553:	if ( !other->takedamage ) {
ADDRFP4 4
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
NEI4 $259
line 554
;554:		return;
ADDRGP4 $258
JUMPV
LABELV $259
line 557
;555:	}
;556:
;557:	if ( self->timestamp > level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $261
line 558
;558:		return;
ADDRGP4 $258
JUMPV
LABELV $261
line 561
;559:	}
;560:
;561:	if ( self->spawnflags & 16 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $264
line 562
;562:		self->timestamp = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 563
;563:	} else {
ADDRGP4 $265
JUMPV
LABELV $264
line 564
;564:		self->timestamp = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 565
;565:	}
LABELV $265
line 568
;566:
;567:	// play sound
;568:	if ( !(self->spawnflags & 4) ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $268
line 569
;569:		G_Sound( other, CHAN_AUTO, self->noise_index );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 570
;570:	}
LABELV $268
line 572
;571:
;572:	if (self->spawnflags & 8)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $270
line 573
;573:		dflags = DAMAGE_NO_PROTECTION;
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $270
line 575
;574:	else
;575:		dflags = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $271
line 576
;576:	G_Damage (other, self, self, NULL, NULL, self->damage, dflags, MOD_TRIGGER_HURT);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
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
ADDRLP4 4
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 577
;577:}
LABELV $258
endproc hurt_touch 12 32
export SP_trigger_hurt
proc SP_trigger_hurt 4 4
line 579
;578:
;579:void SP_trigger_hurt( gentity_t *self ) {
line 580
;580:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 582
;581:
;582:	self->noise_index = G_SoundIndex( "sound/world/electro.wav" );
ADDRGP4 $273
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 996
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 583
;583:	self->touch = hurt_touch;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 hurt_touch
ASGNP4
line 585
;584:
;585:	if ( !self->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
CNSTI4 0
NEI4 $274
line 586
;586:		self->damage = 5;
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 5
ASGNI4
line 587
;587:	}
LABELV $274
line 589
;588:
;589:	self->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1073741824
ASGNI4
line 591
;590:
;591:	if ( self->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $276
line 592
;592:	self->use = hurt_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 hurt_use
ASGNP4
line 593
;593:        }
LABELV $276
line 596
;594:
;595:	// link in to the world if starting active
;596:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $278
line 597
;597:            trap_UnlinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 598
;598:        }
ADDRGP4 $279
JUMPV
LABELV $278
line 600
;599:        else
;600:        {
line 601
;601:		trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 602
;602:	}
LABELV $279
line 603
;603:}
LABELV $272
endproc SP_trigger_hurt 4 4
export func_timer_think
proc func_timer_think 32 8
line 627
;604:
;605:
;606:/*
;607:==============================================================================
;608:
;609:timer
;610:
;611:==============================================================================
;612:*/
;613:
;614:
;615:/*QUAKED func_timer (0.3 0.1 0.6) (-8 -8 -8) (8 8 8) START_ON START_DELAYED
;616:This should be renamed trigger_timer...
;617:Repeatedly fires its targets.
;618:Can be turned on or off by using.
;619:
;620:"wait"			base time between triggering all targets, default is 1
;621:"random"		wait variance, default is 0
;622:so, the basic time between firing is a random time between
;623:(wait - random) and (wait + random)
;624:START_DELAYED	When entity is turned on, the timer will activate its target after the wait period instead of immediately
;625:
;626:*/
;627:void func_timer_think( gentity_t *self ) {
line 628
;628:	G_UseTargets (self, self->activator);
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
line 631
;629:
;630:	// increase timer's damage value to indicate it has been used once more
;631:	if ( self->count && self->damage < self->count )
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $281
ADDRLP4 4
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $281
line 632
;632:		self->damage++;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $281
line 635
;633:
;634:	// set time before next firing
;635:	if ( !self->count || self->damage < self->count )
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $285
ADDRLP4 16
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
GEI4 $283
LABELV $285
line 636
;636:	self->nextthink = level.time + 1000 * ( self->wait + crandom() * self->random );
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 28
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
MULF4
ADDF4
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $283
line 637
;637:	else {
line 639
;638:		//timer has activated its targets [count] number of times, so turn it off and reset its trigger counter (damage)
;639:		self->nextthink = 0;	
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 640
;640:		self->damage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 0
ASGNI4
line 641
;641:	}
LABELV $284
line 642
;642:}
LABELV $280
endproc func_timer_think 32 8
export func_timer_use
proc func_timer_use 8 4
line 644
;643:
;644:void func_timer_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 645
;645:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 968
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 648
;646:
;647:	// if on, turn it off
;648:	if ( self->nextthink ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $288
line 649
;649:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 650
;650:		return;
ADDRGP4 $287
JUMPV
LABELV $288
line 654
;651:	}
;652:
;653:	// turn it on
;654:	if ( self->spawnflags & 2 )
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $290
line 655
;655:		self->nextthink = level.time + 1000 * ( self->wait + crandom() * self->random );
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 0
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
MULF4
ADDF4
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRGP4 $291
JUMPV
LABELV $290
line 657
;656:	else
;657:	func_timer_think (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 func_timer_think
CALLV
pop
LABELV $291
line 658
;658:}
LABELV $287
endproc func_timer_use 8 4
export SP_func_timer
proc SP_func_timer 16 12
line 660
;659:
;660:void SP_func_timer( gentity_t *self ) {
line 661
;661:	G_SpawnFloat( "random", "0", &self->random);
ADDRGP4 $152
ARGP4
ADDRGP4 $144
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 662
;662:	G_SpawnFloat( "wait", "1", &self->wait );
ADDRGP4 $150
ARGP4
ADDRGP4 $294
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 664
;663:
;664:	self->use = func_timer_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 func_timer_use
ASGNP4
line 665
;665:	self->think = func_timer_think;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 func_timer_think
ASGNP4
line 667
;666:
;667:	if ( self->random >= self->wait ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
LTF4 $295
line 668
;668:		self->random = self->wait - FRAMETIME;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1016
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 669
;669:                G_Printf( "func_timer at %s has random >= wait\n", vtos( self->s.origin ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $297
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 670
;670:	}
LABELV $295
line 672
;671:
;672:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $298
line 673
;673:		if (self->spawnflags & 2)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $300
line 674
;674:			self->nextthink = level.time + 1000 * (self->wait + crandom() * self->random);
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
MULF4
ADDF4
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRGP4 $301
JUMPV
LABELV $300
line 676
;675:		else
;676:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
LABELV $301
line 677
;677:		self->activator = self;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 968
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 678
;678:	}
LABELV $298
line 680
;679:
;680:	G_SpawnInt( "count", "0", &self->count);
ADDRGP4 $304
ARGP4
ADDRGP4 $144
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 681
;681:	self->damage = 0; //damage is used to keep track of the number of times this timer has activated its targets.
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 0
ASGNI4
line 683
;682:
;683:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTI4 1
ASGNI4
line 684
;684:}
LABELV $293
endproc SP_func_timer 16 12
export trigger_death_use
proc trigger_death_use 24 8
line 700
;685:
;686:
;687:/*
;688:==============================================================================
;689:
;690:trigger_death
;691:
;692:==============================================================================
;693:*/
;694:
;695:/*QUAKED trigger_death(.5 .5 .5) (-8 -8 -8) (8 8 8) RED_ONLY BLUE_ONLY TRIGGER_ONCE
;696:Entity that's triggered when a player dies.
;697:activator is the player that died. other is unused.
;698:If the TRIGGER_ONCE spawnflag is set, the entity can only be triggered once
;699:*/
;700:void trigger_death_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 703
;701:	
;702:	//filter red/blue players
;703:	if ( ( self->spawnflags & 1 ) && activator->client->sess.sessionTeam != TEAM_RED ) {
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
EQI4 $306
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $306
line 704
;704:		return;
ADDRGP4 $305
JUMPV
LABELV $306
line 706
;705:	}
;706:	if ( ( self->spawnflags & 2 ) && activator->client->sess.sessionTeam != TEAM_BLUE ) {
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $308
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $308
line 707
;707:		return;
ADDRGP4 $305
JUMPV
LABELV $308
line 711
;708:	}
;709:
;710:	// if died player is a bot and bots aren't allowed, do nothing
;711:	if ( ( self->flags & FL_NO_BOTS ) && ( activator->r.svFlags & SVF_BOT ) )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $310
ADDRFP4 8
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $310
line 712
;712:		return;
ADDRGP4 $305
JUMPV
LABELV $310
line 715
;713:
;714:	// if died player is not a bot and humans aren't allowed, do nothing
;715:	if ( ( self->flags & FL_NO_HUMANS ) && !( activator->r.svFlags & SVF_BOT ) )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $312
ADDRFP4 8
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $312
line 716
;716:		return;
ADDRGP4 $305
JUMPV
LABELV $312
line 719
;717:
;718:	//damage is used to keep track of the number of times a player died
;719:	self->damage++;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 721
;720:
;721:	if ( self->damage < self->count )
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
GEI4 $314
line 722
;722:		return;
ADDRGP4 $305
JUMPV
LABELV $314
line 724
;723:
;724:	self->damage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 0
ASGNI4
line 726
;725:	
;726:	G_UseTargets ( self, activator );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 729
;727:
;728:	//the entity is triggered and TRIGGER_ONCE is set, so remove the entity from the game.
;729:	if ( ( self->spawnflags & 4 ) )
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $316
line 730
;730:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
LABELV $316
line 731
;731:}
LABELV $305
endproc trigger_death_use 24 8
export SP_trigger_death
proc SP_trigger_death 8 12
line 734
;732:
;733:
;734:void SP_trigger_death( gentity_t *self ) {
line 737
;735:	int		i;
;736:
;737:	self->use = trigger_death_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 trigger_death_use
ASGNP4
line 739
;738:
;739:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $143
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 740
;740:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $319
line 741
;741:		self->flags |= FL_NO_BOTS;
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
line 742
;742:	}
LABELV $319
line 743
;743:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $147
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 744
;744:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $321
line 745
;745:		self->flags |= FL_NO_HUMANS;
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
line 746
;746:	}
LABELV $321
line 748
;747:
;748:	G_SpawnInt( "count", "1", &self->count );	//count is the number of times a player must die before the entity is triggered
ADDRGP4 $304
ARGP4
ADDRGP4 $294
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 749
;749:	self->damage = 0;							//damage is used to keep track of the number of times a player died
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 0
ASGNI4
line 751
;750:
;751:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTI4 1
ASGNI4
line 752
;752:}
LABELV $318
endproc SP_trigger_death 8 12
export trigger_frag_use
proc trigger_frag_use 24 8
line 767
;753:
;754:/*
;755:==============================================================================
;756:
;757:trigger_frag
;758:
;759:==============================================================================
;760:*/
;761:
;762:/*QUAKED trigger_frag(.5 .5 .5) (-8 -8 -8) (8 8 8) RED_ONLY BLUE_ONLY TRIGGER_ONCE NO_SUICIDE
;763:Entity that's triggered when a makes a frag.
;764:activator is the entity that is responsible for the death of another player. other is the player that died.
;765:If the TRIGGER_ONCE spawnflag is set, the entity can only be triggered once
;766:*/
;767:void trigger_frag_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 770
;768:	
;769:	// cannot be triggered by non-player entities
;770:	if ( !activator->client )
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $324
line 771
;771:		return;
ADDRGP4 $323
JUMPV
LABELV $324
line 774
;772:
;773:	// the NO_SUICIDE spawnflag is set and player killed himself so we do nothing
;774:	if ( ( self->spawnflags & 8 ) && activator == other )
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $326
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $326
line 775
;775:		return;
ADDRGP4 $323
JUMPV
LABELV $326
line 778
;776:
;777:	//filter red/blue players
;778:	if ( ( self->spawnflags & 1 ) && activator->client->sess.sessionTeam != TEAM_RED ) {
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
EQI4 $328
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $328
line 779
;779:		return;
ADDRGP4 $323
JUMPV
LABELV $328
line 781
;780:	}
;781:	if ( ( self->spawnflags & 2 ) && activator->client->sess.sessionTeam != TEAM_BLUE ) {
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $330
ADDRFP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $330
line 782
;782:		return;
ADDRGP4 $323
JUMPV
LABELV $330
line 786
;783:	}
;784:
;785:	// if player scoring a frag is a bot and bots aren't allowed, do nothing
;786:	if ( ( self->flags & FL_NO_BOTS ) && ( activator->r.svFlags & SVF_BOT ) )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $332
ADDRFP4 8
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $332
line 787
;787:		return;
ADDRGP4 $323
JUMPV
LABELV $332
line 790
;788:
;789:	// if player scoring a frag is not a bot and humans aren't allowed, do nothing
;790:	if ( ( self->flags & FL_NO_HUMANS ) && !( activator->r.svFlags & SVF_BOT ) )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $334
ADDRFP4 8
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $334
line 791
;791:		return;
ADDRGP4 $323
JUMPV
LABELV $334
line 794
;792:
;793:	//damage is used to keep track of the number of times a frag was made
;794:	self->damage++;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 796
;795:
;796:	if ( self->damage < self->count )
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 924
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
GEI4 $336
line 797
;797:		return;
ADDRGP4 $323
JUMPV
LABELV $336
line 799
;798:	
;799:	self->damage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 0
ASGNI4
line 801
;800:	
;801:	G_UseTargets ( self, activator );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 804
;802:
;803:	//the entity is triggered and TRIGGER_ONCE is set, so remove the entity from the game.
;804:	if ( ( self->spawnflags & 4 ) )
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $338
line 805
;805:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
LABELV $338
line 806
;806:}
LABELV $323
endproc trigger_frag_use 24 8
export SP_trigger_frag
proc SP_trigger_frag 8 12
line 809
;807:
;808:
;809:void SP_trigger_frag( gentity_t *self ) {
line 812
;810:	int		i;
;811:
;812:	self->use = trigger_frag_use;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRGP4 trigger_frag_use
ASGNP4
line 814
;813:
;814:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $143
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 815
;815:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $341
line 816
;816:		self->flags |= FL_NO_BOTS;
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
line 817
;817:	}
LABELV $341
line 818
;818:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $147
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 819
;819:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $343
line 820
;820:		self->flags |= FL_NO_HUMANS;
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
line 821
;821:	}
LABELV $343
line 823
;822:
;823:	G_SpawnInt( "count", "1", &self->count );	//count is the number of times a frag must be scored before the entity is triggered
ADDRGP4 $304
ARGP4
ADDRGP4 $294
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 824
;824:	self->damage = 0;							//damage is used to keep track of the number of times a frag was scored
ADDRFP4 0
INDIRP4
CNSTI4 924
ADDP4
CNSTI4 0
ASGNI4
line 826
;825:
;826:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTI4 1
ASGNI4
line 827
;827:}
LABELV $340
endproc SP_trigger_frag 8 12
export lock_touch
proc lock_touch 104 8
line 837
;828:/*
;829:==============================================================================
;830:
;831:EntityPlus: trigger_lock
;832:Note: If NONE of the trigger_lock's KEY_* spawnflags have been set, it operates
;833:like an ordinary trigger_multiple
;834:==============================================================================
;835:*/
;836:
;837:void lock_touch(gentity_t *self, gentity_t *other, trace_t *trace) {
line 842
;838:	vec3_t size;
;839:	int holdables;
;840:	qboolean playerHasKeys;
;841:	
;842:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $346
line 843
;843:		return;
ADDRGP4 $345
JUMPV
LABELV $346
line 845
;844:
;845:	if ( self->nextthink )
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $348
line 846
;846:		return;
ADDRGP4 $345
JUMPV
LABELV $348
line 848
;847:
;848:	holdables = other->client->ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 849
;849:	playerHasKeys = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 852
;850:
;851:	//if player doesn't have all the required key(card)s, do nothing
;852:	if ( (self->spawnflags & 4) && !(holdables & (1 << HI_KEY_RED)) ) 
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $350
ADDRLP4 0
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $350
line 853
;853:		playerHasKeys = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $350
line 854
;854:	if ( (self->spawnflags & 8) && !(holdables & (1 << HI_KEY_GREEN)) )
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $352
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $352
line 855
;855:		playerHasKeys = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $352
line 856
;856:	if ( (self->spawnflags & 16) && !(holdables & (1 << HI_KEY_BLUE)) )
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 28
INDIRI4
EQI4 $354
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 28
INDIRI4
NEI4 $354
line 857
;857:		playerHasKeys = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $354
line 858
;858:	if ( (self->spawnflags & 32) && !(holdables & (1 << HI_KEY_YELLOW)) )
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $356
ADDRLP4 0
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 32
INDIRI4
NEI4 $356
line 859
;859:		playerHasKeys = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $356
line 860
;860:	if ( (self->spawnflags & 64) && !(holdables & (1 << HI_KEY_MASTER)) )
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 36
INDIRI4
EQI4 $358
ADDRLP4 0
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 36
INDIRI4
NEI4 $358
line 861
;861:		playerHasKeys = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $358
line 862
;862:	if ( (self->spawnflags & 128) && !(holdables & (1 << HI_KEY_GOLD)) )
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $360
ADDRLP4 0
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $360
line 863
;863:		playerHasKeys = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $360
line 864
;864:	if ( (self->spawnflags & 256) && !(holdables & (1 << HI_KEY_SILVER)) )
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 44
INDIRI4
EQI4 $362
ADDRLP4 0
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 44
INDIRI4
NEI4 $362
line 865
;865:		playerHasKeys = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $362
line 866
;866:	if ( (self->spawnflags & 512) && !(holdables & (1 << HI_KEY_IRON)) )
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 48
INDIRI4
EQI4 $364
ADDRLP4 0
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $364
line 867
;867:		playerHasKeys = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $364
line 869
;868:
;869:	if ( !playerHasKeys ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $366
line 870
;870:		if ( self->message )
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $368
line 871
;871:			trap_SendServerCommand( other-g_entities, va("cp \"%s\"", self->message ));
ADDRGP4 $370
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $368
line 874
;872:
;873:		// sound played when locked
;874:		if ( self->soundPos1 )
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
EQI4 $371
line 875
;875:		{
line 879
;876:			vec3_t size, center;
;877:			gentity_t *tent;
;878:
;879:			VectorSubtract(self->r.maxs, self->r.mins, size);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 84
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 84
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56+8
ADDRLP4 88
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
SUBF4
ASGNF4
line 880
;880:			VectorScale(size, 0.5, size);
ADDRLP4 92
CNSTF4 1056964608
ASGNF4
ADDRLP4 56
ADDRLP4 92
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 92
INDIRF4
ADDRLP4 56+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 56+8
CNSTF4 1056964608
ADDRLP4 56+8
INDIRF4
MULF4
ASGNF4
line 881
;881:			VectorAdd(self->r.mins, size, center);
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 96
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 56
INDIRF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 96
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 56+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 56+8
INDIRF4
ADDF4
ASGNF4
line 882
;882:			tent = G_TempEntity( center, EV_GENERAL_SOUND );
ADDRLP4 68
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 100
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 100
INDIRP4
ASGNP4
line 883
;883:			tent->s.eventParm = self->soundPos1;
ADDRLP4 80
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ASGNI4
line 884
;884:		}
LABELV $371
line 886
;885:
;886:		self->think = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 887
;887:		self->nextthink = level.time + ( self->wait + self->random * crandom() ) * 1000;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 60
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 56
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
line 888
;888:		return;
ADDRGP4 $345
JUMPV
LABELV $366
line 890
;889:	}
;890:	else {
line 891
;891:		self->message = 0;	//remove the message so it's not displayed anymore once the lock is opened
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTP4 0
ASGNP4
line 894
;892:		
;893:		// sound played when unlocked
;894:		if ( self->soundPos2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $384
line 898
;895:			vec3_t size, center;
;896:			gentity_t *tent;
;897:
;898:			VectorSubtract(self->r.maxs, self->r.mins, size);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 80
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52+8
ADDRLP4 84
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
SUBF4
ASGNF4
line 899
;899:			VectorScale(size, 0.5, size);
ADDRLP4 88
CNSTF4 1056964608
ASGNF4
ADDRLP4 52
ADDRLP4 88
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 88
INDIRF4
ADDRLP4 52+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
CNSTF4 1056964608
ADDRLP4 52+8
INDIRF4
MULF4
ASGNF4
line 900
;900:			VectorAdd(self->r.mins, size, center);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 92
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 52
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 92
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 52+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 52+8
INDIRF4
ADDF4
ASGNF4
line 901
;901:			tent = G_TempEntity( center, EV_GENERAL_SOUND );
ADDRLP4 64
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 96
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 76
ADDRLP4 96
INDIRP4
ASGNP4
line 902
;902:			tent->s.eventParm = self->soundPos2;
ADDRLP4 76
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
ASGNI4
line 904
;903:
;904:			self->soundPos1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 0
ASGNI4
line 905
;905:			self->soundPos2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 0
ASGNI4
line 906
;906:		}
LABELV $384
line 907
;907:	}
line 910
;908:
;909:	// remove the required key(card)s if KEEP_KEYS spawnflag isn't set
;910:	if (!(self->spawnflags & 1024)) {
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $396
line 911
;911:		if (self->spawnflags & 4)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $398
line 912
;912:			other->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_KEY_RED);
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 128
SUBI4
ASGNI4
LABELV $398
line 913
;913:		if (self->spawnflags & 8)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $400
line 914
;914:			other->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_KEY_GREEN);
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 256
SUBI4
ASGNI4
LABELV $400
line 915
;915:		if (self->spawnflags & 16)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $402
line 916
;916:			other->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_KEY_BLUE);
ADDRLP4 60
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 512
SUBI4
ASGNI4
LABELV $402
line 917
;917:		if (self->spawnflags & 32)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $404
line 918
;918:			other->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_KEY_YELLOW);
ADDRLP4 64
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1024
SUBI4
ASGNI4
LABELV $404
line 919
;919:		if (self->spawnflags & 64)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $406
line 920
;920:			other->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_KEY_MASTER);
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 2048
SUBI4
ASGNI4
LABELV $406
line 921
;921:		if (self->spawnflags & 128)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $408
line 922
;922:			other->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_KEY_GOLD);
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 4096
SUBI4
ASGNI4
LABELV $408
line 923
;923:		if (self->spawnflags & 256)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $410
line 924
;924:			other->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_KEY_SILVER);
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 8192
SUBI4
ASGNI4
LABELV $410
line 925
;925:		if (self->spawnflags & 512)
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $412
line 926
;926:			other->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_KEY_IRON);
ADDRLP4 80
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 16384
SUBI4
ASGNI4
LABELV $412
line 927
;927:	}
LABELV $396
line 930
;928:
;929:	// everything else is the same as a trigger_multiple
;930:	multi_trigger(self, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 931
;931:}
LABELV $345
endproc lock_touch 104 8
export SP_trigger_lock
proc SP_trigger_lock 28 12
line 939
;932:
;933:/*
;934:QUAKED trigger_lock (.5 .5 .5) ? RED_ONLY BLUE_ONLY KEY_RED KEY_GREEN KEY_BLUE KEY_YELLOW
;935:Used in conjunction with a holdable_key_* to grant/deny access to some entity
;936:(e.g. a door).
;937:Spawnflags determine which key is needed to trigger this lock
;938:*/
;939:void SP_trigger_lock(gentity_t *self) {
line 943
;940:	char  *lockedsound;
;941:	char  *unlockedsound;
;942:	
;943:	InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 946
;944:
;945:	// default values
;946:	G_SpawnFloat("wait", "0.5", &self->wait);
ADDRGP4 $150
ARGP4
ADDRGP4 $151
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1012
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 947
;947:	G_SpawnFloat("random", "0", &self->random);
ADDRGP4 $152
ARGP4
ADDRGP4 $144
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1016
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 948
;948:	G_SpawnString("lockedsound", "", &lockedsound);
ADDRGP4 $415
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 949
;949:	G_SpawnString("unlockedsound", "", &unlockedsound);
ADDRGP4 $417
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 952
;950:
;951:	// sounds
;952:	self->soundPos1 = G_SoundIndex(lockedsound);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 953
;953:	self->soundPos2 = G_SoundIndex(unlockedsound);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 956
;954:
;955:	// random cannot be larger than wait
;956:	if ( self->random >= self->wait && self->wait >= 0 ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
LTF4 $418
ADDRLP4 20
INDIRF4
CNSTF4 0
LTF4 $418
line 957
;957:		self->random = self->wait - FRAMETIME;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1016
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 958
;958:		G_Printf("trigger_lock has random >= wait\n");
ADDRGP4 $420
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 959
;959:	}
LABELV $418
line 961
;960:
;961:	self->touch = lock_touch;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 lock_touch
ASGNP4
line 965
;962:	//self->touch = Touch_Multi;
;963:
;964:	
;965:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 966
;966:}
LABELV $414
endproc SP_trigger_lock 28 12
import TeleportPlayerNoKnockback
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
LABELV $420
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $417
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $416
byte 1 0
align 1
LABELV $415
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $370
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $304
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $297
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
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $294
byte 1 49
byte 1 0
align 1
LABELV $273
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $218
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
LABELV $205
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 100
byte 1 102
byte 1 108
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $204
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $182
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $155
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
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $152
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $151
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $150
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $147
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
LABELV $144
byte 1 48
byte 1 0
align 1
LABELV $143
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $118
byte 1 108
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $117
byte 1 108
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
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
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $112
byte 1 108
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 36
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $111
byte 1 108
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 117
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $106
byte 1 108
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 36
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $105
byte 1 108
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $96
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 79
byte 1 119
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
