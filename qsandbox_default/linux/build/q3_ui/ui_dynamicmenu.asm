data
align 4
LABELV dynamicmenu_edgecolor
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1056964608
align 4
LABELV dynamicmenu_infillcolor
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1051260355
align 4
LABELV dynamicmenu_backgrcolor
byte 4 0
byte 4 0
byte 4 0
byte 4 1058642330
align 4
LABELV dm_itemList
address $83
address $84
address $85
byte 4 0
address $86
byte 4 0
address $87
address $88
address $89
byte 4 0
address $90
byte 4 0
address $91
address $92
address $93
byte 4 0
address $94
byte 4 0
address $95
address $96
address $97
byte 4 0
address $98
byte 4 0
address $99
address $100
address $101
byte 4 0
address $102
byte 4 0
address $103
address $104
address $105
byte 4 0
address $106
byte 4 0
address $107
address $108
address $109
byte 4 0
address $110
byte 4 0
address $111
address $112
address $113
byte 4 0
address $114
byte 4 0
address $115
address $116
address $117
byte 4 0
address $118
byte 4 0
address $119
address $120
address $121
byte 4 0
address $122
byte 4 0
address $123
address $124
address $125
byte 4 0
address $126
byte 4 0
address $127
address $128
address $129
byte 4 0
address $130
byte 4 0
address $131
address $132
address $133
byte 4 0
address $134
byte 4 0
address $135
address $136
address $137
byte 4 0
address $138
byte 4 0
address $139
address $140
address $141
byte 4 0
address $142
byte 4 0
address $143
address $144
address $145
byte 4 0
address $146
byte 4 0
address $147
address $148
address $149
byte 4 0
address $150
byte 4 0
address $151
address $152
address $153
byte 4 0
address $154
byte 4 0
address $155
address $156
address $157
byte 4 0
address $158
byte 4 0
address $159
address $160
address $161
byte 4 0
address $162
byte 4 0
address $163
address $164
address $165
byte 4 0
address $166
byte 4 0
align 4
LABELV dm_numMenuItems
byte 4 21
export DynamicMenu_ServerGametype
code
proc DynamicMenu_ServerGametype 1032 12
file "../../../code/q3_ui/ui_dynamicmenu.c"
line 160
;1:/*
;2:=======================================================================
;3:
;4:DYANMIC MENU SYSTEM
;5:
;6:=======================================================================
;7:*/
;8:
;9:
;10:
;11:
;12:
;13:#include "ui_local.h"
;14:#include "ui_dynamicmenu.h"
;15:
;16:
;17:#define MAX_DYNAMICDEPTH 6
;18:#define MAX_MENUSTRING 72
;19:
;20:#define MAX_BOT_ICON 64
;21:
;22:#define MENUICON_WIDTH 		20
;23:#define MENUICON_HEIGHT 	20
;24:#define MENUICON_GAP		2
;25:
;26:/*
;27:	Gap (screen pixels) between the border of a menu item and
;28:	the border of the menu
;29:*/
;30:#define SUBMENU_SURROUNDGAP 1
;31:
;32:/*
;33:	Horizontal separation (screen pixels) between a sub menu and it's parent
;34:*/
;35:#define SUBMENU_GAP		0
;36:
;37:/*
;38:	Gap (virtual screen pixels) between left edge of
;39:	menu item border and text/icon
;40:*/
;41:#define MENUSPACE_X		10*1.10
;42:
;43:/*
;44:	Vertical gap (virtual screen pixels) between text
;45:	and top/bottom border of menu item
;46:*/
;47:#define MENUSPACE_Y		2*1.10
;48:
;49:/*
;50:	Scale factor for menu text and icons
;51:*/
;52:#define MENU_SCALE 0.7*1.10
;53:
;54:
;55:typedef struct {
;56:	char text[MAX_MENUSTRING];
;57:	int index;
;58:	int id;
;59:	qhandle_t icon;
;60:	createHandler createSubMenu;
;61:	eventHandler runEvent;
;62:
;63:	float trueX;    // used for pixel perfect positioning
;64:	float trueY;
;65:	float trueH;
;66:	float trueW;
;67:} dynamicitem_t;
;68:
;69:
;70:
;71:typedef struct {
;72:	menuframework_s menu;
;73:
;74:	menutext_s item[MAX_MENUITEMS];
;75:	dynamicitem_t data[MAX_MENUITEMS];
;76:	qhandle_t	background[MAX_MENUITEMS];
;77:
;78:	int start[MAX_DYNAMICDEPTH];
;79:	int end[MAX_DYNAMICDEPTH];	// indicates to (last item + 1)
;80:	int active[MAX_DYNAMICDEPTH];
;81:	qboolean icon[MAX_DYNAMICDEPTH];
;82:
;83:	int gametype;
;84:	int depth;
;85:} dynamicmenu_t;
;86:
;87:static dynamicmenu_t s_dynamic;
;88:
;89:
;90:static vec4_t dynamicmenu_edgecolor = { 1.0f, 1.0f, 1.0f, 0.5f };
;91:static vec4_t dynamicmenu_infillcolor = { 1.0f, 1.0f, 1.0f, 0.33f };
;92:static vec4_t dynamicmenu_backgrcolor = { 0.0f, 0.0f, 0.0f, 0.60f };
;93:
;94:
;95:
;96:
;97:/*
;98:=======================================================================
;99:
;100:DYANMIC MENU CORE SERVICES
;101:
;102:=======================================================================
;103:*/
;104:
;105:
;106:
;107:typedef struct {
;108:	const char* longname;
;109:	const char* shortname;
;110:	const char* classname;
;111:	qboolean loaded;
;112:	const char* icon;
;113:
;114:	int game;
;115:} itemList_t;
;116:
;117:
;118:
;119:// The machine gun is excluded from the list because it
;120:// is the default weapon, maps usually don't have it as
;121:// available for pickup.
;122:static itemList_t dm_itemList[] = {
;123:	{ "Red Armour", "red armour", "item_armor_body", qfalse, "uie_icons/iconr_red", 0 },
;124:	{ "Yel Armour", "yellow armour", "item_armor_combat", qfalse, "uie_icons/iconr_yellow", 0 },
;125:	{ "Mega", "mh", "item_health_mega", qfalse, "uie_icons/iconh_mega", 0},
;126:	{ "Machine G", "machinegun", "weapon_machinegun", qfalse, "uie_icons/iconw_machinegun", 0 },
;127:	{ "Shotgun", "shotgun", "weapon_shotgun", qfalse, "uie_icons/iconw_shotgun", 0 },
;128:	{ "Grenade L", "grenade", "weapon_grenadelauncher", qfalse, "uie_icons/iconw_grenade", 0 },
;129:	{ "Rocket L", "rocket", "weapon_rocketlauncher", qfalse, "uie_icons/iconw_rocket", 0 },
;130:	{ "Plasma G", "plasmagun", "weapon_plasmagun", qfalse, "uie_icons/iconw_plasma", 0 },
;131:	{ "Lightning", "lightning", "weapon_lightning", qfalse, "uie_icons/iconw_lightning", 0 },
;132:	{ "Railgun", "railgun", "weapon_railgun", qfalse, "uie_icons/iconw_railgun", 0 },
;133:	{ "BFG10k", "bfg", "weapon_bfg", qfalse, "uie_icons/iconw_bfg", 0 },
;134:	{ "Nailgun", "nailgun", "weapon_nailgun", qfalse, "icons/iconw_nailgun", 0 },
;135:	{ "Prox Launcher", "mines", "weapon_prox_launcher", qfalse, "icons/iconw_proxlauncher", 0 },
;136:	{ "Chaingun", "chaingun", "weapon_chaingun", qfalse, "icons/iconw_chaingun", 0 },
;137:	{ "Flamethrower", "flamethrower", "weapon_flamethrower", qfalse, "icons/iconw_flamethrower", 0 },
;138:	{ "Dark Flare", "darkflare", "weapon_antimatter", qfalse, "icons/iconw_voodoo", 0 },
;139:	{ "Quad", "quad", "item_quad", qfalse, "uie_icons/quad", 0 },
;140:	{ "Regen", "regen", "item_regen", qfalse, "uie_icons/regen", 0 },
;141:	{ "Invis", "invis", "item_invis", qfalse, "uie_icons/invis", 0 },
;142:	{ "Btl Suit", "b suit", "item_enviro", qfalse, "uie_icons/envirosuit", 0 },
;143:	{ "Haste", "haste", "item_haste", qfalse, "uie_icons/haste", 0 }
;144:};
;145:
;146:
;147:static int dm_numMenuItems = sizeof(dm_itemList)/sizeof(dm_itemList[0]);
;148:
;149:
;150:
;151:
;152:
;153:
;154:/*
;155:=================
;156:DynamicMenu_ServerGametype
;157:=================
;158:*/
;159:int DynamicMenu_ServerGametype(void)
;160:{
line 163
;161:	char	info[MAX_INFO_STRING];
;162:
;163:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 164
;164:	return atoi( Info_ValueForKey( info, "g_gametype" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $168
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
RETI4
LABELV $167
endproc DynamicMenu_ServerGametype 1032 12
export DynamicMenu_ItemShortname
proc DynamicMenu_ItemShortname 0 0
line 175
;165:}
;166:
;167:
;168:
;169:/*
;170:=================
;171:DynamicMenu_ItemShortname
;172:=================
;173:*/
;174:const char* DynamicMenu_ItemShortname(int index)
;175:{
line 176
;176:	return dm_itemList[index].shortname;
CNSTI4 24
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 dm_itemList+4
ADDP4
INDIRP4
RETP4
LABELV $169
endproc DynamicMenu_ItemShortname 0 0
export DynamicMenu_AddListOfItems
proc DynamicMenu_AddListOfItems 24 20
line 191
;177:}
;178:
;179:
;180:
;181:
;182:
;183:
;184:
;185:/*
;186:=================
;187:DynamicMenu_AddListOfItems
;188:=================
;189:*/
;190:void DynamicMenu_AddListOfItems( int exclude, createHandler crh, eventHandler evh )
;191:{
line 194
;192:	int i;
;193:
;194:	for (i = 0; i < dm_numMenuItems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $172
line 195
;195:	{
line 196
;196:		if (!dm_itemList[i].loaded)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 dm_itemList+12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $176
line 197
;197:			continue;
ADDRGP4 $173
JUMPV
LABELV $176
line 199
;198:
;199:		if (dm_itemList[i].game && dm_itemList[i].game != s_dynamic.gametype)
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 dm_itemList+20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $179
ADDRLP4 4
INDIRI4
ADDRGP4 dm_itemList+20
ADDP4
INDIRI4
ADDRGP4 s_dynamic+56468
INDIRI4
EQI4 $179
line 200
;200:			continue;
ADDRGP4 $173
JUMPV
LABELV $179
line 202
;201:
;202:		if (!DynamicMenu_AddIconItem(dm_itemList[i].longname, i, dm_itemList[i].icon, crh, evh))
ADDRLP4 12
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 dm_itemList
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ADDRGP4 dm_itemList+16
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $184
line 203
;203:			continue;
ADDRGP4 $173
JUMPV
LABELV $184
line 205
;204:
;205:		if (i == exclude)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $187
line 206
;206:		{
line 208
;207:			// gray the item
;208:			s_dynamic.item[s_dynamic.end[ s_dynamic.depth - 1] - 1].generic.flags |= QMF_GRAYED;
ADDRLP4 20
CNSTI4 104
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56396-4
ADDP4
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076-104+72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 209
;209:		}
LABELV $187
line 210
;210:	}
LABELV $173
line 194
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $175
ADDRLP4 0
INDIRI4
ADDRGP4 dm_numMenuItems
INDIRI4
LTI4 $172
line 211
;211:}
LABELV $171
endproc DynamicMenu_AddListOfItems 24 20
proc DynamicMenu_InitMapItems 1044 12
line 221
;212:
;213:
;214:
;215:/*
;216:=================
;217:DynamicMenu_InitMapItems
;218:=================
;219:*/
;220:static void DynamicMenu_InitMapItems( void )
;221:{
line 226
;222:	int		i, j;
;223:	char	items[MAX_ITEMS+1];
;224:	int 	type;
;225:
;226:	for (i = 0; i < dm_numMenuItems; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $196
line 227
;227:		dm_itemList[i].loaded = qfalse;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 dm_itemList+12
ADDP4
CNSTI4 0
ASGNI4
LABELV $197
line 226
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $199
ADDRLP4 4
INDIRI4
ADDRGP4 dm_numMenuItems
INDIRI4
LTI4 $196
line 229
;228:
;229:	trap_GetConfigString( CS_ITEMS, items, sizeof(items) );
CNSTI4 27
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1025
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 230
;230:	for ( i = 1; i < bg_numItems; i++)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $204
JUMPV
LABELV $201
line 231
;231:	{
line 232
;232:		if (items[i] != '1')
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
EQI4 $205
line 233
;233:			continue;
ADDRGP4 $202
JUMPV
LABELV $205
line 236
;234:
;235:		// locate item on our list
;236:		type = bg_itemlist[i].giType;
ADDRLP4 1036
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 237
;237:		for (j = 0 ; j < dm_numMenuItems; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $211
JUMPV
LABELV $208
line 238
;238:		{
line 239
;239:			if (!Q_stricmp(bg_itemlist[i].classname, dm_itemList[j].classname))
CNSTI4 56
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
INDIRP4
ARGP4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 dm_itemList+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $212
line 240
;240:			{
line 241
;241:				dm_itemList[j].loaded = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 dm_itemList+12
ADDP4
CNSTI4 1
ASGNI4
line 242
;242:				break;
ADDRGP4 $210
JUMPV
LABELV $212
line 244
;243:			}
;244:		}
LABELV $209
line 237
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $211
ADDRLP4 0
INDIRI4
ADDRGP4 dm_numMenuItems
INDIRI4
LTI4 $208
LABELV $210
line 245
;245:	}
LABELV $202
line 230
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $204
ADDRLP4 4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $201
line 246
;246:}
LABELV $195
endproc DynamicMenu_InitMapItems 1044 12
export DynamicMenu_AddListOfPlayers
proc DynamicMenu_AddListOfPlayers 4308 20
line 255
;247:
;248:
;249:/*
;250:=================
;251:DynamicMenu_AddListOfPlayers
;252:=================
;253:*/
;254:void DynamicMenu_AddListOfPlayers( int type, createHandler crh, eventHandler evh )
;255:{
line 266
;256:	uiClientState_t	cs;
;257:	int		numPlayers;
;258:	int		isBot;
;259:	int		n;
;260:	char	info[MAX_INFO_STRING];
;261:	char	boticon[MAX_BOT_ICON];
;262:	char 	name[64];
;263:	int 	playerTeam, team;
;264:	int 	depth;
;265:
;266:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 267
;267:	numPlayers = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 4260
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4260
INDIRP4
ARGP4
ADDRLP4 4264
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1172
ADDRLP4 4264
INDIRI4
ASGNI4
line 269
;268:
;269:	trap_GetClientState( &cs );
ADDRLP4 1176
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 270
;270:	trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 1176+8
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
line 271
;271:	playerTeam = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 0
ARGP4
ADDRGP4 $219
ARGP4
ADDRLP4 4268
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4268
INDIRP4
ARGP4
ADDRLP4 4272
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1104
ADDRLP4 4272
INDIRI4
ASGNI4
line 273
;272:
;273:	depth = s_dynamic.depth - 1;
ADDRLP4 1092
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 274
;274:	for( n = 0; n < numPlayers; n++ ) {
ADDRLP4 1088
CNSTI4 0
ASGNI4
ADDRGP4 $224
JUMPV
LABELV $221
line 275
;275:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
ADDRLP4 1088
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
line 277
;276:
;277:	if (!(type & PT_ALL)){
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $225
line 278
;278:		if (n == cs.clientNum)
ADDRLP4 1088
INDIRI4
ADDRLP4 1176+8
INDIRI4
NEI4 $227
line 279
;279:			continue;
ADDRGP4 $222
JUMPV
LABELV $227
line 280
;280:	}
LABELV $225
line 282
;281:
;282:		isBot = atoi( Info_ValueForKey( info, "skill" ) );
ADDRLP4 0
ARGP4
ADDRGP4 $230
ARGP4
ADDRLP4 4276
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4276
INDIRP4
ARGP4
ADDRLP4 4280
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1096
ADDRLP4 4280
INDIRI4
ASGNI4
line 283
;283:		if( (type & PT_BOTONLY) && !isBot ) {
ADDRLP4 4284
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 4284
INDIRI4
EQI4 $231
ADDRLP4 1096
INDIRI4
ADDRLP4 4284
INDIRI4
NEI4 $231
line 284
;284:			continue;
ADDRGP4 $222
JUMPV
LABELV $231
line 287
;285:		}
;286:
;287:		if( (type & PT_PLAYERONLY) && isBot ) {
ADDRLP4 4288
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 4288
INDIRI4
EQI4 $233
ADDRLP4 1096
INDIRI4
ADDRLP4 4288
INDIRI4
EQI4 $233
line 288
;288:			continue;
ADDRGP4 $222
JUMPV
LABELV $233
line 291
;289:		}
;290:
;291:		team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 0
ARGP4
ADDRGP4 $219
ARGP4
ADDRLP4 4292
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4292
INDIRP4
ARGP4
ADDRLP4 4296
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1100
ADDRLP4 4296
INDIRI4
ASGNI4
line 292
;292:		if ((type & PT_FRIENDLY) && team != playerTeam)
ADDRFP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $235
ADDRLP4 1100
INDIRI4
ADDRLP4 1104
INDIRI4
EQI4 $235
line 293
;293:			continue;
ADDRGP4 $222
JUMPV
LABELV $235
line 295
;294:
;295:		if ((type & PT_ENEMY) && team == playerTeam)
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $237
ADDRLP4 1100
INDIRI4
ADDRLP4 1104
INDIRI4
NEI4 $237
line 296
;296:			continue;
ADDRGP4 $222
JUMPV
LABELV $237
line 298
;297:
;298:		Q_strncpyz(name, Info_ValueForKey(info, "n"), 64);
ADDRLP4 0
ARGP4
ADDRGP4 $239
ARGP4
ADDRLP4 4300
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
ARGP4
ADDRLP4 4300
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 301
;299:		//Q_CleanStr(name);
;300:
;301:		if (!name[0])
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $240
line 302
;302:			continue;
ADDRGP4 $222
JUMPV
LABELV $240
line 304
;303:
;304:		if (type & PT_EXCLUDEPARENT && depth >= 1)
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $242
ADDRLP4 1092
INDIRI4
CNSTI4 1
LTI4 $242
line 305
;305:		{
line 307
;306:			// depth has been increased by init of (sub)menu
;307:			if (!Q_stricmp(name, s_dynamic.data[s_dynamic.active[depth - 1]].text))
ADDRLP4 1024
ARGP4
CNSTI4 108
ADDRLP4 1092
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56420-4
ADDP4
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700
ADDP4
ARGP4
ADDRLP4 4304
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4304
INDIRI4
CNSTI4 0
NEI4 $244
line 308
;308:				continue;
ADDRGP4 $222
JUMPV
LABELV $244
line 309
;309:		}
LABELV $242
line 311
;310:
;311:		if (type & PT_EXCLUDEGRANDPARENT && depth >= 2)
ADDRFP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $249
ADDRLP4 1092
INDIRI4
CNSTI4 2
LTI4 $249
line 312
;312:		{
line 314
;313:			// depth has been increased by init of (sub)menu
;314:			if (!Q_stricmp(name, s_dynamic.data[s_dynamic.active[depth - 2]].text))
ADDRLP4 1024
ARGP4
CNSTI4 108
ADDRLP4 1092
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56420-8
ADDP4
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700
ADDP4
ARGP4
ADDRLP4 4304
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4304
INDIRI4
CNSTI4 0
NEI4 $251
line 315
;315:				continue;
ADDRGP4 $222
JUMPV
LABELV $251
line 316
;316:		}
LABELV $249
line 318
;317:	
;318:		if (type & PT_ALL && 0)
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $256
ADDRGP4 $256
JUMPV
line 319
;319:		{
line 320
;320:				continue;
ADDRGP4 $222
JUMPV
LABELV $256
line 323
;321:		}
;322:
;323:		UI_ServerPlayerIcon(Info_ValueForKey(info, "model"), boticon, MAX_BOT_ICON);
ADDRLP4 0
ARGP4
ADDRGP4 $258
ARGP4
ADDRLP4 4304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4304
INDIRP4
ARGP4
ADDRLP4 1108
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 UI_ServerPlayerIcon
CALLV
pop
line 325
;324:
;325:		DynamicMenu_AddIconItem(name, 0, boticon, crh, evh);
ADDRLP4 1024
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1108
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
pop
line 326
;326:	}
LABELV $222
line 274
ADDRLP4 1088
ADDRLP4 1088
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $224
ADDRLP4 1088
INDIRI4
ADDRLP4 1172
INDIRI4
LTI4 $221
line 327
;327:}
LABELV $216
endproc DynamicMenu_AddListOfPlayers 4308 20
export DynamicMenu_Depth
proc DynamicMenu_Depth 0 0
line 349
;328:
;329:
;330:
;331:
;332:
;333:/*
;334:=======================================================================
;335:
;336:DYANMIC MENU
;337:
;338:=======================================================================
;339:*/
;340:
;341:
;342:
;343:/*
;344:=================
;345:DynamicMenu_Depth
;346:=================
;347:*/
;348:int DynamicMenu_Depth(void)
;349:{
line 350
;350:	return s_dynamic.depth;
ADDRGP4 s_dynamic+56472
INDIRI4
RETI4
LABELV $259
endproc DynamicMenu_Depth 0 0
export DynamicMenu_ActiveIdAtDepth
proc DynamicMenu_ActiveIdAtDepth 0 0
line 361
;351:}
;352:
;353:
;354:
;355:/*
;356:=================
;357:DynamicMenu_ActiveIdAtDepth
;358:=================
;359:*/
;360:int DynamicMenu_ActiveIdAtDepth(int depth)
;361:{
line 362
;362:	return s_dynamic.data[s_dynamic.active[depth - 1]].id;
CNSTI4 108
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56420-4
ADDP4
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+76
ADDP4
INDIRI4
RETI4
LABELV $261
endproc DynamicMenu_ActiveIdAtDepth 0 0
export DynamicMenu_ActiveIndexAtDepth
proc DynamicMenu_ActiveIndexAtDepth 0 0
line 374
;363:}
;364:
;365:
;366:
;367:
;368:/*
;369:=================
;370:DynamicMenu_ActiveIndexAtDepth
;371:=================
;372:*/
;373:int DynamicMenu_ActiveIndexAtDepth(int depth)
;374:{
line 375
;375:	return s_dynamic.active[depth - 1];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56420-4
ADDP4
INDIRI4
RETI4
LABELV $266
endproc DynamicMenu_ActiveIndexAtDepth 0 0
export DynamicMenu_IdAtIndex
proc DynamicMenu_IdAtIndex 0 0
line 385
;376:}
;377:
;378:
;379:/*
;380:=================
;381:DynamicMenu_IdAtIndex
;382:=================
;383:*/
;384:int DynamicMenu_IdAtIndex(int index)
;385:{
line 386
;386:	return s_dynamic.data[index].id;
CNSTI4 108
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+76
ADDP4
INDIRI4
RETI4
LABELV $269
endproc DynamicMenu_IdAtIndex 0 0
export DynamicMenu_StringAtIndex
proc DynamicMenu_StringAtIndex 0 0
line 397
;387:}
;388:
;389:
;390:
;391:/*
;392:=================
;393:DynamicMenu_StringAtIndex
;394:=================
;395:*/
;396:const char* DynamicMenu_StringAtIndex(int index)
;397:{
line 398
;398:	return s_dynamic.data[index].text;
CNSTI4 108
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700
ADDP4
RETP4
LABELV $272
endproc DynamicMenu_StringAtIndex 0 0
export DynamicMenu_SetFlags
proc DynamicMenu_SetFlags 8 0
line 409
;399:}
;400:
;401:
;402:
;403:/*
;404:=================
;405:DynamicMenu_SetFlags
;406:=================
;407:*/
;408:void DynamicMenu_SetFlags(int depth, int id, int flags)
;409:{
line 412
;410:	int i;
;411:
;412:	for (i = s_dynamic.start[depth - 1]; i < s_dynamic.end[depth - 1]; i++) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56372-4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $275
line 413
;413:		if (s_dynamic.data[i].id == id) {
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+76
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $283
line 414
;414:			s_dynamic.item[i].generic.flags |= flags;
ADDRLP4 4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+72
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
ADDRFP4 8
INDIRI4
CVIU4 4
BORU4
ASGNU4
line 415
;415:			return;
ADDRGP4 $274
JUMPV
LABELV $283
line 417
;416:		}
;417:	}
LABELV $276
line 412
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56396-4
ADDP4
INDIRI4
LTI4 $275
line 418
;418:}
LABELV $274
endproc DynamicMenu_SetFlags 8 0
export DynamicMenu_SubMenuInit
proc DynamicMenu_SubMenuInit 8 0
line 429
;419:
;420:
;421:
;422:
;423:/*
;424:=================
;425:DynamicMenu_InitSubMenu
;426:=================
;427:*/
;428:qboolean DynamicMenu_SubMenuInit( void)
;429:{
line 432
;430:	int pos;
;431:
;432:	if (s_dynamic.depth == MAX_DYNAMICDEPTH)
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 6
NEI4 $290
line 433
;433:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $289
JUMPV
LABELV $290
line 435
;434:
;435:	if (s_dynamic.depth == 0)
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 0
NEI4 $293
line 436
;436:		pos = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $294
JUMPV
LABELV $293
line 438
;437:	else
;438:		pos = s_dynamic.end[s_dynamic.depth - 1];
ADDRLP4 0
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56396-4
ADDP4
INDIRI4
ASGNI4
LABELV $294
line 440
;439:
;440:	if (pos == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 256
NEI4 $299
line 441
;441:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $289
JUMPV
LABELV $299
line 443
;442:
;443:	s_dynamic.depth++;
ADDRLP4 4
ADDRGP4 s_dynamic+56472
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 444
;444:	s_dynamic.active[s_dynamic.depth - 1] = -1;
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56420-4
ADDP4
CNSTI4 -1
ASGNI4
line 445
;445:	s_dynamic.start[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56372-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 446
;446:	s_dynamic.end[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56396-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 448
;447:
;448:    s_dynamic.background[s_dynamic.depth - 1] = 0;
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+55348-4
ADDP4
CNSTI4 0
ASGNI4
line 450
;449:
;450:	return qtrue;
CNSTI4 1
RETI4
LABELV $289
endproc DynamicMenu_SubMenuInit 8 0
export DynamicMenu_AddIconItem
proc DynamicMenu_AddIconItem 24 12
line 462
;451:}
;452:
;453:
;454:
;455:
;456:/*
;457:=================
;458:DynamicMenu_AddIconItem
;459:=================
;460:*/
;461:qboolean DynamicMenu_AddIconItem( const char* string, int id, const char* icon, createHandler crh, eventHandler evh)
;462:{
line 465
;463:	int index, depth;
;464:
;465:	depth = s_dynamic.depth - 1;
ADDRLP4 4
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 466
;466:	index = s_dynamic.end[depth];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56396
ADDP4
INDIRI4
ASGNI4
line 468
;467:
;468:	if (index == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 256
NEI4 $317
line 469
;469:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $314
JUMPV
LABELV $317
line 472
;470:
;471:	// can't have submenu and event attached to menu item
;472:	if (crh && evh)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $319
ADDRFP4 16
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $319
line 473
;473:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $314
JUMPV
LABELV $319
line 475
;474:
;475:	if (!string || !string[0])
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $323
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $321
LABELV $323
line 476
;476:		string = "[no text]";
ADDRFP4 0
ADDRGP4 $324
ASGNP4
LABELV $321
line 478
;477:
;478:	s_dynamic.data[index].index = index;
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+72
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 479
;479:	s_dynamic.data[index].id = id;
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+76
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 480
;480:	s_dynamic.data[index].createSubMenu = crh;
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+84
ADDP4
ADDRFP4 12
INDIRP4
ASGNP4
line 481
;481:	s_dynamic.data[index].runEvent = evh;
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+88
ADDP4
ADDRFP4 16
INDIRP4
ASGNP4
line 482
;482:	Q_strncpyz(s_dynamic.data[index].text, string, MAX_MENUSTRING);
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 72
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 484
;483:
;484:	if (icon) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $334
line 485
;485:		s_dynamic.data[index].icon = trap_R_RegisterShaderNoMip(icon);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+80
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 486
;486:	}
ADDRGP4 $335
JUMPV
LABELV $334
line 487
;487:	else {
line 488
;488:		s_dynamic.data[index].icon = 0;
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+80
ADDP4
CNSTI4 0
ASGNI4
line 489
;489:	}
LABELV $335
line 491
;490:
;491:	s_dynamic.end[depth]++;
ADDRLP4 20
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56396
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 493
;492:
;493:	return qtrue;
CNSTI4 1
RETI4
LABELV $314
endproc DynamicMenu_AddIconItem 24 12
export DynamicMenu_AddItem
proc DynamicMenu_AddItem 4 20
line 505
;494:}
;495:
;496:
;497:
;498:
;499:/*
;500:=================
;501:DynamicMenu_AddItem
;502:=================
;503:*/
;504:qboolean DynamicMenu_AddItem( const char* string, int id, createHandler crh, eventHandler evh)
;505:{
line 506
;506:	return DynamicMenu_AddIconItem(string, id, NULL, crh, evh);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 DynamicMenu_AddIconItem
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $341
endproc DynamicMenu_AddItem 4 20
export DynamicMenu_AddBackground
proc DynamicMenu_AddBackground 8 4
line 517
;507:}
;508:
;509:
;510:
;511:/*
;512:=================
;513:DynamicMenu_AddBackground
;514:=================
;515:*/
;516:void DynamicMenu_AddBackground( const char* background)
;517:{
line 518
;518:	if (!background || !background[0])
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $345
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $343
LABELV $345
line 519
;519:		return;
ADDRGP4 $342
JUMPV
LABELV $343
line 521
;520:
;521:	s_dynamic.background[ s_dynamic.depth - 1 ] = trap_R_RegisterShaderNoMip(background);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+55348-4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 522
;522:}
LABELV $342
endproc DynamicMenu_AddBackground 8 4
proc DynamicMenu_IconSpace 0 0
line 532
;523:
;524:
;525:
;526:/*
;527:=================
;528:DynamicMenu_IconSpace
;529:=================
;530:*/
;531:static float DynamicMenu_IconSpace( void )
;532:{
line 533
;533:	return (MENUICON_WIDTH + 2*MENUICON_GAP);
CNSTF4 1103101952
RETF4
LABELV $349
endproc DynamicMenu_IconSpace 0 0
export DynamicMenu_FinishSubMenuInit
proc DynamicMenu_FinishSubMenuInit 84 8
line 548
;534:}
;535:
;536:
;537:
;538:/*
;539:=================
;540:DynamicMenu_FinishInitSubMenu
;541:
;542:Where we need pixel accurate positioning we
;543:need to use pixels of 1/uis.scale size in
;544:the virtual 640x480 screen
;545:=================
;546:*/
;547:void DynamicMenu_FinishSubMenuInit( void )
;548:{
line 561
;549:	int depth;
;550:	int width;
;551:	float maxwidth;
;552:	float height, lineheight;
;553:	float posx, posy;
;554:	int i, count, start, active;
;555:	float scale;
;556:	menutext_s* ptr;
;557:	dynamicitem_t* dptr;
;558:	qboolean submenu;
;559:	qboolean icon;
;560:
;561:	depth = s_dynamic.depth - 1;
ADDRLP4 48
ADDRGP4 s_dynamic+56472
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 564
;562:
;563:	// find the widest item
;564:	submenu = qfalse;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 565
;565:	icon = qfalse;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 566
;566:	maxwidth = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 567
;567:	start = s_dynamic.start[depth];
ADDRLP4 12
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56372
ADDP4
INDIRI4
ASGNI4
line 568
;568:	count = s_dynamic.end[depth] - start;
ADDRLP4 28
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56396
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 569
;569:	for ( i = 0; i < count; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $357
JUMPV
LABELV $354
line 570
;570:	{
line 571
;571:		width = UI_ProportionalStringWidth(s_dynamic.data[i + start].text);
CNSTI4 108
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
MULI4
ADDRGP4 s_dynamic+27700
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 64
INDIRI4
ASGNI4
line 572
;572:		if (width > maxwidth)
ADDRLP4 20
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
LEF4 $359
line 573
;573:			maxwidth = width;
ADDRLP4 16
ADDRLP4 20
INDIRI4
CVIF4 4
ASGNF4
LABELV $359
line 575
;574:
;575:		if (s_dynamic.data[i + start].createSubMenu)
CNSTI4 108
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
MULI4
ADDRGP4 s_dynamic+27700+84
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $361
line 576
;576:			submenu = qtrue;
ADDRLP4 44
CNSTI4 1
ASGNI4
LABELV $361
line 578
;577:
;578:		if (s_dynamic.data[i + start].icon)
CNSTI4 108
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
MULI4
ADDRGP4 s_dynamic+27700+80
ADDP4
INDIRI4
CNSTI4 0
EQI4 $365
line 579
;579:			icon = qtrue;
ADDRLP4 40
CNSTI4 1
ASGNI4
LABELV $365
line 580
;580:	}
LABELV $355
line 569
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $357
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $354
line 582
;581:
;582:	if (submenu)
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $369
line 583
;583:	{
line 584
;584:		maxwidth += UI_ProportionalStringWidth(" \r");	// space and submenu pointer
ADDRGP4 $371
ARGP4
ADDRLP4 64
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 64
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 585
;585:	}
LABELV $369
line 587
;586:
;587:	scale = UI_ProportionalSizeScale(UI_SMALLFONT, 0);
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 64
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 64
INDIRF4
ASGNF4
line 588
;588:	maxwidth *= scale;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ASGNF4
line 589
;589:	maxwidth *= (MENU_SCALE * 1.2);	// some adjustment for scaling of font used
ADDRLP4 16
CNSTF4 1064078148
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 590
;590:    maxwidth += MENUSPACE_X;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1093664768
ADDF4
ASGNF4
line 592
;591:
;592:	if (icon)
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $372
line 593
;593:		maxwidth += DynamicMenu_IconSpace();
ADDRLP4 68
ADDRGP4 DynamicMenu_IconSpace
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ASGNF4
LABELV $372
line 595
;594:
;595:	s_dynamic.icon[depth] = icon;
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56444
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 598
;596:
;597:	// determine the position of the menu
;598:	lineheight = PROP_HEIGHT * scale + 2*MENUSPACE_Y;
ADDRLP4 24
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
ADDRLP4 52
INDIRF4
MULF4
CNSTF4 1082969293
ADDF4
ASGNF4
line 599
;599:	height = count * lineheight;
ADDRLP4 56
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 601
;600:
;601:	if (depth == 0)
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $376
line 602
;602:	{
line 603
;603:		posy = 240 - height/2;
ADDRLP4 32
CNSTF4 1131413504
ADDRLP4 56
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
ASGNF4
line 604
;604:		posx = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
line 605
;605:	}
ADDRGP4 $377
JUMPV
LABELV $376
line 607
;606:	else
;607:	{
line 608
;608:		active = s_dynamic.active[depth - 1];
ADDRLP4 60
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56420-4
ADDP4
INDIRI4
ASGNI4
line 609
;609:		posx = s_dynamic.data[active].trueX + s_dynamic.data[active].trueW + (SUBMENU_SURROUNDGAP + SUBMENU_GAP)/uis.scale;
ADDRLP4 72
CNSTI4 108
ADDRLP4 60
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
ADDRLP4 72
INDIRI4
ADDRGP4 s_dynamic+27700+92
ADDP4
INDIRF4
ADDRLP4 72
INDIRI4
ADDRGP4 s_dynamic+27700+104
ADDP4
INDIRF4
ADDF4
CNSTF4 1065353216
ADDRGP4 uis+11444
INDIRF4
DIVF4
ADDF4
ASGNF4
line 610
;610:		posy = s_dynamic.data[active].trueY;
ADDRLP4 32
CNSTI4 108
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+96
ADDP4
INDIRF4
ASGNF4
line 612
;611:
;612:		if (posy + height > 480 - 48)
ADDRLP4 32
INDIRF4
ADDRLP4 56
INDIRF4
ADDF4
CNSTF4 1138229248
LEF4 $387
line 613
;613:			posy = 480 - 48 - height;
ADDRLP4 32
CNSTF4 1138229248
ADDRLP4 56
INDIRF4
SUBF4
ASGNF4
LABELV $387
line 614
;614:	}
LABELV $377
line 616
;615:
;616:	for (i = 0; i < count; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $392
JUMPV
LABELV $389
line 617
;617:	{
line 618
;618:		ptr = &s_dynamic.item[start + i];
ADDRLP4 8
CNSTI4 104
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
MULI4
ADDRGP4 s_dynamic+1076
ADDP4
ASGNP4
line 619
;619:		dptr = &s_dynamic.data[start + i];
ADDRLP4 0
CNSTI4 108
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
MULI4
ADDRGP4 s_dynamic+27700
ADDP4
ASGNP4
line 621
;620:
;621:		dptr->trueX = posx + (SUBMENU_SURROUNDGAP + 1)/uis.scale;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 36
INDIRF4
CNSTF4 1073741824
ADDRGP4 uis+11444
INDIRF4
DIVF4
ADDF4
ASGNF4
line 622
;622:		dptr->trueY = posy + i*lineheight;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 32
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 623
;623:		dptr->trueH = lineheight - 1 / uis.scale;
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
ADDRGP4 uis+11444
INDIRF4
DIVF4
SUBF4
ASGNF4
line 624
;624:		dptr->trueW = maxwidth;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 626
;625:
;626:		ptr->generic.x = dptr->trueX;
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 627
;627:		ptr->generic.y = dptr->trueY;
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 629
;628:
;629:		ptr->generic.left = dptr->trueX;
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 630
;630:		ptr->generic.right = dptr->trueX + dptr->trueW;
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 631
;631:		ptr->generic.top = dptr->trueY;
ADDRLP4 8
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 632
;632:		ptr->generic.bottom = dptr->trueY + dptr->trueH;
ADDRLP4 8
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 634
;633:
;634:		ptr->generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 80
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 635
;635:	}
LABELV $390
line 616
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $392
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $389
line 636
;636:}
LABELV $350
endproc DynamicMenu_FinishSubMenuInit 84 8
export DynamicMenu_OnActiveList
proc DynamicMenu_OnActiveList 8 0
line 647
;637:
;638:
;639:
;640:
;641:/*
;642:=================
;643:DynamicMenu_OnActiveList
;644:=================
;645:*/
;646:qboolean DynamicMenu_OnActiveList( int index )
;647:{
line 651
;648:	int depth;
;649:	int i;
;650:
;651:	depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+56472
INDIRI4
ASGNI4
line 653
;652:
;653:	for ( i = 0; i < depth ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $402
JUMPV
LABELV $399
line 654
;654:		if (s_dynamic.active[i] == index)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56420
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $403
line 655
;655:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $397
JUMPV
LABELV $403
LABELV $400
line 653
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $402
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $399
line 657
;656:
;657:	return qfalse;
CNSTI4 0
RETI4
LABELV $397
endproc DynamicMenu_OnActiveList 8 0
proc DynamicMenu_DrawBackground 60 20
line 668
;658:}
;659:
;660:
;661:
;662:/*
;663:=================
;664:DynamicMenu_DrawBackground
;665:=================
;666:*/
;667:static void DynamicMenu_DrawBackground( int depth )
;668:{
line 675
;669:	float fx, fy, fw, fh;
;670:	int x, y, w, h;
;671:	int first, last;
;672:	float offset;
;673:	dynamicitem_t* dptr;
;674:
;675:	first = s_dynamic.start[depth];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56372
ADDP4
INDIRI4
ASGNI4
line 676
;676:	last = s_dynamic.end[depth] - 1;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56396
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 679
;677:
;678:	// menu border
;679:	dptr = &s_dynamic.data[ first ];
ADDRLP4 12
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700
ADDP4
ASGNP4
line 681
;680:
;681:	fx = dptr->trueX;
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
line 682
;682:	fy = dptr->trueY;
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
line 683
;683:	fw = dptr->trueW;
ADDRLP4 32
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ASGNF4
line 684
;684:	fh = s_dynamic.data[ last ].trueY + s_dynamic.data[ last ].trueH - fy;
ADDRLP4 48
CNSTI4 108
ADDRLP4 8
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
ADDRLP4 48
INDIRI4
ADDRGP4 s_dynamic+27700+96
ADDP4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRGP4 s_dynamic+27700+100
ADDP4
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
line 686
;685:
;686:	offset = (SUBMENU_SURROUNDGAP + 1)/uis.scale;
ADDRLP4 4
CNSTF4 1073741824
ADDRGP4 uis+11444
INDIRF4
DIVF4
ASGNF4
line 687
;687:	UI_DrawRect(fx - offset, fy - offset, fw + 2*offset, fh + 2*offset, dynamicmenu_edgecolor);
ADDRLP4 28
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRLP4 56
CNSTF4 1073741824
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 56
INDIRF4
ADDF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 56
INDIRF4
ADDF4
ARGF4
ADDRGP4 dynamicmenu_edgecolor
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 690
;688:
;689:	// background graphic
;690:	if (!s_dynamic.background[depth])
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+55348
ADDP4
INDIRI4
CNSTI4 0
NEI4 $415
line 691
;691:		return;
ADDRGP4 $406
JUMPV
LABELV $415
line 693
;692:
;693:	x = s_dynamic.item[first].generic.left;
ADDRLP4 20
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+44
ADDP4
INDIRI4
ASGNI4
line 694
;694:	y = s_dynamic.item[first].generic.top;
ADDRLP4 24
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+48
ADDP4
INDIRI4
ASGNI4
line 696
;695:
;696:	w = s_dynamic.item[first].generic.right - x;
ADDRLP4 40
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+52
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 697
;697:	h = s_dynamic.item[last].generic.bottom - y;
ADDRLP4 44
CNSTI4 104
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+56
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 699
;698:
;699:	UI_DrawHandlePic(x, y, w, h, s_dynamic.background[ depth ]);
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+55348
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 700
;700:}
LABELV $406
endproc DynamicMenu_DrawBackground 60 20
proc DynamicMenu_MenuItemDraw 92 24
line 710
;701:
;702:
;703:
;704:/*
;705:=================
;706:DynamicMenu_MenuItemDraw
;707:=================
;708:*/
;709:static void DynamicMenu_MenuItemDraw( void* self )
;710:{
line 722
;711:	float 	fx, fy, fh, fw;
;712:	float 	*color;
;713:	int		style;
;714:	menutext_s* t;
;715:	dynamicitem_t *dptr;
;716:	vec4_t	tmp_color;
;717:	int 	depth;
;718:	qboolean active;
;719:	float scale, txt_y, offset;
;720:	int charh;
;721:
;722:	t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 723
;723:	dptr = &s_dynamic.data[ t->generic.id ];
ADDRLP4 4
CNSTI4 108
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700
ADDP4
ASGNP4
line 725
;724:
;725:	depth = DynamicMenu_DepthOfIndex(t->generic.id) - 1;
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 DynamicMenu_DepthOfIndex
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 72
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 727
;726:
;727:	if (s_dynamic.start[depth] == t->generic.id)
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56372
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
NEI4 $429
line 728
;728:		DynamicMenu_DrawBackground(depth);
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_DrawBackground
CALLV
pop
LABELV $429
line 730
;729:
;730:	fx = dptr->trueX;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
line 731
;731:	fy = dptr->trueY;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
line 732
;732:	fw = dptr->trueW;
ADDRLP4 52
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ASGNF4
line 733
;733:	fh = dptr->trueH;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ASGNF4
line 736
;734:
;735:	// draw the border for the item;
;736:	active = DynamicMenu_OnActiveList(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 DynamicMenu_OnActiveList
CALLI4
ASGNI4
ADDRLP4 56
ADDRLP4 76
INDIRI4
ASGNI4
line 737
;737:	UI_DrawRect(fx, fy, fw, fh, dynamicmenu_edgecolor);
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 dynamicmenu_edgecolor
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 739
;738:
;739:	if (active) {
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $432
line 741
;740:		// draw selected infill
;741:		offset = 1/uis.scale;	// correction for screen resolution
ADDRLP4 40
CNSTF4 1065353216
ADDRGP4 uis+11444
INDIRF4
DIVF4
ASGNF4
line 742
;742:		UI_FillRect(fx + offset, fy + offset, fw - 2*offset, fh - 2*offset, dynamicmenu_infillcolor);
ADDRLP4 8
INDIRF4
ADDRLP4 40
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 40
INDIRF4
ADDF4
ARGF4
ADDRLP4 84
CNSTF4 1073741824
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 52
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ARGF4
ADDRGP4 dynamicmenu_infillcolor
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 743
;743:	}
LABELV $432
line 745
;744:	
;745:	if (!active) {
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $435
line 747
;746:		// draw selected infill
;747:		offset = 1/uis.scale;	// correction for screen resolution
ADDRLP4 40
CNSTF4 1065353216
ADDRGP4 uis+11444
INDIRF4
DIVF4
ASGNF4
line 748
;748:		UI_FillRect(fx + offset, fy + offset, fw - 2*offset, fh - 2*offset, dynamicmenu_backgrcolor);
ADDRLP4 8
INDIRF4
ADDRLP4 40
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
INDIRF4
ADDRLP4 40
INDIRF4
ADDF4
ARGF4
ADDRLP4 84
CNSTF4 1073741824
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 52
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ARGF4
ADDRGP4 dynamicmenu_backgrcolor
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 749
;749:	}
LABELV $435
line 752
;750:
;751:	// draw the icon if present
;752:	fx += MENUSPACE_X;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1093664768
ADDF4
ASGNF4
line 753
;753:	tmp_color[0] = 1.0;
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
line 754
;754:	tmp_color[1] = 1.0;
ADDRLP4 20+4
CNSTF4 1065353216
ASGNF4
line 755
;755:	tmp_color[2] = 1.0;
ADDRLP4 20+8
CNSTF4 1065353216
ASGNF4
line 756
;756:	tmp_color[3] = 1.0;
ADDRLP4 20+12
CNSTF4 1065353216
ASGNF4
line 758
;757:
;758:	if (dptr->icon) {
ADDRLP4 4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
EQI4 $441
line 759
;759:		float icon_y = fy + 0.5*(fh - MENUICON_HEIGHT * MENU_SCALE);
ADDRLP4 80
ADDRLP4 12
INDIRF4
CNSTF4 1056964608
ADDRLP4 16
INDIRF4
CNSTF4 1098278502
SUBF4
MULF4
ADDF4
ASGNF4
line 760
;760:		tmp_color[3] = 0.8;
ADDRLP4 20+12
CNSTF4 1061997773
ASGNF4
line 762
;761:
;762:		if (t->generic.flags & QMF_GRAYED)
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $444
line 763
;763:			tmp_color[3] = 0.5;
ADDRLP4 20+12
CNSTF4 1056964608
ASGNF4
LABELV $444
line 766
;764:
;765:
;766:		trap_R_SetColor(tmp_color);
ADDRLP4 20
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 767
;767:		UI_DrawHandlePic(fx + MENUICON_GAP, icon_y, MENUICON_WIDTH * MENU_SCALE, MENUICON_HEIGHT * MENU_SCALE, dptr->icon);
ADDRLP4 8
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 84
CNSTF4 1098278502
ASGNF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 768
;768:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 769
;769:	}
LABELV $441
line 771
;770:
;771:	if (s_dynamic.icon[depth])
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56444
ADDP4
INDIRI4
CNSTI4 0
EQI4 $447
line 772
;772:		fx += DynamicMenu_IconSpace();
ADDRLP4 80
ADDRGP4 DynamicMenu_IconSpace
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ASGNF4
LABELV $447
line 776
;773:
;774:
;775:	// draw the text
;776:	if (t->generic.flags & QMF_GRAYED)
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $450
line 777
;777:		color = text_color_disabled;
ADDRLP4 60
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $451
JUMPV
LABELV $450
line 779
;778:	else
;779:		color = t->color;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $451
line 781
;780:
;781:	style = t->style;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 782
;782:	if( t->generic.flags & QMF_PULSEIFFOCUS ) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 256
BANDU4
CNSTU4 0
EQU4 $452
line 783
;783:		if( Menu_ItemAtCursor( t->generic.parent ) == t ) {
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 88
INDIRP4
CVPU4 4
NEU4 $454
line 784
;784:			style |= UI_PULSE;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 785
;785:		}
ADDRGP4 $455
JUMPV
LABELV $454
line 786
;786:		else {
line 787
;787:			style |= UI_INVERSE;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 788
;788:		}
LABELV $455
line 789
;789:	}
LABELV $452
line 791
;790:
;791:	txt_y = fy + 0.5*(fh - PROP_HEIGHT * MENU_SCALE * UI_ProportionalSizeScale( style, 0 ));
ADDRLP4 36
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 84
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 12
INDIRF4
CNSTF4 1056964608
ADDRLP4 16
INDIRF4
CNSTF4 1066192077
CNSTF4 1060320051
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
MULF4
MULF4
ADDRLP4 84
INDIRF4
MULF4
SUBF4
MULF4
ADDF4
ASGNF4
line 792
;792:	UI_DrawScaledProportionalString( fx, txt_y, t->string, style, MENU_SCALE, color );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
CNSTF4 1061494456
ARGF4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 UI_DrawScaledProportionalString
CALLV
pop
line 796
;793:
;794:
;795:	// draw the cursor for submenu if needed
;796:	if (style & UI_SMALLFONT)
ADDRLP4 36
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $457
line 797
;797:		charh = SMALLCHAR_HEIGHT;
ADDRLP4 64
ADDRGP4 cl_smallcharheight+12
INDIRI4
ASGNI4
ADDRGP4 $458
JUMPV
LABELV $457
line 799
;798:	else
;799:		charh = BIGCHAR_HEIGHT;	
ADDRLP4 64
ADDRGP4 cl_bigcharheight+12
INDIRI4
ASGNI4
LABELV $458
line 801
;800:
;801:	txt_y = fy + 0.5*(fh - charh); 
ADDRLP4 48
ADDRLP4 12
INDIRF4
CNSTF4 1056964608
ADDRLP4 16
INDIRF4
ADDRLP4 64
INDIRI4
CVIF4 4
SUBF4
MULF4
ADDF4
ASGNF4
line 802
;802:	if (dptr->createSubMenu)
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $461
line 803
;803:	{
line 804
;804:		UI_DrawChar( dptr->trueX + dptr->trueW, txt_y, 13, style|UI_RIGHT, color);
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDF4
CVFI4 4
ARGI4
ADDRLP4 48
INDIRF4
CVFI4 4
ARGI4
CNSTI4 13
ARGI4
ADDRLP4 36
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 805
;805:	}
LABELV $461
line 806
;806:}
LABELV $427
endproc DynamicMenu_MenuItemDraw 92 24
proc DynamicMenu_MenuDraw 8 20
line 817
;807:
;808:
;809:
;810:
;811:/*
;812:=================
;813:DynamicMenu_MenuDraw
;814:=================
;815:*/
;816:static void DynamicMenu_MenuDraw( void )
;817:{
line 818
;818:	if (uis.debug) {
ADDRGP4 uis+11392
INDIRI4
CNSTI4 0
EQI4 $464
line 819
;819:		UI_DrawString(0, SMALLCHAR_HEIGHT, va("depth:%i", s_dynamic.depth), UI_SMALLFONT, color_white);
ADDRGP4 $468
ARGP4
ADDRGP4 s_dynamic+56472
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 820
;820:		UI_DrawString(0, 32 + SMALLCHAR_HEIGHT, va("active: %i %i %i", s_dynamic.active[0], s_dynamic.active[1], s_dynamic.active[2] ), UI_SMALLFONT, color_white);
ADDRGP4 $471
ARGP4
ADDRGP4 s_dynamic+56420
INDIRI4
ARGI4
ADDRGP4 s_dynamic+56420+4
INDIRI4
ARGI4
ADDRGP4 s_dynamic+56420+8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 821
;821:	}
LABELV $464
line 822
;822:	Menu_Draw(&s_dynamic.menu);
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 823
;823:}
LABELV $463
endproc DynamicMenu_MenuDraw 8 20
export DynamicMenu_DepthOfIndex
proc DynamicMenu_DepthOfIndex 12 0
line 834
;824:
;825:
;826:
;827:
;828:/*
;829:=================
;830:DynamicMenu_DepthOfIndex
;831:=================
;832:*/
;833:int DynamicMenu_DepthOfIndex( int pos )
;834:{
line 838
;835:	int i;
;836:	int maxdepth, depth;
;837:
;838:	maxdepth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+56472
INDIRI4
ASGNI4
line 839
;839:	depth = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 840
;840:	for (i = 0; i < maxdepth; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $482
JUMPV
LABELV $479
line 841
;841:	{
line 842
;842:		if (pos < s_dynamic.end[i])
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56396
ADDP4
INDIRI4
GEI4 $483
line 843
;843:		{
line 844
;844:			depth = i + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 845
;845:			break;
ADDRGP4 $481
JUMPV
LABELV $483
line 847
;846:		}
;847:	}
LABELV $480
line 840
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $482
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $479
LABELV $481
line 849
;848:
;849:	return depth;
ADDRLP4 8
INDIRI4
RETI4
LABELV $477
endproc DynamicMenu_DepthOfIndex 12 0
export DynamicMenu_SetFocus
proc DynamicMenu_SetFocus 24 8
line 860
;850:}
;851:
;852:
;853:
;854:/*
;855:=================
;856:DynamicMenu_SetFocus
;857:=================
;858:*/
;859:void DynamicMenu_SetFocus( int pos )
;860:{
line 864
;861:	int i;
;862:	int depth, newdepth;
;863:
;864:	depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+56472
INDIRI4
ASGNI4
line 865
;865:	newdepth = DynamicMenu_DepthOfIndex(pos);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 DynamicMenu_DepthOfIndex
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 867
;866:
;867:	if (newdepth == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $488
line 868
;868:	{
line 869
;869:		Com_Printf("SetFocus: index %i outside menu\n", pos);
ADDRGP4 $490
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 870
;870:		return;
ADDRGP4 $486
JUMPV
LABELV $488
line 873
;871:	}
;872:
;873:	s_dynamic.active[ newdepth - 1 ] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56420-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 874
;874:	s_dynamic.depth = newdepth;
ADDRGP4 s_dynamic+56472
ADDRLP4 8
INDIRI4
ASGNI4
line 877
;875:
;876:	// hide any previous submenus
;877:	if (newdepth < depth)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $494
line 878
;878:	{
line 879
;879:		for (i = s_dynamic.start[ newdepth ]; i < s_dynamic.end[depth - 1]; i++)
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56372
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $499
JUMPV
LABELV $496
line 880
;880:		{
line 881
;881:			s_dynamic.item[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 16
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+72
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 882
;882:			s_dynamic.item[i].generic.flags &= ~QMF_GRAYED;
ADDRLP4 20
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 883
;883:		}
LABELV $497
line 879
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $499
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56396-4
ADDP4
INDIRI4
LTI4 $496
line 884
;884:	}
LABELV $494
line 886
;885:
;886:	s_dynamic.active[newdepth - 1] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+56420-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 889
;887:
;888:	// show this one (if needed)
;889:	if (s_dynamic.data[pos].createSubMenu)
CNSTI4 108
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+84
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $509
line 890
;890:		s_dynamic.data[pos].createSubMenu();
CNSTI4 108
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+84
ADDP4
INDIRP4
CALLV
pop
LABELV $509
line 891
;891:}
LABELV $486
endproc DynamicMenu_SetFocus 24 8
export DynamicMenu_ClearFocus
proc DynamicMenu_ClearFocus 0 0
line 900
;892:
;893:
;894:/*
;895:=================
;896:DynamicMenu_ClearFocus
;897:=================
;898:*/
;899:void DynamicMenu_ClearFocus( int pos )
;900:{
line 901
;901:}
LABELV $515
endproc DynamicMenu_ClearFocus 0 0
proc DynamicMenu_ActivateControl 16 8
line 911
;902:
;903:
;904:
;905:/*
;906:=================
;907:DynamicMenu_ActivateControl
;908:=================
;909:*/
;910:static void DynamicMenu_ActivateControl( int pos )
;911:{
line 915
;912:	int i;
;913:	int depth;
;914:
;915:	depth = DynamicMenu_DepthOfIndex(pos);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DynamicMenu_DepthOfIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 917
;916:
;917:	if (depth == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $517
line 918
;918:	{
line 919
;919:		Com_Printf("ActivateControl: index %i outside menu\n", pos);
ADDRGP4 $519
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 920
;920:		return;
ADDRGP4 $516
JUMPV
LABELV $517
line 924
;921:	}
;922:
;923:	// not at the deepest level, can't be a command
;924:	if (depth < s_dynamic.depth)
ADDRLP4 0
INDIRI4
ADDRGP4 s_dynamic+56472
INDIRI4
GEI4 $520
line 925
;925:		return;
ADDRGP4 $516
JUMPV
LABELV $520
line 927
;926:
;927:	if (s_dynamic.data[pos].runEvent)
CNSTI4 108
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
line 928
;928:		s_dynamic.data[pos].runEvent(pos);
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 108
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700+88
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $524
JUMPV
LABELV $523
line 930
;929:	else
;930:		Com_Printf("ActivateControl: index %i has no event\n", pos);
ADDRGP4 $529
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $524
line 931
;931:}
LABELV $516
endproc DynamicMenu_ActivateControl 16 8
proc DynamicMenu_MenuEvent 8 4
line 941
;932:
;933:
;934:
;935:/*
;936:=================
;937:DynamicMenu_MenuEvent
;938:=================
;939:*/
;940:static void DynamicMenu_MenuEvent( void* self, int event )
;941:{
line 944
;942:	menutext_s* t;
;943:
;944:	t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 946
;945:
;946:	switch (event)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $533
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $534
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $535
ADDRGP4 $531
JUMPV
line 947
;947:	{
LABELV $533
line 949
;948:	case QM_GOTFOCUS:
;949:		DynamicMenu_SetFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_SetFocus
CALLV
pop
line 950
;950:		break;
ADDRGP4 $532
JUMPV
LABELV $534
line 952
;951:	case QM_LOSTFOCUS:
;952:		DynamicMenu_ClearFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ClearFocus
CALLV
pop
line 953
;953:		break;
ADDRGP4 $532
JUMPV
LABELV $535
line 955
;954:	case QM_ACTIVATED:
;955:		DynamicMenu_ActivateControl(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ActivateControl
CALLV
pop
line 956
;956:		break;
LABELV $531
LABELV $532
line 958
;957:	}
;958:}
LABELV $530
endproc DynamicMenu_MenuEvent 8 4
export DynamicMenu_MenuInit
proc DynamicMenu_MenuInit 16 12
line 970
;959:
;960:
;961:
;962:
;963:
;964:/*
;965:=================
;966:DynamicMenu_MenuInit
;967:=================
;968:*/
;969:void DynamicMenu_MenuInit( qboolean full, qboolean wrap)
;970:{
line 973
;971:	int i;
;972:
;973:	memset(&s_dynamic.menu, 0, sizeof(dynamicmenu_t));
ADDRGP4 s_dynamic
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56476
ARGI4
ADDRGP4 memset
CALLP4
pop
line 975
;974:
;975:	s_dynamic.gametype = (int)trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $168
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_dynamic+56468
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 977
;976:
;977:	s_dynamic.menu.draw = DynamicMenu_MenuDraw;
ADDRGP4 s_dynamic+1036
ADDRGP4 DynamicMenu_MenuDraw
ASGNP4
line 978
;978:	s_dynamic.menu.fullscreen = full;
ADDRGP4 s_dynamic+1052
ADDRFP4 0
INDIRI4
ASGNI4
line 979
;979:	s_dynamic.menu.wrapAround = wrap;
ADDRGP4 s_dynamic+1044
ADDRFP4 4
INDIRI4
ASGNI4
line 980
;980:	s_dynamic.menu.native = qfalse;
ADDRGP4 s_dynamic+1056
CNSTI4 0
ASGNI4
line 981
;981:	s_dynamic.menu.uplimitscroll = -6400;
ADDRGP4 s_dynamic+1060
CNSTI4 -6400
ASGNI4
line 982
;982:	s_dynamic.menu.downlimitscroll = 6400;
ADDRGP4 s_dynamic+1064
CNSTI4 6400
ASGNI4
line 985
;983:
;984:	// start up the menu system
;985:	s_dynamic.depth = 0;
ADDRGP4 s_dynamic+56472
CNSTI4 0
ASGNI4
line 988
;986:
;987:	// force as top level menu
;988:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 989
;989:	uis.menusp = 0;
ADDRGP4 uis+20
CNSTI4 0
ASGNI4
line 992
;990:
;991:	// set menu cursor to a nice location
;992:	uis.cursorx = 50;
ADDRGP4 uis+8
CNSTI4 50
ASGNI4
line 993
;993:	uis.cursory = 240;
ADDRGP4 uis+12
CNSTI4 240
ASGNI4
line 995
;994:
;995:	for (i = 0; i < MAX_MENUITEMS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $548
line 996
;996:	{
line 997
;997:		s_dynamic.item[i].generic.type = MTYPE_PTEXT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076
ADDP4
CNSTI4 9
ASGNI4
line 998
;998:		s_dynamic.item[i].generic.flags = QMF_INACTIVE|QMF_HIDDEN|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+72
ADDP4
CNSTU4 53504
ASGNU4
line 999
;999:		s_dynamic.item[i].generic.ownerdraw = DynamicMenu_MenuItemDraw ;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+84
ADDP4
ADDRGP4 DynamicMenu_MenuItemDraw
ASGNP4
line 1000
;1000:		s_dynamic.item[i].generic.callback = DynamicMenu_MenuEvent ;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+76
ADDP4
ADDRGP4 DynamicMenu_MenuEvent
ASGNP4
line 1001
;1001:		s_dynamic.item[i].generic.id = i;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1002
;1002:		s_dynamic.item[i].string = s_dynamic.data[i].text;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+88
ADDP4
CNSTI4 108
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+27700
ADDP4
ASGNP4
line 1003
;1003:		s_dynamic.item[i].style = UI_SMALLFONT|UI_DROPSHADOW;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+92
ADDP4
CNSTI4 2064
ASGNI4
line 1004
;1004:		s_dynamic.item[i].color = color_red;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076+100
ADDP4
ADDRGP4 color_red
ASGNP4
line 1006
;1005:
;1006:		Menu_AddItem(&s_dynamic.menu, &s_dynamic.item[i]);
ADDRGP4 s_dynamic
ARGP4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+1076
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1007
;1007:	}
LABELV $549
line 995
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $548
line 1009
;1008:
;1009:	DynamicMenu_InitMapItems();
ADDRGP4 DynamicMenu_InitMapItems
CALLV
pop
line 1011
;1010:
;1011:	UI_PushMenu( &s_dynamic.menu );
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1012
;1012:}
LABELV $536
endproc DynamicMenu_MenuInit 16 12
bss
align 4
LABELV s_dynamic
skip 56476
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
LABELV $529
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $519
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $490
byte 1 83
byte 1 101
byte 1 116
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $471
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $468
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $371
byte 1 32
byte 1 13
byte 1 0
align 1
LABELV $324
byte 1 91
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 93
byte 1 0
align 1
LABELV $258
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $239
byte 1 110
byte 1 0
align 1
LABELV $230
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $219
byte 1 116
byte 1 0
align 1
LABELV $217
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
LABELV $168
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
LABELV $166
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $165
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $164
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $163
byte 1 72
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $162
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $161
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $160
byte 1 98
byte 1 32
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $159
byte 1 66
byte 1 116
byte 1 108
byte 1 32
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $158
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $157
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $156
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $155
byte 1 73
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $154
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $153
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $152
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $151
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $150
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $149
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $148
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $147
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $146
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 118
byte 1 111
byte 1 111
byte 1 100
byte 1 111
byte 1 111
byte 1 0
align 1
LABELV $145
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $144
byte 1 100
byte 1 97
byte 1 114
byte 1 107
byte 1 102
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $143
byte 1 68
byte 1 97
byte 1 114
byte 1 107
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $142
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 102
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
byte 1 0
align 1
LABELV $141
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 102
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
byte 1 0
align 1
LABELV $140
byte 1 102
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
byte 1 0
align 1
LABELV $139
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
byte 1 0
align 1
LABELV $138
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $137
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $136
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $135
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $134
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $133
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 95
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $132
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $131
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
byte 1 0
align 1
LABELV $130
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $129
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $128
byte 1 110
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $127
byte 1 78
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $126
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $125
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $124
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $123
byte 1 66
byte 1 70
byte 1 71
byte 1 49
byte 1 48
byte 1 107
byte 1 0
align 1
LABELV $122
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $121
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $120
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $119
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $118
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $117
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $116
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $115
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $114
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $113
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $112
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $111
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 32
byte 1 71
byte 1 0
align 1
LABELV $110
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $109
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $108
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 76
byte 1 0
align 1
LABELV $106
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $105
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 0
align 1
LABELV $102
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $101
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $100
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $99
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $98
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $97
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $96
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $95
byte 1 77
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 71
byte 1 0
align 1
LABELV $94
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 104
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $93
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $92
byte 1 109
byte 1 104
byte 1 0
align 1
LABELV $91
byte 1 77
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $90
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $89
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 98
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $88
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 0
align 1
LABELV $87
byte 1 89
byte 1 101
byte 1 108
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 0
align 1
LABELV $86
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $85
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $84
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 0
align 1
LABELV $83
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 117
byte 1 114
byte 1 0
