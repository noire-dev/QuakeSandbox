data
align 4
LABELV master_items
address $93
address $94
byte 4 0
align 4
LABELV servertype_items
address $95
address $96
address $97
address $98
address $99
address $100
address $101
address $102
address $103
address $104
address $105
address $106
address $107
address $108
address $109
byte 4 0
align 4
LABELV sortkey_items
address $110
address $111
address $112
address $113
address $114
byte 4 0
align 4
LABELV master_itemsru
address $115
address $116
byte 4 0
align 4
LABELV servertype_itemsru
address $117
address $118
address $119
address $120
address $121
address $122
address $123
address $124
address $125
address $126
address $127
address $128
address $129
byte 4 0
align 4
LABELV sortkey_itemsru
address $130
address $131
address $132
address $133
address $134
byte 4 0
align 4
LABELV gamenames
address $135
address $136
address $137
address $138
address $139
address $102
address $140
address $104
address $141
address $142
address $143
address $144
address $145
byte 4 0
align 4
LABELV netnames
address $145
address $146
address $147
byte 4 0
align 1
LABELV quake3worldMessage
byte 1 86
byte 1 105
byte 1 115
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 116
byte 1 116
byte 1 112
byte 1 115
byte 1 58
byte 1 47
byte 1 47
byte 1 100
byte 1 97
byte 1 110
byte 1 105
byte 1 108
byte 1 115
byte 1 109
byte 1 111
byte 1 100
byte 1 46
byte 1 110
byte 1 101
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 46
byte 1 111
byte 1 114
byte 1 103
byte 1 47
byte 1 32
byte 1 45
byte 1 32
byte 1 78
byte 1 101
byte 1 119
byte 1 115
byte 1 44
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 121
byte 1 44
byte 1 32
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 44
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
export punkbuster_items
align 4
LABELV punkbuster_items
address $148
address $149
byte 4 0
export punkbuster_itemsru
align 4
LABELV punkbuster_itemsru
address $150
address $151
byte 4 0
export punkbuster_msg
align 4
LABELV punkbuster_msg
address $152
address $153
address $154
address $155
byte 4 0
code
proc ArenaServers_MaxPing 8 4
file "../../../code/q3_ui/ui_servers2.c"
line 305
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:MULTIPLAYER MENU (SERVER BROWSER)
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:
;13:
;14:
;15:#include "ui_local.h"
;16:#include "ui_startserver.h"
;17:
;18:
;19:#define MAX_GLOBALSERVERS		128
;20:#define MAX_PINGREQUESTS		32
;21:#define MAX_ADDRESSLENGTH		64
;22:#define MAX_HOSTNAMELENGTH		22
;23:#define MAX_ADDONNAMELENGTH		32
;24:#define MAX_MAPNAMELENGTH		32
;25:#define MAX_LISTBOXITEMS		128
;26:#define MAX_LOCALSERVERS		128
;27:#define MAX_STATUSLENGTH		64
;28:#define MAX_LEAGUELENGTH		28
;29:#define MAX_LISTBOXWIDTH		82
;30:
;31:#define ART_BACK0				"menu/art/back_0"
;32:#define ART_BACK1				"menu/art/back_1"
;33:#define ART_CREATE0				"menu/art/create_0"
;34:#define ART_CREATE1				"menu/art/create_1"
;35:#define ART_SPECIFY0			"menu/art/specify_0"
;36:#define ART_SPECIFY1			"menu/art/specify_1"
;37:#define ART_REFRESH0			"menu/art/refresh_0"
;38:#define ART_REFRESH1			"menu/art/refresh_1"
;39:#define ART_CONNECT0			"menu/art/fight_0"
;40:#define ART_CONNECT1			"menu/art/fight_1"
;41:#define ART_ARROWS0				"menu/art/arrows_vert_0"
;42:#define ART_ARROWS_UP			"menu/art/arrows_vert_top"
;43:#define ART_ARROWS_DOWN			"menu/art/arrows_vert_bot"
;44:#define ART_UNKNOWNMAP			"menu/art/unknownmap"
;45:#define ART_REMOVE0				"menu/art/delete_0"
;46:#define ART_REMOVE1				"menu/art/delete_1"
;47:#define ART_PUNKBUSTER		"menu/art/pblogo"
;48:#define ART_SAVE0   "menu/art/save_0"
;49:#define ART_SAVE1   "menu/art/save_1"
;50:
;51:#define ID_MASTER			10
;52:#define ID_GAMETYPE			11
;53:#define ID_SORTKEY			12
;54:#define ID_SHOW_FULL		13
;55:#define ID_SHOW_EMPTY		14
;56:#define ID_LIST				15
;57:#define ID_SCROLL_UP		16
;58:#define ID_SCROLL_DOWN		17
;59:#define ID_BACK				18
;60:#define ID_REFRESH			19
;61:#define ID_SPECIFY			20
;62:#define ID_CREATE			21
;63:#define ID_CONNECT			22
;64:#define ID_REMOVE			23
;65:#define ID_PUNKBUSTER 24
;66:#define ID_SAVE 			25
;67:
;68:#define GR_LOGO				30
;69:#define GR_LETTERS			31
;70:
;71:#define AS_LOCAL			0
;72:#define AS_MPLAYER			1
;73:#define AS_GLOBAL			2
;74:#define AS_FAVORITES		3
;75:
;76:#define SORT_HOST			0
;77:#define SORT_MAP			1
;78:#define SORT_CLIENTS		2
;79:#define SORT_GAME			3
;80:#define SORT_PING			4
;81:
;82:#define GAMES_ALL			0
;83:#define GAMES_SANDBOX		1
;84:#define GAMES_FFA			2
;85:#define GAMES_SINGLE		3
;86:#define GAMES_TEAMPLAY		4
;87:#define GAMES_TOURNEY		5
;88:#define GAMES_CTF			6
;89:#define GAMES_ONEFLAG		7
;90:#define GAMES_OBELISK		8
;91:#define GAMES_HARVESTER		9
;92:#define GAMES_ELIMINATION	10
;93:#define GAMES_ELIM_CTF		11
;94:#define GAMES_LMS			12
;95:#define GAMES_DD			13
;96:#define GAMES_DOM			14
;97:
;98:static const char *master_items[] = {
;99:	"Local",
;100:	"Favorites",
;101:	0
;102:};
;103:
;104:static const char *servertype_items[] = {
;105:	"All",
;106:	"Sandbox",
;107:	"Free For All",
;108:	"Single Player",
;109:	"Team Deathmatch",
;110:	"Tournament",
;111:	"Capture the Flag",
;112:	"One Flag CTF",
;113:	"Overload",
;114:	"Harvester",
;115:	"Elimination",
;116:	"CTF Elimination",
;117:	"Last Man Standing",
;118:	"Double Domination",
;119:	"Domination",
;120:	0
;121:};
;122:
;123:static const char *sortkey_items[] = {
;124:	"Server Name",
;125:	"Map Name",
;126:	"Open Player Spots",
;127:	"Game Type",
;128:	"Ping Time",
;129:	0
;130:};
;131:
;132:static const char *master_itemsru[] = {
;133:	"Локальные",
;134:	"Любимые",
;135:	0
;136:};
;137:
;138:static const char *servertype_itemsru[] = {
;139:	"Все",
;140:	"Все Против Всех",
;141:	"Командный Бой",
;142:	"Турнир",
;143:	"Захват флага",
;144:	"Один Флаг",
;145:	"Атака Базы",
;146:	"Жнец",
;147:	"Устранение",
;148:	"Устранение: Захват флага",
;149:	"Последний оставшийся",
;150:	"Двойное доминирование",
;151:	"Доминирование",
;152:	0
;153:};
;154:
;155:static const char *sortkey_itemsru[] = {
;156:	"Имя Сервера",
;157:	"Имя Карты",
;158:	"Открытые Слоты",
;159:	"Режим Игры",
;160:	"Время Отклика",
;161:	0
;162:};
;163:
;164:static char* gamenames[] = {
;165:	"DM ",	// deathmatch
;166:	"1v1",	// tournament
;167:	"SP ",	// single player
;168:	"Team DM",	// team deathmatch
;169:	"CTF",	// capture the flag
;170:	"One Flag CTF",		// one flag ctf
;171:	"OverLoad",				// Overload
;172:	"Harvester",			// Harvester
;173:	"Rocket Arena 3",	// Rocket Arena 3
;174:	"Q3F",						// Q3F
;175:	"Urban Terror",		// Urban Terror
;176:	"OSP",						// Orange Smoothie Productions
;177:	"???",			// unknown
;178:	0
;179:};
;180:
;181:static char* netnames[] = {
;182:	"???",
;183:	"IPv4",
;184:	"IPv6",
;185:	NULL
;186:};
;187:
;188:static char quake3worldMessage[] = "Visit https://danilsmod.neocities.org/ - News, Community, Events, Files";
;189:
;190:const char* punkbuster_items[] = {
;191:	"Disabled",
;192:	"Enabled",
;193:	NULL
;194:};
;195:const char* punkbuster_itemsru[] = {
;196:	"Выключен",
;197:	"Включен",
;198:	NULL
;199:};
;200:
;201:const char* punkbuster_msg[] = {
;202:	"PunkBuster will be",
;203:	"disabled the next time",
;204:	"Quake III Arena",
;205:	"is started.",
;206:	NULL
;207:};
;208:
;209:typedef struct {
;210:	char	adrstr[MAX_ADDRESSLENGTH];
;211:	int		start;
;212:} pinglist_t;
;213:
;214:typedef struct servernode_s {
;215:	char	adrstr[MAX_ADDRESSLENGTH];
;216:	char	hostname[MAX_HOSTNAMELENGTH + 3];
;217:	char	addonname[MAX_ADDONNAMELENGTH];
;218:	char	mapname[MAX_MAPNAMELENGTH];
;219:	int		numclients;
;220:	int		maxclients;
;221:	int		pingtime;
;222:	int		gametype;
;223:	char	gamename[30];
;224:	int		nettype;
;225:	int		minPing;
;226:	int		maxPing;
;227:	qboolean bPB;
;228:
;229:} servernode_t; 
;230:
;231:typedef struct {
;232:	char			buff[MAX_LISTBOXWIDTH];
;233:	servernode_t*	servernode;
;234:} table_t;
;235:
;236:typedef struct {
;237:	menuframework_s		menu;
;238:
;239:	menutext_s			banner;
;240:
;241:	menulist_s			master;
;242:	menulist_s			gametype;
;243:	menulist_s			sortkey;
;244:	menuradiobutton_s	showfull;
;245:	menuradiobutton_s	showempty;
;246:
;247:	menulist_s			list;
;248:	menubitmap_s		mappic;
;249:	menubitmap_s		arrows;
;250:	menubitmap_s		up;
;251:	menubitmap_s		down;
;252:	menutext_s			status;
;253:	menutext_s			statusbar;
;254:	menubitmap_s       save;
;255:	
;256:	menubitmap_s		remove;
;257:	menubitmap_s		back;
;258:	menubitmap_s		refresh;
;259:	menubitmap_s		specify;
;260:	menubitmap_s		create;
;261:	menubitmap_s		go;
;262:	menufield_s		password;
;263:
;264:	pinglist_t			pinglist[MAX_PINGREQUESTS];
;265:	table_t				table[MAX_LISTBOXITEMS];
;266:	char*				items[MAX_LISTBOXITEMS];
;267:	int					numqueriedservers;
;268:	int					*numservers;
;269:	servernode_t		*serverlist;	
;270:	int					currentping;
;271:	qboolean			refreshservers;
;272:	int					nextpingtime;
;273:	int					maxservers;
;274:	int					refreshtime;
;275:	char				favoriteaddresses[MAX_FAVORITESERVERS][MAX_ADDRESSLENGTH];
;276:	int					numfavoriteaddresses;
;277:
;278:	menulist_s		punkbuster;
;279:	menubitmap_s	pblogo;
;280:} arenaservers_t;
;281:
;282:static arenaservers_t	g_arenaservers;
;283:
;284:
;285:static servernode_t		g_globalserverlist[MAX_GLOBALSERVERS];
;286:static int				g_numglobalservers;
;287:static servernode_t		g_localserverlist[MAX_LOCALSERVERS];
;288:static int				g_numlocalservers;
;289:static servernode_t		g_favoriteserverlist[MAX_FAVORITESERVERS];
;290:static int				g_numfavoriteservers;
;291:static servernode_t		g_mplayerserverlist[MAX_GLOBALSERVERS];
;292:static int				g_nummplayerservers;
;293:static int				g_servertype;
;294:static int				g_gametype;
;295:static int				g_sortkey;
;296:static int				g_emptyservers;
;297:static int				g_fullservers;
;298:
;299:
;300:/*
;301:=================
;302:ArenaServers_MaxPing
;303:=================
;304:*/
;305:static int ArenaServers_MaxPing( void ) {
line 308
;306:	int		maxPing;
;307:
;308:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
ADDRGP4 $160
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 309
;309:	if( maxPing < 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
GEI4 $161
line 310
;310:		maxPing = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 311
;311:	}
LABELV $161
line 312
;312:	return maxPing;
ADDRLP4 0
INDIRI4
RETI4
LABELV $159
endproc ArenaServers_MaxPing 8 4
proc ArenaServers_Compare 68 8
line 321
;313:}
;314:
;315:
;316:/*
;317:=================
;318:ArenaServers_Compare
;319:=================
;320:*/
;321:static int QDECL ArenaServers_Compare( const void *arg1, const void *arg2 ) {
line 327
;322:	float			f1;
;323:	float			f2;
;324:	servernode_t*	t1;
;325:	servernode_t*	t2;
;326:
;327:	t1 = (servernode_t *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 328
;328:	t2 = (servernode_t *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 330
;329:
;330:	switch( g_sortkey ) {
ADDRLP4 16
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $164
ADDRLP4 16
INDIRI4
CNSTI4 4
GTI4 $164
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $187
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $187
address $166
address $167
address $168
address $177
address $182
code
LABELV $166
line 332
;331:	case SORT_HOST:
;332:		return Q_stricmp( t1->hostname, t2->hostname );
ADDRLP4 20
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $163
JUMPV
LABELV $167
line 335
;333:
;334:	case SORT_MAP:
;335:		return Q_stricmp( t1->mapname, t2->mapname );
ADDRLP4 28
CNSTI4 121
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $163
JUMPV
LABELV $168
line 338
;336:
;337:	case SORT_CLIENTS:
;338:		f1 = t1->maxclients - t1->numclients;
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 339
;339:		if( f1 < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $169
line 340
;340:			f1 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 341
;341:		}
LABELV $169
line 343
;342:
;343:		f2 = t2->maxclients - t2->numclients;
ADDRLP4 40
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 344
;344:		if( f2 < 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
GEF4 $171
line 345
;345:			f2 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 346
;346:		}
LABELV $171
line 348
;347:
;348:		if( f1 < f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $173
line 349
;349:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $163
JUMPV
LABELV $173
line 351
;350:		}
;351:		if( f1 == f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $175
line 352
;352:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $163
JUMPV
LABELV $175
line 354
;353:		}
;354:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $163
JUMPV
LABELV $177
line 357
;355:
;356:	case SORT_GAME:
;357:		if( t1->gametype < t2->gametype ) {
ADDRLP4 44
CNSTI4 168
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
GEI4 $178
line 358
;358:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $163
JUMPV
LABELV $178
line 360
;359:		}
;360:		if( t1->gametype == t2->gametype ) {
ADDRLP4 48
CNSTI4 168
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $180
line 361
;361:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $163
JUMPV
LABELV $180
line 363
;362:		}
;363:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $163
JUMPV
LABELV $182
line 366
;364:
;365:	case SORT_PING:
;366:		if( t1->pingtime < t2->pingtime ) {
ADDRLP4 52
CNSTI4 164
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
GEI4 $183
line 367
;367:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $163
JUMPV
LABELV $183
line 369
;368:		}
;369:		if( t1->pingtime > t2->pingtime ) {
ADDRLP4 56
CNSTI4 164
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
LEI4 $185
line 370
;370:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $163
JUMPV
LABELV $185
line 372
;371:		}
;372:		return Q_stricmp( t1->hostname, t2->hostname );
ADDRLP4 60
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
ADDRGP4 $163
JUMPV
LABELV $164
line 375
;373:	}
;374:
;375:	return 0;
CNSTI4 0
RETI4
LABELV $163
endproc ArenaServers_Compare 68 8
proc ArenaServers_Go 16 8
line 384
;376:}
;377:
;378:
;379:/*
;380:=================
;381:ArenaServers_Go
;382:=================
;383:*/
;384:static void ArenaServers_Go( void ) {
line 387
;385:	servernode_t*	servernode;
;386:
;387:	servernode = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 88
ADDRGP4 g_arenaservers+1768+92
INDIRI4
MULI4
ADDRGP4 g_arenaservers+5924+84
ADDP4
INDIRP4
ASGNP4
line 388
;388:	if( servernode ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $193
line 389
;389:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "set cl_selectedmod %s\n", servernode->addonname ) );
ADDRGP4 $195
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
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
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 390
;390:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "set password %s\n", g_arenaservers.password.field.buffer ) );
ADDRGP4 $196
ARGP4
ADDRGP4 g_arenaservers+3384+88+12
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 391
;391:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", servernode->adrstr ) );
ADDRGP4 $200
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 392
;392:	}
LABELV $193
line 393
;393:}
LABELV $188
endproc ArenaServers_Go 16 8
bss
align 1
LABELV $202
skip 64
code
proc ArenaServers_UpdatePicture 4 16
line 401
;394:
;395:
;396:/*
;397:=================
;398:ArenaServers_UpdatePicture
;399:=================
;400:*/
;401:static void ArenaServers_UpdatePicture( void ) {
line 405
;402:	static char		picname[64];
;403:	servernode_t*	servernodeptr;
;404:
;405:	if( !g_arenaservers.list.numitems ) {
ADDRGP4 g_arenaservers+1768+96
INDIRI4
CNSTI4 0
NEI4 $203
line 406
;406:		g_arenaservers.mappic.generic.name = NULL;
ADDRGP4 g_arenaservers+1900+4
CNSTP4 0
ASGNP4
line 407
;407:	}
ADDRGP4 $204
JUMPV
LABELV $203
line 408
;408:	else {
line 409
;409:		servernodeptr = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 88
ADDRGP4 g_arenaservers+1768+92
INDIRI4
MULI4
ADDRGP4 g_arenaservers+5924+84
ADDP4
INDIRP4
ASGNP4
line 410
;410:		Com_sprintf( picname, sizeof(picname), "levelshots/%s.tga", servernodeptr->mapname );
ADDRGP4 $202
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $213
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 121
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 411
;411:		g_arenaservers.mappic.generic.name = picname;
ADDRGP4 g_arenaservers+1900+4
ADDRGP4 $202
ASGNP4
line 413
;412:	
;413:	}
LABELV $204
line 416
;414:
;415:	// force shader update during draw
;416:	g_arenaservers.mappic.shader = 0;
ADDRGP4 g_arenaservers+1900+96
CNSTI4 0
ASGNI4
line 417
;417:}
LABELV $201
endproc ArenaServers_UpdatePicture 4 16
proc ArenaServers_UpdateMenu 72 44
line 425
;418:
;419:
;420:/*
;421:=================
;422:ArenaServers_UpdateMenu
;423:=================
;424:*/
;425:static void ArenaServers_UpdateMenu( void ) {
line 434
;426:	int				i;
;427:	int				j;
;428:	int				count;
;429:	char*			buff;
;430:	servernode_t*	servernodeptr;
;431:	table_t*		tableptr;
;432:	char			*pingColor;
;433:
;434:	if( g_arenaservers.numqueriedservers > 0 ) {
ADDRGP4 g_arenaservers+17700
INDIRI4
CNSTI4 0
LEI4 $219
line 436
;435:		// servers found
;436:		if( g_arenaservers.refreshservers && ( g_arenaservers.currentping <= g_arenaservers.numqueriedservers ) ) {
ADDRGP4 g_arenaservers+17716
INDIRI4
CNSTI4 0
EQI4 $222
ADDRGP4 g_arenaservers+17712
INDIRI4
ADDRGP4 g_arenaservers+17700
INDIRI4
GTI4 $222
line 438
;437:			// show progress
;438:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $227
line 439
;439:			Com_sprintf( g_arenaservers.status.string, MAX_STATUSLENGTH, "%d of %d QSandbox Servers.", g_arenaservers.currentping, g_arenaservers.numqueriedservers);
ADDRGP4 g_arenaservers+2364+88
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $232
ARGP4
ADDRGP4 g_arenaservers+17712
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+17700
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 440
;440:			g_arenaservers.statusbar.string  = "Press SPACE to stop";
ADDRGP4 g_arenaservers+2468+88
ADDRGP4 $237
ASGNP4
line 441
;441:			}
LABELV $227
line 442
;442:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $238
line 443
;443:			Com_sprintf( g_arenaservers.status.string, MAX_STATUSLENGTH, "%d из %d QSandbox Серверов.", g_arenaservers.currentping, g_arenaservers.numqueriedservers);
ADDRGP4 g_arenaservers+2364+88
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $243
ARGP4
ADDRGP4 g_arenaservers+17712
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+17700
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 444
;444:			g_arenaservers.statusbar.string  = "Нажмите SPACE для остановки";
ADDRGP4 g_arenaservers+2468+88
ADDRGP4 $248
ASGNP4
line 445
;445:			}
LABELV $238
line 446
;446:			qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+17708
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
ARGI4
CNSTI4 220
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 447
;447:		}
ADDRGP4 $220
JUMPV
LABELV $222
line 448
;448:		else {
line 450
;449:			// all servers pinged - enable controls
;450:			g_arenaservers.save.generic.flags &= ~QMF_GRAYED;
ADDRLP4 28
ADDRGP4 g_arenaservers+2572+72
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 451
;451:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 32
ADDRGP4 g_arenaservers+1180+72
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 452
;452:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 36
ADDRGP4 g_arenaservers+1312+72
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 453
;453:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+1444+72
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 454
;454:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+1672+72
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 455
;455:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+1576+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 456
;456:			g_arenaservers.list.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+1768+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 457
;457:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+2920+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 458
;458:			g_arenaservers.go.generic.flags			&= ~QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+3268+72
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 459
;459:			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
ADDRLP4 64
ADDRGP4 g_arenaservers+19784+72
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 462
;460:
;461:			// update status bar
;462:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $273
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $271
LABELV $273
line 463
;463:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+2468+88
ADDRGP4 quake3worldMessage
ASGNP4
line 464
;464:			}
ADDRGP4 $220
JUMPV
LABELV $271
line 465
;465:			else {
line 466
;466:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+2468+88
ADDRGP4 $278
ASGNP4
line 467
;467:			}
line 469
;468:
;469:		}
line 470
;470:	}
ADDRGP4 $220
JUMPV
LABELV $219
line 471
;471:	else {
line 473
;472:		// no servers found
;473:		if( g_arenaservers.refreshservers ) {
ADDRGP4 g_arenaservers+17716
INDIRI4
CNSTI4 0
EQI4 $279
line 474
;474:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $282
line 475
;475:			strcpy( g_arenaservers.status.string,"Scanning For Servers..." );
ADDRGP4 g_arenaservers+2364+88
INDIRP4
ARGP4
ADDRGP4 $287
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 476
;476:			g_arenaservers.statusbar.string = "Press SPACE to stop";
ADDRGP4 g_arenaservers+2468+88
ADDRGP4 $237
ASGNP4
line 477
;477:			}
LABELV $282
line 478
;478:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $290
line 479
;479:			strcpy( g_arenaservers.status.string,"Поиск Серверов..." );
ADDRGP4 g_arenaservers+2364+88
INDIRP4
ARGP4
ADDRGP4 $295
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 480
;480:			g_arenaservers.statusbar.string = "Нажмите SPACE для остановки";
ADDRGP4 g_arenaservers+2468+88
ADDRGP4 $248
ASGNP4
line 481
;481:			}
LABELV $290
line 484
;482:
;483:			// disable controls during refresh
;484:			g_arenaservers.save.generic.flags |= QMF_GRAYED;
ADDRLP4 28
ADDRGP4 g_arenaservers+2572+72
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 485
;485:			g_arenaservers.master.generic.flags		|= QMF_GRAYED;
ADDRLP4 32
ADDRGP4 g_arenaservers+1180+72
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 486
;486:			g_arenaservers.gametype.generic.flags	|= QMF_GRAYED;
ADDRLP4 36
ADDRGP4 g_arenaservers+1312+72
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 487
;487:			g_arenaservers.sortkey.generic.flags	|= QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+1444+72
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 488
;488:			g_arenaservers.showempty.generic.flags	|= QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+1672+72
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 489
;489:			g_arenaservers.showfull.generic.flags	|= QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+1576+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 490
;490:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+1768+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 491
;491:			g_arenaservers.refresh.generic.flags	|= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+2920+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 492
;492:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+3268+72
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 493
;493:			g_arenaservers.punkbuster.generic.flags |= QMF_GRAYED;
ADDRLP4 64
ADDRGP4 g_arenaservers+19784+72
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 494
;494:		}
ADDRGP4 $280
JUMPV
LABELV $279
line 495
;495:		else {
line 496
;496:			if( g_arenaservers.numqueriedservers < 0 ) {
ADDRGP4 g_arenaservers+17700
INDIRI4
CNSTI4 0
GEI4 $318
line 497
;497:				strcpy(g_arenaservers.status.string,"No Response From Master Server." );
ADDRGP4 g_arenaservers+2364+88
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 498
;498:			}
ADDRGP4 $319
JUMPV
LABELV $318
line 499
;499:			else {
line 500
;500:				if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $324
line 501
;501:				strcpy(g_arenaservers.status.string,"No Servers Found." );
ADDRGP4 g_arenaservers+2364+88
INDIRP4
ARGP4
ADDRGP4 $329
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 502
;502:				}
LABELV $324
line 503
;503:				if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $330
line 504
;504:				strcpy(g_arenaservers.status.string,"Сервера не найдены." );
ADDRGP4 g_arenaservers+2364+88
INDIRP4
ARGP4
ADDRGP4 $335
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 505
;505:				}
LABELV $330
line 506
;506:			}
LABELV $319
line 509
;507:
;508:			// update status bar
;509:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 28
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $338
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $336
LABELV $338
line 510
;510:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+2468+88
ADDRGP4 quake3worldMessage
ASGNP4
line 511
;511:			}
ADDRGP4 $337
JUMPV
LABELV $336
line 512
;512:			else {
line 513
;513:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+2468+88
ADDRGP4 $278
ASGNP4
line 514
;514:			}
LABELV $337
line 517
;515:
;516:			// end of refresh - set control state
;517:			g_arenaservers.save.generic.flags |= QMF_GRAYED;
ADDRLP4 32
ADDRGP4 g_arenaservers+2572+72
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 518
;518:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 36
ADDRGP4 g_arenaservers+1180+72
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 519
;519:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+1312+72
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 520
;520:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+1444+72
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 521
;521:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+1672+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 522
;522:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+1576+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 523
;523:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+1768+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 524
;524:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+2920+72
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 525
;525:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 64
ADDRGP4 g_arenaservers+3268+72
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 526
;526:			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
ADDRLP4 68
ADDRGP4 g_arenaservers+19784+72
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 527
;527:		}
LABELV $280
line 530
;528:
;529:		// zero out list box
;530:		g_arenaservers.list.numitems = 0;
ADDRGP4 g_arenaservers+1768+96
CNSTI4 0
ASGNI4
line 531
;531:		g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+1768+92
CNSTI4 0
ASGNI4
line 532
;532:		g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+1768+100
CNSTI4 0
ASGNI4
line 535
;533:
;534:		// update picture
;535:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 536
;536:		return;
ADDRGP4 $218
JUMPV
LABELV $220
line 540
;537:	}
;538:
;539:	// build list box strings - apply culling filters
;540:	servernodeptr = g_arenaservers.serverlist;
ADDRLP4 0
ADDRGP4 g_arenaservers+17708
INDIRP4
ASGNP4
line 541
;541:	count         = *g_arenaservers.numservers;
ADDRLP4 24
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
ASGNI4
line 542
;542:	for( i = 0, j = 0; i < count; i++, servernodeptr++ ) {
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $374
JUMPV
LABELV $371
line 543
;543:		tableptr = &g_arenaservers.table[j];
ADDRLP4 4
CNSTI4 88
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_arenaservers+5924
ADDP4
ASGNP4
line 544
;544:		tableptr->servernode = servernodeptr;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 545
;545:		buff = tableptr->buff;
ADDRLP4 16
ADDRLP4 4
INDIRP4
ASGNP4
line 548
;546:
;547:		// can only cull valid results
;548:		if( !g_emptyservers && !servernodeptr->numclients ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 g_emptyservers
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $376
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $376
line 549
;549:			continue;
ADDRGP4 $372
JUMPV
LABELV $376
line 552
;550:		}
;551:
;552:		if( !g_fullservers && ( servernodeptr->numclients == servernodeptr->maxclients ) ) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
NEI4 $378
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
NEI4 $378
line 553
;553:			continue;
ADDRGP4 $372
JUMPV
LABELV $378
line 556
;554:		}
;555:
;556:		switch( g_gametype ) {
ADDRLP4 40
ADDRGP4 g_gametype
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
LTI4 $380
ADDRLP4 40
INDIRI4
CNSTI4 14
GTI4 $380
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $425
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $425
address $381
address $383
address $386
address $389
address $392
address $395
address $398
address $401
address $404
address $407
address $410
address $413
address $416
address $419
address $422
code
line 558
;557:		case GAMES_ALL:
;558:			break;
LABELV $383
line 561
;559:			
;560:		case GAMES_SANDBOX:
;561:			if( servernodeptr->gametype != GT_SANDBOX ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
EQI4 $381
line 562
;562:				continue;
ADDRGP4 $372
JUMPV
line 564
;563:			}
;564:			break;
LABELV $386
line 567
;565:
;566:		case GAMES_FFA:
;567:			if( servernodeptr->gametype != GT_FFA ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1
EQI4 $381
line 568
;568:				continue;
ADDRGP4 $372
JUMPV
line 570
;569:			}
;570:			break;
LABELV $389
line 573
;571:			
;572:		case GAMES_SINGLE:
;573:			if( servernodeptr->gametype != GT_SINGLE ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 2
EQI4 $381
line 574
;574:				continue;
ADDRGP4 $372
JUMPV
line 576
;575:			}
;576:			break;
LABELV $392
line 579
;577:
;578:		case GAMES_TEAMPLAY:
;579:			if( servernodeptr->gametype != GT_TEAM ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
EQI4 $381
line 580
;580:				continue;
ADDRGP4 $372
JUMPV
line 582
;581:			}
;582:			break;
LABELV $395
line 585
;583:
;584:		case GAMES_TOURNEY:
;585:			if( servernodeptr->gametype != GT_TOURNAMENT ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 3
EQI4 $381
line 586
;586:				continue;
ADDRGP4 $372
JUMPV
line 588
;587:			}
;588:			break;
LABELV $398
line 591
;589:
;590:		case GAMES_CTF:
;591:			if( servernodeptr->gametype != GT_CTF ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
EQI4 $381
line 592
;592:				continue;
ADDRGP4 $372
JUMPV
line 594
;593:			}
;594:			break;
LABELV $401
line 597
;595:			
;596:		case GAMES_ONEFLAG:
;597:			if( servernodeptr->gametype != GT_1FCTF ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 6
EQI4 $381
line 598
;598:				continue;
ADDRGP4 $372
JUMPV
line 600
;599:			}
;600:			break;
LABELV $404
line 603
;601:			
;602:		case GAMES_OBELISK:
;603:			if( servernodeptr->gametype != GT_OBELISK ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 7
EQI4 $381
line 604
;604:				continue;
ADDRGP4 $372
JUMPV
line 606
;605:			}
;606:			break;
LABELV $407
line 609
;607:
;608:		case GAMES_HARVESTER:
;609:			if( servernodeptr->gametype != GT_HARVESTER ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 8
EQI4 $381
line 610
;610:				continue;
ADDRGP4 $372
JUMPV
line 612
;611:			}
;612:			break;
LABELV $410
line 615
;613:			
;614:		case GAMES_ELIMINATION:
;615:			if( servernodeptr->gametype != GT_ELIMINATION ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 9
EQI4 $381
line 616
;616:				continue;
ADDRGP4 $372
JUMPV
line 618
;617:			}
;618:			break;
LABELV $413
line 621
;619:			
;620:		case GAMES_ELIM_CTF:
;621:			if( servernodeptr->gametype != GT_CTF_ELIMINATION ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 10
EQI4 $381
line 622
;622:				continue;
ADDRGP4 $372
JUMPV
line 624
;623:			}
;624:			break;
LABELV $416
line 627
;625:			
;626:		case GAMES_LMS:
;627:			if( servernodeptr->gametype != GT_LMS ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 11
EQI4 $381
line 628
;628:				continue;
ADDRGP4 $372
JUMPV
line 630
;629:			}
;630:			break;
LABELV $419
line 633
;631:			
;632:		case GAMES_DD:
;633:			if( servernodeptr->gametype != GT_DOUBLE_D ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 12
EQI4 $381
line 634
;634:				continue;
ADDRGP4 $372
JUMPV
line 636
;635:			}
;636:			break;
LABELV $422
line 639
;637:			
;638:		case GAMES_DOM:
;639:			if( servernodeptr->gametype != GT_DOMINATION ) {
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 13
EQI4 $381
line 640
;640:				continue;
ADDRGP4 $372
JUMPV
line 642
;641:			}
;642:			break;
LABELV $380
LABELV $381
line 645
;643:		}
;644:
;645:		if( servernodeptr->pingtime < servernodeptr->minPing ) {
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $426
line 646
;646:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $428
ASGNP4
line 647
;647:		}
ADDRGP4 $427
JUMPV
LABELV $426
line 648
;648:		else if( servernodeptr->maxPing && servernodeptr->pingtime > servernodeptr->maxPing ) {
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $429
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $429
line 649
;649:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $428
ASGNP4
line 650
;650:		}
ADDRGP4 $430
JUMPV
LABELV $429
line 651
;651:		else if( servernodeptr->pingtime < 200 ) {
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 200
GEI4 $431
line 652
;652:			pingColor = S_COLOR_GREEN;
ADDRLP4 20
ADDRGP4 $433
ASGNP4
line 653
;653:		}
ADDRGP4 $432
JUMPV
LABELV $431
line 654
;654:		else if( servernodeptr->pingtime < 400 ) {
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 400
GEI4 $434
line 655
;655:			pingColor = S_COLOR_YELLOW;
ADDRLP4 20
ADDRGP4 $436
ASGNP4
line 656
;656:		}
ADDRGP4 $435
JUMPV
LABELV $434
line 657
;657:		else {
line 658
;658:			pingColor = S_COLOR_RED;
ADDRLP4 20
ADDRGP4 $437
ASGNP4
line 659
;659:		}
LABELV $435
LABELV $432
LABELV $430
LABELV $427
line 660
;660:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $438
line 661
;661:   		Com_sprintf( buff, MAX_LISTBOXWIDTH, "%-20.20s %-12.12s %2d/%2d %-30.30s %3s %s%3d",
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 82
ARGI4
ADDRGP4 $441
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 121
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 665
;662:	   		servernodeptr->hostname, servernodeptr->mapname, servernodeptr->numclients,
;663: 		   	servernodeptr->maxclients, servernodeptr->gamename,
;664:			   netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime );
;665:}
LABELV $438
line 666
;666:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $442
line 667
;667:   		Com_sprintf( buff, MAX_LISTBOXWIDTH, "%-20.20s %-12.12s %2d/%2d %-30.30s %3s %s%3d",
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 82
ARGI4
ADDRGP4 $441
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 121
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 671
;668:	   		servernodeptr->hostname, servernodeptr->mapname, servernodeptr->numclients,
;669: 		   	servernodeptr->maxclients, servernodeptr->gamename,
;670:			   netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime );
;671:}
LABELV $442
line 672
;672:		j++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 673
;673:	}
LABELV $372
line 542
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
ASGNP4
LABELV $374
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $371
line 677
;674:
;675://	Com_sprintf( g_arenaservers.status.string, MAX_STATUSLENGTH, "%d of %d Arena Servers.", j, *g_arenaservers.numservers );
;676:
;677:	g_arenaservers.list.numitems = j;
ADDRGP4 g_arenaservers+1768+96
ADDRLP4 8
INDIRI4
ASGNI4
line 678
;678:	g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+1768+92
CNSTI4 0
ASGNI4
line 679
;679:	g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+1768+100
CNSTI4 0
ASGNI4
line 682
;680:
;681:	// update picture
;682:	ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 683
;683:}
LABELV $218
endproc ArenaServers_UpdateMenu 72 44
proc ArenaServers_Remove 28 12
line 692
;684:
;685:
;686:/*
;687:=================
;688:ArenaServers_Remove
;689:=================
;690:*/
;691:static void ArenaServers_Remove( void )
;692:{
line 697
;693:	int				i;
;694:	servernode_t*	servernodeptr;
;695:	table_t*		tableptr;
;696:
;697:	if (!g_arenaservers.list.numitems)
ADDRGP4 g_arenaservers+1768+96
INDIRI4
CNSTI4 0
NEI4 $452
line 698
;698:		return;
ADDRGP4 $451
JUMPV
LABELV $452
line 704
;699:
;700:	// remove selected item from display list
;701:	// items are in scattered order due to sort and cull
;702:	// perform delete on list box contents, resync all lists
;703:
;704:	tableptr      = &g_arenaservers.table[g_arenaservers.list.curvalue];
ADDRLP4 8
CNSTI4 88
ADDRGP4 g_arenaservers+1768+92
INDIRI4
MULI4
ADDRGP4 g_arenaservers+5924
ADDP4
ASGNP4
line 705
;705:	servernodeptr = tableptr->servernode;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
ASGNP4
line 708
;706:
;707:	// find address in master list
;708:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $462
JUMPV
LABELV $459
line 709
;709:		if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],servernodeptr->adrstr))
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+17732
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $464
line 710
;710:				break;
ADDRGP4 $461
JUMPV
LABELV $464
LABELV $460
line 708
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $462
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+19780
INDIRI4
LTI4 $459
LABELV $461
line 713
;711:
;712:	// delete address from master list
;713:	if (i <= g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+19780
INDIRI4
CNSTI4 1
SUBI4
GTI4 $467
line 714
;714:	{
line 715
;715:		if (i < g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+19780
INDIRI4
CNSTI4 1
SUBI4
GEI4 $470
line 716
;716:		{
line 718
;717:			// shift items up
;718:			memcpy( &g_arenaservers.favoriteaddresses[i], &g_arenaservers.favoriteaddresses[i+1], (g_arenaservers.numfavoriteaddresses - i - 1)*MAX_ADDRESSLENGTH);
ADDRLP4 20
CNSTI4 6
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 g_arenaservers+17732
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
ADDRGP4 g_arenaservers+17732+64
ADDP4
ARGP4
ADDRGP4 g_arenaservers+19780
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ADDRLP4 20
INDIRI4
LSHI4
CNSTI4 64
SUBI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 719
;719:		}
LABELV $470
line 720
;720:		g_arenaservers.numfavoriteaddresses--;
ADDRLP4 16
ADDRGP4 g_arenaservers+19780
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 721
;721:	}	
LABELV $467
line 724
;722:
;723:	// find address in server list
;724:	for (i=0; i<g_numfavoriteservers; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $481
JUMPV
LABELV $478
line 725
;725:		if (&g_favoriteserverlist[i] == servernodeptr)
CNSTI4 220
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $482
line 726
;726:				break;
ADDRGP4 $480
JUMPV
LABELV $482
LABELV $479
line 724
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $481
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $478
LABELV $480
line 729
;727:
;728:	// delete address from server list
;729:	if (i <= g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GTI4 $484
line 730
;730:	{
line 731
;731:		if (i < g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GEI4 $486
line 732
;732:		{
line 734
;733:			// shift items up
;734:			memcpy( &g_favoriteserverlist[i], &g_favoriteserverlist[i+1], (g_numfavoriteservers - i - 1)*sizeof(servernode_t));
ADDRLP4 20
CNSTI4 220
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRGP4 g_favoriteserverlist+220
ADDP4
ARGP4
CNSTU4 220
ADDRGP4 g_numfavoriteservers
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 735
;735:		}
LABELV $486
line 736
;736:		g_numfavoriteservers--;
ADDRLP4 16
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 737
;737:	}	
LABELV $484
line 739
;738:
;739:	g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+17700
ADDRGP4 g_arenaservers+19780
INDIRI4
ASGNI4
line 740
;740:	g_arenaservers.currentping       = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+17712
ADDRGP4 g_arenaservers+19780
INDIRI4
ASGNI4
line 741
;741:}
LABELV $451
endproc ArenaServers_Remove 28 12
proc ArenaServers_Insert 84 12
line 750
;742:
;743:
;744:/*
;745:=================
;746:ArenaServers_Insert
;747:=================
;748:*/
;749:static void ArenaServers_Insert( char* adrstr, char* info, int pingtime )
;750:{
line 756
;751:	servernode_t*	servernodeptr;
;752:	char*			s;
;753:	int				i;
;754:
;755:
;756:	if ((pingtime >= ArenaServers_MaxPing()) && (g_servertype != AS_FAVORITES))
ADDRLP4 12
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $494
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $494
line 757
;757:	{
line 759
;758:		// slow global or local servers do not get entered
;759:		return;
ADDRGP4 $493
JUMPV
LABELV $494
line 762
;760:	}
;761:
;762:	if (*g_arenaservers.numservers >= g_arenaservers.maxservers) {
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
ADDRGP4 g_arenaservers+17724
INDIRI4
LTI4 $496
line 764
;763:		// list full;
;764:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers)-1;
ADDRLP4 0
CNSTI4 220
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+17708
INDIRP4
ADDP4
CNSTI4 -220
ADDP4
ASGNP4
line 765
;765:	} else {
ADDRGP4 $497
JUMPV
LABELV $496
line 767
;766:		// next slot
;767:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers);
ADDRLP4 0
CNSTI4 220
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+17708
INDIRP4
ADDP4
ASGNP4
line 768
;768:		(*g_arenaservers.numservers)++;
ADDRLP4 16
ADDRGP4 g_arenaservers+17704
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 769
;769:	}
LABELV $497
line 771
;770:
;771:	Q_strncpyz( servernodeptr->adrstr, adrstr, MAX_ADDRESSLENGTH );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 773
;772:
;773:	Q_strncpyz( servernodeptr->hostname, Info_ValueForKey( info, "hostname"), MAX_HOSTNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $505
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 774
;774:	Q_CleanStr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 775
;775:	Q_strupr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 777
;776:
;777:	Q_strncpyz( servernodeptr->mapname, Info_ValueForKey( info, "mapname"), MAX_MAPNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $506
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 121
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 778
;778:	Q_CleanStr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 121
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 779
;779:	Q_strupr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 121
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 781
;780:	
;781:	Q_strncpyz( servernodeptr->addonname, Info_ValueForKey( info, "addonname"), MAX_ADDONNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $507
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 782
;782:	Q_CleanStr( servernodeptr->addonname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 783
;783:	Q_strupr( servernodeptr->addonname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 785
;784:
;785:	servernodeptr->numclients = atoi( Info_ValueForKey( info, "clients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $508
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 786
;786:	servernodeptr->maxclients = atoi( Info_ValueForKey( info, "sv_maxclients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $509
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 787
;787:	servernodeptr->pingtime   = pingtime;
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 788
;788:	servernodeptr->minPing    = atoi( Info_ValueForKey( info, "minPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $510
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 789
;789:	servernodeptr->maxPing    = atoi( Info_ValueForKey( info, "maxPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $511
ARGP4
ADDRLP4 52
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 790
;790:	servernodeptr->bPB = atoi( Info_ValueForKey( info, "punkbuster") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $512
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 808
;791:
;792:	/*
;793:	s = Info_ValueForKey( info, "nettype" );
;794:	for (i=0; ;i++)
;795:	{
;796:		if (!netnames[i])
;797:		{
;798:			servernodeptr->nettype = 0;
;799:			break;
;800:		}
;801:		else if (!Q_stricmp( netnames[i], s ))
;802:		{
;803:			servernodeptr->nettype = i;
;804:			break;
;805:		}
;806:	}
;807:	*/
;808:	servernodeptr->nettype = atoi(Info_ValueForKey(info, "nettype"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $513
ARGP4
ADDRLP4 68
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 811
;809:
;810://	s = Info_ValueForKey( info, "game");
;811:	i = atoi( Info_ValueForKey( info, "gametype") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $514
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 80
INDIRI4
ASGNI4
line 812
;812:	servernodeptr->gametype = i;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 813
;813:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $515
line 814
;814:	Q_strncpyz( servernodeptr->gamename, gametype_items[i], sizeof(servernodeptr->gamename) );
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_items
ADDP4
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 815
;815:	}
LABELV $515
line 816
;816:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $518
line 817
;817:	Q_strncpyz( servernodeptr->gamename, gametype_itemsru[i], sizeof(servernodeptr->gamename) );
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_itemsru
ADDP4
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 818
;818:	}
LABELV $518
line 819
;819:}
LABELV $493
endproc ArenaServers_Insert 84 12
export ArenaServers_InsertFavorites
proc ArenaServers_InsertFavorites 1040 12
line 830
;820:
;821:
;822:/*
;823:=================
;824:ArenaServers_InsertFavorites
;825:
;826:Insert nonresponsive address book entries into display lists.
;827:=================
;828:*/
;829:void ArenaServers_InsertFavorites( void )
;830:{
line 836
;831:	int		i;
;832:	int		j;
;833:	char	info[MAX_INFO_STRING];
;834:
;835:	// resync existing results with new or deleted cvars
;836:	info[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 837
;837:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $522
line 838
;838:	Info_SetValueForKey( info, "hostname", "No connection" );
ADDRLP4 8
ARGP4
ADDRGP4 $505
ARGP4
ADDRGP4 $525
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 839
;839:	}
LABELV $522
line 840
;840:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $526
line 841
;841:	Info_SetValueForKey( info, "hostname", "Нет соединения" );
ADDRLP4 8
ARGP4
ADDRGP4 $505
ARGP4
ADDRGP4 $529
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 842
;842:	}
LABELV $526
line 843
;843:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $533
JUMPV
LABELV $530
line 844
;844:	{
line 846
;845:		// find favorite address in refresh list
;846:		for (j=0; j<g_numfavoriteservers; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $538
JUMPV
LABELV $535
line 847
;847:			if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],g_favoriteserverlist[j].adrstr))
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+17732
ADDP4
ARGP4
CNSTI4 220
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $539
line 848
;848:				break;
ADDRGP4 $537
JUMPV
LABELV $539
LABELV $536
line 846
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $538
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $535
LABELV $537
line 850
;849:
;850:		if ( j >= g_numfavoriteservers)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $542
line 851
;851:		{
line 853
;852:			// not in list, add it
;853:			ArenaServers_Insert( g_arenaservers.favoriteaddresses[i], info, ArenaServers_MaxPing() );
ADDRLP4 1036
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+17732
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Insert
CALLV
pop
line 854
;854:		}
LABELV $542
line 855
;855:	}
LABELV $531
line 843
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $533
ADDRLP4 4
INDIRI4
ADDRGP4 g_arenaservers+19780
INDIRI4
LTI4 $530
line 856
;856:}
LABELV $521
endproc ArenaServers_InsertFavorites 1040 12
export ArenaServers_LoadFavorites
proc ArenaServers_LoadFavorites 8160 12
line 867
;857:
;858:
;859:/*
;860:=================
;861:ArenaServers_LoadFavorites
;862:
;863:Load cvar address book entries into local lists.
;864:=================
;865:*/
;866:void ArenaServers_LoadFavorites( void )
;867:{
line 876
;868:	int				i;
;869:	int				j;
;870:	int				numtempitems;
;871:	char			emptyinfo[MAX_INFO_STRING];
;872:	char			adrstr[MAX_ADDRESSLENGTH];
;873:	servernode_t	templist[MAX_FAVORITESERVERS];
;874:	qboolean		found;
;875:
;876:	found        = qfalse;
ADDRLP4 7116
CNSTI4 0
ASGNI4
line 877
;877:	emptyinfo[0] = '\0';
ADDRLP4 7120
CNSTI1 0
ASGNI1
line 880
;878:
;879:	// copy the old
;880:	memcpy( templist, g_favoriteserverlist, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRLP4 72
ARGP4
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 7040
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 881
;881:	numtempitems = g_numfavoriteservers;
ADDRLP4 68
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 884
;882:
;883:	// clear the current for sync
;884:	memset( g_favoriteserverlist, 0, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 885
;885:	g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 888
;886:
;887:	// resync existing results with new or deleted cvars
;888:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 7112
CNSTI4 0
ASGNI4
LABELV $546
line 889
;889:	{
line 890
;890:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 $550
ARGP4
ADDRLP4 7112
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8144
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8144
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 891
;891:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $551
line 892
;892:			continue;
ADDRGP4 $547
JUMPV
LABELV $551
line 896
;893:
;894:		// quick sanity check to avoid slow domain name resolving
;895:		// first character must be numeric
;896:		if (adrstr[0] < '0' || adrstr[0] > '9')
ADDRLP4 8148
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8148
INDIRI4
CNSTI4 48
LTI4 $555
ADDRLP4 8148
INDIRI4
CNSTI4 57
LEI4 $553
LABELV $555
line 897
;897:			continue;
ADDRGP4 $547
JUMPV
LABELV $553
line 902
;898:
;899:		// favorite server addresses must be maintained outside refresh list
;900:		// this mimics local and global netadr's stored in client
;901:		// these can be fetched to fill ping list
;902:		strcpy( g_arenaservers.favoriteaddresses[g_numfavoriteservers], adrstr );
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+17732
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 905
;903:
;904:		// find this server in the old list
;905:		for (j=0; j<numtempitems; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $560
JUMPV
LABELV $557
line 906
;906:			if (!Q_stricmp( templist[j].adrstr, adrstr ))
CNSTI4 220
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8152
INDIRI4
CNSTI4 0
NEI4 $561
line 907
;907:				break;
ADDRGP4 $559
JUMPV
LABELV $561
LABELV $558
line 905
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $560
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $557
LABELV $559
line 909
;908:
;909:		if (j < numtempitems)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
GEI4 $563
line 910
;910:		{
line 912
;911:			// found server - add exisiting results
;912:			memcpy( &g_favoriteserverlist[g_numfavoriteservers], &templist[j], sizeof(servernode_t) );
ADDRLP4 8156
CNSTI4 220
ASGNI4
ADDRLP4 8156
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 8156
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 8156
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 913
;913:			found = qtrue;
ADDRLP4 7116
CNSTI4 1
ASGNI4
line 914
;914:		}
ADDRGP4 $564
JUMPV
LABELV $563
line 916
;915:		else
;916:		{
line 918
;917:			// add new server
;918:			Q_strncpyz( g_favoriteserverlist[g_numfavoriteservers].adrstr, adrstr, MAX_ADDRESSLENGTH );
CNSTI4 220
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 919
;919:			g_favoriteserverlist[g_numfavoriteservers].pingtime = ArenaServers_MaxPing();
ADDRLP4 8156
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
CNSTI4 220
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist+164
ADDP4
ADDRLP4 8156
INDIRI4
ASGNI4
line 920
;920:		}
LABELV $564
line 922
;921:
;922:		g_numfavoriteservers++;
ADDRLP4 8156
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 8156
INDIRP4
ADDRLP4 8156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 923
;923:	}
LABELV $547
line 888
ADDRLP4 7112
ADDRLP4 7112
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 7112
INDIRI4
CNSTI4 32
LTI4 $546
line 925
;924:
;925:	g_arenaservers.numfavoriteaddresses = g_numfavoriteservers;
ADDRGP4 g_arenaservers+19780
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 927
;926:
;927:	if (!found)
ADDRLP4 7116
INDIRI4
CNSTI4 0
NEI4 $567
line 928
;928:	{
line 931
;929:		// no results were found, reset server list
;930:		// list will be automatically refreshed when selected
;931:		g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 932
;932:	}
LABELV $567
line 933
;933:}
LABELV $545
endproc ArenaServers_LoadFavorites 8160 12
proc ArenaServers_StopRefresh 0 16
line 942
;934:
;935:
;936:/*
;937:=================
;938:ArenaServers_StopRefresh
;939:=================
;940:*/
;941:static void ArenaServers_StopRefresh( void )
;942:{
line 943
;943:	if (!g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+17716
INDIRI4
CNSTI4 0
NEI4 $570
line 945
;944:		// not currently refreshing
;945:		return;
ADDRGP4 $569
JUMPV
LABELV $570
line 947
;946:
;947:	g_arenaservers.refreshservers = qfalse;
ADDRGP4 g_arenaservers+17716
CNSTI4 0
ASGNI4
line 949
;948:
;949:	if (g_servertype == AS_FAVORITES)
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $574
line 950
;950:	{
line 952
;951:		// nonresponsive favorites must be shown
;952:		ArenaServers_InsertFavorites();
ADDRGP4 ArenaServers_InsertFavorites
CALLV
pop
line 953
;953:	}
LABELV $574
line 956
;954:
;955:	// final tally
;956:	if (g_arenaservers.numqueriedservers >= 0)
ADDRGP4 g_arenaservers+17700
INDIRI4
CNSTI4 0
LTI4 $576
line 957
;957:	{
line 958
;958:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+17712
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
ASGNI4
line 959
;959:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+17700
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
ASGNI4
line 960
;960:	}
LABELV $576
line 963
;961:	
;962:	// sort
;963:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+17708
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
ARGI4
CNSTI4 220
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 965
;964:
;965:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 966
;966:}
LABELV $569
endproc ArenaServers_StopRefresh 0 16
proc ArenaServers_DoRefresh 1120 16
line 975
;967:
;968:
;969:/*
;970:=================
;971:ArenaServers_DoRefresh
;972:=================
;973:*/
;974:static void ArenaServers_DoRefresh( void )
;975:{
line 983
;976:	int		i;
;977:	int		j;
;978:	int		time;
;979:	int		maxPing;
;980:	char	adrstr[MAX_ADDRESSLENGTH];
;981:	char	info[MAX_INFO_STRING];
;982:
;983:	if (uis.realtime < g_arenaservers.refreshtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+17728
INDIRI4
GEI4 $586
line 984
;984:	{
line 985
;985:	  if (g_servertype != AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $590
line 986
;986:			if (g_servertype == AS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $592
line 987
;987:				if (!trap_LAN_GetServerCount(g_servertype)) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $594
line 988
;988:					return;
ADDRGP4 $585
JUMPV
LABELV $594
line 990
;989:				}
;990:			}
LABELV $592
line 991
;991:			if (trap_LAN_GetServerCount(g_servertype) < 0) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
GEI4 $596
line 993
;992:			  // still waiting for response
;993:			  return;
ADDRGP4 $585
JUMPV
LABELV $596
line 995
;994:			}
;995:	  }
LABELV $590
line 996
;996:	}
LABELV $586
line 998
;997:
;998:	if (uis.realtime < g_arenaservers.nextpingtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+17720
INDIRI4
GEI4 $598
line 999
;999:	{
line 1001
;1000:		// wait for time trigger
;1001:		return;
ADDRGP4 $585
JUMPV
LABELV $598
line 1005
;1002:	}
;1003:
;1004:	// trigger at 10Hz intervals
;1005:	g_arenaservers.nextpingtime = uis.realtime + 10;
ADDRGP4 g_arenaservers+17720
ADDRGP4 uis+4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1008
;1006:
;1007:	// process ping results
;1008:	maxPing = ArenaServers_MaxPing();
ADDRLP4 1104
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1104
INDIRI4
ASGNI4
line 1009
;1009:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
LABELV $604
line 1010
;1010:	{
line 1011
;1011:		trap_LAN_GetPing( i, adrstr, MAX_ADDRESSLENGTH, &time );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 72
ARGP4
ADDRGP4 trap_LAN_GetPing
CALLV
pop
line 1012
;1012:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $608
line 1013
;1013:		{
line 1015
;1014:			// ignore empty or pending pings
;1015:			continue;
ADDRGP4 $605
JUMPV
LABELV $608
line 1019
;1016:		}
;1017:
;1018:		// find ping result in our local list
;1019:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $610
line 1020
;1020:			if (!Q_stricmp( adrstr, g_arenaservers.pinglist[j].adrstr ))
ADDRLP4 4
ARGP4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+3748
ADDP4
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $614
line 1021
;1021:				break;
ADDRGP4 $612
JUMPV
LABELV $614
LABELV $611
line 1019
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $610
LABELV $612
line 1023
;1022:
;1023:		if (j < MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $617
line 1024
;1024:		{
line 1026
;1025:			// found it
;1026:			if (!time)
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $619
line 1027
;1027:			{
line 1028
;1028:				time = uis.realtime - g_arenaservers.pinglist[j].start;
ADDRLP4 72
ADDRGP4 uis+4
INDIRI4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+3748+64
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1029
;1029:				if (time < maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $624
line 1030
;1030:				{
line 1032
;1031:					// still waiting
;1032:					continue;
ADDRGP4 $605
JUMPV
LABELV $624
line 1034
;1033:				}
;1034:			}
LABELV $619
line 1036
;1035:
;1036:			if (time > maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $626
line 1037
;1037:			{
line 1039
;1038:				// stale it out
;1039:				info[0] = '\0';
ADDRLP4 80
CNSTI1 0
ASGNI1
line 1040
;1040:				time    = maxPing;
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 1041
;1041:			}
ADDRGP4 $627
JUMPV
LABELV $626
line 1043
;1042:			else
;1043:			{
line 1044
;1044:				trap_LAN_GetPingInfo( i, info, MAX_INFO_STRING );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetPingInfo
CALLV
pop
line 1045
;1045:			}
LABELV $627
line 1048
;1046:
;1047:			// insert ping results
;1048:			ArenaServers_Insert( adrstr, info, time );
ADDRLP4 4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Insert
CALLV
pop
line 1051
;1049:
;1050:			// clear this query from internal list
;1051:			g_arenaservers.pinglist[j].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+3748
ADDP4
CNSTI1 0
ASGNI1
line 1052
;1052:   		}
LABELV $617
line 1055
;1053:
;1054:		// clear this query from external list
;1055:		trap_LAN_ClearPing( i );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 1056
;1056:	}
LABELV $605
line 1009
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32
LTI4 $604
line 1060
;1057:
;1058:	// get results of servers query
;1059:	// counts can increase as servers respond
;1060:	if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $629
line 1061
;1061:	  g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+17700
ADDRGP4 g_arenaservers+19780
INDIRI4
ASGNI4
line 1062
;1062:	} else {
ADDRGP4 $630
JUMPV
LABELV $629
line 1063
;1063:	  g_arenaservers.numqueriedservers = trap_LAN_GetServerCount(g_servertype);
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 g_arenaservers+17700
ADDRLP4 1108
INDIRI4
ASGNI4
line 1064
;1064:	}
LABELV $630
line 1071
;1065:
;1066://	if (g_arenaservers.numqueriedservers > g_arenaservers.maxservers)
;1067://		g_arenaservers.numqueriedservers = g_arenaservers.maxservers;
;1068:
;1069:	// send ping requests in reasonable bursts
;1070:	// iterate ping through all found servers
;1071:	for (i=0; i<MAX_PINGREQUESTS && g_arenaservers.currentping < g_arenaservers.numqueriedservers; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $637
JUMPV
LABELV $634
line 1072
;1072:	{
line 1073
;1073:		if (trap_LAN_GetPingQueueCount() >= MAX_PINGREQUESTS)
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 32
LTI4 $640
line 1074
;1074:		{
line 1076
;1075:			// ping queue is full
;1076:			break;
ADDRGP4 $636
JUMPV
LABELV $640
line 1080
;1077:		}
;1078:
;1079:		// find empty slot
;1080:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $642
line 1081
;1081:			if (!g_arenaservers.pinglist[j].adrstr[0])
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+3748
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $646
line 1082
;1082:				break;
ADDRGP4 $644
JUMPV
LABELV $646
LABELV $643
line 1080
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $642
LABELV $644
line 1084
;1083:
;1084:		if (j >= MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $649
line 1086
;1085:			// no empty slots available yet - wait for timeout
;1086:			break;
ADDRGP4 $636
JUMPV
LABELV $649
line 1090
;1087:
;1088:		// get an address to ping
;1089:
;1090:		if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $651
line 1091
;1091:		  strcpy( adrstr, g_arenaservers.favoriteaddresses[g_arenaservers.currentping] ); 		
ADDRLP4 4
ARGP4
ADDRGP4 g_arenaservers+17712
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+17732
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1092
;1092:		} else {
ADDRGP4 $652
JUMPV
LABELV $651
line 1093
;1093:		  trap_LAN_GetServerAddressString(g_servertype, g_arenaservers.currentping, adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+17712
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 1094
;1094:		}
LABELV $652
line 1096
;1095:
;1096:		strcpy( g_arenaservers.pinglist[j].adrstr, adrstr );
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+3748
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1097
;1097:		g_arenaservers.pinglist[j].start = uis.realtime;
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+3748+64
ADDP4
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 1099
;1098:
;1099:		trap_Cmd_ExecuteText( EXEC_NOW, va( "ping %s\n", adrstr )  );
ADDRGP4 $660
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1102
;1100:		
;1101:		// advance to next server
;1102:		g_arenaservers.currentping++;
ADDRLP4 1116
ADDRGP4 g_arenaservers+17712
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1103
;1103:	}
LABELV $635
line 1071
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $637
ADDRLP4 68
INDIRI4
CNSTI4 32
GEI4 $662
ADDRGP4 g_arenaservers+17712
INDIRI4
ADDRGP4 g_arenaservers+17700
INDIRI4
LTI4 $634
LABELV $662
LABELV $636
line 1105
;1104:
;1105:	if (!trap_LAN_GetPingQueueCount())
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $663
line 1106
;1106:	{
line 1108
;1107:		// all pings completed
;1108:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1109
;1109:		return;
ADDRGP4 $585
JUMPV
LABELV $663
line 1113
;1110:	}
;1111:
;1112:	// update the user interface with ping status
;1113:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1114
;1114:}
LABELV $585
endproc ArenaServers_DoRefresh 1120 16
proc ArenaServers_StartRefresh 88 16
line 1123
;1115:
;1116:
;1117:/*
;1118:=================
;1119:ArenaServers_StartRefresh
;1120:=================
;1121:*/
;1122:static void ArenaServers_StartRefresh( void )
;1123:{
line 1127
;1124:	int		i;
;1125:	char	myargs[32], protocol[32];
;1126:
;1127:	memset( g_arenaservers.serverlist, 0, g_arenaservers.maxservers*sizeof(table_t) );
ADDRGP4 g_arenaservers+17708
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 88
ADDRGP4 g_arenaservers+17724
INDIRI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1129
;1128:
;1129:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $668
line 1130
;1130:	{
line 1131
;1131:		g_arenaservers.pinglist[i].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+3748
ADDP4
CNSTI1 0
ASGNI1
line 1132
;1132:		trap_LAN_ClearPing( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 1133
;1133:	}
LABELV $669
line 1129
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $668
line 1135
;1134:
;1135:	g_arenaservers.refreshservers    = qtrue;
ADDRGP4 g_arenaservers+17716
CNSTI4 1
ASGNI4
line 1136
;1136:	g_arenaservers.currentping       = 0;
ADDRGP4 g_arenaservers+17712
CNSTI4 0
ASGNI4
line 1137
;1137:	g_arenaservers.nextpingtime      = 0;
ADDRGP4 g_arenaservers+17720
CNSTI4 0
ASGNI4
line 1138
;1138:	*g_arenaservers.numservers       = 0;
ADDRGP4 g_arenaservers+17704
INDIRP4
CNSTI4 0
ASGNI4
line 1139
;1139:	g_arenaservers.numqueriedservers = 0;
ADDRGP4 g_arenaservers+17700
CNSTI4 0
ASGNI4
line 1142
;1140:
;1141:	// allow max 5 seconds for responses
;1142:	g_arenaservers.refreshtime = uis.realtime + 5000;
ADDRGP4 g_arenaservers+17728
ADDRGP4 uis+4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1145
;1143:
;1144:	// place menu in zeroed state
;1145:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1147
;1146:
;1147:	if( g_servertype == AS_LOCAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $680
line 1148
;1148:		trap_Cmd_ExecuteText( EXEC_APPEND, "localservers\n" );
CNSTI4 2
ARGI4
ADDRGP4 $682
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1149
;1149:		return;
ADDRGP4 $665
JUMPV
LABELV $680
line 1152
;1150:	}
;1151:
;1152:	if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $685
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $683
LABELV $685
line 1153
;1153:		if( g_servertype == AS_GLOBAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 2
NEI4 $686
line 1154
;1154:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1155
;1155:		}
ADDRGP4 $687
JUMPV
LABELV $686
line 1156
;1156:		else {
line 1157
;1157:			i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1158
;1158:		}
LABELV $687
line 1160
;1159:
;1160:		switch( g_arenaservers.gametype.curvalue ) {
ADDRLP4 72
ADDRGP4 g_arenaservers+1312+92
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $688
ADDRLP4 72
INDIRI4
CNSTI4 14
GTI4 $688
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $721
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $721
address $692
address $693
address $697
address $695
address $699
address $701
address $703
address $705
address $707
address $709
address $711
address $713
address $715
address $717
address $719
code
LABELV $688
LABELV $692
line 1163
;1161:		default:
;1162:		case GAMES_ALL:
;1163:			myargs[0] = 0;
ADDRLP4 36
CNSTI1 0
ASGNI1
line 1164
;1164:			break;
ADDRGP4 $689
JUMPV
LABELV $693
line 1167
;1165:
;1166:		case GAMES_SANDBOX:
;1167:			strcpy( myargs, " sandbox" );
ADDRLP4 36
ARGP4
ADDRGP4 $694
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1168
;1168:			break;
ADDRGP4 $689
JUMPV
LABELV $695
line 1171
;1169:
;1170:		case GAMES_SINGLE:
;1171:			strcpy( myargs, " single" );
ADDRLP4 36
ARGP4
ADDRGP4 $696
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1172
;1172:			break;
ADDRGP4 $689
JUMPV
LABELV $697
line 1175
;1173:
;1174:		case GAMES_FFA:
;1175:			strcpy( myargs, " ffa" );
ADDRLP4 36
ARGP4
ADDRGP4 $698
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1176
;1176:			break;
ADDRGP4 $689
JUMPV
LABELV $699
line 1179
;1177:
;1178:		case GAMES_TEAMPLAY:
;1179:			strcpy( myargs, " team" );
ADDRLP4 36
ARGP4
ADDRGP4 $700
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1180
;1180:			break;
ADDRGP4 $689
JUMPV
LABELV $701
line 1183
;1181:
;1182:		case GAMES_TOURNEY:
;1183:			strcpy( myargs, " tourney" );
ADDRLP4 36
ARGP4
ADDRGP4 $702
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1184
;1184:			break;
ADDRGP4 $689
JUMPV
LABELV $703
line 1187
;1185:
;1186:		case GAMES_CTF:
;1187:			strcpy( myargs, " ctf" );
ADDRLP4 36
ARGP4
ADDRGP4 $704
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1188
;1188:			break;
ADDRGP4 $689
JUMPV
LABELV $705
line 1191
;1189:			
;1190:		case GAMES_ONEFLAG:
;1191:			strcpy( myargs, " oneflag" );
ADDRLP4 36
ARGP4
ADDRGP4 $706
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1192
;1192:			break;
ADDRGP4 $689
JUMPV
LABELV $707
line 1195
;1193:			
;1194:		case GAMES_OBELISK:
;1195:			strcpy( myargs, " overload" );
ADDRLP4 36
ARGP4
ADDRGP4 $708
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1196
;1196:			break;
ADDRGP4 $689
JUMPV
LABELV $709
line 1199
;1197:			
;1198:		case GAMES_HARVESTER:
;1199:			strcpy( myargs, " harvester" );
ADDRLP4 36
ARGP4
ADDRGP4 $710
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1200
;1200:			break;
ADDRGP4 $689
JUMPV
LABELV $711
line 1203
;1201:			
;1202:		case GAMES_ELIMINATION:
;1203:			strcpy( myargs, " elimination" );
ADDRLP4 36
ARGP4
ADDRGP4 $712
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1204
;1204:			break;
ADDRGP4 $689
JUMPV
LABELV $713
line 1207
;1205:			
;1206:		case GAMES_ELIM_CTF:
;1207:			strcpy( myargs, " ctfelimination" );
ADDRLP4 36
ARGP4
ADDRGP4 $714
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1208
;1208:			break;
ADDRGP4 $689
JUMPV
LABELV $715
line 1211
;1209:			
;1210:		case GAMES_LMS:
;1211:			strcpy( myargs, " lms" );
ADDRLP4 36
ARGP4
ADDRGP4 $716
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1212
;1212:			break;
ADDRGP4 $689
JUMPV
LABELV $717
line 1215
;1213:			
;1214:		case GAMES_DD:
;1215:			strcpy( myargs, " dd" );
ADDRLP4 36
ARGP4
ADDRGP4 $718
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1216
;1216:			break;
ADDRGP4 $689
JUMPV
LABELV $719
line 1219
;1217:		
;1218:		case GAMES_DOM:
;1219:			strcpy( myargs, " dom" );
ADDRLP4 36
ARGP4
ADDRGP4 $720
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1220
;1220:			break;
LABELV $689
line 1224
;1221:		}
;1222:
;1223:
;1224:		if (g_emptyservers) {
ADDRGP4 g_emptyservers
INDIRI4
CNSTI4 0
EQI4 $722
line 1225
;1225:			strcat(myargs, " empty");
ADDRLP4 36
ARGP4
ADDRGP4 $724
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1226
;1226:		}
LABELV $722
line 1228
;1227:
;1228:		if (g_fullservers) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
EQI4 $725
line 1229
;1229:			strcat(myargs, " full");
ADDRLP4 36
ARGP4
ADDRGP4 $727
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1230
;1230:		}
LABELV $725
line 1232
;1231:
;1232:		protocol[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1233
;1233:		trap_Cvar_VariableStringBuffer( "debug_protocol", protocol, sizeof(protocol) );
ADDRGP4 $728
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1234
;1234:		if (strlen(protocol)) {
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $729
line 1235
;1235:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %s%s\n", i, protocol, myargs ));
ADDRGP4 $731
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1236
;1236:		}
ADDRGP4 $730
JUMPV
LABELV $729
line 1237
;1237:		else {
line 1238
;1238:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %d%s\n", i, (int)trap_Cvar_VariableValue( "protocol" ), myargs ) );
ADDRGP4 $733
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $732
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 80
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1239
;1239:		}
LABELV $730
line 1240
;1240:	}
LABELV $683
line 1241
;1241:}
LABELV $665
endproc ArenaServers_StartRefresh 88 16
export ArenaServers_SaveChanges
proc ArenaServers_SaveChanges 12 8
line 1250
;1242:
;1243:
;1244:/*
;1245:=================
;1246:ArenaServers_SaveChanges
;1247:=================
;1248:*/
;1249:void ArenaServers_SaveChanges( void )
;1250:{
line 1253
;1251:	int	i;
;1252:
;1253:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $738
JUMPV
LABELV $735
line 1254
;1254:		trap_Cvar_Set( va("server%d",i+1), g_arenaservers.favoriteaddresses[i] );
ADDRGP4 $550
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+17732
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $736
line 1253
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $738
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+19780
INDIRI4
LTI4 $735
line 1256
;1255:
;1256:	for (; i<MAX_FAVORITESERVERS; i++)
ADDRGP4 $744
JUMPV
LABELV $741
line 1257
;1257:		trap_Cvar_Set( va("server%d",i+1), "" );
ADDRGP4 $550
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $278
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $742
line 1256
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $744
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $741
line 1258
;1258:}
LABELV $734
endproc ArenaServers_SaveChanges 12 8
export ArenaServers_Sort
proc ArenaServers_Sort 0 16
line 1266
;1259:
;1260:
;1261:/*
;1262:=================
;1263:ArenaServers_Sort
;1264:=================
;1265:*/
;1266:void ArenaServers_Sort( int type ) {
line 1267
;1267:	if( g_sortkey == type ) {
ADDRGP4 g_sortkey
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $746
line 1268
;1268:		return;
ADDRGP4 $745
JUMPV
LABELV $746
line 1271
;1269:	}
;1270:
;1271:	g_sortkey = type;
ADDRGP4 g_sortkey
ADDRFP4 0
INDIRI4
ASGNI4
line 1272
;1272:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+17708
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
ARGI4
CNSTI4 220
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1273
;1273:}
LABELV $745
endproc ArenaServers_Sort 0 16
export ArenaServers_SetType
proc ArenaServers_SetType 36 8
line 1282
;1274:
;1275:
;1276:/*
;1277:=================
;1278:ArenaServers_SetType
;1279:=================
;1280:*/
;1281:void ArenaServers_SetType( int type )
;1282:{
line 1283
;1283:	if (g_servertype == type)
ADDRGP4 g_servertype
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $751
line 1284
;1284:		return;
ADDRGP4 $750
JUMPV
LABELV $751
line 1286
;1285:
;1286:	g_servertype = type;
ADDRGP4 g_servertype
ADDRFP4 0
INDIRI4
ASGNI4
line 1288
;1287:
;1288:	switch( type ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $753
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $753
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $787
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $787
address $755
address $779
address $763
address $771
code
LABELV $753
LABELV $755
line 1291
;1289:	default:
;1290:	case AS_LOCAL:
;1291:		g_arenaservers.save.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 4
ADDRGP4 g_arenaservers+2572+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 1292
;1292:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 g_arenaservers+2688+72
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1293
;1293:		g_arenaservers.serverlist = g_localserverlist;
ADDRGP4 g_arenaservers+17708
ADDRGP4 g_localserverlist
ASGNP4
line 1294
;1294:		g_arenaservers.numservers = &g_numlocalservers;
ADDRGP4 g_arenaservers+17704
ADDRGP4 g_numlocalservers
ASGNP4
line 1295
;1295:		g_arenaservers.maxservers = MAX_LOCALSERVERS;
ADDRGP4 g_arenaservers+17724
CNSTI4 128
ASGNI4
line 1296
;1296:		break;
ADDRGP4 $754
JUMPV
LABELV $763
line 1299
;1297:
;1298:	case AS_GLOBAL:
;1299:		g_arenaservers.save.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 12
ADDRGP4 g_arenaservers+2572+72
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 1300
;1300:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 g_arenaservers+2688+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1301
;1301:		g_arenaservers.serverlist = g_globalserverlist;
ADDRGP4 g_arenaservers+17708
ADDRGP4 g_globalserverlist
ASGNP4
line 1302
;1302:		g_arenaservers.numservers = &g_numglobalservers;
ADDRGP4 g_arenaservers+17704
ADDRGP4 g_numglobalservers
ASGNP4
line 1303
;1303:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+17724
CNSTI4 128
ASGNI4
line 1304
;1304:		break;
ADDRGP4 $754
JUMPV
LABELV $771
line 1307
;1305:
;1306:	case AS_FAVORITES:
;1307:		g_arenaservers.save.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 20
ADDRGP4 g_arenaservers+2572+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1308
;1308:		g_arenaservers.remove.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 24
ADDRGP4 g_arenaservers+2688+72
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 1309
;1309:		g_arenaservers.serverlist = g_favoriteserverlist;
ADDRGP4 g_arenaservers+17708
ADDRGP4 g_favoriteserverlist
ASGNP4
line 1310
;1310:		g_arenaservers.numservers = &g_numfavoriteservers;
ADDRGP4 g_arenaservers+17704
ADDRGP4 g_numfavoriteservers
ASGNP4
line 1311
;1311:		g_arenaservers.maxservers = MAX_FAVORITESERVERS;
ADDRGP4 g_arenaservers+17724
CNSTI4 32
ASGNI4
line 1312
;1312:		break;
ADDRGP4 $754
JUMPV
LABELV $779
line 1315
;1313:
;1314:	case AS_MPLAYER:
;1315:		g_arenaservers.save.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 28
ADDRGP4 g_arenaservers+2572+72
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 1316
;1316:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 32
ADDRGP4 g_arenaservers+2688+72
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1317
;1317:		g_arenaservers.serverlist = g_mplayerserverlist;
ADDRGP4 g_arenaservers+17708
ADDRGP4 g_mplayerserverlist
ASGNP4
line 1318
;1318:		g_arenaservers.numservers = &g_nummplayerservers;
ADDRGP4 g_arenaservers+17704
ADDRGP4 g_nummplayerservers
ASGNP4
line 1319
;1319:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+17724
CNSTI4 128
ASGNI4
line 1320
;1320:		break;
LABELV $754
line 1324
;1321:		
;1322:	}
;1323:
;1324:	if( !*g_arenaservers.numservers ) {
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $788
line 1325
;1325:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1326
;1326:	}
ADDRGP4 $789
JUMPV
LABELV $788
line 1327
;1327:	else {
line 1329
;1328:		// avoid slow operation, use existing results
;1329:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+17712
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
ASGNI4
line 1330
;1330:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+17700
ADDRGP4 g_arenaservers+17704
INDIRP4
INDIRI4
ASGNI4
line 1331
;1331:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1332
;1332:	}
LABELV $789
line 1333
;1333:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $795
line 1334
;1334:	strcpy(g_arenaservers.status.string,"hit Refresh to update");
ADDRGP4 g_arenaservers+2364+88
INDIRP4
ARGP4
ADDRGP4 $800
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1335
;1335:	}
LABELV $795
line 1336
;1336:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $801
line 1337
;1337:	strcpy(g_arenaservers.status.string,"нажмите Обновить для обновления списка");
ADDRGP4 g_arenaservers+2364+88
INDIRP4
ARGP4
ADDRGP4 $806
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1338
;1338:	}
LABELV $801
line 1339
;1339:}
LABELV $750
endproc ArenaServers_SetType 36 8
proc Punkbuster_ConfirmEnable 8 12
line 1348
;1340:
;1341:
;1342:
;1343:/*
;1344:=================
;1345:PunkBuster_Confirm
;1346:=================
;1347:*/
;1348:static void Punkbuster_ConfirmEnable( qboolean result ) {
line 1349
;1349:   if (!uis.punkbuster) {
ADDRGP4 uis+11504
INDIRI4
CNSTI4 0
NEI4 $808
line 1350
;1350:      return;
ADDRGP4 $807
JUMPV
LABELV $808
line 1353
;1351:   }
;1352:
;1353:	if (result)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $811
line 1354
;1354:	{
line 1355
;1355:		trap_SetPbClStatus(1);
CNSTI4 1
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 1356
;1356:	}
LABELV $811
line 1357
;1357:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $815
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_arenaservers+19784+92
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1358
;1358:}
LABELV $807
endproc Punkbuster_ConfirmEnable 8 12
proc Punkbuster_ConfirmDisable 8 12
line 1360
;1359:
;1360:static void Punkbuster_ConfirmDisable( qboolean result ) {
line 1361
;1361:   if (!uis.punkbuster) {
ADDRGP4 uis+11504
INDIRI4
CNSTI4 0
NEI4 $817
line 1362
;1362:      return;
ADDRGP4 $816
JUMPV
LABELV $817
line 1365
;1363:   }
;1364:
;1365:	if (result)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $820
line 1366
;1366:	{
line 1367
;1367:		trap_SetPbClStatus(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 1368
;1368:		UI_Message( punkbuster_msg );
ADDRGP4 punkbuster_msg
ARGP4
ADDRGP4 UI_Message
CALLV
pop
line 1369
;1369:	}
LABELV $820
line 1370
;1370:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $815
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_arenaservers+19784+92
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1371
;1371:}
LABELV $816
endproc Punkbuster_ConfirmDisable 8 12
proc ArenaServers_AddToFavorites 20 12
line 1380
;1372:
;1373:
;1374:/*
;1375:=================
;1376:ArenaServers_AddToFavorites
;1377:=================
;1378:*/
;1379:static void ArenaServers_AddToFavorites(void)
;1380:{
line 1385
;1381:	servernode_t* servernodeptr;
;1382:	int i;
;1383:
;1384:	// check favourite server list isn't full
;1385:	if (g_numfavoriteservers == MAX_FAVORITESERVERS)
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 32
NEI4 $825
line 1386
;1386:		return;
ADDRGP4 $824
JUMPV
LABELV $825
line 1389
;1387:
;1388:	// check we have a server list available
;1389:	if (!g_arenaservers.list.numitems)
ADDRGP4 g_arenaservers+1768+96
INDIRI4
CNSTI4 0
NEI4 $827
line 1390
;1390:		return;
ADDRGP4 $824
JUMPV
LABELV $827
line 1393
;1391:
;1392:	// check the server isn't on the favourites list already
;1393:	servernodeptr=g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 4
CNSTI4 88
ADDRGP4 g_arenaservers+1768+92
INDIRI4
MULI4
ADDRGP4 g_arenaservers+5924+84
ADDP4
INDIRP4
ASGNP4
line 1394
;1394:	for (i=0; i < g_numfavoriteservers; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $838
JUMPV
LABELV $835
line 1395
;1395:	if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],servernodeptr->adrstr))
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+17732
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $839
line 1396
;1396:		return;
ADDRGP4 $824
JUMPV
LABELV $839
LABELV $836
line 1394
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $838
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $835
line 1399
;1397:
;1398:	// we already have a responsive server, no further sanity checks required
;1399:	strcpy(g_arenaservers.favoriteaddresses[g_numfavoriteservers],
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+17732
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1403
;1400:	servernodeptr->adrstr);
;1401:
;1402:	// copy over server details
;1403:	memcpy( &g_favoriteserverlist[g_numfavoriteservers],
ADDRLP4 12
CNSTI4 220
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1406
;1404:	servernodeptr,sizeof(servernode_t));
;1405:
;1406:	g_numfavoriteservers++;
ADDRLP4 16
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1407
;1407:	g_arenaservers.numfavoriteaddresses = g_numfavoriteservers;
ADDRGP4 g_arenaservers+19780
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 1408
;1408:}
LABELV $824
endproc ArenaServers_AddToFavorites 20 12
proc ArenaServers_Event 12 16
line 1417
;1409:
;1410:
;1411:
;1412:/*
;1413:=================
;1414:ArenaServers_Event
;1415:=================
;1416:*/
;1417:static void ArenaServers_Event( void* ptr, int event ) {
line 1421
;1418:	int		id;
;1419:	int value;
;1420:
;1421:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 1423
;1422:
;1423:	if( event != QM_ACTIVATED && id != ID_LIST ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $845
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $845
line 1424
;1424:		return;
ADDRGP4 $844
JUMPV
LABELV $845
line 1427
;1425:	}
;1426:
;1427:	switch( id ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $847
ADDRLP4 0
INDIRI4
CNSTI4 25
GTI4 $847
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $909-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $909
address $849
address $861
address $867
address $873
address $879
address $885
address $889
address $891
address $893
address $894
address $895
address $896
address $897
address $898
address $899
address $888
code
LABELV $849
line 1429
;1428:	case ID_MASTER:
;1429:	if(g_arenaservers.master.curvalue == 0){
ADDRGP4 g_arenaservers+1180+92
INDIRI4
CNSTI4 0
NEI4 $850
line 1430
;1430:	value = 0;	
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1431
;1431:	}
LABELV $850
line 1432
;1432:	if(g_arenaservers.master.curvalue == 1){
ADDRGP4 g_arenaservers+1180+92
INDIRI4
CNSTI4 1
NEI4 $854
line 1433
;1433:	value = 2;	
ADDRLP4 4
CNSTI4 2
ASGNI4
line 1434
;1434:	}
LABELV $854
line 1436
;1435:		
;1436:		if (value >= 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $858
line 1437
;1437:		{
line 1438
;1438:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1439
;1439:		}
LABELV $858
line 1440
;1440:		trap_Cvar_SetValue( "ui_browserMaster", value );
ADDRGP4 $860
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1441
;1441:		ArenaServers_SetType( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1442
;1442:		break;
ADDRGP4 $848
JUMPV
LABELV $861
line 1445
;1443:
;1444:	case ID_GAMETYPE:
;1445:		trap_Cvar_SetValue( "ui_browserGameType", g_arenaservers.gametype.curvalue );
ADDRGP4 $862
ARGP4
ADDRGP4 g_arenaservers+1312+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1446
;1446:		g_gametype = g_arenaservers.gametype.curvalue;
ADDRGP4 g_gametype
ADDRGP4 g_arenaservers+1312+92
INDIRI4
ASGNI4
line 1447
;1447:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1448
;1448:		break;
ADDRGP4 $848
JUMPV
LABELV $867
line 1451
;1449:
;1450:	case ID_SORTKEY:
;1451:		trap_Cvar_SetValue( "ui_browserSortKey", g_arenaservers.sortkey.curvalue );
ADDRGP4 $868
ARGP4
ADDRGP4 g_arenaservers+1444+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1452
;1452:		ArenaServers_Sort( g_arenaservers.sortkey.curvalue );
ADDRGP4 g_arenaservers+1444+92
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Sort
CALLV
pop
line 1453
;1453:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1454
;1454:		break;
ADDRGP4 $848
JUMPV
LABELV $873
line 1457
;1455:
;1456:	case ID_SHOW_FULL:
;1457:		trap_Cvar_SetValue( "ui_browserShowFull", g_arenaservers.showfull.curvalue );
ADDRGP4 $874
ARGP4
ADDRGP4 g_arenaservers+1576+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1458
;1458:		g_fullservers = g_arenaservers.showfull.curvalue;
ADDRGP4 g_fullservers
ADDRGP4 g_arenaservers+1576+88
INDIRI4
ASGNI4
line 1459
;1459:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1460
;1460:		break;
ADDRGP4 $848
JUMPV
LABELV $879
line 1463
;1461:
;1462:	case ID_SHOW_EMPTY:
;1463:		trap_Cvar_SetValue( "ui_browserShowEmpty", g_arenaservers.showempty.curvalue );
ADDRGP4 $880
ARGP4
ADDRGP4 g_arenaservers+1672+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1464
;1464:		g_emptyservers = g_arenaservers.showempty.curvalue;
ADDRGP4 g_emptyservers
ADDRGP4 g_arenaservers+1672+88
INDIRI4
ASGNI4
line 1465
;1465:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1466
;1466:		break;
ADDRGP4 $848
JUMPV
LABELV $885
line 1469
;1467:
;1468:	case ID_LIST:
;1469:		if( event == QM_GOTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $848
line 1470
;1470:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1471
;1471:		}
line 1472
;1472:		break;
ADDRGP4 $848
JUMPV
LABELV $888
line 1475
;1473:
;1474:	case ID_SAVE:
;1475:		ArenaServers_AddToFavorites();
ADDRGP4 ArenaServers_AddToFavorites
CALLV
pop
line 1476
;1476:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1477
;1477:		break;
ADDRGP4 $848
JUMPV
LABELV $889
line 1480
;1478:
;1479:	case ID_SCROLL_UP:
;1480:		ScrollList_Key( &g_arenaservers.list, K_UPARROW );
ADDRGP4 g_arenaservers+1768
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1481
;1481:		break;
ADDRGP4 $848
JUMPV
LABELV $891
line 1484
;1482:
;1483:	case ID_SCROLL_DOWN:
;1484:		ScrollList_Key( &g_arenaservers.list, K_DOWNARROW );
ADDRGP4 g_arenaservers+1768
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1485
;1485:		break;
ADDRGP4 $848
JUMPV
LABELV $893
line 1488
;1486:
;1487:	case ID_BACK:
;1488:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1489
;1489:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1490
;1490:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1491
;1491:		break;
ADDRGP4 $848
JUMPV
LABELV $894
line 1494
;1492:
;1493:	case ID_REFRESH:
;1494:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1495
;1495:		break;
ADDRGP4 $848
JUMPV
LABELV $895
line 1498
;1496:
;1497:	case ID_SPECIFY:
;1498:		UI_SpecifyServerMenu();
ADDRGP4 UI_SpecifyServerMenu
CALLV
pop
line 1499
;1499:		break;
ADDRGP4 $848
JUMPV
LABELV $896
line 1502
;1500:
;1501:	case ID_CREATE:
;1502:		UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 1503
;1503:		break;
ADDRGP4 $848
JUMPV
LABELV $897
line 1506
;1504:
;1505:	case ID_CONNECT:
;1506:		ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 1507
;1507:		break;
ADDRGP4 $848
JUMPV
LABELV $898
line 1510
;1508:
;1509:	case ID_REMOVE:
;1510:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1511
;1511:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1512
;1512:		break;
ADDRGP4 $848
JUMPV
LABELV $899
line 1515
;1513:
;1514:	case ID_PUNKBUSTER:
;1515:      if (!uis.punkbuster)
ADDRGP4 uis+11504
INDIRI4
CNSTI4 0
NEI4 $900
line 1516
;1516:         break;
ADDRGP4 $848
JUMPV
LABELV $900
line 1518
;1517:
;1518:		if (g_arenaservers.punkbuster.curvalue)
ADDRGP4 g_arenaservers+19784+92
INDIRI4
CNSTI4 0
EQI4 $903
line 1519
;1519:		{
line 1520
;1520:			UI_ConfirmMenu_Style( "Enable Punkbuster?",  UI_CENTER|UI_INVERSE|UI_SMALLFONT, 0, Punkbuster_ConfirmEnable );
ADDRGP4 $907
ARGP4
CNSTI4 8209
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Punkbuster_ConfirmEnable
ARGP4
ADDRGP4 UI_ConfirmMenu_Style
CALLV
pop
line 1521
;1521:		}
ADDRGP4 $848
JUMPV
LABELV $903
line 1523
;1522:		else
;1523:		{
line 1524
;1524:			UI_ConfirmMenu_Style( "Disable Punkbuster?", UI_CENTER|UI_INVERSE|UI_SMALLFONT, 0, Punkbuster_ConfirmDisable );
ADDRGP4 $908
ARGP4
CNSTI4 8209
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Punkbuster_ConfirmDisable
ARGP4
ADDRGP4 UI_ConfirmMenu_Style
CALLV
pop
line 1525
;1525:		}
line 1526
;1526:		break;
LABELV $847
LABELV $848
line 1528
;1527:	}
;1528:}
LABELV $844
endproc ArenaServers_Event 12 16
proc ArenaServers_MenuDraw 0 4
line 1537
;1529:
;1530:
;1531:/*
;1532:=================
;1533:ArenaServers_MenuDraw
;1534:=================
;1535:*/
;1536:static void ArenaServers_MenuDraw( void )
;1537:{
line 1538
;1538:	if (g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+17716
INDIRI4
CNSTI4 0
EQI4 $912
line 1539
;1539:		ArenaServers_DoRefresh();
ADDRGP4 ArenaServers_DoRefresh
CALLV
pop
LABELV $912
line 1541
;1540:
;1541:	Menu_Draw( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1542
;1542:}
LABELV $911
endproc ArenaServers_MenuDraw 0 4
proc ArenaServers_MenuKey 16 8
line 1550
;1543:
;1544:
;1545:/*
;1546:=================
;1547:ArenaServers_MenuKey
;1548:=================
;1549:*/
;1550:static sfxHandle_t ArenaServers_MenuKey( int key ) {
line 1551
;1551:	if( key == K_SPACE  && g_arenaservers.refreshservers ) {
ADDRFP4 0
INDIRI4
CNSTI4 32
NEI4 $916
ADDRGP4 g_arenaservers+17716
INDIRI4
CNSTI4 0
EQI4 $916
line 1552
;1552:		ArenaServers_StopRefresh();	
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1553
;1553:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $915
JUMPV
LABELV $916
line 1556
;1554:	}
;1555:
;1556:	if( ( key == K_DEL || key == K_KP_DEL ) && ( g_servertype == AS_FAVORITES ) &&
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 140
EQI4 $922
ADDRLP4 0
INDIRI4
CNSTI4 171
NEI4 $919
LABELV $922
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $919
ADDRGP4 g_arenaservers
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRGP4 g_arenaservers+1768
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $919
line 1557
;1557:		( Menu_ItemAtCursor( &g_arenaservers.menu) == &g_arenaservers.list ) ) {
line 1558
;1558:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1559
;1559:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1560
;1560:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $915
JUMPV
LABELV $919
line 1563
;1561:	}
;1562:
;1563:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 179
EQI4 $925
ADDRLP4 8
INDIRI4
CNSTI4 27
NEI4 $923
LABELV $925
line 1564
;1564:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1565
;1565:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1566
;1566:	}
LABELV $923
line 1569
;1567:
;1568:
;1569:	return Menu_DefaultKey( &g_arenaservers.menu, key );
ADDRGP4 g_arenaservers
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
LABELV $915
endproc ArenaServers_MenuKey 16 8
bss
align 1
LABELV $927
skip 64
code
proc ArenaServers_MenuInit 40 16
line 1578
;1570:}
;1571:
;1572:
;1573:/*
;1574:=================
;1575:ArenaServers_MenuInit
;1576:=================
;1577:*/
;1578:static void ArenaServers_MenuInit( void ) {
line 1586
;1579:	int			i;
;1580:	int			type;
;1581:	int			y;
;1582:	int			value;
;1583:	static char	statusbuffer[MAX_STATUSLENGTH];
;1584:
;1585:	// zero set all our globals
;1586:	memset( &g_arenaservers, 0 ,sizeof(arenaservers_t) );
ADDRGP4 g_arenaservers
ARGP4
CNSTI4 0
ARGI4
CNSTI4 20032
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1588
;1587:
;1588:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1590
;1589:
;1590:	g_arenaservers.menu.fullscreen = qtrue;
ADDRGP4 g_arenaservers+1052
CNSTI4 1
ASGNI4
line 1591
;1591:	g_arenaservers.menu.wrapAround = qtrue;
ADDRGP4 g_arenaservers+1044
CNSTI4 1
ASGNI4
line 1592
;1592:	g_arenaservers.menu.native 	   = qfalse;
ADDRGP4 g_arenaservers+1056
CNSTI4 0
ASGNI4
line 1593
;1593:    g_arenaservers.menu.draw       = ArenaServers_MenuDraw;
ADDRGP4 g_arenaservers+1036
ADDRGP4 ArenaServers_MenuDraw
ASGNP4
line 1594
;1594:	g_arenaservers.menu.key        = ArenaServers_MenuKey;
ADDRGP4 g_arenaservers+1040
ADDRGP4 ArenaServers_MenuKey
ASGNP4
line 1596
;1595:
;1596:	g_arenaservers.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 g_arenaservers+1076
CNSTI4 10
ASGNI4
line 1597
;1597:	g_arenaservers.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 g_arenaservers+1076+72
CNSTU4 8
ASGNU4
line 1598
;1598:	g_arenaservers.banner.generic.x	    = 320;
ADDRGP4 g_arenaservers+1076+28
CNSTI4 320
ASGNI4
line 1599
;1599:	g_arenaservers.banner.generic.y	    = 16;
ADDRGP4 g_arenaservers+1076+32
CNSTI4 16
ASGNI4
line 1600
;1600:	g_arenaservers.banner.style  	    = UI_CENTER;
ADDRGP4 g_arenaservers+1076+92
CNSTI4 1
ASGNI4
line 1601
;1601:	g_arenaservers.banner.color  	    = color_white;
ADDRGP4 g_arenaservers+1076+100
ADDRGP4 color_white
ASGNP4
line 1603
;1602:
;1603:	y = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1604
;1604:	g_arenaservers.master.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+1180
CNSTI4 3
ASGNI4
line 1605
;1605:	g_arenaservers.master.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+1180+72
CNSTU4 258
ASGNU4
line 1606
;1606:	g_arenaservers.master.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1180+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1607
;1607:	g_arenaservers.master.generic.id			= ID_MASTER;
ADDRGP4 g_arenaservers+1180+24
CNSTI4 10
ASGNI4
line 1608
;1608:	g_arenaservers.master.generic.x				= 320;
ADDRGP4 g_arenaservers+1180+28
CNSTI4 320
ASGNI4
line 1609
;1609:	g_arenaservers.master.generic.y				= y;
ADDRGP4 g_arenaservers+1180+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1611
;1610:
;1611:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 1612
;1612:	g_arenaservers.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+1312
CNSTI4 3
ASGNI4
line 1613
;1613:	g_arenaservers.gametype.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+1312+72
CNSTU4 258
ASGNU4
line 1614
;1614:	g_arenaservers.gametype.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1312+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1615
;1615:	g_arenaservers.gametype.generic.id			= ID_GAMETYPE;
ADDRGP4 g_arenaservers+1312+24
CNSTI4 11
ASGNI4
line 1616
;1616:	g_arenaservers.gametype.generic.x			= 320;
ADDRGP4 g_arenaservers+1312+28
CNSTI4 320
ASGNI4
line 1617
;1617:	g_arenaservers.gametype.generic.y			= y;
ADDRGP4 g_arenaservers+1312+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1619
;1618:
;1619:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 1620
;1620:	g_arenaservers.sortkey.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+1444
CNSTI4 3
ASGNI4
line 1621
;1621:	g_arenaservers.sortkey.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+1444+72
CNSTU4 258
ASGNU4
line 1622
;1622:	g_arenaservers.sortkey.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1444+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1623
;1623:	g_arenaservers.sortkey.generic.id			= ID_SORTKEY;
ADDRGP4 g_arenaservers+1444+24
CNSTI4 12
ASGNI4
line 1624
;1624:	g_arenaservers.sortkey.generic.x			= 320;
ADDRGP4 g_arenaservers+1444+28
CNSTI4 320
ASGNI4
line 1625
;1625:	g_arenaservers.sortkey.generic.y			= y;
ADDRGP4 g_arenaservers+1444+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1627
;1626:
;1627:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 1628
;1628:	g_arenaservers.showfull.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+1576
CNSTI4 5
ASGNI4
line 1629
;1629:	g_arenaservers.showfull.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+1576+72
CNSTU4 258
ASGNU4
line 1630
;1630:	g_arenaservers.showfull.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1576+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1631
;1631:	g_arenaservers.showfull.generic.id			= ID_SHOW_FULL;
ADDRGP4 g_arenaservers+1576+24
CNSTI4 13
ASGNI4
line 1632
;1632:	g_arenaservers.showfull.generic.x			= 320;
ADDRGP4 g_arenaservers+1576+28
CNSTI4 320
ASGNI4
line 1633
;1633:	g_arenaservers.showfull.generic.y			= y;
ADDRGP4 g_arenaservers+1576+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1635
;1634:
;1635:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 1636
;1636:	g_arenaservers.showempty.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+1672
CNSTI4 5
ASGNI4
line 1637
;1637:	g_arenaservers.showempty.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+1672+72
CNSTU4 258
ASGNU4
line 1638
;1638:	g_arenaservers.showempty.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1672+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1639
;1639:	g_arenaservers.showempty.generic.id			= ID_SHOW_EMPTY;
ADDRGP4 g_arenaservers+1672+24
CNSTI4 14
ASGNI4
line 1640
;1640:	g_arenaservers.showempty.generic.x			= 320;
ADDRGP4 g_arenaservers+1672+28
CNSTI4 320
ASGNI4
line 1641
;1641:	g_arenaservers.showempty.generic.y			= y;
ADDRGP4 g_arenaservers+1672+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1643
;1642:	
;1643:	y += SMALLCHAR_HEIGHT+4;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 1644
;1644:	g_arenaservers.password.generic.type		= MTYPE_FIELD;
ADDRGP4 g_arenaservers+3384
CNSTI4 4
ASGNI4
line 1645
;1645:	g_arenaservers.password.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+3384+72
CNSTU4 258
ASGNU4
line 1646
;1646:	g_arenaservers.password.field.widthInChars	= 32;
ADDRGP4 g_arenaservers+3384+88+8
CNSTI4 32
ASGNI4
line 1647
;1647:	g_arenaservers.password.field.maxchars		= 32;
ADDRGP4 g_arenaservers+3384+88+268
CNSTI4 32
ASGNI4
line 1648
;1648:	g_arenaservers.password.generic.x			= 320;
ADDRGP4 g_arenaservers+3384+28
CNSTI4 320
ASGNI4
line 1649
;1649:	g_arenaservers.password.generic.y			= y;
ADDRGP4 g_arenaservers+3384+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1651
;1650:
;1651:	y += 3 * SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 3
ADDRGP4 cl_smallcharheight+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1652
;1652:	g_arenaservers.list.generic.type			= MTYPE_SCROLLLIST;
ADDRGP4 g_arenaservers+1768
CNSTI4 8
ASGNI4
line 1653
;1653:	g_arenaservers.list.generic.flags			= QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 g_arenaservers+1768+72
CNSTU4 128
ASGNU4
line 1654
;1654:	g_arenaservers.list.generic.id				= ID_LIST;
ADDRGP4 g_arenaservers+1768+24
CNSTI4 15
ASGNI4
line 1655
;1655:	g_arenaservers.list.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1768+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1656
;1656:	g_arenaservers.list.generic.x				= 22 - uis.wideoffset;
ADDRGP4 g_arenaservers+1768+28
CNSTI4 22
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1657
;1657:	g_arenaservers.list.generic.y				= y;
ADDRGP4 g_arenaservers+1768+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1658
;1658:	g_arenaservers.list.width					= MAX_LISTBOXWIDTH;
ADDRGP4 g_arenaservers+1768+112
CNSTI4 82
ASGNI4
line 1659
;1659:	g_arenaservers.list.height					= 11;
ADDRGP4 g_arenaservers+1768+116
CNSTI4 11
ASGNI4
line 1660
;1660:	g_arenaservers.list.itemnames				= (const char **)g_arenaservers.items;
ADDRGP4 g_arenaservers+1768+104
ADDRGP4 g_arenaservers+17188
ASGNP4
line 1661
;1661:	for( i = 0; i < MAX_LISTBOXITEMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1037
line 1662
;1662:		g_arenaservers.items[i] = g_arenaservers.table[i].buff;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaservers+17188
ADDP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+5924
ADDP4
ASGNP4
line 1663
;1663:	}
LABELV $1038
line 1661
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $1037
line 1665
;1664:
;1665:	g_arenaservers.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1900
CNSTI4 6
ASGNI4
line 1666
;1666:	g_arenaservers.mappic.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+1900+72
CNSTU4 16388
ASGNU4
line 1667
;1667:	g_arenaservers.mappic.generic.x				= 22-uis.wideoffset;
ADDRGP4 g_arenaservers+1900+28
CNSTI4 22
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1668
;1668:	g_arenaservers.mappic.generic.y				= 80-12;
ADDRGP4 g_arenaservers+1900+32
CNSTI4 68
ASGNI4
line 1669
;1669:	g_arenaservers.mappic.width					= 128;
ADDRGP4 g_arenaservers+1900+104
CNSTI4 128
ASGNI4
line 1670
;1670:	g_arenaservers.mappic.height				= 96;
ADDRGP4 g_arenaservers+1900+108
CNSTI4 96
ASGNI4
line 1671
;1671:	g_arenaservers.mappic.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+1900+92
ADDRGP4 $1057
ASGNP4
line 1673
;1672:
;1673:	g_arenaservers.arrows.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+2016
CNSTI4 6
ASGNI4
line 1674
;1674:	g_arenaservers.arrows.generic.name			= ART_ARROWS0;
ADDRGP4 g_arenaservers+2016+4
ADDRGP4 $1061
ASGNP4
line 1675
;1675:	g_arenaservers.arrows.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+2016+72
CNSTU4 16388
ASGNU4
line 1676
;1676:	g_arenaservers.arrows.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+2016+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1677
;1677:	g_arenaservers.arrows.generic.x				= 512+48+uis.wideoffset;
ADDRGP4 g_arenaservers+2016+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 560
ADDI4
ASGNI4
line 1678
;1678:	g_arenaservers.arrows.generic.y				= 240-64+16;
ADDRGP4 g_arenaservers+2016+32
CNSTI4 192
ASGNI4
line 1679
;1679:	g_arenaservers.arrows.width					= 64;
ADDRGP4 g_arenaservers+2016+104
CNSTI4 64
ASGNI4
line 1680
;1680:	g_arenaservers.arrows.height				= 128;
ADDRGP4 g_arenaservers+2016+108
CNSTI4 128
ASGNI4
line 1682
;1681:
;1682:	g_arenaservers.up.generic.type				= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+2132
CNSTI4 6
ASGNI4
line 1683
;1683:	g_arenaservers.up.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+2132+72
CNSTU4 2308
ASGNU4
line 1684
;1684:	g_arenaservers.up.generic.callback			= ArenaServers_Event;
ADDRGP4 g_arenaservers+2132+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1685
;1685:	g_arenaservers.up.generic.id				= ID_SCROLL_UP;
ADDRGP4 g_arenaservers+2132+24
CNSTI4 16
ASGNI4
line 1686
;1686:	g_arenaservers.up.generic.x					= 512+48+uis.wideoffset;
ADDRGP4 g_arenaservers+2132+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 560
ADDI4
ASGNI4
line 1687
;1687:	g_arenaservers.up.generic.y					= 240-64+16;
ADDRGP4 g_arenaservers+2132+32
CNSTI4 192
ASGNI4
line 1688
;1688:	g_arenaservers.up.width						= 64;
ADDRGP4 g_arenaservers+2132+104
CNSTI4 64
ASGNI4
line 1689
;1689:	g_arenaservers.up.height					= 64;
ADDRGP4 g_arenaservers+2132+108
CNSTI4 64
ASGNI4
line 1690
;1690:	g_arenaservers.up.focuspic					= ART_ARROWS_UP;
ADDRGP4 g_arenaservers+2132+88
ADDRGP4 $1093
ASGNP4
line 1692
;1691:
;1692:	g_arenaservers.down.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+2248
CNSTI4 6
ASGNI4
line 1693
;1693:	g_arenaservers.down.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+2248+72
CNSTU4 2308
ASGNU4
line 1694
;1694:	g_arenaservers.down.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+2248+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1695
;1695:	g_arenaservers.down.generic.id				= ID_SCROLL_DOWN;
ADDRGP4 g_arenaservers+2248+24
CNSTI4 17
ASGNI4
line 1696
;1696:	g_arenaservers.down.generic.x				= 512+48+uis.wideoffset;
ADDRGP4 g_arenaservers+2248+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 560
ADDI4
ASGNI4
line 1697
;1697:	g_arenaservers.down.generic.y				= 240+16;
ADDRGP4 g_arenaservers+2248+32
CNSTI4 256
ASGNI4
line 1698
;1698:	g_arenaservers.down.width					= 64;
ADDRGP4 g_arenaservers+2248+104
CNSTI4 64
ASGNI4
line 1699
;1699:	g_arenaservers.down.height					= 64;
ADDRGP4 g_arenaservers+2248+108
CNSTI4 64
ASGNI4
line 1700
;1700:	g_arenaservers.down.focuspic				= ART_ARROWS_DOWN;
ADDRGP4 g_arenaservers+2248+88
ADDRGP4 $1112
ASGNP4
line 1702
;1701:
;1702:	y = 376;
ADDRLP4 4
CNSTI4 376
ASGNI4
line 1703
;1703:	g_arenaservers.status.generic.type		= MTYPE_TEXT;
ADDRGP4 g_arenaservers+2364
CNSTI4 7
ASGNI4
line 1704
;1704:	g_arenaservers.status.generic.x			= 320;
ADDRGP4 g_arenaservers+2364+28
CNSTI4 320
ASGNI4
line 1705
;1705:	g_arenaservers.status.generic.y			= y;
ADDRGP4 g_arenaservers+2364+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1706
;1706:	g_arenaservers.status.string			= statusbuffer;
ADDRGP4 g_arenaservers+2364+88
ADDRGP4 $927
ASGNP4
line 1707
;1707:	g_arenaservers.status.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+2364+92
CNSTI4 17
ASGNI4
line 1708
;1708:	g_arenaservers.status.color				= menu_text_color;
ADDRGP4 g_arenaservers+2364+100
ADDRGP4 menu_text_color
ASGNP4
line 1710
;1709:
;1710:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 1711
;1711:	g_arenaservers.statusbar.generic.type   = MTYPE_TEXT;
ADDRGP4 g_arenaservers+2468
CNSTI4 7
ASGNI4
line 1712
;1712:	g_arenaservers.statusbar.generic.x	    = 320;
ADDRGP4 g_arenaservers+2468+28
CNSTI4 320
ASGNI4
line 1713
;1713:	g_arenaservers.statusbar.generic.y	    = y;
ADDRGP4 g_arenaservers+2468+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1714
;1714:	g_arenaservers.statusbar.string	        = "";
ADDRGP4 g_arenaservers+2468+88
ADDRGP4 $278
ASGNP4
line 1715
;1715:	g_arenaservers.statusbar.style	        = UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+2468+92
CNSTI4 17
ASGNI4
line 1716
;1716:	g_arenaservers.statusbar.color	        = text_color_normal;
ADDRGP4 g_arenaservers+2468+100
ADDRGP4 text_color_normal
ASGNP4
line 1718
;1717:
;1718:	g_arenaservers.remove.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+2688
CNSTI4 6
ASGNI4
line 1719
;1719:	g_arenaservers.remove.generic.name		= ART_REMOVE0;
ADDRGP4 g_arenaservers+2688+4
ADDRGP4 $1139
ASGNP4
line 1720
;1720:	g_arenaservers.remove.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+2688+72
CNSTU4 260
ASGNU4
line 1721
;1721:	g_arenaservers.remove.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+2688+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1722
;1722:	g_arenaservers.remove.generic.id		= ID_REMOVE;
ADDRGP4 g_arenaservers+2688+24
CNSTI4 23
ASGNI4
line 1723
;1723:	g_arenaservers.remove.generic.x			= 450 + uis.wideoffset;
ADDRGP4 g_arenaservers+2688+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 450
ADDI4
ASGNI4
line 1724
;1724:	g_arenaservers.remove.generic.y			= 86;
ADDRGP4 g_arenaservers+2688+32
CNSTI4 86
ASGNI4
line 1725
;1725:	g_arenaservers.remove.width				= 96;
ADDRGP4 g_arenaservers+2688+104
CNSTI4 96
ASGNI4
line 1726
;1726:	g_arenaservers.remove.height			= 48;
ADDRGP4 g_arenaservers+2688+108
CNSTI4 48
ASGNI4
line 1727
;1727:	g_arenaservers.remove.focuspic			= ART_REMOVE1;
ADDRGP4 g_arenaservers+2688+88
ADDRGP4 $1157
ASGNP4
line 1729
;1728:
;1729:	g_arenaservers.save.generic.type = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+2572
CNSTI4 6
ASGNI4
line 1730
;1730:	g_arenaservers.save.generic.name = ART_SAVE0;
ADDRGP4 g_arenaservers+2572+4
ADDRGP4 $1161
ASGNP4
line 1731
;1731:	g_arenaservers.save.generic.flags = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+2572+72
CNSTU4 260
ASGNU4
line 1732
;1732:	g_arenaservers.save.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+2572+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1733
;1733:	g_arenaservers.save.generic.id = ID_SAVE;
ADDRGP4 g_arenaservers+2572+24
CNSTI4 25
ASGNI4
line 1734
;1734:	g_arenaservers.save.generic.x = g_arenaservers.remove.generic.x;
ADDRGP4 g_arenaservers+2572+28
ADDRGP4 g_arenaservers+2688+28
INDIRI4
ASGNI4
line 1735
;1735:	g_arenaservers.save.generic.y = g_arenaservers.remove.generic.y;
ADDRGP4 g_arenaservers+2572+32
ADDRGP4 g_arenaservers+2688+32
INDIRI4
ASGNI4
line 1736
;1736:	g_arenaservers.save.width = g_arenaservers.remove.width;
ADDRGP4 g_arenaservers+2572+104
ADDRGP4 g_arenaservers+2688+104
INDIRI4
ASGNI4
line 1737
;1737:	g_arenaservers.save.height = g_arenaservers.remove.height;
ADDRGP4 g_arenaservers+2572+108
ADDRGP4 g_arenaservers+2688+108
INDIRI4
ASGNI4
line 1738
;1738:	g_arenaservers.save.focuspic = ART_SAVE1;
ADDRGP4 g_arenaservers+2572+88
ADDRGP4 $1186
ASGNP4
line 1740
;1739:
;1740:	g_arenaservers.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+2804
CNSTI4 6
ASGNI4
line 1741
;1741:	g_arenaservers.back.generic.name		= ART_BACK0;
ADDRGP4 g_arenaservers+2804+4
ADDRGP4 $1190
ASGNP4
line 1742
;1742:	g_arenaservers.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+2804+72
CNSTU4 260
ASGNU4
line 1743
;1743:	g_arenaservers.back.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+2804+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1744
;1744:	g_arenaservers.back.generic.id			= ID_BACK;
ADDRGP4 g_arenaservers+2804+24
CNSTI4 18
ASGNI4
line 1745
;1745:	g_arenaservers.back.generic.x			= 0 - uis.wideoffset;
ADDRGP4 g_arenaservers+2804+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1746
;1746:	g_arenaservers.back.generic.y			= 480-64;
ADDRGP4 g_arenaservers+2804+32
CNSTI4 416
ASGNI4
line 1747
;1747:	g_arenaservers.back.width				= 128;
ADDRGP4 g_arenaservers+2804+104
CNSTI4 128
ASGNI4
line 1748
;1748:	g_arenaservers.back.height				= 64;
ADDRGP4 g_arenaservers+2804+108
CNSTI4 64
ASGNI4
line 1749
;1749:	g_arenaservers.back.focuspic			= ART_BACK1;
ADDRGP4 g_arenaservers+2804+88
ADDRGP4 $1208
ASGNP4
line 1751
;1750:
;1751:	g_arenaservers.specify.generic.type	    = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+3036
CNSTI4 6
ASGNI4
line 1752
;1752:	g_arenaservers.specify.generic.name		= ART_SPECIFY0;
ADDRGP4 g_arenaservers+3036+4
ADDRGP4 $1212
ASGNP4
line 1753
;1753:	g_arenaservers.specify.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+3036+72
CNSTU4 260
ASGNU4
line 1754
;1754:	g_arenaservers.specify.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+3036+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1755
;1755:	g_arenaservers.specify.generic.id	    = ID_SPECIFY;
ADDRGP4 g_arenaservers+3036+24
CNSTI4 20
ASGNI4
line 1756
;1756:	g_arenaservers.specify.generic.x		= 128 - uis.wideoffset/2;
ADDRGP4 g_arenaservers+3036+28
CNSTI4 128
ADDRGP4 uis+11476
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1757
;1757:	g_arenaservers.specify.generic.y		= 480-64;
ADDRGP4 g_arenaservers+3036+32
CNSTI4 416
ASGNI4
line 1758
;1758:	g_arenaservers.specify.width  		    = 128;
ADDRGP4 g_arenaservers+3036+104
CNSTI4 128
ASGNI4
line 1759
;1759:	g_arenaservers.specify.height  		    = 64;
ADDRGP4 g_arenaservers+3036+108
CNSTI4 64
ASGNI4
line 1760
;1760:	g_arenaservers.specify.focuspic         = ART_SPECIFY1;
ADDRGP4 g_arenaservers+3036+88
ADDRGP4 $1230
ASGNP4
line 1762
;1761:
;1762:	g_arenaservers.refresh.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+2920
CNSTI4 6
ASGNI4
line 1763
;1763:	g_arenaservers.refresh.generic.name		= ART_REFRESH0;
ADDRGP4 g_arenaservers+2920+4
ADDRGP4 $1234
ASGNP4
line 1764
;1764:	g_arenaservers.refresh.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+2920+72
CNSTU4 260
ASGNU4
line 1765
;1765:	g_arenaservers.refresh.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+2920+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1766
;1766:	g_arenaservers.refresh.generic.id		= ID_REFRESH;
ADDRGP4 g_arenaservers+2920+24
CNSTI4 19
ASGNI4
line 1767
;1767:	g_arenaservers.refresh.generic.x		= 256;
ADDRGP4 g_arenaservers+2920+28
CNSTI4 256
ASGNI4
line 1768
;1768:	g_arenaservers.refresh.generic.y		= 480-64;
ADDRGP4 g_arenaservers+2920+32
CNSTI4 416
ASGNI4
line 1769
;1769:	g_arenaservers.refresh.width			= 128;
ADDRGP4 g_arenaservers+2920+104
CNSTI4 128
ASGNI4
line 1770
;1770:	g_arenaservers.refresh.height			= 64;
ADDRGP4 g_arenaservers+2920+108
CNSTI4 64
ASGNI4
line 1771
;1771:	g_arenaservers.refresh.focuspic			= ART_REFRESH1;
ADDRGP4 g_arenaservers+2920+88
ADDRGP4 $1251
ASGNP4
line 1773
;1772:
;1773:	g_arenaservers.create.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+3152
CNSTI4 6
ASGNI4
line 1774
;1774:	g_arenaservers.create.generic.name		= ART_CREATE0;
ADDRGP4 g_arenaservers+3152+4
ADDRGP4 $1255
ASGNP4
line 1775
;1775:	g_arenaservers.create.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+3152+72
CNSTU4 260
ASGNU4
line 1776
;1776:	g_arenaservers.create.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+3152+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1777
;1777:	g_arenaservers.create.generic.id		= ID_CREATE;
ADDRGP4 g_arenaservers+3152+24
CNSTI4 21
ASGNI4
line 1778
;1778:	g_arenaservers.create.generic.x			= 384 + uis.wideoffset/2;
ADDRGP4 g_arenaservers+3152+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 384
ADDI4
ASGNI4
line 1779
;1779:	g_arenaservers.create.generic.y			= 480-64;
ADDRGP4 g_arenaservers+3152+32
CNSTI4 416
ASGNI4
line 1780
;1780:	g_arenaservers.create.width				= 128;
ADDRGP4 g_arenaservers+3152+104
CNSTI4 128
ASGNI4
line 1781
;1781:	g_arenaservers.create.height			= 64;
ADDRGP4 g_arenaservers+3152+108
CNSTI4 64
ASGNI4
line 1782
;1782:	g_arenaservers.create.focuspic			= ART_CREATE1;
ADDRGP4 g_arenaservers+3152+88
ADDRGP4 $1273
ASGNP4
line 1784
;1783:
;1784:	g_arenaservers.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+3268
CNSTI4 6
ASGNI4
line 1785
;1785:	g_arenaservers.go.generic.name			= ART_CONNECT0;
ADDRGP4 g_arenaservers+3268+4
ADDRGP4 $1277
ASGNP4
line 1786
;1786:	g_arenaservers.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+3268+72
CNSTU4 272
ASGNU4
line 1787
;1787:	g_arenaservers.go.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+3268+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1788
;1788:	g_arenaservers.go.generic.id			= ID_CONNECT;
ADDRGP4 g_arenaservers+3268+24
CNSTI4 22
ASGNI4
line 1789
;1789:	g_arenaservers.go.generic.x				= 640 + uis.wideoffset;
ADDRGP4 g_arenaservers+3268+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 1790
;1790:	g_arenaservers.go.generic.y				= 480-64;
ADDRGP4 g_arenaservers+3268+32
CNSTI4 416
ASGNI4
line 1791
;1791:	g_arenaservers.go.width					= 128;
ADDRGP4 g_arenaservers+3268+104
CNSTI4 128
ASGNI4
line 1792
;1792:	g_arenaservers.go.height				= 64;
ADDRGP4 g_arenaservers+3268+108
CNSTI4 64
ASGNI4
line 1793
;1793:	g_arenaservers.go.focuspic				= ART_CONNECT1;
ADDRGP4 g_arenaservers+3268+88
ADDRGP4 $1295
ASGNP4
line 1795
;1794:
;1795:	g_arenaservers.punkbuster.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+19784
CNSTI4 3
ASGNI4
line 1796
;1796:	g_arenaservers.punkbuster.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+19784+72
CNSTU4 258
ASGNU4
line 1797
;1797:	g_arenaservers.punkbuster.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+19784+76
ADDRGP4 ArenaServers_Event
ASGNP4
line 1798
;1798:	g_arenaservers.punkbuster.generic.id			= ID_PUNKBUSTER;
ADDRGP4 g_arenaservers+19784+24
CNSTI4 24
ASGNI4
line 1799
;1799:	g_arenaservers.punkbuster.generic.x				= 480+32;
ADDRGP4 g_arenaservers+19784+28
CNSTI4 512
ASGNI4
line 1800
;1800:	g_arenaservers.punkbuster.generic.y				= 144;
ADDRGP4 g_arenaservers+19784+32
CNSTI4 144
ASGNI4
line 1802
;1801:
;1802:	g_arenaservers.pblogo.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+19916
CNSTI4 6
ASGNI4
line 1803
;1803:	g_arenaservers.pblogo.generic.name			= ART_PUNKBUSTER;
ADDRGP4 g_arenaservers+19916+4
ADDRGP4 $1310
ASGNP4
line 1804
;1804:	g_arenaservers.pblogo.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+19916+72
CNSTU4 16388
ASGNU4
line 1805
;1805:	g_arenaservers.pblogo.generic.x				= 526;
ADDRGP4 g_arenaservers+19916+28
CNSTI4 526
ASGNI4
line 1806
;1806:	g_arenaservers.pblogo.generic.y				= 176;
ADDRGP4 g_arenaservers+19916+32
CNSTI4 176
ASGNI4
line 1807
;1807:	g_arenaservers.pblogo.width					= 32;
ADDRGP4 g_arenaservers+19916+104
CNSTI4 32
ASGNI4
line 1808
;1808:	g_arenaservers.pblogo.height				= 16;
ADDRGP4 g_arenaservers+19916+108
CNSTI4 16
ASGNI4
line 1809
;1809:	g_arenaservers.pblogo.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+19916+92
ADDRGP4 $1057
ASGNP4
line 1811
;1810:	
;1811:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1323
line 1812
;1812:	g_arenaservers.banner.string  		= "SERVERS";
ADDRGP4 g_arenaservers+1076+88
ADDRGP4 $1328
ASGNP4
line 1813
;1813:	g_arenaservers.master.generic.name			= "Servers:";
ADDRGP4 g_arenaservers+1180+4
ADDRGP4 $1331
ASGNP4
line 1814
;1814:	g_arenaservers.master.itemnames				= master_items;
ADDRGP4 g_arenaservers+1180+104
ADDRGP4 master_items
ASGNP4
line 1815
;1815:	g_arenaservers.gametype.generic.name		= "Game Type:";
ADDRGP4 g_arenaservers+1312+4
ADDRGP4 $1336
ASGNP4
line 1816
;1816:	g_arenaservers.gametype.itemnames			= servertype_items;
ADDRGP4 g_arenaservers+1312+104
ADDRGP4 servertype_items
ASGNP4
line 1817
;1817:	g_arenaservers.sortkey.generic.name			= "Sort By:";
ADDRGP4 g_arenaservers+1444+4
ADDRGP4 $1341
ASGNP4
line 1818
;1818:	g_arenaservers.sortkey.itemnames			= sortkey_items;
ADDRGP4 g_arenaservers+1444+104
ADDRGP4 sortkey_items
ASGNP4
line 1819
;1819:	g_arenaservers.showfull.generic.name		= "Show Full:";
ADDRGP4 g_arenaservers+1576+4
ADDRGP4 $1346
ASGNP4
line 1820
;1820:	g_arenaservers.showempty.generic.name		= "Show Empty:";
ADDRGP4 g_arenaservers+1672+4
ADDRGP4 $1349
ASGNP4
line 1821
;1821:	g_arenaservers.password.generic.name		= "Password:";
ADDRGP4 g_arenaservers+3384+4
ADDRGP4 $1352
ASGNP4
line 1822
;1822:	g_arenaservers.punkbuster.generic.name			= "Punkbuster:";
ADDRGP4 g_arenaservers+19784+4
ADDRGP4 $1355
ASGNP4
line 1823
;1823:	g_arenaservers.punkbuster.itemnames				= punkbuster_items;
ADDRGP4 g_arenaservers+19784+104
ADDRGP4 punkbuster_items
ASGNP4
line 1824
;1824:	}
LABELV $1323
line 1825
;1825:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1358
line 1826
;1826:	g_arenaservers.banner.string  		= "СЕРВЕРА";
ADDRGP4 g_arenaservers+1076+88
ADDRGP4 $1363
ASGNP4
line 1827
;1827:	g_arenaservers.master.generic.name			= "Сервера:";
ADDRGP4 g_arenaservers+1180+4
ADDRGP4 $1366
ASGNP4
line 1828
;1828:	g_arenaservers.master.itemnames				= master_itemsru;
ADDRGP4 g_arenaservers+1180+104
ADDRGP4 master_itemsru
ASGNP4
line 1829
;1829:	g_arenaservers.gametype.generic.name		= "Режим Игры:";
ADDRGP4 g_arenaservers+1312+4
ADDRGP4 $1371
ASGNP4
line 1830
;1830:	g_arenaservers.gametype.itemnames			= servertype_itemsru;
ADDRGP4 g_arenaservers+1312+104
ADDRGP4 servertype_itemsru
ASGNP4
line 1831
;1831:	g_arenaservers.sortkey.generic.name			= "Сортировка По:";
ADDRGP4 g_arenaservers+1444+4
ADDRGP4 $1376
ASGNP4
line 1832
;1832:	g_arenaservers.sortkey.itemnames			= sortkey_itemsru;
ADDRGP4 g_arenaservers+1444+104
ADDRGP4 sortkey_itemsru
ASGNP4
line 1833
;1833:	g_arenaservers.showfull.generic.name		= "Показать Полные:";
ADDRGP4 g_arenaservers+1576+4
ADDRGP4 $1381
ASGNP4
line 1834
;1834:	g_arenaservers.showempty.generic.name		= "Показать Пустые:";
ADDRGP4 g_arenaservers+1672+4
ADDRGP4 $1384
ASGNP4
line 1835
;1835:	g_arenaservers.password.generic.name		= "Пароль:";
ADDRGP4 g_arenaservers+3384+4
ADDRGP4 $1387
ASGNP4
line 1836
;1836:	g_arenaservers.punkbuster.generic.name			= "Punkbuster:";
ADDRGP4 g_arenaservers+19784+4
ADDRGP4 $1355
ASGNP4
line 1837
;1837:	g_arenaservers.punkbuster.itemnames				= punkbuster_itemsru;
ADDRGP4 g_arenaservers+19784+104
ADDRGP4 punkbuster_itemsru
ASGNP4
line 1838
;1838:	}
LABELV $1358
line 1840
;1839:
;1840:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.banner );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1842
;1841:
;1842:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.master );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1843
;1843:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.gametype );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1312
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1844
;1844:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.sortkey );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1444
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1845
;1845:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showfull);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1846
;1846:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showempty );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1672
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1847
;1847:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.password );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+3384
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1849
;1848:
;1849:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.arrows );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2016
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1850
;1850:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.up );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2132
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1851
;1851:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.down );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2248
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1853
;1852:
;1853:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mappic );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1900
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1854
;1854:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.list );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1768
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1855
;1855:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.status );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1856
;1856:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.statusbar );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2468
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1857
;1857:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.save);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2572
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1859
;1858:
;1859:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.remove );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2688
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1860
;1860:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.back );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2804
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1861
;1861:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.specify );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+3036
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1862
;1862:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.refresh );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2920
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1863
;1863:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.create );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+3152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1864
;1864:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.go );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+3268
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1866
;1865:
;1866:   if (uis.punkbuster) {
ADDRGP4 uis+11504
INDIRI4
CNSTI4 0
EQI4 $1413
line 1867
;1867:   	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.punkbuster );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+19784
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1868
;1868:	   Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.pblogo );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+19916
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1869
;1869:   }
LABELV $1413
line 1871
;1870:
;1871:	ArenaServers_LoadFavorites();
ADDRGP4 ArenaServers_LoadFavorites
CALLV
pop
line 1873
;1872:
;1873:	g_servertype = 0;
ADDRGP4 g_servertype
CNSTI4 0
ASGNI4
line 1875
;1874:	// hack to get rid of MPlayer stuff
;1875:	value = g_servertype;
ADDRLP4 8
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1876
;1876:	if (value >= 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $1418
line 1877
;1877:		value--;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1418
line 1878
;1878:	g_arenaservers.master.curvalue = value;
ADDRGP4 g_arenaservers+1180+92
ADDRLP4 8
INDIRI4
ASGNI4
line 1880
;1879:
;1880:	g_gametype = Com_Clamp( 0, 12, ui_browserGameType.integer );
CNSTF4 0
ARGF4
CNSTF4 1094713344
ARGF4
ADDRGP4 ui_browserGameType+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_gametype
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1881
;1881:	g_arenaservers.gametype.curvalue = g_gametype;
ADDRGP4 g_arenaservers+1312+92
ADDRGP4 g_gametype
INDIRI4
ASGNI4
line 1883
;1882:
;1883:	g_sortkey = Com_Clamp( 0, 4, ui_browserSortKey.integer );
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRGP4 ui_browserSortKey+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_sortkey
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1884
;1884:	g_arenaservers.sortkey.curvalue = g_sortkey;
ADDRGP4 g_arenaservers+1444+92
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
line 1886
;1885:
;1886:	g_fullservers = Com_Clamp( 0, 1, ui_browserShowFull.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowFull+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_fullservers
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 1887
;1887:	g_arenaservers.showfull.curvalue = g_fullservers;
ADDRGP4 g_arenaservers+1576+88
ADDRGP4 g_fullservers
INDIRI4
ASGNI4
line 1889
;1888:
;1889:	g_emptyservers = Com_Clamp( 0, 1, ui_browserShowEmpty.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_emptyservers
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1890
;1890:	g_arenaservers.showempty.curvalue = g_emptyservers;
ADDRGP4 g_arenaservers+1672+88
ADDRGP4 g_emptyservers
INDIRI4
ASGNI4
line 1892
;1891:
;1892:   if (uis.punkbuster) {
ADDRGP4 uis+11504
INDIRI4
CNSTI4 0
EQI4 $1434
line 1893
;1893:   	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $815
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_arenaservers+19784+92
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 1894
;1894:   }
LABELV $1434
line 1897
;1895:
;1896:	// force to initial state and refresh
;1897:	type = g_servertype;
ADDRLP4 12
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1898
;1898:	g_servertype = -1;
ADDRGP4 g_servertype
CNSTI4 -1
ASGNI4
line 1899
;1899:	ArenaServers_SetType( type );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1901
;1900:
;1901:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $728
ARGP4
ADDRGP4 $278
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1902
;1902:}
LABELV $926
endproc ArenaServers_MenuInit 40 16
export ArenaServers_Cache
proc ArenaServers_Cache 0 4
line 1910
;1903:
;1904:
;1905:/*
;1906:=================
;1907:ArenaServers_Cache
;1908:=================
;1909:*/
;1910:void ArenaServers_Cache( void ) {
line 1911
;1911:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $1190
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1912
;1912:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $1208
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1913
;1913:	trap_R_RegisterShaderNoMip( ART_CREATE0 );
ADDRGP4 $1255
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1914
;1914:	trap_R_RegisterShaderNoMip( ART_CREATE1 );
ADDRGP4 $1273
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1915
;1915:	trap_R_RegisterShaderNoMip( ART_SPECIFY0 );
ADDRGP4 $1212
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1916
;1916:	trap_R_RegisterShaderNoMip( ART_SPECIFY1 );
ADDRGP4 $1230
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1917
;1917:	trap_R_RegisterShaderNoMip( ART_REFRESH0 );
ADDRGP4 $1234
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1918
;1918:	trap_R_RegisterShaderNoMip( ART_REFRESH1 );
ADDRGP4 $1251
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1919
;1919:	trap_R_RegisterShaderNoMip( ART_CONNECT0 );
ADDRGP4 $1277
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1920
;1920:	trap_R_RegisterShaderNoMip( ART_CONNECT1 );
ADDRGP4 $1295
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1921
;1921:	trap_R_RegisterShaderNoMip( ART_ARROWS0  );
ADDRGP4 $1061
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1922
;1922:	trap_R_RegisterShaderNoMip( ART_ARROWS_UP );
ADDRGP4 $1093
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1923
;1923:	trap_R_RegisterShaderNoMip( ART_ARROWS_DOWN );
ADDRGP4 $1112
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1924
;1924:	trap_R_RegisterShaderNoMip( ART_UNKNOWNMAP );
ADDRGP4 $1057
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1925
;1925:	trap_R_RegisterShaderNoMip( ART_PUNKBUSTER );
ADDRGP4 $1310
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1927
;1926:
;1927:	trap_R_RegisterShaderNoMip( ART_SAVE0);
ADDRGP4 $1161
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1928
;1928:	trap_R_RegisterShaderNoMip( ART_SAVE1);
ADDRGP4 $1186
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1929
;1929:}
LABELV $1439
endproc ArenaServers_Cache 0 4
export UI_ArenaServersMenu
proc UI_ArenaServersMenu 0 4
line 1937
;1930:
;1931:
;1932:/*
;1933:=================
;1934:UI_ArenaServersMenu
;1935:=================
;1936:*/
;1937:void UI_ArenaServersMenu( void ) {
line 1938
;1938:	ArenaServers_MenuInit();
ADDRGP4 ArenaServers_MenuInit
CALLV
pop
line 1939
;1939:	UI_PushMenu( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1940
;1940:}
LABELV $1440
endproc UI_ArenaServersMenu 0 4
bss
align 4
LABELV g_fullservers
skip 4
align 4
LABELV g_emptyservers
skip 4
align 4
LABELV g_sortkey
skip 4
align 4
LABELV g_gametype
skip 4
align 4
LABELV g_servertype
skip 4
align 4
LABELV g_nummplayerservers
skip 4
align 4
LABELV g_mplayerserverlist
skip 28160
align 4
LABELV g_numfavoriteservers
skip 4
align 4
LABELV g_favoriteserverlist
skip 7040
align 4
LABELV g_numlocalservers
skip 4
align 4
LABELV g_localserverlist
skip 28160
align 4
LABELV g_numglobalservers
skip 4
align 4
LABELV g_globalserverlist
skip 28160
align 4
LABELV g_arenaservers
skip 20032
import mapfilter_itemsru
import mapfilter_items
import gametype_cvar_base
import randommaptype_itemsru
import randommaptype_items
import gametype_itemsru
import gametype_items
import idmap_list
import UI_LoadMapTypeInfo
import StartServer_MapIconFromType
import StartServer_IsCustomMapType
import StartServer_DrawMapPicture
import StartServer_InitMapPicture
import StartServer_InitMapPictureFromIndex
import StartServer_NumCustomMapTypes
import StartServer_MapSupportsBots
import StartServer_SetIconFromGameType
import UI_BuildMapListByType
import GametypeBits
import StartServer_GetLastScriptError
import StartServer_CreateServer
import StartServer_LoadFromConfig
import UI_SaveMultiArray
import UI_LoadMultiArray
import StartServer_SaveScriptData
import StartServer_LoadScriptDataFromType
import StartServer_InitScriptData
import UIE_ConvertOldCvar
import UIE_SkirmishCvarExists
import UIE_StartServer_LoadSkirmishCvars
import UIE_StartServer_SaveSkirmishCvars
import UIE_GetSkirmishCvarIntClamp
import UIE_GetSkirmishCvarInt
import UIE_GetSkirmishCvar
import UIE_SetSkirmishCvarInt
import UIE_SetSkirmishCvar
import StartServer_CanFight
import s_scriptdata
import StartServer_LoadDisabledItems
import server_itemlist
import StartServer_IsRandomBotExclude
import StartServer_IsBotArenaScript
import StartServer_IsRandomBotList
import StartServer_SlotTeam
import StartServer_ValidateBotSlotCount
import StartServer_BotOnSelectionList
import StartServer_ValidBotCount
import StartServer_BotNameDrawn
import StartServer_InsertNamedBot
import StartServer_SetNamedBot
import StartServer_SetBotSkillRangeType
import StartServer_DoBotAction
import StartServer_MoveBotToOtherTeam
import StartServer_DeleteBotSlot
import StartServer_InsertBotSlot
import StartServer_SaveBotNameList
import StartServer_LoadBotNameList
import StartServer_IsIdMap
import StartServer_IsRandomGeneratedMapList
import StartServer_RangeClipMapIndex
import StartServer_MapPageCount
import StartServer_MapDoAction
import StartServer_SwapMaps
import StartServer_DeleteMap
import StartServer_InsertMap
import StartServer_StoreMap
import StartServer_RefreshMapNames
import StartServer_SaveMapList
import StartServer_LoadMapList
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
LABELV $1387
byte 1 208
byte 1 159
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $1384
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 159
byte 1 209
byte 1 131
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 58
byte 1 0
align 1
LABELV $1381
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 58
byte 1 0
align 1
LABELV $1376
byte 1 208
byte 1 161
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 58
byte 1 0
align 1
LABELV $1371
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $1366
byte 1 208
byte 1 161
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $1363
byte 1 208
byte 1 161
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 208
byte 1 146
byte 1 208
byte 1 149
byte 1 208
byte 1 160
byte 1 208
byte 1 144
byte 1 0
align 1
LABELV $1355
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1352
byte 1 80
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $1349
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $1346
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $1341
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 66
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $1336
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1331
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1328
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $1310
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 112
byte 1 98
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 0
align 1
LABELV $1295
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
LABELV $1277
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
LABELV $1273
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1255
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1251
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
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1234
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
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1230
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
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1212
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
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1208
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
LABELV $1190
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
LABELV $1186
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
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1161
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
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1157
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1139
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1112
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $1093
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $1061
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1057
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
LABELV $908
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 63
byte 1 0
align 1
LABELV $907
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 63
byte 1 0
align 1
LABELV $880
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $874
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $868
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $862
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $860
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $815
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $806
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 208
byte 1 182
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 158
byte 1 208
byte 1 177
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 187
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $800
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $733
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $732
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $731
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $728
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $727
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $724
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $720
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $718
byte 1 32
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $716
byte 1 32
byte 1 108
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $714
byte 1 32
byte 1 99
byte 1 116
byte 1 102
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
byte 1 0
align 1
LABELV $712
byte 1 32
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
byte 1 0
align 1
LABELV $710
byte 1 32
byte 1 104
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
LABELV $708
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $706
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $704
byte 1 32
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $702
byte 1 32
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $700
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $698
byte 1 32
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $696
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $694
byte 1 32
byte 1 115
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $682
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $660
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $550
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $529
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $525
byte 1 78
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $514
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
LABELV $513
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $512
byte 1 112
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $511
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $510
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $509
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
LABELV $508
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $507
byte 1 97
byte 1 100
byte 1 100
byte 1 111
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $506
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $505
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $441
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 46
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 46
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 100
byte 1 47
byte 1 37
byte 1 50
byte 1 100
byte 1 32
byte 1 37
byte 1 45
byte 1 51
byte 1 48
byte 1 46
byte 1 51
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 51
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 51
byte 1 100
byte 1 0
align 1
LABELV $437
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $436
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $433
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $428
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $335
byte 1 208
byte 1 161
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 46
byte 1 0
align 1
LABELV $329
byte 1 78
byte 1 111
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $323
byte 1 78
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 32
byte 1 70
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $295
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $287
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $278
byte 1 0
align 1
LABELV $248
byte 1 208
byte 1 157
byte 1 208
byte 1 176
byte 1 208
byte 1 182
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 83
byte 1 80
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 187
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $243
byte 1 37
byte 1 100
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 81
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 46
byte 1 0
align 1
LABELV $237
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 83
byte 1 80
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $232
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 81
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $213
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
LABELV $200
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $196
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $195
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $160
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $155
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $154
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 73
byte 1 73
byte 1 73
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $153
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $152
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 66
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 208
byte 1 146
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $150
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $149
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $148
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $147
byte 1 73
byte 1 80
byte 1 118
byte 1 54
byte 1 0
align 1
LABELV $146
byte 1 73
byte 1 80
byte 1 118
byte 1 52
byte 1 0
align 1
LABELV $145
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $144
byte 1 79
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $143
byte 1 85
byte 1 114
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 84
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $142
byte 1 81
byte 1 51
byte 1 70
byte 1 0
align 1
LABELV $141
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $140
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $139
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $138
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $137
byte 1 83
byte 1 80
byte 1 32
byte 1 0
align 1
LABELV $136
byte 1 49
byte 1 118
byte 1 49
byte 1 0
align 1
LABELV $135
byte 1 68
byte 1 77
byte 1 32
byte 1 0
align 1
LABELV $134
byte 1 208
byte 1 146
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $133
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $132
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $131
byte 1 208
byte 1 152
byte 1 208
byte 1 188
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $130
byte 1 208
byte 1 152
byte 1 208
byte 1 188
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $129
byte 1 208
byte 1 148
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $128
byte 1 208
byte 1 148
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $127
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $126
byte 1 208
byte 1 163
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 58
byte 1 32
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $125
byte 1 208
byte 1 163
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $124
byte 1 208
byte 1 150
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 209
byte 1 134
byte 1 0
align 1
LABELV $123
byte 1 208
byte 1 144
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $122
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 32
byte 1 208
byte 1 164
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 0
align 1
LABELV $121
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $120
byte 1 208
byte 1 162
byte 1 209
byte 1 131
byte 1 209
byte 1 128
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 0
align 1
LABELV $119
byte 1 208
byte 1 154
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $118
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 209
byte 1 133
byte 1 0
align 1
LABELV $117
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $116
byte 1 208
byte 1 155
byte 1 209
byte 1 142
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $115
byte 1 208
byte 1 155
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $114
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $112
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 112
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $111
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $110
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $109
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
LABELV $108
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
LABELV $107
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
LABELV $106
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
LABELV $105
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
LABELV $104
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
LABELV $103
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
LABELV $102
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
LABELV $101
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
LABELV $100
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
LABELV $99
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
LABELV $98
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
LABELV $97
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
LABELV $96
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $95
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $94
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $93
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
