/*
=============================================================================

START SERVER MENU *****

=============================================================================
*/


#include "ui_local.h"
#include "ui_startserver_q3.h"


/*
	This menu is slightly unusual. It can be either a part of the setup
	for a map/bot rotation, or it can be called in-game to adjust the
	parameters for the next map.
*/


#define INGAME_CANCEL0 	"menu/art/back_0"
#define INGAME_CANCEL1 	"menu/art/back_1"
#define INGAME_ACCEPT0 	"menu/art/accept_0"
#define INGAME_ACCEPT1 	"menu/art/accept_1"

#define SERVER_ITEM_RESET0 	"menu/art/reset_0"
#define SERVER_ITEM_RESET1 	"menu/art/reset_1"
//#define SERVER_ITEM_CLEAR0 	"menu/uie_art/clear_0"
//#define SERVER_ITEM_CLEAR1 	"menu/uie_art/clear_1"


#define ID_ITEM_GAMETYPE 	401
#define ID_ITEM_RESET		402
#define ID_ITEM_CLEAR		403

#define ID_ITEMINGAME_CANCEL 	430
#define ID_ITEMINGAME_ACCEPT 	431




//
// controls
//

/*
	Observe the dual usage of this control page.
	It can appear as either a part of the map/bot setup
	pages, or as an in-game menu for tweaking existing
	parameters.
*/



#define NUM_ITEM_COUNT ITEM_COUNT
#define NUM_ITEMGROUP_COUNT ITEMGROUP_COUNT


// a single item, and related data/controls
typedef struct iteminfo_s {
	char* name;
	int ident;	// ITEM_* flag

	itemnode_t* item;
	menuradiobutton_s* control;
} iteminfo_t;


// a group of items that are related
typedef struct groupinfo_s {
	int ident;	// GROUPITEM_* flag
	iteminfo_t* itemlist;
	int size;
} groupinfo_t;




typedef struct itemradionbutton_s {
	menuradiobutton_s control;
	iteminfo_t* item;
	int bg_index;	// bg_items[] index
} itemradiobutton_t;




// controls that appear when used as an in-game menu
typedef struct ingame_controls_t {
	menutext_s		title;
	menubitmap_s	cancel;
	menubitmap_s	accept;
	menutext_s		info;
} ingame_controls_s;



// and finally the page controls themselves
typedef struct itemcontrols_s {
	menuframework_s 	menu;
	commoncontrols_t 	common;
	ingame_controls_s	ingame;

	menulist_s 		gameType;
	menubitmap_s 	gameTypeIcon;

	menulist_s 		groupMaster[NUM_ITEMGROUP_COUNT];	// don't use ITEMGROUP_* to index

	itemradiobutton_t itemCtrl[NUM_ITEM_COUNT]; // don't use ITEM_* to index

	menubitmap_s	reset;

	qboolean ingame_menu;	// menu display format

	int nummasters;
	int numitems;

	int base_master_y;	// height of master controls

	// state of the controls
	// this abstraction "aliases" or "hides" where the data is stored,
	// and helps us separate data associated with the script from
	// data associated with the in-game version of this menu

	// array size assumed as ITEM_COUNT
	// indexed by ITEM_*
	qboolean* enabled;

	// array size assumed as ITEMGROUP_COUNT
	// indexed by ITEMGROUP_*
	int* grouptype;
} itemcontrols_t;



static itemcontrols_t s_itemcontrols_old;


//
// data storage used during ingame menu display
// you shouldn't need to write to these values directly
//
static qboolean ingame_enabled_old[ITEM_COUNT];
static int ingame_grouptype_old[ITEMGROUP_COUNT];


enum {
	GRCOL_LEFT,
	GRCOL_MIDLEFT,
	GRCOL_MIDRIGHT,
	GRCOL_RIGHT,

	GRCOL_COUNT
};



//
// data lists
//


// WEAPONS   ------------------------------------------

static iteminfo_t weaponitems_left[] =
{
	{"Hook:", ITEM_GRAPPLING_HOOK, NULL},
	{"M/gun:", ITEM_MGUN, NULL},
	{"Shotgun:", ITEM_SHOTGUN, NULL},
	{"Grenade:", ITEM_GRENADE, NULL},
	{"Rocket:", ITEM_ROCKET, NULL},
	{"Plasma:", ITEM_PLASMA, NULL},
	{"Lightning:", ITEM_LIGHTNING, NULL},
	{"Railgun:", ITEM_RAIL, NULL},
	{"BFG10k:", ITEM_BFG, NULL},
	{"Nailgun:", ITEM_NAILGUN, NULL},
	{"Prox Launcher:", ITEM_PROX_LAUNCHER, NULL},
	{"Chaingun:", ITEM_CHAINGUN, NULL},
	{"Flamethrower:", ITEM_FLAMETHROWER, NULL},
	{"Antimatter:", ITEM_ANTIMATTER, NULL},
};


static iteminfo_t weaponitems_right[] =
{
	{"bullets:", ITEM_MGUN_AMMO, NULL},
	{"shells:", ITEM_SHOTGUN_AMMO, NULL},
	{"pineapples:", ITEM_GRENADE_AMMO, NULL},
	{"rockets:", ITEM_ROCKET_AMMO, NULL},
	{"cells:", ITEM_PLASMA_AMMO, NULL},
	{"charge:", ITEM_LIGHTNING_AMMO, NULL},
	{"slugs:", ITEM_RAIL_AMMO, NULL},
	{"bfg plasma:", ITEM_BFG_AMMO, NULL}
};



static groupinfo_t weapon_group = {
	ITEMGROUP_WEAPON,
	weaponitems_left,
	sizeof(weaponitems_left)/sizeof(weaponitems_left[0])
};

static groupinfo_t ammo_group = {
	ITEMGROUP_AMMO,
	weaponitems_right,
	sizeof(weaponitems_right)/sizeof(weaponitems_right[0])
};




// HEALTH    ------------------------------------------


static iteminfo_t healthitems_left[] =
{
	{"Mega:", ITEM_MEGA, NULL},
	{"Green +5:", ITEM_HEALTH_SMALL, NULL}
};


static iteminfo_t healthitems_right[] =
{
	{"Yellow +25:", ITEM_HEALTH_MEDIUM, NULL},
	{"Gold +50:", ITEM_HEALTH_LARGE, NULL}
};


static groupinfo_t health_group_l = {
	ITEMGROUP_HEALTH,
	healthitems_left,
	sizeof(healthitems_left)/sizeof(healthitems_left[0])
};

static groupinfo_t health_group_r = {
	ITEMGROUP_HEALTH,
	healthitems_right,
	sizeof(healthitems_right)/sizeof(healthitems_right[0])
};


// ARMOUR    ------------------------------------------


static iteminfo_t armouritems_left[] =
{
	{"Red +100:", ITEM_ARMOUR_RED, NULL},
	{"Yellow +50:", ITEM_ARMOUR_YELLOW, NULL}
};


static iteminfo_t armouritems_right[] =
{
	{"Shard +5:", ITEM_ARMOUR_SHARD, NULL}
};


static groupinfo_t armour_group_l = {
	ITEMGROUP_ARMOUR,
	armouritems_left,
	sizeof(armouritems_left)/sizeof(armouritems_left[0])
};

static groupinfo_t armour_group_r = {
	ITEMGROUP_ARMOUR,
	armouritems_right,
	sizeof(armouritems_right)/sizeof(armouritems_right[0])
};


// POWERUPS  ------------------------------------------


static iteminfo_t powerupitems_left[] =
{
	{"Quad:", ITEM_QUAD, NULL},
	{"Regen:", ITEM_REGEN, NULL},
	{"Haste:", ITEM_HASTE, NULL}
};


static iteminfo_t powerupitems_right[] =
{
	{"Battlesuit:", ITEM_BATTLESUIT, NULL},
	{"Invisible:", ITEM_INVISIBLE, NULL},
	{"Flight:", ITEM_FLIGHT, NULL}
};


static groupinfo_t powerup_group_l = {
	ITEMGROUP_POWERUPS,
	powerupitems_left,
	sizeof(powerupitems_left)/sizeof(powerupitems_left[0])
};

static groupinfo_t powerup_group_r = {
	ITEMGROUP_POWERUPS,
	powerupitems_right,
	sizeof(powerupitems_right)/sizeof(powerupitems_right[0])
};


// HOLDABLE  ------------------------------------------



static iteminfo_t holdableitems_left[] =
{
	{"Medkit:", ITEM_MEDKIT, NULL}
};


static iteminfo_t holdableitems_right[] =
{
	{"Teleporter:", ITEM_TELEPORTER, NULL}
};


static groupinfo_t holdable_group_l = {
	ITEMGROUP_HOLDABLE,
	holdableitems_left,
	sizeof(holdableitems_left)/sizeof(holdableitems_left[0])
};

static groupinfo_t holdable_group_r = {
	ITEMGROUP_HOLDABLE,
	holdableitems_right,
	sizeof(holdableitems_right)/sizeof(holdableitems_right[0])
};


// GROUP LAYOUT ------------------------------------------


enum {
	SYNC_NONE,
	SYNC_LEFT,
	SYNC_RIGHT
};



typedef struct groupposition_s {
	groupinfo_t* group;
	int position;	// GRCOL_*

	// possible title text
	char* title;
	int x;
	int y;

	int resync;	// SYNC_*
} groupposition_t;




static groupposition_t groupInfo[] = {
	{ &weapon_group, GRCOL_LEFT, "Weapons", 0, 0, SYNC_LEFT},
	{ &ammo_group, GRCOL_MIDLEFT, NULL, 0, 0, SYNC_NONE},

	{ &health_group_l, GRCOL_LEFT, "Health", 0, 0, SYNC_LEFT},
	{ &health_group_r, GRCOL_MIDLEFT, NULL, 0, 0, SYNC_NONE},

	{ &armour_group_l, GRCOL_MIDRIGHT, "Armour", 0, 0, SYNC_RIGHT},
	{ &armour_group_r, GRCOL_RIGHT, NULL, 0, 0, SYNC_NONE},

	{ &powerup_group_l, GRCOL_MIDRIGHT, "Powerups", 0, 0, SYNC_RIGHT},
	{ &powerup_group_r, GRCOL_RIGHT, NULL, 0, 0, SYNC_NONE},

	{ &holdable_group_l, GRCOL_MIDRIGHT, "Holdables", 0, 0, SYNC_RIGHT},
	{ &holdable_group_r, GRCOL_RIGHT, NULL, 0, 0, SYNC_NONE}
};


static int groupInfo_Size = sizeof(groupInfo)/sizeof(groupInfo[0]);


typedef struct mastercontrol_s {
	int ident;
	char* title;
	menulist_s* control;
} mastercontrol_t;



static mastercontrol_t masterControl_old[ITEMGROUP_COUNT] = {
	{ ITEMGROUP_WEAPON, "Weapon:", NULL },
	{ ITEMGROUP_AMMO, "Ammo:", NULL },
	{ ITEMGROUP_HEALTH, "Health:", NULL },
	{ ITEMGROUP_ARMOUR, "Armour:", NULL },
	{ ITEMGROUP_POWERUPS, "Powerups:", NULL },
	{ ITEMGROUP_HOLDABLE, "Holdables:", NULL }
};


static int masterControl_old_Size = sizeof(masterControl_old)/sizeof(masterControl_old[0]);


static const char* allgroups_items_old[] = {
	"All",	// ALLGROUPS_ENABLED
	"Custom",	// ALLGROUPS_CUSTOM
	"Hidden",	// ALLGROUPS_HIDDEN
	0
};




//------------------------------------------------------------------



/*
=================
StartServer_BothItemPage_Old_InitControls
=================
*/
static void StartServer_BothItemPage_Old_InitControls( void )
{
	int 		i, j;
	qboolean 	enabled;
	groupinfo_t*	group;
	int 		grouptype;
	int 		index;

	// initialize the master controls
	for (i = 0; i < masterControl_old_Size; i++)
	{
		masterControl_old[i].control->curvalue = s_itemcontrols_old.grouptype[ masterControl_old[i].ident ];
	}

	// initialize each group of items
	for (i = 0; i < groupInfo_Size; i++)
	{
		group = groupInfo[i].group;
		if (!group)
			continue;

		enabled = qtrue;
		grouptype = s_itemcontrols_old.grouptype[ group->ident ];
		if (grouptype == ALLGROUPS_HIDDEN)
			enabled = qfalse;

		for (j = 0; j < group->size; j++)
		{
			if (grouptype == ALLGROUPS_CUSTOM) {
				enabled = s_itemcontrols_old.enabled[ group->itemlist[j].ident ];
			}

			group->itemlist[j].control->curvalue = enabled;
		}
	}
}





/*
=================
StartServer_InGame_Old_FindGroupType
=================
*/
static int StartServer_InGame_Old_FindGroupType( iteminfo_t* list, int size )
{
	int grouptype;
	qboolean enabled;
	int i;

	if (size == 0)
		return ALLGROUPS_ENABLED;

	grouptype = ALLGROUPS_ENABLED;
	enabled = s_itemcontrols_old.enabled[ list[0].ident ];
	if (!enabled)
		grouptype = ALLGROUPS_HIDDEN;

	for (i = 0; i < size; i++)
	{
		if (enabled != s_itemcontrols_old.enabled[ list[i].ident ]) {
			return ALLGROUPS_CUSTOM;
		}
	}

	return grouptype;
}


/*
=================
StartServer_InGame_Old_Init
=================
*/
static void StartServer_InGame_Old_Init( void )
{
	int 		i, j;
	qboolean 	disabled;
	qboolean 	init;
	groupinfo_t* 	group;
	int 		type, t;

	s_itemcontrols_old.enabled = ingame_enabled_old;
	s_itemcontrols_old.grouptype = ingame_grouptype_old;

	// get the cvars currently set
	for (i = 0; i < ITEM_COUNT; i++)
	{
		disabled = (int)Com_Clamp(0, 1, trap_Cvar_VariableValue(va("disable_%s", server_itemlist[i].mapitem)));
		if (disabled)
			s_itemcontrols_old.enabled[i] = qfalse;
		else
			s_itemcontrols_old.enabled[i] = qtrue;
	}

	// all groups are custom by default, just in case a group
	// doesn't have a master control (we want the control visible and editable)
	for (i = 0; i < ITEMGROUP_COUNT; i++)
	{
		s_itemcontrols_old.grouptype[i] = ALLGROUPS_CUSTOM;
	}

	// now scan through the master controls to see how they should be setup
	for (i = 0; i < masterControl_old_Size; i++)
	{
		if (!masterControl_old[i].control)
			continue;

		// check each group for a contrary enable state
		init = qfalse;
		for (j = 0; j < groupInfo_Size; j++)
		{
			group = groupInfo[j].group;
			if (group->ident != masterControl_old[i].ident)
				continue;

			t = StartServer_InGame_Old_FindGroupType(group->itemlist, group->size);

			if (init) {
				type = t;
				init = qfalse;
			}
			else {
				if (t != type)
					type = ALLGROUPS_CUSTOM;
			}
		}

		s_itemcontrols_old.grouptype[ masterControl_old[i].ident ] = type;
	}

	StartServer_BothItemPage_Old_InitControls();
}



/*
=================
StartServer_InGame_Old_SaveChanges
=================
*/
static void StartServer_InGame_Old_SaveChanges( void )
{
	int 		i, j;
	int 		type;
	int			ident;
	qboolean	disable;
	groupinfo_t*	group;

	// write out the disabled items list
	for (i = 0; i < groupInfo_Size; i++)
	{
		group = groupInfo[i].group;
		if (!group)
			continue;

		disable = qfalse;
		type = s_itemcontrols_old.grouptype[ group->ident ];
		if (type == ALLGROUPS_HIDDEN)
			disable = qtrue;
		for (j = 0; j < group->size; j++)
		{
			ident = group->itemlist[j].ident;
			if (type == ALLGROUPS_CUSTOM)
			{
				disable = qtrue;
				if (s_itemcontrols_old.enabled[ ident ])
					disable = qfalse;
			}
			trap_Cvar_Set(va("disable_%s", server_itemlist[ident].mapitem), va("%i",disable));
		}
	}
}



/*
=================
StartServer_InGame_Old_Event
=================
*/
static void StartServer_InGame_Old_Event( void* ptr, int event )
{
	if (event != QM_ACTIVATED)
		return;

	switch (((menucommon_s*)ptr)->id)
	{
	case ID_ITEMINGAME_CANCEL:
		UI_PopMenu();
		break;

	case ID_ITEMINGAME_ACCEPT:
		StartServer_InGame_Old_SaveChanges();
		UI_PopMenu();
		break;		
	}
}


//------------------------------------------------------------------



/*
=================
StartServer_ItemPage_Cache
=================
*/
/*void StartServer_ItemPage_Cache( void )
{
	if (s_itemcontrols_old.ingame_menu)
	{
		trap_R_RegisterShaderNoMip( INGAME_CANCEL0 );
		trap_R_RegisterShaderNoMip( INGAME_CANCEL1 );
		trap_R_RegisterShaderNoMip( INGAME_ACCEPT0 );
		trap_R_RegisterShaderNoMip( INGAME_ACCEPT1 );
	}

	trap_R_RegisterShaderNoMip( SERVER_ITEM_RESET0 );
	trap_R_RegisterShaderNoMip( SERVER_ITEM_RESET1 );
//	trap_R_RegisterShaderNoMip( SERVER_ITEM_CLEAR0 );
//	trap_R_RegisterShaderNoMip( SERVER_ITEM_CLEAR1 );
}*/



/*
=================
StartServer_ItemPage_Old_ResetAll

Sets all item controls on/off and group settings
become custom
=================
*/
static void StartServer_ItemPage_Old_ResetAll( qboolean enabled)
{
	int i;
	groupinfo_t*	group;

	for (i = 0; i < ITEM_COUNT; i++)
	{
		s_itemcontrols_old.enabled[i] = enabled;
	}

	for (i = 0; i < ITEMGROUP_COUNT; i++)
	{
		s_itemcontrols_old.grouptype[i] = ALLGROUPS_CUSTOM;
	}

	StartServer_BothItemPage_Old_InitControls();
}


/*
=================
StartServer_ItemPage_Old_SetItemControls
=================
*/
static void StartServer_ItemPage_Old_SetItemControls(iteminfo_t* list, int size, int type)
{
}



/*
=================
StartServer_ItemPage_Old_UpdateInterface
=================
*/
static void StartServer_ItemPage_Old_UpdateInterface(void)
{
	int 		i, j, k;
	int 		type;
	groupinfo_t* group;
	menuradiobutton_s* ctrl;
	iteminfo_t*	item;

	// menu type specific interface updates
	if (!s_itemcontrols_old.ingame_menu)
	{
		StartServer_SetIconFromGameType(&s_itemcontrols_old.gameTypeIcon, s_scriptdata.gametype, qfalse);
	}

	// set the groups, only custom visually enables it
	for (i = 0; i < masterControl_old_Size; i++)
	{
		type = masterControl_old[i].control->curvalue;

		for (j = 0; j < groupInfo_Size; j++)
		{
			group = groupInfo[j].group;
			if (!group || group->ident != masterControl_old[i].ident)
				continue;

			item = group->itemlist;
			k = group->size;
			while (k > 0 )
			{
				ctrl = item->control;
				switch (type) {
				case ALLGROUPS_ENABLED:
					ctrl->generic.flags |= (QMF_GRAYED|QMF_INACTIVE);
					ctrl->curvalue = qtrue;
					break;

				case ALLGROUPS_HIDDEN:
					ctrl->generic.flags |= (QMF_GRAYED|QMF_INACTIVE);
					ctrl->curvalue = qfalse;
					break;

				case ALLGROUPS_CUSTOM:
					ctrl->generic.flags &= ~(QMF_GRAYED|QMF_INACTIVE);
					ctrl->curvalue = s_itemcontrols_old.enabled[ item->ident ];
					break;
				}

				item++;
				k--;
			}

		}
	}

	// enable fight button if possible
	StartServer_CheckFightReady(&s_itemcontrols_old.common);
}




/*
=================
StartServer_ItemPage_Old_Save
=================
*/
static void StartServer_ItemPage_Old_Save( void )
{
	StartServer_SaveScriptData();
}


/*
=================
StartServer_ItemPage_Old_Load
=================
*/
static void StartServer_ItemPage_Old_Load( void )
{
	s_itemcontrols_old.enabled = s_scriptdata.item.enabled;
	s_itemcontrols_old.grouptype = s_scriptdata.item.groupstate;

	s_itemcontrols_old.gameType.curvalue = s_scriptdata.gametype;

	StartServer_BothItemPage_Old_InitControls();
}



/*
=================
StartServer_ItemPage_Old_CommonEvent
=================
*/
static void StartServer_ItemPage_Old_CommonEvent( void* ptr, int event )
{
	if( event != QM_ACTIVATED ) {
		return;
	}

	StartServer_ItemPage_Old_Save();
	switch( ((menucommon_s*)ptr)->id )
	{
		case ID_SERVERCOMMON_SERVER:
			StartServer_ServerPage_MenuInit();
			break;

		case ID_SERVERCOMMON_BOTS:
			UI_PopMenu();
			break;

		case ID_SERVERCOMMON_MAPS:
			UI_PopMenu();
			UI_PopMenu();
			break;

		case ID_SERVERCOMMON_BACK:
			UI_PopMenu();
			UI_PopMenu();
			UI_PopMenu();
			break;

		case ID_SERVERCOMMON_FIGHT:
			StartServer_CreateServer(NULL);
			break;
	}
}



/*
=================
StartServer_ItemPage_Old_DrawItemButton
=================
*/
static void StartServer_ItemPage_Old_DrawItemButton( void* ptr )
{
	int	x;
	int y;
	float *color;
	int	style;
	qboolean focus;
	menuradiobutton_s *rb;
	char* iconname;
	qhandle_t	icon;
	vec4_t gcolor;

	rb = (menuradiobutton_s*)ptr;
	x = rb->generic.x;
	y = rb->generic.y;

	gcolor[0] = 1.0;
	gcolor[1] = 1.0;
	gcolor[2] = 1.0;
	gcolor[3] = 1.0;

	// load the icon
	iconname = bg_itemlist[ s_itemcontrols_old.itemCtrl[rb->generic.id].bg_index ].icon;
	icon = trap_R_RegisterShaderNoMip(va("uie_%s", iconname));
	if (!icon)
		icon = trap_R_RegisterShaderNoMip(iconname);

	// setup text colour states
	focus = (rb->generic.parent->cursor == rb->generic.menuPosition);
	if ( rb->generic.flags & QMF_GRAYED )
	{
		gcolor[3] = 0.3;
		color = text_color_disabled;
		style = UI_LEFT|UI_SMALLFONT;
	}
	else if ( focus )
	{
		color = text_color_highlight;
		style = UI_LEFT|UI_PULSE|UI_SMALLFONT;
	}
	else
	{
		color = text_color_normal;
		style = UI_LEFT|UI_SMALLFONT;
	}

	// draw it!
	if ( rb->generic.name )
		UI_DrawString( x - SMALLCHAR_WIDTH, y, rb->generic.name, UI_RIGHT|UI_SMALLFONT, color );

	if ( !rb->curvalue )
	{
		gcolor[3] = 0.3;
		UI_DrawString( x + 16, y, "off", style, color );
	}
	else
	{
		UI_DrawString( x + 16, y, "on", style, color );
	}

	trap_R_SetColor(gcolor);
	// square image, always
	UI_DrawHandlePic( x - 5, y, SMALLCHAR_HEIGHT, SMALLCHAR_HEIGHT, icon);
	trap_R_SetColor(NULL);
}




/*
=================
StartServer_ItemPage_Old_MenuDraw
=================
*/
static void StartServer_ItemPage_Old_MenuDraw(void)
{
	int i;
	int style;

	if (uis.firstdraw) {
		// put all the data in place
		if (s_itemcontrols_old.ingame_menu) {
			StartServer_InGame_Old_Init();
		}
		else {
			StartServer_ItemPage_Old_Load();
		}

		StartServer_ItemPage_Old_UpdateInterface();
	}

	StartServer_BackgroundDraw(qfalse);


	style = UI_SMALLFONT|UI_DROPSHADOW|UI_INVERSE;
	for (i = 0; i < groupInfo_Size; i++)
	{
		if (!groupInfo[i].title)
			continue;

		UI_DrawString( groupInfo[i].x, groupInfo[i].y, groupInfo[i].title, style, color_white );
	}

	// draw the controls
	Menu_Draw(&s_itemcontrols_old.menu);
}




/*
=================
StartServer_ItemPage_Old_GroupEvent

Syncs array with data control value
=================
*/
static void StartServer_ItemPage_Old_GroupEvent( void* ptr, int event )
{
	menulist_s* l;
	iteminfo_t* item;

	if (event != QM_ACTIVATED)
		return;

	// store the value of the control
	l = (menulist_s*)ptr;
	item = s_itemcontrols_old.itemCtrl[ l->generic.id ].item;
	if (item)
		s_itemcontrols_old.grouptype[ item->ident ] = l->curvalue;

	StartServer_ItemPage_Old_UpdateInterface();
}




/*
=================
StartServer_ItemPage_Old_ItemEvent

Only called when the control is enabled,
so it must be the custom setting
=================
*/
static void StartServer_ItemPage_Old_ItemEvent( void* ptr, int event )
{
	menuradiobutton_s* rb;
	iteminfo_t* item;

	if (event != QM_ACTIVATED)
		return;

	// store the value of the control in server_itemlist[]
	rb = (menuradiobutton_s*)ptr;
	item = s_itemcontrols_old.itemCtrl[ rb->generic.id ].item;

	if (item)
		s_itemcontrols_old.enabled[ item->ident ] = rb->curvalue;
}




/*
=================
StartServer_BothItemMenus_Old_Event
=================
*/
static void StartServer_BothItemMenus_Old_Event( void* ptr, int event )
{
	if (event != QM_ACTIVATED)
		return;

	switch (((menucommon_s*)ptr)->id) {
	case ID_ITEM_RESET:
		StartServer_ItemPage_Old_ResetAll(qtrue);
		StartServer_ItemPage_Old_UpdateInterface();
		break;

	case ID_ITEM_CLEAR:
		StartServer_ItemPage_Old_ResetAll(qfalse);
		StartServer_ItemPage_Old_UpdateInterface();
		break;
	}
}



/*
=================
StartServer_ItemPage_Old_Event
=================
*/
static void StartServer_ItemPage_Old_Event( void* ptr, int event )
{
	if (event != QM_ACTIVATED)
		return;

	switch (((menucommon_s*)ptr)->id) {
	case ID_ITEM_GAMETYPE:
		StartServer_SaveScriptData();

		StartServer_LoadScriptDataFromType(s_itemcontrols_old.gameType.curvalue);

		StartServer_BothItemPage_Old_InitControls();
		StartServer_ItemPage_Old_UpdateInterface();
		break;
	}
}



/*
=================
StartServer_ItemPage_Old_MenuKey
=================
*/
static sfxHandle_t StartServer_ItemPage_Old_MenuKey( int key )
{
	switch (key)
	{
		case K_MOUSE2:
		case K_ESCAPE:
			if (!s_itemcontrols_old.ingame_menu) {
				StartServer_ItemPage_Old_Save();
				UI_PopMenu();
				UI_PopMenu();
			}
			break;
	}

	return ( Menu_DefaultKey( &s_itemcontrols_old.menu, key ) );
}




/*
=================
StartServer_Old_GetItemFromMapObject
=================
*/
static int StartServer_Old_GetItemFromMapObject(const char* ident)
{
	int i;

	for (i = 0; i < bg_numItems; i++)
	{
		if (!Q_stricmp(ident, bg_itemlist[i].classname))
			return i;
	}

	Com_Printf("bg_itemlist, unknown type: %s\n", ident);
	return 0;
}




/*
=================
StartServer_ItemPage_Old_AddMasterControl
=================
*/
static void StartServer_ItemPage_Old_AddMasterControls(int y)
{
	int x, dy;
	int i;

	s_itemcontrols_old.nummasters = 0;

	for (i = 0 ; i < masterControl_old_Size; i++)
	{
		x = GAMETYPECOLUMN_X + ((i / 2) - 1) * SMALLCHAR_WIDTH * 22;
		dy = (i % 2) * LINE_HEIGHT;

		s_itemcontrols_old.groupMaster[i].generic.type		= MTYPE_SPINCONTROL;
		s_itemcontrols_old.groupMaster[i].generic.id		= i;
		s_itemcontrols_old.groupMaster[i].generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
		s_itemcontrols_old.groupMaster[i].generic.callback	= StartServer_ItemPage_Old_GroupEvent;
		s_itemcontrols_old.groupMaster[i].generic.x		= x;
		s_itemcontrols_old.groupMaster[i].generic.y		= y + dy;
		s_itemcontrols_old.groupMaster[i].generic.name		= masterControl_old[i].title;
		s_itemcontrols_old.groupMaster[i].itemnames		= allgroups_items_old;

		masterControl_old[i].control = &s_itemcontrols_old.groupMaster[i];

		s_itemcontrols_old.nummasters++;
	}
}






/*
=================
StartServer_ItemPage_Old_Register

Always work in units of LINE_HEIGHT so left and right
columns are always aligned
=================
*/
static int StartServer_ItemPage_Old_RegisterGroup(groupposition_t* gp, int y)
{
	int id;
	int x;
	int dy;
	int index, ident;
	groupinfo_t* g;
	itemnode_t* node;

	g = gp->group;
	if (!g)
		return 0;

	x = 160 * gp->position;
	if (gp->title) {
		gp->x = x + 8;
		gp->y = y - PROP_HEIGHT * UI_ProportionalSizeScale( UI_SMALLFONT, 0 );
	}

	dy = 0;
	index = 0;
	while (index < g->size)
	{
		ident = g->itemlist[index].ident;
		node = &server_itemlist[ ident ];
		if (node->groupid != g->ident)
		{
			Com_Printf("Item in wrong group: %s expected %i, got %i\n",
				node->mapitem, g->ident, node->groupid);
		}

		id = s_itemcontrols_old.numitems;
		s_itemcontrols_old.itemCtrl[id].control.generic.type	= MTYPE_RADIOBUTTON;
		s_itemcontrols_old.itemCtrl[id].control.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
		s_itemcontrols_old.itemCtrl[id].control.generic.name 	= g->itemlist[index].name;
		s_itemcontrols_old.itemCtrl[id].control.generic.callback	= StartServer_ItemPage_Old_ItemEvent;
		s_itemcontrols_old.itemCtrl[id].control.generic.ownerdraw = StartServer_ItemPage_Old_DrawItemButton;
		s_itemcontrols_old.itemCtrl[id].control.generic.id		= id;	// self index
		s_itemcontrols_old.itemCtrl[id].control.generic.x		= x + 13*SMALLCHAR_WIDTH;
		s_itemcontrols_old.itemCtrl[id].control.generic.y		= y + dy;

		s_itemcontrols_old.itemCtrl[id].item = &g->itemlist[index];
		s_itemcontrols_old.itemCtrl[id].bg_index = StartServer_Old_GetItemFromMapObject(server_itemlist[ident].mapitem);

		g->itemlist[index].control = &s_itemcontrols_old.itemCtrl[id].control;

		s_itemcontrols_old.numitems++;
		index++;
		dy += LINE_HEIGHT;
	}

	dy += 3*LINE_HEIGHT;

	return dy;
}







/*
=================
StartServer_ItemPage_Old_SetupItemControls
=================
*/
static int StartServer_ItemPage_Old_SetupItemControls(int y)
{
	int col_y[GRCOL_COUNT];
	int i;
	int pos;
	int max;

	for (i = 0; i < GRCOL_COUNT; i++)
		col_y[i] = y;

	for (i = 0; i < groupInfo_Size; i++)
	{
		switch (groupInfo[i].resync)
		{
		case SYNC_LEFT:
			if (col_y[GRCOL_LEFT] > col_y[GRCOL_MIDLEFT]) {
				col_y[GRCOL_MIDLEFT] = col_y[GRCOL_LEFT];
			}
			else if (col_y[GRCOL_MIDLEFT] > col_y[GRCOL_LEFT]) {
				col_y[GRCOL_LEFT] = col_y[GRCOL_MIDLEFT];
			}
			break;
		case SYNC_RIGHT:
			if (col_y[GRCOL_RIGHT] > col_y[GRCOL_MIDRIGHT]) {
				col_y[GRCOL_MIDRIGHT] = col_y[GRCOL_RIGHT];
			}
			else if (col_y[GRCOL_MIDRIGHT] > col_y[GRCOL_RIGHT]) {
				col_y[GRCOL_RIGHT] = col_y[GRCOL_MIDRIGHT];
			}
			break;
		case SYNC_NONE:
			break;
		}

		pos = groupInfo[i].position;
		col_y[pos] += StartServer_ItemPage_Old_RegisterGroup(&groupInfo[i], col_y[pos]);
	}

	max = 0;
	for (i = 0; i < GRCOL_COUNT; i++)
		if (col_y[i] > max)
			max = col_y[i];

	return max;
}



/*
=================
StartServer_ItemPage_MenuInit_OldMenu
=================
*/
void StartServer_ItemPage_MenuInit_OldMenu(qboolean ingame)
{
	menuframework_s* menuptr;
	int i;
	int x, y, dy, left_y, right_y;
	int count, index;
	char* text;

	memset(&s_itemcontrols_old, 0, sizeof(itemcontrols_t));

	StartServer_MapPage_Cache();

	menuptr = &s_itemcontrols_old.menu;

	menuptr->key = StartServer_ItemPage_Old_MenuKey;
	menuptr->wrapAround = qtrue;
	menuptr->native 	= qfalse;
	menuptr->fullscreen = qtrue;
	menuptr->draw = StartServer_ItemPage_Old_MenuDraw;

	y = GAMETYPEROW_Y;
	s_itemcontrols_old.ingame_menu = ingame;

	// menu type specific initialization
	if (ingame) {
		s_itemcontrols_old.ingame.title.generic.type     = MTYPE_BTEXT;
		s_itemcontrols_old.ingame.title.generic.x		= 320;
		s_itemcontrols_old.ingame.title.generic.y		= 4;
		s_itemcontrols_old.ingame.title.string			= "DISABLE ITEMS";
		s_itemcontrols_old.ingame.title.color			= color_white;
		s_itemcontrols_old.ingame.title.style			= UI_CENTER;

		s_itemcontrols_old.ingame.cancel.generic.type     = MTYPE_BITMAP;
		s_itemcontrols_old.ingame.cancel.generic.name     = INGAME_CANCEL0;
		s_itemcontrols_old.ingame.cancel.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
		s_itemcontrols_old.ingame.cancel.generic.callback = StartServer_InGame_Old_Event;
		s_itemcontrols_old.ingame.cancel.generic.id	    = ID_ITEMINGAME_CANCEL;
		s_itemcontrols_old.ingame.cancel.generic.x		= 0;
		s_itemcontrols_old.ingame.cancel.generic.y		= 480-64;
		s_itemcontrols_old.ingame.cancel.width  		    = 128;
		s_itemcontrols_old.ingame.cancel.height  		    = 64;
		s_itemcontrols_old.ingame.cancel.focuspic         = INGAME_CANCEL1;

		s_itemcontrols_old.ingame.accept.generic.type     = MTYPE_BITMAP;
		s_itemcontrols_old.ingame.accept.generic.name     = INGAME_ACCEPT0;
		s_itemcontrols_old.ingame.accept.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
		s_itemcontrols_old.ingame.accept.generic.callback = StartServer_InGame_Old_Event;
		s_itemcontrols_old.ingame.accept.generic.id	    = ID_ITEMINGAME_ACCEPT;
		s_itemcontrols_old.ingame.accept.generic.x		= 640 - 128;
		s_itemcontrols_old.ingame.accept.generic.y		= 480-64;
		s_itemcontrols_old.ingame.accept.width  		    = 128;
		s_itemcontrols_old.ingame.accept.height  		    = 64;
		s_itemcontrols_old.ingame.accept.focuspic         = INGAME_ACCEPT1;

		s_itemcontrols_old.ingame.info.generic.type     = MTYPE_PTEXT;
		s_itemcontrols_old.ingame.info.generic.flags	= QMF_INACTIVE;
		s_itemcontrols_old.ingame.info.generic.x		= 320;
		s_itemcontrols_old.ingame.info.generic.y		= 480 - 64 - 36;
		s_itemcontrols_old.ingame.info.string			= "Requires RESTART or NEXT MAP";
		s_itemcontrols_old.ingame.info.color			= color_white;
		s_itemcontrols_old.ingame.info.style			= UI_CENTER|UI_SMALLFONT;

		Menu_AddItem( menuptr, &s_itemcontrols_old.ingame.title);
		Menu_AddItem( menuptr, &s_itemcontrols_old.ingame.cancel);
		Menu_AddItem( menuptr, &s_itemcontrols_old.ingame.accept);
		Menu_AddItem( menuptr, &s_itemcontrols_old.ingame.info);

		y -= LINE_HEIGHT;
	}
	else {
		StartServer_CommonControls_Init(menuptr, &s_itemcontrols_old.common, StartServer_ItemPage_Old_CommonEvent, COMMONCTRL_ITEMS);

		s_itemcontrols_old.gameType.generic.type		= MTYPE_SPINCONTROL;
		s_itemcontrols_old.gameType.generic.id		= ID_ITEM_GAMETYPE;
		s_itemcontrols_old.gameType.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
		s_itemcontrols_old.gameType.generic.callback	= StartServer_ItemPage_Old_Event;
		s_itemcontrols_old.gameType.generic.x			= GAMETYPECOLUMN_X;
		s_itemcontrols_old.gameType.generic.y			= y;
		s_itemcontrols_old.gameType.generic.name		= "Game Type:";
		s_itemcontrols_old.gameType.itemnames			= gametype_items;

		s_itemcontrols_old.gameTypeIcon.generic.type  = MTYPE_BITMAP;
		s_itemcontrols_old.gameTypeIcon.generic.flags = QMF_INACTIVE;
		s_itemcontrols_old.gameTypeIcon.generic.x	 = GAMETYPEICON_X;
		s_itemcontrols_old.gameTypeIcon.generic.y	 = y;
		s_itemcontrols_old.gameTypeIcon.width  	     = 32;
		s_itemcontrols_old.gameTypeIcon.height 	     = 32;

		Menu_AddItem( menuptr, &s_itemcontrols_old.gameType);
		Menu_AddItem( menuptr, &s_itemcontrols_old.gameTypeIcon);

		y += 2*LINE_HEIGHT;
	}


	// controls common to both pages
	s_itemcontrols_old.reset.generic.type     = MTYPE_BITMAP;
	s_itemcontrols_old.reset.generic.name     = SERVER_ITEM_RESET0;
	s_itemcontrols_old.reset.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
	s_itemcontrols_old.reset.generic.callback = StartServer_BothItemMenus_Old_Event;
	s_itemcontrols_old.reset.generic.id	    = ID_ITEM_RESET;
	s_itemcontrols_old.reset.generic.x		= 320 - 64;
	s_itemcontrols_old.reset.generic.y		= 480-64;
	s_itemcontrols_old.reset.width  		    = 128;
	s_itemcontrols_old.reset.height  		    = 64;
	s_itemcontrols_old.reset.focuspic         = SERVER_ITEM_RESET1;

	s_itemcontrols_old.numitems = 0;
	s_itemcontrols_old.nummasters = 0;


	StartServer_ItemPage_Old_AddMasterControls(y);

	y += 4*LINE_HEIGHT;

	// get all the items set up
	y = StartServer_ItemPage_Old_SetupItemControls(y);


	// add the controls
	Menu_AddItem( menuptr, &s_itemcontrols_old.reset);

	// only setup controls that we've fully initialized
	for (i = 0; i < s_itemcontrols_old.nummasters; i++)
		Menu_AddItem( menuptr, &s_itemcontrols_old.groupMaster[i]);

	for (i = 0; i < s_itemcontrols_old.numitems; i++)
		Menu_AddItem( menuptr, &s_itemcontrols_old.itemCtrl[i].control);

	UI_PushMenu( &s_itemcontrols_old.menu );
}






