code
proc PlayerIcon 80 20
file "../../../code/q3_ui/ui_splevel.c"
line 105
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:SINGLE PLAYER LEVEL SELECT MENU
;7:
;8:=============================================================================
;9:*/
;10:
;11:
;12:
;13:
;14:#include "ui_local.h"
;15:
;16:
;17:#define ART_LEVELFRAME_FOCUS		"menu/art/maps_select"
;18:#define ART_LEVELFRAME_SELECTED		"menu/art/maps_selected"
;19:#define ART_ARROW					"menu/art/narrow_0"
;20:#define ART_ARROW_FOCUS				"menu/art/narrow_1"
;21:#define ART_MAP_UNKNOWN				"menu/art/unknownmap"
;22:#define ART_MAP_COMPLETE1			"menu/art/level_complete1"
;23:#define ART_MAP_COMPLETE2			"menu/art/level_complete2"
;24:#define ART_MAP_COMPLETE3			"menu/art/level_complete3"
;25:#define ART_MAP_COMPLETE4			"menu/art/level_complete4"
;26:#define ART_MAP_COMPLETE5			"menu/art/level_complete5"
;27:#define ART_BACK0					"menu/art/back_0"
;28:#define ART_BACK1					"menu/art/back_1"	
;29:#define ART_FIGHT0					"menu/art/fight_0"
;30:#define ART_FIGHT1					"menu/art/fight_1"
;31:#define ART_RESET0					"menu/art/reset_0"
;32:#define ART_RESET1					"menu/art/reset_1"	
;33:#define ART_CUSTOM0					"menu/art/skirmish_0"
;34:#define ART_CUSTOM1					"menu/art/skirmish_1"
;35:
;36:#define ID_LEFTARROW		10
;37:#define ID_PICTURE0			11
;38:#define ID_PICTURE1			12
;39:#define ID_PICTURE2			13
;40:#define ID_PICTURE3			14
;41:#define ID_RIGHTARROW		15
;42:#define ID_PLAYERPIC		16
;43:#define ID_BACK				23
;44:#define ID_RESET			24
;45:#define ID_CUSTOM			25
;46:#define ID_NEXT				26
;47:
;48:#define PLAYER_Y			314
;49:#define AWARDS_Y			(PLAYER_Y + 26)
;50:
;51:
;52:
;53:typedef struct {
;54:	menuframework_s	menu;
;55:	menutext_s		item_banner;
;56:	menubitmap_s	item_leftarrow;
;57:	menubitmap_s	item_maps[4];
;58:	menubitmap_s	item_rightarrow;
;59:	menubitmap_s	item_player;
;60:	menubitmap_s	item_back;
;61:	menubitmap_s	item_reset;
;62:	menubitmap_s	item_custom;
;63:	menubitmap_s	item_next;
;64:	menubitmap_s	item_null;
;65:
;66:	qboolean		reinit;
;67:
;68:	const char *	selectedArenaInfo;
;69:	int				numMaps;
;70:	char			levelPicNames[4][MAX_QPATH];
;71:	char			levelNames[4][16];
;72:	int				levelScores[4];
;73:	int				levelScoresSkill[4];
;74:	qhandle_t		levelSelectedPic;
;75:	qhandle_t		levelFocusPic;
;76:	qhandle_t		levelCompletePic[5];
;77:
;78:	char			playerModel[MAX_QPATH];
;79:	char			playerPicName[MAX_QPATH];
;80:
;81:    awardInfo_t		awards;
;82:
;83:	int				numBots;
;84:	qhandle_t		botPics[7];
;85:	char			botNames[7][10];
;86:} levelMenuInfo_t;
;87:
;88:static levelMenuInfo_t	levelMenuInfo;
;89:
;90:static int	selectedArenaSet;
;91:static int	selectedArena;
;92:static int	currentSet;
;93:static int	currentGame;
;94:static int	trainingTier;
;95:static int	finalTier;
;96:static int	minTier;
;97:static int	maxTier;
;98:
;99:
;100:/*
;101:=================
;102:PlayerIcon
;103:=================
;104:*/
;105:static void PlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 109
;106:	char	*skin;
;107:	char	model[MAX_QPATH];
;108:
;109:	Q_strncpyz( model, modelAndSkin, sizeof(model));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 110
;110:	skin = strrchr( model, '/' );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 68
ADDRGP4 strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 111
;111:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $82
line 112
;112:		*skin++ = '\0';
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI1 0
ASGNI1
line 113
;113:	}
ADDRGP4 $83
JUMPV
LABELV $82
line 114
;114:	else {
line 115
;115:		skin = "default";
ADDRLP4 0
ADDRGP4 $84
ASGNP4
line 116
;116:	}
LABELV $83
line 118
;117:
;118:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $85
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 120
;119:
;120:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $86
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $84
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $86
line 121
;121:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $88
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 122
;122:	}
LABELV $86
line 123
;123:}
LABELV $81
endproc PlayerIcon 80 20
proc PlayerIconHandle 68 12
line 131
;124:
;125:
;126:/*
;127:=================
;128:PlayerIconhandle
;129:=================
;130:*/
;131:static qhandle_t PlayerIconHandle( const char *modelAndSkin ) {
line 134
;132:	char	iconName[MAX_QPATH];
;133:
;134:	PlayerIcon( modelAndSkin, iconName, sizeof(iconName) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 135
;135:	return trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 0
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
LABELV $89
endproc PlayerIconHandle 68 12
proc UI_SPLevelMenu_SetBots 1068 12
line 144
;136:}
;137:
;138:
;139:/*
;140:=================
;141:UI_SPLevelMenu_SetBots
;142:=================
;143:*/
;144:static void UI_SPLevelMenu_SetBots( void ) {
line 150
;145:	char	*p;
;146:	char	*bot;
;147:	char	*botInfo;
;148:	char	bots[MAX_INFO_STRING];
;149:
;150:	levelMenuInfo.numBots = 0;
ADDRGP4 levelMenuInfo+3852
CNSTI4 0
ASGNI4
line 151
;151:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $92
line 152
;152:		return;
ADDRGP4 $90
JUMPV
LABELV $92
line 155
;153:	}
;154:
;155:	Q_strncpyz( bots, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "bots" ), sizeof(bots) );
ADDRGP4 levelMenuInfo+2576
INDIRP4
ARGP4
ADDRGP4 $95
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 157
;156:
;157:	p = &bots[0];
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $97
JUMPV
line 158
;158:	while( *p && levelMenuInfo.numBots < 7 ) {
LABELV $100
line 160
;159:		//skip spaces
;160:		while( *p && *p == ' ' ) {
line 161
;161:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 162
;162:		}
LABELV $101
line 160
ADDRLP4 1040
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $103
ADDRLP4 1040
INDIRI4
CNSTI4 32
EQI4 $100
LABELV $103
line 163
;163:		if( !p ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $104
line 164
;164:			break;
ADDRGP4 $98
JUMPV
LABELV $104
line 168
;165:		}
;166:
;167:		// mark start of bot name
;168:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $107
JUMPV
LABELV $106
line 171
;169:
;170:		// skip until space of null
;171:		while( *p && *p != ' ' ) {
line 172
;172:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 173
;173:		}
LABELV $107
line 171
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $109
ADDRLP4 1044
INDIRI4
CNSTI4 32
NEI4 $106
LABELV $109
line 174
;174:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $110
line 175
;175:			*p++ = 0;
ADDRLP4 1048
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1048
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI1 0
ASGNI1
line 176
;176:		}
LABELV $110
line 178
;177:
;178:		botInfo = UI_GetBotInfoByName( bot );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 UI_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1048
INDIRP4
ASGNP4
line 179
;179:		if( botInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $112
line 180
;180:			levelMenuInfo.botPics[levelMenuInfo.numBots] = PlayerIconHandle( Info_ValueForKey( botInfo, "model" ) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 PlayerIconHandle
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+3852
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+3856
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
line 181
;181:			Q_strncpyz( levelMenuInfo.botNames[levelMenuInfo.numBots], Info_ValueForKey( botInfo, "name" ), 10 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
CNSTI4 10
ASGNI4
ADDRLP4 1064
INDIRI4
ADDRGP4 levelMenuInfo+3852
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+3884
ADDP4
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 182
;182:		}
ADDRGP4 $113
JUMPV
LABELV $112
line 183
;183:		else {
line 184
;184:			levelMenuInfo.botPics[levelMenuInfo.numBots] = 0;
ADDRGP4 levelMenuInfo+3852
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+3856
ADDP4
CNSTI4 0
ASGNI4
line 185
;185:			Q_strncpyz( levelMenuInfo.botNames[levelMenuInfo.numBots], bot, 10 );
ADDRLP4 1052
CNSTI4 10
ASGNI4
ADDRLP4 1052
INDIRI4
ADDRGP4 levelMenuInfo+3852
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+3884
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 186
;186:		}
LABELV $113
line 187
;187:		Q_CleanStr( levelMenuInfo.botNames[levelMenuInfo.numBots] );
CNSTI4 10
ADDRGP4 levelMenuInfo+3852
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+3884
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 188
;188:		levelMenuInfo.numBots++;
ADDRLP4 1052
ADDRGP4 levelMenuInfo+3852
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 189
;189:	}
LABELV $97
line 158
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $127
ADDRGP4 levelMenuInfo+3852
INDIRI4
CNSTI4 7
LTI4 $101
LABELV $127
LABELV $98
line 190
;190:}
LABELV $90
endproc UI_SPLevelMenu_SetBots 1068 12
proc UI_SPLevelMenu_SetMenuArena 84 12
line 198
;191:
;192:
;193:/*
;194:=================
;195:UI_SPLevelMenu_SetMenuItems
;196:=================
;197:*/
;198:static void UI_SPLevelMenu_SetMenuArena( int n, int level, const char *arenaInfo ) {
line 201
;199:	char		map[MAX_QPATH];
;200:
;201:	Q_strncpyz( map, Info_ValueForKey( arenaInfo, "map" ), sizeof(map) );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $129
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 203
;202:
;203:	Q_strncpyz( levelMenuInfo.levelNames[n], map, sizeof(levelMenuInfo.levelNames[n]) );
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2840
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 204
;204:	Q_strupr( levelMenuInfo.levelNames[n] );
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2840
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 206
;205:
;206:	UI_GetBestScore( level, &levelMenuInfo.levelScores[n], &levelMenuInfo.levelScoresSkill[n] );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 68
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRGP4 levelMenuInfo+2904
ADDP4
ARGP4
ADDRLP4 68
INDIRI4
ADDRGP4 levelMenuInfo+2920
ADDP4
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 207
;207:	if( levelMenuInfo.levelScores[n] > 8 ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2904
ADDP4
INDIRI4
CNSTI4 8
LEI4 $135
line 208
;208:		levelMenuInfo.levelScores[n] = 8;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2904
ADDP4
CNSTI4 8
ASGNI4
line 209
;209:	}
LABELV $135
line 211
;210:
;211:	strcpy( levelMenuInfo.levelPicNames[n], va( "levelshots/%s.tga", map ) );
ADDRGP4 $140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2584
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 212
;212:	if( !trap_R_RegisterShaderNoMip( levelMenuInfo.levelPicNames[n] ) ) {
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2584
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $141
line 213
;213:		strcpy( levelMenuInfo.levelPicNames[n], ART_MAP_UNKNOWN );
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2584
ADDP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 214
;214:	}
LABELV $141
line 215
;215:	levelMenuInfo.item_maps[n].shader = 0;
CNSTI4 116
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1296+96
ADDP4
CNSTI4 0
ASGNI4
line 216
;216:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $148
line 217
;217:		levelMenuInfo.item_maps[n].generic.flags |= QMF_GRAYED;
ADDRLP4 80
CNSTI4 116
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1296+72
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 218
;218:	}
ADDRGP4 $149
JUMPV
LABELV $148
line 219
;219:	else {
line 220
;220:		levelMenuInfo.item_maps[n].generic.flags &= ~QMF_GRAYED;
ADDRLP4 80
CNSTI4 116
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1296+72
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 221
;221:	}
LABELV $149
line 223
;222:
;223:	levelMenuInfo.item_maps[n].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 80
CNSTI4 116
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1296+72
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 224
;224:}
LABELV $128
endproc UI_SPLevelMenu_SetMenuArena 84 12
proc UI_SPLevelMenu_SetMenuItems 44 12
line 226
;225:
;226:static void UI_SPLevelMenu_SetMenuItems( void ) {
line 231
;227:	int			n;
;228:	int			level;
;229:	const char	*arenaInfo;
;230:
;231:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $157
line 232
;232:		selectedArena = -1;
ADDRGP4 selectedArena
CNSTI4 -1
ASGNI4
line 233
;233:	}
ADDRGP4 $158
JUMPV
LABELV $157
line 234
;234:	else if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $159
line 235
;235:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 236
;236:	}
LABELV $159
LABELV $158
line 238
;237:
;238:	if( selectedArenaSet == trainingTier || selectedArenaSet == finalTier ) {
ADDRLP4 12
ADDRGP4 selectedArenaSet
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 trainingTier
INDIRI4
EQI4 $163
ADDRLP4 12
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $161
LABELV $163
line 239
;239:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 240
;240:	}
LABELV $161
line 242
;241:
;242:	if( selectedArena != -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
EQI4 $164
line 243
;243:		trap_Cvar_SetValue( "ui_spSelection", selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 $166
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 244
;244:	}
LABELV $164
line 246
;245:
;246:	if( selectedArenaSet == trainingTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 trainingTier
INDIRI4
NEI4 $167
line 247
;247:		arenaInfo = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $169
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 248
;248:		level = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $170
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 249
;249:		UI_SPLevelMenu_SetMenuArena( 0, level, arenaInfo );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 250
;250:		levelMenuInfo.selectedArenaInfo = arenaInfo;
ADDRGP4 levelMenuInfo+2576
ADDRLP4 8
INDIRP4
ASGNP4
line 252
;251:
;252:		levelMenuInfo.item_maps[0].generic.x = 256;
ADDRGP4 levelMenuInfo+1296+28
CNSTI4 256
ASGNI4
line 253
;253:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+1296
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 254
;254:		levelMenuInfo.item_maps[0].generic.bottom += 32;
ADDRLP4 28
ADDRGP4 levelMenuInfo+1296+56
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 255
;255:		levelMenuInfo.numMaps = 1;
ADDRGP4 levelMenuInfo+2580
CNSTI4 1
ASGNI4
line 257
;256:
;257:		levelMenuInfo.item_maps[1].generic.flags |= QMF_INACTIVE;
ADDRLP4 32
ADDRGP4 levelMenuInfo+1296+116+72
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 258
;258:		levelMenuInfo.item_maps[2].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRGP4 levelMenuInfo+1296+232+72
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 259
;259:		levelMenuInfo.item_maps[3].generic.flags |= QMF_INACTIVE;
ADDRLP4 40
ADDRGP4 levelMenuInfo+1296+348+72
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 260
;260:		levelMenuInfo.levelPicNames[1][0] = 0;
ADDRGP4 levelMenuInfo+2584+64
CNSTI1 0
ASGNI1
line 261
;261:		levelMenuInfo.levelPicNames[2][0] = 0;
ADDRGP4 levelMenuInfo+2584+128
CNSTI1 0
ASGNI1
line 262
;262:		levelMenuInfo.levelPicNames[3][0] = 0;
ADDRGP4 levelMenuInfo+2584+192
CNSTI1 0
ASGNI1
line 263
;263:		levelMenuInfo.item_maps[1].shader = 0;
ADDRGP4 levelMenuInfo+1296+116+96
CNSTI4 0
ASGNI4
line 264
;264:		levelMenuInfo.item_maps[2].shader = 0;
ADDRGP4 levelMenuInfo+1296+232+96
CNSTI4 0
ASGNI4
line 265
;265:		levelMenuInfo.item_maps[3].shader = 0;
ADDRGP4 levelMenuInfo+1296+348+96
CNSTI4 0
ASGNI4
line 266
;266:	}
ADDRGP4 $168
JUMPV
LABELV $167
line 267
;267:	else if( selectedArenaSet == finalTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $202
line 268
;268:		arenaInfo = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $204
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 269
;269:		level = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $170
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 270
;270:		UI_SPLevelMenu_SetMenuArena( 0, level, arenaInfo );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 271
;271:		levelMenuInfo.selectedArenaInfo = arenaInfo;
ADDRGP4 levelMenuInfo+2576
ADDRLP4 8
INDIRP4
ASGNP4
line 273
;272:
;273:		levelMenuInfo.item_maps[0].generic.x = 256;
ADDRGP4 levelMenuInfo+1296+28
CNSTI4 256
ASGNI4
line 274
;274:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+1296
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 275
;275:		levelMenuInfo.item_maps[0].generic.bottom += 32;
ADDRLP4 28
ADDRGP4 levelMenuInfo+1296+56
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 276
;276:		levelMenuInfo.numMaps = 1;
ADDRGP4 levelMenuInfo+2580
CNSTI4 1
ASGNI4
line 278
;277:
;278:		levelMenuInfo.item_maps[1].generic.flags |= QMF_INACTIVE;
ADDRLP4 32
ADDRGP4 levelMenuInfo+1296+116+72
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 279
;279:		levelMenuInfo.item_maps[2].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRGP4 levelMenuInfo+1296+232+72
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 280
;280:		levelMenuInfo.item_maps[3].generic.flags |= QMF_INACTIVE;
ADDRLP4 40
ADDRGP4 levelMenuInfo+1296+348+72
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 281
;281:		levelMenuInfo.levelPicNames[1][0] = 0;
ADDRGP4 levelMenuInfo+2584+64
CNSTI1 0
ASGNI1
line 282
;282:		levelMenuInfo.levelPicNames[2][0] = 0;
ADDRGP4 levelMenuInfo+2584+128
CNSTI1 0
ASGNI1
line 283
;283:		levelMenuInfo.levelPicNames[3][0] = 0;
ADDRGP4 levelMenuInfo+2584+192
CNSTI1 0
ASGNI1
line 284
;284:		levelMenuInfo.item_maps[1].shader = 0;
ADDRGP4 levelMenuInfo+1296+116+96
CNSTI4 0
ASGNI4
line 285
;285:		levelMenuInfo.item_maps[2].shader = 0;
ADDRGP4 levelMenuInfo+1296+232+96
CNSTI4 0
ASGNI4
line 286
;286:		levelMenuInfo.item_maps[3].shader = 0;
ADDRGP4 levelMenuInfo+1296+348+96
CNSTI4 0
ASGNI4
line 287
;287:	}
ADDRGP4 $203
JUMPV
LABELV $202
line 288
;288:	else {
line 289
;289:		levelMenuInfo.item_maps[0].generic.x = 46;
ADDRGP4 levelMenuInfo+1296+28
CNSTI4 46
ASGNI4
line 290
;290:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+1296
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 291
;291:		levelMenuInfo.item_maps[0].generic.bottom += 18;
ADDRLP4 16
ADDRGP4 levelMenuInfo+1296+56
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 292
;292:		levelMenuInfo.numMaps = 4;
ADDRGP4 levelMenuInfo+2580
CNSTI4 4
ASGNI4
line 294
;293:
;294:		for ( n = 0; n < 4; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $242
line 295
;295:			level = selectedArenaSet * ARENAS_PER_TIER + n;
ADDRLP4 4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 296
;296:			arenaInfo = UI_GetArenaInfoByNumber( level );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 297
;297:			UI_SPLevelMenu_SetMenuArena( n, level, arenaInfo );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 298
;298:		}
LABELV $243
line 294
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $242
line 300
;299:
;300:		if( selectedArena != -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
EQI4 $246
line 301
;301:			levelMenuInfo.selectedArenaInfo = UI_GetArenaInfoByNumber( selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+2576
ADDRLP4 20
INDIRP4
ASGNP4
line 302
;302:		}
LABELV $246
line 303
;303:	}
LABELV $203
LABELV $168
line 306
;304:
;305:	// enable/disable arrows when they are valid/invalid
;306:	if ( selectedArenaSet == minTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 minTier
INDIRI4
NEI4 $249
line 307
;307:		levelMenuInfo.item_leftarrow.generic.flags |= ( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+1180+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 308
;308:	}
ADDRGP4 $250
JUMPV
LABELV $249
line 309
;309:	else {
line 310
;310:		levelMenuInfo.item_leftarrow.generic.flags &= ~( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+1180+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 311
;311:	}
LABELV $250
line 313
;312:
;313:	if ( selectedArenaSet == maxTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 maxTier
INDIRI4
NEI4 $255
line 314
;314:		levelMenuInfo.item_rightarrow.generic.flags |= ( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+1760+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 315
;315:	}
ADDRGP4 $256
JUMPV
LABELV $255
line 316
;316:	else {
line 317
;317:		levelMenuInfo.item_rightarrow.generic.flags &= ~( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+1760+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 318
;318:	}
LABELV $256
line 320
;319:
;320:	UI_SPLevelMenu_SetBots();
ADDRGP4 UI_SPLevelMenu_SetBots
CALLV
pop
line 321
;321:}
LABELV $156
endproc UI_SPLevelMenu_SetMenuItems 44 12
proc UI_SPLevelMenu_ResetDraw 0 20
line 329
;322:
;323:
;324:/*
;325:=================
;326:UI_SPLevelMenu_ResetEvent
;327:=================
;328:*/
;329:static void UI_SPLevelMenu_ResetDraw( void ) {
line 330
;330:	UI_DrawString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This resets all of the", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 0
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 356
ADDI4
ARGI4
ADDRGP4 $263
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 331
;331:	UI_DrawString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "single player game variables.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 1
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 356
ADDI4
ARGI4
ADDRGP4 $265
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 332
;332:	UI_DrawString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 2, "Do this only if you want to", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
ADDRGP4 cl_propheight+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 356
ADDI4
ARGI4
ADDRGP4 $267
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 333
;333:	UI_DrawString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 3, "start over from the beginning.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 3
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CNSTI4 356
ADDI4
ARGI4
ADDRGP4 $269
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 334
;334:}
LABELV $261
endproc UI_SPLevelMenu_ResetDraw 0 20
proc UI_SPLevelMenu_ResetAction 0 8
line 336
;335:
;336:static void UI_SPLevelMenu_ResetAction( qboolean result ) {
line 337
;337:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $271
line 338
;338:		return;
ADDRGP4 $270
JUMPV
LABELV $271
line 342
;339:	}
;340:
;341:	// clear game variables
;342:	UI_NewGame();
ADDRGP4 UI_NewGame
CALLV
pop
line 343
;343:	trap_Cvar_SetValue( "ui_spSelection", -4 );
ADDRGP4 $166
ARGP4
CNSTF4 3229614080
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 346
;344:
;345:	// make the level select menu re-initialize
;346:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 347
;347:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 348
;348:}
LABELV $270
endproc UI_SPLevelMenu_ResetAction 0 8
proc UI_SPLevelMenu_ResetEvent 0 12
line 351
;349:
;350:static void UI_SPLevelMenu_ResetEvent( void* ptr, int event )
;351:{
line 352
;352:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $274
line 353
;353:		return;
ADDRGP4 $273
JUMPV
LABELV $274
line 356
;354:	}
;355:
;356:	UI_ConfirmMenu( "RESET GAME?", UI_SPLevelMenu_ResetDraw, UI_SPLevelMenu_ResetAction );
ADDRGP4 $276
ARGP4
ADDRGP4 UI_SPLevelMenu_ResetDraw
ARGP4
ADDRGP4 UI_SPLevelMenu_ResetAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 357
;357:}
LABELV $273
endproc UI_SPLevelMenu_ResetEvent 0 12
proc UI_SPLevelMenu_LevelEvent 8 8
line 365
;358:
;359:
;360:/*
;361:=================
;362:UI_SPLevelMenu_LevelEvent
;363:=================
;364:*/
;365:static void UI_SPLevelMenu_LevelEvent( void* ptr, int notification ) {
line 366
;366:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $278
line 367
;367:		return;
ADDRGP4 $277
JUMPV
LABELV $278
line 370
;368:	}
;369:
;370:	if ( selectedArenaSet == trainingTier || selectedArenaSet == finalTier ) {
ADDRLP4 0
ADDRGP4 selectedArenaSet
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 trainingTier
INDIRI4
EQI4 $282
ADDRLP4 0
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $280
LABELV $282
line 371
;371:		return;
ADDRGP4 $277
JUMPV
LABELV $280
line 374
;372:	}
;373:
;374:	selectedArena = ((menucommon_s*)ptr)->id - ID_PICTURE0;
ADDRGP4 selectedArena
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ASGNI4
line 375
;375:	levelMenuInfo.selectedArenaInfo = UI_GetArenaInfoByNumber( selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+2576
ADDRLP4 4
INDIRP4
ASGNP4
line 376
;376:	UI_SPLevelMenu_SetBots();
ADDRGP4 UI_SPLevelMenu_SetBots
CALLV
pop
line 378
;377:
;378:	trap_Cvar_SetValue( "ui_spSelection", selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 $166
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 379
;379:}
LABELV $277
endproc UI_SPLevelMenu_LevelEvent 8 8
proc UI_SPLevelMenu_LeftArrowEvent 4 0
line 387
;380:
;381:
;382:/*
;383:=================
;384:UI_SPLevelMenu_LeftArrowEvent
;385:=================
;386:*/
;387:static void UI_SPLevelMenu_LeftArrowEvent( void* ptr, int notification ) {
line 388
;388:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $285
line 389
;389:		return;
ADDRGP4 $284
JUMPV
LABELV $285
line 392
;390:	}
;391:
;392:	if ( selectedArenaSet == minTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 minTier
INDIRI4
NEI4 $287
line 393
;393:		return;
ADDRGP4 $284
JUMPV
LABELV $287
line 396
;394:	}
;395:
;396:	selectedArenaSet--;
ADDRLP4 0
ADDRGP4 selectedArenaSet
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 397
;397:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 398
;398:}
LABELV $284
endproc UI_SPLevelMenu_LeftArrowEvent 4 0
proc UI_SPLevelMenu_RightArrowEvent 4 0
line 406
;399:
;400:
;401:/*
;402:=================
;403:UI_SPLevelMenu_RightArrowEvent
;404:=================
;405:*/
;406:static void UI_SPLevelMenu_RightArrowEvent( void* ptr, int notification ) {
line 407
;407:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $290
line 408
;408:		return;
ADDRGP4 $289
JUMPV
LABELV $290
line 411
;409:	}
;410:
;411:	if ( selectedArenaSet == maxTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 maxTier
INDIRI4
NEI4 $292
line 412
;412:		return;
ADDRGP4 $289
JUMPV
LABELV $292
line 415
;413:	}
;414:
;415:	selectedArenaSet++;
ADDRLP4 0
ADDRGP4 selectedArenaSet
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 416
;416:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 417
;417:}
LABELV $289
endproc UI_SPLevelMenu_RightArrowEvent 4 0
proc UI_SPLevelMenu_PlayerEvent 0 0
line 425
;418:
;419:
;420:/*
;421:=================
;422:UI_SPLevelMenu_PlayerEvent
;423:=================
;424:*/
;425:static void UI_SPLevelMenu_PlayerEvent( void* ptr, int notification ) {
line 426
;426:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $295
line 427
;427:		return;
ADDRGP4 $294
JUMPV
LABELV $295
line 430
;428:	}
;429:
;430:	UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 431
;431:}
LABELV $294
endproc UI_SPLevelMenu_PlayerEvent 0 0
proc UI_SPLevelMenu_AwardEvent 4 8
line 439
;432:
;433:
;434:/*
;435:=================
;436:UI_SPLevelMenu_AwardEvent
;437:=================
;438:*/
;439:static void UI_SPLevelMenu_AwardEvent( void* ptr, int notification ) {
line 442
;440:	int		n;
;441:
;442:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $298
line 443
;443:		return;
ADDRGP4 $297
JUMPV
LABELV $298
line 446
;444:	}
;445:
;446:	UIE_AwardIcons_PlaySound(&levelMenuInfo.awards, (menucommon_s*)ptr);
ADDRGP4 levelMenuInfo+3092
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UIE_AwardIcons_PlaySound
CALLV
pop
line 447
;447:}
LABELV $297
endproc UI_SPLevelMenu_AwardEvent 4 8
proc UI_SPLevelMenu_NextEvent 0 4
line 455
;448:
;449:
;450:/*
;451:=================
;452:UI_SPLevelMenu_NextEvent
;453:=================
;454:*/
;455:static void UI_SPLevelMenu_NextEvent( void* ptr, int notification ) {
line 456
;456:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $302
line 457
;457:		return;
ADDRGP4 $301
JUMPV
LABELV $302
line 460
;458:	}
;459:
;460:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $304
line 461
;461:		return;
ADDRGP4 $301
JUMPV
LABELV $304
line 464
;462:	}
;463:
;464:	if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $306
line 465
;465:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 466
;466:	}
LABELV $306
line 468
;467:
;468:	UI_SPSkillMenu( levelMenuInfo.selectedArenaInfo );
ADDRGP4 levelMenuInfo+2576
INDIRP4
ARGP4
ADDRGP4 UI_SPSkillMenu
CALLV
pop
line 469
;469:}
LABELV $301
endproc UI_SPLevelMenu_NextEvent 0 4
proc UI_SPLevelMenu_BackEvent 0 0
line 477
;470:
;471:
;472:/*
;473:=================
;474:UI_SPLevelMenu_BackEvent
;475:=================
;476:*/
;477:static void UI_SPLevelMenu_BackEvent( void* ptr, int notification ) {
line 478
;478:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $310
line 479
;479:		return;
ADDRGP4 $309
JUMPV
LABELV $310
line 482
;480:	}
;481:
;482:	if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $312
line 483
;483:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 484
;484:	}
LABELV $312
line 486
;485:
;486:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 487
;487:}
LABELV $309
endproc UI_SPLevelMenu_BackEvent 0 0
proc UI_SPLevelMenu_CustomEvent 0 4
line 495
;488:
;489:
;490:/*
;491:=================
;492:UI_SPLevelMenu_CustomEvent
;493:=================
;494:*/
;495:static void UI_SPLevelMenu_CustomEvent( void* ptr, int notification ) {
line 496
;496:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $315
line 497
;497:		return;
ADDRGP4 $314
JUMPV
LABELV $315
line 500
;498:	}
;499:
;500:	UI_StartServerMenu( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 501
;501:}
LABELV $314
endproc UI_SPLevelMenu_CustomEvent 0 4
proc UI_SPLevelMenu_MenuDraw 1152 20
line 511
;502:
;503:
;504:/*
;505:=================
;506:UI_SPLevelMenu_MenuDraw
;507:=================
;508:*/
;509:#define LEVEL_DESC_LEFT_MARGIN		332
;510:
;511:static void UI_SPLevelMenu_MenuDraw( void ) {
line 521
;512:	int				n, i;
;513:	int				x, y;
;514:	vec4_t			color;
;515:	int				level;
;516://	int				fraglimit;
;517:	int				pad;
;518:	char			buf[MAX_INFO_VALUE];
;519:	char			string[64];
;520:
;521:	if(	levelMenuInfo.reinit ) {
ADDRGP4 levelMenuInfo+2572
INDIRI4
CNSTI4 0
EQI4 $318
line 522
;522:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 523
;523:		UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 524
;524:		return;
ADDRGP4 $317
JUMPV
LABELV $318
line 528
;525:	}
;526:
;527:	// draw player name
;528:	trap_Cvar_VariableStringBuffer( "name", string, 32 );
ADDRGP4 $119
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 529
;529:	Q_CleanStr( string );
ADDRLP4 1056
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 530
;530:	UI_DrawProportionalString( 320, PLAYER_Y, string, UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
CNSTI4 314
ARGI4
ADDRLP4 1056
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 533
;531:
;532:	// check for model changes
;533:	trap_Cvar_VariableStringBuffer( "model", buf, sizeof(buf) );
ADDRGP4 $116
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 534
;534:	if( Q_stricmp( buf, levelMenuInfo.playerModel ) != 0 ) {
ADDRLP4 32
ARGP4
ADDRGP4 levelMenuInfo+2964
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
EQI4 $321
line 535
;535:		Q_strncpyz( levelMenuInfo.playerModel, buf, sizeof(levelMenuInfo.playerModel) );
ADDRGP4 levelMenuInfo+2964
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 536
;536:		PlayerIcon( levelMenuInfo.playerModel, levelMenuInfo.playerPicName, sizeof(levelMenuInfo.playerPicName) );
ADDRGP4 levelMenuInfo+2964
ARGP4
ADDRGP4 levelMenuInfo+3028
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 537
;537:		levelMenuInfo.item_player.shader = 0;
ADDRGP4 levelMenuInfo+1876+96
CNSTI4 0
ASGNI4
line 538
;538:	}
LABELV $321
line 541
;539:
;540:	// standard menu drawing
;541:	Menu_Draw( &levelMenuInfo.menu );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 544
;542:
;543:	// draw player award levels
;544:	UIE_AwardIcons_DrawValues(&levelMenuInfo.awards);
ADDRGP4 levelMenuInfo+3092
ARGP4
ADDRGP4 UIE_AwardIcons_DrawValues
CALLV
pop
line 546
;545:
;546:	UI_DrawProportionalString( 18, 38, va( "Tier %i", selectedArenaSet + 1 ), UI_LEFT|UI_SMALLFONT, color_orange );
ADDRGP4 $332
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1132
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 18
ARGI4
CNSTI4 38
ARGI4
ADDRLP4 1132
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 548
;547:
;548:	for ( n = 0; n < levelMenuInfo.numMaps; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $336
JUMPV
LABELV $333
line 549
;549:		x = levelMenuInfo.item_maps[n].generic.x;
ADDRLP4 4
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1296+28
ADDP4
INDIRI4
ASGNI4
line 550
;550:		y = levelMenuInfo.item_maps[n].generic.y;
ADDRLP4 8
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1296+32
ADDP4
INDIRI4
ASGNI4
line 551
;551:		UI_FillRect( x, y + 96, 128, 18, color_black );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 96
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1099956224
ARGF4
ADDRGP4 color_black
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 552
;552:	}
LABELV $334
line 548
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $336
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2580
INDIRI4
LTI4 $333
line 554
;553:
;554:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $342
line 555
;555:		UI_DrawProportionalString( 320, 216, "ACCESS DENIED", UI_CENTER|UI_BIGFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 216
ARGI4
ADDRGP4 $344
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 556
;556:		return;
ADDRGP4 $317
JUMPV
LABELV $342
line 560
;557:	}
;558:
;559:	// show levelshots for levels of current tier
;560:	Vector4Copy( color_white, color );
ADDRLP4 16
ADDRGP4 color_white
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRGP4 color_white+4
INDIRF4
ASGNF4
ADDRLP4 16+8
ADDRGP4 color_white+8
INDIRF4
ASGNF4
ADDRLP4 16+12
ADDRGP4 color_white+12
INDIRF4
ASGNF4
line 561
;561:	color[3] = 0.5+0.5*sin(uis.realtime/PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 1136
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 16+12
CNSTF4 1056964608
ADDRLP4 1136
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 562
;562:	for ( n = 0; n < levelMenuInfo.numMaps; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $356
JUMPV
LABELV $353
line 563
;563:		x = levelMenuInfo.item_maps[n].generic.x;
ADDRLP4 4
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1296+28
ADDP4
INDIRI4
ASGNI4
line 564
;564:		y = levelMenuInfo.item_maps[n].generic.y;
ADDRLP4 8
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1296+32
ADDP4
INDIRI4
ASGNI4
line 566
;565:
;566:		UI_DrawString( x + 64, y + 96, levelMenuInfo.levelNames[n], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 96
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2840
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 568
;567:
;568:		if( levelMenuInfo.levelScores[n] == 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2904
ADDP4
INDIRI4
CNSTI4 1
NEI4 $363
line 569
;569:			UI_DrawHandlePic( x, y, 128, 96, levelMenuInfo.levelCompletePic[levelMenuInfo.levelScoresSkill[n] - 1] ); 
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1119879168
ARGF4
ADDRLP4 1140
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1140
INDIRI4
LSHI4
ADDRGP4 levelMenuInfo+2920
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
LSHI4
ADDRGP4 levelMenuInfo+2944-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 570
;570:		}
LABELV $363
line 572
;571:
;572:		if ( n == selectedArena ) {
ADDRLP4 0
INDIRI4
ADDRGP4 selectedArena
INDIRI4
NEI4 $369
line 573
;573:			if( Menu_ItemAtCursor( &levelMenuInfo.menu ) == &levelMenuInfo.item_maps[n] ) {
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 1140
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1296
ADDP4
CVPU4 4
ADDRLP4 1140
INDIRP4
CVPU4 4
NEU4 $371
line 574
;574:				trap_R_SetColor( color );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 575
;575:			}
LABELV $371
line 576
;576:			UI_DrawHandlePic( x-1, y-1, 130, 130 - 14, levelMenuInfo.levelSelectedPic ); 
ADDRLP4 1144
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1144
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ADDRLP4 1144
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1124204544
ARGF4
CNSTF4 1122500608
ARGF4
ADDRGP4 levelMenuInfo+2936
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 577
;577:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 578
;578:		}
ADDRGP4 $370
JUMPV
LABELV $369
line 579
;579:		else if( Menu_ItemAtCursor( &levelMenuInfo.menu ) == &levelMenuInfo.item_maps[n] ) {
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 1140
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+1296
ADDP4
CVPU4 4
ADDRLP4 1140
INDIRP4
CVPU4 4
NEU4 $375
line 580
;580:			trap_R_SetColor( color );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 581
;581:			UI_DrawHandlePic( x-31, y-30, 256, 256-27, levelMenuInfo.levelFocusPic); 
ADDRLP4 4
INDIRI4
CNSTI4 31
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
ARGF4
CNSTF4 1132462080
ARGF4
CNSTF4 1130692608
ARGF4
ADDRGP4 levelMenuInfo+2940
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 582
;582:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 583
;583:		}
LABELV $375
LABELV $370
line 584
;584:	}
LABELV $354
line 562
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $356
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2580
INDIRI4
LTI4 $353
line 587
;585:
;586:	// show map name and long name of selected level
;587:	y = 192;
ADDRLP4 8
CNSTI4 192
ASGNI4
line 588
;588:	Q_strncpyz( buf, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "map" ), 20 );
ADDRGP4 levelMenuInfo+2576
INDIRP4
ARGP4
ADDRGP4 $129
ARGP4
ADDRLP4 1140
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 589
;589:	Q_strupr( buf );
ADDRLP4 32
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 590
;590:	Com_sprintf( string, sizeof(string), "%s: %s", buf, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "longname" ) );
ADDRGP4 levelMenuInfo+2576
INDIRP4
ARGP4
ADDRGP4 $382
ARGP4
ADDRLP4 1144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1056
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $380
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 591
;591:	UI_DrawProportionalString( 320, y, string, UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1056
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 597
;592:
;593://	fraglimit = atoi( Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "fraglimit" ) );
;594://	UI_DrawString( 18, 212, va("Frags %i", fraglimit) , UI_LEFT|UI_SMALLFONT, color_orange );
;595:
;596:	// draw bot opponents
;597:	y += 24;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 598
;598:	pad = (7 - levelMenuInfo.numBots) * (64 + 26) / 2;
ADDRLP4 12
CNSTI4 90
CNSTI4 7
ADDRGP4 levelMenuInfo+3852
INDIRI4
SUBI4
MULI4
CNSTI4 2
DIVI4
ASGNI4
line 599
;599:	for( n = 0; n < levelMenuInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $387
JUMPV
LABELV $384
line 600
;600:		x = 18 + pad + (64 + 26) * n;
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 18
ADDI4
CNSTI4 90
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
line 601
;601:		if( levelMenuInfo.botPics[n] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+3856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $389
line 602
;602:			UI_DrawHandlePic( x, y, 64, 64, levelMenuInfo.botPics[n]);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1148
CNSTF4 1115684864
ASGNF4
ADDRLP4 1148
INDIRF4
ARGF4
ADDRLP4 1148
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+3856
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 603
;603:		}
ADDRGP4 $390
JUMPV
LABELV $389
line 604
;604:		else {
line 605
;605:			UI_FillRect( x, y, 64, 64, color_black );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1148
CNSTF4 1115684864
ASGNF4
ADDRLP4 1148
INDIRF4
ARGF4
ADDRLP4 1148
INDIRF4
ARGF4
ADDRGP4 color_black
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 606
;606:			UI_DrawProportionalString( x+22, y+18, "?", UI_BIGFONT, color_orange );
ADDRLP4 4
INDIRI4
CNSTI4 22
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRGP4 $393
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 607
;607:		}
LABELV $390
line 608
;608:		UI_DrawString( x, y + 64, levelMenuInfo.botNames[n], UI_SMALLFONT|UI_LEFT, color_orange );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ARGI4
CNSTI4 10
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+3884
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 609
;609:	}
LABELV $385
line 599
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $387
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+3852
INDIRI4
LTI4 $384
line 610
;610:}
LABELV $317
endproc UI_SPLevelMenu_MenuDraw 1152 20
export UI_SPLevelMenu_Cache
proc UI_SPLevelMenu_Cache 28 4
line 618
;611:
;612:
;613:/*
;614:=================
;615:UI_SPLevelMenu_Cache
;616:=================
;617:*/
;618:void UI_SPLevelMenu_Cache( void ) {
line 619
;619:	trap_R_RegisterShaderNoMip( ART_LEVELFRAME_FOCUS );
ADDRGP4 $396
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 620
;620:	trap_R_RegisterShaderNoMip( ART_LEVELFRAME_SELECTED );
ADDRGP4 $397
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 621
;621:	trap_R_RegisterShaderNoMip( ART_ARROW );
ADDRGP4 $398
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 622
;622:	trap_R_RegisterShaderNoMip( ART_ARROW_FOCUS );
ADDRGP4 $399
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 623
;623:	trap_R_RegisterShaderNoMip( ART_MAP_UNKNOWN );
ADDRGP4 $145
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 624
;624:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE1 );
ADDRGP4 $400
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 625
;625:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE2 );
ADDRGP4 $401
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 626
;626:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE3 );
ADDRGP4 $402
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 627
;627:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE4 );
ADDRGP4 $403
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 628
;628:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE5 );
ADDRGP4 $404
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 629
;629:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $405
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 630
;630:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $406
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 631
;631:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $407
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 632
;632:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $408
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 633
;633:	trap_R_RegisterShaderNoMip( ART_RESET0 );
ADDRGP4 $409
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 634
;634:	trap_R_RegisterShaderNoMip( ART_RESET1 );
ADDRGP4 $410
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 635
;635:	trap_R_RegisterShaderNoMip( ART_CUSTOM0 );
ADDRGP4 $411
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 636
;636:	trap_R_RegisterShaderNoMip( ART_CUSTOM1 );
ADDRGP4 $412
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 638
;637:
;638:	UIE_AwardIcons_Cache(&levelMenuInfo.awards);
ADDRGP4 levelMenuInfo+3092
ARGP4
ADDRGP4 UIE_AwardIcons_Cache
CALLV
pop
line 640
;639:
;640:	levelMenuInfo.levelSelectedPic = trap_R_RegisterShaderNoMip( ART_LEVELFRAME_SELECTED );
ADDRGP4 $397
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2936
ADDRLP4 0
INDIRI4
ASGNI4
line 641
;641:	levelMenuInfo.levelFocusPic = trap_R_RegisterShaderNoMip( ART_LEVELFRAME_FOCUS );
ADDRGP4 $396
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2940
ADDRLP4 4
INDIRI4
ASGNI4
line 642
;642:	levelMenuInfo.levelCompletePic[0] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE1 );
ADDRGP4 $400
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2944
ADDRLP4 8
INDIRI4
ASGNI4
line 643
;643:	levelMenuInfo.levelCompletePic[1] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE2 );
ADDRGP4 $401
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2944+4
ADDRLP4 12
INDIRI4
ASGNI4
line 644
;644:	levelMenuInfo.levelCompletePic[2] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE3 );
ADDRGP4 $402
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2944+8
ADDRLP4 16
INDIRI4
ASGNI4
line 645
;645:	levelMenuInfo.levelCompletePic[3] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE4 );
ADDRGP4 $403
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2944+12
ADDRLP4 20
INDIRI4
ASGNI4
line 646
;646:	levelMenuInfo.levelCompletePic[4] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE5 );
ADDRGP4 $404
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2944+16
ADDRLP4 24
INDIRI4
ASGNI4
line 647
;647:}
LABELV $395
endproc UI_SPLevelMenu_Cache 28 4
proc UI_SPLevelMenu_Init 112 12
line 655
;648:
;649:
;650:/*
;651:=================
;652:UI_SPLevelMenu_Init
;653:=================
;654:*/
;655:static void UI_SPLevelMenu_Init( void ) {
line 662
;656:	int		skill;
;657:	int		n;
;658:	int		x, y;
;659:	int		count;
;660:	char	buf[MAX_QPATH];
;661:
;662:	skill = (int)trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $426
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
line 663
;663:	if( skill < 1 || skill > 5 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $429
ADDRLP4 0
INDIRI4
CNSTI4 5
LEI4 $427
LABELV $429
line 664
;664:		trap_Cvar_Set( "g_spSkill", "2" );
ADDRGP4 $426
ARGP4
ADDRGP4 $430
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 665
;665:		skill = 2;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 666
;666:	}
LABELV $427
line 668
;667:
;668:	memset( &levelMenuInfo, 0, sizeof(levelMenuInfo) );
ADDRGP4 levelMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3956
ARGI4
ADDRGP4 memset
CALLP4
pop
line 669
;669:	levelMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 levelMenuInfo+1052
CNSTI4 1
ASGNI4
line 670
;670:	levelMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 levelMenuInfo+1044
CNSTI4 1
ASGNI4
line 671
;671:	levelMenuInfo.menu.native 	   = qfalse;
ADDRGP4 levelMenuInfo+1056
CNSTI4 0
ASGNI4
line 672
;672:	levelMenuInfo.menu.draw = UI_SPLevelMenu_MenuDraw;
ADDRGP4 levelMenuInfo+1036
ADDRGP4 UI_SPLevelMenu_MenuDraw
ASGNP4
line 674
;673:
;674:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 676
;675:
;676:	levelMenuInfo.item_banner.generic.type			= MTYPE_BTEXT;
ADDRGP4 levelMenuInfo+1076
CNSTI4 10
ASGNI4
line 677
;677:	levelMenuInfo.item_banner.generic.x				= 320;
ADDRGP4 levelMenuInfo+1076+28
CNSTI4 320
ASGNI4
line 678
;678:	levelMenuInfo.item_banner.generic.y				= 16;
ADDRGP4 levelMenuInfo+1076+32
CNSTI4 16
ASGNI4
line 679
;679:	levelMenuInfo.item_banner.string				= "CHOOSE LEVEL";
ADDRGP4 levelMenuInfo+1076+88
ADDRGP4 $442
ASGNP4
line 680
;680:	levelMenuInfo.item_banner.color					= color_red;
ADDRGP4 levelMenuInfo+1076+100
ADDRGP4 color_red
ASGNP4
line 681
;681:	levelMenuInfo.item_banner.style					= UI_CENTER;
ADDRGP4 levelMenuInfo+1076+92
CNSTI4 1
ASGNI4
line 683
;682:
;683:	levelMenuInfo.item_leftarrow.generic.type		= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1180
CNSTI4 6
ASGNI4
line 684
;684:	levelMenuInfo.item_leftarrow.generic.name		= ART_ARROW;
ADDRGP4 levelMenuInfo+1180+4
ADDRGP4 $398
ASGNP4
line 685
;685:	levelMenuInfo.item_leftarrow.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1180+72
CNSTU4 260
ASGNU4
line 686
;686:	levelMenuInfo.item_leftarrow.generic.x			= 18;
ADDRGP4 levelMenuInfo+1180+28
CNSTI4 18
ASGNI4
line 687
;687:	levelMenuInfo.item_leftarrow.generic.y			= 64;
ADDRGP4 levelMenuInfo+1180+32
CNSTI4 64
ASGNI4
line 688
;688:	levelMenuInfo.item_leftarrow.generic.callback	= UI_SPLevelMenu_LeftArrowEvent;
ADDRGP4 levelMenuInfo+1180+76
ADDRGP4 UI_SPLevelMenu_LeftArrowEvent
ASGNP4
line 689
;689:	levelMenuInfo.item_leftarrow.generic.id			= ID_LEFTARROW;
ADDRGP4 levelMenuInfo+1180+24
CNSTI4 10
ASGNI4
line 690
;690:	levelMenuInfo.item_leftarrow.width				= 16;
ADDRGP4 levelMenuInfo+1180+104
CNSTI4 16
ASGNI4
line 691
;691:	levelMenuInfo.item_leftarrow.height				= 114;
ADDRGP4 levelMenuInfo+1180+108
CNSTI4 114
ASGNI4
line 692
;692:	levelMenuInfo.item_leftarrow.focuspic			= ART_ARROW_FOCUS;
ADDRGP4 levelMenuInfo+1180+88
ADDRGP4 $399
ASGNP4
line 694
;693:
;694:	levelMenuInfo.item_maps[0].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1296
CNSTI4 6
ASGNI4
line 695
;695:	levelMenuInfo.item_maps[0].generic.name			= levelMenuInfo.levelPicNames[0];
ADDRGP4 levelMenuInfo+1296+4
ADDRGP4 levelMenuInfo+2584
ASGNP4
line 696
;696:	levelMenuInfo.item_maps[0].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+1296+72
CNSTU4 4
ASGNU4
line 697
;697:	levelMenuInfo.item_maps[0].generic.x			= 46;
ADDRGP4 levelMenuInfo+1296+28
CNSTI4 46
ASGNI4
line 698
;698:	levelMenuInfo.item_maps[0].generic.y			= 64;
ADDRGP4 levelMenuInfo+1296+32
CNSTI4 64
ASGNI4
line 699
;699:	levelMenuInfo.item_maps[0].generic.id			= ID_PICTURE0;
ADDRGP4 levelMenuInfo+1296+24
CNSTI4 11
ASGNI4
line 700
;700:	levelMenuInfo.item_maps[0].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+1296+76
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 701
;701:	levelMenuInfo.item_maps[0].width				= 128;
ADDRGP4 levelMenuInfo+1296+104
CNSTI4 128
ASGNI4
line 702
;702:	levelMenuInfo.item_maps[0].height				= 96;
ADDRGP4 levelMenuInfo+1296+108
CNSTI4 96
ASGNI4
line 704
;703:
;704:	levelMenuInfo.item_maps[1].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1296+116
CNSTI4 6
ASGNI4
line 705
;705:	levelMenuInfo.item_maps[1].generic.name			= levelMenuInfo.levelPicNames[1];
ADDRGP4 levelMenuInfo+1296+116+4
ADDRGP4 levelMenuInfo+2584+64
ASGNP4
line 706
;706:	levelMenuInfo.item_maps[1].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+1296+116+72
CNSTU4 4
ASGNU4
line 707
;707:	levelMenuInfo.item_maps[1].generic.x			= 186;
ADDRGP4 levelMenuInfo+1296+116+28
CNSTI4 186
ASGNI4
line 708
;708:	levelMenuInfo.item_maps[1].generic.y			= 64;
ADDRGP4 levelMenuInfo+1296+116+32
CNSTI4 64
ASGNI4
line 709
;709:	levelMenuInfo.item_maps[1].generic.id			= ID_PICTURE1;
ADDRGP4 levelMenuInfo+1296+116+24
CNSTI4 12
ASGNI4
line 710
;710:	levelMenuInfo.item_maps[1].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+1296+116+76
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 711
;711:	levelMenuInfo.item_maps[1].width				= 128;
ADDRGP4 levelMenuInfo+1296+116+104
CNSTI4 128
ASGNI4
line 712
;712:	levelMenuInfo.item_maps[1].height				= 96;
ADDRGP4 levelMenuInfo+1296+116+108
CNSTI4 96
ASGNI4
line 714
;713:
;714:	levelMenuInfo.item_maps[2].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1296+232
CNSTI4 6
ASGNI4
line 715
;715:	levelMenuInfo.item_maps[2].generic.name			= levelMenuInfo.levelPicNames[2];
ADDRGP4 levelMenuInfo+1296+232+4
ADDRGP4 levelMenuInfo+2584+128
ASGNP4
line 716
;716:	levelMenuInfo.item_maps[2].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+1296+232+72
CNSTU4 4
ASGNU4
line 717
;717:	levelMenuInfo.item_maps[2].generic.x			= 326;
ADDRGP4 levelMenuInfo+1296+232+28
CNSTI4 326
ASGNI4
line 718
;718:	levelMenuInfo.item_maps[2].generic.y			= 64;
ADDRGP4 levelMenuInfo+1296+232+32
CNSTI4 64
ASGNI4
line 719
;719:	levelMenuInfo.item_maps[2].generic.id			= ID_PICTURE2;
ADDRGP4 levelMenuInfo+1296+232+24
CNSTI4 13
ASGNI4
line 720
;720:	levelMenuInfo.item_maps[2].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+1296+232+76
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 721
;721:	levelMenuInfo.item_maps[2].width				= 128;
ADDRGP4 levelMenuInfo+1296+232+104
CNSTI4 128
ASGNI4
line 722
;722:	levelMenuInfo.item_maps[2].height				= 96;
ADDRGP4 levelMenuInfo+1296+232+108
CNSTI4 96
ASGNI4
line 724
;723:
;724:	levelMenuInfo.item_maps[3].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1296+348
CNSTI4 6
ASGNI4
line 725
;725:	levelMenuInfo.item_maps[3].generic.name			= levelMenuInfo.levelPicNames[3];
ADDRGP4 levelMenuInfo+1296+348+4
ADDRGP4 levelMenuInfo+2584+192
ASGNP4
line 726
;726:	levelMenuInfo.item_maps[3].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+1296+348+72
CNSTU4 4
ASGNU4
line 727
;727:	levelMenuInfo.item_maps[3].generic.x			= 466;
ADDRGP4 levelMenuInfo+1296+348+28
CNSTI4 466
ASGNI4
line 728
;728:	levelMenuInfo.item_maps[3].generic.y			= 64;
ADDRGP4 levelMenuInfo+1296+348+32
CNSTI4 64
ASGNI4
line 729
;729:	levelMenuInfo.item_maps[3].generic.id			= ID_PICTURE3;
ADDRGP4 levelMenuInfo+1296+348+24
CNSTI4 14
ASGNI4
line 730
;730:	levelMenuInfo.item_maps[3].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+1296+348+76
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 731
;731:	levelMenuInfo.item_maps[3].width				= 128;
ADDRGP4 levelMenuInfo+1296+348+104
CNSTI4 128
ASGNI4
line 732
;732:	levelMenuInfo.item_maps[3].height				= 96;
ADDRGP4 levelMenuInfo+1296+348+108
CNSTI4 96
ASGNI4
line 734
;733:
;734:	levelMenuInfo.item_rightarrow.generic.type		= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1760
CNSTI4 6
ASGNI4
line 735
;735:	levelMenuInfo.item_rightarrow.generic.name		= ART_ARROW;
ADDRGP4 levelMenuInfo+1760+4
ADDRGP4 $398
ASGNP4
line 736
;736:	levelMenuInfo.item_rightarrow.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1760+72
CNSTU4 260
ASGNU4
line 737
;737:	levelMenuInfo.item_rightarrow.generic.x			= 606;
ADDRGP4 levelMenuInfo+1760+28
CNSTI4 606
ASGNI4
line 738
;738:	levelMenuInfo.item_rightarrow.generic.y			= 64;
ADDRGP4 levelMenuInfo+1760+32
CNSTI4 64
ASGNI4
line 739
;739:	levelMenuInfo.item_rightarrow.generic.callback	= UI_SPLevelMenu_RightArrowEvent;
ADDRGP4 levelMenuInfo+1760+76
ADDRGP4 UI_SPLevelMenu_RightArrowEvent
ASGNP4
line 740
;740:	levelMenuInfo.item_rightarrow.generic.id		= ID_RIGHTARROW;
ADDRGP4 levelMenuInfo+1760+24
CNSTI4 15
ASGNI4
line 741
;741:	levelMenuInfo.item_rightarrow.width				= -16;
ADDRGP4 levelMenuInfo+1760+104
CNSTI4 -16
ASGNI4
line 742
;742:	levelMenuInfo.item_rightarrow.height			= 114;
ADDRGP4 levelMenuInfo+1760+108
CNSTI4 114
ASGNI4
line 743
;743:	levelMenuInfo.item_rightarrow.focuspic			= ART_ARROW_FOCUS;
ADDRGP4 levelMenuInfo+1760+88
ADDRGP4 $399
ASGNP4
line 745
;744:
;745:	trap_Cvar_VariableStringBuffer( "model", levelMenuInfo.playerModel, sizeof(levelMenuInfo.playerModel) );
ADDRGP4 $116
ARGP4
ADDRGP4 levelMenuInfo+2964
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 746
;746:	PlayerIcon( levelMenuInfo.playerModel, levelMenuInfo.playerPicName, sizeof(levelMenuInfo.playerPicName) );
ADDRGP4 levelMenuInfo+2964
ARGP4
ADDRGP4 levelMenuInfo+3028
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 747
;747:	levelMenuInfo.item_player.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1876
CNSTI4 6
ASGNI4
line 748
;748:	levelMenuInfo.item_player.generic.name			= levelMenuInfo.playerPicName;
ADDRGP4 levelMenuInfo+1876+4
ADDRGP4 levelMenuInfo+3028
ASGNP4
line 749
;749:	levelMenuInfo.item_player.generic.flags			= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY;
ADDRGP4 levelMenuInfo+1876+72
CNSTU4 2052
ASGNU4
line 750
;750:	levelMenuInfo.item_player.generic.x				= 288;
ADDRGP4 levelMenuInfo+1876+28
CNSTI4 288
ASGNI4
line 751
;751:	levelMenuInfo.item_player.generic.y				= AWARDS_Y;
ADDRGP4 levelMenuInfo+1876+32
CNSTI4 340
ASGNI4
line 752
;752:	levelMenuInfo.item_player.generic.id			= ID_PLAYERPIC;
ADDRGP4 levelMenuInfo+1876+24
CNSTI4 16
ASGNI4
line 753
;753:	levelMenuInfo.item_player.generic.callback		= UI_SPLevelMenu_PlayerEvent;
ADDRGP4 levelMenuInfo+1876+76
ADDRGP4 UI_SPLevelMenu_PlayerEvent
ASGNP4
line 754
;754:	levelMenuInfo.item_player.width					= 64;
ADDRGP4 levelMenuInfo+1876+104
CNSTI4 64
ASGNI4
line 755
;755:	levelMenuInfo.item_player.height				= 64;
ADDRGP4 levelMenuInfo+1876+108
CNSTI4 64
ASGNI4
line 757
;756:
;757:	levelMenuInfo.item_back.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1992
CNSTI4 6
ASGNI4
line 758
;758:	levelMenuInfo.item_back.generic.name			= ART_BACK0;
ADDRGP4 levelMenuInfo+1992+4
ADDRGP4 $405
ASGNP4
line 759
;759:	levelMenuInfo.item_back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1992+72
CNSTU4 260
ASGNU4
line 760
;760:	levelMenuInfo.item_back.generic.x				= 0 - uis.wideoffset;
ADDRGP4 levelMenuInfo+1992+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 761
;761:	levelMenuInfo.item_back.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1992+32
CNSTI4 416
ASGNI4
line 762
;762:	levelMenuInfo.item_back.generic.callback		= UI_SPLevelMenu_BackEvent;
ADDRGP4 levelMenuInfo+1992+76
ADDRGP4 UI_SPLevelMenu_BackEvent
ASGNP4
line 763
;763:	levelMenuInfo.item_back.generic.id				= ID_BACK;
ADDRGP4 levelMenuInfo+1992+24
CNSTI4 23
ASGNI4
line 764
;764:	levelMenuInfo.item_back.width					= 128;
ADDRGP4 levelMenuInfo+1992+104
CNSTI4 128
ASGNI4
line 765
;765:	levelMenuInfo.item_back.height					= 64;
ADDRGP4 levelMenuInfo+1992+108
CNSTI4 64
ASGNI4
line 766
;766:	levelMenuInfo.item_back.focuspic				= ART_BACK1;
ADDRGP4 levelMenuInfo+1992+88
ADDRGP4 $406
ASGNP4
line 768
;767:
;768:	levelMenuInfo.item_reset.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+2108
CNSTI4 6
ASGNI4
line 769
;769:	levelMenuInfo.item_reset.generic.name			= ART_RESET0;
ADDRGP4 levelMenuInfo+2108+4
ADDRGP4 $409
ASGNP4
line 770
;770:	levelMenuInfo.item_reset.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+2108+72
CNSTU4 260
ASGNU4
line 771
;771:	levelMenuInfo.item_reset.generic.x				= 170;
ADDRGP4 levelMenuInfo+2108+28
CNSTI4 170
ASGNI4
line 772
;772:	levelMenuInfo.item_reset.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+2108+32
CNSTI4 416
ASGNI4
line 773
;773:	levelMenuInfo.item_reset.generic.callback		= UI_SPLevelMenu_ResetEvent;
ADDRGP4 levelMenuInfo+2108+76
ADDRGP4 UI_SPLevelMenu_ResetEvent
ASGNP4
line 774
;774:	levelMenuInfo.item_reset.generic.id				= ID_RESET;
ADDRGP4 levelMenuInfo+2108+24
CNSTI4 24
ASGNI4
line 775
;775:	levelMenuInfo.item_reset.width					= 128;
ADDRGP4 levelMenuInfo+2108+104
CNSTI4 128
ASGNI4
line 776
;776:	levelMenuInfo.item_reset.height					= 64;
ADDRGP4 levelMenuInfo+2108+108
CNSTI4 64
ASGNI4
line 777
;777:	levelMenuInfo.item_reset.focuspic				= ART_RESET1;
ADDRGP4 levelMenuInfo+2108+88
ADDRGP4 $410
ASGNP4
line 779
;778:
;779:	levelMenuInfo.item_custom.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+2224
CNSTI4 6
ASGNI4
line 780
;780:	levelMenuInfo.item_custom.generic.name			= ART_CUSTOM0;
ADDRGP4 levelMenuInfo+2224+4
ADDRGP4 $411
ASGNP4
line 781
;781:	levelMenuInfo.item_custom.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+2224+72
CNSTU4 260
ASGNU4
line 782
;782:	levelMenuInfo.item_custom.generic.x				= 342;
ADDRGP4 levelMenuInfo+2224+28
CNSTI4 342
ASGNI4
line 783
;783:	levelMenuInfo.item_custom.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+2224+32
CNSTI4 416
ASGNI4
line 784
;784:	levelMenuInfo.item_custom.generic.callback		= UI_SPLevelMenu_CustomEvent;
ADDRGP4 levelMenuInfo+2224+76
ADDRGP4 UI_SPLevelMenu_CustomEvent
ASGNP4
line 785
;785:	levelMenuInfo.item_custom.generic.id			= ID_CUSTOM;
ADDRGP4 levelMenuInfo+2224+24
CNSTI4 25
ASGNI4
line 786
;786:	levelMenuInfo.item_custom.width					= 128;
ADDRGP4 levelMenuInfo+2224+104
CNSTI4 128
ASGNI4
line 787
;787:	levelMenuInfo.item_custom.height				= 64;
ADDRGP4 levelMenuInfo+2224+108
CNSTI4 64
ASGNI4
line 788
;788:	levelMenuInfo.item_custom.focuspic				= ART_CUSTOM1;
ADDRGP4 levelMenuInfo+2224+88
ADDRGP4 $412
ASGNP4
line 790
;789:
;790:	levelMenuInfo.item_next.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+2340
CNSTI4 6
ASGNI4
line 791
;791:	levelMenuInfo.item_next.generic.name			= ART_FIGHT0;
ADDRGP4 levelMenuInfo+2340+4
ADDRGP4 $407
ASGNP4
line 792
;792:	levelMenuInfo.item_next.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+2340+72
CNSTU4 272
ASGNU4
line 793
;793:	levelMenuInfo.item_next.generic.x				= 640 + uis.wideoffset;
ADDRGP4 levelMenuInfo+2340+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 794
;794:	levelMenuInfo.item_next.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+2340+32
CNSTI4 416
ASGNI4
line 795
;795:	levelMenuInfo.item_next.generic.callback		= UI_SPLevelMenu_NextEvent;
ADDRGP4 levelMenuInfo+2340+76
ADDRGP4 UI_SPLevelMenu_NextEvent
ASGNP4
line 796
;796:	levelMenuInfo.item_next.generic.id				= ID_NEXT;
ADDRGP4 levelMenuInfo+2340+24
CNSTI4 26
ASGNI4
line 797
;797:	levelMenuInfo.item_next.width					= 128;
ADDRGP4 levelMenuInfo+2340+104
CNSTI4 128
ASGNI4
line 798
;798:	levelMenuInfo.item_next.height					= 64;
ADDRGP4 levelMenuInfo+2340+108
CNSTI4 64
ASGNI4
line 799
;799:	levelMenuInfo.item_next.focuspic				= ART_FIGHT1;
ADDRGP4 levelMenuInfo+2340+88
ADDRGP4 $408
ASGNP4
line 801
;800:
;801:	levelMenuInfo.item_null.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+2456
CNSTI4 6
ASGNI4
line 802
;802:	levelMenuInfo.item_null.generic.flags			= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 levelMenuInfo+2456+72
CNSTU4 1050628
ASGNU4
line 803
;803:	levelMenuInfo.item_null.generic.x				= 0;
ADDRGP4 levelMenuInfo+2456+28
CNSTI4 0
ASGNI4
line 804
;804:	levelMenuInfo.item_null.generic.y				= 0;
ADDRGP4 levelMenuInfo+2456+32
CNSTI4 0
ASGNI4
line 805
;805:	levelMenuInfo.item_null.width					= 640;
ADDRGP4 levelMenuInfo+2456+104
CNSTI4 640
ASGNI4
line 806
;806:	levelMenuInfo.item_null.height					= 480;
ADDRGP4 levelMenuInfo+2456+108
CNSTI4 480
ASGNI4
line 808
;807:
;808:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_banner );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 810
;809:
;810:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_leftarrow );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 811
;811:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 812
;812:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[1] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1296+116
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 813
;813:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[2] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1296+232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 814
;814:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[3] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1296+348
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 815
;815:	levelMenuInfo.item_maps[0].generic.bottom += 18;
ADDRLP4 92
ADDRGP4 levelMenuInfo+1296+56
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 816
;816:	levelMenuInfo.item_maps[1].generic.bottom += 18;
ADDRLP4 96
ADDRGP4 levelMenuInfo+1296+116+56
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 817
;817:	levelMenuInfo.item_maps[2].generic.bottom += 18;
ADDRLP4 100
ADDRGP4 levelMenuInfo+1296+232+56
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 818
;818:	levelMenuInfo.item_maps[3].generic.bottom += 18;
ADDRLP4 104
ADDRGP4 levelMenuInfo+1296+348+56
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 819
;819:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_rightarrow );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 821
;820:
;821:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_player );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1876
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 824
;822:
;823:	// setup and display the award icons
;824:	levelMenuInfo.awards.iconCentralGap = 64 + 16;
ADDRGP4 levelMenuInfo+3092+756
CNSTI4 80
ASGNI4
line 825
;825:	UIE_AwardIcons_InitControls(&levelMenuInfo.menu, &levelMenuInfo.awards, UI_SPLevelMenu_AwardEvent);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+3092
ARGP4
ADDRGP4 UI_SPLevelMenu_AwardEvent
ARGP4
ADDRGP4 UIE_AwardIcons_InitControls
CALLV
pop
line 827
;826:
;827:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_back );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1992
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 828
;828:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_reset );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+2108
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 829
;829:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_custom );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+2224
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 830
;830:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_next );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+2340
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 831
;831:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_null );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+2456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 833
;832:
;833:	trap_Cvar_VariableStringBuffer( "ui_spSelection", buf, sizeof(buf) );
ADDRGP4 $166
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 834
;834:	if( *buf ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $729
line 835
;835:		n = atoi( buf );
ADDRLP4 4
ARGP4
ADDRLP4 108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 108
INDIRI4
ASGNI4
line 836
;836:		selectedArenaSet = n / ARENAS_PER_TIER;
ADDRGP4 selectedArenaSet
ADDRLP4 68
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 837
;837:		selectedArena = n % ARENAS_PER_TIER;
ADDRGP4 selectedArena
ADDRLP4 68
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 838
;838:	}
ADDRGP4 $730
JUMPV
LABELV $729
line 839
;839:	else {
line 840
;840:		selectedArenaSet = currentSet;
ADDRGP4 selectedArenaSet
ADDRGP4 currentSet
INDIRI4
ASGNI4
line 841
;841:		selectedArena = currentGame;
ADDRGP4 selectedArena
ADDRGP4 currentGame
INDIRI4
ASGNI4
line 842
;842:	}
LABELV $730
line 844
;843:
;844:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 845
;845:}
LABELV $425
endproc UI_SPLevelMenu_Init 112 12
export UI_SPLevelMenu
proc UI_SPLevelMenu 32 8
line 853
;846:
;847:
;848:/*
;849:=================
;850:UI_SPLevelMenu
;851:=================
;852:*/
;853:void UI_SPLevelMenu( void ) {
line 858
;854:	int			level;
;855:	int			trainingLevel;
;856:	const char	*arenaInfo;
;857:
;858:	trainingTier = -1;
ADDRGP4 trainingTier
CNSTI4 -1
ASGNI4
line 859
;859:	arenaInfo = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $169
ARGP4
ADDRLP4 12
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 860
;860:	if( arenaInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $732
line 861
;861:		minTier = trainingTier;
ADDRGP4 minTier
ADDRGP4 trainingTier
INDIRI4
ASGNI4
line 862
;862:		trainingLevel = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $170
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 863
;863:	}
ADDRGP4 $733
JUMPV
LABELV $732
line 864
;864:	else {
line 865
;865:		minTier = 0;
ADDRGP4 minTier
CNSTI4 0
ASGNI4
line 866
;866:		trainingLevel = -2;
ADDRLP4 8
CNSTI4 -2
ASGNI4
line 867
;867:	}
LABELV $733
line 869
;868:
;869:	finalTier = UI_GetNumSPTiers();
ADDRLP4 16
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRGP4 finalTier
ADDRLP4 16
INDIRI4
ASGNI4
line 870
;870:	arenaInfo = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $204
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 871
;871:	if( arenaInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $734
line 872
;872:		maxTier = finalTier;
ADDRGP4 maxTier
ADDRGP4 finalTier
INDIRI4
ASGNI4
line 873
;873:	}
ADDRGP4 $735
JUMPV
LABELV $734
line 874
;874:	else {
line 875
;875:		maxTier = finalTier - 1;
ADDRGP4 maxTier
ADDRGP4 finalTier
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 876
;876:		if( maxTier < minTier ) {
ADDRGP4 maxTier
INDIRI4
ADDRGP4 minTier
INDIRI4
GEI4 $736
line 877
;877:			maxTier = minTier;
ADDRGP4 maxTier
ADDRGP4 minTier
INDIRI4
ASGNI4
line 878
;878:		}
LABELV $736
line 879
;879:	}
LABELV $735
line 881
;880:
;881:	level = UI_GetCurrentGame();
ADDRLP4 24
ADDRGP4 UI_GetCurrentGame
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 882
;882:	if ( level == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $738
line 883
;883:		level = UI_GetNumSPArenas() - 1;
ADDRLP4 28
ADDRGP4 UI_GetNumSPArenas
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 884
;884:		if( maxTier == finalTier ) {
ADDRGP4 maxTier
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $740
line 885
;885:			level++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 886
;886:		}
LABELV $740
line 887
;887:	}
LABELV $738
line 889
;888:
;889:	if( level == trainingLevel ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $742
line 890
;890:		currentSet = -1;
ADDRGP4 currentSet
CNSTI4 -1
ASGNI4
line 891
;891:		currentGame = 0;
ADDRGP4 currentGame
CNSTI4 0
ASGNI4
line 892
;892:	}
ADDRGP4 $743
JUMPV
LABELV $742
line 893
;893:	else {
line 894
;894:		currentSet = level / ARENAS_PER_TIER;
ADDRGP4 currentSet
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 895
;895:		currentGame = level % ARENAS_PER_TIER;
ADDRGP4 currentGame
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 896
;896:	}
LABELV $743
line 898
;897:
;898:	UI_SPLevelMenu_Init();
ADDRGP4 UI_SPLevelMenu_Init
CALLV
pop
line 899
;899:	UI_PushMenu( &levelMenuInfo.menu );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 900
;900:	Menu_SetCursorToItem( &levelMenuInfo.menu, &levelMenuInfo.item_next );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+2340
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 901
;901:}
LABELV $731
endproc UI_SPLevelMenu 32 8
export UI_SPLevelMenu_f
proc UI_SPLevelMenu_f 0 4
line 909
;902:
;903:
;904:/*
;905:=================
;906:UI_SPLevelMenu_f
;907:=================
;908:*/
;909:void UI_SPLevelMenu_f( void ) {
line 910
;910:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 911
;911:	uis.menusp = 0;
ADDRGP4 uis+20
CNSTI4 0
ASGNI4
line 912
;912:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 913
;913:}
LABELV $745
endproc UI_SPLevelMenu_f 0 4
export UI_SPLevelMenu_ReInit
proc UI_SPLevelMenu_ReInit 0 0
line 921
;914:
;915:
;916:/*
;917:=================
;918:UI_SPLevelMenu_ReInit
;919:=================
;920:*/
;921:void UI_SPLevelMenu_ReInit( void ) {
line 922
;922:	levelMenuInfo.reinit = qtrue;
ADDRGP4 levelMenuInfo+2572
CNSTI4 1
ASGNI4
line 923
;923:}
LABELV $747
endproc UI_SPLevelMenu_ReInit 0 0
proc AwardIcons_PositionX 4 0
line 939
;924:
;925:
;926:
;927:
;928://----------------------------------------------------------------
;929:
;930:
;931:
;932:
;933:/*
;934:=================
;935:AwardIcons_PositionX
;936:=================
;937:*/
;938:static int AwardIcons_PositionX(awardInfo_t* a, int n)
;939:{
line 942
;940:	int x;
;941:
;942:	if( n & 1 ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $750
line 943
;943:		x = 224 - (n - 1 ) / 2 * (48 + 16);
ADDRLP4 0
CNSTI4 224
ADDRFP4 4
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
SUBI4
ASGNI4
line 944
;944:	}
ADDRGP4 $751
JUMPV
LABELV $750
line 945
;945:	else {
line 946
;946:		x = 288 + n / 2 * (48 + 16);
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
CNSTI4 288
ADDI4
ASGNI4
line 947
;947:		x += a->iconCentralGap;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDI4
ASGNI4
line 948
;948:	}
LABELV $751
line 950
;949:
;950:	x += a->iconOffset;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDI4
ASGNI4
line 952
;951:
;952:	return x;
ADDRLP4 0
INDIRI4
RETI4
LABELV $749
endproc AwardIcons_PositionX 4 0
export UIE_AwardIcons_Cache
proc UIE_AwardIcons_Cache 12 8
line 963
;953:}
;954:
;955:
;956:
;957:/*
;958:=================
;959:UIE_AwardIcons_Cache
;960:=================
;961:*/
;962:void UIE_AwardIcons_Cache(awardInfo_t* a)
;963:{
line 966
;964:	int n;
;965:
;966:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $753
line 967
;967:		trap_R_RegisterShaderNoMip( ui_medalPicNames[n] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 968
;968:		a->sounds[n] = trap_S_RegisterSound( ui_medalSounds[n], qfalse );
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 969
;969:	}
LABELV $754
line 966
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $753
line 970
;970:}
LABELV $752
endproc UIE_AwardIcons_Cache 12 8
export UIE_AwardIcons_InitControls
proc UIE_AwardIcons_InitControls 28 8
line 981
;971:
;972:
;973:
;974:
;975:/*
;976:=================
;977:UIE_AwardIcons_InitControls
;978:=================
;979:*/
;980:void UIE_AwardIcons_InitControls(menuframework_s* m, awardInfo_t* a, callbackFunc callback)
;981:{
line 985
;982:	int n, x, y;
;983:	int count;
;984:
;985:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $758
line 986
;986:		a->levels[n] = UI_GetAwardLevel( n );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 696
ADDP4
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 987
;987:	}
LABELV $759
line 985
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $758
line 988
;988:	a->levels[AWARD_FRAGS] = 100 * (a->levels[AWARD_FRAGS] / 100);
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 20
CNSTI4 100
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 20
INDIRI4
DIVI4
MULI4
ASGNI4
line 991
;989:
;990:
;991:	if (a->bCentre) {
ADDRFP4 4
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $762
line 992
;992:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 993
;993:		for (n = 0; n < 6; n++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $764
line 994
;994:			if (a->levels[n])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 696
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $768
line 995
;995:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $768
LABELV $765
line 993
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $764
line 997
;996:
;997:		if ((count & 1) == 0)
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $770
line 998
;998:			a->iconOffset += (48 + 16)/2; 
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 748
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
LABELV $770
line 999
;999:	}
LABELV $762
line 1001
;1000:
;1001:	y = AWARDS_Y - a->iconRaise;
ADDRLP4 12
CNSTI4 340
ADDRFP4 4
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1002
;1002:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1003
;1003:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $772
line 1004
;1004:		if( a->levels[n] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 696
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $776
line 1005
;1005:			x = AwardIcons_PositionX(a, count);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 AwardIcons_PositionX
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 1007
;1006:
;1007:			a->item[count].generic.type		= MTYPE_BITMAP;
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 6
ASGNI4
line 1008
;1008:			a->item[count].generic.name		= ui_medalPicNames[n];
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ASGNP4
line 1009
;1009:			a->item[count].generic.flags		= QMF_LEFT_JUSTIFY|QMF_SILENT|QMF_MOUSEONLY;
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 72
ADDP4
CNSTU4 1050628
ASGNU4
line 1010
;1010:			a->item[count].generic.x			= x;
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 28
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1011
;1011:			a->item[count].generic.y			= y;
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 32
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1012
;1012:			a->item[count].generic.id			= ID_AWARD1 + n;
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1013
;1013:			a->item[count].generic.callback		= callback;
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 76
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1014
;1014:			a->item[count].width				= 48;
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 104
ADDP4
CNSTI4 48
ASGNI4
line 1015
;1015:			a->item[count].height				= 48;
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI4 108
ADDP4
CNSTI4 48
ASGNI4
line 1016
;1016:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1017
;1017:		}
LABELV $776
line 1018
;1018:	}
LABELV $773
line 1003
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $772
line 1020
;1019:
;1020:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $781
JUMPV
LABELV $778
line 1021
;1021:		Menu_AddItem( m, &a->item[n] );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1022
;1022:	}
LABELV $779
line 1020
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $781
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $778
line 1023
;1023:}
LABELV $757
endproc UIE_AwardIcons_InitControls 28 8
export UIE_AwardIcons_PlaySound
proc UIE_AwardIcons_PlaySound 4 8
line 1034
;1024:
;1025:
;1026:
;1027:
;1028:/*
;1029:=================
;1030:UIE_AwardIcons_DrawValues
;1031:=================
;1032:*/
;1033:void UIE_AwardIcons_PlaySound(awardInfo_t* a, menucommon_s* ptr)
;1034:{
line 1037
;1035:	int n;
;1036:
;1037:	n = ptr->id - ID_AWARD1;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 1038
;1038:	trap_S_StartLocalSound( a->sounds[n], CHAN_ANNOUNCER );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1039
;1039:}
LABELV $782
endproc UIE_AwardIcons_PlaySound 4 8
export UIE_AwardIcons_DrawValues
proc UIE_AwardIcons_DrawValues 88 20
line 1048
;1040:
;1041:
;1042:/*
;1043:=================
;1044:UIE_AwardIcons_DrawValues
;1045:=================
;1046:*/
;1047:void UIE_AwardIcons_DrawValues(awardInfo_t* a)
;1048:{
line 1053
;1049:	int 			x, y, i, n;
;1050:	int 			level;
;1051:	char			string[64];
;1052:
;1053:	y = AWARDS_Y  - a->iconRaise;
ADDRLP4 80
CNSTI4 340
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1054
;1054:	i = 0;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 1055
;1055:	for( n = 0; n < 6; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $784
line 1056
;1056:		level = a->levels[n];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1057
;1057:		if( level > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $788
line 1058
;1058:			x = AwardIcons_PositionX(a, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 AwardIcons_PositionX
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 84
INDIRI4
ASGNI4
line 1059
;1059:			i++;
ADDRLP4 72
ADDRLP4 72
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1061
;1060:
;1061:			if( level == 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $790
line 1062
;1062:				continue;
ADDRGP4 $785
JUMPV
LABELV $790
line 1065
;1063:			}
;1064:
;1065:			if( level >= 1000000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1000000
LTI4 $792
line 1066
;1066:				Com_sprintf( string, sizeof(string), "%im", level / 1000000 );
ADDRLP4 8
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $794
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1000000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1067
;1067:			}
ADDRGP4 $793
JUMPV
LABELV $792
line 1068
;1068:			else if( level >= 1000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1000
LTI4 $795
line 1069
;1069:				Com_sprintf( string, sizeof(string), "%ik", level / 1000 );
ADDRLP4 8
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $797
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1070
;1070:			}
ADDRGP4 $796
JUMPV
LABELV $795
line 1071
;1071:			else {
line 1072
;1072:				Com_sprintf( string, sizeof(string), "%i", level );
ADDRLP4 8
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $798
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1073
;1073:			}
LABELV $796
LABELV $793
line 1075
;1074:
;1075:			UI_DrawString( x + 24, y + 48, string, UI_CENTER, color_yellow );
ADDRLP4 76
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRLP4 80
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1076
;1076:		}
LABELV $788
line 1077
;1077:	}
LABELV $785
line 1055
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
LTI4 $784
line 1078
;1078:}
LABELV $783
endproc UIE_AwardIcons_DrawValues 88 20
bss
align 4
LABELV maxTier
skip 4
align 4
LABELV minTier
skip 4
align 4
LABELV finalTier
skip 4
align 4
LABELV trainingTier
skip 4
align 4
LABELV currentGame
skip 4
align 4
LABELV currentSet
skip 4
align 4
LABELV selectedArena
skip 4
align 4
LABELV selectedArenaSet
skip 4
align 4
LABELV levelMenuInfo
skip 3956
import UI_MapCallVote
import UI_saveMapEdMenu
import UI_saveMapEdMenu_Cache
import UI_loadMapEdMenu
import UI_loadMapEd_Cache
import UI_SPKickDupe_f
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotNumByName
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_SetDefaultCvar
import UI_UpdateCvars
import UI_RegisterCvars
import MainMenu_ReloadGame
import UI_MainMenu
import MainMenu_Cache
import color_translucent
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_ConfigMenu
import UI_SaveConfigMenu
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import LoadConfig_SetStatusText
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_RealTime
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawCharCustom
import UI_DrawChar
import UI_DrawStringCustom
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_DrawScaledProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawRoundedRect
import vycalc
import vxcalc
import vy
import vx
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UIE_PlayerInfo_InitRotateModel
import PlayerInfo_ModelSpinEvent
import UIE_PlayerInfo_IsTeamModel
import UIE_PlayerInfo_DrawTeamModel
import UIE_ModelSkin
import UIE_ModelName
import UIE_PlayerInfo_AnimateModel
import UIE_PlayerInfo_InitModel
import UIE_PlayerInfo_ChangeAnimation
import UIE_PlayerInfo_ChangeTimedAnimation
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UIE_DefaultIconFromGameType
import UIE_StartServer_RegisterDisableCvars
import UIE_InGame_EnabledItems
import UI_ServerPlayerIcon
import Clamp_Random
import UI_BotSelect_Cache
import UI_BotSelect
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_WorkshopMenu_Cache
import UI_WorkshopMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_SandboxMainMenu
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_BotCommandMenu_f
import UI_DynamicMenuCache
import UI_InGameMenu
import InGame_Cache
import UI_CurrentPlayerTeam
import UI_CreditMenu
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_DrawCustom
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import UI_AdvancedMenu_Cache
import UI_AdvancedMenu
import MGUI_Load
import UI_ArenaScriptAutoFloat
import UI_ArenaScriptAutoChar
import UI_ArenaScriptAutoInt
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import SpinControl_Init
import RadioButton_Init
import ScrollList_Init
import PText_Init
import text_color_highlighty
import text_color_highlight
import text_color_normal
import text_color_disabled
import pulse_color
import listbar_color
import list_color
import name_color
import s_sandboxmain_color1
import color_green
import color_dim
import color_realred
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import UIObject_Draw
import UIObject_Init
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import UI_IsValidCvar
import uie_olditemmenu
import uie_ingame_dynamicmenu
import uie_autoclosebotmenu
import uie_mapicons
import uie_animsfx
import ui_cdkeychecked
import ui_cdkey
import ui_server32
import ui_server31
import ui_server30
import ui_server29
import ui_server28
import ui_server27
import ui_server26
import ui_server25
import ui_server24
import ui_server23
import ui_server22
import ui_server21
import ui_server20
import ui_server19
import ui_server18
import ui_server17
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import ui_backcolors
import cl_screenoffset
import ui_loaded
import cl_language
import cl_selectedmod
import team_legsskin
import sensitivitymenu
import legsskin
import ui_singlemode
import ui_3dmap
import ui_scrollbtnsize
import sbt_wallpaper
import sbt_color3_3
import sbt_color3_2
import sbt_color3_1
import sbt_color3_0
import sbt_color2_3
import sbt_color2_2
import sbt_color2_1
import sbt_color2_0
import sbt_color1_3
import sbt_color1_2
import sbt_color1_1
import sbt_color1_0
import sbt_color0_3
import sbt_color0_2
import sbt_color0_1
import sbt_color0_0
import mgui_none
import mgui_api_active
import cl_sprun
import toolgun_disabledarg4
import toolgun_disabledarg3
import toolgun_disabledarg2
import toolgun_disabledarg1
import toolgun_toolset18
import toolgun_toolset17
import toolgun_toolset16
import toolgun_toolset15
import toolgun_toolset14
import toolgun_toolset13
import toolgun_toolset12
import toolgun_toolset11
import toolgun_toolset10
import toolgun_toolset9
import toolgun_toolset8
import toolgun_toolset7
import toolgun_toolset6
import toolgun_toolset5
import toolgun_toolset4
import toolgun_toolset3
import toolgun_toolset2
import toolgun_toolset1
import tool_modifypreset4
import tool_modifypreset3
import tool_modifypreset2
import tool_modifypreset
import tool_spawnpreset
import spawn_preset
import sb_tab
import sb_texturenum
import sb_classnum
import sb_modelnum
import sb_grid
import sb_texturename
import sb_texture
import sb_private
import test9
import test8
import test7
import test6
import test5
import test4
import test3
import test2
import test1
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
LABELV $798
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $797
byte 1 37
byte 1 105
byte 1 107
byte 1 0
align 1
LABELV $794
byte 1 37
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $442
byte 1 67
byte 1 72
byte 1 79
byte 1 79
byte 1 83
byte 1 69
byte 1 32
byte 1 76
byte 1 69
byte 1 86
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $430
byte 1 50
byte 1 0
align 1
LABELV $426
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
LABELV $412
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $411
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $410
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $409
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $408
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $407
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $406
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $405
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $404
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 53
byte 1 0
align 1
LABELV $403
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $402
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $401
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $400
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $399
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $398
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $397
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $396
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $393
byte 1 63
byte 1 0
align 1
LABELV $382
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $380
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $344
byte 1 65
byte 1 67
byte 1 67
byte 1 69
byte 1 83
byte 1 83
byte 1 32
byte 1 68
byte 1 69
byte 1 78
byte 1 73
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $332
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $276
byte 1 82
byte 1 69
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $269
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 0
align 1
LABELV $267
byte 1 68
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $265
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $263
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $204
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $170
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $169
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $166
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $145
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $140
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $129
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $119
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $88
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $85
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $84
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
