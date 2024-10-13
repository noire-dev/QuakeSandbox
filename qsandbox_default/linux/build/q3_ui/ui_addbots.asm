code
proc AddBots_SetBotIcon 12 12
file "../../../code/q3_ui/ui_addbots.c"
line 80
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:ADD BOTS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:
;13:
;14:#include "ui_local.h"
;15:
;16:
;17:#define ART_BACK0			"menu/art/back_0"
;18:#define ART_BACK1			"menu/art/back_1"	
;19:#define ART_FIGHT0			"menu/art/accept_0"
;20:#define ART_FIGHT1			"menu/art/accept_1"
;21:#define ART_BACKGROUND		"menu/art/addbotframe"
;22:#define ART_ARROWS			"menu/art/arrows_vert_0"
;23:#define ART_ARROWUP			"menu/art/arrows_vert_top"
;24:#define ART_ARROWDOWN		"menu/art/arrows_vert_bot"
;25:#define ART_SELECT			"menu/art/opponents_select"
;26:
;27:#define ID_BACK				10
;28:#define ID_GO				11
;29:#define ID_LIST				12
;30:#define ID_UP				13
;31:#define ID_DOWN				14
;32:#define ID_SKILL			15
;33:#define ID_TEAM				16
;34:#define ID_BOTNAME0			20
;35:#define ID_BOTNAME1			21
;36:#define ID_BOTNAME2			22
;37:#define ID_BOTNAME3			23
;38:#define ID_BOTNAME4			24
;39:#define ID_BOTNAME5			25
;40:#define ID_BOTNAME6			26
;41:#define ID_SKILLSLIDER  	27
;42:
;43:
;44:typedef struct {
;45:	menuframework_s	menu;
;46:	menubitmap_s	arrows;
;47:	menubitmap_s	up;
;48:	menubitmap_s	down;
;49:	menutext_s		bots[7];
;50:	menulist_s		skill;
;51:   menuslider_s   skill_slider;
;52:	menulist_s		team;
;53:	menubitmap_s	icon;
;54:	menubitmap_s	icon_hilite;
;55:
;56:	menubitmap_s	go;
;57:	menubitmap_s	back;
;58:
;59:	int				numBots;
;60:	int				delay;
;61:	int				baseBotNum;
;62:	int				selectedBotNum;
;63:	int				sortedBotNums[MAX_BOTS];
;64:	char			botnames[7][32];
;65:	char			boticon[MAX_QPATH];
;66:   int 			gametype;
;67:} addBotsMenuInfo_t;
;68:
;69:static addBotsMenuInfo_t	addBotsMenuInfo;
;70:
;71:
;72:
;73:
;74:/*
;75:=================
;76:AddBots_SetBotIcon
;77:=================
;78:*/
;79:static void AddBots_SetBotIcon( void)
;80:{
line 83
;81:	char* info;
;82:
;83:	info = UI_GetBotInfoByNumber( addBotsMenuInfo.sortedBotNums[addBotsMenuInfo.baseBotNum + addBotsMenuInfo.selectedBotNum] );
ADDRGP4 addBotsMenuInfo+2992
INDIRI4
ADDRGP4 addBotsMenuInfo+2996
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 addBotsMenuInfo+3000
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 84
;84:	UI_ServerPlayerIcon( Info_ValueForKey( info, "model" ), addBotsMenuInfo.boticon, MAX_QPATH );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $85
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 addBotsMenuInfo+11416
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 UI_ServerPlayerIcon
CALLV
pop
line 85
;85:	addBotsMenuInfo.icon.shader = 0;
ADDRGP4 addBotsMenuInfo+2520+96
CNSTI4 0
ASGNI4
line 86
;86:}
LABELV $81
endproc AddBots_SetBotIcon 12 12
proc UI_AddBotsMenu_SkillChangeEvent 20 0
line 94
;87:
;88:
;89:/*
;90:=================
;91:UI_AddBotsMenu_SkillChangeEvent
;92:=================
;93:*/
;94:static void UI_AddBotsMenu_SkillChangeEvent( void* ptr, int event) {
line 96
;95:   menucommon_s* common;
;96:   if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $90
line 97
;97:      return;
ADDRGP4 $89
JUMPV
LABELV $90
line 101
;98:   }
;99:
;100:   // ties the skill controls together
;101:   common = (menucommon_s*) ptr;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 102
;102:   switch (common->id) {
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
CNSTI4 15
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $95
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $92
LABELV $101
ADDRLP4 4
INDIRI4
CNSTI4 27
EQI4 $98
ADDRGP4 $92
JUMPV
LABELV $95
line 103
;103:      case ID_SKILL: {
line 104
;104:         menulist_s* skill = (menulist_s*)ptr;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
line 105
;105:         addBotsMenuInfo.skill_slider.curvalue = skill->curvalue;
ADDRGP4 addBotsMenuInfo+2284+96
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 106
;106:         break;
ADDRGP4 $93
JUMPV
LABELV $98
line 108
;107:      }
;108:      case ID_SKILLSLIDER: {
line 109
;109:         menuslider_s* skillslider = (menuslider_s*)ptr;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
line 110
;110:         addBotsMenuInfo.skill.curvalue = (int)skillslider->curvalue;
ADDRGP4 addBotsMenuInfo+2152+92
ADDRLP4 16
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 111
;111:         break;
LABELV $92
LABELV $93
line 114
;112:      }   
;113:   }
;114:}
LABELV $89
endproc UI_AddBotsMenu_SkillChangeEvent 20 0
proc UI_AddBotsMenu_FightEvent 16 20
line 121
;115:
;116:/*
;117:=================
;118:UI_AddBotsMenu_FightEvent
;119:=================
;120:*/
;121:static void UI_AddBotsMenu_FightEvent( void* ptr, int event ) {
line 125
;122:	const char	*team;
;123:	float			skill;
;124:
;125:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $103
line 126
;126:		return;
ADDRGP4 $102
JUMPV
LABELV $103
line 129
;127:	}
;128:
;129:	team = addBotsMenuInfo.team.itemnames[addBotsMenuInfo.team.curvalue];
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+2388+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 addBotsMenuInfo+2388+104
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 130
;130:	skill = addBotsMenuInfo.skill_slider.curvalue + 1;
ADDRLP4 4
ADDRGP4 addBotsMenuInfo+2284+96
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 132
;131:
;132:	trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %4.2f %s %i\n",
ADDRGP4 $111
ARGP4
ADDRGP4 addBotsMenuInfo+2996
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 addBotsMenuInfo+11192
ADDP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 addBotsMenuInfo+2988
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 135
;133:		addBotsMenuInfo.botnames[addBotsMenuInfo.selectedBotNum], skill, team, addBotsMenuInfo.delay) );
;134:
;135:	addBotsMenuInfo.delay += 1500;
ADDRLP4 12
ADDRGP4 addBotsMenuInfo+2988
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 136
;136:}
LABELV $102
endproc UI_AddBotsMenu_FightEvent 16 20
proc UI_AddBotsMenu_BotEvent 0 0
line 144
;137:
;138:
;139:/*
;140:=================
;141:UI_AddBotsMenu_BotEvent
;142:=================
;143:*/
;144:static void UI_AddBotsMenu_BotEvent( void* ptr, int event ) {
line 145
;145:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $117
line 146
;146:		return;
ADDRGP4 $116
JUMPV
LABELV $117
line 149
;147:	}
;148:
;149:	addBotsMenuInfo.bots[addBotsMenuInfo.selectedBotNum].color = color_orange;
CNSTI4 104
ADDRGP4 addBotsMenuInfo+2996
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424+100
ADDP4
ADDRGP4 color_orange
ASGNP4
line 150
;150:	addBotsMenuInfo.selectedBotNum = ((menucommon_s*)ptr)->id - ID_BOTNAME0;
ADDRGP4 addBotsMenuInfo+2996
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 20
SUBI4
ASGNI4
line 151
;151:	addBotsMenuInfo.bots[addBotsMenuInfo.selectedBotNum].color = color_white;
CNSTI4 104
ADDRGP4 addBotsMenuInfo+2996
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424+100
ADDP4
ADDRGP4 color_white
ASGNP4
line 153
;152:
;153:	AddBots_SetBotIcon();
ADDRGP4 AddBots_SetBotIcon
CALLV
pop
line 154
;154:}
LABELV $116
endproc UI_AddBotsMenu_BotEvent 0 0
proc UI_AddBotsMenu_TeamEvent 0 0
line 163
;155:
;156:
;157:
;158:/*
;159:=================
;160:UI_AddBotsMenu_TeamEvent
;161:=================
;162:*/
;163:static void UI_AddBotsMenu_TeamEvent( void* ptr, int event ) {
line 164
;164:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $127
line 165
;165:		return;
ADDRGP4 $126
JUMPV
LABELV $127
line 168
;166:	}
;167:
;168:	if (addBotsMenuInfo.gametype < GT_TEAM ||  addBotsMenuInfo.gametype == GT_LMS)
ADDRGP4 addBotsMenuInfo+11480
INDIRI4
CNSTI4 4
LTI4 $133
ADDRGP4 addBotsMenuInfo+11480
INDIRI4
CNSTI4 11
NEI4 $129
LABELV $133
line 169
;169:		return;
ADDRGP4 $126
JUMPV
LABELV $129
line 171
;170:
;171:	if (addBotsMenuInfo.team.curvalue == 1)
ADDRGP4 addBotsMenuInfo+2388+92
INDIRI4
CNSTI4 1
NEI4 $134
line 172
;172:		addBotsMenuInfo.icon_hilite.focuscolor			= color_blue;
ADDRGP4 addBotsMenuInfo+2636+112
ADDRGP4 color_blue
ASGNP4
ADDRGP4 $135
JUMPV
LABELV $134
line 174
;173:	else
;174:		addBotsMenuInfo.icon_hilite.focuscolor			= color_realred;
ADDRGP4 addBotsMenuInfo+2636+112
ADDRGP4 color_realred
ASGNP4
LABELV $135
line 175
;175:}
LABELV $126
endproc UI_AddBotsMenu_TeamEvent 0 0
proc UI_AddBotsMenu_BackEvent 0 0
line 184
;176:
;177:
;178:
;179:/*
;180:=================
;181:UI_AddBotsMenu_BackEvent
;182:=================
;183:*/
;184:static void UI_AddBotsMenu_BackEvent( void* ptr, int event ) {
line 185
;185:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $143
line 186
;186:		return;
ADDRGP4 $142
JUMPV
LABELV $143
line 188
;187:	}
;188:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 189
;189:}
LABELV $142
endproc UI_AddBotsMenu_BackEvent 0 0
proc UI_AddBotsMenu_Createdbot 8 12
line 191
;190:
;191:static void UI_AddBotsMenu_Createdbot( const char *info ) {
line 194
;192:	fileHandle_t f;
;193:	
;194:	trap_FS_FOpenFile(va("bots/%s.dbot", info ),&f,FS_WRITE);
ADDRGP4 $146
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 196
;195:	
;196:	trap_FS_Write("null", 4, f);
ADDRGP4 $147
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 198
;197:	
;198:	trap_FS_FCloseFile(f);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 199
;199:}
LABELV $145
endproc UI_AddBotsMenu_Createdbot 8 12
proc UI_AddBotsMenu_SetBotNames 16 12
line 207
;200:
;201:
;202:/*
;203:=================
;204:UI_AddBotsMenu_SetBotNames
;205:=================
;206:*/
;207:static void UI_AddBotsMenu_SetBotNames( void ) {
line 211
;208:	int			n;
;209:	const char	*info;
;210:
;211:	for ( n = 0; n < 7; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $149
line 212
;212:		info = UI_GetBotInfoByNumber( addBotsMenuInfo.sortedBotNums[addBotsMenuInfo.baseBotNum + n] );
ADDRGP4 addBotsMenuInfo+2992
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 addBotsMenuInfo+3000
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 213
;213:		Q_strncpyz( addBotsMenuInfo.botnames[n], Info_ValueForKey( info, "name" ), sizeof(addBotsMenuInfo.botnames[n]) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 addBotsMenuInfo+11192
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 215
;214:		//UI_AddBotsMenu_Createdbot(Info_ValueForKey( info, "name" ));
;215:	}
LABELV $150
line 211
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LTI4 $149
line 217
;216:
;217:}
LABELV $148
endproc UI_AddBotsMenu_SetBotNames 16 12
proc UI_AddBotsMenu_UpEvent 4 0
line 225
;218:
;219:
;220:/*
;221:=================
;222:UI_AddBotsMenu_UpEvent
;223:=================
;224:*/
;225:static void UI_AddBotsMenu_UpEvent( void* ptr, int event ) {
line 226
;226:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $159
line 227
;227:		return;
ADDRGP4 $158
JUMPV
LABELV $159
line 230
;228:	}
;229:
;230:	if( addBotsMenuInfo.baseBotNum > 0 ) {
ADDRGP4 addBotsMenuInfo+2992
INDIRI4
CNSTI4 0
LEI4 $161
line 231
;231:		addBotsMenuInfo.baseBotNum -= 7;
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+2992
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 7
SUBI4
ASGNI4
line 232
;232:		if (addBotsMenuInfo.baseBotNum < 0)
ADDRGP4 addBotsMenuInfo+2992
INDIRI4
CNSTI4 0
GEI4 $165
line 233
;233:			addBotsMenuInfo.baseBotNum = 0;
ADDRGP4 addBotsMenuInfo+2992
CNSTI4 0
ASGNI4
LABELV $165
line 234
;234:		UI_AddBotsMenu_SetBotNames();
ADDRGP4 UI_AddBotsMenu_SetBotNames
CALLV
pop
line 235
;235:		AddBots_SetBotIcon();
ADDRGP4 AddBots_SetBotIcon
CALLV
pop
line 236
;236:	}
LABELV $161
line 237
;237:}
LABELV $158
endproc UI_AddBotsMenu_UpEvent 4 0
proc UI_AddBotsMenu_DownEvent 4 0
line 245
;238:
;239:
;240:/*
;241:=================
;242:UI_AddBotsMenu_DownEvent
;243:=================
;244:*/
;245:static void UI_AddBotsMenu_DownEvent( void* ptr, int event ) {
line 248
;246:	int bot;
;247:
;248:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $170
line 249
;249:		return;
ADDRGP4 $169
JUMPV
LABELV $170
line 252
;250:	}
;251:
;252:	bot = addBotsMenuInfo.baseBotNum;
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+2992
INDIRI4
ASGNI4
line 253
;253:	if (bot + 7 < addBotsMenuInfo.numBots)
ADDRLP4 0
INDIRI4
CNSTI4 7
ADDI4
ADDRGP4 addBotsMenuInfo+2984
INDIRI4
GEI4 $169
line 254
;254:		bot += 7;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 7
ADDI4
ASGNI4
line 256
;255:	else
;256:		return;	
LABELV $174
line 258
;257:
;258:	if ( bot + 7 >= addBotsMenuInfo.numBots ) {
ADDRLP4 0
INDIRI4
CNSTI4 7
ADDI4
ADDRGP4 addBotsMenuInfo+2984
INDIRI4
LTI4 $176
line 259
;259:		bot = addBotsMenuInfo.numBots - 7;
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+2984
INDIRI4
CNSTI4 7
SUBI4
ASGNI4
line 260
;260:		if (bot < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $180
line 261
;261:			bot = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $180
line 262
;262:	}
LABELV $176
line 264
;263:
;264:	addBotsMenuInfo.baseBotNum = bot;
ADDRGP4 addBotsMenuInfo+2992
ADDRLP4 0
INDIRI4
ASGNI4
line 265
;265:	UI_AddBotsMenu_SetBotNames();
ADDRGP4 UI_AddBotsMenu_SetBotNames
CALLV
pop
line 266
;266:	AddBots_SetBotIcon();
ADDRGP4 AddBots_SetBotIcon
CALLV
pop
line 267
;267:}
LABELV $169
endproc UI_AddBotsMenu_DownEvent 4 0
proc UI_AddBotsMenu_SortCompare 44 8
line 275
;268:
;269:
;270:/*
;271:=================
;272:UI_AddBotsMenu_GetSortedBotNums
;273:=================
;274:*/
;275:static int QDECL UI_AddBotsMenu_SortCompare( const void *arg1, const void *arg2 ) {
line 280
;276:	int			num1, num2;
;277:	const char	*info1, *info2;
;278:	const char	*name1, *name2;
;279:
;280:	num1 = *(int *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 281
;281:	num2 = *(int *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 283
;282:
;283:	info1 = UI_GetBotInfoByNumber( num1 );
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
line 284
;284:	info2 = UI_GetBotInfoByNumber( num2 );
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
line 286
;285:
;286:	name1 = Info_ValueForKey( info1, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 287
;287:	name2 = Info_ValueForKey( info2, "name" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 289
;288:
;289:	return Q_stricmp( name1, name2 );
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
LABELV $183
endproc UI_AddBotsMenu_SortCompare 44 8
proc UI_AddBotsMenu_GetSortedBotNums 8 16
line 292
;290:}
;291:
;292:static void UI_AddBotsMenu_GetSortedBotNums( void ) {
line 296
;293:	int		n;
;294:
;295:	// initialize the array
;296:	for( n = 0; n < addBotsMenuInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $188
JUMPV
LABELV $185
line 297
;297:		addBotsMenuInfo.sortedBotNums[n] = n;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 addBotsMenuInfo+3000
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 298
;298:	}
LABELV $186
line 296
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $188
ADDRLP4 0
INDIRI4
ADDRGP4 addBotsMenuInfo+2984
INDIRI4
LTI4 $185
line 300
;299:
;300:	qsort( addBotsMenuInfo.sortedBotNums, addBotsMenuInfo.numBots, sizeof(addBotsMenuInfo.sortedBotNums[0]), UI_AddBotsMenu_SortCompare );
ADDRGP4 addBotsMenuInfo+3000
ARGP4
ADDRGP4 addBotsMenuInfo+2984
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_AddBotsMenu_SortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 301
;301:}
LABELV $184
endproc UI_AddBotsMenu_GetSortedBotNums 8 16
proc UI_AddBotsMenu_Draw 48 20
line 308
;302:
;303:/*
;304:=================
;305:UI_AddBotsMenu_Draw
;306:=================
;307:*/
;308:static void UI_AddBotsMenu_Draw( void ) {
line 315
;309:	qhandle_t hpic;
;310:	menubitmap_s* b;
;311:	int x, y, w, h;
;312:	int skill;
;313:   float f_skill;
;314:
;315:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $195
line 316
;316:	UI_DrawBannerString( 320, 16, "ADD BOTS", UI_CENTER, color_white );
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 $198
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawBannerString
CALLV
pop
line 317
;317:}
LABELV $195
line 318
;318:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $199
line 319
;319:	UI_DrawBannerString( 320, 16, "ДОБАВИТЬ БОТОВ", UI_CENTER, color_white );
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 $202
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawBannerString
CALLV
pop
line 320
;320:}
LABELV $199
line 321
;321:	UI_DrawNamedPic( 320-233, 240-166, 466, 332, ART_BACKGROUND );
CNSTF4 1118699520
ARGF4
CNSTF4 1116995584
ARGF4
CNSTF4 1139343360
ARGF4
CNSTF4 1134952448
ARGF4
ADDRGP4 $203
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 324
;322:
;323:	// standard menu drawing
;324:	Menu_Draw( &addBotsMenuInfo.menu );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 326
;325:
;326:	if (addBotsMenuInfo.boticon[0])
ADDRGP4 addBotsMenuInfo+11416
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $204
line 327
;327:	{
line 328
;328:		skill = addBotsMenuInfo.skill.curvalue + 1;
ADDRLP4 28
ADDRGP4 addBotsMenuInfo+2152+92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 330
;329:		//hpic = trap_R_RegisterShaderNoMip( va("menu/art/skill%i", skill));
;330:		if (1 == 1)
line 331
;331:			return;
ADDRGP4 $194
JUMPV
LABELV $209
line 334
;332:
;333:		// put icon in bottom right corner of pic
;334:		b = &addBotsMenuInfo.icon;
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+2520
ASGNP4
line 335
;335:		w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 336
;336:		h = b->height;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 337
;337:		x = b->generic.x + w;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 338
;338:		y = b->generic.y + h;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 340
;339:
;340:		w /= 3;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 341
;341:		h /= 3;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 342
;342:		x -= w;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 343
;343:		y -= h;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ASGNI4
line 345
;344:
;345:		trap_R_SetColor(color_black);
ADDRGP4 color_black
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 346
;346:		UI_DrawHandlePic( x, y, w, h, hpic);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 347
;347:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 349
;348:
;349:		UI_DrawHandlePic( x - 2, y - 2, w, h, hpic);
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 352
;350:
;351:      // write bot skill as float
;352:      x = b->generic.x + b->width - 4 * SMALLCHAR_WIDTH;
ADDRLP4 4
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
ADDI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 2
LSHI4
SUBI4
ASGNI4
line 353
;353:      y = b->generic.y + b->height + 2;
ADDRLP4 8
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
line 354
;354:      f_skill = addBotsMenuInfo.skill_slider.curvalue + 1;
ADDRLP4 24
ADDRGP4 addBotsMenuInfo+2284+96
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 355
;355:	   UI_DrawString(x, y, va("%4.2f", f_skill), UI_SMALLFONT, color_orange);
ADDRGP4 $215
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 356
;356:	}
LABELV $204
line 357
;357:}
LABELV $194
endproc UI_AddBotsMenu_Draw 48 20
data
align 4
LABELV skillNames
address $216
address $217
address $218
address $219
address $220
address $221
address $222
address $223
address $224
byte 4 0
align 4
LABELV skillNames_ru
address $225
address $226
address $227
address $228
address $229
address $230
address $231
address $232
address $233
byte 4 0
align 4
LABELV teamNames1
address $234
byte 4 0
align 4
LABELV teamNames2
address $235
address $236
byte 4 0
code
proc UI_AddBotsMenu_Init 1060 12
line 401
;358:
;359:/*
;360:=================
;361:UI_AddBotsMenu_Init
;362:=================
;363:*/
;364:static const char *skillNames[] = {
;365:	"Noob",
;366:	"Easy",
;367:	"Medium",
;368:	"Hard",
;369:	"Nightmare!",
;370:	"Infinite ammo",
;371:	"Ultra HP",
;372:	"Ultra Damage",
;373:	"Nextbot",
;374:	0
;375:};
;376:
;377:static const char* skillNames_ru[] = {
;378:	"Нуб",
;379:	"Легкий",
;380:	"Средний",
;381:	"Сложный",
;382:	"Кошмар!",
;383:	"Беск патроны",
;384:	"Ультра HP",
;385:	"Ультра урон",
;386:	"Некстбот",
;387:	0
;388:};
;389:
;390:static const char *teamNames1[] = {
;391:	"Free",
;392:	0
;393:};
;394:
;395:static const char *teamNames2[] = {
;396:	"Red",
;397:	"Blue",
;398:	0
;399:};
;400:
;401:static void UI_AddBotsMenu_Init( void ) {
line 407
;402:	int		n;
;403:	int		y;
;404:	int		count;
;405:	char	info[MAX_INFO_STRING];
;406:
;407:	trap_GetConfigString(CS_SERVERINFO, info, MAX_INFO_STRING);
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 409
;408:
;409:	memset( &addBotsMenuInfo, 0 ,sizeof(addBotsMenuInfo) );
ADDRGP4 addBotsMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 11484
ARGI4
ADDRGP4 memset
CALLP4
pop
line 410
;410:	addBotsMenuInfo.menu.draw = UI_AddBotsMenu_Draw;
ADDRGP4 addBotsMenuInfo+1036
ADDRGP4 UI_AddBotsMenu_Draw
ASGNP4
line 411
;411:	addBotsMenuInfo.menu.fullscreen = qfalse;
ADDRGP4 addBotsMenuInfo+1052
CNSTI4 0
ASGNI4
line 412
;412:	addBotsMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 addBotsMenuInfo+1044
CNSTI4 1
ASGNI4
line 413
;413:	addBotsMenuInfo.menu.native = qfalse;
ADDRGP4 addBotsMenuInfo+1056
CNSTI4 0
ASGNI4
line 414
;414:	addBotsMenuInfo.delay = 1000;
ADDRGP4 addBotsMenuInfo+2988
CNSTI4 1000
ASGNI4
line 416
;415:
;416:	addBotsMenuInfo.gametype = atoi( Info_ValueForKey( info,"g_gametype" ) );
ADDRLP4 12
ARGP4
ADDRGP4 $244
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 addBotsMenuInfo+11480
ADDRLP4 1040
INDIRI4
ASGNI4
line 418
;417:
;418:	UI_AddBots_Cache();
ADDRGP4 UI_AddBots_Cache
CALLV
pop
line 420
;419:
;420:	addBotsMenuInfo.numBots = UI_GetNumBots();
ADDRLP4 1044
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 addBotsMenuInfo+2984
ADDRLP4 1044
INDIRI4
ASGNI4
line 421
;421:	count = addBotsMenuInfo.numBots < 7 ? addBotsMenuInfo.numBots : 7;
ADDRGP4 addBotsMenuInfo+2984
INDIRI4
CNSTI4 7
GEI4 $249
ADDRLP4 1048
ADDRGP4 addBotsMenuInfo+2984
INDIRI4
ASGNI4
ADDRGP4 $250
JUMPV
LABELV $249
ADDRLP4 1048
CNSTI4 7
ASGNI4
LABELV $250
ADDRLP4 8
ADDRLP4 1048
INDIRI4
ASGNI4
line 427
;422:
;423:   // set the default bot skill
;424:   //addBotsMenuInfo.f_skill = Com_Clamp( 0, 4, (int)trap_Cvar_VariableValue( "g_spSkill" ) - 1 );
;425:
;426:   // prepare the menu items
;427:	addBotsMenuInfo.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+1076
CNSTI4 6
ASGNI4
line 428
;428:	addBotsMenuInfo.arrows.generic.name  = ART_ARROWS;
ADDRGP4 addBotsMenuInfo+1076+4
ADDRGP4 $254
ASGNP4
line 429
;429:	addBotsMenuInfo.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 addBotsMenuInfo+1076+72
CNSTU4 16384
ASGNU4
line 430
;430:	addBotsMenuInfo.arrows.generic.x	 = 200;
ADDRGP4 addBotsMenuInfo+1076+28
CNSTI4 200
ASGNI4
line 431
;431:	addBotsMenuInfo.arrows.generic.y	 = 128;
ADDRGP4 addBotsMenuInfo+1076+32
CNSTI4 128
ASGNI4
line 432
;432:	addBotsMenuInfo.arrows.width  	     = 64;
ADDRGP4 addBotsMenuInfo+1076+104
CNSTI4 64
ASGNI4
line 433
;433:	addBotsMenuInfo.arrows.height  	     = 128;
ADDRGP4 addBotsMenuInfo+1076+108
CNSTI4 128
ASGNI4
line 435
;434:
;435:	addBotsMenuInfo.up.generic.type	    = MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+1192
CNSTI4 6
ASGNI4
line 436
;436:	addBotsMenuInfo.up.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 addBotsMenuInfo+1192+72
CNSTU4 260
ASGNU4
line 437
;437:	addBotsMenuInfo.up.generic.x		= 200;
ADDRGP4 addBotsMenuInfo+1192+28
CNSTI4 200
ASGNI4
line 438
;438:	addBotsMenuInfo.up.generic.y		= 128;
ADDRGP4 addBotsMenuInfo+1192+32
CNSTI4 128
ASGNI4
line 439
;439:	addBotsMenuInfo.up.generic.id	    = ID_UP;
ADDRGP4 addBotsMenuInfo+1192+24
CNSTI4 13
ASGNI4
line 440
;440:	addBotsMenuInfo.up.generic.callback = UI_AddBotsMenu_UpEvent;
ADDRGP4 addBotsMenuInfo+1192+76
ADDRGP4 UI_AddBotsMenu_UpEvent
ASGNP4
line 441
;441:	addBotsMenuInfo.up.width  		    = 64;
ADDRGP4 addBotsMenuInfo+1192+104
CNSTI4 64
ASGNI4
line 442
;442:	addBotsMenuInfo.up.height  		    = 64;
ADDRGP4 addBotsMenuInfo+1192+108
CNSTI4 64
ASGNI4
line 443
;443:	addBotsMenuInfo.up.focuspic         = ART_ARROWUP;
ADDRGP4 addBotsMenuInfo+1192+88
ADDRGP4 $282
ASGNP4
line 445
;444:
;445:	addBotsMenuInfo.down.generic.type	  = MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+1308
CNSTI4 6
ASGNI4
line 446
;446:	addBotsMenuInfo.down.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 addBotsMenuInfo+1308+72
CNSTU4 260
ASGNU4
line 447
;447:	addBotsMenuInfo.down.generic.x		  = 200;
ADDRGP4 addBotsMenuInfo+1308+28
CNSTI4 200
ASGNI4
line 448
;448:	addBotsMenuInfo.down.generic.y		  = 128 +64;
ADDRGP4 addBotsMenuInfo+1308+32
CNSTI4 192
ASGNI4
line 449
;449:	addBotsMenuInfo.down.generic.id	      = ID_DOWN;
ADDRGP4 addBotsMenuInfo+1308+24
CNSTI4 14
ASGNI4
line 450
;450:	addBotsMenuInfo.down.generic.callback = UI_AddBotsMenu_DownEvent;
ADDRGP4 addBotsMenuInfo+1308+76
ADDRGP4 UI_AddBotsMenu_DownEvent
ASGNP4
line 451
;451:	addBotsMenuInfo.down.width  		  = 64;
ADDRGP4 addBotsMenuInfo+1308+104
CNSTI4 64
ASGNI4
line 452
;452:	addBotsMenuInfo.down.height  		  = 64;
ADDRGP4 addBotsMenuInfo+1308+108
CNSTI4 64
ASGNI4
line 453
;453:	addBotsMenuInfo.down.focuspic         = ART_ARROWDOWN;
ADDRGP4 addBotsMenuInfo+1308+88
ADDRGP4 $300
ASGNP4
line 455
;454:
;455:	for( n = 0, y = 120; n < count; n++, y += 20 ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
CNSTI4 120
ASGNI4
ADDRGP4 $304
JUMPV
LABELV $301
line 456
;456:		addBotsMenuInfo.bots[n].generic.type		= MTYPE_PTEXT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424
ADDP4
CNSTI4 9
ASGNI4
line 457
;457:		addBotsMenuInfo.bots[n].generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424+72
ADDP4
CNSTU4 260
ASGNU4
line 458
;458:		addBotsMenuInfo.bots[n].generic.id			= ID_BOTNAME0 + n;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424+24
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 459
;459:		addBotsMenuInfo.bots[n].generic.x			= 320 - 56;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424+28
ADDP4
CNSTI4 264
ASGNI4
line 460
;460:		addBotsMenuInfo.bots[n].generic.y			= y;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424+32
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 461
;461:		addBotsMenuInfo.bots[n].generic.callback	= UI_AddBotsMenu_BotEvent;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424+76
ADDP4
ADDRGP4 UI_AddBotsMenu_BotEvent
ASGNP4
line 462
;462:		addBotsMenuInfo.bots[n].string				= addBotsMenuInfo.botnames[n];
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424+88
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 addBotsMenuInfo+11192
ADDP4
ASGNP4
line 463
;463:		addBotsMenuInfo.bots[n].color				= color_orange;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424+100
ADDP4
ADDRGP4 color_orange
ASGNP4
line 464
;464:		addBotsMenuInfo.bots[n].style				= UI_LEFT|UI_SMALLFONT;
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424+92
ADDP4
CNSTI4 16
ASGNI4
line 465
;465:	}
LABELV $302
line 455
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
LABELV $304
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $301
line 467
;466:
;467:	y += 12;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 468
;468:	addBotsMenuInfo.skill_slider.generic.type		= MTYPE_SLIDER;
ADDRGP4 addBotsMenuInfo+2284
CNSTI4 1
ASGNI4
line 469
;469:	addBotsMenuInfo.skill_slider.generic.x			= 320;
ADDRGP4 addBotsMenuInfo+2284+28
CNSTI4 320
ASGNI4
line 470
;470:	addBotsMenuInfo.skill_slider.generic.y			= y;
ADDRGP4 addBotsMenuInfo+2284+32
ADDRLP4 4
INDIRI4
ASGNI4
line 471
;471:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $328
line 472
;472:	addBotsMenuInfo.skill_slider.generic.name		= "Skill:";
ADDRGP4 addBotsMenuInfo+2284+4
ADDRGP4 $333
ASGNP4
line 473
;473:}
LABELV $328
line 474
;474:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $334
line 475
;475:	addBotsMenuInfo.skill_slider.generic.name		= "Сложность:";
ADDRGP4 addBotsMenuInfo+2284+4
ADDRGP4 $339
ASGNP4
line 476
;476:}
LABELV $334
line 477
;477:	addBotsMenuInfo.skill_slider.generic.callback = UI_AddBotsMenu_SkillChangeEvent;
ADDRGP4 addBotsMenuInfo+2284+76
ADDRGP4 UI_AddBotsMenu_SkillChangeEvent
ASGNP4
line 478
;478:	addBotsMenuInfo.skill_slider.generic.id		= ID_SKILLSLIDER;
ADDRGP4 addBotsMenuInfo+2284+24
CNSTI4 27
ASGNI4
line 479
;479:	addBotsMenuInfo.skill_slider.minvalue			= 0.0;
ADDRGP4 addBotsMenuInfo+2284+88
CNSTF4 0
ASGNF4
line 480
;480:	addBotsMenuInfo.skill_slider.maxvalue			= 8.0;
ADDRGP4 addBotsMenuInfo+2284+92
CNSTF4 1090519040
ASGNF4
line 481
;481:	addBotsMenuInfo.skill_slider.curvalue			= Com_Clamp( 0, 8, (int)trap_Cvar_VariableValue( "g_spSkill" ) - 1 );
ADDRGP4 $350
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1090519040
ARGF4
ADDRLP4 1052
INDIRF4
CVFI4 4
CNSTI4 1
SUBI4
CVIF4 4
ARGF4
ADDRLP4 1056
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 addBotsMenuInfo+2284+96
ADDRLP4 1056
INDIRF4
ASGNF4
line 483
;482:
;483:   y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 484
;484:	addBotsMenuInfo.skill.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 addBotsMenuInfo+2152
CNSTI4 3
ASGNI4
line 485
;485:	addBotsMenuInfo.skill.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 addBotsMenuInfo+2152+72
CNSTU4 258
ASGNU4
line 486
;486:	addBotsMenuInfo.skill.generic.callback = UI_AddBotsMenu_SkillChangeEvent;
ADDRGP4 addBotsMenuInfo+2152+76
ADDRGP4 UI_AddBotsMenu_SkillChangeEvent
ASGNP4
line 487
;487:	addBotsMenuInfo.skill.generic.x			= 320;
ADDRGP4 addBotsMenuInfo+2152+28
CNSTI4 320
ASGNI4
line 488
;488:	addBotsMenuInfo.skill.generic.y			= y;
ADDRGP4 addBotsMenuInfo+2152+32
ADDRLP4 4
INDIRI4
ASGNI4
line 489
;489:	addBotsMenuInfo.skill.generic.id		= ID_SKILL;
ADDRGP4 addBotsMenuInfo+2152+24
CNSTI4 15
ASGNI4
line 490
;490:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $363
line 491
;491:	addBotsMenuInfo.skill.itemnames			= skillNames;
ADDRGP4 addBotsMenuInfo+2152+104
ADDRGP4 skillNames
ASGNP4
line 492
;492:	}
LABELV $363
line 493
;493:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $368
line 494
;494:	addBotsMenuInfo.skill.itemnames			= skillNames_ru;
ADDRGP4 addBotsMenuInfo+2152+104
ADDRGP4 skillNames_ru
ASGNP4
line 495
;495:	}
LABELV $368
line 496
;496:	addBotsMenuInfo.skill.curvalue			= (int)addBotsMenuInfo.skill_slider.curvalue;
ADDRGP4 addBotsMenuInfo+2152+92
ADDRGP4 addBotsMenuInfo+2284+96
INDIRF4
CVFI4 4
ASGNI4
line 498
;497:
;498:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 cl_smallcharheight+12
INDIRI4
ADDI4
ASGNI4
line 499
;499:	addBotsMenuInfo.team.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 addBotsMenuInfo+2388
CNSTI4 3
ASGNI4
line 500
;500:	addBotsMenuInfo.team.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 addBotsMenuInfo+2388+72
CNSTU4 258
ASGNU4
line 501
;501:	addBotsMenuInfo.team.generic.callback		= UI_AddBotsMenu_TeamEvent;
ADDRGP4 addBotsMenuInfo+2388+76
ADDRGP4 UI_AddBotsMenu_TeamEvent
ASGNP4
line 502
;502:	addBotsMenuInfo.team.generic.x			= 320;
ADDRGP4 addBotsMenuInfo+2388+28
CNSTI4 320
ASGNI4
line 503
;503:	addBotsMenuInfo.team.generic.y			= y;
ADDRGP4 addBotsMenuInfo+2388+32
ADDRLP4 4
INDIRI4
ASGNI4
line 504
;504:if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $387
line 505
;505:	addBotsMenuInfo.team.generic.name		= "Team: ";
ADDRGP4 addBotsMenuInfo+2388+4
ADDRGP4 $392
ASGNP4
line 506
;506:}
LABELV $387
line 507
;507:if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $393
line 508
;508:	addBotsMenuInfo.team.generic.name		= "Команда: ";
ADDRGP4 addBotsMenuInfo+2388+4
ADDRGP4 $398
ASGNP4
line 509
;509:}
LABELV $393
line 510
;510:	addBotsMenuInfo.team.generic.id			= ID_TEAM;
ADDRGP4 addBotsMenuInfo+2388+24
CNSTI4 16
ASGNI4
line 511
;511:	if( addBotsMenuInfo.gametype >= GT_TEAM && !(addBotsMenuInfo.gametype == GT_LMS) ) {
ADDRGP4 addBotsMenuInfo+11480
INDIRI4
CNSTI4 4
LTI4 $401
ADDRGP4 addBotsMenuInfo+11480
INDIRI4
CNSTI4 11
EQI4 $401
line 512
;512:		addBotsMenuInfo.team.itemnames		= teamNames2;
ADDRGP4 addBotsMenuInfo+2388+104
ADDRGP4 teamNames2
ASGNP4
line 513
;513:	}
ADDRGP4 $402
JUMPV
LABELV $401
line 514
;514:	else {
line 515
;515:		addBotsMenuInfo.team.itemnames		= teamNames1;
ADDRGP4 addBotsMenuInfo+2388+104
ADDRGP4 teamNames1
ASGNP4
line 516
;516:		addBotsMenuInfo.team.generic.flags	= QMF_GRAYED;
ADDRGP4 addBotsMenuInfo+2388+72
CNSTU4 8192
ASGNU4
line 517
;517:	}
LABELV $402
line 519
;518:
;519:	addBotsMenuInfo.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+2752
CNSTI4 6
ASGNI4
line 520
;520:	addBotsMenuInfo.go.generic.name			= ART_FIGHT0;
ADDRGP4 addBotsMenuInfo+2752+4
ADDRGP4 $414
ASGNP4
line 521
;521:	addBotsMenuInfo.go.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 addBotsMenuInfo+2752+72
CNSTU4 260
ASGNU4
line 522
;522:	addBotsMenuInfo.go.generic.id			= ID_GO;
ADDRGP4 addBotsMenuInfo+2752+24
CNSTI4 11
ASGNI4
line 523
;523:	addBotsMenuInfo.go.generic.callback		= UI_AddBotsMenu_FightEvent;
ADDRGP4 addBotsMenuInfo+2752+76
ADDRGP4 UI_AddBotsMenu_FightEvent
ASGNP4
line 524
;524:	addBotsMenuInfo.go.generic.x			= 320+128-128;
ADDRGP4 addBotsMenuInfo+2752+28
CNSTI4 320
ASGNI4
line 525
;525:	addBotsMenuInfo.go.generic.y			= 256+128-64;
ADDRGP4 addBotsMenuInfo+2752+32
CNSTI4 320
ASGNI4
line 526
;526:	addBotsMenuInfo.go.width  				= 128;
ADDRGP4 addBotsMenuInfo+2752+104
CNSTI4 128
ASGNI4
line 527
;527:	addBotsMenuInfo.go.height  				= 64;
ADDRGP4 addBotsMenuInfo+2752+108
CNSTI4 64
ASGNI4
line 528
;528:	addBotsMenuInfo.go.focuspic				= ART_FIGHT1;
ADDRGP4 addBotsMenuInfo+2752+88
ADDRGP4 $431
ASGNP4
line 530
;529:
;530:	addBotsMenuInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+2868
CNSTI4 6
ASGNI4
line 531
;531:	addBotsMenuInfo.back.generic.name		= ART_BACK0;
ADDRGP4 addBotsMenuInfo+2868+4
ADDRGP4 $435
ASGNP4
line 532
;532:	addBotsMenuInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 addBotsMenuInfo+2868+72
CNSTU4 260
ASGNU4
line 533
;533:	addBotsMenuInfo.back.generic.id			= ID_BACK;
ADDRGP4 addBotsMenuInfo+2868+24
CNSTI4 10
ASGNI4
line 534
;534:	addBotsMenuInfo.back.generic.callback	= UI_AddBotsMenu_BackEvent;
ADDRGP4 addBotsMenuInfo+2868+76
ADDRGP4 UI_AddBotsMenu_BackEvent
ASGNP4
line 535
;535:	addBotsMenuInfo.back.generic.x			= 320-128;
ADDRGP4 addBotsMenuInfo+2868+28
CNSTI4 192
ASGNI4
line 536
;536:	addBotsMenuInfo.back.generic.y			= 256+128-64;
ADDRGP4 addBotsMenuInfo+2868+32
CNSTI4 320
ASGNI4
line 537
;537:	addBotsMenuInfo.back.width				= 128;
ADDRGP4 addBotsMenuInfo+2868+104
CNSTI4 128
ASGNI4
line 538
;538:	addBotsMenuInfo.back.height				= 64;
ADDRGP4 addBotsMenuInfo+2868+108
CNSTI4 64
ASGNI4
line 539
;539:	addBotsMenuInfo.back.focuspic			= ART_BACK1;
ADDRGP4 addBotsMenuInfo+2868+88
ADDRGP4 $452
ASGNP4
line 541
;540:
;541:	addBotsMenuInfo.icon_hilite.generic.type		= MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+2636
CNSTI4 6
ASGNI4
line 542
;542:	addBotsMenuInfo.icon_hilite.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 addBotsMenuInfo+2636+72
CNSTU4 16452
ASGNU4
line 543
;543:	addBotsMenuInfo.icon_hilite.generic.x			= 190 - 64 - 15; //320 + 128 - 15;
ADDRGP4 addBotsMenuInfo+2636+28
CNSTI4 111
ASGNI4
line 544
;544:	addBotsMenuInfo.icon_hilite.generic.y			= 240 - 32 - 16;
ADDRGP4 addBotsMenuInfo+2636+32
CNSTI4 192
ASGNI4
line 545
;545:	addBotsMenuInfo.icon_hilite.width				= 128;
ADDRGP4 addBotsMenuInfo+2636+104
CNSTI4 128
ASGNI4
line 546
;546:	addBotsMenuInfo.icon_hilite.height				= 128;
ADDRGP4 addBotsMenuInfo+2636+108
CNSTI4 128
ASGNI4
line 547
;547:	addBotsMenuInfo.icon_hilite.focuspic			= ART_SELECT;
ADDRGP4 addBotsMenuInfo+2636+88
ADDRGP4 $466
ASGNP4
line 548
;548:	addBotsMenuInfo.icon_hilite.focuscolor			= color_realred;
ADDRGP4 addBotsMenuInfo+2636+112
ADDRGP4 color_realred
ASGNP4
line 550
;549:
;550:	addBotsMenuInfo.icon.generic.type		= MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+2520
CNSTI4 6
ASGNI4
line 551
;551:	addBotsMenuInfo.icon.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 addBotsMenuInfo+2520+72
CNSTU4 16388
ASGNU4
line 552
;552:	addBotsMenuInfo.icon.generic.name		= addBotsMenuInfo.boticon;
ADDRGP4 addBotsMenuInfo+2520+4
ADDRGP4 addBotsMenuInfo+11416
ASGNP4
line 553
;553:	addBotsMenuInfo.icon.generic.x			= 190 - 64; //320 + 128;
ADDRGP4 addBotsMenuInfo+2520+28
CNSTI4 126
ASGNI4
line 554
;554:	addBotsMenuInfo.icon.generic.y			= 240 - 32;
ADDRGP4 addBotsMenuInfo+2520+32
CNSTI4 208
ASGNI4
line 555
;555:	addBotsMenuInfo.icon.width				= 64;
ADDRGP4 addBotsMenuInfo+2520+104
CNSTI4 64
ASGNI4
line 556
;556:	addBotsMenuInfo.icon.height				= 64;
ADDRGP4 addBotsMenuInfo+2520+108
CNSTI4 64
ASGNI4
line 558
;557:
;558:	addBotsMenuInfo.baseBotNum = 0;
ADDRGP4 addBotsMenuInfo+2992
CNSTI4 0
ASGNI4
line 559
;559:	addBotsMenuInfo.selectedBotNum = 0;
ADDRGP4 addBotsMenuInfo+2996
CNSTI4 0
ASGNI4
line 560
;560:	addBotsMenuInfo.bots[0].color = color_white;
ADDRGP4 addBotsMenuInfo+1424+100
ADDRGP4 color_white
ASGNP4
line 562
;561:
;562:	UI_AddBotsMenu_GetSortedBotNums();
ADDRGP4 UI_AddBotsMenu_GetSortedBotNums
CALLV
pop
line 563
;563:	UI_AddBotsMenu_SetBotNames();
ADDRGP4 UI_AddBotsMenu_SetBotNames
CALLV
pop
line 564
;564:	AddBots_SetBotIcon();
ADDRGP4 AddBots_SetBotIcon
CALLV
pop
line 566
;565:
;566:	Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.arrows );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 568
;567:
;568:	Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.up );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1192
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 569
;569:	Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.down );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1308
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 570
;570:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $493
JUMPV
LABELV $490
line 571
;571:		Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.bots[n] );
ADDRGP4 addBotsMenuInfo
ARGP4
CNSTI4 104
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+1424
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 572
;572:	}
LABELV $491
line 570
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $493
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $490
line 573
;573:	Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.skill );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+2152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 574
;574:	Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.skill_slider );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+2284
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 575
;575:	Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.team );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+2388
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 576
;576:	Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.go );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+2752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 577
;577:	Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.back );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+2868
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 578
;578:	Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.icon_hilite );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+2636
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 579
;579:	Menu_AddItem( &addBotsMenuInfo.menu, &addBotsMenuInfo.icon );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+2520
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 580
;580:}
LABELV $237
endproc UI_AddBotsMenu_Init 1060 12
export UI_AddBots_Cache
proc UI_AddBots_Cache 0 4
line 588
;581:
;582:
;583:/*
;584:=================
;585:UI_AddBots_Cache
;586:=================
;587:*/
;588:void UI_AddBots_Cache( void ) {
line 589
;589:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $435
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 590
;590:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $452
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 591
;591:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $414
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 592
;592:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $431
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 593
;593:	trap_R_RegisterShaderNoMip( ART_BACKGROUND );
ADDRGP4 $203
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 594
;594:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $254
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 595
;595:	trap_R_RegisterShaderNoMip( ART_ARROWUP );
ADDRGP4 $282
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 596
;596:	trap_R_RegisterShaderNoMip( ART_ARROWDOWN );
ADDRGP4 $300
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 597
;597:	trap_R_RegisterShaderNoMip( ART_SELECT);
ADDRGP4 $466
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 598
;598:}
LABELV $502
endproc UI_AddBots_Cache 0 4
export UI_AddBotsMenu
proc UI_AddBotsMenu 0 4
line 606
;599:
;600:
;601:/*
;602:=================
;603:UI_AddBotsMenu
;604:=================
;605:*/
;606:void UI_AddBotsMenu( void ) {
line 607
;607:	UI_AddBotsMenu_Init();
ADDRGP4 UI_AddBotsMenu_Init
CALLV
pop
line 608
;608:	UI_PushMenu( &addBotsMenuInfo.menu );
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 609
;609:}
LABELV $503
endproc UI_AddBotsMenu 0 4
bss
align 4
LABELV addBotsMenuInfo
skip 11484
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
LABELV $466
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
LABELV $435
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
LABELV $414
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
LABELV $398
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
byte 1 176
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $392
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $350
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $339
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
LABELV $333
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $300
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
LABELV $282
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
LABELV $254
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
LABELV $244
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
LABELV $236
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $235
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $234
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $233
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
LABELV $232
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
LABELV $231
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
LABELV $230
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
LABELV $229
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
LABELV $228
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
LABELV $227
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
LABELV $226
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
LABELV $225
byte 1 208
byte 1 157
byte 1 209
byte 1 131
byte 1 208
byte 1 177
byte 1 0
align 1
LABELV $224
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $223
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
LABELV $222
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
LABELV $221
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
LABELV $220
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
LABELV $219
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $218
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $217
byte 1 69
byte 1 97
byte 1 115
byte 1 121
byte 1 0
align 1
LABELV $216
byte 1 78
byte 1 111
byte 1 111
byte 1 98
byte 1 0
align 1
LABELV $215
byte 1 37
byte 1 52
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $203
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
LABELV $202
byte 1 208
byte 1 148
byte 1 208
byte 1 158
byte 1 208
byte 1 145
byte 1 208
byte 1 144
byte 1 208
byte 1 146
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 32
byte 1 208
byte 1 145
byte 1 208
byte 1 158
byte 1 208
byte 1 162
byte 1 208
byte 1 158
byte 1 208
byte 1 146
byte 1 0
align 1
LABELV $198
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $156
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $147
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $146
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $111
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 52
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $85
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
