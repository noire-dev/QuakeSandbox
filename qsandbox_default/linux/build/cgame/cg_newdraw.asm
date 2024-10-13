data
export drawTeamOverlayModificationCount
align 4
LABELV drawTeamOverlayModificationCount
byte 4 -1
export CG_InitTeamChat
code
proc CG_InitTeamChat 0 12
file "../../../code/cgame/cg_newdraw.c"
line 43
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
;22:
;23:#ifndef MISSIONPACK // bk001204
;24:#error This file not be used for classic Q3A.
;25:#endif
;26:
;27:#include "cg_local.h"
;28:#include "../ui/ui_shared.h"
;29:
;30:extern displayContextDef_t cgDC;
;31:
;32:
;33:// set in CG_ParseTeamInfo
;34:
;35://static int sortedTeamPlayers[TEAM_MAXOVERLAY];
;36://static int numSortedTeamPlayers;
;37:int drawTeamOverlayModificationCount = -1;
;38:
;39://static char systemChat[256];
;40://static char teamChat1[256];
;41://static char teamChat2[256];
;42:
;43:void CG_InitTeamChat(void) {
line 44
;44:  memset(teamChat1, 0, sizeof(teamChat1));
ADDRGP4 teamChat1
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 45
;45:  memset(teamChat2, 0, sizeof(teamChat2));
ADDRGP4 teamChat2
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 46
;46:  memset(systemChat, 0, sizeof(systemChat));
ADDRGP4 systemChat
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 47
;47:}
LABELV $90
endproc CG_InitTeamChat 0 12
export CG_SetPrintString
proc CG_SetPrintString 0 12
line 49
;48:
;49:void CG_SetPrintString(int type, const char *p) {
line 50
;50:  if (type == SYSTEM_PRINT) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $92
line 51
;51:    Q_strncpyz(systemChat, p, sizeof(systemChat));
ADDRGP4 systemChat
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 52
;52:  } else {
ADDRGP4 $93
JUMPV
LABELV $92
line 53
;53:    Q_strncpyz(teamChat2, teamChat1, sizeof(teamChat2));
ADDRGP4 teamChat2
ARGP4
ADDRGP4 teamChat1
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 54
;54:    Q_strncpyz(teamChat1, p, sizeof(teamChat1));
ADDRGP4 teamChat1
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 55
;55:  }
LABELV $93
line 56
;56:}
LABELV $91
endproc CG_SetPrintString 0 12
export CG_CheckOrderPending
proc CG_CheckOrderPending 28 12
line 58
;57:
;58:void CG_CheckOrderPending(void) {
line 59
;59:	if (cgs.gametype < GT_CTF || cgs.ffa_gt>0) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
LTI4 $99
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 0
LEI4 $95
LABELV $99
line 60
;60:		return;
ADDRGP4 $94
JUMPV
LABELV $95
line 62
;61:	}
;62:	if (cgs.orderPending) {
ADDRGP4 cgs+956324
INDIRI4
CNSTI4 0
EQI4 $100
line 65
;63:		//clientInfo_t *ci = cgs.clientinfo + sortedTeamPlayers[cg_currentSelectedPlayer.integer];
;64:		const char *p1, *p2, *b;
;65:		p1 = p2 = b = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 66
;66:		switch (cgs.currentOrder) {
ADDRLP4 16
ADDRGP4 cgs+956320
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $103
ADDRLP4 16
INDIRI4
CNSTI4 7
GTI4 $103
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $131-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $131
address $106
address $110
address $114
address $118
address $125
address $128
address $122
code
LABELV $106
line 68
;67:			case TEAMTASK_OFFENSE:
;68:				p1 = VOICECHAT_ONOFFENSE;
ADDRLP4 8
ADDRGP4 $107
ASGNP4
line 69
;69:				p2 = VOICECHAT_OFFENSE;
ADDRLP4 4
ADDRGP4 $108
ASGNP4
line 70
;70:				b = "+button7; wait; -button7";
ADDRLP4 0
ADDRGP4 $109
ASGNP4
line 71
;71:			break;
ADDRGP4 $104
JUMPV
LABELV $110
line 73
;72:			case TEAMTASK_DEFENSE:
;73:				p1 = VOICECHAT_ONDEFENSE;
ADDRLP4 8
ADDRGP4 $111
ASGNP4
line 74
;74:				p2 = VOICECHAT_DEFEND;
ADDRLP4 4
ADDRGP4 $112
ASGNP4
line 75
;75:				b = "+button8; wait; -button8";
ADDRLP4 0
ADDRGP4 $113
ASGNP4
line 76
;76:			break;					
ADDRGP4 $104
JUMPV
LABELV $114
line 78
;77:			case TEAMTASK_PATROL:
;78:				p1 = VOICECHAT_ONPATROL;
ADDRLP4 8
ADDRGP4 $115
ASGNP4
line 79
;79:				p2 = VOICECHAT_PATROL;
ADDRLP4 4
ADDRGP4 $116
ASGNP4
line 80
;80:				b = "+button9; wait; -button9";
ADDRLP4 0
ADDRGP4 $117
ASGNP4
line 81
;81:			break;
ADDRGP4 $104
JUMPV
LABELV $118
line 83
;82:			case TEAMTASK_FOLLOW: 
;83:				p1 = VOICECHAT_ONFOLLOW;
ADDRLP4 8
ADDRGP4 $119
ASGNP4
line 84
;84:				p2 = VOICECHAT_FOLLOWME;
ADDRLP4 4
ADDRGP4 $120
ASGNP4
line 85
;85:				b = "+button10; wait; -button10";
ADDRLP4 0
ADDRGP4 $121
ASGNP4
line 86
;86:			break;
ADDRGP4 $104
JUMPV
LABELV $122
line 88
;87:			case TEAMTASK_CAMP:
;88:				p1 = VOICECHAT_ONCAMPING;
ADDRLP4 8
ADDRGP4 $123
ASGNP4
line 89
;89:				p2 = VOICECHAT_CAMP;
ADDRLP4 4
ADDRGP4 $124
ASGNP4
line 90
;90:			break;
ADDRGP4 $104
JUMPV
LABELV $125
line 92
;91:			case TEAMTASK_RETRIEVE:
;92:				p1 = VOICECHAT_ONGETFLAG;
ADDRLP4 8
ADDRGP4 $126
ASGNP4
line 93
;93:				p2 = VOICECHAT_RETURNFLAG;
ADDRLP4 4
ADDRGP4 $127
ASGNP4
line 94
;94:			break;
ADDRGP4 $104
JUMPV
LABELV $128
line 96
;95:			case TEAMTASK_ESCORT:
;96:				p1 = VOICECHAT_ONFOLLOWCARRIER;
ADDRLP4 8
ADDRGP4 $129
ASGNP4
line 97
;97:				p2 = VOICECHAT_FOLLOWFLAGCARRIER;
ADDRLP4 4
ADDRGP4 $130
ASGNP4
line 98
;98:			break;
LABELV $103
LABELV $104
line 101
;99:		}
;100:
;101:		if (cg_currentSelectedPlayer.integer == numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
NEI4 $133
line 103
;102:			// to everyone
;103:			trap_SendConsoleCommand(va("cmd vsay_team %s\n", p2));
ADDRGP4 $136
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 104
;104:		} else {
ADDRGP4 $134
JUMPV
LABELV $133
line 106
;105:			// for the player self
;106:			if (sortedTeamPlayers[cg_currentSelectedPlayer.integer] == cg.snap->ps.clientNum && p1) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $137
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $137
line 107
;107:				trap_SendConsoleCommand(va("teamtask %i\n", cgs.currentOrder));
ADDRGP4 $141
ARGP4
ADDRGP4 cgs+956320
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 109
;108:				//trap_SendConsoleCommand(va("cmd say_team %s\n", p2));
;109:				trap_SendConsoleCommand(va("cmd vsay_team %s\n", p1));
ADDRGP4 $136
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 110
;110:			} else if (p2) {
ADDRGP4 $138
JUMPV
LABELV $137
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $143
line 112
;111:				//trap_SendConsoleCommand(va("cmd say_team %s, %s\n", ci->name,p));
;112:				trap_SendConsoleCommand(va("cmd vtell %d %s\n", sortedTeamPlayers[cg_currentSelectedPlayer.integer], p2));
ADDRGP4 $145
ARGP4
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 113
;113:			}
LABELV $143
LABELV $138
line 114
;114:		}
LABELV $134
line 115
;115:		if (b) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $147
line 116
;116:			trap_SendConsoleCommand(b);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 117
;117:		}
LABELV $147
line 118
;118:		cgs.orderPending = qfalse;
ADDRGP4 cgs+956324
CNSTI4 0
ASGNI4
line 119
;119:	}
LABELV $100
line 120
;120:}
LABELV $94
endproc CG_CheckOrderPending 28 12
proc CG_SetSelectedPlayerName 8 8
line 122
;121:
;122:static void CG_SetSelectedPlayerName( void ) {
line 123
;123:  if (cg_currentSelectedPlayer.integer >= 0 && cg_currentSelectedPlayer.integer < numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LTI4 $151
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
GEI4 $151
line 124
;124:		clientInfo_t *ci = cgs.clientinfo + sortedTeamPlayers[cg_currentSelectedPlayer.integer];
ADDRLP4 0
CNSTI4 1944
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 125
;125:	  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $152
line 126
;126:			trap_Cvar_Set("cg_selectedPlayerName", ci->name);
ADDRGP4 $159
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 127
;127:			trap_Cvar_Set("cg_selectedPlayer", va("%d", sortedTeamPlayers[cg_currentSelectedPlayer.integer]));
ADDRGP4 $161
ARGP4
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $160
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 128
;128:			cgs.currentOrder = ci->teamTask;
ADDRGP4 cgs+956320
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 129
;129:	  }
line 130
;130:	} else {
ADDRGP4 $152
JUMPV
LABELV $151
line 131
;131:		trap_Cvar_Set("cg_selectedPlayerName", "Everyone");
ADDRGP4 $159
ARGP4
ADDRGP4 $164
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 132
;132:	}
LABELV $152
line 133
;133:}
LABELV $150
endproc CG_SetSelectedPlayerName 8 8
export CG_GetSelectedPlayer
proc CG_GetSelectedPlayer 0 0
line 134
;134:int CG_GetSelectedPlayer( void ) {
line 135
;135:	if (cg_currentSelectedPlayer.integer < 0 || cg_currentSelectedPlayer.integer >= numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LTI4 $170
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
LTI4 $166
LABELV $170
line 136
;136:		cg_currentSelectedPlayer.integer = 0;
ADDRGP4 cg_currentSelectedPlayer+12
CNSTI4 0
ASGNI4
line 137
;137:	}
LABELV $166
line 138
;138:	return cg_currentSelectedPlayer.integer;
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
RETI4
LABELV $165
endproc CG_GetSelectedPlayer 0 0
export CG_SelectNextPlayer
proc CG_SelectNextPlayer 4 0
line 141
;139:}
;140:
;141:void CG_SelectNextPlayer( void ) {
line 142
;142:	CG_CheckOrderPending();
ADDRGP4 CG_CheckOrderPending
CALLV
pop
line 143
;143:	if (cg_currentSelectedPlayer.integer >= 0 && cg_currentSelectedPlayer.integer < numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LTI4 $174
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
GEI4 $174
line 144
;144:		cg_currentSelectedPlayer.integer++;
ADDRLP4 0
ADDRGP4 cg_currentSelectedPlayer+12
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 145
;145:	} else {
ADDRGP4 $175
JUMPV
LABELV $174
line 146
;146:		cg_currentSelectedPlayer.integer = 0;
ADDRGP4 cg_currentSelectedPlayer+12
CNSTI4 0
ASGNI4
line 147
;147:	}
LABELV $175
line 148
;148:	CG_SetSelectedPlayerName();
ADDRGP4 CG_SetSelectedPlayerName
CALLV
pop
line 149
;149:}
LABELV $173
endproc CG_SelectNextPlayer 4 0
export CG_SelectPrevPlayer
proc CG_SelectPrevPlayer 4 0
line 151
;150:
;151:void CG_SelectPrevPlayer( void ) {
line 152
;152:	CG_CheckOrderPending();
ADDRGP4 CG_CheckOrderPending
CALLV
pop
line 153
;153:	if (cg_currentSelectedPlayer.integer > 0 && cg_currentSelectedPlayer.integer < numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LEI4 $181
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
GEI4 $181
line 154
;154:		cg_currentSelectedPlayer.integer--;
ADDRLP4 0
ADDRGP4 cg_currentSelectedPlayer+12
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 155
;155:	} else {
ADDRGP4 $182
JUMPV
LABELV $181
line 156
;156:		cg_currentSelectedPlayer.integer = numSortedTeamPlayers;
ADDRGP4 cg_currentSelectedPlayer+12
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
line 157
;157:	}
LABELV $182
line 158
;158:	CG_SetSelectedPlayerName();
ADDRGP4 CG_SetSelectedPlayerName
CALLV
pop
line 159
;159:}
LABELV $180
endproc CG_SelectPrevPlayer 4 0
proc CG_DrawPlayerArmorIcon 44 32
line 162
;160:
;161:
;162:static void CG_DrawPlayerArmorIcon( rectDef_t *rect, qboolean draw2D ) {
line 168
;163:	centity_t	*cent;
;164:	playerState_t	*ps;
;165:	vec3_t		angles;
;166:	vec3_t		origin;
;167:
;168:  if ( cg_drawStatus.integer == 0 ) {
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
NEI4 $188
line 169
;169:		return;
ADDRGP4 $187
JUMPV
LABELV $188
line 172
;170:	}
;171:
;172:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 12
CNSTI4 928
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 173
;173:	ps = &cg.snap->ps;
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 175
;174:
;175:	if ( draw2D || ( !cg_draw3dIcons.integer && cg_drawIcons.integer) ) { // bk001206 - parentheses
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $197
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $193
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $193
LABELV $197
line 176
;176:		CG_DrawPic( rect->x, rect->y + rect->h/2 + 1, rect->w, rect->h, cgs.media.armorIcon );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRGP4 cgs+956380+196
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 177
;177:  } else if (cg_draw3dIcons.integer) {
ADDRGP4 $194
JUMPV
LABELV $193
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $200
line 178
;178:	  VectorClear( angles );
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ASGNF4
line 179
;179:    origin[0] = 90;
ADDRLP4 20
CNSTF4 1119092736
ASGNF4
line 180
;180:  	origin[1] = 0;
ADDRLP4 20+4
CNSTF4 0
ASGNF4
line 181
;181:  	origin[2] = -10;
ADDRLP4 20+8
CNSTF4 3240099840
ASGNF4
line 182
;182:  	angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRLP4 0+4
CNSTI4 360
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 184
;183:  
;184:    CG_Draw3DModel( rect->x, rect->y, rect->w, rect->h, cgs.media.armorModel, 0, origin, angles );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+956380+192
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 185
;185:  }
LABELV $200
LABELV $194
line 187
;186:
;187:}
LABELV $187
endproc CG_DrawPlayerArmorIcon 44 32
proc CG_DrawPlayerArmorValue 36 32
line 189
;188:
;189:static void CG_DrawPlayerArmorValue(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 195
;190:	char	num[16];
;191:  int value;
;192:	centity_t	*cent;
;193:	playerState_t	*ps;
;194:
;195:  cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 24
CNSTI4 928
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 196
;196:	ps = &cg.snap->ps;
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 198
;197:
;198:	value = ps->stats[STAT_ARMOR];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 201
;199:  
;200:
;201:	if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $214
line 202
;202:    trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 203
;203:		CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 204
;204:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 205
;205:	} else {
ADDRGP4 $215
JUMPV
LABELV $214
line 206
;206:		Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $216
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 207
;207:		value = CG_Text_Width(num, scale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 208
;208:	  CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 209
;209:	}
LABELV $215
line 210
;210:}
LABELV $211
endproc CG_DrawPlayerArmorValue 36 32
proc CG_DrawPlayerAmmoIcon 56 32
line 222
;211:
;212:#ifndef MISSIONPACK // bk001206 
;213:static float healthColors[4][4] = { 
;214://		{ 0.2, 1.0, 0.2, 1.0 } , { 1.0, 0.2, 0.2, 1.0 }, {0.5, 0.5, 0.5, 1} };
;215:  // bk0101016 - float const
;216:  { 1.0f, 0.69f, 0.0f, 1.0f } ,		// normal
;217:  { 1.0f, 0.2f, 0.2f, 1.0f },		// low health
;218:  { 0.5f, 0.5f, 0.5f, 1.0f},		// weapon firing
;219:  { 1.0f, 1.0f, 1.0f, 1.0f } };		// health > 100
;220:#endif
;221:
;222:static void CG_DrawPlayerAmmoIcon( rectDef_t *rect, qboolean draw2D ) {
line 228
;223:	centity_t	*cent;
;224:	playerState_t	*ps;
;225:	vec3_t		angles;
;226:	vec3_t		origin;
;227:
;228:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 0
CNSTI4 928
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 229
;229:	ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 231
;230:
;231:	if ( draw2D || (!cg_draw3dIcons.integer && cg_drawIcons.integer) ) { // bk001206 - parentheses
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $224
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $220
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $220
LABELV $224
line 233
;232:	  qhandle_t	icon;
;233:    icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
ADDRLP4 36
CNSTI4 136
ADDRGP4 cg+1868928+144
INDIRI4
MULI4
ADDRGP4 cg_weapons+72
ADDP4
INDIRI4
ASGNI4
line 234
;234:		if ( icon ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $221
line 235
;235:		  CG_DrawPic( rect->x, rect->y, rect->w, rect->h, icon );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 236
;236:		}
line 237
;237:  } else if (cg_draw3dIcons.integer) {
ADDRGP4 $221
JUMPV
LABELV $220
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $230
line 238
;238:  	if ( cent->currentState.weapon && cg_weapons[ cent->currentState.weapon ].ammoModel ) {
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $233
CNSTI4 136
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $233
line 239
;239:	    VectorClear( angles );
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 8+8
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 44
INDIRF4
ASGNF4
line 240
;240:	  	origin[0] = 70;
ADDRLP4 20
CNSTF4 1116471296
ASGNF4
line 241
;241:  		origin[1] = 0;
ADDRLP4 20+4
CNSTF4 0
ASGNF4
line 242
;242:  		origin[2] = 0;
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 243
;243:  		angles[YAW] = 90 + 20 * sin( cg.time / 1000.0 );
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 48
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8+4
CNSTF4 1101004800
ADDRLP4 48
INDIRF4
MULF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 244
;244:  		CG_Draw3DModel( rect->x, rect->y, rect->w, rect->h, cg_weapons[ cent->currentState.weapon ].ammoModel, 0, origin, angles );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 136
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 20
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 245
;245:  	}
LABELV $233
line 246
;246:  }
LABELV $230
LABELV $221
line 247
;247:}
LABELV $217
endproc CG_DrawPlayerAmmoIcon 56 32
proc CG_DrawPlayerAmmoValue 36 32
line 249
;248:
;249:static void CG_DrawPlayerAmmoValue(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 255
;250:	char	num[16];
;251:	int value;
;252:	centity_t	*cent;
;253:	playerState_t	*ps;
;254:
;255:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 0
CNSTI4 928
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 256
;256:	ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 258
;257:
;258:	if ( cent->currentState.weapon ) {
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $246
line 259
;259:		value = ps->ammo[cent->currentState.weapon];
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
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
line 260
;260:		if ( value > -1 ) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
LEI4 $248
line 261
;261:			if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $250
line 262
;262:		    trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 263
;263:				CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 264
;264:			  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 265
;265:			} else {
ADDRGP4 $251
JUMPV
LABELV $250
line 266
;266:				Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $216
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 267
;267:				value = CG_Text_Width(num, scale, 0);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 268
;268:				CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 269
;269:			}
LABELV $251
line 270
;270:		}
LABELV $248
line 271
;271:	}
LABELV $246
line 273
;272:
;273:}
LABELV $243
endproc CG_DrawPlayerAmmoValue 36 32
proc CG_DrawPlayerHead 60 24
line 277
;274:
;275:
;276:
;277:static void CG_DrawPlayerHead(rectDef_t *rect, qboolean draw2D) {
line 281
;278:	vec3_t		angles;
;279:	float		size, stretch;
;280:	float		frac;
;281:	float		x = rect->x;
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 283
;282:
;283:	VectorClear( angles );
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
line 285
;284:
;285:	if ( cg.damageTime && cg.time - cg.damageTime < DAMAGE_TIME ) {
ADDRGP4 cg+1952976
INDIRF4
CNSTF4 0
EQF4 $255
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
ADDRGP4 cg+1952976
INDIRF4
SUBF4
CNSTF4 1140457472
GEF4 $255
line 286
;286:		frac = (float)(cg.time - cg.damageTime ) / DAMAGE_TIME;
ADDRLP4 0
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
ADDRGP4 cg+1952976
INDIRF4
SUBF4
CNSTF4 1140457472
DIVF4
ASGNF4
line 287
;287:		size = rect->w * 1.25 * ( 1.5 - frac * 0.5 );
ADDRLP4 20
CNSTF4 1067450368
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
CNSTF4 1069547520
CNSTF4 1056964608
ADDRLP4 0
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 289
;288:
;289:		stretch = size - rect->w * 1.25;
ADDRLP4 24
ADDRLP4 20
INDIRF4
CNSTF4 1067450368
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 291
;290:		// kick in the direction of damage
;291:		x -= stretch * 0.5 + cg.damageX * stretch * 0.5;
ADDRLP4 32
CNSTF4 1056964608
ASGNF4
ADDRLP4 36
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+1952980
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
MULF4
ADDF4
SUBF4
ASGNF4
line 293
;292:
;293:		cg.headStartYaw = 180 + cg.damageX * 45;
ADDRGP4 cg+1953012
CNSTF4 1110704128
ADDRGP4 cg+1952980
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 295
;294:
;295:		cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 40
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
ARGF4
ADDRLP4 44
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+1953000
CNSTF4 1101004800
ADDRLP4 44
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 296
;296:		cg.headEndPitch = 5 * cos( crandom()*M_PI );
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 48
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
ARGF4
ADDRLP4 52
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+1952996
CNSTF4 1084227584
ADDRLP4 52
INDIRF4
MULF4
ASGNF4
line 298
;297:
;298:		cg.headStartTime = cg.time;
ADDRGP4 cg+1953016
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 299
;299:		cg.headEndTime = cg.time + 100 + random() * 2000;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+1953004
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
CNSTF4 1157234688
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 300
;300:	} else {
ADDRGP4 $256
JUMPV
LABELV $255
line 301
;301:		if ( cg.time >= cg.headEndTime ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1953004
INDIRI4
LTI4 $271
line 303
;302:			// select a new head angle
;303:			cg.headStartYaw = cg.headEndYaw;
ADDRGP4 cg+1953012
ADDRGP4 cg+1953000
INDIRF4
ASGNF4
line 304
;304:			cg.headStartPitch = cg.headEndPitch;
ADDRGP4 cg+1953008
ADDRGP4 cg+1952996
INDIRF4
ASGNF4
line 305
;305:			cg.headStartTime = cg.headEndTime;
ADDRGP4 cg+1953016
ADDRGP4 cg+1953004
INDIRI4
ASGNI4
line 306
;306:			cg.headEndTime = cg.time + 100 + random() * 2000;
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+1953004
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
CNSTF4 1157234688
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 308
;307:
;308:			cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
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
ARGF4
ADDRLP4 40
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+1953000
CNSTF4 1101004800
ADDRLP4 40
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 309
;309:			cg.headEndPitch = 5 * cos( crandom()*M_PI );
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
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
ARGF4
ADDRLP4 48
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+1952996
CNSTF4 1084227584
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 310
;310:		}
LABELV $271
line 312
;311:
;312:		size = rect->w * 1.25;
ADDRLP4 20
CNSTF4 1067450368
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 313
;313:	}
LABELV $256
line 316
;314:
;315:	// if the server was frozen for a while we may have a bad head start time
;316:	if ( cg.headStartTime > cg.time ) {
ADDRGP4 cg+1953016
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
LEI4 $285
line 317
;317:		cg.headStartTime = cg.time;
ADDRGP4 cg+1953016
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 318
;318:	}
LABELV $285
line 320
;319:
;320:	frac = ( cg.time - cg.headStartTime ) / (float)( cg.headEndTime - cg.headStartTime );
ADDRLP4 0
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1953016
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg+1953004
INDIRI4
ADDRGP4 cg+1953016
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 321
;321:	frac = frac * frac * ( 3 - 2 * frac );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1077936128
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 322
;322:	angles[YAW] = cg.headStartYaw + ( cg.headEndYaw - cg.headStartYaw ) * frac;
ADDRLP4 4+4
ADDRGP4 cg+1953012
INDIRF4
ADDRGP4 cg+1953000
INDIRF4
ADDRGP4 cg+1953012
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 323
;323:	angles[PITCH] = cg.headStartPitch + ( cg.headEndPitch - cg.headStartPitch ) * frac;
ADDRLP4 4
ADDRGP4 cg+1953008
INDIRF4
ADDRGP4 cg+1952996
INDIRF4
ADDRGP4 cg+1953008
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 325
;324:
;325:	CG_DrawHead( x, rect->y, rect->w, rect->h, cg.snap->ps.clientNum, angles );
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 326
;326:}
LABELV $252
endproc CG_DrawPlayerHead 60 24
proc CG_DrawSelectedPlayerHealth 36 32
line 328
;327:
;328:static void CG_DrawSelectedPlayerHealth( rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 333
;329:	clientInfo_t *ci;
;330:	int value;
;331:	char num[16];
;332:
;333:  ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 24
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 1944
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 334
;334:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $305
line 335
;335:		if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $307
line 336
;336:			trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 337
;337:			CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 338
;338:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 339
;339:		} else {
ADDRGP4 $308
JUMPV
LABELV $307
line 340
;340:			Com_sprintf (num, sizeof(num), "%i", ci->health);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $216
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 341
;341:		  value = CG_Text_Width(num, scale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 342
;342:		  CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 343
;343:		}
LABELV $308
line 344
;344:	}
LABELV $305
line 345
;345:}
LABELV $303
endproc CG_DrawSelectedPlayerHealth 36 32
proc CG_DrawSelectedPlayerArmor 36 32
line 347
;346:
;347:static void CG_DrawSelectedPlayerArmor( rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 351
;348:	clientInfo_t *ci;
;349:	int value;
;350:	char num[16];
;351:  ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 24
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 1944
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 352
;352:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $311
line 353
;353:    if (ci->armor > 0) {
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
LEI4 $313
line 354
;354:			if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $315
line 355
;355:				trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 356
;356:				CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 357
;357:				trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 358
;358:			} else {
ADDRGP4 $316
JUMPV
LABELV $315
line 359
;359:				Com_sprintf (num, sizeof(num), "%i", ci->armor);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $216
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 360
;360:				value = CG_Text_Width(num, scale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 361
;361:				CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 362
;362:			}
LABELV $316
line 363
;363:		}
LABELV $313
line 364
;364: 	}
LABELV $311
line 365
;365:}
LABELV $309
endproc CG_DrawSelectedPlayerArmor 36 32
export CG_StatusHandle
proc CG_StatusHandle 8 0
line 367
;366:
;367:qhandle_t CG_StatusHandle(int task) {
line 368
;368:	qhandle_t h = cgs.media.assaultShader;
ADDRLP4 0
ADDRGP4 cgs+956380+2440
INDIRI4
ASGNI4
line 369
;369:	switch (task) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $320
ADDRLP4 4
INDIRI4
CNSTI4 7
GTI4 $320
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $345-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $345
address $322
address $325
address $328
address $331
address $337
address $340
address $334
code
LABELV $322
line 371
;370:		case TEAMTASK_OFFENSE :
;371:			h = cgs.media.assaultShader;
ADDRLP4 0
ADDRGP4 cgs+956380+2440
INDIRI4
ASGNI4
line 372
;372:			break;
ADDRGP4 $321
JUMPV
LABELV $325
line 374
;373:		case TEAMTASK_DEFENSE :
;374:			h = cgs.media.defendShader;
ADDRLP4 0
ADDRGP4 cgs+956380+2452
INDIRI4
ASGNI4
line 375
;375:			break;
ADDRGP4 $321
JUMPV
LABELV $328
line 377
;376:		case TEAMTASK_PATROL :
;377:			h = cgs.media.patrolShader;
ADDRLP4 0
ADDRGP4 cgs+956380+2436
INDIRI4
ASGNI4
line 378
;378:			break;
ADDRGP4 $321
JUMPV
LABELV $331
line 380
;379:		case TEAMTASK_FOLLOW :
;380:			h = cgs.media.followShader;
ADDRLP4 0
ADDRGP4 cgs+956380+2448
INDIRI4
ASGNI4
line 381
;381:			break;
ADDRGP4 $321
JUMPV
LABELV $334
line 383
;382:		case TEAMTASK_CAMP :
;383:			h = cgs.media.campShader;
ADDRLP4 0
ADDRGP4 cgs+956380+2444
INDIRI4
ASGNI4
line 384
;384:			break;
ADDRGP4 $321
JUMPV
LABELV $337
line 386
;385:		case TEAMTASK_RETRIEVE :
;386:			h = cgs.media.retrieveShader; 
ADDRLP4 0
ADDRGP4 cgs+956380+2460
INDIRI4
ASGNI4
line 387
;387:			break;
ADDRGP4 $321
JUMPV
LABELV $340
line 389
;388:		case TEAMTASK_ESCORT :
;389:			h = cgs.media.escortShader; 
ADDRLP4 0
ADDRGP4 cgs+956380+2464
INDIRI4
ASGNI4
line 390
;390:			break;
ADDRGP4 $321
JUMPV
LABELV $320
line 392
;391:		default : 
;392:			h = cgs.media.assaultShader;
ADDRLP4 0
ADDRGP4 cgs+956380+2440
INDIRI4
ASGNI4
line 393
;393:			break;
LABELV $321
line 395
;394:	}
;395:	return h;
ADDRLP4 0
INDIRI4
RETI4
LABELV $317
endproc CG_StatusHandle 8 0
proc CG_DrawSelectedPlayerStatus 16 20
line 398
;396:}
;397:
;398:static void CG_DrawSelectedPlayerStatus( rectDef_t *rect ) {
line 399
;399:	clientInfo_t *ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 4
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 1944
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 400
;400:	if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $349
line 402
;401:		qhandle_t h;
;402:                if(ci->isDead)
ADDRLP4 0
INDIRP4
CNSTI4 1924
ADDP4
INDIRI4
CNSTI4 0
EQI4 $351
line 403
;403:                    return;
ADDRGP4 $347
JUMPV
LABELV $351
line 404
;404:		if (cgs.orderPending) {
ADDRGP4 cgs+956324
INDIRI4
CNSTI4 0
EQI4 $353
line 406
;405:			// blink the icon
;406:			if ( cg.time > cgs.orderTime - 2500 && (cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cgs+956328
INDIRI4
CNSTI4 2500
SUBI4
LEI4 $356
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $356
line 407
;407:				return;
ADDRGP4 $347
JUMPV
LABELV $356
line 409
;408:			}
;409:			h = CG_StatusHandle(cgs.currentOrder);
ADDRGP4 cgs+956320
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 410
;410:		}	else {
ADDRGP4 $354
JUMPV
LABELV $353
line 411
;411:			h = CG_StatusHandle(ci->teamTask);
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 412
;412:		}
LABELV $354
line 413
;413:		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, h );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 414
;414:	}
LABELV $349
line 415
;415:}
LABELV $347
endproc CG_DrawSelectedPlayerStatus 16 20
proc CG_DrawPlayerStatus 16 20
line 418
;416:
;417:
;418:static void CG_DrawPlayerStatus( rectDef_t *rect ) {
line 419
;419:	clientInfo_t *ci = &cgs.clientinfo[cg.snap->ps.clientNum];
ADDRLP4 0
CNSTI4 1944
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 420
;420:	if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $365
line 421
;421:		qhandle_t h = CG_StatusHandle(ci->teamTask);
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 422
;422:                if(ci->isDead)
ADDRLP4 0
INDIRP4
CNSTI4 1924
ADDP4
INDIRI4
CNSTI4 0
EQI4 $367
line 423
;423:                    h = cgs.media.deathShader;
ADDRLP4 4
ADDRGP4 cgs+956380+2468
INDIRI4
ASGNI4
LABELV $367
line 424
;424:		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, h);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 425
;425:	}
LABELV $365
line 426
;426:}
LABELV $362
endproc CG_DrawPlayerStatus 16 20
proc CG_DrawSelectedPlayerName 20 32
line 429
;427:
;428:
;429:static void CG_DrawSelectedPlayerName( rectDef_t *rect, float scale, vec4_t color, qboolean voice, int textStyle) {
line 431
;430:	clientInfo_t *ci;
;431:  ci = cgs.clientinfo + ((voice) ? cgs.currentVoiceClient : sortedTeamPlayers[CG_GetSelectedPlayer()]);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $375
ADDRLP4 4
ADDRGP4 cgs+956332
INDIRI4
ASGNI4
ADDRGP4 $376
JUMPV
LABELV $375
ADDRLP4 8
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ASGNI4
LABELV $376
ADDRLP4 0
CNSTI4 1944
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 432
;432:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $377
line 433
;433:    CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, ci->name, 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 434
;434:  }
LABELV $377
line 435
;435:}
LABELV $371
endproc CG_DrawSelectedPlayerName 20 32
proc CG_DrawSelectedPlayerLocation 24 32
line 437
;436:
;437:static void CG_DrawSelectedPlayerLocation( rectDef_t *rect, float scale, vec4_t color, int textStyle ) {
line 439
;438:	clientInfo_t *ci;
;439:  ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 4
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 1944
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 440
;440:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $381
line 441
;441:		const char *p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 8480
ADDI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 442
;442:		if (!p || !*p) {
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $385
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $383
LABELV $385
line 443
;443:			p = "unknown";
ADDRLP4 8
ADDRGP4 $386
ASGNP4
line 444
;444:		}
LABELV $383
line 445
;445:    CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, p, 0, 0, textStyle);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 446
;446:  }
LABELV $381
line 447
;447:}
LABELV $379
endproc CG_DrawSelectedPlayerLocation 24 32
proc CG_DrawPlayerLocation 20 32
line 449
;448:
;449:static void CG_DrawPlayerLocation( rectDef_t *rect, float scale, vec4_t color, int textStyle  ) {
line 450
;450:	clientInfo_t *ci = &cgs.clientinfo[cg.snap->ps.clientNum];
ADDRLP4 0
CNSTI4 1944
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 451
;451:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $390
line 452
;452:		const char *p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 8480
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 453
;453:		if (!p || !*p) {
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $394
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $392
LABELV $394
line 454
;454:			p = "unknown";
ADDRLP4 4
ADDRGP4 $386
ASGNP4
line 455
;455:		}
LABELV $392
line 456
;456:    CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, p, 0, 0, textStyle);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 457
;457:  }
LABELV $390
line 458
;458:}
LABELV $387
endproc CG_DrawPlayerLocation 20 32
proc CG_DrawSelectedPlayerWeapon 12 20
line 462
;459:
;460:
;461:
;462:static void CG_DrawSelectedPlayerWeapon( rectDef_t *rect ) {
line 465
;463:	clientInfo_t *ci;
;464:
;465:  ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 4
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 1944
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 466
;466:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $397
line 467
;467:	  if ( cg_weapons[ci->curWeapon].weaponIcon ) {
CNSTI4 136
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $399
line 468
;468:	    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cg_weapons[ci->curWeapon].weaponIcon );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 136
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 469
;469:		} else {
ADDRGP4 $400
JUMPV
LABELV $399
line 470
;470:  	  CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.deferShader);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+956380+204
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 471
;471:    }
LABELV $400
line 472
;472:  }
LABELV $397
line 473
;473:}
LABELV $395
endproc CG_DrawSelectedPlayerWeapon 12 20
proc CG_DrawPlayerScore 28 32
line 475
;474:
;475:static void CG_DrawPlayerScore( rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 477
;476:  char num[16];
;477:  int value = cg.snap->ps.persistant[PERS_SCORE];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
line 479
;478:
;479:	if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $407
line 480
;480:		trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 481
;481:		CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 482
;482:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 483
;483:	} else {
ADDRGP4 $408
JUMPV
LABELV $407
line 484
;484:		Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $216
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 485
;485:		value = CG_Text_Width(num, scale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 486
;486:	  CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 487
;487:	}
LABELV $408
line 488
;488:}
LABELV $405
endproc CG_DrawPlayerScore 28 32
proc CG_DrawPlayerItem 36 32
line 490
;489:
;490:static void CG_DrawPlayerItem( rectDef_t *rect, float scale, qboolean draw2D) {
line 494
;491:	int		value;
;492:  vec3_t origin, angles;
;493:
;494:	value = cg.snap->ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
line 495
;495:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $411
line 496
;496:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 498
;497:
;498:		if (qtrue) {
line 499
;499:		  CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 500
;500:		  CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cg_items[ value ].icon );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 501
;501:		} else {
ADDRGP4 $414
JUMPV
LABELV $413
line 502
;502: 			VectorClear( angles );
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
line 503
;503:			origin[0] = 90;
ADDRLP4 16
CNSTF4 1119092736
ASGNF4
line 504
;504:  		origin[1] = 0;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 505
;505:   		origin[2] = -10;
ADDRLP4 16+8
CNSTF4 3240099840
ASGNF4
line 506
;506:  		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRLP4 4+4
CNSTI4 360
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 507
;507:			CG_Draw3DModel(rect->x, rect->y, rect->w, rect->h, cg_items[ value ].models[0], 0, origin, angles );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_items+4
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 508
;508:		}
LABELV $414
line 509
;509:	}
LABELV $411
line 511
;510:
;511:}
LABELV $409
endproc CG_DrawPlayerItem 36 32
proc CG_DrawSelectedPlayerPowerup 36 20
line 514
;512:
;513:
;514:static void CG_DrawSelectedPlayerPowerup( rectDef_t *rect, qboolean draw2D ) {
line 519
;515:	clientInfo_t *ci;
;516:  int j;
;517:  float x, y;
;518:
;519:  ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 16
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 4
CNSTI4 1944
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 520
;520:  if (ci) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $425
line 521
;521:    x = rect->x;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 522
;522:    y = rect->y;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 524
;523:
;524:		for (j = 0; j < PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $427
line 525
;525:			if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $431
line 527
;526:				gitem_t	*item;
;527:				item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
ASGNP4
line 528
;528:				if (item) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $433
line 529
;529:				  CG_DrawPic( x, y, rect->w, rect->h, trap_R_RegisterShader( item->icon ) );
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 530
;530:					x += 3;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1077936128
ADDF4
ASGNF4
line 531
;531:					y += 3;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1077936128
ADDF4
ASGNF4
line 532
;532:          return;
ADDRGP4 $423
JUMPV
LABELV $433
line 534
;533:				}
;534:			}
LABELV $431
line 535
;535:		}
LABELV $428
line 524
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $427
line 537
;536:
;537:  }
LABELV $425
line 538
;538:}
LABELV $423
endproc CG_DrawSelectedPlayerPowerup 36 20
proc CG_DrawSelectedPlayerHead 80 32
line 541
;539:
;540:
;541:static void CG_DrawSelectedPlayerHead( rectDef_t *rect, qboolean draw2D, qboolean voice ) {
line 549
;542:	clipHandle_t	cm;
;543:	clientInfo_t	*ci;
;544:	float			len;
;545:	vec3_t			origin;
;546:	vec3_t			mins, maxs, angles;
;547:
;548:
;549:  ci = cgs.clientinfo + ((voice) ? cgs.currentVoiceClient : sortedTeamPlayers[CG_GetSelectedPlayer()]);
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $439
ADDRLP4 60
ADDRGP4 cgs+956332
INDIRI4
ASGNI4
ADDRGP4 $440
JUMPV
LABELV $439
ADDRLP4 64
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ASGNI4
LABELV $440
ADDRLP4 0
CNSTI4 1944
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 551
;550:
;551:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $441
line 552
;552:  	if ( cg_draw3dIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $443
line 553
;553:	  	cm = ci->headModel;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ASGNI4
line 554
;554:  		if ( !cm ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $446
line 555
;555:  			return;
ADDRGP4 $435
JUMPV
LABELV $446
line 559
;556:	  	}
;557:
;558:  		// offset the origin y and z to center the head
;559:  		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 561
;560:
;561:	  	origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 4+8
CNSTF4 3204448256
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 562
;562:  		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 4+4
CNSTF4 1056964608
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 566
;563:
;564:	  	// calculate distance so the head nearly fills the box
;565:  		// assume heads are taller than wide
;566:  		len = 0.7 * ( maxs[2] - mins[2] );		
ADDRLP4 56
CNSTF4 1060320051
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 567
;567:  		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 4
ADDRLP4 56
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 570
;568:
;569:  		// allow per-model tweaking
;570:  		VectorAdd( origin, ci->headOffset, origin );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRF4
ADDF4
ASGNF4
line 572
;571:
;572:    	angles[PITCH] = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 573
;573:    	angles[YAW] = 180;
ADDRLP4 40+4
CNSTF4 1127481344
ASGNF4
line 574
;574:    	angles[ROLL] = 0;
ADDRLP4 40+8
CNSTF4 0
ASGNF4
line 576
;575:  	
;576:      CG_Draw3DModel( rect->x, rect->y, rect->w, rect->h, ci->headModel, ci->headSkin, origin, angles );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRF4
ARGF4
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 72
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 72
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 577
;577:  	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $444
JUMPV
LABELV $443
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $462
line 578
;578:	  	CG_DrawPic( rect->x, rect->y, rect->w, rect->h, ci->modelIcon );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 579
;579:  	}
LABELV $462
LABELV $444
line 582
;580:
;581:  	// if they are deferred, draw a cross out
;582:  	if ( ci->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
EQI4 $465
line 583
;583:  		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.deferShader );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+956380+204
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 584
;584:  	}
LABELV $465
line 585
;585:  }
LABELV $441
line 587
;586:
;587:}
LABELV $435
endproc CG_DrawSelectedPlayerHead 80 32
proc CG_DrawPlayerHealth 32 32
line 590
;588:
;589:
;590:static void CG_DrawPlayerHealth(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 595
;591:	playerState_t	*ps;
;592:  int value;
;593:	char	num[16];
;594:
;595:	ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 597
;596:
;597:	value = ps->stats[STAT_HEALTH];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 599
;598:
;599:	if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $471
line 600
;600:		trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 601
;601:		CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 602
;602:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 603
;603:	} else {
ADDRGP4 $472
JUMPV
LABELV $471
line 604
;604:		Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $216
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 605
;605:	  value = CG_Text_Width(num, scale, 0);
ADDRLP4 8
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 606
;606:	  CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 607
;607:	}
LABELV $472
line 608
;608:}
LABELV $469
endproc CG_DrawPlayerHealth 32 32
proc CG_DrawRedScore 28 32
line 611
;609:
;610:
;611:static void CG_DrawRedScore(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 614
;612:	int value;
;613:	char num[16];
;614:	if ( cgs.scores1 == SCORE_NOT_PRESENT ) {
ADDRGP4 cgs+342616
INDIRI4
CNSTI4 -9999
NEI4 $474
line 615
;615:		Com_sprintf (num, sizeof(num), "-");
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $477
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 616
;616:	}
ADDRGP4 $475
JUMPV
LABELV $474
line 617
;617:	else {
line 618
;618:		Com_sprintf (num, sizeof(num), "%i", cgs.scores1);
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $216
ARGP4
ADDRGP4 cgs+342616
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 619
;619:	}
LABELV $475
line 620
;620:	value = CG_Text_Width(num, scale, 0);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 621
;621:	CG_Text_Paint(rect->x + rect->w - value, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 622
;622:}
LABELV $473
endproc CG_DrawRedScore 28 32
proc CG_DrawBlueScore 28 32
line 624
;623:
;624:static void CG_DrawBlueScore(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 628
;625:	int value;
;626:	char num[16];
;627:
;628:	if ( cgs.scores2 == SCORE_NOT_PRESENT ) {
ADDRGP4 cgs+342620
INDIRI4
CNSTI4 -9999
NEI4 $480
line 629
;629:		Com_sprintf (num, sizeof(num), "-");
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $477
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 630
;630:	}
ADDRGP4 $481
JUMPV
LABELV $480
line 631
;631:	else {
line 632
;632:		Com_sprintf (num, sizeof(num), "%i", cgs.scores2);
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $216
ARGP4
ADDRGP4 cgs+342620
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 633
;633:	}
LABELV $481
line 634
;634:	value = CG_Text_Width(num, scale, 0);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 635
;635:	CG_Text_Paint(rect->x + rect->w - value, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 636
;636:}
LABELV $479
endproc CG_DrawBlueScore 28 32
proc CG_DrawRedName 4 32
line 639
;637:
;638:// FIXME: team name support
;639:static void CG_DrawRedName(rectDef_t *rect, float scale, vec4_t color, int textStyle ) {
line 640
;640:  CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, cg_redTeamName.string , 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 cg_redTeamName+16
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 641
;641:}
LABELV $484
endproc CG_DrawRedName 4 32
proc CG_DrawBlueName 4 32
line 643
;642:
;643:static void CG_DrawBlueName(rectDef_t *rect, float scale, vec4_t color, int textStyle ) {
line 644
;644:  CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, cg_blueTeamName.string, 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 cg_blueTeamName+16
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 645
;645:}
LABELV $486
endproc CG_DrawBlueName 4 32
proc CG_DrawBlueFlagName 16 32
line 647
;646:
;647:static void CG_DrawBlueFlagName(rectDef_t *rect, float scale, vec4_t color, int textStyle ) {
line 649
;648:  int i;
;649:  for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $492
JUMPV
LABELV $489
line 650
;650:	  if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_RED  && cgs.clientinfo[i].powerups & ( 1<< PW_BLUEFLAG )) {
ADDRLP4 4
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $494
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $494
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948+208
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $494
line 651
;651:      CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, cgs.clientinfo[i].name, 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+440948+4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 652
;652:      return;
ADDRGP4 $488
JUMPV
LABELV $494
line 654
;653:    }
;654:  }
LABELV $490
line 649
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $492
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $489
line 655
;655:}
LABELV $488
endproc CG_DrawBlueFlagName 16 32
lit
align 4
LABELV $512
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $519
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
code
proc CG_DrawBlueFlagStatus 28 20
line 657
;656:
;657:static void CG_DrawBlueFlagStatus(rectDef_t *rect, qhandle_t shader) {
line 658
;658:	if (cgs.gametype != GT_CTF && cgs.gametype != GT_CTF_ELIMINATION && cgs.gametype != GT_1FCTF) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $504
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $504
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
EQI4 $504
line 659
;659:		if (cgs.gametype == GT_HARVESTER) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
NEI4 $503
line 660
;660:		  vec4_t color = {0, 0, 1, 1};
ADDRLP4 0
ADDRGP4 $512
INDIRB
ASGNB 16
line 661
;661:		  trap_R_SetColor(color);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 662
;662:	    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.blueCubeIcon );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+956380+40
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 663
;663:		  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 664
;664:		}
line 665
;665:		return;
ADDRGP4 $503
JUMPV
LABELV $504
line 667
;666:	}
;667:  if (shader) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $515
line 668
;668:		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, shader );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 669
;669:  } else {
ADDRGP4 $516
JUMPV
LABELV $515
line 670
;670:	  gitem_t *item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 671
;671:    if (item) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $517
line 672
;672:		  vec4_t color = {0, 0, 1, 1};
ADDRLP4 8
ADDRGP4 $519
INDIRB
ASGNB 16
line 673
;673:		  trap_R_SetColor(color);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 674
;674:	    if( cgs.blueflag >= 0 && cgs.blueflag <= 2 ) {
ADDRGP4 cgs+342628
INDIRI4
CNSTI4 0
LTI4 $520
ADDRGP4 cgs+342628
INDIRI4
CNSTI4 2
GTI4 $520
line 675
;675:		    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.flagShaders[cgs.blueflag] );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+342628
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+2472
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 676
;676:			} else {
ADDRGP4 $521
JUMPV
LABELV $520
line 677
;677:		    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.flagShaders[0] );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+956380+2472
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 678
;678:			}
LABELV $521
line 679
;679:		  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 680
;680:	  }
LABELV $517
line 681
;681:  }
LABELV $516
line 682
;682:}
LABELV $503
endproc CG_DrawBlueFlagStatus 28 20
proc CG_DrawBlueFlagHead 36 24
line 684
;683:
;684:static void CG_DrawBlueFlagHead(rectDef_t *rect) {
line 686
;685:  int i;
;686:  for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $533
JUMPV
LABELV $530
line 687
;687:	  if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_RED  && cgs.clientinfo[i].powerups & ( 1<< PW_BLUEFLAG )) {
ADDRLP4 4
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $535
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $535
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948+208
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $535
line 689
;688:      vec3_t angles;
;689:      VectorClear( angles );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 690
;690: 		  angles[YAW] = 180 + 20 * sin( cg.time / 650.0 );;
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
CNSTF4 1143111680
DIVF4
ARGF4
ADDRLP4 28
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 12+4
CNSTF4 1101004800
ADDRLP4 28
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 691
;691:      CG_DrawHead( rect->x, rect->y, rect->w, rect->h, 0,angles );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 692
;692:      return;
ADDRGP4 $529
JUMPV
LABELV $535
line 694
;693:    }
;694:  }
LABELV $531
line 686
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $533
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $530
line 695
;695:}
LABELV $529
endproc CG_DrawBlueFlagHead 36 24
proc CG_DrawRedFlagName 16 32
line 697
;696:
;697:static void CG_DrawRedFlagName(rectDef_t *rect, float scale, vec4_t color, int textStyle ) {
line 699
;698:  int i;
;699:  for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $550
JUMPV
LABELV $547
line 700
;700:	  if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_BLUE  && cgs.clientinfo[i].powerups & ( 1<< PW_REDFLAG )) {
ADDRLP4 4
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $552
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $552
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948+208
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $552
line 701
;701:      CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, cgs.clientinfo[i].name, 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+440948+4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 702
;702:      return;
ADDRGP4 $546
JUMPV
LABELV $552
line 704
;703:    }
;704:  }
LABELV $548
line 699
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $550
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $547
line 705
;705:}
LABELV $546
endproc CG_DrawRedFlagName 16 32
lit
align 4
LABELV $570
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $577
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
code
proc CG_DrawRedFlagStatus 28 20
line 707
;706:
;707:static void CG_DrawRedFlagStatus(rectDef_t *rect, qhandle_t shader) {
line 708
;708:	if (cgs.gametype != GT_CTF && cgs.gametype != GT_CTF_ELIMINATION && cgs.gametype != GT_1FCTF) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $562
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $562
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
EQI4 $562
line 709
;709:		if (cgs.gametype == GT_HARVESTER) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
NEI4 $561
line 710
;710:		  vec4_t color = {1, 0, 0, 1};
ADDRLP4 0
ADDRGP4 $570
INDIRB
ASGNB 16
line 711
;711:		  trap_R_SetColor(color);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 712
;712:	    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.redCubeIcon );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+956380+36
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 713
;713:		  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 714
;714:		}
line 715
;715:		return;
ADDRGP4 $561
JUMPV
LABELV $562
line 717
;716:	}
;717:  if (shader) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $573
line 718
;718:		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, shader );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 719
;719:  } else {
ADDRGP4 $574
JUMPV
LABELV $573
line 720
;720:	  gitem_t *item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 721
;721:    if (item) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $575
line 722
;722:		  vec4_t color = {1, 0, 0, 1};
ADDRLP4 8
ADDRGP4 $577
INDIRB
ASGNB 16
line 723
;723:		  trap_R_SetColor(color);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 724
;724:	    if( cgs.redflag >= 0 && cgs.redflag <= 2) {
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 0
LTI4 $578
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 2
GTI4 $578
line 725
;725:		    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.flagShaders[cgs.redflag] );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+2472
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 726
;726:			} else {
ADDRGP4 $579
JUMPV
LABELV $578
line 727
;727:		    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.flagShaders[0] );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+956380+2472
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 728
;728:			}
LABELV $579
line 729
;729:		  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 730
;730:	  }
LABELV $575
line 731
;731:  }
LABELV $574
line 732
;732:}
LABELV $561
endproc CG_DrawRedFlagStatus 28 20
proc CG_DrawRedFlagHead 36 24
line 734
;733:
;734:static void CG_DrawRedFlagHead(rectDef_t *rect) {
line 736
;735:  int i;
;736:  for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $591
JUMPV
LABELV $588
line 737
;737:	  if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_BLUE  && cgs.clientinfo[i].powerups & ( 1<< PW_REDFLAG )) {
ADDRLP4 4
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $593
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $593
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948+208
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $593
line 739
;738:      vec3_t angles;
;739:      VectorClear( angles );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 740
;740: 		  angles[YAW] = 180 + 20 * sin( cg.time / 650.0 );;
ADDRGP4 cg+1868892
INDIRI4
CVIF4 4
CNSTF4 1143111680
DIVF4
ARGF4
ADDRLP4 28
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 12+4
CNSTF4 1101004800
ADDRLP4 28
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 741
;741:      CG_DrawHead( rect->x, rect->y, rect->w, rect->h, 0,angles );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 742
;742:      return;
ADDRGP4 $587
JUMPV
LABELV $593
line 744
;743:    }
;744:  }
LABELV $589
line 736
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $591
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $588
line 745
;745:}
LABELV $587
endproc CG_DrawRedFlagHead 36 24
proc CG_HarvesterSkulls 72 32
line 747
;746:
;747:static void CG_HarvesterSkulls(rectDef_t *rect, float scale, vec4_t color, qboolean force2D, int textStyle ) {
line 751
;748:	char num[16];
;749:	vec3_t origin, angles;
;750:	qhandle_t handle;
;751:	int value = cg.snap->ps.generic1;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
line 753
;752:
;753:	if (cgs.gametype != GT_HARVESTER) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
EQI4 $606
line 754
;754:		return;
ADDRGP4 $604
JUMPV
LABELV $606
line 757
;755:	}
;756:
;757:	if( value > 99 ) {
ADDRLP4 0
INDIRI4
CNSTI4 99
LEI4 $609
line 758
;758:		value = 99;
ADDRLP4 0
CNSTI4 99
ASGNI4
line 759
;759:	}
LABELV $609
line 761
;760:
;761:	Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $216
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 762
;762:	value = CG_Text_Width(num, scale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 48
INDIRI4
ASGNI4
line 763
;763:	CG_Text_Paint(rect->x + (rect->w - value), rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
SUBF4
ADDF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 765
;764:
;765:	if (cg_drawIcons.integer) {
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $611
line 766
;766:		if (!force2D && cg_draw3dIcons.integer) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRFP4 12
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $614
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $614
line 767
;767:			VectorClear(angles);
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 20+8
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 60
INDIRF4
ASGNF4
line 768
;768:			origin[0] = 90;
ADDRLP4 32
CNSTF4 1119092736
ASGNF4
line 769
;769:			origin[1] = 0;
ADDRLP4 32+4
CNSTF4 0
ASGNF4
line 770
;770:			origin[2] = -10;
ADDRLP4 32+8
CNSTF4 3240099840
ASGNF4
line 771
;771:			angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRLP4 20+4
CNSTI4 360
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 772
;772:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $623
line 773
;773:				handle = cgs.media.redCubeModel;
ADDRLP4 44
ADDRGP4 cgs+956380+28
INDIRI4
ASGNI4
line 774
;774:			} else {
ADDRGP4 $624
JUMPV
LABELV $623
line 775
;775:				handle = cgs.media.blueCubeModel;
ADDRLP4 44
ADDRGP4 cgs+956380+32
INDIRI4
ASGNI4
line 776
;776:			}
LABELV $624
line 777
;777:			CG_Draw3DModel( rect->x, rect->y, 35, 35, handle, 0, origin, angles );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
CNSTF4 1108082688
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 778
;778:		} else {
ADDRGP4 $615
JUMPV
LABELV $614
line 779
;779:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $630
line 780
;780:				handle = cgs.media.redCubeIcon;
ADDRLP4 44
ADDRGP4 cgs+956380+36
INDIRI4
ASGNI4
line 781
;781:			} else {
ADDRGP4 $631
JUMPV
LABELV $630
line 782
;782:				handle = cgs.media.blueCubeIcon;
ADDRLP4 44
ADDRGP4 cgs+956380+40
INDIRI4
ASGNI4
line 783
;783:			}
LABELV $631
line 784
;784:			CG_DrawPic( rect->x + 3, rect->y + 16, 20, 20, handle );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTF4 1077936128
ADDF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
ARGF4
ADDRLP4 64
CNSTF4 1101004800
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 785
;785:		}
LABELV $615
line 786
;786:	}
LABELV $611
line 787
;787:}
LABELV $604
endproc CG_HarvesterSkulls 72 32
lit
align 4
LABELV $647
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
code
proc CG_OneFlagStatus 32 20
line 789
;788:
;789:static void CG_OneFlagStatus(rectDef_t *rect) {
line 790
;790:	if (cgs.gametype != GT_1FCTF) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
EQI4 $638
line 791
;791:		return;
ADDRGP4 $637
JUMPV
LABELV $638
line 792
;792:	} else {
line 793
;793:		gitem_t *item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 794
;794:		if (item) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $641
line 795
;795:			if( cgs.flagStatus >= 0 && cgs.flagStatus <= 4 ) {
ADDRGP4 cgs+342632
INDIRI4
CNSTI4 0
LTI4 $643
ADDRGP4 cgs+342632
INDIRI4
CNSTI4 4
GTI4 $643
line 796
;796:				vec4_t color = {1, 1, 1, 1};
ADDRLP4 8
ADDRGP4 $647
INDIRB
ASGNB 16
line 797
;797:				int index = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 798
;798:				if (cgs.flagStatus == FLAG_TAKEN_RED) {
ADDRGP4 cgs+342632
INDIRI4
CNSTI4 2
NEI4 $648
line 799
;799:					color[1] = color[2] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 8+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 28
INDIRF4
ASGNF4
line 800
;800:					index = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 801
;801:				} else if (cgs.flagStatus == FLAG_TAKEN_BLUE) {
ADDRGP4 $649
JUMPV
LABELV $648
ADDRGP4 cgs+342632
INDIRI4
CNSTI4 3
NEI4 $653
line 802
;802:					color[0] = color[1] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 8+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 28
INDIRF4
ASGNF4
line 803
;803:					index = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 804
;804:				} else if (cgs.flagStatus == FLAG_DROPPED) {
ADDRGP4 $654
JUMPV
LABELV $653
ADDRGP4 cgs+342632
INDIRI4
CNSTI4 4
NEI4 $657
line 805
;805:					index = 2;
ADDRLP4 24
CNSTI4 2
ASGNI4
line 806
;806:				}
LABELV $657
LABELV $654
LABELV $649
line 807
;807:			  trap_R_SetColor(color);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 808
;808:				CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.flagShaders[index] );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+956380+2472
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 809
;809:			}
LABELV $643
line 810
;810:		}
LABELV $641
line 811
;811:	}
line 812
;812:}
LABELV $637
endproc CG_OneFlagStatus 32 20
proc CG_DrawCTFPowerUp 8 20
line 815
;813:
;814:
;815:static void CG_DrawCTFPowerUp(rectDef_t *rect) {
line 818
;816:	int		value;
;817:
;818:	if (cgs.gametype < GT_CTF || cgs.ffa_gt>0) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
LTI4 $667
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 0
LEI4 $663
LABELV $667
line 819
;819:		return;
ADDRGP4 $662
JUMPV
LABELV $663
line 821
;820:	}
;821:	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 822
;822:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $669
line 823
;823:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 824
;824:		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cg_items[ value ].icon );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 825
;825:	}
LABELV $669
line 826
;826:}
LABELV $662
endproc CG_DrawCTFPowerUp 8 20
proc CG_DrawTeamColor 8 24
line 830
;827:
;828:
;829:
;830:static void CG_DrawTeamColor(rectDef_t *rect, vec4_t color) {
line 831
;831:	CG_DrawTeamBackground(rect->x, rect->y, rect->w, rect->h, color[3], cg.snap->ps.persistant[PERS_TEAM]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawTeamBackground
CALLV
pop
line 832
;832:}
LABELV $672
endproc CG_DrawTeamColor 8 24
proc CG_DrawAreaPowerUp 232 32
line 834
;833:
;834:static void CG_DrawAreaPowerUp(rectDef_t *rect, int align, float special, float scale, vec4_t color) {
line 846
;835:	char num[16];
;836:	int		sorted[MAX_POWERUPS];
;837:	int		sortedTime[MAX_POWERUPS];
;838:	int		i, j, k;
;839:	int		active;
;840:	playerState_t	*ps;
;841:	int		t;
;842:	gitem_t	*item;
;843:	float	f;
;844:	rectDef_t r2;
;845:	float *inc;
;846:	r2.x = rect->x;
ADDRLP4 148
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 847
;847:	r2.y = rect->y;
ADDRLP4 148+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 848
;848:	r2.w = rect->w;
ADDRLP4 148+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 849
;849:	r2.h = rect->h;
ADDRLP4 148+12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 851
;850:
;851:	inc = (align == HUD_VERTICAL) ? &r2.y : &r2.x;
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $680
ADDRLP4 196
ADDRLP4 148+4
ASGNP4
ADDRGP4 $681
JUMPV
LABELV $680
ADDRLP4 196
ADDRLP4 148
ASGNP4
LABELV $681
ADDRLP4 192
ADDRLP4 196
INDIRP4
ASGNP4
line 853
;852:
;853:	ps = &cg.snap->ps;
ADDRLP4 164
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 855
;854:
;855:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 164
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $683
line 856
;856:		return;
ADDRGP4 $674
JUMPV
LABELV $683
line 860
;857:	}
;858:
;859:	// sort the list by time remaining
;860:	active = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 861
;861:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $685
line 862
;862:		if ( !ps->powerups[ i ] ) {
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 164
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $689
line 863
;863:			continue;
ADDRGP4 $686
JUMPV
LABELV $689
line 865
;864:		}
;865:		t = ps->powerups[ i ] - cg.time;
ADDRLP4 140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 164
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
ASGNI4
line 868
;866:		// ZOID--don't draw if the power up has unlimited time (999 seconds)
;867:		// This is true of the CTF flags
;868:		if ( t <= 0 || t >= 999000) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LEI4 $694
ADDRLP4 140
INDIRI4
CNSTI4 999000
LTI4 $692
LABELV $694
line 869
;869:			continue;
ADDRGP4 $686
JUMPV
LABELV $692
line 873
;870:		}
;871:
;872:		// insert into the list
;873:		for ( j = 0 ; j < active ; j++ ) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $698
JUMPV
LABELV $695
line 874
;874:			if ( sortedTime[j] >= t ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $699
line 875
;875:				for ( k = active - 1 ; k >= j ; k-- ) {
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $704
JUMPV
LABELV $701
line 876
;876:					sorted[k+1] = sorted[k];
ADDRLP4 204
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 204
INDIRI4
ADDRLP4 68+4
ADDP4
ADDRLP4 204
INDIRI4
ADDRLP4 68
ADDP4
INDIRI4
ASGNI4
line 877
;877:					sortedTime[k+1] = sortedTime[k];
ADDRLP4 208
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 208
INDIRI4
ADDRLP4 4+4
ADDP4
ADDRLP4 208
INDIRI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 878
;878:				}
LABELV $702
line 875
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $704
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $701
line 879
;879:				break;
ADDRGP4 $697
JUMPV
LABELV $699
line 881
;880:			}
;881:		}
LABELV $696
line 873
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $698
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $695
LABELV $697
line 882
;882:		sorted[j] = i;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 883
;883:		sortedTime[j] = t;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 884
;884:		active++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 885
;885:	}
LABELV $686
line 861
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 16
LTI4 $685
line 888
;886:
;887:	// draw the icons and timers
;888:	for ( i = 0 ; i < active ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRGP4 $710
JUMPV
LABELV $707
line 889
;889:		item = BG_FindItemForPowerup( sorted[i] );
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 200
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 168
ADDRLP4 200
INDIRP4
ASGNP4
line 891
;890:
;891:		if (item) {
ADDRLP4 168
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $711
line 892
;892:			t = ps->powerups[ sorted[i] ];
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 140
ADDRLP4 144
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 164
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ASGNI4
line 893
;893:			if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 140
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $713
line 894
;894:				trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 895
;895:			} else {
ADDRGP4 $714
JUMPV
LABELV $713
line 898
;896:				vec4_t	modulate;
;897:
;898:				f = (float)( t - cg.time ) / POWERUP_BLINK_TIME;
ADDRLP4 188
ADDRLP4 140
INDIRI4
ADDRGP4 cg+1868892
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 899
;899:				f -= (int)f;
ADDRLP4 188
ADDRLP4 188
INDIRF4
ADDRLP4 188
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
ASGNF4
line 900
;900:				modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
ADDRLP4 208+12
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 208+8
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 208+4
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 208
ADDRLP4 188
INDIRF4
ASGNF4
line 901
;901:				trap_R_SetColor( modulate );
ADDRLP4 208
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 902
;902:			}
LABELV $714
line 904
;903:
;904:			CG_DrawPic( r2.x, r2.y, r2.w * .75, r2.h, trap_R_RegisterShader( item->icon ) );
ADDRLP4 168
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 148
INDIRF4
ARGF4
ADDRLP4 148+4
INDIRF4
ARGF4
CNSTF4 1061158912
ADDRLP4 148+8
INDIRF4
MULF4
ARGF4
ADDRLP4 148+12
INDIRF4
ARGF4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 906
;905:
;906:			Com_sprintf (num, sizeof(num), "%i", sortedTime[i] / 1000);
ADDRLP4 172
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $216
ARGP4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 907
;907:			CG_Text_Paint(r2.x + (r2.w * .75) + 3 , r2.y + r2.h, scale, color, num, 0, 0, 0);
ADDRLP4 148
INDIRF4
CNSTF4 1061158912
ADDRLP4 148+8
INDIRF4
MULF4
ADDF4
CNSTF4 1077936128
ADDF4
ARGF4
ADDRLP4 148+4
INDIRF4
ADDRLP4 148+12
INDIRF4
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 172
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 212
CNSTI4 0
ASGNI4
ADDRLP4 212
INDIRI4
ARGI4
ADDRLP4 212
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 908
;908:			*inc += r2.w + special;
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 148+8
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 909
;909:		}
LABELV $711
line 911
;910:
;911:	}
LABELV $708
line 888
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $710
ADDRLP4 144
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $707
line 912
;912:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 914
;913:
;914:}
LABELV $674
endproc CG_DrawAreaPowerUp 232 32
export CG_GetValue
proc CG_GetValue 44 0
line 916
;915:
;916:float CG_GetValue(int ownerDraw) {
line 921
;917:	centity_t	*cent;
;918: 	clientInfo_t *ci;
;919:	playerState_t	*ps;
;920:
;921:  cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 4
CNSTI4 928
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 922
;922:	ps = &cg.snap->ps;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 924
;923:
;924:  switch (ownerDraw) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 20
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $740
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $748
LABELV $747
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $736
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $742
ADDRLP4 20
INDIRI4
CNSTI4 6
EQI4 $737
ADDRGP4 $731
JUMPV
LABELV $748
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 27
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $745
ADDRLP4 24
INDIRI4
CNSTI4 28
EQI4 $743
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $731
LABELV $749
ADDRLP4 32
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 40
EQI4 $732
ADDRLP4 32
INDIRI4
CNSTI4 41
EQI4 $734
ADDRGP4 $731
JUMPV
LABELV $732
line 926
;925:  case CG_SELECTEDPLAYER_ARMOR:
;926:    ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 36
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 8
CNSTI4 1944
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 927
;927:    return ci->armor;
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $727
JUMPV
line 928
;928:    break;
LABELV $734
line 930
;929:  case CG_SELECTEDPLAYER_HEALTH:
;930:    ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 40
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 8
CNSTI4 1944
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 931
;931:    return ci->health;
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $727
JUMPV
line 932
;932:    break;
LABELV $736
line 934
;933:  case CG_PLAYER_ARMOR_VALUE:
;934:		return ps->stats[STAT_ARMOR];
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $727
JUMPV
line 935
;935:    break;
LABELV $737
line 937
;936:  case CG_PLAYER_AMMO_VALUE:
;937:		if ( cent->currentState.weapon ) {
ADDRLP4 4
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $731
line 938
;938:		  return ps->ammo[cent->currentState.weapon];
ADDRLP4 4
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $727
JUMPV
line 940
;939:		}
;940:    break;
LABELV $740
line 942
;941:  case CG_PLAYER_SCORE:
;942:	  return cg.snap->ps.persistant[PERS_SCORE];
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $727
JUMPV
line 943
;943:    break;
LABELV $742
line 945
;944:  case CG_PLAYER_HEALTH:
;945:		return ps->stats[STAT_HEALTH];
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $727
JUMPV
line 946
;946:    break;
LABELV $743
line 948
;947:  case CG_RED_SCORE:
;948:		return cgs.scores1;
ADDRGP4 cgs+342616
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $727
JUMPV
line 949
;949:    break;
LABELV $745
line 951
;950:  case CG_BLUE_SCORE:
;951:		return cgs.scores2;
ADDRGP4 cgs+342620
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $727
JUMPV
line 952
;952:    break;
line 954
;953:  default:
;954:    break;
LABELV $731
line 956
;955:  }
;956:	return -1;
CNSTF4 3212836864
RETF4
LABELV $727
endproc CG_GetValue 44 0
export CG_OtherTeamHasFlag
proc CG_OtherTeamHasFlag 8 0
line 959
;957:}
;958:
;959:qboolean CG_OtherTeamHasFlag(void) {
line 960
;960:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION || cgs.gametype == GT_1FCTF) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $757
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $757
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $751
LABELV $757
line 961
;961:		int team = cg.snap->ps.persistant[PERS_TEAM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 962
;962:		if (cgs.gametype == GT_1FCTF) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $759
line 963
;963:			if (team == TEAM_RED && cgs.flagStatus == FLAG_TAKEN_BLUE) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $762
ADDRGP4 cgs+342632
INDIRI4
CNSTI4 3
NEI4 $762
line 964
;964:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $750
JUMPV
LABELV $762
line 965
;965:			} else if (team == TEAM_BLUE && cgs.flagStatus == FLAG_TAKEN_RED) {
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $765
ADDRGP4 cgs+342632
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $765
line 966
;966:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $750
JUMPV
LABELV $765
line 967
;967:			} else {
line 968
;968:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $750
JUMPV
LABELV $759
line 970
;969:			}
;970:		} else {
line 971
;971:			if (team == TEAM_RED && cgs.redflag == FLAG_TAKEN) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $768
ADDRGP4 cgs+342624
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $768
line 972
;972:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $750
JUMPV
LABELV $768
line 973
;973:			} else if (team == TEAM_BLUE && cgs.blueflag == FLAG_TAKEN) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $771
ADDRGP4 cgs+342628
INDIRI4
CNSTI4 1
NEI4 $771
line 974
;974:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $750
JUMPV
LABELV $771
line 975
;975:			} else {
line 976
;976:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $750
JUMPV
LABELV $751
line 980
;977:			}
;978:		}
;979:	}
;980:	return qfalse;
CNSTI4 0
RETI4
LABELV $750
endproc CG_OtherTeamHasFlag 8 0
export CG_YourTeamHasFlag
proc CG_YourTeamHasFlag 8 0
line 983
;981:}
;982:
;983:qboolean CG_YourTeamHasFlag(void) {
line 984
;984:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION || cgs.gametype == GT_1FCTF) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $781
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
EQI4 $781
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $775
LABELV $781
line 985
;985:		int team = cg.snap->ps.persistant[PERS_TEAM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 986
;986:		if (cgs.gametype == GT_1FCTF) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $783
line 987
;987:			if (team == TEAM_RED && cgs.flagStatus == FLAG_TAKEN_RED) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $786
ADDRGP4 cgs+342632
INDIRI4
CNSTI4 2
NEI4 $786
line 988
;988:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $774
JUMPV
LABELV $786
line 989
;989:			} else if (team == TEAM_BLUE && cgs.flagStatus == FLAG_TAKEN_BLUE) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $789
ADDRGP4 cgs+342632
INDIRI4
CNSTI4 3
NEI4 $789
line 990
;990:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $774
JUMPV
LABELV $789
line 991
;991:			} else {
line 992
;992:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $774
JUMPV
LABELV $783
line 994
;993:			}
;994:		} else {
line 995
;995:			if (team == TEAM_RED && cgs.blueflag == FLAG_TAKEN) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $792
ADDRGP4 cgs+342628
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $792
line 996
;996:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $774
JUMPV
LABELV $792
line 997
;997:			} else if (team == TEAM_BLUE && cgs.redflag == FLAG_TAKEN) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $795
ADDRGP4 cgs+342624
INDIRI4
CNSTI4 1
NEI4 $795
line 998
;998:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $774
JUMPV
LABELV $795
line 999
;999:			} else {
line 1000
;1000:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $774
JUMPV
LABELV $775
line 1004
;1001:			}
;1002:		}
;1003:	}
;1004:	return qfalse;
CNSTI4 0
RETI4
LABELV $774
endproc CG_YourTeamHasFlag 8 0
export CG_OwnerDrawVisible
proc CG_OwnerDrawVisible 4 0
line 1009
;1005:}
;1006:
;1007:// THINKABOUTME: should these be exclusive or inclusive.. 
;1008:// 
;1009:qboolean CG_OwnerDrawVisible(int flags) {
line 1011
;1010:
;1011:	if (flags & CG_SHOW_TEAMINFO) {
ADDRFP4 0
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $799
line 1012
;1012:		return (cg_currentSelectedPlayer.integer == numSortedTeamPlayers);
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
NEI4 $803
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $804
JUMPV
LABELV $803
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $804
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $798
JUMPV
LABELV $799
line 1015
;1013:	}
;1014:
;1015:	if (flags & CG_SHOW_NOTEAMINFO) {
ADDRFP4 0
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $805
line 1016
;1016:		return !(cg_currentSelectedPlayer.integer == numSortedTeamPlayers);
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
EQI4 $809
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $810
JUMPV
LABELV $809
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $810
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $798
JUMPV
LABELV $805
line 1019
;1017:	}
;1018:
;1019:	if (flags & CG_SHOW_OTHERTEAMHASFLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $811
line 1020
;1020:		return CG_OtherTeamHasFlag();
ADDRLP4 0
ADDRGP4 CG_OtherTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $798
JUMPV
LABELV $811
line 1023
;1021:	}
;1022:
;1023:	if (flags & CG_SHOW_YOURTEAMHASENEMYFLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $813
line 1024
;1024:		return CG_YourTeamHasFlag();
ADDRLP4 0
ADDRGP4 CG_YourTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $798
JUMPV
LABELV $813
line 1027
;1025:	}
;1026:
;1027:	if (flags & (CG_SHOW_BLUE_TEAM_HAS_REDFLAG | CG_SHOW_RED_TEAM_HAS_BLUEFLAG)) {
ADDRFP4 0
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $815
line 1028
;1028:		if (flags & CG_SHOW_BLUE_TEAM_HAS_REDFLAG && (cgs.redflag == FLAG_TAKEN || cgs.flagStatus == FLAG_TAKEN_RED)) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
BANDI4
CNSTI4 0
EQI4 $817
ADDRGP4 cgs+342624
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $821
ADDRGP4 cgs+342632
INDIRI4
CNSTI4 2
NEI4 $817
LABELV $821
line 1029
;1029:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $817
line 1030
;1030:		} else if (flags & CG_SHOW_RED_TEAM_HAS_BLUEFLAG && (cgs.blueflag == FLAG_TAKEN || cgs.flagStatus == FLAG_TAKEN_BLUE)) {
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $822
ADDRGP4 cgs+342628
INDIRI4
CNSTI4 1
EQI4 $826
ADDRGP4 cgs+342632
INDIRI4
CNSTI4 3
NEI4 $822
LABELV $826
line 1031
;1031:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $822
line 1033
;1032:		}
;1033:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $798
JUMPV
LABELV $815
line 1036
;1034:	}
;1035:
;1036:	if (flags & CG_SHOW_ANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $827
line 1037
;1037:		if( cgs.gametype >= GT_TEAM && cgs.ffa_gt!=1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $829
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
EQI4 $829
line 1038
;1038:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $829
line 1040
;1039:		}
;1040:	}
LABELV $827
line 1042
;1041:
;1042:	if (flags & CG_SHOW_ANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $833
line 1043
;1043:		if( cgs.gametype < GT_TEAM || cgs.ffa_gt==1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $839
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
NEI4 $835
LABELV $839
line 1044
;1044:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $835
line 1046
;1045:		}
;1046:	}
LABELV $833
line 1048
;1047:
;1048:	if (flags & CG_SHOW_HARVESTER) {
ADDRFP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $840
line 1049
;1049:		if( cgs.gametype == GT_HARVESTER ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
NEI4 $842
line 1050
;1050:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $842
line 1051
;1051:    } else {
line 1052
;1052:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $798
JUMPV
LABELV $840
line 1056
;1053:    }
;1054:	}
;1055:
;1056:	if (flags & CG_SHOW_ONEFLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $845
line 1057
;1057:		if( cgs.gametype == GT_1FCTF ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $847
line 1058
;1058:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $847
line 1059
;1059:    } else {
line 1060
;1060:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $798
JUMPV
LABELV $845
line 1064
;1061:    }
;1062:	}
;1063:
;1064:	if (flags & CG_SHOW_CTF) {
ADDRFP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $850
line 1065
;1065:		if( cgs.gametype == GT_CTF || cgs.gametype == GT_CTF_ELIMINATION) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
EQI4 $856
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
NEI4 $852
LABELV $856
line 1066
;1066:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $852
line 1068
;1067:		}
;1068:	}
LABELV $850
line 1070
;1069:
;1070:	if (flags & CG_SHOW_OBELISK) {
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $857
line 1071
;1071:		if( cgs.gametype == GT_OBELISK ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 7
NEI4 $859
line 1072
;1072:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $859
line 1073
;1073:    } else {
line 1074
;1074:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $798
JUMPV
LABELV $857
line 1078
;1075:    }
;1076:	}
;1077:
;1078:	if (flags & CG_SHOW_HEALTHCRITICAL) {
ADDRFP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $862
line 1079
;1079:		if (cg.snap->ps.stats[STAT_HEALTH] < 25) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 25
GEI4 $864
line 1080
;1080:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $864
line 1082
;1081:		}
;1082:	}
LABELV $862
line 1084
;1083:
;1084:	if (flags & CG_SHOW_HEALTHOK) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $867
line 1085
;1085:		if (cg.snap->ps.stats[STAT_HEALTH] >= 25) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 25
LTI4 $869
line 1086
;1086:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $869
line 1088
;1087:		}
;1088:	}
LABELV $867
line 1090
;1089:
;1090:	if (flags & CG_SHOW_TOURNAMENT) {
ADDRFP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $872
line 1091
;1091:		if( cgs.gametype == GT_TOURNAMENT ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 3
NEI4 $874
line 1092
;1092:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $874
line 1094
;1093:		}
;1094:	}
LABELV $872
line 1096
;1095:
;1096:	if (flags & CG_SHOW_DURINGINCOMINGVOICE) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $877
line 1097
;1097:	}
LABELV $877
line 1099
;1098:
;1099:	if (flags & CG_SHOW_IF_PLAYER_HAS_FLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $879
line 1100
;1100:		if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $887
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $887
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $881
LABELV $887
line 1101
;1101:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $798
JUMPV
LABELV $881
line 1103
;1102:		}
;1103:	}
LABELV $879
line 1104
;1104:	return qfalse;
CNSTI4 0
RETI4
LABELV $798
endproc CG_OwnerDrawVisible 4 0
proc CG_DrawPlayerHasFlag 16 24
line 1109
;1105:}
;1106:
;1107:
;1108:
;1109:static void CG_DrawPlayerHasFlag(rectDef_t *rect, qboolean force2D) {
line 1110
;1110:	int adj = (force2D) ? 0 : 2;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $890
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $891
JUMPV
LABELV $890
ADDRLP4 4
CNSTI4 2
ASGNI4
LABELV $891
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1111
;1111:	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
ADDRGP4 cg+1868928+312+28
INDIRI4
CNSTI4 0
EQI4 $892
line 1112
;1112:  	CG_DrawFlagModel( rect->x + adj, rect->y + adj, rect->w - adj, rect->h - adj, TEAM_RED, force2D);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
CNSTI4 1
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 1113
;1113:	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $893
JUMPV
LABELV $892
ADDRGP4 cg+1868928+312+32
INDIRI4
CNSTI4 0
EQI4 $897
line 1114
;1114:  	CG_DrawFlagModel( rect->x + adj, rect->y + adj, rect->w - adj, rect->h - adj, TEAM_BLUE, force2D);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
CNSTI4 2
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 1115
;1115:	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $898
JUMPV
LABELV $897
ADDRGP4 cg+1868928+312+36
INDIRI4
CNSTI4 0
EQI4 $902
line 1116
;1116:  	CG_DrawFlagModel( rect->x + adj, rect->y + adj, rect->w - adj, rect->h - adj, TEAM_FREE, force2D);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 1117
;1117:	}
LABELV $902
LABELV $898
LABELV $893
line 1118
;1118:}
LABELV $888
endproc CG_DrawPlayerHasFlag 16 24
proc CG_DrawAreaSystemChat 8 32
line 1120
;1119:
;1120:static void CG_DrawAreaSystemChat(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 1121
;1121:  CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, systemChat, 0, 0, 0);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 systemChat
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1122
;1122:}
LABELV $907
endproc CG_DrawAreaSystemChat 8 32
proc CG_DrawAreaTeamChat 8 32
line 1124
;1123:
;1124:static void CG_DrawAreaTeamChat(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 1125
;1125:  CG_Text_Paint(rect->x, rect->y + rect->h, scale, color,teamChat1, 0, 0, 0);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 teamChat1
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1126
;1126:}
LABELV $908
endproc CG_DrawAreaTeamChat 8 32
proc CG_DrawAreaChat 8 32
line 1128
;1127:
;1128:static void CG_DrawAreaChat(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 1129
;1129:  CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, teamChat2, 0, 0, 0);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 teamChat2
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1130
;1130:}
LABELV $909
endproc CG_DrawAreaChat 8 32
export CG_GetKillerText
proc CG_GetKillerText 8 8
line 1132
;1131:
;1132:const char *CG_GetKillerText(void) {
line 1133
;1133:	const char *s = "";
ADDRLP4 0
ADDRGP4 $911
ASGNP4
line 1134
;1134:	if ( cg.killerName[0] ) {
ADDRGP4 cg+1888592
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $912
line 1135
;1135:		s = va("Fragged by %s", cg.killerName );
ADDRGP4 $915
ARGP4
ADDRGP4 cg+1888592
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1136
;1136:	}
LABELV $912
line 1137
;1137:	return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $910
endproc CG_GetKillerText 8 8
proc CG_DrawKiller 24 32
line 1141
;1138:}
;1139:
;1140:
;1141:static void CG_DrawKiller(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 1143
;1142:	// fragged by ... line
;1143:	if ( cg.killerName[0] ) {
ADDRGP4 cg+1888592
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $918
line 1144
;1144:		int x = rect->x + rect->w / 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
CVFI4 4
ASGNI4
line 1145
;1145:	  CG_Text_Paint(x - CG_Text_Width(CG_GetKillerText(), scale, 0) / 2, rect->y + rect->h, scale, color, CG_GetKillerText(), 0, 0, textStyle);
ADDRLP4 8
ADDRGP4 CG_GetKillerText
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRGP4 CG_GetKillerText
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1146
;1146:	}
LABELV $918
line 1148
;1147:	
;1148:}
LABELV $917
endproc CG_DrawKiller 24 32
proc CG_DrawCapFragLimit 16 32
line 1151
;1149:
;1150:
;1151:static void CG_DrawCapFragLimit(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 1152
;1152:	int limit = (cgs.gametype >= GT_CTF && cgs.ffa_gt==0) ? cgs.capturelimit : cgs.fraglimit;
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
LTI4 $927
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 0
NEI4 $927
ADDRLP4 4
ADDRGP4 cgs+339064
INDIRI4
ASGNI4
ADDRGP4 $928
JUMPV
LABELV $927
ADDRLP4 4
ADDRGP4 cgs+339060
INDIRI4
ASGNI4
LABELV $928
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1153
;1153:	CG_Text_Paint(rect->x, rect->y, scale, color, va("%2i", limit),0, 0, textStyle); 
ADDRGP4 $929
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1154
;1154:}
LABELV $921
endproc CG_DrawCapFragLimit 16 32
proc CG_Draw1stPlace 8 32
line 1156
;1155:
;1156:static void CG_Draw1stPlace(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 1157
;1157:	if (cgs.scores1 != SCORE_NOT_PRESENT) {
ADDRGP4 cgs+342616
INDIRI4
CNSTI4 -9999
EQI4 $931
line 1158
;1158:		CG_Text_Paint(rect->x, rect->y, scale, color, va("%2i", cgs.scores1),0, 0, textStyle); 
ADDRGP4 $929
ARGP4
ADDRGP4 cgs+342616
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1159
;1159:	}
LABELV $931
line 1160
;1160:}
LABELV $930
endproc CG_Draw1stPlace 8 32
proc CG_Draw2ndPlace 8 32
line 1162
;1161:
;1162:static void CG_Draw2ndPlace(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 1163
;1163:	if (cgs.scores2 != SCORE_NOT_PRESENT) {
ADDRGP4 cgs+342620
INDIRI4
CNSTI4 -9999
EQI4 $936
line 1164
;1164:		CG_Text_Paint(rect->x, rect->y, scale, color, va("%2i", cgs.scores2),0, 0, textStyle); 
ADDRGP4 $929
ARGP4
ADDRGP4 cgs+342620
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1165
;1165:	}
LABELV $936
line 1166
;1166:}
LABELV $935
endproc CG_Draw2ndPlace 8 32
export CG_GetGameStatusText
proc CG_GetGameStatusText 12 12
line 1168
;1167:
;1168:const char *CG_GetGameStatusText(void) {
line 1169
;1169:	const char *s = "";
ADDRLP4 0
ADDRGP4 $911
ASGNP4
line 1170
;1170:	if ( cgs.gametype < GT_TEAM || cgs.ffa_gt==1) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
LTI4 $945
ADDRGP4 cgs+342392
INDIRI4
CNSTI4 1
NEI4 $941
LABELV $945
line 1171
;1171:		if (cg.snap->ps.persistant[PERS_TEAM] != TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $942
line 1172
;1172:			s = va("%s place with %i",CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),cg.snap->ps.persistant[PERS_SCORE] );
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $949
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1173
;1173:		}
line 1174
;1174:	} else {
ADDRGP4 $942
JUMPV
LABELV $941
line 1175
;1175:		if ( cg.teamScores[0] == cg.teamScores[1] ) {
ADDRGP4 cg+1872044
INDIRI4
ADDRGP4 cg+1872044+4
INDIRI4
NEI4 $952
line 1176
;1176:			s = va("Teams are tied at %i", cg.teamScores[0] );
ADDRGP4 $957
ARGP4
ADDRGP4 cg+1872044
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1177
;1177:		} else if ( cg.teamScores[0] >= cg.teamScores[1] ) {
ADDRGP4 $953
JUMPV
LABELV $952
ADDRGP4 cg+1872044
INDIRI4
ADDRGP4 cg+1872044+4
INDIRI4
LTI4 $959
line 1178
;1178:			s = va("Red leads Blue, %i to %i", cg.teamScores[0], cg.teamScores[1] );
ADDRGP4 $964
ARGP4
ADDRGP4 cg+1872044
INDIRI4
ARGI4
ADDRGP4 cg+1872044+4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1179
;1179:		} else {
ADDRGP4 $960
JUMPV
LABELV $959
line 1180
;1180:			s = va("Blue leads Red, %i to %i", cg.teamScores[1], cg.teamScores[0] );
ADDRGP4 $968
ARGP4
ADDRGP4 cg+1872044+4
INDIRI4
ARGI4
ADDRGP4 cg+1872044
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1181
;1181:		}
LABELV $960
LABELV $953
line 1182
;1182:	}
LABELV $942
line 1183
;1183:	return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $940
endproc CG_GetGameStatusText 12 12
proc CG_DrawGameStatus 8 32
line 1186
;1184:}
;1185:	
;1186:static void CG_DrawGameStatus(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 1187
;1187:	CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, CG_GetGameStatusText(), 0, 0, textStyle);
ADDRLP4 0
ADDRGP4 CG_GetGameStatusText
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1188
;1188:}
LABELV $972
endproc CG_DrawGameStatus 8 32
export CG_GameTypeString
proc CG_GameTypeString 0 0
line 1190
;1189:
;1190:const char *CG_GameTypeString(void) {
line 1191
;1191:	if ( cgs.gametype == GT_SANDBOX ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 0
NEI4 $974
line 1192
;1192:		return "Sandbox";
ADDRGP4 $977
RETP4
ADDRGP4 $973
JUMPV
LABELV $974
line 1193
;1193:	} else if ( cgs.gametype == GT_FFA ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 1
NEI4 $978
line 1194
;1194:		return "Free For All";
ADDRGP4 $981
RETP4
ADDRGP4 $973
JUMPV
LABELV $978
line 1195
;1195:	} else if ( cgs.gametype == GT_SINGLE ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 2
NEI4 $982
line 1196
;1196:		return "Single Player";
ADDRGP4 $985
RETP4
ADDRGP4 $973
JUMPV
LABELV $982
line 1197
;1197:	} else if ( cgs.gametype == GT_TEAM ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 4
NEI4 $986
line 1198
;1198:		return "Team Deathmatch";
ADDRGP4 $989
RETP4
ADDRGP4 $973
JUMPV
LABELV $986
line 1199
;1199:	} else if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 5
NEI4 $990
line 1200
;1200:		return "Capture the Flag";
ADDRGP4 $993
RETP4
ADDRGP4 $973
JUMPV
LABELV $990
line 1201
;1201:	} else if ( cgs.gametype == GT_1FCTF ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 6
NEI4 $994
line 1202
;1202:		return "One Flag CTF";
ADDRGP4 $997
RETP4
ADDRGP4 $973
JUMPV
LABELV $994
line 1203
;1203:	} else if ( cgs.gametype == GT_OBELISK ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 7
NEI4 $998
line 1204
;1204:		return "Overload";
ADDRGP4 $1001
RETP4
ADDRGP4 $973
JUMPV
LABELV $998
line 1205
;1205:	} else if ( cgs.gametype == GT_HARVESTER ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 8
NEI4 $1002
line 1206
;1206:		return "Harvester";
ADDRGP4 $1005
RETP4
ADDRGP4 $973
JUMPV
LABELV $1002
line 1207
;1207:	} else if ( cgs.gametype == GT_ELIMINATION ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 9
NEI4 $1006
line 1208
;1208:		return "Elimination";
ADDRGP4 $1009
RETP4
ADDRGP4 $973
JUMPV
LABELV $1006
line 1209
;1209:	} else if ( cgs.gametype == GT_CTF_ELIMINATION ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 10
NEI4 $1010
line 1210
;1210:		return "CTF Elimination";
ADDRGP4 $1013
RETP4
ADDRGP4 $973
JUMPV
LABELV $1010
line 1211
;1211:	} else if ( cgs.gametype == GT_LMS ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 11
NEI4 $1014
line 1212
;1212:		return "Last Man Standing";
ADDRGP4 $1017
RETP4
ADDRGP4 $973
JUMPV
LABELV $1014
line 1213
;1213:	} else if ( cgs.gametype == GT_DOUBLE_D ) {
ADDRGP4 cgs+339040
INDIRI4
CNSTI4 12
NEI4 $1018
line 1214
;1214:		return "Double Domination";
ADDRGP4 $1021
RETP4
ADDRGP4 $973
JUMPV
LABELV $1018
line 1216
;1215:	}
;1216:	return "";
ADDRGP4 $911
RETP4
LABELV $973
endproc CG_GameTypeString 0 0
proc CG_DrawGameType 8 32
line 1218
;1217:}
;1218:static void CG_DrawGameType(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 1219
;1219:	CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, CG_GameTypeString(), 0, 0, textStyle);
ADDRLP4 0
ADDRGP4 CG_GameTypeString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1220
;1220:}
LABELV $1022
endproc CG_DrawGameType 8 32
proc CG_Text_Paint_Limit 72 40
line 1222
;1221:
;1222:static void CG_Text_Paint_Limit(float *maxX, float x, float y, float scale, vec4_t color, const char* text, float adjust, int limit) {
line 1226
;1223:  int len, count;
;1224:	vec4_t newColor;
;1225:	glyphInfo_t *glyph;
;1226:  if (text) {
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1024
line 1229
;1227:// TTimo: FIXME
;1228://    const unsigned char *s = text; // bk001206 - unsigned
;1229:    const char *s = text;
ADDRLP4 28
ADDRFP4 20
INDIRP4
ASGNP4
line 1230
;1230:		float max = *maxX;
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1232
;1231:		float useScale;
;1232:		fontInfo_t *font = &cgDC.Assets.textFont;
ADDRLP4 36
ADDRGP4 cgDC+228+12
ASGNP4
line 1233
;1233:		if (scale <= cg_smallFont.value) {
ADDRFP4 12
INDIRF4
ADDRGP4 cg_smallFont+8
INDIRF4
GTF4 $1028
line 1234
;1234:			font = &cgDC.Assets.smallFont;
ADDRLP4 36
ADDRGP4 cgDC+228+20560
ASGNP4
line 1235
;1235:		} else if (scale > cg_bigFont.value) {
ADDRGP4 $1029
JUMPV
LABELV $1028
ADDRFP4 12
INDIRF4
ADDRGP4 cg_bigFont+8
INDIRF4
LEF4 $1033
line 1236
;1236:			font = &cgDC.Assets.bigFont;
ADDRLP4 36
ADDRGP4 cgDC+228+41108
ASGNP4
line 1237
;1237:		}
LABELV $1033
LABELV $1029
line 1238
;1238:		useScale = scale * font->glyphScale;
ADDRLP4 32
ADDRFP4 12
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 1239
;1239:		trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1240
;1240:    len = strlen(text);					 
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 1241
;1241:		if (limit > 0 && len > limit) {
ADDRLP4 48
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LEI4 $1038
ADDRLP4 24
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $1038
line 1242
;1242:			len = limit;
ADDRLP4 24
ADDRFP4 28
INDIRI4
ASGNI4
line 1243
;1243:		}
LABELV $1038
line 1244
;1244:		count = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $1041
JUMPV
LABELV $1040
line 1245
;1245:		while (s && *s && count < len) {
line 1246
;1246:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 0
CNSTI4 80
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
line 1247
;1247:			if ( Q_IsColorString( s ) ) {
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1043
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $1043
ADDRLP4 56
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $1043
ADDRLP4 56
INDIRI4
CNSTI4 48
LTI4 $1043
ADDRLP4 56
INDIRI4
CNSTI4 57
GTI4 $1043
line 1248
;1248:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 4
LSHI4
ADDRGP4 g_color_table-768
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1249
;1249:				newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1250
;1250:				trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1251
;1251:				s += 2;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 1252
;1252:				continue;
ADDRGP4 $1041
JUMPV
LABELV $1043
line 1253
;1253:			} else {
line 1254
;1254:	      float yadj = useScale * glyph->top;
ADDRLP4 60
ADDRLP4 32
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1255
;1255:				if (CG_Text_Width(s, useScale, 1) + x > max) {
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRF4
ADDF4
ADDRLP4 40
INDIRF4
LEF4 $1047
line 1256
;1256:					*maxX = 0;
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 1257
;1257:					break;
ADDRGP4 $1042
JUMPV
LABELV $1047
line 1259
;1258:				}
;1259:		    CG_Text_PaintChar(x, y - yadj, 
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 1268
;1260:			                    glyph->imageWidth,
;1261:				                  glyph->imageHeight,
;1262:					                useScale, 
;1263:						              glyph->s,
;1264:							            glyph->t,
;1265:								          glyph->s2,
;1266:									        glyph->t2,
;1267:										      glyph->glyph);
;1268:	      x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
ADDRFP4 24
INDIRF4
ADDF4
ADDF4
ASGNF4
line 1269
;1269:				*maxX = x;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ASGNF4
line 1270
;1270:				count++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1271
;1271:				s++;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1272
;1272:	    }
line 1273
;1273:		}
LABELV $1041
line 1245
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1050
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1050
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $1040
LABELV $1050
LABELV $1042
line 1274
;1274:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1275
;1275:  }
LABELV $1024
line 1277
;1276:
;1277:}
LABELV $1023
endproc CG_Text_Paint_Limit 72 40
export CG_DrawNewTeamInfo
proc CG_DrawNewTeamInfo 100 32
line 1283
;1278:
;1279:
;1280:
;1281:#define PIC_WIDTH 12
;1282:
;1283:void CG_DrawNewTeamInfo(rectDef_t *rect, float text_x, float text_y, float scale, vec4_t color, qhandle_t shader) {
line 1295
;1284:	int xx;
;1285:	float y;
;1286:	int i, j, len, count;
;1287:	const char *p;
;1288:	vec4_t		hcolor;
;1289:	float pwidth, lwidth, maxx, leftOver;
;1290:	clientInfo_t *ci;
;1291:	gitem_t	*item;
;1292:	qhandle_t h;
;1293:
;1294:	// max player name width
;1295:	pwidth = 0;
ADDRLP4 64
CNSTF4 0
ASGNF4
line 1296
;1296:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
ADDRGP4 numSortedTeamPlayers
INDIRI4
CNSTI4 8
LEI4 $1053
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRGP4 $1054
JUMPV
LABELV $1053
ADDRLP4 72
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
LABELV $1054
ADDRLP4 32
ADDRLP4 72
INDIRI4
ASGNI4
line 1297
;1297:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1058
JUMPV
LABELV $1055
line 1298
;1298:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 1944
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1299
;1299:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1060
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $1060
line 1300
;1300:			len = CG_Text_Width( ci->name, scale, 0);
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 80
INDIRI4
ASGNI4
line 1301
;1301:			if (len > pwidth)
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 64
INDIRF4
LEF4 $1063
line 1302
;1302:				pwidth = len;
ADDRLP4 64
ADDRLP4 28
INDIRI4
CVIF4 4
ASGNF4
LABELV $1063
line 1303
;1303:		}
LABELV $1060
line 1304
;1304:	}
LABELV $1056
line 1297
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1058
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $1055
line 1307
;1305:
;1306:	// max location name width
;1307:	lwidth = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 1308
;1308:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $1065
line 1309
;1309:		p = CG_ConfigString(CS_LOCATIONS + i);
ADDRLP4 8
INDIRI4
CNSTI4 8480
ADDI4
ARGI4
ADDRLP4 76
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 76
INDIRP4
ASGNP4
line 1310
;1310:		if (p && *p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1069
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1069
line 1311
;1311:			len = CG_Text_Width(p, scale, 0);
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 84
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 84
INDIRI4
ASGNI4
line 1312
;1312:			if (len > lwidth)
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 68
INDIRF4
LEF4 $1071
line 1313
;1313:				lwidth = len;
ADDRLP4 68
ADDRLP4 28
INDIRI4
CVIF4 4
ASGNF4
LABELV $1071
line 1314
;1314:		}
LABELV $1069
line 1315
;1315:	}
LABELV $1066
line 1308
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $1065
line 1317
;1316:
;1317:	y = rect->y;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1319
;1318:
;1319:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1076
JUMPV
LABELV $1073
line 1320
;1320:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 1944
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+440948
ADDP4
ASGNP4
line 1321
;1321:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1078
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $1078
line 1323
;1322:
;1323:			xx = rect->x + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1324
;1324:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1081
line 1325
;1325:				if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1085
line 1327
;1326:
;1327:					item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 80
INDIRP4
ASGNP4
line 1329
;1328:
;1329:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1087
line 1330
;1330:						CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, trap_R_RegisterShader( item->icon ) );
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1094713344
ASGNF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1331
;1331:						xx += PIC_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 1332
;1332:					}
LABELV $1087
line 1333
;1333:				}
LABELV $1085
line 1334
;1334:			}
LABELV $1082
line 1324
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $1081
line 1337
;1335:
;1336:			// FIXME: max of 3 powerups shown properly
;1337:			xx = rect->x + (PIC_WIDTH * 3) + 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1108344832
ADDF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ASGNI4
line 1339
;1338:
;1339:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
ADDRLP4 4
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 1340
;1340:			trap_R_SetColor(hcolor);
ADDRLP4 48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1341
;1341:			CG_DrawPic( xx, y + 1, PIC_WIDTH - 2, PIC_WIDTH - 2, cgs.media.heartShader );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRLP4 84
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRGP4 cgs+956380+1740
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1347
;1342:
;1343:			//Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
;1344:			//CG_Text_Paint(xx, y + text_y, scale, hcolor, st, 0, 0); 
;1345:
;1346:			// draw weapon icon
;1347:			xx += PIC_WIDTH + 1;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 1358
;1348:
;1349:// weapon used is not that useful, use the space for task
;1350:#if 0
;1351:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
;1352:				CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, cg_weapons[ci->curWeapon].weaponIcon );
;1353:			} else {
;1354:				CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, cgs.media.deferShader );
;1355:			}
;1356:#endif
;1357:
;1358:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1359
;1359:                        if(ci->isDead) {
ADDRLP4 4
INDIRP4
CNSTI4 1924
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1091
line 1360
;1360:                            h = cgs.media.deathShader;
ADDRLP4 44
ADDRGP4 cgs+956380+2468
INDIRI4
ASGNI4
line 1361
;1361:                        } else
ADDRGP4 $1092
JUMPV
LABELV $1091
line 1362
;1362:			if (cgs.orderPending) {
ADDRGP4 cgs+956324
INDIRI4
CNSTI4 0
EQI4 $1095
line 1364
;1363:				// blink the icon
;1364:				if ( cg.time > cgs.orderTime - 2500 && (cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cgs+956328
INDIRI4
CNSTI4 2500
SUBI4
LEI4 $1098
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1098
line 1365
;1365:					h = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 1366
;1366:				} else {
ADDRGP4 $1096
JUMPV
LABELV $1098
line 1367
;1367:					h = CG_StatusHandle(cgs.currentOrder);
ADDRGP4 cgs+956320
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 88
INDIRI4
ASGNI4
line 1368
;1368:				}
line 1369
;1369:			}	else {
ADDRGP4 $1096
JUMPV
LABELV $1095
line 1370
;1370:				h = CG_StatusHandle(ci->teamTask);
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 88
INDIRI4
ASGNI4
line 1371
;1371:			}
LABELV $1096
LABELV $1092
line 1373
;1372:
;1373:			if (h) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1104
line 1374
;1374:				CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, h);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1094713344
ASGNF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1375
;1375:			}
LABELV $1104
line 1377
;1376:
;1377:			xx += PIC_WIDTH + 1;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 1379
;1378:
;1379:			leftOver = rect->w - xx;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1380
;1380:			maxx = xx + leftOver / 3;
ADDRLP4 36
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
CNSTF4 1077936128
DIVF4
ADDF4
ASGNF4
line 1384
;1381:
;1382:
;1383:
;1384:			CG_Text_Paint_Limit(&maxx, xx, y + text_y, scale, color, ci->name, 0, 0); 
ADDRLP4 36
ARGP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 1386
;1385:
;1386:			p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 8480
ADDI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 88
INDIRP4
ASGNP4
line 1387
;1387:			if (!p || !*p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1108
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1106
LABELV $1108
line 1388
;1388:				p = "unknown";
ADDRLP4 20
ADDRGP4 $386
ASGNP4
line 1389
;1389:			}
LABELV $1106
line 1391
;1390:
;1391:			xx += leftOver / 3 + 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
CNSTF4 1077936128
DIVF4
CNSTF4 1073741824
ADDF4
ADDF4
CVFI4 4
ASGNI4
line 1392
;1392:			maxx = rect->w - 4;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1082130432
SUBF4
ASGNF4
line 1394
;1393:
;1394:			CG_Text_Paint_Limit(&maxx, xx, y + text_y, scale, color, p, 0, 0); 
ADDRLP4 36
ARGP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 1395
;1395:			y += text_y + 2;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1073741824
ADDF4
ADDF4
ASGNF4
line 1396
;1396:			if ( y + text_y + 2 > rect->y + rect->h ) {
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
CNSTF4 1073741824
ADDF4
ADDRLP4 96
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
LEF4 $1109
line 1397
;1397:				break;
ADDRGP4 $1075
JUMPV
LABELV $1109
line 1400
;1398:			}
;1399:
;1400:		}
LABELV $1078
line 1401
;1401:	}
LABELV $1074
line 1319
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1076
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $1073
LABELV $1075
line 1402
;1402:}
LABELV $1051
endproc CG_DrawNewTeamInfo 100 32
export CG_DrawTeamSpectators
proc CG_DrawTeamSpectators 24 32
line 1405
;1403:
;1404:
;1405:void CG_DrawTeamSpectators(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 1406
;1406:	if (cg.spectatorLen) {
ADDRGP4 cg+1889648
INDIRI4
CNSTI4 0
EQI4 $1112
line 1409
;1407:		float maxX;
;1408:
;1409:		if (cg.spectatorWidth == -1) {
ADDRGP4 cg+1889652
INDIRF4
CNSTF4 3212836864
NEF4 $1115
line 1410
;1410:			cg.spectatorWidth = 0;
ADDRGP4 cg+1889652
CNSTF4 0
ASGNF4
line 1411
;1411:			cg.spectatorPaintX = rect->x + 1;
ADDRGP4 cg+1889660
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1412
;1412:			cg.spectatorPaintX2 = -1;
ADDRGP4 cg+1889664
CNSTI4 -1
ASGNI4
line 1413
;1413:		}
LABELV $1115
line 1415
;1414:
;1415:		if (cg.spectatorOffset > cg.spectatorLen) {
ADDRGP4 cg+1889668
INDIRI4
ADDRGP4 cg+1889648
INDIRI4
LEI4 $1121
line 1416
;1416:			cg.spectatorOffset = 0;
ADDRGP4 cg+1889668
CNSTI4 0
ASGNI4
line 1417
;1417:			cg.spectatorPaintX = rect->x + 1;
ADDRGP4 cg+1889660
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1418
;1418:			cg.spectatorPaintX2 = -1;
ADDRGP4 cg+1889664
CNSTI4 -1
ASGNI4
line 1419
;1419:		}
LABELV $1121
line 1421
;1420:
;1421:		if (cg.time > cg.spectatorTime) {
ADDRGP4 cg+1868892
INDIRI4
ADDRGP4 cg+1889656
INDIRI4
LEI4 $1128
line 1422
;1422:			cg.spectatorTime = cg.time + 10;
ADDRGP4 cg+1889656
ADDRGP4 cg+1868892
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1423
;1423:			if (cg.spectatorPaintX <= rect->x + 2) {
ADDRGP4 cg+1889660
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
GTF4 $1134
line 1424
;1424:				if (cg.spectatorOffset < cg.spectatorLen) {
ADDRGP4 cg+1889668
INDIRI4
ADDRGP4 cg+1889648
INDIRI4
GEI4 $1137
line 1425
;1425:					cg.spectatorPaintX += CG_Text_Width(&cg.spectatorList[cg.spectatorOffset], scale, 1) - 1;
ADDRGP4 cg+1889668
INDIRI4
ADDRGP4 cg+1888624
ADDP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 cg+1889660
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
line 1426
;1426:					cg.spectatorOffset++;
ADDRLP4 12
ADDRGP4 cg+1889668
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1427
;1427:				} else {
ADDRGP4 $1135
JUMPV
LABELV $1137
line 1428
;1428:					cg.spectatorOffset = 0;
ADDRGP4 cg+1889668
CNSTI4 0
ASGNI4
line 1429
;1429:					if (cg.spectatorPaintX2 >= 0) {
ADDRGP4 cg+1889664
INDIRI4
CNSTI4 0
LTI4 $1146
line 1430
;1430:						cg.spectatorPaintX = cg.spectatorPaintX2;
ADDRGP4 cg+1889660
ADDRGP4 cg+1889664
INDIRI4
ASGNI4
line 1431
;1431:					} else {
ADDRGP4 $1147
JUMPV
LABELV $1146
line 1432
;1432:						cg.spectatorPaintX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 cg+1889660
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 1433
;1433:					}
LABELV $1147
line 1434
;1434:					cg.spectatorPaintX2 = -1;
ADDRGP4 cg+1889664
CNSTI4 -1
ASGNI4
line 1435
;1435:				}
line 1436
;1436:			} else {
ADDRGP4 $1135
JUMPV
LABELV $1134
line 1437
;1437:				cg.spectatorPaintX--;
ADDRLP4 4
ADDRGP4 cg+1889660
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1438
;1438:				if (cg.spectatorPaintX2 >= 0) {
ADDRGP4 cg+1889664
INDIRI4
CNSTI4 0
LTI4 $1154
line 1439
;1439:					cg.spectatorPaintX2--;
ADDRLP4 8
ADDRGP4 cg+1889664
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1440
;1440:				}
LABELV $1154
line 1441
;1441:			}
LABELV $1135
line 1442
;1442:		}
LABELV $1128
line 1444
;1443:
;1444:		maxX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1445
;1445:		CG_Text_Paint_Limit(&maxX, cg.spectatorPaintX, rect->y + rect->h - 3, scale, color, &cg.spectatorList[cg.spectatorOffset], 0, 0); 
ADDRLP4 0
ARGP4
ADDRGP4 cg+1889660
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 cg+1889668
INDIRI4
ADDRGP4 cg+1888624
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 1446
;1446:		if (cg.spectatorPaintX2 >= 0) {
ADDRGP4 cg+1889664
INDIRI4
CNSTI4 0
LTI4 $1161
line 1447
;1447:			float maxX2 = rect->x + rect->w - 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1448
;1448:			CG_Text_Paint_Limit(&maxX2, cg.spectatorPaintX2, rect->y + rect->h - 3, scale, color, cg.spectatorList, 0, cg.spectatorOffset); 
ADDRLP4 12
ARGP4
ADDRGP4 cg+1889664
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 cg+1888624
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 cg+1889668
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 1449
;1449:		}
LABELV $1161
line 1450
;1450:		if (cg.spectatorOffset && maxX > 0) {
ADDRGP4 cg+1889668
INDIRI4
CNSTI4 0
EQI4 $1167
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1167
line 1452
;1451:			// if we have an offset ( we are skipping the first part of the string ) and we fit the string
;1452:			if (cg.spectatorPaintX2 == -1) {
ADDRGP4 cg+1889664
INDIRI4
CNSTI4 -1
NEI4 $1168
line 1453
;1453:						cg.spectatorPaintX2 = rect->x + rect->w - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 cg+1889664
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 1454
;1454:			}
line 1455
;1455:		} else {
ADDRGP4 $1168
JUMPV
LABELV $1167
line 1456
;1456:			cg.spectatorPaintX2 = -1;
ADDRGP4 cg+1889664
CNSTI4 -1
ASGNI4
line 1457
;1457:		}
LABELV $1168
line 1459
;1458:
;1459:	}
LABELV $1112
line 1460
;1460:}
LABELV $1111
endproc CG_DrawTeamSpectators 24 32
export CG_DrawMedal
proc CG_DrawMedal 32 32
line 1464
;1461:
;1462:
;1463:
;1464:void CG_DrawMedal(int ownerDraw, rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 1465
;1465:	score_t *score = &cg.scores[cg.selectedScore];
ADDRLP4 8
ADDRGP4 cg+1872040
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 cg+1872052
ADDP4
ASGNP4
line 1466
;1466:	float value = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1467
;1467:	char *text = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1468
;1468:	color[3] = 0.25;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1470
;1469:
;1470:	switch (ownerDraw) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 53
LTI4 $1178
ADDRLP4 12
INDIRI4
CNSTI4 59
GTI4 $1188
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1189-212
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1189
address $1180
address $1181
address $1182
address $1183
address $1184
address $1185
address $1186
code
LABELV $1188
ADDRFP4 0
INDIRI4
CNSTI4 69
EQI4 $1187
ADDRGP4 $1178
JUMPV
LABELV $1180
line 1472
;1471:		case CG_ACCURACY:
;1472:			value = score->accuracy;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1473
;1473:			break;
ADDRGP4 $1179
JUMPV
LABELV $1181
line 1475
;1474:		case CG_ASSISTS:
;1475:			value = score->assistCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1476
;1476:			break;
ADDRGP4 $1179
JUMPV
LABELV $1182
line 1478
;1477:		case CG_DEFEND:
;1478:			value = score->defendCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1479
;1479:			break;
ADDRGP4 $1179
JUMPV
LABELV $1183
line 1481
;1480:		case CG_EXCELLENT:
;1481:			value = score->excellentCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1482
;1482:			break;
ADDRGP4 $1179
JUMPV
LABELV $1184
line 1484
;1483:		case CG_IMPRESSIVE:
;1484:			value = score->impressiveCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1485
;1485:			break;
ADDRGP4 $1179
JUMPV
LABELV $1185
line 1487
;1486:		case CG_PERFECT:
;1487:			value = score->perfect;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1488
;1488:			break;
ADDRGP4 $1179
JUMPV
LABELV $1186
line 1490
;1489:		case CG_GAUNTLET:
;1490:			value = score->guantletCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1491
;1491:			break;
ADDRGP4 $1179
JUMPV
LABELV $1187
line 1493
;1492:		case CG_CAPTURES:
;1493:			value = score->captures;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1494
;1494:			break;
LABELV $1178
LABELV $1179
line 1497
;1495:	}
;1496:
;1497:	if (value > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1191
line 1498
;1498:		if (ownerDraw != CG_PERFECT) {
ADDRFP4 0
INDIRI4
CNSTI4 58
EQI4 $1193
line 1499
;1499:			if (ownerDraw == CG_ACCURACY) {
ADDRFP4 0
INDIRI4
CNSTI4 53
NEI4 $1195
line 1500
;1500:				text = va("%i%%", (int)value);
ADDRGP4 $1197
ARGP4
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1501
;1501:				if (value > 50) {
ADDRLP4 0
INDIRF4
CNSTF4 1112014848
LEF4 $1194
line 1502
;1502:					color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1503
;1503:				}
line 1504
;1504:			} else {
ADDRGP4 $1194
JUMPV
LABELV $1195
line 1505
;1505:				text = va("%i", (int)value);
ADDRGP4 $216
ARGP4
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1506
;1506:				color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1507
;1507:			}
line 1508
;1508:		} else {
ADDRGP4 $1194
JUMPV
LABELV $1193
line 1509
;1509:			if (value) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1200
line 1510
;1510:				color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1511
;1511:			}
LABELV $1200
line 1512
;1512:			text = "Wow";
ADDRLP4 4
ADDRGP4 $1202
ASGNP4
line 1513
;1513:		}
LABELV $1194
line 1514
;1514:	}
LABELV $1191
line 1516
;1515:
;1516:	trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1517
;1517:	CG_DrawPic( rect->x, rect->y, rect->w, rect->h, shader );
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1519
;1518:
;1519:	if (text) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1203
line 1520
;1520:		color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1521
;1521:		value = CG_Text_Width(text, scale, 0);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
CVIF4 4
ASGNF4
line 1522
;1522:		CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h + 10 , scale, color, text, 0, 0, 0);
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1092616192
ADDF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1523
;1523:	}
LABELV $1203
line 1524
;1524:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1526
;1525:
;1526:}
LABELV $1175
endproc CG_DrawMedal 32 32
export CG_OwnerDraw
proc CG_OwnerDraw 20 24
line 1530
;1527:
;1528:	
;1529://
;1530:void CG_OwnerDraw(float x, float y, float w, float h, float text_x, float text_y, int ownerDraw, int ownerDrawFlags, int align, float special, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 1533
;1531:	rectDef_t rect;
;1532:
;1533:  if ( cg_drawStatus.integer == 0 ) {
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
NEI4 $1206
line 1534
;1534:		return;
ADDRGP4 $1205
JUMPV
LABELV $1206
line 1541
;1535:	}
;1536:
;1537:	//if (ownerDrawFlags != 0 && !CG_OwnerDrawVisible(ownerDrawFlags)) {
;1538:	//	return;
;1539:	//}
;1540:
;1541:  rect.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 1542
;1542:  rect.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
ASGNF4
line 1543
;1543:  rect.w = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
ASGNF4
line 1544
;1544:  rect.h = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 1546
;1545:
;1546:  switch (ownerDraw) {
ADDRLP4 16
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $1213
ADDRLP4 16
INDIRI4
CNSTI4 69
GTI4 $1213
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1269-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1269
address $1214
address $1216
address $1230
address $1233
address $1217
address $1219
address $1220
address $1226
address $1227
address $1223
address $1228
address $1229
address $1213
address $1213
address $1213
address $1213
address $1213
address $1213
address $1231
address $1232
address $1238
address $1239
address $1240
address $1241
address $1242
address $1243
address $1235
address $1234
address $1236
address $1237
address $1244
address $1246
address $1247
address $1248
address $1249
address $1250
address $1213
address $1252
address $1257
address $1224
address $1225
address $1251
address $1213
address $1213
address $1213
address $1254
address $1255
address $1256
address $1258
address $1259
address $1215
address $1218
address $1260
address $1260
address $1260
address $1260
address $1260
address $1260
address $1260
address $1261
address $1262
address $1221
address $1222
address $1253
address $1245
address $1266
address $1267
address $1268
address $1260
code
LABELV $1214
line 1548
;1547:  case CG_PLAYER_ARMOR_ICON:
;1548:    CG_DrawPlayerArmorIcon(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
ADDRGP4 CG_DrawPlayerArmorIcon
CALLV
pop
line 1549
;1549:    break;
ADDRGP4 $1213
JUMPV
LABELV $1215
line 1551
;1550:  case CG_PLAYER_ARMOR_ICON2D:
;1551:    CG_DrawPlayerArmorIcon(&rect, qtrue);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawPlayerArmorIcon
CALLV
pop
line 1552
;1552:    break;
ADDRGP4 $1213
JUMPV
LABELV $1216
line 1554
;1553:  case CG_PLAYER_ARMOR_VALUE:
;1554:    CG_DrawPlayerArmorValue(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerArmorValue
CALLV
pop
line 1555
;1555:    break;
ADDRGP4 $1213
JUMPV
LABELV $1217
line 1557
;1556:  case CG_PLAYER_AMMO_ICON:
;1557:    CG_DrawPlayerAmmoIcon(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
ADDRGP4 CG_DrawPlayerAmmoIcon
CALLV
pop
line 1558
;1558:    break;
ADDRGP4 $1213
JUMPV
LABELV $1218
line 1560
;1559:  case CG_PLAYER_AMMO_ICON2D:
;1560:    CG_DrawPlayerAmmoIcon(&rect, qtrue);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawPlayerAmmoIcon
CALLV
pop
line 1561
;1561:    break;
ADDRGP4 $1213
JUMPV
LABELV $1219
line 1563
;1562:  case CG_PLAYER_AMMO_VALUE:
;1563:    CG_DrawPlayerAmmoValue(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerAmmoValue
CALLV
pop
line 1564
;1564:    break;
ADDRGP4 $1213
JUMPV
LABELV $1220
line 1566
;1565:  case CG_SELECTEDPLAYER_HEAD:
;1566:    CG_DrawSelectedPlayerHead(&rect, ownerDrawFlags & CG_SHOW_2DONLY, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawSelectedPlayerHead
CALLV
pop
line 1567
;1567:    break;
ADDRGP4 $1213
JUMPV
LABELV $1221
line 1569
;1568:  case CG_VOICE_HEAD:
;1569:    CG_DrawSelectedPlayerHead(&rect, ownerDrawFlags & CG_SHOW_2DONLY, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawSelectedPlayerHead
CALLV
pop
line 1570
;1570:    break;
ADDRGP4 $1213
JUMPV
LABELV $1222
line 1572
;1571:  case CG_VOICE_NAME:
;1572:    CG_DrawSelectedPlayerName(&rect, scale, color, qtrue, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerName
CALLV
pop
line 1573
;1573:    break;
ADDRGP4 $1213
JUMPV
LABELV $1223
line 1575
;1574:  case CG_SELECTEDPLAYER_STATUS:
;1575:    CG_DrawSelectedPlayerStatus(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawSelectedPlayerStatus
CALLV
pop
line 1576
;1576:    break;
ADDRGP4 $1213
JUMPV
LABELV $1224
line 1578
;1577:  case CG_SELECTEDPLAYER_ARMOR:
;1578:    CG_DrawSelectedPlayerArmor(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerArmor
CALLV
pop
line 1579
;1579:    break;
ADDRGP4 $1213
JUMPV
LABELV $1225
line 1581
;1580:  case CG_SELECTEDPLAYER_HEALTH:
;1581:    CG_DrawSelectedPlayerHealth(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerHealth
CALLV
pop
line 1582
;1582:    break;
ADDRGP4 $1213
JUMPV
LABELV $1226
line 1584
;1583:  case CG_SELECTEDPLAYER_NAME:
;1584:    CG_DrawSelectedPlayerName(&rect, scale, color, qfalse, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerName
CALLV
pop
line 1585
;1585:    break;
ADDRGP4 $1213
JUMPV
LABELV $1227
line 1587
;1586:  case CG_SELECTEDPLAYER_LOCATION:
;1587:    CG_DrawSelectedPlayerLocation(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerLocation
CALLV
pop
line 1588
;1588:    break;
ADDRGP4 $1213
JUMPV
LABELV $1228
line 1590
;1589:  case CG_SELECTEDPLAYER_WEAPON:
;1590:    CG_DrawSelectedPlayerWeapon(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawSelectedPlayerWeapon
CALLV
pop
line 1591
;1591:    break;
ADDRGP4 $1213
JUMPV
LABELV $1229
line 1593
;1592:  case CG_SELECTEDPLAYER_POWERUP:
;1593:    CG_DrawSelectedPlayerPowerup(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerPowerup
CALLV
pop
line 1594
;1594:    break;
ADDRGP4 $1213
JUMPV
LABELV $1230
line 1596
;1595:  case CG_PLAYER_HEAD:
;1596:    CG_DrawPlayerHead(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
ADDRGP4 CG_DrawPlayerHead
CALLV
pop
line 1597
;1597:    break;
ADDRGP4 $1213
JUMPV
LABELV $1231
line 1599
;1598:  case CG_PLAYER_ITEM:
;1599:    CG_DrawPlayerItem(&rect, scale, ownerDrawFlags & CG_SHOW_2DONLY);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
ADDRGP4 CG_DrawPlayerItem
CALLV
pop
line 1600
;1600:    break;
ADDRGP4 $1213
JUMPV
LABELV $1232
line 1602
;1601:  case CG_PLAYER_SCORE:
;1602:    CG_DrawPlayerScore(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerScore
CALLV
pop
line 1603
;1603:    break;
ADDRGP4 $1213
JUMPV
LABELV $1233
line 1605
;1604:  case CG_PLAYER_HEALTH:
;1605:    CG_DrawPlayerHealth(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerHealth
CALLV
pop
line 1606
;1606:    break;
ADDRGP4 $1213
JUMPV
LABELV $1234
line 1608
;1607:  case CG_RED_SCORE:
;1608:    CG_DrawRedScore(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawRedScore
CALLV
pop
line 1609
;1609:    break;
ADDRGP4 $1213
JUMPV
LABELV $1235
line 1611
;1610:  case CG_BLUE_SCORE:
;1611:    CG_DrawBlueScore(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawBlueScore
CALLV
pop
line 1612
;1612:    break;
ADDRGP4 $1213
JUMPV
LABELV $1236
line 1614
;1613:  case CG_RED_NAME:
;1614:    CG_DrawRedName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawRedName
CALLV
pop
line 1615
;1615:    break;
ADDRGP4 $1213
JUMPV
LABELV $1237
line 1617
;1616:  case CG_BLUE_NAME:
;1617:    CG_DrawBlueName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawBlueName
CALLV
pop
line 1618
;1618:    break;
ADDRGP4 $1213
JUMPV
LABELV $1238
line 1620
;1619:  case CG_BLUE_FLAGHEAD:
;1620:    CG_DrawBlueFlagHead(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawBlueFlagHead
CALLV
pop
line 1621
;1621:    break;
ADDRGP4 $1213
JUMPV
LABELV $1239
line 1623
;1622:  case CG_BLUE_FLAGSTATUS:
;1623:    CG_DrawBlueFlagStatus(&rect, shader);
ADDRLP4 0
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawBlueFlagStatus
CALLV
pop
line 1624
;1624:    break;
ADDRGP4 $1213
JUMPV
LABELV $1240
line 1626
;1625:  case CG_BLUE_FLAGNAME:
;1626:    CG_DrawBlueFlagName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawBlueFlagName
CALLV
pop
line 1627
;1627:    break;
ADDRGP4 $1213
JUMPV
LABELV $1241
line 1629
;1628:  case CG_RED_FLAGHEAD:
;1629:    CG_DrawRedFlagHead(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRedFlagHead
CALLV
pop
line 1630
;1630:    break;
ADDRGP4 $1213
JUMPV
LABELV $1242
line 1632
;1631:  case CG_RED_FLAGSTATUS:
;1632:    CG_DrawRedFlagStatus(&rect, shader);
ADDRLP4 0
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawRedFlagStatus
CALLV
pop
line 1633
;1633:    break;
ADDRGP4 $1213
JUMPV
LABELV $1243
line 1635
;1634:  case CG_RED_FLAGNAME:
;1635:    CG_DrawRedFlagName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawRedFlagName
CALLV
pop
line 1636
;1636:    break;
ADDRGP4 $1213
JUMPV
LABELV $1244
line 1638
;1637:  case CG_HARVESTER_SKULLS:
;1638:    CG_HarvesterSkulls(&rect, scale, color, qfalse, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_HarvesterSkulls
CALLV
pop
line 1639
;1639:    break;
ADDRGP4 $1213
JUMPV
LABELV $1245
line 1641
;1640:  case CG_HARVESTER_SKULLS2D:
;1641:    CG_HarvesterSkulls(&rect, scale, color, qtrue, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_HarvesterSkulls
CALLV
pop
line 1642
;1642:    break;
ADDRGP4 $1213
JUMPV
LABELV $1246
line 1644
;1643:  case CG_ONEFLAG_STATUS:
;1644:    CG_OneFlagStatus(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_OneFlagStatus
CALLV
pop
line 1645
;1645:    break;
ADDRGP4 $1213
JUMPV
LABELV $1247
line 1647
;1646:  case CG_PLAYER_LOCATION:
;1647:    CG_DrawPlayerLocation(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerLocation
CALLV
pop
line 1648
;1648:    break;
ADDRGP4 $1213
JUMPV
LABELV $1248
line 1650
;1649:  case CG_TEAM_COLOR:
;1650:    CG_DrawTeamColor(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 CG_DrawTeamColor
CALLV
pop
line 1651
;1651:    break;
ADDRGP4 $1213
JUMPV
LABELV $1249
line 1653
;1652:  case CG_CTF_POWERUP:
;1653:    CG_DrawCTFPowerUp(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawCTFPowerUp
CALLV
pop
line 1654
;1654:    break;
ADDRGP4 $1213
JUMPV
LABELV $1250
line 1656
;1655:  case CG_AREA_POWERUP:
;1656:		CG_DrawAreaPowerUp(&rect, align, special, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 32
INDIRI4
ARGI4
ADDRFP4 36
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 CG_DrawAreaPowerUp
CALLV
pop
line 1657
;1657:    break;
ADDRGP4 $1213
JUMPV
LABELV $1251
line 1659
;1658:  case CG_PLAYER_STATUS:
;1659:    CG_DrawPlayerStatus(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawPlayerStatus
CALLV
pop
line 1660
;1660:    break;
ADDRGP4 $1213
JUMPV
LABELV $1252
line 1662
;1661:  case CG_PLAYER_HASFLAG:
;1662:    CG_DrawPlayerHasFlag(&rect, qfalse);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawPlayerHasFlag
CALLV
pop
line 1663
;1663:    break;
ADDRGP4 $1213
JUMPV
LABELV $1253
line 1665
;1664:  case CG_PLAYER_HASFLAG2D:
;1665:    CG_DrawPlayerHasFlag(&rect, qtrue);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawPlayerHasFlag
CALLV
pop
line 1666
;1666:    break;
ADDRGP4 $1213
JUMPV
LABELV $1254
line 1668
;1667:  case CG_AREA_SYSTEMCHAT:
;1668:    CG_DrawAreaSystemChat(&rect, scale, color, shader);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawAreaSystemChat
CALLV
pop
line 1669
;1669:    break;
ADDRGP4 $1213
JUMPV
LABELV $1255
line 1671
;1670:  case CG_AREA_TEAMCHAT:
;1671:    CG_DrawAreaTeamChat(&rect, scale, color, shader);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawAreaTeamChat
CALLV
pop
line 1672
;1672:    break;
ADDRGP4 $1213
JUMPV
LABELV $1256
line 1674
;1673:  case CG_AREA_CHAT:
;1674:    CG_DrawAreaChat(&rect, scale, color, shader);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawAreaChat
CALLV
pop
line 1675
;1675:    break;
ADDRGP4 $1213
JUMPV
LABELV $1257
line 1677
;1676:  case CG_GAME_TYPE:
;1677:    CG_DrawGameType(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawGameType
CALLV
pop
line 1678
;1678:    break;
ADDRGP4 $1213
JUMPV
LABELV $1258
line 1680
;1679:  case CG_GAME_STATUS:
;1680:    CG_DrawGameStatus(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawGameStatus
CALLV
pop
line 1681
;1681:		break;
ADDRGP4 $1213
JUMPV
LABELV $1259
line 1683
;1682:  case CG_KILLER:
;1683:    CG_DrawKiller(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawKiller
CALLV
pop
line 1684
;1684:		break;
ADDRGP4 $1213
JUMPV
LABELV $1260
line 1693
;1685:	case CG_ACCURACY:
;1686:	case CG_ASSISTS:
;1687:	case CG_DEFEND:
;1688:	case CG_EXCELLENT:
;1689:	case CG_IMPRESSIVE:
;1690:	case CG_PERFECT:
;1691:	case CG_GAUNTLET:
;1692:	case CG_CAPTURES:
;1693:		CG_DrawMedal(ownerDraw, &rect, scale, color, shader);
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawMedal
CALLV
pop
line 1694
;1694:		break;
ADDRGP4 $1213
JUMPV
LABELV $1261
line 1696
;1695:  case CG_SPECTATORS:
;1696:		CG_DrawTeamSpectators(&rect, scale, color, shader);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawTeamSpectators
CALLV
pop
line 1697
;1697:		break;
ADDRGP4 $1213
JUMPV
LABELV $1262
line 1699
;1698:  case CG_TEAMINFO:
;1699:		if (cg_currentSelectedPlayer.integer == numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
NEI4 $1213
line 1700
;1700:			CG_DrawNewTeamInfo(&rect, text_x, text_y, scale, color, shader);
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawNewTeamInfo
CALLV
pop
line 1701
;1701:		}
line 1702
;1702:		break;
ADDRGP4 $1213
JUMPV
LABELV $1266
line 1704
;1703:  case CG_CAPFRAGLIMIT:
;1704:    CG_DrawCapFragLimit(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawCapFragLimit
CALLV
pop
line 1705
;1705:		break;
ADDRGP4 $1213
JUMPV
LABELV $1267
line 1707
;1706:  case CG_1STPLACE:
;1707:    CG_Draw1stPlace(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_Draw1stPlace
CALLV
pop
line 1708
;1708:		break;
ADDRGP4 $1213
JUMPV
LABELV $1268
line 1710
;1709:  case CG_2NDPLACE:
;1710:    CG_Draw2ndPlace(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_Draw2ndPlace
CALLV
pop
line 1711
;1711:		break;
line 1713
;1712:  default:
;1713:    break;
LABELV $1213
line 1715
;1714:  }
;1715:}
LABELV $1205
endproc CG_OwnerDraw 20 24
export CG_MouseEvent
proc CG_MouseEvent 16 12
line 1717
;1716:
;1717:void CG_MouseEvent(int x, int y) {
line 1720
;1718:	int n;
;1719:
;1720:	if ( (cg.predictedPlayerState.pm_type == PM_NORMAL || cg.predictedPlayerState.pm_type == PM_SPECTATOR) && cg.showScores == qfalse) {
ADDRGP4 cg+1868928+4
INDIRI4
CNSTI4 0
EQI4 $1279
ADDRGP4 cg+1868928+4
INDIRI4
CNSTI4 2
NEI4 $1272
LABELV $1279
ADDRGP4 cg+1888436
INDIRI4
CNSTI4 0
NEI4 $1272
line 1721
;1721:    trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 1722
;1722:	return;
ADDRGP4 $1271
JUMPV
LABELV $1272
line 1725
;1723:	}
;1724:
;1725:	cgs.cursorX+= x;
ADDRLP4 4
ADDRGP4 cgs+956292
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 1726
;1726:	if (cgs.cursorX < 0)
ADDRGP4 cgs+956292
INDIRI4
CNSTI4 0
GEI4 $1281
line 1727
;1727:		cgs.cursorX = 0;
ADDRGP4 cgs+956292
CNSTI4 0
ASGNI4
ADDRGP4 $1282
JUMPV
LABELV $1281
line 1728
;1728:	else if (cgs.cursorX > 640)
ADDRGP4 cgs+956292
INDIRI4
CNSTI4 640
LEI4 $1285
line 1729
;1729:		cgs.cursorX = 640;
ADDRGP4 cgs+956292
CNSTI4 640
ASGNI4
LABELV $1285
LABELV $1282
line 1731
;1730:
;1731:	cgs.cursorY += y;
ADDRLP4 8
ADDRGP4 cgs+956296
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1732
;1732:	if (cgs.cursorY < 0)
ADDRGP4 cgs+956296
INDIRI4
CNSTI4 0
GEI4 $1290
line 1733
;1733:		cgs.cursorY = 0;
ADDRGP4 cgs+956296
CNSTI4 0
ASGNI4
ADDRGP4 $1291
JUMPV
LABELV $1290
line 1734
;1734:	else if (cgs.cursorY > 480)
ADDRGP4 cgs+956296
INDIRI4
CNSTI4 480
LEI4 $1294
line 1735
;1735:		cgs.cursorY = 480;
ADDRGP4 cgs+956296
CNSTI4 480
ASGNI4
LABELV $1294
LABELV $1291
line 1737
;1736:
;1737:	n = Display_CursorType(cgs.cursorX, cgs.cursorY);
ADDRGP4 cgs+956292
INDIRI4
ARGI4
ADDRGP4 cgs+956296
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Display_CursorType
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1738
;1738:	cgs.activeCursor = 0;
ADDRGP4 cgs+956316
CNSTI4 0
ASGNI4
line 1739
;1739:	if (n == CURSOR_ARROW) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $1301
line 1740
;1740:		cgs.activeCursor = cgs.media.selectCursor;
ADDRGP4 cgs+956316
ADDRGP4 cgs+956380+2508
INDIRI4
ASGNI4
line 1741
;1741:	} else if (n == CURSOR_SIZER) {
ADDRGP4 $1302
JUMPV
LABELV $1301
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1306
line 1742
;1742:		cgs.activeCursor = cgs.media.sizeCursor;
ADDRGP4 cgs+956316
ADDRGP4 cgs+956380+2512
INDIRI4
ASGNI4
line 1743
;1743:	}
LABELV $1306
LABELV $1302
line 1745
;1744:
;1745:  if (cgs.capturedItem) {
ADDRGP4 cgs+956312
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1311
line 1746
;1746:	  Display_MouseMove(cgs.capturedItem, x, y);
ADDRGP4 cgs+956312
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 1747
;1747:  } else {
ADDRGP4 $1312
JUMPV
LABELV $1311
line 1748
;1748:	  Display_MouseMove(NULL, cgs.cursorX, cgs.cursorY);
CNSTP4 0
ARGP4
ADDRGP4 cgs+956292
INDIRI4
ARGI4
ADDRGP4 cgs+956296
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 1749
;1749:  }
LABELV $1312
line 1751
;1750:
;1751:}
LABELV $1271
endproc CG_MouseEvent 16 12
export CG_HideTeamMenu
proc CG_HideTeamMenu 0 4
line 1759
;1752:
;1753:/*
;1754:==================
;1755:CG_HideTeamMenus
;1756:==================
;1757:
;1758:*/
;1759:void CG_HideTeamMenu( void ) {
line 1760
;1760:  Menus_CloseByName("teamMenu");
ADDRGP4 $1318
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 1761
;1761:  Menus_CloseByName("getMenu");
ADDRGP4 $1319
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 1762
;1762:}
LABELV $1317
endproc CG_HideTeamMenu 0 4
export CG_ShowTeamMenu
proc CG_ShowTeamMenu 0 4
line 1770
;1763:
;1764:/*
;1765:==================
;1766:CG_ShowTeamMenus
;1767:==================
;1768:
;1769:*/
;1770:void CG_ShowTeamMenu( void ) {
line 1771
;1771:  Menus_OpenByName("teamMenu");
ADDRGP4 $1318
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 1772
;1772:}
LABELV $1320
endproc CG_ShowTeamMenu 0 4
export CG_EventHandling
proc CG_EventHandling 0 0
line 1786
;1773:
;1774:
;1775:
;1776:
;1777:/*
;1778:==================
;1779:CG_EventHandling
;1780:==================
;1781: type 0 - no event handling
;1782:      1 - team menu
;1783:      2 - hud editor
;1784:
;1785:*/
;1786:void CG_EventHandling(int type) {
line 1787
;1787:	cgs.eventHandling = type;
ADDRGP4 cgs+956300
ADDRFP4 0
INDIRI4
ASGNI4
line 1788
;1788:  if (type == CGAME_EVENT_NONE) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $1323
line 1789
;1789:    CG_HideTeamMenu();
ADDRGP4 CG_HideTeamMenu
CALLV
pop
line 1790
;1790:  } else if (type == CGAME_EVENT_TEAMMENU) {
ADDRGP4 $1324
JUMPV
LABELV $1323
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $1325
line 1792
;1791:    //CG_ShowTeamMenu();
;1792:  } else if (type == CGAME_EVENT_SCOREBOARD) {
ADDRGP4 $1326
JUMPV
LABELV $1325
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $1327
line 1793
;1793:  }
LABELV $1327
LABELV $1326
LABELV $1324
line 1795
;1794:
;1795:}
LABELV $1321
endproc CG_EventHandling 0 0
export CG_KeyEvent
proc CG_KeyEvent 8 16
line 1799
;1796:
;1797:
;1798:
;1799:void CG_KeyEvent(int key, qboolean down) {
line 1801
;1800:
;1801:	if (!down) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1330
line 1802
;1802:		return;
ADDRGP4 $1329
JUMPV
LABELV $1330
line 1805
;1803:	}
;1804:
;1805:	if ( cg.predictedPlayerState.pm_type == PM_NORMAL || (cg.predictedPlayerState.pm_type == PM_SPECTATOR && cg.showScores == qfalse)) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+1868928+4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1339
ADDRGP4 cg+1868928+4
INDIRI4
CNSTI4 2
NEI4 $1332
ADDRGP4 cg+1888436
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1332
LABELV $1339
line 1806
;1806:		CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 1807
;1807:    trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 1808
;1808:		return;
ADDRGP4 $1329
JUMPV
LABELV $1332
line 1819
;1809:	}
;1810:
;1811:  //if (key == trap_Key_GetKey("teamMenu") || !Display_CaptureItem(cgs.cursorX, cgs.cursorY)) {
;1812:    // if we see this then we should always be visible
;1813:  //  CG_EventHandling(CGAME_EVENT_NONE);
;1814:  //  trap_Key_SetCatcher(0);
;1815:  //}
;1816:
;1817:
;1818:
;1819:  Display_HandleKey(key, down, cgs.cursorX, cgs.cursorY);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+956292
INDIRI4
ARGI4
ADDRGP4 cgs+956296
INDIRI4
ARGI4
ADDRGP4 Display_HandleKey
CALLV
pop
line 1821
;1820:
;1821:	if (cgs.capturedItem) {
ADDRGP4 cgs+956312
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1342
line 1822
;1822:		cgs.capturedItem = NULL;
ADDRGP4 cgs+956312
CNSTP4 0
ASGNP4
line 1823
;1823:	}	else {
ADDRGP4 $1343
JUMPV
LABELV $1342
line 1824
;1824:		if (key == K_MOUSE2 && down) {
ADDRFP4 0
INDIRI4
CNSTI4 179
NEI4 $1346
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1346
line 1825
;1825:			cgs.capturedItem = Display_CaptureItem(cgs.cursorX, cgs.cursorY);
ADDRGP4 cgs+956292
INDIRI4
ARGI4
ADDRGP4 cgs+956296
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Display_CaptureItem
CALLP4
ASGNP4
ADDRGP4 cgs+956312
ADDRLP4 4
INDIRP4
ASGNP4
line 1826
;1826:		}
LABELV $1346
line 1827
;1827:	}
LABELV $1343
line 1828
;1828:}
LABELV $1329
endproc CG_KeyEvent 8 16
export CG_ClientNumFromName
proc CG_ClientNumFromName 12 8
line 1830
;1829:
;1830:int CG_ClientNumFromName(const char *p) {
line 1832
;1831:  int i;
;1832:  for (i = 0; i < cgs.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1355
JUMPV
LABELV $1352
line 1833
;1833:    if (cgs.clientinfo[i].infoValid && Q_stricmp(cgs.clientinfo[i].name, p) == 0) {
ADDRLP4 4
CNSTI4 1944
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1357
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+440948+4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1357
line 1834
;1834:      return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1351
JUMPV
LABELV $1357
line 1836
;1835:    }
;1836:  }
LABELV $1353
line 1832
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1355
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+339072
INDIRI4
LTI4 $1352
line 1837
;1837:  return -1;
CNSTI4 -1
RETI4
LABELV $1351
endproc CG_ClientNumFromName 12 8
export CG_ShowResponseHead
proc CG_ShowResponseHead 0 8
line 1840
;1838:}
;1839:
;1840:void CG_ShowResponseHead(void) {
line 1841
;1841:  Menus_OpenByName("voiceMenu");
ADDRGP4 $1363
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 1842
;1842:	trap_Cvar_Set("cl_conXOffset", "72");
ADDRGP4 $1364
ARGP4
ADDRGP4 $1365
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1843
;1843:	cg.voiceTime = cg.time;
ADDRGP4 cg+1952708
ADDRGP4 cg+1868892
INDIRI4
ASGNI4
line 1844
;1844:}
LABELV $1362
endproc CG_ShowResponseHead 0 8
export CG_RunMenuScript
proc CG_RunMenuScript 0 0
line 1846
;1845:
;1846:void CG_RunMenuScript(char **args) {
line 1847
;1847:}
LABELV $1368
endproc CG_RunMenuScript 0 0
export CG_GetTeamColor
proc CG_GetTeamColor 8 0
line 1850
;1848:
;1849:
;1850:void CG_GetTeamColor(vec4_t *color) {
line 1851
;1851:  if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1370
line 1852
;1852:    (*color)[0] = 1.0f;
ADDRFP4 0
INDIRP4
CNSTF4 1065353216
ASGNF4
line 1853
;1853:    (*color)[3] = 0.25f;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1854
;1854:    (*color)[1] = (*color)[2] = 0.0f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1855
;1855:  } else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 $1371
JUMPV
LABELV $1370
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1373
line 1856
;1856:    (*color)[0] = (*color)[1] = 0.0f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1857
;1857:    (*color)[2] = 1.0f;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 1858
;1858:    (*color)[3] = 0.25f;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1859
;1859:  } else {
ADDRGP4 $1374
JUMPV
LABELV $1373
line 1860
;1860:    (*color)[0] = (*color)[2] = 0.0f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1861
;1861:    (*color)[1] = 0.17f;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1043207291
ASGNF4
line 1862
;1862:    (*color)[3] = 0.25f;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1863
;1863:	}
LABELV $1374
LABELV $1371
line 1864
;1864:}
LABELV $1369
endproc CG_GetTeamColor 8 0
import cgDC
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Free
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
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
import CG_Text_PaintChar
import CG_Draw3DModelCopy
import CG_Draw3DModel
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
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
LABELV $1365
byte 1 55
byte 1 50
byte 1 0
align 1
LABELV $1364
byte 1 99
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 88
byte 1 79
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1363
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1319
byte 1 103
byte 1 101
byte 1 116
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1318
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1202
byte 1 87
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1197
byte 1 37
byte 1 105
byte 1 37
byte 1 37
byte 1 0
align 1
LABELV $1021
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
LABELV $1017
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
LABELV $1013
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
LABELV $1009
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
LABELV $1005
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
LABELV $1001
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
LABELV $997
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
LABELV $993
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
LABELV $989
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
LABELV $985
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
LABELV $981
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
LABELV $977
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $968
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $964
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $957
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $949
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $929
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $915
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $911
byte 1 0
align 1
LABELV $477
byte 1 45
byte 1 0
align 1
LABELV $386
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $216
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $164
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $161
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $160
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
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
LABELV $159
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $141
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $136
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
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
byte 1 10
byte 1 0
align 1
LABELV $130
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $129
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $127
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $126
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $123
byte 1 111
byte 1 110
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $121
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 49
byte 1 48
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $120
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $119
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $117
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 57
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 57
byte 1 0
align 1
LABELV $116
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $115
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $113
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 56
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 56
byte 1 0
align 1
LABELV $112
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $111
byte 1 111
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $109
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 55
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 55
byte 1 0
align 1
LABELV $108
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $107
byte 1 111
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
