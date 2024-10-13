data
align 4
LABELV configfiles
address $81
address $82
address $83
address $84
address $85
address $86
address $87
address $88
address $89
address $90
address $91
address $92
address $93
address $94
address $95
address $96
address $97
address $98
byte 4 0
code
proc LoadConfig_KnownIdConfig 8 8
file "../../../code/q3_ui/ui_loadconfig.c"
line 100
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:LOAD CONFIG MENU
;7:
;8:=============================================================================
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
;19:#define ART_FIGHT0			"menu/art/load_0"
;20:#define ART_FIGHT1			"menu/art/load_1"
;21:#define ART_FRAMEL			"menu/art/frame2_l"
;22:#define ART_FRAMER			"menu/art/frame1_r"
;23:#define ART_ARROWS			"menu/art/arrows_horz_0"
;24:#define ART_ARROWLEFT		"menu/art/arrows_horz_left"
;25:#define ART_ARROWRIGHT		"menu/art/arrows_horz_right"
;26:#define ART_SAVE0			"menu/art/save_0"
;27:#define ART_SAVE1			"menu/art/save_1"
;28:#define ART_BACKGROUND		"menu/art/frame1_l"
;29:
;30:#define MAX_CONFIGS			2048
;31:#define NAMEBUFSIZE			( MAX_CONFIGS * 16 )
;32:
;33:#define ID_BACK				10
;34:#define ID_GO				11
;35:#define ID_LIST				12
;36:#define ID_LEFT				13
;37:#define ID_RIGHT			14
;38:#define ID_SHOWID			15
;39:#define ID_EXECFORCED		16
;40:
;41:#define ARROWS_WIDTH		128
;42:#define ARROWS_HEIGHT		48
;43:
;44:#define FILENAME_Y			432
;45:
;46:typedef struct {
;47:	menuframework_s	menu;
;48:
;49:	menutext_s		banner;
;50:	menubitmap_s	framel;
;51:	menubitmap_s	framer;
;52:
;53:	menuobject_s		list;
;54:
;55:	menufield_s		savename;
;56:
;57:	menubitmap_s	arrows;
;58:	menubitmap_s	left;
;59:	menubitmap_s	right;
;60:	menubitmap_s	back;
;61:	menubitmap_s	go;
;62:	menuradiobutton_s showid;
;63:	menuradiobutton_s force_exec;
;64:
;65:	char			names[NAMEBUFSIZE];
;66:	char*			configlist[MAX_CONFIGS];
;67:	char			configname[MAX_QPATH];
;68:	qboolean 		load;
;69:	qboolean 		loaderror;
;70:	qboolean		noFilesFound;
;71:
;72:	configCallback	callbackAction;
;73:
;74:	int statusbar_time;
;75:	char status_text[MAX_STATUSBAR_TEXT];
;76:} configs_t;
;77:
;78:static configs_t	s_configs;
;79:
;80:
;81:
;82:// known config files that may cause saving problems
;83:static const char* configfiles[] = {
;84:
;85:	"q3config", "default", "autoexec", "uiautoexec", "q3config_server", "screen", "voice", "maps_ctf", "maps_dd", "maps_dom",
;86:	"maps_dm", "maps_elimination", "maps_harvester", "maps_obelisk", "maps_oneflag", "maps_tdm", "maps_tourney", "maps_lms",
;87:
;88:	0
;89:};
;90:
;91:
;92:
;93:
;94:/*
;95:===============
;96:UI_LoadConfig_SaveEvent
;97:===============
;98:*/
;99:static qboolean LoadConfig_KnownIdConfig(const char* filename)
;100:{
line 103
;101:	int i;
;102:
;103:	for(i = 0; configfiles[i]; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $100
line 104
;104:	{
line 105
;105:		if (!Q_stricmp(filename, configfiles[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 configfiles
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $104
line 106
;106:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $99
JUMPV
LABELV $104
line 107
;107:	}
LABELV $101
line 103
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $103
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 configfiles
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $100
line 109
;108:
;109:	return qfalse;
CNSTI4 0
RETI4
LABELV $99
endproc LoadConfig_KnownIdConfig 8 8
export SortName
proc SortName 12 8
line 120
;110:}
;111:
;112:
;113:
;114:/*
;115:=============
;116:SortRanks
;117:=============
;118:*/
;119:int QDECL SortName( const void *a, const void *b )
;120:{
line 123
;121:	char* first, *second;
;122:
;123:	first = *(char**)a;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 124
;124:	second = *(char**)b;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRP4
ASGNP4
line 125
;125:	return Q_stricmp(first,second);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $106
endproc SortName 12 8
export LoadConfig_SetStatusText
proc LoadConfig_SetStatusText 0 12
line 135
;126:}
;127:
;128:
;129:/*
;130:=============
;131:LoadConfig_SetStatusText
;132:=============
;133:*/
;134:void LoadConfig_SetStatusText(const char* text)
;135:{
line 136
;136:	if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $108
line 137
;137:		Q_strncpyz(s_configs.status_text, text, MAX_STATUSBAR_TEXT);
ADDRGP4 s_configs+44048
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 120
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 138
;138:		s_configs.statusbar_time = uis.realtime + STATUSBAR_FADETIME;
ADDRGP4 s_configs+44044
ADDRGP4 uis+4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 139
;139:	}
ADDRGP4 $109
JUMPV
LABELV $108
line 140
;140:	else {
line 141
;141:		s_configs.status_text[0] = '\0';
ADDRGP4 s_configs+44048
CNSTI1 0
ASGNI1
line 142
;142:		s_configs.statusbar_time = 0;
ADDRGP4 s_configs+44044
CNSTI4 0
ASGNI4
line 143
;143:	}
LABELV $109
line 144
;144:}
LABELV $107
endproc LoadConfig_SetStatusText 0 12
proc LoadConfig_LoadFileNames 56 16
line 154
;145:
;146:
;147:
;148:/*
;149:===============
;150:LoadConfig_LoadFileNames
;151:===============
;152:*/
;153:static void LoadConfig_LoadFileNames( void )
;154:{
line 163
;155:	int i;
;156:	int		len, filelen;
;157:	char	*configname, *next;
;158:	int 	numitems;
;159:	int 	count;
;160:	fileHandle_t	handle;
;161:	qboolean showid;
;162:
;163:	showid = s_configs.showid.curvalue;
ADDRLP4 32
ADDRGP4 s_configs+2812+88
INDIRI4
ASGNI4
line 165
;164:
;165:	count = trap_FS_GetFileList( "", ".cfg", s_configs.names, NAMEBUFSIZE );
ADDRGP4 $118
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 s_configs+3004
ARGP4
CNSTI4 32768
ARGI4
ADDRLP4 36
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
line 166
;166:	next = s_configs.names;
ADDRLP4 16
ADDRGP4 s_configs+3004
ASGNP4
line 167
;167:	numitems = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 168
;168:	s_configs.loaderror = qfalse;
ADDRGP4 s_configs+44032
CNSTI4 0
ASGNI4
line 169
;169:	for ( i = 0; i < count; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $123
line 170
;170:	{
line 171
;171:		configname = next;
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 173
;172:
;173:		len = strlen( configname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ASGNI4
line 174
;174:		next = configname + len + 1;
ADDRLP4 16
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 1
ADDP4
ASGNP4
line 176
;175:
;176:		filelen = trap_FS_FOpenFile(configname, &handle, FS_READ);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 44
INDIRI4
ASGNI4
line 177
;177:		if (filelen <= 0) {
ADDRLP4 20
INDIRI4
CNSTI4 0
GTI4 $127
line 178
;178:			s_configs.loaderror = qtrue;
ADDRGP4 s_configs+44032
CNSTI4 1
ASGNI4
line 179
;179:			continue;
ADDRGP4 $124
JUMPV
LABELV $127
line 182
;180:		}
;181:
;182:		trap_FS_FCloseFile(handle);
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 185
;183:
;184:		// strip extension
;185:		if (!Q_stricmp(configname +  len - 4,".cfg"))
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $130
line 186
;186:			configname[len-4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $130
line 188
;187:
;188:		Q_strupr(configname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 190
;189:
;190:		if (!showid && LoadConfig_KnownIdConfig(configname))
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $132
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 LoadConfig_KnownIdConfig
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $132
line 191
;191:		{
line 192
;192:			continue;
ADDRGP4 $124
JUMPV
LABELV $132
line 195
;193:		}
;194:
;195:		s_configs.list.itemnames[numitems] = configname;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_configs+1412+428
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 197
;196:
;197:		numitems++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 198
;198:		if (numitems == MAX_CONFIGS)
ADDRLP4 8
INDIRI4
CNSTI4 2048
NEI4 $136
line 199
;199:			break;
ADDRGP4 $125
JUMPV
LABELV $136
line 200
;200:	}
LABELV $124
line 169
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $126
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $123
LABELV $125
line 203
;201:
;202:
;203:	if (!numitems) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $138
line 204
;204:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $140
line 205
;205:		strcpy(s_configs.names,"No Files Found.");
ADDRGP4 s_configs+3004
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 206
;206:		}
LABELV $140
line 207
;207:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $145
line 208
;208:		strcpy(s_configs.names,"Файлы не найдены.");
ADDRGP4 s_configs+3004
ARGP4
ADDRGP4 $149
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 209
;209:		}
LABELV $145
line 210
;210:		numitems = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 212
;211:
;212:        s_configs.noFilesFound = qtrue;
ADDRGP4 s_configs+44036
CNSTI4 1
ASGNI4
line 215
;213:
;214:		//degenerate case, not selectable
;215:		if (s_configs.load)
ADDRGP4 s_configs+44028
INDIRI4
CNSTI4 0
EQI4 $151
line 216
;216:			s_configs.go.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 40
ADDRGP4 s_configs+2696+72
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
LABELV $151
line 217
;217:	}
LABELV $138
line 219
;218:
;219:	s_configs.list.numitems = numitems;
ADDRGP4 s_configs+1412+420
ADDRLP4 8
INDIRI4
ASGNI4
line 222
;220:
;221:	// sort the list
;222:	qsort(s_configs.configlist, numitems, sizeof(s_configs.configlist[0]), SortName);
ADDRGP4 s_configs+35772
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortName
ARGP4
ADDRGP4 qsort
CALLV
pop
line 223
;223:}
LABELV $115
endproc LoadConfig_LoadFileNames 56 16
proc LoadConfig_DoSave 8 8
line 233
;224:
;225:
;226:
;227:/*
;228:===============
;229:LoadConfig_DoSave
;230:===============
;231:*/
;232:static void LoadConfig_DoSave( qboolean dosave )
;233:{
line 234
;234:	if (!dosave)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $161
line 235
;235:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 237
;236:
;237:	if (s_configs.callbackAction) {
ADDRGP4 s_configs+44040
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $163
line 238
;238:		s_configs.callbackAction(s_configs.configname);
ADDRGP4 s_configs+43964
ARGP4
ADDRGP4 s_configs+44040
INDIRP4
CALLI4
pop
line 239
;239:		return;
ADDRGP4 $160
JUMPV
LABELV $163
line 243
;240:	}
;241:
;242:	// otherwise do default action, save system config
;243:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "writeconfig %s\n", s_configs.configname ) );
ADDRGP4 $168
ARGP4
ADDRGP4 s_configs+43964
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 244
;244:	LoadConfig_SetStatusText(va("%s saved!", s_configs.configname));
ADDRGP4 $170
ARGP4
ADDRGP4 s_configs+43964
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 LoadConfig_SetStatusText
CALLV
pop
line 245
;245:}
LABELV $160
endproc LoadConfig_DoSave 8 8
proc LoadConfig_SaveCheck 12 12
line 255
;246:
;247:
;248:
;249:/*
;250:===============
;251:LoadConfig_SaveCheck
;252:===============
;253:*/
;254:static void LoadConfig_SaveCheck( const char* configname )
;255:{
line 259
;256:	fileHandle_t 	handle;
;257:	int 			len;
;258:
;259:	len = trap_FS_FOpenFile(s_configs.configname, &handle, FS_READ);
ADDRGP4 s_configs+43964
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 261
;260:
;261:	if (len < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $174
line 262
;262:		LoadConfig_DoSave(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 LoadConfig_DoSave
CALLV
pop
ADDRGP4 $175
JUMPV
LABELV $174
line 263
;263:	else {
line 264
;264:		trap_FS_FCloseFile(handle);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 265
;265:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $176
line 266
;266:		UI_ConfirmMenu("Overwrite?", 0, LoadConfig_DoSave);
ADDRGP4 $179
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 LoadConfig_DoSave
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 267
;267:		}
LABELV $176
line 268
;268:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $180
line 269
;269:		UI_ConfirmMenu("Перезаписать?", 0, LoadConfig_DoSave);
ADDRGP4 $183
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 LoadConfig_DoSave
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 270
;270:		}
LABELV $180
line 271
;271:	}
LABELV $175
line 272
;272:}
LABELV $172
endproc LoadConfig_SaveCheck 12 12
proc LoadConfig_Go 8 8
line 283
;273:
;274:
;275:
;276:
;277:/*
;278:===============
;279:LoadConfig_Go
;280:===============
;281:*/
;282:static void LoadConfig_Go( void )
;283:{
line 284
;284:	if( !s_configs.configname[0] ) {
ADDRGP4 s_configs+43964
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $185
line 285
;285:		return;
ADDRGP4 $184
JUMPV
LABELV $185
line 288
;286:	}
;287:
;288:	if (s_configs.load) {
ADDRGP4 s_configs+44028
INDIRI4
CNSTI4 0
EQI4 $188
line 289
;289:		if (s_configs.callbackAction && !s_configs.force_exec.curvalue) {
ADDRGP4 s_configs+44040
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $191
ADDRGP4 s_configs+2908+88
INDIRI4
CNSTI4 0
NEI4 $191
line 290
;290:			s_configs.callbackAction(s_configs.configname);
ADDRGP4 s_configs+43964
ARGP4
ADDRGP4 s_configs+44040
INDIRP4
CALLI4
pop
line 291
;291:			return;
ADDRGP4 $184
JUMPV
LABELV $191
line 295
;292:		}
;293:
;294:		// otherwise do the default action
;295:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "exec %s\n", s_configs.configname) );
ADDRGP4 $198
ARGP4
ADDRGP4 s_configs+43964
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 296
;296:		LoadConfig_SetStatusText(va("%s executed", s_configs.configname));
ADDRGP4 $200
ARGP4
ADDRGP4 s_configs+43964
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 LoadConfig_SetStatusText
CALLV
pop
line 297
;297:	}
ADDRGP4 $189
JUMPV
LABELV $188
line 298
;298:	else {
line 299
;299:		LoadConfig_SaveCheck(s_configs.configname);
ADDRGP4 s_configs+43964
ARGP4
ADDRGP4 LoadConfig_SaveCheck
CALLV
pop
line 300
;300:	}
LABELV $189
line 301
;301:}
LABELV $184
endproc LoadConfig_Go 8 8
proc LoadConfig_MenuEvent 16 8
line 311
;302:
;303:
;304:
;305:
;306:/*
;307:===============
;308:LoadConfig_MenuEvent
;309:===============
;310:*/
;311:static void LoadConfig_MenuEvent( void *ptr, int event ) {
line 312
;312:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $204
line 313
;313:		return;
ADDRGP4 $203
JUMPV
LABELV $204
line 316
;314:	}
;315:
;316:	switch ( ((menucommon_s*)ptr)->id ) {
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
LTI4 $206
ADDRLP4 0
INDIRI4
CNSTI4 15
GTI4 $206
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $252-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $252
address $226
address $209
address $236
address $227
address $229
address $231
code
LABELV $209
line 319
;317:	case ID_GO:
;318:		// confirm overwrite if save
;319:		if (s_configs.load) {
ADDRGP4 s_configs+44028
INDIRI4
CNSTI4 0
EQI4 $210
line 320
;320:			COM_StripExtensionOld(s_configs.configlist[s_configs.list.curvalue], s_configs.configname);
ADDRGP4 s_configs+1412+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_configs+35772
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_configs+43964
ARGP4
ADDRGP4 COM_StripExtensionOld
CALLI4
pop
line 321
;321:		}
ADDRGP4 $211
JUMPV
LABELV $210
line 322
;322:		else {
line 323
;323:			COM_StripExtensionOld(s_configs.savename.field.buffer, s_configs.configname);
ADDRGP4 s_configs+1868+88+12
ARGP4
ADDRGP4 s_configs+43964
ARGP4
ADDRGP4 COM_StripExtensionOld
CALLI4
pop
line 324
;324:		}
LABELV $211
line 325
;325:		if (s_configs.configname[0])
ADDRGP4 s_configs+43964
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $221
line 326
;326:			strcat(s_configs.configname, ".cfg");
ADDRGP4 s_configs+43964
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $221
line 328
;327:
;328:		Q_strlwr(s_configs.configname);	
ADDRGP4 s_configs+43964
ARGP4
ADDRGP4 Q_strlwr
CALLP4
pop
line 329
;329:		LoadConfig_Go();
ADDRGP4 LoadConfig_Go
CALLV
pop
line 330
;330:		break;
ADDRGP4 $207
JUMPV
LABELV $226
line 333
;331:
;332:	case ID_BACK:
;333:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 334
;334:		break;
ADDRGP4 $207
JUMPV
LABELV $227
line 337
;335:
;336:	case ID_LEFT:
;337:		UIObject_Key( &s_configs.list, K_LEFTARROW );
ADDRGP4 s_configs+1412
ARGP4
CNSTI4 134
ARGI4
ADDRGP4 UIObject_Key
CALLI4
pop
line 338
;338:		break;
ADDRGP4 $207
JUMPV
LABELV $229
line 341
;339:
;340:	case ID_RIGHT:
;341:		UIObject_Key( &s_configs.list, K_RIGHTARROW );
ADDRGP4 s_configs+1412
ARGP4
CNSTI4 135
ARGI4
ADDRGP4 UIObject_Key
CALLI4
pop
line 342
;342:		break;
ADDRGP4 $207
JUMPV
LABELV $231
line 345
;343:
;344:	case ID_SHOWID:
;345:		trap_Cvar_SetValue("uie_config_showid", s_configs.showid.curvalue);
ADDRGP4 $232
ARGP4
ADDRGP4 s_configs+2812+88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 346
;346:		LoadConfig_LoadFileNames();
ADDRGP4 LoadConfig_LoadFileNames
CALLV
pop
line 347
;347:		UIObject_Init(&s_configs.list);
ADDRGP4 s_configs+1412
ARGP4
ADDRGP4 UIObject_Init
CALLV
pop
line 348
;348:		break;
ADDRGP4 $207
JUMPV
LABELV $236
line 351
;349:
;350:	case ID_LIST:
;351:		if (s_configs.load) {
ADDRGP4 s_configs+44028
INDIRI4
CNSTI4 0
EQI4 $237
line 352
;352:			LoadConfig_Go();
ADDRGP4 LoadConfig_Go
CALLV
pop
line 353
;353:		}
ADDRGP4 $207
JUMPV
LABELV $237
line 354
;354:		else {
line 357
;355:			const char* str;
;356:
;357:			str = s_configs.list.itemnames[s_configs.list.curvalue];
ADDRLP4 8
ADDRGP4 s_configs+1412+416
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_configs+1412+428
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 358
;358:			strcpy(s_configs.savename.field.buffer, str);
ADDRGP4 s_configs+1868+88+12
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 359
;359:			s_configs.savename.field.scroll = 0;
ADDRGP4 s_configs+1868+88+4
CNSTI4 0
ASGNI4
line 360
;360:			s_configs.savename.field.cursor = strlen(str);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 s_configs+1868+88
ADDRLP4 12
INDIRI4
ASGNI4
line 361
;361:		}
line 362
;362:		break;
LABELV $206
LABELV $207
line 364
;363:	}
;364:}
LABELV $203
endproc LoadConfig_MenuEvent 16 8
proc UI_SaveConfigMenu_SavenameDraw 40 20
line 374
;365:
;366:
;367:
;368:
;369:/*
;370:===============
;371:UI_SaveConfigMenu_SavenameDraw
;372:===============
;373:*/
;374:static void UI_SaveConfigMenu_SavenameDraw( void *self ) {
line 380
;375:	menufield_s		*f;
;376:	int				style;
;377:	float			*color;
;378:	vec4_t			fade;
;379:
;380:	f = (menufield_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 382
;381:
;382:	if( f == Menu_ItemAtCursor( &s_configs.menu ) ) {
ADDRGP4 s_configs
ARGP4
ADDRLP4 28
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRP4
CVPU4 4
NEU4 $255
line 383
;383:		style = UI_LEFT|UI_PULSE|UI_SMALLFONT;
ADDRLP4 20
CNSTI4 16400
ASGNI4
line 384
;384:		color = text_color_highlight;
ADDRLP4 24
ADDRGP4 text_color_highlight
ASGNP4
line 385
;385:	}
ADDRGP4 $256
JUMPV
LABELV $255
line 386
;386:	else {
line 387
;387:		style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 20
CNSTI4 16
ASGNI4
line 388
;388:		color = colorRed;
ADDRLP4 24
ADDRGP4 colorRed
ASGNP4
line 389
;389:	}
LABELV $256
line 391
;390:
;391:	fade[0] = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 392
;392:	fade[1] = 1.0;
ADDRLP4 4+4
CNSTF4 1065353216
ASGNF4
line 393
;393:	fade[2] = 1.0;
ADDRLP4 4+8
CNSTF4 1065353216
ASGNF4
line 394
;394:	fade[3] = 0.8;
ADDRLP4 4+12
CNSTF4 1061997773
ASGNF4
line 396
;395:
;396:	trap_R_SetColor(fade);
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 397
;397:	UI_DrawNamedPic(320 - 120, FILENAME_Y - 12, 80, SMALLCHAR_HEIGHT + 24, ART_FRAMEL);
CNSTF4 1128792064
ARGF4
CNSTF4 1137836032
ARGF4
CNSTF4 1117782016
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 24
ADDI4
CVIF4 4
ARGF4
ADDRGP4 $261
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 398
;398:	UI_DrawNamedPic(320 + 40, FILENAME_Y - 12, 80, SMALLCHAR_HEIGHT + 24, ART_FRAMER);
CNSTF4 1135869952
ARGF4
CNSTF4 1137836032
ARGF4
CNSTF4 1117782016
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 24
ADDI4
CVIF4 4
ARGF4
ADDRGP4 $263
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 399
;399:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 401
;400:
;401:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $264
line 402
;402:	UI_DrawString( 320, FILENAME_Y - 36, "Enter filename:", UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
CNSTI4 396
ARGI4
ADDRGP4 $267
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 403
;403:	}
LABELV $264
line 404
;404:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $268
line 405
;405:	UI_DrawString( 320, FILENAME_Y - 36, "Введите имя файла:", UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
CNSTI4 396
ARGI4
ADDRGP4 $271
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 406
;406:	}
LABELV $268
line 407
;407:	UI_FillRect( f->generic.x, f->generic.y, f->field.widthInChars*SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, colorBlack );
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CVIF4 4
ARGF4
ADDRGP4 cl_smallcharheight+12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 408
;408:	MField_Draw( &f->field, f->generic.x, f->generic.y, style, color );
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 MField_Draw
CALLV
pop
line 409
;409:}
LABELV $254
endproc UI_SaveConfigMenu_SavenameDraw 40 20
proc LoadConfig_MenuDraw 20 20
line 420
;410:
;411:
;412:
;413:
;414:/*
;415:=================
;416:LoadConfig_MenuDraw
;417:=================
;418:*/
;419:static void LoadConfig_MenuDraw(void)
;420:{
line 424
;421:	float f;
;422:	vec4_t fadecol;
;423:
;424:	if (uis.realtime < s_configs.statusbar_time)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 s_configs+44044
INDIRI4
GEI4 $275
line 425
;425:	{
line 426
;426:		f = (s_configs.statusbar_time - uis.realtime);
ADDRLP4 0
ADDRGP4 s_configs+44044
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 427
;427:		f /= STATUSBAR_FADETIME;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1153138688
DIVF4
ASGNF4
line 429
;428:
;429:		fadecol[0] = f;
ADDRLP4 4
ADDRLP4 0
INDIRF4
ASGNF4
line 430
;430:		fadecol[1] = f;
ADDRLP4 4+4
ADDRLP4 0
INDIRF4
ASGNF4
line 431
;431:		fadecol[2] = f;
ADDRLP4 4+8
ADDRLP4 0
INDIRF4
ASGNF4
line 432
;432:		fadecol[3] = 1.0;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 434
;433:
;434:		UI_DrawString(320, 64, s_configs.status_text, UI_CENTER|UI_SMALLFONT, fadecol);
CNSTI4 320
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 s_configs+44048
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 435
;435:	}
LABELV $275
line 438
;436:
;437:	// draw the controls
;438:	Menu_Draw(&s_configs.menu);
ADDRGP4 s_configs
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 439
;439:}
LABELV $274
endproc LoadConfig_MenuDraw 20 20
bss
align 1
LABELV $286
skip 20
code
proc LoadConfig_MenuInit 12 12
line 450
;440:
;441:
;442:
;443:
;444:
;445:/*
;446:===============
;447:LoadConfig_MenuInit
;448:===============
;449:*/
;450:static void LoadConfig_MenuInit( qboolean load, const char* title,  configCallback callback) {
line 454
;451:	static char titlebuf[20];
;452:	int		i;
;453:
;454:	UI_LoadConfig_Cache();
ADDRGP4 UI_LoadConfig_Cache
CALLV
pop
line 456
;455:
;456:	memset( &s_configs, 0 ,sizeof(configs_t) );
ADDRGP4 s_configs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 44168
ARGI4
ADDRGP4 memset
CALLP4
pop
line 457
;457:	s_configs.menu.wrapAround = qtrue;
ADDRGP4 s_configs+1044
CNSTI4 1
ASGNI4
line 458
;458:	s_configs.menu.native 	  = qfalse;
ADDRGP4 s_configs+1056
CNSTI4 0
ASGNI4
line 459
;459:	s_configs.menu.fullscreen = qtrue;
ADDRGP4 s_configs+1052
CNSTI4 1
ASGNI4
line 460
;460:	s_configs.menu.draw = LoadConfig_MenuDraw;
ADDRGP4 s_configs+1036
ADDRGP4 LoadConfig_MenuDraw
ASGNP4
line 462
;461:
;462:	s_configs.load = load;
ADDRGP4 s_configs+44028
ADDRFP4 0
INDIRI4
ASGNI4
line 463
;463:	s_configs.callbackAction = callback;
ADDRGP4 s_configs+44040
ADDRFP4 8
INDIRP4
ASGNP4
line 465
;464:
;465:	LoadConfig_SetStatusText(NULL);
CNSTP4 0
ARGP4
ADDRGP4 LoadConfig_SetStatusText
CALLV
pop
line 467
;466:
;467:	if (!title) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $293
line 468
;468:		if (load) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $295
line 469
;469:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $297
line 470
;470:			title = "LOAD CONFIG";
ADDRFP4 4
ADDRGP4 $300
ASGNP4
line 471
;471:			}
LABELV $297
line 472
;472:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $296
line 473
;473:			title = "ЗАГРУЗИТЬ ФАЙЛ";
ADDRFP4 4
ADDRGP4 $304
ASGNP4
line 474
;474:			}
line 475
;475:		}
ADDRGP4 $296
JUMPV
LABELV $295
line 476
;476:		else {
line 477
;477:			if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $305
line 478
;478:			title = "SAVE CONFIG";
ADDRFP4 4
ADDRGP4 $308
ASGNP4
line 479
;479:			}
LABELV $305
line 480
;480:			if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $309
line 481
;481:			title = "СОХРАНИТЬ ФАЙЛ";
ADDRFP4 4
ADDRGP4 $312
ASGNP4
line 482
;482:			}
LABELV $309
line 483
;483:		}
LABELV $296
line 484
;484:	}
LABELV $293
line 485
;485:	Q_strncpyz(titlebuf, title, 20);
ADDRGP4 $286
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 487
;486:
;487:	s_configs.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 s_configs+1076
CNSTI4 10
ASGNI4
line 488
;488:	s_configs.banner.generic.x		= 320;
ADDRGP4 s_configs+1076+28
CNSTI4 320
ASGNI4
line 489
;489:	s_configs.banner.generic.y		= 16;
ADDRGP4 s_configs+1076+32
CNSTI4 16
ASGNI4
line 490
;490:	s_configs.banner.string 		= titlebuf;
ADDRGP4 s_configs+1076+88
ADDRGP4 $286
ASGNP4
line 491
;491:	s_configs.banner.color			= color_white;
ADDRGP4 s_configs+1076+100
ADDRGP4 color_white
ASGNP4
line 492
;492:	s_configs.banner.style			= UI_CENTER;
ADDRGP4 s_configs+1076+92
CNSTI4 1
ASGNI4
line 494
;493:
;494:	s_configs.framel.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+1180
CNSTI4 6
ASGNI4
line 495
;495:	s_configs.framel.generic.name	= ART_FRAMEL;
ADDRGP4 s_configs+1180+4
ADDRGP4 $261
ASGNP4
line 496
;496:	s_configs.framel.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_configs+1180+72
CNSTU4 16384
ASGNU4
line 497
;497:	s_configs.framel.generic.x		= 0;
ADDRGP4 s_configs+1180+28
CNSTI4 0
ASGNI4
line 498
;498:	s_configs.framel.generic.y		= 52;
ADDRGP4 s_configs+1180+32
CNSTI4 52
ASGNI4
line 499
;499:	s_configs.framel.width			= 256;
ADDRGP4 s_configs+1180+104
CNSTI4 256
ASGNI4
line 500
;500:	s_configs.framel.height			= 334;
ADDRGP4 s_configs+1180+108
CNSTI4 334
ASGNI4
line 502
;501:
;502:	s_configs.framer.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+1296
CNSTI4 6
ASGNI4
line 503
;503:	s_configs.framer.generic.name	= ART_FRAMER;
ADDRGP4 s_configs+1296+4
ADDRGP4 $263
ASGNP4
line 504
;504:	s_configs.framer.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_configs+1296+72
CNSTU4 16384
ASGNU4
line 505
;505:	s_configs.framer.generic.x		= 376;
ADDRGP4 s_configs+1296+28
CNSTI4 376
ASGNI4
line 506
;506:	s_configs.framer.generic.y		= 52;
ADDRGP4 s_configs+1296+32
CNSTI4 52
ASGNI4
line 507
;507:	s_configs.framer.width			= 256;
ADDRGP4 s_configs+1296+104
CNSTI4 256
ASGNI4
line 508
;508:	s_configs.framer.height			= 334;
ADDRGP4 s_configs+1296+108
CNSTI4 334
ASGNI4
line 510
;509:
;510:	s_configs.arrows.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+2232
CNSTI4 6
ASGNI4
line 511
;511:	s_configs.arrows.generic.name	= ART_ARROWS;
ADDRGP4 s_configs+2232+4
ADDRGP4 $353
ASGNP4
line 512
;512:	s_configs.arrows.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_configs+2232+72
CNSTU4 16384
ASGNU4
line 513
;513:	s_configs.arrows.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_configs+2232+28
CNSTI4 256
ASGNI4
line 514
;514:	s_configs.arrows.generic.y		= 400 - 48;
ADDRGP4 s_configs+2232+32
CNSTI4 352
ASGNI4
line 515
;515:	s_configs.arrows.width			= ARROWS_WIDTH;
ADDRGP4 s_configs+2232+104
CNSTI4 128
ASGNI4
line 516
;516:	s_configs.arrows.height			= ARROWS_HEIGHT;
ADDRGP4 s_configs+2232+108
CNSTI4 48
ASGNI4
line 518
;517:
;518:	s_configs.left.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_configs+2348
CNSTI4 6
ASGNI4
line 519
;519:	s_configs.left.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_configs+2348+72
CNSTU4 2308
ASGNU4
line 520
;520:	s_configs.left.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_configs+2348+28
CNSTI4 256
ASGNI4
line 521
;521:	s_configs.left.generic.y		= 400 - 48;
ADDRGP4 s_configs+2348+32
CNSTI4 352
ASGNI4
line 522
;522:	s_configs.left.generic.id		= ID_LEFT;
ADDRGP4 s_configs+2348+24
CNSTI4 13
ASGNI4
line 523
;523:	s_configs.left.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+2348+76
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 524
;524:	s_configs.left.width			= ARROWS_WIDTH/2;
ADDRGP4 s_configs+2348+104
CNSTI4 64
ASGNI4
line 525
;525:	s_configs.left.height			= ARROWS_HEIGHT;
ADDRGP4 s_configs+2348+108
CNSTI4 48
ASGNI4
line 526
;526:	s_configs.left.focuspic			= ART_ARROWLEFT;
ADDRGP4 s_configs+2348+88
ADDRGP4 $381
ASGNP4
line 528
;527:
;528:	s_configs.right.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_configs+2464
CNSTI4 6
ASGNI4
line 529
;529:	s_configs.right.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_configs+2464+72
CNSTU4 2308
ASGNU4
line 530
;530:	s_configs.right.generic.x		= 320;
ADDRGP4 s_configs+2464+28
CNSTI4 320
ASGNI4
line 531
;531:	s_configs.right.generic.y		= 400 - 48;
ADDRGP4 s_configs+2464+32
CNSTI4 352
ASGNI4
line 532
;532:	s_configs.right.generic.id		= ID_RIGHT;
ADDRGP4 s_configs+2464+24
CNSTI4 14
ASGNI4
line 533
;533:	s_configs.right.generic.callback = LoadConfig_MenuEvent;
ADDRGP4 s_configs+2464+76
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 534
;534:	s_configs.right.width			= ARROWS_WIDTH/2;
ADDRGP4 s_configs+2464+104
CNSTI4 64
ASGNI4
line 535
;535:	s_configs.right.height			= ARROWS_HEIGHT;
ADDRGP4 s_configs+2464+108
CNSTI4 48
ASGNI4
line 536
;536:	s_configs.right.focuspic		= ART_ARROWRIGHT;
ADDRGP4 s_configs+2464+88
ADDRGP4 $399
ASGNP4
line 538
;537:
;538:	s_configs.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_configs+2580
CNSTI4 6
ASGNI4
line 539
;539:	s_configs.back.generic.name		= ART_BACK0;
ADDRGP4 s_configs+2580+4
ADDRGP4 $403
ASGNP4
line 540
;540:	s_configs.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+2580+72
CNSTU4 260
ASGNU4
line 541
;541:	s_configs.back.generic.id		= ID_BACK;
ADDRGP4 s_configs+2580+24
CNSTI4 10
ASGNI4
line 542
;542:	s_configs.back.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+2580+76
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 543
;543:	s_configs.back.generic.x		= 0 - uis.wideoffset;
ADDRGP4 s_configs+2580+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 544
;544:	s_configs.back.generic.y		= 480-64;
ADDRGP4 s_configs+2580+32
CNSTI4 416
ASGNI4
line 545
;545:	s_configs.back.width			= 128;
ADDRGP4 s_configs+2580+104
CNSTI4 128
ASGNI4
line 546
;546:	s_configs.back.height			= 64;
ADDRGP4 s_configs+2580+108
CNSTI4 64
ASGNI4
line 547
;547:	s_configs.back.focuspic			= ART_BACK1;
ADDRGP4 s_configs+2580+88
ADDRGP4 $421
ASGNP4
line 549
;548:
;549:	s_configs.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_configs+2696
CNSTI4 6
ASGNI4
line 550
;550:	s_configs.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+2696+72
CNSTU4 272
ASGNU4
line 551
;551:	s_configs.go.generic.id			= ID_GO;
ADDRGP4 s_configs+2696+24
CNSTI4 11
ASGNI4
line 552
;552:	s_configs.go.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+2696+76
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 553
;553:	s_configs.go.generic.x			= 640 + uis.wideoffset;
ADDRGP4 s_configs+2696+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 554
;554:	s_configs.go.generic.y			= 480-64;
ADDRGP4 s_configs+2696+32
CNSTI4 416
ASGNI4
line 555
;555:	s_configs.go.width				= 128;
ADDRGP4 s_configs+2696+104
CNSTI4 128
ASGNI4
line 556
;556:	s_configs.go.height				= 64;
ADDRGP4 s_configs+2696+108
CNSTI4 64
ASGNI4
line 558
;557:
;558:	if (load) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $438
line 559
;559:		s_configs.go.generic.name		= ART_FIGHT0;
ADDRGP4 s_configs+2696+4
ADDRGP4 $442
ASGNP4
line 560
;560:		s_configs.go.focuspic			= ART_FIGHT1;
ADDRGP4 s_configs+2696+88
ADDRGP4 $445
ASGNP4
line 561
;561:	}
ADDRGP4 $439
JUMPV
LABELV $438
line 562
;562:	else {
line 563
;563:		s_configs.go.generic.name		= ART_SAVE0;
ADDRGP4 s_configs+2696+4
ADDRGP4 $448
ASGNP4
line 564
;564:		s_configs.go.focuspic			= ART_SAVE1;
ADDRGP4 s_configs+2696+88
ADDRGP4 $451
ASGNP4
line 565
;565:	}
LABELV $439
line 567
;566:
;567:	s_configs.savename.generic.type		= MTYPE_FIELD;
ADDRGP4 s_configs+1868
CNSTI4 4
ASGNI4
line 568
;568:	s_configs.savename.generic.flags		= QMF_NODEFAULTINIT|QMF_UPPERCASE;
ADDRGP4 s_configs+1868+72
CNSTU4 557056
ASGNU4
line 569
;569:	s_configs.savename.generic.ownerdraw	= UI_SaveConfigMenu_SavenameDraw;
ADDRGP4 s_configs+1868+84
ADDRGP4 UI_SaveConfigMenu_SavenameDraw
ASGNP4
line 570
;570:	s_configs.savename.field.widthInChars	= 20;
ADDRGP4 s_configs+1868+88+8
CNSTI4 20
ASGNI4
line 571
;571:	s_configs.savename.field.maxchars		= 20;
ADDRGP4 s_configs+1868+88+268
CNSTI4 20
ASGNI4
line 572
;572:	s_configs.savename.generic.x			= 240;
ADDRGP4 s_configs+1868+28
CNSTI4 240
ASGNI4
line 573
;573:	s_configs.savename.generic.y			= FILENAME_Y;
ADDRGP4 s_configs+1868+32
CNSTI4 432
ASGNI4
line 574
;574:	s_configs.savename.generic.left		= 240;
ADDRGP4 s_configs+1868+44
CNSTI4 240
ASGNI4
line 575
;575:	s_configs.savename.generic.top			= FILENAME_Y;
ADDRGP4 s_configs+1868+48
CNSTI4 432
ASGNI4
line 576
;576:	s_configs.savename.generic.right		= 233 + 20*SMALLCHAR_WIDTH;
ADDRGP4 s_configs+1868+52
CNSTI4 20
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
CNSTI4 233
ADDI4
ASGNI4
line 577
;577:	s_configs.savename.generic.bottom		= FILENAME_Y + SMALLCHAR_HEIGHT+2;
ADDRGP4 s_configs+1868+56
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 432
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 579
;578:
;579:	s_configs.showid.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 s_configs+2812
CNSTI4 5
ASGNI4
line 580
;580:	s_configs.showid.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+2812+72
CNSTU4 272
ASGNU4
line 581
;581:	s_configs.showid.generic.id			= ID_SHOWID;
ADDRGP4 s_configs+2812+24
CNSTI4 15
ASGNI4
line 582
;582:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $482
line 583
;583:	s_configs.showid.generic.name		= "QS configs:";
ADDRGP4 s_configs+2812+4
ADDRGP4 $487
ASGNP4
line 584
;584:	}
LABELV $482
line 585
;585:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $488
line 586
;586:	s_configs.showid.generic.name		= "QS файлы:";
ADDRGP4 s_configs+2812+4
ADDRGP4 $493
ASGNP4
line 587
;587:	}
LABELV $488
line 588
;588:	s_configs.showid.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+2812+76
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 589
;589:	s_configs.showid.generic.x			= 640 - 8 * SMALLCHAR_WIDTH;
ADDRGP4 s_configs+2812+28
CNSTI4 640
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 3
LSHI4
SUBI4
ASGNI4
line 590
;590:	s_configs.showid.generic.y			= 480-64 - 32;
ADDRGP4 s_configs+2812+32
CNSTI4 384
ASGNI4
line 591
;591:	s_configs.showid.curvalue 			= trap_Cvar_VariableValue("uie_config_showid");
ADDRGP4 $232
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_configs+2812+88
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 593
;592:
;593:	s_configs.force_exec.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 s_configs+2908
CNSTI4 5
ASGNI4
line 594
;594:	s_configs.force_exec.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+2908+72
CNSTU4 272
ASGNU4
line 595
;595:	s_configs.force_exec.generic.id			= ID_EXECFORCED;
ADDRGP4 s_configs+2908+24
CNSTI4 16
ASGNI4
line 596
;596:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $508
line 597
;597:	s_configs.force_exec.generic.name		= "Force exec:";
ADDRGP4 s_configs+2908+4
ADDRGP4 $513
ASGNP4
line 598
;598:	}
LABELV $508
line 599
;599:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $514
line 600
;600:	s_configs.force_exec.generic.name		= "Принудительный запуск:";
ADDRGP4 s_configs+2908+4
ADDRGP4 $519
ASGNP4
line 601
;601:	}
LABELV $514
line 602
;602:	s_configs.force_exec.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+2908+76
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 603
;603:	s_configs.force_exec.generic.x			= 640 - 8 * SMALLCHAR_WIDTH;
ADDRGP4 s_configs+2908+28
CNSTI4 640
ADDRGP4 cl_smallcharwidth+12
INDIRI4
CNSTI4 3
LSHI4
SUBI4
ASGNI4
line 604
;604:	s_configs.force_exec.generic.y			= 480-64 - 32 + SMALLCHAR_HEIGHT + 2;
ADDRGP4 s_configs+2908+32
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 384
ADDI4
CNSTI4 2
ADDI4
ASGNI4
line 605
;605:	s_configs.force_exec.curvalue 			= qfalse;
ADDRGP4 s_configs+2908+88
CNSTI4 0
ASGNI4
line 608
;606:
;607:	// scan for configs
;608:	s_configs.list.generic.type		= MTYPE_UIOBJECT;
ADDRGP4 s_configs+1412
CNSTI4 11
ASGNI4
line 609
;609:	s_configs.list.generic.flags	= QMF_PULSEIFFOCUS;
ADDRGP4 s_configs+1412+72
CNSTU4 256
ASGNU4
line 610
;610:	s_configs.list.generic.callback	= LoadConfig_MenuEvent;
ADDRGP4 s_configs+1412+76
ADDRGP4 LoadConfig_MenuEvent
ASGNP4
line 611
;611:	s_configs.list.generic.id		= ID_LIST;
ADDRGP4 s_configs+1412+24
CNSTI4 12
ASGNI4
line 612
;612:	s_configs.list.generic.x		= 118;
ADDRGP4 s_configs+1412+28
CNSTI4 118
ASGNI4
line 613
;613:	s_configs.list.generic.y		= 106;
ADDRGP4 s_configs+1412+32
CNSTI4 106
ASGNI4
line 614
;614:	s_configs.list.string			= "";
ADDRGP4 s_configs+1412+112
ADDRGP4 $118
ASGNP4
line 615
;615:	s_configs.list.width			= 48;
ADDRGP4 s_configs+1412+104
CNSTI4 48
ASGNI4
line 616
;616:	s_configs.list.height			= 20;
ADDRGP4 s_configs+1412+108
CNSTI4 20
ASGNI4
line 617
;617:	s_configs.list.itemnames		= (const char **)s_configs.configlist;
ADDRGP4 s_configs+1412+428
ADDRGP4 s_configs+35772
ASGNP4
line 618
;618:	s_configs.list.columns			= 1;
ADDRGP4 s_configs+1412+436
CNSTI4 1
ASGNI4
line 619
;619:	s_configs.list.fontsize			= 1;
ADDRGP4 s_configs+1412+136
CNSTF4 1065353216
ASGNF4
line 620
;620:	s_configs.list.type				= 5;
ADDRGP4 s_configs+1412+96
CNSTI4 5
ASGNI4
line 621
;621:	s_configs.list.styles			= 1;
ADDRGP4 s_configs+1412+120
CNSTI4 1
ASGNI4
line 624
;622:	
;623:
;624:	LoadConfig_LoadFileNames();
ADDRGP4 LoadConfig_LoadFileNames
CALLV
pop
line 625
;625:	if (s_configs.loaderror)
ADDRGP4 s_configs+44032
INDIRI4
CNSTI4 0
EQI4 $558
line 626
;626:		s_configs.showid.generic.flags |= (QMF_GRAYED|QMF_INACTIVE);
ADDRLP4 8
ADDRGP4 s_configs+2812+72
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 24576
BORU4
ASGNU4
LABELV $558
line 628
;627:
;628:	Menu_AddItem( &s_configs.menu, &s_configs.banner );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 629
;629:	Menu_AddItem( &s_configs.menu, &s_configs.framel );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 630
;630:	Menu_AddItem( &s_configs.menu, &s_configs.framer );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 631
;631:	Menu_AddItem( &s_configs.menu, &s_configs.list );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 632
;632:	Menu_AddItem( &s_configs.menu, &s_configs.showid );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+2812
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 633
;633:	Menu_AddItem( &s_configs.menu, &s_configs.arrows );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+2232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 634
;634:	Menu_AddItem( &s_configs.menu, &s_configs.left );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+2348
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 635
;635:	Menu_AddItem( &s_configs.menu, &s_configs.right );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+2464
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 636
;636:	Menu_AddItem( &s_configs.menu, &s_configs.back );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+2580
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 637
;637:	Menu_AddItem( &s_configs.menu, &s_configs.go );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+2696
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 639
;638:
;639:	if (load && callback)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $573
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $573
line 640
;640:		Menu_AddItem( &s_configs.menu, &s_configs.force_exec );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+2908
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $573
line 642
;641:
;642:	if (!load)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $576
line 643
;643:		Menu_AddItem( &s_configs.menu, &s_configs.savename );
ADDRGP4 s_configs
ARGP4
ADDRGP4 s_configs+1868
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $576
line 644
;644:}
LABELV $285
endproc LoadConfig_MenuInit 12 12
export UI_LoadConfig_Cache
proc UI_LoadConfig_Cache 0 4
line 651
;645:
;646:/*
;647:=================
;648:UI_LoadConfig_Cache
;649:=================
;650:*/
;651:void UI_LoadConfig_Cache( void ) {
line 652
;652:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $403
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 653
;653:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $421
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 654
;654:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $442
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 655
;655:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $445
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 656
;656:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $261
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 657
;657:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $263
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 658
;658:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $353
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 659
;659:	trap_R_RegisterShaderNoMip( ART_ARROWLEFT );
ADDRGP4 $381
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 660
;660:	trap_R_RegisterShaderNoMip( ART_ARROWRIGHT );
ADDRGP4 $399
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 661
;661:	trap_R_RegisterShaderNoMip( ART_SAVE0 );
ADDRGP4 $448
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 662
;662:	trap_R_RegisterShaderNoMip( ART_SAVE1 );
ADDRGP4 $451
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 663
;663:	trap_R_RegisterShaderNoMip( ART_BACKGROUND );
ADDRGP4 $580
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 664
;664:}
LABELV $579
endproc UI_LoadConfig_Cache 0 4
export UI_LoadConfigMenu
proc UI_LoadConfigMenu 0 12
line 673
;665:
;666:
;667:/*
;668:===============
;669:UI_LoadConfigMenu
;670:===============
;671:*/
;672:void UI_LoadConfigMenu( void )
;673:{
line 674
;674:	LoadConfig_MenuInit(qtrue, 0, 0);
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 LoadConfig_MenuInit
CALLV
pop
line 675
;675:	UI_PushMenu( &s_configs.menu );
ADDRGP4 s_configs
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 676
;676:}
LABELV $581
endproc UI_LoadConfigMenu 0 12
export UI_SaveConfigMenu
proc UI_SaveConfigMenu 0 12
line 685
;677:
;678:
;679:/*
;680:===============
;681:UI_SaveConfigMenu
;682:===============
;683:*/
;684:void UI_SaveConfigMenu( void )
;685:{
line 686
;686:	LoadConfig_MenuInit(qfalse, 0, 0);
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 LoadConfig_MenuInit
CALLV
pop
line 687
;687:	UI_PushMenu( &s_configs.menu );
ADDRGP4 s_configs
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 688
;688:}
LABELV $582
endproc UI_SaveConfigMenu 0 12
export UI_ConfigMenu
proc UI_ConfigMenu 0 12
line 698
;689:
;690:
;691:
;692:/*
;693:===============
;694:UI_ConfigMenu
;695:===============
;696:*/
;697:void UI_ConfigMenu( const char* title, qboolean load, configCallback callback)
;698:{
line 699
;699:	LoadConfig_MenuInit(load, title, callback);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 LoadConfig_MenuInit
CALLV
pop
line 700
;700:	UI_PushMenu( &s_configs.menu );
ADDRGP4 s_configs
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 701
;701:}
LABELV $583
endproc UI_ConfigMenu 0 12
import UIObject_Key
import COM_StripExtensionOld
bss
align 4
LABELV s_configs
skip 44168
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
LABELV $580
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $519
byte 1 208
byte 1 159
byte 1 209
byte 1 128
byte 1 208
byte 1 184
byte 1 208
byte 1 189
byte 1 209
byte 1 131
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 208
byte 1 187
byte 1 209
byte 1 140
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 208
byte 1 185
byte 1 32
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 191
byte 1 209
byte 1 131
byte 1 209
byte 1 129
byte 1 208
byte 1 186
byte 1 58
byte 1 0
align 1
LABELV $513
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 58
byte 1 0
align 1
LABELV $493
byte 1 81
byte 1 83
byte 1 32
byte 1 209
byte 1 132
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 187
byte 1 209
byte 1 139
byte 1 58
byte 1 0
align 1
LABELV $487
byte 1 81
byte 1 83
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 58
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
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $448
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
byte 1 97
byte 1 118
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $445
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $442
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $421
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
LABELV $403
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
LABELV $399
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
LABELV $381
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
LABELV $353
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
LABELV $312
byte 1 208
byte 1 161
byte 1 208
byte 1 158
byte 1 208
byte 1 165
byte 1 208
byte 1 160
byte 1 208
byte 1 144
byte 1 208
byte 1 157
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 32
byte 1 208
byte 1 164
byte 1 208
byte 1 144
byte 1 208
byte 1 153
byte 1 208
byte 1 155
byte 1 0
align 1
LABELV $308
byte 1 83
byte 1 65
byte 1 86
byte 1 69
byte 1 32
byte 1 67
byte 1 79
byte 1 78
byte 1 70
byte 1 73
byte 1 71
byte 1 0
align 1
LABELV $304
byte 1 208
byte 1 151
byte 1 208
byte 1 144
byte 1 208
byte 1 147
byte 1 208
byte 1 160
byte 1 208
byte 1 163
byte 1 208
byte 1 151
byte 1 208
byte 1 152
byte 1 208
byte 1 162
byte 1 208
byte 1 172
byte 1 32
byte 1 208
byte 1 164
byte 1 208
byte 1 144
byte 1 208
byte 1 153
byte 1 208
byte 1 155
byte 1 0
align 1
LABELV $300
byte 1 76
byte 1 79
byte 1 65
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 78
byte 1 70
byte 1 73
byte 1 71
byte 1 0
align 1
LABELV $271
byte 1 208
byte 1 146
byte 1 208
byte 1 178
byte 1 208
byte 1 181
byte 1 208
byte 1 180
byte 1 208
byte 1 184
byte 1 209
byte 1 130
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 184
byte 1 208
byte 1 188
byte 1 209
byte 1 143
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
byte 1 58
byte 1 0
align 1
LABELV $267
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $263
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
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
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $232
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $200
byte 1 37
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $198
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $183
byte 1 208
byte 1 159
byte 1 208
byte 1 181
byte 1 209
byte 1 128
byte 1 208
byte 1 181
byte 1 208
byte 1 183
byte 1 208
byte 1 176
byte 1 208
byte 1 191
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 176
byte 1 209
byte 1 130
byte 1 209
byte 1 140
byte 1 63
byte 1 0
align 1
LABELV $179
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 63
byte 1 0
align 1
LABELV $170
byte 1 37
byte 1 115
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 33
byte 1 0
align 1
LABELV $168
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $149
byte 1 208
byte 1 164
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 187
byte 1 209
byte 1 139
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 181
byte 1 32
byte 1 208
byte 1 189
byte 1 208
byte 1 176
byte 1 208
byte 1 185
byte 1 208
byte 1 180
byte 1 208
byte 1 181
byte 1 208
byte 1 189
byte 1 209
byte 1 139
byte 1 46
byte 1 0
align 1
LABELV $144
byte 1 78
byte 1 111
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $119
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $118
byte 1 0
align 1
LABELV $98
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 108
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $97
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $96
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 116
byte 1 100
byte 1 109
byte 1 0
align 1
LABELV $95
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 111
byte 1 110
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $94
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $93
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 104
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
LABELV $92
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 101
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
LABELV $91
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 100
byte 1 109
byte 1 0
align 1
LABELV $90
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $89
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $88
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $87
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $86
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $85
byte 1 113
byte 1 51
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $84
byte 1 117
byte 1 105
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $83
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $82
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $81
byte 1 113
byte 1 51
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 0
