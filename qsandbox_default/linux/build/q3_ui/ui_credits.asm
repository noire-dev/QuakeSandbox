data
align 4
LABELV color_credit_background
byte 4 1048576000
byte 4 1048576000
byte 4 1048576000
byte 4 1056964608
align 4
LABELV color_credit_bar
byte 4 1059648963
byte 4 1059648963
byte 4 1059648963
byte 4 1065353216
align 4
LABELV color_credit_title
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV color_credit_text
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
lit
align 4
LABELV boxSize
byte 4 1132462080
data
align 4
LABELV effectData
byte 4 400
byte 4 3000
byte 4 4000
address $84
byte 4 0
byte 4 15
byte 4 3000
byte 4 3000
address $85
address Credits_Effect_PulseXYZ
byte 4 15
byte 4 3000
byte 4 3000
address $86
address Credits_Effect_PulseXY
byte 4 15
byte 4 3000
byte 4 3000
address $87
address Credits_Effect_Ripple1
byte 4 15
byte 4 3000
byte 4 3000
address $88
address Credits_Effect_Ripple2
byte 4 10
byte 4 4000
byte 4 5000
address $89
address Credits_Effect_RushX
byte 4 10
byte 4 4000
byte 4 5000
address $90
address Credits_Effect_RushY
byte 4 10
byte 4 4000
byte 4 5000
address $91
address Credits_Effect_RushZ
byte 4 15
byte 4 2000
byte 4 4000
address $92
address Credits_Effect_JitterSome
byte 4 15
byte 4 2000
byte 4 4000
address $93
address Credits_Effect_JitterAll
byte 4 30
byte 4 2000
byte 4 4000
address $94
address Credits_Effect_Bobble
byte 4 10
byte 4 3000
byte 4 2000
address $95
address Credits_Effect_FlipX
byte 4 10
byte 4 3000
byte 4 2000
address $96
address Credits_Effect_FlipY
byte 4 10
byte 4 3000
byte 4 2000
address $97
address Credits_Effect_FlipZ
lit
align 4
LABELV effectDataCount
byte 4 14
data
align 4
LABELV uieImageList
byte 4 100
address $99
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 100
address $99
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1063675494
byte 4 0
byte 4 100
address $99
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1063675494
byte 4 0
align 4
LABELV uie_credits
byte 4 0
address $101
address $102
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $103
address $102
address $104
address $105
byte 4 0
byte 4 4
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
align 4
LABELV uie_dateImages
byte 4 31
byte 4 11
byte 4 0
address $107
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 16
byte 4 7
byte 4 0
address $108
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 0
byte 4 22
byte 4 2
byte 4 0
address $108
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 0
align 4
LABELV endCredits
byte 4 6
address uie_credits
byte 4 3
address $110
address uieImageList
byte 4 3
address uie_dateImages
byte 4 3
address color_credit_title
address color_credit_text
lit
align 4
LABELV numEndCredits
byte 4 1
data
align 4
LABELV sillyTitles
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
address $124
address $125
address $126
address $127
address $128
address $129
address $130
address $131
address $132
address $133
address $134
address $135
address $136
address $137
address $138
lit
align 4
LABELV sillyTitlesCount
byte 4 28
data
align 4
LABELV sillyMessages
address $139
address $140
address $141
address $142
address $143
address $144
address $145
address $146
address $147
address $148
address $149
address $150
address $151
address $152
address $153
address $154
address $155
address $156
address $157
address $158
address $159
address $160
address $161
address $162
lit
align 4
LABELV sillyMessagesCount
byte 4 24
data
align 4
LABELV quoteList
byte 4 10
byte 4 5
byte 4 0
address $164
address $165
byte 4 0
byte 4 0
byte 4 10
byte 4 5
byte 4 0
address $166
address $167
address $168
byte 4 0
byte 4 10
byte 4 5
byte 4 0
address $169
address $170
address $171
address $172
byte 4 10
byte 4 5
byte 4 0
address $173
address $174
address $175
address $176
byte 4 10
byte 4 5
byte 4 0
address $177
address $178
byte 4 0
byte 4 0
byte 4 10
byte 4 5
byte 4 0
address $179
byte 4 0
byte 4 0
byte 4 0
byte 4 5
byte 4 5
byte 4 0
address $180
address $181
byte 4 0
byte 4 0
byte 4 10
byte 4 5
byte 4 0
address $182
address $183
byte 4 0
byte 4 0
byte 4 10
byte 4 5
byte 4 0
address $184
address $185
byte 4 0
byte 4 0
byte 4 10
byte 4 5
byte 4 0
address $186
address $187
byte 4 0
byte 4 0
byte 4 10
byte 4 5
byte 4 0
address $188
address $189
address $190
byte 4 0
byte 4 10
byte 4 5
byte 4 0
address $191
address $192
byte 4 0
byte 4 0
lit
align 4
LABELV quoteListSize
byte 4 12
code
proc ShuffleText 28 4
file "../../../code/q3_ui/ui_credits.c"
line 552
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:CREDITS
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:
;13:
;14:
;15:#include "ui_local.h"
;16:
;17:/*
;18:	The 3-d volume is unitary in size, stretching from
;19:	x:(-0.5, 0.5), y:(-0.5, 0.5), z:(-0.5, 0.5)
;20:
;21:	The z co-ordinate -0.5 is on the "backplane" where the image settles.
;22:
;23:	Transforms are applied to these coordinates after they're copied
;24:	into a rendering list
;25:
;26:	Reminder: Q3 uses this array convention for x,y,z co-ordinates:
;27:	vec3_t[0] -> z, vec3_t[1] -> x, vec3_t[2] -> y
;28:
;29:*/
;30:
;31:#define ARRAY_SIZEOF(x) ( sizeof(x)/sizeof(x[0]) )
;32:
;33:
;34:
;35:#define MAX_TARGA_FILESIZE (128*1024)
;36:#define TARGA_BUFSIZE 32768
;37:#define MAX_TARGA_WIDTH 64
;38:#define MAX_TARGA_HEIGHT 64
;39:
;40:
;41:#define MAX_RENDEREDPIXELS 4090
;42:
;43:#define STATICVIEW_FOV 80
;44:#define MINVIEW_FOV 40
;45:#define MAXVIEW_FOV 100
;46:
;47:#define MAXROTATE_DELTA 50
;48:
;49:#define BLANK_TIME			1000
;50:#define FADEIN_TIME			3000
;51:#define SWIRLBLEND_TIME 	2000
;52:#define SWIRL_TIME 			4000
;53:#define TOIMAGEBLEND_TIME	1000
;54:#define TOIMAGE_TIME		4000
;55:#define EXPLODE_TIME 		2000
;56:#define HOLD_TIME			1500
;57:
;58:
;59:#define CREDIT_BORDER		10
;60:#define CREDIT_BAR			3
;61:#define CREDIT_DURATION		4000
;62:#define CREDIT_SHUFFLE_TIME (CREDIT_DURATION/4)
;63:
;64:#define MAX_EFFECTS 2
;65:
;66:#define MAX_RECENT_MEMORY	10
;67:
;68:#define MAX_CREDIT_TEXT		64
;69:#define MAX_CREDITS_ONSCREEN 2
;70:#define MAX_CREDIT_LINES 4
;71:
;72:
;73:
;74:static vec4_t color_credit_background = { 0.25f, 0.25f, 0.25f, 0.5f };
;75:static vec4_t color_credit_bar = { 0.66f, 0.66f, 0.66f, 1.0f };
;76:static vec4_t color_credit_title = { 1.0f, 1.0f, 1.0f, 1.0f };
;77:static vec4_t color_credit_text = { 1.0f, 1.0f, 0.0f, 1.0f };
;78:
;79:static const float boxSize = 256.0;
;80:
;81:
;82:// local functions
;83:static void Credits_InitCreditSequence( qboolean nextSequence);
;84:
;85:
;86://--------------------------------------------------------------------
;87:
;88:
;89:enum {
;90:	TGA_NONE,
;91:	TGA_FADEIN,
;92:	TGA_SWIRLBLEND,
;93:	TGA_SWIRL,
;94:
;95:	// all modes from here are part of the "final" sequence
;96:	// order is important, TGA_TOIMAGEBLEND is used to separate
;97:	// from the group above
;98:	TGA_TOIMAGEBLEND,
;99:	TGA_TOIMAGE,
;100:	TGA_HOLD,
;101:	TGA_EXPLODE,
;102:	TGA_BLANK
;103:};
;104:
;105:
;106:// used as index into effectData[]
;107:enum {
;108:	EFFECT_NONE,
;109:	EFFECT_PULSEXYZ,
;110:	EFFECT_PULSEXY,
;111:	EFFECT_RIPPLE1,
;112:	EFFECT_RIPPLE2,
;113:	EFFECT_RUSHX,
;114:	EFFECT_RUSHY,
;115:	EFFECT_RUSHZ,
;116:	EFFECT_JITTERSOME,
;117:	EFFECT_JITTERALL,
;118:	EFFECT_BOBBLE,
;119:	EFFECT_FLIPX,
;120:	EFFECT_FLIPY,
;121:	EFFECT_FLIPZ,
;122:
;123:	COUNT_EFFECTS
;124:};
;125:
;126:
;127:
;128:// parameters stored for each effect
;129:typedef struct {
;130:	int type;	// EFFECT_* flag
;131:
;132:	int endtime;
;133:	int duration;
;134:	int param;	// extra data
;135:} effectParams_t;
;136:
;137:
;138://
;139:// the effects data table
;140://
;141:
;142:typedef void (*effectHandler)(effectParams_t*);
;143:
;144:typedef struct {
;145:	int frequency;
;146:	int mintime;
;147:	int range;
;148:	const char* name;
;149:	effectHandler effectFunc;
;150:} effectInfo_t;
;151:
;152:
;153:// declare handler functions
;154:static void Credits_Effect_RushX(effectParams_t* ep);
;155:static void Credits_Effect_RushY(effectParams_t* ep);
;156:static void Credits_Effect_RushZ(effectParams_t* ep);
;157:static void Credits_Effect_PulseXYZ(effectParams_t* ep);
;158:static void Credits_Effect_PulseXY(effectParams_t* ep);
;159:static void Credits_Effect_Ripple1(effectParams_t* ep);
;160:static void Credits_Effect_Ripple2(effectParams_t* ep);
;161:static void Credits_Effect_JitterSome(effectParams_t* ep);
;162:static void Credits_Effect_JitterAll(effectParams_t* ep);
;163:static void Credits_Effect_Bobble(effectParams_t* ep);
;164:static void Credits_Effect_FlipX(effectParams_t* ep);
;165:static void Credits_Effect_FlipY(effectParams_t* ep);
;166:static void Credits_Effect_FlipZ(effectParams_t* ep);
;167:
;168:
;169:// All effects *must* be invariant on completion. This means
;170:// that the xyz co-ordinates are unchanged after one period.
;171:// This prevents pixel jumps from one spatial position to another
;172:static effectInfo_t effectData[] = {
;173:	{ 400, 3000, 4000, "None", 0 },	// EFFECT_NONE
;174:	{ 15, 3000, 3000, "PulseXYZ", Credits_Effect_PulseXYZ },	// EFFECT_PULSEXYZ
;175:	{ 15, 3000, 3000, "PulseXY", Credits_Effect_PulseXY },	// EFFECT_PULSEXY
;176:	{ 15, 3000, 3000, "Ripple-1", Credits_Effect_Ripple1 },	// EFFECT_RIPPLE1
;177:	{ 15, 3000, 3000, "Ripple-2", Credits_Effect_Ripple2 },	// EFFECT_RIPPLE2
;178:	{ 10, 4000, 5000, "RushX", Credits_Effect_RushX },	// EFFECT_RUSHX
;179:	{ 10, 4000, 5000, "RushY", Credits_Effect_RushY },	// EFFECT_RUSHY
;180:	{ 10, 4000, 5000, "RushZ", Credits_Effect_RushZ },	// EFFECT_RUSHZ
;181:	{ 15, 2000, 4000, "JitterSome", Credits_Effect_JitterSome },	// EFFECT_JITTERSOME
;182:	{ 15, 2000, 4000, "JitterAll", Credits_Effect_JitterAll },	// EFFECT_JITTERALL
;183:	{ 30, 2000, 4000, "Bobble", Credits_Effect_Bobble },	// EFFECT_BOBBLE
;184:	{ 10, 3000, 2000, "Flip-X", Credits_Effect_FlipX},	// EFFECT_FLIPX
;185:	{ 10, 3000, 2000, "Flip-Y", Credits_Effect_FlipY},	// EFFECT_FLIPY
;186:	{ 10, 3000, 2000, "Flip-Z", Credits_Effect_FlipZ}	// EFFECT_FLIPZ
;187:};
;188:
;189:static const int effectDataCount = ARRAY_SIZEOF(effectData);
;190:
;191:
;192:
;193:
;194:
;195:// stores image data for a composite targa image
;196:typedef struct {
;197:	int weight;
;198:
;199:	const char* baseImage;
;200:	float baseWeight;
;201:	int baseResample;	// additional forced scaling factor when reducing large images
;202:
;203:	const char* overlayImage;
;204:	float overlayWeight;
;205:	int overlayResample;	// additional forced scaling factor when reducing large images
;206:} imageSource_t;
;207:
;208:static imageSource_t uieImageList[] = {
;209:	{ 100, "menu/default/logo1.tga", 1.0, 0, NULL, 0.0, 0 },	// displayed on first pass
;210:	{ 100, "menu/default/logo1.tga", 1.0, 0, NULL, 0.9, 0 },
;211:	{ 100, "menu/default/logo1.tga", 1.0, 0, NULL, 0.9, 0 }
;212:};
;213:
;214:
;215:
;216:
;217://--------------------------------------------------------------------
;218:
;219:
;220:
;221:// possible modes in which the credits may be displayed
;222:// (some activate only after first or second pass complete)
;223:#define CREDIT_NORMAL			0x0000
;224:#define CREDIT_SILLYTITLE 		0x0002
;225:#define CREDIT_REVERSETEXT 		0x0004
;226:#define CREDIT_HIGHREVERSETEXT 	0x0008
;227:#define CREDIT_SHUFFLETEXT		0x0010
;228:
;229:
;230:
;231:// possible ways of interpreting the data in creditEntry_t
;232:// CMODE_MODEL is currently not implemented
;233:#define CMODE_TEXT 				0
;234:#define CMODE_DUALTEXT			1
;235:#define CMODE_MODEL				2
;236:#define CMODE_SILLYTITLE		3
;237:#define CMODE_QUOTE				4
;238:#define CMODE_HARDTEXT			5
;239:
;240:// a single credit title/names combination
;241:// when title is NULL then its skipped during normal playback
;242:// but used as a title during silly stuff
;243:typedef struct {
;244:	int mode;	// CMODE_* flags
;245:
;246:	const char* title;
;247:	const char* text[MAX_CREDIT_LINES];
;248:} creditEntry_t;
;249:
;250:
;251:
;252:
;253:
;254:
;255:static creditEntry_t uie_credits[] = {
;256://	{ CMODE_TEXT, "", { "", 0, 0, 0 } },
;257:	{ CMODE_TEXT, "Quake Sandbox", {"Noire.dev", 0, 0, 0  } },
;258:	{ CMODE_TEXT, "Game", {"Noire.dev", "Vovan_Vm", "teapxt", 0} },
;259:	{ CMODE_QUOTE, 0, {0, 0, 0, 0} }
;260:};
;261:
;262:
;263:
;264://--------------------------------------------------------------------
;265:
;266:
;267:// Replacement images for special dates
;268:// these have a high priority for being shown
;269:
;270:
;271:typedef struct {
;272:	int day;	// 1-31
;273:	int month;	// 0-11
;274:	imageSource_t image;
;275:} dateImageList_t;
;276:
;277:
;278:
;279:static dateImageList_t uie_dateImages[] = {
;280:	{ 31, 11, { 0, "menu/uie_art/imagenewyear.tga", 1.0, 0, NULL, 1.0, 0 }},
;281:	{ 16, 7, { 0, "menu/uie_art/imagesecret.tga", 1.0, 0, NULL, 1.0, 0 }},
;282:	{ 22, 2, { 0, "menu/uie_art/imagesecret.tga", 1.0, 0, NULL, 1.0, 0 }}
;283:};
;284:
;285:
;286:
;287:
;288://--------------------------------------------------------------------
;289:
;290:
;291:
;292:// a group of credits, associated with one background image
;293:typedef struct {
;294:	int modes;	// allowed display formats CREDIT_* (so we can do some silly things)
;295:	creditEntry_t* credits;
;296:	int numCredits;
;297:	const char* discShader;
;298:
;299:	const imageSource_t* imageList;
;300:	int imageListSize;
;301:
;302:	const dateImageList_t* dateImages;
;303:	int dateImagesSize;
;304:
;305:	float* color_title;
;306:	float* color_text;
;307:} creditList_t;
;308:
;309:
;310:
;311:static creditList_t endCredits[] = {
;312:	{ CREDIT_NORMAL|CREDIT_SILLYTITLE|CREDIT_REVERSETEXT,
;313:		uie_credits, ARRAY_SIZEOF(uie_credits),
;314:		"uie_creditdisc", uieImageList, ARRAY_SIZEOF(uieImageList),
;315:		uie_dateImages, ARRAY_SIZEOF(uie_dateImages),
;316:		color_credit_title, color_credit_text }
;317:};
;318:
;319:
;320:static const int numEndCredits = ARRAY_SIZEOF(endCredits);
;321:
;322:
;323:
;324://--------------------------------------------------------------------
;325:
;326:
;327:// replacement title messages
;328:// only used with a body of text
;329:static char* sillyTitles[] = {
;330:"404: Cast Not Found",
;331:    "Hello World Coders",
;332:    "Variable Name Ninjas",
;333:
;334:    "Bug Squashers United",
;335:
;336:    "Agile Sprint Runners",
;337:    "Syntax Error Detectives",
;338:
;339:    "Infinite Loop Survivors",
;340:    "Null Pointer Defenders",
;341:
;342:    "Version Control Heroes",
;343:
;344:    "Stack Overflow Rescuers",
;345:    "Hackathon Champions",
;346:    "Unit Test Warriors",
;347:
;348:    "Happy Debugging!",
;349:    "Missing Semicolons",
;350:    "Recursive Thinkers",
;351:    "Open Source Crusaders",
;352:    "Server Sidekick",
;353:    "Prime Number Enthusiasts",
;354:    "Bitwise Operators",
;355:    "Binary Tree Navigators",
;356:    "95% Done (Again)",
;357:    "Refactoring Experts",
;358:    "Cloud Architects",
;359:    "Kernel Panic Survivors",
;360:    "Coffee Script Addicts",
;361:    "Ctrl+C/Ctrl+V Masters",
;362:    "Algorithm Optimizers",
;363:    "Regex Magicians"
;364:};
;365:
;366:static const int sillyTitlesCount = ARRAY_SIZEOF(sillyTitles);
;367:
;368:
;369:
;370:// messages that make "sense" on their own
;371:static char* sillyMessages[] = {
;372:	"Server for Sale",
;373:    "'Tis But a Segfault",
;374:    "Throwing Exceptions is Fun",
;375:    "print('Pthbbbttthhh!')",
;376:    "try: except: Timmy!",
;377:    "Regnagleppod: Undefined Variable",
;378:    "One Script to Rule Them All",
;379:    "127.0.0.1",
;380:    "Unit Test AE-35 is Failing",
;381:    "printf('Thunderbirds are Go!')",
;382:    "The Voice of the Sysadmin",
;383:    "Bring Back the Debugger!",
;384:    "Oops! Bug Detected",
;385:    "Conserving CPU Cycles",
;386:    "Keyboard Error, Press Ctrl+Alt+Del",
;387:    "printf('ETAOIN SHRDLU')",
;388:    "70's Retro Code Sucks!",
;389:    "Use the Source, Luke",
;390:    "null",
;391:    "That Bored, Running Lint?",
;392:    "I Do Not Understand My Own Code",
;393:    "Contracrostipunctus: Code Obfuscation",
;394:    "All Your Base Are Belong to Us",
;395:    "System.out.println('My god, it\'s full of stars!')"
;396:};
;397:
;398:static const int sillyMessagesCount = ARRAY_SIZEOF(sillyMessages);
;399:
;400:
;401:
;402://--------------------------------------------------------------------
;403:
;404:
;405:// list of random quotes
;406:
;407:typedef struct {
;408:	int weight;
;409:	creditEntry_t quote;
;410:} quoteData_t;
;411:
;412:
;413:
;414:static quoteData_t quoteList[] = {
;415:	{ 10, { CMODE_HARDTEXT, NULL, {"\"Truth and Beauty are", "less common than semicolons\"", 0, 0 } } },
;416:    { 10, { CMODE_HARDTEXT, NULL, {"\"And so it begins", "You have forgotten to close a bracket\"", "Coder's Nightmare", 0 } } },
;417:    { 10, { CMODE_HARDTEXT, NULL, {"\"The Universe is run by the complex", "interweaving of three elements: energy,", "matter, and clean code\"", "Programmer's Philosophy" } } },
;418:    { 10, { CMODE_HARDTEXT, NULL, {"\"You should never hand someone", "a debugger unless you're sure", "they know how to use it\"", "Senior Dev Advice" } } },
;419:    { 10, { CMODE_HARDTEXT, NULL, {"\"Do not try the patience of programmers", "for they are subtle and quick to debug\"", 0, 0 } } },
;420:    { 10, { CMODE_HARDTEXT, NULL, {"\"Never try to outstubborn a legacy system\"", 0, 0, 0 } } },
;421:    { 5, { CMODE_HARDTEXT, NULL, {"\"Never eat yellow snow\"", "And never trust user input", 0, 0 } } },
;422:    { 10, { CMODE_HARDTEXT, NULL, {"\"Never underestimate the power", "of infinite loops\"", 0, 0 } } },
;423:    { 10, { CMODE_HARDTEXT, NULL, {"\"How you behave towards documentation", "determines your success as a coder\"", 0, 0 } } },
;424:    { 10, { CMODE_HARDTEXT, NULL, {"\"LART: Luser Attitude Readjustment Tool.", "Rubber ducks are popular.\"", 0, 0 } } },
;425:    { 10, { CMODE_HARDTEXT, NULL, {"\"You can have performance.", "Or you can have readability.", "Don't ever count on having both at once.\"", 0 } } },
;426:    { 10, { CMODE_HARDTEXT, NULL, {"\"Incoming message\"", "from the exception handler", 0, 0 } } }
;427://	{ 10, { CMODE_HARDTEXT, NULL, {"\"\"", 0, 0, 0 } } },
;428://	{ 10, { CMODE_HARDTEXT, NULL, {"\"\"", 0, 0, 0 } } }
;429://	{ 10, { CMODE_HARDTEXT, NULL, {0, 0, 0, 0 } } }
;430:};
;431:
;432:
;433:
;434:static const int quoteListSize = ARRAY_SIZEOF(quoteList);
;435:
;436://--------------------------------------------------------------------
;437:
;438:
;439:// credit display info
;440:typedef struct {
;441:	qboolean bDrawn;
;442:	float transparency;
;443:
;444:	int indexCredit;		// offset in credit group
;445:
;446:	int indexData;	// text index, interpretation depends on CMODE_* flag
;447:
;448:	int numLines;
;449:	int duration;
;450:	int finishTime;
;451:
;452:	int offset_y;
;453:
;454:	const char* titleString;
;455:
;456:	// drawn background
;457:	int width;
;458:	int height;
;459:} displayCredit_t;
;460:
;461:
;462:
;463:
;464:// TGA image data
;465:typedef struct {
;466:	// targa image data
;467:	byte targa[TARGA_BUFSIZE];
;468:
;469:	int width;
;470:	int height;
;471:
;472:	int coloursize;	// bytes per colour
;473:
;474:	float scale;	// normalization factor for screen
;475:} imageTarga_t;
;476:
;477:
;478:
;479://--------------------------------------------------------------------
;480:
;481:
;482:
;483://
;484:// the menu
;485://
;486:typedef struct {
;487:	menuframework_s	menu;
;488:
;489:	//
;490:	// title text
;491:	//
;492:
;493:	int textGroup;	// index to group of text being drawn
;494:
;495:	displayCredit_t credit[MAX_CREDITS_ONSCREEN];
;496:
;497:	int textPass;
;498:	int activeCreditModes;
;499:	int dualTextPhase;
;500:
;501:	// stores indices of recently used values
;502:	// to avoid repetition
;503:	int recentMessage[MAX_RECENT_MEMORY];
;504:	int recentMessagePos;
;505:
;506:	int recentTitle[MAX_RECENT_MEMORY];
;507:	int recentTitlePos;
;508:
;509:	int recentQuote[MAX_RECENT_MEMORY];
;510:	int recentQuotePos;
;511:
;512:	//
;513:	// drawing the image
;514:	//
;515:
;516:	// targa image data
;517:	imageTarga_t tga;
;518:
;519:	int numPoints;	// number of pixels in array
;520:	int drawn[MAX_RENDEREDPIXELS];	// indices of pixels that will be drawn on screen
;521:	vec3_t scr_pos[MAX_RENDEREDPIXELS];	// position after transforms
;522:	vec3_t base_pos[MAX_RENDEREDPIXELS];	// position before transforms (constant for duration of image)
;523:
;524:	// view animation data
;525:	int imageMode;
;526:	int imageFinishTime;	// when mode will finish
;527:
;528:	// effect data
;529:	effectParams_t effects[MAX_EFFECTS];
;530:
;531:	// view point data
;532:	vec3_t viewangles;
;533:	vec3_t angledelta;	// angular rate per second
;534:	vec3_t old_angledelta;	// used for blends
;535:} creditsmenu_t;
;536:
;537:static creditsmenu_t	s_credits;
;538:
;539:
;540:
;541://--------------------------------------------------------------------
;542:
;543:
;544:
;545:
;546:/*
;547:=================
;548:ShuffleText
;549:=================
;550:*/
;551:static void ShuffleText(char* text)
;552:{
line 557
;553:	int len, i;
;554:	char c;
;555:	int count;
;556:
;557:	if (!text)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $197
line 558
;558:		return;
ADDRGP4 $196
JUMPV
LABELV $197
line 560
;559:
;560:	count = 64*random();
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
CNSTF4 1115684864
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 561
;561:	len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 562
;562:	if (len < 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
GEI4 $202
line 563
;563:		return;
ADDRGP4 $196
JUMPV
LABELV $201
line 565
;564:
;565:	while (count-- > 0) {
LABELV $204
line 566
;566:		do {
line 567
;567:			i = len*random();
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 568
;568:		} while (i == len);
LABELV $205
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $204
line 570
;569:
;570:		c = text[i];
ADDRLP4 12
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 571
;571:		text[i] = text[count % len];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ADDRLP4 24
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 572
;572:		text[count % len] = c;
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 12
INDIRI1
ASGNI1
line 573
;573:	}
LABELV $202
line 565
ADDRLP4 24
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
GTI4 $201
line 574
;574:}
LABELV $196
endproc ShuffleText 28 4
proc ReverseText 24 4
line 584
;575:
;576:
;577:
;578:/*
;579:=================
;580:ReverseText
;581:=================
;582:*/
;583:static void ReverseText(char* text)
;584:{
line 588
;585:	int len, i;
;586:	char c;
;587:
;588:	len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 589
;589:	if (len < 2)
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $208
line 590
;590:		return;
ADDRGP4 $207
JUMPV
LABELV $208
line 592
;591:
;592:	for (i = 0; i < len/2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $213
JUMPV
LABELV $210
line 593
;593:		c = text[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 594
;594:		text[i] = text[len - i - 1];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 595
;595:		text[len - i - 1] = c;
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 8
INDIRI1
ASGNI1
line 596
;596:	}
LABELV $211
line 592
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $213
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
LTI4 $210
line 597
;597:}
LABELV $207
endproc ReverseText 24 4
proc AngleAdd 4 0
line 606
;598:
;599:
;600:/*
;601:=================
;602:AngleAdd
;603:=================
;604:*/
;605:static float AngleAdd(float a1, float a2)
;606:{
line 609
;607:	float a;
;608:
;609:	a = a1 + a2;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $216
JUMPV
LABELV $215
line 610
;610:	while (a > 180.0) {
line 611
;611:		a -= 360.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 612
;612:	}
LABELV $216
line 610
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
GTF4 $215
ADDRGP4 $219
JUMPV
LABELV $218
line 613
;613:	while (a < -180.0) {
line 614
;614:		a += 360.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 615
;615:	}
LABELV $219
line 613
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
LTF4 $218
line 616
;616:	return a;
ADDRLP4 0
INDIRF4
RETF4
LABELV $214
endproc AngleAdd 4 0
proc AngleMA 20 8
line 627
;617:}
;618:
;619:
;620:
;621:/*
;622:=================
;623:AngleMA
;624:=================
;625:*/
;626:static void AngleMA(vec3_t aa, float scale, vec3_t ab, vec3_t ac)
;627:{
line 628
;628:	ac[0] = AngleAdd(aa[0], scale * ab[0]);
ADDRFP4 0
INDIRP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ARGF4
ADDRLP4 0
ADDRGP4 AngleAdd
CALLF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRF4
ASGNF4
line 629
;629:	ac[1] = AngleAdd(aa[1], scale * ab[1]);
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
MULF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleAdd
CALLF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 630
;630:	ac[2] = AngleAdd(aa[2], scale * ab[2]);
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
MULF4
ARGF4
ADDRLP4 16
ADDRGP4 AngleAdd
CALLF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 631
;631:}
LABELV $221
endproc AngleMA 20 8
proc AnglesAdd 20 8
line 641
;632:
;633:
;634:
;635:/*
;636:=================
;637:AnglesAdd
;638:=================
;639:*/
;640:static void AnglesAdd(vec3_t a1, vec3_t a2, vec3_t dest)
;641:{
line 642
;642:	dest[0] = AngleAdd(a1[0], a2[0]);
ADDRFP4 0
INDIRP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 AngleAdd
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRF4
ASGNF4
line 643
;643:	dest[1] = AngleAdd(a1[1], a2[1]);
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleAdd
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 644
;644:	dest[2] = AngleAdd(a1[2], a2[2]);
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 AngleAdd
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 645
;645:}
LABELV $222
endproc AnglesAdd 20 8
proc LerpAngles 20 12
line 655
;646:
;647:
;648:
;649:/*
;650:=================
;651:LerpAngles
;652:=================
;653:*/
;654:static void LerpAngles(vec3_t from, vec3_t to, vec3_t dest, float frac)
;655:{
line 656
;656:	dest[0] = LerpAngle(from[0], to[0], frac);
ADDRFP4 0
INDIRP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRF4
ASGNF4
line 657
;657:	dest[1] = LerpAngle(from[1], to[1], frac);
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 658
;658:	dest[2] = LerpAngle(from[2], to[2], frac);
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 659
;659:}
LABELV $223
endproc LerpAngles 20 12
proc ColorTransparency 12 0
line 669
;660:
;661:
;662:
;663:/*
;664:=================
;665:ColorTransparency
;666:=================
;667:*/
;668:static void ColorTransparency(vec4_t in, vec4_t out, float t)
;669:{
line 670
;670:	out[0] = in[0];
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 671
;671:	out[1] = in[1];
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 672
;672:	out[2] = in[2];
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 673
;673:	out[3] = in[3] * t;
ADDRLP4 8
CNSTI4 12
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 674
;674:}
LABELV $224
endproc ColorTransparency 12 0
proc TimeFrac 4 0
line 685
;675:
;676:
;677:
;678:
;679:/*
;680:=================
;681:Credits_GetTimeFrac
;682:=================
;683:*/
;684:static float TimeFrac(int t, int step)
;685:{
line 688
;686:	float f;
;687:
;688:	f = (float)(t - uis.realtime);
ADDRLP4 0
ADDRFP4 0
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 689
;689:	f /= (float)step;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 691
;690:
;691:	if (f < 0.0)
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $227
line 692
;692:		f = 0.0;
ADDRLP4 0
CNSTF4 0
ASGNF4
LABELV $227
line 694
;693:
;694:	if (f > 1.0)
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
LEF4 $229
line 695
;695:		f = 1.0;	
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
LABELV $229
line 697
;696:
;697:	return f;
ADDRLP4 0
INDIRF4
RETF4
LABELV $225
endproc TimeFrac 4 0
proc Credits_SetRandomRotate 40 4
line 709
;698:}
;699:
;700:
;701:
;702:
;703:/*
;704:=================
;705:Credits_SetRandomRotate
;706:=================
;707:*/
;708:static void Credits_SetRandomRotate(vec3_t v)
;709:{
LABELV $232
line 712
;710:	int nulled;
;711:
;712:	do {
line 713
;713:		nulled = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 715
;714:
;715:		v[PITCH] = (1.0 - 2.0*random()) * random() * MAXROTATE_DELTA;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTF4 1112014848
CNSTF4 1065353216
CNSTF4 1073741824
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
SUBF4
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
MULF4
ASGNF4
line 716
;716:		v[ROLL] = (1.0 - 2.0*random()) * random() * MAXROTATE_DELTA;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1112014848
CNSTF4 1065353216
CNSTF4 1073741824
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
SUBF4
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
MULF4
ASGNF4
line 717
;717:		v[YAW] = (1.0 - 2.0*random()) * random() * MAXROTATE_DELTA;
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1112014848
CNSTF4 1065353216
CNSTF4 1073741824
ADDRLP4 20
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
SUBF4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
MULF4
ASGNF4
line 719
;718:
;719:		if (abs(v[PITCH]) < 10) {
ADDRFP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 28
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 10
GEI4 $235
line 720
;720:			nulled++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 721
;721:			v[PITCH] = 0.0;
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 722
;722:		}
LABELV $235
line 724
;723:
;724:		if (abs(v[ROLL]) < 10) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 32
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 10
GEI4 $237
line 725
;725:			nulled++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 726
;726:			v[ROLL] = 0.0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 727
;727:		}
LABELV $237
line 729
;728:
;729:		if (abs(v[YAW]) < 10) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 10
GEI4 $239
line 730
;730:			nulled++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 731
;731:			v[YAW] = 0.0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 732
;732:		}
LABELV $239
line 733
;733:	} while (nulled > 1);
LABELV $233
ADDRLP4 0
INDIRI4
CNSTI4 1
GTI4 $232
line 734
;734:}
LABELV $231
endproc Credits_SetRandomRotate 40 4
proc Credits_ImplementRush 32 8
line 747
;735:
;736:
;737:
;738:
;739:
;740:
;741:/*
;742:===============
;743:Credits_ImplementRush
;744:===============
;745:*/
;746:static void Credits_ImplementRush(effectParams_t* ep, int index)
;747:{
line 753
;748:	int i;
;749:	float frac;
;750:	float p;
;751:	float s;
;752:
;753:	if (!ep)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $242
line 754
;754:		return;
ADDRGP4 $241
JUMPV
LABELV $242
line 756
;755:
;756:	frac = 0.5 - 0.5*cos(M_PI * TimeFrac(ep->endtime, ep->duration));
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TimeFrac
CALLF4
ASGNF4
CNSTF4 1078530011
ADDRLP4 20
INDIRF4
MULF4
ARGF4
ADDRLP4 24
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 28
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
SUBF4
ASGNF4
line 758
;757:
;758:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $244
line 759
;759:		p = s_credits.scr_pos[i][index];
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ADDP4
INDIRF4
ASGNF4
line 760
;760:		s = (1.0 + (i % 4)) * frac;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 4
MODI4
CVIF4 4
CNSTF4 1065353216
ADDF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 761
;761:		if (ep->param) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $250
line 762
;762:			p += s;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $253
JUMPV
LABELV $252
line 764
;763:			while (p > 0.5)
;764:				p -= 1.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
LABELV $253
line 763
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
GTF4 $252
line 765
;765:		}
ADDRGP4 $251
JUMPV
LABELV $250
line 766
;766:		else {
line 767
;767:			p -= s;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $256
JUMPV
LABELV $255
line 769
;768:			while (p < -0.5)
;769:				p += 1.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
LABELV $256
line 768
ADDRLP4 0
INDIRF4
CNSTF4 3204448256
LTF4 $255
line 770
;770:		}
LABELV $251
line 771
;771:		s_credits.scr_pos[i][index] = p;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 772
;772:	}
LABELV $245
line 758
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $247
ADDRLP4 4
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $244
line 773
;773:}
LABELV $241
endproc Credits_ImplementRush 32 8
proc Credits_Effect_RushZ 0 8
line 785
;774:
;775:
;776:
;777:
;778:
;779:/*
;780:===============
;781:Credits_Effect_RushZ
;782:===============
;783:*/
;784:static void Credits_Effect_RushZ(effectParams_t* ep)
;785:{
line 786
;786:	Credits_ImplementRush(ep, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Credits_ImplementRush
CALLV
pop
line 787
;787:}
LABELV $259
endproc Credits_Effect_RushZ 0 8
proc Credits_Effect_RushY 0 8
line 798
;788:
;789:
;790:
;791:
;792:/*
;793:===============
;794:Credits_Effect_RushY
;795:===============
;796:*/
;797:static void Credits_Effect_RushY(effectParams_t* ep)
;798:{
line 799
;799:	Credits_ImplementRush(ep, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Credits_ImplementRush
CALLV
pop
line 800
;800:}
LABELV $260
endproc Credits_Effect_RushY 0 8
proc Credits_Effect_RushX 0 8
line 811
;801:
;802:
;803:
;804:
;805:/*
;806:===============
;807:Credits_Effect_RushX
;808:===============
;809:*/
;810:static void Credits_Effect_RushX(effectParams_t* ep)
;811:{
line 812
;812:	Credits_ImplementRush(ep, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Credits_ImplementRush
CALLV
pop
line 813
;813:}
LABELV $261
endproc Credits_Effect_RushX 0 8
proc Credits_Effect_PulseXY 40 8
line 823
;814:
;815:
;816:
;817:/*
;818:===============
;819:Credits_Effect_PulseXY
;820:===============
;821:*/
;822:static void Credits_Effect_PulseXY(effectParams_t* ep)
;823:{
line 829
;824:	int i;
;825:	float frac;
;826:	float amp;
;827:	float scale;
;828:
;829:	if (!ep)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $263
line 830
;830:		return;
ADDRGP4 $262
JUMPV
LABELV $263
line 832
;831:
;832:	amp = 0.02;
ADDRLP4 12
CNSTF4 1017370378
ASGNF4
line 833
;833:	frac = TimeFrac(ep->endtime, ep->duration);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 20
INDIRF4
ASGNF4
line 834
;834:	if (frac < 0.2) {
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
GEF4 $265
line 835
;835:		amp *= (frac)/0.2;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 836
;836:	}
ADDRGP4 $266
JUMPV
LABELV $265
line 837
;837:	else if (frac > 0.8) {
ADDRLP4 8
INDIRF4
CNSTF4 1061997773
LEF4 $267
line 838
;838:		amp *= (1.0 - frac)/0.2;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
SUBF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 839
;839:	}
LABELV $267
LABELV $266
line 841
;840:
;841:	frac *= frac;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 842
;842:	scale = 1.0 + amp*sin(12 * M_PI * frac);
CNSTF4 1108790244
ADDRLP4 8
INDIRF4
MULF4
ARGF4
ADDRLP4 28
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 844
;843:
;844:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $272
JUMPV
LABELV $269
line 845
;845:		s_credits.scr_pos[i][1] *= scale;
ADDRLP4 32
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460+4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 846
;846:		s_credits.scr_pos[i][2] *= scale;
ADDRLP4 36
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460+8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 847
;847:	}
LABELV $270
line 844
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $272
ADDRLP4 0
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $269
line 848
;848:}
LABELV $262
endproc Credits_Effect_PulseXY 40 8
proc Credits_Effect_PulseXYZ 52 8
line 858
;849:
;850:
;851:
;852:/*
;853:===============
;854:Credits_Effect_PulseXYZ
;855:===============
;856:*/
;857:static void Credits_Effect_PulseXYZ(effectParams_t* ep)
;858:{
line 865
;859:	int i;
;860:	float frac;
;861:	float amp;
;862:	float scale;
;863:	float* pt;
;864:
;865:	if (!ep)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $279
line 866
;866:		return;
ADDRGP4 $278
JUMPV
LABELV $279
line 868
;867:
;868:	amp = 0.02;
ADDRLP4 16
CNSTF4 1017370378
ASGNF4
line 869
;869:	frac = TimeFrac(ep->endtime, ep->duration);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 870
;870:	if (frac < 0.2) {
ADDRLP4 12
INDIRF4
CNSTF4 1045220557
GEF4 $281
line 871
;871:		amp *= (frac)/0.2;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 872
;872:	}
ADDRGP4 $282
JUMPV
LABELV $281
line 873
;873:	else if (frac > 0.8) {
ADDRLP4 12
INDIRF4
CNSTF4 1061997773
LEF4 $283
line 874
;874:		amp *= (1.0 - frac)/0.2;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1065353216
ADDRLP4 12
INDIRF4
SUBF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 875
;875:	}
LABELV $283
LABELV $282
line 877
;876:
;877:	frac *= frac;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 878
;878:	scale = 1.0 + amp*sin(4 * M_PI * frac );
CNSTF4 1095307227
ADDRLP4 12
INDIRF4
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 880
;879:
;880:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $285
line 881
;881:		pt  = s_credits.scr_pos[i];
ADDRLP4 0
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ASGNP4
line 882
;882:		pt[1] *= scale;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 883
;883:		pt[2] *= scale;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 884
;884:		pt[0] = 0.5 + (pt[0] - 0.5) * scale;
ADDRLP4 48
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 48
INDIRF4
SUBF4
ADDRLP4 8
INDIRF4
MULF4
ADDRLP4 48
INDIRF4
ADDF4
ASGNF4
line 885
;885:	}
LABELV $286
line 880
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $288
ADDRLP4 4
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $285
line 886
;886:}
LABELV $278
endproc Credits_Effect_PulseXYZ 52 8
proc Credits_Effect_Ripple1 32 8
line 896
;887:
;888:
;889:
;890:/*
;891:===============
;892:Credits_Effect_Ripple1
;893:===============
;894:*/
;895:static void Credits_Effect_Ripple1(effectParams_t* ep)
;896:{
line 902
;897:	int i;
;898:	float frac;
;899:	float amp;
;900:	float phase;
;901:
;902:	if (!ep)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $292
line 903
;903:		return;
ADDRGP4 $291
JUMPV
LABELV $292
line 905
;904:
;905:	frac = TimeFrac(ep->endtime, ep->duration);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 20
INDIRF4
ASGNF4
line 906
;906:	amp = 0.01;
ADDRLP4 12
CNSTF4 1008981770
ASGNF4
line 907
;907:	if (frac < 0.2) {
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
GEF4 $294
line 908
;908:		amp *= (frac)/0.2;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 909
;909:	}
ADDRGP4 $295
JUMPV
LABELV $294
line 910
;910:	else if (frac > 0.8) {
ADDRLP4 8
INDIRF4
CNSTF4 1061997773
LEF4 $296
line 911
;911:		amp *= (1.0 - frac)/0.2;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
SUBF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 912
;912:	}
LABELV $296
LABELV $295
line 914
;913:
;914:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $301
JUMPV
LABELV $298
line 915
;915:		phase = s_credits.tga.width * frac - (s_credits.drawn[i] % s_credits.tga.width);
ADDRLP4 4
ADDRGP4 s_credits+1312+32768
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_credits+34100
ADDP4
INDIRI4
ADDRGP4 s_credits+1312+32768
INDIRI4
MODI4
CVIF4 4
SUBF4
ASGNF4
line 917
;916:
;917:		s_credits.scr_pos[i][0] += amp * sin(0.1 * M_PI * phase);
CNSTF4 1050728828
ADDRLP4 4
INDIRF4
MULF4
ARGF4
ADDRLP4 24
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 918
;918:	}
LABELV $299
line 914
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $301
ADDRLP4 0
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $298
line 919
;919:}
LABELV $291
endproc Credits_Effect_Ripple1 32 8
proc Credits_Effect_Ripple2 32 8
line 929
;920:
;921:
;922:
;923:/*
;924:===============
;925:Credits_Effect_Ripple2
;926:===============
;927:*/
;928:static void Credits_Effect_Ripple2(effectParams_t* ep)
;929:{
line 935
;930:	int i;
;931:	float frac;
;932:	float amp;
;933:	float phase;
;934:
;935:	if (!ep)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $310
line 936
;936:		return;
ADDRGP4 $309
JUMPV
LABELV $310
line 938
;937:
;938:	frac = TimeFrac(ep->endtime, ep->duration);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 20
INDIRF4
ASGNF4
line 939
;939:	amp = 0.01;
ADDRLP4 12
CNSTF4 1008981770
ASGNF4
line 940
;940:	if (frac < 0.2) {
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
GEF4 $312
line 941
;941:		amp *= (frac)/0.2;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 942
;942:	}
ADDRGP4 $313
JUMPV
LABELV $312
line 943
;943:	else if (frac > 0.8) {
ADDRLP4 8
INDIRF4
CNSTF4 1061997773
LEF4 $314
line 944
;944:		amp *= (1.0 - frac)/0.2;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
SUBF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 945
;945:	}
LABELV $314
LABELV $313
line 947
;946:
;947:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $319
JUMPV
LABELV $316
line 948
;948:		phase = s_credits.tga.height * frac - (s_credits.drawn[i] / s_credits.tga.width);
ADDRLP4 4
ADDRGP4 s_credits+1312+32772
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_credits+34100
ADDP4
INDIRI4
ADDRGP4 s_credits+1312+32768
INDIRI4
DIVI4
CVIF4 4
SUBF4
ASGNF4
line 950
;949:
;950:		s_credits.scr_pos[i][0] += amp * sin(0.1 * M_PI * phase);
CNSTF4 1050728828
ADDRLP4 4
INDIRF4
MULF4
ARGF4
ADDRLP4 24
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 951
;951:	}
LABELV $317
line 947
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $319
ADDRLP4 0
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $316
line 952
;952:}
LABELV $309
endproc Credits_Effect_Ripple2 32 8
proc Credits_Effect_JitterAll 40 8
line 964
;953:
;954:
;955:
;956:
;957:
;958:/*
;959:===============
;960:Credits_Effect_JitterAll
;961:===============
;962:*/
;963:static void Credits_Effect_JitterAll(effectParams_t* ep)
;964:{
line 970
;965:	int i;
;966:	float frac;
;967:	float amp;
;968:	float phase;
;969:
;970:	if (!ep)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $328
line 971
;971:		return;
ADDRGP4 $327
JUMPV
LABELV $328
line 973
;972:
;973:	frac = TimeFrac(ep->endtime, ep->duration);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 20
INDIRF4
ASGNF4
line 974
;974:	amp = 0.01;
ADDRLP4 4
CNSTF4 1008981770
ASGNF4
line 975
;975:	if (frac < 0.2) {
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
GEF4 $330
line 976
;976:		amp *= (frac)/0.2;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 977
;977:	}
ADDRGP4 $331
JUMPV
LABELV $330
line 978
;978:	else if (frac > 0.8) {
ADDRLP4 8
INDIRF4
CNSTF4 1061997773
LEF4 $332
line 979
;979:		amp *= (1.0 - frac)/0.2;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
SUBF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 980
;980:	}
LABELV $332
LABELV $331
line 982
;981:
;982:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $337
JUMPV
LABELV $334
line 983
;983:		s_credits.scr_pos[i][1] += amp * (0.5 - random());
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460+4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
SUBF4
MULF4
ADDF4
ASGNF4
line 984
;984:		s_credits.scr_pos[i][2] += amp * (0.5 - random());
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460+8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
SUBF4
MULF4
ADDF4
ASGNF4
line 985
;985:	}
LABELV $335
line 982
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $337
ADDRLP4 0
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $334
line 986
;986:}
LABELV $327
endproc Credits_Effect_JitterAll 40 8
proc Credits_Effect_JitterSome 44 8
line 996
;987:
;988:
;989:
;990:/*
;991:===============
;992:Credits_Effect_JitterSome
;993:===============
;994:*/
;995:static void Credits_Effect_JitterSome(effectParams_t* ep)
;996:{
line 1002
;997:	int i;
;998:	float frac;
;999:	float amp;
;1000:	float phase;
;1001:
;1002:	if (!ep)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $344
line 1003
;1003:		return;
ADDRGP4 $343
JUMPV
LABELV $344
line 1005
;1004:
;1005:	frac = TimeFrac(ep->endtime, ep->duration);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 20
INDIRF4
ASGNF4
line 1006
;1006:	amp = 0.01;
ADDRLP4 4
CNSTF4 1008981770
ASGNF4
line 1007
;1007:	if (frac < 0.2) {
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
GEF4 $346
line 1008
;1008:		amp *= (frac)/0.2;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 1009
;1009:	}
ADDRGP4 $347
JUMPV
LABELV $346
line 1010
;1010:	else if (frac > 0.8) {
ADDRLP4 8
INDIRF4
CNSTF4 1061997773
LEF4 $348
line 1011
;1011:		amp *= (1.0 - frac)/0.2;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
SUBF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 1012
;1012:	}
LABELV $348
LABELV $347
line 1014
;1013:
;1014:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $353
JUMPV
LABELV $350
line 1015
;1015:		if (random() < 0.9)
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1063675494
GEF4 $355
line 1016
;1016:			continue;
ADDRGP4 $351
JUMPV
LABELV $355
line 1017
;1017:		s_credits.scr_pos[i][1] += amp * (0.5 - random());
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 32
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460+4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1018
;1018:		s_credits.scr_pos[i][2] += amp * (0.5 - random());
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460+8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1019
;1019:	}
LABELV $351
line 1014
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $353
ADDRLP4 0
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $350
line 1020
;1020:}
LABELV $343
endproc Credits_Effect_JitterSome 44 8
proc Credits_Effect_Bobble 48 8
line 1030
;1021:
;1022:
;1023:
;1024:/*
;1025:===============
;1026:Credits_Effect_Bobble
;1027:===============
;1028:*/
;1029:static void Credits_Effect_Bobble(effectParams_t* ep)
;1030:{
line 1036
;1031:	int i;
;1032:	float frac;
;1033:	float amp;
;1034:	float phase;
;1035:
;1036:	if (!ep)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $362
line 1037
;1037:		return;
ADDRGP4 $361
JUMPV
LABELV $362
line 1039
;1038:
;1039:	frac = TimeFrac(ep->endtime, ep->duration);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 20
INDIRF4
ASGNF4
line 1040
;1040:	amp = 0.01;
ADDRLP4 4
CNSTF4 1008981770
ASGNF4
line 1041
;1041:	if (frac < 0.2) {
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
GEF4 $364
line 1042
;1042:		amp *= (frac)/0.2;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 1043
;1043:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 1044
;1044:	else if (frac > 0.8) {
ADDRLP4 8
INDIRF4
CNSTF4 1061997773
LEF4 $366
line 1045
;1045:		amp *= (1.0 - frac)/0.2;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
SUBF4
CNSTF4 1045220557
DIVF4
MULF4
ASGNF4
line 1046
;1046:	}
LABELV $366
LABELV $365
line 1048
;1047:
;1048:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $371
JUMPV
LABELV $368
line 1049
;1049:		s_credits.scr_pos[i][0] += amp * random();
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 1050
;1050:		s_credits.scr_pos[i][1] += amp * (0.5 - random());
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460+4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1051
;1051:		s_credits.scr_pos[i][2] += amp * (0.5 - random());
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 44
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460+8
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1052
;1052:	}
LABELV $369
line 1048
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $371
ADDRLP4 0
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $368
line 1053
;1053:}
LABELV $361
endproc Credits_Effect_Bobble 48 8
proc Credits_ImplementFlip 60 8
line 1064
;1054:
;1055:
;1056:
;1057:
;1058:/*
;1059:===============
;1060:Credits_ImplementFlip
;1061:===============
;1062:*/
;1063:static void Credits_ImplementFlip(effectParams_t* ep, int axis1, int axis2)
;1064:{
line 1071
;1065:	int i;
;1066:	float frac;
;1067:	float phase;
;1068:	float x, z;
;1069:	float c, s;
;1070:
;1071:	if (!ep || axis1 < 0 || axis1 > 2 || axis2 < 0 || axis2 > 2)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $384
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $384
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 36
INDIRI4
GTI4 $384
ADDRLP4 40
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $384
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $379
LABELV $384
line 1072
;1072:		return;
ADDRGP4 $378
JUMPV
LABELV $379
line 1074
;1073:
;1074:	frac = TimeFrac(ep->endtime, ep->duration);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 1076
;1075:
;1076:	if (frac < 0.2) {
ADDRLP4 20
INDIRF4
CNSTF4 1045220557
GEF4 $385
line 1077
;1077:		phase = frac*frac/0.2;
ADDRLP4 24
ADDRLP4 20
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
CNSTF4 1045220557
DIVF4
ASGNF4
line 1078
;1078:	}
ADDRGP4 $386
JUMPV
LABELV $385
line 1079
;1079:	else if (frac > 0.8) {
ADDRLP4 20
INDIRF4
CNSTF4 1061997773
LEF4 $387
line 1080
;1080:		phase = 1.0 - (1.0 - frac)*(1.0 - frac)/0.2;
ADDRLP4 52
CNSTF4 1065353216
ASGNF4
ADDRLP4 56
ADDRLP4 52
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
CNSTF4 1045220557
DIVF4
SUBF4
ASGNF4
line 1081
;1081:	}
ADDRGP4 $388
JUMPV
LABELV $387
line 1082
;1082:	else {
line 1083
;1083:		phase = frac;
ADDRLP4 24
ADDRLP4 20
INDIRF4
ASGNF4
line 1084
;1084:	}
LABELV $388
LABELV $386
line 1086
;1085:
;1086:	c = cos(2 * M_PI * phase);
CNSTF4 1086918619
ADDRLP4 24
INDIRF4
MULF4
ARGF4
ADDRLP4 52
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 52
INDIRF4
ASGNF4
line 1087
;1087:	s = sin(2 * M_PI * phase);
CNSTF4 1086918619
ADDRLP4 24
INDIRF4
MULF4
ARGF4
ADDRLP4 56
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 56
INDIRF4
ASGNF4
line 1089
;1088:
;1089:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $392
JUMPV
LABELV $389
line 1090
;1090:		z = s_credits.scr_pos[i][axis1];
ADDRLP4 8
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ADDP4
INDIRF4
ASGNF4
line 1091
;1091:		x = s_credits.scr_pos[i][axis2];
ADDRLP4 4
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ADDP4
INDIRF4
ASGNF4
line 1092
;1092:		if (ep->param) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $396
line 1093
;1093:			s_credits.scr_pos[i][axis1] = z*c - x*s;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
SUBF4
ASGNF4
line 1094
;1094:			s_credits.scr_pos[i][axis2] = x*c + z*s;
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 1095
;1095:		}
ADDRGP4 $397
JUMPV
LABELV $396
line 1096
;1096:		else {
line 1097
;1097:			s_credits.scr_pos[i][axis1] = z*c + x*s;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 1098
;1098:			s_credits.scr_pos[i][axis2] = x*c - z*s;
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
SUBF4
ASGNF4
line 1099
;1099:		}
LABELV $397
line 1101
;1100:
;1101:	}
LABELV $390
line 1089
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $392
ADDRLP4 0
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $389
line 1102
;1102:}
LABELV $378
endproc Credits_ImplementFlip 60 8
proc Credits_Effect_FlipX 0 12
line 1113
;1103:
;1104:
;1105:
;1106:
;1107:/*
;1108:===============
;1109:Credits_Effect_FlipX
;1110:===============
;1111:*/
;1112:static void Credits_Effect_FlipX(effectParams_t* ep)
;1113:{
line 1114
;1114:	Credits_ImplementFlip(ep, 0, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Credits_ImplementFlip
CALLV
pop
line 1153
;1115:
;1116:/*	int i;
;1117:	float frac;
;1118:	float phase;
;1119:	float x, z;
;1120:	float c, s;
;1121:
;1122:	if (!ep)
;1123:		return;
;1124:
;1125:	frac = TimeFrac(ep->endtime, ep->duration);
;1126:
;1127:	if (frac < 0.2) {
;1128:		phase = frac*frac/0.2;
;1129:	}
;1130:	else if (frac > 0.8) {
;1131:		phase = 1.0 - (1.0 - frac)*(1.0 - frac)/0.2;
;1132:	}
;1133:	else {
;1134:		phase = frac;
;1135:	}
;1136:
;1137:	c = cos(2 * M_PI * phase);
;1138:	s = sin(2 * M_PI * phase);
;1139:
;1140:	for (i = 0; i < s_credits.numPoints; i++) {
;1141:		z = s_credits.scr_pos[i][0];
;1142:		x = s_credits.scr_pos[i][1];
;1143:		if (ep->param) {
;1144:			s_credits.scr_pos[i][0] = z*c - x*s;
;1145:			s_credits.scr_pos[i][1] = x*c + z*s;
;1146:		}
;1147:		else {
;1148:			s_credits.scr_pos[i][0] = z*c + x*s;
;1149:			s_credits.scr_pos[i][1] = x*c - z*s;
;1150:		}
;1151:
;1152:	}*/
;1153:}
LABELV $402
endproc Credits_Effect_FlipX 0 12
proc Credits_Effect_FlipY 0 12
line 1163
;1154:
;1155:
;1156:
;1157:/*
;1158:===============
;1159:Credits_Effect_FlipY
;1160:===============
;1161:*/
;1162:static void Credits_Effect_FlipY(effectParams_t* ep)
;1163:{
line 1164
;1164:	Credits_ImplementFlip(ep, 0, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 Credits_ImplementFlip
CALLV
pop
line 1202
;1165:
;1166:/*	int i;
;1167:	float frac;
;1168:	float phase;
;1169:	float y, z;
;1170:	float c, s;
;1171:
;1172:	if (!ep)
;1173:		return;
;1174:
;1175:	frac = TimeFrac(ep->endtime, ep->duration);
;1176:
;1177:	if (frac < 0.2) {
;1178:		phase = frac*frac/0.2;
;1179:	}
;1180:	else if (frac > 0.8) {
;1181:		phase = 1.0 - (1.0 - frac)*(1.0 - frac)/0.2;
;1182:	}
;1183:	else {
;1184:		phase = frac;
;1185:	}
;1186:
;1187:	c = cos(2 * M_PI * phase);
;1188:	s = sin(2 * M_PI * phase);
;1189:
;1190:	for (i = 0; i < s_credits.numPoints; i++) {
;1191:		z = s_credits.scr_pos[i][0];
;1192:		y = s_credits.scr_pos[i][2];
;1193:		if (ep->param) {
;1194:			s_credits.scr_pos[i][0] = z*c - y*s;
;1195:			s_credits.scr_pos[i][2] = y*c + z*s;
;1196:		}
;1197:		else {
;1198:			s_credits.scr_pos[i][0] = z*c + y*s;
;1199:			s_credits.scr_pos[i][2] = y*c - z*s;
;1200:		}
;1201:	}*/
;1202:}
LABELV $403
endproc Credits_Effect_FlipY 0 12
proc Credits_Effect_FlipZ 0 12
line 1214
;1203:
;1204:
;1205:
;1206:
;1207:
;1208:/*
;1209:===============
;1210:Credits_Effect_FlipZ
;1211:===============
;1212:*/
;1213:static void Credits_Effect_FlipZ(effectParams_t* ep)
;1214:{
line 1215
;1215:	Credits_ImplementFlip(ep, 1, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 Credits_ImplementFlip
CALLV
pop
line 1253
;1216:/*	int i;
;1217:	float frac;
;1218:	float phase;
;1219:	float x, y;
;1220:	float c, s;
;1221:
;1222:	if (!ep)
;1223:		return;
;1224:
;1225:	frac = TimeFrac(ep->endtime, ep->duration);
;1226:
;1227:	if (frac < 0.2) {
;1228:		phase = frac*frac/0.2;
;1229:	}
;1230:	else if (frac > 0.8) {
;1231:		phase = 1.0 - (1.0 - frac)*(1.0 - frac)/0.2;
;1232:	}
;1233:	else {
;1234:		phase = frac;
;1235:	}
;1236:
;1237:	c = cos(2 * M_PI * phase);
;1238:	s = sin(2 * M_PI * phase);
;1239:
;1240:	for (i = 0; i < s_credits.numPoints; i++) {
;1241:		x = s_credits.scr_pos[i][1];
;1242:		y = s_credits.scr_pos[i][2];
;1243:		if (ep->param) {
;1244:			s_credits.scr_pos[i][1] = x*c - y*s;
;1245:			s_credits.scr_pos[i][2] = y*c + x*s;
;1246:		}
;1247:		else {
;1248:			s_credits.scr_pos[i][1] = x*c + y*s;
;1249:			s_credits.scr_pos[i][2] = y*c - x*s;
;1250:		}
;1251:
;1252:	}*/
;1253:}
LABELV $404
endproc Credits_Effect_FlipZ 0 12
proc Credits_SetNewEffect 40 0
line 1270
;1254:
;1255:
;1256:
;1257:/*----------------------------------------------------*/
;1258:
;1259:
;1260:
;1261:/*
;1262:===============
;1263:Credits_SetNewEffect
;1264:
;1265:type == -1 will choose a random type
;1266:no new effects when we enter into the final animation
;1267:===============
;1268:*/
;1269:static void Credits_SetNewEffect(int index, int type)
;1270:{
line 1277
;1271:	int i;
;1272:	int totalBias;
;1273:	int baseBias;
;1274:	int sel;
;1275:	effectParams_t* epp;
;1276:
;1277:	epp = &s_credits.effects[index];
ADDRLP4 8
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_credits+148628
ADDP4
ASGNP4
line 1280
;1278:
;1279:	// no effects in the final sequence
;1280:	if (s_credits.imageMode >= TGA_TOIMAGEBLEND)
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 4
LTI4 $407
line 1281
;1281:		type = EFFECT_NONE;
ADDRFP4 4
CNSTI4 0
ASGNI4
LABELV $407
line 1283
;1282:
;1283:	if (type < 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $410
line 1284
;1284:		totalBias = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1285
;1285:		for (i = 0; i < COUNT_EFFECTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $412
line 1286
;1286:			totalBias += effectData[i].frequency;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 effectData
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1287
;1287:		}
LABELV $413
line 1285
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 14
LTI4 $412
line 1289
;1288:
;1289:		baseBias = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1290
;1290:		type = EFFECT_NONE;
ADDRFP4 4
CNSTI4 0
ASGNI4
line 1291
;1291:		sel = totalBias * random();
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 1292
;1292:		for (i = 0; i < COUNT_EFFECTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $416
line 1293
;1293:			baseBias += effectData[i].frequency;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 effectData
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1294
;1294:			if (sel < baseBias) {
ADDRLP4 16
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $420
line 1295
;1295:				type = i;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1296
;1296:				break;
ADDRGP4 $418
JUMPV
LABELV $420
line 1298
;1297:			}
;1298:		}
LABELV $417
line 1292
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 14
LTI4 $416
LABELV $418
line 1299
;1299:	}
LABELV $410
line 1301
;1300:
;1301:	epp->type = type;
ADDRLP4 8
INDIRP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1302
;1302:	epp->duration = effectData[type].mintime + effectData[type].range * random();
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
CNSTI4 20
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 24
INDIRI4
ADDRGP4 effectData+4
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRI4
ADDRGP4 effectData+8
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1303
;1303:	epp->endtime = uis.realtime + epp->duration;
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 uis+4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1304
;1304:	epp->param = 0;
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1306
;1305:
;1306:	switch (type) {
ADDRLP4 32
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 5
LTI4 $426
ADDRLP4 32
INDIRI4
CNSTI4 13
GTI4 $426
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $430-20
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $430
address $427
address $427
address $427
address $426
address $426
address $426
address $427
address $427
address $427
code
LABELV $427
line 1313
;1307:	case EFFECT_RUSHX:
;1308:	case EFFECT_RUSHY:
;1309:	case EFFECT_RUSHZ:
;1310:	case EFFECT_FLIPZ:
;1311:	case EFFECT_FLIPY:
;1312:	case EFFECT_FLIPX:
;1313:		if (random() > 0.5)
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
LEF4 $426
line 1314
;1314:			epp->param = 1;
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 1315
;1315:		break;
line 1318
;1316:		
;1317:	default:
;1318:		break;
LABELV $426
line 1320
;1319:	}
;1320:}
LABELV $405
endproc Credits_SetNewEffect 40 0
proc Credits_CheckNextEffect 4 8
line 1334
;1321:
;1322:
;1323:
;1324:
;1325:
;1326:
;1327:
;1328:/*
;1329:===============
;1330:Credits_CheckNextEffect
;1331:===============
;1332:*/
;1333:static void Credits_CheckNextEffect(void)
;1334:{
line 1337
;1335:	int i;
;1336:
;1337:	for (i = 0; i < MAX_EFFECTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $433
line 1338
;1338:		if (uis.realtime >= s_credits.effects[i].endtime) {
ADDRGP4 uis+4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_credits+148628+4
ADDP4
INDIRI4
LTI4 $437
line 1339
;1339:			Credits_SetNewEffect(i, -1);
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 Credits_SetNewEffect
CALLV
pop
line 1340
;1340:		}
LABELV $437
line 1341
;1341:	}
LABELV $434
line 1337
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $433
line 1342
;1342:}
LABELV $432
endproc Credits_CheckNextEffect 4 8
proc Credits_SetNextImageAnimation 24 4
line 1356
;1343:
;1344:
;1345:
;1346:
;1347:
;1348:/*
;1349:===============
;1350:Credits_SetNextImageAnimation
;1351:
;1352:anim == -1 selects the next in sequence
;1353:===============
;1354:*/
;1355:static void Credits_SetNextImageAnimation(int anim)
;1356:{
line 1361
;1357:	int time;
;1358:	int i;
;1359:
;1360:	// automatic selection of next animation in sequence
;1361:	if (anim == -1) {
ADDRFP4 0
INDIRI4
CNSTI4 -1
NEI4 $443
line 1362
;1362:		switch (s_credits.imageMode) {
ADDRLP4 8
ADDRGP4 s_credits+148620
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $445
ADDRLP4 8
INDIRI4
CNSTI4 8
GTI4 $445
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $456-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $456
address $448
address $450
address $449
address $451
address $452
address $453
address $454
address $455
code
LABELV $448
line 1364
;1363:		case TGA_FADEIN:
;1364:			anim = TGA_SWIRL;
ADDRFP4 0
CNSTI4 3
ASGNI4
line 1365
;1365:			break;
ADDRGP4 $446
JUMPV
LABELV $449
line 1368
;1366:
;1367:		case TGA_SWIRL:
;1368:			anim = TGA_SWIRLBLEND;
ADDRFP4 0
CNSTI4 2
ASGNI4
line 1369
;1369:			break;
ADDRGP4 $446
JUMPV
LABELV $450
line 1372
;1370:
;1371:		case TGA_SWIRLBLEND:
;1372:			anim = TGA_SWIRL;
ADDRFP4 0
CNSTI4 3
ASGNI4
line 1373
;1373:			break;
ADDRGP4 $446
JUMPV
LABELV $451
line 1376
;1374:
;1375:		case TGA_TOIMAGEBLEND:
;1376:			anim = TGA_TOIMAGE;
ADDRFP4 0
CNSTI4 5
ASGNI4
line 1377
;1377:			break;
ADDRGP4 $446
JUMPV
LABELV $452
line 1380
;1378:
;1379:		case TGA_TOIMAGE:
;1380:			anim = TGA_HOLD;
ADDRFP4 0
CNSTI4 6
ASGNI4
line 1381
;1381:			break;
ADDRGP4 $446
JUMPV
LABELV $453
line 1384
;1382:
;1383:		case TGA_HOLD:
;1384:			anim = TGA_EXPLODE;
ADDRFP4 0
CNSTI4 7
ASGNI4
line 1385
;1385:			break;
ADDRGP4 $446
JUMPV
LABELV $454
line 1388
;1386:
;1387:		case TGA_EXPLODE:
;1388:			anim = TGA_BLANK;
ADDRFP4 0
CNSTI4 8
ASGNI4
line 1389
;1389:			break;
ADDRGP4 $446
JUMPV
LABELV $455
line 1393
;1390:
;1391:		case TGA_BLANK:
;1392:			// prepare for next animation round
;1393:			Credits_InitCreditSequence(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 Credits_InitCreditSequence
CALLV
pop
line 1394
;1394:			anim = TGA_FADEIN;
ADDRFP4 0
CNSTI4 1
ASGNI4
line 1395
;1395:			break;
LABELV $445
LABELV $446
line 1397
;1396:		}
;1397:	}
LABELV $443
line 1399
;1398:
;1399:	time = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1400
;1400:	switch (anim) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $442
ADDRLP4 8
INDIRI4
CNSTI4 8
GTI4 $442
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $533-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $533
address $460
address $462
address $461
address $466
address $504
address $515
address $531
address $532
code
LABELV $460
line 1402
;1401:	case TGA_FADEIN:
;1402:		time = FADEIN_TIME;
ADDRLP4 4
CNSTI4 3000
ASGNI4
line 1403
;1403:		break;
ADDRGP4 $459
JUMPV
LABELV $461
line 1406
;1404:
;1405:	case TGA_SWIRL:
;1406:		time = SWIRL_TIME;
ADDRLP4 4
CNSTI4 4000
ASGNI4
line 1407
;1407:		break;
ADDRGP4 $459
JUMPV
LABELV $462
line 1410
;1408:
;1409:	case TGA_SWIRLBLEND:
;1410:		time = SWIRLBLEND_TIME;
ADDRLP4 4
CNSTI4 2000
ASGNI4
line 1411
;1411:		VectorCopy(s_credits.angledelta, s_credits.old_angledelta);
ADDRGP4 s_credits+148684
ADDRGP4 s_credits+148672
INDIRB
ASGNB 12
line 1412
;1412:		Credits_SetRandomRotate(s_credits.angledelta);
ADDRGP4 s_credits+148672
ARGP4
ADDRGP4 Credits_SetRandomRotate
CALLV
pop
line 1413
;1413:		break;
ADDRGP4 $459
JUMPV
LABELV $466
line 1417
;1414:
;1415:	case TGA_TOIMAGEBLEND:
;1416:		// begin the return to a (0,0,0) view
;1417:		VectorCopy(s_credits.angledelta, s_credits.old_angledelta);
ADDRGP4 s_credits+148684
ADDRGP4 s_credits+148672
INDIRB
ASGNB 12
line 1421
;1418:
;1419:		// ensures that the imageblend is sufficiently long
;1420:		// that the last credit can finish showing
;1421:		for (i = 0; i < MAX_CREDITS_ONSCREEN; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $469
line 1422
;1422:			if (s_credits.credit[i].bDrawn && time < s_credits.credit[i].finishTime - uis.realtime)
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 s_credits+1080
ADDP4
INDIRI4
CNSTI4 0
EQI4 $473
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRGP4 s_credits+1080+24
ADDP4
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
GEI4 $473
line 1423
;1423:				time = s_credits.credit[i].finishTime - uis.realtime;
ADDRLP4 4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+1080+24
ADDP4
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
LABELV $473
line 1424
;1424:		}
LABELV $470
line 1421
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $469
line 1427
;1425:
;1426:		// end time when last effect has finished
;1427:		for (i = 0; i < MAX_EFFECTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $482
line 1428
;1428:			if (time < s_credits.effects[i].endtime - uis.realtime)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_credits+148628+4
ADDP4
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
GEI4 $486
line 1429
;1429:				time = s_credits.effects[i].endtime - uis.realtime;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_credits+148628+4
ADDP4
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
LABELV $486
line 1430
;1430:		}
LABELV $483
line 1427
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $482
line 1432
;1431:
;1432:		time += TOIMAGEBLEND_TIME;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1435
;1433:
;1434:		// normalize angular step, and negate it
;1435:		VectorScale(s_credits.viewangles, -500.0/time, s_credits.angledelta);
ADDRGP4 s_credits+148672
ADDRGP4 s_credits+148660
INDIRF4
CNSTF4 3287941120
ADDRLP4 4
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
ADDRGP4 s_credits+148672+4
ADDRGP4 s_credits+148660+4
INDIRF4
CNSTF4 3287941120
ADDRLP4 4
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
ADDRGP4 s_credits+148672+8
ADDRGP4 s_credits+148660+8
INDIRF4
CNSTF4 3287941120
ADDRLP4 4
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
line 1437
;1436:
;1437:		break;
ADDRGP4 $459
JUMPV
LABELV $504
line 1443
;1438:
;1439:	case TGA_TOIMAGE:
;1440:		// at the end of this step we should be at an angle (0,0,0)
;1441:
;1442:		// normalize angular step, and negate it
;1443:		time = TOIMAGE_TIME;
ADDRLP4 4
CNSTI4 4000
ASGNI4
line 1444
;1444:		VectorScale(s_credits.viewangles, -1000.0/time, s_credits.angledelta);
ADDRGP4 s_credits+148672
ADDRGP4 s_credits+148660
INDIRF4
CNSTF4 3296329728
ADDRLP4 4
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
ADDRGP4 s_credits+148672+4
ADDRGP4 s_credits+148660+4
INDIRF4
CNSTF4 3296329728
ADDRLP4 4
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
ADDRGP4 s_credits+148672+8
ADDRGP4 s_credits+148660+8
INDIRF4
CNSTF4 3296329728
ADDRLP4 4
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
line 1445
;1445:		break;
ADDRGP4 $459
JUMPV
LABELV $515
line 1448
;1446:
;1447:	case TGA_HOLD:
;1448:		VectorClear(s_credits.viewangles);
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRGP4 s_credits+148660+8
ADDRLP4 12
INDIRF4
ASGNF4
ADDRGP4 s_credits+148660+4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRGP4 s_credits+148660
ADDRLP4 12
INDIRF4
ASGNF4
line 1449
;1449:		VectorClear(s_credits.angledelta);
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRGP4 s_credits+148672+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRGP4 s_credits+148672+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRGP4 s_credits+148672
ADDRLP4 16
INDIRF4
ASGNF4
line 1450
;1450:		VectorClear(s_credits.old_angledelta);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRGP4 s_credits+148684+8
ADDRLP4 20
INDIRF4
ASGNF4
ADDRGP4 s_credits+148684+4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRGP4 s_credits+148684
ADDRLP4 20
INDIRF4
ASGNF4
line 1452
;1451:
;1452:		time = HOLD_TIME;
ADDRLP4 4
CNSTI4 1500
ASGNI4
line 1454
;1453:
;1454:		break;
ADDRGP4 $459
JUMPV
LABELV $531
line 1457
;1455:
;1456:	case TGA_EXPLODE:
;1457:		time = EXPLODE_TIME;
ADDRLP4 4
CNSTI4 2000
ASGNI4
line 1458
;1458:		break;
ADDRGP4 $459
JUMPV
LABELV $532
line 1461
;1459:
;1460:	case TGA_BLANK:
;1461:		time = BLANK_TIME;
ADDRLP4 4
CNSTI4 1000
ASGNI4
line 1462
;1462:		break;
line 1465
;1463:
;1464:	default:
;1465:		return;
LABELV $459
line 1468
;1466:	}
;1467:
;1468:	s_credits.imageMode = anim;
ADDRGP4 s_credits+148620
ADDRFP4 0
INDIRI4
ASGNI4
line 1469
;1469:	s_credits.imageFinishTime = uis.realtime + time;
ADDRGP4 s_credits+148624
ADDRGP4 uis+4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1470
;1470:}
LABELV $442
endproc Credits_SetNextImageAnimation 24 4
proc Credits_ApplyPixelTransforms 64 8
line 1485
;1471:
;1472:
;1473:
;1474:/*
;1475:===============
;1476:Credits_ApplyPixelTransforms
;1477:
;1478:Works out the position of the pixel in the 3d volume
;1479:subject to the various effects
;1480:
;1481:Result is then transformed into volume co-ordinates
;1482:===============
;1483:*/
;1484:static void Credits_ApplyPixelTransforms(void)
;1485:{
line 1492
;1486:	int i;
;1487:	float scale;
;1488:	float *pt;
;1489:	effectParams_t* ep;
;1490:
;1491:	// copy original values over
;1492:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $542
JUMPV
LABELV $539
line 1493
;1493:		VectorCopy(s_credits.base_pos[i], s_credits.scr_pos[i]);
ADDRLP4 16
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 s_credits+50460
ADDP4
ADDRLP4 16
INDIRI4
ADDRGP4 s_credits+99540
ADDP4
INDIRB
ASGNB 12
line 1494
;1494:		if (s_credits.imageMode == TGA_HOLD)
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 6
NEI4 $546
line 1495
;1495:			s_credits.scr_pos[i][0] = 0.0;
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
CNSTF4 0
ASGNF4
LABELV $546
line 1496
;1496:	}
LABELV $540
line 1492
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $542
ADDRLP4 0
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $539
line 1499
;1497:
;1498:	// apply transforms
;1499:	for (i = 0; i < MAX_EFFECTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $550
line 1500
;1500:		ep = &s_credits.effects[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_credits+148628
ADDP4
ASGNP4
line 1501
;1501:		if (effectData[ep->type].effectFunc)
CNSTI4 20
ADDRLP4 8
INDIRP4
INDIRI4
MULI4
ADDRGP4 effectData+16
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $555
line 1502
;1502:			effectData[ep->type].effectFunc(ep);
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 8
INDIRP4
INDIRI4
MULI4
ADDRGP4 effectData+16
ADDP4
INDIRP4
CALLV
pop
LABELV $555
line 1503
;1503:	}
LABELV $551
line 1499
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $550
line 1506
;1504:
;1505:	// scale to size
;1506:	scale = 1.0;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1507
;1507:	if (s_credits.imageMode == TGA_TOIMAGE) {
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 5
NEI4 $559
line 1508
;1508:		scale = TimeFrac(s_credits.imageFinishTime, TOIMAGE_TIME);
ADDRGP4 s_credits+148624
INDIRI4
ARGI4
CNSTI4 4000
ARGI4
ADDRLP4 16
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 16
INDIRF4
ASGNF4
line 1509
;1509:		scale = sqrt(scale);
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 20
INDIRF4
ASGNF4
line 1510
;1510:	}
ADDRGP4 $560
JUMPV
LABELV $559
line 1511
;1511:	else if (s_credits.imageMode == TGA_EXPLODE) {
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 7
NEI4 $563
line 1512
;1512:		scale = 1.0 - TimeFrac(s_credits.imageFinishTime, EXPLODE_TIME);
ADDRGP4 s_credits+148624
INDIRI4
ARGI4
CNSTI4 2000
ARGI4
ADDRLP4 16
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 12
CNSTF4 1065353216
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
line 1513
;1513:		scale *= scale;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 1514
;1514:	}
LABELV $563
LABELV $560
line 1516
;1515:
;1516:	for (i = 0; i < s_credits.numPoints; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $570
JUMPV
LABELV $567
line 1517
;1517:		pt = s_credits.scr_pos[i];
ADDRLP4 4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
ASGNP4
line 1518
;1518:		pt[1] *= s_credits.tga.scale * s_credits.tga.width;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRGP4 s_credits+1312+32780
INDIRF4
ADDRGP4 s_credits+1312+32768
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 1519
;1519:		pt[2] *= s_credits.tga.scale * s_credits.tga.height;
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRGP4 s_credits+1312+32780
INDIRF4
ADDRGP4 s_credits+1312+32772
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 1522
;1520:
;1521:
;1522:		switch (s_credits.imageMode) {
ADDRLP4 24
ADDRGP4 s_credits+148620
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $582
ADDRLP4 24
INDIRI4
CNSTI4 7
GTI4 $582
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $589
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $589
address $582
address $584
address $584
address $584
address $584
address $586
address $585
address $587
code
LABELV $584
line 1527
;1523:		case TGA_FADEIN:
;1524:		case TGA_TOIMAGEBLEND:
;1525:		case TGA_SWIRLBLEND:
;1526:		case TGA_SWIRL:
;1527:			pt[0] = boxSize * pt[0];
ADDRLP4 4
INDIRP4
ADDRGP4 boxSize
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1528
;1528:			break;
ADDRGP4 $582
JUMPV
LABELV $585
line 1532
;1529:
;1530:		case TGA_HOLD:
;1531:			// allow a small amount of effect through
;1532:			pt[0] = boxSize * (0.05 * pt[0] + 0.5);
ADDRLP4 4
INDIRP4
ADDRGP4 boxSize
INDIRF4
CNSTF4 1028443341
ADDRLP4 4
INDIRP4
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
MULF4
ASGNF4
line 1533
;1533:			break;
ADDRGP4 $582
JUMPV
LABELV $586
line 1536
;1534:
;1535:		case TGA_TOIMAGE:
;1536:			pt[0] = boxSize * ((pt[0] - 0.5)* scale + 0.5);
ADDRLP4 40
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
INDIRP4
ADDRGP4 boxSize
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 40
INDIRF4
ADDF4
MULF4
ASGNF4
line 1537
;1537:			break;
ADDRGP4 $582
JUMPV
LABELV $587
line 1540
;1538:
;1539:		case TGA_EXPLODE:
;1540:			pt[0] = boxSize * (0.5 - (pt[0] + scale + 0.5) * scale);
ADDRLP4 48
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
INDIRP4
ADDRGP4 boxSize
INDIRF4
ADDRLP4 48
INDIRF4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 48
INDIRF4
ADDF4
ADDRLP4 12
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 1541
;1541:			pt[1] *= (1.0 - 0.9*scale);
ADDRLP4 56
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1065353216
CNSTF4 1063675494
ADDRLP4 12
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 1542
;1542:			pt[2] *= (1.0 - 0.9*scale);
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTF4 1065353216
CNSTF4 1063675494
ADDRLP4 12
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 1543
;1543:			break;
line 1547
;1544:
;1545:		case TGA_NONE:
;1546:		default:
;1547:			break;
LABELV $582
line 1550
;1548:		}
;1549:
;1550:	}
LABELV $568
line 1516
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $570
ADDRLP4 0
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $567
line 1551
;1551:}
LABELV $538
endproc Credits_ApplyPixelTransforms 64 8
proc Credits_RenderView 424 16
line 1566
;1552:
;1553:
;1554:
;1555:
;1556:
;1557:/*
;1558:===============
;1559:Credits_RenderView
;1560:
;1561:Sets the viewpoint into the render list and
;1562:draws everything on screen
;1563:===============
;1564:*/
;1565:static void Credits_RenderView(void)
;1566:{
line 1575
;1567:	refdef_t	refdef;
;1568:	float ix, iy, iw, ih;	// viewport size
;1569:	float step, frac;
;1570:	vec3_t angle;
;1571:	int blendtime;
;1572:	float scrx;
;1573:	float scry;
;1574:	
;1575:	trap_GetGlconfig( &uis.glconfig );
ADDRGP4 uis+60
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1577
;1576:	
;1577:	scrx = uis.glconfig.vidWidth;
ADDRLP4 384
ADDRGP4 uis+60+11304
INDIRI4
CVIF4 4
ASGNF4
line 1578
;1578:	scry = uis.glconfig.vidHeight;
ADDRLP4 388
ADDRGP4 uis+60+11308
INDIRI4
CVIF4 4
ASGNF4
line 1580
;1579:
;1580:	memset(&refdef, 0, sizeof(refdef));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1582
;1581:
;1582:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 1583
;1583:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 1585
;1584:
;1585:	ix = 0;
ADDRLP4 368
CNSTF4 0
ASGNF4
line 1586
;1586:	iy = 0;
ADDRLP4 372
CNSTF4 0
ASGNF4
line 1587
;1587:	iw = scrx;
ADDRLP4 376
ADDRLP4 384
INDIRF4
ASGNF4
line 1588
;1588:	ih = scry;
ADDRLP4 380
ADDRLP4 388
INDIRF4
ASGNF4
line 1591
;1589://	UI_AdjustFrom640(&ix, &iy, &iw, &ih);
;1590:
;1591:	refdef.x = ix;
ADDRLP4 0
ADDRLP4 368
INDIRF4
CVFI4 4
ASGNI4
line 1592
;1592:	refdef.y = iy;
ADDRLP4 0+4
ADDRLP4 372
INDIRF4
CVFI4 4
ASGNI4
line 1593
;1593:	refdef.width = iw;
ADDRLP4 0+8
ADDRLP4 376
INDIRF4
CVFI4 4
ASGNI4
line 1594
;1594:	refdef.height = ih;
ADDRLP4 0+12
ADDRLP4 380
INDIRF4
CVFI4 4
ASGNI4
line 1596
;1595:
;1596:	refdef.time = uis.realtime;
ADDRLP4 0+72
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 1598
;1597:
;1598:	refdef.fov_x = STATICVIEW_FOV;
ADDRLP4 0+16
CNSTF4 1117782016
ASGNF4
line 1599
;1599:	refdef.fov_y = STATICVIEW_FOV;
ADDRLP4 0+20
CNSTF4 1117782016
ASGNF4
line 1601
;1600:
;1601:	step = (float)uis.frametime / 1000.0;
ADDRLP4 392
ADDRGP4 uis
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 1603
;1602:
;1603:	switch (s_credits.imageMode) {
ADDRLP4 416
ADDRGP4 s_credits+148620
INDIRI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
LTI4 $606
ADDRLP4 416
INDIRI4
CNSTI4 8
GTI4 $606
ADDRLP4 416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $627
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $627
address $590
address $620
address $609
address $620
address $609
address $620
address $606
address $606
address $606
code
line 1607
;1604:		case TGA_EXPLODE:
;1605:		case TGA_HOLD:
;1606:		case TGA_BLANK:
;1607:			break;
LABELV $609
line 1611
;1608:
;1609:		case TGA_TOIMAGEBLEND:
;1610:		case TGA_SWIRLBLEND:
;1611:			if (s_credits.imageMode == TGA_TOIMAGE) {
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 5
NEI4 $610
line 1612
;1612:				blendtime = TOIMAGEBLEND_TIME;
ADDRLP4 412
CNSTI4 1000
ASGNI4
line 1613
;1613:			}
ADDRGP4 $611
JUMPV
LABELV $610
line 1614
;1614:			else {
line 1615
;1615:				blendtime = SWIRLBLEND_TIME;
ADDRLP4 412
CNSTI4 2000
ASGNI4
line 1616
;1616:			}
LABELV $611
line 1619
;1617:
;1618:			// set view angle
;1619:			frac = 1.0 - TimeFrac(s_credits.imageFinishTime, blendtime);
ADDRGP4 s_credits+148624
INDIRI4
ARGI4
ADDRLP4 412
INDIRI4
ARGI4
ADDRLP4 420
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 396
CNSTF4 1065353216
ADDRLP4 420
INDIRF4
SUBF4
ASGNF4
line 1620
;1620:			LerpAngles(s_credits.old_angledelta, s_credits.angledelta, angle, frac);
ADDRGP4 s_credits+148684
ARGP4
ADDRGP4 s_credits+148672
ARGP4
ADDRLP4 400
ARGP4
ADDRLP4 396
INDIRF4
ARGF4
ADDRGP4 LerpAngles
CALLV
pop
line 1622
;1621:
;1622:			AngleMA(s_credits.viewangles, step, angle, s_credits.viewangles);
ADDRGP4 s_credits+148660
ARGP4
ADDRLP4 392
INDIRF4
ARGF4
ADDRLP4 400
ARGP4
ADDRGP4 s_credits+148660
ARGP4
ADDRGP4 AngleMA
CALLV
pop
line 1623
;1623:			AnglesToAxis(s_credits.viewangles, refdef.viewaxis);
ADDRGP4 s_credits+148660
ARGP4
ADDRLP4 0+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1624
;1624:			break;
ADDRGP4 $606
JUMPV
LABELV $620
line 1630
;1625:
;1626:		case TGA_FADEIN:
;1627:		case TGA_TOIMAGE:
;1628:		case TGA_SWIRL:
;1629:			// set view angle
;1630:			AngleMA(s_credits.viewangles, step, s_credits.angledelta, s_credits.viewangles);
ADDRGP4 s_credits+148660
ARGP4
ADDRLP4 392
INDIRF4
ARGF4
ADDRGP4 s_credits+148672
ARGP4
ADDRGP4 s_credits+148660
ARGP4
ADDRGP4 AngleMA
CALLV
pop
line 1631
;1631:			AnglesToAxis(s_credits.viewangles, refdef.viewaxis);
ADDRGP4 s_credits+148660
ARGP4
ADDRLP4 0+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1632
;1632:			break;
line 1636
;1633:
;1634:		case TGA_NONE:
;1635:			// should never get here
;1636:			return;
line 1639
;1637:
;1638:		default:
;1639:			break;
LABELV $606
line 1642
;1640:	}
;1641:
;1642:	AngleVectors(s_credits.viewangles, refdef.vieworg, 0, 0);
ADDRGP4 s_credits+148660
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 420
CNSTP4 0
ASGNP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1643
;1643:	VectorScale(refdef.vieworg, -boxSize/2, refdef.vieworg);
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
ADDRGP4 boxSize
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
MULF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
ADDRGP4 boxSize
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
MULF4
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
ADDRGP4 boxSize
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
MULF4
ASGNF4
line 1644
;1644:	trap_R_RenderScene(&refdef);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 1645
;1645:}
LABELV $590
endproc Credits_RenderView 424 16
proc Credits_DrawTargaImage 204 12
line 1660
;1646:
;1647:
;1648:
;1649:
;1650:/*
;1651:===============
;1652:Credits_DrawTargaImage
;1653:
;1654:We can only draw up to 1024 entities on screen at once.
;1655:If there are too many active pixels then we'll get an
;1656:incomplete image
;1657:===============
;1658:*/
;1659:static void Credits_DrawTargaImage( void )
;1660:{
line 1668
;1661:	int i;
;1662:	refEntity_t re;
;1663:	int colpos;
;1664:	byte* colptr;
;1665:	float fade_in;
;1666:	imageTarga_t* image;
;1667:
;1668:	if (s_credits.imageMode == TGA_NONE)
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 0
NEI4 $641
line 1669
;1669:		return;
ADDRGP4 $640
JUMPV
LABELV $641
line 1671
;1670:
;1671:	if (uis.realtime > s_credits.imageFinishTime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 s_credits+148624
INDIRI4
LEI4 $644
line 1672
;1672:		Credits_SetNextImageAnimation(-1);
CNSTI4 -1
ARGI4
ADDRGP4 Credits_SetNextImageAnimation
CALLV
pop
LABELV $644
line 1674
;1673:
;1674:	Credits_CheckNextEffect();
ADDRGP4 Credits_CheckNextEffect
CALLV
pop
line 1676
;1675:
;1676:	if (s_credits.imageMode == TGA_BLANK)
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 8
NEI4 $648
line 1677
;1677:		return;
ADDRGP4 $640
JUMPV
LABELV $648
line 1679
;1678:
;1679:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 1682
;1680:
;1681:	// setup common refEntity_t values
;1682:	memset(&re, 0, sizeof(re));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1683
;1683:	re.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1684
;1684:	re.rotation = 0.0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 1685
;1685:	re.customShader = trap_R_RegisterShaderNoMip(endCredits[s_credits.textGroup].discShader);
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0+112
ADDRLP4 196
INDIRI4
ASGNI4
line 1687
;1686:
;1687:	image = &s_credits.tga;
ADDRLP4 184
ADDRGP4 s_credits+1312
ASGNP4
line 1688
;1688:	if (s_credits.imageMode == TGA_TOIMAGE) {
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 5
NEI4 $656
line 1689
;1689:		re.radius = 0.5 * image->scale/(1.00 + TimeFrac(s_credits.imageFinishTime, TOIMAGE_TIME));
ADDRGP4 s_credits+148624
INDIRI4
ARGI4
CNSTI4 4000
ARGI4
ADDRLP4 200
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 0+132
CNSTF4 1056964608
ADDRLP4 184
INDIRP4
CNSTI4 32780
ADDP4
INDIRF4
MULF4
ADDRLP4 200
INDIRF4
CNSTF4 1065353216
ADDF4
DIVF4
ASGNF4
line 1690
;1690:	}
ADDRGP4 $657
JUMPV
LABELV $656
line 1691
;1691:	else if (s_credits.imageMode == TGA_HOLD) {
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 6
NEI4 $661
line 1692
;1692:		re.radius = image->scale/2.0;
ADDRLP4 0+132
ADDRLP4 184
INDIRP4
CNSTI4 32780
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1693
;1693:	}
ADDRGP4 $662
JUMPV
LABELV $661
line 1694
;1694:	else if (s_credits.imageMode == TGA_EXPLODE) {
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 7
NEI4 $665
line 1695
;1695:		re.radius = 0.5 * image->scale/ (2.0 - TimeFrac(s_credits.imageFinishTime, EXPLODE_TIME));
ADDRGP4 s_credits+148624
INDIRI4
ARGI4
CNSTI4 2000
ARGI4
ADDRLP4 200
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 0+132
CNSTF4 1056964608
ADDRLP4 184
INDIRP4
CNSTI4 32780
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
ADDRLP4 200
INDIRF4
SUBF4
DIVF4
ASGNF4
line 1696
;1696:	}
ADDRGP4 $666
JUMPV
LABELV $665
line 1697
;1697:	else {
line 1698
;1698:		re.radius = image->scale/4.0;
ADDRLP4 0+132
ADDRLP4 184
INDIRP4
CNSTI4 32780
ADDP4
INDIRF4
CNSTF4 1082130432
DIVF4
ASGNF4
line 1699
;1699:	}
LABELV $666
LABELV $662
LABELV $657
line 1701
;1700:
;1701:	if (s_credits.imageMode == TGA_FADEIN) {
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 1
NEI4 $671
line 1702
;1702:		fade_in = 1.0 - TimeFrac(s_credits.imageFinishTime, FADEIN_TIME);
ADDRGP4 s_credits+148624
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 200
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 192
CNSTF4 1065353216
ADDRLP4 200
INDIRF4
SUBF4
ASGNF4
line 1703
;1703:	}
ADDRGP4 $672
JUMPV
LABELV $671
line 1705
;1704:	else
;1705:		fade_in = 1.0;
ADDRLP4 192
CNSTF4 1065353216
ASGNF4
LABELV $672
line 1708
;1706:
;1707:	// apply transforms to all pixels
;1708:	Credits_ApplyPixelTransforms();
ADDRGP4 Credits_ApplyPixelTransforms
CALLV
pop
line 1711
;1709:
;1710:	// run through all drawn pixels
;1711:	for (i = 0; i < s_credits.numPoints; i++)
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRGP4 $678
JUMPV
LABELV $675
line 1712
;1712:	{
line 1714
;1713:		// set the colour
;1714:		colpos = s_credits.drawn[i] * image->coloursize /* + image->offset*/;
ADDRLP4 188
ADDRLP4 180
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_credits+34100
ADDP4
INDIRI4
ADDRLP4 184
INDIRP4
CNSTI4 32776
ADDP4
INDIRI4
MULI4
ASGNI4
line 1715
;1715:		colptr = &image->targa[colpos];
ADDRLP4 176
ADDRLP4 188
INDIRI4
ADDRLP4 184
INDIRP4
ADDP4
ASGNP4
line 1717
;1716:
;1717:		re.shaderRGBA[0] = colptr[2];
ADDRLP4 0+116
ADDRLP4 176
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
ASGNU1
line 1718
;1718:		re.shaderRGBA[1] = colptr[1];
ADDRLP4 0+116+1
ADDRLP4 176
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
ASGNU1
line 1719
;1719:		re.shaderRGBA[2] = colptr[0];
ADDRLP4 0+116+2
ADDRLP4 176
INDIRP4
INDIRU1
ASGNU1
line 1721
;1720:
;1721:		if (image->coloursize == 4) {
ADDRLP4 184
INDIRP4
CNSTI4 32776
ADDP4
INDIRI4
CNSTI4 4
NEI4 $686
line 1722
;1722:			re.shaderRGBA[3] = colptr[3];
ADDRLP4 0+116+3
ADDRLP4 176
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
ASGNU1
line 1723
;1723:		}
ADDRGP4 $687
JUMPV
LABELV $686
line 1724
;1724:		else {
line 1725
;1725:			re.shaderRGBA[3] = 0xff;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 1726
;1726:		}
LABELV $687
line 1728
;1727:
;1728:		if (s_credits.imageMode == TGA_FADEIN) {
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 1
NEI4 $692
line 1729
;1729:			int tmp = re.shaderRGBA[3];
ADDRLP4 200
ADDRLP4 0+116+3
INDIRU1
CVUI4 1
ASGNI4
line 1730
;1730:			tmp *= (int)(100 * fade_in);
ADDRLP4 200
ADDRLP4 200
INDIRI4
CNSTF4 1120403456
ADDRLP4 192
INDIRF4
MULF4
CVFI4 4
MULI4
ASGNI4
line 1731
;1731:			tmp /= 100;
ADDRLP4 200
ADDRLP4 200
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 1732
;1732:			re.shaderRGBA[3] = (tmp & 0xff);
ADDRLP4 0+116+3
ADDRLP4 200
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 1733
;1733:		}
LABELV $692
line 1736
;1734:
;1735:		// position of sprite
;1736:		VectorCopy(s_credits.scr_pos[i], re.origin);
ADDRLP4 0+68
CNSTI4 12
ADDRLP4 180
INDIRI4
MULI4
ADDRGP4 s_credits+50460
ADDP4
INDIRB
ASGNB 12
line 1737
;1737:		trap_R_AddRefEntityToScene(&re);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1738
;1738:	}
LABELV $676
line 1711
ADDRLP4 180
ADDRLP4 180
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $678
ADDRLP4 180
INDIRI4
ADDRGP4 s_credits+34096
INDIRI4
LTI4 $675
line 1741
;1739:
;1740:	// draw the view
;1741:	Credits_RenderView();
ADDRGP4 Credits_RenderView
CALLV
pop
line 1742
;1742:}
LABELV $640
endproc Credits_DrawTargaImage 204 12
proc Credits_DoReverseText 0 0
line 1753
;1743:
;1744:
;1745:
;1746:
;1747:/*
;1748:===============
;1749:Credits_DoReverseText
;1750:===============
;1751:*/
;1752:static qboolean Credits_DoReverseText( void )
;1753:{
line 1754
;1754:	if (s_credits.textPass < 2)
ADDRGP4 s_credits+1168
INDIRI4
CNSTI4 2
GEI4 $702
line 1755
;1755:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $701
JUMPV
LABELV $702
line 1757
;1756:
;1757:	if (endCredits[s_credits.textGroup].modes & s_credits.activeCreditModes & CREDIT_REVERSETEXT)
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits
ADDP4
INDIRI4
ADDRGP4 s_credits+1172
INDIRI4
BANDI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $705
line 1758
;1758:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $701
JUMPV
LABELV $705
line 1759
;1759:	if (endCredits[s_credits.textGroup].modes & s_credits.activeCreditModes & CREDIT_HIGHREVERSETEXT)
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits
ADDP4
INDIRI4
ADDRGP4 s_credits+1172
INDIRI4
BANDI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $709
line 1760
;1760:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $701
JUMPV
LABELV $709
line 1761
;1761:	return qfalse;
CNSTI4 0
RETI4
LABELV $701
endproc Credits_DoReverseText 0 0
proc Credits_DoShuffleText 4 0
line 1772
;1762:}
;1763:
;1764:
;1765:
;1766:/*
;1767:===============
;1768:Credits_DoShuffleText
;1769:===============
;1770:*/
;1771:static qboolean Credits_DoShuffleText( displayCredit_t* dc )
;1772:{
line 1773
;1773:	if (s_credits.textPass < 2)
ADDRGP4 s_credits+1168
INDIRI4
CNSTI4 2
GEI4 $714
line 1774
;1774:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $713
JUMPV
LABELV $714
line 1776
;1775:
;1776:	if (uis.realtime > dc->finishTime - dc->duration + CREDIT_SHUFFLE_TIME)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uis+4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDI4
LEI4 $717
line 1777
;1777:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $713
JUMPV
LABELV $717
line 1779
;1778:
;1779:	if (endCredits[s_credits.textGroup].modes & s_credits.activeCreditModes & CREDIT_SHUFFLETEXT)
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits
ADDP4
INDIRI4
ADDRGP4 s_credits+1172
INDIRI4
BANDI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $720
line 1780
;1780:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $713
JUMPV
LABELV $720
line 1781
;1781:	return qfalse;
CNSTI4 0
RETI4
LABELV $713
endproc Credits_DoShuffleText 4 0
proc Credits_DoSillyTitle 0 0
line 1792
;1782:}
;1783:
;1784:
;1785:
;1786:/*
;1787:===============
;1788:Credits_DoSillyTitle
;1789:===============
;1790:*/
;1791:static qboolean Credits_DoSillyTitle( void )
;1792:{
line 1793
;1793:	if (s_credits.textPass == 0)
ADDRGP4 s_credits+1168
INDIRI4
CNSTI4 0
NEI4 $725
line 1794
;1794:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $724
JUMPV
LABELV $725
line 1796
;1795:
;1796:	if (endCredits[s_credits.textGroup].modes & s_credits.activeCreditModes & CREDIT_SILLYTITLE)
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits
ADDP4
INDIRI4
ADDRGP4 s_credits+1172
INDIRI4
BANDI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $728
line 1797
;1797:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $724
JUMPV
LABELV $728
line 1798
;1798:	return qfalse;
CNSTI4 0
RETI4
LABELV $724
endproc Credits_DoSillyTitle 0 0
proc Credits_ChooseNextItem 28 0
line 1810
;1799:}
;1800:
;1801:
;1802:
;1803:
;1804:/*
;1805:===============
;1806:Credits_ChooseNextItem
;1807:===============
;1808:*/
;1809:static int Credits_ChooseNextItem( int range, int history[], int* pPos )
;1810:{
line 1818
;1811:	int i;
;1812:	int sel;
;1813:	int pos;
;1814:	int max;
;1815:	int index;
;1816:	qboolean bMatch;
;1817:
;1818:	if (!history || range < 2)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $735
ADDRFP4 0
INDIRI4
CNSTI4 2
GEI4 $733
LABELV $735
line 1819
;1819:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $732
JUMPV
LABELV $733
line 1821
;1820:
;1821:	pos = *pPos;
ADDRLP4 12
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1822
;1822:	max = MAX_RECENT_MEMORY;
ADDRLP4 16
CNSTI4 10
ASGNI4
line 1823
;1823:	if (range < MAX_RECENT_MEMORY) {
ADDRFP4 0
INDIRI4
CNSTI4 10
GEI4 $736
line 1824
;1824:		max = range - 3;
ADDRLP4 16
ADDRFP4 0
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 1825
;1825:		if (max < 0)
ADDRLP4 16
INDIRI4
CNSTI4 0
GEI4 $738
line 1826
;1826:			max = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $738
line 1827
;1827:	}
LABELV $736
LABELV $740
line 1829
;1828:
;1829:	do {
LABELV $743
line 1830
;1830:		do {
line 1831
;1831:			sel = range*random();
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 1832
;1832:		} while (sel == range);
LABELV $744
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $743
line 1834
;1833:
;1834:		bMatch = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1835
;1835:		for (i = 0; i < max; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $749
JUMPV
LABELV $746
line 1836
;1836:			index = (pos + MAX_RECENT_MEMORY - i - 1) % MAX_RECENT_MEMORY;
ADDRLP4 24
CNSTI4 10
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ADDRLP4 24
INDIRI4
MODI4
ASGNI4
line 1837
;1837:			if (history[ index ] == sel) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $750
line 1838
;1838:				bMatch = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1839
;1839:				break;
ADDRGP4 $748
JUMPV
LABELV $750
line 1841
;1840:			}
;1841:		}
LABELV $747
line 1835
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $749
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $746
LABELV $748
line 1843
;1842:
;1843:	} while (bMatch);
LABELV $741
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $740
line 1845
;1844:
;1845:	history[pos] = sel;
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1847
;1846:
;1847:	*pPos = (pos+1) % MAX_RECENT_MEMORY;
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 10
MODI4
ASGNI4
line 1849
;1848:
;1849:	return sel;
ADDRLP4 4
INDIRI4
RETI4
LABELV $732
endproc Credits_ChooseNextItem 28 0
proc Credits_ChooseSillyTitleString 8 12
line 1862
;1850:}
;1851:
;1852:
;1853:
;1854:
;1855:
;1856:/*
;1857:===============
;1858:Credits_ChooseSillyTitleString
;1859:===============
;1860:*/
;1861:static const char* Credits_ChooseSillyTitleString( creditEntry_t* ce )
;1862:{
line 1865
;1863:	int index;
;1864:
;1865:	if (ce->text[0]) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $753
line 1866
;1866:		index = Credits_ChooseNextItem(sillyTitlesCount, s_credits.recentTitle, &s_credits.recentTitlePos);
ADDRGP4 sillyTitlesCount
INDIRI4
ARGI4
ADDRGP4 s_credits+1224
ARGP4
ADDRGP4 s_credits+1264
ARGP4
ADDRLP4 4
ADDRGP4 Credits_ChooseNextItem
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1867
;1867:		return sillyTitles[index];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sillyTitles
ADDP4
INDIRP4
RETP4
ADDRGP4 $752
JUMPV
LABELV $753
line 1869
;1868:	}
;1869:	else {
line 1870
;1870:		index = Credits_ChooseNextItem(sillyMessagesCount, s_credits.recentMessage, &s_credits.recentMessagePos);
ADDRGP4 sillyMessagesCount
INDIRI4
ARGI4
ADDRGP4 s_credits+1180
ARGP4
ADDRGP4 s_credits+1220
ARGP4
ADDRLP4 4
ADDRGP4 Credits_ChooseNextItem
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1871
;1871:		return sillyMessages[index];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sillyMessages
ADDP4
INDIRP4
RETP4
LABELV $752
endproc Credits_ChooseSillyTitleString 8 12
proc Credits_GetCreditTransparency 24 8
line 1883
;1872:	}
;1873:}
;1874:
;1875:
;1876:
;1877:/*
;1878:===============
;1879:Credits_GetCreditTransparency
;1880:===============
;1881:*/
;1882:static float Credits_GetCreditTransparency( displayCredit_t* dc )
;1883:{
line 1887
;1884:	int start;
;1885:	int window;
;1886:
;1887:	window = CREDIT_DURATION / 10;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 1888
;1888:	start = dc->finishTime - dc->duration;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1890
;1889:
;1890:	if (uis.realtime - start < window)
ADDRGP4 uis+4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ADDRLP4 0
INDIRI4
GEI4 $760
line 1891
;1891:		return 1.0 - TimeFrac(start + window, window);
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 TimeFrac
CALLF4
ASGNF4
CNSTF4 1065353216
ADDRLP4 16
INDIRF4
SUBF4
RETF4
ADDRGP4 $759
JUMPV
LABELV $760
line 1893
;1892:
;1893:	if (uis.realtime > dc->finishTime - window)
ADDRGP4 uis+4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
LEI4 $763
line 1894
;1894:		return TimeFrac(dc->finishTime, window);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TimeFrac
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
RETF4
ADDRGP4 $759
JUMPV
LABELV $763
line 1896
;1895:
;1896:	return 1.0;
CNSTF4 1065353216
RETF4
LABELV $759
endproc Credits_GetCreditTransparency 24 8
proc Credits_PrepareNextCredit 52 12
line 1910
;1897:}
;1898:
;1899:
;1900:
;1901:
;1902:
;1903:
;1904:/*
;1905:===============
;1906:Credits_PrepareNextCredit
;1907:===============
;1908:*/
;1909:static void Credits_PrepareNextCredit( displayCredit_t* dc, int string )
;1910:{
line 1917
;1911:	int i;
;1912:	creditList_t* cl;
;1913:	creditEntry_t* ce;
;1914:	float scale;
;1915:	int width, w, h;
;1916:
;1917:	cl = &endCredits[s_credits.textGroup];
ADDRLP4 24
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits
ADDP4
ASGNP4
line 1918
;1918:	if (string < 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $768
line 1919
;1919:		dc->bDrawn = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1920
;1920:		return;
ADDRGP4 $766
JUMPV
LABELV $768
line 1924
;1921:	}
;1922:
;1923:	// close down credit display, we've shown them all
;1924:	if (string >= cl->numCredits) {
ADDRFP4 4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $770
line 1925
;1925:		dc->bDrawn = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1926
;1926:		return;
ADDRGP4 $766
JUMPV
LABELV $770
line 1930
;1927:	}
;1928:
;1929:	// size credit box
;1930:	dc->bDrawn = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 1931
;1931:	dc->indexCredit = string;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1933
;1932:
;1933:	scale = UI_ProportionalSizeScale(UI_SMALLFONT, 0);
CNSTI4 16
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
line 1934
;1934:	ce = &cl->credits[string];
ADDRLP4 4
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDP4
ASGNP4
line 1935
;1935:	dc->numLines = 0;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1936
;1936:	width = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1937
;1937:	h = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1938
;1938:	dc->titleString = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTP4 0
ASGNP4
line 1939
;1939:	if (ce->mode == CMODE_QUOTE) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 4
NEI4 $772
line 1940
;1940:		dc->indexData = Credits_ChooseNextItem(quoteListSize, s_credits.recentQuote, &s_credits.recentQuotePos);
ADDRGP4 quoteListSize
INDIRI4
ARGI4
ADDRGP4 s_credits+1268
ARGP4
ADDRGP4 s_credits+1308
ARGP4
ADDRLP4 32
ADDRGP4 Credits_ChooseNextItem
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1945
;1941:/*		do {
;1942:			dc->indexData = quoteListSize*random();
;1943:		} while (dc->indexData == quoteListSize);*/
;1944:
;1945:		ce = &quoteList[dc->indexData].quote;
ADDRLP4 4
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 quoteList+4
ADDP4
ASGNP4
line 1946
;1946:		dc->titleString = ce->title;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
line 1947
;1947:	}
ADDRGP4 $773
JUMPV
LABELV $772
line 1948
;1948:	else if (Credits_DoSillyTitle() && ce->mode != CMODE_HARDTEXT) {
ADDRLP4 32
ADDRGP4 Credits_DoSillyTitle
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $777
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 5
EQI4 $777
line 1949
;1949:		dc->titleString = Credits_ChooseSillyTitleString(ce);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Credits_ChooseSillyTitleString
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 36
INDIRP4
ASGNP4
line 1950
;1950:	}
ADDRGP4 $778
JUMPV
LABELV $777
line 1951
;1951:	else if (ce->title) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $779
line 1952
;1952:		dc->titleString = ce->title;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
line 1953
;1953:	}
LABELV $779
LABELV $778
LABELV $773
line 1955
;1954:
;1955:	if (dc->titleString) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $781
line 1956
;1956:		width = UI_ProportionalStringWidth(dc->titleString);
ADDRFP4 0
INDIRP4
CNSTI4 32
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
ASGNI4
line 1957
;1957:		h = PROP_HEIGHT;
ADDRLP4 20
ADDRGP4 cl_propheight+12
INDIRI4
ASGNI4
line 1958
;1958:		dc->numLines++;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1959
;1959:	}
LABELV $781
line 1962
;1960:
;1961:	// find the widest text
;1962:	for (i = 0; ce->text[i] && i < MAX_CREDIT_LINES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $787
JUMPV
LABELV $784
line 1963
;1963:		w = UI_ProportionalStringWidth(ce->text[i]) * scale;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1964
;1964:		h += PROP_HEIGHT * scale;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CVIF4 4
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1965
;1965:		dc->numLines++;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1966
;1966:		if (w > width)
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $789
line 1967
;1967:			width = w;
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $789
line 1968
;1968:	}
LABELV $785
line 1962
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $787
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $791
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $784
LABELV $791
line 1970
;1969:
;1970:	dc->width = width;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1971
;1971:	dc->height = h;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1974
;1972:
;1973:	// set the offset and duration of the credit
;1974:	if (ce->mode == CMODE_DUALTEXT) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
NEI4 $792
line 1975
;1975:		dc->duration = 3 * CREDIT_DURATION / 2;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 6000
ASGNI4
line 1976
;1976:		dc->offset_y = 120 + 240 * s_credits.dualTextPhase;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTI4 240
ADDRGP4 s_credits+1176
INDIRI4
MULI4
CNSTI4 120
ADDI4
ASGNI4
line 1978
;1977:
;1978:		s_credits.dualTextPhase = 1 - s_credits.dualTextPhase;
ADDRGP4 s_credits+1176
CNSTI4 1
ADDRGP4 s_credits+1176
INDIRI4
SUBI4
ASGNI4
line 1979
;1979:	}
ADDRGP4 $793
JUMPV
LABELV $792
line 1980
;1980:	else {
line 1981
;1981:		dc->duration = CREDIT_DURATION;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 4000
ASGNI4
line 1982
;1982:		if (dc->numLines > 3)
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 3
LEI4 $797
line 1983
;1983:			dc->duration += CREDIT_DURATION/2;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
LABELV $797
line 1984
;1984:		dc->offset_y = 240;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTI4 240
ASGNI4
line 1985
;1985:	}
LABELV $793
line 1986
;1986:	dc->finishTime = uis.realtime + dc->duration;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
ADDRGP4 uis+4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1988
;1987:
;1988:	dc->transparency = Credits_GetCreditTransparency(dc);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 Credits_GetCreditTransparency
CALLF4
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 1989
;1989:}
LABELV $766
endproc Credits_PrepareNextCredit 52 12
proc Credits_FindNextCredit 24 0
line 2002
;1990:
;1991:
;1992:
;1993:
;1994:/*
;1995:===============
;1996:Credits_FindNextCredit
;1997:
;1998:Returns 0 if no more credits in list
;1999:===============
;2000:*/
;2001:static int Credits_FindNextCredit( int start, qboolean skipDual )
;2002:{
line 2008
;2003:	int currentMode, nextMode;
;2004:	creditList_t* cl;
;2005:	int passCount;
;2006:	int next;
;2007:
;2008:	cl = &endCredits[s_credits.textGroup];
ADDRLP4 8
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits
ADDP4
ASGNP4
line 2009
;2009:	currentMode = cl->credits[start].mode;
ADDRLP4 12
CNSTI4 24
ADDRFP4 0
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 2010
;2010:	passCount = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 2011
;2011:	for (next = start + 1; next < cl->numCredits; next++) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $805
JUMPV
LABELV $802
line 2012
;2012:		nextMode = cl->credits[next].mode;
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 2014
;2013:
;2014:		if (nextMode == CMODE_SILLYTITLE) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $806
line 2015
;2015:			if (Credits_DoSillyTitle())
ADDRLP4 20
ADDRGP4 Credits_DoSillyTitle
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $803
line 2016
;2016:				break;
ADDRGP4 $804
JUMPV
line 2017
;2017:			else {
line 2018
;2018:				continue;
LABELV $806
line 2022
;2019:			}
;2020:		}
;2021:
;2022:		if (currentMode == CMODE_DUALTEXT && skipDual) {
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $804
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $804
line 2023
;2023:			if (nextMode != CMODE_DUALTEXT)
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $812
line 2024
;2024:				break;
ADDRGP4 $804
JUMPV
LABELV $812
line 2027
;2025:
;2026:			// skip one if in dual display mode
;2027:			if (passCount == 0)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $814
line 2028
;2028:				break;
ADDRGP4 $804
JUMPV
LABELV $814
line 2030
;2029:
;2030:			passCount--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2031
;2031:			continue;
line 2035
;2032:		}
;2033:
;2034:		// can process this credit
;2035:		break;
LABELV $803
line 2011
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $805
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $802
LABELV $804
line 2038
;2036:	}
;2037:
;2038:	if (next == cl->numCredits)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $816
line 2039
;2039:		next = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $816
line 2041
;2040:
;2041:	return next;
ADDRLP4 0
INDIRI4
RETI4
LABELV $800
endproc Credits_FindNextCredit 24 0
proc Credits_NextFreeCreditSlot 12 0
line 2054
;2042:}
;2043:
;2044:
;2045:
;2046:/*
;2047:===============
;2048:Credits_NextFreeCreditSlot
;2049:
;2050:returns -1 if not slot can be found
;2051:===============
;2052:*/
;2053:static int Credits_NextFreeCreditSlot( int start )
;2054:{
line 2058
;2055:	int i;
;2056:	int index;
;2057:
;2058:	if (start < 0 || start >= MAX_CREDITS_ONSCREEN)
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $821
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $819
LABELV $821
line 2059
;2059:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $818
JUMPV
LABELV $819
line 2061
;2060:
;2061:	index = start;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
LABELV $822
line 2062
;2062:	do {
line 2063
;2063:		index++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2064
;2064:		if (index >= MAX_CREDITS_ONSCREEN)
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $825
line 2065
;2065:			index = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $825
line 2066
;2066:		if (!s_credits.credit[index].bDrawn)
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+1080
ADDP4
INDIRI4
CNSTI4 0
NEI4 $827
line 2067
;2067:			return index;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $818
JUMPV
LABELV $827
line 2068
;2068:	} while (index != start);
LABELV $823
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $822
line 2070
;2069:
;2070:	return -1;
CNSTI4 -1
RETI4
LABELV $818
endproc Credits_NextFreeCreditSlot 12 0
proc Credits_StartDualCredits 16 8
line 2082
;2071:}
;2072:
;2073:
;2074:
;2075:
;2076:/*
;2077:===============
;2078:Credits_StartDualCredits
;2079:===============
;2080:*/
;2081:static void Credits_StartDualCredits( creditList_t* cl, int firstcredit , int startslot)
;2082:{
line 2086
;2083:	int nextFree;
;2084:	int next;
;2085:
;2086:	nextFree = Credits_NextFreeCreditSlot(startslot);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 Credits_NextFreeCreditSlot
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 2087
;2087:	if (nextFree < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $831
line 2088
;2088:		return;
ADDRGP4 $830
JUMPV
LABELV $831
line 2091
;2089:
;2090:	// find the next credit that will pair with this one
;2091:	next = Credits_FindNextCredit(firstcredit, qfalse);
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 Credits_FindNextCredit
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 2092
;2092:	if (next <= 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $833
line 2093
;2093:		return;
ADDRGP4 $830
JUMPV
LABELV $833
line 2095
;2094:
;2095:	if (cl->credits[next].mode != CMODE_DUALTEXT)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $835
line 2096
;2096:		return;
ADDRGP4 $830
JUMPV
LABELV $835
line 2099
;2097:
;2098:	// finish setup
;2099:	Credits_PrepareNextCredit(&s_credits.credit[nextFree], next);
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_credits+1080
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Credits_PrepareNextCredit
CALLV
pop
line 2100
;2100:}
LABELV $830
endproc Credits_StartDualCredits 16 8
proc Credits_StopDualCredits 16 0
line 2110
;2101:
;2102:
;2103:
;2104:/*
;2105:===============
;2106:Credits_StopDualCredits
;2107:===============
;2108:*/
;2109:static void Credits_StopDualCredits( displayCredit_t* activeDC )
;2110:{
line 2119
;2111:	int i;
;2112:	displayCredit_t *dc;
;2113:	creditList_t* cl;
;2114:
;2115:	// We've not found another consecutive DUALTEXT entry
;2116:	// but we might have a dualtext entry that's still active.
;2117:	// If so then we kill this credit, because the still active one
;2118:	// will pick up the correct credit data next time
;2119:	cl = &endCredits[s_credits.textGroup];
ADDRLP4 8
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits
ADDP4
ASGNP4
line 2120
;2120:	for (i = 0; i < MAX_CREDITS_ONSCREEN; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $840
line 2121
;2121:		dc = &s_credits.credit[i];
ADDRLP4 4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+1080
ADDP4
ASGNP4
line 2122
;2122:		if (dc->bDrawn && cl->credits[dc->indexCredit].mode == CMODE_DUALTEXT) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $845
CNSTI4 24
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $845
line 2123
;2123:			activeDC->bDrawn = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 2124
;2124:			return;
ADDRGP4 $838
JUMPV
LABELV $845
line 2126
;2125:		}
;2126:	}
LABELV $841
line 2120
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $840
line 2127
;2127:}
LABELV $838
endproc Credits_StopDualCredits 16 0
proc Credits_UpdateCredits 44 12
line 2138
;2128:
;2129:
;2130:
;2131:
;2132:/*
;2133:===============
;2134:Credits_UpdateCredits
;2135:===============
;2136:*/
;2137:static qboolean Credits_UpdateCredits( void )
;2138:{
line 2147
;2139:	int i;
;2140:	int next;
;2141:	int currentMode, nextMode;
;2142:	displayCredit_t *dc;
;2143:	creditList_t* cl;
;2144:	qboolean bDone;
;2145:	qboolean bFound;
;2146:
;2147:	cl = &endCredits[s_credits.textGroup];
ADDRLP4 20
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits
ADDP4
ASGNP4
line 2148
;2148:	bDone = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 2150
;2149:
;2150:	for (i = 0; i < MAX_CREDITS_ONSCREEN; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $849
line 2151
;2151:		dc = &s_credits.credit[i];
ADDRLP4 0
CNSTI4 44
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 s_credits+1080
ADDP4
ASGNP4
line 2152
;2152:		if (!dc->bDrawn)
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $854
line 2153
;2153:			continue;
ADDRGP4 $850
JUMPV
LABELV $854
line 2155
;2154:
;2155:		dc->transparency = Credits_GetCreditTransparency(dc);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Credits_GetCreditTransparency
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 2156
;2156:		if (uis.realtime < dc->finishTime)
ADDRGP4 uis+4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
GEI4 $856
line 2157
;2157:			continue;
ADDRGP4 $850
JUMPV
LABELV $856
line 2160
;2158:
;2159:		// credit has expired, find next one
;2160:		next = Credits_FindNextCredit(dc->indexCredit, qtrue);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 Credits_FindNextCredit
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 2162
;2161:
;2162:		if (next <= 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $859
line 2163
;2163:			dc->bDrawn = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 2164
;2164:			bDone = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 2165
;2165:			continue;
ADDRGP4 $850
JUMPV
LABELV $859
line 2168
;2166:		}
;2167:
;2168:		currentMode = cl->credits[dc->indexCredit].mode;
ADDRLP4 12
CNSTI4 24
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 2169
;2169:		nextMode = cl->credits[next].mode;
ADDRLP4 16
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 2171
;2170:
;2171:		Credits_PrepareNextCredit(dc, next);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Credits_PrepareNextCredit
CALLV
pop
line 2175
;2172:
;2173:		// check for transition in/out of dual text
;2174:		// values in dc have changed after call to PrepareNextCredit
;2175:		if (currentMode != nextMode) {
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $861
line 2176
;2176:			if (nextMode == CMODE_DUALTEXT) {
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $863
line 2177
;2177:				Credits_StartDualCredits(cl, next, i);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Credits_StartDualCredits
CALLV
pop
line 2178
;2178:			}
LABELV $863
line 2180
;2179:
;2180:			if (currentMode == CMODE_DUALTEXT) {
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $865
line 2181
;2181:				Credits_StopDualCredits(dc);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Credits_StopDualCredits
CALLV
pop
line 2182
;2182:			}
LABELV $865
line 2183
;2183:		}
LABELV $861
line 2184
;2184:	}
LABELV $850
line 2150
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $849
line 2187
;2185:
;2186:	// start end sequence if on last credit
;2187:	if (bDone)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $867
line 2188
;2188:		Credits_SetNextImageAnimation(TGA_TOIMAGEBLEND);
CNSTI4 4
ARGI4
ADDRGP4 Credits_SetNextImageAnimation
CALLV
pop
LABELV $867
line 2190
;2189:
;2190:	return qtrue;
CNSTI4 1
RETI4
LABELV $847
endproc Credits_UpdateCredits 44 12
proc Credits_DrawCreditText 156 20
line 2203
;2191:}
;2192:
;2193:
;2194:
;2195:
;2196:
;2197:/*
;2198:===============
;2199:Credits_DrawCreditText
;2200:===============
;2201:*/
;2202:static void Credits_DrawCreditText( displayCredit_t* dc )
;2203:{
line 2216
;2204:	int i;
;2205:	int x, y, w, h;
;2206:	creditEntry_t* ce;
;2207:	creditList_t* cl;
;2208:	int line;
;2209:	float scale;
;2210:	float frac;
;2211:	vec4_t color;
;2212:	char text[MAX_CREDIT_TEXT];
;2213:	qboolean reverse;
;2214:	qboolean shuffle;
;2215:
;2216:	cl = &endCredits[s_credits.textGroup];
ADDRLP4 96
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits
ADDP4
ASGNP4
line 2217
;2217:	ce = &cl->credits[dc->indexCredit];
ADDRLP4 84
CNSTI4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRLP4 96
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDP4
ASGNP4
line 2218
;2218:	if (ce->mode == CMODE_QUOTE) {
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 4
NEI4 $871
line 2219
;2219:		ce = &quoteList[dc->indexData].quote;
ADDRLP4 84
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 quoteList+4
ADDP4
ASGNP4
line 2220
;2220:	}
LABELV $871
line 2222
;2221:
;2222:	x = 320 - dc->width/2 - CREDIT_BORDER;
ADDRLP4 112
CNSTI4 320
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CNSTI4 10
SUBI4
ASGNI4
line 2223
;2223:	y = dc->offset_y - dc->height/2 - CREDIT_BORDER;
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 128
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 128
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CNSTI4 10
SUBI4
ASGNI4
line 2224
;2224:	w = dc->width + 2*CREDIT_BORDER;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 2225
;2225:	h = dc->height + 2*CREDIT_BORDER;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 2227
;2226:
;2227:	ColorTransparency(color_credit_background, color, dc->transparency);
ADDRGP4 color_credit_background
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRGP4 ColorTransparency
CALLV
pop
line 2228
;2228:	UI_FillRect(x, y, w, h, color);
ADDRLP4 112
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 116
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 120
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 2231
;2229:
;2230:	// bar is offset 2 pixels in from border
;2231:	ColorTransparency(color_credit_bar, color, dc->transparency);
ADDRGP4 color_credit_bar
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRGP4 ColorTransparency
CALLV
pop
line 2232
;2232:	UI_FillRect(x+2, y+2, w - 4, CREDIT_BAR, color);
ADDRLP4 132
CNSTI4 2
ASGNI4
ADDRLP4 112
INDIRI4
ADDRLP4 132
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 92
INDIRI4
ADDRLP4 132
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 116
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1077936128
ARGF4
ADDRLP4 68
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 2233
;2233:	UI_FillRect(x+2, y + h - 2 - CREDIT_BAR, w - 4, CREDIT_BAR, color);
ADDRLP4 136
CNSTI4 2
ASGNI4
ADDRLP4 112
INDIRI4
ADDRLP4 136
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 92
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ADDRLP4 136
INDIRI4
SUBI4
CNSTI4 3
SUBI4
CVIF4 4
ARGF4
ADDRLP4 116
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1077936128
ARGF4
ADDRLP4 68
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 2236
;2234:
;2235:	// draw the text
;2236:	y += CREDIT_BORDER;
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 2237
;2237:	line = 0;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 2238
;2238:	text[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 2240
;2239:
;2240:	reverse = Credits_DoReverseText();
ADDRLP4 140
ADDRGP4 Credits_DoReverseText
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 140
INDIRI4
ASGNI4
line 2241
;2241:	shuffle = Credits_DoShuffleText(dc);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 Credits_DoShuffleText
CALLI4
ASGNI4
ADDRLP4 104
ADDRLP4 144
INDIRI4
ASGNI4
line 2242
;2242:	if (dc->titleString) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $874
line 2243
;2243:		Q_strncpyz(text, dc->titleString, MAX_CREDIT_TEXT);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2245
;2244:
;2245:		if (reverse)
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $876
line 2246
;2246:			ReverseText(text);
ADDRLP4 4
ARGP4
ADDRGP4 ReverseText
CALLV
pop
LABELV $876
line 2247
;2247:		if (shuffle)
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $878
line 2248
;2248:			ShuffleText(text);
ADDRLP4 4
ARGP4
ADDRGP4 ShuffleText
CALLV
pop
LABELV $878
line 2250
;2249:
;2250:		ColorTransparency(cl->color_title, color, dc->transparency);
ADDRLP4 96
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRGP4 ColorTransparency
CALLV
pop
line 2251
;2251:		UI_DrawProportionalString(320, y, text, UI_CENTER|UI_DROPSHADOW, color);
CNSTI4 320
ARGI4
ADDRLP4 92
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 2049
ARGI4
ADDRLP4 68
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 2252
;2252:		line += PROP_HEIGHT;
ADDRLP4 88
ADDRLP4 88
INDIRI4
ADDRGP4 cl_propheight+12
INDIRI4
ADDI4
ASGNI4
line 2253
;2253:	}
LABELV $874
line 2255
;2254:
;2255:	scale = UI_ProportionalSizeScale(UI_SMALLFONT, 0);
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 148
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 148
INDIRF4
ASGNF4
line 2256
;2256:	for (i = 0; i < MAX_CREDIT_LINES && ce->text[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $884
JUMPV
LABELV $881
line 2257
;2257:		ColorTransparency(cl->color_text, color, dc->transparency);
ADDRLP4 96
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRGP4 ColorTransparency
CALLV
pop
line 2258
;2258:		Q_strncpyz(text, ce->text[i], MAX_CREDIT_TEXT);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 8
ADDP4
ADDP4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2259
;2259:		if (reverse)
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $885
line 2260
;2260:			ReverseText(text);
ADDRLP4 4
ARGP4
ADDRGP4 ReverseText
CALLV
pop
LABELV $885
line 2261
;2261:		if (shuffle)
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $887
line 2262
;2262:			ShuffleText(text);
ADDRLP4 4
ARGP4
ADDRGP4 ShuffleText
CALLV
pop
LABELV $887
line 2264
;2263:
;2264:		UI_DrawProportionalString(320, y + line, text, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, color);
CNSTI4 320
ARGI4
ADDRLP4 92
INDIRI4
ADDRLP4 88
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 2065
ARGI4
ADDRLP4 68
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 2265
;2265:		line += PROP_HEIGHT*scale;
ADDRLP4 88
ADDRLP4 88
INDIRI4
CVIF4 4
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
ADDRLP4 108
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2266
;2266:	}
LABELV $882
line 2256
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $884
ADDRLP4 0
INDIRI4
CNSTI4 4
GEI4 $890
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 8
ADDP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $881
LABELV $890
line 2267
;2267:}
LABELV $869
endproc Credits_DrawCreditText 156 20
proc Credits_DrawCredits 12 4
line 2278
;2268:
;2269:
;2270:
;2271:
;2272:/*
;2273:===============
;2274:Credits_DrawCredits
;2275:===============
;2276:*/
;2277:static void Credits_DrawCredits( void )
;2278:{
line 2282
;2279:	int i;
;2280:	displayCredit_t* dc;
;2281:
;2282:	if (!Credits_UpdateCredits())
ADDRLP4 8
ADDRGP4 Credits_UpdateCredits
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $892
line 2283
;2283:		return;
ADDRGP4 $891
JUMPV
LABELV $892
line 2285
;2284:
;2285:	for (i = 0; i < MAX_CREDITS_ONSCREEN; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $894
line 2286
;2286:		dc = &s_credits.credit[i];
ADDRLP4 4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+1080
ADDP4
ASGNP4
line 2287
;2287:		if (!dc->bDrawn)
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $899
line 2288
;2288:			continue;
ADDRGP4 $895
JUMPV
LABELV $899
line 2290
;2289:
;2290:		Credits_DrawCreditText(dc);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 Credits_DrawCreditText
CALLV
pop
line 2291
;2291:	}
LABELV $895
line 2285
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $894
line 2292
;2292:}
LABELV $891
endproc Credits_DrawCredits 12 4
proc Credits_IntAtOffset 4 0
line 2301
;2293:
;2294:
;2295:/*
;2296:===============
;2297:Credits_IntAtOffset
;2298:===============
;2299:*/
;2300:static int Credits_IntAtOffset(byte* image, int offset)
;2301:{
line 2304
;2302:	int value;
;2303:
;2304:	value = (int)image[offset+1];
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 2305
;2305:	value *= 256;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
LSHI4
ASGNI4
line 2306
;2306:	value += (int)image[offset];
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRU1
CVUI4 1
ADDI4
ASGNI4
line 2308
;2307:
;2308:	return value;
ADDRLP4 0
INDIRI4
RETI4
LABELV $901
endproc Credits_IntAtOffset 4 0
proc Credits_CreateRenderList 52 12
line 2321
;2309:}
;2310:
;2311:
;2312:
;2313:
;2314:
;2315:/*
;2316:===============
;2317:Credits_CreateRenderList
;2318:===============
;2319:*/
;2320:static void Credits_CreateRenderList(const imageTarga_t* image)
;2321:{
line 2329
;2322:	int i;
;2323:	int imageArea;
;2324:	float *pt;
;2325:	const byte* colptr;
;2326:	int count;
;2327:
;2328:	// run through all pixels, select those that will be drawn
;2329:	s_credits.numPoints = 0;
ADDRGP4 s_credits+34096
CNSTI4 0
ASGNI4
line 2330
;2330:	imageArea = image->width * image->height;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 32772
ADDP4
INDIRI4
MULI4
ASGNI4
line 2331
;2331:	count = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2332
;2332:	for (i = 0; i < imageArea; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $907
JUMPV
LABELV $904
line 2333
;2333:	{
line 2335
;2334:		// set the colour
;2335:		colptr = &image->targa[i * image->coloursize /*+ image->offset*/];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 32776
ADDP4
INDIRI4
MULI4
ADDRLP4 24
INDIRP4
ADDP4
ASGNP4
line 2338
;2336:
;2337:		// remove near black and faint pixels
;2338:		if ((colptr[0] < 0x08) && (colptr[1] < 0x08) && (colptr[2] < 0x08))
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 4
INDIRP4
INDIRU1
CVUI4 1
ADDRLP4 32
INDIRI4
GEI4 $908
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
ADDRLP4 32
INDIRI4
GEI4 $908
ADDRLP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
CVUI4 1
ADDRLP4 32
INDIRI4
GEI4 $908
line 2339
;2339:			continue;
ADDRGP4 $905
JUMPV
LABELV $908
line 2341
;2340:
;2341:		if (image->coloursize == 4 && colptr[3] < 0x08)
ADDRFP4 0
INDIRP4
CNSTI4 32776
ADDP4
INDIRI4
CNSTI4 4
NEI4 $910
ADDRLP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
CVUI4 1
CNSTI4 8
GEI4 $910
line 2342
;2342:			continue;
ADDRGP4 $905
JUMPV
LABELV $910
line 2345
;2343:
;2344:		// accurate pixel count, but don't store overflowed data
;2345:		count++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2346
;2346:		if (s_credits.numPoints == MAX_RENDEREDPIXELS)
ADDRGP4 s_credits+34096
INDIRI4
CNSTI4 4090
NEI4 $912
line 2347
;2347:			continue;
ADDRGP4 $905
JUMPV
LABELV $912
line 2349
;2348:
;2349:		s_credits.drawn[s_credits.numPoints] = i;
ADDRGP4 s_credits+34096
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_credits+34100
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2351
;2350:
;2351:		pt = s_credits.base_pos[s_credits.numPoints];
ADDRLP4 8
CNSTI4 12
ADDRGP4 s_credits+34096
INDIRI4
MULI4
ADDRGP4 s_credits+99540
ADDP4
ASGNP4
line 2352
;2352:		pt[0] = random() - 0.5;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
ASGNF4
line 2353
;2353:		pt[1] = 0.5 - (float)(i % image->width) / (image->width) ;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1056964608
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
MODI4
CVIF4 4
ADDRLP4 40
INDIRI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 2354
;2354:		pt[2] = -0.5 + (float)(i / image->width) / (image->height);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
DIVI4
CVIF4 4
ADDRLP4 44
INDIRP4
CNSTI4 32772
ADDP4
INDIRI4
CVIF4 4
DIVF4
CNSTF4 3204448256
ADDF4
ASGNF4
line 2356
;2355:
;2356:		s_credits.numPoints++;
ADDRLP4 48
ADDRGP4 s_credits+34096
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2357
;2357:	}
LABELV $905
line 2332
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $907
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $904
line 2359
;2358:
;2359:	if (s_credits.numPoints == MAX_RENDEREDPIXELS) {
ADDRGP4 s_credits+34096
INDIRI4
CNSTI4 4090
NEI4 $920
line 2360
;2360:		Com_Printf("Credits image: contains %i drawn pixels (limit %i), will render incomplete\n", count, MAX_RENDEREDPIXELS);
ADDRGP4 $923
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 4090
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2361
;2361:	}
LABELV $920
line 2362
;2362:}
LABELV $902
endproc Credits_CreateRenderList 52 12
proc Credits_ScaleTargaImageData 84 0
line 2375
;2363:
;2364:
;2365:
;2366:/*
;2367:===============
;2368:Credits_ScaleTargaImageData
;2369:
;2370:Best results with images that have ^2 dimensions
;2371:other isze images are effectively clipped down to ^2 sizes
;2372:===============
;2373:*/
;2374:static void Credits_ScaleTargaImageData(imageTarga_t* image, byte* colourData, int resample)
;2375:{
line 2388
;2376:	int i,j,k;
;2377:	int width, height;
;2378:	int sample;
;2379:	int imageArea;
;2380:	int colourBytes;
;2381:	int mask, masksum;
;2382:	int laststep;
;2383:	int colour[4];
;2384:	byte* destPtr;
;2385:	byte* srcPtr;
;2386:	byte* samplePtr;
;2387:
;2388:	sample = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 2390
;2389:
;2390:	width = image->width;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ASGNI4
line 2391
;2391:	height = image->height;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 32772
ADDP4
INDIRI4
ASGNI4
line 2392
;2392:	colourBytes = image->coloursize;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 32776
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $926
JUMPV
LABELV $925
line 2394
;2393:
;2394:	while (width > MAX_TARGA_WIDTH || height > MAX_TARGA_HEIGHT) {
line 2395
;2395:		width /= 2;
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 2396
;2396:		height /= 2;
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 2397
;2397:		sample *= 2;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 2398
;2398:	}
LABELV $926
line 2394
ADDRLP4 72
CNSTI4 64
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 72
INDIRI4
GTI4 $925
ADDRLP4 48
INDIRI4
ADDRLP4 72
INDIRI4
GTI4 $925
ADDRGP4 $929
JUMPV
LABELV $928
line 2400
;2399:
;2400:	while (resample > 0) {
line 2401
;2401:		width /= 2;
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 2402
;2402:		height /= 2;
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 2403
;2403:		sample *= 2;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 2405
;2404:
;2405:		resample--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2406
;2406:	}
LABELV $929
line 2400
ADDRFP4 8
INDIRI4
CNSTI4 0
GTI4 $928
line 2409
;2407:
;2408:	// correction for dropped pixels on end of line
;2409:    laststep = (image->width % sample);
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
MODI4
ASGNI4
line 2411
;2410:
;2411:	imageArea = height * width;
ADDRLP4 60
ADDRLP4 48
INDIRI4
ADDRLP4 44
INDIRI4
MULI4
ASGNI4
line 2412
;2412:	srcPtr = colourData;
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
line 2413
;2413:	destPtr = image->targa;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
line 2414
;2414:	mask = 0xff;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2415
;2415:	for (i = 0; i < imageArea; i++) {
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRGP4 $934
JUMPV
LABELV $931
line 2416
;2416:		colour[0] = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2417
;2417:		colour[1] = 0;
ADDRLP4 4+4
CNSTI4 0
ASGNI4
line 2418
;2418:		colour[2] = 0;
ADDRLP4 4+8
CNSTI4 0
ASGNI4
line 2419
;2419:		colour[3] = 0;
ADDRLP4 4+12
CNSTI4 0
ASGNI4
line 2421
;2420:
;2421:		samplePtr = srcPtr;
ADDRLP4 20
ADDRLP4 56
INDIRP4
ASGNP4
line 2422
;2422:		masksum = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 2423
;2423:		for (j = 0; j < sample * sample; j++) {
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 $941
JUMPV
LABELV $938
line 2424
;2424:			if (colourBytes == 4)
ADDRLP4 32
INDIRI4
CNSTI4 4
NEI4 $942
line 2425
;2425:				mask = samplePtr[3];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
CVUI4 1
ASGNI4
LABELV $942
line 2427
;2426:
;2427:			colour[0] += mask*samplePtr[0];
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRP4
INDIRU1
CVUI4 1
MULI4
ADDI4
ASGNI4
line 2428
;2428:			colour[1] += mask*samplePtr[1];
ADDRLP4 4+4
ADDRLP4 4+4
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
MULI4
ADDI4
ASGNI4
line 2429
;2429:			colour[2] += mask*samplePtr[2];
ADDRLP4 4+8
ADDRLP4 4+8
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
CVUI4 1
MULI4
ADDI4
ASGNI4
line 2430
;2430:			colour[3] += mask*mask;
ADDRLP4 4+12
ADDRLP4 4+12
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
line 2432
;2431:
;2432:            masksum += mask;
ADDRLP4 36
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2435
;2433:
;2434:			// get next colour position
;2435:			if ((j + 1)%sample == 0)
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 24
INDIRI4
MODI4
CNSTI4 0
NEI4 $947
line 2436
;2436:				samplePtr += (image->width - sample + 1)*colourBytes;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ADDRLP4 32
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
ADDP4
ASGNP4
ADDRGP4 $948
JUMPV
LABELV $947
line 2438
;2437:			else
;2438:				samplePtr += colourBytes;
ADDRLP4 20
ADDRLP4 32
INDIRI4
ADDRLP4 20
INDIRP4
ADDP4
ASGNP4
LABELV $948
line 2439
;2439:		}
LABELV $939
line 2423
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $941
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
ADDRLP4 24
INDIRI4
MULI4
LTI4 $938
line 2441
;2440:
;2441:		if (masksum) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $949
line 2442
;2442:			colour[0] /= masksum;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
DIVI4
ASGNI4
line 2443
;2443:			colour[1] /= masksum;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRI4
ADDRLP4 36
INDIRI4
DIVI4
ASGNI4
line 2444
;2444:			colour[2] /= masksum;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRI4
ADDRLP4 36
INDIRI4
DIVI4
ASGNI4
line 2445
;2445:		}
ADDRGP4 $950
JUMPV
LABELV $949
line 2446
;2446:		else {
line 2447
;2447:			colour[0] = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2448
;2448:			colour[1] = 0;
ADDRLP4 4+4
CNSTI4 0
ASGNI4
line 2449
;2449:			colour[2] = 0;
ADDRLP4 4+8
CNSTI4 0
ASGNI4
line 2450
;2450:		}
LABELV $950
line 2452
;2451:
;2452:		if (colour[0] > 0xff)
ADDRLP4 4
INDIRI4
CNSTI4 255
LEI4 $955
line 2453
;2453:			colour[0] = 0xff;
ADDRLP4 4
CNSTI4 255
ASGNI4
LABELV $955
line 2455
;2454:
;2455:		if (colour[1] > 0xff)
ADDRLP4 4+4
INDIRI4
CNSTI4 255
LEI4 $957
line 2456
;2456:			colour[1] = 0xff;
ADDRLP4 4+4
CNSTI4 255
ASGNI4
LABELV $957
line 2458
;2457:
;2458:		if (colour[2] > 0xff)
ADDRLP4 4+8
INDIRI4
CNSTI4 255
LEI4 $961
line 2459
;2459:			colour[2] = 0xff;
ADDRLP4 4+8
CNSTI4 255
ASGNI4
LABELV $961
line 2461
;2460:
;2461:		destPtr[0] = (byte)colour[0];
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2462
;2462:		destPtr[1] = (byte)colour[1];
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ADDRLP4 4+4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2463
;2463:		destPtr[2] = (byte)colour[2];
ADDRLP4 40
INDIRP4
CNSTI4 2
ADDP4
ADDRLP4 4+8
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2465
;2464:
;2465:		if (colourBytes == 4) {
ADDRLP4 32
INDIRI4
CNSTI4 4
NEI4 $967
line 2466
;2466:			if (masksum) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $969
line 2467
;2467:				colour[3] /= masksum;
ADDRLP4 4+12
ADDRLP4 4+12
INDIRI4
ADDRLP4 36
INDIRI4
DIVI4
ASGNI4
line 2468
;2468:				if (colour[3] > 0xff)
ADDRLP4 4+12
INDIRI4
CNSTI4 255
LEI4 $970
line 2469
;2469:					colour[3] = 0xff;
ADDRLP4 4+12
CNSTI4 255
ASGNI4
line 2470
;2470:			}
ADDRGP4 $970
JUMPV
LABELV $969
line 2472
;2471:			else
;2472:				colour[3] = 0;
ADDRLP4 4+12
CNSTI4 0
ASGNI4
LABELV $970
line 2473
;2473:			destPtr[3] = (byte)colour[3];
ADDRLP4 40
INDIRP4
CNSTI4 3
ADDP4
ADDRLP4 4+12
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2474
;2474:		}
LABELV $967
line 2477
;2475:
;2476:		// get start of next block
;2477:		destPtr += colourBytes;
ADDRLP4 40
ADDRLP4 32
INDIRI4
ADDRLP4 40
INDIRP4
ADDP4
ASGNP4
line 2478
;2478:		if ((i + 1) % width == 0)
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 44
INDIRI4
MODI4
CNSTI4 0
NEI4 $978
line 2479
;2479:			srcPtr += (image->width*(sample-1) + sample + laststep)*colourBytes;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 1
SUBI4
MULI4
ADDRLP4 24
INDIRI4
ADDI4
ADDRLP4 64
INDIRI4
ADDI4
ADDRLP4 32
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
ADDP4
ASGNP4
ADDRGP4 $979
JUMPV
LABELV $978
line 2481
;2480:		else
;2481:			srcPtr += sample*colourBytes;
ADDRLP4 56
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
ADDP4
ASGNP4
LABELV $979
line 2482
;2482:	}
LABELV $932
line 2415
ADDRLP4 52
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $934
ADDRLP4 52
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $931
line 2484
;2483:
;2484:	image->width = width;
ADDRFP4 0
INDIRP4
CNSTI4 32768
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 2485
;2485:	image->height = height;
ADDRFP4 0
INDIRP4
CNSTI4 32772
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 2486
;2486:}
LABELV $924
endproc Credits_ScaleTargaImageData 84 0
bss
align 1
LABELV $981
skip 131072
code
proc Credits_ProcessTargaImage 84 16
line 2496
;2487:
;2488:
;2489:
;2490:/*
;2491:===============
;2492:Credits_ProcessTargaImage
;2493:===============
;2494:*/
;2495:static qboolean Credits_ProcessTargaImage(const char* imageFile, imageTarga_t* image, int resample)
;2496:{
line 2509
;2497:	static byte targaFile[MAX_TARGA_FILESIZE];
;2498:
;2499:	fileHandle_t file;
;2500:	int len;
;2501:	int rgbsize;
;2502:	int minsize;
;2503:	int imageType;
;2504:	int i, j;
;2505:	int imageArea;
;2506:	int pixelCount;
;2507:	int offset;
;2508:
;2509:	if (!imageFile)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $982
line 2510
;2510:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $980
JUMPV
LABELV $982
line 2513
;2511:
;2512:	// load image
;2513:	len = trap_FS_FOpenFile(imageFile, &file, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 40
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ASGNI4
line 2514
;2514:	if (len >= MAX_TARGA_FILESIZE) {
ADDRLP4 0
INDIRI4
CNSTI4 131072
LTI4 $984
line 2515
;2515:		Com_Printf("Credits image: %s too large (%i bytes)\n", imageFile, len);
ADDRGP4 $986
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2516
;2516:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $980
JUMPV
LABELV $984
line 2519
;2517:	}
;2518:
;2519:	if (len < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $987
line 2520
;2520:		Com_Printf("Credits image: %s not found\n", imageFile);
ADDRGP4 $989
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2521
;2521:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $980
JUMPV
LABELV $987
line 2524
;2522:	}
;2523:
;2524:	trap_FS_Read(targaFile, len, file);
ADDRGP4 $981
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 2525
;2525:	trap_FS_FCloseFile(file);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 2528
;2526:
;2527:	// validate image, check targa type
;2528:	imageType = targaFile[2];
ADDRLP4 16
ADDRGP4 $981+2
INDIRU1
CVUI4 1
ASGNI4
line 2529
;2529:	if ( imageType != 2) {
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $991
line 2530
;2530:		Com_Printf("Credits image: %s is type %i, only type 2 supported\n", imageFile, imageType );
ADDRGP4 $993
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2531
;2531:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $980
JUMPV
LABELV $991
line 2535
;2532:	}
;2533:
;2534:	// validate image, check we can read the colour format
;2535:	rgbsize = targaFile[16];
ADDRLP4 4
ADDRGP4 $981+16
INDIRU1
CVUI4 1
ASGNI4
line 2537
;2536:
;2537:	if (rgbsize != 24 && rgbsize != 32) {
ADDRLP4 4
INDIRI4
CNSTI4 24
EQI4 $995
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $995
line 2538
;2538:		Com_Printf("Credits image: unsupported colour format (%i bits)\n", rgbsize);
ADDRGP4 $997
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2539
;2539:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $980
JUMPV
LABELV $995
line 2543
;2540:	}
;2541:
;2542:	// convert to bytes from bits
;2543:	image->coloursize = rgbsize/8;
ADDRFP4 4
INDIRP4
CNSTI4 32776
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 8
DIVI4
ASGNI4
line 2547
;2544:
;2545:
;2546:	// find the offset to the start of the rgb data
;2547:	offset = 18;
ADDRLP4 8
CNSTI4 18
ASGNI4
line 2548
;2548:	offset += (int)targaFile[0];
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRGP4 $981
INDIRU1
CVUI4 1
ADDI4
ASGNI4
line 2549
;2549:	if (targaFile[1]) {
ADDRGP4 $981+1
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $998
line 2550
;2550:		Com_Printf("Credits image: %s image map ignored\n", imageFile);
ADDRGP4 $1001
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2551
;2551:		offset += Credits_IntAtOffset(targaFile, 5) * (image->targa[7]/8);
ADDRGP4 $981
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 48
ADDRGP4 Credits_IntAtOffset
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 7
ADDP4
INDIRU1
CVUI4 1
CNSTI4 8
DIVI4
MULI4
ADDI4
ASGNI4
line 2552
;2552:	}
LABELV $998
line 2555
;2553:
;2554:	// validate image, check the size
;2555:	image->width = Credits_IntAtOffset(targaFile, 12);
ADDRGP4 $981
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 48
ADDRGP4 Credits_IntAtOffset
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 32768
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 2556
;2556:	image->height = Credits_IntAtOffset(targaFile, 14);
ADDRGP4 $981
ARGP4
CNSTI4 14
ARGI4
ADDRLP4 52
ADDRGP4 Credits_IntAtOffset
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 32772
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 2558
;2557:
;2558:	if (image->width <= 0 || image->height <= 0) {
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $1004
ADDRLP4 56
INDIRP4
CNSTI4 32772
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
GTI4 $1002
LABELV $1004
line 2559
;2559:		Com_Printf("Credits image: zero or negative image size (!!!)\n");
ADDRGP4 $1005
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2560
;2560:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $980
JUMPV
LABELV $1002
line 2564
;2561:	}
;2562:
;2563:	// copy image data into targa buffer
;2564:	pixelCount = image->width * image->height;
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 32772
ADDP4
INDIRI4
MULI4
ASGNI4
line 2565
;2565:	if (pixelCount > MAX_TARGA_WIDTH*MAX_TARGA_HEIGHT || image->width > 2*MAX_TARGA_WIDTH || image->height > 2*MAX_TARGA_HEIGHT || resample > 0) {
ADDRLP4 20
INDIRI4
CNSTI4 4096
GTI4 $1010
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
CNSTI4 128
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
GTI4 $1010
ADDRLP4 68
INDIRP4
CNSTI4 32772
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
GTI4 $1010
ADDRFP4 8
INDIRI4
CNSTI4 0
LEI4 $1006
LABELV $1010
line 2566
;2566:		if (uis.debug)
ADDRGP4 uis+11392
INDIRI4
CNSTI4 0
EQI4 $1011
line 2567
;2567:			Com_Printf("Credits image: %s too large (%ix%i), scaling\n", imageFile, image->width, image->height);
ADDRGP4 $1014
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
CNSTI4 32772
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $1011
line 2569
;2568:
;2569:		Credits_ScaleTargaImageData(image, targaFile + offset, resample);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ADDRGP4 $981
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Credits_ScaleTargaImageData
CALLV
pop
line 2570
;2570:	}
ADDRGP4 $1007
JUMPV
LABELV $1006
line 2571
;2571:	else {
line 2572
;2572:		imageArea = pixelCount * image->coloursize;
ADDRLP4 24
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 32776
ADDP4
INDIRI4
MULI4
ASGNI4
line 2573
;2573:		memcpy(image->targa, targaFile + offset, imageArea);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ADDRGP4 $981
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2574
;2574:	}
LABELV $1007
line 2576
;2575:
;2576:	if (image->height > image->width) {
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 32772
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
LEI4 $1015
line 2577
;2577:		image->scale = 10.0 * (32.0 / image->height);
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 32780
ADDP4
CNSTF4 1092616192
CNSTF4 1107296256
ADDRLP4 80
INDIRP4
CNSTI4 32772
ADDP4
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
line 2578
;2578:	}
ADDRGP4 $1016
JUMPV
LABELV $1015
line 2579
;2579:	else {
line 2580
;2580:		image->scale = 10.0 * (32.0 / image->width);
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 32780
ADDP4
CNSTF4 1092616192
CNSTF4 1107296256
ADDRLP4 80
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
line 2581
;2581:	}
LABELV $1016
line 2586
;2582:
;2583:	// ready to go
;2584://	Com_Printf(va("Credits image %s loaded.\n", imageFile));
;2585:
;2586:	return qtrue;
CNSTI4 1
RETI4
LABELV $980
endproc Credits_ProcessTargaImage 84 16
proc Credits_ColorMergeMix 8 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRFP4 4
ADDRFP4 4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRFP4 12
ADDRFP4 12
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2598
;2587:}
;2588:
;2589:
;2590:
;2591:
;2592:/*
;2593:===============
;2594:Credits_ColourMergeMix
;2595:===============
;2596:*/
;2597:static byte Credits_ColorMergeMix(byte c1, byte c2, byte m1, byte m2)
;2598:{
line 2602
;2599:	int weight;
;2600:	int col;
;2601:
;2602:	weight = m1 + m2;
ADDRLP4 4
ADDRFP4 8
INDIRU1
CVUI4 1
ADDRFP4 12
INDIRU1
CVUI4 1
ADDI4
ASGNI4
line 2603
;2603:	if (weight == 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1018
line 2604
;2604:		return 0x00;
CNSTI4 0
RETI4
ADDRGP4 $1017
JUMPV
LABELV $1018
line 2606
;2605:
;2606:	col = m1*c1 + m2*c2;
ADDRLP4 0
ADDRFP4 8
INDIRU1
CVUI4 1
ADDRFP4 0
INDIRU1
CVUI4 1
MULI4
ADDRFP4 12
INDIRU1
CVUI4 1
ADDRFP4 4
INDIRU1
CVUI4 1
MULI4
ADDI4
ASGNI4
line 2607
;2607:	col /= weight;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 2609
;2608:
;2609:	if (col > 0xff)
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1020
line 2610
;2610:		col = 0xff;
ADDRLP4 0
CNSTI4 255
ASGNI4
LABELV $1020
line 2612
;2611:
;2612:	return (byte)col;
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
CVUI4 1
RETI4
LABELV $1017
endproc Credits_ColorMergeMix 8 0
proc Credits_ColorMergeAdd 8 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRFP4 4
ADDRFP4 4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
ADDRFP4 12
ADDRFP4 12
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2624
;2613:}
;2614:
;2615:
;2616:
;2617:
;2618:/*
;2619:===============
;2620:Credits_ColourMergeAdd
;2621:===============
;2622:*/
;2623:static byte Credits_ColorMergeAdd(byte s, byte d, byte ms, byte md)
;2624:{
line 2628
;2625:	unsigned int weight;
;2626:	unsigned int col;
;2627:
;2628:	weight = ms + 0xff;
ADDRLP4 4
ADDRFP4 8
INDIRU1
CVUI4 1
CNSTI4 255
ADDI4
CVIU4 4
ASGNU4
line 2629
;2629:	if (weight == 0)
ADDRLP4 4
INDIRU4
CNSTU4 0
NEU4 $1023
line 2630
;2630:		return 0x00;
CNSTI4 0
RETI4
ADDRGP4 $1022
JUMPV
LABELV $1023
line 2632
;2631:
;2632:	col = ms*s + 0xff*d;
ADDRLP4 0
ADDRFP4 8
INDIRU1
CVUI4 1
ADDRFP4 0
INDIRU1
CVUI4 1
MULI4
CNSTI4 255
ADDRFP4 4
INDIRU1
CVUI4 1
MULI4
ADDI4
CVIU4 4
ASGNU4
line 2633
;2633:	col /= weight;
ADDRLP4 0
ADDRLP4 0
INDIRU4
ADDRLP4 4
INDIRU4
DIVU4
ASGNU4
line 2635
;2634:
;2635:	if (col > 0xff)
ADDRLP4 0
INDIRU4
CNSTU4 255
LEU4 $1025
line 2636
;2636:		col = 0xff;
ADDRLP4 0
CNSTU4 255
ASGNU4
LABELV $1025
line 2638
;2637:
;2638:	return (byte)col;
ADDRLP4 0
INDIRU4
CVUU1 4
CVUI4 1
RETI4
LABELV $1022
endproc Credits_ColorMergeAdd 8 0
bss
align 4
LABELV $1028
skip 32784
code
proc Credits_MergeSecondTargaImage 124 16
line 2649
;2639:}
;2640:
;2641:
;2642:
;2643:/*
;2644:===============
;2645:Credits_MergeSecondTargaImage
;2646:===============
;2647:*/
;2648:static qboolean Credits_MergeSecondTargaImage(imageTarga_t* dest, const char* imageFile, float d_fade, float s_fade, int resample)
;2649:{
line 2657
;2650:	static imageTarga_t s_image;
;2651:
;2652:	int i;
;2653:	int imageArea;
;2654:	byte s_mask, d_mask;
;2655:	byte *s_offset, *d_offset;
;2656:
;2657:	if (!imageFile || !dest)
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1031
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
NEU4 $1029
LABELV $1031
line 2658
;2658:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1027
JUMPV
LABELV $1029
line 2661
;2659:
;2660:	// load second image data
;2661:	if (!Credits_ProcessTargaImage(imageFile, &s_image, resample))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $1028
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Credits_ProcessTargaImage
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1032
line 2662
;2662:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1027
JUMPV
LABELV $1032
line 2665
;2663:
;2664:	// compare data formats and prepare data
;2665:	if (dest->width != s_image.width || dest->height != s_image.height) {
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 32768
ADDP4
INDIRI4
ADDRGP4 $1028+32768
INDIRI4
NEI4 $1038
ADDRLP4 28
INDIRP4
CNSTI4 32772
ADDP4
INDIRI4
ADDRGP4 $1028+32772
INDIRI4
EQI4 $1034
LABELV $1038
line 2666
;2666:		Com_Printf("2nd Credit image: different size\n");
ADDRGP4 $1039
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2667
;2667:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1027
JUMPV
LABELV $1034
line 2670
;2668:	}
;2669:
;2670:	imageArea = s_image.width * s_image.height;
ADDRLP4 16
ADDRGP4 $1028+32768
INDIRI4
ADDRGP4 $1028+32772
INDIRI4
MULI4
ASGNI4
line 2673
;2671:
;2672:	// merge images to data format of first image
;2673:	s_mask = (byte)(0xff * s_fade);
ADDRLP4 36
CNSTF4 1132396544
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
CNSTF4 1325400064
ASGNF4
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
LTF4 $1043
ADDRLP4 32
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1044
JUMPV
LABELV $1043
ADDRLP4 32
ADDRLP4 36
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1044
ADDRLP4 12
ADDRLP4 32
INDIRU4
CVUU1 4
ASGNU1
line 2674
;2674:	d_mask = (byte)(0xff * d_fade);
ADDRLP4 48
CNSTF4 1132396544
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 52
CNSTF4 1325400064
ASGNF4
ADDRLP4 48
INDIRF4
ADDRLP4 52
INDIRF4
LTF4 $1046
ADDRLP4 44
ADDRLP4 48
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1047
JUMPV
LABELV $1046
ADDRLP4 44
ADDRLP4 48
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1047
ADDRLP4 13
ADDRLP4 44
INDIRU4
CVUU1 4
ASGNU1
line 2675
;2675:	for (i = 0; i < imageArea; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1051
JUMPV
LABELV $1048
line 2676
;2676:		s_offset = &s_image.targa[i * s_image.coloursize];
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRGP4 $1028+32776
INDIRI4
MULI4
ADDRGP4 $1028
ADDP4
ASGNP4
line 2677
;2677:		d_offset = &dest->targa[i * dest->coloursize];
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 32776
ADDP4
INDIRI4
MULI4
ADDRLP4 56
INDIRP4
ADDP4
ASGNP4
line 2680
;2678:
;2679:		// grab transparency if in data
;2680:		if (s_image.coloursize == 4)
ADDRGP4 $1028+32776
INDIRI4
CNSTI4 4
NEI4 $1053
line 2681
;2681:			s_mask = (byte)(s_offset[3] * s_fade);
ADDRLP4 64
ADDRLP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
CVUI4 1
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
CNSTF4 1325400064
ASGNF4
ADDRLP4 64
INDIRF4
ADDRLP4 68
INDIRF4
LTF4 $1057
ADDRLP4 60
ADDRLP4 64
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1058
JUMPV
LABELV $1057
ADDRLP4 60
ADDRLP4 64
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1058
ADDRLP4 12
ADDRLP4 60
INDIRU4
CVUU1 4
ASGNU1
LABELV $1053
line 2683
;2682:
;2683:		if (dest->coloursize == 4)
ADDRFP4 0
INDIRP4
CNSTI4 32776
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1059
line 2684
;2684:			d_mask = d_offset[3] * d_fade;
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
CVUI4 1
CVIF4 4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 80
CNSTF4 1325400064
ASGNF4
ADDRLP4 76
INDIRF4
ADDRLP4 80
INDIRF4
LTF4 $1062
ADDRLP4 72
ADDRLP4 76
INDIRF4
ADDRLP4 80
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1063
JUMPV
LABELV $1062
ADDRLP4 72
ADDRLP4 76
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1063
ADDRLP4 13
ADDRLP4 72
INDIRU4
CVUU1 4
ASGNU1
LABELV $1059
line 2686
;2685:
;2686:		d_offset[0] = Credits_ColorMergeAdd(s_offset[0], d_offset[0], s_mask, d_mask);
ADDRLP4 4
INDIRP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 12
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 13
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 88
ADDRGP4 Credits_ColorMergeAdd
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 88
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2687
;2687:		d_offset[1] = Credits_ColorMergeAdd(s_offset[1], d_offset[1], s_mask, d_mask);
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 96
ADDRLP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 12
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 13
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 100
ADDRGP4 Credits_ColorMergeAdd
CALLI4
ASGNI4
ADDRLP4 96
INDIRP4
ADDRLP4 100
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2688
;2688:		d_offset[2] = Credits_ColorMergeAdd(s_offset[2], d_offset[2], s_mask, d_mask);
ADDRLP4 104
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 108
ADDRLP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 12
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 13
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 112
ADDRGP4 Credits_ColorMergeAdd
CALLI4
ASGNI4
ADDRLP4 108
INDIRP4
ADDRLP4 112
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2690
;2689:
;2690:		if (dest->coloursize == 4)
ADDRFP4 0
INDIRP4
CNSTI4 32776
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1064
line 2691
;2691:			d_offset[3] = Credits_ColorMergeMix(0xff, 0xff, s_mask, d_mask);
ADDRLP4 116
CNSTI4 255
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 12
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 13
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 120
ADDRGP4 Credits_ColorMergeMix
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 3
ADDP4
ADDRLP4 120
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $1064
line 2692
;2692:	}
LABELV $1049
line 2675
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1051
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $1048
line 2694
;2693:
;2694:	return qtrue;
CNSTI4 1
RETI4
LABELV $1027
endproc Credits_MergeSecondTargaImage 124 16
proc Credits_ProcessBackgroundImage 12 20
line 2705
;2695:}
;2696:
;2697:
;2698:
;2699:/*
;2700:=================
;2701:Credits_ProcessBackgroundImage
;2702:=================
;2703:*/
;2704:static void Credits_ProcessBackgroundImage( imageTarga_t* dest, const imageSource_t* is )
;2705:{
line 2706
;2706:	if (Credits_ProcessTargaImage(is->baseImage, dest, is->baseResample))
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Credits_ProcessTargaImage
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1067
line 2707
;2707:		Credits_MergeSecondTargaImage(dest, is->overlayImage, is->baseWeight, is->overlayWeight, is->overlayResample);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 Credits_MergeSecondTargaImage
CALLI4
pop
LABELV $1067
line 2708
;2708:}
LABELV $1066
endproc Credits_ProcessBackgroundImage 12 20
proc Credits_SelectDateImage 60 4
line 2719
;2709:
;2710:
;2711:
;2712:
;2713:/*
;2714:=================
;2715:Credits_SelectDateImage
;2716:=================
;2717:*/
;2718:static const imageSource_t* Credits_SelectDateImage( const creditList_t* cl )
;2719:{
line 2726
;2720:	int i;
;2721:	qtime_t qt;
;2722:	const dateImageList_t* dil;
;2723:	const imageSource_t* is;
;2724:	int select, countImages;
;2725:
;2726:	trap_RealTime(&qt);
ADDRLP4 8
ARGP4
ADDRGP4 trap_RealTime
CALLI4
pop
line 2728
;2727:
;2728:	dil = cl->dateImages;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ASGNP4
line 2729
;2729:	if (!dil)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1070
line 2730
;2730:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $1069
JUMPV
LABELV $1070
line 2733
;2731:
;2732:	// count number of images on a given day
;2733:	countImages = 0;
ADDRLP4 48
CNSTI4 0
ASGNI4
line 2734
;2734:	for (i = 0; i < cl->dateImagesSize; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1075
JUMPV
LABELV $1072
line 2735
;2735:		if (dil[i].day == qt.tm_mday && dil[i].month == qt.tm_mon)
ADDRLP4 56
CNSTI4 36
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRLP4 8+12
INDIRI4
NEI4 $1076
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8+16
INDIRI4
NEI4 $1076
line 2736
;2736:			countImages++;
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1076
line 2737
;2737:	}
LABELV $1073
line 2734
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1075
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
LTI4 $1072
line 2739
;2738:
;2739:	if (countImages == 0)
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $1080
line 2740
;2740:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $1069
JUMPV
LABELV $1080
LABELV $1082
line 2742
;2741:
;2742:	do {
line 2743
;2743:		select = countImages*random();
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
CVIF4 4
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 2744
;2744:	} while (select == countImages);
LABELV $1083
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $1082
line 2747
;2745:
;2746:	// find that image
;2747:	is = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 2748
;2748:	for (i = 0; i < cl->dateImagesSize; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1088
JUMPV
LABELV $1085
line 2749
;2749:		if (dil[i].day == qt.tm_mday && dil[i].month == qt.tm_mon) {
ADDRLP4 56
CNSTI4 36
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRLP4 8+12
INDIRI4
NEI4 $1089
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8+16
INDIRI4
NEI4 $1089
line 2750
;2750:			select--;
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2751
;2751:			if (select < 0) {
ADDRLP4 44
INDIRI4
CNSTI4 0
GEI4 $1093
line 2752
;2752:				is = &dil[i].image;
ADDRLP4 52
CNSTI4 36
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ASGNP4
line 2753
;2753:				break;
ADDRGP4 $1087
JUMPV
LABELV $1093
line 2755
;2754:			}
;2755:		}
LABELV $1089
line 2756
;2756:	}
LABELV $1086
line 2748
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1088
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
LTI4 $1085
LABELV $1087
line 2758
;2757:
;2758:	return is;
ADDRLP4 52
INDIRP4
RETP4
LABELV $1069
endproc Credits_SelectDateImage 60 4
proc Credits_ChooseBackgroundImage 36 8
line 2770
;2759:}
;2760:
;2761:
;2762:
;2763:
;2764:/*
;2765:=================
;2766:Credits_ChooseBackgroundImage
;2767:=================
;2768:*/
;2769:static void Credits_ChooseBackgroundImage( void )
;2770:{
line 2777
;2771:	int i;
;2772:	int imageIndex;
;2773:	int weight, weightTotal;
;2774:	const creditList_t* cl;
;2775:	const imageSource_t* is;
;2776:
;2777:	s_credits.imageMode = TGA_NONE;
ADDRGP4 s_credits+148620
CNSTI4 0
ASGNI4
line 2779
;2778:
;2779:	cl = &endCredits[s_credits.textGroup];
ADDRLP4 4
CNSTI4 40
ADDRGP4 s_credits+1076
INDIRI4
MULI4
ADDRGP4 endCredits
ADDP4
ASGNP4
line 2780
;2780:	if (!cl->imageList) {
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1098
line 2781
;2781:		return;
ADDRGP4 $1095
JUMPV
LABELV $1098
line 2785
;2782:	}
;2783:
;2784:	// choose the backdrop image
;2785:	is = Credits_SelectDateImage(cl);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Credits_SelectDateImage
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
line 2787
;2786:
;2787:	if (!(is && random() < 0.5)) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1102
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
LTF4 $1100
LABELV $1102
line 2788
;2788:		if (s_credits.textPass == 0) {
ADDRGP4 s_credits+1168
INDIRI4
CNSTI4 0
NEI4 $1103
line 2790
;2789:			// always choose first image on first pass
;2790:			imageIndex = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 2791
;2791:			is = &cl->imageList[0];
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ASGNP4
line 2792
;2792:		}
ADDRGP4 $1104
JUMPV
LABELV $1103
line 2793
;2793:		else {
line 2795
;2794:			// choose a random image
;2795:			weightTotal = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2796
;2796:			for (i = 0; i < cl->imageListSize; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1109
JUMPV
LABELV $1106
line 2797
;2797:				weightTotal += cl->imageList[i].weight;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 2798
;2798:			}
LABELV $1107
line 2796
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1109
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
LTI4 $1106
LABELV $1110
line 2800
;2799:
;2800:			do {
line 2801
;2801:				weight = weightTotal * random();
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CVFI4 4
ASGNI4
line 2802
;2802:			} while (imageIndex == weightTotal);
LABELV $1111
ADDRLP4 20
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1110
line 2804
;2803:
;2804:			imageIndex = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 2805
;2805:			for (i = 0; i < cl->imageListSize; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1116
JUMPV
LABELV $1113
line 2806
;2806:				weight-= cl->imageList[i].weight;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 2807
;2807:				if (weight < 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $1117
line 2808
;2808:					is = &cl->imageList[i];
ADDRLP4 16
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ADDP4
ASGNP4
line 2809
;2809:					break;
ADDRGP4 $1115
JUMPV
LABELV $1117
line 2811
;2810:				}
;2811:			}
LABELV $1114
line 2805
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1116
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
LTI4 $1113
LABELV $1115
line 2812
;2812:		}
LABELV $1104
line 2813
;2813:	}
LABELV $1100
line 2815
;2814:
;2815:	if (is)
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1119
line 2816
;2816:		Credits_ProcessBackgroundImage(&s_credits.tga, is);
ADDRGP4 s_credits+1312
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 Credits_ProcessBackgroundImage
CALLV
pop
LABELV $1119
line 2817
;2817:}
LABELV $1095
endproc Credits_ChooseBackgroundImage 36 8
proc Credits_InitCreditSequence 68 8
line 2828
;2818:
;2819:
;2820:
;2821:
;2822:/*
;2823:=================
;2824:Credits_InitCreditSequence
;2825:=================
;2826:*/
;2827:static void Credits_InitCreditSequence( qboolean nextGroup )
;2828:{
line 2834
;2829:	int i;
;2830:	int w, width, h;
;2831:	float scale;
;2832:	const creditEntry_t *ce;
;2833:
;2834:	s_credits.dualTextPhase = 0;
ADDRGP4 s_credits+1176
CNSTI4 0
ASGNI4
line 2835
;2835:	if (nextGroup) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1124
line 2836
;2836:		s_credits.textGroup++;
ADDRLP4 24
ADDRGP4 s_credits+1076
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2837
;2837:		if (s_credits.textGroup >= numEndCredits) {
ADDRGP4 s_credits+1076
INDIRI4
ADDRGP4 numEndCredits
INDIRI4
LTI4 $1125
line 2838
;2838:			s_credits.textGroup = 0;
ADDRGP4 s_credits+1076
CNSTI4 0
ASGNI4
line 2839
;2839:			s_credits.textPass++;
ADDRLP4 28
ADDRGP4 s_credits+1168
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2840
;2840:		}
line 2841
;2841:	}
ADDRGP4 $1125
JUMPV
LABELV $1124
line 2842
;2842:	else {
line 2843
;2843:		s_credits.textPass = 0;
ADDRGP4 s_credits+1168
CNSTI4 0
ASGNI4
line 2844
;2844:		s_credits.textGroup = 0;
ADDRGP4 s_credits+1076
CNSTI4 0
ASGNI4
line 2845
;2845:	}
LABELV $1125
line 2847
;2846:
;2847:	s_credits.activeCreditModes = CREDIT_NORMAL;
ADDRGP4 s_credits+1172
CNSTI4 0
ASGNI4
line 2848
;2848:	if (random() < 0.3)
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1050253722
GEF4 $1135
line 2849
;2849:		s_credits.activeCreditModes |= CREDIT_REVERSETEXT;
ADDRLP4 28
ADDRGP4 s_credits+1172
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $1135
line 2850
;2850:	if (random() < 0.8)
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1061997773
GEF4 $1138
line 2851
;2851:		s_credits.activeCreditModes |= CREDIT_HIGHREVERSETEXT;
ADDRLP4 36
ADDRGP4 s_credits+1172
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $1138
line 2852
;2852:	if (random() < 0.9)
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1063675494
GEF4 $1141
line 2853
;2853:		s_credits.activeCreditModes |= CREDIT_SILLYTITLE;
ADDRLP4 44
ADDRGP4 s_credits+1172
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $1141
line 2854
;2854:	if (random() < 0.3)
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1050253722
GEF4 $1144
line 2855
;2855:		s_credits.activeCreditModes |= CREDIT_SHUFFLETEXT;
ADDRLP4 52
ADDRGP4 s_credits+1172
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
LABELV $1144
line 2857
;2856:
;2857:	Credits_ChooseBackgroundImage();
ADDRGP4 Credits_ChooseBackgroundImage
CALLV
pop
line 2859
;2858:
;2859:	Credits_CreateRenderList(&s_credits.tga);
ADDRGP4 s_credits+1312
ARGP4
ADDRGP4 Credits_CreateRenderList
CALLV
pop
line 2860
;2860:	Credits_SetRandomRotate(s_credits.angledelta);
ADDRGP4 s_credits+148672
ARGP4
ADDRGP4 Credits_SetRandomRotate
CALLV
pop
line 2862
;2861:
;2862:	s_credits.viewangles[PITCH] = 180 - 360.0 * random();
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 s_credits+148660
CNSTF4 1127481344
CNSTF4 1135869952
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
SUBF4
ASGNF4
line 2863
;2863:	s_credits.viewangles[YAW] = 360.0 * random();
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 s_credits+148660+4
CNSTF4 1135869952
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 2864
;2864:	s_credits.viewangles[ROLL] = 180 - 360.0 * random();
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 s_credits+148660+8
CNSTF4 1127481344
CNSTF4 1135869952
ADDRLP4 64
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
SUBF4
ASGNF4
line 2866
;2865:
;2866:	for (i = 0; i < MAX_EFFECTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1154
line 2867
;2867:		Credits_SetNewEffect(i, EFFECT_NONE);
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Credits_SetNewEffect
CALLV
pop
LABELV $1155
line 2866
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $1154
line 2869
;2868:
;2869:	Credits_PrepareNextCredit(&s_credits.credit[0], 0);
ADDRGP4 s_credits+1080
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Credits_PrepareNextCredit
CALLV
pop
line 2870
;2870:	for (i = 1; i < MAX_CREDITS_ONSCREEN; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $1159
line 2871
;2871:		Credits_PrepareNextCredit(&s_credits.credit[i], -1);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_credits+1080
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Credits_PrepareNextCredit
CALLV
pop
line 2872
;2872:	}
LABELV $1160
line 2870
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $1159
line 2873
;2873:}
LABELV $1122
endproc Credits_InitCreditSequence 68 8
proc Credits_Init 12 4
line 2885
;2874:
;2875:
;2876:
;2877:
;2878:
;2879:/*
;2880:=================
;2881:Credits_Init
;2882:=================
;2883:*/
;2884:static void Credits_Init( int num )
;2885:{
line 2889
;2886:	int i;
;2887:	float p;
;2888:
;2889:	for (i = 0; i < MAX_RECENT_MEMORY; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1165
line 2890
;2890:		s_credits.recentMessage[i] = -1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_credits+1180
ADDP4
CNSTI4 -1
ASGNI4
line 2891
;2891:		s_credits.recentTitle[i] = -1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_credits+1224
ADDP4
CNSTI4 -1
ASGNI4
line 2892
;2892:		s_credits.recentQuote[i] = -1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_credits+1268
ADDP4
CNSTI4 -1
ASGNI4
line 2893
;2893:	}
LABELV $1166
line 2889
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $1165
line 2895
;2894:
;2895:	s_credits.recentMessagePos = 0;
ADDRGP4 s_credits+1220
CNSTI4 0
ASGNI4
line 2896
;2896:	s_credits.recentTitlePos = 0;
ADDRGP4 s_credits+1264
CNSTI4 0
ASGNI4
line 2897
;2897:	s_credits.recentQuotePos = 0;
ADDRGP4 s_credits+1308
CNSTI4 0
ASGNI4
line 2900
;2898:
;2899:	// setup image and effects
;2900:	Credits_InitCreditSequence(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 Credits_InitCreditSequence
CALLV
pop
line 2901
;2901:	if(num == 0){
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $1175
line 2902
;2902:	Credits_SetNextImageAnimation(TGA_FADEIN);
CNSTI4 1
ARGI4
ADDRGP4 Credits_SetNextImageAnimation
CALLV
pop
line 2903
;2903:	}
LABELV $1175
line 2904
;2904:	if(num == 1){
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $1177
line 2905
;2905:	Credits_SetNextImageAnimation(TGA_TOIMAGE);
CNSTI4 5
ARGI4
ADDRGP4 Credits_SetNextImageAnimation
CALLV
pop
line 2906
;2906:	}
LABELV $1177
line 2908
;2907:
;2908:	p = random();
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 2919
;2909:
;2910:	/*if (p < 0.1) {
;2911:		trap_Cmd_ExecuteText( EXEC_APPEND, "music music/aumenu01\n");
;2912:	}
;2913:	else if (p < 0.2) {
;2914:		trap_Cmd_ExecuteText( EXEC_APPEND, "music music/aumenu03\n");
;2915:	}
;2916:	else {
;2917:		trap_Cmd_ExecuteText( EXEC_APPEND, "music music/aumenu02\n");
;2918:	}*/
;2919:}
LABELV $1164
endproc Credits_Init 12 4
proc UI_CreditMenu_Key 0 8
line 2929
;2920:
;2921:
;2922:
;2923:
;2924:/*
;2925:=================
;2926:UI_CreditMenu_Key
;2927:=================
;2928:*/
;2929:static sfxHandle_t UI_CreditMenu_Key( int key ) {
line 2930
;2930:	if( key & K_CHAR_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1180
line 2931
;2931:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1179
JUMPV
LABELV $1180
line 2933
;2932:	}
;2933:if(s_credits.menu.number == 0){
ADDRGP4 s_credits+1068
INDIRI4
CNSTI4 0
NEI4 $1182
line 2934
;2934:	trap_Cmd_ExecuteText( EXEC_APPEND,"quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $1185
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 2935
;2935:}
LABELV $1182
line 2936
;2936:if(s_credits.menu.number == 1){
ADDRGP4 s_credits+1068
INDIRI4
CNSTI4 1
NEI4 $1186
line 2937
;2937:		uis.hideCursor = qfalse;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 2939
;2938:		//trap_Cmd_ExecuteText( EXEC_APPEND, "music music/aumenu\n");
;2939:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 2940
;2940:		trap_Cmd_ExecuteText( EXEC_NOW, "mgui pages/autoexec\n");
CNSTI4 0
ARGI4
ADDRGP4 $1190
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 2941
;2941:}
LABELV $1186
line 2942
;2942:	return 0;
CNSTI4 0
RETI4
LABELV $1179
endproc UI_CreditMenu_Key 0 8
proc UI_CreditMenu_Draw 20 20
line 2951
;2943:}
;2944:
;2945:
;2946:/*
;2947:===============
;2948:UI_CreditMenu_Draw
;2949:===============
;2950:*/
;2951:static void UI_CreditMenu_Draw( void ) {
line 2956
;2952:	int		y;
;2953:	int i;
;2954:	float r;
;2955:
;2956:	Credits_DrawTargaImage();
ADDRGP4 Credits_DrawTargaImage
CALLV
pop
line 2958
;2957:
;2958:	if (s_credits.imageMode < TGA_TOIMAGE) {
ADDRGP4 s_credits+148620
INDIRI4
CNSTI4 5
GEI4 $1192
line 2959
;2959:		r = random();
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 2960
;2960:		Credits_DrawCredits();
ADDRGP4 Credits_DrawCredits
CALLV
pop
line 2961
;2961:		if(s_credits.menu.number == 1){
ADDRGP4 s_credits+1068
INDIRI4
CNSTI4 1
NEI4 $1195
line 2962
;2962:		uis.hideCursor = qfalse;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 2964
;2963:		//trap_Cmd_ExecuteText( EXEC_APPEND, "music music/aumenu\n");
;2964:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 2965
;2965:		trap_Cmd_ExecuteText( EXEC_NOW, "mgui pages/autoexec\n");
CNSTI4 0
ARGI4
ADDRGP4 $1190
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 2966
;2966:		}
LABELV $1195
line 2967
;2967:	}
LABELV $1192
line 2970
;2968:
;2969:	// debug info
;2970:	if (uis.debug) {
ADDRGP4 uis+11392
INDIRI4
CNSTI4 0
EQI4 $1199
line 2971
;2971:		y = 180;
ADDRLP4 4
CNSTI4 180
ASGNI4
line 2972
;2972:		for (i = 0; i < MAX_EFFECTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1202
line 2973
;2973:			UI_DrawString( 0-uis.wideoffset, y, va("%s, param=%i", effectData[s_credits.effects[i].type].name, s_credits.effects[i].param), UI_SMALLFONT, color_white );
ADDRGP4 $1207
ARGP4
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
CNSTI4 20
ADDRLP4 12
INDIRI4
ADDRGP4 s_credits+148628
ADDP4
INDIRI4
MULI4
ADDRGP4 effectData+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRGP4 s_credits+148628+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 2974
;2974:			y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 2975
;2975:		}
LABELV $1203
line 2972
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $1202
line 2977
;2976:
;2977:		UI_DrawString( 0-uis.wideoffset, y, va("Mode: %i", s_credits.imageMode), UI_SMALLFONT, color_white );
ADDRGP4 $1214
ARGP4
ADDRGP4 s_credits+148620
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 2978
;2978:		y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 2979
;2979:		UI_DrawString( 0-uis.wideoffset, y, va("NumPoints: %i", s_credits.numPoints), UI_SMALLFONT, color_white );
ADDRGP4 $1218
ARGP4
ADDRGP4 s_credits+34096
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 2980
;2980:	}
LABELV $1199
line 2981
;2981:}
LABELV $1191
endproc UI_CreditMenu_Draw 20 20
export UI_CreditMenu
proc UI_CreditMenu 0 12
line 2992
;2982:
;2983:
;2984:
;2985:
;2986:
;2987:/*
;2988:===============
;2989:UI_CreditMenu
;2990:===============
;2991:*/
;2992:void UI_CreditMenu( int num ) {
line 2993
;2993:	memset( &s_credits, 0 ,sizeof(s_credits) );
ADDRGP4 s_credits
ARGP4
CNSTI4 0
ARGI4
CNSTI4 148696
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2995
;2994:
;2995:	s_credits.menu.draw = UI_CreditMenu_Draw;
ADDRGP4 s_credits+1036
ADDRGP4 UI_CreditMenu_Draw
ASGNP4
line 2996
;2996:	s_credits.menu.key = UI_CreditMenu_Key;
ADDRGP4 s_credits+1040
ADDRGP4 UI_CreditMenu_Key
ASGNP4
line 2997
;2997:	s_credits.menu.fullscreen = qtrue;
ADDRGP4 s_credits+1052
CNSTI4 1
ASGNI4
line 2998
;2998:	s_credits.menu.number = num;
ADDRGP4 s_credits+1068
ADDRFP4 0
INDIRI4
ASGNI4
line 3000
;2999:
;3000:	Credits_Init( num );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Credits_Init
CALLV
pop
line 3002
;3001:
;3002:	uis.hideCursor = qtrue;
ADDRGP4 uis+16
CNSTI4 1
ASGNI4
line 3004
;3003:
;3004:	UI_PushMenu ( &s_credits.menu );
ADDRGP4 s_credits
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 3005
;3005:}
LABELV $1220
endproc UI_CreditMenu 0 12
bss
align 4
LABELV s_credits
skip 148696
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
LABELV $1218
byte 1 78
byte 1 117
byte 1 109
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1214
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1207
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 61
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1190
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 32
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 47
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 10
byte 1 0
align 1
LABELV $1185
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1039
byte 1 50
byte 1 110
byte 1 100
byte 1 32
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 100
byte 1 105
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1014
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 120
byte 1 37
byte 1 105
byte 1 41
byte 1 44
byte 1 32
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $1005
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 103
byte 1 97
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 40
byte 1 33
byte 1 33
byte 1 33
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1001
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $997
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 115
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $993
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 50
byte 1 32
byte 1 115
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $989
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $986
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $923
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 97
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 105
byte 1 120
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 40
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 44
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $192
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $191
byte 1 34
byte 1 73
byte 1 110
byte 1 99
byte 1 111
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 34
byte 1 0
align 1
LABELV $190
byte 1 68
byte 1 111
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $189
byte 1 79
byte 1 114
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 46
byte 1 0
align 1
LABELV $188
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $187
byte 1 82
byte 1 117
byte 1 98
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 117
byte 1 99
byte 1 107
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 112
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $186
byte 1 34
byte 1 76
byte 1 65
byte 1 82
byte 1 84
byte 1 58
byte 1 32
byte 1 76
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 105
byte 1 116
byte 1 117
byte 1 100
byte 1 101
byte 1 32
byte 1 82
byte 1 101
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 111
byte 1 108
byte 1 46
byte 1 0
align 1
LABELV $185
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 115
byte 1 117
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 99
byte 1 111
byte 1 100
byte 1 101
byte 1 114
byte 1 34
byte 1 0
align 1
LABELV $184
byte 1 34
byte 1 72
byte 1 111
byte 1 119
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 98
byte 1 101
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 99
byte 1 117
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $183
byte 1 111
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $182
byte 1 34
byte 1 78
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $181
byte 1 65
byte 1 110
byte 1 100
byte 1 32
byte 1 110
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 114
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 112
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $180
byte 1 34
byte 1 78
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 97
byte 1 116
byte 1 32
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 115
byte 1 110
byte 1 111
byte 1 119
byte 1 34
byte 1 0
align 1
LABELV $179
byte 1 34
byte 1 78
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 116
byte 1 117
byte 1 98
byte 1 98
byte 1 111
byte 1 114
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 101
byte 1 103
byte 1 97
byte 1 99
byte 1 121
byte 1 32
byte 1 115
byte 1 121
byte 1 115
byte 1 116
byte 1 101
byte 1 109
byte 1 34
byte 1 0
align 1
LABELV $178
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 113
byte 1 117
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 34
byte 1 0
align 1
LABELV $177
byte 1 34
byte 1 68
byte 1 111
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 105
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 97
byte 1 109
byte 1 109
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $176
byte 1 83
byte 1 101
byte 1 110
byte 1 105
byte 1 111
byte 1 114
byte 1 32
byte 1 68
byte 1 101
byte 1 118
byte 1 32
byte 1 65
byte 1 100
byte 1 118
byte 1 105
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $175
byte 1 116
byte 1 104
byte 1 101
byte 1 121
byte 1 32
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 32
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $174
byte 1 97
byte 1 32
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 39
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $173
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 115
byte 1 111
byte 1 109
byte 1 101
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $172
byte 1 80
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 97
byte 1 109
byte 1 109
byte 1 101
byte 1 114
byte 1 39
byte 1 115
byte 1 32
byte 1 80
byte 1 104
byte 1 105
byte 1 108
byte 1 111
byte 1 115
byte 1 111
byte 1 112
byte 1 104
byte 1 121
byte 1 0
align 1
LABELV $171
byte 1 109
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 44
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 100
byte 1 101
byte 1 34
byte 1 0
align 1
LABELV $170
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 119
byte 1 101
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 101
byte 1 108
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 44
byte 1 0
align 1
LABELV $169
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 85
byte 1 110
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $168
byte 1 67
byte 1 111
byte 1 100
byte 1 101
byte 1 114
byte 1 39
byte 1 115
byte 1 32
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $167
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 103
byte 1 111
byte 1 116
byte 1 116
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 34
byte 1 0
align 1
LABELV $166
byte 1 34
byte 1 65
byte 1 110
byte 1 100
byte 1 32
byte 1 115
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $165
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 109
byte 1 105
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 110
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $164
byte 1 34
byte 1 84
byte 1 114
byte 1 117
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 66
byte 1 101
byte 1 97
byte 1 117
byte 1 116
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $162
byte 1 83
byte 1 121
byte 1 115
byte 1 116
byte 1 101
byte 1 109
byte 1 46
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 108
byte 1 110
byte 1 40
byte 1 39
byte 1 77
byte 1 121
byte 1 32
byte 1 103
byte 1 111
byte 1 100
byte 1 44
byte 1 32
byte 1 105
byte 1 116
byte 1 39
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 115
byte 1 33
byte 1 39
byte 1 41
byte 1 0
align 1
LABELV $161
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 32
byte 1 66
byte 1 101
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 85
byte 1 115
byte 1 0
align 1
LABELV $160
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 116
byte 1 105
byte 1 112
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 117
byte 1 115
byte 1 58
byte 1 32
byte 1 67
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 98
byte 1 102
byte 1 117
byte 1 115
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $159
byte 1 73
byte 1 32
byte 1 68
byte 1 111
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 85
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 77
byte 1 121
byte 1 32
byte 1 79
byte 1 119
byte 1 110
byte 1 32
byte 1 67
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $158
byte 1 84
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 66
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 82
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 76
byte 1 105
byte 1 110
byte 1 116
byte 1 63
byte 1 0
align 1
LABELV $157
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $156
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 44
byte 1 32
byte 1 76
byte 1 117
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $155
byte 1 55
byte 1 48
byte 1 39
byte 1 115
byte 1 32
byte 1 82
byte 1 101
byte 1 116
byte 1 114
byte 1 111
byte 1 32
byte 1 67
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 99
byte 1 107
byte 1 115
byte 1 33
byte 1 0
align 1
LABELV $154
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 40
byte 1 39
byte 1 69
byte 1 84
byte 1 65
byte 1 79
byte 1 73
byte 1 78
byte 1 32
byte 1 83
byte 1 72
byte 1 82
byte 1 68
byte 1 76
byte 1 85
byte 1 39
byte 1 41
byte 1 0
align 1
LABELV $153
byte 1 75
byte 1 101
byte 1 121
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 44
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 67
byte 1 116
byte 1 114
byte 1 108
byte 1 43
byte 1 65
byte 1 108
byte 1 116
byte 1 43
byte 1 68
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $152
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 67
byte 1 80
byte 1 85
byte 1 32
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $151
byte 1 79
byte 1 111
byte 1 112
byte 1 115
byte 1 33
byte 1 32
byte 1 66
byte 1 117
byte 1 103
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $150
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 66
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 68
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 33
byte 1 0
align 1
LABELV $149
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 83
byte 1 121
byte 1 115
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $148
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 40
byte 1 39
byte 1 84
byte 1 104
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 105
byte 1 114
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 71
byte 1 111
byte 1 33
byte 1 39
byte 1 41
byte 1 0
align 1
LABELV $147
byte 1 85
byte 1 110
byte 1 105
byte 1 116
byte 1 32
byte 1 84
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 65
byte 1 69
byte 1 45
byte 1 51
byte 1 53
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $146
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 0
align 1
LABELV $145
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 82
byte 1 117
byte 1 108
byte 1 101
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 109
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $144
byte 1 82
byte 1 101
byte 1 103
byte 1 110
byte 1 97
byte 1 103
byte 1 108
byte 1 101
byte 1 112
byte 1 112
byte 1 111
byte 1 100
byte 1 58
byte 1 32
byte 1 85
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $143
byte 1 116
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 58
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 109
byte 1 121
byte 1 33
byte 1 0
align 1
LABELV $142
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 40
byte 1 39
byte 1 80
byte 1 116
byte 1 104
byte 1 98
byte 1 98
byte 1 98
byte 1 116
byte 1 116
byte 1 116
byte 1 104
byte 1 104
byte 1 104
byte 1 33
byte 1 39
byte 1 41
byte 1 0
align 1
LABELV $141
byte 1 84
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 70
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $140
byte 1 39
byte 1 84
byte 1 105
byte 1 115
byte 1 32
byte 1 66
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 83
byte 1 101
byte 1 103
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $139
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $138
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 120
byte 1 32
byte 1 77
byte 1 97
byte 1 103
byte 1 105
byte 1 99
byte 1 105
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $137
byte 1 65
byte 1 108
byte 1 103
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 104
byte 1 109
byte 1 32
byte 1 79
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $136
byte 1 67
byte 1 116
byte 1 114
byte 1 108
byte 1 43
byte 1 67
byte 1 47
byte 1 67
byte 1 116
byte 1 114
byte 1 108
byte 1 43
byte 1 86
byte 1 32
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $135
byte 1 67
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 101
byte 1 32
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 65
byte 1 100
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $134
byte 1 75
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 108
byte 1 32
byte 1 80
byte 1 97
byte 1 110
byte 1 105
byte 1 99
byte 1 32
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $133
byte 1 67
byte 1 108
byte 1 111
byte 1 117
byte 1 100
byte 1 32
byte 1 65
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $132
byte 1 82
byte 1 101
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 69
byte 1 120
byte 1 112
byte 1 101
byte 1 114
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $131
byte 1 57
byte 1 53
byte 1 37
byte 1 32
byte 1 68
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 40
byte 1 65
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 41
byte 1 0
align 1
LABELV $130
byte 1 66
byte 1 105
byte 1 110
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 84
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 78
byte 1 97
byte 1 118
byte 1 105
byte 1 103
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $129
byte 1 66
byte 1 105
byte 1 116
byte 1 119
byte 1 105
byte 1 115
byte 1 101
byte 1 32
byte 1 79
byte 1 112
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $128
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 78
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 104
byte 1 117
byte 1 115
byte 1 105
byte 1 97
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $127
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 105
byte 1 100
byte 1 101
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $126
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 67
byte 1 114
byte 1 117
byte 1 115
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $125
byte 1 82
byte 1 101
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $124
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 83
byte 1 101
byte 1 109
byte 1 105
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $123
byte 1 72
byte 1 97
byte 1 112
byte 1 112
byte 1 121
byte 1 32
byte 1 68
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 103
byte 1 105
byte 1 110
byte 1 103
byte 1 33
byte 1 0
align 1
LABELV $122
byte 1 85
byte 1 110
byte 1 105
byte 1 116
byte 1 32
byte 1 84
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 87
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 72
byte 1 97
byte 1 99
byte 1 107
byte 1 97
byte 1 116
byte 1 104
byte 1 111
byte 1 110
byte 1 32
byte 1 67
byte 1 104
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $120
byte 1 83
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 99
byte 1 117
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $119
byte 1 86
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 32
byte 1 72
byte 1 101
byte 1 114
byte 1 111
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $118
byte 1 78
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 73
byte 1 110
byte 1 102
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 32
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $116
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 32
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $115
byte 1 65
byte 1 103
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 82
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $114
byte 1 66
byte 1 117
byte 1 103
byte 1 32
byte 1 83
byte 1 113
byte 1 117
byte 1 97
byte 1 115
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 85
byte 1 110
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $113
byte 1 86
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 78
byte 1 105
byte 1 110
byte 1 106
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $112
byte 1 72
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 32
byte 1 87
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 32
byte 1 67
byte 1 111
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $111
byte 1 52
byte 1 48
byte 1 52
byte 1 58
byte 1 32
byte 1 67
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $110
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $108
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
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 101
byte 1 99
byte 1 114
byte 1 101
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $107
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
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 119
byte 1 121
byte 1 101
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $105
byte 1 116
byte 1 101
byte 1 97
byte 1 112
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $104
byte 1 86
byte 1 111
byte 1 118
byte 1 97
byte 1 110
byte 1 95
byte 1 86
byte 1 109
byte 1 0
align 1
LABELV $103
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 78
byte 1 111
byte 1 105
byte 1 114
byte 1 101
byte 1 46
byte 1 100
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $101
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 83
byte 1 97
byte 1 110
byte 1 100
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $99
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 47
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $97
byte 1 70
byte 1 108
byte 1 105
byte 1 112
byte 1 45
byte 1 90
byte 1 0
align 1
LABELV $96
byte 1 70
byte 1 108
byte 1 105
byte 1 112
byte 1 45
byte 1 89
byte 1 0
align 1
LABELV $95
byte 1 70
byte 1 108
byte 1 105
byte 1 112
byte 1 45
byte 1 88
byte 1 0
align 1
LABELV $94
byte 1 66
byte 1 111
byte 1 98
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $93
byte 1 74
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $92
byte 1 74
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $91
byte 1 82
byte 1 117
byte 1 115
byte 1 104
byte 1 90
byte 1 0
align 1
LABELV $90
byte 1 82
byte 1 117
byte 1 115
byte 1 104
byte 1 89
byte 1 0
align 1
LABELV $89
byte 1 82
byte 1 117
byte 1 115
byte 1 104
byte 1 88
byte 1 0
align 1
LABELV $88
byte 1 82
byte 1 105
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 45
byte 1 50
byte 1 0
align 1
LABELV $87
byte 1 82
byte 1 105
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $86
byte 1 80
byte 1 117
byte 1 108
byte 1 115
byte 1 101
byte 1 88
byte 1 89
byte 1 0
align 1
LABELV $85
byte 1 80
byte 1 117
byte 1 108
byte 1 115
byte 1 101
byte 1 88
byte 1 89
byte 1 90
byte 1 0
align 1
LABELV $84
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
