code
proc ConfirmMenu_Event 4 4
file "../../../code/q3_ui/ui_confirm.c"
line 45
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:CONFIRMATION MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define ART_CONFIRM_FRAME	"menu/art/cut_frame"
;16:
;17:#define ID_CONFIRM_NO		10
;18:#define ID_CONFIRM_YES		11
;19:
;20:
;21:typedef struct {
;22:	menuframework_s menu;
;23:
;24:	menutext_s		no;
;25:	menutext_s		yes;
;26:
;27:	int				slashX;
;28:	const char *	question;
;29:	void			(*draw)( void );
;30:	void			(*action)( qboolean result );
;31:	
;32:	int style;
;33:	const char **lines;
;34:} confirmMenu_t;
;35:
;36:
;37:static confirmMenu_t	s_confirm;
;38:
;39:
;40:/*
;41:=================
;42:ConfirmMenu_Event
;43:=================
;44:*/
;45:static void ConfirmMenu_Event( void* ptr, int event ) {
line 48
;46:	qboolean	result;
;47:
;48:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 49
;49:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 52
;50:	}
;51:
;52:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 54
;53:
;54:	if( ((menucommon_s*)ptr)->id == ID_CONFIRM_NO ) {
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 10
NEI4 $84
line 55
;55:		result = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 56
;56:	}
ADDRGP4 $85
JUMPV
LABELV $84
line 57
;57:	else {
line 58
;58:		result = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 59
;59:	}
LABELV $85
line 61
;60:
;61:	if( s_confirm.action ) {
ADDRGP4 s_confirm+1296
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $86
line 62
;62:		s_confirm.action( result );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 s_confirm+1296
INDIRP4
CALLV
pop
line 63
;63:	}
LABELV $86
line 64
;64:}
LABELV $81
endproc ConfirmMenu_Event 4 4
proc ConfirmMenu_Key 32 8
line 72
;65:
;66:
;67:/*
;68:=================
;69:ConfirmMenu_Key
;70:=================
;71:*/
;72:static sfxHandle_t ConfirmMenu_Key( int key ) {
line 73
;73:	switch ( key ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 110
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $94
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $99
LABELV $98
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
CNSTI4 78
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $94
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $91
LABELV $100
ADDRFP4 0
INDIRI4
CNSTI4 89
EQI4 $96
ADDRGP4 $91
JUMPV
LABELV $99
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 134
EQI4 $93
ADDRLP4 20
CNSTI4 135
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $93
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
GTI4 $102
LABELV $101
ADDRFP4 0
INDIRI4
CNSTI4 121
EQI4 $96
ADDRGP4 $91
JUMPV
LABELV $102
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 163
EQI4 $93
ADDRLP4 24
INDIRI4
CNSTI4 165
EQI4 $93
ADDRGP4 $91
JUMPV
LABELV $93
line 78
;74:	case K_KP_LEFTARROW:
;75:	case K_LEFTARROW:
;76:	case K_KP_RIGHTARROW:
;77:	case K_RIGHTARROW:
;78:		key = K_TAB;
ADDRFP4 0
CNSTI4 9
ASGNI4
line 79
;79:		break;
ADDRGP4 $92
JUMPV
LABELV $94
line 83
;80:
;81:	case 'n':
;82:	case 'N':
;83:		ConfirmMenu_Event( &s_confirm.no, QM_ACTIVATED );
ADDRGP4 s_confirm+1076
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 ConfirmMenu_Event
CALLV
pop
line 84
;84:		break;
ADDRGP4 $92
JUMPV
LABELV $96
line 88
;85:
;86:	case 'y':
;87:	case 'Y':
;88:		ConfirmMenu_Event( &s_confirm.yes, QM_ACTIVATED );
ADDRGP4 s_confirm+1180
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 ConfirmMenu_Event
CALLV
pop
line 89
;89:		break;
LABELV $91
LABELV $92
line 92
;90:	}
;91:
;92:	return Menu_DefaultKey( &s_confirm.menu, key );
ADDRGP4 s_confirm
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
LABELV $90
endproc ConfirmMenu_Key 32 8
proc MessageMenu_Draw 8 20
line 101
;93:}
;94:
;95:
;96:/*
;97:=================
;98:MessaheMenu_Draw
;99:=================
;100:*/
;101:static void MessageMenu_Draw( void ) {
line 104
;102:	int i,y;
;103:	
;104:	UI_DrawNamedPic( 142, 118, 359, 256, ART_CONFIRM_FRAME );
CNSTF4 1124990976
ARGF4
CNSTF4 1122762752
ARGF4
CNSTF4 1135837184
ARGF4
CNSTF4 1132462080
ARGF4
ADDRGP4 $104
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 106
;105:	
;106:	y = 188;
ADDRLP4 4
CNSTI4 188
ASGNI4
line 107
;107:	for(i=0; s_confirm.lines[i]; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $105
line 108
;108:	{
line 109
;109:		UI_DrawString( 320, y, s_confirm.lines[i], s_confirm.style, color_red );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_confirm+1304
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_confirm+1300
INDIRI4
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 110
;110:		y += 18;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 111
;111:	}
LABELV $106
line 107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_confirm+1304
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $105
line 113
;112:
;113:	Menu_Draw( &s_confirm.menu );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 115
;114:
;115:	if( s_confirm.draw ) {
ADDRGP4 s_confirm+1292
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $112
line 116
;116:		s_confirm.draw();
ADDRGP4 s_confirm+1292
INDIRP4
CALLV
pop
line 117
;117:	}
LABELV $112
line 118
;118:}
LABELV $103
endproc MessageMenu_Draw 8 20
proc ConfirmMenu_Draw 0 20
line 125
;119:
;120:/*
;121:=================
;122:ConfirmMenu_Draw
;123:=================
;124:*/
;125:static void ConfirmMenu_Draw( void ) {
line 126
;126:	UI_DrawNamedPic( 142, 118, 359, 256, ART_CONFIRM_FRAME );
CNSTF4 1124990976
ARGF4
CNSTF4 1122762752
ARGF4
CNSTF4 1135837184
ARGF4
CNSTF4 1132462080
ARGF4
ADDRGP4 $104
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 127
;127:	UI_DrawString( 320, 204, s_confirm.question, s_confirm.style, color_red );
CNSTI4 320
ARGI4
CNSTI4 204
ARGI4
ADDRGP4 s_confirm+1288
INDIRP4
ARGP4
ADDRGP4 s_confirm+1300
INDIRI4
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 128
;128:	UI_DrawString( s_confirm.slashX, 265, "/", UI_LEFT|UI_INVERSE, color_red );
ADDRGP4 s_confirm+1284
INDIRI4
ARGI4
CNSTI4 265
ARGI4
ADDRGP4 $120
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 130
;129:
;130:	Menu_Draw( &s_confirm.menu );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 132
;131:
;132:	if( s_confirm.draw ) {
ADDRGP4 s_confirm+1292
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $121
line 133
;133:		s_confirm.draw();
ADDRGP4 s_confirm+1292
INDIRP4
CALLV
pop
line 134
;134:	}
LABELV $121
line 135
;135:}
LABELV $116
endproc ConfirmMenu_Draw 0 20
export ConfirmMenu_Cache
proc ConfirmMenu_Cache 0 4
line 143
;136:
;137:
;138:/*
;139:=================
;140:ConfirmMenu_Cache
;141:=================
;142:*/
;143:void ConfirmMenu_Cache( void ) {
line 144
;144:	trap_R_RegisterShaderNoMip( ART_CONFIRM_FRAME );
ADDRGP4 $104
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 145
;145:}
LABELV $125
endproc ConfirmMenu_Cache 0 4
export UI_ConfirmMenu_Style
proc UI_ConfirmMenu_Style 3120 12
line 153
;146:
;147:
;148:/*
;149:=================
;150:UI_ConfirmMenu_Stlye
;151:=================
;152:*/
;153:void UI_ConfirmMenu_Style( const char *question, int style, void (*draw)( void ), void (*action)( qboolean result ) ) {
line 159
;154:	uiClientState_t	cstate;
;155:	int	n1, n2, n3;
;156:	int	l1, l2, l3;
;157:
;158:	// zero set all our globals
;159:	memset( &s_confirm, 0, sizeof(s_confirm) );
ADDRGP4 s_confirm
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1308
ARGI4
ADDRGP4 memset
CALLP4
pop
line 161
;160:
;161:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 163
;162:
;163:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $127
line 164
;164:	n1 = UI_ProportionalStringWidth( "YES/NO" );
ADDRGP4 $130
ARGP4
ADDRLP4 3108
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3092
ADDRLP4 3108
INDIRI4
ASGNI4
line 165
;165:	n2 = UI_ProportionalStringWidth( "YES" ) + PROP_GAP_WIDTH;
ADDRGP4 $131
ARGP4
ADDRLP4 3112
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3096
ADDRLP4 3112
INDIRI4
ADDRGP4 cl_propgapwidth+12
INDIRI4
ADDI4
ASGNI4
line 166
;166:	n3 = UI_ProportionalStringWidth( "/" )  + PROP_GAP_WIDTH;
ADDRGP4 $120
ARGP4
ADDRLP4 3116
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3100
ADDRLP4 3116
INDIRI4
ADDRGP4 cl_propgapwidth+12
INDIRI4
ADDI4
ASGNI4
line 167
;167:}
LABELV $127
line 168
;168:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $134
line 169
;169:	n1 = UI_ProportionalStringWidth( "ДА/НЕТ" );
ADDRGP4 $137
ARGP4
ADDRLP4 3108
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3092
ADDRLP4 3108
INDIRI4
ASGNI4
line 170
;170:	n2 = UI_ProportionalStringWidth( "ДА" ) + PROP_GAP_WIDTH;
ADDRGP4 $138
ARGP4
ADDRLP4 3112
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3096
ADDRLP4 3112
INDIRI4
ADDRGP4 cl_propgapwidth+12
INDIRI4
ADDI4
ASGNI4
line 171
;171:	n3 = UI_ProportionalStringWidth( "/" )  + PROP_GAP_WIDTH;
ADDRGP4 $120
ARGP4
ADDRLP4 3116
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3100
ADDRLP4 3116
INDIRI4
ADDRGP4 cl_propgapwidth+12
INDIRI4
ADDI4
ASGNI4
line 172
;172:}
LABELV $134
line 173
;173:	l1 = 320 - ( n1 / 2 );
ADDRLP4 0
CNSTI4 320
ADDRLP4 3092
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 174
;174:	l2 = l1 + n2;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 3096
INDIRI4
ADDI4
ASGNI4
line 175
;175:	l3 = l2 + n3;
ADDRLP4 3104
ADDRLP4 4
INDIRI4
ADDRLP4 3100
INDIRI4
ADDI4
ASGNI4
line 176
;176:	s_confirm.slashX = l2;
ADDRGP4 s_confirm+1284
ADDRLP4 4
INDIRI4
ASGNI4
line 178
;177:
;178:	s_confirm.question = question;
ADDRGP4 s_confirm+1288
ADDRFP4 0
INDIRP4
ASGNP4
line 179
;179:	s_confirm.draw = draw;
ADDRGP4 s_confirm+1292
ADDRFP4 8
INDIRP4
ASGNP4
line 180
;180:	s_confirm.action = action;
ADDRGP4 s_confirm+1296
ADDRFP4 12
INDIRP4
ASGNP4
line 181
;181:	s_confirm.style = style;
ADDRGP4 s_confirm+1300
ADDRFP4 4
INDIRI4
ASGNI4
line 183
;182:
;183:	s_confirm.menu.draw       = ConfirmMenu_Draw;
ADDRGP4 s_confirm+1036
ADDRGP4 ConfirmMenu_Draw
ASGNP4
line 184
;184:	s_confirm.menu.key        = ConfirmMenu_Key;
ADDRGP4 s_confirm+1040
ADDRGP4 ConfirmMenu_Key
ASGNP4
line 185
;185:	s_confirm.menu.wrapAround = qtrue;
ADDRGP4 s_confirm+1044
CNSTI4 1
ASGNI4
line 186
;186:	s_confirm.menu.native 	  = qfalse;
ADDRGP4 s_confirm+1056
CNSTI4 0
ASGNI4
line 188
;187:
;188:	trap_GetClientState( &cstate );
ADDRLP4 8
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 189
;189:	if ( cstate.connState >= CA_CONNECTED ) {
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $150
line 190
;190:		s_confirm.menu.fullscreen = qfalse;
ADDRGP4 s_confirm+1052
CNSTI4 0
ASGNI4
line 191
;191:	}
ADDRGP4 $151
JUMPV
LABELV $150
line 192
;192:	else {
line 193
;193:		s_confirm.menu.fullscreen = qtrue;
ADDRGP4 s_confirm+1052
CNSTI4 1
ASGNI4
line 194
;194:	}
LABELV $151
line 196
;195:
;196:	s_confirm.yes.generic.type		= MTYPE_PTEXT;      
ADDRGP4 s_confirm+1180
CNSTI4 9
ASGNI4
line 197
;197:	s_confirm.yes.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS; 
ADDRGP4 s_confirm+1180+72
CNSTU4 260
ASGNU4
line 198
;198:	s_confirm.yes.generic.callback	= ConfirmMenu_Event;
ADDRGP4 s_confirm+1180+76
ADDRGP4 ConfirmMenu_Event
ASGNP4
line 199
;199:	s_confirm.yes.generic.id		= ID_CONFIRM_YES;
ADDRGP4 s_confirm+1180+24
CNSTI4 11
ASGNI4
line 200
;200:	s_confirm.yes.generic.x			= l1;
ADDRGP4 s_confirm+1180+28
ADDRLP4 0
INDIRI4
ASGNI4
line 201
;201:	s_confirm.yes.generic.y			= 264;
ADDRGP4 s_confirm+1180+32
CNSTI4 264
ASGNI4
line 202
;202:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $165
line 203
;203:	s_confirm.yes.string			= "YES";
ADDRGP4 s_confirm+1180+88
ADDRGP4 $131
ASGNP4
line 204
;204:	}
LABELV $165
line 205
;205:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $170
line 206
;206:	s_confirm.yes.string			= "ДА";
ADDRGP4 s_confirm+1180+88
ADDRGP4 $138
ASGNP4
line 207
;207:	}
LABELV $170
line 208
;208:	s_confirm.yes.color				= color_red;
ADDRGP4 s_confirm+1180+100
ADDRGP4 color_red
ASGNP4
line 209
;209:	s_confirm.yes.style				= UI_LEFT;
ADDRGP4 s_confirm+1180+92
CNSTI4 0
ASGNI4
line 211
;210:
;211:	s_confirm.no.generic.type		= MTYPE_PTEXT;      
ADDRGP4 s_confirm+1076
CNSTI4 9
ASGNI4
line 212
;212:	s_confirm.no.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS; 
ADDRGP4 s_confirm+1076+72
CNSTU4 260
ASGNU4
line 213
;213:	s_confirm.no.generic.callback	= ConfirmMenu_Event;
ADDRGP4 s_confirm+1076+76
ADDRGP4 ConfirmMenu_Event
ASGNP4
line 214
;214:	s_confirm.no.generic.id			= ID_CONFIRM_NO;
ADDRGP4 s_confirm+1076+24
CNSTI4 10
ASGNI4
line 215
;215:	s_confirm.no.generic.x		    = l3;
ADDRGP4 s_confirm+1076+28
ADDRLP4 3104
INDIRI4
ASGNI4
line 216
;216:	s_confirm.no.generic.y		    = 264;
ADDRGP4 s_confirm+1076+32
CNSTI4 264
ASGNI4
line 217
;217:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $190
line 218
;218:	s_confirm.no.string				= "NO";
ADDRGP4 s_confirm+1076+88
ADDRGP4 $195
ASGNP4
line 219
;219:	}
LABELV $190
line 220
;220:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $196
line 221
;221:	s_confirm.no.string				= "НЕТ";
ADDRGP4 s_confirm+1076+88
ADDRGP4 $201
ASGNP4
line 222
;222:	}
LABELV $196
line 223
;223:	s_confirm.no.color			    = color_red;
ADDRGP4 s_confirm+1076+100
ADDRGP4 color_red
ASGNP4
line 224
;224:	s_confirm.no.style			    = UI_LEFT;
ADDRGP4 s_confirm+1076+92
CNSTI4 0
ASGNI4
line 226
;225:
;226:	Menu_AddItem( &s_confirm.menu,	&s_confirm.yes );             
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 227
;227:	Menu_AddItem( &s_confirm.menu,	&s_confirm.no );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 229
;228:
;229:	UI_PushMenu( &s_confirm.menu );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 231
;230:
;231:	Menu_SetCursorToItem( &s_confirm.menu, &s_confirm.no );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+1076
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 232
;232:}
LABELV $126
endproc UI_ConfirmMenu_Style 3120 12
export UI_ConfirmMenu
proc UI_ConfirmMenu 0 16
line 239
;233:
;234:/*
;235:=================
;236:UI_ConfirmMenu
;237:=================
;238:*/
;239:void UI_ConfirmMenu( const char *question, void (*draw)( void ), void (*action)( qboolean result ) ) {
line 240
;240:	UI_ConfirmMenu_Style(question, UI_CENTER|UI_INVERSE, draw, action);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8193
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 UI_ConfirmMenu_Style
CALLV
pop
line 241
;241:}
LABELV $209
endproc UI_ConfirmMenu 0 16
export UI_Message
proc UI_Message 3096 12
line 249
;242:
;243:/*
;244:=================
;245:UI_Message
;246:hacked over from Confirm stuff
;247:=================
;248:*/
;249:void UI_Message( const char **lines ) {
line 254
;250:	uiClientState_t	cstate;
;251:	int n1, l1;
;252:	
;253:	// zero set all our globals
;254:	memset( &s_confirm, 0, sizeof(s_confirm) );
ADDRGP4 s_confirm
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1308
ARGI4
ADDRGP4 memset
CALLP4
pop
line 256
;255:
;256:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 258
;257:
;258:	n1 = UI_ProportionalStringWidth( "OK" );
ADDRGP4 $211
ARGP4
ADDRLP4 3092
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3084
ADDRLP4 3092
INDIRI4
ASGNI4
line 259
;259:	l1 = 320 - ( n1 / 2 );
ADDRLP4 3088
CNSTI4 320
ADDRLP4 3084
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 261
;260:	
;261:	s_confirm.lines = lines;
ADDRGP4 s_confirm+1304
ADDRFP4 0
INDIRP4
ASGNP4
line 262
;262:	s_confirm.style = UI_CENTER|UI_INVERSE|UI_SMALLFONT;
ADDRGP4 s_confirm+1300
CNSTI4 8209
ASGNI4
line 264
;263:
;264:	s_confirm.menu.draw       = MessageMenu_Draw;
ADDRGP4 s_confirm+1036
ADDRGP4 MessageMenu_Draw
ASGNP4
line 265
;265:	s_confirm.menu.key        = ConfirmMenu_Key;
ADDRGP4 s_confirm+1040
ADDRGP4 ConfirmMenu_Key
ASGNP4
line 266
;266:	s_confirm.menu.wrapAround = qtrue;
ADDRGP4 s_confirm+1044
CNSTI4 1
ASGNI4
line 267
;267:	s_confirm.menu.native 	  = qfalse;
ADDRGP4 s_confirm+1056
CNSTI4 0
ASGNI4
line 269
;268:	
;269:	trap_GetClientState( &cstate );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 270
;270:	if ( cstate.connState >= CA_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $218
line 271
;271:		s_confirm.menu.fullscreen = qfalse;
ADDRGP4 s_confirm+1052
CNSTI4 0
ASGNI4
line 272
;272:	}
ADDRGP4 $219
JUMPV
LABELV $218
line 273
;273:	else {
line 274
;274:		s_confirm.menu.fullscreen = qtrue;
ADDRGP4 s_confirm+1052
CNSTI4 1
ASGNI4
line 275
;275:	}
LABELV $219
line 277
;276:
;277:	s_confirm.yes.generic.type		= MTYPE_PTEXT;      
ADDRGP4 s_confirm+1180
CNSTI4 9
ASGNI4
line 278
;278:	s_confirm.yes.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS; 
ADDRGP4 s_confirm+1180+72
CNSTU4 260
ASGNU4
line 279
;279:	s_confirm.yes.generic.callback	= ConfirmMenu_Event;
ADDRGP4 s_confirm+1180+76
ADDRGP4 ConfirmMenu_Event
ASGNP4
line 280
;280:	s_confirm.yes.generic.id		= ID_CONFIRM_YES;
ADDRGP4 s_confirm+1180+24
CNSTI4 11
ASGNI4
line 281
;281:	s_confirm.yes.generic.x			= l1;
ADDRGP4 s_confirm+1180+28
ADDRLP4 3088
INDIRI4
ASGNI4
line 282
;282:	s_confirm.yes.generic.y			= 280;
ADDRGP4 s_confirm+1180+32
CNSTI4 280
ASGNI4
line 283
;283:	s_confirm.yes.string			= "OK";
ADDRGP4 s_confirm+1180+88
ADDRGP4 $211
ASGNP4
line 284
;284:	s_confirm.yes.color				= color_red;
ADDRGP4 s_confirm+1180+100
ADDRGP4 color_red
ASGNP4
line 285
;285:	s_confirm.yes.style				= UI_LEFT;
ADDRGP4 s_confirm+1180+92
CNSTI4 0
ASGNI4
line 287
;286:
;287:	Menu_AddItem( &s_confirm.menu,	&s_confirm.yes );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 289
;288:	
;289:	UI_PushMenu( &s_confirm.menu );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 291
;290:
;291:	Menu_SetCursorToItem( &s_confirm.menu, &s_confirm.yes );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+1180
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 292
;292:}
LABELV $210
endproc UI_Message 3096 12
bss
align 4
LABELV s_confirm
skip 1308
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
LABELV $211
byte 1 79
byte 1 75
byte 1 0
align 1
LABELV $201
byte 1 208
byte 1 157
byte 1 208
byte 1 149
byte 1 208
byte 1 162
byte 1 0
align 1
LABELV $195
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $138
byte 1 208
byte 1 148
byte 1 208
byte 1 144
byte 1 0
align 1
LABELV $137
byte 1 208
byte 1 148
byte 1 208
byte 1 144
byte 1 47
byte 1 208
byte 1 157
byte 1 208
byte 1 149
byte 1 208
byte 1 162
byte 1 0
align 1
LABELV $131
byte 1 89
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $130
byte 1 89
byte 1 69
byte 1 83
byte 1 47
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $120
byte 1 47
byte 1 0
align 1
LABELV $104
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
byte 1 117
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
