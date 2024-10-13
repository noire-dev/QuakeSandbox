data
align 4
LABELV weaponitems_list
address $95
address $96
byte 4 0
byte 4 0
skip 4
address $97
address $98
byte 4 1
byte 4 0
skip 4
address $99
address $100
byte 4 2
byte 4 0
skip 4
address $101
address $102
byte 4 3
byte 4 0
skip 4
address $103
address $104
byte 4 4
byte 4 0
skip 4
address $105
address $106
byte 4 5
byte 4 0
skip 4
address $107
address $108
byte 4 6
byte 4 0
skip 4
address $109
address $110
byte 4 7
byte 4 0
skip 4
address $111
address $112
byte 4 8
byte 4 0
skip 4
address $113
address $114
byte 4 9
byte 4 0
skip 4
address $115
address $116
byte 4 10
byte 4 0
skip 4
address $117
address $118
byte 4 11
byte 4 0
skip 4
address $119
address $120
byte 4 12
byte 4 0
skip 4
address $121
address $122
byte 4 13
byte 4 0
skip 4
align 4
LABELV weaponammo_list
address $123
address $124
byte 4 14
byte 4 0
skip 4
address $125
address $126
byte 4 15
byte 4 0
skip 4
address $127
address $128
byte 4 16
byte 4 0
skip 4
address $129
address $130
byte 4 17
byte 4 0
skip 4
address $131
address $132
byte 4 18
byte 4 0
skip 4
address $107
address $133
byte 4 19
byte 4 0
skip 4
address $134
address $135
byte 4 20
byte 4 0
skip 4
address $136
address $137
byte 4 21
byte 4 0
skip 4
address $138
address $139
byte 4 22
byte 4 0
skip 4
address $140
address $141
byte 4 23
byte 4 0
skip 4
address $142
address $143
byte 4 24
byte 4 0
skip 4
address $144
address $145
byte 4 25
byte 4 0
skip 4
align 4
LABELV healthitems_list
address $146
address $147
byte 4 26
byte 4 0
skip 4
address $148
address $149
byte 4 27
byte 4 0
skip 4
address $150
address $151
byte 4 28
byte 4 0
skip 4
address $152
address $153
byte 4 29
byte 4 0
skip 4
align 4
LABELV armouritems_list
address $154
address $155
byte 4 30
byte 4 0
skip 4
address $156
address $157
byte 4 31
byte 4 0
skip 4
address $158
address $159
byte 4 32
byte 4 0
skip 4
address $160
address $161
byte 4 33
byte 4 0
skip 4
address $162
address $163
byte 4 34
byte 4 0
skip 4
align 4
LABELV powerupitems_list
address $164
address $165
byte 4 35
byte 4 0
skip 4
address $166
address $167
byte 4 36
byte 4 0
skip 4
address $168
address $169
byte 4 37
byte 4 0
skip 4
address $170
address $171
byte 4 38
byte 4 0
skip 4
address $172
address $173
byte 4 39
byte 4 0
skip 4
address $174
address $175
byte 4 40
byte 4 0
skip 4
address $176
address $177
byte 4 41
byte 4 0
skip 4
address $178
address $179
byte 4 42
byte 4 0
skip 4
address $180
address $181
byte 4 43
byte 4 0
skip 4
address $182
address $183
byte 4 44
byte 4 0
skip 4
align 4
LABELV holdableitems_list
address $184
address $185
byte 4 45
byte 4 0
skip 4
address $186
address $187
byte 4 46
byte 4 0
skip 4
address $188
address $189
byte 4 47
byte 4 0
skip 4
address $190
address $191
byte 4 48
byte 4 0
skip 4
address $192
address $193
byte 4 49
byte 4 0
skip 4
align 4
LABELV masterControl
byte 4 0
address $194
address $195
address $196
address $197
byte 4 0
address weaponitems_list
byte 4 14
byte 4 1
address $198
address $199
address $124
address $200
byte 4 0
address weaponammo_list
byte 4 12
byte 4 2
address $201
address $202
address $203
address $204
byte 4 0
address healthitems_list
byte 4 4
byte 4 3
address $205
address $206
address $207
address $208
byte 4 0
address armouritems_list
byte 4 5
byte 4 4
address $209
address $210
address $211
address $212
byte 4 0
address powerupitems_list
byte 4 10
byte 4 5
address $213
address $214
address $215
address $216
byte 4 0
address holdableitems_list
byte 4 5
align 4
LABELV allgroups_items
address $217
address $218
address $219
byte 4 0
align 4
LABELV allgroups_itemsru
address $220
address $221
address $222
byte 4 0
code
proc StartServer_GetItemFromMapObject 8 8
file "../../../code/q3_ui/ui_startserver_items.c"
line 297
;1:/*
;2:=============================================================================
;3:
;4:START SERVER MENU *****
;5:
;6:=============================================================================
;7:*/
;8:
;9:
;10:#include "ui_local.h"
;11:#include "ui_startserver_q3.h"
;12:
;13:
;14:/*
;15:	This menu is slightly unusual. It can be either a part of the setup
;16:	for a map/bot rotation, or it can be called in-game to adjust the
;17:	parameters for the next map.
;18:
;19:	*_InGame_* function are only used in the ingame menu
;20:	*_ItemPage_* functions are only used in the skirmish menu
;21:	*_BothItemMenus_* functions... 
;22:*/
;23:
;24:#define ARRAY_COUNT(x) (sizeof(x)/sizeof(x[0]))
;25:
;26:
;27:#define INGAME_CANCEL0 	"menu/art/back_0"
;28:#define INGAME_CANCEL1 	"menu/art/back_1"
;29:#define INGAME_ACCEPT0 	"menu/art/accept_0"
;30:#define INGAME_ACCEPT1 	"menu/art/accept_1"
;31:
;32:#define SERVER_ITEM_RESET0 	"menu/art/reset_0"
;33:#define SERVER_ITEM_RESET1 	"menu/art/reset_1"
;34://#define SERVER_ITEM_CLEAR0 	"menu/uie_art/clear_0"
;35://#define SERVER_ITEM_CLEAR1 	"menu/uie_art/clear_1"
;36:
;37:
;38:#define ID_ITEM_GAMETYPE 	401
;39:#define ID_ITEM_RESET		402
;40:#define ID_ITEM_CLEAR		403
;41:
;42:#define ID_ITEMINGAME_CANCEL 	430
;43:#define ID_ITEMINGAME_ACCEPT 	431
;44:
;45:#define ITEMCONTROL_X (320 + 4*SMALLCHAR_WIDTH)
;46:
;47:
;48:
;49://
;50:// controls
;51://
;52:
;53:
;54:#define MAX_ITEM_ONPAGE 16
;55:
;56:
;57:// a single item, and related data/controls
;58:typedef struct iteminfo_s {
;59:	char* name;
;60:	char* runame;
;61:	int ident;	// ITEM_* flag
;62:
;63:	itemnode_t* item;
;64:	menuradiobutton_s* control;
;65:} iteminfo_t;
;66:
;67:
;68:
;69:
;70:typedef struct itemradionbutton_s {
;71:	menuradiobutton_s control;
;72:	iteminfo_t* item;
;73:	int bg_index;	// bg_items[] index
;74:} itemradiobutton_t;
;75:
;76:
;77:
;78:
;79:// controls that appear when used as an in-game menu
;80:typedef struct ingame_controls_t {
;81:	menutext_s		title;
;82:	menubitmap_s	cancel;
;83:	menubitmap_s	accept;
;84:	menutext_s		info;
;85:} ingame_controls_s;
;86:
;87:
;88:
;89:// and finally the page controls themselves
;90:typedef struct itemcontrols_s {
;91:	menuframework_s 	menu;
;92:	commoncontrols_t 	common;
;93:	ingame_controls_s	ingame;
;94:
;95:	menulist_s 		gameType;
;96:	menubitmap_s 	gameTypeIcon;
;97:
;98:	menulist_s 		groupMaster[ITEMGROUP_COUNT];	// don't use ITEMGROUP_* to index
;99:	menutext_s		tabbedText[ITEMGROUP_COUNT];	// selection text for a page of items
;100:
;101:	itemradiobutton_t itemCtrl[MAX_ITEM_ONPAGE]; // don't use ITEM_* to index
;102:
;103:	menubitmap_s	reset;
;104:
;105:	qboolean ingame_menu;	// menu display format
;106:
;107:	int currentPage;
;108:	int numPageItems;
;109:
;110:	int base_master_y;	// height of master controls
;111:	int mid_tabbed_y;	// height of middle of tabbed controls
;112:
;113:	// state of the controls
;114:	// this abstraction "aliases" or "hides" where the data is stored,
;115:	// and helps us separate data associated with the script from
;116:	// data associated with the in-game version of this menu
;117:
;118:	// array size assumed as ITEM_COUNT
;119:	// indexed by ITEM_*
;120:	qboolean* enabled;
;121:
;122:	// array size assumed as ITEMGROUP_COUNT
;123:	// indexed by ITEMGROUP_*
;124:	int* grouptype;
;125:} itemcontrols_t;
;126:
;127:
;128:
;129:static itemcontrols_t s_itemcontrols;
;130:
;131:
;132://
;133:// data storage used during ingame menu display
;134:// you shouldn't need to read/write these values directly
;135://
;136:static qboolean ingame_enabled[ITEM_COUNT];
;137:static int ingame_grouptype[ITEMGROUP_COUNT];
;138:
;139:
;140:
;141:// enum used to distinguish how group controls are updated
;142:// arguments to StartServer_BothItemMenus_SetGroupControl()
;143:enum {
;144:	IGROUP_FLUSHCUSTOM,
;145:	IGROUP_PRESERVECUSTOM
;146:};
;147:
;148:
;149:
;150://
;151:// data lists
;152://
;153:
;154:
;155:// WEAPONS   ------------------------------------------
;156:
;157:static iteminfo_t weaponitems_list[] =
;158:{
;159:	{"Hook:", "Крюк:", ITEM_GRAPPLING_HOOK, NULL},
;160:	{"Machinegun:", "Автомат:", ITEM_MGUN, NULL},
;161:	{"Shotgun:", "Дробовик:", ITEM_SHOTGUN, NULL},
;162:	{"Grenade:", "Гранатомёт:", ITEM_GRENADE, NULL},
;163:	{"Rocket:", "Ракетница:", ITEM_ROCKET, NULL},
;164:	{"Plasma:", "Плазмаган:", ITEM_PLASMA, NULL},
;165:	{"Lightning:", "Молния:", ITEM_LIGHTNING, NULL},
;166:	{"Railgun:", "Рэйлган:", ITEM_RAIL, NULL},
;167:	{"BFG10k:", "БФГ:", ITEM_BFG, NULL},
;168:	{"Nailgun:", "Гвоздомёт:", ITEM_NAILGUN, NULL},
;169:	{"Prox Launcher:", "Миномёт:", ITEM_PROX_LAUNCHER, NULL},
;170:	{"Chaingun:", "Пулемёт:", ITEM_CHAINGUN, NULL},
;171:	{"Flamethrower:", "Огнемёт:", ITEM_FLAMETHROWER, NULL},
;172:	{"Dark Flare:", "Темная вспышка:", ITEM_ANTIMATTER, NULL}
;173:};
;174:static iteminfo_t weaponammo_list[] =
;175:{
;176:	{"Bullets:", "Пули:", ITEM_MGUN_AMMO, NULL},
;177:	{"Shells:", "Дробь:", ITEM_SHOTGUN_AMMO, NULL},
;178:	{"Grenades:", "Гранаты:", ITEM_GRENADE_AMMO, NULL},
;179:	{"Rockets:", "Ракеты:", ITEM_ROCKET_AMMO, NULL},
;180:	{"Cells:", "Плазма:", ITEM_PLASMA_AMMO, NULL},
;181:	{"Lightning:", "Заряд:", ITEM_LIGHTNING_AMMO, NULL},
;182:	{"Slugs:", "Лучи:", ITEM_RAIL_AMMO, NULL},
;183:	{"BFG Ammo:", "БФГ Заряд:", ITEM_BFG_AMMO, NULL},
;184:	{"Nails:", "Гвозди:", ITEM_NAILGUN_AMMO, NULL},
;185:	{"Proximity Mines:", "Мины:", ITEM_PROX_LAUNCHER_AMMO, NULL},
;186:	{"Chaingun Belt:", "Пулеметные пули:", ITEM_CHAINGUN_AMMO, NULL},
;187:	{"Flame:", "Напалм:", ITEM_FLAMETHROWER_AMMO, NULL}
;188:};
;189:
;190:// HEALTH    ------------------------------------------
;191:static iteminfo_t healthitems_list[] =
;192:{
;193:	{"Mega:", "Мега:", ITEM_MEGA, NULL},
;194:	{"Green +5:", "Зеленая:", ITEM_HEALTH_SMALL, NULL},
;195:	{"Yellow +25:", "Жёлтая:", ITEM_HEALTH_MEDIUM, NULL},
;196:	{"Gold +50:", "Золотая:", ITEM_HEALTH_LARGE, NULL}
;197:};
;198:
;199:
;200:
;201:// ARMOUR    ------------------------------------------
;202:static iteminfo_t armouritems_list[] =
;203:{
;204:	{"Purple +200:", "Фиолетовая +200:", ITEM_ARMOUR_PURPLE, NULL},
;205:	{"Red +100:", "Красная +200:", ITEM_ARMOUR_RED, NULL},
;206:	{"Yellow +50:", "Жёлтая +200:", ITEM_ARMOUR_YELLOW, NULL},
;207:	{"Green +25:", "Зеленая +200:", ITEM_ARMOUR_GREEN, NULL},
;208:	{"Shard +5:", "Кусок +200:", ITEM_ARMOUR_SHARD, NULL}
;209:};
;210:
;211:
;212:// POWERUPS  ------------------------------------------
;213:static iteminfo_t powerupitems_list[] =
;214:{
;215:	{"Quad:", "Квад:", ITEM_QUAD, NULL},
;216:	{"Regen:", "Реген:", ITEM_REGEN, NULL},
;217:	{"Haste:", "Скорость:", ITEM_HASTE, NULL},
;218:	{"Battlesuit:", "Боевой щит:", ITEM_BATTLESUIT, NULL},
;219:	{"Invisible:", "Невидимость:", ITEM_INVISIBLE, NULL},
;220:	{"Flight:", "Полет:", ITEM_FLIGHT, NULL},
;221:	{"Scout:", "Скаут:", ITEM_SCOUT, NULL},
;222:	{"Guard:", "Защитник:", ITEM_GUARD, NULL},
;223:	{"Doubler:", "Удвоитель:", ITEM_DOUBLER, NULL},
;224:	{"AmmoRegen:", "Реген пуль:", ITEM_AMMOREGEN, NULL}
;225:};
;226:
;227:
;228:// HOLDABLE  ------------------------------------------
;229:static iteminfo_t holdableitems_list[] =
;230:{
;231:	{"Medkit:", "Аптечка:", ITEM_MEDKIT, NULL},
;232:	{"Teleporter:", "Телепортер:", ITEM_TELEPORTER, NULL},
;233:	{"Kamikaze:", "Камикадзе:", ITEM_KAMIKAZE, NULL},
;234:	{"Invulnerability:", "Оболочка:", ITEM_INVULNERABILITY, NULL},
;235:	{"Portal:", "Портал:", ITEM_PORTAL, NULL}
;236:};
;237:
;238:
;239:
;240:// GROUP LAYOUT ------------------------------------------
;241:
;242:
;243:typedef struct mastercontrol_s {
;244:	int ident;
;245:	char* masterTitle;
;246:	char* tabbedTitle;
;247:	char* masterTitleru;
;248:	char* tabbedTitleru;
;249:	menulist_s* control;
;250:	iteminfo_t* items;
;251:	int item_count;
;252:} mastercontrol_t;
;253:
;254:
;255:
;256:static mastercontrol_t masterControl[ITEMGROUP_COUNT] = {
;257:	{ ITEMGROUP_WEAPON, "Weapon:", "Weapons", "Оружие:", "Оружие", NULL, weaponitems_list, ARRAY_COUNT(weaponitems_list) },
;258:	{ ITEMGROUP_AMMO, "Ammo:", "Ammo", "Пули:", "Пули", NULL, weaponammo_list, ARRAY_COUNT(weaponammo_list) },
;259:	{ ITEMGROUP_HEALTH, "Health:", "Health", "Жизни:", "Жизни", NULL, healthitems_list, ARRAY_COUNT(healthitems_list) },
;260:	{ ITEMGROUP_ARMOUR, "Armour:", "Armour", "Броня:", "Броня", NULL, armouritems_list, ARRAY_COUNT(armouritems_list) },
;261:	{ ITEMGROUP_POWERUPS, "Powerups:", "Powerups", "Бонус:", "Бонусы", NULL, powerupitems_list, ARRAY_COUNT(powerupitems_list) },
;262:	{ ITEMGROUP_HOLDABLE, "Holdables:", "Holdables", "Предмет:", "Предметы", NULL, holdableitems_list, ARRAY_COUNT(holdableitems_list) }
;263:};
;264:
;265:static const char* allgroups_items[] = {
;266:	"All",	// ALLGROUPS_ENABLED
;267:	"Custom",	// ALLGROUPS_CUSTOM
;268:	"Hidden",	// ALLGROUPS_HIDDEN
;269:	0
;270:};
;271:
;272:static const char* allgroups_itemsru[] = {
;273:	"Все",	// ALLGROUPS_ENABLED
;274:	"Настр",	// ALLGROUPS_CUSTOM
;275:	"Скрыть",	// ALLGROUPS_HIDDEN
;276:	0
;277:};
;278:
;279:
;280:
;281:
;282://------------------------------------------------------------------
;283:
;284:// Most functions common to both types a page
;285:// The remaining functions can be found at the end of the file
;286:
;287://------------------------------------------------------------------
;288:
;289:
;290:
;291:/*
;292:=================
;293:StartServer_ItemPage_GetItemFromMapObject
;294:=================
;295:*/
;296:static int StartServer_GetItemFromMapObject(const char* ident)
;297:{
line 300
;298:	int i;
;299:
;300:	for (i = 0; i < bg_numItems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $227
JUMPV
LABELV $224
line 301
;301:	{
line 302
;302:		if (!Q_stricmp(ident, bg_itemlist[i].classname))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $228
line 303
;303:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $223
JUMPV
LABELV $228
line 304
;304:	}
LABELV $225
line 300
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $227
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $224
line 306
;305:
;306:	Com_Printf("bg_itemlist, unknown type: %s\n", ident);
ADDRGP4 $230
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 307
;307:	return 0;
CNSTI4 0
RETI4
LABELV $223
endproc StartServer_GetItemFromMapObject 8 8
export StartServer_BothItemMenus_Cache
proc StartServer_BothItemMenus_Cache 0 4
line 321
;308:}
;309:
;310:
;311:
;312:
;313:
;314:
;315:/*
;316:=================
;317:StartServer_BothItemMenus_Cache
;318:=================
;319:*/
;320:void StartServer_BothItemMenus_Cache( void )
;321:{
line 322
;322:	if (s_itemcontrols.ingame_menu)
ADDRGP4 s_itemcontrols+6292
INDIRI4
CNSTI4 0
EQI4 $232
line 323
;323:	{
line 324
;324:		trap_R_RegisterShaderNoMip( INGAME_CANCEL0 );
ADDRGP4 $235
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 325
;325:		trap_R_RegisterShaderNoMip( INGAME_CANCEL1 );
ADDRGP4 $236
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 326
;326:		trap_R_RegisterShaderNoMip( INGAME_ACCEPT0 );
ADDRGP4 $237
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 327
;327:		trap_R_RegisterShaderNoMip( INGAME_ACCEPT1 );
ADDRGP4 $238
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 328
;328:	}
LABELV $232
line 330
;329:
;330:	trap_R_RegisterShaderNoMip( SERVER_ITEM_RESET0 );
ADDRGP4 $239
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 331
;331:	trap_R_RegisterShaderNoMip( SERVER_ITEM_RESET1 );
ADDRGP4 $240
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 334
;332://	trap_R_RegisterShaderNoMip( SERVER_ITEM_CLEAR0 );
;333://	trap_R_RegisterShaderNoMip( SERVER_ITEM_CLEAR1 );
;334:}
LABELV $231
endproc StartServer_BothItemMenus_Cache 0 4
proc StartServer_BothItemMenus_SetTabbedCtrlValues 20 0
line 344
;335:
;336:
;337:
;338:/*
;339:=================
;340:StartServer_BothItemMenus_SetTabbedCtrlValues
;341:=================
;342:*/
;343:static void StartServer_BothItemMenus_SetTabbedCtrlValues( void )
;344:{
line 351
;345:	int page;
;346:	qboolean 	enabled;
;347:	int 		grouptype;
;348:	iteminfo_t*	item;
;349:	int i;
;350:
;351:	page = s_itemcontrols.currentPage;
ADDRLP4 12
ADDRGP4 s_itemcontrols+6296
INDIRI4
ASGNI4
line 353
;352:
;353:	enabled = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 354
;354:	grouptype = s_itemcontrols.grouptype[ page ];
ADDRLP4 16
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6316
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 355
;355:	if (grouptype == ALLGROUPS_HIDDEN)
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $244
line 356
;356:		enabled = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $244
line 358
;357:
;358:	for (i = 0; i < s_itemcontrols.numPageItems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $249
JUMPV
LABELV $246
line 359
;359:	{
line 360
;360:		item = &masterControl[page].items[i];
ADDRLP4 4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 12
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+24
ADDP4
INDIRP4
ADDP4
ASGNP4
line 361
;361:		if (grouptype == ALLGROUPS_CUSTOM) {
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $252
line 362
;362:			enabled = s_itemcontrols.enabled[ item->ident ];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6312
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 363
;363:		}
LABELV $252
line 365
;364:
;365:		item->control->curvalue = enabled;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 366
;366:	}
LABELV $247
line 358
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $249
ADDRLP4 0
INDIRI4
ADDRGP4 s_itemcontrols+6300
INDIRI4
LTI4 $246
line 367
;367:}
LABELV $241
endproc StartServer_BothItemMenus_SetTabbedCtrlValues 20 0
proc StartServer_BothItemMenus_InitControls 8 0
line 376
;368:
;369:
;370:/*
;371:=================
;372:StartServer_BothItemMenus_InitControls
;373:=================
;374:*/
;375:static void StartServer_BothItemMenus_InitControls( void )
;376:{
line 380
;377:	int 		i;
;378:
;379:	// initialize the master controls
;380:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $256
line 381
;381:	{
line 382
;382:		masterControl[i].control->curvalue = s_itemcontrols.grouptype[ masterControl[i].ident ];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 masterControl+20
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRI4
ADDRGP4 masterControl
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6316
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 383
;383:	}
LABELV $257
line 380
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $256
line 386
;384:
;385:	// initialize current group of items
;386:	StartServer_BothItemMenus_SetTabbedCtrlValues();
ADDRGP4 StartServer_BothItemMenus_SetTabbedCtrlValues
CALLV
pop
line 387
;387:}
LABELV $255
endproc StartServer_BothItemMenus_InitControls 8 0
proc StartServer_BothItemMenus_ResetAll 4 0
line 401
;388:
;389:
;390:
;391:
;392:/*
;393:=================
;394:StartServer_BothItemMenus_ResetAll
;395:
;396:Sets all item controls on/off and group settings
;397:become custom
;398:=================
;399:*/
;400:static void StartServer_BothItemMenus_ResetAll( qboolean enabled)
;401:{
line 404
;402:	int i;
;403:
;404:	for (i = 0; i < ITEM_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $263
line 405
;405:	{
line 406
;406:		s_itemcontrols.enabled[i] = enabled;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6312
INDIRP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 407
;407:	}
LABELV $264
line 404
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $263
line 409
;408:
;409:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $268
line 410
;410:	{
line 411
;411:		s_itemcontrols.grouptype[i] = ALLGROUPS_CUSTOM;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6316
INDIRP4
ADDP4
CNSTI4 1
ASGNI4
line 412
;412:	}
LABELV $269
line 409
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $268
line 414
;413:
;414:	StartServer_BothItemMenus_InitControls();
ADDRGP4 StartServer_BothItemMenus_InitControls
CALLV
pop
line 415
;415:}
LABELV $262
endproc StartServer_BothItemMenus_ResetAll 4 0
proc StartServer_BothItemMenus_FindGroupType 12 0
line 425
;416:
;417:
;418:
;419:/*
;420:=================
;421:StartServer_BothItemMenus_FindGroupType
;422:=================
;423:*/
;424:static int StartServer_BothItemMenus_FindGroupType( iteminfo_t* list, int size )
;425:{
line 430
;426:	int grouptype;
;427:	qboolean enabled;
;428:	int i;
;429:
;430:	if (size == 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $274
line 431
;431:		return ALLGROUPS_ENABLED;
CNSTI4 0
RETI4
ADDRGP4 $273
JUMPV
LABELV $274
line 433
;432:
;433:	grouptype = ALLGROUPS_ENABLED;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 434
;434:	enabled = s_itemcontrols.enabled[ list[0].ident ];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6312
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 435
;435:	if (!enabled)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $277
line 436
;436:		grouptype = ALLGROUPS_HIDDEN;
ADDRLP4 8
CNSTI4 2
ASGNI4
LABELV $277
line 438
;437:
;438:	for (i = 0; i < size; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $279
line 439
;439:	{
line 440
;440:		if (enabled != s_itemcontrols.enabled[ list[i].ident ]) {
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6312
INDIRP4
ADDP4
INDIRI4
EQI4 $283
line 441
;441:			return ALLGROUPS_CUSTOM;
CNSTI4 1
RETI4
ADDRGP4 $273
JUMPV
LABELV $283
line 443
;442:		}
;443:	}
LABELV $280
line 438
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $282
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $279
line 445
;444:
;445:	return grouptype;
ADDRLP4 8
INDIRI4
RETI4
LABELV $273
endproc StartServer_BothItemMenus_FindGroupType 12 0
proc StartServer_BothItemMenus_UpdateInterface 36 12
line 457
;446:}
;447:
;448:
;449:
;450:
;451:/*
;452:=================
;453:StartServer_BothItemMenus_UpdateInterface
;454:=================
;455:*/
;456:static void StartServer_BothItemMenus_UpdateInterface(void)
;457:{
line 464
;458:	int i;
;459:	int page, type;
;460:	menuradiobutton_s* ctrl;
;461:	iteminfo_t* item;
;462:
;463:	// menu type specific interface updates
;464:	if (!s_itemcontrols.ingame_menu)
ADDRGP4 s_itemcontrols+6292
INDIRI4
CNSTI4 0
NEI4 $287
line 465
;465:	{
line 466
;466:		StartServer_SetIconFromGameType(&s_itemcontrols.gameTypeIcon, s_scriptdata.gametype, qfalse);
ADDRGP4 s_itemcontrols+2980
ARGP4
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_SetIconFromGameType
CALLV
pop
line 467
;467:	}
LABELV $287
line 470
;468:
;469:	// set the group controls
;470:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $291
line 471
;471:	{
line 472
;472:		if (masterControl[i].control)
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+20
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $295
line 473
;473:			masterControl[i].control->curvalue = s_itemcontrols.grouptype[i];
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+20
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6316
INDIRP4
ADDP4
INDIRI4
ASGNI4
LABELV $295
line 474
;474:	}
LABELV $292
line 470
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $291
line 477
;475:
;476:	// set tab controls
;477:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $300
line 478
;478:	{
line 479
;479:		s_itemcontrols.tabbedText[i].generic.flags |= (QMF_PULSEIFFOCUS);
ADDRLP4 20
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 480
;480:		s_itemcontrols.tabbedText[i].generic.flags &= ~(QMF_HIGHLIGHT_IF_FOCUS|QMF_HIGHLIGHT);
ADDRLP4 24
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+72
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTI4 -193
CVIU4 4
BANDU4
ASGNU4
line 481
;481:	}
LABELV $301
line 477
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $300
line 483
;482:
;483:	page = s_itemcontrols.currentPage;
ADDRLP4 4
ADDRGP4 s_itemcontrols+6296
INDIRI4
ASGNI4
line 484
;484:	s_itemcontrols.tabbedText[page].generic.flags &= ~(QMF_PULSEIFFOCUS);
ADDRLP4 20
CNSTI4 104
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -257
CVIU4 4
BANDU4
ASGNU4
line 485
;485:	s_itemcontrols.tabbedText[page].generic.flags |= (QMF_HIGHLIGHT_IF_FOCUS|QMF_HIGHLIGHT);
ADDRLP4 24
CNSTI4 104
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+72
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 192
BORU4
ASGNU4
line 490
;486:
;487:
;488:	// set controls on the currently tabbed page
;489:
;490:	for (i = 0; i < s_itemcontrols.numPageItems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $316
JUMPV
LABELV $313
line 491
;491:	{
line 492
;492:		type = masterControl[page].control->curvalue;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+20
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 493
;493:		item = &masterControl[page].items[i];
ADDRLP4 16
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+24
ADDP4
INDIRP4
ADDP4
ASGNP4
line 494
;494:		ctrl = item->control;
ADDRLP4 12
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ASGNP4
line 495
;495:		ctrl->generic.flags &= ~(QMF_GRAYED|QMF_INACTIVE);
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTI4 -24577
CVIU4 4
BANDU4
ASGNU4
line 496
;496:		switch (type) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $322
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $324
ADDRLP4 8
INDIRI4
CNSTI4 2
EQI4 $323
ADDRGP4 $320
JUMPV
LABELV $322
line 498
;497:		case ALLGROUPS_ENABLED:
;498:			ctrl->curvalue = qtrue;
ADDRLP4 12
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 499
;499:			break;
ADDRGP4 $321
JUMPV
LABELV $323
line 502
;500:
;501:		case ALLGROUPS_HIDDEN:
;502:			ctrl->curvalue = qfalse;
ADDRLP4 12
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 503
;503:			break;
ADDRGP4 $321
JUMPV
LABELV $324
line 506
;504:
;505:		case ALLGROUPS_CUSTOM:
;506:			ctrl->curvalue = s_itemcontrols.enabled[ item->ident ];
ADDRLP4 12
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6312
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 507
;507:			break;
LABELV $320
LABELV $321
line 509
;508:		}
;509:	}
LABELV $314
line 490
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $316
ADDRLP4 0
INDIRI4
ADDRGP4 s_itemcontrols+6300
INDIRI4
LTI4 $313
line 512
;510:
;511:	// enable fight button if possible
;512:	if (!s_itemcontrols.ingame_menu)
ADDRGP4 s_itemcontrols+6292
INDIRI4
CNSTI4 0
NEI4 $326
line 513
;513:		StartServer_CheckFightReady(&s_itemcontrols.common);
ADDRGP4 s_itemcontrols+1076
ARGP4
ADDRGP4 StartServer_CheckFightReady
CALLI4
pop
LABELV $326
line 514
;514:}
LABELV $286
endproc StartServer_BothItemMenus_UpdateInterface 36 12
proc StartServer_BothItemMenus_DrawItemButton 68 20
line 525
;515:
;516:
;517:
;518:
;519:/*
;520:=================
;521:StartServer_BothItemMenus_DrawItemButton
;522:=================
;523:*/
;524:static void StartServer_BothItemMenus_DrawItemButton( void* ptr )
;525:{
line 536
;526:	int	x;
;527:	int y;
;528:	float *color;
;529:	int	style;
;530:	qboolean focus;
;531:	menuradiobutton_s *rb;
;532:	char* iconname;
;533:	qhandle_t	icon;
;534:	vec4_t gcolor;
;535:
;536:	rb = (menuradiobutton_s*)ptr;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 537
;537:	x = rb->generic.x;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 538
;538:	y = rb->generic.y;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 540
;539:
;540:	gcolor[0] = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 541
;541:	gcolor[1] = 1.0;
ADDRLP4 4+4
CNSTF4 1065353216
ASGNF4
line 542
;542:	gcolor[2] = 1.0;
ADDRLP4 4+8
CNSTF4 1065353216
ASGNF4
line 543
;543:	gcolor[3] = 1.0;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 546
;544:
;545:	// load the icon
;546:	iconname = bg_itemlist[ s_itemcontrols.itemCtrl[rb->generic.id].bg_index ].icon;
ADDRLP4 36
CNSTI4 56
CNSTI4 104
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+100
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+24
ADDP4
INDIRP4
ASGNP4
line 547
;547:	icon = trap_R_RegisterShaderNoMip(va("uie_%s", iconname));
ADDRGP4 $337
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 52
INDIRI4
ASGNI4
line 548
;548:	if (!icon)
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $338
line 549
;549:		icon = trap_R_RegisterShaderNoMip(iconname);
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 56
INDIRI4
ASGNI4
LABELV $338
line 552
;550:
;551:	// setup text colour states
;552:	focus = (rb->generic.parent->cursor == rb->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $341
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRGP4 $342
JUMPV
LABELV $341
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $342
ADDRLP4 44
ADDRLP4 60
INDIRI4
ASGNI4
line 553
;553:	if ( rb->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $343
line 554
;554:	{
line 555
;555:		gcolor[3] = 0.3;
ADDRLP4 4+12
CNSTF4 1050253722
ASGNF4
line 556
;556:		color = text_color_disabled;
ADDRLP4 32
ADDRGP4 text_color_disabled
ASGNP4
line 557
;557:		style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 40
CNSTI4 16
ASGNI4
line 558
;558:	}
ADDRGP4 $344
JUMPV
LABELV $343
line 559
;559:	else if ( focus )
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $346
line 560
;560:	{
line 561
;561:		color = text_color_highlight;
ADDRLP4 32
ADDRGP4 text_color_highlight
ASGNP4
line 562
;562:		style = UI_LEFT|UI_PULSE|UI_SMALLFONT;
ADDRLP4 40
CNSTI4 16400
ASGNI4
line 563
;563:	}
ADDRGP4 $347
JUMPV
LABELV $346
line 565
;564:	else
;565:	{
line 566
;566:		color = text_color_normal;
ADDRLP4 32
ADDRGP4 text_color_normal
ASGNP4
line 567
;567:		style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 40
CNSTI4 16
ASGNI4
line 568
;568:	}
LABELV $347
LABELV $344
line 571
;569:
;570:	// draw it!
;571:	if ( rb->generic.name )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $348
line 572
;572:		UI_DrawString( x - SMALLCHAR_WIDTH, y, rb->generic.name, UI_RIGHT|UI_SMALLFONT, color );
ADDRLP4 20
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 18
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $348
line 574
;573:
;574:	if ( !rb->curvalue )
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
NEI4 $351
line 575
;575:	{
line 576
;576:		gcolor[3] = 0.3;
ADDRLP4 4+12
CNSTF4 1050253722
ASGNF4
line 577
;577:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $354
line 578
;578:		UI_DrawString( x + 16, y, "off", style, color );
ADDRLP4 20
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $357
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 579
;579:		}
LABELV $354
line 580
;580:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $352
line 581
;581:		UI_DrawString( x + 16, y, "откл", style, color );
ADDRLP4 20
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $361
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 582
;582:		}
line 583
;583:	}
ADDRGP4 $352
JUMPV
LABELV $351
line 585
;584:	else
;585:	{
line 586
;586:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $362
line 587
;587:		UI_DrawString( x + 16, y, "on", style, color );
ADDRLP4 20
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $365
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 588
;588:		}
LABELV $362
line 589
;589:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $366
line 590
;590:		UI_DrawString( x + 16, y, "вкл", style, color );
ADDRLP4 20
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $369
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 591
;591:		}
LABELV $366
line 592
;592:	}
LABELV $352
line 594
;593:
;594:	trap_R_SetColor(gcolor);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 596
;595:	// square image, always
;596:	UI_DrawHandlePic( x - 5, y, SMALLCHAR_HEIGHT, SMALLCHAR_HEIGHT, icon);
ADDRLP4 20
INDIRI4
CNSTI4 5
SUBI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 597
;597:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 598
;598:}
LABELV $330
endproc StartServer_BothItemMenus_DrawItemButton 68 20
proc StartServer_BothItemMenus_ItemEvent 40 8
line 613
;599:
;600:
;601:
;602:
;603:
;604:/*
;605:=================
;606:StartServer_BothItemMenus_ItemEvent
;607:
;608:Changing a single item may force the group
;609:setting to change as well. We must keep these values in sync
;610:=================
;611:*/
;612:static void StartServer_BothItemMenus_ItemEvent( void* ptr, int event )
;613:{
line 620
;614:	menuradiobutton_s* rb;
;615:	iteminfo_t* item;
;616:	int i, type, page;
;617:	qboolean enabled;
;618:	mastercontrol_t* master;
;619:
;620:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $373
line 621
;621:		return;
ADDRGP4 $372
JUMPV
LABELV $373
line 624
;622:
;623:	// store the value of the control in server_itemlist[]
;624:	rb = (menuradiobutton_s*)ptr;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
line 625
;625:	item = s_itemcontrols.itemCtrl[ rb->generic.id ].item;
ADDRLP4 16
CNSTI4 104
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+96
ADDP4
INDIRP4
ASGNP4
line 627
;626:
;627:	if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $377
line 628
;628:		page = s_itemcontrols.currentPage;
ADDRLP4 20
ADDRGP4 s_itemcontrols+6296
INDIRI4
ASGNI4
line 629
;629:		type = s_itemcontrols.grouptype[page];
ADDRLP4 24
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6316
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 630
;630:		master = &masterControl[page];
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl
ADDP4
ASGNP4
line 631
;631:		if (type == ALLGROUPS_ENABLED || type == ALLGROUPS_HIDDEN) {
ADDRLP4 28
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $383
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $381
LABELV $383
line 634
;632:			// we're changing an item on a page where all controls are set/unset
;633:			// so we must override the stored custom settings
;634:			enabled = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 635
;635:			if (type == ALLGROUPS_ENABLED)
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $384
line 636
;636:				enabled = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $384
line 638
;637:
;638:			for (i = 0; i < master->item_count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $389
JUMPV
LABELV $386
line 639
;639:				s_itemcontrols.enabled[ master->items[i].ident ] = enabled;
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6312
INDIRP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 640
;640:			}
LABELV $387
line 638
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $389
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
LTI4 $386
line 641
;641:		}
LABELV $381
line 644
;642:
;643:		// set the item flag and recover the new grouptype
;644:		s_itemcontrols.enabled[ item->ident ] = rb->curvalue;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6312
INDIRP4
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ASGNI4
line 645
;645:		s_itemcontrols.grouptype[page] = StartServer_BothItemMenus_FindGroupType(master->items, master->item_count);
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 StartServer_BothItemMenus_FindGroupType
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6316
INDIRP4
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 647
;646:
;647:		StartServer_BothItemMenus_UpdateInterface();
ADDRGP4 StartServer_BothItemMenus_UpdateInterface
CALLV
pop
line 648
;648:	}
LABELV $377
line 649
;649:}
LABELV $372
endproc StartServer_BothItemMenus_ItemEvent 40 8
proc StartServer_BothItemMenus_InitTabbedControls 44 4
line 660
;650:
;651:
;652:
;653:
;654:/*
;655:=================
;656:StartServer_BothItemMenus_InitTabbedControls
;657:=================
;658:*/
;659:static void StartServer_BothItemMenus_InitTabbedControls(int page)
;660:{
line 668
;661:	int y;
;662:	int ident;
;663:	iteminfo_t* items;
;664:	itemnode_t* node;
;665:	int i;
;666:
;667:	// set all controls to invisible
;668:	for (i = 0; i < MAX_ITEM_ONPAGE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $394
line 669
;669:		s_itemcontrols.itemCtrl[i].control.generic.type = MTYPE_RADIOBUTTON;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512
ADDP4
CNSTI4 5
ASGNI4
line 670
;670:		s_itemcontrols.itemCtrl[i].control.generic.flags = QMF_HIDDEN|QMF_INACTIVE;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+72
ADDP4
CNSTU4 20480
ASGNU4
line 671
;671:	}
LABELV $395
line 668
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $394
line 673
;672:
;673:	if (page < 0 || page >= ITEMGROUP_COUNT)
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $403
ADDRLP4 20
INDIRI4
CNSTI4 6
LTI4 $401
LABELV $403
line 674
;674:		return;
ADDRGP4 $393
JUMPV
LABELV $401
line 677
;675:
;676:	// set control count
;677:	s_itemcontrols.currentPage = page;
ADDRGP4 s_itemcontrols+6296
ADDRFP4 0
INDIRI4
ASGNI4
line 678
;678:	s_itemcontrols.numPageItems = masterControl[page].item_count;
ADDRGP4 s_itemcontrols+6300
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+28
ADDP4
INDIRI4
ASGNI4
line 679
;679:	if (s_itemcontrols.numPageItems > MAX_ITEM_ONPAGE)
ADDRGP4 s_itemcontrols+6300
INDIRI4
CNSTI4 16
LEI4 $407
line 680
;680:		s_itemcontrols.numPageItems = MAX_ITEM_ONPAGE;
ADDRGP4 s_itemcontrols+6300
CNSTI4 16
ASGNI4
LABELV $407
line 683
;681:
;682:	// setup controls
;683:	items = masterControl[page].items;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+24
ADDP4
INDIRP4
ASGNP4
line 684
;684:	if (!items)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $412
line 685
;685:		return;
ADDRGP4 $393
JUMPV
LABELV $412
line 687
;686:
;687:	y = s_itemcontrols.mid_tabbed_y - (s_itemcontrols.numPageItems * LINE_HEIGHT)/2;
ADDRLP4 24
CNSTI4 2
ASGNI4
ADDRLP4 12
ADDRGP4 s_itemcontrols+6308
INDIRI4
ADDRGP4 s_itemcontrols+6300
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
MULI4
ADDRLP4 24
INDIRI4
DIVI4
SUBI4
ASGNI4
line 688
;688:	for (i = 0; i < s_itemcontrols.numPageItems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $420
JUMPV
LABELV $417
line 689
;689:	{
line 690
;690:		ident = items[i].ident;
ADDRLP4 8
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 691
;691:		node = &server_itemlist[ ident ];
ADDRLP4 16
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 server_itemlist
ADDP4
ASGNP4
line 693
;692:
;693:		s_itemcontrols.itemCtrl[i].control.generic.type	= MTYPE_RADIOBUTTON;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512
ADDP4
CNSTI4 5
ASGNI4
line 694
;694:		s_itemcontrols.itemCtrl[i].control.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+72
ADDP4
CNSTU4 33026
ASGNU4
line 695
;695:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $425
line 696
;696:		s_itemcontrols.itemCtrl[i].control.generic.name 	= items[i].name;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+4
ADDP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 697
;697:		}
LABELV $425
line 698
;698:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $430
line 699
;699:		s_itemcontrols.itemCtrl[i].control.generic.name 	= items[i].runame;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+4
ADDP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
line 700
;700:		}
LABELV $430
line 701
;701:		s_itemcontrols.itemCtrl[i].control.generic.callback	= StartServer_BothItemMenus_ItemEvent;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+76
ADDP4
ADDRGP4 StartServer_BothItemMenus_ItemEvent
ASGNP4
line 702
;702:		s_itemcontrols.itemCtrl[i].control.generic.ownerdraw = StartServer_BothItemMenus_DrawItemButton;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+84
ADDP4
ADDRGP4 StartServer_BothItemMenus_DrawItemButton
ASGNP4
line 703
;703:		s_itemcontrols.itemCtrl[i].control.generic.id		= i;	// self index
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 704
;704:		s_itemcontrols.itemCtrl[i].control.generic.x		= ITEMCONTROL_X;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+28
ADDP4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 320
ADDI4
ASGNI4
line 705
;705:		s_itemcontrols.itemCtrl[i].control.generic.y		= y;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+32
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 707
;706:
;707:		s_itemcontrols.itemCtrl[i].item = &items[i];
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+96
ADDP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
line 708
;708:		s_itemcontrols.itemCtrl[i].bg_index = StartServer_GetItemFromMapObject(server_itemlist[ident].mapitem);
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 server_itemlist+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 StartServer_GetItemFromMapObject
CALLI4
ASGNI4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512+100
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 710
;709:
;710:		items[i].control = &s_itemcontrols.itemCtrl[i].control;
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512
ADDP4
ASGNP4
line 712
;711:
;712:		RadioButton_Init(&s_itemcontrols.itemCtrl[i].control);
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512
ADDP4
ARGP4
ADDRGP4 RadioButton_Init
CALLV
pop
line 714
;713:
;714:		y += LINE_HEIGHT;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 715
;715:	}
LABELV $418
line 688
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $420
ADDRLP4 0
INDIRI4
ADDRGP4 s_itemcontrols+6300
INDIRI4
LTI4 $417
line 716
;716:}
LABELV $393
endproc StartServer_BothItemMenus_InitTabbedControls 44 4
proc StartServer_BothItemMenus_SetTabbedControlsPage 0 4
line 728
;717:
;718:
;719:/*
;720:=================
;721:StartServer_BothItemMenus_SetTabbedControlsPage
;722:
;723:Prepare the new page of controls - setup their screen position
;724:and then set their current values
;725:=================
;726:*/
;727:static void StartServer_BothItemMenus_SetTabbedControlsPage(int page)
;728:{
line 729
;729:	StartServer_BothItemMenus_InitTabbedControls(page);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 StartServer_BothItemMenus_InitTabbedControls
CALLV
pop
line 730
;730:	StartServer_BothItemMenus_SetTabbedCtrlValues();
ADDRGP4 StartServer_BothItemMenus_SetTabbedCtrlValues
CALLV
pop
line 731
;731:}
LABELV $454
endproc StartServer_BothItemMenus_SetTabbedControlsPage 0 4
proc StartServer_BothItemMenus_GroupEvent 8 4
line 743
;732:
;733:
;734:
;735:/*
;736:=================
;737:StartServer_BothItemMenus_GroupEvent
;738:
;739:Syncs array with data control value
;740:=================
;741:*/
;742:static void StartServer_BothItemMenus_GroupEvent( void* ptr, int event )
;743:{
line 746
;744:	menulist_s* l;
;745:
;746:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $456
line 747
;747:		return;
ADDRGP4 $455
JUMPV
LABELV $456
line 750
;748:
;749:	// store the value of the control
;750:	l = (menulist_s*)ptr;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 751
;751:	s_itemcontrols.grouptype[l->generic.id] = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6316
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 753
;752:
;753:	if (l->generic.id != s_itemcontrols.currentPage)
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRGP4 s_itemcontrols+6296
INDIRI4
EQI4 $459
line 754
;754:		StartServer_BothItemMenus_SetTabbedControlsPage(l->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 StartServer_BothItemMenus_SetTabbedControlsPage
CALLV
pop
LABELV $459
line 757
;755:
;756://	Com_Printf(va("Control selected: %i, %i\n", l->generic.id, item->ident));
;757:	StartServer_BothItemMenus_UpdateInterface();
ADDRGP4 StartServer_BothItemMenus_UpdateInterface
CALLV
pop
line 758
;758:}
LABELV $455
endproc StartServer_BothItemMenus_GroupEvent 8 4
proc StartServer_BothItemMenus_Event 8 4
line 769
;759:
;760:
;761:
;762:
;763:/*
;764:=================
;765:StartServer_BothItemMenus_Event
;766:=================
;767:*/
;768:static void StartServer_BothItemMenus_Event( void* ptr, int event )
;769:{
line 770
;770:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $463
line 771
;771:		return;
ADDRGP4 $462
JUMPV
LABELV $463
line 773
;772:
;773:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 402
EQI4 $468
ADDRLP4 0
INDIRI4
CNSTI4 403
EQI4 $469
ADDRGP4 $465
JUMPV
LABELV $468
line 775
;774:	case ID_ITEM_RESET:
;775:		StartServer_BothItemMenus_ResetAll(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 StartServer_BothItemMenus_ResetAll
CALLV
pop
line 776
;776:		StartServer_BothItemMenus_UpdateInterface();
ADDRGP4 StartServer_BothItemMenus_UpdateInterface
CALLV
pop
line 777
;777:		break;
ADDRGP4 $466
JUMPV
LABELV $469
line 780
;778:
;779:	case ID_ITEM_CLEAR:
;780:		StartServer_BothItemMenus_ResetAll(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 StartServer_BothItemMenus_ResetAll
CALLV
pop
line 781
;781:		StartServer_BothItemMenus_UpdateInterface();
ADDRGP4 StartServer_BothItemMenus_UpdateInterface
CALLV
pop
line 782
;782:		break;
LABELV $465
LABELV $466
line 784
;783:	}
;784:}
LABELV $462
endproc StartServer_BothItemMenus_Event 8 4
proc StartServer_BothItemMenus_TabbedEvent 4 4
line 796
;785:
;786:
;787:
;788:
;789:
;790:/*
;791:=================
;792:StartServer_BothItemMenus_TabbedEvent
;793:=================
;794:*/
;795:static void StartServer_BothItemMenus_TabbedEvent( void* ptr, int event )
;796:{
line 799
;797:	menutext_s* m;
;798:
;799:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $471
line 800
;800:		return;
ADDRGP4 $470
JUMPV
LABELV $471
line 802
;801:
;802:	m = (menutext_s*)ptr;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 804
;803:
;804:	StartServer_BothItemMenus_SetTabbedControlsPage(m->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 StartServer_BothItemMenus_SetTabbedControlsPage
CALLV
pop
line 805
;805:	StartServer_BothItemMenus_UpdateInterface();
ADDRGP4 StartServer_BothItemMenus_UpdateInterface
CALLV
pop
line 806
;806:}
LABELV $470
endproc StartServer_BothItemMenus_TabbedEvent 4 4
proc StartServer_BothItemMenus_SetupItemControls 36 8
line 819
;807:
;808:
;809:
;810:
;811:
;812:
;813:/*
;814:=================
;815:StartServer_BothItemMenus_SetupItemControls
;816:=================
;817:*/
;818:static void StartServer_BothItemMenus_SetupItemControls(int y)
;819:{
line 829
;820:	int i;
;821:	int max;
;822:	int y_base;
;823:	float scale;
;824:	int style;
;825:
;826:	//
;827:	// count size of longest list of items
;828:	//
;829:	max = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 830
;830:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $474
line 831
;831:	{
line 832
;832:		if (masterControl[i].item_count > max)
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+28
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $478
line 833
;833:			max = masterControl[i].item_count;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+28
ADDP4
INDIRI4
ASGNI4
LABELV $478
line 834
;834:	}
LABELV $475
line 830
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $474
line 836
;835:
;836:	if (max > MAX_ITEM_ONPAGE) {
ADDRLP4 4
INDIRI4
CNSTI4 16
LEI4 $482
line 837
;837:		Com_Printf("ItemPage: Too many items on a tabbed page (%i)\n", max);
ADDRGP4 $484
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 838
;838:	}
LABELV $482
line 844
;839:
;840:
;841:	//
;842:	// setup tabbed selection controls
;843:	//
;844:	style = UI_RIGHT|UI_MEDIUMFONT;
ADDRLP4 16
CNSTI4 130
ASGNI4
line 845
;845:	scale = UI_ProportionalSizeScale(style, 0);
ADDRLP4 16
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 20
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 20
INDIRF4
ASGNF4
line 847
;846:
;847:	y_base = TABCONTROLCENTER_Y;	// approx middle of free area
ADDRLP4 8
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 240
ADDI4
CNSTI4 20
ADDI4
ASGNI4
line 848
;848:	if (s_itemcontrols.ingame_menu)
ADDRGP4 s_itemcontrols+6292
INDIRI4
CNSTI4 0
EQI4 $486
line 849
;849:		y_base -= PROP_HEIGHT*scale;	// fudged
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
LABELV $486
line 850
;850:	s_itemcontrols.mid_tabbed_y = y_base;
ADDRGP4 s_itemcontrols+6308
ADDRLP4 8
INDIRI4
ASGNI4
line 851
;851:	y_base -= (ITEMGROUP_COUNT * PROP_HEIGHT * scale)/2;	// offset for symmetry
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTI4 6
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
SUBF4
CVFI4 4
ASGNI4
line 853
;852:
;853:	for (i = 0; i < ITEMGROUP_COUNT; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $492
line 854
;854:		s_itemcontrols.tabbedText[i].generic.type     = MTYPE_PTEXT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888
ADDP4
CNSTI4 9
ASGNI4
line 855
;855:		s_itemcontrols.tabbedText[i].generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+72
ADDP4
CNSTU4 272
ASGNU4
line 856
;856:		s_itemcontrols.tabbedText[i].generic.id	     = i;	// array index
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 857
;857:		s_itemcontrols.tabbedText[i].generic.callback = StartServer_BothItemMenus_TabbedEvent;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+76
ADDP4
ADDRGP4 StartServer_BothItemMenus_TabbedEvent
ASGNP4
line 858
;858:		s_itemcontrols.tabbedText[i].generic.x	     = 140 - uis.wideoffset/2;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+28
ADDP4
CNSTI4 140
ADDRGP4 uis+11476
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 859
;859:		s_itemcontrols.tabbedText[i].generic.y	     = y_base + i*PROP_HEIGHT * scale;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+32
ADDP4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 860
;860:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $509
line 861
;861:		s_itemcontrols.tabbedText[i].string			= masterControl[i].tabbedTitle;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+88
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+8
ADDP4
INDIRP4
ASGNP4
line 862
;862:		}
LABELV $509
line 863
;863:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $515
line 864
;864:		s_itemcontrols.tabbedText[i].string			= masterControl[i].tabbedTitleru;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+88
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+16
ADDP4
INDIRP4
ASGNP4
line 865
;865:		}
LABELV $515
line 866
;866:		s_itemcontrols.tabbedText[i].style			= style;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 867
;867:		s_itemcontrols.tabbedText[i].color			= color_red;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888+100
ADDP4
ADDRGP4 color_red
ASGNP4
line 868
;868:	}
LABELV $493
line 853
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $492
line 871
;869:
;870:	// setup controls for the current tab
;871:	StartServer_BothItemMenus_InitTabbedControls(0);
CNSTI4 0
ARGI4
ADDRGP4 StartServer_BothItemMenus_InitTabbedControls
CALLV
pop
line 872
;872:}
LABELV $473
endproc StartServer_BothItemMenus_SetupItemControls 36 8
proc StartServer_BothItemMenus_AddMasterControls 24 0
line 882
;873:
;874:
;875:
;876:/*
;877:=================
;878:StartServer_BothItemMenus_AddMasterControls
;879:=================
;880:*/
;881:static void StartServer_BothItemMenus_AddMasterControls(int y)
;882:{
line 886
;883:	int x, dy;
;884:	int i;
;885:
;886:	for (i = 0 ; i < ITEMGROUP_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $526
line 887
;887:	{
line 888
;888:		x = GAMETYPECOLUMN_X + ((i / 2) - 1) * SMALLCHAR_WIDTH * 22;
ADDRLP4 4
CNSTI4 22
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 1
SUBI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
MULI4
CNSTI4 400
ADDI4
ASGNI4
line 889
;889:		dy = (i % 2) * LINE_HEIGHT;
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
MULI4
ASGNI4
line 891
;890:
;891:		s_itemcontrols.groupMaster[i].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096
ADDP4
CNSTI4 3
ASGNI4
line 892
;892:		s_itemcontrols.groupMaster[i].generic.id		= i;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 893
;893:		s_itemcontrols.groupMaster[i].generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096+72
ADDP4
CNSTU4 258
ASGNU4
line 894
;894:		s_itemcontrols.groupMaster[i].generic.callback	= StartServer_BothItemMenus_GroupEvent;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096+76
ADDP4
ADDRGP4 StartServer_BothItemMenus_GroupEvent
ASGNP4
line 895
;895:		s_itemcontrols.groupMaster[i].generic.x		= x;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096+28
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 896
;896:		s_itemcontrols.groupMaster[i].generic.y		= y + dy +30;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096+32
ADDP4
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 30
ADDI4
ASGNI4
line 897
;897:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $543
line 898
;898:		s_itemcontrols.groupMaster[i].generic.name		= masterControl[i].masterTitle;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+4
ADDP4
INDIRP4
ASGNP4
line 899
;899:		s_itemcontrols.groupMaster[i].itemnames		= allgroups_items;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096+104
ADDP4
ADDRGP4 allgroups_items
ASGNP4
line 900
;900:		}
LABELV $543
line 901
;901:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $551
line 902
;902:		s_itemcontrols.groupMaster[i].generic.name		= masterControl[i].masterTitleru;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+12
ADDP4
INDIRP4
ASGNP4
line 903
;903:		s_itemcontrols.groupMaster[i].itemnames		= allgroups_itemsru;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096+104
ADDP4
ADDRGP4 allgroups_itemsru
ASGNP4
line 904
;904:		}
LABELV $551
line 906
;905:
;906:		masterControl[i].control = &s_itemcontrols.groupMaster[i];
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+20
ADDP4
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096
ADDP4
ASGNP4
line 907
;907:	}
LABELV $527
line 886
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $526
line 908
;908:}
LABELV $525
endproc StartServer_BothItemMenus_AddMasterControls 24 0
proc StartServer_InGame_Init 36 12
line 928
;909:
;910:
;911:
;912:
;913://------------------------------------------------------------------
;914:
;915:// Functions used only by the ingame menu page
;916:
;917://------------------------------------------------------------------
;918:
;919:
;920:
;921:
;922:/*
;923:=================
;924:StartServer_InGame_Init
;925:=================
;926:*/
;927:static void StartServer_InGame_Init( void )
;928:{
line 934
;929:	int 		i, j;
;930:	qboolean 	disabled;
;931:	qboolean 	init;
;932:	int 		type, t;
;933:
;934:	s_itemcontrols.enabled = ingame_enabled;
ADDRGP4 s_itemcontrols+6312
ADDRGP4 ingame_enabled
ASGNP4
line 935
;935:	s_itemcontrols.grouptype = ingame_grouptype;
ADDRGP4 s_itemcontrols+6316
ADDRGP4 ingame_grouptype
ASGNP4
line 938
;936:
;937:	// get the cvars currently set
;938:	for (i = 0; i < ITEM_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $564
line 939
;939:	{
line 940
;940:		disabled = (int)Com_Clamp(0, 1, trap_Cvar_VariableValue(va("disable_%s", server_itemlist[i].mapitem)));
ADDRGP4 $568
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 server_itemlist+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 941
;941:		if (disabled)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $570
line 942
;942:			s_itemcontrols.enabled[i] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6312
INDIRP4
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $571
JUMPV
LABELV $570
line 944
;943:		else
;944:			s_itemcontrols.enabled[i] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6312
INDIRP4
ADDP4
CNSTI4 1
ASGNI4
LABELV $571
line 945
;945:	}
LABELV $565
line 938
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $564
line 950
;946:
;947:	// all groups are custom by default, just in case a group
;948:	// doesn't have a master control (we want the control visible and editable)
;949:	// we then scan through the items to see how the master should be setup
;950:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $574
line 951
;951:	{
line 952
;952:		s_itemcontrols.grouptype[i] = ALLGROUPS_CUSTOM;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6316
INDIRP4
ADDP4
CNSTI4 1
ASGNI4
line 953
;953:	}
LABELV $575
line 950
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $574
line 955
;954:
;955:	StartServer_BothItemMenus_InitControls();
ADDRGP4 StartServer_BothItemMenus_InitControls
CALLV
pop
line 956
;956:}
LABELV $561
endproc StartServer_InGame_Init 36 12
proc StartServer_InGame_SaveChanges 28 8
line 966
;957:
;958:
;959:
;960:/*
;961:=================
;962:StartServer_InGame_SaveChanges
;963:=================
;964:*/
;965:static void StartServer_InGame_SaveChanges( void )
;966:{
line 973
;967:	int 		i, j;
;968:	int 		type;
;969:	int			ident;
;970:	qboolean	disable;
;971:
;972:	// write out the disabled items list
;973:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $580
line 974
;974:	{
line 975
;975:		disable = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 976
;976:		type = s_itemcontrols.grouptype[ masterControl[i].ident ];
ADDRLP4 16
ADDRLP4 8
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6316
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 977
;977:		if (type == ALLGROUPS_HIDDEN)
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $585
line 978
;978:			disable = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $585
line 979
;979:		for (j = 0; j < masterControl[i].item_count; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $590
JUMPV
LABELV $587
line 980
;980:		{
line 981
;981:			ident = masterControl[i].items[j].ident;
ADDRLP4 4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 8
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+24
ADDP4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 982
;982:			if (type == ALLGROUPS_CUSTOM)
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $593
line 983
;983:			{
line 984
;984:				disable = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 985
;985:				if (s_itemcontrols.enabled[ ident ])
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols+6312
INDIRP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $595
line 986
;986:					disable = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $595
line 987
;987:			}
LABELV $593
line 988
;988:			trap_Cvar_Set(va("disable_%s", server_itemlist[ident].mapitem), va("%i",disable));
ADDRGP4 $568
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 server_itemlist+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $599
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 989
;989:		}
LABELV $588
line 979
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $590
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 masterControl+28
ADDP4
INDIRI4
LTI4 $587
line 990
;990:	}
LABELV $581
line 973
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 6
LTI4 $580
line 991
;991:}
LABELV $579
endproc StartServer_InGame_SaveChanges 28 8
proc StartServer_InGame_Event 8 0
line 1001
;992:
;993:
;994:
;995:/*
;996:=================
;997:StartServer_InGame_Event
;998:=================
;999:*/
;1000:static void StartServer_InGame_Event( void* ptr, int event )
;1001:{
line 1002
;1002:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $601
line 1003
;1003:		return;
ADDRGP4 $600
JUMPV
LABELV $601
line 1005
;1004:
;1005:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 430
EQI4 $606
ADDRLP4 0
INDIRI4
CNSTI4 431
EQI4 $607
ADDRGP4 $603
JUMPV
line 1006
;1006:	{
LABELV $606
line 1008
;1007:	case ID_ITEMINGAME_CANCEL:
;1008:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1009
;1009:		break;
ADDRGP4 $604
JUMPV
LABELV $607
line 1012
;1010:
;1011:	case ID_ITEMINGAME_ACCEPT:
;1012:		StartServer_InGame_SaveChanges();
ADDRGP4 StartServer_InGame_SaveChanges
CALLV
pop
line 1013
;1013:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1014
;1014:		break;
LABELV $603
LABELV $604
line 1016
;1015:	}
;1016:}
LABELV $600
endproc StartServer_InGame_Event 8 0
proc StartServer_ItemPage_Save 0 0
line 1034
;1017:
;1018:
;1019://------------------------------------------------------------------
;1020:
;1021:// Functions used only by the skirmish menu page
;1022:
;1023://------------------------------------------------------------------
;1024:
;1025:
;1026:
;1027:
;1028:/*
;1029:=================
;1030:StartServer_ItemPage_Save
;1031:=================
;1032:*/
;1033:static void StartServer_ItemPage_Save( void )
;1034:{
line 1035
;1035:	StartServer_SaveScriptData();
ADDRGP4 StartServer_SaveScriptData
CALLV
pop
line 1036
;1036:}
LABELV $608
endproc StartServer_ItemPage_Save 0 0
proc StartServer_ItemPage_Load 0 0
line 1045
;1037:
;1038:
;1039:/*
;1040:=================
;1041:StartServer_ItemPage_Load
;1042:=================
;1043:*/
;1044:static void StartServer_ItemPage_Load( void )
;1045:{
line 1046
;1046:	s_itemcontrols.enabled = s_scriptdata.item.enabled;
ADDRGP4 s_itemcontrols+6312
ADDRGP4 s_scriptdata+3452+24
ASGNP4
line 1047
;1047:	s_itemcontrols.grouptype = s_scriptdata.item.groupstate;
ADDRGP4 s_itemcontrols+6316
ADDRGP4 s_scriptdata+3452
ASGNP4
line 1049
;1048:
;1049:	s_itemcontrols.gameType.curvalue = s_scriptdata.gametype;
ADDRGP4 s_itemcontrols+2848+92
ADDRGP4 s_scriptdata
INDIRI4
ASGNI4
line 1051
;1050:
;1051:	StartServer_BothItemMenus_InitControls();
ADDRGP4 StartServer_BothItemMenus_InitControls
CALLV
pop
line 1052
;1052:}
LABELV $609
endproc StartServer_ItemPage_Load 0 0
proc StartServer_ItemPage_CommonEvent 8 4
line 1062
;1053:
;1054:
;1055:
;1056:/*
;1057:=================
;1058:StartServer_ItemPage_CommonEvent
;1059:=================
;1060:*/
;1061:static void StartServer_ItemPage_CommonEvent( void* ptr, int event )
;1062:{
line 1063
;1063:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $618
line 1064
;1064:		return;
ADDRGP4 $617
JUMPV
LABELV $618
line 1067
;1065:	}
;1066:
;1067:	StartServer_ItemPage_Save();
ADDRGP4 StartServer_ItemPage_Save
CALLV
pop
line 1068
;1068:	switch( ((menucommon_s*)ptr)->id )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $620
ADDRLP4 0
INDIRI4
CNSTI4 16
GTI4 $620
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $629-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $629
address $627
address $628
address $623
address $620
address $625
address $626
address $624
code
line 1069
;1069:	{
LABELV $623
line 1071
;1070:		case ID_SERVERCOMMON_SERVER:
;1071:			StartServer_ServerPage_MenuInit();
ADDRGP4 StartServer_ServerPage_MenuInit
CALLV
pop
line 1072
;1072:			break;
ADDRGP4 $621
JUMPV
LABELV $624
line 1075
;1073:			
;1074:		case ID_SERVERCOMMON_WEAPON:
;1075:			StartServer_WeaponPage_MenuInit();
ADDRGP4 StartServer_WeaponPage_MenuInit
CALLI4
pop
line 1076
;1076:			break;
ADDRGP4 $621
JUMPV
LABELV $625
line 1079
;1077:
;1078:		case ID_SERVERCOMMON_BOTS:
;1079:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1080
;1080:			break;
ADDRGP4 $621
JUMPV
LABELV $626
line 1083
;1081:
;1082:		case ID_SERVERCOMMON_MAPS:
;1083:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1084
;1084:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1085
;1085:			break;
ADDRGP4 $621
JUMPV
LABELV $627
line 1088
;1086:
;1087:		case ID_SERVERCOMMON_BACK:
;1088:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1089
;1089:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1090
;1090:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1091
;1091:			break;
ADDRGP4 $621
JUMPV
LABELV $628
line 1094
;1092:
;1093:		case ID_SERVERCOMMON_FIGHT:
;1094:			StartServer_CreateServer(NULL);
CNSTP4 0
ARGP4
ADDRGP4 StartServer_CreateServer
CALLI4
pop
line 1095
;1095:			break;
LABELV $620
LABELV $621
line 1097
;1096:	}
;1097:}
LABELV $617
endproc StartServer_ItemPage_CommonEvent 8 4
proc StartServer_ItemPage_Event 4 4
line 1108
;1098:
;1099:
;1100:
;1101:
;1102:/*
;1103:=================
;1104:StartServer_ItemPage_Event
;1105:=================
;1106:*/
;1107:static void StartServer_ItemPage_Event( void* ptr, int event )
;1108:{
line 1109
;1109:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $632
line 1110
;1110:		return;
ADDRGP4 $631
JUMPV
LABELV $632
line 1112
;1111:
;1112:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 401
EQI4 $637
ADDRGP4 $634
JUMPV
LABELV $637
line 1114
;1113:	case ID_ITEM_GAMETYPE:
;1114:		StartServer_SaveScriptData();
ADDRGP4 StartServer_SaveScriptData
CALLV
pop
line 1116
;1115:
;1116:		StartServer_LoadScriptDataFromType(s_itemcontrols.gameType.curvalue);
ADDRGP4 s_itemcontrols+2848+92
INDIRI4
ARGI4
ADDRGP4 StartServer_LoadScriptDataFromType
CALLV
pop
line 1118
;1117:
;1118:		StartServer_BothItemMenus_InitControls();
ADDRGP4 StartServer_BothItemMenus_InitControls
CALLV
pop
line 1119
;1119:		StartServer_BothItemMenus_UpdateInterface();
ADDRGP4 StartServer_BothItemMenus_UpdateInterface
CALLV
pop
line 1120
;1120:		break;
LABELV $634
LABELV $635
line 1122
;1121:	}
;1122:}
LABELV $631
endproc StartServer_ItemPage_Event 4 4
proc StartServer_BothItemMenus_MenuDraw 8 4
line 1140
;1123:
;1124:
;1125:
;1126:
;1127://-----------------------------------------------------------
;1128:
;1129:// Remaining functions used by both types of item menu
;1130:
;1131://-----------------------------------------------------------
;1132:
;1133:
;1134:/*
;1135:=================
;1136:StartServer_BothItemMenus_MenuDraw
;1137:=================
;1138:*/
;1139:static void StartServer_BothItemMenus_MenuDraw(void)
;1140:{
line 1144
;1141:	int i;
;1142:	int style;
;1143:
;1144:	if (uis.firstdraw) {
ADDRGP4 uis+11496
INDIRI4
CNSTI4 0
EQI4 $641
line 1146
;1145:		// put all the data in place
;1146:		if (s_itemcontrols.ingame_menu) {
ADDRGP4 s_itemcontrols+6292
INDIRI4
CNSTI4 0
EQI4 $644
line 1147
;1147:			StartServer_InGame_Init();
ADDRGP4 StartServer_InGame_Init
CALLV
pop
line 1148
;1148:		}
ADDRGP4 $645
JUMPV
LABELV $644
line 1149
;1149:		else {
line 1150
;1150:			StartServer_ItemPage_Load();
ADDRGP4 StartServer_ItemPage_Load
CALLV
pop
line 1151
;1151:		}
LABELV $645
line 1153
;1152:
;1153:		StartServer_BothItemMenus_UpdateInterface();
ADDRGP4 StartServer_BothItemMenus_UpdateInterface
CALLV
pop
line 1154
;1154:	}
LABELV $641
line 1156
;1155:
;1156:	StartServer_BackgroundDraw(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 StartServer_BackgroundDraw
CALLV
pop
line 1159
;1157:
;1158:	// draw the controls
;1159:	Menu_Draw(&s_itemcontrols.menu);
ADDRGP4 s_itemcontrols
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1160
;1160:}
LABELV $640
endproc StartServer_BothItemMenus_MenuDraw 8 4
proc StartServer_BothItemMenus_MenuKey 12 8
line 1171
;1161:
;1162:
;1163:
;1164:
;1165:/*
;1166:=================
;1167:StartServer_BothItemMenus_MenuKey
;1168:=================
;1169:*/
;1170:static sfxHandle_t StartServer_BothItemMenus_MenuKey( int key )
;1171:{
line 1172
;1172:	switch (key)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 27
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $650
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $648
LABELV $654
ADDRFP4 0
INDIRI4
CNSTI4 179
EQI4 $650
ADDRGP4 $648
JUMPV
line 1173
;1173:	{
LABELV $650
line 1176
;1174:		case K_MOUSE2:
;1175:		case K_ESCAPE:
;1176:			if (!s_itemcontrols.ingame_menu) {
ADDRGP4 s_itemcontrols+6292
INDIRI4
CNSTI4 0
NEI4 $649
line 1177
;1177:				StartServer_ItemPage_Save();
ADDRGP4 StartServer_ItemPage_Save
CALLV
pop
line 1178
;1178:				UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1179
;1179:				UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1180
;1180:			}
line 1181
;1181:			break;
LABELV $648
LABELV $649
line 1184
;1182:	}
;1183:
;1184:	return ( Menu_DefaultKey( &s_itemcontrols.menu, key ) );
ADDRGP4 s_itemcontrols
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $647
endproc StartServer_BothItemMenus_MenuKey 12 8
proc StartServer_BothItemMenus_MenuInit 44 16
line 1198
;1185:}
;1186:
;1187:
;1188:
;1189:
;1190:
;1191:
;1192:/*
;1193:=================
;1194:StartServer_BothItemMenus_MenuInit
;1195:=================
;1196:*/
;1197:static void StartServer_BothItemMenus_MenuInit(qboolean ingame)
;1198:{
line 1205
;1199:	menuframework_s* menuptr;
;1200:	int i;
;1201:	int x, y, dy, left_y, right_y;
;1202:	int count, index;
;1203:	char* text;
;1204:
;1205:	if (uie_olditemmenu.integer != 0) {
ADDRGP4 uie_olditemmenu+12
INDIRI4
CNSTI4 0
EQI4 $656
line 1206
;1206:		StartServer_ItemPage_MenuInit_OldMenu(ingame);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 StartServer_ItemPage_MenuInit_OldMenu
CALLV
pop
line 1207
;1207:		return;
ADDRGP4 $655
JUMPV
LABELV $656
line 1210
;1208:	}
;1209:
;1210:	memset(&s_itemcontrols, 0, sizeof(itemcontrols_t));
ADDRGP4 s_itemcontrols
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6320
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1212
;1211:
;1212:	StartServer_BothItemMenus_Cache();
ADDRGP4 StartServer_BothItemMenus_Cache
CALLV
pop
line 1214
;1213:
;1214:	menuptr = &s_itemcontrols.menu;
ADDRLP4 4
ADDRGP4 s_itemcontrols
ASGNP4
line 1216
;1215:
;1216:	menuptr->key = StartServer_BothItemMenus_MenuKey;
ADDRLP4 4
INDIRP4
CNSTI4 1040
ADDP4
ADDRGP4 StartServer_BothItemMenus_MenuKey
ASGNP4
line 1217
;1217:	menuptr->wrapAround = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1044
ADDP4
CNSTI4 1
ASGNI4
line 1218
;1218:	menuptr->native 	= qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 1056
ADDP4
CNSTI4 0
ASGNI4
line 1219
;1219:	menuptr->fullscreen = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1052
ADDP4
CNSTI4 1
ASGNI4
line 1220
;1220:	menuptr->draw = StartServer_BothItemMenus_MenuDraw;
ADDRLP4 4
INDIRP4
CNSTI4 1036
ADDP4
ADDRGP4 StartServer_BothItemMenus_MenuDraw
ASGNP4
line 1222
;1221:
;1222:	y = GAMETYPEROW_Y;
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRLP4 8
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ADDRLP4 40
INDIRI4
DIVI4
CNSTI4 64
ADDI4
ASGNI4
line 1223
;1223:	s_itemcontrols.ingame_menu = ingame;
ADDRGP4 s_itemcontrols+6292
ADDRFP4 0
INDIRI4
ASGNI4
line 1226
;1224:
;1225:	// menu type specific initialization
;1226:	if (ingame) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $661
line 1227
;1227:		s_itemcontrols.ingame.title.generic.type     = MTYPE_BTEXT;
ADDRGP4 s_itemcontrols+2408
CNSTI4 10
ASGNI4
line 1228
;1228:		s_itemcontrols.ingame.title.generic.x		= 320;
ADDRGP4 s_itemcontrols+2408+28
CNSTI4 320
ASGNI4
line 1229
;1229:		s_itemcontrols.ingame.title.generic.y		= 4;
ADDRGP4 s_itemcontrols+2408+32
CNSTI4 4
ASGNI4
line 1230
;1230:		s_itemcontrols.ingame.title.color			= color_red;
ADDRGP4 s_itemcontrols+2408+100
ADDRGP4 color_red
ASGNP4
line 1231
;1231:		s_itemcontrols.ingame.title.style			= UI_CENTER;
ADDRGP4 s_itemcontrols+2408+92
CNSTI4 1
ASGNI4
line 1233
;1232:
;1233:		s_itemcontrols.ingame.cancel.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_itemcontrols+2408+104
CNSTI4 6
ASGNI4
line 1234
;1234:		s_itemcontrols.ingame.cancel.generic.name     = INGAME_CANCEL0;
ADDRGP4 s_itemcontrols+2408+104+4
ADDRGP4 $235
ASGNP4
line 1235
;1235:		s_itemcontrols.ingame.cancel.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_itemcontrols+2408+104+72
CNSTU4 260
ASGNU4
line 1236
;1236:		s_itemcontrols.ingame.cancel.generic.callback = StartServer_InGame_Event;
ADDRGP4 s_itemcontrols+2408+104+76
ADDRGP4 StartServer_InGame_Event
ASGNP4
line 1237
;1237:		s_itemcontrols.ingame.cancel.generic.id	    = ID_ITEMINGAME_CANCEL;
ADDRGP4 s_itemcontrols+2408+104+24
CNSTI4 430
ASGNI4
line 1238
;1238:		s_itemcontrols.ingame.cancel.generic.x		= 0-uis.wideoffset;
ADDRGP4 s_itemcontrols+2408+104+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1239
;1239:		s_itemcontrols.ingame.cancel.generic.y		= 480-64;
ADDRGP4 s_itemcontrols+2408+104+32
CNSTI4 416
ASGNI4
line 1240
;1240:		s_itemcontrols.ingame.cancel.width  		    = 128;
ADDRGP4 s_itemcontrols+2408+104+104
CNSTI4 128
ASGNI4
line 1241
;1241:		s_itemcontrols.ingame.cancel.height  		    = 64;
ADDRGP4 s_itemcontrols+2408+104+108
CNSTI4 64
ASGNI4
line 1242
;1242:		s_itemcontrols.ingame.cancel.focuspic         = INGAME_CANCEL1;
ADDRGP4 s_itemcontrols+2408+104+88
ADDRGP4 $236
ASGNP4
line 1244
;1243:
;1244:		s_itemcontrols.ingame.accept.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_itemcontrols+2408+220
CNSTI4 6
ASGNI4
line 1245
;1245:		s_itemcontrols.ingame.accept.generic.name     = INGAME_ACCEPT0;
ADDRGP4 s_itemcontrols+2408+220+4
ADDRGP4 $237
ASGNP4
line 1246
;1246:		s_itemcontrols.ingame.accept.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_itemcontrols+2408+220+72
CNSTU4 260
ASGNU4
line 1247
;1247:		s_itemcontrols.ingame.accept.generic.callback = StartServer_InGame_Event;
ADDRGP4 s_itemcontrols+2408+220+76
ADDRGP4 StartServer_InGame_Event
ASGNP4
line 1248
;1248:		s_itemcontrols.ingame.accept.generic.id	    = ID_ITEMINGAME_ACCEPT;
ADDRGP4 s_itemcontrols+2408+220+24
CNSTI4 431
ASGNI4
line 1249
;1249:		s_itemcontrols.ingame.accept.generic.x		= 640 - 128+uis.wideoffset;
ADDRGP4 s_itemcontrols+2408+220+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 512
ADDI4
ASGNI4
line 1250
;1250:		s_itemcontrols.ingame.accept.generic.y		= 480-64;
ADDRGP4 s_itemcontrols+2408+220+32
CNSTI4 416
ASGNI4
line 1251
;1251:		s_itemcontrols.ingame.accept.width  		    = 128;
ADDRGP4 s_itemcontrols+2408+220+104
CNSTI4 128
ASGNI4
line 1252
;1252:		s_itemcontrols.ingame.accept.height  		    = 64;
ADDRGP4 s_itemcontrols+2408+220+108
CNSTI4 64
ASGNI4
line 1253
;1253:		s_itemcontrols.ingame.accept.focuspic         = INGAME_ACCEPT1;
ADDRGP4 s_itemcontrols+2408+220+88
ADDRGP4 $238
ASGNP4
line 1255
;1254:
;1255:		s_itemcontrols.ingame.info.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_itemcontrols+2408+336
CNSTI4 9
ASGNI4
line 1256
;1256:		s_itemcontrols.ingame.info.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_itemcontrols+2408+336+72
CNSTU4 16384
ASGNU4
line 1257
;1257:		s_itemcontrols.ingame.info.generic.x		= 320;
ADDRGP4 s_itemcontrols+2408+336+28
CNSTI4 320
ASGNI4
line 1258
;1258:		s_itemcontrols.ingame.info.generic.y		= 480 - 64 - 36;
ADDRGP4 s_itemcontrols+2408+336+32
CNSTI4 380
ASGNI4
line 1259
;1259:		s_itemcontrols.ingame.info.color			= color_red;
ADDRGP4 s_itemcontrols+2408+336+100
ADDRGP4 color_red
ASGNP4
line 1260
;1260:		s_itemcontrols.ingame.info.style			= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_itemcontrols+2408+336+92
CNSTI4 17
ASGNI4
line 1261
;1261:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $749
line 1262
;1262:		s_itemcontrols.ingame.info.string			= "Requires RESTART or NEXT MAP";
ADDRGP4 s_itemcontrols+2408+336+88
ADDRGP4 $755
ASGNP4
line 1263
;1263:		s_itemcontrols.ingame.title.string			= "DISABLE ITEMS";
ADDRGP4 s_itemcontrols+2408+88
ADDRGP4 $758
ASGNP4
line 1264
;1264:		}
LABELV $749
line 1265
;1265:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $759
line 1266
;1266:		s_itemcontrols.ingame.info.string			= "Требуется РЕСТАРТ или СЛЕД КАРТА";
ADDRGP4 s_itemcontrols+2408+336+88
ADDRGP4 $765
ASGNP4
line 1267
;1267:		s_itemcontrols.ingame.title.string			= "ОТКЛЮЧИТЬ ПРЕДМЕТЫ";
ADDRGP4 s_itemcontrols+2408+88
ADDRGP4 $768
ASGNP4
line 1268
;1268:		}
LABELV $759
line 1270
;1269:
;1270:		Menu_AddItem( menuptr, &s_itemcontrols.ingame.title);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols+2408
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1271
;1271:		Menu_AddItem( menuptr, &s_itemcontrols.ingame.cancel);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols+2408+104
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1272
;1272:		Menu_AddItem( menuptr, &s_itemcontrols.ingame.accept);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols+2408+220
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1273
;1273:		Menu_AddItem( menuptr, &s_itemcontrols.ingame.info);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols+2408+336
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1275
;1274:
;1275:		y -= LINE_HEIGHT;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
SUBI4
ASGNI4
line 1276
;1276:	}
ADDRGP4 $662
JUMPV
LABELV $661
line 1277
;1277:	else {
line 1278
;1278:		StartServer_CommonControls_Init(menuptr, &s_itemcontrols.common, StartServer_ItemPage_CommonEvent, COMMONCTRL_ITEMS);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols+1076
ARGP4
ADDRGP4 StartServer_ItemPage_CommonEvent
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 StartServer_CommonControls_Init
CALLV
pop
line 1280
;1279:
;1280:		s_itemcontrols.gameType.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_itemcontrols+2848
CNSTI4 3
ASGNI4
line 1281
;1281:		s_itemcontrols.gameType.generic.id			= ID_ITEM_GAMETYPE;
ADDRGP4 s_itemcontrols+2848+24
CNSTI4 401
ASGNI4
line 1282
;1282:		s_itemcontrols.gameType.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_itemcontrols+2848+72
CNSTU4 258
ASGNU4
line 1283
;1283:		s_itemcontrols.gameType.generic.callback	= StartServer_ItemPage_Event;
ADDRGP4 s_itemcontrols+2848+76
ADDRGP4 StartServer_ItemPage_Event
ASGNP4
line 1284
;1284:		s_itemcontrols.gameType.generic.x			= GAMETYPECOLUMN_X;
ADDRGP4 s_itemcontrols+2848+28
CNSTI4 400
ASGNI4
line 1285
;1285:		s_itemcontrols.gameType.generic.y			= y;
ADDRGP4 s_itemcontrols+2848+32
ADDRLP4 8
INDIRI4
ASGNI4
line 1286
;1286:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $789
line 1287
;1287:		s_itemcontrols.gameType.generic.name		= "Game Type:";
ADDRGP4 s_itemcontrols+2848+4
ADDRGP4 $794
ASGNP4
line 1288
;1288:		s_itemcontrols.gameType.itemnames			= gametype_items;
ADDRGP4 s_itemcontrols+2848+104
ADDRGP4 gametype_items
ASGNP4
line 1289
;1289:		}
LABELV $789
line 1290
;1290:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $797
line 1291
;1291:		s_itemcontrols.gameType.generic.name		= "Режим Игры:";
ADDRGP4 s_itemcontrols+2848+4
ADDRGP4 $802
ASGNP4
line 1292
;1292:		s_itemcontrols.gameType.itemnames			= gametype_itemsru;
ADDRGP4 s_itemcontrols+2848+104
ADDRGP4 gametype_itemsru
ASGNP4
line 1293
;1293:		}
LABELV $797
line 1295
;1294:
;1295:		s_itemcontrols.gameTypeIcon.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_itemcontrols+2980
CNSTI4 6
ASGNI4
line 1296
;1296:		s_itemcontrols.gameTypeIcon.generic.flags = QMF_INACTIVE;
ADDRGP4 s_itemcontrols+2980+72
CNSTU4 16384
ASGNU4
line 1297
;1297:		s_itemcontrols.gameTypeIcon.generic.x	 = GAMETYPEICON_X;
ADDRGP4 s_itemcontrols+2980+28
CNSTI4 400
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ASGNI4
line 1298
;1298:		s_itemcontrols.gameTypeIcon.generic.y	 = y;
ADDRGP4 s_itemcontrols+2980+32
ADDRLP4 8
INDIRI4
ASGNI4
line 1299
;1299:		s_itemcontrols.gameTypeIcon.width  	     = 32;
ADDRGP4 s_itemcontrols+2980+104
CNSTI4 32
ASGNI4
line 1300
;1300:		s_itemcontrols.gameTypeIcon.height 	     = 32;
ADDRGP4 s_itemcontrols+2980+108
CNSTI4 32
ASGNI4
line 1302
;1301:
;1302:		Menu_AddItem( menuptr, &s_itemcontrols.gameType);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols+2848
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1303
;1303:		Menu_AddItem( menuptr, &s_itemcontrols.gameTypeIcon);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols+2980
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1305
;1304:
;1305:		y += 2*LINE_HEIGHT;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 1306
;1306:	}
LABELV $662
line 1310
;1307:
;1308:
;1309:	// controls common to both pages
;1310:	s_itemcontrols.reset.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_itemcontrols+6176
CNSTI4 6
ASGNI4
line 1311
;1311:	s_itemcontrols.reset.generic.name     = SERVER_ITEM_RESET0;
ADDRGP4 s_itemcontrols+6176+4
ADDRGP4 $239
ASGNP4
line 1312
;1312:	s_itemcontrols.reset.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_itemcontrols+6176+72
CNSTU4 260
ASGNU4
line 1313
;1313:	s_itemcontrols.reset.generic.callback = StartServer_BothItemMenus_Event;
ADDRGP4 s_itemcontrols+6176+76
ADDRGP4 StartServer_BothItemMenus_Event
ASGNP4
line 1314
;1314:	s_itemcontrols.reset.generic.id	    = ID_ITEM_RESET;
ADDRGP4 s_itemcontrols+6176+24
CNSTI4 402
ASGNI4
line 1315
;1315:	s_itemcontrols.reset.generic.x		= 320 - 64;
ADDRGP4 s_itemcontrols+6176+28
CNSTI4 256
ASGNI4
line 1316
;1316:	s_itemcontrols.reset.generic.y		= 480-64;
ADDRGP4 s_itemcontrols+6176+32
CNSTI4 416
ASGNI4
line 1317
;1317:	s_itemcontrols.reset.width  		    = 128;
ADDRGP4 s_itemcontrols+6176+104
CNSTI4 128
ASGNI4
line 1318
;1318:	s_itemcontrols.reset.height  		    = 64;
ADDRGP4 s_itemcontrols+6176+108
CNSTI4 64
ASGNI4
line 1319
;1319:	s_itemcontrols.reset.focuspic         = SERVER_ITEM_RESET1;
ADDRGP4 s_itemcontrols+6176+88
ADDRGP4 $240
ASGNP4
line 1321
;1320:
;1321:	s_itemcontrols.numPageItems = 0;
ADDRGP4 s_itemcontrols+6300
CNSTI4 0
ASGNI4
line 1322
;1322:	s_itemcontrols.currentPage = 0;
ADDRGP4 s_itemcontrols+6296
CNSTI4 0
ASGNI4
line 1324
;1323:
;1324:	StartServer_BothItemMenus_AddMasterControls(y);
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 StartServer_BothItemMenus_AddMasterControls
CALLV
pop
line 1326
;1325:
;1326:	y += 4*LINE_HEIGHT;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 8
ADDI4
ADDI4
ASGNI4
line 1329
;1327:
;1328:	// get all the items set up
;1329:	StartServer_BothItemMenus_SetupItemControls(y);
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 StartServer_BothItemMenus_SetupItemControls
CALLV
pop
line 1332
;1330:
;1331:	// add the controls
;1332:	Menu_AddItem( menuptr, &s_itemcontrols.reset);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols+6176
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1335
;1333:
;1334:	// only setup controls that we've fully initialized
;1335:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $843
line 1336
;1336:		Menu_AddItem( menuptr, &s_itemcontrols.groupMaster[i]);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3096
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $844
line 1335
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $843
line 1338
;1337:
;1338:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $848
line 1339
;1339:		Menu_AddItem( menuptr, &s_itemcontrols.tabbedText[i]);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+3888
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $849
line 1338
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $848
line 1341
;1340:
;1341:	for (i = 0; i < MAX_ITEM_ONPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $853
line 1342
;1342:		Menu_AddItem( menuptr, &s_itemcontrols.itemCtrl[i].control);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols+4512
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $854
line 1341
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $853
line 1344
;1343:
;1344:	UI_PushMenu( &s_itemcontrols.menu );
ADDRGP4 s_itemcontrols
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1345
;1345:}
LABELV $655
endproc StartServer_BothItemMenus_MenuInit 44 16
export StartServer_ItemPage_MenuInit
proc StartServer_ItemPage_MenuInit 0 4
line 1356
;1346:
;1347:
;1348:
;1349:
;1350:/*
;1351:=================
;1352:StartServer_ItemPage_MenuInit
;1353:=================
;1354:*/
;1355:void StartServer_ItemPage_MenuInit(void)
;1356:{
line 1357
;1357:	StartServer_BothItemMenus_MenuInit(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 StartServer_BothItemMenus_MenuInit
CALLV
pop
line 1358
;1358:}
LABELV $858
endproc StartServer_ItemPage_MenuInit 0 4
export UIE_InGame_EnabledItems
proc UIE_InGame_EnabledItems 0 4
line 1369
;1359:
;1360:
;1361:
;1362:
;1363:/*
;1364:=================
;1365:UIE_InGame_EnabledItems
;1366:=================
;1367:*/
;1368:void UIE_InGame_EnabledItems(void)
;1369:{
line 1370
;1370:	StartServer_BothItemMenus_MenuInit(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 StartServer_BothItemMenus_MenuInit
CALLV
pop
line 1371
;1371:}
LABELV $859
endproc UIE_InGame_EnabledItems 0 4
import StartServer_WeaponPage_MenuInit
bss
align 4
LABELV ingame_grouptype
skip 24
align 4
LABELV ingame_enabled
skip 200
align 4
LABELV s_itemcontrols
skip 6320
import StartServer_ItemPage_MenuInit_OldMenu
import StartServer_ServerPage_Cache
import StartServer_ServerPage_Mods
import StartServer_ServerPage_MenuInit
import StartServer_BotPage_Cache
import StartServer_BotPage_MenuInit
import StartServer_MapPage_CopyCustomLimitsToControls
import StartServer_MapPage_Cache
import StartServer_MapPage_MenuInit
import StartServer_SelectionDraw
import StartServer_BackgroundDraw
import StartServer_CommonControls_Init
import StartServer_CheckFightReady
import UI_StartMapMenu
import UI_BotSelect_Index
import fading_red
import pulsecolor
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
LABELV $802
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
LABELV $794
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
LABELV $768
byte 1 208
byte 1 158
byte 1 208
byte 1 162
byte 1 208
byte 1 154
byte 1 208
byte 1 155
byte 1 208
byte 1 174
byte 1 208
byte 1 167
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 32
byte 1 208
byte 1 159
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 148
byte 1 208
byte 1 156
byte 1 208
byte 1 149
byte 1 208
byte 1 162
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $765
byte 1 208
byte 1 162
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 177
byte 1 209
byte 1 131
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 160
byte 1 208
byte 1 149
byte 1 208
byte 1 161
byte 1 208
byte 1 162
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 162
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 155
byte 1 208
byte 1 149
byte 1 208
byte 1 148
byte 1 32
byte 1 208
byte 1 154
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 162
byte 1 208
byte 1 144
byte 1 0
align 1
LABELV $758
byte 1 68
byte 1 73
byte 1 83
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 83
byte 1 0
align 1
LABELV $755
byte 1 82
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 78
byte 1 69
byte 1 88
byte 1 84
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 0
align 1
LABELV $599
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $568
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $484
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 80
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 98
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $369
byte 1 208
byte 1 178
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 0
align 1
LABELV $365
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $361
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 0
align 1
LABELV $357
byte 1 111
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $337
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $240
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
LABELV $239
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
LABELV $238
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $237
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $236
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
LABELV $235
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
LABELV $230
byte 1 98
byte 1 103
byte 1 95
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 44
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $222
byte 1 208
byte 1 161
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 0
align 1
LABELV $221
byte 1 208
byte 1 157
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 0
align 1
LABELV $220
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $219
byte 1 72
byte 1 105
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $218
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $217
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $216
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $215
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $214
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $213
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $212
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 209
byte 1 129
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $211
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 209
byte 1 129
byte 1 58
byte 1 0
align 1
LABELV $210
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $209
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $208
byte 1 208
byte 1 145
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $207
byte 1 208
byte 1 145
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 209
byte 1 143
byte 1 58
byte 1 0
align 1
LABELV $206
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 0
align 1
LABELV $205
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $204
byte 1 208
byte 1 150
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $203
byte 1 208
byte 1 150
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $202
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $201
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 0
align 1
LABELV $200
byte 1 208
byte 1 159
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $199
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $198
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $197
byte 1 208
byte 1 158
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $196
byte 1 208
byte 1 158
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 58
byte 1 0
align 1
LABELV $195
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $194
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $193
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 58
byte 1 0
align 1
LABELV $192
byte 1 80
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $191
byte 1 208
byte 1 158
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $190
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
byte 1 58
byte 1 0
align 1
LABELV $189
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 180
byte 1 208
byte 1 183
byte 1 208
byte 1 181
byte 1 58
byte 1 0
align 1
LABELV $188
byte 1 75
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $187
byte 1 208
byte 1 162
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 58
byte 1 0
align 1
LABELV $186
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
byte 1 58
byte 1 0
align 1
LABELV $185
byte 1 208
byte 1 144
byte 1 208
byte 1 191
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 209
byte 1 135
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $184
byte 1 77
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $183
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 208
byte 1 179
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $182
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $181
byte 1 208
byte 1 163
byte 1 208
byte 1 180
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $180
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $179
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 137
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 58
byte 1 0
align 1
LABELV $178
byte 1 71
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $177
byte 1 208
byte 1 161
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 131
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $176
byte 1 83
byte 1 99
byte 1 111
byte 1 117
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $175
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $174
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $173
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $172
byte 1 73
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $171
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 32
byte 1 209
byte 1 137
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $170
byte 1 66
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $169
byte 1 208
byte 1 161
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $168
byte 1 72
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $167
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 208
byte 1 179
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 58
byte 1 0
align 1
LABELV $166
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $165
byte 1 208
byte 1 154
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 180
byte 1 58
byte 1 0
align 1
LABELV $164
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $163
byte 1 208
byte 1 154
byte 1 209
byte 1 131
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 32
byte 1 43
byte 1 50
byte 1 48
byte 1 48
byte 1 58
byte 1 0
align 1
LABELV $162
byte 1 83
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 43
byte 1 53
byte 1 58
byte 1 0
align 1
LABELV $161
byte 1 208
byte 1 151
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 43
byte 1 50
byte 1 48
byte 1 48
byte 1 58
byte 1 0
align 1
LABELV $160
byte 1 71
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 43
byte 1 50
byte 1 53
byte 1 58
byte 1 0
align 1
LABELV $159
byte 1 208
byte 1 150
byte 1 209
byte 1 145
byte 1 208
byte 1 187
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 43
byte 1 50
byte 1 48
byte 1 48
byte 1 58
byte 1 0
align 1
LABELV $158
byte 1 89
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 43
byte 1 53
byte 1 48
byte 1 58
byte 1 0
align 1
LABELV $157
byte 1 208
byte 1 154
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 43
byte 1 50
byte 1 48
byte 1 48
byte 1 58
byte 1 0
align 1
LABELV $156
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 43
byte 1 49
byte 1 48
byte 1 48
byte 1 58
byte 1 0
align 1
LABELV $155
byte 1 208
byte 1 164
byte 1 208
byte 1 184
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 43
byte 1 50
byte 1 48
byte 1 48
byte 1 58
byte 1 0
align 1
LABELV $154
byte 1 80
byte 1 117
byte 1 114
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 43
byte 1 50
byte 1 48
byte 1 48
byte 1 58
byte 1 0
align 1
LABELV $153
byte 1 208
byte 1 151
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 58
byte 1 0
align 1
LABELV $152
byte 1 71
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 43
byte 1 53
byte 1 48
byte 1 58
byte 1 0
align 1
LABELV $151
byte 1 208
byte 1 150
byte 1 209
byte 1 145
byte 1 208
byte 1 187
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 58
byte 1 0
align 1
LABELV $150
byte 1 89
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 43
byte 1 50
byte 1 53
byte 1 58
byte 1 0
align 1
LABELV $149
byte 1 208
byte 1 151
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 58
byte 1 0
align 1
LABELV $148
byte 1 71
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 43
byte 1 53
byte 1 58
byte 1 0
align 1
LABELV $147
byte 1 208
byte 1 156
byte 1 208
byte 1 181
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $146
byte 1 77
byte 1 101
byte 1 103
byte 1 97
byte 1 58
byte 1 0
align 1
LABELV $145
byte 1 208
byte 1 157
byte 1 208
byte 1 176
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 188
byte 1 58
byte 1 0
align 1
LABELV $144
byte 1 70
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $143
byte 1 208
byte 1 159
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 191
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $142
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 66
byte 1 101
byte 1 108
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $141
byte 1 208
byte 1 156
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $140
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $139
byte 1 208
byte 1 147
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $138
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $137
byte 1 208
byte 1 145
byte 1 208
byte 1 164
byte 1 208
byte 1 147
byte 1 32
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 143
byte 1 208
byte 1 180
byte 1 58
byte 1 0
align 1
LABELV $136
byte 1 66
byte 1 70
byte 1 71
byte 1 32
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $135
byte 1 208
byte 1 155
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $134
byte 1 83
byte 1 108
byte 1 117
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $133
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 143
byte 1 208
byte 1 180
byte 1 58
byte 1 0
align 1
LABELV $132
byte 1 208
byte 1 159
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $131
byte 1 67
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $130
byte 1 208
byte 1 160
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $129
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $128
byte 1 208
byte 1 147
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $127
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $126
byte 1 208
byte 1 148
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $125
byte 1 83
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $124
byte 1 208
byte 1 159
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $123
byte 1 66
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $122
byte 1 208
byte 1 162
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 209
byte 1 139
byte 1 209
byte 1 136
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $121
byte 1 68
byte 1 97
byte 1 114
byte 1 107
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $120
byte 1 208
byte 1 158
byte 1 208
byte 1 179
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 209
byte 1 145
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $119
byte 1 70
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $118
byte 1 208
byte 1 159
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 209
byte 1 145
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $117
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $116
byte 1 208
byte 1 156
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 209
byte 1 145
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $115
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $114
byte 1 208
byte 1 147
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 183
byte 1 208
byte 1 180
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 209
byte 1 145
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $113
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $112
byte 1 208
byte 1 145
byte 1 208
byte 1 164
byte 1 208
byte 1 147
byte 1 58
byte 1 0
align 1
LABELV $111
byte 1 66
byte 1 70
byte 1 71
byte 1 49
byte 1 48
byte 1 107
byte 1 58
byte 1 0
align 1
LABELV $110
byte 1 208
byte 1 160
byte 1 209
byte 1 141
byte 1 208
byte 1 185
byte 1 208
byte 1 187
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 58
byte 1 0
align 1
LABELV $109
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $108
byte 1 208
byte 1 156
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 143
byte 1 58
byte 1 0
align 1
LABELV $107
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $106
byte 1 208
byte 1 159
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 58
byte 1 0
align 1
LABELV $105
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 58
byte 1 0
align 1
LABELV $104
byte 1 208
byte 1 160
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $103
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $102
byte 1 208
byte 1 147
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 209
byte 1 145
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $101
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $100
byte 1 208
byte 1 148
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 58
byte 1 0
align 1
LABELV $99
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $98
byte 1 208
byte 1 144
byte 1 208
byte 1 178
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $97
byte 1 77
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $96
byte 1 208
byte 1 154
byte 1 209
byte 1 128
byte 1 209
byte 1 142
byte 1 208
byte 1 186
byte 1 58
byte 1 0
align 1
LABELV $95
byte 1 72
byte 1 111
byte 1 111
byte 1 107
byte 1 58
byte 1 0
