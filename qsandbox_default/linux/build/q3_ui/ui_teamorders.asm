data
align 4
LABELV ctfOrders
address $81
address $82
address $83
address $84
address $85
address $86
address $87
byte 4 0
align 4
LABELV ctfMessages
address $88
address $89
address $90
address $91
address $92
address $93
address $94
byte 4 0
align 4
LABELV teamOrders
address $81
address $83
address $95
address $85
address $86
address $87
byte 4 0
align 4
LABELV teamMessages
address $88
address $90
address $96
address $92
address $93
address $94
byte 4 0
code
proc UI_TeamOrdersMenu_BackEvent 0 0
file "../../../code/q3_ui/ui_teamorders.c"
line 95
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:TEAM ORDERS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:
;13:
;14:
;15:
;16:#include "ui_local.h"
;17:
;18:
;19:#define ART_FRAME		"menu/art/addbotframe"
;20:#define ART_BACK0		"menu/art/back_0"
;21:#define ART_BACK1		"menu/art/back_1"	
;22:
;23:#define ID_LIST_BOTS		10
;24:#define ID_LIST_CTF_ORDERS	11
;25:#define ID_LIST_TEAM_ORDERS	12
;26:
;27:
;28:typedef struct {
;29:	menuframework_s	menu;
;30:
;31:	menutext_s		banner;
;32:	menubitmap_s	frame;
;33:
;34:	menulist_s		list;
;35:
;36:	menubitmap_s	back;
;37:
;38:	int				gametype;
;39:	int				numBots;
;40:	int				selectedBot;
;41:	char			*bots[9];
;42:	char			botNames[9][16];
;43:} teamOrdersMenuInfo_t;
;44:
;45:static teamOrdersMenuInfo_t	teamOrdersMenuInfo;
;46:
;47:#define NUM_CTF_ORDERS		7
;48:static const char *ctfOrders[] = {
;49:	"I Am the Leader",
;50:	"Defend the Base",
;51:	"Follow Me",
;52:	"Get Enemy Flag",
;53:	"Camp Here",
;54:	"Report",
;55:	"I Relinquish Command",
;56:	NULL
;57:};
;58:static const char *ctfMessages[] = {
;59:	"i am the leader",
;60:	"%s defend the base",
;61:	"%s follow me",
;62:	"%s get enemy flag",
;63:	"%s camp here",
;64:	"%s report",
;65:	"i stop being the leader",
;66:	NULL
;67:};
;68:
;69:#define NUM_TEAM_ORDERS		6
;70:static const char *teamOrders[] = {
;71:	"I Am the Leader",
;72:	"Follow Me",
;73:	"Roam",
;74:	"Camp Here",
;75:	"Report",
;76:	"I Relinquish Command",
;77:	NULL
;78:};
;79:static const char *teamMessages[] = {
;80:	"i am the leader",
;81:	"%s follow me",
;82:	"%s roam",
;83:	"%s camp here",
;84:	"%s report",
;85:	"i stop being the leader",
;86:	NULL
;87:};
;88:
;89:
;90:/*
;91:===============
;92:UI_TeamOrdersMenu_BackEvent
;93:===============
;94:*/
;95:static void UI_TeamOrdersMenu_BackEvent( void *ptr, int event ) {
line 96
;96:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $98
line 97
;97:		return;
ADDRGP4 $97
JUMPV
LABELV $98
line 99
;98:	}
;99:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 100
;100:}
LABELV $97
endproc UI_TeamOrdersMenu_BackEvent 0 0
proc UI_TeamOrdersMenu_SetList 4 0
line 108
;101:
;102:
;103:/*
;104:===============
;105:UI_TeamOrdersMenu_SetList
;106:===============
;107:*/
;108:static void UI_TeamOrdersMenu_SetList( int id ) {
line 109
;109:	switch( id ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $103
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $112
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $119
ADDRGP4 $101
JUMPV
LABELV $101
LABELV $103
line 112
;110:	default:
;111:	case ID_LIST_BOTS:
;112:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+1296+24
ADDRFP4 0
INDIRI4
ASGNI4
line 113
;113:		teamOrdersMenuInfo.list.numitems = teamOrdersMenuInfo.numBots;
ADDRGP4 teamOrdersMenuInfo+1296+96
ADDRGP4 teamOrdersMenuInfo+1548
INDIRI4
ASGNI4
line 114
;114:		teamOrdersMenuInfo.list.itemnames = (const char **)teamOrdersMenuInfo.bots;
ADDRGP4 teamOrdersMenuInfo+1296+104
ADDRGP4 teamOrdersMenuInfo+1556
ASGNP4
line 115
;115:		 break;
ADDRGP4 $102
JUMPV
LABELV $112
line 118
;116:
;117:	case ID_LIST_CTF_ORDERS:
;118:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+1296+24
ADDRFP4 0
INDIRI4
ASGNI4
line 119
;119:		teamOrdersMenuInfo.list.numitems = NUM_CTF_ORDERS;
ADDRGP4 teamOrdersMenuInfo+1296+96
CNSTI4 7
ASGNI4
line 120
;120:		teamOrdersMenuInfo.list.itemnames = ctfOrders;
ADDRGP4 teamOrdersMenuInfo+1296+104
ADDRGP4 ctfOrders
ASGNP4
line 121
;121:		break;
ADDRGP4 $102
JUMPV
LABELV $119
line 124
;122:
;123:	case ID_LIST_TEAM_ORDERS:
;124:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+1296+24
ADDRFP4 0
INDIRI4
ASGNI4
line 125
;125:		teamOrdersMenuInfo.list.numitems = NUM_TEAM_ORDERS;
ADDRGP4 teamOrdersMenuInfo+1296+96
CNSTI4 6
ASGNI4
line 126
;126:		teamOrdersMenuInfo.list.itemnames = teamOrders;
ADDRGP4 teamOrdersMenuInfo+1296+104
ADDRGP4 teamOrders
ASGNP4
line 127
;127:		break;
LABELV $102
line 130
;128:	}
;129:
;130:	teamOrdersMenuInfo.list.generic.bottom = teamOrdersMenuInfo.list.generic.top + teamOrdersMenuInfo.list.numitems * PROP_HEIGHT;
ADDRGP4 teamOrdersMenuInfo+1296+56
ADDRGP4 teamOrdersMenuInfo+1296+48
INDIRI4
ADDRGP4 teamOrdersMenuInfo+1296+96
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 131
;131:}
LABELV $100
endproc UI_TeamOrdersMenu_SetList 4 0
export UI_TeamOrdersMenu_Key
proc UI_TeamOrdersMenu_Key 72 16
line 139
;132:
;133:
;134:/*
;135:=================
;136:UI_TeamOrdersMenu_Key
;137:=================
;138:*/
;139:sfxHandle_t UI_TeamOrdersMenu_Key( int key ) {
line 145
;140:	menulist_s	*l;
;141:	int	x;
;142:	int	y;
;143:	int	index;
;144:
;145:	l = (menulist_s	*)Menu_ItemAtCursor( &teamOrdersMenuInfo.menu );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRLP4 16
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 146
;146:	if( l != &teamOrdersMenuInfo.list ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 teamOrdersMenuInfo+1296
CVPU4 4
EQU4 $134
line 147
;147:		return Menu_DefaultKey( &teamOrdersMenuInfo.menu, key );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $133
JUMPV
LABELV $134
line 150
;148:	}
;149:
;150:	switch( key ) {
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 161
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $146
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $153
LABELV $152
ADDRLP4 28
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 132
EQI4 $146
ADDRLP4 28
INDIRI4
CNSTI4 133
EQI4 $149
ADDRGP4 $137
JUMPV
LABELV $153
ADDRLP4 32
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 36
CNSTI4 167
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $149
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $137
LABELV $154
ADDRFP4 0
INDIRI4
CNSTI4 178
EQI4 $139
ADDRGP4 $137
JUMPV
LABELV $139
line 152
;151:		case K_MOUSE1:
;152:			x = l->generic.left;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 153
;153:			y = l->generic.top;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 154
;154:			if( UI_CursorInRect( x, y, l->generic.right - x, l->generic.bottom - y ) ) {
ADDRLP4 40
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
SUBI4
ARGI4
ADDRLP4 52
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $140
line 155
;155:				index = (uis.cursory - y) / PROP_HEIGHT;
ADDRLP4 12
ADDRGP4 uis+12
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ADDRGP4 cl_propheight+12
INDIRI4
DIVI4
ASGNI4
line 156
;156:				l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 157
;157:				l->curvalue = index;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 159
;158:
;159:				if( l->generic.callback ) {
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $144
line 160
;160:					l->generic.callback( l, QM_ACTIVATED );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
CALLV
pop
line 161
;161:					return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $133
JUMPV
LABELV $144
line 163
;162:				}
;163:			}
LABELV $140
line 164
;164:			return menu_null_sound;
ADDRGP4 menu_null_sound
INDIRI4
RETI4
ADDRGP4 $133
JUMPV
LABELV $146
line 168
;165:
;166:		case K_KP_UPARROW:
;167:		case K_UPARROW:
;168:			l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 170
;169:
;170:			if( l->curvalue == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 0
NEI4 $147
line 171
;171:				l->curvalue = l->numitems - 1;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 172
;172:			}
ADDRGP4 $148
JUMPV
LABELV $147
line 173
;173:			else {
line 174
;174:				l->curvalue--;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 175
;175:			}
LABELV $148
line 176
;176:			return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $133
JUMPV
LABELV $149
line 180
;177:
;178:		case K_KP_DOWNARROW:
;179:		case K_DOWNARROW:
;180:			l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 182
;181:
;182:			if( l->curvalue == l->numitems - 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 1
SUBI4
NEI4 $150
line 183
;183:				l->curvalue = 0;;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 184
;184:			}
ADDRGP4 $151
JUMPV
LABELV $150
line 185
;185:			else {
line 186
;186:				l->curvalue++;
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 187
;187:			}
LABELV $151
line 188
;188:			return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $133
JUMPV
LABELV $137
line 191
;189:	}
;190:
;191:	return Menu_DefaultKey( &teamOrdersMenuInfo.menu, key );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $133
endproc UI_TeamOrdersMenu_Key 72 16
proc UI_TeamOrdersMenu_ListDraw 36 20
line 200
;192:}
;193:
;194:
;195:/*
;196:=================
;197:UI_TeamOrdersMenu_ListDraw
;198:=================
;199:*/
;200:static void UI_TeamOrdersMenu_ListDraw( void *self ) {
line 209
;201:	menulist_s	*l;
;202:	int			x;
;203:	int			y;
;204:	int			i;
;205:	float		*color;
;206:	qboolean	hasfocus;
;207:	int			style;
;208:
;209:	l = (menulist_s *)self;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 211
;210:
;211:	hasfocus = (l->generic.parent->cursor == l->generic.menuPosition);
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $157
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $158
JUMPV
LABELV $157
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $158
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 213
;212:
;213:	x =	320;//l->generic.x;
ADDRLP4 20
CNSTI4 320
ASGNI4
line 214
;214:	y =	l->generic.y;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 215
;215:	for( i = 0; i < l->numitems; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $162
JUMPV
LABELV $159
line 216
;216:		style = UI_LEFT|UI_SMALLFONT|UI_CENTER;
ADDRLP4 8
CNSTI4 17
ASGNI4
line 217
;217:		if( i == l->curvalue ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
NEI4 $163
line 218
;218:			color = color_yellow;
ADDRLP4 16
ADDRGP4 color_yellow
ASGNP4
line 219
;219:			if( hasfocus ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $164
line 220
;220:				style |= UI_PULSE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 221
;221:			}
line 222
;222:		}
ADDRGP4 $164
JUMPV
LABELV $163
line 223
;223:		else {
line 224
;224:			color = color_orange;
ADDRLP4 16
ADDRGP4 color_orange
ASGNP4
line 225
;225:		}
LABELV $164
line 227
;226:
;227:		UI_DrawString( x, y, l->itemnames[i], style, color );
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 228
;228:		y += PROP_HEIGHT;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 229
;229:	}
LABELV $160
line 215
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $162
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
LTI4 $159
line 230
;230:}
LABELV $155
endproc UI_TeamOrdersMenu_ListDraw 36 20
proc UI_TeamOrdersMenu_ListEvent 268 16
line 238
;231:
;232:
;233:/*
;234:===============
;235:UI_TeamOrdersMenu_ListEvent
;236:===============
;237:*/
;238:static void UI_TeamOrdersMenu_ListEvent( void *ptr, int event ) {
line 243
;239:	int		id;
;240:	int		selection;
;241:	char	message[256];
;242:
;243:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $169
line 244
;244:		return;
ADDRGP4 $168
JUMPV
LABELV $169
line 246
;245:
;246:	id = ((menulist_s *)ptr)->generic.id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 247
;247:	selection = ((menulist_s *)ptr)->curvalue;
ADDRLP4 260
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 249
;248:
;249:	if( id == ID_LIST_BOTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $171
line 250
;250:		teamOrdersMenuInfo.selectedBot = selection;
ADDRGP4 teamOrdersMenuInfo+1552
ADDRLP4 260
INDIRI4
ASGNI4
line 251
;251:		if( teamOrdersMenuInfo.gametype == GT_CTF ) {
ADDRGP4 teamOrdersMenuInfo+1544
INDIRI4
CNSTI4 5
NEI4 $174
line 252
;252:			UI_TeamOrdersMenu_SetList( ID_LIST_CTF_ORDERS );
CNSTI4 11
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 253
;253:		}
ADDRGP4 $168
JUMPV
LABELV $174
line 254
;254:		else {
line 255
;255:			UI_TeamOrdersMenu_SetList( ID_LIST_TEAM_ORDERS );
CNSTI4 12
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 256
;256:		}
line 257
;257:		return;
ADDRGP4 $168
JUMPV
LABELV $171
line 260
;258:	}
;259:
;260:	if( id == ID_LIST_CTF_ORDERS ) {
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $177
line 261
;261:		Com_sprintf( message, sizeof(message), ctfMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot] );
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ctfMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+1552
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+1592
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 262
;262:	}
ADDRGP4 $178
JUMPV
LABELV $177
line 263
;263:	else {
line 264
;264:		Com_sprintf( message, sizeof(message), teamMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot] );
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+1552
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+1592
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 265
;265:	}
LABELV $178
line 267
;266:
;267:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "say_team \"%s\"\n", message ) );
ADDRGP4 $183
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 268
;268:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 269
;269:}
LABELV $168
endproc UI_TeamOrdersMenu_ListEvent 268 16
proc UI_TeamOrdersMenu_BuildBotList 4164 12
line 277
;270:
;271:
;272:/*
;273:===============
;274:UI_TeamOrdersMenu_BuildBotList
;275:===============
;276:*/
;277:static void UI_TeamOrdersMenu_BuildBotList( void ) {
line 286
;278:	uiClientState_t	cs;
;279:	int		numPlayers;
;280:	int		isBot;
;281:	int		n;
;282:	char	playerTeam;
;283:	char	botTeam;
;284:	char	info[MAX_INFO_STRING];
;285:
;286:	for( n = 0; n < 9; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $185
line 287
;287:		teamOrdersMenuInfo.bots[n] = teamOrdersMenuInfo.botNames[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamOrdersMenuInfo+1556
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+1592
ADDP4
ASGNP4
line 288
;288:	}
LABELV $186
line 286
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 9
LTI4 $185
line 290
;289:
;290:	trap_GetClientState( &cs );
ADDRLP4 1040
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 292
;291:
;292:	Q_strncpyz( teamOrdersMenuInfo.botNames[0], "Everyone", 16 );
ADDRGP4 teamOrdersMenuInfo+1592
ARGP4
ADDRGP4 $192
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 293
;293:	teamOrdersMenuInfo.numBots = 1;
ADDRGP4 teamOrdersMenuInfo+1548
CNSTI4 1
ASGNI4
line 295
;294:
;295:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 296
;296:	numPlayers = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $194
ARGP4
ADDRLP4 4128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4128
INDIRP4
ARGP4
ADDRLP4 4132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4124
ADDRLP4 4132
INDIRI4
ASGNI4
line 297
;297:	teamOrdersMenuInfo.gametype = atoi( Info_ValueForKey( info, "g_gametype" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $196
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4136
INDIRP4
ARGP4
ADDRLP4 4140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 teamOrdersMenuInfo+1544
ADDRLP4 4140
INDIRI4
ASGNI4
line 299
;298:
;299:	for( n = 0; n < numPlayers && teamOrdersMenuInfo.numBots < 9; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $197
line 300
;300:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
ADDRLP4 0
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 302
;301:
;302:		if( n == cs.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRLP4 1040+8
INDIRI4
NEI4 $202
line 303
;303:			playerTeam = *Info_ValueForKey( info, "t" );
ADDRLP4 4
ARGP4
ADDRGP4 $205
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 4144
INDIRP4
INDIRI1
ASGNI1
line 304
;304:			continue;
ADDRGP4 $198
JUMPV
LABELV $202
line 307
;305:		}
;306:
;307:		playerTeam = TEAM_SPECTATOR; // bk001204 = possible uninit use
ADDRLP4 1028
CNSTI1 3
ASGNI1
line 309
;308:
;309:		isBot = atoi( Info_ValueForKey( info, "skill" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4144
INDIRP4
ARGP4
ADDRLP4 4148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 4148
INDIRI4
ASGNI4
line 310
;310:		if( !isBot ) {
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $207
line 311
;311:			continue;
ADDRGP4 $198
JUMPV
LABELV $207
line 314
;312:		}
;313:
;314:		botTeam = *Info_ValueForKey( info, "t" );
ADDRLP4 4
ARGP4
ADDRGP4 $205
ARGP4
ADDRLP4 4152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ADDRLP4 4152
INDIRP4
INDIRI1
ASGNI1
line 315
;315:		if( botTeam != playerTeam ) {
ADDRLP4 1036
INDIRI1
CVII4 1
ADDRLP4 1028
INDIRI1
CVII4 1
EQI4 $209
line 316
;316:			continue;
ADDRGP4 $198
JUMPV
LABELV $209
line 319
;317:		}
;318:
;319:		Q_strncpyz( teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.numBots], Info_ValueForKey( info, "n" ), 16 );
ADDRLP4 4
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 4156
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 teamOrdersMenuInfo+1548
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+1592
ADDP4
ARGP4
ADDRLP4 4156
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 320
;320:		Q_CleanStr( teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.numBots] );
ADDRGP4 teamOrdersMenuInfo+1548
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+1592
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 321
;321:		teamOrdersMenuInfo.numBots++;
ADDRLP4 4160
ADDRGP4 teamOrdersMenuInfo+1548
ASGNP4
ADDRLP4 4160
INDIRP4
ADDRLP4 4160
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 322
;322:	}
LABELV $198
line 299
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $200
ADDRLP4 0
INDIRI4
ADDRLP4 4124
INDIRI4
GEI4 $217
ADDRGP4 teamOrdersMenuInfo+1548
INDIRI4
CNSTI4 9
LTI4 $197
LABELV $217
line 323
;323:}
LABELV $184
endproc UI_TeamOrdersMenu_BuildBotList 4164 12
proc UI_TeamOrdersMenu_Init 0 12
line 331
;324:
;325:
;326:/*
;327:===============
;328:UI_TeamOrdersMenu_Init
;329:===============
;330:*/
;331:static void UI_TeamOrdersMenu_Init( void ) {
line 332
;332:	UI_TeamOrdersMenu_Cache();
ADDRGP4 UI_TeamOrdersMenu_Cache
CALLV
pop
line 334
;333:
;334:	memset( &teamOrdersMenuInfo, 0, sizeof(teamOrdersMenuInfo) );
ADDRGP4 teamOrdersMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1736
ARGI4
ADDRGP4 memset
CALLP4
pop
line 335
;335:	teamOrdersMenuInfo.menu.fullscreen = qfalse;
ADDRGP4 teamOrdersMenuInfo+1052
CNSTI4 0
ASGNI4
line 336
;336:	teamOrdersMenuInfo.menu.key = UI_TeamOrdersMenu_Key;
ADDRGP4 teamOrdersMenuInfo+1040
ADDRGP4 UI_TeamOrdersMenu_Key
ASGNP4
line 338
;337:
;338:	UI_TeamOrdersMenu_BuildBotList();
ADDRGP4 UI_TeamOrdersMenu_BuildBotList
CALLV
pop
line 340
;339:
;340:	teamOrdersMenuInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 teamOrdersMenuInfo+1076
CNSTI4 10
ASGNI4
line 341
;341:	teamOrdersMenuInfo.banner.generic.x			= 320;
ADDRGP4 teamOrdersMenuInfo+1076+28
CNSTI4 320
ASGNI4
line 342
;342:	teamOrdersMenuInfo.banner.generic.y			= 16;
ADDRGP4 teamOrdersMenuInfo+1076+32
CNSTI4 16
ASGNI4
line 343
;343:	teamOrdersMenuInfo.banner.string			= "TEAM ORDERS";
ADDRGP4 teamOrdersMenuInfo+1076+88
ADDRGP4 $228
ASGNP4
line 344
;344:	teamOrdersMenuInfo.banner.color				= color_white;
ADDRGP4 teamOrdersMenuInfo+1076+100
ADDRGP4 color_white
ASGNP4
line 345
;345:	teamOrdersMenuInfo.banner.style				= UI_CENTER;
ADDRGP4 teamOrdersMenuInfo+1076+92
CNSTI4 1
ASGNI4
line 347
;346:
;347:	teamOrdersMenuInfo.frame.generic.type		= MTYPE_BITMAP;
ADDRGP4 teamOrdersMenuInfo+1180
CNSTI4 6
ASGNI4
line 348
;348:	teamOrdersMenuInfo.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 teamOrdersMenuInfo+1180+72
CNSTU4 16384
ASGNU4
line 349
;349:	teamOrdersMenuInfo.frame.generic.name		= ART_FRAME;
ADDRGP4 teamOrdersMenuInfo+1180+4
ADDRGP4 $238
ASGNP4
line 350
;350:	teamOrdersMenuInfo.frame.generic.x			= 320-233;
ADDRGP4 teamOrdersMenuInfo+1180+28
CNSTI4 87
ASGNI4
line 351
;351:	teamOrdersMenuInfo.frame.generic.y			= 240-166;
ADDRGP4 teamOrdersMenuInfo+1180+32
CNSTI4 74
ASGNI4
line 352
;352:	teamOrdersMenuInfo.frame.width				= 466;
ADDRGP4 teamOrdersMenuInfo+1180+104
CNSTI4 466
ASGNI4
line 353
;353:	teamOrdersMenuInfo.frame.height				= 332;
ADDRGP4 teamOrdersMenuInfo+1180+108
CNSTI4 332
ASGNI4
line 355
;354:
;355:	teamOrdersMenuInfo.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 teamOrdersMenuInfo+1296
CNSTI4 8
ASGNI4
line 356
;356:	teamOrdersMenuInfo.list.generic.flags		= QMF_PULSEIFFOCUS;
ADDRGP4 teamOrdersMenuInfo+1296+72
CNSTU4 256
ASGNU4
line 357
;357:	teamOrdersMenuInfo.list.generic.ownerdraw	= UI_TeamOrdersMenu_ListDraw;
ADDRGP4 teamOrdersMenuInfo+1296+84
ADDRGP4 UI_TeamOrdersMenu_ListDraw
ASGNP4
line 358
;358:	teamOrdersMenuInfo.list.generic.callback	= UI_TeamOrdersMenu_ListEvent;
ADDRGP4 teamOrdersMenuInfo+1296+76
ADDRGP4 UI_TeamOrdersMenu_ListEvent
ASGNP4
line 359
;359:	teamOrdersMenuInfo.list.generic.x			= 320-64;
ADDRGP4 teamOrdersMenuInfo+1296+28
CNSTI4 256
ASGNI4
line 360
;360:	teamOrdersMenuInfo.list.generic.y			= 120;
ADDRGP4 teamOrdersMenuInfo+1296+32
CNSTI4 120
ASGNI4
line 362
;361:
;362:	teamOrdersMenuInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 teamOrdersMenuInfo+1428
CNSTI4 6
ASGNI4
line 363
;363:	teamOrdersMenuInfo.back.generic.name		= ART_BACK0;
ADDRGP4 teamOrdersMenuInfo+1428+4
ADDRGP4 $261
ASGNP4
line 364
;364:	teamOrdersMenuInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 teamOrdersMenuInfo+1428+72
CNSTU4 260
ASGNU4
line 365
;365:	teamOrdersMenuInfo.back.generic.callback	= UI_TeamOrdersMenu_BackEvent;
ADDRGP4 teamOrdersMenuInfo+1428+76
ADDRGP4 UI_TeamOrdersMenu_BackEvent
ASGNP4
line 366
;366:	teamOrdersMenuInfo.back.generic.x			= 0;
ADDRGP4 teamOrdersMenuInfo+1428+28
CNSTI4 0
ASGNI4
line 367
;367:	teamOrdersMenuInfo.back.generic.y			= 480-64;
ADDRGP4 teamOrdersMenuInfo+1428+32
CNSTI4 416
ASGNI4
line 368
;368:	teamOrdersMenuInfo.back.width				= 128;
ADDRGP4 teamOrdersMenuInfo+1428+104
CNSTI4 128
ASGNI4
line 369
;369:	teamOrdersMenuInfo.back.height				= 64;
ADDRGP4 teamOrdersMenuInfo+1428+108
CNSTI4 64
ASGNI4
line 370
;370:	teamOrdersMenuInfo.back.focuspic			= ART_BACK1;
ADDRGP4 teamOrdersMenuInfo+1428+88
ADDRGP4 $276
ASGNP4
line 372
;371:
;372:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.banner );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 373
;373:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.frame );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 374
;374:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.list );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 375
;375:	Menu_AddItem( &teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.back );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+1428
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 377
;376:
;377:	teamOrdersMenuInfo.list.generic.left = 220;
ADDRGP4 teamOrdersMenuInfo+1296+44
CNSTI4 220
ASGNI4
line 378
;378:	teamOrdersMenuInfo.list.generic.top = teamOrdersMenuInfo.list.generic.y;
ADDRGP4 teamOrdersMenuInfo+1296+48
ADDRGP4 teamOrdersMenuInfo+1296+32
INDIRI4
ASGNI4
line 379
;379:	teamOrdersMenuInfo.list.generic.right = 420;
ADDRGP4 teamOrdersMenuInfo+1296+52
CNSTI4 420
ASGNI4
line 380
;380:	UI_TeamOrdersMenu_SetList( ID_LIST_BOTS );
CNSTI4 10
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 381
;381:}
LABELV $218
endproc UI_TeamOrdersMenu_Init 0 12
export UI_TeamOrdersMenu_Cache
proc UI_TeamOrdersMenu_Cache 0 4
line 389
;382:
;383:
;384:/*
;385:=================
;386:UI_TeamOrdersMenu_Cache
;387:=================
;388:*/
;389:void UI_TeamOrdersMenu_Cache( void ) {
line 390
;390:	trap_R_RegisterShaderNoMip( ART_FRAME );
ADDRGP4 $238
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 391
;391:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $261
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 392
;392:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $276
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 393
;393:}
LABELV $289
endproc UI_TeamOrdersMenu_Cache 0 4
export UI_TeamOrdersMenu
proc UI_TeamOrdersMenu 0 4
line 401
;394:
;395:
;396:/*
;397:===============
;398:UI_TeamOrdersMenu
;399:===============
;400:*/
;401:void UI_TeamOrdersMenu( void ) {
line 402
;402:	UI_TeamOrdersMenu_Init();
ADDRGP4 UI_TeamOrdersMenu_Init
CALLV
pop
line 403
;403:	UI_PushMenu( &teamOrdersMenuInfo.menu );
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 404
;404:}
LABELV $290
endproc UI_TeamOrdersMenu 0 4
export UI_TeamOrdersMenu_f
proc UI_TeamOrdersMenu_f 4128 12
line 412
;405:
;406:
;407:/*
;408:===============
;409:UI_TeamOrdersMenu_f
;410:===============
;411:*/
;412:void UI_TeamOrdersMenu_f( void ) {
line 418
;413:	uiClientState_t	cs;
;414:	char	info[MAX_INFO_STRING];
;415:	int		team;
;416:
;417:	// make sure it's a team game
;418:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 419
;419:	teamOrdersMenuInfo.gametype = atoi( Info_ValueForKey( info, "g_gametype" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $196
ARGP4
ADDRLP4 4112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4112
INDIRP4
ARGP4
ADDRLP4 4116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 teamOrdersMenuInfo+1544
ADDRLP4 4116
INDIRI4
ASGNI4
line 420
;420:	if( teamOrdersMenuInfo.gametype < GT_TEAM  ||  teamOrdersMenuInfo.gametype == GT_LMS) {
ADDRGP4 teamOrdersMenuInfo+1544
INDIRI4
CNSTI4 4
LTI4 $297
ADDRGP4 teamOrdersMenuInfo+1544
INDIRI4
CNSTI4 11
NEI4 $293
LABELV $297
line 421
;421:		return;
ADDRGP4 $291
JUMPV
LABELV $293
line 425
;422:	}
;423:
;424:	// not available to spectators
;425:	trap_GetClientState( &cs );
ADDRLP4 1024
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 426
;426:	trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 1024+8
INDIRI4
CNSTI4 8224
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 427
;427:	team = atoi( Info_ValueForKey( info, "t" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $205
ARGP4
ADDRLP4 4120
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4120
INDIRP4
ARGP4
ADDRLP4 4124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4108
ADDRLP4 4124
INDIRI4
ASGNI4
line 428
;428:	if( team == TEAM_SPECTATOR ) {
ADDRLP4 4108
INDIRI4
CNSTI4 3
NEI4 $299
line 429
;429:		return;
ADDRGP4 $291
JUMPV
LABELV $299
line 432
;430:	}
;431:
;432:	UI_TeamOrdersMenu();
ADDRGP4 UI_TeamOrdersMenu
CALLV
pop
line 433
;433:}
LABELV $291
endproc UI_TeamOrdersMenu_f 4128 12
bss
align 4
LABELV teamOrdersMenuInfo
skip 1736
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
LABELV $276
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
LABELV $261
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
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $228
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $213
byte 1 110
byte 1 0
align 1
LABELV $206
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $205
byte 1 116
byte 1 0
align 1
LABELV $196
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $194
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
byte 1 0
align 1
LABELV $192
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $183
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $96
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $95
byte 1 82
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $94
byte 1 105
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 98
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $93
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $92
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $91
byte 1 37
byte 1 115
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $90
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $89
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $88
byte 1 105
byte 1 32
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $87
byte 1 73
byte 1 32
byte 1 82
byte 1 101
byte 1 108
byte 1 105
byte 1 110
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $86
byte 1 82
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $85
byte 1 67
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 72
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $84
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $83
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 77
byte 1 101
byte 1 0
align 1
LABELV $82
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $81
byte 1 73
byte 1 32
byte 1 65
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
