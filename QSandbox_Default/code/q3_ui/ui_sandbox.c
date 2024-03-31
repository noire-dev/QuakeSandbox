//Copyright (C) 1999-2005 Id Software, Inc.
//
//
// ui_sandbox.c
//

#include "ui_local.h"


#define SANDBOX_FRAME	"menu/art/cut_frame"

#define ID_LIST			100
#define ID_CLASSLIST	101
#define ID_TOOLSLIST	102
#define ID_SPAWNOBJECT	103
#define ID_PRIV			104
#define ID_SAVEMAP		105
#define ID_LOADMAP		106
#define ID_TAB1			107
#define ID_TAB2			108
#define ID_TAB3			109
#define ID_TAB4			110
#define ID_TAB5			111
#define ID_TAB6			112
#define ID_TAB7			113
#define ID_TAB8			114
#define ID_TAB9			115
#define ID_TAB10		116

typedef struct
{
	menuframework_s	menu;
	menubitmap_s	frame;
	menutext_s		spawnobject;
	menuradiobutton_s		priv;
	menufield_s		minmax;
	menufield_s		grid;
	menutext_s		savemap;
	menutext_s		loadmap;
	menutext_s		propstext;
	menutext_s		toolstext;
	menutext_s		classtext;
	menufield_s		modif0;
	menufield_s		modif1;
	menufield_s		modif2;
	menufield_s		modif3;
	menufield_s		modif4;
	menulist_s		list;
	menulist_s		classlist;
	menulist_s		toolslist;
	menutext_s		tab1;
	menutext_s		tab2;
	menutext_s		tab3;
	menutext_s		tab4;
	menutext_s		tab5;
	menutext_s		tab6;
	menutext_s		tab7;
	menutext_s		tab8;
	menutext_s		tab9;
	menutext_s		tab10;
	
	char			names[524288];
	char			names2[524288];
	char*			configlist[524288];
	char*			classeslist[65536];
	char*			botclasslist[65536];
	char*			toollist[65536];
	char*			cvar_itemslist[524288];
	char*			admcvar_itemslist[524288];
	char*			item_itemslist[524288];
} sandboxmain_t;

	char* 			cvar_items[] = {
	"g_minigame",
	"g_ghspeed",
	"g_ghtimeout",
	"g_gdelay",
	"g_gdamage",
	"g_grange",
	"g_gknockback",
	"g_mgdelay",
	"g_mgdamage",
	"g_mgspread",
	"g_mgexplode",
	"g_mgsdamage",
	"g_mgsradius",
	"g_mgvampire",
	"g_mginf",
	"g_mgknockback",
	"g_sgdelay",
	"g_sgdamage",
	"g_sgspread",
	"g_sgexplode",
	"g_sgsdamage",
	"g_sgsradius",
	"g_sgcount",
	"g_sgvampire",
	"g_sginf",
	"g_sgknockback",
	"g_gldelay",
	"g_glspeed",
	"g_gltimeout",
	"g_glsradius",
	"g_glsdamage",
	"g_gldamage",
	"g_glbounce",
	"g_glgravity",
	"g_glvampire",
	"g_glinf",
	"g_glbouncemodifier",
	"g_glknockback",
	"g_rldelay",
	"g_rlspeed",
	"g_rltimeout",
	"g_rlsradius",
	"g_rlsdamage",
	"g_rldamage",
	"g_rlbounce",
	"g_rlgravity",
	"g_rlvampire",
	"g_rlinf",
	"g_rlbouncemodifier",
	"g_rlknockback",
	"g_lgdamage",
	"g_lgdelay",
	"g_lgrange",
	"g_lgexplode",
	"g_lgsdamage",
	"g_lgsradius",
	"g_lgvampire",
	"g_lginf",
	"g_lgknockback",
	"g_rgdelay",
	"g_rgdamage",
	"g_rgvampire",
	"g_rginf",
	"g_rgknockback",
	"g_pgdelay",
	"g_pgsradius",
	"g_pgspeed",
	"g_pgsdamage",
	"g_pgdamage",
	"g_pgtimeout",
	"g_pgbounce",
	"g_pggravity",
	"g_pgvampire",
	"g_pginf",
	"g_pgbouncemodifier",
	"g_pgknockback",
	"g_bfgdelay",
	"g_bfgspeed",
	"g_bfgtimeout",
	"g_bfgsradius",
	"g_bfgsdamage",
	"g_bfgdamage",
	"g_bfgbounce",
	"g_bfggravity",
	"g_bfgvampire",
	"g_bfginf",
	"g_bfgbouncemodifier",
	"g_bfgknockback",
	"g_ngdelay",
	"g_ngspeed",
	"g_ngspread",
	"g_ngdamage",
	"g_ngtimeout",
	"g_ngcount",
	"g_ngbounce",
	"g_nggravity",
	"g_ngrandom",
	"g_ngvampire",
	"g_nginf",
	"g_ngbouncemodifier",
	"g_ngknockback",
	"g_pldelay",
	"g_plspeed",
	"g_pltimeout",
	"g_plsradius",
	"g_plsdamage",
	"g_plgravity",
	"g_pldamage",
	"g_plvampire",
	"g_plinf",
	"g_plknockback",
	"g_cgdelay",
	"g_cgdamage",
	"g_cgspread",
	"g_cgvampire",
	"g_cginf",
	"g_cgknockback",
	"g_ftdelay",
	"g_ftsradius",
	"g_ftspeed",
	"g_ftsdamage",
	"g_ftdamage",
	"g_fttimeout",
	"g_ftbounce",
	"g_ftgravity",
	"g_ftvampire",
	"g_ftinf",
	"g_ftbouncemodifier",
	"g_ftknockback",
	"g_amdelay",
	"g_amsradius",
	"g_amspeed",
	"g_amsdamage",
	"g_amdamage",
	"g_amtimeout",
	"g_ambounce",
	"g_amgravity",
	"g_amvampire",
	"g_aminf",
	"g_ambouncemodifier",
	"g_amknockback",
	"g_glhoming",
	"g_glguided",
	"g_rlhoming",
	"g_rlguided",
	"g_pghoming",
	"g_pgguided",
	"g_bfghoming",
	"g_bfgguided",
	"g_nghoming",
	"g_ngguided",
	"g_fthoming",
	"g_ftguided",
	"g_amhoming",
	"g_amguided",
	"g_scoutspeedfactor",
	"g_scoutfirespeed",
	"g_scoutdamagefactor",
	"g_scoutgravitymodifier",
	"g_scout_infammo",
	"g_scouthealthmodifier",
	"g_doublerspeedfactor",
	"g_doublerfirespeed",
	"g_doublerdamagefactor",
	"g_doublergravitymodifier",
	"g_doubler_infammo",
	"g_doublerhealthmodifier",
	"g_guardhealthmodifier",
	"g_guardspeedfactor",
	"g_guardfirespeed",
	"g_guarddamagefactor",
	"g_guardgravitymodifier",
	"g_guard_infammo",
	"g_ammoregenspeedfactor",
	"g_ammoregenfirespeed",
	"g_ammoregen_infammo",
	"g_ammoregendamagefactor",
	"g_ammoregengravitymodifier",
	"g_ammoregenhealthmodifier",
	"g_mgammocount",
	"g_sgammocount",
	"g_glammocount",
	"g_rlammocount",
	"g_lgammocount",
	"g_rgammocount",
	"g_pgammocount",
	"g_bfgammocount",
	"g_ngammocount",
	"g_plammocount",
	"g_cgammocount",
	"g_ftammocount",
	"g_mgweaponcount",
	"g_sgweaponcount",
	"g_glweaponcount",
	"g_rlweaponcount",
	"g_lgweaponcount",
	"g_rgweaponcount",
	"g_pgweaponcount",
	"g_bfgweaponcount",
	"g_ngweaponcount",
	"g_plweaponcount",
	"g_cgweaponcount",
	"g_ftweaponcount",
	"g_amweaponcount",
	"g_teamblue_speed",
	"g_teamblue_gravityModifier",
	"g_teamblue_firespeed",
	"g_teamblue_damage",
	"g_teamblue_infammo",
	"g_teamblue_respawnwait",
	"g_teamblue_pickupitems",
	"g_teamred_speed",
	"g_teamred_gravityModifier",
	"g_teamred_firespeed",
	"g_teamred_damage",
	"g_teamred_infammo",
	"g_teamred_respawnwait",
	"g_teamred_pickupitems",
	"g_flightlimit",
	"g_flightregen",
	"g_flightpower",
	"g_regenarmor",
	"g_spectatorspeed",
	"eliminationrespawn",
	"eliminationredrespawn",
	"g_overlay",
	"g_slickmove",
	"g_accelerate",
	"g_randomItems",
	"g_locationdamage",
	"g_kill",
	"g_kamikazeinf",
	"g_invulinf",
	"g_medkitinf",
	"g_teleporterinf",
	"g_portalinf",
	"g_medkitlimit",
	"g_waterdamage",
	"g_lavadamage",
	"g_slimedamage",
	"g_maxweaponpickup",
	"g_randomteleport",
	"g_falldamagesmall",
	"g_falldamagebig",
	"g_noplayerclip",
	"g_flagrespawn",
	"g_portaltimeout",
	"g_portalhealth",
	"g_quadtime",
	"g_bsuittime",
	"g_hastetime",
	"g_invistime",
	"g_regentime",
	"g_flighttime",
	"g_invulmove",
	"g_invultime",
	"g_fasthealthregen",
	"g_slowhealthregen",
	"g_droppeditemtime",
	"g_autoflagreturn",
	"g_hastefirespeed",
	"g_medkitmodifier",
	"g_armorprotect",
	"g_respawnwait",
	"g_ammolimit",
	"g_jumpheight",
	"g_speedfactor",
	"g_spawnselect",
	"g_drowndamage",
	"g_armorrespawn",
	"g_healthrespawn",
	"g_ammorespawn",
	"g_holdablerespawn",
	"g_megahealthrespawn",
	"g_poweruprespawn",
	"g_speed",
	"g_gravity",
	"g_gravityModifier",
	"g_damageModifier",
	"g_knockback",
	"g_quadfactor",
	"g_forcerespawn",
	"g_respawntime",
	"g_weaponRespawn",
	"g_weaponTeamRespawn",
	"g_proxMineTimeout",
	"elimination_selfdamage",
	"elimination_startHealth",
	"elimination_startArmor",
	"elimination_bfg",
	"elimination_grapple",
	"elimination_roundtime",
	"elimination_warmup",
	"elimination_activewarmup",
	"elimination_allgametypes",
	"elimination_gauntlet",
	"elimination_machinegun",
	"elimination_shotgun",
	"elimination_grenade",
	"elimination_rocket",
	"elimination_railgun",
	"elimination_lightning",
	"elimination_plasmagun",
	"elimination_chain",
	"elimination_mine",
	"elimination_nail",
	"elimination_flame",
	"elimination_antimatter",
	"elimination_quad",
	"elimination_haste",
	"elimination_bsuit",
	"elimination_invis",
	"elimination_regen",
	"elimination_flight",
	"elimination_items",
	"elimination_holdable",
	"eliminationred_startHealth",
	"eliminationred_startArmor",
	"eliminationred_bfg",
	"eliminationred_grapple",
	"eliminationred_gauntlet",
	"eliminationred_machinegun",
	"eliminationred_shotgun",
	"eliminationred_grenade",
	"eliminationred_rocket",
	"eliminationred_railgun",
	"eliminationred_lightning",
	"eliminationred_plasmagun",
	"eliminationred_chain",
	"eliminationred_mine",
	"eliminationred_nail",
	"eliminationred_flame",
	"eliminationred_antimatter",
	"eliminationred_quad",
	"eliminationred_haste",
	"eliminationred_bsuit",
	"eliminationred_invis",
	"eliminationred_regen",
	"eliminationred_flight",
	"eliminationred_holdable",
	"g_vampire",
	"g_vampireMaxHealth",
	"g_regen",
	0
};

	char* 			admcvar_items[] = {
	"g_allowprops",
	"g_allowsettings",
	"g_allownpc",
	"g_allowitems",
	"g_allownoclip",
	"g_allowtoolgun",
	"g_toolplayers",
	0
};

	char* 			item_items[] = {
	"All",
	"Armor Shard",
	"Armor 50",
	"Heavy Armor",
	"Health 5",
	"Health 25",
	"Health 50",
	"Mega Health",
	"Shotgun",
	"Machinegun",
	"Grenade Launcher",
	"Rocket Launcher",
	"Lightning Gun",
	"Railgun",
	"Plasma Gun",
	"BFG10K",
	"Grappling Hook",
	"Shells",
	"Bullets",
	"Grenades",
	"Cells",
	"Lightning",
	"Rockets",
	"Slugs",
	"Bfg Ammo",
	"Personal Teleporter",
	"Medkit",
	"Quad Damage",
	"Battle Suit",
	"Speed",
	"Invisibility",
	"Regeneration",
	"Flight",
	"Kamikaze",
	"Portal",
	"Invulnerability",
	"Nails",
	"Proximity Mines",
	"Chaingun Belt",
	"Scout",
	"Guard",
	"Doubler",
	"Ammo Regen",
	"Nailgun",
	"Prox Launcher",
	"Chaingun",
	"Flamethrower",
	"Flame",
	"Light Armor",
	"Full Armor",
	"Dark Flare",
	"Bricks",
	"Diamonds",
	"Dirt",
	"Stone",
	"Bedrock",
	0
};

int SandbOffset = 0;

static sandboxmain_t	s_sandboxmain;

/*
=================
SandboxMain_SaveChanges
=================
*/
static void SandboxMain_SaveChanges( void ) {
	//save cvars
	trap_Cvar_Set( "sb_classnum_view", "none" );
	if(uis.sb_tab == 1){
	trap_Cmd_ExecuteText( EXEC_APPEND, va("set uibuildprop buildprop %s %s %i %s %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.priv.curvalue, s_sandboxmain.minmax.field.buffer, s_sandboxmain.grid.field.buffer, s_sandboxmain.modif0.field.buffer) );
	trap_Cvar_Set( "oasb_modelst", va("props/%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
	trap_Cvar_Set( "sb_sf", s_sandboxmain.modif0.field.buffer );
	trap_Cvar_Set( "sb_classnum_view", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue] );
	}
	if(uis.sb_tab == 3){
	trap_Cmd_ExecuteText( EXEC_APPEND, va("set uibuildprop spawnbot %s %s %s %s %s %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.modif0.field.buffer, s_sandboxmain.modif1.field.buffer, s_sandboxmain.modif2.field.buffer, s_sandboxmain.modif3.field.buffer, s_sandboxmain.modif4.field.buffer) );
	trap_Cvar_Set( "oasb_modelst", va("props/%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
	trap_Cvar_Set( "sb_sf", s_sandboxmain.modif0.field.buffer );
	}
	if(uis.sb_tab == 6){
	trap_Cmd_ExecuteText( EXEC_APPEND, va("set uibuildprop execscript spawnlists/%s/%s.as\n", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
	}
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode oasb_modifier 0\n" );
	trap_Cvar_SetValue( "oasb_tool", s_sandboxmain.toolslist.curvalue );
	trap_Cvar_SetValue( "sb_private", s_sandboxmain.priv.curvalue );
	trap_Cvar_Set( "sb_minmax", s_sandboxmain.minmax.field.buffer );
	trap_Cvar_Set( "sb_grid", s_sandboxmain.grid.field.buffer );
	trap_Cvar_SetValue( "sb_modelnum", s_sandboxmain.list.curvalue );
	trap_Cvar_SetValue( "sb_classnum", s_sandboxmain.classlist.curvalue );
	trap_Cvar_SetValue( "sb_toolnum", s_sandboxmain.toolslist.curvalue );
	trap_Cvar_Set( "oasb_modifiers", s_sandboxmain.modif1.field.buffer );
	trap_Cvar_Set( "oasb_idi", s_sandboxmain.modif2.field.buffer );
	trap_Cvar_Set( "oasb_height", s_sandboxmain.modif3.field.buffer );
	trap_Cvar_Set( "oasb_modifier", s_sandboxmain.modif4.field.buffer );
	if(trap_Cvar_VariableValue("oasb_tool") == 3){
	if(uis.sb_tab == 1){
	trap_Cvar_Set( "oasb_modifiers", va("%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]));
	}
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 4){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 5){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1 2\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 6){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1 2 3 4 5 6 7\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 7){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 10){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 16){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1 2 3 4\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 20){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1 2 3 4 5 6 7 8 9\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 22){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1 2\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 23){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 26){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 29){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1\n" );
	}
	if(trap_Cvar_VariableValue("oasb_tool") == 30){
	trap_Cmd_ExecuteText( EXEC_APPEND, "set uitoolmode toggle oasb_modifier 0 1 2\n" );
	}
}

/*
=================
SandboxMain_SpawnListUpdate
=================
*/
static void SandboxMain_SpawnListUpdate( void ) {
	int		y;
	int		gametype;
	char	info[MAX_INFO_STRING];
	int		i;
	int		len;
	char	*configname;
	
	
uis.spawnlist_folder 				= trap_Cvar_VariableValue("sb_classnum");
s_sandboxmain.list.numitems			= trap_FS_GetFileList( va("spawnlists/%s", s_sandboxmain.classlist.itemnames[uis.spawnlist_folder]), "as", s_sandboxmain.names, 524288 );

	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,"No items");
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 3,".as"))
			configname[len-3] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
}

/*
=================
SandboxMain_SpawnListUpdate2
=================
*/
static void SandboxMain_SpawnListUpdate2( void ) {
	int		y;
	int		gametype;
	char	info[MAX_INFO_STRING];
	int		i;
	int		len;
	char	*configname;
	
	
//uis.spawnlist_folder 				= trap_Cvar_VariableValue("sb_classnum");
s_sandboxmain.list.numitems			= trap_FS_GetFileList( va("%s", sbc_folder.string), sbc_ext.string, s_sandboxmain.names, 524288 );

	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,sbc_error.string);
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - strlen( sbc_ext.string )-1,va(".%s", sbc_ext.string)))
			configname[len-strlen( sbc_ext.string )-1] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
}

/*
=================
SandboxMain_MenuKey
=================
*/
static sfxHandle_t SandboxMain_MenuKey( int key ) {
	if( key == K_MOUSE2 || key == K_ESCAPE ) {
		SandboxMain_SaveChanges();
	}
	return Menu_DefaultKey( &s_sandboxmain.menu, key );
}

static void SandboxMain_MenuDraw( void ) {
	int i;
	float			x, y, w, h;
	vec4_t			color1 = {1.00f, 1.00f, 1.00f, 0.60f};
	vec4_t			color2 = {0.30f, 0.30f, 0.30f, 0.90f};
	vec4_t			color3 = {0.50f, 0.50f, 0.30f, 0.90f};
	
	color1[0] = sbt_color0_0.value;
	color1[1] = sbt_color0_1.value;
	color1[2] = sbt_color0_2.value;
	color1[3] = sbt_color0_3.value;
	color2[0] = sbt_color1_0.value;
	color2[1] = sbt_color1_1.value;
	color2[2] = sbt_color1_2.value;
	color2[3] = sbt_color1_3.value;
	color3[0] = sbt_color2_0.value;
	color3[1] = sbt_color2_1.value;
	color3[2] = sbt_color2_2.value;
	color3[3] = sbt_color2_3.value;

	UI_DrawHandlePic( -2.0-cl_screenoffset.integer, 0.0, 644+cl_screenoffset.integer*2, 480, trap_R_RegisterShaderNoMip( va( "%s", sbt_wallpaper.string ) ) );

	UI_DrawRoundedRect(20-cl_screenoffset.integer, 40, 600+cl_screenoffset.integer*2, 435, 30, color1);
	UI_DrawRoundedRect(372-5+cl_screenoffset.integer, 70-25, 225+10, 160+50, 20, color2);//tools
	UI_DrawRoundedRect(372-5+cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//settings
	//UI_DrawRoundedRect(20-cl_screenoffset.integer, 480+40, 600+cl_screenoffset.integer*2, 435, 30, color1);
	
	if(uis.sb_tab == 1){
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 70-25, 225+10, 160+50, 20, color2);//props
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//classes
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*1)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color3);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*2)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*3)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*4)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*5)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*6)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*7)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*8)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*9)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*10)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	}
	if(uis.sb_tab == 2){
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 70-25, 225+10, (160*2)+50+55, 20, color2);//props
	//UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//classes
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*1)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*2)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color3);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*3)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*4)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*5)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*6)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*7)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*8)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*9)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*10)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	}
	if(uis.sb_tab == 3){
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 70-25, 225+10, 160+50, 20, color2);//props
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//classes
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*1)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*2)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*3)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color3);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*4)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*5)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*6)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*7)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*8)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*9)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*10)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	}
	if(uis.sb_tab == 4){
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 70-25, 225+10, (160*2)+50+55, 20, color2);//props
	//UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//classes
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*1)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*2)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*3)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*4)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color3);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*5)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*6)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*7)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*8)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*9)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*10)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	}
	if(uis.sb_tab == 5){
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 70-25, 225+10, (160*2)+50+55, 20, color2);//props
	//UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//classes
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*1)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*2)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*3)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*4)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*5)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color3);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*6)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*7)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*8)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*9)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*10)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	}
	if(uis.sb_tab == 6){
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 70-25, 225+10, 160+50, 20, color2);//props
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//classes
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*1)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*2)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*3)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*4)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*5)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*6)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color3);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*7)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*8)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*9)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*10)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	}
	if(uis.sb_tab == 7){
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 70-25, 225+10, (160*2)+50+55, 20, color2);//props
	//UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//classes
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*1)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*2)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*3)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*4)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*5)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*6)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*7)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color3);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*8)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*9)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*10)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	}
	if(uis.sb_tab == 8){
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 70-25, 225+10, (160*2)+50+55, 20, color2);//props
	//UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//classes
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*1)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*2)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*3)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*4)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*5)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*6)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*7)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*8)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color3);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*9)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*10)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	}
	if(uis.sb_tab == 9){
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 70-25, 225+10, (160*2)+50+55, 20, color2);//props
	//UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//classes
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*1)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*2)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*3)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*4)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*5)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*6)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*7)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*8)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*9)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color3);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*10)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	}
	if(uis.sb_tab == 10){
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 70-25, 225+10, 160+50, 20, color2);//props
	UI_DrawRoundedRect(40-5-cl_screenoffset.integer, 215+70-25, 225+10, 160+50, 20, color2);//classes
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*1)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*2)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*3)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*4)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*5)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*6)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*7)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*8)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*9)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color2);
	UI_DrawRoundedRect(((-53*0.5)+(110*0.5)*10)-cl_screenoffset.integer, 10, 105*0.5, 30*0.5, 30, color3);
	}

	Menu_Draw( &s_sandboxmain.menu );

if(trap_Cvar_VariableValue("oasb_tool") == 0){
s_sandboxmain.modif1.generic.name           	= "---";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 1){
s_sandboxmain.modif1.generic.name           	= "Material 169x";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 2){
s_sandboxmain.modif1.generic.name           	= "---";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 3){
s_sandboxmain.modif1.generic.name           	= "Model";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 4){
s_sandboxmain.modif1.generic.name           	= "---";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-1)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 5){
s_sandboxmain.modif1.generic.name           	= "---";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-1)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 6){
s_sandboxmain.modif1.generic.name           	= "Target";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-7)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 7){
s_sandboxmain.modif1.generic.name           	= "---";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-1)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 8){
s_sandboxmain.modif1.generic.name           	= "---";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 9){
s_sandboxmain.modif1.generic.name           	= "Sound";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 10){
s_sandboxmain.modif1.generic.name           	= "---";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-1)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 11){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 12){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-1)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 13){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 14){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 15){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 16){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-4)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 17){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 18){
s_sandboxmain.modif1.generic.name           	= "Red";
s_sandboxmain.modif2.generic.name          		= "Green";
s_sandboxmain.modif3.generic.name          		= "Blue";
s_sandboxmain.modif4.generic.name           	= "Radius";
}
if(trap_Cvar_VariableValue("oasb_tool") == 19){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 20){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-9)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 21){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 22){
s_sandboxmain.modif1.generic.name           	= "X";
s_sandboxmain.modif2.generic.name          		= "Y";
s_sandboxmain.modif3.generic.name          		= "Z";
s_sandboxmain.modif4.generic.name           	= "Type(0-2)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 23){
s_sandboxmain.modif1.generic.name           	= "OldTexture";
s_sandboxmain.modif2.generic.name          		= "NewTexture";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-1)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 24){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 25){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-1)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 26){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 27){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 28){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "---";
}
if(trap_Cvar_VariableValue("oasb_tool") == 29){
s_sandboxmain.modif1.generic.name           	= "---";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-1)";
}
if(trap_Cvar_VariableValue("oasb_tool") == 30){
s_sandboxmain.modif1.generic.name           	= "Value";
s_sandboxmain.modif2.generic.name          		= "---";
s_sandboxmain.modif3.generic.name          		= "---";
s_sandboxmain.modif4.generic.name           	= "Type(0-2)";
}
if(uis.sb_tab == 3){
s_sandboxmain.modif1.generic.name           	= "Health";
s_sandboxmain.modif2.generic.name          		= "Name";
s_sandboxmain.modif3.generic.name          		= "Music";
s_sandboxmain.modif4.generic.name           	= "Weapon(id)";
}
if(uis.sb_tab == 10){
s_sandboxmain.modif1.generic.name           	= sbc_opt1.string;
s_sandboxmain.modif2.generic.name          		= sbc_opt2.string;
s_sandboxmain.modif3.generic.name          		= sbc_opt3.string;
s_sandboxmain.modif4.generic.name           	= sbc_opt4.string;
}
}

const char* SandboxMain_CustomReturn(int number){
if(number == 0){
return s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue];
}
if(number == 1){
return s_sandboxmain.modif1.field.buffer;
}
if(number == 2){
return s_sandboxmain.modif2.field.buffer;
}
if(number == 3){
return s_sandboxmain.modif3.field.buffer;
}
if(number == 4){
return s_sandboxmain.modif4.field.buffer;
}
return s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue];
}

/*
===============
SandboxMain_MenuEvent
===============
*/
static void SandboxMain_MenuEvent( void* ptr, int event ) {
	if( event != QM_ACTIVATED ) {
		return;
	}
	SandboxMain_SaveChanges();
	switch( ((menucommon_s*)ptr)->id ) {
	case ID_SPAWNOBJECT:
		if(uis.sb_tab == 1){
		trap_Cmd_ExecuteText( EXEC_APPEND, "vstr uibuildprop\n" );
		}
		if(uis.sb_tab == 2){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("usecvar %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif0.field.buffer) );
		}
		if(uis.sb_tab == 3){
		trap_Cmd_ExecuteText( EXEC_APPEND, "vstr uibuildprop\n" );
		}
		if(uis.sb_tab == 4){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("give %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 5){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("useadmcvar %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif0.field.buffer) );
		}
		if(uis.sb_tab == 6){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("execscript spawnlists/%s/%s.as\n", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 7){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("execscript postprocessing/%s.as\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 8){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("execscript themes/%s.as\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 9){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("execscript dscripts/%s.as\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 10){
		trap_Cmd_ExecuteText( EXEC_APPEND, va(sbc_string.string, SandboxMain_CustomReturn(sbc_arg0.integer), SandboxMain_CustomReturn(sbc_arg1.integer), SandboxMain_CustomReturn(sbc_arg2.integer), SandboxMain_CustomReturn(sbc_arg3.integer), SandboxMain_CustomReturn(sbc_arg4.integer)) );
		}
		break;
		
	case ID_TAB1:
		uis.sb_tab = 1;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		break;
		
	case ID_TAB2:
		uis.sb_tab = 2;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		break;
	
	case ID_TAB3:
		uis.sb_tab = 3;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		break;
		
	case ID_TAB4:
		uis.sb_tab = 4;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		break;
		
	case ID_TAB5:
		uis.sb_tab = 5;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		break;
		
	case ID_TAB6:
		uis.sb_tab = 6;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		break;
	
	case ID_TAB7:
		uis.sb_tab = 7;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		break;
		
	case ID_TAB8:
		uis.sb_tab = 8;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		break;
		
	case ID_TAB9:
		uis.sb_tab = 9;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		break;
		
	case ID_TAB10:
		uis.sb_tab = 10;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		break;
	
	case ID_LIST:
		if(uis.sb_tab == 1){
		trap_Cmd_ExecuteText( EXEC_APPEND, "vstr uibuildprop\n" );
		}
		if(uis.sb_tab == 2){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("usecvar %s 0 1\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif0.field.buffer) );
		}
		if(uis.sb_tab == 3){
		trap_Cmd_ExecuteText( EXEC_APPEND, "vstr uibuildprop\n" );
		}
		if(uis.sb_tab == 4){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("give %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 5){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("useadmcvar %s 0 1\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif0.field.buffer) );
		}
		if(uis.sb_tab == 6){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("execscript spawnlists/%s/%s.as\n", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 7){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("execscript postprocessing/%s.as\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 8){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("execscript themes/%s.as\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 9){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("execscript dscripts/%s.as\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 10){
		trap_Cmd_ExecuteText( EXEC_APPEND, va(sbc_string.string, SandboxMain_CustomReturn(sbc_arg0.integer), SandboxMain_CustomReturn(sbc_arg1.integer), SandboxMain_CustomReturn(sbc_arg2.integer), SandboxMain_CustomReturn(sbc_arg3.integer), SandboxMain_CustomReturn(sbc_arg4.integer)) );
		}
		break;
	
	case ID_TOOLSLIST:
		trap_Cmd_ExecuteText( EXEC_APPEND, "weapon 1\n" );
		break;
		
	case ID_CLASSLIST:
		if(uis.sb_tab == 1){
		trap_Cmd_ExecuteText( EXEC_APPEND, "vstr uibuildprop\n" );
		}
		if(uis.sb_tab == 6){
		uis.spawnlist_folder = s_sandboxmain.classlist.curvalue;
		SandboxMain_SpawnListUpdate();
		}
		if(uis.sb_tab == 10){
		trap_Cmd_ExecuteText( EXEC_APPEND, va("execscript tabs/%s.as\n", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue]) );
		SandboxMain_SpawnListUpdate2();
		}
		break;
		
	case ID_SAVEMAP:
		if(uis.sb_tab != 5){
		UI_saveMapEdMenu();
		} else {
		trap_Cmd_ExecuteText( EXEC_APPEND, "hideobjects\n" );
		}
		break;

	case ID_LOADMAP:
		if(uis.sb_tab != 5){
		UI_loadMapEdMenu();
		} else {
		trap_Cmd_ExecuteText( EXEC_APPEND, "showobjects\n" );
		}
		break;
		
	case ID_PRIV:

		break;
	}
}

/*
===============
SandboxMain_MenuInit
===============
*/
void SandboxMain_MenuInit( void ) {
	int		y;
	int		gametype;
	char	info[MAX_INFO_STRING];
	int		i;
	int		len;
	char	*configname;
	vec4_t	s_sandboxmain_color1 = {1.00f, 1.00f, 1.00f, 1.00f};

	memset( &s_sandboxmain, 0, sizeof(s_sandboxmain) );
	
	s_sandboxmain_color1[0] = sbt_color3_0.value;
	s_sandboxmain_color1[1] = sbt_color3_1.value;
	s_sandboxmain_color1[2] = sbt_color3_2.value;
	s_sandboxmain_color1[3] = sbt_color3_3.value;

	SandboxMain_Cache();
	

	s_sandboxmain.menu.draw = SandboxMain_MenuDraw;
	s_sandboxmain.menu.wrapAround = qtrue;
	s_sandboxmain.menu.fullscreen = qfalse;
	s_sandboxmain.menu.key        = SandboxMain_MenuKey;
	//s_sandboxmain.menu.downlimitscroll = 768;
	//uis.cursorx = 319;
	//uis.cursory = 80;

s_sandboxmain.tab1.string           = "Props";
s_sandboxmain.tab2.string           = "Settings";
s_sandboxmain.tab3.string           = "NPC";
s_sandboxmain.tab4.string           = "Items";
s_sandboxmain.tab5.string           = "Admin";
s_sandboxmain.tab6.string           = "Spawnlist";
s_sandboxmain.tab7.string           = "Shaders";
s_sandboxmain.tab8.string           = "Themes";
s_sandboxmain.tab9.string           = "Scripts";
s_sandboxmain.tab10.string           = "Custom";
s_sandboxmain.savemap.string		= "Save map";
s_sandboxmain.loadmap.string		= "Load map";
s_sandboxmain.priv.generic.name			= "Private:";
s_sandboxmain.minmax.generic.name		= "Coll size:";
s_sandboxmain.grid.generic.name		= "Grid size:";
s_sandboxmain.toolstext.string  				= "Tools:";
	
	s_sandboxmain.tab1.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab1.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.tab1.generic.id       	= ID_TAB1;
	s_sandboxmain.tab1.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab1.generic.x        	= (110*0.5)*1 - cl_screenoffset.integer;
	s_sandboxmain.tab1.generic.y        	= 15;
	s_sandboxmain.tab1.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab1.style			    = UI_CENTER;
	s_sandboxmain.tab1.customsize			= 0.5;
	
	s_sandboxmain.tab2.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab2.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.tab2.generic.id       	= ID_TAB2;
	s_sandboxmain.tab2.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab2.generic.x        	= (110*0.5)*2 - cl_screenoffset.integer;
	s_sandboxmain.tab2.generic.y        	= 15;
	s_sandboxmain.tab2.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab2.style			    = UI_CENTER;
	s_sandboxmain.tab2.customsize			= 0.5;
	
	s_sandboxmain.tab3.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab3.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.tab3.generic.id       	= ID_TAB3;
	s_sandboxmain.tab3.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab3.generic.x        	= (110*0.5)*3 - cl_screenoffset.integer;
	s_sandboxmain.tab3.generic.y        	= 15;
	s_sandboxmain.tab3.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab3.style			    = UI_CENTER;
	s_sandboxmain.tab3.customsize			= 0.5;
	
	s_sandboxmain.tab4.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab4.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.tab4.generic.id       	= ID_TAB4;
	s_sandboxmain.tab4.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab4.generic.x        	= (110*0.5)*4 - cl_screenoffset.integer;
	s_sandboxmain.tab4.generic.y        	= 15;
	s_sandboxmain.tab4.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab4.style			    = UI_CENTER;
	s_sandboxmain.tab4.customsize			= 0.5;
	
	s_sandboxmain.tab5.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab5.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.tab5.generic.id       	= ID_TAB5;
	s_sandboxmain.tab5.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab5.generic.x        	= (110*0.5)*5 - cl_screenoffset.integer;
	s_sandboxmain.tab5.generic.y        	= 15;
	s_sandboxmain.tab5.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab5.style			    = UI_CENTER;
	s_sandboxmain.tab5.customsize			= 0.5;
	
	s_sandboxmain.tab6.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab6.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.tab6.generic.id       	= ID_TAB6;
	s_sandboxmain.tab6.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab6.generic.x        	= (110*0.5)*6 - cl_screenoffset.integer;
	s_sandboxmain.tab6.generic.y        	= 15;
	s_sandboxmain.tab6.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab6.style			    = UI_CENTER;
	s_sandboxmain.tab6.customsize			= 0.5;
	
	s_sandboxmain.tab7.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab7.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.tab7.generic.id       	= ID_TAB7;
	s_sandboxmain.tab7.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab7.generic.x        	= (110*0.5)*7 - cl_screenoffset.integer;
	s_sandboxmain.tab7.generic.y        	= 15;
	s_sandboxmain.tab7.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab7.style			    = UI_CENTER;
	s_sandboxmain.tab7.customsize			= 0.5;

	s_sandboxmain.tab8.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab8.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.tab8.generic.id       	= ID_TAB8;
	s_sandboxmain.tab8.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab8.generic.x        	= (110*0.5)*8 - cl_screenoffset.integer;
	s_sandboxmain.tab8.generic.y        	= 15;
	s_sandboxmain.tab8.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab8.style			    = UI_CENTER;
	s_sandboxmain.tab8.customsize			= 0.5;
	
	s_sandboxmain.tab9.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab9.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.tab9.generic.id       	= ID_TAB9;
	s_sandboxmain.tab9.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab9.generic.x        	= (110*0.5)*9 - cl_screenoffset.integer;
	s_sandboxmain.tab9.generic.y        	= 15;
	s_sandboxmain.tab9.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab9.style			    = UI_CENTER;
	s_sandboxmain.tab9.customsize			= 0.5;
	
	s_sandboxmain.tab10.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab10.generic.flags    	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.tab10.generic.id       	= ID_TAB10;
	s_sandboxmain.tab10.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab10.generic.x        	= (110*0.5)*10 - cl_screenoffset.integer;
	s_sandboxmain.tab10.generic.y        	= 15;
	s_sandboxmain.tab10.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab10.style			    = UI_CENTER;
	s_sandboxmain.tab10.customsize			= 0.5;
	
	s_sandboxmain.savemap.generic.type     = MTYPE_PTEXT;
	s_sandboxmain.savemap.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.savemap.generic.id       = ID_SAVEMAP;
	s_sandboxmain.savemap.generic.callback = SandboxMain_MenuEvent;
	s_sandboxmain.savemap.generic.x        = 440 + cl_screenoffset.integer;
	s_sandboxmain.savemap.generic.y        = 420 + 5;
	s_sandboxmain.savemap.style            = UI_CENTER;
	s_sandboxmain.savemap.color            = s_sandboxmain_color1;

	s_sandboxmain.loadmap.generic.type     = MTYPE_PTEXT;
	s_sandboxmain.loadmap.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.loadmap.generic.id       = ID_LOADMAP;
	s_sandboxmain.loadmap.generic.callback = SandboxMain_MenuEvent;
	s_sandboxmain.loadmap.generic.x        = 440 + cl_screenoffset.integer;
	s_sandboxmain.loadmap.generic.y        = 420 + 25;
	s_sandboxmain.loadmap.style            = UI_CENTER;
	s_sandboxmain.loadmap.color            = s_sandboxmain_color1;
	
	y = 265;	
	s_sandboxmain.priv.generic.type			= MTYPE_RADIOBUTTON;
	s_sandboxmain.priv.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_sandboxmain.priv.generic.callback		= SandboxMain_MenuEvent;
	s_sandboxmain.priv.generic.id			= ID_PRIV;
	s_sandboxmain.priv.generic.x			= 480 + cl_screenoffset.integer;
	s_sandboxmain.priv.generic.y			= y;
	s_sandboxmain.priv.color				= s_sandboxmain_color1;
	y += 18;

	s_sandboxmain.minmax.generic.type		= MTYPE_FIELD;
	s_sandboxmain.minmax.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NUMBERSONLY;
	s_sandboxmain.minmax.field.widthInChars	= 4;
	s_sandboxmain.minmax.field.maxchars		= 4;
	s_sandboxmain.minmax.generic.x			= 480 + cl_screenoffset.integer;
	s_sandboxmain.minmax.generic.y			= y;
	s_sandboxmain.minmax.color				= s_sandboxmain_color1;
	y += 18;

	s_sandboxmain.grid.generic.type			= MTYPE_FIELD;
	s_sandboxmain.grid.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NUMBERSONLY;
	s_sandboxmain.grid.field.widthInChars	= 4;
	s_sandboxmain.grid.field.maxchars		= 4;
	s_sandboxmain.grid.generic.x			= 480 + cl_screenoffset.integer;
	s_sandboxmain.grid.generic.y			= y;
	s_sandboxmain.grid.color				= s_sandboxmain_color1;
	y += 18;
	
	s_sandboxmain.modif0.generic.type			= MTYPE_FIELD;
	s_sandboxmain.modif0.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_sandboxmain.modif0.field.widthInChars	= 14;
	s_sandboxmain.modif0.field.maxchars		= 64;
	s_sandboxmain.modif0.generic.x			= 480 + cl_screenoffset.integer;
	s_sandboxmain.modif0.generic.y			= y;
	s_sandboxmain.modif0.color				= s_sandboxmain_color1;
	y += 18;
	
	s_sandboxmain.modif1.generic.type			= MTYPE_FIELD;
	s_sandboxmain.modif1.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_sandboxmain.modif1.field.widthInChars	= 14;
	s_sandboxmain.modif1.field.maxchars		= 64;
	s_sandboxmain.modif1.generic.x			= 480 + cl_screenoffset.integer;
	s_sandboxmain.modif1.generic.y			= y;
	s_sandboxmain.modif1.color				= s_sandboxmain_color1;
	y += 18;

	s_sandboxmain.modif2.generic.type			= MTYPE_FIELD;
	s_sandboxmain.modif2.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_sandboxmain.modif2.field.widthInChars	= 14;
	s_sandboxmain.modif2.field.maxchars		= 64;
	s_sandboxmain.modif2.generic.x			= 480 + cl_screenoffset.integer;
	s_sandboxmain.modif2.generic.y			= y;
	s_sandboxmain.modif2.color				= s_sandboxmain_color1;
	y += 18;
	
	s_sandboxmain.modif3.generic.type			= MTYPE_FIELD;
	s_sandboxmain.modif3.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_sandboxmain.modif3.field.widthInChars	= 14;
	s_sandboxmain.modif3.field.maxchars		= 64;
	s_sandboxmain.modif3.generic.x			= 480 + cl_screenoffset.integer;
	s_sandboxmain.modif3.generic.y			= y;
	s_sandboxmain.modif3.color				= s_sandboxmain_color1;
	y += 18;
	
	s_sandboxmain.modif4.generic.type			= MTYPE_FIELD;
	s_sandboxmain.modif4.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_sandboxmain.modif4.field.widthInChars	= 14;
	s_sandboxmain.modif4.field.maxchars		= 64;
	s_sandboxmain.modif4.generic.x			= 480 + cl_screenoffset.integer;
	s_sandboxmain.modif4.generic.y			= y;
	s_sandboxmain.modif4.color				= s_sandboxmain_color1;
	y += 18;
	
	s_sandboxmain.spawnobject.generic.type     = MTYPE_PTEXT;
	s_sandboxmain.spawnobject.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_sandboxmain.spawnobject.generic.id       = ID_SPAWNOBJECT;
	s_sandboxmain.spawnobject.generic.callback = SandboxMain_MenuEvent;
	s_sandboxmain.spawnobject.generic.x        = 560 + cl_screenoffset.integer;
	s_sandboxmain.spawnobject.generic.y        = 448;
	s_sandboxmain.spawnobject.color					= s_sandboxmain_color1;
	s_sandboxmain.spawnobject.style					= UI_CENTER;

	if(uis.sb_tab == 1){
	s_sandboxmain.list.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "props", "md3", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 121;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.propstext.generic.y				= 50;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= color_red;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.classtext.generic.y				= 215 + 50;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= color_red;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Props:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.modif0.generic.name       		= "Spawnflags:";
	s_sandboxmain.spawnobject.string           		= "Spawn";
	}
	if(uis.sb_tab == 2){
	s_sandboxmain.list.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= 343;
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.cvar_itemslist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.propstext.generic.y				= 50;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= color_red;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.classtext.generic.y				= 215 + 50;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= color_red;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Settings:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.modif0.generic.name       		= "Value:";
	s_sandboxmain.spawnobject.string           		= "Apply";
	}
	if(uis.sb_tab == 3){
	s_sandboxmain.list.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "bots", "dbot", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 4;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.propstext.generic.y				= 50;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= color_red;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.classtext.generic.y				= 215 + 50;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= color_red;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "List:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.modif0.generic.name       		= "Skill:";
	s_sandboxmain.spawnobject.string           		= "Spawn";
	}
	if(uis.sb_tab == 4){
	s_sandboxmain.list.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= 56;
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.item_itemslist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.propstext.generic.y				= 50;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= color_red;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.classtext.generic.y				= 215 + 50;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= color_red;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Items:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.modif0.generic.name       		= "Spawnflags:";
	s_sandboxmain.spawnobject.string          		= "Give";
	}
	if(uis.sb_tab == 5){
	s_sandboxmain.list.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= 7;
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.cvar_itemslist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.propstext.generic.y				= 50;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= color_red;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.classtext.generic.y				= 215 + 50;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= color_red;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Settings:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.modif0.generic.name       		= "Value:";
	s_sandboxmain.spawnobject.string           		= "Apply";
	s_sandboxmain.savemap.string			= "Hide objects";
	s_sandboxmain.loadmap.string			= "Show objects";
	}
	if(uis.sb_tab == 6){
	s_sandboxmain.classlist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= trap_FS_GetFileList( va("spawnlists", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue]), "cfg", s_sandboxmain.names2, 524288 );
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
		
	s_sandboxmain.list.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( va("spawnlists/%s", s_sandboxmain.classlist.itemnames[uis.spawnlist_folder]), "as", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.propstext.generic.y				= 50;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= color_red;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.classtext.generic.y				= 215 + 50;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= color_red;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Items:";
	s_sandboxmain.classtext.string  				= "Lists:";
	s_sandboxmain.modif0.generic.name       		= "---";
	s_sandboxmain.spawnobject.string           		= "Spawn";
	}
	if(uis.sb_tab == 7){
	s_sandboxmain.list.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "postprocessing", "as", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.propstext.generic.y				= 50;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= color_red;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.classtext.generic.y				= 215 + 50;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= color_red;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Shaders:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.modif0.generic.name       		= "Spawnflags:";
	s_sandboxmain.spawnobject.string          		= "Load";
	}
	if(uis.sb_tab == 8){
	s_sandboxmain.list.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "themes", "as", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.propstext.generic.y				= 50;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= color_red;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.classtext.generic.y				= 215 + 50;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= color_red;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Themes:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.modif0.generic.name       		= "Spawnflags:";
	s_sandboxmain.spawnobject.string          		= "Apply";
	}
	if(uis.sb_tab == 9){
	s_sandboxmain.list.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "dscripts", "as", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.propstext.generic.y				= 50;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= color_red;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.classtext.generic.y				= 215 + 50;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= color_red;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Scripts:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.modif0.generic.name       		= "Spawnflags:";
	s_sandboxmain.spawnobject.string          		= "Execute";
	}
	if(uis.sb_tab == 10){
	s_sandboxmain.classlist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= trap_FS_GetFileList( va("tabs", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue]), "as", s_sandboxmain.names2, 524288 );
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
		
	s_sandboxmain.list.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - cl_screenoffset.integer;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( va("%s", sbc_folder.string), sbc_ext.string, s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.propstext.generic.y				= 50;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= color_red;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - cl_screenoffset.integer;
	s_sandboxmain.classtext.generic.y				= 215 + 50;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= color_red;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= sbc_tabname.string;
	s_sandboxmain.classtext.string  				= "Tabs:";
	s_sandboxmain.modif0.generic.name       		= "---";
	s_sandboxmain.spawnobject.string           		= sbc_btn.string;
	}
	
	s_sandboxmain.toolslist.generic.type		= MTYPE_SCROLLLIST;
	s_sandboxmain.toolslist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.toolslist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.toolslist.generic.id		= ID_TOOLSLIST;
	s_sandboxmain.toolslist.generic.x		= 372 + cl_screenoffset.integer;
	s_sandboxmain.toolslist.generic.y		= 70;
	s_sandboxmain.toolslist.width			= 28;
	s_sandboxmain.toolslist.height			= 15;
	s_sandboxmain.toolslist.numitems		= 31;
	s_sandboxmain.toolslist.itemnames		= (const char **)s_sandboxmain.toollist;
	s_sandboxmain.toolslist.columns			= 1;
	s_sandboxmain.toolslist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.toolstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.toolstext.generic.x				= 372 + cl_screenoffset.integer;
	s_sandboxmain.toolstext.generic.y				= 50;
	s_sandboxmain.toolstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.toolstext.color  					= color_red;
	s_sandboxmain.toolstext.style  					= UI_BIGFONT;
	
	y = 480+240;

if(uis.sb_tab == 1){
	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,"No models");
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 4,".md3"))
			configname[len-4] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
}
if(uis.sb_tab == 3){
	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,"No NPC");
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 5,".dbot"))
			configname[len-5] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
}
if(uis.sb_tab == 6){	
	if (!s_sandboxmain.classlist.numitems) {
		strcpy(s_sandboxmain.names2,"No lists");
		s_sandboxmain.classlist.numitems = 1;
	}
	else if (s_sandboxmain.classlist.numitems > 65536)
		s_sandboxmain.classlist.numitems = 65536;

	configname = s_sandboxmain.names2;
	for ( i = 0; i < s_sandboxmain.classlist.numitems; i++ ) {
		s_sandboxmain.classlist.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 4,".cfg"))
			configname[len-4] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
	
	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,"No items");
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 3,".as"))
			configname[len-3] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
}
if(uis.sb_tab == 7){
	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,"No shaders");
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 3,".as"))
			configname[len-3] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
}
if(uis.sb_tab == 8){
	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,"No themes");
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 3,".as"))
			configname[len-3] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
}
if(uis.sb_tab == 9){
	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,"No scripts");
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 3,".as"))
			configname[len-3] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
}
if(uis.sb_tab == 10){	
	if (!s_sandboxmain.classlist.numitems) {
		strcpy(s_sandboxmain.names2,"No lists");
		s_sandboxmain.classlist.numitems = 1;
	}
	else if (s_sandboxmain.classlist.numitems > 65536)
		s_sandboxmain.classlist.numitems = 65536;

	configname = s_sandboxmain.names2;
	for ( i = 0; i < s_sandboxmain.classlist.numitems; i++ ) {
		s_sandboxmain.classlist.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 3,".as"))
			configname[len-3] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
	
	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,sbc_error.string);
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - strlen( sbc_ext.string )-1,va(".%s", sbc_ext.string)))
			configname[len-strlen( sbc_ext.string )-1] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
}
	
	if(uis.sb_tab == 2){
	for (i = 0; i < 343; i++) {
	s_sandboxmain.list.itemnames[i] = cvar_items[i];
	}
	}
	if(uis.sb_tab == 4){
	for (i = 0; i < 56; i++) {
	s_sandboxmain.list.itemnames[i] = item_items[i];
	}
	}
	if(uis.sb_tab == 5){
	for (i = 0; i < 7; i++) {
	s_sandboxmain.list.itemnames[i] = admcvar_items[i];
	}
	}
	if(uis.sb_tab == 1){
	s_sandboxmain.classlist.itemnames[0] = "none";
	s_sandboxmain.classlist.itemnames[1] = "weapon_machinegun";
	s_sandboxmain.classlist.itemnames[2] = "weapon_shotgun";
	s_sandboxmain.classlist.itemnames[3] = "weapon_grenadelauncher";
	s_sandboxmain.classlist.itemnames[4] = "weapon_rocketlauncher";
	s_sandboxmain.classlist.itemnames[5] = "weapon_lightning";
	s_sandboxmain.classlist.itemnames[6] = "weapon_railgun";
	s_sandboxmain.classlist.itemnames[7] = "weapon_plasmagun";
	s_sandboxmain.classlist.itemnames[8] = "weapon_bfg";
	s_sandboxmain.classlist.itemnames[9] = "weapon_grapplinghook";
	s_sandboxmain.classlist.itemnames[10] = "weapon_nailgun";
	s_sandboxmain.classlist.itemnames[11] = "weapon_prox_launcher";
	s_sandboxmain.classlist.itemnames[12] = "weapon_chaingun";
	s_sandboxmain.classlist.itemnames[13] = "weapon_flamethrower";
	s_sandboxmain.classlist.itemnames[14] = "weapon_antimatter";
	s_sandboxmain.classlist.itemnames[15] = "ammo_bullets";
	s_sandboxmain.classlist.itemnames[16] = "ammo_shells";
	s_sandboxmain.classlist.itemnames[17] = "ammo_grenades";
	s_sandboxmain.classlist.itemnames[18] = "ammo_cells";
	s_sandboxmain.classlist.itemnames[19] = "ammo_lightning";
	s_sandboxmain.classlist.itemnames[20] = "ammo_rockets";
	s_sandboxmain.classlist.itemnames[21] = "ammo_slugs";
	s_sandboxmain.classlist.itemnames[22] = "ammo_bfg";
	s_sandboxmain.classlist.itemnames[23] = "ammo_nails";
	s_sandboxmain.classlist.itemnames[24] = "ammo_mines";
	s_sandboxmain.classlist.itemnames[25] = "ammo_belt";
	s_sandboxmain.classlist.itemnames[26] = "ammo_flame";
	s_sandboxmain.classlist.itemnames[27] = "item_armor_shard";
	s_sandboxmain.classlist.itemnames[28] = "item_armor_combat";
	s_sandboxmain.classlist.itemnames[29] = "item_armor_body";
	s_sandboxmain.classlist.itemnames[30] = "item_armor_full";
	s_sandboxmain.classlist.itemnames[31] = "item_armor_vest";
	s_sandboxmain.classlist.itemnames[32] = "item_health_small";
	s_sandboxmain.classlist.itemnames[33] = "item_health";
	s_sandboxmain.classlist.itemnames[34] = "item_health_large";
	s_sandboxmain.classlist.itemnames[35] = "item_health_mega";
	s_sandboxmain.classlist.itemnames[36] = "item_quad";
	s_sandboxmain.classlist.itemnames[37] = "item_enviro";
	s_sandboxmain.classlist.itemnames[38] = "item_haste";
	s_sandboxmain.classlist.itemnames[39] = "item_invis";
	s_sandboxmain.classlist.itemnames[40] = "item_regen";
	s_sandboxmain.classlist.itemnames[41] = "item_flight";
	s_sandboxmain.classlist.itemnames[42] = "item_scout";
	s_sandboxmain.classlist.itemnames[43] = "item_doubler";
	s_sandboxmain.classlist.itemnames[44] = "item_ammoregen";
	s_sandboxmain.classlist.itemnames[45] = "item_guard";
	s_sandboxmain.classlist.itemnames[46] = "holdable_teleporter";
	s_sandboxmain.classlist.itemnames[47] = "holdable_medkit";
	s_sandboxmain.classlist.itemnames[48] = "holdable_kamikaze";
	s_sandboxmain.classlist.itemnames[49] = "holdable_invulnerability";
	s_sandboxmain.classlist.itemnames[50] = "holdable_portal";
	s_sandboxmain.classlist.itemnames[51] = "info_player_deathmatch";
	s_sandboxmain.classlist.itemnames[52] = "team_CTF_redspawn";
	s_sandboxmain.classlist.itemnames[53] = "team_CTF_bluespawn";
	s_sandboxmain.classlist.itemnames[54] = "team_redobelisk";
	s_sandboxmain.classlist.itemnames[55] = "team_blueobelisk";
	s_sandboxmain.classlist.itemnames[56] = "team_neutralobelisk";
	s_sandboxmain.classlist.itemnames[57] = "team_CTF_neutralflag";
	s_sandboxmain.classlist.itemnames[58] = "team_CTF_blueflag";
	s_sandboxmain.classlist.itemnames[59] = "team_CTF_redflag";
	s_sandboxmain.classlist.itemnames[60] = "team_CTF_redplayer";
	s_sandboxmain.classlist.itemnames[61] = "team_CTF_blueplayer";
	s_sandboxmain.classlist.itemnames[62] = "holdable_key_blue";
	s_sandboxmain.classlist.itemnames[63] = "holdable_key_gold";
	s_sandboxmain.classlist.itemnames[64] = "holdable_key_green";
	s_sandboxmain.classlist.itemnames[65] = "holdable_key_iron";
	s_sandboxmain.classlist.itemnames[66] = "holdable_key_master";
	s_sandboxmain.classlist.itemnames[67] = "holdable_key_red";
	s_sandboxmain.classlist.itemnames[68] = "holdable_key_silver";
	s_sandboxmain.classlist.itemnames[69] = "holdable_key_yellow";
	s_sandboxmain.classlist.itemnames[70] = "info_waypoint";
	s_sandboxmain.classlist.itemnames[71] = "info_camera";
	s_sandboxmain.classlist.itemnames[72] = "func_static";
	s_sandboxmain.classlist.itemnames[73] = "trigger_multiple";
	s_sandboxmain.classlist.itemnames[74] = "trigger_push";
	s_sandboxmain.classlist.itemnames[75] = "trigger_hurt";
	s_sandboxmain.classlist.itemnames[76] = "trigger_frag";
	s_sandboxmain.classlist.itemnames[77] = "trigger_lock";
	s_sandboxmain.classlist.itemnames[78] = "target_give";
	s_sandboxmain.classlist.itemnames[79] = "target_remove_powerups";
	s_sandboxmain.classlist.itemnames[80] = "target_delay";
	s_sandboxmain.classlist.itemnames[81] = "target_print";
	s_sandboxmain.classlist.itemnames[82] = "target_laser";
	s_sandboxmain.classlist.itemnames[83] = "target_score";
	s_sandboxmain.classlist.itemnames[84] = "target_clienttarg";
	s_sandboxmain.classlist.itemnames[85] = "target_music";
	s_sandboxmain.classlist.itemnames[86] = "target_sound";
	s_sandboxmain.classlist.itemnames[87] = "target_model";
	s_sandboxmain.classlist.itemnames[88] = "target_legs";
	s_sandboxmain.classlist.itemnames[89] = "target_head";
	s_sandboxmain.classlist.itemnames[90] = "target_teleporter";
	s_sandboxmain.classlist.itemnames[91] = "target_relay";
	s_sandboxmain.classlist.itemnames[92] = "target_kill";
	s_sandboxmain.classlist.itemnames[93] = "target_position";
	s_sandboxmain.classlist.itemnames[94] = "target_push";
	s_sandboxmain.classlist.itemnames[95] = "target_logic";
	s_sandboxmain.classlist.itemnames[96] = "target_gravity";
	s_sandboxmain.classlist.itemnames[97] = "target_unlink";
	s_sandboxmain.classlist.itemnames[98] = "target_debrisemitter";
	s_sandboxmain.classlist.itemnames[99] = "target_earthquake";
	s_sandboxmain.classlist.itemnames[100] = "target_effect";
	s_sandboxmain.classlist.itemnames[101] = "target_modify";
	s_sandboxmain.classlist.itemnames[102] = "target_playerstats";
	s_sandboxmain.classlist.itemnames[103] = "target_variable";
	s_sandboxmain.classlist.itemnames[104] = "target_cutscene";
	s_sandboxmain.classlist.itemnames[105] = "target_stats";
	s_sandboxmain.classlist.itemnames[106] = "target_music";
	s_sandboxmain.classlist.itemnames[107] = "misc_teleporter_dest";
	s_sandboxmain.classlist.itemnames[108] = "shooter_rocket";
	s_sandboxmain.classlist.itemnames[109] = "shooter_grenade";
	s_sandboxmain.classlist.itemnames[110] = "shooter_plasma";
	s_sandboxmain.classlist.itemnames[111] = "shooter_bfg";
	s_sandboxmain.classlist.itemnames[112] = "shooter_prox";
	s_sandboxmain.classlist.itemnames[113] = "shooter_flame";
	s_sandboxmain.classlist.itemnames[114] = "shooter_antimatter";
	s_sandboxmain.classlist.itemnames[115] = "shooter_custom";
	s_sandboxmain.classlist.itemnames[116] = "weapon_brick";
	s_sandboxmain.classlist.itemnames[117] = "weapon_diamond";
	s_sandboxmain.classlist.itemnames[118] = "weapon_dirt";
	s_sandboxmain.classlist.itemnames[119] = "weapon_stone";
	s_sandboxmain.classlist.itemnames[120] = "weapon_bedrock";
	}
	if(uis.sb_tab == 3){
	s_sandboxmain.classlist.itemnames[0] = "NPC_Citizen";
	s_sandboxmain.classlist.itemnames[1] = "NPC_Enemy";
	s_sandboxmain.classlist.itemnames[2] = "NPC_Guard";
	s_sandboxmain.classlist.itemnames[3] = "NPC_Partner";
	}
	
	
	s_sandboxmain.toolslist.itemnames[0] = "None";
	s_sandboxmain.toolslist.itemnames[1] = "Set Material";
	s_sandboxmain.toolslist.itemnames[2] = "Delete";
	s_sandboxmain.toolslist.itemnames[3] = "Set Model";
	s_sandboxmain.toolslist.itemnames[4] = "Set Physics";
	s_sandboxmain.toolslist.itemnames[5] = "Set Permission";
	s_sandboxmain.toolslist.itemnames[6] = "Targeting";
	s_sandboxmain.toolslist.itemnames[7] = "Set Collision";
	s_sandboxmain.toolslist.itemnames[8] = "Reload";
	s_sandboxmain.toolslist.itemnames[9] = "Set Sound";
	s_sandboxmain.toolslist.itemnames[10] = "Locker";
	s_sandboxmain.toolslist.itemnames[11] = "Set Speed";
	s_sandboxmain.toolslist.itemnames[12] = "Set Message";
	s_sandboxmain.toolslist.itemnames[13] = "Set Team";
	s_sandboxmain.toolslist.itemnames[14] = "Set Wait";
	s_sandboxmain.toolslist.itemnames[15] = "Set Count";
	s_sandboxmain.toolslist.itemnames[16] = "Set Health";
	s_sandboxmain.toolslist.itemnames[17] = "Set Price";
	s_sandboxmain.toolslist.itemnames[18] = "Set Color";
	s_sandboxmain.toolslist.itemnames[19] = "Set Damage";
	s_sandboxmain.toolslist.itemnames[20] = "Setup Missile";
	s_sandboxmain.toolslist.itemnames[21] = "Set Allowuse";
	s_sandboxmain.toolslist.itemnames[22] = "Set Angles";
	s_sandboxmain.toolslist.itemnames[23] = "Set TargetShaderName";
	s_sandboxmain.toolslist.itemnames[24] = "Set TeleporterTarget";
	s_sandboxmain.toolslist.itemnames[25] = "Set Modify";
	s_sandboxmain.toolslist.itemnames[26] = "Set Music";
	s_sandboxmain.toolslist.itemnames[27] = "Set Distance";
	s_sandboxmain.toolslist.itemnames[28] = "Set Type";
	s_sandboxmain.toolslist.itemnames[29] = "Physgun";
	s_sandboxmain.toolslist.itemnames[30] = "Scale Tool";
	

	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.frame );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab1 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab2 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab3 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab4 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab5 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab6 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab7 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab8 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab9 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.tab10 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.spawnobject );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.priv );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.minmax );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.grid );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.savemap );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.loadmap );
	if(uis.sb_tab == 1){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 2){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 3){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 4){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 5){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 6){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 7){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 8){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 9){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	//Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 10){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.toolslist );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.toolstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.modif0 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.modif1 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.modif2 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.modif3 );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.modif4 );
	
	s_sandboxmain.priv.curvalue = trap_Cvar_VariableValue("sb_private");
	Q_strncpyz( s_sandboxmain.minmax.field.buffer, UI_Cvar_VariableString("sb_minmax"), sizeof(s_sandboxmain.minmax.field.buffer) );
	Q_strncpyz( s_sandboxmain.grid.field.buffer, UI_Cvar_VariableString("sb_grid"), sizeof(s_sandboxmain.grid.field.buffer) );
	s_sandboxmain.list.curvalue = trap_Cvar_VariableValue("sb_modelnum");
	s_sandboxmain.classlist.curvalue = trap_Cvar_VariableValue("sb_classnum");
	s_sandboxmain.toolslist.curvalue = trap_Cvar_VariableValue("sb_toolnum");
	Q_strncpyz( s_sandboxmain.modif0.field.buffer, UI_Cvar_VariableString("sb_sf"), sizeof(s_sandboxmain.modif0.field.buffer) );
	Q_strncpyz( s_sandboxmain.modif1.field.buffer, UI_Cvar_VariableString("oasb_modifiers"), sizeof(s_sandboxmain.modif1.field.buffer) );
	Q_strncpyz( s_sandboxmain.modif2.field.buffer, UI_Cvar_VariableString("oasb_idi"), sizeof(s_sandboxmain.modif2.field.buffer) );
	Q_strncpyz( s_sandboxmain.modif3.field.buffer, UI_Cvar_VariableString("oasb_height"), sizeof(s_sandboxmain.modif3.field.buffer) );
	Q_strncpyz( s_sandboxmain.modif4.field.buffer, UI_Cvar_VariableString("oasb_modifier"), sizeof(s_sandboxmain.modif4.field.buffer) );
	
	if(uis.sb_tab == 6){
	SandboxMain_SpawnListUpdate();
	}
	if(uis.sb_tab == 10){
	SandboxMain_SpawnListUpdate2();
	}
}


/*
===============
SandboxMain_Cache
===============
*/
void SandboxMain_Cache( void ) {
	//trap_R_RegisterShaderNoMip( SANDBOX_FRAME );
}


/*
===============
UI_SandboxMainMenu
===============
*/
void UI_SandboxMainMenu( void ) {
	if(!uis.sb_tab){ uis.sb_tab = 1;}
	SandboxMain_MenuInit();
	UI_PushMenu ( &s_sandboxmain.menu );
}
