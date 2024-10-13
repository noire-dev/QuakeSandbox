data
align 4
LABELV map_comsprintf
address $94
address $95
align 4
LABELV fragcontrol_text
address $96
address $97
address $98
address $99
align 4
LABELV timelimittype_items
address $100
address $101
address $102
byte 4 0
align 4
LABELV fraglimittype_items
address $100
address $101
address $102
byte 4 0
align 4
LABELV mapSource_items
address $103
address $104
address $105
address $106
byte 4 0
align 4
LABELV copyFrom_items
address $107
address $108
address $109
address $110
address $111
address $112
byte 4 0
align 4
LABELV copyFrom_ctf_items
address $113
address $108
address $114
address $115
address $111
address $112
byte 4 0
align 4
LABELV copyTo_items
address $116
address $117
address $118
byte 4 0
align 4
LABELV fragcontrol_textru
address $119
address $120
address $121
address $122
align 4
LABELV timelimittype_itemsru
address $123
address $124
address $125
byte 4 0
align 4
LABELV fraglimittype_itemsru
address $123
address $124
address $125
byte 4 0
align 4
LABELV mapSource_itemsru
address $126
address $127
address $128
address $129
byte 4 0
align 4
LABELV copyFrom_itemsru
address $130
address $131
address $132
address $133
address $134
address $135
byte 4 0
align 4
LABELV copyFrom_ctf_itemsru
address $136
address $131
address $137
address $138
address $134
address $135
byte 4 0
align 4
LABELV copyTo_itemsru
address $139
address $140
address $141
byte 4 0
code
proc StartServer_MapPage_SetPageText 20 12
file "../../../code/q3_ui/ui_startserver_map.c"
line 264
;1:/*
;2:=============================================================================
;3:
;4:START SERVER MAP SELECT MENU *****
;5:
;6:=============================================================================
;7:*/
;8:
;9:
;10:#include "ui_local.h"
;11:#include "ui_startserver_q3.h"
;12:
;13:
;14:
;15:#define ID_MAP_GAMETYPE 200
;16:#define ID_MAP_TIMELIMIT 201
;17:#define ID_MAP_FRAGLIMIT 202
;18:#define ID_MAP_MAPSOURCE 203
;19:#define ID_MAP_UP 204
;20:#define ID_MAP_DOWN 205
;21:#define ID_MAP_DEL 206
;22:#define ID_MAP_SHORTNAME 207
;23:#define ID_MAP_MAPREPEAT 208
;24:#define ID_MAP_SOURCECOUNT 209
;25:#define ID_MAP_FRAGCOUNT 210
;26:#define ID_MAP_TIMECOUNT 211
;27:#define ID_MAP_PAGENUM 212
;28:#define ID_MAP_CAPTURELIMIT 213
;29:#define ID_MAP_CAPTURECOUNT 214
;30:#define ID_MAP_ACTION 215
;31:#define ID_MAP_SOURCETYPE 216
;32:#define ID_MAP_ACTIONTYPE 217
;33:
;34:// screen positions
;35:#define MAPCOLUMN_LEFTX 	COLUMN_LEFT - uis.wideoffset
;36:#define MAPCOLUMN_RIGHTX 	COLUMN_RIGHT + uis.wideoffset
;37:#define MAPBUTTONS_X 		(SMALLCHAR_WIDTH ) - uis.wideoffset
;38:#define MAPARRAYCOLUMN_X 	(SMALLCHAR_WIDTH * 13) - uis.wideoffset
;39:#define MAPLONGNAME_DX 		(SMALLCHAR_WIDTH * (SHORTMAP_BUFFER + 1))
;40:#define MAPFRAGS_DX 		(MAPLONGNAME_DX + SMALLCHAR_WIDTH * (LONGMAP_BUFFER + 4))
;41:#define MAPTIME_DX 			(MAPFRAGS_DX + SMALLCHAR_WIDTH * 8)
;42:#define MAPACTIVATE_X 		392
;43:
;44:#define GAMESERVER_ARROWWIDTH 64
;45:#define GAMESERVER_ARROWHEIGHT 64
;46:
;47:#define MAP_NUMBER_FIELD 3
;48:
;49:#define ACTIONTYPE_DELETE "Delete all"
;50:#define ACTIONTYPE_COPY " Copy from"
;51:#define ACTIONTYPE_DELETERU "Удалить все"
;52:#define ACTIONTYPE_COPYRU " Скопировать из"
;53:
;54:
;55:
;56://
;57:// controls 
;58://
;59:
;60:typedef struct mapcontrols_s {
;61:	menuframework_s menu;
;62:	commoncontrols_t common;
;63:
;64:	menulist_s gameType;
;65:	menubitmap_s gameTypeIcon;
;66:
;67:	menubitmap_s displaySelected[NUMMAPS_PERPAGE];
;68:	menutext_s displayMapName[NUMMAPS_PERPAGE];
;69:
;70:	menufield_s displayFragLimit[NUMMAPS_PERPAGE];
;71:	menufield_s displayTimeLimit[NUMMAPS_PERPAGE];
;72:
;73:	menulist_s timeLimitType;
;74:	menulist_s fragLimitType;
;75:	menufield_s timeLimit;
;76:	menufield_s fragLimit;
;77:	menulist_s mapSource;
;78:	menufield_s mapSourceCount;
;79:	menulist_s mapSourceType;
;80:	menuradiobutton_s mapRepeat;
;81:	menutext_s mapPage;
;82:
;83:	menutext_s mapText;
;84:	menutext_s nameText;
;85:	menutext_s fragsText;
;86:	menutext_s timeText;
;87:
;88:	menubitmap_s arrows;
;89:	menubitmap_s up;
;90:	menubitmap_s down;
;91:	menubitmap_s del;
;92:
;93:	menulist_s actionSrc;
;94:	menulist_s actionDest;
;95:	menubitmap_s actionActivate;
;96:
;97:#ifndef NO_UIE_MINILOGO_SKIRMISH
;98:	menubitmap_s logo;
;99:#endif
;100:
;101:	// local data implementing interface
;102:	int statusbar_height;
;103:	char statusbar_text[MAX_STATUSBAR_TEXT];
;104:	mappic_t mappic;
;105:	int fadetime;
;106:
;107:	int map_page;
;108:	int map_selected;	// -1 = none, or index to current page
;109:
;110:	char mappage_text[MAPPAGE_TEXT];
;111:} mapcontrols_t;
;112:
;113:
;114:static mapcontrols_t s_mapcontrols;
;115:
;116:
;117://
;118:// static data used by controls
;119://
;120:
;121:
;122:static const char *map_comsprintf[] = {
;123:	"%i: %s",
;124:	" %i: %s"
;125:};
;126:
;127:
;128:
;129:static const char* fragcontrol_text[] = {
;130:	"Frag Limit:", "Frags",
;131:	"Capture Limit:", "Caps"
;132:};
;133:
;134:
;135:static const char* timelimittype_items[MAP_LT_COUNT + 1] = {
;136:	"Default",	// MAP_LT_DEFAULT
;137:	"None",	// MAP_LT_NONE
;138:	"Custom",	// MAP_LT_CUSTOM
;139:	0
;140:};
;141:
;142:
;143:static const char* fraglimittype_items[MAP_LT_COUNT + 1] = {
;144:	"Default",	// MAP_LT_DEFAULT
;145:	"None",	// MAP_LT_NONE
;146:	"Custom",	// MAP_LT_CUSTOM
;147:	0
;148:};
;149:
;150:
;151:
;152:static const char* mapSource_items[MAP_MS_MAX + 1]={
;153:	"List, in order",	// MAP_MS_ORDER
;154:	"List, random",	// MAP_MS_RANDOMLIST
;155:	"Randomly chosen",	// MAP_MS_RANDOM
;156:	"Random, not list",	// MAP_MS_RANDOMEXCLUDE
;157:	0
;158:};
;159:
;160:
;161:static const char* copyFrom_items[MAP_CF_COUNT + 1] = {
;162:	"arena frag limit",	// MAP_CF_ARENASCRIPT
;163:	"time limit",	// MAP_CF_TIME
;164:	"frag limit",	// MAP_CF_FRAG
;165:	"frag and time limit",	// MAP_CF_BOTH
;166:	"maps from list",	// MAP_CF_CLEARALL
;167:	"maps on this page",	// MAP_CF_CLEARPAGE
;168:	0
;169:};
;170:
;171:
;172:static const char* copyFrom_ctf_items[MAP_CF_COUNT + 1] = {
;173:	"<<never shown>>",	// MAP_CF_ARENASCRIPT
;174:	"time limit",	// MAP_CF_TIME
;175:	"caps limit",	// MAP_CF_FRAG
;176:	"frag and caps limits",	// MAP_CF_BOTH
;177:	"maps from list",	// MAP_CF_CLEARALL
;178:	"maps on this page",	// MAP_CF_CLEARPAGE
;179:	0
;180:};
;181:
;182:
;183:
;184:static const char* copyTo_items[MAP_CT_COUNT + 1] = {
;185:	"selected map",	// MAP_CT_SELECTED
;186:	"all maps on page",	// MAP_CT_PAGE
;187:	"all maps",	// MAP_CT_ALL
;188:	0
;189:};
;190:
;191:
;192:static const char* fragcontrol_textru[] = {
;193:	"Лимит Фрагов:", "Фраги",
;194:	"Лимит Захватов:", "Захваты"
;195:};
;196:
;197:
;198:static const char* timelimittype_itemsru[MAP_LT_COUNT + 1] = {
;199:	"Стандарт",	// MAP_LT_DEFAULT
;200:	"Нет",	// MAP_LT_NONE
;201:	"Настр",	// MAP_LT_CUSTOM
;202:	0
;203:};
;204:
;205:
;206:static const char* fraglimittype_itemsru[MAP_LT_COUNT + 1] = {
;207:	"Стандарт",	// MAP_LT_DEFAULT
;208:	"Нет",	// MAP_LT_NONE
;209:	"Настр",	// MAP_LT_CUSTOM
;210:	0
;211:};
;212:
;213:
;214:
;215:static const char* mapSource_itemsru[MAP_MS_MAX + 1]={
;216:	"Список, по порядку",	// MAP_MS_ORDER
;217:	"Список, случайный",	// MAP_MS_RANDOMLIST
;218:	"Случайно выбрано",	// MAP_MS_RANDOM
;219:	"Случайно, не список",	// MAP_MS_RANDOMEXCLUDE
;220:	0
;221:};
;222:
;223:
;224:static const char* copyFrom_itemsru[MAP_CF_COUNT + 1] = {
;225:	"лимит фрагов из скрипта",	// MAP_CF_ARENASCRIPT
;226:	"лимит времени",	// MAP_CF_TIME
;227:	"лимит фрагов",	// MAP_CF_FRAG
;228:	"лимит времени и фрагов",	// MAP_CF_BOTH
;229:	"карты из списка",	// MAP_CF_CLEARALL
;230:	"карты на этой странице",	// MAP_CF_CLEARPAGE
;231:	0
;232:};
;233:
;234:
;235:static const char* copyFrom_ctf_itemsru[MAP_CF_COUNT + 1] = {
;236:	"<<не показывать>>",	// MAP_CF_ARENASCRIPT
;237:	"лимит времени",	// MAP_CF_TIME
;238:	"лимит захватов",	// MAP_CF_FRAG
;239:	"лимит времени и захватов",	// MAP_CF_BOTH
;240:	"карты из списка",	// MAP_CF_CLEARALL
;241:	"карты на этой странице",	// MAP_CF_CLEARPAGE
;242:	0
;243:};
;244:
;245:
;246:
;247:static const char* copyTo_itemsru[MAP_CT_COUNT + 1] = {
;248:	"выбранная карта",	// MAP_CT_SELECTED
;249:	"все карты на странице",	// MAP_CT_PAGE
;250:	"все карты",	// MAP_CT_ALL
;251:	0
;252:};
;253:
;254:
;255:
;256:
;257:
;258:/*
;259:=================
;260:StartServer_MapPage_SetPageText
;261:=================
;262:*/
;263:static void StartServer_MapPage_SetPageText(void)
;264:{
line 268
;265:	int pagecount;
;266:	int pagenum;
;267:	char* s;
;268:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $143
line 269
;269:	s = "[Page %i of %i]";
ADDRLP4 8
ADDRGP4 $146
ASGNP4
line 270
;270:}
LABELV $143
line 271
;271:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $147
line 272
;272:	s = "[Страница %i из %i]";
ADDRLP4 8
ADDRGP4 $150
ASGNP4
line 273
;273:}
LABELV $147
line 274
;274:	pagecount = StartServer_MapPageCount();
ADDRLP4 12
ADDRGP4 StartServer_MapPageCount
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 276
;275:
;276:	if (s_mapcontrols.map_page > pagecount - 1)
ADDRGP4 s_mapcontrols+13716
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
LEI4 $151
line 277
;277:		s_mapcontrols.map_page = pagecount - 1;
ADDRGP4 s_mapcontrols+13716
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $151
line 279
;278:
;279:	if (pagecount == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $155
line 280
;280:		s_mapcontrols.mapPage.generic.flags |= (QMF_INACTIVE | QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 s_mapcontrols+11956+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 281
;281:		pagenum = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 282
;282:	}
ADDRGP4 $156
JUMPV
LABELV $155
line 284
;283:	else
;284:	{
line 287
;285:		// page text is all the same length (all digits less than 10)
;286:		// so leave generic.left etc. alone
;287:		s_mapcontrols.mapPage.generic.flags &= ~(QMF_INACTIVE | QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 s_mapcontrols+11956+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 288
;288:		pagenum = s_mapcontrols.map_page + 1;
ADDRLP4 4
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 289
;289:	}
LABELV $156
line 291
;290:
;291:	Q_strncpyz(s_mapcontrols.mappage_text, va(s, pagenum, pagecount), MAPPAGE_TEXT);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_mapcontrols+13724
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 292
;292:}
LABELV $142
endproc StartServer_MapPage_SetPageText 20 12
export StartServer_MapPage_CopyCustomLimitsToControls
proc StartServer_MapPage_CopyCustomLimitsToControls 12 12
line 303
;293:
;294:
;295:
;296:
;297:/*
;298:=================
;299:StartServer_MapPage_CopyCustomLimitsToControls
;300:=================
;301:*/
;302:void StartServer_MapPage_CopyCustomLimitsToControls(void)
;303:{
line 306
;304:	int i, base;
;305:
;306:	base = s_mapcontrols.map_page * NUMMAPS_PERPAGE;
ADDRLP4 4
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 307
;307:	for (i = 0; i < NUMMAPS_PERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $165
line 308
;308:	{
line 309
;309:		memcpy(s_mapcontrols.displayFragLimit[i].field.buffer,
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+88+12
ADDP4
ARGP4
CNSTI4 56
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
MULI4
ADDRGP4 s_scriptdata+8+4+48
ADDP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 311
;310:			s_scriptdata.map.data[base + i].fragLimit, MAX_LIMIT_BUF);
;311:	}
LABELV $166
line 307
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $165
line 312
;312:	for (i = 0; i < NUMMAPS_PERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $175
line 313
;313:	{
line 314
;314:		memcpy(s_mapcontrols.displayTimeLimit[i].field.buffer,
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+88+12
ADDP4
ARGP4
CNSTI4 56
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
MULI4
ADDRGP4 s_scriptdata+8+4+52
ADDP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 316
;315:			s_scriptdata.map.data[base + i].timeLimit, MAX_LIMIT_BUF);
;316:	}
LABELV $176
line 312
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $175
line 317
;317:}
LABELV $163
endproc StartServer_MapPage_CopyCustomLimitsToControls 12 12
proc StartServer_MapPage_UpdateActionControls 24 4
line 328
;318:
;319:
;320:
;321:
;322:/*
;323:=================
;324:StartServer_MapPage_UpdateActionControls
;325:=================
;326:*/
;327:static void StartServer_MapPage_UpdateActionControls( void )
;328:{
line 332
;329:	int curvalue;
;330:	qboolean del;
;331:
;332:	curvalue = s_mapcontrols.actionSrc.curvalue;
ADDRLP4 0
ADDRGP4 s_mapcontrols+12940+92
INDIRI4
ASGNI4
line 335
;333:
;334:	// prevent TEAM games from seeing arena script setting
;335:	if (s_scriptdata.gametype >= GT_TEAM && curvalue == MAP_CF_ARENASCRIPT) {
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 4
LTI4 $188
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $188
line 336
;336:		curvalue = MAP_CF_TIME;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 337
;337:		s_mapcontrols.actionSrc.curvalue = curvalue;
ADDRGP4 s_mapcontrols+12940+92
ADDRLP4 0
INDIRI4
ASGNI4
line 338
;338:	}
LABELV $188
line 340
;339:
;340:	if (curvalue == MAP_CF_CLEARALL || curvalue == MAP_CF_CLEARPAGE)
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $194
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $192
LABELV $194
line 341
;341:		del = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $193
JUMPV
LABELV $192
line 343
;342:	else
;343:		del = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $193
line 346
;344:
;345:	// prevent irrelevant options appearing in random map generation
;346:	if (StartServer_IsRandomGeneratedMapList(s_scriptdata.map.listSource) && !del)
ADDRGP4 s_scriptdata+8+1796
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 StartServer_IsRandomGeneratedMapList
CALLI4
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $195
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $195
line 347
;347:	{
line 348
;348:		curvalue = MAP_CF_CLEARALL;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 349
;349:		s_mapcontrols.actionSrc.curvalue = curvalue;
ADDRGP4 s_mapcontrols+12940+92
ADDRLP4 0
INDIRI4
ASGNI4
line 350
;350:		del = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 351
;351:	}
LABELV $195
line 353
;352:
;353:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $201
line 354
;354:	if (del)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $204
line 355
;355:	{
line 356
;356:		s_mapcontrols.actionSrc.generic.name = ACTIONTYPE_DELETE;
ADDRGP4 s_mapcontrols+12940+4
ADDRGP4 $208
ASGNP4
line 357
;357:		s_mapcontrols.actionDest.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 20
ADDRGP4 s_mapcontrols+13072+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 358
;358:	}
ADDRGP4 $205
JUMPV
LABELV $204
line 360
;359:	else
;360:	{
line 361
;361:		s_mapcontrols.actionSrc.generic.name = ACTIONTYPE_COPY;
ADDRGP4 s_mapcontrols+12940+4
ADDRGP4 $213
ASGNP4
line 362
;362:		s_mapcontrols.actionDest.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 20
ADDRGP4 s_mapcontrols+13072+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 363
;363:	}
LABELV $205
line 364
;364:}
LABELV $201
line 365
;365:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $216
line 366
;366:	if (del)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $219
line 367
;367:	{
line 368
;368:		s_mapcontrols.actionSrc.generic.name = ACTIONTYPE_DELETERU;
ADDRGP4 s_mapcontrols+12940+4
ADDRGP4 $223
ASGNP4
line 369
;369:		s_mapcontrols.actionDest.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 20
ADDRGP4 s_mapcontrols+13072+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 370
;370:	}
ADDRGP4 $220
JUMPV
LABELV $219
line 372
;371:	else
;372:	{
line 373
;373:		s_mapcontrols.actionSrc.generic.name = ACTIONTYPE_COPYRU;
ADDRGP4 s_mapcontrols+12940+4
ADDRGP4 $228
ASGNP4
line 374
;374:		s_mapcontrols.actionDest.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 20
ADDRGP4 s_mapcontrols+13072+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 375
;375:	}
LABELV $220
line 376
;376:}
LABELV $216
line 377
;377:}
LABELV $185
endproc StartServer_MapPage_UpdateActionControls 24 4
proc StartServer_MapPage_SetSelectedControl 24 0
line 388
;378:
;379:
;380:
;381:
;382:/*
;383:=================
;384:StartServer_MapPage_SetSelectedControl
;385:=================
;386:*/
;387:static void StartServer_MapPage_SetSelectedControl( int index )
;388:{
line 389
;389:	if (s_mapcontrols.map_selected != -1) {
ADDRGP4 s_mapcontrols+13720
INDIRI4
CNSTI4 -1
EQI4 $232
line 390
;390:		s_mapcontrols.displaySelected[ s_mapcontrols.map_selected ].generic.flags &= ~(QMF_HIGHLIGHT);
ADDRLP4 0
CNSTI4 116
ADDRGP4 s_mapcontrols+13720
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+72
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTI4 -65
CVIU4 4
BANDU4
ASGNU4
line 391
;391:	}
LABELV $232
line 393
;392:
;393:	if (index == -1 || index == s_mapcontrols.map_selected ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -1
EQI4 $241
ADDRLP4 0
INDIRI4
ADDRGP4 s_mapcontrols+13720
INDIRI4
NEI4 $238
LABELV $241
line 395
;394:		// none selected
;395:		s_mapcontrols.up.generic.flags |= (QMF_INACTIVE|QMF_GRAYED);
ADDRLP4 4
ADDRGP4 s_mapcontrols+12592+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
line 396
;396:		s_mapcontrols.down.generic.flags |= (QMF_INACTIVE|QMF_GRAYED);
ADDRLP4 8
ADDRGP4 s_mapcontrols+12708+72
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
line 397
;397:		s_mapcontrols.arrows.generic.flags |= QMF_GRAYED;
ADDRLP4 12
ADDRGP4 s_mapcontrols+12476+72
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 398
;398:		s_mapcontrols.del.generic.flags |= (QMF_INACTIVE|QMF_GRAYED);
ADDRLP4 16
ADDRGP4 s_mapcontrols+12824+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
line 399
;399:		index = -1;
ADDRFP4 0
CNSTI4 -1
ASGNI4
line 400
;400:	} else {
ADDRGP4 $239
JUMPV
LABELV $238
line 401
;401:		s_mapcontrols.displaySelected[ index ].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 4
CNSTI4 116
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+72
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 402
;402:		s_mapcontrols.up.generic.flags &= ~(QMF_INACTIVE|QMF_GRAYED);
ADDRLP4 8
ADDRGP4 s_mapcontrols+12592+72
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTI4 -24577
CVIU4 4
BANDU4
ASGNU4
line 403
;403:		s_mapcontrols.down.generic.flags &= ~(QMF_INACTIVE|QMF_GRAYED);
ADDRLP4 12
ADDRGP4 s_mapcontrols+12708+72
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTI4 -24577
CVIU4 4
BANDU4
ASGNU4
line 404
;404:		s_mapcontrols.arrows.generic.flags &= ~QMF_GRAYED;
ADDRLP4 16
ADDRGP4 s_mapcontrols+12476+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 405
;405:		s_mapcontrols.del.generic.flags &= ~(QMF_INACTIVE|QMF_GRAYED);
ADDRLP4 20
ADDRGP4 s_mapcontrols+12824+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -24577
CVIU4 4
BANDU4
ASGNU4
line 406
;406:	}
LABELV $239
line 408
;407:
;408:	s_mapcontrols.map_selected = index;
ADDRGP4 s_mapcontrols+13720
ADDRFP4 0
INDIRI4
ASGNI4
line 409
;409:}
LABELV $231
endproc StartServer_MapPage_SetSelectedControl 24 0
proc StartServer_MapPage_UpdateInterface 92 12
line 420
;410:
;411:
;412:
;413:
;414:/*
;415:=================
;416:StartServer_MapPage_UpdateInterface
;417:=================
;418:*/
;419:static void StartServer_MapPage_UpdateInterface(void)
;420:{
line 434
;421:	int i, value, mapcount;
;422:	int adjust, mappages;
;423:	int remap;
;424:	qboolean hide;
;425:
;426:	// handle appearance/disappearance of controls
;427:	// based on page values
;428:
;429:	//
;430:	// mapPage
;431:	//
;432:
;433:	// update icon
;434:	StartServer_SetIconFromGameType(&s_mapcontrols.gameTypeIcon, s_scriptdata.gametype, qfalse);
ADDRGP4 s_mapcontrols+2540
ARGP4
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_SetIconFromGameType
CALLV
pop
line 437
;435:
;436:	// updates map_page to accurate value
;437:	StartServer_MapPage_SetPageText();
ADDRGP4 StartServer_MapPage_SetPageText
CALLV
pop
line 443
;438:
;439:
;440:	// offset by one so we display an empty map field if needed
;441:	// an empty field can have no custom time and frag fields, so
;442:	// we'll then adjust back by one
;443:	mapcount = 1 + s_scriptdata.map.num_maps - (s_mapcontrols.map_page * NUMMAPS_PERPAGE);
ADDRLP4 4
ADDRGP4 s_scriptdata+8
INDIRI4
CNSTI4 1
ADDI4
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 3
LSHI4
SUBI4
ASGNI4
line 444
;444:	adjust = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 445
;445:	if (mapcount > NUMMAPS_PERPAGE)
ADDRLP4 4
INDIRI4
CNSTI4 8
LEI4 $265
line 446
;446:	{
line 447
;447:		mapcount = NUMMAPS_PERPAGE;
ADDRLP4 4
CNSTI4 8
ASGNI4
line 448
;448:		adjust = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 449
;449:	}
LABELV $265
line 454
;450:
;451:	//
;452:	// map short and long name
;453:	//
;454:	for (i = 0; i < mapcount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $270
JUMPV
LABELV $267
line 455
;455:		s_mapcontrols.displayMapName[i].generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 28
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+72
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
LABELV $268
line 454
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $270
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $267
line 457
;456:
;457:	for ( ; i < NUMMAPS_PERPAGE; i++)
ADDRGP4 $276
JUMPV
LABELV $273
line 458
;458:		s_mapcontrols.displayMapName[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 32
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+72
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
LABELV $274
line 457
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $276
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $273
line 460
;459:
;460:	mapcount -= adjust;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ASGNI4
line 465
;461:
;462:	//
;463:	// map time limit
;464:	//
;465:	value = s_mapcontrols.timeLimitType.curvalue;
ADDRLP4 8
ADDRGP4 s_mapcontrols+10240+92
INDIRI4
ASGNI4
line 466
;466:	if (value == MAP_LT_NONE || value == MAP_LT_CUSTOM) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $283
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $281
LABELV $283
line 467
;467:		s_mapcontrols.timeLimit.generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 40
ADDRGP4 s_mapcontrols+10504+72
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 468
;468:	}
ADDRGP4 $282
JUMPV
LABELV $281
line 469
;469:	else {
line 470
;470:		s_mapcontrols.timeLimit.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 40
ADDRGP4 s_mapcontrols+10504+72
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
line 471
;471:	}
LABELV $282
line 473
;472:
;473:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 474
;474:	hide = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 475
;475:	if (value == MAP_LT_NONE || value == MAP_LT_DEFAULT)
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $290
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $288
LABELV $290
line 476
;476:		hide = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $288
line 478
;477:
;478:	if (StartServer_IsRandomGeneratedMapList(s_scriptdata.map.listSource))
ADDRGP4 s_scriptdata+8+1796
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 StartServer_IsRandomGeneratedMapList
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $291
line 479
;479:		hide = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $291
line 481
;480:
;481:	if (hide)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $295
line 482
;482:	{
line 484
;483:		// hide custom column
;484:		s_mapcontrols.timeText.generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 48
ADDRGP4 s_mapcontrols+12372+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 485
;485:		for ( ; i < mapcount; i++)
ADDRGP4 $302
JUMPV
LABELV $299
line 486
;486:			s_mapcontrols.displayTimeLimit[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 52
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+72
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
LABELV $300
line 485
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $302
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $299
line 487
;487:	}
ADDRGP4 $316
JUMPV
LABELV $295
line 489
;488:	else
;489:	{
line 491
;490:		// show custom column
;491:		s_mapcontrols.timeText.generic.flags &= ~QMF_HIDDEN;
ADDRLP4 48
ADDRGP4 s_mapcontrols+12372+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTI4 -4097
CVIU4 4
BANDU4
ASGNU4
line 492
;492:		for ( ; i < mapcount; i++)
ADDRGP4 $310
JUMPV
LABELV $307
line 493
;493:			s_mapcontrols.displayTimeLimit[i].generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 52
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+72
ADDP4
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
LABELV $308
line 492
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $310
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $307
line 494
;494:	}
line 497
;495:
;496:	// hide the rest
;497:	for ( ; i < NUMMAPS_PERPAGE; i++)
ADDRGP4 $316
JUMPV
LABELV $313
line 498
;498:		s_mapcontrols.displayTimeLimit[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 48
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+72
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
LABELV $314
line 497
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $316
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $313
line 503
;499:
;500:	//
;501:	// map frag limit
;502:	//
;503:	value = s_mapcontrols.fragLimitType.curvalue;
ADDRLP4 8
ADDRGP4 s_mapcontrols+10372+92
INDIRI4
ASGNI4
line 504
;504:	if (value == MAP_LT_NONE || value == MAP_LT_CUSTOM) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $323
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $321
LABELV $323
line 505
;505:		s_mapcontrols.fragLimit.generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 56
ADDRGP4 s_mapcontrols+10868+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 506
;506:	}
ADDRGP4 $322
JUMPV
LABELV $321
line 507
;507:	else {
line 508
;508:		s_mapcontrols.fragLimit.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 56
ADDRGP4 s_mapcontrols+10868+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 509
;509:	}
LABELV $322
line 511
;510:
;511:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 512
;512:	hide = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 513
;513:	if (value == MAP_LT_NONE || value == MAP_LT_DEFAULT)
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $330
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $328
LABELV $330
line 514
;514:		hide = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $328
line 516
;515:
;516:	if (StartServer_IsRandomGeneratedMapList(s_scriptdata.map.listSource))
ADDRGP4 s_scriptdata+8+1796
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 StartServer_IsRandomGeneratedMapList
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $331
line 517
;517:		hide = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $331
line 519
;518:
;519:	if (hide) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $335
line 521
;520:		// hide custom column
;521:		s_mapcontrols.fragsText.generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 64
ADDRGP4 s_mapcontrols+12268+72
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 522
;522:		for ( ; i < mapcount; i++)
ADDRGP4 $342
JUMPV
LABELV $339
line 523
;523:			s_mapcontrols.displayFragLimit[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 68
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+72
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
LABELV $340
line 522
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $342
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $339
line 524
;524:	}
ADDRGP4 $356
JUMPV
LABELV $335
line 525
;525:	else {
line 527
;526:		// show custom column
;527:		s_mapcontrols.fragsText.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 64
ADDRGP4 s_mapcontrols+12268+72
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 528
;528:		for ( ; i < mapcount; i++)
ADDRGP4 $350
JUMPV
LABELV $347
line 529
;529:			s_mapcontrols.displayFragLimit[i].generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 68
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+72
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
LABELV $348
line 528
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $350
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $347
line 530
;530:	}
line 533
;531:
;532:	// hide the rest
;533:	for ( ; i < NUMMAPS_PERPAGE; i++)
ADDRGP4 $356
JUMPV
LABELV $353
line 534
;534:		s_mapcontrols.displayFragLimit[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 64
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+72
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
LABELV $354
line 533
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $356
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $353
line 539
;535:
;536:	//
;537:	// displaySelected
;538:	//
;539:	for ( i = 0; i < mapcount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $362
JUMPV
LABELV $359
line 540
;540:		s_mapcontrols.displaySelected[i].generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 68
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+72
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
LABELV $360
line 539
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $362
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $359
line 542
;541:
;542:	for ( ; i < NUMMAPS_PERPAGE; i++)
ADDRGP4 $368
JUMPV
LABELV $365
line 543
;543:		s_mapcontrols.displaySelected[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 72
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+72
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
LABELV $366
line 542
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $368
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $365
line 549
;544:
;545:
;546:	//
;547:	// mapSource and map manipulation controls
;548:	//
;549:	if (s_scriptdata.map.listSource == MAP_MS_RANDOM)
ADDRGP4 s_scriptdata+8+1796
INDIRI4
CNSTI4 2
NEI4 $371
line 550
;550:	{
line 551
;551:		for (i = 0; i < NUMMAPS_PERPAGE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $375
line 552
;552:			s_mapcontrols.displayMapName[i].generic.flags |= QMF_GRAYED;
ADDRLP4 76
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+72
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 553
;553:			s_mapcontrols.displaySelected[i].generic.flags |= QMF_GRAYED;
ADDRLP4 80
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+72
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 554
;554:		}
LABELV $376
line 551
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $375
line 555
;555:		s_mapcontrols.mapPage.generic.flags |= QMF_GRAYED;
ADDRLP4 76
ADDRGP4 s_mapcontrols+11956+72
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 556
;556:	}
ADDRGP4 $372
JUMPV
LABELV $371
line 558
;557:	else
;558:	{
line 559
;559:		for (i = 0; i < NUMMAPS_PERPAGE; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $385
line 560
;560:			s_mapcontrols.displayMapName[i].generic.flags &= ~QMF_GRAYED;
ADDRLP4 76
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+72
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 561
;561:			s_mapcontrols.displaySelected[i].generic.flags &= ~QMF_GRAYED;
ADDRLP4 80
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+72
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 562
;562:		}
LABELV $386
line 559
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $385
line 564
;563:
;564:		s_mapcontrols.mapPage.generic.flags &= ~QMF_GRAYED;
ADDRLP4 76
ADDRGP4 s_mapcontrols+11956+72
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 565
;565:	}
LABELV $372
line 567
;566:
;567:	StartServer_MapPage_UpdateActionControls();
ADDRGP4 StartServer_MapPage_UpdateActionControls
CALLV
pop
line 569
;568:
;569:	if (StartServer_IsRandomGeneratedMapList(s_scriptdata.map.listSource))
ADDRGP4 s_scriptdata+8+1796
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 StartServer_IsRandomGeneratedMapList
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $395
line 570
;570:	{
line 571
;571:		s_mapcontrols.mapSourceCount.generic.flags &= ~QMF_GRAYED;
ADDRLP4 80
ADDRGP4 s_mapcontrols+11364+72
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 572
;572:		s_mapcontrols.mapSourceType.generic.flags &= ~QMF_GRAYED;
ADDRLP4 84
ADDRGP4 s_mapcontrols+11728+72
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 575
;573:
;574:		// clear highlight
;575:		StartServer_MapPage_SetSelectedControl(-1);
CNSTI4 -1
ARGI4
ADDRGP4 StartServer_MapPage_SetSelectedControl
CALLV
pop
line 576
;576:	}
ADDRGP4 $396
JUMPV
LABELV $395
line 577
;577:	else {
line 578
;578:		s_mapcontrols.mapSourceCount.generic.flags |= QMF_GRAYED;
ADDRLP4 80
ADDRGP4 s_mapcontrols+11364+72
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 579
;579:		s_mapcontrols.mapSourceType.generic.flags |= QMF_GRAYED;
ADDRLP4 84
ADDRGP4 s_mapcontrols+11728+72
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 580
;580:	}
LABELV $396
line 582
;581:
;582:	if (s_scriptdata.map.listSource == MAP_MS_RANDOM)
ADDRGP4 s_scriptdata+8+1796
INDIRI4
CNSTI4 2
NEI4 $407
line 583
;583:	{
line 584
;584:		s_mapcontrols.actionActivate.generic.flags |= QMF_GRAYED;
ADDRLP4 80
ADDRGP4 s_mapcontrols+13204+72
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 585
;585:		s_mapcontrols.actionSrc.generic.flags |= QMF_GRAYED;
ADDRLP4 84
ADDRGP4 s_mapcontrols+12940+72
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 586
;586:		s_mapcontrols.actionDest.generic.flags |= QMF_GRAYED;
ADDRLP4 88
ADDRGP4 s_mapcontrols+13072+72
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 587
;587:	}
ADDRGP4 $408
JUMPV
LABELV $407
line 589
;588:	else
;589:	{
line 590
;590:		s_mapcontrols.actionActivate.generic.flags &= ~QMF_GRAYED;
ADDRLP4 80
ADDRGP4 s_mapcontrols+13204+72
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 591
;591:		s_mapcontrols.actionSrc.generic.flags &= ~QMF_GRAYED;
ADDRLP4 84
ADDRGP4 s_mapcontrols+12940+72
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 592
;592:		s_mapcontrols.actionDest.generic.flags &= ~QMF_GRAYED;
ADDRLP4 88
ADDRGP4 s_mapcontrols+13072+72
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 593
;593:	}
LABELV $408
line 596
;594:
;595:	// enable fight button if possible
;596:	StartServer_CheckFightReady(&s_mapcontrols.common);
ADDRGP4 s_mapcontrols+1076
ARGP4
ADDRGP4 StartServer_CheckFightReady
CALLI4
pop
line 597
;597:}
LABELV $261
endproc StartServer_MapPage_UpdateInterface 92 12
export StartServer_MapPage_Cache
proc StartServer_MapPage_Cache 0 4
line 612
;598:
;599:
;600:
;601:
;602:
;603:
;604:
;605:
;606:/*
;607:=================
;608:StartServer_MapPage_Cache
;609:=================
;610:*/
;611:void StartServer_MapPage_Cache( void )
;612:{
line 613
;613:	trap_R_RegisterShaderNoMip( GAMESERVER_VARROWS );
ADDRGP4 $425
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 614
;614:	trap_R_RegisterShaderNoMip( GAMESERVER_UP );
ADDRGP4 $426
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 615
;615:	trap_R_RegisterShaderNoMip( GAMESERVER_DOWN );
ADDRGP4 $427
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 616
;616:	trap_R_RegisterShaderNoMip( GAMESERVER_DEL0 );
ADDRGP4 $428
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 617
;617:	trap_R_RegisterShaderNoMip( GAMESERVER_DEL1 );
ADDRGP4 $429
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 618
;618:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECTED0 );
ADDRGP4 $430
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 619
;619:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECTED1 );
ADDRGP4 $431
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 620
;620:	trap_R_RegisterShaderNoMip( GAMESERVER_ACTION0);
ADDRGP4 $432
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 621
;621:	trap_R_RegisterShaderNoMip( GAMESERVER_ACTION1);
ADDRGP4 $433
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 622
;622:}
LABELV $424
endproc StartServer_MapPage_Cache 0 4
proc StartServer_MapPage_DrawMapName 56 20
line 634
;623:
;624:
;625:
;626:
;627:
;628:/*
;629:=================
;630:StartServer_MapPage_DrawMapName
;631:=================
;632:*/
;633:static void StartServer_MapPage_DrawMapName( void *item )
;634:{
line 643
;635:	menutext_s	*s;
;636:	float		*color;
;637:	int			x, y;
;638:	int			style;
;639:	qboolean	focus;
;640:	int index;
;641:	char* string;
;642:
;643:	s = (menutext_s *)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 645
;644:
;645:	x = s->generic.x;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 646
;646:	y =	s->generic.y;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 648
;647:
;648:	style = UI_SMALLFONT;
ADDRLP4 28
CNSTI4 16
ASGNI4
line 649
;649:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $436
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 $437
JUMPV
LABELV $436
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $437
ADDRLP4 24
ADDRLP4 32
INDIRI4
ASGNI4
line 651
;650:
;651:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $438
line 652
;652:		color = text_color_disabled;
ADDRLP4 12
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $439
JUMPV
LABELV $438
line 653
;653:	else if ( focus )
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $440
line 654
;654:	{
line 655
;655:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 656
;656:		style |= UI_PULSE;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 657
;657:	}
ADDRGP4 $441
JUMPV
LABELV $440
line 658
;658:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $442
line 659
;659:	{
line 660
;660:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 661
;661:		style |= UI_BLINK;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 662
;662:	}
ADDRGP4 $443
JUMPV
LABELV $442
line 664
;663:	else
;664:		color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
LABELV $443
LABELV $441
LABELV $439
line 666
;665:
;666:	if ( focus )
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $444
line 667
;667:	{
line 669
;668:		// draw cursor
;669:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color );
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
SUBI4
ADDRLP4 52
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
SUBI4
ADDRLP4 52
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 670
;670:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 671
;671:	}
LABELV $444
line 674
;672:
;673:	// draw short name
;674:	string = 0;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 675
;675:	index = s->generic.id + ( s_mapcontrols.map_page * NUMMAPS_PERPAGE );
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 676
;676:	if (index < s_scriptdata.map.num_maps)
ADDRLP4 8
INDIRI4
ADDRGP4 s_scriptdata+8
INDIRI4
GEI4 $447
line 677
;677:		string = s_scriptdata.map.data[index].shortName;
ADDRLP4 4
CNSTI4 56
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4
ADDP4
ASGNP4
ADDRGP4 $448
JUMPV
LABELV $447
line 678
;678:	else if (index == s_scriptdata.map.num_maps){
ADDRLP4 8
INDIRI4
ADDRGP4 s_scriptdata+8
INDIRI4
NEI4 $452
line 680
;679:		
;680:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $455
line 681
;681:			string = "<-- add map -->";
ADDRLP4 4
ADDRGP4 $458
ASGNP4
line 682
;682:		}
LABELV $455
line 683
;683:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $459
line 684
;684:			string = "<-- добавить карту -->";
ADDRLP4 4
ADDRGP4 $462
ASGNP4
line 685
;685:		}
LABELV $459
line 686
;686:	}
LABELV $452
LABELV $448
line 689
;687:	
;688:
;689:	if (string)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $463
line 690
;690:		UI_DrawString( x + SMALLCHAR_WIDTH, y, string, style|UI_LEFT, color );
ADDRLP4 16
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $463
line 693
;691:
;692:	// draw long name
;693:	string = 0;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 694
;694:	if (index < s_scriptdata.map.num_maps)
ADDRLP4 8
INDIRI4
ADDRGP4 s_scriptdata+8
INDIRI4
GEI4 $466
line 695
;695:		string = s_scriptdata.map.data[index].longName;
ADDRLP4 4
CNSTI4 56
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4+16
ADDP4
ASGNP4
LABELV $466
line 696
;696:	if (string)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $472
line 697
;697:		UI_DrawString( x + SMALLCHAR_WIDTH + MAPLONGNAME_DX, y, string, style|UI_LEFT, color );
ADDRLP4 16
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
CNSTI4 17
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $472
line 698
;698:}
LABELV $434
endproc StartServer_MapPage_DrawMapName 56 20
proc StartServer_MapPage_DoAction 8 16
line 710
;699:
;700:
;701:
;702:
;703:
;704:/*
;705:=================
;706:StartServer_MapPage_DoAction
;707:=================
;708:*/
;709:static void StartServer_MapPage_DoAction( void )
;710:{
line 713
;711:	int dest, src;
;712:
;713:	src = s_mapcontrols.actionSrc.curvalue;
ADDRLP4 4
ADDRGP4 s_mapcontrols+12940+92
INDIRI4
ASGNI4
line 714
;714:	dest = s_mapcontrols.actionDest.curvalue;
ADDRLP4 0
ADDRGP4 s_mapcontrols+13072+92
INDIRI4
ASGNI4
line 716
;715:
;716:	StartServer_MapDoAction(src, dest, s_mapcontrols.map_page, s_mapcontrols.map_selected);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 s_mapcontrols+13716
INDIRI4
ARGI4
ADDRGP4 s_mapcontrols+13720
INDIRI4
ARGI4
ADDRGP4 StartServer_MapDoAction
CALLV
pop
line 718
;717:
;718:	StartServer_MapPage_CopyCustomLimitsToControls();
ADDRGP4 StartServer_MapPage_CopyCustomLimitsToControls
CALLV
pop
line 719
;719:	StartServer_MapPage_UpdateInterface();
ADDRGP4 StartServer_MapPage_UpdateInterface
CALLV
pop
line 720
;720:}
LABELV $476
endproc StartServer_MapPage_DoAction 8 16
proc StartServer_MapPage_InitControlsFromScript 100 16
line 732
;721:
;722:
;723:
;724:
;725:
;726:/*
;727:=================
;728:StartServer_MapPage_InitControlsFromScript
;729:=================
;730:*/
;731:static void StartServer_MapPage_InitControlsFromScript(void)
;732:{
line 737
;733:	char buf[64];
;734:	menucommon_s *c;
;735:	int i, index, num, max;
;736:
;737:	Com_sprintf( s_mapcontrols.fragLimit.field.buffer, 4, "%i", s_scriptdata.map.fragLimit );
ADDRGP4 s_mapcontrols+10868+88+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $487
ARGP4
ADDRGP4 s_scriptdata+8+1800
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 738
;738:	Com_sprintf( s_mapcontrols.timeLimit.field.buffer, 4, "%i", s_scriptdata.map.timeLimit );
ADDRGP4 s_mapcontrols+10504+88+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $487
ARGP4
ADDRGP4 s_scriptdata+8+1804
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 740
;739:
;740:	index = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 741
;741:	if (s_scriptdata.gametype >= GT_CTF && !(s_scriptdata.gametype == GT_LMS))
ADDRLP4 84
ADDRGP4 s_scriptdata
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 5
LTI4 $495
ADDRLP4 84
INDIRI4
CNSTI4 11
EQI4 $495
line 742
;742:		index = 2;
ADDRLP4 4
CNSTI4 2
ASGNI4
LABELV $495
line 746
;743:
;744:	// set "frag" or "capture" control text
;745:	// and fix the mouse hit box for control
;746:	c = &s_mapcontrols.fragLimitType.generic;
ADDRLP4 0
ADDRGP4 s_mapcontrols+10372
ASGNP4
line 747
;747:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $498
line 748
;748:	c->name = fragcontrol_text[index];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 fragcontrol_text
ADDP4
INDIRP4
ASGNP4
line 749
;749:	s_mapcontrols.fragsText.generic.name = fragcontrol_text[index + 1];
ADDRGP4 s_mapcontrols+12268+4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 fragcontrol_text+4
ADDP4
INDIRP4
ASGNP4
line 750
;750:	}
LABELV $498
line 751
;751:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $504
line 752
;752:	c->name = fragcontrol_textru[index];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 fragcontrol_textru
ADDP4
INDIRP4
ASGNP4
line 753
;753:	s_mapcontrols.fragsText.generic.name = fragcontrol_textru[index + 1];
ADDRGP4 s_mapcontrols+12268+4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 fragcontrol_textru+4
ADDP4
INDIRP4
ASGNP4
line 754
;754:	}
LABELV $504
line 755
;755:	c->left = c->x - (strlen(c->name) + 1) * SMALLCHAR_WIDTH;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ASGNI4
line 758
;756:
;757:	// load type of frag/time value used to start game (none, default, custom)
;758:	s_mapcontrols.fragLimitType.curvalue = s_scriptdata.map.fragLimitType;
ADDRGP4 s_mapcontrols+10372+92
ADDRGP4 s_scriptdata+8+1808
INDIRI4
ASGNI4
line 759
;759:	s_mapcontrols.timeLimitType.curvalue = s_scriptdata.map.timeLimitType;
ADDRGP4 s_mapcontrols+10240+92
ADDRGP4 s_scriptdata+8+1812
INDIRI4
ASGNI4
line 762
;760:
;761:	// load map source and repeat info
;762:	s_mapcontrols.mapRepeat.curvalue = s_scriptdata.map.Repeat;
ADDRGP4 s_mapcontrols+11860+88
ADDRGP4 s_scriptdata+8+1816
INDIRI4
ASGNI4
line 763
;763:	s_mapcontrols.mapSource.curvalue = s_scriptdata.map.listSource;
ADDRGP4 s_mapcontrols+11232+92
ADDRGP4 s_scriptdata+8+1796
INDIRI4
ASGNI4
line 765
;764:
;765:	Q_strncpyz(s_mapcontrols.mapSourceCount.field.buffer, va("%i", s_scriptdata.map.SourceCount), 3);
ADDRGP4 $487
ARGP4
ADDRGP4 s_scriptdata+8+1820
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_mapcontrols+11364+88+12
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 767
;766:
;767:	s_mapcontrols.mapSourceType.curvalue = s_scriptdata.map.SourceType;
ADDRGP4 s_mapcontrols+11728+92
ADDRGP4 s_scriptdata+8+1824
INDIRI4
ASGNI4
line 769
;768:
;769:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $536
line 771
;770:	// get the right text string in the multi-function control
;771:	if (s_scriptdata.gametype == GT_CTF)
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 5
NEI4 $539
line 772
;772:		s_mapcontrols.actionSrc.itemnames = copyFrom_ctf_items;
ADDRGP4 s_mapcontrols+12940+104
ADDRGP4 copyFrom_ctf_items
ASGNP4
ADDRGP4 $540
JUMPV
LABELV $539
line 774
;773:	else
;774:		s_mapcontrols.actionSrc.itemnames = copyFrom_items;
ADDRGP4 s_mapcontrols+12940+104
ADDRGP4 copyFrom_items
ASGNP4
LABELV $540
line 776
;775:	
;776:}
LABELV $536
line 777
;777:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $545
line 779
;778:	// get the right text string in the multi-function control
;779:	if (s_scriptdata.gametype == GT_CTF)
ADDRGP4 s_scriptdata
INDIRI4
CNSTI4 5
NEI4 $548
line 780
;780:		s_mapcontrols.actionSrc.itemnames = copyFrom_ctf_itemsru;
ADDRGP4 s_mapcontrols+12940+104
ADDRGP4 copyFrom_ctf_itemsru
ASGNP4
ADDRGP4 $549
JUMPV
LABELV $548
line 782
;781:	else
;782:		s_mapcontrols.actionSrc.itemnames = copyFrom_itemsru;
ADDRGP4 s_mapcontrols+12940+104
ADDRGP4 copyFrom_itemsru
ASGNP4
LABELV $549
line 784
;783:	
;784:}
LABELV $545
line 786
;785:
;786:	StartServer_MapPage_SetSelectedControl(-1);	
CNSTI4 -1
ARGI4
ADDRGP4 StartServer_MapPage_SetSelectedControl
CALLV
pop
line 787
;787:	StartServer_MapPage_CopyCustomLimitsToControls();
ADDRGP4 StartServer_MapPage_CopyCustomLimitsToControls
CALLV
pop
line 788
;788:}
LABELV $483
endproc StartServer_MapPage_InitControlsFromScript 100 16
proc StartServer_MapPage_CheckLimitType 8 4
line 800
;789:
;790:
;791:
;792:
;793:
;794:/*
;795:=================
;796:StartServer_MapPage_CheckLimitType
;797:=================
;798:*/
;799:static void StartServer_MapPage_CheckLimitType(void)
;800:{
line 801
;801:	if (!StartServer_IsRandomGeneratedMapList(s_mapcontrols.mapSource.curvalue))
ADDRGP4 s_mapcontrols+11232+92
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 StartServer_IsRandomGeneratedMapList
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $555
line 802
;802:		return;
ADDRGP4 $554
JUMPV
LABELV $555
line 805
;803:
;804:	// random maps can't have custom frag limits
;805:	if (s_mapcontrols.fragLimitType.curvalue == MAP_LT_CUSTOM)
ADDRGP4 s_mapcontrols+10372+92
INDIRI4
CNSTI4 2
NEI4 $559
line 806
;806:	{
line 807
;807:		s_mapcontrols.fragLimitType.curvalue++;
ADDRLP4 4
ADDRGP4 s_mapcontrols+10372+92
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 808
;808:		if (s_mapcontrols.fragLimitType.curvalue >= s_mapcontrols.fragLimitType.numitems )
ADDRGP4 s_mapcontrols+10372+92
INDIRI4
ADDRGP4 s_mapcontrols+10372+96
INDIRI4
LTI4 $565
line 809
;809:			s_mapcontrols.fragLimitType.curvalue = 0;
ADDRGP4 s_mapcontrols+10372+92
CNSTI4 0
ASGNI4
LABELV $565
line 810
;810:	}
LABELV $559
line 813
;811:
;812:	// random maps can't have custom time limits
;813:	if (s_mapcontrols.timeLimitType.curvalue == MAP_LT_CUSTOM)
ADDRGP4 s_mapcontrols+10240+92
INDIRI4
CNSTI4 2
NEI4 $573
line 814
;814:	{
line 815
;815:		s_mapcontrols.timeLimitType.curvalue++;
ADDRLP4 4
ADDRGP4 s_mapcontrols+10240+92
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 816
;816:		if (s_mapcontrols.timeLimitType.curvalue >= s_mapcontrols.timeLimitType.numitems )
ADDRGP4 s_mapcontrols+10240+92
INDIRI4
ADDRGP4 s_mapcontrols+10240+96
INDIRI4
LTI4 $579
line 817
;817:			s_mapcontrols.timeLimitType.curvalue = 0;
ADDRGP4 s_mapcontrols+10240+92
CNSTI4 0
ASGNI4
LABELV $579
line 818
;818:	}
LABELV $573
line 819
;819:}
LABELV $554
endproc StartServer_MapPage_CheckLimitType 8 4
proc StartServer_MapPage_Load 0 0
line 830
;820:
;821:
;822:
;823:
;824:/*
;825:=================
;826:StartServer_MapPage_Load
;827:=================
;828:*/
;829:static void StartServer_MapPage_Load(void)
;830:{
line 831
;831:	s_mapcontrols.gameType.curvalue = s_scriptdata.gametype;
ADDRGP4 s_mapcontrols+2408+92
ADDRGP4 s_scriptdata
INDIRI4
ASGNI4
line 833
;832:
;833:	StartServer_MapPage_InitControlsFromScript();
ADDRGP4 StartServer_MapPage_InitControlsFromScript
CALLV
pop
line 834
;834:	StartServer_MapPage_CheckLimitType();
ADDRGP4 StartServer_MapPage_CheckLimitType
CALLV
pop
line 835
;835:}
LABELV $587
endproc StartServer_MapPage_Load 0 0
proc StartServer_MapPage_Save 0 0
line 844
;836:
;837:
;838:/*
;839:=================
;840:StartServer_MapPage_Save
;841:=================
;842:*/
;843:static void StartServer_MapPage_Save(void)
;844:{
line 845
;845:	StartServer_SaveScriptData();
ADDRGP4 StartServer_SaveScriptData
CALLV
pop
line 846
;846:}
LABELV $590
endproc StartServer_MapPage_Save 0 0
proc StartServer_MapPage_SelectionEvent 0 4
line 857
;847:
;848:
;849:
;850:
;851:/*
;852:=================
;853:StartServer_MapPage_SelectionEvent
;854:=================
;855:*/
;856:static void StartServer_MapPage_SelectionEvent( void* ptr, int event )
;857:{
line 858
;858:	if (event == QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $592
line 859
;859:		StartServer_MapPage_SetSelectedControl( ((menucommon_s*)ptr)->id );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 StartServer_MapPage_SetSelectedControl
CALLV
pop
line 860
;860:	}
LABELV $592
line 861
;861:}
LABELV $591
endproc StartServer_MapPage_SelectionEvent 0 4
proc StartServer_MapPage_SetStatusBarText 4 12
line 871
;862:
;863:
;864:
;865:/*
;866:=================
;867:StartServer_MapPage_SetStatusBarText
;868:=================
;869:*/
;870:static void StartServer_MapPage_SetStatusBarText(const char* text)
;871:{
line 872
;872:	if (!text || !text[0])
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $597
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $595
LABELV $597
line 873
;873:	{
line 874
;874:		s_mapcontrols.statusbar_text[0] = 0;
ADDRGP4 s_mapcontrols+13440
CNSTI1 0
ASGNI1
line 875
;875:		return;
ADDRGP4 $594
JUMPV
LABELV $595
line 878
;876:	}
;877:
;878:	Q_strncpyz(s_mapcontrols.statusbar_text, text, MAX_STATUSBAR_TEXT);
ADDRGP4 s_mapcontrols+13440
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 120
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 879
;879:}
LABELV $594
endproc StartServer_MapPage_SetStatusBarText 4 12
proc StartServer_MapPage_MapCount_callback 16 8
line 890
;880:
;881:
;882:
;883:
;884:/*
;885:=================
;886:StartServer_MapPage_MapCount_callback
;887:=================
;888:*/
;889:static qboolean StartServer_MapPage_MapCount_callback(const char* info)
;890:{
line 894
;891:	int subtype;
;892:	const char* mapname;
;893:
;894:	subtype = s_scriptdata.map.SourceType;
ADDRLP4 0
ADDRGP4 s_scriptdata+8+1824
INDIRI4
ASGNI4
line 895
;895:	if (subtype < MAP_RND_MAX)
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $603
line 896
;896:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $600
JUMPV
LABELV $603
line 898
;897:
;898:	subtype -= MAP_RND_MAX;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 5
SUBI4
ASGNI4
line 899
;899:	mapname = Info_ValueForKey(info, "map");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $605
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 900
;900:	return StartServer_IsCustomMapType(mapname, subtype);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 StartServer_IsCustomMapType
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
LABELV $600
endproc StartServer_MapPage_MapCount_callback 16 8
proc StartServer_MapPage_SetSourceTypeText 40 16
line 915
;901:}
;902:
;903:
;904:
;905:
;906:
;907:
;908:
;909:/*
;910:=================
;911:StartServer_MapPage_SetSourceTypeText
;912:=================
;913:*/
;914:static void StartServer_MapPage_SetSourceTypeText(void)
;915:{
line 922
;916:	char *s, *t;
;917:	int id, nonid, total;
;918:	int count;
;919:	int remap;
;920:	int subtype;
;921:
;922:	remap = s_scriptdata.gametype;
ADDRLP4 0
ADDRGP4 s_scriptdata
INDIRI4
ASGNI4
line 923
;923:	id = s_scriptdata.map.TypeCount[remap][MAP_GROUP_ID];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 s_scriptdata+8+1828
ADDP4
INDIRI4
ASGNI4
line 924
;924:	nonid = s_scriptdata.map.TypeCount[remap][MAP_GROUP_NONID];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 s_scriptdata+8+1828+4
ADDP4
INDIRI4
ASGNI4
line 925
;925:	total = id + nonid;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 927
;926:
;927:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $612
line 928
;928:	if (total != 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $615
line 929
;929:	{
line 930
;930:		if ( id == 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $617
line 931
;931:		{
line 932
;932:			s = "all non-QS";
ADDRLP4 20
ADDRGP4 $619
ASGNP4
line 933
;933:		}
ADDRGP4 $618
JUMPV
LABELV $617
line 935
;934:		else
;935:		if ( nonid == 0)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $620
line 936
;936:		{
line 937
;937:			s = "all by QS";
ADDRLP4 20
ADDRGP4 $622
ASGNP4
line 938
;938:		}
ADDRGP4 $621
JUMPV
LABELV $620
line 940
;939:		else
;940:		{
line 941
;941:			s = va("%i by QS", id);
ADDRGP4 $623
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 32
INDIRP4
ASGNP4
line 942
;942:		}
LABELV $621
LABELV $618
line 944
;943:
;944:		subtype = s_mapcontrols.mapSourceType.curvalue - MAP_RND_MAX;
ADDRLP4 24
ADDRGP4 s_mapcontrols+11728+92
INDIRI4
CNSTI4 5
SUBI4
ASGNI4
line 945
;945:		if (subtype >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $626
line 946
;946:		{
line 947
;947:			count = UI_BuildMapListByType(NULL, 0, s_scriptdata.gametype, StartServer_MapPage_MapCount_callback);
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
ADDRGP4 StartServer_MapPage_MapCount_callback
ARGP4
ADDRLP4 32
ADDRGP4 UI_BuildMapListByType
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 32
INDIRI4
ASGNI4
line 949
;948:
;949:			s = va("%i of this type", count);
ADDRGP4 $628
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 950
;950:		}
LABELV $626
line 952
;951:
;952:		t = va("There are %i maps total, %s", total, s);
ADDRGP4 $629
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 953
;953:	}
ADDRGP4 $616
JUMPV
LABELV $615
line 955
;954:	else
;955:	{
line 956
;956:		t = "No maps";
ADDRLP4 16
ADDRGP4 $630
ASGNP4
line 957
;957:	}
LABELV $616
line 958
;958:	}
LABELV $612
line 959
;959:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $631
line 960
;960:	if (total != 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $634
line 961
;961:	{
line 962
;962:		if ( id == 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $636
line 963
;963:		{
line 964
;964:			s = "все не-QS";
ADDRLP4 20
ADDRGP4 $638
ASGNP4
line 965
;965:		}
ADDRGP4 $637
JUMPV
LABELV $636
line 967
;966:		else
;967:		if ( nonid == 0)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $639
line 968
;968:		{
line 969
;969:			s = "все от QS";
ADDRLP4 20
ADDRGP4 $641
ASGNP4
line 970
;970:		}
ADDRGP4 $640
JUMPV
LABELV $639
line 972
;971:		else
;972:		{
line 973
;973:			s = va("%i от QS", id);
ADDRGP4 $642
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 32
INDIRP4
ASGNP4
line 974
;974:		}
LABELV $640
LABELV $637
line 976
;975:
;976:		subtype = s_mapcontrols.mapSourceType.curvalue - MAP_RND_MAX;
ADDRLP4 24
ADDRGP4 s_mapcontrols+11728+92
INDIRI4
CNSTI4 5
SUBI4
ASGNI4
line 977
;977:		if (subtype >= 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $645
line 978
;978:		{
line 979
;979:			count = UI_BuildMapListByType(NULL, 0, s_scriptdata.gametype, StartServer_MapPage_MapCount_callback);
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
ADDRGP4 StartServer_MapPage_MapCount_callback
ARGP4
ADDRLP4 32
ADDRGP4 UI_BuildMapListByType
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 32
INDIRI4
ASGNI4
line 981
;980:
;981:			s = va("%i этого типа", count);
ADDRGP4 $647
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 982
;982:		}
LABELV $645
line 984
;983:
;984:		t = va("Здесь %i карт, %s всего", total, s);
ADDRGP4 $648
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 985
;985:	}
ADDRGP4 $635
JUMPV
LABELV $634
line 987
;986:	else
;987:	{
line 988
;988:		t = "Нет карт";
ADDRLP4 16
ADDRGP4 $649
ASGNP4
line 989
;989:	}
LABELV $635
line 990
;990:	}
LABELV $631
line 992
;991:
;992:	StartServer_MapPage_SetStatusBarText(t);
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 StartServer_MapPage_SetStatusBarText
CALLV
pop
line 993
;993:}
LABELV $606
endproc StartServer_MapPage_SetSourceTypeText 40 16
proc StartServer_MapPage_LimitStatusbar 0 20
line 1003
;994:
;995:
;996:
;997:/*
;998:=================
;999:StartServer_MapPage_LimitStatusbar
;1000:=================
;1001:*/
;1002:static void StartServer_MapPage_LimitStatusbar(void* self)
;1003:{
line 1004
;1004:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $651
line 1005
;1005:	UI_DrawString(320, s_mapcontrols.statusbar_height, "0 = Unlimited", UI_CENTER|UI_SMALLFONT, color_white);
CNSTI4 320
ARGI4
ADDRGP4 s_mapcontrols+13436
INDIRI4
ARGI4
ADDRGP4 $655
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1006
;1006:	}
LABELV $651
line 1007
;1007:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $656
line 1008
;1008:	UI_DrawString(320, s_mapcontrols.statusbar_height, "0 = Бесконечно", UI_CENTER|UI_SMALLFONT, color_white);
CNSTI4 320
ARGI4
ADDRGP4 s_mapcontrols+13436
INDIRI4
ARGI4
ADDRGP4 $660
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1009
;1009:	}
LABELV $656
line 1010
;1010:}
LABELV $650
endproc StartServer_MapPage_LimitStatusbar 0 20
proc StartServer_MapPage_TimeLimitEvent 12 12
line 1021
;1011:
;1012:
;1013:
;1014:
;1015:/*
;1016:=================
;1017:StartServer_MapPage_TimeLimitEvent
;1018:=================
;1019:*/
;1020:static void StartServer_MapPage_TimeLimitEvent( void* ptr, int event )
;1021:{
line 1025
;1022:	int index;
;1023:	int base;
;1024:
;1025:	base = s_mapcontrols.map_page * NUMMAPS_PERPAGE;
ADDRLP4 4
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1026
;1026:	index = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 1028
;1027:
;1028:	if (event != QM_LOSTFOCUS)
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $663
line 1029
;1029:		return;
ADDRGP4 $661
JUMPV
LABELV $663
line 1031
;1030:
;1031:	Q_strncpyz(s_scriptdata.map.data[index + base].timeLimit, s_mapcontrols.displayTimeLimit[index].field.buffer, MAX_LIMIT_BUF);
CNSTI4 56
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
MULI4
ADDRGP4 s_scriptdata+8+4+52
ADDP4
ARGP4
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+88+12
ADDP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1032
;1032:}
LABELV $661
endproc StartServer_MapPage_TimeLimitEvent 12 12
proc StartServer_MapPage_FragLimitEvent 12 12
line 1042
;1033:
;1034:
;1035:
;1036:/*
;1037:=================
;1038:StartServer_MapPage_FragLimitEvent
;1039:=================
;1040:*/
;1041:static void StartServer_MapPage_FragLimitEvent( void* ptr, int event )
;1042:{
line 1046
;1043:	int index;
;1044:	int base;
;1045:
;1046:	base = s_mapcontrols.map_page * NUMMAPS_PERPAGE;
ADDRLP4 4
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1047
;1047:	index = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 1049
;1048:
;1049:	if (event != QM_LOSTFOCUS)
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $673
line 1050
;1050:		return;
ADDRGP4 $671
JUMPV
LABELV $673
line 1052
;1051:
;1052:	Q_strncpyz(s_scriptdata.map.data[index + base].fragLimit, s_mapcontrols.displayFragLimit[index].field.buffer, MAX_LIMIT_BUF);
CNSTI4 56
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
MULI4
ADDRGP4 s_scriptdata+8+4+48
ADDP4
ARGP4
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+88+12
ADDP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1053
;1053:}
LABELV $671
endproc StartServer_MapPage_FragLimitEvent 12 12
bss
align 4
LABELV $682
skip 4
align 4
LABELV $683
skip 4
align 4
LABELV $684
skip 4
align 4
LABELV $685
skip 4
code
proc StartServer_MapPage_MenuEvent 32 12
line 1062
;1054:
;1055:
;1056:/*
;1057:=================
;1058:StartServer_MapPage_MenuEvent
;1059:=================
;1060:*/
;1061:static void StartServer_MapPage_MenuEvent( void* ptr, int event )
;1062:{
line 1067
;1063:	static char* buf;
;1064:	static int num, index;
;1065:	static char* s;
;1066:
;1067:	switch( ((menucommon_s*)ptr)->id )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $686
ADDRLP4 0
INDIRI4
CNSTI4 217
GTI4 $686
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $836-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $836
address $689
address $721
address $721
address $694
address $779
address $797
address $763
address $686
address $714
address $701
address $748
address $732
address $815
address $686
address $686
address $826
address $829
address $823
code
line 1068
;1068:	{
LABELV $689
line 1072
;1069:		// controls that update script data
;1070:
;1071:		case ID_MAP_GAMETYPE:
;1072:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $690
line 1073
;1073:				break;
ADDRGP4 $687
JUMPV
LABELV $690
line 1076
;1074:
;1075:			// make all changes before updating control page
;1076:			StartServer_SaveScriptData();
ADDRGP4 StartServer_SaveScriptData
CALLV
pop
line 1078
;1077:
;1078:			StartServer_LoadScriptDataFromType( s_mapcontrols.gameType.curvalue );
ADDRGP4 s_mapcontrols+2408+92
INDIRI4
ARGI4
ADDRGP4 StartServer_LoadScriptDataFromType
CALLV
pop
line 1079
;1079:			StartServer_MapPage_InitControlsFromScript();
ADDRGP4 StartServer_MapPage_InitControlsFromScript
CALLV
pop
line 1081
;1080:
;1081:			StartServer_MapPage_UpdateInterface();
ADDRGP4 StartServer_MapPage_UpdateInterface
CALLV
pop
line 1082
;1082:			break;
ADDRGP4 $687
JUMPV
LABELV $694
line 1085
;1083:
;1084:		case ID_MAP_MAPSOURCE:
;1085:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $695
line 1086
;1086:				break;
ADDRGP4 $687
JUMPV
LABELV $695
line 1088
;1087:
;1088:			StartServer_SaveMapList();
ADDRGP4 StartServer_SaveMapList
CALLV
pop
line 1090
;1089:
;1090:			s_scriptdata.map.listSource = s_mapcontrols.mapSource.curvalue;
ADDRGP4 s_scriptdata+8+1796
ADDRGP4 s_mapcontrols+11232+92
INDIRI4
ASGNI4
line 1092
;1091:
;1092:			StartServer_LoadMapList();
ADDRGP4 StartServer_LoadMapList
CALLV
pop
line 1093
;1093:			StartServer_RefreshMapNames();
ADDRGP4 StartServer_RefreshMapNames
CALLV
pop
line 1095
;1094:
;1095:			StartServer_MapPage_CheckLimitType();
ADDRGP4 StartServer_MapPage_CheckLimitType
CALLV
pop
line 1096
;1096:			StartServer_MapPage_UpdateInterface();
ADDRGP4 StartServer_MapPage_UpdateInterface
CALLV
pop
line 1097
;1097:			break;
ADDRGP4 $687
JUMPV
LABELV $701
line 1100
;1098:
;1099:		case ID_MAP_SOURCECOUNT:
;1100:			if (event == QM_LOSTFOCUS) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $687
line 1101
;1101:				buf = s_mapcontrols.mapSourceCount.field.buffer;
ADDRGP4 $682
ADDRGP4 s_mapcontrols+11364+88+12
ASGNP4
line 1102
;1102:				num = (int)Com_Clamp(2, 99 , atoi(buf));
ADDRGP4 $682
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTF4 1073741824
ARGF4
CNSTF4 1120272384
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $683
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1103
;1103:				Q_strncpyz( buf, va("%i",num), 3);
ADDRGP4 $487
ARGP4
ADDRGP4 $683
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $682
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1104
;1104:				s_mapcontrols.mapSourceCount.field.cursor = 0;
ADDRGP4 s_mapcontrols+11364+88
CNSTI4 0
ASGNI4
line 1106
;1105:
;1106:				s_scriptdata.map.SourceCount = atoi(s_mapcontrols.mapSourceCount.field.buffer);
ADDRGP4 s_mapcontrols+11364+88+12
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 s_scriptdata+8+1820
ADDRLP4 20
INDIRI4
ASGNI4
line 1107
;1107:			}
line 1108
;1108:			break;
ADDRGP4 $687
JUMPV
LABELV $714
line 1111
;1109:
;1110:		case ID_MAP_MAPREPEAT:
;1111:			if (event == QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $687
line 1112
;1112:			{
line 1113
;1113:				s_scriptdata.map.Repeat = s_mapcontrols.mapRepeat.curvalue;
ADDRGP4 s_scriptdata+8+1816
ADDRGP4 s_mapcontrols+11860+88
INDIRI4
ASGNI4
line 1114
;1114:			}
line 1115
;1115:			break;
ADDRGP4 $687
JUMPV
LABELV $721
line 1119
;1116:
;1117:		case ID_MAP_TIMELIMIT:
;1118:		case ID_MAP_FRAGLIMIT:
;1119:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $722
line 1120
;1120:				break;
ADDRGP4 $687
JUMPV
LABELV $722
line 1122
;1121:
;1122:			StartServer_MapPage_CheckLimitType();
ADDRGP4 StartServer_MapPage_CheckLimitType
CALLV
pop
line 1123
;1123:			s_scriptdata.map.fragLimitType = s_mapcontrols.fragLimitType.curvalue;
ADDRGP4 s_scriptdata+8+1808
ADDRGP4 s_mapcontrols+10372+92
INDIRI4
ASGNI4
line 1124
;1124:			s_scriptdata.map.timeLimitType = s_mapcontrols.timeLimitType.curvalue;
ADDRGP4 s_scriptdata+8+1812
ADDRGP4 s_mapcontrols+10240+92
INDIRI4
ASGNI4
line 1126
;1125:
;1126:			StartServer_MapPage_UpdateInterface();
ADDRGP4 StartServer_MapPage_UpdateInterface
CALLV
pop
line 1127
;1127:			break;
ADDRGP4 $687
JUMPV
LABELV $732
line 1130
;1128:
;1129:		case ID_MAP_TIMECOUNT:
;1130:			if (event == QM_LOSTFOCUS) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $687
line 1131
;1131:				buf = s_mapcontrols.timeLimit.field.buffer;
ADDRGP4 $682
ADDRGP4 s_mapcontrols+10504+88+12
ASGNP4
line 1132
;1132:				if ( atoi(buf) < 0 ) {
ADDRGP4 $682
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $738
line 1133
;1133:					Q_strncpyz( buf, "0", 3);
ADDRGP4 $682
INDIRP4
ARGP4
ADDRGP4 $740
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1134
;1134:					s_mapcontrols.timeLimit.field.cursor = 0;
ADDRGP4 s_mapcontrols+10504+88
CNSTI4 0
ASGNI4
line 1135
;1135:				}
LABELV $738
line 1136
;1136:				s_scriptdata.map.timeLimit = (int)Com_Clamp( 0, 999, atoi(s_mapcontrols.timeLimit.field.buffer) );
ADDRGP4 s_mapcontrols+10504+88+12
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_scriptdata+8+1804
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1137
;1137:			}
line 1139
;1138:
;1139:			break;
ADDRGP4 $687
JUMPV
LABELV $748
line 1142
;1140:
;1141:		case ID_MAP_FRAGCOUNT:
;1142:			if (event == QM_LOSTFOCUS) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $687
line 1143
;1143:				buf = s_mapcontrols.fragLimit.field.buffer;
ADDRGP4 $682
ADDRGP4 s_mapcontrols+10868+88+12
ASGNP4
line 1144
;1144:				if ( atoi(buf) < 0 ) {
ADDRGP4 $682
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $754
line 1145
;1145:					Q_strncpyz( buf, "0", 3);
ADDRGP4 $682
INDIRP4
ARGP4
ADDRGP4 $740
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1146
;1146:					s_mapcontrols.fragLimit.field.cursor = 0;
ADDRGP4 s_mapcontrols+10868+88
CNSTI4 0
ASGNI4
line 1147
;1147:				}
LABELV $754
line 1148
;1148:				s_scriptdata.map.fragLimit = (int)Com_Clamp( 0, 999, atoi(s_mapcontrols.fragLimit.field.buffer) );
ADDRGP4 s_mapcontrols+10868+88+12
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_scriptdata+8+1800
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1149
;1149:			}
line 1150
;1150:			break;
ADDRGP4 $687
JUMPV
LABELV $763
line 1153
;1151:
;1152:		case ID_MAP_DEL:
;1153:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $764
line 1154
;1154:				break;
ADDRGP4 $687
JUMPV
LABELV $764
line 1156
;1155:
;1156:			index = s_mapcontrols.map_selected;
ADDRGP4 $684
ADDRGP4 s_mapcontrols+13720
INDIRI4
ASGNI4
line 1157
;1157:			if (index == -1)
ADDRGP4 $684
INDIRI4
CNSTI4 -1
NEI4 $767
line 1158
;1158:				break;
ADDRGP4 $687
JUMPV
LABELV $767
line 1160
;1159:
;1160:			num = s_mapcontrols.map_page * NUMMAPS_PERPAGE;
ADDRGP4 $683
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1161
;1161:			StartServer_DeleteMap( num + index );
ADDRGP4 $683
INDIRI4
ADDRGP4 $684
INDIRI4
ADDI4
ARGI4
ADDRGP4 StartServer_DeleteMap
CALLV
pop
line 1164
;1162:
;1163:			// end of list deleted, move up one place
;1164:			if (num + index == s_scriptdata.map.num_maps) {
ADDRGP4 $683
INDIRI4
ADDRGP4 $684
INDIRI4
ADDI4
ADDRGP4 s_scriptdata+8
INDIRI4
NEI4 $770
line 1165
;1165:				if ( index == 0 ) {	// move to previous page
ADDRGP4 $684
INDIRI4
CNSTI4 0
NEI4 $773
line 1166
;1166:					if (s_mapcontrols.map_page > 0) {
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 0
LEI4 $775
line 1167
;1167:						s_mapcontrols.map_page--;
ADDRLP4 8
ADDRGP4 s_mapcontrols+13716
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1168
;1168:						index = NUMMAPS_PERPAGE - 1;
ADDRGP4 $684
CNSTI4 7
ASGNI4
line 1169
;1169:					} else {
ADDRGP4 $774
JUMPV
LABELV $775
line 1170
;1170:						index = -1;
ADDRGP4 $684
CNSTI4 -1
ASGNI4
line 1171
;1171:					}
line 1172
;1172:				} else {	// move up one line
ADDRGP4 $774
JUMPV
LABELV $773
line 1173
;1173:					index--;
ADDRLP4 8
ADDRGP4 $684
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1174
;1174:				}
LABELV $774
line 1176
;1175:				// index is guaranteed to have changed
;1176:				StartServer_MapPage_SetSelectedControl( index );
ADDRGP4 $684
INDIRI4
ARGI4
ADDRGP4 StartServer_MapPage_SetSelectedControl
CALLV
pop
line 1177
;1177:			}
LABELV $770
line 1179
;1178:
;1179:			StartServer_MapPage_CopyCustomLimitsToControls();
ADDRGP4 StartServer_MapPage_CopyCustomLimitsToControls
CALLV
pop
line 1180
;1180:			StartServer_MapPage_UpdateInterface();
ADDRGP4 StartServer_MapPage_UpdateInterface
CALLV
pop
line 1181
;1181:			break;
ADDRGP4 $687
JUMPV
LABELV $779
line 1184
;1182:
;1183:		case ID_MAP_UP:
;1184:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $780
line 1185
;1185:				break;
ADDRGP4 $687
JUMPV
LABELV $780
line 1187
;1186:
;1187:			index = s_mapcontrols.map_selected;
ADDRGP4 $684
ADDRGP4 s_mapcontrols+13720
INDIRI4
ASGNI4
line 1188
;1188:			if (index == -1)
ADDRGP4 $684
INDIRI4
CNSTI4 -1
NEI4 $783
line 1189
;1189:				break;
ADDRGP4 $687
JUMPV
LABELV $783
line 1191
;1190:
;1191:			num = s_mapcontrols.map_page * NUMMAPS_PERPAGE;
ADDRGP4 $683
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1192
;1192:			if (StartServer_SwapMaps(num + index, num + index - 1)) {
ADDRLP4 8
ADDRGP4 $683
INDIRI4
ADDRGP4 $684
INDIRI4
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 12
ADDRGP4 StartServer_SwapMaps
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $786
line 1193
;1193:				if (index > 0) {
ADDRGP4 $684
INDIRI4
CNSTI4 0
LEI4 $788
line 1194
;1194:					index--;
ADDRLP4 16
ADDRGP4 $684
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1195
;1195:				} else if (s_mapcontrols.map_page > 0) {
ADDRGP4 $789
JUMPV
LABELV $788
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 0
LEI4 $790
line 1197
;1196:					// map at top of page, move to previous
;1197:					s_mapcontrols.map_page--;
ADDRLP4 16
ADDRGP4 s_mapcontrols+13716
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1198
;1198:					index = NUMMAPS_PERPAGE - 1;
ADDRGP4 $684
CNSTI4 7
ASGNI4
line 1199
;1199:				}
LABELV $790
LABELV $789
line 1200
;1200:			}
LABELV $786
line 1202
;1201:
;1202:			StartServer_MapPage_CopyCustomLimitsToControls();
ADDRGP4 StartServer_MapPage_CopyCustomLimitsToControls
CALLV
pop
line 1203
;1203:			StartServer_MapPage_UpdateInterface();
ADDRGP4 StartServer_MapPage_UpdateInterface
CALLV
pop
line 1205
;1204:
;1205:			if (index != s_mapcontrols.map_selected)
ADDRGP4 $684
INDIRI4
ADDRGP4 s_mapcontrols+13720
INDIRI4
EQI4 $687
line 1206
;1206:				StartServer_MapPage_SetSelectedControl( index );
ADDRGP4 $684
INDIRI4
ARGI4
ADDRGP4 StartServer_MapPage_SetSelectedControl
CALLV
pop
line 1207
;1207:			break;
ADDRGP4 $687
JUMPV
LABELV $797
line 1210
;1208:
;1209:		case ID_MAP_DOWN:
;1210:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $798
line 1211
;1211:				break;
ADDRGP4 $687
JUMPV
LABELV $798
line 1213
;1212:
;1213:			index = s_mapcontrols.map_selected;
ADDRGP4 $684
ADDRGP4 s_mapcontrols+13720
INDIRI4
ASGNI4
line 1214
;1214:			if (index == -1)
ADDRGP4 $684
INDIRI4
CNSTI4 -1
NEI4 $801
line 1215
;1215:				break;
ADDRGP4 $687
JUMPV
LABELV $801
line 1217
;1216:
;1217:			num = s_mapcontrols.map_page * NUMMAPS_PERPAGE;
ADDRGP4 $683
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1218
;1218:			if (StartServer_SwapMaps(num + index, num + index + 1)) {
ADDRLP4 16
ADDRGP4 $683
INDIRI4
ADDRGP4 $684
INDIRI4
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 20
ADDRGP4 StartServer_SwapMaps
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $804
line 1219
;1219:				if (index < NUMMAPS_PERPAGE - 1) {
ADDRGP4 $684
INDIRI4
CNSTI4 7
GEI4 $806
line 1220
;1220:					index++;
ADDRLP4 24
ADDRGP4 $684
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1221
;1221:				} else if (num + index + 1 < s_scriptdata.map.num_maps) {
ADDRGP4 $807
JUMPV
LABELV $806
ADDRGP4 $683
INDIRI4
ADDRGP4 $684
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRGP4 s_scriptdata+8
INDIRI4
GEI4 $808
line 1223
;1222:					// map at bottom of page, move to next if it has a map
;1223:					s_mapcontrols.map_page++;
ADDRLP4 24
ADDRGP4 s_mapcontrols+13716
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1224
;1224:					index = 0;
ADDRGP4 $684
CNSTI4 0
ASGNI4
line 1225
;1225:				}
LABELV $808
LABELV $807
line 1227
;1226:
;1227:			}
LABELV $804
line 1228
;1228:			StartServer_MapPage_CopyCustomLimitsToControls();
ADDRGP4 StartServer_MapPage_CopyCustomLimitsToControls
CALLV
pop
line 1229
;1229:			StartServer_MapPage_UpdateInterface();
ADDRGP4 StartServer_MapPage_UpdateInterface
CALLV
pop
line 1231
;1230:
;1231:			if (index != s_mapcontrols.map_selected)
ADDRGP4 $684
INDIRI4
ADDRGP4 s_mapcontrols+13720
INDIRI4
EQI4 $687
line 1232
;1232:				StartServer_MapPage_SetSelectedControl( index );
ADDRGP4 $684
INDIRI4
ARGI4
ADDRGP4 StartServer_MapPage_SetSelectedControl
CALLV
pop
line 1233
;1233:			break;
ADDRGP4 $687
JUMPV
LABELV $815
line 1238
;1234:
;1235:		// controls that update the interface only
;1236:
;1237:		case ID_MAP_PAGENUM:
;1238:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $816
line 1239
;1239:				break;
ADDRGP4 $687
JUMPV
LABELV $816
line 1241
;1240:
;1241:			s_mapcontrols.map_page++;
ADDRLP4 24
ADDRGP4 s_mapcontrols+13716
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1242
;1242:			if (s_mapcontrols.map_page == StartServer_MapPageCount())
ADDRLP4 28
ADDRGP4 StartServer_MapPageCount
CALLI4
ASGNI4
ADDRGP4 s_mapcontrols+13716
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $819
line 1243
;1243:				s_mapcontrols.map_page = 0;
ADDRGP4 s_mapcontrols+13716
CNSTI4 0
ASGNI4
LABELV $819
line 1245
;1244:
;1245:			StartServer_MapPage_SetSelectedControl(-1);
CNSTI4 -1
ARGI4
ADDRGP4 StartServer_MapPage_SetSelectedControl
CALLV
pop
line 1247
;1246:
;1247:			StartServer_MapPage_CopyCustomLimitsToControls();
ADDRGP4 StartServer_MapPage_CopyCustomLimitsToControls
CALLV
pop
line 1248
;1248:			StartServer_MapPage_UpdateInterface();
ADDRGP4 StartServer_MapPage_UpdateInterface
CALLV
pop
line 1249
;1249:			break;
ADDRGP4 $687
JUMPV
LABELV $823
line 1252
;1250:
;1251:		case ID_MAP_ACTIONTYPE:
;1252:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $824
line 1253
;1253:				break;
ADDRGP4 $687
JUMPV
LABELV $824
line 1255
;1254:
;1255:			StartServer_MapPage_UpdateActionControls();
ADDRGP4 StartServer_MapPage_UpdateActionControls
CALLV
pop
line 1256
;1256:			break;
ADDRGP4 $687
JUMPV
LABELV $826
line 1259
;1257:
;1258:		case ID_MAP_ACTION:
;1259:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $827
line 1260
;1260:				break;
ADDRGP4 $687
JUMPV
LABELV $827
line 1262
;1261:
;1262:			StartServer_MapPage_DoAction();
ADDRGP4 StartServer_MapPage_DoAction
CALLV
pop
line 1263
;1263:			break;
ADDRGP4 $687
JUMPV
LABELV $829
line 1266
;1264:
;1265:		case ID_MAP_SOURCETYPE:
;1266:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $830
line 1267
;1267:				break;
ADDRGP4 $687
JUMPV
LABELV $830
line 1269
;1268:
;1269:			StartServer_MapPage_SetSourceTypeText();
ADDRGP4 StartServer_MapPage_SetSourceTypeText
CALLV
pop
line 1270
;1270:			s_scriptdata.map.SourceType = s_mapcontrols.mapSourceType.curvalue;
ADDRGP4 s_scriptdata+8+1824
ADDRGP4 s_mapcontrols+11728+92
INDIRI4
ASGNI4
line 1271
;1271:			break;
LABELV $686
LABELV $687
line 1273
;1272:	}
;1273:}
LABELV $681
endproc StartServer_MapPage_MenuEvent 32 12
proc StartServer_MapPage_CommonEvent 8 4
line 1284
;1274:
;1275:
;1276:
;1277:
;1278:/*
;1279:=================
;1280:StartServer_MapPage_CommonEvent
;1281:=================
;1282:*/
;1283:static void StartServer_MapPage_CommonEvent( void* ptr, int event )
;1284:{
line 1285
;1285:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $839
line 1286
;1286:		return;
ADDRGP4 $838
JUMPV
LABELV $839
line 1289
;1287:	}
;1288:
;1289:	StartServer_MapPage_Save();
ADDRGP4 StartServer_MapPage_Save
CALLV
pop
line 1290
;1290:	switch( ((menucommon_s*)ptr)->id )
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
LTI4 $841
ADDRLP4 0
INDIRI4
CNSTI4 16
GTI4 $841
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $850-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $850
address $848
address $849
address $844
address $847
address $846
address $841
address $845
code
line 1291
;1291:	{
LABELV $844
line 1293
;1292:		case ID_SERVERCOMMON_SERVER:
;1293:			StartServer_BotPage_MenuInit();
ADDRGP4 StartServer_BotPage_MenuInit
CALLV
pop
line 1294
;1294:			StartServer_ItemPage_MenuInit();
ADDRGP4 StartServer_ItemPage_MenuInit
CALLV
pop
line 1295
;1295:			StartServer_ServerPage_MenuInit();
ADDRGP4 StartServer_ServerPage_MenuInit
CALLV
pop
line 1296
;1296:			break;
ADDRGP4 $842
JUMPV
LABELV $845
line 1299
;1297:			
;1298:		case ID_SERVERCOMMON_WEAPON:
;1299:			StartServer_BotPage_MenuInit();
ADDRGP4 StartServer_BotPage_MenuInit
CALLV
pop
line 1300
;1300:			StartServer_ItemPage_MenuInit();
ADDRGP4 StartServer_ItemPage_MenuInit
CALLV
pop
line 1301
;1301:			StartServer_WeaponPage_MenuInit();
ADDRGP4 StartServer_WeaponPage_MenuInit
CALLI4
pop
line 1302
;1302:			break;
ADDRGP4 $842
JUMPV
LABELV $846
line 1305
;1303:
;1304:		case ID_SERVERCOMMON_BOTS:
;1305:			StartServer_BotPage_MenuInit();
ADDRGP4 StartServer_BotPage_MenuInit
CALLV
pop
line 1306
;1306:			break;
ADDRGP4 $842
JUMPV
LABELV $847
line 1309
;1307:
;1308:		case ID_SERVERCOMMON_ITEMS:
;1309:			StartServer_BotPage_MenuInit();
ADDRGP4 StartServer_BotPage_MenuInit
CALLV
pop
line 1310
;1310:			StartServer_ItemPage_MenuInit();
ADDRGP4 StartServer_ItemPage_MenuInit
CALLV
pop
line 1311
;1311:			break;
ADDRGP4 $842
JUMPV
LABELV $848
line 1314
;1312:
;1313:		case ID_SERVERCOMMON_BACK:
;1314:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1315
;1315:			break;
ADDRGP4 $842
JUMPV
LABELV $849
line 1318
;1316:
;1317:		case ID_SERVERCOMMON_FIGHT:
;1318:			StartServer_CreateServer(NULL);
CNSTP4 0
ARGP4
ADDRGP4 StartServer_CreateServer
CALLI4
pop
line 1319
;1319:			break;
LABELV $841
LABELV $842
line 1321
;1320:	}
;1321:}
LABELV $838
endproc StartServer_MapPage_CommonEvent 8 4
proc StartServer_MapPage_ChangeMapEvent 12 12
line 1332
;1322:
;1323:
;1324:
;1325:
;1326:
;1327:/*
;1328:=================
;1329:StartServer_MapPage_ChangeMapEvent
;1330:=================
;1331:*/
;1332:static void StartServer_MapPage_ChangeMapEvent( void* ptr, int event ) {
line 1335
;1333:	int index;
;1334:
;1335:	index = ((menucommon_s*)ptr)->id + (NUMMAPS_PERPAGE * s_mapcontrols.map_page);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 1337
;1336:
;1337:	switch (event) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $859
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $856
ADDRGP4 $854
JUMPV
LABELV $856
line 1339
;1338:	case QM_ACTIVATED:
;1339:		UI_StartMapMenu(s_scriptdata.gametype, index, s_scriptdata.map.data[index].shortName);
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 56
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4
ADDP4
ARGP4
ADDRGP4 UI_StartMapMenu
CALLV
pop
line 1340
;1340:		break;
ADDRGP4 $855
JUMPV
LABELV $859
line 1343
;1341:
;1342:	case QM_GOTFOCUS:
;1343:		if (index < s_scriptdata.map.num_maps)
ADDRLP4 0
INDIRI4
ADDRGP4 s_scriptdata+8
INDIRI4
GEI4 $855
line 1344
;1344:		{
line 1345
;1345:			StartServer_InitMapPicture(&s_mapcontrols.mappic, s_scriptdata.map.data[index].shortName);
ADDRGP4 s_mapcontrols+13560
ARGP4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_scriptdata+8+4
ADDP4
ARGP4
ADDRGP4 StartServer_InitMapPicture
CALLV
pop
line 1346
;1346:		}
line 1347
;1347:		break;
LABELV $854
LABELV $855
line 1349
;1348:	}
;1349:}
LABELV $852
endproc StartServer_MapPage_ChangeMapEvent 12 12
proc StartServer_MapPage_InitPageText 32 4
line 1360
;1350:
;1351:
;1352:
;1353:
;1354:/*
;1355:=================
;1356:StartServer_MapPage_InitPageText
;1357:=================
;1358:*/
;1359:static void StartServer_MapPage_InitPageText( menutext_s *a )
;1360:{
line 1365
;1361:	int	len;
;1362:	int cw, ch;
;1363:
;1364:	// calculate bounds
;1365:	if (a->generic.name)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $867
line 1366
;1366:		len = strlen(a->generic.name);
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $868
JUMPV
LABELV $867
line 1368
;1367:	else
;1368:		len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $868
line 1370
;1369:
;1370:	if (a->generic.flags & QMF_SMALLFONT) {
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 2
BANDU4
CNSTU4 0
EQU4 $869
line 1371
;1371:		ch = SMALLCHAR_HEIGHT;
ADDRLP4 8
ADDRGP4 cl_smallcharheight+12
INDIRI4
ASGNI4
line 1372
;1372:		cw = SMALLCHAR_WIDTH;
ADDRLP4 4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ASGNI4
line 1373
;1373:	}
ADDRGP4 $870
JUMPV
LABELV $869
line 1374
;1374:	else {
line 1375
;1375:		ch = BIGCHAR_HEIGHT;
ADDRLP4 8
ADDRGP4 cl_bigcharheight+12
INDIRI4
ASGNI4
line 1376
;1376:		cw = BIGCHAR_WIDTH;
ADDRLP4 4
ADDRGP4 cl_bigcharwidth+12
INDIRI4
ASGNI4
line 1377
;1377:	}
LABELV $870
line 1380
;1378:
;1379:	// left justify text
;1380:	a->generic.left   = a->generic.x;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 1381
;1381:	a->generic.right  = a->generic.x + len*cw;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDI4
ASGNI4
line 1382
;1382:	a->generic.top    = a->generic.y;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1383
;1383:	a->generic.bottom = a->generic.y + ch;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1384
;1384:}
LABELV $866
endproc StartServer_MapPage_InitPageText 32 4
proc StartServer_MapPage_DrawPageText 48 20
line 1394
;1385:
;1386:
;1387:
;1388:/*
;1389:=================
;1390:StartServer_MapPage_DrawPageText
;1391:=================
;1392:*/
;1393:static void StartServer_MapPage_DrawPageText( void* b )
;1394:{
line 1401
;1395:	float *color;
;1396:	int	x,y;
;1397:	int	style;
;1398:	qboolean focus;
;1399:	menutext_s* s;
;1400:
;1401:	s = (menutext_s*)b;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1402
;1402:	x = s->generic.x;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 1403
;1403:	y =	s->generic.y;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1405
;1404:
;1405:	style = UI_SMALLFONT;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 1406
;1406:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $877
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $878
JUMPV
LABELV $877
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $878
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 1408
;1407:
;1408:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $879
line 1409
;1409:		color = text_color_disabled;
ADDRLP4 12
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $880
JUMPV
LABELV $879
line 1410
;1410:	else if ( focus )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $881
line 1411
;1411:	{
line 1412
;1412:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 1413
;1413:		style |= UI_PULSE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1414
;1414:	}
ADDRGP4 $882
JUMPV
LABELV $881
line 1415
;1415:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $883
line 1416
;1416:	{
line 1417
;1417:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 1418
;1418:		style |= UI_BLINK;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1419
;1419:	}
ADDRGP4 $884
JUMPV
LABELV $883
line 1421
;1420:	else
;1421:		color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
LABELV $884
LABELV $882
LABELV $880
line 1423
;1422:
;1423:	if ( focus )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $885
line 1424
;1424:	{
line 1426
;1425:		// draw cursor
;1426:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color );
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1427
;1427:	}
LABELV $885
line 1429
;1428:
;1429:	UI_DrawString( x, y, s->generic.name, style, color );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1430
;1430:}
LABELV $875
endproc StartServer_MapPage_DrawPageText 48 20
proc StartServer_MapPage_DrawStatusBarText 0 20
line 1441
;1431:
;1432:
;1433:
;1434:
;1435:/*
;1436:=================
;1437:StartServer_MapPage_DrawStatusBarText
;1438:=================
;1439:*/
;1440:static void StartServer_MapPage_DrawStatusBarText(void* self)
;1441:{
line 1442
;1442:	UI_DrawString(320, s_mapcontrols.statusbar_height, s_mapcontrols.statusbar_text, UI_CENTER|UI_SMALLFONT, color_white);
CNSTI4 320
ARGI4
ADDRGP4 s_mapcontrols+13436
INDIRI4
ARGI4
ADDRGP4 s_mapcontrols+13440
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1443
;1443:}
LABELV $887
endproc StartServer_MapPage_DrawStatusBarText 0 20
proc StartServer_MapPage_MenuDraw 40 24
line 1453
;1444:
;1445:
;1446:
;1447:/*
;1448:=================
;1449:StartServer_MapPage_MenuDraw
;1450:=================
;1451:*/
;1452:static void StartServer_MapPage_MenuDraw(void)
;1453:{
line 1461
;1454:	int i;
;1455:	float f;
;1456:	qboolean excluded;
;1457:	menucommon_s* g;
;1458:	int maxmaps;
;1459:	qhandle_t picshader;
;1460:
;1461:	if (uis.firstdraw) {
ADDRGP4 uis+11496
INDIRI4
CNSTI4 0
EQI4 $891
line 1462
;1462:		StartServer_MapPage_Load();
ADDRGP4 StartServer_MapPage_Load
CALLV
pop
line 1463
;1463:		StartServer_MapPage_UpdateInterface();
ADDRGP4 StartServer_MapPage_UpdateInterface
CALLV
pop
line 1464
;1464:	}
LABELV $891
line 1466
;1465:
;1466:	excluded = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1467
;1467:	if (s_scriptdata.map.listSource == MAP_MS_RANDOMEXCLUDE)
ADDRGP4 s_scriptdata+8+1796
INDIRI4
CNSTI4 3
NEI4 $894
line 1468
;1468:		excluded = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $894
line 1470
;1469:
;1470:	StartServer_BackgroundDraw(excluded);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 StartServer_BackgroundDraw
CALLV
pop
line 1473
;1471:
;1472:	// draw map picture
;1473:	maxmaps = s_scriptdata.map.num_maps - s_mapcontrols.map_page * NUMMAPS_PERPAGE;
ADDRLP4 8
ADDRGP4 s_scriptdata+8
INDIRI4
ADDRGP4 s_mapcontrols+13716
INDIRI4
CNSTI4 3
LSHI4
SUBI4
ASGNI4
line 1474
;1474:	if (maxmaps > NUMMAPS_PERPAGE)
ADDRLP4 8
INDIRI4
CNSTI4 8
LEI4 $900
line 1475
;1475:		maxmaps = NUMMAPS_PERPAGE;
ADDRLP4 8
CNSTI4 8
ASGNI4
LABELV $900
line 1477
;1476:
;1477:	for (i = 0; i < maxmaps; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $905
JUMPV
LABELV $902
line 1478
;1478:	{
line 1479
;1479:		g = &s_mapcontrols.displayMapName[i].generic;
ADDRLP4 0
CNSTI4 104
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584
ADDP4
ASGNP4
line 1480
;1480:		if (g->flags & (QMF_GRAYED|QMF_INACTIVE|QMF_HIDDEN))
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 28672
BANDU4
CNSTU4 0
EQU4 $907
line 1481
;1481:			continue;
ADDRGP4 $903
JUMPV
LABELV $907
line 1483
;1482:
;1483:		if (UI_CursorInRect(g->left, g->top, g->right - g->left, g->bottom - g->top))
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
ARGI4
ADDRLP4 36
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $909
line 1484
;1484:		{
line 1485
;1485:			s_mapcontrols.fadetime = uis.realtime + MAP_FADETIME;
ADDRGP4 s_mapcontrols+13712
ADDRGP4 uis+4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1486
;1486:			break;
ADDRGP4 $904
JUMPV
LABELV $909
line 1488
;1487:		}
;1488:	}
LABELV $903
line 1477
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $905
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $902
LABELV $904
line 1490
;1489:
;1490:	if (uis.realtime < s_mapcontrols.fadetime )
ADDRGP4 uis+4
INDIRI4
ADDRGP4 s_mapcontrols+13712
INDIRI4
GEI4 $913
line 1491
;1491:	{
line 1492
;1492:		f = (float)(s_mapcontrols.fadetime - uis.realtime) / MAP_FADETIME;
ADDRLP4 16
ADDRGP4 s_mapcontrols+13712
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 1494
;1493:
;1494:		pulsecolor[3] = f;
ADDRGP4 pulsecolor+12
ADDRLP4 16
INDIRF4
ASGNF4
line 1495
;1495:		fading_red[3] = f;
ADDRGP4 fading_red+12
ADDRLP4 16
INDIRF4
ASGNF4
line 1497
;1496:
;1497:		trap_R_SetColor( fading_red );
ADDRGP4 fading_red
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1498
;1498:		UI_DrawNamedPic(640 -12 - 134 + uis.wideoffset, 24 - 7,  144, 106, MAPSELECT_SELECT);
ADDRGP4 uis+11476
INDIRI4
CNSTI4 494
ADDI4
CVIF4 4
ARGF4
CNSTF4 1099431936
ARGF4
CNSTF4 1125122048
ARGF4
CNSTF4 1121189888
ARGF4
ADDRGP4 $922
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 1499
;1499:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1501
;1500:
;1501:		StartServer_DrawMapPicture( 640 -12 -124 + uis.wideoffset, 24, 124, 85, &s_mapcontrols.mappic, pulsecolor);
ADDRGP4 uis+11476
INDIRI4
CNSTI4 504
ADDI4
ARGI4
CNSTI4 24
ARGI4
CNSTI4 124
ARGI4
CNSTI4 85
ARGI4
ADDRGP4 s_mapcontrols+13560
ARGP4
ADDRGP4 pulsecolor
ARGP4
ADDRGP4 StartServer_DrawMapPicture
CALLV
pop
line 1502
;1502:	}
LABELV $913
line 1505
;1503:
;1504:	// draw the controls
;1505:	Menu_Draw(&s_mapcontrols.menu);
ADDRGP4 s_mapcontrols
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1506
;1506:}
LABELV $890
endproc StartServer_MapPage_MenuDraw 40 24
export StartServer_MapPage_MenuInit
proc StartServer_MapPage_MenuInit 32 16
line 1515
;1507:
;1508:
;1509:/*
;1510:=================
;1511:StartServer_MapPage_MenuInit
;1512:=================
;1513:*/
;1514:void StartServer_MapPage_MenuInit(void)
;1515:{
line 1519
;1516:	menuframework_s* menuptr;
;1517:	int y, n;
;1518:
;1519:	memset(&s_mapcontrols, 0, sizeof(mapcontrols_t));
ADDRGP4 s_mapcontrols
ARGP4
CNSTI4 0
ARGI4
CNSTI4 13764
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1521
;1520:
;1521:	StartServer_MapPage_Cache();
ADDRGP4 StartServer_MapPage_Cache
CALLV
pop
line 1523
;1522:
;1523:	menuptr = &s_mapcontrols.menu;
ADDRLP4 8
ADDRGP4 s_mapcontrols
ASGNP4
line 1525
;1524:
;1525:	menuptr->wrapAround = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1044
ADDP4
CNSTI4 1
ASGNI4
line 1526
;1526:	menuptr->native 	= qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 1056
ADDP4
CNSTI4 0
ASGNI4
line 1527
;1527:	menuptr->fullscreen = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1052
ADDP4
CNSTI4 1
ASGNI4
line 1528
;1528:	menuptr->draw = StartServer_MapPage_MenuDraw;
ADDRLP4 8
INDIRP4
CNSTI4 1036
ADDP4
ADDRGP4 StartServer_MapPage_MenuDraw
ASGNP4
line 1530
;1529:
;1530:	StartServer_CommonControls_Init(menuptr, &s_mapcontrols.common, StartServer_MapPage_CommonEvent, COMMONCTRL_MAPS);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+1076
ARGP4
ADDRGP4 StartServer_MapPage_CommonEvent
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StartServer_CommonControls_Init
CALLV
pop
line 1532
;1531:
;1532:    s_mapcontrols.map_selected = -1;
ADDRGP4 s_mapcontrols+13720
CNSTI4 -1
ASGNI4
line 1537
;1533:
;1534:	//
;1535:	// the user selected maps
;1536:	//
;1537:	y = GAMETYPEROW_Y;
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 12
INDIRI4
DIVI4
CNSTI4 64
ADDI4
ASGNI4
line 1538
;1538:	s_mapcontrols.gameType.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_mapcontrols+2408
CNSTI4 3
ASGNI4
line 1539
;1539:	s_mapcontrols.gameType.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mapcontrols+2408+72
CNSTU4 258
ASGNU4
line 1540
;1540:	s_mapcontrols.gameType.generic.id	   = ID_MAP_GAMETYPE;
ADDRGP4 s_mapcontrols+2408+24
CNSTI4 200
ASGNI4
line 1541
;1541:	s_mapcontrols.gameType.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+2408+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1542
;1542:	s_mapcontrols.gameType.generic.x	   = GAMETYPECOLUMN_X;
ADDRGP4 s_mapcontrols+2408+28
CNSTI4 400
ASGNI4
line 1543
;1543:	s_mapcontrols.gameType.generic.y	   = y;
ADDRGP4 s_mapcontrols+2408+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1546
;1544:	
;1545:
;1546:	s_mapcontrols.gameTypeIcon.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mapcontrols+2540
CNSTI4 6
ASGNI4
line 1547
;1547:	s_mapcontrols.gameTypeIcon.generic.flags = QMF_INACTIVE;
ADDRGP4 s_mapcontrols+2540+72
CNSTU4 16384
ASGNU4
line 1548
;1548:	s_mapcontrols.gameTypeIcon.generic.x	 = GAMETYPEICON_X;
ADDRGP4 s_mapcontrols+2540+28
CNSTI4 400
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ASGNI4
line 1549
;1549:	s_mapcontrols.gameTypeIcon.generic.y	 = y;
ADDRGP4 s_mapcontrols+2540+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1550
;1550:	s_mapcontrols.gameTypeIcon.width  	     = 32;
ADDRGP4 s_mapcontrols+2540+104
CNSTI4 32
ASGNI4
line 1551
;1551:	s_mapcontrols.gameTypeIcon.height  	     = 32;
ADDRGP4 s_mapcontrols+2540+108
CNSTI4 32
ASGNI4
line 1553
;1552:
;1553:	y += LINE_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1554
;1554:	s_mapcontrols.mapSource.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_mapcontrols+11232
CNSTI4 3
ASGNI4
line 1555
;1555:	s_mapcontrols.mapSource.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mapcontrols+11232+72
CNSTU4 258
ASGNU4
line 1556
;1556:	s_mapcontrols.mapSource.generic.id	   = ID_MAP_MAPSOURCE;
ADDRGP4 s_mapcontrols+11232+24
CNSTI4 203
ASGNI4
line 1557
;1557:	s_mapcontrols.mapSource.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+11232+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1558
;1558:	s_mapcontrols.mapSource.generic.x	   = GAMETYPECOLUMN_X;
ADDRGP4 s_mapcontrols+11232+28
CNSTI4 400
ASGNI4
line 1559
;1559:	s_mapcontrols.mapSource.generic.y	   = y;
ADDRGP4 s_mapcontrols+11232+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1562
;1560:	
;1561:
;1562:	y += 2*LINE_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 1563
;1563:	s_mapcontrols.timeLimitType.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_mapcontrols+10240
CNSTI4 3
ASGNI4
line 1564
;1564:	s_mapcontrols.timeLimitType.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mapcontrols+10240+72
CNSTU4 258
ASGNU4
line 1565
;1565:	s_mapcontrols.timeLimitType.generic.id	   = ID_MAP_TIMELIMIT;
ADDRGP4 s_mapcontrols+10240+24
CNSTI4 201
ASGNI4
line 1566
;1566:	s_mapcontrols.timeLimitType.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+10240+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1567
;1567:	s_mapcontrols.timeLimitType.generic.x	   = MAPCOLUMN_LEFTX;
ADDRGP4 s_mapcontrols+10240+28
CNSTI4 18
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1568
;1568:	s_mapcontrols.timeLimitType.generic.y	   = y;
ADDRGP4 s_mapcontrols+10240+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1570
;1569:
;1570:	s_mapcontrols.timeLimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_mapcontrols+10504
CNSTI4 4
ASGNI4
line 1571
;1571:	s_mapcontrols.timeLimit.generic.name       = 0;
ADDRGP4 s_mapcontrols+10504+4
CNSTP4 0
ASGNP4
line 1572
;1572:	s_mapcontrols.timeLimit.generic.flags      = QMF_SMALLFONT|QMF_NUMBERSONLY;
ADDRGP4 s_mapcontrols+10504+72
CNSTU4 34
ASGNU4
line 1573
;1573:	s_mapcontrols.timeLimit.generic.x          = MAPCOLUMN_LEFTX + 9 * SMALLCHAR_WIDTH;
ADDRGP4 s_mapcontrols+10504+28
CNSTI4 18
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
CNSTI4 9
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1574
;1574:	s_mapcontrols.timeLimit.generic.y	        = y;
ADDRGP4 s_mapcontrols+10504+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1575
;1575:	s_mapcontrols.timeLimit.generic.id	        = ID_MAP_TIMECOUNT;
ADDRGP4 s_mapcontrols+10504+24
CNSTI4 211
ASGNI4
line 1576
;1576:	s_mapcontrols.timeLimit.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+10504+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1577
;1577:	s_mapcontrols.timeLimit.generic.statusbar  = StartServer_MapPage_LimitStatusbar;
ADDRGP4 s_mapcontrols+10504+80
ADDRGP4 StartServer_MapPage_LimitStatusbar
ASGNP4
line 1578
;1578:	s_mapcontrols.timeLimit.field.widthInChars = 3;
ADDRGP4 s_mapcontrols+10504+88+8
CNSTI4 3
ASGNI4
line 1579
;1579:	s_mapcontrols.timeLimit.field.maxchars     = 3;
ADDRGP4 s_mapcontrols+10504+88+268
CNSTI4 3
ASGNI4
line 1581
;1580:
;1581:	s_mapcontrols.mapSourceCount.generic.type       = MTYPE_FIELD;
ADDRGP4 s_mapcontrols+11364
CNSTI4 4
ASGNI4
line 1582
;1582:	s_mapcontrols.mapSourceCount.generic.flags      = QMF_SMALLFONT|QMF_NUMBERSONLY;
ADDRGP4 s_mapcontrols+11364+72
CNSTU4 34
ASGNU4
line 1583
;1583:	s_mapcontrols.mapSourceCount.generic.x          = MAPCOLUMN_RIGHTX;
ADDRGP4 s_mapcontrols+11364+28
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 320
ADDI4
ADDRGP4 uis+11476
INDIRI4
ADDI4
ASGNI4
line 1584
;1584:	s_mapcontrols.mapSourceCount.generic.y	        = y;
ADDRGP4 s_mapcontrols+11364+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1585
;1585:	s_mapcontrols.mapSourceCount.generic.id	        = ID_MAP_SOURCECOUNT;
ADDRGP4 s_mapcontrols+11364+24
CNSTI4 209
ASGNI4
line 1586
;1586:	s_mapcontrols.mapSourceCount.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+11364+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1587
;1587:	s_mapcontrols.mapSourceCount.field.widthInChars = 3;
ADDRGP4 s_mapcontrols+11364+88+8
CNSTI4 3
ASGNI4
line 1588
;1588:	s_mapcontrols.mapSourceCount.field.maxchars     = 2;
ADDRGP4 s_mapcontrols+11364+88+268
CNSTI4 2
ASGNI4
line 1590
;1589:
;1590:	s_mapcontrols.mapSourceType.generic.type       = MTYPE_SPINCONTROL;
ADDRGP4 s_mapcontrols+11728
CNSTI4 3
ASGNI4
line 1591
;1591:	s_mapcontrols.mapSourceType.generic.name       = NULL;
ADDRGP4 s_mapcontrols+11728+4
CNSTP4 0
ASGNP4
line 1592
;1592:	s_mapcontrols.mapSourceType.generic.flags      = QMF_SMALLFONT|QMF_NUMBERSONLY;
ADDRGP4 s_mapcontrols+11728+72
CNSTU4 34
ASGNU4
line 1593
;1593:	s_mapcontrols.mapSourceType.generic.x          = MAPCOLUMN_RIGHTX + (4*SMALLCHAR_WIDTH);
ADDRGP4 s_mapcontrols+11728+28
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 320
ADDI4
ADDRGP4 uis+11476
INDIRI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
LSHI4
ADDI4
ASGNI4
line 1594
;1594:	s_mapcontrols.mapSourceType.generic.y	        = y;
ADDRGP4 s_mapcontrols+11728+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1595
;1595:	s_mapcontrols.mapSourceType.generic.id	        = ID_MAP_SOURCETYPE;
ADDRGP4 s_mapcontrols+11728+24
CNSTI4 216
ASGNI4
line 1596
;1596:	s_mapcontrols.mapSourceType.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+11728+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1597
;1597:	s_mapcontrols.mapSourceType.generic.statusbar  = StartServer_MapPage_DrawStatusBarText;
ADDRGP4 s_mapcontrols+11728+80
ADDRGP4 StartServer_MapPage_DrawStatusBarText
ASGNP4
line 1600
;1598:	
;1599:
;1600:	y += LINE_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1601
;1601:	s_mapcontrols.fragLimitType.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_mapcontrols+10372
CNSTI4 3
ASGNI4
line 1602
;1602:	s_mapcontrols.fragLimitType.generic.name = 0;
ADDRGP4 s_mapcontrols+10372+4
CNSTP4 0
ASGNP4
line 1603
;1603:	s_mapcontrols.fragLimitType.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mapcontrols+10372+72
CNSTU4 258
ASGNU4
line 1604
;1604:	s_mapcontrols.fragLimitType.generic.id	   = ID_MAP_FRAGLIMIT;
ADDRGP4 s_mapcontrols+10372+24
CNSTI4 202
ASGNI4
line 1605
;1605:	s_mapcontrols.fragLimitType.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+10372+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1606
;1606:	s_mapcontrols.fragLimitType.generic.x	   = MAPCOLUMN_LEFTX;
ADDRGP4 s_mapcontrols+10372+28
CNSTI4 18
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1607
;1607:	s_mapcontrols.fragLimitType.generic.y	   = y;
ADDRGP4 s_mapcontrols+10372+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1610
;1608:	
;1609:
;1610:	s_mapcontrols.fragLimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_mapcontrols+10868
CNSTI4 4
ASGNI4
line 1611
;1611:	s_mapcontrols.fragLimit.generic.name       = 0;
ADDRGP4 s_mapcontrols+10868+4
CNSTP4 0
ASGNP4
line 1612
;1612:	s_mapcontrols.fragLimit.generic.flags      = QMF_SMALLFONT|QMF_NUMBERSONLY;
ADDRGP4 s_mapcontrols+10868+72
CNSTU4 34
ASGNU4
line 1613
;1613:	s_mapcontrols.fragLimit.generic.x          = MAPCOLUMN_LEFTX + 9 * SMALLCHAR_WIDTH;
ADDRGP4 s_mapcontrols+10868+28
CNSTI4 18
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
CNSTI4 9
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1614
;1614:	s_mapcontrols.fragLimit.generic.y	        = y;
ADDRGP4 s_mapcontrols+10868+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1615
;1615:	s_mapcontrols.fragLimit.generic.id	        = ID_MAP_FRAGCOUNT;
ADDRGP4 s_mapcontrols+10868+24
CNSTI4 210
ASGNI4
line 1616
;1616:	s_mapcontrols.fragLimit.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+10868+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1617
;1617:	s_mapcontrols.fragLimit.generic.statusbar  = StartServer_MapPage_LimitStatusbar;
ADDRGP4 s_mapcontrols+10868+80
ADDRGP4 StartServer_MapPage_LimitStatusbar
ASGNP4
line 1618
;1618:	s_mapcontrols.fragLimit.field.widthInChars = 3;
ADDRGP4 s_mapcontrols+10868+88+8
CNSTI4 3
ASGNI4
line 1619
;1619:	s_mapcontrols.fragLimit.field.maxchars     = 3;
ADDRGP4 s_mapcontrols+10868+88+268
CNSTI4 3
ASGNI4
line 1621
;1620:
;1621:	s_mapcontrols.mapRepeat.generic.type  = MTYPE_RADIOBUTTON;
ADDRGP4 s_mapcontrols+11860
CNSTI4 5
ASGNI4
line 1622
;1622:	s_mapcontrols.mapRepeat.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mapcontrols+11860+72
CNSTU4 258
ASGNU4
line 1623
;1623:	s_mapcontrols.mapRepeat.generic.id	   = ID_MAP_MAPREPEAT;
ADDRGP4 s_mapcontrols+11860+24
CNSTI4 208
ASGNI4
line 1624
;1624:	s_mapcontrols.mapRepeat.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+11860+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1625
;1625:	s_mapcontrols.mapRepeat.generic.x	   = MAPCOLUMN_RIGHTX;
ADDRGP4 s_mapcontrols+11860+28
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 320
ADDI4
ADDRGP4 uis+11476
INDIRI4
ADDI4
ASGNI4
line 1626
;1626:	s_mapcontrols.mapRepeat.generic.y	   = y;
ADDRGP4 s_mapcontrols+11860+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1628
;1627:
;1628:	y += 2 * LINE_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 1629
;1629:	s_mapcontrols.mapText.generic.type  = MTYPE_TEXT;
ADDRGP4 s_mapcontrols+12060
CNSTI4 7
ASGNI4
line 1630
;1630:	s_mapcontrols.mapText.generic.x	   = MAPARRAYCOLUMN_X;
ADDRGP4 s_mapcontrols+12060+28
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1631
;1631:	s_mapcontrols.mapText.generic.y	   = y;
ADDRGP4 s_mapcontrols+12060+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1632
;1632:	s_mapcontrols.mapText.style = UI_SMALLFONT;
ADDRGP4 s_mapcontrols+12060+92
CNSTI4 16
ASGNI4
line 1633
;1633:	s_mapcontrols.mapText.color = color_white;
ADDRGP4 s_mapcontrols+12060+100
ADDRGP4 color_white
ASGNP4
line 1635
;1634:
;1635:	s_mapcontrols.nameText.generic.type  = MTYPE_TEXT;
ADDRGP4 s_mapcontrols+12164
CNSTI4 7
ASGNI4
line 1636
;1636:	s_mapcontrols.nameText.generic.x	   = MAPARRAYCOLUMN_X + MAPLONGNAME_DX;
ADDRGP4 s_mapcontrols+12164+28
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
CNSTI4 17
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1637
;1637:	s_mapcontrols.nameText.generic.y	   = y;
ADDRGP4 s_mapcontrols+12164+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1638
;1638:	s_mapcontrols.nameText.style = UI_SMALLFONT;
ADDRGP4 s_mapcontrols+12164+92
CNSTI4 16
ASGNI4
line 1639
;1639:	s_mapcontrols.nameText.color = color_white;
ADDRGP4 s_mapcontrols+12164+100
ADDRGP4 color_white
ASGNP4
line 1641
;1640:
;1641:	s_mapcontrols.fragsText.generic.type  = MTYPE_TEXT;
ADDRGP4 s_mapcontrols+12268
CNSTI4 7
ASGNI4
line 1642
;1642:	s_mapcontrols.fragsText.generic.x	   = MAPARRAYCOLUMN_X + MAPFRAGS_DX + 2 * SMALLCHAR_WIDTH;
ADDRGP4 s_mapcontrols+12268+28
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
CNSTI4 17
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 36
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 1
LSHI4
ADDI4
ASGNI4
line 1643
;1643:	s_mapcontrols.fragsText.generic.y	   = y;
ADDRGP4 s_mapcontrols+12268+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1644
;1644:	s_mapcontrols.fragsText.style = UI_SMALLFONT|UI_CENTER;
ADDRGP4 s_mapcontrols+12268+92
CNSTI4 17
ASGNI4
line 1645
;1645:	s_mapcontrols.fragsText.string = 0;
ADDRGP4 s_mapcontrols+12268+88
CNSTP4 0
ASGNP4
line 1646
;1646:	s_mapcontrols.fragsText.color = color_white;
ADDRGP4 s_mapcontrols+12268+100
ADDRGP4 color_white
ASGNP4
line 1648
;1647:
;1648:	s_mapcontrols.timeText.generic.type  = MTYPE_TEXT;
ADDRGP4 s_mapcontrols+12372
CNSTI4 7
ASGNI4
line 1649
;1649:	s_mapcontrols.timeText.generic.x	   = MAPARRAYCOLUMN_X + MAPTIME_DX + 2*SMALLCHAR_WIDTH;
ADDRGP4 s_mapcontrols+12372+28
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
CNSTI4 17
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 36
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 1
LSHI4
ADDI4
ASGNI4
line 1650
;1650:	s_mapcontrols.timeText.generic.y	   = y;
ADDRGP4 s_mapcontrols+12372+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1651
;1651:	s_mapcontrols.timeText.style = UI_SMALLFONT|UI_CENTER;
ADDRGP4 s_mapcontrols+12372+92
CNSTI4 17
ASGNI4
line 1652
;1652:	s_mapcontrols.timeText.color = color_white;
ADDRGP4 s_mapcontrols+12372+100
ADDRGP4 color_white
ASGNP4
line 1654
;1653:
;1654:	s_mapcontrols.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_mapcontrols+12476
CNSTI4 6
ASGNI4
line 1655
;1655:	s_mapcontrols.arrows.generic.name  = GAMESERVER_VARROWS;
ADDRGP4 s_mapcontrols+12476+4
ADDRGP4 $425
ASGNP4
line 1656
;1656:	s_mapcontrols.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_mapcontrols+12476+72
CNSTU4 16384
ASGNU4
line 1657
;1657:	s_mapcontrols.arrows.generic.x	 = MAPBUTTONS_X;
ADDRGP4 s_mapcontrols+12476+28
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1658
;1658:	s_mapcontrols.arrows.generic.y	 = y;
ADDRGP4 s_mapcontrols+12476+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1659
;1659:	s_mapcontrols.arrows.width  	     = GAMESERVER_ARROWWIDTH;
ADDRGP4 s_mapcontrols+12476+104
CNSTI4 64
ASGNI4
line 1660
;1660:	s_mapcontrols.arrows.height  	     = 2 * GAMESERVER_ARROWHEIGHT;
ADDRGP4 s_mapcontrols+12476+108
CNSTI4 128
ASGNI4
line 1662
;1661:
;1662:	s_mapcontrols.up.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_mapcontrols+12592
CNSTI4 6
ASGNI4
line 1663
;1663:	s_mapcontrols.up.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapcontrols+12592+72
CNSTU4 260
ASGNU4
line 1664
;1664:	s_mapcontrols.up.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+12592+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1665
;1665:	s_mapcontrols.up.generic.id	    = ID_MAP_UP;
ADDRGP4 s_mapcontrols+12592+24
CNSTI4 204
ASGNI4
line 1666
;1666:	s_mapcontrols.up.generic.x		= MAPBUTTONS_X;
ADDRGP4 s_mapcontrols+12592+28
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1667
;1667:	s_mapcontrols.up.generic.y		= y;
ADDRGP4 s_mapcontrols+12592+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1668
;1668:	s_mapcontrols.up.width  		    = GAMESERVER_ARROWWIDTH;
ADDRGP4 s_mapcontrols+12592+104
CNSTI4 64
ASGNI4
line 1669
;1669:	s_mapcontrols.up.height  		    = GAMESERVER_ARROWHEIGHT;
ADDRGP4 s_mapcontrols+12592+108
CNSTI4 64
ASGNI4
line 1670
;1670:	s_mapcontrols.up.focuspic     = GAMESERVER_UP;
ADDRGP4 s_mapcontrols+12592+88
ADDRGP4 $426
ASGNP4
line 1672
;1671:
;1672:	s_mapcontrols.down.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_mapcontrols+12708
CNSTI4 6
ASGNI4
line 1673
;1673:	s_mapcontrols.down.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapcontrols+12708+72
CNSTU4 260
ASGNU4
line 1674
;1674:	s_mapcontrols.down.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+12708+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1675
;1675:	s_mapcontrols.down.generic.id	    = ID_MAP_DOWN;
ADDRGP4 s_mapcontrols+12708+24
CNSTI4 205
ASGNI4
line 1676
;1676:	s_mapcontrols.down.generic.x		= MAPBUTTONS_X;
ADDRGP4 s_mapcontrols+12708+28
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1677
;1677:	s_mapcontrols.down.generic.y		= y + GAMESERVER_ARROWHEIGHT;
ADDRGP4 s_mapcontrols+12708+32
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1678
;1678:	s_mapcontrols.down.width  		    = GAMESERVER_ARROWWIDTH;
ADDRGP4 s_mapcontrols+12708+104
CNSTI4 64
ASGNI4
line 1679
;1679:	s_mapcontrols.down.height  		    = GAMESERVER_ARROWHEIGHT;
ADDRGP4 s_mapcontrols+12708+108
CNSTI4 64
ASGNI4
line 1680
;1680:	s_mapcontrols.down.focuspic = GAMESERVER_DOWN;
ADDRGP4 s_mapcontrols+12708+88
ADDRGP4 $427
ASGNP4
line 1682
;1681:
;1682:	s_mapcontrols.del.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_mapcontrols+12824
CNSTI4 6
ASGNI4
line 1683
;1683:	s_mapcontrols.del.generic.name     = GAMESERVER_DEL0;
ADDRGP4 s_mapcontrols+12824+4
ADDRGP4 $428
ASGNP4
line 1684
;1684:	s_mapcontrols.del.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapcontrols+12824+72
CNSTU4 260
ASGNU4
line 1685
;1685:	s_mapcontrols.del.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+12824+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1686
;1686:	s_mapcontrols.del.generic.id	    = ID_MAP_DEL;
ADDRGP4 s_mapcontrols+12824+24
CNSTI4 206
ASGNI4
line 1687
;1687:	s_mapcontrols.del.generic.x		= MAPBUTTONS_X;
ADDRGP4 s_mapcontrols+12824+28
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1688
;1688:	s_mapcontrols.del.generic.y		= y + 2* GAMESERVER_ARROWHEIGHT;
ADDRGP4 s_mapcontrols+12824+32
ADDRLP4 4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 1689
;1689:	s_mapcontrols.del.width  		    = 48;
ADDRGP4 s_mapcontrols+12824+104
CNSTI4 48
ASGNI4
line 1690
;1690:	s_mapcontrols.del.height  		    = 96;
ADDRGP4 s_mapcontrols+12824+108
CNSTI4 96
ASGNI4
line 1691
;1691:	s_mapcontrols.del.focuspic         = GAMESERVER_DEL1;
ADDRGP4 s_mapcontrols+12824+88
ADDRGP4 $429
ASGNP4
line 1693
;1692:
;1693:	for (n = 0; n < NUMMAPS_PERPAGE; n++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1221
line 1694
;1694:	{
line 1695
;1695:		y += (5 * LINE_HEIGHT)/4;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
ADDRGP4 cl_smallcharheight+12
INDIRI4
MULI4
CNSTI4 10
ADDI4
CNSTI4 4
DIVI4
ADDI4
ASGNI4
line 1697
;1696:
;1697:		s_mapcontrols.displaySelected[n].generic.type  = MTYPE_BITMAP;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656
ADDP4
CNSTI4 6
ASGNI4
line 1698
;1698:		s_mapcontrols.displaySelected[n].generic.name  = GAMESERVER_SELECTED0;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+4
ADDP4
ADDRGP4 $430
ASGNP4
line 1699
;1699:		s_mapcontrols.displaySelected[n].generic.flags = QMF_PULSEIFFOCUS;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+72
ADDP4
CNSTU4 256
ASGNU4
line 1700
;1700:		s_mapcontrols.displaySelected[n].generic.x	   = MAPARRAYCOLUMN_X - 20;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+28
ADDP4
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
CNSTI4 20
SUBI4
ASGNI4
line 1701
;1701:		s_mapcontrols.displaySelected[n].generic.y	   = y;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+32
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1702
;1702:		s_mapcontrols.displaySelected[n].generic.id	   = n;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1703
;1703:		s_mapcontrols.displaySelected[n].generic.callback = StartServer_MapPage_SelectionEvent;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+76
ADDP4
ADDRGP4 StartServer_MapPage_SelectionEvent
ASGNP4
line 1704
;1704:		s_mapcontrols.displaySelected[n].generic.ownerdraw = StartServer_SelectionDraw;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+84
ADDP4
ADDRGP4 StartServer_SelectionDraw
ASGNP4
line 1705
;1705:		s_mapcontrols.displaySelected[n].width = 16;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+104
ADDP4
CNSTI4 16
ASGNI4
line 1706
;1706:		s_mapcontrols.displaySelected[n].height = 16;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+108
ADDP4
CNSTI4 16
ASGNI4
line 1707
;1707:		s_mapcontrols.displaySelected[n].focuspic = GAMESERVER_SELECTED1;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656+88
ADDP4
ADDRGP4 $431
ASGNP4
line 1709
;1708:
;1709:		s_mapcontrols.displayMapName[n].generic.type  = MTYPE_TEXT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584
ADDP4
CNSTI4 7
ASGNI4
line 1710
;1710:		s_mapcontrols.displayMapName[n].generic.flags = QMF_SMALLFONT | QMF_NODEFAULTINIT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+72
ADDP4
CNSTU4 32770
ASGNU4
line 1711
;1711:		s_mapcontrols.displayMapName[n].generic.x	   = MAPARRAYCOLUMN_X;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+28
ADDP4
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1712
;1712:		s_mapcontrols.displayMapName[n].generic.y	   = y;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+32
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1713
;1713:		s_mapcontrols.displayMapName[n].generic.id	   = n;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1714
;1714:		s_mapcontrols.displayMapName[n].generic.callback = StartServer_MapPage_ChangeMapEvent;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+76
ADDP4
ADDRGP4 StartServer_MapPage_ChangeMapEvent
ASGNP4
line 1715
;1715:		s_mapcontrols.displayMapName[n].generic.ownerdraw = StartServer_MapPage_DrawMapName;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+84
ADDP4
ADDRGP4 StartServer_MapPage_DrawMapName
ASGNP4
line 1716
;1716:		s_mapcontrols.displayMapName[n].generic.top	   = y;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+48
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1717
;1717:		s_mapcontrols.displayMapName[n].generic.bottom	   = y + SMALLCHAR_HEIGHT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+56
ADDP4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 1718
;1718:		s_mapcontrols.displayMapName[n].generic.left	   = MAPARRAYCOLUMN_X - SMALLCHAR_WIDTH/2;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+44
ADDP4
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1719
;1719:		s_mapcontrols.displayMapName[n].generic.right	   =
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+52
ADDP4
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
CNSTI4 17
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 36
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1721
;1720:			MAPARRAYCOLUMN_X + MAPFRAGS_DX - SMALLCHAR_WIDTH/2;
;1721:		s_mapcontrols.displayMapName[n].style = UI_SMALLFONT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+92
ADDP4
CNSTI4 16
ASGNI4
line 1722
;1722:		s_mapcontrols.displayMapName[n].color = color_red;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584+100
ADDP4
ADDRGP4 color_red
ASGNP4
line 1724
;1723:
;1724:		s_mapcontrols.displayFragLimit[n].generic.type       = MTYPE_FIELD;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416
ADDP4
CNSTI4 4
ASGNI4
line 1725
;1725:		s_mapcontrols.displayFragLimit[n].generic.name       = 0;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+4
ADDP4
CNSTP4 0
ASGNP4
line 1726
;1726:		s_mapcontrols.displayFragLimit[n].generic.flags      = QMF_SMALLFONT|QMF_NUMBERSONLY|QMF_PULSEIFFOCUS;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+72
ADDP4
CNSTU4 290
ASGNU4
line 1727
;1727:		s_mapcontrols.displayFragLimit[n].generic.x          = MAPARRAYCOLUMN_X + MAPFRAGS_DX;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+28
ADDP4
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
CNSTI4 17
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 36
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ADDI4
ASGNI4
line 1728
;1728:		s_mapcontrols.displayFragLimit[n].generic.y	        = y;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+32
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1729
;1729:		s_mapcontrols.displayFragLimit[n].generic.id	        = n;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1730
;1730:		s_mapcontrols.displayFragLimit[n].generic.callback	= StartServer_MapPage_FragLimitEvent;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+76
ADDP4
ADDRGP4 StartServer_MapPage_FragLimitEvent
ASGNP4
line 1731
;1731:		s_mapcontrols.displayFragLimit[n].generic.statusbar  = StartServer_MapPage_LimitStatusbar;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+80
ADDP4
ADDRGP4 StartServer_MapPage_LimitStatusbar
ASGNP4
line 1732
;1732:		s_mapcontrols.displayFragLimit[n].field.widthInChars = 3;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+88+8
ADDP4
CNSTI4 3
ASGNI4
line 1733
;1733:		s_mapcontrols.displayFragLimit[n].field.maxchars     = 3;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416+88+268
ADDP4
CNSTI4 3
ASGNI4
line 1735
;1734:
;1735:		s_mapcontrols.displayTimeLimit[n].generic.type       = MTYPE_FIELD;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328
ADDP4
CNSTI4 4
ASGNI4
line 1736
;1736:		s_mapcontrols.displayTimeLimit[n].generic.name       = 0;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+4
ADDP4
CNSTP4 0
ASGNP4
line 1737
;1737:		s_mapcontrols.displayTimeLimit[n].generic.flags      = QMF_SMALLFONT|QMF_NUMBERSONLY|QMF_PULSEIFFOCUS;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+72
ADDP4
CNSTU4 290
ASGNU4
line 1738
;1738:		s_mapcontrols.displayTimeLimit[n].generic.x          = MAPARRAYCOLUMN_X + MAPTIME_DX;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+28
ADDP4
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
CNSTI4 17
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 36
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ADDI4
ASGNI4
line 1739
;1739:		s_mapcontrols.displayTimeLimit[n].generic.y	        = y;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+32
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1740
;1740:		s_mapcontrols.displayTimeLimit[n].generic.id		= n;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1741
;1741:		s_mapcontrols.displayTimeLimit[n].generic.callback	= StartServer_MapPage_TimeLimitEvent;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+76
ADDP4
ADDRGP4 StartServer_MapPage_TimeLimitEvent
ASGNP4
line 1742
;1742:		s_mapcontrols.displayTimeLimit[n].generic.statusbar  = StartServer_MapPage_LimitStatusbar;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+80
ADDP4
ADDRGP4 StartServer_MapPage_LimitStatusbar
ASGNP4
line 1743
;1743:		s_mapcontrols.displayTimeLimit[n].field.widthInChars = 3;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+88+8
ADDP4
CNSTI4 3
ASGNI4
line 1744
;1744:		s_mapcontrols.displayTimeLimit[n].field.maxchars     = MAP_NUMBER_FIELD;
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328+88+268
ADDP4
CNSTI4 3
ASGNI4
line 1745
;1745:	}
LABELV $1222
line 1693
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1221
line 1748
;1746:
;1747:	// custom drawn and initialized control
;1748:	y += 2* LINE_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 1749
;1749:	s_mapcontrols.mapPage.generic.type  = MTYPE_TEXT;
ADDRGP4 s_mapcontrols+11956
CNSTI4 7
ASGNI4
line 1750
;1750:	s_mapcontrols.mapPage.generic.flags  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mapcontrols+11956+72
CNSTU4 258
ASGNU4
line 1751
;1751:	s_mapcontrols.mapPage.generic.callback  = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+11956+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1752
;1752:	s_mapcontrols.mapPage.generic.id = ID_MAP_PAGENUM;
ADDRGP4 s_mapcontrols+11956+24
CNSTI4 212
ASGNI4
line 1753
;1753:	s_mapcontrols.mapPage.generic.x	   = MAPARRAYCOLUMN_X;
ADDRGP4 s_mapcontrols+11956+28
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1754
;1754:	s_mapcontrols.mapPage.generic.y	   = y;
ADDRGP4 s_mapcontrols+11956+32
ADDRLP4 4
INDIRI4
ASGNI4
line 1755
;1755:	s_mapcontrols.mapPage.generic.ownerdraw = StartServer_MapPage_DrawPageText;
ADDRGP4 s_mapcontrols+11956+84
ADDRGP4 StartServer_MapPage_DrawPageText
ASGNP4
line 1756
;1756:	s_mapcontrols.mapPage.generic.name = s_mapcontrols.mappage_text;
ADDRGP4 s_mapcontrols+11956+4
ADDRGP4 s_mapcontrols+13724
ASGNP4
line 1757
;1757:	s_mapcontrols.mapPage.color 		= text_color_normal;
ADDRGP4 s_mapcontrols+11956+100
ADDRGP4 text_color_normal
ASGNP4
line 1758
;1758:	StartServer_MapPage_SetPageText();
ADDRGP4 StartServer_MapPage_SetPageText
CALLV
pop
line 1760
;1759:
;1760:	s_mapcontrols.actionSrc.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_mapcontrols+12940
CNSTI4 3
ASGNI4
line 1761
;1761:	s_mapcontrols.actionSrc.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mapcontrols+12940+72
CNSTU4 258
ASGNU4
line 1762
;1762:	s_mapcontrols.actionSrc.generic.id = ID_MAP_ACTIONTYPE;
ADDRGP4 s_mapcontrols+12940+24
CNSTI4 217
ASGNI4
line 1763
;1763:	s_mapcontrols.actionSrc.generic.name = ACTIONTYPE_DELETE;
ADDRGP4 s_mapcontrols+12940+4
ADDRGP4 $208
ASGNP4
line 1764
;1764:	s_mapcontrols.actionSrc.generic.callback  = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+12940+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1765
;1765:	s_mapcontrols.actionSrc.generic.x	   = MAPACTIVATE_X+40;
ADDRGP4 s_mapcontrols+12940+28
CNSTI4 432
ASGNI4
line 1766
;1766:	s_mapcontrols.actionSrc.generic.y	   = y + 100;
ADDRGP4 s_mapcontrols+12940+32
ADDRLP4 4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1769
;1767:
;1768:
;1769:	s_mapcontrols.actionDest.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_mapcontrols+13072
CNSTI4 3
ASGNI4
line 1770
;1770:	s_mapcontrols.actionDest.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_mapcontrols+13072+72
CNSTU4 258
ASGNU4
line 1771
;1771:	s_mapcontrols.actionDest.generic.x	   = MAPACTIVATE_X+40;
ADDRGP4 s_mapcontrols+13072+28
CNSTI4 432
ASGNI4
line 1772
;1772:	s_mapcontrols.actionDest.generic.y	   = y + LINE_HEIGHT + 100;
ADDRGP4 s_mapcontrols+13072+32
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
CNSTI4 100
ADDI4
ASGNI4
line 1775
;1773:	
;1774:
;1775:	s_mapcontrols.actionActivate.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_mapcontrols+13204
CNSTI4 6
ASGNI4
line 1776
;1776:	s_mapcontrols.actionActivate.generic.name     = GAMESERVER_ACTION0;
ADDRGP4 s_mapcontrols+13204+4
ADDRGP4 $432
ASGNP4
line 1777
;1777:	s_mapcontrols.actionActivate.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mapcontrols+13204+72
CNSTU4 260
ASGNU4
line 1778
;1778:	s_mapcontrols.actionActivate.generic.callback = StartServer_MapPage_MenuEvent;
ADDRGP4 s_mapcontrols+13204+76
ADDRGP4 StartServer_MapPage_MenuEvent
ASGNP4
line 1779
;1779:	s_mapcontrols.actionActivate.generic.id	    = ID_MAP_ACTION;
ADDRGP4 s_mapcontrols+13204+24
CNSTI4 215
ASGNI4
line 1780
;1780:	s_mapcontrols.actionActivate.generic.x		= MAPACTIVATE_X - 64 - 11*SMALLCHAR_WIDTH;
ADDRGP4 s_mapcontrols+13204+28
CNSTI4 328
CNSTI4 11
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ASGNI4
line 1781
;1781:	s_mapcontrols.actionActivate.generic.y		= y + 100;
ADDRGP4 s_mapcontrols+13204+32
ADDRLP4 4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1782
;1782:	s_mapcontrols.actionActivate.width  		    = 64;
ADDRGP4 s_mapcontrols+13204+104
CNSTI4 64
ASGNI4
line 1783
;1783:	s_mapcontrols.actionActivate.height  		    = 32;
ADDRGP4 s_mapcontrols+13204+108
CNSTI4 32
ASGNI4
line 1784
;1784:	s_mapcontrols.actionActivate.focuspic         = GAMESERVER_ACTION1;
ADDRGP4 s_mapcontrols+13204+88
ADDRGP4 $433
ASGNP4
line 1786
;1785:	
;1786:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1398
line 1787
;1787:	s_mapcontrols.fragLimitType.itemnames	   = fraglimittype_items;
ADDRGP4 s_mapcontrols+10372+104
ADDRGP4 fraglimittype_items
ASGNP4
line 1788
;1788:	s_mapcontrols.mapSourceType.itemnames = randommaptype_items;
ADDRGP4 s_mapcontrols+11728+104
ADDRGP4 randommaptype_items
ASGNP4
line 1789
;1789:	s_mapcontrols.gameType.itemnames	   = gametype_items;
ADDRGP4 s_mapcontrols+2408+104
ADDRGP4 gametype_items
ASGNP4
line 1790
;1790:	s_mapcontrols.mapSource.itemnames	   = mapSource_items;
ADDRGP4 s_mapcontrols+11232+104
ADDRGP4 mapSource_items
ASGNP4
line 1791
;1791:	s_mapcontrols.timeLimitType.itemnames	   = timelimittype_items;
ADDRGP4 s_mapcontrols+10240+104
ADDRGP4 timelimittype_items
ASGNP4
line 1792
;1792:	s_mapcontrols.actionDest.itemnames	   = copyTo_items;
ADDRGP4 s_mapcontrols+13072+104
ADDRGP4 copyTo_items
ASGNP4
line 1793
;1793:	s_mapcontrols.actionSrc.itemnames	   = copyFrom_items;
ADDRGP4 s_mapcontrols+12940+104
ADDRGP4 copyFrom_items
ASGNP4
line 1794
;1794:	s_mapcontrols.timeText.string = "Time";
ADDRGP4 s_mapcontrols+12372+88
ADDRGP4 $1417
ASGNP4
line 1795
;1795:	s_mapcontrols.nameText.string = "Name";
ADDRGP4 s_mapcontrols+12164+88
ADDRGP4 $1420
ASGNP4
line 1796
;1796:	s_mapcontrols.mapText.string = "Map";
ADDRGP4 s_mapcontrols+12060+88
ADDRGP4 $1423
ASGNP4
line 1797
;1797:	s_mapcontrols.mapRepeat.generic.name = "Repeat forever:";
ADDRGP4 s_mapcontrols+11860+4
ADDRGP4 $1426
ASGNP4
line 1798
;1798:	s_mapcontrols.mapSourceCount.generic.name       = "Randomly choose:";
ADDRGP4 s_mapcontrols+11364+4
ADDRGP4 $1429
ASGNP4
line 1799
;1799:	s_mapcontrols.timeLimitType.generic.name = "Time Limit:";
ADDRGP4 s_mapcontrols+10240+4
ADDRGP4 $1432
ASGNP4
line 1800
;1800:	s_mapcontrols.mapSource.generic.name = "Map Source:";
ADDRGP4 s_mapcontrols+11232+4
ADDRGP4 $1435
ASGNP4
line 1801
;1801:	s_mapcontrols.gameType.generic.name = "Game Type:";
ADDRGP4 s_mapcontrols+2408+4
ADDRGP4 $1438
ASGNP4
line 1802
;1802:	s_mapcontrols.actionDest.generic.name = "to";
ADDRGP4 s_mapcontrols+13072+4
ADDRGP4 $1441
ASGNP4
line 1803
;1803:	}
LABELV $1398
line 1804
;1804:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1442
line 1805
;1805:	s_mapcontrols.fragLimitType.itemnames	   = fraglimittype_itemsru;
ADDRGP4 s_mapcontrols+10372+104
ADDRGP4 fraglimittype_itemsru
ASGNP4
line 1806
;1806:	s_mapcontrols.mapSourceType.itemnames = randommaptype_itemsru;
ADDRGP4 s_mapcontrols+11728+104
ADDRGP4 randommaptype_itemsru
ASGNP4
line 1807
;1807:	s_mapcontrols.gameType.itemnames	   = gametype_itemsru;
ADDRGP4 s_mapcontrols+2408+104
ADDRGP4 gametype_itemsru
ASGNP4
line 1808
;1808:	s_mapcontrols.mapSource.itemnames	   = mapSource_itemsru;
ADDRGP4 s_mapcontrols+11232+104
ADDRGP4 mapSource_itemsru
ASGNP4
line 1809
;1809:	s_mapcontrols.timeLimitType.itemnames	   = timelimittype_itemsru;
ADDRGP4 s_mapcontrols+10240+104
ADDRGP4 timelimittype_itemsru
ASGNP4
line 1810
;1810:	s_mapcontrols.actionDest.itemnames	   = copyTo_itemsru;
ADDRGP4 s_mapcontrols+13072+104
ADDRGP4 copyTo_itemsru
ASGNP4
line 1811
;1811:	s_mapcontrols.actionSrc.itemnames	   = copyFrom_itemsru;
ADDRGP4 s_mapcontrols+12940+104
ADDRGP4 copyFrom_itemsru
ASGNP4
line 1812
;1812:	s_mapcontrols.timeText.string = "Время";
ADDRGP4 s_mapcontrols+12372+88
ADDRGP4 $1461
ASGNP4
line 1813
;1813:	s_mapcontrols.nameText.string = "Имя";
ADDRGP4 s_mapcontrols+12164+88
ADDRGP4 $1464
ASGNP4
line 1814
;1814:	s_mapcontrols.mapText.string = "Карта";
ADDRGP4 s_mapcontrols+12060+88
ADDRGP4 $1467
ASGNP4
line 1815
;1815:	s_mapcontrols.mapRepeat.generic.name = "Повторять всегда:";
ADDRGP4 s_mapcontrols+11860+4
ADDRGP4 $1470
ASGNP4
line 1816
;1816:	s_mapcontrols.mapSourceCount.generic.name       = "Выбрать случайно:";
ADDRGP4 s_mapcontrols+11364+4
ADDRGP4 $1473
ASGNP4
line 1817
;1817:	s_mapcontrols.timeLimitType.generic.name = "Лимит Времени:";
ADDRGP4 s_mapcontrols+10240+4
ADDRGP4 $1476
ASGNP4
line 1818
;1818:	s_mapcontrols.mapSource.generic.name = "Источник Карт:";
ADDRGP4 s_mapcontrols+11232+4
ADDRGP4 $1479
ASGNP4
line 1819
;1819:	s_mapcontrols.gameType.generic.name = "Режим Игры:";
ADDRGP4 s_mapcontrols+2408+4
ADDRGP4 $1482
ASGNP4
line 1820
;1820:	s_mapcontrols.actionDest.generic.name = "в";
ADDRGP4 s_mapcontrols+13072+4
ADDRGP4 $1485
ASGNP4
line 1821
;1821:	}
LABELV $1442
line 1824
;1822:
;1823:#ifndef NO_UIE_MINILOGO_SKIRMISH
;1824:	s_mapcontrols.logo.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_mapcontrols+13320
CNSTI4 6
ASGNI4
line 1825
;1825:	s_mapcontrols.logo.generic.flags		= QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 s_mapcontrols+13320+72
CNSTU4 16448
ASGNU4
line 1826
;1826:	s_mapcontrols.logo.generic.x			= UIE_LOGO_X;
ADDRGP4 s_mapcontrols+13320+28
CNSTI4 570
ASGNI4
line 1827
;1827:	s_mapcontrols.logo.generic.y			= UIE_LOGO_Y;
ADDRGP4 s_mapcontrols+13320+32
CNSTI4 400
ASGNI4
line 1828
;1828:	s_mapcontrols.logo.width				= 64;
ADDRGP4 s_mapcontrols+13320+104
CNSTI4 64
ASGNI4
line 1829
;1829:	s_mapcontrols.logo.height				= 16;
ADDRGP4 s_mapcontrols+13320+108
CNSTI4 16
ASGNI4
line 1830
;1830:	s_mapcontrols.logo.focuspic 			= UIE_LOGO_NAME;
ADDRGP4 s_mapcontrols+13320+88
ADDRGP4 $1499
ASGNP4
line 1831
;1831:	s_mapcontrols.logo.focuscolor 			= color_translucent;
ADDRGP4 s_mapcontrols+13320+112
ADDRGP4 color_translucent
ASGNP4
line 1834
;1832:#endif
;1833:
;1834:	y += 32 + LINE_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 32
ADDI4
ADDI4
ASGNI4
line 1835
;1835:	s_mapcontrols.statusbar_height = y;
ADDRGP4 s_mapcontrols+13436
ADDRLP4 4
INDIRI4
ASGNI4
line 1838
;1836:
;1837:	// load map info here, so mapSourceType is correctly initialized
;1838:	UI_LoadMapTypeInfo();
ADDRGP4 UI_LoadMapTypeInfo
CALLV
pop
line 1844
;1839:
;1840:	//
;1841:	// register page controls
;1842:	//
;1843:
;1844:	Menu_AddItem( menuptr, &s_mapcontrols.gameType);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+2408
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1845
;1845:	Menu_AddItem( menuptr, &s_mapcontrols.gameTypeIcon);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+2540
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1847
;1846:
;1847:	Menu_AddItem( menuptr, &s_mapcontrols.timeLimitType);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+10240
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1848
;1848:	Menu_AddItem( menuptr, &s_mapcontrols.timeLimit);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+10504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1849
;1849:	Menu_AddItem( menuptr, &s_mapcontrols.mapRepeat);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+11860
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1850
;1850:	Menu_AddItem( menuptr, &s_mapcontrols.fragLimitType);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+10372
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1851
;1851:	Menu_AddItem( menuptr, &s_mapcontrols.fragLimit);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+10868
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1852
;1852:	Menu_AddItem( menuptr, &s_mapcontrols.mapSource);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+11232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1853
;1853:	Menu_AddItem( menuptr, &s_mapcontrols.mapSourceCount);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+11364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1854
;1854:	Menu_AddItem( menuptr, &s_mapcontrols.mapSourceType);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+11728
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1856
;1855:
;1856:	Menu_AddItem( menuptr, &s_mapcontrols.mapText);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+12060
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1857
;1857:	Menu_AddItem( menuptr, &s_mapcontrols.nameText);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+12164
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1858
;1858:	Menu_AddItem( menuptr, &s_mapcontrols.fragsText);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+12268
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1859
;1859:	Menu_AddItem( menuptr, &s_mapcontrols.timeText);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+12372
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1861
;1860:
;1861:	StartServer_MapPage_InitPageText(&s_mapcontrols.mapPage);
ADDRGP4 s_mapcontrols+11956
ARGP4
ADDRGP4 StartServer_MapPage_InitPageText
CALLV
pop
line 1862
;1862:	Menu_AddItem( menuptr, &s_mapcontrols.mapPage);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+11956
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1864
;1863:
;1864:	for (n = 0; n < NUMMAPS_PERPAGE; n++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1520
line 1865
;1865:	{
line 1866
;1866:		Menu_AddItem( menuptr, &s_mapcontrols.displaySelected[n]);
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+2656
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1867
;1867:		Menu_AddItem( menuptr, &s_mapcontrols.displayMapName[n]);
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+3584
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1868
;1868:		Menu_AddItem( menuptr, &s_mapcontrols.displayFragLimit[n]);
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+4416
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1869
;1869:		Menu_AddItem( menuptr, &s_mapcontrols.displayTimeLimit[n]);
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 364
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_mapcontrols+7328
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1870
;1870:	}
LABELV $1521
line 1864
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1520
line 1872
;1871:
;1872:	Menu_AddItem( menuptr, &s_mapcontrols.arrows);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+12476
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1873
;1873:	Menu_AddItem( menuptr, &s_mapcontrols.up);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+12592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1874
;1874:	Menu_AddItem( menuptr, &s_mapcontrols.down);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+12708
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1875
;1875:	Menu_AddItem( menuptr, &s_mapcontrols.del);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+12824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1877
;1876:
;1877:	Menu_AddItem( menuptr, &s_mapcontrols.actionSrc);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+12940
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1878
;1878:	Menu_AddItem( menuptr, &s_mapcontrols.actionDest);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+13072
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1879
;1879:	Menu_AddItem( menuptr, &s_mapcontrols.actionActivate);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+13204
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1882
;1880:
;1881:#ifndef NO_UIE_MINILOGO_SKIRMISH
;1882:	if (random() < 0.1)
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1036831949
GEF4 $1535
line 1883
;1883:		Menu_AddItem( menuptr,	&s_mapcontrols.logo);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_mapcontrols+13320
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $1535
line 1886
;1884:#endif
;1885:
;1886:	UI_PushMenu( &s_mapcontrols.menu);
ADDRGP4 s_mapcontrols
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1887
;1887:}
LABELV $925
endproc StartServer_MapPage_MenuInit 32 16
export UI_StartServerMenu
proc UI_StartServerMenu 0 4
line 1909
;1888:
;1889:
;1890:
;1891:/*
;1892:=============================================================================
;1893:
;1894:START SERVER MENU *****
;1895:
;1896:=============================================================================
;1897:*/
;1898:
;1899:
;1900:
;1901:
;1902:
;1903:/*
;1904:=================
;1905:UI_StartServerMenu
;1906:=================
;1907:*/
;1908:void UI_StartServerMenu( qboolean multi)
;1909:{
line 1910
;1910:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 1911
;1911:	StartServer_InitScriptData(multi);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 StartServer_InitScriptData
CALLV
pop
line 1912
;1912:	StartServer_MapPage_MenuInit();
ADDRGP4 StartServer_MapPage_MenuInit
CALLV
pop
line 1913
;1913:}
LABELV $1538
endproc UI_StartServerMenu 0 4
import StartServer_WeaponPage_MenuInit
bss
align 4
LABELV s_mapcontrols
skip 13764
import StartServer_ItemPage_MenuInit_OldMenu
import StartServer_ItemPage_MenuInit
import StartServer_BothItemMenus_Cache
import StartServer_ServerPage_Cache
import StartServer_ServerPage_Mods
import StartServer_ServerPage_MenuInit
import StartServer_BotPage_Cache
import StartServer_BotPage_MenuInit
import StartServer_SelectionDraw
import StartServer_BackgroundDraw
import StartServer_CommonControls_Init
import StartServer_CheckFightReady
import UI_StartMapMenu
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
LABELV $1499
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
LABELV $1485
byte 1 208
byte 1 178
byte 1 0
align 1
LABELV $1482
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
byte 1 152
byte 1 208
byte 1 179
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $1479
byte 1 208
byte 1 152
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 58
byte 1 0
align 1
LABELV $1476
byte 1 208
byte 1 155
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 146
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $1473
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 58
byte 1 0
align 1
LABELV $1470
byte 1 208
byte 1 159
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 143
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 179
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 58
byte 1 0
align 1
LABELV $1467
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $1464
byte 1 208
byte 1 152
byte 1 208
byte 1 188
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $1461
byte 1 208
byte 1 146
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 209
byte 1 143
byte 1 0
align 1
LABELV $1441
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $1438
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1435
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1432
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1429
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 111
byte 1 111
byte 1 115
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1426
byte 1 82
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1423
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1420
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1417
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $922
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
LABELV $740
byte 1 48
byte 1 0
align 1
LABELV $660
byte 1 48
byte 1 32
byte 1 61
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 0
align 1
LABELV $655
byte 1 48
byte 1 32
byte 1 61
byte 1 32
byte 1 85
byte 1 110
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $649
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $648
byte 1 208
byte 1 151
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 140
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 0
align 1
LABELV $647
byte 1 37
byte 1 105
byte 1 32
byte 1 209
byte 1 141
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $642
byte 1 37
byte 1 105
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 81
byte 1 83
byte 1 0
align 1
LABELV $641
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 32
byte 1 81
byte 1 83
byte 1 0
align 1
LABELV $638
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 45
byte 1 81
byte 1 83
byte 1 0
align 1
LABELV $630
byte 1 78
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $629
byte 1 84
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $628
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $623
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 81
byte 1 83
byte 1 0
align 1
LABELV $622
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 81
byte 1 83
byte 1 0
align 1
LABELV $619
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 81
byte 1 83
byte 1 0
align 1
LABELV $605
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $487
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $462
byte 1 60
byte 1 45
byte 1 45
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 176
byte 1 208
byte 1 178
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
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
byte 1 131
byte 1 32
byte 1 45
byte 1 45
byte 1 62
byte 1 0
align 1
LABELV $458
byte 1 60
byte 1 45
byte 1 45
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 45
byte 1 45
byte 1 62
byte 1 0
align 1
LABELV $433
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
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 49
byte 1 0
align 1
LABELV $432
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
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 48
byte 1 0
align 1
LABELV $431
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 95
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $430
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 95
byte 1 111
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $429
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
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $428
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
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $427
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
LABELV $426
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
LABELV $425
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
LABELV $228
byte 1 32
byte 1 208
byte 1 161
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 191
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
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 0
align 1
LABELV $223
byte 1 208
byte 1 163
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $213
byte 1 32
byte 1 67
byte 1 111
byte 1 112
byte 1 121
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $208
byte 1 68
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $150
byte 1 91
byte 1 208
byte 1 161
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 176
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 32
byte 1 37
byte 1 105
byte 1 93
byte 1 0
align 1
LABELV $146
byte 1 91
byte 1 80
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 93
byte 1 0
align 1
LABELV $141
byte 1 208
byte 1 178
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
byte 1 0
align 1
LABELV $140
byte 1 208
byte 1 178
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
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
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
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $139
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $138
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 183
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
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 0
align 1
LABELV $137
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 183
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
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 0
align 1
LABELV $136
byte 1 60
byte 1 60
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 209
byte 1 139
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 62
byte 1 62
byte 1 0
align 1
LABELV $135
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
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 141
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 185
byte 1 32
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
byte 1 184
byte 1 209
byte 1 134
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $134
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
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $133
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 184
byte 1 32
byte 1 209
byte 1 132
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 0
align 1
LABELV $132
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 0
align 1
LABELV $131
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $130
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 209
byte 1 132
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 191
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $129
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 44
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 129
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
byte 1 0
align 1
LABELV $128
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 139
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 0
align 1
LABELV $127
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
byte 1 44
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $126
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
byte 1 44
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 209
byte 1 143
byte 1 208
byte 1 180
byte 1 208
byte 1 186
byte 1 209
byte 1 131
byte 1 0
align 1
LABELV $125
byte 1 208
byte 1 157
byte 1 208
byte 1 176
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 0
align 1
LABELV $124
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $123
byte 1 208
byte 1 161
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $122
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
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $121
byte 1 208
byte 1 155
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
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
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 58
byte 1 0
align 1
LABELV $120
byte 1 208
byte 1 164
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $119
byte 1 208
byte 1 155
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 164
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 58
byte 1 0
align 1
LABELV $118
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $116
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $115
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $114
byte 1 99
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $113
byte 1 60
byte 1 60
byte 1 110
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 110
byte 1 62
byte 1 62
byte 1 0
align 1
LABELV $112
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $111
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $110
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $109
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $108
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $106
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $105
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 111
byte 1 115
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $104
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 44
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $103
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 44
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $102
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $101
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $100
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $99
byte 1 67
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $98
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $97
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $96
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $95
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $94
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
