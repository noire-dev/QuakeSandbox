data
export ui_medalNames
align 4
LABELV ui_medalNames
address $81
address $82
address $83
address $84
address $85
address $86
export ui_medalPicNames
align 4
LABELV ui_medalPicNames
address $87
address $88
address $89
address $90
address $91
address $92
export ui_medalSounds
align 4
LABELV ui_medalSounds
address $93
address $94
address $95
address $96
address $97
address $98
export UI_SPKickDupe_f
code
proc UI_SPKickDupe_f 2140 12
file "../../../code/q3_ui/ui_sppostgame.c"
line 93
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:SINGLE PLAYER POSTGAME MENU
;7:
;8:=============================================================================
;9:*/
;10:
;11:
;12:
;13:
;14:
;15:#include "ui_local.h"
;16:
;17:#define MAX_SCOREBOARD_CLIENTS		8
;18:
;19:#define MAX_PLAYER_NAME 32
;20:
;21:#define AWARD_PRESENTATION_TIME		2000
;22:
;23:#define ART_MENU0		"menu/art/menu_0"
;24:#define ART_MENU1		"menu/art/menu_1"
;25:#define ART_REPLAY0		"menu/art/replay_0"
;26:#define ART_REPLAY1		"menu/art/replay_1"
;27:#define ART_NEXT0		"menu/art/next_0"
;28:#define ART_NEXT1		"menu/art/next_1"
;29:
;30:#define ID_AGAIN		10
;31:#define ID_NEXT			11
;32:#define ID_MENU			12
;33:
;34:typedef struct {
;35:	menuframework_s	menu;
;36:	menubitmap_s	item_again;
;37:	menubitmap_s	item_next;
;38:	menubitmap_s	item_menu;
;39:
;40:	int				phase;
;41:	int				ignoreKeysTime;
;42:	int				starttime;
;43:	int				scoreboardtime;
;44:	int				serverId;
;45:
;46:	int				clientNums[MAX_SCOREBOARD_CLIENTS];
;47:	int				ranks[MAX_SCOREBOARD_CLIENTS];
;48:	int				scores[MAX_SCOREBOARD_CLIENTS];
;49:
;50:	char			placeNames[3][64];
;51:
;52:	int				level;
;53:	int				numClients;
;54:	int				won;
;55:	int				numAwards;
;56:	int				awardsEarned[6];
;57:	int				awardsLevels[6];
;58:	qboolean		playedSound[6];
;59:	int				lastTier;
;60:	sfxHandle_t		winnerSound;
;61:} postgameMenuInfo_t;
;62:
;63:static postgameMenuInfo_t	postgameMenuInfo;
;64:static char					arenainfo[MAX_INFO_VALUE];
;65:
;66:char	*ui_medalNames[] = {"Accuracy", "Impressive", "Excellent", "Gauntlet", "Frags", "Perfect"};
;67:char	*ui_medalPicNames[] = {
;68:	"menu/medals/medal_accuracy",
;69:	"menu/medals/medal_impressive",
;70:	"menu/medals/medal_excellent",
;71:	"menu/medals/medal_gauntlet",
;72:	"menu/medals/medal_frags",
;73:	"menu/medals/medal_victory"
;74:};
;75:char	*ui_medalSounds[] = {
;76:	"sound/feedback/accuracy.wav",
;77:	"sound/feedback/impressive_a.wav",
;78:	"sound/feedback/excellent_a.wav",
;79:	"sound/feedback/gauntlet.wav",
;80:	"sound/feedback/frags.wav",
;81:	"sound/feedback/perfect.wav"
;82:};
;83:
;84:
;85:
;86:
;87:/*
;88:=================
;89:UI_SPKickDupe_f
;90:=================
;91:*/
;92:void UI_SPKickDupe_f( void )
;93:{
line 100
;94:	char	info[MAX_INFO_STRING];
;95:	char	info2[MAX_INFO_STRING];
;96:	int numPlayers;
;97:	int i, j;
;98:	char name[MAX_PLAYER_NAME];
;99:
;100:	if (!trap_Cvar_VariableValue( "sv_running" )) {
ADDRGP4 $102
ARGP4
ADDRLP4 2092
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 2092
INDIRF4
CNSTF4 0
NEF4 $100
line 101
;101:		Com_Printf("Local server game only\n");
ADDRGP4 $103
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 102
;102:		return;
ADDRGP4 $99
JUMPV
LABELV $100
line 105
;103:	}
;104:
;105:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 1068
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 106
;106:	numPlayers = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 1068
ARGP4
ADDRGP4 $104
ARGP4
ADDRLP4 2096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRLP4 2100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 2100
INDIRI4
ASGNI4
line 108
;107:
;108:	for( i = 0; i < numPlayers; i++ ) {
ADDRLP4 1060
CNSTI4 0
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $105
line 109
;109:		trap_GetConfigString( CS_PLAYERS + i, info, MAX_INFO_STRING );
ADDRLP4 1060
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 1068
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 111
;110:
;111:		if (!atoi( Info_ValueForKey( info, "skill" ) ))
ADDRLP4 1068
ARGP4
ADDRGP4 $111
ARGP4
ADDRLP4 2104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRLP4 2108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2108
INDIRI4
CNSTI4 0
NEI4 $109
line 112
;112:			continue;
ADDRGP4 $106
JUMPV
LABELV $109
line 114
;113:
;114:		Q_strncpyz(name, Info_ValueForKey( info, "n" ), MAX_PLAYER_NAME);
ADDRLP4 1068
ARGP4
ADDRGP4 $112
ARGP4
ADDRLP4 2112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ARGP4
ADDRLP4 2112
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 115
;115:		for (j = i + 1; j < numPlayers; j++) {
ADDRLP4 0
ADDRLP4 1060
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $113
line 116
;116:			trap_GetConfigString( CS_PLAYERS + j, info2, MAX_INFO_STRING );
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 117
;117:			if (!atoi( Info_ValueForKey( info2, "skill" ) ))
ADDRLP4 4
ARGP4
ADDRGP4 $111
ARGP4
ADDRLP4 2116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2116
INDIRP4
ARGP4
ADDRLP4 2120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2120
INDIRI4
CNSTI4 0
NEI4 $117
line 118
;118:				continue;
ADDRGP4 $114
JUMPV
LABELV $117
line 120
;119:
;120:			if (Q_stricmpn(name, Info_ValueForKey( info2, "n" ), MAX_PLAYER_NAME))
ADDRLP4 4
ARGP4
ADDRGP4 $112
ARGP4
ADDRLP4 2124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ARGP4
ADDRLP4 2124
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 2128
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 2128
INDIRI4
CNSTI4 0
EQI4 $119
line 121
;121:				continue;
ADDRGP4 $114
JUMPV
LABELV $119
line 123
;122:
;123:            trap_Print(va("Duplicate kicked: %s\n", name));
ADDRGP4 $121
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 2132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2132
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 126
;124:
;125:			// kick the dupe	
;126:			trap_Cmd_ExecuteText( EXEC_APPEND, va("clientkick %i\n", i));
ADDRGP4 $122
ARGP4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 2136
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 2136
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 127
;127:		}
LABELV $114
line 115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $116
ADDRLP4 0
INDIRI4
ADDRLP4 1064
INDIRI4
LTI4 $113
line 128
;128:	}
LABELV $106
line 108
ADDRLP4 1060
ADDRLP4 1060
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $108
ADDRLP4 1060
INDIRI4
ADDRLP4 1064
INDIRI4
LTI4 $105
line 129
;129:}
LABELV $99
endproc UI_SPKickDupe_f 2140 12
proc UI_SPPostgameMenu_AgainEvent 0 8
line 141
;130:
;131:
;132:
;133:
;134:
;135:/*
;136:=================
;137:UI_SPPostgameMenu_AgainEvent
;138:=================
;139:*/
;140:static void UI_SPPostgameMenu_AgainEvent( void* ptr, int event )
;141:{
line 142
;142:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $124
line 143
;143:		return;
ADDRGP4 $123
JUMPV
LABELV $124
line 145
;144:	}
;145:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 146
;146:	trap_Cmd_ExecuteText( EXEC_APPEND, "set activeAction uie_kickdupe\nmap_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $126
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 147
;147:}
LABELV $123
endproc UI_SPPostgameMenu_AgainEvent 0 8
proc UI_SPPostgameMenu_NextEvent 36 4
line 158
;148:
;149:
;150:
;151:
;152:
;153:/*
;154:=================
;155:UI_SPPostgameMenu_NextEvent
;156:=================
;157:*/
;158:static void UI_SPPostgameMenu_NextEvent( void* ptr, int event ) {
line 165
;159:	int			currentSet;
;160:	int			levelSet;
;161:	int			level;
;162:	int			currentLevel;
;163:	const char	*arenaInfo;
;164:
;165:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $128
line 166
;166:		return;
ADDRGP4 $127
JUMPV
LABELV $128
line 168
;167:	}
;168:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 171
;169:
;170:	// handle specially if we just won the training map
;171:	if( postgameMenuInfo.won == 0 ) {
ADDRGP4 postgameMenuInfo+1740
INDIRI4
CNSTI4 0
NEI4 $130
line 172
;172:		level = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 173
;173:	}
ADDRGP4 $131
JUMPV
LABELV $130
line 174
;174:	else {
line 175
;175:		level = postgameMenuInfo.level + 1;
ADDRLP4 4
ADDRGP4 postgameMenuInfo+1732
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 176
;176:	}
LABELV $131
line 177
;177:	levelSet = level / ARENAS_PER_TIER;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 179
;178:
;179:	currentLevel = UI_GetCurrentGame();
ADDRLP4 20
ADDRGP4 UI_GetCurrentGame
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 180
;180:	if( currentLevel == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $134
line 181
;181:		currentLevel = postgameMenuInfo.level;
ADDRLP4 0
ADDRGP4 postgameMenuInfo+1732
INDIRI4
ASGNI4
line 182
;182:	}
LABELV $134
line 183
;183:	currentSet = currentLevel / ARENAS_PER_TIER;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 185
;184:
;185:	if( levelSet > currentSet || levelSet == UI_GetNumSPTiers() ) {
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $139
ADDRLP4 28
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $137
LABELV $139
line 186
;186:		level = currentLevel;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 187
;187:	}
LABELV $137
line 189
;188:
;189:	arenaInfo = UI_GetArenaInfoByNumber( level );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
ASGNP4
line 190
;190:	if ( !arenaInfo ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $140
line 191
;191:		return;
ADDRGP4 $127
JUMPV
LABELV $140
line 194
;192:	}
;193:
;194:	UI_SPArena_Start( arenaInfo );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_SPArena_Start
CALLV
pop
line 195
;195:}
LABELV $127
endproc UI_SPPostgameMenu_NextEvent 36 4
proc UI_SPPostgameMenu_MenuEvent 0 8
line 204
;196:
;197:
;198:/*
;199:=================
;200:UI_SPPostgameMenu_MenuEvent
;201:=================
;202:*/
;203:static void UI_SPPostgameMenu_MenuEvent( void* ptr, int event )
;204:{
line 205
;205:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $143
line 206
;206:		return;
ADDRGP4 $142
JUMPV
LABELV $143
line 208
;207:	}
;208:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 209
;209:	trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect; levelselect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $145
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 210
;210:}
LABELV $142
endproc UI_SPPostgameMenu_MenuEvent 0 8
proc UI_SPPostgameMenu_MenuKey 8 8
line 218
;211:
;212:
;213:/*
;214:=================
;215:UI_SPPostgameMenu_MenuKey
;216:=================
;217:*/
;218:static sfxHandle_t UI_SPPostgameMenu_MenuKey( int key ) {
line 219
;219:	if ( uis.realtime < postgameMenuInfo.ignoreKeysTime ) {
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+1428
INDIRI4
GEI4 $147
line 220
;220:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $146
JUMPV
LABELV $147
line 223
;221:	}
;222:
;223:	if( postgameMenuInfo.phase == 1 ) {
ADDRGP4 postgameMenuInfo+1424
INDIRI4
CNSTI4 1
NEI4 $151
line 224
;224:		trap_Cmd_ExecuteText( EXEC_APPEND, "abort_podium\n" );
CNSTI4 2
ARGI4
ADDRGP4 $154
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 225
;225:		postgameMenuInfo.phase = 2;
ADDRGP4 postgameMenuInfo+1424
CNSTI4 2
ASGNI4
line 226
;226:		postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+1432
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 227
;227:		postgameMenuInfo.ignoreKeysTime	= uis.realtime + 250;
ADDRGP4 postgameMenuInfo+1428
ADDRGP4 uis+4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 228
;228:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $146
JUMPV
LABELV $151
line 231
;229:	}
;230:
;231:	if( postgameMenuInfo.phase == 2 ) {
ADDRGP4 postgameMenuInfo+1424
INDIRI4
CNSTI4 2
NEI4 $160
line 232
;232:		postgameMenuInfo.phase = 3;
ADDRGP4 postgameMenuInfo+1424
CNSTI4 3
ASGNI4
line 233
;233:		postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+1432
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 234
;234:		postgameMenuInfo.ignoreKeysTime	= uis.realtime + 250;
ADDRGP4 postgameMenuInfo+1428
ADDRGP4 uis+4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 235
;235:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $146
JUMPV
LABELV $160
line 238
;236:	}
;237:
;238:	if( key == K_ESCAPE || key == K_MOUSE2 ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 27
EQI4 $170
ADDRLP4 0
INDIRI4
CNSTI4 179
NEI4 $168
LABELV $170
line 239
;239:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $146
JUMPV
LABELV $168
line 242
;240:	}
;241:
;242:	return Menu_DefaultKey( &postgameMenuInfo.menu, key );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $146
endproc UI_SPPostgameMenu_MenuKey 8 8
data
align 4
LABELV medalLocations
byte 4 144
byte 4 448
byte 4 88
byte 4 504
byte 4 32
byte 4 560
code
proc UI_SPPostgameMenu_DrawAwardsMedals 40 20
line 248
;243:}
;244:
;245:
;246:static int medalLocations[6] = {144, 448, 88, 504, 32, 560};
;247:
;248:static void UI_SPPostgameMenu_DrawAwardsMedals( int max ) {
line 255
;249:	int		n;
;250:	int		medal;
;251:	int		amount;
;252:	int		x, y;
;253:	char	buf[16];
;254:
;255:	for( n = 0; n < max; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $172
line 256
;256:		x = medalLocations[n];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 medalLocations
ADDP4
INDIRI4
ASGNI4
line 257
;257:		y = 64;
ADDRLP4 12
CNSTI4 64
ASGNI4
line 258
;258:		medal = postgameMenuInfo.awardsEarned[n];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1748
ADDP4
INDIRI4
ASGNI4
line 259
;259:		amount = postgameMenuInfo.awardsLevels[n];
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1772
ADDP4
INDIRI4
ASGNI4
line 261
;260:
;261:		UI_DrawNamedPic( x, y, 48, 48, ui_medalPicNames[medal] );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
CNSTF4 1111490560
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 263
;262:
;263:		if( medal == AWARD_ACCURACY ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $178
line 264
;264:			Com_sprintf( buf, sizeof(buf), "%i%%", amount );
ADDRLP4 16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $180
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 265
;265:		}
ADDRGP4 $179
JUMPV
LABELV $178
line 266
;266:		else {
line 267
;267:			if( amount == 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $181
line 268
;268:				continue;
ADDRGP4 $173
JUMPV
LABELV $181
line 270
;269:			}
;270:			Com_sprintf( buf, sizeof(buf), "%i", amount );
ADDRLP4 16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $183
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 271
;271:		}
LABELV $179
line 273
;272:
;273:		UI_DrawString( x + 24, y + 52, buf, UI_CENTER, color_yellow );
ADDRLP4 8
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 52
ADDI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 274
;274:	}
LABELV $173
line 255
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $175
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $172
line 275
;275:}
LABELV $171
endproc UI_SPPostgameMenu_DrawAwardsMedals 40 20
proc UI_SPPostgameMenu_DrawAwardsPresentation 40 20
line 278
;276:
;277:
;278:static void UI_SPPostgameMenu_DrawAwardsPresentation( int timer ) {
line 283
;279:	int		awardNum;
;280:	int		atimer;
;281:	vec4_t	color;
;282:
;283:	awardNum = timer / AWARD_PRESENTATION_TIME;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2000
DIVI4
ASGNI4
line 284
;284:	atimer = timer % AWARD_PRESENTATION_TIME;
ADDRLP4 20
ADDRFP4 0
INDIRI4
CNSTI4 2000
MODI4
ASGNI4
line 286
;285:
;286:	color[0] = color[1] = color[2] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
ADDRLP4 4+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
line 287
;287:	color[3] = (float)( AWARD_PRESENTATION_TIME - atimer ) / (float)AWARD_PRESENTATION_TIME;
ADDRLP4 4+12
CNSTI4 2000
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ASGNF4
line 288
;288:	UI_DrawProportionalString( 320, 64, ui_medalNames[postgameMenuInfo.awardsEarned[awardNum]], UI_CENTER, color );
CNSTI4 320
ARGI4
CNSTI4 64
ARGI4
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+1748
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 ui_medalNames
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 290
;289:
;290:	UI_SPPostgameMenu_DrawAwardsMedals( awardNum + 1 );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsMedals
CALLV
pop
line 292
;291:
;292:	if( !postgameMenuInfo.playedSound[awardNum] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1796
ADDP4
INDIRI4
CNSTI4 0
NEI4 $189
line 293
;293:		postgameMenuInfo.playedSound[awardNum] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1796
ADDP4
CNSTI4 1
ASGNI4
line 294
;294:		trap_S_StartLocalSound( trap_S_RegisterSound( ui_medalSounds[postgameMenuInfo.awardsEarned[awardNum]], qfalse ), CHAN_ANNOUNCER );
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+1748
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 295
;295:	}
LABELV $189
line 296
;296:}
LABELV $184
endproc UI_SPPostgameMenu_DrawAwardsPresentation 40 20
proc UI_SPPostgameMenu_MenuDrawScoreLine 1100 20
line 304
;297:
;298:
;299:/*
;300:=================
;301:UI_SPPostgameMenu_MenuDrawScoreLine
;302:=================
;303:*/
;304:static void UI_SPPostgameMenu_MenuDrawScoreLine( int n, int y ) {
line 309
;305:	int		rank;
;306:	char	name[64];
;307:	char	info[MAX_INFO_STRING];
;308:
;309:	if( n > (postgameMenuInfo.numClients + 1) ) {
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+1736
INDIRI4
CNSTI4 1
ADDI4
LEI4 $195
line 310
;310:		n -= (postgameMenuInfo.numClients + 2);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+1736
INDIRI4
CNSTI4 2
ADDI4
SUBI4
ASGNI4
line 311
;311:	}
LABELV $195
line 313
;312:
;313:	if( n >= postgameMenuInfo.numClients ) {
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+1736
INDIRI4
LTI4 $199
line 314
;314:		return;
ADDRGP4 $194
JUMPV
LABELV $199
line 317
;315:	}
;316:
;317:	rank = postgameMenuInfo.ranks[n];
ADDRLP4 64
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1476
ADDP4
INDIRI4
ASGNI4
line 318
;318:	if( rank & RANK_TIED_FLAG ) {
ADDRLP4 64
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $203
line 319
;319:		UI_DrawString( 640 - 31 * SMALLCHAR_WIDTH, y, "(tie)", UI_LEFT|UI_SMALLFONT, color_white );
CNSTI4 640
CNSTI4 31
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $206
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 320
;320:		rank &= ~RANK_TIED_FLAG;
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 321
;321:	}
LABELV $203
line 322
;322:	trap_GetConfigString( CS_PLAYERS + postgameMenuInfo.clientNums[n], info, MAX_INFO_STRING );
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1444
ADDP4
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 323
;323:	Q_strncpyz( name, Info_ValueForKey( info, "n" ), sizeof(name) );
ADDRLP4 68
ARGP4
ADDRGP4 $112
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 324
;324:	Q_CleanStr( name );
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 326
;325:
;326:	UI_DrawString( 640 - 25 * SMALLCHAR_WIDTH, y, va( "#%i: %-16s %2i", rank + 1, name, postgameMenuInfo.scores[n] ), UI_LEFT|UI_SMALLFONT, color_white );
ADDRGP4 $209
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1508
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 640
CNSTI4 25
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 327
;327:}
LABELV $194
endproc UI_SPPostgameMenu_MenuDrawScoreLine 1100 20
proc UI_SPPostgameMenu_MenuDraw 1064 20
line 335
;328:
;329:
;330:/*
;331:=================
;332:UI_SPPostgameMenu_MenuDraw
;333:=================
;334:*/
;335:static void UI_SPPostgameMenu_MenuDraw( void ) {
line 341
;336:	int		timer;
;337:	int		serverId;
;338:	int		n;
;339:	char	info[MAX_INFO_STRING];
;340:
;341:	trap_GetConfigString( CS_SYSTEMINFO, info, sizeof(info) );
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 342
;342:	serverId = atoi( Info_ValueForKey( info, "sv_serverid" ) );
ADDRLP4 8
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1040
INDIRI4
ASGNI4
line 343
;343:	if( serverId != postgameMenuInfo.serverId ) {
ADDRLP4 1032
INDIRI4
ADDRGP4 postgameMenuInfo+1440
INDIRI4
EQI4 $213
line 344
;344:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 345
;345:		return;
ADDRGP4 $211
JUMPV
LABELV $213
line 349
;346:	}
;347:
;348:	// phase 1
;349:	if ( postgameMenuInfo.numClients > 2 ) {
ADDRGP4 postgameMenuInfo+1736
INDIRI4
CNSTI4 2
LEI4 $216
line 350
;350:		UI_DrawProportionalString( 510, 480 - 64 - PROP_HEIGHT, postgameMenuInfo.placeNames[2], UI_CENTER, color_white );
CNSTI4 510
ARGI4
CNSTI4 416
ADDRGP4 cl_propheight+12
INDIRI4
SUBI4
ARGI4
ADDRGP4 postgameMenuInfo+1540+128
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 351
;351:	}
LABELV $216
line 352
;352:	UI_DrawProportionalString( 130, 480 - 64 - PROP_HEIGHT, postgameMenuInfo.placeNames[1], UI_CENTER, color_white );
CNSTI4 130
ARGI4
CNSTI4 416
ADDRGP4 cl_propheight+12
INDIRI4
SUBI4
ARGI4
ADDRGP4 postgameMenuInfo+1540+64
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 353
;353:	UI_DrawProportionalString( 320, 480 - 64 - 2 * PROP_HEIGHT, postgameMenuInfo.placeNames[0], UI_CENTER, color_white );
CNSTI4 320
ARGI4
ADDRLP4 1044
CNSTI4 1
ASGNI4
CNSTI4 416
ADDRGP4 cl_propheight+12
INDIRI4
ADDRLP4 1044
INDIRI4
LSHI4
SUBI4
ARGI4
ADDRGP4 postgameMenuInfo+1540
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 355
;354:
;355:	if( postgameMenuInfo.phase == 1 ) {
ADDRGP4 postgameMenuInfo+1424
INDIRI4
CNSTI4 1
NEI4 $227
line 356
;356:		timer = uis.realtime - postgameMenuInfo.starttime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+1432
INDIRI4
SUBI4
ASGNI4
line 358
;357:
;358:		if( timer >= 1000 && postgameMenuInfo.winnerSound ) {
ADDRLP4 0
INDIRI4
CNSTI4 1000
LTI4 $232
ADDRGP4 postgameMenuInfo+1824
INDIRI4
CNSTI4 0
EQI4 $232
line 359
;359:			trap_S_StartLocalSound( postgameMenuInfo.winnerSound, CHAN_ANNOUNCER );
ADDRGP4 postgameMenuInfo+1824
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 360
;360:			postgameMenuInfo.winnerSound = 0;
ADDRGP4 postgameMenuInfo+1824
CNSTI4 0
ASGNI4
line 361
;361:		}
LABELV $232
line 363
;362:
;363:		if( timer < 5000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
GEI4 $237
line 364
;364:			return;
ADDRGP4 $211
JUMPV
LABELV $237
line 366
;365:		}
;366:		postgameMenuInfo.phase = 2;
ADDRGP4 postgameMenuInfo+1424
CNSTI4 2
ASGNI4
line 367
;367:		postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+1432
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 368
;368:	}
LABELV $227
line 371
;369:
;370:	// phase 2
;371:	if( postgameMenuInfo.phase == 2 ) {
ADDRGP4 postgameMenuInfo+1424
INDIRI4
CNSTI4 2
NEI4 $242
line 372
;372:		timer = uis.realtime - postgameMenuInfo.starttime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+1432
INDIRI4
SUBI4
ASGNI4
line 373
;373:		if( timer >= ( postgameMenuInfo.numAwards * AWARD_PRESENTATION_TIME ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2000
ADDRGP4 postgameMenuInfo+1744
INDIRI4
MULI4
LTI4 $247
line 375
;374:
;375:			if( timer < 5000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
GEI4 $250
line 376
;376:				return;
ADDRGP4 $211
JUMPV
LABELV $250
line 379
;377:			}
;378:
;379:			postgameMenuInfo.phase = 3;
ADDRGP4 postgameMenuInfo+1424
CNSTI4 3
ASGNI4
line 380
;380:			postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+1432
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 381
;381:		}
ADDRGP4 $248
JUMPV
LABELV $247
line 382
;382:		else {
line 383
;383:			UI_SPPostgameMenu_DrawAwardsPresentation( timer );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsPresentation
CALLV
pop
line 384
;384:		}
LABELV $248
line 385
;385:	}
LABELV $242
line 388
;386:
;387:	// phase 3
;388:	if( postgameMenuInfo.phase == 3 ) {
ADDRGP4 postgameMenuInfo+1424
INDIRI4
CNSTI4 3
NEI4 $255
line 389
;389:		if( uis.demoversion ) {
ADDRGP4 uis+11492
INDIRI4
CNSTI4 0
EQI4 $258
line 390
;390:			if( postgameMenuInfo.won == 1 && UI_ShowTierVideo( 8 )) {
ADDRGP4 postgameMenuInfo+1740
INDIRI4
CNSTI4 1
NEI4 $259
CNSTI4 8
ARGI4
ADDRLP4 1048
ADDRGP4 UI_ShowTierVideo
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $259
line 391
;391:				trap_Cvar_Set( "nextmap", "" );
ADDRGP4 $264
ARGP4
ADDRGP4 $265
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 392
;392:				trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect; cinematic demoEnd.RoQ\n" );
CNSTI4 2
ARGI4
ADDRGP4 $266
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 393
;393:				return;
ADDRGP4 $211
JUMPV
line 395
;394:			}
;395:		}
LABELV $258
line 396
;396:		else if( postgameMenuInfo.won > -1 && UI_ShowTierVideo( postgameMenuInfo.won + 1 )) {
ADDRGP4 postgameMenuInfo+1740
INDIRI4
CNSTI4 -1
LEI4 $267
ADDRGP4 postgameMenuInfo+1740
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1048
ADDRGP4 UI_ShowTierVideo
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $267
line 397
;397:			if( postgameMenuInfo.won == postgameMenuInfo.lastTier ) {
ADDRGP4 postgameMenuInfo+1740
INDIRI4
ADDRGP4 postgameMenuInfo+1820
INDIRI4
NEI4 $271
line 398
;398:				trap_Cvar_Set( "nextmap", "" );
ADDRGP4 $264
ARGP4
ADDRGP4 $265
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 399
;399:				trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect; cinematic end.RoQ\n" );
CNSTI4 2
ARGI4
ADDRGP4 $275
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 400
;400:				return;
ADDRGP4 $211
JUMPV
LABELV $271
line 403
;401:			}
;402:
;403:			trap_Cvar_SetValue( "ui_spSelection", postgameMenuInfo.won * ARENAS_PER_TIER );
ADDRGP4 $276
ARGP4
ADDRGP4 postgameMenuInfo+1740
INDIRI4
CNSTI4 2
LSHI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 404
;404:			trap_Cvar_Set( "nextmap", "levelselect" );
ADDRGP4 $264
ARGP4
ADDRGP4 $278
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 405
;405:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "disconnect; cinematic tier%i.RoQ\n", postgameMenuInfo.won + 1 ) );
ADDRGP4 $279
ARGP4
ADDRGP4 postgameMenuInfo+1740
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 406
;406:			return;
ADDRGP4 $211
JUMPV
LABELV $267
LABELV $259
line 409
;407:		}
;408:
;409:		postgameMenuInfo.item_again.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1052
ADDRGP4 postgameMenuInfo+1076+72
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 410
;410:		postgameMenuInfo.item_next.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1056
ADDRGP4 postgameMenuInfo+1192+72
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 411
;411:		postgameMenuInfo.item_menu.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1060
ADDRGP4 postgameMenuInfo+1308+72
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 413
;412:
;413:		UI_SPPostgameMenu_DrawAwardsMedals( postgameMenuInfo.numAwards );
ADDRGP4 postgameMenuInfo+1744
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsMedals
CALLV
pop
line 415
;414:
;415:		Menu_Draw( &postgameMenuInfo.menu );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 416
;416:	}
LABELV $255
line 419
;417:
;418:	// draw the scoreboard
;419:	if( !trap_Cvar_VariableValue( "ui_spScoreboard" ) ) {
ADDRGP4 $290
ARGP4
ADDRLP4 1048
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1048
INDIRF4
CNSTF4 0
NEF4 $288
line 420
;420:		return;
ADDRGP4 $211
JUMPV
LABELV $288
line 423
;421:	}
;422:
;423:	timer = uis.realtime - postgameMenuInfo.scoreboardtime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+1436
INDIRI4
SUBI4
ASGNI4
line 424
;424:	if( postgameMenuInfo.numClients <= 3 ) {
ADDRGP4 postgameMenuInfo+1736
INDIRI4
CNSTI4 3
GTI4 $293
line 425
;425:		n = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 426
;426:	}
ADDRGP4 $294
JUMPV
LABELV $293
line 427
;427:	else {
line 428
;428:		n = timer / 1500 % (postgameMenuInfo.numClients + 2);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1500
DIVI4
ADDRGP4 postgameMenuInfo+1736
INDIRI4
CNSTI4 2
ADDI4
MODI4
ASGNI4
line 429
;429:	}
LABELV $294
line 430
;430:	UI_SPPostgameMenu_MenuDrawScoreLine( n, 0 );
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 431
;431:	UI_SPPostgameMenu_MenuDrawScoreLine( n + 1, 0 + SMALLCHAR_HEIGHT );
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 432
;432:	UI_SPPostgameMenu_MenuDrawScoreLine( n + 2, 0 + 2 * SMALLCHAR_HEIGHT );
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 1
LSHI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 433
;433:}
LABELV $211
endproc UI_SPPostgameMenu_MenuDraw 1064 20
export UI_SPPostgameMenu_Cache
proc UI_SPPostgameMenu_Cache 12 8
line 441
;434:
;435:
;436:/*
;437:=================
;438:UI_SPPostgameMenu_Cache
;439:=================
;440:*/
;441:void UI_SPPostgameMenu_Cache( void ) {
line 445
;442:	int			n;
;443:	qboolean	buildscript;
;444:
;445:	buildscript = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $300
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 447
;446:
;447:	trap_R_RegisterShaderNoMip( ART_MENU0 );
ADDRGP4 $301
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 448
;448:	trap_R_RegisterShaderNoMip( ART_MENU1 );
ADDRGP4 $302
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 449
;449:	trap_R_RegisterShaderNoMip( ART_REPLAY0 );
ADDRGP4 $303
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 450
;450:	trap_R_RegisterShaderNoMip( ART_REPLAY1 );
ADDRGP4 $304
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 451
;451:	trap_R_RegisterShaderNoMip( ART_NEXT0 );
ADDRGP4 $305
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 452
;452:	trap_R_RegisterShaderNoMip( ART_NEXT1 );
ADDRGP4 $306
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 453
;453:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $307
line 454
;454:		trap_R_RegisterShaderNoMip( ui_medalPicNames[n] );
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
line 455
;455:		trap_S_RegisterSound( ui_medalSounds[n], qfalse );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 456
;456:	}
LABELV $308
line 453
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $307
line 458
;457:
;458:	if( buildscript ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $311
line 459
;459:		trap_S_RegisterSound( "music/loss.wav", qfalse );
ADDRGP4 $313
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 460
;460:		trap_S_RegisterSound( "music/win.wav", qfalse );
ADDRGP4 $314
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 461
;461:		trap_S_RegisterSound( "sound/player/announce/youwin.wav", qfalse );
ADDRGP4 $315
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 462
;462:	}
LABELV $311
line 463
;463:}
LABELV $299
endproc UI_SPPostgameMenu_Cache 12 8
proc UI_SPPostgameMenu_Init 0 8
line 471
;464:
;465:
;466:/*
;467:=================
;468:UI_SPPostgameMenu_Init
;469:=================
;470:*/
;471:static void UI_SPPostgameMenu_Init( void ) {
line 472
;472:	postgameMenuInfo.menu.wrapAround	= qtrue;
ADDRGP4 postgameMenuInfo+1044
CNSTI4 1
ASGNI4
line 473
;473:	postgameMenuInfo.menu.native 	   = qfalse;
ADDRGP4 postgameMenuInfo+1056
CNSTI4 0
ASGNI4
line 474
;474:	postgameMenuInfo.menu.key			= UI_SPPostgameMenu_MenuKey;
ADDRGP4 postgameMenuInfo+1040
ADDRGP4 UI_SPPostgameMenu_MenuKey
ASGNP4
line 475
;475:	postgameMenuInfo.menu.draw			= UI_SPPostgameMenu_MenuDraw;
ADDRGP4 postgameMenuInfo+1036
ADDRGP4 UI_SPPostgameMenu_MenuDraw
ASGNP4
line 476
;476:	postgameMenuInfo.ignoreKeysTime		= uis.realtime + 1500;
ADDRGP4 postgameMenuInfo+1428
ADDRGP4 uis+4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 478
;477:
;478:	UI_SPPostgameMenu_Cache();
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
line 480
;479:
;480:	postgameMenuInfo.item_menu.generic.type			= MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+1308
CNSTI4 6
ASGNI4
line 481
;481:	postgameMenuInfo.item_menu.generic.name			= ART_MENU0;
ADDRGP4 postgameMenuInfo+1308+4
ADDRGP4 $301
ASGNP4
line 482
;482:	postgameMenuInfo.item_menu.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+1308+72
CNSTU4 16644
ASGNU4
line 483
;483:	postgameMenuInfo.item_menu.generic.x			= 0 - uis.wideoffset;
ADDRGP4 postgameMenuInfo+1308+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 484
;484:	postgameMenuInfo.item_menu.generic.y			= 480-64;
ADDRGP4 postgameMenuInfo+1308+32
CNSTI4 416
ASGNI4
line 485
;485:	postgameMenuInfo.item_menu.generic.callback		= UI_SPPostgameMenu_MenuEvent;
ADDRGP4 postgameMenuInfo+1308+76
ADDRGP4 UI_SPPostgameMenu_MenuEvent
ASGNP4
line 486
;486:	postgameMenuInfo.item_menu.generic.id			= ID_MENU;
ADDRGP4 postgameMenuInfo+1308+24
CNSTI4 12
ASGNI4
line 487
;487:	postgameMenuInfo.item_menu.width				= 128;
ADDRGP4 postgameMenuInfo+1308+104
CNSTI4 128
ASGNI4
line 488
;488:	postgameMenuInfo.item_menu.height				= 64;
ADDRGP4 postgameMenuInfo+1308+108
CNSTI4 64
ASGNI4
line 489
;489:	postgameMenuInfo.item_menu.focuspic				= ART_MENU1;
ADDRGP4 postgameMenuInfo+1308+88
ADDRGP4 $302
ASGNP4
line 491
;490:
;491:	postgameMenuInfo.item_again.generic.type		= MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+1076
CNSTI4 6
ASGNI4
line 492
;492:	postgameMenuInfo.item_again.generic.name		= ART_REPLAY0;
ADDRGP4 postgameMenuInfo+1076+4
ADDRGP4 $303
ASGNP4
line 493
;493:	postgameMenuInfo.item_again.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+1076+72
CNSTU4 16648
ASGNU4
line 494
;494:	postgameMenuInfo.item_again.generic.x			= 320;
ADDRGP4 postgameMenuInfo+1076+28
CNSTI4 320
ASGNI4
line 495
;495:	postgameMenuInfo.item_again.generic.y			= 480-64;
ADDRGP4 postgameMenuInfo+1076+32
CNSTI4 416
ASGNI4
line 496
;496:	postgameMenuInfo.item_again.generic.callback	= UI_SPPostgameMenu_AgainEvent;
ADDRGP4 postgameMenuInfo+1076+76
ADDRGP4 UI_SPPostgameMenu_AgainEvent
ASGNP4
line 497
;497:	postgameMenuInfo.item_again.generic.id			= ID_AGAIN;
ADDRGP4 postgameMenuInfo+1076+24
CNSTI4 10
ASGNI4
line 498
;498:	postgameMenuInfo.item_again.width				= 128;
ADDRGP4 postgameMenuInfo+1076+104
CNSTI4 128
ASGNI4
line 499
;499:	postgameMenuInfo.item_again.height				= 64;
ADDRGP4 postgameMenuInfo+1076+108
CNSTI4 64
ASGNI4
line 500
;500:	postgameMenuInfo.item_again.focuspic			= ART_REPLAY1;
ADDRGP4 postgameMenuInfo+1076+88
ADDRGP4 $304
ASGNP4
line 502
;501:
;502:	postgameMenuInfo.item_next.generic.type			= MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+1192
CNSTI4 6
ASGNI4
line 503
;503:	postgameMenuInfo.item_next.generic.name			= ART_NEXT0;
ADDRGP4 postgameMenuInfo+1192+4
ADDRGP4 $305
ASGNP4
line 504
;504:	postgameMenuInfo.item_next.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+1192+72
CNSTU4 16656
ASGNU4
line 505
;505:	postgameMenuInfo.item_next.generic.x			= 640 + uis.wideoffset;
ADDRGP4 postgameMenuInfo+1192+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 506
;506:	postgameMenuInfo.item_next.generic.y			= 480-64;
ADDRGP4 postgameMenuInfo+1192+32
CNSTI4 416
ASGNI4
line 507
;507:	postgameMenuInfo.item_next.generic.callback		= UI_SPPostgameMenu_NextEvent;
ADDRGP4 postgameMenuInfo+1192+76
ADDRGP4 UI_SPPostgameMenu_NextEvent
ASGNP4
line 508
;508:	postgameMenuInfo.item_next.generic.id			= ID_NEXT;
ADDRGP4 postgameMenuInfo+1192+24
CNSTI4 11
ASGNI4
line 509
;509:	postgameMenuInfo.item_next.width				= 128;
ADDRGP4 postgameMenuInfo+1192+104
CNSTI4 128
ASGNI4
line 510
;510:	postgameMenuInfo.item_next.height				= 64;
ADDRGP4 postgameMenuInfo+1192+108
CNSTI4 64
ASGNI4
line 511
;511:	postgameMenuInfo.item_next.focuspic				= ART_NEXT1;
ADDRGP4 postgameMenuInfo+1192+88
ADDRGP4 $306
ASGNP4
line 513
;512:
;513:	Menu_AddItem( &postgameMenuInfo.menu, ( void * )&postgameMenuInfo.item_menu );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+1308
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 514
;514:	Menu_AddItem( &postgameMenuInfo.menu, ( void * )&postgameMenuInfo.item_again );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 515
;515:	Menu_AddItem( &postgameMenuInfo.menu, ( void * )&postgameMenuInfo.item_next );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+1192
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 516
;516:}
LABELV $316
endproc UI_SPPostgameMenu_Init 0 8
proc Prepname 1104 12
line 519
;517:
;518:
;519:static void Prepname( int index ) {
line 524
;520:	int		len;
;521:	char	name[64];
;522:	char	info[MAX_INFO_STRING];
;523:
;524:	trap_GetConfigString( CS_PLAYERS + postgameMenuInfo.clientNums[index], info, MAX_INFO_STRING );
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1444
ADDP4
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 525
;525:	Q_strncpyz( name, Info_ValueForKey( info, "n" ), sizeof(name) );
ADDRLP4 68
ARGP4
ADDRGP4 $112
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 526
;526:	Q_CleanStr( name );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 527
;527:	len = strlen( name );
ADDRLP4 4
ARGP4
ADDRLP4 1096
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1096
INDIRI4
ASGNI4
ADDRGP4 $388
JUMPV
LABELV $387
line 529
;528:
;529:	while( len && UI_ProportionalStringWidth( name ) > 256 ) {
line 530
;530:		len--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 531
;531:		name[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 532
;532:	}
LABELV $388
line 529
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $390
ADDRLP4 4
ARGP4
ADDRLP4 1100
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 256
GTI4 $387
LABELV $390
line 534
;533:
;534:	Q_strncpyz( postgameMenuInfo.placeNames[index], name, sizeof(postgameMenuInfo.placeNames[index]) );
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 postgameMenuInfo+1540
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 535
;535:}
LABELV $385
endproc Prepname 1104 12
export UI_SPPostgameMenu_f
proc UI_SPPostgameMenu_f 1244 12
line 543
;536:
;537:
;538:/*
;539:=================
;540:UI_SPPostgameMenu_f
;541:=================
;542:*/
;543:void UI_SPPostgameMenu_f( void ) {
line 553
;544:	int			playerGameRank;
;545:	int			playerClientNum;
;546:	int			n;
;547:	int			oldFrags, newFrags;
;548:	const char	*arena;
;549:	int			awardValues[6];
;550:	char		map[MAX_QPATH];
;551:	char		info[MAX_INFO_STRING];
;552:
;553:	memset( &postgameMenuInfo, 0, sizeof(postgameMenuInfo) );
ADDRGP4 postgameMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1828
ARGI4
ADDRGP4 memset
CALLP4
pop
line 555
;554:
;555:	trap_GetConfigString( CS_SYSTEMINFO, info, sizeof(info) );
CNSTI4 1
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 556
;556:	postgameMenuInfo.serverId = atoi( Info_ValueForKey( info, "sv_serverid" ) );
ADDRLP4 36
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 1136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+1440
ADDRLP4 1140
INDIRI4
ASGNI4
line 558
;557:
;558:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 559
;559:	Q_strncpyz( map, Info_ValueForKey( info, "mapname" ), sizeof(map) );
ADDRLP4 36
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 1144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 560
;560:	arena = UI_GetArenaInfoByMap( map );
ADDRLP4 1064
ARGP4
ADDRLP4 1148
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1060
ADDRLP4 1148
INDIRP4
ASGNP4
line 561
;561:	if ( !arena ) {
ADDRLP4 1060
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $396
line 562
;562:		return;
ADDRGP4 $393
JUMPV
LABELV $396
line 564
;563:	}
;564:	Q_strncpyz( arenainfo, arena, sizeof(arenainfo) );
ADDRGP4 arenainfo
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 566
;565:
;566:	postgameMenuInfo.level = atoi( Info_ValueForKey( arenainfo, "num" ) );
ADDRGP4 arenainfo
ARGP4
ADDRGP4 $399
ARGP4
ADDRLP4 1152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+1732
ADDRLP4 1156
INDIRI4
ASGNI4
line 568
;567:
;568:	postgameMenuInfo.numClients = atoi( UI_Argv( 1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1160
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+1736
ADDRLP4 1164
INDIRI4
ASGNI4
line 569
;569:	playerClientNum = atoi( UI_Argv( 2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1168
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1172
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 1172
INDIRI4
ASGNI4
line 570
;570:	playerGameRank = 8;		// in case they ended game as a spectator
ADDRLP4 32
CNSTI4 8
ASGNI4
line 572
;571:
;572:	if( postgameMenuInfo.numClients > MAX_SCOREBOARD_CLIENTS ) {
ADDRGP4 postgameMenuInfo+1736
INDIRI4
CNSTI4 8
LEI4 $401
line 573
;573:		postgameMenuInfo.numClients = MAX_SCOREBOARD_CLIENTS;
ADDRGP4 postgameMenuInfo+1736
CNSTI4 8
ASGNI4
line 574
;574:	}
LABELV $401
line 576
;575:
;576:	for( n = 0; n < postgameMenuInfo.numClients; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $408
JUMPV
LABELV $405
line 577
;577:		postgameMenuInfo.clientNums[n] = atoi( UI_Argv( 8 + n * 3 + 1 ) );
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1180
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1444
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
line 578
;578:		postgameMenuInfo.ranks[n] = atoi( UI_Argv( 8 + n * 3 + 2 ) );
ADDRLP4 1192
CNSTI4 2
ASGNI4
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
ADDRLP4 1192
INDIRI4
ADDI4
ARGI4
ADDRLP4 1196
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 1200
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1192
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+1476
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 579
;579:		postgameMenuInfo.scores[n] = atoi( UI_Argv( 8 + n * 3 + 3 ) );
ADDRLP4 1204
CNSTI4 3
ASGNI4
ADDRLP4 1204
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
ADDRLP4 1204
INDIRI4
ADDI4
ARGI4
ADDRLP4 1212
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1216
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1508
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 581
;580:
;581:		if( postgameMenuInfo.clientNums[n] == playerClientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1444
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $413
line 582
;582:			playerGameRank = (postgameMenuInfo.ranks[n] & ~RANK_TIED_FLAG) + 1;
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1476
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 1
ADDI4
ASGNI4
line 583
;583:		}
LABELV $413
line 584
;584:	}
LABELV $406
line 576
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $408
ADDRLP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+1736
INDIRI4
LTI4 $405
line 586
;585:
;586:	UI_SetBestScore( postgameMenuInfo.level, playerGameRank );
ADDRGP4 postgameMenuInfo+1732
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 UI_SetBestScore
CALLV
pop
line 589
;587:
;588:	// process award stats and prepare presentation data
;589:	awardValues[AWARD_ACCURACY] = atoi( UI_Argv( 3 ) );
CNSTI4 3
ARGI4
ADDRLP4 1176
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRLP4 1180
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1180
INDIRI4
ASGNI4
line 590
;590:	awardValues[AWARD_IMPRESSIVE] = atoi( UI_Argv( 4 ) );
CNSTI4 4
ARGI4
ADDRLP4 1184
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 1188
INDIRI4
ASGNI4
line 591
;591:	awardValues[AWARD_EXCELLENT] = atoi( UI_Argv( 5 ) );
CNSTI4 5
ARGI4
ADDRLP4 1192
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1196
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 1196
INDIRI4
ASGNI4
line 592
;592:	awardValues[AWARD_GAUNTLET] = atoi( UI_Argv( 6 ) );
CNSTI4 6
ARGI4
ADDRLP4 1200
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1204
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+12
ADDRLP4 1204
INDIRI4
ASGNI4
line 593
;593:	awardValues[AWARD_FRAGS] = atoi( UI_Argv( 7 ) );
CNSTI4 7
ARGI4
ADDRLP4 1208
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+16
ADDRLP4 1212
INDIRI4
ASGNI4
line 594
;594:	awardValues[AWARD_PERFECT] = atoi( UI_Argv( 8 ) );
CNSTI4 8
ARGI4
ADDRLP4 1216
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+20
ADDRLP4 1220
INDIRI4
ASGNI4
line 596
;595:
;596:	postgameMenuInfo.numAwards = 0;
ADDRGP4 postgameMenuInfo+1744
CNSTI4 0
ASGNI4
line 598
;597:
;598:	if( awardValues[AWARD_ACCURACY] >= 50 ) {
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $424
line 599
;599:		UI_LogAwardData( AWARD_ACCURACY, 1 );
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 600
;600:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_ACCURACY;
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1748
ADDP4
CNSTI4 0
ASGNI4
line 601
;601:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_ACCURACY];
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1772
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 602
;602:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+1744
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 603
;603:	}
LABELV $424
line 605
;604:
;605:	if( awardValues[AWARD_IMPRESSIVE] ) {
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $431
line 606
;606:		UI_LogAwardData( AWARD_IMPRESSIVE, awardValues[AWARD_IMPRESSIVE] );
CNSTI4 1
ARGI4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 607
;607:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_IMPRESSIVE;
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1748
ADDP4
CNSTI4 1
ASGNI4
line 608
;608:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_IMPRESSIVE];
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1772
ADDP4
ADDRLP4 4+4
INDIRI4
ASGNI4
line 609
;609:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+1744
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 610
;610:	}
LABELV $431
line 612
;611:
;612:	if( awardValues[AWARD_EXCELLENT] ) {
ADDRLP4 4+8
INDIRI4
CNSTI4 0
EQI4 $441
line 613
;613:		UI_LogAwardData( AWARD_EXCELLENT, awardValues[AWARD_EXCELLENT] );
CNSTI4 2
ARGI4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 614
;614:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_EXCELLENT;
ADDRLP4 1224
CNSTI4 2
ASGNI4
ADDRGP4 postgameMenuInfo+1744
INDIRI4
ADDRLP4 1224
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+1748
ADDP4
ADDRLP4 1224
INDIRI4
ASGNI4
line 615
;615:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_EXCELLENT];
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1772
ADDP4
ADDRLP4 4+8
INDIRI4
ASGNI4
line 616
;616:		postgameMenuInfo.numAwards++;
ADDRLP4 1228
ADDRGP4 postgameMenuInfo+1744
ASGNP4
ADDRLP4 1228
INDIRP4
ADDRLP4 1228
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 617
;617:	}
LABELV $441
line 619
;618:
;619:	if( awardValues[AWARD_GAUNTLET] ) {
ADDRLP4 4+12
INDIRI4
CNSTI4 0
EQI4 $451
line 620
;620:		UI_LogAwardData( AWARD_GAUNTLET, awardValues[AWARD_GAUNTLET] );
CNSTI4 3
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 621
;621:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_GAUNTLET;
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1748
ADDP4
CNSTI4 3
ASGNI4
line 622
;622:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_GAUNTLET];
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1772
ADDP4
ADDRLP4 4+12
INDIRI4
ASGNI4
line 623
;623:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+1744
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 624
;624:	}
LABELV $451
line 626
;625:
;626:	oldFrags = UI_GetAwardLevel( AWARD_FRAGS ) / 100;
CNSTI4 4
ARGI4
ADDRLP4 1224
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 1132
ADDRLP4 1224
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 627
;627:	UI_LogAwardData( AWARD_FRAGS, awardValues[AWARD_FRAGS] );
CNSTI4 4
ARGI4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 628
;628:	newFrags = UI_GetAwardLevel( AWARD_FRAGS ) / 100;
CNSTI4 4
ARGI4
ADDRLP4 1228
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 1128
ADDRLP4 1228
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 629
;629:	if( newFrags > oldFrags ) {
ADDRLP4 1128
INDIRI4
ADDRLP4 1132
INDIRI4
LEI4 $462
line 630
;630:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_FRAGS;
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1748
ADDP4
CNSTI4 4
ASGNI4
line 631
;631:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = newFrags * 100;
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1772
ADDP4
CNSTI4 100
ADDRLP4 1128
INDIRI4
MULI4
ASGNI4
line 632
;632:		postgameMenuInfo.numAwards++;
ADDRLP4 1232
ADDRGP4 postgameMenuInfo+1744
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 633
;633:	}
LABELV $462
line 635
;634:
;635:	if( awardValues[AWARD_PERFECT] ) {
ADDRLP4 4+20
INDIRI4
CNSTI4 0
EQI4 $469
line 636
;636:		UI_LogAwardData( AWARD_PERFECT, 1 );
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 637
;637:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_PERFECT;
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1748
ADDP4
CNSTI4 5
ASGNI4
line 638
;638:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = 1;
ADDRGP4 postgameMenuInfo+1744
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+1772
ADDP4
CNSTI4 1
ASGNI4
line 639
;639:		postgameMenuInfo.numAwards++;
ADDRLP4 1232
ADDRGP4 postgameMenuInfo+1744
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 640
;640:	}
LABELV $469
line 642
;641:
;642:	if ( playerGameRank == 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $477
line 643
;643:		postgameMenuInfo.won = UI_TierCompleted( postgameMenuInfo.level );
ADDRGP4 postgameMenuInfo+1732
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 UI_TierCompleted
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+1740
ADDRLP4 1232
INDIRI4
ASGNI4
line 644
;644:	}
ADDRGP4 $478
JUMPV
LABELV $477
line 645
;645:	else {
line 646
;646:		postgameMenuInfo.won = -1;
ADDRGP4 postgameMenuInfo+1740
CNSTI4 -1
ASGNI4
line 647
;647:	}
LABELV $478
line 649
;648:
;649:	postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+1432
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 650
;650:	postgameMenuInfo.scoreboardtime = uis.realtime;
ADDRGP4 postgameMenuInfo+1436
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 652
;651:
;652:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 653
;653:	uis.menusp = 0;
ADDRGP4 uis+20
CNSTI4 0
ASGNI4
line 655
;654:
;655:	UI_SPPostgameMenu_Init();
ADDRGP4 UI_SPPostgameMenu_Init
CALLV
pop
line 656
;656:	UI_PushMenu( &postgameMenuInfo.menu );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 658
;657:
;658:	if ( playerGameRank == 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $487
line 659
;659:		Menu_SetCursorToItem( &postgameMenuInfo.menu, &postgameMenuInfo.item_next );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+1192
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 660
;660:	}
ADDRGP4 $488
JUMPV
LABELV $487
line 661
;661:	else {
line 662
;662:		Menu_SetCursorToItem( &postgameMenuInfo.menu, &postgameMenuInfo.item_again );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+1076
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 663
;663:	}
LABELV $488
line 665
;664:
;665:	Prepname( 0 );
CNSTI4 0
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 666
;666:	Prepname( 1 );
CNSTI4 1
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 667
;667:	Prepname( 2 );
CNSTI4 2
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 669
;668:
;669:	if ( playerGameRank != 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $491
line 670
;670:		postgameMenuInfo.winnerSound = trap_S_RegisterSound( va( "sound/player/announce/%s_wins.wav", postgameMenuInfo.placeNames[0] ), qfalse );
ADDRGP4 $494
ARGP4
ADDRGP4 postgameMenuInfo+1540
ARGP4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1232
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1236
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+1824
ADDRLP4 1236
INDIRI4
ASGNI4
line 671
;671:		trap_Cmd_ExecuteText( EXEC_APPEND, "music music/loss\n" );
CNSTI4 2
ARGI4
ADDRGP4 $496
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 672
;672:	}
ADDRGP4 $492
JUMPV
LABELV $491
line 673
;673:	else {
line 674
;674:		postgameMenuInfo.winnerSound = trap_S_RegisterSound( "sound/player/announce/youwin.wav", qfalse );
ADDRGP4 $315
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1232
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+1824
ADDRLP4 1232
INDIRI4
ASGNI4
line 675
;675:		trap_Cmd_ExecuteText( EXEC_APPEND, "music music/win\n" );
CNSTI4 2
ARGI4
ADDRGP4 $498
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 676
;676:	}
LABELV $492
line 678
;677:
;678:	postgameMenuInfo.phase = 1;
ADDRGP4 postgameMenuInfo+1424
CNSTI4 1
ASGNI4
line 680
;679:
;680:	postgameMenuInfo.lastTier = UI_GetNumSPTiers();
ADDRLP4 1232
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+1820
ADDRLP4 1232
INDIRI4
ASGNI4
line 681
;681:	if ( UI_GetSpecialArenaInfo( "final" ) ) {
ADDRGP4 $503
ARGP4
ADDRLP4 1236
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $501
line 682
;682:		postgameMenuInfo.lastTier++;
ADDRLP4 1240
ADDRGP4 postgameMenuInfo+1820
ASGNP4
ADDRLP4 1240
INDIRP4
ADDRLP4 1240
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 683
;683:	}
LABELV $501
line 684
;684:}
LABELV $393
endproc UI_SPPostgameMenu_f 1244 12
bss
align 1
LABELV arenainfo
skip 1024
align 4
LABELV postgameMenuInfo
skip 1828
import UI_MapCallVote
import UI_saveMapEdMenu
import UI_saveMapEdMenu_Cache
import UI_loadMapEdMenu
import UI_loadMapEd_Cache
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
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import UIE_AwardIcons_DrawValues
import UIE_AwardIcons_PlaySound
import UIE_AwardIcons_InitControls
import UIE_AwardIcons_Cache
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
LABELV $503
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $498
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $496
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $494
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $399
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $395
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $315
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 121
byte 1 111
byte 1 117
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $314
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $313
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $306
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
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $305
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
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $304
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $303
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $302
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
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $301
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
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $300
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $290
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
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
LABELV $279
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
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 116
byte 1 105
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $278
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $276
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
LABELV $275
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
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $266
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
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 69
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $265
byte 1 0
align 1
LABELV $264
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $212
byte 1 115
byte 1 118
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $209
byte 1 35
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $206
byte 1 40
byte 1 116
byte 1 105
byte 1 101
byte 1 41
byte 1 0
align 1
LABELV $183
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $180
byte 1 37
byte 1 105
byte 1 37
byte 1 37
byte 1 0
align 1
LABELV $154
byte 1 97
byte 1 98
byte 1 111
byte 1 114
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $145
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
byte 1 59
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $126
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 100
byte 1 117
byte 1 112
byte 1 101
byte 1 10
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
LABELV $122
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
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $121
byte 1 68
byte 1 117
byte 1 112
byte 1 108
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $112
byte 1 110
byte 1 0
align 1
LABELV $111
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $104
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $103
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $102
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $98
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $97
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $96
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 95
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $94
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
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
byte 1 95
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $93
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $92
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $91
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $90
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
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
LABELV $89
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
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
LABELV $88
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
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
LABELV $87
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $86
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $85
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $84
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $83
byte 1 69
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
LABELV $82
byte 1 73
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
LABELV $81
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
