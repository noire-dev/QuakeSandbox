//Copyright (C) 1999-2005 Id Software, Inc.
//
//
// ui_sandbox.c
//

#include "ui_local.h"


#define SANDBOX_FRAME	"menu/art/cut_frame"

#define ID_LIST			100
#define ID_CLASSLIST	101
#define ID_TEXTURESLIST	102
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
#define ID_CLOSE		117
#define ID_SWITCHTAB	118

#define PROPERTIES_NUM	18

#define MODIF(i) s_sandboxmain.modif[i].field.buffer
#define MODIF_LIST MODIF(0), MODIF(1), MODIF(2), MODIF(3), MODIF(4), MODIF(5), MODIF(6), MODIF(7), MODIF(8), MODIF(9), MODIF(10), MODIF(11), MODIF(12), MODIF(13), MODIF(14), MODIF(15), MODIF(16), MODIF(17)

typedef struct
{
	menuframework_s	menu;
	menubitmap_s	frame;
	menutext_s		spawnobject;
	menuradiobutton_s		priv;
	menufield_s		grid;
	menutext_s		savemap;
	menutext_s		loadmap;
	menutext_s		propstext;
	menutext_s		classtext;
	menufield_s		modif[PROPERTIES_NUM];
	menuobject_s	list;
	menuobject_s	classlist;
	menuobject_s	texturelist;
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
	menutext_s		close;
	menutext_s		switchtab;
	
	char			names[524288];
	char			names2[524288];
	char*			configlist[524288];
	char*			classeslist[65536];
	char*			textureslist[65536];
	char*			botclasslist[65536];
	char*			toollist[65536];
	char*			cvar_itemslist[524288];
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
	"g_regenarmor",
	"g_spectatorspeed",
	"eliminationrespawn",
	"eliminationredrespawn",
	"g_overlay",
	"g_slickmove",
	"g_accelerate",
	"g_randomItems",
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
	"g_allowphysgun",
	"g_allowgravitygun",
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
	"Toolgun",
	"Physgun",
	"Gravitygun",
	0
};

int SandbOffset = 0;

static sandboxmain_t	s_sandboxmain;

const char* tool_spawnpreset_arg(int num){
	if(num == 1){
		if(!toolgun_disabledarg1.integer){
			return s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue];
		} else {
			return "";
		}
	}
	if(num == 2){
		if(!toolgun_disabledarg2.integer){
			if(s_sandboxmain.priv.curvalue){
			return "1";
			} else {
			return "0";	
			}
		} else {
			return "";
		}
	}
	if(num == 3){
		if(!toolgun_disabledarg3.integer){
			return s_sandboxmain.grid.field.buffer;
		} else {
			return "";
		}
	}
	if(num == 4){
		if(!toolgun_disabledarg4.integer){
			return s_sandboxmain.texturelist.itemnames[s_sandboxmain.texturelist.curvalue];
		} else {
			return "";
		}
	}
	
return "undefined presetarg";
}

/*
=================
SandboxMain_SaveChanges
=================
*/
static void SandboxMain_SaveChanges( void ) {
	//save cvars
	trap_Cvar_Set( "sb_classnum_view", "none" );
	if(uis.sb_tab == 1){
	trap_Cmd_ExecuteText( EXEC_INSERT, va(tool_spawnpreset.string, tool_spawnpreset_arg(1), tool_spawnpreset_arg(2), tool_spawnpreset_arg(3), tool_spawnpreset_arg(4), MODIF_LIST) );
	trap_Cvar_Set( "toolgun_modelst", va("props/%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
	trap_Cvar_Set( "sb_classnum_view", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue] );
	trap_Cvar_Set( "sb_texturename", s_sandboxmain.texturelist.itemnames[s_sandboxmain.texturelist.curvalue] );
	}
	if(uis.sb_tab == 2){
	trap_Cmd_ExecuteText( EXEC_INSERT, va(spawn_preset.string, s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.priv.curvalue, s_sandboxmain.grid.field.buffer, "0") );
	trap_Cvar_Set( "toolgun_modelst", va("props/%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
	trap_Cvar_Set( "sb_classnum_view", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue] );
	}
	if(uis.sb_tab == 3){
	trap_Cvar_Set( "toolcmd_spawn", va("sl npc \"%s\" \"%s\" \"%s\" \"%s\" \"%s\" \"%s\" \"%s\"\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.modif[0].field.buffer, s_sandboxmain.modif[1].field.buffer, s_sandboxmain.modif[2].field.buffer, s_sandboxmain.modif[3].field.buffer, s_sandboxmain.modif[4].field.buffer) );
	trap_Cvar_Set( "toolgun_modelst", va("props/%s", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
	}
	if(uis.sb_tab == 6){
	trap_Cvar_Set( "toolcmd_spawn", va("ns_openscript_ui spawnlists/%s/%s.ns\n", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
	}
	trap_Cvar_SetValue( "sb_private", s_sandboxmain.priv.curvalue );
	trap_Cvar_Set( "sb_grid", s_sandboxmain.grid.field.buffer );
	trap_Cvar_SetValue( "sb_modelnum", s_sandboxmain.list.curvalue );
	trap_Cvar_SetValue( "sb_classnum", s_sandboxmain.classlist.curvalue );
	trap_Cvar_SetValue( "sb_texturenum", s_sandboxmain.texturelist.curvalue );
	trap_Cvar_Set( "toolgun_mod1", s_sandboxmain.modif[0].field.buffer );
	trap_Cvar_Set( "toolgun_mod2", s_sandboxmain.modif[1].field.buffer );
	trap_Cvar_Set( "toolgun_mod3", s_sandboxmain.modif[2].field.buffer );
	trap_Cvar_Set( "toolgun_mod4", s_sandboxmain.modif[3].field.buffer );
	trap_Cvar_Set( "toolgun_mod5", s_sandboxmain.modif[4].field.buffer );
	trap_Cvar_Set( "toolgun_mod6", s_sandboxmain.modif[5].field.buffer );
	trap_Cvar_Set( "toolgun_mod7", s_sandboxmain.modif[6].field.buffer );
	trap_Cvar_Set( "toolgun_mod8", s_sandboxmain.modif[7].field.buffer );
	trap_Cvar_Set( "toolgun_mod9", s_sandboxmain.modif[8].field.buffer );
	trap_Cvar_Set( "toolgun_mod10", s_sandboxmain.modif[9].field.buffer );
	trap_Cvar_Set( "toolgun_mod11", s_sandboxmain.modif[10].field.buffer );
	trap_Cvar_Set( "toolgun_mod12", s_sandboxmain.modif[11].field.buffer );
	trap_Cvar_Set( "toolgun_mod13", s_sandboxmain.modif[12].field.buffer );
	trap_Cvar_Set( "toolgun_mod14", s_sandboxmain.modif[13].field.buffer );
	trap_Cvar_Set( "toolgun_mod15", s_sandboxmain.modif[14].field.buffer );
	trap_Cvar_Set( "toolgun_mod16", s_sandboxmain.modif[15].field.buffer );
	trap_Cvar_Set( "toolgun_mod17", s_sandboxmain.modif[16].field.buffer );
	trap_Cvar_Set( "toolgun_mod18", s_sandboxmain.modif[17].field.buffer );
	if(uis.sb_tab == 1){
	if(trap_Cvar_VariableValue("toolgun_tool") == 1){
	trap_Cvar_Set( "toolgun_mod1", s_sandboxmain.texturelist.itemnames[s_sandboxmain.texturelist.curvalue]);
	Q_strncpyz( s_sandboxmain.modif[0].field.buffer, s_sandboxmain.texturelist.itemnames[s_sandboxmain.texturelist.curvalue], sizeof(s_sandboxmain.modif[0].field.buffer) );
	}
	if(trap_Cvar_VariableValue("toolgun_tool") == 3){
	trap_Cvar_Set( "toolgun_mod1", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]);
	Q_strncpyz( s_sandboxmain.modif[0].field.buffer, s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], sizeof(s_sandboxmain.modif[0].field.buffer) );
	}
	}
	trap_Cmd_ExecuteText( EXEC_INSERT, va(tool_modifypreset.string, MODIF_LIST) );
	trap_Cmd_ExecuteText( EXEC_INSERT, va(tool_modifypreset2.string, MODIF_LIST) );
	trap_Cmd_ExecuteText( EXEC_INSERT, va(tool_modifypreset3.string, MODIF_LIST) );
	trap_Cmd_ExecuteText( EXEC_INSERT, va(tool_modifypreset4.string, MODIF_LIST) );
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
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( va("spawnlists/%s", s_sandboxmain.classlist.itemnames[uis.spawnlist_folder]), "ns", s_sandboxmain.names, 524288 );

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
		if (!Q_stricmp(configname +  len - 3,".ns"))
			configname[len-3] = '\0';

		configname += len + 1;
	}
	strcpy(s_sandboxmain.list.string, va("spawnlists/%s/icons", s_sandboxmain.classlist.itemnames[uis.spawnlist_folder]));
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
	vec4_t			sbcolor1 = {1.00f, 1.00f, 1.00f, 0.60f};
	vec4_t			sbcolor2 = {0.30f, 0.30f, 0.30f, 0.90f};
	vec4_t			sbcolor3 = {0.50f, 0.50f, 0.30f, 0.90f};
	float			x, y, w, h;
	
	sbcolor1[0] = sbt_color0_0.value;
	sbcolor1[1] = sbt_color0_1.value;
	sbcolor1[2] = sbt_color0_2.value;
	sbcolor1[3] = sbt_color0_3.value;
	sbcolor2[0] = sbt_color1_0.value;
	sbcolor2[1] = sbt_color1_1.value;
	sbcolor2[2] = sbt_color1_2.value;
	sbcolor2[3] = sbt_color1_3.value;
	sbcolor3[0] = sbt_color2_0.value;
	sbcolor3[1] = sbt_color2_1.value;
	sbcolor3[2] = sbt_color2_2.value;
	sbcolor3[3] = sbt_color2_3.value;
	s_sandboxmain_color1[0] = sbt_color3_0.value;
	s_sandboxmain_color1[1] = sbt_color3_1.value;
	s_sandboxmain_color1[2] = sbt_color3_2.value;
	s_sandboxmain_color1[3] = sbt_color3_3.value;

	UI_DrawHandlePic( -2.0-uis.wideoffset, 0.0, 644+uis.wideoffset*2, 480, trap_R_RegisterShaderNoMip( va( "%s", sbt_wallpaper.string ) ) );

	UI_DrawRoundedRect(20-uis.wideoffset, 40, 600+uis.wideoffset*2, 435, 10, sbcolor1);
	UI_DrawRoundedRect(372-5+uis.wideoffset, 70-25, 225+10, (160*2)+50+55, 12, sbcolor2);	//tools
	
	if(uis.sb_tab == 1){
	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//props
	UI_DrawRoundedRect(40-5-uis.wideoffset, 215+70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//classes
	}
	if(uis.sb_tab == 2){
	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
	}
	if(uis.sb_tab == 3){
	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//props
	UI_DrawRoundedRect(40-5-uis.wideoffset, 215+70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//classes
	}
	if(uis.sb_tab == 4){
	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
	}
	if(uis.sb_tab == 5){
	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
	}
	if(uis.sb_tab == 6){
	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//props
	UI_DrawRoundedRect(40-5-uis.wideoffset, 215+70-25, 225+100+(uis.wideoffset*2), 160+50, 12, sbcolor2);//classes
	}
	if(uis.sb_tab == 7){
	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
	}
	if(uis.sb_tab == 8){
	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
	}
	if(uis.sb_tab == 9){
	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
	}
	if(uis.sb_tab == 10){
	UI_DrawRoundedRect(40-5-uis.wideoffset, 70-25, 225+100+(uis.wideoffset*2), (160*2)+50+55, 12, sbcolor2);//props
	}
	
	for (i = 1; i <= 10; i++) {
		int xOffset = ((-53 * 0.5) + (110 * 0.5) * i) - uis.wideoffset;
		if (uis.sb_tab == i) {
			UI_DrawRoundedRect(xOffset, 10, 105 * 0.5, 30 * 0.5, 30, sbcolor3);
		} else {
			UI_DrawRoundedRect(xOffset, 10, 105 * 0.5, 30 * 0.5, 30, sbcolor2);
		}
	}
	
	UI_DrawRoundedRect((640-(110*0.5))+uis.wideoffset, 10, 105*0.5, 30*0.5, 30, sbcolor2);
	
	if(uis.sb_tab == 1 || uis.sb_tab == 8){
	UI_DrawRoundedRect( 540 + uis.wideoffset, 55, 105*0.5, 30*0.5, 30, sbcolor3);
	}

	Menu_Draw( &s_sandboxmain.menu );
	
	s_sandboxmain.modif[0].generic.name           	= toolgun_toolset1.string;
	s_sandboxmain.modif[1].generic.name          	= toolgun_toolset2.string;
	s_sandboxmain.modif[2].generic.name          	= toolgun_toolset3.string;
	s_sandboxmain.modif[3].generic.name           	= toolgun_toolset4.string;
	s_sandboxmain.modif[4].generic.name           	= toolgun_toolset5.string;
	s_sandboxmain.modif[5].generic.name          	= toolgun_toolset6.string;
	s_sandboxmain.modif[6].generic.name          	= toolgun_toolset7.string;
	s_sandboxmain.modif[7].generic.name           	= toolgun_toolset8.string;
	s_sandboxmain.modif[8].generic.name          	= toolgun_toolset9.string;
	s_sandboxmain.modif[9].generic.name           	= toolgun_toolset10.string;
	s_sandboxmain.modif[10].generic.name           	= toolgun_toolset11.string;
	s_sandboxmain.modif[11].generic.name          	= toolgun_toolset12.string;
	s_sandboxmain.modif[12].generic.name          	= toolgun_toolset13.string;
	s_sandboxmain.modif[13].generic.name           	= toolgun_toolset14.string;
	s_sandboxmain.modif[14].generic.name           	= toolgun_toolset15.string;
	s_sandboxmain.modif[15].generic.name          	= toolgun_toolset16.string;
	s_sandboxmain.modif[16].generic.name          	= toolgun_toolset17.string;
	s_sandboxmain.modif[17].generic.name           	= toolgun_toolset18.string;
	
	if(uis.sb_tab == 3){
		s_sandboxmain.modif[0].generic.name       		= "Skill:";
		s_sandboxmain.modif[1].generic.name           	= "Health:";
		s_sandboxmain.modif[2].generic.name          	= "Name:";
		s_sandboxmain.modif[3].generic.name          	= "Music:";
		s_sandboxmain.modif[4].generic.name           	= "Weapon(id):";
		s_sandboxmain.modif[5].generic.name          	= "--------:";
		s_sandboxmain.modif[6].generic.name          	= "--------:";
		s_sandboxmain.modif[7].generic.name           	= "--------:";
		s_sandboxmain.modif[8].generic.name          	= "--------:";
		s_sandboxmain.modif[9].generic.name           	= "--------:";
		s_sandboxmain.modif[10].generic.name           	= "--------:";
		s_sandboxmain.modif[11].generic.name          	= "--------:";
		s_sandboxmain.modif[12].generic.name          	= "--------:";
		s_sandboxmain.modif[13].generic.name           	= "--------:";
		s_sandboxmain.modif[14].generic.name           	= "--------:";
		s_sandboxmain.modif[15].generic.name          	= "--------:";
		s_sandboxmain.modif[16].generic.name          	= "--------:";
		s_sandboxmain.modif[17].generic.name           	= "--------:";
	}
	
	if(uis.sb_tab == 5 || uis.sb_tab == 9){
		s_sandboxmain.modif[0].generic.name       		= "Value:";
		s_sandboxmain.modif[1].generic.name           	= "--------:";
		s_sandboxmain.modif[2].generic.name          	= "--------:";
		s_sandboxmain.modif[3].generic.name          	= "--------:";
		s_sandboxmain.modif[4].generic.name           	= "--------:";
		s_sandboxmain.modif[5].generic.name          	= "--------:";
		s_sandboxmain.modif[6].generic.name          	= "--------:";
		s_sandboxmain.modif[7].generic.name           	= "--------:";
		s_sandboxmain.modif[8].generic.name          	= "--------:";
		s_sandboxmain.modif[9].generic.name           	= "--------:";
		s_sandboxmain.modif[10].generic.name           	= "--------:";
		s_sandboxmain.modif[11].generic.name          	= "--------:";
		s_sandboxmain.modif[12].generic.name          	= "--------:";
		s_sandboxmain.modif[13].generic.name           	= "--------:";
		s_sandboxmain.modif[14].generic.name           	= "--------:";
		s_sandboxmain.modif[15].generic.name          	= "--------:";
		s_sandboxmain.modif[16].generic.name          	= "--------:";
		s_sandboxmain.modif[17].generic.name           	= "--------:";
	}
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
		Q_strncpyz( s_sandboxmain.modif[4].field.buffer, "0", sizeof(s_sandboxmain.modif[4].field.buffer) );
		trap_Cmd_ExecuteText( EXEC_INSERT, "ns_openscript_ui tools/create.ns\n" );
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );	
		}
		if(uis.sb_tab == 2){
		Q_strncpyz( s_sandboxmain.modif[4].field.buffer, "0", sizeof(s_sandboxmain.modif[4].field.buffer) );
		trap_Cmd_ExecuteText( EXEC_INSERT, "ns_openscript_ui tools/create.ns\n" );
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );	
		}
		if(uis.sb_tab == 3){
		Q_strncpyz( s_sandboxmain.modif[4].field.buffer, "0", sizeof(s_sandboxmain.modif[4].field.buffer) );
		trap_Cmd_ExecuteText( EXEC_INSERT, "ns_openscript_ui tools/create.ns\n" );
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );	
		}
		if(uis.sb_tab == 4){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("give %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 5){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("useadmcvar %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif[0].field.buffer) );
		}
		if(uis.sb_tab == 6){
		Q_strncpyz( s_sandboxmain.modif[4].field.buffer, "0", sizeof(s_sandboxmain.modif[4].field.buffer) );
		trap_Cmd_ExecuteText( EXEC_INSERT, "ns_openscript_ui tools/create.ns\n" );
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );	
		}
		if(uis.sb_tab == 7){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("ns_openscript_ui dscripts/%s.ns\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 8){
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );
		}
		if(uis.sb_tab == 9){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("usecvar %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif[0].field.buffer) );
		}
		if(uis.sb_tab == 10){
		UI_PopMenu();
		trap_Cmd_ExecuteText( EXEC_INSERT, va("nsgui %s.ns; set lastui nsgui %s.ns\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		break;
	
	case ID_CLOSE:
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback\n" );
		break;
		
	case ID_SWITCHTAB:
		if(uis.sb_tab == 1){
		uis.sb_tab = 8;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );	
		return;
		}
		if(uis.sb_tab == 8){
		uis.sb_tab = 1;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );	
		return;
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
		uis.texturelist_folder = s_sandboxmain.list.curvalue;
		trap_Cmd_ExecuteText( EXEC_INSERT, "menuback; wait 0; ui_sandbox\n" );
		}
		if(uis.sb_tab == 3){
		trap_Cmd_ExecuteText( EXEC_NOW, va("set toolcmd_spawn sl npc %s %s %s %s %s %s %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.modif[0].field.buffer, s_sandboxmain.modif[1].field.buffer, s_sandboxmain.modif[2].field.buffer, s_sandboxmain.modif[3].field.buffer, s_sandboxmain.modif[4].field.buffer) );
		trap_Cmd_ExecuteText( EXEC_INSERT, "vstr toolcmd_spawn\n" );
		}
		if(uis.sb_tab == 4){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("give %s\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 5){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("useadmcvar %s 0 1\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif[0].field.buffer) );
		}
		if(uis.sb_tab == 6){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("ns_openscript_ui spawnlists/%s/%s.ns\n", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 7){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("ns_openscript_ui dscripts/%s.ns\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 8){
		Q_strncpyz( s_sandboxmain.modif[4].field.buffer, "0", sizeof(s_sandboxmain.modif[4].field.buffer) );
		trap_Cmd_ExecuteText( EXEC_INSERT, va("ns_openscript_ui tools/%s.ns\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		if(uis.sb_tab == 9){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("usecvar %s 0 1\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.modif[0].field.buffer) );
		}
		if(uis.sb_tab == 10){
		UI_PopMenu();
		trap_Cmd_ExecuteText( EXEC_INSERT, va("nsgui %s.ns; set lastui nsgui %s.ns\n", s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue]) );
		}
		break;

	case ID_TEXTURESLIST:
		trap_Cmd_ExecuteText( EXEC_NOW, va(tool_spawnpreset.string, tool_spawnpreset_arg(1), tool_spawnpreset_arg(2), tool_spawnpreset_arg(3), tool_spawnpreset_arg(4), MODIF_LIST) );
		trap_Cmd_ExecuteText( EXEC_INSERT, "vstr toolcmd_spawn\n" );
		break;
		
	case ID_CLASSLIST:
		if(uis.sb_tab == 2){
		trap_Cmd_ExecuteText( EXEC_NOW, va(spawn_preset.string, s_sandboxmain.list.itemnames[s_sandboxmain.list.curvalue], s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue], s_sandboxmain.priv.curvalue, s_sandboxmain.grid.field.buffer, "0") );
		trap_Cmd_ExecuteText( EXEC_INSERT, "vstr toolcmd_spawn\n" );
		}
		if(uis.sb_tab == 6){
		uis.spawnlist_folder = s_sandboxmain.classlist.curvalue;
		SandboxMain_SpawnListUpdate();
		}
		break;
		
	case ID_SAVEMAP:
		if(uis.sb_tab == 5){
		trap_Cmd_ExecuteText( EXEC_INSERT, "toggle bot_nochat\n" );
		} else if(uis.sb_tab == 3){
		trap_Cvar_Set("bot_pause", "1");
		} else {
		UI_saveMapEdMenu();
		}
		break;

	case ID_LOADMAP:
		if(uis.sb_tab == 5){
		trap_Cmd_ExecuteText( EXEC_INSERT, "kick allbots\n" );
		} else if(uis.sb_tab == 3){
		trap_Cvar_Set("bot_pause", "0");	
		} else {
		UI_loadMapEdMenu();
		}
		break;
		
	case ID_PRIV:

		break;
	}
}

vec4_t	s_sandboxmain_color1 = {1.00f, 1.00f, 1.00f, 1.00f};

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
    int name_length;
    const char *bot_name;

	memset( &s_sandboxmain, 0, sizeof(s_sandboxmain) );

	s_sandboxmain.menu.draw = SandboxMain_MenuDraw;
	s_sandboxmain.menu.wrapAround = qtrue;
	s_sandboxmain.menu.native = qfalse;
	s_sandboxmain.menu.fullscreen = qfalse;
	s_sandboxmain.menu.key        = SandboxMain_MenuKey;

	s_sandboxmain.close.string          = "Close";
	s_sandboxmain.switchtab.string      = "Switch";
	s_sandboxmain.tab1.string           = "Create";
	s_sandboxmain.tab2.string           = "Entities";
	s_sandboxmain.tab3.string           = "NPCs";
	s_sandboxmain.tab4.string           = "Items";
	s_sandboxmain.tab5.string           = "Admin";
	s_sandboxmain.tab6.string           = "Lists";
	s_sandboxmain.tab7.string           = "Scripts";
	s_sandboxmain.tab8.string           = "Tools";
	s_sandboxmain.tab9.string           = "Settings";
	s_sandboxmain.tab10.string          = "Addons";
	s_sandboxmain.savemap.string		= "Save map";
	s_sandboxmain.loadmap.string		= "Load map";
	s_sandboxmain.priv.generic.name		= "Private:";
	s_sandboxmain.grid.generic.name		= "Grid size:";
	
	s_sandboxmain.close.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.close.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.close.generic.id       	= ID_CLOSE;
	s_sandboxmain.close.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.close.generic.x        	= (640 - (110*0.25)) + uis.wideoffset;
	s_sandboxmain.close.generic.y        	= 15;
	s_sandboxmain.close.color			    = s_sandboxmain_color1;
	s_sandboxmain.close.style			    = UI_CENTER;
	s_sandboxmain.close.customsize			= 0.5;
	s_sandboxmain.close.generic.heightmod	= 1.5;
	
	s_sandboxmain.switchtab.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.switchtab.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.switchtab.generic.id       	= ID_SWITCHTAB;
	s_sandboxmain.switchtab.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.switchtab.generic.x        	= 566 + uis.wideoffset;
	s_sandboxmain.switchtab.generic.y        	= 60;
	s_sandboxmain.switchtab.color			    = s_sandboxmain_color1;
	s_sandboxmain.switchtab.style			    = UI_CENTER;
	s_sandboxmain.switchtab.customsize			= 0.5;
	s_sandboxmain.switchtab.generic.heightmod	= 1.5;
	
	s_sandboxmain.tab1.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab1.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.tab1.generic.id       	= ID_TAB1;
	s_sandboxmain.tab1.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab1.generic.x        	= (110*0.5)*1 - uis.wideoffset;
	s_sandboxmain.tab1.generic.y        	= 15;
	s_sandboxmain.tab1.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab1.style			    = UI_CENTER;
	s_sandboxmain.tab1.customsize			= 0.5;
	s_sandboxmain.tab1.generic.heightmod	= 1.5;
	
	s_sandboxmain.tab2.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab2.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.tab2.generic.id       	= ID_TAB2;
	s_sandboxmain.tab2.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab2.generic.x        	= (110*0.5)*2 - uis.wideoffset;
	s_sandboxmain.tab2.generic.y        	= 15;
	s_sandboxmain.tab2.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab2.style			    = UI_CENTER;
	s_sandboxmain.tab2.customsize			= 0.5;
	s_sandboxmain.tab2.generic.heightmod	= 1.5;
	
	s_sandboxmain.tab3.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab3.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.tab3.generic.id       	= ID_TAB3;
	s_sandboxmain.tab3.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab3.generic.x        	= (110*0.5)*3 - uis.wideoffset;
	s_sandboxmain.tab3.generic.y        	= 15;
	s_sandboxmain.tab3.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab3.style			    = UI_CENTER;
	s_sandboxmain.tab3.customsize			= 0.5;
	s_sandboxmain.tab3.generic.heightmod	= 1.5;
	
	s_sandboxmain.tab4.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab4.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.tab4.generic.id       	= ID_TAB4;
	s_sandboxmain.tab4.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab4.generic.x        	= (110*0.5)*4 - uis.wideoffset;
	s_sandboxmain.tab4.generic.y        	= 15;
	s_sandboxmain.tab4.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab4.style			    = UI_CENTER;
	s_sandboxmain.tab4.customsize			= 0.5;
	s_sandboxmain.tab4.generic.heightmod	= 1.5;
	
	s_sandboxmain.tab5.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab5.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.tab5.generic.id       	= ID_TAB5;
	s_sandboxmain.tab5.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab5.generic.x        	= (110*0.5)*5 - uis.wideoffset;
	s_sandboxmain.tab5.generic.y        	= 15;
	s_sandboxmain.tab5.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab5.style			    = UI_CENTER;
	s_sandboxmain.tab5.customsize			= 0.5;
	s_sandboxmain.tab5.generic.heightmod	= 1.5;
	
	s_sandboxmain.tab6.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab6.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.tab6.generic.id       	= ID_TAB6;
	s_sandboxmain.tab6.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab6.generic.x        	= (110*0.5)*6 - uis.wideoffset;
	s_sandboxmain.tab6.generic.y        	= 15;
	s_sandboxmain.tab6.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab6.style			    = UI_CENTER;
	s_sandboxmain.tab6.customsize			= 0.5;
	s_sandboxmain.tab6.generic.heightmod	= 1.5;
	
	s_sandboxmain.tab7.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab7.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.tab7.generic.id       	= ID_TAB7;
	s_sandboxmain.tab7.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab7.generic.x        	= (110*0.5)*7 - uis.wideoffset;
	s_sandboxmain.tab7.generic.y        	= 15;
	s_sandboxmain.tab7.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab7.style			    = UI_CENTER;
	s_sandboxmain.tab7.customsize			= 0.5;
	s_sandboxmain.tab7.generic.heightmod	= 1.5;

	s_sandboxmain.tab8.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab8.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.tab8.generic.id       	= ID_TAB8;
	s_sandboxmain.tab8.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab8.generic.x        	= (110*0.5)*8 - uis.wideoffset;
	s_sandboxmain.tab8.generic.y        	= 15;
	s_sandboxmain.tab8.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab8.style			    = UI_CENTER;
	s_sandboxmain.tab8.customsize			= 0.5;
	s_sandboxmain.tab8.generic.heightmod	= 1.5;
	
	s_sandboxmain.tab9.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab9.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.tab9.generic.id       	= ID_TAB9;
	s_sandboxmain.tab9.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab9.generic.x        	= (110*0.5)*9 - uis.wideoffset;
	s_sandboxmain.tab9.generic.y        	= 15;
	s_sandboxmain.tab9.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab9.style			    = UI_CENTER;
	s_sandboxmain.tab9.customsize			= 0.5;
	s_sandboxmain.tab9.generic.heightmod	= 1.5;
	
	s_sandboxmain.tab10.generic.type     	= MTYPE_PTEXT;
	s_sandboxmain.tab10.generic.flags    	= QMF_CENTER_JUSTIFY;
	s_sandboxmain.tab10.generic.id       	= ID_TAB10;
	s_sandboxmain.tab10.generic.callback 	= SandboxMain_MenuEvent;
	s_sandboxmain.tab10.generic.x        	= (110*0.5)*10 - uis.wideoffset;
	s_sandboxmain.tab10.generic.y        	= 15;
	s_sandboxmain.tab10.color			    = s_sandboxmain_color1;
	s_sandboxmain.tab10.style			    = UI_CENTER;
	s_sandboxmain.tab10.customsize			= 0.5;
	s_sandboxmain.tab10.generic.heightmod	= 1.5;
	
	s_sandboxmain.savemap.generic.type     = MTYPE_PTEXT;
	s_sandboxmain.savemap.generic.flags    = QMF_CENTER_JUSTIFY;
	s_sandboxmain.savemap.generic.id       = ID_SAVEMAP;
	s_sandboxmain.savemap.generic.callback = SandboxMain_MenuEvent;
	s_sandboxmain.savemap.generic.x        = 440 + uis.wideoffset;
	s_sandboxmain.savemap.generic.y        = 420 + 5;
	s_sandboxmain.savemap.style            = UI_CENTER;
	s_sandboxmain.savemap.color            = s_sandboxmain_color1;

	s_sandboxmain.loadmap.generic.type     = MTYPE_PTEXT;
	s_sandboxmain.loadmap.generic.flags    = QMF_CENTER_JUSTIFY;
	s_sandboxmain.loadmap.generic.id       = ID_LOADMAP;
	s_sandboxmain.loadmap.generic.callback = SandboxMain_MenuEvent;
	s_sandboxmain.loadmap.generic.x        = 440 + uis.wideoffset;
	s_sandboxmain.loadmap.generic.y        = 420 + 25;
	s_sandboxmain.loadmap.style            = UI_CENTER;
	s_sandboxmain.loadmap.color            = s_sandboxmain_color1;
	
	y = 50;	
	s_sandboxmain.priv.generic.type			= MTYPE_RADIOBUTTON;
	s_sandboxmain.priv.generic.flags		= QMF_SMALLFONT;
	s_sandboxmain.priv.generic.callback		= SandboxMain_MenuEvent;
	s_sandboxmain.priv.generic.id			= ID_PRIV;
	s_sandboxmain.priv.generic.x			= 480 + uis.wideoffset;
	s_sandboxmain.priv.generic.y			= y;
	s_sandboxmain.priv.color				= s_sandboxmain_color1;
	y += 18;

	s_sandboxmain.grid.generic.type			= MTYPE_FIELD;
	s_sandboxmain.grid.generic.flags		= QMF_SMALLFONT|QMF_NUMBERSONLY;
	s_sandboxmain.grid.field.widthInChars	= 4;
	s_sandboxmain.grid.field.maxchars		= 4;
	s_sandboxmain.grid.generic.x			= 480 + uis.wideoffset;
	s_sandboxmain.grid.generic.y			= y;
	s_sandboxmain.grid.color				= s_sandboxmain_color1;
	y += 18;
	
	for(i = 0; i < PROPERTIES_NUM; i++){
	s_sandboxmain.modif[i].generic.type			= MTYPE_FIELD;
	s_sandboxmain.modif[i].generic.flags		= QMF_SMALLFONT;
	s_sandboxmain.modif[i].field.widthInChars	= 14;
	s_sandboxmain.modif[i].field.maxchars		= 64;
	s_sandboxmain.modif[i].generic.x			= 480 + uis.wideoffset;
	s_sandboxmain.modif[i].generic.y			= y;
	s_sandboxmain.modif[i].color				= s_sandboxmain_color1;
	y += 18;
	}
	
	s_sandboxmain.spawnobject.generic.type     = MTYPE_PTEXT;
	s_sandboxmain.spawnobject.generic.flags    = QMF_CENTER_JUSTIFY;
	s_sandboxmain.spawnobject.generic.id       = ID_SPAWNOBJECT;
	s_sandboxmain.spawnobject.generic.callback = SandboxMain_MenuEvent;
	s_sandboxmain.spawnobject.generic.x        = 560 + uis.wideoffset;
	s_sandboxmain.spawnobject.generic.y        = 448;
	s_sandboxmain.spawnobject.color					= s_sandboxmain_color1;
	s_sandboxmain.spawnobject.style					= UI_CENTER;

	if(uis.sb_tab == 1){
	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.list.type				= 5;
	s_sandboxmain.list.styles			= 2;
	s_sandboxmain.list.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
	s_sandboxmain.list.string			= "props";
	s_sandboxmain.list.fontsize			= 0.4;
	s_sandboxmain.list.corner			= 65;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.list.generic.y		= 62;
	s_sandboxmain.list.width			= 39/6;
	s_sandboxmain.list.height			= 4;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "props", "md3", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.texturelist.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.texturelist.type				= 5;
	s_sandboxmain.texturelist.styles			= 2;
	s_sandboxmain.texturelist.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
	s_sandboxmain.texturelist.fontsize			= 0.4;
	s_sandboxmain.texturelist.corner			= 65;
	s_sandboxmain.texturelist.generic.flags		= QMF_PULSEIFFOCUS;
	s_sandboxmain.texturelist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.texturelist.generic.id		= ID_TEXTURESLIST;
	s_sandboxmain.texturelist.generic.x			= 40 - uis.wideoffset;
	s_sandboxmain.texturelist.generic.y			= 215 + 62;
	s_sandboxmain.texturelist.width				= 39/6;
	s_sandboxmain.texturelist.height			= 4;
	s_sandboxmain.texturelist.itemnames			= (const char **)s_sandboxmain.textureslist;
	s_sandboxmain.texturelist.color				= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.propstext.generic.y				= 48;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.classtext.generic.y				= 215 + 48;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Props:";
	s_sandboxmain.classtext.string  				= "Textures:";
	s_sandboxmain.spawnobject.string           		= "Create";
	}
	if(uis.sb_tab == 2){
	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.list.type				= 5;
	s_sandboxmain.list.styles			= 1;
	s_sandboxmain.list.fontsize			= 1;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 28;
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "props", "md3", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.classlist.type				= 5;
	s_sandboxmain.classlist.styles			= 2;
	s_sandboxmain.classlist.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
	s_sandboxmain.classlist.string			= "";
	s_sandboxmain.classlist.fontsize		= 0.4;
	s_sandboxmain.classlist.corner			= 40;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.classlist.generic.y		= 70;
	s_sandboxmain.classlist.width			= 39/6;
	s_sandboxmain.classlist.height			= 8;
	s_sandboxmain.classlist.numitems		= 119;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.propstext.generic.y				= 48;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.classtext.generic.y				= 48;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Props:";
	s_sandboxmain.classtext.string  				= "Entities:";
	s_sandboxmain.spawnobject.string           		= "Create";
	}
	if(uis.sb_tab == 3){
	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.list.type				= 5;
	s_sandboxmain.list.styles			= 2;
	s_sandboxmain.list.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
	s_sandboxmain.list.string			= "bots";
	s_sandboxmain.list.fontsize			= 0.4;
	s_sandboxmain.list.corner			= 65;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.list.generic.y		= 62;
	s_sandboxmain.list.width			= 39/6;
	s_sandboxmain.list.height			= 4;
	s_sandboxmain.list.numitems			= UI_GetNumBots();
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.classlist.type				= 5;
	s_sandboxmain.classlist.styles				= 1;
	s_sandboxmain.classlist.fontsize			= 1;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 5;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.propstext.generic.y				= 48;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.classtext.generic.y				= 215 + 48;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "List:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.savemap.string					= "Disable AI";
	s_sandboxmain.loadmap.string					= "Enable AI";
	s_sandboxmain.spawnobject.string           		= "Create";
	}
	if(uis.sb_tab == 4){
	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.list.type				= 5;
	s_sandboxmain.list.styles			= 2;
	s_sandboxmain.list.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
	s_sandboxmain.list.string			= "";
	s_sandboxmain.list.fontsize			= 0.4;
	s_sandboxmain.list.corner			= 65;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 39/6;
	s_sandboxmain.list.height			= 8;
	s_sandboxmain.list.numitems			= 54;
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.item_itemslist;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.classlist.type				= 5;
	s_sandboxmain.classlist.styles				= 1;
	s_sandboxmain.classlist.fontsize			= 1;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.propstext.generic.y				= 48;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.classtext.generic.y				= 215 + 48;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Items:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.spawnobject.string          		= "Give";
	}
	if(uis.sb_tab == 5){
	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.list.type				= 5;
	s_sandboxmain.list.styles			= 0;
	s_sandboxmain.list.fontsize			= 1;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= 8;
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.cvar_itemslist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.classlist.type				= 5;
	s_sandboxmain.classlist.styles				= 1;
	s_sandboxmain.classlist.fontsize			= 1;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.propstext.generic.y				= 48;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.classtext.generic.y				= 215 + 48;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Settings:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.spawnobject.string           		= "Apply";
	s_sandboxmain.savemap.string					= "Bot chat";
	s_sandboxmain.loadmap.string					= "Kick bots";
	}
	if(uis.sb_tab == 6){
	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.classlist.type				= 5;
	s_sandboxmain.classlist.styles				= 0;
	s_sandboxmain.classlist.fontsize			= 1;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= trap_FS_GetFileList( va("spawnlists", s_sandboxmain.classlist.itemnames[s_sandboxmain.classlist.curvalue]), "cfg", s_sandboxmain.names2, 524288 );
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
		
	UI_Free(s_sandboxmain.list.string);
		
	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.list.type				= 5;
	s_sandboxmain.list.styles			= 2;
	s_sandboxmain.list.columns			= 6+((1.75*uis.wideoffset)/((39/6)*SMALLCHAR_WIDTH-7));
	s_sandboxmain.list.string 			= (char *)UI_Alloc(256);
	s_sandboxmain.list.fontsize			= 0.4;
	s_sandboxmain.list.corner			= 65;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.list.generic.y		= 62;
	s_sandboxmain.list.width			= 39/6;
	s_sandboxmain.list.height			= 4;
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.propstext.generic.y				= 48;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.classtext.generic.y				= 215 + 48;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Items:";
	s_sandboxmain.classtext.string  				= "Lists:";
	s_sandboxmain.spawnobject.string           		= "Create";
	}
	if(uis.sb_tab == 7){
	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.list.type				= 5;
	s_sandboxmain.list.styles			= 0;
	s_sandboxmain.list.fontsize			= 1;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "dscripts", "ns", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.classlist.type				= 5;
	s_sandboxmain.classlist.styles				= 1;
	s_sandboxmain.classlist.fontsize			= 1;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.propstext.generic.y				= 48;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.classtext.generic.y				= 215 + 48;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Scripts:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.spawnobject.string          		= "Execute";
	}
	if(uis.sb_tab == 8){
	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.list.type				= 5;
	s_sandboxmain.list.styles			= 0;
	s_sandboxmain.list.fontsize			= 1;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "tools", "ns", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.classlist.type				= 5;
	s_sandboxmain.classlist.styles				= 1;
	s_sandboxmain.classlist.fontsize			= 1;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.propstext.generic.y				= 48;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.classtext.generic.y				= 215 + 48;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Tools:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.spawnobject.string          		= "Select";
	}
	if(uis.sb_tab == 9){
	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.list.type				= 5;
	s_sandboxmain.list.styles			= 0;
	s_sandboxmain.list.fontsize			= 1;
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= 338;
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.cvar_itemslist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.classlist.type				= 5;
	s_sandboxmain.classlist.styles				= 1;
	s_sandboxmain.classlist.fontsize			= 1;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.classeslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.propstext.generic.y				= 48;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.classtext.generic.y				= 215 + 48;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Settings:";
	s_sandboxmain.classtext.string  				= "Class:";
	s_sandboxmain.spawnobject.string           		= "Apply";
	}
	if(uis.sb_tab == 10){
	s_sandboxmain.list.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.list.type				= 5;
	s_sandboxmain.list.styles			= 1;
	s_sandboxmain.list.fontsize			= 1;
	s_sandboxmain.list.string			= "nsgui/icons";
	s_sandboxmain.list.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.list.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.list.generic.id		= ID_LIST;
	s_sandboxmain.list.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.list.generic.y		= 70;
	s_sandboxmain.list.width			= 39+(2*uis.wideoffset/SMALLCHAR_WIDTH);
	s_sandboxmain.list.height			= 15+18;
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( "nsgui", "ns", s_sandboxmain.names, 524288 );
	s_sandboxmain.list.itemnames		= (const char **)s_sandboxmain.configlist;
	s_sandboxmain.list.columns			= 1;
	s_sandboxmain.list.color			= s_sandboxmain_color1;
	
	s_sandboxmain.classlist.generic.type		= MTYPE_UIOBJECT;
	s_sandboxmain.classlist.type				= 5;
	s_sandboxmain.classlist.styles				= 1;
	s_sandboxmain.classlist.fontsize			= 1;
	s_sandboxmain.classlist.generic.flags	= QMF_PULSEIFFOCUS;
	s_sandboxmain.classlist.generic.callback	= SandboxMain_MenuEvent;
	s_sandboxmain.classlist.generic.id		= ID_CLASSLIST;
	s_sandboxmain.classlist.generic.x		= 40 - uis.wideoffset;
	s_sandboxmain.classlist.generic.y		= 215 + 70;
	s_sandboxmain.classlist.width			= 28;
	s_sandboxmain.classlist.height			= 15;
	s_sandboxmain.classlist.numitems		= 118;
	s_sandboxmain.classlist.itemnames		= (const char **)s_sandboxmain.botclasslist;
	s_sandboxmain.classlist.columns			= 1;
	s_sandboxmain.classlist.color			= s_sandboxmain_color1;
	//y += 20;
	
	s_sandboxmain.propstext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.propstext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.propstext.generic.y				= 48;
	s_sandboxmain.propstext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.propstext.color  					= s_sandboxmain_color1;
	s_sandboxmain.propstext.style  					= UI_BIGFONT;
	
	s_sandboxmain.classtext.generic.type			= MTYPE_PTEXT;
	s_sandboxmain.classtext.generic.x				= 40 - uis.wideoffset;
	s_sandboxmain.classtext.generic.y				= 215 + 48;
	s_sandboxmain.classtext.generic.flags			= QMF_INACTIVE;
	s_sandboxmain.classtext.color  					= s_sandboxmain_color1;
	s_sandboxmain.classtext.style  					= UI_BIGFONT;
	
	s_sandboxmain.propstext.string  				= "Addons:";
	s_sandboxmain.classtext.string  				= "";
	s_sandboxmain.spawnobject.string           		= "Open";
	}

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

		configname += len + 1;
	}
	
	s_sandboxmain.texturelist.string			= sb_texture.string;
	s_sandboxmain.texturelist.numitems			= trap_FS_GetFileList( va("ptex/%s", s_sandboxmain.list.itemnames[uis.texturelist_folder]), "png", s_sandboxmain.names2, 524288 );
	
	if (!s_sandboxmain.texturelist.numitems) {
		strcpy(s_sandboxmain.names2,"0");
		s_sandboxmain.texturelist.numitems = 1;
	}
	else if (s_sandboxmain.texturelist.numitems > 65536)
		s_sandboxmain.texturelist.numitems = 65536;

	configname = s_sandboxmain.names2;
	for ( i = 0; i < s_sandboxmain.texturelist.numitems; i++ ) {
		s_sandboxmain.texturelist.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 4,".png"))
			configname[len-4] = '\0';

		configname += len + 1;
	}
}
if (uis.sb_tab == 3) {
    if (!s_sandboxmain.list.numitems) {
        strcpy(s_sandboxmain.names, "No NPC");
        s_sandboxmain.list.numitems = 1;
    } else if (s_sandboxmain.list.numitems > 65536) {
        s_sandboxmain.list.numitems = 65536;
    }

    configname = s_sandboxmain.names;
    
    for (i = 0; i < s_sandboxmain.list.numitems; i++) {
        // Получение имени из информации о боте
        bot_name = Info_ValueForKey(UI_GetBotInfoByNumber(i), "name");

        // Проверка длины строки, чтобы избежать переполнения буфера
        name_length = strlen(bot_name);

        // Копирование имени в массив имен
        strcpy(configname, bot_name);

        // Установка имени в массив itemnames
        s_sandboxmain.list.itemnames[i] = configname;

        // Переход к следующему элементу
        configname += name_length + 1;
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

		configname += len + 1;
	}
	
	s_sandboxmain.list.numitems			= trap_FS_GetFileList( va("spawnlists/%s", s_sandboxmain.classlist.itemnames[uis.spawnlist_folder]), "ns", s_sandboxmain.names, 524288 );
	
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
		if (!Q_stricmp(configname +  len - 3,".ns"))
			configname[len-3] = '\0';

		configname += len + 1;
	}
	
	strcpy(s_sandboxmain.list.string, va("spawnlists/%s/icons", s_sandboxmain.classlist.itemnames[uis.spawnlist_folder]));
}
if(uis.sb_tab == 7){
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
		if (!Q_stricmp(configname +  len - 3,".ns"))
			configname[len-3] = '\0';

		configname += len + 1;
	}
}
if(uis.sb_tab == 8){
	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,"No tools");
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 3,".ns"))
			configname[len-3] = '\0';

		configname += len + 1;
	}
}
if(uis.sb_tab == 10){	
	if (!s_sandboxmain.list.numitems) {
		strcpy(s_sandboxmain.names,"No addons");
		s_sandboxmain.list.numitems = 1;
	}
	else if (s_sandboxmain.list.numitems > 65536)
		s_sandboxmain.list.numitems = 65536;

	configname = s_sandboxmain.names;
	for ( i = 0; i < s_sandboxmain.list.numitems; i++ ) {
		s_sandboxmain.list.itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - 3,".ns"))
			configname[len-3] = '\0';


		configname += len + 1;
	}
}

	if(uis.sb_tab == 4){
	for (i = 0; i < 54; i++) {
	s_sandboxmain.list.itemnames[i] = item_items[i];
	}
	}
	if(uis.sb_tab == 5){
	for (i = 0; i < 8; i++) {
	s_sandboxmain.list.itemnames[i] = admcvar_items[i];
	}
	}
	if(uis.sb_tab == 9){
	for (i = 0; i < 338; i++) {
	s_sandboxmain.list.itemnames[i] = cvar_items[i];
	}
	}
	if(uis.sb_tab == 2){
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
	s_sandboxmain.classlist.itemnames[116] = "weapon_toolgun";
	s_sandboxmain.classlist.itemnames[117] = "weapon_physgun";
	s_sandboxmain.classlist.itemnames[118] = "weapon_gravitygun";
	}
	if(uis.sb_tab == 3){
	s_sandboxmain.classlist.itemnames[0] = "NPC_Citizen";
	s_sandboxmain.classlist.itemnames[1] = "NPC_Enemy";
	s_sandboxmain.classlist.itemnames[2] = "NPC_Guard";
	s_sandboxmain.classlist.itemnames[3] = "NPC_Partner";
	s_sandboxmain.classlist.itemnames[4] = "NPC_PartnerEnemy";
	}
	
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.close );
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
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.grid );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.savemap );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.loadmap );
	if(uis.sb_tab == 1){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.texturelist );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.switchtab );
	}
	if(uis.sb_tab == 2){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 3){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 4){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	}
	if(uis.sb_tab == 5){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	}
	if(uis.sb_tab == 6){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classtext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.classlist );
	}
	if(uis.sb_tab == 7){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	}
	if(uis.sb_tab == 8){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.switchtab );
	}
	if(uis.sb_tab == 9){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	}
	if(uis.sb_tab == 10){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.propstext );
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.list );
	}
	
	for(i = 0; i < PROPERTIES_NUM; i++){
	Menu_AddItem( &s_sandboxmain.menu, (void*) &s_sandboxmain.modif[i] );
	}
	
	s_sandboxmain.priv.curvalue = trap_Cvar_VariableValue("sb_private");
	Q_strncpyz( s_sandboxmain.grid.field.buffer, UI_Cvar_VariableString("sb_grid"), sizeof(s_sandboxmain.grid.field.buffer) );
	s_sandboxmain.list.curvalue = trap_Cvar_VariableValue("sb_modelnum");
	s_sandboxmain.classlist.curvalue = trap_Cvar_VariableValue("sb_classnum");
	s_sandboxmain.texturelist.curvalue = trap_Cvar_VariableValue("sb_texturenum");
	Q_strncpyz( s_sandboxmain.modif[0].field.buffer, UI_Cvar_VariableString("toolgun_mod1"), sizeof(s_sandboxmain.modif[0].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[1].field.buffer, UI_Cvar_VariableString("toolgun_mod2"), sizeof(s_sandboxmain.modif[1].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[2].field.buffer, UI_Cvar_VariableString("toolgun_mod3"), sizeof(s_sandboxmain.modif[2].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[3].field.buffer, UI_Cvar_VariableString("toolgun_mod4"), sizeof(s_sandboxmain.modif[3].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[4].field.buffer, UI_Cvar_VariableString("toolgun_mod5"), sizeof(s_sandboxmain.modif[4].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[5].field.buffer, UI_Cvar_VariableString("toolgun_mod6"), sizeof(s_sandboxmain.modif[5].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[6].field.buffer, UI_Cvar_VariableString("toolgun_mod7"), sizeof(s_sandboxmain.modif[6].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[7].field.buffer, UI_Cvar_VariableString("toolgun_mod8"), sizeof(s_sandboxmain.modif[7].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[8].field.buffer, UI_Cvar_VariableString("toolgun_mod9"), sizeof(s_sandboxmain.modif[8].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[9].field.buffer, UI_Cvar_VariableString("toolgun_mod10"), sizeof(s_sandboxmain.modif[9].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[10].field.buffer, UI_Cvar_VariableString("toolgun_mod11"), sizeof(s_sandboxmain.modif[10].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[11].field.buffer, UI_Cvar_VariableString("toolgun_mod12"), sizeof(s_sandboxmain.modif[11].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[12].field.buffer, UI_Cvar_VariableString("toolgun_mod13"), sizeof(s_sandboxmain.modif[12].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[13].field.buffer, UI_Cvar_VariableString("toolgun_mod14"), sizeof(s_sandboxmain.modif[13].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[14].field.buffer, UI_Cvar_VariableString("toolgun_mod15"), sizeof(s_sandboxmain.modif[14].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[15].field.buffer, UI_Cvar_VariableString("toolgun_mod16"), sizeof(s_sandboxmain.modif[15].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[16].field.buffer, UI_Cvar_VariableString("toolgun_mod17"), sizeof(s_sandboxmain.modif[16].field.buffer) );
	Q_strncpyz( s_sandboxmain.modif[17].field.buffer, UI_Cvar_VariableString("toolgun_mod18"), sizeof(s_sandboxmain.modif[17].field.buffer) );
	trap_Cvar_Set( "sb_texture", va("ptex/%s", s_sandboxmain.list.itemnames[uis.texturelist_folder]) );
	trap_Cvar_Set( "sb_texture_view", va("ptex/props/%s", s_sandboxmain.list.itemnames[uis.texturelist_folder]) );
	
	if(uis.sb_tab == 6){
	SandboxMain_SpawnListUpdate();
	}
	
	if(uis.sb_tab == 1){
	s_sandboxmain.classlist.curvalue = 0;
	} else {
	s_sandboxmain.texturelist.curvalue = 0;
	}
}

/*
===============
UI_SandboxMainMenu
===============
*/
void UI_SandboxMainMenu( void ) {
	if(DynamicMenu_ServerGametype() == GT_SANDBOX){
	if(!uis.sb_tab){ uis.sb_tab = 1;}
	SandboxMain_MenuInit();
	UI_PushMenu ( &s_sandboxmain.menu );
	}
}
