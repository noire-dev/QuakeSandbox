data
export mapicons_items
align 4
LABELV mapicons_items
address $94
address $95
address $96
byte 4 0
export mapicons_itemsru
align 4
LABELV mapicons_itemsru
address $97
address $98
address $99
byte 4 0
align 4
LABELV ms_lastgametype
byte 4 -1
align 4
LABELV ms_allmaps
byte 4 0
align 4
LABELV ms_filter
byte 4 0
align 4
LABELV color_nomap
byte 4 1061158912
byte 4 0
byte 4 0
byte 4 1065353216
code
proc MapSelect_MultiListPos 4 0
file "../../../code/q3_ui/ui_startserver_mapsel.c"
line 164
;1:/*
;2:=============================================================================
;3:
;4:START SERVER MENU *****
;5:
;6:=============================================================================
;7:*/
;8:
;9:
;10:
;11:#include "ui_local.h"
;12:#include "ui_startserver_q3.h"
;13:
;14:
;15:/*
;16:=============================================================================
;17:
;18:MAP SELECT MENU *****
;19:
;20:=============================================================================
;21:*/
;22:
;23:#define MAPSELECT_HARROWS "menu/art/arrows_horz_0"
;24:#define MAPSELECT_NEXT "menu/art/arrows_horz_right"
;25:#define MAPSELECT_PREVIOUS "menu/art/arrows_horz_left"
;26:#define MAPSELECT_CANCEL0 "menu/art/back_0"
;27:#define MAPSELECT_CANCEL1 "menu/art/back_1"
;28:#define MAPSELECT_ACCEPT0 "menu/art/accept_0"
;29:#define MAPSELECT_ACCEPT1 "menu/art/accept_1"
;30:#define MAPSELECT_MAPFOCUS "menu/uie_art/mapfocus"
;31:#define MAPSELECT_MAPSELECTED "menu/art/maps_selected"
;32:
;33:#define MAPNAME_LONGBUFFER 64
;34:
;35:#define MAPSELECT_ERRORPIC "menu/art/unknownmap"
;36:
;37:#define MAPPIC_WIDTH 138
;38:#define MAPPIC_HEIGHT 92
;39:
;40:#define ID_MAPSELECT_CANCEL 10
;41:#define ID_MAPSELECT_NEXT 11
;42:#define ID_MAPSELECT_PREV 12
;43:#define ID_MAPSELECT_OK 13
;44:#define ID_MAPSELECT_ALLMAPS 14
;45:#define ID_MAPSELECT_FILTERMAPS 15
;46:#define ID_MAPSELECT_MAPICONS 16
;47:#define ID_MAPSELECT_MULTISEL 17
;48:#define ID_MAPSELECT_LISTVIEW 18
;49:
;50:#define MAPGRID_ROWS 3
;51:#define MAPGRID_COLUMNS 4
;52:#define MAX_GRIDMAPSPERPAGE (MAPGRID_ROWS * MAPGRID_COLUMNS)
;53:
;54:#define MAPLIST_ROWS 12
;55:#define MAPLIST_COLUMNS 3
;56:#define MAX_LISTMAPSPERPAGE (MAPLIST_ROWS * MAPLIST_COLUMNS)
;57:
;58:#if (MAX_LISTMAPSPERPAGE > MAX_GRIDMAPSPERPAGE)
;59:	#define MAX_MAPSPERPAGE MAX_LISTMAPSPERPAGE
;60:#else
;61:	#define MAX_MAPSPERPAGE MAX_GRIDMAPSPERPAGE
;62:#endif
;63:
;64:
;65:
;66:
;67:const char* mapicons_items[] = {
;68:	"All",		// MAPICONS_ALL
;69:	"Custom",	// MAPICONS_CUSTOM
;70:	"None",		// MAPICONS_NONE
;71:	0
;72:};
;73:const char* mapicons_itemsru[] = {
;74:	"Все",		// MAPICONS_ALL
;75:	"Свои",	// MAPICONS_CUSTOM
;76:	"Нет",		// MAPICONS_NONE
;77:	0
;78:};
;79:
;80:
;81:
;82:static int ms_lastgametype = -1;
;83:static int ms_allmaps = 0;
;84:static int ms_filter = MAPFILTER_OFF;
;85:
;86:static vec4_t color_nomap = {0.75, 0.0, 0.0, 1.0};
;87:
;88:
;89:typedef struct mapselect_s {
;90:	menuframework_s menu;
;91:
;92:	menutext_s banner;
;93:	menubitmap_s mappics[MAX_GRIDMAPSPERPAGE];
;94:
;95:	menubitmap_s icona;
;96:	menubitmap_s iconb;
;97:
;98:	menubitmap_s arrows;
;99:	menubitmap_s next;
;100:	menubitmap_s previous;
;101:	menubitmap_s cancel;
;102:	menubitmap_s accept;
;103:
;104:	menutext_s maptype;
;105:	menuradiobutton_s allmaps;
;106:	menulist_s filter;
;107:	menulist_s mapicons;
;108:
;109:	menuradiobutton_s multisel;
;110:	menuradiobutton_s listview;
;111:
;112:	menulist_s maplist;
;113:
;114:#ifndef NO_UIE_MINILOGO_SKIRMISH
;115:	menubitmap_s	logo;
;116:#endif
;117:
;118:	int gametype;	// GT_* format
;119:	int nummaps;
;120:	int maxpages;
;121:	int page;
;122:
;123:	// index into index_maplist[]
;124:	// -1 => no selection
;125:	// otherwise >=0 and <nummaps
;126:	int currentmap;
;127:
;128:	int index;	// index of map to change
;129:	qboolean nomaps;
;130:
;131:	int maxMapsPerPage;
;132:	mappic_t mapinfo[MAX_MAPSPERPAGE];
;133:
;134:	const char* maplist_alias[MAX_LISTMAPSPERPAGE];
;135:
;136:	float* maptext_color[MAX_MAPSPERPAGE];
;137:	int index_maplist[MAX_MAPS_LIST];
;138:	char maplongname[MAX_MAPS_LIST][MAPNAME_LONGBUFFER];
;139:	char mapdrawname[MAX_MAPS_LIST][MAPNAME_LONGBUFFER];
;140:	int mapsecondline[MAX_MAPS_LIST];
;141:
;142:	int bottomrow_y;
;143:
;144:	// index into index_maplist[]
;145:	// valid values always between >= 0 and <nummaps
;146:	int multiselect[MAX_NUMMAPS];
;147:	int num_multisel;
;148:} mapselect_t;
;149:
;150:static mapselect_t s_mapselect;
;151:
;152:
;153:
;154:
;155:
;156:/*
;157:=================
;158:MapSelect_OnMultiList
;159:
;160:returns position on list, -1 of not found
;161:=================
;162:*/
;163:static int MapSelect_MultiListPos(int index)
;164:{
line 166
;165:	int i;
;166:	for (i = 0; i < s_mapselect.num_multisel; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $101
line 167
;167:		if (s_mapselect.multiselect[i] == index)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+149348
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $106
line 168
;168:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $100
JUMPV
LABELV $106
LABELV $102
line 166
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $104
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapselect+149476
INDIRI4
LTI4 $101
line 170
;169:
;170:	return -1;		
CNSTI4 -1
RETI4
LABELV $100
endproc MapSelect_MultiListPos 4 0
proc MapSelect_DeleteMultiAtPos 12 0
line 181
;171:}
;172:
;173:
;174:
;175:/*
;176:=================
;177:MapSelect_DeleteMultiAtPos
;178:=================
;179:*/
;180:static void MapSelect_DeleteMultiAtPos(int pos)
;181:{
line 184
;182:	int i;
;183:
;184:	if (pos < 0 || pos >= s_mapselect.num_multisel)
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $113
ADDRLP4 4
INDIRI4
ADDRGP4 s_mapselect+149476
INDIRI4
LTI4 $110
LABELV $113
line 185
;185:		return;
ADDRGP4 $109
JUMPV
LABELV $110
line 187
;186:
;187:	for (i = pos; i < s_mapselect.num_multisel - 1; i++)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 188
;188:	{
line 189
;189:		s_mapselect.multiselect[i] = s_mapselect.multiselect[i + 1];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 s_mapselect+149348
ADDP4
ADDRLP4 8
INDIRI4
ADDRGP4 s_mapselect+149348+4
ADDP4
INDIRI4
ASGNI4
line 190
;190:	}
LABELV $115
line 187
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $117
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapselect+149476
INDIRI4
CNSTI4 1
SUBI4
LTI4 $114
line 192
;191:
;192:	s_mapselect.num_multisel--;
ADDRLP4 8
ADDRGP4 s_mapselect+149476
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 193
;193:}
LABELV $109
endproc MapSelect_DeleteMultiAtPos 12 0
proc MapSelect_AddToMultiSelect 12 4
line 206
;194:
;195:
;196:
;197:/*
;198:=================
;199:MapSelect_AddToMultiSelect
;200:
;201:Expects an index into the index_maplist[],
;202:NOT an Arena number
;203:=================
;204:*/
;205:static void MapSelect_AddToMultiSelect(int index)
;206:{
line 209
;207:	int pos;
;208:
;209:	if (s_mapselect.num_multisel == MAX_NUMMAPS || index < 0)
ADDRGP4 s_mapselect+149476
INDIRI4
CNSTI4 32
EQI4 $127
ADDRFP4 0
INDIRI4
CNSTI4 0
GEI4 $124
LABELV $127
line 210
;210:		return;
ADDRGP4 $123
JUMPV
LABELV $124
line 213
;211:
;212:	// if already on list, remove it
;213:	pos = MapSelect_MultiListPos(index);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 MapSelect_MultiListPos
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 214
;214:	if (pos >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $128
line 215
;215:		MapSelect_DeleteMultiAtPos(pos);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 MapSelect_DeleteMultiAtPos
CALLV
pop
line 216
;216:		return;
ADDRGP4 $123
JUMPV
LABELV $128
line 219
;217:	}
;218:
;219:	s_mapselect.multiselect[s_mapselect.num_multisel] = index;
ADDRGP4 s_mapselect+149476
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+149348
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 220
;220:	s_mapselect.num_multisel++;
ADDRLP4 8
ADDRGP4 s_mapselect+149476
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 221
;221:}
LABELV $123
endproc MapSelect_AddToMultiSelect 12 4
proc MapSelect_ClearMultiSelect 0 0
line 231
;222:
;223:
;224:
;225:/*
;226:=================
;227:MapSelect_ClearMultiSelect
;228:=================
;229:*/
;230:static void MapSelect_ClearMultiSelect(void)
;231:{
line 232
;232:	s_mapselect.num_multisel = 0;
ADDRGP4 s_mapselect+149476
CNSTI4 0
ASGNI4
line 233
;233:}
LABELV $133
endproc MapSelect_ClearMultiSelect 0 0
proc MapSelect_ToggleMultiSelect 0 8
line 243
;234:
;235:
;236:
;237:/*
;238:=================
;239:MapSelect_ToggleMultiSelect
;240:=================
;241:*/
;242:static void MapSelect_ToggleMultiSelect(void)
;243:{
line 244
;244:	trap_Cvar_SetValue("uie_map_multisel", s_mapselect.multisel.curvalue);
ADDRGP4 $136
ARGP4
ADDRGP4 s_mapselect+3848+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 247
;245:
;246:	// from single to multiple
;247:	if (s_mapselect.multisel.curvalue) {
ADDRGP4 s_mapselect+3848+88
INDIRI4
CNSTI4 0
EQI4 $139
line 249
;248:		// reset if single selection is different
;249:		if (s_mapselect.num_multisel > 0 && s_mapselect.currentmap != s_mapselect.multiselect[0])
ADDRGP4 s_mapselect+149476
INDIRI4
CNSTI4 0
LEI4 $143
ADDRGP4 s_mapselect+4304
INDIRI4
ADDRGP4 s_mapselect+149348
INDIRI4
EQI4 $143
line 250
;250:		{
line 251
;251:			MapSelect_ClearMultiSelect();
ADDRGP4 MapSelect_ClearMultiSelect
CALLV
pop
line 252
;252:			MapSelect_AddToMultiSelect(s_mapselect.currentmap);
ADDRGP4 s_mapselect+4304
INDIRI4
ARGI4
ADDRGP4 MapSelect_AddToMultiSelect
CALLV
pop
line 253
;253:		}
ADDRGP4 $144
JUMPV
LABELV $143
line 254
;254:		else if (s_mapselect.num_multisel == 0)
ADDRGP4 s_mapselect+149476
INDIRI4
CNSTI4 0
NEI4 $149
line 255
;255:			MapSelect_AddToMultiSelect(s_mapselect.currentmap);
ADDRGP4 s_mapselect+4304
INDIRI4
ARGI4
ADDRGP4 MapSelect_AddToMultiSelect
CALLV
pop
LABELV $149
LABELV $144
line 257
;256:
;257:		s_mapselect.currentmap = -1;
ADDRGP4 s_mapselect+4304
CNSTI4 -1
ASGNI4
line 258
;258:		return;
ADDRGP4 $135
JUMPV
LABELV $139
line 262
;259:	}
;260:
;261:	// from multiple back to single
;262:	if (s_mapselect.num_multisel) {
ADDRGP4 s_mapselect+149476
INDIRI4
CNSTI4 0
EQI4 $154
line 263
;263:		s_mapselect.currentmap = s_mapselect.multiselect[0];
ADDRGP4 s_mapselect+4304
ADDRGP4 s_mapselect+149348
INDIRI4
ASGNI4
line 264
;264:	}
ADDRGP4 $155
JUMPV
LABELV $154
line 265
;265:	else {
line 266
;266:		s_mapselect.currentmap = -1;
ADDRGP4 s_mapselect+4304
CNSTI4 -1
ASGNI4
line 267
;267:	}
LABELV $155
line 268
;268:}
LABELV $135
endproc MapSelect_ToggleMultiSelect 0 8
proc MapSelect_MapCellSize 0 0
line 279
;269:
;270:
;271:
;272:
;273:/*
;274:=================
;275:MapSelect_MapCellSize
;276:=================
;277:*/
;278:static void MapSelect_MapCellSize(int* colh, int* colw)
;279:{
line 283
;280:	// screen height - 2 buttons
;281:	// colh rounded to multiple of 2 to reduce drawing "artifacts"
;282:
;283:	*colw = 640 / MAPGRID_COLUMNS;
ADDRFP4 4
INDIRP4
CNSTI4 160
ASGNI4
line 284
;284:	*colh = (( 480 - 2 * 64 ) / MAPGRID_ROWS) & 0xFE;
ADDRFP4 0
INDIRP4
CNSTI4 116
ASGNI4
line 285
;285:}
LABELV $160
endproc MapSelect_MapCellSize 0 0
proc MapSelect_SetViewType 4 0
line 295
;286:
;287:
;288:
;289:/*
;290:=================
;291:MapSelect_SetViewType
;292:=================
;293:*/
;294:static void MapSelect_SetViewType(void)
;295:{
line 296
;296:	if (s_mapselect.listview.curvalue) {
ADDRGP4 s_mapselect+3944+88
INDIRI4
CNSTI4 0
EQI4 $162
line 297
;297:		s_mapselect.maxMapsPerPage = MAX_LISTMAPSPERPAGE;
ADDRGP4 s_mapselect+4316
CNSTI4 36
ASGNI4
line 298
;298:	}
ADDRGP4 $163
JUMPV
LABELV $162
line 299
;299:	else {
line 300
;300:		s_mapselect.maxMapsPerPage = MAX_GRIDMAPSPERPAGE;
ADDRGP4 s_mapselect+4316
CNSTI4 12
ASGNI4
line 301
;301:	}
LABELV $163
line 303
;302:
;303:	s_mapselect.maxpages = s_mapselect.nummaps / s_mapselect.maxMapsPerPage;
ADDRGP4 s_mapselect+4296
ADDRGP4 s_mapselect+4292
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
DIVI4
ASGNI4
line 304
;304:	if (s_mapselect.nummaps % s_mapselect.maxMapsPerPage)
ADDRGP4 s_mapselect+4292
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
MODI4
CNSTI4 0
EQI4 $171
line 305
;305:		s_mapselect.maxpages++;
ADDRLP4 0
ADDRGP4 s_mapselect+4296
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $171
line 307
;306:
;307:	s_mapselect.page = 0;
ADDRGP4 s_mapselect+4300
CNSTI4 0
ASGNI4
line 308
;308:	if (s_mapselect.currentmap >= 0)
ADDRGP4 s_mapselect+4304
INDIRI4
CNSTI4 0
LTI4 $177
line 309
;309:	{
line 310
;310:		s_mapselect.page = s_mapselect.currentmap / s_mapselect.maxMapsPerPage;
ADDRGP4 s_mapselect+4300
ADDRGP4 s_mapselect+4304
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
DIVI4
ASGNI4
line 311
;311:	}
LABELV $177
line 312
;312:}
LABELV $161
endproc MapSelect_SetViewType 4 0
proc MapSelect_MapIndex 24 8
line 322
;313:
;314:
;315:
;316:/*
;317:=================
;318:MapSelect_MapIndex
;319:=================
;320:*/
;321:static int MapSelect_MapIndex(const char* mapname)
;322:{
line 327
;323:	int i;
;324:	const char* info;
;325:
;326:	// check for valid mapname
;327:	if (!mapname || *mapname == '\0')
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $186
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $184
LABELV $186
line 328
;328:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $183
JUMPV
LABELV $184
line 331
;329:
;330:	// find the map
;331:	for (i = 0 ; i < s_mapselect.nummaps; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $190
JUMPV
LABELV $187
line 332
;332:	{
line 333
;333:		info = UI_GetArenaInfoByNumber(s_mapselect.index_maplist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+10080
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 334
;334:		if (Q_stricmp(mapname, Info_ValueForKey(info,"map")) == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $195
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $193
line 335
;335:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $183
JUMPV
LABELV $193
line 336
;336:	}
LABELV $188
line 331
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $190
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapselect+4292
INDIRI4
LTI4 $187
line 338
;337:
;338:	return -1;
CNSTI4 -1
RETI4
LABELV $183
endproc MapSelect_MapIndex 24 8
proc MapSelect_MapSupportsGametype 56 8
line 348
;339:}
;340:
;341:
;342:
;343:/*
;344:=================
;345:MapSelect_MapSupportsGametype
;346:=================
;347:*/
;348:static qboolean MapSelect_MapSupportsGametype(const char* mapname) {
line 354
;349:	int i;
;350:	int count, matchbits, gamebits;
;351:	const char	*info;
;352:	char* arena_mapname;
;353:
;354:	if (!mapname || !mapname[0])
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $199
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $197
LABELV $199
line 355
;355:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $196
JUMPV
LABELV $197
line 357
;356:
;357:	count = UI_GetNumArenas();
ADDRLP4 28
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 28
INDIRI4
ASGNI4
line 358
;358:	if (count > MAX_MAPS_LIST)
ADDRLP4 16
INDIRI4
CNSTI4 1024
LEI4 $200
line 359
;359:		count = MAX_MAPS_LIST;
ADDRLP4 16
CNSTI4 1024
ASGNI4
LABELV $200
line 361
;360:
;361:	matchbits = 1 << s_mapselect.gametype;
ADDRLP4 20
CNSTI4 1
ADDRGP4 s_mapselect+4288
INDIRI4
LSHI4
ASGNI4
line 362
;362:	for( i = 0; i < count; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 363
;363:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 365
;364:
;365:		if (!info) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $207
line 366
;366:			continue;
ADDRGP4 $204
JUMPV
LABELV $207
line 369
;367:		}
;368:
;369:		arena_mapname = Info_ValueForKey( info, "map");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $195
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
ASGNP4
line 370
;370:		if (!arena_mapname || arena_mapname[0] == '\0') {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $211
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $209
LABELV $211
line 371
;371:			continue;
ADDRGP4 $204
JUMPV
LABELV $209
line 374
;372:		}
;373:
;374:		gamebits = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 375
;375:		if( !( gamebits & matchbits )) {
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
BANDI4
CNSTI4 0
NEI4 $213
line 376
;376:			continue;
ADDRGP4 $204
JUMPV
LABELV $213
line 378
;377:		}
;378:		if (Q_stricmp(mapname, arena_mapname) == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $215
line 379
;379:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $196
JUMPV
LABELV $215
line 380
;380:	}
LABELV $204
line 362
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $203
line 382
;381:
;382:	return qfalse;
CNSTI4 0
RETI4
LABELV $196
endproc MapSelect_MapSupportsGametype 56 8
proc MapSelect_FilteredMap 12 8
line 395
;383:}
;384:
;385:
;386:
;387:
;388:
;389:/*
;390:=================
;391:MapSelect_FilteredMap
;392:=================
;393:*/
;394:static qboolean MapSelect_FilteredMap(const char* mapname)
;395:{
line 399
;396:	qboolean idmap;
;397:	int type;
;398:
;399:	if (s_mapselect.filter.curvalue == MAPFILTER_OFF)
ADDRGP4 s_mapselect+3584+92
INDIRI4
CNSTI4 0
NEI4 $218
line 400
;400:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $217
JUMPV
LABELV $218
line 403
;401:
;402:	// handle request for Id or non-Id map type
;403:	if (s_mapselect.filter.curvalue < MAPFILTER_MAX)
ADDRGP4 s_mapselect+3584+92
INDIRI4
CNSTI4 3
GEI4 $222
line 404
;404:	{
line 405
;405:		idmap = StartServer_IsIdMap(mapname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 StartServer_IsIdMap
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 406
;406:		if (s_mapselect.filter.curvalue == MAPFILTER_NONID)
ADDRGP4 s_mapselect+3584+92
INDIRI4
CNSTI4 2
NEI4 $226
line 407
;407:		{
line 408
;408:			if (idmap)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $230
line 409
;409:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $217
JUMPV
LABELV $230
line 410
;410:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $217
JUMPV
LABELV $226
line 412
;411:		}
;412:		return idmap;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $217
JUMPV
LABELV $222
line 416
;413:	}
;414:
;415:	// check for specific map list
;416:	type = s_mapselect.filter.curvalue - MAPFILTER_MAX;
ADDRLP4 0
ADDRGP4 s_mapselect+3584+92
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 417
;417:	return StartServer_IsCustomMapType(mapname, type);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 StartServer_IsCustomMapType
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $217
endproc MapSelect_FilteredMap 12 8
proc MapSelect_SetMapTypeIcons 16 12
line 429
;418:}
;419:
;420:
;421:
;422:
;423:/*
;424:=================
;425:MapSelect_SetMapTypeIcons
;426:=================
;427:*/
;428:static void MapSelect_SetMapTypeIcons( void )
;429:{
line 434
;430:	int gametype, customtype;
;431:	menubitmap_s* icon_type;
;432:	menubitmap_s* icon_custom;
;433:
;434:	icon_type = &s_mapselect.icona;
ADDRLP4 4
ADDRGP4 s_mapselect+2572
ASGNP4
line 435
;435:	icon_custom = &s_mapselect.iconb;
ADDRLP4 12
ADDRGP4 s_mapselect+2688
ASGNP4
line 438
;436:
;437:	// using all maps, so don't set gametype icon
;438:	gametype = s_mapselect.gametype;
ADDRLP4 8
ADDRGP4 s_mapselect+4288
INDIRI4
ASGNI4
line 439
;439:	if (s_mapselect.allmaps.curvalue)
ADDRGP4 s_mapselect+3488+88
INDIRI4
CNSTI4 0
EQI4 $238
line 440
;440:	{
line 441
;441:		gametype = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 442
;442:	}
LABELV $238
line 446
;443:
;444:	// check for custom map icon, bump gametype icon
;445:	// to left if so
;446:	customtype = s_mapselect.filter.curvalue - MAPFILTER_MAX;
ADDRLP4 0
ADDRGP4 s_mapselect+3584+92
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 447
;447:	if (customtype >= 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $244
line 448
;448:	{
line 449
;449:		icon_custom = icon_type;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
line 450
;450:		icon_type = &s_mapselect.iconb;
ADDRLP4 4
ADDRGP4 s_mapselect+2688
ASGNP4
line 451
;451:	}
LABELV $244
line 453
;452:
;453:	StartServer_SetIconFromGameType(icon_type, gametype, qfalse);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_SetIconFromGameType
CALLV
pop
line 454
;454:	StartServer_SetIconFromGameType(icon_custom, customtype, qtrue);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 StartServer_SetIconFromGameType
CALLV
pop
line 455
;455:}
LABELV $234
endproc MapSelect_SetMapTypeIcons 16 12
proc MapSelect_ValidateMapForLoad 36 8
line 466
;456:
;457:
;458:
;459:
;460:/*
;461:=================
;462:MapSelect_CheckLoadedMap
;463:=================
;464:*/
;465:static qboolean MapSelect_ValidateMapForLoad( const char* info, int matchbits, qboolean cache)
;466:{
line 471
;467:	int gamebits;
;468:	const char* arena_mapname;
;469:
;470:	// error check the map
;471:	arena_mapname = Info_ValueForKey( info, "map");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $195
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 472
;472:	if (!arena_mapname || arena_mapname[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $250
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $248
LABELV $250
line 473
;473:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $247
JUMPV
LABELV $248
line 476
;474:	}
;475:
;476:	gamebits = GametypeBits( Info_ValueForKey( info, "type") );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 477
;477:	if( !( gamebits & matchbits ) && !s_mapselect.allmaps.curvalue) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $251
ADDRGP4 s_mapselect+3488+88
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $251
line 478
;478:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $247
JUMPV
LABELV $251
line 481
;479:	}
;480:
;481:	if (!MapSelect_FilteredMap(arena_mapname))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 MapSelect_FilteredMap
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $255
line 482
;482:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $247
JUMPV
LABELV $255
line 485
;483:
;484:	// cache map image
;485:	if (cache) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $257
line 486
;486:		trap_R_RegisterShaderNoMip( va("levelshots/%s.tga", arena_mapname) );
ADDRGP4 $259
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 487
;487:	}
LABELV $257
line 489
;488:
;489:	return qtrue;
CNSTI4 1
RETI4
LABELV $247
endproc MapSelect_ValidateMapForLoad 36 8
proc MapSelect_LoadMaps 72 12
line 499
;490:}
;491:
;492:
;493:
;494:/*
;495:=================
;496:MapSelect_LoadMaps
;497:=================
;498:*/
;499:static void MapSelect_LoadMaps(const char* mapname, qboolean cache) {
line 507
;500:	int			i;
;501:	int			count;
;502:	int			matchbits;
;503:	const char	*info;
;504:	int j, nchars, lastspace, secondline, count2;
;505:	char *buf;
;506:
;507:	count = UI_GetNumArenas();
ADDRLP4 40
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 508
;508:	if (count > MAX_MAPS_LIST)
ADDRLP4 32
INDIRI4
CNSTI4 1024
LEI4 $261
line 509
;509:		count = MAX_MAPS_LIST;
ADDRLP4 32
CNSTI4 1024
ASGNI4
LABELV $261
line 511
;510:
;511:	s_mapselect.nummaps = 0;
ADDRGP4 s_mapselect+4292
CNSTI4 0
ASGNI4
line 512
;512:	matchbits = 1 << s_mapselect.gametype;
ADDRLP4 36
CNSTI4 1
ADDRGP4 s_mapselect+4288
INDIRI4
LSHI4
ASGNI4
line 514
;513:
;514:	for( i = 0; i < count; i++ ) {
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 $268
JUMPV
LABELV $265
line 515
;515:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 44
INDIRP4
ASGNP4
line 517
;516:
;517:		if (!info || !MapSelect_ValidateMapForLoad(info, matchbits, cache)) {
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $271
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 MapSelect_ValidateMapForLoad
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $269
LABELV $271
line 518
;518:			if (!info)
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $266
line 519
;519:				trap_Print(va("Load Map error (%i)\n", i));
ADDRGP4 $274
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 520
;520:			continue;
ADDRGP4 $266
JUMPV
LABELV $269
line 523
;521:		}
;522:
;523:		s_mapselect.index_maplist[s_mapselect.nummaps] = i;
ADDRGP4 s_mapselect+4292
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+10080
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 524
;524:		Q_strncpyz( s_mapselect.maplongname[s_mapselect.nummaps], Info_ValueForKey( info, "longname"), MAPNAME_LONGBUFFER);
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 s_mapselect+4292
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 s_mapselect+14176
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 527
;525:
;526:		// convert the map long name into a name that spans (at most) 2 rows
;527:		Q_strncpyz( s_mapselect.mapdrawname[s_mapselect.nummaps], s_mapselect.maplongname[s_mapselect.nummaps], MAPNAME_LONGBUFFER);
ADDRLP4 60
CNSTI4 6
ASGNI4
ADDRGP4 s_mapselect+4292
INDIRI4
ADDRLP4 60
INDIRI4
LSHI4
ADDRGP4 s_mapselect+79712
ADDP4
ARGP4
ADDRGP4 s_mapselect+4292
INDIRI4
ADDRLP4 60
INDIRI4
LSHI4
ADDRGP4 s_mapselect+14176
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 528
;528:		buf = s_mapselect.mapdrawname[s_mapselect.nummaps];
ADDRLP4 4
ADDRGP4 s_mapselect+4292
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 s_mapselect+79712
ADDP4
ASGNP4
line 529
;529:		buf[MAPNAME_LONGBUFFER - 1] = '\0';
ADDRLP4 4
INDIRP4
CNSTI4 63
ADDP4
CNSTI1 0
ASGNI1
line 530
;530:		nchars = (640 / (SMALLCHAR_WIDTH * MAPGRID_COLUMNS)) - 1;
ADDRLP4 20
CNSTI4 640
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
LSHI4
DIVI4
CNSTI4 1
SUBI4
ASGNI4
line 531
;531:		lastspace = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 532
;532:		count2 = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 533
;533:		secondline = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 534
;534:		for (j = 0; j < MAPNAME_LONGBUFFER; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $287
line 535
;535:		{
line 536
;536:		   if (buf[j] == '\0')
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $291
line 537
;537:			   break;
ADDRGP4 $289
JUMPV
LABELV $291
line 538
;538:		   if (buf[j] == ' ')
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $293
line 539
;539:			   lastspace = j;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $293
line 541
;540:
;541:		   count2++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 542
;542:		   if ((count2 % nchars) == 0)
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
MODI4
CNSTI4 0
NEI4 $295
line 543
;543:		   {
line 544
;544:			   if (lastspace)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $297
line 545
;545:			   {
line 546
;546:				   buf[lastspace] = '\0';
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 547
;547:				   count2 = j - lastspace;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 548
;548:				   if (!secondline)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $299
line 549
;549:					   secondline = lastspace + 1;
ADDRLP4 16
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $299
line 550
;550:				   lastspace = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 551
;551:				   continue;
ADDRGP4 $288
JUMPV
LABELV $297
line 554
;552:			   }
;553:			   // move always preserves buf[MAPNAME_LONGBUFFER - 1]
;554:			   memcpy(&buf[j + 1], &buf[j], MAPNAME_LONGBUFFER - j - 2 );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
CNSTI4 64
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
SUBI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 555
;555:			   buf[j] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 556
;556:			   count2 = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 557
;557:			   if (!secondline)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $301
line 558
;558:				   secondline = j + 1;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $301
line 559
;559:		   }
LABELV $295
line 560
;560:		}
LABELV $288
line 534
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $287
LABELV $289
line 561
;561:		s_mapselect.mapsecondline[s_mapselect.nummaps] = secondline;
ADDRGP4 s_mapselect+4292
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+145248
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 563
;562:
;563:		s_mapselect.nummaps++;
ADDRLP4 64
ADDRGP4 s_mapselect+4292
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 564
;564:	}
LABELV $266
line 514
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $268
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $265
line 567
;565:
;566:	// set up the correct map page
;567:	s_mapselect.currentmap = MapSelect_MapIndex(mapname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 MapSelect_MapIndex
CALLI4
ASGNI4
ADDRGP4 s_mapselect+4304
ADDRLP4 44
INDIRI4
ASGNI4
line 568
;568:	MapSelect_SetViewType();
ADDRGP4 MapSelect_SetViewType
CALLV
pop
line 569
;569:}
LABELV $260
endproc MapSelect_LoadMaps 72 12
proc MapSelect_HighlightIfOnPage 16 0
line 581
;570:
;571:
;572:
;573:/*
;574:=================
;575:MapSelect_HighlightIfOnPage
;576:
;577:Only used for grid display of maps
;578:=================
;579:*/
;580:static void MapSelect_HighlightIfOnPage( int index )
;581:{
line 584
;582:	int i;
;583:
;584:	i = index - s_mapselect.page * MAX_GRIDMAPSPERPAGE;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 12
ADDRGP4 s_mapselect+4300
INDIRI4
MULI4
SUBI4
ASGNI4
line 585
;585:	if (i >=0 && i < MAX_GRIDMAPSPERPAGE)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $309
ADDRLP4 0
INDIRI4
CNSTI4 12
GEI4 $309
line 586
;586:	{
line 587
;587:		s_mapselect.mappics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 8
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+72
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 588
;588:		s_mapselect.mappics[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 12
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+72
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTI4 -257
CVIU4 4
BANDU4
ASGNU4
line 589
;589:	}
LABELV $309
line 590
;590:}
LABELV $307
endproc MapSelect_HighlightIfOnPage 16 0
proc MapSelect_OnCurrentPage 4 0
line 599
;591:
;592:
;593:/*
;594:=================
;595:MapSelect_OnCurrentPage
;596:=================
;597:*/
;598:static qboolean MapSelect_OnCurrentPage(int index)
;599:{
line 602
;600:	int base;
;601:
;602:	base = s_mapselect.page * s_mapselect.maxMapsPerPage;
ADDRLP4 0
ADDRGP4 s_mapselect+4300
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
MULI4
ASGNI4
line 603
;603:	if (index < base)
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $318
line 604
;604:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $315
JUMPV
LABELV $318
line 606
;605:
;606:	if (index >= base + s_mapselect.maxMapsPerPage)
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
ADDI4
LTI4 $320
line 607
;607:		return qfalse;	
CNSTI4 0
RETI4
ADDRGP4 $315
JUMPV
LABELV $320
line 609
;608:
;609:	if (index >= s_mapselect.nummaps)
ADDRFP4 0
INDIRI4
ADDRGP4 s_mapselect+4292
INDIRI4
LTI4 $323
line 610
;610:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $315
JUMPV
LABELV $323
line 612
;611:
;612:	return qtrue;
CNSTI4 1
RETI4
LABELV $315
endproc MapSelect_OnCurrentPage 4 0
proc MapSelect_UpdateAcceptInterface 8 0
line 623
;613:}
;614:
;615:
;616:
;617:/*
;618:=================
;619:MapSelect_UpdateAcceptInterface
;620:=================
;621:*/
;622:static void MapSelect_UpdateAcceptInterface( void )
;623:{
line 625
;624:	// enable/disable accept button
;625:	if (s_mapselect.multisel.curvalue)
ADDRGP4 s_mapselect+3848+88
INDIRI4
CNSTI4 0
EQI4 $327
line 626
;626:	{
line 627
;627:		if (s_mapselect.num_multisel == 0)
ADDRGP4 s_mapselect+149476
INDIRI4
CNSTI4 0
NEI4 $331
line 628
;628:			s_mapselect.accept.generic.flags |= (QMF_GRAYED | QMF_INACTIVE);
ADDRLP4 0
ADDRGP4 s_mapselect+3268+72
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
ADDRGP4 $328
JUMPV
LABELV $331
line 630
;629:		else
;630:			s_mapselect.accept.generic.flags &= ~(QMF_GRAYED | QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_mapselect+3268+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -24577
CVIU4 4
BANDU4
ASGNU4
line 631
;631:	}
ADDRGP4 $328
JUMPV
LABELV $327
line 632
;632:	else {
line 633
;633:		if (s_mapselect.currentmap == -1) {
ADDRGP4 s_mapselect+4304
INDIRI4
CNSTI4 -1
NEI4 $338
line 634
;634:			s_mapselect.accept.generic.flags |= (QMF_GRAYED | QMF_INACTIVE);
ADDRLP4 0
ADDRGP4 s_mapselect+3268+72
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
line 635
;635:		}
ADDRGP4 $339
JUMPV
LABELV $338
line 636
;636:		else {
line 637
;637:			s_mapselect.accept.generic.flags &= ~(QMF_GRAYED | QMF_INACTIVE);
ADDRLP4 0
ADDRGP4 s_mapselect+3268+72
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTI4 -24577
CVIU4 4
BANDU4
ASGNU4
line 638
;638:		}
LABELV $339
line 639
;639:	}
LABELV $328
line 640
;640:}
LABELV $326
endproc MapSelect_UpdateAcceptInterface 8 0
proc MapSelect_UpdateInterface 16 4
line 650
;641:
;642:
;643:
;644:/*
;645:=================
;646:MapSelect_UpdateInterface
;647:=================
;648:*/
;649:static void MapSelect_UpdateInterface( void )
;650:{
line 654
;651:	int i;
;652:	int top;
;653:
;654:	if (s_mapselect.listview.curvalue) {
ADDRGP4 s_mapselect+3944+88
INDIRI4
CNSTI4 0
EQI4 $346
line 655
;655:		for (i = 0; i < MAX_GRIDMAPSPERPAGE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $350
line 656
;656:			s_mapselect.mappics[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 8
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+72
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 657
;657:		}
LABELV $351
line 655
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $350
line 658
;658:		s_mapselect.maplist.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 8
ADDRGP4 s_mapselect+4040+72
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 659
;659:	}
ADDRGP4 $347
JUMPV
LABELV $346
line 660
;660:	else {
line 662
;661:		// set attributes of buttons
;662:		top = s_mapselect.page * MAX_GRIDMAPSPERPAGE;
ADDRLP4 4
CNSTI4 12
ADDRGP4 s_mapselect+4300
INDIRI4
MULI4
ASGNI4
line 663
;663:		for (i = 0; i < MAX_GRIDMAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $359
line 664
;664:		{
line 665
;665:		  if ((top + i) >= s_mapselect.nummaps)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 s_mapselect+4292
INDIRI4
LTI4 $363
line 666
;666:			  break;
ADDRGP4 $373
JUMPV
LABELV $363
line 668
;667:
;668:		  s_mapselect.mappics[i].generic.flags &= ~(QMF_HIGHLIGHT|QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+72
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTI4 -20545
CVIU4 4
BANDU4
ASGNU4
line 669
;669:		  s_mapselect.mappics[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 12
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+72
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 670
;670:		}
LABELV $360
line 663
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $359
line 672
;671:
;672:		for (; i < MAX_GRIDMAPSPERPAGE; i++)
ADDRGP4 $373
JUMPV
LABELV $370
line 673
;673:		{
line 674
;674:		  s_mapselect.mappics[i].generic.flags &= ~(QMF_HIGHLIGHT|QMF_PULSEIFFOCUS);
ADDRLP4 8
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+72
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTI4 -321
CVIU4 4
BANDU4
ASGNU4
line 675
;675:		  s_mapselect.mappics[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 12
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+72
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 676
;676:		}
LABELV $371
line 672
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $373
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $370
line 678
;677:
;678:		s_mapselect.maplist.generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 8
ADDRGP4 s_mapselect+4040+72
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 680
;679:
;680:		if (s_mapselect.multisel.curvalue) {
ADDRGP4 s_mapselect+3848+88
INDIRI4
CNSTI4 0
EQI4 $380
line 681
;681:			for (i = 0; i < s_mapselect.num_multisel; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $387
JUMPV
LABELV $384
line 682
;682:				MapSelect_HighlightIfOnPage(s_mapselect.multiselect[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+149348
ADDP4
INDIRI4
ARGI4
ADDRGP4 MapSelect_HighlightIfOnPage
CALLV
pop
LABELV $385
line 681
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $387
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapselect+149476
INDIRI4
LTI4 $384
line 683
;683:		}
ADDRGP4 $381
JUMPV
LABELV $380
line 684
;684:		else {
line 685
;685:			MapSelect_HighlightIfOnPage(s_mapselect.currentmap);
ADDRGP4 s_mapselect+4304
INDIRI4
ARGI4
ADDRGP4 MapSelect_HighlightIfOnPage
CALLV
pop
line 686
;686:		}
LABELV $381
line 687
;687:	}
LABELV $347
line 689
;688:
;689:	MapSelect_UpdateAcceptInterface();
ADDRGP4 MapSelect_UpdateAcceptInterface
CALLV
pop
line 690
;690:}
LABELV $345
endproc MapSelect_UpdateInterface 16 4
proc MapSelect_SetNewMapPics 32 8
line 700
;691:
;692:
;693:
;694:/*
;695:=================
;696:MapSelect_SetNewMapPics
;697:=================
;698:*/
;699:static void MapSelect_SetNewMapPics( void )
;700:{
line 706
;701:	int i, j;
;702:	int top;
;703:	const char* info;
;704:
;705:	// set map names and start with clear buttons
;706:	top = s_mapselect.page * s_mapselect.maxMapsPerPage;
ADDRLP4 12
ADDRGP4 s_mapselect+4300
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
MULI4
ASGNI4
line 707
;707:	for (i = 0; i < s_mapselect.maxMapsPerPage; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $397
JUMPV
LABELV $394
line 708
;708:	{
line 709
;709:		if ((top + i) >= s_mapselect.nummaps)
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRGP4 s_mapselect+4292
INDIRI4
LTI4 $399
line 710
;710:			break;
ADDRGP4 $396
JUMPV
LABELV $399
line 712
;711:
;712:		StartServer_InitMapPictureFromIndex(&s_mapselect.mapinfo[i], s_mapselect.index_maplist[top + i]);
CNSTI4 152
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_mapselect+4320
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 StartServer_InitMapPictureFromIndex
CALLV
pop
line 714
;713:
;714:		s_mapselect.maptext_color[i] = color_white;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+9936
ADDP4
ADDRGP4 color_white
ASGNP4
line 717
;715:
;716:		// check if map has been used before
;717:		if (s_mapselect.index < 0 || s_mapselect.index >= MAX_NUMMAPS)
ADDRGP4 s_mapselect+4308
INDIRI4
CNSTI4 0
LTI4 $409
ADDRGP4 s_mapselect+4308
INDIRI4
CNSTI4 32
LTI4 $405
LABELV $409
line 718
;718:			continue;
ADDRGP4 $395
JUMPV
LABELV $405
line 720
;719:
;720:		for (j = 0; j < s_scriptdata.map.num_maps; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $413
JUMPV
LABELV $410
line 721
;721:		{
line 722
;722:			info = UI_GetArenaInfoByNumber(s_mapselect.index_maplist[top + i]);
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+10080
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 723
;723:			if (Q_stricmp(Info_ValueForKey(info, "map"), s_scriptdata.map.data[j].shortName) == 0) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $195
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $416
line 724
;724:				s_mapselect.maptext_color[i] = color_white;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+9936
ADDP4
ADDRGP4 color_white
ASGNP4
line 725
;725:				break;
ADDRGP4 $412
JUMPV
LABELV $416
line 727
;726:			}
;727:		}
LABELV $411
line 720
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $413
ADDRLP4 0
INDIRI4
ADDRGP4 s_scriptdata+8
INDIRI4
LTI4 $410
LABELV $412
line 728
;728:	}
LABELV $395
line 707
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $397
ADDRLP4 4
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
LTI4 $394
LABELV $396
line 731
;729:
;730:	// clear any left-over grid buttons
;731:	if (!s_mapselect.listview.curvalue) {
ADDRGP4 s_mapselect+3944+88
INDIRI4
CNSTI4 0
NEI4 $421
line 732
;732:		for (; i < MAX_GRIDMAPSPERPAGE; i++)
ADDRGP4 $428
JUMPV
LABELV $425
line 733
;733:		{
line 734
;734:			s_mapselect.mappics[i].generic.name = 0;
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+4
ADDP4
CNSTP4 0
ASGNP4
line 735
;735:			s_mapselect.mappics[i].shader = 0;
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+96
ADDP4
CNSTI4 0
ASGNI4
line 736
;736:		}
LABELV $426
line 732
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $428
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $425
line 737
;737:	}
LABELV $421
line 740
;738:
;739:	// no maps found
;740:	if (!s_mapselect.nummaps)
ADDRGP4 s_mapselect+4292
INDIRI4
CNSTI4 0
NEI4 $433
line 741
;741:	{
line 742
;742:		s_mapselect.nomaps = qtrue;
ADDRGP4 s_mapselect+4312
CNSTI4 1
ASGNI4
line 743
;743:		s_mapselect.accept.generic.flags |= QMF_INACTIVE;
ADDRLP4 16
ADDRGP4 s_mapselect+3268+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 744
;744:	}
ADDRGP4 $434
JUMPV
LABELV $433
line 746
;745:	else
;746:	{
line 747
;747:		s_mapselect.nomaps = qfalse;
ADDRGP4 s_mapselect+4312
CNSTI4 0
ASGNI4
line 748
;748:	}
LABELV $434
line 749
;749:}
LABELV $391
endproc MapSelect_SetNewMapPics 32 8
proc MapSelect_SetNewListNames 16 4
line 759
;750:
;751:
;752:
;753:/*
;754:=================
;755:MapSelect_SetMapListData
;756:=================
;757:*/
;758:static void MapSelect_SetNewListNames(void)
;759:{
line 763
;760:	int i;
;761:	int base;
;762:
;763:	base = s_mapselect.page * s_mapselect.maxMapsPerPage;
ADDRLP4 4
ADDRGP4 s_mapselect+4300
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
MULI4
ASGNI4
line 764
;764:	s_mapselect.maplist.numitems = 0;
ADDRGP4 s_mapselect+4040+96
CNSTI4 0
ASGNI4
line 765
;765:	for (i = 0; i < s_mapselect.maxMapsPerPage; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $448
JUMPV
LABELV $445
line 766
;766:		if (base + i == s_mapselect.nummaps)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 s_mapselect+4292
INDIRI4
NEI4 $450
line 767
;767:			break;
ADDRGP4 $447
JUMPV
LABELV $450
line 768
;768:		s_mapselect.maplist_alias[i] = s_mapselect.mapinfo[i].mapname;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+9792
ADDP4
CNSTI4 152
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+4320
ADDP4
ASGNP4
line 769
;769:		s_mapselect.maplist.numitems++;
ADDRLP4 12
ADDRGP4 s_mapselect+4040+96
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 770
;770:	}
LABELV $446
line 765
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $448
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
LTI4 $445
LABELV $447
line 772
;771:
;772:	if (MapSelect_OnCurrentPage(s_mapselect.currentmap))
ADDRGP4 s_mapselect+4304
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 MapSelect_OnCurrentPage
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $457
line 773
;773:		s_mapselect.maplist.curvalue = s_mapselect.currentmap % s_mapselect.maxMapsPerPage;
ADDRGP4 s_mapselect+4040+92
ADDRGP4 s_mapselect+4304
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
MODI4
ASGNI4
ADDRGP4 $458
JUMPV
LABELV $457
line 775
;774:	else
;775:		s_mapselect.maplist.curvalue = -1;	
ADDRGP4 s_mapselect+4040+92
CNSTI4 -1
ASGNI4
LABELV $458
line 777
;776:
;777:    s_mapselect.maplist.oldvalue = s_mapselect.maplist.curvalue;
ADDRGP4 s_mapselect+4040+88
ADDRGP4 s_mapselect+4040+92
INDIRI4
ASGNI4
line 778
;778:}
LABELV $440
endproc MapSelect_SetNewListNames 16 4
proc MapSelect_SetNewMapPage 0 0
line 788
;779:
;780:
;781:
;782:/*
;783:=================
;784:MapSelect_SetNewMapPage
;785:=================
;786:*/
;787:static void MapSelect_SetNewMapPage( void )
;788:{
line 789
;789:	MapSelect_SetNewMapPics();
ADDRGP4 MapSelect_SetNewMapPics
CALLV
pop
line 790
;790:	if (s_mapselect.listview.curvalue) {
ADDRGP4 s_mapselect+3944+88
INDIRI4
CNSTI4 0
EQI4 $471
line 791
;791:		MapSelect_SetNewListNames();
ADDRGP4 MapSelect_SetNewListNames
CALLV
pop
line 792
;792:	}
LABELV $471
line 794
;793:
;794:	MapSelect_UpdateInterface();
ADDRGP4 MapSelect_UpdateInterface
CALLV
pop
line 795
;795:}
LABELV $470
endproc MapSelect_SetNewMapPage 0 0
proc MapSelect_FilterChanged 60 12
line 808
;796:
;797:
;798:
;799:
;800:
;801:
;802:/*
;803:=================
;804:MapSelect_FilterChanged
;805:=================
;806:*/
;807:static void MapSelect_FilterChanged(void)
;808:{
line 815
;809:	char mapname[MAPNAME_BUFFER];
;810:	const char* info;
;811:	qboolean found;
;812:	int index;
;813:	int i, j;
;814:
;815:	if (s_mapselect.currentmap >= 0)
ADDRGP4 s_mapselect+4304
INDIRI4
CNSTI4 0
LTI4 $476
line 816
;816:	{
line 817
;817:		info = UI_GetArenaInfoByNumber(s_mapselect.index_maplist[s_mapselect.currentmap]);
ADDRGP4 s_mapselect+4304
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+10080
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 52
INDIRP4
ASGNP4
line 818
;818:		Q_strncpyz(mapname, Info_ValueForKey(info,"map"), MAPNAME_BUFFER);
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 $195
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 819
;819:	}
ADDRGP4 $477
JUMPV
LABELV $476
line 821
;820:	else
;821:		mapname[0]='\0';
ADDRLP4 16
CNSTI1 0
ASGNI1
LABELV $477
line 827
;822:
;823:
;824:	// handle muliple selections
;825:	// try and keep as many as possible across filter changes
;826:	// convert to arena index
;827:	for (i = 0; i < s_mapselect.num_multisel; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $484
JUMPV
LABELV $481
line 828
;828:	{
line 829
;829:		index = s_mapselect.multiselect[i];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+149348
ADDP4
INDIRI4
ASGNI4
line 830
;830:		s_mapselect.multiselect[i] = s_mapselect.index_maplist[index];
ADDRLP4 52
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 52
INDIRI4
LSHI4
ADDRGP4 s_mapselect+149348
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 52
INDIRI4
LSHI4
ADDRGP4 s_mapselect+10080
ADDP4
INDIRI4
ASGNI4
line 831
;831:	}
LABELV $482
line 827
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $484
ADDRLP4 4
INDIRI4
ADDRGP4 s_mapselect+149476
INDIRI4
LTI4 $481
line 833
;832:
;833:	MapSelect_LoadMaps(mapname, qfalse);
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 MapSelect_LoadMaps
CALLV
pop
line 834
;834:	MapSelect_SetNewMapPage();
ADDRGP4 MapSelect_SetNewMapPage
CALLV
pop
line 835
;835:	MapSelect_SetMapTypeIcons();
ADDRGP4 MapSelect_SetMapTypeIcons
CALLV
pop
ADDRGP4 $490
JUMPV
LABELV $489
line 840
;836:
;837:	// restore multiple selection to those maps that are still present
;838:	// check arena index values
;839:	while (i < s_mapselect.num_multisel)
;840:	{
line 841
;841:		found = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 842
;842:		for (j = 0; j < s_mapselect.nummaps; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $496
JUMPV
LABELV $493
line 843
;843:		{
line 844
;844:			if (s_mapselect.index_maplist[j] == s_mapselect.multiselect[i]) {
ADDRLP4 52
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRI4
LSHI4
ADDRGP4 s_mapselect+10080
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 52
INDIRI4
LSHI4
ADDRGP4 s_mapselect+149348
ADDP4
INDIRI4
NEI4 $498
line 845
;845:				found = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 846
;846:				break;
ADDRGP4 $495
JUMPV
LABELV $498
line 848
;847:			}
;848:		}
LABELV $494
line 842
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $496
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapselect+4292
INDIRI4
LTI4 $493
LABELV $495
line 850
;849:
;850:		if (found) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $502
line 851
;851:			s_mapselect.multiselect[i] = j;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+149348
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 852
;852:			i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 853
;853:			continue;
ADDRGP4 $490
JUMPV
LABELV $502
line 857
;854:		}
;855:
;856:		// delete, then recheck this index again
;857:		MapSelect_DeleteMultiAtPos(i);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 MapSelect_DeleteMultiAtPos
CALLV
pop
line 858
;858:	}
LABELV $490
line 839
ADDRLP4 4
INDIRI4
ADDRGP4 s_mapselect+149476
INDIRI4
LTI4 $489
line 859
;859:}
LABELV $475
endproc MapSelect_FilterChanged 60 12
proc MapSelect_CommitSelection 16 8
line 869
;860:
;861:
;862:
;863:/*
;864:=================
;865:MapSelect_CommitSelection
;866:=================
;867:*/
;868:static void MapSelect_CommitSelection(void)
;869:{
line 873
;870:	const char* info;
;871:	int i;
;872:
;873:	if (s_mapselect.multisel.curvalue)
ADDRGP4 s_mapselect+3848+88
INDIRI4
CNSTI4 0
EQI4 $506
line 874
;874:	{
line 875
;875:		if (s_mapselect.num_multisel ==0)
ADDRGP4 s_mapselect+149476
INDIRI4
CNSTI4 0
NEI4 $510
line 876
;876:			return;
ADDRGP4 $505
JUMPV
LABELV $510
line 879
;877:
;878:		// replace first map, then insert the rest
;879:		StartServer_StoreMap(s_mapselect.index, s_mapselect.index_maplist[s_mapselect.multiselect[0]]);
ADDRGP4 s_mapselect+4308
INDIRI4
ARGI4
ADDRGP4 s_mapselect+149348
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 StartServer_StoreMap
CALLV
pop
line 880
;880:		for (i = 1; i < s_mapselect.num_multisel; i ++)
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $519
JUMPV
LABELV $516
line 881
;881:		{
line 882
;882:			StartServer_InsertMap(s_mapselect.index + i,s_mapselect.index_maplist[s_mapselect.multiselect[i]]);
ADDRGP4 s_mapselect+4308
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRGP4 s_mapselect+149348
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRGP4 s_mapselect+10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 StartServer_InsertMap
CALLV
pop
line 883
;883:		}
LABELV $517
line 880
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $519
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapselect+149476
INDIRI4
LTI4 $516
line 884
;884:	}
ADDRGP4 $507
JUMPV
LABELV $506
line 886
;885:	else
;886:	{
line 888
;887:		// overwrite existing map
;888:		StartServer_StoreMap(s_mapselect.index, s_mapselect.index_maplist[s_mapselect.currentmap]);
ADDRGP4 s_mapselect+4308
INDIRI4
ARGI4
ADDRGP4 s_mapselect+4304
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+10080
ADDP4
INDIRI4
ARGI4
ADDRGP4 StartServer_StoreMap
CALLV
pop
line 889
;889:	}
LABELV $507
line 890
;890:}
LABELV $505
endproc MapSelect_CommitSelection 16 8
proc MapSelect_MenuEvent 12 8
line 899
;891:
;892:
;893:/*
;894:=================
;895:MapSelect_MenuEvent
;896:=================
;897:*/
;898:static void MapSelect_MenuEvent( void* ptr, int event )
;899:{
line 900
;900:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $528
line 901
;901:		return;
ADDRGP4 $527
JUMPV
LABELV $528
line 903
;902:	}
;903:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $530
ADDRLP4 0
INDIRI4
CNSTI4 18
GTI4 $530
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $560-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $560
address $533
address $544
address $539
address $534
address $550
address $550
address $556
address $551
address $552
code
LABELV $533
line 905
;904:	case ID_MAPSELECT_CANCEL:
;905:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 906
;906:		break;
ADDRGP4 $531
JUMPV
LABELV $534
line 909
;907:
;908:	case ID_MAPSELECT_OK:
;909:		ms_allmaps = s_mapselect.allmaps.curvalue;
ADDRGP4 ms_allmaps
ADDRGP4 s_mapselect+3488+88
INDIRI4
ASGNI4
line 910
;910:		ms_filter = s_mapselect.filter.curvalue;
ADDRGP4 ms_filter
ADDRGP4 s_mapselect+3584+92
INDIRI4
ASGNI4
line 911
;911:		MapSelect_CommitSelection();
ADDRGP4 MapSelect_CommitSelection
CALLV
pop
line 912
;912:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 913
;913:		break;
ADDRGP4 $531
JUMPV
LABELV $539
line 916
;914:
;915:	case ID_MAPSELECT_PREV:
;916:		if (s_mapselect.page > 0)
ADDRGP4 s_mapselect+4300
INDIRI4
CNSTI4 0
LEI4 $531
line 917
;917:		{
line 918
;918:			s_mapselect.page--;
ADDRLP4 8
ADDRGP4 s_mapselect+4300
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 919
;919:			MapSelect_SetNewMapPage();
ADDRGP4 MapSelect_SetNewMapPage
CALLV
pop
line 920
;920:		}
line 921
;921:		break;
ADDRGP4 $531
JUMPV
LABELV $544
line 924
;922:
;923:	case ID_MAPSELECT_NEXT:
;924:		if (s_mapselect.page < s_mapselect.maxpages - 1)
ADDRGP4 s_mapselect+4300
INDIRI4
ADDRGP4 s_mapselect+4296
INDIRI4
CNSTI4 1
SUBI4
GEI4 $531
line 925
;925:		{
line 926
;926:			s_mapselect.page++;
ADDRLP4 8
ADDRGP4 s_mapselect+4300
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 927
;927:			MapSelect_SetNewMapPage();
ADDRGP4 MapSelect_SetNewMapPage
CALLV
pop
line 928
;928:		}
line 929
;929:		break;
ADDRGP4 $531
JUMPV
LABELV $550
line 933
;930:
;931:	case ID_MAPSELECT_FILTERMAPS:
;932:	case ID_MAPSELECT_ALLMAPS:
;933:		MapSelect_FilterChanged();
ADDRGP4 MapSelect_FilterChanged
CALLV
pop
line 934
;934:		break;
ADDRGP4 $531
JUMPV
LABELV $551
line 937
;935:
;936:	case ID_MAPSELECT_MULTISEL:
;937:		MapSelect_ToggleMultiSelect();
ADDRGP4 MapSelect_ToggleMultiSelect
CALLV
pop
line 938
;938:		MapSelect_UpdateInterface();
ADDRGP4 MapSelect_UpdateInterface
CALLV
pop
line 939
;939:		break;
ADDRGP4 $531
JUMPV
LABELV $552
line 942
;940:
;941:	case ID_MAPSELECT_LISTVIEW:
;942:		trap_Cvar_SetValue("uie_map_list", s_mapselect.listview.curvalue);
ADDRGP4 $553
ARGP4
ADDRGP4 s_mapselect+3944+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 943
;943:		MapSelect_SetViewType();
ADDRGP4 MapSelect_SetViewType
CALLV
pop
line 944
;944:		MapSelect_SetNewMapPage();
ADDRGP4 MapSelect_SetNewMapPage
CALLV
pop
line 945
;945:		MapSelect_UpdateInterface();
ADDRGP4 MapSelect_UpdateInterface
CALLV
pop
line 946
;946:		break;
ADDRGP4 $531
JUMPV
LABELV $556
line 949
;947:
;948:	case ID_MAPSELECT_MAPICONS:
;949:		trap_Cvar_SetValue("uie_mapicons", s_mapselect.mapicons.curvalue);
ADDRGP4 $557
ARGP4
ADDRGP4 s_mapselect+3716+92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 950
;950:		break;
LABELV $530
LABELV $531
line 952
;951:	}
;952:}
LABELV $527
endproc MapSelect_MenuEvent 12 8
proc MapSelect_MapSelectEvent 4 4
line 962
;953:
;954:
;955:
;956:
;957:/*
;958:=================
;959:MapSelect_MapSelectEvent
;960:=================
;961:*/
;962:static void MapSelect_MapSelectEvent( void* ptr, int event ) {
line 965
;963:	int index;
;964:
;965:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $563
line 966
;966:		return;
ADDRGP4 $562
JUMPV
LABELV $563
line 969
;967:	}
;968:
;969:	index = (s_mapselect.page * MAX_GRIDMAPSPERPAGE) + ((menucommon_s*) ptr)->id;
ADDRLP4 0
CNSTI4 12
ADDRGP4 s_mapselect+4300
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDI4
ASGNI4
line 970
;970:	if (s_mapselect.multisel.curvalue) {
ADDRGP4 s_mapselect+3848+88
INDIRI4
CNSTI4 0
EQI4 $566
line 971
;971:		MapSelect_AddToMultiSelect(index);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 MapSelect_AddToMultiSelect
CALLV
pop
line 972
;972:	}
ADDRGP4 $567
JUMPV
LABELV $566
line 973
;973:	else {
line 974
;974:		s_mapselect.currentmap = index;
ADDRGP4 s_mapselect+4304
ADDRLP4 0
INDIRI4
ASGNI4
line 975
;975:	}
LABELV $567
line 976
;976:	MapSelect_UpdateInterface();
ADDRGP4 MapSelect_UpdateInterface
CALLV
pop
line 977
;977:}
LABELV $562
endproc MapSelect_MapSelectEvent 4 4
proc MapSelect_DrawMapPic 120 24
line 987
;978:
;979:
;980:
;981:
;982:/*
;983:=================
;984:MapSelect_DrawMapPic
;985:=================
;986:*/
;987:static void MapSelect_DrawMapPic( void *self ) {
line 1003
;988:	menubitmap_s	*b;
;989:	int				x;
;990:	int				y;
;991:	int				w;
;992:	int				h;
;993:	int				n;
;994:	int				i;
;995:	int 			multi;
;996:	int id;
;997:	int hasfocus;
;998:	int secondline, offset;
;999:	vec4_t tempcolor;
;1000:	float* color;
;1001:	vec4_t colormaps;
;1002:
;1003:	colormaps[0] = 0.4;
ADDRLP4 44
CNSTF4 1053609165
ASGNF4
line 1004
;1004:	colormaps[1] = 0.4;
ADDRLP4 44+4
CNSTF4 1053609165
ASGNF4
line 1005
;1005:	colormaps[2] = 0.4;
ADDRLP4 44+8
CNSTF4 1053609165
ASGNF4
line 1006
;1006:	colormaps[3] = 1.0;
ADDRLP4 44+12
CNSTF4 1065353216
ASGNF4
line 1008
;1007:
;1008:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1010
;1009:
;1010:	if( b->focuspic && !b->focusshader ) {
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $575
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 0
NEI4 $575
line 1011
;1011:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 1012
;1012:	}
LABELV $575
line 1015
;1013:
;1014:	// draw focus/highlight
;1015:	if (!(b->generic.flags & QMF_INACTIVE)) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 16384
BANDU4
CNSTU4 0
NEU4 $577
line 1016
;1016:		x = b->generic.left;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1017
;1017:		y = b->generic.top;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 1018
;1018:		w = b->generic.right - b->generic.left;
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1019
;1019:		h =	b->generic.bottom - b->generic.top;
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1020
;1020:		hasfocus = ((b->generic.flags & QMF_PULSE) ||
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
ASGNU4
ADDRLP4 108
CNSTU4 0
ASGNU4
ADDRLP4 104
INDIRU4
CNSTU4 131072
BANDU4
ADDRLP4 108
INDIRU4
NEU4 $582
ADDRLP4 104
INDIRU4
CNSTU4 256
BANDU4
ADDRLP4 108
INDIRU4
EQU4 $580
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 112
INDIRP4
CVPU4 4
NEU4 $580
LABELV $582
ADDRLP4 96
CNSTI4 1
ASGNI4
ADDRGP4 $581
JUMPV
LABELV $580
ADDRLP4 96
CNSTI4 0
ASGNI4
LABELV $581
ADDRLP4 72
ADDRLP4 96
INDIRI4
ASGNI4
line 1022
;1021:		 (b->generic.flags & QMF_PULSEIFFOCUS && (Menu_ItemAtCursor( b->generic.parent ) == b)) );
;1022:		if (hasfocus)
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $583
line 1023
;1023:		{
line 1024
;1024:			if (b->focuscolor)
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $585
line 1025
;1025:			{
line 1026
;1026:			  tempcolor[0] = b->focuscolor[0];
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
INDIRF4
ASGNF4
line 1027
;1027:			  tempcolor[1] = b->focuscolor[1];
ADDRLP4 16+4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1028
;1028:			  tempcolor[2] = b->focuscolor[2];
ADDRLP4 16+8
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 1029
;1029:			  color        = tempcolor;
ADDRLP4 32
ADDRLP4 16
ASGNP4
line 1030
;1030:			}
ADDRGP4 $586
JUMPV
LABELV $585
line 1032
;1031:			else
;1032:			  color = pulsecolor;
ADDRLP4 32
ADDRGP4 pulsecolor
ASGNP4
LABELV $586
line 1033
;1033:			color[3] = 0.7+0.3*sin(uis.realtime/PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 116
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1050253722
ADDRLP4 116
INDIRF4
MULF4
CNSTF4 1060320051
ADDF4
ASGNF4
line 1035
;1034:
;1035:			trap_R_SetColor( color );
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1036
;1036:			UI_DrawHandlePic( x, y, w, h, b->focusshader );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 64
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1037
;1037:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1038
;1038:		}
LABELV $583
line 1041
;1039:
;1040:		// check for multi-selection
;1041:		multi = -1;
ADDRLP4 60
CNSTI4 -1
ASGNI4
line 1042
;1042:		n = (s_mapselect.page * s_mapselect.maxMapsPerPage) + b->generic.id;
ADDRLP4 36
ADDRGP4 s_mapselect+4300
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1043
;1043:		if (s_mapselect.multisel.curvalue)
ADDRGP4 s_mapselect+3848+88
INDIRI4
CNSTI4 0
EQI4 $592
line 1044
;1044:		{
line 1045
;1045:			for (i = 0; i < s_mapselect.num_multisel; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $599
JUMPV
LABELV $596
line 1046
;1046:			{
line 1047
;1047:				if (s_mapselect.multiselect[i] == n) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+149348
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $601
line 1048
;1048:					multi = i + 1;
ADDRLP4 60
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1049
;1049:					break;
ADDRGP4 $598
JUMPV
LABELV $601
line 1051
;1050:				}
;1051:			}
LABELV $597
line 1045
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $599
ADDRLP4 4
INDIRI4
ADDRGP4 s_mapselect+149476
INDIRI4
LTI4 $596
LABELV $598
line 1052
;1052:		}
LABELV $592
line 1053
;1053:	}
LABELV $577
line 1056
;1054:
;1055:	// draw image/text
;1056:	x = b->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 1057
;1057:	y = b->generic.y;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1058
;1058:	w = b->width;
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1059
;1059:	h =	b->height;
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1060
;1060:	id = b->generic.id;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 1061
;1061:	StartServer_DrawMapPicture( x, y, w, h, &s_mapselect.mapinfo[id], colormaps);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 152
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 s_mapselect+4320
ADDP4
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 StartServer_DrawMapPicture
CALLV
pop
line 1063
;1062:
;1063:	if( b->generic.flags & QMF_HIGHLIGHT) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $605
line 1064
;1064:		UI_DrawNamedPic( x, y, w, h, MAPSELECT_MAPSELECTED);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 64
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 $607
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 1065
;1065:	}
LABELV $605
line 1067
;1066:
;1067:	x = b->generic.x + b->width/2;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1068
;1068:	y = b->generic.y + b->height + 2;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 1070
;1069:
;1070:	if (hasfocus)
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $608
line 1071
;1071:	{
line 1072
;1072:		tempcolor[0] = s_mapselect.maptext_color[id][0];
ADDRLP4 16
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+9936
ADDP4
INDIRP4
INDIRF4
ASGNF4
line 1073
;1073:		tempcolor[1] = s_mapselect.maptext_color[id][1];
ADDRLP4 16+4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+9936
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1074
;1074:		tempcolor[2] = s_mapselect.maptext_color[id][2];
ADDRLP4 16+8
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+9936
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 1075
;1075:		color = tempcolor;
ADDRLP4 32
ADDRLP4 16
ASGNP4
line 1076
;1076:		color[3] = 0.7+0.3*sin(uis.realtime/PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 96
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1050253722
ADDRLP4 96
INDIRF4
MULF4
CNSTF4 1060320051
ADDF4
ASGNF4
line 1077
;1077:	}
ADDRGP4 $609
JUMPV
LABELV $608
line 1079
;1078:	else
;1079:		color = s_mapselect.maptext_color[id];
ADDRLP4 32
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+9936
ADDP4
INDIRP4
ASGNP4
LABELV $609
line 1081
;1080:
;1081:	secondline = s_mapselect.mapsecondline[n];
ADDRLP4 76
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+145248
ADDP4
INDIRI4
ASGNI4
line 1083
;1082:
;1083:	offset = LINE_HEIGHT;
ADDRLP4 80
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 1085
;1084:
;1085:	if (secondline) {
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $619
line 1086
;1086:		offset += LINE_HEIGHT;
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1087
;1087:		UI_DrawString( x, y - LINE_HEIGHT, &s_mapselect.mapdrawname[n][secondline],
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
SUBI4
ARGI4
ADDRLP4 76
INDIRI4
ADDRLP4 36
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 s_mapselect+79712
ADDP4
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1089
;1088:			UI_CENTER|UI_SMALLFONT, color);
;1089:	}
LABELV $619
line 1090
;1090:	UI_DrawString( x, y - offset, s_mapselect.mapdrawname[n], UI_CENTER|UI_SMALLFONT, color);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ADDRLP4 80
INDIRI4
SUBI4
ARGI4
ADDRLP4 36
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 s_mapselect+79712
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1092
;1091:
;1092:	UI_DrawString( x, y , s_mapselect.mapinfo[id].mapname, UI_CENTER|UI_SMALLFONT, color );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 152
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 s_mapselect+4320
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1096
;1093:
;1094:
;1095:	// draw multi-select
;1096:	if (multi < 0)
ADDRLP4 60
INDIRI4
CNSTI4 0
GEI4 $626
line 1097
;1097:		return;
ADDRGP4 $571
JUMPV
LABELV $626
line 1099
;1098:
;1099:	x = b->generic.x + b->width/2;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1100
;1100:	y = b->generic.y + b->height/2 - GIANTCHAR_HEIGHT/2;
ADDRLP4 104
CNSTI4 2
ASGNI4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
DIVI4
ADDI4
ADDRGP4 cl_giantcharheight+12
INDIRI4
ADDRLP4 104
INDIRI4
DIVI4
SUBI4
ASGNI4
line 1102
;1101:
;1102:	tempcolor[0] = 1.0;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1103
;1103:	tempcolor[1] = 1.0;
ADDRLP4 16+4
CNSTF4 1065353216
ASGNF4
line 1104
;1104:	tempcolor[2] = 1.0;
ADDRLP4 16+8
CNSTF4 1065353216
ASGNF4
line 1105
;1105:	tempcolor[3] = 0.8;
ADDRLP4 16+12
CNSTF4 1061997773
ASGNF4
line 1106
;1106:	color = tempcolor;
ADDRLP4 32
ADDRLP4 16
ASGNP4
line 1108
;1107:
;1108:	if (hasfocus)
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $632
line 1109
;1109:		color[3] = 0.7+0.3*sin(uis.realtime/PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 108
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1050253722
ADDRLP4 108
INDIRF4
MULF4
CNSTF4 1060320051
ADDF4
ASGNF4
LABELV $632
line 1111
;1110:
;1111:	UI_DrawString( x, y , va("%i", multi), UI_CENTER|UI_DROPSHADOW|UI_GIANTFONT, color );
ADDRGP4 $635
ARGP4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
ARGP4
CNSTI4 2113
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1112
;1112:}
LABELV $571
endproc MapSelect_DrawMapPic 120 24
export MapSelect_Cache
proc MapSelect_Cache 0 4
line 1122
;1113:
;1114:
;1115:
;1116:/*
;1117:=================
;1118:MapSelect_Cache
;1119:=================
;1120:*/
;1121:void MapSelect_Cache( void )
;1122:{
line 1123
;1123:	trap_R_RegisterShaderNoMip( MAPSELECT_HARROWS );
ADDRGP4 $637
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1124
;1124:	trap_R_RegisterShaderNoMip( MAPSELECT_NEXT );
ADDRGP4 $638
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1125
;1125:	trap_R_RegisterShaderNoMip( MAPSELECT_PREVIOUS );
ADDRGP4 $639
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1126
;1126:	trap_R_RegisterShaderNoMip( MAPSELECT_CANCEL0 );
ADDRGP4 $640
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1127
;1127:	trap_R_RegisterShaderNoMip( MAPSELECT_CANCEL1 );
ADDRGP4 $641
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1128
;1128:	trap_R_RegisterShaderNoMip( MAPSELECT_ACCEPT0 );
ADDRGP4 $642
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1129
;1129:	trap_R_RegisterShaderNoMip( MAPSELECT_ACCEPT1 );
ADDRGP4 $643
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1130
;1130:	trap_R_RegisterShaderNoMip( MAPSELECT_ERRORPIC );
ADDRGP4 $644
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1131
;1131:	trap_R_RegisterShaderNoMip( MAPSELECT_MAPFOCUS );
ADDRGP4 $645
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1133
;1132:
;1133:	trap_R_RegisterShaderNoMip( MAPSELECT_MAPSELECTED );
ADDRGP4 $607
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1134
;1134:}
LABELV $636
endproc MapSelect_Cache 0 4
proc MapSelect_ScrollCharParams 0 0
line 1146
;1135:
;1136:
;1137:
;1138:
;1139:
;1140:/*
;1141:=================
;1142:MapSelect_ScrollCharParams
;1143:=================
;1144:*/
;1145:static void MapSelect_ScrollCharParams( int* height, int* width, int* line)
;1146:{
line 1147
;1147:	*height = SMALLCHAR_HEIGHT;
ADDRFP4 0
INDIRP4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ASGNI4
line 1148
;1148:	*width = SMALLCHAR_WIDTH;
ADDRFP4 4
INDIRP4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ASGNI4
line 1149
;1149:	*line = SMALLCHAR_HEIGHT + 2;
ADDRFP4 8
INDIRP4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 1150
;1150:}
LABELV $646
endproc MapSelect_ScrollCharParams 0 0
proc MapSelect_ScrollListDraw 88 20
line 1160
;1151:
;1152:
;1153:
;1154:/*
;1155:=================
;1156:MapSelect_ScrollListDraw
;1157:=================
;1158:*/
;1159:static void MapSelect_ScrollListDraw( void* ptr )
;1160:{
line 1179
;1161:	int			x;
;1162:	int			u;
;1163:	int			y;
;1164:	int			i, j;
;1165:	int			base;
;1166:	int			column;
;1167:	float*		color;
;1168:	qboolean	hasfocus;
;1169:	int			style;
;1170:	menulist_s *l;
;1171:	float	scale;
;1172:	int 	charwidth;
;1173:	int 	charheight;
;1174:	int 	lineheight;
;1175:	int 	index;
;1176:	int		map;
;1177:	int 	offset;
;1178:
;1179:	l = (menulist_s*)ptr;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 1180
;1180:	hasfocus = (l->generic.parent->cursor == l->generic.menuPosition);
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
NEI4 $652
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $653
JUMPV
LABELV $652
ADDRLP4 72
CNSTI4 0
ASGNI4
LABELV $653
ADDRLP4 56
ADDRLP4 72
INDIRI4
ASGNI4
line 1181
;1181:	MapSelect_ScrollCharParams( &charheight, &charwidth, &lineheight);
ADDRLP4 36
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 MapSelect_ScrollCharParams
CALLV
pop
line 1183
;1182:
;1183:	x =	l->generic.x;
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 1184
;1184:	for( column = 0; column < l->columns; column++ ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 $657
JUMPV
LABELV $654
line 1185
;1185:		y =	l->generic.y;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1186
;1186:		base = l->top + column * l->height;
ADDRLP4 52
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
MULI4
ADDI4
ASGNI4
line 1187
;1187:		for( i = base; i < base + l->height; i++) {
ADDRLP4 0
ADDRLP4 52
INDIRI4
ASGNI4
ADDRGP4 $661
JUMPV
LABELV $658
line 1188
;1188:			if (i >= l->numitems)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
LTI4 $662
line 1189
;1189:				break;
ADDRGP4 $660
JUMPV
LABELV $662
line 1191
;1190:
;1191:			style = UI_SMALLFONT;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 1192
;1192:			color = s_mapselect.maptext_color[i];
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mapselect+9936
ADDP4
INDIRP4
ASGNP4
line 1193
;1193:			if (i == l->curvalue)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
NEI4 $665
line 1194
;1194:			{
line 1195
;1195:				u = x - 2;
ADDRLP4 44
ADDRLP4 28
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1196
;1196:				if( l->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $667
line 1197
;1197:					u -= (l->width * charwidth) / 2 + 1;
ADDRLP4 44
ADDRLP4 44
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
MULI4
CNSTI4 2
DIVI4
CNSTI4 1
ADDI4
SUBI4
ASGNI4
line 1198
;1198:				}
LABELV $667
line 1200
;1199:
;1200:				UI_FillRect(u,y,l->width*charwidth ,lineheight,listbar_color);
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1201
;1201:				if (color != color_red)
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRGP4 color_red
CVPU4 4
EQU4 $669
line 1202
;1202:					color = text_color_highlight;
ADDRLP4 24
ADDRGP4 text_color_highlight
ASGNP4
LABELV $669
line 1204
;1203:
;1204:				if (hasfocus)
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $671
line 1205
;1205:					style |= (UI_PULSE|UI_LEFT);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
ADDRGP4 $666
JUMPV
LABELV $671
line 1207
;1206:				else
;1207:					style |= UI_LEFT;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ASGNI4
line 1208
;1208:			}
ADDRGP4 $666
JUMPV
LABELV $665
line 1210
;1209:			else
;1210:			{
line 1211
;1211:				style |= UI_LEFT|UI_INVERSE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1212
;1212:			}
LABELV $666
line 1214
;1213:
;1214:			if( l->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $673
line 1215
;1215:				style |= UI_CENTER;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1216
;1216:			}
LABELV $673
line 1218
;1217:
;1218:			index = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1219
;1219:			map = i + s_mapselect.page * s_mapselect.maxMapsPerPage;
ADDRLP4 40
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapselect+4300
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
MULI4
ADDI4
ASGNI4
line 1220
;1220:			if (s_mapselect.multisel.curvalue) {
ADDRGP4 s_mapselect+3848+88
INDIRI4
CNSTI4 0
EQI4 $677
line 1221
;1221:				index = MapSelect_MultiListPos(map) + 1;
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 MapSelect_MultiListPos
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 84
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1222
;1222:			}
LABELV $677
line 1224
;1223:
;1224:			if (index > 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $681
line 1225
;1225:				offset = 0;
ADDRLP4 48
CNSTI4 0
ASGNI4
line 1226
;1226:				if (index < 10)
ADDRLP4 12
INDIRI4
CNSTI4 10
GEI4 $683
line 1227
;1227:					offset += charwidth;
ADDRLP4 48
ADDRLP4 48
INDIRI4
ADDRLP4 32
INDIRI4
ADDI4
ASGNI4
LABELV $683
line 1229
;1228:
;1229:				UI_DrawString(x + offset, y + (lineheight - charheight)/2,
ADDRGP4 $635
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
ARGI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ADDI4
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1231
;1230:					va("%i", index), style, color_white);
;1231:			}
LABELV $681
line 1233
;1232:
;1233:			UI_DrawString(
ADDRLP4 28
INDIRI4
CNSTI4 3
ADDRLP4 32
INDIRI4
MULI4
ADDI4
ARGI4
ADDRLP4 84
CNSTI4 2
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ADDRLP4 84
INDIRI4
DIVI4
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 84
INDIRI4
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
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1240
;1234:				x + 3*charwidth,
;1235:				y + (lineheight - charheight)/2,
;1236:				l->itemnames[i],
;1237:				style,
;1238:				color);
;1239:
;1240:			y += lineheight;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 1241
;1241:		}
LABELV $659
line 1187
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $661
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDI4
LTI4 $658
LABELV $660
line 1242
;1242:		x += (l->width + l->seperation) * charwidth;
ADDRLP4 28
ADDRLP4 28
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ADDI4
ADDRLP4 32
INDIRI4
MULI4
ADDI4
ASGNI4
line 1243
;1243:	}
LABELV $655
line 1184
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $657
ADDRLP4 60
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
LTI4 $654
line 1244
;1244:}
LABELV $650
endproc MapSelect_ScrollListDraw 88 20
proc MapSelect_ListIndexFromCursor 56 16
line 1254
;1245:
;1246:
;1247:
;1248:/*
;1249:=================
;1250:MapSelect_ListIndexFromCursor
;1251:=================
;1252:*/
;1253:static qboolean MapSelect_ListIndexFromCursor(int* pos)
;1254:{
line 1266
;1255:	menulist_s* l;
;1256:	int	x;
;1257:	int	y;
;1258:	int	w;
;1259:	int	cursorx;
;1260:	int	cursory;
;1261:	int	column;
;1262:	int 	charwidth;
;1263:	int 	charheight;
;1264:	int 	lineheight;
;1265:
;1266:	l = &s_mapselect.maplist;
ADDRLP4 0
ADDRGP4 s_mapselect+4040
ASGNP4
line 1267
;1267:	MapSelect_ScrollCharParams( &charheight, &charwidth, &lineheight);
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 MapSelect_ScrollCharParams
CALLV
pop
line 1269
;1268:
;1269:    *pos = -1;
ADDRFP4 0
INDIRP4
CNSTI4 -1
ASGNI4
line 1272
;1270:
;1271:	// check scroll region
;1272:	x = l->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 1273
;1273:	y = l->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1274
;1274:	w = ( (l->width + l->seperation) * l->columns - l->seperation) * charwidth;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
MULI4
ADDRLP4 44
INDIRI4
SUBI4
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
line 1275
;1275:	if( l->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $687
line 1276
;1276:		x -= w / 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1277
;1277:	}
LABELV $687
line 1278
;1278:	if (!UI_CursorInRect( x, y, w, l->height*lineheight - 1))
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
MULI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 48
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $689
line 1279
;1279:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $685
JUMPV
LABELV $689
line 1281
;1280:
;1281:	cursorx = (uis.cursorx - x)/charwidth;
ADDRLP4 24
ADDRGP4 uis+8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ADDRLP4 12
INDIRI4
DIVI4
ASGNI4
line 1282
;1282:	column = cursorx / (l->width + l->seperation);
ADDRLP4 32
ADDRLP4 24
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ADDI4
DIVI4
ASGNI4
line 1283
;1283:	cursory = (uis.cursory - y)/lineheight;
ADDRLP4 28
ADDRGP4 uis+12
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ADDRLP4 16
INDIRI4
DIVI4
ASGNI4
line 1284
;1284:	*pos = column * l->height + cursory;
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
line 1286
;1285:
;1286:	return qtrue;
CNSTI4 1
RETI4
LABELV $685
endproc MapSelect_ListIndexFromCursor 56 16
data
align 4
LABELV $694
byte 4 0
align 4
LABELV $695
byte 4 0
code
proc MapSelect_DrawListMapPic 56 24
line 1299
;1287:}
;1288:
;1289:
;1290:
;1291:/*
;1292:=================
;1293:MapSelect_DrawListMapPic
;1294:
;1295:Draws the picture under cursor in the map selection listbox
;1296:=================
;1297:*/
;1298:static void MapSelect_DrawListMapPic(void)
;1299:{
line 1310
;1300:	static int oldindex = 0;
;1301:	static int maptime = 0;
;1302:
;1303:	int x,y;
;1304:	int colw, colh;
;1305:	int index;
;1306:	int base;
;1307:	int delta;
;1308:	vec4_t colour;
;1309:
;1310:	colour[0] = 1.0;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1311
;1311:	colour[1] = 1.0;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 1312
;1312:	colour[2] = 1.0;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1313
;1313:	colour[3] = 1.0;
ADDRLP4 0+12
CNSTF4 1065353216
ASGNF4
line 1315
;1314:
;1315:	base = s_mapselect.page * s_mapselect.maxMapsPerPage;
ADDRLP4 32
ADDRGP4 s_mapselect+4300
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
MULI4
ASGNI4
line 1318
;1316:
;1317:	// cursor is outside list, fade map
;1318:	if (MapSelect_ListIndexFromCursor(&index) && MapSelect_OnCurrentPage(base + index)) {
ADDRLP4 16
ARGP4
ADDRLP4 44
ADDRGP4 MapSelect_ListIndexFromCursor
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $701
ADDRLP4 32
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ARGI4
ADDRLP4 48
ADDRGP4 MapSelect_OnCurrentPage
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $701
line 1319
;1319:		maptime = uis.realtime;
ADDRGP4 $695
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 1320
;1320:		oldindex = index;
ADDRGP4 $694
ADDRLP4 16
INDIRI4
ASGNI4
line 1321
;1321:	}
ADDRGP4 $702
JUMPV
LABELV $701
line 1322
;1322:	else {
line 1323
;1323:		index = oldindex;
ADDRLP4 16
ADDRGP4 $694
INDIRI4
ASGNI4
line 1324
;1324:		delta = uis.realtime - maptime;
ADDRLP4 40
ADDRGP4 uis+4
INDIRI4
ADDRGP4 $695
INDIRI4
SUBI4
ASGNI4
line 1325
;1325:		if (delta >= MAP_FADETIME)
ADDRLP4 40
INDIRI4
CNSTI4 1000
LTI4 $705
line 1326
;1326:			return;
ADDRGP4 $693
JUMPV
LABELV $705
line 1328
;1327:
;1328:		colour[3] = 1.0 - (float)(delta) / MAP_FADETIME;
ADDRLP4 0+12
CNSTF4 1065353216
ADDRLP4 40
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
SUBF4
ASGNF4
line 1329
;1329:	}
LABELV $702
line 1330
;1330:	fading_red[3] = colour[3];
ADDRGP4 fading_red+12
ADDRLP4 0+12
INDIRF4
ASGNF4
line 1332
;1331:
;1332:	x = 320 - MAPPIC_WIDTH/2;
ADDRLP4 24
CNSTI4 251
ASGNI4
line 1333
;1333:	y = s_mapselect.bottomrow_y;
ADDRLP4 20
ADDRGP4 s_mapselect+149344
INDIRI4
ASGNI4
line 1335
;1334:
;1335:    MapSelect_MapCellSize(&colh, &colw);
ADDRLP4 36
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 MapSelect_MapCellSize
CALLV
pop
line 1337
;1336:
;1337:	trap_R_SetColor( fading_red );
ADDRGP4 fading_red
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1338
;1338:	UI_DrawNamedPic(x + uis.wideoffset - ( colw - MAPPIC_WIDTH )/2, y - 8, colw, colh, MAPSELECT_SELECT);
ADDRLP4 52
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uis+11476
INDIRI4
ADDI4
ADDRLP4 52
INDIRI4
CNSTI4 138
SUBI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
CNSTI4 8
SUBI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 $645
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 1339
;1339:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1341
;1340:
;1341:	StartServer_DrawMapPicture( x + uis.wideoffset, y,
ADDRLP4 24
INDIRI4
ADDRGP4 uis+11476
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 138
ARGI4
CNSTI4 92
ARGI4
CNSTI4 152
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 s_mapselect+4320
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 StartServer_DrawMapPicture
CALLV
pop
line 1344
;1342:		MAPPIC_WIDTH, MAPPIC_HEIGHT, &s_mapselect.mapinfo[index], colour);
;1343:
;1344:	UI_DrawString( 320 + uis.wideoffset, y + MAPPIC_HEIGHT + 8, s_mapselect.maplongname[base + index],
ADDRGP4 uis+11476
INDIRI4
CNSTI4 320
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 92
ADDI4
CNSTI4 8
ADDI4
ARGI4
ADDRLP4 32
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
CNSTI4 6
LSHI4
ADDRGP4 s_mapselect+14176
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1346
;1345:		UI_CENTER|UI_SMALLFONT, colour);
;1346:}
LABELV $693
endproc MapSelect_DrawListMapPic 56 24
proc MapSelect_MenuDraw 0 20
line 1357
;1347:
;1348:
;1349:
;1350:
;1351:/*
;1352:=================
;1353:MapSelect_MenuDraw
;1354:=================
;1355:*/
;1356:static void MapSelect_MenuDraw(void)
;1357:{
line 1358
;1358:	StartServer_BackgroundDraw(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 StartServer_BackgroundDraw
CALLV
pop
line 1361
;1359:
;1360:	// draw the controls
;1361:	Menu_Draw(&s_mapselect.menu);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1363
;1362:
;1363:	if (s_mapselect.nomaps)
ADDRGP4 s_mapselect+4312
INDIRI4
CNSTI4 0
EQI4 $717
line 1364
;1364:	{
line 1365
;1365:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $720
line 1366
;1366:		UI_DrawString(320, 240 - 32, "NO MAPS FOUND", UI_CENTER, color_nomap);
CNSTI4 320
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 $723
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_nomap
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1367
;1367:		}
LABELV $720
line 1368
;1368:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $716
line 1369
;1369:		UI_DrawString(320, 240 - 32, "КАРТЫ НЕ НАЙДЕНЫ", UI_CENTER, color_nomap);
CNSTI4 320
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 $727
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_nomap
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1370
;1370:		}
line 1371
;1371:		return;
ADDRGP4 $716
JUMPV
LABELV $717
line 1374
;1372:	}
;1373:
;1374:	if (s_mapselect.listview.curvalue) {
ADDRGP4 s_mapselect+3944+88
INDIRI4
CNSTI4 0
EQI4 $728
line 1375
;1375:		MapSelect_DrawListMapPic();
ADDRGP4 MapSelect_DrawListMapPic
CALLV
pop
line 1376
;1376:	}
LABELV $728
line 1377
;1377:}
LABELV $716
endproc MapSelect_MenuDraw 0 20
proc MapSelect_HandleListKey 44 8
line 1392
;1378:
;1379:
;1380:
;1381:
;1382:
;1383:
;1384:/*
;1385:=================
;1386:MapSelect_HandleListKey
;1387:
;1388:Returns true if the list box accepts that key input
;1389:=================
;1390:*/
;1391:static qboolean MapSelect_HandleListKey( int key, sfxHandle_t* psfx)
;1392:{
line 1397
;1393:	menulist_s* l;
;1394:	int	index;
;1395:	int	sel;
;1396:
;1397:	l = &s_mapselect.maplist;
ADDRLP4 0
ADDRGP4 s_mapselect+4040
ASGNP4
line 1399
;1398:
;1399:	switch (key) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 27
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $752
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $734
LABELV $753
ADDRFP4 0
INDIRI4
CNSTI4 178
EQI4 $736
ADDRGP4 $734
JUMPV
LABELV $736
line 1401
;1400:	case K_MOUSE1:
;1401:		if (l->generic.flags & QMF_HASMOUSEFOCUS)
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 512
BANDU4
CNSTU4 0
EQU4 $737
line 1402
;1402:		{
line 1404
;1403:			// absorbed, silent sound effect
;1404:			*psfx = (menu_null_sound);
ADDRFP4 4
INDIRP4
ADDRGP4 menu_null_sound
INDIRI4
ASGNI4
line 1405
;1405:			if (!MapSelect_ListIndexFromCursor(&index))
ADDRLP4 4
ARGP4
ADDRLP4 20
ADDRGP4 MapSelect_ListIndexFromCursor
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $739
line 1406
;1406:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $732
JUMPV
LABELV $739
line 1408
;1407:
;1408:			if (l->top + index < l->numitems)
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 24
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
GEI4 $741
line 1409
;1409:			{
line 1410
;1410:				l->oldvalue = l->curvalue;
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 1411
;1411:				l->curvalue = l->top + index;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1413
;1412:
;1413:				if (l->oldvalue != l->curvalue && l->generic.callback)
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
EQI4 $743
ADDRLP4 36
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $743
line 1414
;1414:				{
line 1415
;1415:					l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 40
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
CALLV
pop
line 1416
;1416:				}
LABELV $743
line 1417
;1417:				sel = s_mapselect.page * s_mapselect.maxMapsPerPage;
ADDRLP4 8
ADDRGP4 s_mapselect+4300
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
MULI4
ASGNI4
line 1418
;1418:				sel += l->curvalue;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1419
;1419:				s_mapselect.currentmap = sel;
ADDRGP4 s_mapselect+4304
ADDRLP4 8
INDIRI4
ASGNI4
line 1420
;1420:				if (s_mapselect.multisel.curvalue)
ADDRGP4 s_mapselect+3848+88
INDIRI4
CNSTI4 0
EQI4 $748
line 1421
;1421:					MapSelect_AddToMultiSelect(sel);
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 MapSelect_AddToMultiSelect
CALLV
pop
LABELV $748
line 1423
;1422:
;1423:				MapSelect_UpdateAcceptInterface();
ADDRGP4 MapSelect_UpdateAcceptInterface
CALLV
pop
line 1424
;1424:				*psfx = (menu_move_sound);
ADDRFP4 4
INDIRP4
ADDRGP4 menu_move_sound
INDIRI4
ASGNI4
line 1425
;1425:			}
LABELV $741
line 1426
;1426:		}
LABELV $737
line 1427
;1427:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $732
JUMPV
LABELV $752
line 1430
;1428:	// keys that have the default action
;1429:	case K_ESCAPE:
;1430:		*psfx = Menu_DefaultKey( &s_mapselect.menu, key );
ADDRGP4 s_mapselect
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1431
;1431:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $732
JUMPV
LABELV $734
line 1433
;1432:	}
;1433:	return qfalse;
CNSTI4 0
RETI4
LABELV $732
endproc MapSelect_HandleListKey 44 8
proc MapSelect_Key 16 8
line 1445
;1434:}
;1435:
;1436:
;1437:
;1438:
;1439:/*
;1440:=================
;1441:MapSelect_Key
;1442:=================
;1443:*/
;1444:static sfxHandle_t MapSelect_Key( int key )
;1445:{
line 1449
;1446:	menulist_s	*l;
;1447:	sfxHandle_t sfx;
;1448:
;1449:	l = (menulist_s	*)Menu_ItemAtCursor( &s_mapselect.menu );
ADDRGP4 s_mapselect
ARGP4
ADDRLP4 8
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1451
;1450:
;1451:	sfx = menu_null_sound;
ADDRLP4 0
ADDRGP4 menu_null_sound
INDIRI4
ASGNI4
line 1452
;1452:	if( l == &s_mapselect.maplist) {
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 s_mapselect+4040
CVPU4 4
NEU4 $755
line 1453
;1453:		if (!MapSelect_HandleListKey(key, &sfx))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 MapSelect_HandleListKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $756
line 1454
;1454:			return menu_buzz_sound;
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $754
JUMPV
line 1455
;1455:	}
LABELV $755
line 1456
;1456:	else {
line 1457
;1457:		sfx = Menu_DefaultKey( &s_mapselect.menu, key );
ADDRGP4 s_mapselect
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1458
;1458:	}
LABELV $756
line 1460
;1459:
;1460:	return sfx;
ADDRLP4 0
INDIRI4
RETI4
LABELV $754
endproc MapSelect_Key 16 8
proc MapSelect_ScrollListInit 48 12
line 1472
;1461:}
;1462:
;1463:
;1464:
;1465:
;1466:/*
;1467:=================
;1468:MapSelect_ScrollList_Init
;1469:=================
;1470:*/
;1471:static void MapSelect_ScrollListInit( menulist_s *l )
;1472:{
line 1478
;1473:	int		w;
;1474:	int 	charwidth;
;1475:	int 	charheight;
;1476:	int 	lineheight;
;1477:
;1478:	l->oldvalue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 1479
;1479:	l->curvalue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 1480
;1480:	l->top      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTI4 0
ASGNI4
line 1482
;1481:
;1482:	MapSelect_ScrollCharParams(&charheight, &charwidth, &lineheight);
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 MapSelect_ScrollCharParams
CALLV
pop
line 1484
;1483:
;1484:	if( !l->columns ) {
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 0
NEI4 $761
line 1485
;1485:		l->columns = 1;
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
CNSTI4 1
ASGNI4
line 1486
;1486:		l->seperation = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTI4 0
ASGNI4
line 1487
;1487:	}
ADDRGP4 $762
JUMPV
LABELV $761
line 1488
;1488:	else if( !l->seperation ) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 0
NEI4 $763
line 1489
;1489:		l->seperation = 3;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTI4 3
ASGNI4
line 1490
;1490:	}
LABELV $763
LABELV $762
line 1492
;1491:
;1492:	w = ( (l->width + l->seperation) * l->columns - l->seperation) * charwidth;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRLP4 16
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
MULI4
ADDRLP4 20
INDIRI4
SUBI4
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
line 1494
;1493:
;1494:	l->generic.left   =	l->generic.x;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 1495
;1495:	l->generic.top    = l->generic.y;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1496
;1496:	l->generic.right  =	l->generic.x + w;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1497
;1497:	l->generic.bottom =	l->generic.y + l->height * lineheight;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDI4
ASGNI4
line 1499
;1498:
;1499:	if( l->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $765
line 1500
;1500:		l->generic.left -= w / 2;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1501
;1501:		l->generic.right -= w / 2;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1502
;1502:	}
LABELV $765
line 1503
;1503:}
LABELV $760
endproc MapSelect_ScrollListInit 48 12
proc MapSelect_MenuInit 76 12
line 1514
;1504:
;1505:
;1506:
;1507:
;1508:/*
;1509:=================
;1510:MapSelect_MenuInit
;1511:=================
;1512:*/
;1513:static void MapSelect_MenuInit(int gametype, int index, const char* mapname)
;1514:{
line 1519
;1515:	int i, j, x, y, top;
;1516:	int colw, colh;
;1517:	int lastpage;
;1518:
;1519:	lastpage = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 1520
;1520:	if (ms_lastgametype == gametype)
ADDRGP4 ms_lastgametype
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $768
line 1521
;1521:		lastpage = s_mapselect.page;
ADDRLP4 20
ADDRGP4 s_mapselect+4300
INDIRI4
ASGNI4
ADDRGP4 $769
JUMPV
LABELV $768
line 1523
;1522:	else
;1523:		ms_lastgametype = gametype;
ADDRGP4 ms_lastgametype
ADDRFP4 0
INDIRI4
ASGNI4
LABELV $769
line 1525
;1524:
;1525:	memset(&s_mapselect,0,sizeof(s_mapselect));
ADDRGP4 s_mapselect
ARGP4
CNSTI4 0
ARGI4
CNSTI4 149480
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1526
;1526:	s_mapselect.gametype = gametype;
ADDRGP4 s_mapselect+4288
ADDRFP4 0
INDIRI4
ASGNI4
line 1527
;1527:	s_mapselect.menu.key = MapSelect_Key;
ADDRGP4 s_mapselect+1040
ADDRGP4 MapSelect_Key
ASGNP4
line 1529
;1528:
;1529:	MapSelect_Cache();
ADDRGP4 MapSelect_Cache
CALLV
pop
line 1531
;1530:
;1531:	if (gametype != GT_CTF && MapSelect_MapSupportsGametype(mapname)) {
ADDRFP4 0
INDIRI4
CNSTI4 5
EQI4 $773
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 MapSelect_MapSupportsGametype
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $773
line 1532
;1532:		s_mapselect.allmaps.curvalue = ms_allmaps;
ADDRGP4 s_mapselect+3488+88
ADDRGP4 ms_allmaps
INDIRI4
ASGNI4
line 1533
;1533:	}
ADDRGP4 $774
JUMPV
LABELV $773
line 1534
;1534:	else {
line 1535
;1535:		s_mapselect.allmaps.curvalue = 0;
ADDRGP4 s_mapselect+3488+88
CNSTI4 0
ASGNI4
line 1536
;1536:	}
LABELV $774
line 1539
;1537:
;1538:	// change map filter if needed
;1539:	if (mapname && mapname[0])
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $779
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $779
line 1540
;1540:	{
line 1541
;1541:		if (ms_filter < MAPFILTER_MAX)
ADDRGP4 ms_filter
INDIRI4
CNSTI4 3
GEI4 $781
line 1542
;1542:		{
line 1543
;1543:			if (StartServer_IsIdMap(mapname))
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 StartServer_IsIdMap
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $783
line 1544
;1544:			{
line 1545
;1545:				if (ms_filter == MAPFILTER_NONID)
ADDRGP4 ms_filter
INDIRI4
CNSTI4 2
NEI4 $782
line 1546
;1546:					ms_filter = MAPFILTER_OFF;
ADDRGP4 ms_filter
CNSTI4 0
ASGNI4
line 1547
;1547:			}
ADDRGP4 $782
JUMPV
LABELV $783
line 1549
;1548:			else
;1549:			{
line 1550
;1550:				if (ms_filter == MAPFILTER_ID)
ADDRGP4 ms_filter
INDIRI4
CNSTI4 1
NEI4 $782
line 1551
;1551:					ms_filter = MAPFILTER_OFF;
ADDRGP4 ms_filter
CNSTI4 0
ASGNI4
line 1552
;1552:			}
line 1553
;1553:		}
ADDRGP4 $782
JUMPV
LABELV $781
line 1554
;1554:		else if (!StartServer_IsCustomMapType(mapname, ms_filter - MAPFILTER_MAX))
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ms_filter
INDIRI4
CNSTI4 3
SUBI4
ARGI4
ADDRLP4 40
ADDRGP4 StartServer_IsCustomMapType
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $789
line 1555
;1555:		{
line 1556
;1556:			ms_filter = MAPFILTER_OFF;
ADDRGP4 ms_filter
CNSTI4 0
ASGNI4
line 1557
;1557:		}
LABELV $789
LABELV $782
line 1558
;1558:	}
LABELV $779
line 1560
;1559:
;1560:	s_mapselect.filter.curvalue = ms_filter;
ADDRGP4 s_mapselect+3584+92
ADDRGP4 ms_filter
INDIRI4
ASGNI4
line 1563
;1561:
;1562:	// remember previous map page
;1563:	if (s_mapselect.currentmap == -1 && lastpage != -1)
ADDRLP4 40
CNSTI4 -1
ASGNI4
ADDRGP4 s_mapselect+4304
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $793
ADDRLP4 20
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $793
line 1564
;1564:		s_mapselect.page = lastpage;
ADDRGP4 s_mapselect+4300
ADDRLP4 20
INDIRI4
ASGNI4
LABELV $793
line 1566
;1565:
;1566:	s_mapselect.index = index;
ADDRGP4 s_mapselect+4308
ADDRFP4 4
INDIRI4
ASGNI4
line 1568
;1567:
;1568:	s_mapselect.menu.wrapAround = qtrue;
ADDRGP4 s_mapselect+1044
CNSTI4 1
ASGNI4
line 1569
;1569:	s_mapselect.menu.native 	= qfalse;
ADDRGP4 s_mapselect+1056
CNSTI4 0
ASGNI4
line 1570
;1570:	s_mapselect.menu.fullscreen = qtrue;
ADDRGP4 s_mapselect+1052
CNSTI4 1
ASGNI4
line 1571
;1571:	s_mapselect.menu.draw = MapSelect_MenuDraw;
ADDRGP4 s_mapselect+1036
ADDRGP4 MapSelect_MenuDraw
ASGNP4
line 1573
;1572:
;1573:	s_mapselect.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_mapselect+1076
CNSTI4 10
ASGNI4
line 1574
;1574:	s_mapselect.banner.generic.x	   = 160;
ADDRGP4 s_mapselect+1076+28
CNSTI4 160
ASGNI4
line 1575
;1575:	s_mapselect.banner.generic.y	   = 4;
ADDRGP4 s_mapselect+1076+32
CNSTI4 4
ASGNI4
line 1576
;1576:	s_mapselect.banner.color         = color_white;
ADDRGP4 s_mapselect+1076+100
ADDRGP4 color_white
ASGNP4
line 1577
;1577:	s_mapselect.banner.style         = UI_CENTER | UI_GIANTFONT;
ADDRGP4 s_mapselect+1076+92
CNSTI4 65
ASGNI4
line 1579
;1578:
;1579:	s_mapselect.maptype.generic.type  = MTYPE_TEXT;
ADDRGP4 s_mapselect+3384
CNSTI4 7
ASGNI4
line 1580
;1580:	s_mapselect.maptype.generic.x	   = 160;
ADDRGP4 s_mapselect+3384+28
CNSTI4 160
ASGNI4
line 1581
;1581:	s_mapselect.maptype.generic.y	   = 4 + 36;
ADDRGP4 s_mapselect+3384+32
CNSTI4 40
ASGNI4
line 1582
;1582:	s_mapselect.maptype.color         = color_white;
ADDRGP4 s_mapselect+3384+100
ADDRGP4 color_white
ASGNP4
line 1583
;1583:	s_mapselect.maptype.style         = UI_CENTER;
ADDRGP4 s_mapselect+3384+92
CNSTI4 1
ASGNI4
line 1585
;1584:
;1585:	s_mapselect.icona.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mapselect+2572
CNSTI4 6
ASGNI4
line 1586
;1586:	s_mapselect.icona.generic.flags = QMF_INACTIVE;
ADDRGP4 s_mapselect+2572+72
CNSTU4 16384
ASGNU4
line 1588
;1587://	s_mapselect.icona.generic.name = "menu/medals/medal_excellent";
;1588:	s_mapselect.icona.generic.x	 = 420  - 32 - SMALLCHAR_WIDTH;
ADDRGP4 s_mapselect+2572+28
CNSTI4 388
ADDRGP4 cl_smallcharwidth+12
INDIRI4
SUBI4
ASGNI4
line 1589
;1589:	s_mapselect.icona.generic.y	 = 8 + (SMALLCHAR_HEIGHT - 32)/2;
ADDRGP4 s_mapselect+2572+32
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 32
SUBI4
CNSTI4 2
DIVI4
CNSTI4 8
ADDI4
ASGNI4
line 1590
;1590:	s_mapselect.icona.width  	     = 32;
ADDRGP4 s_mapselect+2572+104
CNSTI4 32
ASGNI4
line 1591
;1591:	s_mapselect.icona.height  	     = 32;
ADDRGP4 s_mapselect+2572+108
CNSTI4 32
ASGNI4
line 1593
;1592:
;1593:	s_mapselect.iconb.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mapselect+2688
CNSTI4 6
ASGNI4
line 1594
;1594:	s_mapselect.iconb.generic.flags = QMF_INACTIVE;
ADDRGP4 s_mapselect+2688+72
CNSTU4 16384
ASGNU4
line 1596
;1595://	s_mapselect.iconb.generic.name = "menu/medals/medal_victory";
;1596:	s_mapselect.iconb.generic.x	 = 420 - 64 - SMALLCHAR_WIDTH;
ADDRGP4 s_mapselect+2688+28
CNSTI4 356
ADDRGP4 cl_smallcharwidth+12
INDIRI4
SUBI4
ASGNI4
line 1597
;1597:	s_mapselect.iconb.generic.y	 = 8 + (SMALLCHAR_HEIGHT - 32)/2;
ADDRGP4 s_mapselect+2688+32
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 32
SUBI4
CNSTI4 2
DIVI4
CNSTI4 8
ADDI4
ASGNI4
line 1598
;1598:	s_mapselect.iconb.width  	     = 32;
ADDRGP4 s_mapselect+2688+104
CNSTI4 32
ASGNI4
line 1599
;1599:	s_mapselect.iconb.height  	     = 32;
ADDRGP4 s_mapselect+2688+108
CNSTI4 32
ASGNI4
line 1601
;1600:
;1601:	s_mapselect.filter.generic.type = MTYPE_SPINCONTROL;
ADDRGP4 s_mapselect+3584
CNSTI4 3
ASGNI4
line 1602
;1602:	s_mapselect.filter.generic.x = 420 + 8*SMALLCHAR_WIDTH;
ADDRGP4 s_mapselect+3584+28
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 420
ADDI4
ASGNI4
line 1603
;1603:	s_mapselect.filter.generic.y = 8;
ADDRGP4 s_mapselect+3584+32
CNSTI4 8
ASGNI4
line 1604
;1604:	s_mapselect.filter.generic.id  = ID_MAPSELECT_FILTERMAPS;
ADDRGP4 s_mapselect+3584+24
CNSTI4 15
ASGNI4
line 1605
;1605:	s_mapselect.filter.generic.callback  = MapSelect_MenuEvent;
ADDRGP4 s_mapselect+3584+76
ADDRGP4 MapSelect_MenuEvent
ASGNP4
line 1607
;1606:
;1607:	s_mapselect.allmaps.generic.type = MTYPE_RADIOBUTTON;
ADDRGP4 s_mapselect+3488
CNSTI4 5
ASGNI4
line 1608
;1608:	s_mapselect.allmaps.generic.x = 480 - 8*SMALLCHAR_WIDTH;
ADDRGP4 s_mapselect+3488+28
CNSTI4 480
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 3
LSHI4
SUBI4
ASGNI4
line 1609
;1609:	s_mapselect.allmaps.generic.y = 8 + LINE_HEIGHT + 8;
ADDRLP4 44
CNSTI4 8
ASGNI4
ADDRGP4 s_mapselect+3488+32
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDRLP4 44
INDIRI4
ADDI4
ADDRLP4 44
INDIRI4
ADDI4
ASGNI4
line 1610
;1610:	s_mapselect.allmaps.generic.id  = ID_MAPSELECT_ALLMAPS;
ADDRGP4 s_mapselect+3488+24
CNSTI4 14
ASGNI4
line 1611
;1611:	s_mapselect.allmaps.generic.callback  = MapSelect_MenuEvent;
ADDRGP4 s_mapselect+3488+76
ADDRGP4 MapSelect_MenuEvent
ASGNP4
line 1613
;1612:
;1613:	s_mapselect.mapicons.generic.type = MTYPE_SPINCONTROL;
ADDRGP4 s_mapselect+3716
CNSTI4 3
ASGNI4
line 1614
;1614:	s_mapselect.mapicons.generic.x = 480 + 8*SMALLCHAR_WIDTH;
ADDRGP4 s_mapselect+3716+28
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 480
ADDI4
ASGNI4
line 1615
;1615:	s_mapselect.mapicons.generic.y = 8 + LINE_HEIGHT + 8;
ADDRLP4 48
CNSTI4 8
ASGNI4
ADDRGP4 s_mapselect+3716+32
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDRLP4 48
INDIRI4
ADDI4
ADDRLP4 48
INDIRI4
ADDI4
ASGNI4
line 1616
;1616:	s_mapselect.mapicons.generic.id  = ID_MAPSELECT_MAPICONS;
ADDRGP4 s_mapselect+3716+24
CNSTI4 16
ASGNI4
line 1617
;1617:	s_mapselect.mapicons.generic.callback  = MapSelect_MenuEvent;
ADDRGP4 s_mapselect+3716+76
ADDRGP4 MapSelect_MenuEvent
ASGNP4
line 1618
;1618:	s_mapselect.mapicons.curvalue = (int)Com_Clamp(0, MAPICONS_MAX - 1, uie_mapicons.integer);
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRGP4 uie_mapicons+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_mapselect+3716+92
ADDRLP4 52
INDIRF4
CVFI4 4
ASGNI4
line 1620
;1619:
;1620:	s_mapselect.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mapselect+2804
CNSTI4 6
ASGNI4
line 1621
;1621:	s_mapselect.arrows.generic.name  = MAPSELECT_HARROWS;
ADDRGP4 s_mapselect+2804+4
ADDRGP4 $637
ASGNP4
line 1622
;1622:	s_mapselect.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_mapselect+2804+72
CNSTU4 16384
ASGNU4
line 1623
;1623:	s_mapselect.arrows.generic.x	 = 320;
ADDRGP4 s_mapselect+2804+28
CNSTI4 320
ASGNI4
line 1624
;1624:	s_mapselect.arrows.generic.y	 = 480 - 64;
ADDRGP4 s_mapselect+2804+32
CNSTI4 416
ASGNI4
line 1625
;1625:	s_mapselect.arrows.width  	     = 192;
ADDRGP4 s_mapselect+2804+104
CNSTI4 192
ASGNI4
line 1626
;1626:	s_mapselect.arrows.height  	     = 64;
ADDRGP4 s_mapselect+2804+108
CNSTI4 64
ASGNI4
line 1628
;1627:
;1628:	s_mapselect.previous.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mapselect+3036
CNSTI4 6
ASGNI4
line 1629
;1629:	s_mapselect.previous.generic.flags  = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapselect+3036+72
CNSTU4 260
ASGNU4
line 1630
;1630:	s_mapselect.previous.generic.id  = ID_MAPSELECT_PREV;
ADDRGP4 s_mapselect+3036+24
CNSTI4 12
ASGNI4
line 1631
;1631:	s_mapselect.previous.generic.callback  = MapSelect_MenuEvent;
ADDRGP4 s_mapselect+3036+76
ADDRGP4 MapSelect_MenuEvent
ASGNP4
line 1632
;1632:	s_mapselect.previous.generic.x	 = 320;
ADDRGP4 s_mapselect+3036+28
CNSTI4 320
ASGNI4
line 1633
;1633:	s_mapselect.previous.generic.y	 = 480 - 64;
ADDRGP4 s_mapselect+3036+32
CNSTI4 416
ASGNI4
line 1634
;1634:	s_mapselect.previous.width  	     = 96;
ADDRGP4 s_mapselect+3036+104
CNSTI4 96
ASGNI4
line 1635
;1635:	s_mapselect.previous.height  	     = 64;
ADDRGP4 s_mapselect+3036+108
CNSTI4 64
ASGNI4
line 1636
;1636:	s_mapselect.previous.focuspic = MAPSELECT_PREVIOUS;
ADDRGP4 s_mapselect+3036+88
ADDRGP4 $639
ASGNP4
line 1638
;1637:
;1638:	s_mapselect.next.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mapselect+2920
CNSTI4 6
ASGNI4
line 1639
;1639:	s_mapselect.next.generic.flags  = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapselect+2920+72
CNSTU4 260
ASGNU4
line 1640
;1640:	s_mapselect.next.generic.id  = ID_MAPSELECT_NEXT;
ADDRGP4 s_mapselect+2920+24
CNSTI4 11
ASGNI4
line 1641
;1641:	s_mapselect.next.generic.callback  = MapSelect_MenuEvent;
ADDRGP4 s_mapselect+2920+76
ADDRGP4 MapSelect_MenuEvent
ASGNP4
line 1642
;1642:	s_mapselect.next.generic.x	 = 320 + 96 ;
ADDRGP4 s_mapselect+2920+28
CNSTI4 416
ASGNI4
line 1643
;1643:	s_mapselect.next.generic.y	 = 480 - 64;
ADDRGP4 s_mapselect+2920+32
CNSTI4 416
ASGNI4
line 1644
;1644:	s_mapselect.next.width  	     = 96;
ADDRGP4 s_mapselect+2920+104
CNSTI4 96
ASGNI4
line 1645
;1645:	s_mapselect.next.height  	     = 64;
ADDRGP4 s_mapselect+2920+108
CNSTI4 64
ASGNI4
line 1646
;1646:	s_mapselect.next.focuspic = MAPSELECT_NEXT;
ADDRGP4 s_mapselect+2920+88
ADDRGP4 $638
ASGNP4
line 1648
;1647:
;1648:	s_mapselect.cancel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mapselect+3152
CNSTI4 6
ASGNI4
line 1649
;1649:	s_mapselect.cancel.generic.name  = MAPSELECT_CANCEL0;
ADDRGP4 s_mapselect+3152+4
ADDRGP4 $640
ASGNP4
line 1650
;1650:	s_mapselect.cancel.generic.flags  = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapselect+3152+72
CNSTU4 260
ASGNU4
line 1651
;1651:	s_mapselect.cancel.generic.id  = ID_MAPSELECT_CANCEL;
ADDRGP4 s_mapselect+3152+24
CNSTI4 10
ASGNI4
line 1652
;1652:	s_mapselect.cancel.generic.callback  = MapSelect_MenuEvent;
ADDRGP4 s_mapselect+3152+76
ADDRGP4 MapSelect_MenuEvent
ASGNP4
line 1653
;1653:	s_mapselect.cancel.generic.x	   = 0 - uis.wideoffset;
ADDRGP4 s_mapselect+3152+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1654
;1654:	s_mapselect.cancel.generic.y	   = 480 - 64;
ADDRGP4 s_mapselect+3152+32
CNSTI4 416
ASGNI4
line 1655
;1655:	s_mapselect.cancel.width  	   = 128;
ADDRGP4 s_mapselect+3152+104
CNSTI4 128
ASGNI4
line 1656
;1656:	s_mapselect.cancel.height  	   = 64;
ADDRGP4 s_mapselect+3152+108
CNSTI4 64
ASGNI4
line 1657
;1657:	s_mapselect.cancel.focuspic     = MAPSELECT_CANCEL1;
ADDRGP4 s_mapselect+3152+88
ADDRGP4 $641
ASGNP4
line 1659
;1658:
;1659:	s_mapselect.accept.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mapselect+3268
CNSTI4 6
ASGNI4
line 1660
;1660:	s_mapselect.accept.generic.name  = MAPSELECT_ACCEPT0;
ADDRGP4 s_mapselect+3268+4
ADDRGP4 $642
ASGNP4
line 1661
;1661:	s_mapselect.accept.generic.flags  = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapselect+3268+72
CNSTU4 260
ASGNU4
line 1662
;1662:	s_mapselect.accept.generic.id = ID_MAPSELECT_OK;
ADDRGP4 s_mapselect+3268+24
CNSTI4 13
ASGNI4
line 1663
;1663:	s_mapselect.accept.generic.callback  = MapSelect_MenuEvent;
ADDRGP4 s_mapselect+3268+76
ADDRGP4 MapSelect_MenuEvent
ASGNP4
line 1664
;1664:	s_mapselect.accept.generic.x	   = 640 - 128 + uis.wideoffset;
ADDRGP4 s_mapselect+3268+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 512
ADDI4
ASGNI4
line 1665
;1665:	s_mapselect.accept.generic.y	   = 480 - 64;
ADDRGP4 s_mapselect+3268+32
CNSTI4 416
ASGNI4
line 1666
;1666:	s_mapselect.accept.width  	   = 128;
ADDRGP4 s_mapselect+3268+104
CNSTI4 128
ASGNI4
line 1667
;1667:	s_mapselect.accept.height  	   = 64;
ADDRGP4 s_mapselect+3268+108
CNSTI4 64
ASGNI4
line 1668
;1668:	s_mapselect.accept.focuspic     = MAPSELECT_ACCEPT1;
ADDRGP4 s_mapselect+3268+88
ADDRGP4 $643
ASGNP4
line 1670
;1669:
;1670:	s_mapselect.maplist.generic.type = MTYPE_SCROLLLIST;
ADDRGP4 s_mapselect+4040
CNSTI4 8
ASGNI4
line 1671
;1671:	s_mapselect.maplist.generic.flags = QMF_PULSEIFFOCUS|QMF_NODEFAULTINIT;
ADDRGP4 s_mapselect+4040+72
CNSTU4 33024
ASGNU4
line 1672
;1672:	s_mapselect.maplist.generic.x = 5 * SMALLCHAR_WIDTH;
ADDRGP4 s_mapselect+4040+28
CNSTI4 5
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 1673
;1673:	s_mapselect.maplist.generic.y = 64;
ADDRGP4 s_mapselect+4040+32
CNSTI4 64
ASGNI4
line 1674
;1674:	s_mapselect.maplist.generic.ownerdraw = MapSelect_ScrollListDraw;
ADDRGP4 s_mapselect+4040+84
ADDRGP4 MapSelect_ScrollListDraw
ASGNP4
line 1675
;1675:	s_mapselect.maplist.columns = MAPLIST_COLUMNS;
ADDRGP4 s_mapselect+4040+120
CNSTI4 3
ASGNI4
line 1676
;1676:	s_mapselect.maplist.seperation = 2;
ADDRGP4 s_mapselect+4040+124
CNSTI4 2
ASGNI4
line 1677
;1677:	s_mapselect.maplist.height = MAPLIST_ROWS;
ADDRGP4 s_mapselect+4040+116
CNSTI4 12
ASGNI4
line 1678
;1678:	s_mapselect.maplist.width = 22;
ADDRGP4 s_mapselect+4040+112
CNSTI4 22
ASGNI4
line 1679
;1679:    MapSelect_ScrollListInit(&s_mapselect.maplist);
ADDRGP4 s_mapselect+4040
ARGP4
ADDRGP4 MapSelect_ScrollListInit
CALLV
pop
line 1682
;1680:
;1681:
;1682:	top = s_mapselect.page * s_mapselect.maxMapsPerPage;
ADDRLP4 24
ADDRGP4 s_mapselect+4300
INDIRI4
ADDRGP4 s_mapselect+4316
INDIRI4
MULI4
ASGNI4
line 1684
;1683:
;1684:	MapSelect_MapCellSize(&colh, &colw);
ADDRLP4 16
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 MapSelect_MapCellSize
CALLV
pop
line 1686
;1685:
;1686:	s_mapselect.bottomrow_y = 64 + 2*colh;
ADDRGP4 s_mapselect+149344
ADDRLP4 16
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 64
ADDI4
ASGNI4
line 1688
;1687:
;1688:	for ( i = 0; i < MAX_GRIDMAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $990
line 1689
;1689:	{
line 1691
;1690:
;1691:		x = colw * (i % MAPGRID_COLUMNS) + (colw - MAPPIC_WIDTH)/2;
ADDRLP4 56
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 56
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
MULI4
ADDRLP4 56
INDIRI4
CNSTI4 138
SUBI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1692
;1692:		y = 64 + (i / MAPGRID_COLUMNS) * colh; // offset by one button
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ADDRLP4 16
INDIRI4
MULI4
CNSTI4 64
ADDI4
ASGNI4
line 1694
;1693:
;1694:		s_mapselect.mappics[i].generic.type  = MTYPE_BITMAP;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180
ADDP4
CNSTI4 6
ASGNI4
line 1695
;1695:		s_mapselect.mappics[i].generic.name  = 0;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+4
ADDP4
CNSTP4 0
ASGNP4
line 1696
;1696:		s_mapselect.mappics[i].generic.flags  = QMF_NODEFAULTINIT;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+72
ADDP4
CNSTU4 32768
ASGNU4
line 1697
;1697:		s_mapselect.mappics[i].generic.ownerdraw = MapSelect_DrawMapPic;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+84
ADDP4
ADDRGP4 MapSelect_DrawMapPic
ASGNP4
line 1698
;1698:		s_mapselect.mappics[i].generic.callback = MapSelect_MapSelectEvent;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+76
ADDP4
ADDRGP4 MapSelect_MapSelectEvent
ASGNP4
line 1699
;1699:		s_mapselect.mappics[i].generic.id	   = i;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1700
;1700:		s_mapselect.mappics[i].generic.x	   = x;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+28
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1701
;1701:		s_mapselect.mappics[i].generic.y	   = y;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+32
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1702
;1702:		s_mapselect.mappics[i].width  	   = MAPPIC_WIDTH;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+104
ADDP4
CNSTI4 138
ASGNI4
line 1703
;1703:		s_mapselect.mappics[i].height  	   = MAPPIC_HEIGHT;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+108
ADDP4
CNSTI4 92
ASGNI4
line 1704
;1704:		s_mapselect.mappics[i].focuspic     = MAPSELECT_MAPSELECTED;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+88
ADDP4
ADDRGP4 $607
ASGNP4
line 1705
;1705:		s_mapselect.mappics[i].errorpic     = MAPSELECT_ERRORPIC;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+92
ADDP4
ADDRGP4 $644
ASGNP4
line 1706
;1706:		s_mapselect.mappics[i].generic.left	   = x - ( colw - MAPPIC_WIDTH )/2;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+44
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 138
SUBI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1707
;1707:		s_mapselect.mappics[i].generic.top	   = y - 8;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+48
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 1708
;1708:		s_mapselect.mappics[i].generic.right	= x + ( colw + MAPPIC_WIDTH )/2;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+52
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 138
ADDI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1709
;1709:		s_mapselect.mappics[i].generic.bottom	= y + colh - 8;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+56
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
CNSTI4 8
SUBI4
ASGNI4
line 1710
;1710:		s_mapselect.mappics[i].focuspic  = MAPSELECT_MAPFOCUS;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180+88
ADDP4
ADDRGP4 $645
ASGNP4
line 1711
;1711:	}
LABELV $991
line 1688
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $990
line 1713
;1712:
;1713:	s_mapselect.multisel.generic.type = MTYPE_RADIOBUTTON;
ADDRGP4 s_mapselect+3848
CNSTI4 5
ASGNI4
line 1714
;1714:	s_mapselect.multisel.generic.x = 128 + 15*SMALLCHAR_WIDTH;
ADDRGP4 s_mapselect+3848+28
CNSTI4 15
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 128
ADDI4
ASGNI4
line 1715
;1715:	s_mapselect.multisel.generic.y = 480 - 3*SMALLCHAR_HEIGHT;
ADDRGP4 s_mapselect+3848+32
CNSTI4 480
CNSTI4 3
ADDRGP4 cl_smallcharheight+12
INDIRI4
MULI4
SUBI4
ASGNI4
line 1716
;1716:	s_mapselect.multisel.generic.id  = ID_MAPSELECT_MULTISEL;
ADDRGP4 s_mapselect+3848+24
CNSTI4 17
ASGNI4
line 1717
;1717:	s_mapselect.multisel.generic.callback  = MapSelect_MenuEvent;
ADDRGP4 s_mapselect+3848+76
ADDRGP4 MapSelect_MenuEvent
ASGNP4
line 1719
;1718:
;1719:	s_mapselect.listview.generic.type = MTYPE_RADIOBUTTON;
ADDRGP4 s_mapselect+3944
CNSTI4 5
ASGNI4
line 1720
;1720:	s_mapselect.listview.generic.x = 128 + 15*SMALLCHAR_WIDTH;
ADDRGP4 s_mapselect+3944+28
CNSTI4 15
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 128
ADDI4
ASGNI4
line 1721
;1721:	s_mapselect.listview.generic.y = 480 - 2*SMALLCHAR_HEIGHT;
ADDRGP4 s_mapselect+3944+32
CNSTI4 480
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 1
LSHI4
SUBI4
ASGNI4
line 1722
;1722:	s_mapselect.listview.generic.id  = ID_MAPSELECT_LISTVIEW;
ADDRGP4 s_mapselect+3944+24
CNSTI4 18
ASGNI4
line 1723
;1723:	s_mapselect.listview.generic.callback  = MapSelect_MenuEvent;
ADDRGP4 s_mapselect+3944+76
ADDRGP4 MapSelect_MenuEvent
ASGNP4
line 1725
;1724:
;1725:	s_mapselect.multisel.curvalue = (int)Com_Clamp(0,1, trap_Cvar_VariableValue("uie_map_multisel"));
ADDRGP4 $136
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_mapselect+3848+88
ADDRLP4 60
INDIRF4
CVFI4 4
ASGNI4
line 1726
;1726:	s_mapselect.listview.curvalue = (int)Com_Clamp(0,1, trap_Cvar_VariableValue("uie_map_list"));
ADDRGP4 $553
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_mapselect+3944+88
ADDRLP4 68
INDIRF4
CVFI4 4
ASGNI4
line 1729
;1727:
;1728:#ifndef NO_UIE_MINILOGO_SKIRMISH
;1729:	s_mapselect.logo.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_mapselect+4172
CNSTI4 6
ASGNI4
line 1730
;1730:	s_mapselect.logo.generic.flags		= QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 s_mapselect+4172+72
CNSTU4 16448
ASGNU4
line 1731
;1731:	s_mapselect.logo.generic.x			= UIE_LOGO_X;
ADDRGP4 s_mapselect+4172+28
CNSTI4 570
ASGNI4
line 1732
;1732:	s_mapselect.logo.generic.y			= UIE_LOGO_Y;
ADDRGP4 s_mapselect+4172+32
CNSTI4 400
ASGNI4
line 1733
;1733:	s_mapselect.logo.width				= 64;
ADDRGP4 s_mapselect+4172+104
CNSTI4 64
ASGNI4
line 1734
;1734:	s_mapselect.logo.height				= 16;
ADDRGP4 s_mapselect+4172+108
CNSTI4 16
ASGNI4
line 1735
;1735:	s_mapselect.logo.focuspic 			= UIE_LOGO_NAME;
ADDRGP4 s_mapselect+4172+88
ADDRGP4 $1066
ASGNP4
line 1736
;1736:	s_mapselect.logo.focuscolor 			= color_translucent;
ADDRGP4 s_mapselect+4172+112
ADDRGP4 color_translucent
ASGNP4
line 1739
;1737:#endif
;1738:
;1739:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1069
line 1740
;1740:	s_mapselect.banner.string        = "MAP SELECT";
ADDRGP4 s_mapselect+1076+88
ADDRGP4 $1074
ASGNP4
line 1741
;1741:	s_mapselect.filter.generic.name = "Filter:";
ADDRGP4 s_mapselect+3584+4
ADDRGP4 $1077
ASGNP4
line 1742
;1742:	s_mapselect.filter.itemnames  = mapfilter_items;
ADDRGP4 s_mapselect+3584+104
ADDRGP4 mapfilter_items
ASGNP4
line 1743
;1743:	s_mapselect.allmaps.generic.name = "All maps:";
ADDRGP4 s_mapselect+3488+4
ADDRGP4 $1082
ASGNP4
line 1744
;1744:	s_mapselect.mapicons.generic.name = "Icons:";
ADDRGP4 s_mapselect+3716+4
ADDRGP4 $1085
ASGNP4
line 1745
;1745:	s_mapselect.maplist.itemnames = s_mapselect.maplist_alias;
ADDRGP4 s_mapselect+4040+104
ADDRGP4 s_mapselect+9792
ASGNP4
line 1746
;1746:	s_mapselect.multisel.generic.name = "Multi-select:";
ADDRGP4 s_mapselect+3848+4
ADDRGP4 $1091
ASGNP4
line 1747
;1747:	s_mapselect.listview.generic.name = "List view:";
ADDRGP4 s_mapselect+3944+4
ADDRGP4 $1094
ASGNP4
line 1748
;1748:	s_mapselect.mapicons.itemnames  = mapicons_items;
ADDRGP4 s_mapselect+3716+104
ADDRGP4 mapicons_items
ASGNP4
line 1749
;1749:	s_mapselect.maptype.string        = (char*)gametype_items[gametype];
ADDRGP4 s_mapselect+3384+88
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_items
ADDP4
INDIRP4
ASGNP4
line 1750
;1750:	}
LABELV $1069
line 1751
;1751:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1099
line 1752
;1752:	s_mapselect.banner.string        = "ВЫБОР КАРТЫ";
ADDRGP4 s_mapselect+1076+88
ADDRGP4 $1104
ASGNP4
line 1753
;1753:	s_mapselect.filter.generic.name = "Фильтр:";
ADDRGP4 s_mapselect+3584+4
ADDRGP4 $1107
ASGNP4
line 1754
;1754:	s_mapselect.filter.itemnames  = mapfilter_itemsru;
ADDRGP4 s_mapselect+3584+104
ADDRGP4 mapfilter_itemsru
ASGNP4
line 1755
;1755:	s_mapselect.allmaps.generic.name = "Все карты:";
ADDRGP4 s_mapselect+3488+4
ADDRGP4 $1112
ASGNP4
line 1756
;1756:	s_mapselect.mapicons.generic.name = "Значки:";
ADDRGP4 s_mapselect+3716+4
ADDRGP4 $1115
ASGNP4
line 1757
;1757:	s_mapselect.maplist.itemnames = s_mapselect.maplist_alias;
ADDRGP4 s_mapselect+4040+104
ADDRGP4 s_mapselect+9792
ASGNP4
line 1758
;1758:	s_mapselect.multisel.generic.name = "Мульти-выбор:";
ADDRGP4 s_mapselect+3848+4
ADDRGP4 $1121
ASGNP4
line 1759
;1759:	s_mapselect.listview.generic.name = "Список:";
ADDRGP4 s_mapselect+3944+4
ADDRGP4 $1124
ASGNP4
line 1760
;1760:	s_mapselect.mapicons.itemnames  = mapicons_itemsru;
ADDRGP4 s_mapselect+3716+104
ADDRGP4 mapicons_itemsru
ASGNP4
line 1761
;1761:	s_mapselect.maptype.string        = (char*)gametype_itemsru[gametype];
ADDRGP4 s_mapselect+3384+88
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_itemsru
ADDP4
INDIRP4
ASGNP4
line 1762
;1762:	}
LABELV $1099
line 1765
;1763:
;1764:	// register for display
;1765:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.banner);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1766
;1766:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.arrows);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+2804
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1767
;1767:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.previous);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+3036
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1768
;1768:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.next);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+2920
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1769
;1769:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.cancel);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+3152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1770
;1770:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.accept);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+3268
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1771
;1771:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.maptype);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+3384
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1772
;1772:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.filter);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+3584
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1773
;1773:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.mapicons);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+3716
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1774
;1774:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.icona);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+2572
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1775
;1775:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.iconb);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+2688
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1776
;1776:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.multisel);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+3848
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1777
;1777:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.listview);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+3944
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1778
;1778:	Menu_AddItem( &s_mapselect.menu, &s_mapselect.maplist);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+4040
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1780
;1779:
;1780:	if (gametype != GT_CTF) {
ADDRFP4 0
INDIRI4
CNSTI4 5
EQI4 $1143
line 1781
;1781:		Menu_AddItem( &s_mapselect.menu, &s_mapselect.allmaps);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+3488
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1782
;1782:	}
LABELV $1143
line 1784
;1783:
;1784:	for (i = 0 ; i < MAX_GRIDMAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1146
line 1785
;1785:	{
line 1786
;1786:		Menu_AddItem( &s_mapselect.menu, &s_mapselect.mappics[i]);
ADDRGP4 s_mapselect
ARGP4
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapselect+1180
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1787
;1787:	}
LABELV $1147
line 1784
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1146
line 1789
;1788:
;1789:	MapSelect_LoadMaps(mapname, qfalse);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 MapSelect_LoadMaps
CALLV
pop
line 1791
;1790:
;1791:	MapSelect_ClearMultiSelect();
ADDRGP4 MapSelect_ClearMultiSelect
CALLV
pop
line 1792
;1792:	MapSelect_AddToMultiSelect(s_mapselect.currentmap);
ADDRGP4 s_mapselect+4304
INDIRI4
ARGI4
ADDRGP4 MapSelect_AddToMultiSelect
CALLV
pop
line 1794
;1793:
;1794:	MapSelect_SetNewMapPage();
ADDRGP4 MapSelect_SetNewMapPage
CALLV
pop
line 1795
;1795:	MapSelect_SetMapTypeIcons();
ADDRGP4 MapSelect_SetMapTypeIcons
CALLV
pop
line 1798
;1796:
;1797:#ifndef NO_UIE_MINILOGO_SKIRMISH
;1798:	if (random() < 0.1)
ADDRLP4 72
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1036831949
GEF4 $1152
line 1799
;1799:		Menu_AddItem( &s_mapselect.menu, &s_mapselect.logo);
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 s_mapselect+4172
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $1152
line 1802
;1800:#endif
;1801:
;1802:	UI_PushMenu( &s_mapselect.menu );
ADDRGP4 s_mapselect
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1803
;1803:}
LABELV $767
endproc MapSelect_MenuInit 76 12
export UI_StartMapMenu
proc UI_StartMapMenu 0 12
line 1814
;1804:
;1805:
;1806:
;1807:
;1808:/*
;1809:=================
;1810:UI_StartMapMenu
;1811:=================
;1812:*/
;1813:void UI_StartMapMenu( int gametype, int index, const char* mapname)
;1814:{
line 1815
;1815:	MapSelect_MenuInit( gametype, index, mapname);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 MapSelect_MenuInit
CALLV
pop
line 1816
;1816:}
LABELV $1155
endproc UI_StartMapMenu 0 12
bss
align 4
LABELV s_mapselect
skip 149480
import StartServer_ItemPage_MenuInit_OldMenu
import StartServer_ItemPage_MenuInit
import StartServer_BothItemMenus_Cache
import StartServer_ServerPage_Cache
import StartServer_ServerPage_Mods
import StartServer_ServerPage_MenuInit
import StartServer_BotPage_Cache
import StartServer_BotPage_MenuInit
import StartServer_MapPage_CopyCustomLimitsToControls
import StartServer_MapPage_Cache
import StartServer_MapPage_MenuInit
import StartServer_SelectionDraw
import StartServer_BackgroundDraw
import StartServer_CommonControls_Init
import StartServer_CheckFightReady
import UI_BotSelect_Index
import fading_red
import pulsecolor
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
LABELV $1124
byte 1 208
byte 1 161
byte 1 208
byte 1 191
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 58
byte 1 0
align 1
LABELV $1121
byte 1 208
byte 1 156
byte 1 209
byte 1 131
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 45
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 58
byte 1 0
align 1
LABELV $1115
byte 1 208
byte 1 151
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 135
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $1112
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $1107
byte 1 208
byte 1 164
byte 1 208
byte 1 184
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 58
byte 1 0
align 1
LABELV $1104
byte 1 208
byte 1 146
byte 1 208
byte 1 171
byte 1 208
byte 1 145
byte 1 208
byte 1 158
byte 1 208
byte 1 160
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
LABELV $1094
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 58
byte 1 0
align 1
LABELV $1091
byte 1 77
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 45
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1085
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1082
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1077
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1074
byte 1 77
byte 1 65
byte 1 80
byte 1 32
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 0
align 1
LABELV $1066
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 0
align 1
LABELV $727
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
byte 1 32
byte 1 208
byte 1 157
byte 1 208
byte 1 149
byte 1 32
byte 1 208
byte 1 157
byte 1 208
byte 1 144
byte 1 208
byte 1 153
byte 1 208
byte 1 148
byte 1 208
byte 1 149
byte 1 208
byte 1 157
byte 1 208
byte 1 171
byte 1 0
align 1
LABELV $723
byte 1 78
byte 1 79
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 83
byte 1 32
byte 1 70
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $645
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
byte 1 109
byte 1 97
byte 1 112
byte 1 102
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $644
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $643
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $642
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $641
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
LABELV $640
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
LABELV $639
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
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $638
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
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $637
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
byte 1 104
byte 1 111
byte 1 114
byte 1 122
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $635
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $607
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $557
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $553
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $279
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
LABELV $274
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $259
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $212
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $195
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $136
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 115
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $99
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $98
byte 1 208
byte 1 161
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $97
byte 1 208
byte 1 146
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $96
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $95
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $94
byte 1 65
byte 1 108
byte 1 108
byte 1 0
