code
proc Demos_MenuEvent 16 12
file "../../../code/q3_ui/ui_demo2.c"
line 76
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:DEMOS MENU
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
;17:
;18:#define ART_BACK0			"menu/art/back_0"
;19:#define ART_BACK1			"menu/art/back_1"	
;20:#define ART_GO0				"menu/art/fight_0"
;21:#define ART_GO1				"menu/art/fight_1"
;22:#define ART_FRAMEL			"menu/art/frame2_l"
;23:#define ART_FRAMER			"menu/art/frame1_r"
;24:#define ART_ARROWS			"menu/art/arrows_horz_0"
;25:#define ART_ARROWLEFT		"menu/art/arrows_horz_left"
;26:#define ART_ARROWRIGHT		"menu/art/arrows_horz_right"
;27:
;28:#define MAX_DEMOS			256
;29:#define NAMEBUFSIZE			( MAX_DEMOS * 16 )
;30:#define STATUSBAR_SIZE 32
;31:
;32:#define ID_BACK				10
;33:#define ID_GO				11
;34:#define ID_LIST				12
;35:#define ID_RIGHT			13
;36:#define ID_LEFT				14
;37:#define ID_TIMEDEMO			15
;38:
;39:#define ARROWS_WIDTH		128
;40:#define ARROWS_HEIGHT		48
;41:
;42:
;43:typedef struct {
;44:	menuframework_s	menu;
;45:
;46:	menutext_s		banner;
;47:	menubitmap_s	framel;
;48:	menubitmap_s	framer;
;49:
;50:	menulist_s		list;
;51:
;52:	menuradiobutton_s	timedemo;
;53:
;54:	menubitmap_s	arrows;
;55:	menubitmap_s	left;
;56:	menubitmap_s	right;
;57:	menubitmap_s	back;
;58:	menubitmap_s	go;
;59:
;60:	int				numDemos;
;61:	char			names[NAMEBUFSIZE];
;62:	char			*demolist[MAX_DEMOS];
;63:   int         protocol[MAX_DEMOS]; // stores the protocol of the detected map
;64:   qboolean ranged_protocol;
;65:   qboolean demos_found;
;66:} demos_t;
;67:
;68:static demos_t	s_demos;
;69:
;70:
;71:/*
;72:===============
;73:Demos_MenuEvent
;74:===============
;75:*/
;76:static void Demos_MenuEvent( void *ptr, int event ) {
line 77
;77:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $82
line 78
;78:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 81
;79:	}
;80:
;81:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 14
GTI4 $84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $107-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $107
address $102
address $87
address $84
address $105
address $103
code
LABELV $87
line 83
;82:	case ID_GO:
;83:		UI_ForceMenuOff ();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 84
;84:		if (s_demos.timedemo.curvalue)
ADDRGP4 s_demos+1544+88
INDIRI4
CNSTI4 0
EQI4 $88
line 85
;85:			trap_Cmd_ExecuteText( EXEC_APPEND, "timedemo 1;" );
CNSTI4 2
ARGI4
ADDRGP4 $92
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
ADDRGP4 $89
JUMPV
LABELV $88
line 87
;86:		else
;87:			trap_Cmd_ExecuteText( EXEC_APPEND, "timedemo 0;" );
CNSTI4 2
ARGI4
ADDRGP4 $93
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
LABELV $89
line 89
;88:
;89:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "demo %s.dm_%i\n", s_demos.list.itemnames[s_demos.list.curvalue], s_demos.protocol[s_demos.list.curvalue] ) );
ADDRGP4 $94
ARGP4
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRGP4 s_demos+1412+92
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRGP4 s_demos+1412+104
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_demos+1412+92
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
ADDRGP4 s_demos+7344
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 90
;90:		break;
ADDRGP4 $85
JUMPV
LABELV $102
line 93
;91:
;92:	case ID_BACK:
;93:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 94
;94:		break;
ADDRGP4 $85
JUMPV
LABELV $103
line 97
;95:
;96:	case ID_LEFT:
;97:		ScrollList_Key( &s_demos.list, K_LEFTARROW );
ADDRGP4 s_demos+1412
ARGP4
CNSTI4 134
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 98
;98:		break;
ADDRGP4 $85
JUMPV
LABELV $105
line 101
;99:
;100:	case ID_RIGHT:
;101:		ScrollList_Key( &s_demos.list, K_RIGHTARROW );
ADDRGP4 s_demos+1412
ARGP4
CNSTI4 135
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 102
;102:		break;
LABELV $84
LABELV $85
line 104
;103:	}
;104:}
LABELV $81
endproc Demos_MenuEvent 16 12
proc UI_DemosMenu_Key 12 8
line 113
;105:
;106:
;107:
;108:/*
;109:=================
;110:UI_DemosMenu_Key
;111:=================
;112:*/
;113:static sfxHandle_t UI_DemosMenu_Key( int key ) {
line 116
;114:	menucommon_s	*item;
;115:
;116:	item = Menu_ItemAtCursor( &s_demos.menu );
ADDRGP4 s_demos
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 118
;117:
;118:	return Menu_DefaultKey( &s_demos.menu, key );
ADDRGP4 s_demos
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $109
endproc UI_DemosMenu_Key 12 8
proc Demos_FillDemoList 32 16
line 128
;119:}
;120:
;121:
;122:
;123:/*
;124:=================
;125:Demos_FillDemoList
;126:=================
;127:*/
;128:static int Demos_FillDemoList(int protocol) {
line 133
;129:   int count, oldcount;
;130:   int length, offset;
;131:
;132:   // PR1.32 allows for playing of earlier compatible demos (protocols 66,67)
;133:   s_demos.ranged_protocol = qfalse;
ADDRGP4 s_demos+8368
CNSTI4 0
ASGNI4
line 134
;134:   if (protocol == 68) {
ADDRFP4 0
INDIRI4
CNSTI4 68
NEI4 $112
line 135
;135:      protocol = 66;
ADDRFP4 0
CNSTI4 66
ASGNI4
line 136
;136:      s_demos.ranged_protocol = qtrue;
ADDRGP4 s_demos+8368
CNSTI4 1
ASGNI4
line 137
;137:   }
LABELV $112
line 139
;138:
;139:   oldcount = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 140
;140:   count = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 141
;141:   offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $115
line 142
;142:   do {
line 143
;143:      oldcount = count;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 144
;144:      length = NAMEBUFSIZE - offset;
ADDRLP4 12
CNSTI4 4096
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 145
;145:      count += trap_FS_GetFileList( "demos", va("dm_%i", protocol), &s_demos.names[offset], length );
ADDRGP4 $119
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $118
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRGP4 s_demos+2224
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 146
;146:      protocol++;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $122
JUMPV
LABELV $121
line 149
;147:
;148:      // move the offset to the last demo
;149:      while (oldcount < count) {
line 150
;150:         oldcount++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 151
;151:         offset += strlen(&s_demos.names[offset]) + 1;
ADDRLP4 0
INDIRI4
ADDRGP4 s_demos+2224
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 152
;152:      }
LABELV $122
line 149
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $121
line 154
;153:
;154:   } while (s_demos.ranged_protocol && protocol <= 68);
LABELV $116
ADDRGP4 s_demos+8368
INDIRI4
CNSTI4 0
EQI4 $126
ADDRFP4 0
INDIRI4
CNSTI4 68
LEI4 $115
LABELV $126
line 156
;155:
;156:   return count;
ADDRLP4 8
INDIRI4
RETI4
LABELV $110
endproc Demos_FillDemoList 32 16
proc Demos_ClipDemoExt 20 8
line 166
;157:}
;158:
;159:
;160:
;161:/*
;162:=================
;163:Demos_ClipDemoExt
;164:=================
;165:*/
;166:static int Demos_ClipDemoExt(char* demoname, int len, int protocol) {
line 170
;167:   char* demoext;
;168:   int demoext_len;
;169:
;170:   if (s_demos.ranged_protocol) {
ADDRGP4 s_demos+8368
INDIRI4
CNSTI4 0
EQI4 $128
line 171
;171:      protocol = 66;
ADDRFP4 8
CNSTI4 66
ASGNI4
line 172
;172:   }
LABELV $128
LABELV $131
line 174
;173:
;174:   do {
line 175
;175:   	demoext = va(".dm_%i", protocol);
ADDRGP4 $134
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 176
;176:	   demoext_len = strlen(demoext);
ADDRLP4 0
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
line 179
;177:
;178:      // strip extension
;179:      if (!Q_stricmp(demoname +  len - demoext_len, demoext)) {
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
SUBP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $135
line 180
;180:         demoname[len-demoext_len] = '\0';
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 181
;181:         break;
ADDRGP4 $133
JUMPV
LABELV $135
line 183
;182:      }
;183:      protocol++;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 184
;184:   } while (s_demos.ranged_protocol && protocol <= 68);
LABELV $132
ADDRGP4 s_demos+8368
INDIRI4
CNSTI4 0
EQI4 $138
ADDRFP4 8
INDIRI4
CNSTI4 68
LEI4 $131
LABELV $138
LABELV $133
line 186
;185:
;186:   return protocol;
ADDRFP4 8
INDIRI4
RETI4
LABELV $127
endproc Demos_ClipDemoExt 20 8
proc Demos_MenuDraw 44 20
line 196
;187:}
;188:
;189:
;190:/*
;191:=================
;192:Demos_MenuDraw
;193:=================
;194:*/
;195:static void Demos_MenuDraw(void)
;196:{
line 199
;197:   char statusbar[STATUSBAR_SIZE];
;198:
;199:   if (s_demos.demos_found && s_demos.ranged_protocol &&
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 s_demos+8372
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $140
ADDRGP4 s_demos+8368
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $140
ADDRGP4 s_demos+1412+96
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $140
ADDRGP4 s_demos+1412+92
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $140
line 200
;200:         s_demos.list.numitems > 0 && s_demos.list.curvalue >= 0) {
line 201
;201:      Q_strncpyz(statusbar, va("Protocol %i", s_demos.protocol[s_demos.list.curvalue]), STATUSBAR_SIZE);
ADDRGP4 $148
ARGP4
ADDRGP4 s_demos+1412+92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_demos+7344
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 202
;202:	   UI_DrawString(632 - strlen(statusbar) * SMALLCHAR_WIDTH, 480 - 64 - SMALLCHAR_HEIGHT,
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
CNSTI4 632
ADDRLP4 40
INDIRI4
ADDRGP4 cl_smallcharwidth+12
INDIRI4
MULI4
SUBI4
ARGI4
CNSTI4 416
ADDRGP4 cl_smallcharheight+12
INDIRI4
SUBI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 204
;203:         statusbar, UI_SMALLFONT, color_orange);
;204:   }
LABELV $140
line 206
;205:
;206:   Menu_Draw(&s_demos.menu);
ADDRGP4 s_demos
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 207
;207:}
LABELV $139
endproc Demos_MenuDraw 44 20
proc Demos_MenuInit 32 12
line 215
;208:
;209:
;210:/*
;211:===============
;212:Demos_MenuInit
;213:===============
;214:*/
;215:static void Demos_MenuInit( void ) {
line 221
;216:	int		i;
;217:	int		len;
;218:	char	*demoname;
;219:	int 	protocol;
;220:
;221:	memset( &s_demos, 0 ,sizeof(demos_t) );
ADDRGP4 s_demos
ARGP4
CNSTI4 0
ARGI4
CNSTI4 8376
ARGI4
ADDRGP4 memset
CALLP4
pop
line 222
;222:	s_demos.menu.key = UI_DemosMenu_Key;
ADDRGP4 s_demos+1040
ADDRGP4 UI_DemosMenu_Key
ASGNP4
line 223
;223:	s_demos.menu.draw = Demos_MenuDraw;
ADDRGP4 s_demos+1036
ADDRGP4 Demos_MenuDraw
ASGNP4
line 225
;224:
;225:   protocol = (int)trap_Cvar_VariableValue("protocol");
ADDRGP4 $157
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 227
;226:
;227:	Demos_Cache();
ADDRGP4 Demos_Cache
CALLV
pop
line 229
;228:
;229:	s_demos.menu.fullscreen = qtrue;
ADDRGP4 s_demos+1052
CNSTI4 1
ASGNI4
line 230
;230:	s_demos.menu.wrapAround = qtrue;
ADDRGP4 s_demos+1044
CNSTI4 1
ASGNI4
line 231
;231:	s_demos.menu.native 	= qfalse;
ADDRGP4 s_demos+1056
CNSTI4 0
ASGNI4
line 233
;232:
;233:	s_demos.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 s_demos+1076
CNSTI4 10
ASGNI4
line 234
;234:	s_demos.banner.generic.x		= 320;
ADDRGP4 s_demos+1076+28
CNSTI4 320
ASGNI4
line 235
;235:	s_demos.banner.generic.y		= 16;
ADDRGP4 s_demos+1076+32
CNSTI4 16
ASGNI4
line 236
;236:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $166
line 237
;237:	s_demos.banner.string			= "DEMOS";
ADDRGP4 s_demos+1076+88
ADDRGP4 $171
ASGNP4
line 238
;238:	}
LABELV $166
line 239
;239:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $172
line 240
;240:	s_demos.banner.string			= "ЗАПИСИ";
ADDRGP4 s_demos+1076+88
ADDRGP4 $177
ASGNP4
line 241
;241:	}
LABELV $172
line 242
;242:	s_demos.banner.color			= color_white;
ADDRGP4 s_demos+1076+100
ADDRGP4 color_white
ASGNP4
line 243
;243:	s_demos.banner.style			= UI_CENTER;
ADDRGP4 s_demos+1076+92
CNSTI4 1
ASGNI4
line 245
;244:
;245:	s_demos.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+1180
CNSTI4 6
ASGNI4
line 246
;246:	s_demos.framel.generic.name		= ART_FRAMEL;
ADDRGP4 s_demos+1180+4
ADDRGP4 $185
ASGNP4
line 247
;247:	s_demos.framel.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_demos+1180+72
CNSTU4 16384
ASGNU4
line 248
;248:	s_demos.framel.generic.x		= 0;  
ADDRGP4 s_demos+1180+28
CNSTI4 0
ASGNI4
line 249
;249:	s_demos.framel.generic.y		= 78;
ADDRGP4 s_demos+1180+32
CNSTI4 78
ASGNI4
line 250
;250:	s_demos.framel.width			= 256;
ADDRGP4 s_demos+1180+104
CNSTI4 256
ASGNI4
line 251
;251:	s_demos.framel.height			= 329;
ADDRGP4 s_demos+1180+108
CNSTI4 329
ASGNI4
line 253
;252:
;253:	s_demos.timedemo.generic.type	= MTYPE_RADIOBUTTON;
ADDRGP4 s_demos+1544
CNSTI4 5
ASGNI4
line 254
;254:	s_demos.timedemo.generic.x		= 480 - SMALLCHAR_WIDTH;
ADDRGP4 s_demos+1544+28
CNSTI4 480
ADDRGP4 cl_smallcharwidth+12
INDIRI4
SUBI4
ASGNI4
line 255
;255:	s_demos.timedemo.generic.y		= 480 - 32 - SMALLCHAR_HEIGHT / 2;
ADDRGP4 s_demos+1544+32
CNSTI4 448
ADDRGP4 cl_smallcharheight+12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 256
;256:	if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $203
line 257
;257:	s_demos.timedemo.generic.name 	= "Time demo:";
ADDRGP4 s_demos+1544+4
ADDRGP4 $208
ASGNP4
line 258
;258:	}
LABELV $203
line 259
;259:	if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $209
line 260
;260:	s_demos.timedemo.generic.name 	= "Время записей:";
ADDRGP4 s_demos+1544+4
ADDRGP4 $214
ASGNP4
line 261
;261:	}
LABELV $209
line 262
;262:	s_demos.timedemo.generic.flags	= QMF_SMALLFONT|QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+1544+72
CNSTU4 258
ASGNU4
line 263
;263:	s_demos.timedemo.generic.id		= ID_TIMEDEMO;
ADDRGP4 s_demos+1544+24
CNSTI4 15
ASGNI4
line 265
;264:
;265:	s_demos.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+1296
CNSTI4 6
ASGNI4
line 266
;266:	s_demos.framer.generic.name		= ART_FRAMER;
ADDRGP4 s_demos+1296+4
ADDRGP4 $222
ASGNP4
line 267
;267:	s_demos.framer.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_demos+1296+72
CNSTU4 16384
ASGNU4
line 268
;268:	s_demos.framer.generic.x		= 376;
ADDRGP4 s_demos+1296+28
CNSTI4 376
ASGNI4
line 269
;269:	s_demos.framer.generic.y		= 76;
ADDRGP4 s_demos+1296+32
CNSTI4 76
ASGNI4
line 270
;270:	s_demos.framer.width			= 256;
ADDRGP4 s_demos+1296+104
CNSTI4 256
ASGNI4
line 271
;271:	s_demos.framer.height			= 334;
ADDRGP4 s_demos+1296+108
CNSTI4 334
ASGNI4
line 273
;272:
;273:	s_demos.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+1640
CNSTI4 6
ASGNI4
line 274
;274:	s_demos.arrows.generic.name		= ART_ARROWS;
ADDRGP4 s_demos+1640+4
ADDRGP4 $236
ASGNP4
line 275
;275:	s_demos.arrows.generic.flags	= QMF_INACTIVE;
ADDRGP4 s_demos+1640+72
CNSTU4 16384
ASGNU4
line 276
;276:	s_demos.arrows.generic.x		= 320-ARROWS_WIDTH/2;
ADDRGP4 s_demos+1640+28
CNSTI4 256
ASGNI4
line 277
;277:	s_demos.arrows.generic.y		= 400;
ADDRGP4 s_demos+1640+32
CNSTI4 400
ASGNI4
line 278
;278:	s_demos.arrows.width			= ARROWS_WIDTH;
ADDRGP4 s_demos+1640+104
CNSTI4 128
ASGNI4
line 279
;279:	s_demos.arrows.height			= ARROWS_HEIGHT;
ADDRGP4 s_demos+1640+108
CNSTI4 48
ASGNI4
line 281
;280:
;281:	s_demos.left.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+1756
CNSTI4 6
ASGNI4
line 282
;282:	s_demos.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_demos+1756+72
CNSTU4 2308
ASGNU4
line 283
;283:	s_demos.left.generic.x			= 320-ARROWS_WIDTH/2;
ADDRGP4 s_demos+1756+28
CNSTI4 256
ASGNI4
line 284
;284:	s_demos.left.generic.y			= 400;
ADDRGP4 s_demos+1756+32
CNSTI4 400
ASGNI4
line 285
;285:	s_demos.left.generic.id			= ID_LEFT;
ADDRGP4 s_demos+1756+24
CNSTI4 14
ASGNI4
line 286
;286:	s_demos.left.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+1756+76
ADDRGP4 Demos_MenuEvent
ASGNP4
line 287
;287:	s_demos.left.width				= ARROWS_WIDTH/2;
ADDRGP4 s_demos+1756+104
CNSTI4 64
ASGNI4
line 288
;288:	s_demos.left.height				= ARROWS_HEIGHT;
ADDRGP4 s_demos+1756+108
CNSTI4 48
ASGNI4
line 289
;289:	s_demos.left.focuspic			= ART_ARROWLEFT;
ADDRGP4 s_demos+1756+88
ADDRGP4 $264
ASGNP4
line 291
;290:
;291:	s_demos.right.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+1872
CNSTI4 6
ASGNI4
line 292
;292:	s_demos.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 s_demos+1872+72
CNSTU4 2308
ASGNU4
line 293
;293:	s_demos.right.generic.x			= 320;
ADDRGP4 s_demos+1872+28
CNSTI4 320
ASGNI4
line 294
;294:	s_demos.right.generic.y			= 400;
ADDRGP4 s_demos+1872+32
CNSTI4 400
ASGNI4
line 295
;295:	s_demos.right.generic.id		= ID_RIGHT;
ADDRGP4 s_demos+1872+24
CNSTI4 13
ASGNI4
line 296
;296:	s_demos.right.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+1872+76
ADDRGP4 Demos_MenuEvent
ASGNP4
line 297
;297:	s_demos.right.width				= ARROWS_WIDTH/2;
ADDRGP4 s_demos+1872+104
CNSTI4 64
ASGNI4
line 298
;298:	s_demos.right.height			= ARROWS_HEIGHT;
ADDRGP4 s_demos+1872+108
CNSTI4 48
ASGNI4
line 299
;299:	s_demos.right.focuspic			= ART_ARROWRIGHT;
ADDRGP4 s_demos+1872+88
ADDRGP4 $282
ASGNP4
line 301
;300:
;301:	s_demos.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_demos+1988
CNSTI4 6
ASGNI4
line 302
;302:	s_demos.back.generic.name		= ART_BACK0;
ADDRGP4 s_demos+1988+4
ADDRGP4 $286
ASGNP4
line 303
;303:	s_demos.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+1988+72
CNSTU4 260
ASGNU4
line 304
;304:	s_demos.back.generic.id			= ID_BACK;
ADDRGP4 s_demos+1988+24
CNSTI4 10
ASGNI4
line 305
;305:	s_demos.back.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+1988+76
ADDRGP4 Demos_MenuEvent
ASGNP4
line 306
;306:	s_demos.back.generic.x			= 0 - uis.wideoffset;
ADDRGP4 s_demos+1988+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 307
;307:	s_demos.back.generic.y			= 480-64;
ADDRGP4 s_demos+1988+32
CNSTI4 416
ASGNI4
line 308
;308:	s_demos.back.width				= 128;
ADDRGP4 s_demos+1988+104
CNSTI4 128
ASGNI4
line 309
;309:	s_demos.back.height				= 64;
ADDRGP4 s_demos+1988+108
CNSTI4 64
ASGNI4
line 310
;310:	s_demos.back.focuspic			= ART_BACK1;
ADDRGP4 s_demos+1988+88
ADDRGP4 $304
ASGNP4
line 312
;311:
;312:	s_demos.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_demos+2104
CNSTI4 6
ASGNI4
line 313
;313:	s_demos.go.generic.name			= ART_GO0;
ADDRGP4 s_demos+2104+4
ADDRGP4 $308
ASGNP4
line 314
;314:	s_demos.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+2104+72
CNSTU4 272
ASGNU4
line 315
;315:	s_demos.go.generic.id			= ID_GO;
ADDRGP4 s_demos+2104+24
CNSTI4 11
ASGNI4
line 316
;316:	s_demos.go.generic.callback		= Demos_MenuEvent;
ADDRGP4 s_demos+2104+76
ADDRGP4 Demos_MenuEvent
ASGNP4
line 317
;317:	s_demos.go.generic.x			= 640 + uis.wideoffset;
ADDRGP4 s_demos+2104+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 318
;318:	s_demos.go.generic.y			= 480-64;
ADDRGP4 s_demos+2104+32
CNSTI4 416
ASGNI4
line 319
;319:	s_demos.go.width				= 128;
ADDRGP4 s_demos+2104+104
CNSTI4 128
ASGNI4
line 320
;320:	s_demos.go.height				= 64;
ADDRGP4 s_demos+2104+108
CNSTI4 64
ASGNI4
line 321
;321:	s_demos.go.focuspic				= ART_GO1;
ADDRGP4 s_demos+2104+88
ADDRGP4 $326
ASGNP4
line 323
;322:
;323:	s_demos.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_demos+1412
CNSTI4 8
ASGNI4
line 324
;324:	s_demos.list.generic.flags		= QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+1412+72
CNSTU4 256
ASGNU4
line 325
;325:	s_demos.list.generic.callback	= Demos_MenuEvent;
ADDRGP4 s_demos+1412+76
ADDRGP4 Demos_MenuEvent
ASGNP4
line 326
;326:	s_demos.list.generic.id			= ID_LIST;
ADDRGP4 s_demos+1412+24
CNSTI4 12
ASGNI4
line 327
;327:	s_demos.list.generic.x			= 118;
ADDRGP4 s_demos+1412+28
CNSTI4 118
ASGNI4
line 328
;328:	s_demos.list.generic.y			= 130;
ADDRGP4 s_demos+1412+32
CNSTI4 130
ASGNI4
line 329
;329:	s_demos.list.width				= 16;
ADDRGP4 s_demos+1412+112
CNSTI4 16
ASGNI4
line 330
;330:	s_demos.list.height				= 14;
ADDRGP4 s_demos+1412+116
CNSTI4 14
ASGNI4
line 331
;331:	s_demos.list.numitems			= Demos_FillDemoList(protocol);
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Demos_FillDemoList
CALLI4
ASGNI4
ADDRGP4 s_demos+1412+96
ADDRLP4 20
INDIRI4
ASGNI4
line 332
;332:	s_demos.list.itemnames			= (const char **)s_demos.demolist;
ADDRGP4 s_demos+1412+104
ADDRGP4 s_demos+6320
ASGNP4
line 333
;333:	s_demos.list.columns			= 3;
ADDRGP4 s_demos+1412+120
CNSTI4 3
ASGNI4
line 335
;334:
;335:   s_demos.demos_found = qtrue;
ADDRGP4 s_demos+8372
CNSTI4 1
ASGNI4
line 336
;336:	if (!s_demos.list.numitems) {
ADDRGP4 s_demos+1412+96
INDIRI4
CNSTI4 0
NEI4 $350
line 337
;337:		if(cl_language.integer == 0){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 0
NEI4 $354
line 338
;338:		strcpy( s_demos.names, "No Demos Found." );
ADDRGP4 s_demos+2224
ARGP4
ADDRGP4 $358
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 339
;339:		}
LABELV $354
line 340
;340:		if(cl_language.integer == 1){
ADDRGP4 cl_language+12
INDIRI4
CNSTI4 1
NEI4 $359
line 341
;341:		strcpy( s_demos.names, "Записи не найдены." );
ADDRGP4 s_demos+2224
ARGP4
ADDRGP4 $363
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 342
;342:		}
LABELV $359
line 343
;343:		s_demos.list.numitems = 1;
ADDRGP4 s_demos+1412+96
CNSTI4 1
ASGNI4
line 344
;344:      s_demos.demos_found = qfalse;
ADDRGP4 s_demos+8372
CNSTI4 0
ASGNI4
line 347
;345:
;346:		//degenerate case, not selectable
;347:		s_demos.go.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 24
ADDRGP4 s_demos+2104+72
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 348
;348:	}
ADDRGP4 $351
JUMPV
LABELV $350
line 349
;349:	else if (s_demos.list.numitems > MAX_DEMOS) {
ADDRGP4 s_demos+1412+96
INDIRI4
CNSTI4 256
LEI4 $369
line 350
;350:		s_demos.list.numitems = MAX_DEMOS;
ADDRGP4 s_demos+1412+96
CNSTI4 256
ASGNI4
line 351
;351:   }
LABELV $369
LABELV $351
line 353
;352:
;353:	demoname = s_demos.names;
ADDRLP4 0
ADDRGP4 s_demos+2224
ASGNP4
line 354
;354:	for ( i = 0; i < s_demos.list.numitems; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $379
JUMPV
LABELV $376
line 356
;355:		// strip extension
;356:		len = strlen( demoname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 357
;357:      s_demos.protocol[i] = Demos_ClipDemoExt(demoname, len, protocol);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Demos_ClipDemoExt
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_demos+7344
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 359
;358:
;359:		Q_strupr(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 360
;360:		s_demos.list.itemnames[i] = demoname;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_demos+1412+104
INDIRP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 362
;361:
;362:		demoname += len + 1;
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 363
;363:	}
LABELV $377
line 354
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $379
ADDRLP4 4
INDIRI4
ADDRGP4 s_demos+1412+96
INDIRI4
LTI4 $376
line 365
;364:
;365:	Menu_AddItem( &s_demos.menu, &s_demos.banner );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 366
;366:	Menu_AddItem( &s_demos.menu, &s_demos.framel );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1180
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 367
;367:	Menu_AddItem( &s_demos.menu, &s_demos.framer );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 368
;368:	Menu_AddItem( &s_demos.menu, &s_demos.list );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1412
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 369
;369:	Menu_AddItem( &s_demos.menu, &s_demos.arrows );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1640
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 370
;370:	Menu_AddItem( &s_demos.menu, &s_demos.left );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1756
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 371
;371:	Menu_AddItem( &s_demos.menu, &s_demos.right );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1872
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 372
;372:	Menu_AddItem( &s_demos.menu, &s_demos.back );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1988
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 373
;373:	Menu_AddItem( &s_demos.menu, &s_demos.timedemo );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1544
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 374
;374:	Menu_AddItem( &s_demos.menu, &s_demos.go );
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+2104
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 375
;375:}
LABELV $154
endproc Demos_MenuInit 32 12
export Demos_Cache
proc Demos_Cache 0 4
line 382
;376:
;377:/*
;378:=================
;379:Demos_Cache
;380:=================
;381:*/
;382:void Demos_Cache( void ) {
line 383
;383:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $286
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 384
;384:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $304
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 385
;385:	trap_R_RegisterShaderNoMip( ART_GO0 );
ADDRGP4 $308
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 386
;386:	trap_R_RegisterShaderNoMip( ART_GO1 );
ADDRGP4 $326
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 387
;387:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $185
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 388
;388:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $222
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 389
;389:	trap_R_RegisterShaderNoMip( ART_ARROWS );
ADDRGP4 $236
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 390
;390:	trap_R_RegisterShaderNoMip( ART_ARROWLEFT );
ADDRGP4 $264
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 391
;391:	trap_R_RegisterShaderNoMip( ART_ARROWRIGHT );
ADDRGP4 $282
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 392
;392:}
LABELV $395
endproc Demos_Cache 0 4
export UI_DemosMenu
proc UI_DemosMenu 0 4
line 399
;393:
;394:/*
;395:===============
;396:UI_DemosMenu
;397:===============
;398:*/
;399:void UI_DemosMenu( void ) {
line 400
;400:	Demos_MenuInit();
ADDRGP4 Demos_MenuInit
CALLV
pop
line 401
;401:	UI_PushMenu( &s_demos.menu );
ADDRGP4 s_demos
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 402
;402:}
LABELV $396
endproc UI_DemosMenu 0 4
bss
align 4
LABELV s_demos
skip 8376
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
LABELV $363
byte 1 208
byte 1 151
byte 1 208
byte 1 176
byte 1 208
byte 1 191
byte 1 208
byte 1 184
byte 1 209
byte 1 129
byte 1 208
byte 1 184
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
LABELV $358
byte 1 78
byte 1 111
byte 1 32
byte 1 68
byte 1 101
byte 1 109
byte 1 111
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
LABELV $326
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $308
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $304
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
LABELV $286
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
LABELV $264
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
LABELV $236
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
LABELV $222
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
LABELV $214
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
byte 1 32
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
byte 1 181
byte 1 208
byte 1 185
byte 1 58
byte 1 0
align 1
LABELV $208
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $185
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
LABELV $177
byte 1 208
byte 1 151
byte 1 208
byte 1 144
byte 1 208
byte 1 159
byte 1 208
byte 1 152
byte 1 208
byte 1 161
byte 1 208
byte 1 152
byte 1 0
align 1
LABELV $171
byte 1 68
byte 1 69
byte 1 77
byte 1 79
byte 1 83
byte 1 0
align 1
LABELV $157
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $148
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $134
byte 1 46
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $119
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $118
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $94
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $93
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 48
byte 1 59
byte 1 0
align 1
LABELV $92
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 49
byte 1 59
byte 1 0
