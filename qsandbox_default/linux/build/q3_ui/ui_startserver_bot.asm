data
align 4
LABELV skill_items
address $96
address $97
address $98
address $99
address $100
address $101
address $102
address $103
address $104
byte 4 0
align 4
LABELV botTypeSel_list
address $105
address $106
address $107
address $108
address $109
address $110
byte 4 0
align 4
LABELV botSkill_list
address $111
address $112
address $113
address $114
byte 4 0
align 4
LABELV botSlotType_list
address $115
address $116
address $117
address $118
byte 4 0
align 4
LABELV botSkillBias_list
address $119
address $120
address $121
address $122
address $123
address $124
address $125
address $126
address $127
address $128
byte 4 0
align 4
LABELV botChange_list
address $129
address $130
address $131
address $132
address $133
byte 4 0
export botCopyTo_items
align 4
LABELV botCopyTo_items
address $134
address $135
address $136
address $137
address $138
address $139
byte 4 0
align 4
LABELV skill_itemsru
address $140
address $141
address $142
address $143
address $144
address $145
address $146
address $147
address $148
byte 4 0
align 4
LABELV botTypeSel_listru
address $149
address $150
address $151
address $152
address $153
address $154
byte 4 0
align 4
LABELV botSkill_listru
address $155
address $156
address $157
address $158
byte 4 0
align 4
LABELV botSlotType_listru
address $115
address $159
address $160
address $161
byte 4 0
align 4
LABELV botSkillBias_listru
address $162
address $163
address $164
address $165
address $166
address $167
address $168
address $169
address $170
address $171
byte 4 0
align 4
LABELV botChange_listru
address $172
address $173
address $174
address $175
address $176
byte 4 0
export botCopyTo_itemsru
align 4
LABELV botCopyTo_itemsru
address $177
address $178
address $179
address $180
address $181
address $182
byte 4 0
code
proc StartServer_BotPage_UpdateButtonInterface 20 0
file "../../../code/q3_ui/ui_startserver_bot.c"
line 276
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
;15:#define ID_BOT_TYPE 100
;16:#define ID_BOT_BOTNUMBER 101
;17:#define ID_BOT_CHANGE 102
;18:#define ID_BOT_SLOTS 103
;19:#define ID_BOT_SKILL 104
;20://#define ID_BOT_SKILLRANGE 105
;21:#define ID_BOT_SKILLBIAS 106
;22:#define ID_BOT_JOINAS 107
;23:#define ID_BOT_DELETESLOT 109
;24:#define ID_BOT_LEFTTEAM 110
;25:#define ID_BOT_RIGHTTEAM 111
;26:#define ID_BOT_GAMETYPE 112
;27:#define ID_BOT_SWAPARROWS 113
;28:#define ID_BOT_ACTION 114
;29:
;30:#define BOTSELECT_SWAPARROWS0 "menu/uie_art/swaparrows_0"
;31:#define BOTSELECT_SWAPARROWS1 "menu/uie_art/swaparrows_1"
;32:#define BOTSELECT_DEL0 "menu/uie_art/del_0"
;33:#define BOTSELECT_DEL1 "menu/uie_art/del_1"
;34:#define BOTSELECT_SELECT "menu/art/opponents_select"
;35:
;36:
;37:#define BOT_LEFTCTRL COLUMN_LEFT
;38:#define BOT_RIGHTCTRL COLUMN_RIGHT
;39:#define BOTCOL_LEFT (2*SMALLCHAR_WIDTH)
;40:#define BOTCOL_RIGHT (320 + 6*SMALLCHAR_WIDTH)
;41:
;42:#define BOT_ICONX BOT_ICONY
;43:#define BOT_ICONY SMALLCHAR_HEIGHT
;44:
;45:#define BOTNAME_LENGTH 16	// chars displayed
;46:#define BOTNAME_DX (8 * SMALLCHAR_WIDTH)
;47:#define BOTSKILL_DX (25 * SMALLCHAR_WIDTH)
;48:
;49:#define BOT_FADETIME 1000
;50:
;51:/*
;52:	new control for skill input
;53:
;54:	override generic.ownerdraw and generic.callback
;55:	use QMF_NODEFAULTINIT
;56:	generic.type ignored
;57:*/
;58:typedef struct {
;59:	menucommon_s generic;
;60:	botskill_t* data;
;61:} menuskill_s;
;62:
;63:// enumerator for testing cursor position
;64:// within control
;65:enum {
;66:	MSKILL_NONE,
;67:	MSKILL_LEFT,
;68:	MSKILL_RIGHT
;69:};
;70:
;71:typedef struct botcontrols_s {
;72:	menuframework_s menu;
;73:	commoncontrols_t common;
;74:
;75:	menulist_s botGameType;
;76:	menubitmap_s botGameTypeIcon;
;77:	menulist_s botTypeSelect;
;78:
;79:	menufield_s numberBots;
;80:	menulist_s changeBots;
;81:	menufield_s numberOpen;
;82:
;83:	menulist_s skillType;
;84:	menuskill_s skillValue;
;85:	menulist_s skillBias;
;86:	menuradiobutton_s joinAs;
;87:
;88:	menutext_s teamLeft;
;89:	menutext_s teamRight;
;90:
;91:	menubitmap_s swapArrows;
;92:	menubitmap_s delBot;
;93:
;94:	menulist_s slotType[PLAYER_SLOTS];
;95:	menutext_s slotName[PLAYER_SLOTS];
;96:	menuskill_s slotSkill[PLAYER_SLOTS];
;97:	menubitmap_s slotSelected[PLAYER_SLOTS];
;98:
;99:	menubitmap_s moveSlot;
;100:	menubitmap_s deleteSlot;
;101:
;102:	menulist_s actionDest;
;103:	menubitmap_s actionActivate;
;104:
;105:	// local, used by the interface
;106:	int selected;
;107:
;108:    int fadetime;
;109:
;110:	int statusbar_height;
;111:	int savetime;
;112:	char statusbar_message[MAX_STATUSBAR_TEXT];
;113:
;114:    int hotspot;	// emulates cursor over skill sfx
;115:
;116:	char boticon[MAX_QPATH];
;117:
;118:	char playername[MAX_NAME_LENGTH];
;119:} botcontrols_t;
;120:
;121://
;122:// controls 
;123://
;124:static botcontrols_t s_botcontrols;
;125:
;126:static const char* skill_items[] = {
;127:	"Noob",
;128:	"Easy",
;129:	"Medium",
;130:	"Hard",
;131:	"Nightmare!",
;132:	"Infinite ammo",
;133:	"Ultra HP",
;134:	"Ultra Damage",
;135:	"Nextbot",
;136:	0
;137:};
;138:
;139:static const char* botTypeSel_list[BOTTYPE_MAX + 1] = {
;140:	"Hand selected",	// BOTTYPE_SELECT
;141:	"Random",	// BOTTYPE_RANDOM
;142:	"Random, list excluded",	// BOTTYPE_RANDOMEXCLUDE
;143:	"Random, script size",	// BOTTYPE_RANDOMARENASCRIPT
;144:	"From arena script",	// BOTTYPE_ARENASCRIPT
;145:   "Selection, arena size", // BOTTYPE_SELECTARENASCRIPT
;146:	0
;147:};
;148:
;149:static const char* botSkill_list[BOTSKILL_COUNT + 1] = {
;150:	"Identical",	// BOTSKILL_SAME
;151:	"Ranged",		// BOTSKILL_RANGE
;152:	"Custom, single",	// BOTSKILL_CUSTOMSAME
;153:	"Custom, range",	// BOTSKILL_CUSTOMRANGE
;154:	0
;155:};
;156:
;157:static const char* botSlotType_list[SLOTTYPE_COUNT + 1] = {
;158:	"----",	// SLOTTYPE_EMPTY
;159:	"Human",	// SLOTTYPE_HUMAN
;160:	"Bot",	// SLOTTYPE_BOT
;161:	"Open",	// SLOTTYPE_OPEN
;162:	0
;163:};
;164:
;165:static const char* botSkillBias_list[SKILLBIAS_COUNT + 1] = {
;166:	"None",	// SKILLBIAS_NONE
;167:	"Very low",	// SKILLBIAS_VLOW
;168:	"Low",	// SKILLBIAS_LOW
;169:	"High",	// SKILLBIAS_HIGH
;170:	"Very high",	// SKILLBIAS_VHIGH
;171:	"Fractional",	// SKILLBIAS_FRACTIONAL
;172:	"Frac, Very low",	// SKILLBIAS_FRAC_VLOW
;173:	"Frac, Low",	// SKILLBIAS_FRAC_LOW
;174:	"Frac, High",	// SKILLBIAS_FRAC_HIGH
;175:	"Frac, Very high",	// SKILLBIAS_FRAC_VHIGH
;176:	0
;177:};
;178:
;179:static const char* botChange_list[BOTCHANGE_COUNT + 1] = {
;180:	"Never",	// BOTCHANGE_NEVER
;181:	"Every map",	// BOTCHANGE_EVERYMAP
;182:	"Every 2nd map",	// BOTCHANGE_MAP2
;183:	"Every 3rd map",	// BOTCHANGE_MAP3
;184:	"Every 4th map",	// BOTCHANGE_MAP4
;185:	0
;186:};
;187:
;188:const char* botCopyTo_items[BOT_CT_COUNT + 1] = {
;189:	"Clear all bot and open slots",	// BOT_CT_CLEARALL
;190:	"Copy individual skill to selected bot",	// BOT_CT_INDIV_SELECTED
;191:	"Copy ranged skill to selected bot",	// BOT_CT_RANGE_SELECTED
;192:	"Copy individual skill to all bots",	// BOT_CT_INDIV_ALL
;193:	"Copy ranged skill to all bots",		// BOT_CT_RANGE_ALL
;194:	"Neaten list of bots",	// BOT_CT_NEATEN
;195:	0
;196:};
;197:
;198:static const char* skill_itemsru[] = {
;199:	"Нуб",
;200:	"Легкий",
;201:	"Средний",
;202:	"Сложный",
;203:	"Кошмар!",
;204:	"Беск патроны",
;205:	"Ультра HP",
;206:	"Ультра урон",
;207:	"Некстбот",
;208:	0
;209:};
;210:
;211:static const char* botTypeSel_listru[BOTTYPE_MAX + 1] = {
;212:	"Выбор вручную",	// BOTTYPE_SELECT
;213:	"Случайно",	// BOTTYPE_RANDOM
;214:	"Случайно, список исключен",	// BOTTYPE_RANDOMEXCLUDE
;215:	"Случайно, размер скрипта",	// BOTTYPE_RANDOMARENASCRIPT
;216:	"Из файла арены",	// BOTTYPE_ARENASCRIPT
;217:	"Выбор, размер арены", // BOTTYPE_SELECTARENASCRIPT
;218:	0
;219:};
;220:
;221:static const char* botSkill_listru[BOTSKILL_COUNT + 1] = {
;222:	"Идентичный",	// BOTSKILL_SAME
;223:	"Диапазон",		// BOTSKILL_RANGE
;224:	"Свои, одиночный",	// BOTSKILL_CUSTOMSAME
;225:	"Свои, диапазон",	// BOTSKILL_CUSTOMRANGE
;226:	0
;227:};
;228:
;229:static const char* botSlotType_listru[SLOTTYPE_COUNT + 1] = {
;230:	"----",	// SLOTTYPE_EMPTY
;231:	"Человек",	// SLOTTYPE_HUMAN
;232:	"Бот",	// SLOTTYPE_BOT
;233:	"Открыт",	// SLOTTYPE_OPEN
;234:	0
;235:};
;236:
;237:static const char* botSkillBias_listru[SKILLBIAS_COUNT + 1] = {
;238:	"Нет",	// SKILLBIAS_NONE
;239:	"Очень низкий",	// SKILLBIAS_VLOW
;240:	"Низкий",	// SKILLBIAS_LOW
;241:	"Высокий",	// SKILLBIAS_HIGH
;242:	"Очень Высокий",	// SKILLBIAS_VHIGH
;243:	"Дробный",	// SKILLBIAS_FRACTIONAL
;244:	"Дробн, Очень Низкий",	// SKILLBIAS_FRAC_VLOW
;245:	"Дробн, Низкий",	// SKILLBIAS_FRAC_LOW
;246:	"Дробн, Высокий",	// SKILLBIAS_FRAC_HIGH
;247:	"Дробн, Очень Высокий",	// SKILLBIAS_FRAC_VHIGH
;248:	0
;249:};
;250:
;251:static const char* botChange_listru[BOTCHANGE_COUNT + 1] = {
;252:	"Никогда",	// BOTCHANGE_NEVER
;253:	"Каждую карту",	// BOTCHANGE_EVERYMAP
;254:	"Каждую 2 карту",	// BOTCHANGE_MAP2
;255:	"Каждую 3 карту",	// BOTCHANGE_MAP3
;256:	"Каждую 4 карту",	// BOTCHANGE_MAP4
;257:	0
;258:};
;259:
;260:const char* botCopyTo_itemsru[BOT_CT_COUNT + 1] = {
;261:	"Очистить всех ботов и открыть слоты",	// BOT_CT_CLEARALL
;262:	"Скопировать сложность в выбранного бота",	// BOT_CT_INDIV_SELECTED
;263:	"Скопировать диапазон сложности в выбранного бота",	// BOT_CT_RANGE_SELECTED
;264:	"Копировать сложность всем ботам",	// BOT_CT_INDIV_ALL
;265:	"Скопировать диапазон сложности всем ботам",		// BOT_CT_RANGE_ALL
;266:	"Уточненный список ботов",	// BOT_CT_NEATEN
;267:	0
;268:};
;269:
;270:/*
;271:=================
;272:StartServer_BotPage_UpdateButtonInterface
;273:=================
;274:*/
;275:static void StartServer_BotPage_UpdateButtonInterface(void)
;276:{
line 277
;277:	if (s_scriptdata.gametype >= GT_TEAM && !(s_scriptdata.gametype == GT_LMS) )
ADDRLP4 0
ADDRGP4 s_scriptdata
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $184
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $184
line 278
;278:		s_botcontrols.swapArrows.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 4
ADDRGP4 s_botcontrols+4308+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
ADDRGP4 $185
JUMPV
LABELV $184
line 280
;279:	else
;280:		s_botcontrols.swapArrows.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 s_botcontrols+4308+72
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
LABELV $185
line 282
;281:
;282:	if (s_botcontrols.selected != -1)
ADDRGP4 s_botcontrols+16564
INDIRI4
CNSTI4 -1
EQI4 $190
line 283
;283:	{
line 284
;284:		s_botcontrols.swapArrows.generic.flags &= ~QMF_GRAYED;
ADDRLP4 12
ADDRGP4 s_botcontrols+4308+72
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 285
;285:		s_botcontrols.delBot.generic.flags &= ~QMF_GRAYED;
ADDRLP4 16
ADDRGP4 s_botcontrols+4424+72
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
line 286
;286:	}
ADDRGP4 $191
JUMPV
LABELV $190
line 287
;287:	else {
line 288
;288:		s_botcontrols.swapArrows.generic.flags |= QMF_GRAYED;
ADDRLP4 12
ADDRGP4 s_botcontrols+4308+72
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 289
;289:		s_botcontrols.delBot.generic.flags |= QMF_GRAYED;
ADDRLP4 16
ADDRGP4 s_botcontrols+4424+72
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 290
;290:	}
LABELV $191
line 291
;291:}
LABELV $183
endproc StartServer_BotPage_UpdateButtonInterface 20 0
proc StartServer_BotPage_SelectItem 4 0
line 299
;292:
;293:/*
;294:=================
;295:StartServer_BotPage_SelectItem
;296:=================
;297:*/
;298:static void StartServer_BotPage_SelectItem(int index)
;299:{
line 300
;300:	if (index >= PLAYER_SLOTS)
ADDRFP4 0
INDIRI4
CNSTI4 26
LTI4 $202
line 301
;301:		return;
ADDRGP4 $201
JUMPV
LABELV $202
line 303
;302:
;303:	if (s_botcontrols.selected >= 0) {
ADDRGP4 s_botcontrols+16564
INDIRI4
CNSTI4 0
LTI4 $204
line 304
;304:		s_botcontrols.slotSelected[s_botcontrols.selected].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 0
CNSTI4 116
ADDRGP4 s_botcontrols+16564
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+72
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
line 305
;305:		if (s_botcontrols.selected == index)
ADDRGP4 s_botcontrols+16564
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $210
line 306
;306:			index = -1;
ADDRFP4 0
CNSTI4 -1
ASGNI4
LABELV $210
line 307
;307:	}
LABELV $204
line 309
;308:
;309:	if (index != -1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 -1
EQI4 $213
line 310
;310:		s_botcontrols.slotSelected[index].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 0
CNSTI4 116
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+72
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 311
;311:	}
LABELV $213
line 313
;312:
;313:	s_botcontrols.selected = index;
ADDRGP4 s_botcontrols+16564
ADDRFP4 0
INDIRI4
ASGNI4
line 314
;314:}
LABELV $201
endproc StartServer_BotPage_SelectItem 4 0
proc StartServer_BotPage_SetSkillRangeType 0 4
line 322
;315:
;316:/*
;317:=================
;318:StartServer_BotPage_SetSkillRangeType
;319:=================
;320:*/
;321:static void StartServer_BotPage_SetSkillRangeType(void)
;322:{
line 323
;323:	StartServer_SetBotSkillRangeType(s_botcontrols.skillType.curvalue);
ADDRGP4 s_botcontrols+3648+92
INDIRI4
ARGI4
ADDRGP4 StartServer_SetBotSkillRangeType
CALLV
pop
line 324
;324:	s_botcontrols.skillType.curvalue = s_scriptdata.bot.skillType;
ADDRGP4 s_botcontrols+3648+92
ADDRGP4 s_scriptdata+1948+1476
INDIRI4
ASGNI4
line 325
;325:}
LABELV $218
endproc StartServer_BotPage_SetSkillRangeType 0 4
proc StartServer_BotPage_UpdateInterface 80 12
line 333
;326:
;327:/*
;328:=================
;329:StartServer_BotPage_UpdateInterface
;330:=================
;331:*/
;332:static void StartServer_BotPage_UpdateInterface(void)
;333:{
line 338
;334:	int i, value, skill, last;
;335:	qboolean grayBots, hideTeam, hideBotType;
;336:	qboolean hideBotSkill, grayBotNumber, grayBotChange;
;337:
;338:	StartServer_SetIconFromGameType(&s_botcontrols.botGameTypeIcon, s_scriptdata.gametype, qfalse);
ADDRGP4 s_botcontrols+2540
ARGP4
ADDRGP4 s_scriptdata
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_SetIconFromGameType
CALLV
pop
line 340
;339:
;340:   hideTeam = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 341
;341:	if (s_scriptdata.gametype >= GT_TEAM && !(s_scriptdata.gametype == GT_LMS) )
ADDRLP4 40
ADDRGP4 s_scriptdata
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 4
LTI4 $227
ADDRLP4 40
INDIRI4
CNSTI4 11
EQI4 $227
line 342
;342:		hideTeam = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $227
line 344
;343:
;344:   grayBots = qfalse;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 345
;345:	hideBotType = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 346
;346:	hideBotSkill = qfalse;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 347
;347:	grayBotNumber = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 348
;348:	grayBotChange = qfalse;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 349
;349:	switch (s_botcontrols.botTypeSelect.curvalue) {
ADDRLP4 44
ADDRGP4 s_botcontrols+2656+92
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $229
ADDRLP4 44
INDIRI4
CNSTI4 5
GTI4 $229
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $239
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $239
address $233
address $234
address $235
address $236
address $237
address $238
code
LABELV $229
LABELV $233
line 352
;350:		default:
;351:		case BOTTYPE_SELECT:
;352:         grayBotChange = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 353
;353:			break;
ADDRGP4 $230
JUMPV
LABELV $234
line 356
;354:
;355:		case BOTTYPE_RANDOM:
;356:			grayBotNumber = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 357
;357:			grayBots = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 358
;358:			break;
ADDRGP4 $230
JUMPV
LABELV $235
line 361
;359:
;360:		case BOTTYPE_RANDOMEXCLUDE:
;361:			hideBotType = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 362
;362:			hideTeam = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 363
;363:			grayBotNumber = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 364
;364:			break;
ADDRGP4 $230
JUMPV
LABELV $236
line 367
;365:
;366:		case BOTTYPE_RANDOMARENASCRIPT:
;367:			hideBotType = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 368
;368:			hideTeam = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 369
;369:			grayBotNumber = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 370
;370:         break;
ADDRGP4 $230
JUMPV
LABELV $237
line 373
;371:
;372:		case BOTTYPE_ARENASCRIPT:
;373:			grayBotNumber = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 374
;374:			grayBots = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 375
;375:			grayBotChange = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 376
;376:			break;
ADDRGP4 $230
JUMPV
LABELV $238
line 379
;377:
;378:      case BOTTYPE_SELECTARENASCRIPT:
;379:         grayBotChange = qtrue;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 380
;380:         grayBotNumber = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 381
;381:         break;
LABELV $230
line 388
;382:	}
;383:
;384:	//
;385:	// bot selection method
;386:	//
;387:
;388:	if (grayBotNumber)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $240
line 389
;389:	{
line 390
;390:		s_botcontrols.numberBots.generic.flags |= QMF_GRAYED;
ADDRLP4 48
ADDRGP4 s_botcontrols+2788+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 391
;391:		s_botcontrols.changeBots.generic.flags |= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 s_botcontrols+3152+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 392
;392:		s_botcontrols.numberOpen.generic.flags |= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 s_botcontrols+3284+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 393
;393:	}
ADDRGP4 $241
JUMPV
LABELV $240
line 395
;394:	else
;395:	{
line 396
;396:		s_botcontrols.numberBots.generic.flags &= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 s_botcontrols+2788+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 397
;397:		s_botcontrols.changeBots.generic.flags &= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 s_botcontrols+3152+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 398
;398:		s_botcontrols.numberOpen.generic.flags &= ~QMF_GRAYED;
ADDRLP4 56
ADDRGP4 s_botcontrols+3284+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 399
;399:	}
LABELV $241
line 401
;400:
;401:	if (grayBots)
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $254
line 402
;402:	{
line 403
;403:		for (i = 0; i < PLAYER_SLOTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $256
line 404
;404:			s_botcontrols.slotType[i].generic.flags |= QMF_GRAYED;
ADDRLP4 48
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+72
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 405
;405:			s_botcontrols.slotName[i].generic.flags |= QMF_GRAYED;
ADDRLP4 52
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+72
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 406
;406:			s_botcontrols.slotSkill[i].generic.flags |= QMF_GRAYED;
ADDRLP4 56
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+72
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 407
;407:			s_botcontrols.slotSelected[i].generic.flags |= QMF_GRAYED;
ADDRLP4 60
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+72
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 408
;408:		}
LABELV $257
line 403
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $256
line 410
;409:
;410:		s_botcontrols.teamLeft.generic.flags |= QMF_GRAYED;
ADDRLP4 48
ADDRGP4 s_botcontrols+4100+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 411
;411:		s_botcontrols.teamRight.generic.flags |= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 s_botcontrols+4204+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 413
;412:
;413:		StartServer_BotPage_SelectItem(-1);
CNSTI4 -1
ARGI4
ADDRGP4 StartServer_BotPage_SelectItem
CALLV
pop
line 415
;414:
;415:		s_botcontrols.actionDest.generic.flags |= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 s_botcontrols+16316+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 416
;416:		s_botcontrols.actionActivate.generic.flags |= QMF_GRAYED;
ADDRLP4 60
ADDRGP4 s_botcontrols+16448+72
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 417
;417:	}
ADDRGP4 $255
JUMPV
LABELV $254
line 419
;418:	else
;419:	{
line 420
;420:		for (i = 0; i < PLAYER_SLOTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $276
line 421
;421:			s_botcontrols.slotType[i].generic.flags &= ~QMF_GRAYED;
ADDRLP4 48
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+72
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 422
;422:			s_botcontrols.slotName[i].generic.flags &= ~QMF_GRAYED;
ADDRLP4 52
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+72
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 423
;423:			s_botcontrols.slotSkill[i].generic.flags &= ~QMF_GRAYED;
ADDRLP4 56
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+72
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 424
;424:			s_botcontrols.slotSelected[i].generic.flags &= ~QMF_GRAYED;
ADDRLP4 60
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+72
ADDP4
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
line 425
;425:		}
LABELV $277
line 420
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $276
line 427
;426:
;427:		s_botcontrols.teamLeft.generic.flags &= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 s_botcontrols+4100+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 428
;428:		s_botcontrols.teamRight.generic.flags &= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 s_botcontrols+4204+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 430
;429:
;430:		s_botcontrols.actionDest.generic.flags &= ~QMF_GRAYED;
ADDRLP4 56
ADDRGP4 s_botcontrols+16316+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 431
;431:		s_botcontrols.actionActivate.generic.flags &= ~QMF_GRAYED;
ADDRLP4 60
ADDRGP4 s_botcontrols+16448+72
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
line 432
;432:	}
LABELV $255
line 434
;433:
;434:	if (grayBotChange) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $296
line 435
;435:		s_botcontrols.changeBots.generic.flags |= QMF_GRAYED;
ADDRLP4 48
ADDRGP4 s_botcontrols+3152+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 436
;436:	}
ADDRGP4 $297
JUMPV
LABELV $296
line 437
;437:	else {
line 438
;438:		s_botcontrols.changeBots.generic.flags &= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 s_botcontrols+3152+72
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 439
;439:	}
LABELV $297
line 444
;440:
;441:	//
;442:	// left/right arrow and del controls
;443:	//
;444:	StartServer_BotPage_UpdateButtonInterface();
ADDRGP4 StartServer_BotPage_UpdateButtonInterface
CALLV
pop
line 449
;445:
;446:	//
;447:	// slot skill type
;448:	//
;449:	skill = s_botcontrols.skillType.curvalue;
ADDRLP4 8
ADDRGP4 s_botcontrols+3648+92
INDIRI4
ASGNI4
line 450
;450:	if (skill == BOTSKILL_SAME || skill == BOTSKILL_CUSTOMSINGLE) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $306
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $304
LABELV $306
line 451
;451:		s_botcontrols.skillBias.generic.flags |= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 s_botcontrols+3872+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 452
;452:	}
ADDRGP4 $305
JUMPV
LABELV $304
line 453
;453:	else {
line 454
;454:		s_botcontrols.skillBias.generic.flags &= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 s_botcontrols+3872+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 455
;455:	}
LABELV $305
line 460
;456:
;457:	//
;458:	// skill value
;459:	//
;460:	if (skill < BOTSKILL_CUSTOMSINGLE) {
ADDRLP4 8
INDIRI4
CNSTI4 2
GEI4 $311
line 461
;461:		s_botcontrols.skillValue.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 52
ADDRGP4 s_botcontrols+3780+72
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
line 462
;462:	}
ADDRGP4 $312
JUMPV
LABELV $311
line 463
;463:	else {
line 464
;464:		s_botcontrols.skillValue.generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 52
ADDRGP4 s_botcontrols+3780+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 465
;465:	}
LABELV $312
line 470
;466:
;467:	//
;468:	// team game type
;469:	//
;470:	if (hideTeam) {
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $317
line 471
;471:		s_botcontrols.teamLeft.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 52
ADDRGP4 s_botcontrols+4100+72
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 472
;472:		s_botcontrols.teamRight.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 56
ADDRGP4 s_botcontrols+4204+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 473
;473:	}
ADDRGP4 $318
JUMPV
LABELV $317
line 474
;474:	else {
line 475
;475:		s_botcontrols.teamLeft.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 52
ADDRGP4 s_botcontrols+4100+72
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
line 476
;476:		s_botcontrols.teamRight.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 56
ADDRGP4 s_botcontrols+4204+72
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
line 477
;477:	}
LABELV $318
line 482
;478:
;479:	//
;480:	// bot slots
;481:	//
;482:	for (i = 0; i < PLAYER_SLOTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $327
line 483
;483:	{
line 484
;484:		value = s_scriptdata.bot.slotType[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_scriptdata+1948+1352
ADDP4
INDIRI4
ASGNI4
line 485
;485:		if (skill >= BOTSKILL_CUSTOMSINGLE && value == SLOTTYPE_BOT && s_scriptdata.bot.name[i][0])
ADDRLP4 52
CNSTI4 2
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 52
INDIRI4
LTI4 $333
ADDRLP4 4
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $333
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $333
line 486
;486:			s_botcontrols.slotSkill[i].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 56
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+72
ADDP4
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
ADDRGP4 $334
JUMPV
LABELV $333
line 488
;487:		else
;488:			s_botcontrols.slotSkill[i].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 60
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+72
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
LABELV $334
line 490
;489:
;490:		if (value == SLOTTYPE_BOT || StartServer_IsRandomBotExclude(s_scriptdata.bot.typeSelect)) {
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $344
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 StartServer_IsRandomBotExclude
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $340
LABELV $344
line 491
;491:			s_botcontrols.slotName[i].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 68
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+72
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
line 492
;492:			StartServer_BotNameDrawn(i, qtrue);
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 StartServer_BotNameDrawn
CALLV
pop
line 493
;493:		}
ADDRGP4 $341
JUMPV
LABELV $340
line 494
;494:		else {
line 495
;495:			s_botcontrols.slotName[i].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 68
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+72
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
line 496
;496:			StartServer_BotNameDrawn(i, qfalse);
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_BotNameDrawn
CALLV
pop
line 497
;497:		}
LABELV $341
line 499
;498:
;499:		if (hideBotType)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $349
line 500
;500:			s_botcontrols.slotType[i].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 68
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+72
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
ADDRGP4 $350
JUMPV
LABELV $349
line 502
;501:		else
;502:			s_botcontrols.slotType[i].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 72
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+72
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
LABELV $350
line 504
;503:
;504:		s_botcontrols.slotSelected[i].generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 76
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+72
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 505
;505:	}
LABELV $328
line 482
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $327
line 508
;506:
;507:	// enable fight button if possible
;508:	StartServer_CheckFightReady(&s_botcontrols.common);
ADDRGP4 s_botcontrols+1076
ARGP4
ADDRGP4 StartServer_CheckFightReady
CALLI4
pop
line 514
;509:
;510:	//
;511:	// deal with player when name is hidden by spectator enabled
;512:	//
;513:
;514:	if (StartServer_IsRandomBotExclude(s_scriptdata.bot.typeSelect)) {
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 StartServer_IsRandomBotExclude
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $358
line 515
;515:		return;
ADDRGP4 $225
JUMPV
LABELV $358
line 518
;516:	}
;517:
;518:	last = PLAYER_SLOTS - 1;
ADDRLP4 20
CNSTI4 25
ASGNI4
line 519
;519:	if (!hideTeam)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $362
line 520
;520:		last = PLAYER_SLOTS_PERCOL - 1;
ADDRLP4 20
CNSTI4 12
ASGNI4
LABELV $362
line 522
;521:
;522:	if (s_botcontrols.joinAs.curvalue) {
ADDRGP4 s_botcontrols+4004+88
INDIRI4
CNSTI4 0
EQI4 $364
line 524
;523:		// player as spectator
;524:		s_botcontrols.slotType[last].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 56
CNSTI4 132
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+72
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 525
;525:		s_botcontrols.slotName[last].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 60
CNSTI4 104
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+72
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 526
;526:		s_botcontrols.slotSkill[last].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 64
CNSTI4 92
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+72
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
line 527
;527:		s_botcontrols.slotSelected[last].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 68
CNSTI4 116
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+72
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
line 528
;528:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 529
;529:	else {
line 531
;530:		// player in game
;531:		s_botcontrols.slotType[0].generic.flags &= ~QMF_HIDDEN;
ADDRLP4 56
ADDRGP4 s_botcontrols+4540+72
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTI4 -4097
CVIU4 4
BANDU4
ASGNU4
line 532
;532:		s_botcontrols.slotName[0].generic.flags &= ~QMF_HIDDEN;
ADDRLP4 60
ADDRGP4 s_botcontrols+7972+72
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTI4 -4097
CVIU4 4
BANDU4
ASGNU4
line 534
;533:
;534:		s_botcontrols.slotType[0].generic.flags |= QMF_INACTIVE;
ADDRLP4 64
ADDRGP4 s_botcontrols+4540+72
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 535
;535:		s_botcontrols.slotName[0].generic.flags |= QMF_INACTIVE;
ADDRLP4 68
ADDRGP4 s_botcontrols+7972+72
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 536
;536:		s_botcontrols.slotSkill[0].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 72
ADDRGP4 s_botcontrols+10676+72
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 537
;537:		s_botcontrols.slotSelected[0].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 76
ADDRGP4 s_botcontrols+13068+72
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 538
;538:	}
LABELV $365
line 539
;539:}
LABELV $225
endproc StartServer_BotPage_UpdateInterface 80 12
proc StartServer_BotPage_CopySlotTypeToInterface 8 0
line 549
;540:
;541:
;542:
;543:/*
;544:=================
;545:StartServer_BotPage_CopySlotTypeToInterface
;546:=================
;547:*/
;548:static void StartServer_BotPage_CopySlotTypeToInterface(void)
;549:{
line 553
;550:	int i;
;551:
;552:	// update slot type from script data
;553:	for (i = 0; i < PLAYER_SLOTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $389
line 554
;554:	{
line 555
;555:		s_botcontrols.slotType[i].curvalue = s_scriptdata.bot.slotType[i];
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+92
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_scriptdata+1948+1352
ADDP4
INDIRI4
ASGNI4
line 556
;556:	}
LABELV $390
line 553
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $389
line 557
;557:}
LABELV $388
endproc StartServer_BotPage_CopySlotTypeToInterface 8 0
proc StartServer_BotPage_MoveToOtherTeam 0 4
line 567
;558:
;559:
;560:
;561:/*
;562:=================
;563:StartServer_BotPage_MoveToOtherTeam
;564:=================
;565:*/
;566:static void StartServer_BotPage_MoveToOtherTeam(void)
;567:{
line 568
;568:	StartServer_MoveBotToOtherTeam(s_botcontrols.selected);
ADDRGP4 s_botcontrols+16564
INDIRI4
ARGI4
ADDRGP4 StartServer_MoveBotToOtherTeam
CALLV
pop
line 570
;569:
;570:	StartServer_BotPage_CopySlotTypeToInterface();
ADDRGP4 StartServer_BotPage_CopySlotTypeToInterface
CALLV
pop
line 571
;571:}
LABELV $397
endproc StartServer_BotPage_MoveToOtherTeam 0 4
proc StartServer_BotPage_DeleteSlot 4 4
line 580
;572:
;573:
;574:/*
;575:=================
;576:StartServer_BotPage_DeleteSlot
;577:=================
;578:*/
;579:static void StartServer_BotPage_DeleteSlot(int index)
;580:{
line 581
;581:	if (!StartServer_DeleteBotSlot(index))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 StartServer_DeleteBotSlot
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $400
line 582
;582:		return;
ADDRGP4 $399
JUMPV
LABELV $400
line 585
;583:
;584:	// update slot type from script data
;585:	StartServer_BotPage_CopySlotTypeToInterface();
ADDRGP4 StartServer_BotPage_CopySlotTypeToInterface
CALLV
pop
line 587
;586:
;587:	if (s_botcontrols.selected > index) {
ADDRGP4 s_botcontrols+16564
INDIRI4
ADDRFP4 0
INDIRI4
LEI4 $402
line 588
;588:		StartServer_BotPage_SelectItem(s_botcontrols.selected - 1);
ADDRGP4 s_botcontrols+16564
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 StartServer_BotPage_SelectItem
CALLV
pop
line 589
;589:	}
LABELV $402
line 590
;590:}
LABELV $399
endproc StartServer_BotPage_DeleteSlot 4 4
proc StartServer_BotPage_InsertSlot 4 4
line 599
;591:
;592:
;593:/*
;594:=================
;595:StartServer_BotPage_InsertSlot
;596:=================
;597:*/
;598:static void StartServer_BotPage_InsertSlot(int index)
;599:{
line 600
;600:	if (!StartServer_InsertBotSlot(index))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 StartServer_InsertBotSlot
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $407
line 601
;601:		return;
ADDRGP4 $406
JUMPV
LABELV $407
line 604
;602:
;603:	// update slot type from script data
;604:	StartServer_BotPage_CopySlotTypeToInterface();
ADDRGP4 StartServer_BotPage_CopySlotTypeToInterface
CALLV
pop
line 606
;605:
;606:	if (index <= s_botcontrols.selected) {
ADDRFP4 0
INDIRI4
ADDRGP4 s_botcontrols+16564
INDIRI4
GTI4 $409
line 607
;607:		StartServer_BotPage_SelectItem(s_botcontrols.selected + 1);
ADDRGP4 s_botcontrols+16564
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 StartServer_BotPage_SelectItem
CALLV
pop
line 608
;608:	}
LABELV $409
line 609
;609:}
LABELV $406
endproc StartServer_BotPage_InsertSlot 4 4
proc StartServer_BotPage_SetPlayerNamedSlot 4 4
line 618
;610:
;611:
;612:/*
;613:=================
;614:StartServer_BotPage_SetPlayerNamedSlot
;615:=================
;616:*/
;617:static void StartServer_BotPage_SetPlayerNamedSlot(void)
;618:{
line 619
;619:	if (StartServer_IsRandomBotExclude(s_scriptdata.bot.typeSelect))
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 StartServer_IsRandomBotExclude
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $414
line 620
;620:	{
line 621
;621:		return;
ADDRGP4 $413
JUMPV
LABELV $414
line 625
;622:	}
;623:
;624:
;625:	if (s_scriptdata.bot.joinAs && s_scriptdata.bot.slotType[0] == SLOTTYPE_HUMAN)
ADDRGP4 s_scriptdata+1948+1464
INDIRI4
CNSTI4 0
EQI4 $418
ADDRGP4 s_scriptdata+1948+1352
INDIRI4
CNSTI4 1
NEI4 $418
line 626
;626:	{
line 627
;627:		StartServer_BotPage_DeleteSlot(0);
CNSTI4 0
ARGI4
ADDRGP4 StartServer_BotPage_DeleteSlot
CALLV
pop
line 628
;628:		StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 629
;629:		return;
ADDRGP4 $413
JUMPV
LABELV $418
line 632
;630:	}
;631:
;632:	if (s_scriptdata.bot.slotType[0] != SLOTTYPE_HUMAN)
ADDRGP4 s_scriptdata+1948+1352
INDIRI4
CNSTI4 1
EQI4 $424
line 633
;633:	{
line 634
;634:		StartServer_BotPage_InsertSlot(0);
CNSTI4 0
ARGI4
ADDRGP4 StartServer_BotPage_InsertSlot
CALLV
pop
line 635
;635:		s_scriptdata.bot.slotType[0] = SLOTTYPE_HUMAN;
ADDRGP4 s_scriptdata+1948+1352
CNSTI4 1
ASGNI4
line 636
;636:		s_botcontrols.slotType[0].curvalue = s_scriptdata.bot.slotType[0];
ADDRGP4 s_botcontrols+4540+92
ADDRGP4 s_scriptdata+1948+1352
INDIRI4
ASGNI4
line 637
;637:		StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 638
;638:	}
LABELV $424
line 639
;639:}
LABELV $413
endproc StartServer_BotPage_SetPlayerNamedSlot 4 4
proc StartServer_BotPage_ValidateSlotCount 24 12
line 650
;640:
;641:
;642:
;643:
;644:/*
;645:=================
;646:StartServer_BotPage_ValidateSlotCount
;647:=================
;648:*/
;649:static void StartServer_BotPage_ValidateSlotCount(void)
;650:{
line 653
;651:	int bots, open;
;652:
;653:	bots = atoi(s_botcontrols.numberBots.field.buffer);
ADDRGP4 s_botcontrols+2788+88+12
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 654
;654:	open = atoi(s_botcontrols.numberOpen.field.buffer);
ADDRGP4 s_botcontrols+3284+88+12
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 656
;655:
;656:    StartServer_ValidateBotSlotCount(bots, open);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 StartServer_ValidateBotSlotCount
CALLV
pop
line 658
;657:
;658:	Q_strncpyz(s_botcontrols.numberBots.field.buffer, va("%i", s_scriptdata.bot.numberBots), 4);
ADDRGP4 $444
ARGP4
ADDRGP4 s_scriptdata+1948+1468
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_botcontrols+2788+88+12
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 659
;659:	Q_strncpyz(s_botcontrols.numberOpen.field.buffer, va("%i", s_scriptdata.bot.numberOpen), 4);
ADDRGP4 $444
ARGP4
ADDRGP4 s_scriptdata+1948+1460
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_botcontrols+3284+88+12
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 660
;660:}
LABELV $434
endproc StartServer_BotPage_ValidateSlotCount 24 12
proc StartServer_BotPage_HandleGoAction 4 8
line 670
;661:
;662:
;663:
;664:/*
;665:=================
;666:StartServer_BotPage_HandleGoAction
;667:=================
;668:*/
;669:static void StartServer_BotPage_HandleGoAction(void)
;670:{
line 673
;671:	int i;
;672:
;673:	StartServer_DoBotAction(s_botcontrols.actionDest.curvalue, s_botcontrols.selected);
ADDRGP4 s_botcontrols+16316+92
INDIRI4
ARGI4
ADDRGP4 s_botcontrols+16564
INDIRI4
ARGI4
ADDRGP4 StartServer_DoBotAction
CALLV
pop
line 675
;674:
;675:	StartServer_BotPage_CopySlotTypeToInterface();
ADDRGP4 StartServer_BotPage_CopySlotTypeToInterface
CALLV
pop
line 676
;676:	StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 677
;677:}
LABELV $452
endproc StartServer_BotPage_HandleGoAction 4 8
export StartServer_BotPage_Cache
proc StartServer_BotPage_Cache 0 4
line 687
;678:
;679:
;680:
;681:/*
;682:=================
;683:StartServer_BotPage_Cache
;684:=================
;685:*/
;686:void StartServer_BotPage_Cache( void )
;687:{
line 688
;688:	trap_R_RegisterShaderNoMip( BOTSELECT_SWAPARROWS0 );
ADDRGP4 $457
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 689
;689:	trap_R_RegisterShaderNoMip( BOTSELECT_SWAPARROWS1 );
ADDRGP4 $458
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 690
;690:	trap_R_RegisterShaderNoMip( BOTSELECT_DEL0 );
ADDRGP4 $459
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 691
;691:	trap_R_RegisterShaderNoMip( BOTSELECT_DEL1 );
ADDRGP4 $460
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 692
;692:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECT );
ADDRGP4 $461
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 693
;693:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECTED0 );
ADDRGP4 $462
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 694
;694:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECTED1 );
ADDRGP4 $463
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 695
;695:	trap_R_RegisterShaderNoMip( GAMESERVER_ACTION0 );
ADDRGP4 $464
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 696
;696:	trap_R_RegisterShaderNoMip( GAMESERVER_ACTION1 );
ADDRGP4 $465
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 697
;697:}
LABELV $456
endproc StartServer_BotPage_Cache 0 4
proc StartServer_BotPage_SetTeamTitle 40 8
line 708
;698:
;699:
;700:
;701:
;702:/*
;703:=================
;704:StartServer_BotPage_SetTeamTitle
;705:=================
;706:*/
;707:static void StartServer_BotPage_SetTeamTitle(int swapped)
;708:{
line 715
;709:	int x, w;
;710:	char* string;
;711:	float* color;
;712:	menutext_s *red, *blue;
;713:	float sizeScale;
;714:
;715:	if (swapped == -1) {
ADDRFP4 0
INDIRI4
CNSTI4 -1
NEI4 $467
line 717
;716:		// toggle values
;717:		if (s_scriptdata.bot.teamSwapped)
ADDRGP4 s_scriptdata+1948+1500
INDIRI4
CNSTI4 0
EQI4 $469
line 718
;718:			swapped = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $470
JUMPV
LABELV $469
line 720
;719:		else
;720:			swapped = 1;
ADDRFP4 0
CNSTI4 1
ASGNI4
LABELV $470
line 721
;721:	}
LABELV $467
line 723
;722:
;723:	if (swapped == 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $473
line 725
;724:		// default
;725:		red = &s_botcontrols.teamLeft;
ADDRLP4 4
ADDRGP4 s_botcontrols+4100
ASGNP4
line 726
;726:		blue = &s_botcontrols.teamRight;
ADDRLP4 8
ADDRGP4 s_botcontrols+4204
ASGNP4
line 727
;727:		s_scriptdata.bot.teamSwapped = qfalse;
ADDRGP4 s_scriptdata+1948+1500
CNSTI4 0
ASGNI4
line 728
;728:	} else {
ADDRGP4 $474
JUMPV
LABELV $473
line 730
;729:		// swapped
;730:		blue = &s_botcontrols.teamLeft;
ADDRLP4 8
ADDRGP4 s_botcontrols+4100
ASGNP4
line 731
;731:		red = &s_botcontrols.teamRight;
ADDRLP4 4
ADDRGP4 s_botcontrols+4204
ASGNP4
line 732
;732:		s_scriptdata.bot.teamSwapped = qtrue;
ADDRGP4 s_scriptdata+1948+1500
CNSTI4 1
ASGNI4
line 733
;733:	}
LABELV $474
line 734
;734:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $483
line 735
;735:	red->string = "Team Red";
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 $486
ASGNP4
line 736
;736:	blue->string = "Team Blue";
ADDRLP4 8
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 $487
ASGNP4
line 737
;737:	}
LABELV $483
line 738
;738:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $488
line 739
;739:	red->string = "Красная команда";
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 $491
ASGNP4
line 740
;740:	blue->string = "Синяя команда";
ADDRLP4 8
INDIRP4
CNSTI4 88
ADDP4
ADDRGP4 $492
ASGNP4
line 741
;741:	}
LABELV $488
line 742
;742:	red->color = color_realred;
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
ADDRGP4 color_realred
ASGNP4
line 743
;743:	blue->color = color_blue;
ADDRLP4 8
INDIRP4
CNSTI4 100
ADDP4
ADDRGP4 color_blue
ASGNP4
line 745
;744:
;745:	sizeScale = UI_ProportionalSizeScale( red->style, 0 );
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 28
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 747
;746:
;747:	x = red->generic.x;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 748
;748:	w = UI_ProportionalStringWidth( red->string ) * sizeScale;
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
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
ADDRLP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 749
;749:	x -= w/2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 751
;750:
;751:	red->generic.left   = x - PROP_GAP_WIDTH * sizeScale;
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRGP4 cl_propgapwidth+12
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 752
;752:	red->generic.right  = x + w + PROP_GAP_WIDTH * sizeScale;
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
CVIF4 4
ADDRGP4 cl_propgapwidth+12
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 754
;753:
;754:	x = blue->generic.x;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 755
;755:	w = UI_ProportionalStringWidth( blue->string ) * sizeScale;
ADDRLP4 8
INDIRP4
CNSTI4 88
ADDP4
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
ADDRLP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 756
;756:	x -= w/2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 758
;757:
;758:	blue->generic.left   = x - PROP_GAP_WIDTH * sizeScale;
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRGP4 cl_propgapwidth+12
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 759
;759:	blue->generic.right  = x + w + PROP_GAP_WIDTH * sizeScale;
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
CVIF4 4
ADDRGP4 cl_propgapwidth+12
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 760
;760:}
LABELV $466
endproc StartServer_BotPage_SetTeamTitle 40 8
proc StartServer_BotPage_InitControlsFromScript 32 12
line 771
;761:
;762:
;763:
;764:
;765:/*
;766:=================
;767:StartServer_BotPage_InitControlsFromScript
;768:=================
;769:*/
;770:static void StartServer_BotPage_InitControlsFromScript(void)
;771:{
line 782
;772:	char* s;
;773:	int i, value, max;
;774:	botskill_t* b;
;775:
;776:
;777:	//
;778:	// load state values
;779:	//
;780:
;781:	// method of selecting bots
;782:	s_botcontrols.botTypeSelect.curvalue = s_scriptdata.bot.typeSelect;
ADDRGP4 s_botcontrols+2656+92
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ASGNI4
line 785
;783:
;784:	// number of bots if randomly generated
;785:	Q_strncpyz(s_botcontrols.numberBots.field.buffer, va("%i", s_scriptdata.bot.numberBots), 4);
ADDRGP4 $444
ARGP4
ADDRGP4 s_scriptdata+1948+1468
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_botcontrols+2788+88+12
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 788
;786:
;787:	// frequency of bot changing on maps
;788:	s_botcontrols.changeBots.curvalue = s_scriptdata.bot.changeBots;
ADDRGP4 s_botcontrols+3152+92
ADDRGP4 s_scriptdata+1948+1472
INDIRI4
ASGNI4
line 791
;789:
;790:	// number of open slots if bots are randomly selected
;791:	Q_strncpyz(s_botcontrols.numberOpen.field.buffer, va("%i", s_scriptdata.bot.numberOpen), 4);
ADDRGP4 $444
ARGP4
ADDRGP4 s_scriptdata+1948+1460
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 s_botcontrols+3284+88+12
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 794
;792:
;793:	// skill selection method for bots
;794:	s_botcontrols.skillType.curvalue = s_scriptdata.bot.skillType;
ADDRGP4 s_botcontrols+3648+92
ADDRGP4 s_scriptdata+1948+1476
INDIRI4
ASGNI4
line 797
;795:
;796:	// skill bias
;797:	s_botcontrols.skillBias.curvalue = s_scriptdata.bot.skillBias;
ADDRGP4 s_botcontrols+3872+92
ADDRGP4 s_scriptdata+1948+1480
INDIRI4
ASGNI4
line 800
;798:
;799:	// join game as
;800:	s_botcontrols.joinAs.curvalue = s_scriptdata.bot.joinAs;
ADDRGP4 s_botcontrols+4004+88
ADDRGP4 s_scriptdata+1948+1464
INDIRI4
ASGNI4
line 803
;801:
;802:	// nothing selected
;803:	StartServer_BotPage_SelectItem(-1);
CNSTI4 -1
ARGI4
ADDRGP4 StartServer_BotPage_SelectItem
CALLV
pop
line 806
;804:
;805:	// swap teams
;806:	if (s_scriptdata.gametype >= GT_TEAM && !(s_scriptdata.gametype == GT_LMS) ) {
ADDRLP4 28
ADDRGP4 s_scriptdata
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 4
LTI4 $528
ADDRLP4 28
INDIRI4
CNSTI4 11
EQI4 $528
line 807
;807:		StartServer_BotPage_SetTeamTitle(s_scriptdata.bot.teamSwapped);
ADDRGP4 s_scriptdata+1948+1500
INDIRI4
ARGI4
ADDRGP4 StartServer_BotPage_SetTeamTitle
CALLV
pop
line 808
;808:	}
LABELV $528
line 810
;809:
;810:	StartServer_BotPage_CopySlotTypeToInterface();
ADDRGP4 StartServer_BotPage_CopySlotTypeToInterface
CALLV
pop
line 811
;811:}
LABELV $497
endproc StartServer_BotPage_InitControlsFromScript 32 12
proc StartServer_BotPage_InitSkillControl 12 0
line 822
;812:
;813:
;814:
;815:
;816:/*
;817:=================
;818:StartServer_BotPage_InitSkillControl
;819:=================
;820:*/
;821:static void StartServer_BotPage_InitSkillControl(menuskill_s* s)
;822:{
line 825
;823:	int x, y, h;
;824:
;825:	x = s->generic.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 826
;826:	y = s->generic.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 827
;827:	h = BOT_ICONY;
ADDRLP4 0
ADDRGP4 cl_smallcharheight+12
INDIRI4
ASGNI4
line 828
;828:	if (h < SMALLCHAR_HEIGHT)
ADDRLP4 0
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
GEI4 $534
line 829
;829:		h = SMALLCHAR_HEIGHT;
ADDRLP4 0
ADDRGP4 cl_smallcharheight+12
INDIRI4
ASGNI4
LABELV $534
line 831
;830:
;831:	s->generic.left = x;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 832
;832:	s->generic.top = y;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 833
;833:	s->generic.right = x + (2*BOT_ICONX) + (3*SMALLCHAR_WIDTH);
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 1
LSHI4
ADDI4
CNSTI4 3
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 834
;834:	s->generic.bottom = y + h;
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 835
;835:}
LABELV $532
endproc StartServer_BotPage_InitSkillControl 12 0
proc StartServer_BotPage_LoadBotNameList 0 4
line 848
;836:
;837:
;838:
;839:/*
;840:=================
;841:StartServer_BotPage_LoadBotNameList
;842:
;843:Specialist interface init, used when user has
;844:toggled type of bot selection.
;845:=================
;846:*/
;847:static void StartServer_BotPage_LoadBotNameList(int type)
;848:{
line 849
;849:	StartServer_LoadBotNameList(type);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 StartServer_LoadBotNameList
CALLV
pop
line 853
;850:
;851:	// its possible for StartServer_LoadBotNameList() to change the
;852:	// selection type, so we recover that change here
;853:	s_botcontrols.botTypeSelect.curvalue = s_scriptdata.bot.typeSelect;
ADDRGP4 s_botcontrols+2656+92
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ASGNI4
line 855
;854:
;855:	StartServer_BotPage_CopySlotTypeToInterface();
ADDRGP4 StartServer_BotPage_CopySlotTypeToInterface
CALLV
pop
line 856
;856:}
LABELV $540
endproc StartServer_BotPage_LoadBotNameList 0 4
proc StartServer_BotPage_Load 8 12
line 865
;857:
;858:
;859:/*
;860:=================
;861:StartServer_BotPage_Load
;862:=================
;863:*/
;864:static void StartServer_BotPage_Load(void)
;865:{
line 868
;866:	int i;
;867:
;868:	s_botcontrols.botGameType.curvalue = s_scriptdata.gametype;
ADDRGP4 s_botcontrols+2408+92
ADDRGP4 s_scriptdata
INDIRI4
ASGNI4
line 870
;869:
;870:	Q_strncpyz( s_botcontrols.playername, UI_Cvar_VariableString("name"), MAX_NAME_LENGTH );
ADDRGP4 $549
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_botcontrols+16768
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 872
;871:
;872:	StartServer_BotPage_InitControlsFromScript();
ADDRGP4 StartServer_BotPage_InitControlsFromScript
CALLV
pop
line 873
;873:	StartServer_BotPage_SetSkillRangeType();
ADDRGP4 StartServer_BotPage_SetSkillRangeType
CALLV
pop
line 874
;874:}
LABELV $545
endproc StartServer_BotPage_Load 8 12
proc StartServer_BotPage_Save 0 0
line 884
;875:
;876:
;877:
;878:/*
;879:=================
;880:StartServer_BotPage_Save
;881:=================
;882:*/
;883:static void StartServer_BotPage_Save(void)
;884:{
line 885
;885:	StartServer_SaveScriptData();
ADDRGP4 StartServer_SaveScriptData
CALLV
pop
line 886
;886:}
LABELV $550
endproc StartServer_BotPage_Save 0 0
proc StartServer_BotPage_DrawStatusBarText 24 20
line 897
;887:
;888:
;889:
;890:
;891:/*
;892:=================
;893:StartServer_BotPage_DrawStatusBarText
;894:=================
;895:*/
;896:static void StartServer_BotPage_DrawStatusBarText( void )
;897:{
line 902
;898:	vec4_t color;
;899:	int fade;
;900:	float fadecol;
;901:
;902:	if (uis.realtime > s_botcontrols.savetime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 s_botcontrols+16576
INDIRI4
LEI4 $552
line 903
;903:		return;
ADDRGP4 $551
JUMPV
LABELV $552
line 905
;904:
;905:	if (!s_botcontrols.statusbar_message[0])
ADDRGP4 s_botcontrols+16580
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $556
line 906
;906:		return;
ADDRGP4 $551
JUMPV
LABELV $556
line 908
;907:
;908:	fade = s_botcontrols.savetime - uis.realtime;
ADDRLP4 16
ADDRGP4 s_botcontrols+16576
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
line 910
;909:
;910:	fadecol = (float)fade/STATUSBAR_FADETIME;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CVIF4 4
CNSTF4 1153138688
DIVF4
ASGNF4
line 912
;911:
;912:	color[0] = 1.0;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 913
;913:	color[1] = 1.0;
ADDRLP4 0+4
CNSTF4 1065353216
ASGNF4
line 914
;914:	color[2] = 1.0;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 915
;915:	color[3] = fadecol;
ADDRLP4 0+12
ADDRLP4 20
INDIRF4
ASGNF4
line 917
;916:
;917:	UI_DrawString(320, s_botcontrols.statusbar_height,
CNSTI4 320
ARGI4
ADDRGP4 s_botcontrols+16572
INDIRI4
ARGI4
ADDRGP4 s_botcontrols+16580
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 919
;918:		s_botcontrols.statusbar_message, UI_CENTER|UI_SMALLFONT, color);
;919:}
LABELV $551
endproc StartServer_BotPage_DrawStatusBarText 24 20
proc StartServer_BotPage_SetStatusBar 0 12
line 929
;920:
;921:
;922:
;923:/*
;924:=================
;925:StartServer_BotPage_SetStatusBar
;926:=================
;927:*/
;928:static void StartServer_BotPage_SetStatusBar( const char* text )
;929:{
line 930
;930:	s_botcontrols.savetime = uis.realtime + STATUSBAR_FADETIME;
ADDRGP4 s_botcontrols+16576
ADDRGP4 uis+4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 931
;931:	if (text)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $569
line 932
;932:		Q_strncpyz(s_botcontrols.statusbar_message, text, MAX_STATUSBAR_TEXT);
ADDRGP4 s_botcontrols+16580
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 120
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $569
line 933
;933:}
LABELV $566
endproc StartServer_BotPage_SetStatusBar 0 12
proc StartServer_BotPage_StatusBar 16 4
line 944
;934:
;935:
;936:
;937:
;938:/*
;939:=================
;940:StartServer_BotPage_StatusBar
;941:=================
;942:*/
;943:static void StartServer_BotPage_StatusBar(void* ptr)
;944:{
line 945
;945:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $573
line 946
;946:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 100
EQI4 $579
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $595
ADDRGP4 $576
JUMPV
LABELV $579
line 948
;947:	case ID_BOT_TYPE:
;948:		switch (s_scriptdata.bot.typeSelect) {
ADDRLP4 8
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $577
ADDRLP4 8
INDIRI4
CNSTI4 4
GTI4 $577
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $594
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $594
address $584
address $586
address $588
address $590
address $592
code
LABELV $584
line 950
;949:		case BOTTYPE_SELECT:
;950:			StartServer_BotPage_SetStatusBar("Same bots for all maps");
ADDRGP4 $585
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 951
;951:			break;
ADDRGP4 $577
JUMPV
LABELV $586
line 953
;952:		case BOTTYPE_RANDOM:
;953:			StartServer_BotPage_SetStatusBar("Randomly picked bots for all maps");
ADDRGP4 $587
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 954
;954:			break;
ADDRGP4 $577
JUMPV
LABELV $588
line 956
;955:		case BOTTYPE_RANDOMEXCLUDE:
;956:			StartServer_BotPage_SetStatusBar("Randomly picked bots, but exclude least favourite");
ADDRGP4 $589
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 957
;957:			break;
ADDRGP4 $577
JUMPV
LABELV $590
line 959
;958:		case BOTTYPE_RANDOMARENASCRIPT:
;959:			StartServer_BotPage_SetStatusBar("Replace map recommended bots with random ones");
ADDRGP4 $591
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 960
;960:			break;
ADDRGP4 $577
JUMPV
LABELV $592
line 962
;961:		case BOTTYPE_ARENASCRIPT:
;962:			StartServer_BotPage_SetStatusBar("Use map recommended bots");
ADDRGP4 $593
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 963
;963:			break;
line 965
;964:		}
;965:		break;
ADDRGP4 $577
JUMPV
LABELV $595
line 968
;966:
;967:		case ID_BOT_BOTNUMBER:
;968:		if (StartServer_IsBotArenaScript(s_scriptdata.bot.typeSelect))
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 StartServer_IsBotArenaScript
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $577
line 969
;969:			StartServer_BotPage_SetStatusBar("Number of bots if arena script has none");
ADDRGP4 $600
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 970
;970:		break;
LABELV $576
LABELV $577
line 971
;971:		};
line 972
;972:	}
LABELV $573
line 973
;973:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $601
line 974
;974:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 100
EQI4 $607
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $623
ADDRGP4 $604
JUMPV
LABELV $607
line 976
;975:	case ID_BOT_TYPE:
;976:		switch (s_scriptdata.bot.typeSelect) {
ADDRLP4 8
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $605
ADDRLP4 8
INDIRI4
CNSTI4 4
GTI4 $605
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $622
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $622
address $612
address $614
address $616
address $618
address $620
code
LABELV $612
line 978
;977:		case BOTTYPE_SELECT:
;978:			StartServer_BotPage_SetStatusBar("Одни и те же боты для всех карт");
ADDRGP4 $613
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 979
;979:			break;
ADDRGP4 $605
JUMPV
LABELV $614
line 981
;980:		case BOTTYPE_RANDOM:
;981:			StartServer_BotPage_SetStatusBar("Случайно выбранные боты для всех карт");
ADDRGP4 $615
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 982
;982:			break;
ADDRGP4 $605
JUMPV
LABELV $616
line 984
;983:		case BOTTYPE_RANDOMEXCLUDE:
;984:			StartServer_BotPage_SetStatusBar("Боты выбраны случайным образом, но исключены наименее любимые");
ADDRGP4 $617
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 985
;985:			break;
ADDRGP4 $605
JUMPV
LABELV $618
line 987
;986:		case BOTTYPE_RANDOMARENASCRIPT:
;987:			StartServer_BotPage_SetStatusBar("Замените рекомендованных карт ботов случайными");
ADDRGP4 $619
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 988
;988:			break;
ADDRGP4 $605
JUMPV
LABELV $620
line 990
;989:		case BOTTYPE_ARENASCRIPT:
;990:			StartServer_BotPage_SetStatusBar("Используйте ботов, рекомендованных картой");
ADDRGP4 $621
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 991
;991:			break;
line 993
;992:		}
;993:		break;
ADDRGP4 $605
JUMPV
LABELV $623
line 996
;994:
;995:		case ID_BOT_BOTNUMBER:
;996:		if (StartServer_IsBotArenaScript(s_scriptdata.bot.typeSelect))
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 StartServer_IsBotArenaScript
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $605
line 997
;997:			StartServer_BotPage_SetStatusBar("Количество ботов, если в скрипте арены их нет");
ADDRGP4 $628
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 998
;998:		break;
LABELV $604
LABELV $605
line 999
;999:		};
line 1000
;1000:	}
LABELV $601
line 1001
;1001:}
LABELV $572
endproc StartServer_BotPage_StatusBar 16 4
proc StartServer_BotPage_SkillOffset 0 0
line 1013
;1002:
;1003:
;1004:
;1005:
;1006:
;1007:/*
;1008:=================
;1009:StartServer_BotPage_SkillOffset
;1010:=================
;1011:*/
;1012:static int StartServer_BotPage_SkillOffset(qboolean range)
;1013:{
line 1014
;1014:	if (range) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $630
line 1015
;1015:		return (BOT_ICONX + 2*SMALLCHAR_WIDTH);
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 1
LSHI4
ADDI4
RETI4
ADDRGP4 $629
JUMPV
LABELV $630
line 1018
;1016:	}
;1017:
;1018:	 return (BOT_ICONX + 2*SMALLCHAR_WIDTH) / 2;
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 1
LSHI4
ADDI4
CNSTI4 2
DIVI4
RETI4
LABELV $629
endproc StartServer_BotPage_SkillOffset 0 0
proc StartServer_BotPage_OverSkillHotspot 28 16
line 1027
;1019:}
;1020:
;1021:/*
;1022:=================
;1023:StartServer_BotPage_OverSkillHotspot
;1024:=================
;1025:*/
;1026:static int StartServer_BotPage_OverSkillHotspot(menuskill_s* s)
;1027:{
line 1030
;1028:	int x, y, w, h;
;1029:
;1030:	x = s->generic.left;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1031
;1031:	y = s->generic.top;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 1032
;1032:	w = s->generic.right - x;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 1033
;1033:	h = s->generic.bottom - y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1035
;1034:
;1035:	if (s->data->range && UI_CursorInRect(x, y, BOT_ICONX + SMALLCHAR_WIDTH, h))
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $637
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $637
line 1036
;1036:		return MSKILL_LEFT;
CNSTI4 1
RETI4
ADDRGP4 $636
JUMPV
LABELV $637
line 1038
;1037:
;1038:	x += StartServer_BotPage_SkillOffset(s->data->range);
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 StartServer_BotPage_SkillOffset
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 1040
;1039:
;1040:	if (UI_CursorInRect(x, y, BOT_ICONX + SMALLCHAR_WIDTH, h))
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $641
line 1041
;1041:		return MSKILL_RIGHT;
CNSTI4 2
RETI4
ADDRGP4 $636
JUMPV
LABELV $641
line 1043
;1042:
;1043:	return MSKILL_NONE;
CNSTI4 0
RETI4
LABELV $636
endproc StartServer_BotPage_OverSkillHotspot 28 16
proc StartServer_BotPage_SkillStatusBar 16 4
line 1054
;1044:}
;1045:
;1046:
;1047:
;1048:/*
;1049:=================
;1050:StartServer_BotPage_SkillStatusBar
;1051:=================
;1052:*/
;1053:static void StartServer_BotPage_SkillStatusBar(void* self)
;1054:{
line 1058
;1055:	menuskill_s* s;
;1056:	int index, cursor;
;1057:
;1058:	s = (menuskill_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1059
;1059:	cursor = StartServer_BotPage_OverSkillHotspot(s);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 StartServer_BotPage_OverSkillHotspot
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 1061
;1060:
;1061:	if (cursor == MSKILL_NONE)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $646
line 1062
;1062:		return;
ADDRGP4 $645
JUMPV
LABELV $646
line 1064
;1063:
;1064:	if (s->data->range) {
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $648
line 1065
;1065:		if (cursor == MSKILL_LEFT)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $650
line 1066
;1066:			index = s->data->low;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $649
JUMPV
LABELV $650
line 1068
;1067:		else
;1068:			index = s->data->high;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1069
;1069:	}
ADDRGP4 $649
JUMPV
LABELV $648
line 1071
;1070:	else
;1071:		index = s->data->value;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
LABELV $649
line 1072
;1072:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $652
line 1073
;1073:	StartServer_BotPage_SetStatusBar(skill_items[index]);
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skill_items
ADDP4
INDIRP4
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 1074
;1074:	}
LABELV $652
line 1075
;1075:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $655
line 1076
;1076:	StartServer_BotPage_SetStatusBar(skill_itemsru[index]);
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skill_itemsru
ADDP4
INDIRP4
ARGP4
ADDRGP4 StartServer_BotPage_SetStatusBar
CALLV
pop
line 1077
;1077:	}
LABELV $655
line 1079
;1078://	UI_DrawString(320, s_botcontrols.statusbar_height, skill_items[index] , UI_CENTER|UI_SMALLFONT, color_white);
;1079:}
LABELV $645
endproc StartServer_BotPage_SkillStatusBar 16 4
proc StartServer_BotPage_SkillDraw 104 20
line 1088
;1080:
;1081:
;1082:/*
;1083:=================
;1084:StartServer_BotPage_SkillDraw
;1085:=================
;1086:*/
;1087:static void StartServer_BotPage_SkillDraw(void* self)
;1088:{
line 1097
;1089:	int skill;
;1090:	menuskill_s* s;
;1091:	int x, y, w, h;
;1092:	int shader_y, cursor;
;1093:	qhandle_t shader;
;1094:	vec4_t temp_bkcolor, tempcolor;
;1095:	float* color;
;1096:
;1097:	s = (menuskill_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1098
;1098:	x = s->generic.left;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1099
;1099:	y = s->generic.top;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 1100
;1100:	w = s->generic.right - x;
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1101
;1101:	h = s->generic.bottom - y;
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1103
;1102:
;1103:	temp_bkcolor[0] = listbar_color[0];
ADDRLP4 32
ADDRGP4 listbar_color
INDIRF4
ASGNF4
line 1104
;1104:	temp_bkcolor[1] = listbar_color[1];
ADDRLP4 32+4
ADDRGP4 listbar_color+4
INDIRF4
ASGNF4
line 1105
;1105:	temp_bkcolor[2] = listbar_color[2];
ADDRLP4 32+8
ADDRGP4 listbar_color+8
INDIRF4
ASGNF4
line 1106
;1106:	temp_bkcolor[3] = 0.3 + 0.3*sin(uis.realtime/PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 72
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 32+12
CNSTF4 1050253722
ADDRLP4 72
INDIRF4
MULF4
CNSTF4 1050253722
ADDF4
ASGNF4
line 1108
;1107:
;1108:	tempcolor[0] = text_color_highlight[0];
ADDRLP4 12
ADDRGP4 text_color_highlight
INDIRF4
ASGNF4
line 1109
;1109:	tempcolor[1] = text_color_highlight[1];
ADDRLP4 12+4
ADDRGP4 text_color_highlight+4
INDIRF4
ASGNF4
line 1110
;1110:	tempcolor[2] = text_color_highlight[2];
ADDRLP4 12+8
ADDRGP4 text_color_highlight+8
INDIRF4
ASGNF4
line 1111
;1111:	tempcolor[3] = 0.7 + 0.3*sin(uis.realtime/PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 76
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 12+12
CNSTF4 1050253722
ADDRLP4 76
INDIRF4
MULF4
CNSTF4 1060320051
ADDF4
ASGNF4
line 1113
;1112:
;1113:	pulsecolor[3] = tempcolor[3];
ADDRGP4 pulsecolor+12
ADDRLP4 12+12
INDIRF4
ASGNF4
line 1115
;1114:
;1115:	cursor = StartServer_BotPage_OverSkillHotspot(s);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 StartServer_BotPage_OverSkillHotspot
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 80
INDIRI4
ASGNI4
line 1118
;1116:
;1117:	// draw left side of control
;1118:	shader_y = y + (h - BOT_ICONY)/2;
ADDRLP4 60
ADDRLP4 8
INDIRI4
ADDRLP4 64
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1119
;1119:	if (s->data->range) {
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $674
line 1120
;1120:		skill = s->data->low + 1;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1121
;1121:		shader = trap_R_RegisterShaderNoMip(va("menu/art/skill%i", skill));
ADDRGP4 $676
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 88
INDIRI4
ASGNI4
line 1123
;1122:
;1123:		if (s->generic.flags & QMF_GRAYED) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $677
line 1124
;1124:			color = text_color_disabled;
ADDRLP4 56
ADDRGP4 text_color_disabled
ASGNP4
line 1126
;1125:
;1126:			trap_R_SetColor( menu_dim_color);
ADDRGP4 menu_dim_color
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1127
;1127:			UI_DrawHandlePic(x, shader_y, BOT_ICONX, BOT_ICONY, shader);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1128
;1128:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1129
;1129:		}
ADDRGP4 $678
JUMPV
LABELV $677
line 1130
;1130:		else if (cursor == MSKILL_LEFT)
ADDRLP4 48
INDIRI4
CNSTI4 1
NEI4 $681
line 1131
;1131:		{
line 1133
;1132:			// mouse over control, "pulsing"
;1133:			UI_FillRect(x, y, BOT_ICONX + SMALLCHAR_WIDTH + 1, h + 1, temp_bkcolor);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
ADDRLP4 92
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 64
INDIRI4
ADDRLP4 92
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 32
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1134
;1134:			color = tempcolor;
ADDRLP4 56
ADDRLP4 12
ASGNP4
line 1136
;1135:
;1136:			trap_R_SetColor( pulsecolor );
ADDRGP4 pulsecolor
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1137
;1137:			UI_DrawHandlePic(x, shader_y, BOT_ICONX, BOT_ICONY, shader);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1138
;1138:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1139
;1139:		}
ADDRGP4 $682
JUMPV
LABELV $681
line 1140
;1140:		else {
line 1141
;1141:			color = text_color_normal;
ADDRLP4 56
ADDRGP4 text_color_normal
ASGNP4
line 1142
;1142:			UI_DrawHandlePic(x, shader_y, BOT_ICONX, BOT_ICONY, shader);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1143
;1143:		}
LABELV $682
LABELV $678
line 1145
;1144:
;1145:		UI_DrawString(x + BOT_ICONX, y, va("I", skill), UI_LEFT|UI_SMALLFONT, color);
ADDRGP4 $690
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1146
;1146:		UI_DrawString(x + BOT_ICONX + SMALLCHAR_WIDTH, y, "-", UI_LEFT|UI_SMALLFONT, text_color_normal);
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 $693
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1149
;1147:
;1148:		// setup for second part of skill control
;1149:		skill = s->data->high + 1;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1150
;1150:	}
ADDRGP4 $675
JUMPV
LABELV $674
line 1151
;1151:	else {
line 1152
;1152:		skill = s->data->value + 1;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1153
;1153:	}
LABELV $675
line 1155
;1154:
;1155:	if (cursor != MSKILL_NONE && cursor != s_botcontrols.hotspot) {
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $694
ADDRLP4 48
INDIRI4
ADDRGP4 s_botcontrols+16700
INDIRI4
EQI4 $694
line 1156
;1156:		trap_S_StartLocalSound( menu_move_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_move_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1157
;1157:		s_botcontrols.hotspot = cursor;
ADDRGP4 s_botcontrols+16700
ADDRLP4 48
INDIRI4
ASGNI4
line 1158
;1158:	}
LABELV $694
line 1161
;1159:
;1160:
;1161:	x += StartServer_BotPage_SkillOffset(s->data->range);
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 StartServer_BotPage_SkillOffset
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 88
INDIRI4
ADDI4
ASGNI4
line 1165
;1162:
;1163:	// draw right side of control (always drawn)
;1164:
;1165:	shader = trap_R_RegisterShaderNoMip(va("menu/art/skill%i", skill));
ADDRGP4 $676
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 96
INDIRI4
ASGNI4
line 1166
;1166:	if (s->generic.flags & QMF_GRAYED) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $698
line 1167
;1167:		color = text_color_disabled;
ADDRLP4 56
ADDRGP4 text_color_disabled
ASGNP4
line 1169
;1168:
;1169:		trap_R_SetColor( menu_dim_color);
ADDRGP4 menu_dim_color
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1170
;1170:		UI_DrawHandlePic(x, shader_y, BOT_ICONX, BOT_ICONY, shader);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1171
;1171:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1172
;1172:	}
ADDRGP4 $699
JUMPV
LABELV $698
line 1173
;1173:	else if (cursor == MSKILL_RIGHT)
ADDRLP4 48
INDIRI4
CNSTI4 2
NEI4 $702
line 1174
;1174:	{
line 1176
;1175:		// mouse over control, "pulsing"
;1176:		UI_FillRect(x, y, BOT_ICONX + SMALLCHAR_WIDTH + 1, h + 1, temp_bkcolor);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 100
CNSTI4 1
ASGNI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
ADDRLP4 100
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 64
INDIRI4
ADDRLP4 100
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 32
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1177
;1177:		color = tempcolor;
ADDRLP4 56
ADDRLP4 12
ASGNP4
line 1179
;1178:
;1179:		trap_R_SetColor( pulsecolor );
ADDRGP4 pulsecolor
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1180
;1180:		UI_DrawHandlePic(x + SMALLCHAR_WIDTH, shader_y, BOT_ICONX, BOT_ICONY, shader);
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1181
;1181:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1182
;1182:	}
ADDRGP4 $703
JUMPV
LABELV $702
line 1183
;1183:	else {
line 1184
;1184:		color = text_color_normal;
ADDRLP4 56
ADDRGP4 text_color_normal
ASGNP4
line 1185
;1185:		UI_DrawHandlePic(x + SMALLCHAR_WIDTH, shader_y, BOT_ICONX, BOT_ICONY, shader);
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1186
;1186:	}
LABELV $703
LABELV $699
line 1188
;1187:
;1188:	UI_DrawString(x, y, va("I", skill), UI_LEFT|UI_SMALLFONT, color);
ADDRGP4 $690
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 100
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1189
;1189:}
LABELV $658
endproc StartServer_BotPage_SkillDraw 104 20
proc StartServer_BotPage_SkillEvent 24 8
line 1199
;1190:
;1191:
;1192:
;1193:/*
;1194:=================
;1195:StartServer_BotPage_SkillEvent
;1196:=================
;1197:*/
;1198:static void StartServer_BotPage_SkillEvent( void* ptr, int event )
;1199:{
line 1204
;1200:	int hit;
;1201:	menuskill_s* s;
;1202:	botskill_t* data;
;1203:
;1204:	if (event == QM_GOTFOCUS) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $713
line 1205
;1205:		trap_S_StartLocalSound( menu_move_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_move_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1206
;1206:		s_botcontrols.hotspot = MSKILL_NONE;	
ADDRGP4 s_botcontrols+16700
CNSTI4 0
ASGNI4
line 1207
;1207:		return;
ADDRGP4 $712
JUMPV
LABELV $713
line 1210
;1208:	}
;1209:
;1210:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $716
line 1211
;1211:		return;
ADDRGP4 $712
JUMPV
LABELV $716
line 1214
;1212:	}
;1213:
;1214:	s = (menuskill_s*)ptr;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 1215
;1215:	data = s->data;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
ASGNP4
line 1216
;1216:	hit = StartServer_BotPage_OverSkillHotspot(s);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 StartServer_BotPage_OverSkillHotspot
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1218
;1217:
;1218:	if (hit == MSKILL_LEFT) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $718
line 1219
;1219:		s->data->low++;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1220
;1220:		if (data->low > data->high)
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $719
line 1221
;1221:			data->low = 0;
ADDRLP4 8
INDIRP4
CNSTI4 0
ASGNI4
line 1222
;1222:	}
ADDRGP4 $719
JUMPV
LABELV $718
line 1223
;1223:	else if (hit == MSKILL_RIGHT) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $722
line 1224
;1224:		if (data->range) {
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $724
line 1225
;1225:			data->high++;
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1226
;1226:			if (data->high == MAX_SKILL)
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
NEI4 $725
line 1227
;1227:				data->high = data->low;
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
INDIRI4
ASGNI4
line 1228
;1228:		}
ADDRGP4 $725
JUMPV
LABELV $724
line 1229
;1229:		else {
line 1230
;1230:			data->value++;
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1231
;1231:			if (data->value == MAX_SKILL )
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 9
NEI4 $728
line 1232
;1232:				data->value = 0;
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
LABELV $728
line 1233
;1233:		}
LABELV $725
line 1234
;1234:	}
LABELV $722
LABELV $719
line 1236
;1235:
;1236:	if (hit != MSKILL_NONE) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $730
line 1237
;1237:		trap_S_StartLocalSound( menu_move_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_move_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1238
;1238:	}
LABELV $730
line 1239
;1239:}
LABELV $712
endproc StartServer_BotPage_SkillEvent 24 8
proc StartServer_BotPage_CommonEvent 8 4
line 1251
;1240:
;1241:
;1242:
;1243:
;1244:
;1245:/*
;1246:=================
;1247:StartServer_BotPage_CommonEvent
;1248:=================
;1249:*/
;1250:static void StartServer_BotPage_CommonEvent( void* ptr, int event )
;1251:{
line 1252
;1252:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $733
line 1253
;1253:		return;
ADDRGP4 $732
JUMPV
LABELV $733
line 1256
;1254:	}
;1255:
;1256:	StartServer_BotPage_Save();
ADDRGP4 StartServer_BotPage_Save
CALLV
pop
line 1257
;1257:	switch( ((menucommon_s*)ptr)->id )
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
LTI4 $735
ADDRLP4 0
INDIRI4
CNSTI4 16
GTI4 $735
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $744-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $744
address $742
address $743
address $738
address $740
address $735
address $741
address $739
code
line 1258
;1258:	{
LABELV $738
line 1260
;1259:		case ID_SERVERCOMMON_SERVER:
;1260:			StartServer_ItemPage_MenuInit();
ADDRGP4 StartServer_ItemPage_MenuInit
CALLV
pop
line 1261
;1261:			StartServer_ServerPage_MenuInit();
ADDRGP4 StartServer_ServerPage_MenuInit
CALLV
pop
line 1262
;1262:			break;
ADDRGP4 $736
JUMPV
LABELV $739
line 1265
;1263:			
;1264:		case ID_SERVERCOMMON_WEAPON:
;1265:			StartServer_ItemPage_MenuInit();
ADDRGP4 StartServer_ItemPage_MenuInit
CALLV
pop
line 1266
;1266:			StartServer_WeaponPage_MenuInit();
ADDRGP4 StartServer_WeaponPage_MenuInit
CALLI4
pop
line 1267
;1267:			break;
ADDRGP4 $736
JUMPV
LABELV $740
line 1270
;1268:
;1269:		case ID_SERVERCOMMON_ITEMS:
;1270:			StartServer_ItemPage_MenuInit();
ADDRGP4 StartServer_ItemPage_MenuInit
CALLV
pop
line 1271
;1271:			break;
ADDRGP4 $736
JUMPV
LABELV $741
line 1274
;1272:
;1273:		case ID_SERVERCOMMON_MAPS:
;1274:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1275
;1275:			break;
ADDRGP4 $736
JUMPV
LABELV $742
line 1278
;1276:
;1277:		case ID_SERVERCOMMON_BACK:
;1278:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1279
;1279:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1280
;1280:			break;
ADDRGP4 $736
JUMPV
LABELV $743
line 1283
;1281:
;1282:		case ID_SERVERCOMMON_FIGHT:
;1283:			StartServer_CreateServer(NULL);
CNSTP4 0
ARGP4
ADDRGP4 StartServer_CreateServer
CALLI4
pop
line 1284
;1284:			break;
LABELV $735
LABELV $736
line 1286
;1285:	}
;1286:}
LABELV $732
endproc StartServer_BotPage_CommonEvent 8 4
proc StartServer_BotPage_SelectionEvent 0 4
line 1297
;1287:
;1288:
;1289:
;1290:
;1291:/*
;1292:=================
;1293:StartServer_BotPage_SelectionEvent
;1294:=================
;1295:*/
;1296:static void StartServer_BotPage_SelectionEvent( void* ptr, int event )
;1297:{
line 1298
;1298:	if (event == QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $747
line 1299
;1299:		StartServer_BotPage_SelectItem(((menucommon_s*)ptr)->id);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 StartServer_BotPage_SelectItem
CALLV
pop
line 1300
;1300:		StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1301
;1301:	}
LABELV $747
line 1302
;1302:}
LABELV $746
endproc StartServer_BotPage_SelectionEvent 0 4
proc StartServer_BotPage_NameDraw 108 20
line 1312
;1303:
;1304:
;1305:
;1306:/*
;1307:=================
;1308:StartServer_BotPage_NameDraw
;1309:=================
;1310:*/
;1311:static void StartServer_BotPage_NameDraw(void* self)
;1312:{
line 1323
;1313:	int		x;
;1314:	int		y;
;1315:	int pulse;
;1316:	int style;
;1317:	vec4_t tempcolor;
;1318:	float*	color;
;1319:	menutext_s* t;
;1320:	char* string;
;1321:	char buffer[32];
;1322:
;1323:	t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1324
;1324:	x = t->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 1325
;1325:	y = t->generic.y;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1326
;1326:	style = UI_SMALLFONT;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 1328
;1327:
;1328:	pulse = ((t->generic.flags & QMF_PULSE) || (Menu_ItemAtCursor( t->generic.parent ) == t));
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 131072
BANDU4
CNSTU4 0
NEU4 $753
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRP4
CVPU4 4
NEU4 $751
LABELV $753
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $752
JUMPV
LABELV $751
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $752
ADDRLP4 24
ADDRLP4 76
INDIRI4
ASGNI4
line 1330
;1329:
;1330:	if (t->generic.flags & QMF_GRAYED)
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $754
line 1331
;1331:		color = text_color_disabled;
ADDRLP4 20
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $755
JUMPV
LABELV $754
line 1332
;1332:	else if (pulse) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $756
line 1333
;1333:		tempcolor[0] = text_color_highlight[0];
ADDRLP4 28
ADDRGP4 text_color_highlight
INDIRF4
ASGNF4
line 1334
;1334:		tempcolor[1] = text_color_highlight[1];
ADDRLP4 28+4
ADDRGP4 text_color_highlight+4
INDIRF4
ASGNF4
line 1335
;1335:		tempcolor[2] = text_color_highlight[2];
ADDRLP4 28+8
ADDRGP4 text_color_highlight+8
INDIRF4
ASGNF4
line 1336
;1336:		tempcolor[3] = 0.7 + 0.3 * sin(uis.realtime / PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 60
DIVI4
CVIF4 4
ARGF4
ADDRLP4 88
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 28+12
CNSTF4 1050253722
ADDRLP4 88
INDIRF4
MULF4
CNSTF4 1060320051
ADDF4
ASGNF4
line 1338
;1337:
;1338:		color = tempcolor;
ADDRLP4 20
ADDRLP4 28
ASGNP4
line 1339
;1339:		style |= UI_PULSE;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1341
;1340:
;1341:		UI_FillRect( x, y, t->generic.right - x +1, t->generic.bottom - y + 1, listbar_color );
ADDRLP4 92
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 96
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 104
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
SUBI4
ADDRLP4 104
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
SUBI4
ADDRLP4 104
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1342
;1342:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 1343
;1343:	}
ADDRGP4 $757
JUMPV
LABELV $756
line 1345
;1344:	else
;1345:		color = text_color_normal;
ADDRLP4 20
ADDRGP4 text_color_normal
ASGNP4
LABELV $757
LABELV $755
line 1347
;1346:
;1347:	string = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1348
;1348:	if (s_botcontrols.slotType[ t->generic.id ].curvalue == SLOTTYPE_HUMAN)
CNSTI4 132
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+92
ADDP4
INDIRI4
CNSTI4 1
NEI4 $764
line 1349
;1349:	{
line 1350
;1350:		string = s_botcontrols.playername;
ADDRLP4 4
ADDRGP4 s_botcontrols+16768
ASGNP4
line 1351
;1351:		if (t->generic.flags & QMF_GRAYED) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $765
line 1352
;1352:			Q_strncpyz(buffer, string, 32);
ADDRLP4 44
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1353
;1353:			Q_CleanStr( buffer );
ADDRLP4 44
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1354
;1354:			string = buffer;
ADDRLP4 4
ADDRLP4 44
ASGNP4
line 1355
;1355:		}
line 1356
;1356:	}
ADDRGP4 $765
JUMPV
LABELV $764
line 1358
;1357:	else
;1358:	if (s_scriptdata.bot.drawName[ t->generic.id ])
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_scriptdata+1948+1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $771
line 1359
;1359:	{
line 1360
;1360:		string = t->string;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
ASGNP4
line 1361
;1361:		if (string[0] == '\0')
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $775
line 1362
;1362:			string = "----";
ADDRLP4 4
ADDRGP4 $115
ASGNP4
LABELV $775
line 1363
;1363:	}
LABELV $771
LABELV $765
line 1365
;1364:
;1365:	if (string)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $777
line 1366
;1366:		UI_DrawString( x, y, string, style, color );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $777
line 1367
;1367:}
LABELV $749
endproc StartServer_BotPage_NameDraw 108 20
proc StartServer_BotPage_NameEvent 76 12
line 1377
;1368:
;1369:
;1370:
;1371:/*
;1372:=================
;1373:StartServer_BotPage_NameEvent
;1374:=================
;1375:*/
;1376:static void StartServer_BotPage_NameEvent( void* ptr, int event )
;1377:{
line 1384
;1378:	int index;
;1379:	int i;
;1380:	int botnum;
;1381:	char botname[MAX_NAME_LENGTH];
;1382:	char* bot;
;1383:
;1384:	index = ((menucommon_s*)ptr)->id;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 1385
;1385:	switch (event) {
ADDRLP4 48
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
EQI4 $784
ADDRLP4 48
INDIRI4
CNSTI4 2
EQI4 $781
ADDRLP4 48
INDIRI4
CNSTI4 3
EQI4 $782
ADDRGP4 $780
JUMPV
LABELV $782
line 1387
;1386:	case QM_ACTIVATED:
;1387:		UI_BotSelect_Index(s_scriptdata.bot.name[index], index);
ADDRLP4 52
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
ARGP4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 UI_BotSelect_Index
CALLV
pop
line 1388
;1388:		break;
ADDRGP4 $781
JUMPV
LABELV $784
line 1391
;1389:
;1390:	case QM_GOTFOCUS:
;1391:		botnum = UI_GetNumBots();
ADDRLP4 56
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 56
INDIRI4
ASGNI4
line 1392
;1392:		s_botcontrols.boticon[0] = '\0';
ADDRGP4 s_botcontrols+16704
CNSTI1 0
ASGNI1
line 1393
;1393:		for (i = 0; i < botnum; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $789
JUMPV
LABELV $786
line 1394
;1394:		{
line 1395
;1395:			bot = UI_GetBotInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 60
INDIRP4
ASGNP4
line 1396
;1396:			strncpy(botname, Info_ValueForKey(bot, "name"), MAX_NAME_LENGTH);
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $549
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1397
;1397:			Q_CleanStr(botname);
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1398
;1398:			if (Q_stricmp(botname, s_scriptdata.bot.name[index]))
ADDRLP4 4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $790
line 1399
;1399:				continue;
ADDRGP4 $787
JUMPV
LABELV $790
line 1401
;1400:
;1401:			UI_ServerPlayerIcon(Info_ValueForKey(bot, "model"), s_botcontrols.boticon, MAX_QPATH);
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $793
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+16704
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 UI_ServerPlayerIcon
CALLV
pop
line 1402
;1402:			break;
ADDRGP4 $781
JUMPV
LABELV $787
line 1393
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $789
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $786
line 1405
;1403:		}
;1404:
;1405:		break;
line 1408
;1406:
;1407:	case QM_LOSTFOCUS:
;1408:		break;
LABELV $780
LABELV $781
line 1410
;1409:	}
;1410:}
LABELV $779
endproc StartServer_BotPage_NameEvent 76 12
proc StartServer_BotPage_TypeEvent 16 0
line 1420
;1411:
;1412:
;1413:
;1414:/*
;1415:=================
;1416:StartServer_BotPage_TypeEvent
;1417:=================
;1418:*/
;1419:static void StartServer_BotPage_TypeEvent( void* ptr, int event )
;1420:{
line 1424
;1421:	int index;
;1422:	menulist_s* s;
;1423:
;1424:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $797
line 1425
;1425:		return;
ADDRGP4 $796
JUMPV
LABELV $797
line 1428
;1426:	}
;1427:
;1428:	s = (menulist_s*)ptr;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1429
;1429:	index = s->generic.id;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 1430
;1430:	if (s->curvalue == SLOTTYPE_HUMAN)
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 1
NEI4 $799
line 1431
;1431:	{
line 1433
;1432:		// prevent human index, and wrap if necessary
;1433:		s->curvalue++;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1434
;1434:		if (s->curvalue == s->numitems)
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
NEI4 $801
line 1435
;1435:			s->curvalue = 0;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
LABELV $801
line 1436
;1436:	}
LABELV $799
line 1438
;1437:
;1438:   s_scriptdata.bot.slotType[index] = s->curvalue;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_scriptdata+1948+1352
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 1440
;1439:
;1440:   StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1441
;1441:}
LABELV $796
endproc StartServer_BotPage_TypeEvent 16 0
proc StartServer_BotPage_MenuKey 20 8
line 1453
;1442:
;1443:
;1444:
;1445:
;1446:
;1447:/*
;1448:=================
;1449:StartServer_BotPage_MenuKey
;1450:=================
;1451:*/
;1452:static sfxHandle_t StartServer_BotPage_MenuKey( int key )
;1453:{
line 1457
;1454:	menucommon_s*	m;
;1455:	int				picnum;
;1456:
;1457:	switch (key)
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
CNSTI4 27
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $808
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $806
LABELV $809
ADDRFP4 0
INDIRI4
CNSTI4 179
EQI4 $808
ADDRGP4 $806
JUMPV
line 1458
;1458:	{
LABELV $808
line 1461
;1459:		case K_MOUSE2:
;1460:		case K_ESCAPE:
;1461:			StartServer_BotPage_Save();
ADDRGP4 StartServer_BotPage_Save
CALLV
pop
line 1462
;1462:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1463
;1463:			break;
LABELV $806
LABELV $807
line 1466
;1464:	}
;1465:
;1466:	return ( Menu_DefaultKey( &s_botcontrols.menu, key ) );
ADDRGP4 s_botcontrols
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
LABELV $805
endproc StartServer_BotPage_MenuKey 20 8
proc StartServer_BotPage_Event 12 4
line 1478
;1467:}
;1468:
;1469:
;1470:
;1471:
;1472:/*
;1473:=================
;1474:StartServer_BotPage_Event
;1475:=================
;1476:*/
;1477:static void StartServer_BotPage_Event( void* ptr, int event )
;1478:{
line 1481
;1479:	int i;
;1480:
;1481:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 100
LTI4 $811
ADDRLP4 4
INDIRI4
CNSTI4 114
GTI4 $811
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $868-400
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $868
address $819
address $841
address $854
address $841
address $847
address $811
address $861
address $834
address $811
address $827
address $824
address $824
address $814
address $831
address $844
code
LABELV $814
line 1485
;1482:		// controls that change script data
;1483:
;1484:		case ID_BOT_GAMETYPE:
;1485:			if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $815
line 1486
;1486:				return;
ADDRGP4 $810
JUMPV
LABELV $815
line 1489
;1487:			}
;1488:			// make all changes before updating control page
;1489:			StartServer_SaveScriptData();
ADDRGP4 StartServer_SaveScriptData
CALLV
pop
line 1490
;1490:			StartServer_BotPage_SelectItem(-1);
CNSTI4 -1
ARGI4
ADDRGP4 StartServer_BotPage_SelectItem
CALLV
pop
line 1492
;1491:
;1492:			StartServer_LoadScriptDataFromType(s_botcontrols.botGameType.curvalue);
ADDRGP4 s_botcontrols+2408+92
INDIRI4
ARGI4
ADDRGP4 StartServer_LoadScriptDataFromType
CALLV
pop
line 1494
;1493:
;1494:			StartServer_BotPage_InitControlsFromScript();
ADDRGP4 StartServer_BotPage_InitControlsFromScript
CALLV
pop
line 1495
;1495:			StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1496
;1496:			break;
ADDRGP4 $812
JUMPV
LABELV $819
line 1499
;1497:
;1498:		case ID_BOT_TYPE:
;1499:			if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $820
line 1500
;1500:				return;
ADDRGP4 $810
JUMPV
LABELV $820
line 1503
;1501:			}
;1502:
;1503:			StartServer_SaveBotNameList();
ADDRGP4 StartServer_SaveBotNameList
CALLV
pop
line 1504
;1504:			StartServer_BotPage_LoadBotNameList(s_botcontrols.botTypeSelect.curvalue);
ADDRGP4 s_botcontrols+2656+92
INDIRI4
ARGI4
ADDRGP4 StartServer_BotPage_LoadBotNameList
CALLV
pop
line 1505
;1505:			StartServer_BotPage_SelectItem(-1);
CNSTI4 -1
ARGI4
ADDRGP4 StartServer_BotPage_SelectItem
CALLV
pop
line 1507
;1506:
;1507:			StartServer_BotPage_SetSkillRangeType();
ADDRGP4 StartServer_BotPage_SetSkillRangeType
CALLV
pop
line 1508
;1508:			StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1509
;1509:			break;
ADDRGP4 $812
JUMPV
LABELV $824
line 1513
;1510:
;1511:		case ID_BOT_LEFTTEAM:
;1512:		case ID_BOT_RIGHTTEAM:
;1513:			if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $825
line 1514
;1514:				return;
ADDRGP4 $810
JUMPV
LABELV $825
line 1516
;1515:			}
;1516:			StartServer_BotPage_SetTeamTitle(-1);
CNSTI4 -1
ARGI4
ADDRGP4 StartServer_BotPage_SetTeamTitle
CALLV
pop
line 1517
;1517:			break;
ADDRGP4 $812
JUMPV
LABELV $827
line 1520
;1518:
;1519:		case ID_BOT_DELETESLOT:
;1520:			if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $828
line 1521
;1521:				return;
ADDRGP4 $810
JUMPV
LABELV $828
line 1523
;1522:			}
;1523:			StartServer_BotPage_DeleteSlot(s_botcontrols.selected);
ADDRGP4 s_botcontrols+16564
INDIRI4
ARGI4
ADDRGP4 StartServer_BotPage_DeleteSlot
CALLV
pop
line 1524
;1524:			StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1525
;1525:			break;
ADDRGP4 $812
JUMPV
LABELV $831
line 1528
;1526:
;1527:		case ID_BOT_SWAPARROWS:
;1528:			if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $832
line 1529
;1529:				return;
ADDRGP4 $810
JUMPV
LABELV $832
line 1531
;1530:			}
;1531:			StartServer_BotPage_MoveToOtherTeam();
ADDRGP4 StartServer_BotPage_MoveToOtherTeam
CALLV
pop
line 1532
;1532:			StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1533
;1533:			break;
ADDRGP4 $812
JUMPV
LABELV $834
line 1536
;1534:
;1535:		case ID_BOT_JOINAS:
;1536:			if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $835
line 1537
;1537:				return;
ADDRGP4 $810
JUMPV
LABELV $835
line 1540
;1538:			}
;1539:
;1540:            s_scriptdata.bot.joinAs = s_botcontrols.joinAs.curvalue;
ADDRGP4 s_scriptdata+1948+1464
ADDRGP4 s_botcontrols+4004+88
INDIRI4
ASGNI4
line 1541
;1541:			StartServer_BotPage_SetPlayerNamedSlot();
ADDRGP4 StartServer_BotPage_SetPlayerNamedSlot
CALLV
pop
line 1542
;1542:			StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1543
;1543:			break;
ADDRGP4 $812
JUMPV
LABELV $841
line 1547
;1544:
;1545:		case ID_BOT_BOTNUMBER:
;1546:		case ID_BOT_SLOTS:
;1547:			if (event == QM_LOSTFOCUS) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $812
line 1548
;1548:				StartServer_BotPage_ValidateSlotCount();
ADDRGP4 StartServer_BotPage_ValidateSlotCount
CALLV
pop
line 1549
;1549:			}
line 1550
;1550:			break;
ADDRGP4 $812
JUMPV
LABELV $844
line 1553
;1551:
;1552:		case ID_BOT_ACTION:
;1553:			if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $845
line 1554
;1554:				break;
ADDRGP4 $812
JUMPV
LABELV $845
line 1557
;1555:			}
;1556:
;1557:			StartServer_BotPage_HandleGoAction();
ADDRGP4 StartServer_BotPage_HandleGoAction
CALLV
pop
line 1558
;1558:			break;
ADDRGP4 $812
JUMPV
LABELV $847
line 1561
;1559:
;1560:		case ID_BOT_SKILL:
;1561:			if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $848
line 1562
;1562:				return;
ADDRGP4 $810
JUMPV
LABELV $848
line 1565
;1563:			}
;1564:
;1565:			s_scriptdata.bot.skillType = s_botcontrols.skillType.curvalue;
ADDRGP4 s_scriptdata+1948+1476
ADDRGP4 s_botcontrols+3648+92
INDIRI4
ASGNI4
line 1566
;1566:			StartServer_BotPage_SetSkillRangeType();
ADDRGP4 StartServer_BotPage_SetSkillRangeType
CALLV
pop
line 1567
;1567:			StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1568
;1568:			break;
ADDRGP4 $812
JUMPV
LABELV $854
line 1571
;1569:
;1570:		case ID_BOT_CHANGE:
;1571:			if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $855
line 1572
;1572:				return;
ADDRGP4 $810
JUMPV
LABELV $855
line 1574
;1573:			}
;1574:			s_scriptdata.bot.changeBots = s_botcontrols.changeBots.curvalue;
ADDRGP4 s_scriptdata+1948+1472
ADDRGP4 s_botcontrols+3152+92
INDIRI4
ASGNI4
line 1575
;1575:			StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1576
;1576:			break;
ADDRGP4 $812
JUMPV
LABELV $861
line 1579
;1577:
;1578:		case ID_BOT_SKILLBIAS:
;1579:			if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $862
line 1580
;1580:				return;
ADDRGP4 $810
JUMPV
LABELV $862
line 1582
;1581:			}
;1582:			s_scriptdata.bot.skillBias= s_botcontrols.skillBias.curvalue;
ADDRGP4 s_scriptdata+1948+1480
ADDRGP4 s_botcontrols+3872+92
INDIRI4
ASGNI4
line 1583
;1583:			StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1584
;1584:			break;
LABELV $811
LABELV $812
line 1588
;1585:
;1586:		// controls that just change something on the interface
;1587:	}
;1588:}
LABELV $810
endproc StartServer_BotPage_Event 12 4
proc StartServer_BotPage_MenuDraw 44 20
line 1598
;1589:
;1590:
;1591:
;1592:/*
;1593:=================
;1594:StartServer_BotPage_MenuDraw
;1595:=================
;1596:*/
;1597:static void StartServer_BotPage_MenuDraw(void)
;1598:{
line 1606
;1599:	qboolean excluded;
;1600:	menulist_s*	b;
;1601:	menucommon_s* g;
;1602:	qhandle_t pic;
;1603:	int i;
;1604:	float f;
;1605:
;1606:	if (uis.firstdraw) {
ADDRGP4 uis+11496
INDIRI4
CNSTI4 0
EQI4 $871
line 1607
;1607:		StartServer_BotPage_Load();
ADDRGP4 StartServer_BotPage_Load
CALLV
pop
line 1608
;1608:		StartServer_BotPage_UpdateInterface();
ADDRGP4 StartServer_BotPage_UpdateInterface
CALLV
pop
line 1609
;1609:	}	
LABELV $871
line 1611
;1610:
;1611:	excluded = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1612
;1612:	if (StartServer_IsRandomBotExclude(s_scriptdata.bot.typeSelect))
ADDRGP4 s_scriptdata+1948+1456
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 StartServer_IsRandomBotExclude
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $874
line 1613
;1613:		excluded = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $874
line 1614
;1614:	StartServer_BackgroundDraw(excluded);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 StartServer_BackgroundDraw
CALLV
pop
line 1617
;1615:
;1616:	// draw bot icon
;1617:	for (i = 0; i < PLAYER_SLOTS; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $878
line 1618
;1618:	{
line 1619
;1619:		b = &s_botcontrols.slotType[i];
ADDRLP4 8
CNSTI4 132
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540
ADDP4
ASGNP4
line 1620
;1620:		if (b->curvalue != SLOTTYPE_BOT)
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 2
EQI4 $883
line 1621
;1621:			continue;
ADDRGP4 $879
JUMPV
LABELV $883
line 1623
;1622:
;1623:		g = &s_botcontrols.slotName[i].generic;
ADDRLP4 0
CNSTI4 104
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972
ADDP4
ASGNP4
line 1624
;1624:		if (g->flags & (QMF_GRAYED|QMF_INACTIVE|QMF_HIDDEN))
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 28672
BANDU4
CNSTU4 0
EQU4 $886
line 1625
;1625:			continue;
ADDRGP4 $879
JUMPV
LABELV $886
line 1627
;1626:
;1627:		if (UI_CursorInRect(g->left, g->top, g->right - g->left, g->bottom - g->top))
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ARGI4
ADDRLP4 40
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $888
line 1628
;1628:		{
line 1629
;1629:			s_botcontrols.fadetime = uis.realtime + BOT_FADETIME;
ADDRGP4 s_botcontrols+16568
ADDRGP4 uis+4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1630
;1630:			break;
ADDRGP4 $880
JUMPV
LABELV $888
line 1632
;1631:		}
;1632:	}
LABELV $879
line 1617
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 26
LTI4 $878
LABELV $880
line 1634
;1633:
;1634:	if (uis.realtime < s_botcontrols.fadetime )
ADDRGP4 uis+4
INDIRI4
ADDRGP4 s_botcontrols+16568
INDIRI4
GEI4 $892
line 1635
;1635:	{
line 1636
;1636:		f = (float)(s_botcontrols.fadetime - uis.realtime) / BOT_FADETIME;
ADDRLP4 16
ADDRGP4 s_botcontrols+16568
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 1638
;1637:
;1638:		pulsecolor[3] = f;
ADDRGP4 pulsecolor+12
ADDRLP4 16
INDIRF4
ASGNF4
line 1639
;1639:		fading_red[3] = f;
ADDRGP4 fading_red+12
ADDRLP4 16
INDIRF4
ASGNF4
line 1641
;1640:
;1641:		pic = trap_R_RegisterShaderNoMip( s_botcontrols.boticon );
ADDRGP4 s_botcontrols+16704
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 1642
;1642:		if (pic)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $901
line 1643
;1643:		{
line 1644
;1644:			trap_R_SetColor( pulsecolor );
ADDRGP4 pulsecolor
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1645
;1645:			UI_DrawHandlePic(640 - 64 - 64  + uis.wideoffset, 48, 64, 64, pic);
ADDRGP4 uis+11476
INDIRI4
CNSTI4 512
ADDI4
CVIF4 4
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 32
CNSTF4 1115684864
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1646
;1646:			trap_R_SetColor( fading_red );
ADDRGP4 fading_red
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1647
;1647:			UI_DrawNamedPic(640 - 64 - 64 - 15  + uis.wideoffset, 48 - 16, 128, 128, BOTSELECT_SELECT);
ADDRGP4 uis+11476
INDIRI4
CNSTI4 497
ADDI4
CVIF4 4
ARGF4
CNSTF4 1107296256
ARGF4
ADDRLP4 36
CNSTF4 1124073472
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 $461
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 1648
;1648:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1649
;1649:		}
LABELV $901
line 1650
;1650:	}
LABELV $892
line 1653
;1651:
;1652:	// draw the controls
;1653:	Menu_Draw(&s_botcontrols.menu);
ADDRGP4 s_botcontrols
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1655
;1654:
;1655:	StartServer_BotPage_DrawStatusBarText();
ADDRGP4 StartServer_BotPage_DrawStatusBarText
CALLV
pop
line 1656
;1656:}
LABELV $870
endproc StartServer_BotPage_MenuDraw 44 20
export StartServer_BotPage_MenuInit
proc StartServer_BotPage_MenuInit 68 16
line 1666
;1657:
;1658:
;1659:
;1660:/*
;1661:=================
;1662:StartServer_BotPage_MenuInit
;1663:=================
;1664:*/
;1665:void StartServer_BotPage_MenuInit(void)
;1666:{
line 1670
;1667:	menuframework_s* menuptr;
;1668:	int y, i, n, list_y, colx, sel_colx;
;1669:
;1670:	memset(&s_botcontrols, 0, sizeof(botcontrols_t));
ADDRGP4 s_botcontrols
ARGP4
CNSTI4 0
ARGI4
CNSTI4 16800
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1672
;1671:
;1672:	StartServer_BotPage_Cache();
ADDRGP4 StartServer_BotPage_Cache
CALLV
pop
line 1674
;1673:
;1674:	menuptr = &s_botcontrols.menu;
ADDRLP4 8
ADDRGP4 s_botcontrols
ASGNP4
line 1676
;1675:
;1676:	menuptr->key = StartServer_BotPage_MenuKey;
ADDRLP4 8
INDIRP4
CNSTI4 1040
ADDP4
ADDRGP4 StartServer_BotPage_MenuKey
ASGNP4
line 1677
;1677:	menuptr->wrapAround = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1044
ADDP4
CNSTI4 1
ASGNI4
line 1678
;1678:	menuptr->native 	= qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 1056
ADDP4
CNSTI4 0
ASGNI4
line 1679
;1679:	menuptr->fullscreen = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1052
ADDP4
CNSTI4 1
ASGNI4
line 1680
;1680:	menuptr->draw = StartServer_BotPage_MenuDraw;
ADDRLP4 8
INDIRP4
CNSTI4 1036
ADDP4
ADDRGP4 StartServer_BotPage_MenuDraw
ASGNP4
line 1682
;1681:
;1682:	StartServer_CommonControls_Init(menuptr, &s_botcontrols.common, StartServer_BotPage_CommonEvent, COMMONCTRL_BOTS);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+1076
ARGP4
ADDRGP4 StartServer_BotPage_CommonEvent
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 StartServer_CommonControls_Init
CALLV
pop
line 1688
;1683:
;1684:	//
;1685:	// the user selected bots
;1686:	//
;1687:
;1688:	y = GAMETYPEROW_Y;
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 16
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ADDRLP4 28
INDIRI4
DIVI4
CNSTI4 64
ADDI4
ASGNI4
line 1689
;1689:	s_botcontrols.botGameType.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_botcontrols+2408
CNSTI4 3
ASGNI4
line 1690
;1690:	s_botcontrols.botGameType.generic.id		= ID_BOT_GAMETYPE;
ADDRGP4 s_botcontrols+2408+24
CNSTI4 112
ASGNI4
line 1691
;1691:	s_botcontrols.botGameType.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_botcontrols+2408+72
CNSTU4 258
ASGNU4
line 1692
;1692:	s_botcontrols.botGameType.generic.callback	= StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+2408+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1693
;1693:	s_botcontrols.botGameType.generic.x			= GAMETYPECOLUMN_X;
ADDRGP4 s_botcontrols+2408+28
CNSTI4 400
ASGNI4
line 1694
;1694:	s_botcontrols.botGameType.generic.y			= y;
ADDRGP4 s_botcontrols+2408+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1696
;1695:
;1696:	s_botcontrols.botGameTypeIcon.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_botcontrols+2540
CNSTI4 6
ASGNI4
line 1697
;1697:	s_botcontrols.botGameTypeIcon.generic.flags = QMF_INACTIVE;
ADDRGP4 s_botcontrols+2540+72
CNSTU4 16384
ASGNU4
line 1698
;1698:	s_botcontrols.botGameTypeIcon.generic.x	 = GAMETYPEICON_X;
ADDRGP4 s_botcontrols+2540+28
CNSTI4 400
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ASGNI4
line 1699
;1699:	s_botcontrols.botGameTypeIcon.generic.y	 = y;
ADDRGP4 s_botcontrols+2540+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1700
;1700:	s_botcontrols.botGameTypeIcon.width  	     = 32;
ADDRGP4 s_botcontrols+2540+104
CNSTI4 32
ASGNI4
line 1701
;1701:	s_botcontrols.botGameTypeIcon.height  	     = 32;
ADDRGP4 s_botcontrols+2540+108
CNSTI4 32
ASGNI4
line 1703
;1702:
;1703:	y += LINE_HEIGHT;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1704
;1704:	s_botcontrols.botTypeSelect.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_botcontrols+2656
CNSTI4 3
ASGNI4
line 1705
;1705:	s_botcontrols.botTypeSelect.generic.id		= ID_BOT_TYPE;
ADDRGP4 s_botcontrols+2656+24
CNSTI4 100
ASGNI4
line 1706
;1706:	s_botcontrols.botTypeSelect.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_botcontrols+2656+72
CNSTU4 258
ASGNU4
line 1707
;1707:	s_botcontrols.botTypeSelect.generic.callback	= StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+2656+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1708
;1708:	s_botcontrols.botTypeSelect.generic.statusbar	= StartServer_BotPage_StatusBar;
ADDRGP4 s_botcontrols+2656+80
ADDRGP4 StartServer_BotPage_StatusBar
ASGNP4
line 1709
;1709:	s_botcontrols.botTypeSelect.generic.x			= GAMETYPECOLUMN_X;
ADDRGP4 s_botcontrols+2656+28
CNSTI4 400
ASGNI4
line 1710
;1710:	s_botcontrols.botTypeSelect.generic.y			= y;
ADDRGP4 s_botcontrols+2656+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1712
;1711:
;1712:	y += 2*LINE_HEIGHT;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 1713
;1713:	s_botcontrols.numberBots.generic.type       = MTYPE_FIELD;
ADDRGP4 s_botcontrols+2788
CNSTI4 4
ASGNI4
line 1714
;1714:	s_botcontrols.numberBots.generic.id		= ID_BOT_BOTNUMBER;
ADDRGP4 s_botcontrols+2788+24
CNSTI4 101
ASGNI4
line 1715
;1715:	s_botcontrols.numberBots.generic.callback	= StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+2788+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1716
;1716:	s_botcontrols.numberBots.generic.statusbar	= StartServer_BotPage_StatusBar;
ADDRGP4 s_botcontrols+2788+80
ADDRGP4 StartServer_BotPage_StatusBar
ASGNP4
line 1717
;1717:	s_botcontrols.numberBots.generic.flags      = QMF_SMALLFONT|QMF_PULSEIFFOCUS;
ADDRGP4 s_botcontrols+2788+72
CNSTU4 258
ASGNU4
line 1718
;1718:	s_botcontrols.numberBots.generic.x          = BOT_RIGHTCTRL;
ADDRGP4 s_botcontrols+2788+28
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 320
ADDI4
ASGNI4
line 1719
;1719:	s_botcontrols.numberBots.generic.y	        = y;
ADDRGP4 s_botcontrols+2788+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1720
;1720:	s_botcontrols.numberBots.field.widthInChars = 3;
ADDRGP4 s_botcontrols+2788+88+8
CNSTI4 3
ASGNI4
line 1721
;1721:	s_botcontrols.numberBots.field.maxchars     = 3;
ADDRGP4 s_botcontrols+2788+88+268
CNSTI4 3
ASGNI4
line 1723
;1722:
;1723:	s_botcontrols.skillType.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_botcontrols+3648
CNSTI4 3
ASGNI4
line 1724
;1724:	s_botcontrols.skillType.generic.id		= ID_BOT_SKILL;
ADDRGP4 s_botcontrols+3648+24
CNSTI4 104
ASGNI4
line 1725
;1725:	s_botcontrols.skillType.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_botcontrols+3648+72
CNSTU4 258
ASGNU4
line 1726
;1726:	s_botcontrols.skillType.generic.callback	= StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+3648+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1727
;1727:	s_botcontrols.skillType.generic.x			= BOT_LEFTCTRL;
ADDRGP4 s_botcontrols+3648+28
CNSTI4 18
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 1728
;1728:	s_botcontrols.skillType.generic.y			= y;
ADDRGP4 s_botcontrols+3648+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1731
;1729:
;1730:	// custom skill control
;1731:	s_botcontrols.skillValue.generic.type		= MTYPE_NULL;
ADDRGP4 s_botcontrols+3780
CNSTI4 0
ASGNI4
line 1732
;1732:	s_botcontrols.skillValue.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_SILENT;
ADDRGP4 s_botcontrols+3780+72
CNSTU4 1081602
ASGNU4
line 1733
;1733:	s_botcontrols.skillValue.generic.ownerdraw = StartServer_BotPage_SkillDraw;
ADDRGP4 s_botcontrols+3780+84
ADDRGP4 StartServer_BotPage_SkillDraw
ASGNP4
line 1734
;1734:	s_botcontrols.skillValue.generic.statusbar = StartServer_BotPage_SkillStatusBar;
ADDRGP4 s_botcontrols+3780+80
ADDRGP4 StartServer_BotPage_SkillStatusBar
ASGNP4
line 1735
;1735:	s_botcontrols.skillValue.generic.callback	= StartServer_BotPage_SkillEvent;
ADDRGP4 s_botcontrols+3780+76
ADDRGP4 StartServer_BotPage_SkillEvent
ASGNP4
line 1736
;1736:	s_botcontrols.skillValue.generic.x			= BOT_LEFTCTRL + 13*SMALLCHAR_WIDTH + BOT_ICONX;
ADDRGP4 s_botcontrols+3780+28
CNSTI4 18
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 1737
;1737:	s_botcontrols.skillValue.generic.y			= y;
ADDRGP4 s_botcontrols+3780+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1739
;1738:
;1739:	s_botcontrols.skillValue.data = &s_scriptdata.bot.globalSkill;
ADDRGP4 s_botcontrols+3780+88
ADDRGP4 s_scriptdata+1948+1484
ASGNP4
line 1740
;1740:	StartServer_BotPage_InitSkillControl(&s_botcontrols.skillValue);
ADDRGP4 s_botcontrols+3780
ARGP4
ADDRGP4 StartServer_BotPage_InitSkillControl
CALLV
pop
line 1742
;1741:
;1742:	y += LINE_HEIGHT;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1743
;1743:	s_botcontrols.changeBots.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_botcontrols+3152
CNSTI4 3
ASGNI4
line 1744
;1744:	s_botcontrols.changeBots.generic.id		= ID_BOT_CHANGE;
ADDRGP4 s_botcontrols+3152+24
CNSTI4 102
ASGNI4
line 1745
;1745:	s_botcontrols.changeBots.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_botcontrols+3152+72
CNSTU4 258
ASGNU4
line 1746
;1746:	s_botcontrols.changeBots.generic.callback	= StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+3152+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1747
;1747:	s_botcontrols.changeBots.generic.x			= BOT_RIGHTCTRL;
ADDRGP4 s_botcontrols+3152+28
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 320
ADDI4
ASGNI4
line 1748
;1748:	s_botcontrols.changeBots.generic.y			= y;
ADDRGP4 s_botcontrols+3152+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1750
;1749:
;1750:	s_botcontrols.skillBias.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_botcontrols+3872
CNSTI4 3
ASGNI4
line 1751
;1751:	s_botcontrols.skillBias.generic.id		= ID_BOT_SKILLBIAS;
ADDRGP4 s_botcontrols+3872+24
CNSTI4 106
ASGNI4
line 1752
;1752:	s_botcontrols.skillBias.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_botcontrols+3872+72
CNSTU4 258
ASGNU4
line 1753
;1753:	s_botcontrols.skillBias.generic.callback	= StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+3872+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1754
;1754:	s_botcontrols.skillBias.generic.x			= BOT_LEFTCTRL;
ADDRGP4 s_botcontrols+3872+28
CNSTI4 18
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 1755
;1755:	s_botcontrols.skillBias.generic.y			= y;
ADDRGP4 s_botcontrols+3872+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1757
;1756:
;1757:	y += LINE_HEIGHT;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1758
;1758:	s_botcontrols.numberOpen.generic.type       = MTYPE_FIELD;
ADDRGP4 s_botcontrols+3284
CNSTI4 4
ASGNI4
line 1759
;1759:	s_botcontrols.numberOpen.generic.id		= ID_BOT_SLOTS;
ADDRGP4 s_botcontrols+3284+24
CNSTI4 103
ASGNI4
line 1760
;1760:	s_botcontrols.numberOpen.generic.callback	= StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+3284+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1761
;1761:	s_botcontrols.numberOpen.generic.flags      = QMF_SMALLFONT|QMF_PULSEIFFOCUS;
ADDRGP4 s_botcontrols+3284+72
CNSTU4 258
ASGNU4
line 1762
;1762:	s_botcontrols.numberOpen.generic.x          = BOT_RIGHTCTRL;
ADDRGP4 s_botcontrols+3284+28
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 320
ADDI4
ASGNI4
line 1763
;1763:	s_botcontrols.numberOpen.generic.y	        = y;
ADDRGP4 s_botcontrols+3284+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1764
;1764:	s_botcontrols.numberOpen.field.widthInChars = 3;
ADDRGP4 s_botcontrols+3284+88+8
CNSTI4 3
ASGNI4
line 1765
;1765:	s_botcontrols.numberOpen.field.maxchars     = 3;
ADDRGP4 s_botcontrols+3284+88+268
CNSTI4 3
ASGNI4
line 1767
;1766:
;1767:	s_botcontrols.joinAs.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 s_botcontrols+4004
CNSTI4 5
ASGNI4
line 1768
;1768:	s_botcontrols.joinAs.generic.id		= ID_BOT_JOINAS;
ADDRGP4 s_botcontrols+4004+24
CNSTI4 107
ASGNI4
line 1769
;1769:	s_botcontrols.joinAs.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_botcontrols+4004+72
CNSTU4 258
ASGNU4
line 1770
;1770:	s_botcontrols.joinAs.generic.callback	= StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+4004+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1771
;1771:	s_botcontrols.joinAs.generic.x			= BOT_LEFTCTRL;
ADDRGP4 s_botcontrols+4004+28
CNSTI4 18
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 1772
;1772:	s_botcontrols.joinAs.generic.y			= y;
ADDRGP4 s_botcontrols+4004+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1775
;1773:
;1774:	// re-initialized in StartServer_BotPage_SetTeamTitle()
;1775:	y += (3 * LINE_HEIGHT) / 2;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 3
ADDRGP4 cl_smallcharheight+12
INDIRI4
MULI4
CNSTI4 6
ADDI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1776
;1776:	s_botcontrols.teamLeft.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_botcontrols+4100
CNSTI4 9
ASGNI4
line 1777
;1777:	s_botcontrols.teamLeft.generic.id		= ID_BOT_LEFTTEAM;
ADDRGP4 s_botcontrols+4100+24
CNSTI4 110
ASGNI4
line 1778
;1778:	s_botcontrols.teamLeft.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_CENTER_JUSTIFY;
ADDRGP4 s_botcontrols+4100+72
CNSTU4 266
ASGNU4
line 1779
;1779:	s_botcontrols.teamLeft.generic.callback	= StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+4100+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1780
;1780:	s_botcontrols.teamLeft.generic.x			= BOT_RIGHTCTRL;
ADDRGP4 s_botcontrols+4100+28
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 320
ADDI4
ASGNI4
line 1781
;1781:	s_botcontrols.teamLeft.generic.y			= y;
ADDRGP4 s_botcontrols+4100+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1782
;1782:	s_botcontrols.teamLeft.string = "";
ADDRGP4 s_botcontrols+4100+88
ADDRGP4 $1070
ASGNP4
line 1783
;1783:	s_botcontrols.teamLeft.style = UI_CENTER;
ADDRGP4 s_botcontrols+4100+92
CNSTI4 1
ASGNI4
line 1784
;1784:	s_botcontrols.teamLeft.color = 0;
ADDRGP4 s_botcontrols+4100+100
CNSTP4 0
ASGNP4
line 1786
;1785:
;1786:	s_botcontrols.teamRight.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_botcontrols+4204
CNSTI4 9
ASGNI4
line 1787
;1787:	s_botcontrols.teamRight.generic.id		= ID_BOT_RIGHTTEAM;
ADDRGP4 s_botcontrols+4204+24
CNSTI4 111
ASGNI4
line 1788
;1788:	s_botcontrols.teamRight.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_CENTER_JUSTIFY;
ADDRGP4 s_botcontrols+4204+72
CNSTU4 266
ASGNU4
line 1789
;1789:	s_botcontrols.teamRight.generic.callback	= StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+4204+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1790
;1790:	s_botcontrols.teamRight.generic.x			= BOT_LEFTCTRL;
ADDRGP4 s_botcontrols+4204+28
CNSTI4 18
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ASGNI4
line 1791
;1791:	s_botcontrols.teamRight.generic.y			= y;
ADDRGP4 s_botcontrols+4204+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1792
;1792:	s_botcontrols.teamRight.string = "";
ADDRGP4 s_botcontrols+4204+88
ADDRGP4 $1070
ASGNP4
line 1793
;1793:	s_botcontrols.teamRight.style = UI_CENTER;
ADDRGP4 s_botcontrols+4204+92
CNSTI4 1
ASGNI4
line 1794
;1794:	s_botcontrols.teamRight.color = 0;
ADDRGP4 s_botcontrols+4204+100
CNSTP4 0
ASGNP4
line 1796
;1795:
;1796:	y += 2+ PROP_HEIGHT * UI_ProportionalSizeScale( s_botcontrols.teamLeft.style, 0 );
ADDRGP4 s_botcontrols+4100+92
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 32
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
CNSTF4 1073741824
ADDF4
ADDF4
CVFI4 4
ASGNI4
line 1798
;1797:
;1798:	s_botcontrols.swapArrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_botcontrols+4308
CNSTI4 6
ASGNI4
line 1799
;1799:	s_botcontrols.swapArrows.generic.name  = BOTSELECT_SWAPARROWS0;
ADDRGP4 s_botcontrols+4308+4
ADDRGP4 $457
ASGNP4
line 1800
;1800:	s_botcontrols.swapArrows.generic.flags = QMF_PULSEIFFOCUS;
ADDRGP4 s_botcontrols+4308+72
CNSTU4 256
ASGNU4
line 1801
;1801:	s_botcontrols.swapArrows.generic.x	   =  320 - 18;
ADDRGP4 s_botcontrols+4308+28
CNSTI4 302
ASGNI4
line 1802
;1802:	s_botcontrols.swapArrows.generic.y	   = y;
ADDRGP4 s_botcontrols+4308+32
ADDRLP4 16
INDIRI4
ASGNI4
line 1803
;1803:	s_botcontrols.swapArrows.generic.id	   = ID_BOT_SWAPARROWS;
ADDRGP4 s_botcontrols+4308+24
CNSTI4 113
ASGNI4
line 1804
;1804:	s_botcontrols.swapArrows.generic.callback = StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+4308+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1805
;1805:	s_botcontrols.swapArrows.width = 36;
ADDRGP4 s_botcontrols+4308+104
CNSTI4 36
ASGNI4
line 1806
;1806:	s_botcontrols.swapArrows.height = 36;
ADDRGP4 s_botcontrols+4308+108
CNSTI4 36
ASGNI4
line 1807
;1807:	s_botcontrols.swapArrows.focuspic = BOTSELECT_SWAPARROWS1;
ADDRGP4 s_botcontrols+4308+88
ADDRGP4 $458
ASGNP4
line 1809
;1808:
;1809:	s_botcontrols.delBot.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_botcontrols+4424
CNSTI4 6
ASGNI4
line 1810
;1810:	s_botcontrols.delBot.generic.name  = BOTSELECT_DEL0;
ADDRGP4 s_botcontrols+4424+4
ADDRGP4 $459
ASGNP4
line 1811
;1811:	s_botcontrols.delBot.generic.flags = QMF_PULSEIFFOCUS;
ADDRGP4 s_botcontrols+4424+72
CNSTU4 256
ASGNU4
line 1812
;1812:	s_botcontrols.delBot.generic.x	   =  320 - 18;
ADDRGP4 s_botcontrols+4424+28
CNSTI4 302
ASGNI4
line 1813
;1813:	s_botcontrols.delBot.generic.y	   = y + 48;
ADDRGP4 s_botcontrols+4424+32
ADDRLP4 16
INDIRI4
CNSTI4 48
ADDI4
ASGNI4
line 1814
;1814:	s_botcontrols.delBot.generic.id	   = ID_BOT_DELETESLOT;
ADDRGP4 s_botcontrols+4424+24
CNSTI4 109
ASGNI4
line 1815
;1815:	s_botcontrols.delBot.generic.callback = StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+4424+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1816
;1816:	s_botcontrols.delBot.width = 36;
ADDRGP4 s_botcontrols+4424+104
CNSTI4 36
ASGNI4
line 1817
;1817:	s_botcontrols.delBot.height = 72;
ADDRGP4 s_botcontrols+4424+108
CNSTI4 72
ASGNI4
line 1818
;1818:	s_botcontrols.delBot.focuspic = BOTSELECT_DEL1;
ADDRGP4 s_botcontrols+4424+88
ADDRGP4 $460
ASGNP4
line 1820
;1819:
;1820:	colx = BOTCOL_LEFT;
ADDRLP4 12
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1821
;1821:	sel_colx = 320 - 40;
ADDRLP4 20
CNSTI4 280
ASGNI4
line 1822
;1822:	for (i = 0; i < PLAYER_SLOTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1135
line 1823
;1823:		list_y = y + (i % PLAYER_SLOTS_PERCOL) * (LINE_HEIGHT + 4);
ADDRLP4 4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 13
MODI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 4
ADDI4
MULI4
ADDI4
ASGNI4
line 1824
;1824:		if (i == PLAYER_SLOTS_PERCOL) {
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $1140
line 1825
;1825:			colx = BOTCOL_RIGHT;
ADDRLP4 12
CNSTI4 6
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 320
ADDI4
ASGNI4
line 1826
;1826:			sel_colx = 320 + 24;
ADDRLP4 20
CNSTI4 344
ASGNI4
line 1827
;1827:		}
LABELV $1140
line 1829
;1828:
;1829:		s_botcontrols.slotType[i].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540
ADDP4
CNSTI4 3
ASGNI4
line 1830
;1830:		s_botcontrols.slotType[i].generic.id		= i;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1831
;1831:		s_botcontrols.slotType[i].generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+72
ADDP4
CNSTU4 258
ASGNU4
line 1832
;1832:		s_botcontrols.slotType[i].generic.callback	= StartServer_BotPage_TypeEvent;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+76
ADDP4
ADDRGP4 StartServer_BotPage_TypeEvent
ASGNP4
line 1833
;1833:		s_botcontrols.slotType[i].generic.x			= colx;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+28
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1834
;1834:		s_botcontrols.slotType[i].generic.y			= list_y;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+32
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1835
;1835:		s_botcontrols.slotType[i].generic.name		= 0;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+4
ADDP4
CNSTP4 0
ASGNP4
line 1836
;1836:		s_botcontrols.slotType[i].itemnames			= botSlotType_list;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540+104
ADDP4
ADDRGP4 botSlotType_list
ASGNP4
line 1838
;1837:
;1838:		s_botcontrols.slotName[i].generic.type		= MTYPE_TEXT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972
ADDP4
CNSTI4 7
ASGNI4
line 1839
;1839:		s_botcontrols.slotName[i].generic.id		= i;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1840
;1840:		s_botcontrols.slotName[i].generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+72
ADDP4
CNSTU4 33026
ASGNU4
line 1841
;1841:		s_botcontrols.slotName[i].generic.callback	= StartServer_BotPage_NameEvent;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+76
ADDP4
ADDRGP4 StartServer_BotPage_NameEvent
ASGNP4
line 1842
;1842:		s_botcontrols.slotName[i].generic.ownerdraw = StartServer_BotPage_NameDraw;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+84
ADDP4
ADDRGP4 StartServer_BotPage_NameDraw
ASGNP4
line 1843
;1843:		s_botcontrols.slotName[i].generic.x			= colx + BOTNAME_DX;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+28
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 1844
;1844:		s_botcontrols.slotName[i].generic.y			= list_y;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+32
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1845
;1845:		s_botcontrols.slotName[i].generic.left		= s_botcontrols.slotName[i].generic.x;
ADDRLP4 44
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 s_botcontrols+7972+44
ADDP4
ADDRLP4 44
INDIRI4
ADDRGP4 s_botcontrols+7972+28
ADDP4
INDIRI4
ASGNI4
line 1846
;1846:		s_botcontrols.slotName[i].generic.top		= list_y;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+48
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1847
;1847:		s_botcontrols.slotName[i].generic.right		= s_botcontrols.slotName[i].generic.x + BOTNAME_LENGTH*SMALLCHAR_WIDTH;
ADDRLP4 48
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 s_botcontrols+7972+52
ADDP4
ADDRLP4 48
INDIRI4
ADDRGP4 s_botcontrols+7972+28
ADDP4
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 4
LSHI4
ADDI4
ASGNI4
line 1848
;1848:		s_botcontrols.slotName[i].generic.bottom		= list_y + SMALLCHAR_HEIGHT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+56
ADDP4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 1849
;1849:		s_botcontrols.slotName[i].string = s_scriptdata.bot.name[i];
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972+88
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_scriptdata+1948
ADDP4
ASGNP4
line 1851
;1850:
;1851:		s_botcontrols.slotSelected[i].generic.type  = MTYPE_BITMAP;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068
ADDP4
CNSTI4 6
ASGNI4
line 1852
;1852:		s_botcontrols.slotSelected[i].generic.name  = GAMESERVER_SELECTED0;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+4
ADDP4
ADDRGP4 $462
ASGNP4
line 1853
;1853:		s_botcontrols.slotSelected[i].generic.flags = QMF_PULSEIFFOCUS;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+72
ADDP4
CNSTU4 256
ASGNU4
line 1854
;1854:		s_botcontrols.slotSelected[i].generic.x	   =  sel_colx;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+28
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1855
;1855:		s_botcontrols.slotSelected[i].generic.y	   = list_y;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+32
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1856
;1856:		s_botcontrols.slotSelected[i].generic.id	   = i;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1857
;1857:		s_botcontrols.slotSelected[i].generic.callback = StartServer_BotPage_SelectionEvent;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+76
ADDP4
ADDRGP4 StartServer_BotPage_SelectionEvent
ASGNP4
line 1858
;1858:		s_botcontrols.slotSelected[i].generic.ownerdraw = StartServer_SelectionDraw;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+84
ADDP4
ADDRGP4 StartServer_SelectionDraw
ASGNP4
line 1859
;1859:		s_botcontrols.slotSelected[i].width = 16;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+104
ADDP4
CNSTI4 16
ASGNI4
line 1860
;1860:		s_botcontrols.slotSelected[i].height = 16;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+108
ADDP4
CNSTI4 16
ASGNI4
line 1861
;1861:		s_botcontrols.slotSelected[i].focuspic = GAMESERVER_SELECTED1;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068+88
ADDP4
ADDRGP4 $463
ASGNP4
line 1864
;1862:
;1863:		// custom skill control
;1864:		s_botcontrols.slotSkill[i].generic.type		= MTYPE_NULL;
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676
ADDP4
CNSTI4 0
ASGNI4
line 1865
;1865:		s_botcontrols.slotSkill[i].generic.id		= i;
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1866
;1866:		s_botcontrols.slotSkill[i].generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_SILENT;
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+72
ADDP4
CNSTU4 1081602
ASGNU4
line 1867
;1867:		s_botcontrols.slotSkill[i].generic.ownerdraw = StartServer_BotPage_SkillDraw;
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+84
ADDP4
ADDRGP4 StartServer_BotPage_SkillDraw
ASGNP4
line 1868
;1868:		s_botcontrols.slotSkill[i].generic.statusbar = StartServer_BotPage_SkillStatusBar;
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+80
ADDP4
ADDRGP4 StartServer_BotPage_SkillStatusBar
ASGNP4
line 1869
;1869:		s_botcontrols.slotSkill[i].generic.callback	= StartServer_BotPage_SkillEvent;
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+76
ADDP4
ADDRGP4 StartServer_BotPage_SkillEvent
ASGNP4
line 1870
;1870:		s_botcontrols.slotSkill[i].generic.x			= colx + BOTSKILL_DX;
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+28
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 25
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1871
;1871:		s_botcontrols.slotSkill[i].generic.y			= list_y;
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+32
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1873
;1872:
;1873:		s_botcontrols.slotSkill[i].data = &s_scriptdata.bot.skill[i];
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676+88
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_scriptdata+1948+832
ADDP4
ASGNP4
line 1874
;1874:		StartServer_BotPage_InitSkillControl(&s_botcontrols.slotSkill[i]);
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676
ADDP4
ARGP4
ADDRGP4 StartServer_BotPage_InitSkillControl
CALLV
pop
line 1875
;1875:	}
LABELV $1136
line 1822
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $1135
line 1877
;1876:
;1877:	y += 8 * (LINE_HEIGHT + 4) + LINE_HEIGHT;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 16
ADDI4
CNSTI4 32
ADDI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ADDI4
ASGNI4
line 1879
;1878:
;1879:	s_botcontrols.actionDest.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_botcontrols+16316
CNSTI4 3
ASGNI4
line 1880
;1880:	s_botcontrols.actionDest.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_botcontrols+16316+72
CNSTU4 258
ASGNU4
line 1881
;1881:	s_botcontrols.actionDest.generic.x	   = 240;
ADDRGP4 s_botcontrols+16316+28
CNSTI4 240
ASGNI4
line 1882
;1882:	s_botcontrols.actionDest.generic.y	   = y + 100;
ADDRGP4 s_botcontrols+16316+32
ADDRLP4 16
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1884
;1883:
;1884:	s_botcontrols.actionActivate.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_botcontrols+16448
CNSTI4 6
ASGNI4
line 1885
;1885:	s_botcontrols.actionActivate.generic.name     = GAMESERVER_ACTION0;
ADDRGP4 s_botcontrols+16448+4
ADDRGP4 $464
ASGNP4
line 1886
;1886:	s_botcontrols.actionActivate.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_botcontrols+16448+72
CNSTU4 260
ASGNU4
line 1887
;1887:	s_botcontrols.actionActivate.generic.callback = StartServer_BotPage_Event;
ADDRGP4 s_botcontrols+16448+76
ADDRGP4 StartServer_BotPage_Event
ASGNP4
line 1888
;1888:	s_botcontrols.actionActivate.generic.id	    = ID_BOT_ACTION;
ADDRGP4 s_botcontrols+16448+24
CNSTI4 114
ASGNI4
line 1889
;1889:	s_botcontrols.actionActivate.generic.x		= 240 - 64 - SMALLCHAR_WIDTH;
ADDRGP4 s_botcontrols+16448+28
CNSTI4 176
ADDRGP4 cl_smallcharwidth+12
INDIRI4
SUBI4
ASGNI4
line 1890
;1890:	s_botcontrols.actionActivate.generic.y		= y - ( 32 - SMALLCHAR_HEIGHT)/ 2 + 100;
ADDRGP4 s_botcontrols+16448+32
ADDRLP4 16
INDIRI4
CNSTI4 32
ADDRGP4 cl_smallcharheight+12
INDIRI4
SUBI4
CNSTI4 2
DIVI4
SUBI4
CNSTI4 100
ADDI4
ASGNI4
line 1891
;1891:	s_botcontrols.actionActivate.width  		    = 64;
ADDRGP4 s_botcontrols+16448+104
CNSTI4 64
ASGNI4
line 1892
;1892:	s_botcontrols.actionActivate.height  		    = 32;
ADDRGP4 s_botcontrols+16448+108
CNSTI4 32
ASGNI4
line 1893
;1893:	s_botcontrols.actionActivate.focuspic         = GAMESERVER_ACTION1;
ADDRGP4 s_botcontrols+16448+88
ADDRGP4 $465
ASGNP4
line 1895
;1894:
;1895:	s_botcontrols.statusbar_height = y + 16 + LINE_HEIGHT;
ADDRGP4 s_botcontrols+16572
ADDRLP4 16
INDIRI4
CNSTI4 16
ADDI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 1897
;1896:	
;1897:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $1263
line 1898
;1898:	s_botcontrols.botGameType.generic.name		= "Game Type:";
ADDRGP4 s_botcontrols+2408+4
ADDRGP4 $1268
ASGNP4
line 1899
;1899:	s_botcontrols.botGameType.itemnames			= gametype_items;
ADDRGP4 s_botcontrols+2408+104
ADDRGP4 gametype_items
ASGNP4
line 1900
;1900:	s_botcontrols.botTypeSelect.generic.name		= "Bot selection:";
ADDRGP4 s_botcontrols+2656+4
ADDRGP4 $1273
ASGNP4
line 1901
;1901:	s_botcontrols.botTypeSelect.itemnames			= botTypeSel_list;
ADDRGP4 s_botcontrols+2656+104
ADDRGP4 botTypeSel_list
ASGNP4
line 1902
;1902:	s_botcontrols.numberBots.generic.name       = "Number of bots:";
ADDRGP4 s_botcontrols+2788+4
ADDRGP4 $1278
ASGNP4
line 1903
;1903:	s_botcontrols.skillType.generic.name		= "Skill:";
ADDRGP4 s_botcontrols+3648+4
ADDRGP4 $1281
ASGNP4
line 1904
;1904:	s_botcontrols.skillType.itemnames			= botSkill_list;
ADDRGP4 s_botcontrols+3648+104
ADDRGP4 botSkill_list
ASGNP4
line 1905
;1905:	s_botcontrols.changeBots.generic.name		= "Change bots:";
ADDRGP4 s_botcontrols+3152+4
ADDRGP4 $1286
ASGNP4
line 1906
;1906:	s_botcontrols.changeBots.itemnames			= botChange_list;
ADDRGP4 s_botcontrols+3152+104
ADDRGP4 botChange_list
ASGNP4
line 1907
;1907:	s_botcontrols.skillBias.generic.name		= "Skill bias:";
ADDRGP4 s_botcontrols+3872+4
ADDRGP4 $1291
ASGNP4
line 1908
;1908:	s_botcontrols.skillBias.itemnames			= botSkillBias_list;
ADDRGP4 s_botcontrols+3872+104
ADDRGP4 botSkillBias_list
ASGNP4
line 1909
;1909:	s_botcontrols.numberOpen.generic.name       = "Open slots:";
ADDRGP4 s_botcontrols+3284+4
ADDRGP4 $1296
ASGNP4
line 1910
;1910:	s_botcontrols.joinAs.generic.name		= "Spectator:";	
ADDRGP4 s_botcontrols+4004+4
ADDRGP4 $1299
ASGNP4
line 1911
;1911:	s_botcontrols.actionDest.itemnames	   = botCopyTo_items;
ADDRGP4 s_botcontrols+16316+104
ADDRGP4 botCopyTo_items
ASGNP4
line 1912
;1912:	}
LABELV $1263
line 1913
;1913:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $1302
line 1914
;1914:	s_botcontrols.botGameType.generic.name		= "Режим Игры:";
ADDRGP4 s_botcontrols+2408+4
ADDRGP4 $1307
ASGNP4
line 1915
;1915:	s_botcontrols.botGameType.itemnames			= gametype_itemsru;
ADDRGP4 s_botcontrols+2408+104
ADDRGP4 gametype_itemsru
ASGNP4
line 1916
;1916:	s_botcontrols.botTypeSelect.generic.name		= "Выбор ботов:";
ADDRGP4 s_botcontrols+2656+4
ADDRGP4 $1312
ASGNP4
line 1917
;1917:	s_botcontrols.botTypeSelect.itemnames			= botTypeSel_listru;
ADDRGP4 s_botcontrols+2656+104
ADDRGP4 botTypeSel_listru
ASGNP4
line 1918
;1918:	s_botcontrols.numberBots.generic.name       = "Количество ботов:";
ADDRGP4 s_botcontrols+2788+4
ADDRGP4 $1317
ASGNP4
line 1919
;1919:	s_botcontrols.skillType.generic.name		= "Сложность:";
ADDRGP4 s_botcontrols+3648+4
ADDRGP4 $1320
ASGNP4
line 1920
;1920:	s_botcontrols.skillType.itemnames			= botSkill_listru;
ADDRGP4 s_botcontrols+3648+104
ADDRGP4 botSkill_listru
ASGNP4
line 1921
;1921:	s_botcontrols.changeBots.generic.name		= "Сменить ботов:";
ADDRGP4 s_botcontrols+3152+4
ADDRGP4 $1325
ASGNP4
line 1922
;1922:	s_botcontrols.changeBots.itemnames			= botChange_listru;
ADDRGP4 s_botcontrols+3152+104
ADDRGP4 botChange_listru
ASGNP4
line 1923
;1923:	s_botcontrols.skillBias.generic.name		= "Разброс сложности:";
ADDRGP4 s_botcontrols+3872+4
ADDRGP4 $1330
ASGNP4
line 1924
;1924:	s_botcontrols.skillBias.itemnames			= botSkillBias_listru;
ADDRGP4 s_botcontrols+3872+104
ADDRGP4 botSkillBias_listru
ASGNP4
line 1925
;1925:	s_botcontrols.numberOpen.generic.name       = "Открытые слоты:";
ADDRGP4 s_botcontrols+3284+4
ADDRGP4 $1335
ASGNP4
line 1926
;1926:	s_botcontrols.joinAs.generic.name		= "Наблюдатель:";	
ADDRGP4 s_botcontrols+4004+4
ADDRGP4 $1338
ASGNP4
line 1927
;1927:	s_botcontrols.actionDest.itemnames	   = botCopyTo_itemsru;
ADDRGP4 s_botcontrols+16316+104
ADDRGP4 botCopyTo_itemsru
ASGNP4
line 1928
;1928:	}
LABELV $1302
line 1934
;1929:
;1930:
;1931:	//
;1932:	// register page controls
;1933:	//
;1934:	Menu_AddItem( menuptr, &s_botcontrols.botGameType);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+2408
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1935
;1935:	Menu_AddItem( menuptr, &s_botcontrols.botGameTypeIcon);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+2540
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1936
;1936:	Menu_AddItem( menuptr, &s_botcontrols.botTypeSelect);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+2656
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1938
;1937:
;1938:	Menu_AddItem( menuptr, &s_botcontrols.numberBots);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+2788
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1939
;1939:	Menu_AddItem( menuptr, &s_botcontrols.changeBots);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+3152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1940
;1940:	Menu_AddItem( menuptr, &s_botcontrols.numberOpen);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+3284
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1942
;1941:
;1942:	Menu_AddItem( menuptr, &s_botcontrols.skillType);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+3648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1943
;1943:	Menu_AddItem( menuptr, &s_botcontrols.skillValue);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+3780
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1944
;1944:	Menu_AddItem( menuptr, &s_botcontrols.skillBias);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+3872
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1945
;1945:	Menu_AddItem( menuptr, &s_botcontrols.joinAs);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+4004
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1947
;1946:
;1947:	Menu_AddItem( menuptr, &s_botcontrols.teamLeft);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+4100
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1948
;1948:	Menu_AddItem( menuptr, &s_botcontrols.teamRight);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+4204
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1950
;1949:
;1950:	Menu_AddItem( menuptr, &s_botcontrols.swapArrows);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+4308
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1951
;1951:	Menu_AddItem( menuptr, &s_botcontrols.delBot);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+4424
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1953
;1952:
;1953:	for (i = 0; i < PLAYER_SLOTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1355
line 1954
;1954:		Menu_AddItem( menuptr, &s_botcontrols.slotName[i]);
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+7972
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1955
;1955:		Menu_AddItem( menuptr, &s_botcontrols.slotSelected[i]);
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+13068
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1956
;1956:		Menu_AddItem( menuptr, &s_botcontrols.slotType[i]);
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+4540
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1957
;1957:		Menu_AddItem( menuptr, &s_botcontrols.slotSkill[i]);
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 92
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_botcontrols+10676
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1958
;1958:	}
LABELV $1356
line 1953
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 26
LTI4 $1355
line 1960
;1959:
;1960:	Menu_AddItem( menuptr, &s_botcontrols.actionDest);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+16316
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1961
;1961:	Menu_AddItem( menuptr, &s_botcontrols.actionActivate);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 s_botcontrols+16448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1963
;1962:
;1963:	UI_PushMenu( &s_botcontrols.menu );
ADDRGP4 s_botcontrols
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1964
;1964:}
LABELV $905
endproc StartServer_BotPage_MenuInit 68 16
import StartServer_WeaponPage_MenuInit
bss
align 4
LABELV s_botcontrols
skip 16800
import StartServer_ItemPage_MenuInit_OldMenu
import StartServer_ItemPage_MenuInit
import StartServer_BothItemMenus_Cache
import StartServer_ServerPage_Cache
import StartServer_ServerPage_Mods
import StartServer_ServerPage_MenuInit
import StartServer_MapPage_CopyCustomLimitsToControls
import StartServer_MapPage_Cache
import StartServer_MapPage_MenuInit
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
LABELV $1338
byte 1 208
byte 1 157
byte 1 208
byte 1 176
byte 1 208
byte 1 177
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $1335
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $1330
byte 1 208
byte 1 160
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 182
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 58
byte 1 0
align 1
LABELV $1325
byte 1 208
byte 1 161
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 58
byte 1 0
align 1
LABELV $1320
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 182
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 58
byte 1 0
align 1
LABELV $1317
byte 1 208
byte 1 154
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 58
byte 1 0
align 1
LABELV $1312
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 58
byte 1 0
align 1
LABELV $1307
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
LABELV $1299
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1296
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1291
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 105
byte 1 97
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1286
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1281
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $1278
byte 1 78
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $1273
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $1268
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
LABELV $1070
byte 1 0
align 1
LABELV $793
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $693
byte 1 45
byte 1 0
align 1
LABELV $690
byte 1 73
byte 1 0
align 1
LABELV $676
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
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $628
byte 1 208
byte 1 154
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 44
byte 1 32
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 178
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
byte 1 181
byte 1 32
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 184
byte 1 209
byte 1 133
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $621
byte 1 208
byte 1 152
byte 1 209
byte 1 129
byte 1 208
byte 1 191
byte 1 208
byte 1 190
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 208
byte 1 183
byte 1 209
byte 1 131
byte 1 208
byte 1 185
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 44
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 209
byte 1 133
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
byte 1 190
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $619
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 180
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 176
byte 1 208
byte 1 189
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 209
byte 1 133
byte 1 32
byte 1 208
byte 1 186
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 209
byte 1 130
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 178
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
byte 1 188
byte 1 208
byte 1 184
byte 1 0
align 1
LABELV $617
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 139
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
byte 1 209
byte 1 139
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
byte 1 188
byte 1 32
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 208
byte 1 188
byte 1 44
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 208
byte 1 177
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 0
align 1
LABELV $615
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
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 187
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 209
byte 1 133
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
LABELV $613
byte 1 208
byte 1 158
byte 1 208
byte 1 180
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 184
byte 1 32
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 182
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 187
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 209
byte 1 133
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
LABELV $600
byte 1 78
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $593
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $591
byte 1 82
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $589
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 108
byte 1 121
byte 1 32
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 108
byte 1 117
byte 1 100
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 117
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $587
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 108
byte 1 121
byte 1 32
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
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
LABELV $585
byte 1 83
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
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
LABELV $549
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $492
byte 1 208
byte 1 161
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 209
byte 1 143
byte 1 209
byte 1 143
byte 1 32
byte 1 208
byte 1 186
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
byte 1 176
byte 1 0
align 1
LABELV $491
byte 1 208
byte 1 154
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 209
byte 1 129
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
byte 1 176
byte 1 0
align 1
LABELV $487
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $486
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $465
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
LABELV $464
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
LABELV $463
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
LABELV $462
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
LABELV $461
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $460
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
LABELV $459
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
LABELV $458
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
byte 1 115
byte 1 119
byte 1 97
byte 1 112
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $457
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
byte 1 115
byte 1 119
byte 1 97
byte 1 112
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $444
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $182
byte 1 208
byte 1 163
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
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
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 0
align 1
LABELV $181
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
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 176
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 182
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 129
byte 1 208
byte 1 181
byte 1 208
byte 1 188
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 0
align 1
LABELV $180
byte 1 208
byte 1 154
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
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 182
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 209
byte 1 129
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
byte 1 188
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 208
byte 1 188
byte 1 0
align 1
LABELV $179
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
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 176
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 182
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 178
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
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $178
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
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 182
byte 1 208
byte 1 189
byte 1 208
byte 1 190
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 178
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
byte 1 189
byte 1 208
byte 1 190
byte 1 208
byte 1 179
byte 1 208
byte 1 190
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $177
byte 1 208
byte 1 158
byte 1 209
byte 1 135
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 209
byte 1 130
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
byte 1 209
byte 1 133
byte 1 32
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 32
byte 1 208
byte 1 184
byte 1 32
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 32
byte 1 209
byte 1 129
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $176
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 208
byte 1 182
byte 1 208
byte 1 180
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 52
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
byte 1 0
align 1
LABELV $175
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 208
byte 1 182
byte 1 208
byte 1 180
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 51
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
byte 1 0
align 1
LABELV $174
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 208
byte 1 182
byte 1 208
byte 1 180
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 32
byte 1 50
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
byte 1 0
align 1
LABELV $173
byte 1 208
byte 1 154
byte 1 208
byte 1 176
byte 1 208
byte 1 182
byte 1 208
byte 1 180
byte 1 209
byte 1 131
byte 1 209
byte 1 142
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
byte 1 0
align 1
LABELV $172
byte 1 208
byte 1 157
byte 1 208
byte 1 184
byte 1 208
byte 1 186
byte 1 208
byte 1 190
byte 1 208
byte 1 179
byte 1 208
byte 1 180
byte 1 208
byte 1 176
byte 1 0
align 1
LABELV $171
byte 1 208
byte 1 148
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 189
byte 1 44
byte 1 32
byte 1 208
byte 1 158
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $170
byte 1 208
byte 1 148
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 189
byte 1 44
byte 1 32
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $169
byte 1 208
byte 1 148
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 189
byte 1 44
byte 1 32
byte 1 208
byte 1 157
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $168
byte 1 208
byte 1 148
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 189
byte 1 44
byte 1 32
byte 1 208
byte 1 158
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 157
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $167
byte 1 208
byte 1 148
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 177
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $166
byte 1 208
byte 1 158
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $165
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 209
byte 1 129
byte 1 208
byte 1 190
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $164
byte 1 208
byte 1 157
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $163
byte 1 208
byte 1 158
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 140
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 184
byte 1 208
byte 1 183
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $162
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $161
byte 1 208
byte 1 158
byte 1 209
byte 1 130
byte 1 208
byte 1 186
byte 1 209
byte 1 128
byte 1 209
byte 1 139
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $160
byte 1 208
byte 1 145
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $159
byte 1 208
byte 1 167
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 0
align 1
LABELV $158
byte 1 208
byte 1 161
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 184
byte 1 44
byte 1 32
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 208
byte 1 176
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $157
byte 1 208
byte 1 161
byte 1 208
byte 1 178
byte 1 208
byte 1 190
byte 1 208
byte 1 184
byte 1 44
byte 1 32
byte 1 208
byte 1 190
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
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $156
byte 1 208
byte 1 148
byte 1 208
byte 1 184
byte 1 208
byte 1 176
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $155
byte 1 208
byte 1 152
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 130
byte 1 208
byte 1 184
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $154
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 44
byte 1 32
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 32
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $153
byte 1 208
byte 1 152
byte 1 208
byte 1 183
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 187
byte 1 208
byte 1 176
byte 1 32
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $152
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
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 208
byte 1 183
byte 1 208
byte 1 188
byte 1 208
byte 1 181
byte 1 209
byte 1 128
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
LABELV $151
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
byte 1 32
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 208
byte 1 187
byte 1 209
byte 1 142
byte 1 209
byte 1 135
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $150
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
byte 1 0
align 1
LABELV $149
byte 1 208
byte 1 146
byte 1 209
byte 1 139
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 128
byte 1 32
byte 1 208
byte 1 178
byte 1 209
byte 1 128
byte 1 209
byte 1 131
byte 1 209
byte 1 135
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 209
byte 1 142
byte 1 0
align 1
LABELV $148
byte 1 208
byte 1 157
byte 1 208
byte 1 181
byte 1 208
byte 1 186
byte 1 209
byte 1 129
byte 1 209
byte 1 130
byte 1 208
byte 1 177
byte 1 208
byte 1 190
byte 1 209
byte 1 130
byte 1 0
align 1
LABELV $147
byte 1 208
byte 1 163
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 32
byte 1 209
byte 1 131
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 0
align 1
LABELV $146
byte 1 208
byte 1 163
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 176
byte 1 32
byte 1 72
byte 1 80
byte 1 0
align 1
LABELV $145
byte 1 208
byte 1 145
byte 1 208
byte 1 181
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 32
byte 1 208
byte 1 191
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 128
byte 1 208
byte 1 190
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 0
align 1
LABELV $144
byte 1 208
byte 1 154
byte 1 208
byte 1 190
byte 1 209
byte 1 136
byte 1 208
byte 1 188
byte 1 208
byte 1 176
byte 1 209
byte 1 128
byte 1 33
byte 1 0
align 1
LABELV $143
byte 1 208
byte 1 161
byte 1 208
byte 1 187
byte 1 208
byte 1 190
byte 1 208
byte 1 182
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $142
byte 1 208
byte 1 161
byte 1 209
byte 1 128
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
byte 1 0
align 1
LABELV $141
byte 1 208
byte 1 155
byte 1 208
byte 1 181
byte 1 208
byte 1 179
byte 1 208
byte 1 186
byte 1 208
byte 1 184
byte 1 208
byte 1 185
byte 1 0
align 1
LABELV $140
byte 1 208
byte 1 157
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 0
align 1
LABELV $139
byte 1 78
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $138
byte 1 67
byte 1 111
byte 1 112
byte 1 121
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $137
byte 1 67
byte 1 111
byte 1 112
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 100
byte 1 117
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $136
byte 1 67
byte 1 111
byte 1 112
byte 1 121
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $135
byte 1 67
byte 1 111
byte 1 112
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 100
byte 1 117
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $134
byte 1 67
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $133
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 52
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $132
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 51
byte 1 114
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $131
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 50
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $130
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $129
byte 1 78
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $128
byte 1 70
byte 1 114
byte 1 97
byte 1 99
byte 1 44
byte 1 32
byte 1 86
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $127
byte 1 70
byte 1 114
byte 1 97
byte 1 99
byte 1 44
byte 1 32
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $126
byte 1 70
byte 1 114
byte 1 97
byte 1 99
byte 1 44
byte 1 32
byte 1 76
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $125
byte 1 70
byte 1 114
byte 1 97
byte 1 99
byte 1 44
byte 1 32
byte 1 86
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $124
byte 1 70
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $123
byte 1 86
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $122
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $121
byte 1 76
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $120
byte 1 86
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $119
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $118
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $117
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $116
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $115
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $114
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 44
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 44
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $112
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $111
byte 1 73
byte 1 100
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $110
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 44
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $109
byte 1 70
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $108
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 44
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $107
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 108
byte 1 117
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $106
byte 1 82
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $105
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 32
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
LABELV $104
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $103
byte 1 85
byte 1 108
byte 1 116
byte 1 114
byte 1 97
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 85
byte 1 108
byte 1 116
byte 1 114
byte 1 97
byte 1 32
byte 1 72
byte 1 80
byte 1 0
align 1
LABELV $101
byte 1 73
byte 1 110
byte 1 102
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $100
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $99
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $98
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $97
byte 1 69
byte 1 97
byte 1 115
byte 1 121
byte 1 0
align 1
LABELV $96
byte 1 78
byte 1 111
byte 1 111
byte 1 98
byte 1 0
