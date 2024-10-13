export Com_Error
code
proc Com_Error 1032 8
file "../../../code/q3_ui/ui_atoms.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/**********************************************************************
;4:	UI_ATOMS.C
;5:
;6:	User interface building blocks and support functions.
;7:**********************************************************************/
;8:
;9:
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:uiStatic_t		uis;
;15:qboolean		m_entersound;		// after a frame, so caching won't disrupt the sound
;16:
;17:// these are here so the functions in q_shared.c can link
;18:#ifndef UI_HARD_LINKED
;19:
;20:void QDECL Com_Error( int level, const char *error, ... ) {
line 23
;21:	va_list		argptr;
;22:	char		text[1024];
;23:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 25
;24://	vsprintf (text, error, argptr);
;25:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 27
;26:
;27:	trap_Error( va("%s", text) );
ADDRGP4 $82
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 28
;28:}
LABELV $80
endproc Com_Error 1032 8
export Com_Printf
proc Com_Printf 1032 8
line 30
;29:
;30:void QDECL Com_Printf( const char *msg, ... ) {
line 34
;31:	va_list		argptr;
;32:	char		text[1024];
;33:
;34:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 36
;35://	vsprintf (text, msg, argptr);
;36:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 38
;37:
;38:	trap_Print( va("%s", text) );
ADDRGP4 $82
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 39
;39:}
LABELV $83
endproc Com_Printf 1032 8
export UI_ClampCvar
proc UI_ClampCvar 0 0
line 49
;40:
;41:#endif
;42:
;43:/*
;44:=================
;45:UI_ClampCvar
;46:=================
;47:*/
;48:float UI_ClampCvar( float min, float max, float value )
;49:{
line 50
;50:	if ( value < min ) return min;
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $86
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $85
JUMPV
LABELV $86
line 51
;51:	if ( value > max ) return max;
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $88
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $85
JUMPV
LABELV $88
line 52
;52:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $85
endproc UI_ClampCvar 0 0
export UI_StartDemoLoop
proc UI_StartDemoLoop 0 8
line 60
;53:}
;54:
;55:/*
;56:=================
;57:UI_StartDemoLoop
;58:=================
;59:*/
;60:void UI_StartDemoLoop( void ) {
line 61
;61:	trap_Cmd_ExecuteText( EXEC_APPEND, "d1\n" );
CNSTI4 2
ARGI4
ADDRGP4 $91
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 62
;62:}
LABELV $90
endproc UI_StartDemoLoop 0 8
export UI_ScreenOffset
proc UI_ScreenOffset 1036 12
line 71
;63:
;64:/*
;65:================
;66:UI_ScreenOffset
;67:
;68:Adjusted for resolution and screen aspect ratio
;69:================
;70:*/
;71:void UI_ScreenOffset( void ) {
line 76
;72:	float scrx;
;73:	float scry;
;74:	char  svinfo[MAX_INFO_STRING];
;75:	
;76:	trap_GetGlconfig( &uis.glconfig );
ADDRGP4 uis+60
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 78
;77:	
;78:	scrx = uis.glconfig.vidWidth;
ADDRLP4 0
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
ASGNF4
line 79
;79:	scry = uis.glconfig.vidHeight;
ADDRLP4 4
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
ASGNF4
line 81
;80:	
;81:	if((scrx / (scry / 480)-640)/2 >= 0){
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1139802112
DIVF4
DIVF4
CNSTF4 1142947840
SUBF4
CNSTF4 1073741824
DIVF4
CNSTF4 0
LTF4 $98
line 82
;82:	trap_Cvar_SetValue("cl_screenoffset", (scrx / (scry / 480)-640)/2);
ADDRGP4 $100
ARGP4
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1139802112
DIVF4
DIVF4
CNSTF4 1142947840
SUBF4
CNSTF4 1073741824
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 83
;83:	uis.wideoffset = (scrx / (scry / 480)-640)/2;
ADDRGP4 uis+11476
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1139802112
DIVF4
DIVF4
CNSTF4 1142947840
SUBF4
CNSTF4 1073741824
DIVF4
CVFI4 4
ASGNI4
line 84
;84:	} else {
ADDRGP4 $99
JUMPV
LABELV $98
line 85
;85:	trap_Cvar_SetValue("cl_screenoffset", 0);	
ADDRGP4 $100
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 86
;86:	uis.wideoffset = 0;
ADDRGP4 uis+11476
CNSTI4 0
ASGNI4
line 87
;87:	}
LABELV $99
line 88
;88:	trap_GetConfigString( CS_SERVERINFO, svinfo, MAX_INFO_STRING );
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 89
;89:	if(strlen(svinfo) <= 0){
ADDRLP4 8
ARGP4
ADDRLP4 1032
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
GTI4 $103
line 90
;90:	uis.onmap = qfalse;
ADDRGP4 uis+11500
CNSTI4 0
ASGNI4
line 91
;91:	} else {
ADDRGP4 $104
JUMPV
LABELV $103
line 92
;92:	uis.onmap = qtrue;	
ADDRGP4 uis+11500
CNSTI4 1
ASGNI4
line 93
;93:	}
LABELV $104
line 94
;94:}
LABELV $92
endproc UI_ScreenOffset 1036 12
export UI_PushMenu
proc UI_PushMenu 24 8
line 102
;95:
;96:/*
;97:=================
;98:UI_PushMenu
;99:=================
;100:*/
;101:void UI_PushMenu( menuframework_s *menu )
;102:{
line 107
;103:	int				i;
;104:	int				number;
;105:	menucommon_s*	item;
;106:	
;107:	number = rand() % 4 + 1;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
CNSTI4 4
MODI4
CNSTI4 1
ADDI4
ASGNI4
line 109
;108:	
;109:	trap_Cvar_SetValue( "ui_backcolors", number );
ADDRGP4 $108
ARGP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 112
;110:	
;111:	// initialize the screen offset
;112:	UI_ScreenOffset();
ADDRGP4 UI_ScreenOffset
CALLV
pop
line 114
;113:	
;114:	uis.menuscroll = 0;
ADDRGP4 uis+11468
CNSTI4 0
ASGNI4
line 118
;115:	
;116:
;117:	// avoid stacking menus invoked by hotkeys
;118:	for (i=0 ; i<uis.menusp ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $110
line 119
;119:	{
line 120
;120:		if (uis.stack[i] == menu)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+28
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $115
line 121
;121:		{
line 122
;122:			uis.menusp = i;
ADDRGP4 uis+20
ADDRLP4 0
INDIRI4
ASGNI4
line 123
;123:			break;
ADDRGP4 $112
JUMPV
LABELV $115
line 125
;124:		}
;125:	}
LABELV $111
line 118
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $113
ADDRLP4 0
INDIRI4
ADDRGP4 uis+20
INDIRI4
LTI4 $110
LABELV $112
line 127
;126:
;127:	if (i == uis.menusp)
ADDRLP4 0
INDIRI4
ADDRGP4 uis+20
INDIRI4
NEI4 $119
line 128
;128:	{
line 129
;129:		if (uis.menusp >= MAX_MENUDEPTH)
ADDRGP4 uis+20
INDIRI4
CNSTI4 8
LTI4 $122
line 130
;130:			trap_Error("UI_PushMenu: menu stack overflow");
ADDRGP4 $125
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $122
line 132
;131:
;132:		uis.stack[uis.menusp++] = menu;
ADDRLP4 20
ADDRGP4 uis+20
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+28
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 133
;133:	}
LABELV $119
line 135
;134:
;135:	uis.activemenu = menu;
ADDRGP4 uis+24
ADDRFP4 0
INDIRP4
ASGNP4
line 138
;136:
;137:	// default cursor position
;138:	menu->cursor      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 139
;139:	menu->cursor_prev = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 141
;140:
;141:	m_entersound = qtrue;
ADDRGP4 m_entersound
CNSTI4 1
ASGNI4
line 143
;142:
;143:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 146
;144:
;145:	// force first available item to have focus
;146:	for (i=0; i<menu->nitems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 147
;147:	{
line 148
;148:		item = (menucommon_s *)menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 149
;149:		if (!(item->flags & (QMF_GRAYED|QMF_MOUSEONLY|QMF_INACTIVE)))
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 26624
BANDU4
CNSTU4 0
NEU4 $133
line 150
;150:		{
line 151
;151:			menu->cursor_prev = -1;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 -1
ASGNI4
line 152
;152:			Menu_SetCursor( menu, i );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 153
;153:			break;
ADDRGP4 $131
JUMPV
LABELV $133
line 155
;154:		}
;155:	}
LABELV $130
line 146
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $129
LABELV $131
line 157
;156:
;157:	uis.firstdraw = qtrue;
ADDRGP4 uis+11496
CNSTI4 1
ASGNI4
line 158
;158:}
LABELV $107
endproc UI_PushMenu 24 8
export UI_PopMenu
proc UI_PopMenu 4 8
line 166
;159:
;160:/*
;161:=================
;162:UI_PopMenu
;163:=================
;164:*/
;165:void UI_PopMenu (void)
;166:{
line 167
;167:	trap_S_StartLocalSound( menu_out_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_out_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 169
;168:
;169:	uis.menusp--;
ADDRLP4 0
ADDRGP4 uis+20
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 171
;170:	
;171:	uis.menuscroll = 0;
ADDRGP4 uis+11468
CNSTI4 0
ASGNI4
line 173
;172:
;173:	if (uis.menusp < 0)
ADDRGP4 uis+20
INDIRI4
CNSTI4 0
GEI4 $139
line 174
;174:		UI_ForceMenuOff ();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
LABELV $139
line 176
;175:
;176:	if (uis.menusp) {
ADDRGP4 uis+20
INDIRI4
CNSTI4 0
EQI4 $142
line 177
;177:		uis.activemenu = uis.stack[uis.menusp-1];
ADDRGP4 uis+24
ADDRGP4 uis+20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+28-4
ADDP4
INDIRP4
ASGNP4
line 178
;178:		uis.firstdraw = qtrue;
ADDRGP4 uis+11496
CNSTI4 1
ASGNI4
line 179
;179:	}
ADDRGP4 $143
JUMPV
LABELV $142
line 180
;180:	else {
line 181
;181:		UI_ForceMenuOff ();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 182
;182:	}
LABELV $143
line 183
;183:}
LABELV $136
endproc UI_PopMenu 4 8
export UI_ForceMenuOff
proc UI_ForceMenuOff 4 8
line 186
;184:
;185:void UI_ForceMenuOff (void)
;186:{
line 187
;187:	uis.menusp     = 0;
ADDRGP4 uis+20
CNSTI4 0
ASGNI4
line 188
;188:	uis.activemenu = NULL;
ADDRGP4 uis+24
CNSTP4 0
ASGNP4
line 190
;189:
;190:	trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 191
;191:	trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 192
;192:	trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $153
ARGP4
ADDRGP4 $154
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 193
;193:}
LABELV $150
endproc UI_ForceMenuOff 4 8
export UI_LerpColor
proc UI_LerpColor 12 0
line 201
;194:
;195:/*
;196:=================
;197:UI_LerpColor
;198:=================
;199:*/
;200:void UI_LerpColor(vec4_t a, vec4_t b, vec4_t c, float t)
;201:{
line 205
;202:	int i;
;203:
;204:	// lerp and clamp each component
;205:	for (i=0; i<4; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $156
line 206
;206:	{
line 207
;207:		c[i] = a[i] + t*(b[i]-a[i]);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 208
;208:		if (c[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $160
line 209
;209:			c[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $161
JUMPV
LABELV $160
line 210
;210:		else if (c[i] > 1.0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 1065353216
LEF4 $162
line 211
;211:			c[i] = 1.0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $162
LABELV $161
line 212
;212:	}
LABELV $157
line 205
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $156
line 213
;213:}
LABELV $155
endproc UI_LerpColor 12 0
data
align 4
LABELV propMap
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 8
byte 4 11
byte 4 122
byte 4 7
byte 4 154
byte 4 181
byte 4 14
byte 4 55
byte 4 122
byte 4 17
byte 4 79
byte 4 122
byte 4 18
byte 4 101
byte 4 122
byte 4 23
byte 4 153
byte 4 122
byte 4 18
byte 4 9
byte 4 93
byte 4 7
byte 4 207
byte 4 122
byte 4 8
byte 4 230
byte 4 122
byte 4 9
byte 4 177
byte 4 122
byte 4 18
byte 4 30
byte 4 152
byte 4 18
byte 4 85
byte 4 181
byte 4 7
byte 4 34
byte 4 93
byte 4 11
byte 4 110
byte 4 181
byte 4 6
byte 4 130
byte 4 152
byte 4 14
byte 4 22
byte 4 64
byte 4 17
byte 4 41
byte 4 64
byte 4 12
byte 4 58
byte 4 64
byte 4 17
byte 4 78
byte 4 64
byte 4 18
byte 4 98
byte 4 64
byte 4 19
byte 4 120
byte 4 64
byte 4 18
byte 4 141
byte 4 64
byte 4 18
byte 4 204
byte 4 64
byte 4 16
byte 4 162
byte 4 64
byte 4 17
byte 4 182
byte 4 64
byte 4 18
byte 4 59
byte 4 181
byte 4 7
byte 4 35
byte 4 181
byte 4 7
byte 4 203
byte 4 152
byte 4 14
byte 4 56
byte 4 93
byte 4 14
byte 4 228
byte 4 152
byte 4 14
byte 4 177
byte 4 181
byte 4 18
byte 4 28
byte 4 122
byte 4 22
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 60
byte 4 152
byte 4 7
byte 4 106
byte 4 151
byte 4 13
byte 4 83
byte 4 152
byte 4 7
byte 4 128
byte 4 122
byte 4 17
byte 4 4
byte 4 152
byte 4 21
byte 4 134
byte 4 181
byte 4 5
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 153
byte 4 152
byte 4 13
byte 4 11
byte 4 181
byte 4 5
byte 4 180
byte 4 152
byte 4 13
byte 4 79
byte 4 93
byte 4 17
byte 4 0
byte 4 0
byte 4 -1
align 4
LABELV propMapB
byte 4 11
byte 4 12
byte 4 33
byte 4 49
byte 4 12
byte 4 31
byte 4 85
byte 4 12
byte 4 31
byte 4 120
byte 4 12
byte 4 30
byte 4 156
byte 4 12
byte 4 21
byte 4 183
byte 4 12
byte 4 21
byte 4 207
byte 4 12
byte 4 32
byte 4 13
byte 4 55
byte 4 30
byte 4 49
byte 4 55
byte 4 13
byte 4 66
byte 4 55
byte 4 29
byte 4 101
byte 4 55
byte 4 31
byte 4 135
byte 4 55
byte 4 21
byte 4 158
byte 4 55
byte 4 40
byte 4 204
byte 4 55
byte 4 32
byte 4 12
byte 4 97
byte 4 31
byte 4 48
byte 4 97
byte 4 31
byte 4 82
byte 4 97
byte 4 30
byte 4 118
byte 4 97
byte 4 30
byte 4 153
byte 4 97
byte 4 30
byte 4 185
byte 4 97
byte 4 25
byte 4 213
byte 4 97
byte 4 30
byte 4 11
byte 4 139
byte 4 32
byte 4 42
byte 4 139
byte 4 51
byte 4 93
byte 4 139
byte 4 32
byte 4 126
byte 4 139
byte 4 31
byte 4 158
byte 4 139
byte 4 25
code
proc UI_DrawBannerString2 92 36
line 374
;214:
;215:/*
;216:=================
;217:UI_DrawProportionalString2
;218:=================
;219:*/
;220:static int	propMap[128][3] = {
;221:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;222:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;223:
;224:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;225:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;226:
;227:{0, 0, PROP_SPACE_WIDTH},		// SPACE
;228:{11, 122, 7},	// !
;229:{154, 181, 14},	// "
;230:{55, 122, 17},	// #
;231:{79, 122, 18},	// $
;232:{101, 122, 23},	// %
;233:{153, 122, 18},	// &
;234:{9, 93, 7},		// '
;235:{207, 122, 8},	// (
;236:{230, 122, 9},	// )
;237:{177, 122, 18},	// *
;238:{30, 152, 18},	// +
;239:{85, 181, 7},	// ,
;240:{34, 93, 11},	// -
;241:{110, 181, 6},	// .
;242:{130, 152, 14},	// /
;243:
;244:{22, 64, 17},	// 0
;245:{41, 64, 12},	// 1
;246:{58, 64, 17},	// 2
;247:{78, 64, 18},	// 3
;248:{98, 64, 19},	// 4
;249:{120, 64, 18},	// 5
;250:{141, 64, 18},	// 6
;251:{204, 64, 16},	// 7
;252:{162, 64, 17},	// 8
;253:{182, 64, 18},	// 9
;254:{59, 181, 7},	// :
;255:{35,181, 7},	// ;
;256:{203, 152, 14},	// <
;257:{56, 93, 14},	// =
;258:{228, 152, 14},	// >
;259:{177, 181, 18},	// ?
;260:
;261:{28, 122, 22},	// @
;262:{5, 4, 18},		// A
;263:{27, 4, 18},	// B
;264:{48, 4, 18},	// C
;265:{69, 4, 17},	// D
;266:{90, 4, 13},	// E
;267:{106, 4, 13},	// F
;268:{121, 4, 18},	// G
;269:{143, 4, 17},	// H
;270:{164, 4, 8},	// I
;271:{175, 4, 16},	// J
;272:{195, 4, 18},	// K
;273:{216, 4, 12},	// L
;274:{230, 4, 23},	// M
;275:{6, 34, 18},	// N
;276:{27, 34, 18},	// O
;277:
;278:{48, 34, 18},	// P
;279:{68, 34, 18},	// Q
;280:{90, 34, 17},	// R
;281:{110, 34, 18},	// S
;282:{130, 34, 14},	// T
;283:{146, 34, 18},	// U
;284:{166, 34, 19},	// V
;285:{185, 34, 29},	// W
;286:{215, 34, 18},	// X
;287:{234, 34, 18},	// Y
;288:{5, 64, 14},	// Z
;289:{60, 152, 7},	// [
;290:{106, 151, 13},	// '\'
;291:{83, 152, 7},	// ]
;292:{128, 122, 17},	// ^
;293:{4, 152, 21},	// _
;294:
;295:{134, 181, 5},	// '
;296:{5, 4, 18},		// A
;297:{27, 4, 18},	// B
;298:{48, 4, 18},	// C
;299:{69, 4, 17},	// D
;300:{90, 4, 13},	// E
;301:{106, 4, 13},	// F
;302:{121, 4, 18},	// G
;303:{143, 4, 17},	// H
;304:{164, 4, 8},	// I
;305:{175, 4, 16},	// J
;306:{195, 4, 18},	// K
;307:{216, 4, 12},	// L
;308:{230, 4, 23},	// M
;309:{6, 34, 18},	// N
;310:{27, 34, 18},	// O
;311:
;312:{48, 34, 18},	// P
;313:{68, 34, 18},	// Q
;314:{90, 34, 17},	// R
;315:{110, 34, 18},	// S
;316:{130, 34, 14},	// T
;317:{146, 34, 18},	// U
;318:{166, 34, 19},	// V
;319:{185, 34, 29},	// W
;320:{215, 34, 18},	// X
;321:{234, 34, 18},	// Y
;322:{5, 64, 14},	// Z
;323:{153, 152, 13},	// {
;324:{11, 181, 5},	// |
;325:{180, 152, 13},	// }
;326:{79, 93, 17},	// ~
;327:{0, 0, -1}		// DEL
;328:};
;329:
;330:static int propMapB[26][3] = {
;331:{11, 12, 33},
;332:{49, 12, 31},
;333:{85, 12, 31},
;334:{120, 12, 30},
;335:{156, 12, 21},
;336:{183, 12, 21},
;337:{207, 12, 32},
;338:
;339:{13, 55, 30},
;340:{49, 55, 13},
;341:{66, 55, 29},
;342:{101, 55, 31},
;343:{135, 55, 21},
;344:{158, 55, 40},
;345:{204, 55, 32},
;346:
;347:{12, 97, 31},
;348:{48, 97, 31},
;349:{82, 97, 30},
;350:{118, 97, 30},
;351:{153, 97, 30},
;352:{185, 97, 25},
;353:{213, 97, 30},
;354:
;355:{11, 139, 32},
;356:{42, 139, 51},
;357:{93, 139, 32},
;358:{126, 139, 31},
;359:{158, 139, 25},
;360:};
;361:
;362:#define PROPB_GAP_WIDTH		4
;363:#define PROPB_SPACE_WIDTH	12
;364:#define PROPB_HEIGHT		36
;365:
;366:// bk001205 - code below duplicated in cgame/cg_drawtools.c
;367:// bk001205 - FIXME: does this belong in ui_shared.c?
;368:/*
;369:=================
;370:UI_DrawBannerString
;371:=================
;372:*/
;373:static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
;374:{
line 377
;375:	const char* s;
;376:	char	ch;
;377:    int prev_unicode = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 388
;378:	vec4_t	tempcolor;
;379:	float	ax;
;380:	float	ay;
;381:	float	aw;
;382:	float	ah;
;383:	float	frow;
;384:	float	fcol;
;385:	float	fwidth;
;386:	float	fheight;
;387:
;388:    int charw = 20;
ADDRLP4 56
CNSTI4 20
ASGNI4
line 389
;389:    int charh = 20;
ADDRLP4 60
CNSTI4 20
ASGNI4
line 391
;390:
;391:    float alignstate = 0;
ADDRLP4 48
CNSTF4 0
ASGNF4
line 394
;392:
;393:	// draw the colored text
;394:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 396
;395:
;396:	ax = x * uis.scale + uis.bias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ADDRGP4 uis+11456
INDIRF4
ADDF4
ASGNF4
line 397
;397:	ay = y * uis.scale;
ADDRLP4 40
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 398
;398:	ay += uis.menuscroll;
ADDRLP4 40
ADDRLP4 40
INDIRF4
ADDRGP4 uis+11468
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 399
;399:	aw = charw * uis.scale * 1;
ADDRLP4 12
CNSTF4 1065353216
ADDRLP4 56
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
MULF4
ASGNF4
line 400
;400:	ah = charh * uis.scale * 1;
ADDRLP4 44
CNSTF4 1065353216
ADDRLP4 60
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
MULF4
ASGNF4
line 402
;401:
;402:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $172
JUMPV
LABELV $171
line 404
;403:        while ( *s )
;404:        {
line 405
;405:           if ((*s == -48) || (*s == -47)) {
ADDRLP4 72
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 -48
EQI4 $176
ADDRLP4 72
INDIRI4
CNSTI4 -47
NEI4 $174
LABELV $176
line 406
;406:              ax = ax+aw*alignstate;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
line 407
;407:           }
LABELV $174
line 408
;408:           s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 409
;409:        }
LABELV $172
line 403
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $171
line 410
;410:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $178
JUMPV
LABELV $177
line 412
;411:	while ( *s )
;412:	{
line 413
;413:        if ( Q_IsColorString( s ) )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $180
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $180
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $180
ADDRLP4 76
INDIRI4
CNSTI4 48
LTI4 $180
ADDRLP4 76
INDIRI4
CNSTI4 57
GTI4 $180
line 414
;414:		{
line 415
;415:		    memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 4
LSHI4
ADDRGP4 g_color_table-768
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 416
;416:	        tempcolor[3] = color[3];
ADDRLP4 16+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 417
;417:	        trap_R_SetColor( tempcolor );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 418
;418:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 419
;419:			continue;
ADDRGP4 $178
JUMPV
LABELV $180
line 421
;420:		}
;421:		if (*s != ' ')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $184
line 422
;422:		{
line 423
;423:            ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 426
;424:            // unicode russian stuff support
;425:            //Com_Printf("UI_letter: is %d\n", *s);
;426:            if (ch < 0) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $186
line 427
;427:               if ((ch == -48) || (ch == -47)) {
ADDRLP4 80
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 -48
EQI4 $190
ADDRLP4 80
INDIRI4
CNSTI4 -47
NEI4 $188
LABELV $190
line 428
;428:                  prev_unicode = ch;
ADDRLP4 52
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
line 429
;429:                  s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 430
;430:                  continue;
ADDRGP4 $178
JUMPV
LABELV $188
line 432
;431:               }
;432:               if (ch >= -112) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -112
LTI4 $191
line 433
;433:                  if ((ch == -111) && (prev_unicode == -47)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -111
NEI4 $193
ADDRLP4 52
INDIRI4
CNSTI4 -47
NEI4 $193
line 434
;434:                     ch = ch - 13;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 13
SUBI4
CVII1 4
ASGNI1
line 435
;435:                  } else {
ADDRGP4 $192
JUMPV
LABELV $193
line 436
;436:                     ch = ch + 48;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 48
ADDI4
CVII1 4
ASGNI1
line 437
;437:                  }
line 438
;438:               } else {
ADDRGP4 $192
JUMPV
LABELV $191
line 439
;439:                  if ((ch == -127) && (prev_unicode == -48)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -127
NEI4 $195
ADDRLP4 52
INDIRI4
CNSTI4 -48
NEI4 $195
line 441
;440:                     // ch = ch +
;441:                  } else {
ADDRGP4 $196
JUMPV
LABELV $195
line 442
;442:                     ch = ch + 112; // +64 offset of damn unicode
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 112
ADDI4
CVII1 4
ASGNI1
line 443
;443:                  }
LABELV $196
line 444
;444:               }
LABELV $192
line 445
;445:		}
LABELV $186
line 446
;446:			frow = (ch>>4)*0.0625;
ADDRLP4 32
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 4
RSHI4
CVIF4 4
MULF4
ASGNF4
line 447
;447:			fcol = (ch&15)*0.0625;
ADDRLP4 36
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 15
BANDI4
CVIF4 4
MULF4
ASGNF4
line 448
;448:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1031798784
ASGNF4
ADDRLP4 36
INDIRF4
ADDRLP4 88
INDIRF4
ADDF4
ARGF4
ADDRLP4 32
INDIRF4
ADDRLP4 88
INDIRF4
ADDF4
ARGF4
ADDRGP4 uis+11412
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 449
;449:		}
LABELV $184
line 451
;450:
;451:		ax += aw;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 452
;452:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 453
;453:	}
LABELV $178
line 411
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $177
line 455
;454:
;455:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 456
;456:}
LABELV $164
endproc UI_DrawBannerString2 92 36
export UI_DrawBannerString
proc UI_DrawBannerString 44 16
line 458
;457:
;458:void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
line 465
;459:	const char *	s;
;460:	int				ch;
;461:	int				width;
;462:	vec4_t			drawcolor;
;463:
;464:	// find the width of the drawn text
;465:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 466
;466:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $199
line 467
;467:	while ( *s ) {
line 468
;468:		ch = *s;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 469
;469:		if ( ch == ' ' ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
NEI4 $202
line 470
;470:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 471
;471:		} else {
ADDRGP4 $203
JUMPV
LABELV $202
line 472
;472:                        if ((ch == -48) || (ch == -47)) {
ADDRLP4 4
INDIRI4
CNSTI4 -48
EQI4 $206
ADDRLP4 4
INDIRI4
CNSTI4 -47
NEI4 $204
LABELV $206
line 473
;473:                        } else {
ADDRGP4 $205
JUMPV
LABELV $204
line 474
;474:                               width += 20;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 475
;475:		}
LABELV $205
line 476
;476:		}
LABELV $203
line 477
;477:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 478
;478:	}
LABELV $200
line 467
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $199
line 479
;479:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 481
;480:
;481:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $208
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $210
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $211
ADDRGP4 $208
JUMPV
LABELV $210
line 483
;482:		case UI_CENTER:
;483:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 484
;484:			break;
ADDRGP4 $208
JUMPV
LABELV $211
line 487
;485:
;486:		case UI_RIGHT:
;487:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 488
;488:			break;
line 492
;489:
;490:		case UI_LEFT:
;491:		default:
;492:			break;
LABELV $208
line 495
;493:	}
;494:
;495:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $213
line 496
;496:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 497
;497:		drawcolor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 498
;498:		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 499
;499:	}
LABELV $213
line 501
;500:
;501:	UI_DrawBannerString2( x, y, str, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 502
;502:}
LABELV $198
endproc UI_DrawBannerString 44 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 24 4
line 505
;503:
;504:
;505:int UI_ProportionalStringWidth( const char* str ) {
line 511
;506:	const char *	s;
;507:	int				ch;
;508:	int				charWidth;
;509:	int				width;
;510:
;511:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 512
;512:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $219
line 513
;513:	while ( *s ) {
line 514
;514:                if ( Q_IsColorString( s ) )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $222
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $222
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $222
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $222
ADDRLP4 20
INDIRI4
CNSTI4 57
GTI4 $222
line 515
;515:		{
line 516
;516:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 517
;517:			continue;
ADDRGP4 $220
JUMPV
LABELV $222
line 519
;518:		}
;519:		ch = *s & 255;
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
ASGNI4
line 521
;520:		// charWidth = propMap[ch][2];
;521:                charWidth = 16;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 522
;522:		if ( charWidth != -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $224
line 523
;523:			width += charWidth;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 524
;524:			width += PROP_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRGP4 cl_propgapwidth+12
INDIRI4
ADDI4
ASGNI4
line 525
;525:		}
LABELV $224
line 526
;526:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 527
;527:	}
LABELV $220
line 513
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $219
line 529
;528:
;529:	width -= PROP_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRGP4 cl_propgapwidth+12
INDIRI4
SUBI4
ASGNI4
line 530
;530:	if(ifstrlenru(str)){
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 ifstrlenru
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $228
line 531
;531:		return width * 0.5;	
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
CVFI4 4
RETI4
ADDRGP4 $218
JUMPV
LABELV $228
line 532
;532:	} else {
line 533
;533:		return width;
ADDRLP4 8
INDIRI4
RETI4
LABELV $218
endproc UI_ProportionalStringWidth 24 4
proc UI_DrawProportionalString2 92 36
line 552
;534:	}
;535:}
;536:
;537:
;538:/*
;539:=================
;540:UI_DrawProportionalString2
;541:
;542:The use of float x,y allows greater positioning precision
;543:
;544:We can now "compensate" for alignment issues arising from the
;545:virtual 640x480 screen resolution
;546:
;547:Any function calling with int arguments will still exhibit previous
;548:behaviour
;549:=================
;550:*/
;551:static void UI_DrawProportionalString2( float x, float y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
;552:{
line 555
;553:	const char* s;
;554:	char	ch;
;555:    int prev_unicode = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 559
;556:	vec4_t	tempcolor;
;557:	float	ax;
;558:	float	ay;
;559:	float	aw = 0; // bk001204 - init
ADDRLP4 12
CNSTF4 0
ASGNF4
line 566
;560:	float	ah;
;561:	float	frow;
;562:	float	fcol;
;563:	float	fwidth;
;564:	float	fheight;
;565:
;566:    int charw = 16;
ADDRLP4 56
CNSTI4 16
ASGNI4
line 567
;567:    int charh = 16;
ADDRLP4 60
CNSTI4 16
ASGNI4
line 569
;568:
;569:    float alignstate = 0;
ADDRLP4 48
CNSTF4 0
ASGNF4
line 572
;570:
;571:	// draw the colored text
;572:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 574
;573:
;574:	ax = x * uis.scale + uis.bias;
ADDRLP4 8
ADDRFP4 0
INDIRF4
ADDRGP4 uis+11444
INDIRF4
MULF4
ADDRGP4 uis+11456
INDIRF4
ADDF4
ASGNF4
line 575
;575:	ay = y * uis.scale;
ADDRLP4 40
ADDRFP4 4
INDIRF4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 576
;576:	ay += uis.menuscroll;
ADDRLP4 40
ADDRLP4 40
INDIRF4
ADDRGP4 uis+11468
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 577
;577:	aw = charw * uis.scale * sizeScale;
ADDRLP4 12
ADDRLP4 56
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 578
;578:	ah = charh * uis.scale * sizeScale;
ADDRLP4 44
ADDRLP4 60
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 580
;579:
;580:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $238
JUMPV
LABELV $237
line 582
;581:	while ( *s )
;582:	{
line 583
;583:           if ((*s == -48) || (*s == -47)) {
ADDRLP4 72
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 -48
EQI4 $242
ADDRLP4 72
INDIRI4
CNSTI4 -47
NEI4 $240
LABELV $242
line 584
;584:              ax = ax+aw*alignstate;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
line 585
;585:           }
LABELV $240
line 586
;586:           s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 587
;587:        }
LABELV $238
line 581
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $237
line 588
;588:        s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $244
JUMPV
LABELV $243
line 590
;589:	while ( *s )
;590:	{
line 591
;591:         if ( Q_IsColorString( s ) )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $246
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $246
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $246
ADDRLP4 76
INDIRI4
CNSTI4 48
LTI4 $246
ADDRLP4 76
INDIRI4
CNSTI4 57
GTI4 $246
line 592
;592:		{
line 593
;593:		memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 4
LSHI4
ADDRGP4 g_color_table-768
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 594
;594:	    tempcolor[3] = color[3];
ADDRLP4 16+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 595
;595:	    trap_R_SetColor( tempcolor );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 596
;596:		s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 597
;597:		continue;
ADDRGP4 $244
JUMPV
LABELV $246
line 599
;598:		}
;599:		if (*s != ' ')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $250
line 600
;600:		{
line 601
;601:            ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 604
;602:            // unicode russian stuff support
;603:            //Com_Printf("UI_letter: is %d\n", *s);
;604:            if (ch < 0) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $252
line 605
;605:               if ((ch == -48) || (ch == -47)) {
ADDRLP4 80
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 -48
EQI4 $256
ADDRLP4 80
INDIRI4
CNSTI4 -47
NEI4 $254
LABELV $256
line 606
;606:                  prev_unicode = ch;
ADDRLP4 52
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
line 607
;607:                  s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 608
;608:                  continue;
ADDRGP4 $244
JUMPV
LABELV $254
line 610
;609:               }
;610:               if (ch >= -112) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -112
LTI4 $257
line 611
;611:                  if ((ch == -111) && (prev_unicode == -47)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -111
NEI4 $259
ADDRLP4 52
INDIRI4
CNSTI4 -47
NEI4 $259
line 612
;612:                     ch = ch - 13;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 13
SUBI4
CVII1 4
ASGNI1
line 613
;613:                  } else {
ADDRGP4 $258
JUMPV
LABELV $259
line 614
;614:                     ch = ch + 48;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 48
ADDI4
CVII1 4
ASGNI1
line 615
;615:                  }
line 616
;616:               } else {
ADDRGP4 $258
JUMPV
LABELV $257
line 617
;617:                  if ((ch == -127) && (prev_unicode == -48)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -127
NEI4 $261
ADDRLP4 52
INDIRI4
CNSTI4 -48
NEI4 $261
line 619
;618:                     // ch = ch +
;619:                  } else {
ADDRGP4 $262
JUMPV
LABELV $261
line 620
;620:                     ch = ch + 112; // +64 offset of damn unicode
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 112
ADDI4
CVII1 4
ASGNI1
line 621
;621:                  }
LABELV $262
line 622
;622:               }
LABELV $258
line 623
;623:		}
LABELV $252
line 624
;624:			frow = (ch>>4)*0.0625;
ADDRLP4 32
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 4
RSHI4
CVIF4 4
MULF4
ASGNF4
line 625
;625:			fcol = (ch&15)*0.0625;
ADDRLP4 36
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 15
BANDI4
CVIF4 4
MULF4
ASGNF4
line 626
;626:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1031798784
ASGNF4
ADDRLP4 36
INDIRF4
ADDRLP4 88
INDIRF4
ADDF4
ARGF4
ADDRLP4 32
INDIRF4
ADDRLP4 88
INDIRF4
ADDF4
ARGF4
ADDRGP4 uis+11412
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 627
;627:		}
LABELV $250
line 629
;628:
;629:		ax += aw;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 630
;630:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 631
;631:	}
LABELV $244
line 589
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $243
line 633
;632:
;633:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 634
;634:}
LABELV $230
endproc UI_DrawProportionalString2 92 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 641
;635:
;636:/*
;637:=================
;638:UI_ProportionalSizeScale
;639:=================
;640:*/
;641:float UI_ProportionalSizeScale( int style, float customsize ) {
line 642
;642:if(customsize == 0){
ADDRFP4 4
INDIRF4
CNSTF4 0
NEF4 $265
line 643
;643:	if(  style & UI_SMALLFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $267
line 644
;644:		return PROP_SMALL_SIZE_SCALE;
ADDRGP4 cl_propsmallsizescale+8
INDIRF4
RETF4
ADDRGP4 $264
JUMPV
LABELV $267
line 647
;645:	}
;646:
;647:	if (style & UI_MEDIUMFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $266
line 648
;648:		return PROP_MEDIUM_SIZE_SCALE;
CNSTF4 1063172178
RETF4
ADDRGP4 $264
JUMPV
line 650
;649:	}
;650:} else {
LABELV $265
line 651
;651:	return customsize;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $264
JUMPV
LABELV $266
line 653
;652:}
;653:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $264
endproc UI_ProportionalSizeScale 0 0
export UI_DrawScaledProportionalString
proc UI_DrawScaledProportionalString 40 24
line 671
;654:}
;655:
;656:
;657:/*
;658:=================
;659:UI_DrawScaledProportionalString
;660:
;661:The use of float x,y allows greater positioning precision
;662:
;663:We can now "compensate" for alignment issues arising from the
;664:virtual 640x480 screen resolution
;665:
;666:Any function calling with int arguments will still exhibit previous
;667:behaviour
;668:=================
;669:*/
;670:void UI_DrawScaledProportionalString( float x, float y, const char* str, int style, float sizeScale, vec4_t color )
;671:{
line 675
;672:	vec4_t	drawcolor;
;673:	int		width;
;674:
;675:	sizeScale *= UI_ProportionalSizeScale( style, 0 );
ADDRFP4 12
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 20
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 677
;676:
;677:	switch( style & UI_FORMATMASK ) {
ADDRLP4 24
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $274
ADDRLP4 24
INDIRI4
CNSTI4 1
EQI4 $276
ADDRLP4 24
INDIRI4
CNSTI4 2
EQI4 $277
ADDRGP4 $274
JUMPV
LABELV $276
line 679
;678:		case UI_CENTER:
;679:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRFP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 680
;680:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ASGNF4
line 681
;681:			break;
ADDRGP4 $274
JUMPV
LABELV $277
line 684
;682:
;683:		case UI_RIGHT:
;684:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRFP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 685
;685:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 686
;686:			break;
line 690
;687:
;688:		case UI_LEFT:
;689:		default:
;690:			break;
LABELV $274
line 693
;691:	}
;692:
;693:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $279
line 694
;694:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 32
INDIRF4
ASGNF4
line 695
;695:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 696
;696:		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, uis.charsetProp );
ADDRLP4 36
CNSTF4 1073741824
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11416
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 697
;697:	}
LABELV $279
line 699
;698:
;699:	if ( style & UI_INVERSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $285
line 700
;700:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
CNSTF4 1060320051
ADDRFP4 20
INDIRP4
INDIRF4
MULF4
ASGNF4
line 701
;701:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 702
;702:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
CNSTF4 1060320051
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 703
;703:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 704
;704:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11416
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 705
;705:		return;
ADDRGP4 $272
JUMPV
LABELV $285
line 708
;706:	}
;707:
;708:	if ( style & UI_PULSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $291
line 709
;709:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
CNSTF4 1060320051
ADDRFP4 20
INDIRP4
INDIRF4
MULF4
ASGNF4
line 710
;710:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 711
;711:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
CNSTF4 1060320051
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 712
;712:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 713
;713:		UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11416
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 715
;714:
;715:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 20
INDIRP4
INDIRF4
ASGNF4
line 716
;716:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 717
;717:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 718
;718:		drawcolor[3] = 0.5 + 0.5 * sin( uis.realtime / PULSE_DIVISOR );
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
CNSTF4 1056964608
ADDRLP4 32
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 719
;719:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetPropGlow );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11420
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 720
;720:		return;
ADDRGP4 $272
JUMPV
LABELV $291
line 723
;721:	}
;722:
;723:	UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11416
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 724
;724:}
LABELV $272
endproc UI_DrawScaledProportionalString 40 24
export UI_DrawProportionalString
proc UI_DrawProportionalString 0 24
line 733
;725:
;726:
;727:/*
;728:=================
;729:UI_DrawProportionalString
;730:=================
;731:*/
;732:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color )
;733:{
line 734
;734:	UI_DrawScaledProportionalString( x, y, str, style, 1.0, color );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawScaledProportionalString
CALLV
pop
line 735
;735:}
LABELV $303
endproc UI_DrawProportionalString 0 24
export UI_DrawProportionalString_AutoWrapped
proc UI_DrawProportionalString_AutoWrapped 1064 20
line 742
;736:
;737:/*
;738:=================
;739:UI_DrawProportionalString_Wrapped
;740:=================
;741:*/
;742:void UI_DrawProportionalString_AutoWrapped( int x, int y, int xmax, int ystep, const char* str, int style, vec4_t color ) {
line 749
;743:	int width;
;744:	char *s1,*s2,*s3;
;745:	char c_bcp;
;746:	char buf[1024];
;747:	float   sizeScale;
;748:
;749:	if (!str || str[0]=='\0')
ADDRLP4 1048
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $307
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $305
LABELV $307
line 750
;750:		return;
ADDRGP4 $304
JUMPV
LABELV $305
line 752
;751:	
;752:	sizeScale = UI_ProportionalSizeScale( style, 0 );
ADDRFP4 20
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 1052
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1052
INDIRF4
ASGNF4
line 754
;753:	
;754:	Q_strncpyz(buf, str, sizeof(buf));
ADDRLP4 24
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 755
;755:	s1 = s2 = s3 = buf;
ADDRLP4 0
ADDRLP4 24
ASGNP4
ADDRLP4 4
ADDRLP4 24
ASGNP4
ADDRLP4 12
ADDRLP4 24
ASGNP4
ADDRGP4 $309
JUMPV
LABELV $308
line 757
;756:
;757:	while (1) {
LABELV $311
line 758
;758:		do {
line 759
;759:			s3++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 760
;760:		} while (*s3!=' ' && *s3!='\0');
LABELV $312
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 32
EQI4 $314
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $311
LABELV $314
line 761
;761:		c_bcp = *s3;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 762
;762:		*s3 = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 763
;763:		width = UI_ProportionalStringWidth(s1) * sizeScale;
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1060
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 764
;764:		*s3 = c_bcp;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
line 765
;765:		if (width > xmax) {
ADDRLP4 16
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $315
line 766
;766:			if (s1==s2)
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $317
line 767
;767:			{
line 769
;768:				// fuck, don't have a clean cut, we'll overflow
;769:				s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 770
;770:			}
LABELV $317
line 771
;771:			*s2 = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 772
;772:			UI_DrawProportionalString(x, y, s1, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 773
;773:			y += ystep;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
ASGNI4
line 774
;774:			if (c_bcp == '\0')
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $319
line 775
;775:      {
line 780
;776:        // that was the last word
;777:        // we could start a new loop, but that wouldn't be much use
;778:        // even if the word is too long, we would overflow it (see above)
;779:        // so just print it now if needed
;780:        s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 781
;781:        if (*s2 != '\0') // if we are printing an overflowing line we have s2 == s3
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $310
line 782
;782:          UI_DrawProportionalString(x, y, s2, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 783
;783:				break; 
ADDRGP4 $310
JUMPV
LABELV $319
line 785
;784:      }
;785:			s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 786
;786:			s1 = s2;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
line 787
;787:			s3 = s2;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 788
;788:		}
ADDRGP4 $316
JUMPV
LABELV $315
line 790
;789:		else
;790:		{
line 791
;791:			s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 792
;792:			if (c_bcp == '\0') // we reached the end
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $323
line 793
;793:			{
line 794
;794:				UI_DrawProportionalString(x, y, s1, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 795
;795:				break;
ADDRGP4 $310
JUMPV
LABELV $323
line 797
;796:			}
;797:		}
LABELV $316
line 798
;798:	}
LABELV $309
line 757
ADDRGP4 $308
JUMPV
LABELV $310
line 799
;799:}
LABELV $304
endproc UI_DrawProportionalString_AutoWrapped 1064 20
proc UI_DrawString2 84 36
line 807
;800:
;801:/*
;802:=================
;803:UI_DrawString2
;804:=================
;805:*/
;806:static void UI_DrawString2(int x, int y, const char* str, vec4_t color, int charw, int charh, float width)
;807:{
line 810
;808:	const char* s;
;809:	char ch;
;810:	int forceColor = qfalse; //APSFIXME;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 811
;811:	int prev_unicode = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 819
;812:	vec4_t tempcolor;
;813:	float ax;
;814:	float ay;
;815:	float aw;
;816:	float ah;
;817:	float frow;
;818:	float fcol;
;819:	float alignstate = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 820
;820:	int char_count = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 823
;821:
;822:	// Align states for center and right alignment
;823:	if (charw < 0) {
ADDRFP4 16
INDIRI4
CNSTI4 0
GEI4 $326
line 824
;824:		charw = -charw;
ADDRFP4 16
ADDRFP4 16
INDIRI4
NEGI4
ASGNI4
line 825
;825:		alignstate = 0.5; // center_align
ADDRLP4 52
CNSTF4 1056964608
ASGNF4
line 826
;826:	}
LABELV $326
line 827
;827:	if (charh < 0) {
ADDRFP4 20
INDIRI4
CNSTI4 0
GEI4 $328
line 828
;828:		charh = -charh;
ADDRFP4 20
ADDRFP4 20
INDIRI4
NEGI4
ASGNI4
line 829
;829:		alignstate = 1; // right_align
ADDRLP4 52
CNSTF4 1065353216
ASGNF4
line 830
;830:	}
LABELV $328
line 833
;831:
;832:	// Set color for the text
;833:	trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 835
;834:
;835:	ax = x * uis.scale + uis.bias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ADDRGP4 uis+11456
INDIRF4
ADDF4
ASGNF4
line 836
;836:	ay = y * uis.scale;
ADDRLP4 44
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 837
;837:	ay += uis.menuscroll;
ADDRLP4 44
ADDRLP4 44
INDIRF4
ADDRGP4 uis+11468
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 838
;838:	aw = charw * uis.scale;
ADDRLP4 16
ADDRFP4 16
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 839
;839:	ah = charh * uis.scale;
ADDRLP4 48
ADDRFP4 20
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 841
;840:
;841:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $337
JUMPV
LABELV $336
line 843
;842:	while (*s)
;843:	{
line 844
;844:		if ((*s == -48) || (*s == -47)) {
ADDRLP4 64
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -48
EQI4 $341
ADDRLP4 64
INDIRI4
CNSTI4 -47
NEI4 $339
LABELV $341
line 845
;845:			ax = ax + aw * alignstate;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ASGNF4
line 846
;846:		}
LABELV $339
line 847
;847:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 848
;848:	}
LABELV $337
line 842
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $336
line 850
;849:
;850:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $343
JUMPV
LABELV $342
line 852
;851:	while (*s)
;852:	{
line 853
;853:		if (Q_IsColorString(s))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $345
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $345
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $345
ADDRLP4 68
INDIRI4
CNSTI4 48
LTI4 $345
ADDRLP4 68
INDIRI4
CNSTI4 57
GTI4 $345
line 854
;854:		{
line 855
;855:			memcpy(tempcolor, g_color_table[ColorIndex(s[1])], sizeof(tempcolor));
ADDRLP4 20
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 4
LSHI4
ADDRGP4 g_color_table-768
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 856
;856:			tempcolor[3] = color[3];
ADDRLP4 20+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 857
;857:			trap_R_SetColor(tempcolor);
ADDRLP4 20
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 858
;858:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 859
;859:			continue;
ADDRGP4 $343
JUMPV
LABELV $345
line 862
;860:		}
;861:
;862:		if (*s != ' ')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $349
line 863
;863:		{
line 864
;864:			ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 867
;865:
;866:			// Unicode Russian support
;867:			if (ch < 0) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $351
line 868
;868:				if ((ch == -48) || (ch == -47)) {
ADDRLP4 72
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 -48
EQI4 $355
ADDRLP4 72
INDIRI4
CNSTI4 -47
NEI4 $353
LABELV $355
line 869
;869:					prev_unicode = ch;
ADDRLP4 56
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
line 870
;870:					s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 871
;871:					continue;
ADDRGP4 $343
JUMPV
LABELV $353
line 873
;872:				}
;873:				if (ch >= -112) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -112
LTI4 $356
line 874
;874:					if ((ch == -111) && (prev_unicode == -47)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -111
NEI4 $358
ADDRLP4 56
INDIRI4
CNSTI4 -47
NEI4 $358
line 875
;875:						ch = ch - 13;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 13
SUBI4
CVII1 4
ASGNI1
line 876
;876:					} else {
ADDRGP4 $357
JUMPV
LABELV $358
line 877
;877:						ch = ch + 48;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 48
ADDI4
CVII1 4
ASGNI1
line 878
;878:					}
line 879
;879:				} else {
ADDRGP4 $357
JUMPV
LABELV $356
line 880
;880:					if ((ch == -127) && (prev_unicode == -48)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -127
NEI4 $360
ADDRLP4 56
INDIRI4
CNSTI4 -48
NEI4 $360
line 882
;881:						// ch = ch +
;882:					} else {
ADDRGP4 $361
JUMPV
LABELV $360
line 883
;883:						ch = ch + 112; // +64 offset of damn unicode
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 112
ADDI4
CVII1 4
ASGNI1
line 884
;884:					}
LABELV $361
line 885
;885:				}
LABELV $357
line 886
;886:			}
LABELV $351
line 888
;887:
;888:			frow = (ch >> 4) * 0.0625;
ADDRLP4 36
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 4
RSHI4
CVIF4 4
MULF4
ASGNF4
line 889
;889:			fcol = (ch & 15) * 0.0625;
ADDRLP4 40
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 15
BANDI4
CVIF4 4
MULF4
ASGNF4
line 890
;890:			trap_R_DrawStretchPic(ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset);
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 80
CNSTF4 1031798784
ASGNF4
ADDRLP4 40
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ARGF4
ADDRGP4 uis+11412
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 891
;891:		}
LABELV $349
line 893
;892:
;893:		ax += aw;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 894
;894:		char_count++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 896
;895:
;896:		if (char_count >= width) {
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRFP4 24
INDIRF4
LTF4 $363
line 897
;897:			ax = x * uis.scale + uis.bias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ADDRGP4 uis+11456
INDIRF4
ADDF4
ASGNF4
line 898
;898:			ay += ah + 2;
ADDRLP4 44
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
CNSTF4 1073741824
ADDF4
ADDF4
ASGNF4
line 899
;899:			char_count = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 900
;900:		}
LABELV $363
line 902
;901:
;902:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 903
;903:	}
LABELV $343
line 851
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $342
line 905
;904:
;905:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 906
;906:}
LABELV $325
endproc UI_DrawString2 84 36
export UI_RusString
proc UI_RusString 108 12
line 909
;907:
;908:int UI_RusString(const char* str)
;909:{
line 912
;910:	const char* s;
;911:	char	ch;
;912:	int forceColor = qfalse; //APSFIXME;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 913
;913:    int prev_unicode = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 921
;914:	vec4_t	tempcolor;
;915:	float	ax;
;916:	float	ay;
;917:	float	aw;
;918:	float	ah;
;919:	float	frow;
;920:	float	fcol;
;921:	int x = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 922
;922:	int y = 0;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 926
;923:	vec4_t color;
;924:	int charw;
;925:	int charh;
;926:	int rucount = 0;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 928
;927:
;928:    float alignstate = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 930
;929:	
;930:    if (charw < 0) {
ADDRLP4 64
INDIRI4
CNSTI4 0
GEI4 $368
line 931
;931:       charw = -charw;
ADDRLP4 64
ADDRLP4 64
INDIRI4
NEGI4
ASGNI4
line 932
;932:       alignstate = 0.5; //center_align
ADDRLP4 32
CNSTF4 1056964608
ASGNF4
line 933
;933:    }
LABELV $368
line 934
;934:    if (charh < 0) {
ADDRLP4 68
INDIRI4
CNSTI4 0
GEI4 $370
line 935
;935:       charh = -charh;
ADDRLP4 68
ADDRLP4 68
INDIRI4
NEGI4
ASGNI4
line 936
;936:       alignstate = 1; //right_align
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 937
;937:    }
LABELV $370
line 939
;938:	
;939:	ax = x * uis.scale + uis.bias;
ADDRLP4 8
ADDRLP4 80
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ADDRGP4 uis+11456
INDIRF4
ADDF4
ASGNF4
line 940
;940:	ay = y * uis.scale;
ADDRLP4 76
ADDRLP4 84
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 941
;941:	ay += uis.menuscroll;
ADDRLP4 76
ADDRLP4 76
INDIRF4
ADDRGP4 uis+11468
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 942
;942:	aw = charw * uis.scale;
ADDRLP4 12
ADDRLP4 64
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 943
;943:	ah = charh * uis.scale;
ADDRLP4 92
ADDRLP4 68
INDIRI4
CVIF4 4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 945
;944:
;945:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $379
JUMPV
LABELV $378
line 947
;946:	while ( *s )
;947:	{
line 948
;948:           if ((*s == -48) || (*s == -47)) {
ADDRLP4 96
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 -48
EQI4 $383
ADDRLP4 96
INDIRI4
CNSTI4 -47
NEI4 $381
LABELV $383
line 949
;949:              ax = ax+aw*alignstate;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
ASGNF4
line 950
;950:           }
LABELV $381
line 951
;951:           s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 952
;952:        }
LABELV $379
line 946
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $378
line 953
;953:        s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $385
JUMPV
LABELV $384
line 955
;954:	while ( *s )
;955:	{
line 956
;956:		if ( Q_IsColorString( s ) )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $387
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $387
ADDRLP4 100
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $387
ADDRLP4 100
INDIRI4
CNSTI4 48
LTI4 $387
ADDRLP4 100
INDIRI4
CNSTI4 57
GTI4 $387
line 957
;957:		{
line 958
;958:		memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 4
LSHI4
ADDRGP4 g_color_table-768
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 959
;959:		tempcolor[3] = color[3];
ADDRLP4 16+12
ADDRLP4 44+12
INDIRF4
ASGNF4
line 960
;960:		s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 961
;961:		}
LABELV $387
line 965
;962:
;963:
;964:
;965:		if (*s != ' ')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $392
line 966
;966:		{
line 967
;967:		ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 970
;968:            // unicode russian stuff support
;969:            //Com_Printf("UI_letter: is %d\n", *s);
;970:            if (ch < 0) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $394
line 971
;971:               if ((ch == -48) || (ch == -47)) {
ADDRLP4 104
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 -48
EQI4 $398
ADDRLP4 104
INDIRI4
CNSTI4 -47
NEI4 $396
LABELV $398
line 972
;972:                  prev_unicode = ch;
ADDRLP4 60
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
line 973
;973:                  s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 974
;974:                  continue;
ADDRGP4 $385
JUMPV
LABELV $396
line 976
;975:               }
;976:               if (ch >= -112) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -112
LTI4 $399
line 977
;977:                  if ((ch == -111) && (prev_unicode == -47)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -111
NEI4 $401
ADDRLP4 60
INDIRI4
CNSTI4 -47
NEI4 $401
line 978
;978:                     ch = ch - 13;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 13
SUBI4
CVII1 4
ASGNI1
line 979
;979:                  } else {
ADDRGP4 $400
JUMPV
LABELV $401
line 980
;980:                     ch = ch + 48;
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 48
ADDI4
CVII1 4
ASGNI1
line 981
;981:                  }
line 982
;982:               } else {
ADDRGP4 $400
JUMPV
LABELV $399
line 983
;983:                  if ((ch == -127) && (prev_unicode == -48)) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 -127
NEI4 $403
ADDRLP4 60
INDIRI4
CNSTI4 -48
NEI4 $403
line 985
;984:                     // ch = ch +
;985:                  } else {
ADDRGP4 $404
JUMPV
LABELV $403
line 986
;986:                     ch = ch + 112; // +64 offset of damn unicode
ADDRLP4 4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 112
ADDI4
CVII1 4
ASGNI1
line 987
;987:					 rucount += 1;
ADDRLP4 72
ADDRLP4 72
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 988
;988:                  }
LABELV $404
line 989
;989:               }
LABELV $400
line 990
;990:            }
LABELV $394
line 991
;991:			frow = (ch>>4)*0.0625;
ADDRLP4 36
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 4
RSHI4
CVIF4 4
MULF4
ASGNF4
line 992
;992:			fcol = (ch&15)*0.0625;
ADDRLP4 40
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 15
BANDI4
CVIF4 4
MULF4
ASGNF4
line 993
;993:		}
LABELV $392
line 995
;994:
;995:		ax += aw;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 996
;996:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 997
;997:	}
LABELV $385
line 954
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $384
line 998
;998:	return rucount;
ADDRLP4 72
INDIRI4
RETI4
LABELV $367
endproc UI_RusString 108 12
export UI_DrawString
proc UI_DrawString 84 28
line 1007
;999:}
;1000:
;1001:/*
;1002:=================
;1003:UI_DrawString
;1004:=================
;1005:*/
;1006:void UI_DrawString( int x, int y, const char* str, int style, vec4_t color )
;1007:{
line 1016
;1008:	int		len;
;1009:	int		charw;
;1010:	int		charh;
;1011:	vec4_t	newcolor;
;1012:	vec4_t	lowlight;
;1013:	float	*drawcolor;
;1014:	vec4_t	dropcolor;
;1015:
;1016:	if( !str ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $406
line 1017
;1017:		return;
ADDRGP4 $405
JUMPV
LABELV $406
line 1020
;1018:	}
;1019:
;1020:	if ((style & UI_BLINK) && ((uis.realtime/BLINK_DIVISOR) & 1))
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRFP4 12
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $408
ADDRGP4 uis+4
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $408
line 1021
;1021:		return;
ADDRGP4 $405
JUMPV
LABELV $408
line 1023
;1022:
;1023:	if (style & UI_SMALLFONT)
ADDRFP4 12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $411
line 1024
;1024:	{
line 1025
;1025:		charw =	SMALLCHAR_WIDTH;
ADDRLP4 0
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ASGNI4
line 1026
;1026:		charh =	SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ASGNI4
line 1027
;1027:	}
ADDRGP4 $412
JUMPV
LABELV $411
line 1028
;1028:	else if (style & UI_TINYFONT)
ADDRFP4 12
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $415
line 1029
;1029:	{
line 1030
;1030:		charw =	TINYCHAR_WIDTH;
ADDRLP4 0
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1031
;1031:		charh =	TINYCHAR_HEIGHT;
ADDRLP4 4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1032
;1032:	}
ADDRGP4 $416
JUMPV
LABELV $415
line 1033
;1033:	else if (style & UI_GIANTFONT)
ADDRFP4 12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $419
line 1034
;1034:	{
line 1035
;1035:		charw =	GIANTCHAR_WIDTH;
ADDRLP4 0
ADDRGP4 cl_giantcharwidth+12
INDIRI4
ASGNI4
line 1036
;1036:		charh =	GIANTCHAR_HEIGHT;
ADDRLP4 4
ADDRGP4 cl_giantcharheight+12
INDIRI4
ASGNI4
line 1037
;1037:	}
ADDRGP4 $420
JUMPV
LABELV $419
line 1039
;1038:	else
;1039:	{
line 1040
;1040:		charw =	BIGCHAR_WIDTH;
ADDRLP4 0
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ASGNI4
line 1041
;1041:		charh =	BIGCHAR_HEIGHT;
ADDRLP4 4
ADDRGP4 cl_bigcharheight+12
INDIRI4
ASGNI4
line 1042
;1042:	}
LABELV $420
LABELV $416
LABELV $412
line 1044
;1043:
;1044:	if (style & UI_PULSE)
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $425
line 1045
;1045:	{
line 1046
;1046:		lowlight[0] = 2.0*color[0]; 
ADDRLP4 8
CNSTF4 1073741824
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1047
;1047:		lowlight[1] = 2.0*color[1];
ADDRLP4 8+4
CNSTF4 1073741824
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 1048
;1048:		lowlight[2] = 2.0*color[2];
ADDRLP4 8+8
CNSTF4 1073741824
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1049
;1049:		lowlight[3] = 2.0*color[3];
ADDRLP4 8+12
CNSTF4 1073741824
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 1050
;1050:		UI_LerpColor(color,lowlight,newcolor,0.5+0.5*sin(uis.realtime/PULSE_DIVISOR));
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 44
ARGP4
CNSTF4 1056964608
ADDRLP4 68
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 UI_LerpColor
CALLV
pop
line 1051
;1051:		drawcolor = newcolor;
ADDRLP4 24
ADDRLP4 44
ASGNP4
line 1052
;1052:	}	
ADDRGP4 $426
JUMPV
LABELV $425
line 1054
;1053:	else
;1054:		drawcolor = color;
ADDRLP4 24
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $426
line 1056
;1055:
;1056:	switch (style & UI_FORMATMASK)
ADDRLP4 68
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
EQI4 $434
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $435
ADDRGP4 $432
JUMPV
line 1057
;1057:	{
LABELV $434
line 1060
;1058:		case UI_CENTER:
;1059:			// center justify at x
;1060:			len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 76
INDIRI4
ASGNI4
line 1061
;1061:			x   = x - len*charw/2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1062
;1062:                        charw = -charw; //Mix3r - sly way to transfer align to drawstring2
ADDRLP4 0
ADDRLP4 0
INDIRI4
NEGI4
ASGNI4
line 1063
;1063:			break;
ADDRGP4 $432
JUMPV
LABELV $435
line 1067
;1064:
;1065:		case UI_RIGHT:
;1066:			// right justify at x
;1067:			len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 80
INDIRI4
ASGNI4
line 1068
;1068:			x   = x - len*charw;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
SUBI4
ASGNI4
line 1069
;1069:                        charw = -charw; //Mix3r - sly way to transfer align to drawstring2
ADDRLP4 0
ADDRLP4 0
INDIRI4
NEGI4
ASGNI4
line 1070
;1070:                        charh = -charh;
ADDRLP4 4
ADDRLP4 4
INDIRI4
NEGI4
ASGNI4
line 1071
;1071:			break;
line 1075
;1072:
;1073:		default:
;1074:			// left justify at x
;1075:			break;
LABELV $432
line 1078
;1076:	}
;1077:
;1078:	if ( style & UI_DROPSHADOW )
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $436
line 1079
;1079:	{
line 1080
;1080:		dropcolor[0] = dropcolor[1] = dropcolor[2] = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 28+8
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 76
INDIRF4
ASGNF4
line 1081
;1081:		dropcolor[3] = drawcolor[3];
ADDRLP4 28+12
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1082
;1082:		UI_DrawString2(x+2,y+2,str,dropcolor,charw,charh,512);
ADDRLP4 80
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTF4 1140850688
ARGF4
ADDRGP4 UI_DrawString2
CALLV
pop
line 1083
;1083:	}
LABELV $436
line 1085
;1084:
;1085:	UI_DrawString2(x,y,str,drawcolor,charw,charh,512);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTF4 1140850688
ARGF4
ADDRGP4 UI_DrawString2
CALLV
pop
line 1086
;1086:}
LABELV $405
endproc UI_DrawString 84 28
export UI_DrawStringCustom
proc UI_DrawStringCustom 84 28
line 1094
;1087:
;1088:/*
;1089:=================
;1090:UI_DrawStringCustom
;1091:=================
;1092:*/
;1093:void UI_DrawStringCustom( int x, int y, const char* str, int style, vec4_t color, float csize, float width )
;1094:{
line 1103
;1095:	int		len;
;1096:	int		charw;
;1097:	int		charh;
;1098:	vec4_t	newcolor;
;1099:	vec4_t	lowlight;
;1100:	float	*drawcolor;
;1101:	vec4_t	dropcolor;
;1102:
;1103:	if( !str ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $442
line 1104
;1104:		return;
ADDRGP4 $441
JUMPV
LABELV $442
line 1107
;1105:	}
;1106:
;1107:	if ((style & UI_BLINK) && ((uis.realtime/BLINK_DIVISOR) & 1))
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRFP4 12
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $444
ADDRGP4 uis+4
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $444
line 1108
;1108:		return;
ADDRGP4 $441
JUMPV
LABELV $444
line 1110
;1109:
;1110:if(csize == 0){
ADDRFP4 20
INDIRF4
CNSTF4 0
NEF4 $447
line 1111
;1111:	if (style & UI_SMALLFONT)
ADDRFP4 12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $449
line 1112
;1112:	{
line 1113
;1113:		charw =	SMALLCHAR_WIDTH;
ADDRLP4 0
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ASGNI4
line 1114
;1114:		charh =	SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ASGNI4
line 1115
;1115:	}
ADDRGP4 $448
JUMPV
LABELV $449
line 1116
;1116:	else if (style & UI_TINYFONT)
ADDRFP4 12
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $453
line 1117
;1117:	{
line 1118
;1118:		charw =	TINYCHAR_WIDTH;
ADDRLP4 0
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1119
;1119:		charh =	TINYCHAR_HEIGHT;
ADDRLP4 4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1120
;1120:	}
ADDRGP4 $448
JUMPV
LABELV $453
line 1121
;1121:	else if (style & UI_GIANTFONT)
ADDRFP4 12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $457
line 1122
;1122:	{
line 1123
;1123:		charw =	GIANTCHAR_WIDTH;
ADDRLP4 0
ADDRGP4 cl_giantcharwidth+12
INDIRI4
ASGNI4
line 1124
;1124:		charh =	GIANTCHAR_HEIGHT;
ADDRLP4 4
ADDRGP4 cl_giantcharheight+12
INDIRI4
ASGNI4
line 1125
;1125:	}
ADDRGP4 $448
JUMPV
LABELV $457
line 1127
;1126:	else
;1127:	{
line 1128
;1128:		charw =	BIGCHAR_WIDTH;
ADDRLP4 0
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ASGNI4
line 1129
;1129:		charh =	BIGCHAR_HEIGHT;
ADDRLP4 4
ADDRGP4 cl_bigcharheight+12
INDIRI4
ASGNI4
line 1130
;1130:	}
line 1131
;1131:} else {
ADDRGP4 $448
JUMPV
LABELV $447
line 1132
;1132:		charw =	BIGCHAR_WIDTH*csize;
ADDRLP4 0
ADDRGP4 cl_bigcharwidth+12
INDIRI4
CVIF4 4
ADDRFP4 20
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1133
;1133:		charh =	BIGCHAR_HEIGHT*csize;	
ADDRLP4 4
ADDRGP4 cl_bigcharheight+12
INDIRI4
CVIF4 4
ADDRFP4 20
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1134
;1134:}
LABELV $448
line 1136
;1135:
;1136:	if (style & UI_PULSE)
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $465
line 1137
;1137:	{
line 1138
;1138:		lowlight[0] = 2.0*color[0]; 
ADDRLP4 8
CNSTF4 1073741824
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1139
;1139:		lowlight[1] = 2.0*color[1];
ADDRLP4 8+4
CNSTF4 1073741824
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 1140
;1140:		lowlight[2] = 2.0*color[2];
ADDRLP4 8+8
CNSTF4 1073741824
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1141
;1141:		lowlight[3] = 2.0*color[3];
ADDRLP4 8+12
CNSTF4 1073741824
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 1142
;1142:		UI_LerpColor(color,lowlight,newcolor,0.5+0.5*sin(uis.realtime/PULSE_DIVISOR));
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 44
ARGP4
CNSTF4 1056964608
ADDRLP4 68
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 UI_LerpColor
CALLV
pop
line 1143
;1143:		drawcolor = newcolor;
ADDRLP4 24
ADDRLP4 44
ASGNP4
line 1144
;1144:	}	
ADDRGP4 $466
JUMPV
LABELV $465
line 1146
;1145:	else
;1146:		drawcolor = color;
ADDRLP4 24
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $466
line 1148
;1147:
;1148:	switch (style & UI_FORMATMASK)
ADDRLP4 68
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
EQI4 $474
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $475
ADDRGP4 $472
JUMPV
line 1149
;1149:	{
LABELV $474
line 1152
;1150:		case UI_CENTER:
;1151:			// center justify at x
;1152:			len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 76
INDIRI4
ASGNI4
line 1153
;1153:			x   = x - len*charw/2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1154
;1154:                        charw = -charw; //Mix3r - sly way to transfer align to drawstring2
ADDRLP4 0
ADDRLP4 0
INDIRI4
NEGI4
ASGNI4
line 1155
;1155:			break;
ADDRGP4 $472
JUMPV
LABELV $475
line 1159
;1156:
;1157:		case UI_RIGHT:
;1158:			// right justify at x
;1159:			len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 80
INDIRI4
ASGNI4
line 1160
;1160:			x   = x - len*charw;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
SUBI4
ASGNI4
line 1161
;1161:                        charw = -charw; //Mix3r - sly way to transfer align to drawstring2
ADDRLP4 0
ADDRLP4 0
INDIRI4
NEGI4
ASGNI4
line 1162
;1162:                        charh = -charh;
ADDRLP4 4
ADDRLP4 4
INDIRI4
NEGI4
ASGNI4
line 1163
;1163:			break;
line 1167
;1164:
;1165:		default:
;1166:			// left justify at x
;1167:			break;
LABELV $472
line 1170
;1168:	}
;1169:
;1170:	if ( style & UI_DROPSHADOW )
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $476
line 1171
;1171:	{
line 1172
;1172:		dropcolor[0] = dropcolor[1] = dropcolor[2] = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 28+8
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 76
INDIRF4
ASGNF4
line 1173
;1173:		dropcolor[3] = drawcolor[3];
ADDRLP4 28+12
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1174
;1174:		UI_DrawString2(x+2,y+2,str,dropcolor,charw,charh,width);
ADDRLP4 80
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRF4
ARGF4
ADDRGP4 UI_DrawString2
CALLV
pop
line 1175
;1175:	}
LABELV $476
line 1177
;1176:
;1177:	UI_DrawString2(x,y,str,drawcolor,charw,charh,width);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRF4
ARGF4
ADDRGP4 UI_DrawString2
CALLV
pop
line 1178
;1178:}
LABELV $441
endproc UI_DrawStringCustom 84 28
export UI_DrawChar
proc UI_DrawChar 2 20
line 1186
;1179:
;1180:/*
;1181:=================
;1182:UI_DrawChar
;1183:=================
;1184:*/
;1185:void UI_DrawChar( int x, int y, int ch, int style, vec4_t color )
;1186:{
line 1189
;1187:	char	buff[2];
;1188:
;1189:	buff[0] = ch;
ADDRLP4 0
ADDRFP4 8
INDIRI4
CVII1 4
ASGNI1
line 1190
;1190:	buff[1] = '\0';
ADDRLP4 0+1
CNSTI1 0
ASGNI1
line 1192
;1191:
;1192:	UI_DrawString( x, y, buff, style, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1193
;1193:}
LABELV $481
endproc UI_DrawChar 2 20
export UI_DrawCharCustom
proc UI_DrawCharCustom 2 28
line 1201
;1194:
;1195:/*
;1196:=================
;1197:UI_DrawCharCustom
;1198:=================
;1199:*/
;1200:void UI_DrawCharCustom( int x, int y, int ch, int style, vec4_t color, float csize )
;1201:{
line 1204
;1202:	char	buff[2];
;1203:
;1204:	buff[0] = ch;
ADDRLP4 0
ADDRFP4 8
INDIRI4
CVII1 4
ASGNI1
line 1205
;1205:	buff[1] = '\0';
ADDRLP4 0+1
CNSTI1 0
ASGNI1
line 1207
;1206:
;1207:	UI_DrawStringCustom( x, y, buff, style, color, csize, 512 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRF4
ARGF4
CNSTF4 1140850688
ARGF4
ADDRGP4 UI_DrawStringCustom
CALLV
pop
line 1208
;1208:}
LABELV $483
endproc UI_DrawCharCustom 2 28
export UI_IsFullscreen
proc UI_IsFullscreen 4 0
line 1210
;1209:
;1210:qboolean UI_IsFullscreen( void ) {
line 1211
;1211:	if ( uis.activemenu && ( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
ADDRGP4 uis+24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $486
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $486
line 1212
;1212:		if(!uis.onmap){
ADDRGP4 uis+11500
INDIRI4
CNSTI4 0
NEI4 $489
line 1213
;1213:		return uis.activemenu->fullscreen;
ADDRGP4 uis+24
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
RETI4
ADDRGP4 $485
JUMPV
LABELV $489
line 1214
;1214:		} else {
line 1215
;1215:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $486
line 1219
;1216:		}
;1217:	}
;1218:
;1219:	return qfalse;
CNSTI4 0
RETI4
LABELV $485
endproc UI_IsFullscreen 4 0
proc NeedCDAction 0 8
line 1222
;1220:}
;1221:
;1222:static void NeedCDAction( qboolean result ) {
line 1223
;1223:	if ( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $494
line 1224
;1224:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $496
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1225
;1225:	}
LABELV $494
line 1226
;1226:}
LABELV $493
endproc NeedCDAction 0 8
proc NeedCDKeyAction 0 8
line 1228
;1227:
;1228:static void NeedCDKeyAction( qboolean result ) {
line 1229
;1229:	if ( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $498
line 1230
;1230:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $496
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1231
;1231:	}
LABELV $498
line 1232
;1232:}
LABELV $497
endproc NeedCDKeyAction 0 8
export UI_SetActiveMenu
proc UI_SetActiveMenu 24 12
line 1234
;1233:
;1234:void UI_SetActiveMenu( uiMenuCommand_t menu ) {
line 1237
;1235:	// this should be the ONLY way the menu system is brought up
;1236:	// enusure minumum menu data is cached
;1237:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 1239
;1238:
;1239:	switch ( menu ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $501
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $501
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $527
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $527
address $504
address $505
address $523
address $519
address $521
address $525
address $525
code
LABELV $504
line 1241
;1240:	case UIMENU_NONE:
;1241:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 1242
;1242:		return;
ADDRGP4 $500
JUMPV
LABELV $505
line 1244
;1243:	case UIMENU_MAIN:
;1244:		UI_ScreenOffset();
ADDRGP4 UI_ScreenOffset
CALLV
pop
line 1245
;1245:		if(!trap_Cvar_VariableValue("cl_32bit")){
ADDRGP4 $508
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $506
line 1246
;1246:		if(strlen(ui_3dmap.string) <= 1){
ADDRGP4 ui_3dmap+16
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
GTI4 $509
line 1247
;1247:		UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 1248
;1248:		UI_CreditMenu(1);
CNSTI4 1
ARGI4
ADDRGP4 UI_CreditMenu
CALLV
pop
line 1249
;1249:		}
LABELV $509
line 1250
;1250:		if(strlen(ui_3dmap.string)){
ADDRGP4 ui_3dmap+16
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $512
line 1251
;1251:		trap_Cmd_ExecuteText( EXEC_APPEND, va("set sv_maxclients 1; map %s\n", ui_3dmap.string) );
ADDRGP4 $515
ARGP4
ADDRGP4 ui_3dmap+16
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1252
;1252:		}
LABELV $512
line 1253
;1253:		}
LABELV $506
line 1254
;1254:		if(trap_Cvar_VariableValue("cl_32bit")){
ADDRGP4 $508
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 0
EQF4 $500
line 1255
;1255:		UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 1256
;1256:		UI_CreditMenu(1);
CNSTI4 1
ARGI4
ADDRGP4 UI_CreditMenu
CALLV
pop
line 1257
;1257:		}
line 1258
;1258:		return;
ADDRGP4 $500
JUMPV
LABELV $519
line 1260
;1259:	case UIMENU_NEED_CD:
;1260:		UI_ConfirmMenu( "Insert the CD", 0, NeedCDAction );
ADDRGP4 $520
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 1261
;1261:		return;
ADDRGP4 $500
JUMPV
LABELV $521
line 1263
;1262:	case UIMENU_BAD_CD_KEY:
;1263:		UI_ConfirmMenu( "Bad CD Key", 0, NeedCDKeyAction );
ADDRGP4 $522
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDKeyAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 1264
;1264:		return;
ADDRGP4 $500
JUMPV
LABELV $523
line 1271
;1265:	case UIMENU_INGAME:
;1266:		/*
;1267:		//GRank
;1268:		UI_RankingsMenu();
;1269:		return;
;1270:		*/
;1271:		trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $153
ARGP4
ADDRGP4 $524
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1272
;1272:		UI_InGameMenu();
ADDRGP4 UI_InGameMenu
CALLV
pop
line 1273
;1273:		return;
ADDRGP4 $500
JUMPV
LABELV $525
LABELV $501
line 1280
;1274:
;1275:	// bk001204
;1276:	case UIMENU_TEAM:
;1277:	case UIMENU_POSTGAME:
;1278:	default:
;1279:#ifndef NDEBUG
;1280:	  Com_Printf("UI_SetActiveMenu: bad enum %d\n", menu );
ADDRGP4 $526
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1282
;1281:#endif
;1282:	break;
LABELV $502
line 1284
;1283:	}
;1284:}
LABELV $500
endproc UI_SetActiveMenu 24 12
export UI_KeyEvent
proc UI_KeyEvent 16 8
line 1291
;1285:
;1286:/*
;1287:=================
;1288:UI_KeyEvent
;1289:=================
;1290:*/
;1291:void UI_KeyEvent( int key, int down ) {
line 1294
;1292:	sfxHandle_t		s;
;1293:
;1294:	if (!uis.activemenu) {
ADDRGP4 uis+24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $529
line 1295
;1295:		return;
ADDRGP4 $528
JUMPV
LABELV $529
line 1298
;1296:	}
;1297:
;1298:	if (!down) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $532
line 1299
;1299:		return;
ADDRGP4 $528
JUMPV
LABELV $532
line 1302
;1300:	}
;1301:
;1302:	if (uis.activemenu->key)
ADDRGP4 uis+24
INDIRP4
CNSTI4 1040
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $534
line 1303
;1303:		s = uis.activemenu->key( key );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 uis+24
INDIRP4
CNSTI4 1040
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $535
JUMPV
LABELV $534
line 1305
;1304:	else
;1305:		s = Menu_DefaultKey( uis.activemenu, key );
ADDRGP4 uis+24
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $535
line 1307
;1306:
;1307:	if ((s > 0) && (s != menu_null_sound))
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $539
ADDRLP4 0
INDIRI4
ADDRGP4 menu_null_sound
INDIRI4
EQI4 $539
line 1308
;1308:		trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $539
line 1309
;1309:}
LABELV $528
endproc UI_KeyEvent 16 8
export UI_MouseEvent
proc UI_MouseEvent 24 8
line 1317
;1310:
;1311:/*
;1312:=================
;1313:UI_MouseEvent
;1314:=================
;1315:*/
;1316:void UI_MouseEvent( int dx, int dy )
;1317:{
line 1323
;1318:	int				i;
;1319:	float scrx;
;1320:	float scry;
;1321:	menucommon_s*	m;
;1322:
;1323:	if (!uis.activemenu)
ADDRGP4 uis+24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $542
line 1324
;1324:		return;
ADDRGP4 $541
JUMPV
LABELV $542
line 1326
;1325:	
;1326:	trap_GetGlconfig( &uis.glconfig );
ADDRGP4 uis+60
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1328
;1327:	
;1328:	scrx = uis.glconfig.vidWidth;
ADDRLP4 8
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
ASGNF4
line 1329
;1329:	scry = uis.glconfig.vidHeight;
ADDRLP4 12
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
ASGNF4
line 1332
;1330:
;1331:	// update mouse screen position
;1332:	if(uis.activemenu->native > 0){
ADDRGP4 uis+24
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
CNSTI4 0
LEI4 $550
line 1333
;1333:	uis.cursorx += dx * sensitivitymenu.value;
ADDRLP4 16
ADDRGP4 uis+8
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 sensitivitymenu+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1334
;1334:	if (uis.cursorx < 0)
ADDRGP4 uis+8
INDIRI4
CNSTI4 0
GEI4 $555
line 1335
;1335:		uis.cursorx = 0;
ADDRGP4 uis+8
CNSTI4 0
ASGNI4
ADDRGP4 $556
JUMPV
LABELV $555
line 1336
;1336:	else if (uis.cursorx > uis.glconfig.vidWidth)
ADDRGP4 uis+8
INDIRI4
ADDRGP4 uis+60+11304
INDIRI4
LEI4 $559
line 1337
;1337:		uis.cursorx = uis.glconfig.vidWidth;
ADDRGP4 uis+8
ADDRGP4 uis+60+11304
INDIRI4
ASGNI4
LABELV $559
LABELV $556
line 1339
;1338:
;1339:	uis.cursory += dy * sensitivitymenu.value;
ADDRLP4 20
ADDRGP4 uis+12
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 sensitivitymenu+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1340
;1340:	if (uis.cursory < 0+uis.activemenu->uplimitscroll)
ADDRGP4 uis+12
INDIRI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 1060
ADDP4
INDIRI4
GEI4 $569
line 1341
;1341:		uis.cursory = 0+uis.activemenu->uplimitscroll;
ADDRGP4 uis+12
ADDRGP4 uis+24
INDIRP4
CNSTI4 1060
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $551
JUMPV
LABELV $569
line 1342
;1342:	else if (uis.cursory > uis.glconfig.vidHeight+uis.activemenu->downlimitscroll)
ADDRGP4 uis+12
INDIRI4
ADDRGP4 uis+60+11308
INDIRI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 1064
ADDP4
INDIRI4
ADDI4
LEI4 $551
line 1343
;1343:		uis.cursory = uis.glconfig.vidHeight+uis.activemenu->downlimitscroll;
ADDRGP4 uis+12
ADDRGP4 uis+60+11308
INDIRI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 1064
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1344
;1344:	} else {
ADDRGP4 $551
JUMPV
LABELV $550
line 1345
;1345:		uis.cursorx += dx * sensitivitymenu.value;
ADDRLP4 16
ADDRGP4 uis+8
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 sensitivitymenu+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1346
;1346:	if (uis.cursorx < 0-uis.wideoffset)
ADDRGP4 uis+8
INDIRI4
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
GEI4 $587
line 1347
;1347:		uis.cursorx = 0-uis.wideoffset;
ADDRGP4 uis+8
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $588
JUMPV
LABELV $587
line 1348
;1348:	else if (uis.cursorx > 640+uis.wideoffset)
ADDRGP4 uis+8
INDIRI4
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
LEI4 $593
line 1349
;1349:		uis.cursorx = 640+uis.wideoffset;
ADDRGP4 uis+8
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
LABELV $593
LABELV $588
line 1351
;1350:
;1351:	uis.cursory += dy * sensitivitymenu.value;
ADDRLP4 20
ADDRGP4 uis+12
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 sensitivitymenu+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1352
;1352:	if (uis.cursory < 0+uis.activemenu->uplimitscroll)
ADDRGP4 uis+12
INDIRI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 1060
ADDP4
INDIRI4
GEI4 $601
line 1353
;1353:		uis.cursory = 0+uis.activemenu->uplimitscroll;
ADDRGP4 uis+12
ADDRGP4 uis+24
INDIRP4
CNSTI4 1060
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $602
JUMPV
LABELV $601
line 1354
;1354:	else if (uis.cursory > 480+uis.activemenu->downlimitscroll)
ADDRGP4 uis+12
INDIRI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 1064
ADDP4
INDIRI4
CNSTI4 480
ADDI4
LEI4 $607
line 1355
;1355:		uis.cursory = 480+uis.activemenu->downlimitscroll;	
ADDRGP4 uis+12
ADDRGP4 uis+24
INDIRP4
CNSTI4 1064
ADDP4
INDIRI4
CNSTI4 480
ADDI4
ASGNI4
LABELV $607
LABELV $602
line 1356
;1356:	}
LABELV $551
line 1359
;1357:
;1358:	// region test the active menu items
;1359:	for (i=0; i<uis.activemenu->nitems; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $616
JUMPV
LABELV $613
line 1360
;1360:	{
line 1361
;1361:		m = (menucommon_s*)uis.activemenu->items[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 1363
;1362:
;1363:		if (m->flags & (QMF_GRAYED|QMF_INACTIVE))
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 24576
BANDU4
CNSTU4 0
EQU4 $619
line 1364
;1364:			continue;
ADDRGP4 $614
JUMPV
LABELV $619
line 1366
;1365:
;1366:		if ((uis.cursorx < m->left) ||
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LTI4 $629
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
GTI4 $629
ADDRGP4 uis+12
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
LTI4 $629
ADDRGP4 uis+12
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
LEI4 $621
LABELV $629
line 1370
;1367:			(uis.cursorx > m->right) ||
;1368:			(uis.cursory < m->top) ||
;1369:			(uis.cursory > m->bottom))
;1370:		{
line 1372
;1371:			// cursor out of item bounds
;1372:			continue;
ADDRGP4 $614
JUMPV
LABELV $621
line 1376
;1373:		}
;1374:
;1375:		// set focus to item at cursor
;1376:		if (uis.activemenu->cursor != i)
ADDRGP4 uis+24
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $630
line 1377
;1377:		{
line 1378
;1378:			Menu_SetCursor( uis.activemenu, i );
ADDRGP4 uis+24
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 1379
;1379:			((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor_prev]))->flags &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 20
ADDRGP4 uis+24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -513
CVIU4 4
BANDU4
ASGNU4
line 1381
;1380:
;1381:			if ( !(((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags & QMF_SILENT ) ) {
ADDRGP4 uis+24
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 1048576
BANDU4
CNSTU4 0
NEU4 $636
line 1382
;1382:				trap_S_StartLocalSound( menu_move_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_move_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1383
;1383:			}
LABELV $636
line 1384
;1384:		}
LABELV $630
line 1386
;1385:
;1386:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags |= QMF_HASMOUSEFOCUS;
ADDRLP4 20
ADDRGP4 uis+24
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 512
BORU4
ASGNU4
line 1387
;1387:		return;
ADDRGP4 $541
JUMPV
LABELV $614
line 1359
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $616
ADDRLP4 4
INDIRI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $613
line 1390
;1388:	}  
;1389:
;1390:	if (uis.activemenu->nitems > 0) {
ADDRGP4 uis+24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
LEI4 $642
line 1392
;1391:		// out of any region
;1392:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 16
ADDRGP4 uis+24
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -513
CVIU4 4
BANDU4
ASGNU4
line 1393
;1393:	}
LABELV $642
line 1394
;1394:}
LABELV $541
endproc UI_MouseEvent 24 8
bss
align 1
LABELV $648
skip 1024
export UI_Argv
code
proc UI_Argv 0 12
line 1396
;1395:
;1396:char *UI_Argv( int arg ) {
line 1399
;1397:	static char	buffer[MAX_STRING_CHARS];
;1398:
;1399:	trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $648
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1401
;1400:
;1401:	return buffer;
ADDRGP4 $648
RETP4
LABELV $647
endproc UI_Argv 0 12
export UI_Cache_f
proc UI_Cache_f 0 0
line 1409
;1402:}
;1403:
;1404:/*
;1405:=================
;1406:UI_Cache
;1407:=================
;1408:*/
;1409:void UI_Cache_f( void ) {
line 1410
;1410:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 1411
;1411:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 1412
;1412:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 1413
;1413:	PlayerModel_Cache();
ADDRGP4 PlayerModel_Cache
CALLV
pop
line 1414
;1414:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 1415
;1415:	Controls_Cache();
ADDRGP4 Controls_Cache
CALLV
pop
line 1416
;1416:	Demos_Cache();
ADDRGP4 Demos_Cache
CALLV
pop
line 1417
;1417:	UI_CinematicsMenu_Cache();
ADDRGP4 UI_CinematicsMenu_Cache
CALLV
pop
line 1418
;1418:	Preferences_Cache();
ADDRGP4 Preferences_Cache
CALLV
pop
line 1419
;1419:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 1420
;1420:	SpecifyServer_Cache();
ADDRGP4 SpecifyServer_Cache
CALLV
pop
line 1421
;1421:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1422
;1422:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 1423
;1423:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 1424
;1424:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 1425
;1425:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 1426
;1426:	UI_DisplayOptionsMenu_Cache();
ADDRGP4 UI_DisplayOptionsMenu_Cache
CALLV
pop
line 1427
;1427:	UI_SoundOptionsMenu_Cache();
ADDRGP4 UI_SoundOptionsMenu_Cache
CALLV
pop
line 1428
;1428:	UI_NetworkOptionsMenu_Cache();
ADDRGP4 UI_NetworkOptionsMenu_Cache
CALLV
pop
line 1429
;1429:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 1430
;1430:	UI_SPSkillMenu_Cache();
ADDRGP4 UI_SPSkillMenu_Cache
CALLV
pop
line 1431
;1431:	UI_SPPostgameMenu_Cache();
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
line 1432
;1432:	TeamMain_Cache();
ADDRGP4 TeamMain_Cache
CALLV
pop
line 1433
;1433:	UI_AddBots_Cache();
ADDRGP4 UI_AddBots_Cache
CALLV
pop
line 1434
;1434:	UI_RemoveBots_Cache();
ADDRGP4 UI_RemoveBots_Cache
CALLV
pop
line 1435
;1435:	UI_SetupMenu_Cache();
ADDRGP4 UI_SetupMenu_Cache
CALLV
pop
line 1436
;1436:	UI_BotSelect_Cache();
ADDRGP4 UI_BotSelect_Cache
CALLV
pop
line 1437
;1437:	UI_CDKeyMenu_Cache();
ADDRGP4 UI_CDKeyMenu_Cache
CALLV
pop
line 1438
;1438:	UI_ModsMenu_Cache();
ADDRGP4 UI_ModsMenu_Cache
CALLV
pop
line 1439
;1439:}
LABELV $649
endproc UI_Cache_f 0 0
bss
align 1
LABELV $651
skip 1024
export UI_ConcatArgs
code
proc UI_ConcatArgs 1048 12
line 1447
;1440:
;1441:
;1442:/*
;1443:==================
;1444:UI_ConcatArgs
;1445:==================
;1446:*/
;1447:char	*UI_ConcatArgs( int start ) {
line 1453
;1448:	int		i, c, tlen;
;1449:	static char	line[MAX_STRING_CHARS];
;1450:	int		len;
;1451:	char	arg[MAX_STRING_CHARS];
;1452:
;1453:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1454
;1454:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 1455
;1455:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $655
JUMPV
LABELV $652
line 1456
;1456:		trap_Argv( i, arg, sizeof( arg ) );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1457
;1457:		tlen = strlen( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1044
INDIRI4
ASGNI4
line 1458
;1458:		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $656
line 1459
;1459:			break;
ADDRGP4 $654
JUMPV
LABELV $656
line 1461
;1460:		}
;1461:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $651
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1462
;1462:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1463
;1463:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $658
line 1464
;1464:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $651
ADDP4
CNSTI1 32
ASGNI1
line 1465
;1465:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1466
;1466:		}
LABELV $658
line 1467
;1467:	}
LABELV $653
line 1455
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $655
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $652
LABELV $654
line 1469
;1468:
;1469:	line[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $651
ADDP4
CNSTI1 0
ASGNI1
line 1471
;1470:
;1471:	return line;
ADDRGP4 $651
RETP4
LABELV $650
endproc UI_ConcatArgs 1048 12
export UI_ArenaScriptAutoInt
proc UI_ArenaScriptAutoInt 8 4
line 1481
;1472:}
;1473:
;1474:
;1475:/*
;1476:==================
;1477:UI_ArenaScriptAutoInt
;1478:Return type int
;1479:==================
;1480:*/
;1481:int UI_ArenaScriptAutoInt( char *name ) {  
line 1482
;1482:	if(trap_Cvar_VariableValue(name)){
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $661
line 1483
;1483:		return trap_Cvar_VariableValue(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CVFI4 4
RETI4
ADDRGP4 $660
JUMPV
LABELV $661
line 1485
;1484:	}
;1485:		return atoi(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $660
endproc UI_ArenaScriptAutoInt 8 4
export UI_ArenaScriptAutoChar
proc UI_ArenaScriptAutoChar 264 12
line 1494
;1486:}
;1487:
;1488:/*
;1489:==================
;1490:UI_ArenaScriptAutoChar
;1491:Return type char
;1492:==================
;1493:*/
;1494:char *UI_ArenaScriptAutoChar( const char *name ) {
line 1497
;1495:char finaltext[256];
;1496:
;1497:	trap_Cvar_VariableStringBuffer(name, finaltext, sizeof( finaltext ));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1498
;1498:	if(strlen(finaltext) != 0){
ADDRLP4 0
ARGP4
ADDRLP4 256
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
EQI4 $664
line 1499
;1499:		return va("%s", finaltext );
ADDRGP4 $82
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 260
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 260
INDIRP4
RETP4
ADDRGP4 $663
JUMPV
LABELV $664
line 1500
;1500:	} else {
line 1501
;1501:		return va("%s", name );
ADDRGP4 $82
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 260
INDIRP4
RETP4
LABELV $663
endproc UI_ArenaScriptAutoChar 264 12
export UI_ArenaScriptAutoFloat
proc UI_ArenaScriptAutoFloat 8 4
line 1511
;1502:	}
;1503:}
;1504:
;1505:/*
;1506:==================
;1507:UI_ArenaScriptAutoFloat
;1508:Return type char
;1509:==================
;1510:*/
;1511:float UI_ArenaScriptAutoFloat( char *name ) {
line 1513
;1512:
;1513:	if(trap_Cvar_VariableValue(name)){
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $667
line 1514
;1514:		return trap_Cvar_VariableValue(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
RETF4
ADDRGP4 $666
JUMPV
LABELV $667
line 1516
;1515:	}
;1516:		return atof(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
RETF4
LABELV $666
endproc UI_ArenaScriptAutoFloat 8 4
export UI_ArenaScriptRandom
proc UI_ArenaScriptRandom 12 0
line 1526
;1517:}
;1518:
;1519:/*
;1520:==================
;1521:UI_ArenaScriptRandom
;1522:Return random int
;1523:==================
;1524:*/
;1525:int UI_ArenaScriptRandom(int min, int max)
;1526:{
line 1528
;1527:	int number;
;1528:	number = (rand() % (max - min + 1)) + (min);
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
CNSTI4 1
ADDI4
MODI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1529
;1529:	return number;
ADDRLP4 0
INDIRI4
RETI4
LABELV $669
endproc UI_ArenaScriptRandom 12 0
bss
align 1
LABELV $671
skip 1024
export UI_Cvar_VariableString
code
proc UI_Cvar_VariableString 0 12
line 1532
;1530:}
;1531:
;1532:char *UI_Cvar_VariableString( const char *var_name ) {
line 1535
;1533:	static char	buffer[MAX_STRING_CHARS];
;1534:
;1535:	trap_Cvar_VariableStringBuffer( var_name, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $671
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1537
;1536:
;1537:	return buffer;
ADDRGP4 $671
RETP4
LABELV $670
endproc UI_Cvar_VariableString 0 12
export UI_ConsoleCommand
proc UI_ConsoleCommand 568 16
line 1546
;1538:}
;1539:
;1540:
;1541:/*
;1542:=================
;1543:UI_ConsoleCommand
;1544:=================
;1545:*/
;1546:qboolean UI_ConsoleCommand( int realTime ) {
line 1552
;1547:	int    i;
;1548:	char	*cmd;
;1549:	int number01;
;1550:	int number02;
;1551:
;1552:	cmd = UI_Argv( 0 );
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1555
;1553:
;1554:	// ensure minimum menu data is available
;1555:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 1557
;1556:
;1557:if ( Q_stricmp (UI_Argv(0), "mgui_load") == 0 ) {
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $675
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $673
line 1558
;1558:	MGUI_Load();
ADDRGP4 MGUI_Load
CALLV
pop
line 1559
;1559:	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $673
line 1562
;1560:}
;1561:
;1562:if ( Q_stricmp (UI_Argv(0), "mguicall") == 0 ) {
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 $678
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $676
line 1563
;1563:	if( Q_stricmp (UI_Argv(1), "listvalue") == 0 ){
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $681
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $679
line 1564
;1564:	UI_MGUI_Edit( 1, atoi(UI_Argv(2)), atoi(UI_Argv(3)), NULL );
CNSTI4 2
ARGI4
ADDRLP4 44
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 3
ARGI4
ADDRLP4 52
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 1
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 UI_MGUI_Edit
CALLI4
pop
line 1565
;1565:	}
LABELV $679
line 1566
;1566:	if( Q_stricmp (UI_Argv(1), "press") == 0 ){
CNSTI4 1
ARGI4
ADDRLP4 44
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $684
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $682
line 1567
;1567:	UI_MGUI_Edit( 2, atoi(UI_Argv(2)), NULL, UI_Argv(3) );
CNSTI4 2
ARGI4
ADDRLP4 52
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 3
ARGI4
ADDRLP4 60
ADDRGP4 UI_Argv
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 UI_MGUI_Edit
CALLI4
pop
line 1568
;1568:	}
LABELV $682
line 1569
;1569:	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $676
line 1572
;1570:}
;1571:
;1572:UI_ScreenOffset();
ADDRGP4 UI_ScreenOffset
CALLV
pop
line 1574
;1573:
;1574:if( Q_stricmp (UI_Argv(0), "ui_addbots") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $687
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $685
line 1575
;1575:UI_AddBotsMenu();
ADDRGP4 UI_AddBotsMenu
CALLV
pop
line 1576
;1576:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $685
line 1578
;1577:}
;1578:if( Q_stricmp (UI_Argv(0), "ui_advanced") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $690
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $688
line 1579
;1579:UI_AdvancedMenu();
ADDRGP4 UI_AdvancedMenu
CALLV
pop
line 1580
;1580:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $688
line 1582
;1581:}
;1582:if( Q_stricmp (UI_Argv(0), "ui_cdkey") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $693
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $691
line 1583
;1583:UI_CDKeyMenu_f();
ADDRGP4 UI_CDKeyMenu_f
CALLV
pop
line 1584
;1584:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $691
line 1586
;1585:}
;1586:if( Q_stricmp (UI_Argv(0), "ui_savegame") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 60
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 $696
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $694
line 1587
;1587:UI_CinematicsMenu(0);
CNSTI4 0
ARGI4
ADDRGP4 UI_CinematicsMenu
CALLV
pop
line 1588
;1588:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $694
line 1590
;1589:}
;1590:if( Q_stricmp (UI_Argv(0), "ui_loadgame") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 68
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 $699
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $697
line 1591
;1591:UI_CinematicsMenu(1);
CNSTI4 1
ARGI4
ADDRGP4 UI_CinematicsMenu
CALLV
pop
line 1592
;1592:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $697
line 1594
;1593:}
;1594:if( Q_stricmp (UI_Argv(0), "ui_controls2") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 76
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $702
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $700
line 1595
;1595:UI_ControlsMenu();
ADDRGP4 UI_ControlsMenu
CALLV
pop
line 1596
;1596:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $700
line 1598
;1597:}
;1598:if( Q_stricmp (UI_Argv(0), "ui_credits0") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 84
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 $705
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $703
line 1599
;1599:UI_CreditMenu(0);
CNSTI4 0
ARGI4
ADDRGP4 UI_CreditMenu
CALLV
pop
line 1600
;1600:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $703
line 1602
;1601:}
;1602:if( Q_stricmp (UI_Argv(0), "ui_credits1") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 92
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 $708
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $706
line 1603
;1603:UI_CreditMenu(1);
CNSTI4 1
ARGI4
ADDRGP4 UI_CreditMenu
CALLV
pop
line 1604
;1604:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $706
line 1606
;1605:}
;1606:if( Q_stricmp (UI_Argv(0), "ui_demo2") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 100
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 $711
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $709
line 1607
;1607:UI_DemosMenu();
ADDRGP4 UI_DemosMenu
CALLV
pop
line 1608
;1608:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $709
line 1610
;1609:}
;1610:if( Q_stricmp (UI_Argv(0), "ui_display") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 108
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 $714
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $712
line 1611
;1611:UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 1612
;1612:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $712
line 1614
;1613:}
;1614:if( Q_stricmp (UI_Argv(0), "ui_ingame_bots") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 116
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 $717
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $715
line 1615
;1615:UI_BotCommandMenu_f();
ADDRGP4 UI_BotCommandMenu_f
CALLV
pop
line 1616
;1616:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $715
line 1618
;1617:}
;1618:if( Q_stricmp (UI_Argv(0), "ui_ingame") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 124
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 $720
ARGP4
ADDRLP4 128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $718
line 1619
;1619:UI_InGameMenu();
ADDRGP4 UI_InGameMenu
CALLV
pop
line 1620
;1620:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $718
line 1622
;1621:}
;1622:if( Q_stricmp (UI_Argv(0), "ui_ingame_mapvote") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 132
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 $723
ARGP4
ADDRLP4 136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $721
line 1623
;1623:UI_MapCallVote();
ADDRGP4 UI_MapCallVote
CALLV
pop
line 1624
;1624:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $721
line 1626
;1625:}
;1626:if( Q_stricmp (UI_Argv(0), "ui_menu") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 140
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 $726
ARGP4
ADDRLP4 144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $724
line 1627
;1627:UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 1628
;1628:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $724
line 1630
;1629:}	
;1630:if( Q_stricmp (UI_Argv(0), "ui_mods") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 148
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 $729
ARGP4
ADDRLP4 152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $727
line 1631
;1631:UI_ModsMenu();
ADDRGP4 UI_ModsMenu
CALLV
pop
line 1632
;1632:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $727
line 1634
;1633:}
;1634:if( Q_stricmp (UI_Argv(0), "ui_network") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 156
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 $732
ARGP4
ADDRLP4 160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $730
line 1635
;1635:UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 1636
;1636:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $730
line 1638
;1637:}
;1638:if( Q_stricmp (UI_Argv(0), "ui_options") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 164
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 $735
ARGP4
ADDRLP4 168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $733
line 1639
;1639:UI_SystemConfigMenu();
ADDRGP4 UI_SystemConfigMenu
CALLI4
pop
line 1640
;1640:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $733
line 1642
;1641:}
;1642:if( Q_stricmp (UI_Argv(0), "ui_playermodel") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 172
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRGP4 $738
ARGP4
ADDRLP4 176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $736
line 1643
;1643:UI_PlayerModelMenu();
ADDRGP4 UI_PlayerModelMenu
CALLV
pop
line 1644
;1644:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $736
line 1646
;1645:}
;1646:if( Q_stricmp (UI_Argv(0), "ui_playersettings") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 180
INDIRP4
ARGP4
ADDRGP4 $741
ARGP4
ADDRLP4 184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
NEI4 $739
line 1647
;1647:UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 1648
;1648:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $739
line 1650
;1649:}
;1650:if( Q_stricmp (UI_Argv(0), "ui_preferences") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 188
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRGP4 $744
ARGP4
ADDRLP4 192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
NEI4 $742
line 1651
;1651:UI_PreferencesMenu();
ADDRGP4 UI_PreferencesMenu
CALLV
pop
line 1652
;1652:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $742
line 1654
;1653:}
;1654:if( Q_stricmp (UI_Argv(0), "ui_removebots0") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 196
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRGP4 $747
ARGP4
ADDRLP4 200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
NEI4 $745
line 1655
;1655:UI_RemoveBotsMenu(0);
CNSTI4 0
ARGI4
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 1656
;1656:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $745
line 1658
;1657:}
;1658:if( Q_stricmp (UI_Argv(0), "ui_removebots1") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 204
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRGP4 $750
ARGP4
ADDRLP4 208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
NEI4 $748
line 1659
;1659:UI_RemoveBotsMenu(1);
CNSTI4 1
ARGI4
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 1660
;1660:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $748
line 1662
;1661:}
;1662:if( Q_stricmp (UI_Argv(0), "ui_removebots2") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 212
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 212
INDIRP4
ARGP4
ADDRGP4 $753
ARGP4
ADDRLP4 216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
NEI4 $751
line 1663
;1663:UI_RemoveBotsMenu(2);
CNSTI4 2
ARGI4
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 1664
;1664:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $751
line 1666
;1665:}
;1666:if( Q_stricmp (UI_Argv(0), "ui_sandbox") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 220
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 220
INDIRP4
ARGP4
ADDRGP4 $756
ARGP4
ADDRLP4 224
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $754
line 1667
;1667:UI_SandboxMainMenu();
ADDRGP4 UI_SandboxMainMenu
CALLV
pop
line 1668
;1668:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $754
line 1670
;1669:}
;1670:if( Q_stricmp (UI_Argv(0), "ui_saveconfig") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 228
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 228
INDIRP4
ARGP4
ADDRGP4 $759
ARGP4
ADDRLP4 232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
NEI4 $757
line 1671
;1671:UI_SaveConfigMenu();
ADDRGP4 UI_SaveConfigMenu
CALLV
pop
line 1672
;1672:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $757
line 1674
;1673:}
;1674:if( Q_stricmp (UI_Argv(0), "ui_saveconfiged") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 236
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRGP4 $762
ARGP4
ADDRLP4 240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 0
NEI4 $760
line 1675
;1675:UI_saveMapEdMenu();
ADDRGP4 UI_saveMapEdMenu
CALLV
pop
line 1676
;1676:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $760
line 1678
;1677:}
;1678:if( Q_stricmp (UI_Argv(0), "ui_serverinfo") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 244
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 244
INDIRP4
ARGP4
ADDRGP4 $765
ARGP4
ADDRLP4 248
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
NEI4 $763
line 1679
;1679:UI_ServerInfoMenu();
ADDRGP4 UI_ServerInfoMenu
CALLV
pop
line 1680
;1680:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $763
line 1682
;1681:}
;1682:if( Q_stricmp (UI_Argv(0), "ui_servers2") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 252
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 252
INDIRP4
ARGP4
ADDRGP4 $768
ARGP4
ADDRLP4 256
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $766
line 1683
;1683:UI_ArenaServersMenu();
ADDRGP4 UI_ArenaServersMenu
CALLV
pop
line 1684
;1684:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $766
line 1686
;1685:}
;1686:if( Q_stricmp (UI_Argv(0), "ui_setup") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 260
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 260
INDIRP4
ARGP4
ADDRGP4 $771
ARGP4
ADDRLP4 264
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $769
line 1687
;1687:UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 1688
;1688:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $769
line 1690
;1689:}
;1690:if( Q_stricmp (UI_Argv(0), "ui_sound") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 268
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 268
INDIRP4
ARGP4
ADDRGP4 $774
ARGP4
ADDRLP4 272
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $772
line 1691
;1691:UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 1692
;1692:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $772
line 1694
;1693:}
;1694:if( Q_stricmp (UI_Argv(0), "ui_specifyserver") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 276
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 $777
ARGP4
ADDRLP4 280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $775
line 1695
;1695:UI_SpecifyServerMenu();
ADDRGP4 UI_SpecifyServerMenu
CALLV
pop
line 1696
;1696:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $775
line 1698
;1697:}
;1698:if( Q_stricmp (UI_Argv(0), "ui_team") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 284
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 284
INDIRP4
ARGP4
ADDRGP4 $780
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $778
line 1699
;1699:UI_TeamMainMenu();
ADDRGP4 UI_TeamMainMenu
CALLV
pop
line 1700
;1700:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $778
line 1702
;1701:}
;1702:if( Q_stricmp (UI_Argv(0), "ui_teamorders") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 292
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 292
INDIRP4
ARGP4
ADDRGP4 $783
ARGP4
ADDRLP4 296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $781
line 1703
;1703:UI_BotCommandMenu_f();
ADDRGP4 UI_BotCommandMenu_f
CALLV
pop
line 1704
;1704:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $781
line 1706
;1705:}
;1706:if( Q_stricmp (UI_Argv(0), "ui_video") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 300
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 $786
ARGP4
ADDRLP4 304
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
NEI4 $784
line 1707
;1707:UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 1708
;1708:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $784
line 1710
;1709:}
;1710:if( Q_stricmp (UI_Argv(0), "ui_workshop") == 0 ){
CNSTI4 0
ARGI4
ADDRLP4 308
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 308
INDIRP4
ARGP4
ADDRGP4 $789
ARGP4
ADDRLP4 312
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
NEI4 $787
line 1711
;1711:UI_WorkshopMenu();
ADDRGP4 UI_WorkshopMenu
CALLV
pop
line 1712
;1712:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $787
line 1715
;1713:}
;1714:
;1715:if ( Q_stricmp (UI_Argv(0), "mgui_init") == 0 ) {
CNSTI4 0
ARGI4
ADDRLP4 316
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 316
INDIRP4
ARGP4
ADDRGP4 $792
ARGP4
ADDRLP4 320
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
NEI4 $790
line 1716
;1716:	UI_MGUI_Clear();
ADDRGP4 UI_MGUI_Clear
CALLI4
pop
line 1717
;1717:	trap_Cmd_ExecuteText( EXEC_NOW, "unset mgui_scroll\n");
CNSTI4 0
ARGI4
ADDRGP4 $793
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1718
;1718:	for ( i = 1; i < 250; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $794
line 1719
;1719:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_type\n", i));
ADDRGP4 $798
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 324
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 324
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1720
;1720:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_acttype\n", i));
ADDRGP4 $799
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 328
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 328
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1721
;1721:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_xtype\n", i));
ADDRGP4 $800
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 332
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1722
;1722:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_ytype\n", i));
ADDRGP4 $801
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 336
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 336
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1723
;1723:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_x\n", i));
ADDRGP4 $802
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 340
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1724
;1724:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_y\n", i));
ADDRGP4 $803
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 344
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 344
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1725
;1725:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_wtype\n", i));
ADDRGP4 $804
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 348
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 348
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1726
;1726:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_htype\n", i));
ADDRGP4 $805
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 352
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1727
;1727:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_w\n", i));
ADDRGP4 $806
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 356
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 356
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1728
;1728:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_h\n", i));
ADDRGP4 $807
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 360
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 360
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1729
;1729:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_text\n", i));
ADDRGP4 $808
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 364
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 364
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1730
;1730:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_cmd\n", i));
ADDRGP4 $809
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 368
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1731
;1731:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_cmd2\n", i));	
ADDRGP4 $810
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 372
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 372
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1732
;1732:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_1arg\n", i));
ADDRGP4 $811
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 376
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 376
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1733
;1733:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_2arg\n", i));
ADDRGP4 $812
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 380
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 380
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1734
;1734:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_3arg\n", i));
ADDRGP4 $813
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 384
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 384
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1735
;1735:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_4arg\n", i));
ADDRGP4 $814
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 388
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1736
;1736:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_5arg\n", i));
ADDRGP4 $815
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 392
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 392
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1737
;1737:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_6arg\n", i));
ADDRGP4 $816
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 396
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 396
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1738
;1738:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_7arg\n", i));
ADDRGP4 $817
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 400
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 400
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1739
;1739:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_8arg\n", i));
ADDRGP4 $818
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 404
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 404
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1740
;1740:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_9arg\n", i));
ADDRGP4 $819
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 408
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1741
;1741:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_10arg\n", i));
ADDRGP4 $820
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 412
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1742
;1742:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_11arg\n", i));
ADDRGP4 $821
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 416
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 416
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1743
;1743:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_12arg\n", i));
ADDRGP4 $822
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 420
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 420
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1744
;1744:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_13arg\n", i));
ADDRGP4 $823
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 424
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 424
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1745
;1745:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_14arg\n", i));
ADDRGP4 $824
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 428
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 428
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1746
;1746:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_15arg\n", i));
ADDRGP4 $825
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 432
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 432
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1747
;1747:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_16arg\n", i));
ADDRGP4 $826
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 436
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 436
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1748
;1748:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_17arg\n", i));
ADDRGP4 $827
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 440
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 440
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1749
;1749:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_18arg\n", i));
ADDRGP4 $828
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 444
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 444
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1750
;1750:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_19arg\n", i));
ADDRGP4 $829
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 448
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 448
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1751
;1751:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_20arg\n", i));
ADDRGP4 $830
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 452
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 452
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1752
;1752:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_21arg\n", i));
ADDRGP4 $831
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 456
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 456
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1753
;1753:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_22arg\n", i));
ADDRGP4 $832
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 460
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1754
;1754:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_23arg\n", i));
ADDRGP4 $833
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 464
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 464
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1755
;1755:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_24arg\n", i));
ADDRGP4 $834
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 468
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 468
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1756
;1756:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_25arg\n", i));
ADDRGP4 $835
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 472
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 472
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1757
;1757:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_26arg\n", i));
ADDRGP4 $836
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 476
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 476
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1758
;1758:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_27arg\n", i));
ADDRGP4 $837
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 480
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 480
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1759
;1759:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_28arg\n", i));
ADDRGP4 $838
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 484
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 484
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1760
;1760:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_29arg\n", i));
ADDRGP4 $839
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 488
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 488
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1761
;1761:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_30arg\n", i));
ADDRGP4 $840
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 492
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 492
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1762
;1762:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_file\n", i));
ADDRGP4 $841
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 496
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 496
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1763
;1763:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_value\n", i));
ADDRGP4 $842
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 500
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 500
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1764
;1764:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorR\n", i));
ADDRGP4 $843
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 504
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 504
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1765
;1765:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorG\n", i));
ADDRGP4 $844
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 508
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 508
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1766
;1766:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorB\n", i));
ADDRGP4 $845
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 512
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 512
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1767
;1767:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorA\n", i));
ADDRGP4 $846
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 516
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 516
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1768
;1768:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorinnerR\n", i));
ADDRGP4 $847
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 520
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 520
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1769
;1769:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorinnerG\n", i));
ADDRGP4 $848
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 524
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 524
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1770
;1770:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorinnerB\n", i));
ADDRGP4 $849
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 528
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 528
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1771
;1771:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_colorinnerA\n", i));	
ADDRGP4 $850
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 532
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 532
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1772
;1772:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_fontsize\n", i));
ADDRGP4 $851
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 536
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 536
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1773
;1773:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_corner\n", i));
ADDRGP4 $852
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 540
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 540
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1774
;1774:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_col\n", i));
ADDRGP4 $853
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 544
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 544
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1775
;1775:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_mode\n", i));
ADDRGP4 $854
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 548
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 548
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1776
;1776:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_style\n", i));
ADDRGP4 $855
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 552
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 552
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1777
;1777:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_min\n", i));
ADDRGP4 $856
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 556
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 556
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1778
;1778:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_max\n", i));
ADDRGP4 $857
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 560
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 560
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1779
;1779:	trap_Cmd_ExecuteText( EXEC_NOW, va("unset mitem%i_savecvar\n", i));
ADDRGP4 $858
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 564
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 564
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1780
;1780:	}
LABELV $795
line 1718
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 250
LTI4 $794
line 1781
;1781:	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $790
line 1784
;1782:}
;1783:
;1784:	if ( Q_stricmp (UI_Argv(0), "remapShader") == 0 ) {
CNSTI4 0
ARGI4
ADDRLP4 324
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 324
INDIRP4
ARGP4
ADDRGP4 $861
ARGP4
ADDRLP4 328
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
NEI4 $859
line 1789
;1785:		char shader1[MAX_QPATH];
;1786:		char shader2[MAX_QPATH];
;1787:		char shader3[MAX_QPATH];
;1788:
;1789:		Q_strncpyz(shader1, UI_Argv(1), sizeof(shader1));
CNSTI4 1
ARGI4
ADDRLP4 524
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 332
ARGP4
ADDRLP4 524
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1790
;1790:		Q_strncpyz(shader2, UI_Argv(2), sizeof(shader2));
CNSTI4 2
ARGI4
ADDRLP4 528
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 396
ARGP4
ADDRLP4 528
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1791
;1791:		Q_strncpyz(shader3, UI_Argv(3), sizeof(shader3));
CNSTI4 3
ARGI4
ADDRLP4 532
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 460
ARGP4
ADDRLP4 532
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1793
;1792:
;1793:		trap_R_RemapShader(shader1, shader2, shader3);
ADDRLP4 332
ARGP4
ADDRLP4 396
ARGP4
ADDRLP4 460
ARGP4
ADDRGP4 trap_R_RemapShader
CALLI4
pop
line 1795
;1794:
;1795:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $859
line 1798
;1796:	}
;1797:	
;1798:	if ( Q_stricmp (UI_Argv(0), "concat") == 0 ) {
CNSTI4 0
ARGI4
ADDRLP4 332
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 332
INDIRP4
ARGP4
ADDRGP4 $864
ARGP4
ADDRLP4 336
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
NEI4 $862
line 1800
;1799:		
;1800:		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s \"%s\"", UI_Argv(1), UI_ConcatArgs(2)));
CNSTI4 1
ARGI4
ADDRLP4 340
ADDRGP4 UI_Argv
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 344
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $865
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 348
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1802
;1801:
;1802:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $862
line 1805
;1803:	}
;1804:
;1805:	if ( Q_stricmp (UI_Argv(0), "mgui") == 0 ) {
CNSTI4 0
ARGI4
ADDRLP4 340
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 $868
ARGP4
ADDRLP4 344
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
NEI4 $866
line 1806
;1806:		trap_Cmd_ExecuteText( EXEC_INSERT, va("execscript \"mgui/%s\"", UI_ConcatArgs(1)));
CNSTI4 1
ARGI4
ADDRLP4 348
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $869
ARGP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 352
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1807
;1807:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $866
line 1810
;1808:	}
;1809:	
;1810:	if ( Q_stricmp (UI_Argv(0), "mgui_api") == 0 ) {
CNSTI4 0
ARGI4
ADDRLP4 348
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRGP4 $872
ARGP4
ADDRLP4 352
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
NEI4 $870
line 1811
;1811:		trap_Cvar_SetValue( "mgui_api_active", 1 );
ADDRGP4 $873
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1812
;1812:		trap_Cmd_ExecuteText( EXEC_INSERT, va("execscript \"mgui/%s\"", UI_ConcatArgs(1)));
CNSTI4 1
ARGI4
ADDRLP4 356
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $869
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 360
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 360
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1813
;1813:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $870
line 1816
;1814:	}
;1815:
;1816:if ( Q_stricmp (UI_Argv(0), "as_run") == 0 ) {
CNSTI4 0
ARGI4
ADDRLP4 356
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRGP4 $876
ARGP4
ADDRLP4 360
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $874
line 1817
;1817:	if ( Q_stricmp (UI_Argv(1), "syscommand") == 0 ) {
CNSTI4 1
ARGI4
ADDRLP4 364
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRGP4 $879
ARGP4
ADDRLP4 368
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
NEI4 $877
line 1818
;1818:		trap_System( va("\"%s\"", UI_ConcatArgs(2)));
CNSTI4 2
ARGI4
ADDRLP4 372
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $880
ARGP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRLP4 376
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 376
INDIRP4
ARGP4
ADDRGP4 trap_System
CALLI4
pop
line 1819
;1819:	}
LABELV $877
line 1820
;1820:	if ( Q_stricmp (UI_Argv(1), "if") == 0 ) {
CNSTI4 1
ARGI4
ADDRLP4 372
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRGP4 $883
ARGP4
ADDRLP4 376
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
NEI4 $881
line 1821
;1821:		if(!Q_stricmp (UI_Argv(3), "=")){
CNSTI4 3
ARGI4
ADDRLP4 380
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 380
INDIRP4
ARGP4
ADDRGP4 $886
ARGP4
ADDRLP4 384
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
NEI4 $884
line 1822
;1822:			if(!Q_stricmp (UI_ArenaScriptAutoChar( UI_Argv(2) ), UI_ArenaScriptAutoChar( UI_Argv(4) ))){
CNSTI4 2
ARGI4
ADDRLP4 388
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 388
INDIRP4
ARGP4
ADDRLP4 392
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
CNSTI4 4
ARGI4
ADDRLP4 396
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 396
INDIRP4
ARGP4
ADDRLP4 400
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRLP4 392
INDIRP4
ARGP4
ADDRLP4 400
INDIRP4
ARGP4
ADDRLP4 404
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 404
INDIRI4
CNSTI4 0
NEI4 $887
line 1823
;1823:				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 408
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRLP4 412
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1824
;1824:			}
LABELV $887
line 1825
;1825:		}
LABELV $884
line 1826
;1826:		if(!Q_stricmp (UI_Argv(3), "==")){
CNSTI4 3
ARGI4
ADDRLP4 388
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 388
INDIRP4
ARGP4
ADDRGP4 $892
ARGP4
ADDRLP4 392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 392
INDIRI4
CNSTI4 0
NEI4 $890
line 1827
;1827:			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) == UI_ArenaScriptAutoInt( UI_Argv(4) )){
CNSTI4 2
ARGI4
ADDRLP4 396
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 396
INDIRP4
ARGP4
ADDRLP4 400
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
CNSTI4 4
ARGI4
ADDRLP4 404
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRLP4 408
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
ADDRLP4 408
INDIRI4
NEI4 $893
line 1828
;1828:				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 412
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRLP4 416
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 416
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1829
;1829:			}
LABELV $893
line 1830
;1830:		}
LABELV $890
line 1831
;1831:		if(!Q_stricmp (UI_Argv(3), "!=")){
CNSTI4 3
ARGI4
ADDRLP4 396
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 396
INDIRP4
ARGP4
ADDRGP4 $897
ARGP4
ADDRLP4 400
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
NEI4 $895
line 1832
;1832:			if(Q_stricmp (UI_ArenaScriptAutoChar( UI_Argv(2) ), UI_ArenaScriptAutoChar( UI_Argv(4) )) != 0){
CNSTI4 2
ARGI4
ADDRLP4 404
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRLP4 408
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
CNSTI4 4
ARGI4
ADDRLP4 412
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRLP4 416
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRLP4 416
INDIRP4
ARGP4
ADDRLP4 420
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 420
INDIRI4
CNSTI4 0
EQI4 $898
line 1833
;1833:				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 424
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 424
INDIRP4
ARGP4
ADDRLP4 428
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 428
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1834
;1834:			}
LABELV $898
line 1835
;1835:		}
LABELV $895
line 1836
;1836:		if(!Q_stricmp (UI_Argv(3), "!==")){
CNSTI4 3
ARGI4
ADDRLP4 404
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRGP4 $902
ARGP4
ADDRLP4 408
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 0
NEI4 $900
line 1837
;1837:			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) != UI_ArenaScriptAutoInt( UI_Argv(4) )){
CNSTI4 2
ARGI4
ADDRLP4 412
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRLP4 416
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
CNSTI4 4
ARGI4
ADDRLP4 420
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRLP4 424
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
ADDRLP4 424
INDIRI4
EQI4 $903
line 1838
;1838:				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 428
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 432
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 432
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1839
;1839:			}
LABELV $903
line 1840
;1840:		}
LABELV $900
line 1841
;1841:		if(!Q_stricmp (UI_Argv(3), "<")){
CNSTI4 3
ARGI4
ADDRLP4 412
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 $907
ARGP4
ADDRLP4 416
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $905
line 1842
;1842:			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) < UI_ArenaScriptAutoInt( UI_Argv(4) )){
CNSTI4 2
ARGI4
ADDRLP4 420
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRLP4 424
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
CNSTI4 4
ARGI4
ADDRLP4 428
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 432
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
ADDRLP4 432
INDIRI4
GEI4 $908
line 1843
;1843:				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 436
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 440
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1844
;1844:			}
LABELV $908
line 1845
;1845:		}
LABELV $905
line 1846
;1846:		if(!Q_stricmp (UI_Argv(3), ">")){
CNSTI4 3
ARGI4
ADDRLP4 420
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRGP4 $912
ARGP4
ADDRLP4 424
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
NEI4 $910
line 1847
;1847:			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) > UI_ArenaScriptAutoInt( UI_Argv(4) )){
CNSTI4 2
ARGI4
ADDRLP4 428
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 432
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
CNSTI4 4
ARGI4
ADDRLP4 436
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 432
INDIRI4
ADDRLP4 440
INDIRI4
LEI4 $913
line 1848
;1848:				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 444
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 448
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 448
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1849
;1849:			}
LABELV $913
line 1850
;1850:		}
LABELV $910
line 1851
;1851:		if(!Q_stricmp (UI_Argv(3), "<=")){
CNSTI4 3
ARGI4
ADDRLP4 428
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRGP4 $917
ARGP4
ADDRLP4 432
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 432
INDIRI4
CNSTI4 0
NEI4 $915
line 1852
;1852:			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) <= UI_ArenaScriptAutoInt( UI_Argv(4) )){
CNSTI4 2
ARGI4
ADDRLP4 436
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
CNSTI4 4
ARGI4
ADDRLP4 444
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 448
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 440
INDIRI4
ADDRLP4 448
INDIRI4
GTI4 $918
line 1853
;1853:				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 452
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 456
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 456
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1854
;1854:			}
LABELV $918
line 1855
;1855:		}
LABELV $915
line 1856
;1856:		if(!Q_stricmp (UI_Argv(3), ">=")){
CNSTI4 3
ARGI4
ADDRLP4 436
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRGP4 $922
ARGP4
ADDRLP4 440
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 440
INDIRI4
CNSTI4 0
NEI4 $920
line 1857
;1857:			if(UI_ArenaScriptAutoInt( UI_Argv(2) ) >= UI_ArenaScriptAutoInt( UI_Argv(4) )){
CNSTI4 2
ARGI4
ADDRLP4 444
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 448
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
CNSTI4 4
ARGI4
ADDRLP4 452
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 456
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 448
INDIRI4
ADDRLP4 456
INDIRI4
LTI4 $923
line 1858
;1858:				trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 5 )) );
CNSTI4 5
ARGI4
ADDRLP4 460
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRLP4 464
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 464
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1859
;1859:			}
LABELV $923
line 1860
;1860:		}
LABELV $920
line 1861
;1861:	}	
LABELV $881
line 1862
;1862:	if ( Q_stricmp (UI_Argv(1), "op") == 0 ) {
CNSTI4 1
ARGI4
ADDRLP4 380
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 380
INDIRP4
ARGP4
ADDRGP4 $927
ARGP4
ADDRLP4 384
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
NEI4 $925
line 1863
;1863:		number01 = UI_ArenaScriptAutoInt( UI_Argv(2) );
CNSTI4 2
ARGI4
ADDRLP4 388
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 388
INDIRP4
ARGP4
ADDRLP4 392
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 392
INDIRI4
ASGNI4
line 1864
;1864:		number02 = UI_ArenaScriptAutoInt( UI_Argv(4) );
CNSTI4 4
ARGI4
ADDRLP4 396
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 396
INDIRP4
ARGP4
ADDRLP4 400
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 400
INDIRI4
ASGNI4
line 1865
;1865:		if(!Q_stricmp (UI_Argv(3), "+=")){
CNSTI4 3
ARGI4
ADDRLP4 404
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRGP4 $930
ARGP4
ADDRLP4 408
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 0
NEI4 $928
line 1866
;1866:			number01 += number02;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 1867
;1867:			trap_Cvar_Set( UI_Argv(2), va("%i", number01) );
CNSTI4 2
ARGI4
ADDRLP4 412
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 $931
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 416
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRLP4 416
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1868
;1868:		}
LABELV $928
line 1869
;1869:		if(!Q_stricmp (UI_Argv(3), "-=")){
CNSTI4 3
ARGI4
ADDRLP4 412
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 $934
ARGP4
ADDRLP4 416
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $932
line 1870
;1870:			number01 -= number02;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1871
;1871:			trap_Cvar_Set( UI_Argv(2), va("%i", number01) );
CNSTI4 2
ARGI4
ADDRLP4 420
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 $931
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRLP4 424
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1872
;1872:		}
LABELV $932
line 1873
;1873:		if(!Q_stricmp (UI_Argv(3), "*=")){
CNSTI4 3
ARGI4
ADDRLP4 420
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRGP4 $937
ARGP4
ADDRLP4 424
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
NEI4 $935
line 1874
;1874:			number01 *= number02;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
line 1875
;1875:			trap_Cvar_Set( UI_Argv(2), va("%i", number01) );
CNSTI4 2
ARGI4
ADDRLP4 428
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 $931
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 432
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1876
;1876:		}
LABELV $935
line 1877
;1877:		if(!Q_stricmp (UI_Argv(3), "/=")){
CNSTI4 3
ARGI4
ADDRLP4 428
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRGP4 $940
ARGP4
ADDRLP4 432
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 432
INDIRI4
CNSTI4 0
NEI4 $938
line 1878
;1878:			number01 /= number02;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
DIVI4
ASGNI4
line 1879
;1879:			trap_Cvar_Set( UI_Argv(2), va("%i", number01) );
CNSTI4 2
ARGI4
ADDRLP4 436
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 $931
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1880
;1880:		}
LABELV $938
line 1881
;1881:		if(!Q_stricmp (UI_Argv(3), "=")){
CNSTI4 3
ARGI4
ADDRLP4 436
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRGP4 $886
ARGP4
ADDRLP4 440
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 440
INDIRI4
CNSTI4 0
NEI4 $941
line 1882
;1882:			trap_Cvar_Set( UI_Argv(2), UI_ArenaScriptAutoChar(UI_Argv(4)) );
CNSTI4 2
ARGI4
ADDRLP4 444
ADDRGP4 UI_Argv
CALLP4
ASGNP4
CNSTI4 4
ARGI4
ADDRLP4 448
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 448
INDIRP4
ARGP4
ADDRLP4 452
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1883
;1883:		}
LABELV $941
line 1884
;1884:	}
LABELV $925
line 1885
;1885:	if ( Q_stricmp (UI_Argv(1), "random") == 0 ) {
CNSTI4 1
ARGI4
ADDRLP4 388
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 388
INDIRP4
ARGP4
ADDRGP4 $945
ARGP4
ADDRLP4 392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 392
INDIRI4
CNSTI4 0
NEI4 $943
line 1886
;1886:		number01 = UI_ArenaScriptAutoInt( UI_Argv(2) );
CNSTI4 2
ARGI4
ADDRLP4 396
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 396
INDIRP4
ARGP4
ADDRLP4 400
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 400
INDIRI4
ASGNI4
line 1887
;1887:		number02 = UI_ArenaScriptRandom( atoi(UI_Argv(4)), atoi(UI_Argv(5)) );
CNSTI4 4
ARGI4
ADDRLP4 404
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRLP4 408
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 5
ARGI4
ADDRLP4 412
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRLP4 416
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
ARGI4
ADDRLP4 416
INDIRI4
ARGI4
ADDRLP4 420
ADDRGP4 UI_ArenaScriptRandom
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 420
INDIRI4
ASGNI4
line 1888
;1888:		if(!Q_stricmp (UI_Argv(3), "=")){
CNSTI4 3
ARGI4
ADDRLP4 424
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 424
INDIRP4
ARGP4
ADDRGP4 $886
ARGP4
ADDRLP4 428
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 428
INDIRI4
CNSTI4 0
NEI4 $946
line 1889
;1889:			number01 = number02;
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1890
;1890:				trap_Cvar_Set( UI_Argv(2), va("%f", number01) );
CNSTI4 2
ARGI4
ADDRLP4 432
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 $948
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 436
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1891
;1891:		}
LABELV $946
line 1892
;1892:		if(!Q_stricmp (UI_Argv(3), "+=")){
CNSTI4 3
ARGI4
ADDRLP4 432
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRGP4 $930
ARGP4
ADDRLP4 436
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 436
INDIRI4
CNSTI4 0
NEI4 $949
line 1893
;1893:			number01 += number02;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 1894
;1894:				trap_Cvar_Set( UI_Argv(2), va("%f", number01) );
CNSTI4 2
ARGI4
ADDRLP4 440
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 $948
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 444
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1895
;1895:		}
LABELV $949
line 1896
;1896:		if(!Q_stricmp (UI_Argv(3), "-=")){
CNSTI4 3
ARGI4
ADDRLP4 440
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRGP4 $934
ARGP4
ADDRLP4 444
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 444
INDIRI4
CNSTI4 0
NEI4 $951
line 1897
;1897:			number01 -= number02;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1898
;1898:				trap_Cvar_Set( UI_Argv(2), va("%f", number01) );
CNSTI4 2
ARGI4
ADDRLP4 448
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 $948
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 448
INDIRP4
ARGP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1899
;1899:		}
LABELV $951
line 1900
;1900:		if(!Q_stricmp (UI_Argv(3), "*=")){
CNSTI4 3
ARGI4
ADDRLP4 448
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 448
INDIRP4
ARGP4
ADDRGP4 $937
ARGP4
ADDRLP4 452
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 452
INDIRI4
CNSTI4 0
NEI4 $953
line 1901
;1901:			number01 *= number02;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
line 1902
;1902:				trap_Cvar_Set( UI_Argv(2), va("%f", number01) );
CNSTI4 2
ARGI4
ADDRLP4 456
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 $948
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 456
INDIRP4
ARGP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1903
;1903:		}
LABELV $953
line 1904
;1904:		if(!Q_stricmp (UI_Argv(3), "/=")){
CNSTI4 3
ARGI4
ADDRLP4 456
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 456
INDIRP4
ARGP4
ADDRGP4 $940
ARGP4
ADDRLP4 460
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 460
INDIRI4
CNSTI4 0
NEI4 $955
line 1905
;1905:			number01 /= number02;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
DIVI4
ASGNI4
line 1906
;1906:				trap_Cvar_Set( UI_Argv(2), va("%f", number01) );
CNSTI4 2
ARGI4
ADDRLP4 464
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 $948
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 468
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 464
INDIRP4
ARGP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1907
;1907:		}
LABELV $955
line 1908
;1908:	}	
LABELV $943
line 1909
;1909:	if ( Q_stricmp (UI_Argv(1), "editline") == 0 ) {
CNSTI4 1
ARGI4
ADDRLP4 396
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 396
INDIRP4
ARGP4
ADDRGP4 $959
ARGP4
ADDRLP4 400
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
NEI4 $957
line 1910
;1910:	if(!Q_stricmp (UI_Argv(3), "add")){
CNSTI4 3
ARGI4
ADDRLP4 404
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRGP4 $962
ARGP4
ADDRLP4 408
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 0
NEI4 $960
line 1911
;1911:	trap_Cvar_Set( UI_Argv(2), va("%s%s", UI_Cvar_VariableString(UI_Argv(2)), UI_ArenaScriptAutoChar( UI_Argv(3) )) );
CNSTI4 2
ARGI4
ADDRLP4 412
ADDRGP4 UI_Argv
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 416
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 416
INDIRP4
ARGP4
ADDRLP4 420
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
CNSTI4 3
ARGI4
ADDRLP4 424
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 424
INDIRP4
ARGP4
ADDRLP4 428
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $963
ARGP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 432
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1912
;1912:	}
LABELV $960
line 1914
;1913:	
;1914:	if(!Q_stricmp (UI_Argv(3), "begin")){
CNSTI4 3
ARGI4
ADDRLP4 412
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 $966
ARGP4
ADDRLP4 416
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $964
line 1915
;1915:	trap_Cvar_Set( UI_Argv(2), va("%s%s", UI_ArenaScriptAutoChar( UI_Argv(3) ), UI_Cvar_VariableString(UI_Argv(2))) );
CNSTI4 2
ARGI4
ADDRLP4 420
ADDRGP4 UI_Argv
CALLP4
ASGNP4
CNSTI4 3
ARGI4
ADDRLP4 424
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 424
INDIRP4
ARGP4
ADDRLP4 428
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 432
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRLP4 436
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $963
ARGP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1916
;1916:	}
LABELV $964
line 1917
;1917:	}
LABELV $957
line 1918
;1918:	if ( Q_stricmp (UI_Argv(1), "cvar") == 0 ) {
CNSTI4 1
ARGI4
ADDRLP4 404
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRGP4 $969
ARGP4
ADDRLP4 408
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 0
NEI4 $967
line 1919
;1919:	if(!Q_stricmp (UI_Argv(2), "delete")){
CNSTI4 2
ARGI4
ADDRLP4 412
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 $972
ARGP4
ADDRLP4 416
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $970
line 1920
;1920:	trap_Cmd_ExecuteText( EXEC_APPEND, va("unset %s\n", UI_Argv(3)));
CNSTI4 3
ARGI4
ADDRLP4 420
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRGP4 $973
ARGP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRLP4 424
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 424
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1921
;1921:	}
LABELV $970
line 1923
;1922:	
;1923:	if(!Q_stricmp (UI_Argv(2), "save")){
CNSTI4 2
ARGI4
ADDRLP4 420
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRGP4 $976
ARGP4
ADDRLP4 424
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
NEI4 $974
line 1924
;1924:	trap_Cmd_ExecuteText( EXEC_APPEND, va("seta %s %s\n", UI_Argv(4), UI_ArenaScriptAutoChar( UI_Argv(3) )));
CNSTI4 4
ARGI4
ADDRLP4 428
ADDRGP4 UI_Argv
CALLP4
ASGNP4
CNSTI4 3
ARGI4
ADDRLP4 432
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRLP4 436
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $977
ARGP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 440
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1925
;1925:	}
LABELV $974
line 1927
;1926:	
;1927:	if(!Q_stricmp (UI_Argv(2), "load")){
CNSTI4 2
ARGI4
ADDRLP4 428
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRGP4 $980
ARGP4
ADDRLP4 432
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 432
INDIRI4
CNSTI4 0
NEI4 $978
line 1928
;1928:	trap_Cmd_ExecuteText( EXEC_APPEND, va("set %s %s\n", UI_Argv(3), UI_ArenaScriptAutoChar( UI_Argv(4) )));
CNSTI4 3
ARGI4
ADDRLP4 436
ADDRGP4 UI_Argv
CALLP4
ASGNP4
CNSTI4 4
ARGI4
ADDRLP4 440
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRLP4 444
ADDRGP4 UI_ArenaScriptAutoChar
CALLP4
ASGNP4
ADDRGP4 $981
ARGP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 448
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 448
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1929
;1929:	}
LABELV $978
line 1930
;1930:	}
LABELV $967
line 1931
;1931:	if ( Q_stricmp (UI_Argv(1), "for") == 0 ) {
CNSTI4 1
ARGI4
ADDRLP4 412
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 $984
ARGP4
ADDRLP4 416
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $982
line 1932
;1932:	if(!Q_stricmp (UI_Argv(3), "==")){ 
CNSTI4 3
ARGI4
ADDRLP4 420
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRGP4 $892
ARGP4
ADDRLP4 424
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
NEI4 $985
line 1933
;1933:	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i == UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
CNSTI4 2
ARGI4
ADDRLP4 428
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 432
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 432
INDIRI4
ASGNI4
ADDRGP4 $990
JUMPV
LABELV $987
line 1934
;1934:		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
CNSTI4 6
ARGI4
ADDRLP4 436
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 440
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1935
;1935:	}
LABELV $988
line 1933
CNSTI4 5
ARGI4
ADDRLP4 436
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 440
INDIRI4
ADDI4
ASGNI4
LABELV $990
CNSTI4 4
ARGI4
ADDRLP4 444
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 448
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 448
INDIRI4
EQI4 $987
line 1936
;1936:	}
LABELV $985
line 1937
;1937:	if(!Q_stricmp (UI_Argv(3), "!=")){
CNSTI4 3
ARGI4
ADDRLP4 428
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRGP4 $897
ARGP4
ADDRLP4 432
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 432
INDIRI4
CNSTI4 0
NEI4 $991
line 1938
;1938:	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i != UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
CNSTI4 2
ARGI4
ADDRLP4 436
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 440
INDIRI4
ASGNI4
ADDRGP4 $996
JUMPV
LABELV $993
line 1939
;1939:		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
CNSTI4 6
ARGI4
ADDRLP4 444
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 448
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 448
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1940
;1940:	}
LABELV $994
line 1938
CNSTI4 5
ARGI4
ADDRLP4 444
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 448
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 448
INDIRI4
ADDI4
ASGNI4
LABELV $996
CNSTI4 4
ARGI4
ADDRLP4 452
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 456
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 456
INDIRI4
NEI4 $993
line 1941
;1941:	}
LABELV $991
line 1942
;1942:	if(!Q_stricmp (UI_Argv(3), "<")){
CNSTI4 3
ARGI4
ADDRLP4 436
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRGP4 $907
ARGP4
ADDRLP4 440
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 440
INDIRI4
CNSTI4 0
NEI4 $997
line 1943
;1943:	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i < UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
CNSTI4 2
ARGI4
ADDRLP4 444
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 448
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 448
INDIRI4
ASGNI4
ADDRGP4 $1002
JUMPV
LABELV $999
line 1944
;1944:		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
CNSTI4 6
ARGI4
ADDRLP4 452
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 456
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 456
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1945
;1945:	}
LABELV $1000
line 1943
CNSTI4 5
ARGI4
ADDRLP4 452
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 456
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 456
INDIRI4
ADDI4
ASGNI4
LABELV $1002
CNSTI4 4
ARGI4
ADDRLP4 460
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRLP4 464
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 464
INDIRI4
LTI4 $999
line 1946
;1946:	}
LABELV $997
line 1947
;1947:	if(!Q_stricmp (UI_Argv(3), ">")){
CNSTI4 3
ARGI4
ADDRLP4 444
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRGP4 $912
ARGP4
ADDRLP4 448
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 448
INDIRI4
CNSTI4 0
NEI4 $1003
line 1948
;1948:	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i > UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
CNSTI4 2
ARGI4
ADDRLP4 452
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 456
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 456
INDIRI4
ASGNI4
ADDRGP4 $1008
JUMPV
LABELV $1005
line 1949
;1949:		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
CNSTI4 6
ARGI4
ADDRLP4 460
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRLP4 464
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 464
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1950
;1950:	}
LABELV $1006
line 1948
CNSTI4 5
ARGI4
ADDRLP4 460
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRLP4 464
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 464
INDIRI4
ADDI4
ASGNI4
LABELV $1008
CNSTI4 4
ARGI4
ADDRLP4 468
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRLP4 472
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 472
INDIRI4
GTI4 $1005
line 1951
;1951:	}
LABELV $1003
line 1952
;1952:	if(!Q_stricmp (UI_Argv(3), "<=")){
CNSTI4 3
ARGI4
ADDRLP4 452
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRGP4 $917
ARGP4
ADDRLP4 456
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 456
INDIRI4
CNSTI4 0
NEI4 $1009
line 1953
;1953:	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i <= UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
CNSTI4 2
ARGI4
ADDRLP4 460
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRLP4 464
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 464
INDIRI4
ASGNI4
ADDRGP4 $1014
JUMPV
LABELV $1011
line 1954
;1954:		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
CNSTI4 6
ARGI4
ADDRLP4 468
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRLP4 472
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 472
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1955
;1955:	}
LABELV $1012
line 1953
CNSTI4 5
ARGI4
ADDRLP4 468
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRLP4 472
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 472
INDIRI4
ADDI4
ASGNI4
LABELV $1014
CNSTI4 4
ARGI4
ADDRLP4 476
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 476
INDIRP4
ARGP4
ADDRLP4 480
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 480
INDIRI4
LEI4 $1011
line 1956
;1956:	}
LABELV $1009
line 1957
;1957:	if(!Q_stricmp (UI_Argv(3), ">=")){
CNSTI4 3
ARGI4
ADDRLP4 460
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRGP4 $922
ARGP4
ADDRLP4 464
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 464
INDIRI4
CNSTI4 0
NEI4 $1015
line 1958
;1958:	for( i = UI_ArenaScriptAutoInt( UI_Argv(2) ); i >= UI_ArenaScriptAutoInt( UI_Argv(4) ); i += UI_ArenaScriptAutoInt( UI_Argv(5) ) ){
CNSTI4 2
ARGI4
ADDRLP4 468
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRLP4 472
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 472
INDIRI4
ASGNI4
ADDRGP4 $1020
JUMPV
LABELV $1017
line 1959
;1959:		trap_Cmd_ExecuteText( EXEC_INSERT, va("%s\n", UI_ConcatArgs( 6 )) );
CNSTI4 6
ARGI4
ADDRLP4 476
ADDRGP4 UI_ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $889
ARGP4
ADDRLP4 476
INDIRP4
ARGP4
ADDRLP4 480
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 480
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1960
;1960:	}
LABELV $1018
line 1958
CNSTI4 5
ARGI4
ADDRLP4 476
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 476
INDIRP4
ARGP4
ADDRLP4 480
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 480
INDIRI4
ADDI4
ASGNI4
LABELV $1020
CNSTI4 4
ARGI4
ADDRLP4 484
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 484
INDIRP4
ARGP4
ADDRLP4 488
ADDRGP4 UI_ArenaScriptAutoInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 488
INDIRI4
GEI4 $1017
line 1961
;1961:	}
LABELV $1015
line 1962
;1962:	}
LABELV $982
line 1963
;1963:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $874
line 1966
;1964:}
;1965:
;1966:	if ( Q_stricmp (cmd, "workshop") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1023
ARGP4
ADDRLP4 364
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
NEI4 $1021
line 1967
;1967:		UI_WorkshopMenu();
ADDRGP4 UI_WorkshopMenu
CALLV
pop
line 1968
;1968:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1021
line 1970
;1969:	}
;1970:	if ( Q_stricmp (cmd, "levelselect") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1026
ARGP4
ADDRLP4 368
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
NEI4 $1024
line 1971
;1971:		UI_SPLevelMenu_f();
ADDRGP4 UI_SPLevelMenu_f
CALLV
pop
line 1972
;1972:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1024
line 1974
;1973:	}
;1974:	if ( Q_stricmp (cmd, "reloadgame") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1029
ARGP4
ADDRLP4 372
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
NEI4 $1027
line 1975
;1975:		MainMenu_ReloadGame();
ADDRGP4 MainMenu_ReloadGame
CALLV
pop
line 1976
;1976:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1027
line 1978
;1977:	}
;1978:	if ( Q_stricmp (cmd, "secretmenu") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1032
ARGP4
ADDRLP4 376
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
NEI4 $1030
line 1979
;1979:		UI_SpecifyLeagueMenu();
ADDRGP4 UI_SpecifyLeagueMenu
CALLV
pop
line 1980
;1980:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1030
line 1983
;1981:	}
;1982:
;1983:	if ( Q_stricmp (cmd, "postgame") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1035
ARGP4
ADDRLP4 380
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $1033
line 1984
;1984:		UI_SPPostgameMenu_f();
ADDRGP4 UI_SPPostgameMenu_f
CALLV
pop
line 1985
;1985:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1033
line 1988
;1986:	}
;1987:	
;1988:	if ( Q_stricmp (cmd, "menuback") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1038
ARGP4
ADDRLP4 384
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
NEI4 $1036
line 1989
;1989:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1990
;1990:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1036
line 1993
;1991:	}
;1992:
;1993:	if ( Q_stricmp (cmd, "ui_cache") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1041
ARGP4
ADDRLP4 388
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
NEI4 $1039
line 1994
;1994:		UI_Cache_f();
ADDRGP4 UI_Cache_f
CALLV
pop
line 1995
;1995:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1039
line 1998
;1996:	}
;1997:
;1998:	if ( Q_stricmp (cmd, "save_menu") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1044
ARGP4
ADDRLP4 392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 392
INDIRI4
CNSTI4 0
NEI4 $1042
line 1999
;1999:		UI_CinematicsMenu_f(0);
CNSTI4 0
ARGI4
ADDRGP4 UI_CinematicsMenu_f
CALLV
pop
line 2000
;2000:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1042
line 2003
;2001:	}
;2002:	
;2003:	if ( Q_stricmp (cmd, "load_menu") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1047
ARGP4
ADDRLP4 396
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
NEI4 $1045
line 2004
;2004:		UI_CinematicsMenu_f(1);
CNSTI4 1
ARGI4
ADDRGP4 UI_CinematicsMenu_f
CALLV
pop
line 2005
;2005:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1045
line 2008
;2006:	}
;2007:
;2008:	if ( Q_stricmp (cmd, "iamacheater") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1050
ARGP4
ADDRLP4 400
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
NEI4 $1048
line 2009
;2009:		UI_SPUnlock_f();
ADDRGP4 UI_SPUnlock_f
CALLV
pop
line 2010
;2010:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1048
line 2013
;2011:	}
;2012:
;2013:	if ( Q_stricmp (cmd, "iamamonkey") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1053
ARGP4
ADDRLP4 404
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 404
INDIRI4
CNSTI4 0
NEI4 $1051
line 2014
;2014:		UI_SPUnlockMedals_f();
ADDRGP4 UI_SPUnlockMedals_f
CALLV
pop
line 2015
;2015:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1051
line 2018
;2016:	}
;2017:
;2018:	if ( Q_stricmp (cmd, "uie_kickdupe") == 0 ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $1056
ARGP4
ADDRLP4 408
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 0
NEI4 $1054
line 2019
;2019:		UI_SPKickDupe_f();
ADDRGP4 UI_SPKickDupe_f
CALLV
pop
line 2020
;2020:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $672
JUMPV
LABELV $1054
line 2023
;2021:	}
;2022:
;2023:	return qfalse;
CNSTI4 0
RETI4
LABELV $672
endproc UI_ConsoleCommand 568 16
export UI_Shutdown
proc UI_Shutdown 0 0
line 2031
;2024:}
;2025:
;2026:/*
;2027:=================
;2028:UI_Shutdown
;2029:=================
;2030:*/
;2031:void UI_Shutdown( void ) {
line 2032
;2032:}
LABELV $1057
endproc UI_Shutdown 0 0
export UI_Init
proc UI_Init 4 4
line 2039
;2033:
;2034:/*
;2035:=================
;2036:UI_Init
;2037:=================
;2038:*/
;2039:void UI_Init( void ) {
line 2041
;2040:	
;2041:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 2043
;2042:
;2043:	UI_InitGameinfo();
ADDRGP4 UI_InitGameinfo
CALLV
pop
line 2046
;2044:
;2045:	// cache redundant calulations
;2046:	trap_GetGlconfig( &uis.glconfig );
ADDRGP4 uis+60
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 2050
;2047:	
;2048:
;2049:	// for native screen
;2050:	uis.sw = uis.glconfig.vidWidth;
ADDRGP4 uis+11460
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
ASGNF4
line 2051
;2051:	uis.sh = uis.glconfig.vidHeight;
ADDRGP4 uis+11464
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
ASGNF4
line 2055
;2052:	//uis.scale = uis.glconfig.vidHeight * (1.0/uis.glconfig.vidHeight);
;2053:	//uis.bias = 0;
;2054:	// for 640x480 virtualized screen
;2055:	uis.scale = (uis.glconfig.vidWidth * (1.0 / 640.0) < uis.glconfig.vidHeight * (1.0 / 480.0)) ? uis.glconfig.vidWidth * (1.0 / 640.0) : uis.glconfig.vidHeight * (1.0 / 480.0);
CNSTF4 986500301
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
MULF4
CNSTF4 990414985
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
MULF4
GEF4 $1076
ADDRLP4 0
CNSTF4 986500301
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRGP4 $1077
JUMPV
LABELV $1076
ADDRLP4 0
CNSTF4 990414985
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
LABELV $1077
ADDRGP4 uis+11444
ADDRLP4 0
INDIRF4
ASGNF4
line 2057
;2056:	
;2057:	if ( uis.glconfig.vidWidth * 480 > uis.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 uis+60+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uis+60+11308
INDIRI4
MULI4
LEI4 $1078
line 2059
;2058:		// wide screen
;2059:		uis.bias = 0.5 * ( uis.glconfig.vidWidth - ( uis.glconfig.vidHeight * (640.0 / 480.0) ) );
ADDRGP4 uis+11456
CNSTF4 1056964608
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 2060
;2060:	} else if ( uis.glconfig.vidWidth * 480 < uis.glconfig.vidHeight * 640 ) {
ADDRGP4 $1079
JUMPV
LABELV $1078
CNSTI4 480
ADDRGP4 uis+60+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uis+60+11308
INDIRI4
MULI4
GEI4 $1089
line 2062
;2061:		// 5:4 screen
;2062:		uis.bias = 0;
ADDRGP4 uis+11456
CNSTF4 0
ASGNF4
line 2063
;2063:	} else {
ADDRGP4 $1090
JUMPV
LABELV $1089
line 2065
;2064:		// no wide screen
;2065:		uis.bias = 0;
ADDRGP4 uis+11456
CNSTF4 0
ASGNF4
line 2066
;2066:	}
LABELV $1090
LABELV $1079
line 2069
;2067:
;2068:	// initialize the menu system
;2069:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 2071
;2070:
;2071:	uis.activemenu = NULL;
ADDRGP4 uis+24
CNSTP4 0
ASGNP4
line 2072
;2072:	uis.menusp     = 0;
ADDRGP4 uis+20
CNSTI4 0
ASGNI4
line 2073
;2073:}
LABELV $1058
endproc UI_Init 4 4
export UI_AdjustFrom640
proc UI_AdjustFrom640 20 0
line 2082
;2074:
;2075:/*
;2076:================
;2077:UI_AdjustFrom640
;2078:
;2079:Adjusted for resolution and screen aspect ratio
;2080:================
;2081:*/
;2082:void UI_AdjustFrom640( float *x, float *y, float *w, float *h ) {
line 2084
;2083:	// expect valid pointers
;2084:	*x = *x * uis.scale + uis.bias;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 uis+11444
INDIRF4
MULF4
ADDRGP4 uis+11456
INDIRF4
ADDF4
ASGNF4
line 2085
;2085:	*y *= uis.scale;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 2086
;2086:	*y += uis.menuscroll;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 uis+11468
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2087
;2087:	*w *= uis.scale;
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 2088
;2088:	*h *= uis.scale;
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRGP4 uis+11444
INDIRF4
MULF4
ASGNF4
line 2089
;2089:}
LABELV $1099
endproc UI_AdjustFrom640 20 0
export UI_DrawNamedPic
proc UI_DrawNamedPic 16 36
line 2092
;2090:
;2091:
;2092:void UI_DrawNamedPic( float x, float y, float width, float height, const char *picname ) {
line 2095
;2093:	qhandle_t	hShader;
;2094:
;2095:	hShader = trap_R_RegisterShaderNoMip( picname );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2096
;2096:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 2097
;2097:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2098
;2098:}
LABELV $1106
endproc UI_DrawNamedPic 16 36
export UI_DrawHandlePic
proc UI_DrawHandlePic 16 36
line 2100
;2099:
;2100:void UI_DrawHandlePic( float x, float y, float w, float h, qhandle_t hShader ) {
line 2106
;2101:	float	s0;
;2102:	float	s1;
;2103:	float	t0;
;2104:	float	t1;
;2105:
;2106:	if( w < 0 ) {	// flip about vertical
ADDRFP4 8
INDIRF4
CNSTF4 0
GEF4 $1108
line 2107
;2107:		w  = -w;
ADDRFP4 8
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
line 2108
;2108:		s0 = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 2109
;2109:		s1 = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 2110
;2110:	}
ADDRGP4 $1109
JUMPV
LABELV $1108
line 2111
;2111:	else {
line 2112
;2112:		s0 = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2113
;2113:		s1 = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 2114
;2114:	}
LABELV $1109
line 2116
;2115:
;2116:	if( h < 0 ) {	// flip about horizontal
ADDRFP4 12
INDIRF4
CNSTF4 0
GEF4 $1110
line 2117
;2117:		h  = -h;
ADDRFP4 12
ADDRFP4 12
INDIRF4
NEGF4
ASGNF4
line 2118
;2118:		t0 = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 2119
;2119:		t1 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 2120
;2120:	}
ADDRGP4 $1111
JUMPV
LABELV $1110
line 2121
;2121:	else {
line 2122
;2122:		t0 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 2123
;2123:		t1 = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 2124
;2124:	}
LABELV $1111
line 2126
;2125:	
;2126:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 2127
;2127:	trap_R_DrawStretchPic( x, y, w, h, s0, t0, s1, t1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2128
;2128:}
LABELV $1107
endproc UI_DrawHandlePic 16 36
export UI_DrawHandlePicFile
proc UI_DrawHandlePicFile 80 36
line 2130
;2129:
;2130:void UI_DrawHandlePicFile( float x, float y, float w, float h, const char* file ) {
line 2138
;2131:	float	s0;
;2132:	float	s1;
;2133:	float	t0;
;2134:	float	t1;
;2135:	int 	file_len;
;2136:	qhandle_t hShader;
;2137:	
;2138:	file_len = strlen(file);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 2140
;2139:	
;2140:	hShader = trap_R_RegisterShaderNoMip("mgui_e");
ADDRGP4 $1113
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 2141
;2141:	if (Q_stricmp(file + file_len - 4, ".ogg") == 0)
ADDRLP4 0
INDIRI4
ADDRFP4 16
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $1116
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $1114
line 2142
;2142:	hShader = trap_R_RegisterShaderNoMip("mgui_m");
ADDRGP4 $1117
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
LABELV $1114
line 2143
;2143:	if (Q_stricmp(file + file_len - 4, ".wav") == 0)
ADDRLP4 0
INDIRI4
ADDRFP4 16
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $1120
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1118
line 2144
;2144:	hShader = trap_R_RegisterShaderNoMip("mgui_m");
ADDRGP4 $1117
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $1118
line 2145
;2145:	if (Q_stricmp(file + file_len - 5, ".opus") == 0)
ADDRLP4 0
INDIRI4
ADDRFP4 16
INDIRP4
ADDP4
CNSTI4 -5
ADDP4
ARGP4
ADDRGP4 $1123
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $1121
line 2146
;2146:	hShader = trap_R_RegisterShaderNoMip("mgui_m");
ADDRGP4 $1117
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 52
INDIRI4
ASGNI4
LABELV $1121
line 2147
;2147:	if (Q_stricmp(file + file_len - 7, ".shader") == 0)
ADDRLP4 0
INDIRI4
ADDRFP4 16
INDIRP4
ADDP4
CNSTI4 -7
ADDP4
ARGP4
ADDRGP4 $1126
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $1124
line 2148
;2148:	hShader = trap_R_RegisterShaderNoMip("mgui_s");
ADDRGP4 $1127
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
ASGNI4
LABELV $1124
line 2149
;2149:	if (Q_stricmp(file + file_len - 3, ".as") == 0)
ADDRLP4 0
INDIRI4
ADDRFP4 16
INDIRP4
ADDP4
CNSTI4 -3
ADDP4
ARGP4
ADDRGP4 $1130
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $1128
line 2150
;2150:	hShader = trap_R_RegisterShaderNoMip("mgui_s");
ADDRGP4 $1127
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 68
INDIRI4
ASGNI4
LABELV $1128
line 2151
;2151:	if (Q_stricmp(file + file_len - 4, ".cfg") == 0)
ADDRLP4 0
INDIRI4
ADDRFP4 16
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $1133
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1131
line 2152
;2152:	hShader = trap_R_RegisterShaderNoMip("mgui_s");
ADDRGP4 $1127
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 76
INDIRI4
ASGNI4
LABELV $1131
line 2154
;2153:
;2154:	if( w < 0 ) {	// flip about vertical
ADDRFP4 8
INDIRF4
CNSTF4 0
GEF4 $1134
line 2155
;2155:		w  = -w;
ADDRFP4 8
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
line 2156
;2156:		s0 = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 2157
;2157:		s1 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 2158
;2158:	}
ADDRGP4 $1135
JUMPV
LABELV $1134
line 2159
;2159:	else {
line 2160
;2160:		s0 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 2161
;2161:		s1 = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 2162
;2162:	}
LABELV $1135
line 2164
;2163:
;2164:	if( h < 0 ) {	// flip about horizontal
ADDRFP4 12
INDIRF4
CNSTF4 0
GEF4 $1136
line 2165
;2165:		h  = -h;
ADDRFP4 12
ADDRFP4 12
INDIRF4
NEGF4
ASGNF4
line 2166
;2166:		t0 = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 2167
;2167:		t1 = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 2168
;2168:	}
ADDRGP4 $1137
JUMPV
LABELV $1136
line 2169
;2169:	else {
line 2170
;2170:		t0 = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 2171
;2171:		t1 = 1;
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
line 2172
;2172:	}
LABELV $1137
line 2174
;2173:	
;2174:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 2175
;2175:	trap_R_DrawStretchPic( x, y, w, h, s0, t0, s1, t1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2176
;2176:}
LABELV $1112
endproc UI_DrawHandlePicFile 80 36
export UI_DrawHandleModel
proc UI_DrawHandleModel 580 16
line 2178
;2177:
;2178:void UI_DrawHandleModel( float x, float y, float w, float h, const char* model, int scale ) {
line 2186
;2179:	refdef_t		refdef;
;2180:	refEntity_t		ent;
;2181:	vec3_t			origin;
;2182:	vec3_t			angles;
;2183:	
;2184:	// setup the refdef
;2185:
;2186:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 176
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2187
;2187:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 176+76
CNSTI4 1
ASGNI4
line 2188
;2188:	AxisClear( refdef.viewaxis );
ADDRLP4 176+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 2190
;2189:
;2190:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 2191
;2191:	refdef.x = x;
ADDRLP4 176
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 2192
;2192:	refdef.y = y;
ADDRLP4 176+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 2193
;2193:	refdef.width = w;
ADDRLP4 176+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 2194
;2194:	refdef.height = h;
ADDRLP4 176+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2196
;2195:
;2196:	refdef.fov_x = 90;
ADDRLP4 176+16
CNSTF4 1119092736
ASGNF4
line 2197
;2197:	refdef.fov_y = 90;
ADDRLP4 176+20
CNSTF4 1119092736
ASGNF4
line 2199
;2198:
;2199:	refdef.time = uis.realtime;
ADDRLP4 176+72
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 2201
;2200:
;2201:	origin[0] = scale;
ADDRLP4 544
ADDRFP4 20
INDIRI4
CVIF4 4
ASGNF4
line 2202
;2202:	origin[1] = 0;
ADDRLP4 544+4
CNSTF4 0
ASGNF4
line 2203
;2203:	origin[2] = 0;
ADDRLP4 544+8
CNSTF4 0
ASGNF4
line 2205
;2204:
;2205:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 2209
;2206:
;2207:	// add the model
;2208:
;2209:	memset( &ent, 0, sizeof(ent) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2211
;2210:
;2211:	VectorSet( angles, 0, 180 - 15, 0 );
ADDRLP4 556
CNSTF4 0
ASGNF4
ADDRLP4 556+4
CNSTF4 1126498304
ASGNF4
ADDRLP4 556+8
CNSTF4 0
ASGNF4
line 2212
;2212:	AnglesToAxis( angles, ent.axis );
ADDRLP4 556
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2213
;2213:	ent.hModel = trap_R_RegisterModel( model );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 568
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 568
INDIRI4
ASGNI4
line 2214
;2214:	ent.shaderRGBA[0] = 128;
ADDRLP4 0+116
CNSTU1 128
ASGNU1
line 2215
;2215:	ent.shaderRGBA[1] = 128;
ADDRLP4 0+116+1
CNSTU1 128
ASGNU1
line 2216
;2216:	ent.shaderRGBA[2] = 128;
ADDRLP4 0+116+2
CNSTU1 128
ASGNU1
line 2217
;2217:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2218
;2218:	VectorCopy( origin, ent.origin );
ADDRLP4 0+68
ADDRLP4 544
INDIRB
ASGNB 12
line 2219
;2219:	VectorCopy( origin, ent.lightingOrigin );
ADDRLP4 0+12
ADDRLP4 544
INDIRB
ASGNB 12
line 2220
;2220:	ent.renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 192
ASGNI4
line 2221
;2221:	VectorCopy( ent.origin, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2222
;2222:	ent.customSkin = trap_R_RegisterSkin(va("ptex/%s/%i.skin", model, 0));
ADDRGP4 $1167
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 572
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 572
INDIRP4
ARGP4
ADDRLP4 576
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRLP4 0+108
ADDRLP4 576
INDIRI4
ASGNI4
line 2224
;2223:
;2224:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2226
;2225:
;2226:	trap_R_RenderScene( &refdef );
ADDRLP4 176
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 2227
;2227:}
LABELV $1138
endproc UI_DrawHandleModel 580 16
export UI_DrawBackgroundPic
proc UI_DrawBackgroundPic 8 36
line 2229
;2228:
;2229:void UI_DrawBackgroundPic( qhandle_t hShader ) {
line 2230
;2230:	trap_R_DrawStretchPic( 0.0, 0.0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 1, 1, hShader );
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2231
;2231:}
LABELV $1168
endproc UI_DrawBackgroundPic 8 36
export vx
proc vx 8 0
line 2233
;2232:
;2233:int vx(float cord) {
line 2234
;2234:    float pos = uis.sw / 100.0; 
ADDRLP4 0
ADDRGP4 uis+11460
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 2235
;2235:    int result = cord * pos;
ADDRLP4 4
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2236
;2236:	return result;
ADDRLP4 4
INDIRI4
RETI4
LABELV $1173
endproc vx 8 0
export vy
proc vy 8 0
line 2239
;2237:}
;2238:
;2239:int vy(float cord) {
line 2240
;2240:    float pos = uis.sh / 100.0;  
ADDRLP4 0
ADDRGP4 uis+11464
INDIRF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 2241
;2241:    int result = cord * pos;
ADDRLP4 4
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2242
;2242:	return result;
ADDRLP4 4
INDIRI4
RETI4
LABELV $1175
endproc vy 8 0
export vxcalc
proc vxcalc 8 0
line 2245
;2243:}
;2244:
;2245:int vxcalc(float cord_percent) {
line 2246
;2246:    float scale_x = (float)uis.sw / 1920.0f; // Масштабный коэффициент для ширины экрана
ADDRLP4 0
ADDRGP4 uis+11460
INDIRF4
CNSTF4 1156579328
DIVF4
ASGNF4
line 2247
;2247:    int result = (int)(cord_percent * scale_x); // Масштабируем процентную координату по ширине экрана
ADDRLP4 4
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2248
;2248:    return result;
ADDRLP4 4
INDIRI4
RETI4
LABELV $1177
endproc vxcalc 8 0
export vycalc
proc vycalc 8 0
line 2251
;2249:}
;2250:
;2251:int vycalc(float cord_percent) {
line 2252
;2252:    float scale_y = (float)uis.sh / 1080.0f; // Масштабный коэффициент для высоты экрана
ADDRLP4 0
ADDRGP4 uis+11464
INDIRF4
CNSTF4 1149698048
DIVF4
ASGNF4
line 2253
;2253:    int result = (int)(cord_percent * scale_y); // Масштабируем процентную координату по высоте экрана
ADDRLP4 4
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2254
;2254:    return result;
ADDRLP4 4
INDIRI4
RETI4
LABELV $1179
endproc vycalc 8 0
export UI_FillRect2
proc UI_FillRect2 4 36
line 2264
;2255:}
;2256:
;2257:/*
;2258:================
;2259:UI_FillRect2
;2260:
;2261:Coordinates are 640*480 virtual values
;2262:=================
;2263:*/
;2264:void UI_FillRect2( float x, float y, float width, float height, const float *color ) {
line 2265
;2265:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2268
;2266:
;2267:	//UI_AdjustFrom640( &x, &y, &width, &height );
;2268:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2270
;2269:
;2270:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2271
;2271:}
LABELV $1181
endproc UI_FillRect2 4 36
export UI_DrawRoundedRect
proc UI_DrawRoundedRect 60 36
line 2273
;2272:
;2273:void UI_DrawRoundedRect(float x, float y, float width, float height, float radius, const float *color) {
line 2275
;2274:    
;2275:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 2277
;2276:	
;2277:	if(radius*2 > height){ radius=height*0.5; }
CNSTF4 1073741824
ADDRFP4 16
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
LEF4 $1184
ADDRFP4 16
CNSTF4 1056964608
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
LABELV $1184
line 2278
;2278:	if(radius*2 > width){ radius=width*0.5; }
CNSTF4 1073741824
ADDRFP4 16
INDIRF4
MULF4
ADDRFP4 8
INDIRF4
LEF4 $1186
ADDRFP4 16
CNSTF4 1056964608
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
LABELV $1186
line 2281
;2279:	
;2280:	// Рисование углов
;2281:	UI_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 2282
;2282:    trap_R_DrawStretchPic(x, y, radius, radius, 1, 0, 0, 1, uis.corner); // Левый верхний угол
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRFP4 16
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 uis+11432
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2283
;2283:    trap_R_DrawStretchPic(x + width - radius, y, radius, radius, 0, 0, 1, 1, uis.corner); // Правый верхний угол
ADDRLP4 12
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 uis+11432
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2284
;2284:    trap_R_DrawStretchPic(x, y + height - radius, radius, radius, 1, 1, 0, 0, uis.corner); // Левый нижний угол
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 24
INDIRF4
SUBF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 uis+11432
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2285
;2285:    trap_R_DrawStretchPic(x + width - radius, y + height - radius, radius, radius, 0, 1, 1, 0, uis.corner); // Правый нижний угол
ADDRLP4 36
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 36
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 36
INDIRF4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
CNSTF4 1065353216
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRGP4 uis+11432
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2288
;2286:
;2287:    // Рисование боковых сторон
;2288:    UI_FillRect2(x, y + radius, radius, height - (radius * 2), color); // Левая сторона
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 48
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRLP4 48
INDIRF4
ADDF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
CNSTF4 1073741824
ADDRLP4 48
INDIRF4
MULF4
SUBF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 UI_FillRect2
CALLV
pop
line 2289
;2289:    UI_FillRect2(x + width - radius, y + radius, radius, height - (radius * 2), color); // Правая сторона
ADDRLP4 52
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 52
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 52
INDIRF4
ADDF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
CNSTF4 1073741824
ADDRLP4 52
INDIRF4
MULF4
SUBF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 UI_FillRect2
CALLV
pop
line 2290
;2290:    UI_FillRect2(x + radius, y, width - (radius * 2), height, color); // Верхняя сторона
ADDRLP4 56
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 56
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1073741824
ADDRLP4 56
INDIRF4
MULF4
SUBF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 UI_FillRect2
CALLV
pop
line 2291
;2291:}
LABELV $1183
endproc UI_DrawRoundedRect 60 36
export UI_FillRect
proc UI_FillRect 4 36
line 2300
;2292:
;2293:/*
;2294:================
;2295:UI_FillRect
;2296:
;2297:Coordinates are 640*480 virtual values
;2298:=================
;2299:*/
;2300:void UI_FillRect( float x, float y, float width, float height, const float *color ) {
line 2301
;2301:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2303
;2302:
;2303:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 2304
;2304:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2306
;2305:
;2306:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2307
;2307:}
LABELV $1192
endproc UI_FillRect 4 36
export UI_DrawRect
proc UI_DrawRect 24 36
line 2316
;2308:
;2309:/*
;2310:================
;2311:UI_DrawRect
;2312:
;2313:Coordinates are 640*480 virtual values
;2314:=================
;2315:*/
;2316:void UI_DrawRect( float x, float y, float width, float height, const float *color ) {
line 2317
;2317:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2319
;2318:
;2319:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 2321
;2320:
;2321:	trap_R_DrawStretchPic( x, y, width, 1, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2322
;2322:	trap_R_DrawStretchPic( x, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2323
;2323:	trap_R_DrawStretchPic( x, y + height - 1, width, 1, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 8
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2324
;2324:	trap_R_DrawStretchPic( x + width - 1, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2326
;2325:
;2326:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2327
;2327:}
LABELV $1194
endproc UI_DrawRect 24 36
export UI_SetColor
proc UI_SetColor 0 4
line 2329
;2328:
;2329:void UI_SetColor( const float *rgba ) {
line 2330
;2330:	trap_R_SetColor( rgba );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2331
;2331:}
LABELV $1199
endproc UI_SetColor 0 4
export UI_UpdateScreen
proc UI_UpdateScreen 0 0
line 2333
;2332:
;2333:void UI_UpdateScreen( void ) {
line 2334
;2334:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 2335
;2335:}
LABELV $1200
endproc UI_UpdateScreen 0 0
export UI_Refresh
proc UI_Refresh 24 36
line 2343
;2336:
;2337:/*
;2338:=================
;2339:UI_Refresh
;2340:=================
;2341:*/
;2342:void UI_Refresh( int realtime )
;2343:{
line 2345
;2344:	int x;
;2345:	uis.frametime = realtime - uis.realtime;
ADDRGP4 uis
ADDRFP4 0
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
line 2346
;2346:	uis.realtime  = realtime;
ADDRGP4 uis+4
ADDRFP4 0
INDIRI4
ASGNI4
line 2348
;2347:
;2348:	if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
ADDRLP4 4
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $1204
line 2349
;2349:		return;
ADDRGP4 $1201
JUMPV
LABELV $1204
line 2352
;2350:	}
;2351:
;2352:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 2354
;2353:
;2354:	if ( uis.activemenu )
ADDRGP4 uis+24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1206
line 2355
;2355:	{
line 2356
;2356:		if (uis.activemenu->fullscreen)
ADDRGP4 uis+24
INDIRP4
CNSTI4 1052
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1209
line 2357
;2357:		{
line 2358
;2358:			if(!uis.onmap){
ADDRGP4 uis+11500
INDIRI4
CNSTI4 0
NEI4 $1212
line 2360
;2359:			// draw the background
;2360:			trap_R_DrawStretchPic( 0.0, 0.0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 1, 1, uis.menuWallpapers );
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 uis+11404
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2361
;2361:			}
LABELV $1212
line 2362
;2362:			trap_R_DrawStretchPic( 0.0, 0.0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 0.5, 1, trap_R_RegisterShaderNoMip( "menu/art/blacktrans" ) );
ADDRGP4 $1224
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1056964608
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2363
;2363:		}
LABELV $1209
line 2365
;2364:
;2365:		if (uis.activemenu->draw)
ADDRGP4 uis+24
INDIRP4
CNSTI4 1036
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1225
line 2366
;2366:			uis.activemenu->draw();
ADDRGP4 uis+24
INDIRP4
CNSTI4 1036
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $1226
JUMPV
LABELV $1225
line 2368
;2367:		else
;2368:			Menu_Draw( uis.activemenu );
ADDRGP4 uis+24
INDIRP4
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
LABELV $1226
line 2370
;2369:
;2370:		if( uis.firstdraw ) {
ADDRGP4 uis+11496
INDIRI4
CNSTI4 0
EQI4 $1230
line 2371
;2371:			UI_MouseEvent( 0, 0 );
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 UI_MouseEvent
CALLV
pop
line 2372
;2372:			uis.firstdraw = qfalse;
ADDRGP4 uis+11496
CNSTI4 0
ASGNI4
line 2373
;2373:		}
LABELV $1230
line 2374
;2374:	}
LABELV $1206
line 2376
;2375:	
;2376:	trap_GetGlconfig( &uis.glconfig );
ADDRGP4 uis+60
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 2378
;2377:
;2378:	if(uis.activemenu->native > 0){
ADDRGP4 uis+24
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1235
line 2379
;2379:		uis.scale = uis.glconfig.vidHeight * (1.0/uis.glconfig.vidHeight);
ADDRGP4 uis+11444
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
CNSTF4 1065353216
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
line 2380
;2380:		uis.bias = 0;
ADDRGP4 uis+11456
CNSTF4 0
ASGNF4
line 2381
;2381:	} else {
ADDRGP4 $1236
JUMPV
LABELV $1235
line 2382
;2382:		if ( uis.glconfig.vidWidth * 480 > uis.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 uis+60+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uis+60+11308
INDIRI4
MULI4
LEI4 $1244
line 2384
;2383:		// wide screen
;2384:		uis.bias = 0.5 * ( uis.glconfig.vidWidth - ( uis.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 uis+11456
CNSTF4 1056964608
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 2385
;2385:		uis.scale = uis.glconfig.vidHeight * (1.0/480.0);
ADDRGP4 uis+11444
CNSTF4 990414985
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 2386
;2386:		}
ADDRGP4 $1245
JUMPV
LABELV $1244
line 2387
;2387:		else {
line 2389
;2388:		// no wide screen
;2389:		uis.scale = (uis.glconfig.vidWidth * (1.0 / 640.0) < uis.glconfig.vidHeight * (1.0 / 480.0)) ? uis.glconfig.vidWidth * (1.0 / 640.0) : uis.glconfig.vidHeight * (1.0 / 480.0);
CNSTF4 986500301
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
MULF4
CNSTF4 990414985
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
MULF4
GEF4 $1268
ADDRLP4 8
CNSTF4 986500301
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRGP4 $1269
JUMPV
LABELV $1268
ADDRLP4 8
CNSTF4 990414985
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
LABELV $1269
ADDRGP4 uis+11444
ADDRLP4 8
INDIRF4
ASGNF4
line 2390
;2390:		uis.bias = 0;
ADDRGP4 uis+11456
CNSTF4 0
ASGNF4
line 2391
;2391:		}
LABELV $1245
line 2392
;2392:	}
LABELV $1236
line 2395
;2393:
;2394:	// draw cursor
;2395:	if (!uis.hideCursor) {
ADDRGP4 uis+16
INDIRI4
CNSTI4 0
NEI4 $1271
line 2396
;2396:		UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 2397
;2397:		if(uis.activemenu->native > 0){
ADDRGP4 uis+24
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1274
line 2398
;2398:		UI_DrawHandlePic( uis.cursorx-16*(uis.glconfig.vidWidth/640), uis.cursory-16*(uis.glconfig.vidWidth/640), 32*(uis.glconfig.vidWidth/640), 32*(uis.glconfig.vidWidth/640), uis.cursor);
ADDRLP4 8
CNSTI4 640
ASGNI4
ADDRLP4 12
CNSTI4 4
ASGNI4
ADDRGP4 uis+8
INDIRI4
ADDRGP4 uis+60+11304
INDIRI4
ADDRLP4 8
INDIRI4
DIVI4
ADDRLP4 12
INDIRI4
LSHI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 uis+12
INDIRI4
ADDRGP4 uis+60+11304
INDIRI4
ADDRLP4 8
INDIRI4
DIVI4
ADDRLP4 12
INDIRI4
LSHI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 16
CNSTI4 5
ASGNI4
ADDRGP4 uis+60+11304
INDIRI4
ADDRLP4 8
INDIRI4
DIVI4
ADDRLP4 16
INDIRI4
LSHI4
CVIF4 4
ARGF4
ADDRGP4 uis+60+11304
INDIRI4
ADDRLP4 8
INDIRI4
DIVI4
ADDRLP4 16
INDIRI4
LSHI4
CVIF4 4
ARGF4
ADDRGP4 uis+11428
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2399
;2399:		} else {
ADDRGP4 $1275
JUMPV
LABELV $1274
line 2400
;2400:		UI_DrawHandlePic( uis.cursorx-16, uis.cursory-16, 32, 32, uis.cursor);
ADDRLP4 8
CNSTI4 16
ASGNI4
ADDRGP4 uis+8
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 uis+12
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1107296256
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 uis+11428
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 2401
;2401:		}
LABELV $1275
line 2402
;2402:	}
LABELV $1271
line 2405
;2403:
;2404:#ifndef NDEBUG
;2405:	if (uis.debug)
ADDRGP4 uis+11392
INDIRI4
CNSTI4 0
EQI4 $1291
line 2406
;2406:	{
line 2408
;2407:		// cursor coordinates
;2408:		if(uis.activemenu->native){
ADDRGP4 uis+24
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1294
line 2409
;2409:			x = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2410
;2410:		} else {
ADDRGP4 $1295
JUMPV
LABELV $1294
line 2411
;2411:			x = 0-uis.wideoffset;
ADDRLP4 0
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 2412
;2412:		}
LABELV $1295
line 2413
;2413:		UI_DrawString( x, 0, va("cursor xy: (%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorRed );
ADDRGP4 $1298
ARGP4
ADDRGP4 uis+8
INDIRI4
ARGI4
ADDRGP4 uis+12
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 colorRed
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 2414
;2414:		UI_DrawString( x, 10, va("native: %i",uis.activemenu->native), UI_LEFT|UI_SMALLFONT, colorRed );
ADDRGP4 $1301
ARGP4
ADDRGP4 uis+24
INDIRP4
CNSTI4 1056
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 colorRed
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 2415
;2415:		UI_DrawString( x, 20, va("screen: %ix%i",uis.glconfig.vidWidth, uis.glconfig.vidHeight), UI_LEFT|UI_SMALLFONT, colorRed );
ADDRGP4 $1303
ARGP4
ADDRGP4 uis+60+11304
INDIRI4
ARGI4
ADDRGP4 uis+60+11308
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 colorRed
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 2416
;2416:		UI_DrawString( x, 30, va("map running: %i",uis.onmap), UI_LEFT|UI_SMALLFONT, colorRed );
ADDRGP4 $1308
ARGP4
ADDRGP4 uis+11500
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 30
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 colorRed
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 2417
;2417:	}
LABELV $1291
line 2423
;2418:#endif
;2419:
;2420:	// delay playing the enter sound until after the
;2421:	// menu has been drawn, to avoid delay while
;2422:	// caching images
;2423:	if (m_entersound)
ADDRGP4 m_entersound
INDIRI4
CNSTI4 0
EQI4 $1310
line 2424
;2424:	{
line 2425
;2425:		trap_S_StartLocalSound( menu_in_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_in_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2426
;2426:		m_entersound = qfalse;
ADDRGP4 m_entersound
CNSTI4 0
ASGNI4
line 2427
;2427:	}
LABELV $1310
line 2429
;2428:	
;2429:}
LABELV $1201
endproc UI_Refresh 24 36
export UI_DrawTextBox
proc UI_DrawTextBox 16 20
line 2432
;2430:
;2431:void UI_DrawTextBox (int x, int y, int width, int lines)
;2432:{
line 2433
;2433:	UI_FillRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorBlack );
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ADDRLP4 0
INDIRI4
DIVI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
ADDRLP4 0
INDIRI4
DIVI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 2434
;2434:	UI_DrawRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorWhite );
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ADDRLP4 8
INDIRI4
DIVI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
ADDRLP4 8
INDIRI4
DIVI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 2435
;2435:}
LABELV $1312
endproc UI_DrawTextBox 16 20
export UI_CursorInRect
proc UI_CursorInRect 8 0
line 2438
;2436:
;2437:qboolean UI_CursorInRect (int x, int y, int width, int height)
;2438:{
line 2439
;2439:	if (uis.cursorx < x ||
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $1330
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 uis+12
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $1330
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
GTI4 $1330
ADDRGP4 uis+12
INDIRI4
ADDRLP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
LEI4 $1322
LABELV $1330
line 2443
;2440:		uis.cursory < y ||
;2441:		uis.cursorx > x+width ||
;2442:		uis.cursory > y+height)
;2443:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1321
JUMPV
LABELV $1322
line 2445
;2444:
;2445:	return qtrue;
CNSTI4 1
RETI4
LABELV $1321
endproc UI_CursorInRect 8 0
import trap_System
import trap_R_RemapShader
import UI_MGUI_Clear
import UI_SystemConfigMenu
import UI_MGUI_Edit
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
bss
export uis
align 4
LABELV uis
skip 11508
export m_entersound
align 4
LABELV m_entersound
skip 4
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
LABELV $1308
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1303
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 120
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1301
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1298
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 32
byte 1 120
byte 1 121
byte 1 58
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 44
byte 1 37
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $1224
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
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $1167
byte 1 112
byte 1 116
byte 1 101
byte 1 120
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 105
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1133
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $1130
byte 1 46
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $1127
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 0
align 1
LABELV $1126
byte 1 46
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1123
byte 1 46
byte 1 111
byte 1 112
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1120
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1117
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 0
align 1
LABELV $1116
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $1113
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 95
byte 1 101
byte 1 0
align 1
LABELV $1056
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
byte 1 0
align 1
LABELV $1053
byte 1 105
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 111
byte 1 110
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $1050
byte 1 105
byte 1 97
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1047
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1044
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1041
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $1038
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $1035
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1032
byte 1 115
byte 1 101
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1029
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1026
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
LABELV $1023
byte 1 119
byte 1 111
byte 1 114
byte 1 107
byte 1 115
byte 1 104
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $984
byte 1 102
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $981
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $980
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $977
byte 1 115
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $976
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $973
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $972
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $969
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $966
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $963
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $962
byte 1 97
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $959
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $948
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $945
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $940
byte 1 47
byte 1 61
byte 1 0
align 1
LABELV $937
byte 1 42
byte 1 61
byte 1 0
align 1
LABELV $934
byte 1 45
byte 1 61
byte 1 0
align 1
LABELV $931
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $930
byte 1 43
byte 1 61
byte 1 0
align 1
LABELV $927
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $922
byte 1 62
byte 1 61
byte 1 0
align 1
LABELV $917
byte 1 60
byte 1 61
byte 1 0
align 1
LABELV $912
byte 1 62
byte 1 0
align 1
LABELV $907
byte 1 60
byte 1 0
align 1
LABELV $902
byte 1 33
byte 1 61
byte 1 61
byte 1 0
align 1
LABELV $897
byte 1 33
byte 1 61
byte 1 0
align 1
LABELV $892
byte 1 61
byte 1 61
byte 1 0
align 1
LABELV $889
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $886
byte 1 61
byte 1 0
align 1
LABELV $883
byte 1 105
byte 1 102
byte 1 0
align 1
LABELV $880
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $879
byte 1 115
byte 1 121
byte 1 115
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $876
byte 1 97
byte 1 115
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $873
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 112
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $872
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 112
byte 1 105
byte 1 0
align 1
LABELV $869
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 34
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 47
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $868
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 0
align 1
LABELV $865
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $864
byte 1 99
byte 1 111
byte 1 110
byte 1 99
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $861
byte 1 114
byte 1 101
byte 1 109
byte 1 97
byte 1 112
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $858
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $857
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 10
byte 1 0
align 1
LABELV $856
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $855
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $854
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $853
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $852
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $851
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $850
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 105
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 65
byte 1 10
byte 1 0
align 1
LABELV $849
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 105
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 66
byte 1 10
byte 1 0
align 1
LABELV $848
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 105
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 71
byte 1 10
byte 1 0
align 1
LABELV $847
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 105
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $846
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 65
byte 1 10
byte 1 0
align 1
LABELV $845
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 66
byte 1 10
byte 1 0
align 1
LABELV $844
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 71
byte 1 10
byte 1 0
align 1
LABELV $843
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $842
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $841
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $840
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 51
byte 1 48
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $839
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 57
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $838
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 56
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $837
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 55
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $836
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 54
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $835
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 53
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $834
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 52
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $833
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 51
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $832
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 50
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $831
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 49
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $830
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 48
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $829
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 57
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $828
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 56
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $827
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 55
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $826
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 54
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $825
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 53
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $824
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 52
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $823
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 51
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $822
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 50
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $821
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 49
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $820
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 48
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $819
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 57
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $818
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 56
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $817
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 55
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $816
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 54
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $815
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 53
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $814
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 52
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $813
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 51
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $812
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 50
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $811
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 49
byte 1 97
byte 1 114
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $810
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $809
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $808
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $807
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 104
byte 1 10
byte 1 0
align 1
LABELV $806
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 119
byte 1 10
byte 1 0
align 1
LABELV $805
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 104
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $804
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 119
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $803
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $802
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 120
byte 1 10
byte 1 0
align 1
LABELV $801
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 121
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $800
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 120
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $799
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $798
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 37
byte 1 105
byte 1 95
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $793
byte 1 117
byte 1 110
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $792
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 95
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $789
byte 1 117
byte 1 105
byte 1 95
byte 1 119
byte 1 111
byte 1 114
byte 1 107
byte 1 115
byte 1 104
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $786
byte 1 117
byte 1 105
byte 1 95
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 0
align 1
LABELV $783
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $780
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $777
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $774
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $771
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $768
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $765
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $762
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $759
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 0
align 1
LABELV $756
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $753
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $750
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $747
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 48
byte 1 0
align 1
LABELV $744
byte 1 117
byte 1 105
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $741
byte 1 117
byte 1 105
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $738
byte 1 117
byte 1 105
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $735
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $732
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 119
byte 1 111
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $729
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $726
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $723
byte 1 117
byte 1 105
byte 1 95
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $720
byte 1 117
byte 1 105
byte 1 95
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $717
byte 1 117
byte 1 105
byte 1 95
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $714
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $711
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 50
byte 1 0
align 1
LABELV $708
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $705
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 48
byte 1 0
align 1
LABELV $702
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $699
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $696
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $693
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $690
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 100
byte 1 118
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $687
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $684
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $681
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $678
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $675
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $526
byte 1 85
byte 1 73
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $524
byte 1 49
byte 1 0
align 1
LABELV $522
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $520
byte 1 73
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 67
byte 1 68
byte 1 0
align 1
LABELV $515
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 32
byte 1 49
byte 1 59
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $508
byte 1 99
byte 1 108
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $496
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $154
byte 1 48
byte 1 0
align 1
LABELV $153
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $125
byte 1 85
byte 1 73
byte 1 95
byte 1 80
byte 1 117
byte 1 115
byte 1 104
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $108
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $100
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $91
byte 1 100
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $82
byte 1 37
byte 1 115
byte 1 0
