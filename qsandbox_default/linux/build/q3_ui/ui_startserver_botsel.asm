data
align 4
LABELV transparent_color
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1060320051
code
proc UI_BotSelect_SortCompare 44 8
file "../../../code/q3_ui/ui_startserver_botsel.c"
line 122
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
;15:
;16:/*
;17:=============================================================================
;18:
;19:BOT SELECT MENU *****
;20:
;21:=============================================================================
;22:*/
;23:
;24:
;25:#define BOTSELECT_BACK0			"menu/art/back_0"
;26:#define BOTSELECT_BACK1			"menu/art/back_1"
;27:#define BOTSELECT_ACCEPT0		"menu/art/accept_0"
;28:#define BOTSELECT_ACCEPT1		"menu/art/accept_1"
;29:#define BOTSELECT_SELECT		"menu/art/opponents_select"
;30:#define BOTSELECT_SELECTED		"menu/art/opponents_selected"
;31:#define BOTSELECT_SMALLSELECTED		"menu/uie_art/opponents_smallselected"
;32:#define BOTSELECT_ARROWS		"menu/art/gs_arrows_0"
;33:#define BOTSELECT_ARROWSL		"menu/art/gs_arrows_l"
;34:#define BOTSELECT_ARROWSR		"menu/art/gs_arrows_r"
;35:
;36:
;37:#define ID_BOTSELECT_VIEWLIST 	1
;38:#define ID_BOTSELECT_LEFT 		2
;39:#define ID_BOTSELECT_RIGHT      3
;40:#define ID_BOTSELECT_BACK	    4
;41:#define ID_BOTSELECT_ACCEPT     5
;42:#define ID_BOTSELECT_MULTISEL	6
;43:
;44:
;45:#define BOTNAME_LENGTH 16
;46:
;47:#define BOTGRID_COLS			4
;48:#define BOTGRID_ROWS			4
;49:#define MAX_GRIDMODELSPERPAGE		(BOTGRID_ROWS * BOTGRID_COLS)
;50:
;51:#define BOTLIST_COLS			3
;52:#define BOTLIST_ROWS			12
;53:#define MAX_LISTMODELSPERPAGE	(BOTLIST_COLS * BOTLIST_ROWS)
;54:
;55:#define BOTLIST_ICONSIZE	28
;56:
;57:#define MAX_MULTISELECTED   15
;58:
;59:
;60:#if (MAX_LISTMODELSPERPAGE > MAX_GRIDMODELSPERPAGE)
;61:	#define MAX_MODELSPERPAGE MAX_LISTMODELSPERPAGE
;62:#else
;63:	#define MAX_MODELSPERPAGE MAX_GRIDMODELSPERPAGE
;64:#endif
;65:
;66:
;67:// holdover viewing method
;68://static qboolean botselRevisit = qfalse;
;69://static qboolean lastVisitViewList = qfalse;
;70://static qboolean useMultiSel = qfalse;
;71:
;72:static vec4_t transparent_color = { 1.0, 1.0, 1.0, 0.7 };
;73:
;74:
;75:typedef struct {
;76:	menuframework_s	menu;
;77:
;78:	menutext_s		banner;
;79:
;80:	menubitmap_s	picbuttons[MAX_GRIDMODELSPERPAGE];
;81:
;82:	menubitmap_s	arrows;
;83:	menubitmap_s	left;
;84:	menubitmap_s	right;
;85:
;86:	menubitmap_s	go;
;87:	menubitmap_s	back;
;88:
;89:	menulist_s		botlist; 	// only ever contains a screen full of information
;90:	menuradiobutton_s	viewlist;
;91:	menuradiobutton_s	multisel;
;92:
;93:	int 			maxBotsPerPage;
;94:
;95:	int 			index;
;96:	int				numBots;
;97:	int				page;
;98:	int				numpages;
;99:
;100:	// most recently selected bot
;101:	int				selectedbot;
;102:
;103:	int				sortedBotNums[MAX_BOTS];
;104:	char			boticons[MAX_MODELSPERPAGE][MAX_QPATH];
;105:	char			botnames[MAX_MODELSPERPAGE][BOTNAME_LENGTH];
;106:
;107:	int				numMultiSel;
;108:	int				multiSel[MAX_MULTISELECTED];
;109:
;110:	float*			botcolor[MAX_MODELSPERPAGE];
;111:	const char*		botalias[MAX_MODELSPERPAGE];
;112:} botSelectInfo_t;
;113:
;114:static botSelectInfo_t	botSelectInfo;
;115:
;116:
;117:/*
;118:=================
;119:UI_BotSelect_SortCompare
;120:=================
;121:*/
;122:static int QDECL UI_BotSelect_SortCompare( const void *arg1, const void *arg2 ) {
line 127
;123:	int			num1, num2;
;124:	const char	*info1, *info2;
;125:	const char	*name1, *name2;
;126:
;127:	num1 = *(int *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 128
;128:	num2 = *(int *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 130
;129:
;130:	info1 = UI_GetBotInfoByNumber( num1 );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 131
;131:	info2 = UI_GetBotInfoByNumber( num2 );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 133
;132:
;133:	name1 = Info_ValueForKey( info1, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $96
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 134
;134:	name2 = Info_ValueForKey( info2, "name" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $96
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 136
;135:
;136:	return Q_stricmp( name1, name2 );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $95
endproc UI_BotSelect_SortCompare 44 8
proc UI_BotSelect_SelectedOnPage 4 0
line 147
;137:}
;138:
;139:
;140:
;141:/*
;142:=================
;143:UI_BotSelect_SelectedOnPage
;144:=================
;145:*/
;146:static qboolean UI_BotSelect_SelectedOnPage(void)
;147:{
line 150
;148:	int page;
;149:
;150:	if (botSelectInfo.selectedbot == -1)
ADDRGP4 botSelectInfo+3960
INDIRI4
CNSTI4 -1
NEI4 $98
line 151
;151:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $97
JUMPV
LABELV $98
line 153
;152:
;153:	page = botSelectInfo.page * botSelectInfo.maxBotsPerPage;
ADDRLP4 0
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MULI4
ASGNI4
line 154
;154:	if (botSelectInfo.selectedbot < page)
ADDRGP4 botSelectInfo+3960
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $103
line 155
;155:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $97
JUMPV
LABELV $103
line 157
;156:
;157:	if (botSelectInfo.selectedbot >= page + botSelectInfo.maxBotsPerPage)
ADDRGP4 botSelectInfo+3960
INDIRI4
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
ADDI4
LTI4 $106
line 158
;158:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $97
JUMPV
LABELV $106
line 160
;159:
;160:	return qtrue;
CNSTI4 1
RETI4
LABELV $97
endproc UI_BotSelect_SelectedOnPage 4 0
proc UI_BotSelect_SetBotInfoInCaller 40 8
line 171
;161:}
;162:
;163:
;164:
;165:/*
;166:=================
;167:UI_BotSelect_SetBotInfoInCaller
;168:=================
;169:*/
;170:static void UI_BotSelect_SetBotInfoInCaller(void)
;171:{
line 178
;172:	char* info;
;173:	char* name;
;174:	int index;
;175:	int sel;
;176:	int type;
;177:
;178:	if (botSelectInfo.multisel.curvalue)
ADDRGP4 botSelectInfo+3844+88
INDIRI4
CNSTI4 0
EQI4 $111
line 179
;179:	{
line 180
;180:		index = botSelectInfo.index;
ADDRLP4 4
ADDRGP4 botSelectInfo+3944
INDIRI4
ASGNI4
line 181
;181:		type = StartServer_SlotTeam(index);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 StartServer_SlotTeam
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 182
;182:		if (type == SLOTTEAM_INVALID)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $116
line 183
;183:			return;
ADDRGP4 $110
JUMPV
LABELV $116
line 185
;184:
;185:		for (sel = 0; sel < botSelectInfo.numMultiSel; sel++, index++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $121
JUMPV
LABELV $118
line 186
;186:		{
line 187
;187:			if (StartServer_SlotTeam(index) != type)
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 StartServer_SlotTeam
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $123
line 188
;188:				break;
ADDRGP4 $112
JUMPV
LABELV $123
line 190
;189:
;190:			info = UI_GetBotInfoByNumber(botSelectInfo.sortedBotNums[ botSelectInfo.multiSel[sel] ]);
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 botSelectInfo+15040
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 botSelectInfo+3964
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 191
;191:			name = Info_ValueForKey(info, "name");
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $96
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
ASGNP4
line 193
;192:
;193:			if (sel == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $127
line 194
;194:				StartServer_SetNamedBot(index, name);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 StartServer_SetNamedBot
CALLV
pop
ADDRGP4 $128
JUMPV
LABELV $127
line 196
;195:			else
;196:				StartServer_InsertNamedBot(index, name);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 StartServer_InsertNamedBot
CALLV
pop
LABELV $128
line 197
;197:		}
LABELV $119
line 185
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
LABELV $121
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+15036
INDIRI4
LTI4 $118
line 198
;198:	}
ADDRGP4 $112
JUMPV
LABELV $111
line 199
;199:	else {
line 200
;200:		if (botSelectInfo.selectedbot == -1)
ADDRGP4 botSelectInfo+3960
INDIRI4
CNSTI4 -1
NEI4 $129
line 201
;201:			return;
ADDRGP4 $110
JUMPV
LABELV $129
line 203
;202:			
;203:		info = UI_GetBotInfoByNumber(botSelectInfo.sortedBotNums[ botSelectInfo.selectedbot ]);
ADDRGP4 botSelectInfo+3960
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+3964
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 204
;204:		name = Info_ValueForKey(info, "name");
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $96
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 206
;205:
;206:		StartServer_SetNamedBot(botSelectInfo.index, name);
ADDRGP4 botSelectInfo+3944
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 StartServer_SetNamedBot
CALLV
pop
line 207
;207:	}
LABELV $112
line 208
;208:}
LABELV $110
endproc UI_BotSelect_SetBotInfoInCaller 40 8
proc UI_BotSelect_AddBotSelection 16 0
line 218
;209:
;210:
;211:
;212:/*
;213:=================
;214:UI_BotSelect_SelectBot
;215:=================
;216:*/
;217:static void UI_BotSelect_AddBotSelection(int bot)
;218:{
line 222
;219:	int i, j;
;220:
;221:	// single selection only
;222:	if (!botSelectInfo.multisel.curvalue) {
ADDRGP4 botSelectInfo+3844+88
INDIRI4
CNSTI4 0
NEI4 $136
line 223
;223:		if (botSelectInfo.selectedbot == bot)
ADDRGP4 botSelectInfo+3960
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $140
line 225
;224:			// toggle current selection
;225:			botSelectInfo.selectedbot = -1;
ADDRGP4 botSelectInfo+3960
CNSTI4 -1
ASGNI4
ADDRGP4 $135
JUMPV
LABELV $140
line 227
;226:		else
;227:			botSelectInfo.selectedbot = bot;
ADDRGP4 botSelectInfo+3960
ADDRFP4 0
INDIRI4
ASGNI4
line 228
;228:		return;
ADDRGP4 $135
JUMPV
LABELV $136
line 232
;229:	}
;230:
;231:	// check for presence in list already, and remove if found
;232:	for (i = 0; i < botSelectInfo.numMultiSel; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $145
line 233
;233:		if (botSelectInfo.multiSel[i] == bot) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+15040
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $150
line 234
;234:			for (j = i; j < botSelectInfo.numMultiSel - 1; j++)
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $156
JUMPV
LABELV $153
line 235
;235:				botSelectInfo.multiSel[j] = botSelectInfo.multiSel[j + 1];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 botSelectInfo+15040
ADDP4
ADDRLP4 8
INDIRI4
ADDRGP4 botSelectInfo+15040+4
ADDP4
INDIRI4
ASGNI4
LABELV $154
line 234
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $156
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+15036
INDIRI4
CNSTI4 1
SUBI4
LTI4 $153
line 237
;236:
;237:			botSelectInfo.numMultiSel--;
ADDRLP4 12
ADDRGP4 botSelectInfo+15036
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 238
;238:			return;
ADDRGP4 $135
JUMPV
LABELV $150
line 240
;239:		}
;240:	}
LABELV $146
line 232
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $148
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+15036
INDIRI4
LTI4 $145
line 243
;241:
;242:	// add to list, if enough space
;243:	if (botSelectInfo.numMultiSel == MAX_MULTISELECTED)
ADDRGP4 botSelectInfo+15036
INDIRI4
CNSTI4 15
NEI4 $162
line 244
;244:		return;
ADDRGP4 $135
JUMPV
LABELV $162
line 246
;245:
;246:	botSelectInfo.multiSel[ botSelectInfo.numMultiSel ] = bot;
ADDRGP4 botSelectInfo+15036
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+15040
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 247
;247:	botSelectInfo.numMultiSel++;
ADDRLP4 8
ADDRGP4 botSelectInfo+15036
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 248
;248:	botSelectInfo.selectedbot = bot;
ADDRGP4 botSelectInfo+3960
ADDRFP4 0
INDIRI4
ASGNI4
line 249
;249:}
LABELV $135
endproc UI_BotSelect_AddBotSelection 16 0
proc UI_BotSelect_ToggleMultiSelect 0 8
line 260
;250:
;251:
;252:
;253:
;254:/*
;255:=================
;256:UI_BotSelect_ToggleMultiSelect
;257:=================
;258:*/
;259:static void UI_BotSelect_ToggleMultiSelect( void )
;260:{
line 261
;261:	trap_Cvar_SetValue("uie_bot_multisel", botSelectInfo.multisel.curvalue);
ADDRGP4 $170
ARGP4
ADDRGP4 botSelectInfo+3844+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 263
;262:
;263:	if (!botSelectInfo.multisel.curvalue) {
ADDRGP4 botSelectInfo+3844+88
INDIRI4
CNSTI4 0
NEI4 $173
line 265
;264:		// change to single sel
;265:		if (botSelectInfo.numMultiSel)
ADDRGP4 botSelectInfo+15036
INDIRI4
CNSTI4 0
EQI4 $177
line 266
;266:			botSelectInfo.selectedbot = botSelectInfo.multiSel[0];
ADDRGP4 botSelectInfo+3960
ADDRGP4 botSelectInfo+15040
INDIRI4
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $177
line 268
;267:		else
;268:			botSelectInfo.selectedbot = -1;	
ADDRGP4 botSelectInfo+3960
CNSTI4 -1
ASGNI4
line 269
;269:		return;
ADDRGP4 $169
JUMPV
LABELV $173
line 273
;270:	}
;271:
;272:	// change to multiple sel
;273:	if (botSelectInfo.selectedbot == -1) {
ADDRGP4 botSelectInfo+3960
INDIRI4
CNSTI4 -1
NEI4 $183
line 274
;274:		botSelectInfo.numMultiSel = 0;
ADDRGP4 botSelectInfo+15036
CNSTI4 0
ASGNI4
line 275
;275:		return;
ADDRGP4 $169
JUMPV
LABELV $183
line 278
;276:	}
;277:
;278:	if (botSelectInfo.numMultiSel == 0) {
ADDRGP4 botSelectInfo+15036
INDIRI4
CNSTI4 0
NEI4 $187
line 279
;279:		UI_BotSelect_AddBotSelection(botSelectInfo.selectedbot);
ADDRGP4 botSelectInfo+3960
INDIRI4
ARGI4
ADDRGP4 UI_BotSelect_AddBotSelection
CALLV
pop
line 280
;280:		return;
ADDRGP4 $169
JUMPV
LABELV $187
line 283
;281:	}
;282:
;283:	if (botSelectInfo.selectedbot != botSelectInfo.multiSel[0])
ADDRGP4 botSelectInfo+3960
INDIRI4
ADDRGP4 botSelectInfo+15040
INDIRI4
EQI4 $191
line 284
;284:	{
line 285
;285:		botSelectInfo.multiSel[0] = botSelectInfo.selectedbot;
ADDRGP4 botSelectInfo+15040
ADDRGP4 botSelectInfo+3960
INDIRI4
ASGNI4
line 286
;286:		botSelectInfo.numMultiSel = 1;
ADDRGP4 botSelectInfo+15036
CNSTI4 1
ASGNI4
line 287
;287:	}
LABELV $191
line 288
;288:}
LABELV $169
endproc UI_BotSelect_ToggleMultiSelect 0 8
proc UI_BotSelect_SetViewType 4 8
line 298
;289:
;290:
;291:
;292:/*
;293:=================
;294:UI_BotSelect_SetViewType
;295:=================
;296:*/
;297:static void UI_BotSelect_SetViewType( void )
;298:{
line 299
;299:	if (botSelectInfo.viewlist.curvalue) {
ADDRGP4 botSelectInfo+3748+88
INDIRI4
CNSTI4 0
EQI4 $199
line 300
;300:		botSelectInfo.maxBotsPerPage = MAX_LISTMODELSPERPAGE;
ADDRGP4 botSelectInfo+3940
CNSTI4 36
ASGNI4
line 301
;301:	}
ADDRGP4 $200
JUMPV
LABELV $199
line 302
;302:	else {
line 303
;303:		botSelectInfo.maxBotsPerPage = MAX_GRIDMODELSPERPAGE;
ADDRGP4 botSelectInfo+3940
CNSTI4 16
ASGNI4
line 304
;304:	}
LABELV $200
line 306
;305:
;306:	botSelectInfo.numpages = botSelectInfo.numBots / botSelectInfo.maxBotsPerPage;
ADDRGP4 botSelectInfo+3956
ADDRGP4 botSelectInfo+3948
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
DIVI4
ASGNI4
line 307
;307:	if( botSelectInfo.numBots % botSelectInfo.maxBotsPerPage) {
ADDRGP4 botSelectInfo+3948
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MODI4
CNSTI4 0
EQI4 $208
line 308
;308:		botSelectInfo.numpages++;
ADDRLP4 0
ADDRGP4 botSelectInfo+3956
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 309
;309:	}
LABELV $208
line 311
;310:
;311:	trap_Cvar_SetValue("uie_bot_list", botSelectInfo.viewlist.curvalue);
ADDRGP4 $213
ARGP4
ADDRGP4 botSelectInfo+3748+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 312
;312:}
LABELV $198
endproc UI_BotSelect_SetViewType 4 8
proc UI_BotSelect_BuildList 12 16
line 321
;313:
;314:
;315:
;316:/*
;317:=================
;318:UI_BotSelect_BuildList
;319:=================
;320:*/
;321:static void UI_BotSelect_BuildList( void ) {
line 324
;322:	int		n;
;323:
;324:	botSelectInfo.numBots = UI_GetNumBots();
ADDRLP4 4
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 botSelectInfo+3948
ADDRLP4 4
INDIRI4
ASGNI4
line 327
;325:
;326:	// initialize the array
;327:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $218
line 328
;328:		botSelectInfo.sortedBotNums[n] = n;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+3964
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 329
;329:	}
LABELV $219
line 327
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $221
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+3948
INDIRI4
LTI4 $218
line 332
;330:
;331:	// now sort it
;332:	qsort( botSelectInfo.sortedBotNums, botSelectInfo.numBots, sizeof(botSelectInfo.sortedBotNums[0]), UI_BotSelect_SortCompare );
ADDRGP4 botSelectInfo+3964
ARGP4
ADDRGP4 botSelectInfo+3948
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_BotSelect_SortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 333
;333:}
LABELV $216
endproc UI_BotSelect_BuildList 12 16
export UI_ServerPlayerIcon
proc UI_ServerPlayerIcon 80 20
line 342
;334:
;335:
;336:
;337:/*
;338:=================
;339:UI_ServerPlayerIcon
;340:=================
;341:*/
;342:void UI_ServerPlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 346
;343:	char	*skin;
;344:	char	model[MAX_QPATH];
;345:
;346:	Q_strncpyz( model, modelAndSkin, sizeof(model));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 347
;347:	skin = strrchr( model, '/' );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 68
ADDRGP4 strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 348
;348:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $228
line 349
;349:		*skin++ = '\0';
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI1 0
ASGNI1
line 350
;350:	}
ADDRGP4 $229
JUMPV
LABELV $228
line 351
;351:	else {
line 352
;352:		skin = "default";
ADDRLP4 0
ADDRGP4 $230
ASGNP4
line 353
;353:	}
LABELV $229
line 355
;354:
;355:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $231
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 357
;356:
;357:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $232
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $230
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $232
line 358
;358:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $234
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 359
;359:	}
LABELV $232
line 360
;360:}
LABELV $227
endproc UI_ServerPlayerIcon 80 20
export UI_ServerNpcIcon
proc UI_ServerNpcIcon 80 20
line 368
;361:
;362:
;363:/*
;364:=================
;365:UI_ServerPlayerIcon
;366:=================
;367:*/
;368:void UI_ServerNpcIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 372
;369:	char	*skin;
;370:	char	model[MAX_QPATH];
;371:
;372:	Q_strncpyz( model, modelAndSkin, sizeof(model));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 373
;373:	skin = strrchr( model, '/' );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 68
ADDRGP4 strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 374
;374:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $236
line 375
;375:		*skin++ = '\0';
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI1 0
ASGNI1
line 376
;376:	}
ADDRGP4 $237
JUMPV
LABELV $236
line 377
;377:	else {
line 378
;378:		skin = "default";
ADDRLP4 0
ADDRGP4 $230
ASGNP4
line 379
;379:	}
LABELV $237
line 381
;380:
;381:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $231
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 383
;382:
;383:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $238
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $230
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $238
line 384
;384:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $234
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 385
;385:	}
LABELV $238
line 386
;386:}
LABELV $235
endproc UI_ServerNpcIcon 80 20
proc UI_BotSelect_UpdateGridInterface 28 0
line 395
;387:
;388:
;389:/*
;390:=================
;391:UI_BotSelect_UpdateGridInterface
;392:=================
;393:*/
;394:static void UI_BotSelect_UpdateGridInterface( void )
;395:{
line 402
;396:	int 		i;
;397:	int 		j;
;398:	int			page;
;399:	int 		sel;
;400:
;401:	// clear out old values
;402:	j = botSelectInfo.page * botSelectInfo.maxBotsPerPage;
ADDRLP4 8
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MULI4
ASGNI4
line 403
;403:	for( i = 0; i < MAX_GRIDMODELSPERPAGE; i++, j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $243
line 404
;404:		botSelectInfo.picbuttons[i].generic.flags &= ~QMF_HIDDEN;
ADDRLP4 16
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -4097
CVIU4 4
BANDU4
ASGNU4
line 406
;405:
;406:		if( j < botSelectInfo.numBots ) {
ADDRLP4 8
INDIRI4
ADDRGP4 botSelectInfo+3948
INDIRI4
GEI4 $249
line 407
;407:			botSelectInfo.picbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 20
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 408
;408:			botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 24
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 409
;409:		}
ADDRGP4 $250
JUMPV
LABELV $249
line 411
;410:		else
;411:		{
line 413
;412:			// dead control
;413:			botSelectInfo.picbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 20
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 414
;414:		}
LABELV $250
line 416
;415:
;416:		botSelectInfo.picbuttons[i].generic.flags       &= ~QMF_HIGHLIGHT;
ADDRLP4 20
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -65
CVIU4 4
BANDU4
ASGNU4
line 417
;417:	}
LABELV $244
line 403
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $243
line 420
;418:
;419:	// set selected model(s), if visible
;420:	if (botSelectInfo.multisel.curvalue)
ADDRGP4 botSelectInfo+3844+88
INDIRI4
CNSTI4 0
EQI4 $260
line 421
;421:	{
line 422
;422:		for (i = 0; i < botSelectInfo.numMultiSel; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $267
JUMPV
LABELV $264
line 423
;423:		{
line 424
;424:			sel = botSelectInfo.multiSel[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+15040
ADDP4
INDIRI4
ASGNI4
line 425
;425:			page = sel / botSelectInfo.maxBotsPerPage;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
DIVI4
ASGNI4
line 426
;426:			if (botSelectInfo.page != page)
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $271
line 427
;427:				continue;
ADDRGP4 $265
JUMPV
LABELV $271
line 429
;428:
;429:			sel %= botSelectInfo.maxBotsPerPage;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MODI4
ASGNI4
line 430
;430:			botSelectInfo.picbuttons[sel].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 20
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 431
;431:			botSelectInfo.picbuttons[sel].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 24
CNSTI4 116
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTI4 -257
CVIU4 4
BANDU4
ASGNU4
line 432
;432:		}
LABELV $265
line 422
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $267
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+15036
INDIRI4
LTI4 $264
line 433
;433:	}
ADDRGP4 $261
JUMPV
LABELV $260
line 434
;434:	else {
line 435
;435:		if (botSelectInfo.selectedbot == -1)
ADDRGP4 botSelectInfo+3960
INDIRI4
CNSTI4 -1
NEI4 $279
line 436
;436:			return;
ADDRGP4 $240
JUMPV
LABELV $279
line 438
;437:
;438:		page = botSelectInfo.selectedbot / botSelectInfo.maxBotsPerPage;
ADDRLP4 12
ADDRGP4 botSelectInfo+3960
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
DIVI4
ASGNI4
line 439
;439:		if (botSelectInfo.page == page)
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $284
line 440
;440:		{
line 441
;441:			i = botSelectInfo.selectedbot % botSelectInfo.maxBotsPerPage;
ADDRLP4 0
ADDRGP4 botSelectInfo+3960
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MODI4
ASGNI4
line 442
;442:			botSelectInfo.picbuttons[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 20
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 443
;443:			botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 24
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTI4 -257
CVIU4 4
BANDU4
ASGNU4
line 444
;444:		}
LABELV $284
line 445
;445:	}
LABELV $261
line 446
;446:}
LABELV $240
endproc UI_BotSelect_UpdateGridInterface 28 0
proc UI_BotSelect_CheckAcceptButton 8 0
line 457
;447:
;448:
;449:
;450:
;451:/*
;452:=================
;453:UI_BotSelect_CheckAcceptButton
;454:=================
;455:*/
;456:static void UI_BotSelect_CheckAcceptButton( void )
;457:{
line 460
;458:	qboolean enable;
;459:
;460:	enable = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 461
;461:	if (botSelectInfo.multisel.curvalue) {
ADDRGP4 botSelectInfo+3844+88
INDIRI4
CNSTI4 0
EQI4 $294
line 462
;462:		if (botSelectInfo.numMultiSel > 0)
ADDRGP4 botSelectInfo+15036
INDIRI4
CNSTI4 0
LEI4 $295
line 463
;463:			enable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 464
;464:	}
ADDRGP4 $295
JUMPV
LABELV $294
line 465
;465:	else {
line 466
;466:		if (botSelectInfo.selectedbot != -1)
ADDRGP4 botSelectInfo+3960
INDIRI4
CNSTI4 -1
EQI4 $301
line 467
;467:			enable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $301
line 468
;468:	}
LABELV $295
line 470
;469:
;470:	if (enable) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $304
line 471
;471:		botSelectInfo.go.generic.flags &= ~(QMF_INACTIVE|QMF_GRAYED);
ADDRLP4 4
ADDRGP4 botSelectInfo+3384+72
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
line 472
;472:	}
ADDRGP4 $305
JUMPV
LABELV $304
line 473
;473:	else {
line 474
;474:		botSelectInfo.go.generic.flags |= (QMF_INACTIVE|QMF_GRAYED);
ADDRLP4 4
ADDRGP4 botSelectInfo+3384+72
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
line 475
;475:	}
LABELV $305
line 476
;476:}
LABELV $293
endproc UI_BotSelect_CheckAcceptButton 8 0
proc UI_BotSelect_UpdateView 32 12
line 489
;477:
;478:
;479:
;480:/*
;481:=================
;482:UI_BotSelect_UpdateView
;483:
;484:The display acts as a "window" on the list of all bots, and
;485:only ever contains one screens worth of information
;486:=================
;487:*/
;488:static void UI_BotSelect_UpdateView( void )
;489:{
line 495
;490:	const char	*info;
;491:	int			i;
;492:	int			j;
;493:	int			pageBotCount;
;494:
;495:	j = botSelectInfo.page * botSelectInfo.maxBotsPerPage;
ADDRLP4 4
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MULI4
ASGNI4
line 496
;496:	for( i = 0; i < botSelectInfo.maxBotsPerPage; i++, j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $316
JUMPV
LABELV $313
line 497
;497:		if( j < botSelectInfo.numBots ) {
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+3948
INDIRI4
GEI4 $318
line 498
;498:			info = UI_GetBotInfoByNumber( botSelectInfo.sortedBotNums[j] );
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+3964
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 499
;499:			UI_ServerPlayerIcon( Info_ValueForKey( info, "model" ), botSelectInfo.boticons[i], MAX_QPATH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $322
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+12156
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 UI_ServerPlayerIcon
CALLV
pop
line 500
;500:			Q_strncpyz( botSelectInfo.botnames[i], Info_ValueForKey( info, "name" ), BOTNAME_LENGTH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $96
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+14460
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 501
;501:			Q_CleanStr( botSelectInfo.botnames[i] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+14460
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 503
;502:
;503:			if( botSelectInfo.index != -1 && StartServer_BotOnSelectionList( botSelectInfo.botnames[i] ) ) {
ADDRGP4 botSelectInfo+3944
INDIRI4
CNSTI4 -1
EQI4 $326
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+14460
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 StartServer_BotOnSelectionList
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $326
line 504
;504:				botSelectInfo.botcolor[i] = color_red;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+15100
ADDP4
ADDRGP4 color_red
ASGNP4
line 505
;505:			}
ADDRGP4 $319
JUMPV
LABELV $326
line 506
;506:			else {
line 507
;507:				botSelectInfo.botcolor[i] = color_orange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+15100
ADDP4
ADDRGP4 color_orange
ASGNP4
line 508
;508:			}
line 509
;509:		}
ADDRGP4 $319
JUMPV
LABELV $318
line 510
;510:		else {
line 512
;511:			// dead slot
;512:			botSelectInfo.botnames[i][0] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+14460
ADDP4
CNSTI1 0
ASGNI1
line 513
;513:		}
LABELV $319
line 514
;514:	}
LABELV $314
line 496
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
LABELV $316
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
LTI4 $313
line 517
;515:
;516:	// update display details based on the view type
;517:	pageBotCount = botSelectInfo.numBots - botSelectInfo.page * botSelectInfo.maxBotsPerPage;;
ADDRLP4 12
ADDRGP4 botSelectInfo+3948
INDIRI4
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MULI4
SUBI4
ASGNI4
line 518
;518:	if (pageBotCount > botSelectInfo.maxBotsPerPage)
ADDRLP4 12
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
LEI4 $336
line 519
;519:		pageBotCount = botSelectInfo.maxBotsPerPage;
ADDRLP4 12
ADDRGP4 botSelectInfo+3940
INDIRI4
ASGNI4
LABELV $336
line 521
;520:
;521:	if (!botSelectInfo.viewlist.curvalue) {
ADDRGP4 botSelectInfo+3748+88
INDIRI4
CNSTI4 0
NEI4 $340
line 523
;522:		// grid display
;523:		UI_BotSelect_UpdateGridInterface();
ADDRGP4 UI_BotSelect_UpdateGridInterface
CALLV
pop
line 524
;524:    	botSelectInfo.botlist.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 20
ADDRGP4 botSelectInfo+3616+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 525
;525:	}
ADDRGP4 $341
JUMPV
LABELV $340
line 526
;526:	else {
line 529
;527:		// list display
;528:
;529:		for (i = 0; i < MAX_GRIDMODELSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $346
line 530
;530:		{
line 531
;531:			botSelectInfo.picbuttons[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 20
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 532
;532:		}
LABELV $347
line 529
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $346
line 534
;533:
;534:		botSelectInfo.botlist.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 20
ADDRGP4 botSelectInfo+3616+72
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
line 535
;535:		if (UI_BotSelect_SelectedOnPage())
ADDRLP4 24
ADDRGP4 UI_BotSelect_SelectedOnPage
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $354
line 536
;536:			botSelectInfo.botlist.curvalue = botSelectInfo.selectedbot % botSelectInfo.maxBotsPerPage;
ADDRGP4 botSelectInfo+3616+92
ADDRGP4 botSelectInfo+3960
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MODI4
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $354
line 538
;537:		else
;538:			botSelectInfo.botlist.curvalue = -1;
ADDRGP4 botSelectInfo+3616+92
CNSTI4 -1
ASGNI4
LABELV $355
line 539
;539:		botSelectInfo.botlist.numitems = pageBotCount;
ADDRGP4 botSelectInfo+3616+96
ADDRLP4 12
INDIRI4
ASGNI4
line 540
;540:	}
LABELV $341
line 543
;541:
;542:	// left/right controls
;543:	if( botSelectInfo.numpages > 1 ) {
ADDRGP4 botSelectInfo+3956
INDIRI4
CNSTI4 1
LEI4 $364
line 544
;544:		if( botSelectInfo.page > 0 ) {
ADDRGP4 botSelectInfo+3952
INDIRI4
CNSTI4 0
LEI4 $367
line 545
;545:			botSelectInfo.left.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+3152+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 546
;546:		}
ADDRGP4 $368
JUMPV
LABELV $367
line 547
;547:		else {
line 548
;548:			botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+3152+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 549
;549:		}
LABELV $368
line 551
;550:
;551:		if( botSelectInfo.page < (botSelectInfo.numpages - 1) ) {
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRGP4 botSelectInfo+3956
INDIRI4
CNSTI4 1
SUBI4
GEI4 $374
line 552
;552:			botSelectInfo.right.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+3268+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 553
;553:		}
ADDRGP4 $365
JUMPV
LABELV $374
line 554
;554:		else {
line 555
;555:			botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+3268+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 556
;556:		}
line 557
;557:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 558
;558:	else {
line 560
;559:		// hide left/right markers
;560:		botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 botSelectInfo+3152+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 561
;561:		botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+3268+72
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 562
;562:	}
LABELV $365
line 563
;563:}
LABELV $310
endproc UI_BotSelect_UpdateView 32 12
proc UI_BotSelect_SetPageFromSelected 0 0
line 574
;564:
;565:
;566:
;567:
;568:/*
;569:=================
;570:UI_BotSelect_SetPageFromSelected
;571:=================
;572:*/
;573:static void UI_BotSelect_SetPageFromSelected( void )
;574:{
line 575
;575:	if (botSelectInfo.selectedbot == -1 ) {
ADDRGP4 botSelectInfo+3960
INDIRI4
CNSTI4 -1
NEI4 $387
line 576
;576:		botSelectInfo.page = 0;
ADDRGP4 botSelectInfo+3952
CNSTI4 0
ASGNI4
line 577
;577:		return;
ADDRGP4 $386
JUMPV
LABELV $387
line 579
;578:	}
;579:	botSelectInfo.page = botSelectInfo.selectedbot / botSelectInfo.maxBotsPerPage;
ADDRGP4 botSelectInfo+3952
ADDRGP4 botSelectInfo+3960
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
DIVI4
ASGNI4
line 580
;580:}
LABELV $386
endproc UI_BotSelect_SetPageFromSelected 0 0
proc UI_BotSelect_Default 28 8
line 589
;581:
;582:
;583:
;584:/*
;585:=================
;586:UI_BotSelect_Default
;587:=================
;588:*/
;589:static void UI_BotSelect_Default( char *bot ) {
line 595
;590:	const char	*botInfo;
;591:	const char	*test;
;592:	int			n;
;593:	int			i;
;594:
;595:	botSelectInfo.selectedbot = -1;
ADDRGP4 botSelectInfo+3960
CNSTI4 -1
ASGNI4
line 596
;596:	botSelectInfo.page = 0;
ADDRGP4 botSelectInfo+3952
CNSTI4 0
ASGNI4
line 597
;597:	botSelectInfo.numMultiSel = 0;
ADDRGP4 botSelectInfo+15036
CNSTI4 0
ASGNI4
line 599
;598:
;599:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $401
JUMPV
LABELV $398
line 600
;600:		botInfo = UI_GetBotInfoByNumber( n );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 601
;601:		test = Info_ValueForKey( botInfo, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $96
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 602
;602:		if( Q_stricmp( bot, test ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $403
line 603
;603:			break;
ADDRGP4 $400
JUMPV
LABELV $403
line 605
;604:		}
;605:	}
LABELV $399
line 599
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $401
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+3948
INDIRI4
LTI4 $398
LABELV $400
line 608
;606:
;607:	// bot name not in list
;608:	if( n == botSelectInfo.numBots ) {
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+3948
INDIRI4
NEI4 $405
line 609
;609:		return;
ADDRGP4 $394
JUMPV
LABELV $405
line 613
;610:	}
;611:
;612:	// find in sorted list
;613:	for( i = 0; i < botSelectInfo.numBots; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $411
JUMPV
LABELV $408
line 614
;614:		if( botSelectInfo.sortedBotNums[i] == n ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+3964
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $413
line 615
;615:			break;
ADDRGP4 $410
JUMPV
LABELV $413
line 617
;616:		}
;617:	}
LABELV $409
line 613
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $411
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+3948
INDIRI4
LTI4 $408
LABELV $410
line 620
;618:
;619:	// not in sorted list
;620:	if( i == botSelectInfo.numBots ) {
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+3948
INDIRI4
NEI4 $416
line 621
;621:		return;
ADDRGP4 $394
JUMPV
LABELV $416
line 625
;622:	}
;623:
;624:	// found it!
;625:	UI_BotSelect_AddBotSelection(i);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_BotSelect_AddBotSelection
CALLV
pop
line 626
;626:	UI_BotSelect_SetPageFromSelected();
ADDRGP4 UI_BotSelect_SetPageFromSelected
CALLV
pop
line 627
;627:}
LABELV $394
endproc UI_BotSelect_Default 28 8
proc UI_BotSelect_BotEvent 4 4
line 638
;628:
;629:
;630:
;631:
;632:
;633:/*
;634:=================
;635:UI_BotSelect_BotEvent
;636:=================
;637:*/
;638:static void UI_BotSelect_BotEvent( void* ptr, int event ) {
line 641
;639:	int		i;
;640:
;641:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $420
line 642
;642:		return;
ADDRGP4 $419
JUMPV
LABELV $420
line 645
;643:	}
;644:
;645:	i = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 646
;646:	i += botSelectInfo.page * botSelectInfo.maxBotsPerPage;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MULI4
ADDI4
ASGNI4
line 648
;647:
;648:	UI_BotSelect_AddBotSelection(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_BotSelect_AddBotSelection
CALLV
pop
line 649
;649:	UI_BotSelect_CheckAcceptButton();
ADDRGP4 UI_BotSelect_CheckAcceptButton
CALLV
pop
line 650
;650:	UI_BotSelect_UpdateGridInterface();
ADDRGP4 UI_BotSelect_UpdateGridInterface
CALLV
pop
line 651
;651:}
LABELV $419
endproc UI_BotSelect_BotEvent 4 4
proc UI_BotSelect_Event 12 0
line 663
;652:
;653:
;654:
;655:
;656:
;657:/*
;658:=================
;659:UI_BotSelect_Event
;660:=================
;661:*/
;662:static void UI_BotSelect_Event( void* ptr, int event )
;663:{
line 664
;664:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $425
line 665
;665:		return;
ADDRGP4 $424
JUMPV
LABELV $425
line 668
;666:	}
;667:
;668:	switch (((menucommon_s*)ptr)->id) {
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
LTI4 $427
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $427
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $448-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $448
address $430
address $432
address $437
address $447
address $443
address $431
code
LABELV $430
line 670
;669:	case ID_BOTSELECT_VIEWLIST:
;670:		UI_BotSelect_SetViewType();
ADDRGP4 UI_BotSelect_SetViewType
CALLV
pop
line 671
;671:		UI_BotSelect_SetPageFromSelected();
ADDRGP4 UI_BotSelect_SetPageFromSelected
CALLV
pop
line 672
;672:		UI_BotSelect_UpdateView();
ADDRGP4 UI_BotSelect_UpdateView
CALLV
pop
line 673
;673:		break;
ADDRGP4 $428
JUMPV
LABELV $431
line 676
;674:
;675:	case ID_BOTSELECT_MULTISEL:
;676:		UI_BotSelect_ToggleMultiSelect();
ADDRGP4 UI_BotSelect_ToggleMultiSelect
CALLV
pop
line 677
;677:		UI_BotSelect_UpdateView();
ADDRGP4 UI_BotSelect_UpdateView
CALLV
pop
line 678
;678:		break;
ADDRGP4 $428
JUMPV
LABELV $432
line 681
;679:
;680:	case ID_BOTSELECT_LEFT:
;681:		if( botSelectInfo.page > 0 ) {
ADDRGP4 botSelectInfo+3952
INDIRI4
CNSTI4 0
LEI4 $428
line 682
;682:			botSelectInfo.page--;
ADDRLP4 8
ADDRGP4 botSelectInfo+3952
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 683
;683:			UI_BotSelect_UpdateView();
ADDRGP4 UI_BotSelect_UpdateView
CALLV
pop
line 684
;684:		}
line 685
;685:		break;
ADDRGP4 $428
JUMPV
LABELV $437
line 688
;686:
;687:	case ID_BOTSELECT_RIGHT:
;688:		if( botSelectInfo.page < botSelectInfo.numpages - 1 ) {
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRGP4 botSelectInfo+3956
INDIRI4
CNSTI4 1
SUBI4
GEI4 $428
line 689
;689:			botSelectInfo.page++;
ADDRLP4 8
ADDRGP4 botSelectInfo+3952
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 690
;690:			UI_BotSelect_UpdateView();
ADDRGP4 UI_BotSelect_UpdateView
CALLV
pop
line 691
;691:		}
line 692
;692:		break;
ADDRGP4 $428
JUMPV
LABELV $443
line 695
;693:
;694:	case ID_BOTSELECT_ACCEPT:
;695:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 697
;696:
;697:		if (botSelectInfo.index != -1)
ADDRGP4 botSelectInfo+3944
INDIRI4
CNSTI4 -1
EQI4 $428
line 698
;698:			UI_BotSelect_SetBotInfoInCaller();
ADDRGP4 UI_BotSelect_SetBotInfoInCaller
CALLV
pop
line 699
;699:		break;
ADDRGP4 $428
JUMPV
LABELV $447
line 702
;700:
;701:	case ID_BOTSELECT_BACK:
;702:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 703
;703:		break;
LABELV $427
LABELV $428
line 705
;704:	}
;705:}
LABELV $424
endproc UI_BotSelect_Event 12 0
export UI_BotSelect_Cache
proc UI_BotSelect_Cache 0 4
line 714
;706:
;707:
;708:
;709:/*
;710:=================
;711:UI_BotSelect_Cache
;712:=================
;713:*/
;714:void UI_BotSelect_Cache( void ) {
line 715
;715:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK0 );
ADDRGP4 $451
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 716
;716:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK1 );
ADDRGP4 $452
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 717
;717:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT0 );
ADDRGP4 $453
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 718
;718:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT1 );
ADDRGP4 $454
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 719
;719:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECT );
ADDRGP4 $455
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 720
;720:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECTED );
ADDRGP4 $456
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 721
;721:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWS );
ADDRGP4 $457
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 722
;722:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSL );
ADDRGP4 $458
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 723
;723:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSR );
ADDRGP4 $459
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 724
;724:	trap_R_RegisterShaderNoMip( BOTSELECT_SMALLSELECTED);
ADDRGP4 $460
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 725
;725:}
LABELV $450
endproc UI_BotSelect_Cache 0 4
proc UI_BotSelect_ScrollList_LineSize 12 8
line 737
;726:
;727:
;728:
;729:
;730:
;731:/*
;732:=================
;733:UI_BotSelect_ScrollList_LineSize
;734:=================
;735:*/
;736:static void UI_BotSelect_ScrollList_LineSize( int* charheight, int* charwidth, int* lineheight )
;737:{
line 740
;738:	float	scale;
;739:
;740:	scale = UI_ProportionalSizeScale(UI_SMALLFONT, 0);
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 4
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 742
;741:
;742:	*charwidth = scale * UI_ProportionalStringWidth("X");
ADDRGP4 $462
ARGP4
ADDRLP4 8
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 743
;743:	*charheight = scale * PROP_HEIGHT;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRF4
ADDRGP4 cl_propheight+12
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 745
;744:
;745:	if (*charheight > BOTLIST_ICONSIZE)
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 28
LEI4 $464
line 746
;746:		*lineheight = *charheight + 2;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
ADDRGP4 $465
JUMPV
LABELV $464
line 748
;747:	else
;748:		*lineheight = BOTLIST_ICONSIZE + 2;
ADDRFP4 8
INDIRP4
CNSTI4 30
ASGNI4
LABELV $465
line 749
;749:}
LABELV $461
endproc UI_BotSelect_ScrollList_LineSize 12 8
proc UI_BotSelect_HandleListKey 92 16
line 762
;750:
;751:
;752:
;753:/*
;754:=================
;755:UI_BotSelect_HandleListKey
;756:
;757:Returns true if the list box accepts that key input
;758:Implements the list box input, but with larger proportional fonts 
;759:=================
;760:*/
;761:static qboolean UI_BotSelect_HandleListKey( int key, sfxHandle_t* psfx)
;762:{
line 776
;763:	menulist_s* l;
;764:	int	x;
;765:	int	y;
;766:	int	w;
;767:	int	cursorx;
;768:	int	cursory;
;769:	int	column;
;770:	int	index;
;771:	int charwidth;
;772:	int charheight;
;773:	int lineheight;
;774:	int	sel;
;775:
;776:	UI_BotSelect_ScrollList_LineSize( &charheight, &charwidth, &lineheight );
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 UI_BotSelect_ScrollList_LineSize
CALLV
pop
line 778
;777:
;778:	l = &botSelectInfo.botlist;
ADDRLP4 0
ADDRGP4 botSelectInfo+3616
ASGNP4
line 780
;779:
;780:	switch (key) {
ADDRLP4 48
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 52
CNSTI4 27
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $487
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRI4
LTI4 $468
LABELV $488
ADDRFP4 0
INDIRI4
CNSTI4 178
EQI4 $470
ADDRGP4 $468
JUMPV
LABELV $470
line 782
;781:	case K_MOUSE1:
;782:		if (l->generic.flags & QMF_HASMOUSEFOCUS)
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 512
BANDU4
CNSTU4 0
EQU4 $471
line 783
;783:		{
line 785
;784:			// check scroll region
;785:			x = l->generic.x;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 786
;786:			y = l->generic.y;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 787
;787:			w = ( (l->width + l->seperation) * l->columns - l->seperation) * charwidth;
ADDRLP4 56
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 56
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
ADDI4
ADDRLP4 56
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
MULI4
ADDRLP4 60
INDIRI4
SUBI4
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
line 788
;788:			if( l->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $473
line 789
;789:				x -= w / 2;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 790
;790:			}
LABELV $473
line 791
;791:			if (UI_CursorInRect( x, y, w, l->height*lineheight ))
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ARGI4
ADDRLP4 64
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $475
line 792
;792:			{
line 793
;793:				cursorx = (uis.cursorx - x)/charwidth;
ADDRLP4 32
ADDRGP4 uis+8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 794
;794:				column = cursorx / (l->width + l->seperation);
ADDRLP4 68
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 32
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ADDI4
DIVI4
ASGNI4
line 795
;795:				cursory = (uis.cursory - y)/lineheight;
ADDRLP4 36
ADDRGP4 uis+12
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ADDRLP4 8
INDIRI4
DIVI4
ASGNI4
line 796
;796:				index = column * l->height + cursory;
ADDRLP4 28
ADDRLP4 40
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
MULI4
ADDRLP4 36
INDIRI4
ADDI4
ASGNI4
line 797
;797:				if (l->top + index < l->numitems)
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ADDRLP4 72
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
GEI4 $476
line 798
;798:				{
line 799
;799:					l->oldvalue = l->curvalue;
ADDRLP4 76
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 800
;800:					l->curvalue = l->top + index;
ADDRLP4 80
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
line 802
;801:
;802:					if (l->oldvalue != l->curvalue)
ADDRLP4 84
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 84
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
EQI4 $481
line 803
;803:					{
line 804
;804:						if (l->generic.callback) {
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $483
line 805
;805:							l->generic.callback( l, QM_GOTFOCUS );
ADDRLP4 88
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 76
ADDP4
INDIRP4
CALLV
pop
line 806
;806:						}
LABELV $483
line 807
;807:					}
LABELV $481
line 808
;808:					sel = botSelectInfo.page * botSelectInfo.maxBotsPerPage;
ADDRLP4 44
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MULI4
ASGNI4
line 809
;809:					sel += l->curvalue;
ADDRLP4 44
ADDRLP4 44
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDI4
ASGNI4
line 810
;810:					UI_BotSelect_AddBotSelection(sel);
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 UI_BotSelect_AddBotSelection
CALLV
pop
line 811
;811:					UI_BotSelect_CheckAcceptButton();
ADDRGP4 UI_BotSelect_CheckAcceptButton
CALLV
pop
line 812
;812:					*psfx = (menu_move_sound);
ADDRFP4 4
INDIRP4
ADDRGP4 menu_move_sound
INDIRI4
ASGNI4
line 813
;813:				}
line 814
;814:			}
ADDRGP4 $476
JUMPV
LABELV $475
line 815
;815:			else {
line 817
;816:				// absorbed, silent sound effect
;817:				*psfx = (menu_null_sound);
ADDRFP4 4
INDIRP4
ADDRGP4 menu_null_sound
INDIRI4
ASGNI4
line 818
;818:			}
LABELV $476
line 819
;819:		}
LABELV $471
line 820
;820:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $466
JUMPV
LABELV $487
line 824
;821:
;822:	// keys that have the default action	
;823:	case K_ESCAPE:
;824:		*psfx = Menu_DefaultKey( &botSelectInfo.menu, key );
ADDRGP4 botSelectInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ASGNI4
line 825
;825:		return qtrue;	
CNSTI4 1
RETI4
ADDRGP4 $466
JUMPV
LABELV $468
line 827
;826:	}
;827:	return qfalse;
CNSTI4 0
RETI4
LABELV $466
endproc UI_BotSelect_HandleListKey 92 16
proc UI_BotSelect_Key 16 8
line 837
;828:}
;829:
;830:
;831:/*
;832:=================
;833:UI_BotSelect_Key
;834:=================
;835:*/
;836:static sfxHandle_t UI_BotSelect_Key( int key )
;837:{
line 841
;838:	menulist_s	*l;
;839:	sfxHandle_t sfx;
;840:
;841:	l = (menulist_s	*)Menu_ItemAtCursor( &botSelectInfo.menu );
ADDRGP4 botSelectInfo
ARGP4
ADDRLP4 8
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 843
;842:
;843:	sfx = menu_null_sound;
ADDRLP4 0
ADDRGP4 menu_null_sound
INDIRI4
ASGNI4
line 844
;844:	if( l == &botSelectInfo.botlist) {
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 botSelectInfo+3616
CVPU4 4
NEU4 $490
line 845
;845:		if (!UI_BotSelect_HandleListKey(key, &sfx))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 UI_BotSelect_HandleListKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $491
line 846
;846:			return menu_buzz_sound;
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $489
JUMPV
line 847
;847:	}
LABELV $490
line 848
;848:	else {
line 849
;849:		sfx = Menu_DefaultKey( &botSelectInfo.menu, key );
ADDRGP4 botSelectInfo
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
line 850
;850:	}
LABELV $491
line 852
;851:
;852:	return sfx;
ADDRLP4 0
INDIRI4
RETI4
LABELV $489
endproc UI_BotSelect_Key 16 8
proc UI_BotSelect_ScrollList_Init 48 12
line 864
;853:}
;854:
;855:
;856:
;857:
;858:/*
;859:=================
;860:UI_BotSelect_ScrollList_Init
;861:=================
;862:*/
;863:static void UI_BotSelect_ScrollList_Init( menulist_s *l )
;864:{
line 870
;865:	int		w;
;866:	int 	charwidth;
;867:	int 	charheight;
;868:	int 	lineheight;
;869:
;870:	l->oldvalue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 871
;871:	l->curvalue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 872
;872:	l->top      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
CNSTI4 0
ASGNI4
line 874
;873:
;874:	UI_BotSelect_ScrollList_LineSize(&charheight, &charwidth, &lineheight);
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 UI_BotSelect_ScrollList_LineSize
CALLV
pop
line 876
;875:
;876:	if( !l->columns ) {
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 0
NEI4 $496
line 877
;877:		l->columns = 1;
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
CNSTI4 1
ASGNI4
line 878
;878:		l->seperation = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTI4 0
ASGNI4
line 879
;879:	}
ADDRGP4 $497
JUMPV
LABELV $496
line 880
;880:	else if( !l->seperation ) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 0
NEI4 $498
line 881
;881:		l->seperation = 3;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTI4 3
ASGNI4
line 882
;882:	}
LABELV $498
LABELV $497
line 884
;883:
;884:	w = ( (l->width + l->seperation) * l->columns - l->seperation) * charwidth;
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
line 886
;885:
;886:	l->generic.left   =	l->generic.x;
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
line 887
;887:	l->generic.top    = l->generic.y;
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
line 888
;888:	l->generic.right  =	l->generic.x + w;
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
line 889
;889:	l->generic.bottom =	l->generic.y + l->height * lineheight;
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
line 891
;890:
;891:	if( l->generic.flags & QMF_CENTER_JUSTIFY ) {
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $500
line 892
;892:		l->generic.left -= w / 2;
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
line 893
;893:		l->generic.right -= w / 2;
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
line 894
;894:	}
LABELV $500
line 895
;895:}
LABELV $495
endproc UI_BotSelect_ScrollList_Init 48 12
proc UI_BotSelect_ScrollListDraw 88 20
line 905
;896:
;897:
;898:
;899:/*
;900:=================
;901:UI_BotSelect_ScrollList_Draw
;902:=================
;903:*/
;904:static void UI_BotSelect_ScrollListDraw( void* ptr )
;905:{
line 923
;906:	int			x;
;907:	int			y;
;908:	int			i, j;
;909:	int			base;
;910:	int			column;
;911:	float*		color;
;912:	qboolean	hasfocus;
;913:	int			style;
;914:	menulist_s *l;
;915:	float	scale;
;916:	int 	charwidth;
;917:	int 	charheight;
;918:	int 	lineheight;
;919:	int 	index;
;920:	int		bot;
;921:	qboolean selected;
;922:
;923:	UI_BotSelect_ScrollList_LineSize(&charheight, &charwidth, &lineheight);
ADDRLP4 48
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 UI_BotSelect_ScrollList_LineSize
CALLV
pop
line 925
;924:
;925:	l = (menulist_s*)ptr;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
line 926
;926:	hasfocus = (l->generic.parent->cursor == l->generic.menuPosition);
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $504
ADDRLP4 68
CNSTI4 1
ASGNI4
ADDRGP4 $505
JUMPV
LABELV $504
ADDRLP4 68
CNSTI4 0
ASGNI4
LABELV $505
ADDRLP4 56
ADDRLP4 68
INDIRI4
ASGNI4
line 928
;927:
;928:	x =	l->generic.x;
ADDRLP4 32
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 929
;929:	for( column = 0; column < l->columns; column++ ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 $509
JUMPV
LABELV $506
line 930
;930:		y =	l->generic.y;
ADDRLP4 24
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 931
;931:		base = l->top + column * l->height;
ADDRLP4 44
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
MULI4
ADDI4
ASGNI4
line 932
;932:		for( i = base; i < base + l->height; i++) {
ADDRLP4 4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRGP4 $513
JUMPV
LABELV $510
line 933
;933:			if (i >= l->numitems)
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
LTI4 $514
line 934
;934:				break;
ADDRGP4 $512
JUMPV
LABELV $514
line 936
;935:
;936:			style = UI_SMALLFONT;
ADDRLP4 36
CNSTI4 16
ASGNI4
line 937
;937:			color = botSelectInfo.botcolor[i];
ADDRLP4 40
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+15100
ADDP4
INDIRP4
ASGNP4
line 938
;938:			if (i == l->curvalue)
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
NEI4 $517
line 939
;939:			{
line 940
;940:				UI_FillRect(x,y + (lineheight - BOTLIST_ICONSIZE)/2,
ADDRLP4 32
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
CNSTI4 28
SUBI4
CNSTI4 2
DIVI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
MULI4
CVIF4 4
ARGF4
CNSTF4 1105199104
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 942
;941:					l->width*charwidth ,BOTLIST_ICONSIZE, listbar_color);
;942:				if (color != color_red)
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 color_red
CVPU4 4
EQU4 $519
line 943
;943:					color = text_color_highlight;
ADDRLP4 40
ADDRGP4 text_color_highlight
ASGNP4
LABELV $519
line 945
;944:
;945:				if (hasfocus)
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $521
line 946
;946:					style |= (UI_PULSE|UI_LEFT);
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
ADDRGP4 $518
JUMPV
LABELV $521
line 948
;947:				else
;948:					style |= UI_LEFT;
ADDRLP4 36
ADDRLP4 36
INDIRI4
ASGNI4
line 949
;949:			}
ADDRGP4 $518
JUMPV
LABELV $517
line 951
;950:			else
;951:			{
line 952
;952:				style |= UI_LEFT|UI_INVERSE;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 953
;953:			}
LABELV $518
line 955
;954:
;955:			index = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 956
;956:			selected = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 957
;957:			bot = i + botSelectInfo.page * botSelectInfo.maxBotsPerPage;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MULI4
ADDI4
ASGNI4
line 958
;958:			if (botSelectInfo.multisel.curvalue) {
ADDRGP4 botSelectInfo+3844+88
INDIRI4
CNSTI4 0
EQI4 $525
line 959
;959:				for (j = 0; j < botSelectInfo.numMultiSel; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $532
JUMPV
LABELV $529
line 960
;960:					if (botSelectInfo.multiSel[j] == bot) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+15040
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $534
line 961
;961:						index = j + 1;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 962
;962:						selected = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 963
;963:						break;
ADDRGP4 $526
JUMPV
LABELV $534
line 965
;964:					}
;965:				}
LABELV $530
line 959
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $532
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+15036
INDIRI4
LTI4 $529
line 966
;966:			}
ADDRGP4 $526
JUMPV
LABELV $525
line 967
;967:			else {
line 968
;968:				if (botSelectInfo.selectedbot == bot)
ADDRGP4 botSelectInfo+3960
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $537
line 969
;969:					selected = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $537
line 970
;970:			}
LABELV $526
line 972
;971:
;972:			trap_R_SetColor(transparent_color);
ADDRGP4 transparent_color
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 973
;973:			UI_DrawNamedPic(x, y + (lineheight - BOTLIST_ICONSIZE)/2,
ADDRLP4 32
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
CNSTI4 28
SUBI4
CNSTI4 2
DIVI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 80
CNSTF4 1105199104
ASGNF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+12156
ADDP4
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 975
;974:				BOTLIST_ICONSIZE, BOTLIST_ICONSIZE, botSelectInfo.boticons[i]);
;975:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 977
;976:
;977:			if (selected) {
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $541
line 978
;978:				trap_R_SetColor( colorRed );
ADDRGP4 colorRed
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 979
;979:				UI_DrawNamedPic(x, y + (lineheight - BOTLIST_ICONSIZE)/2,
ADDRLP4 32
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
CNSTI4 28
SUBI4
CNSTI4 2
DIVI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 84
CNSTF4 1105199104
ASGNF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRGP4 $460
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 981
;980:					BOTLIST_ICONSIZE , BOTLIST_ICONSIZE , BOTSELECT_SMALLSELECTED);
;981:				trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 982
;982:			}
LABELV $541
line 984
;983:
;984:			if (index != -1) {
ADDRLP4 16
INDIRI4
CNSTI4 -1
EQI4 $543
line 985
;985:				UI_DrawString( x + BOTLIST_ICONSIZE/2, y + (lineheight - BIGCHAR_HEIGHT)/2,
ADDRGP4 $546
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
ADDRGP4 cl_bigcharheight+12
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ADDI4
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
CNSTI4 2049
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 987
;986:					va("%i", index), UI_CENTER|UI_DROPSHADOW, color_white);
;987:			}
LABELV $543
line 989
;988:
;989:			UI_DrawProportionalString(
ADDRLP4 84
CNSTI4 2
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 28
ADDI4
ADDRLP4 84
INDIRI4
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 48
INDIRI4
SUBI4
ADDRLP4 84
INDIRI4
DIVI4
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 84
INDIRI4
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 996
;990:				x + BOTLIST_ICONSIZE + 2,
;991:				y + (lineheight - charheight)/2,
;992:				l->itemnames[i],
;993:				style,
;994:				color);
;995:
;996:			y += lineheight;
ADDRLP4 24
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
line 997
;997:		}
LABELV $511
line 932
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $513
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDI4
LTI4 $510
LABELV $512
line 998
;998:		x += (l->width + l->seperation) * charwidth;
ADDRLP4 32
ADDRLP4 32
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
ADDI4
ADDRLP4 52
INDIRI4
MULI4
ADDI4
ASGNI4
line 999
;999:	}
LABELV $507
line 929
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $509
ADDRLP4 60
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
LTI4 $506
line 1000
;1000:}
LABELV $502
endproc UI_BotSelect_ScrollListDraw 88 20
proc UI_BotSelect_BotGridDraw 104 20
line 1011
;1001:
;1002:
;1003:
;1004:
;1005:/*
;1006:=================
;1007:UI_BotSelect_BotGridDraw
;1008:=================
;1009:*/
;1010:static void UI_BotSelect_BotGridDraw( void* ptr )
;1011:{
line 1023
;1012:	float	x;
;1013:	float	y;
;1014:	float	w;
;1015:	float	h;
;1016:	vec4_t	tempcolor;
;1017:	float*	color;
;1018:	int 	index;
;1019:	menubitmap_s* b;
;1020:	int 	i;
;1021:	int 	bot;
;1022:
;1023:	b = (menubitmap_s*)ptr;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1028
;1024:
;1025:	//
;1026:	// draw bot icon
;1027:	//
;1028:	index = b->generic.id;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 1029
;1029:	x = b->generic.left;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1030
;1030:	y = b->generic.top;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1031
;1031:	w = b->generic.right - x;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 1032
;1032:	h = b->generic.bottom - y;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 1034
;1033:
;1034:	if (botSelectInfo.botnames[index][0]) {
ADDRLP4 28
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+14460
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $548
line 1035
;1035:		UI_DrawNamedPic(x, y, w, h, botSelectInfo.boticons[index]);
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 28
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+12156
ADDP4
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 1036
;1036:		if (b->generic.flags & QMF_HIGHLIGHT) {
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $552
line 1037
;1037:			trap_R_SetColor( color_red );
ADDRGP4 color_red
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1038
;1038:			UI_DrawNamedPic(x, y, w, h, BOTSELECT_SELECTED);
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 $456
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 1039
;1039:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1040
;1040:		}
LABELV $552
line 1041
;1041:	}
LABELV $548
line 1047
;1042:
;1043:	//
;1044:	// draw bot position in multi
;1045:	//
;1046:
;1047:	if (botSelectInfo.multisel.curvalue) {
ADDRGP4 botSelectInfo+3844+88
INDIRI4
CNSTI4 0
EQI4 $554
line 1048
;1048:		bot = index + botSelectInfo.page * botSelectInfo.maxBotsPerPage;
ADDRLP4 24
ADDRLP4 28
INDIRI4
ADDRGP4 botSelectInfo+3952
INDIRI4
ADDRGP4 botSelectInfo+3940
INDIRI4
MULI4
ADDI4
ASGNI4
line 1049
;1049:		for (i = 0; i < botSelectInfo.numMultiSel; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $563
JUMPV
LABELV $560
line 1050
;1050:			if (botSelectInfo.multiSel[i] != bot)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+15040
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $565
line 1051
;1051:				continue;
ADDRGP4 $561
JUMPV
LABELV $565
line 1053
;1052:
;1053:			UI_DrawString( x + w/2, y + (h - GIANTCHAR_HEIGHT)/2, va("%i", i + 1),
ADDRGP4 $546
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 56
CNSTF4 1073741824
ASGNF4
ADDRLP4 8
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 56
INDIRF4
DIVF4
ADDF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRF4
ADDRLP4 20
INDIRF4
ADDRGP4 cl_giantcharheight+12
INDIRI4
CVIF4 4
SUBF4
ADDRLP4 56
INDIRF4
DIVF4
ADDF4
CVFI4 4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 2113
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1055
;1054:				UI_CENTER|UI_GIANTFONT|UI_DROPSHADOW, color_white);
;1055:			break;
ADDRGP4 $562
JUMPV
LABELV $561
line 1049
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $563
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+15036
INDIRI4
LTI4 $560
LABELV $562
line 1057
;1056:		}
;1057:	}
LABELV $554
line 1063
;1058:
;1059:	//
;1060:	// draw bot name text
;1061:	//
;1062:
;1063:	if (botSelectInfo.botnames[index][0])
ADDRLP4 28
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+14460
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $569
line 1064
;1064:		UI_DrawString( x + 32, y + 64, botSelectInfo.botnames[index], UI_CENTER|UI_SMALLFONT, botSelectInfo.botcolor[index]);
ADDRLP4 8
INDIRF4
CNSTF4 1107296256
ADDF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRF4
CNSTF4 1115684864
ADDF4
CVFI4 4
ARGI4
ADDRLP4 28
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+14460
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+15100
ADDP4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $569
line 1071
;1065:
;1066:	//
;1067:	// draws pulse shader showing mouse over
;1068:	//
;1069:
;1070:	// no pulse shader required
;1071:	if (b->generic.flags & QMF_HIGHLIGHT)
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $574
line 1072
;1072:		return;
ADDRGP4 $547
JUMPV
LABELV $574
line 1074
;1073:
;1074:	x = b->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1075
;1075:	y = b->generic.y;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1076
;1076:	w = b->width;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1077
;1077:	h =	b->height;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1079
;1078:
;1079:	if (b->generic.flags & QMF_RIGHT_JUSTIFY)
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 16
BANDU4
CNSTU4 0
EQU4 $576
line 1080
;1080:	{
line 1081
;1081:		x = x - w;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
line 1082
;1082:	}
ADDRGP4 $577
JUMPV
LABELV $576
line 1083
;1083:	else if (b->generic.flags & QMF_CENTER_JUSTIFY)
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8
BANDU4
CNSTU4 0
EQU4 $578
line 1084
;1084:	{
line 1085
;1085:		x = x - w/2;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 16
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
ASGNF4
line 1086
;1086:	}
LABELV $578
LABELV $577
line 1089
;1087:
;1088:	// used to refresh shader
;1089:	if (b->generic.name && !b->shader)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $580
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
NEI4 $580
line 1090
;1090:	{
line 1091
;1091:		b->shader = trap_R_RegisterShaderNoMip( b->generic.name );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 1092
;1092:		if (!b->shader && b->errorpic)
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
NEI4 $582
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $582
line 1093
;1093:			b->shader = trap_R_RegisterShaderNoMip( b->errorpic );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
LABELV $582
line 1094
;1094:	}
LABELV $580
line 1096
;1095:
;1096:	if (b->focuspic && !b->focusshader)
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $584
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 0
NEI4 $584
line 1097
;1097:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
LABELV $584
line 1099
;1098:
;1099:	if (b->generic.flags & QMF_GRAYED)
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $586
line 1100
;1100:	{
line 1101
;1101:		if (b->shader)
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $587
line 1102
;1102:		{
line 1103
;1103:			trap_R_SetColor( colorMdGrey );
ADDRGP4 colorMdGrey
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1104
;1104:			UI_DrawHandlePic( x, y, w, h, b->shader );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1105
;1105:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1106
;1106:		}
line 1107
;1107:	}
ADDRGP4 $587
JUMPV
LABELV $586
line 1109
;1108:	else
;1109:	{
line 1110
;1110:		if (b->shader)
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $590
line 1111
;1111:			UI_DrawHandlePic( x, y, w, h, b->shader );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
LABELV $590
line 1113
;1112:
;1113:		if ((b->generic.flags & QMF_PULSE) || (b->generic.flags & QMF_PULSEIFFOCUS) && (Menu_ItemAtCursor( b->generic.parent ) == b))
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
ASGNU4
ADDRLP4 80
CNSTU4 0
ASGNU4
ADDRLP4 76
INDIRU4
CNSTU4 131072
BANDU4
ADDRLP4 80
INDIRU4
NEU4 $594
ADDRLP4 76
INDIRU4
CNSTU4 256
BANDU4
ADDRLP4 80
INDIRU4
EQU4 $592
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
NEU4 $592
LABELV $594
line 1114
;1114:		{
line 1115
;1115:			if (b->focuscolor)
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $595
line 1116
;1116:			{
line 1117
;1117:				tempcolor[0] = b->focuscolor[0];
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
INDIRF4
ASGNF4
line 1118
;1118:				tempcolor[1] = b->focuscolor[1];
ADDRLP4 36+4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1119
;1119:				tempcolor[2] = b->focuscolor[2];
ADDRLP4 36+8
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 1120
;1120:				color        = tempcolor;
ADDRLP4 32
ADDRLP4 36
ASGNP4
line 1121
;1121:			}
ADDRGP4 $596
JUMPV
LABELV $595
line 1123
;1122:			else
;1123:				color = pulse_color;
ADDRLP4 32
ADDRGP4 pulse_color
ASGNP4
LABELV $596
line 1124
;1124:			color[3] = 0.5+0.5*sin(uis.realtime/PULSE_DIVISOR);
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
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1056964608
ADDRLP4 88
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1126
;1125:
;1126:			trap_R_SetColor( color );
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1127
;1127:			UI_DrawHandlePic( x, y, w, h, b->focusshader );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
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
line 1128
;1128:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1129
;1129:		}
ADDRGP4 $593
JUMPV
LABELV $592
line 1130
;1130:		else if ((b->generic.flags & QMF_HIGHLIGHT) || ((b->generic.flags & QMF_HIGHLIGHT_IF_FOCUS) && (Menu_ItemAtCursor( b->generic.parent ) == b)))
ADDRLP4 92
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRU4
ASGNU4
ADDRLP4 96
CNSTU4 0
ASGNU4
ADDRLP4 92
INDIRU4
CNSTU4 64
BANDU4
ADDRLP4 96
INDIRU4
NEU4 $602
ADDRLP4 92
INDIRU4
CNSTU4 128
BANDU4
ADDRLP4 96
INDIRU4
EQU4 $600
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 100
INDIRP4
CVPU4 4
NEU4 $600
LABELV $602
line 1131
;1131:		{
line 1132
;1132:			if (b->focuscolor)
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $603
line 1133
;1133:			{
line 1134
;1134:				trap_R_SetColor( b->focuscolor );
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1135
;1135:				UI_DrawHandlePic( x, y, w, h, b->focusshader );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
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
line 1136
;1136:				trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1137
;1137:			}
ADDRGP4 $604
JUMPV
LABELV $603
line 1139
;1138:			else
;1139:				UI_DrawHandlePic( x, y, w, h, b->focusshader );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
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
LABELV $604
line 1140
;1140:		}
LABELV $600
LABELV $593
line 1141
;1141:	}
LABELV $587
line 1142
;1142:}
LABELV $547
endproc UI_BotSelect_BotGridDraw 104 20
proc UI_BotSelect_MenuDraw 0 4
line 1153
;1143:
;1144:
;1145:
;1146:
;1147:/*
;1148:=================
;1149:UI_BotSelect_MenuDraw
;1150:=================
;1151:*/
;1152:static void UI_BotSelect_MenuDraw(void)
;1153:{
line 1157
;1154://	UI_DrawString(0,0,va("%i",botSelectInfo.selectedbot), UI_SMALLFONT, color_white);
;1155:
;1156:	// draw the controls
;1157:	Menu_Draw(&botSelectInfo.menu);
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1158
;1158:}
LABELV $605
endproc UI_BotSelect_MenuDraw 0 4
proc UI_BotSelect_Init 48 12
line 1168
;1159:
;1160:
;1161:
;1162:
;1163:/*
;1164:=================
;1165:UI_BotSelect_Init
;1166:=================
;1167:*/
;1168:static void UI_BotSelect_Init( char *bot , int index) {
line 1172
;1169:	int		i, j, k;
;1170:	int		x, y;
;1171:
;1172:	memset( &botSelectInfo, 0 ,sizeof(botSelectInfo) );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 15388
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1173
;1173:	botSelectInfo.menu.key = UI_BotSelect_Key;
ADDRGP4 botSelectInfo+1040
ADDRGP4 UI_BotSelect_Key
ASGNP4
line 1174
;1174:	botSelectInfo.menu.wrapAround = qtrue;
ADDRGP4 botSelectInfo+1044
CNSTI4 1
ASGNI4
line 1175
;1175:	botSelectInfo.menu.native 	= qfalse;
ADDRGP4 botSelectInfo+1056
CNSTI4 0
ASGNI4
line 1176
;1176:	botSelectInfo.menu.fullscreen = qtrue;
ADDRGP4 botSelectInfo+1052
CNSTI4 1
ASGNI4
line 1177
;1177:	botSelectInfo.menu.draw = UI_BotSelect_MenuDraw;
ADDRGP4 botSelectInfo+1036
ADDRGP4 UI_BotSelect_MenuDraw
ASGNP4
line 1179
;1178:
;1179:	UI_BotSelect_Cache();
ADDRGP4 UI_BotSelect_Cache
CALLV
pop
line 1181
;1180:
;1181:	botSelectInfo.index = index;
ADDRGP4 botSelectInfo+3944
ADDRFP4 4
INDIRI4
ASGNI4
line 1182
;1182:	botSelectInfo.numMultiSel = 0;
ADDRGP4 botSelectInfo+15036
CNSTI4 0
ASGNI4
line 1184
;1183:
;1184:	botSelectInfo.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 botSelectInfo+1076
CNSTI4 10
ASGNI4
line 1185
;1185:	botSelectInfo.banner.generic.x		= 320;
ADDRGP4 botSelectInfo+1076+28
CNSTI4 320
ASGNI4
line 1186
;1186:	botSelectInfo.banner.generic.y		= 16;
ADDRGP4 botSelectInfo+1076+32
CNSTI4 16
ASGNI4
line 1187
;1187:	botSelectInfo.banner.color			= color_white;
ADDRGP4 botSelectInfo+1076+100
ADDRGP4 color_white
ASGNP4
line 1188
;1188:	botSelectInfo.banner.style			= UI_CENTER;
ADDRGP4 botSelectInfo+1076+92
CNSTI4 1
ASGNI4
line 1190
;1189:
;1190:	botSelectInfo.viewlist.generic.type = MTYPE_RADIOBUTTON;
ADDRGP4 botSelectInfo+3748
CNSTI4 5
ASGNI4
line 1191
;1191:	botSelectInfo.viewlist.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 botSelectInfo+3748+72
CNSTU4 258
ASGNU4
line 1192
;1192:	botSelectInfo.viewlist.generic.id = ID_BOTSELECT_VIEWLIST;
ADDRGP4 botSelectInfo+3748+24
CNSTI4 1
ASGNI4
line 1193
;1193:	botSelectInfo.viewlist.generic.callback = UI_BotSelect_Event;
ADDRGP4 botSelectInfo+3748+76
ADDRGP4 UI_BotSelect_Event
ASGNP4
line 1194
;1194:	botSelectInfo.viewlist.generic.x = 290 - 13* SMALLCHAR_WIDTH;
ADDRGP4 botSelectInfo+3748+28
CNSTI4 290
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ASGNI4
line 1195
;1195:	botSelectInfo.viewlist.generic.y = 480 - 2*LINE_HEIGHT;
ADDRGP4 botSelectInfo+3748+32
CNSTI4 480
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 4
ADDI4
SUBI4
ASGNI4
line 1197
;1196:
;1197:	botSelectInfo.multisel.generic.type = MTYPE_RADIOBUTTON;
ADDRGP4 botSelectInfo+3844
CNSTI4 5
ASGNI4
line 1198
;1198:	botSelectInfo.multisel.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 botSelectInfo+3844+72
CNSTU4 258
ASGNU4
line 1199
;1199:	botSelectInfo.multisel.generic.id = ID_BOTSELECT_MULTISEL;
ADDRGP4 botSelectInfo+3844+24
CNSTI4 6
ASGNI4
line 1200
;1200:	botSelectInfo.multisel.generic.callback = UI_BotSelect_Event;
ADDRGP4 botSelectInfo+3844+76
ADDRGP4 UI_BotSelect_Event
ASGNP4
line 1201
;1201:	botSelectInfo.multisel.generic.x = 290 - 13* SMALLCHAR_WIDTH;
ADDRGP4 botSelectInfo+3844+28
CNSTI4 290
CNSTI4 13
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ASGNI4
line 1202
;1202:	botSelectInfo.multisel.generic.y = 480 - 3*LINE_HEIGHT;
ADDRGP4 botSelectInfo+3844+32
CNSTI4 480
CNSTI4 3
ADDRGP4 cl_smallcharheight+12
INDIRI4
MULI4
CNSTI4 6
ADDI4
SUBI4
ASGNI4
line 1205
;1203:
;1204:	// init based on previous value
;1205:	botSelectInfo.viewlist.curvalue = (int)Com_Clamp(0, 1, trap_Cvar_VariableValue("uie_bot_list"));
ADDRGP4 $213
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 botSelectInfo+3748+88
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 1206
;1206:	botSelectInfo.multisel.curvalue = (int)Com_Clamp(0, 1, trap_Cvar_VariableValue("uie_bot_multisel"));
ADDRGP4 $170
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 botSelectInfo+3844+88
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1208
;1207:
;1208:	for (i = 0; i < MAX_MODELSPERPAGE; i++)
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $653
line 1209
;1209:		botSelectInfo.botalias[i] = botSelectInfo.botnames[i];
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+15244
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+14460
ADDP4
ASGNP4
LABELV $654
line 1208
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 36
LTI4 $653
line 1211
;1210:
;1211:	botSelectInfo.botlist.generic.type = MTYPE_SCROLLLIST;
ADDRGP4 botSelectInfo+3616
CNSTI4 8
ASGNI4
line 1212
;1212:	botSelectInfo.botlist.generic.flags = QMF_PULSEIFFOCUS|QMF_NODEFAULTINIT;
ADDRGP4 botSelectInfo+3616+72
CNSTU4 33024
ASGNU4
line 1213
;1213:	botSelectInfo.botlist.generic.x = 21;
ADDRGP4 botSelectInfo+3616+28
CNSTI4 21
ASGNI4
line 1214
;1214:	botSelectInfo.botlist.generic.y = 60;
ADDRGP4 botSelectInfo+3616+32
CNSTI4 60
ASGNI4
line 1215
;1215:	botSelectInfo.botlist.generic.ownerdraw = UI_BotSelect_ScrollListDraw;
ADDRGP4 botSelectInfo+3616+84
ADDRGP4 UI_BotSelect_ScrollListDraw
ASGNP4
line 1216
;1216:	botSelectInfo.botlist.columns = BOTLIST_COLS;
ADDRGP4 botSelectInfo+3616+120
CNSTI4 3
ASGNI4
line 1217
;1217:	botSelectInfo.botlist.seperation = 2;
ADDRGP4 botSelectInfo+3616+124
CNSTI4 2
ASGNI4
line 1218
;1218:	botSelectInfo.botlist.height = BOTLIST_ROWS;
ADDRGP4 botSelectInfo+3616+116
CNSTI4 12
ASGNI4
line 1219
;1219:	botSelectInfo.botlist.width = 14;
ADDRGP4 botSelectInfo+3616+112
CNSTI4 14
ASGNI4
line 1220
;1220:	botSelectInfo.botlist.itemnames = botSelectInfo.botalias;
ADDRGP4 botSelectInfo+3616+104
ADDRGP4 botSelectInfo+15244
ASGNP4
line 1222
;1221:
;1222:	UI_BotSelect_ScrollList_Init(&botSelectInfo.botlist);
ADDRGP4 botSelectInfo+3616
ARGP4
ADDRGP4 UI_BotSelect_ScrollList_Init
CALLV
pop
line 1224
;1223:
;1224:	y =	80;
ADDRLP4 8
CNSTI4 80
ASGNI4
line 1225
;1225:	for( i = 0, k = 0; i < BOTGRID_ROWS; i++) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 16
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ASGNI4
ADDRGP4 $683
JUMPV
LABELV $680
line 1226
;1226:		x =	180;
ADDRLP4 4
CNSTI4 180
ASGNI4
line 1227
;1227:		for( j = 0; j < BOTGRID_COLS; j++, k++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $684
line 1228
;1228:			botSelectInfo.picbuttons[k].generic.type		= MTYPE_BITMAP;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180
ADDP4
CNSTI4 6
ASGNI4
line 1229
;1229:			botSelectInfo.picbuttons[k].generic.flags		= QMF_LEFT_JUSTIFY|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+72
ADDP4
CNSTU4 33028
ASGNU4
line 1230
;1230:			botSelectInfo.picbuttons[k].generic.callback	= UI_BotSelect_BotEvent;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+76
ADDP4
ADDRGP4 UI_BotSelect_BotEvent
ASGNP4
line 1231
;1231:			botSelectInfo.picbuttons[k].generic.ownerdraw	= UI_BotSelect_BotGridDraw;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+84
ADDP4
ADDRGP4 UI_BotSelect_BotGridDraw
ASGNP4
line 1232
;1232:			botSelectInfo.picbuttons[k].generic.id			= k;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+24
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1233
;1233:			botSelectInfo.picbuttons[k].generic.x			= x - 16;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1234
;1234:			botSelectInfo.picbuttons[k].generic.y			= y - 16;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1235
;1235:			botSelectInfo.picbuttons[k].generic.left		= x;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+44
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1236
;1236:			botSelectInfo.picbuttons[k].generic.top			= y;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+48
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1237
;1237:			botSelectInfo.picbuttons[k].generic.right		= x + 64;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+52
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1238
;1238:			botSelectInfo.picbuttons[k].generic.bottom		= y + 64;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+56
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1239
;1239:			botSelectInfo.picbuttons[k].width				= 128;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+104
ADDP4
CNSTI4 128
ASGNI4
line 1240
;1240:			botSelectInfo.picbuttons[k].height				= 128;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+108
ADDP4
CNSTI4 128
ASGNI4
line 1241
;1241:			botSelectInfo.picbuttons[k].focuspic			= BOTSELECT_SELECT;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+88
ADDP4
ADDRGP4 $455
ASGNP4
line 1242
;1242:			botSelectInfo.picbuttons[k].focuscolor			= colorRed;
CNSTI4 116
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180+112
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1244
;1243:
;1244:			x += (64 + 6);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 1245
;1245:		}
LABELV $685
line 1227
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $684
line 1246
;1246:		y += (64 + SMALLCHAR_HEIGHT + 6);
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 64
ADDI4
CNSTI4 6
ADDI4
ADDI4
ASGNI4
line 1247
;1247:	}
LABELV $681
line 1225
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $683
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $680
line 1249
;1248:
;1249:	botSelectInfo.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+3036
CNSTI4 6
ASGNI4
line 1250
;1250:	botSelectInfo.arrows.generic.name		= BOTSELECT_ARROWS;
ADDRGP4 botSelectInfo+3036+4
ADDRGP4 $457
ASGNP4
line 1251
;1251:	botSelectInfo.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 botSelectInfo+3036+72
CNSTU4 16384
ASGNU4
line 1252
;1252:	botSelectInfo.arrows.generic.x			= 260;
ADDRGP4 botSelectInfo+3036+28
CNSTI4 260
ASGNI4
line 1253
;1253:	botSelectInfo.arrows.generic.y			= 440;
ADDRGP4 botSelectInfo+3036+32
CNSTI4 440
ASGNI4
line 1254
;1254:	botSelectInfo.arrows.width				= 128;
ADDRGP4 botSelectInfo+3036+104
CNSTI4 128
ASGNI4
line 1255
;1255:	botSelectInfo.arrows.height				= 32;
ADDRGP4 botSelectInfo+3036+108
CNSTI4 32
ASGNI4
line 1257
;1256:
;1257:	botSelectInfo.left.generic.type			= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+3152
CNSTI4 6
ASGNI4
line 1258
;1258:	botSelectInfo.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+3152+72
CNSTU4 260
ASGNU4
line 1259
;1259:	botSelectInfo.left.generic.callback		= UI_BotSelect_Event;
ADDRGP4 botSelectInfo+3152+76
ADDRGP4 UI_BotSelect_Event
ASGNP4
line 1260
;1260:	botSelectInfo.left.generic.id = ID_BOTSELECT_LEFT;
ADDRGP4 botSelectInfo+3152+24
CNSTI4 2
ASGNI4
line 1261
;1261:	botSelectInfo.left.generic.x			= 260;
ADDRGP4 botSelectInfo+3152+28
CNSTI4 260
ASGNI4
line 1262
;1262:	botSelectInfo.left.generic.y			= 440;
ADDRGP4 botSelectInfo+3152+32
CNSTI4 440
ASGNI4
line 1263
;1263:	botSelectInfo.left.width  				= 64;
ADDRGP4 botSelectInfo+3152+104
CNSTI4 64
ASGNI4
line 1264
;1264:	botSelectInfo.left.height  				= 32;
ADDRGP4 botSelectInfo+3152+108
CNSTI4 32
ASGNI4
line 1265
;1265:	botSelectInfo.left.focuspic				= BOTSELECT_ARROWSL;
ADDRGP4 botSelectInfo+3152+88
ADDRGP4 $458
ASGNP4
line 1267
;1266:
;1267:	botSelectInfo.right.generic.type	    = MTYPE_BITMAP;
ADDRGP4 botSelectInfo+3268
CNSTI4 6
ASGNI4
line 1268
;1268:	botSelectInfo.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+3268+72
CNSTU4 260
ASGNU4
line 1269
;1269:	botSelectInfo.right.generic.callback	= UI_BotSelect_Event;
ADDRGP4 botSelectInfo+3268+76
ADDRGP4 UI_BotSelect_Event
ASGNP4
line 1270
;1270:	botSelectInfo.right.generic.id = ID_BOTSELECT_RIGHT;
ADDRGP4 botSelectInfo+3268+24
CNSTI4 3
ASGNI4
line 1271
;1271:	botSelectInfo.right.generic.x			= 324;
ADDRGP4 botSelectInfo+3268+28
CNSTI4 324
ASGNI4
line 1272
;1272:	botSelectInfo.right.generic.y			= 440;
ADDRGP4 botSelectInfo+3268+32
CNSTI4 440
ASGNI4
line 1273
;1273:	botSelectInfo.right.width  				= 64;
ADDRGP4 botSelectInfo+3268+104
CNSTI4 64
ASGNI4
line 1274
;1274:	botSelectInfo.right.height  		    = 32;
ADDRGP4 botSelectInfo+3268+108
CNSTI4 32
ASGNI4
line 1275
;1275:	botSelectInfo.right.focuspic			= BOTSELECT_ARROWSR;
ADDRGP4 botSelectInfo+3268+88
ADDRGP4 $459
ASGNP4
line 1277
;1276:
;1277:	botSelectInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+3500
CNSTI4 6
ASGNI4
line 1278
;1278:	botSelectInfo.back.generic.name		= BOTSELECT_BACK0;
ADDRGP4 botSelectInfo+3500+4
ADDRGP4 $451
ASGNP4
line 1279
;1279:	botSelectInfo.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+3500+72
CNSTU4 260
ASGNU4
line 1280
;1280:	botSelectInfo.back.generic.callback	= UI_BotSelect_Event;
ADDRGP4 botSelectInfo+3500+76
ADDRGP4 UI_BotSelect_Event
ASGNP4
line 1281
;1281:	botSelectInfo.back.generic.id = ID_BOTSELECT_BACK;
ADDRGP4 botSelectInfo+3500+24
CNSTI4 4
ASGNI4
line 1282
;1282:	botSelectInfo.back.generic.x		= 0 - uis.wideoffset;
ADDRGP4 botSelectInfo+3500+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 1283
;1283:	botSelectInfo.back.generic.y		= 480-64;
ADDRGP4 botSelectInfo+3500+32
CNSTI4 416
ASGNI4
line 1284
;1284:	botSelectInfo.back.width			= 128;
ADDRGP4 botSelectInfo+3500+104
CNSTI4 128
ASGNI4
line 1285
;1285:	botSelectInfo.back.height			= 64;
ADDRGP4 botSelectInfo+3500+108
CNSTI4 64
ASGNI4
line 1286
;1286:	botSelectInfo.back.focuspic			= BOTSELECT_BACK1;
ADDRGP4 botSelectInfo+3500+88
ADDRGP4 $452
ASGNP4
line 1288
;1287:
;1288:	botSelectInfo.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+3384
CNSTI4 6
ASGNI4
line 1289
;1289:	botSelectInfo.go.generic.name		= BOTSELECT_ACCEPT0;
ADDRGP4 botSelectInfo+3384+4
ADDRGP4 $453
ASGNP4
line 1290
;1290:	botSelectInfo.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+3384+72
CNSTU4 272
ASGNU4
line 1291
;1291:	botSelectInfo.go.generic.callback	= UI_BotSelect_Event;
ADDRGP4 botSelectInfo+3384+76
ADDRGP4 UI_BotSelect_Event
ASGNP4
line 1292
;1292:	botSelectInfo.go.generic.id = ID_BOTSELECT_ACCEPT;
ADDRGP4 botSelectInfo+3384+24
CNSTI4 5
ASGNI4
line 1293
;1293:	botSelectInfo.go.generic.x			= 640 + uis.wideoffset;
ADDRGP4 botSelectInfo+3384+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 1294
;1294:	botSelectInfo.go.generic.y			= 480-64;
ADDRGP4 botSelectInfo+3384+32
CNSTI4 416
ASGNI4
line 1295
;1295:	botSelectInfo.go.width				= 128;
ADDRGP4 botSelectInfo+3384+104
CNSTI4 128
ASGNI4
line 1296
;1296:	botSelectInfo.go.height				= 64;
ADDRGP4 botSelectInfo+3384+108
CNSTI4 64
ASGNI4
line 1297
;1297:	botSelectInfo.go.focuspic			= BOTSELECT_ACCEPT1;
ADDRGP4 botSelectInfo+3384+88
ADDRGP4 $454
ASGNP4
line 1299
;1298:	
;1299:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $805
line 1300
;1300:	botSelectInfo.banner.string			= "SELECT BOT";
ADDRGP4 botSelectInfo+1076+88
ADDRGP4 $810
ASGNP4
line 1301
;1301:	botSelectInfo.viewlist.generic.name = "View list:";
ADDRGP4 botSelectInfo+3748+4
ADDRGP4 $813
ASGNP4
line 1302
;1302:	botSelectInfo.multisel.generic.name = "Multi-select:";
ADDRGP4 botSelectInfo+3844+4
ADDRGP4 $816
ASGNP4
line 1303
;1303:	}
LABELV $805
line 1304
;1304:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $817
line 1305
;1305:	botSelectInfo.banner.string			= "ВЫБОР БОТА";
ADDRGP4 botSelectInfo+1076+88
ADDRGP4 $822
ASGNP4
line 1306
;1306:	botSelectInfo.viewlist.generic.name = "Список:";
ADDRGP4 botSelectInfo+3748+4
ADDRGP4 $825
ASGNP4
line 1307
;1307:	botSelectInfo.multisel.generic.name = "Мульти-выбор:";
ADDRGP4 botSelectInfo+3844+4
ADDRGP4 $828
ASGNP4
line 1308
;1308:	}
LABELV $817
line 1310
;1309:
;1310:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.banner );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1311
;1311:	for( i = 0; i < MAX_GRIDMODELSPERPAGE; i++ ) {
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $830
line 1312
;1312:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picbuttons[i] );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 116
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1180
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1313
;1313:	}
LABELV $831
line 1311
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $830
line 1315
;1314:
;1315:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.arrows );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+3036
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1316
;1316:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.left );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+3152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1317
;1317:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.right );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+3268
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1318
;1318:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.back );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+3500
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1319
;1319:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.go );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+3384
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1320
;1320:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.viewlist );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+3748
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1321
;1321:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.multisel );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+3844
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1322
;1322:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.botlist );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+3616
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1324
;1323:
;1324:	UI_BotSelect_BuildList();
ADDRGP4 UI_BotSelect_BuildList
CALLV
pop
line 1325
;1325:	UI_BotSelect_SetViewType();
ADDRGP4 UI_BotSelect_SetViewType
CALLV
pop
line 1327
;1326:
;1327:	UI_BotSelect_Default( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelect_Default
CALLV
pop
line 1328
;1328:	UI_BotSelect_UpdateView();
ADDRGP4 UI_BotSelect_UpdateView
CALLV
pop
line 1329
;1329:	UI_BotSelect_CheckAcceptButton();
ADDRGP4 UI_BotSelect_CheckAcceptButton
CALLV
pop
line 1330
;1330:}
LABELV $606
endproc UI_BotSelect_Init 48 12
export UI_BotSelect_Index
proc UI_BotSelect_Index 0 8
line 1339
;1331:
;1332:
;1333:
;1334:/*
;1335:=================
;1336:UI_BotSelectMenu
;1337:=================
;1338:*/
;1339:void UI_BotSelect_Index( char *bot , int index) {
line 1340
;1340:	UI_BotSelect_Init( bot, index );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_BotSelect_Init
CALLV
pop
line 1341
;1341:	UI_PushMenu( &botSelectInfo.menu );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1342
;1342:}
LABELV $843
endproc UI_BotSelect_Index 0 8
export UI_BotSelectMenu
proc UI_BotSelectMenu 0 8
line 1349
;1343:
;1344:/*
;1345:=================
;1346:UI_BotSelectMenu
;1347:=================
;1348:*/
;1349:void UI_BotSelectMenu( char *bot ) {
line 1350
;1350:	UI_BotSelect_Init( bot, -1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 UI_BotSelect_Init
CALLV
pop
line 1351
;1351:	UI_PushMenu( &botSelectInfo.menu );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1352
;1352:}
LABELV $844
endproc UI_BotSelectMenu 0 8
bss
align 4
LABELV botSelectInfo
skip 15388
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
import UI_StartMapMenu
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
import Clamp_Random
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
LABELV $828
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
LABELV $825
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
LABELV $822
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
byte 1 145
byte 1 208
byte 1 158
byte 1 208
byte 1 162
byte 1 208
byte 1 144
byte 1 0
align 1
LABELV $816
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
LABELV $813
byte 1 86
byte 1 105
byte 1 101
byte 1 119
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $810
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $546
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $462
byte 1 88
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
byte 1 109
byte 1 97
byte 1 108
byte 1 108
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
LABELV $459
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $458
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $457
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
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
LABELV $456
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
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $455
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
LABELV $454
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
LABELV $453
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
LABELV $452
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
LABELV $451
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
LABELV $322
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $234
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $231
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $230
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $213
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $170
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 98
byte 1 111
byte 1 116
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
LABELV $96
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
