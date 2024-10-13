export DeathmatchScoreboardMessage
code
proc DeathmatchScoreboardMessage 2484 72
file "../../../code/game/g_cmds.c"
line 33
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
;25:#include "../../ui/menudef.h"			// for the voice chats
;26:
;27:/*
;28:==================
;29:DeathmatchScoreboardMessage
;30:
;31:==================
;32:*/
;33:void DeathmatchScoreboardMessage( gentity_t *ent ) {
line 41
;34:	char		entry[1024];
;35:	char		string[1400];
;36:	int			stringlength;
;37:	int			i, j;
;38:	gclient_t	*cl;
;39:	int			numSorted, scoreFlags, accuracy, perfect;
;40:	
;41:	if(g_scoreboardlock.integer){
ADDRGP4 g_scoreboardlock+12
INDIRI4
CNSTI4 0
EQI4 $65
line 42
;42:	return;
ADDRGP4 $64
JUMPV
LABELV $65
line 46
;43:	}
;44:
;45:	// send the latest information on all clients
;46:	string[0] = 0;
ADDRLP4 1048
CNSTI1 0
ASGNI1
line 47
;47:	stringlength = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 48
;48:	scoreFlags = 0;
ADDRLP4 2452
CNSTI4 0
ASGNI4
line 50
;49:
;50:	numSorted = level.numConnectedClients;
ADDRLP4 2448
ADDRGP4 level+72
INDIRI4
ASGNI4
line 52
;51:
;52:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $72
JUMPV
LABELV $69
line 55
;53:		int		ping;
;54:
;55:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 2324
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 57
;56:
;57:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $74
line 58
;58:			ping = -1;
ADDRLP4 2456
CNSTI4 -1
ASGNI4
line 59
;59:		} else {
ADDRGP4 $75
JUMPV
LABELV $74
line 62
;60://unlagged - true ping
;61:			//ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
;62:			ping = cl->pers.realPing < 999 ? cl->pers.realPing : 999;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 999
GEI4 $77
ADDRLP4 2460
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $78
JUMPV
LABELV $77
ADDRLP4 2460
CNSTI4 999
ASGNI4
LABELV $78
ADDRLP4 2456
ADDRLP4 2460
INDIRI4
ASGNI4
line 64
;63://unlagged - true ping
;64:		}
LABELV $75
line 66
;65:
;66:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
CNSTI4 0
EQI4 $79
line 67
;67:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
ADDRLP4 1040
CNSTI4 100
ADDRLP4 0
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
DIVI4
ASGNI4
line 68
;68:		}
ADDRGP4 $80
JUMPV
LABELV $79
line 69
;69:		else {
line 70
;70:			accuracy = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 71
;71:		}
LABELV $80
line 72
;72:		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
ADDRLP4 2468
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $82
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $82
ADDRLP4 2460
CNSTI4 1
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $82
ADDRLP4 2460
CNSTI4 0
ASGNI4
LABELV $83
ADDRLP4 1044
ADDRLP4 2460
INDIRI4
ASGNI4
line 74
;73:
;74:		if(g_gametype.integer == GT_LMS) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
NEI4 $84
line 75
;75:			Com_sprintf (entry, sizeof(entry),
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2476
INDIRI4
ADDRGP4 level+84
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 2456
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 2452
INDIRI4
ARGI4
CNSTI4 2492
ADDRLP4 2476
INDIRI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+200
ADDP4
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $93
ADDRLP4 2472
CNSTI4 0
ASGNI4
ADDRGP4 $94
JUMPV
LABELV $93
ADDRLP4 2472
CNSTI4 1
ASGNI4
LABELV $94
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 2472
INDIRI4
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 87
;76:				" %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.sortedClients[i],
;77:				cl->ps.persistant[PERS_SCORE], ping, (level.time - cl->pers.enterTime)/60000,
;78:				scoreFlags, g_entities[level.sortedClients[i]].s.powerups, accuracy,
;79:				cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;80:				cl->ps.persistant[PERS_EXCELLENT_COUNT],
;81:				cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT],
;82:				cl->ps.persistant[PERS_DEFEND_COUNT],
;83:				cl->ps.persistant[PERS_ASSIST_COUNT],
;84:				perfect,
;85:				cl->ps.persistant[PERS_CAPTURES],
;86:				cl->pers.livesLeft + (cl->isEliminated?0:1));
;87:		}
ADDRGP4 $85
JUMPV
LABELV $84
line 88
;88:		else {
line 89
;89:			Com_sprintf (entry, sizeof(entry),
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $87
ARGP4
ADDRLP4 2472
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2472
INDIRI4
ADDRGP4 level+84
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 2456
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 2452
INDIRI4
ARGI4
CNSTI4 2492
ADDRLP4 2472
INDIRI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+200
ADDP4
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 101
;90:				" %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.sortedClients[i],
;91:				cl->ps.persistant[PERS_SCORE], ping, (level.time - cl->pers.enterTime)/60000,
;92:				scoreFlags, g_entities[level.sortedClients[i]].s.powerups, accuracy,
;93:				cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;94:				cl->ps.persistant[PERS_EXCELLENT_COUNT],
;95:				cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT],
;96:				cl->ps.persistant[PERS_DEFEND_COUNT],
;97:				cl->ps.persistant[PERS_ASSIST_COUNT],
;98:				perfect,
;99:				cl->ps.persistant[PERS_CAPTURES],
;100:				cl->isEliminated);
;101:		}
LABELV $85
line 102
;102:		j = strlen(entry);
ADDRLP4 8
ARGP4
ADDRLP4 2472
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 2472
INDIRI4
ASGNI4
line 103
;103:		if (stringlength + j > 1024)
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $99
line 104
;104:			break;
ADDRGP4 $71
JUMPV
LABELV $99
line 105
;105:		strcpy (string + stringlength, entry);
ADDRLP4 1032
INDIRI4
ADDRLP4 1048
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 106
;106:		stringlength += j;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
line 107
;107:	}
LABELV $70
line 52
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $72
ADDRLP4 4
INDIRI4
ADDRLP4 2448
INDIRI4
LTI4 $69
LABELV $71
line 109
;108:
;109:	trap_SendServerCommand( ent-g_entities, va("scores %i %i %i %i%s", i,
ADDRGP4 $101
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 level+44+4
INDIRI4
ARGI4
ADDRGP4 level+44+8
INDIRI4
ARGI4
ADDRGP4 level+10000
INDIRI4
ARGI4
ADDRLP4 1048
ARGP4
ADDRLP4 2456
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2456
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 112
;110:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE], level.roundStartTime,
;111:		string ) );
;112:}
LABELV $64
endproc DeathmatchScoreboardMessage 2484 72
export G_SendWeaponProperties
proc G_SendWeaponProperties 4100 232
line 114
;113:
;114:void G_SendWeaponProperties(gentity_t *ent) {
line 116
;115:	char string[4096];
;116:	Com_sprintf(string, sizeof(string), "%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %f %f %f %f %f %i %i %i %i %f %f %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i",
ADDRLP4 0
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 $108
ARGP4
ADDRGP4 mod_sgspread
INDIRI4
ARGI4
ADDRGP4 mod_sgcount
INDIRI4
ARGI4
ADDRGP4 mod_lgrange
INDIRI4
ARGI4
ADDRGP4 mod_mgspread
INDIRI4
ARGI4
ADDRGP4 mod_cgspread
INDIRI4
ARGI4
ADDRGP4 mod_jumpheight
INDIRI4
ARGI4
ADDRGP4 mod_gdelay
INDIRI4
ARGI4
ADDRGP4 mod_mgdelay
INDIRI4
ARGI4
ADDRGP4 mod_sgdelay
INDIRI4
ARGI4
ADDRGP4 mod_gldelay
INDIRI4
ARGI4
ADDRGP4 mod_rldelay
INDIRI4
ARGI4
ADDRGP4 mod_lgdelay
INDIRI4
ARGI4
ADDRGP4 mod_pgdelay
INDIRI4
ARGI4
ADDRGP4 mod_rgdelay
INDIRI4
ARGI4
ADDRGP4 mod_bfgdelay
INDIRI4
ARGI4
ADDRGP4 mod_ngdelay
INDIRI4
ARGI4
ADDRGP4 mod_pldelay
INDIRI4
ARGI4
ADDRGP4 mod_cgdelay
INDIRI4
ARGI4
ADDRGP4 mod_ftdelay
INDIRI4
ARGI4
ADDRGP4 mod_scoutfirespeed
INDIRF4
ARGF4
ADDRGP4 mod_ammoregenfirespeed
INDIRF4
ARGF4
ADDRGP4 mod_doublerfirespeed
INDIRF4
ARGF4
ADDRGP4 mod_guardfirespeed
INDIRF4
ARGF4
ADDRGP4 mod_hastefirespeed
INDIRF4
ARGF4
ADDRGP4 mod_noplayerclip
INDIRI4
ARGI4
ADDRGP4 mod_ammolimit
INDIRI4
ARGI4
ADDRGP4 mod_invulmove
INDIRI4
ARGI4
ADDRGP4 mod_amdelay
INDIRI4
ARGI4
ADDRGP4 mod_teamred_firespeed
INDIRF4
ARGF4
ADDRGP4 mod_teamblue_firespeed
INDIRF4
ARGF4
ADDRGP4 mod_medkitlimit
INDIRI4
ARGI4
ADDRGP4 mod_medkitinf
INDIRI4
ARGI4
ADDRGP4 mod_teleporterinf
INDIRI4
ARGI4
ADDRGP4 mod_portalinf
INDIRI4
ARGI4
ADDRGP4 mod_kamikazeinf
INDIRI4
ARGI4
ADDRGP4 mod_invulinf
INDIRI4
ARGI4
ADDRGP4 mod_accelerate
INDIRI4
ARGI4
ADDRGP4 mod_slickmove
INDIRI4
ARGI4
ADDRGP4 mod_overlay
INDIRI4
ARGI4
ADDRGP4 mod_roundmode
INDIRI4
ARGI4
ADDRGP4 mod_zround
INDIRI4
ARGI4
ADDRGP4 mod_gravity
INDIRI4
ARGI4
ADDRGP4 g_fogModel+12
INDIRI4
ARGI4
ADDRGP4 g_fogShader+12
INDIRI4
ARGI4
ADDRGP4 g_fogDistance+12
INDIRI4
ARGI4
ADDRGP4 g_fogInterval+12
INDIRI4
ARGI4
ADDRGP4 g_fogColorR+12
INDIRI4
ARGI4
ADDRGP4 g_fogColorG+12
INDIRI4
ARGI4
ADDRGP4 g_fogColorB+12
INDIRI4
ARGI4
ADDRGP4 g_fogColorA+12
INDIRI4
ARGI4
ADDRGP4 g_skyShader+12
INDIRI4
ARGI4
ADDRGP4 g_skyColorR+12
INDIRI4
ARGI4
ADDRGP4 g_skyColorG+12
INDIRI4
ARGI4
ADDRGP4 g_skyColorB+12
INDIRI4
ARGI4
ADDRGP4 g_skyColorA+12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 118
;117:	            mod_sgspread, mod_sgcount, mod_lgrange, mod_mgspread, mod_cgspread, mod_jumpheight, mod_gdelay, mod_mgdelay ,mod_sgdelay, mod_gldelay, mod_rldelay, mod_lgdelay, mod_pgdelay, mod_rgdelay, mod_bfgdelay, mod_ngdelay, mod_pldelay, mod_cgdelay, mod_ftdelay, mod_scoutfirespeed, mod_ammoregenfirespeed, mod_doublerfirespeed, mod_guardfirespeed, mod_hastefirespeed, mod_noplayerclip, mod_ammolimit, mod_invulmove, mod_amdelay, mod_teamred_firespeed, mod_teamblue_firespeed, mod_medkitlimit, mod_medkitinf, mod_teleporterinf, mod_portalinf, mod_kamikazeinf, mod_invulinf, mod_accelerate, mod_slickmove, mod_overlay, mod_roundmode, mod_zround, mod_gravity, g_fogModel.integer, g_fogShader.integer, g_fogDistance.integer, g_fogInterval.integer, g_fogColorR.integer, g_fogColorG.integer, g_fogColorB.integer, g_fogColorA.integer, g_skyShader.integer, g_skyColorR.integer, g_skyColorG.integer, g_skyColorB.integer, g_skyColorA.integer);
;118:	trap_SendServerCommand(ent-g_entities, va( "weaponProperties %s", string));
ADDRGP4 $122
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4096
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4096
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 119
;119:}
LABELV $107
endproc G_SendWeaponProperties 4100 232
lit
align 1
LABELV $124
byte 1 0
skip 4095
export G_SendSwepWeapons
code
proc G_SendSwepWeapons 4116 12
line 121
;120:
;121:void G_SendSwepWeapons(gentity_t *ent) {
line 122
;122:    char string[4096] = "";
ADDRLP4 4
ADDRGP4 $124
INDIRB
ASGNB 4096
line 126
;123:    int i;
;124:    int len;
;125:
;126:    for (i = MAX_WEAPONS; i < WEAPONS_NUM; i++) {
ADDRLP4 0
CNSTI4 16
ASGNI4
LABELV $125
line 127
;127:        if (ent->swep_list[i] == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2292
ADDP4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $129
line 128
;128:            Q_strcat(string, sizeof(string), va("%i ", i));
ADDRGP4 $131
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4104
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 129
;129:        }
LABELV $129
line 130
;130:    }
LABELV $126
line 126
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 19
LTI4 $125
line 131
;131:    len = strlen(string);
ADDRLP4 4
ARGP4
ADDRLP4 4104
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4100
ADDRLP4 4104
INDIRI4
ASGNI4
line 132
;132:    if (len > 0 && string[len - 1] == ' ') {
ADDRLP4 4100
INDIRI4
CNSTI4 0
LEI4 $132
ADDRLP4 4100
INDIRI4
ADDRLP4 4-1
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $132
line 133
;133:        string[len - 1] = '\0';
ADDRLP4 4100
INDIRI4
ADDRLP4 4-1
ADDP4
CNSTI1 0
ASGNI1
line 134
;134:    }
LABELV $132
line 136
;135:
;136:    trap_SendServerCommand(ent - g_entities, va("sweps %s", string));
ADDRGP4 $136
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4112
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 137
;137:}
LABELV $123
endproc G_SendSwepWeapons 4116 12
export AccMessage
proc AccMessage 1036 108
line 149
;138:
;139:
;140:
;141:
;142:
;143:/*
;144:==================
;145:AccMessage
;146:
;147:==================
;148:*/
;149:void AccMessage( gentity_t *ent ) {
line 152
;150:	char		entry[1024];
;151:
;152:	Com_sprintf (entry, sizeof(entry),
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $138
ARGP4
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CNSTI4 2212
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2216
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2224
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2228
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2232
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2240
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2244
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2248
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2252
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2260
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2264
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2268
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2272
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2300
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
INDIRP4
CNSTI4 2304
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 168
;153:				" %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i ",
;154:                                   ent->client->accuracy[WP_MACHINEGUN][0], ent->client->accuracy[WP_MACHINEGUN][1],
;155:                                  ent->client->accuracy[WP_SHOTGUN][0], ent->client->accuracy[WP_SHOTGUN][1],
;156:                                  ent->client->accuracy[WP_GRENADE_LAUNCHER][0], ent->client->accuracy[WP_GRENADE_LAUNCHER][1],
;157:                                  ent->client->accuracy[WP_ROCKET_LAUNCHER][0], ent->client->accuracy[WP_ROCKET_LAUNCHER][1],
;158:                                  ent->client->accuracy[WP_LIGHTNING][0], ent->client->accuracy[WP_LIGHTNING][1],
;159:                                  ent->client->accuracy[WP_RAILGUN][0], ent->client->accuracy[WP_RAILGUN][1],
;160:                                  ent->client->accuracy[WP_PLASMAGUN][0], ent->client->accuracy[WP_PLASMAGUN][1],
;161:                                  ent->client->accuracy[WP_BFG][0], ent->client->accuracy[WP_BFG][1],
;162:                                   0,0, //Hook
;163:                                    ent->client->accuracy[WP_NAILGUN][0], ent->client->accuracy[WP_NAILGUN][1],
;164:                                    0,0,
;165:                                    ent->client->accuracy[WP_CHAINGUN][0], ent->client->accuracy[WP_CHAINGUN][1]
;166:                                 );
;167:
;168:	trap_SendServerCommand( ent-g_entities, va("accs%s", entry ));
ADDRGP4 $139
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 169
;169:}
LABELV $137
endproc AccMessage 1036 108
export DominationPointStatusMessage
proc DominationPointStatusMessage 124 16
line 178
;170:
;171:
;172:/*
;173:==================
;174:DominationPointStatusMessage
;175:
;176:==================
;177:*/
;178:void DominationPointStatusMessage( gentity_t *ent ) {
line 184
;179:	char		entry[10]; //Will more likely be 2... in fact cannot be more since we are the server
;180:	char		string[10*(MAX_DOMINATION_POINTS+1)];
;181:	int			stringlength;
;182:	int i, j;
;183:
;184:	string[0] = 0;
ADDRLP4 24
CNSTI1 0
ASGNI1
line 185
;185:	stringlength = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 187
;186:
;187:	for(i = 0;i<MAX_DOMINATION_POINTS && i<level.domination_points_count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $141
line 188
;188:		Com_sprintf (entry, sizeof(entry)," %i",level.pointStatusDom[i]);
ADDRLP4 4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $146
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+10040
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 189
;189:		j = strlen(entry);
ADDRLP4 4
ARGP4
ADDRLP4 116
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 116
INDIRI4
ASGNI4
line 190
;190:		if (stringlength + j > 10*MAX_DOMINATION_POINTS)
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
CNSTI4 80
LEI4 $148
line 191
;191:			break;
ADDRGP4 $143
JUMPV
LABELV $148
line 192
;192:		strcpy (string + stringlength, entry);
ADDRLP4 16
INDIRI4
ADDRLP4 24
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 193
;193:		stringlength += j;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 194
;194:	}
LABELV $142
line 187
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $144
ADDRLP4 0
INDIRI4
CNSTI4 8
GEI4 $150
ADDRLP4 0
INDIRI4
ADDRGP4 level+10076
INDIRI4
LTI4 $141
LABELV $150
LABELV $143
line 196
;195:
;196:	trap_SendServerCommand( ent-g_entities, va("domStatus %i%s", level.domination_points_count, string ) );
ADDRGP4 $151
ARGP4
ADDRGP4 level+10076
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 197
;197:}
LABELV $140
endproc DominationPointStatusMessage 124 16
export EliminationMessage
proc EliminationMessage 4 16
line 206
;198:
;199:/*
;200:==================
;201:EliminationMessage
;202:
;203:==================
;204:*/
;205:
;206:void EliminationMessage(gentity_t *ent) {
line 207
;207:	trap_SendServerCommand( ent-g_entities, va("elimination %i %i %i",
ADDRGP4 $154
ARGP4
ADDRGP4 level+44+4
INDIRI4
ARGI4
ADDRGP4 level+44+8
INDIRI4
ARGI4
ADDRGP4 level+10000
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
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
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 209
;208:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE], level.roundStartTime) );
;209:}
LABELV $153
endproc EliminationMessage 4 16
export RespawnTimeMessage
proc RespawnTimeMessage 4 8
line 211
;210:
;211:void RespawnTimeMessage(gentity_t *ent, int time) {
line 212
;212:    trap_SendServerCommand( ent-g_entities, va("respawn %i", time) );
ADDRGP4 $161
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
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
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 213
;213:}
LABELV $160
endproc RespawnTimeMessage 4 8
export DoubleDominationScoreTimeMessage
proc DoubleDominationScoreTimeMessage 4 8
line 221
;214:
;215:/*
;216:==================
;217:DoubleDominationScoreTime
;218:
;219:==================
;220:*/
;221:void DoubleDominationScoreTimeMessage( gentity_t *ent ) {
line 222
;222:	trap_SendServerCommand( ent-g_entities, va("ddtaken %i", level.timeTaken));
ADDRGP4 $163
ARGP4
ADDRGP4 level+10036
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
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
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 223
;223:}
LABELV $162
endproc DoubleDominationScoreTimeMessage 4 8
export DominationPointNamesMessage
proc DominationPointNamesMessage 180 12
line 231
;224:
;225:/*
;226:==================
;227:DominationPointNames
;228:==================
;229:*/
;230:
;231:void DominationPointNamesMessage( gentity_t *ent ) {
line 235
;232:	char text[MAX_DOMINATION_POINTS_NAMES*MAX_DOMINATION_POINTS];
;233:	int i,j;
;234:	qboolean nullFound;
;235:	for(i=0;i<MAX_DOMINATION_POINTS;i++) {
ADDRLP4 164
CNSTI4 0
ASGNI4
LABELV $166
line 236
;236:		Q_strncpyz(text+i*MAX_DOMINATION_POINTS_NAMES,level.domination_points_names[i],MAX_DOMINATION_POINTS_NAMES-1);
ADDRLP4 172
CNSTI4 20
ADDRLP4 164
INDIRI4
MULI4
ASGNI4
ADDRLP4 172
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 172
INDIRI4
ADDRGP4 level+10080
ADDP4
ARGP4
CNSTI4 19
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 237
;237:		if(i!=MAX_DOMINATION_POINTS-1) {
ADDRLP4 164
INDIRI4
CNSTI4 7
EQI4 $171
line 239
;238:			//Don't allow "/0"!
;239:			nullFound = qfalse;
ADDRLP4 168
CNSTI4 0
ASGNI4
line 240
;240:			for(j=i*MAX_DOMINATION_POINTS_NAMES; j<(i+1)*MAX_DOMINATION_POINTS_NAMES;j++) {
ADDRLP4 0
CNSTI4 20
ADDRLP4 164
INDIRI4
MULI4
ASGNI4
ADDRGP4 $176
JUMPV
LABELV $173
line 241
;241:				if(text[j]==0)
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $177
line 242
;242:					nullFound = qtrue;
ADDRLP4 168
CNSTI4 1
ASGNI4
LABELV $177
line 243
;243:				if(nullFound)
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $179
line 244
;244:					text[j] = ' ';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 32
ASGNI1
LABELV $179
line 245
;245:			}
LABELV $174
line 240
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $176
ADDRLP4 176
CNSTI4 20
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 176
INDIRI4
ADDRLP4 164
INDIRI4
MULI4
ADDRLP4 176
INDIRI4
ADDI4
LTI4 $173
line 246
;246:		}
LABELV $171
line 247
;247:		text[MAX_DOMINATION_POINTS_NAMES*MAX_DOMINATION_POINTS-2]=0x19;
ADDRLP4 4+158
CNSTI1 25
ASGNI1
line 248
;248:		text[MAX_DOMINATION_POINTS_NAMES*MAX_DOMINATION_POINTS-1]=0;
ADDRLP4 4+159
CNSTI1 0
ASGNI1
line 249
;249:	}
LABELV $167
line 235
ADDRLP4 164
ADDRLP4 164
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 8
LTI4 $166
line 250
;250:	trap_SendServerCommand( ent-g_entities, va("dompointnames %i \"%s\"", level.domination_points_count, text));
ADDRGP4 $183
ARGP4
ADDRGP4 level+10076
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 172
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 172
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 251
;251:}
LABELV $165
endproc DominationPointNamesMessage 180 12
export YourTeamMessage
proc YourTeamMessage 16 8
line 259
;252:
;253:/*
;254:==================
;255:YourTeamMessage
;256:==================
;257:*/
;258:
;259:void YourTeamMessage( gentity_t *ent) {
line 260
;260:    int team = level.clients[ent-g_entities].sess.sessionTeam;
ADDRLP4 0
CNSTI4 2324
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 262
;261:
;262:    switch(team) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $188
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $191
ADDRGP4 $186
JUMPV
LABELV $188
line 264
;263:        case TEAM_RED:
;264:            trap_SendServerCommand( ent-g_entities, va("team \"%s\"", g_redTeamClientNumbers.string));
ADDRGP4 $189
ARGP4
ADDRGP4 g_redTeamClientNumbers+16
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 265
;265:            break;
ADDRGP4 $187
JUMPV
LABELV $191
line 267
;266:        case TEAM_BLUE:
;267:            trap_SendServerCommand( ent-g_entities, va("team \"%s\"", g_blueTeamClientNumbers.string));
ADDRGP4 $189
ARGP4
ADDRGP4 g_blueTeamClientNumbers+16
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 268
;268:            break;
ADDRGP4 $187
JUMPV
LABELV $186
line 270
;269:        default:
;270:            trap_SendServerCommand( ent-g_entities, "team \"all\"");
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
ADDRGP4 $193
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 271
;271:    };
LABELV $187
line 272
;272:}
LABELV $185
endproc YourTeamMessage 16 8
export AttackingTeamMessage
proc AttackingTeamMessage 8 8
line 280
;273:
;274:/*
;275:==================
;276:AttackingTeamMessage
;277:
;278:==================
;279:*/
;280:void AttackingTeamMessage( gentity_t *ent ) {
line 282
;281:	int team;
;282:	if ( (level.eliminationSides+level.roundNumber)%2 == 0 )
ADDRGP4 level+10024
INDIRI4
ADDRGP4 level+10004
INDIRI4
ADDI4
CNSTI4 2
MODI4
CNSTI4 0
NEI4 $195
line 283
;283:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $196
JUMPV
LABELV $195
line 285
;284:	else
;285:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $196
line 286
;286:	trap_SendServerCommand( ent-g_entities, va("attackingteam %i", team));
ADDRGP4 $199
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 287
;287:}
LABELV $194
endproc AttackingTeamMessage 8 8
export ObeliskHealthMessage
proc ObeliskHealthMessage 4 12
line 293
;288:
;289:/*
;290:
;291: */
;292:
;293:void ObeliskHealthMessage() {
line 294
;294:    if(level.MustSendObeliskHealth) {
ADDRGP4 level+10280
INDIRI4
CNSTI4 0
EQI4 $201
line 295
;295:        trap_SendServerCommand( -1, va("oh %i %i",level.healthRedObelisk,level.healthBlueObelisk) );
ADDRGP4 $204
ARGP4
ADDRGP4 level+10272
INDIRI4
ARGI4
ADDRGP4 level+10276
INDIRI4
ARGI4
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
line 296
;296:        level.MustSendObeliskHealth = qfalse;
ADDRGP4 level+10280
CNSTI4 0
ASGNI4
line 297
;297:    }
LABELV $201
line 298
;298:}
LABELV $200
endproc ObeliskHealthMessage 4 12
export SendCustomVoteCommands
proc SendCustomVoteCommands 4 8
line 307
;299:
;300:/*
;301:==================
;302:SendCustomVoteCommands
;303:
;304:==================
;305:*/
;306:
;307:void SendCustomVoteCommands(int clientNum) {
line 308
;308:	trap_SendServerCommand( clientNum, va("customvotes %s", custom_vote_info) );
ADDRGP4 $209
ARGP4
ADDRGP4 custom_vote_info
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 309
;309:}
LABELV $208
endproc SendCustomVoteCommands 4 8
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 318
;310:
;311:/*
;312:==================
;313:Cmd_Score_f
;314:
;315:Request current scoreboard information
;316:==================
;317:*/
;318:void Cmd_Score_f( gentity_t *ent ) {
line 319
;319:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 320
;320:}
LABELV $210
endproc Cmd_Score_f 0 4
export Cmd_Acc_f
proc Cmd_Acc_f 0 4
line 329
;321:
;322:
;323:/*
;324:==================
;325: Cmd_Acc_f
;326: Request current scoreboard information
;327:==================
;328:*/
;329:void Cmd_Acc_f( gentity_t *ent ) {
line 330
;330:    AccMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 AccMessage
CALLV
pop
line 331
;331:}
LABELV $211
endproc Cmd_Acc_f 0 4
export CheatsOk
proc CheatsOk 4 8
line 339
;332:
;333:
;334:/*
;335:==================
;336:CheatsOk
;337:==================
;338:*/
;339:qboolean	CheatsOk( gentity_t *ent ) {
line 340
;340:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $213
line 341
;341:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $216
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
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
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 342
;342:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $212
JUMPV
LABELV $213
line 344
;343:	}
;344:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
GTI4 $217
line 345
;345:		trap_SendServerCommand( ent-g_entities, va("print \"You must be alive to use this command.\n\""));
ADDRGP4 $219
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
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
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 346
;346:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $212
JUMPV
LABELV $217
line 348
;347:	}
;348:	return qtrue;
CNSTI4 1
RETI4
LABELV $212
endproc CheatsOk 4 8
bss
align 1
LABELV $221
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 357
;349:}
;350:
;351:
;352:/*
;353:==================
;354:ConcatArgs
;355:==================
;356:*/
;357:char	*ConcatArgs( int start ) {
line 363
;358:	int		i, c, tlen;
;359:	static char	line[MAX_STRING_CHARS];
;360:	int		len;
;361:	char	arg[MAX_STRING_CHARS];
;362:
;363:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 364
;364:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 365
;365:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $222
line 366
;366:		trap_Argv( i, arg, sizeof( arg ) );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 367
;367:		tlen = strlen( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1044
INDIRI4
ASGNI4
line 368
;368:		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $226
line 369
;369:			break;
ADDRGP4 $224
JUMPV
LABELV $226
line 371
;370:		}
;371:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $221
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 372
;372:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 373
;373:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $228
line 374
;374:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $221
ADDP4
CNSTI1 32
ASGNI1
line 375
;375:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 376
;376:		}
LABELV $228
line 377
;377:	}
LABELV $223
line 365
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $225
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $222
LABELV $224
line 379
;378:
;379:	line[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $221
ADDP4
CNSTI1 0
ASGNI1
line 381
;380:
;381:	return line;
ADDRGP4 $221
RETP4
LABELV $220
endproc ConcatArgs 1048 12
export ClientNumberFromString
proc ClientNumberFromString 1048 12
line 392
;382:}
;383:
;384:/*
;385:==================
;386:ClientNumberFromString
;387:
;388:Returns a player number for either a number or name string
;389:Returns -1 if invalid
;390:==================
;391:*/
;392:int ClientNumberFromString( gentity_t *to, char *s ) {
line 398
;393:	gclient_t	*cl;
;394:	int			idnum;
;395:    char        cleanName[MAX_STRING_CHARS];
;396:
;397:	// numeric values are just slot numbers
;398:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 1032
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 48
LTI4 $231
ADDRLP4 1032
INDIRI4
CNSTI4 57
GTI4 $231
line 399
;399:		idnum = atoi( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1036
INDIRI4
ASGNI4
line 400
;400:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $236
ADDRLP4 1028
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $233
LABELV $236
line 401
;401:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $237
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 402
;402:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $230
JUMPV
LABELV $233
line 405
;403:		}
;404:
;405:		cl = &level.clients[idnum];
ADDRLP4 1024
CNSTI4 2324
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 406
;406:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 1024
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $238
line 407
;407:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $240
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 408
;408:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $230
JUMPV
LABELV $238
line 410
;409:		}
;410:		return idnum;
ADDRLP4 1028
INDIRI4
RETI4
ADDRGP4 $230
JUMPV
LABELV $231
line 414
;411:	}
;412:
;413:	// check for a name match
;414:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRLP4 1024
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $244
JUMPV
LABELV $241
line 415
;415:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 1024
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $246
line 416
;416:			continue;
ADDRGP4 $242
JUMPV
LABELV $246
line 418
;417:		}
;418:        Q_strncpyz(cleanName, cl->pers.netname, sizeof(cleanName));
ADDRLP4 0
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
line 419
;419:        Q_CleanStr(cleanName);
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 420
;420:        if ( Q_strequal( cleanName, s ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $248
line 421
;421:			return idnum;
ADDRLP4 1028
INDIRI4
RETI4
ADDRGP4 $230
JUMPV
LABELV $248
line 423
;422:		}
;423:	}
LABELV $242
line 414
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1024
INDIRP4
CNSTI4 2324
ADDP4
ASGNP4
LABELV $244
ADDRLP4 1028
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $241
line 425
;424:
;425:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $250
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 426
;426:	return -1;
CNSTI4 -1
RETI4
LABELV $230
endproc ClientNumberFromString 1048 12
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 436
;427:}
;428:
;429:/*
;430:==================
;431:Cmd_Give_f
;432:
;433:Give items to a client
;434:==================
;435:*/
;436:void Cmd_Give_f (gentity_t *ent) {
line 444
;437:	char		*name;
;438:	gitem_t		*it;
;439:	int			i;
;440:	qboolean	give_all;
;441:	gentity_t		*it_ent;
;442:	trace_t		trace;
;443:
;444:	if(g_gametype.integer != GT_SANDBOX){ return; }
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $252
ADDRGP4 $251
JUMPV
LABELV $252
line 445
;445:	if(!g_allowitems.integer){ return; }
ADDRGP4 g_allowitems+12
INDIRI4
CNSTI4 0
NEI4 $255
ADDRGP4 $251
JUMPV
LABELV $255
line 447
;446:
;447:	name = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 76
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 76
INDIRP4
ASGNP4
line 449
;448:
;449:	if Q_strequal(name, "all")
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $260
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $258
line 450
;450:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $258
line 452
;451:	else
;452:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $259
line 454
;453:
;454:	if (give_all || Q_strequal( name, "health"))
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $264
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $261
LABELV $264
line 455
;455:	{
line 456
;456:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 457
;457:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $265
line 458
;458:			return;
ADDRGP4 $251
JUMPV
LABELV $265
line 459
;459:	}
LABELV $261
line 461
;460:
;461:	if (give_all || Q_strequal(name, "weapons"))
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $270
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $269
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $267
LABELV $270
line 462
;462:	{
line 463
;463:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - ( 1 << WP_NONE );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 65534
ASGNI4
line 464
;464:			for(i = 1 ; i < WEAPONS_NUM-15 ; i++){
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $271
line 465
;465:				ent->swep_list[i+15] = 1; 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 466
;466:				ent->swep_ammo[i+15] = 9999; 
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2428
ADDP4
ADDP4
CNSTI4 9999
ASGNI4
line 467
;467:			}
LABELV $272
line 464
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $271
line 468
;468:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $275
line 469
;469:			return;
ADDRGP4 $251
JUMPV
LABELV $275
line 470
;470:	}
LABELV $267
line 472
;471:
;472:	if (give_all || Q_strequal(name, "ammo"))
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $280
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $277
LABELV $280
line 473
;473:	{
line 474
;474:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $281
line 475
;475:			ent->client->ps.ammo[i] = 9999;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 9999
ASGNI4
line 476
;476:		}
LABELV $282
line 474
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $281
line 477
;477:		SetUnlimitedWeapons(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SetUnlimitedWeapons
CALLV
pop
line 478
;478:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $285
line 479
;479:			return;
ADDRGP4 $251
JUMPV
LABELV $285
line 480
;480:	}
LABELV $277
line 482
;481:
;482:	if (give_all || Q_strequal(name, "armor"))
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $290
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $289
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $287
LABELV $290
line 483
;483:	{
line 484
;484:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRLP4 100
CNSTI4 200
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 486
;485:
;486:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $291
line 487
;487:			return;
ADDRGP4 $251
JUMPV
LABELV $291
line 488
;488:	}
LABELV $287
line 490
;489:	
;490:	if (give_all || Q_strequal(name, "money"))
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $296
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $293
LABELV $296
line 491
;491:	{
line 492
;492:		ent->client->pers.oldmoney = 9999;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 9999
ASGNI4
line 494
;493:
;494:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $297
line 495
;495:			return;
ADDRGP4 $251
JUMPV
LABELV $297
line 496
;496:	}
LABELV $293
line 498
;497:
;498:	if (Q_strequal(name, "excellent")) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $299
line 499
;499:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 500
;500:		return;
ADDRGP4 $251
JUMPV
LABELV $299
line 502
;501:	}
;502:	if (Q_strequal(name, "impressive")) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $304
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $302
line 503
;503:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 504
;504:		return;
ADDRGP4 $251
JUMPV
LABELV $302
line 506
;505:	}
;506:	if (Q_strequal(name, "gauntletaward")) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $307
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $305
line 507
;507:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 508
;508:		return;
ADDRGP4 $251
JUMPV
LABELV $305
line 510
;509:	}
;510:	if (Q_strequal(name, "defend")) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $310
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $308
line 511
;511:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 512
;512:		return;
ADDRGP4 $251
JUMPV
LABELV $308
line 514
;513:	}
;514:	if (Q_strequal(name, "assist")) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $311
line 515
;515:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 516
;516:		return;
ADDRGP4 $251
JUMPV
LABELV $311
line 520
;517:	}
;518:
;519:	// spawn a specific item right on the player
;520:	if ( !give_all ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $314
line 521
;521:		it = BG_FindItem (name);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 124
INDIRP4
ASGNP4
line 522
;522:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $316
line 523
;523:			return;
ADDRGP4 $251
JUMPV
LABELV $316
line 526
;524:		}
;525:
;526:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 527
;527:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRB
ASGNB 12
line 528
;528:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 529
;529:		G_SpawnItem (it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 530
;530:		FinishSpawningItem(it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 531
;531:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 532
;532:		Touch_Item (it_ent, ent, &trace);
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 533
;533:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $318
line 534
;534:			G_FreeEntity( it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 535
;535:		}
LABELV $318
line 536
;536:	}
LABELV $314
line 537
;537:}
LABELV $251
endproc Cmd_Give_f 132 12
export Cmd_VehicleExit_f
proc Cmd_VehicleExit_f 0 4
line 547
;538:
;539:/*
;540:==================
;541:Cmd_VehicleExit_f
;542:
;543:Exit from vehicle for player
;544:==================
;545:*/
;546:void Cmd_VehicleExit_f (gentity_t *ent)
;547:{
line 548
;548:	if(ent->client->vehiclenum){
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $321
line 549
;549:	ent->client->vehiclenum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 550
;550:	ClientUserinfoChanged( ent->s.clientNum );
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 551
;551:	}
LABELV $321
line 552
;552:}
LABELV $320
endproc Cmd_VehicleExit_f 0 4
export Cmd_God_f
proc Cmd_God_f 16 8
line 564
;553:
;554:/*
;555:==================
;556:Cmd_God_f
;557:
;558:Sets client to godmode
;559:
;560:argv(0) god
;561:==================
;562:*/
;563:void Cmd_God_f (gentity_t *ent)
;564:{
line 567
;565:	char	*msg;
;566:
;567:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $324
line 568
;568:		return;
ADDRGP4 $323
JUMPV
LABELV $324
line 571
;569:	}
;570:
;571:	ent->flags ^= FL_GODMODE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 572
;572:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $326
line 573
;573:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $328
ASGNP4
ADDRGP4 $327
JUMPV
LABELV $326
line 575
;574:	else
;575:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $329
ASGNP4
LABELV $327
line 577
;576:
;577:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $330
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 578
;578:}
LABELV $323
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 590
;579:
;580:
;581:/*
;582:==================
;583:Cmd_Notarget_f
;584:
;585:Sets client to notarget
;586:
;587:argv(0) notarget
;588:==================
;589:*/
;590:void Cmd_Notarget_f( gentity_t *ent ) {
line 593
;591:	char	*msg;
;592:
;593:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $332
line 594
;594:		return;
ADDRGP4 $331
JUMPV
LABELV $332
line 597
;595:	}
;596:
;597:	ent->flags ^= FL_NOTARGET;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BXORI4
ASGNI4
line 598
;598:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $334
line 599
;599:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $336
ASGNP4
ADDRGP4 $335
JUMPV
LABELV $334
line 601
;600:	else
;601:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $337
ASGNP4
LABELV $335
line 603
;602:
;603:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $330
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 604
;604:}
LABELV $331
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 12 0
line 614
;605:
;606:
;607:/*
;608:==================
;609:Cmd_Noclip_f
;610:
;611:argv(0) noclip
;612:==================
;613:*/
;614:void Cmd_Noclip_f( gentity_t *ent ) {
line 617
;615:	char	*msg;
;616:
;617:	if(g_gametype.integer != GT_SANDBOX){ return; }
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $339
ADDRGP4 $338
JUMPV
LABELV $339
line 618
;618:	if(!g_allownoclip.integer){ return; }
ADDRGP4 g_allownoclip+12
INDIRI4
CNSTI4 0
NEI4 $342
ADDRGP4 $338
JUMPV
LABELV $342
line 620
;619:
;620:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1232
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $346
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $347
JUMPV
LABELV $346
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $347
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
line 621
;621:}
LABELV $338
endproc Cmd_Noclip_f 12 0
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 634
;622:
;623:
;624:/*
;625:==================
;626:Cmd_LevelShot_f
;627:
;628:This is just to help generate the level pictures
;629:for the menus.  It goes to the intermission immediately
;630:and sends over a command to the client to resize the view,
;631:hide the scoreboard, and take a special screenshot
;632:==================
;633:*/
;634:void Cmd_LevelShot_f( gentity_t *ent ) {
line 635
;635:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $349
line 636
;636:		return;
ADDRGP4 $348
JUMPV
LABELV $349
line 640
;637:	}
;638:
;639:	// doesn't work in single player
;640:	if ( g_gametype.integer != 0 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $351
line 641
;641:		trap_SendServerCommand( ent-g_entities,
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
ADDRGP4 $354
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 643
;642:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;643:		return;
ADDRGP4 $348
JUMPV
LABELV $351
line 646
;644:	}
;645:
;646:        if(!ent->client->pers.localClient)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
NEI4 $355
line 647
;647:	{
line 648
;648:		trap_SendServerCommand(ent-g_entities,
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
ADDRGP4 $357
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 650
;649:		"print \"The levelshot command must be executed by a local client\n\"");
;650:		return;
ADDRGP4 $348
JUMPV
LABELV $355
line 654
;651:	}
;652:
;653:
;654:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 655
;655:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
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
ADDRGP4 $358
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 656
;656:}
LABELV $348
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 669
;657:
;658:
;659:/*
;660:==================
;661:Cmd_LevelShot_f
;662:
;663:This is just to help generate the level pictures
;664:for the menus.  It goes to the intermission immediately
;665:and sends over a command to the client to resize the view,
;666:hide the scoreboard, and take a special screenshot
;667:==================
;668:*/
;669:void Cmd_TeamTask_f( gentity_t *ent ) {
line 673
;670:	char userinfo[MAX_INFO_STRING];
;671:	char		arg[MAX_TOKEN_CHARS];
;672:	int task;
;673:	int client = ent->client - level.clients;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
ASGNI4
line 675
;674:
;675:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $360
line 676
;676:		return;
ADDRGP4 $359
JUMPV
LABELV $360
line 678
;677:	}
;678:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 679
;679:	task = atoi( arg );
ADDRLP4 1028
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2060
INDIRI4
ASGNI4
line 681
;680:
;681:	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 682
;682:	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
ADDRGP4 $363
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 683
;683:	trap_SetUserinfo(client, userinfo);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 684
;684:	ClientUserinfoChanged(client);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 685
;685:}
LABELV $359
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 24 20
line 694
;686:
;687:
;688:
;689:/*
;690:=================
;691:Cmd_Kill_f
;692:=================
;693:*/
;694:void Cmd_Kill_f( gentity_t *ent ) {
line 695
;695:	if ( (ent->client->sess.sessionTeam == TEAM_SPECTATOR) || ent->client->isEliminated ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $367
ADDRLP4 0
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $365
LABELV $367
line 696
;696:		return;
ADDRGP4 $364
JUMPV
LABELV $365
line 698
;697:	}
;698:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
GTI4 $368
line 699
;699:		return;
ADDRGP4 $364
JUMPV
LABELV $368
line 701
;700:	}
;701:	if (g_kill.integer == 0) {
ADDRGP4 g_kill+12
INDIRI4
CNSTI4 0
NEI4 $370
line 702
;702:		return;
ADDRGP4 $364
JUMPV
LABELV $370
line 704
;703:	}
;704:	ent->flags &= ~FL_GODMODE;
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
CNSTI4 -17
BANDI4
ASGNI4
line 705
;705:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 -999
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 706
;706:        if(ent->client->lastSentFlying>-1)
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1448
ADDP4
INDIRI4
CNSTI4 -1
LEI4 $373
line 708
;707:            //If player is in the air because of knockback we give credit to the person who sent it flying
;708:            player_die (ent, ent, &g_entities[ent->client->lastSentFlying], 100000, MOD_FALLING);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 2492
ADDRLP4 16
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1448
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 player_die
CALLV
pop
ADDRGP4 $374
JUMPV
LABELV $373
line 710
;709:        else
;710:            player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 25
ARGI4
ADDRGP4 player_die
CALLV
pop
LABELV $374
line 711
;711:}
LABELV $364
endproc Cmd_Kill_f 24 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 721
;712:
;713:/*
;714:=================
;715:BroadCastTeamChange
;716:
;717:Let everyone know about a team change
;718:=================
;719:*/
;720:void BroadcastTeamChange( gclient_t *client, int oldTeam )
;721:{
line 722
;722:	if(g_connectmsg.integer == 1){
ADDRGP4 g_connectmsg+12
INDIRI4
CNSTI4 1
NEI4 $376
line 723
;723:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
NEI4 $379
line 724
;724:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the red team.\n\"",
ADDRGP4 $381
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
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
line 726
;725:			client->pers.netname) );
;726:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $380
JUMPV
LABELV $379
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
NEI4 $382
line 727
;727:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the blue team.\n\"",
ADDRGP4 $384
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
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
line 729
;728:		client->pers.netname));
;729:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $383
JUMPV
LABELV $382
ADDRLP4 0
CNSTI4 3
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $385
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $385
line 730
;730:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"",
ADDRGP4 $387
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
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
line 732
;731:		client->pers.netname));
;732:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $386
JUMPV
LABELV $385
ADDRFP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 0
NEI4 $388
line 733
;733:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"",
ADDRGP4 $390
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
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
line 735
;734:		client->pers.netname));
;735:	}
LABELV $388
LABELV $386
LABELV $383
LABELV $380
line 736
;736:	}
LABELV $376
line 737
;737:}
LABELV $375
endproc BroadcastTeamChange 8 8
export ThrowHoldable
proc ThrowHoldable 32 12
line 739
;738:
;739:void ThrowHoldable( gentity_t *ent ) {
line 747
;740:	gclient_t	*client;
;741:	usercmd_t	*ucmd;
;742:	gitem_t		*xr_item;
;743:	gentity_t	*xr_drop;
;744:	byte i;
;745:	int amount;
;746:
;747:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 748
;748:	ucmd = &ent->client->pers.cmd;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ASGNP4
line 750
;749:
;750:	if ( client->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_TELEPORTER) ) {
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $392
line 751
;751:		Throw_Item( ent, BG_FindItem( "Personal Teleporter" ), 0 );
ADDRGP4 $394
ARGP4
ADDRLP4 24
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Throw_Item
CALLP4
pop
line 752
;752:		ent->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_TELEPORTER);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 753
;753:	}
ADDRGP4 $393
JUMPV
LABELV $392
line 754
;754:	else if ( client->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_MEDKIT) ) {
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $395
line 755
;755:		Throw_Item( ent, BG_FindItem( "Medkit" ), 0 );
ADDRGP4 $397
ARGP4
ADDRLP4 24
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Throw_Item
CALLP4
pop
line 756
;756:		ent->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_MEDKIT);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 757
;757:	}
ADDRGP4 $396
JUMPV
LABELV $395
line 758
;758:	else if ( client->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_KAMIKAZE) ) {
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $398
line 759
;759:		Throw_Item( ent, BG_FindItem( "Kamikaze" ), 0 );
ADDRGP4 $400
ARGP4
ADDRLP4 24
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Throw_Item
CALLP4
pop
line 760
;760:		ent->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_KAMIKAZE);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 761
;761:	}
ADDRGP4 $399
JUMPV
LABELV $398
line 762
;762:	else if ( client->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_INVULNERABILITY) ) {
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $401
line 763
;763:		Throw_Item( ent, BG_FindItem( "Invulnerability" ), 0 );
ADDRGP4 $403
ARGP4
ADDRLP4 24
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Throw_Item
CALLP4
pop
line 764
;764:		ent->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_INVULNERABILITY);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 765
;765:	}
ADDRGP4 $402
JUMPV
LABELV $401
line 766
;766:	else if ( client->ps.stats[STAT_HOLDABLE_ITEM] & (1 << HI_PORTAL) ) {
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $404
line 767
;767:		Throw_Item( ent, BG_FindItem( "Portal" ), 0 );
ADDRGP4 $406
ARGP4
ADDRLP4 24
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Throw_Item
CALLP4
pop
line 768
;768:		ent->client->ps.stats[STAT_HOLDABLE_ITEM] -= (1 << HI_PORTAL);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 769
;769:	}
LABELV $404
LABELV $402
LABELV $399
LABELV $396
LABELV $393
line 770
;770:}
LABELV $391
endproc ThrowHoldable 32 12
export Cmd_DropHoldable_f
proc Cmd_DropHoldable_f 0 4
line 772
;771:
;772:void Cmd_DropHoldable_f( gentity_t *ent ) {
line 773
;773:	ThrowHoldable( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ThrowHoldable
CALLV
pop
line 774
;774:}
LABELV $407
endproc Cmd_DropHoldable_f 0 4
export ThrowWeapon
proc ThrowWeapon 32 12
line 776
;775:
;776:void ThrowWeapon( gentity_t *ent ) {
line 783
;777:	gclient_t	*client;
;778:	gitem_t		*xr_item;
;779:	gentity_t	*xr_drop;
;780:	int amount;
;781:	int weapon;
;782:	
;783:	weapon = ent->swep_id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
INDIRI4
ASGNI4
line 785
;784:
;785:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 787
;786:
;787:if(weapon == WP_GAUNTLET){ return; }
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $409
ADDRGP4 $408
JUMPV
LABELV $409
line 789
;788:
;789:if(weapon <= 15){
ADDRLP4 0
INDIRI4
CNSTI4 15
GTI4 $411
line 790
;790:	amount = client->ps.ammo[weapon];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ASGNI4
line 791
;791:	if(amount == 0){ return; }
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $413
ADDRGP4 $408
JUMPV
LABELV $413
line 792
;792:	client->ps.ammo[weapon] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 793
;793:	Set_Weapon( ent, weapon, 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 794
;794:	client->ps.weapon = WP_GAUNTLET;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 795
;795:	client->ps.generic2 = WP_GAUNTLET;
ADDRLP4 4
INDIRP4
CNSTI4 444
ADDP4
CNSTI4 1
ASGNI4
line 796
;796:	trap_SendServerCommand( ent - g_entities, va("clcmd \"%s\"", "weapon 1" ));
ADDRGP4 $415
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 797
;797:	ent->swep_id = WP_GAUNTLET;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
CNSTI4 1
ASGNI4
line 798
;798:	xr_item = BG_FindSwep( weapon );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindSwep
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 799
;799:	if(!xr_item->classname){ return; }
ADDRLP4 8
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $417
ADDRGP4 $408
JUMPV
LABELV $417
line 800
;800:	xr_drop = Throw_Item( ent, xr_item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 28
ADDRGP4 Throw_Item
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 801
;801:	xr_drop->count = amount;
ADDRLP4 16
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 802
;802:} else {
ADDRGP4 $412
JUMPV
LABELV $411
line 803
;803:	amount = ent->swep_ammo[weapon];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2368
ADDP4
ADDP4
INDIRI4
ASGNI4
line 804
;804:	if(amount == 0){ return; }
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $419
ADDRGP4 $408
JUMPV
LABELV $419
line 805
;805:	ent->swep_ammo[weapon] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2368
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 806
;806:	Set_Weapon( ent, weapon, 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Set_Weapon
CALLV
pop
line 807
;807:	client->ps.weapon = WP_GAUNTLET;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 808
;808:	client->ps.generic2 = WP_GAUNTLET;
ADDRLP4 4
INDIRP4
CNSTI4 444
ADDP4
CNSTI4 1
ASGNI4
line 809
;809:	trap_SendServerCommand( ent - g_entities, va("clcmd \"%s\"", "weapon 1" ));
ADDRGP4 $415
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 810
;810:	ent->swep_id = WP_GAUNTLET;
ADDRFP4 0
INDIRP4
CNSTI4 2444
ADDP4
CNSTI4 1
ASGNI4
line 811
;811:	xr_item = BG_FindSwep( weapon );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindSwep
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 812
;812:	if(!xr_item->classname){ return; }
ADDRLP4 8
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $421
ADDRGP4 $408
JUMPV
LABELV $421
line 813
;813:	xr_drop = Throw_Item( ent, xr_item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 28
ADDRGP4 Throw_Item
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 814
;814:	xr_drop->count = amount;
ADDRLP4 16
INDIRP4
CNSTI4 944
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 815
;815:}
LABELV $412
line 817
;816:
;817:}
LABELV $408
endproc ThrowWeapon 32 12
export Cmd_DropWeapon_f
proc Cmd_DropWeapon_f 0 4
line 819
;818:
;819:void Cmd_DropWeapon_f( gentity_t *ent ) {
line 820
;820:	ThrowWeapon( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ThrowWeapon
CALLV
pop
line 821
;821:}
LABELV $423
endproc Cmd_DropWeapon_f 0 4
export SetTeam
proc SetTeam 1592 20
line 829
;822:
;823:/*
;824:=================
;825:SetTeam
;826:KK-OAX Modded this to accept a forced admin change.
;827:=================
;828:*/
;829:void SetTeam( gentity_t *ent, char *s ) {
line 839
;830:	int					team, oldTeam;
;831:	gclient_t			*client;
;832:	int					clientNum;
;833:	spectatorState_t	specState;
;834:	int					specClient;
;835:	int					teamLeader;
;836:    char	            userinfo[MAX_INFO_STRING];
;837:    qboolean            force;
;838:
;839:	force = G_admin_permission(ent, ADMF_FORCETEAMCHANGE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 1056
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1056
INDIRI4
ASGNI4
line 844
;840:
;841:	//
;842:	// see what change is requested
;843:	//
;844:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
line 846
;845:
;846:	clientNum = client - level.clients;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2324
DIVI4
ASGNI4
line 847
;847:        trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 848
;848:	specClient = 0;
ADDRLP4 1048
CNSTI4 0
ASGNI4
line 849
;849:	specState = SPECTATOR_NOT;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 850
;850:	if ( Q_strequal( s, "scoreboard" ) || Q_strequal( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $429
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $428
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $425
LABELV $429
line 851
;851:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 852
;852:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 853
;853:	} else if ( Q_strequal( s, "follow1" ) ) {
ADDRGP4 $426
JUMPV
LABELV $425
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $430
line 854
;854:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 855
;855:		specState = SPECTATOR_FOLLOW;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 856
;856:		specClient = -1;
ADDRLP4 1048
CNSTI4 -1
ASGNI4
line 857
;857:	} else if ( Q_strequal( s, "follow2" ) ) {
ADDRGP4 $431
JUMPV
LABELV $430
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $435
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $433
line 858
;858:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 859
;859:		specState = SPECTATOR_FOLLOW;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 860
;860:		specClient = -2;
ADDRLP4 1048
CNSTI4 -2
ASGNI4
line 861
;861:	} else if ( Q_strequal( s, "spectator" ) || Q_strequal( s, "s" ) ) {
ADDRGP4 $434
JUMPV
LABELV $433
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $440
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $439
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $436
LABELV $440
line 862
;862:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 863
;863:		specState = SPECTATOR_FREE;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 864
;864:	} else if ( g_gametype.integer >= GT_TEAM && g_ffa_gt!=1) {
ADDRGP4 $437
JUMPV
LABELV $436
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $441
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
EQI4 $441
line 866
;865:		// if running a team game, assign player to one of the teams
;866:		specState = SPECTATOR_NOT;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 867
;867:		if ( Q_strequal( s, "red" ) || Q_strequal( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $448
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $447
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $444
LABELV $448
line 868
;868:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 869
;869:		} else if ( Q_strequal( s, "blue" ) || Q_strequal( s, "b" ) ) {
ADDRGP4 $445
JUMPV
LABELV $444
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
EQI4 $453
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $452
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $449
LABELV $453
line 870
;870:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 871
;871:		} else {
ADDRGP4 $450
JUMPV
LABELV $449
line 873
;872:			// pick the team with the least number of players
;873:			team = PickTeam( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1100
INDIRI4
ASGNI4
line 874
;874:		}
LABELV $450
LABELV $445
line 875
;875:        if ( !force ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $442
line 876
;876:		    if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $442
line 879
;877:			    int		counts[TEAM_NUM_TEAMS];
;878:
;879:			    counts[TEAM_BLUE] = TeamCount( ent->client->ps.clientNum, TEAM_BLUE );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1116
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 1100+8
ADDRLP4 1116
INDIRI4
ASGNI4
line 880
;880:			    counts[TEAM_RED] = TeamCount( ent->client->ps.clientNum, TEAM_RED );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1120
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 1100+4
ADDRLP4 1120
INDIRI4
ASGNI4
line 883
;881:
;882:			    // We allow a spread of two
;883:			    if ( team == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRLP4 1124
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1124
INDIRI4
NEI4 $461
ADDRLP4 1100+4
INDIRI4
ADDRLP4 1100+8
INDIRI4
SUBI4
ADDRLP4 1124
INDIRI4
LEI4 $461
line 884
;884:				    trap_SendServerCommand( ent->client->ps.clientNum,
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $465
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 886
;885:					    "cp \"Red team has too many players.\n\"" );
;886:				    return; // ignore the request
ADDRGP4 $424
JUMPV
LABELV $461
line 888
;887:			    }
;888:			    if ( team == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $442
ADDRLP4 1100+8
INDIRI4
ADDRLP4 1100+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $442
line 889
;889:				    trap_SendServerCommand( ent->client->ps.clientNum,
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $470
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 891
;890:					    "cp \"Blue team has too many players.\n\"" );
;891:				    return; // ignore the request
ADDRGP4 $424
JUMPV
line 895
;892:			    }
;893:
;894:			    // It's ok, the team we are switching to has less or same number of players
;895:		    }
line 896
;896:        }
line 897
;897:	} else {
LABELV $441
line 899
;898:		// force them to spectators if there aren't any spots free
;899:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 900
;900:	}
LABELV $442
LABELV $437
LABELV $434
LABELV $431
LABELV $426
line 901
;901:    if ( !force ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $471
line 903
;902:	    // override decision if limiting the players
;903:	    if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $473
ADDRGP4 level+76
INDIRI4
CNSTI4 2
LTI4 $473
line 904
;904:		    && level.numNonSpectatorClients >= 2 ) {
line 905
;905:		    team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 906
;906:	    } else if ( g_maxGameClients.integer > 0 &&
ADDRGP4 $474
JUMPV
LABELV $473
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $477
ADDRGP4 level+76
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $477
line 907
;907:		    level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 908
;908:		    team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 909
;909:	    }
LABELV $477
LABELV $474
line 910
;910:	}
LABELV $471
line 915
;911:
;912:	//
;913:	// decide if we will allow the change
;914:	//
;915:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 916
;916:	if ( team == oldTeam && team != TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $482
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $482
line 917
;917:		return;
ADDRGP4 $424
JUMPV
LABELV $482
line 920
;918:	}
;919:    //KK-OAX Check to make sure the team is not locked from Admin
;920:    if ( !force ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $484
line 921
;921:        if ( team == TEAM_RED && level.RedTeamLocked ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $486
ADDRGP4 level+10260
INDIRI4
CNSTI4 0
EQI4 $486
line 922
;922:            trap_SendServerCommand( ent->client->ps.clientNum,
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $489
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 924
;923:            "cp \"The Red Team has been locked by the Admin! \n\"" );
;924:            return;
ADDRGP4 $424
JUMPV
LABELV $486
line 926
;925:        }
;926:        if ( team == TEAM_BLUE && level.BlueTeamLocked ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $490
ADDRGP4 level+10264
INDIRI4
CNSTI4 0
EQI4 $490
line 927
;927:            trap_SendServerCommand( ent->client->ps.clientNum,
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $493
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 929
;928:            "cp \"The Blue Team has been locked by the Admin! \n\"" );
;929:            return;
ADDRGP4 $424
JUMPV
LABELV $490
line 931
;930:        }
;931:        if ( team == TEAM_FREE && level.FFALocked ) {
ADDRLP4 1088
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1088
INDIRI4
NEI4 $494
ADDRGP4 level+10268
INDIRI4
ADDRLP4 1088
INDIRI4
EQI4 $494
line 932
;932:            trap_SendServerCommand( ent->client->ps.clientNum,
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $497
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 934
;933:            "cp \"This Deathmatch has been locked by the Admin! \n\"" );
;934:            return;
ADDRGP4 $424
JUMPV
LABELV $494
line 936
;935:        }
;936:    }
LABELV $484
line 942
;937:	//
;938:	// execute the team change
;939:	//
;940:
;941:	// if the player was dead leave the body
;942:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $498
line 943
;943:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 944
;944:	}
LABELV $498
line 947
;945:
;946:	// he starts at 'base'
;947:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 948
;948:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $500
line 949
;949:                int teamscore = -99;
ADDRLP4 1088
CNSTI4 -99
ASGNI4
line 951
;950:                //Prevent a team from loosing point because of player leaving team
;951:                if(g_gametype.integer == GT_TEAM && ent->client->ps.stats[STAT_HEALTH])
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $502
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
EQI4 $502
line 952
;952:                    teamscore = level.teamScores[ ent->client->sess.sessionTeam ];
ADDRLP4 1088
ADDRFP4 0
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
LABELV $502
line 954
;953:		// Kill him (makes sure he loses flags, etc)
;954:		ent->flags &= ~FL_GODMODE;
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 955
;955:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
CNSTI4 0
ASGNI4
ADDRLP4 1096
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 1100
INDIRI4
ASGNI4
ADDRLP4 1096
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 1100
INDIRI4
ASGNI4
line 956
;956:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 25
ARGI4
ADDRGP4 player_die
CALLV
pop
line 957
;957:                if(teamscore != -99)
ADDRLP4 1088
INDIRI4
CNSTI4 -99
EQI4 $506
line 958
;958:                    level.teamScores[ ent->client->sess.sessionTeam ] = teamscore;
ADDRFP4 0
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
ADDRLP4 1088
INDIRI4
ASGNI4
LABELV $506
line 960
;959:
;960:	}
LABELV $500
line 962
;961:
;962:        if(oldTeam!=TEAM_SPECTATOR)
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $509
line 963
;963:            PlayerStore_store(Info_ValueForKey(userinfo,"cl_guid"),client->ps);
ADDRLP4 24
ARGP4
ADDRGP4 $511
ARGP4
ADDRLP4 1560
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1560
INDIRP4
ARGP4
ADDRLP4 1088
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 472
ADDRLP4 1088
ARGP4
ADDRGP4 PlayerStore_store
CALLV
pop
LABELV $509
line 966
;964:
;965:	// they go to the end of the line for tournements
;966:        if(team == TEAM_SPECTATOR && oldTeam != team)
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $512
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $512
line 967
;967:                AddTournamentQueue(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 AddTournamentQueue
CALLV
pop
LABELV $512
line 969
;968:
;969:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 1032
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 970
;970:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 1040
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 971
;971:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 1044
ADDP4
ADDRLP4 1048
INDIRI4
ASGNI4
line 973
;972:
;973:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1056
ADDP4
CNSTI4 0
ASGNI4
line 974
;974:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $516
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $514
LABELV $516
line 975
;975:		teamLeader = TeamLeader( team );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1572
ADDRGP4 TeamLeader
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1572
INDIRI4
ASGNI4
line 977
;976:		// if there is no team leader or the team leader is a bot and this client is not a bot
;977:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 1576
ADDRLP4 1052
INDIRI4
ASGNI4
ADDRLP4 1576
INDIRI4
CNSTI4 -1
EQI4 $523
ADDRLP4 1580
CNSTI4 2492
ASGNI4
ADDRLP4 1584
CNSTI4 8
ASGNI4
ADDRLP4 1588
CNSTI4 0
ASGNI4
ADDRLP4 1580
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
ADDRLP4 1584
INDIRI4
BANDI4
ADDRLP4 1588
INDIRI4
NEI4 $517
ADDRLP4 1580
INDIRI4
ADDRLP4 1576
INDIRI4
MULI4
ADDRGP4 g_entities+228+236
ADDP4
INDIRI4
ADDRLP4 1584
INDIRI4
BANDI4
ADDRLP4 1588
INDIRI4
EQI4 $517
LABELV $523
line 978
;978:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 979
;979:		}
LABELV $517
line 980
;980:	}
LABELV $514
line 982
;981:	// make sure there is a team leader on the team the player came from
;982:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $526
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $524
LABELV $526
line 983
;983:		CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 984
;984:	}
LABELV $524
line 986
;985:
;986:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 989
;987:
;988:	// get and distribute relevent paramters
;989:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 991
;990:
;991:	ClientBegin( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 992
;992:}
LABELV $424
endproc SetTeam 1592 20
export StopFollowing
proc StopFollowing 12 0
line 1002
;993:
;994:/*
;995:=================
;996:StopFollowing
;997:
;998:If the client being followed leaves the game, or you just want to drop
;999:to free floating spectator mode
;1000:=================
;1001:*/
;1002:void StopFollowing( gentity_t *ent ) {
line 1003
;1003:	if(g_gametype.integer<GT_ELIMINATION || g_gametype.integer>GT_LMS)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
LTI4 $532
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 11
LEI4 $528
LABELV $532
line 1004
;1004:	{
line 1006
;1005:		//Shouldn't this already be the case?
;1006:		ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 1007
;1007:		ent->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
CNSTI4 3
ASGNI4
line 1008
;1008:	}
ADDRGP4 $529
JUMPV
LABELV $528
line 1009
;1009:	else {
line 1010
;1010:		ent->client->ps.stats[STAT_HEALTH] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 0
ASGNI4
line 1011
;1011:		ent->health = 0;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 0
ASGNI4
line 1012
;1012:	}
LABELV $529
line 1013
;1013:	ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 1
ASGNI4
line 1014
;1014:	ent->client->ps.pm_flags &= ~PMF_FOLLOW;
ADDRLP4 0
ADDRFP4 0
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
CNSTI4 -4097
BANDI4
ASGNI4
line 1015
;1015:	ent->r.svFlags &= ~SVF_BOT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1016
;1016:	ent->client->ps.clientNum = ent - g_entities;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2492
DIVI4
ASGNI4
line 1017
;1017:}
LABELV $527
endproc StopFollowing 12 0
export Cmd_Team_f
proc Cmd_Team_f 1044 12
line 1024
;1018:
;1019:/*
;1020:=================
;1021:Cmd_Team_f
;1022:=================
;1023:*/
;1024:void Cmd_Team_f( gentity_t *ent ) {
line 1029
;1025:	int			oldTeam;
;1026:	char		s[MAX_TOKEN_CHARS];
;1027:	qboolean    force;
;1028:
;1029:	if ( trap_Argc() != 2 ) {
ADDRLP4 1032
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 2
EQI4 $534
line 1030
;1030:		oldTeam = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 1031
;1031:		switch ( oldTeam ) {
ADDRLP4 1036
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
LTI4 $533
ADDRLP4 1036
INDIRI4
CNSTI4 3
GTI4 $533
ADDRLP4 1036
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $546
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $546
address $542
address $540
address $538
address $544
code
LABELV $538
line 1033
;1032:		case TEAM_BLUE:
;1033:			trap_SendServerCommand( ent-g_entities, "print \"Blue team\n\"" );
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
ADDRGP4 $539
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1034
;1034:			break;
ADDRGP4 $533
JUMPV
LABELV $540
line 1036
;1035:		case TEAM_RED:
;1036:			trap_SendServerCommand( ent-g_entities, "print \"Red team\n\"" );
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
ADDRGP4 $541
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1037
;1037:			break;
ADDRGP4 $533
JUMPV
LABELV $542
line 1039
;1038:		case TEAM_FREE:
;1039:			trap_SendServerCommand( ent-g_entities, "print \"Deathmatch-Playing\n\"" );
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
ADDRGP4 $543
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1040
;1040:			break;
ADDRGP4 $533
JUMPV
LABELV $544
line 1042
;1041:		case TEAM_SPECTATOR:
;1042:			trap_SendServerCommand( ent-g_entities, "print \"Spectator team\n\"" );
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
ADDRGP4 $545
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1043
;1043:			break;
line 1045
;1044:		}
;1045:		return;
ADDRGP4 $533
JUMPV
LABELV $534
line 1048
;1046:	}
;1047:
;1048:    force = G_admin_permission(ent, ADMF_FORCETEAMCHANGE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 1036
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1050
;1049:
;1050:	if( !force ) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $547
line 1051
;1051:	    if ( ent->client->switchTeamTime > level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $549
line 1052
;1052:		    trap_SendServerCommand( ent-g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"" );
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
ADDRGP4 $552
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1053
;1053:		    return;
ADDRGP4 $533
JUMPV
LABELV $549
line 1055
;1054:		}
;1055:	}
LABELV $547
line 1058
;1056:
;1057:	// if they are playing a tournement game, count as a loss
;1058:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $553
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 0
NEI4 $553
line 1059
;1059:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1060
;1060:		ent->client->sess.losses++;
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1052
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1061
;1061:	}
LABELV $553
line 1063
;1062:
;1063:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1065
;1064:
;1065:	SetTeam( ent, s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1067
;1066:
;1067:	ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1068
;1068:}
LABELV $533
endproc Cmd_Team_f 1044 12
export Cmd_Follow_f
proc Cmd_Follow_f 1052 12
line 1076
;1069:
;1070:
;1071:/*
;1072:=================
;1073:Cmd_Follow_f
;1074:=================
;1075:*/
;1076:void Cmd_Follow_f( gentity_t *ent ) {
line 1080
;1077:	int		i;
;1078:	char	arg[MAX_TOKEN_CHARS];
;1079:
;1080:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $558
line 1081
;1081:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 2
NEI4 $557
line 1082
;1082:			StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1083
;1083:		}
line 1084
;1084:		return;
ADDRGP4 $557
JUMPV
LABELV $558
line 1088
;1085:	}
;1086:
;1087:
;1088:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1089
;1089:	i = ClientNumberFromString( ent, arg );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 1090
;1090:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $562
line 1091
;1091:		return;
ADDRGP4 $557
JUMPV
LABELV $562
line 1097
;1092:	}
;1093:
;1094:
;1095:
;1096:	// can't follow self
;1097:	if ( &level.clients[ i ] == ent->client ) {
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
NEU4 $564
line 1098
;1098:		return;
ADDRGP4 $557
JUMPV
LABELV $564
line 1102
;1099:	}
;1100:
;1101:	// can't follow another spectator (or an eliminated player)
;1102:	if ( (level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR) || level.clients[ i ].isEliminated) {
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
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $568
ADDRLP4 1036
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $566
LABELV $568
line 1103
;1103:		return;
ADDRGP4 $557
JUMPV
LABELV $566
line 1106
;1104:	}
;1105:
;1106:        if ( (g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION) && g_elimination_lockspectator.integer
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $574
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $569
LABELV $574
ADDRGP4 g_elimination_lockspectator+12
INDIRI4
CNSTI4 0
EQI4 $569
ADDRLP4 1040
CNSTI4 1032
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ADDRLP4 1040
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $576
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ADDRLP4 1040
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $575
LABELV $576
ADDRLP4 1044
CNSTI4 1032
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ADDRLP4 1044
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $569
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ADDRLP4 1044
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $569
LABELV $575
line 1108
;1107:            &&  ((ent->client->sess.sessionTeam == TEAM_RED && level.clients[ i ].sess.sessionTeam == TEAM_BLUE) ||
;1108:                 (ent->client->sess.sessionTeam == TEAM_BLUE && level.clients[ i ].sess.sessionTeam == TEAM_RED) ) ) {
line 1109
;1109:            return;
ADDRGP4 $557
JUMPV
LABELV $569
line 1113
;1110:        }
;1111:
;1112:	// if they are playing a tournement game, count as a loss
;1113:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $577
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 0
NEI4 $577
line 1114
;1114:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1115
;1115:		ent->client->sess.losses++;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1052
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1116
;1116:	}
LABELV $577
line 1120
;1117:
;1118:	// first set them to spectator
;1119:	//if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
;1120:	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
NEI4 $580
line 1121
;1121:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $438
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1122
;1122:	}
LABELV $580
line 1124
;1123:
;1124:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 2
ASGNI4
line 1125
;1125:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1044
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1126
;1126:}
LABELV $557
endproc Cmd_Follow_f 1052 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 52 12
line 1134
;1127:
;1128:/*
;1129:=================
;1130:Cmd_FollowCycle_f
;1131:KK-OAX Modified to trap arguments.
;1132:=================
;1133:*/
;1134:void Cmd_FollowCycle_f( gentity_t *ent ) {
line 1141
;1135:	int		clientnum;
;1136:	int		original;
;1137:    int     count;
;1138:    char    args[11];
;1139:    int     dir;
;1140:
;1141:    if( ent->client->sess.sessionTeam == TEAM_NONE ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $583
line 1142
;1142:        dir = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1143
;1143:    }
LABELV $583
line 1145
;1144:
;1145:    trap_Argv( 0, args, sizeof( args ) );
CNSTI4 0
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1146
;1146:    if( Q_strequal( args, "followprev" )) {
ADDRLP4 16
ARGP4
ADDRGP4 $587
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $585
line 1147
;1147:        dir = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 1148
;1148:    } else if( Q_strequal( args, "follownext" )) {
ADDRGP4 $586
JUMPV
LABELV $585
ADDRLP4 16
ARGP4
ADDRGP4 $590
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $588
line 1149
;1149:        dir = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1150
;1150:    } else {
ADDRGP4 $589
JUMPV
LABELV $588
line 1151
;1151:        dir = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1152
;1152:    }
LABELV $589
LABELV $586
line 1155
;1153:
;1154:	// if they are playing a tournement game, count as a loss
;1155:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $591
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 0
NEI4 $591
line 1156
;1156:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 1157
;1157:		ent->client->sess.losses++;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1052
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1158
;1158:	}
LABELV $591
line 1160
;1159:	// first set them to spectator
;1160:	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
NEI4 $594
line 1161
;1161:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $438
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1162
;1162:	}
LABELV $594
line 1164
;1163:
;1164:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $596
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $596
line 1165
;1165:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $598
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 1166
;1166:	}
LABELV $596
line 1168
;1167:
;1168:	clientnum = ent->client->sess.spectatorClient;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1044
ADDP4
INDIRI4
ASGNI4
line 1169
;1169:	original = clientnum;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 1170
;1170:        count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $599
line 1171
;1171:	do {
line 1172
;1172:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1173
;1173:                count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1174
;1174:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $602
line 1175
;1175:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1176
;1176:		}
LABELV $602
line 1177
;1177:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $605
line 1178
;1178:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1179
;1179:		}
LABELV $605
line 1181
;1180:
;1181:                if(count>level.maxclients) //We have looked at all clients at least once and found nothing
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LEI4 $608
line 1182
;1182:                    return; //We might end up in an infinite loop here. Stop it!
ADDRGP4 $582
JUMPV
LABELV $608
line 1185
;1183:
;1184:		// can only follow connected clients
;1185:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
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
CNSTI4 2
EQI4 $611
line 1186
;1186:			continue;
ADDRGP4 $600
JUMPV
LABELV $611
line 1190
;1187:		}
;1188:
;1189:		// can't follow another spectator
;1190:		if ( (level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR) || level.clients[ clientnum ].isEliminated) {
ADDRLP4 40
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $615
ADDRLP4 40
INDIRP4
CNSTI4 1440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $613
LABELV $615
line 1191
;1191:			continue;
ADDRGP4 $600
JUMPV
LABELV $613
line 1195
;1192:		}
;1193:
;1194:                //Stop players from spectating players on the enemy team in elimination modes.
;1195:                if ( (g_gametype.integer == GT_ELIMINATION || g_gametype.integer == GT_CTF_ELIMINATION) && g_elimination_lockspectator.integer
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
EQI4 $621
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
NEI4 $616
LABELV $621
ADDRGP4 g_elimination_lockspectator+12
INDIRI4
CNSTI4 0
EQI4 $616
ADDRLP4 44
CNSTI4 1032
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $623
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $622
LABELV $623
ADDRLP4 48
CNSTI4 1032
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $616
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $616
LABELV $622
line 1197
;1196:                    &&  ((ent->client->sess.sessionTeam == TEAM_RED && level.clients[ clientnum ].sess.sessionTeam == TEAM_BLUE) ||
;1197:                         (ent->client->sess.sessionTeam == TEAM_BLUE && level.clients[ clientnum ].sess.sessionTeam == TEAM_RED) ) ) {
line 1198
;1198:                    continue;
ADDRGP4 $600
JUMPV
LABELV $616
line 1202
;1199:                }
;1200:
;1201:		// this is good, we can use it
;1202:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1044
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1203
;1203:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 2
ASGNI4
line 1204
;1204:		return;
ADDRGP4 $582
JUMPV
LABELV $600
line 1205
;1205:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $599
line 1208
;1206:
;1207:	// leave it where it was
;1208:}
LABELV $582
endproc Cmd_FollowCycle_f 52 12
proc G_SayTo 12 24
line 1217
;1209:
;1210:
;1211:/*
;1212:==================
;1213:G_Say
;1214:==================
;1215:*/
;1216:
;1217:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 1218
;1218:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $625
line 1219
;1219:		return;
ADDRGP4 $624
JUMPV
LABELV $625
line 1221
;1220:	}
;1221:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $627
line 1222
;1222:		return;
ADDRGP4 $624
JUMPV
LABELV $627
line 1224
;1223:	}
;1224:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $629
line 1225
;1225:		return;
ADDRGP4 $624
JUMPV
LABELV $629
line 1227
;1226:	}
;1227:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $631
line 1228
;1228:		return;
ADDRGP4 $624
JUMPV
LABELV $631
line 1234
;1229:	}
;1230:	/*if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
;1231:		return;
;1232:	}*/
;1233:
;1234:        if ((ent->r.svFlags & SVF_BOT) && trap_Cvar_VariableValue( "bot_nochat" )>1) return;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $633
ADDRGP4 $635
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
LEF4 $633
ADDRGP4 $624
JUMPV
LABELV $633
line 1243
;1235:
;1236:	// no chatting to players in tournements
;1237:	/*if ( (g_gametype.integer == GT_TOURNAMENT )
;1238:		&& other->client->sess.sessionTeam == TEAM_FREE
;1239:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
;1240:		return;
;1241:	}*/
;1242:
;1243:	trap_SendServerCommand( other-g_entities, va("%s \"%s%c%c%s\"",
ADDRGP4 $636
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $640
ADDRLP4 4
ADDRGP4 $637
ASGNP4
ADDRGP4 $641
JUMPV
LABELV $640
ADDRLP4 4
ADDRGP4 $638
ASGNP4
LABELV $641
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 94
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
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
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1246
;1244:		mode == SAY_TEAM ? "tchat" : "chat",
;1245:		name, Q_COLOR_ESCAPE, color, message));
;1246:}
LABELV $624
endproc G_SayTo 12 24
export G_Say
proc G_Say 324 28
line 1250
;1247:
;1248:#define EC		"\x19"
;1249:
;1250:void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 1259
;1251:	int			j;
;1252:	gentity_t	*other;
;1253:	int			color;
;1254:	char		name[64];
;1255:	// don't let text be too long for malicious reasons
;1256:	char		text[MAX_SAY_TEXT];
;1257:	char		location[64];
;1258:
;1259:    if ((ent->r.svFlags & SVF_BOT) && trap_Cvar_VariableValue( "bot_nochat" )>1) return;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $643
ADDRGP4 $635
ARGP4
ADDRLP4 292
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 292
INDIRF4
CNSTF4 1065353216
LEF4 $643
ADDRGP4 $642
JUMPV
LABELV $643
line 1265
;1260:
;1261:	/*if ( (g_gametype.integer < GT_TEAM || g_ffa_gt == 1) && mode == SAY_TEAM ) {
;1262:		mode = SAY_ALL;
;1263:	}*/
;1264:
;1265:	switch ( mode ) {
ADDRLP4 296
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $647
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $650
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $656
ADDRGP4 $645
JUMPV
LABELV $645
LABELV $647
line 1268
;1266:	default:
;1267:	case SAY_ALL:
;1268:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $648
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1269
;1269:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $649
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1270
;1270:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1271
;1271:		break;
ADDRGP4 $646
JUMPV
LABELV $650
line 1273
;1272:	case SAY_TEAM:
;1273:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $651
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1274
;1274:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 300
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $652
line 1275
;1275:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ",
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $654
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $653
JUMPV
LABELV $652
line 1278
;1276:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;1277:		else
;1278:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ",
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $655
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $653
line 1280
;1279:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;1280:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 1281
;1281:		break;
ADDRGP4 $646
JUMPV
LABELV $656
line 1283
;1282:	case SAY_TELL:
;1283:		if (target && g_gametype.integer >= GT_TEAM && g_ffa_gt != 1 &&
ADDRLP4 304
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $657
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $657
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
EQI4 $657
ADDRLP4 308
CNSTI4 556
ASGNI4
ADDRLP4 312
CNSTI4 1032
ASGNI4
ADDRLP4 316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
ADDRLP4 308
INDIRI4
ADDP4
INDIRP4
ADDRLP4 312
INDIRI4
ADDP4
INDIRI4
ADDRLP4 316
INDIRP4
ADDRLP4 308
INDIRI4
ADDP4
INDIRP4
ADDRLP4 312
INDIRI4
ADDP4
INDIRI4
NEI4 $657
ADDRLP4 316
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 320
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $657
line 1286
;1284:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;1285:			Team_GetLocationMsg(ent, location, sizeof(location)))
;1286:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $660
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $658
JUMPV
LABELV $657
line 1288
;1287:		else
;1288:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $661
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $658
line 1289
;1289:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 1290
;1290:		break;
LABELV $646
line 1293
;1291:	}
;1292:
;1293:	Q_strncpyz( text, chatText, sizeof(text) );
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1295
;1294:
;1295:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $662
line 1296
;1296:		G_SayTo( ent, target, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1297
;1297:		return;
ADDRGP4 $642
JUMPV
LABELV $662
line 1301
;1298:	}
;1299:
;1300:	// echo the text to the console
;1301:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $664
line 1302
;1302:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $667
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1303
;1303:	}
LABELV $664
line 1306
;1304:
;1305:	// send it to all the apropriate clients
;1306:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $671
JUMPV
LABELV $668
line 1307
;1307:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1308
;1308:		G_SayTo( ent, other, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1309
;1309:	}
LABELV $669
line 1306
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $671
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $668
line 1311
;1310:	//KK-OAX Admin Command Check from Say/SayTeam line
;1311:	if( g_adminParseSay.integer )
ADDRGP4 g_adminParseSay+12
INDIRI4
CNSTI4 0
EQI4 $673
line 1312
;1312:	{
line 1313
;1313:	    G_admin_cmd_check ( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_admin_cmd_check
CALLI4
pop
line 1314
;1314:	}
LABELV $673
line 1315
;1315:}
LABELV $642
endproc G_Say 324 28
proc Cmd_Say_f 1044 16
line 1324
;1316:
;1317:
;1318:/*
;1319:==================
;1320:Cmd_Say_f
;1321:KK-OAX Modified this to trap the additional arguments from console.
;1322:==================
;1323:*/
;1324:static void Cmd_Say_f( gentity_t *ent ){
line 1327
;1325:	char		*p;
;1326:	char        arg[MAX_TOKEN_CHARS];
;1327:	int         mode = SAY_ALL;
ADDRLP4 1024
CNSTI4 0
ASGNI4
line 1329
;1328:
;1329:    trap_Argv( 0, arg, sizeof( arg ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1330
;1330:    if( Q_strequal( arg, "say_team" ) )
ADDRLP4 0
ARGP4
ADDRGP4 $679
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $677
line 1331
;1331:        mode = SAY_TEAM ;
ADDRLP4 1024
CNSTI4 1
ASGNI4
LABELV $677
line 1352
;1332:    // KK-OAX Disabled until PM'ing is added
;1333:    // support parsing /m out of say text since some people have a hard
;1334:    // time figuring out what the console is.
;1335:    /*if( !Q_stricmpn( args, "say /m ", 7 ) ||
;1336:      !Q_stricmpn( args, "say_team /m ", 12 ) ||
;1337:      !Q_stricmpn( args, "say /mt ", 8 ) ||
;1338:      !Q_stricmpn( args, "say_team /mt ", 13 ) )
;1339:    {
;1340:        Cmd_PrivateMessage_f( ent );
;1341:        return;
;1342:    }
;1343:
;1344:    // support parsing /a out of say text for the same reason
;1345:    if( !Q_stricmpn( args, "say /a ", 7 ) ||
;1346:    !Q_stricmpn( args, "say_team /a ", 12 ) )
;1347:    {
;1348:        Cmd_AdminMessage_f( ent );
;1349:        return;
;1350:    }*/
;1351:
;1352:    if( trap_Argc( ) < 2 )
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $680
line 1353
;1353:        return;
ADDRGP4 $676
JUMPV
LABELV $680
line 1355
;1354:
;1355:    p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 1040
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1040
INDIRP4
ASGNP4
line 1357
;1356:
;1357:    G_Say( ent, NULL, mode, p );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1358
;1358:}
LABELV $676
endproc Cmd_Say_f 1044 16
proc Cmd_PickTarget_f 1060 12
line 1366
;1359:
;1360:/*
;1361:==================
;1362:Cmd_PickTarget_f
;1363:KK-OAX Added for QSandbox.
;1364:==================
;1365:*/
;1366:static void Cmd_PickTarget_f( gentity_t *ent ){
line 1371
;1367:	char		*p;
;1368:	char        arg[MAX_TOKEN_CHARS];
;1369:	gentity_t 	*act;
;1370:
;1371:    trap_Argv( 0, arg, sizeof( arg ) );
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1373
;1372:
;1373:    if( trap_Argc( ) < 2 )
ADDRLP4 1032
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 2
GEI4 $683
line 1374
;1374:        return;
ADDRGP4 $682
JUMPV
LABELV $683
line 1376
;1375:
;1376:    p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 1036
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1036
INDIRP4
ASGNP4
line 1378
;1377:	
;1378:	ent->target = p;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1380
;1379:
;1380:	act = G_PickTarget( ent->target );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1040
INDIRP4
ASGNP4
line 1381
;1381:	if ( act && act->use ) {
ADDRLP4 1048
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1048
INDIRU4
EQU4 $685
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1048
INDIRU4
EQU4 $685
line 1382
;1382:		act->use( act, ent, ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 1383
;1383:	}
LABELV $685
line 1384
;1384:}
LABELV $682
endproc Cmd_PickTarget_f 1060 12
proc Cmd_SpawnList_Item_f 4096 248
line 1392
;1385:
;1386:/*
;1387:==================
;1388:Cmd_SpawnList_Item_f
;1389:Added for QSandbox.
;1390:==================
;1391:*/
;1392:static void Cmd_SpawnList_Item_f( gentity_t *ent ){
line 1458
;1393:	vec3_t		end, start, forward, up, right;
;1394:	trace_t		tr;
;1395:	gentity_t 	*tent;
;1396:	char		arg01[64];
;1397:	char		arg02[64];
;1398:	char		arg03[64];
;1399:	char		arg04[64];
;1400:	char		arg05[64];
;1401:	char		arg06[64];
;1402:	char		arg07[64];
;1403:	char		arg08[64];
;1404:	char		arg09[64];
;1405:	char		arg10[64];
;1406:	char		arg11[64];
;1407:	char		arg12[64];
;1408:	char		arg13[64];
;1409:	char		arg14[64];
;1410:	char		arg15[64];
;1411:	char		arg16[64];
;1412:	char		arg17[64];
;1413:	char		arg18[64];
;1414:	char		arg19[64];
;1415:	char		arg20[64];
;1416:	char		arg21[64];
;1417:	char		arg22[64];
;1418:	char		arg23[64];
;1419:	char		arg24[64];
;1420:	char		arg25[64];
;1421:	char		arg26[64];
;1422:	char		arg27[64];
;1423:	char		arg28[64];
;1424:	char		arg29[64];
;1425:	char		arg30[64];
;1426:	char		arg31[64];
;1427:	char		arg32[64];
;1428:	char		arg33[64];
;1429:	char		arg34[64];
;1430:	char		arg35[64];
;1431:	char		arg36[64];
;1432:	char		arg37[64];
;1433:	char		arg38[64];
;1434:	char		arg39[64];
;1435:	char		arg40[64];
;1436:	char		arg41[64];
;1437:	char		arg42[64];
;1438:	char		arg43[64];
;1439:	char		arg44[64];
;1440:	char		arg45[64];
;1441:	char		arg46[64];
;1442:	char		arg47[64];
;1443:	char		arg48[64];
;1444:	char		arg49[64];
;1445:	char		arg50[64];
;1446:	char		arg51[64];
;1447:	char		arg52[64];
;1448:	char		arg53[64];
;1449:	char		arg54[64];
;1450:	char		arg55[64];
;1451:	char		arg56[64];
;1452:	char		arg57[64];
;1453:	char		arg58[64];
;1454:	char		arg59[64];
;1455:	char		arg60[64];
;1456:	char		arg61[64];
;1457:	
;1458:	if(g_gametype.integer != GT_SANDBOX){ return; }
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $688
ADDRGP4 $687
JUMPV
LABELV $688
line 1461
;1459:		
;1460:	//tr.endpos
;1461:	trap_Argv( 1, arg01, sizeof( arg01 ) );
CNSTI4 1
ARGI4
ADDRLP4 296
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1462
;1462:	trap_Argv( 2, arg02, sizeof( arg02 ) );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1463
;1463:	trap_Argv( 3, arg03, sizeof( arg03 ) );
CNSTI4 3
ARGI4
ADDRLP4 196
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1464
;1464:	trap_Argv( 4, arg04, sizeof( arg04 ) );
CNSTI4 4
ARGI4
ADDRLP4 360
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1465
;1465:	trap_Argv( 5, arg05, sizeof( arg05 ) );
CNSTI4 5
ARGI4
ADDRLP4 424
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1466
;1466:	trap_Argv( 6, arg06, sizeof( arg06 ) );
CNSTI4 6
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1467
;1467:	trap_Argv( 7, arg07, sizeof( arg07 ) );
CNSTI4 7
ARGI4
ADDRLP4 132
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1468
;1468:	trap_Argv( 8, arg08, sizeof( arg08 ) );
CNSTI4 8
ARGI4
ADDRLP4 488
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1469
;1469:	trap_Argv( 9, arg09, sizeof( arg09 ) );
CNSTI4 9
ARGI4
ADDRLP4 608
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1470
;1470:	trap_Argv( 10, arg10, sizeof( arg10 ) );
CNSTI4 10
ARGI4
ADDRLP4 672
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1471
;1471:	trap_Argv( 11, arg11, sizeof( arg11 ) );
CNSTI4 11
ARGI4
ADDRLP4 736
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1472
;1472:	trap_Argv( 12, arg12, sizeof( arg12 ) );
CNSTI4 12
ARGI4
ADDRLP4 800
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1473
;1473:	trap_Argv( 13, arg13, sizeof( arg13 ) );
CNSTI4 13
ARGI4
ADDRLP4 864
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1474
;1474:	trap_Argv( 14, arg14, sizeof( arg14 ) );
CNSTI4 14
ARGI4
ADDRLP4 928
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1475
;1475:	trap_Argv( 15, arg15, sizeof( arg15 ) );
CNSTI4 15
ARGI4
ADDRLP4 992
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1476
;1476:	trap_Argv( 16, arg16, sizeof( arg16 ) );
CNSTI4 16
ARGI4
ADDRLP4 1056
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1477
;1477:	trap_Argv( 17, arg17, sizeof( arg17 ) );
CNSTI4 17
ARGI4
ADDRLP4 1120
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1478
;1478:	trap_Argv( 18, arg18, sizeof( arg18 ) );
CNSTI4 18
ARGI4
ADDRLP4 1184
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1479
;1479:	trap_Argv( 19, arg19, sizeof( arg19 ) );
CNSTI4 19
ARGI4
ADDRLP4 1248
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1480
;1480:	trap_Argv( 20, arg20, sizeof( arg20 ) );
CNSTI4 20
ARGI4
ADDRLP4 1312
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1481
;1481:	trap_Argv( 21, arg21, sizeof( arg21 ) );
CNSTI4 21
ARGI4
ADDRLP4 1376
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1482
;1482:	trap_Argv( 22, arg22, sizeof( arg22 ) );
CNSTI4 22
ARGI4
ADDRLP4 1440
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1483
;1483:	trap_Argv( 23, arg23, sizeof( arg23 ) );
CNSTI4 23
ARGI4
ADDRLP4 1504
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1484
;1484:	trap_Argv( 24, arg24, sizeof( arg24 ) );
CNSTI4 24
ARGI4
ADDRLP4 1568
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1485
;1485:	trap_Argv( 25, arg25, sizeof( arg25 ) );
CNSTI4 25
ARGI4
ADDRLP4 1632
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1486
;1486:	trap_Argv( 26, arg26, sizeof( arg26 ) );
CNSTI4 26
ARGI4
ADDRLP4 1696
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1487
;1487:	trap_Argv( 27, arg27, sizeof( arg27 ) );
CNSTI4 27
ARGI4
ADDRLP4 1760
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1488
;1488:	trap_Argv( 28, arg28, sizeof( arg28 ) );
CNSTI4 28
ARGI4
ADDRLP4 1824
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1489
;1489:	trap_Argv( 29, arg29, sizeof( arg29 ) );
CNSTI4 29
ARGI4
ADDRLP4 1888
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1490
;1490:	trap_Argv( 30, arg30, sizeof( arg30 ) );
CNSTI4 30
ARGI4
ADDRLP4 1952
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1491
;1491:	trap_Argv( 31, arg31, sizeof( arg31 ) );
CNSTI4 31
ARGI4
ADDRLP4 2016
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1492
;1492:	trap_Argv( 32, arg32, sizeof( arg32 ) );
CNSTI4 32
ARGI4
ADDRLP4 2080
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1493
;1493:	trap_Argv( 33, arg33, sizeof( arg33 ) );
CNSTI4 33
ARGI4
ADDRLP4 2144
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1494
;1494:	trap_Argv( 34, arg34, sizeof( arg34 ) );
CNSTI4 34
ARGI4
ADDRLP4 2208
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1495
;1495:	trap_Argv( 35, arg35, sizeof( arg35 ) );
CNSTI4 35
ARGI4
ADDRLP4 2272
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1496
;1496:	trap_Argv( 36, arg36, sizeof( arg36 ) );
CNSTI4 36
ARGI4
ADDRLP4 2336
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1497
;1497:	trap_Argv( 37, arg37, sizeof( arg37 ) );
CNSTI4 37
ARGI4
ADDRLP4 2400
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1498
;1498:	trap_Argv( 38, arg38, sizeof( arg38 ) );
CNSTI4 38
ARGI4
ADDRLP4 2464
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1499
;1499:	trap_Argv( 39, arg39, sizeof( arg39 ) );
CNSTI4 39
ARGI4
ADDRLP4 2528
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1500
;1500:	trap_Argv( 40, arg40, sizeof( arg40 ) );
CNSTI4 40
ARGI4
ADDRLP4 2592
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1501
;1501:	trap_Argv( 41, arg41, sizeof( arg41 ) );
CNSTI4 41
ARGI4
ADDRLP4 2656
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1502
;1502:	trap_Argv( 42, arg42, sizeof( arg42 ) );
CNSTI4 42
ARGI4
ADDRLP4 2720
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1503
;1503:	trap_Argv( 43, arg43, sizeof( arg43 ) );
CNSTI4 43
ARGI4
ADDRLP4 2784
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1504
;1504:	trap_Argv( 44, arg44, sizeof( arg44 ) );
CNSTI4 44
ARGI4
ADDRLP4 2848
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1505
;1505:	trap_Argv( 45, arg45, sizeof( arg45 ) );
CNSTI4 45
ARGI4
ADDRLP4 2912
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1506
;1506:	trap_Argv( 46, arg46, sizeof( arg46 ) );
CNSTI4 46
ARGI4
ADDRLP4 2976
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1507
;1507:	trap_Argv( 47, arg47, sizeof( arg47 ) );
CNSTI4 47
ARGI4
ADDRLP4 3040
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1508
;1508:	trap_Argv( 48, arg48, sizeof( arg48 ) );
CNSTI4 48
ARGI4
ADDRLP4 3104
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1509
;1509:	trap_Argv( 49, arg49, sizeof( arg49 ) );
CNSTI4 49
ARGI4
ADDRLP4 3168
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1510
;1510:	trap_Argv( 50, arg50, sizeof( arg50 ) );
CNSTI4 50
ARGI4
ADDRLP4 3232
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1511
;1511:	trap_Argv( 51, arg51, sizeof( arg51 ) );
CNSTI4 51
ARGI4
ADDRLP4 3296
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1512
;1512:	trap_Argv( 52, arg52, sizeof( arg52 ) );
CNSTI4 52
ARGI4
ADDRLP4 3360
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1513
;1513:	trap_Argv( 53, arg53, sizeof( arg53 ) );
CNSTI4 53
ARGI4
ADDRLP4 3424
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1514
;1514:	trap_Argv( 54, arg54, sizeof( arg54 ) );
CNSTI4 54
ARGI4
ADDRLP4 3488
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1515
;1515:	trap_Argv( 55, arg55, sizeof( arg55 ) );
CNSTI4 55
ARGI4
ADDRLP4 3552
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1516
;1516:	trap_Argv( 56, arg56, sizeof( arg56 ) );
CNSTI4 56
ARGI4
ADDRLP4 3616
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1517
;1517:	trap_Argv( 57, arg57, sizeof( arg57 ) );
CNSTI4 57
ARGI4
ADDRLP4 3680
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1518
;1518:	trap_Argv( 58, arg58, sizeof( arg58 ) );
CNSTI4 58
ARGI4
ADDRLP4 3744
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1519
;1519:	trap_Argv( 59, arg59, sizeof( arg59 ) );
CNSTI4 59
ARGI4
ADDRLP4 3808
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1520
;1520:	trap_Argv( 60, arg60, sizeof( arg60 ) );
CNSTI4 60
ARGI4
ADDRLP4 3872
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1521
;1521:	trap_Argv( 61, arg61, sizeof( arg61 ) );
CNSTI4 61
ARGI4
ADDRLP4 3936
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1524
;1522:	
;1523:	//Set Aiming Directions
;1524:	AngleVectors(ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 272
ARGP4
ADDRLP4 4012
ARGP4
ADDRLP4 4000
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1525
;1525:	CalcMuzzlePoint(ent, forward, right, up, start);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ARGP4
ADDRLP4 4012
ARGP4
ADDRLP4 4000
ARGP4
ADDRLP4 260
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1526
;1526:	VectorMA (start, TOOLGUN_RANGE, forward, end);
ADDRLP4 4024
CNSTF4 1157627904
ASGNF4
ADDRLP4 284
ADDRLP4 260
INDIRF4
ADDRLP4 4024
INDIRF4
ADDRLP4 272
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 284+4
ADDRLP4 260+4
INDIRF4
ADDRLP4 4024
INDIRF4
ADDRLP4 272+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 284+8
ADDRLP4 260+8
INDIRF4
CNSTF4 1157627904
ADDRLP4 272+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1529
;1527:
;1528:	//Trace Position
;1529:	trap_Trace (&tr, start, NULL, NULL, end, ent->s.number, MASK_SELECT );
ADDRLP4 552
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 4028
CNSTP4 0
ASGNP4
ADDRLP4 4028
INDIRP4
ARGP4
ADDRLP4 4028
INDIRP4
ARGP4
ADDRLP4 284
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
line 1531
;1530:	
;1531:	if(!Q_stricmp (arg01, "prop")){
ADDRLP4 296
ARGP4
ADDRGP4 $699
ARGP4
ADDRLP4 4032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4032
INDIRI4
CNSTI4 0
NEI4 $697
line 1532
;1532:	if(!g_allowprops.integer){ return; }
ADDRGP4 g_allowprops+12
INDIRI4
CNSTI4 0
NEI4 $700
ADDRGP4 $687
JUMPV
LABELV $700
line 1533
;1533:	if(g_safe.integer){
ADDRGP4 g_safe+12
INDIRI4
CNSTI4 0
EQI4 $703
line 1534
;1534:	if(!Q_stricmp (arg03, "script_cmd")){
ADDRLP4 196
ARGP4
ADDRGP4 $708
ARGP4
ADDRLP4 4036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4036
INDIRI4
CNSTI4 0
NEI4 $706
line 1535
;1535:	return;
ADDRGP4 $687
JUMPV
LABELV $706
line 1537
;1536:	}
;1537:	if(!Q_stricmp (arg03, "target_modify")){
ADDRLP4 196
ARGP4
ADDRGP4 $711
ARGP4
ADDRLP4 4040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4040
INDIRI4
CNSTI4 0
NEI4 $709
line 1538
;1538:	return;
ADDRGP4 $687
JUMPV
LABELV $709
line 1540
;1539:	}
;1540:	}
LABELV $703
line 1541
;1541:	tent = G_TempEntity( tr.endpos, EV_PARTICLES_GRAVITY );
ADDRLP4 552+12
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 4036
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4036
INDIRP4
ASGNP4
line 1542
;1542:	tent->s.constantLight = (((rand() % 256 | rand() % 256 << 8 ) | rand() % 256 << 16 ) | ( 255 << 24 ));
ADDRLP4 4040
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4044
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4048
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 4040
INDIRI4
CNSTI4 256
MODI4
ADDRLP4 4044
INDIRI4
CNSTI4 256
MODI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 4048
INDIRI4
CNSTI4 256
MODI4
CNSTI4 16
LSHI4
BORI4
CNSTI4 255
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 1543
;1543:	tent->s.eventParm = 24; //eventParm is used to determine the number of particles
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 24
ASGNI4
line 1544
;1544:	tent->s.generic1 = 500; //generic1 is used to determine the speed of the particles
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 500
ASGNI4
line 1545
;1545:	tent->s.generic2 = 16; //generic2 is used to determine the size of the particles
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 16
ASGNI4
line 1546
;1546:	G_BuildPropSL( arg02, arg03, tr.endpos, ent, arg04, arg05, arg06, arg07, arg08, arg09, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45, arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61);
ADDRLP4 4
ARGP4
ADDRLP4 196
ARGP4
ADDRLP4 552+12
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 360
ARGP4
ADDRLP4 424
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 488
ARGP4
ADDRLP4 608
ARGP4
ADDRLP4 672
ARGP4
ADDRLP4 736
ARGP4
ADDRLP4 800
ARGP4
ADDRLP4 864
ARGP4
ADDRLP4 928
ARGP4
ADDRLP4 992
ARGP4
ADDRLP4 1056
ARGP4
ADDRLP4 1120
ARGP4
ADDRLP4 1184
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 1312
ARGP4
ADDRLP4 1376
ARGP4
ADDRLP4 1440
ARGP4
ADDRLP4 1504
ARGP4
ADDRLP4 1568
ARGP4
ADDRLP4 1632
ARGP4
ADDRLP4 1696
ARGP4
ADDRLP4 1760
ARGP4
ADDRLP4 1824
ARGP4
ADDRLP4 1888
ARGP4
ADDRLP4 1952
ARGP4
ADDRLP4 2016
ARGP4
ADDRLP4 2080
ARGP4
ADDRLP4 2144
ARGP4
ADDRLP4 2208
ARGP4
ADDRLP4 2272
ARGP4
ADDRLP4 2336
ARGP4
ADDRLP4 2400
ARGP4
ADDRLP4 2464
ARGP4
ADDRLP4 2528
ARGP4
ADDRLP4 2592
ARGP4
ADDRLP4 2656
ARGP4
ADDRLP4 2720
ARGP4
ADDRLP4 2784
ARGP4
ADDRLP4 2848
ARGP4
ADDRLP4 2912
ARGP4
ADDRLP4 2976
ARGP4
ADDRLP4 3040
ARGP4
ADDRLP4 3104
ARGP4
ADDRLP4 3168
ARGP4
ADDRLP4 3232
ARGP4
ADDRLP4 3296
ARGP4
ADDRLP4 3360
ARGP4
ADDRLP4 3424
ARGP4
ADDRLP4 3488
ARGP4
ADDRLP4 3552
ARGP4
ADDRLP4 3616
ARGP4
ADDRLP4 3680
ARGP4
ADDRLP4 3744
ARGP4
ADDRLP4 3808
ARGP4
ADDRLP4 3872
ARGP4
ADDRLP4 3936
ARGP4
ADDRGP4 G_BuildPropSL
CALLI4
pop
line 1548
;1547:	
;1548:	return;
ADDRGP4 $687
JUMPV
LABELV $697
line 1550
;1549:	}
;1550:	if(!Q_stricmp (arg01, "npc")){
ADDRLP4 296
ARGP4
ADDRGP4 $716
ARGP4
ADDRLP4 4036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4036
INDIRI4
CNSTI4 0
NEI4 $714
line 1551
;1551:	if(!g_allownpc.integer){ return; }
ADDRGP4 g_allownpc+12
INDIRI4
CNSTI4 0
NEI4 $717
ADDRGP4 $687
JUMPV
LABELV $717
line 1553
;1552:	
;1553:	tent = G_Spawn();
ADDRLP4 4040
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4040
INDIRP4
ASGNP4
line 1554
;1554:	tent->sb_ettype = 1;
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
CNSTI4 1
ASGNI4
line 1555
;1555:	VectorCopy( tr.endpos, tent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 552+12
INDIRB
ASGNB 12
line 1556
;1556:	tent->s.origin[2] += 25;
ADDRLP4 4044
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 4044
INDIRP4
ADDRLP4 4044
INDIRP4
INDIRF4
CNSTF4 1103626240
ADDF4
ASGNF4
line 1557
;1557:	tent->classname = "target_botspawn";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $721
ASGNP4
LABELV $722
line 1558
;1558:	CopyAlloc(tent->clientname, arg02);
CNSTU4 64
ARGU4
ADDRLP4 4048
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
ADDRLP4 4048
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $725
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $725
LABELV $723
line 1559
;1559:	tent->type = NPC_ENEMY;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 1
ASGNI4
line 1560
;1560:	if(!Q_stricmp (arg03, "NPC_Enemy")){
ADDRLP4 196
ARGP4
ADDRGP4 $729
ARGP4
ADDRLP4 4048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4048
INDIRI4
CNSTI4 0
NEI4 $727
line 1561
;1561:	tent->type = NPC_ENEMY;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 1
ASGNI4
line 1562
;1562:	}
LABELV $727
line 1563
;1563:	if(!Q_stricmp (arg03, "NPC_Citizen")){
ADDRLP4 196
ARGP4
ADDRGP4 $732
ARGP4
ADDRLP4 4052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4052
INDIRI4
CNSTI4 0
NEI4 $730
line 1564
;1564:	tent->type = NPC_CITIZEN;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 2
ASGNI4
line 1565
;1565:	}
LABELV $730
line 1566
;1566:	if(!Q_stricmp (arg03, "NPC_Guard")){
ADDRLP4 196
ARGP4
ADDRGP4 $735
ARGP4
ADDRLP4 4056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4056
INDIRI4
CNSTI4 0
NEI4 $733
line 1567
;1567:	tent->type = NPC_GUARD;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 3
ASGNI4
line 1568
;1568:	}
LABELV $733
line 1569
;1569:	if(!Q_stricmp (arg03, "NPC_Partner")){
ADDRLP4 196
ARGP4
ADDRGP4 $738
ARGP4
ADDRLP4 4060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4060
INDIRI4
CNSTI4 0
NEI4 $736
line 1570
;1570:	tent->type = NPC_PARTNER;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 4
ASGNI4
line 1571
;1571:	}
LABELV $736
line 1572
;1572:	if(!Q_stricmp (arg03, "NPC_PartnerEnemy")){
ADDRLP4 196
ARGP4
ADDRGP4 $741
ARGP4
ADDRLP4 4064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4064
INDIRI4
CNSTI4 0
NEI4 $739
line 1573
;1573:	tent->type = NPC_PARTNERENEMY;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 5
ASGNI4
line 1574
;1574:	}
LABELV $739
line 1575
;1575:	tent->skill = atof(arg04);
ADDRLP4 360
ARGP4
ADDRLP4 4068
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ADDRLP4 4068
INDIRF4
ASGNF4
line 1576
;1576:	tent->health = atoi(arg05);
ADDRLP4 424
ARGP4
ADDRLP4 4072
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 4072
INDIRI4
ASGNI4
LABELV $742
line 1577
;1577:	CopyAlloc(tent->message, arg06);	
CNSTU4 64
ARGU4
ADDRLP4 4076
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 4076
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $745
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $745
LABELV $743
line 1578
;1578:	tent->spawnflags = atoi(arg08);
ADDRLP4 488
ARGP4
ADDRLP4 4076
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 4076
INDIRI4
ASGNI4
line 1579
;1579:	if(!Q_stricmp (arg07, "0") ){
ADDRLP4 132
ARGP4
ADDRGP4 $749
ARGP4
ADDRLP4 4080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4080
INDIRI4
CNSTI4 0
NEI4 $747
LABELV $750
line 1580
;1580:	CopyAlloc(tent->target, arg02);	
CNSTU4 64
ARGU4
ADDRLP4 4084
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 4084
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $748
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1581
;1581:	} else {
ADDRGP4 $748
JUMPV
LABELV $747
LABELV $755
line 1582
;1582:	CopyAlloc(tent->target, arg07);	
CNSTU4 64
ARGU4
ADDRLP4 4084
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 4084
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $758
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 132
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $758
LABELV $756
line 1583
;1583:	}
LABELV $748
line 1584
;1584:	if(tent->health <= 0){
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
GTI4 $760
line 1585
;1585:	tent->health = 100;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 100
ASGNI4
line 1586
;1586:	}
LABELV $760
line 1587
;1587:	if(tent->skill <= 0){
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
CNSTF4 0
GTF4 $762
line 1588
;1588:	tent->skill = 1;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
CNSTF4 1065353216
ASGNF4
line 1589
;1589:	}
LABELV $762
line 1590
;1590:	if(tent->spawnflags <= 0){
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 0
GTI4 $764
line 1591
;1591:	tent->spawnflags = 1;
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTI4 1
ASGNI4
line 1592
;1592:	}
LABELV $764
line 1593
;1593:	if(!Q_stricmp (tent->message, "0") || !tent->message ){
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRGP4 $749
ARGP4
ADDRLP4 4084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4084
INDIRI4
CNSTI4 0
EQI4 $768
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $766
LABELV $768
LABELV $769
line 1594
;1594:	CopyAlloc(tent->message, tent->clientname);
CNSTU4 4
ARGU4
ADDRLP4 4088
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 4088
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $772
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $772
LABELV $770
line 1595
;1595:	}
LABELV $766
line 1596
;1596:	G_AddBot(tent->clientname, tent->skill, "Blue", 0, tent->message, tent->s.number, tent->target, tent->type, tent );
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
ARGF4
ADDRGP4 $774
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 680
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
CNSTI4 1048
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_AddBot
CALLI4
pop
line 1598
;1597:	
;1598:	trap_Cvar_Set("g_spSkill", arg04);
ADDRGP4 $775
ARGP4
ADDRLP4 360
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1599
;1599:	return;
LABELV $714
line 1601
;1600:	}
;1601:}
LABELV $687
endproc Cmd_SpawnList_Item_f 4096 248
proc Cmd_Modify_Prop_f 1364 84
line 1609
;1602:
;1603:/*
;1604:==================
;1605:Cmd_Modify_Prop_f
;1606:Added for QSandbox.
;1607:==================
;1608:*/
;1609:static void Cmd_Modify_Prop_f( gentity_t *ent ){
line 1634
;1610:	vec3_t		end, start, forward, up, right;
;1611:	trace_t		tr;
;1612:	gentity_t 	*tent;
;1613:	gentity_t	*traceEnt;
;1614:	char		arg01[64];
;1615:	char		arg02[64];
;1616:	char		arg03[64];
;1617:	char		arg04[64];
;1618:	char		arg05[64];
;1619:	char		arg06[64];
;1620:	char		arg07[64];
;1621:	char		arg08[64];
;1622:	char		arg09[64];
;1623:	char		arg10[64];
;1624:	char		arg11[64];
;1625:	char		arg12[64];
;1626:	char		arg13[64];
;1627:	char		arg14[64];
;1628:	char		arg15[64];
;1629:	char		arg16[64];
;1630:	char		arg17[64];
;1631:	char		arg18[64];
;1632:	char		arg19[64];
;1633:	
;1634:	if(g_gametype.integer != GT_SANDBOX){ return; }
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $777
ADDRGP4 $776
JUMPV
LABELV $777
line 1637
;1635:		
;1636:	//tr.endpos
;1637:	trap_Argv( 1, arg01, sizeof( arg01 ) );
CNSTI4 1
ARGI4
ADDRLP4 96
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1638
;1638:	trap_Argv( 2, arg02, sizeof( arg02 ) );
CNSTI4 2
ARGI4
ADDRLP4 160
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1639
;1639:	trap_Argv( 3, arg03, sizeof( arg03 ) );
CNSTI4 3
ARGI4
ADDRLP4 224
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1640
;1640:	trap_Argv( 4, arg04, sizeof( arg04 ) );
CNSTI4 4
ARGI4
ADDRLP4 288
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1641
;1641:	trap_Argv( 5, arg05, sizeof( arg05 ) );
CNSTI4 5
ARGI4
ADDRLP4 352
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1642
;1642:	trap_Argv( 6, arg06, sizeof( arg06 ) );
CNSTI4 6
ARGI4
ADDRLP4 416
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1643
;1643:	trap_Argv( 7, arg07, sizeof( arg07 ) );
CNSTI4 7
ARGI4
ADDRLP4 480
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1644
;1644:	trap_Argv( 8, arg08, sizeof( arg08 ) );
CNSTI4 8
ARGI4
ADDRLP4 544
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1645
;1645:	trap_Argv( 9, arg09, sizeof( arg09 ) );
CNSTI4 9
ARGI4
ADDRLP4 608
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1646
;1646:	trap_Argv( 10, arg10, sizeof( arg10 ) );
CNSTI4 10
ARGI4
ADDRLP4 672
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1647
;1647:	trap_Argv( 11, arg11, sizeof( arg11 ) );
CNSTI4 11
ARGI4
ADDRLP4 736
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1648
;1648:	trap_Argv( 12, arg12, sizeof( arg12 ) );
CNSTI4 12
ARGI4
ADDRLP4 800
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1649
;1649:	trap_Argv( 13, arg13, sizeof( arg13 ) );
CNSTI4 13
ARGI4
ADDRLP4 864
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1650
;1650:	trap_Argv( 14, arg14, sizeof( arg14 ) );
CNSTI4 14
ARGI4
ADDRLP4 928
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1651
;1651:	trap_Argv( 15, arg15, sizeof( arg15 ) );
CNSTI4 15
ARGI4
ADDRLP4 992
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1652
;1652:	trap_Argv( 16, arg16, sizeof( arg16 ) );
CNSTI4 16
ARGI4
ADDRLP4 1056
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1653
;1653:	trap_Argv( 17, arg17, sizeof( arg17 ) );
CNSTI4 17
ARGI4
ADDRLP4 1120
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1654
;1654:	trap_Argv( 18, arg18, sizeof( arg18 ) );
CNSTI4 18
ARGI4
ADDRLP4 1184
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1655
;1655:	trap_Argv( 19, arg19, sizeof( arg19 ) );
CNSTI4 19
ARGI4
ADDRLP4 1248
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1658
;1656:	
;1657:	//Set Aiming Directions
;1658:	AngleVectors(ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1324
ARGP4
ADDRLP4 1312
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1659
;1659:	CalcMuzzlePoint(ent, forward, right, up, start);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1324
ARGP4
ADDRLP4 1312
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1660
;1660:	VectorMA (start, TOOLGUN_RANGE, forward, end);
ADDRLP4 1340
CNSTF4 1157627904
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRF4
ADDRLP4 1340
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1340
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1157627904
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1663
;1661:
;1662:	//Trace Position
;1663:	trap_Trace (&tr, start, NULL, NULL, end, ent->s.number, MASK_SELECT );
ADDRLP4 40
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1344
CNSTP4 0
ASGNP4
ADDRLP4 1344
INDIRP4
ARGP4
ADDRLP4 1344
INDIRP4
ARGP4
ADDRLP4 28
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
line 1665
;1664:	
;1665:	traceEnt = &g_entities[ tr.entityNum ];		//entity for modding
ADDRLP4 1336
CNSTI4 2492
ADDRLP4 40+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1667
;1666:	
;1667:	tent = G_TempEntity( tr.endpos, EV_PARTICLES_GRAVITY );
ADDRLP4 40+12
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 1348
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 1348
INDIRP4
ASGNP4
line 1668
;1668:	tent->s.constantLight = (((rand() % 256 | rand() % 256 << 8 ) | rand() % 256 << 16 ) | ( 255 << 24 ));
ADDRLP4 1352
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1356
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1360
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 1352
INDIRI4
CNSTI4 256
MODI4
ADDRLP4 1356
INDIRI4
CNSTI4 256
MODI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 1360
INDIRI4
CNSTI4 256
MODI4
CNSTI4 16
LSHI4
BORI4
CNSTI4 255
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 1669
;1669:	tent->s.eventParm = 24; //eventParm is used to determine the number of particles
ADDRLP4 24
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 24
ASGNI4
line 1670
;1670:	tent->s.generic1 = 125; //generic1 is used to determine the speed of the particles
ADDRLP4 24
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 125
ASGNI4
line 1671
;1671:	tent->s.generic2 = 3; //generic2 is used to determine the size of the particles
ADDRLP4 24
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 3
ASGNI4
line 1672
;1672:	G_ModProp( traceEnt, ent, arg01, arg02, arg03, arg04, arg05, arg06, arg07, arg08, arg09, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19);
ADDRLP4 1336
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 224
ARGP4
ADDRLP4 288
ARGP4
ADDRLP4 352
ARGP4
ADDRLP4 416
ARGP4
ADDRLP4 480
ARGP4
ADDRLP4 544
ARGP4
ADDRLP4 608
ARGP4
ADDRLP4 672
ARGP4
ADDRLP4 736
ARGP4
ADDRLP4 800
ARGP4
ADDRLP4 864
ARGP4
ADDRLP4 928
ARGP4
ADDRLP4 992
ARGP4
ADDRLP4 1056
ARGP4
ADDRLP4 1120
ARGP4
ADDRLP4 1184
ARGP4
ADDRLP4 1248
ARGP4
ADDRGP4 G_ModProp
CALLV
pop
line 1673
;1673:	return;
LABELV $776
endproc Cmd_Modify_Prop_f 1364 84
proc Cmd_Altfire_Physgun_f 0 0
line 1682
;1674:}
;1675:
;1676:/*
;1677:==================
;1678:Cmd_Altfire_Physgun_f
;1679:Added for QSandbox.
;1680:==================
;1681:*/
;1682:static void Cmd_Altfire_Physgun_f( gentity_t *ent ){
line 1683
;1683:	if ( ent->client->ps.weapon == WP_PHYSGUN ){
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 17
NEI4 $789
line 1684
;1684:	    if (ent->client->buttons & BUTTON_ATTACK) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $791
line 1685
;1685:			if (ent->grabbedEntity) {
ADDRFP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $793
line 1686
;1686:				ent->grabbedEntity->grabNewPhys = 1;	//say physgun about freeze option
ADDRFP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 1
ASGNI4
line 1687
;1687:			}
LABELV $793
line 1688
;1688:		}
LABELV $791
line 1689
;1689:	}
LABELV $789
line 1690
;1690:}
LABELV $788
endproc Cmd_Altfire_Physgun_f 0 0
proc Cmd_PropNpc_AS_f 4192 248
line 1698
;1691:
;1692:/*
;1693:==================
;1694:Cmd_PropNpc_AS_f
;1695:Added for QSandbox.
;1696:==================
;1697:*/
;1698:static void Cmd_PropNpc_AS_f( gentity_t *ent ){
line 1766
;1699:	vec3_t		end;
;1700:	gentity_t 	*tent;
;1701:	char		cord_x[64];
;1702:	char		cord_y[64];
;1703:	char		cord_z[64];
;1704:	char		arg01[64];
;1705:	char		arg02[64];
;1706:	char		arg03[64];
;1707:	char		arg04[64];
;1708:	char		arg05[64];
;1709:	char		arg06[64];
;1710:	char		arg07[64];
;1711:	char		arg08[64];
;1712:	char		arg09[64];
;1713:	char		arg10[64];
;1714:	char		arg11[64];
;1715:	char		arg12[64];
;1716:	char		arg13[64];
;1717:	char		arg14[64];
;1718:	char		arg15[64];
;1719:	char		arg16[64];
;1720:	char		arg17[64];
;1721:	char		arg18[64];
;1722:	char		arg19[64];
;1723:	char		arg20[64];
;1724:	char		arg21[64];
;1725:	char		arg22[64];
;1726:	char		arg23[64];
;1727:	char		arg24[64];
;1728:	char		arg25[64];
;1729:	char		arg26[64];
;1730:	char		arg27[64];
;1731:	char		arg28[64];
;1732:	char		arg29[64];
;1733:	char		arg30[64];
;1734:	char		arg31[64];
;1735:	char		arg32[64];
;1736:	char		arg33[64];
;1737:	char		arg34[64];
;1738:	char		arg35[64];
;1739:	char		arg36[64];
;1740:	char		arg37[64];
;1741:	char		arg38[64];
;1742:	char		arg39[64];
;1743:	char		arg40[64];
;1744:	char		arg41[64];
;1745:	char		arg42[64];
;1746:	char		arg43[64];
;1747:	char		arg44[64];
;1748:	char		arg45[64];
;1749:	char		arg46[64];
;1750:	char		arg47[64];
;1751:	char		arg48[64];
;1752:	char		arg49[64];
;1753:	char		arg50[64];
;1754:	char		arg51[64];
;1755:	char		arg52[64];
;1756:	char		arg53[64];
;1757:	char		arg54[64];
;1758:	char		arg55[64];
;1759:	char		arg56[64];
;1760:	char		arg57[64];
;1761:	char		arg58[64];
;1762:	char		arg59[64];
;1763:	char		arg60[64];
;1764:	char		arg61[64];
;1765:	
;1766:	if(g_gametype.integer != GT_SANDBOX){ return; }
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $796
ADDRGP4 $795
JUMPV
LABELV $796
line 1769
;1767:		
;1768:	//tr.endpos
;1769:	trap_Argv( 1, cord_x, sizeof( cord_x ) );
CNSTI4 1
ARGI4
ADDRLP4 400
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1770
;1770:	trap_Argv( 2, cord_y, sizeof( cord_y ) );
CNSTI4 2
ARGI4
ADDRLP4 464
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1771
;1771:	trap_Argv( 3, cord_z, sizeof( cord_z ) );
CNSTI4 3
ARGI4
ADDRLP4 528
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1772
;1772:	trap_Argv( 4, arg01, sizeof( arg01 ) );
CNSTI4 4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1773
;1773:	trap_Argv( 5, arg02, sizeof( arg02 ) );
CNSTI4 5
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1774
;1774:	trap_Argv( 6, arg03, sizeof( arg03 ) );
CNSTI4 6
ARGI4
ADDRLP4 196
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1775
;1775:	trap_Argv( 7, arg04, sizeof( arg04 ) );
CNSTI4 7
ARGI4
ADDRLP4 336
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1776
;1776:	trap_Argv( 8, arg05, sizeof( arg05 ) );
CNSTI4 8
ARGI4
ADDRLP4 592
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1777
;1777:	trap_Argv( 9, arg06, sizeof( arg06 ) );
CNSTI4 9
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1778
;1778:	trap_Argv( 10, arg07, sizeof( arg07 ) );
CNSTI4 10
ARGI4
ADDRLP4 132
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1779
;1779:	trap_Argv( 11, arg08, sizeof( arg08 ) );
CNSTI4 11
ARGI4
ADDRLP4 656
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1780
;1780:	trap_Argv( 12, arg09, sizeof( arg09 ) );
CNSTI4 12
ARGI4
ADDRLP4 720
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1781
;1781:	trap_Argv( 13, arg10, sizeof( arg10 ) );
CNSTI4 13
ARGI4
ADDRLP4 784
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1782
;1782:	trap_Argv( 14, arg11, sizeof( arg11 ) );
CNSTI4 14
ARGI4
ADDRLP4 848
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1783
;1783:	trap_Argv( 15, arg12, sizeof( arg12 ) );
CNSTI4 15
ARGI4
ADDRLP4 912
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1784
;1784:	trap_Argv( 16, arg13, sizeof( arg13 ) );
CNSTI4 16
ARGI4
ADDRLP4 976
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1785
;1785:	trap_Argv( 17, arg14, sizeof( arg14 ) );
CNSTI4 17
ARGI4
ADDRLP4 1040
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1786
;1786:	trap_Argv( 18, arg15, sizeof( arg15 ) );
CNSTI4 18
ARGI4
ADDRLP4 1104
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1787
;1787:	trap_Argv( 19, arg16, sizeof( arg16 ) );
CNSTI4 19
ARGI4
ADDRLP4 1168
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1788
;1788:	trap_Argv( 20, arg17, sizeof( arg17 ) );
CNSTI4 20
ARGI4
ADDRLP4 1232
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1789
;1789:	trap_Argv( 21, arg18, sizeof( arg18 ) );
CNSTI4 21
ARGI4
ADDRLP4 1296
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1790
;1790:	trap_Argv( 22, arg19, sizeof( arg19 ) );
CNSTI4 22
ARGI4
ADDRLP4 1360
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1791
;1791:	trap_Argv( 23, arg20, sizeof( arg20 ) );
CNSTI4 23
ARGI4
ADDRLP4 1424
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1792
;1792:	trap_Argv( 24, arg21, sizeof( arg21 ) );
CNSTI4 24
ARGI4
ADDRLP4 1488
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1793
;1793:	trap_Argv( 25, arg22, sizeof( arg22 ) );
CNSTI4 25
ARGI4
ADDRLP4 1552
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1794
;1794:	trap_Argv( 26, arg23, sizeof( arg23 ) );
CNSTI4 26
ARGI4
ADDRLP4 1616
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1795
;1795:	trap_Argv( 27, arg24, sizeof( arg24 ) );
CNSTI4 27
ARGI4
ADDRLP4 1680
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1796
;1796:	trap_Argv( 28, arg25, sizeof( arg25 ) );
CNSTI4 28
ARGI4
ADDRLP4 1744
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1797
;1797:	trap_Argv( 29, arg26, sizeof( arg26 ) );
CNSTI4 29
ARGI4
ADDRLP4 1808
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1798
;1798:	trap_Argv( 30, arg27, sizeof( arg27 ) );
CNSTI4 30
ARGI4
ADDRLP4 1872
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1799
;1799:	trap_Argv( 31, arg28, sizeof( arg28 ) );
CNSTI4 31
ARGI4
ADDRLP4 1936
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1800
;1800:	trap_Argv( 32, arg29, sizeof( arg29 ) );
CNSTI4 32
ARGI4
ADDRLP4 2000
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1801
;1801:	trap_Argv( 33, arg30, sizeof( arg30 ) );
CNSTI4 33
ARGI4
ADDRLP4 2064
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1802
;1802:	trap_Argv( 34, arg31, sizeof( arg31 ) );
CNSTI4 34
ARGI4
ADDRLP4 2128
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1803
;1803:	trap_Argv( 35, arg32, sizeof( arg32 ) );
CNSTI4 35
ARGI4
ADDRLP4 2192
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1804
;1804:	trap_Argv( 36, arg33, sizeof( arg33 ) );
CNSTI4 36
ARGI4
ADDRLP4 2256
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1805
;1805:	trap_Argv( 37, arg34, sizeof( arg34 ) );
CNSTI4 37
ARGI4
ADDRLP4 2320
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1806
;1806:	trap_Argv( 38, arg35, sizeof( arg35 ) );
CNSTI4 38
ARGI4
ADDRLP4 2384
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1807
;1807:	trap_Argv( 39, arg36, sizeof( arg36 ) );
CNSTI4 39
ARGI4
ADDRLP4 2448
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1808
;1808:	trap_Argv( 40, arg37, sizeof( arg37 ) );
CNSTI4 40
ARGI4
ADDRLP4 2512
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1809
;1809:	trap_Argv( 41, arg38, sizeof( arg38 ) );
CNSTI4 41
ARGI4
ADDRLP4 2576
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1810
;1810:	trap_Argv( 42, arg39, sizeof( arg39 ) );
CNSTI4 42
ARGI4
ADDRLP4 2640
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1811
;1811:	trap_Argv( 43, arg40, sizeof( arg40 ) );
CNSTI4 43
ARGI4
ADDRLP4 2704
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1812
;1812:	trap_Argv( 44, arg41, sizeof( arg41 ) );
CNSTI4 44
ARGI4
ADDRLP4 2768
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1813
;1813:	trap_Argv( 45, arg42, sizeof( arg42 ) );
CNSTI4 45
ARGI4
ADDRLP4 2832
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1814
;1814:	trap_Argv( 46, arg43, sizeof( arg43 ) );
CNSTI4 46
ARGI4
ADDRLP4 2896
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1815
;1815:	trap_Argv( 47, arg44, sizeof( arg44 ) );
CNSTI4 47
ARGI4
ADDRLP4 2960
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1816
;1816:	trap_Argv( 48, arg45, sizeof( arg45 ) );
CNSTI4 48
ARGI4
ADDRLP4 3024
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1817
;1817:	trap_Argv( 49, arg46, sizeof( arg46 ) );
CNSTI4 49
ARGI4
ADDRLP4 3088
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1818
;1818:	trap_Argv( 50, arg47, sizeof( arg47 ) );
CNSTI4 50
ARGI4
ADDRLP4 3152
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1819
;1819:	trap_Argv( 51, arg48, sizeof( arg48 ) );
CNSTI4 51
ARGI4
ADDRLP4 3216
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1820
;1820:	trap_Argv( 52, arg49, sizeof( arg49 ) );
CNSTI4 52
ARGI4
ADDRLP4 3280
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1821
;1821:	trap_Argv( 53, arg50, sizeof( arg50 ) );
CNSTI4 53
ARGI4
ADDRLP4 3344
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1822
;1822:	trap_Argv( 54, arg51, sizeof( arg51 ) );
CNSTI4 54
ARGI4
ADDRLP4 3408
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1823
;1823:	trap_Argv( 55, arg52, sizeof( arg52 ) );
CNSTI4 55
ARGI4
ADDRLP4 3472
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1824
;1824:	trap_Argv( 56, arg53, sizeof( arg53 ) );
CNSTI4 56
ARGI4
ADDRLP4 3536
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1825
;1825:	trap_Argv( 57, arg54, sizeof( arg54 ) );
CNSTI4 57
ARGI4
ADDRLP4 3600
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1826
;1826:	trap_Argv( 58, arg55, sizeof( arg55 ) );
CNSTI4 58
ARGI4
ADDRLP4 3664
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1827
;1827:	trap_Argv( 59, arg56, sizeof( arg56 ) );
CNSTI4 59
ARGI4
ADDRLP4 3728
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1828
;1828:	trap_Argv( 60, arg57, sizeof( arg57 ) );
CNSTI4 60
ARGI4
ADDRLP4 3792
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1829
;1829:	trap_Argv( 61, arg58, sizeof( arg58 ) );
CNSTI4 61
ARGI4
ADDRLP4 3856
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1830
;1830:	trap_Argv( 62, arg59, sizeof( arg59 ) );
CNSTI4 62
ARGI4
ADDRLP4 3920
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1831
;1831:	trap_Argv( 63, arg60, sizeof( arg60 ) );
CNSTI4 63
ARGI4
ADDRLP4 3984
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1832
;1832:	trap_Argv( 64, arg61, sizeof( arg61 ) );
ADDRLP4 4112
CNSTI4 64
ASGNI4
ADDRLP4 4112
INDIRI4
ARGI4
ADDRLP4 4048
ARGP4
ADDRLP4 4112
INDIRI4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1834
;1833:	
;1834:	end[0] = atof(cord_x);
ADDRLP4 400
ARGP4
ADDRLP4 4116
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 324
ADDRLP4 4116
INDIRF4
ASGNF4
line 1835
;1835:	end[1] = atof(cord_y);
ADDRLP4 464
ARGP4
ADDRLP4 4120
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 324+4
ADDRLP4 4120
INDIRF4
ASGNF4
line 1836
;1836:	end[2] = atof(cord_z);
ADDRLP4 528
ARGP4
ADDRLP4 4124
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 324+8
ADDRLP4 4124
INDIRF4
ASGNF4
line 1838
;1837:	
;1838:	if(!Q_stricmp (arg01, "prop")){
ADDRLP4 260
ARGP4
ADDRGP4 $699
ARGP4
ADDRLP4 4128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4128
INDIRI4
CNSTI4 0
NEI4 $801
line 1839
;1839:	if(!g_allowprops.integer){ return; }
ADDRGP4 g_allowprops+12
INDIRI4
CNSTI4 0
NEI4 $803
ADDRGP4 $795
JUMPV
LABELV $803
line 1840
;1840:	if(g_safe.integer){
ADDRGP4 g_safe+12
INDIRI4
CNSTI4 0
EQI4 $806
line 1841
;1841:	if(!Q_stricmp (arg03, "script_cmd")){
ADDRLP4 196
ARGP4
ADDRGP4 $708
ARGP4
ADDRLP4 4132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4132
INDIRI4
CNSTI4 0
NEI4 $809
line 1842
;1842:	return;
ADDRGP4 $795
JUMPV
LABELV $809
line 1844
;1843:	}
;1844:	if(!Q_stricmp (arg03, "target_modify")){
ADDRLP4 196
ARGP4
ADDRGP4 $711
ARGP4
ADDRLP4 4136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4136
INDIRI4
CNSTI4 0
NEI4 $811
line 1845
;1845:	return;
ADDRGP4 $795
JUMPV
LABELV $811
line 1847
;1846:	}
;1847:	}
LABELV $806
line 1848
;1848:	G_BuildPropSL( arg02, arg03, end, ent, arg04, arg05, arg06, arg07, arg08, arg09, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, arg33, arg34, arg35, arg36, arg37, arg38, arg39, arg40, arg41, arg42, arg43, arg44, arg45, arg46, arg47, arg48, arg49, arg50, arg51, arg52, arg53, arg54, arg55, arg56, arg57, arg58, arg59, arg60, arg61);
ADDRLP4 4
ARGP4
ADDRLP4 196
ARGP4
ADDRLP4 324
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 336
ARGP4
ADDRLP4 592
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 132
ARGP4
ADDRLP4 656
ARGP4
ADDRLP4 720
ARGP4
ADDRLP4 784
ARGP4
ADDRLP4 848
ARGP4
ADDRLP4 912
ARGP4
ADDRLP4 976
ARGP4
ADDRLP4 1040
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1168
ARGP4
ADDRLP4 1232
ARGP4
ADDRLP4 1296
ARGP4
ADDRLP4 1360
ARGP4
ADDRLP4 1424
ARGP4
ADDRLP4 1488
ARGP4
ADDRLP4 1552
ARGP4
ADDRLP4 1616
ARGP4
ADDRLP4 1680
ARGP4
ADDRLP4 1744
ARGP4
ADDRLP4 1808
ARGP4
ADDRLP4 1872
ARGP4
ADDRLP4 1936
ARGP4
ADDRLP4 2000
ARGP4
ADDRLP4 2064
ARGP4
ADDRLP4 2128
ARGP4
ADDRLP4 2192
ARGP4
ADDRLP4 2256
ARGP4
ADDRLP4 2320
ARGP4
ADDRLP4 2384
ARGP4
ADDRLP4 2448
ARGP4
ADDRLP4 2512
ARGP4
ADDRLP4 2576
ARGP4
ADDRLP4 2640
ARGP4
ADDRLP4 2704
ARGP4
ADDRLP4 2768
ARGP4
ADDRLP4 2832
ARGP4
ADDRLP4 2896
ARGP4
ADDRLP4 2960
ARGP4
ADDRLP4 3024
ARGP4
ADDRLP4 3088
ARGP4
ADDRLP4 3152
ARGP4
ADDRLP4 3216
ARGP4
ADDRLP4 3280
ARGP4
ADDRLP4 3344
ARGP4
ADDRLP4 3408
ARGP4
ADDRLP4 3472
ARGP4
ADDRLP4 3536
ARGP4
ADDRLP4 3600
ARGP4
ADDRLP4 3664
ARGP4
ADDRLP4 3728
ARGP4
ADDRLP4 3792
ARGP4
ADDRLP4 3856
ARGP4
ADDRLP4 3920
ARGP4
ADDRLP4 3984
ARGP4
ADDRLP4 4048
ARGP4
ADDRGP4 G_BuildPropSL
CALLI4
pop
line 1851
;1849:	
;1850:	
;1851:	return;
ADDRGP4 $795
JUMPV
LABELV $801
line 1853
;1852:	}
;1853:	if(!Q_stricmp (arg01, "npc")){
ADDRLP4 260
ARGP4
ADDRGP4 $716
ARGP4
ADDRLP4 4132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4132
INDIRI4
CNSTI4 0
NEI4 $813
line 1854
;1854:	if(!g_allownpc.integer){ return; }
ADDRGP4 g_allownpc+12
INDIRI4
CNSTI4 0
NEI4 $815
ADDRGP4 $795
JUMPV
LABELV $815
line 1856
;1855:	
;1856:	tent = G_Spawn();
ADDRLP4 4136
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4136
INDIRP4
ASGNP4
line 1857
;1857:	tent->sb_ettype = 1;
ADDRLP4 0
INDIRP4
CNSTI4 896
ADDP4
CNSTI4 1
ASGNI4
line 1858
;1858:	VectorCopy( ent, tent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1859
;1859:	tent->s.origin[2] += 25;
ADDRLP4 4140
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 4140
INDIRP4
ADDRLP4 4140
INDIRP4
INDIRF4
CNSTF4 1103626240
ADDF4
ASGNF4
line 1860
;1860:	tent->classname = "target_botspawn";
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 $721
ASGNP4
LABELV $818
line 1861
;1861:	CopyAlloc(tent->clientname, arg02);
CNSTU4 64
ARGU4
ADDRLP4 4144
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
ADDRLP4 4144
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $821
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $821
LABELV $819
line 1862
;1862:	tent->type = NPC_ENEMY;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 1
ASGNI4
line 1863
;1863:	if(!Q_stricmp (arg03, "NPC_Enemy")){
ADDRLP4 196
ARGP4
ADDRGP4 $729
ARGP4
ADDRLP4 4144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4144
INDIRI4
CNSTI4 0
NEI4 $823
line 1864
;1864:	tent->type = NPC_ENEMY;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 1
ASGNI4
line 1865
;1865:	}
LABELV $823
line 1866
;1866:	if(!Q_stricmp (arg03, "NPC_Citizen")){
ADDRLP4 196
ARGP4
ADDRGP4 $732
ARGP4
ADDRLP4 4148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4148
INDIRI4
CNSTI4 0
NEI4 $825
line 1867
;1867:	tent->type = NPC_CITIZEN;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 2
ASGNI4
line 1868
;1868:	}
LABELV $825
line 1869
;1869:	if(!Q_stricmp (arg03, "NPC_Guard")){
ADDRLP4 196
ARGP4
ADDRGP4 $735
ARGP4
ADDRLP4 4152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4152
INDIRI4
CNSTI4 0
NEI4 $827
line 1870
;1870:	tent->type = NPC_GUARD;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 3
ASGNI4
line 1871
;1871:	}
LABELV $827
line 1872
;1872:	if(!Q_stricmp (arg03, "NPC_Partner")){
ADDRLP4 196
ARGP4
ADDRGP4 $738
ARGP4
ADDRLP4 4156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4156
INDIRI4
CNSTI4 0
NEI4 $829
line 1873
;1873:	tent->type = NPC_PARTNER;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 4
ASGNI4
line 1874
;1874:	}
LABELV $829
line 1875
;1875:	if(!Q_stricmp (arg03, "NPC_PartnerEnemy")){
ADDRLP4 196
ARGP4
ADDRGP4 $741
ARGP4
ADDRLP4 4160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4160
INDIRI4
CNSTI4 0
NEI4 $831
line 1876
;1876:	tent->type = NPC_PARTNERENEMY;
ADDRLP4 0
INDIRP4
CNSTI4 1048
ADDP4
CNSTI4 5
ASGNI4
line 1877
;1877:	}
LABELV $831
line 1878
;1878:	tent->skill = atof(arg04);
ADDRLP4 336
ARGP4
ADDRLP4 4164
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
ADDRLP4 4164
INDIRF4
ASGNF4
line 1879
;1879:	tent->health = atoi(arg05);
ADDRLP4 592
ARGP4
ADDRLP4 4168
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 4168
INDIRI4
ASGNI4
LABELV $833
line 1880
;1880:	CopyAlloc(tent->message, arg06);	
CNSTU4 64
ARGU4
ADDRLP4 4172
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 4172
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $836
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $836
LABELV $834
line 1881
;1881:	tent->spawnflags = atoi(arg08);
ADDRLP4 656
ARGP4
ADDRLP4 4172
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 4172
INDIRI4
ASGNI4
line 1882
;1882:	if(!Q_stricmp (arg07, "0") ){
ADDRLP4 132
ARGP4
ADDRGP4 $749
ARGP4
ADDRLP4 4176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4176
INDIRI4
CNSTI4 0
NEI4 $838
LABELV $840
line 1883
;1883:	CopyAlloc(tent->target, arg02);	
CNSTU4 64
ARGU4
ADDRLP4 4180
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 4180
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $839
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1884
;1884:	} else {
ADDRGP4 $839
JUMPV
LABELV $838
LABELV $845
line 1885
;1885:	CopyAlloc(tent->target, arg07);	
CNSTU4 64
ARGU4
ADDRLP4 4180
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 4180
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $848
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 132
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $848
LABELV $846
line 1886
;1886:	}
LABELV $839
line 1887
;1887:	if(tent->health <= 0){
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
GTI4 $850
line 1888
;1888:	tent->health = 100;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 100
ASGNI4
line 1889
;1889:	}
LABELV $850
line 1890
;1890:	if(tent->skill <= 0){
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
CNSTF4 0
GTF4 $852
line 1891
;1891:	tent->skill = 1;
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
CNSTF4 1065353216
ASGNF4
line 1892
;1892:	}
LABELV $852
line 1893
;1893:	if(tent->spawnflags <= 0){
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
CNSTI4 0
GTI4 $854
line 1894
;1894:	tent->spawnflags = 1;
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTI4 1
ASGNI4
line 1895
;1895:	}
LABELV $854
line 1896
;1896:	if(!Q_stricmp (tent->message, "0") || !tent->message ){
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRGP4 $749
ARGP4
ADDRLP4 4180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 0
EQI4 $858
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $856
LABELV $858
LABELV $859
line 1897
;1897:	CopyAlloc(tent->message, tent->clientname);
CNSTU4 4
ARGU4
ADDRLP4 4184
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 4184
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $862
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $862
LABELV $860
line 1898
;1898:	}
LABELV $856
line 1899
;1899:	G_AddBot(tent->clientname, tent->skill, "Blue", 0, tent->message, tent->s.number, tent->target, tent->type, tent );
ADDRLP4 0
INDIRP4
CNSTI4 1064
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 2180
ADDP4
INDIRF4
ARGF4
ADDRGP4 $774
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 680
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
CNSTI4 1048
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_AddBot
CALLI4
pop
line 1901
;1900:	
;1901:	trap_Cvar_Set("g_spSkill", arg04);
ADDRGP4 $775
ARGP4
ADDRLP4 336
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1902
;1902:	return;
LABELV $813
line 1904
;1903:	}
;1904:}
LABELV $795
endproc Cmd_PropNpc_AS_f 4192 248
proc Cmd_PhysgunDist_f 1040 12
line 1912
;1905:
;1906:/*
;1907:==================
;1908:Cmd_PhysgunDist_f
;1909:Added for QSandbox.
;1910:==================
;1911:*/
;1912:static void Cmd_PhysgunDist_f( gentity_t *ent ){
line 1915
;1913:	char		mode[MAX_TOKEN_CHARS];
;1914:	
;1915:	trap_Argv( 1, mode, sizeof( mode ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1917
;1916:	
;1917:	if ( ent->client->ps.weapon == WP_PHYSGUN ){
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 17
NEI4 $865
line 1918
;1918:	    if (ent->client->buttons & BUTTON_ATTACK) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $867
line 1919
;1919:			if (ent->grabbedEntity) {
ADDRFP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $869
line 1920
;1920:					if(atoi(mode) == 0){
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $871
line 1921
;1921:					ent->grabDist -= 20;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 2456
ADDP4
ASGNP4
ADDRLP4 1028
INDIRP4
ADDRLP4 1028
INDIRP4
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 1922
;1922:					if(ent->grabbedEntity->sb_coltype){
ADDRFP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 0
EQI4 $873
line 1923
;1923:					if(ent->grabDist < ent->grabbedEntity->sb_coltype+1){
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 2456
ADDP4
INDIRF4
ADDRLP4 1032
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
GEF4 $874
line 1924
;1924:					ent->grabDist = ent->grabbedEntity->sb_coltype+1;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 2456
ADDP4
ADDRLP4 1036
INDIRP4
CNSTI4 2448
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
line 1925
;1925:					}
line 1926
;1926:					} else {
ADDRGP4 $874
JUMPV
LABELV $873
line 1927
;1927:					if(ent->grabDist < 100){
ADDRFP4 0
INDIRP4
CNSTI4 2456
ADDP4
INDIRF4
CNSTF4 1120403456
GEF4 $877
line 1928
;1928:					ent->grabDist = 100;
ADDRFP4 0
INDIRP4
CNSTI4 2456
ADDP4
CNSTF4 1120403456
ASGNF4
line 1929
;1929:					}	
LABELV $877
line 1930
;1930:					}
LABELV $874
line 1931
;1931:					}
LABELV $871
line 1932
;1932:					if(atoi(mode) == 1){
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $879
line 1933
;1933:					ent->grabDist += 20;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 2456
ADDP4
ASGNP4
ADDRLP4 1032
INDIRP4
ADDRLP4 1032
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 1934
;1934:					}
LABELV $879
line 1935
;1935:			}
LABELV $869
line 1936
;1936:		}
LABELV $867
line 1937
;1937:	}
LABELV $865
line 1939
;1938:	
;1939:}
LABELV $864
endproc Cmd_PhysgunDist_f 1040 12
proc Cmd_FlashlightOn_f 1024 12
line 1941
;1940:
;1941:static void Cmd_FlashlightOn_f( gentity_t *ent ){
line 1944
;1942:	char        arg[MAX_TOKEN_CHARS];
;1943:		
;1944:	ent->flashon = 1;
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 1
ASGNI4
line 1946
;1945:
;1946:    trap_Argv( 0, arg, sizeof( arg ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1948
;1947:
;1948:	Laser_Gen( ent );//Flashlight toggle
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Laser_Gen
CALLV
pop
line 1950
;1949:	
;1950:}
LABELV $881
endproc Cmd_FlashlightOn_f 1024 12
proc Cmd_FlashlightOff_f 1024 12
line 1952
;1951:
;1952:static void Cmd_FlashlightOff_f( gentity_t *ent ){
line 1955
;1953:	char        arg[MAX_TOKEN_CHARS];
;1954:	
;1955:	ent->flashon = 0;
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 0
ASGNI4
line 1957
;1956:
;1957:    trap_Argv( 0, arg, sizeof( arg ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1959
;1958:
;1959:if(ent->client->lasersight){
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1348
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $883
line 1960
;1960:	G_FreeEntity( ent->client->lasersight );
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1348
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1961
;1961:	ent->client->lasersight = NULL;	
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1348
ADDP4
CNSTP4 0
ASGNP4
line 1962
;1962:	return;
ADDRGP4 $882
JUMPV
LABELV $883
line 1964
;1963:}
;1964:if(!ent->client->lasersight){
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1348
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $885
line 1965
;1965:ent->flashon = 1;
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 1
ASGNI4
line 1966
;1966:Cmd_FlashlightOn_f( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_FlashlightOn_f
CALLV
pop
line 1967
;1967:}
LABELV $885
line 1969
;1968:	
;1969:}
LABELV $882
endproc Cmd_FlashlightOff_f 1024 12
proc Cmd_Flashlight_f 1024 4
line 1978
;1970:
;1971:
;1972:/*
;1973:==================
;1974:Cmd_Flashlight_f
;1975:KK-OAX Added for QSandbox.
;1976:==================
;1977:*/
;1978:static void Cmd_Flashlight_f( gentity_t *ent ){
line 1981
;1979:	char        arg[MAX_TOKEN_CHARS];
;1980:
;1981:if(ent->flashon != 1){
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 1
EQI4 $888
line 1982
;1982:	Cmd_FlashlightOn_f( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_FlashlightOn_f
CALLV
pop
line 1983
;1983:	return;
ADDRGP4 $887
JUMPV
LABELV $888
line 1985
;1984:}
;1985:if(ent->flashon == 1){
ADDRFP4 0
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 1
NEI4 $890
line 1986
;1986:	Cmd_FlashlightOff_f( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_FlashlightOff_f
CALLV
pop
line 1987
;1987:	return;
LABELV $890
line 1990
;1988:}
;1989:	
;1990:}
LABELV $887
endproc Cmd_Flashlight_f 1024 4
proc Cmd_Tell_f 1076 16
line 1997
;1991:
;1992:/*
;1993:==================
;1994:Cmd_Tell_f
;1995:==================
;1996:*/
;1997:static void Cmd_Tell_f( gentity_t *ent ) {
line 2003
;1998:	int			targetNum;
;1999:	gentity_t	*target;
;2000:	char		*p;
;2001:	char		arg[MAX_TOKEN_CHARS];
;2002:
;2003:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $893
line 2004
;2004:		return;
ADDRGP4 $892
JUMPV
LABELV $893
line 2007
;2005:	}
;2006:
;2007:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2008
;2008:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 2009
;2009:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $898
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $895
LABELV $898
line 2010
;2010:		return;
ADDRGP4 $892
JUMPV
LABELV $895
line 2013
;2011:	}
;2012:
;2013:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2014
;2014:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $902
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $902
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $899
LABELV $902
line 2015
;2015:		return;
ADDRGP4 $892
JUMPV
LABELV $899
line 2018
;2016:	}
;2017:
;2018:	p = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1056
INDIRP4
ASGNP4
line 2020
;2019:
;2020:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $903
ARGP4
ADDRLP4 1060
CNSTI4 556
ASGNI4
ADDRLP4 1064
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2021
;2021:	G_Say( ent, target, SAY_TELL, p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 2024
;2022:	// don't tell to the player self if it was already directed to this player
;2023:	// also don't send the chat back to a bot
;2024:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $904
ADDRLP4 1068
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $904
line 2025
;2025:		G_Say( ent, ent, SAY_TELL, p );
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 2026
;2026:	}
LABELV $904
line 2027
;2027:}
LABELV $892
endproc Cmd_Tell_f 1076 16
proc G_VoiceTo 16 24
line 2030
;2028:
;2029:
;2030:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
line 2034
;2031:	int color;
;2032:	char *cmd;
;2033:
;2034:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $907
line 2035
;2035:		return;
ADDRGP4 $906
JUMPV
LABELV $907
line 2037
;2036:	}
;2037:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $909
line 2038
;2038:		return;
ADDRGP4 $906
JUMPV
LABELV $909
line 2040
;2039:	}
;2040:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $911
line 2041
;2041:		return;
ADDRGP4 $906
JUMPV
LABELV $911
line 2043
;2042:	}
;2043:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $913
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $913
line 2044
;2044:		return;
ADDRGP4 $906
JUMPV
LABELV $913
line 2047
;2045:	}
;2046:	// no chatting to players in tournements
;2047:	if ( (g_gametype.integer == GT_TOURNAMENT )) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $915
line 2048
;2048:		return;
ADDRGP4 $906
JUMPV
LABELV $915
line 2051
;2049:	}
;2050:
;2051:	if (mode == SAY_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $918
line 2052
;2052:		color = COLOR_CYAN;
ADDRLP4 0
CNSTI4 53
ASGNI4
line 2053
;2053:		cmd = "vtchat";
ADDRLP4 4
ADDRGP4 $920
ASGNP4
line 2054
;2054:	}
ADDRGP4 $919
JUMPV
LABELV $918
line 2055
;2055:	else if (mode == SAY_TELL) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $921
line 2056
;2056:		color = COLOR_MAGENTA;
ADDRLP4 0
CNSTI4 54
ASGNI4
line 2057
;2057:		cmd = "vtell";
ADDRLP4 4
ADDRGP4 $923
ASGNP4
line 2058
;2058:	}
ADDRGP4 $922
JUMPV
LABELV $921
line 2059
;2059:	else {
line 2060
;2060:		color = COLOR_GREEN;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 2061
;2061:		cmd = "vchat";
ADDRLP4 4
ADDRGP4 $924
ASGNP4
line 2062
;2062:	}
LABELV $922
LABELV $919
line 2064
;2063:
;2064:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
ADDRGP4 $925
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 12
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2065
;2065:}
LABELV $906
endproc G_VoiceTo 16 24
export G_Voice
proc G_Voice 8 20
line 2067
;2066:
;2067:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
line 2071
;2068:	int			j;
;2069:	gentity_t	*other;
;2070:
;2071:	if ( (g_gametype.integer < GT_TEAM || g_ffa_gt==1 ) && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $930
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
NEI4 $927
LABELV $930
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $927
line 2072
;2072:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 2073
;2073:	}
LABELV $927
line 2075
;2074:
;2075:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $931
line 2076
;2076:		G_VoiceTo( ent, target, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 2077
;2077:		return;
ADDRGP4 $926
JUMPV
LABELV $931
line 2081
;2078:	}
;2079:
;2080:	// echo the text to the console
;2081:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $933
line 2082
;2082:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
ADDRGP4 $936
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2083
;2083:	}
LABELV $933
line 2086
;2084:
;2085:	// send it to all the apropriate clients
;2086:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $940
JUMPV
LABELV $937
line 2087
;2087:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2088
;2088:		G_VoiceTo( ent, other, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 2089
;2089:	}
LABELV $938
line 2086
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $940
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $937
line 2090
;2090:}
LABELV $926
endproc G_Voice 8 20
proc Cmd_Voice_f 1060 20
line 2101
;2091:
;2092:/*
;2093:==================
;2094:Cmd_Voice_f
;2095:KK-OAX Modified this to trap args.
;2096:
;2097:In the original, every call to this function would always set "arg0" to false, and it was
;2098:never passed along to other functions, so I removed/commented it out.
;2099:==================
;2100:*/
;2101:static void Cmd_Voice_f( gentity_t *ent ) {
line 2104
;2102:	char		*p;
;2103:    char        arg[MAX_TOKEN_CHARS];
;2104:    int         mode = SAY_ALL;
ADDRLP4 1024
CNSTI4 0
ASGNI4
line 2105
;2105:    qboolean    voiceonly = qfalse;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 2107
;2106:
;2107:	trap_Argv( 0, arg, sizeof( arg ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2108
;2108:	if((Q_strequal( arg, "vsay_team" ) ) ||
ADDRLP4 0
ARGP4
ADDRGP4 $945
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $947
ADDRLP4 0
ARGP4
ADDRGP4 $946
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $943
LABELV $947
line 2110
;2109:	    Q_strequal( arg, "vosay_team" ) )
;2110:	    mode = SAY_TEAM;
ADDRLP4 1024
CNSTI4 1
ASGNI4
LABELV $943
line 2112
;2111:
;2112:	if((Q_strequal( arg, "vosay" ) ) ||
ADDRLP4 0
ARGP4
ADDRGP4 $950
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $951
ADDRLP4 0
ARGP4
ADDRGP4 $946
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $948
LABELV $951
line 2114
;2113:	    Q_strequal( arg, "vosay_team" ) )
;2114:	    voiceonly = qtrue;
ADDRLP4 1028
CNSTI4 1
ASGNI4
LABELV $948
line 2117
;2115:
;2116:    //KK-OAX Removed "arg0" since it will always be set to qfalse.
;2117:	if ( trap_Argc () < 2  ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 2
GEI4 $952
line 2118
;2118:		return;
ADDRGP4 $942
JUMPV
LABELV $952
line 2129
;2119:	}
;2120:    //KK-OAX This was tricky to figure out, but since none of the original command handlings
;2121:    //set it to "qtrue"...
;2122:
;2123:	/*if (arg0)
;2124:	{
;2125:		p = ConcatArgs( 0 );
;2126:	}
;2127:	else
;2128:	{*/
;2129:	p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1056
INDIRP4
ASGNP4
line 2132
;2130:	//}
;2131:
;2132:	G_Voice( ent, NULL, mode, p, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2133
;2133:}
LABELV $942
endproc Cmd_Voice_f 1060 20
proc Cmd_VoiceTell_f 1084 20
line 2141
;2134:
;2135:/*
;2136:==================
;2137:Cmd_VoiceTell_f
;2138:KK-OAX Modified this to trap args.
;2139:==================
;2140:*/
;2141:static void Cmd_VoiceTell_f( gentity_t *ent ) {
line 2146
;2142:	int			targetNum;
;2143:	gentity_t	*target;
;2144:	char		*id;
;2145:	char		arg[MAX_TOKEN_CHARS];
;2146:	qboolean    voiceonly = qfalse;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 2148
;2147:
;2148:	if ( trap_Argc () < 2 ) {
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 2
GEI4 $955
line 2149
;2149:		return;
ADDRGP4 $954
JUMPV
LABELV $955
line 2152
;2150:	}
;2151:
;2152:	trap_Argv( 0, arg, sizeof( arg ) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2153
;2153:	if( Q_strequal( arg, "votell" ) )
ADDRLP4 4
ARGP4
ADDRGP4 $959
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $957
line 2154
;2154:	    voiceonly = qtrue;
ADDRLP4 1036
CNSTI4 1
ASGNI4
LABELV $957
line 2156
;2155:
;2156:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2157
;2157:	targetNum = atoi( arg );
ADDRLP4 4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1048
INDIRI4
ASGNI4
line 2158
;2158:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $963
ADDRLP4 1028
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $960
LABELV $963
line 2159
;2159:		return;
ADDRGP4 $954
JUMPV
LABELV $960
line 2162
;2160:	}
;2161:
;2162:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 2492
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2163
;2163:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1060
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1060
INDIRU4
EQU4 $967
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $967
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1060
INDIRU4
NEU4 $964
LABELV $967
line 2164
;2164:		return;
ADDRGP4 $954
JUMPV
LABELV $964
line 2167
;2165:	}
;2166:
;2167:	id = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1064
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1064
INDIRP4
ASGNP4
line 2169
;2168:
;2169:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
ADDRGP4 $968
ARGP4
ADDRLP4 1068
CNSTI4 556
ASGNI4
ADDRLP4 1072
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1068
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1072
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1068
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1072
INDIRI4
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2170
;2170:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2173
;2171:	// don't tell to the player self if it was already directed to this player
;2172:	// also don't send the chat back to a bot
;2173:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1076
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1076
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $969
ADDRLP4 1076
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $969
line 2174
;2174:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
ADDRLP4 1080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2175
;2175:	}
LABELV $969
line 2176
;2176:}
LABELV $954
endproc Cmd_VoiceTell_f 1084 20
proc Cmd_VoiceTaunt_f 56 20
line 2184
;2177:
;2178:
;2179:/*
;2180:==================
;2181:Cmd_VoiceTaunt_f
;2182:==================
;2183:*/
;2184:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
line 2188
;2185:	gentity_t *who;
;2186:	int i;
;2187:
;2188:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $972
line 2189
;2189:		return;
ADDRGP4 $971
JUMPV
LABELV $972
line 2193
;2190:	}
;2191:
;2192:	// insult someone who just killed you
;2193:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 964
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
EQU4 $974
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $974
ADDRLP4 20
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
NEI4 $974
line 2195
;2194:		// i am a dead corpse
;2195:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $976
line 2196
;2196:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 964
ADDP4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $978
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2197
;2197:		}
LABELV $976
line 2198
;2198:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $979
line 2199
;2199:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $978
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2200
;2200:		}
LABELV $979
line 2201
;2201:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
CNSTP4 0
ASGNP4
line 2202
;2202:		return;
ADDRGP4 $971
JUMPV
LABELV $974
line 2205
;2203:	}
;2204:	// insult someone you just killed
;2205:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $981
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
EQI4 $981
line 2206
;2206:		who = g_entities + ent->client->lastkilled_client;
ADDRLP4 0
CNSTI4 2492
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2207
;2207:		if (who->client) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $983
line 2209
;2208:			// who is the person I just killed
;2209:			if (who->client->lasthurt_mod == MOD_GAUNTLET) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 2
NEI4 $985
line 2210
;2210:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $987
line 2211
;2211:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $989
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2212
;2212:				}
LABELV $987
line 2213
;2213:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $986
line 2214
;2214:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $989
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2215
;2215:				}
line 2216
;2216:			} else {
ADDRGP4 $986
JUMPV
LABELV $985
line 2217
;2217:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $992
line 2218
;2218:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $994
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2219
;2219:				}
LABELV $992
line 2220
;2220:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $995
line 2221
;2221:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $994
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2222
;2222:				}
LABELV $995
line 2223
;2223:			}
LABELV $986
line 2224
;2224:			ent->client->lastkilled_client = -1;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 -1
ASGNI4
line 2225
;2225:			return;
ADDRGP4 $971
JUMPV
LABELV $983
line 2227
;2226:		}
;2227:	}
LABELV $981
line 2229
;2228:
;2229:	if (g_gametype.integer >= GT_TEAM && g_ffa_gt!=1) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $997
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
EQI4 $997
line 2231
;2230:		// praise a team mate who just got a reward
;2231:		for(i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1000
line 2232
;2232:			who = g_entities + i;
ADDRLP4 0
CNSTI4 2492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2233
;2233:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
ADDRLP4 36
CNSTI4 556
ASGNI4
ADDRLP4 40
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1004
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRP4
CVPU4 4
EQU4 $1004
ADDRLP4 48
CNSTI4 1032
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $1004
line 2234
;2234:				if (who->client->rewardTime > level.time) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1006
line 2235
;2235:					if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1009
line 2236
;2236:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $1011
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2237
;2237:					}
LABELV $1009
line 2238
;2238:					if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $971
line 2239
;2239:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $1011
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2240
;2240:					}
line 2241
;2241:					return;
ADDRGP4 $971
JUMPV
LABELV $1006
line 2243
;2242:				}
;2243:			}
LABELV $1004
line 2244
;2244:		}
LABELV $1001
line 2231
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 256
LTI4 $1000
line 2245
;2245:	}
LABELV $997
line 2248
;2246:
;2247:	// just say something
;2248:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 $1014
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 2249
;2249:}
LABELV $971
endproc Cmd_VoiceTaunt_f 56 20
data
align 4
LABELV gc_orders
address $1015
address $1016
address $1017
address $1018
address $1019
address $1020
address $1021
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1060 16
line 2263
;2250:
;2251:
;2252:
;2253:static char	*gc_orders[] = {
;2254:	"hold your position",
;2255:	"hold this position",
;2256:	"come here",
;2257:	"cover me",
;2258:	"guard location",
;2259:	"search and destroy",
;2260:	"report"
;2261:};
;2262:
;2263:void Cmd_GameCommand_f( gentity_t *ent ) {
line 2268
;2264:	int		player;
;2265:	int		order;
;2266:	char	str[MAX_TOKEN_CHARS];
;2267:
;2268:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2269
;2269:	player = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 2270
;2270:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2271
;2271:	order = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 2273
;2272:
;2273:	if ( player < 0 || player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $1025
ADDRLP4 1028
INDIRI4
CNSTI4 256
LTI4 $1023
LABELV $1025
line 2274
;2274:		return;
ADDRGP4 $1022
JUMPV
LABELV $1023
line 2276
;2275:	}
;2276:	if ( order < 0 || order > sizeof(gc_orders)/sizeof(char *) ) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $1028
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $1026
LABELV $1028
line 2277
;2277:		return;
ADDRGP4 $1022
JUMPV
LABELV $1026
line 2279
;2278:	}
;2279:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2492
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1048
CNSTI4 2
ASGNI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1048
INDIRI4
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 2280
;2280:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
CNSTI4 2
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1056
INDIRI4
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 2281
;2281:}
LABELV $1022
endproc Cmd_GameCommand_f 1060 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 2288
;2282:
;2283:/*
;2284:==================
;2285:Cmd_Where_f
;2286:==================
;2287:*/
;2288:void Cmd_Where_f( gentity_t *ent ) {
line 2290
;2289:
;2290:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos(ent->r.currentOrigin) ) );
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $1030
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2292
;2291:
;2292:}
LABELV $1029
endproc Cmd_Where_f 8 8
data
align 4
LABELV gameNames
address $1031
address $1032
address $1033
address $1034
address $1035
address $1036
address $1037
address $1038
address $1039
address $1040
address $1041
address $1042
address $1043
export Cmd_CallVote_f
code
proc Cmd_CallVote_f 3400 24
line 2317
;2293:
;2294:static const char *gameNames[] = {
;2295:	"Free For All",
;2296:	"Tournament",
;2297:	"Single Player",
;2298:	"Team Deathmatch",
;2299:	"Capture the Flag",
;2300:	"One Flag CTF",
;2301:	"Overload",
;2302:	"Harvester",
;2303:	"Elimination",
;2304:	"CTF Elimination",
;2305:	"Last Man Standing",
;2306:	"Double Domination",
;2307:	"Domination"
;2308:};
;2309:
;2310:
;2311:
;2312:/*
;2313:==================
;2314:Cmd_CallVote_f
;2315:==================
;2316:*/
;2317:void Cmd_CallVote_f( gentity_t *ent ) {
line 2324
;2318:        char*	c;
;2319:	int		i;
;2320:	char	arg1[MAX_STRING_TOKENS];
;2321:	char	arg2[MAX_STRING_TOKENS];
;2322:        char    buffer[256];
;2323:
;2324:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $1045
line 2325
;2325:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
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
ADDRGP4 $1048
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2326
;2326:		return;
ADDRGP4 $1044
JUMPV
LABELV $1045
line 2329
;2327:	}
;2328:
;2329:	if ( level.voteTime ) {
ADDRGP4 level+3172
INDIRI4
CNSTI4 0
EQI4 $1049
line 2330
;2330:		trap_SendServerCommand( ent-g_entities, "print \"A vote is already in progress.\n\"" );
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
ADDRGP4 $1052
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2331
;2331:		return;
ADDRGP4 $1044
JUMPV
LABELV $1049
line 2333
;2332:	}
;2333:	if ( ent->client->pers.voteCount >= g_maxvotes.integer ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
ADDRGP4 g_maxvotes+12
INDIRI4
LTI4 $1053
line 2334
;2334:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of votes.\n\"" );
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
ADDRGP4 $1056
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2335
;2335:		return;
ADDRGP4 $1044
JUMPV
LABELV $1053
line 2337
;2336:	}
;2337:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1057
line 2338
;2338:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
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
ADDRGP4 $1059
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2339
;2339:		return;
ADDRGP4 $1044
JUMPV
LABELV $1057
line 2343
;2340:	}
;2341:
;2342:	// make sure it is a valid command to vote on
;2343:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2344
;2344:	trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1288
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2347
;2345:
;2346:	// check for command separators in arg2
;2347:	for( c = arg2; *c; ++c) {
ADDRLP4 4
ADDRLP4 1288
ASGNP4
ADDRGP4 $1063
JUMPV
LABELV $1060
line 2348
;2348:		switch(*c) {
ADDRLP4 2312
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2320
CNSTI4 10
ASGNI4
ADDRLP4 2312
INDIRI4
ADDRLP4 2320
INDIRI4
EQI4 $1067
ADDRLP4 2312
INDIRI4
CNSTI4 13
EQI4 $1067
ADDRLP4 2312
INDIRI4
ADDRLP4 2320
INDIRI4
LTI4 $1064
LABELV $1069
ADDRLP4 2312
INDIRI4
CNSTI4 59
EQI4 $1067
ADDRGP4 $1064
JUMPV
LABELV $1067
line 2352
;2349:			case '\n':
;2350:			case '\r':
;2351:			case ';':
;2352:				trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $1068
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2353
;2353:				return;
ADDRGP4 $1044
JUMPV
line 2354
;2354:			break;
LABELV $1064
line 2356
;2355:		}
;2356:        }
LABELV $1061
line 2347
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1063
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1060
line 2359
;2357:
;2358:
;2359:	if ( !Q_stricmp( arg1, "map_restart" ) ) {
ADDRLP4 8
ARGP4
ADDRGP4 $1072
ARGP4
ADDRLP4 2312
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2312
INDIRI4
CNSTI4 0
NEI4 $1070
line 2360
;2360:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $1071
JUMPV
LABELV $1070
ADDRLP4 8
ARGP4
ADDRGP4 $1075
ARGP4
ADDRLP4 2316
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2316
INDIRI4
CNSTI4 0
NEI4 $1073
line 2361
;2361:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $1074
JUMPV
LABELV $1073
ADDRLP4 8
ARGP4
ADDRGP4 $1078
ARGP4
ADDRLP4 2320
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2320
INDIRI4
CNSTI4 0
NEI4 $1076
line 2362
;2362:	} else if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRGP4 $1077
JUMPV
LABELV $1076
ADDRLP4 8
ARGP4
ADDRGP4 $1081
ARGP4
ADDRLP4 2324
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2324
INDIRI4
CNSTI4 0
NEI4 $1079
line 2363
;2363:	} else if ( !Q_stricmp( arg1, "kick" ) ) {
ADDRGP4 $1080
JUMPV
LABELV $1079
ADDRLP4 8
ARGP4
ADDRGP4 $1084
ARGP4
ADDRLP4 2328
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2328
INDIRI4
CNSTI4 0
NEI4 $1082
line 2364
;2364:	} else if ( !Q_stricmp( arg1, "clientkick" ) ) {
ADDRGP4 $1083
JUMPV
LABELV $1082
ADDRLP4 8
ARGP4
ADDRGP4 $1087
ARGP4
ADDRLP4 2332
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2332
INDIRI4
CNSTI4 0
NEI4 $1085
line 2365
;2365:	} else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
ADDRGP4 $1086
JUMPV
LABELV $1085
ADDRLP4 8
ARGP4
ADDRGP4 $1090
ARGP4
ADDRLP4 2336
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2336
INDIRI4
CNSTI4 0
NEI4 $1088
line 2366
;2366:	} else if ( !Q_stricmp( arg1, "timelimit" ) ) {
ADDRGP4 $1089
JUMPV
LABELV $1088
ADDRLP4 8
ARGP4
ADDRGP4 $1093
ARGP4
ADDRLP4 2340
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2340
INDIRI4
CNSTI4 0
NEI4 $1091
line 2367
;2367:	} else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
ADDRGP4 $1092
JUMPV
LABELV $1091
ADDRLP4 8
ARGP4
ADDRGP4 $1096
ARGP4
ADDRLP4 2344
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2344
INDIRI4
CNSTI4 0
NEI4 $1094
line 2368
;2368:        } else if ( !Q_stricmp( arg1, "custom" ) ) {
ADDRGP4 $1095
JUMPV
LABELV $1094
ADDRLP4 8
ARGP4
ADDRGP4 $1099
ARGP4
ADDRLP4 2348
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2348
INDIRI4
CNSTI4 0
NEI4 $1097
line 2369
;2369:        } else if ( !Q_stricmp( arg1, "shuffle" ) ) {
ADDRGP4 $1098
JUMPV
LABELV $1097
ADDRLP4 8
ARGP4
ADDRGP4 $1102
ARGP4
ADDRLP4 2352
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2352
INDIRI4
CNSTI4 0
NEI4 $1100
line 2370
;2370:	} else {
ADDRGP4 $1101
JUMPV
LABELV $1100
line 2371
;2371:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $1068
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2373
;2372:		//trap_SendServerCommand( ent-g_entities, "print \"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.\n\"" );
;2373:                buffer[0] = 0;
ADDRLP4 1032
CNSTI1 0
ASGNI1
line 2374
;2374:                strcat(buffer,"print \"Vote commands are: ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1103
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 2375
;2375:                if(allowedVote("map_restart"))
ADDRGP4 $1072
ARGP4
ADDRLP4 2356
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2356
INDIRI4
CNSTI4 0
EQI4 $1104
line 2376
;2376:                    strcat(buffer, "map_restart, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1106
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1104
line 2377
;2377:                if(allowedVote("nextmap"))
ADDRGP4 $1075
ARGP4
ADDRLP4 2360
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2360
INDIRI4
CNSTI4 0
EQI4 $1107
line 2378
;2378:                    strcat(buffer, "nextmap, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1109
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1107
line 2379
;2379:                if(allowedVote("map"))
ADDRGP4 $1078
ARGP4
ADDRLP4 2364
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2364
INDIRI4
CNSTI4 0
EQI4 $1110
line 2380
;2380:                    strcat(buffer, "map <mapname>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1112
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1110
line 2381
;2381:                if(allowedVote("g_gametype"))
ADDRGP4 $1081
ARGP4
ADDRLP4 2368
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2368
INDIRI4
CNSTI4 0
EQI4 $1113
line 2382
;2382:                    strcat(buffer, "g_gametype <n>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1115
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1113
line 2383
;2383:                if(allowedVote("kick"))
ADDRGP4 $1084
ARGP4
ADDRLP4 2372
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2372
INDIRI4
CNSTI4 0
EQI4 $1116
line 2384
;2384:                    strcat(buffer, "kick <player>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1118
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1116
line 2385
;2385:                if(allowedVote("clientkick"))
ADDRGP4 $1087
ARGP4
ADDRLP4 2376
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2376
INDIRI4
CNSTI4 0
EQI4 $1119
line 2386
;2386:                    strcat(buffer, "clientkick <clientnum>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1121
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1119
line 2387
;2387:                if(allowedVote("g_doWarmup"))
ADDRGP4 $1090
ARGP4
ADDRLP4 2380
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2380
INDIRI4
CNSTI4 0
EQI4 $1122
line 2388
;2388:                    strcat(buffer, "g_doWarmup, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1124
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1122
line 2389
;2389:                if(allowedVote("timelimit"))
ADDRGP4 $1093
ARGP4
ADDRLP4 2384
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2384
INDIRI4
CNSTI4 0
EQI4 $1125
line 2390
;2390:                    strcat(buffer, "timelimit <time>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1127
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1125
line 2391
;2391:                if(allowedVote("fraglimit"))
ADDRGP4 $1096
ARGP4
ADDRLP4 2388
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2388
INDIRI4
CNSTI4 0
EQI4 $1128
line 2392
;2392:                    strcat(buffer, "fraglimit <frags>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1130
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1128
line 2393
;2393:                if(allowedVote("shuffle"))
ADDRGP4 $1102
ARGP4
ADDRLP4 2392
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2392
INDIRI4
CNSTI4 0
EQI4 $1131
line 2394
;2394:                    strcat(buffer, "shuffle, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1133
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1131
line 2395
;2395:                if(allowedVote("custom"))
ADDRGP4 $1099
ARGP4
ADDRLP4 2396
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2396
INDIRI4
CNSTI4 0
EQI4 $1134
line 2396
;2396:                    strcat(buffer, "custom <special>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1136
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1134
line 2397
;2397:                buffer[strlen(buffer)-2] = 0;
ADDRLP4 1032
ARGP4
ADDRLP4 2400
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2400
INDIRI4
ADDRLP4 1032-2
ADDP4
CNSTI1 0
ASGNI1
line 2398
;2398:                strcat(buffer, ".\"");
ADDRLP4 1032
ARGP4
ADDRGP4 $1138
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 2399
;2399:                trap_SendServerCommand( ent-g_entities, buffer);
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
ADDRLP4 1032
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2400
;2400:		return;
ADDRGP4 $1044
JUMPV
LABELV $1101
LABELV $1098
LABELV $1095
LABELV $1092
LABELV $1089
LABELV $1086
LABELV $1083
LABELV $1080
LABELV $1077
LABELV $1074
LABELV $1071
line 2403
;2401:	}
;2402:
;2403:        if(!allowedVote(arg1)) {
ADDRLP4 8
ARGP4
ADDRLP4 2356
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2356
INDIRI4
CNSTI4 0
NEI4 $1139
line 2404
;2404:                trap_SendServerCommand( ent-g_entities, "print \"Not allowed here.\n\"" );
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
ADDRGP4 $1141
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2405
;2405:                buffer[0] = 0;
ADDRLP4 1032
CNSTI1 0
ASGNI1
line 2406
;2406:                strcat(buffer,"print \"Vote commands are: ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1103
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 2407
;2407:                if(allowedVote("map_restart"))
ADDRGP4 $1072
ARGP4
ADDRLP4 2360
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2360
INDIRI4
CNSTI4 0
EQI4 $1142
line 2408
;2408:                    strcat(buffer, "map_restart, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1106
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1142
line 2409
;2409:                if(allowedVote("nextmap"))
ADDRGP4 $1075
ARGP4
ADDRLP4 2364
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2364
INDIRI4
CNSTI4 0
EQI4 $1144
line 2410
;2410:                    strcat(buffer, "nextmap, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1109
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1144
line 2411
;2411:                if(allowedVote("map"))
ADDRGP4 $1078
ARGP4
ADDRLP4 2368
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2368
INDIRI4
CNSTI4 0
EQI4 $1146
line 2412
;2412:                    strcat(buffer, "map <mapname>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1112
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1146
line 2413
;2413:                if(allowedVote("g_gametype"))
ADDRGP4 $1081
ARGP4
ADDRLP4 2372
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2372
INDIRI4
CNSTI4 0
EQI4 $1148
line 2414
;2414:                    strcat(buffer, "g_gametype <n>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1115
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1148
line 2415
;2415:                if(allowedVote("kick"))
ADDRGP4 $1084
ARGP4
ADDRLP4 2376
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2376
INDIRI4
CNSTI4 0
EQI4 $1150
line 2416
;2416:                    strcat(buffer, "kick <player>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1118
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1150
line 2417
;2417:                if(allowedVote("clientkick"))
ADDRGP4 $1087
ARGP4
ADDRLP4 2380
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2380
INDIRI4
CNSTI4 0
EQI4 $1152
line 2418
;2418:                    strcat(buffer, "clientkick <clientnum>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1121
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1152
line 2419
;2419:                if(allowedVote("shuffle"))
ADDRGP4 $1102
ARGP4
ADDRLP4 2384
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2384
INDIRI4
CNSTI4 0
EQI4 $1154
line 2420
;2420:                    strcat(buffer, "shuffle, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1133
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1154
line 2421
;2421:                if(allowedVote("g_doWarmup"))
ADDRGP4 $1090
ARGP4
ADDRLP4 2388
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2388
INDIRI4
CNSTI4 0
EQI4 $1156
line 2422
;2422:                    strcat(buffer, "g_doWarmup, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1124
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1156
line 2423
;2423:                if(allowedVote("timelimit"))
ADDRGP4 $1093
ARGP4
ADDRLP4 2392
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2392
INDIRI4
CNSTI4 0
EQI4 $1158
line 2424
;2424:                    strcat(buffer, "timelimit <time>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1127
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1158
line 2425
;2425:                if(allowedVote("fraglimit"))
ADDRGP4 $1096
ARGP4
ADDRLP4 2396
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2396
INDIRI4
CNSTI4 0
EQI4 $1160
line 2426
;2426:                    strcat(buffer, "fraglimit <frags>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1130
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1160
line 2427
;2427:                if(allowedVote("custom"))
ADDRGP4 $1099
ARGP4
ADDRLP4 2400
ADDRGP4 allowedVote
CALLI4
ASGNI4
ADDRLP4 2400
INDIRI4
CNSTI4 0
EQI4 $1162
line 2428
;2428:                    strcat(buffer, "custom <special>, ");
ADDRLP4 1032
ARGP4
ADDRGP4 $1136
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1162
line 2429
;2429:                buffer[strlen(buffer)-2] = 0;
ADDRLP4 1032
ARGP4
ADDRLP4 2404
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2404
INDIRI4
ADDRLP4 1032-2
ADDP4
CNSTI1 0
ASGNI1
line 2430
;2430:                strcat(buffer, ".\"");
ADDRLP4 1032
ARGP4
ADDRGP4 $1138
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 2431
;2431:                trap_SendServerCommand( ent-g_entities, buffer);
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
ADDRLP4 1032
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2432
;2432:		return;
ADDRGP4 $1044
JUMPV
LABELV $1139
line 2436
;2433:        }
;2434:
;2435:	// if there is still a vote to be executed
;2436:	if ( level.voteExecuteTime ) {
ADDRGP4 level+3176
INDIRI4
CNSTI4 0
EQI4 $1165
line 2437
;2437:		level.voteExecuteTime = 0;
ADDRGP4 level+3176
CNSTI4 0
ASGNI4
line 2438
;2438:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $1169
ARGP4
ADDRGP4 level+1124
ARGP4
ADDRLP4 2360
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 2360
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2439
;2439:	}
LABELV $1165
line 2441
;2440:
;2441:        level.voteKickClient = -1; //not a client
ADDRGP4 level+3192
CNSTI4 -1
ASGNI4
line 2442
;2442:        level.voteKickType = 0; //not a ban
ADDRGP4 level+3196
CNSTI4 0
ASGNI4
line 2445
;2443:
;2444:	// special case for g_gametype, check for bad values
;2445:	if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRLP4 8
ARGP4
ADDRGP4 $1081
ARGP4
ADDRLP4 2360
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2360
INDIRI4
CNSTI4 0
NEI4 $1173
line 2447
;2446:                char	s[MAX_STRING_CHARS];
;2447:		i = atoi( arg2 );
ADDRLP4 1288
ARGP4
ADDRLP4 3388
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3388
INDIRI4
ASGNI4
line 2448
;2448:		if( i < GT_SANDBOX || i >= GT_MAX_GAME_TYPE) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1177
ADDRLP4 0
INDIRI4
CNSTI4 14
LTI4 $1175
LABELV $1177
line 2449
;2449:			trap_SendServerCommand( ent-g_entities, "print \"Invalid gametype.\n\"" );
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
ADDRGP4 $1178
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2450
;2450:			return;
ADDRGP4 $1044
JUMPV
LABELV $1175
line 2453
;2451:		}
;2452:
;2453:                if( i== g_gametype.integer ) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_gametype+12
INDIRI4
NEI4 $1179
line 2454
;2454:                    trap_SendServerCommand( ent-g_entities, "print \"This is current gametype\n\"" );
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
ADDRGP4 $1182
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2455
;2455:			return;
ADDRGP4 $1044
JUMPV
LABELV $1179
line 2458
;2456:                }
;2457:
;2458:                if(!allowedGametype(arg2)){
ADDRLP4 1288
ARGP4
ADDRLP4 3396
ADDRGP4 allowedGametype
CALLI4
ASGNI4
ADDRLP4 3396
INDIRI4
CNSTI4 0
NEI4 $1183
line 2459
;2459:                    trap_SendServerCommand( ent-g_entities, "print \"Gametype is not available.\n\"" );
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
ADDRGP4 $1185
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2460
;2460:                    return;
ADDRGP4 $1044
JUMPV
LABELV $1183
line 2463
;2461:                }
;2462:
;2463:                trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $1075
ARGP4
ADDRLP4 2364
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2464
;2464:		if (*s) {
ADDRLP4 2364
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1186
line 2465
;2465:                    Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d; map_restart; set nextmap \"%s\"", arg1, i,s );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1190
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2364
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2466
;2466:                    Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Change gametype to: %s?", gameNames[i] );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1193
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gameNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2467
;2467:                } else {
ADDRGP4 $1174
JUMPV
LABELV $1186
line 2468
;2468:                    Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d; mao_restart", arg1, i );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1196
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2469
;2469:                    Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Change gametype to: %s?", gameNames[i] );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1193
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gameNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2470
;2470:                }
line 2471
;2471:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $1174
JUMPV
LABELV $1173
ADDRLP4 8
ARGP4
ADDRGP4 $1078
ARGP4
ADDRLP4 2364
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2364
INDIRI4
CNSTI4 0
NEI4 $1199
line 2476
;2472:		// special case for map changes, we want to reset the nextmap setting
;2473:		// this allows a player to change maps, but not upset the map rotation
;2474:		char	s[MAX_STRING_CHARS];
;2475:
;2476:                if(!allowedMap(arg2)){
ADDRLP4 1288
ARGP4
ADDRLP4 3392
ADDRGP4 allowedMap
CALLI4
ASGNI4
ADDRLP4 3392
INDIRI4
CNSTI4 0
NEI4 $1201
line 2477
;2477:                    trap_SendServerCommand( ent-g_entities, "print \"Map is not available.\n\"" );
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
ADDRGP4 $1203
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2478
;2478:                    return;
ADDRGP4 $1044
JUMPV
LABELV $1201
line 2481
;2479:                }
;2480:
;2481:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $1075
ARGP4
ADDRLP4 2368
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2482
;2482:		if (*s) {
ADDRLP4 2368
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1204
line 2483
;2483:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s; set nextmap \"%s\"", arg1, arg2, s );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1208
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1288
ARGP4
ADDRLP4 2368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2484
;2484:		} else {
ADDRGP4 $1205
JUMPV
LABELV $1204
line 2485
;2485:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s", arg1, arg2 );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1211
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1288
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2486
;2486:		}
LABELV $1205
line 2488
;2487:		//Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
;2488:                Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Change map to: %s?", arg2 );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1214
ARGP4
ADDRLP4 1288
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2489
;2489:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $1200
JUMPV
LABELV $1199
ADDRLP4 8
ARGP4
ADDRGP4 $1075
ARGP4
ADDRLP4 2368
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2368
INDIRI4
CNSTI4 0
NEI4 $1215
line 2498
;2490:		char	s[MAX_STRING_CHARS];
;2491:
;2492:                //Sago: Needs to think about this, we miss code to parse if nextmap has arg2
;2493:                /*if(!allowedMap(arg2)){
;2494:                    trap_SendServerCommand( ent-g_entities, "print \"Map is not available.\n\"" );
;2495:                    return;
;2496:                }*/
;2497:
;2498:                if(g_autonextmap.integer) {
ADDRGP4 g_autonextmap+12
INDIRI4
CNSTI4 0
EQI4 $1217
line 2499
;2499:                    Com_sprintf( level.voteString, sizeof( level.voteString ), "endgamenow");
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1222
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2500
;2500:                } else {
ADDRGP4 $1218
JUMPV
LABELV $1217
line 2501
;2501:                    trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $1075
ARGP4
ADDRLP4 2372
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2502
;2502:                    if (!*s) {
ADDRLP4 2372
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1223
line 2503
;2503:                            trap_SendServerCommand( ent-g_entities, "print \"nextmap not set.\n\"" );
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
ADDRGP4 $1225
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2504
;2504:                            return;
ADDRGP4 $1044
JUMPV
LABELV $1223
line 2506
;2505:                    }
;2506:                    Com_sprintf( level.voteString, sizeof( level.voteString ), "vstr nextmap");
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2507
;2507:                }
LABELV $1218
line 2510
;2508:
;2509:		//Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
;2510:                Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", "Next map?" );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1231
ARGP4
ADDRGP4 $1232
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2511
;2511:        } else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
ADDRGP4 $1216
JUMPV
LABELV $1215
ADDRLP4 8
ARGP4
ADDRGP4 $1096
ARGP4
ADDRLP4 2372
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2372
INDIRI4
CNSTI4 0
NEI4 $1233
line 2512
;2512:                i = atoi(arg2);
ADDRLP4 1288
ARGP4
ADDRLP4 2376
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2376
INDIRI4
ASGNI4
line 2513
;2513:                if(!allowedFraglimit(i)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2380
ADDRGP4 allowedFraglimit
CALLI4
ASGNI4
ADDRLP4 2380
INDIRI4
CNSTI4 0
NEI4 $1235
line 2514
;2514:                    trap_SendServerCommand( ent-g_entities, "print \"Cannot set fraglimit.\n\"" );
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
ADDRGP4 $1237
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2515
;2515:                    return;
ADDRGP4 $1044
JUMPV
LABELV $1235
line 2518
;2516:                }
;2517:
;2518:                Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%d\"", arg1, i );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1240
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2519
;2519:                if(i)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1241
line 2520
;2520:                    Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Change fraglimit to: %d", i );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1245
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $1234
JUMPV
LABELV $1241
line 2522
;2521:                else
;2522:                    Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Remove fraglimit?");
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1248
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2523
;2523:        } else if ( !Q_stricmp( arg1, "timelimit" ) ) {
ADDRGP4 $1234
JUMPV
LABELV $1233
ADDRLP4 8
ARGP4
ADDRGP4 $1093
ARGP4
ADDRLP4 2376
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2376
INDIRI4
CNSTI4 0
NEI4 $1249
line 2524
;2524:                i = atoi(arg2);
ADDRLP4 1288
ARGP4
ADDRLP4 2380
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2380
INDIRI4
ASGNI4
line 2525
;2525:                if(!allowedTimelimit(i)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2384
ADDRGP4 allowedTimelimit
CALLI4
ASGNI4
ADDRLP4 2384
INDIRI4
CNSTI4 0
NEI4 $1251
line 2526
;2526:                    trap_SendServerCommand( ent-g_entities, "print \"Cannot set timelimit.\n\"" );
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
ADDRGP4 $1253
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2527
;2527:                    return;
ADDRGP4 $1044
JUMPV
LABELV $1251
line 2530
;2528:                }
;2529:
;2530:                Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%d\"", arg1, i );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1240
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2531
;2531:                if(i)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1256
line 2532
;2532:                    Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Change timelimit to: %d", i );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1260
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $1250
JUMPV
LABELV $1256
line 2534
;2533:                else
;2534:                    Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Remove timelimit?" );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1263
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2535
;2535:        } else if ( !Q_stricmp( arg1, "map_restart" ) ) {
ADDRGP4 $1250
JUMPV
LABELV $1249
ADDRLP4 8
ARGP4
ADDRGP4 $1072
ARGP4
ADDRLP4 2380
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2380
INDIRI4
CNSTI4 0
NEI4 $1264
line 2536
;2536:                Com_sprintf( level.voteString, sizeof( level.voteString ), "map_restart" );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1072
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2537
;2537:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Restart map?" );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1270
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2538
;2538:        } else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
ADDRGP4 $1265
JUMPV
LABELV $1264
ADDRLP4 8
ARGP4
ADDRGP4 $1090
ARGP4
ADDRLP4 2384
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2384
INDIRI4
CNSTI4 0
NEI4 $1271
line 2539
;2539:                i = atoi(arg2);
ADDRLP4 1288
ARGP4
ADDRLP4 2388
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2388
INDIRI4
ASGNI4
line 2540
;2540:                if(i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1273
line 2541
;2541:                    Com_sprintf( level.voteString, sizeof( level.voteString ), "g_doWarmup \"1\"" );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1277
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2542
;2542:                    Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Enable warmup?" );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1280
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2543
;2543:                }
ADDRGP4 $1272
JUMPV
LABELV $1273
line 2544
;2544:                else {
line 2545
;2545:                    Com_sprintf( level.voteString, sizeof( level.voteString ), "g_doWarmup \"0\"" );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1283
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2546
;2546:                    Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Disable warmup?" );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1286
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2547
;2547:                }
line 2548
;2548:        } else if ( !Q_stricmp( arg1, "clientkick" ) ) {
ADDRGP4 $1272
JUMPV
LABELV $1271
ADDRLP4 8
ARGP4
ADDRGP4 $1087
ARGP4
ADDRLP4 2388
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2388
INDIRI4
CNSTI4 0
NEI4 $1287
line 2549
;2549:                i = atoi(arg2);
ADDRLP4 1288
ARGP4
ADDRLP4 2392
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2392
INDIRI4
ASGNI4
line 2551
;2550:
;2551:                if(i>=MAX_CLIENTS) { //Only numbers <128 is clients
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1289
line 2552
;2552:                    trap_SendServerCommand( ent-g_entities, "print \"Cannot kick that number.\n\"" );
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
ADDRGP4 $1291
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2553
;2553:                    return;
ADDRGP4 $1044
JUMPV
LABELV $1289
line 2555
;2554:                }
;2555:                level.voteKickClient = i;
ADDRGP4 level+3192
ADDRLP4 0
INDIRI4
ASGNI4
line 2556
;2556:                if(g_voteBan.integer<1) {
ADDRGP4 g_voteBan+12
INDIRI4
CNSTI4 1
GEI4 $1293
line 2557
;2557:                    Com_sprintf( level.voteString, sizeof( level.voteString ), "clientkick_game \"%d\"", i );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1298
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2558
;2558:                } else {
ADDRGP4 $1294
JUMPV
LABELV $1293
line 2559
;2559:                    Com_sprintf( level.voteString, sizeof( level.voteString ), "!ban \"%d\" \"%dm\" \"Banned by public vote\"", i, g_voteBan.integer );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1301
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 g_voteBan+12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2560
;2560:                    level.voteKickType = 1; //ban
ADDRGP4 level+3196
CNSTI4 1
ASGNI4
line 2561
;2561:                }
LABELV $1294
line 2562
;2562:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Kick %s?" , level.clients[i].pers.netname );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1306
ARGP4
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2563
;2563:        } else if ( !Q_stricmp( arg1, "shuffle" ) ) {
ADDRGP4 $1288
JUMPV
LABELV $1287
ADDRLP4 8
ARGP4
ADDRGP4 $1102
ARGP4
ADDRLP4 2392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2392
INDIRI4
CNSTI4 0
NEI4 $1307
line 2564
;2564:                if(g_gametype.integer<GT_TEAM || g_ffa_gt==1) { //Not a team game
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $1312
ADDRGP4 g_ffa_gt
INDIRI4
CNSTI4 1
NEI4 $1309
LABELV $1312
line 2565
;2565:                    trap_SendServerCommand( ent-g_entities, "print \"Can only be used in team games.\n\"" );
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
ADDRGP4 $1313
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2566
;2566:                    return;
ADDRGP4 $1044
JUMPV
LABELV $1309
line 2569
;2567:                }
;2568:
;2569:                Com_sprintf( level.voteString, sizeof( level.voteString ), "shuffle" );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1102
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2570
;2570:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Shuffle teams?" );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1318
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2571
;2571:        } else if ( !Q_stricmp( arg1, "kick" ) ) {
ADDRGP4 $1308
JUMPV
LABELV $1307
ADDRLP4 8
ARGP4
ADDRGP4 $1084
ARGP4
ADDRLP4 2396
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2396
INDIRI4
CNSTI4 0
NEI4 $1319
line 2572
;2572:                i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1322
JUMPV
LABELV $1321
line 2573
;2573:                while(Q_stricmp(arg2,(g_entities+i)->client->pers.netname)) {
line 2575
;2574:                    //Not client i, try next
;2575:                    i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2576
;2576:                    if(i>=MAX_CLIENTS){ //Only numbers <128 is clients
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $1325
line 2577
;2577:                        trap_SendServerCommand( ent-g_entities, "print \"Cannot find the playername. Try clientkick instead.\n\"" );
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
ADDRGP4 $1327
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2578
;2578:                        return;
ADDRGP4 $1044
JUMPV
LABELV $1325
line 2580
;2579:                    }
;2580:                }
LABELV $1322
line 2573
ADDRLP4 1288
ARGP4
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2400
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2400
INDIRI4
CNSTI4 0
NEI4 $1321
line 2581
;2581:                level.voteKickClient = i;
ADDRGP4 level+3192
ADDRLP4 0
INDIRI4
ASGNI4
line 2582
;2582:                if(g_voteBan.integer<1) {
ADDRGP4 g_voteBan+12
INDIRI4
CNSTI4 1
GEI4 $1329
line 2583
;2583:                    Com_sprintf( level.voteString, sizeof( level.voteString ), "clientkick_game \"%d\"", i );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1298
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2584
;2584:                } else {
ADDRGP4 $1330
JUMPV
LABELV $1329
line 2585
;2585:                    Com_sprintf( level.voteString, sizeof( level.voteString ), "!ban \"%d\" \"%dm\" \"Banned by public vote\"", i, g_voteBan.integer );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1301
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 g_voteBan+12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2586
;2586:                    level.voteKickType = 1; //ban
ADDRGP4 level+3196
CNSTI4 1
ASGNI4
line 2587
;2587:                }
LABELV $1330
line 2588
;2588:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "Kick %s?" , level.clients[i].pers.netname );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1306
ARGP4
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2589
;2589:        } else if ( !Q_stricmp( arg1, "custom" ) ) {
ADDRGP4 $1320
JUMPV
LABELV $1319
ADDRLP4 8
ARGP4
ADDRGP4 $1099
ARGP4
ADDRLP4 2400
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2400
INDIRI4
CNSTI4 0
NEI4 $1340
line 2592
;2590:                t_customvote customvote;
;2591:                //Sago: There must always be a test to ensure that length(arg2) is non-zero or the client might be able to execute random commands.
;2592:                if(strlen(arg2)<1) {
ADDRLP4 1288
ARGP4
ADDRLP4 2588
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2588
INDIRI4
CNSTI4 1
GEI4 $1342
line 2593
;2593:                    trap_SendServerCommand( ent-g_entities, va("print \"Custom vote commands are: %s\n\"",custom_vote_info) );
ADDRGP4 $1344
ARGP4
ADDRGP4 custom_vote_info
ARGP4
ADDRLP4 2592
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2592
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2594
;2594:                    return;
ADDRGP4 $1044
JUMPV
LABELV $1342
line 2596
;2595:                }
;2596:                customvote = getCustomVote(arg2);
ADDRLP4 2404
ARGP4
ADDRLP4 1288
ARGP4
ADDRGP4 getCustomVote
CALLV
pop
line 2597
;2597:                if(Q_stricmp(customvote.votename,arg2)) {
ADDRLP4 2404
ARGP4
ADDRLP4 1288
ARGP4
ADDRLP4 2592
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2592
INDIRI4
CNSTI4 0
EQI4 $1345
line 2598
;2598:                    trap_SendServerCommand( ent-g_entities, "print \"Command could not be found\n\"" );
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
ADDRGP4 $1347
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2599
;2599:                    return;
ADDRGP4 $1044
JUMPV
LABELV $1345
line 2601
;2600:                }
;2601:                Com_sprintf( level.voteString, sizeof( level.voteString ), "%s", customvote.command );
ADDRGP4 level+1124
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1231
ARGP4
ADDRLP4 2404+82
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2602
;2602:                if(strlen(customvote.displayname))
ADDRLP4 2404+32
ARGP4
ADDRLP4 2596
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2596
INDIRI4
CNSTI4 0
EQI4 $1351
line 2603
;2603:                    Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", customvote.displayname );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1231
ARGP4
ADDRLP4 2404+32
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $1341
JUMPV
LABELV $1351
line 2605
;2604:                else
;2605:                    Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", customvote.command );
ADDRGP4 level+2148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1231
ARGP4
ADDRLP4 2404+82
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2606
;2606:	} else {
ADDRGP4 $1341
JUMPV
LABELV $1340
line 2609
;2607:		//Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%s\"", arg1, arg2 );
;2608:		//Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
;2609:                trap_SendServerCommand( ent-g_entities, "print \"Server vality check failed, appears to be my fault. Sorry\n\"" );
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
ADDRGP4 $1360
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2610
;2610:                return;
ADDRGP4 $1044
JUMPV
LABELV $1341
LABELV $1320
LABELV $1308
LABELV $1288
LABELV $1272
LABELV $1265
LABELV $1250
LABELV $1234
LABELV $1216
LABELV $1200
LABELV $1174
line 2613
;2611:	}
;2612:
;2613:        ent->client->pers.voteCount++;
ADDRLP4 2404
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 608
ADDP4
ASGNP4
ADDRLP4 2404
INDIRP4
ADDRLP4 2404
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2614
;2614:	trap_SendServerCommand( -1, va("print \"%s called a vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $1361
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2408
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2408
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2617
;2615:
;2616:	// start the voting, the caller autoamtically votes yes
;2617:	level.voteTime = level.time;
ADDRGP4 level+3172
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2618
;2618:	level.voteYes = 1;
ADDRGP4 level+3180
CNSTI4 1
ASGNI4
line 2619
;2619:	level.voteNo = 0;
ADDRGP4 level+3184
CNSTI4 0
ASGNI4
line 2621
;2620:
;2621:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1369
JUMPV
LABELV $1366
line 2622
;2622:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2412
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2412
INDIRP4
ADDRLP4 2412
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 2623
;2623:                level.clients[i].vote = 0;
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1444
ADDP4
CNSTI4 0
ASGNI4
line 2624
;2624:	}
LABELV $1367
line 2621
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1369
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1366
line 2625
;2625:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 2412
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2412
INDIRP4
ADDRLP4 2412
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 2626
;2626:        ent->client->vote = 1;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1444
ADDP4
CNSTI4 1
ASGNI4
line 2628
;2627:        //Do a first count to make sure that numvotingclients is correct!
;2628:        CountVotes();
ADDRGP4 CountVotes
CALLV
pop
line 2630
;2629:
;2630:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $1371
ARGP4
ADDRGP4 level+3172
INDIRI4
ARGI4
ADDRLP4 2416
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 8
ARGI4
ADDRLP4 2416
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2631
;2631:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );
CNSTI4 9
ARGI4
ADDRGP4 level+2148
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2632
;2632:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $1371
ARGP4
ADDRGP4 level+3180
INDIRI4
ARGI4
ADDRLP4 2420
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 2420
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2633
;2633:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );
ADDRGP4 $1371
ARGP4
ADDRGP4 level+3184
INDIRI4
ARGI4
ADDRLP4 2424
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 2424
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2634
;2634:}
LABELV $1044
endproc Cmd_CallVote_f 3400 24
export Cmd_Vote_f
proc Cmd_Vote_f 68 12
line 2641
;2635:
;2636:/*
;2637:==================
;2638:Cmd_Vote_f
;2639:==================
;2640:*/
;2641:void Cmd_Vote_f( gentity_t *ent ) {
line 2644
;2642:	char		msg[64];
;2643:
;2644:	if ( !level.voteTime ) {
ADDRGP4 level+3172
INDIRI4
CNSTI4 0
NEI4 $1377
line 2645
;2645:		trap_SendServerCommand( ent-g_entities, "print \"No vote in progress.\n\"" );
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
ADDRGP4 $1380
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2646
;2646:		return;
ADDRGP4 $1376
JUMPV
LABELV $1377
line 2652
;2647:	}
;2648:	/*if ( ent->client->ps.eFlags & EF_VOTED ) {
;2649:		trap_SendServerCommand( ent-g_entities, "print \"Vote already cast.\n\"" );
;2650:		return;
;2651:	}*/
;2652:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1381
line 2653
;2653:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
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
ADDRGP4 $1383
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2654
;2654:		return;
ADDRGP4 $1376
JUMPV
LABELV $1381
line 2657
;2655:	}
;2656:
;2657:	trap_SendServerCommand( ent-g_entities, "print \"Vote cast.\n\"" );
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
ADDRGP4 $1384
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2659
;2658:
;2659:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 2661
;2660:
;2661:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2663
;2662:
;2663:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $1390
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $1390
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $1385
LABELV $1390
line 2664
;2664:                ent->client->vote = 1;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1444
ADDP4
CNSTI4 1
ASGNI4
line 2665
;2665:	} else {
ADDRGP4 $1386
JUMPV
LABELV $1385
line 2666
;2666:                ent->client->vote = -1;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1444
ADDP4
CNSTI4 -1
ASGNI4
line 2667
;2667:	}
LABELV $1386
line 2670
;2668:
;2669:        //Re count the votes
;2670:        CountVotes();
ADDRGP4 CountVotes
CALLV
pop
line 2674
;2671:
;2672:	// a majority will be determined in CheckVote, which will also account
;2673:	// for players entering or leaving
;2674:}
LABELV $1376
endproc Cmd_Vote_f 68 12
export Cmd_CallTeamVote_f
proc Cmd_CallTeamVote_f 2164 20
line 2681
;2675:
;2676:/*
;2677:==================
;2678:Cmd_CallTeamVote_f
;2679:==================
;2680:*/
;2681:void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 2686
;2682:	int		i, team, cs_offset;
;2683:	char	arg1[MAX_STRING_TOKENS];
;2684:	char	arg2[MAX_STRING_TOKENS];
;2685:
;2686:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 2687
;2687:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $1392
line 2688
;2688:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $1393
JUMPV
LABELV $1392
line 2689
;2689:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $1391
line 2690
;2690:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 2692
;2691:	else
;2692:		return;
LABELV $1395
LABELV $1393
line 2694
;2693:
;2694:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $1396
line 2695
;2695:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
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
ADDRGP4 $1048
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2696
;2696:		return;
ADDRGP4 $1391
JUMPV
LABELV $1396
line 2699
;2697:	}
;2698:
;2699:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1399
line 2700
;2700:		trap_SendServerCommand( ent-g_entities, "print \"A team vote is already in progress.\n\"" );
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
ADDRGP4 $1402
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2701
;2701:		return;
ADDRGP4 $1391
JUMPV
LABELV $1399
line 2703
;2702:	}
;2703:	if ( ent->client->pers.teamVoteCount >= g_maxvotes.integer ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRGP4 g_maxvotes+12
INDIRI4
LTI4 $1403
line 2704
;2704:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of team votes.\n\"" );
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
ADDRGP4 $1406
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2705
;2705:		return;
ADDRGP4 $1391
JUMPV
LABELV $1403
line 2707
;2706:	}
;2707:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1407
line 2708
;2708:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
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
ADDRGP4 $1059
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2709
;2709:		return;
ADDRGP4 $1391
JUMPV
LABELV $1407
line 2713
;2710:	}
;2711:
;2712:	// make sure it is a valid command to vote on
;2713:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2714
;2714:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 2715
;2715:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $1412
JUMPV
LABELV $1409
line 2716
;2716:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $1413
line 2717
;2717:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $1415
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $1413
line 2718
;2718:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - strlen(arg2) );
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 2064
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2719
;2719:	}
LABELV $1410
line 2715
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1412
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $1409
line 2721
;2720:
;2721:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
ADDRLP4 1036
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2064
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1418
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2068
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2068
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1416
LABELV $1418
line 2722
;2722:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $1068
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2723
;2723:		return;
ADDRGP4 $1391
JUMPV
LABELV $1416
line 2726
;2724:	}
;2725:
;2726:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $1421
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $1419
line 2729
;2727:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;2728:
;2729:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1422
line 2730
;2730:			i = ent->client->ps.clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 2731
;2731:		}
ADDRGP4 $1423
JUMPV
LABELV $1422
line 2732
;2732:		else {
line 2734
;2733:			// numeric values are just slot numbers
;2734:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1424
line 2735
;2735:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
ADDRLP4 2148
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2148
INDIRI4
CNSTI4 0
EQI4 $1431
ADDRLP4 2148
INDIRI4
CNSTI4 48
LTI4 $1431
ADDRLP4 2148
INDIRI4
CNSTI4 57
LEI4 $1428
LABELV $1431
line 2736
;2736:					break;
ADDRGP4 $1426
JUMPV
LABELV $1428
line 2737
;2737:			}
LABELV $1425
line 2734
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1424
LABELV $1426
line 2738
;2738:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $1434
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1432
LABELV $1434
line 2739
;2739:				i = atoi( arg2 );
ADDRLP4 4
ARGP4
ADDRLP4 2152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2152
INDIRI4
ASGNI4
line 2740
;2740:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1438
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1435
LABELV $1438
line 2741
;2741:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $237
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2742
;2742:					return;
ADDRGP4 $1391
JUMPV
LABELV $1435
line 2745
;2743:				}
;2744:
;2745:				if ( !g_entities[i].inuse ) {
CNSTI4 2492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1433
line 2746
;2746:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $240
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2747
;2747:					return;
ADDRGP4 $1391
JUMPV
line 2749
;2748:				}
;2749:			}
LABELV $1432
line 2750
;2750:			else {
line 2751
;2751:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2112
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2752
;2752:				Q_CleanStr(leader);
ADDRLP4 2112
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2753
;2753:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1445
JUMPV
LABELV $1442
line 2754
;2754:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
NEI4 $1447
line 2755
;2755:						continue;
ADDRGP4 $1443
JUMPV
LABELV $1447
line 2756
;2756:					if (level.clients[i].sess.sessionTeam != team)
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
ADDRLP4 1028
INDIRI4
EQI4 $1449
line 2757
;2757:						continue;
ADDRGP4 $1443
JUMPV
LABELV $1449
line 2758
;2758:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2076
ARGP4
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2759
;2759:					Q_CleanStr(netname);
ADDRLP4 2076
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 2760
;2760:					if ( !Q_stricmp(netname, leader) ) {
ADDRLP4 2076
ARGP4
ADDRLP4 2112
ARGP4
ADDRLP4 2152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2152
INDIRI4
CNSTI4 0
NEI4 $1451
line 2761
;2761:						break;
ADDRGP4 $1444
JUMPV
LABELV $1451
line 2763
;2762:					}
;2763:				}
LABELV $1443
line 2753
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1445
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1442
LABELV $1444
line 2764
;2764:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1453
line 2765
;2765:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $1456
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2152
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2152
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2766
;2766:					return;
ADDRGP4 $1391
JUMPV
LABELV $1453
line 2768
;2767:				}
;2768:			}
LABELV $1433
line 2769
;2769:		}
LABELV $1423
line 2770
;2770:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $363
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2771
;2771:	} else {
ADDRGP4 $1420
JUMPV
LABELV $1419
line 2772
;2772:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $1068
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2773
;2773:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
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
ADDRGP4 $1457
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2774
;2774:		return;
ADDRGP4 $1391
JUMPV
LABELV $1420
line 2777
;2775:	}
;2776:
;2777:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+3200
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1211
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2779
;2778:
;2779:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1463
JUMPV
LABELV $1460
line 2780
;2780:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
NEI4 $1465
line 2781
;2781:			continue;
ADDRGP4 $1461
JUMPV
LABELV $1465
line 2782
;2782:		if (level.clients[i].sess.sessionTeam == team)
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
ADDRLP4 1028
INDIRI4
NEI4 $1467
line 2783
;2783:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $1469
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $1467
line 2784
;2784:	}
LABELV $1461
line 2779
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1463
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1460
line 2787
;2785:
;2786:	// start the voting, the caller autoamtically votes yes
;2787:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5248
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2788
;2788:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5256
ADDP4
CNSTI4 1
ASGNI4
line 2789
;2789:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5264
ADDP4
CNSTI4 0
ASGNI4
line 2791
;2790:
;2791:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1477
JUMPV
LABELV $1474
line 2792
;2792:		if (level.clients[i].sess.sessionTeam == team)
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
ADDRLP4 1028
INDIRI4
NEI4 $1479
line 2793
;2793:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2076
CNSTI4 2324
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
LABELV $1479
line 2794
;2794:	}
LABELV $1475
line 2791
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1477
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1474
line 2795
;2795:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 2076
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 2797
;2796:
;2797:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $1371
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5248
ADDP4
INDIRI4
ARGI4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2798
;2798:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
ADDRLP4 1032
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+3200
ADDP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2799
;2799:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $1371
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5256
ADDP4
INDIRI4
ARGI4
ADDRLP4 2088
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2800
;2800:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $1371
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5264
ADDP4
INDIRI4
ARGI4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2801
;2801:}
LABELV $1391
endproc Cmd_CallTeamVote_f 2164 20
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 84 12
line 2808
;2802:
;2803:/*
;2804:==================
;2805:Cmd_TeamVote_f
;2806:==================
;2807:*/
;2808:void Cmd_TeamVote_f( gentity_t *ent ) {
line 2812
;2809:	int			team, cs_offset;
;2810:	char		msg[64];
;2811:
;2812:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
ASGNI4
line 2813
;2813:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $1486
line 2814
;2814:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $1487
JUMPV
LABELV $1486
line 2815
;2815:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $1485
line 2816
;2816:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 2818
;2817:	else
;2818:		return;
LABELV $1489
LABELV $1487
line 2820
;2819:
;2820:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1490
line 2821
;2821:		trap_SendServerCommand( ent-g_entities, "print \"No team vote in progress.\n\"" );
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
ADDRGP4 $1493
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2822
;2822:		return;
ADDRGP4 $1485
JUMPV
LABELV $1490
line 2824
;2823:	}
;2824:	if ( ent->client->ps.eFlags & EF_TEAMVOTED ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $1494
line 2825
;2825:		trap_SendServerCommand( ent-g_entities, "print \"Team vote already cast.\n\"" );
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
ADDRGP4 $1496
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2826
;2826:		return;
ADDRGP4 $1485
JUMPV
LABELV $1494
line 2828
;2827:	}
;2828:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1497
line 2829
;2829:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
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
ADDRGP4 $1383
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2830
;2830:		return;
ADDRGP4 $1485
JUMPV
LABELV $1497
line 2833
;2831:	}
;2832:
;2833:	trap_SendServerCommand( ent-g_entities, "print \"Team vote cast.\n\"" );
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
ADDRGP4 $1499
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2835
;2834:
;2835:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 2837
;2836:
;2837:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2839
;2838:
;2839:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $1505
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $1505
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $1500
LABELV $1505
line 2840
;2840:		level.teamVoteYes[cs_offset]++;
ADDRLP4 76
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5256
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2841
;2841:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $1371
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5256
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2842
;2842:	} else {
ADDRGP4 $1501
JUMPV
LABELV $1500
line 2843
;2843:		level.teamVoteNo[cs_offset]++;
ADDRLP4 76
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5264
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2844
;2844:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $1371
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+5264
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2845
;2845:	}
LABELV $1501
line 2849
;2846:
;2847:	// a majority will be determined in TeamCheckVote, which will also account
;2848:	// for players entering or leaving
;2849:}
LABELV $1485
endproc Cmd_TeamVote_f 84 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1064 12
line 2857
;2850:
;2851:
;2852:/*
;2853:=================
;2854:Cmd_SetViewpos_f
;2855:=================
;2856:*/
;2857:void Cmd_SetViewpos_f( gentity_t *ent ) {
line 2862
;2858:	vec3_t		origin, angles;
;2859:	char		buffer[MAX_TOKEN_CHARS];
;2860:	int			i;
;2861:
;2862:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $1511
line 2863
;2863:		trap_SendServerCommand( ent-g_entities, va("print \"Cheats are not enabled on this server.\n\""));
ADDRGP4 $216
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2864
;2864:		return;
ADDRGP4 $1510
JUMPV
LABELV $1511
line 2866
;2865:	}
;2866:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $1514
line 2867
;2867:		trap_SendServerCommand( ent-g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
ADDRGP4 $1516
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2868
;2868:		return;
ADDRGP4 $1510
JUMPV
LABELV $1514
line 2871
;2869:	}
;2870:
;2871:	VectorClear( angles );
ADDRLP4 1056
CNSTF4 0
ASGNF4
ADDRLP4 1040+8
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1056
INDIRF4
ASGNF4
line 2872
;2872:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1519
line 2873
;2873:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2874
;2874:		origin[i] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 1060
INDIRF4
ASGNF4
line 2875
;2875:	}
LABELV $1520
line 2872
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1519
line 2877
;2876:
;2877:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2878
;2878:	angles[YAW] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1060
INDIRF4
ASGNF4
line 2880
;2879:
;2880:	TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 2881
;2881:}
LABELV $1510
endproc Cmd_SetViewpos_f 1064 12
export Cmd_UseTarget_f
proc Cmd_UseTarget_f 1060 12
line 2888
;2882:
;2883:/*
;2884:=================
;2885:Cmd_UseTarget_f
;2886:=================
;2887:*/
;2888:void Cmd_UseTarget_f( gentity_t *ent ) {
line 2893
;2889:	char		*p;
;2890:	char        arg[MAX_TOKEN_CHARS];
;2891:	gentity_t 	*act;
;2892:
;2893:    trap_Argv( 0, arg, sizeof( arg ) );
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2895
;2894:
;2895:    if( trap_Argc( ) < 2 )
ADDRLP4 1032
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 2
GEI4 $1525
line 2896
;2896:        return;
ADDRGP4 $1524
JUMPV
LABELV $1525
line 2898
;2897:
;2898:    p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 1036
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1036
INDIRP4
ASGNP4
line 2900
;2899:	
;2900:	ent->target = p;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 2902
;2901:
;2902:	act = G_PickTarget( ent->target );
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1040
INDIRP4
ASGNP4
line 2903
;2903:	if ( act && act->use && act->allowuse ) {
ADDRLP4 1048
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1048
INDIRU4
EQU4 $1527
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1048
INDIRU4
EQU4 $1527
ADDRLP4 0
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1527
line 2904
;2904:		act->use( act, ent, ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRP4
CALLV
pop
line 2905
;2905:	}
LABELV $1527
line 2906
;2906:}
LABELV $1524
endproc Cmd_UseTarget_f 1060 12
data
align 4
LABELV $1530
address $1531
address $1532
address $1533
address $1534
address $1535
address $1536
address $1537
address $1538
address $1539
address $1540
address $1541
address $1542
address $1543
address $1544
address $1545
address $1546
address $1547
address $1548
address $1549
address $1550
address $1551
address $1552
address $1553
address $1554
address $1555
address $1556
address $1557
address $1558
address $1559
address $1560
address $1561
address $1562
address $1563
address $1564
address $1565
address $1566
address $1567
address $1568
address $1569
address $1570
address $1571
address $1572
address $1573
address $1574
address $1575
address $1576
address $1577
address $1578
address $1579
address $1580
address $1581
address $1582
address $1583
address $1584
address $1585
address $1586
address $1587
address $1588
address $1589
address $1590
address $1591
address $1592
address $1593
address $1594
address $1595
address $1596
address $1597
address $1598
address $1599
address $1600
address $1601
address $1602
address $1603
address $1604
address $1605
address $1606
address $1607
address $1608
address $1609
address $1610
address $1611
address $1612
address $1613
address $1614
address $1615
address $1616
address $1617
address $1618
address $1619
address $1620
address $1621
address $1622
address $1623
address $1624
address $1625
address $1626
address $1627
address $1628
address $1629
address $1630
address $1631
address $1632
address $1633
address $1634
address $1635
address $1636
address $1637
address $1638
address $1639
address $1640
address $1641
address $1642
address $1643
address $1644
address $1645
address $1646
address $1647
address $1648
address $1649
address $1650
address $1651
address $1652
address $1653
address $1654
address $1655
address $1656
address $1657
address $1658
address $1659
address $1660
address $1661
address $1662
address $1663
address $1664
address $1665
address $1666
address $1667
address $1668
address $1669
address $1670
address $1671
address $1672
address $1673
address $1674
address $1675
address $1676
address $1677
address $1678
address $1679
address $1680
address $1681
address $1682
address $1683
address $1684
address $1685
address $1686
address $1687
address $1688
address $1689
address $1690
address $1691
address $1692
address $1693
address $1694
address $1695
address $1696
address $1697
address $1698
address $1699
address $1700
address $1701
address $1702
address $1703
address $1704
address $1705
address $1706
address $1707
address $1708
address $1709
address $1710
address $1711
address $1712
address $1713
address $1714
address $1715
address $1716
address $1717
address $1718
address $1719
address $1720
address $1721
address $1722
address $1723
address $1724
address $1725
address $1726
address $1727
address $1728
address $1729
address $1730
address $1731
address $1732
address $1733
address $1734
address $1735
address $1736
address $1737
address $1738
address $1739
address $1740
address $1741
address $1742
address $1743
address $1744
address $1745
address $1746
address $1747
address $1748
address $1749
address $1750
address $1751
address $1752
address $1753
address $1754
address $1755
address $1756
address $1757
address $1758
address $1759
address $1760
address $1761
address $1762
address $1763
address $1764
address $1765
address $1766
address $1767
address $1768
address $1769
address $1770
address $1771
address $1772
address $1773
address $1774
address $1775
address $1776
address $1777
address $1778
address $1779
address $1780
address $1781
address $1782
address $1783
address $1784
address $1785
address $1786
address $1787
address $1788
address $1789
address $1790
address $1791
address $1792
address $1793
address $1794
address $1795
address $1796
address $1797
address $1798
address $1799
address $1800
address $1801
address $1802
address $1803
address $1804
address $1805
address $1806
address $1807
address $1808
address $1809
address $1810
address $1811
address $1812
address $1813
address $1814
address $1815
address $1816
address $1817
address $1818
address $1819
address $1820
address $1821
address $1822
address $1823
address $1824
address $1825
address $1826
address $1827
address $1828
address $1829
address $1830
address $1831
address $1832
address $1833
address $1834
address $1835
address $1836
address $1837
address $1838
address $1839
address $1840
address $1841
address $1842
address $1843
address $1844
address $1845
address $1846
address $1847
address $1848
address $1849
address $1850
address $1851
address $1852
address $1853
address $1854
address $1855
address $1856
address $1857
address $1858
address $1859
address $1860
address $1861
address $1862
address $1863
address $1864
address $1865
address $1866
address $1867
address $1868
byte 4 0
export Cmd_UseCvar_f
code
proc Cmd_UseCvar_f 212 12
line 2913
;2907:
;2908:/*
;2909:=================
;2910:Cmd_UseCvar_f
;2911:=================
;2912:*/
;2913:void Cmd_UseCvar_f( gentity_t *ent ) {
line 3259
;2914:	char		p1[64];
;2915:	char		p2[64];
;2916:	char		p3[64];
;2917:	int			i;
;2918:	static const char* cvar_items[] = {
;2919:	"g_minigame",
;2920:	"g_ghspeed",
;2921:	"g_ghtimeout",
;2922:	"g_gdelay",
;2923:	"g_gdamage",
;2924:	"g_grange",
;2925:	"g_gknockback",
;2926:	"g_mgdelay",
;2927:	"g_mgdamage",
;2928:	"g_mgspread",
;2929:	"g_mgexplode",
;2930:	"g_mgsdamage",
;2931:	"g_mgsradius",
;2932:	"g_mgvampire",
;2933:	"g_mginf",
;2934:	"g_mgknockback",
;2935:	"g_sgdelay",
;2936:	"g_sgdamage",
;2937:	"g_sgspread",
;2938:	"g_sgexplode",
;2939:	"g_sgsdamage",
;2940:	"g_sgsradius",
;2941:	"g_sgcount",
;2942:	"g_sgvampire",
;2943:	"g_sginf",
;2944:	"g_sgknockback",
;2945:	"g_gldelay",
;2946:	"g_glspeed",
;2947:	"g_gltimeout",
;2948:	"g_glsradius",
;2949:	"g_glsdamage",
;2950:	"g_gldamage",
;2951:	"g_glbounce",
;2952:	"g_glgravity",
;2953:	"g_glvampire",
;2954:	"g_glinf",
;2955:	"g_glbouncemodifier",
;2956:	"g_glknockback",
;2957:	"g_rldelay",
;2958:	"g_rlspeed",
;2959:	"g_rltimeout",
;2960:	"g_rlsradius",
;2961:	"g_rlsdamage",
;2962:	"g_rldamage",
;2963:	"g_rlbounce",
;2964:	"g_rlgravity",
;2965:	"g_rlvampire",
;2966:	"g_rlinf",
;2967:	"g_rlbouncemodifier",
;2968:	"g_rlknockback",
;2969:	"g_lgdamage",
;2970:	"g_lgdelay",
;2971:	"g_lgrange",
;2972:	"g_lgexplode",
;2973:	"g_lgsdamage",
;2974:	"g_lgsradius",
;2975:	"g_lgvampire",
;2976:	"g_lginf",
;2977:	"g_lgknockback",
;2978:	"g_rgdelay",
;2979:	"g_rgdamage",
;2980:	"g_rgvampire",
;2981:	"g_rginf",
;2982:	"g_rgknockback",
;2983:	"g_pgdelay",
;2984:	"g_pgsradius",
;2985:	"g_pgspeed",
;2986:	"g_pgsdamage",
;2987:	"g_pgdamage",
;2988:	"g_pgtimeout",
;2989:	"g_pgbounce",
;2990:	"g_pggravity",
;2991:	"g_pgvampire",
;2992:	"g_pginf",
;2993:	"g_pgbouncemodifier",
;2994:	"g_pgknockback",
;2995:	"g_bfgdelay",
;2996:	"g_bfgspeed",
;2997:	"g_bfgtimeout",
;2998:	"g_bfgsradius",
;2999:	"g_bfgsdamage",
;3000:	"g_bfgdamage",
;3001:	"g_bfgbounce",
;3002:	"g_bfggravity",
;3003:	"g_bfgvampire",
;3004:	"g_bfginf",
;3005:	"g_bfgbouncemodifier",
;3006:	"g_bfgknockback",
;3007:	"g_ngdelay",
;3008:	"g_ngspeed",
;3009:	"g_ngspread",
;3010:	"g_ngdamage",
;3011:	"g_ngtimeout",
;3012:	"g_ngcount",
;3013:	"g_ngbounce",
;3014:	"g_nggravity",
;3015:	"g_ngrandom",
;3016:	"g_ngvampire",
;3017:	"g_nginf",
;3018:	"g_ngbouncemodifier",
;3019:	"g_ngknockback",
;3020:	"g_pldelay",
;3021:	"g_plspeed",
;3022:	"g_pltimeout",
;3023:	"g_plsradius",
;3024:	"g_plsdamage",
;3025:	"g_plgravity",
;3026:	"g_pldamage",
;3027:	"g_plvampire",
;3028:	"g_plinf",
;3029:	"g_plknockback",
;3030:	"g_cgdelay",
;3031:	"g_cgdamage",
;3032:	"g_cgspread",
;3033:	"g_cgvampire",
;3034:	"g_cginf",
;3035:	"g_cgknockback",
;3036:	"g_ftdelay",
;3037:	"g_ftsradius",
;3038:	"g_ftspeed",
;3039:	"g_ftsdamage",
;3040:	"g_ftdamage",
;3041:	"g_fttimeout",
;3042:	"g_ftbounce",
;3043:	"g_ftgravity",
;3044:	"g_ftvampire",
;3045:	"g_ftinf",
;3046:	"g_ftbouncemodifier",
;3047:	"g_ftknockback",
;3048:	"g_amdelay",
;3049:	"g_amsradius",
;3050:	"g_amspeed",
;3051:	"g_amsdamage",
;3052:	"g_amdamage",
;3053:	"g_amtimeout",
;3054:	"g_ambounce",
;3055:	"g_amgravity",
;3056:	"g_amvampire",
;3057:	"g_aminf",
;3058:	"g_ambouncemodifier",
;3059:	"g_amknockback",
;3060:	"g_glhoming",
;3061:	"g_glguided",
;3062:	"g_rlhoming",
;3063:	"g_rlguided",
;3064:	"g_pghoming",
;3065:	"g_pgguided",
;3066:	"g_bfghoming",
;3067:	"g_bfgguided",
;3068:	"g_nghoming",
;3069:	"g_ngguided",
;3070:	"g_fthoming",
;3071:	"g_ftguided",
;3072:	"g_amhoming",
;3073:	"g_amguided",
;3074:	"g_scoutspeedfactor",
;3075:	"g_scoutfirespeed",
;3076:	"g_scoutdamagefactor",
;3077:	"g_scoutgravitymodifier",
;3078:	"g_scout_infammo",
;3079:	"g_scouthealthmodifier",
;3080:	"g_doublerspeedfactor",
;3081:	"g_doublerfirespeed",
;3082:	"g_doublerdamagefactor",
;3083:	"g_doublergravitymodifier",
;3084:	"g_doubler_infammo",
;3085:	"g_doublerhealthmodifier",
;3086:	"g_guardhealthmodifier",
;3087:	"g_guardspeedfactor",
;3088:	"g_guardfirespeed",
;3089:	"g_guarddamagefactor",
;3090:	"g_guardgravitymodifier",
;3091:	"g_guard_infammo",
;3092:	"g_ammoregenspeedfactor",
;3093:	"g_ammoregenfirespeed",
;3094:	"g_ammoregen_infammo",
;3095:	"g_ammoregendamagefactor",
;3096:	"g_ammoregengravitymodifier",
;3097:	"g_ammoregenhealthmodifier",
;3098:	"g_mgammocount",
;3099:	"g_sgammocount",
;3100:	"g_glammocount",
;3101:	"g_rlammocount",
;3102:	"g_lgammocount",
;3103:	"g_rgammocount",
;3104:	"g_pgammocount",
;3105:	"g_bfgammocount",
;3106:	"g_ngammocount",
;3107:	"g_plammocount",
;3108:	"g_cgammocount",
;3109:	"g_ftammocount",
;3110:	"g_mgweaponcount",
;3111:	"g_sgweaponcount",
;3112:	"g_glweaponcount",
;3113:	"g_rlweaponcount",
;3114:	"g_lgweaponcount",
;3115:	"g_rgweaponcount",
;3116:	"g_pgweaponcount",
;3117:	"g_bfgweaponcount",
;3118:	"g_ngweaponcount",
;3119:	"g_plweaponcount",
;3120:	"g_cgweaponcount",
;3121:	"g_ftweaponcount",
;3122:	"g_amweaponcount",
;3123:	"g_teamblue_speed",
;3124:	"g_teamblue_gravityModifier",
;3125:	"g_teamblue_firespeed",
;3126:	"g_teamblue_damage",
;3127:	"g_teamblue_infammo",
;3128:	"g_teamblue_respawnwait",
;3129:	"g_teamblue_pickupitems",
;3130:	"g_teamred_speed",
;3131:	"g_teamred_gravityModifier",
;3132:	"g_teamred_firespeed",
;3133:	"g_teamred_damage",
;3134:	"g_teamred_infammo",
;3135:	"g_teamred_respawnwait",
;3136:	"g_teamred_pickupitems",
;3137:	"g_regenarmor",
;3138:	"g_spectatorspeed",
;3139:	"eliminationrespawn",
;3140:	"eliminationredrespawn",
;3141:	"g_overlay",
;3142:	"g_slickmove",
;3143:	"g_accelerate",
;3144:	"g_randomItems",
;3145:	"g_kill",
;3146:	"g_kamikazeinf",
;3147:	"g_invulinf",
;3148:	"g_medkitinf",
;3149:	"g_teleporterinf",
;3150:	"g_portalinf",
;3151:	"g_medkitlimit",
;3152:	"g_waterdamage",
;3153:	"g_lavadamage",
;3154:	"g_slimedamage",
;3155:	"g_maxweaponpickup",
;3156:	"g_randomteleport",
;3157:	"g_falldamagesmall",
;3158:	"g_falldamagebig",
;3159:	"g_noplayerclip",
;3160:	"g_flagrespawn",
;3161:	"g_portaltimeout",
;3162:	"g_portalhealth",
;3163:	"g_quadtime",
;3164:	"g_bsuittime",
;3165:	"g_hastetime",
;3166:	"g_invistime",
;3167:	"g_regentime",
;3168:	"g_flighttime",
;3169:	"g_invulmove",
;3170:	"g_invultime",
;3171:	"g_fasthealthregen",
;3172:	"g_slowhealthregen",
;3173:	"g_droppeditemtime",
;3174:	"g_autoflagreturn",
;3175:	"g_hastefirespeed",
;3176:	"g_medkitmodifier",
;3177:	"g_armorprotect",
;3178:	"g_respawnwait",
;3179:	"g_ammolimit",
;3180:	"g_jumpheight",
;3181:	"g_speedfactor",
;3182:	"g_drowndamage",
;3183:	"g_armorrespawn",
;3184:	"g_healthrespawn",
;3185:	"g_ammorespawn",
;3186:	"g_holdablerespawn",
;3187:	"g_megahealthrespawn",
;3188:	"g_poweruprespawn",
;3189:	"g_speed",
;3190:	"g_gravity",
;3191:	"g_gravityModifier",
;3192:	"g_damageModifier",
;3193:	"g_knockback",
;3194:	"g_quadfactor",
;3195:	"g_forcerespawn",
;3196:	"g_respawntime",
;3197:	"g_weaponRespawn",
;3198:	"g_weaponTeamRespawn",
;3199:	"g_proxMineTimeout",
;3200:	"elimination_selfdamage",
;3201:	"elimination_startHealth",
;3202:	"elimination_startArmor",
;3203:	"elimination_bfg",
;3204:	"elimination_grapple",
;3205:	"elimination_roundtime",
;3206:	"elimination_warmup",
;3207:	"elimination_activewarmup",
;3208:	"elimination_allgametypes",
;3209:	"elimination_gauntlet",
;3210:	"elimination_machinegun",
;3211:	"elimination_shotgun",
;3212:	"elimination_grenade",
;3213:	"elimination_rocket",
;3214:	"elimination_railgun",
;3215:	"elimination_lightning",
;3216:	"elimination_plasmagun",
;3217:	"elimination_chain",
;3218:	"elimination_mine",
;3219:	"elimination_nail",
;3220:	"elimination_flame",
;3221:	"elimination_antimatter",
;3222:	"elimination_quad",
;3223:	"elimination_haste",
;3224:	"elimination_bsuit",
;3225:	"elimination_invis",
;3226:	"elimination_regen",
;3227:	"elimination_flight",
;3228:	"elimination_items",
;3229:	"elimination_holdable",
;3230:	"eliminationred_startHealth",
;3231:	"eliminationred_startArmor",
;3232:	"eliminationred_bfg",
;3233:	"eliminationred_grapple",
;3234:	"eliminationred_gauntlet",
;3235:	"eliminationred_machinegun",
;3236:	"eliminationred_shotgun",
;3237:	"eliminationred_grenade",
;3238:	"eliminationred_rocket",
;3239:	"eliminationred_railgun",
;3240:	"eliminationred_lightning",
;3241:	"eliminationred_plasmagun",
;3242:	"eliminationred_chain",
;3243:	"eliminationred_mine",
;3244:	"eliminationred_nail",
;3245:	"eliminationred_flame",
;3246:	"eliminationred_antimatter",
;3247:	"eliminationred_quad",
;3248:	"eliminationred_haste",
;3249:	"eliminationred_bsuit",
;3250:	"eliminationred_invis",
;3251:	"eliminationred_regen",
;3252:	"eliminationred_flight",
;3253:	"eliminationred_holdable",
;3254:	"g_vampire",
;3255:	"g_vampireMaxHealth",
;3256:	"g_regen",
;3257:	0
;3258:};
;3259:if(g_gametype.integer != GT_SANDBOX){ return; }
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $1869
ADDRGP4 $1529
JUMPV
LABELV $1869
line 3260
;3260:if(!g_allowsettings.integer){ return; }
ADDRGP4 g_allowsettings+12
INDIRI4
CNSTI4 0
NEI4 $1872
ADDRGP4 $1529
JUMPV
LABELV $1872
line 3262
;3261:
;3262:    trap_Argv( 1, p1, sizeof( p1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3263
;3263:	trap_Argv( 2, p2, sizeof( p2 ) );
CNSTI4 2
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3264
;3264:	trap_Argv( 3, p3, sizeof( p3 ) );
CNSTI4 3
ARGI4
ADDRLP4 132
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3266
;3265:	
;3266:	if(atoi(p3) >= 1){
ADDRLP4 132
ARGP4
ADDRLP4 196
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 1
LTI4 $1875
line 3267
;3267:	trap_SendServerCommand( -1, va("print \"Variable %s is %s\n\"", p1, G_ArenaScriptAutoChar( p1 )));
ADDRLP4 4
ARGP4
ADDRLP4 200
ADDRGP4 G_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $1877
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 200
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 204
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3268
;3268:	return;
ADDRGP4 $1529
JUMPV
LABELV $1875
line 3271
;3269:	}
;3270:	
;3271:	for (i = 0; i < 343; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1878
line 3272
;3272:    if (Q_stricmp(p1, cvar_items[i]) == 0) {
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1530
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
NEI4 $1882
line 3273
;3273:	trap_Cvar_Set(p1, va("%s", p2));
ADDRGP4 $1231
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3274
;3274:	trap_SendServerCommand( -1, va("print \"Variable %s changed to %s\n\"", p1, p2));
ADDRGP4 $1884
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 208
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 208
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3275
;3275:	break;
ADDRGP4 $1880
JUMPV
LABELV $1882
line 3277
;3276:	}
;3277:	}
LABELV $1879
line 3271
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 343
LTI4 $1878
LABELV $1880
line 3278
;3278:}
LABELV $1529
endproc Cmd_UseCvar_f 212 12
export Cmd_Stats_f
proc Cmd_Stats_f 0 0
line 3285
;3279:
;3280:/*
;3281:=================
;3282:Cmd_Stats_f
;3283:=================
;3284:*/
;3285:void Cmd_Stats_f( gentity_t *ent ) {
line 3300
;3286:/*
;3287:	int max, n, i;
;3288:
;3289:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;3290:
;3291:	n = 0;
;3292:	for ( i = 0; i < max; i++ ) {
;3293:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;3294:			n++;
;3295:	}
;3296:
;3297:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;3298:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;3299:*/
;3300:}
LABELV $1885
endproc Cmd_Stats_f 0 0
export Cmd_GetMappage_f
proc Cmd_GetMappage_f 1688 48
line 3302
;3301:
;3302:void Cmd_GetMappage_f( gentity_t *ent ) {
line 3306
;3303:        t_mappage page;
;3304:        char string[(MAX_MAPNAME+1)*MAPS_PER_PAGE+1];
;3305:        char arg[MAX_STRING_TOKENS];
;3306:        trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 655
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3307
;3307:        page = getMappage(atoi(arg));
ADDRLP4 655
ARGP4
ADDRLP4 1680
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 1680
INDIRI4
ARGI4
ADDRGP4 getMappage
CALLV
pop
line 3308
;3308:        Q_strncpyz(string,va("mappage %d %s %s %s %s %s %s %s %s %s %s",page.pagenumber,page.mapname[0],\
ADDRGP4 $1887
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0+4
ARGP4
ADDRLP4 0+4+32
ARGP4
ADDRLP4 0+4+64
ARGP4
ADDRLP4 0+4+96
ARGP4
ADDRLP4 0+4+128
ARGP4
ADDRLP4 0+4+160
ARGP4
ADDRLP4 0+4+192
ARGP4
ADDRLP4 0+4+224
ARGP4
ADDRLP4 0+4+256
ARGP4
ADDRLP4 0+4+288
ARGP4
ADDRLP4 1684
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 324
ARGP4
ADDRLP4 1684
INDIRP4
ARGP4
CNSTI4 331
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3312
;3309:                page.mapname[1],page.mapname[2],page.mapname[3],page.mapname[4],page.mapname[5],\
;3310:                page.mapname[6],page.mapname[7],page.mapname[8],page.mapname[9]),sizeof(string));
;3311:        //G_Printf("Mappage sent: \"%s\"\n", string);
;3312:	trap_SendServerCommand( ent-g_entities, string );
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
ADDRLP4 324
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3313
;3313:}
LABELV $1886
endproc Cmd_GetMappage_f 1688 48
data
export cmds
align 4
LABELV cmds
address $1907
byte 4 0
address Cmd_Team_f
address $1908
byte 4 0
address Cmd_Vote_f
address $1909
byte 4 4
address Cmd_Tell_f
address $1910
byte 4 4
address Cmd_CallVote_f
address $1911
byte 4 12
address Cmd_CallTeamVote_f
address $1912
byte 4 260
address Cmd_Say_f
address $679
byte 4 260
address Cmd_Say_f
address $1913
byte 4 260
address Cmd_Voice_f
address $945
byte 4 260
address Cmd_Voice_f
address $1914
byte 4 260
address Cmd_Voice_f
address $923
byte 4 260
address Cmd_VoiceTell_f
address $950
byte 4 260
address Cmd_Voice_f
address $946
byte 4 260
address Cmd_Voice_f
address $1915
byte 4 260
address Cmd_Voice_f
address $959
byte 4 260
address Cmd_VoiceTell_f
address $1916
byte 4 260
address Cmd_VoiceTaunt_f
address $428
byte 4 256
address Cmd_Score_f
address $1917
byte 4 256
address Cmd_Acc_f
address $1918
byte 4 128
address Cmd_Give_f
address $1919
byte 4 128
address Cmd_VehicleExit_f
address $1920
byte 4 129
address Cmd_God_f
address $1921
byte 4 129
address Cmd_Notarget_f
address $1922
byte 4 1
address Cmd_LevelShot_f
address $1923
byte 4 1
address Cmd_SetViewpos_f
address $1924
byte 4 128
address Cmd_Noclip_f
address $1925
byte 4 136
address Cmd_Kill_f
address $1926
byte 4 128
address Cmd_SpawnList_Item_f
address $1927
byte 4 128
address Cmd_Modify_Prop_f
address $1928
byte 4 128
address Cmd_Altfire_Physgun_f
address $1929
byte 4 0
address Cmd_PropNpc_AS_f
address $1930
byte 4 128
address Cmd_PhysgunDist_f
address $1931
byte 4 128
address Cmd_Flashlight_f
address $1932
byte 4 136
address Cmd_DropWeapon_f
address $1933
byte 4 136
address Cmd_DropHoldable_f
address $1934
byte 4 128
address Cmd_UseTarget_f
address $1935
byte 4 0
address Cmd_UseCvar_f
address $1936
byte 4 0
address Cmd_Where_f
address $1937
byte 4 16
address Cmd_Follow_f
address $590
byte 4 16
address Cmd_FollowCycle_f
address $587
byte 4 16
address Cmd_FollowCycle_f
address $1938
byte 4 8
address Cmd_TeamVote_f
address $362
byte 4 8
address Cmd_TeamTask_f
address $1939
byte 4 16
address StopFollowing
address $1940
byte 4 0
address Cmd_GetMappage_f
address $1941
byte 4 0
address Cmd_GameCommand_f
align 4
LABELV numCmds
byte 4 45
export ClientCommand
code
proc ClientCommand 1048 12
line 3389
;3314:
;3315://KK-OAX This is the table that ClientCommands runs the console entry against.
;3316:commands_t cmds[ ] =
;3317:{
;3318:  // normal commands
;3319:  { "team", 0, Cmd_Team_f },
;3320:  { "vote", 0, Cmd_Vote_f },
;3321:
;3322:  // communication commands
;3323:  { "tell", CMD_MESSAGE, Cmd_Tell_f },
;3324:  { "callvote", CMD_MESSAGE, Cmd_CallVote_f },
;3325:  { "callteamvote", CMD_MESSAGE|CMD_TEAM, Cmd_CallTeamVote_f },
;3326:  // can be used even during intermission
;3327:  { "say", CMD_MESSAGE|CMD_INTERMISSION, Cmd_Say_f },
;3328:  { "say_team", CMD_MESSAGE|CMD_INTERMISSION, Cmd_Say_f },
;3329:  { "vsay", CMD_MESSAGE|CMD_INTERMISSION, Cmd_Voice_f },
;3330:  { "vsay_team", CMD_MESSAGE|CMD_INTERMISSION, Cmd_Voice_f },
;3331:  { "vsay_local", CMD_MESSAGE|CMD_INTERMISSION, Cmd_Voice_f },
;3332:  { "vtell", CMD_MESSAGE|CMD_INTERMISSION, Cmd_VoiceTell_f },
;3333:  { "vosay", CMD_MESSAGE|CMD_INTERMISSION, Cmd_Voice_f },
;3334:  { "vosay_team", CMD_MESSAGE|CMD_INTERMISSION, Cmd_Voice_f },
;3335:  { "vosay_local", CMD_MESSAGE|CMD_INTERMISSION, Cmd_Voice_f },
;3336:  { "votell", CMD_MESSAGE|CMD_INTERMISSION, Cmd_VoiceTell_f },
;3337:  { "vtaunt", CMD_MESSAGE|CMD_INTERMISSION, Cmd_VoiceTaunt_f },
;3338:
;3339:  { "score", CMD_INTERMISSION, Cmd_Score_f },
;3340:  { "acc", CMD_INTERMISSION, Cmd_Acc_f},
;3341:
;3342:  // cheats
;3343:  { "give", CMD_LIVING, Cmd_Give_f },
;3344:  { "exitvehicle", CMD_LIVING, Cmd_VehicleExit_f },
;3345:  { "god", CMD_CHEAT|CMD_LIVING, Cmd_God_f },
;3346:  { "notarget", CMD_CHEAT|CMD_LIVING, Cmd_Notarget_f },
;3347:  { "levelshot", CMD_CHEAT, Cmd_LevelShot_f },
;3348:  { "setviewpos", CMD_CHEAT, Cmd_SetViewpos_f },
;3349:  { "noclip", CMD_LIVING, Cmd_Noclip_f },
;3350:
;3351:  { "kill", CMD_TEAM|CMD_LIVING, Cmd_Kill_f },
;3352:  { "sl", CMD_LIVING, Cmd_SpawnList_Item_f },
;3353:  { "tm", CMD_LIVING, Cmd_Modify_Prop_f },
;3354:  { "altfire_physgun", CMD_LIVING, Cmd_Altfire_Physgun_f },
;3355:  { "create", 0, Cmd_PropNpc_AS_f },
;3356:  { "physgun_dist", CMD_LIVING, Cmd_PhysgunDist_f },
;3357:  { "flashlight", CMD_LIVING, Cmd_Flashlight_f },
;3358:  { "dropweapon", CMD_TEAM|CMD_LIVING, Cmd_DropWeapon_f },
;3359:  { "dropholdable", CMD_TEAM|CMD_LIVING, Cmd_DropHoldable_f },
;3360:  { "usetarget", CMD_LIVING, Cmd_UseTarget_f },
;3361:  { "usecvar", 0, Cmd_UseCvar_f },
;3362:  { "where", 0, Cmd_Where_f },
;3363:
;3364:  // game commands
;3365:
;3366:  { "follow", CMD_NOTEAM, Cmd_Follow_f },
;3367:  { "follownext", CMD_NOTEAM, Cmd_FollowCycle_f },
;3368:  { "followprev", CMD_NOTEAM, Cmd_FollowCycle_f },
;3369:
;3370:  { "teamvote", CMD_TEAM, Cmd_TeamVote_f },
;3371:  { "teamtask", CMD_TEAM, Cmd_TeamTask_f },
;3372:  //KK-OAX
;3373:  { "freespectator", CMD_NOTEAM, StopFollowing },
;3374:  { "getmappage", 0, Cmd_GetMappage_f },
;3375:  { "gc", 0, Cmd_GameCommand_f }
;3376:
;3377:};
;3378:
;3379:static int numCmds = sizeof( cmds ) / sizeof( cmds[ 0 ] );
;3380:
;3381:/*
;3382:=================
;3383:ClientCommand
;3384:KK-OAX, Takes the client command and runs it through a loop which matches
;3385:it against the table.
;3386:=================
;3387:*/
;3388:void ClientCommand( int clientNum )
;3389:{
line 3394
;3390:    gentity_t *ent;
;3391:    char      cmd[ MAX_TOKEN_CHARS ];
;3392:    int       i;
;3393:
;3394:    ent = g_entities + clientNum;
ADDRLP4 1028
CNSTI4 2492
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3395
;3395:    if( !ent->client )
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1943
line 3396
;3396:        return;   // not fully in game yet
ADDRGP4 $1942
JUMPV
LABELV $1943
line 3398
;3397:
;3398:    trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3400
;3399:
;3400:    for( i = 0; i < numCmds; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1948
JUMPV
LABELV $1945
line 3401
;3401:    {
line 3402
;3402:        if( Q_stricmp( cmd, cmds[ i ].cmdName ) == 0 )
ADDRLP4 4
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1949
line 3403
;3403:            break;
ADDRGP4 $1947
JUMPV
LABELV $1949
line 3404
;3404:    }
LABELV $1946
line 3400
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1948
ADDRLP4 0
INDIRI4
ADDRGP4 numCmds
INDIRI4
LTI4 $1945
LABELV $1947
line 3406
;3405:
;3406:    if( i == numCmds )
ADDRLP4 0
INDIRI4
ADDRGP4 numCmds
INDIRI4
NEI4 $1951
line 3407
;3407:    {   // KK-OAX Admin Command Check
line 3408
;3408:        if( !G_admin_cmd_check( ent, qfalse ) )
ADDRLP4 1028
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1032
ADDRGP4 G_admin_cmd_check
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $1942
line 3409
;3409:            trap_SendServerCommand( clientNum,
ADDRGP4 $1955
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3411
;3410:                va( "print \"Unknown command %s\n\"", cmd ) );
;3411:            return;
ADDRGP4 $1942
JUMPV
LABELV $1951
line 3415
;3412:    }
;3413:
;3414:  // do tests here to reduce the amount of repeated code
;3415:    if( !( cmds[ i ].cmdFlags & CMD_INTERMISSION ) && level.intermissiontime )
ADDRLP4 1032
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 1032
INDIRI4
NEI4 $1956
ADDRGP4 level+9912
INDIRI4
ADDRLP4 1032
INDIRI4
EQI4 $1956
line 3416
;3416:        return;
ADDRGP4 $1942
JUMPV
LABELV $1956
line 3418
;3417:
;3418:    if( cmds[ i ].cmdFlags & CMD_CHEAT && !g_cheats.integer )
ADDRLP4 1036
CNSTI4 0
ASGNI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1036
INDIRI4
EQI4 $1960
ADDRGP4 g_cheats+12
INDIRI4
ADDRLP4 1036
INDIRI4
NEI4 $1960
line 3419
;3419:    {
line 3420
;3420:        trap_SendServerCommand( clientNum,
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $1964
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3422
;3421:            "print \"Cheats are not enabled on this server\n\"" );
;3422:        return;
ADDRGP4 $1942
JUMPV
LABELV $1960
line 3430
;3423:    }
;3424:    //KK-OAX When the corresponding code is integrated, I will activate these.
;3425:    //if( cmds[ i ].cmdFlags & CMD_MESSAGE &&
;3426:    //    ( ent->client->pers.muted || G_FloodLimited( ent ) ) )
;3427:    //    return;
;3428:
;3429:    //KK-OAX Do I need to change this for FFA gametype?
;3430:    if( cmds[ i ].cmdFlags & CMD_TEAM &&
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1965
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1965
line 3432
;3431:        ent->client->sess.sessionTeam == TEAM_SPECTATOR )
;3432:    {
line 3433
;3433:        trap_SendServerCommand( clientNum, "print \"Join a team first\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $1968
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3434
;3434:        return;
ADDRGP4 $1942
JUMPV
LABELV $1965
line 3437
;3435:    }
;3436:
;3437:    if( ( cmds[ i ].cmdFlags & CMD_NOTEAM ||
ADDRLP4 1040
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1044
CNSTI4 0
ASGNI4
ADDRLP4 1040
INDIRI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 1044
INDIRI4
NEI4 $1974
ADDRLP4 1040
INDIRI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 1044
INDIRI4
EQI4 $1969
ADDRGP4 g_cheats+12
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $1969
LABELV $1974
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1969
line 3440
;3438:        ( cmds[ i ].cmdFlags & CMD_CHEAT_TEAM && !g_cheats.integer ) ) &&
;3439:        ent->client->sess.sessionTeam != TEAM_NONE )
;3440:    {
line 3441
;3441:        trap_SendServerCommand( clientNum,
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $1975
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3443
;3442:            "print \"Cannot use this command when on a team\n\"" );
;3443:        return;
ADDRGP4 $1942
JUMPV
LABELV $1969
line 3446
;3444:    }
;3445:
;3446:    if( cmds[ i ].cmdFlags & CMD_RED &&
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1976
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1976
line 3448
;3447:        ent->client->sess.sessionTeam != TEAM_RED )
;3448:    {
line 3449
;3449:        trap_SendServerCommand( clientNum,
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $1979
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3451
;3450:            "print \"Must be on the Red Team to use this command\n\"" );
;3451:        return;
ADDRGP4 $1942
JUMPV
LABELV $1976
line 3454
;3452:    }
;3453:
;3454:    if( cmds[ i ].cmdFlags & CMD_BLUE &&
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1980
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 1032
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1980
line 3456
;3455:        ent->client->sess.sessionTeam != TEAM_BLUE )
;3456:    {
line 3457
;3457:        trap_SendServerCommand( clientNum,
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $1983
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3459
;3458:            "print \"Must be on the Blue Team to use this command\n\"" );
;3459:        return;
ADDRGP4 $1942
JUMPV
LABELV $1980
line 3462
;3460:    }
;3461:
;3462:    if( ( ent->client->ps.pm_type == PM_DEAD ) && ( cmds[ i ].cmdFlags & CMD_LIVING ) )
ADDRLP4 1028
INDIRP4
CNSTI4 556
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1984
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+4
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1984
line 3463
;3463:    {
line 3464
;3464:        trap_SendServerCommand( clientNum,
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $1987
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3466
;3465:            "print \"Must be alive to use this command\n\"" );
;3466:        return;
ADDRGP4 $1942
JUMPV
LABELV $1984
line 3469
;3467:    }
;3468:
;3469:    cmds[ i ].cmdHandler( ent );
ADDRLP4 1028
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cmds+8
ADDP4
INDIRP4
CALLV
pop
line 3470
;3470:}
LABELV $1942
endproc ClientCommand 1048 12
import G_AddBot
import G_BuildPropSL
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
LABELV $1987
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1983
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1979
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1975
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1968
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1964
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
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
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1955
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1941
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $1940
byte 1 103
byte 1 101
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1939
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1938
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1937
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1936
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1935
byte 1 117
byte 1 115
byte 1 101
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $1934
byte 1 117
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1933
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1932
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1931
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
align 1
LABELV $1930
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1929
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1928
byte 1 97
byte 1 108
byte 1 116
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 95
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1927
byte 1 116
byte 1 109
byte 1 0
align 1
LABELV $1926
byte 1 115
byte 1 108
byte 1 0
align 1
LABELV $1925
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1924
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1923
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $1922
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $1921
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1920
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $1919
byte 1 101
byte 1 120
byte 1 105
byte 1 116
byte 1 118
byte 1 101
byte 1 104
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1918
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1917
byte 1 97
byte 1 99
byte 1 99
byte 1 0
align 1
LABELV $1916
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1915
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1914
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1913
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1912
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1911
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1910
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1909
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1908
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1907
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1887
byte 1 109
byte 1 97
byte 1 112
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1884
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
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
LABELV $1877
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1868
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $1867
byte 1 103
byte 1 95
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 77
byte 1 97
byte 1 120
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1866
byte 1 103
byte 1 95
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1865
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1864
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1863
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $1862
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $1861
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 98
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1860
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1859
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1858
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1857
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1856
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $1855
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1854
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1853
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1852
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1851
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1850
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1849
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $1848
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1847
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1846
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1845
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1844
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $1843
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1842
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1841
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1840
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $1839
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1838
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $1837
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $1836
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1835
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1834
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1833
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1832
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1831
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $1830
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1829
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1828
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1827
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1826
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1825
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1824
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $1823
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1822
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1821
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1820
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1819
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $1818
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $1817
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1816
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1815
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $1814
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1813
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1812
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1811
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1810
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1809
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1808
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1807
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1806
byte 1 103
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1805
byte 1 103
byte 1 95
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1804
byte 1 103
byte 1 95
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1803
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1802
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1801
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1800
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1799
byte 1 103
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1798
byte 1 103
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1797
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1796
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1795
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1794
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1793
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1792
byte 1 103
byte 1 95
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $1791
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1790
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1789
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $1788
byte 1 103
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1787
byte 1 103
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1786
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $1785
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1784
byte 1 103
byte 1 95
byte 1 115
byte 1 108
byte 1 111
byte 1 119
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $1783
byte 1 103
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $1782
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1781
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1780
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1779
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1778
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1777
byte 1 103
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1776
byte 1 103
byte 1 95
byte 1 98
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1775
byte 1 103
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1774
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1773
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1772
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1771
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1770
byte 1 103
byte 1 95
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 98
byte 1 105
byte 1 103
byte 1 0
align 1
LABELV $1769
byte 1 103
byte 1 95
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1768
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $1767
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $1766
byte 1 103
byte 1 95
byte 1 115
byte 1 108
byte 1 105
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1765
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1764
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1763
byte 1 103
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1762
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1761
byte 1 103
byte 1 95
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
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1760
byte 1 103
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1759
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1758
byte 1 103
byte 1 95
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1757
byte 1 103
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1756
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $1755
byte 1 103
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 108
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1754
byte 1 103
byte 1 95
byte 1 115
byte 1 108
byte 1 105
byte 1 99
byte 1 107
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $1753
byte 1 103
byte 1 95
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1752
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1751
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1750
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1749
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1748
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $1747
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1746
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $1745
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1744
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1743
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1742
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1741
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $1740
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1739
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $1738
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1737
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1736
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1735
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1734
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1733
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1732
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1731
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1730
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1729
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1728
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1727
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1726
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1725
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1724
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1723
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1722
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1721
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1720
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1719
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1718
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1717
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1716
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1715
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1714
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1713
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1712
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1711
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1710
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1709
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1708
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1707
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1706
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $1705
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1704
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1703
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $1702
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1701
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1700
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1699
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1698
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1697
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1696
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $1695
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1694
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1693
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1692
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1691
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1690
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $1689
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1688
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1687
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1686
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1685
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1684
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1683
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1682
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1681
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1680
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1679
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1678
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1677
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1676
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1675
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1674
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1673
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1672
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 104
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1671
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1670
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1669
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1668
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1667
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1666
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $1665
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1664
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1663
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1662
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1661
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1660
byte 1 103
byte 1 95
byte 1 97
byte 1 109
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1659
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1658
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1657
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1656
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1655
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1654
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $1653
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1652
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1651
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1650
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1649
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1648
byte 1 103
byte 1 95
byte 1 102
byte 1 116
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1647
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1646
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1645
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1644
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1643
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1642
byte 1 103
byte 1 95
byte 1 99
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1641
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1640
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1639
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1638
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1637
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1636
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1635
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1634
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1633
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1632
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1631
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1630
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1629
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1628
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1627
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $1626
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1625
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $1624
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1623
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1622
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1621
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1620
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1619
byte 1 103
byte 1 95
byte 1 110
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1618
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1617
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1616
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1615
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1614
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1613
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $1612
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1611
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1610
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1609
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1608
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1607
byte 1 103
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1606
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1605
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1604
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1603
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1602
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1601
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $1600
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1599
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1598
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1597
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1596
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1595
byte 1 103
byte 1 95
byte 1 112
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1594
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1593
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1592
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1591
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1590
byte 1 103
byte 1 95
byte 1 114
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1589
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1588
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1587
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1586
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1585
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1584
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $1583
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1582
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1581
byte 1 103
byte 1 95
byte 1 108
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1580
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1579
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1578
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1577
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1576
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1575
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $1574
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1573
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1572
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1571
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1570
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1569
byte 1 103
byte 1 95
byte 1 114
byte 1 108
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1568
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1567
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1566
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1565
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1564
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1563
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $1562
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1561
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1560
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1559
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1558
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1557
byte 1 103
byte 1 95
byte 1 103
byte 1 108
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1556
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1555
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1554
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1553
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1552
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1551
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1550
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $1549
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1548
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1547
byte 1 103
byte 1 95
byte 1 115
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1546
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1545
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 105
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $1544
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 118
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1543
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 115
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1542
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 115
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1541
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $1540
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 115
byte 1 112
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1539
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1538
byte 1 103
byte 1 95
byte 1 109
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1537
byte 1 103
byte 1 95
byte 1 103
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1536
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1535
byte 1 103
byte 1 95
byte 1 103
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $1534
byte 1 103
byte 1 95
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1533
byte 1 103
byte 1 95
byte 1 103
byte 1 104
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $1532
byte 1 103
byte 1 95
byte 1 103
byte 1 104
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1531
byte 1 103
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 105
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1516
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 32
byte 1 120
byte 1 32
byte 1 121
byte 1 32
byte 1 122
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1499
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1496
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1493
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1469
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1457
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1456
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1421
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1415
byte 1 32
byte 1 0
align 1
LABELV $1406
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
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1402
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1384
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1383
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1380
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1371
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1361
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1360
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 114
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 109
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 32
byte 1 83
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1347
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1344
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1327
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 32
byte 1 84
byte 1 114
byte 1 121
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1318
byte 1 83
byte 1 104
byte 1 117
byte 1 102
byte 1 102
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 63
byte 1 0
align 1
LABELV $1313
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1306
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 63
byte 1 0
align 1
LABELV $1301
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 100
byte 1 109
byte 1 34
byte 1 32
byte 1 34
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 112
byte 1 117
byte 1 98
byte 1 108
byte 1 105
byte 1 99
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 34
byte 1 0
align 1
LABELV $1298
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 0
align 1
LABELV $1291
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1286
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 63
byte 1 0
align 1
LABELV $1283
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 34
byte 1 48
byte 1 34
byte 1 0
align 1
LABELV $1280
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 63
byte 1 0
align 1
LABELV $1277
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 34
byte 1 49
byte 1 34
byte 1 0
align 1
LABELV $1270
byte 1 82
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 63
byte 1 0
align 1
LABELV $1263
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 63
byte 1 0
align 1
LABELV $1260
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1253
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1248
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 63
byte 1 0
align 1
LABELV $1245
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1240
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 0
align 1
LABELV $1237
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1232
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 63
byte 1 0
align 1
LABELV $1231
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1228
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1225
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1222
byte 1 101
byte 1 110
byte 1 100
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1214
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 63
byte 1 0
align 1
LABELV $1211
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1208
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1203
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1196
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 59
byte 1 32
byte 1 109
byte 1 97
byte 1 111
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $1193
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 63
byte 1 0
align 1
LABELV $1190
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 59
byte 1 32
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
byte 1 59
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1185
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1182
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1178
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1169
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1141
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1138
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $1136
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 60
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 62
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1133
byte 1 115
byte 1 104
byte 1 117
byte 1 102
byte 1 102
byte 1 108
byte 1 101
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1130
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 62
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1127
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1124
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1121
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1118
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1115
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 60
byte 1 110
byte 1 62
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1112
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 60
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1109
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1106
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
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1103
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $1102
byte 1 115
byte 1 104
byte 1 117
byte 1 102
byte 1 102
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1099
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $1096
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1093
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $1090
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $1087
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1084
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1081
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1078
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1075
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1072
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
byte 1 0
align 1
LABELV $1068
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1059
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1056
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
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1052
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1048
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1043
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1042
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1041
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1040
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1039
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1038
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1037
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1036
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $1035
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $1034
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
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
LABELV $1033
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1032
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1031
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1030
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
LABELV $1021
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $1020
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 0
align 1
LABELV $1019
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 32
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
LABELV $1018
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1017
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1016
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1015
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1014
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1011
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $994
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $989
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $978
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $968
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $959
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $950
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $946
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $945
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $936
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $925
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $924
byte 1 118
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $923
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $920
byte 1 118
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $903
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $775
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $774
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $749
byte 1 48
byte 1 0
align 1
LABELV $741
byte 1 78
byte 1 80
byte 1 67
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 116
byte 1 110
byte 1 101
byte 1 114
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $738
byte 1 78
byte 1 80
byte 1 67
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 116
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $735
byte 1 78
byte 1 80
byte 1 67
byte 1 95
byte 1 71
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $732
byte 1 78
byte 1 80
byte 1 67
byte 1 95
byte 1 67
byte 1 105
byte 1 116
byte 1 105
byte 1 122
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $729
byte 1 78
byte 1 80
byte 1 67
byte 1 95
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 0
align 1
LABELV $721
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
LABELV $716
byte 1 110
byte 1 112
byte 1 99
byte 1 0
align 1
LABELV $711
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 0
align 1
LABELV $708
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
byte 1 0
align 1
LABELV $699
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $679
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $667
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $661
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $660
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $655
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $654
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $651
byte 1 115
byte 1 97
byte 1 121
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $649
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $648
byte 1 115
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $638
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $637
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $636
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $635
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $598
byte 1 67
byte 1 109
byte 1 100
byte 1 95
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 102
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 100
byte 1 105
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $590
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $587
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $552
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 53
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $545
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $543
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 45
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $541
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $539
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $511
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $497
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 104
byte 1 97
byte 1 115
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
byte 1 34
byte 1 0
align 1
LABELV $493
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
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
byte 1 34
byte 1 0
align 1
LABELV $489
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
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
byte 1 34
byte 1 0
align 1
LABELV $470
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $465
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $452
byte 1 98
byte 1 0
align 1
LABELV $451
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $447
byte 1 114
byte 1 0
align 1
LABELV $446
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $439
byte 1 115
byte 1 0
align 1
LABELV $438
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $435
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $432
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $428
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $427
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
LABELV $416
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $415
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
LABELV $406
byte 1 80
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $403
byte 1 73
byte 1 110
byte 1 118
byte 1 117
byte 1 108
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $400
byte 1 75
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $397
byte 1 77
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $394
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $390
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $387
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $384
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $381
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $363
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $362
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
LABELV $358
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $357
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $354
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 48
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $337
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $336
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $330
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $329
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $328
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $313
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $310
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $307
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $304
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $301
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $295
byte 1 109
byte 1 111
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $289
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $279
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $269
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $263
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $260
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $250
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $240
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
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
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $237
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $219
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
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $216
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
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
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $209
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $204
byte 1 111
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $199
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $193
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 34
byte 1 97
byte 1 108
byte 1 108
byte 1 34
byte 1 0
align 1
LABELV $189
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $183
byte 1 100
byte 1 111
byte 1 109
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $163
byte 1 100
byte 1 100
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $161
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $154
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $151
byte 1 100
byte 1 111
byte 1 109
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $146
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $139
byte 1 97
byte 1 99
byte 1 99
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $138
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $136
byte 1 115
byte 1 119
byte 1 101
byte 1 112
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $131
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $122
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 80
byte 1 114
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $108
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $101
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $87
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
