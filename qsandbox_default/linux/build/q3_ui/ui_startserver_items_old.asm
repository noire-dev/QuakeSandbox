data
align 4
LABELV weaponitems_left
address $95
byte 4 0
byte 4 0
skip 4
address $96
byte 4 1
byte 4 0
skip 4
address $97
byte 4 2
byte 4 0
skip 4
address $98
byte 4 3
byte 4 0
skip 4
address $99
byte 4 4
byte 4 0
skip 4
address $100
byte 4 5
byte 4 0
skip 4
address $101
byte 4 6
byte 4 0
skip 4
address $102
byte 4 7
byte 4 0
skip 4
address $103
byte 4 8
byte 4 0
skip 4
address $104
byte 4 9
byte 4 0
skip 4
address $105
byte 4 10
byte 4 0
skip 4
address $106
byte 4 11
byte 4 0
skip 4
address $107
byte 4 12
byte 4 0
skip 4
address $108
byte 4 13
byte 4 0
skip 4
align 4
LABELV weaponitems_right
address $109
byte 4 14
byte 4 0
skip 4
address $110
byte 4 15
byte 4 0
skip 4
address $111
byte 4 16
byte 4 0
skip 4
address $112
byte 4 17
byte 4 0
skip 4
address $113
byte 4 18
byte 4 0
skip 4
address $114
byte 4 19
byte 4 0
skip 4
address $115
byte 4 20
byte 4 0
skip 4
address $116
byte 4 21
byte 4 0
skip 4
align 4
LABELV weapon_group
byte 4 0
address weaponitems_left
byte 4 14
align 4
LABELV ammo_group
byte 4 1
address weaponitems_right
byte 4 8
align 4
LABELV healthitems_left
address $117
byte 4 26
byte 4 0
skip 4
address $118
byte 4 27
byte 4 0
skip 4
align 4
LABELV healthitems_right
address $119
byte 4 28
byte 4 0
skip 4
address $120
byte 4 29
byte 4 0
skip 4
align 4
LABELV health_group_l
byte 4 2
address healthitems_left
byte 4 2
align 4
LABELV health_group_r
byte 4 2
address healthitems_right
byte 4 2
align 4
LABELV armouritems_left
address $121
byte 4 31
byte 4 0
skip 4
address $122
byte 4 32
byte 4 0
skip 4
align 4
LABELV armouritems_right
address $123
byte 4 34
byte 4 0
skip 4
align 4
LABELV armour_group_l
byte 4 3
address armouritems_left
byte 4 2
align 4
LABELV armour_group_r
byte 4 3
address armouritems_right
byte 4 1
align 4
LABELV powerupitems_left
address $124
byte 4 35
byte 4 0
skip 4
address $125
byte 4 36
byte 4 0
skip 4
address $126
byte 4 37
byte 4 0
skip 4
align 4
LABELV powerupitems_right
address $127
byte 4 38
byte 4 0
skip 4
address $128
byte 4 39
byte 4 0
skip 4
address $129
byte 4 40
byte 4 0
skip 4
align 4
LABELV powerup_group_l
byte 4 4
address powerupitems_left
byte 4 3
align 4
LABELV powerup_group_r
byte 4 4
address powerupitems_right
byte 4 3
align 4
LABELV holdableitems_left
address $130
byte 4 45
byte 4 0
skip 4
align 4
LABELV holdableitems_right
address $131
byte 4 46
byte 4 0
skip 4
align 4
LABELV holdable_group_l
byte 4 5
address holdableitems_left
byte 4 1
align 4
LABELV holdable_group_r
byte 4 5
address holdableitems_right
byte 4 1
align 4
LABELV groupInfo
address weapon_group
byte 4 0
address $133
byte 4 0
byte 4 0
byte 4 1
address ammo_group
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address health_group_l
byte 4 0
address $134
byte 4 0
byte 4 0
byte 4 1
address health_group_r
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address armour_group_l
byte 4 2
address $135
byte 4 0
byte 4 0
byte 4 2
address armour_group_r
byte 4 3
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address powerup_group_l
byte 4 2
address $136
byte 4 0
byte 4 0
byte 4 2
address powerup_group_r
byte 4 3
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address holdable_group_l
byte 4 2
address $137
byte 4 0
byte 4 0
byte 4 2
address holdable_group_r
byte 4 3
byte 4 0
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV groupInfo_Size
byte 4 10
align 4
LABELV masterControl_old
byte 4 0
address $138
byte 4 0
byte 4 1
address $139
byte 4 0
byte 4 2
address $140
byte 4 0
byte 4 3
address $141
byte 4 0
byte 4 4
address $142
byte 4 0
byte 4 5
address $143
byte 4 0
align 4
LABELV masterControl_old_Size
byte 4 6
align 4
LABELV allgroups_items_old
address $144
address $145
address $146
byte 4 0
code
proc StartServer_BothItemPage_Old_InitControls 28 0
file "../../../code/q3_ui/ui_startserver_items_old.c"
line 421
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
;18:*/
;19:
;20:
;21:#define INGAME_CANCEL0 	"menu/art/back_0"
;22:#define INGAME_CANCEL1 	"menu/art/back_1"
;23:#define INGAME_ACCEPT0 	"menu/art/accept_0"
;24:#define INGAME_ACCEPT1 	"menu/art/accept_1"
;25:
;26:#define SERVER_ITEM_RESET0 	"menu/art/reset_0"
;27:#define SERVER_ITEM_RESET1 	"menu/art/reset_1"
;28://#define SERVER_ITEM_CLEAR0 	"menu/uie_art/clear_0"
;29://#define SERVER_ITEM_CLEAR1 	"menu/uie_art/clear_1"
;30:
;31:
;32:#define ID_ITEM_GAMETYPE 	401
;33:#define ID_ITEM_RESET		402
;34:#define ID_ITEM_CLEAR		403
;35:
;36:#define ID_ITEMINGAME_CANCEL 	430
;37:#define ID_ITEMINGAME_ACCEPT 	431
;38:
;39:
;40:
;41:
;42://
;43:// controls
;44://
;45:
;46:/*
;47:	Observe the dual usage of this control page.
;48:	It can appear as either a part of the map/bot setup
;49:	pages, or as an in-game menu for tweaking existing
;50:	parameters.
;51:*/
;52:
;53:
;54:
;55:#define NUM_ITEM_COUNT ITEM_COUNT
;56:#define NUM_ITEMGROUP_COUNT ITEMGROUP_COUNT
;57:
;58:
;59:// a single item, and related data/controls
;60:typedef struct iteminfo_s {
;61:	char* name;
;62:	int ident;	// ITEM_* flag
;63:
;64:	itemnode_t* item;
;65:	menuradiobutton_s* control;
;66:} iteminfo_t;
;67:
;68:
;69:// a group of items that are related
;70:typedef struct groupinfo_s {
;71:	int ident;	// GROUPITEM_* flag
;72:	iteminfo_t* itemlist;
;73:	int size;
;74:} groupinfo_t;
;75:
;76:
;77:
;78:
;79:typedef struct itemradionbutton_s {
;80:	menuradiobutton_s control;
;81:	iteminfo_t* item;
;82:	int bg_index;	// bg_items[] index
;83:} itemradiobutton_t;
;84:
;85:
;86:
;87:
;88:// controls that appear when used as an in-game menu
;89:typedef struct ingame_controls_t {
;90:	menutext_s		title;
;91:	menubitmap_s	cancel;
;92:	menubitmap_s	accept;
;93:	menutext_s		info;
;94:} ingame_controls_s;
;95:
;96:
;97:
;98:// and finally the page controls themselves
;99:typedef struct itemcontrols_s {
;100:	menuframework_s 	menu;
;101:	commoncontrols_t 	common;
;102:	ingame_controls_s	ingame;
;103:
;104:	menulist_s 		gameType;
;105:	menubitmap_s 	gameTypeIcon;
;106:
;107:	menulist_s 		groupMaster[NUM_ITEMGROUP_COUNT];	// don't use ITEMGROUP_* to index
;108:
;109:	itemradiobutton_t itemCtrl[NUM_ITEM_COUNT]; // don't use ITEM_* to index
;110:
;111:	menubitmap_s	reset;
;112:
;113:	qboolean ingame_menu;	// menu display format
;114:
;115:	int nummasters;
;116:	int numitems;
;117:
;118:	int base_master_y;	// height of master controls
;119:
;120:	// state of the controls
;121:	// this abstraction "aliases" or "hides" where the data is stored,
;122:	// and helps us separate data associated with the script from
;123:	// data associated with the in-game version of this menu
;124:
;125:	// array size assumed as ITEM_COUNT
;126:	// indexed by ITEM_*
;127:	qboolean* enabled;
;128:
;129:	// array size assumed as ITEMGROUP_COUNT
;130:	// indexed by ITEMGROUP_*
;131:	int* grouptype;
;132:} itemcontrols_t;
;133:
;134:
;135:
;136:static itemcontrols_t s_itemcontrols_old;
;137:
;138:
;139://
;140:// data storage used during ingame menu display
;141:// you shouldn't need to write to these values directly
;142://
;143:static qboolean ingame_enabled_old[ITEM_COUNT];
;144:static int ingame_grouptype_old[ITEMGROUP_COUNT];
;145:
;146:
;147:enum {
;148:	GRCOL_LEFT,
;149:	GRCOL_MIDLEFT,
;150:	GRCOL_MIDRIGHT,
;151:	GRCOL_RIGHT,
;152:
;153:	GRCOL_COUNT
;154:};
;155:
;156:
;157:
;158://
;159:// data lists
;160://
;161:
;162:
;163:// WEAPONS   ------------------------------------------
;164:
;165:static iteminfo_t weaponitems_left[] =
;166:{
;167:	{"Hook:", ITEM_GRAPPLING_HOOK, NULL},
;168:	{"M/gun:", ITEM_MGUN, NULL},
;169:	{"Shotgun:", ITEM_SHOTGUN, NULL},
;170:	{"Grenade:", ITEM_GRENADE, NULL},
;171:	{"Rocket:", ITEM_ROCKET, NULL},
;172:	{"Plasma:", ITEM_PLASMA, NULL},
;173:	{"Lightning:", ITEM_LIGHTNING, NULL},
;174:	{"Railgun:", ITEM_RAIL, NULL},
;175:	{"BFG10k:", ITEM_BFG, NULL},
;176:	{"Nailgun:", ITEM_NAILGUN, NULL},
;177:	{"Prox Launcher:", ITEM_PROX_LAUNCHER, NULL},
;178:	{"Chaingun:", ITEM_CHAINGUN, NULL},
;179:	{"Flamethrower:", ITEM_FLAMETHROWER, NULL},
;180:	{"Antimatter:", ITEM_ANTIMATTER, NULL},
;181:};
;182:
;183:
;184:static iteminfo_t weaponitems_right[] =
;185:{
;186:	{"bullets:", ITEM_MGUN_AMMO, NULL},
;187:	{"shells:", ITEM_SHOTGUN_AMMO, NULL},
;188:	{"pineapples:", ITEM_GRENADE_AMMO, NULL},
;189:	{"rockets:", ITEM_ROCKET_AMMO, NULL},
;190:	{"cells:", ITEM_PLASMA_AMMO, NULL},
;191:	{"charge:", ITEM_LIGHTNING_AMMO, NULL},
;192:	{"slugs:", ITEM_RAIL_AMMO, NULL},
;193:	{"bfg plasma:", ITEM_BFG_AMMO, NULL}
;194:};
;195:
;196:
;197:
;198:static groupinfo_t weapon_group = {
;199:	ITEMGROUP_WEAPON,
;200:	weaponitems_left,
;201:	sizeof(weaponitems_left)/sizeof(weaponitems_left[0])
;202:};
;203:
;204:static groupinfo_t ammo_group = {
;205:	ITEMGROUP_AMMO,
;206:	weaponitems_right,
;207:	sizeof(weaponitems_right)/sizeof(weaponitems_right[0])
;208:};
;209:
;210:
;211:
;212:
;213:// HEALTH    ------------------------------------------
;214:
;215:
;216:static iteminfo_t healthitems_left[] =
;217:{
;218:	{"Mega:", ITEM_MEGA, NULL},
;219:	{"Green +5:", ITEM_HEALTH_SMALL, NULL}
;220:};
;221:
;222:
;223:static iteminfo_t healthitems_right[] =
;224:{
;225:	{"Yellow +25:", ITEM_HEALTH_MEDIUM, NULL},
;226:	{"Gold +50:", ITEM_HEALTH_LARGE, NULL}
;227:};
;228:
;229:
;230:static groupinfo_t health_group_l = {
;231:	ITEMGROUP_HEALTH,
;232:	healthitems_left,
;233:	sizeof(healthitems_left)/sizeof(healthitems_left[0])
;234:};
;235:
;236:static groupinfo_t health_group_r = {
;237:	ITEMGROUP_HEALTH,
;238:	healthitems_right,
;239:	sizeof(healthitems_right)/sizeof(healthitems_right[0])
;240:};
;241:
;242:
;243:// ARMOUR    ------------------------------------------
;244:
;245:
;246:static iteminfo_t armouritems_left[] =
;247:{
;248:	{"Red +100:", ITEM_ARMOUR_RED, NULL},
;249:	{"Yellow +50:", ITEM_ARMOUR_YELLOW, NULL}
;250:};
;251:
;252:
;253:static iteminfo_t armouritems_right[] =
;254:{
;255:	{"Shard +5:", ITEM_ARMOUR_SHARD, NULL}
;256:};
;257:
;258:
;259:static groupinfo_t armour_group_l = {
;260:	ITEMGROUP_ARMOUR,
;261:	armouritems_left,
;262:	sizeof(armouritems_left)/sizeof(armouritems_left[0])
;263:};
;264:
;265:static groupinfo_t armour_group_r = {
;266:	ITEMGROUP_ARMOUR,
;267:	armouritems_right,
;268:	sizeof(armouritems_right)/sizeof(armouritems_right[0])
;269:};
;270:
;271:
;272:// POWERUPS  ------------------------------------------
;273:
;274:
;275:static iteminfo_t powerupitems_left[] =
;276:{
;277:	{"Quad:", ITEM_QUAD, NULL},
;278:	{"Regen:", ITEM_REGEN, NULL},
;279:	{"Haste:", ITEM_HASTE, NULL}
;280:};
;281:
;282:
;283:static iteminfo_t powerupitems_right[] =
;284:{
;285:	{"Battlesuit:", ITEM_BATTLESUIT, NULL},
;286:	{"Invisible:", ITEM_INVISIBLE, NULL},
;287:	{"Flight:", ITEM_FLIGHT, NULL}
;288:};
;289:
;290:
;291:static groupinfo_t powerup_group_l = {
;292:	ITEMGROUP_POWERUPS,
;293:	powerupitems_left,
;294:	sizeof(powerupitems_left)/sizeof(powerupitems_left[0])
;295:};
;296:
;297:static groupinfo_t powerup_group_r = {
;298:	ITEMGROUP_POWERUPS,
;299:	powerupitems_right,
;300:	sizeof(powerupitems_right)/sizeof(powerupitems_right[0])
;301:};
;302:
;303:
;304:// HOLDABLE  ------------------------------------------
;305:
;306:
;307:
;308:static iteminfo_t holdableitems_left[] =
;309:{
;310:	{"Medkit:", ITEM_MEDKIT, NULL}
;311:};
;312:
;313:
;314:static iteminfo_t holdableitems_right[] =
;315:{
;316:	{"Teleporter:", ITEM_TELEPORTER, NULL}
;317:};
;318:
;319:
;320:static groupinfo_t holdable_group_l = {
;321:	ITEMGROUP_HOLDABLE,
;322:	holdableitems_left,
;323:	sizeof(holdableitems_left)/sizeof(holdableitems_left[0])
;324:};
;325:
;326:static groupinfo_t holdable_group_r = {
;327:	ITEMGROUP_HOLDABLE,
;328:	holdableitems_right,
;329:	sizeof(holdableitems_right)/sizeof(holdableitems_right[0])
;330:};
;331:
;332:
;333:// GROUP LAYOUT ------------------------------------------
;334:
;335:
;336:enum {
;337:	SYNC_NONE,
;338:	SYNC_LEFT,
;339:	SYNC_RIGHT
;340:};
;341:
;342:
;343:
;344:typedef struct groupposition_s {
;345:	groupinfo_t* group;
;346:	int position;	// GRCOL_*
;347:
;348:	// possible title text
;349:	char* title;
;350:	int x;
;351:	int y;
;352:
;353:	int resync;	// SYNC_*
;354:} groupposition_t;
;355:
;356:
;357:
;358:
;359:static groupposition_t groupInfo[] = {
;360:	{ &weapon_group, GRCOL_LEFT, "Weapons", 0, 0, SYNC_LEFT},
;361:	{ &ammo_group, GRCOL_MIDLEFT, NULL, 0, 0, SYNC_NONE},
;362:
;363:	{ &health_group_l, GRCOL_LEFT, "Health", 0, 0, SYNC_LEFT},
;364:	{ &health_group_r, GRCOL_MIDLEFT, NULL, 0, 0, SYNC_NONE},
;365:
;366:	{ &armour_group_l, GRCOL_MIDRIGHT, "Armour", 0, 0, SYNC_RIGHT},
;367:	{ &armour_group_r, GRCOL_RIGHT, NULL, 0, 0, SYNC_NONE},
;368:
;369:	{ &powerup_group_l, GRCOL_MIDRIGHT, "Powerups", 0, 0, SYNC_RIGHT},
;370:	{ &powerup_group_r, GRCOL_RIGHT, NULL, 0, 0, SYNC_NONE},
;371:
;372:	{ &holdable_group_l, GRCOL_MIDRIGHT, "Holdables", 0, 0, SYNC_RIGHT},
;373:	{ &holdable_group_r, GRCOL_RIGHT, NULL, 0, 0, SYNC_NONE}
;374:};
;375:
;376:
;377:static int groupInfo_Size = sizeof(groupInfo)/sizeof(groupInfo[0]);
;378:
;379:
;380:typedef struct mastercontrol_s {
;381:	int ident;
;382:	char* title;
;383:	menulist_s* control;
;384:} mastercontrol_t;
;385:
;386:
;387:
;388:static mastercontrol_t masterControl_old[ITEMGROUP_COUNT] = {
;389:	{ ITEMGROUP_WEAPON, "Weapon:", NULL },
;390:	{ ITEMGROUP_AMMO, "Ammo:", NULL },
;391:	{ ITEMGROUP_HEALTH, "Health:", NULL },
;392:	{ ITEMGROUP_ARMOUR, "Armour:", NULL },
;393:	{ ITEMGROUP_POWERUPS, "Powerups:", NULL },
;394:	{ ITEMGROUP_HOLDABLE, "Holdables:", NULL }
;395:};
;396:
;397:
;398:static int masterControl_old_Size = sizeof(masterControl_old)/sizeof(masterControl_old[0]);
;399:
;400:
;401:static const char* allgroups_items_old[] = {
;402:	"All",	// ALLGROUPS_ENABLED
;403:	"Custom",	// ALLGROUPS_CUSTOM
;404:	"Hidden",	// ALLGROUPS_HIDDEN
;405:	0
;406:};
;407:
;408:
;409:
;410:
;411://------------------------------------------------------------------
;412:
;413:
;414:
;415:/*
;416:=================
;417:StartServer_BothItemPage_Old_InitControls
;418:=================
;419:*/
;420:static void StartServer_BothItemPage_Old_InitControls( void )
;421:{
line 429
;422:	int 		i, j;
;423:	qboolean 	enabled;
;424:	groupinfo_t*	group;
;425:	int 		grouptype;
;426:	int 		index;
;427:
;428:	// initialize the master controls
;429:	for (i = 0; i < masterControl_old_Size; i++)
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $151
JUMPV
LABELV $148
line 430
;430:	{
line 431
;431:		masterControl_old[i].control->curvalue = s_itemcontrols_old.grouptype[ masterControl_old[i].ident ];
ADDRLP4 24
CNSTI4 12
ADDRLP4 16
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 masterControl_old+8
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 24
INDIRI4
ADDRGP4 masterControl_old
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9224
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 432
;432:	}
LABELV $149
line 429
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $151
ADDRLP4 16
INDIRI4
ADDRGP4 masterControl_old_Size
INDIRI4
LTI4 $148
line 435
;433:
;434:	// initialize each group of items
;435:	for (i = 0; i < groupInfo_Size; i++)
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $154
line 436
;436:	{
line 437
;437:		group = groupInfo[i].group;
ADDRLP4 4
CNSTI4 24
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 groupInfo
ADDP4
INDIRP4
ASGNP4
line 438
;438:		if (!group)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $158
line 439
;439:			continue;
ADDRGP4 $155
JUMPV
LABELV $158
line 441
;440:
;441:		enabled = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 442
;442:		grouptype = s_itemcontrols_old.grouptype[ group->ident ];
ADDRLP4 12
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9224
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 443
;443:		if (grouptype == ALLGROUPS_HIDDEN)
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $161
line 444
;444:			enabled = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $161
line 446
;445:
;446:		for (j = 0; j < group->size; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $166
JUMPV
LABELV $163
line 447
;447:		{
line 448
;448:			if (grouptype == ALLGROUPS_CUSTOM) {
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $167
line 449
;449:				enabled = s_itemcontrols_old.enabled[ group->itemlist[j].ident ];
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9220
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 450
;450:			}
LABELV $167
line 452
;451:
;452:			group->itemlist[j].control->curvalue = enabled;
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDP4
CNSTI4 12
ADDP4
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 453
;453:		}
LABELV $164
line 446
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $166
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $163
line 454
;454:	}
LABELV $155
line 435
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $157
ADDRLP4 16
INDIRI4
ADDRGP4 groupInfo_Size
INDIRI4
LTI4 $154
line 455
;455:}
LABELV $147
endproc StartServer_BothItemPage_Old_InitControls 28 0
proc StartServer_InGame_Old_FindGroupType 16 0
line 467
;456:
;457:
;458:
;459:
;460:
;461:/*
;462:=================
;463:StartServer_InGame_Old_FindGroupType
;464:=================
;465:*/
;466:static int StartServer_InGame_Old_FindGroupType( iteminfo_t* list, int size )
;467:{
line 472
;468:	int grouptype;
;469:	qboolean enabled;
;470:	int i;
;471:
;472:	if (size == 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $171
line 473
;473:		return ALLGROUPS_ENABLED;
CNSTI4 0
RETI4
ADDRGP4 $170
JUMPV
LABELV $171
line 475
;474:
;475:	grouptype = ALLGROUPS_ENABLED;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 476
;476:	enabled = s_itemcontrols_old.enabled[ list[0].ident ];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9220
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 477
;477:	if (!enabled)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $174
line 478
;478:		grouptype = ALLGROUPS_HIDDEN;
ADDRLP4 8
CNSTI4 2
ASGNI4
LABELV $174
line 480
;479:
;480:	for (i = 0; i < size; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $179
JUMPV
LABELV $176
line 481
;481:	{
line 482
;482:		if (enabled != s_itemcontrols_old.enabled[ list[i].ident ]) {
ADDRLP4 12
CNSTI4 4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9220
INDIRP4
ADDP4
INDIRI4
EQI4 $180
line 483
;483:			return ALLGROUPS_CUSTOM;
CNSTI4 1
RETI4
ADDRGP4 $170
JUMPV
LABELV $180
line 485
;484:		}
;485:	}
LABELV $177
line 480
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $179
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $176
line 487
;486:
;487:	return grouptype;
ADDRLP4 8
INDIRI4
RETI4
LABELV $170
endproc StartServer_InGame_Old_FindGroupType 16 0
proc StartServer_InGame_Old_Init 40 12
line 497
;488:}
;489:
;490:
;491:/*
;492:=================
;493:StartServer_InGame_Old_Init
;494:=================
;495:*/
;496:static void StartServer_InGame_Old_Init( void )
;497:{
line 504
;498:	int 		i, j;
;499:	qboolean 	disabled;
;500:	qboolean 	init;
;501:	groupinfo_t* 	group;
;502:	int 		type, t;
;503:
;504:	s_itemcontrols_old.enabled = ingame_enabled_old;
ADDRGP4 s_itemcontrols_old+9220
ADDRGP4 ingame_enabled_old
ASGNP4
line 505
;505:	s_itemcontrols_old.grouptype = ingame_grouptype_old;
ADDRGP4 s_itemcontrols_old+9224
ADDRGP4 ingame_grouptype_old
ASGNP4
line 508
;506:
;507:	// get the cvars currently set
;508:	for (i = 0; i < ITEM_COUNT; i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $186
line 509
;509:	{
line 510
;510:		disabled = (int)Com_Clamp(0, 1, trap_Cvar_VariableValue(va("disable_%s", server_itemlist[i].mapitem)));
ADDRGP4 $190
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 server_itemlist+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
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
ADDRLP4 24
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 511
;511:		if (disabled)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $192
line 512
;512:			s_itemcontrols_old.enabled[i] = qfalse;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9220
INDIRP4
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $193
JUMPV
LABELV $192
line 514
;513:		else
;514:			s_itemcontrols_old.enabled[i] = qtrue;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9220
INDIRP4
ADDP4
CNSTI4 1
ASGNI4
LABELV $193
line 515
;515:	}
LABELV $187
line 508
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 50
LTI4 $186
line 519
;516:
;517:	// all groups are custom by default, just in case a group
;518:	// doesn't have a master control (we want the control visible and editable)
;519:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $196
line 520
;520:	{
line 521
;521:		s_itemcontrols_old.grouptype[i] = ALLGROUPS_CUSTOM;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9224
INDIRP4
ADDP4
CNSTI4 1
ASGNI4
line 522
;522:	}
LABELV $197
line 519
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 6
LTI4 $196
line 525
;523:
;524:	// now scan through the master controls to see how they should be setup
;525:	for (i = 0; i < masterControl_old_Size; i++)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $204
JUMPV
LABELV $201
line 526
;526:	{
line 527
;527:		if (!masterControl_old[i].control)
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 masterControl_old+8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $205
line 528
;528:			continue;
ADDRGP4 $202
JUMPV
LABELV $205
line 531
;529:
;530:		// check each group for a contrary enable state
;531:		init = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 532
;532:		for (j = 0; j < groupInfo_Size; j++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $211
JUMPV
LABELV $208
line 533
;533:		{
line 534
;534:			group = groupInfo[j].group;
ADDRLP4 0
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 groupInfo
ADDP4
INDIRP4
ASGNP4
line 535
;535:			if (group->ident != masterControl_old[i].ident)
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 masterControl_old
ADDP4
INDIRI4
EQI4 $212
line 536
;536:				continue;
ADDRGP4 $209
JUMPV
LABELV $212
line 538
;537:
;538:			t = StartServer_InGame_Old_FindGroupType(group->itemlist, group->size);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 StartServer_InGame_Old_FindGroupType
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 540
;539:
;540:			if (init) {
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $214
line 541
;541:				type = t;
ADDRLP4 20
ADDRLP4 12
INDIRI4
ASGNI4
line 542
;542:				init = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 543
;543:			}
ADDRGP4 $215
JUMPV
LABELV $214
line 544
;544:			else {
line 545
;545:				if (t != type)
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $216
line 546
;546:					type = ALLGROUPS_CUSTOM;
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $216
line 547
;547:			}
LABELV $215
line 548
;548:		}
LABELV $209
line 532
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $211
ADDRLP4 4
INDIRI4
ADDRGP4 groupInfo_Size
INDIRI4
LTI4 $208
line 550
;549:
;550:		s_itemcontrols_old.grouptype[ masterControl_old[i].ident ] = type;
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 masterControl_old
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9224
INDIRP4
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 551
;551:	}
LABELV $202
line 525
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $204
ADDRLP4 8
INDIRI4
ADDRGP4 masterControl_old_Size
INDIRI4
LTI4 $201
line 553
;552:
;553:	StartServer_BothItemPage_Old_InitControls();
ADDRGP4 StartServer_BothItemPage_Old_InitControls
CALLV
pop
line 554
;554:}
LABELV $183
endproc StartServer_InGame_Old_Init 40 12
proc StartServer_InGame_Old_SaveChanges 36 8
line 564
;555:
;556:
;557:
;558:/*
;559:=================
;560:StartServer_InGame_Old_SaveChanges
;561:=================
;562:*/
;563:static void StartServer_InGame_Old_SaveChanges( void )
;564:{
line 572
;565:	int 		i, j;
;566:	int 		type;
;567:	int			ident;
;568:	qboolean	disable;
;569:	groupinfo_t*	group;
;570:
;571:	// write out the disabled items list
;572:	for (i = 0; i < groupInfo_Size; i++)
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $223
JUMPV
LABELV $220
line 573
;573:	{
line 574
;574:		group = groupInfo[i].group;
ADDRLP4 8
CNSTI4 24
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 groupInfo
ADDP4
INDIRP4
ASGNP4
line 575
;575:		if (!group)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $224
line 576
;576:			continue;
ADDRGP4 $221
JUMPV
LABELV $224
line 578
;577:
;578:		disable = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 579
;579:		type = s_itemcontrols_old.grouptype[ group->ident ];
ADDRLP4 16
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9224
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 580
;580:		if (type == ALLGROUPS_HIDDEN)
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $227
line 581
;581:			disable = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $227
line 582
;582:		for (j = 0; j < group->size; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $232
JUMPV
LABELV $229
line 583
;583:		{
line 584
;584:			ident = group->itemlist[j].ident;
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
LSHI4
ADDRLP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 585
;585:			if (type == ALLGROUPS_CUSTOM)
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $233
line 586
;586:			{
line 587
;587:				disable = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 588
;588:				if (s_itemcontrols_old.enabled[ ident ])
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9220
INDIRP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $235
line 589
;589:					disable = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $235
line 590
;590:			}
LABELV $233
line 591
;591:			trap_Cvar_Set(va("disable_%s", server_itemlist[ident].mapitem), va("%i",disable));
ADDRGP4 $190
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 server_itemlist+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $239
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 592
;592:		}
LABELV $230
line 582
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $232
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $229
line 593
;593:	}
LABELV $221
line 572
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $223
ADDRLP4 20
INDIRI4
ADDRGP4 groupInfo_Size
INDIRI4
LTI4 $220
line 594
;594:}
LABELV $219
endproc StartServer_InGame_Old_SaveChanges 36 8
proc StartServer_InGame_Old_Event 8 0
line 604
;595:
;596:
;597:
;598:/*
;599:=================
;600:StartServer_InGame_Old_Event
;601:=================
;602:*/
;603:static void StartServer_InGame_Old_Event( void* ptr, int event )
;604:{
line 605
;605:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $241
line 606
;606:		return;
ADDRGP4 $240
JUMPV
LABELV $241
line 608
;607:
;608:	switch (((menucommon_s*)ptr)->id)
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
EQI4 $246
ADDRLP4 0
INDIRI4
CNSTI4 431
EQI4 $247
ADDRGP4 $243
JUMPV
line 609
;609:	{
LABELV $246
line 611
;610:	case ID_ITEMINGAME_CANCEL:
;611:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 612
;612:		break;
ADDRGP4 $244
JUMPV
LABELV $247
line 615
;613:
;614:	case ID_ITEMINGAME_ACCEPT:
;615:		StartServer_InGame_Old_SaveChanges();
ADDRGP4 StartServer_InGame_Old_SaveChanges
CALLV
pop
line 616
;616:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 617
;617:		break;		
LABELV $243
LABELV $244
line 619
;618:	}
;619:}
LABELV $240
endproc StartServer_InGame_Old_Event 8 0
proc StartServer_ItemPage_Old_ResetAll 8 0
line 658
;620:
;621:
;622://------------------------------------------------------------------
;623:
;624:
;625:
;626:/*
;627:=================
;628:StartServer_ItemPage_Cache
;629:=================
;630:*/
;631:/*void StartServer_ItemPage_Cache( void )
;632:{
;633:	if (s_itemcontrols_old.ingame_menu)
;634:	{
;635:		trap_R_RegisterShaderNoMip( INGAME_CANCEL0 );
;636:		trap_R_RegisterShaderNoMip( INGAME_CANCEL1 );
;637:		trap_R_RegisterShaderNoMip( INGAME_ACCEPT0 );
;638:		trap_R_RegisterShaderNoMip( INGAME_ACCEPT1 );
;639:	}
;640:
;641:	trap_R_RegisterShaderNoMip( SERVER_ITEM_RESET0 );
;642:	trap_R_RegisterShaderNoMip( SERVER_ITEM_RESET1 );
;643://	trap_R_RegisterShaderNoMip( SERVER_ITEM_CLEAR0 );
;644://	trap_R_RegisterShaderNoMip( SERVER_ITEM_CLEAR1 );
;645:}*/
;646:
;647:
;648:
;649:/*
;650:=================
;651:StartServer_ItemPage_Old_ResetAll
;652:
;653:Sets all item controls on/off and group settings
;654:become custom
;655:=================
;656:*/
;657:static void StartServer_ItemPage_Old_ResetAll( qboolean enabled)
;658:{
line 662
;659:	int i;
;660:	groupinfo_t*	group;
;661:
;662:	for (i = 0; i < ITEM_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $249
line 663
;663:	{
line 664
;664:		s_itemcontrols_old.enabled[i] = enabled;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9220
INDIRP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 665
;665:	}
LABELV $250
line 662
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $249
line 667
;666:
;667:	for (i = 0; i < ITEMGROUP_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $254
line 668
;668:	{
line 669
;669:		s_itemcontrols_old.grouptype[i] = ALLGROUPS_CUSTOM;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9224
INDIRP4
ADDP4
CNSTI4 1
ASGNI4
line 670
;670:	}
LABELV $255
line 667
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $254
line 672
;671:
;672:	StartServer_BothItemPage_Old_InitControls();
ADDRGP4 StartServer_BothItemPage_Old_InitControls
CALLV
pop
line 673
;673:}
LABELV $248
endproc StartServer_ItemPage_Old_ResetAll 8 0
proc StartServer_ItemPage_Old_SetItemControls 0 0
line 682
;674:
;675:
;676:/*
;677:=================
;678:StartServer_ItemPage_Old_SetItemControls
;679:=================
;680:*/
;681:static void StartServer_ItemPage_Old_SetItemControls(iteminfo_t* list, int size, int type)
;682:{
line 683
;683:}
LABELV $259
endproc StartServer_ItemPage_Old_SetItemControls 0 0
proc StartServer_ItemPage_Old_UpdateInterface 48 12
line 693
;684:
;685:
;686:
;687:/*
;688:=================
;689:StartServer_ItemPage_Old_UpdateInterface
;690:=================
;691:*/
;692:static void StartServer_ItemPage_Old_UpdateInterface(void)
;693:{
line 701
;694:	int 		i, j, k;
;695:	int 		type;
;696:	groupinfo_t* group;
;697:	menuradiobutton_s* ctrl;
;698:	iteminfo_t*	item;
;699:
;700:	// menu type specific interface updates
;701:	if (!s_itemcontrols_old.ingame_menu)
ADDRGP4 s_itemcontrols_old+9204
INDIRI4
CNSTI4 0
NEI4 $261
line 702
;702:	{
line 703
;703:		StartServer_SetIconFromGameType(&s_itemcontrols_old.gameTypeIcon, s_scriptdata.gametype, qfalse);
ADDRGP4 s_itemcontrols_old+2980
ARGP4
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_SetIconFromGameType
CALLV
pop
line 704
;704:	}
LABELV $261
line 707
;705:
;706:	// set the groups, only custom visually enables it
;707:	for (i = 0; i < masterControl_old_Size; i++)
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $268
JUMPV
LABELV $265
line 708
;708:	{
line 709
;709:		type = masterControl_old[i].control->curvalue;
ADDRLP4 12
CNSTI4 12
ADDRLP4 24
INDIRI4
MULI4
ADDRGP4 masterControl_old+8
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 711
;710:
;711:		for (j = 0; j < groupInfo_Size; j++)
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $273
JUMPV
LABELV $270
line 712
;712:		{
line 713
;713:			group = groupInfo[j].group;
ADDRLP4 16
CNSTI4 24
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 groupInfo
ADDP4
INDIRP4
ASGNP4
line 714
;714:			if (!group || group->ident != masterControl_old[i].ident)
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $276
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 12
ADDRLP4 24
INDIRI4
MULI4
ADDRGP4 masterControl_old
ADDP4
INDIRI4
EQI4 $274
LABELV $276
line 715
;715:				continue;
ADDRGP4 $271
JUMPV
LABELV $274
line 717
;716:
;717:			item = group->itemlist;
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
line 718
;718:			k = group->size;
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $277
line 720
;719:			while (k > 0 )
;720:			{
line 721
;721:				ctrl = item->control;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
line 722
;722:				switch (type) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $282
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $284
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $283
ADDRGP4 $280
JUMPV
LABELV $282
line 724
;723:				case ALLGROUPS_ENABLED:
;724:					ctrl->generic.flags |= (QMF_GRAYED|QMF_INACTIVE);
ADDRLP4 36
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
line 725
;725:					ctrl->curvalue = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 726
;726:					break;
ADDRGP4 $281
JUMPV
LABELV $283
line 729
;727:
;728:				case ALLGROUPS_HIDDEN:
;729:					ctrl->generic.flags |= (QMF_GRAYED|QMF_INACTIVE);
ADDRLP4 40
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
line 730
;730:					ctrl->curvalue = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 731
;731:					break;
ADDRGP4 $281
JUMPV
LABELV $284
line 734
;732:
;733:				case ALLGROUPS_CUSTOM:
;734:					ctrl->generic.flags &= ~(QMF_GRAYED|QMF_INACTIVE);
ADDRLP4 44
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTI4 -24577
CVIU4 4
BANDU4
ASGNU4
line 735
;735:					ctrl->curvalue = s_itemcontrols_old.enabled[ item->ident ];
ADDRLP4 8
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9220
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 736
;736:					break;
LABELV $280
LABELV $281
line 739
;737:				}
;738:
;739:				item++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
line 740
;740:				k--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 741
;741:			}
LABELV $278
line 719
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $277
line 743
;742:
;743:		}
LABELV $271
line 711
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $273
ADDRLP4 20
INDIRI4
ADDRGP4 groupInfo_Size
INDIRI4
LTI4 $270
line 744
;744:	}
LABELV $266
line 707
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $268
ADDRLP4 24
INDIRI4
ADDRGP4 masterControl_old_Size
INDIRI4
LTI4 $265
line 747
;745:
;746:	// enable fight button if possible
;747:	StartServer_CheckFightReady(&s_itemcontrols_old.common);
ADDRGP4 s_itemcontrols_old+1076
ARGP4
ADDRGP4 StartServer_CheckFightReady
CALLI4
pop
line 748
;748:}
LABELV $260
endproc StartServer_ItemPage_Old_UpdateInterface 48 12
proc StartServer_ItemPage_Old_Save 0 0
line 759
;749:
;750:
;751:
;752:
;753:/*
;754:=================
;755:StartServer_ItemPage_Old_Save
;756:=================
;757:*/
;758:static void StartServer_ItemPage_Old_Save( void )
;759:{
line 760
;760:	StartServer_SaveScriptData();
ADDRGP4 StartServer_SaveScriptData
CALLV
pop
line 761
;761:}
LABELV $287
endproc StartServer_ItemPage_Old_Save 0 0
proc StartServer_ItemPage_Old_Load 0 0
line 770
;762:
;763:
;764:/*
;765:=================
;766:StartServer_ItemPage_Old_Load
;767:=================
;768:*/
;769:static void StartServer_ItemPage_Old_Load( void )
;770:{
line 771
;771:	s_itemcontrols_old.enabled = s_scriptdata.item.enabled;
ADDRGP4 s_itemcontrols_old+9220
ADDRGP4 s_scriptdata+3452+24
ASGNP4
line 772
;772:	s_itemcontrols_old.grouptype = s_scriptdata.item.groupstate;
ADDRGP4 s_itemcontrols_old+9224
ADDRGP4 s_scriptdata+3452
ASGNP4
line 774
;773:
;774:	s_itemcontrols_old.gameType.curvalue = s_scriptdata.gametype;
ADDRGP4 s_itemcontrols_old+2848+92
ADDRGP4 s_scriptdata
INDIRI4
ASGNI4
line 776
;775:
;776:	StartServer_BothItemPage_Old_InitControls();
ADDRGP4 StartServer_BothItemPage_Old_InitControls
CALLV
pop
line 777
;777:}
LABELV $288
endproc StartServer_ItemPage_Old_Load 0 0
proc StartServer_ItemPage_Old_CommonEvent 8 4
line 787
;778:
;779:
;780:
;781:/*
;782:=================
;783:StartServer_ItemPage_Old_CommonEvent
;784:=================
;785:*/
;786:static void StartServer_ItemPage_Old_CommonEvent( void* ptr, int event )
;787:{
line 788
;788:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $297
line 789
;789:		return;
ADDRGP4 $296
JUMPV
LABELV $297
line 792
;790:	}
;791:
;792:	StartServer_ItemPage_Old_Save();
ADDRGP4 StartServer_ItemPage_Old_Save
CALLV
pop
line 793
;793:	switch( ((menucommon_s*)ptr)->id )
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
LTI4 $299
ADDRLP4 0
INDIRI4
CNSTI4 15
GTI4 $299
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $307-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $307
address $305
address $306
address $302
address $299
address $303
address $304
code
line 794
;794:	{
LABELV $302
line 796
;795:		case ID_SERVERCOMMON_SERVER:
;796:			StartServer_ServerPage_MenuInit();
ADDRGP4 StartServer_ServerPage_MenuInit
CALLV
pop
line 797
;797:			break;
ADDRGP4 $300
JUMPV
LABELV $303
line 800
;798:
;799:		case ID_SERVERCOMMON_BOTS:
;800:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 801
;801:			break;
ADDRGP4 $300
JUMPV
LABELV $304
line 804
;802:
;803:		case ID_SERVERCOMMON_MAPS:
;804:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 805
;805:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 806
;806:			break;
ADDRGP4 $300
JUMPV
LABELV $305
line 809
;807:
;808:		case ID_SERVERCOMMON_BACK:
;809:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 810
;810:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 811
;811:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 812
;812:			break;
ADDRGP4 $300
JUMPV
LABELV $306
line 815
;813:
;814:		case ID_SERVERCOMMON_FIGHT:
;815:			StartServer_CreateServer(NULL);
CNSTP4 0
ARGP4
ADDRGP4 StartServer_CreateServer
CALLI4
pop
line 816
;816:			break;
LABELV $299
LABELV $300
line 818
;817:	}
;818:}
LABELV $296
endproc StartServer_ItemPage_Old_CommonEvent 8 4
proc StartServer_ItemPage_Old_DrawItemButton 68 20
line 828
;819:
;820:
;821:
;822:/*
;823:=================
;824:StartServer_ItemPage_Old_DrawItemButton
;825:=================
;826:*/
;827:static void StartServer_ItemPage_Old_DrawItemButton( void* ptr )
;828:{
line 839
;829:	int	x;
;830:	int y;
;831:	float *color;
;832:	int	style;
;833:	qboolean focus;
;834:	menuradiobutton_s *rb;
;835:	char* iconname;
;836:	qhandle_t	icon;
;837:	vec4_t gcolor;
;838:
;839:	rb = (menuradiobutton_s*)ptr;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 840
;840:	x = rb->generic.x;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 841
;841:	y = rb->generic.y;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 843
;842:
;843:	gcolor[0] = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 844
;844:	gcolor[1] = 1.0;
ADDRLP4 4+4
CNSTF4 1065353216
ASGNF4
line 845
;845:	gcolor[2] = 1.0;
ADDRLP4 4+8
CNSTF4 1065353216
ASGNF4
line 846
;846:	gcolor[3] = 1.0;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 849
;847:
;848:	// load the icon
;849:	iconname = bg_itemlist[ s_itemcontrols_old.itemCtrl[rb->generic.id].bg_index ].icon;
ADDRLP4 36
CNSTI4 56
CNSTI4 104
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+100
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+24
ADDP4
INDIRP4
ASGNP4
line 850
;850:	icon = trap_R_RegisterShaderNoMip(va("uie_%s", iconname));
ADDRGP4 $316
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
line 851
;851:	if (!icon)
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $317
line 852
;852:		icon = trap_R_RegisterShaderNoMip(iconname);
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
LABELV $317
line 855
;853:
;854:	// setup text colour states
;855:	focus = (rb->generic.parent->cursor == rb->generic.menuPosition);
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
NEI4 $320
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRGP4 $321
JUMPV
LABELV $320
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $321
ADDRLP4 44
ADDRLP4 60
INDIRI4
ASGNI4
line 856
;856:	if ( rb->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $322
line 857
;857:	{
line 858
;858:		gcolor[3] = 0.3;
ADDRLP4 4+12
CNSTF4 1050253722
ASGNF4
line 859
;859:		color = text_color_disabled;
ADDRLP4 32
ADDRGP4 text_color_disabled
ASGNP4
line 860
;860:		style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 40
CNSTI4 16
ASGNI4
line 861
;861:	}
ADDRGP4 $323
JUMPV
LABELV $322
line 862
;862:	else if ( focus )
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $325
line 863
;863:	{
line 864
;864:		color = text_color_highlight;
ADDRLP4 32
ADDRGP4 text_color_highlight
ASGNP4
line 865
;865:		style = UI_LEFT|UI_PULSE|UI_SMALLFONT;
ADDRLP4 40
CNSTI4 16400
ASGNI4
line 866
;866:	}
ADDRGP4 $326
JUMPV
LABELV $325
line 868
;867:	else
;868:	{
line 869
;869:		color = text_color_normal;
ADDRLP4 32
ADDRGP4 text_color_normal
ASGNP4
line 870
;870:		style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 40
CNSTI4 16
ASGNI4
line 871
;871:	}
LABELV $326
LABELV $323
line 874
;872:
;873:	// draw it!
;874:	if ( rb->generic.name )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $327
line 875
;875:		UI_DrawString( x - SMALLCHAR_WIDTH, y, rb->generic.name, UI_RIGHT|UI_SMALLFONT, color );
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
LABELV $327
line 877
;876:
;877:	if ( !rb->curvalue )
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
NEI4 $330
line 878
;878:	{
line 879
;879:		gcolor[3] = 0.3;
ADDRLP4 4+12
CNSTF4 1050253722
ASGNF4
line 880
;880:		UI_DrawString( x + 16, y, "off", style, color );
ADDRLP4 20
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $333
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
line 881
;881:	}
ADDRGP4 $331
JUMPV
LABELV $330
line 883
;882:	else
;883:	{
line 884
;884:		UI_DrawString( x + 16, y, "on", style, color );
ADDRLP4 20
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $334
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
line 885
;885:	}
LABELV $331
line 887
;886:
;887:	trap_R_SetColor(gcolor);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 889
;888:	// square image, always
;889:	UI_DrawHandlePic( x - 5, y, SMALLCHAR_HEIGHT, SMALLCHAR_HEIGHT, icon);
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
line 890
;890:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 891
;891:}
LABELV $309
endproc StartServer_ItemPage_Old_DrawItemButton 68 20
proc StartServer_ItemPage_Old_MenuDraw 12 20
line 902
;892:
;893:
;894:
;895:
;896:/*
;897:=================
;898:StartServer_ItemPage_Old_MenuDraw
;899:=================
;900:*/
;901:static void StartServer_ItemPage_Old_MenuDraw(void)
;902:{
line 906
;903:	int i;
;904:	int style;
;905:
;906:	if (uis.firstdraw) {
ADDRGP4 uis+11496
INDIRI4
CNSTI4 0
EQI4 $338
line 908
;907:		// put all the data in place
;908:		if (s_itemcontrols_old.ingame_menu) {
ADDRGP4 s_itemcontrols_old+9204
INDIRI4
CNSTI4 0
EQI4 $341
line 909
;909:			StartServer_InGame_Old_Init();
ADDRGP4 StartServer_InGame_Old_Init
CALLV
pop
line 910
;910:		}
ADDRGP4 $342
JUMPV
LABELV $341
line 911
;911:		else {
line 912
;912:			StartServer_ItemPage_Old_Load();
ADDRGP4 StartServer_ItemPage_Old_Load
CALLV
pop
line 913
;913:		}
LABELV $342
line 915
;914:
;915:		StartServer_ItemPage_Old_UpdateInterface();
ADDRGP4 StartServer_ItemPage_Old_UpdateInterface
CALLV
pop
line 916
;916:	}
LABELV $338
line 918
;917:
;918:	StartServer_BackgroundDraw(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 StartServer_BackgroundDraw
CALLV
pop
line 921
;919:
;920:
;921:	style = UI_SMALLFONT|UI_DROPSHADOW|UI_INVERSE;
ADDRLP4 4
CNSTI4 10256
ASGNI4
line 922
;922:	for (i = 0; i < groupInfo_Size; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $347
JUMPV
LABELV $344
line 923
;923:	{
line 924
;924:		if (!groupInfo[i].title)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 groupInfo+8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $348
line 925
;925:			continue;
ADDRGP4 $345
JUMPV
LABELV $348
line 927
;926:
;927:		UI_DrawString( groupInfo[i].x, groupInfo[i].y, groupInfo[i].title, style, color_red );
ADDRLP4 8
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 groupInfo+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRGP4 groupInfo+16
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRGP4 groupInfo+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 928
;928:	}
LABELV $345
line 922
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $347
ADDRLP4 0
INDIRI4
ADDRGP4 groupInfo_Size
INDIRI4
LTI4 $344
line 931
;929:
;930:	// draw the controls
;931:	Menu_Draw(&s_itemcontrols_old.menu);
ADDRGP4 s_itemcontrols_old
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 932
;932:}
LABELV $337
endproc StartServer_ItemPage_Old_MenuDraw 12 20
proc StartServer_ItemPage_Old_GroupEvent 8 0
line 945
;933:
;934:
;935:
;936:
;937:/*
;938:=================
;939:StartServer_ItemPage_Old_GroupEvent
;940:
;941:Syncs array with data control value
;942:=================
;943:*/
;944:static void StartServer_ItemPage_Old_GroupEvent( void* ptr, int event )
;945:{
line 949
;946:	menulist_s* l;
;947:	iteminfo_t* item;
;948:
;949:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $355
line 950
;950:		return;
ADDRGP4 $354
JUMPV
LABELV $355
line 953
;951:
;952:	// store the value of the control
;953:	l = (menulist_s*)ptr;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 954
;954:	item = s_itemcontrols_old.itemCtrl[ l->generic.id ].item;
ADDRLP4 4
CNSTI4 104
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+96
ADDP4
INDIRP4
ASGNP4
line 955
;955:	if (item)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $359
line 956
;956:		s_itemcontrols_old.grouptype[ item->ident ] = l->curvalue;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9224
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
LABELV $359
line 958
;957:
;958:	StartServer_ItemPage_Old_UpdateInterface();
ADDRGP4 StartServer_ItemPage_Old_UpdateInterface
CALLV
pop
line 959
;959:}
LABELV $354
endproc StartServer_ItemPage_Old_GroupEvent 8 0
proc StartServer_ItemPage_Old_ItemEvent 8 0
line 973
;960:
;961:
;962:
;963:
;964:/*
;965:=================
;966:StartServer_ItemPage_Old_ItemEvent
;967:
;968:Only called when the control is enabled,
;969:so it must be the custom setting
;970:=================
;971:*/
;972:static void StartServer_ItemPage_Old_ItemEvent( void* ptr, int event )
;973:{
line 977
;974:	menuradiobutton_s* rb;
;975:	iteminfo_t* item;
;976:
;977:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $363
line 978
;978:		return;
ADDRGP4 $362
JUMPV
LABELV $363
line 981
;979:
;980:	// store the value of the control in server_itemlist[]
;981:	rb = (menuradiobutton_s*)ptr;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 982
;982:	item = s_itemcontrols_old.itemCtrl[ rb->generic.id ].item;
ADDRLP4 4
CNSTI4 104
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+96
ADDP4
INDIRP4
ASGNP4
line 984
;983:
;984:	if (item)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $367
line 985
;985:		s_itemcontrols_old.enabled[ item->ident ] = rb->curvalue;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_itemcontrols_old+9220
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ASGNI4
LABELV $367
line 986
;986:}
LABELV $362
endproc StartServer_ItemPage_Old_ItemEvent 8 0
proc StartServer_BothItemMenus_Old_Event 8 4
line 997
;987:
;988:
;989:
;990:
;991:/*
;992:=================
;993:StartServer_BothItemMenus_Old_Event
;994:=================
;995:*/
;996:static void StartServer_BothItemMenus_Old_Event( void* ptr, int event )
;997:{
line 998
;998:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $371
line 999
;999:		return;
ADDRGP4 $370
JUMPV
LABELV $371
line 1001
;1000:
;1001:	switch (((menucommon_s*)ptr)->id) {
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
EQI4 $376
ADDRLP4 0
INDIRI4
CNSTI4 403
EQI4 $377
ADDRGP4 $373
JUMPV
LABELV $376
line 1003
;1002:	case ID_ITEM_RESET:
;1003:		StartServer_ItemPage_Old_ResetAll(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 StartServer_ItemPage_Old_ResetAll
CALLV
pop
line 1004
;1004:		StartServer_ItemPage_Old_UpdateInterface();
ADDRGP4 StartServer_ItemPage_Old_UpdateInterface
CALLV
pop
line 1005
;1005:		break;
ADDRGP4 $374
JUMPV
LABELV $377
line 1008
;1006:
;1007:	case ID_ITEM_CLEAR:
;1008:		StartServer_ItemPage_Old_ResetAll(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 StartServer_ItemPage_Old_ResetAll
CALLV
pop
line 1009
;1009:		StartServer_ItemPage_Old_UpdateInterface();
ADDRGP4 StartServer_ItemPage_Old_UpdateInterface
CALLV
pop
line 1010
;1010:		break;
LABELV $373
LABELV $374
line 1012
;1011:	}
;1012:}
LABELV $370
endproc StartServer_BothItemMenus_Old_Event 8 4
proc StartServer_ItemPage_Old_Event 4 4
line 1022
;1013:
;1014:
;1015:
;1016:/*
;1017:=================
;1018:StartServer_ItemPage_Old_Event
;1019:=================
;1020:*/
;1021:static void StartServer_ItemPage_Old_Event( void* ptr, int event )
;1022:{
line 1023
;1023:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $379
line 1024
;1024:		return;
ADDRGP4 $378
JUMPV
LABELV $379
line 1026
;1025:
;1026:	switch (((menucommon_s*)ptr)->id) {
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
EQI4 $384
ADDRGP4 $381
JUMPV
LABELV $384
line 1028
;1027:	case ID_ITEM_GAMETYPE:
;1028:		StartServer_SaveScriptData();
ADDRGP4 StartServer_SaveScriptData
CALLV
pop
line 1030
;1029:
;1030:		StartServer_LoadScriptDataFromType(s_itemcontrols_old.gameType.curvalue);
ADDRGP4 s_itemcontrols_old+2848+92
INDIRI4
ARGI4
ADDRGP4 StartServer_LoadScriptDataFromType
CALLV
pop
line 1032
;1031:
;1032:		StartServer_BothItemPage_Old_InitControls();
ADDRGP4 StartServer_BothItemPage_Old_InitControls
CALLV
pop
line 1033
;1033:		StartServer_ItemPage_Old_UpdateInterface();
ADDRGP4 StartServer_ItemPage_Old_UpdateInterface
CALLV
pop
line 1034
;1034:		break;
LABELV $381
LABELV $382
line 1036
;1035:	}
;1036:}
LABELV $378
endproc StartServer_ItemPage_Old_Event 4 4
proc StartServer_ItemPage_Old_MenuKey 12 8
line 1046
;1037:
;1038:
;1039:
;1040:/*
;1041:=================
;1042:StartServer_ItemPage_Old_MenuKey
;1043:=================
;1044:*/
;1045:static sfxHandle_t StartServer_ItemPage_Old_MenuKey( int key )
;1046:{
line 1047
;1047:	switch (key)
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
EQI4 $390
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $388
LABELV $394
ADDRFP4 0
INDIRI4
CNSTI4 179
EQI4 $390
ADDRGP4 $388
JUMPV
line 1048
;1048:	{
LABELV $390
line 1051
;1049:		case K_MOUSE2:
;1050:		case K_ESCAPE:
;1051:			if (!s_itemcontrols_old.ingame_menu) {
ADDRGP4 s_itemcontrols_old+9204
INDIRI4
CNSTI4 0
NEI4 $389
line 1052
;1052:				StartServer_ItemPage_Old_Save();
ADDRGP4 StartServer_ItemPage_Old_Save
CALLV
pop
line 1053
;1053:				UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1054
;1054:				UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1055
;1055:			}
line 1056
;1056:			break;
LABELV $388
LABELV $389
line 1059
;1057:	}
;1058:
;1059:	return ( Menu_DefaultKey( &s_itemcontrols_old.menu, key ) );
ADDRGP4 s_itemcontrols_old
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
LABELV $387
endproc StartServer_ItemPage_Old_MenuKey 12 8
proc StartServer_Old_GetItemFromMapObject 8 8
line 1071
;1060:}
;1061:
;1062:
;1063:
;1064:
;1065:/*
;1066:=================
;1067:StartServer_Old_GetItemFromMapObject
;1068:=================
;1069:*/
;1070:static int StartServer_Old_GetItemFromMapObject(const char* ident)
;1071:{
line 1074
;1072:	int i;
;1073:
;1074:	for (i = 0; i < bg_numItems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $399
JUMPV
LABELV $396
line 1075
;1075:	{
line 1076
;1076:		if (!Q_stricmp(ident, bg_itemlist[i].classname))
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
NEI4 $400
line 1077
;1077:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $395
JUMPV
LABELV $400
line 1078
;1078:	}
LABELV $397
line 1074
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $399
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $396
line 1080
;1079:
;1080:	Com_Printf("bg_itemlist, unknown type: %s\n", ident);
ADDRGP4 $402
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1081
;1081:	return 0;
CNSTI4 0
RETI4
LABELV $395
endproc StartServer_Old_GetItemFromMapObject 8 8
proc StartServer_ItemPage_Old_AddMasterControls 32 0
line 1093
;1082:}
;1083:
;1084:
;1085:
;1086:
;1087:/*
;1088:=================
;1089:StartServer_ItemPage_Old_AddMasterControl
;1090:=================
;1091:*/
;1092:static void StartServer_ItemPage_Old_AddMasterControls(int y)
;1093:{
line 1097
;1094:	int x, dy;
;1095:	int i;
;1096:
;1097:	s_itemcontrols_old.nummasters = 0;
ADDRGP4 s_itemcontrols_old+9208
CNSTI4 0
ASGNI4
line 1099
;1098:
;1099:	for (i = 0 ; i < masterControl_old_Size; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $408
JUMPV
LABELV $405
line 1100
;1100:	{
line 1101
;1101:		x = GAMETYPECOLUMN_X + ((i / 2) - 1) * SMALLCHAR_WIDTH * 22;
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
line 1102
;1102:		dy = (i % 2) * LINE_HEIGHT;
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
line 1104
;1103:
;1104:		s_itemcontrols_old.groupMaster[i].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3096
ADDP4
CNSTI4 3
ASGNI4
line 1105
;1105:		s_itemcontrols_old.groupMaster[i].generic.id		= i;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3096+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1106
;1106:		s_itemcontrols_old.groupMaster[i].generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3096+72
ADDP4
CNSTU4 258
ASGNU4
line 1107
;1107:		s_itemcontrols_old.groupMaster[i].generic.callback	= StartServer_ItemPage_Old_GroupEvent;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3096+76
ADDP4
ADDRGP4 StartServer_ItemPage_Old_GroupEvent
ASGNP4
line 1108
;1108:		s_itemcontrols_old.groupMaster[i].generic.x		= x;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3096+28
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1109
;1109:		s_itemcontrols_old.groupMaster[i].generic.y		= y + dy;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3096+32
ADDP4
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1110
;1110:		s_itemcontrols_old.groupMaster[i].generic.name		= masterControl_old[i].title;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3096+4
ADDP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 masterControl_old+4
ADDP4
INDIRP4
ASGNP4
line 1111
;1111:		s_itemcontrols_old.groupMaster[i].itemnames		= allgroups_items_old;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3096+104
ADDP4
ADDRGP4 allgroups_items_old
ASGNP4
line 1113
;1112:
;1113:		masterControl_old[i].control = &s_itemcontrols_old.groupMaster[i];
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 masterControl_old+8
ADDP4
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3096
ADDP4
ASGNP4
line 1115
;1114:
;1115:		s_itemcontrols_old.nummasters++;
ADDRLP4 28
ADDRGP4 s_itemcontrols_old+9208
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1116
;1116:	}
LABELV $406
line 1099
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $408
ADDRLP4 0
INDIRI4
ADDRGP4 masterControl_old_Size
INDIRI4
LTI4 $405
line 1117
;1117:}
LABELV $403
endproc StartServer_ItemPage_Old_AddMasterControls 32 0
proc StartServer_ItemPage_Old_RegisterGroup 56 16
line 1133
;1118:
;1119:
;1120:
;1121:
;1122:
;1123:
;1124:/*
;1125:=================
;1126:StartServer_ItemPage_Old_Register
;1127:
;1128:Always work in units of LINE_HEIGHT so left and right
;1129:columns are always aligned
;1130:=================
;1131:*/
;1132:static int StartServer_ItemPage_Old_RegisterGroup(groupposition_t* gp, int y)
;1133:{
line 1141
;1134:	int id;
;1135:	int x;
;1136:	int dy;
;1137:	int index, ident;
;1138:	groupinfo_t* g;
;1139:	itemnode_t* node;
;1140:
;1141:	g = gp->group;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 1142
;1142:	if (!g)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $431
line 1143
;1143:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $430
JUMPV
LABELV $431
line 1145
;1144:
;1145:	x = 160 * gp->position;
ADDRLP4 24
CNSTI4 160
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
MULI4
ASGNI4
line 1146
;1146:	if (gp->title) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $433
line 1147
;1147:		gp->x = x + 8;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 1148
;1148:		gp->y = y - PROP_HEIGHT * UI_ProportionalSizeScale( UI_SMALLFONT, 0 );
ADDRLP4 28
CNSTI4 16
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 32
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 1149
;1149:	}
LABELV $433
line 1151
;1150:
;1151:	dy = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1152
;1152:	index = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $437
JUMPV
LABELV $436
line 1154
;1153:	while (index < g->size)
;1154:	{
line 1155
;1155:		ident = g->itemlist[index].ident;
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ADDP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1156
;1156:		node = &server_itemlist[ ident ];
ADDRLP4 16
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 server_itemlist
ADDP4
ASGNP4
line 1157
;1157:		if (node->groupid != g->ident)
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
EQI4 $439
line 1158
;1158:		{
line 1159
;1159:			Com_Printf("Item in wrong group: %s expected %i, got %i\n",
ADDRGP4 $441
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1161
;1160:				node->mapitem, g->ident, node->groupid);
;1161:		}
LABELV $439
line 1163
;1162:
;1163:		id = s_itemcontrols_old.numitems;
ADDRLP4 0
ADDRGP4 s_itemcontrols_old+9212
INDIRI4
ASGNI4
line 1164
;1164:		s_itemcontrols_old.itemCtrl[id].control.generic.type	= MTYPE_RADIOBUTTON;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888
ADDP4
CNSTI4 5
ASGNI4
line 1165
;1165:		s_itemcontrols_old.itemCtrl[id].control.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+72
ADDP4
CNSTU4 258
ASGNU4
line 1166
;1166:		s_itemcontrols_old.itemCtrl[id].control.generic.name 	= g->itemlist[index].name;
ADDRLP4 32
CNSTI4 4
ASGNI4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+4
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 1167
;1167:		s_itemcontrols_old.itemCtrl[id].control.generic.callback	= StartServer_ItemPage_Old_ItemEvent;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+76
ADDP4
ADDRGP4 StartServer_ItemPage_Old_ItemEvent
ASGNP4
line 1168
;1168:		s_itemcontrols_old.itemCtrl[id].control.generic.ownerdraw = StartServer_ItemPage_Old_DrawItemButton;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+84
ADDP4
ADDRGP4 StartServer_ItemPage_Old_DrawItemButton
ASGNP4
line 1169
;1169:		s_itemcontrols_old.itemCtrl[id].control.generic.id		= id;	// self index
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1170
;1170:		s_itemcontrols_old.itemCtrl[id].control.generic.x		= x + 13*SMALLCHAR_WIDTH;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+28
ADDP4
ADDRLP4 24
INDIRI4
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1171
;1171:		s_itemcontrols_old.itemCtrl[id].control.generic.y		= y + dy;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+32
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 1173
;1172:
;1173:		s_itemcontrols_old.itemCtrl[id].item = &g->itemlist[index];
ADDRLP4 40
CNSTI4 4
ASGNI4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+96
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRP4
ADDP4
ASGNP4
line 1174
;1174:		s_itemcontrols_old.itemCtrl[id].bg_index = StartServer_Old_GetItemFromMapObject(server_itemlist[ident].mapitem);
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 server_itemlist+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 StartServer_Old_GetItemFromMapObject
CALLI4
ASGNI4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888+100
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 1176
;1175:
;1176:		g->itemlist[index].control = &s_itemcontrols_old.itemCtrl[id].control;
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LSHI4
ADDRLP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888
ADDP4
ASGNP4
line 1178
;1177:
;1178:		s_itemcontrols_old.numitems++;
ADDRLP4 52
ADDRGP4 s_itemcontrols_old+9212
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1179
;1179:		index++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1180
;1180:		dy += LINE_HEIGHT;
ADDRLP4 20
ADDRLP4 20
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1181
;1181:	}
LABELV $437
line 1153
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $436
line 1183
;1182:
;1183:	dy += 3*LINE_HEIGHT;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 3
ADDRGP4 cl_smallcharheight+12
INDIRI4
MULI4
CNSTI4 6
ADDI4
ADDI4
ASGNI4
line 1185
;1184:
;1185:	return dy;
ADDRLP4 20
INDIRI4
RETI4
LABELV $430
endproc StartServer_ItemPage_Old_RegisterGroup 56 16
proc StartServer_ItemPage_Old_SetupItemControls 48 8
line 1200
;1186:}
;1187:
;1188:
;1189:
;1190:
;1191:
;1192:
;1193:
;1194:/*
;1195:=================
;1196:StartServer_ItemPage_Old_SetupItemControls
;1197:=================
;1198:*/
;1199:static int StartServer_ItemPage_Old_SetupItemControls(int y)
;1200:{
line 1206
;1201:	int col_y[GRCOL_COUNT];
;1202:	int i;
;1203:	int pos;
;1204:	int max;
;1205:
;1206:	for (i = 0; i < GRCOL_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $469
line 1207
;1207:		col_y[i] = y;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
LABELV $470
line 1206
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $469
line 1209
;1208:
;1209:	for (i = 0; i < groupInfo_Size; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $476
JUMPV
LABELV $473
line 1210
;1210:	{
line 1211
;1211:		switch (groupInfo[i].resync)
ADDRLP4 28
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 groupInfo+20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $478
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $481
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $490
ADDRGP4 $477
JUMPV
line 1212
;1212:		{
LABELV $481
line 1214
;1213:		case SYNC_LEFT:
;1214:			if (col_y[GRCOL_LEFT] > col_y[GRCOL_MIDLEFT]) {
ADDRLP4 4
INDIRI4
ADDRLP4 4+4
INDIRI4
LEI4 $482
line 1215
;1215:				col_y[GRCOL_MIDLEFT] = col_y[GRCOL_LEFT];
ADDRLP4 4+4
ADDRLP4 4
INDIRI4
ASGNI4
line 1216
;1216:			}
ADDRGP4 $478
JUMPV
LABELV $482
line 1217
;1217:			else if (col_y[GRCOL_MIDLEFT] > col_y[GRCOL_LEFT]) {
ADDRLP4 4+4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $478
line 1218
;1218:				col_y[GRCOL_LEFT] = col_y[GRCOL_MIDLEFT];
ADDRLP4 4
ADDRLP4 4+4
INDIRI4
ASGNI4
line 1219
;1219:			}
line 1220
;1220:			break;
ADDRGP4 $478
JUMPV
LABELV $490
line 1222
;1221:		case SYNC_RIGHT:
;1222:			if (col_y[GRCOL_RIGHT] > col_y[GRCOL_MIDRIGHT]) {
ADDRLP4 4+12
INDIRI4
ADDRLP4 4+8
INDIRI4
LEI4 $491
line 1223
;1223:				col_y[GRCOL_MIDRIGHT] = col_y[GRCOL_RIGHT];
ADDRLP4 4+8
ADDRLP4 4+12
INDIRI4
ASGNI4
line 1224
;1224:			}
ADDRGP4 $478
JUMPV
LABELV $491
line 1225
;1225:			else if (col_y[GRCOL_MIDRIGHT] > col_y[GRCOL_RIGHT]) {
ADDRLP4 4+8
INDIRI4
ADDRLP4 4+12
INDIRI4
LEI4 $478
line 1226
;1226:				col_y[GRCOL_RIGHT] = col_y[GRCOL_MIDRIGHT];
ADDRLP4 4+12
ADDRLP4 4+8
INDIRI4
ASGNI4
line 1227
;1227:			}
line 1228
;1228:			break;
line 1230
;1229:		case SYNC_NONE:
;1230:			break;
LABELV $477
LABELV $478
line 1233
;1231:		}
;1232:
;1233:		pos = groupInfo[i].position;
ADDRLP4 20
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 groupInfo+4
ADDP4
INDIRI4
ASGNI4
line 1234
;1234:		col_y[pos] += StartServer_ItemPage_Old_RegisterGroup(&groupInfo[i], col_y[pos]);
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 groupInfo
ADDP4
ARGP4
ADDRLP4 36
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 StartServer_ItemPage_Old_RegisterGroup
CALLI4
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ASGNI4
line 1235
;1235:	}
LABELV $474
line 1209
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $476
ADDRLP4 0
INDIRI4
ADDRGP4 groupInfo_Size
INDIRI4
LTI4 $473
line 1237
;1236:
;1237:	max = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 1238
;1238:	for (i = 0; i < GRCOL_COUNT; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $505
line 1239
;1239:		if (col_y[i] > max)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $509
line 1240
;1240:			max = col_y[i];
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
LABELV $509
LABELV $506
line 1238
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $505
line 1242
;1241:
;1242:	return max;
ADDRLP4 24
INDIRI4
RETI4
LABELV $468
endproc StartServer_ItemPage_Old_SetupItemControls 48 8
export StartServer_ItemPage_MenuInit_OldMenu
proc StartServer_ItemPage_MenuInit_OldMenu 48 16
line 1253
;1243:}
;1244:
;1245:
;1246:
;1247:/*
;1248:=================
;1249:StartServer_ItemPage_MenuInit_OldMenu
;1250:=================
;1251:*/
;1252:void StartServer_ItemPage_MenuInit_OldMenu(qboolean ingame)
;1253:{
line 1260
;1254:	menuframework_s* menuptr;
;1255:	int i;
;1256:	int x, y, dy, left_y, right_y;
;1257:	int count, index;
;1258:	char* text;
;1259:
;1260:	memset(&s_itemcontrols_old, 0, sizeof(itemcontrols_t));
ADDRGP4 s_itemcontrols_old
ARGP4
CNSTI4 0
ARGI4
CNSTI4 9228
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1262
;1261:
;1262:	StartServer_MapPage_Cache();
ADDRGP4 StartServer_MapPage_Cache
CALLV
pop
line 1264
;1263:
;1264:	menuptr = &s_itemcontrols_old.menu;
ADDRLP4 4
ADDRGP4 s_itemcontrols_old
ASGNP4
line 1266
;1265:
;1266:	menuptr->key = StartServer_ItemPage_Old_MenuKey;
ADDRLP4 4
INDIRP4
CNSTI4 1040
ADDP4
ADDRGP4 StartServer_ItemPage_Old_MenuKey
ASGNP4
line 1267
;1267:	menuptr->wrapAround = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1044
ADDP4
CNSTI4 1
ASGNI4
line 1268
;1268:	menuptr->native 	= qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 1056
ADDP4
CNSTI4 0
ASGNI4
line 1269
;1269:	menuptr->fullscreen = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 1052
ADDP4
CNSTI4 1
ASGNI4
line 1270
;1270:	menuptr->draw = StartServer_ItemPage_Old_MenuDraw;
ADDRLP4 4
INDIRP4
CNSTI4 1036
ADDP4
ADDRGP4 StartServer_ItemPage_Old_MenuDraw
ASGNP4
line 1272
;1271:
;1272:	y = GAMETYPEROW_Y;
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
line 1273
;1273:	s_itemcontrols_old.ingame_menu = ingame;
ADDRGP4 s_itemcontrols_old+9204
ADDRFP4 0
INDIRI4
ASGNI4
line 1276
;1274:
;1275:	// menu type specific initialization
;1276:	if (ingame) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $514
line 1277
;1277:		s_itemcontrols_old.ingame.title.generic.type     = MTYPE_BTEXT;
ADDRGP4 s_itemcontrols_old+2408
CNSTI4 10
ASGNI4
line 1278
;1278:		s_itemcontrols_old.ingame.title.generic.x		= 320;
ADDRGP4 s_itemcontrols_old+2408+28
CNSTI4 320
ASGNI4
line 1279
;1279:		s_itemcontrols_old.ingame.title.generic.y		= 4;
ADDRGP4 s_itemcontrols_old+2408+32
CNSTI4 4
ASGNI4
line 1280
;1280:		s_itemcontrols_old.ingame.title.string			= "DISABLE ITEMS";
ADDRGP4 s_itemcontrols_old+2408+88
ADDRGP4 $523
ASGNP4
line 1281
;1281:		s_itemcontrols_old.ingame.title.color			= color_red;
ADDRGP4 s_itemcontrols_old+2408+100
ADDRGP4 color_red
ASGNP4
line 1282
;1282:		s_itemcontrols_old.ingame.title.style			= UI_CENTER;
ADDRGP4 s_itemcontrols_old+2408+92
CNSTI4 1
ASGNI4
line 1284
;1283:
;1284:		s_itemcontrols_old.ingame.cancel.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_itemcontrols_old+2408+104
CNSTI4 6
ASGNI4
line 1285
;1285:		s_itemcontrols_old.ingame.cancel.generic.name     = INGAME_CANCEL0;
ADDRGP4 s_itemcontrols_old+2408+104+4
ADDRGP4 $533
ASGNP4
line 1286
;1286:		s_itemcontrols_old.ingame.cancel.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_itemcontrols_old+2408+104+72
CNSTU4 260
ASGNU4
line 1287
;1287:		s_itemcontrols_old.ingame.cancel.generic.callback = StartServer_InGame_Old_Event;
ADDRGP4 s_itemcontrols_old+2408+104+76
ADDRGP4 StartServer_InGame_Old_Event
ASGNP4
line 1288
;1288:		s_itemcontrols_old.ingame.cancel.generic.id	    = ID_ITEMINGAME_CANCEL;
ADDRGP4 s_itemcontrols_old+2408+104+24
CNSTI4 430
ASGNI4
line 1289
;1289:		s_itemcontrols_old.ingame.cancel.generic.x		= 0;
ADDRGP4 s_itemcontrols_old+2408+104+28
CNSTI4 0
ASGNI4
line 1290
;1290:		s_itemcontrols_old.ingame.cancel.generic.y		= 480-64;
ADDRGP4 s_itemcontrols_old+2408+104+32
CNSTI4 416
ASGNI4
line 1291
;1291:		s_itemcontrols_old.ingame.cancel.width  		    = 128;
ADDRGP4 s_itemcontrols_old+2408+104+104
CNSTI4 128
ASGNI4
line 1292
;1292:		s_itemcontrols_old.ingame.cancel.height  		    = 64;
ADDRGP4 s_itemcontrols_old+2408+104+108
CNSTI4 64
ASGNI4
line 1293
;1293:		s_itemcontrols_old.ingame.cancel.focuspic         = INGAME_CANCEL1;
ADDRGP4 s_itemcontrols_old+2408+104+88
ADDRGP4 $558
ASGNP4
line 1295
;1294:
;1295:		s_itemcontrols_old.ingame.accept.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_itemcontrols_old+2408+220
CNSTI4 6
ASGNI4
line 1296
;1296:		s_itemcontrols_old.ingame.accept.generic.name     = INGAME_ACCEPT0;
ADDRGP4 s_itemcontrols_old+2408+220+4
ADDRGP4 $564
ASGNP4
line 1297
;1297:		s_itemcontrols_old.ingame.accept.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_itemcontrols_old+2408+220+72
CNSTU4 260
ASGNU4
line 1298
;1298:		s_itemcontrols_old.ingame.accept.generic.callback = StartServer_InGame_Old_Event;
ADDRGP4 s_itemcontrols_old+2408+220+76
ADDRGP4 StartServer_InGame_Old_Event
ASGNP4
line 1299
;1299:		s_itemcontrols_old.ingame.accept.generic.id	    = ID_ITEMINGAME_ACCEPT;
ADDRGP4 s_itemcontrols_old+2408+220+24
CNSTI4 431
ASGNI4
line 1300
;1300:		s_itemcontrols_old.ingame.accept.generic.x		= 640 - 128;
ADDRGP4 s_itemcontrols_old+2408+220+28
CNSTI4 512
ASGNI4
line 1301
;1301:		s_itemcontrols_old.ingame.accept.generic.y		= 480-64;
ADDRGP4 s_itemcontrols_old+2408+220+32
CNSTI4 416
ASGNI4
line 1302
;1302:		s_itemcontrols_old.ingame.accept.width  		    = 128;
ADDRGP4 s_itemcontrols_old+2408+220+104
CNSTI4 128
ASGNI4
line 1303
;1303:		s_itemcontrols_old.ingame.accept.height  		    = 64;
ADDRGP4 s_itemcontrols_old+2408+220+108
CNSTI4 64
ASGNI4
line 1304
;1304:		s_itemcontrols_old.ingame.accept.focuspic         = INGAME_ACCEPT1;
ADDRGP4 s_itemcontrols_old+2408+220+88
ADDRGP4 $589
ASGNP4
line 1306
;1305:
;1306:		s_itemcontrols_old.ingame.info.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_itemcontrols_old+2408+336
CNSTI4 9
ASGNI4
line 1307
;1307:		s_itemcontrols_old.ingame.info.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_itemcontrols_old+2408+336+72
CNSTU4 16384
ASGNU4
line 1308
;1308:		s_itemcontrols_old.ingame.info.generic.x		= 320;
ADDRGP4 s_itemcontrols_old+2408+336+28
CNSTI4 320
ASGNI4
line 1309
;1309:		s_itemcontrols_old.ingame.info.generic.y		= 480 - 64 - 36;
ADDRGP4 s_itemcontrols_old+2408+336+32
CNSTI4 380
ASGNI4
line 1310
;1310:		s_itemcontrols_old.ingame.info.string			= "Requires RESTART or NEXT MAP";
ADDRGP4 s_itemcontrols_old+2408+336+88
ADDRGP4 $604
ASGNP4
line 1311
;1311:		s_itemcontrols_old.ingame.info.color			= color_red;
ADDRGP4 s_itemcontrols_old+2408+336+100
ADDRGP4 color_red
ASGNP4
line 1312
;1312:		s_itemcontrols_old.ingame.info.style			= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_itemcontrols_old+2408+336+92
CNSTI4 17
ASGNI4
line 1314
;1313:
;1314:		Menu_AddItem( menuptr, &s_itemcontrols_old.ingame.title);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols_old+2408
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1315
;1315:		Menu_AddItem( menuptr, &s_itemcontrols_old.ingame.cancel);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols_old+2408+104
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1316
;1316:		Menu_AddItem( menuptr, &s_itemcontrols_old.ingame.accept);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols_old+2408+220
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1317
;1317:		Menu_AddItem( menuptr, &s_itemcontrols_old.ingame.info);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols_old+2408+336
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1319
;1318:
;1319:		y -= LINE_HEIGHT;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
SUBI4
ASGNI4
line 1320
;1320:	}
ADDRGP4 $515
JUMPV
LABELV $514
line 1321
;1321:	else {
line 1322
;1322:		StartServer_CommonControls_Init(menuptr, &s_itemcontrols_old.common, StartServer_ItemPage_Old_CommonEvent, COMMONCTRL_ITEMS);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols_old+1076
ARGP4
ADDRGP4 StartServer_ItemPage_Old_CommonEvent
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 StartServer_CommonControls_Init
CALLV
pop
line 1324
;1323:
;1324:		s_itemcontrols_old.gameType.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_itemcontrols_old+2848
CNSTI4 3
ASGNI4
line 1325
;1325:		s_itemcontrols_old.gameType.generic.id		= ID_ITEM_GAMETYPE;
ADDRGP4 s_itemcontrols_old+2848+24
CNSTI4 401
ASGNI4
line 1326
;1326:		s_itemcontrols_old.gameType.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_itemcontrols_old+2848+72
CNSTU4 258
ASGNU4
line 1327
;1327:		s_itemcontrols_old.gameType.generic.callback	= StartServer_ItemPage_Old_Event;
ADDRGP4 s_itemcontrols_old+2848+76
ADDRGP4 StartServer_ItemPage_Old_Event
ASGNP4
line 1328
;1328:		s_itemcontrols_old.gameType.generic.x			= GAMETYPECOLUMN_X;
ADDRGP4 s_itemcontrols_old+2848+28
CNSTI4 400
ASGNI4
line 1329
;1329:		s_itemcontrols_old.gameType.generic.y			= y;
ADDRGP4 s_itemcontrols_old+2848+32
ADDRLP4 8
INDIRI4
ASGNI4
line 1330
;1330:		s_itemcontrols_old.gameType.generic.name		= "Game Type:";
ADDRGP4 s_itemcontrols_old+2848+4
ADDRGP4 $633
ASGNP4
line 1331
;1331:		s_itemcontrols_old.gameType.itemnames			= gametype_items;
ADDRGP4 s_itemcontrols_old+2848+104
ADDRGP4 gametype_items
ASGNP4
line 1333
;1332:
;1333:		s_itemcontrols_old.gameTypeIcon.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_itemcontrols_old+2980
CNSTI4 6
ASGNI4
line 1334
;1334:		s_itemcontrols_old.gameTypeIcon.generic.flags = QMF_INACTIVE;
ADDRGP4 s_itemcontrols_old+2980+72
CNSTU4 16384
ASGNU4
line 1335
;1335:		s_itemcontrols_old.gameTypeIcon.generic.x	 = GAMETYPEICON_X;
ADDRGP4 s_itemcontrols_old+2980+28
CNSTI4 400
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ASGNI4
line 1336
;1336:		s_itemcontrols_old.gameTypeIcon.generic.y	 = y;
ADDRGP4 s_itemcontrols_old+2980+32
ADDRLP4 8
INDIRI4
ASGNI4
line 1337
;1337:		s_itemcontrols_old.gameTypeIcon.width  	     = 32;
ADDRGP4 s_itemcontrols_old+2980+104
CNSTI4 32
ASGNI4
line 1338
;1338:		s_itemcontrols_old.gameTypeIcon.height 	     = 32;
ADDRGP4 s_itemcontrols_old+2980+108
CNSTI4 32
ASGNI4
line 1340
;1339:
;1340:		Menu_AddItem( menuptr, &s_itemcontrols_old.gameType);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols_old+2848
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1341
;1341:		Menu_AddItem( menuptr, &s_itemcontrols_old.gameTypeIcon);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols_old+2980
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1343
;1342:
;1343:		y += 2*LINE_HEIGHT;
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
line 1344
;1344:	}
LABELV $515
line 1348
;1345:
;1346:
;1347:	// controls common to both pages
;1348:	s_itemcontrols_old.reset.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_itemcontrols_old+9088
CNSTI4 6
ASGNI4
line 1349
;1349:	s_itemcontrols_old.reset.generic.name     = SERVER_ITEM_RESET0;
ADDRGP4 s_itemcontrols_old+9088+4
ADDRGP4 $654
ASGNP4
line 1350
;1350:	s_itemcontrols_old.reset.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_itemcontrols_old+9088+72
CNSTU4 260
ASGNU4
line 1351
;1351:	s_itemcontrols_old.reset.generic.callback = StartServer_BothItemMenus_Old_Event;
ADDRGP4 s_itemcontrols_old+9088+76
ADDRGP4 StartServer_BothItemMenus_Old_Event
ASGNP4
line 1352
;1352:	s_itemcontrols_old.reset.generic.id	    = ID_ITEM_RESET;
ADDRGP4 s_itemcontrols_old+9088+24
CNSTI4 402
ASGNI4
line 1353
;1353:	s_itemcontrols_old.reset.generic.x		= 320 - 64;
ADDRGP4 s_itemcontrols_old+9088+28
CNSTI4 256
ASGNI4
line 1354
;1354:	s_itemcontrols_old.reset.generic.y		= 480-64;
ADDRGP4 s_itemcontrols_old+9088+32
CNSTI4 416
ASGNI4
line 1355
;1355:	s_itemcontrols_old.reset.width  		    = 128;
ADDRGP4 s_itemcontrols_old+9088+104
CNSTI4 128
ASGNI4
line 1356
;1356:	s_itemcontrols_old.reset.height  		    = 64;
ADDRGP4 s_itemcontrols_old+9088+108
CNSTI4 64
ASGNI4
line 1357
;1357:	s_itemcontrols_old.reset.focuspic         = SERVER_ITEM_RESET1;
ADDRGP4 s_itemcontrols_old+9088+88
ADDRGP4 $671
ASGNP4
line 1359
;1358:
;1359:	s_itemcontrols_old.numitems = 0;
ADDRGP4 s_itemcontrols_old+9212
CNSTI4 0
ASGNI4
line 1360
;1360:	s_itemcontrols_old.nummasters = 0;
ADDRGP4 s_itemcontrols_old+9208
CNSTI4 0
ASGNI4
line 1363
;1361:
;1362:
;1363:	StartServer_ItemPage_Old_AddMasterControls(y);
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 StartServer_ItemPage_Old_AddMasterControls
CALLV
pop
line 1365
;1364:
;1365:	y += 4*LINE_HEIGHT;
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
line 1368
;1366:
;1367:	// get all the items set up
;1368:	y = StartServer_ItemPage_Old_SetupItemControls(y);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 StartServer_ItemPage_Old_SetupItemControls
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 44
INDIRI4
ASGNI4
line 1372
;1369:
;1370:
;1371:	// add the controls
;1372:	Menu_AddItem( menuptr, &s_itemcontrols_old.reset);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 s_itemcontrols_old+9088
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1375
;1373:
;1374:	// only setup controls that we've fully initialized
;1375:	for (i = 0; i < s_itemcontrols_old.nummasters; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $679
JUMPV
LABELV $676
line 1376
;1376:		Menu_AddItem( menuptr, &s_itemcontrols_old.groupMaster[i]);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3096
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $677
line 1375
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $679
ADDRLP4 0
INDIRI4
ADDRGP4 s_itemcontrols_old+9208
INDIRI4
LTI4 $676
line 1378
;1377:
;1378:	for (i = 0; i < s_itemcontrols_old.numitems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $685
JUMPV
LABELV $682
line 1379
;1379:		Menu_AddItem( menuptr, &s_itemcontrols_old.itemCtrl[i].control);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_itemcontrols_old+3888
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $683
line 1378
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $685
ADDRLP4 0
INDIRI4
ADDRGP4 s_itemcontrols_old+9212
INDIRI4
LTI4 $682
line 1381
;1380:
;1381:	UI_PushMenu( &s_itemcontrols_old.menu );
ADDRGP4 s_itemcontrols_old
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1382
;1382:}
LABELV $511
endproc StartServer_ItemPage_MenuInit_OldMenu 48 16
bss
align 4
LABELV ingame_grouptype_old
skip 24
align 4
LABELV ingame_enabled_old
skip 200
align 4
LABELV s_itemcontrols_old
skip 9228
import StartServer_ItemPage_MenuInit
import StartServer_BothItemMenus_Cache
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
LABELV $671
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
LABELV $654
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
LABELV $633
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
LABELV $604
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
LABELV $589
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
LABELV $564
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
LABELV $558
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
LABELV $533
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
LABELV $523
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
LABELV $441
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $402
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
LABELV $334
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $333
byte 1 111
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $316
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $239
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $190
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
LABELV $146
byte 1 72
byte 1 105
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $145
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $144
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $143
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
LABELV $142
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
LABELV $141
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $140
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 0
align 1
LABELV $139
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $138
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $137
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
LABELV $136
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
LABELV $135
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 0
align 1
LABELV $134
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $133
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $131
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
LABELV $130
byte 1 77
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $129
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $128
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
LABELV $127
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
LABELV $126
byte 1 72
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $125
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $124
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $123
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
LABELV $122
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
LABELV $121
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
LABELV $120
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
LABELV $119
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
LABELV $118
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
LABELV $117
byte 1 77
byte 1 101
byte 1 103
byte 1 97
byte 1 58
byte 1 0
align 1
LABELV $116
byte 1 98
byte 1 102
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 58
byte 1 0
align 1
LABELV $115
byte 1 115
byte 1 108
byte 1 117
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $114
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $113
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $112
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $111
byte 1 112
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $110
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $109
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $108
byte 1 65
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $107
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
LABELV $106
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
LABELV $105
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
LABELV $104
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
LABELV $103
byte 1 66
byte 1 70
byte 1 71
byte 1 49
byte 1 48
byte 1 107
byte 1 58
byte 1 0
align 1
LABELV $102
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
LABELV $101
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
LABELV $100
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 58
byte 1 0
align 1
LABELV $99
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $98
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
LABELV $97
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
LABELV $96
byte 1 77
byte 1 47
byte 1 103
byte 1 117
byte 1 110
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
