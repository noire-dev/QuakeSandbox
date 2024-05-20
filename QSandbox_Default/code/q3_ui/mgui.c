/*
=======================================================================

MGUI - QSandbox

=======================================================================
*/
#include "ui_local.h"

#define	 MAX_OBJECTS 250

#define ARGWORK_LIST(i) \
    argwork(i, 1),  argwork(i, 2),  argwork(i, 3),  argwork(i, 4),  argwork(i, 5),  \
    argwork(i, 6),  argwork(i, 7),  argwork(i, 8),  argwork(i, 9),  argwork(i, 10), \
    argwork(i, 11), argwork(i, 12), argwork(i, 13), argwork(i, 14), argwork(i, 15), \
    argwork(i, 16), argwork(i, 17), argwork(i, 18), argwork(i, 19), argwork(i, 20), \
    argwork(i, 21), argwork(i, 22), argwork(i, 23), argwork(i, 24), argwork(i, 25), \
    argwork(i, 26), argwork(i, 27), argwork(i, 28), argwork(i, 29), argwork(i, 30)

typedef struct {
	menuframework_s	menu;
	menuobject_s	item[MAX_OBJECTS];
	char* lists[MAX_OBJECTS][524288];
	char  listnames[MAX_OBJECTS][524288];
} mgui_t;

static mgui_t s_mgui;

/*
=================
MGUI_Event
=================
*/
const char* argwork(int i, int num){
    int index = UI_ArenaScriptAutoInt(va("mitem%i_%iarg", i, num));
	char *buffer = (char *)UI_Alloc(512);
    menuobject_s *item = &s_mgui.item[index];

if(index != 0){
    switch (item->type) {
        case 4:
            return item->field.buffer;

        case 5:
            if (item->mode <= 0) {
                return item->itemnames[item->curvalue];
            } else if (item->mode == 1) {
                if (buffer != NULL) {
                    Q_snprintf(buffer, 512, "%i", item->curvalue);  // Safely copy formatted string
                    return buffer;
                } else {
                    return "Allocation failed!";
                }
            }
            break;

        case 7:
		if (item->mode <= 0) {
            if (buffer != NULL) {
                Q_snprintf(buffer, 512, "%i", item->curvalue);  // Safely copy formatted string
                return buffer;
            } else {
                return "Allocation failed!";
            }
		}
		if (item->mode == 1) {
            if (buffer != NULL) {
                Q_snprintf(buffer, 512, "%i", !item->curvalue);  // Safely copy formatted string
                return buffer;
            } else {
                return "Allocation failed!";
            }
		}
		break;
		
        case 8:
            if (buffer != NULL) {
                Q_snprintf(buffer, 512, "%.6f", (float)item->curvalue / (float)item->mode);  // Safely copy formatted string
                return buffer;
            } else {
                return "Allocation failed!";
            }
    }
}
	
return "Unknown type!";
}

void UI_MGUI_Save( void ) {
	int i;
	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
		if(strlen(UI_ArenaScriptAutoChar(va("mitem%i_savecvar", i))) != 0){
			if(s_mgui.item[i].type == 4){
				trap_Cvar_Set( UI_ArenaScriptAutoChar(va("mitem%i_savecvar", i)), s_mgui.item[i].field.buffer );
			}
			if(s_mgui.item[i].type == 5){
				trap_Cvar_Set( UI_ArenaScriptAutoChar(va("mitem%i_savecvar", i)), va("%i", s_mgui.item[i].curvalue) );
			}
			if(s_mgui.item[i].type == 7){
				if(s_mgui.item[i].mode <= 0){
				trap_Cvar_Set( UI_ArenaScriptAutoChar(va("mitem%i_savecvar", i)), va("%i", s_mgui.item[i].curvalue) );
				}
				if(s_mgui.item[i].mode == 1){
				trap_Cvar_Set( UI_ArenaScriptAutoChar(va("mitem%i_savecvar", i)), va("%i", !(s_mgui.item[i].curvalue)) );
				}
			}
			if(s_mgui.item[i].type == 8){
				trap_Cvar_Set( UI_ArenaScriptAutoChar(va("mitem%i_savecvar", i)), va("%.6f", (float)s_mgui.item[i].curvalue / (float)s_mgui.item[i].mode) );
			}
		}
	}
}

void MGUI_Event (void* ptr, int event) {
	int i;
	
	if(UI_ArenaScriptAutoInt(va("mitem%i_acttype", ((menucommon_s*)ptr)->id)) <= 1){
	if( event != QM_ACTIVATED ) { return; }
	}
	if(UI_ArenaScriptAutoInt(va("mitem%i_acttype", ((menucommon_s*)ptr)->id)) == 2){
	if( event != QM_LOSTFOCUS ) { return; }
	}
	if(UI_ArenaScriptAutoInt(va("mitem%i_acttype", ((menucommon_s*)ptr)->id)) == 3){
	if( event != QM_GOTFOCUS ) { return; }
	}
		
	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
		if(i == ((menucommon_s*)ptr)->id){
		trap_Cmd_ExecuteText( EXEC_NOW, va(((menucommon_s*)ptr)->cmd, ARGWORK_LIST(i) ));
		if(strlen(((menucommon_s*)ptr)->cmd2) != 0){
		trap_Cmd_ExecuteText( EXEC_NOW, va(((menucommon_s*)ptr)->cmd2, ARGWORK_LIST(i) ));
		}
		UI_MGUI_Save();
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

refdef_t		mguirender[MAX_OBJECTS];
refEntity_t		mguientity[MAX_OBJECTS];

static void MGUI_MenuDraw( void ) {
	vec4_t			color1 = {0.85, 0.9, 1.0, 1};

	if(!mgui_api_active.integer){
	Menu_Draw( &s_mgui.menu );
	}
	
	if(mgui_api_active.integer){
	UI_MGUI_Save();
	trap_Cvar_SetValue( "mgui_api_active", 0 );
	UI_ForceMenuOff ();
	}

	if (uis.debug) {
	UI_DrawString( vx(50), vy(0.4), "MGUI v1.3 by HyperNoiRe", UI_CENTER|UI_SMALLFONT, color1 );
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
	}
	memset( &s_mgui, 0 ,sizeof(mgui_t) );
}

void UI_MGUI_Edit( int mode, int i, int count, char *uiname ) {
if(mode == 1){
s_mgui.item[i].curvalue += count;
if(s_mgui.item[i].curvalue < 0) s_mgui.item[i].curvalue = s_mgui.item[i].numitems-1;
if(s_mgui.item[i].curvalue > s_mgui.item[i].numitems-1) s_mgui.item[i].curvalue = 0;
}
if(mode == 2){
	trap_Cmd_ExecuteText( EXEC_NOW, va("mgui_api %s", uiname));
	trap_Cmd_ExecuteText( EXEC_NOW, va(s_mgui.item[i].generic.cmd, ARGWORK_LIST(i) ));
	trap_Cmd_ExecuteText( EXEC_NOW, va(s_mgui.item[i].generic.cmd2, ARGWORK_LIST(i) ));
	UI_MGUI_Save();
}
}

/*
===============
LoadMguiList
===============
*/
static void LoadMguiList( int it )
{
	int 	i;
	int		len;
	char	*configname;
	
	if (!s_mgui.item[it].numitems) {
		strcpy(s_mgui.listnames[it],"No files");
		s_mgui.item[it].numitems = 1;
	}
	else if (s_mgui.item[it].numitems > 65536)
		s_mgui.item[it].numitems = 65536;

	configname = s_mgui.listnames[it];
	for ( i = 0; i < s_mgui.item[it].numitems; i++ ) {
		s_mgui.item[it].itemnames[i] = configname;

		// strip extension
		len = strlen( configname );
		if (!Q_stricmp(configname +  len - (strlen(s_mgui.item[it].generic.picn)+1),va(".%s", s_mgui.item[it].generic.picn)))
			configname[len-(strlen(s_mgui.item[it].generic.picn)+1)] = '\0';

		Q_strupr(configname);

		configname += len + 1;
	}
}

void UI_MGUI( void ) {
	int i;
	int type;
	char text[256];
	char command[512];
	char command2[512];
	char pic[256];
	char initvalue[256];
	vec4_t color_mgui[MAX_OBJECTS]	    = {1.00f, 0.00f, 1.00f, 1.00f};
	vec4_t color_mgui2[MAX_OBJECTS]	    = {1.00f, 1.00f, 1.00f, 1.00f};

	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
	UI_Free(s_mgui.item[i].generic.cmd);
	UI_Free(s_mgui.item[i].generic.text);
	UI_Free(s_mgui.item[i].generic.picn);
	UI_Free(s_mgui.item[i].string);
	}
	
	memset( &s_mgui, 0 ,sizeof(mgui_t) );
	
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
	if(type >= 1 && type <= 8){
	trap_Cvar_VariableStringBuffer(va("mitem%i_text", i), text, sizeof( text ));
	trap_Cvar_VariableStringBuffer(va("mitem%i_cmd", i), command, sizeof( command ));
	trap_Cvar_VariableStringBuffer(va("mitem%i_cmd2", i), command2, sizeof( command2 ));
	trap_Cvar_VariableStringBuffer(va("mitem%i_file", i), pic, sizeof( pic ));
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
    s_mgui.item[i].generic.cmd 			= (char *)UI_Alloc(512);
    s_mgui.item[i].generic.cmd2 		= (char *)UI_Alloc(512);
    s_mgui.item[i].generic.picn 		= (char *)UI_Alloc(256);
    s_mgui.item[i].string 				= (char *)UI_Alloc(256);
	s_mgui.item[i].generic.callback		= MGUI_Event;
	s_mgui.item[i].type					= type;
	if(UI_ArenaScriptAutoFloat(va("mitem%i_xtype", i)) <= 1){
	s_mgui.item[i].generic.x				= vx(UI_ArenaScriptAutoFloat(va("mitem%i_x", i)));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_xtype", i)) == 2){
	s_mgui.item[i].generic.x				= UI_ArenaScriptAutoFloat(va("mitem%i_x", i));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_xtype", i)) == 3){
	s_mgui.item[i].generic.x				= vxcalc(UI_ArenaScriptAutoFloat(va("mitem%i_x", i)));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_ytype", i)) <= 1){
	s_mgui.item[i].generic.y				= vy(UI_ArenaScriptAutoFloat(va("mitem%i_y", i)));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_ytype", i)) == 2){
	s_mgui.item[i].generic.y				= UI_ArenaScriptAutoFloat(va("mitem%i_y", i));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_ytype", i)) == 3){
	s_mgui.item[i].generic.y				= vxcalc(UI_ArenaScriptAutoFloat(va("mitem%i_y", i)));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_wtype", i)) <= 1){
	s_mgui.item[i].width				= vx(UI_ArenaScriptAutoFloat(va("mitem%i_w", i)));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_wtype", i)) == 2){
	s_mgui.item[i].width				= UI_ArenaScriptAutoFloat(va("mitem%i_w", i));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_wtype", i)) == 3){
	s_mgui.item[i].width				= vxcalc(UI_ArenaScriptAutoFloat(va("mitem%i_w", i)));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_htype", i)) <= 1){
	s_mgui.item[i].height				= vy(UI_ArenaScriptAutoFloat(va("mitem%i_h", i)));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_htype", i)) == 2){
	s_mgui.item[i].height				= UI_ArenaScriptAutoFloat(va("mitem%i_h", i));
	}
	if(UI_ArenaScriptAutoFloat(va("mitem%i_htype", i)) == 3){
	s_mgui.item[i].height				= vxcalc(UI_ArenaScriptAutoFloat(va("mitem%i_h", i)));
	}
	s_mgui.item[i].color				= color_mgui[i];
	s_mgui.item[i].color2				= color_mgui2[i];
	s_mgui.item[i].corner				= UI_ArenaScriptAutoInt(va("mitem%i_corner", i));
	s_mgui.item[i].mode					= UI_ArenaScriptAutoInt(va("mitem%i_mode", i));
	s_mgui.item[i].fontsize				= UI_ArenaScriptAutoFloat(va("mitem%i_fontsize", i));
	s_mgui.item[i].styles		    	= UI_ArenaScriptAutoFloat(va("mitem%i_style", i));
	s_mgui.item[i].style		    	= UI_SMALLFONT;
	strcpy(s_mgui.item[i].string, UI_ArenaScriptAutoChar(text));
	strcpy(s_mgui.item[i].generic.cmd, UI_ArenaScriptAutoChar(command));
	strcpy(s_mgui.item[i].generic.cmd2, UI_ArenaScriptAutoChar(command2));
	strcpy(s_mgui.item[i].generic.picn, UI_ArenaScriptAutoChar(pic));
	if(type == 4){
	s_mgui.item[i].field.widthInChars	= UI_ArenaScriptAutoFloat(va("mitem%i_w", i));
	s_mgui.item[i].field.maxchars		= UI_ArenaScriptAutoFloat(va("mitem%i_w", i));
	s_mgui.item[i].generic.text = (char *)UI_Alloc(256);
	strcpy(s_mgui.item[i].generic.text, UI_ArenaScriptAutoChar(text));
	}
	if(type == 5){
	if(strlen(command) >= 1){
	s_mgui.item[i].generic.flags		= QMF_HIGHLIGHT_IF_FOCUS;
	} else {
	s_mgui.item[i].generic.flags		= QMF_HIGHLIGHT_IF_FOCUS|QMF_INACTIVE;
	}
	s_mgui.item[i].numitems			= trap_FS_GetFileList( UI_ArenaScriptAutoChar(text), UI_ArenaScriptAutoChar(pic), s_mgui.listnames[i], 524288 );
	s_mgui.item[i].itemnames		= (const char **)s_mgui.lists[i];
	s_mgui.item[i].columns			= UI_ArenaScriptAutoInt(va("mitem%i_col", i));
	s_mgui.item[i].seperation		= 0;
	}
	if(type == 7){
	s_mgui.item[i].generic.text = (char *)UI_Alloc(256);
	strcpy(s_mgui.item[i].generic.text, UI_ArenaScriptAutoChar(text));
	}
	if(type == 8){
	s_mgui.item[i].generic.text = (char *)UI_Alloc(256);
	strcpy(s_mgui.item[i].generic.text, UI_ArenaScriptAutoChar(text));
	s_mgui.item[i].minvalue = UI_ArenaScriptAutoInt(va("mitem%i_min", i));
	s_mgui.item[i].maxvalue = UI_ArenaScriptAutoInt(va("mitem%i_max", i));
	}
	}
	}

	for ( i = 1; i < MAX_OBJECTS-1; i++ ) {
		if(s_mgui.item[i].type >= 1 && s_mgui.item[i].type <= 8){
		if(s_mgui.item[i].type == 5){
			LoadMguiList(i);
		}
			Menu_AddItem( &s_mgui.menu,	&s_mgui.item[i] );
		}
		
		if(strlen(UI_ArenaScriptAutoChar(va("mitem%i_savecvar", i))) != 0){
			if(s_mgui.item[i].type == 4){
				Q_strncpyz( s_mgui.item[i].field.buffer, UI_ArenaScriptAutoChar(UI_ArenaScriptAutoChar(va("mitem%i_savecvar", i))), sizeof(s_mgui.item[i].field.buffer) );
			}
			if(s_mgui.item[i].type == 5){
				s_mgui.item[i].curvalue = atoi(UI_ArenaScriptAutoChar(UI_ArenaScriptAutoChar((va("mitem%i_savecvar", i)))));
			}
			if(s_mgui.item[i].type == 7){
				if(s_mgui.item[i].mode <= 0){
				s_mgui.item[i].curvalue = atoi(UI_ArenaScriptAutoChar(UI_ArenaScriptAutoChar((va("mitem%i_savecvar", i)))));
				}
				if(s_mgui.item[i].mode == 1){
				s_mgui.item[i].curvalue = !(atoi(UI_ArenaScriptAutoChar(UI_ArenaScriptAutoChar((va("mitem%i_savecvar", i))))));
				}
			}
			if(s_mgui.item[i].type == 8){
				s_mgui.item[i].curvalue = atof(UI_ArenaScriptAutoChar(UI_ArenaScriptAutoChar((va("mitem%i_savecvar", i))))) * (float)s_mgui.item[i].mode;
			}
		}
		
		if(strlen(UI_ArenaScriptAutoChar(va("mitem%i_value", i))) != 0){
			if(s_mgui.item[i].type == 4){
				trap_Cvar_VariableStringBuffer(va("mitem%i_value", i), initvalue, sizeof( initvalue ));
				Q_strncpyz( s_mgui.item[i].field.buffer, UI_ArenaScriptAutoChar(initvalue), sizeof(s_mgui.item[i].field.buffer) );	
			}
			if(s_mgui.item[i].type == 5){
				s_mgui.item[i].curvalue = atoi(UI_ArenaScriptAutoChar(UI_ArenaScriptAutoChar((va("mitem%i_value", i)))));
			}
			if(s_mgui.item[i].type == 7){
				if(s_mgui.item[i].mode <= 0){
					s_mgui.item[i].curvalue = atoi(UI_ArenaScriptAutoChar(UI_ArenaScriptAutoChar((va("mitem%i_value", i)))));
				}
				if(s_mgui.item[i].mode == 1){
					s_mgui.item[i].curvalue = !(atoi(UI_ArenaScriptAutoChar(UI_ArenaScriptAutoChar((va("mitem%i_value", i))))));
				}
			}
			if(s_mgui.item[i].type == 8){
				s_mgui.item[i].curvalue = atof(UI_ArenaScriptAutoChar(UI_ArenaScriptAutoChar((va("mitem%i_value", i))))) * (float)s_mgui.item[i].mode;
			}
		}
		
	}
}

void MGUI_Load( void ) {
	UI_MGUI();
	UI_PushMenu( &s_mgui.menu );
}
