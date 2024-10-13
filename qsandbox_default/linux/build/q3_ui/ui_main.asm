export vmMain
code
proc vmMain 12 8
file "../../../code/q3_ui/ui_main.c"
line 25
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:USER INTERFACE MAIN
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
;17:/*
;18:================
;19:vmMain
;20:
;21:This is the only way control passes into the module.
;22:This must be the very first function compiled into the .qvm file
;23:================
;24:*/
;25:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 26
;26:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $81
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $81
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $94
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $94
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
code
LABELV $83
line 28
;27:	case UI_GETAPIVERSION:
;28:		return UI_API_VERSION;
CNSTI4 4
RETI4
ADDRGP4 $80
JUMPV
LABELV $84
line 31
;29:
;30:	case UI_INIT:
;31:		UI_Init();
ADDRGP4 UI_Init
CALLV
pop
line 32
;32:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $80
JUMPV
LABELV $85
line 35
;33:
;34:	case UI_SHUTDOWN:
;35:		UI_Shutdown();
ADDRGP4 UI_Shutdown
CALLV
pop
line 36
;36:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $80
JUMPV
LABELV $86
line 39
;37:
;38:	case UI_KEY_EVENT:
;39:		UI_KeyEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_KeyEvent
CALLV
pop
line 40
;40:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $80
JUMPV
LABELV $87
line 43
;41:
;42:	case UI_MOUSE_EVENT:
;43:		UI_MouseEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_MouseEvent
CALLV
pop
line 44
;44:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $80
JUMPV
LABELV $88
line 47
;45:
;46:	case UI_REFRESH:
;47:		UI_Refresh( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_Refresh
CALLV
pop
line 48
;48:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $80
JUMPV
LABELV $89
line 51
;49:
;50:	case UI_IS_FULLSCREEN:
;51:		return UI_IsFullscreen();
ADDRLP4 4
ADDRGP4 UI_IsFullscreen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $80
JUMPV
LABELV $90
line 54
;52:
;53:	case UI_SET_ACTIVE_MENU:
;54:		UI_SetActiveMenu( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_SetActiveMenu
CALLV
pop
line 55
;55:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $80
JUMPV
LABELV $91
line 58
;56:
;57:	case UI_CONSOLE_COMMAND:
;58:		return UI_ConsoleCommand(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $80
JUMPV
LABELV $92
line 61
;59:
;60:	case UI_DRAW_CONNECT_SCREEN:
;61:		UI_DrawConnectScreen( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawConnectScreen
CALLV
pop
line 62
;62:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $80
JUMPV
LABELV $93
line 64
;63:	case UI_HASUNIQUECDKEY:				// mod authors need to observe this
;64:		return qfalse;  // bk010117 - change this to qfalse for mods!
CNSTI4 0
RETI4
ADDRGP4 $80
JUMPV
LABELV $81
line 67
;65:	}
;66:
;67:	return -1;
CNSTI4 -1
RETI4
LABELV $80
endproc vmMain 12 8
data
align 4
LABELV cvarTable
address cl_propsmallsizescale
address $96
address $97
byte 4 1
address cl_propheight
address $98
address $99
byte 4 1
address cl_propspacewidth
address $100
address $101
byte 4 1
address cl_propgapwidth
address $102
address $103
byte 4 1
address cl_smallcharwidth
address $104
address $101
byte 4 1
address cl_smallcharheight
address $105
address $106
byte 4 1
address cl_bigcharwidth
address $107
address $106
byte 4 1
address cl_bigcharheight
address $108
address $106
byte 4 1
address cl_giantcharwidth
address $109
address $110
byte 4 1
address cl_giantcharheight
address $111
address $112
byte 4 1
address sb_private
address $113
address $114
byte 4 0
address sb_grid
address $115
address $116
byte 4 0
address sb_texture
address $117
address $114
byte 4 0
address sb_texturename
address $118
address $114
byte 4 0
address sb_modelnum
address $119
address $114
byte 4 1
address sb_classnum
address $120
address $114
byte 4 1
address sb_texturenum
address $121
address $114
byte 4 1
address sb_tab
address $122
address $123
byte 4 0
address spawn_preset
address $124
address $125
byte 4 0
address tool_spawnpreset
address $126
address $127
byte 4 0
address tool_modifypreset
address $128
address $129
byte 4 0
address tool_modifypreset2
address $130
address $131
byte 4 0
address tool_modifypreset3
address $132
address $133
byte 4 0
address tool_modifypreset4
address $134
address $135
byte 4 0
address toolgun_toolset1
address $136
address $137
byte 4 0
address toolgun_toolset2
address $138
address $137
byte 4 0
address toolgun_toolset3
address $139
address $137
byte 4 0
address toolgun_toolset4
address $140
address $137
byte 4 0
address toolgun_toolset5
address $141
address $137
byte 4 0
address toolgun_toolset6
address $142
address $137
byte 4 0
address toolgun_toolset7
address $143
address $137
byte 4 0
address toolgun_toolset8
address $144
address $137
byte 4 0
address toolgun_toolset9
address $145
address $137
byte 4 0
address toolgun_toolset10
address $146
address $137
byte 4 0
address toolgun_toolset11
address $147
address $137
byte 4 0
address toolgun_toolset12
address $148
address $137
byte 4 0
address toolgun_toolset13
address $149
address $137
byte 4 0
address toolgun_toolset14
address $150
address $137
byte 4 0
address toolgun_toolset15
address $151
address $137
byte 4 0
address toolgun_toolset16
address $152
address $137
byte 4 0
address toolgun_toolset17
address $153
address $137
byte 4 0
address toolgun_toolset18
address $154
address $137
byte 4 0
address toolgun_disabledarg1
address $155
address $114
byte 4 0
address toolgun_disabledarg2
address $156
address $114
byte 4 0
address toolgun_disabledarg3
address $157
address $114
byte 4 0
address toolgun_disabledarg4
address $158
address $114
byte 4 0
address cl_sprun
address $159
address $114
byte 4 0
address mgui_api_active
address $160
address $114
byte 4 0
address mgui_none
address $161
address $114
byte 4 0
address sbt_color0_0
address $162
address $123
byte 4 1
address sbt_color0_1
address $163
address $123
byte 4 1
address sbt_color0_2
address $164
address $123
byte 4 1
address sbt_color0_3
address $165
address $166
byte 4 1
address sbt_color1_0
address $167
address $168
byte 4 1
address sbt_color1_1
address $169
address $168
byte 4 1
address sbt_color1_2
address $170
address $168
byte 4 1
address sbt_color1_3
address $171
address $172
byte 4 1
address sbt_color2_0
address $173
address $174
byte 4 1
address sbt_color2_1
address $175
address $174
byte 4 1
address sbt_color2_2
address $176
address $177
byte 4 1
address sbt_color2_3
address $178
address $172
byte 4 1
address sbt_color3_0
address $179
address $114
byte 4 1
address sbt_color3_1
address $180
address $114
byte 4 1
address sbt_color3_2
address $181
address $114
byte 4 1
address sbt_color3_3
address $182
address $123
byte 4 1
address sbt_wallpaper
address $183
address $184
byte 4 1
address ui_scrollbtnsize
address $185
address $123
byte 4 1
address ui_3dmap
address $186
address $187
byte 4 1
address ui_singlemode
address $188
address $114
byte 4 1
address ui_loaded
address $189
address $114
byte 4 0
address legsskin
address $190
address $191
byte 4 1
address team_legsskin
address $192
address $191
byte 4 1
address cl_selectedmod
address $193
address $194
byte 4 1
address cl_language
address $195
address $114
byte 4 1
address cl_screenoffset
address $196
address $197
byte 4 1
address ui_backcolors
address $198
address $123
byte 4 1
address sensitivitymenu
address $199
address $123
byte 4 1
address test1
address $200
address $114
byte 4 0
address test2
address $201
address $114
byte 4 0
address test3
address $202
address $114
byte 4 0
address test4
address $203
address $114
byte 4 0
address test5
address $204
address $114
byte 4 0
address test6
address $205
address $114
byte 4 0
address test7
address $206
address $114
byte 4 0
address test8
address $207
address $114
byte 4 0
address test9
address $208
address $114
byte 4 0
address ui_arenasFile
address $209
address $187
byte 4 80
address ui_botsFile
address $210
address $187
byte 4 80
address ui_spScores1
address $211
address $187
byte 4 65
address ui_spScores2
address $212
address $187
byte 4 65
address ui_spScores3
address $213
address $187
byte 4 65
address ui_spScores4
address $214
address $187
byte 4 65
address ui_spScores5
address $215
address $187
byte 4 65
address ui_spAwards
address $216
address $187
byte 4 65
address ui_spVideos
address $217
address $187
byte 4 65
address ui_spSkill
address $218
address $123
byte 4 0
address ui_spSelection
address $219
address $187
byte 4 64
address ui_browserMaster
address $220
address $114
byte 4 1
address ui_browserGameType
address $221
address $114
byte 4 1
address ui_browserSortKey
address $222
address $223
byte 4 1
address ui_browserShowFull
address $224
address $123
byte 4 1
address ui_browserShowEmpty
address $225
address $123
byte 4 1
address ui_brassTime
address $226
address $227
byte 4 1
address ui_drawCrosshair
address $228
address $223
byte 4 1
address ui_drawCrosshairNames
address $229
address $123
byte 4 1
address ui_marks
address $230
address $123
byte 4 1
address ui_server1
address $231
address $187
byte 4 1
address ui_server2
address $232
address $187
byte 4 1
address ui_server3
address $233
address $187
byte 4 1
address ui_server4
address $234
address $187
byte 4 1
address ui_server5
address $235
address $187
byte 4 1
address ui_server6
address $236
address $187
byte 4 1
address ui_server7
address $237
address $187
byte 4 1
address ui_server8
address $238
address $187
byte 4 1
address ui_server9
address $239
address $187
byte 4 1
address ui_server10
address $240
address $187
byte 4 1
address ui_server11
address $241
address $187
byte 4 1
address ui_server12
address $242
address $187
byte 4 1
address ui_server13
address $243
address $187
byte 4 1
address ui_server14
address $244
address $187
byte 4 1
address ui_server15
address $245
address $187
byte 4 1
address ui_server16
address $246
address $187
byte 4 1
address ui_server17
address $247
address $187
byte 4 1
address ui_server18
address $248
address $187
byte 4 1
address ui_server19
address $249
address $187
byte 4 1
address ui_server20
address $250
address $187
byte 4 1
address ui_server21
address $251
address $187
byte 4 1
address ui_server22
address $252
address $187
byte 4 1
address ui_server23
address $253
address $187
byte 4 1
address ui_server24
address $254
address $187
byte 4 1
address ui_server25
address $255
address $187
byte 4 1
address ui_server26
address $256
address $187
byte 4 1
address ui_server27
address $257
address $187
byte 4 1
address ui_server28
address $258
address $187
byte 4 1
address ui_server29
address $259
address $187
byte 4 1
address ui_server30
address $260
address $187
byte 4 1
address ui_server31
address $261
address $187
byte 4 1
address ui_server32
address $262
address $187
byte 4 1
address ui_cdkeychecked
address $263
address $114
byte 4 64
address uie_map_multisel
address $264
address $114
byte 4 65
address uie_map_list
address $265
address $114
byte 4 65
address uie_bot_multisel
address $266
address $114
byte 4 65
address uie_bot_list
address $267
address $114
byte 4 65
address uie_ingame_dynamicmenu
address $268
address $123
byte 4 65
address uie_animsfx
address $269
address $123
byte 4 65
address uie_mapicons
address $270
address $114
byte 4 65
address uie_autoclosebotmenu
address $271
address $114
byte 4 65
address uie_olditemmenu
address $272
address $114
byte 4 1
align 4
LABELV cvarTableSize
byte 4 148
export mod_ammolimit
align 4
LABELV mod_ammolimit
byte 4 200
export mod_gravity
align 4
LABELV mod_gravity
byte 4 800
export UI_RegisterCvars
code
proc UI_RegisterCvars 12 16
line 433
;68:}
;69:
;70:
;71:/*
;72:================
;73:cvars
;74:================
;75:*/
;76:
;77:typedef struct {
;78:	vmCvar_t	*vmCvar;
;79:	char		*cvarName;
;80:	char		*defaultString;
;81:	int			cvarFlags;
;82:} cvarTable_t;
;83:
;84:vmCvar_t	cl_propsmallsizescale;
;85:vmCvar_t 	cl_propheight;
;86:vmCvar_t 	cl_propspacewidth;
;87:vmCvar_t 	cl_propgapwidth;
;88:vmCvar_t 	cl_smallcharwidth;
;89:vmCvar_t 	cl_smallcharheight;
;90:vmCvar_t 	cl_bigcharwidth;
;91:vmCvar_t 	cl_bigcharheight;
;92:vmCvar_t 	cl_giantcharwidth;
;93:vmCvar_t 	cl_giantcharheight;
;94:
;95://QSandbox Sandbox
;96:vmCvar_t	sb_private;
;97:vmCvar_t	sb_texture;
;98:vmCvar_t	sb_texturename;
;99:vmCvar_t	sb_grid;
;100:vmCvar_t	sb_modelnum;
;101:vmCvar_t	sb_classnum;
;102:vmCvar_t	sb_texturenum;
;103:vmCvar_t	sb_tab;
;104:vmCvar_t	spawn_preset;
;105:vmCvar_t	tool_spawnpreset;
;106:vmCvar_t	tool_modifypreset;
;107:vmCvar_t	tool_modifypreset2;
;108:vmCvar_t	tool_modifypreset3;
;109:vmCvar_t	tool_modifypreset4;
;110:
;111:vmCvar_t	toolgun_toolset1;
;112:vmCvar_t	toolgun_toolset2;
;113:vmCvar_t	toolgun_toolset3;
;114:vmCvar_t	toolgun_toolset4;
;115:vmCvar_t	toolgun_toolset5;
;116:vmCvar_t	toolgun_toolset6;
;117:vmCvar_t	toolgun_toolset7;
;118:vmCvar_t	toolgun_toolset8;
;119:vmCvar_t	toolgun_toolset9;
;120:vmCvar_t	toolgun_toolset10;
;121:vmCvar_t	toolgun_toolset11;
;122:vmCvar_t	toolgun_toolset12;
;123:vmCvar_t	toolgun_toolset13;
;124:vmCvar_t	toolgun_toolset14;
;125:vmCvar_t	toolgun_toolset15;
;126:vmCvar_t	toolgun_toolset16;
;127:vmCvar_t	toolgun_toolset17;
;128:vmCvar_t	toolgun_toolset18;
;129:
;130:vmCvar_t	toolgun_disabledarg1;
;131:vmCvar_t	toolgun_disabledarg2;
;132:vmCvar_t	toolgun_disabledarg3;
;133:vmCvar_t	toolgun_disabledarg4;
;134:
;135:vmCvar_t	cl_sprun;
;136:
;137:vmCvar_t	mgui_api_active;
;138:vmCvar_t	mgui_none;
;139:
;140:vmCvar_t	sbt_color0_0;
;141:vmCvar_t	sbt_color0_1;
;142:vmCvar_t	sbt_color0_2;
;143:vmCvar_t	sbt_color0_3;
;144:vmCvar_t	sbt_color1_0;
;145:vmCvar_t	sbt_color1_1;
;146:vmCvar_t	sbt_color1_2;
;147:vmCvar_t	sbt_color1_3;
;148:vmCvar_t	sbt_color2_0;
;149:vmCvar_t	sbt_color2_1;
;150:vmCvar_t	sbt_color2_2;
;151:vmCvar_t	sbt_color2_3;
;152:vmCvar_t	sbt_color3_0;
;153:vmCvar_t	sbt_color3_1;
;154:vmCvar_t	sbt_color3_2;
;155:vmCvar_t	sbt_color3_3;
;156:vmCvar_t	sbt_wallpaper;
;157:
;158:vmCvar_t	ui_scrollbtnsize;
;159:
;160:vmCvar_t	ui_3dmap;
;161:
;162:vmCvar_t	ui_singlemode;
;163:vmCvar_t	legsskin;
;164:vmCvar_t	team_legsskin;
;165:vmCvar_t	cl_selectedmod;
;166:vmCvar_t	cl_language;
;167:vmCvar_t	cl_screenoffset;
;168:vmCvar_t	ui_loaded;
;169:vmCvar_t	ui_backcolors;
;170:vmCvar_t	sensitivitymenu;
;171:
;172:vmCvar_t test1;
;173:vmCvar_t test2;
;174:vmCvar_t test3;
;175:vmCvar_t test4;
;176:vmCvar_t test5;
;177:vmCvar_t test6;
;178:vmCvar_t test7;
;179:vmCvar_t test8;
;180:vmCvar_t test9;
;181:
;182:vmCvar_t	ui_arenasFile;
;183:vmCvar_t	ui_botsFile;
;184:vmCvar_t	ui_spScores1;
;185:vmCvar_t	ui_spScores2;
;186:vmCvar_t	ui_spScores3;
;187:vmCvar_t	ui_spScores4;
;188:vmCvar_t	ui_spScores5;
;189:vmCvar_t	ui_spAwards;
;190:vmCvar_t	ui_spVideos;
;191:vmCvar_t	ui_spSkill;
;192:
;193:vmCvar_t	ui_spSelection;
;194:
;195:vmCvar_t	ui_browserMaster;
;196:vmCvar_t	ui_browserGameType;
;197:vmCvar_t	ui_browserSortKey;
;198:vmCvar_t	ui_browserShowFull;
;199:vmCvar_t	ui_browserShowEmpty;
;200:
;201:vmCvar_t	ui_brassTime;
;202:vmCvar_t	ui_drawCrosshair;
;203:vmCvar_t	ui_drawCrosshairNames;
;204:vmCvar_t	ui_marks;
;205:
;206:vmCvar_t	ui_server1;
;207:vmCvar_t	ui_server2;
;208:vmCvar_t	ui_server3;
;209:vmCvar_t	ui_server4;
;210:vmCvar_t	ui_server5;
;211:vmCvar_t	ui_server6;
;212:vmCvar_t	ui_server7;
;213:vmCvar_t	ui_server8;
;214:vmCvar_t	ui_server9;
;215:vmCvar_t	ui_server10;
;216:vmCvar_t	ui_server11;
;217:vmCvar_t	ui_server12;
;218:vmCvar_t	ui_server13;
;219:vmCvar_t	ui_server14;
;220:vmCvar_t	ui_server15;
;221:vmCvar_t	ui_server16;
;222:vmCvar_t	ui_server17;
;223:vmCvar_t	ui_server18;
;224:vmCvar_t	ui_server19;
;225:vmCvar_t	ui_server20;
;226:vmCvar_t	ui_server21;
;227:vmCvar_t	ui_server22;
;228:vmCvar_t	ui_server23;
;229:vmCvar_t	ui_server24;
;230:vmCvar_t	ui_server25;
;231:vmCvar_t	ui_server26;
;232:vmCvar_t	ui_server27;
;233:vmCvar_t	ui_server28;
;234:vmCvar_t	ui_server29;
;235:vmCvar_t	ui_server30;
;236:vmCvar_t	ui_server31;
;237:vmCvar_t	ui_server32;
;238:
;239:vmCvar_t	ui_cdkeychecked;
;240:
;241:// UIE conventional cvars
;242:vmCvar_t	uie_animsfx;
;243:vmCvar_t	uie_mapicons;
;244:vmCvar_t	uie_autoclosebotmenu;
;245:vmCvar_t	uie_ingame_dynamicmenu;
;246:vmCvar_t	uie_map_multisel;
;247:vmCvar_t	uie_map_list;
;248:vmCvar_t	uie_bot_multisel;
;249:vmCvar_t	uie_bot_list;
;250:vmCvar_t	uie_olditemmenu;
;251:
;252:
;253:static cvarTable_t		cvarTable[] = {
;254:
;255:	{ &cl_propsmallsizescale, "cl_propsmallsizescale", "0.60", CVAR_ARCHIVE },
;256:	{ &cl_propheight, "cl_propheight", "21", CVAR_ARCHIVE  },
;257:	{ &cl_propspacewidth, "cl_propspacewidth", "8", CVAR_ARCHIVE  },
;258:	{ &cl_propgapwidth, "cl_propgapwidth", "3", CVAR_ARCHIVE  },
;259:	{ &cl_smallcharwidth, "cl_smallcharwidth", "8", CVAR_ARCHIVE  },
;260:	{ &cl_smallcharheight, "cl_smallcharheight", "12", CVAR_ARCHIVE  },
;261:	{ &cl_bigcharwidth, "cl_bigcharwidth", "12", CVAR_ARCHIVE  },
;262:	{ &cl_bigcharheight, "cl_bigcharheight", "12", CVAR_ARCHIVE  },
;263:	{ &cl_giantcharwidth, "cl_giantcharwidth", "20", CVAR_ARCHIVE  },
;264:	{ &cl_giantcharheight, "cl_giantcharheight", "32", CVAR_ARCHIVE  },
;265:
;266://QSandbox Sandbox
;267:	{ &sb_private, "sb_private", "0", 0 },
;268:	{ &sb_grid, "sb_grid", "25", 0 },
;269:	{ &sb_texture, "sb_texture", "0", 0 },
;270:	{ &sb_texturename, "sb_texturename", "0", 0 },
;271:	{ &sb_modelnum, "sb_modelnum", "0", CVAR_ARCHIVE },
;272:	{ &sb_classnum, "sb_classnum", "0", CVAR_ARCHIVE },
;273:	{ &sb_texturenum, "sb_texturenum", "0", CVAR_ARCHIVE },
;274:	{ &sb_tab, "sb_tab", "1", 0 },
;275:	{ &spawn_preset, "spawn_preset", "set toolcmd_spawn sl prop %s %s %i 25 %s 0 %s 1 0 \"none\" -1 0 0 0 0 1 1 1 0 0 1 10000 0 1 100 100 120 1 0 1000 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.5", 0 },
;276:	{ &tool_spawnpreset, "tool_spawnpreset", "set toolcmd_spawn sl prop %s none %s 25 %s 0 %s 1 0 \"none\" -1 0 0 0 0 1 1 1 0 0 1 10000 0 1 100 100 120 1 0 1000 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.5", 0 },
;277:	{ &tool_modifypreset, "tool_modifypreset", "set toolcmd_modify tm %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s 0", 0 },
;278:	{ &tool_modifypreset2, "tool_modifypreset2", "set toolcmd_modify2 tm %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s 1", 0 },
;279:	{ &tool_modifypreset3, "tool_modifypreset3", "set toolcmd_modify3 tm %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s 2", 0 },
;280:	{ &tool_modifypreset4, "tool_modifypreset4", "set toolcmd_modify4 tm %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s 3", 0 },
;281:	
;282:	{ &toolgun_toolset1, "toolgun_toolset1", "--------:", 0 },
;283:	{ &toolgun_toolset2, "toolgun_toolset2", "--------:", 0 },
;284:	{ &toolgun_toolset3, "toolgun_toolset3", "--------:", 0 },
;285:	{ &toolgun_toolset4, "toolgun_toolset4", "--------:", 0 },
;286:	{ &toolgun_toolset5, "toolgun_toolset5", "--------:", 0 },
;287:	{ &toolgun_toolset6, "toolgun_toolset6", "--------:", 0 },
;288:	{ &toolgun_toolset7, "toolgun_toolset7", "--------:", 0 },
;289:	{ &toolgun_toolset8, "toolgun_toolset8", "--------:", 0 },
;290:	{ &toolgun_toolset9, "toolgun_toolset9", "--------:", 0 },
;291:	{ &toolgun_toolset10, "toolgun_toolset10", "--------:", 0 },
;292:	{ &toolgun_toolset11, "toolgun_toolset11", "--------:", 0 },
;293:	{ &toolgun_toolset12, "toolgun_toolset12", "--------:", 0 },
;294:	{ &toolgun_toolset13, "toolgun_toolset13", "--------:", 0 },
;295:	{ &toolgun_toolset14, "toolgun_toolset14", "--------:", 0 },
;296:	{ &toolgun_toolset15, "toolgun_toolset15", "--------:", 0 },
;297:	{ &toolgun_toolset16, "toolgun_toolset16", "--------:", 0 },
;298:	{ &toolgun_toolset17, "toolgun_toolset17", "--------:", 0 },
;299:	{ &toolgun_toolset18, "toolgun_toolset18", "--------:", 0 },
;300:	
;301:	{ &toolgun_disabledarg1, "toolgun_disabledarg1", "0", 0 },
;302:	{ &toolgun_disabledarg2, "toolgun_disabledarg2", "0", 0 },
;303:	{ &toolgun_disabledarg3, "toolgun_disabledarg3", "0", 0 },
;304:	{ &toolgun_disabledarg4, "toolgun_disabledarg4", "0", 0 },
;305:
;306:	{ &cl_sprun, "cl_sprun", "0", 0 },
;307:
;308:	{ &mgui_api_active, "mgui_api_active", "0", 0 },
;309:	{ &mgui_none, "mgui_none", "0", 0 },
;310:	
;311:	{ &sbt_color0_0,  "sbt_color0_0", "1", 	 CVAR_ARCHIVE },
;312:	{ &sbt_color0_1,  "sbt_color0_1", "1", 	 CVAR_ARCHIVE },
;313:	{ &sbt_color0_2,  "sbt_color0_2", "1", 	 CVAR_ARCHIVE },
;314:	{ &sbt_color0_3,  "sbt_color0_3", "0.80", CVAR_ARCHIVE },
;315:	{ &sbt_color1_0,  "sbt_color1_0", "0.50", CVAR_ARCHIVE },
;316:	{ &sbt_color1_1,  "sbt_color1_1", "0.50", CVAR_ARCHIVE },
;317:	{ &sbt_color1_2,  "sbt_color1_2", "0.50", CVAR_ARCHIVE },
;318:	{ &sbt_color1_3,  "sbt_color1_3", "0.90", CVAR_ARCHIVE },
;319:	{ &sbt_color2_0,  "sbt_color2_0", "0.30", CVAR_ARCHIVE },
;320:	{ &sbt_color2_1,  "sbt_color2_1", "0.30", CVAR_ARCHIVE },
;321:	{ &sbt_color2_2,  "sbt_color2_2", "0.95", CVAR_ARCHIVE },
;322:	{ &sbt_color2_3,  "sbt_color2_3", "0.90", CVAR_ARCHIVE },
;323:	{ &sbt_color3_0,  "sbt_color3_0", "0", 	 CVAR_ARCHIVE },
;324:	{ &sbt_color3_1,  "sbt_color3_1", "0", 	 CVAR_ARCHIVE },
;325:	{ &sbt_color3_2,  "sbt_color3_2", "0", 	 CVAR_ARCHIVE },
;326:	{ &sbt_color3_3,  "sbt_color3_3", "1", 	 CVAR_ARCHIVE },
;327:	{ &sbt_wallpaper, "sbt_wallpaper", "trans", 	 CVAR_ARCHIVE },
;328:
;329:	{ &ui_scrollbtnsize, "ui_scrollbtnsize", "1", 	 CVAR_ARCHIVE },
;330:
;331:	{ &ui_3dmap, "ui_3dmap", "", CVAR_ARCHIVE },
;332:
;333:	{ &ui_singlemode, "ui_singlemode", "0", CVAR_ARCHIVE },
;334:	{ &ui_loaded, "ui_loaded", "0", 0 },
;335:	{ &legsskin, "legsskin", "beret/default", CVAR_ARCHIVE },
;336:	{ &team_legsskin, "team_legsskin", "beret/default", CVAR_ARCHIVE },
;337:	{ &cl_selectedmod, "cl_selectedmod", "default", CVAR_ARCHIVE },
;338:	{ &cl_language, "cl_language", "0", CVAR_ARCHIVE },
;339:	{ &cl_screenoffset, "cl_screenoffset", "107", CVAR_ARCHIVE },
;340:	{ &ui_backcolors, "ui_backcolors", "1", CVAR_ARCHIVE },
;341:	{ &sensitivitymenu, "sensitivitymenu", "1", CVAR_ARCHIVE },
;342:
;343:	{ &test1, "test1", "0", 0 },
;344:	{ &test2, "test2", "0", 0 },
;345:	{ &test3, "test3", "0", 0 },
;346:	{ &test4, "test4", "0", 0 },
;347:	{ &test5, "test5", "0", 0 },
;348:	{ &test6, "test6", "0", 0 },
;349:	{ &test7, "test7", "0", 0 },
;350:	{ &test8, "test8", "0", 0 },
;351:	{ &test9, "test9", "0", 0 },
;352:
;353:	{ &ui_arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM },
;354:	{ &ui_botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM },
;355:	{ &ui_spScores1, "g_spScores1", "", CVAR_ARCHIVE | CVAR_ROM },
;356:	{ &ui_spScores2, "g_spScores2", "", CVAR_ARCHIVE | CVAR_ROM },
;357:	{ &ui_spScores3, "g_spScores3", "", CVAR_ARCHIVE | CVAR_ROM },
;358:	{ &ui_spScores4, "g_spScores4", "", CVAR_ARCHIVE | CVAR_ROM },
;359:	{ &ui_spScores5, "g_spScores5", "", CVAR_ARCHIVE | CVAR_ROM },
;360:	{ &ui_spAwards, "g_spAwards", "", CVAR_ARCHIVE | CVAR_ROM },
;361:	{ &ui_spVideos, "g_spVideos", "", CVAR_ARCHIVE | CVAR_ROM },
;362:	{ &ui_spSkill, "g_spSkill", "1", 0 },
;363:
;364:	{ &ui_spSelection, "ui_spSelection", "", CVAR_ROM },
;365:
;366:	{ &ui_browserMaster, "ui_browserMaster", "0", CVAR_ARCHIVE },
;367:	{ &ui_browserGameType, "ui_browserGameType", "0", CVAR_ARCHIVE },
;368:	{ &ui_browserSortKey, "ui_browserSortKey", "4", CVAR_ARCHIVE },
;369:	{ &ui_browserShowFull, "ui_browserShowFull", "1", CVAR_ARCHIVE },
;370:	{ &ui_browserShowEmpty, "ui_browserShowEmpty", "1", CVAR_ARCHIVE },
;371:
;372:	{ &ui_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;373:	{ &ui_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;374:	{ &ui_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;375:	{ &ui_marks, "cg_marks", "1", CVAR_ARCHIVE },
;376:
;377:	{ &ui_server1, "server1", "", CVAR_ARCHIVE },
;378:	{ &ui_server2, "server2", "", CVAR_ARCHIVE },
;379:	{ &ui_server3, "server3", "", CVAR_ARCHIVE },
;380:	{ &ui_server4, "server4", "", CVAR_ARCHIVE },
;381:	{ &ui_server5, "server5", "", CVAR_ARCHIVE },
;382:	{ &ui_server6, "server6", "", CVAR_ARCHIVE },
;383:	{ &ui_server7, "server7", "", CVAR_ARCHIVE },
;384:	{ &ui_server8, "server8", "", CVAR_ARCHIVE },
;385:	{ &ui_server9, "server9", "", CVAR_ARCHIVE },
;386:	{ &ui_server10, "server10", "", CVAR_ARCHIVE },
;387:	{ &ui_server11, "server11", "", CVAR_ARCHIVE },
;388:	{ &ui_server12, "server12", "", CVAR_ARCHIVE },
;389:	{ &ui_server13, "server13", "", CVAR_ARCHIVE },
;390:	{ &ui_server14, "server14", "", CVAR_ARCHIVE },
;391:	{ &ui_server15, "server15", "", CVAR_ARCHIVE },
;392:	{ &ui_server16, "server16", "", CVAR_ARCHIVE },
;393:	{ &ui_server17, "server17", "", CVAR_ARCHIVE },
;394:	{ &ui_server18, "server18", "", CVAR_ARCHIVE },
;395:	{ &ui_server19, "server19", "", CVAR_ARCHIVE },
;396:	{ &ui_server20, "server20", "", CVAR_ARCHIVE },
;397:	{ &ui_server21, "server21", "", CVAR_ARCHIVE },
;398:	{ &ui_server22, "server22", "", CVAR_ARCHIVE },
;399:	{ &ui_server23, "server23", "", CVAR_ARCHIVE },
;400:	{ &ui_server24, "server24", "", CVAR_ARCHIVE },
;401:	{ &ui_server25, "server25", "", CVAR_ARCHIVE },
;402:	{ &ui_server26, "server26", "", CVAR_ARCHIVE },
;403:	{ &ui_server27, "server27", "", CVAR_ARCHIVE },
;404:	{ &ui_server28, "server28", "", CVAR_ARCHIVE },
;405:	{ &ui_server29, "server29", "", CVAR_ARCHIVE },
;406:	{ &ui_server30, "server30", "", CVAR_ARCHIVE },
;407:	{ &ui_server31, "server31", "", CVAR_ARCHIVE },
;408:	{ &ui_server32, "server32", "", CVAR_ARCHIVE },
;409:
;410:	{ &ui_cdkeychecked, "ui_cdkeychecked", "0", CVAR_ROM },
;411:
;412:	{ &uie_map_multisel, "uie_map_multisel", "0", CVAR_ROM|CVAR_ARCHIVE },
;413:	{ &uie_map_list, "uie_map_list", "0", CVAR_ROM|CVAR_ARCHIVE },
;414:	{ &uie_bot_multisel, "uie_bot_multisel", "0", CVAR_ROM|CVAR_ARCHIVE },
;415:	{ &uie_bot_list, "uie_bot_list", "0", CVAR_ROM|CVAR_ARCHIVE },
;416:	{ &uie_ingame_dynamicmenu, "uie_ingame_dynamicmenu", "1", CVAR_ROM|CVAR_ARCHIVE },
;417:	{ &uie_animsfx, "uie_s_animsfx", "1", CVAR_ROM|CVAR_ARCHIVE },
;418:	{ &uie_mapicons, "uie_mapicons", "0", CVAR_ROM|CVAR_ARCHIVE },
;419:	{ &uie_autoclosebotmenu, "uie_autoclosebotmenu", "0", CVAR_ROM|CVAR_ARCHIVE },
;420:	{ &uie_olditemmenu, "uie_olditemmenu", "0", CVAR_ARCHIVE },
;421:};
;422:
;423:static int		cvarTableSize = sizeof(cvarTable) / sizeof(cvarTable[0]);
;424:int 	mod_ammolimit = 200;
;425:int 	mod_gravity = 800;
;426:
;427:
;428:/*
;429:=================
;430:UI_RegisterCvars
;431:=================
;432:*/
;433:void UI_RegisterCvars( void ) {
line 437
;434:	int			i;
;435:	cvarTable_t	*cv;
;436:
;437:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $277
JUMPV
LABELV $274
line 438
;438:		trap_Cvar_Register( cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 439
;439:	}
LABELV $275
line 437
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $277
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $274
line 443
;440:
;441:	// we also set default values for the disable_* Cvars here
;442:	// since first usage defines their default value
;443:	UIE_StartServer_RegisterDisableCvars(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UIE_StartServer_RegisterDisableCvars
CALLV
pop
line 444
;444:	trap_Cvar_Set( "cl_sprun", "0" );
ADDRGP4 $159
ARGP4
ADDRGP4 $114
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 445
;445:	if(trap_Cvar_VariableValue("cl_32bit")){
ADDRGP4 $280
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
EQF4 $278
line 449
;446:		//if(trap_Cvar_VariableValue("r_picmip") < 2){
;447:		//	trap_Cvar_Set( "r_picmip", "2" );
;448:		//}
;449:	}
LABELV $278
line 450
;450:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec uiautoexec.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $281
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 451
;451:}
LABELV $273
endproc UI_RegisterCvars 12 16
export UI_UpdateCvars
proc UI_UpdateCvars 8 4
line 458
;452:
;453:/*
;454:=================
;455:UI_UpdateCvars
;456:=================
;457:*/
;458:void UI_UpdateCvars( void ) {
line 462
;459:	int			i;
;460:	cvarTable_t	*cv;
;461:
;462:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $286
JUMPV
LABELV $283
line 463
;463:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 464
;464:	}
LABELV $284
line 462
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $286
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $283
line 465
;465:}
LABELV $282
endproc UI_UpdateCvars 8 4
export UI_IsValidCvar
proc UI_IsValidCvar 8 8
line 475
;466:
;467:
;468:
;469:/*
;470:=================
;471:UI_IsValidCvar
;472:=================
;473:*/
;474:qboolean UI_IsValidCvar(const char* cvar)
;475:{
line 478
;476:	int i;
;477:
;478:	for (i = 0; i < cvarTableSize; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $291
JUMPV
LABELV $288
line 479
;479:	{
line 480
;480:		if (!Q_stricmp(cvar, cvarTable[i].cvarName))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cvarTable+4
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
NEI4 $292
line 481
;481:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $287
JUMPV
LABELV $292
line 482
;482:	}
LABELV $289
line 478
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $291
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $288
line 483
;483:	return qfalse;
CNSTI4 0
RETI4
LABELV $287
endproc UI_IsValidCvar 8 8
export UI_SetDefaultCvar
proc UI_SetDefaultCvar 8 8
line 493
;484:}
;485:
;486:/*
;487:==================
;488: * UI_SetDefaultCvar
;489: * If the cvar is blank it will be set to value
;490: * This is only good for cvars that cannot naturally be blank
;491:==================
;492: */
;493:void UI_SetDefaultCvar(const char* cvar, const char* value) {
line 494
;494:    if(strlen(UI_Cvar_VariableString(cvar)) == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $296
line 495
;495:        trap_Cvar_Set(cvar,value);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $296
line 496
;496:}
LABELV $295
endproc UI_SetDefaultCvar 8 8
bss
export uie_bot_list
align 4
LABELV uie_bot_list
skip 272
export uie_bot_multisel
align 4
LABELV uie_bot_multisel
skip 272
export uie_map_list
align 4
LABELV uie_map_list
skip 272
export uie_map_multisel
align 4
LABELV uie_map_multisel
skip 272
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
export uie_olditemmenu
align 4
LABELV uie_olditemmenu
skip 272
export uie_ingame_dynamicmenu
align 4
LABELV uie_ingame_dynamicmenu
skip 272
export uie_autoclosebotmenu
align 4
LABELV uie_autoclosebotmenu
skip 272
export uie_mapicons
align 4
LABELV uie_mapicons
skip 272
export uie_animsfx
align 4
LABELV uie_animsfx
skip 272
export ui_cdkeychecked
align 4
LABELV ui_cdkeychecked
skip 272
import ui_cdkey
export ui_server32
align 4
LABELV ui_server32
skip 272
export ui_server31
align 4
LABELV ui_server31
skip 272
export ui_server30
align 4
LABELV ui_server30
skip 272
export ui_server29
align 4
LABELV ui_server29
skip 272
export ui_server28
align 4
LABELV ui_server28
skip 272
export ui_server27
align 4
LABELV ui_server27
skip 272
export ui_server26
align 4
LABELV ui_server26
skip 272
export ui_server25
align 4
LABELV ui_server25
skip 272
export ui_server24
align 4
LABELV ui_server24
skip 272
export ui_server23
align 4
LABELV ui_server23
skip 272
export ui_server22
align 4
LABELV ui_server22
skip 272
export ui_server21
align 4
LABELV ui_server21
skip 272
export ui_server20
align 4
LABELV ui_server20
skip 272
export ui_server19
align 4
LABELV ui_server19
skip 272
export ui_server18
align 4
LABELV ui_server18
skip 272
export ui_server17
align 4
LABELV ui_server17
skip 272
export ui_server16
align 4
LABELV ui_server16
skip 272
export ui_server15
align 4
LABELV ui_server15
skip 272
export ui_server14
align 4
LABELV ui_server14
skip 272
export ui_server13
align 4
LABELV ui_server13
skip 272
export ui_server12
align 4
LABELV ui_server12
skip 272
export ui_server11
align 4
LABELV ui_server11
skip 272
export ui_server10
align 4
LABELV ui_server10
skip 272
export ui_server9
align 4
LABELV ui_server9
skip 272
export ui_server8
align 4
LABELV ui_server8
skip 272
export ui_server7
align 4
LABELV ui_server7
skip 272
export ui_server6
align 4
LABELV ui_server6
skip 272
export ui_server5
align 4
LABELV ui_server5
skip 272
export ui_server4
align 4
LABELV ui_server4
skip 272
export ui_server3
align 4
LABELV ui_server3
skip 272
export ui_server2
align 4
LABELV ui_server2
skip 272
export ui_server1
align 4
LABELV ui_server1
skip 272
export ui_marks
align 4
LABELV ui_marks
skip 272
export ui_drawCrosshairNames
align 4
LABELV ui_drawCrosshairNames
skip 272
export ui_drawCrosshair
align 4
LABELV ui_drawCrosshair
skip 272
export ui_brassTime
align 4
LABELV ui_brassTime
skip 272
export ui_browserShowEmpty
align 4
LABELV ui_browserShowEmpty
skip 272
export ui_browserShowFull
align 4
LABELV ui_browserShowFull
skip 272
export ui_browserSortKey
align 4
LABELV ui_browserSortKey
skip 272
export ui_browserGameType
align 4
LABELV ui_browserGameType
skip 272
export ui_browserMaster
align 4
LABELV ui_browserMaster
skip 272
export ui_spSelection
align 4
LABELV ui_spSelection
skip 272
export ui_spSkill
align 4
LABELV ui_spSkill
skip 272
export ui_spVideos
align 4
LABELV ui_spVideos
skip 272
export ui_spAwards
align 4
LABELV ui_spAwards
skip 272
export ui_spScores5
align 4
LABELV ui_spScores5
skip 272
export ui_spScores4
align 4
LABELV ui_spScores4
skip 272
export ui_spScores3
align 4
LABELV ui_spScores3
skip 272
export ui_spScores2
align 4
LABELV ui_spScores2
skip 272
export ui_spScores1
align 4
LABELV ui_spScores1
skip 272
export ui_botsFile
align 4
LABELV ui_botsFile
skip 272
export ui_arenasFile
align 4
LABELV ui_arenasFile
skip 272
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
export ui_backcolors
align 4
LABELV ui_backcolors
skip 272
export cl_screenoffset
align 4
LABELV cl_screenoffset
skip 272
export ui_loaded
align 4
LABELV ui_loaded
skip 272
export cl_language
align 4
LABELV cl_language
skip 272
export cl_selectedmod
align 4
LABELV cl_selectedmod
skip 272
export team_legsskin
align 4
LABELV team_legsskin
skip 272
export sensitivitymenu
align 4
LABELV sensitivitymenu
skip 272
export legsskin
align 4
LABELV legsskin
skip 272
export ui_singlemode
align 4
LABELV ui_singlemode
skip 272
export ui_3dmap
align 4
LABELV ui_3dmap
skip 272
export ui_scrollbtnsize
align 4
LABELV ui_scrollbtnsize
skip 272
export sbt_wallpaper
align 4
LABELV sbt_wallpaper
skip 272
export sbt_color3_3
align 4
LABELV sbt_color3_3
skip 272
export sbt_color3_2
align 4
LABELV sbt_color3_2
skip 272
export sbt_color3_1
align 4
LABELV sbt_color3_1
skip 272
export sbt_color3_0
align 4
LABELV sbt_color3_0
skip 272
export sbt_color2_3
align 4
LABELV sbt_color2_3
skip 272
export sbt_color2_2
align 4
LABELV sbt_color2_2
skip 272
export sbt_color2_1
align 4
LABELV sbt_color2_1
skip 272
export sbt_color2_0
align 4
LABELV sbt_color2_0
skip 272
export sbt_color1_3
align 4
LABELV sbt_color1_3
skip 272
export sbt_color1_2
align 4
LABELV sbt_color1_2
skip 272
export sbt_color1_1
align 4
LABELV sbt_color1_1
skip 272
export sbt_color1_0
align 4
LABELV sbt_color1_0
skip 272
export sbt_color0_3
align 4
LABELV sbt_color0_3
skip 272
export sbt_color0_2
align 4
LABELV sbt_color0_2
skip 272
export sbt_color0_1
align 4
LABELV sbt_color0_1
skip 272
export sbt_color0_0
align 4
LABELV sbt_color0_0
skip 272
export mgui_none
align 4
LABELV mgui_none
skip 272
export mgui_api_active
align 4
LABELV mgui_api_active
skip 272
export cl_sprun
align 4
LABELV cl_sprun
skip 272
export toolgun_disabledarg4
align 4
LABELV toolgun_disabledarg4
skip 272
export toolgun_disabledarg3
align 4
LABELV toolgun_disabledarg3
skip 272
export toolgun_disabledarg2
align 4
LABELV toolgun_disabledarg2
skip 272
export toolgun_disabledarg1
align 4
LABELV toolgun_disabledarg1
skip 272
export toolgun_toolset18
align 4
LABELV toolgun_toolset18
skip 272
export toolgun_toolset17
align 4
LABELV toolgun_toolset17
skip 272
export toolgun_toolset16
align 4
LABELV toolgun_toolset16
skip 272
export toolgun_toolset15
align 4
LABELV toolgun_toolset15
skip 272
export toolgun_toolset14
align 4
LABELV toolgun_toolset14
skip 272
export toolgun_toolset13
align 4
LABELV toolgun_toolset13
skip 272
export toolgun_toolset12
align 4
LABELV toolgun_toolset12
skip 272
export toolgun_toolset11
align 4
LABELV toolgun_toolset11
skip 272
export toolgun_toolset10
align 4
LABELV toolgun_toolset10
skip 272
export toolgun_toolset9
align 4
LABELV toolgun_toolset9
skip 272
export toolgun_toolset8
align 4
LABELV toolgun_toolset8
skip 272
export toolgun_toolset7
align 4
LABELV toolgun_toolset7
skip 272
export toolgun_toolset6
align 4
LABELV toolgun_toolset6
skip 272
export toolgun_toolset5
align 4
LABELV toolgun_toolset5
skip 272
export toolgun_toolset4
align 4
LABELV toolgun_toolset4
skip 272
export toolgun_toolset3
align 4
LABELV toolgun_toolset3
skip 272
export toolgun_toolset2
align 4
LABELV toolgun_toolset2
skip 272
export toolgun_toolset1
align 4
LABELV toolgun_toolset1
skip 272
export tool_modifypreset4
align 4
LABELV tool_modifypreset4
skip 272
export tool_modifypreset3
align 4
LABELV tool_modifypreset3
skip 272
export tool_modifypreset2
align 4
LABELV tool_modifypreset2
skip 272
export tool_modifypreset
align 4
LABELV tool_modifypreset
skip 272
export tool_spawnpreset
align 4
LABELV tool_spawnpreset
skip 272
export spawn_preset
align 4
LABELV spawn_preset
skip 272
export sb_tab
align 4
LABELV sb_tab
skip 272
export sb_texturenum
align 4
LABELV sb_texturenum
skip 272
export sb_classnum
align 4
LABELV sb_classnum
skip 272
export sb_modelnum
align 4
LABELV sb_modelnum
skip 272
export sb_grid
align 4
LABELV sb_grid
skip 272
export sb_texturename
align 4
LABELV sb_texturename
skip 272
export sb_texture
align 4
LABELV sb_texture
skip 272
export sb_private
align 4
LABELV sb_private
skip 272
export test9
align 4
LABELV test9
skip 272
export test8
align 4
LABELV test8
skip 272
export test7
align 4
LABELV test7
skip 272
export test6
align 4
LABELV test6
skip 272
export test5
align 4
LABELV test5
skip 272
export test4
align 4
LABELV test4
skip 272
export test3
align 4
LABELV test3
skip 272
export test2
align 4
LABELV test2
skip 272
export test1
align 4
LABELV test1
skip 272
export cl_giantcharheight
align 4
LABELV cl_giantcharheight
skip 272
export cl_giantcharwidth
align 4
LABELV cl_giantcharwidth
skip 272
export cl_bigcharheight
align 4
LABELV cl_bigcharheight
skip 272
export cl_bigcharwidth
align 4
LABELV cl_bigcharwidth
skip 272
export cl_smallcharheight
align 4
LABELV cl_smallcharheight
skip 272
export cl_smallcharwidth
align 4
LABELV cl_smallcharwidth
skip 272
export cl_propgapwidth
align 4
LABELV cl_propgapwidth
skip 272
export cl_propspacewidth
align 4
LABELV cl_propspacewidth
skip 272
export cl_propheight
align 4
LABELV cl_propheight
skip 272
export cl_propsmallsizescale
align 4
LABELV cl_propsmallsizescale
skip 272
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
LABELV $281
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
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
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $280
byte 1 99
byte 1 108
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $272
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $271
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $270
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
LABELV $269
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 115
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 102
byte 1 120
byte 1 0
align 1
LABELV $268
byte 1 117
byte 1 105
byte 1 101
byte 1 95
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 100
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $267
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
LABELV $266
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
LABELV $265
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
LABELV $264
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
LABELV $263
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $262
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 51
byte 1 50
byte 1 0
align 1
LABELV $261
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 51
byte 1 49
byte 1 0
align 1
LABELV $260
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $259
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 57
byte 1 0
align 1
LABELV $258
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 56
byte 1 0
align 1
LABELV $257
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 55
byte 1 0
align 1
LABELV $256
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 54
byte 1 0
align 1
LABELV $255
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $254
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $253
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 51
byte 1 0
align 1
LABELV $252
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 50
byte 1 0
align 1
LABELV $251
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 49
byte 1 0
align 1
LABELV $250
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $249
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 57
byte 1 0
align 1
LABELV $248
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 56
byte 1 0
align 1
LABELV $247
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 55
byte 1 0
align 1
LABELV $246
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $245
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $244
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $243
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $242
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $241
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $240
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $239
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 57
byte 1 0
align 1
LABELV $238
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 56
byte 1 0
align 1
LABELV $237
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 55
byte 1 0
align 1
LABELV $236
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 54
byte 1 0
align 1
LABELV $235
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 53
byte 1 0
align 1
LABELV $234
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 52
byte 1 0
align 1
LABELV $233
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 51
byte 1 0
align 1
LABELV $232
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $231
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $230
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $229
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $228
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $227
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $226
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $225
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $224
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $223
byte 1 52
byte 1 0
align 1
LABELV $222
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $221
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $220
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $219
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $218
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
LABELV $217
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $216
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $215
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $214
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $213
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $212
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $211
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $210
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $209
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $208
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 57
byte 1 0
align 1
LABELV $207
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 56
byte 1 0
align 1
LABELV $206
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 55
byte 1 0
align 1
LABELV $205
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 54
byte 1 0
align 1
LABELV $204
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 53
byte 1 0
align 1
LABELV $203
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 52
byte 1 0
align 1
LABELV $202
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 51
byte 1 0
align 1
LABELV $201
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 50
byte 1 0
align 1
LABELV $200
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 49
byte 1 0
align 1
LABELV $199
byte 1 115
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $198
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $197
byte 1 49
byte 1 48
byte 1 55
byte 1 0
align 1
LABELV $196
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $195
byte 1 99
byte 1 108
byte 1 95
byte 1 108
byte 1 97
byte 1 110
byte 1 103
byte 1 117
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $194
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $193
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $192
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $191
byte 1 98
byte 1 101
byte 1 114
byte 1 101
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $190
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $189
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $188
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $187
byte 1 0
align 1
LABELV $186
byte 1 117
byte 1 105
byte 1 95
byte 1 51
byte 1 100
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $185
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 116
byte 1 110
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $184
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $183
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 112
byte 1 97
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $182
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 51
byte 1 95
byte 1 51
byte 1 0
align 1
LABELV $181
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 51
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $180
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 51
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $179
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 51
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $178
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 95
byte 1 51
byte 1 0
align 1
LABELV $177
byte 1 48
byte 1 46
byte 1 57
byte 1 53
byte 1 0
align 1
LABELV $176
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $175
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $174
byte 1 48
byte 1 46
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $173
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $172
byte 1 48
byte 1 46
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $171
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 95
byte 1 51
byte 1 0
align 1
LABELV $170
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $169
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $168
byte 1 48
byte 1 46
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $167
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $166
byte 1 48
byte 1 46
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $165
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 48
byte 1 95
byte 1 51
byte 1 0
align 1
LABELV $164
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 48
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $163
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 48
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $162
byte 1 115
byte 1 98
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 48
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $161
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $160
byte 1 109
byte 1 103
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 112
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $159
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $158
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 97
byte 1 114
byte 1 103
byte 1 52
byte 1 0
align 1
LABELV $157
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 97
byte 1 114
byte 1 103
byte 1 51
byte 1 0
align 1
LABELV $156
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 97
byte 1 114
byte 1 103
byte 1 50
byte 1 0
align 1
LABELV $155
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 97
byte 1 114
byte 1 103
byte 1 49
byte 1 0
align 1
LABELV $154
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 49
byte 1 56
byte 1 0
align 1
LABELV $153
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 49
byte 1 55
byte 1 0
align 1
LABELV $152
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $151
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $150
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $149
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $148
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $147
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $146
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $145
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 57
byte 1 0
align 1
LABELV $144
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 56
byte 1 0
align 1
LABELV $143
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 55
byte 1 0
align 1
LABELV $142
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 54
byte 1 0
align 1
LABELV $141
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 53
byte 1 0
align 1
LABELV $140
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 52
byte 1 0
align 1
LABELV $139
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 51
byte 1 0
align 1
LABELV $138
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 50
byte 1 0
align 1
LABELV $137
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 58
byte 1 0
align 1
LABELV $136
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 115
byte 1 101
byte 1 116
byte 1 49
byte 1 0
align 1
LABELV $135
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 52
byte 1 32
byte 1 116
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $134
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 52
byte 1 0
align 1
LABELV $133
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 51
byte 1 32
byte 1 116
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $132
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 51
byte 1 0
align 1
LABELV $131
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 50
byte 1 32
byte 1 116
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $130
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 50
byte 1 0
align 1
LABELV $129
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 116
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $128
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $127
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 115
byte 1 108
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 50
byte 1 53
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 48
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 49
byte 1 32
byte 1 48
byte 1 32
byte 1 34
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 34
byte 1 32
byte 1 45
byte 1 49
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 32
byte 1 49
byte 1 50
byte 1 48
byte 1 32
byte 1 49
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $126
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $125
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 108
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 115
byte 1 108
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 50
byte 1 53
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 48
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 49
byte 1 32
byte 1 48
byte 1 32
byte 1 34
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 34
byte 1 32
byte 1 45
byte 1 49
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 32
byte 1 49
byte 1 50
byte 1 48
byte 1 32
byte 1 49
byte 1 32
byte 1 48
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $124
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $123
byte 1 49
byte 1 0
align 1
LABELV $122
byte 1 115
byte 1 98
byte 1 95
byte 1 116
byte 1 97
byte 1 98
byte 1 0
align 1
LABELV $121
byte 1 115
byte 1 98
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $120
byte 1 115
byte 1 98
byte 1 95
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $119
byte 1 115
byte 1 98
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $118
byte 1 115
byte 1 98
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $117
byte 1 115
byte 1 98
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $116
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $115
byte 1 115
byte 1 98
byte 1 95
byte 1 103
byte 1 114
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $114
byte 1 48
byte 1 0
align 1
LABELV $113
byte 1 115
byte 1 98
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $112
byte 1 51
byte 1 50
byte 1 0
align 1
LABELV $111
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $110
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $109
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $108
byte 1 99
byte 1 108
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 99
byte 1 108
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $106
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $103
byte 1 51
byte 1 0
align 1
LABELV $102
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 103
byte 1 97
byte 1 112
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $101
byte 1 56
byte 1 0
align 1
LABELV $100
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $99
byte 1 50
byte 1 49
byte 1 0
align 1
LABELV $98
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $97
byte 1 48
byte 1 46
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $96
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
