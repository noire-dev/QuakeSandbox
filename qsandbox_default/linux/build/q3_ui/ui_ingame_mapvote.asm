data
align 4
LABELV filter_gametype
byte 4 -1
byte 4 0
byte 4 1
byte 4 2
byte 4 3
byte 4 4
byte 4 5
byte 4 6
byte 4 7
byte 4 8
byte 4 9
byte 4 10
byte 4 11
byte 4 12
byte 4 13
align 4
LABELV filter_gametype_size
byte 4 15
align 4
LABELV filter_gametype_list
address $94
address $95
address $96
address $97
address $98
address $99
address $100
address $101
address $102
address $103
address $104
address $105
address $106
address $107
address $108
byte 4 0
align 4
LABELV filter_gametype_listru
address $109
address $110
address $111
address $112
address $113
address $114
address $115
address $116
address $117
address $118
address $119
address $120
address $121
address $122
address $123
byte 4 0
code
proc MapVote_LoadMapList 8 16
file "../../../code/q3_ui/ui_ingame_mapvote.c"
line 128
;1:/*
;2:=======================================================================
;3:
;4:INGAME CALLVOTE MAP SELECTION MENU
;5:
;6:=======================================================================
;7:*/
;8:
;9:
;10:
;11:
;12:
;13:#include "ui_local.h"
;14:
;15:#include "ui_startserver.h"
;16:#include "ui_dynamicmenu.h"
;17:
;18:
;19:#define MAPVOTE_FRAME		"menu/art/addbotframe"
;20:#define ART_ARROWS			"menu/art/arrows_vert_0"
;21:#define ART_ARROWUP			"menu/art/arrows_vert_top"
;22:#define ART_ARROWDOWN		"menu/art/arrows_vert_bot"
;23:#define ART_BACK0			"menu/art/back_0"
;24:#define ART_BACK1			"menu/art/back_1"
;25:#define ART_VOTE0			"menu/uie_art/vote_0"
;26:#define ART_VOTE1			"menu/uie_art/vote_1"
;27:
;28:
;29:#define LISTMAPS_PERPAGE	12
;30:#define MAX_MAPNAME			44
;31:
;32:#define SCROLLBUTTONS_X 	120
;33:
;34:
;35:#define ID_CALLVOTE 1
;36:#define ID_CANCEL 	2
;37:#define ID_MAPS		3
;38:#define ID_UP		4
;39:#define ID_DOWN		5
;40:#define ID_FILTER	6
;41:
;42:
;43:typedef struct {
;44:	menuframework_s menu;
;45:
;46:	menubitmap_s 	frame;
;47:	menutext_s		banner;
;48:
;49:	menubitmap_s 	callvote;
;50:	menubitmap_s 	cancel;
;51:	menulist_s 		maps;
;52:	menulist_s 		filter;
;53:
;54:	menubitmap_s 	arrows;
;55:	menubitmap_s 	up;
;56:	menubitmap_s 	down;
;57:
;58:	// local data
;59:	int nummaps;
;60:	int page;
;61:	int maxpage;
;62:	int index[MAX_MAPS_LIST];
;63:	char text[LISTMAPS_PERPAGE][MAX_MAPNAME];
;64:
;65:	const char* map_alias[LISTMAPS_PERPAGE];
;66:} ingame_mapvote_t;
;67:
;68:
;69:static ingame_mapvote_t s_mapvote;
;70:
;71:
;72:static int filter_gametype[] = {
;73:	-1, GT_SANDBOX, GT_FFA, GT_SINGLE, GT_TOURNAMENT, GT_TEAM, GT_CTF, GT_1FCTF, GT_OBELISK, GT_HARVESTER, GT_ELIMINATION, GT_CTF_ELIMINATION, GT_LMS, GT_DOUBLE_D, GT_DOMINATION
;74:};
;75:
;76:
;77:static int filter_gametype_size = sizeof(filter_gametype)/sizeof(filter_gametype[0]);
;78:
;79:
;80:static const char* filter_gametype_list[] = {
;81:	"All",
;82:	"Sandbox",
;83:	"Free for All",
;84:	"Single Player",
;85:	"Tournament",
;86:	"Team DM",
;87:	"Capture the Flag",
;88:	"One Flag Capture",
;89:	"Overload",
;90:	"Harvester",
;91:	"Elimination",
;92:	"CTF Elimination",
;93:	"Last Man Standing",
;94:	"Double Domination",
;95:	"Domination",
;96:	0
;97:};
;98:static const char* filter_gametype_listru[] = {
;99:	"Все",
;100:	"Песочница",
;101:	"Одиночная Игра",
;102:	"Все Против Всех",
;103:	"Турнир",
;104:	"Командный Бой",
;105:	"Захват флага",
;106:	"Один Флаг",
;107:	"Атака Базы",
;108:	"Жнец",
;109:	"Устранение",
;110:	"Устранение: Захват флага",
;111:	"Последний оставшийся",
;112:	"Двойное доминирование",
;113:	"Доминирование",
;114:	0
;115:};
;116:
;117:
;118:
;119:
;120:
;121:
;122:/*
;123:=================
;124:MapVote_LoadMapList
;125:=================
;126:*/
;127:static void MapVote_LoadMapList( void )
;128:{
line 129
;129:	s_mapvote.nummaps = UI_BuildMapListByType( s_mapvote.index, MAX_MAPS_LIST,
ADDRGP4 s_mapvote+2152
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 s_mapvote+1660+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 filter_gametype
ADDP4
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 0
ADDRGP4 UI_BuildMapListByType
CALLI4
ASGNI4
ADDRGP4 s_mapvote+2140
ADDRLP4 0
INDIRI4
ASGNI4
line 132
;130:		filter_gametype[s_mapvote.filter.curvalue], 0 );
;131:
;132:	s_mapvote.page = 0;
ADDRGP4 s_mapvote+2144
CNSTI4 0
ASGNI4
line 133
;133:	s_mapvote.maxpage = s_mapvote.nummaps / LISTMAPS_PERPAGE;
ADDRGP4 s_mapvote+2148
ADDRGP4 s_mapvote+2140
INDIRI4
CNSTI4 12
DIVI4
ASGNI4
line 134
;134:	if (s_mapvote.nummaps % LISTMAPS_PERPAGE)
ADDRGP4 s_mapvote+2140
INDIRI4
CNSTI4 12
MODI4
CNSTI4 0
EQI4 $132
line 135
;135:		s_mapvote.maxpage++;
ADDRLP4 4
ADDRGP4 s_mapvote+2148
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
line 136
;136:}
LABELV $124
endproc MapVote_LoadMapList 8 16
proc MapVote_UpdateView 64 16
line 148
;137:
;138:
;139:
;140:
;141:
;142:/*
;143:=================
;144:MapVote_UpdateView
;145:=================
;146:*/
;147:static void MapVote_UpdateView( void )
;148:{
line 157
;149:	const char* info;
;150:	int i;
;151:	int base;
;152:	char* mapname;
;153:	char* longname;
;154:	char* spacebuf;
;155:	int offset, maxoffset;
;156:
;157:	if (s_mapvote.nummaps == 0) {
ADDRGP4 s_mapvote+2140
INDIRI4
CNSTI4 0
NEI4 $137
line 158
;158:		Q_strncpyz(s_mapvote.text[0], "<<No maps found>>", MAX_MAPNAME);
ADDRGP4 s_mapvote+6248
ARGP4
ADDRGP4 $141
ARGP4
CNSTI4 44
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 159
;159:		s_mapvote.maps.numitems = 1;
ADDRGP4 s_mapvote+1528+96
CNSTI4 1
ASGNI4
line 160
;160:		return;
ADDRGP4 $136
JUMPV
LABELV $137
line 164
;161:	}
;162:
;163:	// spaces:  1234567890123456
;164:	spacebuf = "                ";
ADDRLP4 28
ADDRGP4 $144
ASGNP4
line 165
;165:	maxoffset = strlen(spacebuf) - 1;
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 32
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 167
;166:
;167:	base = s_mapvote.page * LISTMAPS_PERPAGE;
ADDRLP4 16
CNSTI4 12
ADDRGP4 s_mapvote+2144
INDIRI4
MULI4
ASGNI4
line 168
;168:	s_mapvote.maps.numitems = 0;
ADDRGP4 s_mapvote+1528+96
CNSTI4 0
ASGNI4
line 169
;169:	for (i = 0; i < LISTMAPS_PERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $148
line 170
;170:	{
line 171
;171:		if (base + i >= s_mapvote.nummaps)
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 s_mapvote+2140
INDIRI4
LTI4 $152
line 172
;172:			break;
ADDRGP4 $150
JUMPV
LABELV $152
line 174
;173:
;174:		info = UI_GetArenaInfoByNumber(s_mapvote.index[base + i]);
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapvote+2152
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
ASGNP4
line 176
;175:
;176:		mapname = Info_ValueForKey(info, "map");
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 40
INDIRP4
ASGNP4
line 177
;177:		longname = Info_ValueForKey(info, "longname");
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 44
INDIRP4
ASGNP4
line 179
;178:
;179:		if (!mapname[0])
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $158
line 180
;180:			continue;
ADDRGP4 $149
JUMPV
LABELV $158
line 182
;181:
;182:		offset = strlen(mapname);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 48
INDIRI4
ASGNI4
line 183
;183:		if (offset > maxoffset)
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $160
line 184
;184:			offset = maxoffset;
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
LABELV $160
line 186
;185:
;186:		Q_strncpyz( s_mapvote.text[i], va("%s%s - %s", &spacebuf[offset], mapname, longname), MAX_MAPNAME);
ADDRGP4 $163
ARGP4
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRP4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 56
CNSTI4 44
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapvote+6248
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 188
;187:
;188:		s_mapvote.maps.numitems++;
ADDRLP4 60
ADDRGP4 s_mapvote+1528+96
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 189
;189:	}
LABELV $149
line 169
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $148
LABELV $150
line 191
;190:
;191:	if (s_mapvote.maps.curvalue >= s_mapvote.maps.numitems) {
ADDRGP4 s_mapvote+1528+92
INDIRI4
ADDRGP4 s_mapvote+1528+96
INDIRI4
LTI4 $166
line 192
;192:		s_mapvote.maps.curvalue = s_mapvote.maps.numitems - 1;
ADDRGP4 s_mapvote+1528+92
ADDRGP4 s_mapvote+1528+96
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 193
;193:	}
LABELV $166
line 196
;194:
;195:	// movement arrows
;196:	if (s_mapvote.page == 0 || s_mapvote.maxpage == 1)
ADDRGP4 s_mapvote+2144
INDIRI4
CNSTI4 0
EQI4 $180
ADDRGP4 s_mapvote+2148
INDIRI4
CNSTI4 1
NEI4 $176
LABELV $180
line 197
;197:		s_mapvote.up.generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 36
ADDRGP4 s_mapvote+1908+72
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
ADDRGP4 $177
JUMPV
LABELV $176
line 199
;198:	else
;199:		s_mapvote.up.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 40
ADDRGP4 s_mapvote+1908+72
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
LABELV $177
line 201
;200:
;201:	if ((s_mapvote.page == s_mapvote.maxpage - 1) || s_mapvote.maxpage == 1)
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRGP4 s_mapvote+2144
INDIRI4
ADDRGP4 s_mapvote+2148
INDIRI4
ADDRLP4 44
INDIRI4
SUBI4
EQI4 $190
ADDRGP4 s_mapvote+2148
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $185
LABELV $190
line 202
;202:		s_mapvote.down.generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 48
ADDRGP4 s_mapvote+2024+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
ADDRGP4 $186
JUMPV
LABELV $185
line 204
;203:	else
;204:		s_mapvote.down.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 52
ADDRGP4 s_mapvote+2024+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
LABELV $186
line 206
;205:
;206:	if (s_mapvote.maxpage == 1)
ADDRGP4 s_mapvote+2148
INDIRI4
CNSTI4 1
NEI4 $195
line 207
;207:		s_mapvote.arrows.generic.flags |= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 s_mapvote+1792+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
ADDRGP4 $196
JUMPV
LABELV $195
line 209
;208:	else
;209:		s_mapvote.arrows.generic.flags &= ~QMF_GRAYED;
ADDRLP4 60
ADDRGP4 s_mapvote+1792+72
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
LABELV $196
line 210
;210:}
LABELV $136
endproc MapVote_UpdateView 64 16
proc MapVote_SetFilter 4 0
line 221
;211:
;212:
;213:
;214:
;215:/*
;216:=================
;217:MapVote_SetFilter
;218:=================
;219:*/
;220:static void MapVote_SetFilter( int gametype )
;221:{
line 224
;222:	int i;
;223:
;224:	s_mapvote.filter.curvalue = 0;
ADDRGP4 s_mapvote+1660+92
CNSTI4 0
ASGNI4
line 225
;225:	for (i = 0; i < filter_gametype_size; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $205
line 226
;226:	{
line 227
;227:		if (gametype == filter_gametype[i]) {
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 filter_gametype
ADDP4
INDIRI4
NEI4 $209
line 228
;228:			s_mapvote.filter.curvalue = i;
ADDRGP4 s_mapvote+1660+92
ADDRLP4 0
INDIRI4
ASGNI4
line 229
;229:			break;
ADDRGP4 $207
JUMPV
LABELV $209
line 231
;230:		}
;231:	}
LABELV $206
line 225
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $208
ADDRLP4 0
INDIRI4
ADDRGP4 filter_gametype_size
INDIRI4
LTI4 $205
LABELV $207
line 233
;232:
;233:	MapVote_LoadMapList();
ADDRGP4 MapVote_LoadMapList
CALLV
pop
line 234
;234:	MapVote_UpdateView();
ADDRGP4 MapVote_UpdateView
CALLV
pop
line 235
;235:}
LABELV $202
endproc MapVote_SetFilter 4 0
export MapVote_Cache
proc MapVote_Cache 0 4
line 247
;236:
;237:
;238:
;239:
;240:
;241:/*
;242:=================
;243:MapVote_Cache
;244:=================
;245:*/
;246:void MapVote_Cache( void )
;247:{
line 248
;248:	trap_R_RegisterShaderNoMip( MAPVOTE_FRAME );
ADDRGP4 $214
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 249
;249:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $215
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 250
;250:	trap_R_RegisterShaderNoMip( ART_ARROWUP );
ADDRGP4 $216
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 251
;251:	trap_R_RegisterShaderNoMip( ART_ARROWDOWN );
ADDRGP4 $217
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 252
;252:}
LABELV $213
endproc MapVote_Cache 0 4
proc MapVote_DoVote 20 8
line 263
;253:
;254:
;255:
;256:
;257:/*
;258:=================
;259:MapVote_DoVote
;260:=================
;261:*/
;262:static void MapVote_DoVote( void )
;263:{
line 267
;264:	const char* info;
;265:	int index;
;266:
;267:	index = s_mapvote.page * LISTMAPS_PERPAGE + s_mapvote.maps.curvalue;
ADDRLP4 4
CNSTI4 12
ADDRGP4 s_mapvote+2144
INDIRI4
MULI4
ADDRGP4 s_mapvote+1528+92
INDIRI4
ADDI4
ASGNI4
line 268
;268:	info = UI_GetArenaInfoByNumber(s_mapvote.index[index]);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapvote+2152
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 270
;269:
;270:	UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 271
;271:	trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote map %s\n", Info_ValueForKey(info, "map")));
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $223
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 272
;272:}
LABELV $218
endproc MapVote_DoVote 20 8
proc MapVote_Event 12 0
line 282
;273:
;274:
;275:
;276:/*
;277:=================
;278:MapVote_Event
;279:=================
;280:*/
;281:static void MapVote_Event( void *ptr, int notification )
;282:{
line 283
;283:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $225
line 284
;284:		return;
ADDRGP4 $224
JUMPV
LABELV $225
line 287
;285:	}
;286:
;287:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $227
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $227
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $245-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $245
address $230
address $231
address $228
address $234
address $239
address $233
code
LABELV $230
line 289
;288:	case ID_CALLVOTE:
;289:		MapVote_DoVote();
ADDRGP4 MapVote_DoVote
CALLV
pop
line 290
;290:		break;
ADDRGP4 $228
JUMPV
LABELV $231
line 293
;291:
;292:	case ID_CANCEL:
;293:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 294
;294:		break;
ADDRGP4 $228
JUMPV
line 297
;295:
;296:	case ID_MAPS:
;297:		break;
LABELV $233
line 300
;298:
;299:	case ID_FILTER:
;300:		MapVote_LoadMapList();
ADDRGP4 MapVote_LoadMapList
CALLV
pop
line 301
;301:		MapVote_UpdateView();
ADDRGP4 MapVote_UpdateView
CALLV
pop
line 302
;302:		break;
ADDRGP4 $228
JUMPV
LABELV $234
line 305
;303:
;304:	case ID_UP:
;305:		if (s_mapvote.page > 0) {
ADDRGP4 s_mapvote+2144
INDIRI4
CNSTI4 0
LEI4 $228
line 306
;306:			s_mapvote.page--;
ADDRLP4 8
ADDRGP4 s_mapvote+2144
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 307
;307:			MapVote_UpdateView();
ADDRGP4 MapVote_UpdateView
CALLV
pop
line 308
;308:		}
line 309
;309:		break;
ADDRGP4 $228
JUMPV
LABELV $239
line 312
;310:
;311:	case ID_DOWN:
;312:		if (s_mapvote.page < s_mapvote.maxpage - 1) {
ADDRGP4 s_mapvote+2144
INDIRI4
ADDRGP4 s_mapvote+2148
INDIRI4
CNSTI4 1
SUBI4
GEI4 $228
line 313
;313:			s_mapvote.page++;
ADDRLP4 8
ADDRGP4 s_mapvote+2144
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 314
;314:			MapVote_UpdateView();
ADDRGP4 MapVote_UpdateView
CALLV
pop
line 315
;315:		}
line 316
;316:		break;
LABELV $227
LABELV $228
line 319
;317:	}
;318:
;319:}
LABELV $224
endproc MapVote_Event 12 0
proc MapVote_MenuInit 16 12
line 329
;320:
;321:
;322:
;323:
;324:/*
;325:=================
;326:MapVote_MenuInit
;327:=================
;328:*/
;329:static void MapVote_MenuInit( void ) {
line 334
;330:	int		y;
;331:	int		i;
;332:	int		gametype;
;333:
;334:	memset( &s_mapvote, 0 ,sizeof(ingame_mapvote_t) );
ADDRGP4 s_mapvote
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6824
ARGI4
ADDRGP4 memset
CALLP4
pop
line 336
;335:
;336:	MapVote_Cache();
ADDRGP4 MapVote_Cache
CALLV
pop
line 338
;337:
;338:	s_mapvote.menu.wrapAround = qtrue;
ADDRGP4 s_mapvote+1044
CNSTI4 1
ASGNI4
line 339
;339:	s_mapvote.menu.native 	  = qfalse;
ADDRGP4 s_mapvote+1056
CNSTI4 0
ASGNI4
line 340
;340:	s_mapvote.menu.fullscreen = qfalse;
ADDRGP4 s_mapvote+1052
CNSTI4 0
ASGNI4
line 343
;341://	s_mapvote.menu.draw = InGame_MenuDraw;
;342:
;343:	s_mapvote.frame.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_mapvote+1076
CNSTI4 6
ASGNI4
line 344
;344:	s_mapvote.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_mapvote+1076+72
CNSTU4 16384
ASGNU4
line 345
;345:	s_mapvote.frame.generic.name			= MAPVOTE_FRAME;
ADDRGP4 s_mapvote+1076+4
ADDRGP4 $214
ASGNP4
line 346
;346:	s_mapvote.frame.generic.x			= 320-280;
ADDRGP4 s_mapvote+1076+28
CNSTI4 40
ASGNI4
line 347
;347:	s_mapvote.frame.generic.y			= 240-180;
ADDRGP4 s_mapvote+1076+32
CNSTI4 60
ASGNI4
line 348
;348:	s_mapvote.frame.width				= 560;
ADDRGP4 s_mapvote+1076+104
CNSTI4 560
ASGNI4
line 349
;349:	s_mapvote.frame.height				= 360;
ADDRGP4 s_mapvote+1076+108
CNSTI4 360
ASGNI4
line 351
;350:
;351:	s_mapvote.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 s_mapvote+1192
CNSTI4 10
ASGNI4
line 352
;352:	s_mapvote.banner.generic.x			= 320;
ADDRGP4 s_mapvote+1192+28
CNSTI4 320
ASGNI4
line 353
;353:	s_mapvote.banner.generic.y			= 16;
ADDRGP4 s_mapvote+1192+32
CNSTI4 16
ASGNI4
line 354
;354:	s_mapvote.banner.color				= color_white;
ADDRGP4 s_mapvote+1192+100
ADDRGP4 color_white
ASGNP4
line 355
;355:	s_mapvote.banner.style				= UI_CENTER;
ADDRGP4 s_mapvote+1192+92
CNSTI4 1
ASGNI4
line 356
;356:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $273
line 357
;357:	s_mapvote.banner.string				= "CALLVOTE MAP";
ADDRGP4 s_mapvote+1192+88
ADDRGP4 $278
ASGNP4
line 358
;358:	}
LABELV $273
line 359
;359:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $279
line 360
;360:	s_mapvote.banner.string				= "ВЫЗОВ ГОЛОСОВАНИЯ КАРТЫ";
ADDRGP4 s_mapvote+1192+88
ADDRGP4 $284
ASGNP4
line 361
;361:	}
LABELV $279
line 364
;362:
;363:
;364:	for (i = 0; i < LISTMAPS_PERPAGE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $285
line 365
;365:		s_mapvote.map_alias[i] = s_mapvote.text[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapvote+6776
ADDP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapvote+6248
ADDP4
ASGNP4
line 366
;366:	}
LABELV $286
line 364
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $285
line 368
;367:
;368:	s_mapvote.maps.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_mapvote+1528
CNSTI4 8
ASGNI4
line 369
;369:	s_mapvote.maps.generic.flags		= QMF_PULSEIFFOCUS;
ADDRGP4 s_mapvote+1528+72
CNSTU4 256
ASGNU4
line 370
;370:	s_mapvote.maps.generic.callback	= MapVote_Event;
ADDRGP4 s_mapvote+1528+76
ADDRGP4 MapVote_Event
ASGNP4
line 371
;371:	s_mapvote.maps.generic.id			= ID_MAPS;
ADDRGP4 s_mapvote+1528+24
CNSTI4 3
ASGNI4
line 372
;372:	s_mapvote.maps.generic.x			= 176;
ADDRGP4 s_mapvote+1528+28
CNSTI4 176
ASGNI4
line 373
;373:	s_mapvote.maps.generic.y			= 98;
ADDRGP4 s_mapvote+1528+32
CNSTI4 98
ASGNI4
line 374
;374:	s_mapvote.maps.width				= MAX_MAPNAME;
ADDRGP4 s_mapvote+1528+112
CNSTI4 44
ASGNI4
line 375
;375:	s_mapvote.maps.height				= LISTMAPS_PERPAGE;
ADDRGP4 s_mapvote+1528+116
CNSTI4 12
ASGNI4
line 376
;376:	s_mapvote.maps.numitems			= 0;
ADDRGP4 s_mapvote+1528+96
CNSTI4 0
ASGNI4
line 377
;377:	s_mapvote.maps.itemnames			= s_mapvote.map_alias;
ADDRGP4 s_mapvote+1528+104
ADDRGP4 s_mapvote+6776
ASGNP4
line 378
;378:	s_mapvote.maps.columns			= 1;
ADDRGP4 s_mapvote+1528+120
CNSTI4 1
ASGNI4
line 380
;379:
;380:	y = 180;
ADDRLP4 4
CNSTI4 180
ASGNI4
line 381
;381:	s_mapvote.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mapvote+1792
CNSTI4 6
ASGNI4
line 382
;382:	s_mapvote.arrows.generic.name  = ART_ARROWS;
ADDRGP4 s_mapvote+1792+4
ADDRGP4 $215
ASGNP4
line 383
;383:	s_mapvote.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_mapvote+1792+72
CNSTU4 16384
ASGNU4
line 384
;384:	s_mapvote.arrows.generic.x	 = SCROLLBUTTONS_X;
ADDRGP4 s_mapvote+1792+28
CNSTI4 120
ASGNI4
line 385
;385:	s_mapvote.arrows.generic.y	 = y;
ADDRGP4 s_mapvote+1792+32
ADDRLP4 4
INDIRI4
ASGNI4
line 386
;386:	s_mapvote.arrows.width  	     = 64;
ADDRGP4 s_mapvote+1792+104
CNSTI4 64
ASGNI4
line 387
;387:	s_mapvote.arrows.height  	     = 128;
ADDRGP4 s_mapvote+1792+108
CNSTI4 128
ASGNI4
line 389
;388:
;389:	s_mapvote.up.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_mapvote+1908
CNSTI4 6
ASGNI4
line 390
;390:	s_mapvote.up.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapvote+1908+72
CNSTU4 260
ASGNU4
line 391
;391:	s_mapvote.up.generic.callback = MapVote_Event;
ADDRGP4 s_mapvote+1908+76
ADDRGP4 MapVote_Event
ASGNP4
line 392
;392:	s_mapvote.up.generic.id	    = ID_UP;
ADDRGP4 s_mapvote+1908+24
CNSTI4 4
ASGNI4
line 393
;393:	s_mapvote.up.generic.x		= SCROLLBUTTONS_X;
ADDRGP4 s_mapvote+1908+28
CNSTI4 120
ASGNI4
line 394
;394:	s_mapvote.up.generic.y		= y;
ADDRGP4 s_mapvote+1908+32
ADDRLP4 4
INDIRI4
ASGNI4
line 395
;395:	s_mapvote.up.width  		    = 64;
ADDRGP4 s_mapvote+1908+104
CNSTI4 64
ASGNI4
line 396
;396:	s_mapvote.up.height  		    = 64;
ADDRGP4 s_mapvote+1908+108
CNSTI4 64
ASGNI4
line 397
;397:	s_mapvote.up.focuspic     = ART_ARROWUP;
ADDRGP4 s_mapvote+1908+88
ADDRGP4 $216
ASGNP4
line 399
;398:
;399:	s_mapvote.down.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_mapvote+2024
CNSTI4 6
ASGNI4
line 400
;400:	s_mapvote.down.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapvote+2024+72
CNSTU4 260
ASGNU4
line 401
;401:	s_mapvote.down.generic.callback = MapVote_Event;
ADDRGP4 s_mapvote+2024+76
ADDRGP4 MapVote_Event
ASGNP4
line 402
;402:	s_mapvote.down.generic.id	    = ID_DOWN;
ADDRGP4 s_mapvote+2024+24
CNSTI4 5
ASGNI4
line 403
;403:	s_mapvote.down.generic.x		= SCROLLBUTTONS_X;
ADDRGP4 s_mapvote+2024+28
CNSTI4 120
ASGNI4
line 404
;404:	s_mapvote.down.generic.y		=  y + 64;
ADDRGP4 s_mapvote+2024+32
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 405
;405:	s_mapvote.down.width  		    = 64;
ADDRGP4 s_mapvote+2024+104
CNSTI4 64
ASGNI4
line 406
;406:	s_mapvote.down.height  		    = 64;
ADDRGP4 s_mapvote+2024+108
CNSTI4 64
ASGNI4
line 407
;407:	s_mapvote.down.focuspic = ART_ARROWDOWN;
ADDRGP4 s_mapvote+2024+88
ADDRGP4 $217
ASGNP4
line 409
;408:
;409:	s_mapvote.callvote.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_mapvote+1296
CNSTI4 6
ASGNI4
line 410
;410:	s_mapvote.callvote.generic.name 	= ART_VOTE0;
ADDRGP4 s_mapvote+1296+4
ADDRGP4 $363
ASGNP4
line 411
;411:	s_mapvote.callvote.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapvote+1296+72
CNSTU4 260
ASGNU4
line 412
;412:	s_mapvote.callvote.generic.callback = MapVote_Event;
ADDRGP4 s_mapvote+1296+76
ADDRGP4 MapVote_Event
ASGNP4
line 413
;413:	s_mapvote.callvote.generic.id	    = ID_CALLVOTE;
ADDRGP4 s_mapvote+1296+24
CNSTI4 1
ASGNI4
line 414
;414:	s_mapvote.callvote.generic.x		= 320;
ADDRGP4 s_mapvote+1296+28
CNSTI4 320
ASGNI4
line 415
;415:	s_mapvote.callvote.generic.y		=  256 + 64;
ADDRGP4 s_mapvote+1296+32
CNSTI4 320
ASGNI4
line 416
;416:	s_mapvote.callvote.width  		    = 128;
ADDRGP4 s_mapvote+1296+104
CNSTI4 128
ASGNI4
line 417
;417:	s_mapvote.callvote.height  		    = 64;
ADDRGP4 s_mapvote+1296+108
CNSTI4 64
ASGNI4
line 418
;418:	s_mapvote.callvote.focuspic 		= ART_VOTE1;
ADDRGP4 s_mapvote+1296+88
ADDRGP4 $380
ASGNP4
line 420
;419:
;420:	s_mapvote.cancel.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_mapvote+1412
CNSTI4 6
ASGNI4
line 421
;421:	s_mapvote.cancel.generic.name 	= ART_BACK0;
ADDRGP4 s_mapvote+1412+4
ADDRGP4 $384
ASGNP4
line 422
;422:	s_mapvote.cancel.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapvote+1412+72
CNSTU4 260
ASGNU4
line 423
;423:	s_mapvote.cancel.generic.callback = MapVote_Event;
ADDRGP4 s_mapvote+1412+76
ADDRGP4 MapVote_Event
ASGNP4
line 424
;424:	s_mapvote.cancel.generic.id	    = ID_CANCEL;
ADDRGP4 s_mapvote+1412+24
CNSTI4 2
ASGNI4
line 425
;425:	s_mapvote.cancel.generic.x		= 320 - 128;
ADDRGP4 s_mapvote+1412+28
CNSTI4 192
ASGNI4
line 426
;426:	s_mapvote.cancel.generic.y		=  256 + 64;
ADDRGP4 s_mapvote+1412+32
CNSTI4 320
ASGNI4
line 427
;427:	s_mapvote.cancel.width  		    = 128;
ADDRGP4 s_mapvote+1412+104
CNSTI4 128
ASGNI4
line 428
;428:	s_mapvote.cancel.height  		    = 64;
ADDRGP4 s_mapvote+1412+108
CNSTI4 64
ASGNI4
line 429
;429:	s_mapvote.cancel.focuspic 		= ART_BACK1;
ADDRGP4 s_mapvote+1412+88
ADDRGP4 $401
ASGNP4
line 431
;430:
;431:	s_mapvote.filter.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_mapvote+1660
CNSTI4 3
ASGNI4
line 432
;432:	s_mapvote.filter.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mapvote+1660+72
CNSTU4 258
ASGNU4
line 433
;433:	s_mapvote.filter.generic.callback	= MapVote_Event;
ADDRGP4 s_mapvote+1660+76
ADDRGP4 MapVote_Event
ASGNP4
line 434
;434:	s_mapvote.filter.generic.id			= ID_FILTER;
ADDRGP4 s_mapvote+1660+24
CNSTI4 6
ASGNI4
line 435
;435:	s_mapvote.filter.generic.x			= 320;
ADDRGP4 s_mapvote+1660+28
CNSTI4 320
ASGNI4
line 436
;436:	s_mapvote.filter.generic.y			= 256 + 64 - SMALLCHAR_HEIGHT;
ADDRGP4 s_mapvote+1660+32
CNSTI4 320
ADDRGP4 cl_smallcharheight+12
INDIRI4
SUBI4
ASGNI4
line 437
;437:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $414
line 438
;438:	s_mapvote.filter.generic.name		= "Gametype:";
ADDRGP4 s_mapvote+1660+4
ADDRGP4 $419
ASGNP4
line 439
;439:	s_mapvote.filter.itemnames			= filter_gametype_list;
ADDRGP4 s_mapvote+1660+104
ADDRGP4 filter_gametype_list
ASGNP4
line 440
;440:	}
LABELV $414
line 441
;441:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $422
line 442
;442:	s_mapvote.filter.generic.name		= "Режим игры:";
ADDRGP4 s_mapvote+1660+4
ADDRGP4 $427
ASGNP4
line 443
;443:	s_mapvote.filter.itemnames			= filter_gametype_listru;
ADDRGP4 s_mapvote+1660+104
ADDRGP4 filter_gametype_listru
ASGNP4
line 444
;444:	}
LABELV $422
line 446
;445:
;446:	Menu_AddItem( &s_mapvote.menu, &s_mapvote.frame );
ADDRGP4 s_mapvote
ARGP4
ADDRGP4 s_mapvote+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 447
;447:	Menu_AddItem( &s_mapvote.menu, &s_mapvote.banner );
ADDRGP4 s_mapvote
ARGP4
ADDRGP4 s_mapvote+1192
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 448
;448:	Menu_AddItem( &s_mapvote.menu, &s_mapvote.maps );
ADDRGP4 s_mapvote
ARGP4
ADDRGP4 s_mapvote+1528
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 449
;449:	Menu_AddItem( &s_mapvote.menu, &s_mapvote.arrows );
ADDRGP4 s_mapvote
ARGP4
ADDRGP4 s_mapvote+1792
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 450
;450:	Menu_AddItem( &s_mapvote.menu, &s_mapvote.up );
ADDRGP4 s_mapvote
ARGP4
ADDRGP4 s_mapvote+1908
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 451
;451:	Menu_AddItem( &s_mapvote.menu, &s_mapvote.down );
ADDRGP4 s_mapvote
ARGP4
ADDRGP4 s_mapvote+2024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 452
;452:	Menu_AddItem( &s_mapvote.menu, &s_mapvote.callvote );
ADDRGP4 s_mapvote
ARGP4
ADDRGP4 s_mapvote+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 453
;453:	Menu_AddItem( &s_mapvote.menu, &s_mapvote.cancel );
ADDRGP4 s_mapvote
ARGP4
ADDRGP4 s_mapvote+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 454
;454:	Menu_AddItem( &s_mapvote.menu, &s_mapvote.filter);
ADDRGP4 s_mapvote
ARGP4
ADDRGP4 s_mapvote+1660
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 456
;455:
;456:	gametype = DynamicMenu_ServerGametype();
ADDRLP4 12
ADDRGP4 DynamicMenu_ServerGametype
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 457
;457:	MapVote_SetFilter(gametype);
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 MapVote_SetFilter
CALLV
pop
line 458
;458:}
LABELV $247
endproc MapVote_MenuInit 16 12
export UI_MapCallVote
proc UI_MapCallVote 0 4
line 468
;459:
;460:
;461:
;462:/*
;463:=================
;464:UI_MapCallVote
;465:=================
;466:*/
;467:void UI_MapCallVote( void )
;468:{
line 469
;469:	MapVote_MenuInit();
ADDRGP4 MapVote_MenuInit
CALLV
pop
line 471
;470:
;471:	UI_PushMenu(&s_mapvote.menu);
ADDRGP4 s_mapvote
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 472
;472:}
LABELV $439
endproc UI_MapCallVote 0 4
bss
align 4
LABELV s_mapvote
skip 6824
import DynamicMenu_AddListOfItems
import DynamicMenu_AddListOfPlayers
import DynamicMenu_ItemShortname
import DynamicMenu_ActiveIndexAtDepth
import DynamicMenu_ActiveIdAtDepth
import DynamicMenu_IdAtIndex
import DynamicMenu_DepthOfIndex
import DynamicMenu_StringAtIndex
import DynamicMenu_OnActiveList
import DynamicMenu_Depth
import DynamicMenu_ServerGametype
import DynamicMenu_SetFlags
import DynamicMenu_SetFocus
import DynamicMenu_ClearFocus
import DynamicMenu_MenuInit
import DynamicMenu_FinishSubMenuInit
import DynamicMenu_SubMenuInit
import DynamicMenu_AddBackground
import DynamicMenu_AddIconItem
import DynamicMenu_AddItem
import mapfilter_itemsru
import mapfilter_items
import gametype_cvar_base
import randommaptype_itemsru
import randommaptype_items
import gametype_itemsru
import gametype_items
import idmap_list
import UI_LoadMapTypeInfo
import StartServer_MapIconFromType
import StartServer_IsCustomMapType
import StartServer_DrawMapPicture
import StartServer_InitMapPicture
import StartServer_InitMapPictureFromIndex
import StartServer_NumCustomMapTypes
import StartServer_MapSupportsBots
import StartServer_SetIconFromGameType
import UI_BuildMapListByType
import GametypeBits
import StartServer_GetLastScriptError
import StartServer_CreateServer
import StartServer_LoadFromConfig
import UI_SaveMultiArray
import UI_LoadMultiArray
import StartServer_SaveScriptData
import StartServer_LoadScriptDataFromType
import StartServer_InitScriptData
import UIE_ConvertOldCvar
import UIE_SkirmishCvarExists
import UIE_StartServer_LoadSkirmishCvars
import UIE_StartServer_SaveSkirmishCvars
import UIE_GetSkirmishCvarIntClamp
import UIE_GetSkirmishCvarInt
import UIE_GetSkirmishCvar
import UIE_SetSkirmishCvarInt
import UIE_SetSkirmishCvar
import StartServer_CanFight
import s_scriptdata
import StartServer_LoadDisabledItems
import server_itemlist
import StartServer_IsRandomBotExclude
import StartServer_IsBotArenaScript
import StartServer_IsRandomBotList
import StartServer_SlotTeam
import StartServer_ValidateBotSlotCount
import StartServer_BotOnSelectionList
import StartServer_ValidBotCount
import StartServer_BotNameDrawn
import StartServer_InsertNamedBot
import StartServer_SetNamedBot
import StartServer_SetBotSkillRangeType
import StartServer_DoBotAction
import StartServer_MoveBotToOtherTeam
import StartServer_DeleteBotSlot
import StartServer_InsertBotSlot
import StartServer_SaveBotNameList
import StartServer_LoadBotNameList
import StartServer_IsIdMap
import StartServer_IsRandomGeneratedMapList
import StartServer_RangeClipMapIndex
import StartServer_MapPageCount
import StartServer_MapDoAction
import StartServer_SwapMaps
import StartServer_DeleteMap
import StartServer_InsertMap
import StartServer_StoreMap
import StartServer_RefreshMapNames
import StartServer_SaveMapList
import StartServer_LoadMapList
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
LABELV $427
byte 1 208
byte 1 160
byte 1 208
byte 1 181
byte 1 208
byte 1 182
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $419
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $401
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
LABELV $384
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
LABELV $380
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $363
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $284
byte 1 208
byte 1 146
byte 1 208
byte 1 171
byte 1 208
byte 1 151
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 32
byte 1 208
byte 1 147
byte 1 208
byte 1 158
byte 1 208
byte 1 155
byte 1 208
byte 1 158
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 175
byte 1 32
byte 1 208
byte 1 154
byte 1 208
byte 1 144
byte 1 208
byte 1 160
byte 1 208
byte 1 162
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $278
byte 1 67
byte 1 65
byte 1 76
byte 1 76
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 0
align 1
LABELV $223
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
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
LABELV $217
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
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $216
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
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $215
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
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $214
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
LABELV $163
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $157
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $156
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $144
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $141
byte 1 60
byte 1 60
byte 1 78
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 62
byte 1 62
byte 1 0
align 1
LABELV $123
byte 1 208
byte 1 148
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $122
byte 1 208
byte 1 148
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $121
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 209
byte 1 136
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 209
byte 1 129
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $120
byte 1 208
byte 1 163
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 58
byte 1 32
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $119
byte 1 208
byte 1 163
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $118
byte 1 208
byte 1 150
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 209
byte 1 134
byte 1 0
align 1
LABELV $117
byte 1 208
byte 1 144
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $116
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 32
byte 1 208
byte 1 164
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 0
align 1
LABELV $115
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 209
byte 1 133
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $114
byte 1 208
byte 1 154
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $113
byte 1 208
byte 1 162
byte 1 209
byte 1 131
byte 1 209
byte 1 128
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 128
byte 1 0
align 1
LABELV $112
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 209
byte 1 133
byte 1 0
align 1
LABELV $111
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 152
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $110
byte 1 208
byte 1 159
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $109
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $108
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $107
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 68
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $106
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $105
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $104
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $103
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $102
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $101
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $100
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $99
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $98
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $97
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $96
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $95
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $94
byte 1 65
byte 1 108
byte 1 108
byte 1 0
