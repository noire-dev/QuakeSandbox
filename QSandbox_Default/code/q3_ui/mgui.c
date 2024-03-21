/*
=======================================================================

MGUI - QSandbox

=======================================================================
*/
#include "ui_local.h"

#define	 MAX_OBJECTS 250

typedef struct {
	menuframework_s	menu;
	menuobject_s	item[MAX_OBJECTS];
	
} mgui_t;

static mgui_t s_mgui;

/*
=================
MGUI_Event
=================
*/
void MGUI_Event (void* ptr, int event) {
	int i;
	if( event != QM_ACTIVATED ) {
		return;
	}
		
	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
		if(i == ((menucommon_s*)ptr)->id){
		if(((menuobject_s*)ptr)->type >=1 && ((menuobject_s*)ptr)->type <=3){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", ((menucommon_s*)ptr)->cmd));
		}
		if(((menuobject_s*)ptr)->type == 4){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", ((menucommon_s*)ptr)->cmd, ((menuobject_s*)ptr)->field.buffer));
		}
		}
	}
}
void MGUI_EventLost (void* ptr, int event) {
	int i;
	if( event != QM_LOSTFOCUS ) {
		return;
	}
		
	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
		if(i == ((menucommon_s*)ptr)->id){
		if(((menuobject_s*)ptr)->type >=1 && ((menuobject_s*)ptr)->type <=3){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", ((menucommon_s*)ptr)->cmd));
		}
		if(((menuobject_s*)ptr)->type == 4){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", ((menucommon_s*)ptr)->cmd, ((menuobject_s*)ptr)->field.buffer));
		}
		}
	}
}
void MGUI_EventGot (void* ptr, int event) {
	int i;
	if( event != QM_GOTFOCUS ) {
		return;
	}
		
	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
		if(i == ((menucommon_s*)ptr)->id){
		if(((menuobject_s*)ptr)->type >=1 && ((menuobject_s*)ptr)->type <=3){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", ((menucommon_s*)ptr)->cmd));
		}
		if(((menuobject_s*)ptr)->type == 4){
		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s%s\n", ((menucommon_s*)ptr)->cmd, ((menuobject_s*)ptr)->field.buffer));
		}
		}
	}
}

sfxHandle_t MGUI_Key(int key)
{
	switch ( key )
	{
		case K_ESCAPE:
			UI_PopMenu();
			return menu_out_sound;
	}
	return 0;
}

/*
===============
MGUI_MenuDraw
===============
*/

static void MGUI_MenuDraw( void ) {
	vec4_t			color1 = {0.85, 0.9, 1.0, 1};

	Menu_Draw( &s_mgui.menu );

	if (uis.debug) {
	UI_DrawString( vx(50), vy(0.4), "MGUI v1.1 by HyperNoiRe", UI_CENTER|UI_SMALLFONT, color1 );
	}
}

/*
===============
UI_MGUI
===============
*/
void UI_MGUI_Clear( void ) {
	int i;
	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
	UI_Free(s_mgui.item[i].generic.cmd);
	UI_Free(s_mgui.item[i].generic.text);
	UI_Free(s_mgui.item[i].generic.picn);
	UI_Free(s_mgui.item[i].string);
	memset( &s_mgui, 0 ,sizeof(mgui_t) );
	}
}

void UI_MGUI( void ) {
	int i;
	int type;
	char text[256];
	char command[256];
	char pic[256];
	vec4_t color_mgui[MAX_OBJECTS]	    = {1.00f, 0.00f, 1.00f, 1.00f};
	vec4_t color_mgui2[MAX_OBJECTS]	    = {1.00f, 1.00f, 1.00f, 1.00f};

	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
	UI_Free(s_mgui.item[i].generic.cmd);
	UI_Free(s_mgui.item[i].generic.text);
	UI_Free(s_mgui.item[i].generic.picn);
	UI_Free(s_mgui.item[i].string);
	}
	
	memset( &s_mgui, 0 ,sizeof(mgui_t) );

	MainMenu_Cache();
	
	s_mgui.menu.draw = MGUI_MenuDraw;
	if(UI_ArenaScriptAutoInt("mgui_ingame") <= 0){
	s_mgui.menu.fullscreen = qtrue;
	} else {
	s_mgui.menu.fullscreen = qfalse;	
	}
	s_mgui.menu.wrapAround = qtrue;
	s_mgui.menu.native = qtrue;
	s_mgui.menu.downlimitscroll = UI_ArenaScriptAutoFloat("mgui_scroll");
	//s_mgui.menu.key = MGUI_Key;

	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
	type = UI_ArenaScriptAutoInt(va("mitem%i_type", i));
	if(type >= 1 && type <= 4){
	trap_Cvar_VariableStringBuffer(va("mitem%i_str", i), text, sizeof( text ));
	trap_Cvar_VariableStringBuffer(va("mitem%i_cmd", i), command, sizeof( command ));
	trap_Cvar_VariableStringBuffer(va("mitem%i_pic", i), pic, sizeof( pic ));
	color_mgui[i][0] = UI_ArenaScriptAutoFloat(va("mitem%i_colorR", i));
	color_mgui[i][1] = UI_ArenaScriptAutoFloat(va("mitem%i_colorG", i));
	color_mgui[i][2] = UI_ArenaScriptAutoFloat(va("mitem%i_colorB", i));
	color_mgui[i][3] = UI_ArenaScriptAutoFloat(va("mitem%i_colorA", i));
	color_mgui2[i][0] = UI_ArenaScriptAutoFloat(va("mitem%i_colorinnerR", i));
	color_mgui2[i][1] = UI_ArenaScriptAutoFloat(va("mitem%i_colorinnerG", i));
	color_mgui2[i][2] = UI_ArenaScriptAutoFloat(va("mitem%i_colorinnerB", i));
	color_mgui2[i][3] = UI_ArenaScriptAutoFloat(va("mitem%i_colorinnerA", i));
	s_mgui.item[i].generic.type			= MTYPE_UIOBJECT;
	if(strlen(command) >= 1){
	s_mgui.item[i].generic.flags		= QMF_CENTER_JUSTIFY|QMF_HIGHLIGHT_IF_FOCUS;
	} else {
	s_mgui.item[i].generic.flags		= QMF_CENTER_JUSTIFY|QMF_HIGHLIGHT_IF_FOCUS|QMF_INACTIVE;
	}
	s_mgui.item[i].generic.id			= i;
    s_mgui.item[i].generic.cmd = (char *)UI_Alloc(sizeof(command));
    s_mgui.item[i].generic.picn = (char *)UI_Alloc(sizeof(pic));
    s_mgui.item[i].string = (char *)UI_Alloc(sizeof(text));
	if(UI_ArenaScriptAutoInt(va("mitem%i_acttype", i)) <= 1){
	s_mgui.item[i].generic.callback		= MGUI_Event;
	}
	if(UI_ArenaScriptAutoInt(va("mitem%i_acttype", i)) == 2){
	s_mgui.item[i].generic.callback		= MGUI_EventLost;
	}
	if(UI_ArenaScriptAutoInt(va("mitem%i_acttype", i)) == 3){
	s_mgui.item[i].generic.callback		= MGUI_EventGot;
	}
	s_mgui.item[i].type					= type;
	s_mgui.item[i].generic.x			= vx(UI_ArenaScriptAutoFloat(va("mitem%i_x", i)));
	s_mgui.item[i].generic.y			= vy(UI_ArenaScriptAutoFloat(va("mitem%i_y", i)));
	if(UI_ArenaScriptAutoFloat(va("mitem%i_xytype", i)) <= 1){
	s_mgui.item[i].generic.x				= vx(UI_ArenaScriptAutoFloat(va("mitem%i_x", i)));
	s_mgui.item[i].generic.y				= vy(UI_ArenaScriptAutoFloat(va("mitem%i_y", i)));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_xytype", i)) == 2){
	s_mgui.item[i].generic.x				= UI_ArenaScriptAutoFloat(va("mitem%i_x", i));
	s_mgui.item[i].generic.y				= UI_ArenaScriptAutoFloat(va("mitem%i_y", i));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_xytype", i)) == 3){
	s_mgui.item[i].generic.x				= vxcalc(UI_ArenaScriptAutoFloat(va("mitem%i_x", i)));
	s_mgui.item[i].generic.y				= vxcalc(UI_ArenaScriptAutoFloat(va("mitem%i_y", i)));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_whtype", i)) <= 1){
	s_mgui.item[i].width				= vx(UI_ArenaScriptAutoFloat(va("mitem%i_w", i)));
	s_mgui.item[i].height				= vy(UI_ArenaScriptAutoFloat(va("mitem%i_h", i)));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_whtype", i)) == 2){
	s_mgui.item[i].width				= UI_ArenaScriptAutoFloat(va("mitem%i_w", i));
	s_mgui.item[i].height				= UI_ArenaScriptAutoFloat(va("mitem%i_h", i));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_whtype", i)) == 3){
	s_mgui.item[i].width				= vxcalc(UI_ArenaScriptAutoFloat(va("mitem%i_w", i)));
	s_mgui.item[i].height				= vxcalc(UI_ArenaScriptAutoFloat(va("mitem%i_h", i)));
	}
	s_mgui.item[i].color				= color_mgui[i];
	s_mgui.item[i].color2				= color_mgui2[i];
	s_mgui.item[i].corner				= UI_ArenaScriptAutoInt(va("mitem%i_corner", i));
	s_mgui.item[i].fontsize				= UI_ArenaScriptAutoFloat(va("mitem%i_fontsize", i));
	s_mgui.item[i].style		    	= UI_SMALLFONT;
	strcpy(s_mgui.item[i].string, text);
	strcpy(s_mgui.item[i].generic.cmd, command);
	strcpy(s_mgui.item[i].generic.picn, pic);
	if(type == 4){
	s_mgui.item[i].field.widthInChars	= UI_ArenaScriptAutoFloat(va("mitem%i_w", i));
	s_mgui.item[i].field.maxchars		= UI_ArenaScriptAutoFloat(va("mitem%i_w", i));
	s_mgui.item[i].generic.text = (char *)UI_Alloc(sizeof(text));
	strcpy(s_mgui.item[i].generic.text, text);
	}
	}
	}

	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
		if(s_mgui.item[i].type >= 1){
			Menu_AddItem( &s_mgui.menu,	&s_mgui.item[i] );
		}
	}
}

void MGUI_Load( void ) {
	UI_MGUI();
	UI_PushMenu( &s_mgui.menu );
}
