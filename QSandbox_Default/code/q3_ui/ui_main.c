// Copyright (C) 1999-2000 Id Software, Inc.
//
/*
=======================================================================

USER INTERFACE MAIN

=======================================================================
*/




#include "ui_local.h"


/*
================
vmMain

This is the only way control passes into the module.
This must be the very first function compiled into the .qvm file
================
*/
int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
	switch ( command ) {
	case UI_GETAPIVERSION:
		return UI_API_VERSION;

	case UI_INIT:
		UI_Init();
		return 0;

	case UI_SHUTDOWN:
		UI_Shutdown();
		return 0;

	case UI_KEY_EVENT:
		UI_KeyEvent( arg0, arg1 );
		return 0;

	case UI_MOUSE_EVENT:
		UI_MouseEvent( arg0, arg1 );
		return 0;

	case UI_REFRESH:
		UI_Refresh( arg0 );
		return 0;

	case UI_IS_FULLSCREEN:
		return UI_IsFullscreen();

	case UI_SET_ACTIVE_MENU:
		UI_SetActiveMenu( arg0 );
		return 0;

	case UI_CONSOLE_COMMAND:
		return UI_ConsoleCommand(arg0);

	case UI_DRAW_CONNECT_SCREEN:
		UI_DrawConnectScreen( arg0 );
		return 0;
	case UI_HASUNIQUECDKEY:				// mod authors need to observe this
		return qfalse;  // bk010117 - change this to qfalse for mods!
	}

	return -1;
}


/*
================
cvars
================
*/

typedef struct {
	vmCvar_t	*vmCvar;
	char		*cvarName;
	char		*defaultString;
	int			cvarFlags;
} cvarTable_t;

vmCvar_t	cl_propsmallsizescale;
vmCvar_t 	cl_propheight;
vmCvar_t 	cl_propspacewidth;
vmCvar_t 	cl_propgapwidth;
vmCvar_t 	cl_smallcharwidth;
vmCvar_t 	cl_smallcharheight;
vmCvar_t 	cl_bigcharwidth;
vmCvar_t 	cl_bigcharheight;
vmCvar_t 	cl_giantcharwidth;
vmCvar_t 	cl_giantcharheight;

//QSandbox Sandbox
vmCvar_t	sb_private;
vmCvar_t	sb_minmax;
vmCvar_t	sb_grid;
vmCvar_t	sb_modelnum;
vmCvar_t	sb_classnum;
vmCvar_t	sb_toolnum;
vmCvar_t	sb_tab;
vmCvar_t	spawn_preset;

vmCvar_t	mgui_api_active;
vmCvar_t	mgui_none;

vmCvar_t	sbt_color0_0;
vmCvar_t	sbt_color0_1;
vmCvar_t	sbt_color0_2;
vmCvar_t	sbt_color0_3;
vmCvar_t	sbt_color1_0;
vmCvar_t	sbt_color1_1;
vmCvar_t	sbt_color1_2;
vmCvar_t	sbt_color1_3;
vmCvar_t	sbt_color2_0;
vmCvar_t	sbt_color2_1;
vmCvar_t	sbt_color2_2;
vmCvar_t	sbt_color2_3;
vmCvar_t	sbt_color3_0;
vmCvar_t	sbt_color3_1;
vmCvar_t	sbt_color3_2;
vmCvar_t	sbt_color3_3;
vmCvar_t	sbt_wallpaper;

vmCvar_t	ui_scrollbtnsize;

vmCvar_t	ui_singlemode;
vmCvar_t	legsskin;
vmCvar_t	team_legsskin;
vmCvar_t	cl_blackloadscreen;
vmCvar_t	cl_selectedmod;
vmCvar_t	cl_gmodelock;
vmCvar_t	cl_language;
vmCvar_t	cl_gamestyle;
vmCvar_t	cl_screenoffset;
vmCvar_t	cl_screencustomoffset;
vmCvar_t	ui_loaded;
vmCvar_t	ui_backcolors;
vmCvar_t	sensitivitymenu;

/*vmCvar_t	ui_ffa_fraglimit;
vmCvar_t	ui_ffa_timelimit;

vmCvar_t	ui_tourney_fraglimit;
vmCvar_t	ui_tourney_timelimit;

vmCvar_t	ui_team_fraglimit;
vmCvar_t	ui_team_timelimit;
vmCvar_t	ui_team_friendly;

vmCvar_t	ui_ctf_capturelimit;
vmCvar_t	ui_ctf_timelimit;
vmCvar_t	ui_ctf_friendly;*/

vmCvar_t test1;
vmCvar_t test2;
vmCvar_t test3;
vmCvar_t test4;
vmCvar_t test5;
vmCvar_t test6;
vmCvar_t test7;
vmCvar_t test8;
vmCvar_t test9;

vmCvar_t	ui_arenasFile;
vmCvar_t	ui_botsFile;
vmCvar_t	ui_spScores1;
vmCvar_t	ui_spScores2;
vmCvar_t	ui_spScores3;
vmCvar_t	ui_spScores4;
vmCvar_t	ui_spScores5;
vmCvar_t	ui_spAwards;
vmCvar_t	ui_spVideos;
vmCvar_t	ui_spSkill;

vmCvar_t	ui_spSelection;

vmCvar_t	ui_browserMaster;
vmCvar_t	ui_browserGameType;
vmCvar_t	ui_browserSortKey;
vmCvar_t	ui_browserShowFull;
vmCvar_t	ui_browserShowEmpty;

vmCvar_t	ui_brassTime;
vmCvar_t	ui_drawCrosshair;
vmCvar_t	ui_drawCrosshairNames;
vmCvar_t	ui_marks;

vmCvar_t	ui_server1;
vmCvar_t	ui_server2;
vmCvar_t	ui_server3;
vmCvar_t	ui_server4;
vmCvar_t	ui_server5;
vmCvar_t	ui_server6;
vmCvar_t	ui_server7;
vmCvar_t	ui_server8;
vmCvar_t	ui_server9;
vmCvar_t	ui_server10;
vmCvar_t	ui_server11;
vmCvar_t	ui_server12;
vmCvar_t	ui_server13;
vmCvar_t	ui_server14;
vmCvar_t	ui_server15;
vmCvar_t	ui_server16;
vmCvar_t	ui_server17;
vmCvar_t	ui_server18;
vmCvar_t	ui_server19;
vmCvar_t	ui_server20;
vmCvar_t	ui_server21;
vmCvar_t	ui_server22;
vmCvar_t	ui_server23;
vmCvar_t	ui_server24;
vmCvar_t	ui_server25;
vmCvar_t	ui_server26;
vmCvar_t	ui_server27;
vmCvar_t	ui_server28;
vmCvar_t	ui_server29;
vmCvar_t	ui_server30;
vmCvar_t	ui_server31;
vmCvar_t	ui_server32;

vmCvar_t	ui_cdkeychecked;

// UIE conventional cvars
vmCvar_t	uie_animsfx;
vmCvar_t	uie_mapicons;
vmCvar_t	uie_autoclosebotmenu;
vmCvar_t	uie_ingame_dynamicmenu;
vmCvar_t	uie_map_multisel;
vmCvar_t	uie_map_list;
vmCvar_t	uie_bot_multisel;
vmCvar_t	uie_bot_list;
vmCvar_t	uie_olditemmenu;


static cvarTable_t		cvarTable[] = {

	{ &cl_propsmallsizescale, "cl_propsmallsizescale", "0.60", CVAR_ARCHIVE },
	{ &cl_propheight, "cl_propheight", "21", CVAR_ARCHIVE  },
	{ &cl_propspacewidth, "cl_propspacewidth", "8", CVAR_ARCHIVE  },
	{ &cl_propgapwidth, "cl_propgapwidth", "3", CVAR_ARCHIVE  },
	{ &cl_smallcharwidth, "cl_smallcharwidth", "8", CVAR_ARCHIVE  },
	{ &cl_smallcharheight, "cl_smallcharheight", "12", CVAR_ARCHIVE  },
	{ &cl_bigcharwidth, "cl_bigcharwidth", "12", CVAR_ARCHIVE  },
	{ &cl_bigcharheight, "cl_bigcharheight", "12", CVAR_ARCHIVE  },
	{ &cl_giantcharwidth, "cl_giantcharwidth", "20", CVAR_ARCHIVE  },
	{ &cl_giantcharheight, "cl_giantcharheight", "32", CVAR_ARCHIVE  },

//QSandbox Sandbox
	{ &sb_private, "sb_private", "0", 0 },
	{ &sb_grid, "sb_grid", "25", 0 },
	{ &sb_minmax, "sb_minmax", "25", 0 },
	{ &sb_modelnum, "sb_modelnum", "0", CVAR_ARCHIVE },
	{ &sb_classnum, "sb_classnum", "0", CVAR_ARCHIVE },
	{ &sb_toolnum, "sb_toolnum", "0", CVAR_ARCHIVE },
	{ &sb_tab, "sb_tab", "1", 0 },
	{ &spawn_preset, "spawn_preset", "set uibuildprop sl prop %s %s %i %s %s 0 0 0 0 \"none\" 1000 0 0 0 0 1 1 1 0 0 1 10000 0 1 100 100 120 1 0 1000 0", 0 },
	
	{ &mgui_api_active, "mgui_api_active", "0", 0 },
	{ &mgui_none, "mgui_none", "0", 0 },
	
	{ &sbt_color0_0,  "sbt_color0_0", "1", 	 CVAR_ARCHIVE },
	{ &sbt_color0_1,  "sbt_color0_1", "1", 	 CVAR_ARCHIVE },
	{ &sbt_color0_2,  "sbt_color0_2", "1", 	 CVAR_ARCHIVE },
	{ &sbt_color0_3,  "sbt_color0_3", "0.60", CVAR_ARCHIVE },
	{ &sbt_color1_0,  "sbt_color1_0", "0.30", CVAR_ARCHIVE },
	{ &sbt_color1_1,  "sbt_color1_1", "0.30", CVAR_ARCHIVE },
	{ &sbt_color1_2,  "sbt_color1_2", "0.30", CVAR_ARCHIVE },
	{ &sbt_color1_3,  "sbt_color1_3", "0.90", CVAR_ARCHIVE },
	{ &sbt_color2_0,  "sbt_color2_0", "0.50", CVAR_ARCHIVE },
	{ &sbt_color2_1,  "sbt_color2_1", "0.50", CVAR_ARCHIVE },
	{ &sbt_color2_2,  "sbt_color2_2", "0.30", CVAR_ARCHIVE },
	{ &sbt_color2_3,  "sbt_color2_3", "0.90", CVAR_ARCHIVE },
	{ &sbt_color3_0,  "sbt_color3_0", "1", 	 CVAR_ARCHIVE },
	{ &sbt_color3_1,  "sbt_color3_1", "1", 	 CVAR_ARCHIVE },
	{ &sbt_color3_2,  "sbt_color3_2", "1", 	 CVAR_ARCHIVE },
	{ &sbt_color3_3,  "sbt_color3_3", "1", 	 CVAR_ARCHIVE },
	{ &sbt_wallpaper, "sbt_wallpaper", "trans", 	 CVAR_ARCHIVE },

	{ &ui_scrollbtnsize, "ui_scrollbtnsize", "1", 	 CVAR_ARCHIVE },

	{ &ui_singlemode, "ui_singlemode", "0", CVAR_ARCHIVE },
	{ &ui_loaded, "ui_loaded", "0", 0 },
	{ &legsskin, "legsskin", "sarge/default", CVAR_ARCHIVE },
	{ &team_legsskin, "team_legsskin", "sarge/default", CVAR_ARCHIVE },
	{ &cl_selectedmod, "cl_selectedmod", "default", CVAR_ARCHIVE },
	{ &cl_blackloadscreen, "cl_blackloadscreen", "0", 0 },
	{ &cl_gmodelock, "cl_gmodelock", "0", CVAR_ARCHIVE },
	{ &cl_language, "cl_language", "0", CVAR_ARCHIVE },
	{ &cl_gamestyle, "cl_gamestyle", "0", CVAR_ARCHIVE },
	{ &cl_screenoffset, "cl_screenoffset", "107", CVAR_ARCHIVE },
	{ &cl_screencustomoffset, "cl_screencustomoffset", "-1", CVAR_ARCHIVE },
	{ &ui_backcolors, "ui_backcolors", "1", CVAR_ARCHIVE },
	{ &sensitivitymenu, "sensitivitymenu", "1", CVAR_ARCHIVE },

/*	{ &ui_ffa_fraglimit, "ui_ffa_fraglimit", "20", CVAR_ARCHIVE },
	{ &ui_ffa_timelimit, "ui_ffa_timelimit", "0", CVAR_ARCHIVE },

	{ &ui_tourney_fraglimit, "ui_tourney_fraglimit", "0", CVAR_ARCHIVE },
	{ &ui_tourney_timelimit, "ui_tourney_timelimit", "15", CVAR_ARCHIVE },

	{ &ui_team_fraglimit, "ui_team_fraglimit", "0", CVAR_ARCHIVE },
	{ &ui_team_timelimit, "ui_team_timelimit", "20", CVAR_ARCHIVE },
	{ &ui_team_friendly, "ui_team_friendly",  "1", CVAR_ARCHIVE },

	{ &ui_ctf_capturelimit, "ui_ctf_capturelimit", "8", CVAR_ARCHIVE },
	{ &ui_ctf_timelimit, "ui_ctf_timelimit", "30", CVAR_ARCHIVE },
	{ &ui_ctf_friendly, "ui_ctf_friendly",  "0", CVAR_ARCHIVE },*/

	{ &test1, "test1", "0", 0 },
	{ &test2, "test2", "0", 0 },
	{ &test3, "test3", "0", 0 },
	{ &test4, "test4", "0", 0 },
	{ &test5, "test5", "0", 0 },
	{ &test6, "test6", "0", 0 },
	{ &test7, "test7", "0", 0 },
	{ &test8, "test8", "0", 0 },
	{ &test9, "test9", "0", 0 },

	{ &ui_arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM },
	{ &ui_botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM },
	{ &ui_spScores1, "g_spScores1", "", CVAR_ARCHIVE | CVAR_ROM },
	{ &ui_spScores2, "g_spScores2", "", CVAR_ARCHIVE | CVAR_ROM },
	{ &ui_spScores3, "g_spScores3", "", CVAR_ARCHIVE | CVAR_ROM },
	{ &ui_spScores4, "g_spScores4", "", CVAR_ARCHIVE | CVAR_ROM },
	{ &ui_spScores5, "g_spScores5", "", CVAR_ARCHIVE | CVAR_ROM },
	{ &ui_spAwards, "g_spAwards", "", CVAR_ARCHIVE | CVAR_ROM },
	{ &ui_spVideos, "g_spVideos", "", CVAR_ARCHIVE | CVAR_ROM },
	{ &ui_spSkill, "g_spSkill", "1", 0 },

	{ &ui_spSelection, "ui_spSelection", "", CVAR_ROM },

	{ &ui_browserMaster, "ui_browserMaster", "0", CVAR_ARCHIVE },
	{ &ui_browserGameType, "ui_browserGameType", "0", CVAR_ARCHIVE },
	{ &ui_browserSortKey, "ui_browserSortKey", "4", CVAR_ARCHIVE },
	{ &ui_browserShowFull, "ui_browserShowFull", "1", CVAR_ARCHIVE },
	{ &ui_browserShowEmpty, "ui_browserShowEmpty", "1", CVAR_ARCHIVE },

	{ &ui_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
	{ &ui_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
	{ &ui_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
	{ &ui_marks, "cg_marks", "1", CVAR_ARCHIVE },

	{ &ui_server1, "server1", "", CVAR_ARCHIVE },
	{ &ui_server2, "server2", "", CVAR_ARCHIVE },
	{ &ui_server3, "server3", "", CVAR_ARCHIVE },
	{ &ui_server4, "server4", "", CVAR_ARCHIVE },
	{ &ui_server5, "server5", "", CVAR_ARCHIVE },
	{ &ui_server6, "server6", "", CVAR_ARCHIVE },
	{ &ui_server7, "server7", "", CVAR_ARCHIVE },
	{ &ui_server8, "server8", "", CVAR_ARCHIVE },
	{ &ui_server9, "server9", "", CVAR_ARCHIVE },
	{ &ui_server10, "server10", "", CVAR_ARCHIVE },
	{ &ui_server11, "server11", "", CVAR_ARCHIVE },
	{ &ui_server12, "server12", "", CVAR_ARCHIVE },
	{ &ui_server13, "server13", "", CVAR_ARCHIVE },
	{ &ui_server14, "server14", "", CVAR_ARCHIVE },
	{ &ui_server15, "server15", "", CVAR_ARCHIVE },
	{ &ui_server16, "server16", "", CVAR_ARCHIVE },
	{ &ui_server17, "server17", "", CVAR_ARCHIVE },
	{ &ui_server18, "server18", "", CVAR_ARCHIVE },
	{ &ui_server19, "server19", "", CVAR_ARCHIVE },
	{ &ui_server20, "server20", "", CVAR_ARCHIVE },
	{ &ui_server21, "server21", "", CVAR_ARCHIVE },
	{ &ui_server22, "server22", "", CVAR_ARCHIVE },
	{ &ui_server23, "server23", "", CVAR_ARCHIVE },
	{ &ui_server24, "server24", "", CVAR_ARCHIVE },
	{ &ui_server25, "server25", "", CVAR_ARCHIVE },
	{ &ui_server26, "server26", "", CVAR_ARCHIVE },
	{ &ui_server27, "server27", "", CVAR_ARCHIVE },
	{ &ui_server28, "server28", "", CVAR_ARCHIVE },
	{ &ui_server29, "server29", "", CVAR_ARCHIVE },
	{ &ui_server30, "server30", "", CVAR_ARCHIVE },
	{ &ui_server31, "server31", "", CVAR_ARCHIVE },
	{ &ui_server32, "server32", "", CVAR_ARCHIVE },

	{ &ui_cdkeychecked, "ui_cdkeychecked", "0", CVAR_ROM },

	{ &uie_map_multisel, "uie_map_multisel", "0", CVAR_ROM|CVAR_ARCHIVE },
	{ &uie_map_list, "uie_map_list", "0", CVAR_ROM|CVAR_ARCHIVE },
	{ &uie_bot_multisel, "uie_bot_multisel", "0", CVAR_ROM|CVAR_ARCHIVE },
	{ &uie_bot_list, "uie_bot_list", "0", CVAR_ROM|CVAR_ARCHIVE },
	{ &uie_ingame_dynamicmenu, "uie_ingame_dynamicmenu", "1", CVAR_ROM|CVAR_ARCHIVE },
	{ &uie_animsfx, "uie_s_animsfx", "1", CVAR_ROM|CVAR_ARCHIVE },
	{ &uie_mapicons, "uie_mapicons", "0", CVAR_ROM|CVAR_ARCHIVE },
	{ &uie_autoclosebotmenu, "uie_autoclosebotmenu", "0", CVAR_ROM|CVAR_ARCHIVE },
	{ &uie_olditemmenu, "uie_olditemmenu", "0", CVAR_ARCHIVE },
};

static int		cvarTableSize = sizeof(cvarTable) / sizeof(cvarTable[0]);
int 	mod_ammolimit = 200;
int 	mod_gravity = 800;


/*
=================
UI_RegisterCvars
=================
*/
void UI_RegisterCvars( void ) {
	int			i;
	cvarTable_t	*cv;

	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
		trap_Cvar_Register( cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags );
	}

	// we also set default values for the disable_* Cvars here
	// since first usage defines their default value
	UIE_StartServer_RegisterDisableCvars(qtrue);
	trap_Cvar_Set( "sv_pure", "0" );
	if(trap_Cvar_VariableValue("com_hunkMegs") >= 2047){
	trap_Cvar_Set( "com_soundMegs", "256" );
	} else {
	trap_Cvar_Set( "com_soundMegs", "8" );
	}
	trap_Cvar_Set( "cl_dlURL", "http://ws.q3df.org/maps/downloads/%1" );
	trap_Cvar_Set( "cl_guidServerUniq", "0" );
	trap_Cvar_SetValue( "r_lodBias", -5 );
	trap_Cvar_SetValue( "r_subdivisions", 1 );
	//trap_Cvar_SetValue( "r_dlightMode", 1 );
	trap_Cvar_SetValue( "r_dlightSpecPower", 6 );
	trap_Cvar_SetValue( "r_dlightSpecColor", 0.5 );
	trap_Cvar_SetValue( "r_bloom_blend_base", 1 );
	if(trap_Cvar_VariableValue("r_bloom_intensity") >= 0.5){
	trap_Cvar_SetValue( "r_bloom_intensity", 0.1 );
	}
	trap_Cvar_SetValue( "r_bloom_passes", 6 );
	trap_Cvar_SetValue( "r_bloom_modulate", 1 );
	trap_Cvar_SetValue( "r_bloom_reflection", 0.5 );
	trap_Cvar_SetValue( "r_bloom_threshold", 0 );
	trap_Cvar_SetValue( "r_bloom_threshold_mode", 0 );
	
	if(!trap_Cvar_VariableValue("cl_gamestyle")){
	trap_Cvar_Set( "r_mapGreyScale", "-0.5");
	trap_Cvar_Set( "r_mapColorScale", "0");
	trap_Cvar_Set( "r_mapColorRed", "1");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "1");
	trap_Cvar_Set( "r_mapColorRedW", "0");
	trap_Cvar_Set( "r_mapColorGreenW", "0");
	trap_Cvar_Set( "r_mapColorBlueW", "0");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 1){
	trap_Cvar_Set( "r_mapGreyScale", "-1");
	trap_Cvar_Set( "r_mapColorScale", "0");
	trap_Cvar_Set( "r_mapColorRed", "1");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "1");
	trap_Cvar_Set( "r_mapColorRedW", "0");
	trap_Cvar_Set( "r_mapColorGreenW", "0");
	trap_Cvar_Set( "r_mapColorBlueW", "0");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 2){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "0");
	trap_Cvar_Set( "r_mapColorRed", "1");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "1");
	trap_Cvar_Set( "r_mapColorRedW", "0");
	trap_Cvar_Set( "r_mapColorGreenW", "0");
	trap_Cvar_Set( "r_mapColorBlueW", "0");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 3){
	trap_Cvar_Set( "r_mapGreyScale", "0.5");
	trap_Cvar_Set( "r_mapColorScale", "0");
	trap_Cvar_Set( "r_mapColorRed", "1");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "1");
	trap_Cvar_Set( "r_mapColorRedW", "0");
	trap_Cvar_Set( "r_mapColorGreenW", "0");
	trap_Cvar_Set( "r_mapColorBlueW", "0");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 4){
	trap_Cvar_Set( "r_mapGreyScale", "1");
	trap_Cvar_Set( "r_mapColorScale", "0");
	trap_Cvar_Set( "r_mapColorRed", "1");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "1");
	trap_Cvar_Set( "r_mapColorRedW", "0");
	trap_Cvar_Set( "r_mapColorGreenW", "0");
	trap_Cvar_Set( "r_mapColorBlueW", "0");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 5){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "0.5");
	trap_Cvar_Set( "r_mapColorGreen", "0.5");
	trap_Cvar_Set( "r_mapColorBlue", "0.5");
	trap_Cvar_Set( "r_mapColorRedW", "0");
	trap_Cvar_Set( "r_mapColorGreenW", "0");
	trap_Cvar_Set( "r_mapColorBlueW", "0");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 6){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "0.2");
	trap_Cvar_Set( "r_mapColorGreen", "0.2");
	trap_Cvar_Set( "r_mapColorBlue", "0.2");
	trap_Cvar_Set( "r_mapColorRedW", "0");
	trap_Cvar_Set( "r_mapColorGreenW", "0");
	trap_Cvar_Set( "r_mapColorBlueW", "0");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 7){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "0.0");
	trap_Cvar_Set( "r_mapColorGreen", "0.0");
	trap_Cvar_Set( "r_mapColorBlue", "0.0");
	trap_Cvar_Set( "r_mapColorRedW", "0");
	trap_Cvar_Set( "r_mapColorGreenW", "0");
	trap_Cvar_Set( "r_mapColorBlueW", "0");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 8){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "1");
	trap_Cvar_Set( "r_mapColorGreen", "0.5");
	trap_Cvar_Set( "r_mapColorBlue", "0.5");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 9){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "1");
	trap_Cvar_Set( "r_mapColorGreen", "0.5");
	trap_Cvar_Set( "r_mapColorBlue", "0.5");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "1");
	trap_Cvar_Set( "r_mapColorBlueT", "1");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 10){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "0.5");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "0.5");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 11){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "0.5");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "0.5");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "1");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "1");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 12){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "0.5");
	trap_Cvar_Set( "r_mapColorGreen", "0.5");
	trap_Cvar_Set( "r_mapColorBlue", "1");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 13){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "0.5");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "0.5");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "1");
	trap_Cvar_Set( "r_mapColorGreenT", "1");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 14){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "1");
	trap_Cvar_Set( "r_mapColorGreen", "0.50");
	trap_Cvar_Set( "r_mapColorBlue", "0.50");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0.50");
	trap_Cvar_Set( "r_mapColorBlueT", "0.50");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 15){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "0.50");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "0.50");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "0.50");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0.50");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 16){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "0.50");
	trap_Cvar_Set( "r_mapColorGreen", "0.50");
	trap_Cvar_Set( "r_mapColorBlue", "1");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "0.50");
	trap_Cvar_Set( "r_mapColorGreenT", "0.50");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 17){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "1");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "0.50");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0.50");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 18){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "0.50");
	trap_Cvar_Set( "r_mapColorGreen", "1");
	trap_Cvar_Set( "r_mapColorBlue", "1");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "0.50");
	trap_Cvar_Set( "r_mapColorGreenT", "0");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	if(trap_Cvar_VariableValue("cl_gamestyle") == 19){
	trap_Cvar_Set( "r_mapGreyScale", "0");
	trap_Cvar_Set( "r_mapColorScale", "1");
	trap_Cvar_Set( "r_mapColorRed", "1");
	trap_Cvar_Set( "r_mapColorGreen", "0.50");
	trap_Cvar_Set( "r_mapColorBlue", "1");
	trap_Cvar_Set( "r_mapColorRedW", "0.5");
	trap_Cvar_Set( "r_mapColorGreenW", "0.5");
	trap_Cvar_Set( "r_mapColorBlueW", "0.5");
	trap_Cvar_Set( "r_mapColorRedT", "0");
	trap_Cvar_Set( "r_mapColorGreenT", "0.50");
	trap_Cvar_Set( "r_mapColorBlueT", "0");
	}
	trap_Cmd_ExecuteText( EXEC_APPEND, "exec uiautoexec.cfg\n");
	trap_Cmd_ExecuteText( EXEC_APPEND, "execscript d_interact0\n");
	trap_Cmd_ExecuteText( EXEC_APPEND, "execscript weaponset\n");
}

/*
=================
UI_UpdateCvars
=================
*/
void UI_UpdateCvars( void ) {
	int			i;
	cvarTable_t	*cv;

	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
		trap_Cvar_Update( cv->vmCvar );
	}
}



/*
=================
UI_IsValidCvar
=================
*/
qboolean UI_IsValidCvar(const char* cvar)
{
	int i;

	for (i = 0; i < cvarTableSize; i++)
	{
		if (!Q_stricmp(cvar, cvarTable[i].cvarName))
			return qtrue;
	}
	return qfalse;
}

/*
==================
 * UI_SetDefaultCvar
 * If the cvar is blank it will be set to value
 * This is only good for cvars that cannot naturally be blank
==================
 */
void UI_SetDefaultCvar(const char* cvar, const char* value) {
    if(strlen(UI_Cvar_VariableString(cvar)) == 0)
        trap_Cvar_Set(cvar,value);
}



